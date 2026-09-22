# Handoff: PAPER-JIANG-ZHANG-20

Claude Code, session `cc-d67081`, 22 September 2026 (issue #1123).

## Done

The extraction is complete. The whole of arXiv 1508.03205v4 was read, including both appendices; the published Annals text is paywalled and was not read. Every missing item is routed exactly once, and `scripts/check_paper.py` reports ok.

Deliverables:
- `research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json` (78 items, 7 routes, 5 source issues);
- the report `research/blueprint/papers/PAPER-JIANG-ZHANG-20.md`.

## Judgement calls for the reviewer

**Two new roadmaps rather than one.** The Gan–Gross–Prasad framework is split out as `GanGrossPrasadConjecturesForClassicalGroups` (8 items). It covers:
- relevant pairs;
- Vogan packets;
- Bessel models and their uniqueness;
- the local conjecture and its known cases;
- Bessel periods;
- the global conjecture.

The paper's own theory is `TwistedAutomorphicDescents` (55 items). The split follows PROTOCOL §15 (one owner for a general notion). At least six queued paper jobs need the same framework: Beuzart-Plessis–Liu–Zhang–Zhu, Beuzart-Plessis–Chaudouard, Beuzart-Plessis–Chaudouard–Zydor, W. Zhang, Li–Liu and Liu et al. Whichever of them is extracted next should import it rather than propose it again.

A reviewer who prefers a single roadmap can merge the eight items into the first layer of `TwistedAutomorphicDescents`. The next GGP paper should then own the framework instead.

**Fourier coefficients attached to nilpotent orbits** are placed in `TwistedAutomorphicDescents`, not in the GGP roadmap. They are Jiang's general framework, of which Bessel coefficients are one case. If another roadmap later needs wave-front sets of automorphic forms, the item `fourier-coefficients` should move to that owner.

**Source routes.**
- Theorem 5.1 = Theorem B.2 (holomorphy of normalized intertwining operators, proved in the paper) goes to AS.2 as a general local result, together with Shahidi's normalization.
- Tadić's unitary dual goes to ET.6.
- Vogan's unitary dual goes to AF.1.
- The Ginzburg–Rallis–Soudry descent goes to ML.5, as in PAPER-BOXER-CALEGARI-GEE-25.

## Source issues

E3 and E4 matter most for a formaliser.
- **E3.** Theorem 4.8 (the unramified computation), in the generality used, depends on a Jiang–Soudry–Zhang preprint that has not appeared. A 2025 paper still cites it as "in preparation". Only Soudry's split orthogonal case is published.
- **E4.** Theorem 2.1 is used for non-quasi-split orthogonal groups, where Arthur gives only an outline. Ishimoto's later work covers the odd orthogonal, generic case.

E1 and E2 are misprints. E5 is a proof the paper omits (Proposition 2.2).

## Remaining

Nothing for this job. The cited inputs were not read. The items that rest on them say so.
