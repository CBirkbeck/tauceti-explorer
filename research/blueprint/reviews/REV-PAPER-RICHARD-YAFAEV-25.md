# Review of PAPER-RICHARD-YAFAEV-25

**Job** REV-PAPER-RICHARD-YAFAEV-25 (issue #1443) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: accept**, with one small correction in place. All four routes accepted; all
six `sourceIssues` confirmed; nothing rejected or deleted.

Paper: Rodolphe Richard and Andrei Yafaev, *Generalised André–Pink–Zannier conjecture for Shimura
varieties of Abelian type*,
[Publ. Math. IHÉS **141** (2025), 249–331](https://doi.org/10.1007/s10240-025-00154-4)
(open access), whose recorded hash reproduces as
`3f3af58def7bb398b3d365ecf828a6571a9477fd7f2b7b891706f146fec05b9e`. I re-extracted all 83 pages and
mapped the printed pages 249–331 from the running heads, since the file puts the title page last.

## Structure

41 items: 39 missing, 1 planned, 1 library. Every missing item is routed exactly once, all three
source stage ids exist, both planned layer ids (`ReductiveGroupsPartII` RG2.3 and RG2.4) exist, the
library citation `mathlib:Subgroup.goursat` is at `Mathlib/GroupTheory/Goursat.lean:128`, and
`scripts/check_paper.py` passes.

**Coverage.** Of the 94 numbered environments I could extract, every definition, proposition, lemma,
corollary and theorem is carried into an item, individually or inside a cited range — Proposition
4.2 in item 9, Corollary 4.10 in item 15, Corollaries 5.17 and 5.19 in item 26, Lemma 7.7 and
Corollary 7.8 in item 34, Proposition 7.14 in item 35, Proposition B.7 and Lemma B.8 in item 41. The
only things not carried are three remarks (4.4, 5.4, 7.6), which state no separate result, and the
Stacks-project numbers the paper cites.

**Locators.** 57 of 63 name-and-page checks land on exactly the page given, and I read the other six
rather than assuming: the proof of Theorem 4.7 in the number-field case runs from p.261 ("Proof of
Th. 4.7 if K is a number field") through p.263, where E1 sits; Proposition 4.8 is stated on p.263 and
proved on pp.264–265; and Remark 2.1.3 is printed in the paper's own section style, "2.1.3.
Remarks.", on p.253 exactly as item 7 says.

## Correction: 7.8 is a corollary

Item 34 was named "Lemmas 7.6–7.12" with locator "Lemmas 7.6–7.8, 7.10–7.12". In the paper 7.8 is
printed as **Corollary 7.8** ("We deduce (78) from Corollary 7.8 below"), and 7.9 is Proposition 7.9,
which item 32 already covers. The name and locator now write the range out. Every other item in this
extraction distinguishes lemmas from corollaries carefully — items 33, 36, 37, 39 and 41 all do — so
this was a lone slip.

## Routes

The Part II title reproduces the parent's atlas title, "Complex Shimura varieties and canonical
models", exactly; the area `arithmeticgeometry` is a galaxy id; the brief is 246 words. The id
`HeckeOrbitsAndAndrePinkZannier` appears in no other extraction, and I found no layer or pending
Part II covering Hecke-orbit geometry, Galois bounds from a uniform integral Tate hypothesis, or
p-adic geometric invariant theory, so the proposal duplicates nothing. The three source routes send
out exactly what belongs elsewhere: the uniform integral refinement of Faltings' isogeny theorem to
R28.4, Serre's ℓ-independence and Noot's specialisation to R01.6, and the EGA flatness and
integrality criteria of Propositions 7.13–7.15 to SF.0, while the p-adic GIT that consumes them stays
in the Part II.

## The six findings

**E6 is the one that matters, and it is real.** Lemma 5.12 (p.285) asserts that for a bounded-index
`U′ ≤ U`,

    Z_{M^ad}(ad_M(U′)) = Z_M(U′)/Z(M).

Its proof (pp.286–287) takes `m ∈ M(F̄_p)` whose image `ad_M(m)` centralises `ad_M(U)` — the image
of the **whole** group — shows that `φ_m : u ↦ mum⁻¹u⁻¹` is a homomorphism `U → F(F̄_p)` with
`#F | e`, and concludes `φ_m(U[e]) = {1}`, i.e. `m ∈ Z_M(U[e])`. With `U′ = U[e]` that establishes

    Z_{M^ad}(ad_M(U)) ⊆ Z_M(U[e])/Z(M),

and since `ad_M(U[e]) ⊆ ad_M(U)`, the centraliser on the left of the asserted equality is the
*larger* one, so the equality does not follow. The repair recorded — keep the inclusion — matches the
use I read at the top of p.285, where Lemma 5.11 needs only that a centraliser of an image is
trivial.

The five misprints are each printed as quoted:

- **E1**, p.263: "when `ℓ > max{M_A; M(A, K, d)}`" uses the constant that this very proof is
  defining; the Masser–Wüstholz constant `M′(A, K, d)`, introduced on p.261, is what the step needs.
- **E2**, p.259: "Let `U′ ≤ U(p)` be of index `[U′ : U(p)] ≤ D`" has the index the wrong way round.
- **E3**, p.273: "its inverse image in `U_p` by `U_p† := π_p⁻¹(U_p)`", where `π_p` is defined *on*
  `U_p`; the inverse image meant is `π_p⁻¹(U(p)†)`.
- **E4**, p.280: "as soon as `H_p(φ) ∉ {1; p}`" where Corollary 5.8 hypothesises `H_{v′}(φ) ∉ {1;p}`,
  and the chain ends `≥ H_p(φ)^{1/(2·c(ρ))}` where the corollary states `H_p(φ)^{c(ρ)/2}` — which is
  what (37), `H_{v′} ≥ H_p^{c(ρ)}`, gives on taking square roots; the same page writes `H_Y` with
  `Y_k` where Proposition 5.5 produces `Y₁,…,Y_l`.
- **E5**, p.275: "`f := supp Z(M^der)(F̄_p) < +∞`", where `f` is used as `f!` to kill the central
  part, so it is `sup_p #Z(M^der)(F̄_p)`.

## What this review did not do

I read §§2, 4, 5 and 7 around the findings and the statements of every result the routes cite, not
all 83 pages line by line. I add no finding of my own. The article is open access and is the version
of record, so no version boundary arises.
