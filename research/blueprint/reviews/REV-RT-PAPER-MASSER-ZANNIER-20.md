# REV-RT-PAPER-MASSER-ZANNIER-20

Independent verification of the red team RT-PAPER-MASSER-ZANNIER-20 (Codex, session `codex-rtOQ9t`, PR #5368) on the
extraction PAPER-MASSER-ZANNIER-20, for issue #5060.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-fb70e5`, PR #4020);
- its review REV-PAPER-MASSER-ZANNIER-20 (`cc-58621d`, PR #4704);
- the red team.

**Result: all three findings confirmed.** /1 and /2 are high, /3 medium. None of them touches the main theorems.

## What I read

- **The paper.** Masser–Zannier, *Abelian varieties isogenous to no Jacobian*, Annals of Mathematics 191 (2020), the
  published PDF (<https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf>), SHA-256
  `8b76bfac…74b60`, equal to the red team's. I read p. 637 (Theorem 1.1 and the sentence after it), p. 666 (the end of
  §5.2) and pp. 668–670 (§5.4).
- **The extraction.** Items 19–23, 56, 58 and 66, and route 1 with its reason.
- **The other owners.** PAPER-MOK-PILA-TSIMERMAN-19 route 1 with its brief and accepted verdict, and the LD.6 stage text
  in `data/atlas.json`.

## /1 (high, error): a transcendental analytic hypersurface. Confirmed.

The paper constructs W locally. On pp. 669–670 the coordinate functions "are analytically dependent locally at each
point of [1, 2]", and compactness and a product of local equations give a hypersurface near the curve K.

A closed analytic hypersurface of A_g cannot be transcendental when g ≥ 2:
- the Satake boundary has dimension G − g ≤ G − 2, which is less than dim W = G − 1;
- so, by Remmert–Stein, the closure of W in the projective Satake compactification is analytic;
- so, by Chow, it is algebraic.

Item 66's "complex analytic hypersurface W ⊂ A_g … transcendental" is therefore false as stated. W should be stated in
an open neighbourhood of K, and the paper's imprecision recorded as a new sourceIssue.

## /2 (high, missing): rational 16-torsion. Confirmed.

The paper's statements:
- **Theorem 1.1 (p. 637)** has no torsion clause.
- **The sentence after it and the end of §5.2 (p. 666)** claim that the field of definition also defines the points of
  order 16, "by the definition of Γ(e, 2e)".

That does not follow. The theta model V_16 is defined over Q. If all of A[16] were K-rational, the Weil pairing would
force μ_16 ⊂ K. The construction allows real fields: at τ = i·I_g the theta quotients θ_{m0}(16τ)/θ_{00}(16τ) are real.

Item 58 folds the remark into Theorem 1.1, and item 56 asserts it. Item 58 should state Theorem 1.1 as printed, with the
torsion clause split off as a separate gated item and recorded as a new sourceIssue (gap).

## /3 (medium, duplicate): functional transcendence at LD.6. Confirmed.

LD.6's contract takes definability of uniformization and functional transcendence from separate suppliers. Its
acceptance requires "independent orbit and functional-transcendence suppliers".

The extraction nonetheless:
- plans items 19 and 21 at LD.6;
- routes items 20, 22 and 23 there.

The accepted LogicAndDefinabilityPartII of PAPER-MOK-PILA-TSIMERMAN-19 claims the same objects, and route 1's reason
admits "one owner is to be chosen at design time". The fix keeps the counting items at LD.6 and moves 19–23 to the
Part II.
