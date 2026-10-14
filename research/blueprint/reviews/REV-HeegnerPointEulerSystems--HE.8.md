# Independent review of HE.8

Accepted on 2026-10-14 by Codex (GPT-6), session `codex-m0jCf6`, for issue #9388. This session did not write the planning pass or its inherited HE.7s packet. The packet is a complete target-level pass and HE.8 is planned; neither is mathematically closed or implemented. Six explicit gaps and nine supplier requests remain.

## Inventory and verdict

| Item | Result |
| --- | --- |
| Refinement nodes | 8: one construction and seven theorems |
| Node verdicts | 7 corrected; 1 verified; no added or unverifiable nodes |
| Construction API and tests | 8 API items and 5 tests, increased from 4 and 4 |
| Baseline declarations | 2 confirmed; none removed or replaced |
| Accepted imports | 49 nodes, 37 API items, 29 tests and 6 planets retained |
| New planets | 0 |
| Gaps and requests | 6 gaps; 9 requests after removing a redundant AA.3 request |
| Source findings | No new IDs; inherited E2 and E3 independently rechecked |

The imported nodes comprise two definitions, seven constructions, 33 theorems and seven lemmas. Their statements, API and tests in this reader agree with the accepted HE.7s records; they are not redefined here. The separate parity node is outside this scope. The review ledger in the packet covers every refinement node.

## Node checks and corrections

IDs below have prefix `HeegnerPointEulerSystems:HE.8/`. All page references identify the version linked in the packet, and all descriptions are in the reviewer's own words.

| Node | Verdict and source check |
| --- | --- |
| `howard-traced-universal-norm-module` | **Corrected API and assembly scope.** Howard Theorem 2.3.7 and Lemmas 2.3.8–2.3.9, §2.3, PDF pp.34–35, concern the traced module over K∞, distinct from the module over K∞[1]. The clean finite class-group norm and augmentation argument are retained, including the possibility that aug(Φ) is a nonunit. Added compatible-tuple construction and evaluation, extensionality, the continuous universal property and the injective Kummer comparison. Added a test rejecting an incompatible tuple. The rank comparison cited to Perrin–Riou Proposition 10 of §3 remains a PMIA L5 request. |
| `adelic-fibre-and-isogeny-annulus` | **Corrected mathematics.** CV-CM Lemmas 2.19–2.20, printed pp.281–282, identify a fixed norm-component fibre with a cocompact local lattice quotient only after taking a compact open norm-one quotient away from P. The draft omitted this quotient and asserted finite unions for the raw fibres. The correction distinguishes the single component quotient, the joint product, the unquotiented adelic fibre recovered through levels, and the class-set fibre at full finite level. Propositions 2.12 and 2.28, pp.275–276 and 287–288, support the multiplicative annulus parameter and the single-double-orbit identity. |
| `p-adic-orbit-density-application` | **Corrected level and proof scope.** CV-CM Propositions 2.22/2.24 and Lemma 2.25, pp.282–286, make the arithmetic Haar-null exceptional-set argument and passage through away-P levels explicit. Lemmas 2.30–2.32, Corollary 2.34 and Proposition 2.35, pp.289–291, identify the joining alternatives. The proof now distinguishes differing quaternion ramification between reduction sets from the P-rational shift obstruction within one set. The generic finite-extension dynamics contract remains requested, not certified by a real Ratner theorem. |
| `cornut-vatsal-torsion-trace-nonvanishing` | **Corrected locator and supplier detail.** CV Theorem 4.10, PDF p.41, has H2, a nonzero surjective rational Pic(O_F)-equivariant quotient and the stated restriction on the G2 character. H1 and P-newness belong to a stronger primitive-character branch. Its proof on pp.44–50 uses Lemmas 4.14–4.15, **Remark** 4.16 and Proposition 4.17. The R18.4 request now explicitly includes the nonconstant componentwise quotient map, fixed finite-fibre degree bound and good-reduction transport. Modular HE.1 normalization does not supply that general quaternionic interface. |
| `broader-tower-descent-verification` | **Corrected direct dependency.** CGLS §3.2, printed p.547, and Theorem 4.1.1, pp.566–568, provide the weak-torsion hypotheses, d(k) trace fields and completed-coefficient restriction map. The proof distinguishes base pro-p torsion vanishing from auxiliary disjointness and retains the finite tower part. Added the missing direct SI.L3 prerequisite for the existing semilocal ordinary norm request. The shifted common-presentation and weak-image descent checks remain explicit gaps. |
| `howard-specialization-hypotheses` | **Corrected citation.** Howard Proposition 2.1.3, Lemma 2.2.7, Proposition 2.2.8, Lemma 2.2.9 and the proof of **Theorem 2.2.10**, PDF pp.23–28, are the relevant arithmetic control/bound passages. The draft instead named Theorem 2.3.1. The direct control theorem excludes pΛ; the bound controls that valuation through perturbation. Local finite errors, H0–H5 and the precise functional equation remain visible. |
| `perfect-character-base-change` | **Verified.** CS §§3.2–3.3, especially equation (3.17) and the proof of Corollary 3.3.4, PDF pp.13–16, use the all-p ordinary/inertia Selmer complex and derived character evaluation. SI.L3's existing finite-layer control theorem is conditional on local derived comparisons and is not this coefficient-character theorem. Its determinant theorem assumes perfectness. The stronger Nekovář 8.10.1 contract is correctly requested; its original proof was not independently read. |
| `integral-heegner-determinant-containment` | **Corrected attribution and ownership.** CS Theorem C, PDF p.4, and §3.4, p.17, require integral containment in the p>3 residual-surjective, ordinary, unramified, Manin-unit setting. The proof explicitly invokes Howard **Theorem 2.2.10**, pp.26–28; the draft called this Theorem B and placed B on p.3 rather than p.2. The abstract bound has A–D hypotheses and no class-number assumption. Its arithmetic application to the broader d(k) tower still needs verification. CGLS Theorems 3.4.1/4.1.2, printed pp.564–565/568, give localized divisibility, which cannot discharge integral containment. ES owns the abstract bound and HE owns its arithmetic verification. This is an application gap, not a source erratum. |

The traced-module refinement edge is now explicitly restricted to the clean Howard branch. Adding it as an unconditional prerequisite of the accepted weak-torsion bottom-class theorem would impose p∤h_K on a theorem that does not assume it. Assembly must retain the separate CGLS route.

The reader also overstated the accepted Howard conclusion as freeness of the full Selmer module. It now states Λ-torsion-freeness and rank one, matching the imported endpoint and Howard Theorem B. Freeness with the specified generator belongs to the traced Heegner norm module. The narrative's CV-CM Theorem 2.9/Corollary 2.10 locator was corrected to printed p.272. Packet, catalogue, requests, gaps and narrative were synchronized, and the Suggested comment reflects the expanded API/test counts.

The imported catalogue now links its own eight source-version keys. In particular, its CGLS PDF pp.27–28 refer to the author manuscript `Eisenstein.pdf`; this refinement cites the published `Eisenstein-print.pdf`, pp.566–569. These paginations must not be interchanged.

## Baseline, suppliers and ownership

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, `Module` in `Mathlib/Algebra/Module/Defs.lean`, lines 54–61, supplies the distributive semiring action. `LinearMap` in `Mathlib/Algebra/Module/LinearMap/Defs.lean`, lines 85–105, bundles additive and semilinear maps; `→ₗ[R]` uses the identity scalar homomorphism. These statements were read at the exact commit. They provide the actual carriers needed by the elementary trace formulas, without supplying the arithmetic objects. The recorded Tau Ceti pin remains `f790474821cf4256814db967cb154e7af3d0c369`; no Tau Ceti baseline declaration is cited by this packet.

The reviewed HE.8 audit, AUDIT-25 in `data/library-coverage.json`, marks all six target families unbuilt and identifies the GH.3 higher-weight analogue and ES.8 generic Iwasawa machinery. Those are separate owners, not new HE definitions. The current read-only TauCetiRoadmap head `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti head `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were checked. Relevant EllipticCurves, ProfiniteCohomology and AdelicAlgebraicGroups roadmap portions and Suggested files were read/screened; current Suggested files and library have no Heegner norm-module, Ratner or perfect arithmetic Selmer-control carrier. No Lake command was run in those trees.

Direct supplier statements were read, including:

- AA.3 `compactness-anisotropic` and `s-arithmetic-lattice`, and AA.4 `strong-approximation-sufficiency`. Their exact nodes replace the coarse compactness prerequisite; the redundant AA.3 request was removed. Current AA README §§3.4/4.2 already plan these general results. The remaining AA.4 request concerns the general-F quaternion norm/commensurator application, extending its rational-field norm export.
- GN.4's real flow/mixing targets, which do not supply the requested finite-extension p-adic orbit, averaging and twisted-diagonal contract. The missing input is stated precisely at the CV-CM Theorem 2.29/Lemma 2.30 boundary, p.289.
- R18.2 split/integral model and Hecke extension targets, R18.3 definite class-set/norm-branch targets, and R18.4 cohomological degeneracy and definite/indefinite comparison. None alone provides the quantitative supersingular norm-fibre growth or H2 fixed-character quotient transport, so the stronger requests remain.
- HE.0 relative tower and ring-class quotient nodes, HE.1 parametrization normalization, HE.2 norm relation and HE.5 actual H0–H5 checks. Full-image hypotheses are not silently weakened to E(K)[p]=0.
- ES.8 normalized height-one specialization, specialization-control and the self-dual Λ-adic bound. HE verifies their arithmetic application; it does not re-plan generic Kolyvagin theory.
- SI.L3 inverse-action Shapiro, derived finite-layer control, Iwasawa duality and the perfect-complex determinant. Their inverse-action, correction-cone and perfectness qualifications are retained. The stronger character and functional-equation contracts remain requested.
- PMIA L5 coverage, which is still `not_read` and leaves determinant and compact inverse-limit exactness as explicit work. Howard's cited Perrin–Riou rank theorem was not independently acquired here.

Every new node has a target-level proof route terminating in these suppliers or a recorded gap. The six audited HE.8 target families are covered by the accepted imports plus the eight refinements. No endpoint, generic Ratner theorem, strong approximation theorem or main-conjecture proof is duplicated. The construction's five tests catch omitted finite trace scaling, false augmentation invertibility, division by a p-primary class number, and admission of incompatible inverse-limit tuples.

## Red-team and source findings

RT-AREA-iwasawa-1/1 remains an honest generic dynamics gap with one owner, GN.4 or a homogeneous-dynamics Part II. HE owns the quaternionic joining application. The finite-extension stabilizer theorem is not inferred from a Q_p-only reference or from coordinatewise density. This refinement sharpens the accepted request; it does not mark the original-source supplier proof complete.

RT-AREA-iwasawa-1/13 is addressed by the existing rescope proposal: extract HE.8 at README lines 102–108 and HE.8b at 110–116, preserve the accepted legacy HE.8c node ID under its HE.8 parent, and remove the reversed process edges through the maintainer's restructuring workflow. Early classes/nonvanishing precede BSD.7a and HE.8b; conditional specialization results retain mathematical hypotheses. Atlas edits and BSD extraction repairs are outside this review's deliverables.

`sourceIssues` is empty. E2 and E3 are reused from the independently accepted HE.7s review and now carry this review's recheck:

- **E2:** CS Lemma 3.1.1, p.13, still prints the reversed coefficient membership in both arXiv v1 and the current author PDF. Reduction modulo p^m of a coefficient-quotient class requires I_n⊂p^mℤ_p, equivalently M(n)≥m. The corrected convention is retained; no duplicate erratum ID was added.
- **E3:** BCGS v2 Theorem 2.2.2, p.17, inherits p≥3, but its proof on p.19 uses Lemma 2.2.4, p.18, stated for p>3. This review certifies the p>3 proof route and leaves its p=3 extension open. It does not claim a counterexample.

All seven acquired refinement-source hashes agree with the packet. Independent reading ranges are recorded separately from the planner's ranges. Only public versions were acquired; no restricted book or source passage was copied into the repository.

## Validation and assembly actions

`lean-check` passed on 2026-10-14 at the pinned Mathlib: 69 lines, four theorem signatures, three examples, exactly seven expected admitted-proof warnings, and no data definitions. The eight arithmetic targets remain README specifications until their carriers exist. Compilation certifies signatures, not arithmetic proofs.

`python3 scripts/check_blueprint.py research/blueprint/packets/HeegnerPointEulerSystems--HE.8.json --json` reports zero errors and zero warnings. Intake file checks and `git diff --check` pass. An additional consistency check matches all eight new and 49 imported statements, 45 total API items, 34 total tests, nine requests and six gaps to the reader. A structural traversal with all nine proposed refinement edges found no cycle among 3,322 reachable node records; requested stage leaves and suppliers' own proof gaps remain open.

The maintainer/assembly worker should preserve the clean-only comparison edge, apply the scope/edge repairs through the authorized restructuring process, route the exact dynamics and quaternionic extensions, and close the six supplier gaps before calling HE.8 closed. In particular, confirm broader arithmetic A–D control for the integral determinant containment instead of replacing it with CGLS's localization. No further author revision is required to accept this target-level pass.
