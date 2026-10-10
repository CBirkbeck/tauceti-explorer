# PKG-CohomologyComparisons — #7895

Codex / GPT-6, session `codex-iE4zYZ`, 2026-10-10. Claim confirmed by the swarm bot at 01:31:49 UTC. None of the manager's priority issues was available when checked; this was an available focus package. This run takes no second job.

## Delivered

The three package files are complete. The README has seven layers, 86 mathematical topics, and all 83 accepted input targets: 2 definitions, 2 constructions, 55 theorems, 18 applications and 6 comparisons. All 24 original API items and 13 original tests are retained. Three restricted constructions replace disallowed higher-tier prerequisites. The trace-period construction additionally gets an explicit scalar API and checks. Each layer ends with examples and dependencies. The README is approximately 143 KB, below the issue's 200 KB limit; sources and statements are in our own words, without source excerpts or source-section summaries.

The accepted packet, reader document and original suggested file were not edited. `metadata.toml` is `topic = "math.NT"`. No review verdict is written by this worker.

Layer numbering follows construction order: old CP.0 → Layer 0; CP.1 → Layer 1; CP.3 → Layer 2; CP.2 → Layer 3; CP.4 → Layer 4; CP.5 → Layer 5; CP.6 → Layer 6. The relative filtered adapter remains in Layer 6, after the ordinary comparison core. The nearby-cycle theorem is in Layer 3, after the local graded square. Original declaration namespaces CP0–CP6 are retained for name continuity; section comments follow the README order.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/CohomologyComparisons.json`: 0 errors, 0 warnings; 83 targets, 24 APIs, 13 tests. This checks the unchanged input, not mathematical proof closure.
- `lean-check` on the package `Suggested.lean`: exit 0 on the final file, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` / Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. There are 419 declaration warnings, all exactly “declaration uses `sorry`”, and no errors or other warnings. Memory was above the required threshold; one compile ran at a time, with no build or language server.
- The Lean file has 29 `example`s: the original checks, the trivial-root negative control, normalization computations and trace checks. Twelve examples remain admitted; seventeen elaborate without `sorry`. Computed examples do not prove the geometric comparison theorems.
- Structural audit: all 83 input IDs map to distinct README topics; 86 topics total; all original API names occur in the Lean file; all seven layer endings are present. Internal target prerequisites occur earlier in the reordered build.
- `python3 research/blueprint/intake.py check-files` on all four deliverables: 0 problems. `git diff --check`: clean.

`Suggested.lean` is representative, as upstream requires. Geometric/enhanced supplier interfaces have admitted bodies and documented mathematical meanings; they are not implemented imports. The closing comment names statements whose full types require those suppliers. In particular it omits the full relative filtered F-crystal theorem rather than retaining the old unqualified signature. The full analytic log-site and flag-basis APIs and their geometric checks are in the README and named in the closing comment; the compiled local polynomial calculations check their connection convention, not perfectoidness or log-site descent. Full enhanced homotopies, uncompleted F^{nr} smooth-vector descent, sheaf-level higher-direct-image vanishing and filtered equivariant Tate-line refinements remain outside the ordinary representative signatures.

## Ownership and tier moves

CohomologyComparisons is tier 14 in `upstream/CaraianiNewton.md`. Its retained prerequisite roadmaps are lower tier; higher roadmaps occur only as downstream consumers.

| Previous prerequisite | New owner and exact restricted content | Follow-up for the other owner |
| --- | --- | --- |
| HodgeTateAndCanonicalSubgroups T6 early analytic log-site/projections and logarithmic period construction | README 6.1: divisorial Kummer/pro-Kummer sites on finite modular curves and their level/field tower, full-kernel log structural period sheaf, connection and logarithmic Faltings extension | Point T6's corresponding modular-curve construction and its consumers at this early construction; no canonical-subgroup result moves. |
| PerfectoidShimuraVarieties S3 flag basis | README 6.2: genus-one affinoid-perfectoid inverse-image basis of P¹ under the fixed-tame-level modular-curve Hodge–Tate map, rational intersections, finite-level descent and density | Import this genus-one case; keep higher-dimensional Shimura constructions there. |
| RefinedTraceMethods RT.3b graded Beilinson square | README 3.7: quasisyntomic graded square, its actual χ_i, local finite-weight cyclic/cyclotomic calculation and descent | Import the graded square and its local realization. The general K-theory trace square, regulators and downstream character/gluing remain there. |

The last move includes actual construction steps: cyclic/spectral bar realizations, circle fixed/Tate objects and norm triangle, cyclotomic can−φ fibre, the F_p calculation and rational local square, the even two-degree truncation on quasiregular semiperfectoid rings, fixed-weight denominator control, polynomial left Kan extension and quasisyntomic descent. Generic E4 completion/rationalization is not claimed to supply the trace square as an axiom. The prismatic syntomic input must use its early Nygaard construction, rather than importing this comparison back from a later trace stage.

## Current-upstream duplication audit

Read current upstream at `d6f707516e7ede3181dac4b2420ba25c0799d22d`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, without building them. The two complete README models were AlgebraicVectorBundles and DifferentialGeometry; their suggested files were also inspected. The nine post-snapshot roadmaps and Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts were searched by mathematical objects and hypotheses as well as names.

No accepted geometric comparison target was removed as already implemented. Existing general foundations are deferred in Scope and ownership / Exact supplier contracts:

- AlgebraicVectorBundles L0B/L2B: finite locally free sheaves, tensor/dual operations and geometric bundle total spaces. **Its projective/flag geometry and characteristic classes are successor motivation, not targets it supplies.** EDC.3–EDC.4 needs the additional relative quotient-line projective/flag geometry and class contracts below; do not cite the motivation as an existing construction.
- DifferentialGeometry: real smooth de Rham theory. This package's continuous p-adic differentials and period filtrations have a different domain.
- IntegralLattices, LocalGaloisGroups and ProfiniteArithmetic: general lattice/Galois foundations, with no duplicate general construction here.
- Current `TauCeti/RingTheory/RootsOfUnity/PadicTateTwist.lean`: `TauCeti.PadicTateTwist`, its projections, Galois representation and finrank theorem. The primitive ε used here normalizes coefficient maps; it does not re-plan this integral Tate module. This module is newer than the compilation pin.
- Current `TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basis.lean`: generic rational-basis and finite-intersection results. Layer 6.2 adds the specific tower's perfectoid inverse-image and finite-level density theorem.
- Current `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Window.lean`: rational windows and Frobenius geometry. Neither another general Fargues–Fontaine space nor generic window geometry is a target here.

At the Mathlib pin, inspected the actual period-ring, Witt/Frobenius, completion, length, finrank and cyclotomic-character declarations. In particular `AdicCompletion.isAdicComplete` needs a finitely generated ideal; `Module.length` is ℕ∞-valued; finrank is not a torsion length; and cyclotomicCharacter's nontrivial interpretation requires the roots supplied by O_C. No declaration's existence was taken to prove an absent period-field or enhanced-category theorem.

## Adversarial mathematics pass

These checks concern statements and scope, separately from Lean elaboration. The following topic ranges cover all 86 topics, including the three new constructions.

| Topics | Instances and obstructions checked | Result / correction |
| --- | --- | --- |
| 0.1 | Primitive ε; ε=1; θ versus Witt reduction; nonzero coefficient p | ξ is the geometric sum, θ(ξ)=0 and w(ξ)=p; μ=0 at the trivial system. Every localization-to-period-field map carries an explicit unit proof, derived from primitivity in the intended range. |
| 0.2–0.3 | O_C/p versus k; proper point; changed geometric fibre; removed pro-étale point claims | The two special fibres stay distinct; proper GAGA and corrected covers are the actual inputs. |
| 0.4–0.5 | Q_p(1), H²(P¹), perfect/imperfect residue; two lifts | Positive Tate weight and negative degree-two weight stay distinct; ξ and ξ̃ specialize through different maps. No C→B_dR⁺ section or uniqueness over imperfect residue is asserted. |
| 1.1–1.3 | Degree zero; smooth point; perfect complex with torsion homology; θ versus θ̃ | Perfectness does not become degreewise freeness; the Hodge–Tate specialization keeps its twist and Bockstein. |
| 1.4–1.6 | Next-degree Tor; rational versus integral tensor; nonproper boundary; ε=1 | Derived completions and properness retained; degreewise integral equality is not inferred from a derived comparison. |
| 1.7–1.10 | Frobenius pullback versus unpulled Δ; products and interchange; singular/noncompleted boundary | Compare the correct prismatic Frobenius pullback. Multiplicative/coherent assertions have their own construction inputs; no ordinary-tensor singular extension. |
| 2.1–2.7 | No redundant coordinate; common refinement; rank-one versus higher-rank points; local versus proper spreading | Whole embedding kernel is completed. Approximation and spreading are explicit targets, not consequences of a generic effectivity citation. |
| 2.2 | Identity including zero ring; Q[X]→Q; levels one and two | Completion is B for identity, but the completed coordinate survives modulo X² and is not the first quotient. Finite-generation hypotheses restored on completeness and universal lifts. |
| 2.8–2.11 | Spa C, P¹, torus redundant unit; perfect complex with torsion | Point/projective-space computations and refinement tests retained; canonical cohomology, perfection and degreewise freeness remain separate targets. |
| 2.12–2.17 | Proper nonprojective range; de Rham filtration; different local map constructions | Projectivity is not added; actual local maps and their agreement are targets, with tensor/Hodge filtration distinguished from a bare lattice. |
| 2.18–2.23 | Base point; identity relative map; thickening without specified base; ambient lifts not unique | Relative object requires its finite-level base map. Weak finality suffices; uniqueness is not asserted. Singular extension is not smuggled into smooth agreement. |
| 3.1–3.6 | Residue section; affine versus proper crystalline input; degree zero; ordinary/supersingular slopes | Rational section descent requires its affine Frobenius-isogeny input; proper perfectness alone is insufficient. Hodge numbers are not Newton slopes. |
| 3.7–3.8 | i=0; F_p in weights zero and one; pullback triangle signs; sheaf truncation versus global truncation | Derived fixed fibre retains its shifted zero-operator term. Weight one has 1−1/p≠0. The pullback arrow is (right,−bottom); χ_i and its homotopy are constructed, not assumed. |
| 4.1–4.4, 4.6 | Smooth versus vertical semistable; W(k̄),Q≥0 versus W(k₀),N; precise PR.8 chart range | Log bases and chart hypotheses preserved. Full semistable A_cris multiplicativity is not inferred from smooth multiplicativity. |
| 4.5, 4.7 | N(e₁)=e₀; coordinate T′=T+c; c=0; N=0; Tate curve | Transport is exp(−cN) in the stated evaluation convention, with cocycle. Total tensor N and φ act on both factors. G_K does not fix W(k̄)[1/p] pointwise. |
| 4.8–4.9 | Singular/open algebraic variety; dual versus undualized Hom; uncompleted versus completed F^{nr} | h-descent algebraic scope retained. Smooth Hom and duals stay visible; completed Lean representatives do not claim original smooth-vector descent. |
| 4.10–4.12 | Proper rigid without semistable model; X/C without K descent; proper curve | Conclusion is potentially semistable over K; no G_K action over C without descent. Over-C filtration needs filtered cohomology, not only a free lattice. Curve weights are 0,−1. |
| 5.1–5.6 | n=0; free module; ramified e; torsion in degree i+1 | Length quotient at n=0 is zero. Normalize valuation length by e, but keep ordinary module length separate. Adjacent-degree freeness is required for equality/recovery. |
| 5.7–5.10 | Vertical log range; p=2; small versus all weights | Log hypotheses retained. At p=2, [0,p−2]=[0,0]; Fontaine–Laffaille does not replace the all-weight Kisin input. |
| 5.11–5.13 | Characteristic-two Enriques; Z/p² versus k⊕k; same special fibre/different lifts | Correct implication direction preserved. Truncation lengths are (0,0), (1,2), (2,2); equal eventual length is not a subquotient or exponent statement. |
| 6.1–6.2 | Constant unit; local log coordinate and its square; cusp residue; two flag charts and their annulus | Connection sign has polynomial witnesses. Full kernel and Ω¹(D) retained. A generic rational basis does not imply perfectoid inverse images under an arbitrary map. |
| 6.3 | Crystalline local system T; flat perfect prism; compatible section; extension to OB_dR | Removed old unqualified Lean signature; README retains GR 10.13's actual coefficient/prism/section hypotheses and 10.14's filtered structural extension. |
| 6.4–6.8 | Algebraic versus arbitrary rigid; d=0; P¹ trace; factor 2 versus 1/2; r=0; rank-one projective relation | Betts–Stix representatives gain the algebraizable hypothesis. a is the negative Tate-line isomorphism; twisted a^{−r} gives untwisted a^r. Rank one gives h−c₁=0. Canonical Fontaine normalization is not asserted. |
| 6.7–6.8 | Nonproper total space of L; proper P(O⊕L) and zero section | Use the proper section/Gysin/projective-bundle argument; do not apply a proper cycle theorem to a nonproper total space. |
| 6.9–6.10 | Overlap of source ranges; supplied versus hypothetical downstream trace/gluing | Exports return this roadmap's maps and normalizations; they do not assume higher-tier consumer theorems. |
| 6.11–6.15 | k=1; k≤i; l=0; bounded torsion for varying k/i; almost versus ordinary modules | Stabilization retains k>i and l>0. Torsion exponent may depend on i,k. No spurious all-level finite-Witt short exact sequence or exact ordinary integral almost comparison. |

## Supplier work remains; no promotion-readiness claim

The accepted input itself has 16 gaps, 48 requests and seven planned stages, zero closed stages. Packaging does not change those facts. Exact contracts make these requirements visible; they do not turn missing supplier proofs into library theorems. Independent package review should particularly check the following before upstream implementation:

1. AI.5 proper perfectness must be proved from its early local/crystalline inputs, without a CP.1 back dependency. Ordinary H0/H1 formal-site prefixes must be separated from the CR.5 log/Lefschetz suffix. P8 primitive inputs must precede this roadmap's global comparison. The prior exact reachable declaration audit was acyclic, but stage-union supplier graphs had cycles; this package does not certify their removal.
2. PR.7's single-base Spf O_K equivalence does **not** provide analytic prismatic F-crystals or GR Theorem 9.15 for families. Layer 6.3 states the required extra range, with no false Lean substitute. This needs an owner scope extension/Part II before implementation.
3. CR.3 needs the affine rational Frobenius-isogeny/residue-section result of BMS Proposition 13.21. CR.6 needs the broader overconvergent h-descent realization over F^{nr}. The early stable-range syntomic comparison and Banach–Colmez theory used by CN 6.4/6.8 have no established noncircular supplier prefix; the exact contract needs an early Part II in the p-adic Hodge/crystalline direction. R06.5/R06.6 consume this roadmap and cannot fill that input.
4. R07.4 needs the all-weight Kisin construction and Kummer-tower full faithfulness of BMS 4.4/4.34; finite-flat/p-divisible classification or small weights alone is insufficient. The generic original Kisin proofs remain supplier source work, not a proof supplied by packaging.
5. R09.3 needs the precise Enriques, BG approximation, positive-characteristic Bertini and weak Lefschetz inputs for the torsion counterexamples. R09.6 supplies effectivity/deformation prerequisites, while the specific affinoid/proper spreading targets are explicitly built here.
6. EDC.3–EDC.4 and PR.4 need the actual class/purity/projective-bundle APIs, including relative flag geometry. The proper first-Chern workaround is outlined here; equality with the canonical Fontaine period remains separately unproved in Betts–Stix Remark 3.21.
7. DD.2 needs the AMMN Hodge-completed tensor and convolution filtration of Construction 7.12 / Theorem 7.13, not a naive tensor with Fil^i A_dR. The local finite-weight cyclic construction in 3.7 requires its full enhanced/spectral construction when formalized. E4 generic stable machinery is not an axiom for the resulting square.
8. CC.8's early modular tower/analytic exactness and CC.2/CC.4 inverse-limit arguments must be supplied without citing the later Pan comparisons back into their own inputs. The new log/basis constructions use only this early restricted tower range. Typed geometric tests await genuine supplier sites and almost categories.

No package-writing work remains in this run. Next step is the independent package review; structural/supplier edits belong to their owners and were not made in this PR.

## Source versions for reproduction

All sources used were public primary PDFs; no restricted book or uncleared copy was used. The README bibliography gives the URLs and its own target prose gives the theorem/section/page locators. These hashes identify the versions actually read; no PDFs, extracted passages or source text are committed.

| Source | Version | PDF SHA-256 |
| --- | --- | --- |
| BMS1 | 1602.03148v3 | `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a` |
| Česnavičius–Koshikawa | 1710.06145v3 | `47000db58599c20831223f43df1d13466c913fdda617070f5cc3458631d36c57` |
| Guo–Reinecke | 2203.09490v3 | `3c49a5f2aa6023c7b01a5ba83a370ddcb92642f4819f64446b7d93bf01b28d26` |
| Guo | 2112.14304v1 | `718c048a52f16ac86d8590283bb12bc705be2cc1fa6d800bf2d7cc0dae0ea6cb` |
| Colmez–Nizioł II | Author CN5, 24 November 2024 | `bb1628cf1f4321243e6070be2abae99f72a41e237e70a7eb1ec1fc03cc2cd52a` |
| Betts–Stix | Author manuscript 29 April 2022 | `7aa79403eff72d06b481424ab4c1f34a8cde68edd62f0d0923ad89cca082f565` |
| Pan II | 2209.06366v1 | `0873b61a758c57a9c5567f8e9ed7d905adcb7b359013a24e680facd1027b31b4` |
| Colmez–Dospinescu–Nizioł | Author GPW5 | `2cdb1de25b5201ed46f8af6c06c19b72fdc5cbe1dd2037b4e1d24dee30155776` |
| Bhatt–Scholze | 1905.08229v4 | `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a` |
| Scholze 2013 | 1205.3463v2 | `ed9187b3269adb7e9964369470073ce8760ef56ef0c0b89538c0a1509f811959` |
| Scholze erratum | Official author PDF | `3cfa56b9e3875c04240d97739dccd58091e41f714c101d5470b95172f73cb235` |
| AMMN | 2003.12541v2 | `2a0224b2e8b7c5f19f326886b130f8be0158ba4cb602ba7eb5821990ca22b3fd` |
| Scholze 2015 | Annals 182, pp.945–1066 | `ebac854f47381c19a987b43b59d2c05cad55c3186c4d8cde067a7be0d06cbd16` |
| Diao–Lan–Liu–Zhu | Official author log-RH PDF | `dccd18f6605380a92e6fa9e2143547b7cfa12ddb01b08ff5af0e083818539d04` |
