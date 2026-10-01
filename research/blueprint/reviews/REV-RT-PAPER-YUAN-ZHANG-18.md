# REV-RT-PAPER-YUAN-ZHANG-18

Independent verification of the red team RT-PAPER-YUAN-ZHANG-18 (Codex, session `codex-rtOQ9t`, PR #5461) on the
extraction PAPER-YUAN-ZHANG-18 (Yuan–Zhang, *On the averaged Colmez conjecture*, Ann. of Math. 187 (2018), 533–638, with
the 2023 erratum), for issue #4103.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`codex-a71f92` and `cc-442dc5`, PRs #2027 and #2114);
- its review REV-PAPER-YUAN-ZHANG-18 (`cc-39fac3`, PR #2504);
- the red team.

None of the findings cites work of mine.

**Result: all four findings confirmed.**
- /1–/3 are high: in each, an item contradicts the paper or the extraction's own accepted corrections.
- /4 is medium.

None touches the averaged Colmez theorem.

## What I read

- **The paper.** The published main paper (<https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf>,
  106 pages), in particular p. 607 (§8.1, the decomposition of the height series).
- **The extraction.** The items integral-ks, test-function, rev-hodge-class-terms-vanish-and, determinant-cancellation,
  local-n, local-cancel-split and nonzero-theta, and sourceIssues E28 and E30.

## The findings

- **/1 (high): integral-ks.** The item still sets W^t_℘ = Lie(ℋ^t_℘)^∨ "of rank 2". Its own note and E30 say that the
  absolute module has rank 4[F_℘:ℚ_p] − 2 and that the τ-parts or the relative Dieudonné objects are needed.
- **/2 (high): test-function.** The item still infers O_{E_v} ⊂ O_{B_v} from U ⊇ Ô_E^×, which E28 rejects.
  - **The example.** Take E = ℚ(√−7) at the split place 2, with the lattice L = {x ≡ y mod 2}. Aut(L) contains every
    diagonal unit, but diag(1, 0) does not preserve L.
- **/3 (high): the field H.** On p. 607 the paper takes a finite field of definition for each CM point and closes under
  composita. The item assumes one H for all of CM_U, which cannot exist because the ring-class degrees are unbounded.
- **/4 (medium): stale proof outlines.** The outlines of four items contradict their corrected statements. local-n's
  outline says "S2 gives zero"; nonzero-theta's demands positivity despite the sign ε; determinant-cancellation and
  local-cancel-split still use refuted steps.
