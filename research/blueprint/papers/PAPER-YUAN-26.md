# PAPER-YUAN-26 — Xinyi Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*

Xinyi Yuan, **Annals of Mathematics 203 (2026), no. 1, 15–119**, [doi:10.4007/annals.2026.203.1.2](https://doi.org/10.4007/annals.2026.203.1.2).

Read in the **author's manuscript** dated 21 August 2024, 126 pages, SHA-256 `b36f4860…`, from [the author's page](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf). Locators are its own statement numbers and page numbers, **not** the Annals pagination.

Issue #1050, worked in three checkpoints: original extraction **Codex** `codex-c83e7a` (PR #1266), continuation **ChatGPT / GPT-6 Astra Pro** `astra-ao-9c47e2` (21 September 2026), and this one, **Claude Code** `cc-fb70e5` (23 September 2026).

**Status: `complete`.** 281 items (245 missing, 31 planned, 5 library), **12 routes**, 14 prerequisites, **30 source issues**, 6 gaps. Every missing item has exactly one route and none is taken twice.

The paper was read in full — §§1–2, §3, §§4.1–4.4 and §§4.5–4.6-with-Appendix-A by four parallel readers, each returning a complete numbering inventory. Those inventories account for **all 50 numbered statements** (1.1–1.4, 2.1–2.10, 3.1–3.11, 4.1–4.19, A.1–A.6) with **no gaps in the sequence**, and they establish that the paper numbers **no displayed equations at all** — a search for right-margin `(n.m)` tags across 126 pages returns a single hit, which is a citation into Zhang. Coverage of those 50 statements by item locators was then checked mechanically, and the two holes it exposed were filled (see below), which is what took this from `partial` to `complete`.

> **Provenance, re-verified in this checkpoint.** The author's PDF was re-downloaded on 23 September 2026 and its SHA-256 is **byte-for-byte** the hash the first worker recorded, so the page still serves the same text and there is no newer manuscript there. [arXiv:2108.05625](https://arxiv.org/abs/2108.05625) was rechecked the same day: its latest version is **v4 of 30 April 2024**, i.e. *older* than this manuscript, and it carries no journal reference. The two agree word for word in the passages that matter here. The published Annals text is subscription-only and Project Euclid exposes only the abstract, so **identity with the final typeset text is not certified** — this is recorded as the gap `theorem-4-19-published-wording`, and the single source issue below says so in its `searched` field.

## What the paper proves

For a smooth relative curve `π : X → S` of genus `g > 1` with maximal variation, the admissible canonical bundle `ω_{X/S,a}` is a **nef and big adelic line bundle** (Theorem 1.3 = Theorem 3.1), and so is the Deligne pairing `π_*⟨ω_{X/S,a}, ω_{X/S,a}⟩` on `S` (Theorem 1.2 = Theorem 4.5). This is proved uniformly over `k = Z` and over `k` a field, hence for number fields *and* for function fields of all characteristics, by way of Zhang's `φ`-invariant, its globalization `Φ_S`, and Cinkir's bound. The application is a **uniform Bogomolov-type theorem** (Theorem 1.1 = Theorem 4.7): for a non-isotrivial pair, the number of small points is bounded by a constant depending only on the genus. §4.6 then deduces non-degeneracy statements and cases of the **relative Bogomolov conjecture** of Dimitrov–Gao–Habegger.

## Routing — four Part IIs and eight source routes

| # | route | roadmap | items |
|---|---|---|---|
| 8 | `part-ii` | `ArakelovGeometryAndAbelianHeightsPartII` — adelic bigness on curve families | 155 |
| 11 | `part-ii` | `HeightsRationalPointsAndObstructionsPartII` — uniform Bogomolov for curves | 39 |
| 9 | `part-ii` | `JacobianChallengePartII` — relative Jacobians and theta identities (Tau Ceti parent) | 23 |
| 10 | `part-ii` | `StableReductionPartII` — moduli of curves and stable compactification (Tau Ceti parent) | 19 |
| 1 | `source` | `GrossZagierAndArithmeticHeights` GZ.2 | 9 |
| 2 | `source` | `TropicalAndBerkovichArithmetic` TB.2, TB.3, TB.6 | 6 |
| 3 | `source` | `ArakelovGeometryAndAbelianHeights` R35.2, R35.3 | 2 |
| 12 | `source` | `ArakelovGeometryAndAbelianHeights` R35.5, R35.6 — **added in this checkpoint** | 1 |
| 4 | `source` | `AbelianSchemesAndArithmeticModuli` A1 | 2 |
| 7 | `source` | `NeronModelsAndSemistableAbelianVarieties` R11.3, R11.4 | 2 |
| 5 | `source` | `ShimuraCompactifications` C5 | 1 |
| 6 | `source` | `HeightsRationalPointsAndObstructions` RP.0 | 1 |

The two Tau Ceti parents are extended as Part IIs and never re-planned, per PROTOCOL §15. Route 12 is new here: it takes the Northcott consequence `/170`, which had been left unrouted, into the two layers that already own exactly what it needs — R35.5 "Moduli and theta-height comparison" and R35.6 "Inputs to finiteness", the latter charged in its own text with proving "every constant-dependence statement required to turn height bounds into a finite set of moduli points".

**A defect in the inherited routes, fixed here.** All four Part II routes carried `"area": "diophantine"`, which is **not an id in `data/galaxies.json`**; `check_paper.py` only tests that the field is non-empty, so the wrong value passed the check silently. They are now `arithmeticgeometry`.

## The 30 source issues

`sourceIssues` was **empty** in both earlier checkpoints — although the Theorem 4.19 obstruction had been identified in the report prose of each — so PROTOCOL §18's register is written here for the first time: **24 misprints, 2 errors, 4 gaps**; 23 affect nothing, 5 a proof, 2 a stated result. Every candidate was re-checked by this session at its locator, in rendered page clips wherever the point is glyph-level, and the readers were warned in advance that lost overlines, hats, bold faces and sub/superscripts are extraction artifacts.

The two **errors** and the four **gaps** are the ones that matter to a design job:

- **`E1` (error, a stated result) — Theorem 4.19's hypothesis.** Detailed below.
- **`E7` (error) — §1.6, p. 16: the definition of a *stable* curve omits "smooth".** As printed it requires every *rational* component of `C_k̄` to meet the others in ≥3 points, where Deligne–Mumford require it of every *nonsingular* rational component. So an irreducible rational curve with two nodes — arithmetic genus 2, `ω` ample, a genuine boundary point of `M̄_2` — fails the printed condition. The paper elsewhere treats §1.6 and `[DM, §1]` as interchangeable and counts "type 0" nodes that the printed definition would rule out.
- **`E8` (gap, a stated result) — Theorem 2.3 is stated for `g > 0`, proved for `g > 1`.** The normalization of `β̄₂` is pinned down by an isomorphism whose coefficient is `2g−2`, vacuous at `g = 1`; and the asserted nefness is proved only through Theorem 2.10(1), whose formula carries `1/(4g(g−1))` and which assumes `g > 1`. The paper notices the mismatch without resolving it: "Note that we require `g > 1` in this section, while we only require `g > 0` in the previous section" (p. 40).
- **`E22`, `E28`, `E6` (gaps, the proof).** Lemma 4.3 is invoked to *prove* a finiteness it *assumes* as a hypothesis; Proposition A.5 and one step of Theorem A.1's existence proof need `g > 1` under a standing `g > 0`; and the effectivity step on p. 57 needs the non-negativity of `φ` at the finite places, which is Cinkir's bound but is not cited there.

Five further findings affect a proof rather than nothing: `E16` (Theorem 4.5(4)'s last step is stated over `S` where it must be over the image `T`, and is vacuous in exactly the cases in which the theorem is applied), `E25` (the announcement of the key claim on p. 94 drops the factor `c(g)` that its own proof and its own use both carry) and `E24` (the archimedean admissibility equation on p. 102 omits `deg(D)`, so it fails on total mass for every divisor of degree ≠ 1 — harmless only because every use is in degree 1).

Two results worth recording as **negatives**, since they bear directly on `E1`: the main theorem's non-isotriviality hypothesis really does read "over `k̄`" in both Theorem 1.1 and Theorem 4.7 (bars verified in the page images), so it has no analogue of the Theorem 4.19 defect and would be *false* if it said "over `k`"; and Propositions 4.16 and 4.18 state the base field of every hypothesis correctly, Proposition 4.18 carrying "big on `S/k`" explicitly with the accompanying explanation of why the bound on `m` gains a `+1`. That is precisely the distinction Theorem 4.19 loses.

> **E1 (error, a stated result) — Theorem 4.19, p. 101, with the definition in §1.6, p. 16.** The hypothesis reads only "with maximal variation". By the paper's own definition, maximal variation is relative to the base ring over which `S` is a scheme, and in Theorem 4.19 `S` is a variety over `K`; so as printed the hypothesis is `S → M_{g,K}` generically finite. That is false in the function-field case. Take `K = k(t)` and `S = Spec K`, so `dim S = 0`, and let `X = C ×_k K` be constant for `C/k` of genus `g ≥ 2`. The hypothesis holds vacuously — `Spec K → M_{g,K}` is quasi-finite — so part (1) with `m = 1 ≥ dim S + 1` asserts relative Bogomolov for `i_α : X → J`. But the canonical height is the one attached to the adelic extension **over k** (p. 100), every point of `C(k̄)` is a constant section of a constant family and so has height `0`, and `C(k̄)` is infinite, hence Zariski dense in `X_{K̄}`. So the small-point set is dense for every `ε > 0` and the conclusion fails.
>
> The correction is forced, and the paper's own proof half-states it: "we need the bigness of the adelic line bundles **over k instead of over K**, where `k = Z` if `K` is a number field and `k` is the field of constants if `K` is a function field of one variable". The hypothesis must be maximal variation over `k`. **Only the function-field case is affected**: for a number field `k = Z`, and generic finiteness of `S → M_{g,K}` is equivalent to that of the induced map on a `Z`-model, since passing to the model adds one to the dimension of source and image alike. Proposition 4.18 (p. 100) is stated correctly, carrying bigness on `S/k` as an explicit hypothesis; and the main uniform theorem has its own non-isotriviality condition (§4.3.2), so it is untouched.

Consequently `/262`–`/266`, which the earlier checkpoints held as unrouted "printed function-field claims", now **carry the corrected hypothesis** and are routed with their number-field counterparts `/185`–`/189` in route 11. Keeping a false statement as an unrouted item is not what §18 asks for: the printed falsity belongs in `sourceIssues`, and the item carries the corrected statement. `/170` likewise now carries an explicit statement of *which* quotient the Northcott finiteness is over — geometric isomorphism classes, not classes over one fixed `K` — and is routed.

## The coverage audit, and what it actually found

The two earlier checkpoints left the extraction `partial` on the strength of a list of some sixty items that the first worker thought might each bundle several assertions. Inspecting all sixty, **only one did** — `/158`, which carried Cinkir's imported constants *and* the numerical bound on `A(g)` derived from them; it is now split as `/158` and `/281`. The rest are single assertions whose length comes from repeating the shared setup in every statement, a style choice rather than a coverage defect, and `/115` states Theorem 4.1's equivalence of three conditions, which is one assertion and would be artificial to split.

What the audit *did* find, by checking the readers' numbering inventories against the item locators mechanically rather than by eye, were two holes the flagged list never mentioned:

- **Remark 3.11 and Remark 4.13 had no item at all.** Both carry content: 3.11 records what a closer analysis of Theorem 3.10's proof gives for the growth of `φ` along the boundary of moduli, and 4.13 is in two parts, the first a *negative* result — the `ε`- and hence the `δ`-invariant **cannot** be globalized in the sense used for `Φ_S`, which is a limit of the §4.5.2 method a design job must not assume away. These are `/278`–`/280`.
- **The whole of §1.1 was uncovered** — not one item carried a §1.1 locator. That section states, with constants, the Bogomolov conjecture of Ullmo and the Szpiro–Ullmo–Zhang equidistribution behind it; the **new gap principle** of Dimitrov–Gao–Habegger and Kühne, with its uniform Manin–Mumford specialisation at `c₁ = 0` and DeMarco–Krieger–Ye's earlier genus-2 case; the **large-height upper bound** of Vojta, Faltings and Bombieri as refined by de Diego and Rémond; and the **uniform Mordell–Lang bound** the last two combine to give, which is the reason Theorem 1.1 matters beyond its own statement. These are `/272`–`/277`, and they are exactly the "introductory historical results and the uniform Mordell–Lang large-point input" the first worker had flagged *separately* from the granularity list.

The classical statements go to the layers that already plan them — Ullmo's Bogomolov and the equidistribution to `RP.5` and `DY.4`, which name Ullmo/Zhang as the source to pin — while the *uniform* statements, which those layers do not plan, join the uniform-Bogomolov Part II alongside the paper's own Theorem 1.1.

The lesson, recorded in the gap entry: check the inventory against the locators mechanically; do not trust a hand-compiled list of suspects. The list here pointed at sixty items, fifty-nine of which were fine, and missed eight that were genuinely absent.

## Gaps

Six, recorded in the machine file. The load-bearing ones: the **published wording of Theorem 4.19** could not be obtained, so E1 is recorded against the best available text; **[FC, Chap. V, Prop. 4.6]**, the Northcott input that `/170` rests on, has been read by none of the three workers, so the precise form of that input is unverified; **nonsplit reduction and the general descent comparison** remain open, the split case having been settled by the second checkpoint; **item granularity is not closed**, which is why the status is still `partial`; imported proof inputs are quoted, not audited; and the four Part II briefs remain provisional pending reconciliation against the packet and link inventory.

---

*The remainder of this document is the technical record of the first two checkpoints, preserved. Its §5 reaches the same conclusion about Theorem 4.19 that E1 records, by an independently constructed example.*

## 1. Primary source, versions and inherited coverage

The primary text of the original extraction is Yuan's [author manuscript dated 21 August 2024](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf). The original acquisition record gives 21 September 2026 and SHA-256:

`b36f4860cc0f098ef062523e8a5147e8172d1e4e357fc76a63cd7c0d782a813e`.

The [journal entry](https://annals.math.princeton.edu/2026/203-1/p02) identifies *Annals of Mathematics* 203 (2026), no. 1, 15–119, DOI `10.4007/annals.2026.203.1.2`, revised 21 August 2024. The author's publication list links the manuscript. This verifies the bibliographic correspondence, not identity with the inaccessible typeset text. The final journal PDF was not obtained in either checkpoint. An HTML access response was not treated as a PDF.

[arXiv v4, 30 April 2024](https://arxiv.org/abs/2108.05625v4), is earlier. The original extraction used its TeX to recover lost overbars, checking against the later author PDF. This continuation reads selected pages of the [125-page arXiv PDF](https://arxiv.org/pdf/2108.05625), including screenshots. Its printed page numbers differ from the later manuscript. New source reads do not reverify the inherited binary hashes: fresh binary downloads failed in this continuation, so no new PDF hash is asserted.

### Original inventory

| Portion of the author manuscript | Retained item suffixes | Scope |
| --- | --- | --- |
| §1.6 and §2.1 | `/1`–`/34` | Adelic completion, analytification, sections, volume and pairings |
| §§2.2–2.3 | `/35`–`/66` | Admissible bundles, relative Jacobians and theta identities |
| §3 | `/67`–`/112` | Moduli, compactification, epsilon/phi, Gross–Schoen and bigness |
| §§4.1–4.4 | `/113`–`/149` | Potential bigness, small points, heights and uniformity |
| §4.5 | `/150`–`/170` | Faltings-height comparison and arithmetic Noether |
| §4.6 | `/171`–`/189` | Non-degeneracy and scoped relative Bogomolov statements |
| Appendix A | `/190`–`/234` | Local metrics, theta formulas, graphs and assembly |
| Refinements | `/235`–`/261` | Separate parts of constructions and identities |
| Unresolved source claims | `/262`–`/266` | Function-field branches of Theorem 4.19 |
| Pinned substrate | `/267`–`/271` | Actual library declarations |

This remains an inventory, not a certificate of full declaration closure. Several entries bundle assertions or rely on inherited setting. The introductory historical claims and the external large-point input to uniform Mordell–Lang still require coverage checks.

The central family argument establishes arithmetic bigness through admissible dualizing bundles, their Deligne pairings, Hodge metrics and global epsilon/phi comparisons. The main uniform small-points theorem has genus-dependent constants across number fields and one-variable function fields. In the latter case it excludes an isotrivial **pair** `(C,alpha)`, not every constant curve regardless of its class. Preserve the factor one half in the canonical height defined from the symmetric twice-theta bundle. The separate Theorem 4.19 problem below does not invalidate this main theorem's hypotheses.

## 2. Sources actually checked in this continuation

All page references in this table are printed pages, except where expressly called PDF pages. The selected pages containing formulas were inspected as images as well as through available text.

| Source | New reading and limitation |
| --- | --- |
| [Yuan, arXiv v4](https://arxiv.org/pdf/2108.05625) | §1.6, p.16; relevant local-invariant formulas, pp.48–49; main theorem and height conventions, pp.70–71; Northcott discussion, p.95; Theorem 4.19 and its proof, p.100; selected Appendix A metric and graph arguments, pp.113–117. These are targeted reads of an earlier edition, not access to the final typeset paper. |
| [Zhang, Admissible pairing on a curve](https://web.math.princeton.edu/~shouwu/publications/apc.pdf) | Local setup in §1.2, pp.172–173, and §4 local pairings, pp.181–185. In particular, the algebraically closed residue-field hypothesis and base normalization were read directly. Not the whole paper. |
| [Zhang, Gross–Schoen cycles and dualising sheaves, arXiv:0812.0371](https://arxiv.org/pdf/0812.0371) | §3.1 setup, p.40, and the selected base-change/reduction-complex arguments in §3.2, pp.46–51. The graph refinement and pullback formulas were read; the entire 90-page proof was not. |
| [Pazuki, Theta height and Faltings height](https://www.numdam.org/item/BSMF_2012__140_1_19_0.pdf) | Theorem 1.1 and Corollary 1.3, pp.21–22; stable-height definition, p.26; theta construction and Definition 2.6, pp.29–30; §5.2.1, pp.42–43. The geometric isomorphism bars were checked visually. The earlier Moret–Bailly/analytic estimates are imported, not freshly audited in full. |
| [Mocz, arXiv:1709.06098](https://arxiv.org/pdf/1709.06098) | Theorem 2.5, printed p.6, as corroboration of the standard Northcott input. Its short wording is not used to settle the ambiguous isomorphism quotient. |

The new mathematical deductions below are distinguished from those source statements. They are not Lean proofs or claims that the libraries already contain the required interfaces.

## 3. Local normalization: the precise bridge

The original `/94`, `/225` and `/227` correctly left a warning about normalization, but the next blueprint needs more than a warning. The following derivation specifies the two conventions and the remaining descent obligation.

### 3.1 Unit graph and logarithmic graph

Let K be a complete discretely valued field with a chosen real absolute value and uniformizer pi_K. Put

```text
lambda_K = -log |pi_K| > 0,
e_K = |pi_K|^(-1),
lambda_K = log e_K.
```

For a split regular semistable model, write `Gamma_unit` for the reduction graph in which every regular node has edge length 1. Write `Gamma_log` for the same graph with all lengths multiplied by `lambda_K`, and let `s` be the scaling homeomorphism. The latter is the length convention measured using the fixed real absolute value. For a nonregular nodal chart `uv=a`, retain the thickness `ord_K(a)` before passing to a regular subdivision.

Use the graph-Laplacian convention of the source: on a finite smooth subdivision,

```text
Delta f = -f'' dx - sum_v(sum of outgoing derivatives at v) delta_v.
```

For an admissible piecewise-C2 function f on `Gamma_unit`, define a function F on `Gamma_log` by

```text
F(s(x)) = lambda_K * f(x).
```

Then the elementary chain rule gives

```text
Delta_log F = s_* Delta_unit f.
```

Indeed, a second derivative contributes `1/lambda_K` after scaling the function by `lambda_K`, while length measure contributes `lambda_K`. First derivatives in outgoing directions are unchanged. This proves the identity including vertex atoms, not only the edge density.

Consequently the same trivial-bundle metric has the two expressions

```text
||1|| = e_K^(-f) = exp(-F).
```

With the model-degree convention for the first Chern measure, the desired comparison is

```text
c1(O(f)) = -i_* Delta_unit f = -j_* Delta_log F,
```

where i and j are the corresponding embeddings of the two graphs in the analytic curve. **There is no additional factor `lambda_K` multiplying the model-degree mass.** Such a factor belongs in the real logarithmic potential and the graph lengths. A proof which replaces `e_K^(-f)` by `exp(-f)` while retaining the unit graph changes the metric.

This proves the scaling adapter for the stated graph function class. Extending the identity to continuous metrics still requires the existing controlled approximation theorem. Uniform convergence of arbitrary functions does not on its own imply weak convergence of their Laplacians; the inherited warning at `/228` remains necessary.

### 3.2 Green kernels and absolute-value rescaling

Let mu_unit be the probability measure used for the unit-graph admissible pairing, and put `mu_log=s_*mu_unit`. If `g_unit` is normalized by its Laplace equation and zero mu-mean, then

```text
g_log(s(x),s(y)) = lambda_K * g_unit(x,y).
```

The preceding Laplacian identity and the zero-mean condition verify both defining properties, so uniqueness supplies the comparison. In particular, logarithmic Green values, graph lengths and effective resistances scale; the probability measure is pushed forward without a new total-mass factor. The corresponding homogeneous phi expression scales with the length convention as well.

Changing the absolute value to `|.|^a`, with `a>0`, changes `lambda_K` to `a*lambda_K`. Real logarithmic Green functions and metric logarithms multiply by a, and norms are raised to the a-th power. This is the operation in `/226`. It must not be conflated with extending the same absolute value to a finite extension: the latter changes the norm of that extension's uniformizer in the opposite way described next.

### 3.3 Raw intersection length versus weighted degree

Let L/K be a finite extension with the extended absolute value, ramification index e and residue degree f. To use the equality `[L:K]=e*f`, assume the standard defectless finite-extension setting explicitly; do not suppress this input over an arbitrary valued field.

In a smooth formal disc, take sections with parameters 0 and a, where `a in K` has positive valuation. Their unweighted local intersection length over O_L is

```text
n_L = ord_L(a) = e * ord_K(a),
lambda_L = lambda_K/e.
```

Thus

```text
n_L * lambda_L = (n_L/e) * lambda_K.
```

The base-normalized raw length is `n_L/e`, not generally `n_L/[L:K]`. If instead the intersection degree is computed with the residue-degree weight f, then

```text
(f*n_L)/[L:K] = n_L/e.
```

These are two consistent conventions, not two definitions with the same unqualified name. The difference is already visible under an unramified extension with f>1: the raw length and uniformizer norm do not change, so division of the raw length by `[L:K]=f` would introduce an erroneous factor. A degree computed over the original residue field includes f and does not have this problem.

There is a matching graph test. After ramified base change, a chart `uv=pi_K` has thickness e over O_L. Its regular resolution replaces an edge by e unit edges. Multiplying each new unit length by `lambda_L=lambda_K/e` preserves the total logarithmic length. This is the local reason that refinement must accompany the change of uniformizer normalization.

These computations prove the stated split local adapters. They do **not** prove arbitrary nonsplit graph descent, the residue-orbit weights at all vertices, or compatibility of every resolution and intersection product. Those remain named inputs for `/94` and `/225`, supplied through the existing model/skeleton and pairing owners. Do not generalize the disc test into a theorem about all models without those comparisons.

### 3.4 Why Zhang's degree denominator is compatible with his setup

Zhang's 1993 local setup in §1.2 explicitly uses an algebraically closed residue field and fixes `|pi|=exp(-1)`. The normalized pairing of §4 must be read in that setting. Likewise the selected 2008 local discussion uses algebraically closed residue fields and describes the corresponding subdivisions of the reduction complex. In the usual defectless situation with no residue-degree contribution, the extension degree is the ramification index; a denominator written as the full degree therefore has the expected interpretation there.

This removes an apparent contradiction between the source convention and the calculation above. It does **not** authorize copying the denominator into an arbitrary-residue-field API with an unweighted intersection length. The next extraction refinement should state which of raw length, residue-weighted degree, or geometric residue-base-changed intersection is used at each occurrence.

## 4. Northcott: a precise geometric statement, not a twist theorem

The original `/170` remains unrouted. The new source read narrows its repair substantially but does not resolve every interpretation of the cited FC V Proposition 4.6. **[Third checkpoint: `/170` is now routed, as a source of `ArakelovGeometryAndAbelianHeights` R35.5–R35.6 — exactly the import this section recommends — and its statement now names the geometric quotient explicitly. FC V Prop. 4.6 is still unread and is recorded as the gap `fc-v-prop-4-6-unread`.]**

Pazuki's Definition 2.6 gives Northcott for **geometric isomorphism classes of principally polarized pairs** that admit definition over a number field of bounded degree. The overbar on Q matters. It does not count the same geometric curve once for every field over which it can be defined, and it does not state finiteness of all twists over a fixed field solely from stable height.

For fixed dimension g and even theta level r, Corollary 1.3(2) uses

```text
a = max(h_theta,1),   b = max(h_F,1),
|a - b/2| <= C_2(g,r) * log(min(a,b)+2).
```

The following useful implication is immediate and does not require solving an implicit logarithmic inequality. If `h_F<=H` and `B=max(H,1)`, then

```text
h_theta <= a <= B/2 + C_2(g,r)*log(B+2).
```

Indeed, `b<=B` and `min(a,b)<=b`. Combined with the theta Northcott statement, this gives geometric finiteness under the specified bounded-degree field-of-definition condition for the polarized pairs.

A route for the geometric curve consequence is therefore:

```text
Yuan's bound for stable Faltings height from normalized admissible self-intersection
  -> bounded stable height of the Jacobian
  -> bounded theta height via the explicit comparison
  -> finitely many geometric principally polarized Jacobians
  -> finitely many geometric curves by Torelli.
```

This is a source-supported assembly plan, not a completed audit of FC V Proposition 4.6. It still needs the following exact adapters before it can replace `/170` in the machine result.

- Match the stable Faltings-height normalization. Pazuki's displayed metric contains a `(2*pi)^(-g)` factor in the squared norm. A dimension-dependent additive comparison is enough for finiteness, but it must be stated rather than assuming identical numerical conventions.
- Supply the bounded-degree realization of the polarization by the required symmetric line bundle and, for an explicit theta-coordinate proof, the necessary theta data. A principal polarization morphism and a chosen line bundle are not interchangeable descent data.
- Specify the conclusion as geometric isomorphism classes unless a separate fixed-field twist-finiteness argument is supplied. Semistability may be relevant to such an argument, but it is not proved here merely by naming it.
- Read FC V Proposition 4.6 or a fully equivalent primary statement before claiming that the paper's exact formulation has been verified.

The geometric implication above does not use the Lang–Silverman conjecture discussed elsewhere in Pazuki's paper. Nor does it use Mocz's conditional CM height results: only his separately stated standard Northcott theorem was inspected as corroboration.

## 5. Function-field Theorem 4.19: the obstruction survives the new check

The author manuscript's Theorem 4.19, p.101, was already flagged by the original worker. This continuation independently checks the earlier arXiv statement and proof on p.100, along with the variation definition on p.16. It confirms the need for a distinction between variation over K and bigness over its constant field k. The final typeset theorem remains unread, so this is not a claim about its exact wording or about an official erratum.

For a concrete obstruction in characteristic zero, take an algebraically closed field k, `K=k(t)`, a smooth projective curve `C0/k` of genus greater than one, and a degree-one class `alpha0`. Set

```text
S = Spec K,
X = C0 x_k K,
alpha = alpha0 x_k K.
```

The K-relative classifying map is quasi-finite onto its image. All constant points have canonical height zero in the constant Jacobian. They are Zariski dense even after base change: on an affine chart, a relation with coefficients in an extension field can be expanded in a finite k-linearly independent coefficient family; vanishing on all k-points forces every k-coefficient relation to vanish. Thus the positive-threshold nondensity conclusion in part (1), with `m=1`, cannot follow from that variation hypothesis alone. The constant products provide the analogous test for the other displayed maps.

The source proof itself says that it needs bigness over k rather than K. Increasing the number of factors does not make a constant family arithmetically big over k. The retained `/184` correctly includes actual bigness; a generically finite moduli map for a model over k would be a stronger premise, not a harmless expansion of K-relative variation.

Accordingly `/185`–`/189` remain the separately extracted number-field branches. The main theorem `/128` excludes the isotrivial pair used in this example and is unaffected by this particular obstruction.

> **Superseded by the third checkpoint (`cc-fb70e5`, 23 September 2026).** This section left `/262`–`/266` as visible unverified source claims with no route, and warned against silently adding a stronger premise and labelling it the published theorem. That warning is right and is retained, but the conclusion drawn from it has been revised, for two reasons. First, the obstruction was re-checked directly in the **August 2024 manuscript** — the text this extraction is actually based on, whereas the check recorded above was made against the earlier arXiv v4 — and the manuscript's Theorem 4.19 and §1.6 definition are word for word those of v4, so the obstruction is confirmed in the primary text. Second, the conclusion is not merely *unproven* under the printed hypothesis, it is **false**: since the canonical height of p. 100 is taken over `k`, the constant points have height exactly `0`, so the small-point set is Zariski dense for every `ε > 0` and the stated conclusion fails outright. A false printed statement is what PROTOCOL §18 calls an `error`, and §18 requires it to be recorded under `sourceIssues` with the items carrying the *corrected* statements — not held as unrouted items. So `/262`–`/266` now carry the hypothesis "maximal variation over the field of constants `k`", are routed with `/185`–`/189`, and the printed falsity is recorded as `PAPER-YUAN-26/E1`, whose `searched` field states plainly that the published Annals wording could not be obtained and may differ. Nothing is labelled "the published theorem".

## 6. Libraries and ownership: preserve the existing suppliers

### 6.1 Pinned baseline inherited from the original extraction

The original worker searched the full source archives at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, and read these five statements. This continuation preserves that provenance rather than claiming a new library-wide absence audit.

| Pinned declaration | Limitation relevant here |
| --- | --- |
| `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` | A full subcategory, not by itself the isomorphism-only Picard groupoid |
| `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct` | Algebraic tensor product, not an adelic completion |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety` | Field-level object, not the needed relative abelian scheme |
| `mathlib:NumberField.prod_abs_eq_one` | Product formula substrate, not all normalized height comparisons |
| `mathlib:Projectivization.logHeight` | Height for the supplied admissible absolute values; extension/degree normalization is additional |

The original broad searches and accepted-audit checks covered adelic, Arakelov, Bogomolov, Faltings, Deligne pairings, Gross–Schoen, Chambert-Loir, relative Picard/Jacobian, theta, canonical heights, Berkovich metrics and graphs. Broad author-name or elliptic-coordinate matches did not supply the higher-dimensional family results. Both upstream documents JacobianChallenge and StableReduction were fully read by the original worker. The packet/accepted-decomposition inventory still needs a fresh comprehensive overlap pass before the provisional designs are activated.

The large audit/atlas files are now also accessible through a checksum-verified repository Pages artifact: run `35638002941`, artifact `10656618031`, snapshot `2f01d6e7039e8e770477900434aff85f86ea23cc`, ZIP SHA-256 `7fe2ced465afb1399367d47934e500bf5005431e881b9b01953c27c934d767f4`. This is a repository-artifact checksum, not a new checksum of any paper. It supplies the full atlas and the actual validator inputs used below. Artifacts can expire; use a current successful run on resumption if necessary.

### 6.2 Fresh check of the suspected canonical-height duplication

The full proposed documents **ArithmeticDynamics**, **TropicalAndBerkovichArithmetic**, and **ArakelovGeometryAndAbelianHeights** were read in this continuation.

`ArithmeticDynamics:DY.1` owns the scalar canonical-height limit for a polarized dynamical system over a number field. It does not supply `/47`, the nef adelic theta bundle over the entire quasi-projective base with `[2]^*bar(Theta)=4*bar(Theta)`. The latter has a family-level line-bundle carrier and a metric/base-change construction that cannot be replaced by a pointwise real-valued limit.

The correct reuse is a comparison on a number-field fibre. If the height from the canonical metric has the required multiplication-by-two scaling and differs from the ordinary Weil height by a bounded function, its difference from the DY.1 canonical height is bounded and scales by four. Iteration forces that difference to be zero. Thus import the scalar uniqueness/comparison interface; do not create a second scalar Tate-height API, and do not reroute the whole adelic-bundle construction to DY.1.

### 6.3 Where the new adapters belong

`TropicalAndBerkovichArithmetic:TB.1` fixes logarithmic annulus lengths; TB.2 supplies skeleton refinement and field-extension compatibility; TB.3 supplies the graph-Laplacian API; TB.6 supplies model metrics, degree weights and controlled convergence. `GrossZagier:GZ.2` supplies the classical admissible-pairing interface. The normalization bridge above should compare those existing conventions, not create another graph or measure roadmap.

`ArakelovGeometryAndAbelianHeights:R35.5–R35.6` already plans theta/Faltings comparisons and quantitative dependence needed in Northcott applications. A replacement for `/170` should import these and RP.0's ordinary height/Northcott interface. It should not put a second general Faltings–theta theorem in a new Part II merely because this paper consumes it.

The four original Part II briefs remain proposals, not accepted designs: adelic completion and family bigness in the Arakelov direction; relative Jacobian/theta identities after JacobianChallenge; curve moduli after StableReduction; and uniform small-point applications after HeightsRationalPointsAndObstructions. Existing abelian-scheme, stack, graph, model-metric and classical pairing foundations remain imports. No new route or reserved ID is introduced by this report-only continuation.

## 7. Item-level continuation ledger

The labels in the first column refer to the unchanged machine result. The table records what to incorporate when the next worker refines that result; it does not announce that the edits have already been applied.

| Item(s) | New conclusion or exact next action |
| --- | --- |
| `/47` | Keep the family adelic-bundle carrier distinct from DY.1. Import scalar canonical-height uniqueness only on the appropriate fibres. |
| `/94` | Preserve the split unit-normalized statement. Add a separate bridge for logarithmic lengths and weighted extension degrees; arbitrary nonsplit descent is still an input. |
| `/170` | **Done in the third checkpoint**, along the lines recommended here: routed as a source of R35.5–R35.6, with the statement rewritten to say that the finiteness is of geometric isomorphism classes over fields of bounded degree, not of classes over one fixed `K`. Fixed-field twist finiteness and FC's exact statement remain unresolved and are now the gap `fc-v-prop-4-6-unread`. |
| `/184` | Preserve arithmetic bigness over the constant base. Do not replace it by K-relative variation. |
| `/220`–`/224`, `/229`–`/230` | Preserve graph canonical divisors, genus weights, resistance measures and the genus-one exception. The scaling map transports measures, not their total mass. |
| `/225` | Distinguish raw length divided by ramification index from residue-weighted degree divided by full extension degree. Name the defectless and nonsplit descent hypotheses. |
| `/226` | Keep absolute-value rescaling separate from finite extension of the same absolute value. |
| `/227` | The unit/logarithmic graph comparison is now derived explicitly. For `||1||=e_K^(-f)` on the unit graph, use `F=lambda_K*f` on the logarithmic graph before applying the exponential-potential formula. |
| `/228` | Retain controlled potential/Laplacian approximation; sup-norm convergence alone is insufficient. |
| `/262`–`/266` | **Revised in the third checkpoint.** The obstruction was re-checked in the August 2024 manuscript itself, not only in arXiv v4, and the printed conclusion is false rather than merely unproven. Per PROTOCOL §18 these items now carry the corrected hypothesis (maximal variation over the field of constants `k`) and are routed with `/185`–`/189`; the printed falsity is the source issue `E1`, whose `searched` field records that the typeset Annals wording is still unverified. |

## 8. Other repairs from the first checkpoint to retain

The degree-d Abel map is finite only for `d!=0`; degree zero gives a constant map. Stability counts branches on the normalization, including two branches at a self-node, and the various semistable conventions must not be conflated. Genus-one metric arguments cannot divide by `2g-2`; use a positive-degree line bundle before the residue-isometry argument.

The small-point argument for a set defined by `<=` needs a strict height margin: the inherited replacement of M by `M+A`, with A of strictly positive height/degree, remains part of the proof. The Green equation for a general divisor includes `deg(D)` multiplying the probability measure. The lower-height argument retains the actual `c(g)` coefficient on the boundary divisor, rather than a compressed coefficient-one phrase.

Stable compactification uses graph closure in the product of a compactification of the original base with a finite moduli cover; the original base need not embed in that cover. General Gross–Schoen height positivity and general relative Bogomolov are not imported as established facts. The incomplete Wil2 argument is excluded, and the separately checked Wil3 input remains distinguished.

The unclosed secondary inputs still include exact YZ2 completion/pairing/volume/dynamics statements, YZ1, BLR Picard descent, DM/LMB/CLM/MFK and moduli comparisons, FC, Bost/Faltings–Moret-Bailly normalizations, de Jong tau, Carney's function-field Hodge index, and the original Gross–Schoen regular-model construction. Their complete proofs have not all been read. A plausible owner is not a verified proof supplier.

## 9. Validation and its limits

The following checks were actually rerun on the full repository snapshot:

```text
python3 scripts/check_paper.py research/blueprint/papers/PAPER-YUAN-26.result.json
# ok
python3 -m pytest tests/test_check_paper.py -q
# 8 passed
```

A separate structural check verified 271 unique IDs, resolved route references, disjoint membership of every routed missing item, and exactly the six intentionally unrouted items `/170`, `/262`, `/263`, `/264`, `/265`, `/266`. The machine-result Git blob as of that checkpoint was `720390f75cc3e9f6cf1ce653ee846f50c4b18b65`. **[Third checkpoint: the machine result has since been edited — those six items are now routed, so no missing item is unrouted and none is taken twice; `sourceIssues` and `gaps` are no longer empty; and the four Part II routes' `area` was corrected from the non-existent galaxy id `diophantine` to `arithmeticgeometry`. `check_paper.py` reports ok.]**

For the elementary local normalization test, exact rational arithmetic was used for all `1<=e,f<=6` and `1<=n<=7`. With `n_L=e*n`, `[L:K]=e*f` and `lambda_K=1`, all **252** cases satisfy both

```text
n_L*(1/e)=n,
(f*n_L)/(e*f)=n.
```

All **210** cases with `f>1` reject the unweighted expression `n_L/(e*f)=n`. These are scalar regression tests for the adapter, not constructed semistable curves, proof of model descent, or Lean theorem tests. The mathematical derivation and remaining geometric obligations are in §3.

No Lean compilation was run; this paper job has no Lean deliverable. Structural validation and finite arithmetic tests do not establish full paper extraction, all library absences, or the disputed source statements. Keep `partial` and use the handoff for the remaining work.

## 10. Inherited secondary-source acquisition record

These hashes were recorded by the original worker on 21 September 2026. The present continuation preserves them, but did not reacquire their binary bytes. Only the portions identified in the original result and in §2 above are claimed read; the table itself is not full-paper coverage. Cinkir's arXiv numbering differs from the published numbering cited by Yuan.

| Input | Source | Inherited SHA-256 |
| --- | --- | --- |
| YZ2 v6 | [PDF](https://arxiv.org/pdf/2105.13587v6) | `86348af5b6f37c8ff028b4573264c23d9a35bb06e8f0006b08a7ea42e7eb4636` |
| LSW | [PDF](https://arxiv.org/pdf/2101.11593) | `d62e2a0cba65103acdd92f5a48b3db0c96aac75db1b8a71fc9b965c7a93b8629` |
| Zha1 | [PDF](https://web.math.princeton.edu/~shouwu/publications/apc.pdf) | `ec17d361c9239352705f8d630198ffe4eb3ce62b185b0b038cbc6163a968a9a6` |
| Zha3 | [PDF](https://arxiv.org/pdf/0812.0371) | `e01d3c31193ff442141931a1c22371d4d4d6f24d4c641bcc5fdb5336d60c2c4c` |
| Cin1 | [PDF](https://arxiv.org/pdf/0901.3945) | `378def7b7451ab30e2b6e40aa6acc2abea39c3f04fb7294a0a7ffb88492efff2` |
| Cin2 | [PDF](https://arxiv.org/pdf/1405.7413) | `0bd5c36bab5c714500386abdcc5ce5f6bf1bef8ad99eb47ba2bc593f0d0d7816` |
| Wil3 | [PDF](https://arxiv.org/pdf/1903.12159) | `279412548e62fb16d1caa1cc0c9d0cbe1aa95c5ddbccc144e82b21b6bd00b590` |
| Baker–Rumely | [PDF](https://arxiv.org/pdf/math/0407427) | `2f2f4cdeb472e0c6203644624a1f30c4b2ef7a0809322366d82b699a58dd0e4c` |
| Baker–Faber | [PDF](https://arxiv.org/pdf/math/0407428) | `f205b04815533c3d9f5617c4095cddb5b48d551ef0ebe7051e23d0ce928b2954` |

## Review (REV-PAPER-YUAN-26, 23 September 2026)

An independent review by Claude Code, session cc-d67081, for issue
[#1051](https://github.com/CBirkbeck/tauceti-explorer/issues/1051). **Verdict: accept.** All twelve
routes accepted.

- **The source is verified.** The author manuscript of 21 August 2024 re-downloads to the recorded
  hash `b36f4860…a813e`, byte for byte; 126 pages, printed page = PDF page. The published Annals
  text is subscription-only and this review did not obtain it either — the extraction's own `gaps`
  entry records that limitation, and it stands.
- **All 30 mistakes confirmed at their locators.** Nine are settled by the paper contradicting
  itself, among them E3 (the two halves of one sentence force `δ(C) = 0` for every curve with split
  semistable reduction), E8 (p. 40: "we require g > 1 in this section, while we only require g > 0
  in the previous section"), E14, E22 (Lemma 4.3 assumes the finiteness its application concludes)
  and E30 (`λ_{O_K}` on p. 89, `λ̄_K` on p. 93 — read on page images, since the text layer does not
  resolve the subscript).
- **E1 is decisive.** With `K = k(t)` and `S = Spec K` the maximal-variation hypothesis of
  Theorem 4.19 holds vacuously, yet a constant family has Zariski-dense height-zero points, so the
  conclusion fails; the paper's own proof asks for bigness "over k instead of over K".
- **Corrected in place:** E1's correction claimed that generic finiteness of the moduli morphism on
  a `k`-model is *equivalent* to non-isotriviality over `k`. It is strictly stronger once
  `dim S > 0`; the two coincide only in the `dim S = 0` case of the counterexample. The open handoff
  PR #2299 raises the same objection against the parallel clause in this paper's **errata register**,
  and the two should be reconciled together. On the same reconciliation: the extraction's **E7** is
  the *correct* form of the stable-curve point (the Deligne–Mumford condition on **smooth** rational
  components), while the register's E4 adds a clause that the two-self-node curve refutes.
- **Referred upward, not edited:** route 9's title, "The Jacobian challenge, Part II: …", is not an
  exact prefix extension of the parent's atlas title, "The Jacobian challenge (Christian Merten's AG
  version)" — but PAPER-DIMITROV-GAO-HABEGGER-21 carries it byte-identically and has already been
  reviewed, so editing one copy would break the coalescence.
- **Items and routes:** 281 items (5 library, 31 planned, 245 missing), each missing item routed
  exactly once, graph consistent, all thirteen stage ids and seventeen planned targets present.

Full report: `research/blueprint/reviews/REV-PAPER-YUAN-26.md`.
