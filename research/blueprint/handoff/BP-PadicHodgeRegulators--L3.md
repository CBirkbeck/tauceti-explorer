# BP-PadicHodgeRegulators--L3 — completed planning pass

Issue #967; worker Codex; session codex-whMoP6; 2026-10-06. The bot confirmed this session’s claim before work began. This run takes one job and submits one pull request.

## What is complete

The packet covers exactly PadicHodgeRegulators:L3 and L4, following accepted RS-26. Both stages are **planned**, not closed. The target-level pass is complete under PROTOCOL section 0: every target has a declaration node whose prerequisite chains terminate in checked baseline declarations, exact supplier nodes, requested stages, or a precise gap. All 26 inherited node ids are retained. No implementation status was promoted from unchecked.

Counts: 59 nodes (10 definitions, 14 constructions, 9 lemmas, 23 theorems, 3 comparisons); 78 API items; 72 tests; 12 planets, six per layer; 12 baseline declarations; 10 gaps; 16 supplier requests.

L3 now includes the intrinsic nonnegative crystalline regulator, derivative obstruction and big exponential, auxiliary-weight/twist comparison, general-weight meromorphic extension, ramified and unramified interpolation at every integral twist in the admitted crystalline range, denominator-free singular Euler relations, quotient-slope growth, naturality and the actual integral target, reciprocity and determinant, scalar functional projection, the Tate/raw Coleman sign comparison, and Rubin’s ordinary/multiplicative construction.

L4 now includes good integral Wach basis existence and analytic extension, the noncritical saturated-flag proof route, logarithmic and regulator elementary divisors, the genuinely transported specialization subspaces, actual Coleman images and quotient sequences, corrected rank-two specialization, integral finite cokernel, signed kernels and basis covariance, Rodrigues Jacinto’s admitted character domain, analytic differential powers, vector de Rham regulator and precise interpolation/convergence, the crystalline comparison target, and Rubin’s split-multiplicative augmentation containment.

## Validation and its limits

`python3 scripts/check_blueprint.py research/blueprint/packets/PadicHodgeRegulators--L3.json` reports zero errors and zero warnings. Names of all packet declarations, API items and tests were checked against both companion files; none is missing. Only the four authorized deliverables changed.

The suggested file elaborates with `lean-check` in the shared build at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, with unproved-declaration warnings only. It imports eight individual Mathlib modules, no TauCeti module. The shared build’s TauCeti checkout is not evidence of the pinned TauCeti arithmetic API: baseline searches and source inspection used the separately pinned TauCeti f790474821cf4256814db967cb154e7af3d0c369. No library was rebuilt or updated; no language server was started.

The file contains 65 native definition/lemma/theorem signatures and 46 native example signatures. Native examples include the rational Gamma leading factor, actual tensor projection, filtered linear flag predicate and actual coordinate kernels, as well as the inherited matrix/constraint algebra. Unavailable period, Wach, cohomology, full analytic-distribution and differential-module contracts remain explicit comments, as required by the roadmap’s public API contract. These comments include their API and tests by name. Elaborating the file verifies the algebraic interfaces, not the arithmetic assertions or proofs.

Exact rational regressions in this run passed: 36 constraint bases, 72 projection witnesses, 48 quadratic Euler calculations, 30 basis covariance cases and 17 Gamma factors, plus singular Euler, integral-unit, swapped quotient, nontrivial multiplicative and coordinate-orientation negative controls. These are symbolic computations, not p-adic analytic tests or proof certificates. The scripts and downloaded dependencies lived only in scratch; their counts and mathematical cases are retained here. The earlier checkpoint’s larger test counts are not claimed as this run’s work.

`check_errata.py` is a checker for standalone errata-v1 reports and rejects a blueprint packet by filename/protocol convention. The official blueprint checker validates this packet’s source-issue structure; no deliverable was converted to an errata report.

## Remaining mathematical work

No target is left unplanned; the following inputs prevent either stage from being closed. Resume from the corresponding named gap and nodes in the packet, not by adding unrelated results from the source papers.

1. **Bounded evaluation and image descent:** instantiate the exact kernel/division API on O_E[[X]][1/varpi]. Prove the bounded-to-analytic image comparison needed by LLZ4.12; equal analytic determinant ideals are insufficient for arbitrary bounded submodules.
2. **Authentic arithmetic signatures:** elaborate the genuine PG/PHT/Regulator L0–L2/LAD carriers and comparison maps. Replace comments only with these supplier interfaces. Generic matrix identities do not construct a regulator.
3. **Obstruction exactness:** independently prove/read the Perrin–Riou1994 Section2.2 input cited by Berger p.120. Include the top t^h eigenvectors and invariant quotient.
4. **Determinant normalization:** supply the exact delta(V)/dual-Iwasawa determinant-line theorem used in LLZ4.7, including Perrin–Riou3.6.7 and Colmez1998 IX.4.5. The read reciprocity identities alone do not establish its normalization.
5. **Cyclotomic growth:** prove the one-variable Wach/annulus estimate underlying LZ4.8, then its actual Mellin order-h seminorm comparison.
6. **Integral lower inclusion:** prove the actual lattice inclusion phi(pi)^(k−1)(phi*N(T))^psi0 into (1−phi)N(T)^psi1. LLZ2010 Proposition4.11’s printed rational one-coordinate result with (C),(D) does not alone supply the wider integral input cited in LLZ2011. Retain those restrictions until proved. Finite cokernel is the conclusion, not integral surjectivity.
7. **Differential module and Nakamura comparison:** supply N_rig(D), localization, partial, annulus bounds, nabla_h Delta into D and the actual cohomological exponential comparison. RJ applies to general de Rham Robba modules, with representation-level etaleness imposed only for that separate Iwasawa comparison.
8. **Crystalline de Rham extension/normalization:** preserve the general global-extension target asserted in RJ I.15/I.29; prove its reduction beyond the displayed strict-negative-slope eigenbasis calculation. Prove the exact Amice/Mellin and Gauss/Tate comparison square with LLZ/LZ on the common range. Finite coefficient extension alone does not diagonalize a nonsemisimple phi.
9. **Rubin construction:** acquire/read the appendix of Rubin1998, “Euler systems and modular elliptic curves,” LMS Lecture Notes254, pp.351–367, and supply its integral singular-source construction and injectivity. Rubin’s public book states the result and refers there for its proof.
10. **General-weight codomain:** LZ Section4.4 constructs a normalized regulator in Frac(H_E) for arbitrary crystalline weights. Resolve the printed unqualified L3 H_E codomain by the packet’s proposed weight qualification or an additional proved cancellation range. Do not silently invert logarithmic factors inside H_E.

The packet’s 16 requests identify the supplier and exact consumer nodes: PMIA L0a/L2/L4/L5; LAD L1/L2/L3; PG.2/PG.4/PG.5/PG.6; PHT P7/R06.2; Regulator L2; SelmerIwasawaCohomology L3; AutomorphicGaloisRepresentations R19.5. Exact existing PG psi-boundary, ColemanPowerSeries raw/normalized maps and principal/finite-flat sequences, and PMIA unit-Amice nodes are reused. Generic period, cohomology, measure and Selmer constructions are not replanned here. The proposed PG Part II asks its owner to determine whether the differential-module comparison fits current PG.2 or needs extension. The legacy R11 modular geometric comparison must be resolved through an actual proved supplier, not through a similarly numbered NeronModels layer.

## Sources and submitted corrections

Seven downloaded source versions have URLs, read date, SHA-256 and explicit read sections in the packet: LLZ2011 version of record; LLZ arXiv1006.5163v2; the LLZ2010 Wach author manuscript; Berger2003; LZ arXiv1108.5954v3; RJ2018 version of record; Rubin’s public Euler Systems draft. The LLZ published pp.1127 and1129 were also visually inspected. The supplied “Kolyvagin1990” URL is the Rubin book; that distinction is explicit. Not independently acquired/read: the exact Perrin–Riou and Colmez determinant inputs, the original Frechet–Stein closed-submodule proof used in LLZ2.11, Berger’s underlying Wach comparison input, Nakamura’s exponential comparison, and Rubin1998’s appendix. They are requested or recorded as gaps, not presented as read proofs.

E301 and E302 are retained, with fresh published/preprint collation. E301’s maximal-ideal repair is already explicit in preprint Remark5.12; E302 corrects the reversed inclusion when adding an evaluation condition. New E303 records the apparent swapped quotient functional in published Proposition5.9, and its coefficient-field qualification, against the preceding ordered-coordinate equation. At p=5,a_p=0 the vector (1,2) lies in the specified image line but the printed functional is nonzero. E304 records the bounded/analytic scalar-ring distinction in Corollary4.13; E305 records the required fixed-coordinate matrix transport in Proposition4.11. Both use the actual source basis and decomposition, not an arbitrary replacement map. None of these findings has an independent-review verdict or a novelty claim. The packet records the correction search and exact source versions.

## Out-of-scope handoff from the issue

GSWZ D.1–D.4 and RT-AREA-ktheory-2/15 are outside the exact L3/L4 scope. Their owning job must add D.1 → D.2 and K3BlochGroups:V.4 → D.2, or a proved direct D.1 → HabiroNumberFields:HB.7 supply, so that the dilogarithm and valid Bloch-group model reach the Habiro consumer. It must follow Theorem9’s four-step proof, supply the unproved completed-map/p²-integrality input E39, exclude zeta=1 and use ord(zeta)[zeta] under E38, and retain the corrected Example4.3 5-adic acceptance test under E56. No out-of-scope packet, atlas data or graph file was edited.

The next step for this submission is independent review of the completed plan, including E303–E305 and the breadth/ownership choices. Mathematical follow-up must discharge the ten precise gaps; this run does not take a second job.
