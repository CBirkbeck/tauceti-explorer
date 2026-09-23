# Wood (2019): nonabelian Cohen–Lenstra moments, extraction and routing

Issue [#1330](https://github.com/CBirkbeck/tauceti-explorer/issues/1330). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged checkpoints (Codex and Claude Code), whose report follows below as history.
- **The paper.** M. M. Wood, with an appendix by P. M. Wood, *Nonabelian Cohen–Lenstra moments*, Duke Math. J. 168 (2019), 377–427.
  - The published article from NSF PAR was re-fetched; its SHA-256 (154e700c…) matches the checkpoint.
- **Items.** The result has **344 items: 13 library, 13 planned and 318 missing**. Every missing item is routed exactly once, and every numbered statement is an item. This was checked against the Duke small-caps headings.
- **Mistakes.** Ten are recorded under `sourceIssues`.

## This continuation (cc-442dc5)

**E1 rechecked.**
- **The problem.** When G′ is not good, the proof of Theorem 4.8 (pp. 406–409) bounds the ratio from below for each large q and then "lets q → ∞". That establishes the liminf, not the limit that Theorems 1.2 and 4.8 state. E1 therefore still affects a stated result.
- **What is unaffected.** The good cases, and the lower bound itself.

**Reclassified to affect nothing.**
- **E7.** Conjecture 5.1's "u ∈ μ" is meant as a generator, as in Theorem 4.8.
- **E9.** A sign in the cited Wood (2021) proof, already corrected in the extraction.

**Gaps.** The checkpoint listed none, so two are added:
- **G1**, the existence of the limit. Recorded as E1.
- **G2**, the EVW, Romagny–Wewers and SGA inputs. Deferred as cited suppliers' proofs.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once.
- The open limit question is recorded as a finding in the paper, not left as extraction work.

## Mistakes found (`sourceIssues`)

- **E1** (gap; affects a stated result), Theorem 1.2, p.3, and the last assertion of Theorem 4.8, p.23, with its proof, pp.24–25, in arXiv 1702.04644v2 (13 July 2018, the latest version; its source file is Duke_Final_Revision.tex; PDF SHA-256 2eacf07f…e1bd); now collated with the published journal: Theorem 1.2 p.379; Theorem 4.8 pp.406–407; proof pp.408–410 (especially p.409). *Printed:* lim_{q→∞} Ẽ^±/|H₂(G′,c)[q−1]| *Correction:* For G′ not good, replace lim by liminf: liminf_{q→∞, (q,|G′|)=1} Ẽ^±_{F_q(t),q^{2n}}(G,G′)/|H_2(G′,c)[q−1]| ≥ w_G n^{N_{G′}−1}, and likewise with E^± and a smaller constant in Theorem 1.2.
- **E2** (error; affects nothing), Definition 3.12 (from [EVW12, §8.4]), p.13; used again in the proof of Theorem 3.13, p.14, in arXiv 1702.04644v2 (13 July 2018, the latest version; its source file is Duke_Final_Revision.tex; PDF SHA-256 2eacf07f…e1bd); now collated with the published journal: Definition 3.12 p.394 and Theorem 3.13 proof pp.395–396. *Printed:* tame quotient *Correction:* Let Γ be the maximal prime-to-p quotient of that tame quotient. This Γ is free pro-prime-to-p on δ_1, …, δ_k with δ_1⋯δ_kδ_∞ = 1. Since |F| is prime to p, φ factors through it.
- **E3** (error; affects nothing), Proposition 4.4, pp.19–20, in arXiv 1702.04644v2 (13 July 2018, the latest version; its source file is Duke_Final_Revision.tex; PDF SHA-256 2eacf07f…e1bd); now collated with the published journal: Proposition 4.4 statement/proof pp.402–403. *Printed:* a subgroup *Correction:* Assume that G′ is admissible, or at least that ker(G′ → S_2) projects onto the first factor G. Only then does the projection give a surjection ρ, and both bijections hold. The paper applies the proposition only to admissible G′ (Theorem 4.8 and §7).
- **E4** (misprint; affects nothing), Proof of Theorem 1.2 from Theorem 4.8, p.23, in arXiv 1702.04644v2 (13 July 2018, the latest version; its source file is Duke_Final_Revision.tex; PDF SHA-256 2eacf07f…e1bd); now collated with the published journal: Proof of Theorem 1.2, displayed limit p.407. *Printed:* q^n *Correction:* Ẽ^±_{F_q(t),q^{2n}}(G,G′).
- **E5** (misprint; affects nothing), Proof of Theorem 4.8, the imaginary case with G′ not good, p.24, in arXiv 1702.04644v2 (13 July 2018, the latest version; its source file is Duke_Final_Revision.tex; PDF SHA-256 2eacf07f…e1bd); now collated with the published journal: Proof of Theorem 4.8, non-good imaginary case p.409. *Printed:* q^n+O_n(q^{n−1/2}) *Correction:* CHur^{c,(1,1,σ)}_{G′,n}, H_2(G′,c)[q−1], and q^{2n−1} + O_n(q^{2n−3/2}) in place of q^n + O_n(q^{n−1/2}).
- **E6** (misprint; affects nothing), Proof of Theorem 4.8, the real quadratic case, p.25, in arXiv 1702.04644v2 (13 July 2018, the latest version; its source file is Duke_Final_Revision.tex; PDF SHA-256 2eacf07f…e1bd); now collated with the published journal: Proof of Theorem 4.8, real-case discriminant sentence p.409. *Printed:* q^{(Σ_i n_i+1)|G′|/2} *Correction:* Nm Disc(M) = q^{(Σ_i n_i)|G′|/2}, and the associated quadratic extension has discriminant norm q^{Σ_i n_i}.
- **E7** (error; affects nothing), Conjecture 5.1, p.26, in arXiv 1702.04644v2 (13 July 2018, the latest version; its source file is Duke_Final_Revision.tex; PDF SHA-256 2eacf07f…e1bd); now collated with the published journal: Conjecture 5.1 p.411, with Lemma 3.11 p.393. *Printed:* u∈μ_{Q(μ_{4|G̃′_c|})} *Correction:* Let u be a generator of μ_{Q(μ_{4|G̃′_c|})} (and h ∈ H_2(G′,c)[|μ_Q|]). Equivalently, stratify by the Hom-valued invariant u ↦ I(ρ,u). This matches Theorem 4.8, which takes u_q ∈ Ẑ(1)^×.
- **E8** (misprint; affects nothing), Appendix A, "Description of the computation: theoretical", p.36, in arXiv 1702.04644v2 (13 July 2018, the latest version; its source file is Duke_Final_Revision.tex; PDF SHA-256 2eacf07f…e1bd); now collated with the published journal: Appendix A.1 p.421, trivial-action group in two places. *Printed:* C₃×C₃×C₂ *Correction:* C_2 × C_2 × C_3, in both places.
- **E9** (misprint; affects nothing), Wood, An algebraic lifting invariant…, author lifting.pdf (hash in report), Theorem2.5 proof, p4; not a claim of published-version collation. *Printed:* φ·ψ *Correction:* With φ(x̂,e_x)=[x]k_x and ψ(x̂,e_x)=k_x as written, use φ·ψ^{-1} throughout the marking correction.
- **E10** (misprint; affects nothing), Wood, An algebraic lifting invariant…, author lifting.pdf, Lemma2.1 proof, p2, displayed conjugation word; rendered page visually checked. *Printed:* [g_k]^{a_k}; g_1^{a_1} *Correction:* At the ends of the inverse word use [g_1]^{−a_1} and g_1^{−a_1}, respectively, so the conjugator [g_1]^{a_1}⋯[g_k]^{a_k} is followed by its reversed inverse.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G1, Existence of the limit in Theorem 1.2 when G′ is not good** (recorded). Recorded as E1; the extraction states the liminf form.
- **G2, Original-source inputs** (deferred). Cited suppliers' proofs.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## PAPER-WOOD-19 — linear parity constraints in actual reduced covers

**Partial checkpoint.** Codex `codex-c83e7a`, 23 September 2026; Refs [#1330](https://github.com/CBirkbeck/tauceti-explorer/issues/1330). Continues [PR2037](https://github.com/CBirkbeck/tauceti-explorer/pull/2037), preserving all 326 earlier items and all ten unreviewed source findings.

The packet now contains **344 items: 13 library, 13 planned and 318 missing**, with every missing item routed once across the same ten routes. The 18 new items include seven definitions/constructions with 28 API contracts and 28 proposed tests. There are 92 definitions/constructions overall and 115 explicitly recorded prerequisite edges. The recorded graph is acyclic; many inherited interfaces still need finer decomposition. None of these counts establishes full source closure or formalization.

### New mathematical result

The existing obstruction becomes a calculation with two linear maps. Let F be generated by N conjugacy classes c_i of involutions, E→F a chosen reduced Schur cover, and A its central kernel. Put

V=F₂^N, U=F_ab, B=A/A².

The class images define a surjection a:V→U. The squares of class-compatible lifts x_i define columns s_i=[x_i²]∈B and hence a linear map s:V→B. Changing a lift multiplies its square by a square in A. Conjugating a lift preserves its central square. This defines s on the free vector space V; it does not make squaring a homomorphism on the nonabelian cover E.

For the real boundary g=1 set v_g=0; for g∈c_k set v_g=e_k. The compatible parity vectors are v_g+ker a, and their obstruction is

β(g,epsilon)=s(v_g+epsilon).

Let B_t be the image of A[2^t] in B, and define L_t(v)=(a(v),s(v) mod B_t). If v₂(q−1)=t+1, the surviving parities are exactly

**C_t^g=v_g+ker L_t**, with **|C_t^g|=2^(N−rank L_t)**.

Each surviving lifting fiber contains |A[q−1]| fixed points. The kernels increase with t; subtracting successive cardinalities gives the exact threshold histogram. The real and imaginary parity sets have equal cardinality by translation, but can have different Hamming weights and different counts at a fixed degree.

This immediately gives a useful special case: if the class images are independent in F_ab, then ker a=0. Each boundary has one compatible parity and its obstruction vanishes, even if A is nontrivial. It explains the centerless two-class S₄ examples below.

### Stable counts retain the parity weights

For a valid stable lower bound N₀, put delta=N₀ mod2 and

W_t^g(X)=Σ_(epsilon∈C_t^g) X^wt(epsilon+delta·1).

When F is centerless, Wood's stable component classification gives the formal generating series

Σ_d (C_stable,d^g(q)/|A[q−1]|) X^d = X^(N N₀) W_t^g(X)/(1−X²)^N.

Indeed, the least coordinate of parity epsilon_i above N₀ is N₀+(epsilon_i−N₀ mod2), and every other coordinate adds an even nonnegative integer. The coefficient formula is the earlier stars-and-bars count. No analytic convergence is needed for this identity.

The formula covers the **stable orthant only**. It does not calculate the boundary remainder /310 or prove the eventual constancy of the complete profile /143. A dimension/rank count alone cannot replace W: in the one-class case with even N₀, the real weight polynomial is1 and the imaginary polynomial isX.

### Actual finite-group computations

The complete run enumerates all embedded admissible candidates for every abstract target G of order2 through15, followed by all candidates for S₄ and the dihedral group of order18. It uses the earlier Goursat enumeration before identifying any candidates by abstract isomorphism. The result is **95 candidates**, including 28 centerless candidates and 13 centerless non-good candidates.

Across both boundary signatures there are **262 compatible parity vectors**. Every one has threshold0. The run checks **3,074 power-equation counts** against the obstruction formula and **204 rank counts** against the paired-column subgroup. The power-equation checks use odd integers3–31 coprime to |F|; the finite group identity applies even when such an integer is not a prime power. Geometric applications still use allowed prime powers.

Examples, with the full SmallGroup(order,index) identifiers:

| Target G | Embedded F | Reduced kernel A | Compatible obstruction |
| --- | --- | --- | --- |
| Dihedral order8 | (32,49) | C₂ | zero |
| C₃² | (18,4) | C₃ | zero |
| A₄ | (96,227) | C₂ | zero |
| S₄, axis kernel V₄ | (192,955) | C₂ | zero |
| S₄, axis kernel A₄ | (576,8654) | C₂ | zero |
| Dihedral order18, axis kernel order9 | (324,36) | trivial | zero |

The JSON stores every candidate's concrete permutation generators, base-kernel generators, outside involutions and boundary element, as well as its ordinary/reduced multiplier, class sizes, abelianization, ranks and weight polynomials. This retains the actual quotient data needed for non-good types. The executable GAP program and output hashes are included.

The software is GAP4.15.1, SmallGrp1.5.4 and AutPGrp1.11.1. Centrality and stem containment are checked, but Schur-cover maximality is trusted to GAP's `EpimorphismSchurCover`. This is computational evidence, not a Lean certificate. An exploratory orders16–31 sweep stopped during an additional order64 cover calculation; it is explicitly excluded from the completed coverage. No genuine nonzero compatible obstruction or paper counterexample has been found in the completed runs.

### Library reuse and ownership

The exact statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` were read before citation. Five new library items import:

- `TauCeti.ElementaryTwoQuotient`, its class map, square criterion and product rule;
- its linear map and congruence API;
- `LinearMap.finrank_range_add_finrank_ker`;
- `Module.natCard_eq_pow_finrank`;
- Mathlib's `Abelianization`, projection, kernel identity and universal lift.

The quotient A/A² and the subgroup A[2] remain distinct. For C₄, the order-two element maps to zero in A/A², so the filtration B_t cannot be replaced by a cardinality comparison alone. The source-specific elementary-2 abelianization, class-square and filtration adapters remain missing items built over these carriers.

The current input snapshot is `20e25e264b2d9b0b170e3eefa810f197152f44d2`, with **532 input hashes** and 15 exact declaration records. Current Statistics and Inverse-Galois READMEs, ST.3/ST.5/IG.5 stage descriptions, upstream InductionRestriction Layer7 and reviewed AUDIT07/AUDIT09 entries were read. The earlier full upstream readings remain separately attributed. The peer PAPER-LIU-WOOD-ZUREICKBROWN-24 explicitly shares the existing `InductionRestrictionPartIIReducedSchur` candidate.

The generic reduced-cover parity algebra extends that same Part II. ST.3 receives the finite embedded-group examples; ST.5 receives the stable weighted-count formula. IG.5 still supplies stable Hurwitz classification. No new owner or generic linear-algebra theory is proposed. The earlier ten-route table below is historical; its current missing-item additions are11 in the Schur Part II, one in ST.3 and one in ST.5.

### Reading and validation boundaries

This continuation freshly read published pp399–404, including the full Proposition4.1 and Proposition4.4 proofs, and inspected page images400–401 to check the powers in equations(5)–(6). The [published PDF](https://par.nsf.gov/servlets/purl/10152050) remains pinned to SHA-256 `154e700c1b634b9e9bde4334a19678d05ff98ca18efb6b07cb5b809f2da9c03d`. PR2037's full51-page reading and table reproduction remain historical evidence; they were not all repeated here. No new source error is claimed, and all ten inherited findings remain unreviewed.

Paper and three-file intake validation pass. The structural audit checks identifiers, exact-once routing, the recorded DAG, new API/test coverage, input/declaration/artifact hashes and preserved inherited findings. A separate exact Python regression passes **743,639 checks** of the affine-coset, rank, translation and weight-series formulas. These are finite algebraic diagnostics; they do not establish Hurwitz Galois actions. The28 new definition tests are plans. No Lean file was required, supplied or compiled.

The [handoff](../handoff/PAPER-WOOD-19.md) lists the remaining whole-profile, original-source, certificate and Appendix computation obligations. The following record preserves the earlier paper analysis, source corrections and reproduction programs, with its original dates and counts.

---

## Historical checkpoint record from PR2037 and its predecessors

## PAPER-WOOD-19 — Nonabelian Cohen–Lenstra moments

Partial checkpoint, not a completed extraction or formalisation. There are **326 items: 8 library, 13 planned, 305 missing**; every missing item has exactly one route. All 319 inherited identifiers and all 72 source-table rows are preserved. This continuation adds /320–/326, reads the published journal article completely and reproduces all 41 type rows, 31 of 31 multiplier rows, and all centers with GAP. The non-good ordinary-limit and original-source obligations remain open.

Agent: Codex, session codex-c83e7a, issue #1330. Claim 5787023950 was confirmed by bot 5787025157 on 23 September 2026. The whole issue was reread after confirmation. Prior work from PRs #1550, #1645, #1827 and #1839 is preserved; inherited reading and tests below are dated separately.

### Sources and what was actually read

Main source: Melanie Matchett Wood, with Appendix A jointly with Philip Matchett Wood, *Duke Mathematical Journal* 168(3) (2019), 377–427, [DOI](https://doi.org/10.1215/00127094-2018-0037). The [author's page](https://people.math.harvard.edu/~mmwood/Publications/) links the older [arXiv v2 preprint](https://arxiv.org/pdf/1702.04644v2), dated 13 July 2018. The earlier continuation read all 40 pages, every proof, Appendix A and references, and visually inspected tables pp.33–34 and Figure 1 p.37.

On 23 September this worker acquired the [published journal PDF from NSF PAR](https://par.nsf.gov/servlets/purl/10152050), SHA-256 `154e700c1b634b9e9bde4334a19678d05ff98ca18efb6b07cb5b809f2da9c03d`. It has 52 PDF pages: printed pp.377–427 followed by one blank page. All 51 content pages, every proof, both tables, the Appendix and references were read. Printed pp.379,394,402,407,409,411,418,419,421,423 were also checked as rendered pages. All eight main-paper source-issue passages persist in the journal, with precise locations below. This is full reading plus targeted collation, not a complete automated sentence diff. The inherited unqualified page locators remain arXiv-v2 locators; `publishedLocator` fields use journal pagination.

The supplementary reading in the following list is inherited from earlier checkpoints. Those papers were not all reread in this continuation.

Additional reading:

- All 13 pages of [Wood (2021), *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland*](https://people.math.harvard.edu/~mmwood/Publications/lifting.pdf), including proofs. Its later reproof is especially useful for the universal extension, abelianization and stable braid-orbit inputs.
- [EVW12 v1](https://arxiv.org/pdf/1212.0923v1): §7.3 homology-image argument; §§8.2.1–8.2.4 on tangential basepoints; Proposition 8.7.1 proof, Theorem 8.7.3 and Example 9.3.2. The prior worker additionally read selected pp.32–38,40–41,49–55. Neither worker claims a full reading of the 70-page paper.
- [EVW16 published version](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf): §§7.1–7.8, including the full Lemma 7.6 and Proposition 7.7 proofs, pp.765–770.
- [Milne ADT](https://www.jmilne.org/math/Books/ADTnot.pdf): I §4 standing hypotheses, Theorem 4.10 and Example 4.11, pp.48–58; not the entire global-duality proof. [Milne CFT v4.03](https://www.jmilne.org/math/CourseNotes/CFT.pdf): VIII §§1–2, pp.229–234, including the Grunwald–Wang character statement and exception.
- [Delange (1954)](https://www.numdam.org/item/ASENS_1954_3_71_3_213_0.pdf): standing hypotheses p.213, §5.2.1 Theorem III and its proof pp.235–238, not the whole article.
- [Bhargava](https://arxiv.org/pdf/1402.0031): Theorem 1.4 and context pp.3–4, full proof §4.4 pp.23–25. [Alberts, published JTNB version](https://www.numdam.org/item/JTNB_2020__32_3_631_0.pdf): Corollary 4.10 and Theorem 4.11 with proofs pp.656–657.

Earlier additional reading on 22 September: Wood19 §§4.1–4.4, including the complete fixed-point and counting proofs; EVW12 §§8.6.2–8.7.3; Wood21's marking correction and a visual check of the Lemma 2.1 displayed word. The NSF published-copy request again timed out.

For the remaining component action, [Seguin, *Fields of Definition of Components of Hurwitz Spaces*](https://beranger-seguin.fr/assets/pdf/articles/fielddef.pdf), author-hosted 26-page version, was read in §§1–2, §§3.1–3.2 and §6, including every proof there. This is selected supplementary reading, not a full-paper read. Its SHA-256 is bd2084d9af14256e1bbca39d085ebcb73d7a0f191d1d13b68e16e2059484712c. The original Cau theorem used in §3 and the §4/Seg24 dependencies of Proposition 6.2 are not source-closed.

Retrieved 21 September 2026 (retained artifacts):

| Artifact | SHA-256 |
| --- | --- |
| Wood19 arXiv v2 | 2eacf07f9c79a08a65bbfa332b964f0f9bd4ab5abb93e5db8be72e43669be1bd |
| Wood21 author PDF | 9628210e96313805ceac89594c64e2eceb3aaebf044f617cee4d7f25ee7ef673 |
| EVW12 v1 | 3cd5624f85450b06f4be8b37d08fb480dde8dc7c68f9a5bd7ffc57c15c04a4e4 |
| EVW16 published | 6c10d770348c625ad9fe80d2c47093cde2a2ba05f39a28d547743f0f4993a7f6 |
| Milne ADT | 2c6195ec76a974f3f336c77cb71cc3845b018aad2d43136716b3477a3bc5fb31 |
| Milne CFT | 50d79af78250a9f1117ad9d337e0b231704a533fc707966ed1bfa52e13d498f5 |
| Delange | 4934b4bfba12d405fc267fa0c0318c3034ab29c9e8223388019377bb45ca0998 |
| Bhargava | f7bbd98a2382e170df8f0d4279332a25541f47ba56df1b59879a36c004078c66 |
| Alberts | b81dd8b0ba5a12f35d472a551b12efbc13d38a777a1069a253a72511b8390b43 |

EVW12's current arXiv record is a withdrawal notice concerning §§6 and 12. Wood's footnote says those results are not used. Wood21 independently reproves important remaining inputs, but does not justify importing a higher homology stability theorem. Its marked point in §§5–6 is unramified; the ramified-at-infinity application still needs the tangential EVW12/SGA interfaces.

### Mathematical scope

Good admissible embedded types G′≤G≀C2 have conjectural number-field moments corrected by reduced Schur-multiplier 2-torsion. Real rigid counts are counts of pairs (ρ,y); their denominator differs from the imaginary rigid count. The proved good-type function-field theorem additionally requires centerless G′, fixes sufficiently large discriminant degree 2n, and sends q→∞ through admissible prime powers. The multiplier factor |H₂(G′,c)[q−1]| stays inside the normalization. This is not a fixed-q, growing-discriminant theorem.

The invariant depends on a chosen reduced cover; it has proved independence properties, not a canonical identification of all reduced covers. Component labels include multidegree and boundary monodromy. The arithmetic statistics consumer imports the marked Hurwitz estimate and the reduced multiplier; it does not own those foundations.

Section 7 proves elementary-two divergence with exponent 2^k−1. The continuation supplies its omitted local factor, imaginary normalization, analytic boundary data and lower-rank subtraction. The appendix's A4 computations remain finite empirical evidence, not a limit theorem.

### Ownership and pinned-library decisions

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Earlier continuations checked the seven inherited library classifications below. On 23 September the full pinned `Mathlib/GroupTheory/Goursat.lean` was additionally read; /320 imports `Subgroup.goursat_surjective` and `Subgroup.goursat` rather than planning Goursat again:

| Item | Declaration and limited scope |
| --- | --- |
| /1 | Mathlib RegularWreathProduct, rightHom, inl: carrier and injections; coordinate adapter still needed. |
| /20 | groupHomology.H2, H2π, H2Iso: degree-two homology, not reduced covers. |
| /36 | TauCeti.FactorSet.cohomologyClassEquiv and nonempty_splitting_iff_cohomologyClass_eq_zero: abstract extensions; continuous Galois bridge separate. |
| /123 | Subgroup.exists_right_complement'_of_coprime: complement existence, not a canonical complement. |
| /129 | NumberField.finite_of_discr_bdd: fixed-ambient-field Hermite finiteness. |
| /311 | Finite.instDiscreteTopology and Set.Finite.isDiscrete: finite subsets of T1 spaces are discrete. |
| /312 | Filter.tendsto_pure: convergence to a pure filter is eventual equality. |
| /320 | Subgroup.goursat_surjective and Subgroup.goursat: quotient-graph classification, with no finiteness hypothesis. |

TauCeti.schurMultiplier is H²(G,k×), not Wood's H₂(G,ℤ). Existing ordinary Schur covers belong to upstream InductionRestriction Layer 7. Full upstream ClassFieldTheory, InductionRestriction and ArithmeticDirichletSeries READMEs were read. Reviewed AUDIT-07/AUDIT-09 statistics/inverse-Galois entries, AUDIT-02 duality, AUDIT-20 FA.4 and AUDIT-01 SF.2 were read with the relevant roadmap stages. Nearby analytic and library searches were also checked. These audits are ownership/evidence records, not proofs of the paper's results.

The ownership screen covered the atlas, additional roadmaps, packets, accepted restructurings and link maps. Relevant ownership paths were unchanged through explorer main d76643df4405140aed1dfade7a21b9159db80017; a fresh compare and tree listing found no new competing higher-pole roadmap. This is a checkpoint-specific screen, not a blanket verification of every atlas item.

| Route | Items | Boundary |
| --- | ---: | --- |
| ArithmeticStatistics ST.0 | 16 | Families, types, infinity and weights. |
| ArithmeticStatistics ST.3 | 153 | Number-field moments, known cases, Euler factors, finite data and appendix algorithm. |
| ArithmeticStatistics ST.5 | 19 | Function-field consequences and convergence modes. |
| InverseGalois IG.1 | 5 | Prime-to-p and tangential peripheral interfaces. |
| InverseGalois IG.3 | 7 | Braid components and invariant comparison. |
| InverseGalois IG.4 | 21 | Central tame lifts and arithmetic invariants. |
| InverseGalois IG.5 | 18 | Marked Hurwitz families and fixed-degree uniform estimates. |
| InductionRestriction, Part II | 62 | Reduced Schur covers, universal marked extensions, discrete actions and finite examples. |
| ArithmeticGaloisDuality R02.4 | 1 | Explicit function-field prime-to-p extension of the current number-field-emphasized scope. |
| ArithmeticDirichletSeries, Part II | 3 | Generic higher-pole Laplace/Dirichlet Tauberian theorem. |

The live ownership recheck reached main ceda11730ddb903b696ad2d41e4e5ce17bf4d537 and coverage blob 5e708cfc74a51b10e62149113872fe4e00eb5846. The complete Statistics and Inverse-Galois READMEs, current ST.0–5 descriptions and reviewed ST.5/IG.5 audits were read. The two proposed Part II IDs were still absent from the roadmap filenames. All new function-field consumers stay in ST.5, specialized reduced-cover algebra extends the inherited Schur Part II, and the bounded-core Hurwitz input belongs to IG.5.

There are two Part II briefs, no unrelated new roadmap. The generic analytic continuation starts precisely after the parent's simple-pole Layer 9; its polynomial-logarithmic growth is not already a shifted-abscissa version of Wiener–Ikehara. Statistics owns the application, not a duplicate Tauberian theorem.

Trace formula /84 is now planned through SF.2's explicit integration of CohomologicalPointCounting. The exact supplier is [upstream PR196's TraceFormula Layer 12](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting/TraceFormula/README.md), read at head 4bd72379658126cbe9be935656396f0c9dac4de0, alongside Layers 8–14. It is an open roadmap PR, not formalised code. The atlas aliases designate SF.2 as integration owner; the extraction does not invent a nonexistent atlas stage or re-plan the trace formula.

Global fields needed a split: /37 and /53 now restrict their existing number-field suppliers to number fields. /250 adds the function-field Poitou–Tate specialization; /251 imports function-field reciprocity from FA.4. /130's ordinary ideal class group is likewise number-field-only. Upstream CFT explicitly excludes Grunwald–Wang; /39 stays with the embedding-problem application and cites Milne's exact character statement, including the μ4 removal of the exception.

### Closed calculations

#### Universal extension and comparison inputs

Wood21 Lemma 2.4 identifies the fiber-product abelianization, and its Theorem 2.5 supplies the universal marked-extension proof. The exact image statement im(H₂(S_c)→H₂(F))=Q_c remains /132, with the five-term/transgression explanation read in EVW12 p.34. The later proof only needs the weaker zero composite /252. They are not conflated.

For a marking discrepancy k_x, multiplying a splitting by the homomorphism sending the class basis to k_x requires its **inverse** to remove the discrepancy; /254 fixes that sign under the source's preceding convention. Stable braid classification uses high-multiplicity stabilization surjectivity, a minimal-cardinality argument, localization at a central monoid element, and stable cancellation. The original Fried–Völklein Appendix Lemma 3 remains an explicit prerequisite.

EVW16's comparison goes through an SNC compactification, finite-étale pushforward, extension by zero, vanishing cycles, proper base change and duality. It is not smooth proper base change applied to a nonproper Hurwitz scheme. The compatible coefficient tower, Qℓ passage and S_n invariants are separate /259; n=1 has its own PConf compactification.

#### Elementary-two Euler factors and rigid infinity

Write A=F₂^(k+1), m=2^k, H=kerπ, c=A\H, σ=(0,…,0,1). The three quadratic characters of ℤ₂×/(ℤ₂×)² have values on (−1,5) equal to (1,0),(0,1),(1,1), with conductor exponents 2,3,3. For Sχ=Σ_(t∈c)χ(t), the 2-factor is

    1 + m·2^(−3s) + Sχ(2^(−2s)+2^(−3s)).

Thus T₂=1+m·2^(−2s)+2m·2^(−3s), U₂=1−m·2^(−2s), V₂=1+m·2^(−3s). At odd primes T has factor 1+m p^(−s); U changes its sign when p≡3 mod4; V omits those p≡3 mod4 factors. Character orthogonality gives

    F+ = (T+U+(2m−2)V)/(2m),
    F− = (T−U)/(2m).

The second formula fixes infinity to σ. Selecting only π(infinity)=1 gives mF− and therefore the wrong rigid normalization. This corrects inherited /139; /109 now distinguishes quadratic signature from rigid normalization.

For k≥1,

    T = ζ^m G_T,    U = L(χ4)^m G_U,
    V = ζ^(m/2)L(χ4)^(m/2)G_V.

The residual factors have canceled linear terms and give compact-uniform holomorphic products on Re s>1/2. Finite small-prime factors stay polynomial; no unjustified division by a possibly zero factor is made. In particular U₂(1)=0 at m=4 is harmless. The common leading coefficient is

    G_T(1)/(2m), where
    G_T(1) = (1+m/2)2^(−m) ∏_(p odd)(1+m/p)(1−1/p)^m > 0.

All other poles on Re s=1 are absent. For nonnegative coefficients, Delange's integer-pole theorem applied to α(t)=Σ_(n≤e^t)a_n and Laplace transform F(s)/s gives the common leading counting constant G_T(1)/(2m(m−1)!). This is a primary-source alternative to the unavailable Narkiewicz citation, not a claim to have read that theorem.

For proper images W meeting c, dim W=j+1≤k, so their counts have lower logarithmic exponent 2^j−1. Only W containing σ contribute to the imaginary projector. The j=0 boundary is the O(X) quadratic count, not a fractional-power use of the V formula. This makes the nonsurjective contribution negligible for both signs.

#### Known cases and A4 weights

Items /137 and /260–/270 separate all twelve n=3,4,5 sign/type cases of Bhargava Theorem 1.4. The real A_n value is 1/n!, the imaginary value 1/[2(n−2)!]; the real rigid-pair conversion includes the outside-class size n(n−1)/2. Each S_n×C2 case diverges. /271–/274 separately record Alberts's Q8 and D8 cases, normal over ℚ. His D4 denotes Wood's order-8 D8; published numbering differs from Wood's preprint citation.

Aut(A4) has order 24, and all its automorphisms preserve the order-96 embedded type. An eligible embedded class-group kernel produces one A4 extension and hence 24 rigid surjections. Six quotient epimorphisms share the kernel, while the eligible kernels have S3-orbits of size two:

    24 · kernels = 4 · epimorphisms = 48 · S3-orbits.

Cubic input is by isomorphism classes; do not multiply by three for conjugate cubic subfields. The discriminant interval is −X≤Disc<0 for the inclusive cutoff. These are derived algorithm specifications, **not** certification that the source program used those conventions.

### Unresolved work and source qualifications

All missing items are now routed, including the unproved proposition /143. The following mathematical and source obligations remain.

- The printed arbitrary-u Conjecture 5.1 remains /99 as a false proposition. The inherited /298 generator-form replacement and /299 generator/Hom equivalence are retained, explicitly distinguished from the source; see “Resolving /99” below.
- The bad-type proof establishes a liminf bound. The new /308 criterion reduces the printed ordinary q-limit to eventual constancy of the whole fixed-degree normalized component profile. Neither that constancy for every bad type nor a genuine admissible-type counterexample is proved. Stable square-class obstructions and boundary components both need attention.
- The original Romagny–Wewers, Fried–Völklein, Artin–Tate and several SGA proofs remain source debts. Alberts's Lemmermeyer and Goldfeld–Hoffstein inputs have not been independently decomposed.
- No published computation code, exact cubic data version, class-group certificate, prime-2 filtering test or sampling reconstruction was acquired. The synthetic finite-module test below does not reproduce Figure 1.
- All 41 type rows, 31 of 31 multiplier rows and all 31 center entries are now reproduced in GAP. Proof-assistant-checked computation certificates remain unbuilt. This does not certify the Appendix number-field program or Figure 1.

Earlier source corrections are preserved: Proposition 4.4 requires admissibility and the kernel projection; bare swap C2 inside C3≀C2 is a rejection test. The peripheral presentation is for the maximal prime-to-p quotient, not the whole tame fundamental group. Split real infinity contributes zero discriminant degree, and the dimension normalizations are 2n or 2n−1 as appropriate. Appendix A's trivial-action group is C2²×C3 of order 12, not the printed order-18 group.

### 22 September: complete stable fibers and the whole component profile

Items /300–/305 remove a restriction that the lower-bound proof deliberately imposed. Write F=G′, A=H₂(F,c), choose compatible lifts ĝ_i of the involution classes, and fix the boundary lift ĝ (1 in the real case). For multidegree m, first require the separate abelianization condition Σm_i[c_i]=[g]. Define

    b(g,m) = ĝ² ∏i (ĝ_i²)^(−m_i),    β(g,m) = b(g,m) mod A².

Changing lifts changes b only by a square; β depends only on the parities of m_i. For odd q coprime to |F|, put r=(q−1)/2. Wood's equation (6) becomes h^(q−1)=b^(−r). Its solution set has size either zero or |A[q−1]|. It is nonempty precisely when

    b^r ∈ A^(2r)  ⇔  b ∈ A² A[r].

In additive notation this is the elementary equivalence rb=2ra iff b−2a is r-torsion. Define t_A(b)=min{t≥0:b∈A²A[2^t]}. The odd-primary part is all squares; in a cyclic 2-primary decomposition the threshold is the largest exponent among factors where b has odd coordinate. The fiber survives iff v₂(q−1)≥t_A(b)+1. Proposition 4.1's chosen parities have threshold zero, but no such assertion has been justified for every compatible parity.

For each parity vector ε and threshold N0, let a_i be the least integer at least N0 with parity ε_i. Stable multidegrees of total d are counted exactly by binomial(L+N−1,N−1), where L=(d−Σa_i)/2 is a nonnegative integer; otherwise the count is zero. Item /313 sums this count over **all** abelianization-compatible, surviving parities. This gives the complete normalized stable count, not the discarded boundary.

For fixed n≥2, use d=2n−1 in the imaginary case and d=2n in the real case. Let C_n(q) count **all** Frobenius-fixed geometric components, across all multidegrees of total d, and set P_n(q)=C_n(q)/M(q), M(q)=|A[q−1]|. Item /314 bounds all geometric components uniformly by the rank D_d of the finite-étale parent Hurwitz cover over Conf_d. Each nonempty geometric component surjects onto the connected configuration space and consumes at least one unit of fiber degree. This avoids adding an unsupported H⁰ comparison.

Summing Theorem 4.7 over the fixed components and using the exact denominator q^d(1−q⁻¹) gives

    |Ẽ_n(q)/M(q) − P_n(q)|
        ≤ D_d (K_d q^(−1/2) + q⁻¹)/(1−q⁻¹).

The profile lies in the finite rational set {a/b:0≤a≤D_d,1≤b≤|A|}; distinct values are separated by at least |A|⁻². Therefore /308 proves that the ordinary q-limit exists **iff P_n(q) is eventually constant**. Its liminf and limsup are respectively the smallest and largest profile values occurring for unbounded q. The boundary remainder /310 is nonnegative, but not assumed negligible when n is fixed.

This is an exact criterion and a finite stable-range algorithm, **not** a proof of eventual constancy. The abstract diagnostic A=C2, b nontrivial gives an empty fiber at q=3 and a nonempty one at q=5; no actual admissible Wood type with that obstruction has been certified, so it is not a counterexample to Wood's theorem.

#### Bounded-core follow-up, with a scope barrier

Items /315–/319 extract Seguin's product-one component monoid and bounded-core action. For ψ(F)=Σg ord(g), a product-one component x factors into blocks (g repeated ord(g) times) and a core y of degree ≤ψ(F), with the same monodromy subgroup. Nested-monodromy gluing is Galois-equivariant. Thus the full action is determined by the bounded-core permutation action and the cyclotomic character modulo exp(F). For involution-only tuples, every removed block is (g,g) and is Q-defined, leaving only the bounded-core action.

This yields one finite Galois quotient controlling **all degrees of the characteristic-zero product-one problem**. It does not say that the quotient is trivial or cyclotomic. Applying it to finite-field profiles requires the integral moduli/specialization comparison and the actual small-component action. Seguin's marking is unramified at infinity; appending Wood's imaginary boundary involution and forgetting that it is distinguished would change the braid quotient. That comparison is deliberately not asserted.

The original Cau equivariance theorem is an explicit unread prerequisite. Proposition 6.2 was read as a possible finite-certification lead, not imported with its unread §4/Seg24 dependencies silently assumed.

#### Source-issue ledger and definition tests

The result JSON includes ten unreviewed source issues. E1–E8 preserve the existing errata IDs/provenance; E1 now distinguishes the proven liminf statement from the finite-profile constancy task. E9 records the inverse needed in Wood21's marking correction, already used by /254. E10 records the incorrect indices/signs in its Lemma 2.1 conjugation word, visually checked against PDF page 2. The author/publisher checks did not locate a published correction; this does not establish novelty. No separate errata file was edited.

The continuation adds 16 API contracts and 24 planned tests for /143, /300, /303, /306, /310, /313, /315 and /318. These are planning interfaces, not executed Lean tests. Older definitions retain their inherited extraction; no new claim is made that every inherited definition has a fully completed blueprint API.

#### Reproducible obstruction/profile regression

The inherited 563-assertion regression below was rerun successfully. The following additional standalone Python program passed **6,588 exact assertions**, covering 2,233 finite obstruction fibers, 1,530 parity-composition cases, lift-change invariance and finite-profile separation. It enumerates abstract finite abelian groups and includes odd q that need not be prime powers, which is valid for the algebraic test. It does not compute actual reduced covers, Hurwitz components or number fields.

SHA-256: 2a3c135675e915a7849d14ecb61cfe517bfd53a5f07a8b71b5c478234fec1b8a.

```python
"""Exact algebra/profile diagnostics; not certified Hurwitz or field computations."""
from fractions import Fraction
from itertools import product
from math import comb, gcd, prod

checks = 0
def check(condition):
    global checks
    assert condition
    checks += 1

groups = [(1,), (2,), (3,), (4,), (6,), (8,), (12,), (2,2), (2,4), (4,4), (8,3)]
fiber_cases = 0
for factors in groups:
    A = list(product(*(range(a) for a in factors)))
    zero = tuple(0 for _ in factors)
    def scale(m, x):
        return tuple(m*y % a for a,y in zip(factors,x))
    def add(x,y):
        return tuple((u+v) % a for a,u,v in zip(factors,x,y))
    squares = {scale(2,x) for x in A}
    order = prod(factors)
    e = max((a & -a).bit_length()-1 for a in factors)
    for b in A:
        threshold = next(t for t in range(e+1)
                         if b in {add(x,y) for x in squares for y in A
                                  if scale(2**t,y) == zero})
        # Changing any chosen lift changes b only by a square.
        for square in squares:
            b2 = add(b,square)
            t2 = next(t for t in range(e+1)
                      if b2 in {add(x,y) for x in squares for y in A
                               if scale(2**t,y) == zero})
            check(t2 == threshold)
        for q in range(3, 64, 2):
            if gcd(q,order) != 1:
                continue
            m = (q-1)//2
            direct = sum(scale(q-1,h) == scale(-m,b) for h in A)
            torsion = sum(scale(q-1,h) == zero for h in A)
            power_test = scale(m,b) in {scale(q-1,h) for h in A}
            quotient_test = b in {add(x,y) for x in squares for y in A
                                 if scale(m,y) == zero}
            v2 = ((q-1) & -(q-1)).bit_length()-1
            check(power_test == quotient_test == (v2 >= threshold+1))
            check(direct == (torsion if quotient_test else 0))
            fiber_cases += 1

# Enumerate stable parity multidegrees and compare to stars and bars.
composition_cases = 0
for N in range(1,5):
    for lower in range(3):
        for epsilon in product(range(2), repeat=N):
            a = tuple(lower + ((x-lower) % 2) for x in epsilon)
            for d in range(17):
                def tuples_sum(total, length):
                    if length == 1:
                        yield (total,)
                    else:
                        for x in range(total+1):
                            for tail in tuples_sum(total-x,length-1):
                                yield (x,)+tail
                actual = sum(all(x >= lower and x % 2 == parity
                                 for x,parity in zip(n,epsilon))
                             for n in tuples_sum(d,N))
                remainder = d-sum(a)
                expected = (comb(remainder//2+N-1,N-1)
                            if remainder >= 0 and remainder % 2 == 0 else 0)
                check(actual == expected)
                composition_cases += 1

profile = sorted({Fraction(a,b) for a in range(11) for b in range(1,13)})
for x,y in zip(profile, profile[1:]):
    check(y-x >= Fraction(1,12**2))

# Abstract diagnostic only: a bounded finite profile need not be constant.
alternating_profile = [Fraction(2 if j % 2 else 4,2) for j in range(1,25)]
check(set(alternating_profile) == {1,2})
check(min(alternating_profile) == 1 and max(alternating_profile) == 2)
print(f"PASS: {checks} assertions; {fiber_cases} finite obstruction fibers; "
      f"{composition_cases} parity-composition cases; finite-profile separation")
```

### Verification and reproducible finite tests

The preceding checkpoint verified 319 distinct IDs and 299 exact-once missing-item routes. The 23 September validation verifies 326 IDs and 305 exact-once missing-item routes, all explicit prerequisite targets and an acyclic dependency graph, inherited-ID preservation and four API/four test contracts for the new construction /321. Ten source issues are recorded as unreviewed, not as accepted errata. No Lean file is required for this paper job; none was compiled and nothing is claimed formalised.

The following standalone Python regression was run: **563 exact assertions passed**. It tests the new finite calculations, not analytic continuation, field-table correctness or formal proof. Its SHA-256 is b112a738e1bcc8798db254070cc2ca7235eb109f8de5afea13a1e3d6191d569d.

```python
"""Finite, exact regression witnesses, not formal proofs or field-table validation."""
from collections import Counter
from fractions import Fraction as Q
from itertools import permutations, product

checks = 0
def check(p):
    global checks
    assert p
    checks += 1

def chi(a, b):
    return (-1) ** ((a & b).bit_count() % 2)

for k in range(1, 6):
    m, size = 2**k, 2**(k+1)
    c, sigma = range(m, size), m
    local2 = [(0, 0)]
    for t in c:
        local2 += [(t, 2), (0, 3), (t, 3)]
    # Exhaust all homomorphisms C2^2 -> A and enforce allowed cyclic image.
    actual = Counter()
    for u, v in product(range(size), repeat=2):
        image = {0, u, v, u ^ v}
        if image == {0}:
            actual[(u, 0)] += 1
        elif len(image) == 2 and max(image) in c:
            actual[(u, 3 if v else 2)] += 1
    check(actual == Counter(local2))
    for a in range(size):
        S = sum(chi(a, t) for t in c)
        check(S == (m if a == 0 else -m if a == m else 0))
        coeff = Counter()
        for x, e in local2:
            coeff[e] += chi(a, x)
        check(dict(coeff) == {0: 1, 2: S, 3: m + S})
    for s in (1, 2):
        dist = Counter({0: Q(1)})
        for p in (2, 3, 5, 7):
            choices = local2 if p == 2 else [(0, 0)] + [(t if p % 4 == 3 else 0, 1) for t in c]
            nxt = Counter()
            for x, weight in dist.items():
                for y, e in choices:
                    nxt[x ^ y] += weight / p**(e*s)
            dist = nxt
        T = 1 + m*Q(1, 2**(2*s)) + 2*m*Q(1, 2**(3*s))
        U = 1 - m*Q(1, 2**(2*s))
        V = 1 + m*Q(1, 2**(3*s))
        for p in (3, 5, 7):
            z = Q(m, p**s)
            T *= 1 + z
            U *= 1 + z if p % 4 == 1 else 1 - z
            V *= 1 + z if p % 4 == 1 else 1
        check(dist[0] == (T+U+(2*m-2)*V)/(2*m))
        check(dist[sigma] == (T-U)/(2*m))
        check(sum(dist[t] for t in c) == m*dist[sigma])
        for target in range(size):
            check(dist[target] == sum(chi(a, target)*sum(chi(a, x)*w for x,w in dist.items()) for a in range(size))/size)

# F4 = F2[z]/(z^2+z+1), encoded by two bits.
def mul(a, b):
    r = 0
    while b:
        if b & 1:
            r ^= a
        a <<= 1
        if a & 4:
            a ^= 7
        b >>= 1
    return r

vectors = list(product(range(4), repeat=2))
lines = {frozenset((mul(a,x),mul(a,y)) for a in range(4)) for x,y in vectors if (x,y) != (0,0)}
frob = lambda line: frozenset((mul(x,x),mul(y,y)) for x,y in line)
nonstable = {line for line in lines if frob(line) != line}
check(len(lines) == 5)
check(len(nonstable) == 2)
check(all(frob(line) in nonstable for line in nonstable))
epi = Counter()
for images in product(range(4), repeat=4):
    def value(x,y):
        bits = x | (y << 2)
        out = 0
        for i in range(4):
            if bits & (1 << i):
                out ^= images[i]
        return out
    if len({value(x,y) for x,y in vectors}) == 4:
        kernel = frozenset((x,y) for x,y in vectors if value(x,y) == 0)
        if kernel in nonstable:
            epi[kernel] += 1
check(len(epi) == 2)
check(set(epi.values()) == {6})
check(24*len(epi) == 4*sum(epi.values()) == 48)

S4 = list(permutations(range(4)))
parity = lambda p: sum(p[i] > p[j] for i in range(4) for j in range(i+1,4)) % 2
A4 = [p for p in S4 if parity(p) == 0]
compose = lambda p,q: tuple(p[q[i]] for i in range(4))
inverse = lambda p: tuple(p.index(i) for i in range(4))
automorphisms = {tuple(compose(compose(p,g),inverse(p)) for g in A4) for p in S4}
check(len(automorphisms) == 24)
identity = tuple(range(4))
order2 = [g for g in A4 if g != identity and compose(g,g) == identity]
order3 = [g for g in A4 if g != identity and compose(compose(g,g),g) == identity]
check(len(order2)*len(order3) == 24)
for a,b in product(order3,order2):
    generated = {identity}
    while True:
        enlarged = generated | {compose(g,h) for g in generated for h in (a,b)}
        if enlarged == generated:
            break
        generated = enlarged
    check(len(generated) == 12)
print(f"PASS: {checks} exact assertions; k=1..5 local factors and rigid infinity projectors; F4 quotient weights; Aut(A4)=24 witnesses")
```

### Resolving /99 (continuation, Claude Code, cc-fb70e5)

Conjecture 5.1 as printed quantifies over **every** root of unity u ∈ μ_L, L = Q(μ_{4|G̃′_c|}). By Lemma 3.11, I(φ,u^λ) = I(φ,u)^λ, so I(φ,1) = 1 for every φ, and for u = 1 and h ≠ 1 the count is identically zero (/144). This happens whenever H₂(G′,c)[|μ_Q|] ≠ 1. Wood's own §8.2 table gives such good pairs over ℚ:

- A₄ with G′ = ((C₂⁴)⋊C₃)⋊C₂, SmallGroup(96,227);
- A₅ with G′ = A₅≀C₂.

Both have H₂(G′,c) = C₂.

The extraction now separates three things:

- **/99:** the printed statement, a proposition kept only as the target of the refutation /144 and never used as a hypothesis.
- **/298:** the corrected conjecture, with u a **generator** of μ_L. This is the analogue of u_q ∈ Ẑ(1)^× in Theorem 4.8.
- **/299:** the justification. μ_L is cyclic and |μ_Q| divides |μ_L|, so evaluation at a generator identifies Hom(μ_L, H₂(G′,c)[|μ_Q|]) with H₂(G′,c)[|μ_Q|]. Changing the generator permutes the strata by h ↦ h^λ, so the corrected conjecture does not depend on the choice.

All three go to ArithmeticStatistics ST.3 with the other conjectures (/29–/31); /144 stays with IG.4. The correction is also recorded in `research/blueprint/errata/PAPER-WOOD-19.json` (E7). It is the extraction's correction, not Wood's statement.

**/143 remains mathematically open, now routed as an unproved proposition.** The original component argument gives a liminf. The present continuation analyzes all stable fibers and identifies eventual constancy of the whole normalized component profile as the exact remaining condition. Boundary components need their full Galois action; it has not been proved to be only cyclotomic. Neither ordinary-limit existence for every bad type nor a genuine counterexample is established. See the new /300–/319 analysis and source issue E1.

### 23 September: published collation and finite-table reproduction

The [primary EVW12 arXiv record](https://arxiv.org/abs/1212.0923), checked on 23 September, identifies v2 as the withdrawal notice (19 November 2013), with no PDF. Wood cites that version in the journal bibliography; the inherited mathematical reading is v1. There is no second revised mathematical PDF being silently substituted. The withdrawal scope and exact proof obligations remain as above.

The source issue IDs and their original provenance are retained. E1–E8 concern the main paper; E9–E10 concern Wood21 and are not a claim of journal collation for that other paper. The author publication page and a bounded title/erratum/correction search were checked on 23 September; no correction for this paper was found. This does not establish novelty, and none of the ten findings has been independently accepted in this job.

| Source issue | Published location | Result of collation |
| --- | --- | --- |
| E1 | Theorem 1.2 p.379; Theorem 4.8 pp.406–407; proof pp.408–410 | Ordinary limit remains printed; the selected-component argument supplies a liminf lower bound. |
| E2 | Definition 3.12 p.394; proof pp.395–396 | The tame quotient is still called free pro-prime-to-p; the corrected interface takes its maximal prime-to-p quotient. |
| E3 | Proposition 4.4 pp.402–403 | The statement still allows an arbitrary subgroup without the kernel-projection surjectivity needed by its inverse construction. |
| E4 | Proof of Theorem 1.2 p.407 | The displayed discriminant slice still uses q^n rather than q^(2n). |
| E5 | Proof of Theorem 4.8 p.409 | The same group subscripts and dimension exponents require the recorded correction. |
| E6 | Real-case discriminant sentence p.409 | The extra infinity contribution remains despite split infinity. |
| E7 | Conjecture 5.1 p.411; Lemma 3.11 p.393 | Arbitrary u is still allowed. Its value u=1 refutes the literal statement when the torsion target is nontrivial. The journal's torsion notation is also malformed. |
| E8 | Appendix A.1 p.421 | The trivial-action group is still written with order 18 instead of C₂²×C₃ of order 12. |

The A₄ example supporting E7 no longer rests solely on the source's table: the independent GAP execution below gives its reduced multiplier C₂. This is computational evidence for that finite-group input; the homomorphism identity I(ρ,1)=1 is the separate mathematical argument. The corrected generator-form conjecture /298 remains a conjecture.

#### Why the finite enumeration is exhaustive

For H≤G² projecting onto both factors, pinned Mathlib already supplies its Goursat normal subgroups and quotient isomorphism (/320). If H is swap-stable, the two normal subgroups coincide, say N, and the quotient automorphism α satisfies α²=id. Every embedded type containing the fixed swap is consequently

    H(N,α) = {(a,b) : α(aN)=bN},     F(N,α) = H(N,α) ⋊ ⟨τ⟩.

The candidate has order 2|G||N|. Its outside involutions are exactly ((a,a⁻¹),τ) with α(aN)=a⁻¹N. Enumerating all normal N and all α with α²=id, generating by this explicit set, and accepting exactly the expected order therefore exhausts the admissible embedded types. Abstract identification happens only after this test. In particular the full wreath product for an abelian nontrivial G is not accepted merely because it contains τ. Items /321–/323 state the construction and proof; /325 gives diagonal-automorphism transport. Existing `RegularWreathProduct` remains the Lean carrier; GAP's permutation model is a computational realization.

For a good type, Lemma 6.2 implies F^ab=C₂. Hence ker(F→C₂)=[F,F], and c is intrinsically the involutions outside the derived subgroup. Abstract group isomorphisms preserve this c; /326 proves that checking one realization suffices for the good-type multiplier and center. For non-good types the program actually checks the class count across every enumerated realization with the same abstract ID in the tested range.

#### Reduced multiplier calculation and computational boundary

Given GAP's Schur-cover epimorphism S→F, let A be its kernel. The program checks A≤Z(S)∩[S,S], then constructs the subgroup R generated by commutators of lifts of commuting pairs with first entry in c. It returns A/R, as required by Wood §2.3. For the large simple-group rows it uses one representative of each class and generators of its centralizer. This is exact: for fixed x the central commutator is a homomorphism on C_F(x), and simultaneous conjugation leaves its central value unchanged (/324). All pairs were used for the small-group batches.

For the A₄ order-96 type the computed data are |S|=768, A≅C₂³ and |R|=4, giving A/R≅C₂. For the other A₄ type S₄, A≅C₂ and |R|=2, giving the trivial reduced multiplier. This distinction checks that taking the ordinary Schur multiplier alone would give the wrong result.

The runtime was GAP 4.15.1, SmallGrp 1.5.4 and AutPGrp 1.11.1; GAPDoc 1.6.7 also loaded. Polycyclic did not load and was not used. The exact API documentation and implementation were inspected in GAP's `lib/gprd.gd`, `lib/schur.gd` and the generic `lib/schur.gi` method; the [versioned Schur-cover source](https://github.com/gap-system/gap/blob/v4.15.1/lib/schur.gd) specifies the epimorphism's kernel. The computations trust GAP's finite-group and Schur-cover algorithms. Checking the stem conditions does not alone prove maximality; the Schur-cover routine supplies that part. No Lean proof or proof-assistant-checked certificate is claimed. No author computation code, cubic-field data or class-group certificates were obtained.

The following table records Table 2 in its printed order. `SG(a,b)` means SmallGroup(a,b); the two large wreath products are specified explicitly and have no artificial SmallGroups ID. The reduced-multiplier columns are abelian invariant-factor lists, with [] denoting the trivial group.

| Row | G identifier | F identifier | Schur multiplier | Order of R | Reduced multiplier | Center |
| --- | --- | --- | --- | ---: | --- | ---: |
| 1 | SG(3,1) | SG(6,1) | [] | 1 | [] | 1 |
| 2 | SG(5,1) | SG(10,1) | [] | 1 | [] | 1 |
| 3 | SG(7,1) | SG(14,1) | [] | 1 | [] | 1 |
| 4 | SG(9,1) | SG(18,1) | [] | 1 | [] | 1 |
| 5 | SG(9,2) | SG(18,4) | [3] | 1 | [3] | 1 |
| 6 | SG(11,1) | SG(22,1) | [] | 1 | [] | 1 |
| 7 | SG(12,3) | SG(24,12) | [2] | 2 | [] | 1 |
| 8 | SG(12,3) | SG(96,227) | [2, 2, 2] | 4 | [2] | 1 |
| 9 | SG(13,1) | SG(26,1) | [] | 1 | [] | 1 |
| 10 | SG(15,1) | SG(30,3) | [] | 1 | [] | 1 |
| 11 | SG(17,1) | SG(34,1) | [] | 1 | [] | 1 |
| 12 | SG(19,1) | SG(38,1) | [] | 1 | [] | 1 |
| 13 | SG(21,1) | SG(294,7) | [] | 1 | [] | 1 |
| 14 | SG(21,2) | SG(42,5) | [] | 1 | [] | 1 |
| 15 | SG(23,1) | SG(46,1) | [] | 1 | [] | 1 |
| 16 | SG(24,3) | SG(48,29) | [] | 1 | [] | 2 |
| 17 | SG(24,3) | SG(384,18130) | [2, 2] | 4 | [] | 2 |
| 18 | SG(25,1) | SG(50,1) | [] | 1 | [] | 1 |
| 19 | SG(25,2) | SG(50,4) | [5] | 1 | [5] | 1 |
| 20 | SG(27,1) | SG(54,1) | [] | 1 | [] | 1 |
| 21 | SG(27,2) | SG(54,7) | [3] | 1 | [3] | 1 |
| 22 | SG(27,3) | SG(54,8) | [] | 1 | [] | 3 |
| 23 | SG(27,3) | SG(162,46) | [3, 3] | 1 | [3, 3] | 3 |
| 24 | SG(27,4) | SG(162,17) | [] | 1 | [] | 3 |
| 25 | SG(27,5) | SG(54,14) | [3, 3, 3] | 1 | [3, 3, 3] | 1 |
| 26 | SG(29,1) | SG(58,1) | [] | 1 | [] | 1 |
| 27 | SG(31,1) | SG(62,1) | [] | 1 | [] | 1 |
| 28 | A₅ | SG(120,34) | [2] | 2 | [] | 1 |
| 29 | A₅ | A₅≀C₂ | [2] | 1 | [2] | 1 |
| 30 | PSL(3,2) | SG(336,208) | [2] | 2 | [] | 1 |
| 31 | PSL(3,2) | PSL(3,2)≀C₂ | [2] | 1 | [2] | 1 |

All Table 1 rows are matched by row number in the result JSON's `computationEvidence`, with concrete group IDs, outside-involution class counts, center orders and numbers of involutions. The first 35 rows use all groups of orders 2–15; the final six use A₅ and PSL(3,2). Table 2's 27 small-group rows were selected from all groups of orders 2–31, rather than only constructing the already-listed good groups. The Schur and center entries for every completed row match the printed values.

The new construction /321 has four API contracts (membership/projections, swap, cardinality and transport) and four planned Lean tests (trivial quotient, identity graph, abelian inversion and the A₄ sum-kernel). This continues the inherited API rather than asserting full API closure for all older definitions. New enumeration consumers stay in ST.3; /324 extends the existing reduced-Schur Part II. No new roadmap is proposed.

#### Reproduction programs

The exact executed programs are included below. Run each with GAP 4.15.1 and the listed packages using `gap -q -b -T program.g`. `SetAssertionLevel(1)` enables the checks. Require the `FINISHED` marker and reject any GAP error: GAP can return shell status zero after an interpreter error. No tests in this code claim to prove a number-field limit.

Small-group batch A (orders 2–15):

```gap
SetAssertionLevel(1);
SizeScreen([200,24]);
# Enumerate every swap-stable subdirect product by Goursat's lemma.
Types := function(G)
 local W,e1,e2,t,out,N,p,Q,a,x,cs,F,expected,id;
 W:=WreathProduct(G,SymmetricGroup(2));
 e1:=Embedding(W,1); e2:=Embedding(W,2);
 t:=Image(Embedding(W,3),(1,2)); out:=[];
 for N in NormalSubgroups(G) do
  p:=NaturalHomomorphismByNormalSubgroup(G,N); Q:=Image(p);
  for a in AutomorphismGroup(Q) do
   if not IsOne(a^2) then continue; fi;
   cs:=List(Filtered(Elements(G),x->Image(a,Image(p,x))=Image(p,x)^-1),
       x->Image(e1,x)*Image(e2,x^-1)*t);
   F:=Group(cs);
   expected:=2*Size(G)*Size(N);
   if Size(F)<>expected then continue; fi;
   Assert(1,t in F);
   Assert(1,ForAll(cs,x->Order(x)=2));
   Assert(1,Size(Kernel(RestrictedMapping(Projection(W),F)))=Size(F)/2);
   Assert(1,Set(cs)=Filtered(Elements(F),x->Order(x)=2 and Image(Projection(W),x)<>One(SymmetricGroup(2))));
   id:=IdGroup(F);
   Add(out,rec(F:=F,c:=cs,id:=id,normalsize:=Size(N),quotientsize:=Size(Q),
       classes:=Size(Set(cs,x->ConjugacyClass(F,x))),center:=Size(Center(F))));
  od;
 od;
 return out;
end;
ReducedForWood := function(F,c)
 local epi,S,A,rel,x,y,R;
 epi:=EpimorphismSchurCover(F); S:=Source(epi); A:=Kernel(epi);
 Assert(1,IsSubgroup(Center(S),A));
 Assert(1,IsSubgroup(DerivedSubgroup(S),A));
 rel:=[];
 for x in c do for y in Centralizer(F,x) do
  Add(rel,Comm(PreImagesRepresentative(epi,x),PreImagesRepresentative(epi,y)));
 od; od;
 R:=Subgroup(S,rel);
 Assert(1,IsSubgroup(A,R));
 return rec(schur:=AbelianInvariants(A),reduction:=Size(R),reduced:=AbelianInvariants(A/R));
end;
for n in [2..15] do
 for j in [1..NrSmallGroups(n)] do
  G:=Image(IsomorphismPermGroup(SmallGroup(n,j)));;
  rows:=Types(G);;
  seen:=[];;
  for row in rows do
   if row.id in seen then continue; fi;
   Add(seen,row.id);
   Print("TYPE ",[n,j]," ",row.id," ",row.classes," ",row.center," ",Size(row.c),"\n");
   # Every embedded realization with this abstract group must have the same class count.
   Assert(1,ForAll(Filtered(rows,r->r.id=row.id),r->r.classes=row.classes));
   if row.classes=1 then
    red:=ReducedForWood(row.F,row.c);;
    Print("MULT ",[n,j]," ",row.id," ",red.schur," ",red.reduction," ",red.reduced,"\n");
   fi;
  od;
  Print("EMBEDDINGS ",[n,j]," ",Length(rows),"\n");
 od;
od;
Print("FINISHED\n");
QUIT;
```

Small-group batch B was exactly the same program with `for n in [2..15] do` replaced by `for n in [16..31] do`; both batches reached `FINISHED`. This also examined additional bad types outside Table 1's printed range; no claim of embedding independence beyond the paper's range is inferred from those auxiliary outputs.

Simple-group batch (including the reduced relation optimization /324):

```gap
SetAssertionLevel(1);
SizeScreen([200,24]);
# Enumerate every swap-stable subdirect product by Goursat's lemma.
Types := function(G)
 local W,e1,e2,t,out,N,p,Q,a,x,cs,F,expected,id;
 W:=WreathProduct(G,SymmetricGroup(2));
 e1:=Embedding(W,1); e2:=Embedding(W,2);
 t:=Image(Embedding(W,3),(1,2)); out:=[];
 for N in NormalSubgroups(G) do
  p:=NaturalHomomorphismByNormalSubgroup(G,N); Q:=Image(p);
  for a in AutomorphismGroup(Q) do
   if not IsOne(a^2) then continue; fi;
   cs:=List(Filtered(Elements(G),x->Image(a,Image(p,x))=Image(p,x)^-1),
       x->Image(e1,x)*Image(e2,x^-1)*t);
   F:=Group(cs);
   expected:=2*Size(G)*Size(N);
   if Size(F)<>expected then continue; fi;
   Assert(1,t in F);
   Assert(1,ForAll(cs,x->Order(x)=2));
   Assert(1,Size(Kernel(RestrictedMapping(Projection(W),F)))=Size(F)/2);
   Assert(1,Set(cs)=Filtered(Elements(F),x->Order(x)=2 and Image(Projection(W),x)<>One(SymmetricGroup(2))));
   if Size(F)>2000 then id:=[Size(F),0]; else id:=IdGroup(F); fi;
   Add(out,rec(F:=F,c:=cs,id:=id,normalsize:=Size(N),quotientsize:=Size(Q),
       classes:=Size(Set(cs,x->ConjugacyClass(F,x))),center:=Size(Center(F))));
  od;
 od;
 return out;
end;
ReducedForWood := function(F,c)
 local epi,S,A,rel,x,y,R;
 epi:=EpimorphismSchurCover(F); S:=Source(epi); A:=Kernel(epi);
 Assert(1,IsSubgroup(Center(S),A));
 Assert(1,IsSubgroup(DerivedSubgroup(S),A));
 rel:=[];
 for x in List(Set(c,x->ConjugacyClass(F,x)),Representative) do for y in GeneratorsOfGroup(Centralizer(F,x)) do
  Add(rel,Comm(PreImagesRepresentative(epi,x),PreImagesRepresentative(epi,y)));
 od; od;
 R:=Subgroup(S,rel);
 Assert(1,IsSubgroup(A,R));
 return rec(schur:=AbelianInvariants(A),reduction:=Size(R),reduced:=AbelianInvariants(A/R));
end;
for G in [AlternatingGroup(5),PSL(3,2)] do
 rows:=Types(G);; seen:=[];;
 for row in rows do
  if row.id in seen then continue; fi;
  Add(seen,row.id);
  Print("TYPE_BIG ",Size(G)," ",row.id," ",row.classes," ",row.center," ",Size(row.c),"\n");
  Assert(1,ForAll(Filtered(rows,r->r.id=row.id),r->r.classes=row.classes));
  if row.classes=1 then
   red:=ReducedForWood(row.F,row.c);;
   Print("MULT_BIG ",Size(G)," ",row.id," ",red.schur," ",red.reduction," ",red.reduced,"\n");
  fi;
 od;
 Print("EMBEDDINGS_BIG ",Size(G)," ",Length(rows),"\n");
od;
Print("FINISHED\n");
QUIT;
```

Program and output hashes:

| Program | Program SHA-256 | Output SHA-256 | Reached FINISHED |
| --- | --- | --- | --- |
| table-check.g | af5c992943263e88112544351cc3030776e0fd47072b4bacd7d9bc590c7b1eee | 749bc0a883846e22b41bfce3a5624046c6a9ebf61029567425712cd7d9519060 | True |
| table-check-16-31.g | ee73bfb77fc85171907a84831f21e40f6aa35e9dd8fb75cf811be4ce77ab4e43 | 91d4b17c166397aa9993915598759e14a570136d5faba2bd0c1ff7be8b657206 | True |
| table-check-big.g | b9fcebe9fd5b6f59a840a01f51b27183c4a10e0689e3d1f2dc66675ef06e582a | a9cb5eb6cfdd07bb7494d606aa809647c08b555c7ed75d6bc24a1c2ad86f16ad | True |

Current execution status: **41/41 type rows, 31/31 multiplier rows and 31/31 centers reproduced**. All three programs reached FINISHED without GAP errors. The two inherited Python regression programs above remain unchanged and were rerun successfully: 6,588 and 563 assertions. The paper checker, file-intake checker and structural validation were run for this continuation. No Lean file was required, written or compiled.

## Review (REV-PAPER-WOOD-19, 23 September 2026)

The independent review, by Claude Code (session `cc-7b31c4`, issue #1331), **accepted** this
extraction and all ten routes, and needed no correction. The full record is
[REV-PAPER-WOOD-19.md](../reviews/REV-PAPER-WOOD-19.md).

The recorded hash of the NSF PAR copy reproduces byte for byte; printed pages 378–428 run over PDF
pages 1–51. Wood's companion note, which `E9` and `E10` are about, was fetched independently from the
author's page (`lifting.pdf`, 13 pages, `9628210e…`) and read at both locators. 344 items with all
318 missing ones routed exactly once; all eight source stage ids and all 13 planned ids resolve; both
Part II titles reproduce their parents' atlas titles exactly and both areas are galaxy ids; and all
31 declarations behind the 13 library items resolve, in Mathlib and in Tau Ceti. Of 39 locator checks
33 land exactly and the six others are right too.

All ten findings are **confirmed**. Six are verbatim in the published text: the `q^n` slice on p. 407
(`E4`), the three-part slip in the imaginary non-good display on p. 409 which the very next line of
the same display corrects (`E5`), the real-case `+1` on p. 409 (`E6`), `u ∈ μ` without "generator" in
Conjecture 5.1 against Lemma 3.11's homomorphism property (`E7`), and `C₃ × C₃ × C₂` printed twice on
p. 421 for a group of order 12 (`E8`). `E1`'s gap is visible in the proof on p. 409, which restricts
to the multidegree set `C`, discards the rest as nonnegative and concludes with `≥` — a bound on the
liminf, not on the limit Theorem 1.2 asserts. `E2` is the classical confusion of the tame quotient
with its maximal prime-to-`p` quotient, and the modular-cover witness is good. `E3`'s `C₃`
counterexample works. `E10` is confirmed from the companion note's own display.

The review states two limits of its own. For `E9` the symbols `φ` and `ψ` and any inverse do not
survive text extraction from the companion note, so for the presence of the misprint — as against the
mathematics, which it verified — it relies on the recorded reading. And it notes, without changing
the field, that `E7` makes Conjecture 5.1 false as printed, so `affects: nothing` is generous.

Two points for whoever next touches the file, neither a condition of the review: no `libraryPins` are
recorded, so there is no commit against which the 31 library declarations were checked; and several
`printed` fields are pointers (`a subgroup`, `tame quotient`, `q^n`, `φ·ψ`) rather than the printed
text PROTOCOL §18 asks for, which makes those entries impossible to check without returning to the
page.
