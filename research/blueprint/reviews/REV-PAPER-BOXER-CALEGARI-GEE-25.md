# REV-PAPER-BOXER-CALEGARI-GEE-25 — review of the extraction of Boxer–Calegari–Gee, *Cuspidal cohomology classes for GL_n(Z)*

**Verdict: accept. All ten routes accepted, no coverage gap, all eight recorded mistakes confirmed, nothing corrected in place.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Extraction under review: Claude Code, session `cc-d67081`, issue #1412 — 96 items (3 library, 13 planned, 80 missing), 10 routes, 8 `sourceIssues`, status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: JAMS **38** (2025), no. 2, 509–520, [doi:10.1090/jams/1050](https://doi.org/10.1090/jams/1050), read in the published offprint and in [arXiv:2309.15944v3](https://arxiv.org/abs/2309.15944) with its TeX source.

## Provenance — both hashes match

`4d27afab…7150290` (published offprint, Calegari's research page, 12 pp.) and `abfa9eac…84769684` (arXiv v3 PDF) match byte for byte. I also took the v3 e-print — one `WeightZeroPublished.tex` with its `.bbl` — and every quotation below was checked there.

## 1. Numbering and coverage — no gap

The class numbers `thm`, `cor`, `lem`, `df` and `remark` off the **subsection** counter, so plain `\subsection` headings advance it too, while the introduction's `iprob`/`ithm` run on their own counter printed with `\Alph`. Simulating that independently gives **Problem A, Theorem B, Problem C** in the introduction and **1.1, 1.2, 2.1, 2.2, 2.4, 2.5, 3.1, 3.2, 3.3** as the numbered statements, with 1.3 ("Acknowledgements") and 2.3 ("The case p = 107") being headings that consume numbers. That is exactly the numbering the extraction's locators use — a check worth making, because a shared counter of this kind is easy to mis-simulate.

**Every numbered statement is covered**, and Theorem B and Problem C are covered by name. Problem A is not a separate item, which is right: it asserts nothing (it asks whether some `H^i_cusp(GL_n(Z), C)` is non-zero) and it is the question Theorem B answers. The numbers in locators that match nothing in the paper — 1.4, 1.6, 4.2, 7.1 — are citations *into* the cited papers, carried inside the locator.

## 2. Statuses

All three `library` items check out at **pinned Mathlib `082e2d3`**, read in the source at that commit:

| cited | where |
|---|---|
| `ModularForm.levelOne_weight_two_rank_zero`, `ModularForm.dimension_level_one`, `ModularForm.rank_eq_one_add_rank_cuspForm` | `NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:245, :250, :171` (the first two inside `namespace ModularForm`, 192–314) |
| `cyclotomicCharacter`, `modularCyclotomicCharacter` | `NumberTheory/Cyclotomic/CyclotomicCharacter.lean:307, :212` |
| `ModularForm.discriminant`, `CuspForm.discriminant` | `NumberTheory/ModularForms/Discriminant.lean:52, :239`, each inside its namespace |
| `ModularForm.E₄`, `ModularForm.E₆` | `NumberTheory/ModularForms/EisensteinSeries/Basic.lean:51, :54` |

The 13 `planned` items and the routes cite 20 layers between them; **all 20 exist in `data/atlas.json`**.

## 3. Routes — two Part IIs and eight sources, all accepted

Both Part II titles reproduce their parents' titles verbatim, as PROTOCOL §15 requires (`Modularity, automorphy and Langlands endpoint extensions` and `Reusable infrastructure for potential automorphy over CM fields`, both read from the atlas records), and **neither opens a rival roadmap**:

- `PolarizedAutomorphyLifting` is already proposed as a Part II of `PotentialAutomorphyInfrastructure`, with the same parent and the identical title, by `PAPER-NEWTON-THORNE-21` and `PAPER-LE-LEHUNG-LEVIN-ETAL-23`. This route adds the ten items this paper needs to that roadmap.
- `LevelOneCuspidalCohomologyGLn` is referred to by name in `PAPER-CHENEVIER-TAIBI-20`, which points at it for the Miller vanishing bound rather than planning the same thing — the coordination the protocol asks for.

Every source route's stage exists and belongs to the roadmap that claims it.

## 4. Mistakes in the paper — 8 of 8 confirmed

All checked at their locators in the e-print. **Four were settled at the cited sources** — which is the right instinct for this paper, whose findings are mostly about what the citations actually say:

- **E2.** In Thorne's own e-print (arXiv:1107.5989v1, §"Finiteness theorems") the first theorem carries `R^{λ,C_v}_w` with the crystalline component fixed and the second carries `R^{λ,ss-ord}_w`: **10.1 is the fixed-component theorem, 10.2 the ordinary one**. BLGGT introduce their Theorem 2.4.2 with the words "The next result is **Theorem 10.2** of [Tho12]". The proof of Theorem 2.1 is the ordinary case, so it should cite 10.2; the citation of 10.1 in Theorem 3.1 (fixed crystalline components) is correct, exactly as the entry says.
- **E6.** BLGGT Theorem 2.1.1(4) reads "If `v|l` and `π_v` has an **Iwahori fixed vector** then …", and the paragraph following it says they quote Caraiani's `l = p` theorem "only in the case that `Π_y` has an Iwahori fixed vector, which is the only case we are quoting here". So local–global compatibility at `p` is not available from that citation. The entry is also right that Theorem 2.1 is unharmed: the lifting theorem it quotes (BLGGT Thm 2.4.1) itself concludes "ordinarily automorphic **of level prime to l**" for crystalline `r`.
- **E5.** Bellovin–Gee's Definition 4.2.1 (`defn: oddness`) requires `dim H^0(Gal_{F_v}, g^0) = dim G − dim B` at every infinite place, and their Proposition 4.2.6 assumes it. I re-derived their numbering from their source to be sure those are 4.2.1 and 4.2.6.
- **E3.** Guralnick–Herzig–Tiep, citing Thorne's 2-adic paper, write "Recently Thorne [T2, **Corollary 7.3**] has shown that one can relax the condition that `p ∤ dim V`, still with `p` odd" — the statement this proof needs, cited as a corollary.

**Two were settled by computation:**

- **E4.** The paper chooses `θ, θ′` with `θθ^c = ε^{2−k}`, `θ′(θ′)^c = ε^{p(2−k)}` and `Ind θ`, `Ind θ′` crystalline of weights `{0,…,k−2}` and `{0,p,…,p(k−2)}`, then writes `Ind(θ ⊗ ρ|_{G_F})`. With `θ′` the induced representation has multiplier `ε^{p(2−k)}ε^{1−p} = ε^{1−(k−1)p}` and weights `{pa+b} = {0,…,(k−1)p−1}` — regular, and what `R_F` demands. With `θ` as printed the multiplier is `ε^{3−k−p}` and the weights `{a+b}` repeat. At the case Corollary 3.2 uses, `p = 79`, `k = 38`, that is `ε^{−114}` against the required `ε^{−2922}`. The restriction must also read `ρ|_{G_M}`, since `Ind_{G_M}^{G_F}` takes a `G_M`-representation.
- **E7.** Theorem 2.1 requires `(p−1, k−1) = 1`, `f` ordinary and `ρ̄_f|_{G_{Q_p}}` semisimple. Citro–Ghitza's appendix table (arXiv:1102.3321v2) gives the level-one companion (`C[k]`) and non-ordinary (`N[k]`) eigensystems: **107: C[26]**, gcd(106,25)=1; **139: C[20]**, gcd(138,19)=1; **151: C[52]**, gcd(150,51)=**3**; **173: C[68]**, gcd(172,67)=1; **179: C[30]**, gcd(178,29)=1; **191: C[30]**, gcd(190,29)=1; **193: C[48]**, gcd(192,47)=1. So 151 must go and 191, 193 belong — the entry's corrected list exactly, including the two primes it adds. Its companion observation is right too: `k′ = p+1−k` gives `k′−1 ≡ −(k−1) mod p−1`, so the gcd is the same for both. The paper's *other* list is untouched and correct — 151 appears there legitimately through **N[60]**, gcd(59,152)=1 — and the paper's own cases sit in the same table (107: C[26] for Theorem 2.4, 79: N[38] for Corollary 3.2).

**E1** (the parameter lists fix `n = p−1` although the proof runs `n = p−1` *and* `n = p−2`, the case that gives `n = 105`) and **E8** (CKPSS04's descent theorem says nothing about local components, so "level one" for the `Sp_104` representation, and `H^*_cusp(𝒜_52, C) ≠ 0` with it, is asserted without the local input) are confirmed verbatim at their locators.

## 5. One limit of this review, recorded rather than glossed

Thorne's Math. Z. 2017 paper is **not on arXiv** and no author copy was reachable from here, so **E3 rests on Guralnick–Herzig–Tiep's citation of that paper**, not on my own reading of its §7. The substance — that the automorphy lifting statement there is not a "Theorem 7.1" — is well supported, but a reader with the Math. Z. text should confirm the absence of that number.

## 6. What this extraction does well

Its findings are almost all about **what a citation actually says**, and each one names the checkable fact: a theorem number in the cited paper, a hypothesis in a cited definition, a table entry. That is the most useful kind of finding about a 12-page paper that leans on a long chain of automorphy machinery, and every one of them survived being checked against the cited source itself.

## Tools

An inventory simulator for the shared subsection counter, the four cited e-prints (Thorne 2012, BLGGT, Bellovin–Gee, Citro–Ghitza) and Guralnick–Herzig–Tiep, and `git grep` against pinned Mathlib `082e2d3`. Kept in the session scratchpad.
