# Review of PAPER-WOOD-19

**Job** REV-PAPER-WOOD-19 (issue #1331) · **Date** 23 September 2026 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All ten routes accepted; all ten `sourceIssues` confirmed; no
correction needed.

Paper: Melanie Matchett Wood, *Nonabelian Cohen–Lenstra moments*, with an appendix by Philip Matchett
Wood, [Duke Math. J. **168** (2019), 377–427](https://doi.org/10.1215/00127094-2018-0037).

## Source

The recorded hash of the NSF PAR copy of the published article reproduces byte for byte:
`154e700c1b634b9e9bde4334a19678d05ff98ca18efb6b07cb5b809f2da9c03d`, 52 pages with the last blank,
printed pages 378–428 over PDF pages 1–51. I re-extracted the whole file and read every page the
findings touch.

Wood's companion note *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland*, which
`E9` and `E10` are about, I fetched independently from the author's page
(`people.math.harvard.edu/~mmwood/Publications/lifting.pdf`, 13 pages,
`9628210e96313805ceac89594c64e2eceb3aaebf044f617cee4d7f25ee7ef673`) and read at both locators.

## Structure

344 items: 318 missing, 13 planned, 13 library. Ten routes — eight source, two Part II.

Every missing item is routed exactly once, all eight source stage ids exist, all 13 planned ids
resolve, and `check_paper.py` passes. Both Part II parents exist and both titles reproduce them
exactly:

| roadmap id | parent atlas title | area |
| --- | --- | --- |
| `InductionRestrictionPartIIReducedSchur` | Induction, restriction, and Mackey theory for finite groups | `grouptheory` |
| `ArithmeticDirichletSeriesPartIIHigherPoleTauberian` | Arithmetic Dirichlet series and Tauberian methods | `analytic` |

Both areas are galaxy ids. Route 10's reason is checkable and correct: the parent's Layer 9 specifies
a simple pole and shifted-abscissa variants, while the Delange input the paper needs is a
higher-pole Tauberian statement.

**Library.** All 31 declarations behind the 13 library items resolve — Mathlib's
`RegularWreathProduct` with `rightHom` and `inl`, `groupHomology.H2` with `H2π` and `H2Iso`,
`Subgroup.goursat` with `goursat_surjective` and `goursatFst_prod_goursatSnd_le`,
`Subgroup.exists_right_complement'_of_coprime`, `NumberField.finite_of_discr_bdd`,
`LinearMap.finrank_range_add_finrank_ker`, `Module.natCard_eq_pow_finrank`, the five-declaration
`Abelianization` API and two topology lemmas, together with Tau Ceti's
`FactorSet.cohomologyClassEquiv` with `nonempty_splitting_iff_cohomologyClass_eq_zero` and the
eight-declaration `ElementaryTwoQuotient` block.

**Two provenance points, neither a correction.** The extraction records no `libraryPins`, so there is
no commit against which those 31 declarations were checked; I verified them against the index this
lane uses and they are all there, but I have not invented a pin the extraction did not use.
(`PAPER-BHATT-MATHEW-23` has the same gap, reported in its review today.) And the item locators are
in arXiv v2 pagination by design — the `source.version` field says so, and 103 items carry an
additional `publishedLocator` — while all ten findings carry both paginations, which is what I
checked them in.

**Locators.** Of 39 name-and-page checks against the published text, 33 land exactly. The six others
are right as well: Definition 3.12 is unnumbered in the running text of p. 393 and is only named when
Theorem 3.13 cites it, and Theorem 4.8's proof spans pp. 408–410 while its statement is on
pp. 406–407, which is where E5 and E6 point. No locator error.

## The ten findings

All confirmed. Six are verbatim in the published text.

**E4** (p. 407). The displayed limit in the proof of Theorem 1.2 sums
`Ẽ^±_{F_q(t),q^n}(G,G′)`, where Theorem 4.8 sums over `IQ_{=q^{2n}}` and `RQ_{=q^{2n}}` and Theorem
1.2 is stated at `q^{2n}`.

**E5** (p. 409) has three parts and the paper corrects itself one line later. The step prints

    Σ_{Σn_i = 2n−1} #CHur^{c,(1,1,σ)}_{G,n}(F_q) ≥ Σ_{n∈C} |H₂(G,c)[q−1]| (q^n + O_n(q^{n−1/2})),

with subscript `G` where the Hurwitz scheme and the homology are those of `G′`, and with a point
count `q^n + O_n(q^{n−1/2})` where Theorem 4.7 gives `q^{2n−1} + O_n(q^{2n−3/2})` for a component of
dimension `Σn_i = 2n−1`. The next line of the same display writes `q^{2n−1}` and `O_n(q^{2n−3/2})`.

**E6** (p. 409). "these extensions have `Nm Disc(M) = q^{(Σ_i n_i + 1)|G′|/2}` and, thus, associated
quadratic extension with discriminant norm `q^{Σ_i n_i + 1}`" — in the **real** case, where the
infinity type is trivial and the place at infinity is unramified. The paper's own convention before
Theorem 4.8 is `Σn_i = 2n − ε` with `ε = 0` there, and the count that follows is over `RQ_{=q^{2n}}`.

**E7** (p. 411). Conjecture 5.1 takes `u ∈ μ_{Q(μ_{4|G̃′_c|})}` with no requirement that `u`
generate, and Lemma 3.11 (p. 393) reads `I_{F,φ,K}(ρ, u^α) = I_{F,φ,K}(ρ,u)^α`, so
`u ↦ I(ρ,u)` is a homomorphism and `I(ρ,1) = 1` always. With `u = 1` and `h ≠ 1` the numerator is
empty for every `X`, so the limit is `0` and not `1` whenever `H₂(G′,c)[|μ_Q|] ≠ 1` — and the
paper's own §8.2 table supplies such pairs over `Q`.

**E8** (p. 421). `C₃ × C₃ × C₂` is printed twice for `(C₂ × C₂) ⋊ C₃` with trivial action, which has
order 12 against 18.

**E1** is a gap and it is visible in the proof. Theorem 1.2 (p. 379) prints one `lim` whose third
branch is `≥ w_G n^{N_{G′}−1}`, and the proof of Theorem 4.8 (p. 409) restricts the sum over
multidegrees to the set `C` on which Theorem 4.5(3) applies, discards the remaining components as
nonnegative, concludes with `≥`, and only then divides and lets `q → ∞`. That bounds the liminf;
nothing controls the discarded components uniformly in `q`. The good cases, where the limit is
computed exactly, are untouched.

**E2** (p. 393). "Let `Π` be the tame quotient of `G_{F̄_p(t)}` … Then `Π` is free pro-prime-to-`p`
… (This is possible by Grothendieck's comparison …)". The tame fundamental group of `P¹ ∖ S` in
characteristic `p` is not pro-prime-to-`p`; SGA 1 XIII 2.12 identifies its maximal prime-to-`p`
*quotient* with the prime-to-`p` completion of the topological group. The finding's witness is good:
for `p ≥ 5` the tame fundamental group of `P¹ ∖ {0, 1728, ∞}` surjects onto `PSL₂(F_ℓ)` through the
modular cover `X(ℓ) → X(1)`, with tame indices `2, 3, ℓ`, and `p` divides `|PSL₂(F_ℓ)|` for suitable
`ℓ`. Only prime-to-`p` targets are used, so the grading `affects: nothing` is right.

**E3** (p. 402). Proposition 4.4 says "let `G′` be a subgroup of `G ≀ S₂`", with no admissibility.
The counterexample works: with `G = C₃`, `G′ = ⟨(1,σ)⟩ ≅ C₂`, `c = {(1,σ)}` over `Q`, the right-hand
set contains `Q(√−3)` with its marking while the left-hand set is empty, since being of type `G′`
forces `Gal(L̃/Q) ≅ G′` of order 2 whereas `L/K` is a `C₃`-extension — the projection of
`G′ ∩ (G × G) = 1` is not onto `G`.

**E10** is confirmed from the companion note's own display: the conjugation word in the proof of
Lemma 2.1 ends `… [g_k]^{a_k}` and `… g₁^{a₁}` where the reversed inverse requires `[g₁]^{−a₁}` and
`g₁^{−a₁}`, so as printed the word is not `ỹ[x]ỹ^{−1}`.

### One limit on my check, and one grading remark

**E9.** The proof of Theorem 2.5 (companion note, p. 4) sets `φ(x̂,e_x) = [x]k_x` and defines
`ψ(x̂,e_x) = k_x`, and only `φ·ψ^{−1}` sends the generator to `[x]`; `φ·ψ` sends it to `[x]k_x²`. So
the recorded correction is right about what the map has to be. What I cannot settle from the PDF's
text layer is the glyph: the two symbols and any inverse do not survive extraction. For the presence
of the misprint — as against the mathematics, which I verified — I rely on the recorded reading,
which says the rendered page was checked.

**E7's grading.** The finding makes Conjecture 5.1 false as printed, so `affects: nothing` is
generous. I read the field as saying that no theorem of the paper depends on the conjecture, which is
true, and left it as recorded.

## One observation about the record's form

Several `printed` fields are pointers rather than printed text — `a subgroup`, `tame quotient`,
`q^n`, `φ·ψ` — which makes the entry impossible to check without going back to the page, where
PROTOCOL §18 asks for the printed text. The locators are precise enough that I found every one, so
nothing here is wrong; but filling those fields out would make the register self-contained. This is a
note for the errata worker, not a condition of the review.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-WOOD-19.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-WOOD-19.result.json research/blueprint/papers/PAPER-WOOD-19.review.json

Both pass. No roadmap change, no library claim and no Lean work is proposed by this review.
