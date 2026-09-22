# PAPER-WEI-26 — Special gamma values and the Chowla–Selberg phenomenon over function fields

Claude Code — session `cc-7b31c4`; issue #1193; read on 22 September 2026.

Fu-Tsun Wei, *Algebraic relations among special gamma values and the Chowla–Selberg phenomenon over
function fields*, Inventiones mathematicae **244** (2026), no. 3, 815–897, doi
[10.1007/s00222-026-01406-8](https://doi.org/10.1007/s00222-026-01406-8).

**Which version was read.** The published article is paywalled. The version read in full is the LaTeX
source of [arXiv:2207.01165v2](https://arxiv.org/abs/2207.01165) (11 January 2026, the latest version,
posted after acceptance; `CS-v2.tex`, 4660 lines, source archive sha256
`8b5cef6bf94bb297d1c633f4b0226bc08c032bf3e704fcce8dcd3b8a59520a4a`), together with the compiled PDF
(sha256 `7bc90192f53212daa484e0aa6ed07fad68ad9f117470df09471872a3e1460a65`). Every section was read:
§1 introduction, §2 preliminaries, §3 period symbols and the period distribution, §4 diamond brackets
and Stickelberger distributions, §5 gamma distributions, §6 the Chowla–Selberg phenomenon, §7 the
Deligne–Gross conjecture. **No locator below is claimed for the published version**, since it was not
read.

**On numbering.** The paper declares every statement environment on the equation counter
(`\newtheorem{theorem}[equation]{Theorem}`, the rest `[theorem]`) with `\numberwithin{equation}{subsection}`,
so a number has three components — section, subsection, counter — and every numbered display steps it.
Reconstructing the numbers from the source alone is therefore unreliable, and three attempts to do so
disagreed with each other. The numbers used here were instead **read off the compiled PDF**: the
paper's theorem headers print the number with `▷` as the separator while cross-references print it with
`.`, and collecting every `(type, number)` pair from the extracted text gives 84 confirmed pairs,
covering every Theorem, Lemma, Proposition, Corollary and Example. Matching them to the source's
statements by (section, subsection, type, order) numbers 83 of the 112 numbered statements; the
remainder are Definitions and Remarks, whose numbers the PDF text does not expose, and those locators
give the subsection instead. The label/number correspondences used most often below were checked
individually: `thm: L-R-conj` = 1.1.1, `thm: pd` = 1.2.1, `thm: D-thm` = 1.2.2, `thm: CSF-1/2/3` =
1.3.1/1.3.2/1.3.3, `thm: DG-C` = 1.4.1, `thm: PD` = 3.3.1, `thm: trdeg` = 3.3.5, `thm: Gamma dist` =
5.4.5, `thm: Lang-Rohrlich-conj` = 5.4.7, `cor: AR-Gamma` = 5.4.8, `thm: qp-CM` = 6.1.4,
`thm: HB-period` = 6.2.2, `thm: CSP` = 6.2.3, `thm: ex-qp-CM` = 6.3.7, `thm: Lerch-type formula` =
6.4.5, `thm: DG-conj` = 7.3.1.

The paper has been extracted into **84 items**: 3 `library`, 13 `planned` by existing layers, and
**68 missing, each routed exactly once** — all 68 into one Part II of *Drinfeld modules, t-motives and
characteristic-p special values* — together with two `source` routes naming the 13 planned items the
paper is a good source for. Four misprints are recorded under `sourceIssues`.

## What the paper proves

Fix `q`, a power of a prime `p`. The paper works with two copies of the rational function field in one
variable. On the *arithmetic* side, `A = F_q[θ]`, `k = F_q(θ)`, `k_∞` the completion at the infinite
place normalised by `|θ|_∞ = q`, `C_∞` the completion of an algebraic closure of `k_∞`, and `k-bar` the
algebraic closure of `k` inside it. On the *motivic* side, `𝔸 = F_q[t]` and `𝕜 = F_q(t)`, with `𝔸_+`
the monic polynomials and `v_θ` the evaluation `t ↦ θ`. Writing `𝔊 = Gal(𝕜^sep/𝕜)` and `𝔊_∞` the
decomposition group at the infinite place of `𝕜`, a choice of embedding `ν: 𝕜^sep ↪ C_∞` over `v_θ`
identifies the objects of the two sides.

There are three gamma functions. Goss's **arithmetic** one interpolates the Carlitz factorial: for
`y ∈ Z_p` with `q`-adic digits `y_i`, `Π_ari(y) = ∏_{i≥1} (∏_{j<i}(1 - θ^{q^j}/θ^{q^i}))^{y_i}` and
`Γ_ari(y) = Π_ari(y-1)`. Thakur's **geometric** one is the Euler product
`Γ_geo(x) = x^{-1} ∏_{a ∈ A_+} (1 + x/a)^{-1}` for `x ∈ C_∞ \ (-A_+ ∪ {0})`. Thakur's **two-variable**
one interpolates both, and satisfies `Γ(x, 1 - 1/(q-1)) · Γ_ari(1 - 1/(q-1)) = Γ_geo(x)`. The paper
determines **all** algebraic relations among their special values, and proves the Chowla–Selberg
formula Thakur conjectured for periods of CM Drinfeld modules.

The four theorems the extraction treats as the paper's targets are these.

**(1) The Lang–Rohrlich analogue (Theorem 1.1.1 = Theorem 5.4.7, with Corollary 5.4.8).** For
`𝔫 ∈ 𝔸_+` and `ℓ ∈ N`,

```
trdeg_{k-bar} k-bar( Γ_geo(x), Γ_ari(y), Γ(x,y) : x ∈ (1/𝔫(θ))A \ (-A_+ ∪ {0}), y ∈ (1/(q^ℓ-1))Z )
  = 1 + (ℓ - 1/(q-1)^{ε_𝔫}) · #(A/𝔫)^×,
```

where `ε_𝔫 = 1` if `deg 𝔫 > 0` and `0` otherwise; and every algebraic relation among these values over
`k-bar` follows from the monomial relations of Proposition 5.4.2. Taking `ℓ = 1` recovers the geometric
case of Anderson–Brownawell–Papanikolas and taking `𝔫 = 1` the arithmetic case of
Chang–Papanikolas–Thakur–Yu; the two-variable values had not been treated before.

**(2) The period distribution and the gamma distributions (Theorem 1.2.1 = Theorem 3.3.1, and
Theorem 1.2.2 = Theorem 5.4.5).** Let `𝒮(𝔊)` be the space of **Stickelberger functions**: locally
constant `Q`-valued functions `φ` on `𝔊` with `φ + φ^{ϱ_∞}` constant, where `ϱ_∞` generates the
relevant part of `𝔊_∞`. Theorem 3.3.1 says there is a **unique** `Q`-linear map
`𝒫_ν : 𝒮(𝔊) → C_∞^×/k-bar^×` such that `𝒫_ν(φ_{𝕂,Φ⁰}) = 𝒫_𝕂(ξ_ν, Φ⁰)` for every CM field `𝕂` over
`𝕜` and every `Φ⁰ ∈ I_𝕂⁰`, where `𝒫_𝕂` is the period symbol of a CM dual `t`-motive. Existence rests on
exactly three properties of the period symbol — compatibility with restriction and inflation,
equivariance under `Aut(𝕂/𝕜)`, and the Legendre relation
`∏_{ξ ↦ ξ^+} p_𝕂(ξ, Φ⁰) ~ π-tilde^{wt(Φ⁰)}` — which are what a distribution needs. Theorem 5.4.5 then
identifies the three gamma distributions with the composites `𝒫_ν ∘ St^ari`, `𝒫_ν ∘ St^geo` and
`𝒫_ν ∘ St`: the function-field analogue of Deligne's theorem that the classical gamma distribution
factors through the period distribution.

**(3) Thakur's conjecture and the Chowla–Selberg formula (Theorem 1.2.4 = Theorem 6.2.3;
Theorems 6.1.4, 6.2.2 and 6.3.7).** For an imaginary field `𝕂` inside the Carlitz cyclotomic tower,
let `φ_𝕂 ∈ 𝒮(𝔊^cyc)` be the characteristic function of `Gal(𝕂^cyc/𝕂)` and write
`φ_𝕂 = Σ_{x,y} m_{x,y} St(x,y)`. Then every nonzero period `λ` of a Drinfeld `𝔸`-module over `k-bar`
with CM by `O_𝕂` satisfies `λ ~ ∏_{x,y} Γ-tilde(x,y)^{m_{x,y}}` — the recipe Thakur proposed in 7.12 of
his 1991 paper, proved here in general. Theorem 6.1.4 does the same for quasi-periods of CM abelian
`t`-modules with an arbitrary generalized CM type, Theorem 6.2.2 for period vectors of the associated
Hilbert–Blumenthal `t`-modules, and Theorem 6.3.7 makes all of it explicit, with Dirichlet `L`-values
`L_𝔸(0,χ)` appearing in the exponents through the rational numbers
`n_𝔠(ϱ,a,i) = Σ_χ χ(ϱ)χ(a, i + deg 𝔠)/L_𝔸(0,χ)`. Three worked examples follow: constant field
extensions (recovering Thakur's Theorem 1.6 of 1991 and Chang–Papanikolas–Thakur–Yu's basis), the
`t`-th Carlitz cyclotomic field (recovering Thakur's book Theorem 4.11.2), and imaginary quadratic
extensions, where the answer is the pair `ϖ_𝕂^±` and the classical shape
`ϖ_𝕂^± = √π-tilde · ∏_a Γ_geo(a(θ)/𝔡(θ))^{± χ_𝕂(a)/(2 h_𝕂)}` appears. §6.4 gives a Lerch-type formula
for `L_𝔸'(0,χ)` and a logarithmic form of the whole formula.

**(4) The Deligne–Gross conjecture (Theorem 1.4.1 = Theorem 7.3.1).** In Hartl–Juschka's category of
mixed `𝕜`-Hodge–Pink structures, let `𝕳'` be a Hodge–Pink sub-structure of `𝕳(𝕄)` for a pure
uniformizable dual `t`-motive `𝕄` over `k-bar`, with full CM by a CM field `𝕂` in the cyclotomic tower.
Then the periods of `𝕳'` depend only on its Hodge–Pink type `Φ_{𝕳'} ∈ I_𝕂⁰` and are the gamma monomial
that type prescribes through the period distribution. This is the function-field form of the
conjecture Gross stated (with Deligne's explicit formulation) on p. 205 of his 1978 paper, which over
number fields is still open.

**The mechanism.** The proof is a matching of two distributions on the same space. On the transcendence
side, `𝒫_ν` is injective and its image at each finite level has transcendence degree
`1 + (1 - 1/[𝕂:𝕂^+])·[𝕂:𝕜]`, by the function-field analogue of Shimura's conjecture on period symbols
(Brownawell–Chang–Papanikolas–Wei), quoted as Theorem 3.3.5. On the gamma side, Thakur's diamond
brackets define Stickelberger distributions `St^geo`, `St^ari` and `St`, and §4.3 proves each is
**universal** in the Kubert–Lang sense, so that a map out of it is determined by the distribution
relations alone. The two sides are glued by a **generalized soliton** construction (§5.3), which
extends Anderson–Brownawell–Papanikolas's 6.4.2 to two variables: a shtuka function for a cyclotomic
function field produces a dual `t`-motive whose period is, after evaluation, precisely a gamma value.
`Γ-hat = 𝒫^cyc ∘ St` follows, and everything else is bookkeeping with the universality.

## What the atlas already has

Thirteen items are `planned` by existing layers, and the paper is a good source for all of them; they
are carried by the two `source` routes.

*`DrinfeldModulesAndTModules`* (nine items). **DM.0** plans additive polynomials, Drinfeld modules and
the Carlitz module — the Carlitz fundamental period `π-tilde`, the normalisation every period statement
here is relative to, and the Drinfeld `𝔸`-modules of §6.2 with CM by an order. **DM.1** plans torsion
and Tate modules, **DM.2** analytic uniformization, lattices and periods — the period lattice `Λ_ρ` and
the quasi-period space of §6.1. **DM.4** plans Anderson `t`-modules and effective `t`-motives
*including the contravariant convention*, which is exactly the dual `t`-motives of Definition 2.2.1,
together with rigid analytic triviality, so uniformizability is planned there as well. **DM.5** plans
isogenies and the Tate theorem, which covers the isogeny calculus of Remark 2.2.3. **DM.7** plans
elliptic sheaves and shtuka realisations, which covers the shtuka functions of Theorem 5.2.1. **DM.8**
plans the Tannakian category of rigid analytically trivial dual `t`-motives, its Frobenius-difference
Galois group and the criterion identifying period transcendence degree with the dimension of that
group; the transcendence input Theorem 3.3.5 is the CM case of that programme, and the
Anderson–Brownawell–Papanikolas criterion is the linear-independence step inside it.

*`FunctionFieldArithmetic`* (four items). **FA.4** plans local and global class field theory over a
function field, which is where the Carlitz cyclotomic tower `𝕂_{𝔫,ℓ}`, its Galois group and the Artin
map of §3.4 belong. **FA.5** plans zeta functions, Artin factors and Chebotarev, which is where the
Dirichlet characters and `L`-functions `L_𝔸(s,χ)` of §4.2 and §6.4 belong, including the vanishing
criterion for `L_𝔸(0,χ)`. **FA.0** and **FA.3** plan curves, fields and constants and
positive-characteristic extensions, supplying the separable closure, constant-field extensions and the
decomposition group at infinity that `𝒮(𝔊)` is defined with.

Three items are already in the libraries and must not be planned again: transcendence bases and
transcendence degree (`IsTranscendenceBasis`, `Transcendental`); locally constant functions together
with profinite groups and their Haar measure (`IsLocallyConstant`, `ProfiniteGrp`,
`MeasureTheory.Measure.haarMeasure`), which is all that Definition 3.2.1 needs beyond the group; and
the base data `A`, `k`, `k_∞`, `C_∞` (`Polynomial`, `RatFunc`, `FunctionField`, `LaurentSeries`), where
only the assembly is specific to the paper.

## What the atlas lacks

A search of `data/atlas.json` and of every `*.result.json` in `research/blueprint/papers/` finds no
layer and no proposed roadmap that plans any of the following. "gamma value", "hodge-pink" and
"soliton" return nothing at all; "stickelberger" returns only `IntegralIwasawaTheory` I.3/I.6/I.8 and a
Tau Ceti number-field layer, which plan the classical Stickelberger element over number fields and not
the distributions used here; and the four hits for "chowla" are all the Chowla conjecture on
multiplicative functions in `ProbabilisticAndMetricNumberTheory`, unrelated to Chowla–Selberg.

* Gamma functions in characteristic `p` — arithmetic, geometric and two-variable — with their
  reflection, multiplication and functional equations, and the diamond brackets that encode them.
* CM theory for dual `t`-motives: CM fields over `𝕜`, the set `J_𝕂`, generalized CM types of arbitrary
  weight with inflation and restriction, CM dual `t`-motives and their existence, uniformizability and
  isogeny theorem.
* The de Rham realisation of a dual `t`-motive, essentially surjective morphisms, period symbols, their
  functoriality and the Legendre relation.
* Stickelberger functions, the `𝔊`-action on them, the identification of the finite levels with rational
  spans of CM types, and the period distribution itself.
* Stickelberger distributions, the universal distributions they define, and the three universality
  theorems.
* Solitons, generalized soliton dual `t`-motives, and the evaluation that turns a soliton period into a
  gamma value.
* The Chowla–Selberg formula in its abstract, explicit and logarithmic forms, and the Lerch-type formula
  for `L_𝔸'(0,χ)`.
* Mixed `𝕜`-Hodge–Pink structures, the realisation of a Hodge–Pink sub-structure by a dual `t`-motive,
  full CM, the Hodge–Pink type, and the Deligne–Gross conjecture.

## The routes

**Route 1 — `part-ii` of `DrinfeldModulesAndTModules`, new roadmap `GammaValuesAndCMPeriods`, area
`functionfields`, all 68 missing items.** Title: *Drinfeld modules, t-motives and characteristic-p
special values, Part II: gamma values, CM periods and the Chowla–Selberg phenomenon*. The parent owns
every object the paper computes with, which is why this is a Part II and not a new roadmap: every
statement is about periods and special values of the `t`-modules the parent constructs, and the
transcendence input is the CM case of what DM.8 plans. What the paper adds is new layers in the same
direction, listed above.

It is **deliberately disjoint from `DrinfeldModulesAndTModulesPartII`**, the Part II of the same parent
already proposed by `PAPER-CHANG-CHEN-MISHIBA-23`, `PAPER-IM-KIM-LE-ETAL-24` and `PAPER-NGODAC-21`:
that lane owns multiple zeta values and Thakur's basis conjecture and says nothing about gamma values,
CM periods or Hodge–Pink structures. The brief names the four final theorems (5.4.7, 5.4.5 with 3.3.1,
6.2.3 with 6.1.4/6.2.2/6.3.7, and 7.3.1), the coverage, and the imports from
`DrinfeldModulesAndTModules` (DM.0, DM.1, DM.2, DM.4, DM.5, DM.7, DM.8) and `FunctionFieldArithmetic`
(FA.0, FA.3, FA.4, FA.5), together with the library facts that must not be rebuilt.

**Route 2 — `source` of `DrinfeldModulesAndTModules`, stages DM.0, DM.1, DM.2, DM.4, DM.5, DM.7, DM.8,
nine items.** §2.2 sets up dual `t`-motives, their Betti modules, uniformizability, purity and the
isogeny calculus in one place and in the form later work uses; §6.1 does the same for abelian
`t`-modules and their quasi-periods; §6.2 uses a Drinfeld `𝔸`-module of rank `[𝕂:𝕜]` with CM by an
order; Theorem 5.2.1 is the shtuka function of a cyclotomic function field. The roadmap has origin
`campaign`, not `tauceti`, so a source route is the correct form.

**Route 3 — `source` of `FunctionFieldArithmetic`, stages FA.0, FA.3, FA.4, FA.5, four items.**
§§3.4, 4.2 and 6.4 work out the Carlitz cyclotomic tower, its Artin map, and the Dirichlet characters
and `L`-functions attached to it explicitly, so the paper is a good source for those layers. None of
these four items is missing.

## Source issues

Four misprints, all `affects: nothing`, all in arXiv:2207.01165v2. **The published text was not read**,
so none of them is claimed to be in print; a reviewer with journal access should check them there.
No correction exists: arXiv shows only v1 and v2 with no comment about one, the author's publication
page has no errata section, the Springer article page shows no "Correction to this article" link, and a
web search returns nothing.

* **E1 (§6.2, in the proof of Theorem 6.2.3).** "`= [𝕂:𝕜] (by Proposition 3.3.5)`" — 3.3.5 is a
  **Theorem**, the transcendence-degree result quoted from Brownawell–Chang–Papanikolas–Wei, and the
  paper cites it correctly as "Theorem 3.3.5" at its two other occurrences (§1.2 and the proof of
  Theorem 5.4.7). Found by the cross-reference type audit, which reports this as the only such mismatch
  in the paper.
* **E2 (Theorem 6.4.5, the hypothesis line).** "Given a character `χ ∈ 𝔊_{𝔫,ℓ}`" — the character
  belongs to the **dual** group `𝔊̂_{𝔫,ℓ}`. The conclusion involves the conductor `𝔠_χ` and the values
  `χ(a, i + deg 𝔠_χ)`, which are defined only for `χ` in the dual, and the source writes
  `\widehat{\eG}` in all 38 other places where such a character is quantified.
* **E3 (Example 6.3.11, final sentence; and the Remark following Theorem 1.3.3 in §1.3, part (2)).**
  The same object is written `ϖ` (`\varpi`) in one place and `ω` (`\omega`) in the other. Example 6.3.11
  defines `ϖ_𝕂^±` and then says the quasi-period space is spanned by `{ω_𝕂^+, ω_𝕂^-}`, which are never
  defined in §6; symmetrically, the §1.3 Remark defines `ω_𝕂^±` and then states its two conclusions for
  `ϖ_𝕂^±`. The two formulas agree — with `𝔫 = 𝔡` and `ℓ = 2` the exponent `n_𝔡(ϱ,a,i)` computed in
  Example 6.3.11 turns the Theorem 1.3.3 definition into the §1.3 display — so only the name is
  affected.
* **E4 (Remark 6.3.6, its last sentence and the display closing it).** "the expression of
  `𝔫_𝔠(ϱ,a,i)`" and "`h(𝕂/𝕂^+) · 𝔫_𝔠(ϱ,a,i) ∈ Z`" — the fraktur `𝔫` denotes a monic polynomial in
  `𝔸_+` everywhere else in the paper and `𝔫_𝔠` is never defined; the equation the sentence points at
  defines the roman `n_𝔠(ϱ,a,i)`, which is used correctly at its 19 other occurrences.

Two computations in the paper were checked independently while reading, and both are right: the
character sum `n_1(1,i) = Σ_{χ≠1} χ(1,i)/L_𝔸(0,χ) = Σ_{d=1}^{ℓ-1} ζ_ℓ^{id}(1 - qζ_ℓ^d)` of
Example 6.3.9 does equal `q - 1` plus `ℓ`, `-ℓq` or `0` according as `i ≡ 0`, `i ≡ ℓ-1` or otherwise,
and the sum `n_t(ε,0) = Σ_{χ≠1} χ(ε,0)` of Example 6.3.10 does equal `-1` plus `q-1` or `0` according
as `ε = 1` or not.

## Prerequisites proposed for a later batch

None of the following is in `research/blueprint/papers/papers.json`.

Brownawell–Chang–Papanikolas–Wei, *Function field analogue of Shimura's conjecture on period symbols*
([arXiv:2203.09131](https://arxiv.org/abs/2203.09131)) — the transcendence input, and the source of the
period symbols themselves, their functoriality and Legendre relation, and the existence and isogeny
theorem for CM dual `t`-motives. This is the most important one: without it §3 cannot be planned.
Thakur, *Gamma functions for function fields and Drinfeld modules*, Ann. of Math. **134** (1991),
25–64 — the geometric and two-variable gamma functions, the diamond brackets, and the conjecture the
paper proves. Goss, *The Γ-function in the arithmetic of function fields*, Duke Math. J. **56** (1988),
163–191 — the original two-variable function and the interpolation theory.
Anderson–Brownawell–Papanikolas, *Determination of the algebraic relations among special Γ-values in
positive characteristic*, Ann. of Math. **160** (2004), 237–313 — the geometric case, the linear
independence criterion, the shtuka functions of Theorem 5.2.1 and the soliton construction §5.3
generalizes. Hartl–Juschka, *Pink's theory of Hodge structures and the Hodge conjecture over function
fields* ([arXiv:1607.01412](https://arxiv.org/abs/1607.01412)) — all of §7 is in this language.
Anderson, *Logarithmic derivatives of Dirichlet L-functions and the periods of abelian varieties*,
Compositio **45** (1982), 315–332 — the classical period distribution and Deligne's theorem, the model
for Theorem 5.4.5 and for §6.4. Chang–Papanikolas–Thakur–Yu, *Algebraic independence of arithmetic
gamma values and Carlitz zeta values*, Adv. Math. **223** (2010), 1137–1154 — the arithmetic case.
Kubert–Lang, *Modular units*, Grundlehren **244** (1981) — universal distributions, used in §4.3.
Papanikolas's Tannakian duality paper and Anderson's *t-motives* are listed for the record only: DM.8
and DM.4 already name them as their sources.

## Checks run

* `python3 scripts/check_paper.py research/blueprint/papers/PAPER-WEI-26.result.json` — ok.
* `python3 research/blueprint/intake.py check-files` on both deliverables — ok.
* Source audits on `CS-v2.tex`: duplicate `\label` (none), undefined `\ref` (none), and a
  cross-reference **type** audit comparing the word before each `\ref` with the environment carrying
  that label (found E1). E2, E3 and E4 were found by reading and then checked mechanically against
  every other occurrence of the same notation.
* Statement numbers taken from the compiled PDF rather than reconstructed, as described above; 84
  confirmed `(type, number)` pairs, 83 of 112 statements numbered.
* Every `planned` stage id checked against `data/atlas.json`; every route checked for stage ownership,
  for the parent roadmap's origin, for the Part II title being exactly
  `<parent title>, Part II: <topic>`, and for the new roadmap id not already existing in the atlas or
  in any other `*.result.json`; every missing item asserted to be routed exactly once.
* The two character-sum computations of Examples 6.3.9 and 6.3.10 verified by hand.
* Search for an existing erratum: the arXiv listing, the author's publication page, the Springer
  article page, and a web search. None exists.
* No Lean file is part of this job.
