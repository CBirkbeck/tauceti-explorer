# REV-ERRATA-PAPER-CESNAVICIUS-22 — review of the mistakes recorded in Česnavičius (Forum Math. Pi 2022)

**Verdict: all eight findings confirmed. One sub-claim inside a correction is flagged as unverified; nothing is rejected and nothing is added.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Errata author: Codex, session `codex-7e92bd` (job `ERRATA-PAPER-CESNAVICIUS-22`, issue #1862), collating the findings of the extraction `PAPER-CESNAVICIUS-22.result.json` (sessions `cc-442dc5`, `codex-a71f92`). I wrote none of those files, and `cc-fb70e5` appears in none of them. This review adds a `review` verdict to each finding in `research/blueprint/errata/PAPER-CESNAVICIUS-22.json` and a section to the `.md` beside it; it changes no finding's kind, locator, `printed`, `correction` or `affects`, and leaves the extraction untouched.

## Sources, and what matched

Every source the errata file records was re-downloaded here and **seven of the eight hashes matched byte for byte**:

| Source | recorded SHA-256 | re-downloaded |
| --- | --- | --- |
| [author PDF](https://webusers.imj-prg.fr/~kestutis.cesnavicius/split-unramified.pdf), 32 pp. | `984748e9…f7476a` | identical |
| [arXiv 2009.05299v7](https://arxiv.org/pdf/2009.05299v7) | `f922ad16…565664` | identical |
| [Gille, *Torseurs sur la droite affine* (2002)](https://math.univ-lyon1.fr/~gille/publis/affine.pdf) | `1fbebb2d…1913f86` | identical |
| [Gille, *Errata* (2005)](https://math.univ-lyon1.fr/~gille/publis/erratum05.pdf) | `65b6bca9…15aade067` | identical |
| [Gille, *Le problème de Kneser–Tits* (2009)](https://numdam.org/item/AST_2009__326__39_0.pdf) | `1ee4a7de…dd96b06081` | identical |
| [Gille, *Errata et compléments*, 26 May 2026](https://math.univ-lyon1.fr/~gille/prenotes/errata.pdf) | `6297d7a0…7a966b79eba61` | identical |
| [Česnavičius, *Problems about torsors over regular rings*, arXiv 2201.06424v4](https://arxiv.org/pdf/2201.06424v4) | `da970a4e…81450085a` | identical |
| [published PDF (Cambridge)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/9D047724E9541FA2BD7FE06FB9333B24/S2050508622000051a.pdf), 30 pp. | `2683a75d…6e0db8ea` | **differs** (`85d2188e…`) |

The publisher copy's difference is the dated footer the errata file already warns about, and the text at every locator agrees; the byte hash of that copy is retrieval-specific and is not evidence about the article. I also read [Borel–Tits, *Groupes réductifs*, Publ. Math. IHÉS 27 (1965)](https://www.numdam.org/item/PMIHES_1965__27__55_0.pdf) for the reference question under E3, and the Crossref-adjacent arXiv record for E8.

This environment has no PDF renderer or text extractor, so I wrote one (pure-python content-stream decoding with ToUnicode and `/Differences` handling) and read the sources with it; for the two scanned NUMDAM documents I read the invisible OCR layer, and for Gille 2002, whose subsetted fonts name glyphs by font position, I reconstructed the encoding from the text itself. Where a verdict turns on a single glyph — E5, E6, E8 — I did not rely on rendered text at all but on the ordered font runs, which show the size of each character and hence whether it is a subscript.

## Per-finding verdicts

| Finding | Kind · affects | Verdict |
| --- | --- | --- |
| E1 Cohen isomorphism need not be over the base field | error · the proof | confirmed (author's footnote; counterexample verified) |
| E2 the k-parabolic in Gille's Lemme 3.12 | gap · the proof | confirmed (cited source; corrected in Gille's 2005 erratum) |
| E3 generic anisotropy in Gille's Lemme 4.5 | gap · the proof | confirmed (cited source; corrected in Gille's 2026 errata) — one sub-claim unverified |
| E4 total isotropy is local; the proof wants a global parabolic | gap · the proof | confirmed (author's survey footnote; counterexample checked) |
| E5 `∏_𝔪 k((t))` for `∏_𝔪 k_𝔪((t))` | misprint · nothing | confirmed at glyph level |
| E6 `Out(G, B)` for `Aut(G, B)` | misprint · nothing | confirmed |
| E7 "every inner form of SO_n is an SO(E)" | error · nothing | confirmed |
| E8 `1911.0766v2` for `1911.07666v2` | misprint · nothing | confirmed |

**E1.** The footnote at author p.20 reads, verbatim: « *Added after publication. As Gabber pointed out, the isomorphism ε_z ≅ Spec(k_z[u_z]/(u_z²)) deduced here from the Cohen structure theorem is a priori not an isomorphism of k_m-schemes unless the field k_m is perfect* », and continues with the [CTHK97] presentation and the translations `t ↦ t + α` that the entry records as the repair. The published p.18 carries the same Cohen-structure sentence and no footnote, so the entry's `known` is exact. The entry's counterexample is its own contribution and it upgrades "a priori not" to "not": in `O/I_z² = k_m[t]/(u²)` with `u = t^p − s`, Frobenius gives `(Σ c_j t^j)^p = Σ c_j^p (s+u)^j = h(s) + h′(s)u` with `h ∈ k_m^p[X]`; expanding in the `k_m^p`-basis `1, s, …, s^{p−1}` of `k_m`, `h(s) = s` forces the degree-one component to be `1` and all others `0`, hence `h′(s) = 1 ≠ 0`. So nothing in `O/I_z²` has p-th power `s`, and there is no `k_m`-algebra map `k_z = k_m(s^{1/p}) → O/I_z²` at all.

**E2.** Checked at both ends, which is what a "gap in a cited input" needs. Gille's 2002 proof (printed p.239) goes straight from « On peut donc supposer la classe γ_η isotrope » to « Il existe donc un k-sous-groupe parabolique j : Q/k = Z_G(S₀)·R_uQ ⊂ G/k … », with nothing in between: the k-parabolic is asserted, not proved. Gille's published erratum (Transform. Groups 10 (2005), pp. 268–269) inserts exactly the argument this entry records — `E(X_I)`, the scheme of parabolics of type `I`, is proper over `P¹_k` and has a `k(t)`-point, hence a `P¹_k`-point; the fibre at infinity is `X_I` because `E_∞` is trivial, so `X_I(k) ≠ ∅` — and then repeats the « Il existe donc » sentence verbatim before « Le reste de la preuve est inchangé ». The lemma's statement is unchanged and CES22 cites [Gil05] at the point of use.

**E3 — confirmed, with a sub-claim flagged.** Both printed passages are in the Astérisque text at printed p. 54. Gille's own errata of 26 May 2026, p. 4 (« proof of Lemma 4.5, pointed out by A. Zidani ») opens « *There is more work to do to prove that M(O) = M(K)* » and gives precisely the repair recorded here: the singleton comparison `Par(M)(K) ≅ Par(M)(O) ↠ Par(M)(k)`, so `M_K` has no proper `K`-parabolic; the character-lattice argument over a Galois extension splitting `T = rad(M)`, so `T_K` is anisotropic; then Guo's Proposition 6. What I could **not** verify is the correction's last sentence, replacing « [7, prop. 6.11] » by Corollaire 6.8. Gille's errata does not touch that citation; [7] is Borel–Tits, « Homomorphismes “abstraits” de groupes algébriques simples », Ann. of Math. 97 (1973), which is not publicly accessible from here; and the swap cannot refer to the 1965 *Groupes réductifs*, whose 6.8 is a proposition on the restriction `X*(T) → X*(S)` and whose corollary in that range is 6.9. The verdict stands on the gap, which is what the register carries; the reference repair should be treated as a suggestion until someone reads the 1973 paper.

**E4.** Three independent checks. Definition 8.1 (author p. 23) is pointwise — « for every `s ∈ S` », with the decomposition over `O_{S,s}` and each factor containing `G_{m,O_{S,s}}` — so it gives a parabolic over each local ring, while the proof of Proposition 8.4 claim (2) writes « the isotropicity assumption implies that `G` has a proper parabolic subgroup `P ⊂ G` (see Definition 8.1) ». The author's post-publication footnote in the survey (arXiv 2201.06424v4, p. 26) states the same defect in his own words: for semilocal `A` the assumption must be strengthened, « *whereas total isotropicity would supply such a parabolic only after base change to each local ring of A* ». I checked the counterexample's load-bearing steps: `2` has order 3 mod 7 with nontrivial class in `(Z/7)^×/{±1}`, so it is inert in `ℚ(ζ₇+ζ₇^{-1})` and has valuation prime to 3 in the unramified cubic extension of `ℚ₂`, hence is not a norm and `D = (L₁/ℚ, σ, 2)` is division; `L₁` splits `D` and `ℚ(i)` splits `(−1,−1)`, which is what makes the patching data match; and parabolics of `SL₂(D)` and `SL₃(H)` have reduced dimensions in `{3}` and in `{2,4}`, disjoint, so no parabolic `R`-subgroup exists, its type being constant on the connected `Spec R`. I did not re-derive the conductor-square bookkeeping. Theorem 9.1 is untouched, since it applies Proposition 8.4 to quasi-split `G`, which has a Borel over `R`.

**E5 — settled by the page itself.** In the author PDF p. 25 the font runs are `R` `((` `t` `))` `↠` `∏` with a 7.97 pt fraktur `𝔪` subscript, then a full-size `k` followed immediately by `((t))` with no subscript of any size; published p. 24 is the same in its own fonts, the `𝔪` after the product in the subscript face and the following `k` in the text face. Two lines above, the display of the very same surjectivity prints `(ℛ_u(P))(R((t))) ↠ ∏_𝔪 (ℛ_u(P))(k_𝔪((t)))` **with** the subscript, and claim (2) writes `k_𝔪` throughout. One bare `k` against the correct form on the same page is as decisive as a typographical verdict gets.

**E6, E7, E8.** E6: published p. 26 and author p. 28 print « `y ∈ H¹(R, Out(G, B))` whose image in `H¹(R, Out(G))` is also `x̄` », while the sequence displayed immediately above is `1 → B^ad → Aut(G, B) → Out(G) → 1` and the splitting quoted in the preceding sentence is `Out(G) → Aut(G, B)`; `Out(G, B)` is never defined. E7: the sentence is printed as quoted, and it is false for even `n` — `(−1,−1)_ℚ` ramifies at `{2, ∞}` and `(−1,3)_ℚ` at `{2, 3}`, so they are non-isomorphic division algebras, and `SO(H ⊗ H′, γ ⊗ γ′) ≅ (SL₁(H) × SL₁(H′))/μ₂` is an inner form of split `SO₄` that is no `SO(E)`, since a 4-dimensional form of trivial discriminant is similar to a quaternion norm form, whose even Clifford algebra has two *equal* factors; the entry's real-place check (`su(2) ⊕ sl₂(ℝ)` against `so(4)`, `so(2,2)`, `so(3,1)`) is correct and avoids the classification of algebras with involution. The proof twists only by `SO(E)`- and `O(E)`-torsors, so the recorded reach of nothing is right. E8: the published entry prints « Preprint, 2020. arXiv: 1911.0766v2. » and carries, in the same entry, the URL `http://arxiv.org/abs/1911.07666v2` — the identifier is one digit short of its own link, while the author version p. 29 has only the correct form.

## Findings added

None. I read each locator with its surrounding proof — §6.3 and the construction of `j`, all of Proposition 8.4 with Definition 8.1 and Lemma 8.3, the proof of Theorem 9.5 and Corollary 9.6, and the published bibliography — and found nothing further that I could certify. Two things worth recording instead of promoting: the paper's other uses of `k_𝔪` in the same proof are correct, which is what makes E5 a slip rather than a notational choice; and the "totally isotropic" hypothesis is used in exactly one place (claim (2) of Proposition 8.4), so E4's repair is local to that step.

## Validation

~~~sh
python3 scripts/check_errata.py research/blueprint/errata/PAPER-CESNAVICIUS-22.json   # ok
python3 research/blueprint/intake.py check-files \
  research/blueprint/errata/PAPER-CESNAVICIUS-22.json \
  research/blueprint/errata/PAPER-CESNAVICIUS-22.md \
  research/blueprint/reviews/REV-ERRATA-PAPER-CESNAVICIUS-22.md
git diff --check
~~~

No Lean file is a deliverable of this review and no formalisation is claimed. Three findings — E5, E6 and E7 — enter the register as new confirmed mistakes. The other five all carry an existing correction: E1 and E4 in the author's own post-publication footnotes (the paper's p. 20 and the survey's p. 26), E2 and E3 as defects of cited sources corrected in Gille's published 2005 erratum and his current errata, and E8 already right in the author's version of the bibliography.
