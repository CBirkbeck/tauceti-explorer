# Review of PAPER-PILLONI-20

**Job** REV-PAPER-PILLONI-20 (issue #1327) · **Date** 23 September 2026 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All 25 routes accepted; all 175 `sourceIssues` confirmed; one
correction made in place; nothing rejected or deleted.

This completes the checkpoint merged earlier the same day, which had 13 verdicts recorded and the
structural review done. Everything that checkpoint asserted has been re-verified here.

Paper: Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*,
[Duke Math. J. **169** (2020), no. 9, 1647–1807](https://doi.org/10.1215/00127094-2019-0075), read in
the author's version (113 pages, 17 June 2019), whose recorded hash reproduces byte for byte:
`4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58`. The published Duke text is
paywalled and was not compared, as the extraction states. Every locator is a page and statement
number of the author version; that boundary is correct and should stay.

## Structure

550 items (485 missing, 59 planned, 6 library) and 25 routes: 19 source, 5 Part II, 1 new. Every
missing item is routed exactly once. All 19 source stage ids resolve in `data/atlas.json`. Of the 133
planned references, the 123 of `Stage:Layer` form all resolve there; the other 10 use the corpus-wide
`tauceti:TauCetiRoadmap/…#layer-…` form, whose targets live in the Tau Ceti repository and cannot be
resolved from this one. All five Part II titles reproduce their parents' atlas titles exactly, all
six route areas are galaxy ids, and the new roadmap id `GSp4NonregularModularityLifting` is free.

Every claimed join checks out against the corpus: `SiegelModularFormsModPn` and
`GSp4NonregularModularityLifting` against `PAPER-CALEGARI-GERAGHTY-20`,
`IntegralCoherentHeckeComplexes` against `PAPER-CALEGARI-GERAGHTY-18`,
`ShimuraVarietiesHondaTatePartII` against `PAPER-KISIN-MADAPUSIPERA-SHIN-22` and eight others,
`ShimuraCompactificationsPartIIHodgeTypeIntegralBoundary` against `PAPER-FARB-KISIN-WOLFSON-24`. Route
1's claim to be *this paper's own* proposal rather than a join is right too:
`PAPER-BOXER-CALEGARI-GEE-PILLONI-21`, `-25` and `PAPER-BOXER-PILLONI-26` all carry the identical id,
parent, title and area, and each names `PAPER-PILLONI-20` as the proposal it joins.

**One correction made in place.** The extraction recorded no `libraryPins`, though all 43
declarations behind its six library items resolve at the standing pins. I added them — Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` — and
re-checked all 43 against the declaration index at those commits. Nothing else needed correcting.

## The 175 findings

All confirmed: 11 errors, 21 gaps, 143 misprints. For each I located the quoted text on the page its
locator names and checked the correction against the paper's own conventions. Where the correction is
a computation I redid it. Several are decided by internal evidence the extraction did not cite; those
are the ones worth recording here.

**Decided by the paper contradicting itself.**

- **E30.** Page 24 gives `λ = (1 − k + r, 2 − r; k + 2r)`; the proof of Theorem 5.3.1 on the very next
  page gives the same condition as `λ = (1 − k − r, …)`, and Remark 5.3.1 agrees with the minus. Two
  against one, and the conventions fixed just above the offending display give the minus.
- **E67.** The resolution displayed at the head of the proof of Lemma 8.2.1 uses `Ω^(k,r+(p−1)n)` and
  so does the complex derived from it three lines later, but the two sentences in between print
  `(p²−1)n`. Since `Ha ∈ H⁰(X₁, ω^{p−1})`, the exponent in the middle is the wrong one.
- **E39.** Theorem 6.1.5.1(1) lists the strata in the order Γ, Γ_par, Γ_Kli(p) and the very next
  sentence lists them in the order Γ, Γ_Kli(p), Γ_par; every other `resp.` list in the point uses the
  second order.
- **E141.** Proposition 14.9.1 is stated for all `i`, but §14.9.1 says "We will only give a full proof
  … for classes at Klingen level", proves Lemma 14.9.2 only for `i = 0, 1`, and then writes "Let
  `i ∈ {0,1}`" before the eigenclass argument. The same proof assumes `v(λ) < 0` and derives `f = 0`,
  which gives valuation `≥ 0`, not the "positive" the proposition claims (E139).

**Decided by computation.**

- **E119** is the sharpest. The bottom arrow of the BGG equivariance diagram is labelled `p^{−k−1}U`.
  Corollary 13.3.3.1 concludes classicity on slopes `< k − 2`, and in degree 0 on slopes `< k + 1`;
  those come from Proposition 13.3.1.1's bounds `≥ −3` and `≥ 0` on the third term of the triangle.
  With `p^{k+1}U` the bounds are `−3 + (k+1) = k − 2` and `0 + (k+1) = k + 1`, exactly what the
  corollary states; with the printed exponent they would be `−k − 4` and `−k − 1`, which would make
  the criterion useless. The sign of the exponent is wrong and the corollary is right.
- **E77.** Writing the Serre–Tate parameter as a matrix and the commutativity as `α ∘ q = q′ ∘ β`,
  with `β = diag(p², p)` the left vertical of the p. 61 diagram and `α = diag(1, p)` the right, the
  `(1,1)` entry gives `1 + X = (1 + X′)^{p²}` and the `(2,1)` entry gives `1 + Z = (1 + Z′)^p`. Running
  the same computation on the paper's own analogue on p. 39, where `β = diag(p,p)`, reproduces the
  relations printed there. So the two exponents on p. 60 are interchanged and the diagram is right.
- **E49.** Reading the columns of the printed Frobenius matrix as images gives `Fe₁ = pe₁`,
  `Fe₂ = pe₃`, `Fe₃ = e₂`, `Fe₄ = e₄` — the only reading producing the printed `Ker F = ⟨ē₁,ē₂⟩` and
  the printed 2×2 matrix. A principal quasi-polarization needs `⟨Fx,Fy⟩ = p σ⟨x,y⟩`, and with the `J`
  of §5.1 the pair `e₂, e₃` gives `⟨pe₃,e₂⟩ = −p` against the required `+p`. Changing the `(3,2)`
  entry to `−p` repairs it and changes nothing else; I recomputed the isotropy condition as `Z − X = 0`,
  in agreement with the printed `X = Z`.
- **E8.** `∏_I R` is already `m_R`-adically complete for finitely generated `m_R`, and
  `M/m_R M ≅ ⊕_I R/m_R` has a basis indexed by `I` while `∏_I R/m_R` does not, so the printed
  isomorphism is false for infinite `I`; the intended completed direct sum is what the proof itself
  describes two paragraphs later.
- **E15.** With the paper's own conventions the printed sequence satisfies
  `π_α(s_{α+1}) = s_α + 2c·dw_α`, so it is not compatible and defines nothing in the limit; the
  finding's two-term counterexample works, and the minus sign repairs the lemma.
- **E96.** With `c` invertible the relation `ad − bc = 0` does give `HT(e₂) = (a/c)HT(e₃)` as printed,
  and for that very reason `Fil^can` is generated by `HT(e₃)`, not by `HT(e₂)`; the complement is right
  as printed, since `det(HT(e₃),HT(e₄)) = cf − de` is the unit just assumed.
- **E107.** Conditions 1–3 constrain only `M^{≤h}`, so condition 4 carries the whole burden. As
  printed it does not: for `h ≥ 0`, `M` finite dimensional with `U = id`, the decomposition
  `0 ⊕ M` satisfies all four conditions although the true one is `M ⊕ 0`. Urban's form rules that out
  at once.
- **E72.** Every subgroup of `G[p]` is totally isotropic in `G[p²]`, since
  `e_{p²}(pх̃,y) = e_{p²}(х̃,py) = 1`; so an `L ⊂ G[p]` of order `p³` complementary to `H₁` satisfies
  all three printed conditions and is not what is meant. Lemma 10.1.1 and footnote 16 both give order
  `p⁴`.

**Earlier verdicts, carried forward.** E20 (two of the four declared positive roots have a negative
`α₁`-coefficient, so `{α₁,α₂}` is not a base), E24 (`diag(a,b,c,d) ∈ GSp₄` iff `ad = bc`, so the
printed `αβ = γδ` should be `αδ = βγ`) and E27 (self-duality forces `m = λ₁+λ₂`, the opposite of the
printed sign) were verified by computation in the checkpoint and stand.

**Bibliography.** All ten bibliographic findings (E166–E175) are confirmed. I checked the reference
numbering independently by counting the entries from the head of the list: Arthur `[1]`, Bartenwerfer
`[2]`, Bosch–Lütkebohmert `[7]`, Buzzard–Gee `[10]`, Conrad `[15]`, Faltings–Chai `[18]`,
Fujiwara–Kato `[19]`, Gan–Takeda `[24]`, Genestier–Tilouine `[25]`, Godement `[26]`, Hartshorne `[32]`,
KKMS `[40]`, Knudsen–Mumford `[43]`, Lütkebohmert `[52]`, Scholze `[69]`, `[70]`, `[71]`. Each matches
an unambiguous in-text use, which is what makes E22 decidable: the four citations of "prop. 3.2.3" and
"coro. 3.2.2" point at Gan–Takeda, which numbers its results at one level per section and has neither,
while the Klingen-level eigenvalue statements are Genestier–Tilouine's.

## Method, and what it rests on

Six findings were recorded in the checkpoint as image-only. Teaching the local text extractor the TeX
OML, OMS, OT1 and MSBM font encodings made Greek letters, arrows and relation symbols legible in the
text layer, and all six then checked directly: E56, E62, E92, E95, E121 and E133. That also settled
E60 (the arrow really is labelled `ψ⊗1`), E110 (a Greek omega where the text uses italic `w`) and
E160 (exactly one blackboard-bold `𝔾_ℚ` against four roman `G_ℚ`).

Three findings still rest on the extraction's renders rather than on my own reading, and each verdict
says so: the `K_p` versus `K^p` subscripts of **E34**, the citation string "chap. 23, thm. 2.3.1" of
**E76**, and the spelling "Narashiman" of **E174**. In each the surrounding argument is decisive
whichever glyph is printed.

## Overlaps, and two unreported slips

Several findings are recorded twice, once alone and once inside a bundle: E83 is the first item of
E81; E137 and E138 are the misprint halves of E134 and E135; E93 and E95 are items of E89; E172 and
E175 are items of E168; E166 shares its entry with E170, and E171 with E169; E54 and E55 share the
p. 43 slip; E35 and E37 share the p. 28 base; E114 is noted in passing inside E116; E121 and E123 are
the notational and mathematical halves of one display; E139 is the "positive valuation" half of E141.
None contradicts another. I confirmed each on its own terms and cross-referenced them in the verdicts
rather than deleting any, since each is correct and the bundles carry context the singletons do not.

Two slips are printed and no finding records them: **"Morover"** for "Moreover" on p. 92, and
**"π_∞ *in* an irreducible"** for "is an irreducible" in Theorem 15.2.2.1(2) on p. 108. Both are
typographical; I leave them for a later pass rather than manufacture findings.

## What this review did not do

I did not read all 113 pages line by line. I read the pages every finding names, the statements the
routes cite, and the surrounding sections needed to judge them. I did not compare the published Duke
text, so no finding here has been checked against the version of record. I add no finding of my own.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-PILLONI-20.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-PILLONI-20.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-PILLONI-20.review.json

All pass. No roadmap change, no library claim and no Lean work is proposed.
