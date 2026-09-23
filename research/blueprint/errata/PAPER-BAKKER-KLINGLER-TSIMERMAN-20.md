# Mistakes in Bakker–Klingler–Tsimerman, *Tame topology of arithmetic quotients and algebraicity of Hodge loci*

Job ERRATA-PAPER-BAKKER-KLINGLER-TSIMERMAN-20. Worker: Claude Code, session `cc-442dc5`, 23 September 2026. The findings are in `PAPER-BAKKER-KLINGLER-TSIMERMAN-20.json` beside this file.

**Paper and version read.** B. Bakker, B. Klingler and J. Tsimerman, J. Amer. Math. Soc. 33 (2020), 917–939, DOI 10.1090/jams/952.
- The version read is the typeset published text, the NSF PAR copy (23 pages, SHA-256 `b7cf4579…`).
- The printed prose of every finding was found in its text layer.
- The formula-only quotes (for example in E8, E19 and E22) rely on the extraction's page-image checks.

**Earlier work.** The extraction PAPER-BAKKER-KLINGLER-TSIMERMAN-20 (complete) recorded E1–E29. They are kept here with everything they say.

**Existing corrections.** The authors' official erratum (J. Amer. Math. Soc., DOI 10.1090/jams/1025, issued May 2023) corrects E5–E7: the dependence of the definable structure on the maximal compact K, the definability of morphisms, and the Siegel-set citation. Nothing else is corrected in print:
- no other correction is registered with Crossref;
- arXiv 1810.04801 stops at v2 (June 2020).

The other twenty-six findings are new.

**Effect on the main results.** The o-minimal definability of period maps and the algebraicity of Hodge loci stand. Several findings still reach stated results or proofs:
- **E1 (a stated result).** Theorem 4.1's definability holds only after shrinking the punctured polydisk. The extraction gives a counterexample built from exp(−(1+z)/(1−z)) with trivial monodromy.
- **E5 and E6 (stated results).** These need the erratum's fixed maximal compact.
- **Proof steps with repairs:**
  - E2: sectors that are too narrow for the substitution in Lemma 4.5;
  - E8: the first proof of Lemma 2.1, where invariant polynomials do not separate M-cosets;
  - E19: the product decomposition of compact stabilizers;
  - E17, E18, E23, E27, E29: charts, the reduction to g = e, the choice of representation, and smoothness of S in Theorem 4.12.
- **The rest are misprints or harmless slips.**

## The findings

- **E1** (error; affects a stated result), Theorem 4.1, JAMS p.928, proof p.929. Definability holds only after shrinking. For some radius 0 < ρ < 1, the restriction of Φ to (∆*_ρ)^n is R_an,exp-definable, and then for every ρ < 1 by compactness of the remaining annular pieces. The reduction in §4.1 must use charts whose shrunken polydisks still cover the compactification.
- **E2** (gap; affects the proof), Lemma 4.5 proof, JAMS p.930. State the lemma, and verify its curve hypothesis, on wider sectors Σ_n^R={|x_i|<R,y₁≥⋯≥y_n>1} for every R, with constants depending on R. The substitution maps Σ_(n−1)^R′ into Σ_n^(mR′+|c|). The application needs original-source bounded-real-width uniformity for Schmid Corollary 5.29 and the CKS/Kashiwara norm estimates; G3 records that this is still unverified. The R-quantifier of the target Theorem 1.5 is not evidence for its prerequisites.
- **E3** (error; affects nothing), §4.5, JAMS p.933. Condition (2), the ordering b(e_i) < C b(e_j) for i < j, transfers only up to a permutation of e. Conclude that b is (σe, C″)-reduced for some permutation σ, which is one of finitely many.
- **E4** (misprint; affects nothing), Appendix A.1, JAMS p.934, contrasted with A.3 p.936. ∂X is a real-analytic (n − 1)-manifold with corners.
- **E5** (error; affects a stated result), Theorem 1.1(1), JAMS p.919. The definable structure depends on a choice of maximal compact subgroup K ⊃ M. For each such K there is a structure S_{Γ,G,M,K}, characterized by the Siegel sets associated to K. Definition 2.5 must fix K, and Proposition 2.7 holds when all Siegel sets use the same K (Erratum, Theorem 1.2(1)). Corrected in the official erratum (2023).
- **E6** (error; affects a stated result), Theorem 1.1(2), JAMS p.919. Only morphisms compatible with the chosen maximal compacts are definable: maps Γ′h′M′ ↦ Γφ(h′)gM with φ(Γ′) ⊂ Γ, φ(M′) ⊂ gMg^{−1}, φ(K′) ⊂ gKg^{−1}, and θ_{gKg^{−1}} preserving φ(g′) (Erratum, Theorem 1.2(2)). Corrected in the official erratum (2023).
- **E7** (error; affects the proof), §4.5, JAMS p.932. Cite Bakker–Grimm–Schnell–Tsimerman, Proposition 28.1, instead. [B-HC62, 7.5] concerns real Siegel sets and does not give this rational statement. Corrected in the official erratum (2023).
- **E8** (error; affects the proof), Lemma 2.1 first proof, JAMS p.923. The displayed invariant-polynomial map need not separate right M-cosets. Use the second, proper semialgebraic-quotient proof, with its external quotient theorem explicitly imported.
- **E9** (misprint; affects nothing), Lemma 2.1 second proof, JAMS p.923. The ambient product is G×G.
- **E10** (misprint; affects nothing), §2.2, JAMS p.923, equation (2.3). The displayed formula is left multiplication by p∈P.
- **E11** (misprint; affects nothing), Theorem 1.5, JAMS p.921. Use R in the definition of H_(R,η), consistently with the quantified parameter.
- **E12** (misprint; affects nothing), §4.2 after Remark 4.3, JAMS p.929. Refer to Theorem 1.1(1), with fixed K as in the erratum.
- **E13** (misprint; affects nothing), Proof following Theorem 4.8, JAMS p.931. Refer to Lemma 4.7(1).
- **E14** (misprint; affects nothing), §4.6 heading, JAMS p.933. Theorem 1.3 is the direct period-map input in the proof.
- **E15** (misprint; affects nothing), §5, JAMS p.933. Use Theorem 1.1(2), as restricted to Hodge morphisms by erratum Corollary 1.3.
- **E16** (misprint; affects nothing), §5, JAMS p.934, definability of Φ_S. Use Theorem 1.3.
- **E17** (gap; affects the proof), Appendix A.3 proof of Proposition A.2, JAMS pp.935–936. Choose smaller semialgebraic corner boxes whose closures lie inside larger analytic charts. Prove definability of the compact matching graph and cover it by finitely many neighborhoods of analytic transition extensions. Mere boundedness of the smaller domains is insufficient.
- **E18** (gap; affects the proof), §3.2 reduction to g=e, JAMS p.927. Keep the rational homomorphism φ unchanged and factor through compact data M_g=gMg⁻¹, K_g=gKg⁻¹ in the target, followed by right translation by g. Justify transport of the fixed-K quotient structures.
- **E19** (error; affects the proof), §3.2 surjective case, JAMS p.928. A product decomposition of the semisimple group does not decompose an arbitrary compact stabilizer. Supply a compact-stabilizer quotient adapter in addition to the finite-index arithmetic step.
- **E20** (error; affects nothing), Lemma 4.7(1),(2) and Theorem 4.8(1),(2), JAMS p.931. Require u≠0 for positive two-sided monomial comparisons.
- **E21** (misprint; affects nothing), Lemma 4.7 proof, JAMS p.931, definition of B. B(u,v)=Q(u,conj v) is (−1)^k-Hermitian in weight k. For odd weight it is skew-Hermitian; i^kB is Hermitian. Retain phase factors in all determinant and Hodge-metric formulas.
- **E22** (misprint; affects nothing), Lemma 4.5 proof, JAMS p.930, finite difference F_m. This normalization extracts (−1)^r₁ times the leading coefficient; either include that factor in the next identity or use (−1)^(r₁−i) in the definition.
- **E23** (gap; affects the proof), §3.1 first paragraph, JAMS p.926. Choose open buffered pieces and establish a finite local slice/chart refinement after the finite proper relation construction. Do not identify entire Siegel pieces with injective coordinate charts.
- **E24** (misprint; affects nothing), §3.1, JAMS p.926, two occurrences. Use cl(S_i).
- **E25** (misprint; affects nothing), Appendix A.2, JAMS p.935, mixed atlas transitions. Use ψ_j⁻¹∘φ_i on the coordinate overlap.
- **E26** (misprint; affects nothing), §4.5, JAMS p.932 first line and p.933 claim. Use S_H^n and V_Q, respectively.
- **E27** (gap; affects the proof), §1.3 and §4.2, JAMS pp.920 and 928. Use a group that acts on the variation's rational representation, or explicitly pass to a faithful adjoint/central-cover representation and compare the resulting arithmetic quotients and period maps.
- **E28** (error; affects nothing), §5, JAMS pp.933–934, definition of the target Hodge locus. For the exceptional locus use the proper Mumford–Tate-drop subdata, excluding the generic identity image. Establish its correspondence with exceptional tensors.
- **E29** (gap; affects the proof), Theorem 4.12 and proof, JAMS p.933. Either restrict this proof to smooth S or supply algebraicity descent through a resolution/stratification and the necessary singular-source analytic comparison.
