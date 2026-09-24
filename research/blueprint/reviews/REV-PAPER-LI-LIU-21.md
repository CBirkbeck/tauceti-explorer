# Review of PAPER-LI-LIU-21

**Job** REV-PAPER-LI-LIU-21 (issue #1116) · **Date** 24 September 2026 · Claude Code, session `cc-7b31c4`
· **Verdict: accept.** All 7 routes accepted; all 11 `sourceIssues` confirmed, each with the check written out;
one correction made in place; nothing rejected or deleted; no finding of my own added.

Paper: Chao Li and Yifeng Liu, *Chow groups and L-derivatives of automorphic motives for unitary groups*,
[Annals of Mathematics **194** (2021), no. 3, 817–901](https://annals.math.princeton.edu/2021/194-3/p06), read
in the two versions the extraction names. Both were re-downloaded for this review and **both recorded hashes
reproduce byte for byte**:

| version | where | SHA-256 |
| --- | --- | --- |
| authors' final, 20 October 2021, 67 pp. | `math.columbia.edu/~chaoli/AIPF.pdf` | `6ef2d63e…e5e566` |
| arXiv 2006.06139v5, 10 April 2021 | `arxiv.org/pdf/2006.06139v5` | `b3705e15…cec289` |

The typeset Annals PDF is paywalled and was not read, as the extraction states. Locators are pages of the final
version unless the finding says otherwise.

Extraction by a different agent, as the job requires.

## Structure

81 items: 67 missing, 14 planned, none `library`. Every missing item is routed exactly once. All 19 stage
references of the 14 planned items resolve in `data/atlas.json`, and so does every route target. The three
Part II routes carry `area: "arithmeticgeometry"`, which **is** a galaxy id of `data/galaxies.json` — it is not
a roadmap `group`, and the two vocabularies are different; there is nothing wrong here.

Both Part II titles are exact prefix extensions of their parents' atlas titles: *Gross–Zagier formulas and
arithmetic heights* (routes 1 and 3) and *Siegel and PEL moduli problems* (route 2). All three new roadmap ids
are free, and all three are **co-proposed with identical id, parent and title** by other extractions — a
two-way, a five-way and a six-way merge respectively. That six extractions independently land on the same three
roadmaps is evidence the boundary is drawn where the mathematics divides, not a collision.

The extraction records no `libraryPins` and needs none: it has no `library`-status item, and no other paper
extraction in this corpus carries that field.

## The eleven findings

All confirmed. What follows is what I checked, not what the extraction says.

**E1 (error, affects a stated result) — the constant `C_r`.** Reproduced on both versions. arXiv v5 prints
`C_r = (−1)^r 2^{r(r−1)} π^{r²} Γ(1)···Γ(r)/(Γ(r+1)···Γ(2r))` at p. 7 (Theorem 1.7(1)) and again at p. 17
(Proposition 3.7); the final version prints `2^{−2r}` in place of `2^{r(r−1)}` at both. The constant enters
Theorem 1.7(1) as `C_r^{[F:Q]}`, so the classification is right, and so is the `known` field: the published
article follows the final version by date.

**E2 (gap) — the current `η` in the proof of Proposition 10.1.** Reproduced on both versions. arXiv v5, p. 46:
"by the `∂∂̄`-lemma for currents, there is an `(r−1,r−1)`-current `η` … such that `dd^c η = δ(…)^c`", then
`(g^KM_{T_1} − g^♥_{T_1}) ∧ dd^c η`. Final version, p. 46: "For short, put `η := −g^♥_{T_2}(φ^∞_2, s_2, g^∞_2)^c_L`,
which is an `(r−1,r−1)`-current on `X_L(C)` satisfying `dd^c η = δ(…)^c`". The objection is correct: an
arbitrary solution need not be smooth near `supp Z_{T_1}`, and neither the wedge product nor the integration by
parts is then defined.

**E3 (gap, affects a stated result) — an unstated hypothesis, and the only genuinely new finding of substance.**
Checked in three places.

1. Li–Liu, final version, p. 45, ends the proof of Proposition 9.1: "… if `T(x) = T□`, by
   **[LZ, Theorem 10.5.1 & Remark 10.5.4]**. The proposition is proved." No hypothesis is attached, and the
   main theorems are stated unconditionally apart from Hypotheses 4.5 and 6.6.
2. Li–Zhang, arXiv:1908.01701v3, opens §10.5 (PDF p. 70) with: "We are now ready to complete the computation of
   the intersection number `Int′(L)` defined by (10.1.1.1). **Note that the result is conditional on
   Conjecture 10.4.1.**", immediately before Theorem 10.5.1. And p. 67, right after stating Conjecture 10.4.1
   in its three parts: "In [KRSZ19] the authors will prove this conjecture, **which from now on we assume to
   hold**."
3. Li–Rapoport–Zhang, arXiv:2404.02214v2, has a Part 2, *The geometry of `Ñ^{[1]}_n`*, whose §14.6 "formulates
   the main result Theorem 14.6.2 on the structure of `Ñ^{[1]}_n`", with §§15–16 devoted to its proof.

So the hypothesis is real, it is unstated in a published Annals paper, and the later work that should discharge
it exists. The finding's own caveat is preserved: whether Theorem 14.6.2 supplies *every* part used in
Li–Zhang §10.5, in particular the blow-up description (ii), was not checked line by line — not by the
extraction and not here. A design job consuming Proposition 9.1 must check it.

**E4 (misprint).** Final version p. 35: "the set `B(G, μ^{−1})` is identified with `{0, …, n−1}` under which
`d = n − j = 2r − 1 − j`", and four lines later "implies that `i` can only be `2r − 1 − j`". With `n = 2r` the
printed middle term is `2r − j`; the intended value is `n − 1 − j`, which is also the dimension of `Y°_{m,j}`
stated earlier on the same page.

**E5 (misprint).** Final version p. 27, proof of Lemma 5.4: "Take `x′ ∈ ^uV^r` and `h ∈ H(A^∞_F)` such that
`hx = x′` holds in `V^m ⊗_{A_F} A^∞_F`" — `r` on the left, `m` on the right. The first of the four listed
occurrences is enough to establish the misprint; the other three were not re-read here.

**E6 (misprint), with one correction made in place.** Final version p. 62: "Consider a pair
`(c_1, c_2) ∈ Z^{d_1,d_2}(X)^{⟨ℓ⟩}` satisfying `supp(c_i) ∩ supp(c_2) = ∅`" — index `i` for `1`. On p. 64,
Corollary B.15 uses `H^{2d}(X, Q_ℓ(d))` in the hypothesis of (1) and in the conclusion of (2), while its own
hypothesis in (2) and the whole of its proof use `H^{2r}(X, Q_ℓ(r))`; `d` is undefined there. **The refinement:**
the finding said the correction is needed in *three* places; there are *four*, because the last line of the
proof contains two occurrences ("some power of `t` annihilates `H^{2d}(X, Q_ℓ(d)) ⊗_Q L`, which implies
`(H^{2d}(X, Q_ℓ(d)) ⊗_Q L)_𝔪 = 0`"). The `correction` field has been amended and the change is marked there.

**E7 (misprint).** Final version p. 55: the chain ends
`= C_{γ,δ} · q^{Nn(γ−δ)/(2−δ)} (∫_{A^m_0 × A^m_i × B^{n−2m}_{−N}} |f|^{2−δ})^{(2−γ)/(2−δ)}` — after the sum
over `i` on the left has been carried out, so a bound index survives the equality. The same region then appears
in (A.3) on p. 56, in the Hölder estimate and in the use of hypothesis (4). The correction, that the region
should be the union of the shells, is what the argument needs. The extraction's quotation is accurate.

**E8 (misprint).** Final version p. 52: "First, it suffices to prove the theorem for `R` satisfying
`R_π ⊆ R ⊆ V^fin_F` and `|R| ⩾ 2`." Every `R` is a subset of `V^fin_F`, so the reduction says nothing; §11
takes `R` inside `V^spl_F`.

**E9 (gap).** Final version p. 62 reads "By **(the same proof of)** [Gil81, Proposition 2.35]" with footnote 22:
"Although [Gil81, Proposition 2.35] only implies the statement when `Z_1 = Z_2`, its proof works more
generally. In fact, in the proof of [Gil81, Proposition 2.35], if `C_i` is represented by a map
`[α_i] : S⁰_{Z_i} → ΩBQP_X`, then the product …". Absent from arXiv v5.

**E10 and E11 (errors, the authors' own errata).** Checked against Disegni–Liu, §4.10 *Errata for [LL21, LL22]*,
read in **arXiv:2204.09239v3** rather than the journal version (whose pages 319–320 the finding cites and which
was not read here). Remark 4.50 and Remark 4.51 match the findings word for word, including that the
`χ^R_{π^∨}` modifications "do not affect the proof of the results" and that in Lemma 4.4 "the statement of the
lemma does hold" while the two claimed formulae do not.

## The routes

All seven accepted; the reasons are in the review file. Two remarks worth recording here.

**Route 5 (IG.5, IG.7).** I read the proof of Lemma 7.3 on p. 35 for E4 and can confirm the fit from the text:
it runs through the Igusa varieties of [HT01, §IV.1], the projective system with finite étale transition maps,
and [CS17, Corollary 6.1.4] — precisely the IG.4/IG.5 direction.

**Route 7 (MC.7), accepted with a note for whoever consumes it.** MC.7's brief does ask for typed statements of
the cycle conjectures and a register of proved cases, so the equivariant Beilinson–Bloch conjecture belongs
there. But, from first-hand knowledge of that layer: the blueprint packet for `MotivesAndAlgebraicCycles`
states Conjecture C and Conjecture D and records the Bloch–Beilinson filtration and the remaining cycle
conjectures as **not planned**, because no source read there states them. The supplier stage is the right home
and cannot discharge this item today; the design job taking this route must bring its own source for the
Beilinson–Bloch statement.

## What this review did not do

I did not read all 67 pages line by line. I read every page a finding names, the pages of the items I spot
checked, and the surrounding material needed to judge them. I did not read the typeset Annals text, so no
finding here has been checked against the version of record; I did read both versions the extraction names, and
both hashes reproduce. I did not re-read the three further occurrences listed under E5, and I did not check
line by line whether Li–Rapoport–Zhang Theorem 14.6.2 discharges every part of Li–Zhang §10.5. I add no finding
of my own.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-LI-LIU-21.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-LI-LIU-21.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-LI-LIU-21.review.json

All pass. No roadmap change, no library claim and no Lean work is proposed.
