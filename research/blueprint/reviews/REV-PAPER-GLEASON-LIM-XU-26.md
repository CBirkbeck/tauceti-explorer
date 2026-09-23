# Review of PAPER-GLEASON-LIM-XU-26

**Job** REV-PAPER-GLEASON-LIM-XU-26 (issue #1206) · **Date** 23 September 2026 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All fifteen routes accepted; all seventeen `sourceIssues` confirmed;
four Part II titles corrected in place. I add no finding of my own.

Paper: Ian Gleason, Dong Gyu Lim and Yujie Xu, *The connected components of affine Deligne–Lusztig
varieties*, [Invent. Math. **243** (2026), 805–861](https://doi.org/10.1007/s00222-025-01386-1).
Extraction by Codex, session `codex-c83e7a`, completed by Claude Code, session `cc-442dc5` (issue
#1205) — both different sessions from mine.

## Sources: what I could and could not reproduce

The extraction's locators are pages of the **published** version (57 pages, printed 805–861), whose
recorded hash is `c40fe1fc…`. **I could not re-fetch that file.** `link.springer.com` answers every
form of the content link with a 3038-byte JavaScript "Client Challenge" page instead of the PDF, so
the recorded hash is unverified here and no finding below is checked against the published
typesetting. I say so plainly rather than let the reader assume otherwise.

What I did reproduce is the **arXiv v3 PDF**,
`d2249ddbe1ae2f4728000d27846d396adffc97b2f8b7b1c82c5d2701153fcb12`, exactly as the extraction's
provenance records it — and, better, the **arXiv v3 LaTeX e-print** (`ADLV.tex`, 2622 lines). Every
check below was made against the authors' own source, and each verdict cites a TeX line.

That substitution is safe here because **the numbering agrees**. I rebuilt the numbering from the
source (one counter per section, 80 numbered environments; equations numbered by section through
`\numberwithin`), and every statement number *and every equation number* the extraction cites lands on
an environment or equation of the right kind — including 2.5, 3.26, 4.13, (5.18)–(5.19), (5.23)–(5.29)
and (5.37)–(5.39), which are equation numbers rather than statements, and which is why a naive check
reports them "missing". An author's copy on the first author's homepage carries the same numbering.

## The seventeen findings

**All seventeen are confirmed**: 10 misprints, 6 errors, 1 gap. The extraction had left every one
marked *"worker finding awaiting independent review; no reviewer verdict claimed"* — the right thing
to have done, since several assert that a published Inventiones paper is wrong. I checked each against
the LaTeX and redid every counterexample. Each survives.

### The three that matter

**E01 — Lemma 3.2.** The `π₀` half, "`π₀(𝒢) = π₀(ℱ)/K`" for locally profinite `K`, is **false** as a
statement about sets or spaces. Take `ℱ = underline(Z_p) × Spa(C,O_C)` with `Z` acting by translation.
Then `|𝒢| = Z_p/Z` with the quotient topology (the lemma's first half, which is fine), and every
`Z`-invariant open subset of `Z_p` is empty or everything, because a ball `a + p^nZ_p` already meets
every class (`Z + p^nZ_p = Z_p`). So `|𝒢|` is indiscrete, `π₀(𝒢)` is a point, and the set `π₀(ℱ)/K` is
uncountable.

What the proof supplies — `π₀` is a left adjoint, so it commutes with colimits **in totally
disconnected spaces** — makes the lemma true but empties it of the content its applications need. The
distinction is invisible for the compact quotients (the Iwahori at TeX l. 674 and l. 2409, the
profinite `Γ_K` at l. 2495: a quotient of a profinite set by a profinite group is profinite) and
decisive for the three noncompact ones: **Proposition 3.12**, **Proposition 6.6(2)** and **Lemma 6.12**.

*I add to the extraction's account* that none of those three conclusions is contradicted. Each is the
assertion that a torsor under a locally profinite group over a connected base has transitive action on
the components of its total space — which is precisely the statement that has to be proved in place of
the printed lemma.

**E06 and E07 — the reflex field is not assumed normal.** §5 fixes `E` as the reflex field of `μ`
(TeX l. 1743) with no normality hypothesis, while Proposition 5.7 and equation (5.29) quantify over
`τ ∈ Gal(E/K)`. For non-normal `E`, `Aut(E/K)` is strictly smaller than the set of `K`-embeddings, and
the counterexample is decisive: for `Res_{E/K}G_m` with `E/K` a non-normal cubic and `V = E`, the
generic filtration of Definition 5.5 has `Fil¹ = V ∩ Fil¹_μ V_K̄ = 0`, because a nonzero element of `E`
has nonzero image under *every* embedding — while the printed condition, with `Aut(E/K)` trivial, puts
all of `V` in `Fil¹`. Reading `Gal(E/K)` as the set of `K`-embeddings (equivalently: indexing by the
distinct `Γ_E`-orbits inside the `Γ_K`-orbit) repairs both. The repetition E07 identifies — for a
quadratic reflex field and `λ = 0` the printed sum is `2v` — is harmless for the infimum the proof
takes, so the conclusion stands and only the displayed identity is wrong.

### The other errors, all local

| id | where | what |
|---|---|---|
| **E03** | (3.23) | the sequence ends in `π₁(G)_I` where the torus Kottwitz map lands in `X_*(T)_I`: for `SL₂`, `T(L)/T(O_L) ≅ Z` while `π₁(G) = 0`. The conclusion is separately cited from Zhou |
| **E05** | proof of Prop. 4.11 | proves `S(Q_p) ∩ K_p ⊆ S(Z_p)` and then uses the reverse inclusion; `g SL₂(Z₅)g^{-1}` with `g = (1,1/5;0,1)` shows `S(Z₅) ⊄ K`. One word repairs it: `S(Q_p)/(S(Q_p) ∩ K_p)` injects into `G(Q_p)/K_p` and surjects onto `X_*(S)`, which is infinite |
| **E02** | §1.5 | `G(Q_p)/Im(G^sc(Q_p))` is not the maximal abelian quotient for anisotropic groups: `SL₁(D)` over `Q₃` is simply connected with `G° = 1` yet surjects onto `ker(N : F₉^× → F₃^×)` |
| **E04** | Def. 4.1 | the Levi `M` must be **proper**, or `M = G` always works and Example 4.2 is false |
| **E08** | proof of Prop. 6.6(2) | "`G^sc(Q_p)` acts trivially on `π₀(Sht_∞)`" is false unconditionally — for `(SL₂, b=1, μ=0)` the action is simply transitive — and that triviality is essentially the torsor hypothesis the proposition transfers |

**E09–E17** are misprints, each contradicted by the paper's own neighbouring text: the reversed ambient
arrow in the proof of Lemma 3.10; `K₁` for `K₂` in (3.15); `π₁(G̃)` for `π₁(G)` at the end of Lemma
3.16; `μ, b` for `μ_H, b_H` in (3.26); a parahoric group scheme evaluated on the *generic* field in §4;
`μ ∘ f` for `f ∘ μ` (written correctly three other times in the same file); `X_*(T)` for `X_*(T_H)` in
the right-hand Newton square; "no open normal subgroup" for "no **proper** open normal subgroup"; and
`G` for `G^ab` in the torus shtuka after (6.24).

## Four corrections made in place

PROTOCOL §15 requires a Part II to be titled `"<that roadmap's title>, Part II: <what it adds>"`. Four
of the seven were not:

| roadmap | was | now |
|---|---|---|
| `DiamondsAndVStacksIntegralPartII` | Pro-**e**tale descent, … | Pro-**é**tale descent, diamonds and small v-stacks, … |
| `HeckeStacksAndLocalShtukasIntegralPartII` | Hecke stacks and local shtukas, … | Hecke correspondences and local shtuka cohomology, … |
| `HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig` | Hecke stacks and local shtukas, … | Hecke correspondences and local shtuka cohomology, … |
| `PadicHodgeTheoryGenericMonodromyPartII` | p-adic Hodge theory, … | P-adic Hodge theory and geometric comparison, … |

The two Hecke routes had used the roadmap **id** spelled out in place of the parent's atlas title. All
four corrections also bring this extraction into line with the other extractions proposing the same
ids. Nothing else was changed.

## Structure

**153 items** (115 missing, 24 planned, 14 library) and **fifteen routes**: 8 source and 7 Part II.

- Every missing item is routed exactly once. The 24 planned items appear only on **source** routes,
  which §16 expressly allows ("a source route may also name planned items the paper is a good source
  for") — so the 139 routed ids against 115 missing ones is correct, not a defect.
- All fifteen source-route stage ids resolve in `data/atlas.json`, layer-level ids included; all
  fifteen distinct planned references resolve; all 23 library citations resolve at the pinned commits
  recorded in `baseline` (Mathlib `082e2d3`, Tau Ceti `f790474`).
- All seven proposed roadmap ids are free in `data/atlas.json` and all seven areas are galaxy ids.
- **Six of the seven Part IIs join proposals the corpus already carries** — I checked each across the
  paper corpus. The seventh, `PadicHodgeTheoryGenericMonodromyPartII`, is this paper's own, and it
  should be: the generic crystalline monodromy theorem is owned by no layer, and the classical
  absolute-Hodge Mumford–Tate lane sits in the arithmetic reductive Part II, which its brief imports
  rather than duplicates.

**Coverage.** Of the 80 numbered environments in the source, 73 are named in item locators or names.
The seven others are six remarks (1.11, 1.15–1.17, 1.21, 4.4) and Definition 1.18, the `p`-adic
Mumford–Tate group, restated as Definition 5.1 in the body and itemised there (`D53`). The extraction's
claim that "every numbered statement is an item" is right for statements; the report should say
"statement" rather than "numbered environment".

## Left for the design jobs

Two **area** disagreements across extractions, which I record and do not settle:

- `GeometricSatakeLocalModelsPartII`: `padic` here, `arithmeticgeometry` (Kisin–Pappas 18,
  Kisin–Pappas–Zhou 26), `langlands` (Le–Le Hung–Levin et al. 23), `algebraicgeometry` (Kisin–Zhou 25).
- `ReductiveGroupsArithmeticPartII`: `grouptheory` here, against `algebraicnt` ×2, `algebra` ×2 and
  `representations` ×1.

All are galaxy ids and no majority settles either. One roadmap cannot sit in two galaxies, so the job
that merges the briefs must choose.

The design job for the monodromy Part II should also carry the **corrected** generic-filtration
formula, since E06 and E07 invalidate the literal `Gal(E/K)` indexing for a non-normal reflex field;
and the design job for `DiamondsAndVStacks` Part II must plan the restricted component theorem the
paper actually needs, **not** the printed Lemma 3.2.

## What this review did not do

I did not reproduce the published PDF, for the reason given above. I did not re-derive the paper's
proofs, and I did not read the cited suppliers (Gleason's *Specialization*, Gleason–Lourenço, AGLR,
Chen) beyond what the findings required. I read the introduction and §2 in full, every statement the
routes cite, every passage a finding names with its surrounding argument, and §§3, 4, 5.1–5.3 and 6 in
the LaTeX.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-GLEASON-LIM-XU-26.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-GLEASON-LIM-XU-26.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-GLEASON-LIM-XU-26.review.json

All pass. No roadmap change, no library claim and no Lean work is proposed.
