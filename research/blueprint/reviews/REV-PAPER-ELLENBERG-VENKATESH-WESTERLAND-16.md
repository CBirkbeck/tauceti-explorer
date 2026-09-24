# Review of PAPER-ELLENBERG-VENKATESH-WESTERLAND-16

**Job** REV-PAPER-ELLENBERG-VENKATESH-WESTERLAND-16 (issue #1185) · **Date** 24 September 2026 ·
Claude Code, session `cc-7b31c4` · **Verdict: accept.** All 3 routes accepted; all 19 `sourceIssues`
confirmed; twelve corrections made in place; nothing rejected, nothing deleted, no finding added.

Paper: Jordan S. Ellenberg, Akshay Venkatesh and Craig Westerland, *Homological stability for Hurwitz
spaces and the Cohen–Lenstra conjecture over function fields*,
[Annals of Mathematics **183** (2016), no. 3, 729–786](https://doi.org/10.4007/annals.2016.183.3.1),
read in the published PDF. Its recorded hash reproduces byte for byte:
`6c10d770348c625ad9fe80d2c47093cde2a2ba05f39a28d547743f0f4993a7f6` (759 582 bytes, 58 pages).

Extraction by Claude Code, session `cc-442dc5` (issue #1184), with a Codex `codex-c83e7a`
continuation; a different session from this one, as the job requires.

## Reading the source

The Annals PDF is encrypted (standard security handler, RC4, empty user password) and carries no
`ToUnicode` maps, so nothing reads it out of the box. I decrypted it and decoded the text from the TeX
font encodings, then built a page map from the running heads and a statement index of all 33 numbered
statements with their printed pages. Every locator below was read in that text at the page its finding
names. Two displays have no recoverable text layer at all and were read off the raw glyph stream
instead, with the font and character code of each token: the probability display on p. 730 (**E13**)
and the scalar of (6.1.6) on p. 763 (**E5**).

The two supporting sources were re-downloaded and both recorded hashes reproduce byte for byte:
Achter–Pries, *The integral monodromy of hyperelliptic and trielliptic curves*, author-hosted final
PDF, `ef86bd41e5b4d61d199f363985732b4965b59ce8cb180040b86ab99118a6b080` (249 280 bytes, 20 pages), and
Vasiu, *Surjectivity criteria for p-adic representations. I*, arXiv:math/0209237v2,
`b7389a31ceb4593c069bf537635b49f262380d60b764a117e29662daafd252f2` (322 109 bytes, 28 pages). Both are ordinary
unencrypted PDFs without `ToUnicode` maps; I decoded them through each font's `/Differences`
encoding. Achter–Pries reference **[29] is Vasiu**, *Manuscripta Math.* **112** (2003), 325–355 —
that is, the very source the extraction records as a prerequisite, which is what makes E15 checkable.

## Structure

137 items — 122 missing, 8 planned, 7 library — and 3 routes: 1 Part II, 2 source. Every missing item
is routed exactly once.

**Library.** All 15 cited declarations resolve at the pinned Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`,
each with the kind its item needs: `AlgebraicTopology.singularChainComplexFunctor` and
`singularHomologyFunctor`, `TauCeti.BraidGroup` and `BraidGroup.lift`, `Quandle.Conj` and
`conj_act_eq_conj`, `MonoidAlgebra` and `MonoidAlgebra.lift`, `CategoryTheory.SpectralSequence`,
`SemidirectProduct` with `inl`/`inr`/`rightHom`, `Matrix.symplecticGroup` and `SymplecticGroup.mem_iff`.

**Planned.** All 8 references resolve and the layers they name plan their items. Four are exact
matches: item 85 → `FunctionFieldArithmetic:FA.4`, which plans global reciprocity and the
identification of finite abelian quotients by norm subgroups, which is what Proposition 8.7 uses;
item 91 → `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, which plans the perfect pairing
`H_c^i × H^{2d−i}(d) → E` with Frobenius equivariance; item 92 → `DeligneWeightsAndPurity:DWP.7`,
which plans the weight bound `≤ w+i` on `H^i_c`; item 112 →
`tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-…`, which plans the Cartan–Leray spectral sequence
and says in the same sentence that the coinvariant isomorphism follows **only** when `|G|` is
invertible, which is the item's own hypothesis. Item 111 → AlgebraicTopology Stage 4 (cellular-to-
singular comparison) and items 126/127 → `AlgebraicModuliForArithmeticGeometry:R09.4` and
`InverseGaloisAndArithmeticFundamentalGroups:IG.0` are likewise right.

One observation, not a defect: item 93 is the Grothendieck–Lefschetz point-count formula, planned in
`SchemeAndStackFoundations:SF.2`. SF.2 owns étale cohomology with compact support and says it
integrates the CohomologicalPointCounting suppliers, pinning that roadmap as its source route, but it
does not state the formula itself; `EtaleDualityAndPerverseSheaves:EDC.8` says explicitly that
"ordinary Frobenius point counting is still PR196 TraceFormula's theorem", and
`CohomologicalPointCounting/TraceFormula` (PR196, 8 layers) is registered in the atlas externals. So
the item is planned, but at the integrator rather than at the owner. I left it as it stands because
the item's own statement says to import the trace-formula integration owner rather than build an étale
package here, so the choice is deliberate.

**Routes.** Route 1's Part II title reproduces its parent's atlas title exactly and extends it; its
area `arithmeticgeometry` is one of the 28 galaxy ids in `data/galaxies.json` (it is not one of the
thirteen coarser group ids in `data/atlas.json`, which is a different vocabulary); and the roadmap id
`InverseGaloisPartIIHurwitzHomologicalStability` is free. The stage ids of routes 2 and 3 —
`InverseGaloisAndArithmeticFundamentalGroups:IG.0/IG.1/IG.3/IG.5` and
`ArithmeticStatistics:ST.0/ST.5` — all resolve, and each layer's description plans what is sent to it.
Searching all 1968 stages finds no existing owner for Hurwitz homological stability, which is what
justifies the Part II.

## Twelve corrections made in place

All twelve are locators naming the wrong environment kind, checked against the paper's own numbering.
The paper writes its statement headers number-first ("8.8. Theorem."), which is what the extraction's
reading had inverted.

| where | was | now |
| --- | --- | --- |
| item 39 | Lemma 4.10 | Proposition 4.10 |
| item 43 | Lemma 4.13 | Proposition 4.13 |
| item 44 | Lemma 4.14 | §4.14 (proof of Theorem 4.2), equation (4.14.1) |
| item 51 | §5.5; Proposition 5.4 via 5.6 | §5.5; Lemma 5.4 via Proposition 5.6 |
| items 74, 113 | Proposition 8.2 | Lemma 8.2 |
| items 101, 102, 103, 104, 105 | Proposition 8.9 | Lemma 8.9 |
| finding E12 | end of Proposition 8.9 proof | end of Lemma 8.9 proof |

Item 44 is the one that is not a relabelling: there is no Lemma 4.14 in the paper. §4.14 is the proof
of Theorem 4.2, and the comparison the item states — `H_0(M) = H_0(K(M))` and
`deg H_1(M) ≤ deg H_1(K(M))` — is exactly its equation (4.14.1), established on pp. 754–755.

A clause was also appended to `validation.checker`, whose sentence "No source finding marked
independently reviewed" this review falsifies. Nothing else in the extraction was changed: no item,
status, route or finding was altered.

## The 19 findings

All confirmed: 7 errors, 3 gaps, 9 misprints. Fourteen are in EVW itself, three in Achter–Pries and
two in Vasiu. For each I located the quoted text at its locator and rechecked the correction against
the paper's own conventions; where the reason is a computation I redid it.

**Settled by quoting the paper against itself.**

- **E2** (p. 739). The fibres are listed as `Hom^c(π,G)`, `Sur(π,G)`, `Sur^c(π,G)` "respectively", and
  then described as `c`-tuples, "the elements of `c^n` that generate `G`", "the elements of `G^n` that
  generate `G`" — the last two the wrong way round, since `Sur` carries no `c`-restriction and `Sur^c`
  does.
- **E3** (p. 750). The proof of Lemma 4.6 writes `ker(α) ≅ M ⊗_R R^U` one line before the display
  (4.6.3) writes `R^U ⊗_R M`. `M` is declared a graded **left** module and `R` is noncommutative, so
  the display is right and the sentence is the slip.
- **E10** (p. 779). The generic fibre is identified with `Sur(V,A)`, where Proposition 8.7's own
  `(L,α) ≅ (L,−α)` — used two pages earlier to write `Σ_L m_A(L) = 2|X_n(F_q)|` — gives
  `Sur(V,A)/{±1}`. The orbit count survives because `−I ∈ Sp(V)` lies in the geometric monodromy, but
  that has to be said.
- **E9** and **E14** (p. 777). Theorem 8.8 prints "A an ℓ-group", dropping the "finite abelian" that
  §8.6 fixes as standing; and the deduction of Theorem 1.2 defines `ν_n(A)` from `Cl(O_L) ≃ A` where
  §8.1 makes `L` the set of finite abelian ℓ-groups, so it must be the ℓ-primary part or `ν_n` is not
  a probability measure.
- **E11** (p. 730 against §§8.6–8.8). Theorem 1.2 claims the limit "as `q → ∞` with `q ≢ 1 (mod ℓ)`",
  a domain containing `q = 2^m` and `q = ℓ^m`. §8.6 assumes `ℓ ∤ q`; the parametrization of `S_n` by
  `K(√f)` and (8.7.5) need `q` odd, and in characteristic 2 the whole tame `A ⋊ Z/2` theory of §7 does
  not apply; Theorem 8.8 assumes `ℓ ∤ q(q−1)`. A missing restriction, not a counterexample.

**Settled by computation (each redone here).**

- **E13** (p. 730) is the sharpest of the misprints and the one that needed the glyph stream. The
  tokens are, in order, `1`, CMSY `0x00` (minus), the CMEX `∏` raised to display position, `(1`,
  minus, `3`, superscript minus and `i`, `)`, CMSY `0x18` (`≈`), `0`, `.`, `440`, `⋯` — that is,
  `1 − ∏(1−3^{−i}) ≈ 0.440⋯`, offered as the probability of **indivisibility** by 3. I computed
  `∏_{i≥1}(1−3^{−i}) = 0.560126`, the Cohen–Lenstra mass of the trivial 3-group and so the
  indivisibility probability; `0.439874` is its complement.
- **E5** (p. 763). With `U = Σ_{g∈c} r_g^{D|g|}` and `U_Q = Σ_{g∈c∩Q} r_g^{D|g|}` as the paper defines
  them, every `g ∉ Q` enlarges the global monodromy and so dies modulo the `Q′ ⊋ Q` summand, leaving
  `U ≡ U_Q` with coefficient 1. The printed `(|c|/|c∩Q|)` is 3 for `G = S_3` with `Q` generated by one
  transposition, against the true 1. The induction on `|Q|` is unaffected.
- **E6** (p. 772) is the most substantial. Case (i) of the proof of Lemma 8.4 asserts that the set of
  lifts is "a principal homogeneous space" — in particular nonempty. Enumerating the finding's witness
  `X = A′ = C9 × C3`, `A = C3²`, `π(x,y) = (x mod 3, y)`: there are 48 surjections `X ↠ A`, of which
  exactly **12 lift and 36 do not**, because a lift must send the order-3 generator into
  `π^{-1}(1,0) = {1,4,7}×{0}`, every element of which has order 9. The aggregate inequality (8.4.1)
  survives in this witness — `|Sur(X,A′)| = |Aut(C9×C3)| = 108 ≥ 2·48 = 96` — which is why the finding
  is recorded against the proof and not the statement.
- **E7** (p. 774). §8.5 calls the distributional statement "equivalent" to the moment statement, where
  Proposition 8.3 supplies only one direction. For `ν_n = (1−ℓ^{−n})μ + ℓ^{−n}δ_{(C_ℓ)^n}` the total
  variation distance to `μ` is at most `2ℓ^{−n}`, while the `C_ℓ` moment is
  `(1−ℓ^{−n}) + ℓ^{−n}(ℓ^n−1) → 2`. The finding is careful that this shows the logical gap only, not
  any failure of the number-field conjecture.
- **E8** (p. 777). `q^n − q^{n−1}` counts monic squarefree polynomials only for `n ≥ 2`; all `q` monic
  linear polynomials are squarefree, so `|S_1| = 2q`. Nothing downstream changes.
- **E1** (p. 733). "…both the upper limit `δ⁺` and the lower limit `δ⁻` in Theorem 1.2 are equal to
  1." Those are densities of disjoint events summing to at most 1, and Theorem 1.2 gives
  `c_ℓ/|Aut A|`; Remark 7.9 (p. 769) confirms they are the `lim sup` and `lim inf` in `n` at fixed
  `q`, so no reading makes the sentence true. The intended statement is presumably about the ratio to
  the Cohen–Lenstra mass.
- **E4** (p. 756) and **E12** (p. 782) are the two range slips. `A_q = B_n/L_q` is defined for every
  `q`, but the face formula `s_{q,i} = σ_{i+1}⋯σ_q` names generators `σ_n,…,σ_q` that do not exist in
  `B_n` once `q ≥ n`, and a `q`-simplex of the arc complex is `q+1` disjoint arcs to distinct
  punctures, so `A_q` must be empty there; and the last line of the proof of Lemma 8.9 modifies "the
  `y_i`'s for `i > g`" in a basis `y_1,…,y_g`, where it means `k < i ≤ g`.

**The three findings in Achter–Pries.**

- **E15** (p. 14) is the one with real content, and it verifies exactly. The proof of Corollary 3.5
  reads "Since the composition `M_{Z_ℓ}(H̃_g⊗k) ↪ Sp_{2g}(Z_ℓ) → Sp_{2g}(Z/ℓ)` is surjective, a
  standard group theory argument (e.g., [29, 1.3]) shows that `M_{Z_ℓ}(H̃_g⊗k) ≅ Sp_{2g}(Z_ℓ)`."
  I recomputed the subgroup of `SL_2(Z/9)` generated by `[[0,1],[8,0]]` and `[[1,7],[6,7]]`: both have
  determinant 1 mod 9, the group has **order 24 and index 27**, and it maps onto `SL_2(F_3)` with
  **trivial kernel**. Its preimage in `SL_2(Z_3)` is therefore a proper closed subgroup with full
  mod-3 image, so the implication fails at `(g,ℓ) = (1,3)`. Vasiu's Theorem 1.3 confirms the scope the
  correction gives: condition (a) is `q ≥ 5`, and condition (b) at `q = 3` requires
  `Lie_{F_3}(H) ∩ K_2 ≠ {0}` for every normal `PGL_2` or `SL_2` subgroup — vacuous for `Sp_{2g}` with
  `g ≥ 2`, a real hypothesis for `Sp_2 = SL_2` — and Vasiu adds that "most of the extra assumptions of
  b) to d) were known to be needed before". The conclusion of Corollary 3.5 is not in doubt; the
  finding is a gap, and EVW needs only large `n`, where `g ≥ 2`.
- **E16** (p. 5). The proof of Lemma 2.3 concludes that the branch functor `β°_γ ⊗ C` "is an
  isomorphism", and §2.2 says the same letters denote the representing **stacks**. The deck
  transformation `ι_0(1)` commutes with the `G`-action and fixes every labelled ramification point, so
  it is a nontrivial automorphism of the source object, while a genus-zero curve with `r ≥ 3` distinct
  labelled points has none. The functor is a `G`-gerbe, `μ_2` in the hyperelliptic case, and is an
  isomorphism on coarse spaces — which is all irreducibility needs. Item 131 of the extraction keeps
  that stabilizer, consistently.
- **E17** (p. 10). §3.1 asserts, with no hypothesis beyond "`S` is an `F`-scheme", that the arithmetic
  image modulo the geometric image is `Gal(F_{ℓ^∞}/F)`. Over `F = C(t)` with `S = Spec F` and
  `E : y² = x³ − t²x`, the substitution `x = tu`, `y = t√t·v` identifies `E` with the constant curve
  `y² = x³ − x` over `F(√t)` and the nontrivial conjugation acts as `[−1]`; the arithmetic image is
  `{±I}`, the geometric image is trivial, and `F ⊇ C` gives `F_{ℓ^∞} = F`. In general the multiplier
  only gives a surjection onto the cyclotomic image; equality needs the geometric image to be the full
  symplectic group, which is the situation of Corollary 3.6. Item 137 records the correct exact
  sequence.

**The two findings in Vasiu §2.2 (PDF p. 4).**

- **E18.** "If `y, z ∈ Lie(S)`, then the Lie bracket `[y,z]` is `yzy⁻¹z⁻¹`, the product being taken
  inside `Ker(S(R[x]/x²) → S(R))`." That kernel is the additive group of `Lie(S)` and is abelian, so
  the recipe returns 0 always. In `GL_2` over `R[e]/(e²)`, `(1+eE_{12})` and `(1+eE_{21})` commute
  while `[E_{12},E_{21}] = diag(1,−1) ≠ 0`. I recomputed the repair: in `R[e,d]/(e²,d²)`,
  `(1+eX)(1+dY)(1+eX)^{-1}(1+dY)^{-1} = 1 + ed[X,Y]`.
- **E19.** "So `Lie(S)` is a free `R`-module of rank equal to the relative dimension of `S`." The
  standing base is only a connected affine `Spec(R)` (§1, p. 2), not a local ring, and over such a
  base `Lie(S)` is finite locally free but need not be free: for an invertible non-free `L`, the
  vector group `Spec(Sym_R(L^∨))` — the off-diagonal unipotent subgroup `Hom(O,L)` of `GL(O⊕L)` — is
  smooth of relative dimension 1 with `Lie(S) = L`. The applications run over `W(k)`, where projective
  modules are free, so nothing downstream is affected.

## Limits of this check

I did not read all 58 pages line by line. I read §§1 and 8 in full, the pages every finding names, the
statements the routes cite and the surrounding material needed to judge them; in Achter–Pries I read
pp. 1–5, 10 and 13–14 and the bibliography, and in Vasiu §§1–2.2 and Theorem 1.3. I did not collate
any other version: the published text is the version of record and the extraction's locators are all
into it, but arXiv 0912.0325v4 was not compared line by line, and neither was the Achter–Pries
publisher PDF (*Math. Ann.* **338** (2007), 187–206) against the author-hosted one the extraction
pins. I did not re-run the extraction's own search for a published erratum; I note only that the
searches it records are specific and dated, and that I found no correction while fetching the sources.
I add no finding of my own — one candidate, the tension between Theorem 8.8's proof treating trivial
`A` and §8.6's "nontrivial", is already inside E9's correction.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-ELLENBERG-VENKATESH-WESTERLAND-16.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-ELLENBERG-VENKATESH-WESTERLAND-16.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-ELLENBERG-VENKATESH-WESTERLAND-16.review.json

All pass. No roadmap change, no library claim and no Lean work is proposed.
