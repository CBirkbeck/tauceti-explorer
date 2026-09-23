# REV-PAPER-BOXER-CALEGARI-GEE-PILLONI-25 — review of the extraction of Boxer–Calegari–Gee–Pilloni, *Modularity theorems for abelian surfaces*

**Verdict: accept. All 35 routes accepted. No missing mathematics found. Of the 74 recorded mistakes, 71 are confirmed — one of them only after correcting its quotation — and 3 are rejected; one further mistake is added by this review.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Extraction under review: Codex, session `codex-c83e7a`, issue #2166, PR #2268 — 595 items, 35 routes, 74 `sourceIssues`, status `complete`. I did not write it and contributed nothing to it.

Source: [arXiv:2502.20645v1](https://arxiv.org/abs/2502.20645), 230 pp., SHA-256 `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`, retrieved 2026-09-23, together with its LaTeX source from `arxiv.org/e-print/2502.20645v1`. There is no journal version. Library baseline: Mathlib `082e2d3` and Tau Ceti `f790474`, both checked out locally at exactly those commits.

## The numbering, and why it had to be reconstructed

Everything in this paper shares the `subsubsection` counter: every theorem environment, every plain `\subsubsection` heading, and — the trap — 93 numbered displays produced by the authors' own macros `\numequation`, `\numalign`, `\nummultline`, `\numfigure`, `\numtable` and `\ssinc`, each of which does `\addtocounter{subsubsection}{1}`. A separate "a" family is numbered by `subsection`, and `ithm` is independent and prints Theorems A and B. Simulating all of this from the source gives **617 numbered objects**: 119 Lemma, 115 Remark, 93 display, 80 subsubsection, 70 Definition, 52 Theorem, 50 Proposition, 20 Corollary, 8 Example, 5 Hypothesis, 4 Table, 1 Claim. The reconstruction agrees with the PDF at every probe I made — 1.8.6 a display, 1.8.8 a heading, 1.8.10 a definition, 1.8.11 a remark, 2.2.31 a definition, 2.3.33 a corollary, 5.1.1 a definition, 7.2.1 a hypothesis, 10.4.1 a lemma — which is what makes the coverage and locator checks below worth anything.

## 1. Items and coverage

152 numbered objects appear in no item locator. **Every one of them resolves**, so no mathematics is missing:

- **Theorems 4.1.6, 4.1.11 and Corollary 4.1.14** are overview restatements — the source marks them as such, `\begin{thm}[Theorems \ref{thm-coho-amplitudeHC}, \ref{coro-vanishingThm}, \ref{thm-bounds-on-slopes}]` and `\begin{cor}[Corollary \ref{coro-simplification-anti}]` — and their originals are all covered: 4.6.45 (2 items), 4.6.58 (2), 4.6.60 (1), 4.7.1 (3), 4.7.3 (2), 4.7.5 (2).
- **Theorems A and B** are covered by name (`Theorem-A-cuspidality`, `Theorem-A-analytic`, `Theorem-B`).
- **Hypotheses 5.7.1, 5.7.5, 6.3.1 and 7.1.3** are not items, but their content is folded into every dependent item: the §5.7 items open "Assume F/F⁺ everywhere unramified, every 2-adic place split, n ≥ 2 and n[F⁺:Q] divisible by 4"; the §6.3.4 items carry "ρ̄ is GSp₄-reasonable and tidy, ordinary of weight 2 …", with `6.3-GSp-reasonable` and `6.3-tidy` as separate definition items; the §7.2 items carry "unramified outside S ⊃ S_p, multiplier ε⁻¹, absolutely irreducible, pure, ordinary semistable weight 2, p-distinguished". Self-contained statements are a deliberate choice here and a good one for formalisation.
- The remaining 85 remarks, 52 headings and 6 examples are asides, notation and cross-references. A keyword sweep for counterexamples, failures and cautions turned up nothing the extraction had not already reflected.

One locator names a number the paper does not have: `2.7.0`, used by two items for the unnumbered lead-in of §2.7. Harmless, but a design job reading locators mechanically should know.

## 2. Statuses

**Library (8 items, 14 declarations): all verified at the pinned commits.** `CondensedMod`, `Condensed.free` and `Condensed.freeForgetAdjunction` at `Mathlib/Condensed/Module.lean:40,51,56`; `Matrix.symplecticGroup` and `SymplecticGroup.mem_iff` at `Mathlib/LinearAlgebra/SymplecticGroup.lean:101,117`, in the namespaces claimed. In Tau Ceti at `f790474`: `AbelianVariety` and `AbelianVariety.baseChange` (`AlgebraicGeometry/AbelianVariety/Basic.lean:94,274`), `cartierDuality` in `FiniteLocallyFreeCommAffineGroupSchemeCat` (`AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:232`), `span_orderedPBWMonomials_eq_pbwFiltration`, `basisMonomials`, `VermaModule`, `existsUnique_lieModuleHom_apply_vermaGenerator`, `vermaCentralCharacter`, `Comodule` and `ComoduleCat`. The extraction's own caution that the pinned PBW material is only the spanning half, not the basis theorem, matches what is there.

**Planned (32 items): every cited layer exists and plans what the item needs.** The pairings are apt and specific — Serre–Tate to `AbelianSchemesAndArithmeticModuli:A4` with `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`, Borel–Serre to `ArithmeticLocallySymmetricSpaces:ALS.2`, integral Hecke determinants to `IntegralHeckeAndGaloisDeterminants:IHG.1/3/4`, PBW and the Harish-Chandra centre to Tau Ceti `LieHighestWeight` layers 3, 7 and 9.

## 3. Routes

All 35 accepted; the per-route reasons are in the `.review.json`. What the acceptance rests on:

- **The identities are not duplicates.** Eight of the eleven new or Part II roadmaps are already proposed by other papers' routes — `GSp4NonregularModularityLifting` (Calegari–Geraghty-20, Pilloni-20), `ProetaleCohomologyOfPAdicCurvesAndTowers` (CDN-20-B, CDN-23, Dospinescu–Le Bras-17), `LocallyAnalyticRepresentationsOfLocalGroups` (CDN-20, Ding-25, Dospinescu–Le Bras-17), `PadicEnvelopingAlgebras` and `NoncommutativeAnalyticDistributions` (Fu-24), `HigherHidaAndColemanTheory` (Pilloni-20), `LocallyAnalyticDistributionsPartIIQuasiAbelianFunctionalAnalysis` (CDN-20), `GSp4LocalLanglandsAndGaloisRepresentations` (BCGP-21) — and **every shared Part II names the same parent as the paper that introduced it**. None of the eleven appears in an atlas or roadmap file, so `new`/`part-ii` is the right kind in each case. `AbelianSurfacesModularity` is the identity the job mandates.
- **The two pairs of Part IIs sharing a parent do not overlap.** The briefs assign ownership in so many words: quasi-abelian functional analysis in route 17, `D(G)` and coadmissible modules in route 18 (importing 17), Arens–Michael completions in route 19, with "NoncommutativeAnalyticDistributions owns the analytic distribution/germ comparison" written into route 19's brief. Route 34's brief requires the Ding proposal to consume route 18's `D(G)` rather than build another, which is the duplication PROTOCOL §15 exists to prevent.
- **The briefs carry corrections forward.** Route 17's brief states that Lemma 2.7.5 is false and asks for the counterexample and a valid replacement; route 18's fixes the left-module transition. That is the right place for findings E010 and E002 to land.
- **Three Part II titles were repaired in place.** PROTOCOL §15 asks for "\<existing roadmap\>, Part II: \<what it adds\>". Route 17 read "Locally analytic distributions, Part II: …" where the parent is "Locally analytic distributions, growth, and character spaces" — **CDN-20 has the identical truncation and needs the same repair**; route 30 dropped an "ordinary" from its parent's title; route 35 shortened "Modularity, automorphy and Langlands endpoint extensions", where BCGP-21 already uses the compliant form, which I adopted so the two papers propose one roadmap rather than two.
- **One divergence is left for the design job.** BCGP-21 routes `HigherHidaAndColemanTheory` as a `new` roadmap titled for Hilbert–Siegel forms; this extraction and Pilloni-20 make it a Part II of `PadicFamilies` with Pilloni-20's title. This extraction agrees with the paper that owns the theory, which is the better-supported choice, but only a design job can settle it.

## 4. Mistakes in the paper

All 74 were checked at their locators; a locator audit over the whole file found exactly **one** wrong locator (E035). **70 confirmed outright, one (E017) confirmed only after correcting the entry, and 3 rejected.** The per-finding reasons are in the result JSON; the ones worth reading here:

**Confirmed by computation of my own.**
- **E041**: for `Y : y²+y = x⁵−x⁴+x³` over F₂ I counted #Y(F₂) = 3 and #Y(F₄) = 9, giving `Q(X) = X⁴+2X²+4`. The printed `x⁴+2x²+1` is impossible on the functional equation alone, whose constant term must be `q^g = 4`.
- **E053**: the `[2,2,2]` table row reduces mod 3 to `(x²+1)(x²+x+2)(x²+2x+2)`; #C(F₃) = 8 and #C(F₉) = 14 give `Q(X) = (X²+2X+3)²`, a repeated factor, so the curve is **not** 3-distinguished. F₃ has exactly three monic irreducible quadratics, so no other special fibre can supply that partition.
- **E050**: Hensel-lifting the unit root of `X²+X+2` in ℤ₂ gives `v₂(α²−1) = 3` exactly, so the Tate-dual invariants have order 8 and the integral `H²` does not vanish; purity gives only the statement after inverting 2.
- **E044**: #E₋₁(F₃) = 5 and #E₂(F₃) = 2, so the Frobenius orders on 2-torsion are 3 and 2, not the printed 2 and 3.

**Confirmed against the paper's own text** — the technique that settled most of the rest. E006 (the last line of a proof contradicts the proposition it proves), E014 (statement says `M(𝔪_w)^∨`, proof computes `M̂^∨`), E032 (statement and proof invert the same quotient), E037 (prose against the table's characteristic polynomial `(x²+1)²`), E040 ("ρ_{X,3} is the trivial representation" against "μ₃ ⊕ ℤ/3ℤ … and hence is unramified" in the same proof), E049 (`±,±` in the text against `±,∓` in two tables), E062 (the count of Stein pieces against the degree range in the same sentence), E068 (a citation of Lemma 7.3.5 for what Lemma 7.3.6 states, where 7.3.5's own proof cites 7.3.6).

**E039 deserves its own paragraph**, being the most consequential. Lemma 9.2.13 concludes "semistable ordinary reduction with purely toric reduction" from (1) `ρ̄_{A,3}|G_{ℚ₂}` unramified, (2) projective class 2C or 6G, (3) `ρ̄_{A,2}` inside `S₅(b)`. The paper's own curve `Y : y²+y = x⁵−x⁴+x³` satisfies all three — it has good reduction at 2, the paper computes its class as 6G, and the paper proves elsewhere that a rational Weierstrass point is *equivalent* to `ρ̄_{A,2}` factoring through a conjugate of `S₅(b)` — while Deuring–Šafarevič gives 2-rank 0, i.e. good **non-ordinary** reduction. The paper's remark that this "does not contradict Lemma [9.2.13] because … `Y` is not ordinary" is circular, since ordinarity is the lemma's conclusion; the missing hypothesis is bad reduction, which the only application supplies ("any specialization … which does not have good reduction"). The extraction had this right, and the register should carry it.

**Rejected (3).** A confirmed finding enters the register of mistakes in published sources, so a reviewer who cannot demonstrate the defect must say so.
1. **E031** records no defect. "We choose a prime `v₀ > 5` such that `v₀ ≢ 1 (mod p)` and `v₀ ≢ 1 (mod 4)` if `p = 2`" is correct; at `p = 2` the first clause is merely redundant, and the additions the entry asks for (`v₀ ≠ p`, `v₀ > 5`) are already in the definition of a neat prime and in that very sentence.
2. **E047** quotes text that is not at its locator. Lemma 9.4.2's proof says "either good ordinary **or semistable ordinary** reduction", and the open-ball claim is supported by Kisin's local-constancy theorem, which keeps the local Galois representation — hence the reduction type — constant. The nearest matching text is in Corollary 9.3.6's proof, where the point does have good reduction.
3. **E072** asks for a more explicit chart but identifies no false statement: the passage states the distinctness condition and describes `Z(ρ̄)` as the complement of finitely many hyperplanes, which is what the conditions `σθ = σ′θ` cut out.

**Corrected in place, then confirmed (E017).** As submitted it claimed the paper writes "an injective map … whose **kernel** is annihilated by p". Page 77 prints "**cokernel**" in both bullets, correctly, so that half was a misreading. But the sentence immediately after is a genuine slip — `H^i(Lie(Γ), B_∞ ⊗ S) = H^i(Lie(Γ), B_∞ ⊗ S)`, identical on both sides, where the flat base change `B_∞ ⊗ H^i = H^i(B_∞ ⊗ −)` is meant, as the next display shows. `printed`, `correction` and `reason` now record that, and only that.

**Added (E075).** Lemma 2.7.5's statement reads "the induced topologies `𝒯₂` and `𝒯′₃` on `V₃`"; both subscripts must be 3. A misprint affecting nothing — the lemma is false for the independent reason recorded as E010.

## 5. Changes made to the extraction

1. Route 17, 30 and 35 titles now reproduce their parents' titles (PROTOCOL §15); route 35 adopts BCGP-21's wording verbatim.
2. E017's `printed`, `correction` and `reason` rewritten, as above.
3. E035's locator corrected: 7.4.9 is the *Definition* of the Hecke algebras; the quoted material is in the unnumbered discussion after Proposition 7.4.10, on the same page. Its mathematics is confirmed and sharpened — with `e₃ = μe₁` and `e₄ = μ²` identically, the printed `𝔫` has quotient `k[μ^{±1}]/(μ²−1) ≅ k × k`, so it is not even a maximal ideal.
4. `review` verdicts added to all 75 findings.

Nothing else was touched: no item, status, statement or route membership was changed.

## Validation

~~~sh
python3 scripts/check_paper.py research/blueprint/papers/PAPER-BOXER-CALEGARI-GEE-PILLONI-25.result.json   # ok
python3 research/blueprint/intake.py check-files \
  research/blueprint/papers/PAPER-BOXER-CALEGARI-GEE-PILLONI-25.result.json \
  research/blueprint/papers/PAPER-BOXER-CALEGARI-GEE-PILLONI-25.review.json \
  research/blueprint/papers/PAPER-BOXER-CALEGARI-GEE-PILLONI-25.md \
  research/blueprint/reviews/REV-PAPER-BOXER-CALEGARI-GEE-PILLONI-25.md
git diff --check
~~~

No Lean file is a deliverable of this review and no formalisation is claimed. Seventy-two findings enter the register as new confirmed mistakes once this job is done; three are rejected and will not.
