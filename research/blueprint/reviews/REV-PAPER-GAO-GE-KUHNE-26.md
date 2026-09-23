# Review of PAPER-GAO-GE-KUHNE-26

**Job** REV-PAPER-GAO-GE-KUHNE-26 (issue #1439) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: accept**, with one correction in place. All six routes accepted; all
thirteen `sourceIssues` confirmed; nothing rejected or deleted.

Paper: Ziyang Gao, Tangli Ge and Lars Kühne, *The Uniform Mordell–Lang Conjecture*,
[Publ. Math. IHÉS **143** (2026), 189–235](https://doi.org/10.5802/pmihes.26) (CC BY 4.0), read in
the version of record, whose hash reproduces as
`4ee5a38b327807289885a1d7292bddc3341b7fc3e0aa8a3682d995d13237834f`.

## Reading the source

The journal PDF keeps its font dictionaries inside object streams, so a direct extraction resolves
none of the mathematical symbols: every relation comes out as a replacement character, and `<`
cannot be told from `≤`. I expanded the object streams, recovered the `/ToUnicode` and
`/Differences` maps and re-extracted; the text below is from that clean extraction, and the printed
pagination is the PDF page plus 188. This matters for two findings — E3 and E13 both turn on a
strict inequality, and both are indeed printed with `<`.

## Structure

93 items: 74 missing, 15 planned, 4 library before this review. Every missing item is routed exactly
once, no source route takes a planned or library item, and `scripts/check_paper.py` passes.

All eight stage ids exist (`HeightsRationalPointsAndObstructions` RP.0 and RP.5,
`AbelianSchemesAndArithmeticModuli` A2 and A5, `AlgebraicModuliForArithmeticGeometry` R09.1 and
R09.2, `SchemeAndStackFoundations` SF.0 and SF.5), and so do all fifteen planned layer ids,
including the ones outside the routed roadmaps: `ArakelovGeometryAndAbelianHeights` R35.3–R35.5 for
the Faltings height, its isogeny variation and the moduli comparison, `PELModuli` M5–M6 for the
universal abelian variety with level-4 structure, and `ShimuraCompactifications` C5 for the
compactification the Hilbert-scheme heights use. I read those layer descriptions: each plans what it
is sent.

**Coverage.** The 35 numbered environments I could extract mechanically all appear in items, as do
the unnumbered constructions the proof turns on — the restricted Hilbert scheme
`H°_{r,d}(𝔄_g/𝔸_g)`, the difference map `D`, the Ueno locus and the (Hyp pack) hypothesis.

**Locators.** Of 60 name-and-page checks, 55 land on exactly the page given; the five others are
statements whose proofs span pages (Lemma 2.4 stated p.196 and finished p.197, Lemma 4.3 stated
p.207 and applied p.208, Proposition 4.4 stated p.208 and finished p.209, Proposition 5.2 stated
p.212 and finished pp.217–218). None is an error.

## The two Part II routes

Both titles reproduce their parent's atlas title exactly — `AbelianSchemesAndArithmeticModuli` is
titled "Abelian Schemes And Arithmetic Moduli" in `data/atlas.json`, capitals and all, and
`HeightsRationalPointsAndObstructions` is "Heights, rational points and obstructions" — both areas
are galaxy ids, and the briefs are 327 and 423 words that state the theorems as the paper does and
name their imports layer by layer.

**Betti maps.** I searched every layer description in the atlas for the Betti map, the Betti form and
non-degenerate subvarieties: there is nothing. A5 stops at the complex uniformization of one
polarized family and LD.6 at o-minimal counting, so the theory is genuinely unowned, and it is
general enough to belong under the abelian-schemes parent rather than inside the uniformity Part II.

**Shared ids.** This is the part worth checking rather than assuming, and it holds up:
`PAPER-DIMITROV-GAO-HABEGGER-21` and `PAPER-GAO-HABEGGER-19` route to `AbelianSchemesBettiMapsPartII`
with the same title, and those two together with `PAPER-DEMARCO-KRIEGER-YE-20` and
`PAPER-DEMARCO-MAVRAKI-YE-26` route to `HeightsRationalPointsAndObstructionsPartII` with the same
title as here. `PAPER-YUAN-26` routes to that id under the narrower title "…Part II: uniform
Bogomolov for curves"; the design job should take the broader title, since this paper's Theorem 1.3
contains the number-field curve case, and treat the Yuan brief as binding for its own statements —
which is what this brief already says. A separate Part II of the same parent,
`HeightsRationalPointsPartIIRandomFano` from `PAPER-BROWNING-LEBOUDEC-SAWIN-23`, is a different id
with a different topic and does not collide.

## Correction: the Weil height is planned, not library

Item 55 (the absolute logarithmic Weil height on `ℙ^n(ℚ̄)` and the induced height on `A(ℚ̄)`) was
marked `library` on Mathlib's `Projectivization.logHeight`
(`Mathlib/NumberTheory/Height/Projectivization.lean:51`). That definition is stated for a field with
a `Height.AdmissibleAbsValues` instance, and the only instance in Mathlib at the pin is for number
fields (`Mathlib/NumberTheory/Height/NumberField.lean:78`); `ℚ̄` has none, and the height on an
abelian variety is not there at all. RP.0 plans exactly this — "import normalized absolute heights,
product formula and Northcott", with the acceptance condition "test independence of projective
coordinates and field extension", and the comparison of Néron–Tate and local heights — so the item is
now `planned` there, with the Mathlib declaration kept in the note as the supplier RP.0 will import.

The other three library items stand: `TauCeti.AlgebraicGeometry.AbelianVariety`
(`AbelianVariety/Basic.lean:94`) is literally "a proper geometrically integral group scheme over
`Spec K`", and `InvertibleSheaf` and `IsIsogeny` exist as cited. Their notes are candid about what is
not there yet (the Picard-group and translation API, the degree of an isogeny), which is the right
way to record a partial supplier.

## The thirteen findings

All are printed as quoted and all are confirmed. The ones that needed more than reading:

- **E2.** Lemma 2.4 reads `deg_L(Y + Y′) ≤ 4^{dim Y + dim Y′} deg_L Y · deg_L Y′`, so for `Y = X`,
  `Y′ = −X` it gives `16^r (deg_L X)²`, not the printed `8^r (deg_L X)²`; the displayed `8^{2kr}`
  and `8^{(g+1)²r}` scale the same way, and Lemma 2.5's `≪_g` conclusion survives.
- **E3.** Printed strictly: "deg_L(X′) < deg_{𝓛|A}(X′) because of 8c₁(L) = c₁(𝓛|A)". Since
  `deg_{𝓛|A} = 8^{dim}·deg_L` componentwise, the two agree on 0-dimensional components, so only `≤`
  holds.
- **E4.** The same page records `u*(L ⊗ [−1]*L) ≅ (L₀ ⊗ [−1]*L₀)^{⊗(l/g!)²}`, so a component of
  dimension `k ≤ r−1` has `u*L`-degree `(l/g!)^{2k}` times its `L₀`-degree; the bound inherited from
  Proposition 4.4 therefore needs the factor `(l/g!)^{2(r−1)}`, which still depends only on
  `g, l, r, d`.
- **E6** and **E7.** `D` is defined on `X^{[m(M+2)]}` and lands in `m(M+1)` coordinates, so the outer
  sum must run to `M+1` — which is also what the following bound `4m(M+1)c″₃` counts; and Lemma 4.3
  produces `c(M, dim X, deg_L X, deg_{L^{⊠M}}Z)` for `Z ⊊ X^M`, so at `Z_s ⊊ X_s^{m(M+2)}` the
  degree is with respect to `L_s^{⊠m(M+2)}`. The printed `L_s^{⊠m}` is the earlier application's
  subscript, on p.206, where `M = m` is right.
- **E8.** The claim on p.219 puts each small point in (6.2) or (6.3), whose exceptional loci have
  degrees `< c′₂` and `< c″₂`; a union of the two has degree up to the sum, so `c₂ := c′₂ + c″₂`.
- **E9** and **E10.** (Hyp pack) on p.220 bounds the count by `c₀^{rkΓ+1}`, not `c₀`, and uses the
  threshold `c₀^{−1}max{1, h_Fal(A)}`; so (7.4)–(7.6) and (A.12) carry `c₀^{rkΓ+1}`, and the
  constant on p.223 must be `max{c₁^{−1}, c₃}`, since `c₀ = max{c₁, c₃}` fails the requirement
  `c₀ ≥ c₁^{−1}` whenever `c₁ < 1`.
- **E11.** Not being in case (i) gives `#X°∩Γ > N″(8c₈+1)^{rkΓ} + c₁₀^{rkΓ+1}`, and (A.11) removes
  at most `c₁₀^{rkΓ+1}` points, so `#Ξ > N″(8c₈+1)^{rkΓ}` — which is what the covering by
  `(8c₈+1)^{rkΓ}` balls on the next line needs.
- **E12, the one gap.** The §8 induction applies Proposition 5.1 and the induction hypothesis to the
  components of `X′`. Both require the subvariety to generate the ambient abelian variety, and a
  component generates only `B_i = ⟨X_i − X_i⟩`, inside which it sits as a translate; the Néron–Tate
  height is not translation invariant and Proposition 5.1's constants depend on the ambient degree.
  The recorded repair is sound — pass to `X_i − P₁ ⊆ B_i` for a point `P₁` of small height, bound
  `deg B_i` by Lemma 2.5, use `ĥ(P − P₁) ≤ 2ĥ(P) + 2ĥ(P₁)`, and take the constants as min/max over
  the bounded ranges, as in the proof of Theorem 1.2 — so Theorem 1.3 stands and the defect is in the
  written induction.
- **E13.** Proposition A.3(ii) prints `deg X′ < (deg_L X)^{2 dim X}`, while Step 1 on p.230 states
  the claim non-strictly and bounds `X′` by at most `(deg_L X)^{2r}` components each of degree at
  most `(deg_L X)^{2r}`, which yields only `≤`.

E1 and E5 are plain constant-name slips (`c₃` twice in Theorem 1.3 where (1.4) uses `c₄`; `c′₃` for
`c″₃` in Proposition 5.2), both printed as quoted.

## What this review did not do

I did not re-read all 47 pages line by line: I read §§1–2, 4.3, 5.2, 6–8 and Appendix A.5 around the
findings, the statements of every result the routes cite, and the definitions the findings turn on. I
add no finding of my own. The version of record is what was read, so no version boundary arises; the
extraction records none either.
