# PAPER-CALMES-ETAL-26 — Calmès, Dotto, Harpaz, Hebestreit, Land, Moi, Nardin, Nikolaus, Steimle, *Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings*

Nine authors, **to appear in Annals of Mathematics** (so listed in the paper's own bibliography). Read in **arXiv v4**, dated 28 April 2026, 63 pages, SHA-256 `1e4b6720055ebdce0012f5780bfc7cdb5b853e32f29b17224a1be0bc676f770c`, [arXiv:2009.07225](https://arxiv.org/abs/2009.07225v4). Locators are the paper's own statement numbers and its printed page numbers.

Issue #1055, **Claude Code** `cc-fb70e5`, 23 September 2026, single session.

**Status: `complete`.** 180 items (178 missing, 2 planned), **8 routes** — one new roadmap, one Part II, six source routes — 16 prerequisites, **5 source issues**, 7 gaps. Every missing item has exactly one route and none is taken twice.

The paper was read in full, in order, pp. 1–61 (the remaining two pages are references). The tables in §3.2, which are the paper's headline output, were read from **pages rendered as images at 190 dpi**, not from extracted text, and then **re-derived** rather than transcribed; see *The coverage audit* below.

## What the paper proves

Four results, in the paper's own numbering of the introduction.

**Theorem 1** is the structural one: for any ring `R` and invertible ℤ-module with involution `M`, the classical symmetric Grothendieck–Witt spectrum sits in a fibre sequence

```
K(R; M)_{hC₂} ⟶ GW^s_cl(R; M) ⟶ L^s(R; M)
```

in non-negative degrees. The tool is the family of Poincaré structures `Ϙ^{≥m}_M` on `D^p(R)` interpolating between the quadratic `Ϙ^q` (`m → −∞`) and the symmetric `Ϙ^s` (`m → +∞`), together with a surgery argument (§§1.1–1.3) comparing `L(R; Ϙ)` with `L^s(R; M)` in a range governed by how *`r`-symmetric* or *`r`-quadratic* `Ϙ` is: for a coherent ring of global dimension `d`, injective for `n ≥ d − 2r + 2` and bijective for `n ≥ d − 2r + 3` (Corollary 1.3.9). Specialising `r` gives **Theorem 3** (quadratic-to-symmetric comparison in degrees `≥ d+2`, improved to `≥ d` for 2-torsion-free `R` with `M = R`) and **Theorem 5** (the genuine symmetric L-groups *are* Ranicki's L-groups of short complexes).

**Theorem 7** is a localisation–dévissage fibre sequence for Grothendieck–Witt and L-theory of a Dedekind ring. Unlike its K-theoretic model it needs the *symmetric* flavour: Remark 2.2.8 and Remark 2.3.15 show dévissage fails for quadratic structures, and fails only at the primes over 2.

**Theorem 2** solves Thomason's homotopy limit problem for every Dedekind ring whose fraction field is a number field: `GW(R; (Ϙ^s_M)[m]) → K(R; (Ϙ^s_M)[m])^{hC₂}` is a 2-adic equivalence, integrally exactly when the fraction field is not formally real (Remark 3.1.9). This removes the hypothesis that 2 be invertible from Berrick–Karoubi–Schlichting–Østvær, because the dyadic primes are handled by the finite-field case (Proposition 3.1.4, with a short new proof for `q` even), and it proves a conjecture of Berrick and Karoubi (Proposition 3.1.11).

**Theorem 4** and its quadratic companions are complete tables of the symmetric, symplectic, quadratic and skew-quadratic Grothendieck–Witt groups of ℤ (Theorem 3.2.2, Table 1, Theorems 3.2.9 and 3.2.13), and **Corollary 8** says the classical Grothendieck–Witt groups of any number ring are finitely generated.

## Routing — one new roadmap, one Part II, six source routes

| # | route | roadmap | stages | items |
|---|---|---|---|---|
| 1 | `new` | `HermitianKTheoryOfPoincareCategories` — Poincaré ∞-categories and the flavours of L-theory | — | 104 |
| 3 | `part-ii` | `QuadraticArithmeticAtDyadicPrimes` (parent `GeometryOfNumbersAndQuadraticArithmetic`) | — | 16 |
| 8 | `source` | `GeometryOfNumbersAndQuadraticArithmetic` | GN.6, GN.2 | 22 |
| 2 | `source` | `GeneralAlgebraicKTheory` | KU-fundamental, K.3 | 18 |
| 5 | `source` | `KTheoryFiniteLocalFields` | L.1, KU-finitefields, KU-localp | 7 |
| 7 | `source` | `StableHomotopyKTheory` | H.4, KU-plus | 6 |
| 4 | `source` | `ArithmeticKTheory` | KU-finitegeneration, N.3:finite-generation | 4 |
| 6 | `source` | `MotivicEtaleKTheory` | M.7, KU-etalehigher | 1 |

**Why a new roadmap and not more stages on GN.6.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6` is titled "Hermitian K-theory and Grothendieck-Witt groups" and it is the right home for the paper's *outcomes* — the tables, the homotopy limit problem, the Berrick–Karoubi statement. But the machine that produces them is not about number rings at all: it is Poincaré ∞-categories, the interpolating family `Ϙ^{≥m}_M`, `r`-symmetry, surgery on Poincaré objects with Lagrangians and algebraic Thom constructions, the bounded L-groups `L^{a,b}_n`, and Karoubi periodicity. That is 104 of the 180 items, it is stated for arbitrary rings and arbitrary Poincaré structures, and no layer of the atlas carries any of it. Route 1 asks for it as a roadmap of its own that every arithmetic route then imports; its brief names the four theorems to reach and, deliberately, says to *import* the fibre sequence of Paper [II] rather than reprove it.

**Why the dyadic theory is a Part II and not a source route.** GN.2, "Quadratic and hermitian local-global theory", carries the classical statements — those available once 2 is invertible. §2.3 is precisely the complementary story: a localisation–completion Poincaré–Verdier square (Proposition 2.3.6), rigidity of quadratic L-theory under completion (Proposition 2.3.7, and Remark 2.3.8 for henselian pairs), the four-periodic tables for Dedekind rings in both characteristics, the correction term `A` with its surjection onto `(ℤ/2)^{d−1}` when there are `d ≥ 2` dyadic primes (Remark 2.3.12), and the worked example over the Eisenstein integers. That is a layer sequence, not two extra stages, and it is what a design job would need before the Grothendieck–Witt groups of a general number ring (gap below) could be attempted. Parent and title follow PROTOCOL §15: the parent roadmap is extended, never re-planned.

The six source routes place the remaining mathematics where the atlas already plans its K-theoretic counterpart: dévissage and localisation with `GeneralAlgebraicKTheory` (the hermitian half of "Fundamental theorems for exact categories"), Quillen's finite-field calculation with `KTheoryFiniteLocalFields`, the group-completion identifications of `π₀` with `StableHomotopyKTheory:H.4`, finite generation beside `ArithmeticKTheory:KU-finitegeneration`, and the single étale-descent lemma with `MotivicEtaleKTheory:M.7`.

**Two items are `planned`, not missing.** The K-groups of ℤ with their Bernoulli bookkeeping (item `/424`) and the conditional cyclicity of their odd torsion (`/425`) are already planned by `ArithmeticKTheory` N.5, N.6 and N.7 — "Odd groups, including extension data", "Even groups and arithmetic cohomology" and "Regular primes and Bernoulli numbers". They are the paper's external input, not its contribution, and they need no route.

## The five source issues

Three misprints in §§1.2–1.3 and two defects in Example 2.3.14. Each was confirmed on a rendered clip (250–300 dpi) so that it is a printed slip and not an extraction artifact, and each was traced through the statements that cite it.

- **`E1` (misprint, affects nothing) — proof of Corollary 1.2.12, p. 18.** "is also injective (hence bijective) when `n ≤ 2n − 3`" should be `n ≤ 2m − 3`. The paragraph it closes opens "let us now assume that `n ≤ 2m − 3`"; as printed the condition collapses to `n ≥ 3`.
- **`E2` (misprint, affects a stated result) — Proposition 1.3.1 (i) and (ii), p. 27.** Both parts print `Pn(D^p(R), Ϙ^{[−n]})`, but the proposition's hypotheses introduce no ring at all: they are "Let `C` be a stable ∞-category with a bounded t-structure … Let `Ϙ` be an `r`-symmetric Poincaré structure on `C`", and its conclusion is about `L^{a,b}_n(C,Q) → L_n(C,Q)`. Its own proof says `Pn(C, Ϙ[−n])`. This is the one misprint with reach, and the chain is short: the paragraph before the proposition says the general setting is needed "for a category of torsion modules, which is not itself given by modules over a discrete ring, in Theorem 2.2.4 below"; Corollary 1.3.8, correctly stated for a general `C`, is proved by "Apply Proposition 1.3.1 with `r = ∞`, `d = 0`"; and the proof of Theorem 2.2.4 says "for both sides of (7) we are in the situation of Corollary 1.3.8", where those sides are `⊕_{𝔭∈S} D^p(𝔽_𝔭)` and `D^p_S(R)` — neither is `D^p(R)`. As printed, parts (i) and (ii) fail to cover what the dévissage theorem, and through it Theorem 7 and the Berrick–Karoubi conjecture, ask of them.
- **`E3` (misprint, affects nothing) — Remark 1.2.28, p. 23.** Cites "Remark 1.1.6"; 1.1.6 is a *Lemma*, and is cited correctly as such in five other places, including in Remark 1.2.2, the very remark being referred to.

The two new ones are both in **Example 2.3.14**, the computation over the Eisenstein integers, and both were found by redoing the computation rather than by reading it.

- **`E4` (misprint, affects the proof) — p. 47: "the kernel of `·⟨1,3⟩` is additively generated by `2⟨1⟩` and `⟨1,−2⟩`".** `⟨1,−2⟩` is not in that kernel. Over `ℚ₂` the form `⟨1,3⟩` is the norm form of `E = ℚ₂(√−3)` — the completion of the very field in the example — and `E` is *unramified*, so its norm group is exactly the elements of even valuation. Hence `⟨a,b⟩·⟨1,3⟩ = 0` iff `a/(−b)` is a norm, i.e. iff `v(a) + v(b)` is even. For `⟨1,−2⟩` that is `0 + 1`; for `⟨1,−3⟩` it is `0 + 0`, and indeed `⟨1,−3⟩·⟨1,3⟩ = ⟨1,3,−3,−9⟩ = ⟨1,−1⟩ ⊥ ⟨3,−3⟩ = 0`. Two independent confirmations: `⟨1,−2⟩·⟨1,3⟩ = ⟨1,3,−2,−6⟩` has rank 4, discriminant 1 and Hasse invariant `(3,−2)(3,−6)(−2,−6) = (+1)(−1)(−1) = +1` at 2, whereas the rank-4 hyperbolic form has `(−1,−1) = −1`; and directly, `x² + 3y² = 2(z² + 3w²)` forces a valuation-parity contradiction, so the form is anisotropic. **The stated answer `ℤ/4 ⊕ ℤ/2` is right**, with `2⟨1⟩` and `⟨1,−3⟩` as generators: `⟨1⟩` has order 8 in `W(ℚ₂)`, `2⟨1,−3⟩ = 4⟨1⟩` (equal rank, discriminant and Hasse invariant), and `⟨1,−3⟩ − 2⟨1⟩ = ⟨−1,−3⟩` has discriminant 3 so lies outside `⟨2⟨1⟩⟩`; the order 8 is forced anyway by `|W(ℚ₂)| = 32` and the image of `·⟨1,3⟩` having order 4, which the paper computes correctly on the same page. `2` and `3` differ by one glyph, so this reads as typography, and nothing downstream moves.
- **`E5` (gap, affects the proof) — p. 46: "The discriminant of `K` is `(3)`, and as `(2)` does not divide `(3)`, we deduce that `(2)` is a prime ideal in `R` [Neu99, Corollary III.2.12]".** Not dividing the discriminant gives *unramified*, not *inert*: an unramified rational prime in a quadratic field is either prime or a product of two distinct primes. `ℚ(√−7)` settles it — discriminant `−7`, `2 ∤ 7`, and yet `(2)` splits, since `x² + x + 2 ≡ x(x+1) (mod 2)`. The conclusion drawn is nevertheless true: `x² + x + 1` is irreducible over `𝔽₂`, equivalently `−3 ≡ 5 (mod 8)`, so `(2)` is inert and `d = 1` as the example needs. Only the justification is incomplete, and the cited Neukirch corollary sits in the section on the different and the discriminant, where what is available is the ramification criterion.

One further correction *in the literature* is recorded in the items rather than in `sourceIssues`, because it is not a defect of this paper: p. 50 notes that [FP78] corrected [Fri76], which computed `π₁(GW^q_cl(𝔽_q))` for `q` even to be trivial when it is `ℤ/2`. The prerequisite entry for those two papers repeats the warning, since the atlas will import them together.

## The coverage audit, and what it actually found

Every numbered statement was extracted mechanically — a regular expression over line-initial `n.n.k.` headings, after repairing the ligatures that PDF extraction breaks (`ﬁ`, `ﬂ`, …) — giving **15** in §1.1, **35** in §1.2, **18** in §1.3, **5** in §2.1, **10** in §2.2, **20** in §2.3, **14** in §3.1 and **14** in §3.2: **131**, with no gap in any sequence, plus the twelve labelled recollections **R.1–R.12**. Each of those **143 labels** was then required to appear in the locator of some item. All 143 do.

The audit earned its keep twice. Numbers appearing outside those ranges (`1.1.16`–`1.1.21`, `1.4.x`, `4.x.y`) were checked one by one and are all cross-references into Papers [I] and [II] — `Corollary [I].1.1.21`, `Proposition [II].4.5.5` — not statements of this paper; treating them as statements would have invented six holes. And a first pass of the check, run against locators *and* notes, showed six §2.3 remarks (2.3.3, 2.3.8, 2.3.11, 2.3.12, 2.3.15, 2.3.17) mentioned only inside other items' notes; re-running it against **locators alone** exposed them as genuinely unextracted, and items `/343`–`/349` were written for them. Two of those — the surjection `A ↠ (ℤ/2)^{d−1}` and the characteristic-2 behaviour of `W^q(R) → W^s(R)` — are substantive, not bookkeeping.

**The tables were re-derived, not transcribed.** Theorem 3.2.2 was checked against both halves of its own proof: after inverting 2 against `L^s_n(ℤ;ε)[1/2] ⊕ K_n(ℤ)[1/2]` in the four residues mod 4, and 2-locally against the Bernoulli bookkeeping with `w₂ = 24`, `w₄ = 240`, `w₆ = 504`, `w₈ = 480`, `w₁₀ = 264`, `w₁₂ = 65520` and `c₆ = 691`. Table 1 was then recomputed from Theorem 3.2.2 for `k = 0,1,2`: all **48 entries** agree. The von Staudt step in the proof, that `v₂(w_{2n}) = v₂(8n)`, was verified for `n = 1,…,8`. The external K-theory input was checked against the standard list: `|K_{8k+2}(ℤ)| = 2c_{2k+1}`, `|K_{8k+6}(ℤ)| = c_{2k+2}`, `K_{8k+3}(ℤ) = ℤ/2w_{4k+2}`, `K_{8k+7}(ℤ) = ℤ/w_{4k+4}` all hold against `K₂ = ℤ/2`, `K₃ = ℤ/48`, `K₆ = 0`, `K₇ = ℤ/240`, `K₁₀ = ℤ/2`, `K₁₁ = ℤ/1008`, `K₁₄ = 0`, `K₁₅ = ℤ/480`, `K₁₈ = ℤ/2`, `K₁₉ = ℤ/528`, `K₂₂ = ℤ/691`, `K₂₃ = ℤ/65520`.

**Introduction against body.** The claim on p. 3 that the groups are computed "in a range of degrees `< 20000`" matches Remark 3.2.1 exactly: cyclicity of `K_{4m−2}(ℤ)_odd` is known for `m ≤ 5000`, and `4·5000 − 2 = 19998`. Theorem 3 was checked against Corollary 1.3.10 and Remark 1.3.16 (ranges `d+2`/`d+3` in general, `d`/`d+1` for 2-torsion-free `R` with `M = R`, which is `r = 0` against `r = 1` in Corollary 1.3.9 — and `Ϙ^{gs} = Ϙ^{≥−1}` being 3-symmetric is exactly what makes the diagram in the proof of Lemma 3.2.7 read `≃_{≥−2}`). Theorem 2 against Theorem 3.1.7, Theorem 4 against Theorem 3.2.2 (which it cites rather than restates, so no discrepancy is possible), Corollary 8 against Corollary 2.3.19.

**Arithmetic inside the proofs.** The exact sequence in Lemma 3.2.7 is consistent with `L^{gq}_1(ℤ) = L^q_1(ℤ) = 0` and `L^{gs}_1(ℤ) = ℤ/2`, and the vanishing of `C_{−2}` with `L^s_{−1}(ℤ) = Pic(ℤ)/2 = 0`. In Example 2.3.13 the cokernel of `(0,8)` has order 16 and `L^s_0(ℤ^∧_2)` has order `32/2 = 16`, so `L^q_{−1}(ℤ) = 0` as stated, and the splitting element `⟨−1,2⟩` does have order 2 (its double has rank 4, discriminant 1, Hasse invariant `−1`, hence is hyperbolic). In Theorem 3.2.13 the index-2 inclusion of `π₃` of the homotopy orbits into `GW^{−gs}_3(ℤ) = ℤ/48`, with cokernel `L^{−gs}_3(ℤ) = ℤ/2`, does give `ℤ/24`. The citation of Example 2.3.13 inside Proposition 3.1.14 is legitimate: the example ends by stating the 2-inverted equivalence `L^{gs}(ℤ)[1/2] ≃ L^s(ℤ)[1/2]` and by saying it will be used there.

## Gaps

Seven, recorded in `gaps`. Three matter for planning:

- **Characteristic 2 global fields.** Theorem 3.1.7 is for number fields; Remark 3.1.8 covers global fields of characteristic `≠ 2` by citing [BKSØ15]. Characteristic 2 is open beyond the perfect-field case of Remark 3.1.6, even though Corollary 2.3.4 computes the symmetric L-groups there.
- **The Grothendieck–Witt groups of a general number ring are not computed.** Remark 3.2.14 reduces the 2-local part to `𝒪[1/2]` where [KRØ20] applies and splits the odd part, but says "in principle one can then use" and produces no table. This is the natural next target and the reason route 3 asks for the dyadic local theory as a layer sequence.
- **Papers [IV] and [V] are in preparation.** Remark 3.1.5 and, seriously, Proposition 3.1.14 use multiplicative structures on L-theory from Paper [IV]; Proposition 3.1.13 depends on 3.1.14. A blueprint that wants 3.1.13 must prove the multiplicativity itself or wait.

The others: the optimal hypotheses for Theorem 3.1.7 are not determined (Remark 3.1.10 says so outright); the homological-stability proof of Corollary 8 is "not known to carry over to the symmetric case" (Remark 2.3.20), so the symmetric half needs the full apparatus; the cyclicity of the odd torsion beyond degree 19998 is conditional on Kummer–Vandiver; and Proposition 3.1.13 gives an obstruction to the homotopy limit problem for *classical* Grothendieck–Witt theory, not a characterisation of the rings that satisfy it — Example 1.3.11 shows the obstruction bites.

## Prerequisites the atlas does not cover

Sixteen, in `prerequisites`. The unavoidable ones are **Papers [I] and [II]** of the series (Poincaré ∞-categories; the fibre sequence, Karoubi periodicity and the Poincaré–Verdier criterion), **Hebestreit–Steimle** (without which nothing about spectra says anything about classical forms), **Ranicki** (L-groups of short complexes, normal L-theory), **Wall** (lifting isometries, the injectivity half of rigidity), **Quillen** and **Weibel** (the K-groups of finite fields and of ℤ), **Milnor–Husemoller** and **Lam** (Witt groups of number rings and of 2-adic fields — Examples 2.3.13 and 2.3.14 and the finding `E4` all turn on `|W(ℚ₂)| = 32` and its ideal structure), **Berrick–Karoubi** and **[BKSØ15]**, **Clausen–Mathew** and **Clausen–Mathew–Morrow**, **Schlichting** (topological variants, and the independently announced calculation [Sch19] with erratum [Sch24] that the atlas should compare against), **Baues**/form parameters, **Serre**, and **Friedlander**/**Fiedorowicz–Priddy** with the correction noted above. The in-preparation **Paper [IV]** is listed because it is load-bearing.

## Validation and its limits

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-CALMES-ETAL-26.result.json` → `ok`. All `uses` references resolve to items of this extraction (checked on every assembly); the 178 missing items are partitioned by the 8 routes, each taken exactly once.

Not verified: the published version was not obtained, so identity with the final typeset Annals text is not certified, and earlier arXiv versions were not diffed against v4 — both are stated in every finding's `searched` field. The proofs quoted from Papers [I] and [II] were not checked. The computations quoted from [Fri76]/[FP78], [BK05], [KRØ20], [Lam05] and [Wei13] were not re-proved, only cross-checked for internal consistency as described above. The L-groups of the Eisenstein integers in degrees other than 0 were not independently recomputed.
