# Handoff: PAPER-BOXER-CALEGARI-GEE-25

Claude Code, session `cc-d67081`, 22 September 2026 (issue #1412).

## Done

The extraction is complete. The whole published article (J. Amer. Math. Soc. 38 (2025) 509–520, publisher's offprint) was read. It was compared in full with arXiv v3, and with v1, v2 and Boxer's homepage copy for the history of the source issues. Every missing item is routed exactly once, and `scripts/check_paper.py` reports ok.

Deliverables:
- `research/blueprint/papers/PAPER-BOXER-CALEGARI-GEE-25.result.json` (96 items, 10 routes, 8 source issues);
- the report `research/blueprint/papers/PAPER-BOXER-CALEGARI-GEE-25.md`.

## Judgement calls for the reviewer

**Two Part IIs.** Following PROTOCOL §15, each general theory goes to its owner.
- `LevelOneCuspidalCohomologyGLn` (Part II of ModularityAndLanglandsExtensions) takes the paper's own mathematics: level-one cuspidal cohomology of GL_n(Z), the two change-of-weight theorems, and their instances. It starts where ML.3 (Newton–Thorne) stops.
- `PolarizedAutomorphyLifting` (Part II of PotentialAutomorphyInfrastructure) takes the cited automorphy lifting and finiteness theorems of Thorne and BLGGT. Nothing in the atlas plans definite unitary groups or these theorems, although ML.2 and ML.3 also need them.

A reviewer who prefers a single new roadmap for the paper would merge the first Part II into it. The second Part II would still be needed.

**Cuspidal cohomology** is routed to AutomorphicSpectralTheory AS.5 in its general form. PAPER-FU-24 (partial) proposes the same notion in its own Part II of ArithmeticLocallySymmetricSpaces. Whichever is accepted should be the one owner.

**Computational data.** The paper's explicit data (the coefficients of ΔE₄²E₆, the weight-82 companion, the weight-38 non-ordinary form, and Remark 3.3's lists) go to ComputationalNumberTheory CN.3 as certificates. The Part II imports them.

## Source issues

E4, E6 and E7 matter most.
- **E4.** θ must be θ′ in the map R_F → R and in the automorphy step of Theorem 3.1. The check is the multiplier and the Hodge–Tate weights.
- **E6.** Theorem 3.1 needs local–global compatibility at l = p for every local component (Caraiani 2014) to get level one at p. BLGGT14 Theorem 2.1.1(4) covers only Iwahori level.
- **E7.** Remark 3.3's list for Theorem 2.1 wrongly includes p = 151: the only companion pair there has gcd(p−1, k−1) = 3.

The computations behind E4, E7 and the item notes were run in the worker's scratch space and are not part of the repository:
- level-one Hecke data mod p;
- exact q-expansions;
- Brauer characters of SL₂(F_q);
- the checks of (2.1.1), (2.1.2) and the tensor identities.

Each check is described in the item notes and in the issues.

## Remaining

Nothing for this job. Five cited sources were not openly available and were not read: Clozel 1990, Harder–Raghuram, Gross 1990, Swinnerton-Dyer 1973 and Fermigier 1996. Nor was the published version of Thorne 2017. The items that rest on them say so.
