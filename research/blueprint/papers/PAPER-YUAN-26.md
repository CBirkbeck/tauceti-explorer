# PAPER-YUAN-26 — partial extraction and continuation record

Issue #1050. Original extraction: **Codex**, session `codex-c83e7a`, checkpoint PR #1266. Continuation: **ChatGPT / GPT-6 Astra Pro**, session `astra-ao-9c47e2`, 21 September 2026.

**This remains a partial paper job.** The original worker recorded a complete reading of the 126-page author manuscript, including proofs, appendix and references. This continuation independently reads the targeted sources below; it does not claim a second complete reading of that manuscript or all its prerequisites.

The machine result is **unchanged**: 271 items, comprising 5 library substrate items, 29 planned items and 237 missing items; seven source routes and four provisional Part II routes. Of the missing items, 231 have a single route and six remain deliberately unrouted: `/170` and `/262`–`/266`. This checkpoint updates the report and handoff with source checks, derivations and an item-level continuation ledger. It does not silently promote a machine status, reserve a new ID, activate a design, or certify an unresolved source claim.

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

The original `/170` remains unrouted. The new source read narrows its repair substantially but does not resolve every interpretation of the cited FC V Proposition 4.6.

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

Accordingly `/185`–`/189` remain the separately extracted number-field branches, while `/262`–`/266` remain visible **unverified source claims with no route**. Do not silently add a stronger premise and label it the published theorem. The main theorem `/128` excludes the isotrivial pair used in this example and is unaffected by this particular obstruction.

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
| `/170` | Use the geometric Northcott route in §4 as a precise candidate. Fixed-field twist finiteness, polarization descent and FC's exact statement remain unresolved; leave unrouted. |
| `/184` | Preserve arithmetic bigness over the constant base. Do not replace it by K-relative variation. |
| `/220`–`/224`, `/229`–`/230` | Preserve graph canonical divisors, genus weights, resistance measures and the genus-one exception. The scaling map transports measures, not their total mass. |
| `/225` | Distinguish raw length divided by ramification index from residue-weighted degree divided by full extension degree. Name the defectless and nonsplit descent hypotheses. |
| `/226` | Keep absolute-value rescaling separate from finite extension of the same absolute value. |
| `/227` | The unit/logarithmic graph comparison is now derived explicitly. For `||1||=e_K^(-f)` on the unit graph, use `F=lambda_K*f` on the logarithmic graph before applying the exponential-potential formula. |
| `/228` | Retain controlled potential/Laplacian approximation; sup-norm convergence alone is insufficient. |
| `/262`–`/266` | The constant-family obstruction has been independently checked in the earlier arXiv edition. The final typeset wording is not verified; do not route these source claims. |

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

A separate structural check verified 271 unique IDs, resolved route references, disjoint membership of every routed missing item, and exactly the six intentionally unrouted items `/170`, `/262`, `/263`, `/264`, `/265`, `/266`. The unchanged machine-result Git blob is `720390f75cc3e9f6cf1ce653ee846f50c4b18b65`.

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
