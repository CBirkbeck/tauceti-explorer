# DESIGN-ProetaleCohomologyOfPAdicCurvesAndTowers

Issue: #3410. Agent: Codex (GPT-6), session `codex-huzqaH`.

The planning pass is complete and ready for independent review. This is not a checkpoint and makes no implementation claim. Only this issue's four deliverables and this handoff are changed.

## Delivered and coverage

- New roadmap definition in area `padic`, with thirteen reusable layers and explicit supplier edges.
- Complete packet: 75 nodes — 10 definitions, 6 constructions, 55 theorems, 2 comparisons and 2 applications.
- Every definition/construction has recorded uses, a required API and three distinguishing tests: 67 API items and 48 tests in total.
- 50 planets, no more than six in any layer; 6 verified Mathlib baseline declarations.
- Reader document with every target, hypothesis, proof route, dependency, Check, API, test, source locator and ownership contract. Its statements agree with the packet.
- Compact 76-line suggested file over existing Mathlib carriers; heavy analytic carriers are specified in the reader rather than represented by placeholders.
- Complete routing audit: all 106 items from the four source reviews are mapped — 32 Dospinescu–Le Bras, 55 CDN20, 15 CDN23, 4 BCGP25. Imported inputs and context boundaries are explicit.
- Nine identified source versions, sixteen source findings/corrections, twenty supplier requests, twelve gaps, and six ownership/restructuring proposals.

Every node is `unchecked`. No layer is closed. S0, S1, C0, H0, T0, T1, G0, B0, T2, T3, F0, A0 and A1 are all **planned**, with precise remaining obligations in `coverage`. The node budget is a ceiling; all stages reach target-level coverage in 75 nodes, so no artificial refinement to 300 was added.

## What the next worker must do

The next task is an independent review of this complete plan, not another design pass or an implementation. Verify the target statements and prerequisite contracts against the exact versions and current owner interfaces before accepting it. Once accepted, resolve each open stage through its own follow-up and assemble only after closure.

Particular mathematical review points:

1. S0–S1 retain arbitrary finite dimension, uniform dimension/rank bounds, proper closed pseudoadic supports, coefficient naturality, and the distinction between quasi-Stein and relative-compact Stein exhaustions. Ambient properness is not a hypothesis of the extension-by-zero lemma.
2. C-valued duality does not follow from finite-field Hahn–Banach. Check G1's solid/functional-analysis extension independently. Retain the corrected field restrictions of GK00 Lemma 4.7 and GK04 Corollary 3.2.
3. The universal HK definition maps to H¹ of the completed structure sheaf, rather than defining it only through global forms. Check the disc, annulus, proper-curve and disconnected cases, including the canonical kernel identification and residue normalization.
4. T0 distinguishes the effective Q_p model, the unramified geometric tower, central quotients and the two level conventions. The bounded-function criterion needs proper geometric special-fibre components and the formal-section comparison; the open disc refutes an unrestricted semistable-Stein version.
5. In T1 multiplication by P′(f) need not be a unit. Its finite-module closed image and the Banach open mapping theorem give the lower bound required by the differentiability proof. Check the completed-enveloping growth estimate and transpose signs separately.
6. Uniformization uses Γ_i/p^(NZ), with corresponding quotient-group Ext. The global unramified twist must be removed before taking the fixed ρ part; the contract requests a prime-to-p global character with ψ(p)=ξ(p)^(−1).
7. The Stein dense-image theorem has a rank-one interpolation proof with distinct points, extended ideals and a uniform dimension bound. The finite-free induction uses openness of the first coordinate to show the kernel maps densely to the remaining coordinates. Surjective projections alone are insufficient. Projective targets then split off a free complement.
8. Perfectoid boundary descent needs the cone shift −1, cofinal complements, and derived-limit control. Affinoid perfectoid acyclicity alone is not a proof for every generalized Stein union.
9. The special parameter has slopes 0 and 1, not an isoclinic slope 1/2. Full compact decompositions require special terms in addition to ET.6a's supercuspidal endpoint. Check the three-group central-twist dictionary, φ=p period domain, contragredients and residual actions.
10. A0 proves non-admissibility of nonzero torsion multiplicities for all k. It does not decide admissibility of the rational Banach representation. Verify the separate bounded-vector/universal-completion input, the finite Čech detection window, and the dual finite-dimensional multiplicity factor in the completion argument.
11. A1 fixes the tower level, takes the field colimit before the coefficient inverse limit, and allows Galois stabilizers to vary with k. Its Q_p geometric finite-length input is a separate integral local-Langlands theorem, not a consequence of MP.1's general criteria. Register its missing owner without a dependency back to A1.
12. Confirm each of the sixteen source findings at the cited locator. Existing paper-extraction findings retain provenance; the author-corrected GK00 copy is not accused of omitting hypotheses it already contains.

## Closure obligations and suppliers

The packet's twenty `requests` give exact statements and consumers. Existing generic definitions and exact available blueprint nodes are imported, never duplicated. The outstanding groups are:

- Adic R0/R3/F0: relative-compact closure calculus, finite-étale action continuity, P¹ splitting/GAGA, and nonproper equivariant semistable models with the power-bounded-section comparison.
- Classical adic H0, crystalline CR.5/CR.6 and comparison CP.4: the analytic cohomology operations and nonproper semistable comparison, preserving the proper exports already available.
- ET.6/ET.6a and Hilbert R18.5: normalized classical correspondences, full special/supercuspidal compact realization, finite Lubin–Tate dimension and Gross–Hopkins actions, and equivariant tree/uniformization descent. Generic towers are already owned there.
- Analytic distributions L0 and locally analytic representations LR.0/LR.2: C-valued strict duality, higher-dimensional analytic actions, zero-Lie-to-smooth bridges, and the generic universal-completion/bounded-dual theorem.
- Period R06.2/R06.3, perfectoid P2, smooth SR.2/SR.3 and mod-p MP.0/MP.1: the explicitly identified coefficient/topology extensions and finite-presentation inputs. The existing formal BKH filtration and ordinary-parts MP.2 theory are imported directly.
- Nakajima's equivariant differential-occurrence input needs primary verification and an algebraic-curve owner through the GAGA boundary. It is not an affinoid Kiehl corollary.
- The separate Q_p integral local-Langlands finite-length export needs owner registration, as described in G10. No fictional stage id is used.

The twelve gaps specify the missing hypotheses/arguments and all their consumers: C-valued strict duality; nonproper semistable geometry; nonproper HK comparison; perfectoid boundary limits; full compact realization; P¹ splitting; positive period-space topology; finite detection and completion; equivariant algebraic differentials; the separate integral Langlands input; higher-dimensional analytic covers; and historical/excluded duality questions.

Six `restructure` proposals keep generic extensions with their existing owners. No higher-tier notion is newly moved into this roadmap in this design pass. The geometric tower diagram is an input to p-adic local Langlands, while the separate A1 arithmetic application has its integral-Langlands requirement isolated explicitly.

## Current-library and inherited supplier audit

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The six listed Mathlib declarations were read with their actual hypotheses; no Tau Ceti declaration is claimed to supply an analytic carrier.

The read-only current-upstream screen used TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current AdicSpaces, RepresentationTheory and AlgebraicVectorBundles interfaces were inspected, as were the post-snapshot directions relevant to duplication. Scheme bundle theory is not re-planned. Open Mathlib PR/Zulip searches did not locate a usable analytic implementation; scheme pro-étale site work is not the analytic interface needed here.

The internal target and stage graphs are acyclic. A transitive exact-node traversal reached 2,609 nodes, also acyclic, ending at 145 supplier-stage contracts; their full internals are not claimed closed. It found one inherited stale node reference, recorded in `upstreamNotes`: LocallyAnalyticDistributionsPartII ND.0 and ND.2 still cite `NoncommutativeAndEquivariantIwasawa:NE.0/lower-p-series`. The Iwasawa owner explicitly removed that node and now imports current ProfiniteArithmetic/TauCeti `pLowerCentralSeries`, with zero-based indexing and a post-pin port/import obligation. Redirect that supplier edge in its own job. Do not add another series here or treat the current declaration as verified at the older pin.

## Sources read and limitations

Source metadata contains the URLs, access dates, read sections and file hashes where available. No source passage, private file, PDF or extracted book text is included.

- Dospinescu–Le Bras, Annals 186 (2017): §§3–5, §9.2, §10; printed pp.337–355, 378–379, 381–388. The Annals version was used for the source findings.
- Colmez–Dospinescu–Nizioł, dimension-one tower paper: 56-page GPW4 author copy, §1, §3–5, Appendix A, and the relevant introductory routes. All target locators use that PDF's pages, not JAMS pagination. The older arXiv v2 Remark A.2, pp.53–54, was read separately because it is absent from GPW4.
- Colmez–Dospinescu–Nizioł, Forum of Mathematics, Pi 11 (2023), e16: published Remark 0.6, §2, §5.3; pp.5, 21–32, 55–57.
- Boxer–Calegari–Gee–Pilloni, arXiv:2502.20645v1: §§4.6.16–4.6.26, pp.84–86, for all-dimensional coherent Stein theory and supports.
- Grosse-Klönne, De Rham cohomology of rigid spaces, author version of Math. Z. 247 (2004): Theorem 3.1 and Corollary 3.2 with proof, PDF pp.11–12.
- Kohlhaase, Lubin–Tate and Drinfeld bundles: Lemmas 3.10–3.12, Theorem 4.4, Theorem A.2 and Proposition A.5, PDF pp.18–21, 24–26, 36–37.
- Grosse-Klönne, Rigid analytic spaces with overconvergent structure sheaf: §§4.2–4.11, PDF pp.19–22, read directly from the maintainer-cleared author copy. Its correction footnote already supplies the discrete-valuation and characteristic-zero restrictions omitted in the journal version; the journal version itself was not independently inspected.
- Colmez–Gilles–Nizioł, author preprint dated 6 October 2025: introductory Theorem 1.7 and surrounding statements, pp.1–3, read to update the historical duality boundary only.

Access limits: the AMS CDN20 version of record was refused; findings are scoped to the author text actually read. Kiehl's cleared scan did not yield legible text in this run; Kiehl A/B is used through BCGP25 Corollary 4.6.18 and the supplier interfaces, not claimed as direct source reading. Nakajima Theorem 4 was not read in the original source; that is G9.

Historical boundaries are versioned: the 2025 derived rational TVS pro-étale duality theorem does not supply the naive integral Pontryagin duality contemplated in CDN23 Remark 0.6, full geometric mod-p profiniteness, or the other source-era questions. Do not report all p-adic Poincaré duality as open in 2026.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/ProetaleCohomologyOfPAdicCurvesAndTowers.json`: **0 errors, 0 warnings**.
- The source ledger was checked with `scripts/check_errata.py` through a scratch-only `errata-v1` envelope retaining the roadmap id, all sixteen findings and source-version metadata: **passed**. The packet keeps its required `blueprint-v1` format.
- Custom consistency audit: matching reader/packet statements for all 75 targets; all definition/construction APIs, uses and test counts; 106 exact routing matches; per-layer planet limit; thirteen honest coverage records; unique source-finding ids; no prohibited source excerpts, local paths or Lean blocks in packet/reader; internal and reachable exact-node acyclicity: **passed**.
- `lean-check research/blueprint/suggested/ProetaleCohomologyOfPAdicCurvesAndTowers.lean`: **exit 0**, seven intentional `sorry` warnings, no other warnings. The final file has 76 lines and no admitted data definitions. Available memory exceeded 20 GB before elaboration. No build, update, cache download or language server was used.
- Final submission checks and whitespace/path checks are recorded in the pull request. Scratch is removed after opening the pull request; all information needed to resume is in this handoff and the deliverables.
