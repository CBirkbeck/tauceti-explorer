# Review of PAPER-HE-21

**Job** REV-PAPER-HE-21 (issue #1398) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All eleven routes accepted; all fourteen `sourceIssues`
confirmed; one suggested repair corrected in place; nothing rejected or deleted.

Paper: Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*,
[Forum of Mathematics, Pi **9** (2021), e9, 1–15](https://doi.org/10.1017/fmp.2021.10), read in the
published Cambridge open-access PDF and compared page by page with
[arXiv:2001.03325](https://arxiv.org/abs/2001.03325), the only posted version.

## Source and hashes

The recorded arXiv hash reproduces byte for byte:
`818873a568bf37ec0b336cb12bd6822879ca369865cceb332ba06b95910989a3`, 15 pages.

The published hash does not, and cannot. Two downloads of the Cambridge PDF today gave
`101df23b…` and `067e44fc…`, neither matching the recorded `88927779…`; Cambridge stamps every
download with a footer carrying the date and the requesting IP, which is visible in the extracted
text of every page of both copies. The extraction's `source.version` already says exactly this, which
is the right way to record it — a note in the file rather than a hash that will never reproduce.
This is the third instance in the corpus; `PAPER-HE-18` and `PAPER-SHANKAR-SHANKAR-TANG-ETAL-22`
carry the same note, added when those two were reviewed.

## Structure

134 items: 115 missing, 10 planned, 9 library. Eleven routes — eight source, three Part II. Every
missing item is routed exactly once, every planned id resolves, all eight source stage ids exist, and
both `scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass.

All three Part II parents exist and all three proposed titles reproduce their parents' atlas titles
character for character:

| roadmap id | parent atlas title | area |
| --- | --- | --- |
| `RootSystemsPartIIDominanceAndDemazure` | Root systems, Weyl groups, and the Cartan-Killing classification | `grouptheory` |
| `HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig` | Hecke correspondences and local shtuka cohomology | `langlands` |
| `SmoothRepresentationsPartIIParahoricCenters` | Smooth representations of local groups | `representations` |

All three areas are galaxy ids from `data/galaxies.json`. The first id is shared with
`PAPER-LE-LEHUNG-LEVIN-ETAL-23` and `PAPER-ZHU-17`; this extraction's title is the one that agrees
with the atlas, hyphen and all, so there is nothing to change here — the divergence is on the other
side, and was already reported when `PAPER-HE-18` was reviewed.

**Library.** All 16 declarations behind the 9 library items resolve at the pins (Mathlib `082e2d3`,
Tau Ceti `f790474`): `CoxeterSystem.length`, `IsReduced`, `length_inv` and `length_mul_le` from
Mathlib's `Coxeter/Length.lean`, and from Tau Ceti `CoxeterSystem.BruhatStep`, `BruhatLE`,
`bruhatPartialOrder`, `TauCeti.dominantChamber`, `openDominantChamber`,
`existsUnique_mem_orbit_inter_dominantChamber`, `stabilizer_eq_closure_wallReflections`,
`posRootCone`, `mem_posRootCone`, `finite_setOf_dominant_sub_mem_posRootCone`,
`ringKrullDim_tensorProduct_field_of_finiteType` and `finiteRingKrullDim_of_finiteType`.

**Locators.** Printed page numbers equal PDF page numbers throughout — the running heads read
*Forum of Mathematics, Pi n* on odd pages and *n Xuhua He* on even ones. Every numbered environment
of this paper that is cited with a page is on that page. The nine apparent misses are all correct
locators: `Lemma 2.5.1`, `Lemma 3.2`/`Corollary 3.12`, `Corollary 5.6`, `Corollary 3.6.1` and
`Lemma 3.6.3` are numbered in GH10, MV20, Vi14 and GHN15 rather than here, and items 44, 94 and 95
name `Theorem 1.1` as the introduction's statement of a §4 or §6 result. The same holds for the
section-level checks: §5.4 *Proof of Theorem 5.5* opens on p. 10 and runs to p. 12, so the items
citing it at pp. 11–12 are right, and §6.3 *Dimension formula* opens on p. 13 and its proof continues
onto p. 14, which is where E1's sentence actually stands.

## The findings

All fourteen are confirmed. Six were checked against the sources they are about, and the hashes of
everything I read are recorded here: `arXiv:1511.01386` (`f6170c52…`), `arXiv:1211.3784`
(`c2293924…`), `arXiv:1201.4901` (`eae8cc00…`), the Görtz–He–Nie erratum (`cf7efbf8…`) and
`arXiv:2109.02594` (`b38e3ce9…`).

**E1 — the shrunken hypothesis.** [He15] is He's *Hecke algebras and p-adic groups* survey, and its
Theorem 2.27 begins *"Assume that G is simple. Let w ∈ W̃ such that wσ(a) is contained in a Shrunken
Weyl chamber."* The element it is applied to on p. 14 is the `a t^γ` produced by Theorem 5.5, whose
printed conclusion is only that there exist a dominant `γ ≥_Z λ_w^♭♭` and `a ∈ W_0` with
`supp_σ(a) ⊃ supp_σ(η_σ(w))` such that `w ⇒_σ a t^γ`. Nothing there makes `γ` regular, and `a t^γ`
is not shrunken as soon as `⟨γ, α⟩ = 0` for some `α ∈ Δ`. The repair the finding names is available
as stated: GHN15's Theorem A — labelled there *(Corollary 3.6.1, Theorem 4.4.7)* — is stated for
every `x ∈ W̃` with no shrunken hypothesis, and for a basic seed that is what is needed.

**E2 — the conjugator in §6.2 and §6.5.** GHN15's Lemma 3.6.3 reads *"Let x ∈ W̃, and write
w = η_2(x) ∈ W. If η_δ(x) ∈ W̃_J, then x·a is a (J,w,δ)-alcove"*, and §3.6 there fixes `η_2` by
*"if x = v ε^μ w with ε^μ w·a contained in the dominant chamber, then η_1(x) = vw, η_2(x) = v, and
η_δ(x) = δ^{-1}(w) v."* In this paper's normal form `w = x t^λ y` that makes GHN's `η_2` the left
factor `x` and GHN's `η_δ` the paper's `η_σ(w) = σ^{-1}(y) x`. So the conjugator is `x`, and

    x^{-1} w σ(x) = t^λ y σ(x) = t^λ σ(η_σ(w)) ∈ W̃_J,   J = supp_σ(η_σ(w)),

whereas the printed `σ^{-1}(y)` fails the defining condition. The printed Kottwitz element does not
even match the printed claim: `σ^{-1}(y) w y^{-1} = η_σ(w) t^λ` is the conjugate by
`σ^{-1}(y)^{-1}`, while the paper's own Theorem 6.3, quoted two lines earlier, asks for
`κ_{M_J}(x^{-1} w σ(x))`. The same sentence recurs in §6.5 on p. 14, and both are in both versions.

`affects: the proof` is the right grading, for the reason the extraction's own audit gives: `W_J` lies
in the affine Weyl group of `M_J` and so in `ker κ_{M_J}`, whence
`κ_{M_J}(η_σ(w) t^λ) = κ_{M_J}(t^λ) = κ_{M_J}(t^λ σ(η_σ(w)))`. The printed element has the same
image as the correct one, so §6.2's conclusion stands once the alcove datum is repaired.

**E3 and E4 — the two sums in §5.** Both are exactly as printed on p. 8. Every element in those
relations is a coweight, and this paper's `Δ` is a set of roots — §2.2 defines `ρ` by
`⟨α^∨, ρ⟩ = 1` for `α ∈ Δ`, and every other occurrence of the two orders is written with `α^∨` — so
the missing superscript is a real misprint outside the simply-laced types (E3). Independently, the
hypothesis in force is `μ'_i + λ' ≥_Z λ`, which puts `λ' − λ + μ'_i` in `Σ_{α∈Δ} Nα^∨` and not in
the open cone: `λ = λ' = μ'_1 = μ'_2 = 0` satisfies every hypothesis and gives the zero vector (E4).
The strict positivity on the disjoint supports `J_1`, `J_2` is correct and the finding leaves it
alone.

**E5 — Proposition 5.1, with one correction made in place.** The printed proof takes two elements of
the set, builds `μ = μ'_1 − γ_1 = μ'_2 − γ_2`, shows it is dominant and feasible, and stops at *"The
statement is proved."* That is lower directedness. It gives uniqueness of a minimal element once one
exists, but neither nonemptiness nor existence — both of which the statement asserts.

The extraction offered `μ' = λ − λ' + NΣ_{α∈Δ}α^∨` as the witness for nonemptiness, and the sum of
the simple coroots is not dominant in every type: `⟨Σ_{α∈Δ}α^∨, β⟩` is a column sum of the Cartan
matrix, which is `−1` for the long simple root of `G_2`. I replaced it in the JSON by the paper's own
`2ρ^∨ = Σ_{α>0}α^∨`, which lies in `Σ_{α∈Δ}Nα^∨` and pairs to `2` with every simple root, so
`μ' = λ − λ' + N·2ρ^∨` is dominant and feasible for large `N` in every type. The second step needs
no change: for a feasible `μ'_0` the dominant coweights `μ` with `μ'_0 ≥_Z μ` form a finite set.
Proposition 5.1 is true; only its proof is incomplete. Route 9's brief already asks for exactly these
three steps — *"nonemptiness, lower-directedness and leastness of the dominant subtraction feasible
set"* — so the roadmap consequence is already recorded.

**E6 — 'of adjoint type'.** GHN15 says *"We first show that it suffices to consider quasi-split,
semisimple groups of adjoint type"* and *"In Section 2 … we reduce to the case that G is quasi-split
and semisimple of adjoint type"*, with §2.2 headed *Reduction to adjoint groups*. This paper's §2.2
keeps only *"simple and quasi-split"*. The omission is load-bearing: §5.2 defines `ρ^∨_J` by
`⟨ρ^∨_J, α_s⟩ = 1` for `s ∈ J` and `0` otherwise, and §5.4 sets
`w_1 = x z^{-1} t^{λ_w − ρ^∨_J} y'`, `w_2 = (y')^{-1} z t^{ρ^∨_J} y` and takes `γ` in the `W_0`-orbit
of `λ_w − ρ^∨_J + (x')^{-1}σ^{-1}(ρ^∨_J)`. All of these need `ρ^∨_J ∈ X_*(T)_{Γ_0}`. For split
`SL_3` that lattice is the `A_2` coroot lattice, and `y = s_1` gives `J = {s_1}` and
`ρ^∨_J = ω^∨_1 = (2α^∨_1 + α^∨_2)/3`, so `t^{ρ^∨_J}` is not an element of `W̃` at all — and `SL_3`
is simple and quasi-split.

This finding and E13 are linked. Recovering the printed generality from the adjoint case runs through
GHN15's Proposition 2.2.1, which is one of the two propositions the authors' erratum corrects, and
the corrected form also carries the hypothesis that `char k` not divide `|π_1(G_ad)|` in equal
characteristic.

**E8 — [BS17] in equal characteristic.** The sentence stands in the published §2.2 and is absent from
the arXiv §2.2, which passes straight from the definition of `X_w(b)` to the GHN15 reduction. The
published bibliography's first entry is *"… tor Grassmannian', Invent. Math. 209 (2017), 329–423"* —
Bhatt–Scholze, *Projectivity of the Witt vector affine Grassmannian* — whose subject is `W(k)`
lattices and whose answer is an inductive limit of perfect schemes in mixed characteristic. In equal
characteristic the affine flag variety is an ind-scheme by the Iwahori–Matsumoto and Bruhat–Tits
construction the paper cites two lines above. The misattribution is confined to that sentence.

**E9, E10, E11 — He14, Proposition 11.6.** All three are verbatim in `arXiv:1201.4901`. The statement
says `x ∈ W_J with supp_δ(v) = J` and introduces no `v`; `v` is that paper's Hecke parameter, and the
induction reads *"the statement is true for all x' with supp_δ(x') = J and ℓ(x') < ℓ(x)"* (E9). The
proof's line *"there exists i ∈ δ^{-1}(J_1) with s_i x_1 < x_1"* contradicts the choice of `x_1` in
`^{δ^{-1}(J_1)}W` three lines earlier; since `x ∈ W_J` and `δ^{-1}(J_1) ⊆ J`, the descent exists in
`J − δ^{-1}(J_1)`, and the continuation confirms it by using `ℓ(y s_{δ(i)}) = ℓ(y) + 1` and
`t^μ y s_{δ(i)} ∈ ^S W̃` against the same proof's `J_1 = {i ∈ J; t^μ y s_i ∉ ^S W̃}` (E10). And
*"Hence supp(x') = J"* should be `supp_δ(x') = J`, since the chain before it is a chain of
`supp_δ` and the induction it feeds is stated for `supp_δ`; the two differ, as the diagram
automorphism of `A_2` shows (E11).

The `known` notes on E10 and E11 are right. He–Zhou–Zhu, `arXiv:2109.02594`, Proposition 3.4.2 is
introduced there as a refinement of [He14, Proposition 11.6]; it replaces the faulty step by a
reduced-word argument on `u` with the two cases `ℓ̆(x_k) < ℓ̆(x)` and `ℓ̆(x_i) = ℓ̆(x)`, so the
impossible descent is never chosen, and it keeps `supp_σ` throughout
(*"supp_σ(s_k x_{k−1}) = supp_σ(x) = K̆"*). That is a later reformulation, not an erratum, which is
what the JSON says.

**E13 and E14 — the Görtz–He–Nie erratum.** I read the erratum in full. It states that Proposition
2.2.1 *"does not hold as stated"*, replaces it by Proposition 0.0.1, records that
`π_0(Flag) → π_0(Flag_ad)` *"is not injective in general; this was erroneously claimed in part (2) of
the original statement, and implicitly used in part (1)"*, and computes
`ker(π_0(Flag) → π_0(Flag_ad)) ≅ X_*(T)_{Γ,tors}` (E13). For Proposition 3.5.1 it restores the
missing hypothesis in Proposition 0.0.2 and gives the counterexample *"take G = GL_2, J = ∅ … the
diagonal matrices with entries (ϵ,1), and (1,ϵ), resp., are σ-conjugate in G(L), but not in M(L)"*
(E14). Both findings reproduce this accurately, and E14's cross-reference holds: this paper's
footnote on p. 13 draws exactly the same distinction between GHN15's Proposition 3.5.1 and Remark
3.6.2 on one side and Corollary 3.6.1 on the other.

**E15 and E16 — two notational slips.** The §6.1 heading reads *The (J,w,δ)-alcove elements* while
the definition two lines below says *(J,x,σ)-alcove element*, and `w` is the one letter the heading
gives to something else (E15). And `N(L)` on p. 4 is the only occurrence of `L` as a field anywhere
in the paper — I counted them page by page — while the two sentences immediately before it define
`W_0 = N(F̆)/T(F̆)` and `W̃ = N(F̆)/(T(F̆) ∩ Ĭ)`; `L` is GHN15's notation for the same field, which is
where the sentence comes from (E16).

## Two observations that are not findings

Neither is a mistake in the published paper, so neither was added as a `sourceIssue`.

The arXiv §6.4 has *"Note that 2ρ^∨_J − ρ^∨_J − η^∨_J ∈ Σ_{α∈Δ}Q_{≥0}α^∨"*, where the chain that
follows needs `2ρ^∨`; the published text reads `2ρ^∨`. That is an arXiv-only misprint that print
repaired.

The published Theorem 5.5 is also stated differently from the arXiv one — a shrunken hypothesis on
`w` and `supp_σ(a) ⊃ supp_σ(η_σ(w))` in print, against `supp_σ(η_σ(w)) = S` and `supp_σ(a) = S` on
arXiv. The published form is the stronger statement, and E1's gap is untouched by the difference,
since neither form makes `γ` regular.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-HE-21.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-HE-21.result.json

Both pass. No roadmap change, no library claim and no Lean work is proposed by this review.
