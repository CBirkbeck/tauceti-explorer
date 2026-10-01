# REV-RT-PAPER-KISIN-MADAPUSIPERA-SHIN-22

Independent verification of the red team RT-PAPER-KISIN-MADAPUSIPERA-SHIN-22 (Codex, session `codex-rtOQ9t`, PR #5479)
on the extraction PAPER-KISIN-MADAPUSIPERA-SHIN-22 (Kisin–Madapusi Pera–Shin, *Honda–Tate theory for Shimura
varieties*, Duke Math. J. 171 (2022), 1559–1614), for issue #4180.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`codex-c83e7a`, `cc-fb70e5` and `cc-442dc5`; PRs #1679, #1830, #2151 and #2154);
- its review REV-PAPER-KISIN-MADAPUSIPERA-SHIN-22 (`cc-2aeb03`, PR #2526);
- the red team.

None of the findings cites work of mine.

**Result: all four findings confirmed.**
- /1 is filed as high; I would grade it medium.
- /2 and /3 are high.
- /4 is medium.

## What I read

- **The paper.** The author PDF (<https://math.berkeley.edu/~swshin/HT.pdf>), 41 pages, SHA-256 `fd22990b…52db`, equal
  to the extraction's. As before, the Duke version was not collated. I read:
  - §2.2.6 (p. 26), also as a page image;
  - §2.3.1 (pp. 30–31).
- **The extraction.** Items L14, T18, T19, T23 and T26, and sourceIssues E4, E5 and E32.
- **Tau Ceti** at f790474: `IsIsogeny` and `isIsogeny_iff` in `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean`.

## The findings

- **/1 (I would grade it medium): L14's library status.** The pinned declarations define geometric isogenies: finite,
  surjective morphisms of abelian varieties over a field. L14 states the §2.3.1 rational Hom scheme and its R-isogenies.
  - **Why medium.** The status is wrong, but T26 already plans that construction as missing, so nothing drops out of the
    plan.
- **/2 (high): admissibility and central characters.** The paper says "a multiple"; T18 says "a positive multiple".
  - **Why it matters.** T19(ii) quantifies over every character of Z_G. Absent characters give zero parts, so with T18's
    convention every type-D^R datum fails (ii).
- **/3 (high): the accommodating square.** The page image confirms the arrow GSp(V) → ∏ GSp(V_j), which does not exist.
  - **The reverse fails too.** ∏ GSp(V_j) is not inside GSp(V): diag(2I₂, I₂) has unequal multipliers.
  - **The fix.** Use the equal-multiplier subgroup.
- **/4 (medium): T23's Shimura datum.** T23's proof still takes all of X × {h_T} as one datum, against E5's orbit
  correction. For GL₂ and an imaginary-quadratic torus, G′(R) lies in GL₂⁺(R), so the product has at least two orbits.
