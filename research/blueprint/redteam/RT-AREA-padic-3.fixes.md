# RT-AREA-padic-3: fixes

Fixer: Claude Code, session `cc-e94dc5`, 29 September 2026 (issue #3977).
- Findings: `RT-AREA-padic-3.result.json`.
- Verdicts: `RT-AREA-padic-3.review.json` and `research/blueprint/reviews/REV-RT-AREA-padic-3.md`.
- One finding checked and confirmed (/1); the red team's supplemental findings /2 and /3 have no verdict and are not part of this job.

The only edited file is `research/blueprint/papers/PAPER-DING-25.result.json`, and in it only the item
`PAPER-DING-25/4.2-global-triangulation` (its `name`, `statement`, `locator` and `note`). Its id, kind, status,
owner (`PhiGammaModulesAndIwasawaCohomology:PG.7`) and source route are unchanged, as the finding and the review
ask; no other item, route, source issue or roadmap file is touched. `python3 scripts/check_paper.py` reports the
file `ok`.

## /1 (medium, error): the global-triangulation item now states the theorem with its hypothesis package

**The defect.** The item said that "a family of Galois representations over a reduced affinoid with a
Zariski-dense set of trianguline points is trianguline after shrinking". That drops the data both sources
need: an ordered family of continuous characters specialising to the parameters at the dense set, strict
triangulinity there, and — in Ding's application — the distinguished non-critical, φ-generic point around which
one shrinks. It also promises a triangulation near an arbitrary point from density alone.

**Checked.**
- Kedlaya–Pottharst–Xiao, *Cohomology of arithmetic families of (φ, Γ)-modules*, J. Amer. Math. Soc. 27 (2014),
  published text (https://www.mathi.uni-heidelberg.de/~otmar/lehre/seminare/KPX.pdf, read 29 September 2026):
  Definition 6.3.1 (trianguline with ordered parameters; strictly trianguline over a point), Definition 6.3.2
  (Zariski dense subsets; densely pointwise strictly trianguline: continuous characters δ_1, …, δ_d and a Zariski
  dense set at which the fibres are strictly trianguline with the specialised parameters), pp. 1102–1103;
  Corollary 6.3.10, p. 1108: for X reduced, canonical data of a proper birational f : X′ → X and a unique
  filtration of f^*M by coherent (φ, Γ_K)-stable submodules, with an exceptional Zariski-closed Z disjoint from
  f^{-1}(X_alg), graded pieces embedding into R_{X′}(π_K)(δ_i) ⊗ L_i with cokernels killed locally by a power of
  t and supported on Z, gr_1 an isomorphism, and X′ = X for smooth curves. No irreducibility of connected
  components is assumed.
- Ding, *p-adic Hodge parameters in the crystabelline representations of GL_n*, proof of Proposition 4.17: the
  family ρ_X on a small affinoid around z_w, the ordered characters δ_{X,i}, and assertion (iii) that
  D_rig(ρ_{X,℘̃}) is a successive extension of R_{K,X}(δ_{X,i}|·|_K^{2i−(n+1)}ε^{1−i}), obtained "as D :=
  D_rig(ρ_{x_w}) is non-critical and (φ-)generic, by [5, Thm. 5.3] (and an easy induction argument) … (by
  shrinking X if needed)", [5] being Bergdall's paraboline variation. The review checked this on the published
  p. 69; the full published PDF could not be fetched from Centre Mersenne here (the download stopped after 26 of
  74 pages), so the passage was read in arXiv:2407.21237v2, where it has the same content.

**Changes (item `PAPER-DING-25/4.2-global-triangulation`).**
- `statement`: now Kedlaya–Pottharst–Xiao Corollary 6.3.10 with Definitions 6.3.1–6.3.2, stated over the relative
  Robba ring R_X(π_K) of a reduced rigid space with all its hypotheses (global continuous ordered characters, a
  Zariski-dense set of closed points, strict triangulinity there) and all its conclusion data (proper birational
  modification, unique coherent filtration, exceptional closed locus disjoint from the dense set, line-bundle
  graded pieces with t-power-torsion cokernels supported on it, gr_1, the curve case). The shrinking consequence
  is stated only as triangulinity on the dense Zariski-open complement of the exceptional locus, and the item
  says explicitly that no triangulation near an arbitrary prescribed point follows from density alone and that
  pointwise existence of unspecified triangulations does not suffice.
- `name`: "Global triangulation of densely pointwise strictly trianguline families (Kedlaya–Pottharst–Xiao)".
- `locator`: adds the Kedlaya–Pottharst–Xiao locators to the Ding locators and names the proof of Proposition
  4.17.
- `note`: records how Ding uses the theorem — locally, in Bergdall's paraboline form, on a small affinoid around
  z_w, with the ordered characters δ_{X,i}·|·|_K^{2i−(n+1)}·ε^{1−i}, because D_rig(ρ_{x_w}) is non-critical and
  φ-generic, after shrinking — and points to the neighbouring item `PAPER-DING-25/4.2-pseudo` (iii), which already
  carries that local application with its hypotheses, rather than duplicating it. It states that smoothness at
  z_w is a conclusion of Proposition 4.17 and not an input of the triangulation step, and that the published
  corollary assumes no irreducible connected components.

This follows the review's second option (a general Kedlaya–Pottharst–Xiao export, the object PG.7 owns), with the
local Ding application left to the neighbouring item as the review suggests; the two items no longer make
incompatible statements.

## Not changed

No source paper is corrected (neither published text is in error), no owner, route or stage edge changes, and
no restriction absent from the published corollary is added. The generated `data/items/89.json` is rebuilt from
the paper file by the maintainer's pipeline and is not edited here.
