# PAPER-ANDRE-18 — ramification beyond unramified almost purity

**Partial checkpoint, 21 September 2026.** Author: GPT-6 Astra Pro; session
`g6ap-0921-andre-7c4e`; issue #1464. This is not a complete extraction, an
accepted routing decision, a Lean implementation, or an independent review.
The companion JSON contains 72 items: 35 mapped to existing stage contracts
and 37 assigned provisionally to a Part II. No item is labelled `library`.

## Source and reading boundary

The source read is Yves André, *Le lemme d’Abhyankar perfectoïde*,
Publications Mathématiques de l’IHÉS **127** (2018), 1–70,
[DOI 10.1007/s10240-017-0096-x](https://doi.org/10.1007/s10240-017-0096-x).
The [published NUMDAM PDF](https://www.numdam.org/item/10.1007/s10240-017-0096-x.pdf)
was accessible as parsed text. All locators below are **published page and
statement numbers**; they are not silently borrowed from the
[2016 preprint](https://arxiv.org/abs/1609.00320).

The introduction and §1 were read, along with the passages named individually
in `source.readSections`: the almost-perfectoid definition and criterion,
finite invariants, the Riemann-extension result, the inverse-limit argument,
and §§5.1–5.3. Section 5.4 was read but is not yet extracted. Most of §§2–3
and several examples still need extraction. Some §1 packages must also be
split further before final acceptance. The 72 items are therefore **not** a
claim to enumerate every result of the paper.

Direct PDF-byte retrieval failed because the execution environment could not
resolve the host, and PDF screenshot requests returned an internal error.
Accordingly `source.sha256` is null. No successful visual verification or PDF
hash is claimed. A continuation must obtain the bytes and check formula-heavy
passages visually before completing the provenance record.

## The proposed division of ownership

The full current documents for
[PerfectoidSpaces](../../../content/campaign/PerfectoidSpaces/README.md) and
[PerfectoidQuotients](../../../content/campaign/PerfectoidQuotients/README.md)
were read. Their relevant contracts are distinct.

**PerfectoidSpaces P0, P3 and P8 already own the foundational direction.**
Section 1 of André supplies the abstract almost-base setup, adjoints,
finite-projective modules, almost finite étale algebras, descent and the
Galois arguments. P0 explicitly permits a general idempotent ideal with the
required flatness/tensor hypotheses. This is important: the opening of the
older integrated PerfectoidSpaces decomposition specializes to a perfectoid
field and its valuation ideal, while its own boundary note says the general
base still needs reading. André is an additional source for the existing
**general P0 contract**, not a reason to create a second almost-mathematics
roadmap. The Galois-envelope and rigidity lemmas are auxiliary sources for
P3. Proposition 3.8.1 supplies the finite-invariant result within P8; division
by the group order is not its proof.

**The proposed Part II owns the ramified extension direction.** The name in
the JSON is `PerfectoidRamification`, titled *Perfectoid rings and spaces,
Part II: ramification and Riemann extension*. It imports P0 almost algebra,
P1 tilting/coreflection infrastructure, P2 rational localization and P3
unramified almost purity. It must also import any existing general
Banach-limit or completed-tensor supplier from the adic roadmaps. The
checkpoint's general uniform-limit item is specifically marked for that
ownership reconciliation; it is not permission to duplicate a general
construction. A keyword search found no `PerfectoidRamification` result, but
that does not replace checking the full proposed-roadmap and reserved-ID
catalogues.

**PerfectoidQuotients is not an alternative owner of this theorem.** Its
Q2–Q4 route constructs universal integral perfectoidization, André's
absolutely-integrally-closed faithfully flat extension via prisms, and
surjectivity for closed perfectoid quotients. Those are different statements
and different universal properties. In this paper, the perfectoid
coreflection is a **right adjoint**, with map `D^♮ → D`. It must not be
replaced by the prismatic universal perfectoidization, whose universal
property points in the other direction.

These are provisional routing proposals. The library and catalogue audits
listed below are still acceptance requirements; this checkpoint should not
be promoted as a final design brief.

## Proof route and its precise boundaries

Fix a perfectoid field `K`, residue characteristic `p`, and a nonzero
`ϖ ∈ K°°` with compatible p-power roots and `|p| ≤ |ϖ|`. The ramified almost
base of §5.1 is

```text
V = K°[T^(1/p^∞)],      m = (ϖT)^(1/p^∞)V.
```

For a perfected-coordinate algebra, write `g = T·1` and
`A[j] = A{ϖ^j/g}`. Where root saturation is viewed inside `A[1/g]`, retain
the stated non-zero-divisor hypothesis. Its meaning is

```text
g^(-1/p^∞)A° = ⋂_n g^(-1/p^n)A°,
```

not a union of fractional lattices.

The first essential passage is Proposition 4.2.1: the integral
root-localization models recover their input almost after inverse limit.
Theorem 4.2.2 then gives

```text
lim_j A[j]° = g^(-1/p^∞)A°.
```

It also identifies the right side as the **complete integral closure** of
`A°` in `A[1/g]`. This means closure under almost-integral elements, not
ordinary integral closure followed by completion and not merely topological
closure. Corollary 4.2.4 applies the right perfectoid coreflection to obtain
the largest spectral perfectoid subalgebra in the principal localization.
Dropping that coreflection would assert more than the paper proves.

The second passage is the inverse-limit obstruction. For Proposition 4.3.1,
with `A′` the perfectoid limit and `A` the uniform limit, the exact logical
shape is

```text
(1) ⇔ (2) ⇐ (3) ⇔ (4) ⇔ (5).
```

Conditions (1) and (2) say that `A` is perfectoid and that `A′ → A` is an
isomorphism. The remaining conditions control integral reduction and
Frobenius. The arrow from (3) to (2) must not be reversed. The ramified
version in Remark 4.3.1 gives **almost** perfectoidness and an almost
comparison of integral reductions.

Proposition 4.4.1 supplies the missing `lim¹` vanishing. Its proof uses the
nested root-localization hypotheses and summable annihilator estimates; it
does not assume that the transition maps themselves are surjective. Theorem
4.4.2 consequently constructs a fully faithful localization functor with
uniform-limit right adjoint and an isomorphic unit. It does **not** prove
that every compatible annular system lies in its essential image.

For the special tower arising from a finite étale `A[1/g]`-algebra `B′`,
Proposition 4.4.4 proves the required additional effectivity:

```text
B_j = B′ ⊗_{A[1/g]} A[j],
C = ulim_j B_j,
C{ϖ^j/g} ≅ B_j,                 C[1/g] ≅ B′.
```

The injectivity argument uses the trace pairing, and the surjectivity
argument reduces to a finite Galois envelope. Ordinary module dimension
arguments do not replace those steps.

Theorem 5.2.1 has two equivalences, extracted separately. The integral
category requires completeness, finite étaleness **modulo every `p^m`**,
and finite étaleness after inverting `g`. Inverting `ϖ` gives the category
of almost-perfectoid algebras finite étale after inverting `g`; inverting
`g` then gives finite étale algebras over `A[1/g]`. Proposition 5.2.3 also
has two distinct conclusions: almost finite étaleness modulo `p^m` uses
the ramified ideal, whereas almost finite étaleness of `B°[1/g]` over
`A°[1/g]` uses the valuation ideal `(K°,K°°)`.

Finally, §5.3 constructs the ordinary integral closure `D°` of
`g^(-1/p^∞)A°` in `B′`, and the corresponding algebra `D` after inverting
`ϖ`. Proposition 5.3.1 identifies `D` with the almost-perfectoid uniform
limit, proves integral completeness and root saturation, and compares it
almost with the ordinary integral closure of `A°`. The maximal
**perfectoid** algebra is `D^♮`. Trace almost-surjectivity requires that
`B′` be faithful over `A[1/g]`.

## Assertions deliberately not promoted

Question 3.5.1 does not authorize calling every root-saturated envelope
perfectoid. Question 4.4.3 does not supply arbitrary essential surjectivity
of the annular localization functor. Question 5.2.2 and Remark 5.2.1 do not
supply integral almost finite étaleness merely from all the modulo-`p^m`
statements. Remark 5.2.1 explains the missing almost-finiteness and why the
restricted-ideal lifting theorem of §1.8.2 cannot simply be reused: the
relevant ideal is not tight in the ramified almost setting.

Useful checks for the eventual design are `g=1` (recover unramified P3), a
finite p-group action (no division by its order), and a nonfaithful finite
étale projection `A₁×A₂ → A₁`. The last example prevents both an unjustified
injective structure map and an unjustified trace-surjectivity conclusion.
These are proposed mathematical acceptance tests, **not executed Lean tests**.

## Library audit, prerequisites and continuation

The prescribed pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Keyword searches for perfectoid
and almost terminology were performed. The pinned Mathlib
`Mathlib/RingTheory/Perfectoid/FontaineTheta.lean`, lines 1–115, was opened;
its broader definitions and later theorems were not all read. This does not
establish a complete tilting, almost-purity or perfectoid-ring interface.

`data/library-coverage.json` returned empty content through the file reader.
The reviewed audit therefore remains unread. Current-branch search results
are only leads, not evidence of availability at the pins. In particular,
`planned` records a read mathematical stage contract, **not** a verified
claim that the entire result is absent from both libraries. The provisional
`missing` entries require a final baseline and cross-roadmap audit.

The empty `prerequisites` list is unresolved, not a finding that all inputs
are covered. The JSON keeps separate candidates: Gabber–Ramero's almost
ring theory, Scholze's torsion paper Proposition II.3.1, and Roos's derived
inverse-limit results. The existing PerfectoidSpaces decomposition already
covers parts of Gabber–Ramero and Scholze, so neither whole source should
be called missing. Roos's journal metadata and corrected
[DOI 10.1112/S0024610705022416](https://doi.org/10.1112/S0024610705022416)
were checked; its theorem-level reading and supplier check remain. Section
2 and the applications may expose further inputs.

## Validation actually performed

The repository's `scripts/check_paper.py` was copied without alteration;
its locally computed Git blob hash is
`cf3cae9e7d2d41209bf9fa4d719fd6fe17a69f1f`, matching the fetched file.
The command

```sh
python3 scripts/check_paper.py research/blueprint/papers/PAPER-ANDRE-18.result.json
```

reported `ok`, using a **scoped local catalogue** of the verified
PerfectoidSpaces P0–P9 IDs. This checks the schema, cited owner IDs and route
multiplicity. It does not substitute for the full repository catalogue,
the reviewed library audit, source completeness, or mathematical review.
Every currently extracted provisional missing item has exactly one route.
No Lean file was required or compiled. The remaining tasks and resume
locators are in the companion handoff.

---

## Second checkpoint: spectral-radius imports and the topology hypothesis

**22 September 2026. ChatGPT Pro, session `cgp-0922-b7d49a`; continuation of
#1639 for issue #1464. Status remains partial.** This section supersedes the
historical item counts and library-reading boundary above, not the earlier
ramification analysis. The JSON now has **85 items: 8 library, 35 planned,
42 missing**. All 72 inherited item objects and both inherited routes are
unchanged. The four new valid comparison lemmas and one diagnostic are
explicitly unrouted while the generic-supplier audit is unfinished.

### A. What is already implemented

At Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`, the file
`Mathlib/Analysis/Normed/Unbundled/SmoothingSeminorm.lean`, blob
`dac8aa822d6a8c72df11777ae9c25ebd02c0cbfa`, supplies the following exact
root-namespace declarations. Their signatures and surrounding hypotheses
were read; this is not a fresh review of every private proof in that file.

| Input or conclusion | Existing declaration | Important hypothesis |
|---|---|---|
| Positive-index infimum defining the radius | `smoothingFun` | `CommRing R`, `RingSeminorm R` |
| Limit of the nth-root sequence | `tendsto_smoothingFun_of_map_one_le_one` | `μ 1 ≤ 1` |
| Radius bounded by the original seminorm | `smoothingFun_le_self` | No additional normalization hypothesis |
| Bundled smoothed ring seminorm | `smoothingSeminorm` | `μ 1 ≤ 1`, `IsNonarchimedean μ` |
| Ultrametric inequality | `isNonarchimedean_smoothingFun` | The same two hypotheses |
| Power multiplicativity | `isPowMul_smoothingFun` | The actual signature requires `μ 1 ≤ 1`, not an additional ultrametric hypothesis |
| Fixed value for an already power-multiplicative element | `smoothingFun_of_powMul` | The power identity for every positive exponent |
| Preservation of multiplication by a multiplicative element | `smoothingFun_of_map_mul_eq_mul` | `μ(x*y)=μ(x)*μ(y)` for every `y` |

The companion normalization result for the last row is
`smoothingFun_apply_of_map_mul_eq_mul`. The generic declarations supply the
scalar-multiplication calculation after one has packaged the given
K-algebra norm as a ring seminorm; they do not themselves provide every
Banach-algebra category, scalar wrapper or completion interface.

For a ring seminorm `μ`, write

```text
ρ_μ(x) = inf_{n >= 1} μ(x^n)^(1/n).
```

Do not put exponent zero into this infimum. The library's separate
natural-number sequence may have a harmless initial term at zero because
it is only used for a limit at infinity. Do not replace a seminorm by a
norm without proving its kernel is zero: for a nonzero element `e` with
`e^2=0`, its spectral radius is zero.

The opening of the pinned `SpectralNorm.lean` was also read. That file
constructs a norm from the minimal polynomial in an **algebraic extension
of fields**. Its algebraic-extension uniqueness is not a theorem about two
arbitrary norms on an infinite-dimensional Banach algebra. The two APIs
must not be identified solely because both use the word “spectral”.

### B. Four comparison lemmas with complete elementary proofs

These are the four new valid `missing` items. “Missing” here records an
unmatched packaged declaration and unresolved final generic ownership; it
does not say that any of the general ingredients should be redeveloped.

**B1. Bounded maps contract spectral radii.** Let `f:R→S` be a ring
homomorphism, let `μ,ν` be ring seminorms on commutative rings with their
values at 1 at most 1, and suppose `ν(f(x))≤C μ(x)` for all `x`, with
`C>0`. For each positive integer `n`,

```text
ν(f(x)^n)^(1/n) <= C^(1/n) μ(x^n)^(1/n).
```

This uses `f(x^n)=f(x)^n`; all quantities under real roots are
nonnegative. The imported convergence theorem and `C^(1/n)→1` give
`ρ_ν(f(x))≤ρ_μ(x)`. The argument also works when either radius is zero.
It uses neither completeness nor injectivity of `f`.

**B2. Equivalent seminorms give equal radii.** If `ν≤Cμ` and `μ≤Dν`,
with `C,D>0`, apply B1 to the identity in both directions and use
antisymmetry. This proves equality even when the original seminorms are
not separated. If both are power-multiplicative, the imported fixed-point
lemma identifies each radius with its original seminorm.

**B3. A specified topology gives uniqueness of a spectral norm.** Let `K`
be a complete nontrivially valued nonarchimedean field. Suppose two
K-algebra norms `μ,ν` on `A` give the same topology. The continuity-to-bound
step is worth making explicit. Choose `π∈K` with `q=|π|∈(0,1)`. Continuity
of the identity from `μ` to `ν` provides `δ>0` such that

```text
μ(z)<δ  implies  ν(z)<1.
```

For `x≠0`, choose an integer `k` with
`q^k μ(x)<δ≤q^(k-1) μ(x)`. Scalar homogeneity gives

```text
ν(x) < q^(-k) <= μ(x)/(q δ).
```

The zero case is immediate. Reversing the topologies gives the other
bound. Apply B2 and the fixed-point lemma for power-multiplicative norms.
Thus compatible spectral norms are equal. **Completeness of A was never
needed.** Completeness of K is retained to match the paper's standing
setting, although this particular rescaling argument needs only a
nontrivially valued field.

**B4. One continuous identity suffices if both norms are complete.**
Suppose instead that both norms make A complete and the identity is
continuous in one direction. This is a continuous bijective K-linear map
between complete Hausdorff normed vector spaces. The open-mapping theorem
makes its inverse continuous. B3 then gives equality. Completeness is
used on these two actual normed spaces, not on an unverified maximum-norm
space introduced during the argument.

### C. Source issue E1: the stronger abstract-algebra claim

The JSON quotes the short disputed sentence and supplies the required
structured `sourceIssues` record. The source is the second paragraph of
§2.2.4 on published p.13. The same claim and maximum-norm step are present
in [arXiv v1](https://arxiv.org/pdf/1609.00320v1), §2.2.4, p.12. The valid
fixed-topology conclusion immediately before it must be kept separate.

Here is a counterexample to uniqueness without a fixed topology.

Let `C=C_p` and let `F=Q_p-bar` be its usual dense subfield. We use that
`F` is not complete, that `C` is complete, and that `C` is algebraically
closed. A primary reference is Brian Conrad's
[*Math 248A. Completion of algebraic closure*](https://virtualmath1.stanford.edu/~conrad/248APage/handouts/algclosurecomp.pdf),
§1 and Theorem 1.1. Its three pages were read and its first page visually
checked. The algebraic-closedness theorem is proved there. Noncompleteness
of `F` is recalled with a reference to BGR 3.4.3/1; this session did **not**
read the original proof of that input.

Choose `t∈C\F`. Since `F` is algebraically closed, `t` is transcendental
over `F`. Extend `{t}` to a transcendence basis `S` of `C/F`. The map on
`F(S)` fixing `F` and `S\{t}` and sending `t` to `pt` is an automorphism,
with inverse sending `t` to `p^(-1)t`. As `C` is an algebraic closure of
`F(S)`, extension of embeddings to algebraic closures gives an
automorphism `σ` of `C` extending this map. Surjectivity follows because
its image is algebraically closed, contains `F(S)`, and `C` is algebraic
over `F(S)`. This is an algebraic construction using a transcendence
basis; it makes no continuity assertion.

Put

```text
ρ_1(x)=|x|_p,            ρ_2(x)=|σ(x)|_p.
```

Both are multiplicative nonarchimedean Q_p-algebra norms. Since σ fixes
Q_p, each has the prescribed scalar homogeneity. The second norm is
complete because σ is a bijective isometry from `(C,ρ_2)` to `(C,ρ_1)`.
Nevertheless,

```text
ρ_2(t)=|p|_p ρ_1(t) != ρ_1(t).
```

Hence the same abstract Q_p-algebra admits two distinct complete spectral
norms. In particular, the algebraic automorphism σ is not a bounded
homomorphism for the original norm. This does not contradict B1 or B3,
whose continuity/boundedness assumptions are essential.

The example also locates the exact failure in the printed proof. Choose
`a_n∈F` with `a_n→t` for `ρ_1`, and set `ν=max(ρ_1,ρ_2)`. Because σ fixes
F, the two norms agree on every difference `a_n-a_m`. Therefore `(a_n)`
is Cauchy for ν. Its individual limits are

```text
ρ_1-limit: t,            ρ_2-limit: σ^(-1)(t)=p^(-1)t.
```

They are distinct. A ν-limit would have to equal both, since each `ρ_i`
is bounded above by ν and both norms are separated. Thus ν is **not
complete**, even though each `ρ_i` is complete. The maximum is still a
spectral algebra norm: taking a positive power commutes with the maximum.
It is completeness, not the algebra-norm or spectral property, that fails.

The correction is B3, or B4 with its additional one-sided continuity
hypothesis. The claim in the source is not rescued by the norm-extension
theorem for algebraic field extensions, because `C/F` here is not
algebraic.

**Review and reach.** This is a worker's finding with a proof, not an
independently confirmed erratum. No published correction was located in
the recorded version, web and repository searches; no exhaustive
historical-novelty claim is made. E1 concerns an auxiliary assertion and
its proof step. It does **not** show that the main perfectoid Abhyankar
theorem is false. A complete audit of later uses of this assertion remains
an explicit task; general categorical claims are not certified merely
by correcting this one paragraph.

### D. Ownership and remaining scope

The current PerfectoidSpaces and AdicSpacesPartII documents were read in
full, and the foundations-of-adic-spaces document through its complete
Layer 0 was read. Layer 0 supplies boundedness, power-bounded elements,
completion, restricted series and open mapping; its §0.6 has the required
completeness and Hausdorff hypotheses. AdicSpacesPartII R0 addresses
completed tensors and fiber products under its Huber hypotheses. These
are not permission to duplicate generic normed algebra in the proposed
ramification Part II, or to claim that arbitrary Banach uniformization
and all inverse limits are already covered by R0.

The repository checker also correctly prohibits a `source` route that
re-plans an upstream Tau Ceti roadmap. Accordingly the four comparison
lemmas are left as an explicit partial routing gap, rather than inventing
a tiny new roadmap or silently editing the upstream Layer 0. The eight
library imports need no new route. The invalid literal assertion is an
unrouted diagnostic, not a theorem to formalize. All 37 inherited missing
items keep their existing provisional Part II route.

The remaining §2 algebraic-closure dictionary, Banach tensor and
uniformization/limit constructions, most §3, examples and §5.4 still need
full extraction. The original reviewed-library audit, prerequisite
coverage and finer splitting of the §1 packages are not completed by this
norm calculation.

### E. Verification boundary of this continuation

The original JSON and report were copied and matched to Git blobs
`856b5edca7c6bb961e7743c35950a654b2b96355` and
`cd58baba6415cbbc2b4e3dcbcce738c258ed2ff1` respectively. Local checks verify
preservation of all inherited item objects, routes, candidates and pins,
85 distinct IDs, status counts, eight populated library citations, five
explicit unrouted gaps and the structured E1 schema. Finite exact tests
exercise product norms, the square-zero degeneration and scalar
rescaling. They do not compute the noncontinuous automorphism σ or prove
its existence by experimentation.

The full-catalogue paper validator and intake checker were not run
locally: a clone/full catalogue could not be acquired in this environment.
Their authoritative outcome is the existing Swarm submission check on
the new PR. No checker or workflow is changed. No Lean artifact was
requested or compiled, and no independent review is claimed.

Main-paper PDF screenshots continued to fail, including the published
p.13 attempt. No main-paper bytes or SHA-256 were obtained. The successful
Conrad screenshot is not a substitute for that missing main-source visual
check. The previous provenance gap therefore remains open.
