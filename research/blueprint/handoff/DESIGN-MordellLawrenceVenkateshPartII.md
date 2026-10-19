# DESIGN-MordellLawrenceVenkateshPartII

Worker: Codex, session codex-VNtbmR. Issue: #3352. Date: 2026-10-19.

## Delivered and closure status

The roadmap definition, full-scope blueprint packet, reader and compact suggested Lean file are complete as a **target-level planning pass**, ready for independent review. All 39 Lawrence–Sawin and 22 Lawrence–Venkatesh items routed to this continuation are assigned explicitly in `targetDispositions`; their overlaps share nodes. There is one continuation, with eleven layers M2.0–M2.10.

The packet contains 79 nodes: 17 definitions, 13 constructions, 10 comparisons, 33 theorems, 5 lemmas and 1 application; 93 API items, 90 discriminating checks, 39 planets and 4 read baseline declarations. Every definition and construction has three checks. There are nine named gaps and 21 precise stage requests. All eleven layers are **planned**, none **closed**; implementation status is unchecked throughout. No implementation or independent-review verdict is claimed.

The reader gives the full statements, proof outlines, definitions, interfaces, checks, worked examples and ownership boundaries. Following WORKERS and the binding 2026-10-12 roadmap shape, Lean contains only three light definitions over pinned finite numerical carriers, three milestone signatures and six examples. Heavy realization, group, period and moduli carriers remain mathematical targets in the reader.

## Sources and version limits

Read Lawrence–Sawin arXiv:2004.09046v5 (16 October 2025), Definitions 5.1–5.46 and Lemmas 5.12–5.52, pp. 40–62, §§6–9, pp. 63–88, and Appendix A, pp. 89–92. Read the publisher-formatted Lawrence–Venkatesh Inventiones 221 (2020), pp. 893–999, especially §2.3, pp. 904–907 and §§9–12, pp. 963–996; cross-collated arXiv:1807.02721v3. **The published non-strict first numerical inequalities govern.** Read Beauville, LNM 1194, §§1–3, printed pp. 8–12, Théorèmes 2 and 4; Batyrev–Cox arXiv:alg-geom/9306011v1, §10, PDF pp. 30–34, Theorems 10.6 and 10.13 and Remark 10.14. URLs, hashes and reading dates are in the packet.

The Lawrence–Sawin publisher metadata/DOI was checked, but publisher article text was not obtained. All LS source findings are explicitly **preprint v5 findings**, requiring collation with the version of record before journal-level errata attribution. The projective Jacobian formula is supported by the publicly available Batyrev–Cox residue theorem, rather than an unread Griffiths article. No restricted-library book or passage was used or copied. All source statements in the deliverables are in the worker's own words.

Fourteen source issues are recorded. E1–E2 reproduce already independently confirmed LV findings; E3–E14 are this worker's findings, not independently confirmed. Particularly consequential points to check are the LS cyclic argument (restrict to the centralizer of a power), the disconnected GO kernel in Lemma 5.49, its integral-eigenvalue versus integer-polynomial interface, and the GO2 counterexample to unrestricted form-group choices in Lemma A.1. The other findings concern indices, root signs, similitude weight, primitivity and Eulerian estimates. Read each version-scoped locator and correction before accepting it.

## Existing work imported

Read the reviewed library audit and parent and supplier packets, their relevant integrated targets, source extractions and reviews. Screened the current read-only TauCetiRoadmap checkout, including all nine newer roadmap directions named by WORKERS, and read current ReductiveGroups and AlgebraicVectorBundles documents and suggested files. Screened current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; this was not substituted for the pinned compile baseline.

Pinned bodies read include `Finsupp`, local Krull intersection, `TauCeti.Cocharacter.parabolic`, and `TauCeti.Tannaka.fgPointTensorIsoEquiv`. Existing dynamic group functors are imported. The last declaration concerns Hopf-comodule points, not arbitrary fibre-functor isomorphism torsors. A6 already supplies quasi-projective Weil restriction, finite-étale abelian Weil restriction, finite Hom rank and Rosati positivity; those exact nodes are imported. The parent supplies GL arithmetic finiteness and pure-character weights. SC supplies character sheaves, Eulerian twisted Hodge numbers, inversion duality, exceptional degrees and conjugate-uniform orbit monodromy. CA.2 is the owner for the requested Eulerian ascent sequence; its written Euler/zigzag material is not asserted to prove the ascent distribution or its CLT.

## What remains and where to resume

Independent review should first follow the nine named gaps and their `neededBy` lists:

1. Relative structural crystalline comparison with connection and coefficients; preserve the P8/CP.3/CP.4 direction and coalesce the existing relative-crystalline continuation.
2. General neutral Tannakian fibre-functor isomorphism torsors. The current MC.6 diagram-specific torsor nodes do not cover this.
3. Complete reducibility and rational global conjugacy for the possibly disconnected coefficient normalizer, including finite rational splitting of centralizer orbits.
4. A pure polarized integral Ax–Schanuel supplier. The proposed LogicAndDefinability continuation is not an existing or reserved stage; do not invent its node id.
5. Eulerian ascent central limit theorem, coordinated with probability and the CA owner. Exact variance and uniform integrability are retained in the numerical adapter.
6. Higher-degree Katz–Messing comparison and rational Frobenius-correspondence traces. The additional geometric orbit-polynomial node bridges integrality to the integer-polynomial finiteness interface; integrality alone does not prove rationality.
7. Orthogonal Beauville monodromy. LPV.5 currently supplies only the symplectic criterion.
8. Curve-isomorphism Shafarevich finiteness via Torelli and good-reduction Jacobians. R28.5's abelian theorem, RP.4's conditional statement and the Jacobian universal property do not individually supply it.
9. The number-field arithmetic comparison needed for LV's stronger all-subvarieties finiteness clause. The projective application claims non-density only.

The packet's 21 requests give the other supplier interfaces, consuming nodes and exact hypotheses. Five `restructure` proposals coalesce the Logic, relative-crystalline, orthogonal-monodromy, Eulerian-probability and curve-Shafarevich extensions. No other packet was edited and no external stage was silently enlarged. No higher-tier result was moved into this plan under an invented citation.

Additional review checkpoints: the one-factor top-sum convention; geometric Frobenius and Hodge–Tate signs; cumulative rather than pointwise Eulerian tails; the primitive versus full quartic Hodge vector; dense-open rational lifting under proper resolution; closed proper translation orbits; equality versus divisibility of normalized exceptional degrees (first 8855); and finite isogeny cokernel rather than surjectivity on rational points. The abelian-surface quadratic form uses the pushforward cycle with multiplicity.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/MordellLawrenceVenkateshPartII.json`: zero errors and zero warnings.
- Intake `check-files` on exactly the four deliverables and this handoff: passed.
- `source_issues.check_issues` and `check_errata.versions_checked` on the packet's fourteen findings: passed. The standalone errata-job wrapper is not used, because this is a blueprint packet.
- Exact rational arithmetic checked Eulerian normalization, second moments and central-mass bounds for n=2 through 30, the primitive quartic Hodge vector (1,19,1), and the first exceptional degree. These computations support the examples, not the unbounded theorem proofs.
- `lean-check research/blueprint/suggested/MordellLawrenceVenkateshPartII.lean`: compiled successfully at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` with only the nine expected declaration-uses-sorry warnings. Available memory was checked first. No language server or library build was started.
- Packet/reader API and check coverage, routed-item coverage, graph acyclicity and staged dependency consistency were checked; git whitespace checks passed.

Scratch research files are removed after PR submission. The sources, hashes, target disposition map, supplier contracts and this handoff contain the information needed to resume review.
