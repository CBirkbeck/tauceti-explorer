# REV-RT-PAPER-BHARGAVA-GROSS-WANG-17

Independent verification of the red team RT-PAPER-BHARGAVA-GROSS-WANG-17 (Codex, session `codex-rtOQ9t`, PR #5495) on
the extraction PAPER-BHARGAVA-GROSS-WANG-17 (Bhargava, Gross and Wang, *A positive proportion of locally soluble
hyperelliptic curves over Q have no point over any odd degree extension*, JAMS 30 (2017), 451–493), for issue #4281.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-fb70e5`, PR #1918);
- its review REV-PAPER-BHARGAVA-GROSS-WANG-17 (`cc-7b31c4`, PR #2403);
- the red team.

None of the findings cites work of mine.

**Result: all four findings confirmed, all high.** /2 and /3 are errors in the paper itself, and /1 and /4 are errors in
the extraction. None of them touches the paper's main theorems.

## What I read

- **The published text.** The author-hosted JAMS PDF (<https://www.math.uwaterloo.ca/~x46wang/Papers/hyper.pdf>), 43
  pages, SHA-256 `1e553de8…d0db4`, the same file as the red team's. I read:
  - pp. 452–453 (two-covers, W[2], Sel₂(J¹));
  - pp. 466–468 (Theorems 24–25, Proposition 26 and its proof);
  - p. 477 (the definition of I_f(k));
  - p. 479 (the proof of Proposition 34), on the page image.
- **arXiv v2** (<https://arxiv.org/pdf/1310.7692v2>), 42 pages, SHA-256 `8833a226…4c4f2`, the extraction's file. I read
  the same passages:
  - pp. 2–3;
  - Proposition 26 on p. 16, on the page image;
  - the I_D display on p. 27, on the page image.
- **The extraction.** Items 3, 5, 29 and 39, its source issues E1–E5, its report, and the extraction review. Neither
  the source issues nor the review treats any of the four points.

## The findings

- **/1 (high): a two-cover of an arbitrary torsor has no canonical class.** The paper defines two-covers of any J-torsor
  I. It attaches the fibre Y[2] and its class in H¹(Q, J[2]) only to covers of J ("the fiber over the origin", p. 452).
  Item 3 attaches the class to every two-cover of I.
  - **The repair is standard.** Two-covers of I exist if and only if δ[I] = 0 in H²(Q, J[2]). When they exist, their
    classes form an H¹(Q, J[2])-torsor, and moving a base point by b changes the fibre class by the Kummer class of b.
- **/2 (high): Sel₂(J¹) is not always the fibre of Sel₄(J) over W[2].** Composing with J¹ → J gives a map onto that
  fibre whose fibres are orbits of J(Q)[2]/2J(Q)[4].
  - **The fibre's size.** I checked that the fibre over 0 is exactly ι(Sel₂(J)). Its size is
    |Sel₂(J)|/|J(Q)[2]/2J(Q)[4]|.
  - **The example, by hand.** For y² = x³ − x, the three equations x(2P) ∈ {0, 1, −1} become (x² + 1)² = 0,
    (x² − 2x − 1)² = 0 and (x² + 2x − 1)² = 0, with no rational roots. So the ratio is 4. The quartic model
    v² = −2u(u − 1)(u + 1)(3u − 1) puts this curve in the paper's family.
  - **What I did not check.** I did not re-read §8 for the red team's remark that the counting proofs need only the
    nonemptiness equivalence.
- **/3 (high): Proposition 26 needs g(a) ≠ 0.** At a root of g the class f₀g(a) = 0 is not in K×/K×², and the proof's
  cocycle σ√α/√α is undefined. Theorem 25 survives:
  - an infinite K has a non-root a;
  - over a finite K, H²(K, J_m[2]) = 0, so both obstruction classes vanish.
- **/4 (high): the index of I_f is (n − 3 − m)/2.** The page images of both versions put the whole of n − 3 − m over 2.
  The squared ideal on the same page has I_f(n − 3 − m). For n = 4 and m = 1 the index is 0, and I_f(0) = R_f by the
  definition on p. 477. The extraction's I_f(n − 3 − m/2) is a transcription error and needs no source issue.
