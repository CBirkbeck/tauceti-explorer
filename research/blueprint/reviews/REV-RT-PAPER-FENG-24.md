# REV-RT-PAPER-FENG-24

Independent verification of the red team RT-PAPER-FENG-24 (Codex, session `codex-rtOQ9t`, PR #5483) on the extraction
PAPER-FENG-24 (Tony Feng, with an appendix by Feng and Lonergan, *Smith theory and cyclic base change functoriality*,
Forum Math. Pi 12 (2024)), for issue #4211.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-7b31c4`, PR #1970);
- its review REV-PAPER-FENG-24 (`cc-39fac3`, PR #3314);
- the red team.

None of the findings cites work of mine.

**Result: all four findings confirmed, all high.** None claims that the base-change theorem is false.

## What I read

- **The paper.** The published open-access PDF from Cambridge Core (<https://doi.org/10.1017/fmp.2023.32>), 66 pages,
  downloaded on 1 October 2026. Cambridge stamps each download, so its SHA-256 differs from the red team's, but the page
  content matches. I read:
  - p. 16 (proofs of Lemmas 3.7 and 3.9);
  - §5.1.7 and §5.2.1 with Definition 5.1 and Construction 5.2 (pp. 32–34);
  - Lemma 5.7 and its proof (p. 37).
- **The extraction.** Items 13, 56, 60 and rev-6, and sourceIssues E35 and E41.

## The findings

- **/1 (high): Lemma 5.7 and ramified covers.** The proof turns a σ-linearisation into a descent datum, which is Galois
  descent and needs X′ → X étale; §5.1.7 allows any cyclic degree-p cover.
  - **The counterexample.** I checked the red team's F₇ example (t = u³, σ(u) = 2u, frame u, linearisation by 4). It is
    σ-fixed with no framed automorphisms, but does not descend: inertia acts by 4 at u = 0.
- **/2 (high): admissible families need linearity.** Definition 5.1 asks only for fusion isomorphisms, so the constant
  functor gives S = id at x = 0, against the relations. The missing hypothesis is k-linearity. Add other conditions only
  if the proof of the relations needs them.
- **/3 (high): the creation map is ill-typed.** Construction 5.2 applies H_{0}, a functor on Rep_k(^LG), to x, which is
  only Ĝ-equivariant. For W = k(χ) with χ a quadratic Galois character, x = 1 is not a morphism of ^LG-representations.
- **/4 (high): the review-added bound.** Item rev-6 claims a relative-dimension bound for Rj_*. For G_m ⊂ A¹ (relative
  dimension 0) and coefficients F̄_3[C_3] over F̄_7, R¹j_* is nonzero at 0. The paper claims only that finite
  tor-amplitude is preserved.
