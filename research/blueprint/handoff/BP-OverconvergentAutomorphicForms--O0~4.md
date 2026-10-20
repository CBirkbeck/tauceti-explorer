# BP-OverconvergentAutomorphicForms--O0~4: revision round 4 (complete)

Claude (Opus 5.5) — session `claude-wn493I`, 20 October 2026. Refs #11299.

The packet is `complete` and goes to independent review. 79 nodes: 74 retained ids and 5 new O5/O6 nodes. Stage coverage:

| Stage | Status |
| --- | --- |
| O1, O2, O4, O6 | closed |
| O0, O3, O5, O7 | planned, each with one precise remaining input |

The packet has one supplier request and three recorded gaps. `check_blueprint.py` reports 0 errors and 0 warnings. `intake.py check-files` reports 0 problems on the three deliverables. The suggested Lean file compiled with `lean-check`: exit 0, 16 warnings, all `declaration uses sorry`. Every implementation status is unchecked. The `review` object of REV~3 and the review history are left in place for the next reviewer.

## How the REV~3 findings are resolved

**§13 typed-name finding (151 of 199 names untyped).** It is resolved by the binding Suggested.lean shape of 2026-10-12 and 2026-10-19 (WORKERS.md; PACKAGE_REVIEW.md, "Shape of a roadmap"; UPSTREAM_GUIDE.md, headline theorems and examples). The file now states only what is easily stated on carriers that exist at the pins:

- 𝒪_p, its norm and principal units;
- the point characters and the weight map with its sign;
- the totally positive and congruence-unit cancellations;
- right cocycles and the left-to-right adapter;
- the valuation step of the integral AIP comparison.

Everything else is a README target. That covers rigid weight spaces, analytic induction, coefficient sheaves, Hilbert towers, AIP torsors, compactifications, Hecke correspondences and Igusa completions. A sorry'd carrier or a long ad hoc encoding is exactly what those rules forbid.

The file is 276 lines with `import Mathlib` only. It has four proved discriminating examples and no sorry'd example. A short closing comment lists, layer by layer, the heavy targets that live only in the README. The reader states all 79 targets with every hypothesis, API item, test and acceptance clause.

This is the same shape that the accepted root assembly review (REV-OverconvergentAutomorphicForms, 2026-10-20) accepted for these very nodes. The previous round's auxiliary cores (`FiniteCoefficientCore`, `OrdinaryAffineCompletion`, `ValuationTranslation`) are removed. They were constructions or chains of auxiliary lemmas, which are now banned, and REV~3 had already found that they did not discharge the node contracts.

The O1 cocycle API names now use the node's own declaration namespace, `TauCeti.Overconvergent.RightCocycle.*`, so that the packet, reader and Lean names agree.

**No mathematical finding was open in REV~3.** Its node verdicts were "verified" or "unverifiable (prototype missing)". The mathematical contracts are now the effective contracts of the accepted root assembly: `importedTargets` of `packets/OverconvergentAutomorphicForms.json`, reviewed and accepted on 2026-10-20.

That brings in the root review's corrections to these layers:
- full norm versus unit norm (O0/norm-at-p);
- finite versus infinite-level line effectivity (O2/geometric-hilbert-sheaf);
- the completed effective deck group and central kernel of the arithmetic presentations (O4, with the root node O4/effective-arithmetic-descent cited from the root packet);
- analytic-family Koecher (O6/hilbert-koecher);
- arithmetic wild-Hecke transport (O6/wild-hilbert-hecke).

It also brings in the root's exact supplier node prerequisites in place of bare stage ids. Source issues E1–E9 are taken with the root review's verdicts; E7–E9 are new to this part.

## Consuming upstream pull requests (maintainer instruction)

The supplier readers were fetched from TauCetiRoadmap with `gh api`, as data, on 2026-10-20:
- main: PadicMeasuresIwasawaAlgebras, PerfectoidSpaces, AdicSpacesPartII/III/IV, PadicFunctionalAnalysis;
- open PRs, at their current heads:
  - #854 LocallyAnalyticDistributions, 3fd4e00;
  - #1035 CompletedCohomologyPartII, 1337958;
  - #1069 AutomorphicBundles, 218de51;
  - #1084 HodgeTateAndCanonicalSubgroups, c024ddc;
  - #1005 HilbertModularVarietiesAndShimuraCurves, 5db7b73;
  - #1085 PerfectoidShimuraVarieties, 21b9aa1;
  - #1053 ShimuraCompactifications, b5675ac;
  - #816 PerfectoidTowers, 537fec2 (newer than the 8ce4506 in `tauceti_status.json`).

Every consumed atlas node was located in its upstream section. Sonnet subagents drew up the node-to-section tables; I read the decisive passages myself. The README's "Exact supplier contracts" table cites the upstream sections. The thirteen old requests and their gaps are resolved as follows.

| Old request / gap | Resolution |
| --- | --- |
| PMIA L0a: rigid compact-torus weight spaces | PMIA (main) builds no rigid structure: its consumers build it on the supplied universal property, and only ℤ_p^× is treated. Replaced by `LocallyAnalyticRepresentationsOfLocalGroups:LR.6/character-variety`, which represents locally analytic characters of topologically finitely generated abelian groups such as 𝒪_p^×, plus LocallyAnalyticDistributions §4.15. Request and gap removed. |
| CC.8: Ding's general-n single-place completed coefficients | CompletedCohomologyPartII §8.5 is GL_3 with all p-places varying. The adapter is now planned in O0/unitary-completed-coefficients: finite double cosets with trivial stabilizers at small level give Π\|H≅C(H,E)^s, s≥1. Request removed. |
| LR.6: Jacquet eigenvariety geometry | Kept. LR is an atlas roadmap, not upstream. This is the one remaining request and gap. |
| P9: all-open O/O⁺ descent | Supplied by PerfectoidTowers §P9.11 (`weight-extension-sheaf-equalizer`, on every open of the product). Atlas ids `PerfectoidSpaces:P9/*` are PerfectoidTowers layer P9. |
| P9: AIP B_m-torsor invariants | HodgeTate line 32 leaves "tower structure-sheaf invariants" to O5. New node **O5/aip-torsor-structure-invariants**, proved by étale local triviality and AdicEtaleGeometry A1. |
| T4: equality endpoint ε=1/(c_p p^m) | Upstream §4.6 excludes the endpoint for p≥3 and keeps it for p=2. All 38 common range hypotheses now use the upstream range, with ε≤p^(−3) at a ramified prime when m=1 (§§3.10, 5.1). |
| T4: unsplit ramified canonical generator | Supplied by HodgeTate §3.12 (n≥2, or p unramified, or H=H′[p^n]) and §4.7. The hypotheses of O2/admitted-hilbert-domain, O2/hilbert-automorphy-factor and O5/geometric-aip-comparison cite them. |
| T5: full-character integral generator | HodgeTate leaves it to O5. New node **O5/finite-character-integral-generator** gives invertibility of w_χ, the unit generator on the split cover over the tower and the twisted-descent description. Integral local freeness on the base is a gap owned here, with a model non-example showing why a unit eigenfunction upstairs is not enough. |
| T5/P9: ordinary models and tower completion | Formally smooth ordinary charts (HodgeTate §5.1; AIP ADIC §7.1), reduced reduction (AdicSpacesPartII R0) and spectral norms (AdicSpacesPartIII R3). The one remaining input, the unit ball after base change to the nondiscrete L, is a narrowed gap owned by O7. |
| C6: cusp higher vanishing | ShimuraCompactifications stops at π_* (C6.42). New node **O6/hilbert-cusp-higher-vanishing** (AIP CUSP Appendix Prop. 6.4, AIP ADIC Thm. 8.2): R^i h′*L(−D)=0 for torsion L. |
| C6: bounded-family Koecher | O6/hilbert-koecher now goes through the ordinary locus, as in AIP ADIC Proposition 8.4, using ShimuraCompactifications C5.22, C5.24 and C5.26. |
| B5: p-level family q-expansions | AutomorphicBundles (lines 138–140) leaves them to consumers. New construction **O6/padic-hilbert-q-expansion**, with API, four tests and an expansion principle over components of the ordinary Igusa tower. |
| AIP Theorem 6.7(3) | Assigned to O5 by HodgeTate line 32. New comparison **O5/aip-frobenius-restriction**. |
| Numerical radius gap; eight "prototype carrier" gaps | Removed. The root dropped the radius gap: the existential radius suffices, and E3 is retained. The prototype gaps belonged to the old reading of §13 and are not mathematics. |

**Ownership moves recorded.** The torsor invariants, the finite-character generator and Theorem 6.7(3) are O5 here, on HodgeTateAndCanonicalSubgroups' own boundary statement. Family q-expansions are O6, on AutomorphicBundles' boundary statement. Higher cusp vanishing is planned in O6, and the restructure entry says that a later ShimuraCompactifications Part II should import it. The PadicMeasuresIwasawaAlgebras/LAD rescope and the old ShimuraCompactifications Part II proposal are replaced accordingly.

## For the orchestrator

- The accepted root packet `OverconvergentAutomorphicForms.json` records the old SHA-256 of this part (`fc95550c…`). Its `importedTargets` do not yet contain this round's changes: the five new nodes, the upstream ε range, the supplier rewording and the RightCocycle API names. Refreshing the root is outside this job's files.
- The new part SHA-256 is `118e2de9291aa87dbf9f074331c4ba128d8eb9dde2e7141116b05352af9b1995`.
- No upstream file was changed. An upstream note records that PerfectoidSpaces P9 is now PerfectoidTowers P9, and that AdicSpacesPartII R3/R5 are now AdicSpacesPartIII R3 and AdicSpacesPartIV R5.

## Remaining (precise)

1. O0: the Hecke eigenvariety geometry of Ding §4.2.2 (dimension n·d_K, Cohen–Macaulayness, reducedness), requested from `LocallyAnalyticRepresentationsOfLocalGroups:LR.6`.
2. O3/O5: integral local freeness of full-character AIP sheaves at positive radius for nontrivial, in particular p-primary, finite characters. This is open and owned here, and the comparison theorems do not use it.
3. O7: the unit ball R_i⊗̂O_L=(A_i⊗̂L)° of ordinary Igusa charts after base change to the nondiscrete perfectoid L.

## Sources and checks

- AIP ADIC author PDF re-fetched; its SHA-256 matches the packet. Read: §6.3–6.4 with Theorem 6.7; §8.3 with Theorem 8.2 and Corollary 8.3; §8.4 with Proposition 8.4 and the q-expansion paragraph.
- Locators of the other sources are carried over from the reviewed contracts.
- No source passage is copied into the repository. No restricted book was used.
- No suspicious instruction was met in fetched text.
- Scratch files (upstream readers, scripts) stay outside the repository.
