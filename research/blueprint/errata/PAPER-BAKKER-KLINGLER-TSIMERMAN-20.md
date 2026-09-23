# BKT (2020): independently reviewed source findings

Paper: Bakker–Klingler–Tsimerman, *Tame topology of arithmetic quotients and algebraicity of Hodge loci*, JAMS 33 (2020), 917–939, DOI [10.1090/jams/952](https://doi.org/10.1090/jams/952).

Original errata job: ERRATA-PAPER-BAKKER-KLINGLER-TSIMERMAN-20, Claude Code, session `cc-442dc5`.
Independent review: REV-ERRATA-PAPER-BAKKER-KLINGLER-TSIMERMAN-20, Codex, session `codex-a71f92`, 23 September 2026.
Input commit: `7df732206da7737e256394a1c960a378ded16b36`.

## Result and scope

All 29 inherited findings were checked against the published source and surrounding argument. Twenty-eight are confirmed with the scope recorded in the JSON; E14 is rejected. No finding has been added. Five confirmed entries credit the published erratum (E5–E7, E18, E27); 23 confirmed entries have no matching correction located in the accessible searches.

This is not a claim that 23 major results are false, nor a proof of priority. The entries include notation slips and specific missing steps. Confirming a gap does not certify a proposed replacement proof. The authors' [official erratum](https://benjamin-bakker.github.io/DefArithErr.pdf) states that the Hodge-manifold and period-map conclusions are unaffected. This review does not refute the global period-map theorem, the Hodge-locus theorem, or Borel's algebraicity theorem. E1 concerns the literal whole-unit-polydisk local statement, not the algebraic-source global theorem.

The detailed independent checks, counterexamples, version distinctions and per-entry verdicts are in [the review](../reviews/REV-ERRATA-PAPER-BAKKER-KLINGLER-TSIMERMAN-20.md). The machine-readable source of record is [the errata JSON](PAPER-BAKKER-KLINGLER-TSIMERMAN-20.json).

## Sources and correction search

The complete [published paper](https://par.nsf.gov/servlets/purl/10200187) and complete [author copy of the official erratum](https://benjamin-bakker.github.io/DefArithErr.pdf) were read independently. The review records their full SHA-256 hashes. Mathematical transcriptions were checked in published page images, not inferred solely from PDF text extraction.

The [author's main-paper copy](https://benjamin-bakker.github.io/DefArith.pdf) was collated at E1–E4, E7 and E8; [arXiv v2](https://arxiv.org/pdf/1810.04801v2) was collated at E1–E4. These are targeted comparisons, not a claim to have reread all versions completely. The author/v2 basis-change line includes the condition-(3) constant C in the dependence of C″; the published line omits C. Both retain the ordered-basis problem E3.

On 23 September 2026 the [arXiv version list](https://arxiv.org/abs/1810.04801) ended at v2 (22 June 2020); [Bakker's publication list](https://benjamin-bakker.github.io/) linked the main paper and 2023 erratum; [Tsimerman's list](https://www.math.toronto.edu/jacobt/) linked the main paper. The [Crossref record for the erratum](https://api.crossref.org/works/10.1090/jams/1025) confirmed the DOI and online date 11 May 2023. Exact-title erratum/correction searches located no additional relevant correction. Direct AMS article access and Klingler's publications page were unavailable in this check. No exhaustive negative claim about the literature follows.

The previous report's statements that nothing else was corrected in print and that all other 26 findings were new are withdrawn. In particular, erratum Remark 1.1(1) supplies the right-translation transport relevant to E18, and §1.4 changes to an acting-group Hodge presentation relevant to E27. The latter does not write out the comparison with the original adjoint presentation.

## Findings

### E1 — confirmed

Theorem 4.1, JAMS p.928, proof p.929; author p.13–14. error; affects: a stated result.

Replace the whole-unit-polydisk assertion by a local assertion after shrinking to (∆*_ρ)^n for a sufficiently small 0<ρ<1, with the Hodge-compatible fixed maximal compact. In §4.1 choose such smaller charts around every point of the compactification and then a finite subcover. Do not justify the several-variable step by calling the remaining punctured annular pieces compact. This correction specifies the necessary domain change; it does not discharge the separate proof gaps recorded below.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E2 — confirmed

Lemma 4.5 proof, JAMS p.930; author p.15. gap; affects: the proof.

The induction needs bounds for the substituted functions on their actual domains. Supply a domain-transfer argument, or restate and prove the lemma for every bounded-real-width sector Σ_n^R={|x_i|<R,y_1≥…≥y_n>1}, with constants allowed to depend on R, and verify that stronger curve hypothesis in the application. The substitution z_1=mz_2+c sends Σ_(n−1)^R′ into Σ_n^(mR′+|c|). The required bounded-width Schmid/CKS/Kashiwara inputs are not verified by this review; a wider-sector formulation alone is not a completed repair.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E3 — confirmed

§4.5, JAMS p.933; author p.18. error; affects: nothing.

The ordered-basis conclusion cannot hold as printed. At a minimum it must allow finitely many permutations of e (and retain dependence on the condition-(3) constant C). The following paragraph already allows finitely many orderings. The counterexample verifies the necessity of this correction, not every estimate in the general basis-change argument.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E4 — confirmed

Appendix A.1, JAMS p.934, contrasted with A.3 p.936; author p.20–22. misprint; affects: nothing.

∂X is a real-analytic (n − 1)-manifold with corners.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E5 — confirmed

Theorem 1.1(1), JAMS p.919; Definition 2.5 and Proposition 2.7, p.924. error; affects: a stated result.

The definable structure depends on a choice of maximal compact subgroup K ⊃ M. For each such K there is a structure S_{Γ,G,M,K}, characterized by the Siegel sets associated to K. Definition 2.5 must fix K, and Proposition 2.7 holds when all Siegel sets use the same K (Erratum, Theorem 1.2(1)).

The independent verification and its limits are recorded under this ID in the review and JSON.

Already addressed in print: Erratum, J. Amer. Math. Soc. 36 (2023), DOI 10.1090/jams/1025 (author copy https://benjamin-bakker.github.io/DefArithErr.pdf), §1.1 and Theorem 1.2(1)

### E6 — confirmed

Theorem 1.1(2), JAMS p.919. error; affects: a stated result.

Restrict the theorem to the sufficient class in erratum Theorem 1.2(2): Γ′h′M′ ↦ Γφ(h′)gM with φ(Γ′)⊂Γ, φ(M′)⊂gMg⁻¹, φ(K′)⊂gKg⁻¹, and θ_(gKg⁻¹) preserving φ(g′). Do not assert that these conditions are necessary for each individual map to be definable. Hodge morphisms satisfy them by erratum Corollary 1.3.

The independent verification and its limits are recorded under this ID in the review and JSON.

Already addressed in print: Erratum, J. Amer. Math. Soc. 36 (2023), DOI 10.1090/jams/1025 (author copy https://benjamin-bakker.github.io/DefArithErr.pdf), §§1.1, 1.3 and Theorem 1.2(2)

### E7 — confirmed

§4.5, JAMS p.932; author p.17. error; affects: the proof.

Replace the citation by Bakker–Grimm–Schnell–Tsimerman, Proposition 28.1, as directed by erratum §1.5. Retain its hypotheses: reductive Q-groups H⊂G, K_H=K_G∩H(R), and forward containment of every K_H-Siegel set in finitely many G(Q)-translates of a K_G-Siegel set. Then a fixed K_G-Siegel set meets H(R) inside finitely many H(Q)-translates of a K_H-Siegel set. The forward-containment input must be checked in the application with the corrected compact data; the proposition is not an unconditional inverse-image theorem.

The independent verification and its limits are recorded under this ID in the review and JSON.

Already addressed in print: Erratum, J. Amer. Math. Soc. 36 (2023), DOI 10.1090/jams/1025 (author copy https://benjamin-bakker.github.io/DefArithErr.pdf), §1.5

### E8 — confirmed

Lemma 2.1 first proof, JAMS p.923; author §2.1. error; affects: the proof.

Remove the asserted identification by the M-invariant polynomial map. Supply a valid semialgebraic quotient argument, for example by justifying the proper-quotient theorem cited in the paper's second proof. This finding refutes the first map's injectivity, not the existence of the quotient; this review does not claim to have re-proved the external quotient theorem.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E9 — confirmed

Lemma 2.1 second proof, JAMS p.923. misprint; affects: nothing.

The ambient product is G×G.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E10 — confirmed

§2.2, JAMS p.923, equation (2.3). misprint; affects: nothing.

The displayed formula is left multiplication by p∈P.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E11 — confirmed

Theorem 1.5, JAMS p.921. misprint; affects: nothing.

Use R in the definition of H_(R,η), consistently with the quantified parameter.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E12 — confirmed

§4.2 after Remark 4.3, JAMS p.929. misprint; affects: nothing.

Refer to Theorem 1.1(1), with fixed K as in the erratum.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E13 — confirmed

Proof following Theorem 4.8, JAMS p.931. misprint; affects: nothing.

Refer to Lemma 4.7(1).

The independent verification and its limits are recorded under this ID in the review and JSON.

### E14 — rejected

§4.6 heading, JAMS p.933. misprint; affects: nothing.

No mathematical correction is established by this finding. Theorem 1.3 is the immediate input in §4.6, but Theorem 1.1 is an upstream input to its proof; the heading can describe that indirect implication.

Rejected as an established misprint. Theorem 1.3 is indeed the direct input cited by the proof of Theorem 4.12, but its proof uses Theorem 1.1. An expository heading may describe this indirect dependence. The original reason establishes a more immediate reference, not that the printed heading is erroneous. E16 remains a separate, specific mis-citation.

### E15 — confirmed

§5, JAMS p.933. misprint; affects: nothing.

Use Theorem 1.1(2), as restricted to Hodge morphisms by erratum Corollary 1.3.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E16 — confirmed

§5, JAMS p.934, definability of Φ_S. misprint; affects: nothing.

Use Theorem 1.3.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E17 — confirmed

Appendix A.3 proof of Proposition A.2, JAMS pp.935–936. gap; affects: the proof.

Choose smaller semialgebraic corner boxes whose closures lie inside larger analytic charts. On the compact matching graph for two closed boxes, cover by finitely many neighborhoods carrying analytic transition extensions, restrict each to bounded boxes, and use finite unions and projections to obtain definable overlaps and transitions. This is sufficient control; boundedness of the coordinate domains alone does not establish compatibility.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E18 — confirmed

§3.2 reduction to g=e, JAMS p.927. gap; affects: the proof.

Keep φ defined over Q. First map into the target with M_g=gMg⁻¹ and K_g=gKg⁻¹, then use right translation hM_g↦hgM. Erratum Remark 1.1(1) supplies the transport: if S is a Siegel set for K_g then Sg is one for g⁻¹K_g g=K. This corrects the real-g reduction without conjugating φ out of the category of Q-groups; the remaining morphism theorem still uses erratum Theorem 1.2(2).

The independent verification and its limits are recorded under this ID in the review and JSON.

Already addressed in print: Official erratum, J. Amer. Math. Soc. 36 (2023), DOI 10.1090/jams/1025, Remark 1.1(1): right translation transports Siegel sets with the maximal compact conjugated. This supplies the required real-g reduction.

### E19 — confirmed

§3.2 surjective case, JAMS p.928. error; affects: the proof.

Do not identify the quotient by an arbitrary compact M′ with the product of quotients by its intersections with the normal factors. Supply an argument for the compact-stabilizer quotient map (for example factoring through the full preimage of the target stabilizer), in addition to the finite-index arithmetic step. This review verifies the displayed product's failure, not a complete replacement proof.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E20 — confirmed

Lemma 4.7(1),(2) and Theorem 4.8(1),(2), JAMS p.931. error; affects: nothing.

Require u≠0 for positive two-sided monomial comparisons.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E21 — confirmed

Lemma 4.7 proof, JAMS p.931, definition of B. misprint; affects: nothing.

Call B(u,v)=Q(u,conj v) a (−1)^k-Hermitian sesquilinear form: it is skew-Hermitian in odd weight, and i^kB is Hermitian. Keep the phase conventions in the determinant/Hodge-metric computation; the printed equation (4.4) already contains its phase factor and is not being declared false here.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E22 — confirmed

Lemma 4.5 proof, JAMS p.930, finite difference F_m. misprint; affects: nothing.

This normalization extracts (−1)^r₁ times the leading coefficient; either include that factor in the next identity or use (−1)^(r₁−i) in the definition.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E23 — confirmed

§3.1 first paragraph, JAMS p.926. gap; affects: the proof.

Distinguish the quotient presentation from a coordinate atlas. Use open pieces where needed, and supply a finite local slice/chart refinement compatible with the semialgebraic quotient construction. Finite overlap does not make the map from an entire Siegel piece injective. This records a missing chart-construction justification, not a counterexample to the fixed-K definable-structure theorem.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E24 — confirmed

§3.1, JAMS p.926, two occurrences. misprint; affects: nothing.

Use cl(S_i).

The independent verification and its limits are recorded under this ID in the review and JSON.

### E25 — confirmed

Appendix A.2, JAMS p.935, mixed atlas transitions. misprint; affects: nothing.

Use ψ_j⁻¹∘φ_i on the coordinate overlap.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E26 — confirmed

§4.5, JAMS p.932 first line and p.933 claim. misprint; affects: nothing.

Use S_H^n and V_Q, respectively.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E27 — confirmed

§1.3 and §4.2, JAMS pp.920 and 928. gap; affects: the proof.

Use a group acting on the actual rational variation, as the Hodge-manifold presentation in erratum §1.4 does by taking the Q-Zariski closure of t(S¹) inside GL(V_R). If retaining the original adjoint presentation, explicitly compare the arithmetic quotients, monodromy and period maps with that acting group. The erratum supplies the change of presentation, but this review does not infer an unwritten comparison from it.

The independent verification and its limits are recorded under this ID in the review and JSON.

Already addressed in print: Official erratum, J. Amer. Math. Soc. 36 (2023), DOI 10.1090/jams/1025, §1.4 changes the Hodge-manifold presentation to a Q-group inside GL(V_R). It does not spell out the comparison with the original adjoint presentation.

### E28 — confirmed

§5, JAMS pp.933–934, definition of the target Hodge locus. error; affects: nothing.

For the exceptional Hodge locus, use proper Mumford–Tate-drop subdata relative to the generic Hodge datum, not the union of every special image including the identity. Supply the correspondence with exceptional Hodge tensors. The proof's stronger assertion that the inverse image of each special subvariety is algebraic is compatible with this correction; Theorem 1.6 is not refuted.

The independent verification and its limits are recorded under this ID in the review and JSON.

### E29 — confirmed

Theorem 4.12 and proof, JAMS p.933. gap; affects: the proof.

Restrict the displayed argument to smooth S, or add the singular-source reduction and algebraicity-descent argument (for instance using a resolution or stratification with the required analytic comparison). This is a missing step at the stated generality, not a counterexample to Borel's algebraicity theorem.

The independent verification and its limits are recorded under this ID in the review and JSON.

## What these verdicts do not establish

For E2, a wider-sector statement still needs the stronger curve estimates in the application. E7 retains the forward-containment hypotheses of BGST Proposition 28.1. E8 does not re-prove the quoted external quotient theorem. E19 and E23 identify missing quotient/chart arguments rather than supplying full replacements. E27 does not silently identify an adjoint group with its central cover on the original variation. E28 does not independently prove the tensor/Mumford–Tate correspondence. E29 does not claim a completed singular-source descent proof.

These are limitations of the repairs and downstream extraction, not unreviewed source findings: section 18 permits an entry to state what is missing. The original extraction and its gap records remain untouched.

## Audit and checks

The JSON's `independentReviewAudit` records the input commit and fields amended. The original full entries and previous search assertions remain available at that commit; no historical statement is silently presented as a fresh check.

Checks: `scripts/check_errata.py`; intake's `check-files` on the three deliverables and this review's handoff; the 65 tests in `test_check_errata.py`, `test_errata.py`, `test_source_issues.py`, `test_intake.py`, and `test_issues.py`; and standard-library-only finite diagnostics for the explicit examples. Numerical sampling is not used in place of the algebraic/analytic arguments in the review. No Lean file was changed or compiled.
