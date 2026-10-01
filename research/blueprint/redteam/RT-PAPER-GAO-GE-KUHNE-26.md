# Red team: Gao–Ge–Kühne, The Uniform Mordell–Lang Conjecture

Issue [#4285](https://github.com/CBirkbeck/tauceti-explorer/issues/4285). Codex, session `codex-rtOQ9t`, 1 October 2026. **Complete: six findings, three high and three medium.** Independent verification is still required. This report does not allege that the main uniform Mordell–Lang or Bogomolov theorems are false.

The target is the accepted extraction `PAPER-GAO-GE-KUHNE-26` at commit `85988fb91ac844f6d168fa73288f5906a3ebeb32`. Claude Code `cc-fb70e5` wrote it and Claude Code `cc-7b31c4` reviewed it; this worker did neither. Only the two red-team deliverables are changed.

## Source and scope

I read the complete version of record: Ziyang Gao, Tangli Ge and Lars Kühne, *The Uniform Mordell–Lang Conjecture*, Publications mathématiques de l’IHÉS **143** (2026), 189–235, [published PDF](https://pmihes.centre-mersenne.org/item/10.5802/pmihes.26.pdf). Its SHA-256 is `4ee5a38b327807289885a1d7292bddc3341b7fc3e0aa8a3682d995d13237834f`, matching the extraction. The article is CC BY 4.0. All source-error findings below concern this published text. There are 48 PDF pages including one cover page: PDF page 2 is printed page 189. I checked rendered pages 214, 215, 219, 220, 224 and 225, including the actual inequality signs.

I read all 93 items, six routes and their briefs, 17 prerequisite entries, 13 source issues, the extraction reader and both review records. The primary proof coverage included the polarization and degree preliminaries, Hilbert families, Betti non-degeneracy, both height estimates, the constant case split, specialization and finite-rank passage, coset decomposition, the Bogomolov induction and the complete Rémond appendix. The findings distinguish an incorrect planned statement, a missing construction, a false acceptance example, a false-positive source issue, and two omitted source-proof corrections.

Additional reads were limited: [Kühne v4](https://arxiv.org/pdf/2101.10272v4), pp.2–4 and selected passages around Lemma 23/end of §3; the [54-page Gao author copy](https://ziyangjeremygao.github.io/articles/UML.pdf), the corresponding passages on pp.31–32 and 43–44; and the complete [two-page Gao Betti-rank erratum](https://ziyangjeremygao.github.io/articles/ErrataBettiRank.pdf). The latter changes the fibre-generation hypothesis of the supplier criterion, which item /50 already retains. It is not a new defect in GGK. Supplier proofs outside these passages were not re-certified. In particular, the 2024 Kühne revision changes the context/numbering around Lemma 23, so this report does not pretend that its lemma number alone supplies the older quoted formulation.

## Findings

### RT-PAPER-GAO-GE-KUHNE-26/1 — high: Endomorphism stability does not preserve the rank

**Where.** research/blueprint/papers/PAPER-GAO-GE-KUHNE-26.result.json items /4 and /85; route 1 to HeightsRationalPointsAndObstructions:RP.5 and route 6 to HeightsRationalPointsAndObstructionsPartII

Item /4 adds a false equivalence to finite rank: a rank-ρ subgroup can be put in the division hull of an End(A)-stable finitely generated subgroup of the same rank ρ. Item /85 repeats this assertion in the finite-rank reduction. This copies an unrecorded error from the published proof.

**Evidence.** Published §7.3, p.224, says “we may choose such a Γ₀ satisfying that Γ₀ = End(A) · Γ₀”, after specifying rank ρ. Take A=E×E over C, a nontorsion P∈E(C), and Γ=Z(P,0), of rank 1. If Γ lies in the division hull of a rank-1 Γ₀, then Γ₀ contains (nP,0) for some n>0. End(A)-stability under the factor swap forces (0,nP)∈Γ₀. These two points are Z-linearly independent since P is nontorsion, contradicting rank 1. The same sentence persists in the author copy, p.43.

**Repair.** Remove End(A)-stability from /4 and /85, retaining the rank-preserving division-hull construction. Lemma 7.3 is stated for arbitrary finitely generated Γ, so its application to [n]^{-1}Γ₀ needs no End(A)-stability. Use n≥1 (or the cofinal factorial system) and the exact sequence with finite A[n] to retain finite generation and rank ρ. Add a sourceIssues error for published p.224, affecting the proof, with the version and correction-search record in this report. Explain the deletion in the reader and uniformity brief; do not silently replace ρ by the rank of End(A)Γ₀.

### RT-PAPER-GAO-GE-KUHNE-26/2 — high: Coset representatives require the projected subgroup

**Where.** research/blueprint/papers/PAPER-GAO-GE-KUHNE-26.result.json item /89 and route 6, Lemma 7.4 proof; item /88 supplies X_B

The planned passage from the off-Ueno count to the coset count omits the finite-rank subgroup needed after choosing a complementary abelian subvariety. The published proof claims representatives in X_B°∩Γ, and bounds n_B by that intersection; the representative generally leaves Γ. The sourceIssues list records no repair.

**Evidence.** Published Lemma 7.4, p.225 immediately after (7.12), states “each x_{B,j} can be chosen to be in X_B°(F) ∩ Γ”. Counterexample satisfying the preceding generation reduction: let C be a smooth genus-2 curve, J its Jacobian, C′ a translate of its Abel–Jacobi image avoiding 0, A=E×J and X=E×C′. Then X generates A. Take B=E×{0}, B⊥={0}×J, P∈E(C) nontorsion, c∈C′, and Γ=Z(P,c). Here B is the only positive-dimensional maximal coset direction, X_B=X_B°={0}×C′, and Γ∩B⊥={0}, so X_B°∩Γ is empty. Yet (P,c)∈X∩Γ, requiring the coset E×{c}. The same claim occurs in the author copy, p.44.

**Repair.** For the addition isogeny f:B×B⊥→A use Γ_B=pr₂(f^{-1}(Γ))⊆B⊥(F), rather than Γ∩B⊥. Its rank is at most ρ: f^{-1}(Γ) has finite kernel over Γ, and projection cannot increase rational rank. Every Γ-point on a B-coset yields a representative in X_B∩Γ_B; maximality places it off the Ueno loci of the components as in the existing geometric argument. Apply Theorem 1.1′ to X_{B,k} and Γ_B and retain the uniform exponent. Add this construction/rank lemma to /89 or a separately routed item in the existing uniformity Part II, update the reader/brief, and record the published proof error under sourceIssues. No new roadmap is needed; this is not a claim that Lemma 7.4 or Theorem 1.1 is false.

### RT-PAPER-GAO-GE-KUHNE-26/3 — high: The relative elliptic diagonal is degenerate

**Where.** research/blueprint/papers/PAPER-GAO-GE-KUHNE-26.result.json route 5, AbelianSchemesBettiMapsPartII brief, Acceptance; items /47–/48

The Betti-map Part II requires a false positive acceptance example: “the diagonal of a non-isotrivial elliptic surface over a curve is non-degenerate”. For the relative diagonal Δ(E)⊂E×_S E, non-isotriviality does not overcome the rank obstruction.

**Evidence.** Item /48 correctly requires generic real Betti rank 2 dim X. On a simply connected open of a smooth base curve S, write the Betti map of E→S as b:E→(R/Z)^2. On the relative diagonal the product Betti map is (b,b), with differential rank at most 2. But dim_C Δ(E)=2, so non-degeneracy requires rank 4. Equivalently, the restricted product Betti form is 2ω_E and its square vanishes. The supplier definition is explicitly given in Kühne, arXiv:2101.10272v4, p.2; GGK uses the same non-degeneracy in §3.3, p.202. Restricting an elliptic surface to its smooth abelian-scheme locus does not alter the obstruction.

**Repair.** Change the relative diagonal to a negative acceptance example and explicitly say total complex dimension, not fibre dimension, enters the rank condition. Keep the valid positive example of a subvariety of a single polarized abelian variety (base a point), and the negative torsion-section example over a positive-dimensional base. If an additional varying positive example is wanted, specify and prove its rank hypotheses rather than using non-isotriviality alone. Update the binding route brief and its reader explanation; this is an extraction error, not a source error.

### RT-PAPER-GAO-GE-KUHNE-26/4 — medium: Retract E8: the maximum is sufficient

**Where.** research/blueprint/papers/PAPER-GAO-GE-KUHNE-26.result.json sourceIssues /E8, item /70, route 6 final constant instruction; research/blueprint/papers/PAPER-GAO-GE-KUHNE-26.md source slips and review summary

E8 is a false positive: the published c₂=max(c₂′,c₂″) in Proposition 6.1 works. The extraction and its review incorrectly say that a sum is necessary because the exceptional locus must be a union.

**Evidence.** Published (6.4), p.219, and the two cases on pp.219–220: put H=max(1,h_Fal(A)), B=max(1,2c₃′/c₁′), and c₁=min(c₃″/B,c₁′/2). H is fixed for all points on A. If H≤B, every point of (6.1) has height≤c₃″, hence the whole set lies in the single exceptional locus from (6.3). If H>B, c₁H≤c₁′H/2≤c₁′H−c₃′, so the whole set lies in the single locus from (6.2). Choose that locus in each case; its degree is strictly less than the displayed maximum. Also, the two height-sublevel sets for a fixed A are nested.

**Repair.** Retract E8 with a correction note and reconcile the old confirmed-review summary, preserving the historical identifier. Restore /70’s proof explanation to the casewise choice of one exceptional locus and c₂=max(c₂′,c₂″). Remove E8 from the route instruction to apply corrected source constants, and correct the reader’s assertion that a sum is needed. A sum is a permissible weaker bound, but there is no published error to repair here.

### RT-PAPER-GAO-GE-KUHNE-26/5 — medium: Record the reversed small-height signs

**Where.** research/blueprint/papers/PAPER-GAO-GE-KUHNE-26.result.json sourceIssues; items /64 and /68; route 6, Proposition 5.2 Step 4

The extraction silently repairs two reversed height inequalities in the published equidistribution step. Item /64 correctly gives a small-height condition, but sourceIssues omits the discrepancy, despite explicitly recording neighbouring Step 5 slips.

**Evidence.** Published p.215, text immediately after (5.8) and after (5.9), prints respectively ĥ(x)≥δ_{ε,1} and ĥ(x′)≥δ_{ε,2}. The subsequent claim says at least one height is ≥δ=min(δ_{ε,1},δ_{ε,2}). Its contradiction proof assumes both heights are <δ and then applies (5.8) and (5.9); the printed ≥ hypotheses do not permit those applications. Both relation signs were checked on the rendered published page, and the author copy p.32 has the same signs. Item /64 already states ĥ(x)<δ, as required by this proof.

**Repair.** Add a sourceIssues misprint entry for both signs on published p.215, recording <δ in the equidistribution hypotheses (or ≤ after shrinking δ). Keep the ≥ alternatives in the subsequent claim unchanged. Cross-reference the record from /64, /68 and the reader. Classify its effect as the proof, not a failure of the main theorems, and use the version/correction-search information in the report.

### RT-PAPER-GAO-GE-KUHNE-26/6 — medium: Normalize the pullback by the generic degree

**Where.** research/blueprint/papers/PAPER-GAO-GE-KUHNE-26.result.json sourceIssues; item /68 and route 6, Proposition 5.2 Steps 2–4

The extraction passes over a missing degree normalization when Step 4 compares its two equidistribution integrals with (5.7). For an ordinary pullback of top-degree Betti forms, f₁=f₂∘D does not identify the integral of f₁ against D*μ₂ with the integral of f₂ against μ₂ unless deg D=1.

**Evidence.** Published p.213 identifies generic D-fibres with {0}×Stab(X_η)^m-orbits; a finite stabilizer need not be trivial. On the finite étale locus of p.214 set d=deg D. For the supported test functions there, change of variables gives ∫f₁ D*μ₂=d∫f₂ μ₂. Equation (5.7) separates ∫f₁ μ₁ from ∫f₁ D*μ₂, whereas the last display on p.215 only compares ∫f₁ μ₁ with ∫f₂ μ₂. The discrepancy is independent of the preceding reversed signs. For d=2, I₁=I₂=1 and ε=1/4 satisfy |I₁−I₂|≤2ε while |I₁−dI₂|>2ε. Nontrivial finite stabilizers are allowed, e.g. the connected smooth ample divisor [n]^{-1}C on a complex abelian surface for a smooth ample C and n>1; its stabilizer contains A[n].

**Repair.** Record the omitted normalization as a sourceIssues proof gap on pp.213–215. Set ν=(1/d)D*μ₂ on each irreducible family component, and use ν throughout the separation argument (5.7). Step 2 proves non-proportionality, so it still separates μ₁ from ν; averaging over the finite stabilizer still preserves this. Then ∫f₁ν=∫f₂μ₂ is exactly the comparison Step 4 needs. Make the degree and normalization explicit in /68’s proof outline and the uniformity brief/reader. Alternatively define a normalized pullback convention explicitly and use it consistently; the published top-form pullback argument does not state such a convention. Do not assume a trivial stabilizer or change the equilibrium measures to arbitrary scalings.

## Details that keep the repairs honest

For finding /1, the original finite-rank construction itself is sound. Choose a rational basis of `Γ⊗Q`, take representatives in Γ, and let Γ₀ be their integer span. For each γ∈Γ, clearing rational denominators puts a multiple of γ in Γ₀ up to torsion; a further multiple kills that torsion. Thus Γ is contained in the division hull of Γ₀. For positive n, multiplication by n gives an exact sequence from `[n]⁻¹Γ₀` onto Γ₀ with finite kernel A[n], hence finite generation and the same rank. The cofinal sequence `[n!]⁻¹Γ₀` makes the filtered-union argument transparent. The endomorphism-stability clauses can simply be deleted. If another argument actually needs an End(A)-stable enlargement, its rank cost must be recorded separately.

For finding /2, the counterexample is inside the reduced case in the paper: `C′−C′` generates J, hence `X−X` generates E×J. A positive-dimensional coset direction in X projects to a coset contained in C′. A genus-2 curve has no positive-dimensional abelian coset, so this projection is zero and B is maximal. The group Γ meets B⊥ only at zero because P is nontorsion; zero does not lie on C′. On the other hand the corrected group Γ_B contains `(0,c)`. The repair therefore changes an essential group parameter, not just the notation for a representative. Since the addition map has finite kernel, the repair does not increase the rank exponent. No assertion about the validity of the separately cited Rémond source is made without reading that source; the error identified is the sentence in GGK.

For finding /3, locally the differential on the diagonal has the form

```text
[ 1 0 0 0 ]
[ 0 1 0 0 ]
[ 1 0 0 0 ]
[ 0 1 0 0 ]
```

in real Betti/base coordinates. It has rank 2, whereas the complex surface requires rank 4. The obstruction holds for every smooth elliptic scheme over a curve, whether isotrivial or not. The two other acceptance examples in the route can remain, with the base hypotheses stated: a subvariety of one polarized abelian variety is non-degenerate, and a torsion section over a positive-dimensional base is degenerate.

For finding /4, both comparisons include the boundary `H=B`: the first gives `c₁H≤c₃″`. In the second case, `H>B≥2c₃′/c₁′` gives `c₁′H−c₃′≥c₁′H/2`. Thus a single exceptional locus suffices for every point on the fixed A. The sum proposed by the extraction also gives a valid, weaker constant, but does not establish an error in the printed maximum. Its old confirmed status must not continue to feed a public errata register as a valid source error.

For finding /6, use ordinary pullback of the smooth top forms on the finite étale locus, which is the setting chosen in Step 3. Change of variables gives the factor d even when the underlying equilibrium measure is not assumed to have any particular total mass. Thus the finding does not depend on a probability-normalization convention on a noncompact total space. Step 2 proves **non-proportionality**, which is stronger than the unnormalized inequality it then uses; this is precisely why replacing `D*μ₂` with `(1/d)D*μ₂` repairs the proof. Average the separating test function over the finite stabilizer to retain descent to f₂. The geometric degree is constant on the chosen irreducible component/locus and may be fixed there. Neither rescaling the actual equilibrium measure in the equidistribution theorem nor assuming the stabilizer trivial is justified.

## Correction search and proposed source records

On 1 October 2026 I checked the [publisher article page](https://pmihes.centre-mersenne.org/articles/10.5802/pmihes.26/), the [arXiv history](https://arxiv.org/abs/2105.15085) (latest listed v4, 26 March 2026), [Gao’s publications page](https://ziyangjeremygao.github.io/) and its linked author copy, and searched the title with erratum/correction terms. No linked correction of the four published proof issues below was found. Kühne’s publications page appeared in search results, but its direct page request redirected to a login page; that failed request is not evidence that it has no correction. Gao’s page lists an erratum for his separate Betti-rank paper, read as described above. No authors were contacted.

The author-copy SHA-256 is `4927ac4beac9d250c0f5c09ad2a0ded5abe42567f9f222ed46d66e20978d9c4a`; it contains all four corresponding problems in the passages inspected. This is not a complete collation of that copy or of all arXiv versions. The main findings remain tied to the version of record. A fixer should add these records only after independent verification, with the published source URL/hash/read date and the search list above; “new” means no correction found in this scoped search, not a priority claim.

| Finding | Published locator | Proposed source kind | Effect |
|---|---|---|---|
| /1 | §7.3, p.224, Γ₀ and End(A) | error | the proof; remove unused stability |
| /2 | Lemma 7.4, p.225, after (7.12) | error | the proof; use Γ_B |
| /5 | Proposition 5.2, p.215, after (5.8) and (5.9) | misprint | the proof; reverse only these two hypotheses |
| /6 | Proposition 5.2, pp.213–215, (5.7) and its final comparison | gap | the proof; insert 1/deg D |

Finding /3 belongs only to the extraction, and /4 retracts an existing source allegation. Keep their provenance separate. None requires withdrawing a main theorem. The report does not endorse the historical review’s blanket confirmation of all thirteen source issues; E8 is explicitly rebutted here. Other recorded repairs were checked against the displayed arguments, without treating the audit as a new independent proof of every external theorem cited by the article.

## Library and ownership audit

The three `library` items have real suppliers at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: `AbelianVariety` in `AbelianVariety/Basic.lean:94`, `InvertibleSheaf` in `LineBundle/Basic.lean:78`, and `AbelianVariety.IsIsogeny` in `AbelianVariety/Isogeny.lean:61`. I read those declarations and their relevant surrounding interfaces. The notes distinguish the objects already available from missing Picard, duality and isogeny-degree theory. The elliptic `neronTatePairing` is not an arbitrary-dimensional canonical height.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, `Projectivization.logHeight` requires `AdmissibleAbsValues`; I also read the number-field instance. The existing correction to item /55 is retained: this is not yet the absolute projective height on Qbar with field-extension compatibility. This report makes no new library-absence finding.

The assembled atlas has 2,907 stages and 8,322 stage edges. I read the fifteen distinct stages named by planned items and source routes, and their reviewed library coverage: A2/A3/A5, R09.1/R09.2, R35.3–R35.5, RP.0/RP.5, M5/M6, SF.0/SF.5 and C5. I additionally read DY.4, TB.6, C0/C4 and LD.6 as named suppliers. The four source routes and common Part II ownership remain appropriate. Every one of the 74 missing items occurs in exactly one route; all referenced source/planned stage ids exist. The two Part II ids are shared with other accepted extraction briefs; no independent replacement is proposed. Draft-roadmap and packet searches were included, so an unassembled draft was not mistaken for a missing owner. The imported general equidistribution machinery remains distinct from the family theorem and its Betti inputs.

The affected work stays with RP.5 for finite-rank groups and coset geometry, `AbelianSchemesBettiMapsPartII` for the Betti acceptance example, and `HeightsRationalPointsAndObstructionsPartII` for the uniformity proof, group transport and source corrections. A fixer should edit the extraction and its reader/briefs, and follow the protocol’s normal handoff to the owning blueprint/design job. Do not edit campaign or atlas data directly. Cited supplier results remain legitimate single extraction items under §16; lack of a supplier’s full proof closure or blueprint API is not a finding.

## Validation and handoff

The existing extraction passes `scripts/check_paper.py`. Direct diagnostics passed 135 rational cases for the constant split, checked the displayed diagonal matrix has rank 2, checked the endomorphism swap yields two independent generators, and showed why the unnormalized degree-2 integral inequality does not contradict equality of the normalized comparisons. The mathematical arguments above are the evidence; these diagnostics are consistency checks.

Validation passed: `scripts/check_redteam.py` on the result; `research/blueprint/intake.py check-files` on both deliverables (2 files, 0 problems); and `git diff --cached --check`. No Lean file is a deliverable; no Lean build, cache download or language server was run. All evidence and repairs needed by the verifier are in these two files; scratch PDFs and extracts can be removed after the pull request opens.
