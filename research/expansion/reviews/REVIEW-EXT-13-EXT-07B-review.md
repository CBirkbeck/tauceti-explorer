# Independent review REVIEW-EXT-13-EXT-07B — EXT-07 packets

Reviewer: independent-review-REVIEW-EXT-13-EXT-07B (Claude Code, session cc-2aeb03). Date: 2026-09-24.

## Scope

- **EXT-13.** The job names every packet in `research/expansion/external/EXT-13/`. That directory does not exist on `main`
  (checked at the start of the review), so there was nothing to review there.
- **EXT-07.** The directory holds seven packets. `FaltingsFinitenessAndIsogenyTheorems.json` already carries a `review`
  object with status `accepted` (REVIEW-EXT-10-EXT-07), so it was skipped, as the job says. The other six were reviewed,
  each by its own independent reader, in the order below.

## Method

The method is that of `research/expansion/PROTOCOL.md` and of the earlier review REVIEW-EXT-10-EXT-07:

- Every node's statement, hypotheses, proof steps, acceptance items, locators and excerpts were compared with the cited
  passage of the source.
- Every link was checked for direction, for the place where the consumer uses the supplier's output, and for the existence
  of both endpoints. Before a cross-roadmap link was kept, the supplier stage's description in `data/atlas.json` was read.
- Every `parentStageId` and coverage `stageId` was checked against the atlas. The stage edges implied by the links, together
  with the atlas `stageEdges`, were checked for cycles.

**Sources.** The maintainer's reference library was not available. Every source was re-fetched from the public copy the
packet cites, and its SHA-256 was compared with the packet's record. Formulas, inequalities and exponents were read on page
images. Where a source has no public copy (Silverman's *Arithmetic of Elliptic Curves*), the nodes resting on it alone are
marked unverifiable rather than passed. Nothing was copied into the repository.

**How the corrections are delivered.** The swarm intake accepts only this report for this job, so the reviewed packets
cannot be submitted in place. Appendix A gives, for each packet, the change list that turns the packet on `main` into the
reviewed packet:

- the top-level `review` object, with a verdict for every node;
- the new value of every changed field of every changed node;
- the links added, removed and changed (a link is identified by its `source` and `target`);
- the full new `gaps`, `coverage` and `sources` arrays, and any other changed top-level field.

Applying a change list to the packet on `main` reproduces the reviewed packet exactly; this was checked for all six. Each
packet's own `status` stays `partial`, and every node stays `implementationStatus: unchecked`.

## Summary

| # | Packet | Review | Nodes | Verified | Corrected | Unverifiable | Links after | Gaps after |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | `FiniteFlatGroupsAndIntegralPadicHodgeTheory.json` | accepted | 90 | 22 | 68 | 0 | 166 | 22 |
| 2 | `EffectiveDiophantineMethods.json` | accepted | 26 | 9 | 17 | 0 | 39 | 10 |
| 3 | `HeightsRationalPointsAndObstructions.json` | needs_changes | 59 | 20 | 10 | 29 | 107 | 12 |
| 4 | `InverseGaloisAndArithmeticFundamentalGroups.json` | accepted | 27 | 18 | 9 | 0 | 45 | 8 |
| 5 | `NeronModelsAndSemistableAbelianVarieties.json` | accepted | 24 | 5 | 19 | 0 | 44 | 9 |
| 6 | `tauceti_TauCetiRoadmap_JacobianChallenge.json` | needs_changes | 29 | 20 | 8 | 1 | 56 | 10 |

- **Accepted (4):** FiniteFlatGroupsAndIntegralPadicHodgeTheory, EffectiveDiophantineMethods,
  InverseGaloisAndArithmeticFundamentalGroups and NeronModelsAndSemistableAbelianVarieties.
- **Needs changes (2):**
  - HeightsRationalPointsAndObstructions: 29 nodes, and 48 links, rest only on Silverman's *Arithmetic of Elliptic
    Curves*, which has no public copy.
  - JacobianChallenge: one node rests partly on Silverman III.3.4.

  In both, what remains is a check against the library copy, not a mathematical defect found.

---

## 1. EXT-07/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json (R07.1–R07.6)

**Verdict: accepted.** The packet's own status stays `partial`, and every node stays
`implementationStatus: unchecked`.

| Item | Count |
| --- | --- |
| Nodes | 90: 22 verified, 68 corrected, 0 unverifiable |
| Links | 157 drafted: 128 kept, 24 annotated, 3 modified, 2 removed; 11 added (166 in the packet; a twelfth was an exact duplicate of a kept link and was dropped) |
| Gaps | 20 → 22 (15 existing gaps edited, 2 added) |
| Coverage | 6 stage records (R07.1–R07.6), all `partial`; `remaining` extended for every stage |

Nodes by stage, verified / corrected:

| Stage | Verified / corrected |
| --- | --- |
| R07.1 | 14 / 13 |
| R07.2 | 0 / 2 |
| R07.3 | 4 / 28 |
| R07.4 | 1 / 17 |
| R07.5 | 1 / 0 |
| R07.6 | 2 / 8 |

**Structural checks.**
* Every `parentStageId` and coverage `stageId` is an atlas stage owned by the roadmap.
* Every link endpoint is a packet node or an atlas stage.
* The atlas `stageEdges` plus the packet-implied stage edges contain no cycle, and there is no node cycle.
* The two new cross-roadmap node links refine existing atlas edges: R06.2 → a Liu node, and an FL 7.15 node → PA.1.
* The repository's `merge_decompositions` accepts the packet in memory (dry run; nothing written).

### Sources and provenance

Every source was fetched on 2026-09-24 into the reviewer's scratch directory.

| Source | URL | SHA-256 | Match |
| --- | --- | --- | --- |
| Raynaud, Bull. SMF 102 (1974) | https://www.numdam.org/article/BSMF_1974__102__241_0.pdf | `05cad2f5c2c33a2eea5739d255a8bb7de724e48e38dadb30507adc5e84f2edfe` | identical to packet |
| Fontaine–Laffaille, Ann. ENS 15 (1982) | https://www.numdam.org/article/ASENS_1982_4_15_4_547_0.pdf | `c049a7bff113a45f8bbcffc93118bd2e651e84f8b4a38305f7cb24b34c2011a2` | identical |
| Kisin, Ann. Math. 170 (2009) | https://annals.math.princeton.edu/wp-content/uploads/annals-v170-n3-p03-p.pdf | `076f8bb6ec683633f7742d27504b97f5feaef2ddbae2bc5dc4325eb8386f4ee7` | identical |
| Liu, JTNB 25 (2013), author copy | https://www.math.purdue.edu/~tongliu/pub/2BT.pdf | `0ce78fbc6516df3c6168433ad7d2b0c4d2ab270b26e713eed0abcae9a1fce8b3` | identical |
| Conrad, Compositio 119 (1999), author copy | https://math.stanford.edu/~conrad/papers/gpscheme.pdf | `8da1603103437c18468f67add6f836616da61aa8f5739c74cdd82547054a5189` | identical |
| Fontaine, Invent. Math. 81 (1985) | https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0081/LOG_0033.pdf (GDZ scan) | `be153d2e2159057aeccddef7d1c7bb4e7fbdff1599dde4560c0efb4d55bba3be` | **different copy**, see below |

**Fontaine 1985 copy.** The packet records a Springer PDF (`c10642fb…`). Springer now serves a
JavaScript challenge, so that hash could not be re-verified. The reviewer instead read the
Göttingen (GDZ) digitization of the same printed article. That scan is image-only, and every
locator was checked on its page images. The source entry keeps the drafter's hash and now records
the GDZ provenance.

**How the sources were read.**
* **Page offsets.** Printed page = PDF page + 239 (Raynaud), + 545 (Fontaine–Laffaille),
  + 1082 (Kisin), + 513 (Fontaine GDZ).
* **Raynaud.** All of pp. 243–280 re-read on page images, with a zoom of p. 270.
* **Fontaine–Laffaille.** §§0–9 read on the text layer. Every formula a node uses was checked
  on page images.
* **Kisin.** Read: 1.1–1.2, 2.1.1–2.1.4, 2.2.9–2.2.22 with footnote 2, and 2.4.13–2.4.16.
* **Liu.** The whole author copy.
* **Fontaine 1985.** Read on page images: pp. 515–531 and 537–538.
* **Conrad.** Beyond the drafter's range, the reviewers read pp. 1–17: the proof of Theorem 1.4,
  Steps 1–6, and Corollaries 1.7–1.8. The review also re-read p. 36 (Lemma 4.1).

Nothing was copied into the repository.

### Main corrections

**Raynaud (R07.1, R07.5, R07.6).**
1. **Formula (15)** (p. 251). As printed it needs every χ_j ≠ 1, and it also needs
   χ₁⋯χ_n ≠ 1.
   * By (14) and g(1) = −q, the product for n = 2, χ₂ = χ₁⁻¹ is 1/(q−1)², not q/(q−1)².
   * The hypothesis was added. It is harmless for Prop. 1.3.1.
   * The generators of 1.3 are ε_χ, and (12) is the product rule. The node had e_χ and only
     the p-th power.
   * "Localisé en (p)" means inverting p.
2. **Converse in case (b) of 3.3** (p. 266). It concerns δ′_i (the smaller prolongation), not δ_i.
   For r ≥ 2 the printed choice α_i = π also needs v(δ′_{i−1}) ≤ e−1. Raynaud omits this, and it
   does not affect Prop. 3.3.2(1).
3. **Theorem 3.4.3 excerpt was not literal.** The zoomed image prints the exponents as
   n_i … n_{i+r−1}, the indexing of Theorem 3.4.1. Cor. 3.4.4 relabels them n₁ … n_r. This is a
   relabelling, not the misprint the drafter claimed.
4. **Prop. 3.3.2(3), rank-p step.** "Not étale ⇒ multiplicative" does not follow from Cor. 1.5.2,
   since exponents 0 < n < p−1 exist. It follows from formula (4) with r = 1, which gives
   v(δ) ∈ (p−1)ℤ.
   * The proof step and the corresponding link reason were rewritten.
   * The simplicity used is that of 𝒢⁺ ⊗ k.
5. **Implicit hypothesis in 3.3.** The uses of Cor. 1.5.1 there need R to be a D-algebra. This
   holds after strict henselization, which preserves e; the descent back is unwritten. The
   hypothesis is now explicit in the 3.3 nodes.
6. **Theorem 4.1.1** (e ≤ p−1, p. 272). Its devissage needs the absolute different to be
   multiplicative in short exact sequences.
   * Raynaud neither states nor proves this. The appendix proves only 𝔇(G)𝔇(G′) = (rank).
   * Remark 4.1.2 ("on peut le déduire" from Thm 4.2.1) is not deduced. It needs v(𝔇(X[p])) = ed.
   * Both are in a new gap. The Thm 4.2.1 acceptance item no longer presents Remark 4.1.2 as
     proved.
7. **Smaller fixes.**
   * The idempotents are i_χ.
   * Sections 2–4 assume residue characteristic p.
   * Two unusable acceptance examples were replaced. There is no "diagonal" generic subgroup of
     μ_p × ℤ/p over ℚ_p for odd p; the Z_p "μ_p versus ℤ/p" comparison is vacuous for odd p.
   * Typo "K a separable closure of K".
   * The appendix hypothesis was rewritten. The lci property of G′ rests on an unreferenced
     embedding into a smooth group, and Lemma 5 cites SGA 2 p. 404.

**Fontaine–Laffaille (R07.3).**
1. **Frobenius compatibility was reversed.** Diagram (1) of 1.2 (p. 554) and 0.4 give
   φ^i(x) = π·φ^{i+1}(x) for x ∈ M^{i+1}.
2. **Notation.** The source writes M̄ (the limit of 1.4(b)) and S̃ (S mod π). The coefficient
   ring of T̃ is Ā^∨/πĀ^∨ (Ā twisted by τ, 5.8).
   * The draft's "A^τ/πA^τ" is O/π in the packet's own notation, a wrong ring.
   * Excerpts claimed as literal were fixed.
3. **Joint length/Ext statement (3.10).** It is proved for k algebraically closed. 3.11 transfers
   only the Hom part to perfect k.
4. **6.4 and 6.12.** The 6.4 argument lives among π-killed objects. In the second method of 6.12,
   S″ ⊂ W_K(R) with m ≥ 0.
5. **§7.**
   * U_S(M_n) = Hom(M_n, S_n).
   * (fd)₃ reads Σ Im φ^i = M_τ.
   * The 7.15(ii) excerpt concerns the lattice category MF^{fd,q}_{K/O}, not MF^{f,q}_{K/E}.
6. **§8.** Prop. 8.12(i) is stated only for filtrations in [0, q−1]. In 8.8 the summand
   (εD_K)^i had lost its exponent.
7. **§9.** 9.13 cites "9.7" for 9.6. The length identity in 9.13 uses an unstated
   Dieudonné-theory fact. FL 9.6 has no p = 2 condition, but Conrad's written proof (Cor. 1.8)
   needs p odd or J unipotent.
8. **Coefficients.** In FL, E ⊂ K with K = E·K₀.
   * Over an unramified base this forces O = W(F_q), τ = σ^r and weights along one embedding only.
   * The FL modules with an arbitrary coefficient ring over W(k) that L7 and PA.1 use are not in
     the paper (new gap).
   * Gap 9 was corrected: e = 1 means E unramified, not only E = ℚ_p.
9. **Printed slips recorded.**
   * 6.5 "théorème 4.3" should be 3.3.
   * 5.13 "racine q^h-ième" should be a (q^h−1)-th root.
   * 5.9 "lemme 5.5" should be 5.7.

**Kisin and Liu (R07.4).**
1. **Étale and multiplicative were swapped** in four acceptance items. Kisin 1.1.15–1.1.16: if
   1⊗φ is an isomorphism, Gr_D is multiplicative; if its image is E(u)𝔐, Gr_D is étale.
2. **Notation and excerpts.**
   * Kisin writes Gr_D and Mod_D.
   * The Prop. 1.1.13 excerpt is now literal.
   * Liu Lemma 2.2.3(2) is over Fraktur 𝔖, not over ℳ.
3. **Proof steps.** In Kisin 1.1.11 the Tor vanishing is for the quotient M″. In 1.2.11 the
   u-divisibility criterion holds on M^m.
4. **Liu's Theorem 1.0.1 is contravariant** through T_S. A derived rank-one check shows that
   Kisin's and Liu's conventions differ by Cartier duality (gap 15 rewritten).
5. **Unnamed Liu imports added:** Liu 2010 §3.2, the anti-equivalence of Prop. 2.2.2 (cited, not
   proved) and an identity in Lemma 3.2.2.
6. **Dyadic torsion.** No source read classifies finite flat group schemes at p = 2 (coverage).

**Fontaine 1985 (R07.6).**
1. **Proof of 1.5(ii)** (p. 520). The print reads e·ψ̃(m) = e·u_{L/K} − d⁻¹ with
   "e·u_{L/K} ∈ ℤ"; the correct reading is e·i_{L/K} − 1/d. The reviewer checked this
   independently: φ̃ has slope d = #G_(i) just below i_{L/K}. The draft had copied the misprint.
2. **Notation.** The draft used φ for both Fontaine's φ̃ and Serre's φ; φ̃/ψ̃ are now used as
   printed.
3. **Prop. 1.7.** Its uniqueness is now stated as printed (unique modulo aI^[n+1]). Two printed
   slips on p. 522 are recorded.
4. **Theorem 1.** The reduction to an algebraically closed residue field is only "clair".
   * It needs Serre Ch. IV invariance facts beyond finite residue fields.
   * The Serre citations are by page only, and the draft's chapter grouping was not in the
     source.

**R07.2.**
* FL 9.1 defines covectors over any k-algebra with condition (ψ).
* Conrad cites Ch. II Prop. 2.3.
* Conrad's printed Teichmüller action leaves a₀ unscaled; flagged, not fixed.
* The F/V-bijectivity outcomes asserted for the CR.7 check are in neither source; they are now
  flagged.

**Confirmed drafter findings.**
* **Raynaud.** Corollaries 3.3.6–3.3.7 have no written proof (image of p. 268). Cor. 3.3.7 has
  e ≤ p−1, and Thm 4.1.1 has e ≤ p−1.
* **Conrad.** The account of what Conrad proves and what he cites from Raynaud is accurate: Cor. 1.6
  proves it for e = 1, and Lemma 4.1 cites Raynaud for e < p−1.
* **Fontaine–Laffaille.**
  * FL is not restricted to e = 1.
  * The §0.9 endpoint collision is as drafted.
  * Full faithfulness is proved only on MF′; on MF″ it is only indicated.
  * [0, q−2] ⊂ MF′ is derived.
  * The p = 2 interval [0, 0] holds only when q = 2.
* **Kisin.** Kisin §1 assumes p ≠ 2 and k finite.
* **Fontaine 1985.** The convention G^(u) = G^{u−1} and the cutoff u > e(n + 1/(p−1)) are confirmed;
  the Barsotti–Tate embedding is not needed when e = n = 1.

### Links

**Modified (3).**
* **Bounds (2), (2′) of 3.3.** Re-pointed from the Cor. 1.5.2 node to the Prop. 1.3.1 node: the
  bounds use v(w) = e.
* **Thm 3.4.3.** Re-pointed from the 3.3.2(1) node to the 3.3.1 node: the proof uses that 𝒢⁺
  carries the F-structure.
* **Fontaine 1.5 → 1.7(ii).** Locator extended to p. 523.

**Removed (2).**
* **Breuil anti-equivalence → Kisin Cor. 2.2.22.** 2.2.22 imports [Br3, 4.2.2.9] and Cartier
  duality, not 1.1.3 or 1.1.7.
* **FL 6.1 restricted category → finite flat groups over W(k).** 9.11 defines MF_tor^{f,2′}
  directly; the link rested on shared vocabulary only.

**Annotated (24), among them:**
* the rank-p step of 3.3.2(3);
* Cor. 3.3.7 candidate routes;
* the unwritten parts of the 4.1.1 devissage;
* the Example's "Proposition 3.2.2" typo (for 3.3.2);
* FL notation and printed slips;
* the L7 and PA.1 coefficient caveats;
* Kisin notation and the 1.2.2 dependency;
* 2.4.13–2.4.16, which formulate a conjecture;
* R25.1: the use site is p. 531, and §3 does not use the cutoff.

**Added (12).**

| Group | Links |
| --- | --- |
| Raynaud | 3.3.2(3) → Example (p = 2); closure → Example (a) |
| Fontaine–Laffaille | simple objects → endpoint collision; U_S → evaluation map; 7.17 → 8.12; ring S → points of J; 7.15(ii) → PA.1 |
| Kisin/Liu | coefficient lemmas → Cor. 2.2.22; λ/ι → Liu Thm 1.0.1; closure → Liu Thm 2.2.1; R06.2 → Liu ι |
| Fontaine 1985 | numbering → Cor. 1.8 |

**Cross-roadmap links checked against atlas descriptions.**
* **R06.2 → Thm 8.4.** Kept with the caveat that R06.2 names D_cris, not Fontaine's B/B⁺_a.
* **R06.4, L7, PA.1.** Kept; the L7 and PA.1 links carry the coefficient caveat.
* **R08.4.** Kept. 2.1.2–2.1.4 are adequate; the 2.4 link supplies only the étale/multiplicative
  decomposition.
* **R25.1.** Both links kept and annotated.
* **Not linked.** No link to R08.3, AI.7, CP.5 or CR.7: no passage read supports one.

### Unverifiable items

None among node claims. The recorded Springer hash of Fontaine 1985 is unverified; the
content was verified on the GDZ scan.

The following imports remain unread and are recorded in gaps:
* Tate 1967;
* Serre 1972;
* SGA 2 and SGA 3 citations;
* Hartshorne RD;
* Laffaille 1980;
* Fontaine [F1], [F2], [F3], [F4] and Astérisque 47–48;
* Breuil [Br1]–[Br5];
* Fontaine's Festschrift paper;
* BCDT;
* Kisin 2006 and 2009a;
* Liu 2007/08/10;
* Demazure;
* BBM and Illusie;
* Serre, *Corps locaux*;
* Jacobson.

### Gaps added

1. **Unwritten steps in Raynaud §4:** multiplicativity of the absolute different, and the
   deduction of Remark 4.1.2.
2. **FL modules with an arbitrary coefficient ring over W(k)**, as consumed by L7 and PA.1.

The following existing gaps were extended:
* the R09.3 scope reading: descent only, no Cartier duality or fppf quotients;
* the Tate-shift route: Remark 6.13(b) is itself only asserted;
* the Conrad Theorem 1.4 proof, now read, which rests on Astérisque 47–48;
* the Breuil bibliography identified;
* the Kisin/Liu convention;
* the dyadic torsion case;
* the Fontaine 1985 imports, including the unargued reduction to algebraically closed k.

### Questions for the orchestrator

1. **Faltings link.** Restore the link from `R07.1/determinant-of-the-generic-fibre-by-the-tame-different-character`
   to `FaltingsFinitenessAndIsogenyTheorems:R28.5/determinant-character-of-the-kernel-computed-by-raynaud`,
   removed in REVIEW-EXT-10-EXT-07. The supplier node is now reviewed, with hypotheses R
   strictly henselian, e ≤ p−1 and killed by p. Two cautions: its devissage carries the new
   different-multiplicativity gap, and the link must be added in the Faltings packet, whose
   sources include Faltings 1983.
2. **EXT-10 duplicate Raynaud node.** Replace `AlgebraicModularFormsAndSerreWeights:R15.4/raynaud-prolongation-…`
   with links from the reviewed R07.1 nodes, as the HANDOFF proposes. The ownership of Edixhoven
   Prop. 8.2 (R07.5 or R15.4) is still open.
3. **R09.3 scope.** It supplies only descent of finite flat groups. Cartier duality,
   connected–étale sequences and fppf quotients have no owner.
4. **Herbrand functions and upper numbering** over perfect, not only finite, residue fields.
   Fontaine §1 needs them, but LocalFieldsRamification Layer 3 is scoped to finite residue fields.
   The "translation to R01" required by R07.6 has no owner (R01.2 does not mention upper numbering).
5. **FL modules with arbitrary coefficients.** Which stage and source own them? A candidate,
   unchecked, is Clozel–Harris–Taylor 2008 §2.4.1. Should Astérisque 47–48 be acquired?
6. **R07.4 export convention.** Choose between Kisin's covariant Gr_D and Liu's contravariant T_S,
   and decide whether the Cartier-duality comparison gets its own node. Decide whether R07.4 or
   R08.4 owns Kisin's unread moduli sections (1.3, 2.1.5ff, 2.3, 2.5).
7. **Tate shift.** Which of R07.3 and R06.4 owns it? Remark 6.13(b) must be proved first.

---

## 2. EXT-07/EffectiveDiophantineMethods.json (ED.0–ED.6)

**Verdict: accepted.**

| Item | Count |
| --- | --- |
| Nodes | 26: 9 verified, 17 corrected, 0 unverifiable |
| Links | 38 drafted: 30 kept (1 gained a second source locator), 8 annotated, 0 removed; 1 added (39 in the packet) |
| Gaps | 7 → 10 |
| Coverage | 7 stage records (ED.0–ED.6, every atlas stage of the roadmap), all `partial`; each `remaining` list extended |

All endpoints exist. With the atlas `stageEdges` there is no node or stage cycle. The only new implied stage
edge is ED.0 → ED.6 (BDMTV Lemma 4.7 → Algorithm 3.12), and it is already transitive in the atlas. The
packet also passes a dry run of the repository merge validator, with the promoted packets loaded.

### Sources and provenance

All four sources are public copies. They were re-fetched on 2026-09-24, and each SHA-256 matches the packet:

| Source | URL fetched | SHA-256 |
| --- | --- | --- |
| McCallum–Poonen, *The method of Chabauty and Coleman* (author copy, 14 June 2010) | https://math.mit.edu/~poonen/papers/chabauty.pdf | `fb8d1a58…` |
| Bruin–Stoll, *The Mordell–Weil sieve* (arXiv:0906.1934v2) | https://arxiv.org/pdf/0906.1934v2 | `33f88cbd…` |
| Tzanakis–de Weger, *On the practical solution of the Thue equation*, JNT 31 (1989) (Twente scan) | https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf | `2eff85fb…` |
| Balakrishnan–Dogra–Müller–Tuitman–Vonk, *Quadratic Chabauty for modular curves* (arXiv:2101.01862v4) | https://arxiv.org/pdf/2101.01862v4 | `738f0ec0…` |

**How the sources were read.**

* **Tzanakis–de Weger.** The OCR layer is unusable for formulas. Printed pp. 99–116 and the references
  (pp. 131–132) were read on page images. Zooms were used for Lemma 1.1, Lemma 1.2, the bound on a₀, (3.1)
  and Propositions 3.1–3.2.
* **McCallum–Poonen.** All 17 pages were read. Theorem 5.3 and Remark 6.1 were also checked on page images.
* **Bruin–Stoll.** pp. 1–22 and the references were read; Lemma 4.1 was also checked on its page image.
* **BDMTV.** pp. 1–17 and 23–25 were read, plus §4.2.2 on p. 22, which gives (4.21) and the definitions of
  φ(i) and dᵢ(η). Proposition 4.1 and Lemmas 4.2–4.4 were not checked.

### Main source corrections

1. **Tzanakis–de Weger, Lemma 1.2.** The constant is **Y₂\*** = max(Y₁, ⌈(2C₁C₃/C₂)^{1/n}⌉). The packet had
   renamed it Y₁\* in the statement, the excerpt and Lemma 2.2's Y₂′.
   * The brackets in Y₀ and Y₁ (Lemma 1.1) are **ceilings**.
2. **Tzanakis–de Weger, Lemma 2.1.**
   * The printed hypothesis is |Y| > max(Y₁, 2|m|^{1/n}, μ₊/C₂), and the conclusion A < C₅ log(C₄|Y|) is
     strict. The packet had |Y| > Y₁ and ≤.
   * **Orientation of U_I.** The source says "i indicates a row and l a column", but (2.1), v = U_I·a, and the
     row-sum norm N[U_I⁻¹] only fit the transposed orientation. C₅ must be computed with rows indexed by
     conjugates.
   * The invertibility of U_I is implicit in the source.
3. **Tzanakis–de Weger, bound on a₀.** Lemma 2.3's bound is |a₀| < ½ + ½·r·A + 0.51/2π < r·A for A ≥ 2. The
   packet's version was garbled.
4. **Tzanakis–de Weger, §II.3.**
   * (3.1) has A **<** K₃, not ≤.
   * The hypothesis of Proposition 3.2 is printed with **≥**, not >.
   * The proof of Proposition 3.2 prints "|Λ| **>** K₁exp(−K₂A) has no solution", with X₀ ≥ 2. The '>' must
     be read as '<'.
   * The bracket [·] is not defined on the pages read. The proof only needs |[c₀μᵢ] − c₀μᵢ| ≤ 1.
5. **Tzanakis–de Weger, four-class certificate.** The drafted route to Y₃ ("with A ≤ C₅log(C₄|Y|) and
   Lemma 2.1") goes the wrong way: Lemma 2.1 bounds A in terms of |Y|.
   * The source only says Y₃ "can be derived easily". Neither Y₃ nor Y₂ can be obtained without an upper bound
     for |Y| in terms of A, which the source never writes. This is now a new gap.
   * In the complex case, a₀ enters the reduction parameters K₂ and K₃.
6. **McCallum–Poonen, Remark 6.1.**
   * The remark is stated for Flynn's method; Remark 2.2 refers to it for the Chabauty–Coleman method.
   * It prints "G/**p**G → B" for G/ℓG.
   * The drafted "unwritten deduction" of the index test needs **J(Q)[ℓ] ⊆ G**. Counterexample without it:
     J(Q) = ℤ × ℤ/ℓ and G = ℤ × 0.
   * For Coleman's annihilating differential, any finite-index subgroup suffices.
7. **McCallum–Poonen, Theorem 4.4.** Theorem 5.3 and Theorem A.5 bound #X(Q) only for p > 2g (or for residue
   classes with m < p − 2). They never prove Theorem 4.4's finiteness of X(Q_p) ∩ J̄(Q). The proof steps and
   the acceptance were qualified accordingly.
   * Appendix A: the Liu citations were completed (Definition 6.3.7).
   * The last step of Lemma A.4 was attributed correctly: V·X_s = 0 comes from Liu 9.1.21(a) and
     K·X_s = 2g − 2 from Liu 9.1.35. The draft had called this "adjunction".
8. **Bruin–Stoll.**
   * Definition 3.1 "generalizes" A(S, N). A(NΓ) is contained in A(S, N) and need not equal it; both sets are
     sound.
   * **Lemma 4.1.** The proof bounds the Kummer form by e^{H′+γ}max{|a|,|b|}². With h = log max|k_j|, the
     triangle inequality gives 3e^{H′+γ}max{|a|,|b|}². This is recorded as a hypothesis caution and a gap.
   * The Kummer-surface facts used in Lemma 4.1 are imported without proof.
9. **BDMTV, Lemma 4.7.** The printed hypothesis max{i : ord_p(Fᵢ) + i = n} < m is weaker than the proof uses:
   the proof needs ord_p(Fᵢ) + i ≥ n for all i > m.
   * **c₁ bookkeeping in §4.4.** Lemma 4.5 omits c₁, and "φ(i) = −2⌊log_p i⌋ + c₁" contradicts (4.21).
     Proposition 4.6 is consistent with the bound φ(i) + c₁ on λ_φ.
   * The definitions of φ(i) (4.21) and of i₀ were added to the Proposition 4.6 node.
10. **Smaller fixes.**
    * Remark 3.14 needs "J(Q) Zariski dense" for Waldschmidt's conjecture.
    * Remark 8.3 offers three ways to fix constants of integration. Coleman's theory is not "needed only" for
        this.
    * The staged sieve lift is implicit in PrepareLift, not stated there.
    * [32] is de Weger's Leiden thesis of 1987, which the source says is "to appear as a CWI Tract" (1988).
        The draft's "CWI Tract 65, 1989" is not in the source.
    * [29] is printed as "On the practical solution of the Thue–Mahler equation, in preparation".

### Link changes

* **Annotated (8):**
  * Proposition 3.2 does not use (3.2); it shares the reduced basis and imports de Weger's Lemma 3.5.
  * DT.3: the promoted DT.3 node gives Matveev's explicit constant only for *rational* a_j, and Baker 1975
    with an unspecified constant. No current supplier exports the explicit bound for algebraic units that
    Tzanakis–de Weger import (Waldschmidt 1980).
  * The K parameters in the complex case.
  * ED.3 → ED.4: Coleman needs only a finite-index subgroup.
  * RP.1 supplies Selmer groups; the rank algorithm belongs to ED.3 and is unread.
  * Height separation supports termination, not soundness.
  * The Kummer test is an optional genus-2 route.
  * The Mordell–Weil sieve runs after Algorithm 3.12, not inside it.
* **Added (1):** Lemma 1.2 → Lemma 2.4 (Λ ≠ 0 is taken from the proof of Lemma 1.2).
* **Supplier scopes.** DT.3, GN.5, ColemanIntegration L1, SF.3, RP.1 and NC.5 were read in the atlas. Each
  stated scope covers its use; the DT.3 caveat above concerns its decomposition, not its stage text.

### Unverifiable items

None among node statements. The following imports remain unread and are recorded in the gaps:

* LLL (1.11) and de Weger's thesis, Lemmas 3.5–3.7;
* Waldschmidt 1980 (Appendix II) and Pethő–de Weger, Lemma 2.3;
* Hardy–Wright, Theorem 184;
* Chabauty 1941, Coleman 1985, Milne, Bourbaki III.7.6, BLR90, Koblitz IV.4 and Liu;
* Stoll [St1, St3, St4, St5], Cassels–Flynn Ch. 3, and Bruin–Stoll §§5–8;
* BD18, BDM+19, BD19, Kim–Tamagawa, Nekovář and Tuitman;
* BDMTV Proposition 4.1 and Lemmas 4.2–4.4;
* the Tzanakis–de Weger Section III worked example.

### Questions for the orchestrator

1. **DT.3 export.** The promoted DT.3 decomposition gives Matveev only for rational a_j. Should DT.3 be extended
   to an explicit bound for algebraic logarithms (Waldschmidt 1980, or Matveev's general form), or should ED.2
   import one directly? Until then, the DT.3 → ED.2 edge is stage-level only.
2. **Printed slips in source statements.** Four were found: the U_I orientation, the Lemma 4.7 hypothesis, the
   Lemma 4.1 constant and the c₁ in Lemma 4.5. Each is recorded as a caution in the node and in a gap, not
   repaired in the statement. Confirm this convention, or ask for the published versions (JNT 1989 is the
   scan read; for Bruin–Stoll and BDMTV, the published LMS J. Comput. Math. and journal versions) to be
   checked for errata.
3. **ED.3 scope.** The only ED.3 node is the saturation/index test. Descent, rank certification and saturation
   bounds have no source yet. A source such as Stoll's 2-descent (Acta Arith. 98, 2001) should be queued for
   ED.3.

---

## 3. EXT-07/HeightsRationalPointsAndObstructions.json (RP.0–RP.6)

**Verdict: needs changes.**

Everything that rests on Poonen, Faltings, Zhang, Ullmo or Szpiro–Ullmo–Zhang was verified or corrected. The 29 nodes that rest only on Silverman, *The Arithmetic of Elliptic Curves*, cannot be verified: the library copy was not available, and there is no authorized public copy.

| Item | Count |
| --- | --- |
| Nodes | 59: 20 verified, 10 corrected, 29 unverifiable |
| Unverifiable nodes by stage | all 9 RP.0 nodes; 13 of the 18 RP.1 nodes; 5 of the 7 RP.4 nodes; 2 of the 4 RP.6 nodes (their genus-1 and Silverman-conjecture parts) |
| Links | 107 drafted: 46 verified unchanged; 48 kept but unverifiable because their locators are in Silverman; 10 annotated; 2 re-targeted; 1 removed; 1 added. Result: 107 in the packet |
| Gaps | 11 → 12 (1 new, 6 extended) |
| Coverage | 7 stage records, all `partial`; `remaining` extended in each |

**Structural checks.**

* Every `parentStageId` and coverage `stageId` is an RP stage owned by the roadmap.
* Every link endpoint exists. This includes the two sibling Faltings nodes, `R28.1/hermite-minkowski-…` and `R28.5/finiteness-of-curves-…`.
* The links project to 13 stage edges that are not in `stageEdges`. Each is acyclic with the atlas and already implied transitively.
* An in-memory `merge_decompositions` dry run, together with the Faltings packet and placeholder reviews, passes with no deferred links.

### Sources and provenance

All sources were fetched on 2026-09-24.

| Source | URL | SHA-256 | Status |
| --- | --- | --- | --- |
| Poonen, *Rational points on varieties* (author PDF) | https://math.mit.edu/~poonen/papers/Qpoints.pdf | `42e92ce4599420f6b72139e78cb9f5230e4bf81258c202e7cee4716887353579` | matches the packet |
| Zhang, Annals 147 (1998) (JSTOR scan) | https://web.math.princeton.edu/~shouwu/publications/bogomolov.pdf | `023ecdf2d096aa340a646201ad765b29dcf3092710d8aca03fce11910931bfe2` | matches |
| Ullmo, arXiv:alg-geom/9606017v1 | https://arxiv.org/pdf/alg-geom/9606017v1 | `d273b998899882134cb1e3eff3bc1950d3e08c7ad5767f667cb9c226b604acf8` | matches |
| Szpiro–Ullmo–Zhang, Invent. 127 (1997) | https://web.math.princeton.edu/~shouwu/publications/SUZ.pdf | `1cf79d5c3216c47a884a028ac43746863cb21fdb7a3bd0d3918ee6f06e7b14ca` | matches; the file is typeset with a text layer (Distiller, 2 Jan 1997), not a scan as the packet said |
| Faltings, Invent. 73 (1983), GDZ digitization | https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf | `f72a869f4a050e6e4a435cc790f4ac2e47b61fcac35d564041b5f43d89c2f87a` | public substitute for the library file `0b7fb3e5…`; read on page images |
| Silverman, AEC errata list (2022, for the 2015 printing) | https://www.math.brown.edu/johsilve/AEC/AECErrata.pdf | `6c2274403a32af5d4b075c1504a1aaa04c9b304c0f94b8dd337f9c72d51f6f34` | added as source `silverman-aec-errata-2022` |
| Silverman, AEC preface and table of contents | https://www.math.brown.edu/johsilve/AEC/AECPrefaceTOCIntro.pdf | `86a784ef135191371d665e033d2ca065c86b168b52783a42b0228d56e39a85f4` | confirms the section start pages cited in the locators |
| Silverman, AEC, 2nd ed. (2009) | https://doi.org/10.1007/978-0-387-09494-6 | — | **not re-read** |

**Reading beyond the drafter's ranges:**

* **Poonen:**
  * Exercise 4.5 (p. 113);
  * Warnings 5.12.25–5.12.27;
  * §§6.5.5–6.5.6;
  * Exercises 8.1–8.7 in full;
  * Conjecture 9.2.27 (p. 267).
* **Faltings:** p. 366, the reference [9] = Parshin 1968 and the *Zusatz bei der Korrektur*.
* **Zhang, Szpiro–Ullmo–Zhang, Ullmo:** read in full.

### Main corrections

1. **Silverman errata applied to nodes.** Entries for pp. 216, 219, 225, 232, 238, 275, 311–313, 317, 334 and 336–338 were added to the affected nodes.
   * **Lemma VIII.6.3.** The drafted step `h_f = h_x ∘ r` repeated the printed misprint. The corrected chain is `h_f = h∘r∘x = ((deg r)h + O(1))∘x`.
   * **Example VIII.5.1** prints (2C+1)^N. The node had silently used the corrected (2C+1)^{N+1}; it now says so.
   * **Acceptance example for VIII.5.6.** The lower bound for [X₀², X₀X₁] fails at points of large height, not "near the base point".
2. **Poonen, Example 6.5.12.** The difference is an abbreviation, not a misprint. Z ×^G T with T a right torsor means Z ×^G T^{-1} (6.5.6.2–6.5.6.3). The Theorem 8.4.1 statement now uses T^{-1}. HANDOFF correction 2 should be softened accordingly.
3. **Theorem 6.5.13.** Four further imports were added: Remark 6.5.2, Theorem 4.3.7(i), Proposition 3.5.35 and Theorem 3.5.52.
4. **Section 8.2.6 (day and night).** The node said the source "asserts" that finitely many Azumaya algebras suffice. Poonen only cites [Poo06, Remark 5.3]. The compactness argument is now labelled as the reviewer's.
5. **Exercise 8.7** is posed only over number fields, while §8.4.7 states the twist description and closedness over global fields.
6. **The §8.3 example** has three further unproved assertions:
   * the birational models 32A2 and 64A1;
   * the torsion subgroups;
   * computability of the set of twists.
7. **Faltings Satz 7** says only "glatte Kurve"; the properness it uses is implicit. The Parshin node was verified on the GDZ page image: m > 2 at 300 dpi, g ≧ 2, bad places (a)–(c). Korollar 1 is used there without being named.
8. **Szpiro–Ullmo–Zhang.**
   * Proposition 2.1 needs *every subsequence* to be Zariski dense, not just the sequence.
   * The §4 good-reduction imports were added: [17] Theorem 5-2 with the density of torsion points, and Moret-Bailly Proposition 3-6.
9. **Zhang 1998.**
   * **Successive minima.** The definition is printed with dim Y = i for i = 1, …, d. At i = d this gives Y = X and an infimum over the empty set, so the indexing is degenerate. The correct form must come from Zhang 1995 (JAG), which is unread.
   * **Second slip.** The proof prints "By Lemma 3.1" where the generic subsequence comes from Lemma 4.1 (p. 164, zoomed).
   * **Unargued steps in the Bogomolov proof:**
     * Zariski density of x(n);
     * smallness of x(n_i) and of α_m(x(n_i));
     * the embedding hypothesis of Theorem 2.1 for X^m and α_m(X^m);
     * that dx ≠ 0 at smooth points.
10. **Ullmo.** Three imports were missing:
    * Zhang 1993, Corollaire 5-7;
    * Zhang, JAMS 1995, Théorème 5-2, used twice in the proof of Théorème 2.4;
    * Milne, *Jacobian varieties*, Lemma 5-2 and Chapter 5.
11. **Frontier register.** Poonen Conjecture 9.2.27 (Colliot-Thélène, rationally connected varieties) was read and added as item (7). The RP.6 gap had described it wrongly as concerning "a class of surfaces".

### Links

**Annotated (10):**

* **SF.2 supply.** Three links are marked as partial or requested supply:
  * SF.2 → torsor evaluation, where torsor representability is R09.3's effective descent;
  * SF.2 → Brauer–Manin pairing;
  * SF.2 → PGL descent.

  SF.2's stated scope is sites and cohomology. It names neither Brauer groups, nor Corollaries 6.6.11 and 6.9.3, nor 6.6.19.
* **Torsor evaluation → descent sets.** The twist description is Exercise 8.7, not a use of Theorem 8.4.1.
* **Torsor evaluation → §8.3 example.** The example is argued directly, before §8.4.
* **Silverman X.4 → §8.3 example.** Poonen cites "a 2-descent" but does not perform it.
* **Korollar 1 → Satz 7.** The use of Korollar 1 is implicit.
* **DT.2 → S-unit node.** DT.2 is the owner of record of the S-unit statement. It is not an input of the node's Roth-based proof.
* **SUZ → Zhang Theorem 2.1.** The proof method is reused; no conclusion of SUZ is used.
* **Lemma 4.1 → Bogomolov.** Notes the printed slip.

**Re-targeted (2):** the links from the elliptic-curve canonical-height node to the Zhang node and to the Ullmo node now start at the RP.0 stage.

* **Why.** That node covers elliptic curves only (Silverman VIII.9). RP.0's scope names Néron–Tate heights on abelian varieties, but no RP.0 node supplies them.
* **Status.** The first gap records this.

**Removed (1):** Parshin → function-field analogue. Poonen only contrasts the two theorems; Theorem 9.5.10 is proved by citations to Grauert, Samuel and Voloch.

**Added (1):** AbelianSchemesAndArithmeticModuli A6 → Zhang Corollaries. Corollary 2 applies Corollary 1 to Res_{K/Q} A, which needs A6's Weil-restriction theorem.

**Supplier descriptions read.** Before a supplier link was kept, the reviewer read the atlas description of the supplier stage:

* LI.4, SF.2, SF.3, SF.5;
* A3, A6;
* R09.3;
* DT.1, DT.2, and the promoted DT packet;
* R28.1, R28.5;
* R35.1;
* R02.6.

### Unverifiable items

* **Silverman nodes.** The 29 Silverman-based nodes, together with the usage sites of the 48 links located in Silverman.
* **Claimed misprints in the 2009 printing** (HANDOFF Heights correction 1): VIII.5.4(c), Example X.4.5.1 and Proposition X.4.9.
  * The 2015-printing errata list records none of them. It omits misprints that were corrected in that printing.
  * The reviewer's arithmetic supports (Z/2Z)³ for Example X.4.5.1. The errata's own quotation of Example 4.8 on p. 336 has a² − 4b.
  * Whether the book prints the errors as claimed remains unchecked.

### Gaps

* **New:** Silverman-based nodes are unverified pending a check against the library copy.
* **Extended:**
  * the height machine gap (the re-targeted Néron–Tate links);
  * the Poonen imports gap (Exercise 8.7 over number fields; SF.2 scope; Hermite finiteness for 6.5.13 Step 5);
  * the conic gap (Exercise 4.5 is an exercise without proof);
  * the Siegel/S-unit gap (DT.2 duplication);
  * the Arakelov gap (the Ullmo and SUZ imports; the successive-minima indexing);
  * the Zhang asserted-steps gap;
  * the RP.6 register gap (Conjecture 9.2.27 now read).

### Questions for the orchestrator

1. **Silverman re-check.** A maintainer with the library copy should check the 29 nodes, including:
   * the three claimed misprints;
   * the two cross-reference slips, (VIII.2.1) for (VIII.1.2) and (VIII.6.2) for (VIII.6.3).

   Until then the packet cannot be accepted. HANDOFF Heights correction 1 should be marked unconfirmed, and correction 2 (Poonen's convention) softened to an abbreviation.
2. **Néron–Tate heights on abelian varieties.** RP.0 owns them by scope, and both RP.5 consumers need them (Zhang: general A; Ullmo: Jacobians). A source is needed, such as Hindry–Silverman Part B or Bombieri–Gubler Chapter 9.
3. **Brauer groups of schemes.** Neither the Brauer-group basics nor Corollary 6.6.19 (Gabber/de Jong type) have an owner. Extend SF.2, or create a stage.
4. **S-unit route.** Should RP.4's hyperelliptic Siegel node consume a DT.2 export, or keep Silverman's Roth-based proof? The promoted DT packet has no S-unit node under DT.2.
5. **Parshin construction.** It is recorded twice, here under RP.4 and in the Faltings packet's R28.5 Satz 7 node. Both were checked against the same page. Keep one.
6. **Hermite finiteness for Poonen 6.5.13 Step 5 ([Ser97, 4.1]).** Assign it to LI.4, or reuse the Faltings R28.1 Hermite–Minkowski import. That import concerns extensions unramified outside S, which is a related but different statement.

---

## 4. EXT-07/InverseGaloisAndArithmeticFundamentalGroups.json (IG.0–IG.6)

**Verdict: accepted.** The packet's status stays `partial`, and `implementationStatus` stays `unchecked` on every node.

| Item | Count |
| --- | --- |
| Nodes | 27: 18 verified, 9 corrected, 0 unverifiable |
| Links | 44 drafted: 30 kept (2 of them with page corrections), 8 annotated, 4 re-pointed or re-targeted, 2 removed; 3 added. The packet now has 45 links |
| Gaps | 8 → 8 (7 rewritten to name the imports found and the supplier-scope findings) |
| Coverage | 7 stage records (IG.0–IG.6), all `partial`; the remaining-work lists for IG.1–IG.5 are updated |

After the fixes there is no stage cycle and no node cycle, and there are no dangling endpoints. Every `parentStageId` is owned by the roadmap. The fixes change the implied stage edges as follows:

* **New and not transitive in the atlas:** AnalyticNumberTheory:AN.2 → IG.2 and ArithmeticGaloisDuality:R02.4 → IG.4. Both are acyclic.
* **New but transitive:** ComplexComparisonPartII:C2 → IG.3, via C4.
* **Removed:** the drafted IG.3 → IG.4 edge.

### Sources and provenance

All five sources were fetched again on 2026-09-24. Each SHA-256 equals the value the packet already recorded:

| Source | Fetched from | SHA-256 |
| --- | --- | --- |
| SGA 1, arXiv reprint of the SMF 2003 edition (stamped `arXiv:math/0206203v2 [math.AG] 4 Jan 2004`) | https://arxiv.org/pdf/math/0206203v2 | `8e64218d356456c534eebf996940f0f957e43b54f1a080241debe12cbaf60d3c` |
| Dèbes, *Arithmétique des revêtements de la droite* (notes, May 2024) | https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf | `7b07f882c9f7c9f7b5daa3b3a7ee7ecd5fed0484addd6b55fe93cc8fedc34374` |
| Neukirch–Schmidt–Wingberg, *Cohomology of Number Fields*, electronic edition 2.3 | https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf, linked from the author page https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/ | `abbb7cdefc9ecb3350286c3cba36fe36a90c103257ff8f64173e09a50afdcb91` |
| Romagny–Wewers, *Hurwitz spaces* (Sém. Congr. 13) | https://perso.univ-rennes1.fr/matthieu.romagny/articles/hurwitz_spaces.pdf | `caed858ea899e029b96e3b840e605ad6432cdd1100b93125ef39a0d8abde18a0` |
| Dèbes, *Hurwitz spaces and Inverse Galois Theory* (stamped `arXiv:2601.06532v2 [math.NT] 11 Apr 2026`) | https://arxiv.org/pdf/2601.06532v2 | `7f640bc6cf08a39c342d06f63f52de37c279b0f5eee6b49f63b83863b2a24a66` |

**How the sources were read.**

* **Text.** Extracted with PyMuPDF. SGA 1's extraction splits accents from their letters, so it was normalized before searching.
* **Page images.** Formulas that nodes depend on were checked on rendered pages: SGA 1 p. 114 (Proposition V 6.11) and Dèbes pp. 217–218 (the matrices of Lemme 8.2.6).
* **Page offsets.** SGA 1 printed page = PDF page − 16 in the ranges used. NSW printed page = PDF page − 14 in chapter IX.
* **NSW download.** The server returns the NSW PDF only when the request carries the author page as referrer. Without it, the request is redirected to that page.
* **Excerpts.** All 41 drafted excerpts are literal, allowing for dropped accents and transliterated notation. One excerpt was added.
* **Extra reading by the reviewer**, now recorded in `readSections`:
  * Dèbes: the proof of Lemme 9.2.2, Remarque 9.1.2, Corollaires 6.1.13 and 6.1.18, and the chapter 9 opening.
  * NSW: steps 2–3 of Theorem 9.6.7. With these, the whole proof has been read except Propositions 9.6.2–9.6.4 and Lemma 9.6.5.
  * Romagny–Wewers: the proofs of Proposition 4.10 and Theorem 4.3.
  * SGA 1: X §3 in full, XII 4.5–5.4 and XIII 2.12 to the end of its proof, including the 2003 remark.

### Structural fixes

1. **Removed: X specialization node → XIII tame-π₁ node.**
   * **Why.** The link's own reason was that XIII 2.12 "follows the pattern" of X 2.6/3.10. That is a shared method, not an input.
   * **What 2.12 actually uses.** Its proof (pp. 290–292) cites only XIII 1.10–1.11, 2.8–2.10 and 5.6 (all unread) and III 7.4.
   * **Where it is recorded.** The IG.1 gap and coverage.
2. **Removed: IG.3 abelian/ℝ(T) node → Shafarevich node.**
   * **Why.** It supplied an acceptance example (cyclic groups) that the NSW proof does not use, and it created a new stage edge IG.3 → IG.4.
   * **What remains available.** Cyclic realizations still come from Dèbes 8.2.7 plus 5.2.14, or from cyclotomic fields. The IG.4 gap records this.
3. **Re-pointed or re-targeted:**
   * **IG.0 → DY.5 export.** Now leaves from the field node (V 8.1). DY.5 needs π₁(Spec K) = G_K acting on finite étale fibres.
   * **Prime-number-theorem use in Remarque 5.2.10.** Moved from LI.4 to AnalyticNumberTheory:AN.2, whose stated scope is the PNT; LI.4's scope names neither the PNT nor Puiseux.
   * **Proposition 5.2.14 link.** Re-targeted from the Shafarevich node to the stage IG.4, as acceptance support. NSW's proof does not use Hilbert irreducibility.
   * **R09.4 link.** Re-targeted from the coarse-moduli-scheme node to the stage IG.5. The Romagny–Wewers scheme construction uses no stacks; the stack version is remaining IG.5 work.
4. **Added:**
   * **ComplexComparisonPartII:C2 → Riemann existence.** XII 5.1 closes with XII 4.6, which is GAGA for finite covers of a proper ℂ-scheme and comes from 4.4. For P¹, projective coherent GAGA is C2's scope.
   * **Riemann existence → ℝ(T)/abelian node.** Dèbes 8.3.1 (*) identifies complex conjugation through Théorème 6.5.3 (p. 221).
   * **ArithmeticGaloisDuality:R02.4 → NSW 9.6.7.** Step 2 uses Poitou–Tate duality (p. 589).
5. **Annotated (endpoints kept):**
   * **V 6.9–6.11.** Not cited in the proof of IX 6.1; only V 6.13 is.
   * **V 8.2 → Dèbes 6.2.1.** A comparison edge. Dèbes proves 6.2.1 by field theory alone.
   * **Dèbes 6.2.1 → 5.2.14.** A shared Hensel-embedding construction, not an input.
   * **SF.2 → IG.0 and LI.4 → IG.0.** The stated scopes do not cover the imported facts about finite étale covers (V 1–3) or infinite Galois theory of arbitrary fields. Supply is unconfirmed, and the gap records this.
   * **C4 → Riemann existence.** C4 supplies the connectedness comparison of XII 2.6 (π₀(X^an) = π₀(X)) for smooth affine curves, not GAGA.
   * **LI.4 → NSW 9.6.7.** LI.4 covers Hoechsmann 3.5.9, the torsor structure 3.5.11, p-projectivity 3.5.6 and cd_p = 1 (6.1.4). Poitou–Tate belongs to R02.4, and Chebotarev (9.1.3) is not cited in IX §6.
   * **Page corrections.** Romagny–Wewers Theorem 4.11 and Corollary 4.12 are on p. 328, not p. 327.

### Main source corrections

1. **SGA 1 XII 4.6 is not Grauert–Remmert** (G_m node and Riemann-existence node). XII 4.6 is GAGA for finite (étale) covers of a proper ℂ-scheme. The printed proof of XII 5.1 uses:
   * Hironaka's resolution;
   * XII 2.6 and Proposition 5.3;
   * descent along normalization (IX 3.2, 4.7);
   * XII 4.6.

   Grauert–Remmert (XII 5.4) appears only as the older alternative route (p. 255).
2. **Seifert–Threlfall import.** The characteristic-0 proof of XIII 2.12 also imports Seifert–Threlfall, ch. 7 §47, for the topological presentation. Now named.
3. **Purity in X 3.8.**
   * X 3.8 needs purity 3.1/3.3 in general. SGA 1 recalls it without proof, citing SGA 2 X 3.4 and Nagata. The seminar did not verify the result of Chow on which the general case rests.
   * The easy two-dimensional case suffices only for 3.10 (Remarques 3.11).
   * Abhyankar's lemma X 3.6 is proved in the text; it is not an import.
   * X 3.8 also requires geometrically connected fibres; added.
4. **Missing hypotheses restored:**
   * V 7: π₁(f; a′) needs S′ connected and locally noetherian.
   * XIII Lemme 2.11: its full hypotheses (proper and finitely presented f, a divisor with relative normal crossings, compatible geometric points).
   * Dèbes 8.1.1–8.1.2: t ∈ U_r(k), and the invariants over k^s and k̄ must agree (Remarque 6.1.11).
5. **Branch cycle lemma.** Dèbes Corollaire 6.1.13 (p. 164) is the rule for how invariants change under conjugation by τ. The source's "branch cycle lemma" is Corollaire 6.1.18 (p. 170), deduced from 6.1.13 and 6.1.17.
6. **Weissauer exception.** The footnote on p. 232 concerns k₀((X₁,…,X_n)) with n ≥ 2. The same page lists κ((x)) as non-Hilbertian.
7. **NSW 9.6.7 proof steps.** Rewritten from the source:
   * step 2 kills the obstruction in Ш² by Poitou–Tate duality plus shrinking;
   * step 3 twists the solution by ε for properness and ramification control;
   * step 4 uses Theorem 9.3.2 for condition (ii), and the auxiliary set T⁰ keeps the solution proper.

   Every result cited in IX §6 is now listed: 3.5.6, 3.5.9, 3.5.11, 3.8.8, 6.1.4, 6.5.7, 9.1.9, 9.2.2, 9.2.6, 9.2.9, 9.3.2 and Poitou–Tate.
8. **Abhyankar's conjecture.** SGA 1 XIII p. 292 (a remark added in 2003) states the conjecture, its proof by Raynaud and by Harbater (1994), and that π₁(A¹) is not topologically finitely generated. The tame-covers node had said none of this was in the sources.
9. **Romagny–Wewers referee gap.** The gap in Proposition 4.10 that the referee found concerns a previous version. The published proofs of 4.10 and 4.3 were read and rest on named imports: Proposition 4.5, Lemma 4.6, [Wew99, 5.2.3(v)], [Mil80, I.3.8] and [Har77, III.10.3–10.4].
10. **Recorded source misprints and omissions:**
    * SGA 1 V 6.11 prints its inclusion signs the wrong way round, and H′ : C → C″ should read C′ → C″.
    * In Dèbes Lemme 8.2.6(b) the printed g₁ has determinant 5; [[1,−1],[3,−2]] is meant.
    * Dèbes Théorème 8.3.3 is stated as an equivalence, but only the necessity direction is proved in the text.

### Unverifiable items

None among node statements. Every node was checked against its cited passage. Imports that are still unread are listed in the gaps:

* **SGA 1:**
  * Exposés I and V §§1–3;
  * Séminaire Bourbaki 195;
  * XI §6;
  * XIII 1.10–1.11, 2.8–2.10 and 5.6;
  * III 7.4;
  * EGA III;
  * SGA 2 X 3.4;
  * Seifert–Threlfall;
  * Hironaka.
* **Dèbes notes:**
  * chapter 7;
  * 6.1.1, 6.1.3.2, 6.1.17 and 6.2.2–6.2.3;
  * 1.3.12, 1.4.2 and 2.4.4;
  * [FJ04, 12.3.5];
  * [DD97];
  * projectivity of G_{ℚ^ab}.
* **NSW:** 9.6.2–9.6.5, 9.3.2, 9.2.2, 9.2.9, IX §5 and Huppert.
* **Romagny–Wewers and others:**
  * Romagny–Wewers Proposition 4.5 and 4.13, and §5;
  * Wewers 1998;
  * Fried–Völklein 1991;
  * Raynaud and Harbater 1994.

### Questions for the orchestrator

1. **New cross-roadmap edges.** Three reviewer-added suppliers have no counterpart in the atlas:
   * **AN.2 → IG.2:** the PNT, used only for the prime corollary in Remarque 5.2.10.
   * **R02.4 → IG.4:** Poitou–Tate in NSW 9.6.7, step 2.
   * **C2 → IG.3:** GAGA in XII 4.6. This one is transitive through C4.

   Confirm them, or route them through LI.4 or C4 by widening those stages' texts.
2. **IG.0 inputs without an owner.** SF.2's text covers sites and cohomology, and LI.4's covers number-field, class-field and profinite-cohomology suppliers. Neither states:
   * the facts about finite étale covers that V 7 cites (quotients by finite groups, image factorization, the degree criterion);
   * infinite Galois theory of an arbitrary field, used in V 8.1.

   Name an owner, or widen one of these stage texts.
3. **BelyiMaps suppliers.** IG.3 and IG.6 name BelyiMaps and its successors as suppliers. The candidates are:
   * layers 8–9 (analytic Riemann existence, algebraization);
   * layer 11 (fields of moduli versus fields of definition);
   * layer 12 (the branch-cycle theorem).

   None of these stages lists an IG stage as a consumer, and the packet adds no link. Decide whether to add the stage edges.
4. **Removed IG.3 → IG.4 edge.** Confirm the removal. The atlas IG.4 acceptance (cyclic and dihedral realizations) can be met from IG.2 and cyclotomic fields without IG.3.
5. **Placement of the G_m check.** Keep the IG.0 acceptance check (π₁(G_m) = Ẑ) as an IG.1 node, as drafted, or move it to IG.1 in the atlas text.

---

## 5. EXT-07/NeronModelsAndSemistableAbelianVarieties.json (R11.1–R11.6)

**Verdict: accepted.**

| Item | Count |
| --- | --- |
| Nodes | 24: 5 verified, 19 corrected, 0 unverifiable |
| Links | 43 drafted: 29 kept, 8 annotated, 3 re-pointed (one reversed), 3 removed; 4 added (44 in the packet) |
| Gaps | 7 → 9 |
| Coverage | 6 stage records, all `partial`; 5 `remaining` lists extended |

**Graph checks.**

* There is no dangling endpoint, no stage cycle and no node cycle.
* An in-memory `merge_decompositions` dry-run succeeds for this packet alone and for all seven EXT-07 packets together.
* Two implied stage edges are new: LPV.1 → R11.3 and LPV.2 → R11.4. Both were drafted and both are acyclic. Every other implied edge is an atlas edge or transitive in the atlas.

### Sources and provenance

All seven public files were fetched on 2026-09-24. Each SHA-256 matches the packet.

| Source | URL | SHA-256 |
| --- | --- | --- |
| Romagny 2011 | https://perso.univ-rennes1.fr/matthieu.romagny/exposes/Neron_models.pdf | `22f81b54…ea1a7d7e` |
| Lichtenstein | http://virtualmath1.stanford.edu/~conrad/mordellsem/Notes/L11.pdf | `8ef7cac5…27ca9ebf` |
| Conrad 2015 | https://virtualmath1.stanford.edu/~conrad/BSDseminar/Notes/L3.pdf | `bc27aad2…2ce988e6` |
| Raynaud 1970 | https://www.numdam.org/item/10.1007/BF02684651.pdf | `fdba4b96…cf04cf92` |
| SGA 7 I | https://library.slmath.org/nonmsri/sga/sga/pdf/sga7-1.pdf | `17286b0f…c03c8dab` |
| SGA 7 II | https://publications.ias.edu/sites/default/files/Number12.pdf | `fa679deb…876e1297` |
| Poonen | https://math.mit.edu/~poonen/papers/Qpoints.pdf | `42e92ce4…16887353579` |
| Silverman AEC | not fetched: no public copy | not checked |

**How the sources were read.**

* **Text layers.** Romagny, Lichtenstein, Conrad and Poonen were read in the PyMuPDF text layer. Formulas were checked on page images.
* **SGA 7 I.** The scan has no text layer, and no OCR was used. Every cited passage of Exposé IX was read on page images: 2.2.9, 2.4–2.6, 3.1–3.9, 5.10, 11.0–11.6 and 12.1–12.7. So were Deligne's preface (p. VI) and the sommaire of Exposé I.
* **Raynaud §8 and SGA 7 II XV 3.4.** Read on page images. The NUMDAM text layer renders Q^τ as "QJ"/"Q_S".

**Edition details corrected.**

* Lichtenstein's PDF was created 26 January 2011 (Pacific time), not 27 January.
* The contents page of Exposé XV is printed p. 165. Page 164 is the bibliography of Exposé XIV.
* The summary had listed Poonen as a library source. It is a public author copy.

### Structural fixes

1. **Links removed.** The consumer's proof uses none of these.
   * AdicSpacesPartII F0 → smoothening. Romagny uses no formal geometry, and the atlas edge F0 → R11.1 stays.
   * IX 11.5 cokernel → Conrad's L-factor. The point count uses only #Φ(k).
   * PadicHodgeTheory R06.6 → the p-adic criterion. SGA 7 IX 5.10 uses Tate's theorem on p-divisible groups, not crystalline comparison.
2. **Links re-pointed.**
   * Dedekind gluing → elliptic Néron models now comes from local existence, because Lichtenstein 4.1.5 reruns the local construction.
   * Dedekind gluing → Raynaud 8.1.4 now comes from the base-change/descent node. 8.1.4 reduces to strictly henselian S and uses the R^sh-points criterion via Raynaud's [11] (2.3), (3.3). These are Lichtenstein 6.2.1 and 6.1.1.
   * 8.1.4 → 8.1.2 was reversed. The proof of 8.1.4 cites 8.1.2 (iii).
3. **Links added.**
   * Semistable reduction (3.6) → 5.10.
   * 2.2.9 → 5.10.
   * The weak Néron property → Lichtenstein 6.1.1.
   * Weil's theorem → 6.1.1.
4. **Links annotated.**
   * DEF → base change: only 1.4.3 is formal.
   * Elliptic → 57C2: the Frobenius action in the nonsplit case is Conrad's unproved assertion.
   * Chevalley → semistable: semi-abelian ≠ U = 0 over imperfect fields.
   * Semistable → Raynaud/12.1: the use is at 12.1.11–12.2.
   * 12.5 → 11.5: the dependency runs only through 11.5.2 b) and 10.4, via 12.6 and 10.5.
   * Elliptic → NOS: Silverman's proof was not checked, but Lichtenstein p. 21 confirms it relies on finiteness of A_k/A⁰_k.
   * LPV.1 → 3.6: see question 1.
   * R07.1 uniqueness → exactness: Lichtenstein says only "Raynaud's results on group schemes of type (p, …, p)".

### Main source corrections

1. **SGA 7 IX 3.5 is misprinted.**
   * Condition (ii) is printed "V ⊂ V^⊥", and (2.5.5) "rang V/V∩V^⊥ = 2λ".
   * The rank diagram (2.5.4) contradicts both. So does the last line of the proof ("V^⊥ ⊂ U^I = V, ce qui est (ii)"), and (ii) ⇔ (iii) needs the same condition. The correct condition is **V^⊥ ⊂ V**.
   * ⊥ is taken for the polarization form (2.5.1).
   * The drafter's (ii), "V = orthogonal of the toric part", was not the printed condition.
   * (iii), W = V^⊥, had been omitted as "illegible OCR" and was added.
2. **Raynaud 8.1.4 and 8.2.1.**
   * The Néron group is the subgroup **Q^τ** of Q = P/E, not "Q_S".
   * Factoriality is required of X ×_S S^sh.
   * 8.2.1 assumes property (N)*.
   * Conditions (ii), (iii) and (v) are now exact: over κ(t′), universal for P⁰_{t′}, and P_{S′}.
   * In 8.1.2 (ii), finiteness needs cohomological flatness or (N).
   * In 8.1.2 (iii), condition b) is "Q^τ closed in Q".
3. **SGA 7 IX 12.1.**
   * b)–c) need d^t = 1, not d = 1.
   * d) needs an integral geometric generic fibre.
   * 12.1.10–12.1.12 were added: A⁰₀ = Pic⁰_{X₀/k}, which characterizes semistability.
4. **SGA 7 IX 11.5.** In §§9–11, M = D(T′₀) is the character group of the torus of the *dual*, and M′ = D(T₀) is that of A (11.6.1, 12.4.6). The node had it the other way round.
5. **SGA 7 IX 12.4.2.** The source has d(x_i) = C′_i − C″_i; the node had reversed it. The excerpt's "standard x" is the form Σ X_i².
6. **SGA 7 IX 3.7.** The proof says it was proved "dans III". Deligne's preface says Exposés III–V do not exist and were summarized in Exposé I. The drafter's attribution to Abhyankar is not in IX 3.7.
7. **Conrad 4.1.** Oesterle's formula is #T(k) = det(q − φ | X^*(T)), for the character group, not X_*(T).
8. **Romagny 2.4.1.** E-permissibility was misstated. The acceptance item claimed "build after strict henselization, then descend"; Romagny works over R.
9. **Lichtenstein 5.2.7.** The index bound "divides c(A)" holds only for separably closed k, since the index divides #Φ(k_s). Only boundedness is used.
10. **SGA 7 IX Corollaire 5.10 located** (p. 385) and added as a source for the p-adic criterion. It holds for any trait and any ℓ, with char K = 0 when ℓ = p.
11. **Smaller fixes.**
    * The Weil-extension proof sketch was rewritten from the page: faithfully flat descent along Z′ → Z.
    * Conrad 3.7 is "in particular", not "equivalently", to SGA 7 IX 3.2.
    * Lichtenstein's c(A) remark is not restricted to elliptic curves.
    * Ramification index 1 includes a separable residue extension.
    * "Additive" for y² = x³ + p is marked as derived.
    * "Semisimplified local factor" was reworded.

### Unverifiable items

**Silverman AEC.** There is no public copy, so the source's SHA-256 and every Silverman excerpt are unchecked. The claims concerned are VII.5.1 (criteria), VII.5.4 with Example 5.2, VII.6.1, and VII.7.1–7.3. Each is marked "not independently verified" in the nodes and has its own gap. No node rests on Silverman alone.

**Still unread imports**, all recorded in gaps:

* BLR (3.3/3, 3.3/5, 4.4/1, 5.1, 6.5/4, 7.1/1, 7.2/1, 7.5/4);
* Raynaud [11];
* Raynaud 1970 §§3, 5–7, including (N)*, δ, d′ and Q^τ;
* SGA 7 I Exposé I, and Exposé IX §§1, 7–10 (including 10.4–10.5) and 5.8;
* Tate's theorem on p-divisible groups;
* SGA 7 II XV §§1–3.

### Questions for the orchestrator

1. **LPV.1 scope.** IX 3.7 needs the **echelon-2** refinement: an open subgroup of inertia with (1 − g)² = 0 on H¹. LPV.1's text promises only quasi-unipotence. Should LPV.1 be extended to the nilpotence bound N ≤ i + 1 on Hⁱ (the preface attributes it to the geometric proof), or should a new supplier own it?
2. **Tate's theorem.** Which stage owns Tate's full-faithfulness theorem for p-divisible groups, used by IX 5.8–5.10? No atlas stage names it. R07.1–R07.2 are the natural candidates.
3. **The 3.5 misprint.** Should the corrected condition V^⊥ ⊂ V be recorded in the atlas's source-errata list as a misprint in SGA 7 IX 3.5 (ii) and (2.5.5), so that R11.3 consumers do not formalize the printed inclusion?
4. **Silverman.** Should a reviewer with library access check the Silverman excerpts (VII.5–VII.7), or should those claims be re-sourced? Liu, Conrad's *Minimal models*, and Silverman's *Advanced Topics* IV.9 via a public copy are possibilities.

---

## 6. EXT-07/tauceti_TauCetiRoadmap_JacobianChallenge.json (JacobianChallenge Layers A–F: `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-…` to `#layer-f-…`)

**Verdict: needs_changes.**

Only one thing blocks acceptance: one node rests partly on Silverman, *The Arithmetic of Elliptic Curves*, III.3.4. No public copy of it exists, so that passage could not be read. Every other node and every link was verified or corrected against the source, and no contradiction remains.

| Item | Count |
| --- | --- |
| Nodes | 29: 20 verified, 8 corrected, 1 unverifiable |
| Links | 55 drafted: 53 verified unchanged, 2 annotated, 0 removed; 1 added (56 in the packet) |
| Gaps | 9 → 10 |
| Coverage | 6 stage records, all `partial`; the remaining work for Layers D, E and F was updated |

Structural checks:

* All 29 `parentStageId`s are JacobianChallenge stages in `data/atlas.json`, with owner `tauceti:TauCetiRoadmap/JacobianChallenge`.
* The 6 coverage records name real stages.
* Every link endpoint exists. The only packet-external node endpoint is the NeronModels R11.4 node, which is present in that packet.
* The packet's links together with the atlas `stageEdges` produce no stage cycle and no node cycle.
* The atlas has no stage edges for this roadmap, so every stage edge implied by the packet is new:
  * **Internal:** A → B, A → C, B → D, B → E, B → F, C → B, C → D, C → F, D → E, D → F, E → F.
  * **External:** SF.1 → C, SF.1 → D, B → SF.3, B → AlgebraicCurves Layer 12, D → SF.3, D → R11.4, E → A6, E → R07.2, E → WC.5, E → EDC.2:trace-purity. The last two refine atlas edges from `UPSTREAM:JacobianChallenge`.

### Sources and provenance

All public sources were re-fetched on 2026-09-24. Every hash matches the packet.

| Source | URL | SHA-256 |
| --- | --- | --- |
| Stacks, *Picard Schemes of Curves* (ed88ff78) | https://stacks.math.columbia.edu/download/pic.pdf | `d2d67eba4fffb7f7d23f3e14b0413d6fb43aff623f27980e6b66476031b27174` |
| Stacks, *Algebraic Curves* | https://stacks.math.columbia.edu/download/curves.pdf | `c4e3d4c0fc533a3d46ce07c1bd6ec49f03e02c131da30ed275ada4bc9f82c030` |
| Stacks, *Varieties* | https://stacks.math.columbia.edu/download/varieties.pdf | `ed339c312c86721e3f830876da14cabe89a96e83e454a78b7cd355555f4bca45` |
| Stacks, *Divisors* | https://stacks.math.columbia.edu/download/divisors.pdf | `0527740ac9877baff00aaad784e66aae83ff541dad40d4939028059f9f28a493` |
| Stacks, *Cohomology of Schemes* | https://stacks.math.columbia.edu/download/coherent.pdf | `b4980a08a8cce98fed6a420364b18c119364a9436577031b28a16863bcbdbfb8` |
| Stacks, *Derived Categories of Schemes* | https://stacks.math.columbia.edu/download/perfect.pdf | `f79e0ebb628734948a51efd20b75d75c8e5341e4ab493e54f7fc710ebf72fb02` |
| Milne, *Abelian Varieties* v2.00 (2008) | https://www.jmilne.org/math/CourseNotes/AV.pdf | `f5ca4e63e5092a4b102daad1470e4cbed5fe8f82115e3a28c8881e3f67f6aaef` |
| Kleiman, *The Picard scheme*, arXiv:math/0504020v1 | https://arxiv.org/pdf/math/0504020v1 | `cc14e62f0ebebb8617777651bbcd08bb7548cb9fe955f3a25bb6491c5f3beeaa` |
| Stacks tag 0D04 (web page, statement only) | https://stacks.math.columbia.edu/tag/0D04 | `02dbc94416c6b26935f63547f127425edba967e0ad3e8c1700560307493c1661` (HTML as fetched) |
| Silverman, *AEC* 2nd ed. (Springer) | https://doi.org/10.1007/978-0-387-09494-6 | not checked: no public copy |

**How the sources were read.**

* **Stacks and Kleiman.** Every excerpt was matched against the PDF text layer; all are literal.
* **Milne.** The text layer drops minus signs and garbles symbols, so each Milne excerpt was checked by reading. Formulas that nodes depend on were read on page images:
  * I 5.4, p. 22;
  * I 7.4, p. 34;
  * III 6.6–6.11, pp. 105–108.
  The signs in III 6.9 and 6.11 are confirmed as −f^∨ = φ_{L(Θ)}^{-1}, M^P ≈ (f×1)^*L′(Θ)^{-1} and L^P ≈ (f×f)^*L′(Θ)^{-1}.
* **Beyond the drafted ranges.** The reviewer also read Milne I 5.16–5.20 with the partial proof of the cube (pp. 26–27), Milne I.6 (pp. 28–31), Kleiman Lemma 5.1, the whole proofs of 5.4 and 5.11, and 5.20. These were added to the sources' `readSections`.

### Main corrections

1. **Theorem of the cube.** The node said Milne defers the proof. The notes do give a partial proof on pp. 26–27:
   * reduction to an algebraically closed field (5.12);
   * the seesaw principle and closedness (5.16–5.19);
   * Lemma 5.20, which reduces to a complete nonsingular curve using Chow's lemma, a blow-up and Bertini.

   Only the curve case is omitted, with the reference "Mumford 1970, p57-58. [See the next version.]". The hypothesis, title, locator and gap were rewritten. The statement now also includes seesaw 5.16–5.19, which the I.8 link (K(L), Proposition 8.4) consumes.
2. **Kleiman Proposition 5.20.** The node dropped two hypotheses: that Pic_{X/S} represents the fppf sheaf, and that every Pic^0_{X_s/k_s} is complete (the node had "the fibres are complete"). Both were restored, and the smoothness clause for reduced S was added.
3. **Kleiman Theorem 5.4.** The complete proof (p. 38) was read. It imports:
   * Chevalley–Rosenlicht [Co02, Thm. 1.1];
   * Lie–Kolchin [Bo69, (10.5), (10.2)];
   * Hartshorne Ex. II 6.15;
   * Altman–Kleiman [AK70, Prp. (3.10)];
   * the Comparison Theorem 2.5.

   These were added to the node, and a new gap was opened for them. For a curve, the Stacks and Milne routes get properness without these imports.
4. **Milne I 4.2(d).** Local freeness of R^r f_*F needs T integral; the node's summary now says so.
5. **Unnamed import in Milne III 2.2.** The proof cites Shafarevich 1994, III 5.2 for h_J: Γ(J, Ω¹) ≅ T₀(J)^∨. This was added to the node, the gap and Layer F coverage. The "(1.6)" cross-reference in 2.2 evidently means 2.1.
6. **Smaller fixes.**
   * Stacks Cohomology of Schemes Lemma 5.2 is on pp. 10–11, not 9–10 (fixed in the node locator and in `readSections`).
   * The Divisors 19.1/19.3 proof step, which merged the two lemmas, was split.
   * Picard 6.7: the proof does not argue parts (3) and (6) separately; this was recorded, and (6) was derived.
   * An undefined label "A3" was replaced by the name of the degree node.
7. **Links.**
   * The link from the H¹-vanishing node to Milne's construction was annotated. The node's output is used on p. 99 (h⁰ = r + 1 − g for r > 2g) and in the proof of 4.2(a). The h¹ = 0 in 4.2(b) is a Riemann–Roch count in degree g, supplied by the genus/Riemann–Roch node.
   * A link from that genus/Riemann–Roch node to Milne's construction was therefore added. It implies the stage edge B → D, which already existed.
   * The cube → dual-variety link was annotated to record the extended source node.
   * All eight cross-roadmap stage descriptions were read, and each scope covers its edge:
     * SF.1: effective fpqc/fppf descent;
     * SF.3: integrates divisors, Riemann–Roch, Serre duality, genus, Picard schemes and Jacobians;
     * AlgebraicCurves 12E: names JacobianChallenge Layers A–B, restricted to smooth proper geometrically connected curves;
     * R11.4: "Smooth proper Jacobians are already owned by JacobianChallenge";
     * A6: "field Hom/End API of JacobianChallenge";
     * R07.2: "Field-valued abelian varieties are imported from JacobianChallenge";
     * WC.5 and EDC.2:trace-purity.

     For WC.5 and EDC.2:trace-purity, the link reasons already disclose that the étale comparison (H¹_et vs T_ℓJ, Kummer) is not supplied.

### Unverifiable items

* **Node `…/genus-zero-and-genus-one-checks`: the Silverman III.3.4 clauses.** This covers the point-level bijection Pic⁰(E_K̄) ≅ E(K̄), the group-law compatibility, the excerpt, proof steps (a), (c)–(d) and (e), and the hypothesis "K perfect". What was verified:
  * the Milne III 1.4(e) part;
  * the derived scheme-level argument (a closed immersion of E into the irreducible one-dimensional J is an isomorphism, and a homomorphism by I 1.2).

  Milne I 5.7 cites "Silverman 1986, III 3.4d" for the same homomorphism. That is corroboration only, not a check of the passage.
* **Still-unread imports.** All are recorded in gaps:
  * Stacks Duality for Schemes, Dualizing Complexes and Chow Homology 41.3;
  * Descent 5.2 and 37.2; Schemes 15.4; Groupoids 7.3;
  * Derived Categories 30.1 and 31.1–31.3;
  * Kleiman §§3–4 and Appendix A;
  * Mumford (the cube for curves; 8.9, 8.14, 11.1 and A^∨ in characteristic p);
  * Milne AG 16.23 (Galois descent);
  * Shafarevich III 5.2;
  * the Kleiman 5.4 imports listed under correction 3;
  * the étale realization of the Jacobian.

### Questions for the orchestrator

1. **Silverman III.3.4.** Have the passage checked against the library copy (hash `72ee67bf…`), or drop the Silverman clauses from the genus-one node and keep Milne 1.4(e) plus the derived argument. Either change makes the packet acceptable.
2. **Layer order.** Three proofs run against the roadmap's A → F order and remain unlinked:
   * degree (A) needs B/C finiteness and flat base change;
   * Milne's Galois descent (D) needs projectivity of abelian varieties (E);
   * autoduality (E) needs Abel–Jacobi and Milne III 5.1 (F).

   Reorder these sub-results or accept the cross-layer edges. The one reversal already linked, C → B, is acyclic.
3. **Stale HANDOFF text.** `EXT-07/HANDOFF.md` (JacobianChallenge corrections, point 5) still says the cube's proof is simply deferred. It should say that Milne reduces it to the curve case. The reviewer did not edit the HANDOFF.
4. **Étale realization.** An owner is still needed for H¹_et(X_k̄, Z_ℓ(1)) ≅ T_ℓJ and the Kummer sequence. Its consumers are WC.5, EDC.2:trace-purity, SF.3 and R06.5. The choice is JacobianChallenge or TraceFormula Layer 8. This question is carried over from the HANDOFF and is still open.

---

## Appendix A — change lists

One block per packet, in the order above. Each is a JSON object with the keys
`packet`, `review`, `nodes` (`changed`: node id → changed fields and their new values, where `null` means the field is
removed; `added`; `removed`), `links` (`added`, `removed`, `changed`, each a list of links identified by `source` and
`target`), `gaps`, `coverage` and `sources` (the full new array, or `null` when unchanged) and `other` (any other changed
top-level field).

<details><summary><code>FiniteFlatGroupsAndIntegralPadicHodgeTheory.json</code></summary>

```json
{
 "packet": "research/expansion/external/EXT-07/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json",
 "review": {
  "status": "accepted",
  "reviewer": "independent-review-REVIEW-EXT-13-EXT-07B",
  "date": "2026-09-24",
  "notes": "All 90 nodes and all 157 drafted links were checked against the sources at the cited places; formulas, inequalities and exponents were read on page images. Sources: Raynaud 1974 (NUMDAM), Fontaine-Laffaille 1982 (NUMDAM), Kisin 2009 (Annals), Liu 2013 (author copy) and Conrad 1999 (author copy) were re-fetched on 2026-09-24, and their SHA-256 hashes match the packet. Fontaine 1985: the recorded Springer PDF could not be re-fetched (JavaScript challenge), so its hash was not re-verified. The Fontaine nodes were instead checked on the GDZ scan of the same printed article (SHA-256 be153d2e...; provenance in the source entry). Verdicts: 22 verified, 68 corrected, 0 unverifiable. Main corrections: - Raynaud: formula (15) also needs chi_1...chi_n != 1. Case (b)'s converse is for delta'_i. Thm 3.4.3's excerpt was not literal (exponents are n_i..n_{i+r-1}). The rank-p step of Prop. 3.3.2(3) uses formula (4), not Cor. 1.5.2. The D-algebra hypothesis of 3.3 is now explicit. Thm 4.1.1's devissage needs the absolute different to be multiplicative, which is unwritten (new gap). Remark 4.1.2's deduction is only asserted. - Fontaine-Laffaille: the Frobenius compatibility was reversed (phi^i = pi phi^{i+1} on M^{i+1}). Notation fixed (Mbar, S-tilde, Abar^v). Lemma 5.x/3.10 joint induction is proved only for k algebraically closed. 7.14 is Hom(M_n, S_n). (fd)_3 reads M_tau. The 7.15(ii) excerpt names MF^{fd,q}_{K/O}. Prop. 8.12(i) needs filtration in [0, q-1]. 8.8 drops (epsilon D_K)^i. FL coefficients lie inside K (new gap for the O-coefficient theory used by L7 and PA.1). - Kisin/Liu: etale and multiplicative were swapped in four acceptance items (Kisin 1.1.15-1.1.16). Kisin writes Gr_D. The 1.1.13 excerpt is now literal. Wrong ring in Liu 2.2.3(2). Liu's equivalence is contravariant, and Kisin's and Liu's conventions differ by Cartier duality. Unnamed Liu imports were added. - Fontaine 1985: the printed misprint in the proof of 1.5(ii) (e u_{L/K} for e i_{L/K}) had been copied. The phi/phitilde notation clash is fixed. The uniqueness in the 1.7 inductive step is stated as printed. The reduction to algebraically closed k is only 'clair'. - R07.2: FL 9.1 covectors are over any k-algebra with (psi). The unsourced F/V claims are flagged. Links: 128 kept, 24 annotated, 3 modified, 2 removed (Breuil anti-equivalence -> Kisin Cor. 2.2.22; FL 6.1 restricted category -> finite flat groups over W(k), both shared vocabulary), 11 added (a twelfth duplicated a kept link and was dropped); 166 in the packet. All endpoints exist, and there is no node or stage cycle with the atlas. Gaps 20 -> 22; 15 existing gaps edited. Coverage: six stage records, all partial, remaining work extended. parentStageIds and coverage stageIds all belong to the roadmap. Packet status stays partial and implementationStatus stays unchecked. Supplier questions (Faltings R28.5 link restoration, the EXT-10 duplicate Raynaud node, LocalFieldsRamification Layer 3 scope, FL modules with coefficients, the Kisin/Liu convention, the Tate-shift owner) are for the orchestrator; none is an unresolved contradiction inside the packet.",
  "checked": [
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/fundamental-characters-of-a-finite-field",
    "verdict": "corrected",
    "note": "Def. 1.1.1, (1) and Rem. 1.1.2 checked on the page images of pp. 243-244; statement and excerpt literal. The garbled exponent identity in proof step 3 was rewritten (prod chi_i^{p-1} = chi_0^{q-1} = 1), and steps 2-3 are now marked as elementary expansions: Raynaud states (1) and its uniqueness without proof."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/F-vector-space-schemes-and-rank-one-eigensheaves",
    "verdict": "corrected",
    "note": "Def. 1.2.1, (2)-(6), (**), Prop. 1.2.2 with proof and Rem. 1.2.3 checked on the page images of pp. 244-247. The idempotents are Raynaud's i_chi; the node had called them e_chi, a name the packet also uses for the basis elements of 1.3. [1] = id was added to (2). The printed decomposition shows a tensor sign for the direct sum; noted. Excerpt literal (p. 246)."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/universal-structure-constants-by-gauss-sums",
    "verdict": "corrected",
    "note": "Formulas (7)-(17) and Prop. 1.3.1 with proof checked on the page images of pp. 247-253. Fixes: the generators of 1.3 are epsilon_chi and (12) is the product rule epsilon_chi' epsilon_chi'' = epsilon_chi'chi'' (the node had e_chi and only the p-th power); 'localized at (p)' means after inverting p. Formula (15) as printed also needs chi_1...chi_n != 1 (by (14) with g(1) = -q); hypothesis added, harmless for Prop. 1.3.1."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/classification-of-F-vector-space-schemes-by-invertible-sheaf-data",
    "verdict": "verified",
    "note": "Theorem 1.4.1, (18)-(24), Lemma 1.4.2 and the comultiplication check read on the page images of pp. 253-257; statement, universal ring E, extension E', the solution t_i of (23) and the component w^h t_i/(w_chi' w_chi'') all match. Excerpt literal (p. 255)."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/equations-of-F-vector-space-schemes-over-a-local-base",
    "verdict": "verified",
    "note": "Corollary 1.5.1 with its comultiplication formula and isomorphism criterion (delta'_i = u_i^p delta_i u_{i+1}^{-1}, gamma_i = u_i^p gamma'_i u_{i+1}^{-1}) matches the page image of p. 257. The acceptance checks are derived consequences and correct."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/F-vector-space-schemes-over-strictly-henselian-dvr-classified-by-exponents",
    "verdict": "verified",
    "note": "Corollary 1.5.2 and its proof (u_i^{q-1} = alpha_i^{p^{r-1}} ... alpha_{i+r-1}, solvable because R is strictly henselian) and Remarks 1.5.3-1.5.4 match the page images of pp. 257-258; the standing hypotheses precede the statement."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/schematic-closure-of-a-generic-subgroup-over-a-dvr",
    "verdict": "corrected",
    "note": "Section 2.1 read on the page images of pp. 259-260; excerpt literal. Hypothesis corrected: Sections 2-4 assume residue characteristic p (the node said 'any characteristics'). The first acceptance item was wrong (mu_p and Z/p over Z_p have no diagonal generic subgroup, since mu_p is not constant over Q_p for odd p); both items replaced by checkable examples. The fppf-quotient claim remains recorded as asserted without proof."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/partial-order-on-finite-flat-prolongations-and-its-bounds",
    "verdict": "corrected",
    "note": "Def. 2.2.1 and Prop. 2.2.2 with proof match the page image of p. 260. The first acceptance item ('mu_p and Z/pZ-type models over Z_p') was vacuous for odd p; replaced by the Z_2 example Z/2 >= mu_2. Proof step 1 marked as an expansion ('il est unique' is asserted)."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/maximal-and-minimal-finite-flat-prolongations",
    "verdict": "verified",
    "note": "Corollary 2.2.3 and proof match p. 261 (the source prints 'finie sur A' where 'finie sur R' is meant). The noetherian stabilization in proof step 3 is the drafter's expansion of 'resulte de la et de la proposition 2.2.2', correctly stated."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-prolongation-from-levelwise-finite-flat-prolongations",
    "verdict": "verified",
    "note": "Prop. 2.3.1 and steps (a)-(e) re-read on the page images of pp. 261-263: the domination directions in (*) and (**), the use of Cor. 2.2.3 in (d) and the stationary values in (e) match. Tate's uniqueness ([13] p. 180) is correctly recorded as an import."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/tame-inertia-as-inverse-limit-of-roots-of-unity",
    "verdict": "corrected",
    "note": "Section 3.1 matches pp. 263-264 (compatibility omega -> omega^{n/m}, norms x^{(q'-1)/(q-1)}, j and j_q); excerpt literal. Typo fixed ('K a separable closure of K'). The normalization check in the acceptance (sigma(pi_n)/pi_n = i_n(sigma)) follows from the printed formula."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/jordan-holder-devissage-of-etale-or-multiplicative-p-power-groups",
    "verdict": "verified",
    "note": "3.2 and Prop. 3.2.1 with proof match pp. 264-265 (wild inertia via [11] p. 146, factorization through I_t for strictly henselian R, commutant F, (**) via Prop. 1.2.2). Excerpt literal."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/F-structure-extends-to-maximal-and-minimal-prolongations",
    "verdict": "verified",
    "note": "Opening of 3.3 and Prop. 3.3.1 match p. 265; the node's argument for 'il est formel' is correctly presented as an expansion."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/valuation-analysis-of-F-vector-space-prolongations",
    "verdict": "corrected",
    "note": "Formulas (1)-(5) and cases (a)-(c) re-read on the page images of pp. 266-267. The converse in case (b) is stated for delta'_i (the smaller prolongation), not delta_i; fixed. Reviewer note added that the printed construction alpha_i = pi also needs v(delta'_{i-1}) <= e-1 when r >= 2. The implicit D-algebra hypothesis needed for Cor. 1.5.1 is now explicit."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/maximal-prolongation-characterized-by-valuation-bounds",
    "verdict": "corrected",
    "note": "Prop. 3.3.2(1) matches p. 267; excerpt literal. The induction is only indicated in the source; the proof step now gives both directions (non-maximality when (a) or (b) fails, maximality when both hold) and the implicit D-algebra hypothesis is recorded."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/uniqueness-of-F-vector-space-prolongation-when-e-less-than-p-minus-1",
    "verdict": "corrected",
    "note": "End of case (a) and Prop. 3.3.2(2) match pp. 266-267; excerpt literal. Added the implicit D-algebra hypothesis of the argument and the unwritten descent from the strict henselization."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/etale-multiplicative-dichotomy-when-e-equals-p-minus-1",
    "verdict": "corrected",
    "note": "Prop. 3.3.2(3) with proof matches pp. 267-268; excerpt literal. The last proof step cited Cor. 1.5.2 for 'not etale implies multiplicative'. That does not follow from 1.5.2, since exponents 0 < n < p-1 exist. The actual reason is formula (4) with r = 1, so v(delta) is a multiple of p-1; the step was rewritten. The step on the simplicity of G+ (x) k was also clarified: the source prints the script G."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/uniqueness-of-finite-flat-prolongation-when-e-less-than-p-minus-1",
    "verdict": "verified",
    "note": "Theorem 3.3.3 and proof match p. 268 (inequality e < p-1 read on the image). The strictly henselian base change needed to apply Prop. 3.2.1 is correctly flagged as unwritten."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/generic-fibre-full-faithfulness-when-e-less-than-p-minus-1",
    "verdict": "verified",
    "note": "Cor. 3.3.6(1) matches p. 268 and has no written proof (confirmed on the image). Conrad (author copy) Cor. 1.5-1.6 (pp. 9-10) and Lemma 4.1 (p. 36) re-read: the excerpt is literal, and the node's description of what Conrad proves and what he cites from Raynaud is accurate. The candidate existence route via the closure of the graph is valid and labelled as not source-based."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/flatness-of-extended-kernel-and-cokernel-when-e-less-than-p-minus-1",
    "verdict": "verified",
    "note": "'De plus, Ker (u) et Coker (u) sont plats sur R' is literal (p. 268), with no proof; candidate route labelled. The Z/2 -> mu_2 counterexample at e = p-1 is correct."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/injectivity-of-generic-fibre-on-ext-when-e-less-than-p-minus-1",
    "verdict": "verified",
    "note": "Cor. 3.3.6(2) literal (p. 268), no proof; the node correctly leaves the Ext category unfixed and the route as a candidate."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/composition-series-with-vector-space-quotients-when-e-at-most-p-minus-1",
    "verdict": "verified",
    "note": "Cor. 3.3.7 literal with e <= p-1 (confirmed on the image of p. 268), no proof; candidate route labelled."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/tame-character-of-an-F-vector-space-scheme",
    "verdict": "verified",
    "note": "(6)-(9), Theorem 3.4.1 and Remark 3.4.2 match pp. 269-270; the index bookkeeping psi_i^{v(a_i)} = psi_{i+1}^{v(delta_i)} ... psi_{i+r}^{v(delta_{i+r-1})} was rechecked with psi_i^p = psi_{i-1}. Excerpt literal."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/finite-flat-prolongation-criterion-for-F-vector-space-schemes",
    "verdict": "corrected",
    "note": "Theorem 3.4.3, its proof and Remark 3.4.6 match pp. 270-271, but the excerpt was not literal: it printed psi_{i+1}^{n_1} ... psi_{i+r}^{n_r}, while the zoomed image shows n_i ... n_{i+r-1}. The match wrongly called this an index misprint. Excerpt, match and statement corrected."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/tame-characters-of-jordan-holder-quotients-of-finite-flat-p-groups",
    "verdict": "verified",
    "note": "Cor. 3.4.4 (exponents printed n_1..n_r; 'G_i(Kbar)' slip confirmed) and Remark 3.4.5 match pp. 270-271; excerpt literal. The closure argument giving a prolongation of H is the drafter's expansion of 'Combinant 3.2.1 avec 3.4.3'."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/absolute-different-and-haar-measures-of-a-finite-flat-group",
    "verdict": "corrected",
    "note": "Appendix Lemmas 1-7, Prop. 3 (Douady), Definitions 5 and 8 and Prop. 9 re-read on the page images of pp. 274-279; excerpt literal. Hypothesis rewritten: the appendix puts no condition on R, and the lci property of G' rests on an unproved embedding into a smooth group. The SGA 2 p. 404 citation in Lemma 5 is now named."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/determinant-of-the-generic-fibre-by-the-tame-different-character",
    "verdict": "corrected",
    "note": "Section 4.1 and Theorem 4.1.1 (e <= p-1, strictly henselian standing hypothesis) match the page images of pp. 271-272, including Norm(psi) and tau_p; excerpt literal. The devissage step also needs the absolute different to be multiplicative in short exact sequences. The source neither states nor proves this (the appendix has only Prop. 9); recorded in the proof step and in a new gap."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/ordinary-generic-deformation-of-a-connected-p-divisible-group",
    "verdict": "verified",
    "note": "Lemma 4.2.3 and its proof on pp. 273-274 (typical curves T, Q_ij in W(k)[[V]], arbitrary lifts over k[[T]], generic injectivity of the p-power map) match; imports [1], [2], [9] recorded."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/determinant-of-the-tate-module-of-a-p-divisible-group",
    "verdict": "corrected",
    "note": "Theorem 4.2.1, Remark 4.2.2 and the deformation proof (versal ring O, Lemma 4.2.3, extension of (Q_p/Z_p)^{h-d} by mu_{p^infinity}^d, Zariski-Nagata [6] p. 118, section over R) match pp. 272-274. The third acceptance item presented Remark 4.1.2 as an established consequence. Raynaud writes only 'On peut le deduire', so the item was reworded and the missing identity v(D(X[p])) = ed named."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/supersingular-elliptic-p-torsion-over-an-unramified-base-is-a-level-two-vector-space-scheme",
    "verdict": "verified",
    "note": "Example (a)-(b) after Remark 3.4.7 matches p. 271, including the equation X^{p^2} = pX and 'psi est l'un des caracteres psi_i'. The derivation (v(delta_1), v(delta_2)) = (0, 1) and the use of Prop. 3.3.2(3) at p = 2 were rechecked."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-shifted-ramification-numbering",
    "verdict": "corrected",
    "note": "Checked on GDZ page images pp. 517-518. The draft wrote phi_{L/K} for Fontaine's phitilde_{L/K} (printed with a tilde) and then used phi_{L/K} for Serre's function in the dictionary, a notational clash; now phitilde/psitilde throughout. Added strict monotonicity, u_{L/K}(1)=+infinity, the integral formulas, G_(i)=G for i<=0, and the value 1/e behind the tame check."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/different-equals-u-minus-i",
    "verdict": "corrected",
    "note": "Statement, proof and excerpt match p. 518. The only change is notation: phi_{L/K} became phitilde_{L/K}, as printed and as in the numbering node. The Q_2(i) acceptance computation was rechecked (i = 1, u = 2, v_K(D) = 1)."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/krasner-criterion-for-embedding-L-from-approximate-points",
    "verdict": "corrected",
    "note": "Statements match pp. 518-519. The draft copied the printed misprint in the proof of 1.5(ii), p. 520: e*psitilde(m) = e*u_{L/K} - 1/d must read e*i_{L/K} - 1/d, because psitilde inverts phitilde and has slope 1/d on its last segment. Corrected with the justification and a Q_2(i) check. Proof of (ii) rewritten from the page (reduction, tame and wild cases), and notation changed to phitilde/psitilde."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/unique-lifting-of-homomorphisms-through-topologically-nilpotent-divided-powers",
    "verdict": "corrected",
    "note": "Statement, 1.6 example and excerpt match p. 520. Two fixes. (1) The inductive step now states the source's uniqueness (a unique u' mod aI^[n+1] inducing the same map to S/I^[n]); the draft said 'unique modulo I^[n+1]'. (2) The printed misprints on p. 522 (+mu dropped; dP_i/dX_j printed for P_ij) are recorded. The standing hypotheses are also completed."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/ramification-bound-for-points-of-such-algebras",
    "verdict": "corrected",
    "note": "Statement and excerpt match p. 521 and the proof matches pp. 523-524. Minor completions: the intermediate bound n(p-1)u <= n(p-1)v_K(a) + ne + p - 1 (the source's key step) was added, and the source's 'u_{L/K} = 1' in the tame case is noted as false for n = 1 (unramified, u = 0), which is harmless."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/different-bound-for-points-of-such-algebras",
    "verdict": "verified",
    "note": "Corollary 1.8 with proof (p. 524) and Remarks 1.9(i)-(ii) (pp. 524-525) match: the different bound is strict and the ramification bound non-strict; [Se1] Chap. III Prop. 14 is correctly named. Only the match text was updated to name the copy read."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-upper-ramification-bound-for-finite-flat-p-power-torsion",
    "verdict": "corrected",
    "note": "Theorem A (p. 515), Theorem 1 with proof and Remarks 2.2 (pp. 525-526) match. Added two things: the source asserts the reduction to algebraically closed k as 'clair' without argument (it leaves the finite-residue-field setting), and the invariant-differential definition and B_k = (B_k^c)^{J^et(k)}. The bibliography entries of [De], [Fo], [BBM], [I] were confirmed on p. 537."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-different-bound-for-torsion-fields",
    "verdict": "corrected",
    "note": "Corollary (p. 516), Theorem 1 (p. 525) and the note on the transitivity step in case (b), which the source omits, all match. The consumer acceptance item cited Section 3 without it having been read. The reviewer read Theorem 3 (3.3.1) and Corollary 3.3.2 (p. 531), made the item precise and added a source reference for p. 531."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/witt-covectors-and-the-dieudonne-ring",
    "verdict": "corrected",
    "note": "Checked Conrad pp. 3-4 and FL p. 601 on page images. FL 9.1 defines covectors for any k-algebra with condition (psi), not a W(k)-algebra as drafted. Also: the nilpotence index is fixed (a_{-n}, n large), Conrad's citation is Ch. II Prop. 2.3 (not Section 2.3), and Conrad's printed [x].a leaves a_0 unscaled, flagged and not silently fixed."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/contravariant-dieudonne-module-anti-equivalence-over-a-perfect-field",
    "verdict": "corrected",
    "note": "Conrad p. 4 and FL 9.2 (p. 601, page image) match. Conrad's locator was pp. 4-5 and is now p. 4. The primitivity sum is made explicit as covector addition. The CR.7 acceptance item asserted F/V-bijectivity outcomes that neither source states; they are now flagged as the standard expectation, to be proved or sourced."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/coefficient-setup-and-filtered-dieudonne-modules-over-A",
    "verdict": "corrected",
    "note": "Frobenius compatibility was reversed: FL 0.4/1.2 (diagram (1), pp. 550, 554, page images) give phi^i_M(x) = pi phi^{i+1}_M(x) for x in M^{i+1}. 1.4(b) colimit was misdescribed (inclusion M^i -> M^{i-1} and pi : M^i -> M^i, diagram (3) p. 555) and is written Mbar in the source. MF_tor condition restated as sum Im phi^i = M_tau (1.5). Excerpt of 0.3 literal (p. 549)."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/torsion-filtered-modules-form-an-abelian-artinian-category",
    "verdict": "corrected",
    "note": "Content of 1.6-1.11 (pp. 556-559) matches; excerpt of 1.8 literal. Notation corrected: the inductive limit of 1.4(b) is Mbar in the source (page image p. 555), not Mtilde (tilde is used for objects killed by pi). Lemma 1.9 proof step now records the rescaling of y by a power of pi."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/filtration-bounded-torsion-subcategory-MF-tor-f-q",
    "verdict": "verified",
    "note": "3.2 (p. 562, page image): definition M^0 = M, M^q = 0 and the two-out-of-three property are literal; closure follows from the kernel/image/cokernel filtrations of 1.10 as stated; the source gives no further proof."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/filtered-period-ring-S",
    "verdict": "corrected",
    "note": "2.1-2.7, 3.1 and Lemma 5.4 with proof checked on page images of pp. 560, 561, 571; excerpt of 5.4 literal. Correction: the residue field of R is kbar (residue field of Abar), not k (p. 560)."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/contravariant-torsion-galois-functor-U-S",
    "verdict": "corrected",
    "note": "3.2, 3.5, 3.7, Lemma 3.8 with proof (pp. 562-563) and 5.5 (p. 572) checked on page images; excerpt of 3.8 literal. Notation fixed: S_1 is S-tilde in the source, not Sbar; Proposition 5.5(ii) is for M in Mtilde^q (killed by pi and in MF^{f,q}); S_infinity is an inductive limit along pi_{S,n}."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/simple-objects-of-MF-tor-killed-by-pi",
    "verdict": "corrected",
    "note": "4.1-4.11 (pp. 565-570) checked; v_a(e_m) = a^{q^{-m}} e_m confirmed on a zoomed page image of p. 566; excerpt (0.7, p. 551) literal. Corrected the Lemma 4.8 step: N is spanned by the f^{hn}(x), and Jacobson Th. 15 gives an eigenvector f^h(y) = a y, normalized to a = 1 using algebraic closedness (p. 568). Match text no longer calls 4.4 'identical' to 0.7."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fundamental-characters-of-level-h",
    "verdict": "corrected",
    "note": "5.1 (p. 570) and 0.8 (p. 551) checked on page images; excerpt literal (mu_{q^h-1}(K) is K, not Kbar, in the source: k is algebraically closed). Statement aligned: mu_n(K), eta_n : G -> K^*. Raynaud comparison in the acceptance restated from Raynaud 3.1 (pp. 263-264), where i_n is defined by sigma(x') = x' i_n(sigma)^{v'(x')}(1+u')."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/ext-vanishing-against-reduced-S-for-simple-objects",
    "verdict": "corrected",
    "note": "5.3 (p. 570), 5.5-5.11 and 5.14(i) (pp. 571-580) read on page images; (3), (4) and the valuation bound on p. 576 and (7) on p. 580 match. Corrections: S-tilde (not Sbar); the coefficient ring is Abar^v/pi Abar^v (Abar twisted by tau, 5.8), not A^tau/pi A^tau (which by 0.3 is O/pi); reduction uses F_q-linearity (p. 574), not F_{q^h}; (7) is a congruence in Abar."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/rank-one-hom-into-reduced-S-for-simple-objects",
    "verdict": "corrected",
    "note": "5.3(ii), 5.10, 5.11(iii), Lemma 5.12 (with (6), mu = i_0 + q i_1 + ... + q^{h-1} i_{h-1}, page image p. 578) and 5.14(i) (p. 580) match. Notation corrected (S-tilde; Abar^v/pi Abar^v, not A^tau/pi A^tau). The M(1; q-1) count now follows 5.14(i): congruences (7_v) and their liftings (7hat_v)."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/tame-inertia-character-on-U-S-of-simple-objects",
    "verdict": "corrected",
    "note": "5.3(iii) (p. 570), 5.13 (p. 579) and 5.14(ii) (p. 580) read on page images; exponent i_0 + q i_1 + ... + q^{h-1} i_{h-1} and g a_m = chi_h^{mu q^{-m}}(g) a_m confirmed. Corrected the 5.14(ii) step (the argument is that g ahat solves (7hat_v), whose roots share one reduction) and the ring notation; recorded the printed slip 'racine q^h-ieme' for a (q^h-1)-th root."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/length-equality-and-ext-vanishing-against-S-infinity",
    "verdict": "corrected",
    "note": "3.6, 3.9-3.11 (pp. 562-565) checked. Corrected scope: the joint Hom-length / Ext^1-vanishing induction is proved for k algebraically closed (3.10); 3.11 transfers only the Hom identification to general k, so 'any perfect residue field' overclaimed the Ext part. Notation S-tilde. Excerpt of 3.6 literal up to notation."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/torsion-functor-U-S-is-exact-faithful-and-length-preserving",
    "verdict": "verified",
    "note": "Theorem 3.3 and Remark 3.4 (p. 562, page image) literal; proof 3.10-3.11 (pp. 564-565) matches the three steps; Remark 3.4 correctly recorded as a consequence of the proof."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/evaluation-map-into-galois-dual-is-injective",
    "verdict": "verified",
    "note": "Proposition 5.15 statement read on the page image of p. 580 and proof on p. 581 (text); use in 7.17(ii) confirmed at p. 594. Excerpt literal."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/restricted-subcategories-MF-prime-and-MF-double-prime",
    "verdict": "corrected",
    "note": "6.1(i), 6.2, 6.3, 6.4 (pp. 581-583) read on page images; excerpt literal. Corrected the 6.4 step: the source works in the pi-killed category and proves Ext^1_~(M, M(1; q-1)) = 0 for every pi-killed M (not 'for every M without such a JH quotient'); recorded that Lemma 6.3 uses Ext^1 in MF^f_tor and how (i) follows from the JH description."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/endpoint-collision-of-rank-one-objects-M1-0-and-M1-q-minus-1",
    "verdict": "corrected",
    "note": "0.9 (pp. 551-552) and 5.3(iii) (p. 570) read on page images; excerpt literal. The nonisomorphism of M(1; 0) and M(1; q-1) via Lemma 4.9(ii) is a derivation of the node, not in 0.9 (link added). Hypotheses reworded (0.9 has no restriction on k); p = 2 acceptance restated for q = 2."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/full-faithfulness-of-U-S-on-MF-prime",
    "verdict": "corrected",
    "note": "6.1(ii), 6.2, 6.5-6.11 (pp. 581-588) read on page images; excerpt literal; the proof is complete for MF^{f,q'}. Corrections: the source cites 'theoreme 4.3' for exactness in 6.5 (slip for 3.3); Proposition 6.7 is for pi-killed objects; 6.6 is injectivity into Ext^1_{F_q[G]}; Remark 6.13(a) example uses Ext in the pi-killed category and F_q[G]."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/full-faithfulness-of-U-S-on-MF-double-prime",
    "verdict": "corrected",
    "note": "6.6 restriction sentence (p. 584) and 6.12 (pp. 588-589) read on page images; excerpt literal. Corrected the second indicated method: S'' is an A-submodule of W_K(R) with v_R(u_{-m}) > m q v(pi) for m >= 0 (not W_A(R), not m != 0); first method uses Ext^1_{F_q[G]}. Status 'indicated only' confirmed."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/subinterval-0-to-q-minus-2-lies-in-MF-prime",
    "verdict": "corrected",
    "note": "Derivation checked: quotients in MF_tor carry the image filtration (1.10(b), p. 558, literal excerpt), so M^{q-1} = 0 excludes N = N^{q-1} != 0 and Theorem 6.1(ii) applies. Correctly labelled as not stated by FL. Corrected 'for p = 2' to 'q = 2' (for p = 2 and q = 2^r > 2 the range is [0, q-2]). 6.13(b) conditions i+j<q, l+l' != q-1 confirmed (p. 589)."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/weakly-admissible-filtered-modules-with-E-coefficients",
    "verdict": "corrected",
    "note": "7.1 does not require Delta finite dimensional (Shat_K of 7.16 is an object of MF_{K/E}); statement fixed, and MF_{K/E} recorded as non-abelian with finite limits (7.1). Match text no longer claims the inequality came from the text layer or from 7.5(ii); read on the page image of p. 591. Hypotheses now name tau of 0.3 and the unwritten transfer of [F1] 4.2.1."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/strongly-divisible-lattices-exist-iff-weakly-admissible",
    "verdict": "corrected",
    "note": "Prop. 7.8, Cor. 7.9, Rem. 7.10 checked on the page image of p. 592. The criterion is now given in the source's form Phi(M^i) in pi^i M. Remark 7.10(b) is restricted to Delta in MF^f_{K/E}, as in the source. The slope reduction is flagged as unwritten (slopes need k algebraically closed, Rem. 7.6). The Laffaille import is confirmed."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/lattice-objects-and-their-torsion-reductions",
    "verdict": "corrected",
    "note": "On the page images of pp. 592-593, (fd)_3 reads sum Im phi^i_M = M_tau, not M; statement and excerpt fixed. Remark 7.13 requires the cokernel to lie in MF^f_tor, not just MF_tor. The source's name MF^{fd}_{K/O} is adopted. The inverse-construction formula is given literally. 'M_n in MF_tor for every n' was replaced by the source's claim, which carries the q-bound."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/lattice-functor-U-S-is-exact-faithful-and-rank-preserving",
    "verdict": "corrected",
    "note": "7.14 (page image p. 593, zoomed) identifies U_S(M_n) with Hom_MFcal(M_n, S_n) = Hom_MFcal(M, S_n); the node had S_infinity in the first term. Notation aligned with the source (MF^{fd,q}_{K/O}, U_Shat, Rep^{lf}_O). The proof step now names Remark 3.4 for freeness and records that 7.14 is asserted ('On voit')."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/lattice-functor-full-faithfulness-on-restricted-reductions",
    "verdict": "corrected",
    "note": "On the zoomed page image of p. 594 the category in 7.15(ii) is the lattice category MF^{fd,q}_{K/O}; the draft excerpt had the rational MF^{f,q}_{K/E}. Excerpt fixed. The unwritten limit argument now names Theorem 6.1(i) and the sequence 0->M_n->M_{n+1}->M_1->0. Acceptance aligned with 7.18: 'not simultaneously in' q' and q'', and Remark 8.13(a) instead of 8.12."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/rational-functor-U-S-K-dimension-and-injectivity",
    "verdict": "verified",
    "note": "7.16 (Shat_K, Phi(a (x) x) = a^tau (x) phi^0(x), MF^{f,q}_{K/E}, U_{Shat_K}), Proposition 7.17 and its proof (xi, Mhat, xi_n, Prop. 5.15, Ker xi in pi^n M) match the page image of p. 594. The excerpt is literal."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/U-S-K-agrees-with-dual-of-V-B-for-E-equal-Qp",
    "verdict": "corrected",
    "note": "Theorem 8.4(ii), the proof on pp. 595-596 ([F2] Section 4 identifications, [F1] n. 3.2 and Prop. 3.4.3) and Remark 8.5 match the page images. The acceptance said 'the i-th power of the cyclotomic character'. It now says the inertia action is chi^i, with an unramified twist that depends on Phi, and marks this as a check to perform, not a source claim."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fontaine-laffaille-admissibility-for-filtration-length-less-than-p",
    "verdict": "corrected",
    "note": "Statement, hypotheses and imports ([F1] Prop. 4.4.1, tensor stability of MF_{K,B}) match p. 595 and the last paragraph of the proof on p. 596. Proof step 1 now says that the decomposition D = D_1 (x) D_2 is not spelled out, and names Corollary 7.9 and Proposition 7.5(i) as the likely inputs."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/E-coefficient-dictionary-between-MF-K-over-E-and-E-objects-of-MF-K",
    "verdict": "corrected",
    "note": "On the page image of p. 597, the defining condition of MF_{E (x) K/E} is D_K^i = (epsilon D_K)^i (+) epsilon' D_K for i <= 0; the node had dropped the ^i on the first summand. Stability under tensor product (8.8) was added. The functors e, t, the maps xi, eta and the proof of 8.11 match pp. 597-599."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/admissibility-with-E-coefficients-and-comparison-with-V-B",
    "verdict": "corrected",
    "note": "On the zoomed page image of p. 599, 8.12(i) is stated for D in MF^{f,q}_{E(x)K/E}, i.e. with filtration in [0, q-1]. The node claimed B-admissibility for every Delta in MF^f_{K/E}; fixed. The indicated construction uses the bound m q v(p) and the ideal a = {v_R >= q v(p)}, not 'the analogue of S for Q_p'. The 8.13(c) essential-image criterion was added, and a caveat on coefficients."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/finite-honda-systems-and-the-functor-LM-over-W-k",
    "verdict": "corrected",
    "note": "FL 9.1-9.6 (pp. 601-602) match; recalls only. Conrad's Thm 1.4 proof (pp. 10-15) and Cor. 1.8 were read in review. The node now records the proof's imports (Fontaine Ast. 47-48 Ch. III-IV, Raynaud 3.2.1/3.3.2/1.5.1), that FL 9.6 has no p = 2 condition while Conrad's written proof needs p odd or J unipotent (w^c for connected J at p = 2), and Conrad's '[9, Prop 8.10]' slip for FL 9.10."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/honda-systems-are-equivalent-to-MF-tor-f-2",
    "verdict": "corrected",
    "note": "9.7-9.10 match the page images of pp. 602-604. The source's Mbar (inductive limit), which the node had as Mtilde, is now described together with beta_M. M_tau was replaced by the source's M_sigma in the statement and the excerpt. The unwritten check FV = VF = p is noted."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/finite-flat-p-groups-over-W-k-anti-equivalent-to-MF-tor-f-2",
    "verdict": "corrected",
    "note": "9.11 (page image p. 604) matches: ILM, unipotent iff MF_tor^{f,2'}, and both anti-equivalences. Added that 9.11 defines MF_tor^{f,2'} directly (quotients with N = N^1), so it equals 6.1's q' category only at p = 2. The link from the 6.1 restricted-subcategory node was removed as shared vocabulary."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/points-of-a-finite-flat-p-group-equal-U-S-of-its-filtered-module",
    "verdict": "corrected",
    "note": "9.12-9.13 read on page images of pp. 605-606. Recorded: 9.13 cites 'n. 9.7' for the points description (it is 9.6); J(Abar) = J(A_C) is needed since 9.6 needs a complete ring; the extension of I and the MFcal-morphism claim are unwritten; the length identity lg J(Abar) = lg_A M uses order(J) = p^{lg M(J_k)}, an unstated import."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/breuil-divided-power-ring-S-and-breuil-module-categories",
    "verdict": "corrected",
    "note": "Section 1.1 (p. 1090) matches: p != 2, k finite, Scalpha, Fil^1, phi_1, c a unit, the three categories. Fixed: phi_1 is a phi-semilinear map Fil^1 Mcal -> Mcal and the twisting identity holds for s in Fil^1 Scalpha (the node omitted both); excerpt made literal (Fil^1 S 'subset S' elided with [...])."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/breuil-anti-equivalence-for-finite-flat-group-schemes",
    "verdict": "corrected",
    "note": "Theorem 1.1.3 (quoted from [Br3 4.2.1.6, 4.2.2.5], no proof), Lemma 1.1.5 with proof and Cor. 1.1.7 match p. 1091 (page image). Kisin writes Gr_D, Mod_D (subscript), not Gr^D: notation fixed throughout. The p = 2 acceptance item wrongly derived the exclusion from the 2.2.16 footnote; it comes from the Section 1.1 standing assumption."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules-over-S-and-injectivity-of-linearized-frobenius",
    "verdict": "corrected",
    "note": "1.1.8 and Lemma 1.1.9 with proof (p. 1092, page image) match. The acceptance item had etale and multiplicative swapped: by (1.1.16) phi(1) = 1 (1 (x) phi an isomorphism) is multiplicative and phi(1) = u^e (image E(u)M mod p) is etale; fixed."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-to-breuil-module-functor-is-exact-and-fully-faithful",
    "verdict": "corrected",
    "note": "1.1.10 and Prop. 1.1.11 with proof (pp. 1092-1093) match. Fixed: the Tor vanishing in the exactness proof is Tor_1^S(Scalpha, M'') for the quotient M'' (the node wrote M); the Tor_1^S(Scalpha/Fil^1 Scalpha, M) = 0 remark that makes Fil^1 Mcal well defined was added; the [Br5] cross-references recorded."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/galois-module-of-a-kisin-module-over-K-infinity",
    "verdict": "corrected",
    "note": "1.1.12 and Prop. 1.1.13 with proof (pp. 1093-1095, page image of p. 1095) match. Fixed: excerpt made literal (T(O_E (x)_S M)(1) -> Gr_D(...)); imports [Fo, A.Section 1.2], [Fo, A.3.1.6] and Wintenberger added; the acceptance item called S with phi = 1 etale, but by 1.1.16/1.1.15 it is multiplicative (mu_p), rewritten as a consistent check."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-and-multiplicative-kisin-modules",
    "verdict": "corrected",
    "note": "Lemma 1.1.15 with proof and 1.1.16 (pp. 1095-1096) match, including the [BCDT, 5.1.3] import and the embedding Mcal/Fil^1 Mcal -> M/E(u)M. Only change: notation Gr_D (Kisin's subscript) for Gr^D in statement, excerpt and acceptance."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules-with-coefficients-structure-lemmas",
    "verdict": "corrected",
    "note": "1.2.1, Lemmas 1.2.2 and 1.2.3 with proofs (pp. 1096-1097) match (E(u)^r determinant, S/E(u)^r Z_p-flat, A-flatness after (x)_A A/I, Frobenius-transitivity for (4)). The acceptance item about 'a product of fields' misdescribed (4) (which is local on Spec A); rewritten to the rank-equality point the proof actually makes."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/coefficient-functor-to-breuil-modules-and-galois-functor-T-S-A",
    "verdict": "corrected",
    "note": "Lemmas 1.2.4, 1.2.5, 1.2.7 (with (1.2.8) and the [Fo, A.1.2.4(i)] step) and 1.2.9 (pp. 1097-1099) match. The acceptance item attached an unramified character to an etale M; under Kisin's conventions (1.1.13, 1.1.15) that is the multiplicative case, and the etale case carries an inverse cyclotomic twist. Rewritten."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/maximal-multiplicative-subobject-and-maximal-etale-quotient-with-coefficients",
    "verdict": "corrected",
    "note": "1.2.10 and Prop. 1.2.11 with proof (pp. 1099-1101) match. Fixed the u-torsion step: the source's divisibility criterion is for x in M_A^m (via bijectivity of phi^* on M_A^m), not for x in M_A."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-classification-of-p-divisible-groups-for-odd-p",
    "verdict": "corrected",
    "note": "2.2.9-2.2.22 (pp. 1113-1118) match, including the p > 2 restriction of 2.2.16 and footnote 2. Added the standing simplifications of 2.2.16 (common v, F = Q_p, freeness mod u^e). The acceptance check had mu_{p^infinity} and Q_p/Z_p swapped relative to Lemma 1.1.15/Gr_D; rewritten, noting that compatibility of [Br3 4.2.2.9] with Gr at finite level is an unstated import."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules-of-height-one-and-the-functor-T-S",
    "verdict": "verified",
    "note": "Liu Section 1 and 2.1 (pp. 1-4): k perfect of characteristic p, Mod^{1,fr}_{/S}, T_S(M) = Hom_{phi,S}(M, W(R)), rank from [Kis06 2.1.4], full faithfulness from [Kis06 2.1.12] or [Liu07 4.2.6], Remark 2.1.1 via [CL11 2.2.1]. Excerpt literal (p. 4)."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/barsotti-tate-groups-equal-lattices-in-crystalline-representations-with-weights-0-1",
    "verdict": "corrected",
    "note": "Theorem 2.2.1 and its four-import proof (p. 5) match; excerpt literal (including the source's 'induce'). The acceptance item said Kisin 2009a is not in the supplied library, contradicting the gap that places it in the library as an unread DVI; rewritten to 'unread'. Locator 'pp. 5' -> 'p. 5'."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/monodromy-operator-on-the-breuil-module-of-a-kisin-module",
    "verdict": "corrected",
    "note": "Breuil-module definition and Lemma 2.2.3 with proof (pp. 5-7) match. Fixed proof step (2): the x_i lie in (S (x)_{phi,S} M) intersect Fil^1 Mcal with Kisin's Fraktur S (page image p. 7), not in Scalpha (x)_{phi,S} M = Mcal. Recorded that Liu's '(1.1.8) in [Kis09b]' is 1.1.10 in the Annals numbering."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/crystalline-realization-functor-iota-of-a-kisin-module",
    "verdict": "corrected",
    "note": "Construction (2.2.1), Ttilde_cris, the V_st/crystallinity argument, lambda, Prop. 2.2.2 and Remarks 2.2.4-2.2.5 (pp. 5-8) match. Added: the anti-equivalence of Prop. 2.2.2 is not proved in Liu (cited to Kis06 / Theorem 2.1.2); diagram (2.2.2) with lambdahat and its [Liu10 3.2] G-compatibility import, which Theorem 1.0.1's proof uses."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/galois-action-on-T-S-through-J-of-M",
    "verdict": "corrected",
    "note": "Section 3.1 (pp. 8-10): I^[1], t, J'(M), J(M), Props 3.1.1-3.1.2 and Cor. 3.1.3 with proofs match. Acceptance item made precise: the vague 'multiplicative rank-one object' check was replaced by an explicit convention check (S with phi = 1 gives trivial T_S, i.e. Q_p/Z_p under Liu, versus mu_{p^n} under Kisin's Gr_D)."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/u-divisibility-lemma-in-W-R-inside-B-cris-plus",
    "verdict": "corrected",
    "note": "Lemma 3.2.2 with proof (pp. 12-13) matches, including i_m = 2^m - 1 and v_2((2^m-1)!) = 2^m - m - 1 (acceptance values 0, 1, 4 recomputed). Added the unargued reduction to y = u x_m + p^m z_m and flagged the uncited identity Fil^{i+1}A_cris intersect W(R) = E(u)^{i+1}W(R)."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/G-stability-of-lambda-T-S-inside-T-cris",
    "verdict": "corrected",
    "note": "Prop. 2.3.1 and Section 3.2 with Prop. 3.2.1 and its claim (pp. 8, 10-12) match. Added the [Liu10 3.2] import (compatibility of the Ghat-action with (2.2.1)) used in the claim, and footnote 2. Rewrote the acceptance item, which presupposed that Liu10 needs p > 2 (not stated in the source)."
   },
   {
    "nodeId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/barsotti-tate-groups-equivalent-to-kisin-modules-of-height-one-including-p-2",
    "verdict": "corrected",
    "note": "Theorem 1.0.1 (p. 2) and its assembly in 2.3 (p. 8) match. Added: the equivalence is contravariant (Liu p. 2 calls M -> T_S(M) an anti-equivalence); the [Liu10 3.2] import for essential surjectivity via (2.2.2); Liu's attribution of p > 2 to Kis06 and of the connected p = 2 case to Kis09a."
   }
  ]
 },
 "nodes": {
  "changed": {
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/fundamental-characters-of-a-finite-field": {
    "proofSteps": [
     "Take M = Hom(F^*, mu_{q-1}(D)), a cyclic group of order q-1, and extend characters to F by chi(0) = 0.",
     "(Elementary; Raynaud states the orbit description without proof.) Since k(P) has q elements, a character chi whose reduction F -> k(P) is additive is a field isomorphism F -> k(P); composing with the Frobenius of k(P) gives the other such characters chi^{p^h}, and chi^{p^r} = chi, so the fundamental characters are indexed by Z/rZ with chi_i^p = chi_{i+1}.",
     "(Elementary; Raynaud states (1) and its uniqueness without proof.) Every character of the cyclic group F^* is a power of a fundamental character chi_i; writing the exponent in base p gives the p-adic writing prod_i chi_i^{n_i}, and the only non-uniqueness is n_i = 0 for all i versus n_i = p-1 for all i, both giving chi = 1 because prod_i chi_i^{p-1} = chi_0^{(p-1)(1+p+...+p^{r-1})} = chi_0^{q-1} = 1.",
     "Remark 1.1.2: Gal(C/Q) = (Z/(q-1)Z)^* permutes the places above p, and sigma(P) = P' carries the fundamental characters at P to those at P'."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/F-vector-space-schemes-and-rank-one-eigensheaves": {
    "proofSteps": [
     "Translate the functoriality [1] = id, [lambda] o [mu] = [lambda mu] and the distributivity d o ([lambda] (x) [mu]) o c = [lambda + mu] (formulas (2)-(3), p. 245) into the idempotent decomposition of I, and transport it to the dual bialgebra A'.",
     "Proof of Proposition 1.2.2: I_chi is a direct summand of the locally free module A, hence locally free, of constant rank because S is connected; it suffices to see rank 1 at the given point s.",
     "At s, after replacing G by its Cartier dual and s by a geometric point, G is constant etale over a field k and G(k) is an F-vector space of rank 1 (rank q). A is then the bialgebra of k-valued functions on F, and each I_chi is spanned by e_chi = sum_a chi(a) epsilon_a (computed explicitly in 1.3)."
    ],
    "statement": "For a scheme S, an S-functor in F-vector spaces is a contravariant functor (Sch/S)^op -> (F-vector spaces); when representable it is an S-scheme in F-vector spaces. Assume it is finite, flat and of finite presentation over S. Its underlying commutative group scheme G is killed by p, and the Cartier dual G' = Hom_gr(G, G_m) is an S-scheme in F-vector spaces via (lambda u)(x) = u(lambda x) (the dual of V). The F-structure is equivalent to bialgebra endomorphisms [lambda] of the bialgebra A of G with [1] = id, [lambda] o [mu] = [lambda mu] and d o ([lambda] (x) [mu]) o c = [lambda + mu] (formulas (2)-(3)). Under hypothesis (*), S is a scheme over Spec(D) (notation of 1.1). The endomorphisms i_chi = (1/(q-1)) sum_{lambda in F^*} chi^{-1}(lambda)[lambda], chi in M, are orthogonal idempotents preserving the augmentation ideal I, giving a canonical decomposition I = direct sum over chi in M of I_chi, where I_chi = i_chi(I) is the set of a with [lambda]a = chi(lambda)a for all lambda in F^* (the printed display has a tensor sign where a direct sum is meant). This makes A an M-graded bialgebra. Condition (**) requires each I_chi to be an invertible O_S-module; A then has constant rank q. Proposition 1.2.2 gives (**) when G is defined by a bialgebra of rank q, S is connected, and some fibre G_s is etale or of multiplicative type. This holds in particular when S is integral with fraction field of characteristic zero."
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/universal-structure-constants-by-gauss-sums": {
    "proofSteps": [
     "Restrict the distributivity (3) to I_chi to obtain (8), then multiply by chi_1^{-1}(lambda) chi_2^{-1}(mu) and sum over lambda, mu in F^* to obtain (9) and the three cases (10), (10 bis), (10 ter).",
     "Section 1.3: for the constant group G on F^+ over D, the characteristic functions epsilon_a give generators epsilon_chi = sum_a chi(a) epsilon_a of I_chi with epsilon_{chi'} epsilon_{chi''} = epsilon_{chi' chi''} (12), hence c(epsilon_chi) = epsilon_chi (x) 1 + 1 (x) epsilon_chi + sum_{chi' chi'' = chi} w_{chi',chi''} epsilon_{chi'} (x) epsilon_{chi''}. The dual A' is the group algebra of F^+ with basis (a) dual to (epsilon_a); I'_chi is generated by e_chi = sum_a chi^{-1}(a) a (chi != 1), e_1 = sum_a a - q 0, and transposition gives (12 bis).",
     "A nontrivial additive character psi defines a Dtilde-morphism of F-vector space schemes G -> G' whose bialgebra map sends e_chi to g(chi) epsilon_chi (13); comparing (12) and (12 bis) gives w_{chi',chi''} = g(chi')g(chi'')/((q-1) g(chi' chi'')) and, with (7), formula (14).",
     "The classical Gauss-sum identities g(chi)g(chi^{-1}) = q chi(-1) ([14] Weil, p. 501) and g(chi^p) = g(chi) ([8] Lang, p. 93) give (15) and (16).",
     "Proof of Proposition 1.3.1: (15) shows w_chi and w are invertible after inverting p (Raynaud: \"inversibles dans le localise de D_1 en (p)\"; q-1 is already invertible in D). The Lie algebra of G' (x) k is Hom_gr(F^+, k^+), whose F^*-eigencharacters are exactly the fundamental characters, so G' (x) k is radicial of height 1, isomorphic to mu_p^r, with A' (x) k generated by the images of e_i subject only to e_i^p = 0. Hence prod_i e_i^{a_i} is nonzero mod p while e_i^p = 0 mod p, which with (12 bis) gives that w_chi is a unit and that w = 0 mod p.",
     "The congruence w_chi = a_1! ... a_r! mod p comes from computing the coefficient of epsilon_{chi_1}^{(x)a_1} (x) ... in the iterated coproduct of epsilon_chi, using c(epsilon_{chi_i}) = 1 (x) epsilon_{chi_i} + epsilon_{chi_i} (x) 1 mod p. The same computation for epsilon_{chi_i}^p gives w = p! mod p^2, and (p-1)! = -1 mod p gives u = -1 mod p."
    ],
    "statement": "For G satisfying (**) and characters chi_1, ..., chi_n in M, the composite d_{chi_1,...,chi_n} o c_{chi_1,...,chi_n} of iterated multiplication and comultiplication on the invertible sheaf I_{chi_1...chi_n} is multiplication by a universal constant w_{chi_1,...,chi_n} in D, independent of G. These constants satisfy the associativity formula (7). For two characters, (10) gives w_{chi_1,chi_2} = ((chi_1 chi_2)(-1)/(q-1)) j(chi_1^{-1}, chi_2^{-1}) when chi_1, chi_2 are nontrivial, where j is the Jacobi sum; (10 bis) and (10 ter) give w_{1,chi} = w_{chi,1} = w_{1,1} = -q/(q-1). Comparison with the constant group of F^+ and its Cartier dual gives (14): w_{chi_1,...,chi_n} = (1/(q-1)^{n-1}) g(chi_1)...g(chi_n)/g(chi_1...chi_n), where g(1) = -q and g(chi) = sum_{a in F} chi^{-1}(a) psi(a) is the Gauss sum for a nontrivial additive character psi. Consequently (15) w_{chi_1,...,chi_n} w_{chi_1^{-1},...,chi_n^{-1}} = (q/(q-1)^2)^{n-1} when all chi_j are nontrivial (Raynaud's hypothesis; by (14) and g(1) = -q the formula also needs chi_1 ... chi_n != 1: for n = 2, chi_2 = chi_1^{-1} != 1 the product is 1/(q-1)^2), and (16) w is invariant under chi -> chi^p, so the constants lie in the Frobenius-invariant subring D_1. Proposition 1.3.1: (1) for chi = prod_i chi_i^{a_i} written p-adically (0 <= a_i <= p-1, not all zero), w_chi := w_{chi_1,...,chi_1,...,chi_r,...,chi_r} (chi_i repeated a_i times) is a unit of D_1 with w_chi = a_1! ... a_r! (mod p); (2) w := w_i = d_i o c_i, the constant for chi_i^p = chi_{i+1} (independent of i by (16)), satisfies w = p! (mod p^2) and w = p u with u a unit of D_1, u = -1 (mod p).",
    "hypotheses": [
     "G satisfies (**) over a D-scheme S; the constants are computed in D",
     "psi a nontrivial additive character of F with values in mu_p(Dtilde), Dtilde the integral closure of D in C(mu_p); for (16) psi is the trace to Z/pZ followed by a nontrivial character",
     "for (15): every chi_j nontrivial, as printed; the reviewer's check against (14) shows the product chi_1 ... chi_n must also be nontrivial (Raynaud's uses of (15) in Proposition 1.3.1 satisfy this: chi != 1 and chi_i^p = chi_{i+1} != 1)"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/schematic-closure-of-a-generic-subgroup-over-a-dvr": {
    "acceptance": [
     "Over R = Z_p, X = (Z/pZ)_R x (Z/pZ)_R and Y the diagonal subgroup of X_K: check that the closure of Y is the diagonal subgroup scheme of X (finite flat of rank p) and that X/Ybar is isomorphic to (Z/pZ)_R.",
     "The closure of a generic subgroup need not be a direct factor: mu_{p,R} is the closure of mu_{p,K} in mu_{p^2,R} and is not a direct factor; check that it is nevertheless finite flat, as 2.1 asserts."
    ],
    "hypotheses": [
     "R a discrete valuation ring with residue field of characteristic p (standing hypothesis of Sections 2-4, p. 259); the fraction field may have any characteristic, and the argument of 2.1 uses neither restriction; X of finite type over R",
     "for the group statement: X an R-group scheme and Y a closed subgroup of the generic fibre",
     "for the quotient statement: X finite over R"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/partial-order-on-finite-flat-prolongations-and-its-bounds": {
    "proofSteps": [
     "(Expansion; Raynaud asserts uniqueness without argument.) Uniqueness of u and the ring-inclusion criterion: a morphism of flat R-schemes is determined by its generic fibre, since the rings are R-torsion free and embed in A.",
     "Supremum: in G1 x_R G2, with generic fibre G x_K G, take the kernel N of G x_K G -> G, (g, g') -> g - g', and its schematic closure Ncal (node schematic-closure-of-a-generic-subgroup-over-a-dvr). The two projections p1 o i, p2 o i induce the same isomorphism on generic fibres, so Ncal is a finite flat prolongation of G dominating G1 and G2; it is immediately a least upper bound.",
     "Infimum: apply the supremum construction to the Cartier duals, since Cartier duality reverses the domination order."
    ],
    "acceptance": [
     "Over R = Z_2 with G = mu_{2,Q_2} = (Z/2Z)_{Q_2}: the prolongations (Z/2Z)_R and mu_{2,R} satisfy (Z/2Z)_R >= mu_{2,R} (via the homomorphism Z/2Z -> mu_2, 1 -> -1, an isomorphism on generic fibres); check that Cartier duality reverses the order.",
     "Check that the supremum construction produces G1 when G1 >= G2."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/tame-inertia-as-inverse-limit-of-roots-of-unity": {
    "statement": "Let R be a strictly henselian DVR with residue field k of characteristic p, Kbar a separable closure of K, so Gal(Kbar/K) is the inertia group I. There is a canonical exact sequence 0 -> I_p -> Gal(Kbar/K) -> I_t -> 0 with I_p the pro-p wild inertia and I_t the tame quotient of order prime to p. For n prime to p there is a unique subextension K_n of degree n, Galois, with a canonical isomorphism i_n : Gal(K_n/K) -> mu_n(K) characterized by x'^sigma = x' i_n(sigma)^{v'(x')} (1 + u') with v'(u') >= 1 for x' in K_n, v' the normalized valuation of K_n; these are compatible for m | n. Hence I_t is identified with the inverse limit of mu_n(K) over (n, p) = 1 and, via mu_n(K) = mu_n(k) and k_q^* = mu_{q-1}(k) for the subfields k_q with q = p^h elements, with the inverse limit of k_q^* under the norms x' -> x'^{(q'-1)/(q-1)}. j : I_t -> lim k_q^* denotes this identification and j_q : I_t -> mu_{q-1}(k) -> mu_{q-1}(K) the canonical surjection."
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/valuation-analysis-of-F-vector-space-prolongations": {
    "statement": "Let R have mixed characteristic and let Gcal and Gcal' be R-schemes in F-vector spaces of rank q = p^r with the same generic fibre G. By Corollary 1.5.1 they have equations X_i^p = delta_i X_{i+1} (1) and X'_i^p = delta'_i X'_{i+1} (1'), with 0 <= v(delta_i), v(delta'_i) <= e (2), (2'). The generic isomorphism is X'_i = alpha_i X_i with alpha_i in K^* (3), so delta'_i = alpha_i^p delta_i alpha_{i+1}^{-1} (4), and Gcal >= Gcal' iff v(alpha_i) >= 0 for all i (5). Suppose Gcal >= Gcal'. (a) If some alpha_j is not a unit (Gcal > Gcal'), taking i with v(alpha_i) >= 1 maximal gives v(delta'_i) >= p-1, hence e >= p-1. (b) If the alpha_j do not all have the same valuation, some i has v(alpha_i) > v(alpha_{i+1}), so v(delta'_i) >= p and e >= p. Conversely, if v(delta'_i) >= p one may take alpha_i = pi and alpha_j = 1 for j != i, obtaining a prolongation Gcal > Gcal' with sum_j v(delta'_j) > sum_j v(delta_j) (as printed; for r >= 2 this construction also needs v(delta'_{i-1}) <= e-1, since delta_{i-1} = pi delta'_{i-1} must have valuation <= e; Raynaud does not state this, and it does not affect the characterization of the maximum, where other choices of alpha work). (c) If all alpha_j have the same positive valuation and v(delta'_j) <= p-1 for all j, then v(alpha_j) = 1, v(delta_j) = 0 and v(delta'_j) = p-1 for all j. Then Gcal is etale, and if e = p-1 then Gcal' is of multiplicative type.",
    "hypotheses": [
     "R a DVR of mixed characteristic (0, p), e = v(p)",
     "both prolongations are R-schemes in F-vector spaces of rank q with equations of Corollary 1.5.1; this needs R to be a D-algebra (Corollary 1.5.1 is stated over D-schemes). Raynaud uses Corollary 1.5.1 in 3.3 without restating this; it holds after strict henselization (Example (a) of 1.2), which does not change e"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/maximal-prolongation-characterized-by-valuation-bounds": {
    "proofSteps": [
     "By Proposition 3.3.1, G+ is an F-vector space scheme, so it has equations of type (1).",
     "Argue by decreasing induction on sum_j v(delta_j) using cases (a), (b), (c) of the valuation analysis (Raynaud: \"Par recurrence decroissante sur sum_j v(delta_j), les raisonnements precedents entrainent l'assertion 1o\"; the two directions below are the drafter's and reviewer's expansion). A prolongation with some v(delta_i) >= p is strictly dominated (converse in case (b)); one with all v(delta_i) = p-1 is strictly dominated by the prolongation with alpha_j = pi for all j, which has all delta_j units (converse of case (c)). Conversely, if Gcal' satisfies (a) and (b) and Gcal > Gcal', then case (b) is excluded by (a), so the alpha_j have a common positive valuation, and case (c) forces v(delta'_j) = p-1 for all j, contradicting (b)."
    ],
    "hypotheses": [
     "R a DVR of mixed characteristic (0, p)",
     "G a K-scheme in F-vector spaces of rank q with a finite flat prolongation",
     "R a D-algebra, so that the equations (1) of Corollary 1.5.1 exist (implicit in 3.3; true after strict henselization)"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/uniqueness-of-F-vector-space-prolongation-when-e-less-than-p-minus-1": {
    "hypotheses": [
     "R a DVR of mixed characteristic with absolute ramification index e < p-1 (in particular p >= 3)",
     "G a K-scheme in F-vector spaces of rank q with some finite flat prolongation",
     "Raynaud's argument (case (a)) uses the equations of Corollary 1.5.1, hence a D-algebra structure on R; for a general R this is obtained after strict henselization, which preserves e, and the conclusion descends because a morphism of finite flat R-schemes is an isomorphism if it is one after a faithfully flat base change (descent step not written in the source)"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/etale-multiplicative-dichotomy-when-e-equals-p-minus-1": {
    "proofSteps": [
     "Consider G+ and G-, which are F-vector space schemes, and suppose G+ != G-. By cases (a), (b), (c) of the valuation analysis, G+ is etale and G- is of multiplicative type.",
     "Show that any prolongation Gcal equals G+ or G-. Since G+ is etale, R henselian and G simple, G+ (x)_R k is simple (the source prints 'Gcal (x)_R k'; the conclusion drawn, that u (x)_R k = 0 when u : G+ -> G- is not an isomorphism, needs it for G+).",
     "Show that Gcal is of multiplicative type when u (x) k = 0 and Gcal != G+: one may assume R strictly henselian and, by devissage, G of rank p (Raynaud gives no detail; after strict henselization G+ is etale, so G is constant and a successive extension of copies of Z/pZ). Then Gcal is an F_p-vector space scheme which is not etale. Raynaud concludes 'il est de type multiplicatif'; the reason is formula (4) of the valuation analysis with r = 1, delta_Gcal = alpha^{p-1} delta_{G+} with delta_{G+} a unit, so v(delta_Gcal) is 0 or p-1 = e, and exponent e means multiplicative type."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/finite-flat-prolongation-criterion-for-F-vector-space-schemes": {
    "statement": "Let R be strictly henselian of mixed characteristic, with absolute ramification index e, and let G be a K-scheme in F-vector spaces associated with a character psi : mu_{q-1}(K) -> F^*. G prolongs to a finite flat R-group scheme if and only if psi can be written as psi = psi_{i+1}^{n_i} ... psi_{i+r}^{n_{i+r-1}} with 0 <= n_j <= e for all j (the indexing of Theorem 3.4.1, n_j = v(delta_j); Corollary 3.4.4 relabels the exponents n_1, ..., n_r). Remark 3.4.6: if e >= p-1 every K-scheme in F-vector spaces prolongs to a finite R-group scheme, so Theorem 3.4.1 and Corollary 3.4.4 give no information in that range.",
    "sources": [
     {
      "sourceId": "raynaud-1974-schemas-en-groupes-p-p",
      "locator": "Section 3.4, Theorem 3.4.3 with proof and Remark 3.4.6, printed pp. 270-271",
      "excerpt": "THEOREME 3.4.3. - Supposons R strictement hensélien, d'inegales caracteristiques. Soit G un K-schema en F-vectoriels associe a un caractere psi : mu_{q-1}(K) -> F*. Pour que G se prolonge en un R-schema en groupes fini et plat, il faut et il suffit que psi puisse s'ecrire sous la forme psi = psi_{i+1}^{n_i} ... psi_{i+r}^{n_{i+r-1}} avec 0 <= n_j <= e pour tout j.",
      "match": "Literal statement read on a zoomed page image of p. 270: the exponents are printed n_i, ..., n_{i+r-1}, following Theorem 3.4.1 (n_j = v(delta_j)); Corollary 3.4.4 prints n_1, ..., n_r. This is a relabelling, not a misprint. Remark 3.4.6 on p. 271: si e >= p-1, tout K-schema en F-vectoriels fini, se prolonge en un R-schema en groupes fini."
     }
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/absolute-different-and-haar-measures-of-a-finite-flat-group": {
    "proofSteps": [
     "Lemma 1 and Lemma 2: characterize invariant measures by the commutative diagrams for the universal translation and by mu * f = <f, mu> 1 or mu * nu = <1, nu> mu.",
     "Proposition 3 (proof communicated by A. Douady): with theta the trace of A in A' and T the trace of A' in A, <T, theta> = n, because theta is invariant, so the trace of mu -> theta * mu is the trace of mu -> <1, mu> theta, which is <1, theta> = n.",
     "Lemma 4: the elements f with c(f) = 1 (x) f are exactly the constants lambda 1. Since G' is locally a complete intersection (as a subgroup of a smooth group), duality for coherent sheaves (Hartshorne, Residues and Duality [7], III Sections 6-7) makes A = Hom(A', R) locally isomorphic to A' as an A'-module; with Lemma 4 this shows that the invariant measures form an invertible direct summand D.",
     "Lemma 5 (over a field: the smallest translation-stable subspace E containing f is spanned by the a_i in c(f) = sum epsilon_i (x) a_i, which Raynaud calls classical, citing [6] = SGA 2, p. 404; and E = {nu * f}), Lemma 6 (a Haar measure is an A-basis of A') and Lemma 7 (nondegeneracy on D x D').",
     "Application: theta = lambda mu, and by duality for finite locally complete intersection algebras (Tate [13], p. 165) the different is lambda A, so D(G) = lambda R. Intrinsically D(G) is the image of v : D^{(x)-1} -> R dual to u : R -> D, 1 -> theta. Lemma 7 and Proposition 3 give Proposition 9."
    ],
    "hypotheses": [
     "S = Spec(R) affine; G finite, commutative, locally free of rank n over S",
     "no further hypothesis on R is stated in the appendix. Definition 8 and Proposition 9 use Tate's duality for finite locally complete intersection algebras ([13], p. 165) and coherent duality (Hartshorne [7] III Sections 6-7). The lci property of G' is justified only by 'par exemple, parce que G' est un sous-schema en groupes d'un groupe lisse', an embedding result the source neither proves nor cites"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/determinant-of-the-generic-fibre-by-the-tame-different-character": {
    "proofSteps": [
     "Case of an R-scheme in F-vector spaces with equations (1) of 3.3 (q = p^r = p^h): by Theorem 3.4.1 Galois acts on G(Kbar) through psi o j_q with psi = psi_{i+1}^{v(delta_i)} ... psi_{i+r}^{v(delta_{i+r-1})}.",
     "The action on det(G) is therefore Norm_{F/F_p}(psi) = (psi_{i+1} ... psi_{i+r})^{v(delta_i) + ... + v(delta_{i+r-1})} : mu_{q-1}(K) -> F_p^*. Composing psi_{i+1} ... psi_{i+r} with I_t -> mu_{q-1}(K) gives tau_p.",
     "From the equations (1), the relative different of Gcal over R is generated by prod_i delta_i, and so is the absolute different D(Gcal). Hence det(G) is given by tau_p^{v(D(Gcal))}.",
     "General case by devissage along a composition series with F_i-vector space quotients (Corollary 3.3.7, which requires e <= p-1 and itself has no written proof). The devissage needs the determinant character and the valuation of the absolute different to be multiplicative in short exact sequences of finite flat groups. The first is clear. The second, D(Gcal) = D(Gcal') D(Gcal'') for 0 -> Gcal' -> Gcal -> Gcal'' -> 0, is neither stated nor proved in the source: the appendix proves only D(G) D(G') = (n) for the Cartier dual. The source gives the devissage in one word (\"Par devissage (cor. 3.3.7)\")."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/coefficient-setup-and-filtered-dieudonne-modules-over-A": {
    "proofSteps": [
     "0.3: impose K = E K_0 so that tau is defined, and record K^tau = E, A^tau = O.",
     "1.1-1.3: define the tau-twist M_tau (restriction of scalars along tau) and the category MF: A-linear maps phi^i_M : M^i -> M_tau with the square (1) commuting, i.e. phi^i_M restricted to M^{i+1} equals pi phi^{i+1}_M; morphisms are A-linear, filtration-compatible and commute with the phi^i (diagram (2)).",
     "1.4(b): the compatibility phi^i_M|_{M^{i+1}} = pi phi^{i+1}_M says exactly that the phi^i_M pass to the inductive limit Mbar of diagram (3), giving a single map phi_M : Mbar -> M_tau.",
     "1.5: define MF_tor by finite length and the surjectivity condition sum Im phi^i_M = M."
    ],
    "statement": "Let K be a complete discretely valued field of characteristic 0 with perfect residue field k of characteristic p, K_0 = Frac W(k), and e = [K : K_0]. Let E be a finite extension of Q_p contained in Kbar, with ring of integers O, uniformizer pi and residue field of q = p^r elements. Let E_0 = Frac W(F_q), and assume the canonical map E (x)_{E_0} K_0 -> K is an isomorphism, i.e. K = E K_0, e = [E : E_0], and pi is also a uniformizer of the ring of integers A of K. Let tau be the continuous E_0-automorphism of K = E (x)_{E_0} K_0 given by tau(x (x) a) = x (x) sigma^r(a), so that K^tau = E, A^tau = O and tau acts on k by x -> x^q. An (A, tau, pi)-filtered Dieudonne module is an A-module M with a decreasing, exhaustive, separated filtration (M^i)_{i in Z} by A-submodules and for each i an A-linear map phi^i_M : M^i -> M_tau (equivalently a tau-semilinear map M^i -> M), such that the square (1) commutes, i.e. phi^i_M(x) = pi phi^{i+1}_M(x) for x in M^{i+1}. Morphisms are A-linear maps compatible with the filtrations and the phi^i. The resulting category MF is additive and O-linear. Equivalently (1.4(b)), an object is a filtered module (an object of Fil_A) together with an A-linear map phi_M : Mbar -> M_tau, where Mbar is the inductive limit of the zigzag diagram (3) in which each M^i maps to M^{i-1} by the inclusion and to (another copy of) M^i by multiplication by pi; the phi^i_M pass to this limit exactly because (1) commutes. MF_tor (written MF^f_tor in the source) is the full subcategory of objects of finite A-length with sum_i Im phi^i_M = M_tau (1.5; in the semilinear language of 0.4, sum Im phi^i_M = M). For E = Q_p (so q = p, pi = p, tau = sigma, O = Z_p), this forces e = 1, i.e. K = K_0.",
    "acceptance": [
     "For E = Q_p check that the setup is exactly an absolutely unramified K = K_0 with Z_p-coefficients.",
     "For K ramified (e > 1) the theory applies only after choosing E with e = [E : E_0] containing a uniformizer of K, with coefficients in O and filtration bound q rather than p. Check this against the atlas text of R07.3, which restricts to e = 1.",
     "1.4(a): changing pi to u pi for a unit u of O gives an isomorphic category.",
     "Direction of the compatibility (checked on the page images of p. 550, 0.4, and p. 554, diagram (1)): phi^i_M(x) = pi phi^{i+1}_M(x) for x in M^{i+1}; e.g. for W_K(R) with phi^i = pi^{-i} Phi (2.6) one has pi^{-i} Phi(x) = pi . pi^{-(i+1)} Phi(x). The draft had the indices reversed."
    ],
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Introduction 0.1 and 0.3, printed pp. 547-549; Section 1.1-1.5, printed pp. 554-555",
      "excerpt": "On suppose que l'homomorphisme canonique de E (x)_{E_0} K_0 dans K est un isomorphisme (ce qui revient a dire que K = E K_0, ou que e = [E : E_0], ou encore que pi est aussi une uniformisante de A).",
      "match": "Literal hypothesis of 0.3 (p. 549, accents dropped). The definition of the (A, tau, pi)-filtered Dieudonne module (1.2) and of MF_tor (1.5: finite length and sum Im phi^i_M = M) are transcribed from pp. 554-555. Review: the compatibility phi^i_M(x) = pi phi^{i+1}_M(x) (x in M^{i+1}) was read on the page images of p. 550 (0.4) and p. 554 (1.2, diagram (1)); diagram (3) of 1.4(b) and the notation Mbar on the page image of p. 555."
     }
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/torsion-filtered-modules-form-an-abelian-artinian-category": {
    "proofSteps": [
     "Lemma 1.7: with M^j = M and M^{f+1} = 0, the exact sequence 0 -> direct sum_{i=j+1}^{f} M^i -> direct sum_{i=j}^{f} M^i -> Mbar -> 0 (4) gives lg Mbar = lg M^j = lg M.",
     "Proposition 1.6: (i) <=> (ii) is the definition; since lg Mbar = lg M_tau, surjectivity, injectivity and bijectivity of phi_M are equivalent.",
     "Lemma 1.9: if y is in M^i intersect L but not in L^i, choose s < i with y in L^s minus L^{s+1}; after multiplying y by a suitable power of pi (as the source does), pi y is in L^{s+1}. The element z with components y at s and -pi y at s+1 has nonzero image in Lbar but zero image in Mbar, contradicting injectivity.",
     "Proof of 1.8 (1.10): (a) the kernel N' with induced filtration and restricted phi is a kernel in MF; a length count via Lemma 1.7 shows 0 -> Nbar' -> Mbar' -> Lbar -> 0 exact, so phi_{N'} is injective and N' is in MF_tor by 1.6.",
     "(b) The image L receives a unique isomorphism phi_L making the diagram commute, so L is a coimage. Injectivity of Lbar -> Mbar and Lemma 1.9 give L^i = L intersect M^i. The cokernel with image filtration is in MF_tor because phi_N is surjective.",
     "(c) Image equals coimage, so MF_tor is abelian; (d) artinian because objects have finite length."
    ],
    "statement": "Let M be a filtered module whose underlying A-module has finite length. Proposition 1.6: M is in MF_tor iff phi_M : Mbar -> M_tau is surjective, iff it is injective, iff it is bijective. Lemma 1.7: lg_A Mbar = lg_A M, where Mbar is the inductive limit of 1.4(b). Lemma 1.9: if (L, (L^i)) is a filtered submodule of a finite-length (M, (M^i)) with Lbar -> Mbar injective, then L^i = M^i intersect L for all i. Proposition 1.8: MF_tor is abelian and artinian, and the kernel (resp. cokernel) of a morphism of MF_tor is also a kernel (resp. cokernel) in MF. Explicitly, a kernel carries the induced filtration, an image carries the filtration L^i = image of M'^i, which coincides with L intersect M^i, and a cokernel carries the image (quotient) filtration. Section 1.11: MF embeds fully faithfully in an abelian O-linear category MFcal whose objects are families (M, M^i, alpha^i, beta^i, phi^i). Kernels and cokernels of morphisms of MF_tor computed in MFcal agree with those in MF_tor, and an extension in MFcal of objects of MF (resp. MF_tor) is again in MF (resp. MF_tor)."
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/filtered-period-ring-S": {
    "statement": "Let C be the completion of Kbar and A_C its ring of integers. R = lim_{x -> x^p} Abar/pAbar, identified with families (x^{(m)})_{m in Z} in A_C with (x^{(m+1)})^p = x^{(m)}; v_R(x) = v(x^{(0)}) with v(p) = 1 is a complete valuation, and R is perfect, and its residue field is identified with the residue field kbar of Abar (2.1). W_A(R) = A (x)_{W(k)} W(R) and W_K(R) = K (x)_{W(k)} W(R); every element of W_A(R) is uniquely sum pi^n [u_n] (2.3). The map theta^0 : W_K(R) -> C, sum pi^n [u_n] -> sum pi^n u_n^{(0)}, is a K-algebra homomorphism ([F2], Prop. 2.4) whose kernel W^1_K(R) is principal, generated by xi_0 = [x_0] + pi for x_0 in R with x_0^{(0)} = -pi. Phi(sum pi^n [u_n]) = sum pi^n [u_n^q] is a tau-semilinear ring automorphism. W_K(R) is a filtered module with W^i_K(R) = W_K(R) for i <= 0, the i-th power of W^1_K(R) for i >= 1, and phi^i = pi^{-i} Phi (2.6). S is the set of sum pi^n [u_n] with v_R(u_{-m}) >= m q v(pi) = m q/e for all m > 0; it is the subring W_A(R)[pi^{-1}[x]] for any x with v_R(x) = q/e. S is a filtered module with S^i = W^i_K(R) intersect {x in S : Phi x in pi^i S} and phi^i_S = restriction of phi^i, compatible with multiplication (S^i S^j in S^{i+j}, phi^{i+j}(xy) = phi^i(x) phi^j(y)). G = Gal(Kbar/K) acts on S commuting with Phi and the filtration, making S an O[G]-module in MF (3.1). Lemma 5.4: S = W_A(R)[pi^{-1} xi_0^q]; for 0 <= i < q, S^i = W^i_K(R) intersect S is the ideal generated by xi_0^i and pi^{-1} xi_0^q; with eta = pi^{-1}[x_0^q] + 1 one has phi^i_S(xi_0^i) = eta^i and phi^i_S(pi^{-1} xi_0^q) = pi^{q-1-i} eta^q."
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/contravariant-torsion-galois-functor-U-S": {
    "proofSteps": [
     "Apply Ext^*(M, -) to (1'). Ext^i(M, S_E) is killed by a power of pi because M is pi-power torsion, while pi acts invertibly on it through S_E; hence it vanishes and the connecting map is an isomorphism (Lemma 3.8).",
     "5.5: since S^i = W^i_K(R) intersect S for i < q, the maps alpha, beta of S_infinity (resp. Stilde) are injective in degrees < q, and for M with M^q = 0 only these degrees matter."
    ],
    "statement": "For M in MF (or in MFcal) the O[G]-action on S makes Ext^i_{MFcal}(M, S) a left O[G]-module, contravariant and O-linear in M, and U_S(M) := Ext^1(M, S). With S_n the cokernel of pi^n on S in MFcal (S_1 = Stilde) and transition maps pi_{S,n} : S_n -> S_{n+1} (diagram (1) of 3.7), set S_infinity = the inductive limit of the S_n and S_E = lim(S -pi-> S -pi-> ...), which is W_K(R) as an object of MF; this gives the exact sequence 0 -> S -> S_E -> S_infinity -> 0 (1'). Lemma 3.8: for every M in MF_tor and every i >= 0, Ext^i_{MFcal}(M, S_infinity) is canonically and functorially Ext^{i+1}_{MFcal}(M, S); in particular U_S(M) = Hom_{MFcal}(M, S_infinity). Proposition 5.5: for M in MF_tor^{f,q}, U_S(M) = Hom_MF(M, T_infinity), where T_infinity is S_infinity with filtration truncated at q; for M in Mtilde^q = MFtilde_tor^{f,q} (objects of MF_tor^{f,q} killed by pi), U_S(M) = Hom_MF(M, Ttilde) and Ext^1_{MFcal}(M, Stilde) = Ext^1_{MFcaltilde}(M, Ttilde), with Ttilde the reduction of S modulo pi with filtration truncated at q (Stilde is the cokernel of pi on S in MFcal, written S-tilde in the source)."
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/simple-objects-of-MF-tor-killed-by-pi": {
    "proofSteps": [
     "4.6-4.7: with d^0(x) the filtration degree and f(x) = phi^{d^0(x)}(xbar), a subspace N is a subobject iff f(N) is contained in N.",
     "Lemma 4.8: for M nonzero of dimension mu there are h with 1 <= h <= mu and x != 0 with f^h(x) = x. Take a relation sum_{j in J} a_j f^j(x) = 0 with (max J, card J) lexicographically minimal; minimality gives 0 in J and d^0 f^{j+s}(x) = i_s for all j in J, so h = gcd(J) is a period of (d^0 f^s(x)). The span N of the f^{hn}(x) (n >= 0) lies in M^{i_0} and meets M^{i_0+1} trivially, so f^h|_N is bijective and tau^h-semilinear. By Jacobson, The Theory of Rings [J1], Th. 15, there are y != 0 in N and a in k with f^h(y) = a y; since k is algebraically closed, rescaling y gives f^h(y) = y.",
     "Lemma 4.9: Hom(M(h'; i'), M(h; i)) != 0 iff some shift m has i_{n+m} = i'_n for all n; and for period exactly h, End(M(h; i)) = F_{q^h} via v.",
     "4.10: for simple M, map M(h; i_0, ..., i_{h-1}) -> M by e_{-n} -> f^n(x) with i_n = d^0 f^{h-n}(x); simplicity and dimension count make it an isomorphism. Simplicity of M(h; i) is then decided by Lemma 4.9 through the period of i."
    ],
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 4.1-4.11 (Proposition 4.4, Lemmas 4.7-4.9, proof 4.10, Remark 4.11), printed pp. 565-570; statement also in 0.7, p. 551",
      "excerpt": "(i) Pour que M(h; i) soit un objet simple de MF_tor, il faut et il suffit que la periode de l'application i soit egale a h [...] (ii) Si M est un objet simple de MF_tor, End(M) est une extension finie de F_q; si h est le degre de cette extension et si l'on choisit un isomorphisme de F_{q^h} sur End(M), il existe une application i : Z/hZ -> Z, de periode h, et une seule, telle que M, muni de l'action de F_{q^h}, soit isomorphe a M(h; i).",
      "match": "Literal statement of the proposition as announced in 0.7, read on the page image of p. 551. The body statement 4.4 (p. 566, page image) is the same for the category Mtilde of objects killed by pi, with the isomorphism chosen from End(M) onto F_{q^h}, and adds in (i) that v is then an isomorphism of F_{q^h} onto End(M)."
     }
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fundamental-characters-of-level-h": {
    "statement": "Assume k algebraically closed. For n prime to p, mu_n(K) is cyclic of order n and reduction modulo the maximal ideal is an isomorphism mu_n(K) -> mu_n(k) (k is algebraically closed, so these roots of unity lie in K). For a uniformizer pi' of K (e.g. pi' = pi) and a root pi_n of X^n = pi' in Kbar, K(pi_n) is the unique extension of K of degree n in Kbar, and eta_n : G -> K^* defined by g(pi_n) = eta_n(g) pi_n is a homomorphism onto mu_n(K), independent of the choice of pi' and of pi_n. For n = q^h - 1, mu_n(k) = F_{q^h}^*, and the fundamental character of level h is chi_h : G -> F_{q^h}^*, the composite of eta_{q^h-1} : G -> mu_{q^h-1}(K) with the canonical isomorphism mu_{q^h-1}(K) -> F_{q^h}^*. 0.8 gives the same character as g -> image in k of g(omega)/omega for omega^{q^h-1} = pi.",
    "acceptance": [
     "Compare with Raynaud 3.1 (FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/tame-inertia-as-inverse-limit-of-roots-of-unity). Raynaud defines i_n by sigma(x') = x' i_n(sigma)^{v'(x')}(1+u') with v'(u') >= 1 (p. 263), which for x' = pi_n with pi_n^n in K gives sigma(pi_n) = i_n(sigma) pi_n, and j_q : I_t -> mu_{q-1}(k) (p. 264, q the size of the finite field). So chi_h is Raynaud's j_{q^h} with values in mu_{q^h-1}(k) = F_{q^h}^*. Checked on the page images of FL p. 570 and Raynaud pp. 263-264.",
     "For q = p, h = 1, K = K_0: chi_1 restricted to inertia is the mod p cyclotomic character omega."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/ext-vanishing-against-reduced-S-for-simple-objects": {
    "proofSteps": [
     "Replace Stilde by Ttilde (Proposition 5.5). Proposition 5.9 identifies Ttilde with the polynomial ring (Abar^v/pi Abar^v)[xi], where Abar^v is the ring of integers Abar of Kbar with A-algebra structure twisted by tau (5.8; as a ring Abar^v/pi Abar^v = Abar/pi Abar) with an explicit filtration and explicit phi^i_T; G acts on Abar^v/pi Abar^v and trivially on xi.",
     "5.10: an extension of M by Ttilde is trivial iff the system (1) u_m in Ttilde^{i_m}, phi^{i_m}_T(u_m) - u_{m-1} = d_{m-1} is solvable for all d; by F_q-linearity of the phi^{i_m}_T (p. 574) reduce to the case where all d_m but one vanish, then compare coefficients of xi^j to reduce to the degree 0 and 1 equations.",
     "Lemma 5.11 for M != M(1; q-1), case (i): i_0 != q-1, or i_1 = 0, or v(dhat) >= q^{-1} v(pi) for a lift dhat of d. Consider the equations (3) pi^{-i_m} X_m^q - X_{m-1} = 0 (m != 1) and pi^{-i_1} X_1^q - X_0 = dhat. Eliminating X_m for m != 0, with i = i_1 + q i_2 + ... + q^{h-2} i_{h-1} + q^{h-1} i_0, gives (4) X_0^{q^h} - pi^i X_0 - pi^i dhat = 0. This has a solution ahat_0 in Abar with v(ahat_0) >= q^{-h}(i v(pi) + v(dhat)), and the valuation estimates show its reduction solves (2).",
     "Case (ii): i_0 = q-1, i_1 != 0 and v(dhat) < q^{-1} v(pi). Choose a' with dhat = pi^{-i_1}(a')^q and change variables, which splits the system into one of type (2) with d replaced by d' (solvable by (i)) and one where the index q-1 moves to i_{-1}. Since M != M(1; q-1), some i_m != q-1, so after finitely many steps case (i) applies.",
     "5.14(i) for M = M(1; q-1): reduce to the congruence (7) modulo pi^{q(q-1)+1} Abar; the polynomial on the left has q(q-1) roots of valuation q^{-1}(q-1)v(pi), whose reductions give solutions.",
     "Printed slip noted in review: 5.9 justifies the extension of rho to S by 'le lemme 5.5'; the relevant statement is Lemma 5.7 (p. 572)."
    ],
    "statement": "Assume k algebraically closed. Let i : Z/hZ -> Z have period h with 0 <= i_n <= q-1 for all n, and M = M(h; i). Then Ext^1_{MFtildecal}(M, Stilde) = 0.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 5.3 (statement) and 5.5-5.11, 5.14(i), printed pp. 570-580",
      "excerpt": "5.3. THEOREME. - Soit i : Z/hZ -> Z une application de periode h telle que 0 <= i_n <= q-1 pour tout n et soit M = M(h; i). Alors : (i) on a Ext^1(M, Stilde) = 0;",
      "match": "Literal statement read on the page image of p. 570 (inequalities verified on the image)."
     }
    ],
    "title": "Theorem 5.3(i): Ext^1(M(h; i), Stilde) = 0 for i of period h with 0 <= i_n <= q-1"
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/rank-one-hom-into-reduced-S-for-simple-objects": {
    "proofSteps": [
     "By 5.10, Hom(M, Ttilde) is the solution set of the system (1) with all d_m = 0, and dimension 1 over F_{q^h} means exactly q^h solutions.",
     "5.11(iii): for d = 0 the terms epsilon(i_n) b_n vanish, reducing to the system (5) a_m in (Abar^v/pi Abar^v)^{i_m}, phi^{i_m}(a_m) = a_{m-1}.",
     "Lemma 5.12 (M != M(1; q-1)): (i) reduction modulo pi is a bijection from the solutions ahat_m in Abar of (5hat) ahat_m^q = pi^{i_m} ahat_{m-1} onto the solutions of (5), by successive approximation modulo pi^{i_m + n + 1}. This uses that not all i_m equal q-1, so some epsilon(i_m) = 0. (ii) Eliminating ahat_m for m != h-1, with mu = i_0 + q i_1 + ... + q^{h-1} i_{h-1}, gives (6) ahat_{h-1}^{q^h} = pi^mu ahat_{h-1}, which has exactly q^h solutions in Abar, each determining exactly one solution of (5hat).",
     "5.14(i) for M = M(1; q-1): for d = 0 the solutions of (7) are the ahat satisfying, for some v in Abar with v^q = v, the congruence (7_v) ahat^q + (-1)^q pi^{q-1} ahat - pi^{q-1} v = 0 mod pi^q Abar; each lifts to a root of (7hat_v) X^q + (-1)^q pi^{q-1} X - pi^{q-1} v = 0, whose q roots have the same reduction mod pi, giving exactly q solutions, one for each v."
    ],
    "statement": "Assume k algebraically closed, i : Z/hZ -> Z of period h with 0 <= i_n <= q-1, M = M(h; i). With the F_{q^h}-structure induced by v : F_{q^h} -> End(M), the F_{q^h}-vector space U_S(M) = Hom_{MFtilde}(M, Stilde) has dimension 1.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 5.3(ii), 5.10, 5.11(iii), Lemma 5.12, 5.14(i), printed pp. 570-580",
      "excerpt": "(ii) le F_{q^h}-espace vectoriel U_S(M) = Hom(M, Stilde) est de dimension 1;",
      "match": "Literal statement read on the page image of p. 570."
     }
    ],
    "title": "Theorem 5.3(ii): U_S(M(h; i)) = Hom(M(h; i), Stilde) is one-dimensional over F_{q^h}"
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/tame-inertia-character-on-U-S-of-simple-objects": {
    "proofSteps": [
     "5.13 (M != M(1; q-1)): a nonzero solution ahat_{h-1} of (6) satisfies ahat_{h-1}^{q^h - 1} = pi^mu, so it is the mu-th power of a (q^h - 1)-th root of pi (the source prints 'racine q^h-ieme', p. 579, a slip), and by the definition of chi_h (5.1), g ahat_{h-1} = chi_h^mu(g) ahat_{h-1} for all g in G.",
     "Reducing modulo pi and viewing a_{h-1} in Abar^v/pi Abar^v gives g a_{h-1} = chi_h^{mu q}(g) a_{h-1}, and for the corresponding solution of (5), g a_m = chi_h^{mu q^{-m}}(g) a_m. The morphism u : M -> Ttilde is u(e_m) = a_m (1 + xi)^{i_m} (5.10 and 5.11(iii)), so (g u)(e_m) = chi_h^{mu q^{-m}}(g) u(e_m).",
     "With the identification v : F_{q^h} -> End(M) (v_a(e_m) = a^{q^{-m}} e_m) this reads g u = chi_h(g)^{i_0 + q i_1 + ... + q^{h-1} i_{h-1}} u.",
     "5.14(ii) for M = M(1; q-1): u is determined by a = a_0 != 0; for the unique v with v^q = v such that the lifts of a solve (7_v), choose a lift ahat solving (7hat_v). For g in G, g ahat again solves (7hat_v), and all its roots have the same reduction mod pi, so g a = a and g u = u = chi_1^{q-1}(g) u, since chi_1 has order q-1."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/length-equality-and-ext-vanishing-against-S-infinity": {
    "proofSteps": [
     "Proposition 3.6 follows from Proposition 4.4 (every simple object is M(h; i) of period h) and Theorem 5.3(i)-(ii) (5.2).",
     "Lemma 3.9 (k algebraically closed): for simple M, Hom(M, S_infinity) = Hom(M, Stilde) since Ker pi on S_infinity is Stilde; for an extension T of M by S_infinity, since M is killed by pi and pi on S_infinity is an epimorphism, the snake lemma makes Ker(pi_T) an extension of M by Stilde, which splits by 3.6, so the extension T splits and Ext^1(M, S_infinity) = 0.",
     "3.10: induction on length using the long exact Ext sequence proves both statements for all M in MF_tor^{f,q} when k is algebraically closed.",
     "3.11: for general k, base change to A' = W(kbar) (x)_{W(k)} A (tau extended by sigma^r (x) tau). The functor M -> A' (x) M is exact and faithful, S' = S, and Hom(M, S_infinity) = Hom(A' (x) M, S'_infinity), so the length statement (and Theorem 3.3) follows from the algebraically closed case."
    ],
    "statement": "Assume k algebraically closed. For every object M of MF_tor^{f,q}, lg_O Hom_{MFcal}(M, S_infinity) = lg_A M and Ext^1_{MFcal}(M, S_infinity) = 0; both conclusions are proved together by induction on length (3.10). For general perfect k, 3.11 transfers only the identification Hom_{MFcal}(M, S_infinity) = Hom_{MFcal'}(A' (x) M, S'_infinity), hence the length equality and Theorem 3.3; the vanishing of Ext^1(M, S_infinity) for non-algebraically-closed k is not stated in the source. Proposition 3.6 (k algebraically closed): for M simple in Mtilde^q, dim_{O/pi} Hom(M, Stilde) = dim_k M and Ext^1(M, Stilde) = 0.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 3.6 (Proposition), Lemma 3.9 and 3.10-3.11, printed pp. 562-565",
      "excerpt": "3.6. PROPOSITION. - Supposons k algebriquement clos. Si M est un objet simple de Mtilde^q, on a dim Hom(M, Stilde) = dim_k M et Ext^1(M, Stilde) = 0.",
      "match": "Literal statement read on the page image of p. 562; the joint induction is in 3.10 (p. 564)."
     }
    ],
    "hypotheses": [
     "k algebraically closed for the joint statement (3.9-3.10); general perfect k only for the Hom/length part (3.11)",
     "M in MF_tor^{f,q} (filtration in [0, q-1])"
    ],
    "title": "For M in MF_tor^{f,q} over an algebraically closed residue field: lg_O Hom(M, S_infinity) = lg_A M and Ext^1(M, S_infinity) = 0 (joint induction)"
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/restricted-subcategories-MF-prime-and-MF-double-prime": {
    "proofSteps": [
     "6.2: the base change M -> A' (x)_A M to an algebraically closed residue field is exact and faithful, so (i) reduces to k algebraically closed.",
     "Lemma 6.3 (k algebraically closed, Ext^1 = Ext^1_{MF^f_tor}, simple M in MF_tor^{f,q}; the proof first shows that the extension is killed by pi): (i) if M != M(1; 0) then Ext^1(M(1; 0), M) = 0; (ii) if M != M(1; q-1) then Ext^1(M, M(1; q-1)) = 0. Both reduce to solving the linear systems epsilon(m) lambda_m^q - lambda_{m-1} = -mu_{m-1} and epsilon'(m) beta_m^q - beta_{m-1} = -gamma_{m-1} in k, where epsilon(m) = 0 if i_m != 0 and 1 if i_m = 0 (resp. epsilon'(m) = 0 if i_m != q-1 and 1 if i_m = q-1).",
     "6.4: it suffices to compare the categories of objects killed by pi (the source reduces to MFtilde_tor^{f,q'} = Mtilde'). There Ext^1_~(M(1; q-1), M(1; q-1)) = 0 (Ext^1_~ = Ext^1 in the category of pi-killed objects), so an object N killed by pi with N^{q-1} = N is a direct sum of copies of M(1; q-1). With Lemma 6.3(ii), Ext^1_~(M, M(1; q-1)) = 0 for every simple M killed by pi, hence by devissage for every object killed by pi. Therefore an object has a Jordan-Hoelder quotient isomorphic to M(1; q-1) iff it has a quotient isomorphic to M(1; q-1), iff it has a nontrivial quotient N with N^{q-1} = N. The Jordan-Hoelder condition is visibly stable under subobjects, quotients and extensions, which gives (i) for MF_tor^{f,q'}. The case of MF_tor^{f,q''} and M(1; 0) is only asserted: \"On montre de maniere analogue\"."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/endpoint-collision-of-rank-one-objects-M1-0-and-M1-q-minus-1": {
    "acceptance": [
     "Check that the collision is exactly what MF_tor^{f,q'} (excluding M(1; q-1) quotients) and MF_tor^{f,q''} (excluding M(1; 0) subobjects) remove.",
     "For q = 2 (e.g. E = Q_2): M(1; 0) and M(1; 1) collide, so among the intervals [0, j] only [0, 0] avoids the collision."
    ],
    "hypotheses": [
     "objects of MF_tor^{f,q}; 0.9 states the collision with no restriction on k",
     "the character computation through Theorem 5.3 assumes k algebraically closed (G is then the inertia group)"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/full-faithfulness-of-U-S-on-MF-prime": {
    "proofSteps": [
     "6.2: reduce to k algebraically closed. Over A' = W(kbar) (x) A, Hom_MF(M, N) = (Hom_{MF'}(A' (x) M, A' (x) N))^G and U_S(M) = U_{S'}(A' (x) M); faithfulness forces a Galois-equivariant morphism upstairs to be G-invariant.",
     "6.5: U_S is exact and faithful (the source prints 'theoreme 4.3', p. 584; the result meant is Theorem 3.3). For simple objects, Hom(M, N) = 0 if M != N and End(M(h; i)) = F_{q^h}; Theorem 5.3 gives the same for the Galois modules inside MF_tor^{f,q'}. By induction on lengths and long exact Ext sequences, it suffices that Ext^1_{MFcal}(M, N) -> Ext^1_{O[G]}(U_S(N), U_S(M)) is injective for simple M, N; extensions not killed by pi have Galois modules not killed by pi, hence nonsplit, so what remains is Proposition 6.6: injectivity of Ext^1 in the category of pi-killed objects into Ext^1_{F_q[G]}(U_S(N), U_S(M)).",
     "Proposition 6.7: for M in MFtilde_tor^{f,q'} (killed by pi) with H the kernel of the G-action on U_S(M) and L inside Kbar, U_{S,L}(M) = U_S(M) iff L contains Kbar^H. The proof induces on length using Lemma 6.8, a Hensel-type lifting of solutions of the congruence system (1) to equations in Abar, which needs M(h; i) != M(1; q-1) so that some epsilon(i_m) = 0.",
     "Proposition 6.10: with L the maximal tamely ramified extension, U_{S,L}(M) = U_S(M) iff M is semisimple. T_L contains T_{L,ss}, spanned by the omega_rho, which is a direct sum of one representative of each simple object, and Hom(M, Theta_L) = 0 for the quotient Theta_L.",
     "6.11: if 0 -> N -> A -> M -> 0 with M, N simple has split Galois sequence, then H = Gal(Kbar/L) acts trivially on U_S(A) (Proposition 6.10 for M and N), so U_S(A) = U_{S,L}(A) (Proposition 6.7), so A is semisimple (Proposition 6.10) and the extension splits. This is Proposition 6.6 for MF_tor^{f,q'}."
    ],
    "acceptance": [
     "E = Q_p: two objects with filtration in [0, p-2] have all quotients N with N^{p-1} = 0, so they lie in MF_tor^{f,p'} and the theorem applies without further restriction.",
     "Check Remark 6.13(a): on semisimple objects U_S gives an anti-equivalence onto semisimple Galois modules, but it is not essentially surjective in general (Ext^1 of M(1;0) by itself vanishes in the category of pi-killed objects, while Ext^1_{F_q[G]}(F_q, F_q) != 0)."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/full-faithfulness-of-U-S-on-MF-double-prime": {
    "proofSteps": [
     "Source status: the reduction steps 6.2 and 6.5 are common to both categories. Proposition 6.6 is proved only for MF_tor^{f,q'}; for MF_tor^{f,q''} the authors give only indications (6.12).",
     "First indicated method: check by direct computation that Ext^1_~(M(1; q-1), N) -> Ext^1_{F_q[G]}(U_S(N), F_q) is injective for simple N != M(1; 0), M(1; q-1); in the other cases both objects lie in MF_tor^{f,q'} or the Ext group vanishes.",
     "Second indicated method: use the A-submodule S'' of W_K(R) of the sum pi^n [u_n] with v_R(u_{-m}) > m q v(pi) for m >= 0, a filtered submodule of S. For M in MF_tor^{f,q''} one has Hom(M, S/S'') = Ext^1(M, S/S'') = 0, so U_S(M) = Ext^1(M, S''), and the arguments of 6.7-6.11 are to be repeated with S''."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/subinterval-0-to-q-minus-2-lies-in-MF-prime": {
    "statement": "Let M be an object of MF_tor^{f,q} with M^{q-1} = 0 (filtration jumps in [0, q-2]). Then M lies in MF_tor^{f,q'}. Hence U_S is fully faithful on the full subcategory of such objects; for E = Q_p this is the range [0, p-2], and when q = 2 (e.g. E = Q_2) the range [0, 0]."
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/weakly-admissible-filtered-modules-with-E-coefficients": {
    "statement": "MF_{K/E}: K-vector spaces Delta (not required to be finite dimensional; the period object Shat_K of 7.16 is an object of MF_{K/E}) with a bijective tau-semilinear Phi and a decreasing, exhaustive, separated filtration by K-subspaces; morphisms are K-linear maps commuting with Phi and respecting filtrations. It is E-linear but not abelian; it has finite limits and colimits, so kernels, cokernels, strict morphisms and exact sequences of strict morphisms make sense (7.1). It has tensor product, internal Hom, duals and a unit (7.2), and for E = Q_p it is Fontaine's MF_K of [F1] 1.2. Invariants of a finite-dimensional Delta (7.3): t_H(Delta) = i for a line with Delta^i = Delta, Delta^{i+1} = 0; t_N(Delta) = v_pi(a) for a line with Phi d = a d (v_pi(pi) = 1); both extended by top exterior powers and additive in short exact sequences. MF^f_{K/E} consists of the finite-dimensional Delta with t_H(Delta) = t_N(Delta) and t_H(Delta') <= t_N(Delta') for every Phi-stable subspace Delta' with induced structure. Proposition 7.5: MF^f_{K/E} is abelian, with kernels and cokernels computed in MF_{K/E}; it is stable under duals; a subobject (resp. quotient) of an object of MF^f_{K/E} lies in it iff t_H = t_N for it; and two-out-of-three holds for short exact sequences.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 7.1-7.6 (definitions, invariants t_H and t_N, Proposition 7.5, Remark 7.6), printed pp. 590-591",
      "excerpt": "7.4. Nous notons MF^f_{K/E} la sous-categorie pleine de MF_{K/E} formee des objets Delta, de dimension finie comme K-espaces vectoriels, qui verifient t_H(Delta) = t_N(Delta) et, pour tout sous-objet Delta' de Delta, t_H(Delta') <= t_N(Delta')",
      "match": "Literal definition read on the page image of p. 591 (the text layer drops the inequality sign; the image shows t_H(Delta') <= t_N(Delta')). The definition of MF_{K/E} (p. 590) imposes no finiteness on Delta. Proposition 7.5 is deferred to [F1] Proposition 4.2.1."
     }
    ],
    "hypotheses": [
     "tau is the E_0-automorphism of K = E (x)_{E_0} K_0 fixed in 0.3 (tau x = x^q on k); t_H and t_N are defined only for finite-dimensional Delta",
     "Proposition 7.5 and Remark 7.6 are transferred from [F1] (E = Q_p, k algebraically closed); the authors say the proofs extend without difficulty and do not write them"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/strongly-divisible-lattices-exist-iff-weakly-admissible": {
    "proofSteps": [
     "Reduce to Delta with slopes >= 0 (\"On se ramene immediatement\"; slopes are defined through Remark 7.6, which assumes k algebraically closed; the reduction is not written).",
     "For E = Q_p this is Laffaille, Groupes p-divisibles et modules filtres: le cas peu ramifie [L1], Theorem 3.2. The authors state that the proof extends by replacing F with Phi and p with pi; it is not reproduced.",
     "7.9: M_1 (x) M_2 is strongly divisible in Delta_1 (x) Delta_2."
    ],
    "statement": "A lattice M of Delta in MF_{K/E} (finitely generated A-submodule with K (x) M = Delta), with M^i = M intersect Delta^i, is strongly divisible if sum_i pi^{-i} Phi(M^i) = M. Proposition 7.8: a finite-dimensional Delta in MF_{K/E} admits a strongly divisible lattice iff Delta is in MF^f_{K/E}. In that case a lattice M is strongly divisible iff Phi(M^i) is contained in pi^i M for all i in Z (equivalently, sum_i pi^{-i} Phi(M^i) is contained in M). Corollary 7.9: MF^f_{K/E} is stable under tensor product (M_1 (x)_A M_2 is a strongly divisible lattice of Delta_1 (x) Delta_2). Remark 7.10(a) (stated): MF^f_{K/E} is Tannakian. Remark 7.10(b): for Delta in MF^f_{K/E}, every lattice M of Delta is contained in a smallest strongly divisible lattice and contains a largest one (the intersection, resp. union, of the strongly divisible lattices containing, resp. contained in, M)."
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/lattice-objects-and-their-torsion-reductions": {
    "proofSteps": [
     "7.12: forward construction (induced filtration, phi^i_M = pi^{-i} Phi on M^i) and inverse construction: M_K = K (x)_A M with the filtration obtained by extension of scalars, Phi(a (x) x) = pi^i a (x) phi^i_M(x) for a in K and x in M^i (independent of i; phi^i_M(x) lies in M_tau, so Phi is tau-semilinear), and M identified with a lattice of M_K by x -> 1 (x) x. The source calls the two constructions clearly functorial and mutually inverse.",
     "Remark 7.13 is stated without proof. 7.14 asserts (\"On voit\") that M = lim M_n and that the M_n lie in MF_tor^{f,q} when M^0 = M and M^q = 0."
    ],
    "statement": "MF^{fd}_{K/O} (7.11) has objects (Delta, M) with Delta in MF^f_{K/E} and M a strongly divisible lattice of Delta; a morphism (Delta, M) -> (Delta', M') is a morphism Delta -> Delta' whose underlying K-linear map sends M into M'. It is additive and O-linear; (Delta, M) -> Delta is O-linear, exact and faithful, and Hom(Delta, Delta') = E (x)_O Hom((Delta, M), (Delta', M')). The functor (Delta, M) -> M, with M^i = M intersect Delta^i and phi^i_M(x) = pi^{-i} Phi(x) for x in M^i, identifies MF^{fd}_{K/O} with the full subcategory of MF of objects finitely generated over A satisfying (fd)_1 M torsion free, (fd)_2 each M^i a direct factor of M, and (fd)_3 sum_i Im phi^i_M = M_tau (7.12). Remark 7.13, for M in MF finitely generated over A: (fd)_1 holds iff pi_M is a monomorphism of MFcal; (fd)_2 holds iff the cokernel of pi_M in MFcal is still a filtered module (an object of MF); given (fd)_1, (fd)_3 holds iff that cokernel is an object of MF^f_tor. 7.14: for M in MF^{fd}_{K/O} and n >= 1 let M_n = Coker pi^n_M; then M = lim M_n, and if M^0 = M and M^q = 0 the M_n are objects of MF_tor^{f,q}.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 7.11-7.14, printed pp. 592-593",
      "excerpt": "On a ainsi obtenu un objet de MF dont le A-module sous-jacent est de type fini et qui verifie : (fd)_1 le A-module sous-jacent M est sans torsion; (fd)_2 pour tout i in Z, M^i est facteur direct de M; (fd)_3 on a sum Im phi^i_M = M_tau.",
      "match": "Literal passage read on the page images of pp. 592-593. The text layer garbles the subscripts; the image shows M_tau in (fd)_3 and MF^f_tor in the third item of Remark 7.13."
     }
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/lattice-functor-U-S-is-exact-faithful-and-rank-preserving": {
    "proofSteps": [
     "7.14: the assertions on U_S(M_n) are stated (\"On voit\"). They follow from Theorem 3.3(i) (lengths) and Remark 3.4 (M and U_S(M) have the same invariant factors) applied to M_n, and the limit is taken over the epimorphisms U_S(M_{n+1}) -> U_S(M_n). The authors state that Proposition 7.15 \"results from Theorems 3.3 and 6.1\" and write no further proof."
    ],
    "statement": "Let MF^{fd,q}_{K/O} be the full subcategory of MF^{fd}_{K/O} of the M with M^0 = M and M^q = 0, and Rep^{lf}_O(G) the category of finite free O-modules with continuous linear G-action. For M in MF^{fd,q}_{K/O} with reductions M_n (objects of MF_tor^{f,q}), each U_S(M_n) is a free O/pi^n O-module of rank h = rank_A M, identified with Hom_MFcal(M_n, S_n) = Hom_MFcal(M, S_n), where S_n = Coker pi^n_S (3.7). Multiplication by pi gives monomorphisms M_n -> M_{n+1}, hence epimorphisms U_S(M_{n+1}) -> U_S(M_n); lim U_S(M_n) is a free O-module of rank h with continuous linear G-action, identified with U_Shat(M) = Hom_MFcal(M, Shat), where Shat is the p-adic separated completion of S. The resulting contravariant additive functor U_Shat : MF^{fd,q}_{K/O} -> Rep^{lf}_O(G) is exact (in an evident sense) and faithful, with rank_O U_Shat(M) = rank_A M (Proposition 7.15(i)).",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 7.14 and Proposition 7.15(i), printed pp. 593-594",
      "excerpt": "7.15. PROPOSITION. - (i) Le foncteur U_Shat est exact (en un sens evident) et fidele et, pour tout objet M de MF^{fd,q}_{K/O}, rg_O U_Shat(M) = rg_A M.",
      "match": "Literal statement read on the page image of p. 593. The text layer garbles the category and functor names; the image shows MF^{fd,q}_{K/O} and U_Shat. Part (ii) was read on the page image of p. 594."
     }
    ],
    "hypotheses": [
     "M in MF^{fd}_{K/O} (a strongly divisible lattice object) with M^0 = M and M^q = 0"
    ],
    "title": "Proposition 7.15(i): U_Shat on strongly divisible lattices MF^{fd,q}_{K/O} is exact, faithful, and preserves rank"
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/lattice-functor-full-faithfulness-on-restricted-reductions": {
    "proofSteps": [
     "Stated as a consequence of Theorems 3.3 and 6.1 (sentence before 7.15). The derivation is not written in the source: the exact sequences 0 -> M_n -> M_{n+1} -> M_1 -> 0 (multiplication by pi) and Theorem 6.1(i) (an object of an exact sequence in MF_tor^{f,q} lies in MF_tor^{f,q'}, resp. q'', iff its sub and quotient do) put every M_n in the restricted category once M_1 is. Theorem 6.1(ii) then gives full faithfulness at each finite level, and passing to the limit gives it for lattices.",
     "The MF_tor^{f,q''} half inherits the incomplete proof of Theorem 6.1(ii) for MF_tor^{f,q''}."
    ],
    "statement": "The restriction of U_Shat to the full subcategory of MF^{fd,q}_{K/O} of the objects M such that M_1 = Coker pi_M is an object of MF_tor^{f,q'} (resp. of MF_tor^{f,q''}) is fully faithful.",
    "acceptance": [
     "Remark 7.18(b): the rational functor U_{Shat_K} is fully faithful. Its restrictions to MF^{f,q'}_{K/E} and MF^{f,q''}_{K/E} follow from 7.15(ii). The general case \"can be deduced by looking a little closely at\" the objects of MF_tor^{f,q} killed by pi^2 that are not simultaneously in MF_tor^{f,q'} and MF_tor^{f,q''}; this is only indicated. Remark 7.18(a) announces full faithfulness through Remarks 8.5 (E = Q_p) and 8.13(a) (general E), which rest on Theorem 8.4(ii) and Proposition 8.12."
    ],
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 7.14-7.15(ii), printed pp. 593-594; Remark 7.18(b), p. 594",
      "excerpt": "(ii) La restriction de U_Shat a la sous-categorie pleine de MF^{fd,q}_{K/O} formee des M tels que M_1 = Coker pi_M est un objet de MF_tor^{f,q'} (resp. de MF_tor^{f,q''}) est pleinement fidele.",
      "match": "Literal statement read on the page image of p. 594 (zoomed). The category is the lattice category MF^{fd,q}_{K/O}; the draft excerpt had the rational MF^{f,q}_{K/E}."
     }
    ],
    "hypotheses": [
     "M in MF^{fd,q}_{K/O} whose reduction M_1 = Coker pi_M lies in MF_tor^{f,q'} (resp. MF_tor^{f,q''})"
    ],
    "title": "Proposition 7.15(ii): U_Shat on lattices is fully faithful where M_1 = Coker pi_M lies in MF_tor^{f,q'} (or MF_tor^{f,q''})"
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/U-S-K-agrees-with-dual-of-V-B-for-E-equal-Qp": {
    "acceptance": [
     "Covariance check: U_{S_K} is contravariant and V_B covariant, and the comparison is with the dual V_B^*. For a rank-one D = K d with Phi d = a d and filtration jump i (weakly admissible iff v_p(a) = i), inertia should act on U_{S_K}(D) through the i-th power of the cyclotomic character, not its inverse; the full character differs from chi^i by an unramified character that depends on a. This is consistent with Theorem 5.3(iii) modulo p (chi_1^i on M(1; i)) and with Remark 8.13(c)(i), where chi^i denotes the i-th power of the cyclotomic character. It is a check to perform, not a statement of the source; verify it against the normalization of V_B in [F2] before exporting a Hodge-Tate sign convention."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fontaine-laffaille-admissibility-for-filtration-length-less-than-p": {
    "proofSteps": [
     "By Proposition 7.8 (\"grace a la proposition 7.8\"), write D = D_1 (x) D_2 with D_1 in MF^{f,p}_K and D_2 in MF^f_K of dimension 1. The decomposition is not spelled out. Presumably D_2 is a rank-one weakly admissible object with filtration jump j, and D_1 = D (x) D_2^* is weakly admissible by Corollary 7.9 and Proposition 7.5(i), which rest on 7.8; then D_1^0 = D_1 and D_1^p = 0.",
     "D_1 is B-admissible by the proof of part (ii) (Theorem 8.4(ii) node).",
     "D_2 is B-admissible because it has dimension 1 ([F1], Proposition 4.4.1).",
     "D = D_1 (x) D_2 is B-admissible because MF_{K,B} is stable under tensor product."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/E-coefficient-dictionary-between-MF-K-over-E-and-E-objects-of-MF-K": {
    "statement": "Let MF_{E (x) K} be the category of objects of MF_K with an embedding of E into their endomorphisms, and MF_{E (x) K/E} its full subcategory of objects D with D_K^i = (epsilon D_K)^i (+) epsilon' D_K for i <= 0 and D_K^i = (epsilon D_K)^i for i > 0, where (epsilon D_K)^i = D_K^i intersect epsilon D_K; MF_{E (x) K/E} is stable under the tensor product of MF_{E (x) K} (8.8, stated as easy). Here epsilon is the primitive idempotent of E (x)_{Q_p} K with lambda(epsilon) = 1 for lambda(x (x) a) = x a, and epsilon' = 1 - epsilon. The functors e : MF_{E (x) K/E} -> MF_{K/E} (Delta = epsilon_0 D with Phi = F^r and Delta^i = xi_D^{-1}(D_K^i intersect epsilon D_K)) and t : MF_{K/E} -> MF_{E (x) K/E} (D = Q_p[F] (x)_{Q_p[Phi]} Delta with the transported filtration) are quasi-inverse equivalences.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 8.6-8.11 (Remark 8.7, definitions 8.8-8.10, Proposition 8.11 with proof), printed pp. 596-599",
      "excerpt": "8.11. PROPOSITION. - Le foncteur t : MF_{K/E} -> MF_{E (x) K/E} induit une equivalence entre ces deux categories et e : MF_{E (x) K/E} -> MF_{K/E} est un quasi-inverse.",
      "match": "Literal statement read on the page image of p. 598 (the text layer garbles the functor names); the defining condition of MF_{E (x) K/E} was read on the page image of p. 597."
     }
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/admissibility-with-E-coefficients-and-comparison-with-V-B": {
    "proofSteps": [
     "Source status: \"La demonstration de cette proposition est analogue a celle du theoreme 8.4 qu'elle generalise\"; the source only indicates how to define the comparison map.",
     "Indicated construction: W_{K_0}(R) = K_0 (x)_{W(k)} W(R), and S_0 is the subring of elements sum p^n [u_n] with v_R(u_{-m}) >= m q v(p) for all m > 0 (q, not p). The map tr : W_K(R) = K (x)_{W(k)} W(R) -> W_{K_0}(R), x (x) a -> tr_{K/K_0}(x) a, satisfies tr(S) in S_0 (\"Il est clair\"). It extends to tr : Shat_K -> Shat_{K_0}, and Shat_{K_0} is identified with B^+_a for a = {x : v_R(x) >= q v(p)} ([F2] Section 4). For u in U_{S_K}(Delta), uhat(sum F^i (x) delta_i) = sum F^i(tr(u(delta_i))) commutes with F, and its K-linear extension is compatible with the filtrations of D_K and B^+_{K,a} (\"on verifie\"). Via [F2] Section 4 this gives a homomorphism u -> uhat from U_{S_K}(Delta) to V_B^*(t(Delta)); the source asserts it is injective. Then \"en procedant comme pour le theoreme 8.4\", D = t(Delta) is B-admissible and u -> uhat is an isomorphism."
    ],
    "statement": "Let MF^f_{E (x) K/E} be the objects of MF_{E (x) K/E} whose underlying filtered K-module is weakly admissible, and MF^{f,q}_{E (x) K/E} those with D^0 = D and D^q = 0. Proposition 8.12: (i) for every D in MF^{f,q}_{E (x) K/E}, the underlying object of MF_K is B-admissible; (ii) MF^{f,q}_{E (x) K/E} is the essential image of the restriction of t to MF^{f,q}_{K/E}, and U_{S_K} and V_B^* o t are naturally equivalent functors MF^{f,q}_{K/E} -> Rep_E(G), where V_B^*(t(Delta)) carries the E-structure induced by the embedding of E into the endomorphisms of t(Delta). Remark 8.13: (a) from 8.11 and 8.12, the restriction of Delta_{S_K} to the essential image of U_{S_K} is a quasi-inverse of the fully faithful U_{S_K}; (b) for Delta in MF^{f,q}_{K/E}, U_{S_K}(Delta) is B-admissible, hence Hodge-Tate; (c) (\"On voit facilement\") V in Rep_E(G) lies in the essential image iff its underlying Q_p[G]-module is B-admissible, (i) {v in epsilon V_C | gv = chi^i(g) v for all g} = 0 for i < 0 or i >= q, and (ii) dim_K (epsilon' V_C)^G = dim_C(epsilon' V_C). So the Hodge-Tate weights lie in [0, q-1] along epsilon and are 0 along the other embeddings. For E != Q_p no analogue of Theorem 8.4(i) (filtration length < p with an arbitrary shift j) is stated: part (i) is restricted to filtration in [0, q-1].",
    "acceptance": [
     "Do not use the E-coefficient comparison as a proved input until the analogue of the dimension argument of 8.4 has been written out for E != Q_p.",
     "Do not export 8.12 as a Fontaine-Laffaille theory with arbitrary O-coefficients over an unramified base. Here E is a subfield of K containing a uniformizer, Phi is tau = sigma^r-semilinear, and by 8.13(c) the essential image has Hodge-Tate weights in [0, q-1] only along the distinguished embedding epsilon."
    ],
    "hypotheses": [
     "E general as in 0.3 (E a subfield of K containing a uniformizer of K, K = E K_0, tau = sigma^r, q = #(O/pi))",
     "for (i): D in MF^{f,q}_{E (x) K/E}, i.e. weakly admissible with D^0 = D and D^q = 0; for (ii): Delta in MF^{f,q}_{K/E}",
     "imports: the identification of Shat_{K_0} with B^+_a for a = {x in R : v_R(x) >= q v(p)} ([F2] Section 4), and the admissibility criteria of [F1] used in the proof of Theorem 8.4"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/finite-honda-systems-and-the-functor-LM-over-W-k": {
    "proofSteps": [
     "Source status in Fontaine-Laffaille: 9.1-9.6 are recalls (\"rappels\"), with references to Fontaine [F3] (C. R. Acad. Sci. 280, 1975) and [F4] (Groupes p-divisibles sur les corps locaux).",
     "Written proof, Conrad (Compositio 1999), Section 1, e = 1. Theorem 1.1 (pp. 6-8) shows L/pL -> M/FM is an isomorphism and V is injective on L. Its steps are: a membership criterion in M via w_R; pL = FM intersect L; surjectivity of L[p] (+) ker V -> M[p]; and a length count with exactness of 0 -> M/VM -> M/pM -> M/FM -> 0.",
     "Conrad Theorem 1.4 (proof read in review, pp. 10-15). Step 1: G(S) -> G_k(S_k) is injective for S finite flat; this uses Raynaud 1974 Prop. 3.2.1, Prop. 3.3.2 and Cor. 1.5.1, and fails for mu_2 over Z_2. Step 2: G(S) embeds in the functor of D_k-maps sending L into ker w_S. Step 3: equality for kernels of isogenies of p-divisible groups, using Fontaine's description of torsion points of p-divisible groups ([7] = Asterisque 47-48, Ch. IV Section 1.10 Rems 2-3, Prop. 1.1). Step 4: essential surjectivity, via a resolution 0 -> M_2 -> M_1 -> M -> 0 by Dieudonne modules of p-divisible groups and Fontaine's classification of p-divisible groups over W(k) ([7] Ch. IV Section 1.2 Thm 1). Step 5: full faithfulness. Step 6: the connected case at p = 2 ([7] Ch. IV Prop. 1.4'). Corollary 1.7 (every such G is the kernel of an isogeny of p-divisible groups) and Corollary 1.8 (points on all p-adic A-rings) follow. The p-divisible-group classification and the Dieudonne theory of [7] Ch. III-IV are imported and unread.",
     "SH^f and SH^{f,u} abelian and artinian (asserted in 9.4): Conrad Lemma 1.3 (p. 9) proves this by transport through the equivalence with MF_tor^{f,2} and Fontaine-Laffaille Proposition 1.8. Conrad cites the equivalence as \"[9, Prop 8.10]\"; in the published paper it is Proposition 9.10."
    ],
    "statement": "Let k be perfect of characteristic p, A = W(k), D_k = A[F, V] with FV = VF = p, F a = sigma(a) F, a V = V sigma(a). For a p-group J over k (finite flat commutative of p-power rank), its Dieudonne module M(J) is the D_k-submodule of covectors in CW(O_k(J)) that are primitive for the coproduct, and M is an anti-equivalence from p-groups over k to finite D_k-modules (9.2). A finite Honda system is a pair (L, M) with M a finite D_k-module and L an A-submodule with (SH_1) FM intersect L = pL, (SH_2) L/pL = M/FM, (SH_3) V injective on L; it is unipotent if V is nilpotent on M. These form abelian artinian categories SH^f and SH^{f,u}. For a p-group J over A, L(J) is the kernel of w_{O(J)} restricted to M(J_k) in CW(O(J)_k), and LM(J) = (L(J), M(J_k)) is a finite Honda system. LM is an anti-equivalence from p-groups over A to SH^f if p != 2, and from unipotent p-groups (connected Cartier dual) to SH^{f,u} for every p. For a p-adically separated complete A-algebra S, J(S) is the group of D_k-linear maps M -> CW(S_k) sending L into Ker w_S (9.6). Fontaine-Laffaille 9.6 is stated for every p-group J over A, with no condition at p = 2. Conrad (1999) proves Fontaine's theorem as his Theorem 1.4 (LM fully faithful and essentially surjective for p > 2; LM^u and, adding the connected case, LM^c for all p). His Corollary 1.8 proves the points description on all p-adic A-rings (flat, p-adically separated and complete) for p odd or J unipotent. For p = 2 and J connected he replaces w by a variant w^c, defined with liftings into the augmentation ideal (Step 6).",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 9.1-9.6, printed pp. 600-602",
      "excerpt": "On sait alors (cf. [F3]) que : - si p != 2, LM induit une anti-equivalence entre la categorie des p-groupes finis sur A et SH^f; - pour p quelconque, LM induit une anti-equivalence entre la categorie des p-groupes finis unipotents (i. e. a dual connexe) sur A et SH^{f,u}.",
      "match": "Literal recall from the text layer of p. 602; no proof in this source."
     },
     {
      "sourceId": "conrad-1999-finite-group-schemes-low-ramification",
      "locator": "Section 1: Theorem 1.1 with proof, Definition 1.2, Lemma 1.3, Theorem 1.4 with its proof (Steps 1-6), Corollaries 1.7-1.8, pp. 5-16 of the author copy",
      "excerpt": "Theorem 1.4. If p > 2, then LM is fully faithful and essentially surjective. The same is true for LM^u and LM^c for all p.",
      "match": "Conrad's statement of Fontaine's theorem for A = W(k) (p. 9). Its proof (pp. 10-15: \"The formulation of these steps is due to Fontaine [8]; here, we supply some extra technical details\") was read in review. It imports Fontaine's Asterisque 47-48 ([7]) Ch. III-IV and Raynaud 1974 ([17])."
     }
    ],
    "hypotheses": [
     "k perfect of characteristic p (standing hypothesis 0.1), A = W(k); in Section 9, e = 1, r = 1 (O = Z_p, tau = sigma) and pi = p",
     "p != 2 for the full anti-equivalence; unipotent objects for all p (Conrad adds connected objects for all p)",
     "9.6 (points description) as recalled has no condition at p; its written proof read here (Conrad Cor. 1.8) needs p odd or J unipotent"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/honda-systems-are-equivalent-to-MF-tor-f-2": {
    "proofSteps": [
     "9.7: check that I(L, M) is an object of MF_tor^{f,2}: phi^0(V y) = F V y = p y = p phi^1(V y), and (SH_1), (SH_2) give phi^0(M) + phi^1(M^1) = M.",
     "9.8: the inductive-limit description of Mbar and the bijectivity of phi_M : Mbar -> M_sigma define F and V on M_sigma. FV = VF = p follows from the pushout relations (alpha^0 o beta = p on Mbar) and is not written out in the source.",
     "Proposition 9.9: verify (SH_1') pL is in FM intersect L, (SH_1'') FM intersect L is in pL, (SH_2') M = FM + L, and (SH_3) V injective on L. Each is a short computation with phi^0, phi^1, alpha^0, alpha^1 and phi^0 = p phi^1 on M^1; e.g. for x = phi^1(y), V x = beta_M(alpha^1_M(y)) = y (read on the page image of p. 604).",
     "Proposition 9.10 is stated as immediate from 9.9 and the constructions."
    ],
    "statement": "Assume e = 1, r = 1 (tau = sigma, O = Z_p) and pi = p. Define I : SH^f -> MF_tor^{f,2} by: the A-module of I(L, M) is M_{sigma^{-1}}; the filtration is M for i <= 0, VL for i = 1, 0 for i >= 2; phi^0 = F and phi^1(x) = the unique y in L with x = V y (unique by (SH_3)). For M in MF_tor^{f,2}, 9.8 makes M_sigma a finite D_k-module via F = phi^0_M (= phi_M o alpha^0_M) and V = beta_M o phi_M^{-1}. Here Mbar is the inductive limit of M^0 <- M^1 -> M^1 (inclusion and multiplication by p), phi_M : Mbar -> M_sigma is bijective because M is in MF^f_tor, and beta_M : Mbar -> M is the unique A-linear map with beta_M o alpha^0_M = p on M^0 and beta_M o alpha^1_M = inclusion on M^1. Define H(M) = (L, M_sigma) with L = Im phi^1_M. Proposition 9.9: H(M) is a finite Honda system. Proposition 9.10: I induces an equivalence SH^f -> MF_tor^{f,2} with quasi-inverse H.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 9.7-9.10 (definitions of I and H, Propositions 9.9 and 9.10), printed pp. 602-605",
      "excerpt": "9.9. PROPOSITION. - Soit M un objet de MF_tor^{f,2}. Le couple H(M) = (L, M_sigma), ou M_sigma est le D_k-module fini defini ci-dessus et ou L = Im phi^1_M, est un systeme fini de Honda.",
      "match": "Literal statement read on the page image of p. 604 (the draft excerpt had M_tau; in Section 9, tau = sigma and the source writes M_sigma). The definition of the filtration of I(L, M) (M for i <= 0, VL for i = 1, 0 for i >= 2) is on p. 602, and the maps alpha, beta_M of 9.8 on p. 603."
     }
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/finite-flat-p-groups-over-W-k-anti-equivalent-to-MF-tor-f-2": {
    "statement": "Composing LM with I gives the contravariant additive functor ILM from p-groups over A = W(k) to MF_tor^{f,2}. Here MF_tor^{f,2'} is defined directly in 9.11 as the full subcategory of MF_tor^{f,2} of objects with no nontrivial quotient N such that N = N^1. For p = 2 (q = 2) it coincides with the category MF_tor^{f,q'} of Theorem 6.1; for odd p it does not, since 6.1 then uses N = N^{p-1}. A finite Honda system (L, M) is unipotent iff I(L, M) lies in MF_tor^{f,2'} (\"on voit facilement\"; not written). Consequently: if p != 2, ILM is an anti-equivalence between p-groups over A and MF_tor^{f,2}; for every p, ILM is an anti-equivalence between unipotent p-groups over A and MF_tor^{f,2'}."
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/points-of-a-finite-flat-p-group-equal-U-S-of-its-filtered-module": {
    "proofSteps": [
     "9.12: define CW_{-1}(Abar/pAbar) as CW(Abar/pAbar) modulo Ker V, the map theta_0(x) = sum_{n >= 1} p^{-n} xhat_{-n}^{p^n} into Kbar/Abar, and a filtered module structure with filtration CW_{-1} for i <= 0, Ker theta_0 for i = 1, 0 for i >= 2, phi^0 = F, and phi^1 defined via the lift xhat_0.",
     "Identify CW_{-1}(Abar/pAbar) with BW(R)/BW_a(R), and via [F2] Section 6 (BW(R) in B^+_a = Shat_K, Shat intersect BW(R) = BW_a(R)) view it as a sub-object of T_infinity = Shat_K/Shat.",
     "9.13: by the points description (the source says \"D'apres le n. 9.7\", a slip for 9.6), J(Abar) = J(A_C), with A_C the completion of Abar, is the group of D_k-linear maps M(J_k) -> CW(Abar/pAbar) sending L into Ker w_{A_C}. \"En etendant convenablement la definition du foncteur I\" (not written), I(ker w_{A_C}, CW(Abar/pAbar)) is CW_{-1}(Abar/pAbar), so J(Abar) = Hom_MF(ILM(J), CW_{-1}(Abar/pAbar)). The inclusion of CW_{-1}(Abar/pAbar) into S_infinity (T_infinity = Shat_K/Shat in 9.12) is a morphism of MFcal (\"Il est facile de voir\"), so this is a submodule of Hom_MFcal(M, S_infinity) = U_S(M) (Lemma 3.8).",
     "Lengths: lg_{Z_p} J(Abar) = lg_A M = lg_{Z_p} U_S(M), so the inclusion is an equality. The second equality is Theorem 3.3(i). The first is used without comment: it needs the order of J to be p^{lg_A M(J_k)} (Dieudonne theory, imported) and J_K to be etale, so that #J(Kbar) is the order of J."
    ],
    "hypotheses": [
     "A = W(k), e = 1; J finite flat commutative of p-power rank; unipotent if p = 2",
     "imports: bivectors BW(R) and their embedding into B^+_a = Shat_K with Shat intersect BW(R) = BW_a(R) ([F4] Ch. V Section 1, [F2] Section 6); the points description 9.6 (written proof: Conrad 1999 Cor. 1.8, p odd or J unipotent); the order of J equal to p^{lg_A M(J_k)} (Dieudonne theory)"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/breuil-divided-power-ring-S-and-breuil-module-categories": {
    "statement": "Kisin 2009 Section 1.1 standing hypotheses: p != 2, k a finite extension of F_p, W = W(k), K_0 = W[1/p], K/K_0 finite totally ramified with uniformizer pi and Eisenstein polynomial E(u) over K_0. Scalpha is the p-adic completion of the divided power envelope of W[u] with respect to the kernel of s : W[u] -> O_K, u -> pi. Fil^1 Scalpha is the p-adic completion of the ideal generated by gamma_i(E(u)) = E(u)^i/i!. phi extends the Frobenius of W with phi(u) = u^p. Since phi(Fil^1 Scalpha) is contained in p Scalpha, one sets phi_1 = p^{-1} phi on Fil^1 Scalpha and c = phi_1(E(u)), a unit of Scalpha. '(Mod/Scalpha) consists of triples (Mcal, Fil^1 Mcal, phi_1): an Scalpha-module Mcal, an Scalpha-submodule Fil^1 Mcal containing Fil^1 Scalpha . Mcal, and a phi-semilinear map phi_1 : Fil^1 Mcal -> Mcal with phi_1(s x) = c^{-1} phi_1(s) phi_1(E(u) x) for all s in Fil^1 Scalpha and x in Mcal. It is an exact category, with sequences exact on modules and on Fil^1. (Mod FI/Scalpha): objects with Mcal isomorphic to a finite direct sum of Scalpha/p^{n_i} and with phi_1(Fil^1 Mcal) generating Mcal. (Mod/Scalpha): the smallest full subcategory containing the p-killed objects of (Mod FI/Scalpha) and closed under extensions.",
    "sources": [
     {
      "sourceId": "kisin-2009-moduli-finite-flat-group-schemes",
      "locator": "Section 1.1, paragraph (1.1.1), printed p. 1090",
      "excerpt": "We fix a finite extension k of F_p, and we assume that p != 2. [...] We denote by S the p-adic completion of the divided power envelope of W[u] with respect to ker(s). Let Fil^1 S [...] be the p-adic completion of the ideal generated by the divided powers gamma_i(E(u)) = E(u)^i/i!.",
      "match": "Literal passage (Breuil's S written Scalpha in this packet; Kisin's Fraktur S = W[[u]] written S), text layer and page image of p. 1090; the inclusion sign after Fil^1 S is elided as [...]."
     }
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/breuil-anti-equivalence-for-finite-flat-group-schemes": {
    "statement": "Assume p != 2 and k finite. Let (p-Gr/O_K) be the category of finite flat group schemes over O_K of p-power order, and (p-Gr/O_K)^fl its full subcategory of G such that every G[p^n] (as an fppf sheaf) is a finite flat group scheme. Theorem 1.1.3 (Breuil): there are quasi-inverse anti-equivalences Gr : (Mod/Scalpha) -> (p-Gr/O_K) and Mod : (p-Gr/O_K) -> (Mod/Scalpha), restricting to anti-equivalences (Mod FI/Scalpha) <-> (p-Gr/O_K)^fl, and preserving short exact sequences. Lemma 1.1.5: Cartier duality D preserves (p-Gr/O_K)^fl. Corollary 1.1.7: Mod_D = Mod o D and Gr_D = D o Gr are equivalences (Mod/Scalpha) <-> (p-Gr/O_K) and (Mod FI/Scalpha) <-> (p-Gr/O_K)^fl.",
    "acceptance": [
     "p = 2 is excluded by the standing assumption of Section 1.1 (\"we assume that p != 2\", p. 1090). Footnote 2 to 2.2.16 (pp. 1115-1116) adds that Breuil introduced these categories hoping to classify p-divisible and finite flat groups when p = 2, and that \"we do not yet have a complete understanding of the precise relationship between these objects when p = 2\".",
     "Check covariance: Gr is contravariant, and Gr_D = D o Gr (Kisin's notation, subscript D) is the covariant version used from 1.1.13 on."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules-over-S-and-injectivity-of-linearized-frobenius": {
    "acceptance": [
     "Check on the rank-one objects S/p with phi(1) = 1 and with phi(1) = u^e that 1 (x) phi is injective. By (1.1.16) the first is multiplicative (1 (x) phi is an isomorphism) and the second is etale (the image is u^e M = E(u) M, since E(u) = u^e mod p)."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-to-breuil-module-functor-is-exact-and-fully-faithful": {
    "proofSteps": [
     "Exactness on modules: for a short exact sequence 0 -> M' -> M -> M'' -> 0 in (Mod/S), Tor_1^S(Scalpha, M'') = 0 (Scalpha regarded as an S-module via phi), because M'' is a successive extension of free S/pS-modules and Scalpha is p-torsion free; so the sequence of Mcal's is exact, and the sequence of Fil^1's is left exact.",
     "Exactness on Fil^1: for surjectivity, alter x in Fil^1 Mcal'' by Fil^1 Scalpha . Mcal'' so that x comes from xtilde in phi^*(M''); since E(u) M surjects onto E(u) M'', Lemma 1.1.9 gives a preimage ytilde in phi^*(M) with (1 (x) phi)(ytilde) in E(u) M.",
     "phi_1(Fil^1 Mcal) generates Mcal because it contains c (x) M.",
     "Equivalence on p-killed objects: \"The proof of [Br4, 3.3.2] shows that our functors induce equivalences\" (imported, not reproduced).",
     "Full faithfulness in general by devissage \"as in [FoL, p. 584]\", using the long exact Hom/Ext^1 sequences available in any exact category ([Qu, 2])."
    ],
    "statement": "Regard Scalpha as an S-algebra via u -> u and let phi : S -> Scalpha be this map composed with phi. For M in (Mod/S) set Mcal = Scalpha (x)_{phi,S} M. Since Tor_1^S(Scalpha/Fil^1 Scalpha, M) = 0, Fil^1 Scalpha (x)_S M is a submodule of Scalpha (x)_S M; set Fil^1 Mcal = {y : (1 (x) phi)(y) in Fil^1 Scalpha (x)_S M} and phi_1 the composite Fil^1 Mcal -> Fil^1 Scalpha (x)_S M -> Scalpha (x)_{phi,S} M = Mcal given by phi_1 (x) 1. Proposition 1.1.11: this induces exact, fully faithful functors (Mod/S) -> (Mod/Scalpha) and (Mod FI/S) -> (Mod FI/Scalpha), which are equivalences on the full subcategories of objects killed by p.",
    "acceptance": [
     "Cross-check the devissage citation \"[FoL, p. 584]\" against Fontaine-Laffaille 6.5 (full faithfulness by devissage to simple objects), node FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/full-faithfulness-of-U-S-on-MF-prime.",
     "Record the cross-references Kisin gives: the construction is \"cf. [Br5, 2.2] and the proof of [Br4, 3.3.2]\" and the proposition \"cf. [Br5, 3.1.3]\"; [Br5] is Breuil's unpublished 1998 preprint Schemas en groupes et corps des normes."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/galois-module-of-a-kisin-module-over-K-infinity": {
    "proofSteps": [
     "Equivalence T : Phi M_{O_E} -> Rep_{Z_p}(G_{K_infinity}) from [Fo, A.1.2.6] and the constructions of [Fo, A.3] (imported).",
     "Since Gr_D(Mcal)(O_Kbar) = Hom(Gr(Mcal)(O_Kbar), Q_p/Z_p(1)), it suffices by [Fo, A.1.2.7] to give a canonical G_{K_infinity}-isomorphism Hom_{S,phi}(M, E^ur/O_{E^ur}) -> Gr(Mcal)(O_Kbar).",
     "By [Fo, B.1.8.4], Hom_{S,phi}(M, S^ur[1/p]/S^ur) -> Hom_{S,phi}(M, E^ur/O_{E^ur}) is an isomorphism, and [Fo, A.Section 1.2] then gives exactness of the left side in M. By [Br2, 2.3.11] and the description of Gr(Mcal)(O_Kbar) in [Br3, 5.3.1], Gr(Mcal)(O_Kbar) = Hom_{Scalpha,phi_1,Fil^1}(Mcal, A_cris[1/p]/A_cris).",
     "The map (1.1.14) f -> (1 (x) phi) o (1 (x) f) between the two Hom groups is compatible and both sides are exact, so by devissage reduce to p M = 0, where it is [Br4, 3.3.2] and its proof."
    ],
    "statement": "Let R = lim O_Kbar/p (Frobenius transitions), theta : W(R) -> O_Cp, A_cris the p-adic completion of the divided power envelope of W(R) along ker(theta), and pi_n compatible p^n-th roots of pi with pibar = (pi_n) in R. u -> [pibar] embeds S into W(R) and extends to Scalpha into A_cris, compatibly with Frobenius. O_E is the p-adic completion of S[1/u], a DVR with residue field k((u)); O_{E^ur} is the ring of integers of its maximal unramified extension inside W(Fr R)[1/p], with completion O_{Ehat^ur}; and S^ur = O_{Ehat^ur} intersect W(R). With K_infinity = union K(pi_n), the functor T : Phi M_{O_E} -> Rep_{Z_p}(G_{K_infinity}), M -> (O_{Ehat^ur} (x)_{O_E} M)^{phi = 1}, from finite etale phi-modules over O_E, is an equivalence of abelian categories. Proposition 1.1.13: for M in (Mod/S) with image Mcal in (Mod/Scalpha) there is a canonical G_{K_infinity}-isomorphism T(O_E (x)_S M)(1) -> Gr_D(Mcal)(O_Kbar)|_{G_{K_infinity}}.",
    "acceptance": [
     "Check the Tate twist on M = S/p with phi(1) = 1: 1 (x) phi is an isomorphism, so M is multiplicative (1.1.16) and Gr_D(Mcal) is of multiplicative type by Lemma 1.1.15; T(O_E (x)_S M) = (O_{Ehat^ur}/p)^{phi=1} = F_p with trivial action, so T(...)(1) = mu_p(Kbar), consistent with Gr_D(Mcal) = mu_p."
    ],
    "sources": [
     {
      "sourceId": "kisin-2009-moduli-finite-flat-group-schemes",
      "locator": "Section 1.1.12 and Proposition 1.1.13 with proof, printed pp. 1093-1095",
      "excerpt": "PROPOSITION (1.1.13). Let M be in (Mod/S), and Mcal in (Mod/S), the image of M under the functor of (1.1.11). There is a canonical isomorphism of G_{K_infinity}-representations T(O_E (x)_S M)(1) -> Gr_D(Mcal)(O_Kbar)|G_{K_infinity}, where, as usual (1), denotes the Tate twist.",
      "match": "Literal statement, checked on the page image of p. 1095 (the displayed formula is T(O_E (x)_S M)(1); the earlier excerpt's T_{O_E}(M)(1) was not literal)."
     }
    ],
    "hypotheses": [
     "p != 2, k finite; K_infinity/K is strictly APF ([Br1, 2.1.1]), which makes Fontaine's theory of the field of norms apply",
     "imports: Fontaine, Representations p-adiques des corps locaux [Fo], A.1.2.6, A.1.2.7, A.Section 1.2 (exactness), A.3, A.3.1.6 (Fr R algebraically closed) and B.1.8.4; Wintenberger [Win] (strictly APF extensions, field of norms); Breuil [Br1, 2.1.1], [Br2, 2.3.11], [Br3, 5.3.1], [Br4, 3.3.2]"
    ],
    "title": "Proposition 1.1.13: T(O_E (x)_S M)(1) is G_{K_infinity}-isomorphic to Gr_D(Mcal)(O_Kbar)"
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-and-multiplicative-kisin-modules": {
    "proofSteps": [
     "By devissage assume p M = 0. By [BCDT, 5.1.3], Gr_D(Mcal) is etale (resp. multiplicative) iff Fil^1 Mcal = Mcal (resp. Fil^1 Mcal = Fil^1 Scalpha . Mcal).",
     "The definition of Fil^1 Mcal gives an embedding Mcal/Fil^1 Mcal -> Scalpha (x)_S M/(Fil^1 Scalpha (x)_S M) = M/E(u)M with image that of phi^*(M) -> M -> M/E(u)M. So Fil^1 Mcal = Mcal iff 1 (x) phi has image E(u)M, and similarly Fil^1 Mcal = Fil^1 Scalpha . Mcal iff 1 (x) phi is an isomorphism."
    ],
    "statement": "For M in (Mod/S) with image Mcal, Gr_D(Mcal) is etale (resp. of multiplicative type) iff 1 (x) phi : phi^* M -> M has image equal to E(u) M (resp. is an isomorphism). Accordingly (1.1.16) M is called etale if the image of 1 (x) phi is E(u) M and multiplicative if 1 (x) phi is an isomorphism.",
    "acceptance": [
     "Note the covariance: with Gr_D (not Gr), an etale Kisin module (image E(u)M) gives an etale group scheme."
    ],
    "sources": [
     {
      "sourceId": "kisin-2009-moduli-finite-flat-group-schemes",
      "locator": "Lemma 1.1.15 with proof and 1.1.16, printed pp. 1095-1096",
      "excerpt": "LEMMA (1.1.15). Let M and Mcal be as in (1.1.13). Then Gr_D(Mcal) is etale (resp. multiplicative), if and only if the map 1 (x) phi : phi^* M -> M has image equal to E(u) . M (resp. is an isomorphism).",
      "match": "Literal statement, text layer of p. 1095."
     }
    ],
    "title": "Lemma 1.1.15: Gr_D(Mcal) is etale (resp. multiplicative) iff the image of 1 (x) phi is E(u)M (resp. 1 (x) phi is an isomorphism)"
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules-with-coefficients-structure-lemmas": {
    "acceptance": [
     "For A a finite field with k (x)_{F_p} A a product of several fields, S_A = (k (x)_{F_p} A)[[u]] has several maximal ideals, so a finite projective S_A-module may have unequal ranks at them; check that injectivity of 1 (x) phi (part (1)) and the transitive Frobenius permutation of the maximal ideals force equal ranks, which is the content of (4)."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/coefficient-functor-to-breuil-modules-and-galois-functor-T-S-A": {
    "acceptance": [
     "Rank-one checks with A = F_p: for a multiplicative M (phi(1) a unit, 1 (x) phi an isomorphism) T_{S,A}(M) is A with an unramified character of G_{K_infinity}; for an etale M (image E(u)M), Proposition 1.1.13 with Lemma 1.1.15 predicts an unramified character times the inverse cyclotomic character, because T(O_E (x)_S M)(1) = Gr_D(Mcal)(O_Kbar) is then unramified."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/maximal-multiplicative-subobject-and-maximal-etale-quotient-with-coefficients": {
    "proofSteps": [
     "Since 1 (x) phi is injective (1.2.2(1)) and phi on S is flat, the iterates 1 (x) phi^r : (phi^*)^r(M_A) -> M_A are injective. Set M_A^m to be the intersection over r >= 1 of (phi^*)^r M_A.",
     "M_A/M_A^m is u-torsion free: since phi^*(M_A^m) -> M_A^m is bijective, the induced map on M_A^m/uM_A^m is bijective, so an element x of M_A^m is divisible by u in M_A^m iff phi^i(x) is for i large; if y in M_A and uy in M_A^m, the phi^i(uy) tend u-adically to 0 in M_A, hence in M_A^m by Artin-Rees, so y is in M_A^m.",
     "Write M_A/uM_A = (M_A/uM_A)^nil (+) (M_A/uM_A)^unit, with phi nilpotent on the first factor and bijective on the second. M_A^m/uM_A^m is identified with the unit part by a convergence argument, so it is a direct summand, projective over S_A/uS_A and then free after localizing. Nakayama gives (S_A)^d = M_A^m.",
     "Base change: M_A/M_A^m is projective over S_A, and the reductions mod u of (M_A/M_A^m) (x) B and M_B/M_B^m are both (M_B/uM_B)^nil of the same B-rank.",
     "Define M_A^et := ((M_A^vee)^m)^vee; duality yields its maximality and (2)-(3)."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-classification-of-p-divisible-groups-for-odd-p": {
    "proofSteps": [
     "By [Br3, 4.2.2.9] (imported), (Mod FI/Scalpha)_{Z_p} is anti-equivalent to p-divisible groups over O_K; composing with Cartier duality gives an equivalence.",
     "Applying Lemma 1.2.4 with A = Z/p^n and passing to the limit gives a fully faithful functor (Mod FI/S)_{Z_p} -> (Mod FI/Scalpha)_{Z_p}.",
     "Essential surjectivity: for Mcal in (Mod FI/Scalpha)_{Z_p}, Lemma 1.2.5 lifts Mcal_1 = Mcal/p to M_1 in (Mod FI/S)_{F_p}. Then (1 (x) phi)(phi^* M_1)/u^e M_1 = (Mcal/Fil^1 Mcal) (x) Z/p is free over k[[u]]/u^e = O_K/p, so Proposition 2.2.19 applies with M_{F_p} = M_1.",
     "Standing simplifications of 2.2.16 (for the groupoids used): all v_psi equal to one integer v, F = Q_p (so the residue field is F_p), and (1 (x) phi)(phi^* M_{F_p})/u^e M_{F_p} a free k[[u]]/u^e-module of rank v. In the application the last condition holds for M_{F_p} = M_1 by the preceding step.",
     "Proposition 2.2.19: M_A -> Scalpha (x)_{phi,S} M_A is an equivalence of groupoids D_{M_{F_p}} -> D_{Mcal_{F_p}} over artinian Z_p-algebras. Full faithfulness comes from 1.2.4. For bijectivity on isomorphism classes, both groupoids have Noetherian versal deformation rings (Lemma 2.2.18, via Schlessinger and [Br3, 2.1.2.2]); the map of versal rings is an isomorphism modulo p (Lemma 1.2.5) and hence an isomorphism once R^ver_{M_{F_p}} is Z_p-flat.",
     "Z_p-flatness of R^ver_{M_{F_p}}: in a Cartesian diagram of functors, formal smoothness of Dtilde_{M} -> Dbar_{M} (Proposition 2.2.11) and freeness of the modules L_A (Lemma 2.2.17) give formal smoothness over Z_p."
    ],
    "acceptance": [
     "p = 2 is excluded here (footnote to 2.2.16: \"we do not yet have a complete understanding of the precise relationship between these objects when p = 2\"); the dyadic case is the Liu node below.",
     "Check which rank-one object gives mu_{p^infinity}. By Lemma 1.1.15 and (1.1.16), S/p^n with phi(1) = 1 (1 (x) phi an isomorphism) has Gr_D multiplicative (mu_{p^n}), and phi(1) = (unit) E(u) gives an etale Gr_D. So one expects S with phi(1) = 1 to correspond to mu_{p^infinity} and the E(u)-object to Q_p/Z_p. This needs the compatibility of [Br3, 4.2.2.9] with Gr on the M/p^n, which Kisin does not state (import). The earlier version of this item had the two cases the other way round."
    ],
    "sources": [
     {
      "sourceId": "kisin-2009-moduli-finite-flat-group-schemes",
      "locator": "Section 2.2.9-2.2.10 and Proposition 2.2.11 with proof, printed pp. 1113-1115; 2.2.16 with footnote 2, Lemmas 2.2.17-2.2.18, Proposition 2.2.19 and Corollary 2.2.22 with proofs, printed pp. 1115-1118",
      "excerpt": "COROLLARY (2.2.22). The category (Mod FI/S)_{Z_p} is equivalent to the category of p-divisible groups over O_K. Proof. By [Br3, 4.2.2.9] the category (Mod FI/S)_{Z_p} is anti-equivalent to the category of p-divisible groups over O_K, and we turn this into an equivalence by composing with Cartier duality.",
      "match": "Literal statement and first sentence of the proof, text layer of p. 1118."
     }
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/barsotti-tate-groups-equal-lattices-in-crystalline-representations-with-weights-0-1": {
    "acceptance": [
     "The dyadic case is included: nothing in Liu's compilation assumes p > 2. For p = 2 it rests on Kisin 2009a (Modularity of 2-adic Barsotti-Tate representations), Corollary 2.2.6, which was not read (see the gap on Liu 2013 imports; no open copy was found on 2026-09-24)."
    ],
    "sources": [
     {
      "sourceId": "liu-2013-barsotti-tate-kisin-modules-p-2",
      "locator": "Section 2.2, Theorem 2.2.1 with proof, p. 5 of the author copy",
      "excerpt": "Theorem 2.2.1 (Fontaine, Kisin, Raynaud, Tate). The functor H -> T_p(H) induce an equivalence between the category of Barsotti-Tate groups over O_K and the category Rep^{cris,1}_{Z_p}.",
      "match": "Literal statement, pp. 4-5 of the author copy; its proof lists exactly the four imports recorded in the hypotheses."
     }
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/monodromy-operator-on-the-breuil-module-of-a-kisin-module": {
    "proofSteps": [
     "(1): choose x_1, ..., x_d in Fil^1 Mcal with e_i = phi_1(x_i) a basis of Mcal; define derivations N_0(e_i) = 0 and N_n(e_i) = c_1^{-1} phi_1(E(u) N_{n-1}(x_i)).",
     "By induction (N_n - N_{n-1})(Mcal) lies in u^{p^n} Mcal, using N_Scalpha(Scalpha) in u Scalpha. So N_n converges to a derivation N satisfying the Frobenius compatibility.",
     "Uniqueness: N - N' is S-linear and satisfies a fixed-point relation with a matrix A over phi(I_+Scalpha), forcing N = N'.",
     "(2): it suffices to treat i = 1 (induction). For an S-basis f_1, ..., f_d of M choose x_i in (S (x)_{phi,S} M) intersect Fil^1 Mcal (Kisin's S = W(k)[[u]], not Scalpha) with e_i = phi_1(x_i) = c_1 f_i a basis of Mtilde. The construction gives N(e_i) in u^p Mtilde, and c_1^{-1} is in K_0[[u^p]], so N(c_1^{-1}) is in u^p K_0[[u^p]]; hence N(f_i) is in u^p Mtilde and N(M) is contained in u^p Mtilde."
    ],
    "sources": [
     {
      "sourceId": "liu-2013-barsotti-tate-kisin-modules-p-2",
      "locator": "Lemma 2.2.3 with proof, pp. 6-7 of the author copy",
      "excerpt": "Lemma 2.2.3. (1) There exists a unique monodromy operator N on Mcal such that N(M) is contained in I_+S Mcal. (2) N^i(M) is contained in u^p Mtilde for each i >= 1. Proof. (1) is Proposition 5.1.3 of [Bre00]. Note that proof of the proposition does not need the running assumptions of the paper: p > 2 and k is finite.",
      "match": "Literal statement and first sentences of the proof, p. 6 of the author copy (script S of the source written Scalpha); step (2) checked on the page image of p. 7. Liu cites the Breuil-module axioms (1)-(3) for Mcal to \"Section (1.1.8) in [Kis09b]\"; in the published Annals numbering read here the construction is 1.1.10."
     }
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/crystalline-realization-functor-iota-of-a-kisin-module": {
    "proofSteps": [
     "Construct the G_K-action (2.2.1) from N; it preserves phi and Fil^1 as in [Liu08, Lemma 5.1.1].",
     "Q_p (x) Ttilde_cris(Mcal) is V_st(D) for D = Q_p (x) Mcal ([Liu08, 5.2.1]), which is semistable with weights in {0, 1} ([Bre02, 2.2.5]). Since N(M) is in u^p Mtilde (Lemma 2.2.3), N_D = 0 by [Bre97], so V_st(D) is crystalline.",
     "lambda is injective and G_infinity-compatible; dimensions agree (dim V_st(D) = dim_{K_0} D = rank M = rank T_S(M)), so lambda[1/p] is an isomorphism.",
     "Proposition 2.2.2's anti-equivalence on isogeny categories is not proved in Liu 2013: the source says it \"can be proved by the full faithfulness and essential surjectivity of That in Theorem 2.1.2\" and that it is not needed; the original proof is [Kis06, Proposition 2.2.2] (unread).",
     "Diagram (2.2.2): lambdahat is induced by Hom_{Rhat}(Mhat, W(R)) -> Hom_{A_cris}(A_cris (x)_{phi,S} M, A_cris); its G-compatibility is referred to [Liu10, Section 3.2] (unread)."
    ],
    "statement": "For M in Mod^{1,fr}_{/S}, use N (Lemma 2.2.3) to define the A_cris-semilinear G_K-action (2.2.1) g(a (x) x) = sum_i g(a) gamma_i(-log[epsilon(g)]) (x) N^i(x) on A_cris (x)_Scalpha Mcal, where epsilon(g) = g(pibar)/pibar. This action preserves phi and Fil^1. Set Ttilde_cris(Mcal) = Hom_{A_cris, phi, Fil^1}(A_cris (x)_Scalpha Mcal, A_cris) with G_K-action. Then Q_p (x) Ttilde_cris(Mcal) is crystalline with Hodge-Tate weights in {0, 1}. The map lambda : T_S(M) -> Ttilde_cris(Mcal), lambda(f)(a (x) m) = a phi(f(m)), is injective and G_infinity-equivariant, and lambda[1/p] is an isomorphism. Proposition 2.2.2: M -> iota(M) := Q_p (x) lambda(T_S(M)) is a functor Mod^{1,fr}_{/S} -> Rep^{cris,1}_{Q_p} inducing an anti-equivalence on isogeny categories. Remark 2.2.4: for p > 2, lambda' : T_S(M) -> T_cris(Mcal) = Hom_{Scalpha,phi,Fil^1}(Mcal, A_cris) is a Z_p[G_infinity]-isomorphism ([Liu08, Lemma 3.3.4]); for p = 2 it need not be ([Liu07, Example 5.3.3]). Remark 2.2.5: iota is contravariant, and iota'(M) = iota(M)^*(1) is isomorphic to iota(M^vee). For a (phi, Ghat)-module Mhat = (M, phi, Ghat) with That(Mhat) in Rep^{cris,1}_{Z_p}, the natural map lambdahat : That(Mhat) -> Ttilde_cris(Mcal) satisfies lambda = lambdahat o theta (diagram (2.2.2)) and is compatible with the G-actions ([Liu10, Section 3.2]).",
    "acceptance": [
     "Covariance check (Remark 2.2.5): the contravariant iota and the covariant iota' = iota(-)^*(1) differ by dual and cyclotomic twist; fix which one is exported before comparing with Kisin 1.1.13's T(O_E (x) M)(1) and Gr_D."
    ],
    "hypotheses": [
     "any p; k perfect",
     "imports: [Liu08, Lemma 5.1.1] (the G-action preserves phi and Fil^1); [Liu08, Lemma 5.2.1] (Q_p (x) Ttilde_cris(Mcal) = V_st(D)); [Bre02, Proposition 2.2.5] (V_st(D) semistable with weights in {0, 1}); [Bre97] (recovering N_D from N mod I_+Scalpha); [Kis06, Proposition 2.2.2] for the original proof of 2.2.2; [Liu10, Section 3.2] (G-compatibility of lambdahat); [Liu08, Lemma 3.3.4] and [Liu07, Example 5.3.3] (Remark 2.2.4)"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/galois-action-on-T-S-through-J-of-M": {
    "acceptance": [
     "Check that for M = S with phi = 1, T_S(M) = W(R)^{phi=1} = Z_p with trivial G-action. Through Theorem 2.2.1 it corresponds to Q_p/Z_p, whereas Kisin's Gr_D sends S/p^n with phi(1) = 1 to mu_{p^n} (Lemma 1.1.15): the two conventions differ by Cartier duality. For M = S with phi(1) = c_0^{-1}E(u), T_S(M) = Z_p t, and the G-action obtained from J(M) should be a crystalline character with Hodge-Tate weight 1."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/u-divisibility-lemma-in-W-R-inside-B-cris-plus": {
    "proofSteps": [
     "Fact: if w is in W(R) and p^s divides u w in W(R), then p^s divides w, because u mod p = pibar != 0 and R is a domain.",
     "Reduction: writing y = ux, it suffices to find, for every m > 0, x_m and z_m in W(R) with y = u x_m + p^m z_m. The source states this reduction without argument. It follows from the Fact: the u x_m are then p-adically Cauchy, so the x_m are too, and their limit w satisfies y = uw.",
     "Case x in A_cris: write x = sum a_i E(u)^i/i! with a_i in W(R) and n_i = v_p(i!). Then p^{n_i} u x = u xtilde_i + ztilde_i with xtilde_i in W(R) and ztilde_i in Fil^{i+1} A_cris intersect W(R) = E(u)^{i+1} W(R) (this identity is asserted in the source without proof or citation). Writing E(u)^{i+1} = p^{i+1} b_i + u w_i gives y = u x(i) + p^{i+1-n_i} z(i) with x(i), z(i) in W(R).",
     "Choose i_m with i_m + 1 - n_{i_m} -> infinity: for p > 2 take i_m = m (n_i <= i/(p-1)); for p = 2 take i_m = 2^m - 1, where v_2((2^m - 1)!) = 2^m - m - 1 gives i_m + 1 - n_{i_m} = m + 1.",
     "Case x in B^+_cris with p^s x in A_cris: then p^s x is in W(R) by the first case, and the Fact gives x in W(R)."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/G-stability-of-lambda-T-S-inside-T-cris": {
    "proofSteps": [
     "Choose a G-stable lattice L in iota(M) containing lambda(T_S(M)); by Theorem 2.1.2 it comes from a (phi, Ghat)-module, and Corollary 3.1.3 reduces compatibility of the two G-actions to that module. So assume Mhat = (M, phi, Ghat) with That(Mhat) in Rep^{cris,1}_{Z_p}.",
     "Define Jhat(Mhat) = Hom_{Rhat,phi}(Rhat (x)_{phi,S} M, W(R)/u^p phi(t) W(R)) and thetatilde : J(M) -> Jhat(Mhat), which is an isomorphism because phi induces W(R)/utW(R) = W(R)/u^p phi(t)W(R). Give Jhat the G-action transported from J(M).",
     "Proposition 3.2.1: the projection etahat : That(Mhat) -> Jhat(Mhat) is G-equivariant. This reduces to the claim g^{-1}(1 (x) e_i) = 1 (x) e_i mod Itilde Mhat, with Itilde = u^p phi(t) W(R) intersect Rhat.",
     "Claim: by (2.2.1) and Lemma 2.2.3, g(1 (x) e_i) = sum_j gamma_j(-log[epsilon(g)]) (x) N^j(1 (x) e_i) = 1 (x) e_i mod u^p (I^[1] B^+_cris) Mhat. The matrix A of g - 1 has entries in Rhat, contained in W(R), and in u^p I^[1] B^+_cris, hence by Lemma 3.2.2 in u^p I^[1] = u^p phi(t) W(R). Footnote 2: it is not clear that Itilde = u^p phi(t) Rhat (since I_+S != uS), and the proof does not need it."
    ],
    "acceptance": [
     "p = 2 check: this is where the dyadic difficulty (lambda' not an isomorphism, Remark 2.2.4) is avoided. In Section 3 the only step that distinguishes p = 2 is the index choice in Lemma 3.2.2. Liu applies the imported Liu 2010 results (Theorem 2.1.2, Section 3.2) with no restriction on p; their validity at p = 2 is not re-argued in Liu 2013 and belongs to the Liu 2010 import gap."
    ],
    "hypotheses": [
     "any p, k perfect",
     "imports: Liu 2010 Theorem 2.1.2 ((phi, Ghat)-modules classify lattices in semistable representations with weights in {0, 1}, and theta : T_S(M) -> That(Mhat) is a G_infinity-isomorphism) and Liu 2010 Section 3.2 (the Ghat-action on Mhat is the restriction of the action (2.2.1) on B^+_cris (x) Mcal, used in the claim: 'since Mhat is G-stable in B^+_cris (x)_{S,phi} M')"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/barsotti-tate-groups-equivalent-to-kisin-modules-of-height-one-including-p-2": {
    "statement": "Let K/Q_p be a finite extension (more generally K/K_0 finite totally ramified, k perfect). There is an equivalence between the category of Barsotti-Tate groups over O_K and the category Mod^{1,fr}_{/S} of Kisin modules of height 1. The equivalence is contravariant in M: M -> lambda(T_S(M)) is contravariant, and Liu's introduction (p. 2) calls M -> T_S(M) an anti-equivalence onto Rep^{cris,1}_{Z_p}. It is then composed with the covariant H -> T_p(H) of Theorem 2.2.1.",
    "acceptance": [
     "The equivalence obtained is contravariant in M through T_S (Remark 2.2.5); record the direction before identifying it with Kisin 2009 Corollary 2.2.22 for p > 2, where Cartier duality has been applied.",
     "Liu notes independent proofs by W. Kim (explicit p = 2 calculations) and E. Lau (windows and displays); neither is in the library.",
     "Liu (p. 2): for p > 2 the theorem is attributed to [Kis06], and for p = 2 [Kis09a] had established only the connected case (connected Barsotti-Tate groups versus a subcategory of Kisin modules of height 1)."
    ],
    "hypotheses": [
     "k perfect; any p, with p = 2 the new case",
     "imports as in the Theorem 2.2.1 node, Liu 2010 Theorem 2.1.2 and Liu 2010 Section 3.2 (G-compatibility of lambdahat in diagram (2.2.2), used for essential surjectivity)"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-shifted-ramification-numbering": {
    "proofSteps": [
     "Definitions 1.1 and Remarks 1.2 are stated without proof. The properties of phitilde and psitilde (piecewise linearity, bijectivity, the integral formulas, G^(u) = G_(psitilde(u))), the dictionary with Serre and the quotient compatibility are all imported from Serre, Corps locaux [Se1] (2nd ed., Hermann 1968), Chapter IV; the quotient compatibility is cited as Prop. 14, p. 81."
    ],
    "statement": "Let K be complete for a discrete valuation with perfect residue field k of characteristic p != 0, v_K normalized by v_K(K^*) = Z and extended to algebraic extensions; for real m >= 0, a^m_{L/K} is the ideal of O_L of the x with v_K(x) >= m. For L/K finite Galois with group G and g in G, let a_g be the ideal of O_L generated by the (g-1)x for x in O_L, and i_{L/K}(g) = v_K(a_g) (so e_{L/K} i_{L/K}(g) is in N union {+infinity}). Put G_(i) = {g : i_{L/K}(g) >= i}: normal subgroups, decreasing in i, G_(i) = G for i <= 0 and G_(i) = 1 for i large. Fontaine's Herbrand function is phitilde_{L/K}(i) = sum_{g in G} min{i, i_{L/K}(g)} (piecewise linear, strictly increasing, bijective R -> R), with inverse psitilde_{L/K}. Put u_{L/K}(g) = phitilde_{L/K}(i_{L/K}(g)) (with u_{L/K}(1) = +infinity) and G^(u) = {g : u_{L/K}(g) >= u}. Then G^(u) = G_(psitilde_{L/K}(u)), G_(i) = G^(phitilde_{L/K}(i)), phitilde_{L/K}(i) = integral_0^i (G_(x) : 1) dx and psitilde_{L/K}(u) = integral_0^u dy/(G^(y) : 1). Set i_{L/K} = sup_{g != 1} i_{L/K}(g) and u_{L/K} = sup_{g != 1} u_{L/K}(g). These are the largest i (resp. u) with G_(i) != 1 (resp. G^(u) != 1), and u_{L/K} = phitilde_{L/K}(i_{L/K}). Dictionary with Serre, Corps locaux Ch. IV, whose Herbrand functions are phi_{L/K} and psi_{L/K} (Remark 1.2(i), real j, v >= -1): G_j = G_((j+1)/e_{L/K}), G^v = G^(v+1), phi_{L/K}(j) = phitilde_{L/K}((j+1)/e_{L/K}) - 1 and psi_{L/K}(v) = e_{L/K} psitilde_{L/K}(v+1) - 1. Remark 1.2(ii): if L' contains L and is finite Galois over K with group G', the image of G'^(u) in G is G^(u) (Serre Prop. 14, p. 81). Hence, for Kbar a separable closure and G_K = Gal(Kbar/K), G_K^(u) = lim Gal(L/K)^(u) is a closed subgroup of G_K. For L/K finite Galois inside Kbar, u_{L/K} is the smallest real u such that G_K^(u+epsilon) is contained in Gal(Kbar/L) for all epsilon > 0.",
    "acceptance": [
     "Convention check: Serre's upper numbering G^v corresponds to Fontaine's G^(v+1); a bound \"G^(u) acts trivially for u > e(n + 1/(p-1))\" is \"G^v acts trivially for v > e(n + 1/(p-1)) - 1\" in Serre's numbering. Export this translation explicitly to ArithmeticGaloisRepresentations R01 before SmallRamificationAndAbelianVarietyBaseCases uses it.",
     "Notation check: Fontaine's function phitilde_{L/K} (sum of min{i, i_{L/K}(g)} over g in G, variable normalized by v_K) and Serre's phi_{L/K} differ by the affine change of variables of Remark 1.2(i); no statement may mix them.",
     "Tame extension check: for L/K tamely and totally ramified with L != K, u_{L/K} = 1 (i_{L/K}(g) = 1/e_{L/K} for g != 1, so u_{L/K} = phitilde(1/e_{L/K}) = 1); this is the value used in the proof of Proposition 1.5(ii)."
    ],
    "sources": [
     {
      "sourceId": "fontaine-1985-pas-de-variete-abelienne-sur-Z",
      "locator": "Section 1.1 and Remarks 1.2, printed pp. 517-518",
      "excerpt": "1.2. Remarques. i) Si j et v sont des nombres reels >= -1, on a, avec les notations du chapitre IV de [Se1]: G_j = G_((j+1)/e_{L/K}), G^v = G^(v+1)",
      "match": "Literal dictionary read on the page image of p. 518 (independent review: GDZ scan). The definitions of i_{L/K}(g), G_(i), phitilde_{L/K} (printed with a tilde), u_{L/K}(g), G^(u) and the integral formulas are on p. 517; i_{L/K}, u_{L/K} and Remark 1.2(ii) on p. 518."
     }
    ],
    "hypotheses": [
     "K complete for a discrete valuation, residue field k perfect of characteristic p != 0 (no characteristic hypothesis on K in Section 1 before 1.6)",
     "L/K finite Galois; G_K^(u) is then defined by passage to the limit over finite Galois L inside a separable closure Kbar"
    ],
    "title": "Fontaine's normalization of ramification groups: i_{L/K}, G_(i), phitilde_{L/K}, u_{L/K}, G^(u) = G^{u-1} and the dictionary with Serre"
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/different-equals-u-minus-i": {
    "proofSteps": [
     "By Serre, Corps locaux, Prop. 4, p. 72 (cited by page only): v_K(D_{L/K}) = sum_{g != 1} i_{L/K}(g) = sum_{g in G} min{i_{L/K}, i_{L/K}(g)} - i_{L/K} = phitilde_{L/K}(i_{L/K}) - i_{L/K} = u_{L/K} - i_{L/K}."
    ],
    "statement": "For L/K finite Galois (standing hypotheses of Section 1) with different D_{L/K}, v_K(D_{L/K}) = u_{L/K} - i_{L/K}.",
    "sources": [
     {
      "sourceId": "fontaine-1985-pas-de-variete-abelienne-sur-Z",
      "locator": "Section 1.3 (Proposition with proof), printed p. 518",
      "excerpt": "1.3. Proposition. Soit L une extension finie galoisienne de K, et soit D_{L/K} la differente de l'extension L/K. On a v_K(D_{L/K}) = u_{L/K} - i_{L/K}.",
      "match": "Literal statement and three-line proof read on the page image of p. 518 (independent review: GDZ scan)."
     }
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/krasner-criterion-for-embedding-L-from-approximate-points": {
    "proofSteps": [
     "1.4: after replacing beta by a conjugate, i = v_K(beta - alpha); since i_{L/K}(g) = v_K((g-1)alpha), v_K(beta - g alpha) = min{i, i_{L/K}(g)}, and P(beta) = prod_g (beta - g alpha) gives u = phitilde_{L/K}(i).",
     "1.5(i): lift eta(alpha) to beta in O_E. Then v_K(P(beta)) >= m > u_{L/K}, so i = psitilde(v_K(P(beta))) > i_{L/K} and some g_0 has v_K(beta - g_0 alpha) > sup_{g != 1} v_K((g-1) g_0 alpha). Krasner's lemma gives g_0 alpha in K(beta), which lies in E.",
     "1.5(ii), reduction: it suffices to show that (P_m) fails for m = u_{L/K} - e_{L/K}^{-1}. Passing to the maximal unramified subextension K' (u_{L/K'} = u_{L/K}, e_{L/K'} = e_{L/K} = [L:K']) reduces to L/K totally ramified with alpha a uniformizer and P Eisenstein. For L = K there is nothing to prove.",
     "1.5(ii), tame case: u_{L/K} = 1. For E totally ramified of degree e_{L/K} - 1 with uniformizer beta, alpha -> beta gives an O_K-homomorphism O_L -> O_E/a^m_{E/K}, but L has no K-embedding into E.",
     "1.5(ii), p | e_{L/K}: e_{L/K} m is then an integer > e_{L/K}. Write e_{L/K} m = e_{L/K} r + s with 0 <= s < e_{L/K} and r >= 1 (strictly if s = 0), choose a in K with v_K(a) = r, and set R = P - a X^s, still Eisenstein of degree e_{L/K}. For a root beta of R, E = K(beta) is totally ramified of degree e_{L/K} and v_K(P(beta)) = v_K(a) + s/e_{L/K} = m, so alpha -> beta gives O_L -> O_E/a^m_{E/K}. A K-embedding would force L = E and, by Proposition 1.4, e_{L/K} psitilde_{L/K}(m) = e_{L/K} sup_g v_K(beta - g alpha) in Z.",
     "Misprint (reviewer's computation; the source's conclusion is unaffected): the source prints 'e_{L/K} psitilde_{L/K}(m) = e_{L/K} u_{L/K} - d^{-1}', d = #G_(i_{L/K}), 'comme e_{L/K} u_{L/K} in Z'. psitilde_{L/K} has slope 1/d on its last segment ending at (u_{L/K}, i_{L/K}), and that segment has length >= d/e_{L/K} > 1/e_{L/K}. Hence e_{L/K} psitilde_{L/K}(m) = e_{L/K} i_{L/K} - d^{-1}, which is not an integer because e_{L/K} i_{L/K} is in Z and d >= 2."
    ],
    "statement": "Let L/K be finite Galois with group G and alpha in O_L with O_L = O_K[alpha] (such alpha exists, [Se1] Prop. 12, p. 66), P its minimal polynomial over K. Proposition 1.4: for beta in an algebraic extension of K containing L, with i = sup_{g in G} v_K(beta - g alpha) and u = v_K(P(beta)), one has u = phitilde_{L/K}(i) and i = psitilde_{L/K}(u). Proposition 1.5: for real m >= 0, let (P_m) be the property that, for every algebraic extension E of K, if there is an O_K-algebra homomorphism O_L -> O_E/a^m_{E/K}, then there is a K-embedding of L into E. Then (i) if m > u_{L/K}, (P_m) holds; (ii) if (P_m) holds, then m > u_{L/K} - e_{L/K}^{-1}.",
    "acceptance": [
     "For L = Q_p(zeta_p) over Q_p (tamely and totally ramified), u_{L/K} = 1 by the tame case in the proof of 1.5(ii). So (P_m) holds for m > 1, and (ii) is consistent with (P_m) failing at m = 1 - 1/(p-1).",
     "Check the corrected identity e_{L/K} psitilde_{L/K}(u_{L/K} - e_{L/K}^{-1}) = e_{L/K} i_{L/K} - 1/d on L = Q_2(i)/Q_2 (i_{L/K} = 1, u_{L/K} = 2, d = 2): psitilde(3/2) = 3/4, and 2 * 3/4 = 2 - 1/2."
    ],
    "sources": [
     {
      "sourceId": "fontaine-1985-pas-de-variete-abelienne-sur-Z",
      "locator": "Sections 1.4-1.5 (Propositions with proofs), printed pp. 518-520",
      "excerpt": "1.5. Proposition. Soit L une extension finie galoisienne de K et soit m un nombre reel >= 0. Considerons la propriete (P_m) pour toute extension algebrique E de K, s'il existe un homomorphisme (de O_K-algebres) de O_L dans O_E/a^m_{E/K}, alors il existe un K-plongement de L dans E. Alors : i) si m > u_{L/K}, (P_m) est vraie : ii) si (P_m) est vraie, m > u_{L/K} - e_{L/K}^{-1}.",
      "match": "Literal statement read on the page image of p. 519 (independent review: GDZ scan). The proof of 1.5(ii) is on pp. 519-520, and its final 'simple calcul' was checked on a zoomed image of p. 520, where the printed u_{L/K} should be i_{L/K}."
     }
    ],
    "hypotheses": [
     "standing hypotheses of Section 1: K complete discretely valued with perfect residue field of characteristic p",
     "L/K finite Galois; existence of alpha with O_L = O_K[alpha] is imported ([Se1] Prop. 12, p. 66)",
     "imports: Krasner's lemma ([L] Lang, Algebraic Number Theory, p. 43)"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/unique-lifting-of-homomorphisms-through-topologically-nilpotent-divided-powers": {
    "proofSteps": [
     "Reduce to B local with B/m_B = k ('il est clair que l'on peut supposer'). Omega^1_{B/O_K} is then (B/a)-free with basis dx_1, ..., dx_h, where the x_j lift a basis of m_B/(m_B^2 + m_K B). This identifies B with O_K[[X_1..X_h]]/J, and J is generated by h elements P_1..P_h because B is finite and a complete intersection.",
     "From sum_j (dP_i/dX_j)(x) dx_j = 0 get dP_i/dX_j(x) = a p_ij with (p_ij) invertible in B (divide (q_li)(a p_ij) = a I_h by a, B being O_K-free).",
     "Inductive step: for each n >= 1, an O_K-homomorphism u : B -> S/aI^[n] has a unique O_K-homomorphism u' : B -> S/aI^[n+1] inducing the same map B -> S/I^[n]. With lifts u_i of u(x_i) and P_i(u) = a lambda_i, lambda_i in I^[n], one needs mu_j in I^[n], unique mod I^[n+1], with P_i(u + mu) in aI^[n+1]. The Taylor expansion converges by topological nilpotence. The higher derivatives of elements of J lie in a O_K[[X]] + J, and dP_i/dX_j = a P_ij + R_ij with R_ij in J and P_ij lifting p_ij. So P_i(u + mu) = a(lambda_i + sum_j P_ij(u) mu_j) mod aI^[n+1], and since S is O_K-flat the condition is lambda_i + sum_j P_ij(u) mu_j = 0 mod I^[n+1]. This is uniquely solvable because (p_ij) is invertible.",
     "Printed misprints on p. 522, corrected above: the left side of the congruence is printed P_i(u_1, ..., u_h), without '+ mu_j'; and the final condition and the invertibility sentence print dP_i/dX_j(u) and 'p_ij = dP_i/dX_j(x)' where the argument (p. 521: dP_i/dX_j(x) = a p_ij) requires P_ij(u) and p_ij. The logic of the source is unaffected.",
     "(b) follows from the uniqueness in (a) (p. 523)."
    ],
    "statement": "Let K be complete discretely valued with perfect residue field of characteristic p and of characteristic 0 (1.6), e = v_K(p). Let B be a finite flat O_K-algebra, locally a complete intersection, and suppose some a in O_K annihilates Omega^1_{B/O_K} with Omega^1_{B/O_K} a flat (B/a)-module. Let S be a finite flat O_K-algebra and I an ideal of S with divided powers (gamma_n(x) = x^n/n! in I) that are topologically nilpotent: the intersection of the I^[m] is 0, where I^[m] is generated by the products gamma_{n_1}(x_1)...gamma_{n_r}(x_r) with sum n_j >= m. (a) For every O_K-homomorphism u : B -> S/aI there is a unique homomorphism utilde : B -> S such that u and utilde induce the same map B -> S/I. (b) The canonical map Hom_{O_K}(B, S) -> Hom_{O_K}(B, S/I) is injective. Example (1.6): for S = O_L, L/K finite, the ideal a^m_{L/K} has divided powers iff m >= e/(p-1), and topologically nilpotent ones iff m > e/(p-1).",
    "sources": [
     {
      "sourceId": "fontaine-1985-pas-de-variete-abelienne-sur-Z",
      "locator": "Sections 1.6-1.7, Proposition 1.7(i) with proof, printed pp. 520-523",
      "excerpt": "1.7. Proposition. Soit B une O_K-algebre finie et plate, localement d'intersection complete. On suppose qu'il existe a in O_K, annulant Omega^1_{B/O_K}, tel que Omega^1_{B/O_K} est un (B/a)-module plat. i) Si S est une O_K-algebre finie et plate et si I est un ideal de S admettant des puissances divisees topologiquement nilpotentes, alors : a) pour tout O_K-homomorphisme u de B dans S/aI, il existe un et un seul homomorphisme utilde : B -> S rendant le diagramme commutatif",
      "match": "Literal statement checked on the page image of p. 520 (independent review: GDZ scan); proof on pp. 521-523, with the p. 522 displays read on a zoomed image."
     }
    ],
    "hypotheses": [
     "K complete discretely valued, perfect residue field of characteristic p, char K = 0 (from 1.6 on); e = v_K(p)",
     "B finite flat and locally a complete intersection over O_K",
     "a in O_K kills Omega^1_{B/O_K}, and Omega^1_{B/O_K} is (B/a)-flat (the Introduction, p. 516, says 'localement libre')",
     "S finite flat over O_K; I an ideal with topologically nilpotent divided powers"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/ramification-bound-for-points-of-such-algebras": {
    "proofSteps": [
     "Omega^1_{B_K/K} = K (x) Omega^1_{B/O_K} = 0, so B_K is a product of finite extensions L_s, and L is the compositum of their Galois closures in Kbar, hence Galois. If a is a unit, B is etale over O_K, L/K is unramified and u_{L/K} = 0.",
     "Assume a in m_K. For m > v_K(a) + e/(p-1), show (P_m) (cf. 1.5). J(E) = Hom_{O_K}(B, O_E), the disjoint union over s of the K-embeddings of L_s into E, satisfies #J(E) <= #J(L), with equality iff L embeds in E. Given eta : O_L -> O_E/a^m_{E/K}, write a^m_{E/K} = aI with I having (topologically) nilpotent divided powers, and map u -> u^eta by Proposition 1.7(i)(a).",
     "Injectivity of u -> u^eta: embed the maximal unramified subextension K' of L/K into E compatibly with eta. Take alpha a uniformizer of O_L with minimal polynomial P over K' and n = e_{L/K}. A lift beta of eta(alpha) satisfies v_K(P(beta)) > 1, which the source says implies v_K(beta) = v_K(alpha) = 1/n. The kernel I' of O_L -> O_E/aI -> O_E/I is {x : v_K(x) >= m - v_K(a)}, which has topologically nilpotent divided powers, so injectivity follows from 1.7(i)(b).",
     "By Proposition 1.5(ii), m > u_{L/K} - n^{-1} for all m > v_K(a) + e/(p-1), so u_{L/K} <= v_K(a) + e/(p-1) + 1/n.",
     "Removing 1/n. If p does not divide n, L/K is tamely ramified and u_{L/K} <= 1 <= v_K(a) + e/(p-1); the source writes u_{L/K} = 1, which fails for n = 1, where u_{L/K} = 0 and the inequality is trivial. If p divides n, n u_{L/K} is an integer divisible by p (n i_{L/K}(g) is in Z, and #G_(i) is divisible by p for i <= i_{L/K}), so n(p-1)u_{L/K} is too. Now n(p-1)u_{L/K} <= n(p-1)v_K(a) + ne + p - 1, and n(p-1)v_K(a) + ne is an integer divisible by p, hence n(p-1)u_{L/K} <= n(p-1)v_K(a) + ne."
    ],
    "sources": [
     {
      "sourceId": "fontaine-1985-pas-de-variete-abelienne-sur-Z",
      "locator": "Proposition 1.7(ii) with proof, printed pp. 521-524",
      "excerpt": "ii) La K-algebre B_K = K (x) B est etale; si L est le plus petit sous-corps d'une cloture algebrique donnee Kbar de K contenant les u(B), pour u decrivant l'ensemble des O_K-homomorphismes de B dans Kbar, alors L/K est galoisienne et u_{L/K} <= v_K(a) + e/(p-1).",
      "match": "Literal statement read on the page image of p. 521 (non-strict inequality); proof on pp. 523-524 (independent review: GDZ scan)."
     }
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/different-bound-for-points-of-such-algebras": {
    "sources": [
     {
      "sourceId": "fontaine-1985-pas-de-variete-abelienne-sur-Z",
      "locator": "Corollary 1.8 with proof and Remarks 1.9, printed pp. 524-525",
      "excerpt": "1.8. Corollaire. Conservons les hypotheses et notations de la Proposition 1.7 et soit D_{L/K} la differente de l'extension L/K. On a v_K(D_{L/K}) < v_K(a) + e/(p-1).",
      "match": "Literal statement read on the page image of p. 524; Remark 1.9(ii) ends on p. 525 (independent review: GDZ scan)."
     }
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-upper-ramification-bound-for-finite-flat-p-power-torsion": {
    "proofSteps": [
     "Reduce to k algebraically closed. The source says only 'Il est clair que l'on peut supposer le corps residuel k de K algebriquement clos'. The unwritten argument passes to the completion of the maximal unramified extension, whose residue field is infinite, and needs the invariance of G_K^(u) (u > 0) and of the different under that base change, which are Serre Ch. IV facts.",
     "Let B be the affine algebra of J and omega_J = {omega in Omega^1_{B/O_K} : m^* omega = i_1^* omega + i_2^* omega} the module of invariant differentials.",
     "(a) omega_J free over O_K/p^n: J_k is the product of an etale group J_k^et and a connected group J_k^c ([De] Ch. II), so B_k = (B_k^c)^{J_k^et(k)}. Also B_k^c = k[X_1..X_h]/(X_1^{p^{r_1}}, ..., X_h^{p^{r_h}}), so B_k and hence B is a local complete intersection. Omega^1_{B/O_K} = B (x) omega_J ([Fo] n. 4.3) is free over B/p^n. Apply Proposition 1.7 and Corollary 1.8 with a = p^n (v_K(a) = ne).",
     "(b) General case: J embeds in a Barsotti-Tate group Gamma ([BBM] or [I]), so J(Kbar) is in Gamma_{p^n}(Kbar) and it suffices to treat Gamma_{p^n}. The fppf sequence 0 -> Gamma_{p^n} -> Gamma -> Gamma -> 0 (the last map p^n) gives 0 -> omega_Gamma -> omega_Gamma -> omega_{Gamma_{p^n}} -> 0; omega_Gamma is O_K-free, so omega_{Gamma_{p^n}} is free over O_K/p^n and (a) applies.",
     "Remark 2.2(a): for e = n = 1, O_K/p = k and omega_J is automatically free, so the Barsotti-Tate embedding is unnecessary (Fontaine uses Theorem 1 only in this case)."
    ],
    "sources": [
     {
      "sourceId": "fontaine-1985-pas-de-variete-abelienne-sur-Z",
      "locator": "Introduction 0.1 (Theorem A), printed p. 515; Section 2.1 (Theorem 1 with proof) and Remarks 2.2, printed pp. 525-526",
      "excerpt": "Theoreme A. Soit n un entier >= 1 et soit J un groupe fini sur l'anneau des entiers O_K de K, tue par p^n. Si u > e(n + 1/(p-1)), G^(u) opere trivialement sur J(Kbar).",
      "match": "Literal statement read on the page image of p. 515, where G^(u) = G^{u-1} is defined immediately before; \"groupe fini\" means a finite flat commutative group scheme by the Conventions on p. 515. Theorem 1 and its proof were read on the images of pp. 525-526 (independent review: GDZ scan)."
     }
    ],
    "hypotheses": [
     "K of characteristic 0, complete discretely valued, perfect residue field k of characteristic p; e = v_K(p)",
     "J finite flat commutative over O_K ('groupe fini' in the Conventions, p. 515), killed by p^n (n >= 1)",
     "imports for the general case: Grothendieck's embedding of J into a Barsotti-Tate group ([BBM] Berthelot-Breen-Messing, LNM 930, or [I] Illusie, Asterisque 127); for case (a): structure of the special fibre ([De] Demazure, Lectures on p-divisible groups, LNM 302, Ch. II) and Omega^1_{B/O_K} = B (x) omega_J ([Fo] Fontaine, Invent. Math. 65 (1982), n. 4.3)"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-different-bound-for-torsion-fields": {
    "acceptance": [
     "Worked check: for J = mu_p over Z_p, L = Q_p(zeta_p) has v_0(D_{L/K}) = (p-2)/(p-1) < 1 + 1/(p-1).",
     "Consumer check (SmallRamificationAndAbelianVarietyBaseCases:R25.1): Fontaine's Theorem 3 (3.3.1) derives the discriminant bound r_P < [F:E] e_P (n + 1/(p-1)) for the field F generated by J(Ebar), J finite flat over O_E killed by p^n, and r_P = 0 for P not dividing p. Its proof quotes exactly this bound ('le Theoreme 1 du n. 2.1 nous dit que m < e e_P (n + 1/(p-1))'). Corollary 3.3.2 gives |d_F|^{1/[F:Q]} < |d_E|^{1/[E:Q]} p^{n + 1/(p-1)}. These global statements and the Odlyzko-Poitou-Serre lower bounds are R25.1 material, outside this node."
    ],
    "sources": [
     {
      "sourceId": "fontaine-1985-pas-de-variete-abelienne-sur-Z",
      "locator": "Introduction 0.1 (Corollaire), printed p. 516; Theorem 1, printed p. 525",
      "excerpt": "Corollaire. Soit v_0 la valuation de L normalisee par v_0(p) = 1. Alors v_0(D_{L/K}) < n + 1/(p-1).",
      "match": "Literal statement read on the page image of p. 516 (independent review: GDZ scan). Theorem 1 on the page image of p. 525 states v_K(D_{L/K}) < e(n + 1/(p-1))."
     },
     {
      "sourceId": "fontaine-1985-pas-de-variete-abelienne-sur-Z",
      "locator": "Section 3.3, Theorem 3 (3.3.1) with proof and Corollary 3.3.2, printed p. 531",
      "excerpt": "Si e est l'indice de ramification de cette extension, le Theoreme 1 du n. 2.1 nous dit que m < e e_p (n + 1/(p-1)).",
      "match": "The global use of this node: Fontaine's proof of Theorem 3 (discriminant exponent of F/E at primes above p) quotes the different bound of Theorem 1. Read on the page image of p. 531 by the independent review; the global translation itself is not decomposed in this packet."
     }
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/determinant-of-the-tate-module-of-a-p-divisible-group": {
    "acceptance": [
     "X = mu_{p^infinity} (h = d = 1): det T = T(mu_{p^infinity}), character tau^1.",
     "X = Q_p/Z_p (h = 1, d = 0): trivial character, tau^0.",
     "Remark 4.1.2 says the conclusion of Theorem 4.1.1 'can be deduced' from Theorem 4.2.1 without restriction on e when Gcal is the p-torsion of an R-p-divisible group. The deduction is not written. It needs v(D(X[p])) = e d, to match tau^d mod p = tau_p^{e d} on inertia. Do not treat it as proved until that identity is supplied."
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/witt-covectors-and-the-dieudonne-ring": {
    "proofSteps": [
     "Source status: Conrad's \"Summary of some results of Fontaine\" recalls these facts and refers the proofs to Fontaine, Groupes p-divisibles sur les corps locaux [7]: pp. 71-72 (addition polynomials), Ch. II, Prop. 1.4 (group structure), pp. 79-82 (F, V and the W(k)-module structure), Ch. II, Prop. 2.3 (general complete topological W(k)-algebras) and Ch. II, Section 4.2 (pro-representability). Fontaine-Laffaille 9.1 refer to [F4] Ch. II, Section 1. No proof was read; Asterisque 47-48 is not in the library."
    ],
    "statement": "Let k be perfect of characteristic p. For a finite k-algebra R, CW_k(R) is the set of sequences a = (..., a_{-n}, ..., a_0) of elements of R indexed by non-positive integers with a_{-n} nilpotent for n large (Conrad writes 'a_i nilpotent for large i'). Addition is c_{-n} = lim_m S_m(a_{-n-m}, ..., a_{-n}, b_{-n-m}, ..., b_{-n}), a stationary limit, where S_m are the Witt addition polynomials. CW_k(R) is a commutative topological group (as a subset of the product of discrete copies of R). It has a unique compatible topological W(k)-module structure with [x].a = (..., x^{p^{-n}} a_{-n}, ..., x^{p^{-1}} a_{-1}, a_0) as printed by Conrad; the last coordinate is printed without a factor x, which does not fit the pattern at n = 0. F(a) = (..., a_{-n}^p, ..., a_0^p) and V(a) = (..., a_{-n-1}, ..., a_{-1}) are additive and continuous, with F V = V F = p; F is sigma-semilinear and V sigma^{-1}-semilinear. Hence CW_k(R) is a topological module over D_k = W(k)[F, V], with F V = V F = p, F alpha = sigma(alpha) F and V alpha = sigma^{-1}(alpha) V. For R = k' a finite extension of k, CW_k(k') = K'/W(k') with K' = Frac W(k'). The functor CW_k on finite k-algebras is pro-represented by a formal affine commutative k-group scheme CWhat_k. Fontaine-Laffaille 9.1 define CW(R) for any commutative unital k-algebra R: families (x_{-n})_{n in N} such that (psi) for some s >= 0 the ideal of R generated by the x_{-n}, n >= s, is nilpotent. They give the same F and V, and write the D_k relations as FV = VF = p, Fa = sigma(a) F and aV = V sigma(a) for a in A = W(k).",
    "acceptance": [
     "Check CW_k(k) = K_0/W(k) with F acting as sigma and V as p sigma^{-1}. This is consistent with Conrad's statement that the D_k-structure on CW_k(k') = K'/W(k') is 'as usual' and with FV = p.",
     "Settle the Teichmueller action against Fontaine [7] Ch. II, Section 1: Conrad prints [x].a with last coordinate a_0, whereas the n-th pattern x^{p^{-n}} a_{-n} would give x a_0 at n = 0.",
     "Local library check: Mathlib has WittVector with Frobenius and Verschiebung (RingTheory/WittVector/Frobenius.lean, Verschiebung.lean). A grep of that directory for \"covector\" found nothing; completeness of the search is unchecked."
    ],
    "sources": [
     {
      "sourceId": "conrad-1999-finite-group-schemes-low-ramification",
      "locator": "Summary of some results of Fontaine, pp. 3-4 of the author copy",
      "excerpt": "In other words, CW_k(R) is a module over the Dieudonne ring D_k = W(k)[F, V] generated by two commuting variables with the usual relations FV = VF = p, F alpha = sigma(alpha)F, V alpha = sigma^{-1}(alpha)V (for alpha in W(k)), and there is a compatible structure of topological W(k)-module with respect to which F and V act continuously.",
      "match": "Literal passage (p. 4 of the author copy). The definition, addition, the formula for [x].a, and F and V are on p. 3, read on the page image. Conrad attributes all proofs to Fontaine [7]."
     },
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 9.1, printed p. 601",
      "excerpt": "9.1. On note D_k l'anneau (non commutatif si k != F_p) engendre par A et deux elements F et V, soumis aux relations : FV = VF = p, Fa = sigma a . F pour tout a in A, aV = V . sigma a pour tout a in A.",
      "match": "Literal definition of the Dieudonne ring over A = W(k), checked on the page image of p. 601 (the text layer is garbled). The same page defines CW(R) for any commutative unital k-algebra R with condition (psi) and refers to [F4] Ch. II Section 1 for addition and the A-action."
     }
    ],
    "hypotheses": [
     "k perfect of characteristic p > 0",
     "Conrad: R a finite k-algebra (more general complete topological W(k)-algebras need care, Conrad p. 4); Fontaine-Laffaille 9.1: R any commutative unital k-algebra, with condition (psi) on covectors"
    ]
   },
   "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/contravariant-dieudonne-module-anti-equivalence-over-a-perfect-field": {
    "statement": "Let k be perfect of characteristic p. For a p-formal commutative group scheme G over k (G = lim_{->} G[p^n], e.g. a finite commutative k-group scheme of p-power order or a p-divisible group over k), the Dieudonne module is M(G) = Hom(G, CWhat_k), the group of formal k-group scheme maps, a topological D_k-module. For a finite commutative p-group J over k (finite flat, rank a power of p: Fontaine-Laffaille 9.2) with coproduct m^* on O_k(J), M(J) is identified with the left D_k-submodule of CW(O_k(J)) of covectors (..., x_{-n}, ..., x_0) with (..., m^* x_{-n}, ..., m^* x_0) = (..., x_{-n} (x) 1, ..., x_0 (x) 1) + (..., 1 (x) x_{-n}, ..., 1 (x) x_0), the sum taken in the covector group CW(O_k(J) (x) O_k(J)). The functor M is an anti-equivalence of abelian categories between p-formal commutative group schemes over k and 'certain topological D_k-modules' (Conrad). In particular it is contravariant and induces an anti-equivalence between finite commutative p-group schemes over k and finite D_k-modules, i.e. left D_k-modules of finite W(k)-length (Fontaine-Laffaille 9.2).",
    "acceptance": [
     "Covariance check against CrystallineCohomology:CR.7, which asks to \"verify its covariance/contravariance and Tate twists on the constant and multiplicative p-divisible groups\": compute M(Z/pZ) and M(mu_p) in this contravariant convention. The expected outcome from the standard theory (F bijective on M(Z/pZ), V bijective on M(mu_p)) is not stated in either source read and must be proved or sourced.",
     "The roadmap items \"slopes, ordinary/supersingular cases, and deformations over nilpotent thickenings\" are not in these statements; see the R07.2 gap."
    ],
    "sources": [
     {
      "sourceId": "conrad-1999-finite-group-schemes-low-ramification",
      "locator": "Summary of some results of Fontaine, p. 4 of the author copy",
      "excerpt": "For any p-formal commutative group scheme G over k [...] we define the Dieudonne module M(G) = Hom(G, CWhat_k), the group of formal k-group scheme maps from G to CWhat_k. [...] The main result of this theory is that the functor M sets up an antiequivalence of abelian categories between p-formal commutative group schemes over k and certain topological D_k-modules.",
      "match": "Literal passage (all on p. 4 of the author copy, checked against the text layer); the proofs are in Fontaine [7] Ch. III (Conrad also cites [7] Ch. III Section 1.2 for the topology on M(G))."
     },
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 9.2, printed p. 601",
      "excerpt": "On sait que M est un foncteur contravariant de la categorie des p-groupes finis sur k dans celle des D_k-modules finis (i. e. des D_k-modules a gauche dont le A-module sous-jacent est de longueur finie) et que M induit une anti-equivalence entre ces deux categories.",
      "match": "Literal recall, checked on the page image of p. 601 (the text layer is garbled); the characterization by primitive covectors is on the same page."
     }
    ]
   }
  },
  "added": [],
  "removed": []
 },
 "links": {
  "added": [
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/universal-structure-constants-by-gauss-sums",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/valuation-analysis-of-F-vector-space-prolongations",
    "reason": "The bounds (2) and (2'), 0 <= v(delta_i) <= e = v(p), come from gamma_i delta_i = w with gamma_i, delta_i in R and v(w) = v(p) = e (w = pu, Proposition 1.3.1(2)). Raynaud cites only Corollary 1.5.1 for (1)-(2); the classification of Corollary 1.5.2 (strictly henselian R) is not what is used here.",
    "sources": [
     {
      "sourceId": "raynaud-1974-schemas-en-groupes-p-p",
      "locator": "Section 3.3, formulas (1)-(2), p. 266; Proposition 1.3.1(2), p. 252"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/F-structure-extends-to-maximal-and-minimal-prolongations",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/finite-flat-prolongation-criterion-for-F-vector-space-schemes",
    "reason": "The proof replaces the prolongation by one carrying the F-structure (Raynaud cites 'prop. 3.3.2'). What is used is that the maximal prolongation G+ is an R-scheme in F-vector spaces, Proposition 3.3.1. The characterization 3.3.2(1) of G+ by valuation bounds is not used.",
    "sources": [
     {
      "sourceId": "raynaud-1974-schemas-en-groupes-p-p",
      "locator": "Section 3.4, proof of Theorem 3.4.3, p. 270"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/etale-multiplicative-dichotomy-when-e-equals-p-minus-1",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/supersingular-elliptic-p-torsion-over-an-unramified-base-is-a-level-two-vector-space-scheme",
    "reason": "For p = 2 an absolutely unramified base has e = 1 = p-1, so the F-structure on Gcal = Ecal[2] in step (b) of the Example comes from Proposition 3.3.2(3) (G simple, R henselian), not from 3.3.2(2).",
    "sources": [
     {
      "sourceId": "raynaud-1974-schemas-en-groupes-p-p",
      "locator": "Example, part (b), printed p. 271; Proposition 3.3.2(3), p. 267"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/schematic-closure-of-a-generic-subgroup-over-a-dvr",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/supersingular-elliptic-p-torsion-over-an-unramified-base-is-a-level-two-vector-space-scheme",
    "reason": "Step (a) of the Example takes the schematic closure in Gcal of a putative rank-p subgroup H of the generic fibre; the closure is a finite flat subgroup (Section 2.1), to which the rank-p classification is applied.",
    "sources": [
     {
      "sourceId": "raynaud-1974-schemas-en-groupes-p-p",
      "locator": "Example, part (a), printed p. 271 ('dont l'adherence schematique dans G')"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-shifted-ramification-numbering",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/different-bound-for-points-of-such-algebras",
    "reason": "Remark 1.9(i) reads Proposition 1.7(ii) as G_K^(u) in Gal(Kbar/L) for u > v_K(a) + e/(p-1) through Remark 1.2(ii) (u_{L/K} is the least u with G_K^(u+epsilon) in Gal(Kbar/L)), which the numbering node records.",
    "sources": [
     {
      "sourceId": "fontaine-1985-pas-de-variete-abelienne-sur-Z",
      "locator": "Remark 1.9(i), p. 524 ('cf. rem. (ii) du n. 1.2')"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/simple-objects-of-MF-tor-killed-by-pi",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/endpoint-collision-of-rank-one-objects-M1-0-and-M1-q-minus-1",
    "reason": "The node's derivation that M(1; 0) and M(1; q-1) are nonisomorphic simple objects (so that the collision contradicts fullness) uses Lemma 4.9(ii): Hom(M(1; j'), M(1; j)) != 0 only if j = j'. This step is the node's, not written in 0.9.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Lemma 4.9(ii), printed p. 568; Introduction 0.9, p. 551"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/contravariant-torsion-galois-functor-U-S",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/evaluation-map-into-galois-dual-is-injective",
    "reason": "Proposition 5.15 defines Mhat = Hom_{O[G]}(U_S(M), T_infinity) and xi(x)(u) = u(x) through the identification U_S(M) = Hom_MF(M, T_infinity) of Proposition 5.5 ('Rappelons (prop. 5.5) que ...').",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 5.15, printed p. 580"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/rational-functor-U-S-K-dimension-and-injectivity",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/admissibility-with-E-coefficients-and-comparison-with-V-B",
    "reason": "Proposition 8.12(ii) compares the functor U_{S_K} of 7.16 with V_B^* o t. Its indicated proof proceeds 'as for Theorem 8.4', i.e. through the injectivity and dimension statements of Proposition 7.17.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 8.12, Proposition and indicated proof, printed pp. 599-600"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/filtered-period-ring-S",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/points-of-a-finite-flat-p-group-equal-U-S-of-its-filtered-module",
    "reason": "The proof of 9.12 identifies CW_{-1}(Abar/pAbar) with BW(R)/BW_a(R) and embeds it in T_infinity = Shat_K/Shat. It uses BW(R) in B^+_a = Shat_K and Shat intersect BW(R) = BW_a(R) ([F2] Section 6), where Shat is the p-adic completion of the ring S of Section 2.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 9.12, preliminaries of the proof, printed pp. 605-606"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/lattice-functor-full-faithfulness-on-restricted-reductions",
    "target": "PotentialAutomorphyInfrastructure:PA.1",
    "reason": "PA.1 imports the 'integral Fontaine-Laffaille classification'. The classification part is full faithfulness of the lattice functor on objects whose reduction lies in MF_tor^{f,q'} (resp. q'') (Proposition 7.15(ii)). Same coefficient caveat as the link from Proposition 7.15(i): O is contained in A with K = E K_0, and arbitrary-O modules are not in the source.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 7.15(ii), printed p. 594"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules-with-coefficients-structure-lemmas",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-classification-of-p-divisible-groups-for-odd-p",
    "reason": "Corollary 2.2.22 and the groupoids of 2.2.9-2.2.19 are stated for the coefficient categories (Mod FI/S)_A and (Mod FI/Scalpha)_A of 1.2.1. The determinant condition in 2.2.9 and Lemma 2.2.17(1) use that (1 (x) phi)(phi^* M_A)/E(u)M_A is finite projective over A (Lemma 1.2.2(3)).",
    "sources": [
     {
      "sourceId": "kisin-2009-moduli-finite-flat-group-schemes",
      "locator": "Section 2.2.9-2.2.10 (\"finite free A-module by (1.2.2)(3)\", p. 1114) and proof of Lemma 2.2.17 (\"By (1.2.2)\", p. 1116)"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/crystalline-realization-functor-iota-of-a-kisin-module",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/barsotti-tate-groups-equivalent-to-kisin-modules-of-height-one-including-p-2",
    "reason": "The proof of Theorem 1.0.1 uses the injectivity of lambda for full faithfulness and diagram (2.2.2), lambda = lambdahat o theta, for essential surjectivity; both are constructed in Section 2.2.",
    "sources": [
     {
      "sourceId": "liu-2013-barsotti-tate-kisin-modules-p-2",
      "locator": "Section 2.3, paragraph after Proposition 2.3.1, p. 8 of the author copy; diagram (2.2.2), p. 8"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/schematic-closure-of-a-generic-subgroup-over-a-dvr",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/barsotti-tate-groups-equal-lattices-in-crystalline-representations-with-weights-0-1",
    "reason": "Essential surjectivity in Theorem 2.2.1 realizes a G_K-stable lattice T in V_p(H) as T_p(H') 'by the trick of scheme-theoretic closure of finite flat group schemes' together with Raynaud 2.3.1. The closure of a generic subgroup of a finite flat group over a DVR is flat (Raynaud 2.1); this gives the finite flat prolongations of the levels to which Raynaud 2.3.1 is applied.",
    "sources": [
     {
      "sourceId": "liu-2013-barsotti-tate-kisin-modules-p-2",
      "locator": "Theorem 2.2.1, proof, p. 5 of the author copy"
     },
     {
      "sourceId": "raynaud-1974-schemas-en-groupes-p-p",
      "locator": "Section 2.1, printed pp. 259-260"
     }
    ]
   },
   {
    "source": "PadicHodgeTheory:R06.2",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/crystalline-realization-functor-iota-of-a-kisin-module",
    "reason": "Liu passes from V_st(D) to 'the filtered (phi, N)-module associated to the semi-stable representation V_st(D) via Fontaine's theory', i.e. D_st. He then concludes crystallinity from N_D = 0. D_st, D_cris and their comparison are R06.2's stated scope ('Define D_HT, D_dR, D_cris and D_st and their comparison maps'). R06.2 does not cover Breuil's Ahat_st, the identification Q_p (x) Ttilde_cris = V_st(D) ([Liu08, 5.2.1]), semistability of V_st(D) ([Bre02, 2.2.5]) or the recovery of N_D mod I_+S ([Bre97]); these remain imports in the Liu 2013 gap.",
    "sources": [
     {
      "sourceId": "liu-2013-barsotti-tate-kisin-modules-p-2",
      "locator": "Section 2.2, paragraph after (2.2.1), p. 7 of the author copy"
     }
    ]
   }
  ],
  "removed": [
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/F-vector-space-schemes-over-strictly-henselian-dvr-classified-by-exponents",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/valuation-analysis-of-F-vector-space-prolongations",
    "reason": "The bounds 0 <= v(delta_i) <= e are the ones of Corollary 1.5.2 (v(w) = e).",
    "sources": [
     {
      "sourceId": "raynaud-1974-schemas-en-groupes-p-p",
      "locator": "Section 3.3, formulas (2) and (2'), p. 266"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/maximal-prolongation-characterized-by-valuation-bounds",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/finite-flat-prolongation-criterion-for-F-vector-space-schemes",
    "reason": "The proof first arranges that the F-structure extends to the prolongation (\"prop. 3.3.2\"), which is the maximal prolongation of Propositions 3.3.1-3.3.2.",
    "sources": [
     {
      "sourceId": "raynaud-1974-schemas-en-groupes-p-p",
      "locator": "Section 3.4, proof of Theorem 3.4.3, p. 270"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/restricted-subcategories-MF-prime-and-MF-double-prime",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/finite-flat-p-groups-over-W-k-anti-equivalent-to-MF-tor-f-2",
    "reason": "Unipotent Honda systems correspond to MF_tor^{f,2'}, the q = 2 case of the restricted subcategory.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 9.11, p. 604"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/breuil-anti-equivalence-for-finite-flat-group-schemes",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-classification-of-p-divisible-groups-for-odd-p",
    "reason": "The Breuil-side classification of p-divisible groups ([Br3, 4.2.2.9]) is composed with Cartier duality as in Corollary 1.1.7.",
    "sources": [
     {
      "sourceId": "kisin-2009-moduli-finite-flat-group-schemes",
      "locator": "Proof of Corollary 2.2.22, p. 1118"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/contravariant-dieudonne-module-anti-equivalence-over-a-perfect-field",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/finite-honda-systems-and-the-functor-LM-over-W-k",
    "reason": "A finite Honda system is a pair (L, M) with M = M(J_k) the Dieudonne module of the special fibre. The anti-equivalence M over k (Fontaine-Laffaille 9.2) is the first input of 9.5 and of Conrad Theorem 1.1.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Sections 9.2 and 9.5, printed pp. 601-602"
     },
     {
      "sourceId": "conrad-1999-finite-group-schemes-low-ramification",
      "locator": "Section 1, before Theorem 1.1, p. 5 of the author copy"
     }
    ]
   }
  ],
  "changed": [
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/F-vector-space-schemes-over-strictly-henselian-dvr-classified-by-exponents",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/etale-multiplicative-dichotomy-when-e-equals-p-minus-1",
    "reason": "The rank-p step uses the equations X^p = delta X of a rank-p F_p-vector space scheme with 0 <= v(delta) <= e = p-1 (Corollaries 1.5.1-1.5.2). That a non-etale one is of multiplicative type needs, in addition, formula (4) with r = 1 (v(delta) = (p-1) v(alpha) relative to the etale G+; node valuation-analysis, link from it already present). So the exponent is 0 or p-1.",
    "sources": [
     {
      "sourceId": "raynaud-1974-schemas-en-groupes-p-p",
      "locator": "Section 3.3, end of the proof of Proposition 3.3.2(3), p. 268"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/uniqueness-of-F-vector-space-prolongation-when-e-less-than-p-minus-1",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/composition-series-with-vector-space-quotients-when-e-at-most-p-minus-1",
    "reason": "For e < p-1 the prolongations of the generic F_i-vector space quotients are F_i-vector space schemes (Proposition 3.3.2(2)). This is a candidate route: Corollary 3.3.7 has no written proof in the source.",
    "sources": [
     {
      "sourceId": "raynaud-1974-schemas-en-groupes-p-p",
      "locator": "Section 3.3, Proposition 3.3.2(2), p. 267 (candidate route for Corollary 3.3.7, p. 268, which has no written proof)"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/etale-multiplicative-dichotomy-when-e-equals-p-minus-1",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/composition-series-with-vector-space-quotients-when-e-at-most-p-minus-1",
    "reason": "For e = p-1 the same conclusion comes from Proposition 3.3.2(3) (simple quotients, henselian base). This is a candidate route: Corollary 3.3.7 has no written proof in the source.",
    "sources": [
     {
      "sourceId": "raynaud-1974-schemas-en-groupes-p-p",
      "locator": "Section 3.3, Proposition 3.3.2(3), p. 267 (candidate route for Corollary 3.3.7, p. 268, which has no written proof)"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/composition-series-with-vector-space-quotients-when-e-at-most-p-minus-1",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/determinant-of-the-generic-fibre-by-the-tame-different-character",
    "reason": "The general case is deduced by devissage along the composition series of Corollary 3.3.7, which is where e <= p-1 enters. Corollary 3.3.7 has no written proof, and the devissage also needs the multiplicativity of the absolute different in short exact sequences, which the source does not state (gap).",
    "sources": [
     {
      "sourceId": "raynaud-1974-schemas-en-groupes-p-p",
      "locator": "Section 4.1, \"Par devissage (cor. 3.3.7)\", p. 272"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/filtered-period-ring-S",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/ext-vanishing-against-reduced-S-for-simple-objects",
    "reason": "The computation replaces Stilde by Ttilde (Proposition 5.5) and then uses Proposition 5.9, derived from Lemma 5.4 (generators of S^i and values of phi^i_S) and Lemma 5.7, which identifies Ttilde with (Abar^v/pi Abar^v)[xi].",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Sections 5.4-5.9, pp. 571-574"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fundamental-characters-of-level-h",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/tame-inertia-character-on-U-S-of-simple-objects",
    "reason": "5.13: a nonzero solution ahat_{h-1} of (6) is the mu-th power of a (q^h-1)-th root of pi, so by the definition of chi_h (5.1) g ahat_{h-1} = chi_h^mu(g) ahat_{h-1}.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 5.13, p. 579"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/ext-vanishing-against-reduced-S-for-simple-objects",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/length-equality-and-ext-vanishing-against-S-infinity",
    "reason": "Ext^1(M, Stilde) = 0 for simple M (5.3(i), via 3.6) splits the extension Ker(pi_T) in the proof of Lemma 3.9.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Lemma 3.9, pp. 563-564"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/rank-one-hom-into-reduced-S-for-simple-objects",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/length-equality-and-ext-vanishing-against-S-infinity",
    "reason": "dim Hom(M, Stilde) = dim_k M for simple M (5.3(ii), via 3.6) is the base case of the length induction (Lemma 3.9, 3.10).",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Lemma 3.9 and 3.10, pp. 563-564"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/torsion-functor-U-S-is-exact-faithful-and-length-preserving",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/full-faithfulness-of-U-S-on-MF-prime",
    "reason": "6.5 begins 'D'apres le theoreme 4.3 [sic; Theorem 3.3 is meant] le foncteur U_S est exact et fidele' and reduces fullness to Ext^1-injectivity for simple objects.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 6.5, p. 584"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/rank-one-hom-into-reduced-S-for-simple-objects",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/full-faithfulness-of-U-S-on-MF-prime",
    "reason": "6.9 (proof of Proposition 6.7) uses from 5.12 that computing U_S of a simple object reduces to an equation X^{q^h} = pi^mu X, and from 5.13 that G acts through its roots.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 6.9, p. 586"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/filtered-period-ring-S",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/full-faithfulness-of-U-S-on-MF-prime",
    "reason": "Propositions 6.7 and 6.10 work inside the sub-objects Ttilde_L = (A_L^v/pi A_L^v)[xi] of Ttilde = (Abar^v/pi Abar^v)[xi], the reduction of S described in 5.9 from Lemma 5.4.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Sections 6.7 and 6.10, pp. 584-588"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/finite-honda-systems-and-the-functor-LM-over-W-k",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/points-of-a-finite-flat-p-group-equal-U-S-of-its-filtered-module",
    "reason": "The proof of 9.12 starts from the description of J(S) by D_k-linear maps into covectors (9.6), applied to the completion A_C of Abar (J(Abar) = J(A_C)). The source's text cites 'le n. 9.7' here; the points description is 9.6 (9.7 defines I). The written proof of 9.6 read in review (Conrad 1999 Cor. 1.8) covers p odd or J unipotent, which is the hypothesis of 9.12.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 9.13, p. 606"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/contravariant-torsion-galois-functor-U-S",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/points-of-a-finite-flat-p-group-equal-U-S-of-its-filtered-module",
    "reason": "U_S(M) = Hom_MFcal(M, S_infinity) (Lemma 3.8; equivalently Hom_MF(M, T_infinity), cf. 5.5 and 6.2) is the target that contains Hom_MF(M, CW_{-1}(Abar/pAbar)). 9.12 embeds CW_{-1} into T_infinity = Shat_K/Shat; 9.13 writes S_infinity.",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Sections 9.12 (end) and 9.13, p. 606; Lemma 3.8, p. 563"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/lattice-functor-full-faithfulness-on-restricted-reductions",
    "target": "LocalGaloisDeformationRings:L7",
    "reason": "L7 asks to 'construct Fontaine-Laffaille deformation conditions in the proven unramified small-weight range' and to compute their tangent spaces. Fontaine-Laffaille supply a fully faithful, exact functor on strongly divisible lattices whose reduction lies in MF_tor^{f,q'} or MF_tor^{f,q''} (Proposition 7.15(ii)), together with the finite-level Theorem 6.1. They construct no deformation condition and compute no tangent space; that is L7's own work. Coefficient caveat: the coefficient ring O is the ring of integers of a subfield E of K with K = E K_0 (0.3). For an unramified base K = K_0 this forces O = W(F_q) inside W(k), with Phi tau = sigma^r-semilinear and filtration bound q = #(O/pi). Fontaine-Laffaille modules with an arbitrary coefficient ring O acting on W(k)-objects, with weights in [0, p-2] in every embedding, are not in this source (gap on coefficients).",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 7.15, pp. 593-594"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/lattice-functor-U-S-is-exact-faithful-and-rank-preserving",
    "target": "PotentialAutomorphyInfrastructure:PA.1",
    "reason": "PA.1 states that R07.3 'supplies the integral Fontaine-Laffaille classification and lattice comparison' and asks to retain the weight-interval, coefficient and unramified-base inequalities. Proposition 7.15(i) supplies the lattice functor on MF^{fd,q}_{K/O}: exact, faithful and rank preserving, with filtration in [0, q-1] and K = E K_0. Coefficient caveat as for L7: O is contained in A, so for an unramified K only O = W(F_q) is covered, with tau = sigma^r and bound q. Fontaine-Laffaille modules with an arbitrary coefficient ring are not in the source (gap on coefficients).",
    "sources": [
     {
      "sourceId": "fontaine-laffaille-1982-construction",
      "locator": "Section 7.14-7.15, pp. 593-594"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/breuil-anti-equivalence-for-finite-flat-group-schemes",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/galois-module-of-a-kisin-module-over-K-infinity",
    "reason": "The comparison is with Gr_D(Mcal)(O_Kbar), i.e. the group scheme attached by Breuil's functor composed with Cartier duality.",
    "sources": [
     {
      "sourceId": "kisin-2009-moduli-finite-flat-group-schemes",
      "locator": "Proof of Proposition 1.1.13, p. 1095"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/breuil-anti-equivalence-for-finite-flat-group-schemes",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-and-multiplicative-kisin-modules",
    "reason": "The criterion is about Gr_D(Mcal) being etale or multiplicative.",
    "sources": [
     {
      "sourceId": "kisin-2009-moduli-finite-flat-group-schemes",
      "locator": "Lemma 1.1.15, p. 1095"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules-over-S-and-injectivity-of-linearized-frobenius",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules-with-coefficients-structure-lemmas",
    "reason": "(Mod FI/S)_A is defined in 1.2.1 as objects of '(Mod/S) (1.1.8) with an A-action. Lemma 1.2.2(1) does not cite Lemma 1.1.9; it repeats the determinant argument, with E(u)^r in place of u^{er}.",
    "sources": [
     {
      "sourceId": "kisin-2009-moduli-finite-flat-group-schemes",
      "locator": "Proof of Lemma 1.2.2, p. 1096"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/maximal-multiplicative-subobject-and-maximal-etale-quotient-with-coefficients",
    "target": "LocalGaloisDeformationRings:R08.4",
    "reason": "R08.4 must prove connectedness and component comparisons \"separately in the ordinary and nonordinary cases\". Kisin 2009 Proposition 2.4.14, which is used to formulate the conjecture on connected components (2.4.13), is \"a strengthened version of (1.2.11)\". Its proof applies Proposition 1.2.11 at each closed point, together with 1.2.2(4), 1.2.11(2) and 1.2.9(2). The rest of Sections 2.4-2.5 was not decomposed in this packet. Note on scope: 2.4.13-2.4.16 use Proposition 2.4.14 (proved via 1.2.11 at closed points, with (1.2.2)(4), (1.2.7)(4), (1.2.11)(2), (1.2.9)(2)) to define GR^{v,loc,d}_{V_F,0} by the ranks (d^et, d^m) of the maximal etale quotient and multiplicative subobject. This is the ordinary/non-ordinary splitting. The connectedness statement there is only Conjecture 2.4.16; the component results actually used in Kisin's modularity arguments (Sections 2.4-2.5, beyond pp. 1129-1132) were not read.",
    "sources": [
     {
      "sourceId": "kisin-2009-moduli-finite-flat-group-schemes",
      "locator": "Section 2.4.13-2.4.14 and proof of Proposition 2.4.14, pp. 1129-1132"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/krasner-criterion-for-embedding-L-from-approximate-points",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/ramification-bound-for-points-of-such-algebras",
    "reason": "The bound u_{L/K} <= v_K(a) + e/(p-1) + 1/n comes from Proposition 1.5(ii) applied to property (P_m).",
    "sources": [
     {
      "sourceId": "fontaine-1985-pas-de-variete-abelienne-sur-Z",
      "locator": "Proof of Proposition 1.7(ii), pp. 523-524 ((P_m) invoked 'cf. n. 1.5' on p. 523; 'D'apres la Proposition 1.5, on a donc m > u_{L/K} - n^{-1}' on p. 524)"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/different-bound-for-points-of-such-algebras",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-upper-ramification-bound-for-finite-flat-p-power-torsion",
    "reason": "The group-theoretic form G_K^(u) in Gal(Kbar/L) for u > v_K(a) + e/(p-1) is Remark 1.9(i) (via Remark 1.2(ii)). The proof of Theorem 1 cites only 'la Proposition 1.7 et son Corollaire 1.8'. Reading the conclusion G^(u) in H off 1.7(ii) is exactly Remark 1.9(i) with a = p^n.",
    "sources": [
     {
      "sourceId": "fontaine-1985-pas-de-variete-abelienne-sur-Z",
      "locator": "Remark 1.9(i), p. 524; Theorem 1, p. 525"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-upper-ramification-bound-for-finite-flat-p-power-torsion",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-different-bound-for-torsion-fields",
    "reason": "The different bound of Theorem 1 needs the verification of the hypotheses of Proposition 1.7 constructed in the proof recorded at the ramification node, not its ramification conclusion. That verification consists of case (a) (J lci via Demazure, Omega^1 = B (x) omega_J free over B/p^n) and the case (b) reduction to Gamma_{p^n} through a Barsotti-Tate embedding. The source proves both conclusions in one proof.",
    "sources": [
     {
      "sourceId": "fontaine-1985-pas-de-variete-abelienne-sur-Z",
      "locator": "Proof of Theorem 1(b), pp. 525-526"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-different-bound-for-torsion-fields",
    "target": "SmallRamificationAndAbelianVarietyBaseCases:R25.1",
    "reason": "R25.1 asks to \"derive the local discriminant upper bounds for the torsion fields appearing in the source, with wild ramification retained\". Fontaine's Corollary v_0(D_{L/K}) < n + 1/(p-1) (equivalently Theorem 1, v_K(D_{L/K}) < e(n + 1/(p-1))) is the local input. The proof of Fontaine's Theorem 3 (3.3.1) quotes it to bound the discriminant exponent r_P < [F:E] e_P (n + 1/(p-1)), and Corollary 3.3.2 gives |d_F|^{1/[F:Q]} < |d_E|^{1/[E:Q]} p^{n+1/(p-1)}. Those global statements and the Odlyzko-Poitou-Serre comparison belong to R25.1 and are not decomposed here.",
    "sources": [
     {
      "sourceId": "fontaine-1985-pas-de-variete-abelienne-sur-Z",
      "locator": "Introduction 0.2 and Corollary, pp. 516-517; Theorem 3 (3.3.1) proof and Corollary 3.3.2, p. 531"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-upper-ramification-bound-for-finite-flat-p-power-torsion",
    "target": "SmallRamificationAndAbelianVarietyBaseCases:R25.1",
    "reason": "R07.6's atlas text requires \"the convention translation to R01 before exporting this to SmallRamificationAndAbelianVarietyBaseCases\". The node supplies the upper-numbering cutoff u > e(n + 1/(p-1)) in Fontaine's convention G^(u) = G^{u-1} (Remark 1.2(i)). Caveat from the review: Fontaine's own discriminant bound (Theorem 3, p. 531) uses only the different bound, not this cutoff. R25.1 consumes the cutoff only if its chosen route derives discriminant bounds from upper-numbering ramification groups. The 'R01' of the translation has no atlas owner: R01.2's description does not mention upper numbering, and the atlas owner of Herbrand functions is tauceti LocalFieldsRamification Layer 3, restricted to finite residue fields.",
    "sources": [
     {
      "sourceId": "fontaine-1985-pas-de-variete-abelienne-sur-Z",
      "locator": "Introduction 0.1 and Remarks 1.2, pp. 515-518"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/uniqueness-of-F-vector-space-prolongation-when-e-less-than-p-minus-1",
    "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/supersingular-elliptic-p-torsion-over-an-unramified-base-is-a-level-two-vector-space-scheme",
    "reason": "Step (b) uses Proposition 3.3.2 (printed 'prop. 3.3.2') to see that Gcal itself carries the F-vector space structure. For odd p this is part 2o (e = 1 < p-1). For p = 2 (e = 1 = p-1) it is part 3o, supplied by the added link from the e = p-1 dichotomy node.",
    "sources": [
     {
      "sourceId": "raynaud-1974-schemas-en-groupes-p-p",
      "locator": "Example, part (b), printed p. 271"
     }
    ]
   }
  ]
 },
 "gaps": [
  {
   "title": "Tate, p-divisible groups (Driebergen 1966) is absent: p-divisible group foundations and two Raynaud imports are unread",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-prolongation-from-levelwise-finite-flat-prolongations",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/absolute-different-and-haar-measures-of-a-finite-flat-group"
   ],
   "detail": "Raynaud uses Tate [13] twice. The uniqueness in Proposition 2.3.1 is Tate's theorem ([13], p. 180) that morphisms of generic fibres of p-divisible groups over R extend uniquely. The appendix uses duality for finite locally complete intersection algebras ([13], p. 165). R07.1 also asks for the definition of p-divisible groups, their Tate modules and the comparison of duality with the cyclotomic twist, and no source read in this packet proves these. The supplied library has no copy of Tate's paper (the only Tate items are tate-thesis.pdf and ADD_Tate_K2Galois.pdf). Next source action: obtain Proceedings of a Conference on Local Fields (Springer 1967), pp. 158-183 and read the definitions of p-divisible groups and Tate modules and the results used by Raynaud at pp. 165 and 180; until then these are import boundaries."
  },
  {
   "title": "Serre 1972 (Proprietes galoisiennes des points d'ordre fini des courbes elliptiques), Section 1, is absent",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/tame-inertia-as-inverse-limit-of-roots-of-unity",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/tame-characters-of-jordan-holder-quotients-of-finite-flat-p-groups"
   ],
   "detail": "Raynaud 3.1 states that its description of tame inertia (the canonical isomorphisms i_n, the identification I_t = lim mu_{q-1}(k), the characters j_q) is taken directly from Serre [12], Section 1. Remark 3.4.5 attributes the one-dimensional formal group case of Corollary 3.4.4 to Serre [12] 1.9-1.10 and the conjecture to [12] 1.13. Raynaud also notes that his fundamental characters differ slightly from Serre's ([12], p. 267). Serre 1972 is not in the supplied library. Next source action: obtain Invent. Math. 15 (1972), 259-331, read Section 1 (1.1-1.13), and record the translation between Serre's and Raynaud's fundamental characters before any Serre-weight consumer imports theta_{q-1}."
  },
  {
   "title": "Raynaud Corollaries 3.3.6 and 3.3.7 are stated without written proofs",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/generic-fibre-full-faithfulness-when-e-less-than-p-minus-1",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/flatness-of-extended-kernel-and-cokernel-when-e-less-than-p-minus-1",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/injectivity-of-generic-fibre-on-ext-when-e-less-than-p-minus-1",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/composition-series-with-vector-space-quotients-when-e-at-most-p-minus-1"
   ],
   "detail": "On printed p. 268 of Raynaud 1974, Corollaries 3.3.6 and 3.3.7 follow Theorem 3.3.3 with no proof. The rendered page image shows nothing between the statements. Conrad (Compositio 1999, author copy) writes out the passage from \"a morphism is an isomorphism iff it is so on generic fibres\" plus Raynaud Prop. 2.2.2 to full faithfulness (proof of Corollary 1.6). For e > 1, though, he cites Raynaud Cor. 3.3.6(1) for that isomorphism detection and for the stability of the category under kernels (Lemma 4.1). The flatness of Ker(u) and Coker(u), the Ext^1 injectivity and the composition series of 3.3.7 therefore have only candidate routes, recorded in the nodes and not taken from any source. Next source action: find a written proof. Candidates are Tate, \"Finite flat group schemes\" (in Modular Forms and Fermat's Last Theorem, 1997), and later expositions of Raynaud's theorem; both are unchecked. Otherwise have the candidate routes independently reviewed, fixing the category in which Ext^1 is taken."
  },
  {
   "title": "Generic finite-flat foundations of R07.1 are not source-decomposed: Cartier duality, connected-etale sequences, fpqc descent, fppf quotients",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/schematic-closure-of-a-generic-subgroup-over-a-dvr",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/absolute-different-and-haar-measures-of-a-finite-flat-group"
   ],
   "detail": "R07.1 asks for Cartier duality, connected-etale sequences over the allowed bases, generic and special fibres, finite-flat subgroup and quotient constructions and fpqc descent. Raynaud uses Cartier duality throughout (e.g. Proposition 2.2.2, Remark 1.5.3). In 2.1 he also asserts, without proof or reference, that the fppf quotient of a finite R-group scheme by a finite flat closed subgroup is representable by a finite R-scheme. None of these foundations is proved in the sources read (Raynaud 1974 and Conrad 1999 both assume them; Conrad refers to Fontaine's Groupes p-divisibles sur les corps locaux, Asterisque 47-48, for Dieudonne theory). SGA 3, Oort-Tate and Tate 1967 are not in the library. Local library check: Mathlib has RingTheory/HopfAlgebra/Basic.lean; the TauCeti library has AlgebraicGeometry/AffineGroupScheme (Basic, BaseChange, Connected, Smooth, Torus, Unipotent, ...). Whether Cartier duality of finite locally free commutative group schemes or quotient representability exists there is unchecked. Next action: choose a written source (e.g. SGA 3 Exp. V/VI_A, or Oort-Tate Section 1) and decompose these constructions separately, or identify an existing supplier stage (AlgebraicModuliForArithmeticGeometry R09.3 is the only atlas prerequisite of R07.1; its scope was not checked in this packet). Reviewer (REVIEW-EXT-13-EXT-07B): the atlas description of AlgebraicModuliForArithmeticGeometry:R09.3 was read. It promises effective descent for finite flat groups, polarisations and projective objects, which covers the fpqc-descent item. It does not promise Cartier duality, connected-etale sequences or representability of fppf quotients by finite flat subgroups, so these three still have no supplier. Two further foundational inputs are cited without proof: that the Cartier dual of the constant group F^+ has the group bialgebra ([4] = SGA 3 II, p. 3, in 1.3), and, in the appendix, that G' is locally a complete intersection 'because it is a subgroup scheme of a smooth group' (no reference)."
  },
  {
   "title": "Classical imports inside Raynaud Sections 1 and the appendix are unread",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/universal-structure-constants-by-gauss-sums",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/absolute-different-and-haar-measures-of-a-finite-flat-group",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/jordan-holder-devissage-of-etale-or-multiplicative-p-power-groups"
   ],
   "detail": "Proposition 1.3.1 uses the Gauss-sum identities g(chi)g(chi^{-1}) = q chi(-1) (Weil 1949 [14], p. 501) and g(chi^p) = g(chi) (Lang, Algebraic Number Theory [8], p. 93), with Jacobi sums from [14] p. 500. The appendix uses coherent duality (Hartshorne, Residues and Duality [7], III Sections 6-7) and the fact that G' is a local complete intersection. Proposition 3.2.1 uses the fixed-point lemma for p-groups acting on F_p-vector spaces (Serre, Corps locaux [11], p. 146), and 2.1 uses flatness of torsion-free modules over a DVR (EGA IV_2 [5], p. 33). These are standard, but they were not read here. Next action: confirm each against its cited page, or match them to Mathlib. Candidate Mathlib declarations were located by grep but not checked against the exact statements used: gaussSum_mul_gaussSum_eq_card and gaussSum_frob (NumberTheory/GaussSum.lean), jacobiSum (NumberTheory/JacobiSum/Basic.lean), IsPGroup.card_modEq_card_fixedPoints (GroupTheory/PGroup.lean). Reviewer: Lemma 5 of the appendix also calls the description of the smallest translation-stable subspace 'classique' and cites [6] = SGA 2, p. 404; unread. Raynaud's remark on p. 249 citing Lang [8] p. 90 for the valuations of Gauss sums is not a dependency, since Raynaud rederives them in Proposition 1.3.1."
  },
  {
   "title": "Fontaine's prerequisite works [F1], [F2], [F4] and Fontaine-Wintenberger are absent: the ring R, W_K(R), theta, B^+_a, V_B, D_B and the admissibility criteria are imported",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/filtered-period-ring-S",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/weakly-admissible-filtered-modules-with-E-coefficients",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/U-S-K-agrees-with-dual-of-V-B-for-E-equal-Qp",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fontaine-laffaille-admissibility-for-filtration-length-less-than-p",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/points-of-a-finite-flat-p-group-equal-U-S-of-its-filtered-module",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/ext-vanishing-against-reduced-S-for-simple-objects",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/admissibility-with-E-coefficients-and-comparison-with-V-B"
   ],
   "detail": "Section 2 of Fontaine-Laffaille recalls without proof the ring R, its valuation and the expansions in W(R) ([F4] Ch. V Section 1, [F-W]), and the homomorphism theta^0 with principal kernel ([F2], Prop. 2.4). The proof of Theorem 8.4 imports several further results: the identification Shat_K = B^+_a ([F2] Section 4); the admissibility criterion dim D_B(V) = dim V ([F1] n. 3.2 and Prop. 3.4.3); admissibility of one-dimensional weakly admissible modules ([F1] Prop. 4.4.1); stability of B-admissible modules under tensor product; and Proposition 7.5 on weakly admissible modules ([F1] Prop. 4.2.1). Proposition 9.12 imports the bivectors BW(R) inside B^+_a ([F2] Section 6). None of Asterisque 65 (1979), Ann. of Math. 115 (1982) 529-577, or Asterisque 47-48 (1977) is in the supplied library. Candidate atlas suppliers are PadicHodgeTheory R06.1-R06.2, but their stated scope uses D_cris/B_cris and does not mention the Barsotti-Tate ring B, so the comparison B^+_a versus B_cris^+ must be supplied or checked. Next source action: obtain [F2] Sections 2, 4-6 and [F1] Sections 3-4 and read the cited propositions. Review addition (FL-A): 2.2 also takes the Witt-vector formulas from Serre, Corps locaux [Se2] Ch. II Section 6, and 5.9 asserts without proof that v_R(epsilon(g) - 1) >= p/(p-1) for g x_0 = epsilon(g) x_0, from which the triviality of the G-action on xi in Ttilde is deduced ('il en resulte facilement'). Proposition 8.12 (indicated proof) uses the same identification over K_0 with the ideal a = {x in R : v_R(x) >= q v(p)} ([F2] Section 4), together with the trace map W_K(R) -> W_{K_0}(R). Proposition 9.12 uses BW(R) in B^+_a = Shat_K and Shat intersect BW(R) = BW_a(R) ([F2] Section 6)."
  },
  {
   "title": "Laffaille 1980 (strongly divisible lattices) is absent: Proposition 7.8 is imported",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/strongly-divisible-lattices-exist-iff-weakly-admissible",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/rational-functor-U-S-K-dimension-and-injectivity",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fontaine-laffaille-admissibility-for-filtration-length-less-than-p"
   ],
   "detail": "Proposition 7.8 says a finite-dimensional Delta has a strongly divisible lattice iff it is weakly admissible. Its proof reduces to slopes >= 0 and then says: \"Si E = Q_p, c'est alors le theoreme 3.2 de [L1]. La demonstration de ce theoreme s'etend au cas considere ici en remplacant F par Phi et p par pi\". Laffaille, Groupes p-divisibles et modules filtres : le cas peu ramifie, Bull. SMF 108 (1980), 187-206, is not in the library. Theorem 8.4(i), the lattice functor and all its consumers depend on this. Next source action: obtain Bull. SMF 108 (NUMDAM hosts the journal) and read Theorem 3.2 with its proof. Direct users besides 7.8 itself: the proof of 7.17 (choice of a strongly divisible lattice) and the proof of Theorem 8.4(i) ('grace a la proposition 7.8')."
  },
  {
   "title": "Fontaine's classification of finite flat p-groups over W(k) by finite Honda systems ([F3], 1975): the written proof (Conrad 1999, Theorem 1.4) was read in review, but it rests on Fontaine's unread classification of p-divisible groups (Asterisque 47-48)",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/finite-honda-systems-and-the-functor-LM-over-W-k",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/finite-flat-p-groups-over-W-k-anti-equivalent-to-MF-tor-f-2",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/points-of-a-finite-flat-p-group-equal-U-S-of-its-filtered-module"
   ],
   "detail": "Fontaine-Laffaille 9.1-9.6 recall several results from [F3] and [F4] without proof: the Dieudonne anti-equivalence over k, the anti-equivalence LM for p != 2 (unipotent for all p), and the description of J(S) by D_k-linear maps into covectors. The independent review read Conrad 1999 (author copy), Section 1, through p. 17:\n* Theorem 1.1 with proof (pp. 6-8).\n* Lemma 1.3 (p. 9). It is proved by transport through Fontaine-Laffaille 9.10 and 1.8; Conrad cites the equivalence as '[9, Prop 8.10]', which is Proposition 9.10 in the published paper.\n* Theorem 1.4 with its proof in Steps 1-6 (pp. 10-15).\n* Corollary 1.7: every G is the kernel of an isogeny of p-divisible groups.\n* Corollary 1.8 (p. 16): points on all p-adic A-rings. This is the written proof of Fontaine-Laffaille 9.6 for p odd or J unipotent.\n* Theorem 1.9: a Galois-module quasi-inverse, which Conrad says Fontaine-Laffaille 9.12 gives 'in a slightly less precise form'.\nThe proof imports:\n* Raynaud 1974 Prop. 3.2.1, 3.3.2 and Cor. 1.5.1 (Step 1).\n* Fontaine, Groupes p-divisibles sur les corps locaux (Asterisque 47-48), Ch. III: Dieudonne theory (Section 1.5 Prop. 1.2, Section 1.7, Section 5.3 Cor. 2, Section 6.1 Rem. 3).\n* Asterisque 47-48, Ch. IV: Section 1.2 Thm 1 (classification of p-divisible groups over W(k) by the Honda systems H^d_A), Section 1.10 Rems 1-3, Prop. 1.1 and Prop. 1.4'.\nAsterisque 47-48 is not in the library. Fontaine-Laffaille 9.6 is stated without a condition at p = 2. Conrad's Corollary 1.8 covers p odd or J unipotent; for p = 2 and J connected he replaces w by a variant w^c (Step 6). The case of 9.6 for p = 2 and J neither unipotent nor connected has no written proof in the sources read, and Fontaine-Laffaille use 9.6 only for J unipotent at p = 2. Next source action: obtain Asterisque 47-48 Ch. III-IV (classification of p-divisible groups over W(k) and the torsion-point description) and record the Dieudonne-theory imports as R07.2 inputs."
  },
  {
   "title": "Parts of Fontaine-Laffaille are only indicated or left to the reader: full faithfulness on MF_tor^{f,q''}, Proposition 8.12 for E != Q_p, the JH-characterization of MF_tor^{f,q''}, and several steps in Sections 7-9",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/full-faithfulness-of-U-S-on-MF-double-prime",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/admissibility-with-E-coefficients-and-comparison-with-V-B",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/restricted-subcategories-MF-prime-and-MF-double-prime",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/lattice-functor-full-faithfulness-on-restricted-reductions",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/strongly-divisible-lattices-exist-iff-weakly-admissible",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/lattice-objects-and-their-torsion-reductions",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fontaine-laffaille-admissibility-for-filtration-length-less-than-p",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/honda-systems-are-equivalent-to-MF-tor-f-2",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/finite-flat-p-groups-over-W-k-anti-equivalent-to-MF-tor-f-2",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/points-of-a-finite-flat-p-group-equal-U-S-of-its-filtered-module"
   ],
   "detail": "Three passages are only indicated. Proposition 6.6 is proved only for MF_tor^{f,q'}: \"Nous ne demontrerons cette proposition que dans le cas de MF_tor^{f,q'} (on se contentera d'indications sur la facon de proceder pour MF_tor^{f,q''})\", and 6.12 sketches two methods. The Jordan-Hoelder characterization of MF_tor^{f,q''} in 6.4 is \"analogue\". Proposition 8.12 has only its comparison map indicated. The passage to the limit in Proposition 7.15 is stated as following from Theorems 3.3 and 6.1. Next action: write out 6.12 (either method) and the dimension argument of 8.12, or locate a later source that proves them.\n\nFurther steps in Sections 7-9 are asserted without proof (checked on page images in review):\n* the reduction to slopes >= 0 in Proposition 7.8 ('immediatement'; slopes need k algebraically closed, Remark 7.6);\n* Remark 7.13, and the freeness of U_S(M_n) in 7.14 ('On voit');\n* the decomposition D = D_1 (x) D_2 in the proof of Theorem 8.4(i);\n* Remark 8.13(c) ('On voit facilement');\n* Proposition 9.10 ('immediat');\n* 'unipotent iff I(L, M) in MF_tor^{f,2'}' in 9.11 ('on voit facilement');\n* that CW_{-1}(Abar/pAbar) -> T_infinity is a morphism of MFcal (9.12, 'Il est facile de voir');\n* the extension of I in 9.13;\n* the length identity lg J(Abar) = lg_A M in 9.13, which needs the order of J to be p^{lg M(J_k)} (Dieudonne theory).\n9.13 also cites 'le n. 9.7' for the points description, which is 9.6."
  },
  {
   "title": "Atlas statements for R07.3/R06.4 that are not literally in Fontaine-Laffaille: the common Tate shift, the e = 1 restriction, and the covariance/HT-sign translation",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/subinterval-0-to-q-minus-2-lies-in-MF-prime",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/U-S-K-agrees-with-dual-of-V-B-for-E-equal-Qp",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/endpoint-collision-of-rank-one-objects-M1-0-and-M1-q-minus-1"
   ],
   "detail": "Fontaine-Laffaille state three things differently from the atlas. (1) Their torsion categories are normalized by M^0 = M and M^q = 0. The [0, q-2] range lies in MF_tor^{f,q'} (derived node), but a statement for an arbitrary common shifted interval [a, a+p-2] is not in the paper. It needs a twisting argument, for instance via Remark 6.13(b), which gives U_S(M (x) N) = U_S(M) (x) U_S(N) only for M, N, M (x) N in MF_tor^{f,q'} with i + j < q and l + l' != q-1. (2) The paper is not restricted to e = 1. It treats K = E (x)_{E_0} K_0, with E a subfield of K containing a uniformizer of K, O-coefficients, tau = sigma^r and the bound q = #(O/pi) = p^r. Since e = [E : E_0], e = 1 exactly when E is unramified over Q_p (E = E_0, O = W(F_q), q = p^r), not only when E = Q_p. For r > 1 the torsion range [0, q-2] concerns tau-semilinear objects and is not a weight range [0, p-2] for O-coefficient representations. The ranges [0, p-2] and 'filtration length < p' are the case E = Q_p (r = 1). (3) U_S is contravariant, and Theorem 5.3(iii) gives chi_h^{i_0 + q i_1 + ...} on M(h; i). For E = Q_p, h = 1 the filtration jump j therefore gives omega^j, and rationally U_{S_K} is the dual V_B^*. The translation to a covariant functor with HT(chi_p) = +1 is not written in the source and must be proved from these two facts, after checking the normalization of V_B in [F2]. Next action: have the orchestrator decide whether R07.3 or R06.4 owns (1) and (3). Review addition (FL-A, page images of pp. 549-589): items (1)-(3) confirmed. Remark 6.13(b), the candidate route for the shift, is itself only asserted: after stating the conditions (i + j < q; l + l' != q-1 for Jordan-Hoelder quotients M(1; l), M(1; l')) the source says the map U_S(M) (x)_O U_S(N) -> U_S(M (x) N) is an isomorphism and 'on verifie facilement (par devissage, le cas ou M et N sont tous les deux simples est trivial)'. A shift argument through 6.13(b) must therefore first prove that remark. The atlas 'p = 2 safe interval [0, 0]' is derived (node subinterval-0-to-q-minus-2-lies-in-MF-prime) only when q = 2, e.g. E = Q_2; for p = 2 and a coefficient field E with residue field of size q = 2^r > 2 the derived range is [0, q-2]."
  },
  {
   "title": "Minor imports in Sections 4 and 7 are unread: Jacobson (semilinear fixed vectors) and Manin (Dieudonne-Manin classification)",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/simple-objects-of-MF-tor-killed-by-pi",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/weakly-admissible-filtered-modules-with-E-coefficients"
   ],
   "detail": "Lemma 4.8 uses Jacobson, The Theory of Rings ([J1] = Math. Surveys II, 3rd printing, AMS 1966, per the bibliography on p. 608), Th. 15, to obtain, for the bijective tau^h-semilinear map f^h on the finite-dimensional k-space N, some y != 0 and a in k with f^h(y) = a y; algebraic closedness of k is then used to rescale y so that f^h(y) = y (p. 568, page image). Remark 7.6 extends the Dieudonne-Manin classification ([M3]) to (K, Phi). Neither is in the library. Mathlib has WittVector.Isocrystal (RingTheory/WittVector/Isocrystal.lean), which classifies one-dimensional isocrystals over an algebraically closed field; whether it covers the semilinear fixed-vector lemma is unchecked. Next action: confirm the exact statement of Jacobson Th. 15 or match it to a Mathlib lemma."
  },
  {
   "title": "Breuil's classification papers are absent: Breuil's theorem (Kisin 1.1.3), [Br3 4.2.2.9] for p-divisible groups, and the p-torsion equivalences [Br4 3.3.2] are imports",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/breuil-anti-equivalence-for-finite-flat-group-schemes",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-to-breuil-module-functor-is-exact-and-fully-faithful",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/galois-module-of-a-kisin-module-over-K-infinity",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-classification-of-p-divisible-groups-for-odd-p"
   ],
   "detail": "Kisin 2009 Section 1.1 quotes several results from Breuil without proof: the anti-equivalence of Breuil modules with finite flat p-groups ([Br3] 4.2.1.6, 4.2.2.5); the corresponding statement for p-divisible groups ([Br3] 4.2.2.9); the description of Gr(Mcal)(O_Kbar) ([Br2] 2.3.11, [Br3] 5.3.1); the equivalence on p-killed objects and the Galois comparison ([Br4] 3.3.2); the finiteness of tangent spaces ([Br3] 2.1.2.2); and strict APF-ness of K_infinity/K ([Br1] 2.1.1). [Br3] is Breuil, Groupes p-divisibles, groupes finis et modules filtres, Ann. of Math. 152 (2000). Kisin's bibliography (printed p. 1178, read in review) identifies them: [Br1] Une application de corps des normes, Compositio 117 (1999) 189-203; [Br2] Representations semi-stables et modules fortement divisibles, Invent. Math. 136 (1999) 89-122; [Br4] Integral p-adic Hodge theory, Adv. Stud. Pure Math. 36 (2002) 51-80 (Liu's [Bre02]); [Br5] Schemas en groupes et corps des normes, preprint 1998, unpublished (cited for the functor 1.1.10 'cf. [Br5, 2.2]', for Prop. 1.1.11 'cf. [Br5, 3.1.3]' and as the source of Breuil's conjecture proved in 2.2.22, [Br5, 2.1.2]; Liu's [Bre]). None of the Breuil papers is in the supplied library. Next source action: obtain Breuil 2000 and read 2.1.2.2, 4.2.1.6, 4.2.2.5, 4.2.2.9 and 5.3.1; then [Br4] 3.3.2, [Br2] 2.3.11 and [Br1] 2.1.1. [Br5] may be unobtainable. The compatibility of the p-divisible anti-equivalence [Br3, 4.2.2.9] with Gr on the finite levels M/p^n is not stated by Kisin and should be checked there."
  },
  {
   "title": "Fontaine's theory of (phi, G_{K_infinity})-modules over O_E ([Fo], Grothendieck Festschrift) and [BCDT 5.1.3] are absent",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/galois-module-of-a-kisin-module-over-K-infinity",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/coefficient-functor-to-breuil-modules-and-galois-functor-T-S-A",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-and-multiplicative-kisin-modules"
   ],
   "detail": "The equivalence T : Phi M_{O_E} -> Rep_{Z_p}(G_{K_infinity}) and the comparisons used in Proposition 1.1.13 and Lemma 1.2.7 are quoted from Fontaine, Representations p-adiques des corps locaux I ([Fo], A.1.2.4(i), A.Section 1.2 (exactness, proof of 1.1.13), A.1.2.6, A.1.2.7, A.3, A.3.1.6 (Fr R algebraically closed), B.1.8.4). They need K_infinity/K to be strictly APF, which Kisin gets from 'the argument of [Br1, 2.1.1]' in the sense of Wintenberger [Win], Le corps des normes de certaines extensions infinies de corps locaux, Ann. Sci. ENS 16 (1983) 59-89 (also unread). The etale/multiplicative criterion (Lemma 1.1.15) uses Breuil-Conrad-Diamond-Taylor [BCDT] 5.1.3. Neither is in the supplied library. Candidate atlas supplier: PhiGammaModulesAndIwasawaCohomology (etale phi-modules); its stage scope was not checked in this packet. Next action: obtain Fontaine's Festschrift article, Appendix A, and BCDT (J. AMS 14, 2001) Section 5.1."
  },
  {
   "title": "Liu 2013 rests on unread imports: Kisin 2006 (T_S fully faithful), Liu 2007/2008/2010, Breuil 1997/2000/2002, Kisin 2009a Corollary 2.2.6, Fontaine 1979, Tate 1967",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules-of-height-one-and-the-functor-T-S",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/barsotti-tate-groups-equal-lattices-in-crystalline-representations-with-weights-0-1",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/crystalline-realization-functor-iota-of-a-kisin-module",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/G-stability-of-lambda-T-S-inside-T-cris",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/galois-action-on-T-S-through-J-of-M",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/u-divisibility-lemma-in-W-R-inside-B-cris-plus",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/barsotti-tate-groups-equivalent-to-kisin-modules-of-height-one-including-p-2"
   ],
   "detail": "The following imports in Liu 2013 were not read. Full faithfulness and rank of T_S come from Kisin, Crystalline representations and F-crystals (2006), 2.1.4 and 2.1.12, or Liu 2007, 4.2.6. The classification of lattices by (phi, Ghat)-modules is Liu 2010, Theorem 2.1.2. The G-action and the V_st comparison are Liu 2008, 5.1.1 and 5.2.1. Semistability of V_st(D) is Breuil 2002, 2.2.5, and recovering N_D is Breuil 1997. Crystallinity of V_p(H) is Fontaine 1979, the isogeny theorem is Tate 1967, and the principal generator of I^[1] is Fontaine 1994a, 5.1.3. The existence of a Barsotti-Tate group with given crystalline V is Kisin 2009a (Modularity of 2-adic Barsotti-Tate representations), Corollary 2.2.6; a copy of that paper is in the library as papers/SS_Kisin2.dvi and was not read here. Further unread imports found in review: [Liu10, Section 3.2] (the Ghat-action on Mhat agrees with the action (2.2.1); used in the claim of Proposition 3.2.1 and, via diagram (2.2.2), in the essential surjectivity of Section 2.3); [Liu10, Lemma 2.2.1] (Rhat/I_+ = W(k)) and [Liu10, Section 2.2] (G-stability of R_{K_0} and Rhat); [Liu10, proof of Lemma 3.2.2] (phi(t) generates I^[1]); [Liu07, Example 2.3.5] (existence of t); [Liu07, Example 5.3.3] and [Liu08, Lemma 3.3.4] (Remark 2.2.4); [Kis06, Proposition 2.2.2] (original proof of Proposition 2.2.2, whose anti-equivalence Liu does not prove); [CL11, Lemma 2.2.1] (Remark 2.1.1). Lemma 3.2.2 also uses the identity Fil^{i+1}A_cris intersect W(R) = E(u)^{i+1}W(R), which it asserts without proof or citation. Liu applies the Kis06 and Liu10 results with no restriction on p. Their validity at p = 2 is not re-argued in Liu 2013 and must be confirmed in those papers. Kisin 2009a was not publicly accessible on 2026-09-24: the Springer copy is paywalled, and the Harvard DASH record serves its full text only after authentication. Next source action: convert SS_Kisin2.dvi (dvipdfmx) and read Section 2.2 up to Corollary 2.2.6, then obtain Kisin 2006 and Liu 2010."
  },
  {
   "title": "R07.4 scope not covered by the sources read: descent data, potentially Barsotti-Tate and potentially semistable cases, and the base fields used in KW",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4"
   ],
   "detail": "R07.4 asks for \"descent data and generic-fibre comparison, for the base fields used in KW and Kisin\", separating the finite-flat, potentially Barsotti-Tate and merely potentially semistable cases. Kisin 2009 Section 1 assumes p != 2 and k finite and has no descent data. Liu 2013 treats Barsotti-Tate groups over O_K (height 1, no descent data). Kisin's potentially semistable deformation rings (papers/SS_KisinSemistable.dvi) and the 2-adic paper (papers/SS_Kisin2.dvi) are in the library but were not read. Kisin 2006, needed for Breuil-Kisin modules of general height (also requested by CohomologyComparisons:CP.5, whose gap names Kisin's Theorem 4.4-type functor), is not. The dyadic finite-flat (torsion) case is also uncovered. Liu 2013 treats only Barsotti-Tate groups, and Kisin 2009 footnote 2 (pp. 1115-1116) says that for p = 2 the relationship between these module categories and finite flat groups is not yet understood. No source read classifies finite flat group schemes at p = 2. Next action: read SS_KisinSemistable Section 1 and SS_Kisin2 Section 1-2 for descent data and the potentially Barsotti-Tate case, and decide with the orchestrator whether general-height Kisin modules belong to R07.4."
  },
  {
   "title": "Covariance and hypothesis mismatch between Kisin 2009 (Gr_D covariant, p > 2, k finite) and Liu 2013 (T_S contravariant, any p, k perfect)",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-classification-of-p-divisible-groups-for-odd-p",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/barsotti-tate-groups-equivalent-to-kisin-modules-of-height-one-including-p-2"
   ],
   "detail": "Kisin 2009 turns Breuil's anti-equivalence into an equivalence by Cartier duality (Corollaries 1.1.7 and 2.2.22), for p > 2 and k finite. Liu 2013 obtains a contravariant equivalence: his introduction (p. 2) calls M -> T_S(M) an anti-equivalence onto Rep^{cris,1}_{Z_p}, which is then composed with the covariant H -> T_p(H). Remark 2.2.5 relates iota and iota' = iota(-)^*(1) = iota(M^vee). This holds for any p and k perfect. A derived consistency check (review), not written in either source: under Kisin's Gr_D, S/p^n with phi(1) = 1 is multiplicative (Lemma 1.1.15), giving mu_{p^n}; under Liu, S with phi = 1 has T_S = W(R)^{phi=1} = Z_p with trivial action, giving Q_p/Z_p by Theorem 2.2.1. So the two classifications differ by Cartier duality (and variance), as expected. The sources read do not check that the two equivalences agree for p > 2, k finite (which Cartier dual, which Tate twist), nor the passage from k finite to k perfect for p > 2 (attributed by Liu to Kisin 2006). Next action: write the comparison through Kisin 1.1.13 (T(O_E (x) M)(1) = Gr_D(Mcal)(O_Kbar)) and Liu (2.1.1)-(2.2.2), fixing the covariance convention project-wide."
  },
  {
   "title": "Classical Dieudonne theory (Fontaine, Groupes p-divisibles sur les corps locaux; Demazure; Manin) is absent: R07.2 is decomposed only at statement level",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/witt-covectors-and-the-dieudonne-ring",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/contravariant-dieudonne-module-anti-equivalence-over-a-perfect-field"
   ],
   "detail": "Several R07.2 targets have no proof in the library. The covector group and D_k-module structure, the anti-equivalence M, the classification of p-divisible groups over perfect fields, heights and dimensions via Frobenius and Verschiebung, slopes, the ordinary/supersingular dichotomy, and the deformation theory over nilpotent thickenings are only recalled in Conrad 1999 (summary of Fontaine [7]) and Fontaine-Laffaille 9.1-9.2. Neither source proves any of them. Not in the supplied library: Fontaine, Asterisque 47-48 (1977); Demazure, Lectures on p-divisible groups (LNM 302); Manin 1963; Berthelot-Breen-Messing (LNM 930); Messing (LNM 264). Fontaine 1985 also imports from Demazure Ch. II the structure of the special fibre of a finite flat group. Local library check: Mathlib has WittVector (Frobenius, Verschiebung, Isocrystal with the one-dimensional Dieudonne-Manin classification) but no Witt covectors or Dieudonne modules of group schemes were found. Next source action: obtain Demazure LNM 302 Ch. II-III or Fontaine Asterisque 47-48 Ch. II-III; alternatively check whether the library's Scholze-Weinstein, Moduli of p-divisible groups (R02_DF_ScholzeWeinsteinModuli) proves any classical statement rather than citing it. Independent review (2026-09-24) found three details that only Fontaine [7] can settle. (a) Conrad prints the Teichmueller action on covectors as [x].a = (..., x^{p^{-n}} a_{-n}, ..., x^{p^{-1}} a_{-1}, a_0), with no factor x on the last coordinate, which does not fit the pattern at n = 0. (b) Fontaine-Laffaille 9.1 define covectors for arbitrary commutative k-algebras with the ideal-nilpotence condition (psi), not only finite k-algebras. (c) Neither Conrad nor Fontaine-Laffaille states the etale/multiplicative criteria (F resp. V bijective on M) that the CR.7 covariance check needs."
  },
  {
   "title": "Grothendieck-Messing deformation theory, the Serre-Tate comparison and deformation tangent/obstruction calculations of R07.6 are not source-decomposed",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/determinant-of-the-tate-module-of-a-p-divisible-group",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-upper-ramification-bound-for-finite-flat-p-power-torsion"
   ],
   "detail": "R07.6 asks for the deformation-theoretic tangent and obstruction calculations supplied to R08, the Grothendieck-Messing deformation equivalence over nilpotent PD bases, the comparison of finite-flat models under field extension and twisting, and the Galois-module comparison for abelian-scheme torsion. None of these is proved in the sources read. Raynaud's Theorem 4.2.1 imports unobstructedness of deformations of p-divisible groups (Lazard, Cartier, Grothendieck via Cartier's Bourbaki talk [2]). Fontaine's Theorem 1(b) imports Grothendieck's embedding of a finite flat group into a Barsotti-Tate group ([BBM], [I]). Conrad 1999 Theorem 4.8 (base change of Honda systems for e <= p-1) and Section 5 (applications to deformation rings) are candidates for model comparison under extension, but were not read. Next source action: obtain Messing LNM 264 and Illusie's Deformations de groupes de Barsotti-Tate (Asterisque 127); read Conrad 1999 Sections 4-5."
  },
  {
   "title": "R07.5 targets beyond Raynaud's supersingular example are unread or owned elsewhere: ordinary inertia, peu/tres ramifie criteria, the p = 2 weight dichotomy and the weight-two criterion for p >= 5",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/supersingular-elliptic-p-torsion-over-an-unramified-base-is-a-level-two-vector-space-scheme"
   ],
   "detail": "Three R07.5 items are unresolved. (1) The inertia characters of good ordinary elliptic-curve torsion (the connected-etale sequence of E[p] with multiplicative connected part) are proved in Serre, Proprietes galoisiennes (1972), Section 1.11-1.12, which is not in the library. Serre 1987 Section 2 (library file ADD_SERRE87) only uses fundamental characters and cites [41] = Serre 1972. (2) The extension-sensitive finite-flat criteria (Edixhoven 1992 Proposition 8.2, peu ramifie iff finite) and the Serre-weight consequences have already been decomposed by EXT-10 under AlgebraicModularFormsAndSerreWeights:R15.4 (nodes R15.4/finite-at-p-equals-peu-ramifie and R15.4/raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction). The orchestrator has an open decision on whether R07.5 or R15.4 owns them; this packet adds no duplicate nodes. (3) The p = 2 dichotomy and the p >= 5 weight-two criterion need Raynaud's results (R07.1 nodes) plus the Edixhoven argument. Next action: decide ownership, then either re-home the EXT-10 nodes under R07.5 or record R15.4 as the owner and narrow the R07.5 text; obtain Serre 1972 for the ordinary case."
  },
  {
   "title": "Fontaine 1985 imports: Serre Corps locaux (Ch. IV numbering, Prop. 4 p. 72, Prop. 12 p. 66, Prop. 14 p. 81, Ch. III Prop. 14), Krasner's lemma, Demazure, Fontaine 1982, Grothendieck's Barsotti-Tate embedding, and the unargued reduction to algebraically closed k",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-upper-ramification-bound-for-finite-flat-p-power-torsion",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/krasner-criterion-for-embedding-L-from-approximate-points",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-shifted-ramification-numbering",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/different-equals-u-minus-i",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/ramification-bound-for-points-of-such-algebras",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/different-bound-for-points-of-such-algebras",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-different-bound-for-torsion-fields"
   ],
   "detail": "Fontaine 1985 cites the following without proof. (1) Serre, Corps locaux [Se1] (2nd ed., Hermann 1968): Chap. IV for the ramification groups and Herbrand functions behind 1.1-1.2 (the dictionary of Remark 1.2(i) is stated without proof); Prop. 14, p. 81 (upper numbering passes to quotients, Remark 1.2(ii)); Prop. 4, p. 72 (v(D_{L/K}) as a sum of i(g) over g != 1, proof of Proposition 1.3); Prop. 12, p. 66 (O_L = O_K[alpha], 1.4); Chap. III, Prop. 14 (the different annihilates Omega^1, Remark 1.9(ii)). Fontaine cites Props. 4, 12 and 14 (p. 81) by page only. The draft placed Prop. 4 in Chap. III; that assignment is not in the source and is unverified. (2) Krasner's lemma (Lang, Algebraic Number Theory [L], p. 43), in 1.5(i). (3) Demazure [De] (LNM 302) Ch. II: J_k is etale x connected, with connected algebra k[X_i]/(X_i^{p^{r_i}}); used in Theorem 1(a). (4) Fontaine, Formes differentielles et modules de Tate des varietes abeliennes sur les corps locaux, Invent. Math. 65 (1982) 379-409 [Fo], n. 4.3: Omega^1_{B/O_K} = B (x) omega_J; used in Theorem 1(a). (5) Grothendieck's embedding of J into a Barsotti-Tate group ([BBM] LNM 930, [I] Asterisque 127), in Theorem 1(b); unnecessary for e = n = 1 (Remark 2.2(a)). (6) The reduction to an algebraically closed residue field at the start of the proof of Theorem 1 ('Il est clair que l'on peut supposer...') is not argued. (7) Sen [Sen] (Invent. Math. 17, 1972), cited only in Remark 2.2(c) and not used. None of these was read. Supplier check: the atlas stage covering Herbrand functions, upper numbering, quotient compatibility, the different and discriminant, and local monogenicity is tauceti:TauCetiRoadmap/LocalFieldsRamification Layer 3 (with Layer 0). Its stated scope is IsNonarchimedeanLocalField, i.e. finite residue field. Fontaine's Section 1 assumes only a perfect residue field, and Theorem 1's proof passes to an algebraically closed one. That layer would have to be generalized to complete discretely valued fields with perfect residue field, or R07.6 must supply these facts. Local library check: Mathlib's upper and lower ramification groups are only partially present (unchecked); Krasner's lemma in Mathlib is unchecked. Next action: read Serre, Corps locaux Ch. III Sections 3-6 and Ch. IV Sections 1-3 (not in the library). Choose a source for the Barsotti-Tate embedding, or restrict the exported theorem to the case e = n = 1, which avoids it. Ask the orchestrator whether LocalFieldsRamification Layer 3 will be generalized."
  },
  {
   "title": "Unwritten steps in Raynaud Section 4: multiplicativity of the absolute different (Theorem 4.1.1) and the deduction of Remark 4.1.2",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/determinant-of-the-generic-fibre-by-the-tame-different-character",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/determinant-of-the-tate-module-of-a-p-divisible-group"
   ],
   "detail": "The devissage 'Par devissage (cor. 3.3.7)' that extends Theorem 4.1.1 from F-vector space schemes to all finite flat groups killed by p (printed p. 272) needs D(Gcal) = D(Gcal') D(Gcal'') for a short exact sequence of finite flat R-groups. Raynaud neither states nor proves this: the appendix (pp. 274-279) proves only D(G) D(G') = (rank) for the Cartier dual (Proposition 9). Corollary 3.3.7, which provides the composition series, also has no written proof (see the gap on Corollaries 3.3.6-3.3.7). Remark 4.1.2 says Theorem 4.1.1 'can be deduced' from Theorem 4.2.1 for p-kernels of p-divisible groups without restriction on e. That needs v(D(X[p])) = e d (d the dimension), which is not written. Next action: prove multiplicativity of the different from its definition as the image of D^{(x)-1} -> R, or find a written source (e.g. Fontaine 1985 or Tate's Driebergen notes), and write v(D(X[p])) = ed."
  },
  {
   "title": "Fontaine-Laffaille coefficients lie inside the base field: the Fontaine-Laffaille modules with arbitrary coefficients over an unramified base that L7 and PA.1 use are not in the source",
   "neededBy": [
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/lattice-functor-U-S-is-exact-faithful-and-rank-preserving",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/lattice-functor-full-faithfulness-on-restricted-reductions",
    "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/admissibility-with-E-coefficients-and-comparison-with-V-B"
   ],
   "detail": "In Fontaine-Laffaille (0.3), E is a finite extension of Q_p contained in K, containing a uniformizer of K, with K = E (x)_{E_0} K_0. O is its ring of integers, and the objects are A-modules with tau = sigma^r-semilinear maps and filtration bound q = #(O/pi) = p^r. For an unramified base K = K_0 this forces O = W(F_q), a subring of W(k). By Remark 8.13(c) the essential image of U_{S_K} then consists of representations whose Hodge-Tate weights lie in [0, q-1] along the distinguished embedding epsilon and are 0 along the others. The consumers need something else. LocalGaloisDeformationRings:L7 (Fontaine-Laffaille deformation conditions 'in the proven unramified small-weight range') and PotentialAutomorphyInfrastructure:PA.1 ('retain their weight-interval, coefficient and unramified-base inequalities') use, in current practice, Fontaine-Laffaille modules over W(k) with an action of an arbitrary coefficient ring O and weights in [0, p-2] at every embedding; this is the review's reading of the stage texts. That theory is not in Fontaine-Laffaille 1982. It is obtained from the E = Q_p case by adding an O-action, and no source read here writes this out. Next source action: identify and read a written source for Fontaine-Laffaille modules with coefficients (candidates, unchecked: Clozel-Harris-Taylor 2008 Section 2.4.1; Barnet-Lamb-Gee-Geraghty-Taylor). Until then the links to L7 and PA.1 carry this caveat."
  }
 ],
 "coverage": [
  {
   "stageId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1",
   "status": "partial",
   "remaining": [
    "Cartier duality, connected-etale sequences, fpqc descent and representability of fppf quotients of finite flat groups: no source read proves them (SGA 3, Oort-Tate, Tate 1967 absent). Review: the atlas scope of AlgebraicModuliForArithmeticGeometry:R09.3 (effective descent for finite flat groups) covers only the descent item; Cartier duality, connected-etale sequences and fppf quotients have no supplier.",
    "Definition of p-divisible groups, Tate modules and duality versus the cyclotomic twist: Tate, p-divisible groups (1967) absent; Raynaud Proposition 2.3.1 also imports Tate's full faithfulness (p. 180).",
    "Written proofs of Raynaud Corollary 3.3.6 (full faithfulness, flat kernel/cokernel, Ext^1 injectivity) and Corollary 3.3.7: absent from Raynaud; Conrad 1999 Corollary 1.6/Lemma 4.1 give only the full-faithfulness deduction and cite Raynaud for e > 1.",
    "Serre 1972 Section 1 (tame inertia description imported in Raynaud 3.1) and the translation of Serre's fundamental characters to Raynaud's.",
    "Classical imports: Gauss/Jacobi sum identities (Weil 1949, Lang ANT), Hartshorne RD III 6-7 and Tate p. 165 duality in the appendix, EGA IV_2 p. 33.",
    "Raynaud Theorem 4.1.1: the devissage needs the absolute different to be multiplicative in short exact sequences, which is not in the source (new gap).",
    "The D-algebra structure on R used with Corollary 1.5.1 throughout 3.3 is implicit; the passage from a general mixed-characteristic R to its strict henselization and back is not written."
   ]
  },
  {
   "stageId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2",
   "status": "partial",
   "remaining": [
    "Only statement-level nodes (covectors, the anti-equivalence M) from Conrad's summary and Fontaine-Laffaille 9.1-9.2; Fontaine Asterisque 47-48 and Demazure LNM 302 proofs unread.",
    "Classification of p-divisible groups over perfect fields, heights, dimensions, slopes, ordinary/supersingular cases: not decomposed.",
    "Deformation results for p-divisible groups over nilpotent thickenings (Grothendieck-Messing, BBM): sources absent.",
    "Covariance convention check requested by CrystallineCohomology:CR.7 (constant and multiplicative groups).",
    "Teichmueller action on covectors: Conrad's printed formula leaves the last coordinate a_0 unscaled; check against Fontaine, Asterisque 47-48, Ch. II Section 1.",
    "Etale/multiplicative criteria (F bijective on M(Z/pZ), V bijective on M(mu_p)) needed for the CR.7 covariance check: stated in neither source read."
   ]
  },
  {
   "stageId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3",
   "status": "partial",
   "remaining": [
    "Imports from Fontaine [F1] Asterisque 65, [F2] Annals 115, [F4] Asterisque 47-48 and Fontaine-Wintenberger: ring R, theta, B^+_a, V_B/D_B and admissibility criteria.",
    "Laffaille 1980 Theorem 3.2 (strongly divisible lattices, Proposition 7.8).",
    "Full faithfulness on MF_tor^{f,q''} and Proposition 8.12 are only indicated in the source; the limit argument of 7.15(ii) is not written.",
    "Fontaine's finite Honda system theorem [F3]: Conrad 1999 Theorem 1.4 and Corollaries 1.7-1.8 were read in review (pp. 10-16). They import Fontaine's classification of p-divisible groups over W(k) and Dieudonne theory (Asterisque 47-48, Ch. III-IV), which are unread. Fontaine-Laffaille 9.6 at p = 2 for J neither unipotent nor connected has no written proof in the sources read.",
    "Atlas targets not literally in the source: common Tate shift to [a, a+p-2], covariant HT-sign translation, and the identification of the \"finite-flat and crystalline examples used in the programme\".",
    "Remark 6.13(b) (tensor compatibility of U_S on MF_tor^{f,q'}, the candidate route to a common Tate shift) is only asserted ('on verifie facilement'); it must be proved before it is used.",
    "Jacobson, The Theory of Rings, Th. 15 (eigenvector of a bijective tau^h-semilinear map, Lemma 4.8): unread.",
    "Fontaine-Laffaille modules with an arbitrary coefficient ring O over an unramified base, as used by LocalGaloisDeformationRings:L7 and PotentialAutomorphyInfrastructure:PA.1: not in Fontaine-Laffaille 1982, whose coefficient field E lies in K with K = E K_0 (see gap).",
    "Steps of Sections 7-9 asserted without proof (the reduction to slopes >= 0 in 7.8, the decomposition in 8.4(i), 8.13(c), 9.10, 9.11, the length identity in 9.13): listed in the gap on indicated proofs."
   ]
  },
  {
   "stageId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4",
   "status": "partial",
   "remaining": [
    "Breuil 2000 ([Br3] 4.2.1.6, 4.2.2.5, 4.2.2.9, 5.3.1, 2.1.2.2) and Breuil's other papers [Br1], [Br2], [Br4]: absent; Theorem 1.1.3 and the p-divisible classification are imports.",
    "Fontaine's Grothendieck Festschrift (phi-modules over O_E) and BCDT 5.1.3: absent.",
    "Kisin 2009 Section 2.2.1-2.2.8 (local models M^v) not read; Kisin 2006, Liu 2007/2008/2010, Breuil 1997/2002 absent; Kisin 2009a (library SS_Kisin2.dvi) Corollary 2.2.6 not read.",
    "Descent data, potentially Barsotti-Tate and potentially semistable cases, and the base fields of KW: not covered by the sources read (Kisin, Potentially semi-stable deformation rings, library SS_KisinSemistable.dvi, unread).",
    "Comparison of Kisin 2009 (Gr_D, covariant, p > 2, k finite) with Liu 2013 (T_S, contravariant, any p, k perfect): conventions not reconciled in the sources; a review-derived rank-one check shows they differ by Cartier duality (gap).",
    "Finite flat group schemes at p = 2 (torsion Kisin/Breuil modules): not classified by any source read (Liu 2013 is Barsotti-Tate only; Kisin 2009 footnote 2, pp. 1115-1116).",
    "Kisin 2009 Sections 1.3, 2.1.5 onwards (moduli of finite flat models and their properness), 2.3, 2.4 outside 2.4.13-2.4.16, and 2.5 were not read. These carry the lattice-moduli and component statements that the links to LocalGaloisDeformationRings:R08.4 point towards."
   ]
  },
  {
   "stageId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5",
   "status": "partial",
   "remaining": [
    "Inertia characters of good ordinary elliptic-curve torsion: Serre 1972 Sections 1.11-1.12 absent.",
    "Extension-sensitive finite-flat criteria (peu/tres ramifie), the p = 2 Serre-weight dichotomy and the p >= 5 weight-two criterion: decomposed by EXT-10 under AlgebraicModularFormsAndSerreWeights:R15.4 (Edixhoven Prop. 8.2, Serre Prop. 3-4); ownership between R07.5 and R15.4 is an open orchestrator decision.",
    "Supersingular case covered only over absolutely unramified strictly henselian bases (Raynaud Example)."
   ]
  },
  {
   "stageId": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6",
   "status": "partial",
   "remaining": [
    "Grothendieck-Messing deformation equivalence, deformation tangent/obstruction calculations for R08, Serre-Tate: sources absent (Messing LNM 264, Illusie Asterisque 127, BBM).",
    "Comparison of finite-flat models under field extension and twisting, and stability of local deformation conditions: Conrad 1999 Section 4.8 and Section 5 not read.",
    "Galois-module comparison for abelian-scheme torsion from R10: not decomposed.",
    "Imports of Fontaine 1985: Demazure Ch. II, Fontaine 1982 n. 4.3, Grothendieck's Barsotti-Tate embedding ([BBM], [I]), Serre Corps locaux Ch. III-IV (Props. 4 p. 72, 12 p. 66, 14 p. 81; Ch. III Prop. 14), Krasner's lemma. Also the unargued reduction to an algebraically closed residue field in the proof of Theorem 1, and a supplier for Serre Ch. IV over perfect, not only finite, residue fields (LocalFieldsRamification Layer 3 is scoped to finite residue fields).",
    "Raynaud Theorem 4.2.1 imports unobstructedness of p-divisible group deformations, Cartier typical curves and Zariski-Nagata purity (SGA 2).",
    "Remark 4.1.2 (Theorem 4.1.1 for p-kernels of p-divisible groups with no bound on e) is asserted, not deduced; it needs v(D(X[p])) = ed."
   ]
  }
 ],
 "sources": [
  {
   "id": "raynaud-1974-schemas-en-groupes-p-p",
   "title": "Schemas en groupes de type (p, ..., p)",
   "authors": "Michel Raynaud",
   "edition": "Bulletin de la Societe Mathematique de France 102 (1974), 241-280. Copy inspected: NUMDAM scan with OCR text layer, 41 PDF pages = printed pp. 241-280 plus cover. Every displayed formula, inequality and script letter used in a node was checked on page images rendered from the PDF, because the text layer drops them. Independent review REVIEW-EXT-13-EXT-07B: re-fetched on 2026-09-24 from the NUMDAM URL above; SHA-256 identical to the value recorded here (05cad2f5c2c33a2eea5739d255a8bb7de724e48e38dadb30507adc5e84f2edfe, 41 PDF pages). Printed page = PDF page + 239. Sections 1-4 and the appendix were re-read on page images.",
   "url": "https://www.numdam.org/article/BSMF_1974__102__241_0.pdf",
   "sha256": "05cad2f5c2c33a2eea5739d255a8bb7de724e48e38dadb30507adc5e84f2edfe",
   "readSections": [
    "Resume, introduction and table of contents, pp. 241-243",
    "Section 1.1 (Definition 1.1.1, formula (1), Remark 1.1.2), pp. 243-244",
    "Section 1.2 (Definition 1.2.1, formulas (2)-(10 ter), hypotheses (*) and (**), Proposition 1.2.2, Remark 1.2.3), pp. 244-249",
    "Section 1.3 (formulas (11)-(17), Proposition 1.3.1 with proof), pp. 249-253",
    "Section 1.4 (formulas (18)-(22), Theorem 1.4.1 with proof, Lemma 1.4.2 with proof), pp. 253-257",
    "Section 1.5 (Corollaries 1.5.1-1.5.2 with proof, Remarks 1.5.3-1.5.5), pp. 257-259",
    "Section 2 (2.1 schematic closure, Definition 2.2.1, Proposition 2.2.2, Corollary 2.2.3, Proposition 2.3.1 with proof), pp. 259-263",
    "Section 3 (3.1 tame inertia, 3.2 and Proposition 3.2.1, Proposition 3.3.1, cases (a)-(c), Proposition 3.3.2 with proof, Theorem 3.3.3 with proof, Remarks 3.3.4-3.3.5, Corollaries 3.3.6-3.3.7, Theorem 3.4.1 with proof, Remark 3.4.2, Theorem 3.4.3 with proof, Corollary 3.4.4, Remarks 3.4.5-3.4.7, Example), pp. 263-271",
    "Section 4 (Theorem 4.1.1 with proof, Remark 4.1.2, Theorem 4.2.1 with proof, Remark 4.2.2, Lemma 4.2.3 with proof), pp. 271-274",
    "Appendix Trace et differente (Lemmas 1-7, Proposition 3, Definitions 5 and 8, Proposition 9), pp. 274-279",
    "Bibliography, pp. 279-280",
    "Reviewer (REVIEW-EXT-13-EXT-07B), 2026-09-24: all of pp. 243-280 re-read on page images (1.1-1.5, 2.1-2.3, 3.1-3.4 with the Example, 4.1-4.2 with Lemma 4.2.3, the appendix and the bibliography); p. 270 zoomed for the exponents of Theorem 3.4.3 and Corollary 3.4.4"
   ]
  },
  {
   "id": "conrad-1999-finite-group-schemes-low-ramification",
   "title": "Finite group schemes over bases with low ramification",
   "authors": "Brian Conrad",
   "edition": "Compositio Mathematica 119 (1999), 239-320. Copy inspected: author PDF dated Sept 8, 1999 (PDF generated 2004), 58 pages; page numbers below are those of the author copy. Not in the supplied library; fetched on 2026-09-16 from the author's Stanford web page (authorized public copy). Independent review REVIEW-EXT-13-EXT-07B: re-fetched on 2026-09-24 from the URL above; SHA-256 identical to the value recorded here (8da16031...54a5189, 58 PDF pages).",
   "url": "https://math.stanford.edu/~conrad/papers/gpscheme.pdf",
   "sha256": "8da1603103437c18468f67add6f836616da61aa8f5739c74cdd82547054a5189",
   "readSections": [
    "Abstract and Introduction, pp. 1-3",
    "Summary of some results of Fontaine (Witt covectors, Dieudonne ring, M(G) = Hom(G, CW_k)), pp. 3-4",
    "Section 1 opening, Theorem 1.1 with proof, Definition 1.2, Lemma 1.3, Theorem 1.4 (statement), Corollaries 1.5-1.6 with proofs, pp. 5-10",
    "Section 4, Lemma 4.1 with proof, p. 36",
    "Section 1: Lemma 1.3, proof of Theorem 1.4 (Steps 1-6), Corollaries 1.7-1.8 with proofs, Theorem 1.9 with proof, pp. 9-17 (read in independent review REVIEW-EXT-13-EXT-07B)",
    "Bibliography entries [7], [8], [9], [17]"
   ]
  },
  {
   "id": "fontaine-laffaille-1982-construction",
   "title": "Construction de representations p-adiques",
   "authors": "Jean-Marc Fontaine and Guy Laffaille",
   "edition": "Annales scientifiques de l'Ecole Normale Superieure (4) 15 (1982), no. 4, 547-608. Copy inspected: NUMDAM scan with OCR text layer, 63 PDF pages = printed pp. 547-608 plus cover. Displayed formulas, exponents and inequalities used in nodes were checked on page images rendered from the PDF. Independent review: re-fetched on 2026-09-24 from the NUMDAM URL above; SHA-256 identical to the recorded value; printed page = PDF page + 545. Source notation: the inductive limit of 1.4(b) is M-bar, the cokernel of pi on S is S-tilde, the coefficient ring of Ttilde is Abar^v (Abar twisted by tau, 5.8). Independent review REVIEW-EXT-13-EXT-07B re-read Sections 7-9 (printed pp. 590-606) on page images of the NUMDAM PDF, re-fetched 2026-09-24 with an identical SHA-256. Cross-references read: 0.1-0.3, 0.11-0.12, 1.10, 3.2-3.10, 5.1-5.3 and 6.1.",
   "url": "https://www.numdam.org/article/ASENS_1982_4_15_4_547_0.pdf",
   "sha256": "c049a7bff113a45f8bbcffc93118bd2e651e84f8b4a38305f7cb24b34c2011a2",
   "readSections": [
    "Resume, table of contents and Introduction 0.1-0.12, pp. 547-554",
    "Section 1 (1.1-1.11: filtered modules, Proposition 1.6, Lemmas 1.7 and 1.9, Proposition 1.8 with proof, the category MFcal), pp. 554-559",
    "Section 2 (2.1-2.7: R, W(R), W_A(R), W_K(R), theta^0, Phi, filtration, the ring S), pp. 559-561",
    "Section 3 (3.1-3.11: Theorem 3.3, Remark 3.4, Proposition 3.6, Lemmas 3.8-3.9, proofs 3.10-3.11), pp. 561-565",
    "Section 4 (4.1-4.11: objects M(h; i), Proposition 4.4, Lemmas 4.7-4.9, proof 4.10, Remark 4.11), pp. 565-570",
    "Section 5 (5.1-5.15: fundamental characters, Theorem 5.3, Lemma 5.4, Propositions 5.5 and 5.9, Lemmas 5.7, 5.11, 5.12, proofs 5.10, 5.13, 5.14, Proposition 5.15), pp. 570-581",
    "Section 6 (6.1-6.13: Theorem 6.1, Lemma 6.3, 6.4-6.5, Propositions 6.6, 6.7, 6.10, Lemma 6.8, 6.9, 6.11, indications 6.12, Remarks 6.13), pp. 581-589",
    "Section 7 (7.1-7.18: MF_{K/E}, t_H and t_N, Proposition 7.5, strongly divisible lattices, Proposition 7.8, Corollary 7.9, 7.11-7.14, Propositions 7.15 and 7.17, Remarks 7.18), pp. 590-594",
    "Section 8 (8.1-8.13: Theorem 8.4 with proof, Remark 8.5, Propositions 8.11-8.12, Remarks 8.13), pp. 595-600",
    "Section 9 (9.1-9.13: Honda systems, functors I and H, Propositions 9.9, 9.10, 9.12 with proofs), pp. 600-606",
    "List of notation and bibliography, pp. 606-608",
    "Independent review REVIEW-EXT-13-EXT-07B (2026-09-24): Introduction 0.1-0.12 and Sections 1-6 (printed pp. 547-589) re-read on the text layer, with every formula, exponent and inequality used by the Sections 1-6 nodes checked on page images (pp. 549-551, 554-555, 560-563, 566, 568, 570-574, 576, 578-589); bibliography p. 608"
   ]
  },
  {
   "id": "kisin-2009-moduli-finite-flat-group-schemes",
   "title": "Moduli of finite flat group schemes, and modularity",
   "authors": "Mark Kisin",
   "edition": "Annals of Mathematics 170 (2009), no. 3, 1085-1180. Copy inspected: published version (98-page PDF with text layer, generated 13 Nov 2009); page numbers are the printed Annals pages. Review provenance: re-fetched from the URL above on 2026-09-24 by independent review REVIEW-EXT-13-EXT-07B; SHA-256 identical to the value recorded here; printed page = PDF page + 1082. Kisin writes Gr_D and Mod_D (subscript D) for the Cartier-dual functors of Corollary 1.1.7.",
   "url": "https://annals.math.princeton.edu/wp-content/uploads/annals-v170-n3-p03-p.pdf",
   "sha256": "076f8bb6ec683633f7742d27504b97f5feaef2ddbae2bc5dc4325eb8386f4ee7",
   "readSections": [
    "Introduction (statements of the two local theorems), pp. 1085-1089",
    "Section 1.1 (1.1.1-1.1.16: Breuil modules, Theorem 1.1.3, Lemma 1.1.5, Corollary 1.1.7, Lemma 1.1.9, Proposition 1.1.11, 1.1.12, Proposition 1.1.13, Lemma 1.1.15), pp. 1090-1096",
    "Section 1.2 (1.2.1-1.2.11: Lemmas 1.2.2-1.2.9, 1.2.10, Proposition 1.2.11 with proofs), pp. 1096-1101",
    "Section 2.1.2-2.1.4 (groupoids D_{M_F}, D_{S,M_F}, Proposition 2.1.4 statement), pp. 1104-1105",
    "Section 2.2.9-2.2.22 (groupoids, Proposition 2.2.11, Lemmas 2.2.14, 2.2.17, 2.2.18, Proposition 2.2.19, Corollary 2.2.22 with proofs), pp. 1113-1118",
    "Section 2.4.13-2.4.14 (statement and start of proof of Proposition 2.4.14), pp. 1129-1131",
    "Independent review REVIEW-EXT-13-EXT-07B (2026-09-24): 1.1.1-1.2.11 (pp. 1090-1101; page images of pp. 1091, 1092, 1095), 2.1.1-2.1.4 (pp. 1103-1105), 2.2.9-2.2.22 with footnote 2 (pp. 1113-1118), 2.4.13-2.4.16 (pp. 1129-1132), bibliography entries [BCDT], [Br1]-[Br5], [Fo], [FoL], [Qu], [Win] (pp. 1177-1180)"
   ]
  },
  {
   "id": "liu-2013-barsotti-tate-kisin-modules-p-2",
   "title": "The correspondence between Barsotti-Tate groups and Kisin modules when p = 2",
   "authors": "Tong Liu",
   "edition": "Journal de Theorie des Nombres de Bordeaux 25 (2013), no. 3, 661-676. Copy inspected: author version, 13-page PDF dated 14 June 2013; page numbers are those of the author copy, not the journal. Review provenance: re-fetched from the URL above on 2026-09-24 by independent review REVIEW-EXT-13-EXT-07B; SHA-256 identical to the value recorded here. The journal version is openly available (https://jtnb.centre-mersenne.org/item/10.5802/jtnb.852.pdf) but was not compared; locators use the author copy.",
   "url": "https://www.math.purdue.edu/~tongliu/pub/2BT.pdf",
   "sha256": "0ce78fbc6516df3c6168433ad7d2b0c4d2ab270b26e713eed0abcae9a1fce8b3",
   "readSections": [
    "Section 1 (Introduction, Theorem 1.0.1), pp. 1-3",
    "Section 2.1 (Kisin modules, (phi, Ghat)-modules, Theorem 2.1.2, Remark 2.1.1), pp. 3-5",
    "Section 2.2 (Theorem 2.2.1 with proof, Proposition 2.2.2, Breuil modules, Lemma 2.2.3 with proof, (2.2.1), lambda, Remarks 2.2.4-2.2.5), pp. 5-8",
    "Section 2.3 (Proposition 2.3.1 and proof of Theorem 1.0.1), p. 8",
    "Section 3 (Propositions 3.1.1, 3.1.2, Corollary 3.1.3, Proposition 3.2.1, Lemma 3.2.2, with proofs), pp. 8-13",
    "References, p. 13",
    "Independent review REVIEW-EXT-13-EXT-07B (2026-09-24): whole author copy re-read, page image of p. 7 (proof of Lemma 2.2.3(2)); references p. 13"
   ]
  },
  {
   "id": "fontaine-1985-pas-de-variete-abelienne-sur-Z",
   "title": "Il n'y a pas de variete abelienne sur Z",
   "authors": "Jean-Marc Fontaine",
   "edition": "Inventiones mathematicae 81 (1985), 515-538. Copy inspected: scanned journal PDF with OCR text layer, 24 pages = printed pp. 515-538. The OCR is unreliable for formulas, so every inequality and formula used in a node was read on page images rendered from the PDF. Independent review copy (2026-09-24): the Springer PDF recorded above could not be re-fetched (Springer serves a JavaScript client challenge), so its SHA-256 was not re-verified. Instead the review read the GDZ digitization (Goettingen State and University Library, Inventiones Mathematicae 81, LOG_0033), https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0081/LOG_0033.pdf, SHA-256 be153d2e2159057aeccddef7d1c7bb4e7fbdff1599dde4560c0efb4d55bba3be, 25 PDF pages (a GDZ cover sheet, then printed pp. 515-538; printed page = PDF page + 513), image-only with no text layer. Every locator in this packet's Fontaine nodes was checked on its page images.",
   "url": "https://link.springer.com/content/pdf/10.1007/BF01388584.pdf",
   "sha256": "c10642fb8e66929af2c60352abfdbf394bab1438b12c91fadf141bebf901fdd3",
   "readSections": [
    "Conventions and Introduction 0.1-0.2 (Theorem A, Corollary, Theorem B), pp. 515-517",
    "Section 1 (1.1 definitions, Remarks 1.2, Propositions 1.3, 1.4, 1.5 with proofs, 1.6, Proposition 1.7 with proof, Corollary 1.8, Remarks 1.9), pp. 517-525",
    "Section 2 (Theorem 1 with proof, Remarks 2.2), pp. 525-526",
    "Section 3.1.1 (opening recall of Raynaud schematic closure), pp. 526-527; bibliography, pp. 537-538",
    "Independent review 2026-09-24 (GDZ scan, page images): Conventions, 0.1-0.2, Sections 1.1-1.9 and 2.1-2.2, pp. 515-526, all re-read",
    "Independent review: Sections 3.1.1-3.2.4 (Theorem 2, Remarks 3.1.4, Proposition 3.2.1 with proof), pp. 526-530, read but not decomposed",
    "Independent review: Section 3.3.1-3.3.2 (Theorem 3 with proof, Corollary 3.3.2 with proof), p. 531",
    "Independent review: bibliography and Addendum (Abrashkin), pp. 537-538"
   ]
  }
 ],
 "other": {}
}
```

</details>

<details><summary><code>EffectiveDiophantineMethods.json</code></summary>

```json
{
 "packet": "research/expansion/external/EXT-07/EffectiveDiophantineMethods.json",
 "review": {
  "status": "accepted",
  "reviewer": "independent-review-REVIEW-EXT-13-EXT-07B",
  "date": "2026-09-24",
  "notes": "All four sources were re-fetched on 2026-09-24 from their public URLs; each SHA-256 matches the packet. Every node was checked against the cited pages; the Tzanakis-de Weger scan was read on page images, zoomed where a constant or inequality mattered. Nodes: 9 verified, 17 corrected, 0 unverifiable. Main corrections, Tzanakis-de Weger: the constant of Lemma 1.2 is Y_2*, not Y_1*; the brackets in Lemma 1.1 are ceilings; Lemma 2.1 needs |Y| > max(Y_1, 2|m|^{1/n}, mu_+/C_2) and is strict; the a_0 bound of Lemma 2.3 was garbled; (3.1) has A < K_3; Proposition 3.2 has >=, and its proof prints '|Lambda| >' where '<' is meant; the source's U_I orientation is inconsistent with (2.1); and the drafted derivation of Y_3 went the wrong way, since the source gives no upper bound for |Y| in terms of A (gap). McCallum-Poonen: Remark 6.1 prints 'G/pG' and its index test needs J(Q)[l] contained in G (counterexample recorded); Theorem 5.3 does not prove Theorem 4.4's finiteness of X(Q_p) intersected with Jbar(Q). Bruin-Stoll: A(N Gamma) is contained in A(S, N), not equal to it; the constant of Lemma 4.1 lacks a factor 3 under the naive-height reading. BDMTV: Lemma 4.7's printed hypothesis is weaker than its proof uses, and the c_1 bookkeeping between Lemma 4.5, (4.21) and Proposition 4.6 is inconsistent. Links: 38 checked; 30 kept (one with an added Bruin-Stoll locator), 8 annotated (1: Prop 3.2 does not use (3.2); 6: the promoted DT.3 decomposition has no explicit bound for algebraic logarithms; 10: complex-case a_0; 21: Coleman needs only finite index; 24: RP.1 scope; 28: height separation supports termination only; 29: Kummer test is an optional genus-2 route; 36: the sieve runs after Algorithm 3.12), 0 removed, 1 added (Lemma 1.2 -> Lemma 2.4, nonvanishing of Lambda); 39 in the packet. Supplier stages DT.3, GN.5, ColemanIntegration L1, SF.3, RP.1 and NC.5 were read in data/atlas.json, and their stated scopes cover the use. All endpoints exist. With the atlas stageEdges there is no node or stage cycle; the only new implied stage edge, ED.0 -> ED.6, is transitive in the atlas. All parentStageIds and the 7 coverage records are ED.0-ED.6; the remaining lists were extended. Gaps 7 -> 10: three new gaps record the Tzanakis-de Weger |Y|-bound and slips, the BDMTV Section 4.4 slips and the Bruin-Stoll Lemma 4.1 constant. The existing gaps gained the unnamed imports (Koblitz IV.4, BLR90, Liu 6.3.7, Hardy-Wright 184, Kummer surface/Cassels-Flynn, [St1]/[St3], implicit U_I invertibility). No unresolved contradiction remains inside the packet: each source slip is stated in the affected node, and none is silently repaired. Packet status stays partial; implementationStatus stays unchecked.",
  "checked": [
   {
    "nodeId": "EffectiveDiophantineMethods:ED.0/certified-p-adic-root-isolation-from-truncated-power-series",
    "verdict": "corrected",
    "note": "Lemma 4.7, its proof and Remark 4.8 (BDMTV p. 25) match literally. The proof needs ord_p(F_i) + i >= n for all i > m ('G(x + alpha) has degree <= m mod p^{n-k}'), which the printed hypothesis on n and m does not give; this is recorded as a hypothesis caution and a gap."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.1/lll-lower-bound-for-nonzero-vectors-of-a-reduced-basis-lattice",
    "verdict": "verified",
    "note": "(3.2) and its citation of LLL Proposition (1.11) checked on the page image of p. 112; the integral L^3 is [31, Sect. 3] (de Weger, J. Number Theory 26, 1987), checked in the references."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.1/homogeneous-lattice-reduction-of-a-huge-exponent-bound",
    "verdict": "corrected",
    "note": "Proposition 3.1 and the derivation (3.2)-(3.3) checked on page images of pp. 112-114. (3.1) has A < K_3 (not <=). The bracket [.] is not defined in the source (the proof only needs an integer within 1). Q-independence is the standing case assumption and is not used in the proof."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.1/inhomogeneous-lattice-reduction-via-closest-vector-distance",
    "verdict": "corrected",
    "note": "The hypothesis of Proposition 3.2 is printed with >= (not >), zoomed p. 114. The proof (p. 115) was restated as printed, including X_0 >= 2 and the misprint '|Lambda| > K_1 exp(-K_2 A)' (read '<'). [32] is de Weger's Leiden thesis (1987), 'to appear as a CWI Tract' (1988); the drafted 'CWI Tract 65, 1989' is not in the source."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.2/large-thue-solutions-approximate-a-real-root",
    "verdict": "corrected",
    "note": "Lemma 1.1 and its proof checked on the page images of pp. 102-104; hypotheses (irreducible, n >= 3, a real root, m != 0) confirmed on p. 102. The brackets in Y_0, Y_1 are ceilings; Hardy-Wright Theorem 184 recorded as an import."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.2/thue-equation-to-unit-equation-and-small-linear-form-in-logarithms",
    "verdict": "corrected",
    "note": "Lemma 1.2 (p. 105, zoomed) defines Y_2* = max(Y_1, ceil((2 C_1 C_3/C_2)^{1/n})); the packet had renamed it Y_1*. Statement and excerpt fixed. Proof constants 1.39 and 1.02, (1.3)-(1.4) and the unit reduction (pp. 105-107) match."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.2/exponent-bound-and-exponential-decay-of-the-linear-form",
    "verdict": "corrected",
    "note": "Lemma 2.1 (pp. 107-108) holds for |Y| > max(Y_1, 2|m|^{1/n}, mu_+/C_2) with strict A < C_5 log(C_4|Y|); the packet had |Y| > Y_1 and <=. Y_2' uses Y_2*. The source's orientation of U_I is inconsistent with (2.1) and N[U_I^{-1}]; the consistent orientation and the implicit invertibility of U_I are recorded."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.2/initial-exponent-bound-from-a-logarithmic-form-lower-bound",
    "verdict": "corrected",
    "note": "Lemmas 2.3-2.4 checked on p. 110 (zoomed). The a_0 bound is |a_0| < 1/2 + (1/2) r A + 0.51/(2 pi) < r A for A >= 2; the packet's version was garbled. C_9, the nonvanishing argument and the Petho-de Weger citation match."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.2/four-class-certificate-for-all-solutions-of-a-thue-equation",
    "verdict": "corrected",
    "note": "Classes (I)-(IV) (p. 103) and the Remark (p. 111) match. The drafted derivation of Y_3 'with A <= C_5 log(C_4|Y|) and Lemma 2.1' goes the wrong way: an upper bound for |Y| in terms of A is needed and absent from the source (gap). The complex-case a_0 adjustment of K_2, K_3 and the printed title of [29] were recorded."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.3/finite-index-subgroup-certificate-with-index-prime-to-the-sieve-primes",
    "verdict": "corrected",
    "note": "Remark 6.1 (MP p. 8, page image) is stated for Flynn's method and prints 'G/pG' for G/lG. The drafted unwritten deduction is valid only if J(Q)[l] is contained in G; a counterexample without this is given. Bruin-Stoll pp. 2 and 17 match."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.4/p-adic-abelian-logarithm-and-integration-pairing-on-the-jacobian",
    "verdict": "verified",
    "note": "Section 4.1 and Remark 4.1 (MP pp. 3-4) match, including U = J^1(Q_p), the Neron model and Bourbaki III.7.6 Prop. 14(ii). [BLR90] added to the ED.4 gap."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.4/p-adic-closure-of-mordell-weil-has-dimension-at-most-rank",
    "verdict": "verified",
    "note": "Lemma 4.2, its proof (3) and Remark 4.3 (MP pp. 4-5) match."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.4/chabauty-finiteness-when-closure-dimension-is-less-than-genus",
    "verdict": "corrected",
    "note": "Theorem 4.4 and Remark 4.7 (MP p. 5) match. The drafted claim that Theorem 5.3 gives finiteness in the good-reduction case was qualified: it bounds #X(Q) only for p > 2g (or classes with m < p - 2) and never proves finiteness of X(Q_p) intersected with Jbar(Q)."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.4/coleman-integrals-on-residue-classes-of-a-good-reduction-curve",
    "verdict": "corrected",
    "note": "Sections 5.1, 5.2, 5.4 and Remark 8.3 (MP pp. 5-7, 12) match. The acceptance claim that Coleman's theory is 'needed only' for constants was replaced by the three options of Remark 8.3, none needed for Theorem 5.3."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.4/newton-polygon-zero-bound-for-integrals-in-a-residue-disc",
    "verdict": "verified",
    "note": "Lemma 5.1, proof and Remark 5.2 (MP p. 6) match; the inequality -v_p(i) > m + 1 - i for i > m + 1 under m < p - 2 was rechecked. Koblitz IV.4 added to the ED.4 gap."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.4/coleman-bound-on-rational-points-at-a-good-prime",
    "verdict": "verified",
    "note": "Theorem 5.3 and its proof (MP p. 7, page image; the zeros are counted in X(Fbar_p)), Remarks 5.4-5.5 and Examples 8.1-8.2 (10 = #X(Q) with #X(F_7) = 8; bound 6 at p = 3 via Remark 5.2) match."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.4/coleman-bound-at-a-prime-of-bad-reduction-via-minimal-regular-model",
    "verdict": "corrected",
    "note": "Appendix A (MP pp. 13-15) matches. The Liu imports were completed (Definition 6.3.7), and the last step of Lemma A.4 was attributed correctly: V.X_s = 0 (9.1.21(a)) and K.X_s = 2g - 2 (9.1.35), not 'adjunction'."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.5/mordell-weil-sieve-set-and-its-soundness",
    "verdict": "corrected",
    "note": "Sections 2-3 and Definition 3.1 (BS pp. 3-8, 12) match. The source says Definition 3.1 'generalizes' A(S, N); the drafted equality A(N Gamma) = A(S, N) was replaced by the inclusion A(N Gamma) contained in A(S, N), both sound."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.5/staged-computation-of-the-sieve-set-through-prime-power-steps",
    "verdict": "corrected",
    "note": "Sections 3.1-3.3 (BS pp. 6-12) match. The correctness of the staged lift is implicit in PrepareLift, not 'stated'; the reviewer checked the two cases of indices that drop out."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.5/canonical-height-separation-of-cosets-of-N-J-Q",
    "verdict": "verified",
    "note": "Section 4.2 passage (BS p. 13) matches literally; the drafted parallelogram-law deduction was checked and is correct."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.5/kummer-surface-test-for-small-points-on-a-genus-two-jacobian",
    "verdict": "corrected",
    "note": "Lemma 4.1 and proof (BS p. 14, page image) match. The printed bound on the Kummer form omits the factor 3 the triangle inequality gives when h = log max|k_j|, and the Kummer-surface facts are imported without proof; both recorded (hypotheses and gap). Genus 2 is implicit."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.5/chabauty-plus-sieve-determination-of-rational-points",
    "verdict": "verified",
    "note": "Section 4.4 steps 1-5, Conjecture 4.2, Lemma 4.3 and Conjecture 4.4 (BS pp. 16-21) match; correctness when the procedure terminates and the conditional termination are separated as in the source."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.6/quadratic-chabauty-set-for-rank-equal-genus-with-picard-rank-at-least-two",
    "verdict": "corrected",
    "note": "Sections 2.1-2.3 (BDMTV pp. 3-6) match. The Remark 3.14 acceptance now carries Waldschmidt's condition (r = g and J(Q) Zariski dense in J) and the [DF21, Lemma 7] citation."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.6/local-heights-away-from-p-via-reduction-graph-laplacian",
    "verdict": "verified",
    "note": "Section 3.1, Theorem 3.2 (formula for mu_F, uniqueness with j_Gamma(red(b)) = 0), the weight filtration and Example 3.3 (BDMTV pp. 6-9) match; Remark 3.16 (p. 15) matches."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.6/quadratic-chabauty-algorithm-for-modular-curves-with-failure-conditions",
    "verdict": "verified",
    "note": "Definition 3.9, Assumption 3.10, Remark 3.11, Algorithm 3.12 (inputs, steps, FAIL conditions) and Remarks 3.13-3.16 (BDMTV pp. 13-15) match; the example list matches Section 5's opening (p. 25) and p. 16 (C188, C161)."
   },
   {
    "nodeId": "EffectiveDiophantineMethods:ED.6/coefficient-valuation-bound-for-the-quadratic-chabauty-function",
    "verdict": "corrected",
    "note": "Lemma 4.5 and Proposition 4.6 (BDMTV pp. 24-25) match as printed. The reviewer read (4.21) (p. 22) and added the definitions of phi(i) and i_0. The source's bookkeeping of c_1 (Lemma 4.5 drops it; 'phi(i) = -2 floor(log_p i) + c_1' contradicts (4.21)) is recorded as a caution and a gap."
   }
  ]
 },
 "nodes": {
  "changed": {
   "EffectiveDiophantineMethods:ED.0/certified-p-adic-root-isolation-from-truncated-power-series": {
    "proofSteps": [
     "F(px) lies in p^k Z_p[[x]] but not in p^{k+1} Z_p[[x]], so G(x) = p^{-k} F(px) lies in Z_p[[x]] minus pZ_p[[x]].",
     "For every alpha in Z_p the positive slopes of the Newton polygon of G(x + alpha) are determined by the first m coefficients (by the hypothesis on n and m).",
     "If G is congruent modulo p^{n-k} to a polynomial H in Z_p[x] with a root alpha of multiplicity e, the first e coefficients of G(x + alpha) have valuation at least n - k. Since G(x + alpha) has degree <= m mod p^{n-k} and a coefficient of valuation zero, its Newton polygon has a segment of slope >= (n-k)/d of length at least e.",
     "Remark 4.8: in practice d = 1 after recentering and rescaling, so precision loss comes from k.",
     "Source status: the proof is the short argument on p. 25. The Newton-polygon facts it uses are not cited, and the step 'G(x + alpha) has degree <= m mod p^{n-k}' needs the tail condition recorded in the hypotheses."
    ],
    "hypotheses": [
     "F in Q_p[[x]] with the two integer conditions on ord_p(F_i) + i",
     "an a priori bound d on the number of roots in {ord_p(x) >= 1} (e.g. from a Newton-polygon or Chabauty-type count)",
     "Reviewer caution (REVIEW-EXT-13-EXT-07B): the proof uses that G(x + alpha) has degree <= m modulo p^{n-k}, i.e. ord_p(F_i) + i >= n for every i > m. The printed condition max{i >= 0 : ord_p(F_i) + i = n} < m does not imply this: it says nothing about indices i >= m with ord_p(F_i) + i < n, and it is vacuous when no index attains n. A certificate must check the tail condition ord_p(F_i) + i >= n for all i >= m directly; for the quadratic Chabauty function this is what Proposition 4.6 supplies."
    ]
   },
   "EffectiveDiophantineMethods:ED.1/homogeneous-lattice-reduction-of-a-huge-exponent-bound": {
    "statement": "Let mu_1, ..., mu_q be real numbers, linearly independent over Q (q >= 2), Lambda = a_1 mu_1 + ... + a_q mu_q with (a_1, ..., a_q) in Z^q (the homogeneous case delta = 0), A = max |a_i|, and K_1, K_2, K_3 > 0. Consider the solutions of (3.1): |Lambda| < K_1 exp(-K_2 A) and A < K_3. Choose c_0 somewhat larger than K_3^q and let Gamma be the lattice spanned by the columns of the q x q matrix with identity in the first q-1 rows and last row ([c_0 mu_1], ..., [c_0 mu_q]) ([.] is an integer rounding; the source does not define the bracket on the pages read, and the proof only uses |[c_0 mu_i] - c_0 mu_i| <= 1). Let b_1, ..., b_q be an LLL-reduced basis. If |b_1| > sqrt((q^2 + q - 1) 2^{q-1}) K_3, then every solution of (3.1) satisfies A < (1/K_2) (log(c_0 K_1) - log(sqrt(2^{-(q-1)} |b_1|^2 - (q-1) K_3^2) - q K_3)).",
    "hypotheses": [
     "mu_i real (q >= 2); homogeneous form delta = 0. Q-linear independence of the mu_i is the standing assumption of cases (i)-(ii). The derivation of Proposition 3.1 does not use it; it only makes the hypothesis on |b_1| likely to hold (for dependent mu_i see case (iii), pp. 115-116).",
     "K_1, K_2 small and K_3 very large known constants (in the Thue application from Lemmas 2.2 and 2.4)",
     "c_0 chosen with c_0 of size K_3^q so that the hypothesis on |b_1| holds in practice"
    ]
   },
   "EffectiveDiophantineMethods:ED.1/inhomogeneous-lattice-reduction-via-closest-vector-distance": {
    "sources": [
     {
      "sourceId": "tzanakis-de-weger-practical-thue",
      "locator": "Section II.3, case (ii) and Proposition 3.2 with proof, pp. 114-115",
      "excerpt": "PROPOSITION 3.2. Let i* = max(i : 1 <= i <= q and s_i not in Z). If 2^{-(q-1)/2} . ||s_{i*}|| . |b_1| >= sqrt(4 . q^2 + 3 . q - 3/4) . K_3, then every solution of (3.1), in the case delta != 0, satisfies A < (1/K_2) . log(c_0 . K_1/(q . K_3)).",
      "match": "Literal statement read on the page image of p. 114 (the hypothesis is printed with >=, not >); the proof on pp. 114-115 read on the page images."
     }
    ],
    "proofSteps": [
     "Imported: by Lemma 3.5 of de Weger [32], the minimal distance l(x, Gamma) of x to Gamma satisfies l(x, Gamma) >= 2^{-(q-1)/2} ||s_{i*}|| |b_1| (not read here).",
     "By hypothesis l(x, Gamma) >= sqrt(4q^2 + 3q - 3/4) K_3. The source then argues \"similarly as in Lemma 3.7 of [32]\" (not read here): if l(x, Gamma) >= sqrt(4q^2 + 3q - 3/4) X_0 for some constant X_0 >= 2, then, as printed, \"the inequality |Lambda| > K_1 exp(-K_2 A) has no solution in the range (1/K_2) log(c_0 K_1/q K_3) <= A <= X_0\", applied \"with K_3 in place of X_0\". The printed '>' must be read as '<' (the first inequality of (3.1)); otherwise the conclusion does not follow. Taking X_0 = K_3 gives the bound.",
     "If ||s_{i*}|| is too small, try another c_0 or use Lemma 3.6 of [32] instead of Lemma 3.5."
    ],
    "statement": "Let Lambda = delta + a_1 mu_1 + ... + a_q mu_q with delta != 0 and Gamma, c_0, b_1, ..., b_q as in the homogeneous case, B the matrix of the reduced basis. Let x = (0, ..., 0, -[c_0 delta])^T in Z^q with coordinates s_1, ..., s_q with respect to b_1, ..., b_q (s = B^{-1} x), and i* = max{i : 1 <= i <= q, s_i not in Z}. If 2^{-(q-1)/2} ||s_{i*}|| |b_1| >= sqrt(4q^2 + 3q - 3/4) K_3 (||.|| the distance to the nearest integer; the notation is not defined on the pages read), then every solution of (3.1) with delta != 0 satisfies A < (1/K_2) log(c_0 K_1/(q K_3)).",
    "acceptance": [
     "This is the \"closest-vector certificate\" demanded by ED.1: the exported data are x, the coordinates s, i*, ||s_{i*}||, |b_1| and the inequality check.",
     "The imported de Weger lemmas (Lemmas 3.5-3.7 of [32]: B. M. M. de Weger, Algorithms for Diophantine Equations, PhD thesis, Leiden 1987, cited in the source as 'to appear as a CWI Tract', 1988) must be read before this node can be treated as proved."
    ]
   },
   "EffectiveDiophantineMethods:ED.2/large-thue-solutions-approximate-a-real-root": {
    "sources": [
     {
      "sourceId": "tzanakis-de-weger-practical-thue",
      "locator": "Section II.1, Lemma 1.1 with proof, pp. 103-104",
      "excerpt": "LEMMA 1.1. Let X, Y in Z satisfy (1.1). Put beta = X - xi . Y in K [...] (i) If |Y| > Y_0 then there exists an i_0 in {1, ..., s} such that |beta^(i_0)| <= C_1 . |Y|^{-(n-1)}, |beta^(i)| >= C_2 . |Y| for i in {1, ..., n}, i != i_0. (ii) If |Y| > Y_1 then X/Y is a convergent from the continued fraction expansion of xi^(i_0).",
      "match": "Literal statement read on the page image of p. 103 (constants Y_0, C_1, C_2, Y_1 as displayed there; the brackets in Y_0 and Y_1 are ceilings, checked on a zoomed image)."
     }
    ],
    "statement": "Let F(X, Y) = sum f_i X^{n-i} Y^i in Z[X, Y] be an irreducible binary form of degree n >= 3, m a nonzero integer, g(x) = F(x, 1) with s >= 1 real roots xi^(1), ..., xi^(s) and t pairs of complex roots, and K = Q(xi). For a solution of F(X, Y) = m put beta = X - xi Y in K. With Y_0 = ceil((2^{n-1}|m| / (min_{1<=i<=t} |g'(xi^(s+i))| . min_{1<=i<=t} |Im xi^(s+i)|))^{1/n}) if t >= 1 and Y_0 = 1 if t = 0, C_1 = 2^{n-1}|m|/min_{1<=i<=s}|g'(xi^(i))|, C_2 = (1/2) min_{1<=i<j<=n} |xi^(i) - xi^(j)|, and Y_1 = max(Y_0, ceil((4 C_1)^{1/(n-2)})): (i) if |Y| > Y_0 there is i_0 in {1, ..., s} with |beta^(i_0)| <= C_1 |Y|^{-(n-1)} and |beta^(i)| >= C_2 |Y| for i != i_0; (ii) if |Y| > Y_1 then X/Y is a convergent of the continued fraction expansion of xi^(i_0).",
    "hypotheses": [
     "F irreducible over Q of degree n >= 3 with at least one real root (otherwise small bounds are trivial)",
     "m != 0",
     "imported: Legendre's criterion for continued-fraction convergents (Hardy-Wright, Theorem 184), cited in the proof of (ii), not read"
    ]
   },
   "EffectiveDiophantineMethods:ED.2/thue-equation-to-unit-equation-and-small-linear-form-in-logarithms": {
    "sources": [
     {
      "sourceId": "tzanakis-de-weger-practical-thue",
      "locator": "Section II.1, Lemma 1.2 with proof and the reduction to the unit equation (1.3)-(1.4), pp. 105-107",
      "excerpt": "LEMMA 1.2. Put C_3 = max_{i_1 != i_2 != i_3 != i_1} |(xi^(i_1) - xi^(i_2))/(xi^(i_1) - xi^(i_3))|, Y_2* = max(Y_1, ceil((2 . C_1 . C_3/C_2)^{1/n})). If |Y| > Y_2* then |Lambda| < (1.39 . C_1 . C_3/C_2) . |Y|^{-n}.",
      "match": "Literal statement read on the page image of p. 105; the constant is printed Y_2* (not Y_1*), checked on a zoomed image. The fundamental-unit reduction and (1.3)-(1.4) were read on the page images of pp. 106-107."
     }
    ],
    "statement": "In the setting of Lemma 1.1 with i_0 real, choose j, k with i_0, j, k pairwise distinct and either j, k in {1, ..., s} (real case) or j + t = k (complex case). Put Lambda = log|((xi^(i_0) - xi^(j))/(xi^(i_0) - xi^(k))) (beta^(k)/beta^(j))| in the real case and Lambda = (1/i) Log(...) in the complex case (so Lambda is real and |Lambda| <= pi). With C_3 = max_{i_1,i_2,i_3 distinct} |(xi^(i_1) - xi^(i_2))/(xi^(i_1) - xi^(i_3))| and Y_2* = max(Y_1, ceil((2 C_1 C_3/C_2)^{1/n})), Lemma 1.2: if |Y| > Y_2* then |Lambda| < (1.39 C_1 C_3/C_2) |Y|^{-n}. Writing beta = mu epsilon_1^{a_1} ... epsilon_r^{a_r} with epsilon_i fundamental units of an order R of K (r = s + t - 1) and mu from a finite complete set M of nonassociated elements of norm m/f_0, Lambda becomes the linear form (1.3) Lambda = log|((xi^(i_0)-xi^(j))/(xi^(i_0)-xi^(k))) (mu^(k)/mu^(j))| + sum a_i log|epsilon_i^(k)/epsilon_i^(j)| in the real case, or (1.4) with arguments and an extra term a_0 . 2 pi in the complex case."
   },
   "EffectiveDiophantineMethods:ED.2/exponent-bound-and-exponential-decay-of-the-linear-form": {
    "sources": [
     {
      "sourceId": "tzanakis-de-weger-practical-thue",
      "locator": "Section II.2, Lemmas 2.1-2.2 with proof, pp. 107-110",
      "excerpt": "LEMMA 2.1. Put I = {h_1, ..., h_r} in {1, ..., n}, and U_I = (log|epsilon_i^(h_l)|)_{1<=i<=r, 1<=l<=r} (where i indicates a row and l a column of the matrix) [...] Then, for |Y| > max(Y_1, 2 . |m|^{1/n}, mu_+/C_2), we have A < C_5 . log(C_4 . |Y|).",
      "match": "Statement read on the page images of pp. 107-108 (definitions of U_I, N[U_I^{-1}], mu_-, mu_+, C_4, C_5 on p. 107; the hypothesis on |Y| and the strict conclusion on p. 108); Lemma 2.2 (C_6 and Y_2' = max(Y_2*, 2|m|^{1/n}, mu_+/C_2)) read on the page images of pp. 109-110."
     }
    ],
    "proofSteps": [
     "(2.1): the vector (log|beta^(h_l)/mu^(h_l)|)_l equals U_I a, with U_I oriented as in the hypotheses (rows indexed by conjugates). Hence A <= N[U_I^{-1}] max_l |log|beta^(h_l)/mu^(h_l)||.",
     "Using the end of the proof of Lemma 1.1 (|X - Y xi^(i_0)| <= 1/(2|Y|), which needs |Y| > Y_1), |beta^(h)|/|mu^(h)| < C_4 |Y| for all h. Since mu_- <= |m|^{1/n}, the condition |Y| > 2|m|^{1/n} gives C_4 |Y| > 1 (2.2).",
     "For i with |beta^(i)/mu^(i)| < 1, the product formula prod_h |beta^(h)/mu^(h)| = 1 gives |log|beta^(i)/mu^(i)|| < (n-1) log(C_4|Y|) (2.3); this gives A <= (n-1) min_I N[U_I^{-1}] log(C_4|Y|).",
     "Choosing I with i_0 not in I, Lemma 1.1 gives |beta^(h)/mu^(h)| > C_2 |Y|/mu_+ > 1 for h in I (this uses |Y| > mu_+/C_2), so A < max_I N[U_I^{-1}] log(C_4|Y|).",
     "Lemma 2.2 substitutes |Y| >= exp(A/C_5)/C_4 into Lemma 1.2."
    ],
    "title": "Tzanakis-de Weger Lemmas 2.1-2.2: A = max|a_i| < C_5 log(C_4 |Y|) for |Y| > max(Y_1, 2|m|^{1/n}, mu_+/C_2), hence |Lambda| < C_6 exp(-(n/C_5) A) for |Y| > Y_2'",
    "statement": "Let A = max_{1<=i<=r} |a_i|. Lemma 2.1: for I = {h_1, ..., h_r} in {1, ..., n} put U_I = (log|epsilon_i^(h_l)|)_{i,l}, N[U_I^{-1}] = max_i sum_l |u_il| for U_I^{-1} = (u_il), mu_- = min_{mu in M, i} |mu^(i)|, mu_+ = max_{mu in M, i} |mu^(i)|, C_4 = (1/2 + max_{i_1<i_2} |xi^(i_1) - xi^(i_2)|)/mu_- and C_5 = min((n-1) min_I N[U_I^{-1}], max_I N[U_I^{-1}]). If |Y| > max(Y_1, 2|m|^{1/n}, mu_+/C_2) then A < C_5 log(C_4 |Y|). Lemma 2.2: with C_6 = 1.39 C_1 C_3 C_4^n/C_2 and Y_2' = max(Y_2*, 2|m|^{1/n}, mu_+/C_2), if |Y| > Y_2' then |Lambda| < C_6 exp(-(n/C_5) A).",
    "hypotheses": [
     "as in Lemmas 1.1-1.2, with fundamental units and the finite set M fixed",
     "I ranges over r-subsets of {1, ..., n} for which U_I is invertible. This is implicit in the source: U_I is singular when I contains both members of a complex-conjugate pair. The second estimate needs such an I with i_0 not in I.",
     "Orientation of U_I (reviewer, REVIEW-EXT-13-EXT-07B): the source defines U_I = (log|epsilon_i^(h_l)|) 'where i indicates a row and l a column', but writes (2.1) as v = U_I a with v_l = log|beta^(h_l)/mu^(h_l)|. With that orientation (2.1) holds for the transpose U_I^T, and then |a_i| is bounded by the maximal column sum of U_I^{-1}, not by N[U_I^{-1}]. The consistent reading takes U_I with rows indexed by the conjugates h_l and columns by the units i, so that (2.1) reads v = U_I a and A <= N[U_I^{-1}] max_l |v_l|. C_5 must be computed with this orientation."
    ]
   },
   "EffectiveDiophantineMethods:ED.2/initial-exponent-bound-from-a-logarithmic-form-lower-bound": {
    "statement": "Lemma 2.3 (Waldschmidt [30], imported): if Lambda != 0 then |Lambda| > exp(-C_7 (log A + C_8)) in the real case; in the complex case the same holds with A replaced by A' = max_{0<=i<=r} |a_i|, and since |a_0| < 1/2 + (1/2) r A + 0.51/(2 pi) < r A for A >= 2 (so A' <= r A), one may use A with C_8' = C_8 + log r (C_8' = C_8 in the real case). Lemma 2.4: with C_9 = (2 C_5/n)(log C_6 + C_7 C_8' + C_7 log(C_5 C_7/n)), if |Y| > Y_2' then A < C_9.",
    "hypotheses": [
     "Lambda != 0 (proved in the source from beta^(i_0) != 0 and (1.2))",
     "explicit constants C_7, C_8 of Waldschmidt's theorem as computed in Appendix II of the source (not read here)",
     "imported elementary lemma: Petho-de Weger [20] Lemma 2.3 turning A <= (C_5/n)(log C_6 + C_7 C_8' + C_7 log A) into A < C_9",
     "complex case: A >= 2, used for |a_0| < r A (for A < 2 there is nothing to prove)"
    ]
   },
   "EffectiveDiophantineMethods:ED.2/four-class-certificate-for-all-solutions-of-a-thue-equation": {
    "proofSteps": [
     "Class (IV): Lemma 2.4 gives A < C_9 for |Y| > Y_2'. The source says an upper bound Y_3 for |Y| 'can be derived easily' and does not write it out. Lemma 2.1 cannot give it, since it bounds A above in terms of |Y|. What is needed is an upper bound for |Y| in terms of A. One route (reviewer, not in the source): |Y| = |beta^(i) - beta^(j)|/|xi^(i) - xi^(j)| with |beta^(h)| = |mu^(h)| prod_k |epsilon_k^(h)|^{a_k} <= mu_+ exp(A sum_k |log|epsilon_k^(h)||); then Y_3 = max(Y_2', this bound at A = C_9).",
     "Class (III): apply Proposition 3.1 (delta = 0) or 3.2 (delta != 0), possibly iterated. The source says only that K_1, K_2, K_3 come from Lemmas 2.2 and 2.4 (p. 111); in the real case this means K_1 = C_6, K_2 = n/C_5, K_3 = C_9. In the complex case (1.4) the vector of unknowns also contains a_0, with |a_0| < r A (proof of Lemma 2.3), so K_2 and K_3 must be adjusted to the maximum over all q coefficients. The reduced bound on A is turned into Y_2 by the same upper bound for |Y| in terms of A.",
     "Class (II): for Y_1 < |Y| <= Y_2, X/Y is a convergent of the continued fraction of a real root (Lemma 1.1(ii)), so finitely many candidates are checked.",
     "Class (I): enumerate |Y| <= Y_1."
    ],
    "statement": "Let F be an irreducible binary form of degree n >= 3 with at least one real root of F(x, 1), and m != 0. There are explicit reals Y_1 < Y_2 < Y_3 such that the solutions of F(X, Y) = m split into four classes: (I) very small solutions |Y| <= Y_1, found by enumeration; (II) small solutions Y_1 < |Y| <= Y_2, found among the continued fraction convergents of the real roots xi^(i) (Lemma 1.1(ii)); (III) large solutions Y_2 < |Y| <= Y_3, shown not to exist by lattice reduction; (IV) very large solutions |Y| > Y_3, shown not to exist by the theory of linear forms in logarithms. Y_1 comes from Lemma 1.1, Y_3 from the logarithmic-form bound (Lemma 2.4), and Y_2 from the reduced bound of Section II.3; both translations from a bound on A to a bound on |Y| need an upper bound for |Y| in terms of A, which the source does not write out.",
    "acceptance": [
     "Acceptance for ED.2: the certificate lists Y_1, Y_2, Y_3, the constants C_1..C_9 with the logarithmic-form theorem used, the reduced lattice data of each reduction step, the convergents checked and the enumerated range. Only then is it proved that every solution lies in the enumerated set.",
     "Worked test from the source: Section III solves the elliptic curve arising from Mohanty's problem via two quartic Thue equations over a totally real quartic field (not decomposed here).",
     "S-unit and Thue-Mahler instances need the p-adic analogue: reference [29] of the source (Tzanakis-de Weger, 'On the practical solution of the Thue-Mahler equation', in preparation in 1989). Its identification with the published Compositio 1992 paper was not checked, and neither was read."
    ]
   },
   "EffectiveDiophantineMethods:ED.3/finite-index-subgroup-certificate-with-index-prime-to-the-sieve-primes": {
    "sources": [
     {
      "sourceId": "mccallum-poonen-method-of-chabauty-coleman",
      "locator": "Remark 6.1, p. 8 of the author copy",
      "excerpt": "For this method we do not need full knowledge of J(Q). It would suffice to have explicit generators of a finite-index subgroup G of J(Q) having the same closure in J(Q_p). Any G of index prime to p . #J(F_p) has this property.",
      "match": "Literal passage, p. 8 of the author copy (checked on the page image); the injectivity test is the next paragraph, printed with 'G/pG'. Remark 2.2 (p. 3) refers to Remark 6.1 for the Chabauty-Coleman method."
     },
     {
      "sourceId": "bruin-stoll-mordell-weil-sieve",
      "locator": "Section 1, p. 2, and Section 4.4, p. 17 of the arXiv copy",
      "excerpt": "It is sufficient to know generators of a finite-index subgroup such that the index is coprime to a certain set of primes. This can be checked again by using only local information.",
      "match": "Literal passage, p. 2 of the arXiv copy; in 4.4 the index of Z . P + J(Q)_tors must be prime to N."
     }
    ],
    "proofSteps": [
     "Source status: stated as remarks with a one-sentence justification; no proof is written in either source.",
     "Reviewer's deduction for (2), not written in McCallum-Poonen: G/lG -> B factors through J(Q)/lJ(Q). If l divided (J(Q) : G) there would be x in J(Q) \\ G with lx in G; lx maps to 0 in B, so by injectivity lx = lg with g in G, and x - g lies in J(Q)[l]. If J(Q)[l] is contained in G this forces x in G, a contradiction. So the test certifies that l does not divide the index provided J(Q)[l] is contained in G.",
     "For the Chabauty-Coleman annihilating differential (ED.4) any finite-index subgroup G suffices: log is a homomorphism and n x lies in G for n = (J(Q) : G), so log G and log J(Q) span the same Q_p-subspace of T (reviewer's remark; consistent with Remark 2.2 and Example 8.2, which uses only rank J(Q) = 1). The index condition in (1) matters for Flynn's method, and (3) for the sieve."
    ],
    "statement": "Let X/Q be a curve of genus g >= 2 with Jacobian J. (1) (McCallum-Poonen Remark 6.1, stated for Flynn's method; Remark 2.2 refers to it for the Chabauty-Coleman method.) It would suffice to know explicit generators of a finite-index subgroup G of J(Q) with the same closure in J(Q_p). Any G of index prime to p . #J(F_p) has this property. (2) If G is known to have finite index, one can usually verify that the index is not divisible by a given prime l by finding a homomorphism J(Q) -> B to a finite abelian group B killed by l such that the induced map G/lG -> B is injective. The source prints 'G/pG', evidently a misprint for G/lG since B is killed by l. In practice B is a product of J(F_q)/lJ(F_q) over a few primes q of good reduction. The test is valid when G contains J(Q)[l], e.g. G = Z P + J(Q)_tors as in Bruin-Stoll 4.4. Without that it can fail: for J(Q) = Z x Z/l and G = Z x 0 the index is l, yet G/lG = Z/l can inject into B (reviewer). (3) (Bruin-Stoll) For the Mordell-Weil sieve it suffices to know generators of a finite-index subgroup whose index is coprime to a certain set of primes (in the Chabauty combination, coprime to N), and this can be checked with local information only.",
    "hypotheses": [
     "G subset of J(Q) of finite index (finiteness itself requires knowing rank J(Q), e.g. from a descent)",
     "for (2): primes q of good reduction with J(Q) -> J(F_q)/l J(F_q) computable on G",
     "for (2): G contains the l-torsion J(Q)[l]. The deduction needs this and the source does not state it."
    ]
   },
   "EffectiveDiophantineMethods:ED.4/chabauty-finiteness-when-closure-dimension-is-less-than-genus": {
    "proofSteps": [
     "Source status: McCallum-Poonen omit the proof (\"We omit the proof of Theorem 4.4, but we will soon prove a refined version, Theorem 5.3\") and note that without the extra hypotheses of 5.3 one can still prove finiteness. Chabauty's note (C. R. Acad. Sci. 212, 1941) was not read.",
     "What the source proves: Theorem 5.3(a) bounds each residue class with m < p - 2, and Theorem 5.3(b) bounds #X(Q) when p is a prime of good reduction with p > 2g. Theorem A.5 does the same with Xcal_s^smooth(F_p) for p > 2g. If r < g then r' < g at every prime, so a good prime p > 2g gives finiteness of X(Q). If r' < g is known only at one given prime, finiteness follows only when that prime satisfies these conditions. The finiteness of X(Q_p) intersected with Jbar(Q), which is the statement of Theorem 4.4, is not proved in the source."
    ],
    "acceptance": [
     "Do not export Theorem 4.4 as proved from this source. Export instead the finiteness of X(Q) given by Theorem 5.3(b) (good reduction, p > 2g) or Theorem A.5(2) (p > 2g)."
    ]
   },
   "EffectiveDiophantineMethods:ED.4/coleman-integrals-on-residue-classes-of-a-good-reduction-curve": {
    "acceptance": [
     "Remark 8.3 lists three ways to set the constant of integration when integrals between different residue classes are needed: torsion points in residue classes of J (8.3(1)); Coleman's theory of p-adic integration via Teichmueller points (8.3(2), [Col85a]); or explicit divisors representing points of J(Q) (8.3(3), due to Wetherell). The proof of Theorem 5.3 needs none of them."
    ]
   },
   "EffectiveDiophantineMethods:ED.4/coleman-bound-at-a-prime-of-bad-reduction-via-minimal-regular-model": {
    "proofSteps": [
     "Proposition A.1 (Liu 6.4.7, 6.4.9): omega_{X/Y} = Lambda^r Omega^1 for smooth maps, and base change. So w in H^0(X, Omega^1) is a meromorphic section of omega_{Xcal/R} with canonical divisor K = H + V (horizontal + vertical).",
     "For a multiplicity-1 component C, rescale w by a power of pi to get w_C with C not in its divisor K_C. Then w_C restricts to a nonzero w-tilde_C on C^smooth with n_C zeros.",
     "Lemma A.3: n_C <= H.C, since (H.C)_P = ord_P(w-tilde_C) on C^smooth(F) and H is effective.",
     "Lemma A.4: sum_{C mult. 1} n_C <= sum_D m_D (H.D) = H.Xcal_s = K.Xcal_s = 2g - 2, using V.Xcal_s = 0 (Liu 9.1.21(a)) and K.Xcal_s = 2g - 2 (Liu 9.1.35).",
     "Theorem A.5: (1) residue classes over smooth points expand as in 5.2 and the proof of 5.3 applies; (2) sum over multiplicity-1 components with Lemma A.4."
    ],
    "hypotheses": [
     "r' < g",
     "Xcal the minimal proper regular model over Z_p; residue classes are fibres of X(Q_p) = Xcal^smooth(Z_p) -> Xcal_s^smooth(F_p)",
     "imports from Liu, Algebraic geometry and arithmetic curves: canonical sheaf of lci morphisms (Definitions 6.3.7 and 6.4.7, Theorem 6.4.9), intersection theory (Proposition 8.3.4, Definition 8.3.5, Theorem 9.1.2(a), Proposition 9.1.21(a), Definition 9.1.34, Proposition 9.1.35)"
    ]
   },
   "EffectiveDiophantineMethods:ED.5/mordell-weil-sieve-set-and-its-soundness": {
    "statement": "Let C/Q be smooth projective of genus g >= 2 with Jacobian J, iota : C -> J defined over Q (a known rational divisor class of degree 1), and known generators of J(Q). For a finite set S of primes of good reduction and N >= 1, let beta_{N,p} : C(F_p) -> J(F_p)/NJ(F_p) be iota followed by the quotient, alpha : J(Q)/NJ(Q) -> prod_{p in S} J(F_p)/NJ(F_p) the reduction map, and A(S, N) = {a in J(Q)/NJ(Q) : alpha(a) in im(beta_{N,p}) for all p in S}. The diagram with C(Q) -> J(Q)/NJ(Q) on top and prod C(F_p) -> prod J(F_p)/NJ(F_p) at the bottom commutes, so the image of C(Q) lies in A(S, N). In particular A(S, N) = empty implies C(Q) = empty. More generally, with finitely many surjections phi_i : Gamma -> G_i onto finite abelian groups and subsets X_i, and L of finite index in Gamma, A(L) = {gamma in Gamma/L : phi_{L,i}(gamma) in X_{L,i} for all i}; the source says Definition 3.1 'generalizes A(S, N)'. With Gamma = J(Q), G_p = phi_p(J(Q)) inside J(F_p) and X_p = iota(C(F_p)) intersected with G_p, the set A(N Gamma) is contained in A(S, N); it can be smaller, because N G_p can be smaller than G_p intersected with N J(F_p). Both sets contain the image of C(Q), so both are sound (reviewer's comparison)."
   },
   "EffectiveDiophantineMethods:ED.5/staged-computation-of-the-sieve-set-through-prime-power-steps": {
    "proofSteps": [
     "The correctness of the staged computation is set-theoretic: A(L_j) is exactly the set of lifts of elements of A(L_{j-1}) satisfying the conditions for the indices I_j that change at step j. Elements for i not in I_j satisfy the condition automatically because phi_i(L_j) = phi_i(L_{j-1}). This is implicit in the construction of PrepareLift (the sets I_j and the update of I'); the source states no lemma. Reviewer's check: indices removed from I' have phi_i(L_j) = N_k G_i, and indices outside the initial I' have phi_i(N_k Gamma) = phi_i(N_{k-1} Gamma), because q_k is prime to the exponent of N_{k-1} G_i.",
     "Complexity estimate: sum_j #A(L_{j-1}) (L_{j-1} : L_j), usually about #A(N_{k-1}Gamma) q_k (heuristic, Section 3.3).",
     "The choice of S (Section 3.1) uses primes with B-smooth #J(F_p) and Pohlig-Hellman discrete logarithms; it affects efficiency, not soundness."
    ]
   },
   "EffectiveDiophantineMethods:ED.5/kummer-surface-test-for-small-points-on-a-genus-two-jacobian": {
    "sources": [
     {
      "sourceId": "bruin-stoll-mordell-weil-sieve",
      "locator": "Section 4.2, Lemma 4.1 with proof, p. 14 of the arXiv copy",
      "excerpt": "Lemma 4.1. Let P_0 in C(Q) and write x(P_0) = (a : b) with coprime integers a, b. Let p_1, p_2, ..., p_m be primes of good reduction such that p_1 p_2 ... p_m > e^{H'+gamma} max{|a|, |b|}^2",
      "match": "Literal beginning of the statement, p. 14 of the arXiv copy (checked on the page image, including the constant in the proof)."
     }
    ],
    "proofSteps": [
     "Let (k_1 : k_2 : k_3 : k_4) be the image of Q on the Kummer surface with coprime integers. If Q mod p_j is on the image of the curve, p_j divides k_1 b^2 - k_2 ab + k_3 a^2.",
     "This integer has absolute value at most e^{H' + gamma} max{|a|, |b|}^2, so divisibility by all p_j forces it to vanish, giving Q = [P - P_0] or [P - Pbar_0] for some P in C(Q); the two cases are separated mod p_{j_0}. The constant is as printed; see the caution in the hypotheses."
    ],
    "statement": "Let C be a genus-2 curve (genus 2 is implicit in the source: the proof uses the Kummer surface of J and the hyperelliptic conjugate), P_0 in C(Q) with x(P_0) = (a : b) coprime integers, iota(P) = [P - P_0], and gamma a bound for h - hhat on J(Q). Let p_1, ..., p_m be primes of good reduction with p_1...p_m > e^{H' + gamma} max{|a|, |b|}^2, such that P_0 and its hyperelliptic conjugate are distinct mod some p_{j_0} if distinct in C(Q). If Q in J(Q) has hhat(Q) <= H' and Q mod p_j lies in iota(C(F_{p_j})) for all j, then Q is in iota(C(Q)).",
    "hypotheses": [
     "C of genus 2 with a rational point P_0",
     "naive height h on the Kummer surface and a bound gamma for h - hhat (Stoll [St1, St3])",
     "Reviewer caution (REVIEW-EXT-13-EXT-07B): the proof bounds |k_1 b^2 - k_2 ab + k_3 a^2| by e^{H'+gamma} max{|a|, |b|}^2. If h is the naive height log max|k_j| on the Kummer surface, the triangle inequality gives only 3 e^{H'+gamma} max{|a|, |b|}^2. The definition of h (Stoll [St1, St3]) was not read. A certificate should require p_1 ... p_m > 3 e^{H'+gamma} max{|a|, |b|}^2 unless the normalization of h is checked.",
     "imported without proof: that Q mod p_j in iota(C(F_{p_j})) implies p_j | k_1 b^2 - k_2 ab + k_3 a^2, and that vanishing of this form gives Q = [P - P_0] or [P - Pbar_0] (the image of the curve on the Kummer surface of a genus-2 Jacobian; Cassels-Flynn, Ch. 3, not read)"
    ]
   },
   "EffectiveDiophantineMethods:ED.6/quadratic-chabauty-set-for-rank-equal-genus-with-picard-rank-at-least-two": {
    "acceptance": [
     "This node is the ED.6 consumer of AnabelianGeometryAndNonabelianChabauty NC.5, which owns the depth-two quotient and height equations; the ED.6 obligation is the algorithmic and precision layer.",
     "Remark 3.14 failure mode: if log is not an isomorphism although r = g, increasing precision may not help. For X_0^+(N) weak BSD implies the isomorphism ([DF21, Lemma 7]); in general, if r = g and J(Q) is Zariski dense in J, a conjecture of Waldschmidt [Wal11, Conjecture 1] implies it."
    ]
   },
   "EffectiveDiophantineMethods:ED.6/coefficient-valuation-bound-for-the-quadratic-chabauty-function": {
    "proofSteps": [
     "Lemma 4.5 follows, in the source's words, 'from the discussion above and from (3.2)', which expresses h_p through lambda_Fil and lambda_phi, using the coefficient bounds phi(i) + c_1 for lambda_phi.",
     "For i >= i_0 the source writes phi(i) = -2 floor(log_p i) + c_1 and concludes Proposition 4.6 ('This proves the following'). See the caution in the hypotheses on where c_1 enters."
    ],
    "statement": "Let D be a residue disc in X(Q_p) intersected with ]U[, t a local parameter, and rho(t) = sum rho_i t^i the expansion of rho = h - h_p on D. With c_1 = ord_p(lambda_phi(x_1)), c_2 = min{0, v_spl, ord_p(beta_Fil), v_spl + ord_p(beta_Fil)}, c_3 = min_i ord_p(d_i) (the coefficients of the global height solve) and i_0 as defined in Section 4.4, for i >= i_0 one has ord_p(rho_i) >= -2 floor(log_p i) + c_1 + min{c_2, c_3}. Lemma 4.5: ord_p(h_i) >= min{ord_p(gamma_Fil), phi(i) + c_2} for the expansion of h_p. Here (4.21) phi(i) := -floor(log_p i) + min{d_i(eta), -floor(log_p i)} bounds the i-th coefficients of the parallel transport matrix, with d_i(eta) the valuation of the i-th coefficient of eta (0 beyond the degrees), and i_0 >= 0 is such that -floor(log_p i) <= min{d_i(eta), ord_p(beta_Fil)/2, (ord_p(gamma_Fil) - c_2)/2} for all i >= i_0.",
    "hypotheses": [
     "the quantities c_1, c_2, c_3, v_spl, phi(i) and i_0 of Section 4 (Section 4.2.2 with (4.21) read by the reviewer on p. 22; Proposition 4.1 and Lemmas 4.2-4.4 were not checked)",
     "Reviewer caution on c_1 (REVIEW-EXT-13-EXT-07B): the source says that the i-th coefficient of lambda_phi(x) has valuation >= phi(i) + c_1, states Lemma 4.5 with phi(i) + c_2 (no c_1), and then writes 'phi(i) = -2 floor(log_p i) + c_1 for all i >= i_0', whereas (4.21) gives phi(i) = -2 floor(log_p i) there. Proposition 4.6 is what the lambda_phi bound phi(i) + c_1 gives with phi as in (4.21); Lemma 4.5 as printed omits c_1. A certificate should use Proposition 4.6 with phi from (4.21) and recheck Lemma 4.5 against (3.2)."
    ],
    "acceptance": [
     "Combine with Lemma 4.7 (ED.0 node) to certify the roots of rho to precision (n - k)/d.",
     "Proposition 4.1 and Lemmas 4.2-4.4 of Sections 4.1-4.3 were not checked (the reviewer read only Section 4.2.2 with (4.21) on p. 22). Record their precision bounds as unverified inputs."
    ]
   }
  },
  "added": [],
  "removed": []
 },
 "links": {
  "added": [
   {
    "source": "EffectiveDiophantineMethods:ED.2/thue-equation-to-unit-equation-and-small-linear-form-in-logarithms",
    "target": "EffectiveDiophantineMethods:ED.2/initial-exponent-bound-from-a-logarithmic-form-lower-bound",
    "reason": "The proof of Lemma 2.4 obtains Lambda != 0 from the proof of Lemma 1.2: |e^Lambda - 1| < 1/2 in the real case and |e^{i Lambda} - 1| < 1/2 in the complex case, together with beta^(i_0) != 0 in (1.2). Added by the reviewer (REVIEW-EXT-13-EXT-07B).",
    "sources": [
     {
      "sourceId": "tzanakis-de-weger-practical-thue",
      "locator": "Proof of Lemma 2.4, p. 110 ('As we have seen in the proof of Lemma 1.2'), using pp. 105-106"
     }
    ],
    "addedBy": "independent-review-REVIEW-EXT-13-EXT-07B"
   }
  ],
  "removed": [],
  "changed": [
   {
    "source": "EffectiveDiophantineMethods:ED.1/lll-lower-bound-for-nonzero-vectors-of-a-reduced-basis-lattice",
    "target": "EffectiveDiophantineMethods:ED.1/inhomogeneous-lattice-reduction-via-closest-vector-distance",
    "reason": "The inhomogeneous case uses the same reduced basis, and the imported distance bound of de Weger Lemma 3.5 is of the same LLL type. Reviewer annotation (REVIEW-EXT-13-EXT-07B): the proof of Proposition 3.2 does not invoke (3.2). It uses the same LLL-reduced basis, computed by the integral L^3 algorithm (a hypothesis of the source node), together with de Weger [32] Lemma 3.5, which is a gap. The edge records the shared reduced basis, not a use of the inequality.",
    "sources": [
     {
      "sourceId": "tzanakis-de-weger-practical-thue",
      "locator": "Section II.3, case (ii), p. 114"
     }
    ]
   },
   {
    "source": "DiophantineApproximationAndTranscendence:DT.3",
    "target": "EffectiveDiophantineMethods:ED.2/initial-exponent-bound-from-a-logarithmic-form-lower-bound",
    "reason": "DT.3 is the atlas owner of \"Baker-type explicit lower bounds\" with \"the exact degree/height/prime dependence of a bound recorded\". Lemma 2.3 of Tzanakis-de Weger imports exactly such an explicit lower bound for a nonzero real linear form in logarithms, with the complex-case adaptation. Scope caveat: the source uses Waldschmidt 1980 with constants from its Appendix II, while the EXT-08 decomposition of DT.3 records Baker and Matveev. The constants must be recomputed for whichever theorem DT.3 exports. Reviewer annotation (REVIEW-EXT-13-EXT-07B): the promoted DT.3 decomposition (node DiophantineApproximationAndTranscendence:DT.3/baker-lower-bounds-for-linear-forms-in-logarithms) gives Baker 1975 with an effectively computable but unspecified constant, and Matveev 2000 with an explicit constant only for rational a_j. Tzanakis-de Weger need an explicit bound for logarithms of algebraic units of degree n (Waldschmidt 1980, source Appendix II). DT.3's stage description covers this need (its source route names Waldschmidt), but its current decomposition does not supply it; see the gaps.",
    "sources": [
     {
      "sourceId": "tzanakis-de-weger-practical-thue",
      "locator": "Lemma 2.3 and Appendix II reference, p. 110"
     }
    ]
   },
   {
    "source": "EffectiveDiophantineMethods:ED.2/exponent-bound-and-exponential-decay-of-the-linear-form",
    "target": "EffectiveDiophantineMethods:ED.2/four-class-certificate-for-all-solutions-of-a-thue-equation",
    "reason": "The inequality |Lambda| < C_6 exp(-(n/C_5)A) of Lemma 2.2 is the form (3.1) with K_1 = C_6 and K_2 = n/C_5 that the reduction step needs. Reviewer annotation (REVIEW-EXT-13-EXT-07B): the source says only that K_1, K_2, K_3 come from Lemmas 2.2 and 2.4 (p. 111). In the complex case (1.4) the unknowns include a_0, with |a_0| < r A (proof of Lemma 2.3), so K_2 and K_3 must be adjusted there.",
    "sources": [
     {
      "sourceId": "tzanakis-de-weger-practical-thue",
      "locator": "Section II.3, first paragraph, p. 111"
     }
    ]
   },
   {
    "source": "EffectiveDiophantineMethods:ED.3/finite-index-subgroup-certificate-with-index-prime-to-the-sieve-primes",
    "target": "EffectiveDiophantineMethods:ED.4/coleman-integrals-on-residue-classes-of-a-good-reduction-curve",
    "reason": "The annihilating differential needs only log of a finite-index subgroup with the same p-adic closure, and Remark 6.1 says index prime to p . #J(F_p) suffices; this is how ED.3's certificate enters ED.4. Reviewer annotation (REVIEW-EXT-13-EXT-07B): Remark 6.1 is stated for Flynn's method, and Remark 2.2 refers to it for Chabauty-Coleman. For Coleman's annihilating differential any finite-index subgroup G suffices, since log G and log J(Q) span the same Q_p-subspace. What ED.4 consumes is therefore the finite-index (rank) certificate, not the condition that the index is prime to p . #J(F_p). The rank certificate itself is an ED.3 gap.",
    "sources": [
     {
      "sourceId": "mccallum-poonen-method-of-chabauty-coleman",
      "locator": "Remark 6.1, p. 8"
     }
    ]
   },
   {
    "source": "HeightsRationalPointsAndObstructions:RP.1",
    "target": "EffectiveDiophantineMethods:ED.3/finite-index-subgroup-certificate-with-index-prime-to-the-sieve-primes",
    "reason": "RP.1 owns Kummer maps, Selmer groups and the finite-generation argument. A finite-index subgroup G of J(Q) is meaningful only once rank J(Q) is known, and McCallum-Poonen assume it is computed by descent (\"There exists an algorithm that attempts to compute J(Q), based on descent\"). The index test then certifies saturation. Reviewer annotation (REVIEW-EXT-13-EXT-07B): RP.1's stated scope is the Kummer map, finite Selmer groups and finite generation, with the warning that a Selmer upper bound is not the rank. That is the input the ED.3 finite-index certificate needs. The rank algorithm (Selmer upper bound plus independent points) is ED.3's own construction and is unread (gap).",
    "sources": [
     {
      "sourceId": "mccallum-poonen-method-of-chabauty-coleman",
      "locator": "Section 2, pp. 2-3, and Remark 6.1, p. 8 of the author copy"
     }
    ]
   },
   {
    "source": "EffectiveDiophantineMethods:ED.5/canonical-height-separation-of-cosets-of-N-J-Q",
    "target": "EffectiveDiophantineMethods:ED.5/chabauty-plus-sieve-determination-of-rational-points",
    "reason": "Step 4 takes 'the point of smallest canonical height in the coset' of NJ(Q) given by a and checks whether it comes from C(Q). Reviewer annotation (REVIEW-EXT-13-EXT-07B): Section 4.4 does not cite Section 4.2, and the correctness of the procedure does not need it. The separation lemma explains why Step 4 eventually succeeds for a coset containing iota(P): once N is divisible by the torsion exponent and N^2 > 4 hhat(iota(P))/m, iota(P) is the only point of canonical height <= hhat(iota(P)) in its coset, hence the smallest. The edge supports termination, not soundness.",
    "sources": [
     {
      "sourceId": "bruin-stoll-mordell-weil-sieve",
      "locator": "Section 4.4, step 4, p. 17; Section 4.2, p. 13"
     }
    ]
   },
   {
    "source": "EffectiveDiophantineMethods:ED.5/kummer-surface-test-for-small-points-on-a-genus-two-jacobian",
    "target": "EffectiveDiophantineMethods:ED.5/chabauty-plus-sieve-determination-of-rational-points",
    "reason": "Step 4 must check whether a small coset representative comes from a rational point. For genus 2 with a rational base point, Lemma 4.1 (Section 4.2) is the test the paper provides; the end of Section 3.3 recommends 'more mod p checks' for this purpose. Reviewer annotation (REVIEW-EXT-13-EXT-07B): Section 4.4 does not say how the check is made, so this is an optional genus-2 verification route, not a dependency stated there. For other genera the check can be made by computing the divisor directly.",
    "sources": [
     {
      "sourceId": "bruin-stoll-mordell-weil-sieve",
      "locator": "Section 4.2, p. 14, used in Section 4.4 step 4"
     },
     {
      "sourceId": "bruin-stoll-mordell-weil-sieve",
      "locator": "End of Section 3.3, p. 12 ('It is usually a good idea to first do some more mod p checks')"
     }
    ]
   },
   {
    "source": "EffectiveDiophantineMethods:ED.4/coleman-bound-on-rational-points-at-a-good-prime",
    "target": "EffectiveDiophantineMethods:ED.5/chabauty-plus-sieve-determination-of-rational-points",
    "reason": "The claim that each residue class mod p with omega-bar_p nonvanishing contains at most one rational point is the case m = 0 of Coleman's bound (Theorem 5.3(a) with m + 1 = 1 and p >= 3). Bruin-Stoll cite [St4, Section 6] for the same conclusion.",
    "sources": [
     {
      "sourceId": "mccallum-poonen-method-of-chabauty-coleman",
      "locator": "McCallum-Poonen Theorem 5.3(a), p. 7; Bruin-Stoll Section 4.4, p. 16"
     },
     {
      "sourceId": "bruin-stoll-mordell-weil-sieve",
      "locator": "Section 4.4, p. 16 (the one-point-per-residue-class claim, cited there to [St4, Section 6])"
     }
    ]
   },
   {
    "source": "EffectiveDiophantineMethods:ED.5/mordell-weil-sieve-set-and-its-soundness",
    "target": "EffectiveDiophantineMethods:ED.6/quadratic-chabauty-algorithm-for-modular-curves-with-failure-conditions",
    "reason": "Section 3.4 uses the Mordell-Weil sieve (its commutative diagram with M = M'p) to show that residue discs or cosets of p^N J(Q) contain no rational point, comparing the p-adic output with X(Q). Reviewer annotation (REVIEW-EXT-13-EXT-07B): in BDMTV the sieve is applied after Algorithm 3.12 returns (Section 3.4, Remark 3.8, and the paragraph after Remark 3.16); it is not a step of the algorithm. BDMTV assume J(Q) torsion-free 'for ease of exposition' and cite Bruin-Stoll [BS10] for the practical sieve.",
    "sources": [
     {
      "sourceId": "bdmtv-quadratic-chabauty-modular-curves",
      "locator": "Section 3.4, pp. 12-13"
     }
    ]
   }
  ]
 },
 "gaps": [
  {
   "title": "ED.0 certified exact-number presentations and isolating intervals are not source-decomposed; only a p-adic root-isolation lemma was read",
   "neededBy": [
    "EffectiveDiophantineMethods:ED.0",
    "EffectiveDiophantineMethods:ED.0/certified-p-adic-root-isolation-from-truncated-power-series"
   ],
   "detail": "ED.0 asks for isolating intervals and discs, valuation adapters and rational error bounds on ComputationalNumberTheory CN.0 carriers. The only primary statement read is BDMTV Lemma 4.7, a disc certificate for roots of truncated p-adic power series. No source for real or complex root isolation of algebraic numbers, or for interval arithmetic on logarithms (CN.4), was read. The EXT-08 packet for ComputationalNumberTheory decomposes only CN.0 (machine model) and CN.1. Next action: select a primary source for certified real root isolation and interval evaluation of logarithms (e.g. the interval-arithmetic source registered for CN.4) and decompose it under CN.4, with ED.0 as the adapter."
  },
  {
   "title": "LLL (Lenstra-Lenstra-Lovasz 1982) and de Weger's thesis (CWI Tract 65) are not read: the lattice lower bound, the closest-vector distance lemma and the integral LLL are imports",
   "neededBy": [
    "EffectiveDiophantineMethods:ED.1/lll-lower-bound-for-nonzero-vectors-of-a-reduced-basis-lattice",
    "EffectiveDiophantineMethods:ED.1/inhomogeneous-lattice-reduction-via-closest-vector-distance",
    "EffectiveDiophantineMethods:ED.1"
   ],
   "detail": "Tzanakis-de Weger take several results from other sources: |x| >= 2^{-(q-1)/2}|b_1| is Proposition (1.11) of LLL; the integral version of L^3 is de Weger [31, Sect. 3]; the distance bound l(x, Gamma) >= 2^{-(q-1)/2}||s_{i*}|| |b_1| is de Weger [32] Lemma 3.5, with Lemmas 3.6-3.7 for the variants. The dependent case (iii) was read only in outline. The CWI record of de Weger's thesis (https://ir.cwi.nl/pub/13190) was not fetched. Next source action: obtain de Weger, Algorithms for Diophantine Equations, Chapter 3. The source cites it as [32], a PhD thesis (Leiden, 1987) 'to appear as a CWI Tract' (1988); [31] is de Weger, J. Number Theory 26 (1987), 325-367 (the integral L^3 in Sect. 3). Also read and LLL, Math. Ann. 261 (1982), (1.11) with proof; check GN.5's decomposition for these statements."
  },
  {
   "title": "Explicit logarithmic-form constants and auxiliary inputs for ED.2 are unread: Waldschmidt 1980 (Appendix II), Petho-de Weger Lemma 2.3, fundamental units and norm-form solutions, Thue-Mahler p-adic analogue",
   "neededBy": [
    "EffectiveDiophantineMethods:ED.2/initial-exponent-bound-from-a-logarithmic-form-lower-bound",
    "EffectiveDiophantineMethods:ED.2/four-class-certificate-for-all-solutions-of-a-thue-equation",
    "EffectiveDiophantineMethods:ED.2/thue-equation-to-unit-equation-and-small-linear-form-in-logarithms",
    "EffectiveDiophantineMethods:ED.2/large-thue-solutions-approximate-a-real-root",
    "EffectiveDiophantineMethods:ED.2/exponent-bound-and-exponential-decay-of-the-linear-form"
   ],
   "detail": "The following ED.2 inputs were not read. The constants C_7, C_8 in Lemma 2.3 come from Waldschmidt's theorem as restated in Appendix II of Tzanakis-de Weger. Lemma 2.4 ends by citing Petho-de Weger [20] Lemma 2.3. The method assumes known fundamental units and a complete set of nonassociated elements of given norm (\"not discussed\" in the source; Appendix I treats totally real quartic fields via Billevic). S-unit and Thue-Mahler instances need the p-adic reduction of Tzanakis-de Weger, How to explicitly solve a Thue-Mahler equation (Compositio 84, 1992; EUDML record located, not read). The ED.2 acceptance also asks to register the Baker/Matveev source separately; the EXT-08 DiophantineApproximationAndTranscendence packet has a DT.3 node for Baker and Matveev. Next source action: read Appendix II and the Compositio 1992 paper, and decide whether ED.2 uses Waldschmidt 1980 or Matveev 2000 constants. Reviewer additions (REVIEW-EXT-13-EXT-07B): (a) the promoted DT.3 node DiophantineApproximationAndTranscendence:DT.3/baker-lower-bounds-for-linear-forms-in-logarithms gives Matveev's explicit constant only for rational a_j and Baker 1975 with an unspecified constant, so no current supplier exports the explicit bound for algebraic units that Lemma 2.3 imports; (b) Lemma 1.1(ii) imports Legendre's criterion (Hardy-Wright, Theorem 184), not read; (c) Lemma 2.1 implicitly needs U_I invertible for the index sets used (Dirichlet's unit theorem: nonvanishing regulator), not stated; (d) reference [29] is printed as 'On the practical solution of the Thue-Mahler equation, in preparation', so the identification with the Compositio 1992 paper is unverified."
  },
  {
   "title": "ED.3 descent algorithms, rank certification and saturation bounds are not in the sources read",
   "neededBy": [
    "EffectiveDiophantineMethods:ED.3",
    "EffectiveDiophantineMethods:ED.3/finite-index-subgroup-certificate-with-index-prime-to-the-sieve-primes"
   ],
   "detail": "McCallum-Poonen assume J(Q) has been computed (\"There exists an algorithm that attempts to compute J(Q), based on descent ... This is not the concern of this article\"). Bruin-Stoll assume the rank and generators, citing Stoll's height algorithms [St1, St3] for genus 2. BDMTV assume r = g a priori (Remark 3.13: Gross-Zagier-Kolyvagin-Logachev for modular curves, 2-descent for hyperelliptic curves). So the isogeny/Selmer descent, the certified rank upper bound, independence of points and saturation at all primes up to a height-derived bound are all unread. The only decomposed item is the index test of McCallum-Poonen Remark 6.1, whose justification is a single sentence. Next source action: read Stoll, Implementing 2-descent for Jacobians of hyperelliptic curves (Acta Arith. 98, 2001) and a saturation reference (e.g. Siksek 1995 for elliptic curves), and check the RP.1 decomposition. Reviewer addition (REVIEW-EXT-13-EXT-07B): the index test of Remark 6.1 is stated in one sentence, with the misprint 'G/pG' for G/lG, and needs J(Q)[l] contained in G, which the source does not state. Without it the test can accept a subgroup of index divisible by l (J(Q) = Z x Z/l, G = Z x 0). Bruin-Stoll's G = Z P + J(Q)_tors satisfies it."
  },
  {
   "title": "ED.4 imports: Chabauty 1941 (general finiteness proof), Coleman 1985 (Effective Chabauty, p <= 2g and number fields), Milne (restriction of differentials), residue-class facts, Stoll 2006 (the 2r' bound)",
   "neededBy": [
    "EffectiveDiophantineMethods:ED.4/chabauty-finiteness-when-closure-dimension-is-less-than-genus",
    "EffectiveDiophantineMethods:ED.4/coleman-integrals-on-residue-classes-of-a-good-reduction-curve",
    "EffectiveDiophantineMethods:ED.4/coleman-bound-on-rational-points-at-a-good-prime"
   ],
   "detail": "McCallum-Poonen leave several points to other sources. They omit the proof of Chabauty's Theorem 4.4. They state the residue-class properties (1)-(3) with \"one can show\". They quote the isomorphism H^0(J, Omega^1) -> H^0(X, Omega^1) from Milne, Jacobian varieties, Prop. 2.2. They refer to Coleman's Duke 1985 paper for bounds without the condition p > 2g, and to Stoll 2006 for #X(Q) <= #X(F_p) + 2r'. Their elementary facts on p-adic Lie groups come from Bourbaki, Lie groups III 7.6. None of these was read. Theorem A.5 imports intersection theory from Liu's book (6.4.7, 6.4.9, 9.1.2, 9.1.21, 9.1.34-9.1.35). Next action: read Coleman 1985 (Duke 52) for the general residue-disc bound and take the restriction isomorphism from the JacobianChallenge/SF.3 decomposition. Reviewer additions (REVIEW-EXT-13-EXT-07B): Lemma 5.1 uses Newton-polygon theory from Koblitz, p-adic numbers, IV.4; Remark 4.1 uses the Neron model's smoothness and formal group ([BLR90]); Proposition A.1 also cites Liu, Definition 6.3.7. None was read. Theorem 5.3 and A.5 prove finiteness of X(Q) only for good-reduction (resp. any) primes p > 2g (or residue classes with m < p - 2); the finiteness of X(Q_p) intersected with Jbar(Q) (Theorem 4.4) remains unproved from this source."
  },
  {
   "title": "ED.5: Bruin-Stoll Sections 5-8 (bad and deep information for genus 2, implementation, efficiency), Stoll's Main Conjecture and [St4] Section 6 are unread; termination is conjectural",
   "neededBy": [
    "EffectiveDiophantineMethods:ED.5/chabauty-plus-sieve-determination-of-rational-points",
    "EffectiveDiophantineMethods:ED.5/mordell-weil-sieve-set-and-its-soundness",
    "EffectiveDiophantineMethods:ED.5",
    "EffectiveDiophantineMethods:ED.5/kummer-surface-test-for-small-points-on-a-genus-two-jacobian",
    "EffectiveDiophantineMethods:ED.5/canonical-height-separation-of-cosets-of-N-J-Q"
   ],
   "detail": "Several ED.5 inputs were not read. Only good-reduction information was decomposed; Sections 5-6 on bad and deep information for genus 2 were located but not read. The one-point-per-residue-class claim is cited to Stoll, Independence of rational points on twists [St4] Section 6; it is linked here to McCallum-Poonen Theorem 5.3(a) with m = 0. Termination rests on Stoll's Main Conjecture ([St5], Finite descent obstructions) and Conjecture 4.2. The integral-point workflow (Section 4.3) uses bounds from [BMSST] (not read) and a second sieving stage due to Siksek. Next action: read Stoll 2006 Section 6 and Sections 5-6 of Bruin-Stoll if bad-prime information is needed; keep termination labelled conditional. Reviewer additions (REVIEW-EXT-13-EXT-07B): Section 4.2 and Lemma 4.1 use the height-pairing matrix and the naive-minus-canonical height bound gamma from Stoll's genus-2 algorithms [St1, St3], and the Kummer-surface description of the image of the curve (Cassels-Flynn, Ch. 3). None was read."
  },
  {
   "title": "ED.6 quadratic Chabauty imports are unread: Balakrishnan-Dogra 2018, BDM+19, Betts-Dogra 2019, Kim-Tamagawa, Nekovar heights, Tuitman's algorithms, and BDMTV Sections 4.1-4.3 and 5",
   "neededBy": [
    "EffectiveDiophantineMethods:ED.6/quadratic-chabauty-set-for-rank-equal-genus-with-picard-rank-at-least-two",
    "EffectiveDiophantineMethods:ED.6/local-heights-away-from-p-via-reduction-graph-laplacian",
    "EffectiveDiophantineMethods:ED.6/quadratic-chabauty-algorithm-for-modular-curves-with-failure-conditions",
    "EffectiveDiophantineMethods:ED.6/coefficient-valuation-bound-for-the-quadratic-chabauty-function"
   ],
   "detail": "BDMTV Section 2 is an overview and cites [BD18, BDM+19] for proofs. Theorem 3.2 is Betts-Dogra [BD19]; the finiteness of local heights away from p is Kim-Tamagawa [KT08] Cor. 0.2; the height pairing is Nekovar [Nek93]; Frobenius on rigid cohomology is Tuitman [Tui16, Tui17]. In the precision analysis of Sections 4.1-4.3 the reviewer read only Section 4.2.2 with (4.21) (p. 22); Proposition 4.1 and Lemmas 4.2-4.4 were not checked, and the worked examples of Section 5 were not read. The owner of the theory is AnabelianGeometryAndNonabelianChabauty NC.5 (EXT-06); its packet was not available. Next source action: read Balakrishnan-Dogra, Quadratic Chabauty and rational points I (Duke 2018), Sections 3-5 and Prop. 5.5, and BDMTV Sections 4.1-4.3."
  },
  {
   "title": "Tzanakis-de Weger give no upper bound for |Y| in terms of A (needed for Y_2 and Y_3), and Section II has printed slips that affect certificate constants",
   "neededBy": [
    "EffectiveDiophantineMethods:ED.2/four-class-certificate-for-all-solutions-of-a-thue-equation",
    "EffectiveDiophantineMethods:ED.2/exponent-bound-and-exponential-decay-of-the-linear-form",
    "EffectiveDiophantineMethods:ED.1/inhomogeneous-lattice-reduction-via-closest-vector-distance",
    "EffectiveDiophantineMethods:ED.2"
   ],
   "detail": "Found by the reviewer (REVIEW-EXT-13-EXT-07B) on the page images. (1) The Remark after Lemma 2.4 (p. 111) says Y_3 'can be derived easily' from A < C_9 and does not do it. Y_2 is likewise obtained from the reduced bound on A. Both need an upper bound for |Y| in terms of A, which is absent (Lemma 2.1 goes the other way). A route is |Y| = |beta^(i) - beta^(j)|/|xi^(i) - xi^(j)| with |beta^(h)| <= mu_+ exp(A sum_k |log|epsilon_k^(h)||); it must be written and checked, or taken from Section III. (2) Lemma 2.1 (p. 107) defines U_I with 'i a row and l a column' but writes (2.1) as v = U_I a; this holds only for the transpose, and the norm N[U_I^{-1}] matches the other orientation. C_5 must be computed with rows indexed by conjugates. (3) The proof of Proposition 3.2 (p. 115) prints '|Lambda| > K_1 exp(-K_2 A) has no solution', to be read with '<'. (4) In the complex case the reduction parameters must account for a_0 (|a_0| < r A). Next action: read Section III (pp. 116-130) to see how the authors compute Y_2 and handle a_0, and de Weger [32] Lemma 3.7."
  },
  {
   "title": "BDMTV Section 4.4: Lemma 4.7's printed hypothesis is weaker than its proof uses, and the bookkeeping of c_1 between Lemma 4.5, (4.21) and Proposition 4.6 is inconsistent",
   "neededBy": [
    "EffectiveDiophantineMethods:ED.0/certified-p-adic-root-isolation-from-truncated-power-series",
    "EffectiveDiophantineMethods:ED.6/coefficient-valuation-bound-for-the-quadratic-chabauty-function",
    "EffectiveDiophantineMethods:ED.0"
   ],
   "detail": "Found by the reviewer (REVIEW-EXT-13-EXT-07B). (1) Lemma 4.7 assumes max{i >= 0 : ord_p(F_i) + i = n} < m, but its proof uses that G(x + alpha) = p^{-k} F(p(x + alpha)) has degree <= m modulo p^{n-k}, i.e. ord_p(F_i) + i >= n for all i > m. The printed condition does not give this. A certificate must verify the tail condition, for rho from Proposition 4.6. (2) Section 4.4 bounds the coefficients of lambda_phi by phi(i) + c_1, states Lemma 4.5 with phi(i) + c_2, and writes 'phi(i) = -2 floor(log_p i) + c_1 for i >= i_0'. By (4.21) (p. 22), phi(i) = -2 floor(log_p i) for those i. Proposition 4.6 is consistent with the lambda_phi bound, but Lemma 4.5 as printed drops c_1. Next action: recheck Lemma 4.5 from (3.2) and read Proposition 4.1 and Lemmas 4.2-4.4; check whether a later erratum or the published version changes Lemma 4.7."
  },
  {
   "title": "Bruin-Stoll Lemma 4.1: the bound on the Kummer form omits the factor 3 given by the triangle inequality, unless the naive height is normalised otherwise",
   "neededBy": [
    "EffectiveDiophantineMethods:ED.5/kummer-surface-test-for-small-points-on-a-genus-two-jacobian"
   ],
   "detail": "Found by the reviewer (REVIEW-EXT-13-EXT-07B) on the page image of p. 14. The proof bounds |k_1 b^2 - k_2 ab + k_3 a^2| by e^{H'+gamma} max{|a|, |b|}^2. With h = log max|k_j| and h - hhat <= gamma one has |k_j| <= e^{H'+gamma}, and the triangle inequality gives 3 e^{H'+gamma} max{|a|, |b|}^2. Until the definition of h in [St1, St3] is read, a certificate should use p_1 ... p_m > 3 e^{H'+gamma} max{|a|, |b|}^2. Next action: read the naive-height normalisation in [St1] Stoll, On the height constant for curves of genus two, Acta Arith. 90 (1999) 183-201, and [St3] part II, Acta Arith. 104 (2002) 165-182 (as listed in the Bruin-Stoll references), and check the published LMS J. Comput. Math. version of Lemma 4.1."
  }
 ],
 "coverage": [
  {
   "stageId": "EffectiveDiophantineMethods:ED.0",
   "status": "partial",
   "remaining": [
    "Certified real/complex isolation of algebraic numbers and interval logarithms (CN.0/CN.4 adapters): no source read.",
    "Only BDMTV Lemma 4.7 (p-adic disc certificate) decomposed.",
    "Lemma 4.7 needs the tail condition ord_p(F_i) + i >= n for i >= m, which its printed hypothesis does not give (reviewer)."
   ]
  },
  {
   "stageId": "EffectiveDiophantineMethods:ED.1",
   "status": "partial",
   "remaining": [
    "LLL Proposition (1.11) and the integral LLL of de Weger [31] unread.",
    "de Weger [32] (PhD thesis, Leiden 1987) Lemmas 3.5-3.7 (closest-vector distance) unread; case (iii) (dependent mu_i) only outlined."
   ]
  },
  {
   "stageId": "EffectiveDiophantineMethods:ED.2",
   "status": "partial",
   "remaining": [
    "Waldschmidt constants (Tzanakis-de Weger Appendix II) and Petho-de Weger Lemma 2.3 unread.",
    "Fundamental units and norm-equation solutions assumed, not treated.",
    "S-unit and Thue-Mahler (p-adic) reduction (Tzanakis-de Weger 1992) unread.",
    "Explicit derivation of Y_3 from A < C_9 not written in the source.",
    "Upper bound for |Y| in terms of A (needed for Y_2 and Y_3) not in the source; U_I orientation slip in Lemma 2.1 and the a_0 adjustment in the complex case to resolve (reviewer); Section III (pp. 116-130) unread.",
    "Legendre's criterion (Hardy-Wright Theorem 184) imported, not read."
   ]
  },
  {
   "stageId": "EffectiveDiophantineMethods:ED.3",
   "status": "partial",
   "remaining": [
    "Isogeny/Selmer descent algorithms and certified rank upper bounds: no source read.",
    "Saturation at all primes up to a height bound, and independence of points: unread; only the index test (McCallum-Poonen Remark 6.1) decomposed.",
    "Genus-one torsor example and elliptic rank computation required by the acceptance: not covered.",
    "The index test of McCallum-Poonen Remark 6.1 needs J(Q)[l] contained in G, which the source does not state (reviewer)."
   ]
  },
  {
   "stageId": "EffectiveDiophantineMethods:ED.4",
   "status": "partial",
   "remaining": [
    "Chabauty 1941 general finiteness proof (omitted in McCallum-Poonen).",
    "Coleman 1985 (Effective Chabauty) for p <= 2g and number fields; Stoll 2006 2r' bound.",
    "Residue-class facts (1)-(3) stated with \"one can show\"; Milne's restriction isomorphism; Bourbaki Lie groups III 7.6.",
    "Flynn's method and elliptic Chabauty only read, not decomposed.",
    "Koblitz IV.4 (Newton polygons, Lemma 5.1) and [BLR90] (Neron model and its formal group, Remark 4.1) imported, not read."
   ]
  },
  {
   "stageId": "EffectiveDiophantineMethods:ED.5",
   "status": "partial",
   "remaining": [
    "Bruin-Stoll Sections 5-8 (bad/deep information, implementation, efficiency) unread.",
    "Stoll [St4] Section 6 and the Main Conjecture [St5]; termination conditional on Conjecture 4.2.",
    "Integral points on hyperelliptic curves via [BMSST] bounds and the Siksek second stage: not decomposed.",
    "Lemma 4.1: Kummer-surface facts (Cassels-Flynn Ch. 3), the naive-height normalisation and the constant gamma ([St1, St3]) unread; its printed constant may need a factor 3 (reviewer)."
   ]
  },
  {
   "stageId": "EffectiveDiophantineMethods:ED.6",
   "status": "partial",
   "remaining": [
    "Quadratic Chabauty foundations BD18, BDM+19 (Sections 3-5), BD19, KT08, Nekovar heights, Tuitman algorithms: unread imports (owner NC.5).",
    "BDMTV Proposition 4.1 and Lemmas 4.2-4.4 not checked (only Section 4.2.2 with (4.21) read); Section 5 examples unread; c_1 bookkeeping in Lemma 4.5 to recheck (reviewer).",
    "Complete worked Thue, S-unit, elliptic and higher-genus examples with proof-producing output: not produced."
   ]
  }
 ],
 "sources": [
  {
   "id": "mccallum-poonen-method-of-chabauty-coleman",
   "title": "The method of Chabauty and Coleman",
   "authors": "William McCallum and Bjorn Poonen",
   "edition": "Published in Explicit methods in number theory; rational points and diophantine equations, Panoramas et Syntheses 36, Societe Mathematique de France, 2012, pp. 99-117 (as stated in the copy). Copy inspected: author copy dated June 14, 2010, 17 pages, from the second author's web page (authorized public copy, not in the supplied library); page numbers are those of the author copy.",
   "url": "https://math.mit.edu/~poonen/papers/chabauty.pdf",
   "sha256": "fb8d1a580def6365ebb979fd64e31d7f00d555399502b76035718112f21ab55a",
   "readSections": [
    "Sections 1-9 in full (pp. 1-13): Jacobian embedding, p-adic logarithm, Lemma 4.2, Theorem 4.4, Sections 5.1-5.5 (Lemma 5.1, Theorem 5.3 with proofs, Remarks 5.2, 5.4-5.6), Flynn's method and Remarks 6.1-6.2, effectiveness (Section 7), Examples 8.1-8.4, elliptic Chabauty",
    "Appendix A (Proposition A.1, Lemmas A.3-A.4, Theorem A.5 with proofs), pp. 13-15",
    "References, pp. 15-17",
    "Reviewer (REVIEW-EXT-13-EXT-07B): re-fetched 2026-09-24 from https://math.mit.edu/~poonen/papers/chabauty.pdf, SHA-256 fb8d1a580def6365ebb979fd64e31d7f00d555399502b76035718112f21ab55a (matches); all 17 pages read, pp. 7-8 (Theorem 5.3, Remark 6.1) also on page images."
   ]
  },
  {
   "id": "bruin-stoll-mordell-weil-sieve",
   "title": "The Mordell-Weil sieve: proving non-existence of rational points on curves",
   "authors": "Nils Bruin and Michael Stoll",
   "edition": "arXiv:0906.1934v2 [math.NT], 30 Nov 2009 (dated November 11, 2009), 47 pages; published in LMS J. Comput. Math. 13 (2010), 272-306 per the arXiv record (not checked against the journal). Not in the supplied library; fetched 2026-09-16 from arXiv. Page numbers are those of the arXiv copy.",
   "url": "https://arxiv.org/abs/0906.1934",
   "sha256": "33f88cbd7b031914e9c73797eb6ffe1485d38122667a88cd9a5f88d842cd43dd",
   "readSections": [
    "Section 1 Introduction, pp. 1-3",
    "Section 2 The idea, pp. 3-4",
    "Section 3 Algorithms (3.1 choice of S, 3.2 choice of N with Definition 3.1, Problem 3.2, FindQSequence; 3.3 computation of A(N Gamma) with PrepareLift and Lift), pp. 4-12",
    "Section 4 Applications (4.1 non-existence, 4.2 finding points with Lemma 4.1, 4.3 integral points, 4.4 combination with Chabauty, Conjecture 4.2, Lemma 4.3 with proof, Conjecture 4.4), pp. 12-21",
    "Reviewer (REVIEW-EXT-13-EXT-07B): re-fetched 2026-09-24 from https://arxiv.org/pdf/0906.1934v2, SHA-256 33f88cbd7b031914e9c73797eb6ffe1485d38122667a88cd9a5f88d842cd43dd (matches); pp. 1-22 read (Sections 1-4 and the opening of Section 5), Lemma 4.1 (p. 14) also on the page image.",
    "References (read by the reviewer to identify [St1], [St3], [St4], [St5], [CF], [BMSST])"
   ]
  },
  {
   "id": "tzanakis-de-weger-practical-thue",
   "title": "On the practical solution of the Thue equation",
   "authors": "N. Tzanakis and B. M. M. de Weger",
   "edition": "Journal of Number Theory 31 (1989), 99-132. Copy inspected: scan of the published article (34 pages, printed pp. 99-132) from the University of Twente research repository (authorized institutional copy, not in the supplied library). The OCR layer garbles formulas, so every constant and inequality used was read on page images.",
   "url": "https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf",
   "sha256": "2eff85fb82ca8773b344a6d6c709e496f38f1ed3d64f8b9caf9dd22905b2c7b3",
   "readSections": [
    "Section I Introduction, pp. 99-102",
    "Section II.1 From the Thue equation to a linear form in logarithms (Lemmas 1.1-1.2 with proofs, the unit equation (1.3)-(1.4)), pp. 102-107",
    "Section II.2 Upper bounds (Lemmas 2.1-2.4 with proofs), pp. 107-111",
    "Section II.3 Reducing the upper bound (cases (i)-(iii), Propositions 3.1-3.2 with proofs), pp. 111-116",
    "Reviewer (REVIEW-EXT-13-EXT-07B): re-fetched 2026-09-24 from https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf, SHA-256 2eff85fb82ca8773b344a6d6c709e496f38f1ed3d64f8b9caf9dd22905b2c7b3 (matches); printed pp. 99-116 and the references pp. 131-132 read on page images (zoomed at Lemma 1.1, Lemma 1.2, the a_0 bound, (3.1) and Propositions 3.1-3.2).",
    "References, pp. 131-132 (read by the reviewer to identify [16], [20], [29], [30], [31], [32])"
   ]
  },
  {
   "id": "bdmtv-quadratic-chabauty-modular-curves",
   "title": "Quadratic Chabauty for modular curves: algorithms and examples",
   "authors": "Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Muller, Jan Tuitman and Jan Vonk",
   "edition": "arXiv:2101.01862v4 [math.NT], 7 Mar 2023, 39 pages. Not in the supplied library; fetched 2026-09-16 from arXiv. Page numbers are those of the arXiv copy.",
   "url": "https://arxiv.org/abs/2101.01862",
   "sha256": "738f0ec0cd588e20a569bc029fe2bb9611abc5d16fee7d36f9e966357c25f61d",
   "readSections": [
    "Section 1 Introduction (Theorems 1.1-1.3, Remark 1.4), pp. 1-3",
    "Section 2 Quadratic Chabauty: theory (2.1-2.3), pp. 3-6",
    "Section 3 opening, Remark 3.1, 3.1 local heights away from p (Theorem 3.2 statement), 3.2 local heights at p (opening), 3.4 Mordell-Weil sieving, 3.5 implementation (Definition 3.9, Assumption 3.10, Algorithm 3.12, Remarks 3.11-3.16, 3.5.1 opening), pp. 6-15",
    "Section 4 opening and 4.4 (Lemma 4.5, Proposition 4.6, Lemma 4.7 with proof, Remark 4.8), pp. 16 and 24-25",
    "Reviewer (REVIEW-EXT-13-EXT-07B): re-fetched 2026-09-24 from https://arxiv.org/pdf/2101.01862v4, SHA-256 738f0ec0cd588e20a569bc029fe2bb9611abc5d16fee7d36f9e966357c25f61d (matches); pp. 1-17 and 23-25 read, plus Section 4.2.2 on p. 22 ((4.21), the definition of phi(i) and d_i(eta)); Proposition 4.1 and Lemmas 4.2-4.4 not checked."
   ]
  }
 ],
 "other": {}
}
```

</details>

<details><summary><code>HeightsRationalPointsAndObstructions.json</code></summary>

```json
{
 "packet": "research/expansion/external/EXT-07/HeightsRationalPointsAndObstructions.json",
 "review": {
  "status": "needs_changes",
  "reviewer": "independent-review-REVIEW-EXT-13-EXT-07B",
  "date": "2026-09-24",
  "notes": "Scope: all 59 nodes, 107 links, 7 coverage records and 11 gaps of the EXT-07 Heights packet. Sources fetched 2026-09-24 into the reviewer's scratch area (nothing copied into the repository): Poonen's author PDF, Zhang 1998 (JSTOR scan on the author's page), Ullmo (arXiv v1) and Szpiro-Ullmo-Zhang (author's page), all four with SHA-256 matching the packet; Faltings 1983 from the Goettingen GDZ digitization (a different scan from the library file, SHA-256 f72a869f..., recorded in the source entry); Silverman's public table of contents and errata list (new source silverman-aec-errata-2022). Silverman AEC itself could not be re-read (library copy unavailable, no authorized public copy), so the 29 nodes resting on it (all of RP.0, thirteen RP.1 nodes, five RP.4 nodes, and the Silverman parts of two RP.6 register nodes) are unverifiable. A new gap records this, and the claimed Silverman misprints (VIII.5.4(c), X.4.5.1, X.4.9) stay unconfirmed; the author's errata list does not record them. Errata entries for pp. 216, 219, 225, 232, 238, 275, 311-313, 317, 334 and 336-338 were added to the affected nodes, and two proof or acceptance steps were fixed: the Lemma VIII.6.3 chain h_f = h o r o x (the drafted 'h_f = h_x o r' repeated a misprint), and the base-point example for Theorem VIII.5.6. Verified (20) or corrected (10) against the sources: all Poonen nodes (RP.1 torsors and Selmer sets, RP.2, RP.3, RP.6 function-field and Jacobian nodes), the two Faltings RP.4 nodes, and all seven RP.5 nodes. Corrections: Poonen's Example 6.5.12 twist is an abbreviation for Z x^G T^{-1}, not a different construction. Theorem 6.5.13 has further imports. The day-and-night step misattributed an assertion to the source. Exercise 8.7 is posed only over number fields. The Section 8.3 example has unproved birationality and torsion claims. Faltings Satz 7 assumes properness implicitly. SUZ Proposition 2.1 needs every subsequence to be Zariski dense. The SUZ file is typeset with a text layer, not a scan. Zhang's successive minima are printed with a degenerate indexing (dim Y = i). Zhang's proof prints 'By Lemma 3.1' for Lemma 4.1, and several of its steps are unargued. Ullmo's proof also imports Zhang 1993 Corollaire 5-7, Zhang JAMS 1995 Theorem 5-2 and Milne Lemma 5-2. The frontier register gains Poonen Conjecture 9.2.27 (read). Links: 107 drafted. 46 were verified unchanged at the cited place and 48 were kept but are unverifiable (their locators are in Silverman). 10 were annotated: SF.2 -> torsor evaluation, SF.2 -> Brauer-Manin pairing, SF.2 -> PGL (partial or requested supply), torsor evaluation -> descent sets, torsor evaluation -> Section 8.3 example, X.4 -> Section 8.3 example, Korollar 1 -> Satz 7 (implicit use), DT.2 -> S-unit node (owner of record, not an input), SUZ -> Zhang Theorem 2.1 (method reuse), and Lemma 4.1 -> Bogomolov (printed slip). 2 were re-targeted: the elliptic canonical-height node -> Zhang and -> Ullmo became RP.0 stage -> those nodes, because the node does not supply Neron-Tate heights on abelian varieties. 1 was removed: Parshin -> function-field analogue, which is a contrast only; the function-field theorem is proved by citation, not from Mordell. 1 was added: A6 -> Zhang Corollaries, since Corollary 2 uses Res_{K/Q}. Result: 107 links. Every supplier stage description (LI.4, SF.2, SF.3, A3, A6, R09.3, DT.2, R28.1/R28.5 nodes, R35.1) was read before a link was kept. All endpoints exist. The implied stage edges are acyclic with the atlas and all are transitively implied. An in-memory merge_decompositions dry run with the Faltings packet passes. Gaps 11 -> 12: the Silverman-unverifiable gap is new, and six existing gaps were extended. Coverage: 7 records, all partial, with specific remaining work added. Status needs_changes: 29 nodes, and the usage sites of 48 links, remain unverifiable until a maintainer re-checks them against the library copy of Silverman. Packet status stays partial; implementationStatus stays unchecked.",
  "checked": [
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.0/absolute-height-on-projective-space-and-its-invariance",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified. The claimed misprint in Proposition VIII.5.4(c) (printed exponent 1/[K:Q], proof gives [L:K]) cannot be checked; the author's errata list (2nd printing) does not record it, so it is either absent from or already corrected in that printing. Mathematically, H_L = H_K^{[L:K]} is the correct statement. Section page p. 224 confirmed from the public table of contents."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.0/height-comparison-under-a-morphism-of-projective-spaces",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified. Reviewer correction to the acceptance example (the failure of the lower bound for [X_0^2, X_0 X_1] is at points of large height, not near the base point); this is a mathematical fix, not a source check."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.0/heights-of-roots-versus-coefficients-of-a-polynomial",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified. The public errata entry for p. 232 was read and added; the node's lower-bound step matches the corrected display. The acceptance example on T^2 - 2 was checked arithmetically (1/2 <= 2 <= 4)."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.0/northcott-finiteness-of-points-of-bounded-height-and-degree",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified. The errata entry for p. 225 was read: the printed bound in Example VIII.5.1 is (2C+1)^N and the node silently used the corrected (2C+1)^{N+1}; the hypothesis now says so and cites the errata."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.0/heights-on-an-elliptic-curve-attached-to-functions",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified. Section VIII.6 starts on p. 234 (public table of contents)."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.0/quasi-parallelogram-law-for-heights-from-even-functions",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified. Proof step for Lemma 6.3 corrected from the author's errata (p. 238): the drafted 'h_f = h_x o r' is not meaningful; the chain is h o r o x. The polynomial identity (12X^2 + 16A)phi - (3X^3 - 5AX - 27B)psi = 4(4A^3 + 27B^2) was checked by the reviewer at 200 random rational points (a mathematical check, not a source check)."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.0/height-growth-under-translation-and-multiplication-by-m",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified. The induction (-(m-1)^2 + 2m^2 + 2 = (m+1)^2) was checked arithmetically."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.0/neron-tate-canonical-height-as-a-tate-limit",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified. Section VIII.9 starts on p. 247 (public table of contents)."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.0/properties-of-the-canonical-height-parallelogram-law-and-torsion",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/weak-mordell-weil-descends-from-a-finite-galois-extension",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/kummer-pairing-and-the-kummer-sequence",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/kummer-extension-is-abelian-of-exponent-m-and-unramified-outside-S",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified. The errata entry for p. 216 (choice of an extension of v to Kbar) was added as a hypothesis. Acceptance check S = {2, 5, infinity} for y^2 = x(x-2)(x-10) is consistent with Delta = 2^14 5^2 (reviewer arithmetic)."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/maximal-abelian-exponent-m-extension-unramified-outside-S-is-finite",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/weak-mordell-weil-theorem-for-elliptic-curves",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/descent-theorem-for-abelian-groups-with-a-height-function",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified. Errata entries for p. 219 (4/m^6 for 4/m^8; implicit nonnegativity of C'_1 and C_2) added; the node's iteration step matches the corrected display."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/mordell-weil-theorem-for-elliptic-curves-over-number-fields",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/canonical-height-is-positive-definite-on-the-mordell-weil-lattice",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/torsor-evaluation-map-and-partition-of-rational-points-by-twists",
    "verdict": "corrected",
    "note": "Theorem 8.4.1, its proof and Example 6.5.12 checked on the page images of pp. 183 and 240; hypotheses (smooth affine G, fppf H^1, Proposition 5.12.14) match. The twist in the statement is now written with T^{-1}, and the convention note was reworded: Example 6.5.12's 'Z x^G T' is an abbreviation (T regarded as a left torsor), not a different construction."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/finiteness-of-torsor-classes-unramified-outside-S",
    "verdict": "corrected",
    "note": "Section 6.5.7 and the six-step proof of Theorem 6.5.13 (pp. 183-185) checked line by line, with Theorems 5.12.24, 5.12.29 and Warning 5.12.25 (pp. 157-159); statement, hypotheses and excerpts match. Added the further imports invoked in Steps 1 and 5 (Remark 6.5.2, Theorem 4.3.7(i), Proposition 3.5.35, Theorem 3.5.52)."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/selmer-set-of-a-torsor-over-a-proper-variety-is-finite",
    "verdict": "verified",
    "note": "Definition 8.4.4, Remark 8.4.5, Proposition 8.4.2 with proof, Theorem 8.4.6 with proof and Remark 8.4.7 (pp. 240-242) match the statement, hypotheses (Krasner, compactness, valuative criterion, Theorem 6.5.13(a)) and proof steps; both excerpts are literal."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/rational-points-lift-to-a-torsor-over-one-finite-extension",
    "verdict": "verified",
    "note": "Corollary 8.4.8 and its three-line proof (p. 242) match; X proper and k global are in force from Theorem 8.4.6. The remark on non-Galois covers is the drafter's, correctly labelled as not in the source."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/weak-mordell-weil-for-abelian-varieties-via-the-selmer-set",
    "verdict": "verified",
    "note": "Theorem 8.4.9 with proof (pp. 242-243), Proposition 5.7.4 with its sketch (p. 139) and Theorem 5.7.31 with its sketch citing [Ser97, 4.3] (p. 145) match; the unproved identification of the two maps A(k) -> H^1(k, A[m]) is correctly flagged; both excerpts literal."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/selmer-and-shafarevich-tate-groups-of-an-isogeny",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified. Errata entry for p. 334 (continuous homomorphisms) added. Section X.4 starts on p. 331 (public table of contents)."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/complete-2-descent-map-for-full-rational-2-torsion",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified. Errata entries for pp. 311-313 added as a hypothesis (meaning of the pairing identity; (x - e) o [2]). The point formula P = (b_1 z_1^2 + e_1, b_1 b_2 z_1 z_2 z_3) is mathematically forced by x - e_1 = b_1 z_1^2 (the errata's own restatement prints '- e_1', immaterial for e_1 = 0)."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/worked-complete-2-descent-for-y2-equals-x3-minus-12x2-plus-20x",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified. Reviewer arithmetic (not source evidence): Delta = 409600 = 2^14 5^2; the images of the 2-torsion points (5, -2), (2, -1), (10, 2) and of (1, -3), (20, 60), (18, -48), (10/9, -80/27) lie on the curve; eight Q-trivial pairs force E(Q)/2E(Q) = (Z/2Z)^3, so S^(2)(E/Q) contains (Z/2Z)^3 and the value (Z/2Z)^2 cannot be right. Whether the 2009 printing actually prints (Z/2Z)^2 in Example X.4.5.1 is unverified; the 2015 errata list does not mention it. Errata entry for p. 317 added."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/descent-via-two-isogeny-with-worked-example-y2-equals-x3-minus-6x2-plus-17x",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified. Errata entries for pp. 336-338 added. They confirm a^2 - 4b in the text of Example 4.8 but do not mention the claimed misprint a^2 - b in Proposition 4.9, which therefore stays unverified. Reviewer arithmetic: Delta = -2^9 17^2, E' : Y^2 = X^3 + 12X^2 - 32X, (z, w) = (1/2, 2) lies on C_2 and maps to (8, -32) on E', and a'^2 - 4b' = 272 = 16 * 17."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.1/selmer-upper-bounds-versus-the-rank-and-the-shafarevich-tate-obstruction",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.2/obstruction-set-attached-to-a-functor",
    "verdict": "verified",
    "note": "Sections 8.1.1-8.1.4 (pp. 227-229) checked: diagram (8.1.1), Definitions 8.1.2-8.1.3, Examples 8.1.4-8.1.5, Remark 8.1.6 with [Ces15, Theorems 2.13 and 2.18], Proposition 8.1.8 and Corollaries 8.1.9-8.1.10 left as Exercise 8.1 (p. 253). Statement, hypotheses and excerpt match."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.2/brauer-manin-pairing-on-adelic-points",
    "verdict": "verified",
    "note": "Proposition 8.2.1 with proof (Corollaries 6.6.11 and 6.9.3) and the definition of the pairing (p. 229) match literally."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.2/rational-points-are-orthogonal-to-the-brauer-group",
    "verdict": "verified",
    "note": "Proposition 8.2.2 with diagram (8.2.3), Definition 8.2.5, Corollary 8.2.6 and Definitions 8.2.7-8.2.8 with the pointer to Conjecture 9.2.27 (p. 230) match; the reviewer also read Conjecture 9.2.27 (p. 267: nice rationally connected varieties over number fields)."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.2/local-constancy-of-brauer-evaluation-and-closedness-of-the-brauer-set",
    "verdict": "verified",
    "note": "Proposition 8.2.9 with proof (Remark 6.9.2, Theorem 6.4.3, Proposition 3.5.73), Remark 8.2.10, Corollary 8.2.11(a)-(e) with proof and Remark 8.2.12 (pp. 230-232) match; both excerpts literal."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.2/iskovskikh-chatelet-surface-with-a-brauer-manin-obstruction",
    "verdict": "verified",
    "note": "Sections 8.2.5.2-8.2.5.3, Remark 8.2.13, Proposition 8.2.14 with proof, the evaluation recipe, Proposition 8.2.15 with its three cases, Remarks 8.2.16-8.2.17 (pp. 233-235) match, including the omitted Hensel computation for X(A) nonempty and the case split at 2."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.2/nonempty-brauer-set-without-rational-points-for-a-quadric-bundle",
    "verdict": "verified",
    "note": "Section 8.6.2 construction, Propositions 8.6.6-8.6.8 with proofs (pp. 249-251) match: 972B1, the quadric bundle Y(t), Y(T), the adelic point x, and the imports [Cre97], [Ser73, IV.2.2 Theorem 6], Proposition 6.9.15."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.2/day-and-night-semi-decision-procedure-for-rational-points",
    "verdict": "corrected",
    "note": "Section 8.2.6 (pp. 235-236) read. The drafted proof step said the source 'asserts' that a finite set of Azumaya algebras obstructs; the source only states termination and points to [Poo06, Remark 5.3]. The step now says so, with the compactness argument marked as the reviewer's."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.3/descent-sets-and-the-descent-obstruction",
    "verdict": "corrected",
    "note": "Section 8.4.7 with diagram (8.4.13), Definition 8.4.14 and the variants (pp. 244-245), and Exercise 8.7(a)-(h) (pp. 254-255) read. Added that Exercise 8.7 is posed only over number fields although Section 8.4.7 works over global fields. Excerpts literal."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.3/descent-example-for-y2-equals-(x2-plus-1)(x4-plus-1)",
    "verdict": "corrected",
    "note": "Section 8.3 with 8.3.1-8.3.2, Remarks 8.3.2-8.3.3 and Proposition 8.3.4 (pp. 236-239) checked; the six solutions and the reduction to c in {1, 2} match. Added the further unproved assertions (birational models, torsion subgroups, computability of the twist set)."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.3/minchev-failure-of-strong-approximation-from-finite-etale-covers",
    "verdict": "verified",
    "note": "Theorem 8.4.10 with proof, Corollary 8.4.11 with proof (Lemma 3.5.57) and Remark 8.4.12 (pp. 243-244) match; imports (Theorem 3.2.1, Proposition 3.5.74, Theorem 3.5.63(a), Theorem 7.7.1(ii)) as listed; excerpt literal."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.3/brauer-set-equals-the-pgl-descent-set",
    "verdict": "verified",
    "note": "Map (8.5.1) with Theorem 6.6.17(ii), Lemma 8.5.2 with its diagram and Remark 1.5.18, Proposition 8.5.3 with Corollary 6.6.19 (pp. 245-246) match; excerpt literal."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.3/etale-brauer-set-equals-the-descent-set",
    "verdict": "verified",
    "note": "Sections 8.5.2-8.5.3, the definitions of X(A)^{et,Br} and X(A)^{et,descent}, Theorem 8.5.4 and its sketch (pp. 246-247) match: [Sko09, Theorem 1.1] generalizing [Sto07, Proposition 5.17], Proposition 8.5.3 for the second inclusion, [Dem09] generalizing [Har02]."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.3/iterated-descent-gives-no-new-obstruction",
    "verdict": "verified",
    "note": "Section 8.5.4, Theorem 8.5.5 ([Cao17, Corollaire 1.2]) and Corollary 8.5.6 with its one-line proof (p. 248) match; excerpt literal."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.3/nonempty-etale-brauer-set-without-rational-points",
    "verdict": "verified",
    "note": "Theorem 8.6.1 outline, Definition 8.6.2, Remark 8.6.4, Theorem 8.6.5, Lemma 8.6.9 ([SGA 1, IX.6.8]) and Proposition 8.6.10 with proof (pp. 248-252) match. The source's own phrase for U is 'algebraically simply connected'."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.4/uniform-field-of-definition-for-fibres-of-an-unramified-covering",
    "verdict": "corrected",
    "note": "Lemma 4 (p. 357) and the Satz 7 sentence using it (p. 365) re-read on page images of the public GDZ scan; both German excerpts are literal (K_1 ⊇ K printed). Poonen Corollary 8.4.8 (p. 242) literal. Added that properness of X is implicit in Faltings ('glatte Kurve'). The intermediate unramifiedness argument is correctly marked as not written in the source."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.4/parshin-construction-reducing-mordell-to-shafarevich-finiteness",
    "verdict": "verified",
    "note": "Satz 7 and its proof (p. 365, GDZ page images) match: degree m > 2 (confirmed at 300 dpi), g ≧ 2, D = phi^{-1}(x) - {y}, generalized Jacobian of (X_1, D), [2] on A, bad places (a)-(c), and the final sentence on Y(x) -> X_1 -> X. Faltings does not name Korollar 1 in the proof; its use is implicit in 'es gibt somit nur endlich viele Moeglichkeiten fuer Y(x)', as the node's hypotheses say. [9] = Parshin, Algebraic curves over function fields I (1968), p. 366. Poonen Theorem 9.5.1 and Remark 9.5.2 (p. 286) literal."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.4/roth-theorem-in-distance-function-form-on-curves",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified. Errata entries for p. 275 (proof of Proposition IX.2.3) added; the node's proof step is consistent with the corrected display. Sections IX.1 and IX.2 start on pp. 270 and 273 (public table of contents)."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.4/siegel-theorem-for-elliptic-curves",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified. Reviewer arithmetic check of the final bound: log H_K = [K:Q] h and h_f(P_i) >= (m^2/2) h_f(P'_i) - O(1) give L >= -4[K:Q]/m^2, as stated."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.4/siegel-finiteness-for-genus-one-curves-and-arbitrary-functions",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.4/finiteness-of-the-s-unit-equation-via-roth",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.4/siegel-integral-points-on-hyperelliptic-curves-via-the-s-unit-equation",
    "verdict": "unverifiable",
    "note": "Rests only on Silverman AEC, which the reviewer could not re-read (library copy unavailable, no authorized public copy): statement, hypotheses, proof steps, locators and excerpts are unverified. Reviewer arithmetic check of the final bound: log H_K = [K:Q] h and h_f(P_i) >= (m^2/2) h_f(P'_i) - O(1) give L >= -4[K:Q]/m^2, as stated."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.5/torsion-subvarieties-and-strict-generic-small-sequences",
    "verdict": "verified",
    "note": "Section 1 definitions (p. 159) and Lemma 4.1 with proof (pp. 163-164) read on page images; excerpts literal. The source defines 'generic' as 'no subsequence is included in a proper subvariety'; the node's 'no infinite subsequence' is the intended reading. The node's proof of Lemma 4.1 chooses increasing indices, a harmless tightening of Zhang's choice of the first element of each complement."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.5/stabilizer-reduction-and-generic-injectivity-of-the-difference-map",
    "verdict": "verified",
    "note": "Section 3, Lemma 3.1 with proof (p. 163) and the first paragraph of the proof of the generalized Bogomolov conjecture (p. 164) match on page images: G(x_1, ..., x_m), the fibre description, noetherian descent to G(x_1, ..., x_{m_0}) = 0, and the asserted equivalence for X' = X/G in A' = A/G with A isogenous to A' x A''. Excerpts literal."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.5/arithmetic-equidistribution-of-generic-small-sequences",
    "verdict": "corrected",
    "note": "Theoremes 1.1-1.2, Corollaires 1.3-1.4, Proposition 2.1, Theoreme 3.1 with proof and Section 4 with Proposition 4.1 and proof (pp. 338-347) re-read from the text layer; all three excerpts literal. Corrected the paraphrase of Proposition 2.1 (it needs every subsequence Zariski dense, not just a Zariski-dense sequence) and added the good-reduction imports of Section 4 ([17] Theorem 5-2 with density of torsion points; [10] Proposition 3-6). The source entry's description of the file as a scan without text layer was also corrected."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.5/equidistribution-of-generic-small-points-on-subvarieties-via-successive-minima",
    "verdict": "corrected",
    "note": "Section 2 (pp. 161-163) re-read on page images: hypotheses of Theorem 2.1, the measure, Stone-Weierstrass, the perturbed metric, the asymptotic expansions and the liminf/limsup argument match; excerpt literal. Correction: the printed definition of the successive minima (dim Y = i, i = 1..d) is degenerate for i = d; the node now records this and that the correct indexing must come from Zhang 1995 (unread)."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.5/bogomolov-conjecture-for-subvarieties-of-abelian-varieties",
    "verdict": "corrected",
    "note": "Corollary 3 (p. 160) and the proof in Section 4 (pp. 164-165) re-read on page images; excerpts literal; the 'Corollary 1.2' slip confirmed. Added a second slip ('By Lemma 3.1' for Lemma 4.1, p. 164) and the further asserted steps of the proof (Zariski density of x(n), smallness of x(n_i) and alpha_m(x(n_i)), smoothness of alpha_m along the subsequence, the embedding hypothesis of Theorem 2.1, nonvanishing of dx at smooth points)."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.5/equidistribution-of-strict-small-sequences-and-torsion-corollaries",
    "verdict": "verified",
    "note": "Theorem 1.1 and Corollaries 1, 2 and 4 (pp. 159-161) and the proof of Theorem 1.1 (p. 165) re-read on page images; statements, the absence of proofs for Corollaries 1, 2 and 4, and both excerpts match."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.5/ullmo-discreteness-of-small-points-on-curves-in-their-jacobians",
    "verdict": "corrected",
    "note": "Whole preprint re-read (text layer): Theoremes 1.1-1.2, Section 2 (Lemmes 2.1-2.2 from Zhang [15] Theorem 2-4 and proof of Theorem 5-6; Theoremes 2.3-2.4 with the proof of 2.4), Proposition 3.1 with Lemme 3.2, Lemmes 4.1-4.4 and the final contradiction match; both excerpts literal. Added the imports the node omitted: Zhang [15] Corollaire 5-7, Zhang [16] (JAMS 1995) Theoreme 5-2 in the proof of Theoreme 2.4, and Milne [9] Lemma 5-2 and Chapter 5."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.6/conjectural-frontier-register-for-rational-points",
    "verdict": "unverifiable",
    "note": "Items (1)-(5) verified against Poonen: Conjectures 9.5.11-9.5.12 and the [Fal91] remark (p. 288), Conjectures 5.7.32-5.7.33 with their known cases (pp. 145-146), Definition 8.2.8, Theorems 8.6.1, 8.6.5 and 8.6.12 and Remarks 8.6.13-8.6.14 (pp. 248-253); excerpts literal. Item (7), Poonen Conjecture 9.2.27 (p. 267), was read and added by the reviewer. Item (6) and the Silverman Conjecture X.4.13 citation rest only on Silverman AEC and are unverifiable (the errata entry for p. 253 confirms only that Conjecture VIII.9.9 is followed by a sentence about 'the constant C')."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.6/function-field-analogue-of-mordell-and-isotriviality",
    "verdict": "verified",
    "note": "Section 9.5.2 (pp. 287-288): Examples 9.5.3-9.5.5, Definitions 9.5.6-9.5.8, Example 9.5.9 and Theorem 9.5.10 with its proof by citation ([Gra65], [Man63], [Col90], [Sam66, Theoreme 4], [Vol91, Theorem 3], Theorem 2.5.1) match; excerpt literal."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.6/jacobian-points-and-the-degree-one-divisor-hypothesis",
    "verdict": "verified",
    "note": "Theorem 5.7.6, Remark 5.7.7 with (5.7.8), Remark 5.7.9, Warning 5.7.10, Remarks 5.7.11-5.7.12 (pp. 139-140) match; proof is 'See [Mil86b]'; excerpt literal."
   },
   {
    "nodeId": "HeightsRationalPointsAndObstructions:RP.6/worked-examples-by-dimension-and-genus-with-proved-conclusions",
    "verdict": "unverifiable",
    "note": "The genus-2 and surface entries were verified against Poonen (Section 8.3, Proposition 8.2.15, Theorem 8.6.5). The two genus-1 entries rest only on Silverman AEC and are unverifiable (reviewer arithmetic for both curves is recorded under the RP.1 nodes). Added the pointer to Poonen Exercise 4.5 for genus 0."
   }
  ]
 },
 "nodes": {
  "changed": {
   "HeightsRationalPointsAndObstructions:RP.0/height-comparison-under-a-morphism-of-projective-spaces": {
    "acceptance": [
     "Check that the lower bound fails for a rational map with a base point, e.g. [X_0^2, X_0 X_1] on P^1: away from the base point [0, 1] it agrees with the identity, so H(F(P)) = H(P) and C_1 H(P)^2 <= H(P) fails for points of large height (reviewer correction: the drafted wording 'at points approaching the base point' does not describe how a height inequality fails).",
     "Check that the constants are independent of P but not claimed to be effective in terms of F (Remark 5.7)."
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.0/heights-of-roots-versus-coefficients-of-a-polynomial": {
    "sources": [
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "VIII.5, Theorem 5.9 with proof, pp. 230-232",
      "excerpt": "We are going to prove that eps(v)^{-d} prod_{j=1}^{d} max{|alpha_j|_v, 1} <= max_{0<=i<=d} |a_i|_v <= eps(v)^{d-1} prod_{j=1}^{d} max{|alpha_j|_v, 1}.",
      "match": "Literal local inequality from the proof, whose product over places gives the stated theorem; formulas transliterated."
     },
     {
      "sourceId": "silverman-aec-errata-2022",
      "locator": "Errata list, entry 'Page 232, 2nd Displayed Equation', p. 24",
      "excerpt": "Missing \"max\" before the last set.",
      "match": "Corrects the displayed lower-bound step of the proof of Theorem VIII.5.9; the node's proof step is the corrected form."
     }
    ],
    "hypotheses": [
     "The inequality is unchanged by scaling f, so one may assume f monic",
     "The proof uses eps(v) = 2 for archimedean v and 1 for nonarchimedean v, a different notation from the proof of Theorem 5.6",
     "Author's errata (p. 232, second displayed equation): the printed display omits a 'max'; it should read max_i |a_i|_v = max_i |b_i - alpha_k b_{i-1}|_v >= eps(v)^{-1} max_{i <= d-1} |b_i|_v max{|alpha_k|_v, 1}, which is the form used in the proof steps"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.0/northcott-finiteness-of-points-of-bounded-height-and-degree": {
    "sources": [
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "VIII.5, Theorem 5.11 with proof and Remark 5.12, pp. 233-234",
      "excerpt": "Let C and d be constants. Then the set {P in P^N(Qbar) : H(P) <= C and [Q(P) : Q] <= d} is a finite set of points, where we recall from (I §2) that Q(P) is the minimal field of definition of P.",
      "match": "Literal statement; proof summarized from the printed argument."
     },
     {
      "sourceId": "silverman-aec-errata-2022",
      "locator": "Errata list, entry 'Page 225, Example VIII.5.1', p. 24",
      "excerpt": "The bound should be (2C + 1)^{N+1}, not (2C + 1)^N.",
      "match": "Supports the corrected count used in the base case of Northcott's theorem."
     }
    ],
    "hypotheses": [
     "Q(P) is the minimal field of definition of P (Silverman I.2)",
     "The base case K = Q, N arbitrary, is the count of at most (2C + 1)^{N+1} integer coordinate vectors (Example 5.1 and Remark 5.5). The printed Example VIII.5.1 gives (2C + 1)^N; the author's errata for p. 225 corrects it to (2C + 1)^{N+1}, the value used here",
     "Remark 5.12: an explicit bound on the number of points is easy to extract; Schanuel's asymptotic formula is cited, not proved"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.0/quasi-parallelogram-law-for-heights-from-even-functions": {
    "sources": [
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "VIII.6, Theorem 6.2 with proof, pp. 235-237 (page image of p. 237)",
      "excerpt": "Let E/K be an elliptic curve, and let f in K(E) be an even function, i.e., a function satisfying f o [-1] = f. Then for all P, Q in E(Kbar) we have h_f(P + Q) + h_f(P - Q) = 2h_f(P) + 2h_f(Q) + O(1).",
      "match": "Literal statement; the key identity and the degree-2 morphism are as read on the page image of p. 237."
     },
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "VIII.6, Lemma 6.3 with proof, p. 238",
      "excerpt": "Let f, g in K(E) be even functions. Then (deg g)h_f = (deg f)h_g + O(1).",
      "match": "Literal statement."
     },
     {
      "sourceId": "silverman-aec-errata-2022",
      "locator": "Errata list, entry 'Page 238, 3rd displayed equation', p. 24",
      "excerpt": "The middle steps of this derivation are not correctly stated.",
      "match": "The corrected chain h_f = h o r o x = ((deg r)h + O(1)) o x = (deg r)h_x + O(1) replaces the printed one in the proof of Lemma VIII.6.3."
     }
    ],
    "proofSteps": [
     "First take f = x. The cases P = O or Q = O are clear; otherwise write x(P) = x_1, x(Q) = x_2, x(P + Q) = x_3, x(P - Q) = x_4.",
     "The addition formula gives x_3 + x_4 and x_3 x_4 as rational functions of x_1 + x_2 and x_1 x_2; define g([t, u, v]) = [u^2 - 4tv, 2u(At + v) + 4Bt^2, (v - At)^2 - 4Btu].",
     "Let sigma : E x E -> P^2 send (P, Q) to [1, x(P) + x(Q), x(P)x(Q)] (via P^1 x P^1); then sigma o G = g o sigma for G(P, Q) = (P + Q, P - Q).",
     "g is a morphism: a common zero with t = 0 forces u = v = 0; with t != 0 it gives a common root of psi(x) = 4x^3 + 4Ax + 4B and phi(x) = x^4 - 2Ax^2 - 8Bx + A^2, impossible since (12X^2 + 16A) phi - (3X^3 - 5AX - 27B) psi = 4(4A^3 + 27B^2) != 0.",
     "Theorem 5.6 for the degree-2 morphism g gives h(sigma(P + Q, P - Q)) = 2h(sigma(P, Q)) + O(1).",
     "Theorem 5.9 applied to (T + alpha_1)(T + alpha_2) gives h(alpha_1) + h(alpha_2) - log 4 <= h([1, alpha_1 + alpha_2, alpha_1 alpha_2]) <= h(alpha_1) + h(alpha_2) + log 2, i.e. h(sigma(R_1, R_2)) = h_x(R_1) + h_x(R_2) + O(1).",
     "Lemma 6.3: an even f factors as f = r o x with r in K(X), so h_f = h o f = h o r o x = ((deg r) h + O(1)) o x = (deg r) h_x + O(1) by Theorem 5.6 applied to r : P^1 -> P^1, and deg f = 2 deg r; compare two even functions through h_x. (The printed middle steps of this display are wrong; the chain above is the author's errata correction for p. 238. The drafted 'h_f = h_x o r' repeated the misprint.)",
     "Multiply the result for h_x by (1/2) deg f to obtain the theorem for arbitrary even f."
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.1/kummer-extension-is-abelian-of-exponent-m-and-unramified-outside-S": {
    "sources": [
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "VIII.1, Remark 1.3, Proposition 1.4, Proposition 1.5 with proof, pp. 211-212 (page image of p. 212)",
      "excerpt": "The extension L/K is abelian and has exponent m, i.e., the Galois group G_{L/K} is abelian and every element of G_{L/K} has order dividing m.",
      "match": "Literal statement of 1.5(a); 1.5(b) with the set S was read on the page image."
     },
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "VIII.2, definition of unramified classes and Proposition 2.1 with proof, pp. 216-217",
      "excerpt": "Then the image of E(K) in H^1(G_{Kbar/K}, E[m]) under the connecting homomorphism delta consists of cohomology classes that are unramified at every v in M_K with v not in S.",
      "match": "Literal statement."
     },
     {
      "sourceId": "silverman-aec-errata-2022",
      "locator": "Errata list, entries 'Page 216, Definition before Proposition VIII.2.1' and 'Page 262, Exercise 8.5', p. 24",
      "excerpt": "Here v is a place of K, not of Kbar, and in order to talk about the inertia group of v, one must pick an extension of the valuation v to Kbar",
      "match": "Records the choice of extension needed to make 'unramified at v' well defined in the cohomological statement (Proposition VIII.2.1)."
     }
    ],
    "hypotheses": [
     "Page image p. 212: the set S uses \"v(m) != 0\"; the text layer drops the relation",
     "Imported: Proposition 1.4 = Proposition VII.3.1(b), injectivity of E(K)[m] -> reduced curve for v with v(m) = 0 and good reduction; the proof applies it over K' = K(Q) at a place v' above v, which the printed proof uses without comment",
     "Remark 1.3: a Weierstrass equation has v(a_i) >= 0 and v(Delta) = 0 for all but finitely many v, so S is finite",
     "Proposition 2.1 notes that the proof of 1.5(b) did not use E[m] contained in E(K)",
     "Author's errata (p. 216, definition before Proposition VIII.2.1): 'unramified at v' requires choosing an extension w of v to Kbar, since the inertia group depends on it; a class restricted to I_{w_1} is a coboundary if and only if its restriction to I_{w_2} is (see also Exercise 8.5 and its errata entry, p. 262)"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.1/descent-theorem-for-abelian-groups-with-a-height-function": {
    "sources": [
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "VIII.3, Theorem 3.1 with proof and Remark 3.2, pp. 218-220 (page image of p. 218)",
      "excerpt": "Suppose further that for the integer m in (ii), the quotient group A/mA is finite. Then A is finitely generated.",
      "match": "Literal conclusion of the theorem; hypotheses (i)-(iii) were read on the page image of p. 218."
     },
     {
      "sourceId": "silverman-aec-errata-2022",
      "locator": "Errata list, entries 'Page 219, Values of C'_1 and C_s' and 'Page 219, Fourth displayed equation', p. 23",
      "excerpt": "The 4/m^8 should be 4/m^6.",
      "match": "Corrects the geometric-series bound in the proof of Theorem VIII.3.1; the node's proof step uses the corrected sum bounded by (C_1 + C_2)/(m^2 - 2)."
     }
    ],
    "hypotheses": [
     "C_1 is the maximum of the constants in (i) for Q in {-Q_1, ..., -Q_r}",
     "Remark 3.2: effectivity needs computable C_1 for the coset representatives, computable C_2, enumeration of the bounded-height sets, and generators of A/mA; for elliptic curves the last is the unsolved step",
     "Author's errata (p. 219): the fourth displayed equation of the proof prints 4/m^8; it should be 4/m^6, i.e. h(P_n) <= (2/m^2)^n h(P) + (1/m^2 + 2/m^4 + 4/m^6 + ... + 2^{n-1}/m^{2n})(C'_1 + C_2); the proof also assumes C'_1, C_2 >= 0, which holds automatically (take P = O and use h(O) = 0)"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.1/torsor-evaluation-map-and-partition-of-rational-points-by-twists": {
    "statement": "Let k be a field, X a k-variety, G a smooth affine algebraic group over k, f : Z -> X a G-torsor with class zeta in H^1(X, G) (fppf), and for x in X(k) let zeta(x) in H^1(k, G) be the class of the fibre Z_x. For tau in H^1(k, G) let f^tau : Z^tau -> X be the twisted torsor Z^tau = Z x^G T^{-1} of Example 6.5.12 (T a right G-torsor representing tau, used through the left G-torsor T^{-1}; Poonen's Example 6.5.12 abbreviates this as Z x^G T), a torsor under the inner twist G^tau. Then {x in X(k) : zeta(x) = tau} = f^tau(Z^tau(k)); in particular X(k) is the disjoint union over tau in H^1(k, G) of f^tau(Z^tau(k)).",
    "hypotheses": [
     "G-torsor means a right fppf G_X-torsor over X; H^1(X, G) is the Cech fppf pointed set, in bijection with isomorphism classes of torsors (Poonen Theorem 6.5.10(i), not read)",
     "Imported: Proposition 5.12.14 (a torsor is trivial if and only if it has a rational point) and the construction of twists (Example 6.5.12, read)",
     "Convention check (page images pp. 183 and 240): Example 6.5.12 writes Z^tau := Z x^{G_S}_S T_S = Z x^G_k T with T a right G-torsor, while the subtraction of torsors in 6.5.6.4 and the proof of Theorem 8.4.1 write Z x^G T^{-1}. The contracted product of 6.5.6.3 needs a left G-torsor, and T^{-1} is T viewed as a G-G^tau-bitorsor (6.5.6.2), so both describe the same scheme; the T^{-1} form is the notationally consistent one (reviewer: this is an abbreviation in Example 6.5.12, not a mathematical error)"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.1/finiteness-of-torsor-classes-unramified-outside-S": {
    "hypotheses": [
     "tau is unramified at v if tau_v comes from H^1(O_v, G); the equivalence with coming from H^1(O_{k,v}, G) is cited to BLR 6.2 Proposition D.4(b)",
     "Imported (stated with citations, proofs not read): Lang's theorem H^1(finite field, connected group) = 0 (Theorem 5.12.19(a)); Hensel's lemma (Theorem 3.5.63(a)); Borel-Serre finiteness of the fibres of H^1(k, G) -> prod_{v not in S} H^1(k_v, G) for affine G (Theorem 5.12.29); a variant of Hermite's theorem on extensions of bounded degree and discriminant ([Ser97, 4.1]); finiteness of H^1(k_v, F) for local fields of characteristic 0 (Borel-Serre, Theorem 5.12.24(a))",
     "Part (b) needs characteristic 0: over local fields of characteristic p, H^1(k_v, Z/pZ) is infinite (Warning 5.12.25)",
     "Also used in Steps 1 and 5 without being restated here: Remark 6.5.2 (torsors under finite or smooth groups are finite, resp. smooth), Theorem 4.3.7(i) (the torsor is finite etale), Proposition 3.5.35 (finite etale k-schemes are disjoint unions of Spec L) and Theorem 3.5.52 (finite etale O_v-schemes); none read"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.1/selmer-and-shafarevich-tate-groups-of-an-isogeny": {
    "sources": [
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "X.4, definitions of S^(phi)(E/K) and Sha(E/K), Remarks 4.1.1-4.1.2, Theorem 4.2 with proof, Lemma 4.3 with proof, Corollary 4.4, Remark 4.5, pp. 331-334",
      "excerpt": "Let phi : E/K -> E'/K be an isogeny of elliptic curves defined over K. (a) There is an exact sequence 0 -> E'(K)/phi(E(K)) -> S^(phi)(E/K) -> Sha(E/K)[phi] -> 0. (b) The Selmer group S^(phi)(E/K) is finite.",
      "match": "Literal statement of Theorem 4.2 with transliterated notation."
     },
     {
      "sourceId": "silverman-aec-errata-2022",
      "locator": "Errata list, entry 'Page 334, Proof of Lemma 10.4.3', p. 29",
      "excerpt": "the text should note that we are only taking continuous homomorphisms.",
      "match": "Adds the continuity condition to the finiteness argument of Lemma X.4.3."
     }
    ],
    "hypotheses": [
     "WC(E/K) is identified with H^1(G_{Kbar/K}, E) by (X.3.6), which was not read",
     "Remark 4.1.1: the definitions do not depend on the chosen extensions of v to Kbar",
     "Remark 4.5: the Selmer group is effectively computable, because H^1(G, E[phi]; S) is and local solubility of each homogeneous space reduces to a finite computation by Hensel's lemma; this is argued in prose, not as a theorem",
     "Isogenous curves have the same bad primes (VII.7.2, not read)",
     "Author's errata (p. 334, proof of Lemma X.4.3): the homomorphisms in Hom(G, M; S) are continuous homomorphisms (Hom_cont of Remark B.2.2)"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.1/complete-2-descent-map-for-full-rational-2-torsion": {
    "sources": [
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "X.1, Theorem 1.1 with proof, Remarks 1.2-1.3 and the m = 2 computation, pp. 310-314",
      "excerpt": "What we have done is reduce the problem of calculating E(K)/mE(K) to the problem of the existence or non-existence of a single rational point on each of an explicitly given finite set of curves.",
      "match": "Literal quotation from Remark 1.2 describing the output of Theorem 1.1."
     },
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "X.1, Proposition 1.4 (Complete 2-Descent), p. 315",
      "excerpt": "Then there is an injective homomorphism E(K)/2E(K) -> K(S, 2) x K(S, 2)",
      "match": "Literal fragment of Proposition 1.4; the full criterion with the two quadratic equations is as stated in the node."
     },
     {
      "sourceId": "silverman-aec-errata-2022",
      "locator": "Errata list, entries 'Page 311, Theorem X.1.1(a)', 'Page 312, Proof of Theorem X.1.1(a)', 'Page 313, Proof of Theorem X.1.1(c)' and 'Page 313, Last Displayed Formula', pp. 26-27",
      "excerpt": "So it would be more accurate to say that e_m(delta_E(P)(sigma), T) = delta_K(b(P, T))(sigma) for all sigma",
      "match": "Clarifies the meaning of the defining identity of the pairing b and fixes the m = 2 duplication display."
     }
    ],
    "hypotheses": [
     "Imported: the Weil pairing e_m and its bilinearity and nondegeneracy (III.8.1, not read); E[m] contained in E(K) implies mu_m contained in K",
     "Hilbert 90 for mu_m (B.2.5c) gives delta_K : K^*/(K^*)^m -> Hom(G_{Kbar/K}, mu_m)",
     "The m = 2 functions are f_T = x - e, which requires the explicit duplication formula for x o [2] (checked \"by a calculation\" in the source)",
     "b(T, T) is computed by linearity: b(T_1, T_1) = (e_1 - e_3)/(e_1 - e_2) and b(T_2, T_2) = (e_2 - e_3)/(e_2 - e_1)",
     "Author's errata (pp. 311-313): the identity e_m(delta_E(P), T) = delta_K(b(P, T)) of Theorem X.1.1(a) means e_m(delta_E(P)(sigma), T) = delta_K(b(P, T))(sigma) for all sigma in G_{Kbar/K}; the errata also expands the proofs of (a) (b is the composite of the Kummer map, the Weil pairing and delta_K^{-1}) and of (c) (K(b(P, T)^{1/m}) is contained in L), and corrects the last display on p. 313 to (x - e) o [2]"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.1/worked-complete-2-descent-for-y2-equals-x3-minus-12x2-plus-20x": {
    "sources": [
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "X.1, Example 1.5 with notes 1-9, Table 10.1 and the Conclusion, pp. 315-317 (page image of p. 317)",
      "excerpt": "Conclusion. E(Q) = Z x Z/2Z x Z/2Z.",
      "match": "Literal conclusion as read on the page image; the table entries and notes were read on the same image."
     },
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "X.4, Example 4.5.1, pp. 334-335 (page image of p. 335)",
      "excerpt": "For example, the conclusion of (X.1.5) may be summarized by stating that the curve E : y^2 = x^3 - 12x^2 + 20x satisfies S^(2)(E/Q) = (Z/2Z)^2 and Sha(E/Q)[2] = 0.",
      "match": "Literal quotation of the printed (misprinted) Selmer group; the node states the corrected value (Z/2Z)^3, forced by the Conclusion of Example 1.5."
     },
     {
      "sourceId": "silverman-aec-errata-2022",
      "locator": "Errata list, entry 'Page 317, Line 4', p. 27",
      "excerpt": "In fact, either one is possible, depending on which point (z_1, z_2, z_3) one finds in the homogeneous space.",
      "match": "Confirms the printed point (10/9, -80/27) and the sign ambiguity."
     }
    ],
    "hypotheses": [
     "Correction: Example X.4.5.1 (p. 335, page image) prints S^(2)(E/Q) = (Z/2Z)^2 for this curve. Table 10.1 (p. 317, page image) has eight Q-trivial pairs, and E(Q) = Z x Z/2Z x Z/2Z gives E(Q)/2E(Q) = (Z/2Z)^3, which injects into S^(2)(E/Q). So (Z/2Z)^2 cannot be right, and with Sha[2] = 0 the value is (Z/2Z)^3",
     "The text layer of note 6 reads \"b_1 = 0 (mod 5)\"; the page image prints b_1 not congruent to 0 and b_2 congruent to 0 (mod 5)",
     "The step from E(Q)/2E(Q) = (Z/2Z)^3 and E_tors(Q) = E[2] to E(Q) = Z x (Z/2Z)^2 uses the Mordell-Weil theorem",
     "Torsion injects into the reduction mod 3 by VII.3.5 (not read)",
     "Author's errata (p. 317, line 4): the third point may be (10/9, 80/27) or (10/9, -80/27), depending on the solution of the homogeneous space chosen; for (b_1, b_2) = (10, -2) the solution (z_1, z_2, z_3) = (1/2, 2/3, 2/3) gives (10/9, -80/27), as printed"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.1/descent-via-two-isogeny-with-worked-example-y2-equals-x3-minus-6x2-plus-17x": {
    "sources": [
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "X.4, Example 4.8 and Proposition 4.9 (Descent via Two-Isogeny), pp. 336-337 (page image of p. 337)",
      "excerpt": "Then there is an exact sequence 0 -> E'(K)/phi(E(K)) -> K(S, 2) -> WC(E/K)[phi]",
      "match": "Literal fragment; the printed E' equation with (a^2 - b) is recorded as a misprint in the hypotheses."
     },
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "X.4, Remarks 4.9.1-4.9.2 and Example 4.10, pp. 338-339",
      "excerpt": "We use (X.4.9) to compute E(Q)/2E(Q) for the elliptic curve E : y^2 = x^3 - 6x^2 + 17x.",
      "match": "Literal opening of Example 4.10; the local computations and the conclusion E(Q) = E'(Q) = Z x Z/2Z are as printed."
     },
     {
      "sourceId": "silverman-aec-errata-2022",
      "locator": "Errata list, entries 'Page 336, Last paragraph', 'Page 337, 1st displayed equation' and 'Page 338, 2nd Displayed Equation', pp. 29-30",
      "excerpt": "This is the equation for E', not E, so it should read E' : Y^2 = X^3 + 12X^2 - 32X,",
      "match": "Confirms a^2 - 4b in the Example 4.8 text, the order phi o theta of the map C_d -> E', and the label of the displayed curve in Example 4.10."
     }
    ],
    "hypotheses": [
     "Correction: Proposition X.4.9 (p. 337, page image) prints E' : Y^2 = X^3 - 2aX^2 + (a^2 - b)X; Example 4.8 on the preceding page, the value delta(0, 0) = a^2 - 4b and the homogeneous space C_d all use a^2 - 4b, and Example 4.10 (a = -6, b = 17, E' : Y^2 = X^3 + 12X^2 - 32X) confirms a^2 - 4b",
     "The homogeneous space C_d and the map theta : C_d -> E are computed in X.3.7, which was not read",
     "The exact sequence (X.4.7) combining E'(K)/phi(E(K)) and E(K)/phi-hat(E'(K)) to get E(K)/2E(K) is elementary but its kernel/cokernel terms must be tracked",
     "The rank conclusion again uses the Mordell-Weil theorem and the torsion computation",
     "Author's errata (pp. 336-338): the text of Example X.4.8 (p. 336) gives E' : Y^2 = X^3 - 2aX^2 + (a^2 - 4b)X with phi(x, y) = (y^2/x^2, y(b - x^2)/x^2), obtained from Proposition III.4.12 and Example III.4.5; the first display on p. 337 should read phi o theta : C_d -> E', phi o theta(z, w) = (d/z^2, -dw/z^3) (printed theta o phi); and the second display on p. 338, Y^2 = X^3 + 12X^2 - 32X, is the equation of E', not of E (printed with the label E)"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.2/day-and-night-semi-decision-procedure-for-rational-points": {
    "proofSteps": [
     "If X(k) is nonempty, the day search finds a point.",
     "If X(k) is empty and the Brauer-Manin obstruction is the only one, then X(A)^Br is empty. The source does not say why a finite set of Azumaya algebras then already obstructs; it refers to [Poo06, Remark 5.3] for details. Reviewer's note (not in the source): for nice X, X(A) is compact and each X(A)^A is closed (Corollary 8.2.11(b)), so an empty intersection of the X(A)^A is already empty for finitely many A, and the night search over finite sets finds them."
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.3/descent-sets-and-the-descent-obstruction": {
    "hypotheses": [
     "An injection X(A) -> prod_v X(k_v) is used (\"one can show\")",
     "Affineness of G guarantees that classes in H^1 are represented by torsor schemes (Theorem 6.5.10(i), not read), which is what makes the twists Z^tau exist",
     "The descriptions via twists and the closedness are Exercise 8.7 (a)-(h); the source gives hints but no proofs",
     "Exercise 8.7, where the twist description and closedness are to be proved, is stated for k a number field (and X a k-variety, G smooth affine, f a G-torsor), while Section 8.4.7 states the claims for global fields; for global function fields no argument is indicated in the source"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.3/descent-example-for-y2-equals-(x2-plus-1)(x4-plus-1)": {
    "hypotheses": [
     "The ranks of 32A2 and 64A1 are taken from \"a 2-descent (or a glance at [Cre97, Table 1]!)\"; not computed in the source",
     "X is the nice genus-2 curve with two rational points at infinity; finiteness of X(Q) is Faltings' theorem, not used by the method",
     "Remark 8.3.2: the Jacobian of X is isogenous to E x E with rank 2 = g, so Chabauty's method does not apply directly; the Demyanenko-Manin method could",
     "Proposition 8.3.4 needs Z -> X etale between nice curves with k(Z)/k(X) Galois",
     "Also asserted without proof in the source: the birational equivalences Y_1 ~ 32A2 and Y_2 ~ 64A1 ('One can show'), the torsion subgroups Z/2Z x Z/2Z ('One also can compute'), and the effective computability of the finite set of locally soluble twists c"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.4/uniform-field-of-definition-for-fibres-of-an-unramified-covering": {
    "hypotheses": [
     "Faltings states only \"Lemma 4 liefert einen endlichen Oberkoerper K_1\"; the intermediate facts are not written. They are: phi and X_1, X have smooth models over O_{K,S} with phi etale, so for x in X(K) the fibre is a finite etale O_{K,S}-algebra; hence its residue fields have degree <= m over K and are unramified outside S; then Hermite-Minkowski applies and K_1 is their compositum",
     "Poonen's Corollary 8.4.8 proves the torsor case; a covering that is not Galois must first be replaced by its Galois closure, which neither source discusses",
     "Lemma 4 itself is proved in the source only as \"Bekannt (Hermite-Minkowski)\"",
     "Satz 7 says only 'glatte Kurve'; that X (and hence X_1) is proper, as used in the spreading-out and valuative-criterion steps, is implicit in the source (reviewer note)"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.4/roth-theorem-in-distance-function-form-on-curves": {
    "sources": [
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "IX.1, definition of approximation exponent, Theorem 1.4 and Remark 1.6, pp. 271-273",
      "excerpt": "Theorem 1.4. (Roth's Theorem) For every epsilon > 0, every number field K of degree d has approximation exponent tau(d) = 2 + epsilon.",
      "match": "Literal statement; its \"proof\" is a reference to IX.8 and to Hindry-Silverman Part D or Lang Chapter 7."
     },
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "IX.2, distance functions, Propositions 2.2-2.3 and Corollary 2.4 with proofs, pp. 273-276 (page images of pp. 275-276)",
      "excerpt": "Fix an absolute value v in M_K. Let C/K be a curve, let f in K(C) be a nonconstant function, and let Q in C(Kbar). Then liminf_{P in C(K), P -> Q} log d_v(P, Q) / log H_K(f(P)) >= -2.",
      "match": "Literal statement of Corollary 2.4 as read on the page image, formulas transliterated."
     },
     {
      "sourceId": "silverman-aec-errata-2022",
      "locator": "Errata list, entries 'Page 275, 1st displayed equation and following line' and 'Page 275, third displayed equation', pp. 24-25",
      "excerpt": "All three instances of P should be Q.",
      "match": "Corrects the order computation in the proof of Proposition IX.2.3 that the node's second proof step summarizes."
     }
    ],
    "hypotheses": [
     "Roth's theorem is not proved in the source: Section IX.8 sketches the proof and the general case is cited to Hindry-Silverman Part D and Lang, Fundamentals of Diophantine Geometry, Chapter 7",
     "Remark 1.6: Roth's theorem, and hence every finiteness result of IX.2-IX.3, is ineffective",
     "t_Q exists by Riemann-Roch (footnote on p. 273)",
     "If Q is not a v-adic accumulation point of C(K) the liminf is defined to be 0",
     "Author's errata (p. 275): in the proof of Proposition IX.2.3 the first display should read ord_Q (t_{phi(Q)} o phi) = e_phi(Q) ord_{phi(Q)} t_{phi(Q)} = e_phi(Q) e_2 (three instances of P should be Q), and the third display lacks an exponent 1/(e_1 e_2) on |f(P)|_v, which does not affect the limit"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.5/arithmetic-equidistribution-of-generic-small-sequences": {
    "hypotheses": [
     "Proposition 2.1 (for L with L_K ample and c_1(L_sigma) positive, and a sequence all of whose subsequences are Zariski dense in X: liminf h_L(x_n) >= c1hat(L)^d / (d c_1(L_K)^{d-1})) is \"a reformulation of the easy part of Theorem 5-2 of [17]\" (Zhang, Positive line bundles on arithmetic varieties, JAMS 1995), resting on the arithmetic Hilbert-Samuel theorem (Abbes-Bouche [1], Gillet-Soule [7]); none of these was read",
     "Imported: Gillet-Soule arithmetic Chow groups and intersection products; Zhang, Small points and adelic metrics (J. Algebraic Geom. 1995) Theorems 1-4 and 1-10 and 3-1 (adelic heights, h_L(A) = 0, h_L = h_NT); Breen and Moret-Bailly cubist structures for the good-reduction case",
     "The perturbation needs c_1(L(lambda f)) positive for small lambda, uniformly in n in the adelic version",
     "Section 4, good-reduction case: c1hat(L)^d = 0 is obtained from Theorem 5-2 of [17] together with density of torsion points, as in Proposition 2-1 of Szpiro [14], and positivity of c_1(L_sigma) from translation invariance of the cube metric's curvature (Moret-Bailly [10], Proposition 3-6); neither was read"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.5/equidistribution-of-generic-small-points-on-subvarieties-via-successive-minima": {
    "statement": "Let X be a d-dimensional variety over a number field K, L an ample line bundle with a semipositive adelic metric such that h(X) = 0, and sigma an archimedean place. Assume X_sigma(C) embeds in a complex projective manifold Y with an ample hermitian line bundle (M, ||.||_0) of strictly positive curvature restricting to (L_sigma, ||.||_sigma). Then every generic small sequence (x_n) in X(Qbar) has Galois orbits equidistributed with respect to dx = c_1(L_sigma, ||.||_sigma)^d / deg(L). Theorem of successive minima (quoted from [9]): with lambda_i = sup over subvarieties Y of inf over p in X(Qbar) - Y(Qbar) of h(p), as printed with dim Y = i (see hypotheses: the printed indexing is degenerate at i = d), lambda_d >= h(X) >= (1/d)(lambda_1 + ... + lambda_d), where h(Z) = c1hat(L|Z)^{dim Z + 1} / ((dim Z + 1) deg L).",
    "hypotheses": [
     "The theorem of successive minima is Zhang, Small points and adelic metrics (J. Algebraic Geom. 4 (1995)); not read. In particular the lower bound liminf h'(x_n) >= h'(X) for generic sequences is taken from it",
     "The embedding into a smooth Y is used only to approximate continuous functions by restrictions of smooth functions (Stone-Weierstrass), so that small perturbations of the metric keep positive curvature",
     "\"The proof is almost the same as in [5]\" (Szpiro-Ullmo-Zhang)",
     "As printed (page image, pp. 161-162), lambda_i is a supremum over subvarieties Y of X with dim Y = i, for i = 1, ..., d, ordered lambda_1 <= ... <= lambda_d. Taken literally, i = d allows only Y = X and gives an infimum over the empty set, so the printed indexing cannot be the intended one (presumably dim Y = i - 1, i.e. Y running over proper subvarieties). The only consequence used, liminf h'(x_n) >= h'(X) for a generic sequence, needs lambda_d >= h(X) with lambda_d a supremum over proper closed subvarieties; the correct indexing must be taken from [9] (Zhang, Small points and adelic metrics, 1995), which was not read"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.5/bogomolov-conjecture-for-subvarieties-of-abelian-varieties": {
    "hypotheses": [
     "Number field and characteristic zero are essential: the proof uses archimedean equidistribution",
     "The subvariety is integral (Section 3 works with integral X); Corollary 3 is proved in Section 4 under the label \"Corollary 1.2\", which does not exist in the printed paper (cross-reference slip)",
     "Uses the asserted reduction to trivial stabilizer, Lemma 3.1, Lemma 4.1, the theorem of successive minima and Theorem 2.1 on both X^m and alpha_m(X^m)",
     "The measure comparison dx_m = alpha_m^*(dx'_m) is stated as \"It follows that\", from the two equidistribution limits and generic injectivity of alpha_m at the points x(n_i)",
     "Second cross-reference slip (page image, p. 164, zoomed): the proof says 'By Lemma 3.1, it has a generic subsequence'; the lemma producing a generic subsequence is Lemma 4.1 (Lemma 3.1 is the generic-embedding lemma)",
     "Asserted without argument in the proof: the induced sequence x(n) is Zariski dense in X^m; x(n_i) and alpha_m(x(n_i)) are small for the product metrics; a further subsequence makes alpha_m smooth at every x(n_i); the embedding hypothesis of Theorem 2.1 (strictly positive curvature of the ambient hermitian bundle) holds for X^m in A^m and alpha_m(X^m) in A^{m-1} with the admissible metrics; and dx is nonzero at smooth points of X_sigma(C)"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.5/ullmo-discreteness-of-small-points-on-curves-in-their-jacobians": {
    "hypotheses": [
     "Zhang's admissible pairing (Invent. Math. 112, 1993) supplies: Theoreme 1.1 when (omega_a, omega_a)_a > 0 and when [Omega - (2g - 2)D_0] is not torsion; failure of Theoreme 1.1 when (omega_a, omega_a)_a = 0 and D_0 = Omega/(2g - 2); Lemme 2.1 (approximation of h_{omega_a} by Arakelov heights over extensions K_n); Lemme 2.2 (h_NT(j(P)) = g/(2g - 2) h_{omega_a}(P)). These are imports; the paper is in the supplied library but was not read",
     "Theoreme 2.3 is the Szpiro-Ullmo-Zhang equidistribution theorem for abelian varieties; Theoreme 2.4 is an extension of their Theoreme 3.1 to a sequence of models, proved in the paper",
     "Fibres of s : X^g -> J, s(P_1, ..., P_g) = j(P_1) + ... + j(P_g), are linear systems (Milne, Jacobian varieties, Chapter 5, not read); s is generically finite of degree g!",
     "The proof is independent of Raynaud's theorem on torsion points, which Theoreme 1.1 generalizes",
     "Further imports named in the proofs and not listed above (none read): Zhang 1993 [15] Corollaire 5-7 (existence of the generic sequence t_k with h_{omega_a}(t_k) -> 0); Zhang, Positive line bundles on arithmetic varieties (JAMS 1995) [16] Theoreme 5-2, used twice in the proof of Theoreme 2.4 (convergence of c1hat(L_n)^d/[K_n : K] to 0 and inequality (12)); Milne, Jacobian varieties [9] Lemma 5-2 (dim H^0(O(x_{n,1} + ... + x_{n,g})) = 1 for generic choices) and Chapter 5 (fibres of s are linear systems, after translating D_0 to a rational point)"
    ]
   },
   "HeightsRationalPointsAndObstructions:RP.6/conjectural-frontier-register-for-rational-points": {
    "sources": [
     {
      "sourceId": "poonen-rational-points-on-varieties",
      "locator": "Section 9.5.3, Conjectures 9.5.11-9.5.12 and the Faltings remark, p. 288",
      "excerpt": "Faltings simplified and generalized Vojta's methods to prove that Conjectures 9.5.11 and 9.5.12 are true when X is a subvariety of an abelian variety [Fal91].",
      "match": "Literal quotation."
     },
     {
      "sourceId": "poonen-rational-points-on-varieties",
      "locator": "Section 5.7.7, Conjectures 5.7.32-5.7.33 and the following paragraphs, pp. 145-146",
      "excerpt": "Conjecture 5.7.32 is open even for elliptic curves A over Q: this case has been proved only under the additional hypothesis that the order of vanishing of its L-function at s = 1 is at most 1.",
      "match": "Literal quotation."
     },
     {
      "sourceId": "poonen-rational-points-on-varieties",
      "locator": "Section 8.6.3, Theorem 8.6.12 with sketch and the following discussion, Remarks 8.6.13-8.6.14, pp. 252-253",
      "excerpt": "But there is no smooth hypersurface of dimension >= 3 for which the local-global principle has been proved to fail!",
      "match": "Literal quotation."
     },
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "X.4, Conjecture 4.13; VIII.10, Conjectures 10.1-10.2; VIII.9, Conjecture 9.9; IX.3, Conjecture 3.5, pp. 253-255, 279, 341",
      "excerpt": "Conjecture 4.13. Let E/K be an elliptic curve. Then Sha(E/K) is finite.",
      "match": "Literal statement of Conjecture X.4.13; the other conjectures are listed by locator."
     },
     {
      "sourceId": "poonen-rational-points-on-varieties",
      "locator": "Section 9.2, Conjecture 9.2.27, p. 267",
      "excerpt": "Conjecture 9.2.27 (Colliot-Thelene). Let X be a nice variety over a number field k. Suppose that X is rationally connected. Then the Brauer-Manin obstruction to the local-global principle is the only obstruction.",
      "match": "Literal statement (accent dropped), added by REVIEW-EXT-13-EXT-07B as register item (7)."
     }
    ],
    "statement": "The following are conjectural and must not be consumed as proved. (1) Bombieri-Lang (Poonen Conjecture 9.5.11): for a geometrically integral positive-dimensional variety X of general type over a number field k, X(k) is not Zariski dense. (2) Lang (Poonen Conjecture 9.5.12): such X has a proper closed S with (X - S)(L) finite for all finite L/k. Both are proved for subvarieties of abelian varieties (Faltings [Fal91], cited). (3) Shafarevich-Tate (Poonen Conjecture 5.7.32; Silverman Conjecture X.4.13): Sha(A) is finite; known for elliptic curves over Q only when the analytic rank is at most 1. (4) BSD rank part (Poonen Conjecture 5.7.33): ord_{s=1} L(A, s) = rk A(k); known for elliptic curves over Q of analytic rank at most 1. (5) Sufficiency of obstructions: \"the Brauer-Manin obstruction is the only one\" (Definition 8.2.8) is a property of a class of varieties and fails in general (Theorems 8.6.1, 8.6.5); for smooth complete intersections of dimension >= 3 the descent and Brauer-Manin sets are all of X(A) (Theorem 8.6.12, sketch), so neither obstruction can detect a failure of the local-global principle, and no smooth hypersurface of dimension >= 3 is known to fail it. (6) Lang-type conjectures in Silverman: arbitrarily large ranks (VIII.10.1), lower bounds for hhat in terms of the discriminant (VIII.9.9), bounds on generators (VIII.10.2) and on the number of integral points (IX.3.5). (7) Colliot-Thelene (Poonen Conjecture 9.2.27, read by the reviewer): for a nice rationally connected variety X over a number field, the Brauer-Manin obstruction to the local-global principle is the only one; conjectural."
   },
   "HeightsRationalPointsAndObstructions:RP.6/worked-examples-by-dimension-and-genus-with-proved-conclusions": {
    "statement": "Genus 1: for y^2 = x^3 - 12x^2 + 20x, local solubility tests and a point search prove E(Q) = Z x (Z/2Z)^2 with generators and Sha[2] = 0 (Silverman X.1.5); for y^2 = x^3 - 6x^2 + 17x, 2-isogeny descent proves E(Q) = Z x Z/2Z (X.4.10). Genus 2: y^2 = (x^2 + 1)(x^4 + 1) has exactly six affine rational points, proved by descent to rank-0 elliptic curves whose ranks are cited from tables (Poonen 8.3); Faltings' theorem alone gives only ineffective finiteness. Surfaces: Iskovskikh's Chatelet surface has X(A) nonempty and X(Q) empty, certified by one quaternion class (Poonen 8.2.15); the quadric bundle of Theorem 8.6.5 has no rational points although X(A)^{et,Br} is nonempty, certified by the unique rational point of an auxiliary elliptic curve. Genus 0: no worked example is in the sources read (Poonen Exercise 4.5, p. 113, only poses the local-global principle for nice genus-0 curves over global fields as an exercise)."
   }
  },
  "added": [],
  "removed": []
 },
 "links": {
  "added": [
   {
    "source": "HeightsRationalPointsAndObstructions:RP.0",
    "target": "HeightsRationalPointsAndObstructions:RP.5/torsion-subvarieties-and-strict-generic-small-sequences",
    "reason": "Zhang's definitions of small, strict and generic sequences use the Neron-Tate height h on an abelian variety A over a number field with respect to a symmetric ample line bundle (Section 1, p. 159). The RP.0 stage scope includes 'Neron-Tate and local heights on abelian varieties', and RP.0 -> RP.5 is an existing atlas edge. Reviewer (REVIEW-EXT-13-EXT-07B): re-targeted from the node RP.0/properties-of-the-canonical-height-parallelogram-law-and-torsion to the RP.0 stage, because that node covers only elliptic curves (Silverman VIII.9) and does not supply the height Zhang uses; no RP.0 node yet supplies it (first gap).",
    "sources": [
     {
      "sourceId": "zhang-1998-equidistribution-small-points",
      "locator": "Section 1, p. 159"
     }
    ]
   },
   {
    "source": "HeightsRationalPointsAndObstructions:RP.0",
    "target": "HeightsRationalPointsAndObstructions:RP.5/ullmo-discreteness-of-small-points-on-curves-in-their-jacobians",
    "reason": "Ullmo's Theoreme 1.1 bounds the Neron-Tate height h_NT on the Jacobian J of a curve of genus g >= 2 and uses that h_NT(phi_{D_0}(P)) = 0 exactly when phi_{D_0}(P) is torsion (Section 1, p. 1). The RP.0 stage scope includes Neron-Tate heights on abelian varieties. Reviewer (REVIEW-EXT-13-EXT-07B): re-targeted from the elliptic-curve node RP.0/properties-of-the-canonical-height-parallelogram-law-and-torsion, which does not supply heights on Jacobians of dimension g >= 2, to the RP.0 stage; no RP.0 node yet supplies them (first gap).",
    "sources": [
     {
      "sourceId": "ullmo-1998-positivite-discretion",
      "locator": "Section 1, p. 1"
     }
    ]
   },
   {
    "source": "AbelianSchemesAndArithmeticModuli:A6",
    "target": "HeightsRationalPointsAndObstructions:RP.5/equidistribution-of-strict-small-sequences-and-torsion-corollaries",
    "reason": "Added by REVIEW-EXT-13-EXT-07B. Corollary 2 is obtained by applying Corollary 1 to B = Res_{K/Q} A and S = B(R); this needs the Weil restriction of an abelian variety along a finite separable extension of number fields to be an abelian variety over Q, which A6 owns ('For finite separable number-field extensions L/K ... construct'; 'For finite etale S' -> S and an abelian scheme A/S', prove that the restriction is an abelian scheme'). The stage edge A6 -> RP.5 is already introduced by the Poincare-reducibility link.",
    "sources": [
     {
      "sourceId": "zhang-1998-equidistribution-small-points",
      "locator": "Section 1, paragraph before Corollary 2, p. 160"
     }
    ]
   }
  ],
  "removed": [
   {
    "source": "HeightsRationalPointsAndObstructions:RP.0/properties-of-the-canonical-height-parallelogram-law-and-torsion",
    "target": "HeightsRationalPointsAndObstructions:RP.5/torsion-subvarieties-and-strict-generic-small-sequences",
    "reason": "Small sequences are defined through a Neron-Tate height, vanishing exactly on torsion points; the elliptic-curve construction and properties are Silverman VIII.9. The general abelian-variety Neron-Tate height with respect to a symmetric ample line bundle is not in the sources read (gap). Existing atlas edge RP.0 -> RP.5.",
    "sources": [
     {
      "sourceId": "zhang-1998-equidistribution-small-points",
      "locator": "Section 1, p. 159"
     }
    ]
   },
   {
    "source": "HeightsRationalPointsAndObstructions:RP.0/properties-of-the-canonical-height-parallelogram-law-and-torsion",
    "target": "HeightsRationalPointsAndObstructions:RP.5/ullmo-discreteness-of-small-points-on-curves-in-their-jacobians",
    "reason": "Theoreme 1.1 bounds the Neron-Tate height on the Jacobian; its vanishing on torsion points is how it generalizes Raynaud's theorem.",
    "sources": [
     {
      "sourceId": "ullmo-1998-positivite-discretion",
      "locator": "Section 1, p. 1"
     }
    ]
   },
   {
    "source": "HeightsRationalPointsAndObstructions:RP.4/parshin-construction-reducing-mordell-to-shafarevich-finiteness",
    "target": "HeightsRationalPointsAndObstructions:RP.6/function-field-analogue-of-mordell-and-isotriviality",
    "reason": "Poonen contrasts Theorem 9.5.1 over number fields with the function-field analogue in Section 9.5.2.",
    "sources": [
     {
      "sourceId": "poonen-rational-points-on-varieties",
      "locator": "Sections 9.5.1-9.5.2, pp. 286-287"
     }
    ]
   }
  ],
  "changed": [
   {
    "source": "SchemeAndStackFoundations:SF.2",
    "target": "HeightsRationalPointsAndObstructions:RP.1/torsor-evaluation-map-and-partition-of-rational-points-by-twists",
    "reason": "Poonen works with fppf torsors and Cech fppf H^1 (Theorem 6.5.10(i), torsors classified by H^1); SF.2 owns fppf site comparisons and scheme cohomology. New stage edge SF.2 -> RP.1 (SF.2 is already a supplier of RP.2). Reviewer (REVIEW-EXT-13-EXT-07B): SF.2's stated scope (fppf site comparisons, sheaf cohomology) covers the Cech fppf H^1 used here; that every class is represented by a torsor scheme for affine G (Theorem 6.5.10(i)) and the twists of Example 6.5.12 are effective descent, owned by AlgebraicModuliForArithmeticGeometry R09.3 (linked to the descent-set node). Kept.",
    "sources": [
     {
      "sourceId": "poonen-rational-points-on-varieties",
      "locator": "Section 8.4 opening paragraph, p. 239"
     }
    ]
   },
   {
    "source": "HeightsRationalPointsAndObstructions:RP.1/torsor-evaluation-map-and-partition-of-rational-points-by-twists",
    "target": "HeightsRationalPointsAndObstructions:RP.3/descent-sets-and-the-descent-obstruction",
    "reason": "The description X(A)^f = union of f^tau(Z^tau(A)) is the adelic analogue of Theorem 8.4.1. Reviewer (REVIEW-EXT-13-EXT-07B): annotated: Section 8.4.7 states the twist description X(A)^f = union of f^tau(Z^tau(A)) with 'one can show' and defers it to Exercise 8.7(f)-(g); it does not invoke Theorem 8.4.1. The consumer does use the twisted torsors f^tau : Z^tau -> X built in the supplier node (Example 6.5.12), and a proof of Exercise 8.7(f) would run Theorem 8.4.1 over each k_v. Kept on that basis.",
    "sources": [
     {
      "sourceId": "poonen-rational-points-on-varieties",
      "locator": "Section 8.4.7, p. 244"
     }
    ]
   },
   {
    "source": "HeightsRationalPointsAndObstructions:RP.1/torsor-evaluation-map-and-partition-of-rational-points-by-twists",
    "target": "HeightsRationalPointsAndObstructions:RP.3/descent-example-for-y2-equals-(x2-plus-1)(x4-plus-1)",
    "reason": "The reinterpretation in Section 8.3.1 writes X(Q) as the union of the f_c(Z_c(Q)) over twists, the special case G = Z/2Z of Theorem 8.4.1. Reviewer (REVIEW-EXT-13-EXT-07B): annotated: Section 8.3 is argued directly (coprimality of X^2 + Z^2 and X^4 + Z^4) and precedes Section 8.4, whose opening says it generalizes the example; the source does not derive the reinterpretation of 8.3.1 from Theorem 8.4.1. The link records that the reinterpretation is the G = Z/2Z case of Theorem 8.4.1 (Z -> X is a Z/2Z-torsor by Proposition 8.3.4), which a formal proof of that bullet would use.",
    "sources": [
     {
      "sourceId": "poonen-rational-points-on-varieties",
      "locator": "Section 8.3.1 and the opening of Section 8.4, pp. 237-239"
     }
    ]
   },
   {
    "source": "HeightsRationalPointsAndObstructions:RP.1/selmer-and-shafarevich-tate-groups-of-an-isogeny",
    "target": "HeightsRationalPointsAndObstructions:RP.3/descent-example-for-y2-equals-(x2-plus-1)(x4-plus-1)",
    "reason": "The rank-0 statements for 32A2 and 64A1 are attributed to \"a 2-descent\"; the descent tools are the RP.1 Selmer computations. Reviewer (REVIEW-EXT-13-EXT-07B): annotated: the source does not carry out the 2-descent; it says 'A \"2-descent\" (or a glance at [Cre97, Table 1]!) shows that both elliptic curves have rank 0'. The link names the machinery (Silverman X.4) that would discharge the cited rank-0 claims; the supplier node itself is unverifiable (Silverman).",
    "sources": [
     {
      "sourceId": "poonen-rational-points-on-varieties",
      "locator": "Section 8.3, p. 237"
     }
    ]
   },
   {
    "source": "SchemeAndStackFoundations:SF.2",
    "target": "HeightsRationalPointsAndObstructions:RP.2/brauer-manin-pairing-on-adelic-points",
    "reason": "The construction needs Brauer groups of schemes, spreading out Brauer classes (Corollary 6.6.11) and Br O_v = 0 (Corollary 6.9.3); SF.2 owns scheme cohomology. Existing atlas edge SF.2 -> RP.2. Reviewer (REVIEW-EXT-13-EXT-07B): annotated: partial supply. SF.2's stated scope is sites and sheaf cohomology; it does not name Brauer groups, spreading out of Brauer classes (Poonen Corollary 6.6.11) or Br O_v = 0 (Corollary 6.9.3). These remain in the Poonen-imports gap without an owner.",
    "sources": [
     {
      "sourceId": "poonen-rational-points-on-varieties",
      "locator": "proof of Proposition 8.2.1, p. 229"
     }
    ]
   },
   {
    "source": "SchemeAndStackFoundations:SF.2",
    "target": "HeightsRationalPointsAndObstructions:RP.3/brauer-set-equals-the-pgl-descent-set",
    "reason": "The map H^1(X, PGL_n) -> (Br X)[n] and its surjectivity onto Br X for regular quasi-projective X (Corollary 6.6.19) are cohomological inputs; new stage edge SF.2 -> RP.3 (SF.2 already supplies RP.2 upstream). Reviewer (REVIEW-EXT-13-EXT-07B): annotated: requested, not supplied. SF.2's stated scope does not include the map H^1(X, PGL_n) -> (Br X)[n] or Corollary 6.6.19 (every Brauer class of a regular quasi-projective variety comes from a PGL_n-torsor, a Gabber/de Jong-type theorem); no atlas stage names it. Recorded in the Poonen-imports gap; the stage edge SF.2 -> RP.3 is in any case implied by SF.2 -> RP.2 -> RP.3.",
    "sources": [
     {
      "sourceId": "poonen-rational-points-on-varieties",
      "locator": "Section 8.5.1 and proof of Proposition 8.5.3, pp. 245-246"
     }
    ]
   },
   {
    "source": "FaltingsFinitenessAndIsogenyTheorems:R28.5/finiteness-of-curves-of-genus-at-least-two-with-good-reduction-outside-S",
    "target": "HeightsRationalPointsAndObstructions:RP.4/parshin-construction-reducing-mordell-to-shafarevich-finiteness",
    "reason": "The finiteness of the Y(x) is Korollar 1 to Satz 6 (curves of genus >= 2 with good reduction outside a finite set). Existing atlas edge R28.5 -> RP.4. Reviewer (REVIEW-EXT-13-EXT-07B): Faltings does not name Korollar 1 in the proof of Satz 7; its use is implicit in 'es gibt somit nur endlich viele Moeglichkeiten fuer Y(x)' (p. 365, GDZ page image), applied over K_1. Kept.",
    "sources": [
     {
      "sourceId": "faltings-1983-endlichkeitssaetze",
      "locator": "Korollar 1 and proof of Satz 7, p. 365"
     }
    ]
   },
   {
    "source": "DiophantineApproximationAndTranscendence:DT.2",
    "target": "HeightsRationalPointsAndObstructions:RP.4/finiteness-of-the-s-unit-equation-via-roth",
    "reason": "DT.2 owns S-unit equations; Silverman's Theorem IX.4.1 is a Roth-based proof of the two-term S-unit equation. Existing atlas edge DT.2 -> RP.4. Reviewer (REVIEW-EXT-13-EXT-07B): annotated: the consumer node proves the two-term S-unit finiteness itself from Roth (link from the Roth node); it does not use DT.2's S-unit theorem. DT.2's scope ('S-unit and decomposable-form applications' of the subspace theorem) supplies the same statement by a second route. The link records that DT.2 is the owner of record of this statement, not an input of this proof; whether the hyperelliptic Siegel node should consume DT.2's export instead is an orchestrator decision.",
    "sources": [
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "IX.4, Theorem 4.1, p. 282"
     }
    ]
   },
   {
    "source": "HeightsRationalPointsAndObstructions:RP.5/arithmetic-equidistribution-of-generic-small-sequences",
    "target": "HeightsRationalPointsAndObstructions:RP.5/equidistribution-of-generic-small-points-on-subvarieties-via-successive-minima",
    "reason": "Zhang: \"The proof is almost the same as in [5]\" (Szpiro-Ullmo-Zhang Theoreme 3.1). Reviewer (REVIEW-EXT-13-EXT-07B): annotated: method reuse, not an input. Zhang re-runs the Szpiro-Ullmo-Zhang perturbation argument with Proposition 2.1 replaced by the theorem of successive minima; no conclusion of Theoreme 3.1 is used. Kept to record the proof template.",
    "sources": [
     {
      "sourceId": "zhang-1998-equidistribution-small-points",
      "locator": "proof of Theorem 2.1, p. 162"
     }
    ]
   },
   {
    "source": "HeightsRationalPointsAndObstructions:RP.5/torsion-subvarieties-and-strict-generic-small-sequences",
    "target": "HeightsRationalPointsAndObstructions:RP.5/bogomolov-conjecture-for-subvarieties-of-abelian-varieties",
    "reason": "Lemma 4.1 supplies the generic subsequence of the Zariski-dense sequence on X^m. Reviewer (REVIEW-EXT-13-EXT-07B): verified on the page image; note that the printed proof says 'By Lemma 3.1, it has a generic subsequence', a slip for Lemma 4.1.",
    "sources": [
     {
      "sourceId": "zhang-1998-equidistribution-small-points",
      "locator": "proof of the generalized Bogomolov conjecture, p. 164"
     }
    ]
   }
  ]
 },
 "gaps": [
  {
   "title": "The general height machine is not in the sources read: Weil heights for line bundles on projective varieties, local (Neron) heights, and Neron-Tate heights on abelian varieties",
   "neededBy": [
    "HeightsRationalPointsAndObstructions:RP.0",
    "HeightsRationalPointsAndObstructions:RP.0/absolute-height-on-projective-space-and-its-invariance",
    "HeightsRationalPointsAndObstructions:RP.5/torsion-subvarieties-and-strict-generic-small-sequences",
    "HeightsRationalPointsAndObstructions:RP.5/ullmo-discreteness-of-small-points-on-curves-in-their-jacobians"
   ],
   "detail": "Silverman VIII.5-VIII.9 covers heights on P^N and on elliptic curves only. For the general statements it points to Lang, Fundamentals of Diophantine Geometry [139], Chapter 4 (Remark 6.5). For local heights it points to its own Appendix C, Section 18, and to Silverman, Advanced Topics [266], Chapter VI (VIII.9 opening). None of these was read. The RP.0 construction asks for divisor and line-bundle heights modulo bounded functions, pullback and tensor laws, Northcott for ample bundles, and the comparison of Neron-Tate and local heights on abelian varieties. None of these is decomposed here. Hindry-Silverman, Diophantine Geometry, is catalogued as \"book_requested\" and absent; Bombieri-Gubler, Heights in Diophantine Geometry, is absent. The atlas suppliers LI.4, SF.5 and A6 do not provide a height machine either. Next source action: acquire Hindry-Silverman Part B (B.2-B.5) or Bombieri-Gubler Chapters 2 and 9, and decompose the height machine and the abelian Neron-Tate height under RP.0. Reviewer (REVIEW-EXT-13-EXT-07B): the two links that fed Zhang's and Ullmo's Neron-Tate heights from the elliptic-curve node RP.0/properties-of-the-canonical-height-parallelogram-law-and-torsion were re-targeted to the RP.0 stage, whose scope names Neron-Tate heights on abelian varieties, because the elliptic node does not supply heights on abelian varieties of dimension > 1 (Ullmo needs them on Jacobians of genus >= 2)."
  },
  {
   "title": "Mordell-Weil for abelian varieties: the height part, and descent when n meets the residue characteristic, are not read",
   "neededBy": [
    "HeightsRationalPointsAndObstructions:RP.1",
    "HeightsRationalPointsAndObstructions:RP.1/weak-mordell-weil-for-abelian-varieties-via-the-selmer-set"
   ],
   "detail": "Poonen Theorem 5.7.31 proves the weak Mordell-Weil theorem through Selmer sets (Theorem 8.4.9). For the height part it only says \"Combining this with the theory of height functions completes the proof; see [Ser97, 4.3]\". Serre, Lectures on the Mordell-Weil theorem, was not read. Theorem 8.4.9 assumes that char k does not divide m. The roadmap asks for fppf cohomology when n meets the residue characteristic, but no source read treats that case: over number fields it concerns the local fppf cohomology of finite flat group schemes at primes above n, which Silverman and Poonen avoid because [m] is etale over K. Poonen also asserts without proof that the coboundary and the evaluation map A(k) -> H^1(k, A[m]) coincide. Next source action: read Serre, Lectures on the Mordell-Weil theorem, Chapters 3-4, and Milne, Arithmetic Duality Theorems, III for flat cohomology."
  },
  {
   "title": "Silverman imports under RP.1 are unread: reduction of torsion (VII.3.1, VII.3.5), the Weil pairing (III.8), group cohomology (Appendix B), homogeneous spaces (X.3) and 2-isogeny formulas (III.4.5)",
   "neededBy": [
    "HeightsRationalPointsAndObstructions:RP.1/kummer-extension-is-abelian-of-exponent-m-and-unramified-outside-S",
    "HeightsRationalPointsAndObstructions:RP.1/complete-2-descent-map-for-full-rational-2-torsion",
    "HeightsRationalPointsAndObstructions:RP.1/selmer-and-shafarevich-tate-groups-of-an-isogeny",
    "HeightsRationalPointsAndObstructions:RP.1/descent-via-two-isogeny-with-worked-example-y2-equals-x3-minus-6x2-plus-17x"
   ],
   "detail": "The RP.1 decomposition uses, without having read their proofs: injectivity of prime-to-p torsion under good reduction (VII.3.1(b)) and the torsion bound through reduction (VII.3.5); the Weil pairing and its nondegeneracy (III.8.1); inflation-restriction and Hilbert 90 (Appendix B); WC(E/K) = H^1(G, E) and the homogeneous spaces C_d with the maps theta (X.3.6-X.3.7); the 2-isogeny formula (III.4.5); and bad primes being invariant under isogeny (VII.7.2). Candidate suppliers: AbelianSchemesAndArithmeticModuli A3 (Weil pairing), LI.4 (Galois cohomology), EllipticCurves via LI.4. Separately, the atlas dependency ArithmeticGaloisDuality R02.6 -> RP.1 (patching inequalities) is not used by any source read for RP.1. Next action: read Silverman III.4, III.8, VII.3 and X.3 and record which supplier owns each statement."
  },
  {
   "title": "Poonen's Brauer-group and torsor imports for RP.1-RP.3 are unread, and several statements are left as exercises",
   "neededBy": [
    "HeightsRationalPointsAndObstructions:RP.1/finiteness-of-torsor-classes-unramified-outside-S",
    "HeightsRationalPointsAndObstructions:RP.2/obstruction-set-attached-to-a-functor",
    "HeightsRationalPointsAndObstructions:RP.2/brauer-manin-pairing-on-adelic-points",
    "HeightsRationalPointsAndObstructions:RP.2/iskovskikh-chatelet-surface-with-a-brauer-manin-obstruction",
    "HeightsRationalPointsAndObstructions:RP.3/descent-sets-and-the-descent-obstruction",
    "HeightsRationalPointsAndObstructions:RP.3/brauer-set-equals-the-pgl-descent-set"
   ],
   "detail": "Chapter 8 rests on earlier chapters that were not read. For torsors: Theorem 6.5.10(i) (torsors classified by H^1), Proposition 5.12.14, Lang's theorem 5.12.19(a), Hensel's lemma 3.5.63, Borel-Serre (5.12.24(a), 5.12.29, cited to [BS64]) and a Hermite variant ([Ser97, 4.1]). For Brauer groups: 6.6.7 (purity), 6.6.11 (spreading out), 6.6.17(ii), Corollary 6.6.19 (every class of Br X comes from some PGL_n-torsor for regular quasi-projective X), 6.8.3 (residues), 6.9.2-6.9.3 (Br of henselian rings, Br O_v = 0), 6.9.15, and the quaternion norm criterion 1.5.23. It also uses Cesnavicius [Ces15] for Br A. Proposition 8.1.8 and Corollaries 8.1.9-8.1.10 are Exercise 8.1, and the twist description and closedness of descent sets are Exercise 8.7. The X(A) nonempty computation for Iskovskikh's surface is omitted. SF.2 is the declared cohomology supplier, but its Brauer-group content is unspecified. Next source action: read Poonen Sections 6.6-6.9 and 5.12, and supply proofs of Exercises 8.1 and 8.7. Reviewer (REVIEW-EXT-13-EXT-07B): (1) Exercise 8.7, which is to prove the twist description and closedness of descent sets, is posed only for number fields, while Section 8.4.7 states these facts for global fields. (2) Theorem 6.5.13 also uses Remark 6.5.2, Theorem 4.3.7(i), Proposition 3.5.35 and Theorem 3.5.52 (Steps 1 and 5), unread. (3) Supplier scope: SchemeAndStackFoundations SF.2 is stated as sites and sheaf cohomology; it names neither Brauer groups nor the spreading-out and local results (Corollaries 6.6.11, 6.9.3), nor Corollary 6.6.19 (Brauer classes of regular quasi-projective varieties come from PGL_n-torsors, a Gabber/de Jong-type theorem). The links SF.2 -> Brauer-Manin pairing and SF.2 -> PGL node are annotated as partial and requested supply; an owner for Brauer groups of schemes is needed. (4) The Hermite-type finiteness in Step 5 of Theorem 6.5.13 ([Ser97, 4.1]: finitely many separable extensions of bounded degree and bounded discriminant) has no owner; FoundationsAndLibraryIntegration LI.4 is the natural one for number fields, and the Faltings packet's R28.1 Hermite-Minkowski node states a related import (unramified outside S) without proof."
  },
  {
   "title": "Obstruction comparison and insufficiency results are cited, not proved: Skorobogatov 2009, Stoll 2007, Demarche 2009, Harari 2002, Cao 2017, Skorobogatov 1999, Harari-Skorobogatov 2002",
   "neededBy": [
    "HeightsRationalPointsAndObstructions:RP.3/etale-brauer-set-equals-the-descent-set",
    "HeightsRationalPointsAndObstructions:RP.3/iterated-descent-gives-no-new-obstruction",
    "HeightsRationalPointsAndObstructions:RP.3/nonempty-etale-brauer-set-without-rational-points",
    "HeightsRationalPointsAndObstructions:RP.2/day-and-night-semi-decision-procedure-for-rational-points"
   ],
   "detail": "Theorem 8.5.4 is a sketch. Its first and third inclusions are [Sko09, Theorem 1.1] (generalizing [Sto07, Proposition 5.17]) and [Dem09] (generalizing [Har02]). Theorem 8.5.5 is [Cao17, Corollaire 1.2]. The bielliptic example (Theorem 8.6.1) is only outlined, and the single noncommutative torsor explaining it is [HS02, Section 5.1]. The effectivity of Section 8.2.6 is cited to [Poo06, Remark 5.3] and [KT08, KT11]. Theorem 8.6.12 cites the weak Lefschetz theorem and [PV04, Proposition A.1]. None of these was read. RP.3 must state exact obstruction equalities only for proved classes, so all of these remain imports. Next source action: read Skorobogatov, Torsors and rational points (Cambridge 2001), Sections 5.2-5.3 and 6; Demarche, Obstruction de descente et obstruction de Brauer-Manin etale (Algebra and Number Theory 2009); and Cao 2017."
  },
  {
   "title": "RP.2 acceptance items without a source example: a conic, and an effective test for a specified finite subgroup of the Brauer group",
   "neededBy": [
    "HeightsRationalPointsAndObstructions:RP.2",
    "HeightsRationalPointsAndObstructions:RP.2/local-constancy-of-brauer-evaluation-and-closedness-of-the-brauer-set"
   ],
   "detail": "No conic (genus-0) Brauer-Manin computation appears in the sections read. Poonen treats conics and quaternion algebras in Sections 1.5.7 and 4.5 and Exercise 4.5, which were not read. For a specified finite subgroup B of Br X, the effective test \"is X(A)^B empty?\" is supported only by the principle of Remark 8.2.12: local evaluations factor through finitely many residue classes and real components and vanish at almost all places. No algorithm with bounds on the places and precision was read. Next source action: read Poonen Section 1.5.7 and Exercise 4.5 for a conic, and a source for algorithmic Brauer-Manin evaluation (e.g. Kresch-Tschinkel, Effectivity of Brauer-Manin obstructions, Advances 2008). Reviewer (REVIEW-EXT-13-EXT-07B): Poonen Section 1.5.7 is 'Cyclic algebras' (quaternion algebras as cyclic algebras) and Section 4.5 is 'Twists' (Severi-Brauer varieties); Exercise 4.5 (p. 113, read) asks to prove, using the description of Br k, that a nice genus-0 curve over a global field has a k-point if and only if it has k_v-points for all v, and that the set of v with X(k_v) empty is finite of even cardinality. It is an exercise without proof, so a conic example still needs a written argument."
  },
  {
   "title": "The Parshin construction has unwritten inputs, and it duplicates the Satz 7 node of the Faltings packet",
   "neededBy": [
    "HeightsRationalPointsAndObstructions:RP.4/parshin-construction-reducing-mordell-to-shafarevich-finiteness",
    "HeightsRationalPointsAndObstructions:RP.4/uniform-field-of-definition-for-fibres-of-an-unramified-covering"
   ],
   "detail": "Faltings' proof of Satz 7 (p. 365) does not write out several inputs. These are: the existence, after a field extension, of an unramified covering of degree m > 2; the generalized Jacobian of (X_1, D) and the map X_1 - D -> A; the proof that the pullback of [2] is a curve Y(x) ramified exactly over D, of genus >= 2, with bad reduction only at the places (a)-(c); finiteness of maps Y(x) -> X (de Franchis type); and the Chevalley-Weil step from Hermite-Minkowski to the uniform field K_1. Parshin's paper [9] (Math. USSR Izvestija 2, 1968) is not in the library. Torelli for Korollar 1 is already a gap in the Faltings packet. SF.3 names Jacobians but not generalized Jacobians. The same Satz 7 argument is recorded in FaltingsFinitenessAndIsogenyTheorems under R28.5 (mordell-conjecture-by-the-parshin-construction); the atlas assigns the Parshin reduction to RP.4. Orchestrator decision needed: keep one node, with the other linking to it. Next source action: read Serre, Algebraic groups and class fields, Chapter V (generalized Jacobians), and a written Parshin argument (e.g. Szpiro, Seminaire sur les pinceaux arithmetiques, Asterisque 127, or Bombieri-Gubler 11.4)."
  },
  {
   "title": "Siegel's theorem for general affine curves and Roth over number fields are not decomposed; Faltings' route to Siegel is only asserted",
   "neededBy": [
    "HeightsRationalPointsAndObstructions:RP.4",
    "HeightsRationalPointsAndObstructions:RP.4/roth-theorem-in-distance-function-form-on-curves",
    "HeightsRationalPointsAndObstructions:RP.4/siegel-finiteness-for-genus-one-curves-and-arbitrary-functions"
   ],
   "detail": "Silverman proves Siegel's theorem only for genus-one curves and for y^2 = f(x). The general statement for affine curves of genus >= 1 is cited ([114, Theorem D.9.1], [139, Chapter 8, Theorem 2.4]). The genus-0 case with at least three points at infinity is not mentioned. RP.4 asks for \"the exact genus/boundary conditions\", so the general theorem remains open here. Roth's theorem over a number field K with an arbitrary absolute value is imported (Silverman IX.8 is a sketch). The EXT-08 DiophantineApproximationAndTranscendence packet states Roth only over Q for the archimedean absolute value, without proof, so this is a supplier request to DT.1/DT.2. Faltings' Bemerkung 1 (Siegel without Diophantine approximation) and Poonen Exercise 8.6 (Faltings implies finiteness of integral points on affine genus-1 curves) have no proofs. Unramifiedness of P -> [m]P + R (III.4.10(c)) was not read. Next source action: read Corvaja-Zannier, A subspace theorem approach to integral points on curves (C. R. Acad. Sci. Paris 2002) for Siegel from DT.2, or Hindry-Silverman D.9 when acquired. Reviewer (REVIEW-EXT-13-EXT-07B): the link DT.2 -> RP.4/finiteness-of-the-s-unit-equation-via-roth is annotated: that node proves the two-term S-unit finiteness from Roth and does not use DT.2's S-unit theorem, so DT.2 is the owner of record of the same statement by a second route. The promoted EXT-08 DiophantineApproximationAndTranscendence packet has no S-unit node under DT.2 (only the subspace theorem over Q and the deduction of Roth over Q; effective unit equations are under DT.4). Decision needed: whether RP.4's hyperelliptic Siegel node consumes a DT.2 export or keeps Silverman's Roth-based proof."
  },
  {
   "title": "Arakelov and adelic imports for the Bogomolov branch are unread, and no atlas stage owns arithmetic intersection theory on arithmetic varieties",
   "neededBy": [
    "HeightsRationalPointsAndObstructions:RP.5/arithmetic-equidistribution-of-generic-small-sequences",
    "HeightsRationalPointsAndObstructions:RP.5/equidistribution-of-generic-small-points-on-subvarieties-via-successive-minima",
    "HeightsRationalPointsAndObstructions:RP.5/ullmo-discreteness-of-small-points-on-curves-in-their-jacobians"
   ],
   "detail": "The equidistribution proofs rest on several unread results. Zhang's theorem of successive minima and adelic metrics come from Small points and adelic metrics (J. Algebraic Geom. 4, 1995: Theorems 1-4, 1-10, 3-1, 5-2). The inequality of Proposition 2.1 is Zhang, Positive line bundles on arithmetic varieties (JAMS 8, 1995, Theorem 5-2). They also use the arithmetic Hilbert-Samuel theorem (Abbes-Bouche; Gillet-Soule), Gillet-Soule arithmetic Chow groups and intersection products, cubist metrics (Breen, Moret-Bailly), and, for Ullmo, Zhang's admissible pairing (Invent. Math. 112, 1993: Theorem 2-4, proof of Theorem 5-6, Corollary 5-7). The last is in the supplied library (catalogue ZhangAdmissible) but was not read. ArakelovGeometryAndAbelianHeights R35.1 owns hermitian bundles and arithmetic degree over arithmetic curves only. No atlas stage owns arithmetic intersection theory on higher-dimensional arithmetic varieties, adelic metrics or the successive-minima theorem. Supplier request: an owner for these (candidate: ArakelovGeometryAndAbelianHeights, or a new stage). Next source action: read Zhang 1995 (JAG) Sections 1, 3, 5 and Zhang 1993 Sections 2-5. Reviewer (REVIEW-EXT-13-EXT-07B): (1) Ullmo's proof of Theoreme 2.4 invokes Theorem 5-2 of Zhang, Positive line bundles on arithmetic varieties (JAMS 8, 1995; Ullmo's [16]) twice, and Proposition 3.1 uses Zhang 1993 Corollaire 5-7 and Milne, Jacobian varieties, Lemma 5-2 and Chapter 5; SUZ Section 4 uses [17] Theorem 5-2 with density of torsion points and Moret-Bailly [10] Proposition 3-6 in the good-reduction case. All unread. (2) Zhang 1998 prints the successive minima as lambda_i = sup over Y of dimension i of inf over X(Qbar) - Y(Qbar) of h, i = 1..d; for i = d this allows only Y = X and an empty infimum, so the printed indexing is degenerate (presumably dim Y = i - 1). The correct statement must be read in Zhang, Small points and adelic metrics (JAG 1995), before the Theorem 2.1 node is used."
  },
  {
   "title": "Mordell-Lang and Manin-Mumford over general fields are not covered; several of Zhang's steps are asserted without proof",
   "neededBy": [
    "HeightsRationalPointsAndObstructions:RP.5",
    "HeightsRationalPointsAndObstructions:RP.5/bogomolov-conjecture-for-subvarieties-of-abelian-varieties",
    "HeightsRationalPointsAndObstructions:RP.5/equidistribution-of-strict-small-sequences-and-torsion-corollaries",
    "HeightsRationalPointsAndObstructions:RP.5/stabilizer-reduction-and-generic-injectivity-of-the-difference-map"
   ],
   "detail": "RP.5 asks for Mordell-Lang, Manin-Mumford and Bogomolov branches. Only the Bogomolov branch and Manin-Mumford over number fields (Zhang Corollary 4) are decomposed. No proof of Manin-Mumford over an arbitrary characteristic-0 field was read (Raynaud 1983; specialization arguments). No source for Mordell-Lang was read (Faltings 1991 and 1994; Vojta 1996; McQuillan; Hrushovski in characteristic p), nor for the intersection of subvarieties with finitely generated subgroups. Within Zhang 1998, three steps are asserted: the equivalence of the Bogomolov statements for X and X/G(X), the measure identity dx_m = alpha_m^*(dx'_m), and Corollaries 1, 2 and 4, which have no proofs. The proof section also calls Corollary 3 \"Corollary 1.2\". Next source action: read Faltings, The general case of S. Lang's conjecture (1994) and a characteristic-0 Manin-Mumford specialization source (e.g. Hindry 1988 or Pink-Roessler 2004). Reviewer (REVIEW-EXT-13-EXT-07B): further unargued steps in the proof of the generalized Bogomolov conjecture (pp. 164-165): the induced sequence x(n) on X^m is Zariski dense; x(n_i) and alpha_m(x(n_i)) are small for the product metrics; alpha_m can be made smooth along the subsequence; the embedding hypothesis of Theorem 2.1 (strictly positive curvature) holds for X^m in A^m and alpha_m(X^m) in A^{m-1}; dx is nonzero at smooth points of X_sigma(C). A second cross-reference slip: 'By Lemma 3.1, it has a generic subsequence' (p. 164) means Lemma 4.1."
  },
  {
   "title": "RP.6 register items without sources: a genus-0 worked example, Vojta's conjecture, and certified enumeration",
   "neededBy": [
    "HeightsRationalPointsAndObstructions:RP.6",
    "HeightsRationalPointsAndObstructions:RP.6/worked-examples-by-dimension-and-genus-with-proved-conclusions",
    "HeightsRationalPointsAndObstructions:RP.6/conjectural-frontier-register-for-rational-points"
   ],
   "detail": "The RP.6 acceptance needs worked genus-zero, genus-one and genus-at-least-two examples. The genus-zero example (a conic with or without rational points, e.g. via Hasse-Minkowski) has no source read. Vojta's conjecture is required in the frontier register, but no source read states it (Poonen mentions only Vojta's proof of Mordell). Poonen Conjecture 9.2.27 (Colliot-Thelene: for nice rationally connected varieties over number fields the Brauer-Manin obstruction is the only one) has since been read by the reviewer and added to the register as item (7); the surrounding Section 9.2 was not read. Certified enumeration of rational points is owned by EffectiveDiophantineMethods (EXT-07 packet: Chabauty-Coleman, Mordell-Weil sieve, quadratic Chabauty), so no RP.6 node supplies it. Next source action: read Poonen Section 9.2 (Conjecture 9.2.27) and Hindry-Silverman F.5.3 or Vojta's CIME notes for the statement of Vojta's conjecture. Reviewer (REVIEW-EXT-13-EXT-07B): for genus zero, Poonen Exercise 4.5 poses the local-global principle for nice genus-0 curves as an exercise (see the RP.2 acceptance gap); no worked example with a proof is available."
  },
  {
   "title": "Silverman-based nodes could not be verified by independent review: no public copy of The Arithmetic of Elliptic Curves",
   "neededBy": [
    "HeightsRationalPointsAndObstructions:RP.0",
    "HeightsRationalPointsAndObstructions:RP.1",
    "HeightsRationalPointsAndObstructions:RP.4",
    "HeightsRationalPointsAndObstructions:RP.6",
    "HeightsRationalPointsAndObstructions:RP.0/absolute-height-on-projective-space-and-its-invariance",
    "HeightsRationalPointsAndObstructions:RP.0/height-comparison-under-a-morphism-of-projective-spaces",
    "HeightsRationalPointsAndObstructions:RP.0/height-growth-under-translation-and-multiplication-by-m",
    "HeightsRationalPointsAndObstructions:RP.0/heights-of-roots-versus-coefficients-of-a-polynomial",
    "HeightsRationalPointsAndObstructions:RP.0/heights-on-an-elliptic-curve-attached-to-functions",
    "HeightsRationalPointsAndObstructions:RP.0/neron-tate-canonical-height-as-a-tate-limit",
    "HeightsRationalPointsAndObstructions:RP.0/northcott-finiteness-of-points-of-bounded-height-and-degree",
    "HeightsRationalPointsAndObstructions:RP.0/properties-of-the-canonical-height-parallelogram-law-and-torsion",
    "HeightsRationalPointsAndObstructions:RP.0/quasi-parallelogram-law-for-heights-from-even-functions",
    "HeightsRationalPointsAndObstructions:RP.1/canonical-height-is-positive-definite-on-the-mordell-weil-lattice",
    "HeightsRationalPointsAndObstructions:RP.1/complete-2-descent-map-for-full-rational-2-torsion",
    "HeightsRationalPointsAndObstructions:RP.1/descent-theorem-for-abelian-groups-with-a-height-function",
    "HeightsRationalPointsAndObstructions:RP.1/descent-via-two-isogeny-with-worked-example-y2-equals-x3-minus-6x2-plus-17x",
    "HeightsRationalPointsAndObstructions:RP.1/kummer-extension-is-abelian-of-exponent-m-and-unramified-outside-S",
    "HeightsRationalPointsAndObstructions:RP.1/kummer-pairing-and-the-kummer-sequence",
    "HeightsRationalPointsAndObstructions:RP.1/maximal-abelian-exponent-m-extension-unramified-outside-S-is-finite",
    "HeightsRationalPointsAndObstructions:RP.1/mordell-weil-theorem-for-elliptic-curves-over-number-fields",
    "HeightsRationalPointsAndObstructions:RP.1/selmer-and-shafarevich-tate-groups-of-an-isogeny",
    "HeightsRationalPointsAndObstructions:RP.1/selmer-upper-bounds-versus-the-rank-and-the-shafarevich-tate-obstruction",
    "HeightsRationalPointsAndObstructions:RP.1/weak-mordell-weil-descends-from-a-finite-galois-extension",
    "HeightsRationalPointsAndObstructions:RP.1/weak-mordell-weil-theorem-for-elliptic-curves",
    "HeightsRationalPointsAndObstructions:RP.1/worked-complete-2-descent-for-y2-equals-x3-minus-12x2-plus-20x",
    "HeightsRationalPointsAndObstructions:RP.4/finiteness-of-the-s-unit-equation-via-roth",
    "HeightsRationalPointsAndObstructions:RP.4/roth-theorem-in-distance-function-form-on-curves",
    "HeightsRationalPointsAndObstructions:RP.4/siegel-finiteness-for-genus-one-curves-and-arbitrary-functions",
    "HeightsRationalPointsAndObstructions:RP.4/siegel-integral-points-on-hyperelliptic-curves-via-the-s-unit-equation",
    "HeightsRationalPointsAndObstructions:RP.4/siegel-theorem-for-elliptic-curves",
    "HeightsRationalPointsAndObstructions:RP.6/conjectural-frontier-register-for-rational-points",
    "HeightsRationalPointsAndObstructions:RP.6/worked-examples-by-dimension-and-genus-with-proved-conclusions"
   ],
   "detail": "REVIEW-EXT-13-EXT-07B (2026-09-24) could not re-read Silverman AEC (2nd ed., 2009): the maintainer's library copy was unavailable to the reviewer, and the author's page offers only front matter, bibliography, a list of changes and an errata list. The 29 nodes listed here (all nine RP.0 nodes, thirteen RP.1 nodes, five RP.4 nodes, and the Silverman parts of two RP.6 register nodes) and the links between them are unverified: their statements, hypotheses, proof steps, locators and excerpts rest on the drafter's reading alone. The reviewer used the public table of contents (section start pages confirmed) and the author's errata list for the 2015 printing, whose entries for pp. 216, 219, 225, 232, 238, 275, 311-313, 317, 334 and 336-338 were added to the nodes. That list omits misprints already corrected in 2015, so it neither confirms nor refutes the three misprints this packet reports in the 2009 printing: Proposition VIII.5.4(c) (exponent), Example X.4.5.1 (S^(2) = (Z/2Z)^2 where (Z/2Z)^3 is forced by the Conclusion of Example X.1.5; the reviewer's arithmetic supports (Z/2Z)^3) and Proposition X.4.9 (a^2 - b for a^2 - 4b; the errata's quotation of the Example 4.8 text on p. 336 has a^2 - 4b). Next action: a maintainer with the library copy re-checks these nodes against the printed pages, in particular the three claimed misprints, and the two cross-reference slips ((VIII.2.1) for (VIII.1.2), (VIII.6.2) for (VIII.6.3))."
  }
 ],
 "coverage": [
  {
   "stageId": "HeightsRationalPointsAndObstructions:RP.0",
   "status": "partial",
   "remaining": [
    "Heights attached to line bundles and divisors on general projective varieties modulo bounded functions, with pullback and tensor laws (Weil height machine): no source read.",
    "Neron-Tate heights on abelian varieties for symmetric ample line bundles, and local (Neron) heights with their comparison: only the elliptic-curve Tate construction read (Silverman VIII.9).",
    "Extension formula and product formula (Silverman 5.2-5.3) imported from LI.4 without proof; the SF.5 and A6 inputs named by the atlas are not used by the sources read.",
    "Ampleness requirements for Northcott on general varieties are not in the sources read.",
    "All nine RP.0 nodes rest on Silverman AEC and are unverified by independent review (REVIEW-EXT-13-EXT-07B: library copy unavailable, no authorized public copy); re-check against the printed book."
   ]
  },
  {
   "stageId": "HeightsRationalPointsAndObstructions:RP.1",
   "status": "partial",
   "remaining": [
    "The height part of Mordell-Weil for abelian varieties (Serre, Lectures on the Mordell-Weil theorem, 4.3), and fppf descent when n meets the residue characteristic: unread.",
    "Silverman imports III.4.5, III.8 (Weil pairing), VII.3.1, VII.3.5, VII.7.2, X.3 (homogeneous spaces) and Appendix B: unread.",
    "Poonen imports for torsor finiteness (Borel-Serre, Lang, Hermite variant, Theorem 6.5.10): unread; Remark 8.4.7 (Selmer sets effectively computable) has no proof.",
    "The atlas input ArithmeticGaloisDuality R02.6 is not used by any source read for this stage.",
    "Cassels pairing (Theorem X.4.14) and finiteness of Sha for specific curves (Kolyvagin, Rubin) cited only.",
    "Thirteen Silverman-based RP.1 nodes are unverified by independent review (no public copy), including the two worked 2-descents and the claimed misprints in Example X.4.5.1 and Proposition X.4.9; the five Poonen-based nodes were verified."
   ]
  },
  {
   "stageId": "HeightsRationalPointsAndObstructions:RP.2",
   "status": "partial",
   "remaining": [
    "Brauer groups of schemes (Poonen Sections 6.6-6.9: purity, residues, spreading out, Br of local rings) and the reciprocity sequence: unread imports.",
    "Proofs of Proposition 8.1.8 and Corollaries 8.1.9-8.1.10 (Exercise 8.1) and the Hensel computation X(A) nonempty for Iskovskikh's surface: not in the source.",
    "Acceptance: no conic example read; effective Brauer-Manin tests for a specified finite subgroup only in principle (Remark 8.2.12), no algorithm (Kresch-Tschinkel unread).",
    "Conic example: Poonen Exercise 4.5 (genus-0 local-global principle) is an exercise without proof; a written proof or another source is needed."
   ]
  },
  {
   "stageId": "HeightsRationalPointsAndObstructions:RP.3",
   "status": "partial",
   "remaining": [
    "Twist descriptions and closedness of descent sets are Exercise 8.7, unproved in the source.",
    "Theorem 8.5.4 inclusions from Skorobogatov 2009, Stoll 2007, Demarche 2009 and Harari 2002; Cao 2017; Skorobogatov 1999; Harari-Skorobogatov 2002: cited, unread.",
    "Descent sets for torsors under general linear algebraic groups with stabilizers, and finiteness of relevant twist classes beyond Theorem 8.4.6 / 6.5.13: no further source read.",
    "Corollary 6.6.19 (Brauer classes from PGL_n-torsors) and Lemma 3.5.57, Theorem 7.7.1 (Lang-Weil) used by Minchev: unread.",
    "Exercise 8.7 (twist description and closedness of descent sets) is posed only over number fields, although Section 8.4.7 states the facts over global fields."
   ]
  },
  {
   "stageId": "HeightsRationalPointsAndObstructions:RP.4",
   "status": "partial",
   "remaining": [
    "Parshin construction inputs not written in Faltings: existence of the unramified cover, generalized Jacobian and [2]-pullback, bad reduction and genus of Y(x), de Franchis finiteness; Parshin 1968 unavailable; duplication with the Faltings packet Satz 7 node unresolved.",
    "Siegel's theorem for general affine curves (genus >= 1, and genus 0 with >= 3 points at infinity) and its exact boundary conditions: cited only (Hindry-Silverman D.9.1, Lang Chapter 8).",
    "Roth's theorem over number fields with arbitrary absolute values: imported (DT.1/DT.2 supplier request).",
    "Effective S-unit bounds (Silverman IX.5) and Evertse's count: unread / quoted.",
    "The five Silverman-based RP.4 nodes (Roth and distance functions, Siegel for elliptic and genus-one curves, the S-unit equation, Siegel for y^2 = f(x)) are unverified by independent review (no public copy); the Faltings and Poonen nodes were verified on the public GDZ scan and the author PDF."
   ]
  },
  {
   "stageId": "HeightsRationalPointsAndObstructions:RP.5",
   "status": "partial",
   "remaining": [
    "Mordell-Lang (Faltings 1991/1994, Vojta, McQuillan, Hrushovski) and intersections with finitely generated subgroups: no source read.",
    "Manin-Mumford over general characteristic-0 fields (Raynaud 1983, specialization): unread; only Zhang Corollary 4 over number fields, stated without proof.",
    "Arakelov imports: Zhang 1995 successive minima and adelic metrics, Zhang 1995 JAMS Theorem 5-2, arithmetic Hilbert-Samuel, Gillet-Soule intersection theory, Zhang 1993 admissible pairing (in library, unread); no atlas stage owns arithmetic intersection theory on arithmetic varieties.",
    "Asserted steps in Zhang 1998 (stabilizer reduction equivalence, measure comparison, Corollaries 1, 2, 4) need proofs.",
    "Zhang's theorem of successive minima is printed with a degenerate indexing (dim Y = i); the correct form, and the embedding hypothesis of Theorem 2.1 for X^m and alpha_m(X^m), must be checked against Zhang 1995 (JAG) before the Bogomolov proof is executable."
   ]
  },
  {
   "stageId": "HeightsRationalPointsAndObstructions:RP.6",
   "status": "partial",
   "remaining": [
    "Genus-zero worked example and Vojta's conjecture statement: no source read.",
    "Certified enumeration interface: owned by EffectiveDiophantineMethods (separate packet), not decomposed here.",
    "Transfer of finiteness through Jacobian embeddings: only Poonen Theorem 5.7.6 (proof cited to Milne) read; the Abel-Jacobi embedding itself belongs to SF.3/JacobianChallenge.",
    "Poonen Section 9.2 is unread; Conjecture 9.2.27 itself (Colliot-Thelene, rationally connected varieties) was read by the reviewer and added to the register.",
    "The genus-one entries of the worked-example register rest on Silverman and are unverified by independent review."
   ]
  }
 ],
 "sources": [
  {
   "id": "silverman-arithmetic-of-elliptic-curves-2009",
   "title": "The Arithmetic of Elliptic Curves",
   "authors": "Joseph H. Silverman",
   "edition": "Second edition, Graduate Texts in Mathematics 106, Springer 2009 (DOI 10.1007/978-0-387-09494-6). Copy inspected: the supplied library copy (catalogue record WEIL-PRIVATE-SILVERMAN2009, a user-supplied private copy; not redistributed), 522 PDF pages. Page numbers below are printed page numbers; the PDF offset varies by chapter (printed = PDF - 15 in Chapter VIII, PDF - 14 in Chapter IX, PDF - 13 in Chapter X). The text layer drops relation symbols (for example it renders the printed \"not equal\" signs as \"=\"), so every relation used below was read on page images.",
   "url": "https://doi.org/10.1007/978-0-387-09494-6",
   "sha256": "72ee67bfa1e3fdf582ac7e4b032d7ca0b35a168ed6443ac39c121fbb788cab25",
   "readSections": [
    "VIII.1 The weak Mordell-Weil theorem (Theorem 1.1, Lemma 1.1.1, Proposition 1.2 with the Kummer pairing, Remark 1.3, Propositions 1.4-1.6, Remarks 1.7-1.8, all proofs), pp. 208-215",
    "VIII.2 The Kummer pairing via cohomology (Kummer sequence, Proposition 2.1, Proposition 2.2), pp. 215-217",
    "VIII.3 The descent procedure (Theorem 3.1 with proof, Remark 3.2), pp. 218-220",
    "VIII.4 The Mordell-Weil theorem over Q (Lemma 4.2, Sublemma 4.3, proof of Theorem 4.1), pp. 220-224",
    "VIII.5 Heights on projective space (standard absolute values, extension and product formulas 5.2-5.3, Proposition 5.4, Remark 5.5, Theorem 5.6, Remark 5.7, Corollary 5.8, Theorems 5.9-5.11, Remark 5.12, all proofs), pp. 224-234",
    "VIII.6 Heights on elliptic curves (Proposition 6.1, Theorem 6.2, Lemma 6.3, Corollary 6.4, Remarks 6.5-6.6, Theorem 6.7, all proofs), pp. 234-239",
    "VIII.9 The canonical height (Proposition 9.1, Theorem 9.3, Remark 9.4, Lemma 9.5, Proposition 9.6, regulator, Corollary 9.7, Conjecture 9.9, Theorem 9.10 statement), pp. 247-253; VIII.10 opening and Conjectures 10.1-10.2, pp. 254-255",
    "IX introduction and IX.1-IX.2 (Propositions 1.2-1.3, Roth Theorem 1.4 as stated, Example 1.5, Remark 1.6, distance functions, Propositions 2.2-2.3, Corollary 2.4, with proofs), pp. 269-276",
    "IX.3 Siegel's theorem (Theorem 3.1, Corollaries 3.2.1-3.2.2, Example 3.3, Remark 3.4, Conjecture 3.5, Theorem 3.6 statement, proof of Theorem 3.1), pp. 276-281",
    "IX.4 The S-unit equation (Theorem 4.1 with its ineffective proof sketch, Remarks 4.2.1-4.2.2, Theorem 4.2.3 statement, Theorem 4.3 with proof, Corollary 4.3.1), pp. 281-286",
    "X.1 An example (Theorem 1.1 with proof, Remarks 1.2-1.3, Proposition 1.4, Example 1.5 with Table 10.1), pp. 310-317",
    "X.4 The Selmer and Shafarevich-Tate groups (definitions, Remarks 4.1.1-4.1.2, Theorem 4.2, Lemma 4.3, Corollary 4.4, Remark 4.5, Example 4.5.1, Proposition 4.6, Remark 4.7, Example 4.8, Proposition 4.9, Remarks 4.9.1-4.9.2, Example 4.10, Remark 4.11, Proposition 4.12, Conjecture 4.13, Theorem 4.14 statement), pp. 331-341",
    "Page images checked for pp. 212, 218, 224, 226, 237, 248, 249, 275, 276, 284, 317, 335 and 337",
    "REVIEW-EXT-13-EXT-07B (2026-09-24): the book could not be re-read. The supplied library copy was not available to the reviewer, and no authorized public copy exists: the author's page https://www.math.brown.edu/johsilve/AECHome.html offers only the preface, table of contents and introduction, the bibliography, a list of changes from the first edition and an errata list (copies of the full book on third-party sites were not used). Nodes and links resting only on this source are therefore recorded as unverifiable. Two public author documents were read instead: the table of contents (https://www.math.brown.edu/johsilve/AEC/AECPrefaceTOCIntro.pdf, SHA-256 86a784ef135191371d665e033d2ca065c86b168b52783a42b0228d56e39a85f4), which confirms the section start pages used in the locators (VIII.5 p. 224, VIII.6 p. 234, VIII.9 p. 247, VIII.10 p. 254, IX.1 p. 270, IX.2 p. 273, IX.3 p. 276, IX.4 p. 281, X.1 p. 310, X.4 p. 331, X.5 p. 341); and the errata list (source silverman-aec-errata-2022 below), whose corrections for pp. 216, 219, 225, 232, 238, 275, 311-313, 317 and 336-338 were added to the affected nodes. The errata list covers the second printing (2015) and omits misprints already corrected in that printing, so it can neither confirm nor refute the three misprints this packet reports for the 2009 printing (VIII.5.4(c), Example X.4.5.1, Proposition X.4.9)."
   ]
  },
  {
   "id": "silverman-aec-errata-2022",
   "title": "Errata, Corrections, and Addenda to The Arithmetic of Elliptic Curves, 2nd Edition, 2nd Printing (2015)",
   "authors": "Joseph H. Silverman",
   "edition": "Author's errata list dated October 13, 2022 (36 pages), from the book's home page; it omits errata already corrected in the second printing. Fetched by REVIEW-EXT-13-EXT-07B on 2026-09-24.",
   "url": "https://www.math.brown.edu/johsilve/AEC/AECErrata.pdf",
   "sha256": "6c2274403a32af5d4b075c1504a1aaa04c9b304c0f94b8dd337f9c72d51f6f34",
   "readSections": [
    "REVIEW-EXT-13-EXT-07B (fetched 2026-09-24): all entries for pages 197-345 (Chapters VII-X), pp. 23-29 of the errata list; entries for pp. 219, 225, 232, 238, 311-313 and 317 read on page images"
   ]
  },
  {
   "id": "poonen-rational-points-on-varieties",
   "title": "Rational points on varieties",
   "authors": "Bjorn Poonen",
   "edition": "Graduate Studies in Mathematics 186, American Mathematical Society 2017. Copy inspected: the author's PDF from his MIT web page (not in the supplied library), 348 PDF pages, created 18 December 2018, every page watermarked \"Unofficial version for incidental online use\"; the title page asks readers whose use is more than incidental to buy the official version. Printed page = PDF page - 14. Page numbers below are printed page numbers.",
   "url": "https://math.mit.edu/~poonen/papers/Qpoints.pdf",
   "sha256": "42e92ce4599420f6b72139e78cb9f5230e4bf81258c202e7cee4716887353579",
   "readSections": [
    "Section 5.7 Abelian varieties (Definition 5.7.1 to Remark 5.7.34, including Proposition 5.7.4, Theorem 5.7.6, Remark 5.7.9, Warning 5.7.10, Theorem 5.7.31 with its sketch, Conjectures 5.7.32-5.7.33), pp. 138-146",
    "Section 5.12 statements used: Theorem 5.12.24 and Theorem 5.12.29 with their cited proofs, pp. 157-159",
    "Section 6.5 Example 6.5.12 and Section 6.5.7 (unramified torsors, Theorem 6.5.13 with its six-step proof), pp. 183-185",
    "Chapter 8 in full: 8.1 obstructions from functors, 8.2 Brauer-Manin obstruction (Propositions 8.2.1-8.2.2, 8.2.9, 8.2.14-8.2.15, Corollary 8.2.11, Section 8.2.6), 8.3 an example of descent, 8.4 descent (Theorems 8.4.1, 8.4.6, 8.4.9, 8.4.10, Proposition 8.4.2, Corollaries 8.4.8, 8.4.11), 8.5 comparison (Lemma 8.5.2, Proposition 8.5.3, Theorem 8.5.4 sketch, Theorem 8.5.5, Corollary 8.5.6), 8.6 insufficiency (Theorem 8.6.1 outline, Theorem 8.6.5 with Propositions 8.6.6-8.6.10, Theorem 8.6.12 sketch), exercises 8.1-8.7, pp. 227-255",
    "Section 9.5 Rational points on varieties of general type (Theorem 9.5.1, Remark 9.5.2, Examples 9.5.3-9.5.5, Definitions 9.5.6-9.5.8, Theorem 9.5.10, Conjectures 9.5.11-9.5.12), pp. 286-288",
    "Page images checked for pp. 241, 246 and 247",
    "REVIEW-EXT-13-EXT-07B (fetched 2026-09-24 from https://math.mit.edu/~poonen/papers/Qpoints.pdf; SHA-256 42e92ce4599420f6b72139e78cb9f5230e4bf81258c202e7cee4716887353579 matches this entry; printed page = PDF page - 14 confirmed): re-read every cited passage: Section 5.7 (pp. 138-146), Theorems 5.12.24, 5.12.29 with Warnings 5.12.25-5.12.27 (pp. 157-159), Sections 6.5.5-6.5.7 with Theorem 6.5.13 and its proof (pp. 181-185), Chapter 8 in full including Exercises 8.1-8.7 (pp. 227-255), Section 9.5 (pp. 286-288); additionally read Exercise 4.5 (p. 113: the local-global principle for nice genus-0 curves over a global field, set as an exercise) and Conjecture 9.2.27 (p. 267). Page images checked for pp. 183 (Example 6.5.12) and 240 (Theorem 8.4.1 and its proof)."
   ]
  },
  {
   "id": "faltings-1983-endlichkeitssaetze",
   "title": "Endlichkeitssaetze fuer abelsche Varietaeten ueber Zahlkoerpern",
   "authors": "Gerd Faltings",
   "edition": "Inventiones mathematicae 73 (1983), 349-366. Copy inspected: the supplied library copy (catalogue record ADD_FALTINGS83), a scanned journal offprint with an OCR text layer, 18 pages; same file and source id as in this job's FaltingsFinitenessAndIsogenyTheorems packet.",
   "url": "https://link.springer.com/article/10.1007/BF01388432",
   "sha256": "0b7fb3e505d5d63e3e6c5913daf15bd843488e59f80f8d5176b154ac8faa3fc2",
   "readSections": [
    "Section 3, Lemma 4 with its proof, and the preceding use of Lemma 4 in the proof of Satz 1, p. 357 (page image)",
    "Section 6, Korollar 1, Satz 7 with its proof, Bemerkungen 1-2, p. 365 (page image); reference [9] (Parshin) in the Literatur, p. 366",
    "REVIEW-EXT-13-EXT-07B (2026-09-24): the library copy was not available; the reviewer read the Goettingen digitization of the article instead, fetched 2026-09-24 from https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf (GDZ record PPN356556735_0073, LOG_0026; 19 pages = GDZ cover sheet + pp. 349-366; SHA-256 f72a869f4a050e6e4a435cc790f4ac2e47b61fcac35d564041b5f43d89c2f87a, a different scan from the library file hashed above). Read on page images: Lemma 4 with the preceding end of the proof of Satz 1 (p. 357); Korollar 1, Satz 7 with proof and Bemerkungen 1-2 (p. 365, 'vom Grad m>2' confirmed at 300 dpi); Literatur [9] = Parshin, Algebraic curves over function fields I, Math. USSR Izv. 2 (1968), and the 'Zusatz bei der Korrektur' (p. 366)."
   ]
  },
  {
   "id": "zhang-1998-equidistribution-small-points",
   "title": "Equidistribution of small points on abelian varieties",
   "authors": "Shou-Wu Zhang",
   "edition": "Annals of Mathematics 147 (1998), 159-165 (received June 26, 1996). Copy inspected: a JSTOR scan of the published article (8 pages including the JSTOR cover sheet, no text layer), linked from the author's publication list https://web.math.princeton.edu/~shouwu/publications.pdf; read on page images.",
   "url": "https://web.math.princeton.edu/~shouwu/publications/bogomolov.pdf",
   "sha256": "023ecdf2d096aa340a646201ad765b29dcf3092710d8aca03fce11910931bfe2",
   "readSections": [
    "Section 1 Main theorem and consequences (definitions, Theorem 1.1, Corollaries 1-4), pp. 159-161",
    "Section 2 The equidistribution theorem for generic small points (theorem of successive minima as quoted, Theorem 2.1 with proof), pp. 161-163",
    "Section 3 A geometric lemma (Lemma 3.1 with proof), p. 163",
    "Section 4 Proof of Theorem 1.1 (Lemma 4.1, proof of the generalized Bogomolov conjecture, proof of Theorem 1.1), pp. 163-165; references, p. 165",
    "REVIEW-EXT-13-EXT-07B (fetched 2026-09-24 from the URL above; SHA-256 023ecdf2d096aa340a646201ad765b29dcf3092710d8aca03fce11910931bfe2 matches; PDF page 1 is the JSTOR cover sheet, PDF page n+1 = printed page 158+n): the whole article re-read on page images (pp. 159-165 and references); zoomed images for the successive-minima definition (pp. 161-162) and for the cross-reference 'By Lemma 3.1' in the proof of the generalized Bogomolov conjecture (p. 164)."
   ]
  },
  {
   "id": "ullmo-1998-positivite-discretion",
   "title": "Positivite et discretion des points algebriques des courbes",
   "authors": "Emmanuel Ullmo",
   "edition": "arXiv:alg-geom/9606017v1, submitted 27 June 1996, 16 pages (the arXiv-generated PDF is dated August 31, 2018). Published in Annals of Mathematics 147 (1998), per reference [6] of Zhang 1998; the published version was not inspected.",
   "url": "https://arxiv.org/abs/alg-geom/9606017",
   "sha256": "d273b998899882134cb1e3eff3bc1950d3e08c7ad5767f667cb9c226b604acf8",
   "readSections": [
    "Section 1 Introduction (Theoreme 1.1, Theoreme 1.2), pp. 1-2",
    "Section 2 Arakelov preliminaries (2.1 heights, Lemme 2.1, Lemme 2.2; 2.2 Theoreme 2.3 as quoted, Theoreme 2.4 with proof), pp. 2-8",
    "Section 3 Generic sequences of small points on X^g (Proposition 3.1, Lemme 3.2, with proofs), pp. 8-11",
    "Section 4 Proof of Theoreme 1.1 (Lemmes 4.1-4.4 and the final contradiction), pp. 11-14; references, pp. 15-16",
    "REVIEW-EXT-13-EXT-07B (fetched 2026-09-24 from https://arxiv.org/pdf/alg-geom/9606017v1; SHA-256 d273b998899882134cb1e3eff3bc1950d3e08c7ad5767f667cb9c226b604acf8 matches; the file has a text layer): whole preprint re-read, including the proof of Theoreme 2.4 (which invokes Theorem 5-2 of Zhang, Positive line bundles on arithmetic varieties, JAMS 1995, reference [16]) and the references (pp. 15-16)."
   ]
  },
  {
   "id": "szpiro-ullmo-zhang-1997-equirepartition",
   "title": "Equirepartition des petits points",
   "authors": "L. Szpiro, E. Ullmo and S. Zhang",
   "edition": "Inventiones mathematicae 127 (1997), 337-347 (Oblatum 9-X-1995 and 15-V-1996). Copy inspected: the PDF linked from the author's publication list https://web.math.princeton.edu/~shouwu/publications.pdf. Correction (REVIEW-EXT-13-EXT-07B): the file is not a scan; it is an 11-page typeset PDF with a text layer (producer Acrobat Distiller 2.1 for Power Macintosh, created 2 January 1997), carrying the journal header 'Invent. Math. 127, 337-347 (1997)' and printed page numbers 338-347; PDF page n = printed page 336+n.",
   "url": "https://web.math.princeton.edu/~shouwu/publications/SUZ.pdf",
   "sha256": "1cf79d5c3216c47a884a028ac43746863cb21fdb7a3bd0d3918ee6f06e7b14ca",
   "readSections": [
    "Section 1 Introduction (Theoreme 1.1, conjectures C-1 to C-3, Theoreme 1.2, Corollaires 1.3-1.4 with proof), pp. 337-341",
    "Section 2 Arakelov preliminaries (arithmetic varieties, heights, Proposition 2.1), pp. 341-342",
    "Section 3 Equidistribution of small points (Theoreme 3.1 with proof), pp. 342-344",
    "Section 4 Geometric and canonical heights (cubist structures, adelic construction, Proposition 4.1 with proof), pp. 344-347; references, p. 347",
    "REVIEW-EXT-13-EXT-07B (fetched 2026-09-24 from the URL above; SHA-256 1cf79d5c3216c47a884a028ac43746863cb21fdb7a3bd0d3918ee6f06e7b14ca matches): whole article re-read from the text layer (pp. 337-347 with references); notation checked against the typeset pages."
   ]
  }
 ],
 "other": {
  "summary": "This packet decomposes the rational-points programme from six primary sources. Two come from the supplied library: Silverman, The Arithmetic of Elliptic Curves (2nd ed., VIII.1-VIII.6, VIII.9, IX.1-IX.4, X.1, X.4), and Faltings 1983 (Lemma 4 and Satz 7). Four are authorized public copies fetched for this job: Poonen, Rational points on varieties (Sections 5.7, 6.5.7, Chapter 8, Section 9.5); Zhang, Equidistribution of small points on abelian varieties (Annals 1998); Ullmo, Positivite et discretion des points algebriques des courbes (arXiv alg-geom/9606017); and Szpiro-Ullmo-Zhang, Equirepartition des petits points (Invent. Math. 1997). RP.0 covers heights on projective space, Northcott, heights on elliptic curves and the Neron-Tate height (elliptic case only). RP.1 covers the Kummer-theory weak Mordell-Weil theorem, the descent theorem, Mordell-Weil for elliptic curves, positive definiteness of the height pairing, torsor evaluation, finiteness of H^1_S and of Selmer sets, weak Mordell-Weil for abelian varieties, Selmer/Sha sequences, and two worked 2-descents (y^2 = x^3 - 12x^2 + 20x, y^2 = x^3 - 6x^2 + 17x). RP.2 covers F-obstruction sets, the Brauer-Manin pairing and reciprocity, local constancy, Iskovskikh's obstructed surface and a quadric bundle with nonempty Brauer set but no rational points. RP.3 covers descent sets, Minchev, Br = PGL-descent, etale-Brauer = descent (sketch), Cao's iteration theorem and insufficiency of all these obstructions. RP.4 covers the Parshin reduction with uniform field control, Siegel for elliptic and genus-one curves via Roth, and the S-unit route. RP.5 covers equidistribution, Zhang's Bogomolov theorem and Ullmo's curve case. RP.6 records the frontier register, the function-field analogue, Jacobian points and worked examples. Corrections reported by the drafter in the 2009 printing of Silverman: Proposition VIII.5.4(c) (exponent), Example X.4.5.1 (the 2-Selmer group is (Z/2Z)^3, not (Z/2Z)^2) and Proposition X.4.9 (a^2 - 4b, not a^2 - b); the independent review (REVIEW-EXT-13-EXT-07B) had no copy of the book and could not confirm them, and every node resting only on Silverman is recorded as unverified. All stages remain partial: the general height machine, Mordell-Lang, Roth and Siegel in general, the Brauer-group chapters, Arakelov intersection theory and the cited comparison theorems are unread imports."
 }
}
```

</details>

<details><summary><code>InverseGaloisAndArithmeticFundamentalGroups.json</code></summary>

```json
{
 "packet": "research/expansion/external/EXT-07/InverseGaloisAndArithmeticFundamentalGroups.json",
 "review": {
  "status": "accepted",
  "reviewer": "independent-review-REVIEW-EXT-13-EXT-07B",
  "date": "2026-09-24",
  "notes": "Independent review of all 27 nodes and 44 drafted links against the five public sources, re-fetched on 2026-09-24 into the reviewer's scratch area; all five SHA-256 hashes equal the recorded ones (SGA 1 arXiv math/0206203v2; Debes notes V2-ArithRevDte-v2.pdf; NSW electronic edition 2.3, whose PDF is served only with the author page as referrer; Romagny-Wewers author copy; Debes arXiv 2601.06532v2). Text extracted with PyMuPDF; the formulas that nodes depend on were checked on page images (SGA 1 p. 114, Proposition V 6.11; Debes pp. 217-218, Lemme 8.2.6). Every statement, hypothesis list, proof step, acceptance item, locator and excerpt was compared with the cited passage; all 41 drafted excerpts are literal up to dropped accents, transliterated notation and one elided equation number; one excerpt was added (Debes p. 232, Weissauer footnote). Nodes: 18 verified, 9 corrected, 0 unverifiable. Main corrections: SGA 1 XII 4.6 is GAGA for finite covers, not the Grauert-Remmert theorem, and XII 5.1's proof uses Hironaka, XII 2.6, 4.6 and 5.3 (G_m and Riemann-existence nodes); X 3.8 uses purity 3.1 in general (unproved in SGA 1), with the two-dimensional case sufficing only for 3.10, and Abhyankar's lemma is proved in the text; the missing hypotheses of XIII 2.11, of V 7 (S' connected locally noetherian), of X 3.8 (geometrically connected fibres) and of Debes 8.1 (t in U_r(k), Remarque 6.1.11) were restored; Debes Corollaire 6.1.13 is the conjugation rule, and the branch cycle lemma is Corollaire 6.1.18; the Weissauer exception concerns k_0((X_1, ..., X_n)) with n >= 2; the NSW 9.6.7 proof steps were rewritten after the reviewer read steps 2-3; SGA 1 XIII p. 292 does state Abhyankar's conjecture and its proof by Raynaud and Harbater. Recorded source misprints: SGA 1 V 6.11 inclusion signs; Debes Lemme 8.2.6(b) g_1 has determinant 5. Links: 30 kept (2 with page corrections: Romagny-Wewers Theorem 4.11 is on p. 328), 8 annotated (IX 6.1 cites only V 6.13; V 8.2 -> Debes 6.2.1 and Debes 6.2.1 -> 5.2.14 are comparisons or shared constructions, not inputs; SF.2 and LI.4 scopes do not state the IG.0 inputs; C4 supplies the XII 2.6 connectedness step, not GAGA; LI.4 supplies Hoechsmann and cd_p inputs, not Poitou-Tate or Chebotarev), 4 re-pointed (DY.5 export now from the field node; PNT link from LI.4 to AnalyticNumberTheory:AN.2; the 5.2.14 link re-targeted to stage IG.4; R09.4 re-targeted to stage IG.5), 2 removed (X specialization -> XIII 2.12, a shared method; IG.3 abelian-groups node -> Shafarevich node, an acceptance example that created an unneeded stage edge IG.3 -> IG.4), 3 added (ComplexComparisonPartII:C2 -> Riemann existence for XII 4.6; Riemann existence -> the R(T)/abelian node for Debes 8.3.1; ArithmeticGaloisDuality:R02.4 -> NSW 9.6.7 for Poitou-Tate). 45 links now. New implied stage edges: AN.2 -> IG.2 and R02.4 -> IG.4 (not transitive in the atlas, acyclic); C2 -> IG.3 (transitive via C4). No stage or node cycle; every endpoint exists; every parentStageId is owned by the roadmap; all 7 coverage records name real stages and stay partial. Gaps: 8 -> 8, seven rewritten to name the imports found (Seifert-Threlfall, XIII 1.10-1.11, 2.8-2.10, 5.6, Debes 6.1.3.2, Remarque 9.1.2, 6.1.13/6.1.18/6.1.17, 6.2.3, projectivity of G_{Q^ab}, NSW 3.5.11, 3.8.8, 6.5.7, 9.1.9, 9.2.2, 9.2.9, 9.3.2, Romagny-Wewers Proposition 4.5) and the supplier-scope findings. The reviewer additionally read the proofs of Debes Lemme 9.2.2, NSW 9.6.7 steps 2-3, Romagny-Wewers Proposition 4.10 and Theorem 4.3, SGA 1 X section 3 and XIII 2.12 to its end; readSections record this. Packet status stays partial; implementationStatus stays unchecked.",
  "checked": [
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.0/galois-category-axioms-and-the-main-theorem",
    "verdict": "verified",
    "note": "SGA 1 V section 4 (printed pp. 98-104) read in full: axioms (G1)-(G6) on p. 98 match the statement; steps a)-n) match the proof steps (step c) cites Seminaire Bourbaki 195 prop. 3.1; step m) is \"Ane qui trotte\"); Theoreme 4.1 and Remarques 4.2 on p. 104; Definition 5.1 on p. 104. The acceptance item (C(pi) with the inclusion functor satisfies (G1)-(G6), fundamental pro-object = finite discrete quotients of pi) is stated on pp. 98 and 105. Both excerpts are literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.0/fibre-functors-are-isomorphic-and-exact-functors-are-continuous-homomorphisms",
    "verdict": "verified",
    "note": "SGA 1 V 5.2-5.11 and 6.1-6.13 (printed pp. 105-114) read in full. All statement clauses match (5.3-5.4, 5.7, 6.1-6.2, 6.4, 6.9, 6.10, 6.13 with \"La demonstration est laissee au lecteur\"). Added to the hypothesis on Proposition 6.11: as printed (checked on the page image of p. 114) its inclusion signs are interchanged and H' : C -> C'' should read C' -> C''; the packet's neutral wording was correct, and the content-level criteria are now stated. Excerpts literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.0/finite-etale-covers-form-a-galois-category-and-pi1-of-a-scheme",
    "verdict": "corrected",
    "note": "SGA 1 V section 7 (printed pp. 115-117) read in full: (G1)-(G6) with the citations I 4.6, V 3.4, 3.5, section 2 and 3.7 (p. 115); universal cover, pi_1(S, a) = Aut(F); connectedness criterion; principal covers via V 2.6(iii); path classes pi_1(S; a, a') across characteristics (pp. 115-116); pi_1(f; a') and the finite etale case (p. 116). Correction: the source requires S' connected locally noetherian for pi_1(f; a'); the hypothesis and the construction via the exact pullback functor were added to the statement. Excerpt literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.0/fundamental-group-of-a-field-and-of-a-normal-scheme",
    "verdict": "verified",
    "note": "SGA 1 V Propositions 8.1-8.2 with proofs (printed pp. 117-118) read: statements and proof steps match (8.1 via the algebraic closure k' and \"bien connu\" field-theory facts; 8.2 via I 10.1). The finite-field acceptance item (procyclic, Frobenius) is not in SGA 1 V 8; it is a check, and Debes Theoreme 6.2.1 proof (p. 173) states it. Excerpt literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.1/fundamental-group-of-the-punctured-line-over-an-algebraically-closed-field-of-characteristic-zero",
    "verdict": "corrected",
    "note": "SGA 1 XIII Corollaire 2.12 with its full proof (printed pp. 290-292) and XII 5.1-5.2 with proofs (pp. 251-254) read. The application g = 0, n = 2, p = 0 is correct: in characteristic 0 the proof computes pi_1(U) itself as the profinite completion of the topological group with the single relation, which for g = 0, n = 2 is Zhat. Corrections: (1) the hypothesis on XII 5.1 said it imports \"Grauert-Remmert extension (XII 4.6)\"; XII 4.6 is GAGA for finite covers, and the printed proof uses Hironaka resolution, local Kummer extension, Proposition 5.3 and 4.6, with Grauert-Remmert (5.4) named only as the older alternative (p. 255); (2) the characteristic-0 proof also imports Seifert-Threlfall [XIII ref. 3, ch. 7 §47] for the topological presentation, now named (also added to the gaps). Kummer identification of the Z/nZ covers remains correctly flagged as unread. Excerpts literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.1/fundamental-exact-sequence-over-a-field",
    "verdict": "verified",
    "note": "SGA 1 IX Theoreme 6.1 with proof, Corollaire 6.2 with its N.B., Remarque 6.3, Corollaire 6.4 (printed pp. 195-196) read: hypotheses (A artinian, X_0 quasi-compact and geometrically connected), the reductions to A = k and to k perfect via 4.11, the principal covers X_i via 3.4, V 6.13, the limit left to the reader, the splitting at a rational or radicial point, and the counterexample remark (affine line in characteristic p) all match. Excerpt literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-sequence-for-the-punctured-projective-line-and-its-sections",
    "verdict": "verified",
    "note": "Debes notes section 6.2.1 (printed pp. 171-173) read: definition of Omega_t and of the k- and k^s-fundamental groups (pp. 171-172, footnote 11 defining U_r(k)), the exact sequence, Theoreme 6.2.1 with all three cases of its proof, and Lemme 6.2.2 with proof. Statement and proof steps match. Added: the Lemme 6.2.2 proof also invokes section 6.1.3.2 (roots of the minimal polynomial of an element unramified at t_0 lie in k^s((T - t_0))), an unread input now named in the hypotheses and gaps. Excerpt literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.1/homotopy-exact-sequence-for-proper-separable-morphisms-and-base-change-invariance",
    "verdict": "verified",
    "note": "SGA 1 X Definition 1.1 to Remarques 1.10 (printed pp. 201-205) read: Proposition 1.2 sketched with footnote to EGA III 7.8.10 (i); Theoreme 1.3 and proof (uses 1.2, I 4.8, IX 3.4, V 6.9); Corollaire 1.4 via IX 3.4, V 6.9, V 6.11; Remarques 1.5 (first comparison theorem); Corollaires 1.7-1.9 with proofs; Remarques 1.10 (Lang-Serre; the Artin-Schreier family). Statement and proof steps match. Excerpt literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.1/specialization-homomorphism-surjectivity-and-prime-to-p-isomorphism",
    "verdict": "corrected",
    "note": "SGA 1 X sections 2-3 (printed pp. 206-217) read in full: 2.1 (translation of IX 1.10), 2.2-2.4 with proofs, Remarques 2.5 (degenerate elliptic curves: pi_1 = Zhat, e, e), 2.6 with its transcendental derivation (footnote 3), 2.7-2.13, purity 3.1-3.3 (recalled), 3.4-3.7, Abhyankar's lemma 3.6 with proof, 3.8-3.10, 3.11. Corrections: (1) the hypothesis attributed to 3.8 only the two-dimensional unequal-characteristic case of purity; 3.8 uses purity 3.1/3.3 in general (unproved in SGA 1; SGA 2 X 3.4), and the two-dimensional case suffices only for 3.10 (Remarques 3.11); Abhyankar's lemma is proved in the text, not imported; (2) 3.8 requires geometrically connected fibres, now in the statement. Excerpts literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.1/tame-fundamental-group-of-a-punctured-curve-with-inertia-generators",
    "verdict": "corrected",
    "note": "SGA 1 XIII Lemme 2.11 with proof and Corollaire 2.12 with its full proof (printed pp. 290-292) read. The main statement matches the source literally. Corrections: (1) the clause on Lemme 2.11 omitted all its hypotheses (proper finitely presented f, relative normal-crossings divisor, compatible geometric points); now stated; (2) the proof of 2.11 rests on XIII 5.6 (unread), now named; (3) the characteristic-p proof ends on p. 292 and also uses XIII 1.11; the hypothesis now says so. Excerpt literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.2/hilbertian-fields-and-hilbertian-subsets",
    "verdict": "corrected",
    "note": "Debes pp. 135-136 read (Theoreme 5.2.1, the definition of H_{P_1..P_n}, Definition 5.2.2 with its explicit Zariski-density reformulation, Remarque 5.2.3, Theoreme 5.2.4 discussion) and pp. 231-232 (chapter 9 opening, Exemple 9.0.1, footnote 1). Statement matches. Correction: the Weissauer exception was stated for k_0((X_1, ..., X_n)) without restriction, although kappa((x)) (n = 1) is non-Hilbertian on the same page; the hypothesis now records n >= 2 and the locator of the footnote. The source excerpt was checked; a second source entry for pp. 231-232 was added."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.2/hilbert-irreducibility-for-q-by-the-hilbert-dorge-method",
    "verdict": "verified",
    "note": "Debes section 5.2.2-5.2.3 (printed pp. 136-143) read in full: Proposition 5.2.5 and proof, Exemple 5.2.6, Lemme 5.2.7 with both arguments, Remarque 5.2.8, Theoreme 5.2.9, Remarque 5.2.10 (PNT, O(sqrt B) via [Lan83], [Deb01]), reduction to one absolutely irreducible monic P without root in Q(T), Lemmes 5.2.11-5.2.13 with proofs (Puiseux 6.1.1, Corollaire 2.4.4 or [FJ04, 2.3.5], implicit function theorem, Rolle, kappa = 1/(1 + alpha)). Statement, hypotheses and proof steps match; the result is for one parameter and one variable, as the node says. Excerpt literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.2/finite-extensions-of-hilbertian-fields-are-hilbertian",
    "verdict": "verified",
    "note": "Debes section 9.2.1 (printed pp. 242-245) read: Theoreme 9.2.1, the addendum (s = 1), the separable-case proof with its three points, Lemme 9.2.2 with its proof and Remarque 9.2.3; Remarque 9.1.2 (pp. 235-236) for the monic reduction. Statement and proof steps match; the purely inseparable case is correctly cited to [FJ04, 12.3.5]. Hypotheses updated: the Lemme 9.2.2 proof has now been read and the monic reduction is named. Excerpt literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.2/hilbert-specialization-of-a-galois-extension-of-k-t-with-full-group",
    "verdict": "verified",
    "note": "Debes section 5.2.4 (printed pp. 143-144) read: Proposition 5.2.14 with its direct proof (Lemme 1.4.2 for the specialization morphism, the finite exceptional set of poles of the f_i and zeros of the discriminant, Hensel lifts via Theoreme 1.3.12 or Lemme 2.6.4, the injective map s and the order count) and Remarque 5.2.15 (surjective r with r o s = Id, outside a finite set of t). Statement matches. Excerpt literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.3/riemann-existence-theorem-for-covers-of-the-punctured-sphere",
    "verdict": "corrected",
    "note": "Debes section 6.5 (printed pp. 181-185), Romagny-Wewers section 3.1-3.2 (pp. 318-320) and SGA 1 XII 5.1-5.3 with proofs (pp. 251-254) read. The Debes list of six equivalent categories, Proposition 6.5.2, Theoreme 6.5.3 (a)-(b) with footnote 16, the Romagny-Wewers Nielsen-class bijection (Theorem 3.1, \"For a proof, see e.g. [Voel96]\", algebraicity the substantial part) and XII 5.1 all match; the proof steps follow Debes's overview on pp. 181-182. Correction: the hypothesis described XII 4.6 as \"Grauert-Remmert\"; it is GAGA for finite covers of a proper C-scheme, and the proof of XII 5.1 also uses XII 2.6, descent along normalization and Proposition 5.3; the Grauert-Remmert theorem (XII 5.4) is only the older alternative. Excerpts literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.3/descent-criterion-and-branch-cycle-conditions",
    "verdict": "corrected",
    "note": "Debes section 8.1 (printed pp. 211-214) read in full: the standing assumptions of 8.1.1 (t in U_r(k); invariants over k^s and kbar identical, Remarque 6.1.11), Theoremes 8.1.1-8.1.2, conditions (*), (**), (***) with footnote 1, Remarque 8.1.3. Formulas match the page. Corrections: (1) the standing hypotheses t in U_r(k) and Remarque 6.1.11 were missing from the statement; added; (2) the hypothesis called Corollaire 6.1.13 \"the branch cycle lemma\"; 6.1.13 (p. 164) is the conjugation rule for invariants, and the source names Corollaire 6.1.18 (p. 170) the branch cycle lemma; both statements were read by the reviewer and the hypothesis rewritten. Excerpt literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.3/rigidity-criterion-for-regular-realizations-over-q",
    "verdict": "verified",
    "note": "Debes section 8.2.1 (printed pp. 214-215) read: Definition 8.2.1, sni(C_1, ..., C_r), Theoreme 8.2.2 with (H1)-(H3) and proof via (*), (**), (***), (H2), (H3), (H1) and Remarque 8.1.3, Remarque 8.2.3, Theoreme 8.2.4 with proof, Remarque 8.2.5 and the rigidity comment. Statement and proof steps match. Clarified that dropping (H1) (Remarque 8.2.5) is a statement over Q^ab, not over Q, and recorded the unproved projectivity of G_{Q^ab} as an import. Excerpt literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.3/rigid-realizations-of-symmetric-groups-and-psl2",
    "verdict": "verified",
    "note": "Debes section 8.2.2 (printed pp. 215-219) read: example 8.2.2.1 (S_n, n >= 3) with the rigidity argument, example 8.2.2.2 (classes 2A, 3A, pA, pB; Lemme 8.2.6 with proof of (a); the refinement with t_1 rational and t_2, t_3 conjugate over Q(sqrt D); the cases (2/p) = -1 or (3/p) = -1, attributed to Shih; the (7/p), (5/p) remark), example 8.2.2.3 (the Monster). Statement and proof steps match; lambda = -2 and -3 agree with the printed g_3. Added a note that the printed g_1 in Lemme 8.2.6(b) has determinant 5 (a sign misprint; checked on the page image). Excerpt literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.3/field-of-moduli-and-the-descent-obstruction",
    "verdict": "verified",
    "note": "Debes section 8.4 (printed pp. 225-229) read in full: definition of M(E) and the field of moduli, Proposition 8.4.1 with proof, Remarque 8.4.2 (closedness of M(E); change of base field), Proposition 8.4.3, section 8.4.1 with Proposition 8.4.4 and the list of split cases, Remarque 8.4.5 (Coombes-Harbater; projective G_k, cd <= 1), Corollaire 8.4.6. Romagny-Wewers section 4.2 (pp. 322-323) read: Definitions 4.1-4.2, Theorem 4.3 (field of definition finite separable over k_0; tameness necessary by SGA 1 X 1.10; proof deferred to section 4.4), Proposition 4.4, the H^2(k_m, Z_G) sentence. Statement and proof steps match. Excerpts literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.3/regular-inverse-galois-over-r-and-abelian-groups-over-q",
    "verdict": "verified",
    "note": "Debes section 8.2.3 (pp. 219-220) and section 8.3 (pp. 220-225) read in full: Theoreme 8.2.7 with proof (reduction to Q and cyclic groups, t_i = zeta^{g_i^{-1}}, varphi = 1), statement (*) of 8.3.1 via Theoreme 6.5.3 and the section s_{t0} of 6.2.1, Theoreme 8.3.1 (Hurwitz formulas) with proof, Theoreme 8.3.2 with proof, Theoreme 8.3.3 with proof. Statements and proof steps match. Added hypotheses: the printed proof of 8.3.3 establishes only the necessity direction of the stated equivalence; Proposition 6.2.3 is cited. Excerpt literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.4/embedding-problems-and-proper-solutions",
    "verdict": "verified",
    "note": "NSW III section 5 opening (printed pp. 189-190): Definition 3.5.1 (i)-(iii), the field-theoretic paragraph (proper solution gives L with G(L|k) = E; otherwise only a Galois algebra), Definitions 3.5.2-3.5.3, Proposition 3.5.4. Statement matches; the use of 3.5.9 (Hoechsmann) in the proof of 9.6.7 was confirmed (pp. 585, 588). The acceptance item on local embedding problems matches the IX section 5 introduction (p. 557). Excerpt literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.4/split-embedding-problems-with-nilpotent-kernel-over-global-fields",
    "verdict": "corrected",
    "note": "NSW IX section 6 read: the introduction and outline (pp. 574-576), Theorem 9.6.6 and the reduction to F(n)/F(n)(nu) (pp. 583-584), Theorem 9.6.7 with all four steps and the characteristic-p case (pp. 585-595; the reviewer also read steps 2-3, which the packet had marked unread). Statement matches the printed theorems, including conditions (i)-(ii) and the p = 2 footnote. Correction: the drafted proof steps merged steps 2-3 as \"local to global solvability and shrinking\" and described step 4 as restoring properness; the source's step 3 twists by a class epsilon to gain properness at the first step and control ramification, and step 4 uses Theorem 9.3.2 to obtain condition (ii) while an auxiliary set T^0 keeps properness. The steps were rewritten. Hypotheses now list every result cited in section 6 (3.5.6, 3.5.9, 3.5.11, 3.8.8, 6.1.4, 6.5.7, 9.1.9, 9.2.2, 9.2.6, 9.2.9, 9.3.2, Poitou-Tate) and record that Chebotarev (9.1.3) is not cited there. Excerpts literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.4/shafarevich-theorem-solvable-groups-over-global-fields",
    "verdict": "verified",
    "note": "NSW Theorem 9.6.1 and the section 6 introduction (pp. 574-575), Propositions 9.6.8-9.6.9 with the Huppert citation ([81] Kap. III Satz 3.2(b), 4.2(c)), the proof of Safarevic's theorem (Ore's argument), Theorem 9.6.10 with proof and the exercises (pp. 595-597) read. Statement, hypotheses and proof steps match; the remark that local extensions cannot be prescribed is on p. 575. Excerpt literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.5/hurwitz-space-of-tame-g-covers-as-a-coarse-moduli-scheme",
    "verdict": "verified",
    "note": "Romagny-Wewers sections 1-2 (pp. 313-318), 3.1-3.2 (pp. 318-320), 4.1-4.2 (pp. 322-323), the proofs of Proposition 4.10 and Theorem 4.3 (pp. 325-327) and section 4.5 up to the first step of the proof of Theorem 4.11 (pp. 327-328) read; Debes 2026 section 2.2 (Theorem 2.4, p. 14) read. Statement matches Theorem 2.1, Corollary 2.2 (with the remark on p. 318 for arbitrary k), 2.5, Theorem 4.11 (i)-(iii) and Theorem 2.4 (a)-(d). The hypothesis on the referee-noted gap was updated: it concerns a previous version, and the published proofs of 4.10 and 4.3 were read and depend only on named imports. Excerpts literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.5/braid-action-on-nielsen-classes-and-components-of-hurwitz-space",
    "verdict": "verified",
    "note": "Romagny-Wewers section 3.2 (Proposition 3.2 with proof, Remark 3.3; pp. 319-320) and Debes 2026 section 2.1 (Theorem 2.1 with the comments on its proof, Corollary 2.2, Remark 2.3; pp. 12-13) read. The source says Psi_r is \"biholomorphic\" for the unique complex structure; the packet's \"locally biholomorphic\" is the correct reading for a covering map. Statement, hypotheses and proof steps match. Excerpts literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.5/tame-covers-in-positive-characteristic-without-unrestricted-riemann-existence",
    "verdict": "corrected",
    "note": "SGA 1 XIII 2.12 with its full proof and the 2003 remark (pp. 290-292), X 1.10 (p. 205), X 3.8-3.11 (p. 217), IX 6.3 (p. 196), Romagny-Wewers Theorem 4.3 and the following remarks (p. 323) and Debes 2026 Theorem 2.4(c) (p. 14) read. Statement matches. Correction: the hypothesis said Abhyankar's conjecture and its proofs (Raynaud, Harbater) are not in the sources read; SGA 1 XIII p. 292 states the conjecture and its proof by Raynaud and Harbater, and that pi_1(A^1) is not topologically finitely generated in characteristic p. The hypothesis now says what is stated and what is unread. The characteristic-p proof of 2.12 has now been read to the end. Excerpts literal."
   },
   {
    "nodeId": "InverseGaloisAndArithmeticFundamentalGroups:IG.6/register-of-realized-group-families-and-open-targets",
    "verdict": "verified",
    "note": "Each register entry was traced to the passage read: Debes 8.2.7, 8.2.2.1, 8.2.2.2, 8.2.2.3, 8.3.2, 5.2.14 and the p. 135 sentence on A_n, geometric groups over F_q and 25 of 26 sporadic groups; Debes 2026 Corollary 2.2, the sentence after it, Remark 2.3 (Pop, ample fields) and Conjecture 2.6 (proved for r <= 4 by Cadoret-Tamagawa, open for r > 4); NSW 9.6.1; Romagny-Wewers 1.2 (M_24 via r = 4, \"the only known regular realizations\" as of 2006). Proved and cited-only statements are correctly separated. Excerpts literal."
   }
  ]
 },
 "nodes": {
  "changed": {
   "InverseGaloisAndArithmeticFundamentalGroups:IG.0/fibre-functors-are-isomorphic-and-exact-functors-are-continuous-homomorphisms": {
    "hypotheses": [
     "Proposition 6.13 is stated with \"La demonstration est laissee au lecteur\"",
     "Proposition 6.11 (p. 114) gives the two criteria used for exact sequences of fundamental groups. As printed, its inclusion signs are interchanged: the source writes \"Ker u ⊂ Im u' i.e. pour que uu' soit l'homomorphisme trivial\" (mathematically uu' trivial means Im u' ⊂ Ker u, characterized by: H'(H(X)) completely decomposed for every X), and its second criterion (every pointed connected X' of C' whose image under H' has a pointed section receives a morphism from a connected component of some H(X)) characterizes Ker u ⊂ Im u', although printed with ⊃. The printed H' : C -> C'' should read H' : C' -> C''. Use the criteria by their content (6.4 and 6.6), not by the printed inclusion signs."
    ]
   },
   "InverseGaloisAndArithmeticFundamentalGroups:IG.0/finite-etale-covers-form-a-galois-category-and-pi1-of-a-scheme": {
    "statement": "Let S be a connected locally noetherian scheme and a : Spec(Omega) -> S a geometric point. The category C of finite etale covers of S with F(X) = geometric points of X over a satisfies (G1)-(G6). Hence there is a universal cover (pro-object) P at a and a profinite group pi_1(S, a) = Aut(F) with C equivalent to finite continuous pi_1(S, a)-sets. A cover is connected iff pi_1 acts transitively on its fibre. For another geometric point a' (possibly in another characteristic) the fibre functors are isomorphic, giving the groupoid of path classes pi_1(S; a, a'). A morphism f : S' -> S from a connected locally noetherian scheme S' induces an exact pullback functor f^* on finite etale covers with F_a = F_{a'} o f^* (a = f(a')), hence pi_1(f; a') : pi_1(S', a') -> pi_1(S, f(a')); for S' a connected finite etale cover of S this is an isomorphism onto the open subgroup of pi_1(S, a) stabilizing the point of F_a(S') defined by a'."
   },
   "InverseGaloisAndArithmeticFundamentalGroups:IG.1/fundamental-group-of-the-punctured-line-over-an-algebraically-closed-field-of-characteristic-zero": {
    "hypotheses": [
     "Corollaire 2.12 in characteristic 0 is proved (XIII p. 291) by descending to an algebraically closed subfield of finite transcendence degree over Q, embedding into C, comparing via specialization isomorphisms of R^1 g_* (XIII 2.9, not read), applying Riemann existence (XII 5.2), and computing the topological fundamental group of the punctured surface \"par voie transcendante [3, ch. 7 §47]\", where [3] is Seifert-Threlfall, Lehrbuch der Topologie (XIII bibliography, p. 322; not read)",
     "XII Theoreme 5.1 (Riemann existence), as proved on pp. 251-253, imports Hironaka's resolution of singularities ([8] of Expose XII), GAGA for finite (etale) covers of a proper C-scheme (XII 4.6, from 4.4), Proposition 5.3 (uniqueness of normal finite extensions) and descent along normalization (IX 4.7, IX 3.2). It does not use the Grauert-Remmert theorem, which XII 5.4 proves separately and which, the source says, was the route used before [8] was available (p. 255)",
     "The identification of the Z/nZ-covers with t -> t^n uses Kummer theory (XI section 6, not read) and is not stated in the sections read",
     "Placement: this is the acceptance check of IG.0, but its only proof in the sources read uses XIII 2.12 (tame pi_1 of punctured curves, decomposed under IG.1) and Riemann existence (XII 5.2). It is therefore placed under IG.1; a link from IG.1 to IG.0 would reverse the atlas order IG.0 -> IG.1"
    ]
   },
   "InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-sequence-for-the-punctured-projective-line-and-its-sections": {
    "hypotheses": [
     "The fundamental groups here are Galois groups of maximal unramified extensions of function fields; their identification with SGA 1 etale fundamental groups is not stated in the section read",
     "Lemme 6.2.2 (embedding of Omega_t into k^s((T - t_0))) uses Zorn's lemma, Lemme 1.4.2 (not read) and the fact that the minimal polynomial over k^s(T) of an element unramified above t_0 has all its roots in k^s((T - t_0)) (section 6.1.3.2, not read)",
     "The characteristic-0 ramified case uses the Puiseux theorem (Theoreme 6.1.1, not read)"
    ]
   },
   "InverseGaloisAndArithmeticFundamentalGroups:IG.1/specialization-homomorphism-surjectivity-and-prime-to-p-isomorphism": {
    "statement": "For Y the spectrum of a complete noetherian local ring and X proper over Y, pi_1(X_0) -> pi_1(X) is an isomorphism (2.1). For f : X -> Y proper with geometrically connected fibres, Y locally noetherian and y_0 in the closure of y_1, there is a specialization homomorphism pi_1(Xbar_1) -> pi_1(Xbar_0), defined up to inner automorphism, which is surjective if f is separable (2.3-2.4). If f is proper and smooth with geometrically connected fibres (and y_0 in the closure of y_1), every continuous homomorphism from pi_1(Xbar_1) to a finite group of order prime to p = char k(y_0) factors through pi_1(Xbar_0) (3.8); hence the specialization map is an isomorphism in characteristic 0 and induces an isomorphism of maximal prime-to-p quotients in characteristic p (3.9). For a proper smooth connected curve of genus g over an algebraically closed field, pi_1 has 2g topological generators with the surface relation, is the free profinite group on them with that relation in characteristic 0 (2.6), and its prime-to-p quotient has that presentation in characteristic p (3.10). The fundamental group of a proper connected scheme over an algebraically closed field is topologically finitely generated (2.9), so it has finitely many principal covers with a given finite group (2.12, Lang-Serre).",
    "hypotheses": [
     "2.1 is the formal existence theorem (EGA III, IX 1.10) in the language of fundamental groups: an import",
     "2.6 and 3.10 are proved \"par voie transcendante\": comparison with the topological fundamental group of a compact orientable surface, whose derivation was \"explicitee dans un des exposes oraux qui n'ont pas ete rediges\"",
     "3.8 uses the purity theorem 3.1/3.3 (Zariski-Nagata), recalled without proof (footnote 7: SGA 2 X 3.4; the general case is due to Nagata and rests on a result of Chow that \"n'a ete verifie par aucun des participants du Seminaire\", p. 212), and Abhyankar's lemma 3.6, which is proved in the text (pp. 214-215). Only for the curve case 3.10 does the easy two-dimensional unequal-characteristic case of purity, proved on p. 212, suffice (Remarques 3.11)",
     "Remarque 2.5: surjectivity fails without separability; Remarque 2.7: no purely algebraic proof of 2.6 is known (for g >= 2)"
    ]
   },
   "InverseGaloisAndArithmeticFundamentalGroups:IG.1/tame-fundamental-group-of-a-punctured-curve-with-inertia-generators": {
    "statement": "Let X be a proper smooth connected curve of genus g over a separably closed field k of characteristic p >= 0 and U = X minus n distinct closed points a_1, ..., a_n. The tamely ramified fundamental group pi_1^t(U) can be generated by 2g + n elements x_i, y_i, sigma_j with sigma_j generating an inertia group at a_j and prod_i [x_i, y_i] prod_j sigma_j = 1. For every finite group G of order prime to p generated by elements satisfying this relation there is an etale cover of U with group G realizing them; equivalently, pi_1^{p'}(U) is the pro-p' group with these generators and this single relation. Lemme 2.11: for f : X -> S proper of finite presentation, D a divisor on X with normal crossings relative to S, Y = Supp D, U = X - Y, and a specialization s_1 -> s_2 of geometric points of S with geometric points y_1 of Y_{s_1} and y_2 of Y_{s_2} whose projections to X are a generization and a specialization of each other, the specialization map pi_1^t(U_{s_1}) -> pi_1^t(U_{s_2}) carries an inertia subgroup at y_1 onto an inertia subgroup at y_2.",
    "hypotheses": [
     "The tame fundamental group pi_1^t (XIII 2.1.3), the specialization maps for tame covers (1.10, 2.8-2.10) and the local computation XIII 5.6 used in the proof of Lemme 2.11 (p. 290) were not read",
     "Proof in characteristic 0: descend to a field of finite transcendence degree over Q, embed in C, use specialization isomorphisms (2.9) and Riemann existence (XII 5.2); the topological presentation is cited to Seifert-Threlfall",
     "Proof in characteristic p (pp. 291-292, read by the reviewer to its end): lift X and the points to a complete DVR of characteristic 0 (III 7.4), use injectivity, and bijectivity for coefficients of order prime to p, of specialization on R^1 (2.8), and XIII 1.11 to see that the specialized sigma_j generate inertia groups at a_j",
     "In characteristic p the full pi_1(U) is not described: wild ramification contributes a large non-finitely-generated part for affine curves (IX 6.3, X 1.10)"
    ]
   },
   "InverseGaloisAndArithmeticFundamentalGroups:IG.2/hilbertian-fields-and-hilbertian-subsets": {
    "sources": [
     {
      "sourceId": "debes-arithmetique-des-revetements-de-la-droite",
      "locator": "Section 5.2, Theoreme 5.2.1, the definition of Hilbertian subsets, Definition 5.2.2 and Remarque 5.2.3, pp. 135-136",
      "excerpt": "Definition 5.2.2. Un corps k est dit hilbertien si pour tout r > 0, les parties hilbertiennes de k^r sont Zariski-denses.",
      "match": "Literal definition, accents dropped."
     },
     {
      "sourceId": "debes-arithmetique-des-revetements-de-la-droite",
      "locator": "Chapter 9 opening, Exemple 9.0.1(2) and its footnote 1, pp. 231-232",
      "excerpt": "est hensélien au sens général de la définition 1.3.13 mais est hilbertien d'après un théorème de Weissauer (voir théorème 9.4.5)",
      "match": "Literal end of footnote 1 on p. 232 (on k_0((X_1, ..., X_n))); the same page lists kappa((x)) among non-Hilbertian fields, so the exception concerns n >= 2."
     }
    ],
    "hypotheses": [
     "Irreducibility over k(T) forces deg_Y P_i > 0",
     "Algebraically closed fields and henselian fields are not Hilbertian (stated on p. 136; proved for henselian valued fields in Exemple 9.0.1(2), p. 232). Footnote 1 on p. 232 notes that k_0((X_1, ..., X_n)) is henselian in the general sense of Definition 1.3.13 but Hilbertian by Weissauer's theorem (Theoreme 9.4.5, not read); the footnote does not restrict n, but the same page lists kappa((x)) as non-Hilbertian, so the exception concerns n >= 2",
     "The equivalence with thin sets is stated, not proved, in the section read"
    ]
   },
   "InverseGaloisAndArithmeticFundamentalGroups:IG.2/finite-extensions-of-hilbertian-fields-are-hilbertian": {
    "hypotheses": [
     "The purely inseparable case is cited to Fried-Jarden, Field Arithmetic, Proposition 12.3.5 (not read)",
     "Lemme 9.2.2 (a translate Y + c(T) making the conjugates P^sigma pairwise coprime): its proof (pp. 244-245) was read by the reviewer; it uses only field theory (generic linear forms u_i in algebraically independent t_i, a nonvanishing product H(t), specialization to a in k[T]^d). Remarque 9.2.3 gives an example (P = Y^2 + alpha Y T + alpha^2 T^2 over Q(2^{1/3})) where the conjugates are not coprime",
     "The reduction from s variables to one variable is in section 9.1 (not read beyond the opening)",
     "The proof assumes P monic in Y by Remarque 9.1.2 (pp. 235-236), which replaces P by the minimal polynomial of a_0(T) y; read by the reviewer"
    ]
   },
   "InverseGaloisAndArithmeticFundamentalGroups:IG.3/riemann-existence-theorem-for-covers-of-the-punctured-sphere": {
    "hypotheses": [
     "Debes 6.5.1: the proof is deferred to chapter 7 (7.1-7.3, not read); 6.5.3 is stated with a reference to Serre, Topics in Galois Theory, and no proof",
     "Romagny-Wewers Theorem 3.1: \"For a proof, see e.g. [Voel96]\"; the substantial part is algebraicity",
     "SGA 1 XII 5.1 (pp. 251-253): full faithfulness from the comparison of connected components XII 2.6; essential surjectivity by reduction to X normal (descent along normalization, IX 4.7 and IX 3.2) and then regular (extension across codimension >= 2 via [Serre 1966, no. 3 prop. 4]), and, for X affine regular, compactification with Hironaka's resolution of singularities to a normal-crossings boundary (not needed when X is P^1 minus points), local Kummer extension over polydiscs, uniqueness by Proposition 5.3, and algebraization of the finite analytic cover by XII 4.6 (GAGA for finite covers of a proper C-scheme, from XII 4.4). These are imports. XII 4.6 is not the Grauert-Remmert theorem; Grauert-Remmert (XII 5.4) is named only as the older alternative route (p. 255)",
     "The generators g_i != 1 condition is part of the Nielsen class definition in Romagny-Wewers but not in Debes 6.5.1"
    ]
   },
   "InverseGaloisAndArithmeticFundamentalGroups:IG.3/descent-criterion-and-branch-cycle-conditions": {
    "statement": "Let k be a field, t in U_r(k) (a Galois-stable set of r distinct points), F/k Galois, and E/F(T) a regular (G-)extension unramified outside t whose invariants over k^s and kbar agree (Remarque 6.1.11: Galois closure regular, branch points in P^1(k^s) with separable residue extensions), with associated homomorphism phi : pi_1(P^1 - t)_F -> R (R = S_d or G). It is defined over k iff phi extends to pi_1(P^1 - t)_k (8.1.1). For F = k^s and a section s of 1 -> pi_1(P^1 - t)_{k^s} -> pi_1(P^1 - t)_k -> G_k -> 1, it is defined over k iff there is a homomorphism varphi : G_k -> R with phi(x^{s(tau)}) = varphi(tau) phi(x) varphi(tau)^{-1} for all tau and x (8.1.2). In characteristic 0, with a bouquet x_1, ..., x_r and g_i = phi(x_i): (*) the phi(x_i^{s(tau)}) generate G; (**) their product is 1; (***) phi(x_i^{s(tau)}) lies in C_j^{chi(tau)}, where t_j = t_i^tau, C_j is the inertia class at t_j and chi is the cyclotomic character modulo |G| (up to the normalizer for embedded classes). If varphi exists it takes values in N = Nor_R(G) and is determined modulo C = Cen_R(G) (8.1.3).",
    "hypotheses": [
     "Condition (***) is derived from Theoreme 6.5.3 and Corollaire 6.1.13 (p. 164: how the group action, branch points and canonical inertia classes transform under conjugation by tau, with C_i -> C_i^{1/chi(tau)}), together with the formula of section 6.2.2.5 (footnote 1, p. 213; not read). Corollaire 6.1.13 is not the branch cycle lemma: the source gives that name to Corollaire 6.1.18 (p. 170), which is deduced from 6.1.13 and Proposition 6.1.17. The reviewer read the statements of 6.1.11, 6.1.13 and 6.1.18, not the proofs of 6.1.12-6.1.17",
     "Uses Theoreme 6.2.1 for the section s and the extensions/representations dictionary of section 6.2.2 (not read beyond its statement)"
    ]
   },
   "InverseGaloisAndArithmeticFundamentalGroups:IG.3/rigidity-criterion-for-regular-realizations-over-q": {
    "statement": "Let G be a finite group with generators g_1, ..., g_r, g_1 ... g_r = 1, and conjugacy classes C_i of g_i. Let sni(C_1, ..., C_r) be the set of tuples (g'_1, ..., g'_r) generating G with product 1 and g'_i in C_i, with G acting by conjugation. If (H1) Z(G) = 1, (H2) the classes C_i are rational (g^a in C for all a prime to the order of g), and (H3) sni(C_1, ..., C_r) is nonempty and G acts transitively on it, then for every r-tuple t of points of P^1(Q) there is a regular Galois extension E/Q(T) with group G, branch points t and inertia canonical invariant (C_1, ..., C_r). Over Q^ab, (H2) is not needed (8.2.4: the cyclotomic character is trivial on G_{Q^ab}), and over Q^ab (H1) can also be dropped, using projectivity of G_{Q^ab} to modify tau -> varphi_tau by central elements into a homomorphism (Remarque 8.2.5). (H2) is necessary when the t_i are rational (8.2.3).",
    "hypotheses": [
     "(H3) is the rigidity condition; it is usually verified for r <= 3 and can be checked from character tables (8.2.2.3)",
     "The proof uses the descent criterion 8.1.2 and conditions (*)-(***), hence the branch cycle lemma and Riemann existence",
     "Remarque 8.2.5 invokes the projectivity of G_{Q^ab} (cd <= 1) without proof; an unread import"
    ]
   },
   "InverseGaloisAndArithmeticFundamentalGroups:IG.3/rigid-realizations-of-symmetric-groups-and-psl2": {
    "hypotheses": [
     "The PSL_2 argument refines Theoreme 8.2.2 for non-rational classes by choosing conjugate branch points",
     "The Monster claim is stated without the character computation",
     "The source notes that the analogous statement holds for (7/p) = -1 or (5/p) = -1 and that most other cases remain open (for these rigid triples)",
     "The source proves Lemme 8.2.6(a) in detail and says (b) is analogous with g_1 = [[1, -1], [3, 2]], g_2 = [[1, 1], [0, 1]], g_3 = [[1, 0], [-3, 1]] (p. 218, checked on the page image). As printed, g_1 has determinant 5; g_1 = (g_2 g_3)^{-1} = [[1, -1], [3, -2]] is meant. The Legendre conditions enter through the class of g_3: [[1, 0], [-2, 1]] (resp. [[1, 0], [-3, 1]]) is conjugate to [[1, 2], [0, 1]] (resp. [[1, 3], [0, 1]]) and so lies in pB exactly when 2 (resp. 3) is a non-square mod p, by the classification of the unipotent classes on p. 217"
    ]
   },
   "InverseGaloisAndArithmeticFundamentalGroups:IG.3/regular-inverse-galois-over-r-and-abelian-groups-over-q": {
    "hypotheses": [
     "8.3.1: the action of complex conjugation on algebraic pi_1 is identified with its topological action (statement (*) of 8.3.1) through Theoreme 6.5.3",
     "8.2.7 reduces to k = Q and cyclic groups (the reduction to cyclic groups is stated as known), and uses Riemann existence with branch points zeta^{g_i^{-1}}",
     "Theoreme 8.3.3 is stated as an equivalence, but the printed proof (p. 224) derives only necessity (from a realization with real branch points, the r elements g_0 g_1 ... g_i are involutions generating G); the converse is not argued in the text read",
     "8.2.7 and 8.3.2 also cite Proposition 6.2.3 (rational, resp. real, points in the fibre over t_0), not read; it is not needed for the Galois-group statements"
    ]
   },
   "InverseGaloisAndArithmeticFundamentalGroups:IG.4/split-embedding-problems-with-nilpotent-kernel-over-global-fields": {
    "proofSteps": [
     "Reduce 9.6.6 to kernels F(n)/F(n)(nu) with H a p-group (nilpotent groups are products of Sylow subgroups; every finite G-operator p-group is such a quotient).",
     "Induct on nu with n arbitrary; the step nu -> nu + 1 is the central embedding problem with kernel E(n, nu) = F(n)(nu)/F(n)(nu+1).",
     "Step 1: after replacing the level-n solution by one induced from a large level m via a G-invariant surjection psi : F(m) -> F(n), the local problems are solvable everywhere, using condition (i) at bad primes.",
     "Step 2: the global obstruction phi*(alpha_n) lies in Sha^2(k, E(n, nu)) after step 1; by Poitou-Tate duality and the Hasse principle it is the image of an element of H^{-2}(G, E(n, nu)(-1)), which a shrinking F(m) -> F(n) (9.6.3) annihilates, so (*) is globally solvable (3.5.9).",
     "Step 3: the solutions form a principal homogeneous space under H^1(G_k, E(n, nu)) (3.5.11); twist by epsilon in H^1(G_S, E(n, nu)) with prescribed local components on T^0 (properness), T^1, T^2, T^3 (ramification control); the obstruction to epsilon lies in a cokernel embedded in a dual Sha^1 (9.2.2) and is removed by shrinking (9.6.4(i), 9.6.5).",
     "Step 4: twist again by a class x in H^1(k_S|k, E(n, nu)) given by Theorem 9.3.2 (after a further shrinking with 9.6.4(ii)) so that new ramification occurs only at primes split completely in N_nu^n(mu_{p^e})|k with cyclic, totally ramified local extensions (condition (ii)); the auxiliary set T^0 keeps the solution proper.",
     "Characteristic p = char k: proper solvability follows from cd_p G_k = 1 and the Frattini argument."
    ],
    "hypotheses": [
     "The refinement of the p-central series is Shafarevich's correction, needed for p = 2 (the original article [187] contains a mistake at 2)",
     "Imported and not read: Propositions 9.6.2-9.6.4 (the shrinking process; 9.6.2's proof uses Chevalley-Warning 6.5.7), Lemma 9.6.5 (which uses 9.1.9), Theorem 9.3.2 (existence of cohomology classes with prescribed local components), Poitou-Tate duality and the Hasse principle (step 2, p. 589), Hoechsmann's criterion 3.5.9, the torsor structure of solutions 3.5.11 (step 3), the filtration of free pro-p operator groups 3.8.8, the injection 9.2.2 (step 3), 9.2.9 (the first step in characteristic p), 9.2.6 (exercise), and cd_p G_k = 1 in characteristic p with p-projectivity (6.1.4, 3.5.6). Chebotarev's theorem (9.1.3) is not cited in IX section 6",
     "The second and third induction steps (pp. 588-593) were read by the reviewer: step 2 kills the global obstruction in Sha^2(k, E(n, nu)) by shrinking, after identifying Sha^2 with a quotient of H^{-2}(G, E(n, nu)(-1)) through Poitou-Tate duality and the Hasse principle; step 3 changes the solution by a class epsilon in H^1(G_S, E(n, nu)) with prescribed local components at an auxiliary set T = T^0 u T^1 u T^2 u T^3, again after shrinking (9.6.4(i)), to gain properness at the first step (1,1) -> (2,1) (later steps are proper by the Frattini argument), condition (i) and control of new ramification"
    ]
   },
   "InverseGaloisAndArithmeticFundamentalGroups:IG.5/hurwitz-space-of-tame-g-covers-as-a-coarse-moduli-scheme": {
    "sources": [
     {
      "sourceId": "romagny-wewers-hurwitz-spaces",
      "locator": "Section 2, Theorem 2.1, Corollary 2.2, 2.5, pp. 316-318",
      "excerpt": "Theorem 2.1. There exists a scheme H = H_{r,G,Z}, smooth and of finite type over Z, together with a morphism of functors (from schemes to sets) H_{r,G}(S) -> Hom_Z(S, H), such that the following holds.",
      "match": "Literal opening of Theorem 2.1, notation transliterated."
     },
     {
      "sourceId": "romagny-wewers-hurwitz-spaces",
      "locator": "Section 4.5, Theorem 4.11 and Corollary 4.12, p. 328",
      "excerpt": "Therefore, the field of moduli of f is equal to the residue field of the point [f]_k.",
      "match": "Literal sentence from Theorem 4.11(i)."
     },
     {
      "sourceId": "debes-2026-hurwitz-spaces-and-inverse-galois-theory",
      "locator": "Section 2.2, Theorem 2.4, p. 14",
      "excerpt": "There exists a smooth scheme Hur_{r,G} of finite type over Z[1/|G|] and a normal compactification",
      "match": "Literal opening of Theorem 2.4, notation transliterated."
     }
    ],
    "hypotheses": [
     "Theorem 2.1 is cited to Wewers 1998; Romagny-Wewers prove the weaker Theorem 4.11 in section 4, whose proof relies on Riemann existence (for finiteness of M), Theorem 4.3 and tame deformation theory (Proposition 4.5)",
     "The acknowledgments thank the referee for \"a careful reading of a previous version of this manuscript, and in particular for pointing out a gap in the proof of Proposition 4.10\", so the gap concerns an earlier version. The reviewer read the published proof of Proposition 4.10 (pp. 325-327) and of Theorem 4.3 (section 4.4, p. 327): as printed they are complete relative to Proposition 4.5 (tame deformation theory, 'a special case of the deformation theory of tame covers, see [G+71] and section 5'), Lemma 4.6, [Wew99, Proposition 5.2.3(v)], [Mil80, Proposition I.3.8] and [Har77, Exercises III.10.3-10.4], which are imports",
     "Debes 2026 Theorem 2.4 is a survey statement with references, no proof",
     "For characteristic 0 and center-free G the first construction is Fried-Voelklein 1991"
    ]
   },
   "InverseGaloisAndArithmeticFundamentalGroups:IG.5/tame-covers-in-positive-characteristic-without-unrestricted-riemann-existence": {
    "hypotheses": [
     "Wild covers: SGA 1 XIII p. 292 (a remark added in 2003 by M. Raynaud, read by the reviewer) states that pi_1(A^1) in characteristic p is not topologically finitely generated and does not stay constant under extension of algebraically closed fields, and that Abhyankar's conjecture (a finite G is a quotient of pi_1(U) iff its maximal prime-to-p quotient G(p') is a quotient of pi_1^{p'}(U)) was proved by Raynaud for the affine line and by Harbater in general (Invent. Math. 116-117, 1994). These proofs, and wild patching, were not read",
     "The characteristic-p part of the proof of XIII 2.12 (pp. 291-292) was read by the reviewer to its end (lifting by III 7.4, XIII 2.8, XIII 1.11)",
     "Romagny-Wewers remark after Theorem 4.3 (p. 323): Theorem 4.3 is equivalent to the invariance of pi_1^t(P^1 minus D) under extension of algebraically closed fields, and, as their referee pointed out, no statement in SGA 1 has it as a direct consequence"
    ]
   }
  },
  "added": [],
  "removed": []
 },
 "links": {
  "added": [
   {
    "source": "AnalyticNumberTheory:AN.2",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.2/hilbert-irreducibility-for-q-by-the-hilbert-dorge-method",
    "reason": "Re-pointed by the reviewer from FoundationsAndLibraryIntegration:LI.4. Remarque 5.2.10 deduces from Theoreme 5.2.9 and the prime number theorem that every Hilbertian subset of Q contains infinitely many primes; AN.2's stated scope is the prime number theorem (and PNT in progressions). Used only for this corollary, not for Hilbertianity of Q. LI.4's stated scope (number-field, local, class-field and profinite-cohomology suppliers) names neither the PNT nor the Puiseux theorem, and the Puiseux theorem is Debes's own Theoreme 6.1.1 (unread). New implied stage edge AN.2 -> IG.2 (acyclic: IG.2 feeds only IG.4 -> IG.6).",
    "sources": [
     {
      "sourceId": "debes-arithmetique-des-revetements-de-la-droite",
      "locator": "Remarque 5.2.10, p. 140"
     }
    ]
   },
   {
    "source": "InverseGaloisAndArithmeticFundamentalGroups:IG.0/fundamental-group-of-a-field-and-of-a-normal-scheme",
    "target": "ArithmeticDynamics:DY.5",
    "reason": "Re-pointed by the reviewer from the finite-etale Galois-category node to this node. DY.5 needs the continuous action of G_K on the finite levels of a preimage tree, i.e. G_K = pi_1(Spec K) acting on the geometric fibres of finite etale K-schemes: that is V 7 for S = Spec K together with the identification pi_1(Spec K, a) = Gal(K^s/K) of V 8.1, which this node owns (and which consumes the V 7 node). Existing atlas edge IG.0 -> DY.5.",
    "sources": [
     {
      "sourceId": "sga1-revetements-etales-et-groupe-fondamental",
      "locator": "Expose V, section 7 and Proposition 8.1, pp. 115-117"
     }
    ]
   },
   {
    "source": "InverseGaloisAndArithmeticFundamentalGroups:IG.2/hilbert-specialization-of-a-galois-extension-of-k-t-with-full-group",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.4",
    "reason": "Re-targeted by the reviewer from the Shafarevich node to the stage IG.4: NSW's proof of Shafarevich's theorem (Theorems 9.6.1, 9.6.6-9.6.7) does not use Hilbert irreducibility. What Proposition 5.2.14 supplies is the IG.4 acceptance item 'construct cyclic and dihedral realizations': a regular realization over Q(T) (for cyclic groups Debes Theoreme 8.2.7) specializes to a realization over Q. Existing atlas edge IG.2 -> IG.4.",
    "sources": [
     {
      "sourceId": "debes-arithmetique-des-revetements-de-la-droite",
      "locator": "Proposition 5.2.14, p. 143"
     }
    ]
   },
   {
    "source": "AlgebraicModuliForArithmeticGeometry:R09.4",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.5",
    "reason": "Re-targeted by the reviewer from the coarse-moduli-scheme node to the stage IG.5. The decomposed construction (Romagny-Wewers Theorem 2.1 with the coarse universal property, Corollary 2.2, Theorem 4.11) is scheme-theoretic and uses no stacks. What needs R09.4 (categories fibred in groupoids, stackification, representable diagonals, etale atlases, Deligne-Mumford and tame as separate properties) is the stack-theoretic Hurwitz space that Romagny-Wewers recommend for groups with nontrivial center (section 1.3; their stack sections were not read) and that the IG.5 coverage lists as remaining. Existing atlas edge R09.4 -> IG.5.",
    "sources": [
     {
      "sourceId": "romagny-wewers-hurwitz-spaces",
      "locator": "section 1.3, p. 315"
     }
    ]
   },
   {
    "source": "ComplexComparisonPartII:C2",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.3/riemann-existence-theorem-for-covers-of-the-punctured-sphere",
    "reason": "Added by the reviewer. The algebraization step in the proof of SGA 1 XII 5.1 (step 2c, p. 253: 'La demonstration s'acheve alors grace a 4.6') identifies the finite analytic cover of the compactification with the analytification of a finite algebraic cover; XII 4.6 derives this from GAGA for coherent sheaves (4.4). For the punctured sphere the compactification is P^1, so projective coherent GAGA (C2: equivalence of coherent modules, identification of coherent ideals and closed subschemes) suffices. New implied stage edge C2 -> IG.3; it is transitive in the atlas (C2 -> C4 -> IG.3), so no cycle. Debes's own algebraization via meromorphic functions (chapter 7) was not read.",
    "sources": [
     {
      "sourceId": "sga1-revetements-etales-et-groupe-fondamental",
      "locator": "Expose XII, Corollaire 4.6 and proof of Theoreme 5.1 step 2c), pp. 251 and 253"
     }
    ]
   },
   {
    "source": "InverseGaloisAndArithmeticFundamentalGroups:IG.3/riemann-existence-theorem-for-covers-of-the-punctured-sphere",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.3/regular-inverse-galois-over-r-and-abelian-groups-over-q",
    "reason": "Added by the reviewer. Section 8.3.1 (statement (*), p. 221) identifies the action of complex conjugation on the algebraic fundamental group with its topological action through Theoreme 6.5.3, extended to an isomorphism of the profinite completion semidirect {1, c} with pi_1(P^1 - t)_R; the Hurwitz formulas 8.3.1 and Theoremes 8.3.2-8.3.3 are computed on this identification (together with the section s_{t0} of section 6.2.1). The proof of 8.2.7 likewise defines phi on the bouquet generators.",
    "sources": [
     {
      "sourceId": "debes-arithmetique-des-revetements-de-la-droite",
      "locator": "Section 8.3.1, statement (*) and the following sentence, p. 221; proof of Theoreme 8.2.7, p. 219"
     }
    ]
   },
   {
    "source": "ArithmeticGaloisDuality:R02.4",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.4/split-embedding-problems-with-nilpotent-kernel-over-global-fields",
    "reason": "Added by the reviewer. Step 2 of the proof of Theorem 9.6.7 identifies Sha^2(k, E(n, nu)) with the dual of Sha^1(k, E(n, nu)') 'by the Poitou-Tate duality theorem' and uses the resulting surjection from H^{-2}(G, E(n, nu)(-1)) to shrink the obstruction. R02.4's stated scope is the finite-module Poitou-Tate duality and exact sequence, including global duality itself. New implied stage edge R02.4 -> IG.4; IG.4 feeds only IG.6, so no cycle.",
    "sources": [
     {
      "sourceId": "nsw-cohomology-of-number-fields-2e",
      "locator": "Theorem 9.6.7 proof, second step, proof of the claim, p. 589"
     }
    ]
   }
  ],
  "removed": [
   {
    "source": "InverseGaloisAndArithmeticFundamentalGroups:IG.1/specialization-homomorphism-surjectivity-and-prime-to-p-isomorphism",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.1/tame-fundamental-group-of-a-punctured-curve-with-inertia-generators",
    "reason": "Corollaire XIII 2.12 follows the pattern of X 2.6 and 3.10 (lift to characteristic 0 and specialize), for tame covers of open curves.",
    "sources": [
     {
      "sourceId": "sga1-revetements-etales-et-groupe-fondamental",
      "locator": "Expose XIII, proof of Corollaire 2.12, pp. 290-291"
     }
    ]
   },
   {
    "source": "FoundationsAndLibraryIntegration:LI.4",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.2/hilbert-irreducibility-for-q-by-the-hilbert-dorge-method",
    "reason": "The count of primes in Hilbertian subsets uses the prime number theorem and the Puiseux/Hensel algebra of field extensions. Existing atlas edge LI.4 -> IG.2.",
    "sources": [
     {
      "sourceId": "debes-arithmetique-des-revetements-de-la-droite",
      "locator": "Remarque 5.2.10, p. 140"
     }
    ]
   },
   {
    "source": "InverseGaloisAndArithmeticFundamentalGroups:IG.0/finite-etale-covers-form-a-galois-category-and-pi1-of-a-scheme",
    "target": "ArithmeticDynamics:DY.5",
    "reason": "DY.5 uses the Galois action on finite levels of preimage trees, i.e. pi_1 of Spec K acting on finite etale fibres. Existing atlas edge IG.0 -> DY.5.",
    "sources": [
     {
      "sourceId": "sga1-revetements-etales-et-groupe-fondamental",
      "locator": "Expose V, section 7 and Proposition 8.1, pp. 115-117"
     }
    ]
   },
   {
    "source": "InverseGaloisAndArithmeticFundamentalGroups:IG.3/regular-inverse-galois-over-r-and-abelian-groups-over-q",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.4/shafarevich-theorem-solvable-groups-over-global-fields",
    "reason": "Cyclic groups are regular over Q(T) (8.2.7) and so over Q after Hilbert specialization; these are the base cases of the cyclic acceptance of IG.4. New stage edge IG.3 -> IG.4 (no cycle: IG.4 only feeds IG.6).",
    "sources": [
     {
      "sourceId": "debes-arithmetique-des-revetements-de-la-droite",
      "locator": "Theoreme 8.2.7, p. 219"
     }
    ]
   },
   {
    "source": "InverseGaloisAndArithmeticFundamentalGroups:IG.2/hilbert-specialization-of-a-galois-extension-of-k-t-with-full-group",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.4/shafarevich-theorem-solvable-groups-over-global-fields",
    "reason": "The IG.4 cyclic and dihedral realizations over Q may be obtained by specializing regular realizations over Q(T) (Proposition 5.2.14); Shafarevich's theorem itself does not use Hilbert irreducibility. Existing atlas edge IG.2 -> IG.4.",
    "sources": [
     {
      "sourceId": "debes-arithmetique-des-revetements-de-la-droite",
      "locator": "Proposition 5.2.14, p. 143"
     }
    ]
   },
   {
    "source": "AlgebraicModuliForArithmeticGeometry:R09.4",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.5/hurwitz-space-of-tame-g-covers-as-a-coarse-moduli-scheme",
    "reason": "Coarse versus fine moduli, and the stack-theoretic Hurwitz space recommended for groups with center, need the algebraic stack theory of R09.4. Existing atlas edge R09.4 -> IG.5.",
    "sources": [
     {
      "sourceId": "romagny-wewers-hurwitz-spaces",
      "locator": "section 1.3, p. 315"
     }
    ]
   }
  ],
  "changed": [
   {
    "source": "InverseGaloisAndArithmeticFundamentalGroups:IG.0/fibre-functors-are-isomorphic-and-exact-functors-are-continuous-homomorphisms",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.1/fundamental-exact-sequence-over-a-field",
    "reason": "The proof of IX 6.1 applies V 6.13 to the connected principal cover X_i = X (x)_k k_i of X with group pi_i (via IX 3.4) to obtain e -> pi_1(X_i) -> pi_1(X) -> pi_i -> e, then passes to the limit. V 6.9-6.11 are not cited in this proof; the geometric reading 6.2 of right exactness is the V 6.4/6.6 dictionary, used without citation.",
    "sources": [
     {
      "sourceId": "sga1-revetements-etales-et-groupe-fondamental",
      "locator": "Expose IX, proof of Theoreme 6.1, pp. 195-196 (V 6.13 cited at the top of p. 196)"
     }
    ]
   },
   {
    "source": "InverseGaloisAndArithmeticFundamentalGroups:IG.0/fundamental-group-of-a-field-and-of-a-normal-scheme",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.1/fundamental-exact-sequence-over-a-field",
    "reason": "Theoreme 6.1 asserts pi_1(S, b) = pi_1(k, kbar) = Gal(kbar/k); after reducing to A = k the source calls this isomorphism evident. The field case is V 8.1 (not cited by number in IX 6.1).",
    "sources": [
     {
      "sourceId": "sga1-revetements-etales-et-groupe-fondamental",
      "locator": "Expose IX, Theoreme 6.1, p. 195"
     }
    ]
   },
   {
    "source": "InverseGaloisAndArithmeticFundamentalGroups:IG.0/fundamental-group-of-a-field-and-of-a-normal-scheme",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-sequence-for-the-punctured-projective-line-and-its-sections",
    "reason": "Comparison edge, not an input to Debes's proof: V 8.2 applied to the normal scheme S = P^1_k minus t identifies pi_1(S) with the Galois group over k(T) of the compositum of the finite extensions unramified over S, which is Debes's pi_1(P^1 - t)_k = Gal(Omega_t/k(T)). Debes's Theoreme 6.2.1 is proved by field theory alone, and neither source states the identification of Debes's place-wise unramifiedness with unramifiedness over the scheme (recorded in the IG.1 coverage).",
    "sources": [
     {
      "sourceId": "debes-arithmetique-des-revetements-de-la-droite",
      "locator": "Section 6.2.1, pp. 171-172"
     },
     {
      "sourceId": "sga1-revetements-etales-et-groupe-fondamental",
      "locator": "Expose V, Proposition 8.2, p. 117"
     }
    ]
   },
   {
    "source": "InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-sequence-for-the-punctured-projective-line-and-its-sections",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.2/hilbert-specialization-of-a-galois-extension-of-k-t-with-full-group",
    "reason": "Shared construction, not an input: the proof of Proposition 5.2.14 (chapter 5) embeds E_T into E_t((T - t)) by Hensel's lemma (Theoreme 1.3.12 or Lemme 2.6.4) without citing Theoreme 6.2.1, which comes later. The map s of 5.2.14 is the Galois-level shadow of the section s_t of Theoreme 6.2.1 at the unramified point t (the same embedding into k^s((T - t)) as Lemme 6.2.2). The edge records this identification; the atlas edge IG.1 -> IG.2 exists.",
    "sources": [
     {
      "sourceId": "debes-arithmetique-des-revetements-de-la-droite",
      "locator": "Theoreme 6.2.1, p. 172; proof of Proposition 5.2.14, p. 144"
     }
    ]
   },
   {
    "source": "SchemeAndStackFoundations:SF.2",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.0/finite-etale-covers-form-a-galois-category-and-pi1-of-a-scheme",
    "reason": "Existing atlas edge SF.2 -> IG.0, annotated: the verification of (G1)-(G6) in V 7 cites I 4.6 (sorites of etale morphisms), V 3.4 (quotients of etale covers by finite groups), V 3.5 (image factorization), V section 2 and V 3.7 (degree criterion for isomorphisms of etale covers). SF.2's stated scope is sites and scheme cohomology (etale site comparisons, sheaf cohomology, base change); it covers at most the sorites of etale morphisms and does not state the finite-etale-cover facts V 1-3. The supply is therefore unconfirmed; see the IG.0 import gap.",
    "sources": [
     {
      "sourceId": "sga1-revetements-etales-et-groupe-fondamental",
      "locator": "Expose V, section 7, p. 115"
     }
    ]
   },
   {
    "source": "FoundationsAndLibraryIntegration:LI.4",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.0/fundamental-group-of-a-field-and-of-a-normal-scheme",
    "reason": "Existing atlas edge LI.4 -> IG.0, annotated: the proof of V 8.1 uses two facts it calls \"bien connu\" (restriction Aut(k'/k) -> Gal(k^s/k) is an isomorphism for k' the algebraic closure; the Galois group acts transitively on the k-embeddings of a finite separable L) and the Krull topology on Gal(k^s/k). LI.4's stated scope names number-field, class-field-theory and profinite-cohomology suppliers; infinite Galois theory of an arbitrary field is not named there. Recorded in the IG.0 import gap.",
    "sources": [
     {
      "sourceId": "sga1-revetements-etales-et-groupe-fondamental",
      "locator": "Expose V, Proposition 8.1, p. 117"
     }
    ]
   },
   {
    "source": "InverseGaloisAndArithmeticFundamentalGroups:IG.5/braid-action-on-nielsen-classes-and-components-of-hurwitz-space",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.5/hurwitz-space-of-tame-g-covers-as-a-coarse-moduli-scheme",
    "reason": "Part (iii) of Theorem 4.11 compares the scheme with the complex manifold of Proposition 3.2, and the algebraic construction uses Riemann existence for finiteness.",
    "sources": [
     {
      "sourceId": "romagny-wewers-hurwitz-spaces",
      "locator": "Theorem 4.11 (iii) and the first step of its proof, p. 328"
     }
    ]
   },
   {
    "source": "InverseGaloisAndArithmeticFundamentalGroups:IG.3/field-of-moduli-and-the-descent-obstruction",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.5/hurwitz-space-of-tame-g-covers-as-a-coarse-moduli-scheme",
    "reason": "Theorem 4.11(i) identifies the field of moduli with the residue field of the moduli point, and Corollary 4.12 uses Proposition 4.4 (center-free descent).",
    "sources": [
     {
      "sourceId": "romagny-wewers-hurwitz-spaces",
      "locator": "Theorem 4.11 and Corollary 4.12, p. 328; Theorem 4.3 in the proof of 4.11, p. 328"
     }
    ]
   },
   {
    "source": "ComplexComparisonPartII:C4",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.3/riemann-existence-theorem-for-covers-of-the-punctured-sphere",
    "reason": "Existing atlas edge C4 -> IG.3, reason corrected by the reviewer. In SGA 1 XII 5.1 the full-faithfulness step uses the comparison of connected components of X' x_X X'' with those of its analytification (XII 2.6); for X = P^1 minus t these are smooth affine complex curves, and C4 exports algebraic-versus-analytic connectedness for finite-type smooth affine complex curves. The algebraization step (XII 4.6: finite analytic covers of a proper C-scheme are analytifications of finite algebraic covers, from GAGA XII 4.4) is coherent GAGA, which is ComplexComparisonPartII:C2's scope, not C4's (C4 owns Chow's theorem and the graph argument, cf. XII 4.5); see the added C2 link.",
    "sources": [
     {
      "sourceId": "sga1-revetements-etales-et-groupe-fondamental",
      "locator": "Expose XII, proof of Theoreme 5.1, step 1) (use of XII 2.6), p. 251"
     }
    ]
   },
   {
    "source": "FoundationsAndLibraryIntegration:LI.4",
    "target": "InverseGaloisAndArithmeticFundamentalGroups:IG.4/split-embedding-problems-with-nilpotent-kernel-over-global-fields",
    "reason": "Existing atlas edge LI.4 -> IG.4, reason corrected by the reviewer. LI.4's stated scope (class field theory, profinite cohomology, Chebotarev) covers the Galois-cohomological inputs of the proof of 9.6.7 that are not NSW's own theorems: Hoechsmann's criterion 3.5.9, the torsor structure 3.5.11, p-projectivity 3.5.6 and cd_p G_k = 1 in characteristic p (6.1.4). Chebotarev (9.1.3) is not cited in IX section 6. Poitou-Tate duality (step 2, p. 589) is owned by ArithmeticGaloisDuality:R02.4, not LI.4; see the added R02.4 link. Theorem 9.3.2 (classes with prescribed local components) is NSW's own IX section 3 and was not read (gap).",
    "sources": [
     {
      "sourceId": "nsw-cohomology-of-number-fields-2e",
      "locator": "Theorem 9.6.7 proof: (3.5.9) pp. 585, 588; (3.5.11) p. 590; (6.1.4), (3.5.6) p. 595"
     }
    ]
   }
  ]
 },
 "gaps": [
  {
   "title": "IG.0 axiom verifications and the pro-representability criterion are imports",
   "neededBy": [
    "InverseGaloisAndArithmeticFundamentalGroups:IG.0/galois-category-axioms-and-the-main-theorem",
    "InverseGaloisAndArithmeticFundamentalGroups:IG.0/finite-etale-covers-form-a-galois-category-and-pi1-of-a-scheme"
   ],
   "detail": "Theoreme V 4.1 step c) imports strict pro-representability of left exact functors on artinian categories from Grothendieck, Technique de descente II (Seminaire Bourbaki 195, prop. 3.1). The verification of (G1)-(G6) for finite etale covers cites Expose I 4.6 and Expose V 3.4, 3.5, section 2 and 3.7, which were not read; Proposition 8.2 uses I 10.1, not read. Proposition 8.1 uses two 'bien connu' facts of infinite Galois theory (Aut(kbar/k) -> Gal(k^s/k) is an isomorphism; transitivity on embeddings of a finite separable extension). Propositions V 6.13 and IX 6.1 leave steps to the reader, and Proposition V 6.11 is printed with its inclusion signs interchanged (see the node). Supplier scope (reviewer, 2026-09-24): SchemeAndStackFoundations:SF.2 states sites and scheme cohomology, not the finite-etale-cover facts V 1-3 (quotients by finite groups, image factorization, degree criterion); FoundationsAndLibraryIntegration:LI.4 states number-field, class-field and profinite-cohomology suppliers, not infinite Galois theory of arbitrary fields. Both existing links are kept as annotated atlas edges with unconfirmed supply. Next source action: read SGA 1 Expose V sections 1-3 and Expose I, or an elementary complete proof of the main theorem on Galois categories, and name owners for the finite-etale-cover sorites and for infinite Galois theory. Lenstra, Galois theory for schemes (Leiden notes, author copy) was downloaded but not read."
  },
  {
   "title": "Ordering: the IG.0 acceptance computation of pi_1(G_m) needs IG.1 material and Riemann existence",
   "neededBy": [
    "InverseGaloisAndArithmeticFundamentalGroups:IG.1/fundamental-group-of-the-punctured-line-over-an-algebraically-closed-field-of-characteristic-zero",
    "InverseGaloisAndArithmeticFundamentalGroups:IG.0"
   ],
   "detail": "IG.0 asks to recover pi_1 of G_m over an algebraically closed field of characteristic 0. The only proof read, SGA 1 XIII Corollaire 2.12, uses the tame fundamental group of punctured curves (IG.1 in this decomposition), specialization isomorphisms (XIII 2.9), Riemann existence (XII 5.1-5.2) and the topological presentation of the fundamental group of a punctured compact surface, cited to Seifert-Threlfall, Lehrbuch der Topologie, ch. 7 §47 (XIII bibliography [3], p. 322; not read). In XII 5.1 the algebraization step is GAGA for finite covers of a proper C-scheme (XII 4.6 from 4.4; supplier ComplexComparisonPartII:C2) and the full-faithfulness step compares connected components (XII 2.6; supplier ComplexComparisonPartII:C4). The node is therefore placed under IG.1, so the IG.0 acceptance check cannot be discharged inside IG.0 under the atlas order IG.0 -> IG.1. Kummer theory for the explicit covers t -> t^n (Expose XI section 6) was not read."
  },
  {
   "title": "IG.1 constructions not read: decomposition and inertia subgroups, tame quotients, and the formal-geometry inputs of specialization",
   "neededBy": [
    "InverseGaloisAndArithmeticFundamentalGroups:IG.1",
    "InverseGaloisAndArithmeticFundamentalGroups:IG.1/specialization-homomorphism-surjectivity-and-prime-to-p-isomorphism",
    "InverseGaloisAndArithmeticFundamentalGroups:IG.1/tame-fundamental-group-of-a-punctured-curve-with-inertia-generators"
   ],
   "detail": "Decomposition and inertia groups (Debes 2.5-2.6; SGA 1 V section 2) and the definition of the tame fundamental group pi_1^t (SGA 1 XIII 2.1-2.10) were not read. The specialization theory of Expose X imports the formal existence theorem (X 2.1 via IX 1.10 and EGA III), the Stein factorization of proper separable morphisms (X 1.2, EGA III 7.8.10 (i)), the lifting of curves over Witt vectors (III 7.4) and the purity theorem X 3.1 (recalled without proof; SGA 2 X 3.4, Zariski 1958, Nagata 1959; the general case rests on a result of Chow that the seminar did not verify, p. 212). Abhyankar's lemma X 3.6 and Lemme 3.7 are proved in the text (pp. 214-216, read by the reviewer). The proof of XIII 2.12 does not use Expose X: it rests on XIII 1.10-1.11, 2.8-2.10 and 5.6 (unread) and III 7.4; the reviewer therefore removed the drafted link from the X specialization node to the XIII node (it recorded a shared method, not an input). The curve presentations X 2.6 and 3.10 are transcendental, and their derivation was never written up in SGA 1 (X p. 209, footnote 3). Debes Lemme 6.2.2 uses section 6.1.3.2 and Lemme 1.4.2 (unread). The finite-field Frobenius check is covered only by V 8.1 and Debes 6.2.1. Next source action: read Debes sections 2.5-2.6 and SGA 1 XIII sections 1 and 2.1-2.10."
  },
  {
   "title": "IG.2: general Hilbertian reductions, simultaneous and linear-disjointness variants, and a worked certified example are missing",
   "neededBy": [
    "InverseGaloisAndArithmeticFundamentalGroups:IG.2",
    "InverseGaloisAndArithmeticFundamentalGroups:IG.2/hilbert-irreducibility-for-q-by-the-hilbert-dorge-method",
    "InverseGaloisAndArithmeticFundamentalGroups:IG.2/hilbert-specialization-of-a-galois-extension-of-k-t-with-full-group",
    "InverseGaloisAndArithmeticFundamentalGroups:IG.2/finite-extensions-of-hilbertian-fields-are-hilbertian"
   ],
   "detail": "The Hilbert-Dorge proof covers one parameter and one variable. The reductions to several parameters and variables (Debes 9.1) were read only at the opening and in Remarque 9.1.2 (monic reduction, read by the reviewer). Several inputs are cited: the Puiseux theorem (Debes Theoreme 6.1.1, chapter 6 of the same source), Corollaire 2.4.4 or [FJ04, Lemma 2.3.5] (unramified primitive elements), the implicit function theorem, Hensel's lemma (Theoreme 1.3.12 or Lemme 2.6.4) and Lemme 1.4.2 for Proposition 5.2.14, and the purely inseparable case of Theoreme 9.2.1 (Fried-Jarden, Proposition 12.3.5). The proof of Lemme 9.2.2 (pp. 244-245) has now been read. The prime-number corollary of Remarque 5.2.10 uses the prime number theorem; the reviewer re-pointed that link from FoundationsAndLibraryIntegration:LI.4 (whose stated scope does not include the PNT) to AnalyticNumberTheory:AN.2. Simultaneous avoidance and linear-disjointness variants (for example Debes chapter 10 or Fried-Jarden chapter 16) were not read. The acceptance item \"infinitely many distinct specialized extensions in a worked regular example, with ramification and irreducibility certificates\" has no worked source example; Exemple 5.2.6 treats only irreducibility of Y^4 - T. Next source action: read Debes 9.1 and chapter 10, and build a certified example (e.g. the S_n rigid cover of 8.2.2.1 specialized at integers) from them."
  },
  {
   "title": "IG.3: the Riemann existence proof, the branch cycle lemma, a field-of-moduli counterexample and the BelyiMaps supplier check are not covered",
   "neededBy": [
    "InverseGaloisAndArithmeticFundamentalGroups:IG.3/riemann-existence-theorem-for-covers-of-the-punctured-sphere",
    "InverseGaloisAndArithmeticFundamentalGroups:IG.3/descent-criterion-and-branch-cycle-conditions",
    "InverseGaloisAndArithmeticFundamentalGroups:IG.3/field-of-moduli-and-the-descent-obstruction",
    "InverseGaloisAndArithmeticFundamentalGroups:IG.3"
   ],
   "detail": "Several IG.3 ingredients were not read. Riemann existence is proved in Debes chapter 7 (7.1-7.3), and Debes 6.5.3 is stated without proof (cites Serre, Topics in Galois Theory). SGA 1 XII 5.1 (read) imports XII 2.6, 4.4-4.6 (GAGA), Proposition 5.3, IX 3.2, IX 4.7, [Serre 1966, no. 3 prop. 4] and, in general, Hironaka's resolution. The branch cycle condition (***) rests on Theoreme 6.5.3, Corollaire 6.1.13 (conjugation of invariants; statement read by the reviewer, proof unread) and the formula of section 6.2.2.5; the source's branch cycle lemma proper is Corollaire 6.1.18 (read), deduced from 6.1.13 and Proposition 6.1.17 (unread). Remarque 8.2.5 invokes the projectivity of G_{Q^ab} without proof; Theoremes 8.2.7 and 8.3.2 cite Proposition 6.2.3 (unread); Theoreme 8.3.3 is stated as an equivalence but only its necessity is proved in the text. The printed matrix g_1 in Lemme 8.2.6(b) has determinant 5 (misprint). The IG.3 acceptance asks for an example where the field of moduli is not a field of definition. None appears in the sections read: Debes 8.4 and Romagny-Wewers 4.2 give only criteria and the H^2(k_m, Z(G)) obstruction [DD97]. The Debes MSRI paper Descent theory for algebraic covers (author copy, file A38) uses Type 3 fonts without extractable text and was not read on page images. The roadmap asks IG.3 to consume BelyiMaps and its successors (dessins, permutation triples, Belyi's theorem) with a compiled-supplier check. The atlas stages tauceti:TauCetiRoadmap/BelyiMaps layers 8-9 (analytic Riemann existence, algebraization), 11 (fields of moduli and definition) and 12 (branch-cycle theorem) are the candidate suppliers, but none of them lists an IG stage as consumer and no link was added. Next source action: read Debes chapter 7 and Debes-Douai, Algebraic covers: field of moduli versus field of definition (Ann. Sci. ENS 1997), and match BelyiMaps stage statements."
  },
  {
   "title": "IG.4: shrinking-process proofs, local-global steps, Scholz-Reichardt, and the cyclic and dihedral acceptance examples are unread",
   "neededBy": [
    "InverseGaloisAndArithmeticFundamentalGroups:IG.4/split-embedding-problems-with-nilpotent-kernel-over-global-fields",
    "InverseGaloisAndArithmeticFundamentalGroups:IG.4/shafarevich-theorem-solvable-groups-over-global-fields",
    "InverseGaloisAndArithmeticFundamentalGroups:IG.4"
   ],
   "detail": "Several parts of the IG.4 proof chain were not read. In NSW: the proofs of Propositions 9.6.2-9.6.4 (shrinking; 9.6.2 uses Chevalley-Warning 6.5.7), Lemma 9.6.5 (uses 9.1.9), Theorem 9.3.2 (existence of cohomology classes with prescribed local components), 9.2.2, 9.2.9, 3.5.11, 3.8.8 and Hoechsmann's criterion 3.5.9. The second and third steps of Theorem 9.6.7 have now been read by the reviewer (pp. 588-593). Poitou-Tate duality (step 2) is owned by ArithmeticGaloisDuality:R02.4; the reviewer added that supplier link and corrected the LI.4 link (Chebotarev 9.1.3 is not cited in IX section 6). Section IX.5 names the Scholz-Reichardt method (p. 560) and refers to Serre, Topics in Galois Theory, for the odd nilpotent case; its own theorems (Iwasawa 9.5.3, Neukirch 9.5.5-9.5.9) were not read. The group theory 9.6.8-9.6.9 is cited to Huppert. The acceptance asks for cyclic and dihedral realizations and certification of the inductive properness step. Cyclic realizations follow from Debes 8.2.7 plus Hilbert specialization 5.2.14 (or directly from cyclotomic fields); the reviewer removed the drafted link from the IG.3 abelian-groups node to the Shafarevich node, which created a new stage edge IG.3 -> IG.4 for an acceptance example the theorem does not use, and re-targeted the 5.2.14 link to the stage IG.4. No dihedral realization was read. Next source action: read NSW IX section 5 (Scholz-Reichardt, Neukirch), 9.3.2 and 9.6.2-9.6.5, and a dihedral embedding-problem example (e.g. via quadratic twists of a cyclic extension)."
  },
  {
   "title": "IG.5: Hurwitz-space construction proofs, stack-theoretic versions, wild covers and the characteristic comparison example",
   "neededBy": [
    "InverseGaloisAndArithmeticFundamentalGroups:IG.5/hurwitz-space-of-tame-g-covers-as-a-coarse-moduli-scheme",
    "InverseGaloisAndArithmeticFundamentalGroups:IG.5/tame-covers-in-positive-characteristic-without-unrestricted-riemann-existence",
    "InverseGaloisAndArithmeticFundamentalGroups:IG.5"
   ],
   "detail": "Parts of IG.5 remain unread or cited only. Romagny-Wewers Theorem 2.1 is cited to Wewers 1998 (thesis). In their section 4, Proposition 4.5 (tame deformation theory, 'a special case of the deformation theory of tame covers, see [G+71] and section 5') is not proved, and Proposition 4.13 and the rest of the proof of Theorem 4.11 (pp. 328-329) were not read; the proofs of Proposition 4.10 and Theorem 4.3 (pp. 325-327) were read by the reviewer. The acknowledgments' referee-noted gap concerns a previous version of Proposition 4.10's proof; the published proof is complete relative to named imports. Fried-Voelklein 1991 (braid action, Hurwitz spaces over Q) was not read, and Debes 2026 Theorem 2.4 is a survey statement. The algebraic-stack version (owner R09.4; the reviewer re-targeted that link to the stage IG.5 because the decomposed scheme construction uses no stacks) and the Harris-Mumford compactification are not decomposed. Wild covers: SGA 1 XIII p. 292 (2003 remark) states Abhyankar's conjecture and its proofs by Raynaud and Harbater (1994); those papers and wild patching were not read. The acceptance example comparing a characteristic-0 cover with its tame reduction was not found. Next source action: read Wewers, Construction of Hurwitz spaces (thesis 1998), sections 3-4, and Romagny-Wewers sections 4.5 and 5 in full."
  },
  {
   "title": "IG.6: explicit polynomials and certified isomorphisms, Belyi arithmetic actions, generic polynomials and the anabelian hand-off are not decomposed",
   "neededBy": [
    "InverseGaloisAndArithmeticFundamentalGroups:IG.6/register-of-realized-group-families-and-open-targets",
    "InverseGaloisAndArithmeticFundamentalGroups:IG.6"
   ],
   "detail": "The register lists theorems, not certified explicit data. No source read gives checked polynomials, field extensions, cover maps and Galois-group isomorphisms. BelyiArithmeticActions (the Galois action on dessins and its faithfulness theorem) was not consulted. Generic polynomials (Jensen-Ledet-Yui) are not discussed in any source read. The hand-off of profinite fundamental groups and path torsors to AnabelianGeometryAndNonabelianChabauty rests only on SGA 1 V section 7 (paths between geometric points). Several statements are cited without proof: A_n, PSL_n(F_q), 25 sporadic groups over Q, the Monster, M_24, and Pop's ample fields. Next source action: read Malle-Matzat, Inverse Galois Theory (2nd ed.), chapters I-II and IV (not publicly available; request a library copy) and the BelyiMaps successor roadmaps."
  }
 ],
 "coverage": [
  {
   "stageId": "InverseGaloisAndArithmeticFundamentalGroups:IG.0",
   "status": "partial",
   "remaining": [
    "Axiom verification (G1)-(G6) for finite etale covers (SGA 1 Exposes I and V 1-3) and the pro-representability criterion (Seminaire Bourbaki 195): unread imports.",
    "Connected components and base-point change are covered by V 5.3-5.8 and V 7; the multi-Galois case (V 9) is only sketched in the source.",
    "The G_m acceptance check is placed under IG.1 because its proof uses XIII 2.12 and Riemann existence."
   ]
  },
  {
   "stageId": "InverseGaloisAndArithmeticFundamentalGroups:IG.1",
   "status": "partial",
   "remaining": [
    "Decomposition and inertia subgroups and tame quotients (Debes 2.5-2.6; SGA 1 V 2 and XIII 2.1-2.10): not read.",
    "Formal existence (IX 1.10, EGA III), Stein factorization (EGA III 7.8.10), lifting over Witt vectors (III 7.4) and the purity theorem X 3.1 (SGA 2 X 3.4; Nagata) behind X 2.1, 1.2, 2.6 and 3.8: imports. Abhyankar's lemma X 3.6 is proved in the text.",
    "Transcendental curve presentations X 2.6/3.10 were never written up in SGA 1 (footnote 3 of X 2).",
    "The identification of Debes's function-field fundamental groups with SGA 1 pi_1 is not stated in the sections read.",
    "Inputs of XIII 2.11-2.12: XIII 1.10-1.11, 2.8-2.10 and 5.6 (tame specialization, cohomological properness): not read."
   ]
  },
  {
   "stageId": "InverseGaloisAndArithmeticFundamentalGroups:IG.2",
   "status": "partial",
   "remaining": [
    "Reductions to several parameters and variables (Debes 9.1 beyond the opening and Remarque 9.1.2), the purely inseparable case (Fried-Jarden 12.3.5), the Puiseux theorem (Debes 6.1.1) and Corollaire 2.4.4: unread. The proof of Lemme 9.2.2 has been read by the reviewer.",
    "Simultaneous avoidance and linear-disjointness variants: not read.",
    "Worked regular example with infinitely many specializations and certificates: absent."
   ]
  },
  {
   "stageId": "InverseGaloisAndArithmeticFundamentalGroups:IG.3",
   "status": "partial",
   "remaining": [
    "Proof of Riemann existence (Debes chapter 7) and of Theoreme 6.5.3; the proofs of Corollaire 6.1.13 (conjugation of invariants) and of the branch cycle lemma Corollaire 6.1.18 (via Proposition 6.1.17), the extensions/representations dictionary 6.2.2 and Proposition 6.2.3: unread. The converse direction of Theoreme 8.3.3 is not proved in the text.",
    "Example of a field of moduli that is not a field of definition: not found in the sources read.",
    "BelyiMaps / BelyiAnalyticCovers / BelyiAlgebraicAndDescent supplier check (dessins versus permutation triples): not performed."
   ]
  },
  {
   "stageId": "InverseGaloisAndArithmeticFundamentalGroups:IG.4",
   "status": "partial",
   "remaining": [
    "NSW Propositions 9.6.2-9.6.4, Lemma 9.6.5, Theorem 9.3.2, 9.2.2, 9.2.9, 3.5.9, 3.5.11, 3.8.8, section IX.5 (Scholz-Reichardt method, Neukirch's theorem): unread. Poitou-Tate duality is supplied by ArithmeticGaloisDuality:R02.4 (link added). Steps 2-3 of Theorem 9.6.7 have been read by the reviewer.",
    "Dihedral realization example and explicit local prescriptions: absent (the method does not realize prescribed local extensions)."
   ]
  },
  {
   "stageId": "InverseGaloisAndArithmeticFundamentalGroups:IG.5",
   "status": "partial",
   "remaining": [
    "Construction proofs (Wewers 1998, Fried-Voelklein 1991, Romagny-Wewers Proposition 4.5, Proposition 4.13 and the remainder of the proof of Theorem 4.11): unread. The published proofs of Romagny-Wewers Proposition 4.10 and Theorem 4.3 were read by the reviewer; the referee-noted gap concerned a previous version.",
    "Stack-theoretic Hurwitz spaces (R09.4) and compactification: not decomposed.",
    "Wild covers: Abhyankar's conjecture and its proof by Raynaud and Harbater are only stated (SGA 1 XIII p. 292, 2003 remark); patching not read; characteristic comparison example absent."
   ]
  },
  {
   "stageId": "InverseGaloisAndArithmeticFundamentalGroups:IG.6",
   "status": "partial",
   "remaining": [
    "Checked polynomials, field extensions, cover maps and Galois-group isomorphisms: not produced.",
    "BelyiArithmeticActions (Galois action on dessins, faithfulness) and generic polynomials: not consulted.",
    "Anabelian hand-off of path torsors: only SGA 1 V 7 paths; many register items are cited without proof."
   ]
  }
 ],
 "sources": [
  {
   "id": "sga1-revetements-etales-et-groupe-fondamental",
   "title": "Revetements etales et groupe fondamental (SGA 1)",
   "authors": "A. Grothendieck (with two exposes by M. Raynaud)",
   "edition": "Recomposed and annotated edition of Lecture Notes in Mathematics 224 (Springer 1971), Documents Mathematiques 3, SMF 2003; copy inspected: arXiv:math/0206203v2 (4 January 2004), 343 PDF pages, posted by the editors (not in the supplied library). Page numbers below are those of the recomposed edition, not the marginal 1971 page numbers. Independent review 2026-09-24: re-fetched from https://arxiv.org/pdf/math/0206203v2 (first page stamped 'arXiv:math/0206203v2 [math.AG] 4 Jan 2004'); SHA-256 8e64218d356456c534eebf996940f0f957e43b54f1a080241debe12cbaf60d3c, identical to the value recorded here. Printed page = PDF page - 16 in the range used.",
   "url": "https://arxiv.org/abs/math/0206203",
   "sha256": "8e64218d356456c534eebf996940f0f957e43b54f1a080241debe12cbaf60d3c",
   "readSections": [
    "Expose V, sections 4-9: axioms (G1)-(G6) and the steps a)-n) of the proof of Theoreme 4.1, Remarques 4.2; Definition 5.1, Propositions 5.2-5.6, 5.8, Corollaires 5.4, 5.7, 5.9, Remarques 5.10-5.11; Propositions 6.1, 6.4, 6.6, 6.9, 6.11, 6.13, Corollaires 6.2-6.3, 6.5, 6.7-6.8, 6.10, Remarque 6.12; section 7 (schemes); Propositions 8.1-8.2; section 9, pp. 98-118",
    "Expose IX, section 6: Theoreme 6.1 with proof, Corollaire 6.2, Remarque 6.3, Corollaire 6.4, Theoreme 6.5 statement and start of proof, pp. 195-197",
    "Expose X, sections 1-3: Definition 1.1, Proposition 1.2 (sketch), Theoreme 1.3, Corollaires 1.4, 1.7, 1.8, 1.9, Remarques 1.5, 1.10; Theoreme 2.1, Corollaires 2.2-2.4, Remarques 2.5, 2.7, 2.8, Theoreme 2.6, Theoreme 2.9 with Lemme 2.10 and Corollaire 2.11, Corollaire 2.12; the end of section 3 with Theoreme 3.8, Corollaires 3.9-3.10, Remarques 3.11, pp. 201-217",
    "Expose XII, section 5: Theoreme 5.1 (Riemann existence) with proof, Corollaire 5.2, Proposition 5.3 statement, pp. 251-254",
    "Expose XIII, section 2: Lemme 2.11 and Corollaire 2.12 with the proof of the characteristic 0 case and the start of the characteristic p case, pp. 290-291",
    "Reviewer (2026-09-24): Expose IX section 6 to Theoreme 6.5 statement and proof start (pp. 195-197); Expose X section 3 in full including purity 3.1-3.3, Corollaire 3.4, Lemme d'Abhyankar 3.6 with proof and Lemme 3.7 (pp. 212-217); Expose XII 4.5-4.6 and 5.3-5.4 with the Grauert-Remmert remark and the Expose XII bibliography (pp. 250-257); Expose XIII end of 2.10, Lemme 2.11 with proof, Corollaire 2.12 with its complete proof and the 2003 remark on Abhyankar's conjecture (pp. 289-292); Expose XIII bibliography (p. 322); page image of p. 114 (Proposition 6.11)"
   ]
  },
  {
   "id": "debes-arithmetique-des-revetements-de-la-droite",
   "title": "Arithmetique des revetements de la droite",
   "authors": "Pierre Debes",
   "edition": "Lecture notes (Notes de cours DEA/Master), chapters 1-10, work in progress (\"en chantier\"), PDF created 16 May 2024, 303 PDF pages; author copy from the author's publication page https://pro.univ-lille.fr/pierre-debes/publications (item V2, file V2-ArithRevDte-v2.pdf); not in the supplied library. Sections 7.4-7.7 are empty headings in this version. Page numbers are those printed in the notes. Independent review 2026-09-24: re-fetched from the URL above; SHA-256 7b07f882c9f7c9f7b5daa3b3a7ee7ecd5fed0484addd6b55fe93cc8fedc34374, identical to the value recorded here.",
   "url": "https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf",
   "sha256": "7b07f882c9f7c9f7b5daa3b3a7ee7ecd5fed0484addd6b55fe93cc8fedc34374",
   "readSections": [
    "Table of contents and preface, pp. v-xi",
    "Section 5.2 Hilbert irreducibility (Theoreme 5.2.1, Definition 5.2.2, Remarque 5.2.3, Theoreme 5.2.4, Proposition 5.2.5 with proof, Exemple 5.2.6, Lemme 5.2.7 with both proofs, Remarque 5.2.8, Theoreme 5.2.9 with Lemmes 5.2.11-5.2.13 and proofs, Remarque 5.2.10, Proposition 5.2.14 with proof, Remarque 5.2.15), pp. 135-144",
    "Section 6.2.1 (definition of the k-fundamental group of P^1 minus t, Theoreme 6.2.1 with proof, Lemme 6.2.2 with proof), pp. 171-173",
    "Section 6.5 Riemann existence (overview, Theoreme 6.5.1, Proposition 6.5.2 with proof, Theoreme 6.5.3 statement, Remarque 6.5.4), pp. 181-185",
    "Sections 7.4-7.7 (empty headings), p. 210",
    "Chapter 8, sections 8.1-8.4 (Theoremes 8.1.1-8.1.2, Remarque 8.1.3; Definition 8.2.1, Theoreme 8.2.2 with proof, Remarque 8.2.3, Theoreme 8.2.4, Remarque 8.2.5, examples 8.2.2.1-8.2.2.3, Lemme 8.2.6 with proof, Theoreme 8.2.7 with proof; Theoremes 8.3.1-8.3.3 with proofs; Propositions 8.4.1, 8.4.3, 8.4.4, Remarques 8.4.2, 8.4.5, Corollaire 8.4.6), pp. 211-229",
    "Section 9.1 opening and section 9.2.1 (Theoreme 9.2.1 with addendum and proof in the separable case, Lemme 9.2.2 statement), pp. 232-244",
    "Reviewer (2026-09-24): Remarque 6.1.11, Proposition 6.1.12 and Corollaire 6.1.13 statements (pp. 164-166); Corollaire 6.1.18 with proof and Proposition 6.1.19 (pp. 170-171); section 6.2.2 opening (pp. 173-174); chapter 9 opening with Exemple 9.0.1 and footnote 1 (pp. 231-232); Remarque 9.1.2 (pp. 235-236); proof of Lemme 9.2.2 and Remarque 9.2.3 (pp. 244-245); page images of pp. 217-218 (Lemme 8.2.6 matrices)"
   ]
  },
  {
   "id": "nsw-cohomology-of-number-fields-2e",
   "title": "Cohomology of Number Fields, second edition",
   "authors": "Juergen Neukirch, Alexander Schmidt and Kay Wingberg",
   "edition": "Grundlehren der mathematischen Wissenschaften 323, Springer; electronic edition version 2.3 (May 2020), 840 PDF pages, from the second author's page, which offers it \"free for non-commercial use\" (the catalogue record NSW_CohomologyNumberFields is \"book_requested\"; the file itself is not in the supplied library). Page numbers are those printed in the electronic edition. Independent review 2026-09-24: re-fetched the PDF https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf, linked from the author page above (the server returns the PDF only with that page as referrer); SHA-256 abbb7cdefc9ecb3350286c3cba36fe36a90c103257ff8f64173e09a50afdcb91, identical to the value recorded here. Printed page = PDF page - 14 in chapter IX.",
   "url": "https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/",
   "sha256": "abbb7cdefc9ecb3350286c3cba36fe36a90c103257ff8f64173e09a50afdcb91",
   "readSections": [
    "Chapter III, section 5 opening: Definitions 3.5.1-3.5.3 and Proposition 3.5.4 statement, pp. 189-190",
    "Chapter IX, section 5 opening: introduction, Definition 9.5.1, Proposition 9.5.2 with the start of its proof, pp. 557-559",
    "Chapter IX, section 6: Theorem 9.6.1 and the outline of the method, Proposition 9.6.2 statement (start), the statement lines of Propositions 9.6.3-9.6.4 and Lemma 9.6.5, Theorem 9.6.6, Theorem 9.6.7 with its first step and the fourth step and the characteristic-p case, Propositions 9.6.8-9.6.9, the proof of Theorem 9.6.1, Theorem 9.6.10 with proof, pp. 574-597. The proofs of Propositions 9.6.2-9.6.4, Lemma 9.6.5 and the second and third steps of Theorem 9.6.7 were not read.",
    "Reviewer (2026-09-24): Chapter IX section 5 introduction and the Scholz-Reichardt paragraph (pp. 557-560); Theorem 9.6.7 second and third steps (pp. 588-593), so that the whole proof of 9.6.7 has now been read except the proofs of Propositions 9.6.2-9.6.4 and Lemma 9.6.5"
   ]
  },
  {
   "id": "romagny-wewers-hurwitz-spaces",
   "title": "Hurwitz spaces",
   "authors": "Matthieu Romagny and Stefan Wewers",
   "edition": "Seminaires et Congres 13, SMF 2006, pp. 313-341; copy inspected: author copy from the first author's page (29 PDF pages, published pagination); not in the supplied library. Independent review 2026-09-24: re-fetched from the URL above; SHA-256 caed858ea899e029b96e3b840e605ad6432cdd1100b93125ef39a0d8abde18a0, identical to the value recorded here.",
   "url": "https://perso.univ-rennes1.fr/matthieu.romagny/articles/hurwitz_spaces.pdf",
   "sha256": "caed858ea899e029b96e3b840e605ad6432cdd1100b93125ef39a0d8abde18a0",
   "readSections": [
    "Section 1 introduction (1.1-1.3) and acknowledgments, pp. 313-316",
    "Section 2 (2.1-2.5, Theorem 2.1, Corollary 2.2), pp. 316-318",
    "Section 3.1-3.2 (Theorem 3.1, Proposition 3.2 with proof, Remark 3.3), pp. 318-320",
    "Section 4.1-4.2 (Definitions 4.1-4.2, Theorem 4.3 statement and discussion, Proposition 4.4), pp. 322-323; section 4.5 (Theorem 4.11, Corollary 4.12, first step of the proof), p. 328",
    "Reviewer (2026-09-24): Proposition 3.4, Theorem 3.5 (pp. 320-321); section 4.3 (Proposition 4.5, Lemma 4.6 with proof, Remark 4.7, Definitions 4.8-4.9, Proposition 4.10 with proof) and section 4.4 (proof of Theorem 4.3), pp. 323-327"
   ]
  },
  {
   "id": "debes-2026-hurwitz-spaces-and-inverse-galois-theory",
   "title": "Hurwitz spaces and Inverse Galois Theory",
   "authors": "Pierre Debes",
   "edition": "arXiv:2601.06532v2 [math.NT], dated April 14, 2026 (v1 submitted 10 January 2026), 27 pages; survey to appear in \"Low Dimensional Topology, Number Theory and Arithmetic Galois Theory\" (World Scientific) per the first page; not in the supplied library. Independent review 2026-09-24: re-fetched from https://arxiv.org/pdf/2601.06532v2 (first page stamped 'arXiv:2601.06532v2 [math.NT] 11 Apr 2026'; the date line reads April 14, 2026); SHA-256 7f640bc6cf08a39c342d06f63f52de37c279b0f5eee6b49f63b83863b2a24a66, identical to the value recorded here.",
   "url": "https://arxiv.org/abs/2601.06532",
   "sha256": "7f640bc6cf08a39c342d06f63f52de37c279b0f5eee6b49f63b83863b2a24a66",
   "readSections": [
    "Abstract, introduction and contents, pp. 1-3",
    "Section 2.1-2.4 (Theorem 2.1 with comments on proof, Corollary 2.2, Remark 2.3, Theorem 2.4, Proposition 2.5, Conjecture 2.6), pp. 12-15"
   ]
  }
 ],
 "other": {}
}
```

</details>

<details><summary><code>NeronModelsAndSemistableAbelianVarieties.json</code></summary>

```json
{
 "packet": "research/expansion/external/EXT-07/NeronModelsAndSemistableAbelianVarieties.json",
 "review": {
  "status": "accepted",
  "reviewer": "independent-review-REVIEW-EXT-13-EXT-07B",
  "date": "2026-09-24",
  "notes": "Every node, link, source locator and excerpt was checked against public copies fetched on 2026-09-24; all seven fetched files match the packet's SHA-256. Romagny, Lichtenstein, Conrad and Poonen were read in the PyMuPDF text layer, with formulas checked on page images. SGA 7 I has no text layer, so every cited passage of Expose IX (2.2.9, 2.4-2.6, 3.1-3.9, 5.10, 11.0-11.6, 12.1-12.7) and the preface were read on page images, not OCR. Raynaud 1970 section 8 and SGA 7 II XV 3.4 were also read on page images. Silverman AEC has no public copy, so its claims are marked 'not independently verified'; no node rests on it alone. Nodes: 5 verified, 19 corrected, 0 unverifiable. Main corrections: (1) SGA 7 IX 3.5 (ii) is misprinted as V ⊂ V^perp, and so is (2.5.5); the correct condition is V^perp ⊂ V, and (iii) W = V^perp, missing from the draft, was added. (2) Raynaud 8.1.4 concerns Q^tau, needs factoriality of X x_S S^sh, and 8.2.1 assumes (N)*; SGA 12.1 needs d^t = 1. (3) M and M' were swapped in IX 11.5. (4) The sign convention in 12.4.2 was reversed. (5) Oesterle's formula uses X^*(T). (6) IX 3.7 cites the non-existent 'Expose III', summarized in Expose I; the Abhyankar attribution was removed. (7) The smoothening node misstated E-permissibility and claimed a descent from R^sh. (8) SGA 7 IX 5.10 was located and added as a source. Links: 43 -> 44. 29 kept; 8 annotated; 3 re-pointed (Dedekind gluing -> elliptic node now from local existence; gluing -> Raynaud node now from the base-change/descent node; 8.1.2 -> 8.1.4 reversed); 3 removed (F0 -> smoothening, 11.5 -> L-factor, R06.6 -> 5.10: none is used by the consumer's proof); 4 added (3.6 -> 5.10, 2.2.9 -> 5.10, weak Neron property -> 6.1.1, Weil -> 6.1.1). No dangling endpoint and no stage or node cycle; an in-memory merge_decompositions dry-run of all seven EXT-07 packets succeeds. New implied stage edges: LPV.1 -> R11.3 and LPV.2 -> R11.4 (both drafted, acyclic); the rest are atlas or transitive edges. Gaps 7 -> 9 (Tate's theorem on p-divisible groups; Silverman unverifiable); five gap texts and five coverage records updated. Packet status stays partial; implementationStatus stays unchecked.",
  "checked": [
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.1/neron-model-definition-uniqueness-products-and-group-structure",
    "verdict": "corrected",
    "note": "Romagny p. 1, Lichtenstein 1.3.2-1.4.3 and Conrad 1.1-1.6 and properties 1-3 match. The hypotheses list held examples and remarks; it now states the actual setting (Dedekind scheme, abelian variety or smooth separated X) and marks Remark 1.6 and Examples 1.3.8-1.3.9 as context (1.3.8 needs residue characteristic != 2, 3). The Lichtenstein excerpt now shows the primes that the drafter's text layer had rendered as 0."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.1/weil-extension-theorem-for-rational-maps-into-smooth-group-schemes",
    "verdict": "corrected",
    "note": "Lichtenstein 2.1.1-2.1.4 match. The drafted sketch ('extend using purity-type arguments, and restrict to the diagonal') misdescribed the proof. The source shows the diagonal lies in dom(g), which it omits (BLR 4.4/1, Hartogs), takes the faithfully flat first projection Z' = V ∩ (Z x U) -> Z, and descends by 2.1.3. Proof steps rewritten; the imports are named."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-schemes-are-neron-models-and-good-reduction-criteria",
    "verdict": "verified",
    "note": "Lichtenstein 2.2.3-2.2.9 and Poonen Remark 5.7.24 match. SGA 7 IX 2.2.9 was read on the page image of p. 335, not OCR. The full list of equivalent conditions is recorded, and so is the absence of a perfectness hypothesis there."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.1/neron-smoothening-process",
    "verdict": "corrected",
    "note": "Romagny section 2 read in full. E-permissibility had been misstated as 'centres dense in the specializations of E'. Definition 2.4.1 requires F = Y ∩ E_k to lie in the smooth locus of Y and in the locally free locus of Omega^1|_Y, and to be dense in Y. Also, the acceptance item claimed the model is built after strict henselization and then descended; Romagny works over R and uses R^sh-points only as test points."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.1/weak-neron-mapping-property-for-rational-maps",
    "verdict": "corrected",
    "note": "Romagny 3.1-3.2.1 match. The proof uses constructibility and spreading out an isomorphism of local rings; it does not use Zariski's Main Theorem, as the drafted hypothesis said."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.1/local-existence-of-neron-models-via-birational-group-laws",
    "verdict": "verified",
    "note": "Romagny section 4 (4.1.1, 4.1.2, 4.2.1, 4.2.2, 4.2.3), Lichtenstein 1.3.10 and 3.6.1, and Poonen 5.7.25-5.7.26 match, including the citations to Artin 1986 and BLR 1.3."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.1/dedekind-local-to-global-gluing-of-neron-models",
    "verdict": "verified",
    "note": "Lichtenstein 2.3.1-2.3.4 and Poonen Remark 5.7.27 match. SGA 7 IX 3.2.1 ('se ramene en fait immediatement au cas local') was confirmed on the page image of p. 348."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.1/base-change-of-neron-models-unramified-and-ramified",
    "verdict": "corrected",
    "note": "Lichtenstein 1.4.3, 4.1.9 and 6.1.1-6.2.2 and Conrad property 2, Example 2.2 and Theorem 3.7 match. The source's definition of ramification index 1 (the residue extension is separable, possibly non-algebraic) was added. The node called y^2 = x^3 + p 'additive'; the source says only 'bad', so the cuspidal reduction is now marked as derived. The proof indications for 6.1.1 and 6.2.2 were added."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.1/invariant-differentials-of-the-neron-model-and-the-canonical-measure",
    "verdict": "corrected",
    "note": "Conrad section 4 (pp. 12-13) and Romagny 4.1 match. The identification Phi(k) = A(R)/A^0(R) also needs the fibre square and Lang's theorem, which were added. The global lattice remains a gap."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.2/identity-component-component-group-and-chevalley-decomposition",
    "verdict": "corrected",
    "note": "Conrad Definition 2.4, (3.1)-(3.2) and Lichtenstein 5.1.1, 5.2.5-5.2.7 match. Two fixes. Conrad does not name Lang's theorem at the surjectivity claim; it appears in his proof of 4.1. Lichtenstein's remark that c(A) counts geometrically connected components is made for abelian varieties; the drafted text restricted it to elliptic curves."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.2/neron-models-of-elliptic-curves-from-minimal-models-and-reduction-types",
    "verdict": "corrected",
    "note": "Lichtenstein 4.1.3-4.3.2 and Poonen 5.7.30 (with [Con15] = Conrad, Minimal models) match. The Silverman-only claims (VII.5.1 criteria, VII.6.1 orders) cannot be checked, since there is no public copy; they are now marked 'not independently verified'. No mathematical error was found."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.2/component-groups-of-57C2-rational-versus-geometric-points",
    "verdict": "verified",
    "note": "Conrad Examples 2.5 and 4.2 match. Example 4.2 itself misprints 'Phi_19(F_19) = Z/5Z with nontrivial Galois action' for Phi_19; the node follows 2.5 correctly. v_19(j) = -5 was checked from the printed j."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction-and-semiabelian-models-over-dedekind-bases",
    "verdict": "corrected",
    "note": "SGA 7 IX 3.1-3.4.0 were read on page images of pp. 343-349, including the proofs of 3.1 a)-d); Conrad 3.1-3.7 also read. The drafted 'Equivalently (Conrad 3.7)' was wrong, because 3.7 is the special case of connected fibres; it is now 'In particular'. The hypothesis about Proposition 3.1 was updated."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.3/galois-criterion-for-semistable-reduction",
    "verdict": "corrected",
    "note": "Read on the page images of pp. 338 and 340-353. The drafted (ii) ('V equal to the orthogonal of the toric part') was not the printed condition, and (iii) had been left out as illegible. The source prints (ii) as 'V ⊂ V^perp' and (iii) as 'W = V^perp', with perp taken for the polarization form (2.5.1). The printed (ii) and (2.5.5) are misprints: the rank diagram (2.5.4) and the last line of the proof require V^perp ⊂ V, and the node now uses that. The proof steps were rewritten from the page."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction-theorem-for-abelian-varieties",
    "verdict": "corrected",
    "note": "SGA 7 IX 3.6-3.7 (pp. 351-353) and Conrad 3.5 match. The proof of 3.7 cites 'III', not Expose I. Deligne's preface says Exposes III-V do not exist and were summarized in Expose I, and the hypothesis now records this. The drafted attribution to Abhyankar is not in IX 3.7 and was removed. The Silverman VII.5.4 excerpt is marked not independently verified."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.4/neron-models-of-jacobians-from-the-picard-functor-of-a-regular-model",
    "verdict": "corrected",
    "note": "Raynaud 8.0-8.2.3 were read on page images of pp. 63-67, and SGA 7 IX 12.1-12.2 on those of pp. 465-469. Several fixes. The Neron group of 8.1.4 is the subgroup Q^tau, not 'Q_S'. Factoriality is required of X x_S S^sh. Theorem 8.2.1 assumes property (N)*. Conditions (ii), (iii) and (v) are now stated precisely: over k(t'), universal for P^0_{t'}, and P_{S'}. SGA 12.1 b)-c) need d^t = 1, not d = 1, and 12.1 d) needs an integral geometric generic fibre. The consequences 12.1.10-12.1.12 were added. Murre's representability and Deligne-Mumford [5] were confirmed as citations."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.4/component-group-of-a-jacobian-from-multidegrees",
    "verdict": "corrected",
    "note": "Raynaud 8.1.1-8.1.2 was read on the page images of pp. 63-65. The finiteness in (ii) holds only if f is cohomologically flat or X has property (N); cyclicity of order d' needs (N)*. Condition b) of (iii) is 'Q^tau closed in Q', not Q'. The degree-0 subfunctor is P', not Q'."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.4/toric-character-group-of-a-degenerate-jacobian-from-the-dual-graph",
    "verdict": "corrected",
    "note": "SGA 7 IX 12.3-12.4 read on page images of pp. 469-475. The source's convention is d(x_i) = C'_i - C''_i, which the node had reversed. The excerpt garbled the quadratic form Sigma X_i^2 as 'x'. Both are fixed."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.4/picard-lefschetz-formula-monodromy-pairing-equals-the-graph-pairing",
    "verdict": "verified",
    "note": "SGA 7 IX 12.5-12.7.2 (pp. 475-476) and SGA 7 II XV Theoreme 3.4 (pp. 195-196) were read on page images; the n = 2m + 1 formula and the surjectivity of eps_x at regular points match. 12.6's remark that 10.5 extends the case to 10.4 in general was added."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.4/component-group-as-cokernel-of-the-monodromy-pairing",
    "verdict": "corrected",
    "note": "SGA 7 IX 11.0, 11.4-11.6 were read on page images of pp. 448 and 454-456. In sections 9-11, M = D(T'_0) is the character group of the torus of the dual and M' = D(T_0) is that of A (11.6.1, 12.4.6); the node had it the other way round. The proof steps now record the 11.6 construction as far as it was read."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich-criterion",
    "verdict": "corrected",
    "note": "Lichtenstein 5.2.1-5.2.9 and SGA 7 IX 2.2.9 match. Three fixes. Lichtenstein 5.2.9 concerns short exact sequences; isogeny invariance is derived here from V_l, or from Silverman VII.7.2 for elliptic curves. The source's index bound 'dividing c(A)' is correct only for separably closed k, since the index divides #Phi(k_s). The Silverman VII.7.1-7.3 claims are marked not independently verified."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.5/inertia-invariants-and-the-local-l-factor-from-the-special-fibre",
    "verdict": "corrected",
    "note": "Conrad (3.1)-(3.3) and Theorem 4.1 match. On the page image of p. 10, Oesterle's formula is written for the character group X^*(T), not X_*(T). The drafted phrase 'semisimplified local factor' misdescribed the inertia-invariant factor and was reworded."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.5/grothendieck-p-adic-good-reduction-criterion",
    "verdict": "corrected",
    "note": "Lichtenstein 5.3.1 matches. SGA 7 IX Corollaire 5.10 is now located and read on the page image of p. 385, and was added as a source. It holds for any trait and any l, with char K = 0 required when l = p, for Tate's theorem. Its proof uses 2.2.9, 5.8 with Tate's theorem, and 3.6. The claim that R06.6 owns this criterion was reworded."
   },
   {
    "nodeId": "NeronModelsAndSemistableAbelianVarieties:R11.6/exactness-of-neron-models-and-uniform-semistability-for-consumers",
    "verdict": "corrected",
    "note": "Lichtenstein 6.3.1 and the following paragraph, and Conrad 3.5, match. The drafted step 'exactness uses uniqueness of finite flat prolongations' goes beyond the source, which says only 'Raynaud's results on group schemes of type (p, ..., p)'; it is now marked unverified. The uniform-degree step needed persistence of semistability, which was added (IX 3.3, 3.5.1)."
   }
  ]
 },
 "nodes": {
  "changed": {
   "NeronModelsAndSemistableAbelianVarieties:R11.1/neron-model-definition-uniqueness-products-and-group-structure": {
    "sources": [
     {
      "sourceId": "romagny-2011-neron-models-of-abelian-varieties",
      "locator": "Section 1, the definition and the discussion after it, p. 1",
      "excerpt": "Definition. A Neron model of A_K over S is a smooth, separated model of finite type A that satisfies the Neron mapping property : each K-morphism u_K : Z_K -> A_K from the generic fibre of a smooth S-scheme Z extends uniquely to an S-morphism u : Z -> A.",
      "match": "Literal definition."
     },
     {
      "sourceId": "lichtenstein-neron-models-stanford-seminar",
      "locator": "Definition 1.3.2, Definition 1.3.6, Examples 1.3.7-1.3.9, Proposition 1.4.2, pp. 2-6",
      "excerpt": "If X' is any other Neron model of X there exists a unique isomorphism X -> X' over R inducing the identity on the common generic fiber X.",
      "match": "Literal Proposition 1.4.2(i), accents dropped (checked in the PyMuPDF text layer of the public PDF, which keeps the primes)."
     },
     {
      "sourceId": "conrad-2015-neron-models-tamagawa-factors-sha",
      "locator": "Theorem 1.1, Example 1.2, Remark 1.3, Examples 1.4-1.5, Remark 1.6, properties 1-3, pp. 2-4",
      "excerpt": "Neither of these properties is a formal consequence of the mapping property",
      "match": "Literal quotation from Remark 1.3 about separatedness and finite type."
     }
    ],
    "hypotheses": [
     "S is a Dedekind scheme (Romagny: noetherian, integral, normal, of dimension 1; Conrad Theorem 1.1: connected, normal, noetherian, of dimension 1) with function field K, and A_K is an abelian variety over K; Lichtenstein Definition 1.3.2 allows any smooth separated K-scheme X of finite type",
     "Existence is not part of this node: separatedness and finite type are imposed by the definition and are not formal consequences of the mapping property (Conrad Remark 1.3)",
     "Context, not a hypothesis (Conrad Remark 1.6): a smooth K-group of finite type has a Neron model over a DVR iff G(K^sh) is bounded (BLR 1.3/1); boundedness never holds for nontrivial connected semisimple groups over complete R with perfect residue field",
     "Non-examples recorded by Lichtenstein: 1.3.9 (BLR 3.5/5), P^n_R is not the Neron model of P^n_K because K-automorphisms need not extend; 1.3.8, for y^2 = x^3 + pi^2 over a DVR of residue characteristic != 2, 3 the smooth locus of the minimal Weierstrass model is too small to be the Neron model"
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.1/weil-extension-theorem-for-rational-maps-into-smooth-group-schemes": {
    "proofSteps": [
     "With U = dom(f), define the S-rational map g : Z x_S Z --> G by g(z_1, z_2) = f(z_1) f(z_2)^{-1} on U x_S U (Yoneda), and let V be its domain of definition.",
     "Show that the diagonal of Z x_S Z lies in V; this is where definedness of f in codimension 1 is used, and it is omitted in the notes (BLR 4.4/1).",
     "Put Z' = V intersect (Z x_S U) and let pi : Z' -> Z be the first projection; pi is flat since Z is smooth, and surjective because the fibre over a geometric point z contains (z, z) and meets the dense open T x_S U (footnote 4); so pi is faithfully flat.",
     "On Z', f o pi(z_1, z_2) = g(z_1, z_2) f(z_2) agrees with the morphism mult o (g x f) o (id x pr_2) on the S-dense open U x_S U, so f o pi is defined everywhere, and f is defined everywhere by Proposition 2.1.3."
    ],
    "hypotheses": [
     "S normal and noetherian, Z a smooth S-scheme, G a smooth separated S-group scheme (Lichtenstein Theorem 2.1.4)",
     "Imported and omitted in the source: the step that g is defined along the diagonal (BLR 4.4/1; the notes say only that it is a dimension argument resting on the algebraic Hartogs lemma), and the descent of definedness along faithfully flat maps (Proposition 2.1.3, BLR 2.5/5)",
     "This is the input that makes abelian schemes Neron models (Proposition 2.2.4) and completes the existence proof (Romagny Proposition 4.2.2; Lichtenstein Proposition 3.6.1)"
    ],
    "acceptance": [
     "Check that separatedness of G and smoothness of Z are both used; the statement fails for non-group targets (for example the inverse of the blow-up of a point of the affine plane over a field is defined in codimension 1 but not everywhere).",
     "Record that the diagonal step was not read (BLR 4.4/1)."
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-schemes-are-neron-models-and-good-reduction-criteria": {
    "sources": [
     {
      "sourceId": "lichtenstein-neron-models-stanford-seminar",
      "locator": "Definition 2.2.3, Proposition 2.2.4 with proof (2.2.6), Corollary 2.2.7 with Lemma 2.2.8 and proof, pp. 8-9",
      "excerpt": "Let R be a Dedekind domain with fraction field K. Let A be an abelian scheme over Spec R with generic fiber A. Then A is a Neron model of A.",
      "match": "Literal statement of Proposition 2.2.4."
     },
     {
      "sourceId": "sga7-I-expose-IX",
      "locator": "Corollaire 2.2.9 and 2.2.9.1, printed p. 335 (page image)",
      "excerpt": "Corollaire 2.2.9. (Cas de bonne reduction.) Soient S un trait, A_K un schema abelien sur le corps des fractions K de S, A le modele de Neron de A_K, l un nombre premier != car.k . Les conditions suivantes sont equivalentes.",
      "match": "Literal opening as read on the page image (accents dropped, the inequality sign transliterated). The conditions include (i) an abelian scheme over S with generic fibre A_K exists, (ii) A is an abelian scheme, (iv) A is proper over S and (v) T_l(A_K) is unramified; the closing paragraph says that an abelian scheme as in (i) is a Neron model of A_K and is unique up to unique isomorphism."
     },
     {
      "sourceId": "poonen-rational-points-on-varieties",
      "locator": "Remark 5.7.24, p. 143",
      "excerpt": "Thus A has good reduction if and only if it is the generic fiber of an abelian scheme over Spec R.",
      "match": "Literal quotation."
     }
    ],
    "hypotheses": [
     "The step (iii) => (ii) uses: a smooth R-scheme with geometrically connected generic fibre and proper special fibre is proper (Serre-Tate, Lemma 3 of section 1, cited; Conrad cites EGA IV 15.7.10)",
     "SGA 7 IX 2.2.9 is stated for an arbitrary trait S (no perfectness hypothesis on k) and lists further equivalent conditions: A^0 abelian, the special fibre A_0 abelian, A_0^0 abelian (lambda = mu = 0), A^0 proper, and every l^nu-torsion unramified (v bis); 2.2.9.1 names (v) and (v bis) the Neron-Ogg-Shafarevich criterion; its proof was not read"
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.1/neron-smoothening-process": {
    "title": "Romagny Theorem 2.4.2 (Neron's smoothening process, driven by the Neron-Raynaud Lemma 2.3.2): finitely many E-permissible blow-ups make every point of a given set E of R^sh-points lift to the smooth locus",
    "statement": "Let R be a DVR, A a flat R-scheme of finite type with smooth generic fibre and E a subset of A(R^sh). Neron's defect delta(a) is the length of the torsion submodule of a^*Omega^1_{A/R}, and delta(A, E) = max over a in E (finite, BLR 3.3/3); delta(A, E) = 0 iff E lies in A^sm(R^sh) (Lemma 2.2.2). A closed subscheme Y of A_k is E-permissible (Definition 2.4.1) if it is geometrically reduced and F = Y intersect E_k (E_k the set of specializations of the points of E) lies in the smooth locus of Y, lies in the largest open subscheme of Y where Omega^1_{A/R}|_Y is locally free, and is dense in Y. There is a finite sequence of E-permissible blow-ups A' -> A such that each point of E lifts uniquely to a smooth point of A'. Applied to E = A_0(R^sh) for a proper flat model A_0, it gives a smoothening A_1 -> A_0 whose smooth locus is a weak Neron model.",
    "acceptance": [
     "Record the omitted Lemma 2.3.2 as the load-bearing import of the local existence theorem.",
     "Check that R^sh-points serve only as test points: every blow-up centre is a closed subscheme of the special fibre A_k over k, and Romagny works over R throughout (there is no passage to R^sh followed by descent; the descent statement BLR 6.5/4 is not used in this construction)."
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.1/weak-neron-mapping-property-for-rational-maps": {
    "hypotheses": [
     "Weak Neron models are not unique: their special fibres contain extraneous components",
     "The proof uses constructibility of the image of the special fibre of the graph closure and the spreading out of an isomorphism of local rings of finitely presented R-schemes to open neighbourhoods; Zariski's Main Theorem is not invoked here (it is used later, in Theorem 4.2.1)"
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.1/base-change-of-neron-models-unramified-and-ramified": {
    "statement": "The formation of Neron models commutes with etale base change (Lichtenstein 1.4.3) and with localization, completion, henselization and strict henselization (Conrad, property 2). For a local extension R -> R' of DVRs with ramification index 1 (in Lichtenstein's sense: a uniformizer of R uniformizes R' and the residue extension k'/k is separable, possibly non-algebraic), a smooth K-group G has a Neron model over R iff G_{K'} has one over R', and then it is the base change (6.2.2, BLR 7.2/1); Neron models descend from R' inside R^sh (6.2.1, BLR 6.5/4). A smooth R-group G of finite type is the Neron model of its generic fibre iff G(R^sh) -> G(K^sh) is bijective (6.1.1, BLR 7.1/1). Ramified base change fails: y^2 = x^3 + p over Q_p (p not dividing 6; minimal since v(Delta) = 2 < 12) has bad reduction (the source says only 'bad'; the reduction y^2 = x^3 is cuspidal, so additive) but acquires good reduction over Q_p(p^{1/6}), so the base change of the non-proper Neron model is not the proper Neron model; for split multiplicative reduction the special fibre G_m x Z/nZ with n = -ord(j) becomes G_m x Z/neZ after ramification index e (Conrad Example 2.2). If A has semistable reduction everywhere, base change to any finite separable extension induces isomorphisms of relative identity components (Conrad Theorem 3.7, BLR 7.4).",
    "hypotheses": [
     "The statements 6.1.1, 6.2.1, 6.2.2 and Theorem 3.7 are quoted with BLR references; their proofs were not read",
     "Conrad Example 2.2: that the two identity components are the \"same\" G_m is stated as following from the mapping property and the identification of generic fibres",
     "Lichtenstein says that 6.1.1 is proved in BLR 7.1/1 with the weak Neron mapping property (3.3) and Weil's extension theorem (2.1.4), and that 6.2.2 is proved by reducing to strictly henselian R, R' via 6.2.1 and then checking 6.1.1 with the smoothening construction"
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.1/invariant-differentials-of-the-neron-model-and-the-canonical-measure": {
    "proofSteps": [
     "Invariant forms: Romagny Lemma 4.1.1 shows left-invariant forms on A_K are right-invariant; on a smooth group scheme Omega^d is generated by invariant forms (BLR 4.2, cited).",
     "Surjectivity of A(R) -> A(k) for complete R and smooth A, the fibre square A^0(R) = A(R) x_{A(k)} A^0(k) (A^0 is open in A), and Lang's theorem (A_k(k) -> Phi(k) is surjective; used in the proof of Theorem 4.1) give Phi(k) = A(R)/A^0(R).",
     "Scaling omega by c changes the measure by |c|, so an R-generator gives a canonical measure."
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.2/identity-component-component-group-and-chevalley-decomposition": {
    "statement": "For the Neron model A of an abelian variety over a Dedekind scheme and a closed point s, the component group Phi_s = A_s/A^0_s is a finite etale k(s)-group, viewed as Phi_s(k(s)^sep) with its Galois action. A_s(k(s)) -> Phi_s(k(s)) need not be surjective (obstruction in H^1(k(s), A^0_s)), but it is for finite k(s) (Conrad states this without proof; the reason, Lang's theorem, appears in his proof of Theorem 4.1). The Tamagawa number is c(A) = #Phi(k). Over a perfect residue field, A^0_k is uniquely an extension 1 -> T x U -> A^0_k -> B -> 1 with T a torus, U smooth connected unipotent and B an abelian variety (Chevalley); the toric, unipotent and abelian ranks are dim T, dim U, dim B. For l != char k, 0 -> V_l(T) -> V_l(A^0_k) -> V_l(B) -> 0 is exact (the unipotent part drops out).",
    "hypotheses": [
     "Chevalley's structure theorem and the structure of commutative linear algebraic groups over perfect fields are cited, not proved (Lichtenstein 5.2.5-5.2.6; Conrad section 3)",
     "Over imperfect fields Chevalley's theorem fails (Weil restrictions along purely inseparable extensions), relevant at generic points of special fibres of arithmetic surfaces",
     "Lichtenstein 5.1.1 remarks, citing [Liu, Cor. 10.2.21(a)] without proof, that c(A) is also the number of geometrically connected components of A_k and, for finite k, the number of connected components with a k-rational point (the remark is made for abelian varieties, not only elliptic curves); for elliptic curves it is also read off the minimal regular model ([Liu, Rem. 10.2.24])"
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.2/neron-models-of-elliptic-curves-from-minimal-models-and-reduction-types": {
    "sources": [
     {
      "sourceId": "lichtenstein-neron-models-stanford-seminar",
      "locator": "Section 4: Theorems 4.1.3, 4.1.5, 4.1.7, Examples 4.1.4, 4.1.8, Proposition 4.2.1, Definition 4.3.1, Proposition 4.3.2 with proof, pp. 16-20",
      "excerpt": "Write E sm for the smooth locus of E. The canonoical map E sm -> N induced by the NMP is an isomorphism.",
      "match": "Literal statement of Theorem 4.1.5 as extracted, including the source's typo \"canonoical\"."
     },
     {
      "sourceId": "poonen-rational-points-on-varieties",
      "locator": "Theorem 5.7.30, pp. 144-145",
      "excerpt": "Let W, E, and N be, respectively, a minimal Weierstrass model, the minimal regular proper model, and the Neron model.",
      "match": "Literal fragment of the hypotheses; the conclusion (E^smooth -> N and W^smooth -> N^0 are isomorphisms) is as stated, with proof cited to Conrad, Minimal models, Theorems 5.4 and 5.5."
     },
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "VII.5, Proposition 5.1; VII.6, Theorem 6.1 and Corollary 6.2, pp. 196, 200",
      "excerpt": "If E has split multiplicative reduction over K, then E(K)/E0 (K) is a cyclic group of order v(Delta) = -v(j). In all other cases, the group E(K)/E0 (K) is finite and has order at most 4.",
      "match": "Literal statement of Theorem VII.6.1 as extracted. Not independently verified: no public copy of the book was available to the independent review."
     }
    ],
    "statement": "Let R be a DVR with fraction field K and E/K an elliptic curve with minimal regular proper model E, minimal Weierstrass model W and Neron model N. Then E^sm -> N is an isomorphism and W^sm -> N^0 is an isomorphism. For K complete with finite residue field, the reduction map r : E(K) = N(R) -> N_k(k) defines E(K)^1 = ker r contained in E(K)^0 = r^{-1}(N^0_k(k)), with E(K)^0/E(K)^1 = N^0_k(k) and E(K)/E(K)^0 = Phi_E(k). Good, multiplicative and additive reduction (smooth, nodal, cuspidal minimal Weierstrass reduction; Silverman VII.5.1 criteria v(Delta) = 0; v(Delta) > 0, v(c_4) = 0; v(Delta), v(c_4) > 0, not independently verified) coincide with N^0_k being an elliptic curve, G_m, or G_a over the algebraic closure. In the split multiplicative case (Kodaira I_n, v(j) = -n) the special fibre of N is the smooth part of a loop of n rational curves, N^0_k = G_m, and E(K)/E_0(K) is cyclic of order -v(j), while otherwise it has order at most 4 (Silverman VII.6.1, not independently verified).",
    "hypotheses": [
     "Imported: existence and uniqueness of minimal regular proper models (Lichtenstein 4.1.3, \"a hard theorem\"), BLR 1.5/1 or Liu Lemma 10.2.12, Liu Prop. 10.2.26, Liu Thm 9.4.35, and Conrad's minimal models paper (Poonen 5.7.30 cites Theorems 5.4 and 5.5 there); none read",
     "Silverman VII.6.1 is stated without proof (\"a direct proof ... is quite lengthy\"), referring to Advanced Topics IV sections 5, 6 and 8 (Neron models and Tate's algorithm)",
     "Lichtenstein section 4 assumes residue characteristic != 2, 3 for Weierstrass models y^2 = x^3 + beta x + gamma; Tate's algorithm (Advanced Topics IV.9) handles all cases and was not read",
     "Silverman chapter VII assumes K complete for a discrete valuation with K and k perfect",
     "Not independently verified (review 2026-09-24): the Silverman-only claims (the valuation criteria of VII.5.1, the orders in VII.6.1, the chapter VII conventions and the pointer to Advanced Topics) rest on a private library copy; no public copy was available to the independent review. The E^sm, W^sm, filtration and reduction-type claims are checked in Lichtenstein section 4 and Poonen 5.7.30"
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction-and-semiabelian-models-over-dedekind-bases": {
    "sources": [
     {
      "sourceId": "sga7-I-expose-IX",
      "locator": "Proposition 3.2 with proof, 3.2.1, Corollaire 3.3 with proof, 3.3.2, Definition 3.4, 3.4.0, printed pp. 347-349 (page images)",
      "excerpt": "Proposition 3.2. Soient S un schema localement noetherien regulier integre de dimension 1, K son corps des fonctions rationnelles, A_K un schema abelien sur K, A son modele de Neron sur S",
      "match": "Literal opening as read on the page image of printed p. 347, accents dropped; the equivalent conditions (i)-(ii) and the open-subgroup conclusion are as stated in the node."
     },
     {
      "sourceId": "conrad-2015-neron-models-tamagawa-factors-sha",
      "locator": "Definitions 3.1, 3.3, 3.6, Theorem 3.7 and the following paragraph, pp. 6-7",
      "excerpt": "If an abelian variety A over F extends to a semi-abelian scheme A over S then the natural map A -> N(A_F) is an isomorphism onto N(A_F)^0.",
      "match": "Literal statement of Theorem 3.7 (BLR 7.4), notation transliterated."
     }
    ],
    "statement": "Let S be a locally noetherian regular integral scheme of dimension 1 with function field K, A_K an abelian variety and A its Neron model. The following are equivalent (3.2): (i) for every s in S, A^0_s has unipotent rank 0, i.e. is an extension of an abelian variety by a torus; (ii) there is a smooth separated S-group scheme G of finite type extending A_K whose fibres have unipotent rank 0. If G is as in (ii), the morphism G -> A is an isomorphism onto an open subgroup, hence an isomorphism on identity components. A_K then has semistable reduction (Definition 3.4). For a dominant S' -> S of the same type, A x_S S' -> A' (Neron model over S') is an open immersion, an isomorphism on identity components (3.3), though not in general on component groups. In particular (Conrad Theorem 3.7, quoting BLR 7.4), a semi-abelian scheme extending A_K maps isomorphically onto the identity component of the Neron model.",
    "hypotheses": [
     "Proposition 3.2 is deduced from Proposition 3.1 e) (kernels of homomorphisms of commutative group schemes; reductive and abelian ranks). The statement of 3.1 and the proofs of a)-d) were read on page images (printed pp. 343-345); they cite SGA 3 (XV 1.3, VI_A 5.6, VI_B 1.2, 2.2, 2.5, 4.3) and EGA IV 17.4.2, 17.8.2, which were not read, and the end of the proof of e) and Lemme 3.1.3 (p. 346) were only skimmed",
     "Semistability localizes to strictly henselian DVRs (3.4.0)"
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.3/galois-criterion-for-semistable-reduction": {
    "sources": [
     {
      "sourceId": "sga7-I-expose-IX",
      "locator": "Proposition 3.5 with proof, Remarques 3.5.1, Corollaire 3.5.2, printed pp. 350-351; Corollaire 3.8, printed p. 353; (2.5.1)-(2.5.5), printed pp. 340-341; Theoreme 2.4 statement, printed p. 338 (all page images)",
      "excerpt": "Proposition 3.5. (critere galoisien de reduction semi-stable). On suppose S un trait. Les conditions suivantes sur le schema abelien A_K sont equivalentes",
      "match": "Literal opening as read on the page image, accents dropped; conditions (i)-(iv), the corollaries and the misprint in (ii) are recorded in the node."
     }
    ],
    "proofSteps": [
     "Reduce to S henselian (3.4.0). In the notation of 2.1.9, (i) means lambda = 0; by the ranks in (2.5.4) this is W^perp = V + V^perp = V, i.e. V^perp contained in V, which is (ii).",
     "Since W = V ∩ V^perp by the orthogonality theorem 2.4 (2.5.2), (ii) is equivalent to (iii).",
     "(iv) means that I acts trivially on U/U^I = U/V (the printed text reads 'sur U^I = V'); by duality for the polarization form this says that I acts trivially on V^perp, i.e. V^perp is contained in U^I = V, which is (ii).",
     "(v): the image of a continuous unipotent action of a profinite group on an l-adic vector space is a pro-l group, so the action factors through I(l) = Z_l(1), and echelon 2 becomes (1 - g_U)^2 = 0 (3.5.2)."
    ],
    "title": "SGA 7 IX Proposition 3.5 and Corollaries 3.5.2, 3.8: semistable reduction iff the orthogonal of the fixed part lies in the fixed part, iff inertia acts unipotently of echelon 2 on T_l, iff it acts unipotently",
    "statement": "Let S be a trait, A_K an abelian variety over its fraction field K and l a prime different from the residue characteristic. Use the notation (2.5.3) after passing to the henselization of S: U = T_l(A(Kbar)), V = U^I its fixed part, W its toric part, and perp the orthogonal for the alternating form (2.5.1) attached to a polarization of A_K. The following are equivalent (Proposition 3.5): (i) A_K has semistable reduction on S (3.4); (ii) V^perp is contained in V (printed as 'V contained in V^perp'; see the hypotheses); (iii) the toric part W equals V^perp; (iv) the inertia group I acts unipotently of echelon 2 on U, i.e. there is an I-stable submodule U' with I acting trivially on U' and on U/U'. They are also equivalent to (v) I acts through its maximal pro-l quotient I(l) = Z_l(1) and a topological generator g satisfies (1 - g_U)^2 = 0 (Corollaire 3.5.2), and to (vi) I acts unipotently on U (Corollaire 3.8). Conditions (ii) and (iv) depend only on the Q_l-representation U (x) Q_l and are stable under base change by morphisms of traits, and (iv) passes to abelian subvarieties, quotients and isogenous abelian varieties, e.g. the dual (Remarques 3.5.1).",
    "hypotheses": [
     "Misprint in the source, read on page images of printed pp. 341 and 350: condition (ii) is printed 'V ⊂ V^perp' and (2.5.5) 'rang V/V∩V^perp = rang V/W = 2 lambda'. The inclusion diagram (2.5.4) and the sentence before (2.5.5) give rank V/W = 2 alpha and rank W^perp/V = rank V^perp/W = 2 lambda (lambda the unipotent rank, alpha the abelian rank), the proof of 3.5 ends with 'V^perp ⊂ U^I = V, ce qui est (ii)', and (ii) <=> (iii) through W = V ∩ V^perp needs V^perp ⊂ V. The node uses V^perp ⊂ V",
     "The proof uses the orthogonality theorem IX 2.4 (S henselian: the toric part of T_l(A) is the intersection of its fixed part with the orthogonal of the fixed part of T_l(A') for the canonical pairing (1.0.3)) in the polarized form (2.5.2) W = V ∩ V^perp; the statement of 2.4 was read (printed p. 338), its proof via the biextension W of (1.4.4) and VIII 2.2 was not",
     "Corollaire 3.8 uses that a unipotent algebraic group in characteristic 0 is connected, so a finite-index subgroup has the same echelon of unipotence; the finite-index subgroup acting with echelon 2 is supplied by Corollaire 3.7 (the monodromy theorem)",
     "Semistable reduction is defined through the Neron model (3.4); the reduction to henselian S is 3.4.0"
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction-theorem-for-abelian-varieties": {
    "sources": [
     {
      "sourceId": "sga7-I-expose-IX",
      "locator": "Theoreme 3.6 and its reduction to Corollaire 3.7 with the proof of 3.7, printed pp. 351-353 (page images)",
      "excerpt": "Theoreme 3.6. (theoreme de reduction semi-stable). Soient S un schema noetherien regulier connexe de dimension 1, K le corps des fonctions rationnelles de S, A_K un schema abelien sur K. Alors il existe une extension finie galoisienne K' de K, telle que le schema abelien A_{K'} = A_K (x)_K K' ait reduction semi-stable (3.4) sur le normalise S' de S dans K'.",
      "match": "Literal statement as read on the page image, accents dropped."
     },
     {
      "sourceId": "conrad-2015-neron-models-tamagawa-factors-sha",
      "locator": "Theorem 3.5 with the following paragraph, p. 7",
      "excerpt": "Explicitly, we can take F' to be the splitting field of A[l] for any prime l != char(k), where when l = 2 we really use A[4] instead.",
      "match": "Literal quotation, notation transliterated."
     },
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "VII.5, Proposition 5.4 (semistable reduction theorem) statement and Example 5.2, pp. 196-197",
      "excerpt": "This is true in general; after extending the ground field, additive reduction turns into either multiplicative or good reduction, while the latter two do not change; see (VII.5.4).",
      "match": "Literal quotation. Not independently verified: no public copy of the book was available to the independent review."
     }
    ],
    "hypotheses": [
     "SGA 7 IX: the proof reduces (via 3.5 (iv)) to Corollaire 3.7, that an open subgroup of inertia acts unipotently of echelon 2 on T_l. Through H^1(A_Kbar, Z_l) = Hom(T_l(A(Kbar)), Z_l), the source says 3.7 'a ete prouvee dans III' using resolution of singularities of excellent schemes of dimension 2 (printed p. 353, page image). Deligne's preface (p. VI) says Grothendieck's Exposes I-V were not written up, were summarized in Expose I, and that Exposes III-V do not exist; by the sommaire of Expose I the geometric proof of the monodromy theorem is its section 3. Expose I was not read",
     "Conrad: an alternative proof by Deligne in the appendix to Expose I of SGA 7 (monodromy, Neron smoothening and the Riemann hypothesis for abelian varieties over finite fields; Deligne's preface calls it (I.6)); not read",
     "The explicit choice K(A[l]) is stated by Conrad without proof in these notes",
     "Silverman VII.5.4 was read by the drafter only as a statement; not independently verified (no public copy)"
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.4/neron-models-of-jacobians-from-the-picard-functor-of-a-regular-model": {
    "sources": [
     {
      "sourceId": "raynaud-1970-specialisation-du-foncteur-de-picard",
      "locator": "Section 8.0 (Proposition 8.0.1), section 8.1: Definition 8.1.3, Theoreme 8.1.4 with proof, Remarques 8.1.5; section 8.2: Theoreme 8.2.1 with proof, Remarque 8.2.2, Proposition 8.2.3, pp. 63-67 (statements checked on page images)",
      "excerpt": "Alors on a les implications suivantes : (i) => (ii) => (iii) => (iv) <=> (v) <=> (vi) <=> (vii) => (viii). Par suite, les huit conditions sont equivalentes si delta = d'",
      "match": "Literal fragment of Theoreme 8.2.1 as read on the page image of p. 66, symbols transliterated and accents dropped."
     },
     {
      "sourceId": "sga7-I-expose-IX",
      "locator": "Theoreme 12.1 with 12.1.11-12.1.12 and 12.2, printed pp. 465-469 (page images)",
      "excerpt": "et ce dernier est neronien, i.e. satisfait la propriete universelle (1.1.2)",
      "match": "Literal fragment of 12.1 c) as read on the page image of printed p. 467, accents dropped; the other parts of 12.1 are summarized in the node."
     },
     {
      "sourceId": "conrad-2015-neron-models-tamagawa-factors-sha",
      "locator": "Example 2.3, pp. 4-5",
      "excerpt": "in such cases N(J)^0 = Pic^0_{X/S}.",
      "match": "Literal fragment, notation transliterated."
     }
    ],
    "proofSteps": [
     "8.1.4: reduce to S strictly henselian ([11], (2.3)); Q^tau is smooth of finite type and closed in Q (8.1.2 (iii)), so by [11], (3.3) it suffices that Q(S) -> Q(t) is bijective.",
     "Injectivity from separatedness of Q; surjectivity reduces to P(S) -> P(t) surjective.",
     "A point of P(t) comes from an invertible sheaf on X_t because the obstruction class in Br(t) is killed by delta and vanishes (perfect residue field, or delta prime to p).",
     "Factorial local rings extend the sheaf to X.",
     "8.2.1: after reducing to S = S' (delta, d' and representability of P^0 are invariant), (i) => (ii) => (iii) by 7.1.6, (iii) => (vi) by 7.2.4, (vi) <=> (vii) <=> (v) by 5.3, (vii) <=> (iv) by 6.4.5 (using P^0 = P^tau), and (iv) => (viii) is evident."
    ],
    "title": "Raynaud 1970 Theoremes 8.1.4 and 8.2.1, SGA 7 IX Theoreme 12.1: for a proper flat curve over a trait whose strict henselization has factorial local rings, the subgroup Q^tau of Q = P/E is a Neron group of finite type; in SGA 7's form P^0 is the identity component of the Neron model of the Jacobian",
    "statement": "Let S be a trait with strict henselization S', and f : X -> S proper and flat with equidimensional fibres of dimension 1 such that the local rings of X' = X x_S S' are factorial (e.g. X regular). Let P = Pic_{X/S}, E the schematic closure of the unit section and Q = P/E, a smooth separated S-group scheme (Proposition 8.0.1). Then the subgroup Q^tau of Q is a Neron S-group scheme of finite type if k(s) is perfect or if delta (6.1.1; the gcd of the total multiplicities of the irreducible components of X_s) is prime to the characteristic exponent of k(s) (Raynaud 8.1.4). If f satisfies property (N)* (6.1.4), consider (i) delta = 1; (ii) the generic fibre X'_{t'} has a divisor of degree 1 over k(t'); (iii) there is an invertible sheaf on X'_{t'} x_{t'} P^0_{t'} universal for P^0_{t'}; (iv) X is cohomologically flat over S and d' (6.1.11) = 1; (v) P_{S'} is representable; (vi) P^0 is representable; (vii) P^0 is separated over S; (viii) d' = 1. Then (i) => (ii) => (iii) => (iv) <=> (v) <=> (vi) <=> (vii) => (viii), and all eight are equivalent if delta = d', e.g. if the local rings of X are factorial and k(s) is perfect (Raynaud 8.2.1). SGA 7 IX 12.1 (S strictly local, f_*O_X = O_S, local rings of X factorial): with d_i the lengths of X_0 at its maximal points, mu_i the radicial multiplicities of their residue fields and d, d^t the gcds of the d_i and of the mu_i d_i (d = d^t for perfect k), eight conditions 1)-8) satisfy 1) <=> 2) => 3) => 4) <=> 5) <=> 6) <=> 7) => 8); if d^t = 1 then P is represented by a smooth group scheme, E is etale with Z^I = Gamma(S, E) (I the reduced components of X_0), and Q = P/E is a smooth separated Neron group; if moreover the geometric generic fibre is integral, 0 -> A -> Q -deg-> Z_S -> 0 is exact with A the Neron model of A_eta = P^0_eta = Pic^0_{X_eta/eta}, and P^0 -> A^0 is an isomorphism (12.1.10). When X_eta is smooth with a 0-cycle of degree 1 this gives A^0_0 = Pic^0_{X_0/k} (12.1.12), so A has semistable reduction iff Pic^0_{X_0/k} has unipotent rank 0 (12.1.11). Conrad Example 2.3 states N(J)^0 = Pic^0_{X/S} for the minimal regular proper model when the gcd of the geometric multiplicities of the components of each non-smooth fibre is 1.",
    "hypotheses": [
     "Q^tau, property (N)* (6.1.4), delta (6.1.1) and d' (6.1.11) are defined in Raynaud sections 3 and 6, which were not read; the reduction to strictly henselian S and the criterion 'Q^tau(S) -> Q^tau(t) bijective implies Neron' are quoted from Raynaud [11] (Modeles de Neron, C. R. Acad. Sci. 262 (1966)), (2.3) and (3.3), not read",
     "Raynaud's proof of 8.1.4: the obstruction to an invertible sheaf on X_t representing a point of P(t) is a class in Br(t) killed by delta (7.1.4); Br(t) is p-primary torsion for S strictly henselian and zero if k(s) is perfect ([8], (1.1)); factoriality extends the sheaf to X. Remarques 8.1.5: a) with Abhyankar's desingularization this gives Neron models of finite type of Jacobians over excellent traits with perfect residue field, a proof 'bien moins elementaire' than Neron's; b) X_t need not be smooth; c) for X regular and k(s) imperfect, Q^tau need not be Neron (9.2.3)",
     "Imported and not read: Raynaud sections 5-7 (5.3, 6.4.1-6.4.5, 7.1.1-7.1.6, 7.2.4), Raynaud [22 bis] for the proof of SGA 7 IX 12.1, and Murre's representability of P_eta (cited in 12.1 a) 3) via SGA 6 XII 1.5)",
     "SGA 7 IX 12.2: the proof of 12.1 is referred to [22 bis]; b), c), d) are easy consequences of a), whose delicate points are 3) => 4) => 5) and 7) => 4), trivial when X_0 is separable over k. SGA 7 uses 12.1 only when X_eta is smooth and the geometric special fibre has only ordinary double points; that this is equivalent to semistability for X regular and X_0 separable is left to the reader (12.1.11)",
     "Raynaud 8.2.3 (property (N)*, X_t a smooth curve of genus at least 2 with semistable Jacobian: P^0 representable) uses minimal regular models with separable special fibre from Deligne-Mumford [5]"
    ],
    "acceptance": [
     "Roadmap R11.4: construct the degree-zero Picard and generalized Jacobian of the semistable curves used by R13/R18, and relate it to the Neron model.",
     "Check the multiplicity hypothesis (delta, d^t or the gcd of geometric multiplicities equal to 1) in each application; without it P^0 need not be representable or separated."
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.4/component-group-of-a-jacobian-from-multidegrees": {
    "sources": [
     {
      "sourceId": "raynaud-1970-specialisation-du-foncteur-de-picard",
      "locator": "Section 8.1.1 and Proposition 8.1.2 with proof, pp. 63-65 (statement checked on the page image of p. 64)",
      "excerpt": "Supposons que X_eta soit geometriquement irreductible et notons Q' l'adherence schematique dans Q_S de Q^0_eta. Alors, on a un morphisme surjectif canonique",
      "match": "Literal opening of 8.1.2 (iii) reconstructed from the NUMDAM text layer, notation transliterated and accents dropped."
     }
    ],
    "statement": "Let S be strictly henselian, f : X -> S proper and flat with curve fibres, x_1, ..., x_r the maximal points of X_s with total multiplicities delta_i, and rho : Pic(X) -> Z^r sending an invertible sheaf to its degrees on the components divided by delta_i. (i) There is a canonical complex 0 -> D_0 -> D -alpha-> Z^r -beta-> Z with alpha the composite D -> Pic(X) -> Z^r and beta(n_i) = sum n_i delta_i. (ii) E(S) intersect P^0(S) = Ker(alpha)/Im(i); this group is finite and E(S) is of finite type if f is cohomologically flat or X satisfies property (N) (6.1.4), and it is cyclic of order d' if f satisfies (N)* (6.1.11). (iii) If the generic fibre is geometrically irreducible and Q' is the schematic closure of Q^0_eta in Q, there is a canonical surjection gamma : Ker(beta)/Im(alpha) -> Q'(S)/Q^0(S) = (Q'_s/Q^0_s)(k(s)) with finite kernel, zero if f is cohomologically flat. Moreover the following are equivalent: a) Q' is of finite type over S; b) Q^tau is closed in Q; c) Im(alpha) has rank r - 1 in Z^r; and, if X satisfies property (N), d) each X_i is the support of a divisor on X.",
    "hypotheses": [
     "D is the group of divisors supported on the special fibre and D_0 the principal ones (6.1.2-6.1.3, not read)",
     "Proof of (iii): the inverse image P' of Q' in P is the schematic closure of P^0_t (3.2 c)) and, X_t being geometrically irreducible, the subfunctor of invertible sheaves of total degree 0; rho : P(S) -> Z^r is surjective with kernel P^0(S) (7.1.2); as P' and Q' are formally smooth, P'(S)/P^0(S) -> Q'(S)/Q^0(S) is identified with (P'_s/P^0_s)(s) -> (Q'_s/Q^0_s)(s) (6.4.3), hence surjective; Ker(gamma) is torsion by taking norms from finite flat traits, and finite as a quotient of Ker(beta). The cited 3.2, 6.4.1, 6.4.3 and 7.1.2 were not read",
     "For a regular semistable model with perfect residue field this gives the component group of the Neron model of the Jacobian as the cokernel of the intersection matrix on degree-0 multidegrees; that corollary is not stated in the section read"
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.4/toric-character-group-of-a-degenerate-jacobian-from-the-dual-graph": {
    "sources": [
     {
      "sourceId": "sga7-I-expose-IX",
      "locator": "12.3 with 12.3.1-12.3.14, 12.4 with 12.4.1-12.4.7, printed pp. 469-475 (page images; the displays printed as (12.2.3), (12.2.4) on p. 471 are cited later as (12.3.3), (12.3.4))",
      "excerpt": "Il est clair qu'il est defini positif, car c'est la restriction a M ⊂ Z^I de la forme quadratique standard Σ X_i^2 sur Z^I.",
      "match": "Literal sentence after (12.4.5) as read on the page image of printed p. 474, accents dropped (the drafter's OCR had rendered Σ X_i^2 as 'x')."
     }
    ],
    "statement": "Let C be a separable proper curve over a separably closed field with normalization Cbar. The maximal torus T of Pic^0_{C} is the maximal torus of N = Ker(Pic^0_C -> Pic^0_{Cbar}), and with R(x) = coker(Z -> Z^{J(x)}) for the branches J(x) through x and R = (sum R(x))/Im Z^J, T = R (x) G_m and its character group is M = Ker(sum_x R(x)^vee -> Z^J) (12.3.3-12.3.4); equivalently M = H_1(Gamma(C), Z) for the dual graph with vertices the components and edges the pairs of branches through singular points (12.3.7). In the situation of 12.1 with special fibre having only ordinary double points (the Jacobian A_K has semistable reduction), the character group of the torus of the special fibre of the Neron model is M = Ker(d : Z^I -> Z^J) with I the double points, J the components and d(x_i) = C'_i - C''_i, where C'_i, C''_i are the components of the normalization carrying the two branches at x_i; d depends on the chosen order of the branches (12.4.1-12.4.2). The maps phi_x : M -> Z are well defined up to sign, and u = sum_x phi_x (x) phi_x is a canonical positive definite pairing on M (12.4.5)."
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.4/picard-lefschetz-formula-monodromy-pairing-equals-the-graph-pairing": {
    "sources": [
     {
      "sourceId": "sga7-I-expose-IX",
      "locator": "Theoreme 12.5, 12.6, 12.7 and Remarques 12.7.2, printed pp. 475-476 (page images)",
      "excerpt": "Theoreme 12.5 (\"Formule de PICARD-LEFSCHETZ\"). Soient S un trait strictement local, X un schema regulier, projectif et plat sur S, de dimension 1, dont la fibre geometrique generique est lisse et connexe, et la fibre geometrique speciale n'admet comme seuls points singuliers que des points quadratiques ordinaires.",
      "match": "Literal hypotheses as read on the page image of printed p. 475, accents dropped; the conclusion is as stated in the node."
     },
     {
      "sourceId": "sga7-II-expose-XV",
      "locator": "Theoreme 3.4 (Formule de Picard-Lefschetz) with (i)-(iii), printed pp. 195-196 (page images); 3.4 Resume names 3.1.2, 3.2.1-3.2.3 and 3.3.5 as the formula",
      "excerpt": "Theoreme 3.4 (Formule de Picard-Lefschetz). Soient S un trait strictement hensélien et f : X -> S un morphisme propre et plat purement de dimension relative n = 2m ou 2m + 1. On suppose que X_eta est lisse et que X_s ne présente que des singularités quadratiques ordinaires.",
      "match": "Literal hypotheses as read on the page image, arrow and subscripts transliterated; the imported formula for n odd is quoted in the proof steps."
     }
    ],
    "hypotheses": [
     "Proof for l != p rests on the cohomological Picard-Lefschetz formula for the action of inertia on H^1(X_eta, Z_l) = Hom(T_l(A), Z_l) (IX 12.7). This is SGA 7 II XV Theoreme 3.4: S strictly henselian trait, f proper flat of pure relative dimension n = 2m or 2m + 1, X_eta smooth, X_s with only ordinary quadratic singularities. It was read as a statement only; its proofs (XV 3.1.2-3.3.6, reducing to the transcendental formula XIV 3.2.11) were not read beyond steps (E)-(F) of 3.3",
     "Proof for l = p reduces to characteristic 0 with a single singular point (12.8 onwards, only located)",
     "The monodromy pairing (section 9) and the integrality theorem 10.4 were not read; 12.6 notes that 12.5 proves 10.4 in this case for the canonical polarization and that, by 10.5 (not read), this implies 10.4 in general"
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.4/component-group-as-cokernel-of-the-monodromy-pairing": {
    "sources": [
     {
      "sourceId": "sga7-I-expose-IX",
      "locator": "11.0, 11.4 opening, Theoreme 11.5, Remarques 11.5.2 and 11.6 opening, printed pp. 448, 454-456 (page images)",
      "excerpt": "Theoreme 11.5. Supposons S hensélien, et que A_K ait reduction semi-stable sur S. Soit l un nombre premier, et considerons l'accouplement de monodromie (9.1.2), d'ou un homomorphisme canonique u_l : M_l -> M'_l dual. Soit Phi(l) = coker u_l ; alors on a un isomorphisme canonique (11.5.1) Phi_0(l) = Phi(l) x_S s.",
      "match": "Literal statement as read on the page image, symbols transliterated."
     }
    ],
    "proofSteps": [
     "The perfect pairing (11.4.1) follows at once: applying 11.5 to A'_K and using (10.2.2) gives Phi'_0(l) = coker(transpose of u_l : M'_l -> M_l^vee) x_S s.",
     "The proof of (11.5.1) (11.6 onwards) reduces to S strictly local (11.6.1) and constructs Phi_0(l) = Ker(u_l (x) D_l) (11.6.2), then identifies Ker(u_l (x) D_l) with coker(u_l) (11.6.3); the construction beyond 11.6.3 was not read."
    ],
    "statement": "Let S be a henselian trait and A_K an abelian variety with semistable reduction. For a prime l, the monodromy pairing (9.1.2) gives a canonical homomorphism u_l : M_l -> (M'_l)^vee, where in sections 9-11 M = D(T'_0) and M' = D(T_0) are the character groups of the maximal tori T'_0 and T_0 of the special fibres of the Neron models of the dual A'_K and of A_K respectively (11.6.1; 12.4.6 notes that section 12 swaps this notation, harmlessly for a principally polarized Jacobian). With Phi(l) = coker u_l there is a canonical isomorphism Phi_0(l) = Phi(l) x_S s of the l-primary part of the component group (11.5.1), and similarly for the dual. This gives a perfect pairing between the component groups of A and A' (11.4.1), shows u_l is an isogeny also for l = p, and, using the integral monodromy pairing u : M (x) M' -> Z of 10.4, identifies the component group with coker(u : M -> M'^vee) (Remarques 11.5.2 b).",
    "hypotheses": [
     "11.5 does not use the deeper Theorem 10.4; the integral version in 11.5.2 b) does",
     "The monodromy pairing (section 9) was not read; of 11.4 (the pairing (11.4.1) of component groups) and 11.6 (the construction of (11.5.1)) only the openings were read (printed pp. 454, 456)",
     "Combined with the Picard-Lefschetz formula 12.5 this computes the component group of a semistable Jacobian from the dual graph; the combination is not written out in the pages read"
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich-criterion": {
    "sources": [
     {
      "sourceId": "lichtenstein-neron-models-stanford-seminar",
      "locator": "Section 5.2: Theorem 5.2.1, 5.2.2-5.2.8 (proof), Corollary 5.2.9, pp. 20-22",
      "excerpt": "Let A be an abelian variety over K and Fix a prime l != p. The following are equivalent. i. A has good reduction. ii. The l-adic Tate module T_l(A) is an unramified representation of G_K; i.e. I acts upon it trivially.",
      "match": "Literal statement of Theorem 5.2.1 with notation transliterated (including the source's capital \"Fix\")."
     },
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "VII.7, Theorem 7.1 with proof, Corollaries 7.2-7.3 with proofs, pp. 201-202",
      "excerpt": "Let E1 /K and E2 /K be elliptic curves that are isogenous over K. Then E1 has good reduction over K if and only if E2 has good reduction over K.",
      "match": "Literal statement of Corollary VII.7.2. Not independently verified: no public copy of the book was available to the independent review."
     }
    ],
    "proofSteps": [
     "(i) => (ii): if A has good reduction, A_k is an abelian variety, so A_k[l^n](k_s) has rank 2d, and by Lemma 5.2.3 so does A[l^n](K_s)^I; hence inertia acts trivially.",
     "(ii) => (i): write A^0_k as an extension of B by T x U; A^0_k[l^n](k_s) is free of rank dim T + 2 dim B, with index in A_k[l^n](k_s) dividing #Phi(k_s) (the source writes c(A) = #Phi(k) and identifies A_k[l^n](k_s) with A_k[l^n](k), which is right only for separably closed k; the argument needs only an index bounded independently of n).",
     "If T_l is unramified, A_k[l^n](k_s) has order l^{2n dim A} for large n; comparing, 2 dim A = dim T + 2 dim B, and with dim T + dim U + dim B = dim A this forces T = U = 0.",
     "So A^0_k is proper and A has good reduction (Corollary 2.2.7)."
    ],
    "statement": "Let R be a DVR with fraction field K and perfect residue field k of characteristic p, A an abelian variety over K and l != p. Then A has good reduction iff T_l(A) is unramified (inertia acts trivially). Consequently good reduction passes to A' and A'' in a short exact sequence 0 -> A' -> A -> A'' -> 0 of abelian varieties (Lichtenstein 5.2.9), and is invariant under isogeny (derived here: isogenous abelian varieties have isomorphic V_l, and T_l is unramified iff V_l is; Silverman VII.7.2 states it for elliptic curves). Not independently verified (Silverman, no public copy): for elliptic curves E has potential good reduction iff inertia acts on T_l(E) through a finite quotient (VII.7.3), and good reduction iff E[m] is unramified for all (or infinitely many) m prime to char k iff T_l(E) is unramified for some (all) l != char k (VII.7.1).",
    "hypotheses": [
     "Lichtenstein's proof uses: A[l^n](K_s)^I = A[l^n](K^nr) = A[l^n](R^sh) = A_k[l^n](k_s) (Lemma 5.2.3, with BLR 7.3/3 for the last bijection); Chevalley's structure theorem over perfect k; and Corollary 2.2.7 (proper identity component implies good reduction)",
     "Silverman's proof uses the finiteness of E(K^nr)/E_0(K^nr) (VII.6.2, from the Neron model or Tate's algorithm, cited) and injectivity of prime-to-p torsion into the reduction (VII.3.1); not independently verified (no public copy of Silverman)",
     "Perfect residue field is assumed in Lichtenstein section 5.2 and in Silverman chapter VII",
     "SGA 7 IX 2.2.9 (v), (v bis), named the Neron-Ogg-Shafarevich criterion in 2.2.9.1, is stated for any trait, without the perfectness hypothesis; its proof was not read"
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.5/inertia-invariants-and-the-local-l-factor-from-the-special-fibre": {
    "hypotheses": [
     "Imported: the reduction bijection on l-power torsion over henselian R (Zariski's Main Theorem for quasi-finite separated schemes; BLR 7.3/3), Chevalley's theorem, Lang's theorem, the Riemann hypothesis for abelian varieties over finite fields, and Oesterle's formula #T(k) = det(q - phi | X^*(T)) for the character group (Conrad then passes to the cocharacter group X_*(T) by the duality X^*(T) x X_*(T) -> Z)",
     "The independence of l for V_l(B) uses the theory of abelian varieties over finite fields (cited)",
     "The local factor is computed from the inertia invariants V_l(A)^I; the stage's further request (the Weil-Deligne monodromy operator N and the conductor) is not in these sources"
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.5/grothendieck-p-adic-good-reduction-criterion": {
    "sources": [
     {
      "sourceId": "lichtenstein-neron-models-stanford-seminar",
      "locator": "Section 5.3, Theorem 5.3.1, p. 22",
      "excerpt": "Then A has good reduction if and only if its p-divisible group A(p) extends to a p-divisible group over R.",
      "match": "Literal conclusion of Theorem 5.3.1."
     },
     {
      "sourceId": "sga7-I-expose-IX",
      "locator": "Corollaire 5.10 and the start of its proof, printed p. 385 (page image)",
      "excerpt": "Pour que A_K ait bonne reduction sur S, il faut et il suffit que le pro-l-groupe de Barsotti-Tate T_l(A_K) \"ait bonne reduction sur S\", i.e. se prolonge en un groupe de Barsotti-Tate sur S.",
      "match": "Literal conclusion of Corollaire 5.10, accents dropped. Its hypotheses: A_K an abelian scheme over the fraction field K of a trait S, l a prime, and char K = 0 when l = p. Added by the independent review."
     }
    ],
    "proofSteps": [
     "Necessity is clear (stated in the source).",
     "For l != p sufficiency is Corollaire 2.2.9; one may assume S henselian (2.2.9).",
     "If A_K has semistable reduction, Proposition 5.8 applied to F = T_l(A_K) gives T_l(A_K) = T_l(A_K)^f, so the maximal torus of A_0 is trivial, A_0^0 is an abelian scheme, and 2.2.9 (iii°) concludes.",
     "In general, with S strictly local, take a finite Galois extension K' with semistable reduction on the normalization S' (3.6) and let G = Gal(K'/K) act on the Neron model over S'; the remainder of the argument (p. 386) was not read."
    ],
    "title": "Grothendieck (SGA 7 IX Corollaire 5.10, quoted by Lichtenstein 5.3.1): in mixed characteristic, A has good reduction iff its p-divisible group extends to R",
    "statement": "Let R be a DVR of mixed characteristic (0, p) with fraction field K and A an abelian variety over K. Then A has good reduction iff its p-divisible group A(p) extends to a p-divisible group over R. Combined with Neron-Ogg-Shafarevich, for every prime l (including p) good reduction is equivalent to the l-divisible group extending over R. SGA 7 IX 5.10 states this for any trait S and any prime l, assuming char K = 0 when l = p.",
    "hypotheses": [
     "SGA 7 IX 5.10 assumes char K = 0 when l = p, in order to use Tate's theorem on p-divisible groups (invoked in 5.8); Lichtenstein assumes mixed characteristic (0, p) and notes that later work of de Jong treats equal characteristic p",
     "The proof, read only on printed p. 385, uses 2.2.9 for l != p, Proposition 5.8 with Tate's theorem ([33]) in the semistable case, and the semistable reduction theorem 3.6 in general; 5.8, Tate's theorem and the rest of the proof (p. 386) were not read",
     "A related crystalline statement (a Tate module with good reduction is crystalline) is in the scope of PadicHodgeTheory R06.6; it is not used in the proof of 5.10"
    ],
    "acceptance": [
     "Roadmap R11.5 asks for p-adic comparison via R06; this node is the group-scheme form of the p-adic criterion, whose proof uses Tate's theorem on p-divisible groups rather than R06.6."
    ]
   },
   "NeronModelsAndSemistableAbelianVarieties:R11.6/exactness-of-neron-models-and-uniform-semistability-for-consumers": {
    "proofSteps": [
     "Good reduction of A' and A'' follows from Neron-Ogg-Shafarevich since their Tate modules are subquotients of T_l(A).",
     "Exactness: Lichtenstein says only that the proof 'uses Raynaud's results on group schemes of type (p, p, ..., p)'. BLR 7.5/4 was not read, so which of these results is used (for instance uniqueness of finite flat prolongations for e < p - 1, Raynaud 1974 Theoreme 3.3.3) is not verified.",
     "The uniform degree: K(A[15]) contains K(A[3]) and K(A[5]); at every place at least one of 3, 5 differs from the residue characteristic, so Theorem 3.5 gives semistability there, which persists under further extension (SGA 7 IX 3.3, 3.5.1); and Gal(K(A[15])/K) embeds in GL_{2g}(Z/15Z)."
    ],
    "hypotheses": [
     "BLR 7.5/4 is quoted, not proved, in the source read",
     "The character-group exact sequences with degeneracy-map functoriality for level lowering (Ribet) and the equation-level/scheme-level comparison for R29 invariants are not in the sources read (gap)",
     "The left exactness in the semi-abelian case and the semi-abelian reduction of A', A'' are stated in the paragraph after 6.3.1, under the standing hypotheses of 6.3.1 and with reference to 'a criterion of Grothendieck to be discussed later'; no proof is given"
    ]
   }
  },
  "added": [],
  "removed": []
 },
 "links": {
  "added": [
   {
    "source": "NeronModelsAndSemistableAbelianVarieties:R11.1/local-existence-of-neron-models-via-birational-group-laws",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.2/neron-models-of-elliptic-curves-from-minimal-models-and-reduction-types",
    "reason": "Theorem 4.1.5 is proved by running the local Neron construction (smoothening, omega-minimal components, Weil's theorem on birational group laws) starting from the minimal regular proper model E; minimality keeps E^sm unchanged. Re-pointed by the independent review: the drafted source was the Dedekind gluing node, but Lichtenstein section 4 works over a DVR and uses no gluing.",
    "sources": [
     {
      "sourceId": "lichtenstein-neron-models-stanford-seminar",
      "locator": "proof of Theorem 4.1.5, pp. 17-18"
     }
    ]
   },
   {
    "source": "NeronModelsAndSemistableAbelianVarieties:R11.1/base-change-of-neron-models-unramified-and-ramified",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.4/neron-models-of-jacobians-from-the-picard-functor-of-a-regular-model",
    "reason": "Raynaud's proof of Theoreme 8.1.4 reduces to S strictly henselian by [11] (2.3) and concludes by [11] (3.3): a smooth finite-type S-group over strictly henselian S whose S-points map bijectively to its generic points is Neron. These are the descent from R^sh and the R^sh-points criterion recorded in the base-change node (Lichtenstein 6.2.1 and 6.1.1; BLR 6.5/4 and 7.1/1); Raynaud [11] (C. R. Acad. Sci. 262, 1966) and the BLR proofs were not read. Re-pointed by the independent review: the drafted source was the Dedekind gluing node, which 8.1.4 (a statement over a trait) does not use; Remarque 8.1.5 a) goes the other way, from 8.1.4 to Neron models of Jacobians. The implied stage edge R11.1 -> R11.4 is unchanged.",
    "sources": [
     {
      "sourceId": "raynaud-1970-specialisation-du-foncteur-de-picard",
      "locator": "proof of Theoreme 8.1.4, p. 65"
     },
     {
      "sourceId": "lichtenstein-neron-models-stanford-seminar",
      "locator": "Propositions 6.1.1 and 6.2.1, p. 22"
     }
    ]
   },
   {
    "source": "NeronModelsAndSemistableAbelianVarieties:R11.4/component-group-of-a-jacobian-from-multidegrees",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.4/neron-models-of-jacobians-from-the-picard-functor-of-a-regular-model",
    "reason": "The proof of Theoreme 8.1.4 uses Proposition 8.1.2 (iii): Q^tau is smooth of finite type over S and closed in Q. Direction reversed by the independent review: 8.1.2 precedes and is cited by 8.1.4; reading 8.1.2 (iii) as a description of the Neron component group uses 8.1.4 only interpretively.",
    "sources": [
     {
      "sourceId": "raynaud-1970-specialisation-du-foncteur-de-picard",
      "locator": "proof of Theoreme 8.1.4, p. 65"
     }
    ]
   },
   {
    "source": "NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction-theorem-for-abelian-varieties",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.5/grothendieck-p-adic-good-reduction-criterion",
    "reason": "The proof of SGA 7 IX Corollaire 5.10 treats the general case by passing to a finite Galois extension over which A_K has semistable reduction (Theoreme 3.6). Added by the independent review.",
    "sources": [
     {
      "sourceId": "sga7-I-expose-IX",
      "locator": "proof of Corollaire 5.10, printed p. 385 (page image)"
     }
    ]
   },
   {
    "source": "NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-schemes-are-neron-models-and-good-reduction-criteria",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.5/grothendieck-p-adic-good-reduction-criterion",
    "reason": "The proof of Corollaire 5.10 takes the case l != p from Corollaire 2.2.9 and finishes the semistable case with 2.2.9 (iii°). Added by the independent review.",
    "sources": [
     {
      "sourceId": "sga7-I-expose-IX",
      "locator": "proof of Corollaire 5.10, printed p. 385 (page image)"
     }
    ]
   },
   {
    "source": "NeronModelsAndSemistableAbelianVarieties:R11.1/weak-neron-mapping-property-for-rational-maps",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.1/base-change-of-neron-models-unramified-and-ramified",
    "reason": "Lichtenstein 6.1.1 (a smooth finite-type R-group G is the Neron model of its generic fibre iff G(R^sh) -> G(K^sh) is bijective) is proved in BLR 7.1/1 using the weak Neron mapping property (3.3); the proof was not read. Added by the independent review.",
    "sources": [
     {
      "sourceId": "lichtenstein-neron-models-stanford-seminar",
      "locator": "Proposition 6.1.1 and its one-line proof indication, p. 22"
     }
    ]
   },
   {
    "source": "NeronModelsAndSemistableAbelianVarieties:R11.1/weil-extension-theorem-for-rational-maps-into-smooth-group-schemes",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.1/base-change-of-neron-models-unramified-and-ramified",
    "reason": "The same proof of 6.1.1 uses Weil's extension theorem 2.1.4. Added by the independent review.",
    "sources": [
     {
      "sourceId": "lichtenstein-neron-models-stanford-seminar",
      "locator": "Proposition 6.1.1 and its one-line proof indication, p. 22"
     }
    ]
   }
  ],
  "removed": [
   {
    "source": "NeronModelsAndSemistableAbelianVarieties:R11.1/dedekind-local-to-global-gluing-of-neron-models",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.2/neron-models-of-elliptic-curves-from-minimal-models-and-reduction-types",
    "reason": "The elliptic comparison is made over DVR localizations of the Dedekind base.",
    "sources": [
     {
      "sourceId": "lichtenstein-neron-models-stanford-seminar",
      "locator": "section 4, p. 16"
     }
    ]
   },
   {
    "source": "AdicSpacesPartII:F0",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.1/neron-smoothening-process",
    "reason": "The atlas names formal geometry (F0) as an input of R11.1 (existing atlas edge F0 -> R11.1), and the smoothening node is where an existence proof over excellent DVRs would consume it. The sources read use only blow-ups, strict henselization, completion as a faithfully flat base change and Weil's birational group laws, so the dependency is recorded, not exercised. BLR, which may use it, is absent.",
    "sources": [
     {
      "sourceId": "romagny-2011-neron-models-of-abelian-varieties",
      "locator": "section 2, pp. 2-4"
     }
    ]
   },
   {
    "source": "NeronModelsAndSemistableAbelianVarieties:R11.1/dedekind-local-to-global-gluing-of-neron-models",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.4/neron-models-of-jacobians-from-the-picard-functor-of-a-regular-model",
    "reason": "Raynaud's theorem produces the Neron model of the Jacobian over a trait; it is glued over Dedekind bases as in R11.1. The Picard route is an alternative to the general existence proof (Remarque 8.1.5). New stage edge R11.1 -> R11.4 (implied by the atlas chain).",
    "sources": [
     {
      "sourceId": "raynaud-1970-specialisation-du-foncteur-de-picard",
      "locator": "Remarques 8.1.5, p. 66"
     }
    ]
   },
   {
    "source": "NeronModelsAndSemistableAbelianVarieties:R11.4/neron-models-of-jacobians-from-the-picard-functor-of-a-regular-model",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.4/component-group-of-a-jacobian-from-multidegrees",
    "reason": "Proposition 8.1.2 computes Q'/Q^0 for the group Q of Theoreme 8.1.4.",
    "sources": [
     {
      "sourceId": "raynaud-1970-specialisation-du-foncteur-de-picard",
      "locator": "Proposition 8.1.2 and Theoreme 8.1.4, pp. 64-65"
     }
    ]
   },
   {
    "source": "NeronModelsAndSemistableAbelianVarieties:R11.4/component-group-as-cokernel-of-the-monodromy-pairing",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.5/inertia-invariants-and-the-local-l-factor-from-the-special-fibre",
    "reason": "The Tamagawa factor #Phi(k) in the point count is the component group described via the monodromy pairing in the semistable case.",
    "sources": [
     {
      "sourceId": "conrad-2015-neron-models-tamagawa-factors-sha",
      "locator": "Theorem 4.1, p. 11"
     },
     {
      "sourceId": "sga7-I-expose-IX",
      "locator": "Theoreme 11.5, printed p. 455"
     }
    ]
   },
   {
    "source": "PadicHodgeTheory:R06.6",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.5/grothendieck-p-adic-good-reduction-criterion",
    "reason": "The p-adic good/semistable reduction comparisons for Tate modules are owned by R06.6. Existing atlas edge R06.6 -> R11.5.",
    "sources": [
     {
      "sourceId": "lichtenstein-neron-models-stanford-seminar",
      "locator": "Theorem 5.3.1, p. 22"
     }
    ]
   }
  ],
  "changed": [
   {
    "source": "NeronModelsAndSemistableAbelianVarieties:R11.1/neron-model-definition-uniqueness-products-and-group-structure",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.1/base-change-of-neron-models-unramified-and-ramified",
    "reason": "Etale base change and the criterion 6.1.1 are consequences of the mapping property and uniqueness. Annotation (independent review): only Proposition 1.4.3 is a formal consequence of the mapping property; Lichtenstein says 6.1.1 (BLR 7.1/1) is proved with the weak Neron mapping property and Weil's extension theorem, recorded by two links added in review.",
    "sources": [
     {
      "sourceId": "lichtenstein-neron-models-stanford-seminar",
      "locator": "Proposition 1.4.3 and section 6, pp. 6, 22"
     }
    ]
   },
   {
    "source": "NeronModelsAndSemistableAbelianVarieties:R11.2/neron-models-of-elliptic-curves-from-minimal-models-and-reduction-types",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.2/component-groups-of-57C2-rational-versus-geometric-points",
    "reason": "The Galois action on Phi_19 is that of nonsplit multiplicative reduction. Annotation (independent review): the elliptic node supplies the geometric component group Z/nZ with n = -v(j) only in the split case (Lichtenstein 4.1.8); that Frobenius acts on Phi_19 through the quadratic character in the nonsplit case is asserted by Conrad (Example 2.5) without proof and is not supplied by that node.",
    "sources": [
     {
      "sourceId": "conrad-2015-neron-models-tamagawa-factors-sha",
      "locator": "Example 2.5, p. 5"
     }
    ]
   },
   {
    "source": "NeronModelsAndSemistableAbelianVarieties:R11.2/identity-component-component-group-and-chevalley-decomposition",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction-and-semiabelian-models-over-dedekind-bases",
    "reason": "Semistable reduction is defined by the vanishing of the unipotent part of the Chevalley decomposition of A^0_s. Annotation (independent review): Conrad Definitions 3.1, 3.3 and SGA 7 IX 3.2 (i) define semistability as 'extension of an abelian variety by a torus' (unipotent rank 0) over any residue field; this equals the vanishing of U in the Chevalley decomposition only when the residue field is perfect.",
    "sources": [
     {
      "sourceId": "conrad-2015-neron-models-tamagawa-factors-sha",
      "locator": "Definition 3.3, p. 6"
     }
    ]
   },
   {
    "source": "NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction-and-semiabelian-models-over-dedekind-bases",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.4/neron-models-of-jacobians-from-the-picard-functor-of-a-regular-model",
    "reason": "SGA 7 IX uses 12.1 when the Jacobian has semistable reduction (special fibre with ordinary double points). Annotation (independent review): 12.1 itself needs no semistability; the consumer's use is 12.1.11-12.1.12 (A^0_0 = Pic^0_{X_0/k}, so A is semistable iff Pic^0_{X_0/k} has unipotent rank 0) and 12.2's restriction of SGA 7's use of 12.1 to that case (page images).",
    "sources": [
     {
      "sourceId": "sga7-I-expose-IX",
      "locator": "12.1.11-12.2, printed pp. 468-469"
     }
    ]
   },
   {
    "source": "NeronModelsAndSemistableAbelianVarieties:R11.4/picard-lefschetz-formula-monodromy-pairing-equals-the-graph-pairing",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.4/component-group-as-cokernel-of-the-monodromy-pairing",
    "reason": "For a semistable Jacobian, 12.5 identifies the monodromy pairing of 11.5 with the dual-graph pairing, so the component group becomes a cokernel computed from the graph. Annotation (independent review): Theoreme 11.5 is proved in section 11 without 12.5. The dependency runs through Remarques 11.5.2 b), the integral form Phi = coker(u), which uses Theorem 10.4: 12.6 says 12.5 proves 10.4 in the Jacobian case, and 10.5 (not read) that this implies 10.4 in general. The explicit dual-graph computation of Phi is not written in the pages read.",
    "sources": [
     {
      "sourceId": "sga7-I-expose-IX",
      "locator": "12.6, printed p. 476; Remarques 11.5.2 b), printed pp. 455-456 (page images)"
     }
    ]
   },
   {
    "source": "NeronModelsAndSemistableAbelianVarieties:R11.2/neron-models-of-elliptic-curves-from-minimal-models-and-reduction-types",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich-criterion",
    "reason": "Silverman's elliptic proof uses the finiteness of E/E_0 and the multiplicative/additive description of the nonsingular points. Annotation (independent review): the proof of Silverman VII.7.1 could not be checked (no public copy). The dependency is confirmed by Lichtenstein, who says the proof in Silverman 'is not self-contained, relying implicitly on the finiteness of A_k/A^0_k', which the elliptic node supplies (E(K)/E(K)^0 = Phi_E(k), Lichtenstein 4.2.1). Lichtenstein's own proof does not use the elliptic node.",
    "sources": [
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "proof of Theorem VII.7.1, pp. 201-202"
     },
     {
      "sourceId": "lichtenstein-neron-models-stanford-seminar",
      "locator": "5.2.4-5.2.5, p. 21"
     }
    ]
   },
   {
    "source": "LefschetzPencilsAndVanishingCycles:LPV.1",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction-theorem-for-abelian-varieties",
    "reason": "SGA 7 IX reduces Theoreme 3.6 to Corollaire 3.7 (an open subgroup of inertia acts unipotently of echelon 2 on T_l), proved in SGA 7 I Expose I as a case of the monodromy theorem. LPV.1 owns the quasi-unipotence theorem with SGA 7 I I as its source. Caveat: Expose I was not read, so it is not checked that the \"geometric coefficient setting\" of LPV.1 covers the mixed-characteristic H^1 of an abelian variety used by 3.7 or the echelon-2 refinement. New stage edge LPV.1 -> R11.3 (acyclic with the atlas). Annotation (independent review): the proof of IX 3.7 (printed p. 353, page image) says the assertion was proved 'dans III' using resolution of 2-dimensional excellent schemes; by Deligne's preface (p. VI) Exposes III-V do not exist and were summarized in Expose I. LPV.1's stated scope is quasi-unipotence; the echelon-2 bound (N^2 = 0 on H^1, a case of the bound N <= i + 1 on H^i that the preface attributes to the geometric proof) is not in LPV.1's text, so the supply is partial and a gap is recorded.",
    "sources": [
     {
      "sourceId": "sga7-I-expose-IX",
      "locator": "Theoreme 3.6 with the reduction to Corollaire 3.7, printed pp. 351-353 (page image of p. 351 and OCR)"
     }
    ]
   },
   {
    "source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/uniqueness-of-finite-flat-prolongation-when-e-less-than-p-minus-1",
    "target": "NeronModelsAndSemistableAbelianVarieties:R11.6/exactness-of-neron-models-and-uniform-semistability-for-consumers",
    "reason": "BLR 7.5/4 exactness for e < p - 1 is proved with Raynaud's uniqueness of finite flat prolongations, decomposed in the sibling FiniteFlatGroups packet. New stage edge R07.1 -> R11.6 (R07.1 already supplies A3 -> R11.3). Annotation (independent review): Lichtenstein says only that the proof of BLR 7.5/4 'uses Raynaud's results on group schemes of type (p, p, ..., p)'; the identification with this uniqueness theorem is the drafter's inference, since BLR 7.5/4 was not read. The R07.1 stage text covers Raynaud's type (p, ..., p) theory, so the supplier's scope is adequate for the stated use.",
    "sources": [
     {
      "sourceId": "lichtenstein-neron-models-stanford-seminar",
      "locator": "Theorem 6.3.1 and the following paragraph, p. 23"
     }
    ]
   }
  ]
 },
 "gaps": [
  {
   "title": "Bosch-Lutkebohmert-Raynaud, Neron Models, is absent: the omitted smoothening lemma, Weil's theorems, descent from R^sh and base-change statements are imports",
   "neededBy": [
    "NeronModelsAndSemistableAbelianVarieties:R11.1/neron-smoothening-process",
    "NeronModelsAndSemistableAbelianVarieties:R11.1/local-existence-of-neron-models-via-birational-group-laws",
    "NeronModelsAndSemistableAbelianVarieties:R11.1/weil-extension-theorem-for-rational-maps-into-smooth-group-schemes",
    "NeronModelsAndSemistableAbelianVarieties:R11.1/base-change-of-neron-models-unramified-and-ramified"
   ],
   "detail": "BLR is catalogued as \"book_requested\" and no public copy was found. The existence chain is read from Romagny's summer-school notes and Lichtenstein's seminar notes, which omit several proofs. These are: Lemma 2.3.2 (the defect of smoothness drops under permissible blow-ups; BLR 3.3/5); boundedness of the defect (BLR 3.3/3); Weil's extension theorem for birational group laws (BLR 5.1-5.2) and for rational maps into group schemes (BLR 4.4/1, only sketched); descent of Neron models from R^sh (BLR 6.5/4); the ramification-index-1 base change (BLR 7.2/1); the R^sh criterion (BLR 7.1/1); and quasi-projectivity (Raynaud, LNM 119, VIII.2). Formal geometry (AdicSpacesPartII F0) is named as an R11.1 input but is not used in the sources read. Next source action: acquire BLR chapters 2-7. Lichtenstein says 6.1.1 is proved with the weak Neron mapping property and Weil's theorem; Raynaud 1970 8.1.4 also cites the same two statements from Raynaud's note [11] (Modeles de Neron, C. R. Acad. Sci. 262 (1966), (2.3) and (3.3)), not read. The drafted link from AdicSpacesPartII F0 to the smoothening node was removed by the independent review, because the sources read do not use formal geometry; the atlas stage edge F0 -> R11.1 is unaffected."
  },
  {
   "title": "The global invariant-differential lattice over a Dedekind base and its localization are not in the sources read",
   "neededBy": [
    "NeronModelsAndSemistableAbelianVarieties:R11.1/invariant-differentials-of-the-neron-model-and-the-canonical-measure",
    "NeronModelsAndSemistableAbelianVarieties:R11.1"
   ],
   "detail": "R11.1 must identify the global invariant-differential lattice (the lattice consumed by ArakelovGeometryAndAbelianHeights R35.2) and its localization at each finite place. The sources read give only the local R-line of invariant top-degree forms over a complete DVR (Conrad section 4) and the local minimal-component normalization (Romagny 4.1). The global object is omega_{A/S} = e^* Omega^1_{A/S} (or its determinant) for the Neron model over O_K. Its local-freeness, its compatibility with localization and completion, and its behaviour under etale base change are not stated in any source read. Next source action: BLR 4.2 (invariant differentials) and the Faltings/Deligne height references used by R35.2."
  },
  {
   "title": "Component groups: Tate's algorithm, wild primes and the elliptic-curve component group table are not decomposed",
   "neededBy": [
    "NeronModelsAndSemistableAbelianVarieties:R11.2/neron-models-of-elliptic-curves-from-minimal-models-and-reduction-types",
    "NeronModelsAndSemistableAbelianVarieties:R11.2"
   ],
   "detail": "R11.2 asks to compare scheme data with the reduction filtration and Tate's algorithm, including the wild primes. The sources read cite this comparison instead of proving it. Silverman VII.6.1 refers to Advanced Topics IV sections 5-9; Lichtenstein refers to Liu 10.2 and assumes residue characteristic != 2, 3 for Weierstrass models; Poonen 5.7.30 cites Conrad's Minimal models for elliptic curves, Theorems 5.4 and 5.5 (author copy available at math.stanford.edu, not read). Isogeny functoriality of component groups and the exact sequences used in modular-curve arguments (e.g. Mazur, Ribet) are also not read. Next source action: read Conrad, Minimal models for elliptic curves (sections 5-6) and Silverman, Advanced Topics IV.8-IV.9."
  },
  {
   "title": "R11.3: the monodromy theorem, the orthogonality theorem and the Raynaud extension and uniformisation are unread",
   "neededBy": [
    "NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction-theorem-for-abelian-varieties",
    "NeronModelsAndSemistableAbelianVarieties:R11.3/galois-criterion-for-semistable-reduction",
    "NeronModelsAndSemistableAbelianVarieties:R11.3"
   ],
   "detail": "Several load-bearing inputs of R11.3 were not read. The semistable reduction theorem IX 3.6 reduces to Corollaire 3.7, whose proof (printed p. 353) says it 'a ete prouvee dans III' using resolution of singularities of 2-dimensional excellent schemes; Deligne's preface (p. VI) explains that Grothendieck's Exposes I-V were summarized in Expose I and that Exposes III-V do not exist, so the reference is to Expose I (section 3, the geometric proof of the monodromy theorem), not read. Deligne's alternative arithmetic proof of semistable reduction is Expose I section 6. The Galois criterion IX 3.5 uses the orthogonality theorem IX 2.4, proved with the biextension theory of Exposes VII-VIII (VIII 2.2). The Raynaud extension (IX section 7) and the uniformisation of degenerating abelian varieties (Faltings-Chai, catalogued as book_requested; Bosch-Lutkebohmert) were not read, including the required polarisation and lattice conditions. The candidate owner of the monodromy theorem is LefschetzPencilsAndVanishingCycles LPV.1 (quasi-unipotence, sources SGA 7 I I/VI). Its stated scope is quasi-unipotence, whereas 3.7 needs the echelon-2 refinement (an open subgroup of inertia with (1 - g)^2 = 0 on H^1), which the preface attributes to the geometric proof (N <= i + 1 on H^i); the link is kept with that caveat. The independent review found a misprint in 3.5 (ii) and (2.5.5): the printed 'V ⊂ V^perp' must read 'V^perp ⊂ V', as the end of the proof of 3.5 shows; any formalization must use the corrected condition. Next source action: SGA 7 I Expose I sections 1, 3 and 6, and Expose IX sections 1-2 and 7-10 on page images; Faltings-Chai chapter II when acquired."
  },
  {
   "title": "R11.4: Raynaud's representability sections, the monodromy pairing, Expose XV Picard-Lefschetz and the worked nodal examples are not decomposed",
   "neededBy": [
    "NeronModelsAndSemistableAbelianVarieties:R11.4/neron-models-of-jacobians-from-the-picard-functor-of-a-regular-model",
    "NeronModelsAndSemistableAbelianVarieties:R11.4/picard-lefschetz-formula-monodromy-pairing-equals-the-graph-pairing",
    "NeronModelsAndSemistableAbelianVarieties:R11.4/component-group-as-cokernel-of-the-monodromy-pairing",
    "NeronModelsAndSemistableAbelianVarieties:R11.4"
   ],
   "detail": "Theoreme 8.1.4 and Proposition 8.1.2 of Raynaud 1970 rest on sections 5-7 (representability of the Picard functor as an algebraic space, cohomological flatness, Brauer-group obstruction 7.1.4, 7.2.4, 6.4.3-6.4.5), which were not read. SGA 7 IX: the monodromy pairing (section 9), the integrality theorem 10.4 and the proof of Theoreme 11.5 (11.6 onwards) were not read, and the l = p case of 12.5 was only located. The cohomological Picard-Lefschetz formula was read only as the statement of SGA 7 II XV 3.4. Its proofs (XV sections 1-3, via Lefschetz pencils and the transcendental formula XIV 3.2.11) were not read, and the atlas supplier LPV.2 states it for one singular point only. The combination of 11.5 and 12.5 into an explicit component group of a semistable Jacobian from the dual graph is not written in the pages read. Also missing are a worked nodal curve with more than one component, split and nonsplit multiplicative Tate-curve comparisons, and the Galois action on component groups over k versus kbar. Next source action: read SGA 7 IX sections 9-12 in full on page images and SGA 7 II Expose XV sections 1-3 (library copy with text layer), and compute the two-component example. Independent review: Raynaud 8.1.4 is about the subgroup Q^tau of Q = P/E, not Q itself; Q^tau, property (N)* (6.1.4), delta (6.1.1) and d' (6.1.11) are defined in Raynaud sections 3 and 6, not read. The integral cokernel description (SGA 7 IX 11.5.2 b)) rests on Theorem 10.4, which 12.6 derives from 12.5 for Jacobians and 10.5 (not read) extends to all abelian varieties; in sections 9-11 M denotes the character group of the torus of the dual abelian variety (11.6.1, 12.4.6)."
  },
  {
   "title": "R11.5: conductors, Weil-Deligne operators and the p-adic comparisons are not in the sources read",
   "neededBy": [
    "NeronModelsAndSemistableAbelianVarieties:R11.5/inertia-invariants-and-the-local-l-factor-from-the-special-fibre",
    "NeronModelsAndSemistableAbelianVarieties:R11.5/grothendieck-p-adic-good-reduction-criterion",
    "NeronModelsAndSemistableAbelianVarieties:R11.5"
   ],
   "detail": "R11.5 asks to relate monodromy and component data to the characteristic-zero local Euler polynomial, not just its semisimplified inertial action, using R01 for conductors and R06 for p-adic comparison. The sources read give only V_l(A)^I, the local L-factor and the point count (Conrad section 4). They do not cover: the Weil-Deligne representation with its monodromy operator N (from Grothendieck's l-adic monodromy theorem, SGA 7 IX section 3 and Expose I); the conductor exponent (SGA 7 IX section 4 \"Application ... au conducteur\", located only in the summary); Serre-Tate, Good reduction of abelian varieties (1968); or the p-adic criterion SGA 7 IX 5.10, which is cited only. Next source action: read SGA 7 IX sections 4-5 and Serre-Tate 1968 section 2 (conductor). Independent review: SGA 7 IX Corollaire 5.10 is now located and its statement read (printed p. 385, page image); its proof uses Proposition 5.8 and Tate's theorem on p-divisible groups (see the separate gap) and the semistable reduction theorem 3.6. The drafted link PadicHodgeTheory R06.6 -> the 5.10 node was removed, since 5.10 does not use crystalline comparison, and so was the link from the monodromy-cokernel node to the L-factor node, since Conrad's point count uses only #Phi(k); relating component and monodromy data to the local factor is not in the sources read."
  },
  {
   "title": "R11.6: character-group exact sequences for level lowering and the equation-level/scheme-level comparisons for R29 are not read",
   "neededBy": [
    "NeronModelsAndSemistableAbelianVarieties:R11.6/exactness-of-neron-models-and-uniform-semistability-for-consumers",
    "NeronModelsAndSemistableAbelianVarieties:R11.6"
   ],
   "detail": "R11.6 must supply the character-group exact sequences and monodromy maps consumed by level lowering, with degeneracy-map functoriality (Ribet, On modular representations of Gal(Qbar/Q) arising from modular forms; Grothendieck IX 11 and 12; Mazur-Ribet). It must also supply the equation-level/scheme-level comparison for every elliptic invariant used in R29. None of these sources was read, and BLR 7.5/4 (exactness of Neron models for e < p - 1) is quoted from Lichtenstein's notes only. Next source action: read Ribet 1990 sections 2-3 and the R29 consumer statements, and match each elliptic invariant with Silverman VII and Advanced Topics IV. Independent review: Lichtenstein says only that the proof of BLR 7.5/4 uses 'Raynaud's results on group schemes of type (p, p, ..., p)'; that it is the uniqueness of finite flat prolongations for e < p - 1 is an unverified inference."
  },
  {
   "title": "Tate's theorem on p-divisible groups, used in SGA 7 IX 5.8-5.10, has no identified atlas supplier",
   "neededBy": [
    "NeronModelsAndSemistableAbelianVarieties:R11.5/grothendieck-p-adic-good-reduction-criterion",
    "NeronModelsAndSemistableAbelianVarieties:R11.5"
   ],
   "detail": "SGA 7 IX Corollaire 5.10 (printed p. 385) assumes char K = 0 when l = p 'pour pouvoir disposer du theoreme de TATE deja invoque dans 5.8' and proves the semistable case with Proposition 5.8. Neither 5.8 nor Tate's paper (reference [33] of Expose IX, cited as 'TATE [33, th. 4]' on printed p. 376; the bibliography entry was not checked) was read. No atlas stage text states Tate's full-faithfulness theorem for p-divisible groups over mixed-characteristic DVRs; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1-R07.2 own p-divisible groups but do not name it. Next action: read SGA 7 IX 5.8 and Tate section 4, and ask the orchestrator which stage should own the theorem."
  },
  {
   "title": "Silverman, The Arithmetic of Elliptic Curves, has no public copy: its claims are not independently verified",
   "neededBy": [
    "NeronModelsAndSemistableAbelianVarieties:R11.2/neron-models-of-elliptic-curves-from-minimal-models-and-reduction-types",
    "NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction-theorem-for-abelian-varieties",
    "NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich-criterion"
   ],
   "detail": "The drafter read a private library copy (SHA-256 recorded in the source entry). The independent review could not obtain a public copy, so the Silverman-only claims are marked 'not independently verified' in the nodes: the valuation criteria of VII.5.1, the orders in VII.6.1, VII.5.4 and Example 5.2, and VII.7.1-7.3. No node rests on Silverman alone; each also has a public source (Lichtenstein, Conrad, Poonen or SGA 7). Next action: a reviewer with library access should check these excerpts against the printed pages."
  }
 ],
 "coverage": [
  {
   "stageId": "NeronModelsAndSemistableAbelianVarieties:R11.1",
   "status": "partial",
   "remaining": [
    "BLR imports: smoothening Lemma 2.3.2 (BLR 3.3/5), Weil's theorems (BLR 4.4, 5.1-5.2), descent from R^sh (6.5/4), base change (7.1-7.2), quasi-projectivity (Raynaud LNM 119).",
    "Excellent-DVR hypotheses and the formal-geometry route (F0) are not exercised by the sources read (the node-level F0 link was removed in review; the atlas edge remains).",
    "Global invariant-differential lattice over O_K and its localization: not read (only the local R-line).",
    "Proofs of Lichtenstein 6.1.1, 6.2.1 and 6.2.2 (BLR 7.1/1, 6.5/4, 7.2/1) and Raynaud's note [11] (2.3), (3.3), which Raynaud 1970 8.1.4 cites for the same two facts."
   ]
  },
  {
   "stageId": "NeronModelsAndSemistableAbelianVarieties:R11.2",
   "status": "partial",
   "remaining": [
    "Tate's algorithm, wild primes, and the component-group table for elliptic curves: cited only (Silverman Advanced Topics IV, Liu 10.2, Conrad minimal models).",
    "Functoriality under isogeny and the exact sequences used in modular-curve arguments: not read.",
    "Toric and abelian parts and character groups beyond the Chevalley decomposition over perfect k: partly in R11.4 nodes; imperfect residue fields not treated."
   ]
  },
  {
   "stageId": "NeronModelsAndSemistableAbelianVarieties:R11.3",
   "status": "partial",
   "remaining": [
    "Monodromy theorem behind IX 3.7 (cited as 'III', i.e. Grothendieck's unwritten Expose III summarized in SGA 7 I Expose I section 3), including the echelon-2 bound on H^1; the orthogonality theorem IX 2.4 (biextensions, VIII 2.2); the end of the proof of IX 3.1 e) and its SGA 3 inputs: unread.",
    "Raynaud extension and uniformisation with polarisation and lattice conditions (SGA 7 IX 7, Faltings-Chai): not read.",
    "Formal analytic constructions consuming R05: not read.",
    "Proposition 3.5 (ii) is misprinted in the source; the corrected condition V^perp ⊂ V is used in the Galois-criterion node."
   ]
  },
  {
   "stageId": "NeronModelsAndSemistableAbelianVarieties:R11.4",
   "status": "partial",
   "remaining": [
    "Raynaud 1970 sections 5-7 (representability, cohomological flatness): unread.",
    "Monodromy pairing (SGA 7 IX 9-10), proof of IX 11.5, the proofs in Expose XV (only Theoreme 3.4 read as a statement), and the l = p case of 12.5: unread.",
    "Worked examples: a nodal semistable curve's generalized Jacobian and a curve with more than one component: not computed in the source.",
    "Raynaud sections 3 and 6 (definitions of Q^tau, delta, d', properties (N) and (N)*) and Raynaud [11]; SGA 7 IX 10.4-10.5 (integrality of the monodromy pairing), on which 11.5.2 b) rests."
   ]
  },
  {
   "stageId": "NeronModelsAndSemistableAbelianVarieties:R11.5",
   "status": "partial",
   "remaining": [
    "Conductors (SGA 7 IX 4; Serre-Tate) and the Weil-Deligne monodromy operator: not read.",
    "SGA 7 IX 5.10: statement read (printed p. 385); its proof via Proposition 5.8 and Tate's theorem on p-divisible groups not read. The R06.6 p-adic comparisons are not decomposed here.",
    "Relation between the component and monodromy data (IX 11.5, 12.5) and the local Euler factor: not in the sources read."
   ]
  },
  {
   "stageId": "NeronModelsAndSemistableAbelianVarieties:R11.6",
   "status": "partial",
   "remaining": [
    "Character-group exact sequences and degeneracy-map functoriality for level lowering (Ribet; SGA 7 IX 11-12): not read.",
    "Equation-level/scheme-level comparisons for R29 elliptic invariants: not read.",
    "BLR 7.5/4 exactness: quoted only; which of Raynaud's type (p, ..., p) results it uses is not identified in the source read."
   ]
  }
 ],
 "sources": [
  {
   "id": "romagny-2011-neron-models-of-abelian-varieties",
   "title": "Neron models of abelian varieties",
   "authors": "Matthieu Romagny",
   "edition": "Lecture notes, Summer School on SGA3, September 3, 2011, 8 pages; author copy from the author's page (not in the supplied library).",
   "url": "https://perso.univ-rennes1.fr/matthieu.romagny/exposes/Neron_models.pdf",
   "sha256": "22f81b540f570943fc98c9aca54ab2154f17680beb957c7ed00bae16ea1a7d7e",
   "readSections": [
    "Whole note: section 1 (definition and reduction to the local case), section 2 (smoothenings, Definition 2.1.1, Lemma 2.2.2 with proof, canonical partition, Lemma 2.3.2 statement, Definition 2.4.1, Theorem 2.4.2 with proof), section 3 (S-rational maps, Proposition 3.2.1 with proof), section 4 (Lemmas 4.1.1-4.1.2 with proofs, Theorem 4.2.1 with proof, Proposition 4.2.2 with proof, Remark 4.2.3), references"
   ],
   "reviewProvenance": "Fetched 2026-09-24 by the independent review REVIEW-EXT-13-EXT-07B from https://perso.univ-rennes1.fr/matthieu.romagny/exposes/Neron_models.pdf; SHA-256 22f81b540f570943fc98c9aca54ab2154f17680beb957c7ed00bae16ea1a7d7e matches. All 8 pages read."
  },
  {
   "id": "lichtenstein-neron-models-stanford-seminar",
   "title": "Neron models",
   "authors": "Sam Lichtenstein",
   "edition": "Notes for the Stanford seminar on Faltings's proof of the Mordell conjecture (hosted on B. Conrad's seminar page), PDF created 26 January 2011, 22:41 Pacific time (27 January UTC), 23 pages; not in the supplied library.",
   "url": "http://virtualmath1.stanford.edu/~conrad/mordellsem/Notes/L11.pdf",
   "sha256": "8ef7cac57c32638b6edfb85ccbbc6602dd20b998a913a2030b540ac227ca9ebf",
   "readSections": [
    "Section 1.3-1.4 (Definition 1.3.2, Examples 1.3.4-1.3.9, Definition 1.3.6, Theorem 1.3.10, Remark 1.3.11, Propositions 1.4.2-1.4.3), pp. 2-6",
    "Section 2 (Propositions 2.1.2-2.1.3, Theorem 2.1.4 sketch, Definitions 2.2.1, 2.2.3, Proposition 2.2.4 with proof, Lemma 2.2.5, Corollary 2.2.7 with Lemma 2.2.8 and proof; section 2.3: Exercise 2.3.1, Proposition 2.3.2 sketch, Lemma 2.3.3, Theorem 2.3.4 sketch), pp. 6-11",
    "Section 3.6 (Proposition 3.6.1 sketch), p. 16",
    "Section 4 (Definitions 4.1.1-4.1.2, 4.1.6, Theorems 4.1.3, 4.1.5, 4.1.7, Examples 4.1.4, 4.1.8, 4.1.9, Proposition 4.2.1, Definition 4.3.1, Proposition 4.3.2 with proof), pp. 16-20",
    "Section 5 (Definition 5.1.1; Theorem 5.2.1 with its complete proof 5.2.2-5.2.8, Corollary 5.2.9; Theorem 5.3.1 statement), pp. 20-22",
    "Section 6 (Propositions 6.1.1, 6.2.1, 6.2.2, Theorem 6.3.1, statements with BLR references), pp. 22-23"
   ],
   "reviewProvenance": "Fetched 2026-09-24 by the independent review REVIEW-EXT-13-EXT-07B from http://virtualmath1.stanford.edu/~conrad/mordellsem/Notes/L11.pdf; SHA-256 8ef7cac57c32638b6edfb85ccbbc6602dd20b998a913a2030b540ac227ca9ebf matches. Read pp. 1-11 and 16-23."
  },
  {
   "id": "conrad-2015-neron-models-tamagawa-factors-sha",
   "title": "Neron models, Tamagawa factors, and Tate-Shafarevich groups",
   "authors": "Brian Conrad",
   "edition": "Notes for the Stanford BSD seminar, October 14, 2015 (PDF created 27 November 2015), 23 pages; author page; not in the supplied library.",
   "url": "https://virtualmath1.stanford.edu/~conrad/BSDseminar/Notes/L3.pdf",
   "sha256": "bc27aad24f5b0ba8b1ae7fa6f8dde25f17ce479e46b1ff0256cf0e512ce988e6",
   "readSections": [
    "Section 1 (motivation, Theorem 1.1, Example 1.2, Remark 1.3, Examples 1.4-1.5, Remark 1.6), pp. 1-3",
    "Section 2 (properties 1-3, Examples 2.1-2.3, Definition 2.4, Example 2.5), pp. 3-5",
    "Section 3 (Definitions 3.1, 3.3, 3.6, Example 3.4, Theorem 3.5, Theorem 3.7, Remark 3.8, the Chevalley decomposition and the exact sequences (3.2)-(3.3)), pp. 6-9",
    "Section 4 (Application 1, Theorem 4.1 with proof, Example 4.2, the canonical measure and Exercise 4.3), pp. 9-13; sections 5-6 not read"
   ],
   "reviewProvenance": "Fetched 2026-09-24 by the independent review REVIEW-EXT-13-EXT-07B from https://virtualmath1.stanford.edu/~conrad/BSDseminar/Notes/L3.pdf; SHA-256 bc27aad24f5b0ba8b1ae7fa6f8dde25f17ce479e46b1ff0256cf0e512ce988e6 matches. Read pp. 1-13; the torus formula on p. 10 was checked on the page image."
  },
  {
   "id": "raynaud-1970-specialisation-du-foncteur-de-picard",
   "title": "Specialisation du foncteur de Picard",
   "authors": "Michel Raynaud",
   "edition": "Publications Mathematiques de l'IHES 38 (1970), 27-76; NUMDAM scan with text layer (51 PDF pages); not in the supplied library.",
   "url": "https://www.numdam.org/item/PMIHES_1970__38__27_0/",
   "sha256": "fdba4b96e9f3fa3eeb158868217b95ffd4172f128148a70013115666cf04cf92",
   "readSections": [
    "Section 8 (8.0, Proposition 8.0.1, 8.1.1, Proposition 8.1.2 with proof of (i)-(iii), Definition 8.1.3, Theoreme 8.1.4 with proof, Remarques 8.1.5, Theoreme 8.2.1 with proof, Remarque 8.2.2, Proposition 8.2.3), pp. 63-67; start of section 9 (9.1.1-9.1.4, 9.2.1-9.2.3), pp. 67-69"
   ],
   "reviewProvenance": "Fetched 2026-09-24 by the independent review REVIEW-EXT-13-EXT-07B from https://www.numdam.org/item/10.1007/BF02684651.pdf (the PDF linked from the item page); SHA-256 fdba4b96e9f3fa3eeb158868217b95ffd4172f128148a70013115666cf04cf92 matches. Section 8 (pp. 63-67) read on page images, since the text layer garbles Q^tau and several symbols; bibliography (p. 76) read."
  },
  {
   "id": "sga7-I-expose-IX",
   "title": "Groupes de monodromie en geometrie algebrique (SGA 7 I), Expose IX: Modeles de Neron et monodromie",
   "authors": "A. Grothendieck (SGA 7 I, with an appendix by M. Raynaud)",
   "edition": "Lecture Notes in Mathematics 288, Springer 1972. Copy inspected: the supplied library scan without a text layer (catalogue R02-SGA7I, 528 PDF pages; printed page = PDF page - 5 in Expose IX), the same file as the public copy at the URL below. It was read through a local OCR pass (tesseract), with the key statements checked on page images. Same source id as in this job's Faltings packet.",
   "url": "https://library.slmath.org/nonmsri/sga/sga/pdf/sga7-1.pdf",
   "sha256": "17286b0f0bec451068e0a5fa2c39e93de28e7c1ecee6739487cfac11c03c8dab",
   "readSections": [
    "Sommaire and 0.1-0.2 (introduction), printed pp. 313-315",
    "Corollaire 2.2.9 (good-reduction criteria), printed p. 335 (OCR)",
    "Theoreme 2.4 (orthogonality) statement and Remarques 2.6, printed pp. 338 and 341-342 (OCR)",
    "Section 3: Proposition 3.1 (start), Proposition 3.2 with proof, 3.2.1, Corollaire 3.3 with proof, 3.3.2, Definition 3.4, 3.4.0, Proposition 3.5 with proof, Remarques 3.5.1, Corollaire 3.5.2, Theoreme 3.6 with the reduction to Corollaire 3.7, Corollaire 3.8, Corollaire 3.9 statement, printed pp. 343-353 (OCR; Proposition 3.5 and Theoreme 3.6 checked on page images)",
    "Section 11: 11.0-11.1 opening, Theoreme 11.5 with Remarques 11.5.2, printed pp. 448-456 (Theoreme 11.5 on page image)",
    "Section 12: Theoreme 12.1 (Raynaud), 12.2, 12.3 with 12.3.5-12.3.7, 12.4, Theoreme 12.5 (Picard-Lefschetz), 12.6, 12.7 and Remarques 12.7.2, printed pp. 465-476 (OCR)",
    "Independent review, on page images: preface (p. VI) and table of contents of the volume, sommaire of Expose I; IX Corollaire 2.2.9 and 2.2.9.1 (p. 335); Theoreme 2.4 and the start of its proof (p. 338); (2.4.6)-(2.5.5) and Remarques 2.6 (pp. 340-342); Proposition 3.1 with the proofs of a)-d), Lemme 3.1.3, Remarque 3.1.4, Proposition 3.2 through 4.1 opening (pp. 343-354); Corollaire 5.10 and the start of its proof (p. 385); 11.0, 11.4 opening, Theoreme 11.5, Remarques 11.5.2, 11.6 opening (pp. 448, 454-456); 12.1-12.7 and Remarques 12.7.2 (pp. 465-476)"
   ],
   "reviewProvenance": "Fetched 2026-09-24 by the independent review REVIEW-EXT-13-EXT-07B from https://library.slmath.org/nonmsri/sga/sga/pdf/sga7-1.pdf; SHA-256 17286b0f0bec451068e0a5fa2c39e93de28e7c1ecee6739487cfac11c03c8dab matches. The scan has no text layer; the review read every cited passage on page images (no OCR)."
  },
  {
   "id": "sga7-II-expose-XV",
   "title": "Groupes de monodromie en geometrie algebrique (SGA 7 II), Expose XV: La formule de Picard-Lefschetz",
   "authors": "P. Deligne (SGA 7 II, directed by P. Deligne and N. Katz)",
   "edition": "Lecture Notes in Mathematics 340, Springer 1973. Copy inspected: the supplied library copy (catalogue WEIL-SGA7-II, from the IAS author archive; text layer present; printed page = PDF page - 8 in Expose XV).",
   "url": "https://publications.ias.edu/sites/default/files/Number12.pdf",
   "sha256": "fa679debfc8ada3232d7e752a1837fc6ce474488e20a44d7641cf296876e1297",
   "readSections": [
    "Contents of Expose XV, printed p. 165 (p. 164 is the bibliography of Expose XIV)",
    "Section 3.3, end of step (D) (Lemme 3.3.7) and steps (E)-(F), printed pp. 194-195 (text layer)",
    "Section 3.4 (Resume) with Theoreme 3.4 (Formule de Picard-Lefschetz), printed pp. 195-196, read on page images"
   ],
   "reviewProvenance": "Fetched 2026-09-24 by the independent review REVIEW-EXT-13-EXT-07B from https://publications.ias.edu/sites/default/files/Number12.pdf; SHA-256 fa679debfc8ada3232d7e752a1837fc6ce474488e20a44d7641cf296876e1297 matches. Theoreme 3.4 (pp. 195-196) read on page images, the contents page and Lemme 3.3.7 in the text layer."
  },
  {
   "id": "silverman-arithmetic-of-elliptic-curves-2009",
   "title": "The Arithmetic of Elliptic Curves",
   "authors": "Joseph H. Silverman",
   "edition": "Second edition, Graduate Texts in Mathematics 106, Springer 2009 (DOI 10.1007/978-0-387-09494-6). Copy inspected: the supplied library copy (catalogue record WEIL-PRIVATE-SILVERMAN2009, a user-supplied private copy; not redistributed). Printed page numbers; same source id as in this job's Heights packet.",
   "url": "https://doi.org/10.1007/978-0-387-09494-6",
   "sha256": "72ee67bfa1e3fdf582ac7e4b032d7ca0b35a168ed6443ac39c121fbb788cab25",
   "readSections": [
    "Chapter VII notation (K complete for a discrete valuation, K and k perfect), p. 185",
    "VII.5 (definitions, Proposition 5.1, Example 5.2, potential good reduction, Proposition 5.4 statement), pp. 196-197",
    "VII.6 (Theorem 6.1 with its cited proof, Corollary 6.2, Proposition 6.3), pp. 199-200",
    "VII.7 (Theorem 7.1 with proof, Corollaries 7.2-7.3 with proofs), pp. 201-202"
   ],
   "reviewProvenance": "Not fetched by the independent review REVIEW-EXT-13-EXT-07B: no public copy is available, so the recorded SHA-256 (of a private library copy) and the Silverman excerpts could not be checked. Every claim resting only on Silverman is marked 'not independently verified' in the nodes."
  },
  {
   "id": "poonen-rational-points-on-varieties",
   "title": "Rational points on varieties",
   "authors": "Bjorn Poonen",
   "edition": "Graduate Studies in Mathematics 186, AMS 2017; the author's PDF (created 18 December 2018, watermarked \"Unofficial version for incidental online use\"), not in the supplied library; same source id as in this job's Heights packet.",
   "url": "https://math.mit.edu/~poonen/papers/Qpoints.pdf",
   "sha256": "42e92ce4599420f6b72139e78cb9f5230e4bf81258c202e7cee4716887353579",
   "readSections": [
    "Section 5.7.4-5.7.6 (Definition 5.7.23, Remark 5.7.24, Theorem 5.7.25, Proposition 5.7.26, Remarks 5.7.27-5.7.28, Theorem 5.7.30), pp. 143-145"
   ],
   "reviewProvenance": "Fetched 2026-09-24 by the independent review REVIEW-EXT-13-EXT-07B from https://math.mit.edu/~poonen/papers/Qpoints.pdf; SHA-256 42e92ce4599420f6b72139e78cb9f5230e4bf81258c202e7cee4716887353579 matches. Read 5.7.4-5.7.6 (printed pp. 143-145) and the bibliography entries [Art86a], [BLR90], [Con15]."
  }
 ],
 "other": {
  "summary": "This packet decomposes Neron models and semistable abelian varieties. Its sources are SGA 7 I Expose IX and SGA 7 II Expose XV (public scans; the cited statements were read on page images), Silverman, The Arithmetic of Elliptic Curves VII.5-VII.7 (a private library copy; its claims were not independently verified), and five public author or archive copies: Poonen, Rational points on varieties 5.7; Romagny, Neron models of abelian varieties (2011 notes); Lichtenstein, Neron models (Stanford seminar notes); Conrad, Neron models, Tamagawa factors, and Tate-Shafarevich groups (2015 notes); and Raynaud, Specialisation du foncteur de Picard (Publ. IHES 1970, NUMDAM). R11.1 covers the definition, Weil extension, abelian schemes as Neron models and good-reduction criteria, smoothening, the weak Neron property, local existence via birational group laws, Dedekind gluing, base change (unramified versus ramified) and the local invariant-differential line. R11.2 covers component groups, Chevalley decomposition and Tamagawa numbers, elliptic Neron models from minimal models, and the 57C2 example. R11.3 covers semiabelian models, the Galois criterion and the semistable reduction theorem. R11.4 covers Neron models of Jacobians via Raynaud's Picard functor, component groups from multidegrees, the dual-graph character group, Picard-Lefschetz and the component group as a cokernel of the monodromy pairing. R11.5 covers Neron-Ogg-Shafarevich, inertia invariants and local L-factors, and the p-adic criterion (SGA 7 IX 5.10). R11.6 covers exactness and uniform semistability. All stages are partial: BLR, the monodromy and orthogonality theorems, Tate's theorem on p-divisible groups, the Raynaud extension, conductors, Tate's algorithm and the level-lowering interfaces are unread."
 }
}
```

</details>

<details><summary><code>tauceti_TauCetiRoadmap_JacobianChallenge.json</code></summary>

```json
{
 "packet": "research/expansion/external/EXT-07/tauceti_TauCetiRoadmap_JacobianChallenge.json",
 "review": {
  "status": "needs_changes",
  "reviewer": "independent-review-REVIEW-EXT-13-EXT-07B",
  "date": "2026-09-24",
  "notes": "Sources. Seven public sources were fetched on 2026-09-24 into the reviewer's scratch area, never into the repository: six Stacks chapter PDFs (version ed88ff78), Milne AV v2.00 and Kleiman arXiv v1. All SHA-256 values match the packet, and the fetch is recorded in each source's edition field. Silverman AEC (library-only, Springer) could not be checked. Milne's text layer drops or garbles minus signs and symbols, so every Milne excerpt was checked by reading the text, and the formulas of I 5.4, I 7.4 and III 6.6-6.11 were checked on page images. Nodes (29): 20 verified, 8 corrected, 1 unverifiable. Corrections: locator pages (Cohomology of Schemes 5.2); missing hypotheses (Milne I 4.2(d) needs T integral; Kleiman 5.20 needs the fppf sheaf to be represented and every Pic^0 of a fibre complete); a merged proof step (Divisors 19.1/19.3); the theorem of the cube, which Milne reduces to the curve case with only that case omitted, so the node now also carries the seesaw 5.16-5.19 that its I.8 link consumes; a Picard 6.7 remark; unnamed imports added with gaps (Kleiman 5.4: Chevalley-Rosenlicht, Lie-Kolchin, Hartshorne Ex. II 6.15, Altman-Kleiman 3.10; Milne III 2.2: Shafarevich III 5.2); and an unclear label. Links (55 drafted): 53 verified unchanged, 2 annotated (the H^1-vanishing -> Milne construction usage re-located to p. 99 and 4.2(a); the cube -> dual link), 0 removed, 1 added (genus/Riemann-Roch -> Milne construction, proof of 4.2(b)); 56 in the packet. Every cross-roadmap supplier or consumer stage description was read: SF.1, SF.3, AlgebraicCurves Layer 12 (12E), NeronModels R11.4 (node present in that packet), A6, R07.2, WC.5 and EDC.2:trace-purity. Their scope covers the stated edges; the unsupplied etale comparisons are already disclosed in the link reasons and a gap. Structure: all parentStageIds are JacobianChallenge atlas stages; the 6 coverage records name real stages and list specific remaining work (updated for Layers D-F); gaps went from 9 to 10. The union with atlas stageEdges has no stage cycle and no node cycle, and every endpoint exists. Status needs_changes only because one node rests partly on Silverman III.3.4, which could not be read. Acceptance needs either a library check of that passage or the removal of the Silverman clauses. There is no unresolved contradiction.",
  "checked": [
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-a-line-bundles-divisors-picard-group-degree/effective-cartier-divisors-invertible-sheaves-and-regular-sections",
    "verdict": "verified",
    "note": "Stacks Divisors Definition 15.1 with comments (p. 25), Lemma 15.4 (p. 26), Lemma 15.10, Remark 15.11 and Lemma 16.1 (p. 27) read. Every clause of the statement matches; the excerpt is the literal last sentence of 15.10. Proof step 3 is packet-authored, since 15.10 has \"Proof. Omitted.\" (already recorded in the hypotheses). The acceptance use of Varieties 44.12 is confirmed (\"Since X is a curve, we see that s is a regular section\")."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-a-line-bundles-divisors-picard-group-degree/weil-divisors-class-group-and-comparison-with-pic",
    "verdict": "corrected",
    "note": "Stacks Divisors 27.1-28.7 (pp. 63-67) read with proofs. Statement, the 28.6 proof (Algebra 157.4, 157.6) and the 28.7 proof (Algebra 120.11, Divisors 16.7, Algebra 157.6, 120.6) match; the excerpt is literal. Correction: an acceptance item referred to an undefined \"A3\"; it now names the Layer A degree node (Varieties 44.9)."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-a-line-bundles-divisors-picard-group-degree/degree-of-invertible-sheaves-on-proper-curves-via-euler-characteristic",
    "verdict": "verified",
    "note": "Stacks Varieties section 44 (pp. 94-101) read with proofs. Definition 44.1 (excerpt literal), 44.2 (via Cohomology of Schemes 5.2), 44.3, 44.5-44.7 (devissage 12.6), 44.9 (deg E(D) = n deg D + deg E), 44.12 (1)-(5) and 44.14 match. The length computation for sum n_x [kappa(x):k] is correctly labelled as derived."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality/coherent-cohomology-affine-vanishing-cech-comparison-and-finiteness",
    "verdict": "verified",
    "note": "Cohomology of Schemes 2.2 and 2.6 (pp. 2-3), 4.2 with both proofs (pp. 6-7), 19.1-19.2 (pp. 49-50) and Varieties 43.4 (p. 92) read. Statements and cited ingredients (Cohomology 11.9, 11.6, Mayer-Vietoris, Lemmas 4.5, 4.6, 9.1, 12.6, 16.2-16.3, 18.1) match; both excerpts are literal. The two-affine cover of a curve is correctly labelled derived."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality/genus-and-riemann-roch-in-euler-characteristic-form",
    "verdict": "verified",
    "note": "Stacks Curves 8.1 with (8.1.1) (pp. 15-16), 8.2 (p. 16) and 6.1 (p. 12), Varieties 26.2 (p. 48) and Picard 6.1 (p. 11) read. The plane-curve genus (d - 1)(d - 2)/2 is located in Curves section 9 (\"see proof of Lemma 9.3\"). Both excerpts are literal."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality/dualizing-module-serre-duality-and-degree-of-the-canonical-sheaf",
    "verdict": "verified",
    "note": "Stacks Curves 4.1-4.3 (pp. 7-8), 5.1-5.2 (pp. 10-11) and 8.3-8.4 (p. 16) read with proofs. All clauses match: 4.1(1)-(6), 4.2(4), the dimension equalities of Remark 4.3, 5.2(1)-(3), 8.3 as \"Immediate from Lemma 5.2\", and 8.4 via 4.1(6) and (8.1.1). The listed Duality for Schemes, Dualizing Complexes and Chow Homology imports are exactly those cited in the proofs. The excerpt is literal."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality/vanishing-of-h1-in-degree-at-least-2g-minus-1",
    "verdict": "verified",
    "note": "Varieties 44.16-44.17 (pp. 100-101) read with proofs; the excerpt is literal and the proof summary (deg N = g - 1, 0 -> N -> L -> i_*(L|_D) -> 0) matches. Milne III.1 overview (p. 87) read: the excerpt is literal; Milne assumes k algebraically closed there, which is consistent with the first sentence of the node."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-c-relative-coherent-cohomology-and-base-change/flat-base-change-for-quasi-coherent-cohomology",
    "verdict": "corrected",
    "note": "Cohomology of Schemes Lemma 5.2 with proof and Lemma 7.1 with proof read. Statement and proof steps match; the excerpt is literal. Correction: Lemma 5.2 and its proof are on pp. 10-11, not pp. 9-10; the node locator and the source readSections were fixed."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-c-relative-coherent-cohomology-and-base-change/cohomology-and-base-change-semicontinuity-and-locally-constant-euler-characteristic",
    "verdict": "corrected",
    "note": "Derived Categories of Schemes 30.1-30.7 (pp. 73-75) and 32.1-32.8 (pp. 78-81) read. The Stacks statements match, including the hypotheses of 32.4 and 32.5-32.6, and the excerpt (tag 0B91) is literal. Milne I Theorem 4.2 (pp. 20-21) read: part (d) requires T integral, which the summary had omitted; it now says so. The Milne excerpt is literal."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-c-relative-coherent-cohomology-and-base-change/relative-effective-cartier-divisors-on-smooth-relative-curves",
    "verdict": "corrected",
    "note": "Divisors 19.1-19.9 (pp. 38-41), Picard 3.1-3.3 (pp. 5-7) and Milne III 3.4-3.11 (pp. 95-98) read. All statement clauses match and the three excerpts are literal. Correction: proof step 1 had merged 19.1 (base change, Algebra 39.12) with 19.3 (product of equations, Algebra 39.13); it was rewritten."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-c-relative-coherent-cohomology-and-base-change/hilbert-scheme-of-points-equals-symmetric-power-of-a-smooth-proper-curve",
    "verdict": "verified",
    "note": "Picard 2.1-3.7 (pp. 1-8) and Milne III 3.1-3.2 and 3.12-3.15 (pp. 94-98) read. All clauses match: 2.1-2.7, 3.4-3.7, X^d -> Hilb^d finite locally free of degree d!, C^(r), k[[sigma_1, ..., sigma_r]], 3.13 and 3.15. The recorded omissions are confirmed (\"Details omitted\" in 2.6, the relative dimension in 3.5, Mumford for 3.1, and Milne 1980 I 2.17 for descent). Both excerpts are literal."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-d-the-relative-picard-functor-and-the-jacobian-scheme/relative-picard-functors-comparison-theorem-and-brauer-obstruction",
    "verdict": "verified",
    "note": "Kleiman section 2 (pp. 16-21), Stacks Picard 4.1-4.2 (pp. 8-9) and Milne III 1.10-1.12 (pp. 89-90) read in full. The Br' sequence of Remark 2.11 and Exercise 2.4 (the real conic) match. The statement of Stacks tag 0D04 was confirmed on the public tag page (Proposition 99.10.2: for f flat, of finite presentation and proper, the Picard stack is algebraic). All three excerpts are literal."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-d-the-relative-picard-functor-and-the-jacobian-scheme/rigidification-along-a-section-and-the-split-exact-sequence",
    "verdict": "verified",
    "note": "Kleiman 2.8-2.10 and the proof of Part 2 of Theorem 2.5 (pp. 19-20), Stacks 4.3 (pp. 9-10), 6.1 and the definition of Pic_{X/k,sigma} (p. 11), and Milne III 1.7-1.8 (pp. 88-89) read. All clauses match and the excerpts are literal. Kleiman 2.9 needs only a section; 2.10 needs the universal isomorphism O_S = f_*O_X, which the node assumes throughout."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-d-the-relative-picard-functor-and-the-jacobian-scheme/representability-criterion-and-the-open-subfunctor-inside-hilb-g",
    "verdict": "verified",
    "note": "Picard 5.1 (p. 10) and 6.2-6.4 (pp. 11-12) read with proofs. The statement matches, including the degree-g count and the omitted check that L |-> m is inverse. The derived geometric-irreducibility remark is correctly labelled. The excerpt is literal."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-d-the-relative-picard-functor-and-the-jacobian-scheme/representability-of-the-picard-scheme-over-a-separably-closed-field",
    "verdict": "corrected",
    "note": "Picard 6.5-6.7 (pp. 12-15) read with proofs. The statement matches, and both source slips are confirmed: the introduction says \"algebraically closed\", and the proof of 6.7 says \"(2)\" for properness. Added hypothesis: the proof does not argue 6.7(3) or 6.7(6) separately; (6) follows because gamma_g is an open immersion on a nonempty open of the irreducible Hilb^g and is surjective (derived step)."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-d-the-relative-picard-functor-and-the-jacobian-scheme/milne-construction-of-the-jacobian-over-an-arbitrary-field-with-galois-descent",
    "verdict": "verified",
    "note": "Milne III 1.6, 1.10 and 1.13-1.14 (pp. 88-91) and III.4 (pp. 98-101) read. Every construction step matches: r > 2g, C^gamma and P^gamma, the section built from q_*(L (x) p^*L_gamma^{-1}) via I 4.2e, gluing (\"It is easy to see\"), completeness, and the Kollar footnote. The hypotheses were confirmed against Milne's conventions (p. v) and I 6.4 (projectivity via the theorem of the square). The excerpt is literal."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-d-the-relative-picard-functor-and-the-jacobian-scheme/grothendieck-existence-theorem-and-projectivity-of-pic-zero",
    "verdict": "corrected",
    "note": "Kleiman 4.7-4.8 (pp. 27-28), 5.1 and 5.3-5.4 (pp. 36-38) and 5.19-5.20 (pp. 47-48) read. Correction: the 5.20 clause omitted the hypothesis that Pic_{X/S} represents the fppf sheaf, and wrote \"fibres are complete\" where the source requires every Pic^0_{X_s/k_s} to be complete; both fixed, and the smoothness clause for reduced S added. The complete proof of 5.4 was read, and its imports (Chevalley-Rosenlicht [Co02], Lie-Kolchin [Bo69], Hartshorne Ex. II 6.15, [AK70] (3.10)) were added to the hypotheses, the proof steps and a new gap. The excerpt is literal."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-e-abelian-varieties/abelian-varieties-rigidity-homomorphisms-and-rational-maps",
    "verdict": "verified",
    "note": "Milne I.1 (pp. 7-10) and I.3 (pp. 15-20) read with proofs. Clauses 1.1-1.5 and 3.1-3.9 match, and the cited ingredients (Hartshorne II 4.7, AG chapter 12, Lemmas 3.5-3.6) are confirmed. The excerpt is literal."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-e-abelian-varieties/tangent-space-of-the-jacobian-and-dimension-equals-genus",
    "verdict": "verified",
    "note": "Milne III 2.1 (p. 91) and I 8.7(e) (p. 37) read, as were Kleiman 5.11 (whole proof, pp. 42-44), 5.13-5.15 (p. 44) and 5.19 (p. 47). All statement clauses match and the excerpts are literal."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-e-abelian-varieties/theorem-of-the-cube-and-theorem-of-the-square",
    "verdict": "corrected",
    "note": "Milne I.5 (pp. 21-27) read. Correction: the node said that the proof of the cube is deferred. The notes in fact reduce it (via 5.12, the seesaw 5.16-5.19, and Lemma 5.20 with Chow's lemma, blow-up and Bertini) to the case of a complete nonsingular curve, and only that case is omitted (Mumford 1970, pp. 57-58). The hypothesis, title and locator were updated, and the statement now includes 5.16-5.19, which the I.8 link consumes. The formula of 5.4 was checked on the page image of p. 22. The excerpt is literal."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-e-abelian-varieties/isogenies-multiplication-by-n-and-p-torsion",
    "verdict": "verified",
    "note": "Milne I.7 (pp. 32-34) read. 7.1-7.2 match and the 7.2 excerpt is literal. The formula of 7.4, Ker(p) = (Z/pZ)^r x alpha_p^{2g-2r} x mu_p^r, was checked on the page image of p. 34. The unproved assertions (additivity of differentials, rank of T_l A) are confirmed."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-e-abelian-varieties/dual-abelian-variety-poincare-sheaf-and-polarizations",
    "verdict": "verified",
    "note": "Milne I.8 (pp. 34-40) and I.11 (pp. 53-54) read. K(L), 8.4, the universal property of (A^vee, P), 8.7(a)-(e), 8.8, 8.9 (Mumford p. 81), 8.14, the characteristic-zero sketch, the definition of a polarization and 11.1 (Mumford p. 150) match. The excerpt is literal."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-e-abelian-varieties/autoduality-of-the-jacobian-and-the-canonical-principal-polarization",
    "verdict": "verified",
    "note": "Milne III.6 (pp. 104-108) read, with the signs checked on the page images of pp. 105-108: Lemma 6.9 (\"the maps -f^vee and phi_{L(Theta)} are inverse\"), Remark 6.10(b), and Summary 6.11 (M^P = (f x (-1))^*L'(Theta) = (f x 1)^*L'(Theta)^{-1}, L^P = (f x f)^*L'(Theta)^{-1}, f^vee = -phi^{-1}). All match the node. The excerpt is literal."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-f-abeljacobi-and-the-universal-property/abel-jacobi-morphism-from-the-universal-divisorial-correspondence",
    "verdict": "verified",
    "note": "Milne III.2 (pp. 91-92) read. The definitions of L^P and f^P, the action on points, independence of P, the translation and Galois rules, and J = 0 in genus 0 match. The excerpt is literal."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-f-abeljacobi-and-the-universal-property/abel-jacobi-is-a-closed-immersion-in-positive-genus",
    "verdict": "corrected",
    "note": "Milne III 2.2-2.4 (pp. 92-93) read. The statement and proof steps match and the excerpt is literal. Added the unnamed import Shafarevich 1994, III 5.2, cited in 2.2 for the isomorphism h_J, together with a note that the \"(1.6)\" cross-reference in 2.2 means 2.1; the corresponding gap and coverage record were updated."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-f-abeljacobi-and-the-universal-property/abel-maps-from-symmetric-powers-birationality-and-fibres",
    "verdict": "verified",
    "note": "Milne III.5 (pp. 101-103) read. Clauses 5.1-5.6 match, including 5.5 (degree r! for r <= g) and 5.6(c) (fibres P^{h^0(D)-1}; smooth with fibres P^{r-g} for r > 2g - 2). The excerpt is literal with an elision."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-f-abeljacobi-and-the-universal-property/albanese-universal-property-of-the-jacobian",
    "verdict": "verified",
    "note": "Milne III 6.1-6.5 (pp. 104-105) read. The statement and proof steps match (I 3.2, I 1.2, W^g = J; 6.2 via I 5.13; 6.4 by Galois uniqueness), and the excerpt is literal."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-f-abeljacobi-and-the-universal-property/base-change-compatibility-of-the-jacobian",
    "verdict": "verified",
    "note": "Milne III 1.4(b) (p. 86) and I 8.7(b) (p. 37), Kleiman Exercise 4.4 (p. 27) and the Stacks remark after Definition 4.1 (p. 9) read. All three excerpts are literal. The Yoneda argument is correctly labelled as derived."
   },
   {
    "nodeId": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-f-abeljacobi-and-the-universal-property/genus-zero-and-genus-one-checks",
    "verdict": "unverifiable",
    "note": "Verified part: Milne III 1.4(e) (p. 86), with a literal excerpt. The derived scheme-level argument is sound: a closed immersion of E into the irreducible 1-dimensional J is an isomorphism, and it is a homomorphism by I 1.2. Unverifiable part: the Silverman III.3.4 content (the point-level bijection and group law, the excerpt, the proof steps, and the \"K perfect\" hypothesis) rests only on Silverman AEC, which has no public copy; the library copy was not available. Milne I 5.7 cites \"Silverman 1986, III 3.4d\" for the same homomorphism, but that is corroboration, not a check of the passage."
   }
  ]
 },
 "nodes": {
  "changed": {
   "tauceti:TauCetiRoadmap/JacobianChallenge:layer-a-line-bundles-divisors-picard-group-degree/weil-divisors-class-group-and-comparison-with-pic": {
    "acceptance": [
     "Roadmap Layer A: Weil = Cartier on a smooth curve, principal divisors, and Cl(X) = Pic X.",
     "Check that the class of sum n_x [x] maps to O_X(sum n_x x) under the inverse of (28.5.1), compatibly with the degree node of Layer A (Varieties 44.9: deg O_X(D) = dim_k Gamma(D, O_D))."
    ]
   },
   "tauceti:TauCetiRoadmap/JacobianChallenge:layer-c-relative-coherent-cohomology-and-base-change/flat-base-change-for-quasi-coherent-cohomology": {
    "sources": [
     {
      "sourceId": "stacks-project-cohomology-of-schemes",
      "locator": "Lemma 5.2 (flat base change) with proof, pp. 10-11; Lemma 7.1 with proof, pp. 12-13",
      "excerpt": "Assume that g is flat and that f is quasi-compact and quasi-separated. For any i ≥ 0 (1) the base change map of Cohomology, Lemma 17.1 is an isomorphism",
      "match": "Literal part of Lemma 5.2."
     }
    ]
   },
   "tauceti:TauCetiRoadmap/JacobianChallenge:layer-c-relative-coherent-cohomology-and-base-change/cohomology-and-base-change-semicontinuity-and-locally-constant-euler-characteristic": {
    "statement": "Let f: X -> S be proper of finite presentation and G finitely presented and flat over S. Then Rf_*G is perfect and its formation commutes with arbitrary base change (30.4). Consequences: s |-> dim H^i(X_s, F_s) is upper semicontinuous with locally constructible level sets, compatibly with base change (32.1); s |-> chi(X_s, F_s) is locally constant (32.2); for fixed i, r there is an open U with T -> S factoring through U iff Rf_{T*}F_T is finite locally free of rank r in degree i (32.3); R^i f_*F = 0 for i > 0 makes f_*F locally free and compatible with base change (32.4); and if f is proper, flat and of finite presentation with geometrically reduced and connected fibres, then f_*O_X = O_S universally (32.5-32.6). Milne I Theorem 4.2 records the same package for proper flat regular maps and locally free sheaves (flat base change, local constancy of chi, semicontinuity, local freeness of R^r f_*F with R^r f_*F (x) k(t) = H^r(V_t, F_t) when T is integral and h^r is constant (part (d)), and the H^1 = 0 case (part (e)))."
   },
   "tauceti:TauCetiRoadmap/JacobianChallenge:layer-c-relative-coherent-cohomology-and-base-change/relative-effective-cartier-divisors-on-smooth-relative-curves": {
    "proofSteps": [
     "Divisors 19.1: if h is a nonzerodivisor of B and B/hB is flat over A, then 0 -> B -> B -> B/hB -> 0 stays exact after any base change A -> A' (Algebra 39.12). Divisors 19.3: h_1 h_2 is a nonzerodivisor and B/h_1h_2B, an extension of B/h_2B by B/h_1B, is flat over A (Algebra 39.13).",
     "Picard 3.1: (2) <=> (3) via Divisors 19.9 and the case of a field; for proper X/S, (1) <=> (2) because a proper locally quasi-finite morphism is finite (More on Morphisms 44.1).",
     "Picard 3.2: D_1 + D_2 is relative effective (19.3) and proper, hence finite locally free; the degree adds by a local computation over a field."
    ]
   },
   "tauceti:TauCetiRoadmap/JacobianChallenge:layer-d-the-relative-picard-functor-and-the-jacobian-scheme/representability-of-the-picard-scheme-over-a-separably-closed-field": {
    "hypotheses": [
     "k separably closed: 6.5 uses that k-rational points are dense (Varieties 25.6). The chapter introduction says \"algebraically closed\"",
     "Source slip: in the proof of 6.7 the sentence \"This finishes the proof of (2)\" concludes properness, which is part (1)",
     "Smoothness of gamma_d cites Varieties 44.17, which is stated over an algebraically closed field (base change needed), and the identification of the fibre with Proj(Sym Gamma(X, L)^*) is omitted",
     "Over a general field with a k-rational point the chapter does not prove representability; see the Milne construction and Kleiman 4.8 nodes",
     "The proof of 6.7 does not argue parts (3) (Pic^0 is a subgroup scheme) and (6) (gamma_g is birational) separately. (6) follows from the proof: gamma_g is an open immersion on a nonempty open of the irreducible Hilb^g and gamma_g is surjective (derived step)"
    ]
   },
   "tauceti:TauCetiRoadmap/JacobianChallenge:layer-d-the-relative-picard-functor-and-the-jacobian-scheme/grothendieck-existence-theorem-and-projectivity-of-pic-zero": {
    "sources": [
     {
      "sourceId": "kleiman-2005-the-picard-scheme",
      "locator": "Exercise 4.7, Theorem 4.8 statement and opening of proof, pp. 27-28; Proposition 5.3, Theorem 5.4 with proof, pp. 37-38; Propositions 5.19-5.20, pp. 47-48",
      "excerpt": "Assume f : X → S is projective Zariski locally over S, and is flat with integral geometric fibers. (1) Then PicX/S exists, is separated and locally of finite type over S, and represents Pic(X/S) (ét) .",
      "match": "Literal Theorem 4.8(1)."
     }
    ],
    "proofSteps": [
     "4.8: reduce to S Noetherian and X/S projective; (1) follows from (2).",
     "5.4: Pic^0 is of finite type by 5.3 and quasi-projective by Exercise 4.11. For geometrically normal X it suffices to prove properness, which may be checked over kbar (EGA IV 2.7.1). By Chevalley-Rosenlicht and Lie-Kolchin it suffices that every map from G_m to (Pic^0)_red is constant; such a map comes from an invertible sheaf L = O(D) on X x T, and normality of X x T gives L = p^*O(E), so the map is constant.",
     "5.19: pass to a strictly local base with algebraically closed residue field; lift invertible sheaves along square-zero thickenings, using H^2(f_T^*I) = H^0(R^2 f_{T*} f_T^*I) = 0."
    ],
    "statement": "(4.8) If f: X -> S is projective Zariski locally over S and flat with integral geometric fibres, then Pic_{X/S} exists, is separated and locally of finite type over S, and represents Pic_{(X/S)(et)}. If moreover S is Noetherian and X/S projective, it is a disjoint union of open subschemes, each an increasing union of open quasi-projective S-schemes. (5.3) Over a field, if Pic_{X/k} exists and represents the fppf sheaf, then Pic_{X/k} is separated; it is smooth if it has a geometrically reduced open subscheme; and Pic^0_{X/k} is an open and closed subgroup scheme of finite type, geometrically irreducible, whose formation commutes with field extension. (5.4) If X/k is projective and geometrically integral, Pic^0_{X/k} exists and is quasi-projective, and it is projective if X is geometrically normal. (5.19) If Pic_{X/S} represents the etale sheaf and H^2(O_{X_s}) = 0, then Pic_{X/S} is smooth over a neighbourhood of s. (5.20) If Pic_{X/S} exists and represents the fppf sheaf, and all the Pic^0_{X_s/k_s} are smooth of the same dimension, then Pic_{X/S} has an open group subscheme Pic^0_{X/S} of finite type whose fibres are the Pic^0_{X_s/k_s}; it is smooth over S if S is reduced; and it is closed in Pic_{X/S} and proper over S if all the Pic^0_{X_s/k_s} are complete and Pic_{X/S} is separated over S.",
    "hypotheses": [
     "4.8 is proved through Hilbert and Quot schemes and relative representability (Kleiman sections 3-4); only the statement and the opening of the proof were read",
     "5.4 uses Exercise 4.11 and EGA IV 2.7.1; 5.19 uses semicontinuity and the property of exchange (EGA III 7.7.5, 7.7.10) and the infinitesimal lifting criterion (proof read)",
     "For a curve H^2(X, O_X) = 0, so 5.19 gives smoothness (derived combination)",
     "The complete proof of 5.4 (p. 38) also imports: the Chevalley-Rosenlicht structure theorem ([Co02, Thm. 1.1]); the Lie-Kolchin theorem ([Bo69, (10.5) and (10.2)]); every invertible sheaf on the integral X x T is O(D) ([Ha83, Ex. II 6.15]); coincidence of divisors and cycles on the normal X x T ([AK70, Prp. (3.10)]); and the Comparison Theorem 2.5 (X/k has a section once k is algebraically closed). None of these references was read"
    ]
   },
   "tauceti:TauCetiRoadmap/JacobianChallenge:layer-e-abelian-varieties/theorem-of-the-cube-and-theorem-of-the-square": {
    "sources": [
     {
      "sourceId": "milne-2008-abelian-varieties-v2",
      "locator": "I.5: Theorem 5.1 statement, Corollaries 5.2-5.4 and Theorem 5.5 with proofs, Remarks 5.6-5.7, 5.8-5.15, pp. 21-25; Theorem 5.16, Corollaries 5.17-5.18, Proposition 5.19, Lemma 5.20 and the partial proof of Theorem 5.1, pp. 26-27",
      "excerpt": "Then an invertible sheaf L on U × V × W is trivial if its restrictions to U × V × {w0}, U × {v0} × W , {u0} × V × W are all trivial.",
      "match": "Literal conclusion of Theorem 5.1."
     }
    ],
    "title": "Milne I 5.1-5.20: the theorem of the cube (reduced in the notes to the case of a curve, whose proof is omitted), n_A^*L = L^{(n^2+n)/2} (x) (-1)^*L^{(n^2-n)/2}, the theorem of the square, a |-> t_a^*L (x) L^{-1} is a homomorphism, and the seesaw principle",
    "statement": "(5.1) Let U, V, W be complete geometrically irreducible varieties with base points. An invertible L on U x V x W is trivial if its restrictions to U x V x {w_0}, U x {v_0} x W and {u_0} x V x W are trivial. (5.2) For L on an abelian variety A, p_123^*L (x) p_12^*L^{-1} (x) p_23^*L^{-1} (x) p_13^*L^{-1} (x) p_1^*L (x) p_2^*L (x) p_3^*L is trivial on A^3. (5.3) The same holds after pulling back along (f, g, h): V -> A^3. (5.4) n_A^*L = L^{(n^2+n)/2} (x) ((-1)_A^*L)^{(n^2-n)/2}; so n_A^*L = L^{n^2} if L is symmetric and L^n if L is antisymmetric. (5.5) t_{a+b}^*L (x) L = t_a^*L (x) t_b^*L. (5.6) a |-> t_a^*L (x) L^{-1}: A(k) -> Pic(A) is a homomorphism. (5.13) Triviality of an invertible sheaf on a complete variety descends from any field extension. (5.15) For V complete, t |-> dim Gamma(V_t, L_t) is upper semicontinuous, and if it is constant then q_*L is locally free. (5.16) For V complete and L on V x T with every L_t trivial, L = q^*N for an invertible N on T; (5.17) if L_t = M_t for all t, then L = M (x) q^*N; (5.18, seesaw) if moreover L_v = M_v for one v in V(k), then L = M. (5.19) For V complete, {t : L_t trivial} is closed in T.",
    "hypotheses": [
     "Theorem 5.1 is stated with \"We defer the proof until later in this section [actually, until the next version]\", but pp. 26-27 give a partial proof: reduction to k algebraically closed (5.12); by the seesaw principle (5.18) and 5.19 it suffices to prove triviality on a dense set of fibres; Lemma 5.20 (any two points of an irreducible variety over an algebraically closed field lie on an irreducible curve, via Chow's lemma [Mumford 1999, p. 115], the blow-up at the two points and Bertini [Jouanolou 1983, 6.3]) reduces to V a complete nonsingular curve. The curve case is omitted: \"should have been included in the notes (Mumford 1970, p57-58). [See the next version.]\". That curve case, Chow's lemma and Bertini are unread imports (Mumford, Abelian Varieties, catalogued as requested)",
     "5.15: \"We omit the proof. See Mumford 1970, II 5\"",
     "5.16 uses I 4.2(d) and 5.11; 5.19 uses supports of q_*L and q_*L^vee (AG chapter 13)"
    ]
   },
   "tauceti:TauCetiRoadmap/JacobianChallenge:layer-f-abeljacobi-and-the-universal-property/abel-jacobi-is-a-closed-immersion-in-positive-genus": {
    "hypotheses": [
     "The commutative diagram in 2.2 is \"left as an exercise to the reader (unfortunately rather complicated)\"",
     "The reduction \"It suffices to prove this in the case that k is algebraically closed\" uses fpqc descent of the closed-immersion property, not argued",
     "Uses the tangent space identification T_0 J = H^1(C, O_C) from Layer E and Riemann-Roch with duality from Layer B",
     "The proof of 2.2 also cites Shafarevich 1994, III 5.2 for the isomorphism h_J: Gamma(J, Omega^1_J) -> T_0(J)^vee of a group variety (not read); its bottom isomorphism is labelled \"the dual of the isomorphism in (1.6)\", evidently meaning Proposition 2.1"
    ]
   },
   "tauceti:TauCetiRoadmap/JacobianChallenge:layer-f-abeljacobi-and-the-universal-property/genus-zero-and-genus-one-checks": {
    "sources": [
     {
      "sourceId": "milne-2008-abelian-varieties-v2",
      "locator": "III.1: Remark 1.4(e), p. 86",
      "excerpt": "If C has genus 1, then Jac(C) = C (provided C has a rational point; otherwise it differs from C",
      "match": "Literal Remark 1.4(e), genus-one part."
     },
     {
      "sourceId": "silverman-arithmetic-of-elliptic-curves-2009",
      "locator": "III.3: Proposition 3.4 with proof, pp. 61-63",
      "excerpt": "Thus σ induces a bijection of sets (which we also denote by σ), σ : Pic0 (E) → E.",
      "match": "Literal Proposition 3.4(c) conclusion (arrow transliterated). Not re-verified by independent review REVIEW-EXT-13-EXT-07B (no public copy; library copy unavailable to the reviewer)."
     }
    ],
    "hypotheses": [
     "Silverman assumes K perfect and works with points over Kbar; III.3.4 is a statement about groups of Kbar-points and divisor classes",
     "The derived scheme-level argument uses the closed-immersion node, the dimension node, and rigidity (Milne I 1.2)",
     "Independent review 2026-09-24: the Silverman III.3.4 content (statement clauses, proof steps and excerpt) could not be re-checked, because there is no public copy. Milne AV I Remark 5.7 (p. 23, read) cites \"Milne 2006, 4.10, or Silverman 1986, III 3.4d\" for the homomorphism P |-> [P - P_0]: A(k) -> Pic(A) of an elliptic curve, which corroborates the cited result but is not a check of the passage"
    ]
   }
  },
  "added": [],
  "removed": []
 },
 "links": {
  "added": [
   {
    "source": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality/genus-and-riemann-roch-in-euler-characteristic-form",
    "target": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-d-the-relative-picard-functor-and-the-jacobian-scheme/milne-construction-of-the-jacobian-over-an-arbitrary-field-with-galois-descent",
    "reason": "Milne's construction uses Riemann-Roch h^0(D) - h^1(D) = deg D + 1 - g: in the proof of Proposition 4.2(b), h^0(D_t - D_gamma) = 1 with deg(D_t - D_gamma) = g gives h^1(D_t - D_gamma) = 0, which makes q_*(L (x) p^*L_gamma^{-1}) invertible and compatible with base change (I 4.2e). Added by the independent reviewer; stage edge Layer B -> Layer D already present.",
    "sources": [
     {
      "sourceId": "milne-2008-abelian-varieties-v2",
      "locator": "III proof of Proposition 4.2(b), p. 100"
     }
    ]
   }
  ],
  "removed": [],
  "changed": [
   {
    "source": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality/vanishing-of-h1-in-degree-at-least-2g-minus-1",
    "target": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-d-the-relative-picard-functor-and-the-jacobian-scheme/milne-construction-of-the-jacobian-over-an-arbitrary-field-with-galois-descent",
    "reason": "For a divisor class of degree r > 2g - 2, h^1 = 0 and h^0 = r + 1 - g (III.1 overview): section 4 uses h^0(L) = r + 1 - g for deg L = r > 2g to set up the (r - g)-dimensional system of divisors, and the proof of 4.2(a) takes a basis e_0, ..., e_{r-g} of H^0(C, L(D)). Annotated by the independent reviewer: the vanishing h^1(D_t - D_gamma) = 0 in the proof of 4.2(b) is a Riemann-Roch count in degree g with h^0 = 1, supplied by the genus/Riemann-Roch node (separate link), not by this node.",
    "sources": [
     {
      "sourceId": "milne-2008-abelian-varieties-v2",
      "locator": "III.1 overview, p. 87; III.4 paragraph before Proposition 4.2 and proof of 4.2(a), pp. 99-100"
     }
    ]
   },
   {
    "source": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-e-abelian-varieties/theorem-of-the-cube-and-theorem-of-the-square",
    "target": "tauceti:TauCetiRoadmap/JacobianChallenge:layer-e-abelian-varieties/dual-abelian-variety-poincare-sheaf-and-polarizations",
    "reason": "Lemma 8.8 (t_a^*L (x) L^{-1} lies in Pic^0) is the theorem of the square; K(L) and Proposition 8.4 use 5.19 and the seesaw principle 5.18. (Annotated by the independent reviewer: 5.16-5.19 were added to the source node, whose statement previously stopped at 5.15.)",
    "sources": [
     {
      "sourceId": "milne-2008-abelian-varieties-v2",
      "locator": "I definition of K(L), Proposition 8.4 and Lemma 8.8, pp. 34-37"
     }
    ]
   }
  ]
 },
 "gaps": [
  {
   "title": "Standing hypotheses and the curve conventions of the sources are not reconciled",
   "neededBy": [
    "tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree",
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-d-the-relative-picard-functor-and-the-jacobian-scheme/rigidification-along-a-section-and-the-split-exact-sequence",
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-d-the-relative-picard-functor-and-the-jacobian-scheme/representability-criterion-and-the-open-subfunctor-inside-hilb-g"
   ],
   "detail": "The roadmap asks for the lemma that a smooth, proper, geometrically connected curve is geometrically integral, and it uses H^0(X, O_X) = k. The sources use different conventions. Stacks \"curves\" are integral varieties, and Picard 3.6 assumes geometric irreducibility. Milne's varieties are geometrically reduced and omit nonclosed points. Kleiman assumes integral geometric fibres. Stacks Varieties 9.3 and 26.2 were read only as statements; the lemmas \"smooth implies geometrically reduced\" and \"a connected normal Noetherian scheme is irreducible\" were not read. Candidate primitives (unchecked): Mathlib AlgebraicGeometry/Geometrically/Integral.lean and Connected.lean. Next source action: Stacks Varieties sections 6-10 and 25."
  },
  {
   "title": "Ordering conflicts between roadmap layers, left unlinked to avoid stage cycles",
   "neededBy": [
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-a-line-bundles-divisors-picard-group-degree/degree-of-invertible-sheaves-on-proper-curves-via-euler-characteristic",
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-d-the-relative-picard-functor-and-the-jacobian-scheme/milne-construction-of-the-jacobian-over-an-arbitrary-field-with-galois-descent",
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-e-abelian-varieties/autoduality-of-the-jacobian-and-the-canonical-principal-polarization"
   ],
   "detail": "Three dependencies run against the roadmap's layer order. (i) Layer A defines deg L = chi(L) - chi(O_X), which needs Layer B finiteness (Cohomology of Schemes 19.2, 4.2); Varieties 44.2 needs Layer C flat base change. Linking these would create a Layer A <-> B/C cycle, since A feeds B and C. (ii) Milne's Layer D construction descends J along a Galois extension (III 1.13(a), citing AG 16.23), which needs J' quasi-projective, i.e. projectivity of abelian varieties (I 6.4, via the Layer E theorem of the cube). Stacks Picard 6.7 uses instead that group schemes over a field are separated (Groupoids 7.3). (iii) Layer E autoduality (III 6.6-6.9) uses the Abel-Jacobi map, M_P and Theorem 5.1 of Layer F. The one reversal that was linked is C -> B (flat base change for the genus), which is acyclic. Orchestrator decision needed: reorder these sub-results or accept cross-layer edges."
  },
  {
   "title": "Serre duality and deg omega = 2g - 2 rest on Duality for Schemes and Chow Homology, which were not read",
   "neededBy": [
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality/dualizing-module-serre-duality-and-degree-of-the-canonical-sheaf"
   ],
   "detail": "Curves 4.1-4.2 derive the dualizing module from Duality for Schemes: the right adjoint a, Remark 12.5, Examples 22.1-22.2, Lemmas 15.7, 21.1, 22.4-22.5, 23.1 and 24.2-24.4. They also use Dualizing Complexes 20.2. Curves 5.2 uses Chow Homology 41.3 (deg E = deg(c_1(E) cap [X]_1)). None of these was read, and Hartshorne III.7 and IV.1, named by the roadmap, are not available. The TauCeti function-field Riemann-Roch (TauCeti/FieldTheory/FunctionField/RiemannRoch: Genus, Basic, DegreeZero; Differential/CanonicalDivisor) is a candidate for the comparison contract with AlgebraicCurves Layer 12 (unchecked). Next source action: Stacks Duality for Schemes sections 3, 12, 15-16 and 21-24, and Chow Homology section 41."
  },
  {
   "title": "Representability over an arbitrary field with a rational point is not proved line by line in any source read",
   "neededBy": [
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-d-the-relative-picard-functor-and-the-jacobian-scheme/representability-of-the-picard-scheme-over-a-separably-closed-field",
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-d-the-relative-picard-functor-and-the-jacobian-scheme/milne-construction-of-the-jacobian-over-an-arbitrary-field-with-galois-descent",
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-d-the-relative-picard-functor-and-the-jacobian-scheme/grothendieck-existence-theorem-and-projectivity-of-pic-zero"
   ],
   "detail": "Stacks proves representability only for separably closed k (Picard 6.5-6.6), although its introduction says \"algebraically closed\". Milne's descent from k^sep (III 1.13-1.14) cites AG 16.23 and Serre or Waterhouse for Galois descent, and leaves the gluing claims (\"It is easy to see\") and separatedness unwritten. Kleiman 4.8 is proved through Hilbert and Quot schemes (Kleiman sections 3-4), read only to the opening of the proof. Also unread: Stacks Descent (Proposition 5.2, Lemma 37.2), Schemes 15.4 (functorial gluing), Groupoids 7.3, and the Quot and Hilbert Spaces chapter (tag 0D04: the Picard stack is algebraic; statement only). Next source action: Kleiman sections 3-4 and Appendix A (Exercises 4.4, 4.11), Stacks Descent sections 5-6 and 37, and a Galois-descent reference for quasi-projective schemes."
  },
  {
   "title": "The theorem of the cube, the dual abelian variety in characteristic p and the polarization degree formulas are cited to Mumford, which is not available",
   "neededBy": [
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-e-abelian-varieties/theorem-of-the-cube-and-theorem-of-the-square",
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-e-abelian-varieties/dual-abelian-variety-poincare-sheaf-and-polarizations",
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-e-abelian-varieties/autoduality-of-the-jacobian-and-the-canonical-principal-polarization",
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-e-abelian-varieties/isogenies-multiplication-by-n-and-p-torsion"
   ],
   "detail": "Milne states the theorem of the cube (I 5.1) and defers its proof \"until the next version\". Pages 26-27 nevertheless reduce it, via 5.12, the seesaw principle 5.16-5.19 and Lemma 5.20 (Chow's lemma [Mumford 1999, p. 115], blow-up, Bertini [Jouanolou 1983, 6.3]), to the case of a complete nonsingular curve, whose proof is omitted and referred to Mumford 1970, pp. 57-58. He cites Mumford for 5.15, 8.9, 8.14, the characteristic-p construction of A^vee, and 11.1. Projectivity of abelian varieties (I 6.4, read by the independent reviewer) is proved in the notes over an algebraically closed field from the theorem of the square (5.5-5.6) and Proposition 6.3 (Hartshorne II 7.8.2); separation of tangents is \"similar\" and not written; Proposition 6.6 removes the hypothesis on k. It is used by 7.2 and by the descent step. The additivity of differentials in 7.2, the rank of T_l A (7.3) and the structure of Ker(p) (7.4) are asserted. Mumford, Abelian Varieties, is catalogued as requested. Candidate primitives (unchecked): TauCeti/AlgebraicGeometry/AbelianVariety (the AbelianVariety structure, baseChange, TangentSpace, isogenies, mulBy, End) and Mathlib AlgebraicGeometry/Group/Abelian.lean (commutativity of proper geometrically integral group objects). Next source action: Mumford section 6 (curve case of the cube, pp. 57-58), sections 5-8 and 13 once acquired, or Milne I sections 8-9 in full."
  },
  {
   "title": "Omitted steps inside Milne's Jacobian chapter",
   "neededBy": [
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-f-abeljacobi-and-the-universal-property/abel-jacobi-is-a-closed-immersion-in-positive-genus",
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-f-abeljacobi-and-the-universal-property/abel-maps-from-symmetric-powers-birationality-and-fibres",
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-c-relative-coherent-cohomology-and-base-change/hilbert-scheme-of-points-equals-symmetric-power-of-a-smooth-proper-curve",
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-f-abeljacobi-and-the-universal-property/base-change-compatibility-of-the-jacobian"
   ],
   "detail": "Several steps are omitted in Milne's Jacobian chapter. The commutative diagram of III 2.2 is \"left as an exercise to the reader (unfortunately rather complicated)\", and 5.3 depends on it. Existence of symmetric powers (3.1) is cited to Mumford. Theorem 3.13 asserts a finite flat splitting cover and descent without details. Remark 1.4(b) (base change) is stated without proof, and the answer to Kleiman's Exercise 4.4 (Appendix A) was not read. The reductions to algebraically closed k in 2.3, 5.1 and 6.2 need descent of closed immersions and of isomorphisms of invertible sheaves (I 5.13 covers the latter). The PDF text layer drops minus signs in III.6; Lemma 6.9 and Summary 6.11 were checked on page images. Next source action: Milne, Jacobian varieties, in Cornell-Silverman (1986), and Kleiman Appendix A. The proof of III 2.2 also cites Shafarevich 1994, III 5.2 (h_J: Gamma(J, Omega^1_J) -> T_0(J)^vee is an isomorphism for a group variety), not read."
  },
  {
   "title": "Genus-one identification at scheme level and reconciliation with Mathlib's elliptic-curve group law",
   "neededBy": [
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-f-abeljacobi-and-the-universal-property/genus-zero-and-genus-one-checks"
   ],
   "detail": "Milne III 1.4(e) states Jac(C) = C in genus 1 without proof. Silverman III.3.4 proves only the bijection E(Kbar) -> Pic^0(E_Kbar) with compatible group laws. The scheme-level isomorphism is a derived argument (closed immersion, dimension one, rigidity). The roadmap asks to reconcile it with Mathlib's E(k) group law, built via the class group (ClassGroup.mk W.FunctionField (XYIdeal' ...) in Mathlib AlgebraicGeometry/EllipticCurve/Affine/Point.lean, present in the local Mathlib, unchecked). That needs a comparison between Pic of the projective model and the class group of the affine coordinate ring, which is not decomposed. Silverman III.3.4 has no public copy and was not re-checked by the independent review of 2026-09-24; the orchestrator should have it checked against the library copy (hash 72ee67bf...) or replace it by a public source."
  },
  {
   "title": "Layer A-C formal content beyond the Stacks statements read",
   "neededBy": [
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-a-line-bundles-divisors-picard-group-degree/effective-cartier-divisors-invertible-sheaves-and-regular-sections",
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-a-line-bundles-divisors-picard-group-degree/weil-divisors-class-group-and-comparison-with-pic",
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-c-relative-coherent-cohomology-and-base-change/cohomology-and-base-change-semicontinuity-and-locally-constant-euler-characteristic",
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-c-relative-coherent-cohomology-and-base-change/flat-base-change-for-quasi-coherent-cohomology"
   ],
   "detail": "Divisors 15.10 has \"Proof. Omitted.\". The group isomorphism Weil = Cartier (not only Cl = Pic) and non-effective Cartier divisors via meromorphic sections (Divisors 24-26) were not read. The agreement deg O_X(D) = sum n_x [kappa(x):k] is derived, not quoted. Unread: Derived Categories of Schemes 30.1 and 31.1-31.3 (perfect complexes), and Cohomology of Schemes 12.6, 16.2-16.3 and 18.1 (devissage, projective case, Chow's lemma). Hartshorne II-III, named by the roadmap, is not available. Candidate primitives (unchecked): TauCeti/AlgebraicGeometry/CartierDivisor, WeilDivisor (including PicZeroQuotient.lean), LineBundle and Cohomology (EulerCharacteristic.lean); Mathlib RingTheory/PicardGroup.lean (CommRing.Pic, affine charts only) and CategoryTheory/Sites/SheafCohomology (abstract only). Next source action: Stacks Divisors 14 and 24-26, Derived Categories of Schemes 30-31, Cohomology of Schemes 12 and 16-18."
  },
  {
   "title": "Consumer interfaces that need etale cohomology of the Jacobian are not supplied",
   "neededBy": [
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-e-abelian-varieties/isogenies-multiplication-by-n-and-p-torsion",
    "tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property"
   ],
   "detail": "Several consumers need H^1_et(X_kbar, Z_l(1)) = T_l J and the Kummer sequence for G_m on X: WeilConjectures WC.5 (b_1 = 2g), EtaleDualityAndPerverseSheaves EDC.2:trace-purity (Kummer classes), SchemeAndStackFoundations SF.3 (Jacobian Tate module versus H^1_et) and PadicHodgeTheory R06.5 (\"General etale realization is consumed from #196/JacobianChallenge\"). None of this is in the sources read, and Milne I 7.3 states the rank of T_l A without proof. GrossZagierAndArithmeticHeights GZ.2, DeligneWeightsAndPurity DWP.1 and SchemeKTheoryOperations S.7 also name JacobianChallenge; their statements were not checked against the node IDs, and no links were added. Next source action: Milne, Lectures on Etale Cohomology, section 14, and Milne AV III section 9, or SGA 4 1/2 (Arcata)."
  },
  {
   "title": "Kleiman's proof that Pic^0 is projective for geometrically normal X imports structure theory of algebraic groups",
   "neededBy": [
    "tauceti:TauCetiRoadmap/JacobianChallenge:layer-d-the-relative-picard-functor-and-the-jacobian-scheme/grothendieck-existence-theorem-and-projectivity-of-pic-zero",
    "tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme"
   ],
   "detail": "The complete proof of Kleiman Theorem 5.4 (p. 38, read by the independent reviewer) uses: the Chevalley-Rosenlicht theorem [Co02, Thm. 1.1, p. 3]; the Lie-Kolchin theorem [Bo69, (10.5) and (10.2)]; [Ha83, Ex. II 6.15, p. 145] (invertible sheaves on an integral scheme come from divisors); [AK70, Prp. (3.10), p. 139] (cycles and divisors on a normal scheme); Exercise 4.11 (quasi-projectivity; its answer in Appendix A unread); and EGA IV 2.7.1(vii). None was read. For a smooth projective curve Stacks Picard 6.7 gives properness of every Pic^d directly (via gamma_d for d >= g), and Milne III.4 gives completeness from C^(r) -> J, so this import is needed only on Kleiman's route 2. Next source action: Conrad, \"A modern proof of Chevalley's theorem on algebraic groups\" (2002), and Kleiman Appendix A."
  }
 ],
 "coverage": [
  {
   "stageId": "tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree",
   "status": "partial",
   "remaining": [
    "Standing-hypotheses lemma (smooth + proper + geometrically connected => geometrically integral): not read.",
    "Group isomorphism Weil = Cartier and non-effective Cartier divisors (Divisors 24-26): not read; Divisors 15.10 has no proof in the source.",
    "Agreement deg L = sum [kappa(x):k] ord_x: derived, not quoted; the Euler-characteristic degree depends on Layers B-C (ordering gap)."
   ]
  },
  {
   "stageId": "tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality",
   "status": "partial",
   "remaining": [
    "Duality for Schemes and Dualizing Complexes behind Curves 4.1-4.2, and Chow Homology 41.3 behind Riemann-Roch 5.2: unread imports.",
    "Proof of finiteness (Cohomology of Schemes 19.1: devissage, Chow's lemma, projective case): only the top-level proof read.",
    "Two-affine cover of a projective curve: derived step."
   ]
  },
  {
   "stageId": "tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change",
   "status": "partial",
   "remaining": [
    "Perfect-complex lemmas (Derived Categories of Schemes 30.1, 31.1-31.3) behind cohomology and base change: unread.",
    "Theorem on formal functions (Grothendieck's route): not used by the decomposed route and not read.",
    "Projectivity of Sym^d X: derived (Stacks 3.6 gives proper); Milne 3.1 cites Mumford for existence of symmetric powers."
   ]
  },
  {
   "stageId": "tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme",
   "status": "partial",
   "remaining": [
    "Representability over a general field with a rational point: Stacks proves only the separably closed case; Milne's Galois descent cites AG 16.23 and needs projectivity of abelian varieties; Kleiman 4.8 proof (Hilbert/Quot) unread.",
    "Descent inputs (Stacks Descent 5.2, 37.2), functorial gluing (Schemes 15.4), separatedness of group schemes (Groupoids 7.3): unread.",
    "Picard stack versus sheaf: only the statement of Stacks tag 0D04 looked up.",
    "Kleiman Theorem 5.4 imports (Chevalley-Rosenlicht, Lie-Kolchin, Hartshorne Ex. II 6.15, Altman-Kleiman (3.10), Exercise 4.11): unread."
   ]
  },
  {
   "stageId": "tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties",
   "status": "partial",
   "remaining": [
    "Theorem of the cube: the notes reduce it to curves (Milne I 5.20) and omit the curve case (Mumford 1970, pp. 57-58); dual abelian variety in characteristic p and Theorems 8.9, 8.14, 11.1 are cited to Mumford (requested). Projectivity of abelian varieties (Milne I 6.4) is proved in the notes from the theorem of the square, with separation of tangents left as \"similar\".",
    "Rank of T_l A and structure of Ker(p): stated only.",
    "Autoduality uses Layer F results (ordering gap)."
   ]
  },
  {
   "stageId": "tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property",
   "status": "partial",
   "remaining": [
    "Milne III 2.2 diagram (left as an exercise) behind the closed-immersion and Abel-map results; reductions to algebraically closed k.",
    "Base-change compatibility is stated (Milne 1.4(b)) and derived by Yoneda; Kleiman Exercise 4.4 answer unread.",
    "Scheme-level Jac(E, O) = E and reconciliation with Mathlib's class-group group law: derived or not decomposed.",
    "Etale-cohomology interfaces (T_l J versus H^1_et) requested by consumers: not in the sources read.",
    "Shafarevich 1994, III 5.2 (cited in Milne III 2.2 for h_J): unread."
   ]
  }
 ],
 "sources": [
  {
   "id": "stacks-project-picard-schemes-of-curves",
   "title": "The Stacks Project, Chapter 44: Picard Schemes of Curves (tag 0B92)",
   "authors": "The Stacks Project Authors",
   "edition": "Chapter PDF, Stacks Project version ed88ff78 compiled on July 14, 2026, downloaded 2026-09-16 from the Stacks Project site (GNU Free Documentation License); not in the supplied library, which holds only other Stacks chapters. Page numbers are chapter-internal. 18 pages. Independently re-fetched from the URL above on 2026-09-24 by independent review REVIEW-EXT-13-EXT-07B; the SHA-256 of the fetched file is identical to the value recorded here.",
   "url": "https://stacks.math.columbia.edu/download/pic.pdf",
   "sha256": "d2d67eba4fffb7f7d23f3e14b0413d6fb43aff623f27980e6b66476031b27174",
   "readSections": [
    "Whole chapter: Section 1 (introduction); Section 2 (Lemmas 2.1-2.5 with proofs, Proposition 2.6 with proof, Remark 2.7); Section 3 (Lemmas 3.1-3.5 with proofs, Proposition 3.6 with proof, Remark 3.7); Section 4 (Definition 4.1, Lemmas 4.2-4.3 with proofs); Section 5 (Lemma 5.1 with proof); Section 6 (Lemma 6.1, Lemma 6.2, Definition 6.3, Lemmas 6.4-6.5, Proposition 6.6, Lemma 6.7, all with proofs); Section 7 (Lemmas 7.1-7.2 with proofs), pp. 1-16"
   ]
  },
  {
   "id": "stacks-project-algebraic-curves",
   "title": "The Stacks Project, Chapter 53: Algebraic Curves (tag 0BRV)",
   "authors": "The Stacks Project Authors",
   "edition": "Chapter PDF, Stacks Project version ed88ff78 compiled on July 14, 2026, downloaded 2026-09-16 from the Stacks Project site (GNU Free Documentation License); not in the supplied library, which holds only other Stacks chapters. Page numbers are chapter-internal. 71 pages. Independently re-fetched from the URL above on 2026-09-24 by independent review REVIEW-EXT-13-EXT-07B; the SHA-256 of the fetched file is identical to the value recorded here.",
   "url": "https://stacks.math.columbia.edu/download/curves.pdf",
   "sha256": "c4e3d4c0fc533a3d46ce07c1bd6ec49f03e02c131da30ed275ada4bc9f82c030",
   "readSections": [
    "Section 1 (introduction)",
    "Section 4 (Lemma 4.1 with proof, Lemma 4.2 with proof, Remark 4.3, Lemmas 4.4-4.6), pp. 7-10",
    "Section 5 (discussion (5.0.1)-(5.0.5), Lemma 5.1 with proof, Lemma 5.2 (Riemann-Roch) with proof), pp. 10-11",
    "Section 6 opening (Lemma 6.1 statement), p. 12",
    "Section 8 (Definition 8.1 with discussion, Lemmas 8.2-8.4 with proofs), pp. 15-16"
   ]
  },
  {
   "id": "stacks-project-varieties",
   "title": "The Stacks Project, Chapter 33: Varieties (tag 0209)",
   "authors": "The Stacks Project Authors",
   "edition": "Chapter PDF, Stacks Project version ed88ff78 compiled on July 14, 2026, downloaded 2026-09-16 from the Stacks Project site (GNU Free Documentation License); not in the supplied library, which holds only other Stacks chapters. Page numbers are chapter-internal. 113 pages. Independently re-fetched from the URL above on 2026-09-24 by independent review REVIEW-EXT-13-EXT-07B; the SHA-256 of the fetched file is identical to the value recorded here.",
   "url": "https://stacks.math.columbia.edu/download/varieties.pdf",
   "sha256": "ed339c312c86721e3f830876da14cabe89a96e83e454a78b7cd355555f4bca45",
   "readSections": [
    "Lemma 9.3 statement, p. 20",
    "Lemma 25.6 statement and proof opening, p. 46",
    "Lemma 26.2 with proof, p. 48",
    "Lemmas 43.4-43.5 statements, p. 92",
    "Section 44 (Definition 44.1, Lemmas 44.2-44.17 with proofs), pp. 94-101",
    "Lemma 45.1 statement, p. 101"
   ]
  },
  {
   "id": "stacks-project-divisors",
   "title": "The Stacks Project, Chapter 31: Divisors (tag 01WO)",
   "authors": "The Stacks Project Authors",
   "edition": "Chapter PDF, Stacks Project version ed88ff78 compiled on July 14, 2026, downloaded 2026-09-16 from the Stacks Project site (GNU Free Documentation License); not in the supplied library, which holds only other Stacks chapters. Page numbers are chapter-internal. 94 pages. Independently re-fetched from the URL above on 2026-09-24 by independent review REVIEW-EXT-13-EXT-07B; the SHA-256 of the fetched file is identical to the value recorded here.",
   "url": "https://stacks.math.columbia.edu/download/divisors.pdf",
   "sha256": "0527740ac9877baff00aaad784e66aae83ff541dad40d4939028059f9f28a493",
   "readSections": [
    "Section 15 (Definition 15.1 with comments, Lemma 15.10, Remark 15.11), pp. 25-27",
    "Section 16 opening (Lemmas 16.1-16.2 statements), p. 27",
    "Section 19 (Lemma 19.1 with proof, Definition 19.2, Lemmas 19.3-19.4, Lemma 19.9 statement), pp. 38-41",
    "Sections 27-28 (Lemma 27.1, Definitions 27.2-27.7, Lemma 27.4, 27.6, Definition 28.1, Lemmas 28.2-28.3, Definition 28.4, Lemma 28.5, (28.5.1), Lemmas 28.6-28.7 with proofs), pp. 63-67"
   ]
  },
  {
   "id": "stacks-project-cohomology-of-schemes",
   "title": "The Stacks Project, Chapter 30: Cohomology of Schemes (tag 01X6)",
   "authors": "The Stacks Project Authors",
   "edition": "Chapter PDF, Stacks Project version ed88ff78 compiled on July 14, 2026, downloaded 2026-09-16 from the Stacks Project site (GNU Free Documentation License); not in the supplied library, which holds only other Stacks chapters. Page numbers are chapter-internal. 80 pages. Independently re-fetched from the URL above on 2026-09-24 by independent review REVIEW-EXT-13-EXT-07B; the SHA-256 of the fetched file is identical to the value recorded here.",
   "url": "https://stacks.math.columbia.edu/download/coherent.pdf",
   "sha256": "b4980a08a8cce98fed6a420364b18c119364a9436577031b28a16863bcbdbfb8",
   "readSections": [
    "Section 2 (Lemmas 2.2 and 2.6 with proofs), pp. 2-3",
    "Lemma 4.2 statement and first proof, pp. 6-7",
    "Section 5 (Lemma 5.2, flat base change, with proof), pp. 10-11",
    "Lemma 7.1 with proof, pp. 12-13",
    "Lemma 17.1 statement, pp. 43-44",
    "Proposition 19.1 with proof and Lemma 19.2, pp. 49-50"
   ]
  },
  {
   "id": "stacks-project-derived-categories-of-schemes",
   "title": "The Stacks Project, Chapter 36: Derived Categories of Schemes (tag 08CU)",
   "authors": "The Stacks Project Authors",
   "edition": "Chapter PDF, Stacks Project version ed88ff78 compiled on July 14, 2026, downloaded 2026-09-16 from the Stacks Project site (GNU Free Documentation License); not in the supplied library, which holds only other Stacks chapters. Page numbers are chapter-internal. 109 pages. Independently re-fetched from the URL above on 2026-09-24 by independent review REVIEW-EXT-13-EXT-07B; the SHA-256 of the fetched file is identical to the value recorded here.",
   "url": "https://stacks.math.columbia.edu/download/perfect.pdf",
   "sha256": "f79e0ebb628734948a51efd20b75d75c8e5341e4ab493e54f7fc710ebf72fb02",
   "readSections": [
    "Lemmas 30.4-30.7 (statements; proofs of 30.4 and 30.6), pp. 74-75",
    "Section 32 (Lemmas 32.1-32.6 with proofs, Lemma 32.7 statement), pp. 78-80"
   ]
  },
  {
   "id": "milne-2008-abelian-varieties-v2",
   "title": "Abelian Varieties (v2.00)",
   "authors": "J. S. Milne",
   "edition": "Course notes, version 2.0, March 16, 2008, 172 pages (Part III: Jacobian Varieties); author copy from the author's page; not in the supplied library (Mumford's Abelian Varieties is catalogued as requested). Printed page numbers. Independently re-fetched from the URL above on 2026-09-24 by independent review REVIEW-EXT-13-EXT-07B; the SHA-256 of the fetched file is identical to the value recorded here.",
   "url": "https://www.jmilne.org/math/CourseNotes/AV.pdf",
   "sha256": "f5ca4e63e5092a4b102daad1470e4cbed5fe8f82115e3a28c8881e3f67f6aaef",
   "readSections": [
    "Conventions (varieties over k), p. v",
    "I.1 (group varieties, Theorem 1.1, Corollaries 1.2-1.5 with proofs), pp. 7-10",
    "I.3 (Theorems 3.1-3.2, Lemma 3.3, Theorem 3.4, Lemmas 3.5-3.6, Corollary 3.7, Theorem 3.8, Propositions 3.9-3.10 with proofs), pp. 15-20",
    "I.4 (Theorems 4.1-4.2 with cited proofs), pp. 20-21",
    "I.5 (Theorem 5.1 statement, Corollaries 5.2-5.4, Theorem 5.5 with proofs, Remarks 5.6-5.7, 5.8-5.15), pp. 21-26",
    "I.7 (Proposition 7.1, Theorem 7.2 with proofs, Remarks 7.3-7.4), pp. 32-34",
    "I.8 (Proposition 8.4, Remarks 8.5-8.7, Lemma 8.8, Theorem 8.9, Proposition 8.14 and the characteristic-zero construction sketch), pp. 34-40",
    "I.11 (definition of polarization, Theorem 11.1), pp. 53-54",
    "III.1 (overview, Theorem 1.2, Proposition 1.3, Remark 1.4, Lemma 1.5, Theorems 1.6-1.7, Lemma 1.8, Remarks 1.10-1.12, Propositions 1.13-1.14 with proofs), pp. 85-91",
    "III.2 (Propositions 2.1-2.3, Lemma 2.4 with proofs, Theorem 2.5), pp. 91-93",
    "III.3 (Propositions 3.1-3.2, Definition 3.4, Lemma 3.5, Remark 3.6, Propositions 3.7-3.8, Corollary 3.9, Propositions 3.10-3.11, Example 3.12, Theorem 3.13 with proofs, Exercise 3.14, Remark 3.15), pp. 94-98",
    "III.4 (Lemma 4.1, Proposition 4.2, Corollary 4.3, proof of Theorem 1.6), pp. 98-101",
    "III.5 (Theorem 5.1, Lemma 5.2, Proposition 5.3, Lemma 5.4, Corollary 5.5 with proofs, Remark 5.6), pp. 101-103",
    "III.6 (Proposition 6.1, Corollaries 6.2-6.3, Proposition 6.4 with proofs, Remark 6.5, Theorem 6.6, Lemmas 6.7-6.9 with proofs, Remark 6.10, Summary 6.11, Exercise 6.12), pp. 104-108",
    "Read by the independent reviewer (2026-09-24), in addition: I.5 Theorem 5.16, Corollaries 5.17-5.18, Proposition 5.19, Lemma 5.20 and the partial proof of the theorem of the cube, pp. 26-27; I.6 Propositions 6.1, 6.3, Theorem 6.4 with proof, Example 6.5, Proposition 6.6 with proof, pp. 28-31; formulas of I 5.4, I 7.4 and III 6.6-6.11 checked on page images"
   ]
  },
  {
   "id": "kleiman-2005-the-picard-scheme",
   "title": "The Picard scheme",
   "authors": "Steven L. Kleiman",
   "edition": "arXiv:math/0504020v1 (1 April 2005), 83 pages; published in Fundamental Algebraic Geometry: Grothendieck's FGA Explained, Mathematical Surveys and Monographs 123, AMS 2005; not in the supplied library. Printed page numbers of the arXiv version. Independently re-fetched on 2026-09-24 by independent review REVIEW-EXT-13-EXT-07B as https://arxiv.org/pdf/math/0504020v1; the SHA-256 of the fetched file is identical to the value recorded here.",
   "url": "https://arxiv.org/abs/math/0504020",
   "sha256": "cc14e62f0ebebb8617777651bbcd08bb7548cb9fe955f3a25bb6491c5f3beeaa",
   "readSections": [
    "Section 2 (Definition 2.2, Exercises 2.3-2.4, Theorem 2.5 with both proofs, Exercise 2.6, Lemma 2.7, Definition 2.8, Lemmas 2.9-2.10 with proofs, Remark 2.11), pp. 16-21",
    "Section 4 (Exercises 4.4 and 4.7, Theorem 4.8 statement and opening of proof), pp. 27-28",
    "Section 5 (Proposition 5.3, Theorem 5.4 with proof opening, Proposition 5.10 with proof, Theorem 5.11 with proof to (5.11.2), Corollaries 5.13-5.14 with proofs, Remark 5.15, Propositions 5.19 with proof and 5.20 statement), pp. 37-48",
    "Read by the independent reviewer (2026-09-24), in addition: Lemma 5.1 with proof, pp. 36-37; the complete proof of Theorem 5.4, p. 38; the complete proof of Theorem 5.11, pp. 42-44; Proposition 5.20 with proof, pp. 47-48"
   ]
  },
  {
   "id": "silverman-arithmetic-of-elliptic-curves-2009",
   "title": "The Arithmetic of Elliptic Curves",
   "authors": "Joseph H. Silverman",
   "edition": "Second edition, Graduate Texts in Mathematics 106, Springer 2009 (DOI 10.1007/978-0-387-09494-6). Copy inspected: the supplied library copy (catalogue record WEIL-PRIVATE-SILVERMAN2009, a user-supplied private copy; not redistributed). Printed page numbers; same source id as in this job's Heights and Neron-model packets. Not re-checked by independent review REVIEW-EXT-13-EXT-07B (2026-09-24): there is no public copy and the library copy was not available to the reviewer, so the hash and the cited passage could not be verified.",
   "url": "https://doi.org/10.1007/978-0-387-09494-6",
   "sha256": "72ee67bfa1e3fdf582ac7e4b032d7ca0b35a168ed6443ac39c121fbb788cab25",
   "readSections": [
    "III.3, Proposition 3.4 with proof, pp. 61-63"
   ]
  }
 ],
 "other": {}
}
```

</details>

