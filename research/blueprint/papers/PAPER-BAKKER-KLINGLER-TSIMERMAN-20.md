# Bakker–Klingler–Tsimerman (2020): tame topology of arithmetic quotients and algebraicity of Hodge loci, extraction and routing

Issue [#1422](https://github.com/CBirkbeck/tauceti-explorer/issues/1422). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged checkpoints (Codex and Claude Code), whose report follows below as history.
- **The paper.** B. Bakker, B. Klingler and J. Tsimerman, *Tame topology of arithmetic quotients and algebraicity of Hodge loci*, J. Amer. Math. Soc. 33 (2020), 917–939, with the official erratum in J. Amer. Math. Soc. 36 (2023).
  - The published text (NSF PAR, 23 pages) was re-fetched.
- **Items.** The result has **124 items: 12 library, 12 planned and 100 missing**. Every missing item is routed exactly once, and every numbered statement is an item. Theorem 4.13 (Peterzil–Starchenko) is now named on the definable-Chow item.
- **Mistakes.** Twenty-nine are recorded under `sourceIssues`. The official erratum covers E5–E7.

## Independent review (REV-PAPER-BAKKER-KLINGLER-TSIMERMAN-20)

The independent review (Claude Code, session cc-2aeb03, 23 September 2026) corrected this extraction in place. The review
report is `research/blueprint/reviews/REV-PAPER-BAKKER-KLINGLER-TSIMERMAN-20.md`; the counts in the sections below it are the
earlier ones and are superseded by these.

- **Items: 147** (10 library, 14 planned, 123 missing), each missing item routed once.
  - 87 fields corrected: 45 statements and 42 locators (many gave the authors' copy's pages instead of the JAMS pages).
  - 29 items added for definitions, constructions and cited inputs the proofs use, two of them planned (ShimuraVarieties V2,
    AdelicAlgebraicGroups AA.3).
  - Six removed as not in the paper: the extraction's own repair lemmas and library-support items and the audit counterexample
    to Theorem 4.1; their content is kept in the notes of the items they support and in E1.
- **Routes.** All eight stand; the briefs of routes 7 and 8 name the confirmed corrections their designs must carry.
- **Prerequisites.** Rebuilt as 24 cited works with DOIs or stable links.
- **Mistakes: 60** (34 misprints, 16 gaps, 10 errors); 4 reach a stated result and 16 a proof.
  - **E1–E29** are confirmed; E1, E7, E8, E10, E17, E26, E27 and E28 are revised, and E3's reach is the proof.
  - **E30–E60** are new, each checked independently; E30–E33 are misprints in the 2023 erratum. The main ones:
    - **E46:** roughly polynomial functions do not form a ring as defined in Definition 4.4.
    - **E60:** the Claim on p. 933 is false for every basis; finitely many orderings of one basis repair it.
    - **E49, E53, E54:** Theorem 4.8 is applied outside the splitting it is stated for, and Lemma 4.10's lower bound is proved
      only for large y_n.
    - **E58, E59:** the proof of Theorem 4.12 needs that f is a period map and that the Theorem 1.1 and Baily–Borel structures
      agree.
  - With the 2023 erratum, Theorems 1.3 and 1.6 are not affected.

## This continuation (cc-442dc5)

**E1 rechecked.**
- **The problem.** Theorem 4.1 as printed, for the whole punctured polydisk, is false.
- **Why the rest survives.** Its proof says "after maybe shrinking the polydisk", and §4.1 needs only finitely many shrunken charts, so Theorem 1.3 is unaffected. The finding still affects a stated result.

**Reclassified to affect nothing.**
- **E20.** The comparison is meant for u ≠ 0.
- **E28.** §5's description of the exceptional locus includes the identity image. §1.4 and Theorem 1.6 use exceptional Hodge tensors.

**Verification gaps.** Each now has a status.
- G1 and G4 are resolved.
- G2, G5 and G6 are recorded as findings.
- G3 (the Schmid, CKS and Kashiwara inputs) is deferred.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.

## Mistakes found (`sourceIssues`)

- **E1** (error; affects a stated result), Theorem 4.1, JAMS p.928, proof p.929; author p.13–14. *Printed:* "Theorem 4.1. Let V be a polarized variation of pure Hodge structures of weight k over the punctured polydisk (∆*)^n, with period map Φ: (∆*)^n → S_{Γ,G,M}. Then Φ is R_an,exp-definable." (∆ is the unit disk, p.4.) *Correction:* Definability holds only after shrinking. For some radius 0 < ρ < 1, the restriction of Φ to (∆*_ρ)^n is R_an,exp-definable, and then for every ρ < 1 by compactness of the remaining annular pieces. The reduction in §4.1 must use charts whose shrunken polydisks still cover the compactification.
- **E2** (gap; affects the proof), Lemma 4.5 proof, JAMS p.930; author p.15. *Printed:* "Consider for each positive integer m and real number c the function f_{m,c} which we obtain from f by setting z_1 = mz_2 + c. Note that the assumptions of the lemma still apply to f_{m,c}, and it follows by induction on n that f_{m,c} ≪ 1 on all of Σ_{n−1}" *Correction:* State the lemma, and verify its curve hypothesis, on wider sectors Σ_n^R={|x_i|<R,y₁≥⋯≥y_n>1} for every R, with constants depending on R. The substitution maps Σ_(n−1)^R′ into Σ_n^(mR′+|c|). The application needs original-source bounded-real-width uniformity for Schmid Corollary 5.29 and the CKS/Kashiwara norm estimates; G3 records that this is still unverified. The R-quantifier of the target Theorem 1.5 is not evidence for its prerequisites.
- **E3** (error; affects nothing), §4.5, JAMS p.933; author p.18. *Printed:* "Moreover, if b is (e′, C′)-reduced and e is a basis for which condition (3) of Definition 4.11 holds for some C > 0, then b will also be (e, C″)-reduced for some C″ = C″(e, C, e′, C′) > 0." *Correction:* Condition (2), the ordering b(e_i) < C b(e_j) for i < j, transfers only up to a permutation of e. Conclude that b is (σe, C″)-reduced for some permutation σ, which is one of finitely many.
- **E4** (misprint; affects nothing), Appendix A.1, JAMS p.934, contrasted with A.3 p.936; author p.20–22. *Printed:* "Given X a real-analytic n-manifold with corners, one defines its boundary ∂X (cf. [Joy12, def. 2.6]. This is a real-analytic n-manifold with corners for n > 0" *Correction:* ∂X is a real-analytic (n − 1)-manifold with corners.
- **E5** (error; affects a stated result), Theorem 1.1(1), JAMS p.919; Definition 2.5 and Proposition 2.7, p.924. *Printed:* "(1) The arithmetic quotient S_{Γ,G,M} := Γ\G/M admits a natural structure of R_alg-definable manifold, characterized by the following property. ... S ⊂ G/M a semi-algebraic Siegel set ..." *Correction:* The definable structure depends on a choice of maximal compact subgroup K ⊃ M. For each such K there is a structure S_{Γ,G,M,K}, characterized by the Siegel sets associated to K. Definition 2.5 must fix K, and Proposition 2.7 holds when all Siegel sets use the same K (Erratum, Theorem 1.2(1)).
- **E6** (error; affects a stated result), Theorem 1.1(2), JAMS p.919. *Printed:* "(2) Any morphism f: S_{Γ′,G′,M′} → S_{Γ,G,M} of arithmetic quotients is R_alg-definable." *Correction:* Only morphisms compatible with the chosen maximal compacts are definable: maps Γ′h′M′ ↦ Γφ(h′)gM with φ(Γ′) ⊂ Γ, φ(M′) ⊂ gMg^{−1}, φ(K′) ⊂ gKg^{−1}, and θ_{gKg^{−1}} preserving φ(g′) (Erratum, Theorem 1.2(2)).
- **E7** (error; affects the proof), §4.5, JAMS p.932; author p.17. *Printed:* "By [B-HC62, 7.5] the preimage of any Siegel set S ⊂ X is contained in the union of finitely many Siegel sets of D." *Correction:* Cite Bakker–Grimm–Schnell–Tsimerman, Proposition 28.1, instead. [B-HC62, 7.5] concerns real Siegel sets and does not give this rational statement.
- **E8** (error; affects the proof), Lemma 2.1 first proof, JAMS p.923; author §2.1. *Printed:* G/M ≃ p(G·v) *Correction:* The displayed invariant-polynomial map need not separate right M-cosets. Use the second, proper semialgebraic-quotient proof, with its external quotient theorem explicitly imported.
- **E9** (misprint; affects nothing), Lemma 2.1 second proof, JAMS p.923. *Printed:* E ⊂ G × M *Correction:* The ambient product is G×G.
- **E10** (misprint; affects nothing), §2.2, JAMS p.923, equation (2.3). *Printed:* right action *Correction:* The displayed formula is left multiplication by p∈P.
- **E11** (misprint; affects nothing), Theorem 1.5, JAMS p.921. *Printed:* |Re z_i| ≤ C *Correction:* Use R in the definition of H_(R,η), consistently with the quantified parameter.
- **E12** (misprint; affects nothing), §4.2 after Remark 4.3, JAMS p.929. *Printed:* Theorem 1.1(2) *Correction:* Refer to Theorem 1.1(1), with fixed K as in the erratum.
- **E13** (misprint; affects nothing), Proof following Theorem 4.8, JAMS p.931. *Printed:* part (1) of Proposition 4.6 *Correction:* Refer to Lemma 4.7(1).
- **E14** (misprint; affects nothing), §4.6 heading, JAMS p.933. *Printed:* Theorem 1.1 *Correction:* Theorem 1.3 is the direct period-map input in the proof.
- **E15** (misprint; affects nothing), §5, JAMS p.933. *Printed:* Theorem 1.1(3) *Correction:* Use Theorem 1.1(2), as restricted to Hodge morphisms by erratum Corollary 1.3.
- **E16** (misprint; affects nothing), §5, JAMS p.934, definability of Φ_S. *Printed:* Theorem 1.1 *Correction:* Use Theorem 1.3.
- **E17** (gap; affects the proof), Appendix A.3 proof of Proposition A.2, JAMS pp.935–936. *Printed:* relatively compact *Correction:* Choose smaller semialgebraic corner boxes whose closures lie inside larger analytic charts. Prove definability of the compact matching graph and cover it by finitely many neighborhoods of analytic transition extensions. Mere boundedness of the smaller domains is insufficient.
- **E18** (gap; affects the proof), §3.2 reduction to g=e, JAMS p.927. *Printed:* Int(g⁻¹) *Correction:* Keep the rational homomorphism φ unchanged and factor through compact data M_g=gMg⁻¹, K_g=gKg⁻¹ in the target, followed by right translation by g. Justify transport of the fixed-K quotient structures.
- **E19** (error; affects the proof), §3.2 surjective case, JAMS p.928. *Printed:* S_(Γ′,G′,M′) = S_(Γ₁,G,M₁) × S_(Γ_H,H,M_H) *Correction:* A product decomposition of the semisimple group does not decompose an arbitrary compact stabilizer. Supply a compact-stabilizer quotient adapter in addition to the finite-index arithmetic step.
- **E20** (error; affects nothing), Lemma 4.7(1),(2) and Theorem 4.8(1),(2), JAMS p.931. *Printed:* u ∈ J_σ *Correction:* Require u≠0 for positive two-sided monomial comparisons.
- **E21** (misprint; affects nothing), Lemma 4.7 proof, JAMS p.931, definition of B. *Printed:* Hermitian *Correction:* B(u,v)=Q(u,conj v) is (−1)^k-Hermitian in weight k. For odd weight it is skew-Hermitian; i^kB is Hermitian. Retain phase factors in all determinant and Hodge-metric formulas.
- **E22** (misprint; affects nothing), Lemma 4.5 proof, JAMS p.930, finite difference F_m. *Printed:* (1/r₁!) ∑_i (−1)^i binom(r₁,i) f_(m,i) *Correction:* This normalization extracts (−1)^r₁ times the leading coefficient; either include that factor in the next identity or use (−1)^(r₁−i) in the definition.
- **E23** (gap; affects the proof), §3.1 first paragraph, JAMS p.926. *Printed:* open real analytic charts *Correction:* Choose open buffered pieces and establish a finite local slice/chart refinement after the finite proper relation construction. Do not identify entire Siegel pieces with injective coordinate charts.
- **E24** (misprint; affects nothing), §3.1, JAMS p.926, two occurrences. *Printed:* cl(F_i) *Correction:* Use cl(S_i).
- **E25** (misprint; affects nothing), Appendix A.2, JAMS p.935, mixed atlas transitions. *Printed:* ψ_j ∘ φ_i⁻¹ *Correction:* Use ψ_j⁻¹∘φ_i on the coordinate overlap.
- **E26** (misprint; affects nothing), §4.5, JAMS p.932 first line and p.933 claim. *Printed:* S_H^b; H_Q *Correction:* Use S_H^n and V_Q, respectively.
- **E27** (gap; affects the proof), §1.3 and §4.2, JAMS pp.920 and 928. *Printed:* G(Z) ⊂ GL(V_Z) *Correction:* Use a group that acts on the variation's rational representation, or explicitly pass to a faithful adjoint/central-cover representation and compare the resulting arithmetic quotients and period maps.
- **E28** (error; affects nothing), §5, JAMS pp.933–934, definition of the target Hodge locus. *Printed:* union of special subvarieties *Correction:* For the exceptional locus use the proper Mumford–Tate-drop subdata, excluding the generic identity image. Establish its correspondence with exceptional tensors.
- **E29** (gap; affects the proof), Theorem 4.12 and proof, JAMS p.933. *Printed:* smooth complex algebraic manifold S×S_(Γ,G,K) *Correction:* Either restrict this proof to smooth S or supply algebraicity descent through a resolution/stratification and the necessary singular-source analytic comparison.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G1, Published-version access and statement/locator collation** (resolved). Resolved by the earlier continuation.
- **G2, Arithmetic reduction and quotient foundations** (recorded). E8, E18, E19 and E23 record the paper's own reduction gaps. Borel–Harish-Chandra, Borel–Serre/Borel–Ji and Orr are cited suppliers.
- **G3, Hodge analytic prerequisites** (deferred). Schmid, Cattani–Kaplan–Schmid and Kashiwara are cited suppliers, including the R-uniformity needed by the repaired Lemma 4.5 (E2).
- **G4, Rough-polynomial curve test** (resolved). Resolved by the earlier continuation (E2).
- **G5, Reducedness and local-scope repairs** (recorded). E1 and E3; the shrunken-chart form is the corrected statement.
- **G6, Definable algebraization and Hodge locus inputs** (recorded). E29 records the singular-source gap in Theorem 4.12; E28 now affects nothing. Peterzil–Starchenko and the o-minimality inputs are cited suppliers.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## Bakker–Klingler–Tsimerman: tame arithmetic quotients and Hodge loci

Partial continuation by Codex, session `codex-a71f92`, 23 September 2026. Refs #1422.
Builds on Codex `codex-c83e7a` (PR #1670) and Claude Code `cc-fb70e5` (PR #1840).

The extraction now contains **124 items: 12 library imports, 12 existing plans and 100 missing items**, with exactly one route per missing item. Its 44 definitions/constructions have 132 API contracts and 134 proposed tests; the dependency graph has 234 edges. The standard `tests` field now carries the tests and API roles use the protocol vocabulary; the old `unitTests` field is retained for compatibility, not counted twice. These are planning contracts, not implemented Lean declarations.

This continuation supplies explicit proofs for fixed-basis off-diagonal transfer, finite-permutation reducedness, properness of a finite Siegel relation, and buffered analytic transition graphs. It also obtains the published paper and expands the unreviewed source-issue ledger from seven to 29 entries. The extraction remains partial: original reduction and Hodge-analytic inputs, finite chart refinement, finite boundary/level adapters and definable algebraization are not closed.

### Sources and attribution

The complete [published JAMS paper](https://par.nsf.gov/servlets/purl/10200187), printed pages 917–939, was read, including the references. Published page images 921, 923, 926–928, 930–933 and 935 were inspected for symbols and formulas. The [author copy](https://benjamin-bakker.github.io/DefArith.pdf) was compared at the main statements and recorded findings. This resolves the missing-published-copy gate G1; it is not a claim of exhaustive glyph-by-glyph editorial collation.

The entire four-page [official erratum](https://benjamin-bakker.github.io/DefArithErr.pdf), DOI 10.1090/jams/1025, was reread. Bakker's and Tsimerman's author pages and the [arXiv version listing](https://arxiv.org/abs/1810.04801) were checked for corrections; the latest listed version is v2, dated 22 June 2020. No author was contacted. Every newly recorded finding is provisional pending independent review.

The earlier contributors' source work is preserved and attributed, not represented as a new full reread: the complete author paper and Orr–Schnell correction; BGST author pages 13–15, including Proposition 28.1's proof; Schmid printed pages 230, 232–233, 244–245; selected Kashiwara pages 863–866 and 870–875, with remaining OCR/image gaps; and selected arXiv v2 passages. Exact URLs, SHA-256 hashes, dates and read extents are in `provenance`. A bibliography entry is not a completed prerequisite extraction.

### Corrected scope and existing owners

A general arithmetic quotient Γ\G/M retains a chosen maximal compact K containing M. Siegel comparisons use the same K. A morphism [h′] ↦ [φ(h′)g] has rational φ, compatible levels and stabilizers, φ(K′) contained in gKg⁻¹, and the target Cartan involution preserving the image Lie algebra. Definability is a theorem, not part of the definition. General fixed-quotient K-independence and unrestricted morphism functoriality are not asserted.

Orr–Schnell containment retains the Cartan condition; BGST Proposition 28.1 retains its forward-containment hypothesis for rational pullback. Hodge morphisms have canonical compatible compact data. The symmetric-space specialization does not make the general quotient K-independent.

Pinned baselines remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All ten previously imported signatures were checked at those pins. The two new library items import `TauCeti.cholesky`/`TauCeti.cholesky_mul_transpose` and `Matrix.inv_def`. Cholesky factorization belongs to existing upstream work, not to a new reduction-theory construction.

The full upstream HodgeStructures and UniversalCovers documents were read, with selected current owner descriptions and available reviewed audit entries. LD.0/LD.6 have descriptions but no reviewed audit entries in this snapshot; absence of an audit is not evidence that a library construction exists. A name search is likewise only negative evidence, not a proof of mathematical absence.

| Owner | Exact consuming boundary |
| --- | --- |
| AdelicAlgebraicGroups AA.3 | Rational reduction, fixed-K Siegel sets, corrected containment/pullback, reduced forms and quantitative basis adapters |
| LogicAndDefinabilityInNumberTheory LD.0/LD.6 | Tame structures, finite atlases, buffered analytic corners, rough functions, repaired curve test and definable Chow |
| ShimuraData D3 | The already planned general polarized-variation definition |
| ShimuraVarieties V3 | Borel algebraicity, including this alternative proof once its target comparison is certified |
| AlgebraicModuliForArithmeticGeometry R09.7d | Smooth normal-crossing compactifications |
| ComplexComparisonPartII C0/C4 | Analytic images and analytic/algebraic graph comparison, not nonproper definable Chow |
| ArithmeticLocallySymmetricSpaces, Part II | General compact-stabilizer quotients and fixed-K tame structures, specializing to ALS.2 when M=K |
| Upstream HodgeStructures, Part II | Non-Hermitian period geometry, degeneration, period maps and exceptional Hodge loci |

The proposed IDs remain `ArithmeticQuotientDefinability` and `DegeneratingHodgeStructures`. Current roadmap/packet/decomposition/reserved-ID screening found no competing accepted roadmap with these IDs. Benoist and Gao–Habegger paper briefs already reference the shared Hodge successor and remain coordinated consumers/additional tranches, not new generic owners. Upstream LieGroups Layer 9 supplies Cartan/Iwasawa decompositions. Existing Hodge carriers, the single mixed-Hodge Deligne decomposition and period-domain points are imported; none is mistaken for simultaneous Kashiwara splittings or a period-domain manifold.

### Quantitative basis-transfer proof

Let B be the Gram matrix in a fixed reduced basis e′, d_k=B_kk, and suppose ∏d_k≤D det B. Cholesky gives Hadamard's inequality for B and each principal minor. The diagonal cofactor formula then gives

`(B⁻¹)_kk = det(B with row/column k removed)/det B ≤ D/d_k.`

Applying positivity to a−tB⁻¹e_k and minimizing in t yields
`aᵀBa ≥ a_k² d_k/D`.
The empty principal minor in rank one has determinant 1.

Write a second fixed basis as e_i=∑_a A_ai e′_a. Set k_i=max support(A_·i), m_i=|A_(k_i),i| and L_i=∑_a|A_ai|. If B is (e′,C′)-reduced with C′≥1, ordering and its all-pairs off-diagonal bound give
`|b(e_i,e_j)| ≤ C′² d_(k_i) L_i L_j`.
The coordinate estimate gives
`b(e_i,e_i) ≥ m_i² d_(k_i)/C′`.
Thus the explicit transfer bound is

`|b(e_i,e_j)| ≤ C′³ L_i L_j / m_i² · b(e_i,e_i).`

This unordered bound does not need determinant control in the new basis. If additionally ∏b(e_i,e_i)≤C det(b in e), sort the diagonal lengths and choose C″ strictly larger than 1, C and all the displayed constants. All three strict reducedness inequalities follow, including ties. Only finitely many permutations occur. This resolves the quantitative portion of G5 and preserves E3's reversed-basis counterexample.

### Other proof repairs and their limits

For finitely many closed semialgebraic pieces C_i with finite overlap witnesses, the orbit relation is a finite union of graphs of group elements restricted to closed sets C_i∩γ⁻¹C_j. Each coordinate projection over a compact set has compact inverse image. The relation is therefore closed, semialgebraic and proper. This proves the finite-relation step; it does **not** turn entire Siegel images into injective coordinate charts. The finite local refinement remains G2.

For analytic corners, choose smaller semialgebraic boxes with closures compactly contained in larger analytic charts. The matching graph in the product of the two closures is compact by Hausdorffness. Finitely many neighborhoods of analytic transition extensions cover it; restricting those extensions to compact boxes gives a finite union of R_an-definable graphs. The same argument for mixed pairs of buffered covers proves independence. Arbitrary bounded nonbuffered analytic charts need not be globally subanalytic: F(x)=x+(x²/4)sin(1/x) on (0,1) is an increasing analytic diffeomorphism to a bounded interval, but F−id has infinitely many isolated zeros.

The earlier widened-sector repair of Lemma 4.5 remains. Its finite difference must use the sign (−1)^(r−i). If the y₁ powers lie in −L,…,0, L+1 distinct positive integral slopes give an invertible Vandermonde matrix in their reciprocals. This corrects an extraction-level interpolation slip and the source sign slip E22. The application still needs independently verified bounded-real-width uniformity in the Schmid/CKS/Kashiwara estimates; citing the target Theorem 1.5 would be circular.

Preserve nonzero vectors in two-sided monomial comparisons, the centered-weight shift, the library's conjugate-first metric convention, and the parity B(v,u)=(−1)^k conjugate(B(u,v)). Positive Hodge norms are not the possibly indefinite/skew-Hermitian polarization pairing. A faithful adjoint/central-cover representation adapter is still required. The exceptional Hodge locus is a countable union of individually algebraic proper special pullbacks, not an asserted definable whole union.

### Source findings awaiting independent review

All locators below are printed JAMS pages. Detailed checks, corrections and prior-correction searches are in `sourceIssues`. E1–E7 keep their stable IDs; E5–E7 are already corrected in the official erratum. No entry has an independent-review verdict.

| IDs | Pages | Finding |
| --- | --- | --- |
| E1–E4 | 928–930, 933–934 | Whole-polydisk overstatement; curve substitutions leave the original strip; basis transfer needs finite permutations; boundary dimension is n−1 |
| E5–E7 | 919, 924, 932 | Official corrections: K-dependence, Cartan-compatible morphisms, rational rather than real Siegel pullback |
| E8 | 923 | M-invariant polynomials on the orbit representation can identify distinct right M-cosets; retain the second quotient proof |
| E9–E11 | 921, 923 | Relation lies in G×G, action formula is left multiplication, and the horizontal bound uses R rather than an unbound C |
| E12–E16 | 929, 931, 933–934 | Misnumbered references to quotient definability, Lemma 4.7 and the period-map theorem |
| E17 | 935–936 | Analytic transition argument needs buffered charts; the compact-graph repair is supplied |
| E18 | 927 | Conjugation by arbitrary real g need not preserve rationality; use right translation with transported compact data |
| E19 | 928 | Product decomposition of a group does not split an arbitrary compact stabilizer |
| E20–E22 | 930–931 | Nonzero-vector hypotheses, odd-weight skew-Hermitian parity, and finite-difference sign |
| E23–E26 | 926, 932–933, 935 | Finite chart refinement gap, undefined F_i, reversed mixed-chart composition, and notation b/n and H_Q/V_Q |
| E27 | 920, 928 | Adjoint Mumford–Tate presentation need not act on the original fibre |
| E28 | 933–934 | Exceptional target locus must exclude the identity/generic special image |
| E29 | 933 | General singular-source Borel statement needs an adapter before using the displayed smooth-source proof |

For E8 take W=Sym₂(R)⊕R, v=(I,1), G=SL₂(R), M=SO₂(R). Its line stabilizer is M. With g=diag(2,1/2) and k the quarter-turn in M, invariant polynomials agree on g·v and kg·v, whereas their symmetric matrices differ, so gM≠kgM.

For E19 take PSL₂×PSL₂, projection to the first factor, product arithmetic level and diagonal SO₂ stabilizer. The original quotient has dimension 5; the displayed product using stabilizer intersections has dimension 6. Finite-index arithmetic changes cannot remove that discrepancy. Neither example refutes the corrected main quotient theorem.

### Validation and resumption

`check_paper.py` passes. Exact rational diagnostics cover 300 positive-definite matrices and fixed-basis transfers in ranks 1–4, empty minors, seven signed finite differences, seven inverse-power Vandermonde matrices, and the SL₂ and odd-weight examples. The custom structural audit checks the 124-node acyclic graph, API/test coverage, all 100 missing-item routes and absence of self-assigned review verdicts. These are diagnostics and proposed tests, not formal proofs.

The final submission checks also run intake on exactly the three deliverables, the paper/errata/source-issue checker tests, and a fresh-main ownership/concurrency check. No Lean file is part of this job and no Lean compilation is claimed.

G1 and G4 are resolved at their stated scope. G2, G3, the remaining boundary/level portion of G5, and G6 stay open. The handoff identifies the next original sources and adapters. Do not mark this partial checkpoint complete merely because its local checks pass.
