# REV-PKG-SieveMethodsAndPrimePatterns

Verdict: **accepted after corrections**. Reviewer: Claude (Opus 5.5), session `claude-0KXWey`.
Date: 2026-10-14. Job: #9240. The package was written for #9195 by Codex, session `codex-DRerHK`.
This reviewer took no part in the package, the plan or the plan's review. No subagent was used.

## Scope and method

I read the whole package (`README.md`, 3,799 lines; `Suggested.lean`, 724 lines; `metadata.toml`)
against the accepted plan `research/blueprint/packets/SieveMethodsAndPrimePatterns.json` and the
package handoff. I followed PACKAGE_REVIEW.md, PROTOCOL.md sections 5, 13 and 20, and
UPSTREAM_GUIDE.md, and compared the form with upstream `AdelicAlgebraicGroups` and
`ReductiveGroupsPartII`. I checked statements and worked examples by hand. Exact certificates and
finite counts were recomputed by script (scratch only, not committed). Every Mathlib name the README
cites (199 names) was elaborated with `#check` at the pinned Mathlib. Source locators were checked
against freshly downloaded public copies.

## The six criteria

| Criterion | Finding |
| --- | --- |
| 1. Upstream form | Fixed. The README had the right top-level shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, six layers each ending in Examples and Dependencies, Downstream consumers, References. Its subsections did not read well. Twelve subsection titles occurred two or three times (28 headings in all), because topic labels had been split by the dependency sort (for example 0.5/0.7/1.4, 1.1/1.3, 1.6/2.8/2.11, 2.1/2.10, 3.1/3.3, 5.3/5.6). Fifteen standing-hypothesis paragraphs were repeated verbatim in up to 12 targets each, and 224 proof paragraphs began "To establish the result," followed by an artificially lower-cased word ("eS.0", "bombieri", "möbius", "dirichlet", "i_k"). Hundreds of tokens had lost their spaces ("Theorem1", "weight1", "toF", "arXiv1809…"). All of this is corrected; see "Changes" below. |
| 2. Fidelity to the plan | Pass. All 224 plan targets are in the README (checked by name before and after the edits), with their hypotheses. Internal prerequisites were checked mechanically: every `Layer k` citation names a target of that layer placed earlier, with no forward or upward reference. The four supplier requests of the plan (GN.4 ×2, AA.4, AC.1, ES.0) are kept as requests. Their wording now says honestly that the current owner plans do not state them (see Suppliers). |
| 3. Own words, locators | Pass after corrections. There is no source passage and no section-by-section summary. Three errata entries had kept a bare displayed formula as their first "sentence"; they are reworded. The locator corrections are listed under Sources. |
| 4. No process | Fixed. I removed "campaign register", "was not read (gap)", "unread", "Recomputed here", "Checked on the page image", "inspected in the publisher scan at full resolution", "version-of-record scan", "checked via" and an uncited "2007 p.x" edition in eight Kedlaya headings. Open proofs are now stated as proof requirements, not as what a worker did or did not read. |
| 5. Suggested.lean | Pass after one fix. `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474: exit 0, 101 warnings, all `declaration uses 'sorry'`, no errors and no other warnings, both before and after the edit. 725 lines. 17 of the 40 README definitions are real-bodied declarations; the other 23 are named in the closing comment. There are 32 theorem signatures and 68 `example`s, no sorry'd data, no `True` placeholder and no `#eval`/`#print`. **One unit test was false:** `example : discrepancy 10 3 = 1/2`. The value is 1: π(10;3,1)=1, π(10;3,2)=2 and π(10)/φ(3)=2, as the README's own Check `discrepancy_ten_three` says. Corrected. I compared 24 signatures with their README statements (list below); they agree. |
| 6. metadata.toml | Pass: `topic = "math.NT"`. |

`python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.

Signatures compared with the README: `abs_siftedSum_sub_eulerProduct_le`,
`mainSum_sub_errSum_le_siftedSum`, `selberg_weighted_inner`, `bombieri_diagonal_offDiagonal`,
`HasLogSieveDimension` (inclusive `p≤z` via `range (⌊z⌋+1)`), `HasProductSieveDimension` (strict
`p<z` via `range ⌈z⌉`, correct for integral and non-integral z), `remainderMass`, `HasSieveLevel`,
`rho`, `discriminantCharacter` (Lean `Int.emod` gives the Kronecker dyadic value for negative D),
`selberg_upper_bound` (no sign hypothesis on X is needed), `prime_interval_upper`,
`twin_goldbach_upper`, `additive_largeSieve`, `primitive_largeSieve`, `linnik_exceptional`,
`prime_quadratic_bilinear`, `jutila_real_character_mean`, `vaughan_identity`, `PrimesHaveLevel`,
`windowError`, `bombieri_vinogradov_maximal`, `infinite_many_primes_of_level` (k=0 and k=1 are true
with `maynardM 0 = 0`, `maynardM 1 = 1`), `affine_expansion_level`.

## Sources

More than fifty locators were checked against public copies, including every source that the
packaging handoff flagged as not re-read.

| Source | Checked | Result |
| --- | --- | --- |
| Kedlaya Ch. 11 | Definition 11.6, (11.4.1), Lemma 11.5 (Rankin, §11.3), Lemmas 11.7–11.8, (11.4.2), Theorem 11.9, Theorem 11.11 proof | correct. Lemma 11.8 does give (log z)^(κ+1), as the README says; both §11.5 errata hold (A_d≠0 for d=1155>33; Σ(log p)/p=O(log z) does not give κ=2) |
| Kedlaya Ch. 12 | D± (§12.2), y_m (§12.3), (12.3.1), Lemma 12.1, Theorem 12.2 (β=9κ+1, e^(β−s)K^10) | correct; the sign error in the second display of Theorem 12.2 is confirmed |
| Kedlaya Ch. 14 | (14.1.1)–(14.1.5), (14.2.1), H_g | correct |
| Kedlaya Ch. 15 | Lemma 15.1, Lemma 15.4, Theorem 15.5, Exercises 15.4.2, 15.4.4 | **two section numbers fixed**: Lemma 15.4 is in §15.2 (not §15.1), Theorem 15.5 in §15.3 (not §15.2) |
| Kedlaya Ch. 16 | (16.1.1)–(16.1.2), Theorems 16.1, 16.2, 16.4, Lemma 16.5, Definition 16.6, Theorem 16.7 | correct; seven errata headings that gave no locator now name their section and result |
| Kedlaya Ch. 17–18 | Theorems 17.1, 17.4; Definition 18.1, Lemma 18.2, Theorem 18.3, (18.1.2), Theorem 18.4, Theorem 18.5, Corollary 18.6 | correct. Theorem 18.4 is the fixed-cutoff ψ-form, and the README now says so where it is used (`primesHaveLevel_of_lt_half` needs only that form) |
| Heath-Brown, Lectures on sieves (arXiv v1) | §1 (1.1)–(1.8), Corollary 1.1; §2; §3; §4; §5 (5.1)–(5.8), Theorem 5.1, Corollary 5.1, Fundamental Lemma p.38; §6 (6.1)–(6.7), Theorems 6.1–6.2, Chen sketch | **six locators fixed**: the interval bound is (3.3), p.16, from Corollary 3.1 (p.12), not "Corollary 3.1, p.18"; Brun–Titchmarsh is (3.5)–(3.6), pp.17–18, not "Corollary 3.2"; Goldbach and twins are Corollary 3.2 (p.14) with Theorems 3.1–3.2 (pp.20–21), and there is no "Corollary 3.4"; Brun's Corollary 3.3 is on p.21; the Selberg bound is the unnumbered "Fundamental Theorem" (pp.11–12), not "Theorem 2.1"; Lemma 2.1 uses (2.2)–(2.6), not "(2.5)–(2.10)"; the parity sequences are on pp.24–25 with (4.2), not pp.22–24 with (4.1) |
| Heath-Brown 1995 (Acta Arith. 72) | Theorem 1 p.237, Corollaries 1–4 pp.237–238, §2 p.240, §9 pp.265–267 | reachable now and correct, except that **Corollary 4 is proved on p.267** (pp.274–275 hold Theorem 2 and the references). The proof sketch now follows the source (m=kr², Corollary 3) |
| Maynard 2015 | (1.3), Theorems 1.1–1.4, Propositions 4.1–4.3, (4.1), (4.4), footnote 2 (p.390, Engelsma), Lemmas 5.1–5.3, 6.1–6.3, (6.18)–(6.19), (7.10), Lemmas 8.1–8.2, (8.10), Lemma 8.3, (8.15)–(8.17) | correct (printed page = PDF page + 382). The 105-tuple in the README equals the published footnote list |
| Khayutin 2019 | Definitions 9.1, 9.6, 9.15, 9.24; Lemmas 9.2, 9.3, 9.8, 9.9, 9.11–9.13, 9.18, 9.20, 9.21, 9.23; Theorem 9.7, (47); Propositions 9.25–9.26; Appendix B (B.1–B.8) | correct (the PDF has a one-page shift from printed p.259; with it the appendix locators hold), except that **Proposition 10.10 is on p.245** and the ideal-count function is **Definition 10.5, p.242** |
| Koymans–Milovic (arXiv v1) | Theorems 1–2, §§2.1–2.6, (2.1)–(2.6), Conjecture C_n, Corollary 2.2, Lemmas 3.1–3.2, §4, (4.2)–(4.3), (P1)–(P3), Lemma 4.1 | **page numbers fixed**: Lemma 3.1 p.10 (proof pp.10–12), not pp.13–14; Lemma 3.2 pp.12–14, not pp.15–17; (2.5), (2.6), Conjecture C_n and Corollary 2.2 on pp.6–7; §2.6 pp.7–8; (4.2)–(4.3) p.18; (P1)–(P3) and Lemma 4.1 p.20 |
| Skorobogatov–Sofos, BGS, GGPY, BSKK, FIMR, Smith, Koymans–Pagano, Bennett–Siksek | SS pp.674–675 and Lemma 6.3; BGS Theorems 1.1–1.2, primitivity p.561, Propositions 3.1–3.2, (3.23), (3.47), (3.51); GGPY Lemmas 3–4 and (2.3)–(2.5); BSKK Lemmas 3.7, 6.2, 8.2, 8.3 and (8.1)–(8.3); FIMR Lemma 2.1 and Propositions 5.1–5.2; Smith Proposition 6.6; KP Proposition 7.6 and (7.11); Bennett–Siksek Theorem 7 and (34) | correct |
| Bombieri 1971, Jutila 1975, Iwaniec 1980, Chen 1973 | scans without a text layer | not re-read here. The Jutila link was dead (404); it is replaced by the working `…/aa/aa27/aa27116.pdf`, whose title matches |

The References section had truncated entries (for example "Live author HTML, Chapter 16,"), a
duplicated author and missing spaces. It is rewritten with the same 25 anchors and complete
entries. All 25 links resolve.

## Suppliers and gaps

The cited Tau Ceti roadmap layers all exist with the stated content. GlobalNumberFields Layer 3 has
items 3A–3D and Layer 11 has orders and Picard groups; ClassFieldTheory Layer 14 is Hilbert and
quadratic reciprocity; Chebotarev Layer 13 is ϑ_C and π_C; IntegralLattices Layers 0 and 3;
ArithmeticDirichletSeries Layers 1, 2 and 5; AdelicAlgebraicGroups Layer 4 (§4.2, strong
approximation). The AnalyticNumberTheory and FiniteFieldsAndCharacterSums nodes cited by id exist
in their packets.

Four plan-level supplier requests are not met by their owners' current plans. I recorded each as an
open request and hypothesis instead of an existing contract:

- GeometryOfNumbersAndQuadraticArithmetic Layer 4 states Henk's bound and Davenport's estimate. It
  does not state the curvature-uniform planar estimate (C², θ=2/3; C³ ellipses, 131/208), nor the
  sliced-domain Widmer counts or the codimension-two count behind KM Lemmas 3.1–3.2.
- AdditiveCombinatorics Layer AC.1 states the abelian Balog–Szemerédi–Gowers theorem and PFR. It
  does not state the BGS squarefree-ring sum-product theorem or the SL₂ flattening input.
- AdelicAlgebraicGroups Layer 4 states strong approximation for the rational points of a group, not
  for a finitely generated Zariski-dense subgroup with its squarefree reduction images.
- ExponentialSumsAndCircleMethod states C_n as `shortCharacterHypothesis` in its **Layer 1** (§1.3),
  which the README called "ES.0". Its progression form covers moduli coprime to q only. The
  README now cites Layer 1 and places the q∤k reduced-conductor progression corollary and the
  C_(tn)→C_(|T|n) transfer in this roadmap's `joint_spin_short_input`. The plan's node already
  contains both arguments, so no target was added.

Ordering, for the maintainer: CaraianiNewton.md leaves this roadmap out of the 94-roadmap order
(only its large-sieve layer moves down into ArithmeticStatistics ST.2). Its atlas suppliers
AnalyticNumberTheory, FiniteFieldsAndCharacterSums, AdditiveCombinatorics,
ExponentialSumsAndCircleMethod and GeometryOfNumbersAndQuadraticArithmetic are not yet Tau Ceti
roadmaps. So the draft PR has to wait for them, or for a decision on which notions move down. No
upward citation, `FoundationsAndLibraryIntegration` id or `UPSTREAM:` id occurs.

The inherited open proof requirements are kept unchanged at their targets:
- Halberstam–Richert, Lemmas 5.3–5.4;
- Khayutin's R₂ step, (47);
- Richert (1969), Theorem A;
- KM 2018, Proposition 3.6, and DFI, Lemma 9;
- the general-κ Iwaniec functions;
- the BGS §4 flattening and the absolute affine mixing;
- the Heath-Brown 1995 §§3–8 iteration and Jutila's 1973 input.

## Duplication against current TauCetiRoadmap and Tau Ceti

I read TauCetiRoadmap main (all 54 roadmaps, including the nine newer than the atlas snapshot, and
`Completed/`) and the Tau Ceti library at a91d3aaf, searching by object: sieve weights, the large
sieve, Bombieri–Vinogradov, Vaughan, admissible tuples and Maynard, Rosser and Chen, Gram rows,
Hilbert's inequality, parity, Bouniakowsky and Schinzel, spins, affine sieves and the Kronecker
character. Nothing in the sieve roadmap exists there. Every "sieve" hit in Tau Ceti is a
category-theoretic sieve. The one overlap is `TauCeti.Multiquadratic.fundamentalDiscriminantChar`
(current library, not at the pin), the quadratic character of a fundamental discriminant. The README
keeps the general discriminant character, because Jutila's mean value runs over every non-square
D≡0,1 mod 4. Scope and ownership now say in one clause how it differs, and an API item
`discriminantCharacter_eq_fundamentalDiscriminantChar` records the agreement on fundamental D.
Removals: **none**.

## Adversarial mathematics pass

| Statement | Instances tried | Result |
| --- | --- | --- |
| Legendre identity, Euler product with signed remainder, absolute error (0.1) | P=6 on {1,…,10} and on {0,1,2,3,6}; P=1 with A₁=10, X=7; first Bonferroni at support {6} | values 3, 1, 3, −1 as stated |
| Finite families and residue-class sieves (0.2–0.3) | n(10−n) for n=2..8 (7 parameters, 4 labels); bad class {1} mod 2; Q={2,3} with an empty Ω₂; ν(4)=1/2; label of 33 is 1155 | as stated |
| Gram inequalities (0.4) | x=1, y=i over ℂ (coefficient −i); x=1, y=2 over ℝ (defect 0, printed 9/16); y=(1,2) (rows 3, 6; sum 1; 5≤6); squared denominators at y=1/2 | as stated |
| Dimension, remainder mass, Rankin (0.5) | P={2}, g=1/2; strict cutoffs D=1,2,3,6,7; log-dimension Euler bound via partial summation; Eratosthenes split with X≤Mx | as stated; the source's (log z)^(κ+1) is confirmed |
| Discriminant character (0.6) | χ₅(2)=−1, χ₈(2)=0, χ₈(3)=−1, D=−3,−4,−7 under `Int.emod`; D=1 not periodic | as stated |
| Binary densities, conics (0.7–0.8) | ρ for x₀, 0, 2, x₀² modulo 4 and 9; lifting identity at p=2; brute force of the regular density (330 cases), the singular recursion (192 cases) and the genus sum (576 cases, p=3,5,7) | all agree; the corrected genus factor (−ωu/p) gives 18 at p=3 where the printed one gives 9; ρ/p^(3n/2) ≤ 1.07 against the claimed 16 |
| Selberg weights (1.3) | P=6, ν(2)=1/2, ν(3)=1/3, z=4: G=5/2, λ=(1,−4/5,−3/5,0), quadratic form 2/5; P=2 at z=2 and z=3 | as stated |
| Brun coefficients (1.2) | P=6 with y=100 and y=4; P=2, y=8; support bound d<y by parity of r | as stated |
| Classical applications (1.6) | Heath-Brown's cutoff z=√y/(log y)^k | **fixed**: k=2 would leave a remainder ≍ y/log y; k=3 (the source's choice) gives O(y/(log y)³) |
| Taper and interval vectors (2.1–2.2) | (N,L,x)=(1,1,1/4), (0,2,0), (1,2,0); Gram value −1 at a half-turn; padding for H=2,3 and L=0,1; phases for H=2, M=−2 and H=1, M=0; ⌊1/δ⌋ choice with π²/12≤8/9 | as stated |
| Characters (2.3) | τ for modulus 1 and the principal character mod 4; Parseval at q=4 | as stated |
| Duality (2.6) | conjugated versus unconjugated adjoint | **corrected**: the README called the conjugate "essential", but Kedlaya's unconjugated Lemma 15.4 is equivalent after conjugating b |
| Vaughan (2.4) | λ₄(4)=0, λ₂(4)=log 2, λ₂(12)=log 6; identity at n=V=2; support endpoint V=2, N=12, m=4 | as stated |
| Dyadic kernel (2.5) | H=K=0, R=2, J=3: 112 ≤ 126; Q=5, R=2, J=2 | as stated |
| Quadratic symbols (2.7) | symbol₂(3,2)=1 against Kronecker −1; KP normalisation from Smith's bound | as stated |
| Level of distribution (3.1) | discrepancy(10,3); level 0; levels θ>1 fail | README correct (1); **Lean example was 1/2, fixed** |
| BV to every level below 1/2 (3.3) | uses BV only at each fixed cutoff | wording **fixed** (it attributed the maximal form to Kedlaya Theorem 18.4) |
| Maynard certificates (4.6) | M₅ by direct monomial Dirichlet integration and by Lemmas 8.1–8.2; printed G; all 42 M₁₀₅ coefficients | I₅=29509/1222452000 and ratio 1417255/708216 by both routes; the printed G gives 26784/17753; M₁₀₅ ratio 4.000543795842…>4 with I and ΣJ equal to the displayed exact rationals |
| Kernel counterexample (Lemma 8.2) | F=∂ₓ∂ᵧ[x²y²(1−x−y)²] | expansion equals the Lean polynomial; I₂=1/3150, F(1/4,1/4)=1/128, fibre integrals 0 |
| Admissibility and gaps (4.1, 4.7) | {0,2,6,8,12}; the 105-tuple modulo all 27 primes ≤105; first k primes above k at k=5 | admissible, diameter 600, equal to the published list |
| Richert threshold (5.2) | Λ₁=1, Λ₂≈1.834 (1/Λ₂≈0.545>1/2), Λ₃≈2.771 | P₃ from level near 1/2, and not P₂, as stated |
| Chen constants (5.5) | (24) envelope; V; final margin; Chen weights at N=1000 | 0.4924632564…<0.49255; V≈−0.0164726271 in (−0.0164727,−0.0164725); 8(log 4−½log 8+V)=2.6408077>2.6408; 2.6408−3.9404/2=0.6706 |
| Linnik overcount (errata) | ordered prime pairs against distinct √N-smooth integers | 36745 against 35819 at N=10⁵, 387659 against 344299 at N=10⁶, as stated |
| Spins, ideal symbols (5.3, 5.6) | (2/(5O_K))=1 in split, inert and ramified quadratic fields; cyclic cubic S={σ} | as stated |

## Changes

README (each change keeps the plan's targets, hypotheses, Checks and locators):
1. **Structure.** Layers 0, 2, 4 and 5 are regrouped into subsections that each say what they hold,
   for example 0.1 weighted divisibility identities, 0.2 weighted finite families, 0.3 residue labels
   and residue-class sieves, and 2.1 tapered Fourier vectors. No titles repeat, and the order of
   targets is unchanged except for four moves that respect dependencies: `leastNonresidue`,
   `koymans_pagano_row_mean`, `chenWeight` and the positivity criterion each now sit beside the
   results that use them. A script confirmed that every original paragraph survives, and that all 224 targets
   and all within-layer prerequisites keep their order.
2. **Standing hypotheses.** The fifteen repeated hypothesis paragraphs are stated once, at the start
   of their subsection ("Throughout this subsection, unless a statement says otherwise: …"). Each
   target keeps the hypotheses that are specific to it.
3. **Prose.** "To establish the result, …" is now "*Proof sketch.* …" for theorems and
   "*Construction.* …" for definitions, with the lower-casing artifacts repaired. 343 run-together
   tokens are spaced, outside code and URLs only.
4. **Locators.** The Kedlaya Ch. 15, Heath-Brown §§2–4, Heath-Brown 1995, Khayutin and
   Koymans–Milovic locators listed above are fixed, as are the Jutila URL and the Kedlaya Ch. 16 and
   Ch. 18 errata headings.
5. **Suppliers.** Scope and ownership and the supplier contracts now state the four unmet requests
   as requests. "ES.0" becomes ExponentialSumsAndCircleMethod Layer 1, and "ES.4" its Layer 5.
   "AA.4" becomes AdelicAlgebraicGroups Layer 4. IntegralLattices Layers 0 and 3 are added to the
   conic adapter and to Layer 0's dependencies. The *Needs* capitalisation is fixed ("Hilbert",
   "Picard", "Mathlib `LSeries`"), and "Earlier Layers 0." becomes "Layer 0." in the dependency lines.
   Downstream consumers now name ExponentialSumsAndCircleMethod Layer 5 and ArithmeticStatistics ST.2.
6. **Mathematics.** The Heath-Brown interval cutoff is (log y)³; the duality remark is corrected; the
   Bombieri–Vinogradov input is stated in its fixed-cutoff form; the Heath-Brown Corollary 4 sketch
   now follows the source; `thetaDensity_nonneg`, which states θ≥1, is renamed `one_le_thetaDensity`;
   and the comparison with Tau Ceti's fundamental-discriminant character is added.
7. **Errata and references.** The three corrupted Maynard entries and the Kedlaya Theorem 12.2 entry
   are reworded. Five garbled "the source convention below" phrases are repaired. The References are
   rewritten.

Suggested.lean: the false example `discrepancy 10 3 = 1/2` is now `= 1`, with a docstring giving
the two class counts. Nothing else changed. lean-check: exit 0, 101 `sorry` warnings only.

## Questions for the orchestrator

- Should the four unmet supplier requests be sent to their owners (GeometryOfNumbersAndQuadraticArithmetic
  Layer 4, AdditiveCombinatorics AC.1, AdelicAlgebraicGroups Layer 4), or should the notions move down into
  this roadmap as targets? Either needs a plan change, which a package review cannot make.
- This roadmap sits outside the CaraianiNewton order, and five of its atlas suppliers are not yet Tau
  Ceti roadmaps. Its draft PR needs a decision on ordering or bundling.
