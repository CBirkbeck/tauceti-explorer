# PAPER-CHANG-CHEN-MISHIBA-23 — Thakur’s basis and its analytic inputs

Original extraction: Claude Code `cc-7b31c4`, issue #1380, 22 September 2026.
Original independent review: Claude Code `cc-fb70e5`, issue #1381, 23 September 2026.
Verified red-team fixes: Codex `codex-rtOQ9t`, issue #5002, 30 September 2026.

Chieh-Yu Chang, Yen-Tsung Chen and Yoshinori Mishiba, *On Thakur’s basis conjecture for multiple zeta values in positive characteristic*, Forum of Mathematics, Pi **11** (2023), e26, [doi:10.1017/fmp.2023.26](https://doi.org/10.1017/fmp.2023.26). The [v2 preprint](https://arxiv.org/abs/2205.09929v2), dated 11 July 2022, and the published PDF each have **32 pages**. The preprint numbers statements by subsection; the published article numbers them by section. The earlier complete reading is retained as attributed history. This fix read the affected statements and proofs in §§1.2–1.4, §5 and Appendix A, and checked the analytic and operator formulas against the TeX. It does not claim a fresh exhaustive collation.

The extraction now has **72 items: 1 library, 7 planned and 64 missing**. Every missing item is routed exactly once. The four routes contain 58 Part II items, 5 DM.8 source items, 4 DM.2 source items and 2 DM.6 source items; source routes also include planned items. The original two route positions are preserved. Routes 3–4 and the revised scope require independent fix review.

## What the paper proves


Let `A = F_q[θ]`, `k = F_q(θ)`, `k_∞ = F_q((1/θ))` and `A_+` the monic polynomials — the function-field analogue
of the positive integers. Thakur's multiple zeta value at an index `s = (s_1, …, s_r)` is
`ζ_A(s) = Σ 1/(a_1^{s_1} ⋯ a_r^{s_r})` over `a_i ∈ A_+` with `|a_1|_∞ > ⋯ > |a_r|_∞`; it converges, and is
non-zero by a theorem of Thakur. Write `Z_w` for the `k`-span of the MZVs of weight `w`.

* **The main theorem (Theorem 1.2.4 = published Theorem 1.5).** For every `w ≥ 1`, Thakur's basis conjecture
  holds: `{ζ_A(s) : s ∈ I^T_w}` is a `k`-basis of `Z_w`, where `I^T_w` consists of the indices of weight `w` with
  `s_i ≤ q` for `i < r` and `s_r < q`. Since `|I^T_w| = d'_w`, this gives Todd's dimension conjecture
  `dim_k Z_w = d'_w`, the analogue of Zagier's conjecture, where `d'_w = 2^{w-1}` for `w < q`,
  `d'_q = 2^{q-1} − 1` and `d'_w = Σ_{i=1}^q d'_{w-i}` for `w > q`.
* **All linear relations (Theorem 5.4.2 = published Theorem 5.3).** The kernel of the realisation map
  `H_w ↠ Z_w` is spanned by `[s] − U^ζ(s)` for `s ∈ I_w \ I^T_w`, where `U^ζ` is the explicit rewriting operator
  of Definition 3.2.2. This answers, in its `q`-shuffle form, a conjecture of Todd, and gives an effective
  algorithm expressing any MZV in Thakur's basis.
* **Method: from MZVs to CMPL values.** By Carlitz's identity `1/L_d^s = Σ_{a ∈ A_{+,d}} a^{-s}` for `s ≤ q`, one
  has `ζ_A(s) = Li_s(1)` on Thakur's index set, where `Li_s` is the Carlitz multiple polylogarithm. The paper
  works on a formal weight-graded `k`-space `H` with basis the set of indices, carrying the harmonic product
  `*^{Li}` and the `q`-shuffle product `*^ζ` (built from H.-J. Chen's formula with its correction terms
  `Δ^{[j]}_{s,n}`), and three realisation maps `𝔏^•_d`, `𝔏^•_{<d}`, `𝔏^•` which are algebra maps
  (Proposition 2.3.5). The stuffle relations for CMPLs and the `q`-shuffle relations for MZVs thereby become one
  formal statement.
* **Generation (Theorem 3.2.4, Corollary 3.2.5, Theorem 3.2.6).** The operator `U^•`, defined from the
  decomposition `s = (s^T, q^{{m}}, s')`, the box-plus operator and the maps `α_q`, satisfies
  `𝔏^•(U^•(P)) = 𝔏^•(P)` and, after finitely many iterations, carries any element of `H` into the span of
  Thakur's indices. This reproves Ngo Dac's generating theorem — effectively, and simultaneously for both
  realisations — and yields the second generating set `{Li_s(1) : s ∈ IND_w}`, indexed by tuples with `q ∤ s_i`.
* **Independence (Theorem 4.3.5, Lemma 5.1.1, Theorem 5.2.1).** Through the period interpretation of CMPL values
  and the **ABP criterion**, a relation `Σ α_s(θ) Li_s(1) = 0` produces a solution of an explicit system of
  Frobenius difference equations `(E_w)` indexed by initial segments of the indices in `IND°_w` — the tuples whose
  entries after the first are divisible by `q − 1`, the shape dictated by the simultaneously Eulerian phenomenon
  of Chang–Papanikolas–Yu. The solutions are rational and degree-bounded (Lemmas 4.2.2, 4.2.3), and the solution
  space `X_w` has `F_q(t)`-dimension `1` if `(q − 1) | w` and `0` otherwise (Theorem 4.3.5); this forces the
  relation to be trivial, so `{Li_s(1) : s ∈ IND_w}` is a basis, and `|IND_w| = |I^T_w|` (Proposition 2.1.1)
  transports the conclusion to Thakur's basis.


Published Remark 5.4 adds the `k̄`-linear version of the relation theorem, using Chang’s existing descent theorem; item 42 now records it. Corollary 1.8 is recorded with the corrected **k-span and dim_k**. Its proof uses the graded k-algebra specialization to v-adic values, whose kernel contains `ζ_A(q−1)`. Multiplication by this nonzero infinite-adic value embeds `Z_(w−(q−1))` into `Z_w`, giving the dimension drop. Set `Z_0=k` and negative weight spaces to zero. Extending a finite k-spanning family gives the corresponding bound for a k̄-span with **dim_k̄**.

## Existing libraries and supplier ownership

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, `RatFunc.inftyValuation`, `RatFunc.inftyValued` and `RatFunc.CompletionAtInfty` already give the infinity valuation and completed valued field. Item 1 reuses them. The remaining analytic adapter, item 71 at DM.2, must install the normalized real norm and identify the Laurent variable with **u=1/θ**, not θ. `LaurentSeries` by itself is not that comparison.

`PowerSeries.IsRestricted`, `PowerSeries.isRestricted_iff'` and `PowerSeries.IsRestricted.subring` already provide the radius-one restricted-series carrier over a normed ultrametric ring. Item 30 remains missing as a whole: the C_∞ normed field, Gauss norm and completeness, twisting/fixed fields, analytic convergence/evaluation and the ABP ring E’s finite-coefficient-field condition remain to be supplied. The declarations were read at the pin. The reviewed DM.0/2/4/6/8 and FA.0 audits were checked, and targeted declaration searches found no Carlitz/Thakur/ABP implementation in either pinned Lean tree.

The completed algebraic closure C_∞ has **one owner, DM.2**. FA.0 provides function-field foundations, not C_∞. Item 4 now covers only the Carlitz module and its exponential/period at DM.0/DM.2. The depth-one zeta definition is item 52, requested at DM.6 and shared with the singleton case of item 3. The exact needed evaluation, item 64, is
`ζ_A(q−1)=−(θ^q−θ)^−1 π̃^(q−1)≠0`.
Taelman’s `L(C/A,1)` target did not supply this general-q formula as stated. Reuse `PAPER-IM-KIM-LE-ETAL-24/carlitz-zeta-q-minus-1`; do not create a second proof owner. Part II item 65 combines it with the graded q-shuffle product to put `π̃^w` in `Z_w` when `q−1` divides w. The full Bernoulli–Carlitz formula is unnecessary here.

## Routes and the analytic interface

**Route 1 — Part II, 58 items.** `DrinfeldModulesAndTModulesPartII` joins the accepted Ngo Dac and Im–Kim–Le–Ngo Dac–Pham extractions. It owns the higher-depth CMPL/MZV theory and the explicit rewriting calculus. Its general algebraic and analytic suppliers remain in the parent roadmap; PS.9 supplies only orientation about classical real MZVs. The design brief contains the final theorems, all new items and precise supplier requests. Open parent proof work does not prevent this extraction or the design from proceeding with requests.

The newly explicit analytic sequence is: deformed denominator polynomials (54), the `Q_i=1` CMPL series (55), entire convergence (56), Frobenius-orbit specialization (57), arbitrary-prefix matrices (62), the extended entire ABP vector (63), and normalized lifting (51). The last-entry exponent in the recurrence is retained. The matrices work for every nonempty `M⊂I_w`, not only the later set `IND°_w`. The zero-weight case is separate. Section 5 actually constructs these matrices; the introductory remark omits the dual t-motive interpretation, not this construction.

Ngo Dac’s `L-series` contains Anderson–Thakur polynomial factors and specializes to `Γ_sζ_A(s)/π̃^wt`. CCM’s all-ones CMPL series is a **Q_i=1 specialization of the general construction**, not an equality with that Ω–H series. The joint design should share the generic series and supply this adapter. Item 72 explicitly requests Chang’s CMPL descent theorem, including its nonzero-value, finite-family and distinct-positive-weight hypotheses. The MZV-only instance does not cover every CMPL prefix used in the proof.

**Route 2 — DM.8, 5 items.** Items 30–31 and 59–61 give the analytic setting, ABP, `Frac(T)^σ=F_q(t)`, uniqueness of fundamental matrices and the rational common-denominator theorem. The latter retains both hypotheses `det Φ_i=c_i(t−θ)^m_i`, with `c_i≠0`, `m_i≥0`. Reuse Ngo Dac’s `constant-denominator` and `trivialization-uniqueness`. CPY’s printed polynomial domain for a rational matrix is already recorded in Ngo Dac E10; this fix imports its corrected rational reading.

**Route 3 — DM.2, 4 items.** Items 2, 53, 58 and 71 supply C_∞, Ω and period normalization, the period-power field criterion, and the norm/Laurent comparison. Reuse Ngo Dac’s `omega`, `period-power` and `C-infinity`. DM.2 exports the analytic properties of Ω; DM.8 interprets them in its T/E structures, so the Ω definition does not depend back on difference-Galois theory.

CCM uses `π̃=+1/Ω(θ)`. The current DM.8 request follows Papanikolas with `π_P=−1/Ω(θ)`. For the same Ω these differ by `c=−1∈F_q^×`; another choice of root can give another such scalar. Eulerian lines `k·π̃^w` agree, but exact normalized weight-w values change by `c^(−w)`. The q−1 evaluation is invariant. The normalization must be transported explicitly.

**Route 4 — DM.6, 2 items.** Items 52 and 64 provide the depth-one sum and the exact evaluation above. The supplier does not depend on the higher-depth MZV construction; the consumer proves the singleton/CMPL comparison and the graded-product adapter.

**Live delivery status.** On 30 September 2026 both [#1008](https://github.com/CBirkbeck/tauceti-explorer/issues/1008) and [#1009](https://github.com/CBirkbeck/tauceti-explorer/issues/1009) already contain seven added-source entries: Ngo Dac at DM.0/2/4/6/8, Im et al. item 27 at DM.8, and CCM items 30–31 at DM.8. This resolves the red team’s historical missing-delivery observation. The current DM.0 and DM.8 packets remain partial; DM.8 has nine nodes and three substantial gaps. Source delivery is not completed analytic coverage. After independent review, propagate this repair’s expanded/new source routes through normal queue generation and fulfill the concrete requests in the owning blueprints. No live issue, packet, queue or campaign file is edited by this fix.

## Appendix definitions and tests

Item 45 now distinguishes all-weight binary relations `P^•` from `P^•_w=P^•∩(H_w⊕H_w)`. Items 66–68 give the actual formulas for B, C and BC, including the correction terms, positive-weight domain, nonempty s and m=0 identity. Items 69–70 define Init and all three components of U, with both empty/nonempty-tail branches. Item 46 states preservation; item 48 uses the definitions to prove progress only off Thakur’s index set. Every new definition/construction has an API, recorded uses and at least three planned tests. The exact formulas and tests are in the JSON, rather than replaced by composition names.

## Corrected bibliography

The JSON has fourteen prerequisite records; the two already registered sibling papers are marked for reuse rather than another paper job. Corrections checked against arXiv, publisher pages, the paper’s bibliography and publisher-deposited Crossref metadata:

| Input | Correct identifier or attribution |
|---|---|
| Chang, CMPLs and descent | [arXiv:1207.2326](https://arxiv.org/abs/1207.2326) |
| Ngo Dac, Annals 194 (2021) | [10.4007/annals.2021.194.1.6](https://doi.org/10.4007/annals.2021.194.1.6), public [HAL copy](https://hal.science/hal-03298790) |
| Chang–Papanikolas–Yu | [arXiv:1411.0124](https://arxiv.org/abs/1411.0124) |
| Huei-Jeng Chen | [10.1016/j.jnt.2014.09.016](https://doi.org/10.1016/j.jnt.2014.09.016) |
| Chang–Mishiba, *On a conjecture of Furusho over function fields* | [arXiv:1710.10849](https://arxiv.org/abs/1710.10849), Invent. Math. 223 (2021), 49–102 |
| Lara Rodríguez–Thakur | [arXiv:1312.4928](https://arxiv.org/abs/1312.4928), pp.787–801 (retain the correct pagination) |
| George Todd | [10.1016/j.jnt.2017.09.028](https://doi.org/10.1016/j.jnt.2017.09.028) |
| Thakur 2017 | *Multizeta values for function fields: a survey* |
| Thakur’s basic binary relation | [IMRN 2009, 10.1093/imrn/rnp018](https://doi.org/10.1093/imrn/rnp018), Theorem 5 |
| Carlitz evaluation | [Duke Math. J. 1 (1935), 137–168](https://doi.org/10.1215/S0012-7094-35-00114-4); exact needed formula read in Im et al. v2 p.42 |

## Source issues and reading provenance

E1–E4 retain their earlier independent review. E2 was corrected in print. E5–E7 implement the verified omissions; E8 is an additional unreviewed misprint encountered while checking the requested appendix definitions. No independent review is authored by this fixer.

| ID | Correction |
|---|---|
| E1 | Power-sum exponent d→s; survives in print. |
| E2 | Chen coefficient condition `(q−1) divides k`→`divides j`; fixed in print. |
| E3 | `dim_w`→`dim_k`; survives in print. |
| E4 | Appendix “Theorem A.4”→“Proposition A.4”; survives in print. |
| E5 | Corollary 1.8: use k-span with dim_k, and “spanned”; affects a stated result in both versions. |
| E6 | §1.3 p.5 “Theorem 2.7”→“Proposition 2.7”; also present in v2 §1.3 p.4. |
| E7 | §1.4 product-formula section 2.1→2.3. |
| E8 | Proposition A.4 proof: `BC_s` with weight `w+wt(s)`→`BC_q^m` with weight `w+mq`. The neighboring wrong C-weight in v2 is already corrected in print. |

The 23 September review accepted both original routes and E1–E4. Two assertions in its prose are corrected here: the published §1.3 reference **does still say Theorem**, even though §1.4 separately says Proposition; and a watermarked publisher PDF **can and should be hashed** to identify the exact bytes read. The separate review document is outside this issue’s authorized files, so it is preserved as history, with the correction recorded here and alongside E4.

Structured `sourceVersions` records the following fresh artifacts, separately from the original 22 September reading:

| Artifact | SHA-256 |
|---|---|
| Published 32-page PDF | `d5c1745d107af2718a3bc96a28c689b7481c7d3cfd94f404dde207d5e1c630bf` |
| v2 32-page PDF | `05e1f6d6b1ef37068f73709928a9dcc7a0e50874aced170f0c92e07f0cd7413b` |
| v2 gzip source, `Basis_Submit_v2.tex` | `6336dfc57c140182129afb6c13cddeb5cccc9dd7bf8d27b429a7d7d5e80c52de` |

The source gzip hash matches the original extraction; it is not the PDF hash. The January 2023 published revision adds Remark 5.4 and explicitly states the period-power containment in the proof of Theorem 5.2. Targeted arXiv version, Cambridge article, title/correction and Crossref checks on 30 September found no linked correction; this is a bounded search. Supplemental source reads and hashes are in `additionalSources`.

## Validation

The paper/schema, source-issue provenance and scoped intake checks pass. All 64 missing items have one route; the explicit item graph is acyclic and planned suppliers exist. Symbolic finite checks covered 16 arbitrary-prefix cases at weights 1–5 (twist equation, two determinants and the extended ABP vector), 35 period-normalization cases, and two formula regressions. These checks do not establish analytic convergence or replace the supplier proofs. No Lean file was changed or compiled; no matching existing pinned build was available.
