# PAPER-HE-18 handoff

Claude Code — `cc-fb70e5`; issue #1406. **Nothing to resume: the job is finished** and the extraction is `complete`. This note is kept only because a submission may not delete files; it replaces the checkpoint notes of `codex-c83e7a`.

## What the last session did

Read the published paper in full — all 27 pages, every proof and the references — and compared it page by page with arXiv:1610.04791v3; read Haines–Rapoport's *On parahoric subgroups* at its hypotheses and Proposition 13 for finding `E8`. Audited all ten inherited findings at their locators, in rendered page clips where the point is glyph-level: **all ten stand**, three were rewritten (`E1` with the `GL_n` twisted-endoscopy instance, `E3` with the structural reason as well as the square-zero ring, `E4` by support bookkeeping), and three were added (`E11` `θ^{nl}` for `θ^{n_0l}`, `E12` the circular `µ_G(K, µ)`, `E13` `µ_G` for `µ_{G×G}`). Rewrote the checkpoint to-do list as the nine gaps a design job must respect, keeping the ids `G1`–`G9` and their `neededBy` lists so the items' cross-references stay valid. Kept all 123 item identifiers and their seven routes; adjusted `C10`, `F6` and `N17`, whose text stated the findings, to the audited wording. Rewrote the report for a human reader.

The earlier notes recorded unfinished work of a different kind: a programme to repair the paper's own proofs and to read its foundational sources to the bottom. Neither is what a paper extraction owes — PROTOCOL §16 records the first under `gaps` and §18 under `sourceIssues`, and the second is what the routes are for — so both are now recorded there.

## For the review (REV-PAPER-HE-18)

The two findings to check first, because they reach stated results and because the repair is carried by items rather than by the paper:

1. **`E1`.** §2.1(a) claims a θ-twisted conjugacy class of `W̃` meets only finitely many `W_a`-cosets. Twisted conjugation moves the coset by `ω − θ(ω)`, so the image of the class of `w′` in `Ω` is `κ(w′) + (1 − θ)Ω`. For `GL_n` with the twisted-endoscopy automorphism preserving the standard Iwahori — the case §0.1–0.2 motivates the paper with — `Ω ≅ Z` and θ acts by `−1`, so the twisted class of `1` contains `τ^{2k}` for all `k`, all of length `0` and all with `π = (0,0)`: Corollary 9 fails and `X_ν` is not compact. The Newton partition (Theorem 3) is untouched, and `C17`/`N20` replace `X_ν` by a compact core in one `Ω`-coset.
2. **`E4`.** The `(P,Q,x)`-graph of §6.4 is defined with `−^{ẋ}f`, whose support is `ẋ·supp(f)·θ(ẋ)^{-1}` and need not lie in `H_R(Qγ̇)`; the inverse `−^{ẋ^{-1}}f` is what condition (∗) of Theorem 22 and the set-level step of its proof both use. Item `R11` carries the corrected graph, and Theorem 23's kernel with it.

`E5`, `E6` and `G5` are the three places where a reviewer may reasonably want a second opinion: whether "pro-p" suffices for the σ-fixed lifting in Lemma 15 (this extraction says Lang's theorem for a connected pro-unipotent group is what is needed, and notes that a referee had already corrected an earlier version of Lemma 16); whether Theorem 23 is meant over a field (this extraction says the dual argument requires one, since `Hom_{Z[1/p]}(Z[1/p]/ℓ, Z[1/p]) = 0`); and whether §2.6's final inequality needs the non-centrality of `λ_2 − y_0λ_1`, which the compatibility of `κ` with the central component of the Newton point supplies but the paper does not mention.
