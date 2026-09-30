# RT-PAPER-GAMBURD-MAGEE-RONAN-19: red team of the extraction of Gamburd–Magee–Ronan, *An asymptotic formula for integer points on Markoff–Hurwitz varieties*

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4098).

**Target.** `PAPER-GAMBURD-MAGEE-RONAN-19` extracts Alex Gamburd, Michael Magee and Ryan Ronan, *An asymptotic formula for integer points on Markoff–Hurwitz varieties*, [Annals of Mathematics 190 (2019), 751–809](https://doi.org/10.4007/annals.2019.190.3.2), arXiv:1603.06267. The extraction has:

- 43 items: 1 library, 1 planned, 41 missing;
- 3 routes:
  - a source route to ClassicalArithmeticCompletion CA.4 (items 1–5);
  - the Part II *Arithmetic dynamics, Part II: Markoff actions and strong approximation* (items 6–23);
  - a new Part II *Probabilistic, metric and ergodic number theory, Part II: transfer operators, renewal and multidimensional continued fractions* (items 24–29, 32–43);
- 14 prerequisites;
- 17 source issues (E1–E17).

**Who did what.**

- The extraction is by Claude Code `cc-fb70e5` (issue #1139, commit 9620dd68, 22 September 2026).
- The review `REV-PAPER-GAMBURD-MAGEE-RONAN-19` is by Claude Code `cc-442dc5` (issue #1140, commit 1d2e34cf, 23 September 2026). It accepted all three routes after correcting items in place and adding E10–E17.
- There is no separate errata record for this paper, so there are no colliding ids.
- I did none of this work. The string `cc-f805bf` occurs in none of the target files.

**Result: 7 findings: 3 medium, 4 low.** The machine-readable file is [RT-PAPER-GAMBURD-MAGEE-RONAN-19.result.json](RT-PAPER-GAMBURD-MAGEE-RONAN-19.result.json).

- **Where the work is sound.**
  - The 43 items follow v3 faithfully, with the hypotheses and numerical constants right.
  - The single library citation resolves at the pin.
  - The review's corrections hold. I re-derived the amended positivity repair (E1). I checked the corrected Lalley constant (E16) by enumeration: for n = 3 at w = (0, 1, 1), N/e^(2a) → 3/π² ≈ 0.304.
  - No item is wrongly marked missing: neither library has transfer operators, RPF theory, Kato perturbation, Schauder–Tychonoff or iterated function systems.
- **Where it breaks.**
  - *Source.* The Annals text was never read. It is available, and it is a revision later than v3 (finding 1).
  - *Ownership.* Two overlaps. The Tauberian step now has an owner elsewhere (finding 2). CA.4 closed its decomposition without this source (finding 7).
  - *Library.* Two of the brief's Mathlib imports do not exist (finding 3).
  - *Status.* Item 30 is only partly planned (finding 4).
  - *Omissions.* The prerequisites and one misprint are missing (findings 5 and 6).

## Source

| Text | Where | SHA-256 |
| --- | --- | --- |
| arXiv v3 (13 June 2018), the last arXiv version | [arxiv.org/pdf/1603.06267v3](https://arxiv.org/pdf/1603.06267v3) | `965e264e…997a` (matches the recorded hash) |
| Annals of Mathematics 190 (2019), 751–809, the version of record (59 pp.) | [publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v190-n3-p02-s.pdf) | `c5e7ebb5…215a` |

- **Fetched:** both texts on 30 September 2026.
- **Reading.** I read the whole of v3 myself, including the §5 matrix computations. I collated the Annals text with it statement by statement through §5.2, and at every recorded mistake.
- **Dates.** The publisher's page gives 'Received: 7 September 2017 Revised: 21 January 2019 Accepted: 16 July 2019'. The printed text is therefore later than v3.
- **Structure of the Annals text.** It adds a §1.2 on the structure of the proof and two examples after Definition 15, which shifts all later numbers by two. It replaces the proofs of (5.2)–(5.10) by a reference to arXiv v3.
- **Errata.** Crossref records no update or relation for the DOI, and the journal lists no erratum.

**Checks behind the verdicts.**

- *E1, the positivity repair.* The left half of (3.25) with the λ = e case gives M(w, a) ≥ N(f(w), a − 2ε₀) once α(w) is large. Here f(w) ≥ (0, …, ½, ½, 1) because w_(n−2) ≥ α(w)^(1/(n−2)). Positivity spreads to every z through M(z, a) ≥ M(μz, a − d_μ) for μ ∈ Λ′, since Λ′μ ⊂ Λ′ and Λ′ is free.
- *E16, the constant.* For n = 3, L_s is conjugate to the Gauss operator Σ (x + m)^(−s) f(1/(x + m)), whose weights are |T′|^(−s/2). So λ′₂ = −π²/(12 log 2), half the Gauss Lyapunov exponent. With h₂(0) = 1/(2 log 2) the corrected constant is h₂/(2|λ′₂|) = 3/π² = 0.30396. Direct enumeration of Γ′·(0, 1, 1) gives N/e^(2a) = 0.3040 at e^a = 1000 and 0.30398 at e^a = 4000.
- *Proposition 40.* v₊ = (0, …, 0, 1, T₊, T₊(T₊ − A)) is an eigenvector of γ_(n−1)^Aγ_(n−2) with eigenvalue T₊ and lies in H. Checked numerically for n = 4 and A = 0, 1, 2, 5.
- *§5.* The auxiliary bounds hold: w_(n−2) ≤ ½ and w_(n−3) ≤ ¼ on ∆_core, ≤ ⅓ and ≤ ⅕ on ∆_cusp. Lemma 46's case III uses (5.1) at i = n − 2, as E17 says.

**Candidate findings I rejected.**

- *Item 41's note that λ_s → ∞ as s ↓ 1.* It is correct: λ_s ≥ inf_w L_s[1](w) ≥ Σ_A (A + 2)^(−s).
- *Remark 14 (β(n) ≥ β(n − 1)).* It is valid. The embedding y ↦ (0, y) carries the (n − 1)-dimensional Γ′ into the n-dimensional one, compatibly with the counts.
- *Items 6–23 against the other routes into the Markoff Part II* (Martin route 2, Ghosh–Sarnak route 5, Chen route 2). None of their items repeats one of ours.
- *Kato perturbation and Schauder–Tychonoff.* No owner exists anywhere in the atlas. 'Schauder' there means Schauder estimates or Schauder bases, so supplying them in route 3 is right.
- *Continued fractions.* Mathlib's `GenContFract` touches only the n = 3 illustration inside item 24, so it is not a missed library status.

## Medium

### 1. The version of record was not collated: two recorded mistakes are already corrected in print, five partly, and the numbering differs

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-GAMBURD-MAGEE-RONAN-19.result.json: source.readSections, sourceIssues E2, E4, E5, E7, E8, E11, E17 (fields known, locator, searched), the missing sourceVersions field, and every item locator from Proposition 16 onwards; research/blueprint/papers/PAPER-GAMBURD-MAGEE-RONAN-19.md (Source paragraph); research/blueprint/reviews/REV-PAPER-GAMBURD-MAGEE-RONAN-19.md (Method)

**What is wrong.**

The extraction and the review read only arXiv v3 (13 June 2018) and state that the Annals version 'is paywalled and was not available'. The version of record is served by the publisher, and it is a later text: the Annals page records 'Received: 7 September 2017 Revised: 21 January 2019 Accepted: 16 July 2019', seven months after v3. Collating it shows that it already corrects two of the seventeen recorded mistakes and part of five others, so their 'known': 'new' is wrong and research/errata/REGISTER.md lists them as new mistakes of the Annals paper. Fully corrected in print: E7 (Lemma 27 is restated for λ′ ∈ S^(L)λ only, as E7 proposes) and E11 (Lemma 28 and (3.26) now carry 2ε). Partly corrected: E2 ((3.5) now sums from A₀ = 0 with prefactor (log z_n^(0))^β; only the comparison sum Σ c⋆/(A₀ log 2)^β remains), E4 ('l ≤ 2' is now 'l ≥ 2' and §3.1 now has 1 ≤ j ≤ n − 1; the 'n − 2' in the proof of Lemma 20 remains), E5 (the exponent L − 1 is restored; the sums still start at A₁ = 1), E8 (the 'c = 3/2' sentence is replaced by '≥ 3/2'; the bound 2(n − 2)Σ(3 + A)^(−s) remains) and E17 ((5.1) now reads 1 ≤ i ≤ n − 2; the unsquared denominators of (5.5) and (5.9) remain). The published text also omits the proofs of (5.2)–(5.10) and refers to arXiv v3 for them, so the parts of E9 and E17 inside those proofs concern the arXiv supplement, not the Annals text. E1, E3, E6, E10, E12, E13, E14, E15 and E16 are unchanged in print. Finally, the published numbering differs from v3 from Definition 15 on: two new examples are inserted, so v3 Proposition 16 is Annals Proposition 18, Corollary 17 is 19, Lemmas 18–29 are 20–31, Proposition 30 is 32, Lemmas 31, 33, 36 are 33, 35, 38, Theorem 37 is 39, Theorem 39 is 41, Propositions 40, 41, 43 are 42, 43, 45, Lemmas 42, 44, 46 are 44, 46, 48. Every item and source-issue locator names only the v3 number, so the items cannot be matched against the version of record.

**Evidence.**

Annals of Mathematics 190 (2019) 751–809, publisher PDF https://annals.math.princeton.edu/wp-content/uploads/annals-v190-n3-p02-s.pdf (59 pp., SHA-256 c5e7ebb5322cdfd455735f13c2b420dba318089b382a3f78f40628efc838215a, fetched 2026-09-30). Publisher page https://annals.math.princeton.edu/2019/190-3/p02: 'Received: 7 September 2017 Revised: 21 January 2019 Accepted: 16 July 2019 Published online: 28 October 2019'; arXiv API: v3 updated 2018-06-13 (the recorded v3 SHA-256 965e264e…997a was re-verified). Annals p.784, Lemma 29: 'For any λ ∈ Λ ∪ {e} and λ′ ∈ S^(L)λ with L as in (3.18), we have …'; proof p.785: 'Since L > 0 and λ′ ∈ S^(L)(Λ ∪ e), we have (λ′z^(0))_(n−2) ≥ (z^(0))_(n−1) > 2' (v3 p.29: 'For any nonidentity map λ′ ∈ Λ'). Annals p.785, Lemma 30: 'N(y(λ′), r − τ⋆^L(λ′) − 2ε) ≤ M(λ′z^(0), r − τ⋆^L(λ′)) ≤ N(y(λ′), r − τ⋆^L(λ′) + 2ε)'; p.786 (3.28) has 'r − 2ε − τ⋆^L(λ′)'. Annals p.777 (3.6): the sum runs 'A₀ = 0' to ∞ and the main term is '(log z_n^(0))^β e^(βr) Σ …'; the comparison sum 'Σ_(A₀) c⋆(…)/(A₀ log 2)^β' is unchanged. Annals p.772: 'j_l ≠ j_(l−1) for any l ≥ 2'; p.773 proof of Lemma 22: '{λ_j : 1 ≤ j ≤ n − 2}' (unchanged); p.775: 'we replace the generators {λ_j : 1 ≤ j ≤ n − 1} of Λ'. Annals p.780, Claim of Lemma 25: '≤ (2(n − 1))^L (c₀ + x)^(L−1) e^x Σ_(A₁=1)^(⌊2(n−1)e^x⌋) 1/(2(n − 1) + A₁)'. Annals p.799: 'λ_s ≤ 2(n − 2) Σ_(A∈Z≥0) 1/(3 + A)^s' (unchanged); p.800: '(γ′.w)_n/w_n = 1 + (A + 1)(1 − w_j) ≥ 3/2, since w_j ≤ 1/2'. Annals p.801 (5.1): '‖dγ_i‖₁ ≤ 2/(2 − w_i) ≤ 6/5 on ∆_cusp, 4/3 on ∆_core, 1 ≤ i ≤ n − 2'; (5.5) and p.802 (5.9) keep the unsquared denominators '3 + (w₁ + ⋯ + w_(n−2)) − 2w_j' and '5 + (w₁ + ⋯ + w_(n−2)) − 4w_(n−2)'; p.802: 'The full proofs of (5.2)–(5.10) can be found in the arXiv posting [GMR18]', and [GMR18] is 'arXiv 1603.06267v3'. Unchanged in print: Proposition 18(3) p.768 still says '(This property holds for all x ∈ V(Z+).)' (E3); Lemma 27 p.783 'k′ ≥ 0' (E6); Lemma 29 keeps the strict '<' (E12); Lemma 22 p.773 has no 'unexceptional' (E13); §1.1 p.761 'length ≤ log R' (E14); Lemma 46 p.798 has L_s^Q on the right (E15); §4.3 p.797 '(1 − L_s)^(−1)g = (1 − λ_s)^(−1)ν_s(g)h_s + (1 − L′_s)^(−1)g' and 'N(w, r) = h_(β₀)(w)e^(β₀r) + o(e^(β₀r))' (E16); the Proposition 32 argument p.789 is as in v3 (E10); no lower bound for c⋆ is added (E1). Numbering: Annals Definition 15 is followed by 'Example 16. When n = 3, a = 1, and k = 4, V is Cayley's cubic surface' (p.766) and Example 17 (n = 4, a = 2, k = 2), then Proposition 18, Corollary 19 (Infinite descent), Lemma 20 (freeness), …, Proposition 23 (the accelerated count), …, Lemma 48 (the 24/25 bound). The extraction's source.readSections: 'The Annals version is paywalled and was not available; v3 is the last arXiv version, and locators are v3 pages.'

**Fix.**

In PAPER-GAMBURD-MAGEE-RONAN-19.result.json: add sourceVersions with two entries, {kind: preprint, url: https://arxiv.org/pdf/1603.06267v3, read: 2026-09-22, sha256: 965e264e260ca42bbaa5a65f789e5cc6eb6117d70d7219603a3b855d29ba997a} and {kind: published, url: https://annals.math.princeton.edu/wp-content/uploads/annals-v190-n3-p02-s.pdf, read: <date read>, sha256: c5e7ebb5322cdfd455735f13c2b420dba318089b382a3f78f40628efc838215a}. Set E7 and E11 'known' to 'corrected in the published version, Ann. of Math. 190 (2019): Lemma 29 (p.784) and Lemma 30 with (3.28) (pp.785–786)', and say that the mistake is in arXiv v3 only. For E2, E4, E5, E8 and E17, restrict 'printed' and 'correction' to what remains in print (E2: the comparison sum over A₀ ≥ 0 with (A₀ log 2)^β; E4: 'n − 2' in the proof of Lemma 22; E5: sums from A₁ = 1; E8: the bound 2(n − 2)Σ(3 + A)^(−s); E17: the denominators of (5.5) and (5.9)). Record the rest as known, corrected in print. Note in E9 and E17 that the published paper refers to arXiv v3 for the proofs of (5.2)–(5.10). Give every locator both numbers ('Proposition 16 (Annals Proposition 18)', and so on through 'Lemma 46 (Annals Lemma 48)'), with Annals pages for the statements. Replace 'The Annals version is paywalled and was not available' in readSections and in the report with the collation. Update each 'searched' list. The register is regenerated from the file.

### 2. The Tauberian step of §4.3 is owned by another Part II

- **Kind:** duplicate.
- **Where:** research/blueprint/papers/PAPER-GAMBURD-MAGEE-RONAN-19.result.json: item PAPER-GAMBURD-MAGEE-RONAN-19/41 (and its note), route 3 brief ('Write out in full … Lalley's contour argument'); no item for the Tauberian theorem

**What is wrong.**

The last step of §4.3 turns the meromorphic continuation of N̂(w, s) = s⁻¹(1 − L_s)⁻¹1 into N(w, a) ∼ C(w)e^(β₀a). The paper cites 'the perturbation theory and Fourier analysis developed in [Lal89, Sections 7 and 8]', and route 3 tells the design to write out 'Lalley's contour argument' inside the new transfer-operator Part II. For each fixed w this step is exactly the Wiener–Ikehara–Delange Tauberian theorem for a nondecreasing function with a simple pole on its abscissa. The atlas already owns that theorem. PAPER-WOOD-19 route 10, the Part II ArithmeticDirichletSeriesPartIIHigherPoleTauberian of Tau Ceti's Arithmetic Dirichlet series roadmap, was accepted on 23 September 2026 at 21:31, four hours after this extraction's review (17:10). Its item WOOD-19/286 is the theorem for every pole order m ≥ 1, and m = 1 is the case needed here. Its parent's Layer 9 plans Wiener–Ikehara itself, with the pole moved to a positive abscissa. The hypotheses hold here. N(w, ·) is a sum of indicators 1{log(γ.w)_n − log w_n ≤ a}, so it is nondecreasing, vanishes for a < 0 and is locally integrable. Its Laplace transform converges for ℜ s > β₀, since the spectral radius of L_s is at most λ_(ℜ s) < 1 there. It extends holomorphically near every point of ℜ s = β₀ except β₀ (Theorem 39 with Proposition 40). At β₀ it has a simple pole with residue B(w) = h_(β₀)(w)/(β₀|λ′_(β₀)|) > 0 (E16, with ν_(β₀) a probability measure, since h_(β₀) > 0). Delange's theorem then gives N(w, a) ∼ B(w)e^(β₀a) for each w. What remains specific to this paper is uniformity in w. Theorem 13 needs it, and it follows from the continuity of w ↦ B(w) and the uniform analytic data. As written, the new Part II would plan a second Tauberian theorem, and nothing tells the two designs (both pending) about each other.

**Evidence.**

Paper, arXiv v3 p.35: 'There is a procedure due to Lalley to convert (4.4) … into Theorem 13. More specifically we will appeal to the perturbation theory and Fourier analysis developed in [Lal89, Sections 7 and 8]'; p.40: 'The outcome of Lalley's argument is that N(w, a) = h_(β₀)(w)e^(β₀a) + o(e^(β₀a)) where the decay in the small o does not depend on w.' Definition (1.7), p.9: N(y, a) = Σ_(γ∈Γ′∪{e}) 1{log(γ.y)_n − log(y)_n ≤ a}. Route 3 brief: 'Write out in full the Ruelle–Perron–Frobenius theorem and Lalley's contour argument, which the paper only sketches, for countably many branches.' PAPER-WOOD-19.result.json item PAPER-WOOD-19/286 (status missing, route 10): 'Let α:[0,∞)→[0,∞) be nondecreasing and locally integrable, with f(s)=∫₀^∞e^(−st)α(t)dt convergent for Re s>a>0. Suppose f extends holomorphically near every point on Re s=a except a, where it has an order-m pole with leading coefficient B>0, m≥1. Then α(t)∼B e^(at)t^(m−1)/(m−1)!.' Route 10 brief: 'Separate the nondecreasing Laplace theorem from its Dirichlet-series adapter …'; review commit a74c428a (2026-09-23 21:31) accepts route 10, and 1d2e34cf (2026-09-23 17:10) accepts this extraction. content/tau-ceti/ArithmeticDirichletSeries/README.md, Layer 9: 'Wiener–Ikehara … Conclude x⁻¹ Σ_(n≤x) a n → κ'; 9.2: 'Prove versions for … a pole at a positive abscissa after rescaling'. research/blueprint/queue.json: DESIGN-ArithmeticDirichletSeriesPartII and DESIGN-ProbabilisticAndMetricNumberTheoryPartII are both 'pending'. At the pins, Tau Ceti f790474 has only the smoothed Dirichlet-series pieces (TauCeti/NumberTheory/LSeries/WienerIkehara/Asymptotic.lean:122 tendsto_tsum_term_mul_fourier_atTop), not the theorem. Check of the constant: for n = 3 at w = (0, 1, 1), direct enumeration gives N/e^(2a) = 0.3040 at e^a = 1000 and 0.30398 at e^a = 4000, and h₂(w)/(2|λ′₂|) = (1/(2 log 2))/(2π²/(12 log 2)) = 3/π² = 0.30396.

**Fix.**

Add an item to PAPER-GAMBURD-MAGEE-RONAN-19: 'Tauberian theorem for a nondecreasing function whose Laplace transform has a simple pole on its abscissa of convergence and extends holomorphically to the rest of that line (Wiener–Ikehara–Delange, pole order 1)', locator §4.3 p.40 (Annals p.797) citing [Lal89, §§7–8], status planned, planned ['ArithmeticDirichletSeriesPartIIHigherPoleTauberian'] (item PAPER-WOOD-19/286, m = 1). If planned may only name an existing layer, put it on route 3 with a note that its owner is WOOD-19 route 10. Narrow item 41 to the paper-specific part: the hypotheses of that theorem for N̂(w, s) = s⁻¹(1 − L_s)⁻¹1, the residue h_(β₀)(w)/(β₀|λ′_(β₀)|), and uniformity of the o(1) in w ∈ ∆. In the route 3 brief replace 'Write out in full … Lalley's contour argument' by 'Import the nondecreasing Laplace Tauberian theorem (simple-pole case) from Arithmetic Dirichlet series and Tauberian methods, Part II (ArithmeticDirichletSeriesPartIIHigherPoleTauberian; PAPER-WOOD-19/286); plan here only its hypotheses for N̂(w, s) and the uniformity in w'. Add a note for the maintainer that DESIGN-ArithmeticDirichletSeriesPartII supplies DESIGN-ProbabilisticAndMetricNumberTheoryPartII.

### 3. Route 3 imports a Laplace transform and a C¹ Banach space that Mathlib does not have

- **Kind:** library-claim.
- **Where:** research/blueprint/papers/PAPER-GAMBURD-MAGEE-RONAN-19.result.json: route 3 brief ('Import from Mathlib Banach spaces of C¹ functions, holomorphic maps into bounded operators, the spectral radius, the Laplace transform and p-series'); items PAPER-GAMBURD-MAGEE-RONAN-19/29 and /34

**What is wrong.**

Two of the five Mathlib imports named in the route 3 brief do not exist at the pinned Mathlib 082e2d3. (1) There is no Laplace transform. No Mathlib declaration name contains 'laplace', and the two files that mention the word use it for a reference to Widder's book and for the Laplace operator. The nearest object is the Mellin transform. Item 29 uses the two-sided transform f̂(s) = ∫_(−∞)^∞ e^(−sx)f(x)dx with complex s. Tau Ceti's TauCeti.laplaceTransform is the real-parameter transform of a measure on ℝ≥0 and does not supply it either. (2) There is no Banach space of C¹ functions on a compact set with the norm ‖f‖∞ + ‖∇f‖∞, which items 34–35 need for C¹(∆). The only bundled space of Cⁿ maps is ContDiffMapSupportedIn, whose elements vanish outside the compact set, so it does not contain the constant function 1 on which (4.4) acts. A design following the brief would import two objects that are not there and plan neither.

**Evidence.**

Mathlib 082e2d3 (declarations index): no declaration whose name contains 'laplace' or 'Laplace'. Mathlib/Analysis/MellinTransform.lean:91 'def mellin (f : ℝ → E) (s : ℂ) : E'. Mathlib/Analysis/Distribution/ContDiffMapSupportedIn.lean:97–101: 'structure ContDiffMapSupportedIn (n : ℕ∞) (K : Compacts E) … protected toFun : E → F; protected contDiff' : ContDiff ℝ n toFun; protected zero_on_compl' : EqOn toFun 0 Kᶜ'. Tau Ceti f790474, TauCeti/Analysis/CompletelyMonotone/Laplace/Representation.lean:73: 'noncomputable def laplaceTransform (μ : Measure ℝ≥0) (t : ℝ) : ℝ := ∫ x, Real.exp (-(t * (x : ℝ))) ∂μ'. The imports that do exist: Mathlib/Analysis/PSeries.lean:317 Real.summable_one_div_nat_rpow and Mathlib/Analysis/PSeriesComplex.lean:25 Complex.summable_one_div_nat_cpow; spectralRadius in Mathlib/Analysis/Normed/Algebra/Spectrum.lean. Paper v3 p.34: 'we start the full argument of the renewal method. This begins with taking a Laplace transform which we define for general f of suitable decay by f̂(s) = ∫_(−∞)^∞ e^(−sx)f(x)dx'; p.36: 'Our functional analysis takes place on the Banach space C¹(∆) … with the norm ‖f‖_(C¹) = ‖f‖∞ + ‖∇f‖∞.'

**Fix.**

In the route 3 brief, move 'Banach spaces of C¹ functions' and 'the Laplace transform' from 'Import from Mathlib' to 'Supply in this Part II'. The design then plans: the space C¹(K) of a compact convex body K with ‖f‖∞ + ‖∇f‖∞, its completeness, and the continuity of composition with C¹ maps; and the two-sided Laplace transform with complex parameter, its half-plane of convergence, holomorphy and the transform of a renewal equation, defined either directly or through Mathlib's mellin by x = log t. Keep citing spectralRadius and the p-series lemmas, and add Complex.summable_one_div_nat_cpow, which Lemma 33 needs at complex s. Add the same notes to items 29 and 34.

## Low

### 4. Item 30 is only partly planned by PM.4

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-GAMBURD-MAGEE-RONAN-19.result.json: item PAPER-GAMBURD-MAGEE-RONAN-19/30 (status planned, planned ['ProbabilisticAndMetricNumberTheory:PM.4'])

**What is wrong.**

Item 30 is marked planned by PM.4, but PM.4 plans only part of it. PM.4 plans the Gauss map, its invariant measure, ergodicity and mixing, which covers the s = 2 statement (Perron–Frobenius operator with density 1/(1 + x)). Item 30 also states two things PM.4 does not plan. One is the conjugation M_((x+1)^s)⁻¹ L_s M_((x+1)^s) = L_s^Gauss for every s. The other is 'Wirsing proved the analogue of Theorem 37 for the Gauss map', a spectral-gap theorem for the Gauss transfer operator on a function space. The coverage entry for PM.4 is 'not_read' with no nodes, so nothing narrower is planned there either. The unplanned part is on no route. It survives only as a 'mandatory example' in the route 3 brief, which does not make it an item of the Part II.

**Evidence.**

research/blueprint/atlas/roadmaps/ProbabilisticAndMetricNumberTheory.json, stage PM.4: 'Construct Gauss map, invariant measure, ergodicity/mixing and metric continued-fraction statistics; extend to homogeneous dynamics through GN.4.' research/blueprint/packets/ProbabilisticAndMetricNumberTheory.json coverage: {'stageId': 'ProbabilisticAndMetricNumberTheory:PM.4', 'status': 'not_read', 'remaining': ['Acquire primary Gauss-map invariance, ergodicity, mixing and metric continued-fraction proofs.', …]}. Item 30 statement: 'L_s is conjugate by multiplication by (x + 1)^s to the Gauss transfer operator Σ_A (x + A + 1)^(−s)f(1/(x + A + 1)) … Wirsing proved the analogue of Theorem 37 for the Gauss map.' Paper v3 p.36, Example 35, and p.37: 'In the case of the Gauss map, a version of Theorem 37 was first proved by Wirsing [Wir74].' I checked the conjugation: with x = w₁/w₂, (γ₂^Aγ₁.w)₃ = (x + A + 2)/(x + 1), and conjugating by (x + 1)^s gives Σ_A (x + A + 1)^(−s) f(1/(x + A + 1)).

**Fix.**

Split item 30. The Gauss map x ↦ {1/x}, its inverse branches 1/(x + m) and the invariant density 1/((1 + x) log 2) (the s = 2 case) stay planned by PM.4. The conjugation of L_s to L_s^Gauss for real s > 1 and the n = 3 case of Theorem 37 (Wirsing) become a missing item on route 3, importing the Gauss map from PM.4.

### 5. The prerequisites omit the sources of the RPF proof the brief requires

- **Kind:** missing.
- **Where:** research/blueprint/papers/PAPER-GAMBURD-MAGEE-RONAN-19.result.json: prerequisites; route 3 brief

**What is wrong.**

Route 3 requires the design to 'Write out in full the Ruelle–Perron–Frobenius theorem … for countably many branches'. The prerequisites do not list the sources the paper gives for that proof. They list Liverani 1995, Pollicott 1984, Lalley 1989, Kato, Wirsing, Avila–Hubert–Skripchenko and Arnoux–Starosta. They omit three sources the paper names. The first is Parry–Pollicott 1990, [PP90, Th. 2.2], which the paper cites for 'the classical proof of this Theorem'. The second is Ionescu Tulcea–Marinescu 1950, [ITM50], the origin of the two-norm inequality of Lemma 44 (item 34). The third is Pollicott's notes on the Rauzy–Veech–Zorich map, cited as [Pol] in v3 and [Pol14] in the Annals text; the paper names them for the Jacobian identity of Lemma 42 ([Pol, Lemma 2.1]) and for the direct proof of Theorem 37 ([Pol, Lemma 2.3]). Baladi's book [Bal00], named as 'a good reference for the spectral theory of transfer operators', is missing too. Lalley 1988 (the renewal method for self-similar fractals) is cited but not listed.

**Evidence.**

Paper v3 p.42: 'The proof of the Ruelle-Perron-Frobenius Theorem 37 now proceeds either via use of Birkhoff cones as in Liverani's paper [Liv95] or by a more direct approach as in Pollicott [Pol, Lemma 2.3]. The classical proof of this Theorem for subshifts of finite type can be found in [PP90, Theorem 2.2]. In any approach Lemma 44 is the key input.' p.41: 'the following two-norm inequality with origins in the work of Ionescu Tulcea and Marinescu [ITM50]'. p.40: 'This can be checked by a direct calculation on general grounds as in [Pol, Lemma 2.1]'. p.35: 'A good reference for the spectral theory of transfer operators is the book of Baladi [Bal00].' References: [PP90] W. Parry and M. Pollicott, Zeta functions and the periodic orbit structure of hyperbolic dynamics, Astérisque 187–188 (1990); [ITM50] Ann. of Math. (2) 52 (1950), 140–147; [Pol] M. Pollicott, Statistical properties of the Rauzy-Veech-Zorich map (Annals: [Pol14]); [Bal00] V. Baladi, Positive transfer operators and decay of correlations (2000). The prerequisites list has 14 entries and none of these.

**Fix.**

Add to prerequisites: W. Parry and M. Pollicott, Astérisque 187–188 (1990), for the RPF theorem; C. T. Ionescu Tulcea and G. Marinescu, Ann. of Math. 52 (1950) 140–147, for Lemma 44; M. Pollicott, Statistical properties of the Rauzy–Veech–Zorich map (the notes the paper cites), for Lemma 42 and the direct proof of Theorem 37; V. Baladi, Positive transfer operators and decay of correlations (World Scientific, 2000); S. P. Lalley, Indiana Univ. Math. J. 37 (1988) 699–710.

### 6. A missed misprint in the Jacobian matrix of (5.1)

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-GAMBURD-MAGEE-RONAN-19.result.json: sourceIssues (a missed misprint in the proof of (5.1)); item PAPER-GAMBURD-MAGEE-RONAN-19/43

**What is wrong.**

The recorded issues miss a misprint in the Jacobian matrix of γ_i in the proof of (5.1). It is in arXiv v3 and still in the Annals text. Row 3, column i is printed w₂/(2 − w_i)², but it should be w₃/(2 − w_i)². For i > 3 the third component of γ_i(w) is w₃/(2 − w_i), whose partial derivative in w_i is w₃/(2 − w_i)². The paper's column sum C_i = (1 + 2β(w) − 2w_i)/(2 − w_i)² uses the correct entries (it sums w_k over k ≠ i), so (5.1) is unaffected. Only the displayed matrix is wrong.

**Evidence.**

Paper v3 p.46, proof of equation (5.1): γ_i(w) = (w₁/(2 − w_i), w₂/(2 − w_i), …, ŵ_i, …, w_(n−2)/(2 − w_i), (1 − β(w))/(2 − w_i)), and in the displayed matrix the column-i entries of rows 1, 2, 3 are 'w1/(2 − wi)²', 'w2/(2 − wi)²', 'w2/(2 − wi)²'. The same matrix is Table 1 of the Annals text (p.804), with the same row-3 entry. Absolute column sum stated in both: 'C_i = (1 + 2β(w) − 2w_i)/(2 − w_i)²'.

**Fix.**

Add PAPER-GAMBURD-MAGEE-RONAN-19/E18 (kind misprint, affects nothing, known new): locator 'proof of (5.1), matrix of dγ_i, row 3, column i, p.46 (arXiv v3); Table 1, p.804 (Annals)'; printed 'w2/(2 − wi)²'; correction 'w3/(2 − wi)²'; reason as above. Mention it in item 43's locator.

### 7. CA.4 was decomposed without this source; items 1 and 5 do not cite its Markoff nodes; route 2 names a folded id

- **Kind:** other.
- **Where:** research/blueprint/papers/PAPER-GAMBURD-MAGEE-RONAN-19.result.json: route 1 (source → ClassicalArithmeticCompletion:CA.4), items PAPER-GAMBURD-MAGEE-RONAN-19/1 and /5; route 2 brief (roadmap ids)

**What is wrong.**

Route 1 still points at CA.4 as if nothing there covered it, but CA.4 has moved on. The ClassicalArithmeticCompletion blueprint's second pass (24 September 2026, the day after this review) decomposed CA.4 from Martin's Markoff sources and marked it 'source_decomposed'. That pass did not include this paper, and the live issue #1025 still lists only Bennett–Siksek and Martin as added sources. CA.4 now plans the n = 3, a = 3, k = 0 special cases that items 1 and 5 state inside their statements: positive Markoff triples, the Vieta moves, and 'every Markoff triple reduces to (1, 1, 1)'. The items do not cite those nodes. Unless the continuation job is told, it will treat CA.4 as done without the n-variable equation, the exceptional families, Proposition 16 and Corollary 17. Separately, the route 2 brief imports from 'ProbabilisticAndMetricNumberTheoryPartIITransferOperators'. That id no longer exists as a job: the Part II designs were folded to one per parent on 28 September, so the job is DESIGN-ProbabilisticAndMetricNumberTheoryPartII and the Markoff design is DESIGN-ArithmeticDynamicsPartII.

**Evidence.**

research/blueprint/packets/ClassicalArithmeticCompletion.json: coverage {'stageId': 'ClassicalArithmeticCompletion:CA.4', 'status': 'source_decomposed', 'note': '… the Markoff surface, Vieta moves, positive tree, reduction modulo p and the definition of strong approximation (Martin items 1–13, with Bourgain–Gamburd–Sarnak and Zhang for the proofs) …'}; nodes CA.4/positive-markoff-triples, CA.4/markoff-vieta-involution, CA.4/markoff-descent-inequality, CA.4/markoff-root-generation ('Every x ∈ M is obtained from (1, 1, 1) by a finite word in the moves R₀, R₁, R₂'); the packet's sources contain no Gamburd–Magee–Ronan entry. git: e810b287 'Blueprint ClassicalArithmeticCompletion, second pass: 312 nodes under RS-03, with Bennett–Siksek and Martin covered' (2026-09-24 20:12) follows 1d2e34cf (review of this extraction, 2026-09-23 17:10). Issue #1025 body (updated 2026-09-27): added-source lines for Bennett–Siksek and Martin only. Item 5: 'For n = a = 3, k = 0 every Markoff triple reduces to (1, 1, 1) (Markoff)'. research/blueprint/queue.json: DESIGN-ArithmeticDynamicsPartIIMarkoff 'superseded', note 'folded into DESIGN-ArithmeticDynamicsPartII: one design per Part II parent (2026-09-28)'; DESIGN-ProbabilisticAndMetricNumberTheoryPartII 'pending'. The related area finding RT-AREA-elementary/1 (no Markoff target in CA.4) was rejected as a matter of timing. This finding is about the stage status and the missing node citations, not ownership.

**Fix.**

Items 1 and 5: add notes that their n = 3, a = 3, k = 0 special cases are planned at ClassicalArithmeticCompletion:CA.4 (nodes positive-markoff-triples, markoff-vieta-involution, markoff-descent-inequality, markoff-root-generation), and that the general (n, a, k) statements remain missing on route 1. Route 1 reason: add a note for the maintainer that CA.4 was marked source_decomposed without this source, so the BP-ClassicalArithmeticCompletion continuation must reopen CA.4 for items 1–5. Route 2 brief: name the transfer-operator Part II by its title and by the folded id ProbabilisticAndMetricNumberTheoryPartII, keeping the proposed id as an alias.

## What I checked

- Authorship. The extraction PAPER-GAMBURD-MAGEE-RONAN-19 is by Claude Code cc-fb70e5 (issue #1139, commit 9620dd68, 2026-09-22). The review REV-PAPER-GAMBURD-MAGEE-RONAN-19 is by Claude Code cc-442dc5 (issue #1140, commit 1d2e34cf, 2026-09-23). No errata record for this paper exists under research/blueprint/errata/, so there are no colliding ids. The string cc-f805bf occurs in none of the target files, the .review.json or the review report. This session did no part of the extraction or the review.
- Source (preprint). arXiv 1603.06267v3 from https://arxiv.org/pdf/1603.06267v3, fetched 2026-09-30. Its SHA-256 965e264e260ca42bbaa5a65f789e5cc6eb6117d70d7219603a3b855d29ba997a matches the recorded one. The arXiv API lists v1 (2016-03-20) to v3 (2018-06-13), and v3 is the last. I read the whole text myself (57 pp.): §§1–5, including the §5 matrix computations, and the references.
- Source (version of record). Annals of Mathematics 190 (2019) 751–809, from the publisher PDF https://annals.math.princeton.edu/wp-content/uploads/annals-v190-n3-p02-s.pdf (59 pp., SHA-256 c5e7ebb5322cdfd455735f13c2b420dba318089b382a3f78f40628efc838215a), fetched 2026-09-30. The publisher page gives 'Revised: 21 January 2019'. I collated §§1–4 and §5.1–5.2 with v3, statement by statement and at each of E1–E17; pp.801, 802 and 804 were checked on page images. Crossref for 10.4007/annals.2019.190.3.2 has no update-to, relation or updated-by, and the issue page lists no erratum. See finding 1.
- Every one of the 43 items was checked against its v3 locator: statement, hypotheses (n ≥ 3, a ≥ 1, k ∈ ℤ, 'V(ℤ) − E infinite', unexceptional base points) and numbers (β(3) = 2, β(4) ∈ (2.430, 2.477), β(5) ∈ (2.730, 2.798), β(6) ∈ (2.963, 3.048), log(n − 1)/log 2 < β(n) < log(n − 1)/log 2 + o(n^(−0.58)), c₁ = 2(n − 2)(n − 1), the bounds 6/5, 4/3, 4/5, 10/13, 6/7, 4/7, 32/49, 2/3 and 24/25). They are faithful apart from findings 4 and 6. The review's in-place corrections to items 6, 12, 15, 20, 21, 22, 23, 34, 40, 41 and 43 are correct.
- Completeness: every definition, lemma, proposition, theorem, remark and example of v3 has an item or is covered by one; the context remarks (Silverman's questions, Frobenius' conjecture, Remark 5, Kontorovich–Oh) need none. The Tauberian step inside §4.3 has no item and belongs to another owner (finding 2). Material only in the Annals text (Examples 16–17 on Cayley's cubic and a polynomial-point count, the extended Remark 5, the explicit point (1, 2, …, n − 1, 2(n − 1)!) in the proof of Lemma 20) is side material not on the way to Theorems 3, 10 and 13. It is noted under finding 1.
- Library claim, item 31: Mathlib 082e2d3 Mathlib/Analysis/PSeries.lean:317 'theorem summable_one_div_nat_rpow {p : ℝ} : Summable (fun n => 1 / (n : ℝ) ^ p : ℕ → ℝ) ↔ 1 < p', read at the pin. It is correct; Complex.summable_one_div_nat_cpow (Mathlib/Analysis/PSeriesComplex.lean:25) also exists.
- 'Missing' statuses. In both pinned libraries (declarations index and source grep) I searched for Laplace transforms, C¹ Banach spaces, transfer, Ruelle and Perron operators, Schauder/Tychonoff/Brouwer/Kakutani fixed points, Kato, Riesz and spectral projections, Hilbert metrics and Birkhoff cones, Lasota–Yorke, iterated function systems and attractors, the Gauss map, Wiener–Ikehara and Tauberian theorems, Markoff and Vieta. Mathlib has only SchauderBasis (Mathlib/Analysis/Normed/Module/Bases.lean:121), not the fixed-point theorem. Mathlib has the continued-fraction library GenContFract, which only touches the n = 3 illustration of item 24. Tau Ceti has a smoothed Dirichlet-series Wiener–Ikehara (TauCeti/NumberTheory/LSeries/WienerIkehara/) and a real-parameter Laplace transform of measures, neither of which is any item. No item is wrongly marked missing. The route 3 brief's Mathlib imports are wrong in part (finding 3).
- Planned status, item 30, against the PM.4 stage text in research/blueprint/atlas/roadmaps/ProbabilisticAndMetricNumberTheory.json, content/campaign/ProbabilisticAndMetricNumberTheory/README.md and the packet's PM.4 coverage (not_read, no nodes). See finding 4.
- Routes and owners. Route 1: ClassicalArithmeticCompletion packet (CA.4 coverage, the Markoff nodes, sources, git history) and issue #1025. Route 2: queue state of DESIGN-ArithmeticDynamicsPartII (pending; the Markoff design was folded into it on 2026-09-28), and the other accepted routes into the same Part II (PAPER-MARTIN-25 route 2, PAPER-GHOSH-SARNAK-22 route 5, PAPER-CHEN-24 route 2): no item there duplicates items 6–23. Route 3: DESIGN-ProbabilisticAndMetricNumberTheoryPartII (pending, with no other paper routed to that parent). There are no cycles; route 2 imports route 3 and not the other way round.
- Duplication search over all research/blueprint/papers/*.result.json items: transfer operators, Ruelle, renewal, Lalley, Kato perturbation, Schauder–Tychonoff, Perron–Frobenius, Rauzy, Ionescu Tulcea, Tauberian and Laplace, Mirzakhani, McShane, Baragar, Gauss map, spectral gap and continued fractions. The one real overlap is PAPER-WOOD-19 items 286–287 (finding 2); Duke–Imamoḡlu–Tóth continued fractions, Deligne's Fourier–Laplace transform and Ghosh–Sarnak's Markoff counts (routed to GeometryOfNumbersAndQuadraticArithmetic) are different statements. Atlas layer texts (research/blueprint/atlas/roadmaps/, research/blueprint/roadmaps/, content/campaign/*/README.md): no layer mentions transfer operators, Ruelle, renewal, Perron–Frobenius, Rauzy, Mirzakhani or simple closed geodesics; 'Schauder' occurs only as Schauder estimates (Tau Ceti PDE, OptimalTransport), and 'Ionescu' only as the Ionescu-Tulcea kernel theorem (OptimalTransport).
- Source issues E1–E17 re-verified at their v3 locators. E1: the amended repair is sound. The left half of (3.25) with the λ = e case gives M(w, a) ≥ N(f(w), a − 2ε₀); f(w) ≥ (0, …, ½, ½, 1) because w_(n−2) ≥ α(w)^(1/(n−2)); and positivity propagates through M(z, a) ≥ M(μz, a − d_μ) for μ ∈ Λ′, since Λ′μ ⊂ Λ′ and Λ′ is free. E3: (1, 1, 2) lies on V(3, 1, 4) and m₂ fixes it. E11: the proof of Lemma 28 needs 2ε. E12: (1, 3, 6, 15) lies on V(4, 1, 1), and λ₂ keeps z₁ = 1 while (1, 6, 15, 87) is next. E13: (1, m, m) on V(3, 2, 1). E14: trace 3m, length 2 arccosh(3m/2). E16: the corrected decomposition (1 − L)⁻¹ = λ(1 − λ)⁻¹P + (1 − LQ)⁻¹ was re-derived. E16 constant: the review's value 0.304 at w = (0, 1, 1) for n = 3 was confirmed by my own enumeration (0.3040 at e^a = 1000, 0.30398 at e^a = 4000). It equals h₂/(2|λ′₂|) = 3/π² with λ′₂ = −π²/(12 log 2), because (x + m)^(−s) = |T′|^(−s/2) makes λ′ half the Gauss Lyapunov exponent. E8: 2^s(3 + A)^(−s) is the correct bound. E9, E17: column sums re-derived from the displayed matrices. Missed issue: finding 6. Collation with the version of record: finding 1.
- Numerical checks: Proposition 40's eigenvector v₊ = (0, …, 0, 1, T₊, T₊(T₊ − A)) is fixed by γ_(n−1)^Aγ_(n−2) with ratio T₊ and lies in H (n = 4, A = 0, 1, 2, 5). By hand: Lemma 31 (4.5)–(4.6) at A = 0, 1; Example 8's matrix [[0, 1], [1, A + 1]]; Example 35's conjugation; the auxiliary bounds w_(n−2) ≤ ½, w_(n−3) ≤ ¼ on ∆_core and ≤ ⅓, ≤ ⅕ on ∆_cusp; Lemma 46's three cases, including its use of (5.1) at i = n − 2; the E8 bound; λ_s ≥ inf_w L_s[1](w) ≥ Σ_A (A + 2)^(−s) → ∞ as s ↓ 1 (item 41's note); and Remark 14's embedding argument.
- Review changes: the review's corrections (E1 amendment, E10–E17, the items above, and the briefs) introduced no error. What it missed are the version-of-record collation (finding 1), the Tauberian overlap (which appeared after the review, finding 2), the brief's Mathlib imports (finding 3) and the matrix misprint (finding 6).
- Checks run: python3 scripts/check_paper.py on the target reports ok. scripts/collation.py does not list this paper, because no issue is marked as affecting a stated result, which is why the missing sourceVersions went unnoticed.

## Summary

PAPER-GAMBURD-MAGEE-RONAN-19 is a faithful, careful extraction of arXiv v3, and its review's corrections hold. I re-read the whole of v3 and checked all 43 items. I re-derived the amended positivity repair (E1) and confirmed the corrected Lalley constant (E16) by enumeration: for n = 3 at w = (0, 1, 1), N/e^(2a) → 3/π² ≈ 0.304. The one library citation is correct. The work breaks in seven places. (1) The version of record was not collated. The publisher serves it; it was revised in January 2019, after v3. It already corrects E7 and E11 and parts of E2, E4, E5, E8 and E17, which the register lists as new; its numbering differs from v3 from Proposition 16 on; and sourceVersions is missing (medium). (2) The Tauberian step of §4.3 is the nondecreasing-Laplace Wiener–Ikehara–Delange theorem. PAPER-WOOD-19 route 10 (ArithmeticDirichletSeriesPartIIHigherPoleTauberian) plans it as item 286, yet route 3 tells the transfer-operator Part II to write out Lalley's argument itself (medium). (3) Route 3 imports a Laplace transform and a C¹ Banach space from Mathlib; neither exists at 082e2d3 (medium). (4) Item 30 is marked planned by PM.4, but PM.4 does not plan the L_s–Gauss conjugation for general s or Wirsing's theorem (low). (5) The prerequisites omit Parry–Pollicott, Ionescu Tulcea–Marinescu, Pollicott's notes and Baladi, which the RPF proof the brief requires depends on (low). (6) A misprint in the Jacobian matrix of the proof of (5.1) is missed (low). (7) CA.4 was marked source_decomposed without this source's route, items 1 and 5 do not cite the CA.4 Markoff nodes, and route 2 names a Part II id that was folded away (low). 7 findings: 3 medium, 4 low.
