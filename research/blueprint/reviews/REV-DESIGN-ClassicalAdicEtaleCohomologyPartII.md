# Independent review: classical analytic cohomology, Part II

Accepted after corrections as a complete **target-level planning pass**. All eight stages remain `planned`; none is `closed`. G1–G5 remain explicit proof-closure gaps, as permitted by PROTOCOL §0. This verdict does not certify implementation or closure of the supplier proofs.

Reviewer: Codex, session `codex-KMzJ71`, 19 October 2026. Job `REV-DESIGN-ClassicalAdicEtaleCohomologyPartII`, issue #3506. This session did not author the design under review. Only the five issue deliverables were changed.

## Counts and scope

64 nodes: 44 verified, 20 corrected, zero added, zero unverifiable. The packet retains nine definitions, 17 constructions, 34 theorems, three comparisons and one application. Its 26 definition/construction nodes have 78 API entries and 78 discriminating tests. There are 37 planets, no more than six per stage, and eight stage titles within the 60-character limit. The 100 extraction-route entries (96 Zavyalov, three Berkeley, one Heuer) all resolve to existing target nodes. There are 26 precise supplier requests and five named gaps. All three pinned baselines and all 21 source issues have independent verdicts.

## Corrections made

1. Restored the hypotheses actually used in the cited proofs: smoothness for the nearby-cycle generic-fibre comparison; separatedness for formal dualizing complexes, comparisons and bottom traces; algebraically closed C for Z §2.7’s generic canonical identification and coherent rigid trace. The latter does not restrict the final Galois-equivariant étale duality theorem, whose construction is performed over C. Replaced the incompatible nontrivial field-extension test with an identity test over C. Made the general reduced-fibre reflexive Hartogs statement explicit. Smoothness and polystability imply niceness only with the separated qcqs pure-d conditions in this packet.
2. Split mixed-source nearby-cycle and perfectness citations so AC and PS have their own source ids. Corrected the SW source id for relative strict containment, BH’s constructible-definition locator to Definition 3.1 and Warning 3.2, Heuer’s publication to Inventiones 240 (2025), 261–312 and Proposition 2.18 to p. 279. Corrected AC v3 E16/E17 to pp. 129/130, retaining the distinct v5 pp. 130/131. Updated roadmap metadata and reader alongside the packet.
3. Routed finite-stage approximation to PerfectoidSpaces P5/P6, replacing the D3 request: D3’s stack descent is not the affinoid approximation theorem. Routed geometric lattice comparison to the exact P8 node, retaining its finite-free range and explicitly extending to finite torsion/free devissage for the finitely generated direct images. D7 supplies continuous derived cochains and limit algebra. Updated direct prerequisites, layer inputs, requests and transitive `remaining` contracts.
4. Removed geometric local-system duality as a prerequisite of BH finite-cover generation. Its unipotent-filtration step is algebraic. Current Tau Ceti already contains the required fixed-vector theorem; added reuse notes and changed the suggested named milestone into an unnamed compatibility example. Corrected its Z locator from Theorem 5.4.2 to 5.4.5, pp. 80–81. No new carriers, data stubs or auxiliary developments were introduced.
5. Added E21: equation (3.7) in Z v3, p. 43, has an extra scalar in the rational inverse diagram. Equation (3.6), p. 42, gives Φ=Sch∘j, so the inverse must be Ψ′=j∘Φ⁻¹=Sch⁻¹, as stated in Remark 3.4.15, p. 44. The scalar on the left of (3.7) alone instead yields (1−ζ_p)⁻ⁿSch⁻¹. In the smooth integral square of Theorem/Definition 3.3.4, p. 36, the left map is inclusion of the image lattice; rewriting it using a scalar scales both sides and cancels. Remove the scalar arrow in (3.7), or scale its bottom map too. The packet’s inverse target was already correct; added the proof correction, a torus normalization acceptance check and the direct nice-model prerequisite. This finding concerns the identified preprint, not the unread Annals article.

## Baseline and existing ownership

No baseline citation was removed. Each declaration was read in its module at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; their hypotheses and conventions match the uses:

| Declaration | Checked statement and use |
| --- | --- |
| `LinearMap.IsPerfPair` (`LinearAlgebra.PerfectPairing/Basic.lean`, definition near line 39) | Both linear adjoints are bijective over a commutative semiring. The underived field-valued pairing is its specialization; it does not replace derived internal-Hom perfection. |
| `Representation.invariants` (`RepresentationTheory/Invariants.lean`, definition near line 73) | The submodule consists of vectors fixed by every group element; membership is pointwise. Only the ordinary degree-zero specialization is imported. |
| `IsPGroup.exists_fixed_point_of_prime_dvd_card_of_fixed_point` (`GroupTheory/PGroup.lean`) | For a finite acted-on type of cardinality divisible by p, a given fixed point has a distinct fixed point. Applying it to finite nonzero V with zero fixed gives the required invariant vector. |

The suggested file elaborates against that pinned Mathlib with Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369` recorded. A separate read-only audit used current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. All nine post-snapshot directions named in WORKERS were searched in their suggested files. DifferentialGeometry’s Poincaré duality is de Rham duality on manifolds and does not supply the present analytic étale targets. Read upstream AdicSpaces and ProfiniteCohomology documents for granularity and import boundaries. Current profinite cochains are reused through D7, not replanned.

In current Tau Ceti, `Representation.exists_common_fixed_vector_of_isPGroup` and `Representation.invariants_ne_bot_of_isPGroup` in `RepresentationTheory/Unipotent/PowerOrder.lean` apply to a nonzero finite-dimensional module over a field of exponential characteristic p and a p-group, even infinite. The finite-group theorem `Representation.exists_ne_zero_apply_eq_self_of_forall_pow_eq_one` is another available route. These are current-library imports, not falsely added to the pinned baseline. The unnamed pinned example specifies compatibility only.

Read the reviewed library-coverage audit, especially classical H0–H5, formal geometry, derived sheaves and scheme SF.2. Existing generic derived categories, invariants, bilinear pairing and trace infrastructure are reused. The needed formal almost-coherent duality and rigid Zariski-constructible proper-base-change APIs were not found as implementations. The reserved `SchemeAndStackFoundations:key/coherent-duality` node remains an import in its Noetherian finite-type range; G1 explicitly records the valuation-base extension. H3’s all-torsion trace, proper projection formula and amplitude nodes were read and their stronger ranges retained. H3’s weak geometric base change is not substituted for arbitrary proper p-torsion base change; H5’s proper comparison is not substituted for PD.7’s nonproper affinoid comparison.

## Source and discrepancy checks

Every node locator in the table below was opened and compared with its statement, hypotheses, proof sketch and source `match`. All repository prose is paraphrased. The source record distinguishes versions and published texts not compared. SW §10.5 and PS Theorem 3.17 were read in the maintainer’s cleared library; no source files or passages from that library were copied into the repository or scratch.

| Source | Version checked and scope |
| --- | --- |
| [Z](https://arxiv.org/pdf/2111.01830v3) | v3, printed pp. 1–99 as needed by the node locators. Author-hosted PDF separately compared for E13–E14 at pp. 53–54 and 81–83; its recorded SHA256 matches. Annals text not compared. |
| [AC](https://arxiv.org/pdf/2110.10773v3) | Formal almost coherence, affine equivalences, proper mapping/duality and nearby-cycle statements at the packet locators. [v5](https://arxiv.org/pdf/2110.10773v5) separately checked for E16–E18; both recorded hashes match. EMS text not compared. |
| [SW](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf) | Cleared 27 March 2020 author version, §10.5, printed pp. 82–89, including the full factorization proof. |
| [BH](https://arxiv.org/pdf/2101.09759v2) | v2, Definition 3.1, Warning 3.2, 2.27/2.29, 3.5–3.7, 3.10, 3.15 and 3.25 with their proofs; printed pp. 13–20 and 25. |
| [H](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf) | Published open-access PDF, base-field convention and Proposition 2.18/proof, p. 279. |
| [U](https://arxiv.org/pdf/2102.04752) | Theorems 1.3–1.4, pp. 4–5, and their quotient explanation. The proof remains the G2 supplier gap. |
| [PS](https://arxiv.org/pdf/1303.5948) | Cleared survey, Theorem 3.17/proof, pp. 19–20, including singular proper scope. The full supplier decomposition remains G3. |

All existing E1–E20 are **confirmed**, with independent reasons in their `review` objects. E21 is newly added and **confirmed**. E19 is explicitly a known published correction recorded by SW, not a new error in that book. E13 is independently detected by uv=ϖ: the opposite character lines multiply into the proper ideal ϖO_C. E14 is detected by the top class of P¹ and forces target Λ[−2d]. E18 is refuted by the unit as first Hom input and a coherent complex nonzero in every negative degree as second input. These tests support the corrected mathematical statements, without claiming corrections to unread editions.

## Node-by-node verdicts

All ids below have prefix `ClassicalAdicEtaleCohomologyPartII:`. Full locators and source-match text are in each packet node and reader entry. “Verified” permits the explicitly recorded supplier contracts and G1–G5; it never means a closed proof or Lean implementation.

| Node | Verdict | Independent check |
| --- | --- | --- |
| `PD.0/formal-almost-coherence` | corrected | AC 4.5.3/4.5.6/4.5.22 and 4.8.9 support the affine and derived definitions; distinguish almost adically quasi-coherent from ordinary adically quasi-coherent. |
| `PD.0/affine-almost-derived-calculus` | verified | AC 4.8.6/4.8.16 and 5.1.6 give the stated affine equivalence and proper mapping. The Hom bounds use the corrected order in E18. |
| `PD.0/almost-proper-duality` | verified | AC 5.5.2/5.5.5–5.5.7 give the almost quotient adjunction and comparison on the target. G1 explicitly supplies universally coherent scheme duality. |
| `PD.0/nearby-cycle-complexes` | corrected | Split Z’s specialization definition from AC 6.13.5–6.13.6, which supplies general almost coherence, reduction and dimension bounds; no smooth-only inference. |
| `PD.0/generic-fibre-almost-complexes` | corrected | Added smoothness specifically to the C.9 nearby-cycle comparison and its API. C.4–C.8 support generic fibre and proper comparison without that extra hypothesis. |
| `PD.1/formal-dualizing-complex` | corrected | Restored separatedness from Z 2.4.1. Retains choice dependence of the complex, canonical bottom sheaf, derived reduction and amplitude. |
| `PD.1/formal-dualizing-comparison` | corrected | Restored separatedness in the étale and algebraization assertions of Z 2.4.7–2.4.9; completeness itself has the broader scope of 2.4.6. |
| `PD.1/hartogs-gluing` | verified | Z 2.5.1/2.5.2 define the kernel before an intersection notation is legitimate. The three tests distinguish compatible pairs from an unrestricted sum. |
| `PD.1/formal-hartogs` | corrected | Made the canonical-sheaf separatedness explicit and replaced a vague hypothesis reference by the reduced-residue-fibre, dense-open reflexive statement of Z 2.5.4. |
| `PD.1/formal-bottom-trace` | corrected | Restored separatedness of the models. Z 2.6.1–2.6.2 support compatible underived bottom traces, not a general formal f!. |
| `PD.1/canonical-generic-identification` | corrected | Restricted the construction to algebraically closed K=C, as stipulated at the start of Z §2.7; retains reduced residue fibre and noncanonical complex comparison. |
| `PD.1/rigid-coherent-trace` | corrected | Restricted to C as in Z §2.7; replaced the nontrivial field-extension test by an identity test compatible with this base. Split-cover and torus tests retain degree normalization. |
| `PD.2/torsion-free-nearby-cohomology` | verified | Z 3.2.1–3.2.2 quotient by scalar power torsion, not reduction modulo the scalar. Exterior cup products retain the p=2 argument. |
| `PD.2/bms-maps-general-model` | verified | Z 3.2.3–3.2.8 use derived completed cotangent transitivity on general models. The smooth isomorphism is a separate target. |
| `PD.2/smooth-faltings-inverse` | verified | Z 3.3.1–3.3.5 identify the image lattice and Fontaine twist; division onto that image precedes the Tate-valued inverse. Degree zero is specified separately. |
| `PD.2/generic-hodge-tate-trace-comparison` | corrected | Added the direct nice-model prerequisite and correction E21. Equations (3.6) and (3.7), the smooth square and torus test fix the inverse normalization without a residual scalar. |
| `PD.2/nice-formal-model` | corrected | Z 3.5.1 requires separatedness, smooth pure generic fibre and reduced residue special fibre; the stronger qcqs convention is explicit. Made these conditions explicit in the smooth-model example. Modulo p need not be reduced. |
| `PD.2/faltings-traces` | verified | Z 3.5.2–3.5.5 glue smooth and generic maps by Hartogs, then truncate and reduce derivedly; the target shift −2d is correct. |
| `PD.2/pseudo-finite-morphism` | verified | Z 3.6.1 includes almost amplitude in the definition. Generic finiteness alone is not substituted for it; the stated examples are 3.6.2. |
| `PD.2/finite-proetale-traces` | verified | Appendix D.3–D.13 gives exact finite pushforward and split-cover summation, integral limits, rationalization and finite-algebra trace. No degree inverse is used. |
| `PD.2/faltings-trace-compatibility` | verified | Z 3.6.4–3.6.6 support the integral and mod-p squares for rig-étale pseudo-finite maps; E6 repairs the formal-flatness cross-reference. |
| `PD.3/polystable-model` | corrected | Separated qcqs pure-d polystable models are nice; polystability alone does not imply separatedness. Corrected that conclusion and canonical-line API. |
| `PD.3/polystable-root-tower` | verified | Z 4.2.8/4.2.11 and (4.2)–(4.5) give the product-one group and perfectoid limit. Integral finite stages need not be flat over the chart. |
| `PD.3/character-decomposition` | verified | Z 4.2.15/4.2.19 support additive decompositions after E13’s correction. The normalized nodal monomial product keeps its nonunit parameter. |
| `PD.3/polystable-continuous-cohomology` | verified | Z 4.2.13/4.2.23–4.2.26 give characterwise Koszul cohomology and uniform annihilators; completed sums retain their uniform torsion requirements. |
| `PD.3/integral-decalage-polystable` | verified | Z 4.2.27–4.2.30 turn the almost comparison into an honest décalage comparison. Scalar torsion brackets are distinguished from scalar quotients. |
| `PD.3/root-stage-trace` | verified | Z 4.3.1/4.3.3 define projection onto the base character summand. The normalization at 1 excludes the ordinary degree-divisible-by-p algebra trace. |
| `PD.3/root-algebra-derived-duality` | verified | Z 4.3.2/4.3.4–4.3.7 give derived Hom duality over the singular base; no false flatness or strong-grading premise is used. E15 fixes the stage index. |
| `PD.3/oriented-group-trace` | verified | Z 4.3.9/4.3.13–4.3.14 support the top Koszul projection and character projection. Basis dependence is carried by the orientation line. |
| `PD.3/continuous-local-duality` | verified | Z 4.3.10–4.3.15 use opposite-character derived duality and an almost sum-to-product comparison. The pairing is not declared honestly perfect before almostification. |
| `PD.3/polystable-local-duality` | verified | Z 4.3.16–4.3.17 identify the geometric Faltings pairing and derived mod-p reduction. The canonical sheaf remains integral until reduction (E8). |
| `PD.4/faltings-pairing` | verified | Z 4.1.1 and §1.4 define perfection by both internal-Hom adjoints. The dualizing-complex target is not replaced by a projectivity assertion. |
| `PD.4/rig-isomorphism-descent` | verified | Z 4.4.3 uses nearby-cycle invariance, trace compatibility and almost proper duality. The input is a proper rig-isomorphism between nice models. |
| `PD.4/good-quotient` | verified | Z 4.4.2 retains finite quotient, quasiprojective residue fibre and generic G-torsor conditions. G2 owns quotient existence; PerfectoidQuotients Q0 does not. |
| `PD.4/equivariant-almost-descent` | verified | Z 4.4.4/4.4.10/4.4.12/4.4.14 define derived invariants and orbits over the group algebra. The left/right conversion is explicit for nonabelian G. |
| `PD.4/equivariant-derived-calculus` | verified | Z 4.4.11/4.4.15 commute the indicated site pushforward with homotopy operations and identify contragredient Hom; no exactness of ordinary invariants is assumed. |
| `PD.4/good-quotient-descent` | verified | Z 4.4.16–4.4.23 use induced torsor Shapiro objects for the orbit and invariant comparisons. They do not claim a norm isomorphism for arbitrary modules. |
| `PD.4/local-almost-duality` | verified | Z 4.4.1/4.4.24 use the altered-uniformization zigzag; niceness is retained from 4.1.2 (E10), and G2 explicitly leaves the geometric proof input open. |
| `PD.5/global-almost-trace` | verified | Z 5.2.1–5.2.3 construct the proper-model counit composite. The negative trace shift and model independence are retained. |
| `PD.5/global-almost-duality` | verified | Z 5.2.4–5.2.5 give derived and degreewise almost duality. Almost finite freeness follows from proper smooth primitive comparison, not from all almost coherent modules. |
| `PD.5/almost-detection-and-top-trace` | verified | Z 5.3.3/5.4.2–5.4.3 detect finite F_p isomorphisms almostly; H3 supplies the analytic trace. The additional connected top-trace property is an explicit supplier contract. |
| `PD.5/mod-p-poincare-duality` | verified | Z 5.4.4 gives the stated geometric pairing, Tate twist and Galois action. Geometric connectedness is required for a single top-trace isomorphism. |
| `PD.5/local-system-duality` | corrected | Z 5.4.5 gives finite-local-system duality. Added explicit reuse of current Tau Ceti’s fixed-vector theorem instead of allocating the algebraic step anew. |
| `PD.5/proper-p-adic-perfectness` | corrected | Split the Z 5.5.1 citation from PS 3.17, which provides singular proper finiteness. Derived reduction and Mittag–Leffler preserve perfectness and allow integral torsion. |
| `PD.5/finite-p-power-duality` | verified | Z 5.5.2 after E14 gives the shifted derived pairing; scalar reduction is over Z/pⁿ, not a false derived reduction over Z_p. |
| `PD.5/p-adic-traces` | verified | Z 5.5.3/5.5.5 construct the compatible inverse-limit and rational traces. Top truncation supplies the derived trace to the correctly shifted coefficient module. |
| `PD.5/integral-derived-duality` | verified | Z 5.5.4 after E14 gives perfect derived Z_p duality. Integral cohomology may have torsion; no degreewise free-module duality is asserted. |
| `PD.5/rational-derived-duality` | verified | Z 5.5.6 after E14 follows by inverting p; field coefficients then give the degreewise perfect pairings. |
| `PD.6/disconnected-coherent-reduction` | verified | SW 10.5.2 and 10.5.4–10.5.5 give coherence, almost submodule finiteness and the stated strict-base sheaf/flatness facts. |
| `PD.6/relative-strict-containment` | corrected | Corrected sourceId to SW. Lemma 10.5.8 defines extension into V, not necessarily U; higher-rank valuative tests distinguish it from ordinary inclusion. |
| `PD.6/relative-finite-presentation` | corrected | SW 10.5.9 proves finite presentation as an algebra, not a module. Reassigned finite-stage approximation to PerfectoidSpaces P5/P6; power-bounded base change remains G2. |
| `PD.6/relative-restriction-factorization` | verified | SW 10.5.8 gives module factorization of the restriction map under strict containment. G5 retains the valuation-base properness criterion input. |
| `PD.6/spectral-factorization` | verified | SW 10.5.6–10.5.7 give the finite spectral-sequence chain length and factorization conclusion. An identity retract suffices; image finiteness is not used. |
| `PD.6/relative-almost-finite-presentation` | verified | SW 10.5.10 combines the finite charts, nested covers and spectral factorization for relative O⁺/p cohomology, retaining the strict perfectoid base. |
| `PD.6/relative-local-constancy-criterion` | verified | SW 10.5.3 uses continuous elementary divisors and relative primitive comparison. G5 records the continuity proof; C1 is used only in its all-p quasi-pro-étale range. |
| `PD.6/relative-mod-p-finiteness` | verified | SW 10.5.1 follows after strict-base descent and the preceding criterion; it does not assume the arbitrary proper p-torsion base change proved later. |
| `PD.6/relative-integral-finiteness` | corrected | Routed geometric lattice comparison to the exact P8 node, with finite torsion/free devissage; D7 supplies limit algebra. SW p. 82 supports finitely generated, possibly torsion, direct images. |
| `PD.7/zariski-constructible-complex` | corrected | Replaced unrelated BH 1.2/1.3 by Definition 3.1 and Warning 3.2. Locally bounded non-qc and bounded qcqs conventions remain distinct from Huber constructibility. |
| `PD.7/constructible-locality-and-generators` | corrected | BH 3.5–3.7 use finite-cover unipotence, not geometric PD.5 duality. Replaced the unnecessary duality prerequisite by the fixed-vector/invariant baseline; G4 retains branched-cover extension. |
| `PD.7/proper-constructible-pushforward` | verified | BH 3.10 uses finite-range resolution descent, generic smoothness on the reduced target and PD.6. G5 retains BH 2.27/2.29 proof inputs. |
| `PD.7/proper-field-extension` | verified | BH 3.25 covers arbitrary algebraically closed field extensions using almost integral toric comparison, not only transcendence-dimension-zero base change. G3 retains the required local calculation. |
| `PD.7/proper-base-change-all-torsion` | verified | BH 3.15 combines constructibility, geometric field extension and the separate prime-to-residue/p-primary branches. No circular use in PD.6 occurs. |
| `PD.7/heuer-constant-cohomology-sheaf` | corrected | Heuer Proposition 2.18 is on published p. 279 in volume 240, pp. 261–312. Corrected metadata and locator; the assertion concerns the big smooth étale sheaf, not global product cohomology. |
| `PD.7/affinoid-constructible-algebraization` | verified | BH 3.7 includes full faithfulness, proper essential surjectivity, lisse comparison and nonproper finite-type direct-image comparison. G4 explicitly retains the unread Hansen proof inputs. |

## Closure and next work

The stage order is acyclic: PD.0–PD.5 construct and globalize duality; PD.6 proves relative finiteness independently; PD.7 uses that finiteness, proper comparison and resolution. The packet requests only the all-p quasi-pro-étale branch from C1 before proving arbitrary proper base change. Its post-AInf/P-adic-Hodge/C1 placement introduces no upward citation into the parent classical roadmap. Target grouping retains the definitions and key theorems needed for the three routes; no microlemma splitting was needed. No nodes were added.

Every definition/construction was checked for usable API and three discriminatory tests, including almost-zero versus p-torsion, reduced residue fibre versus modulo p, image lattice versus quotient, parameter-weight multiplication, derived duality over a singular base, finite-group orbits versus invariants, strict containment at higher-rank points, and Huber versus Zariski constructibility. Planet choices and counts were retained. The suggested file remains 57 lines rather than developing unavailable carriers.

The following are the next workers’ mathematical inputs; none is silently assumed proved:

- **G1:** universally coherent valuation-quotient duality, compactification, amplitude, bottom flatness and reflexivity, beyond the reserved Noetherian node.
- **G2:** reduced cofinal models, refined Elkik/Reduced Fibre arguments, finite formal quotients, the full altered-uniformization zigzag and power-bounded relative base change. U 1.4 is the precise external theorem, not Raynaud alone.
- **G3:** general almost-coherent nearby cycles, singular proper primitive comparison and BH 3.25’s integral toric field-extension calculation. The existing smooth proper P8 node has insufficient scope.
- **G4:** Hansen (2020) 1.6, 1.8 and 1.10(ii), invoked by BH 3.7 for branched-cover extension and nonproper constructible comparison. Their proofs remain unread and explicitly open; do not infer them from proper GAGA.
- **G5:** SW’s valuation-base properness/finite-presentation criterion and continuous elementary divisors, and BH weakly Shilov generic-flatness/smooth-fibre arguments. Generic smoothness produces a dense open of the target.

For the orchestrator: retain the three proposed supplier continuations and allocate the next free Adic Spaces continuation name; existing III/IV names must not be reused. Dispatch the open stage refinements through these recorded contracts. No mathematical question blocks acceptance of this planning pass. Before claiming closure or producing a final gap-free assembly, resolve G1–G5 and the listed supplier refinements. No supplier files or atlas content were edited in this review.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalAdicEtaleCohomologyPartII.json`: zero errors and zero warnings. `lean-check research/blueprint/suggested/ClassicalAdicEtaleCohomologyPartII.lean`: successful elaboration at the pinned Mathlib; only the two expected `sorry` warnings. A separate consistency check confirmed all 64 node statements, proof steps, APIs, tests, locators and prerequisites against the reader, all 26 supplier contracts, the 64 review verdicts and all 21 source-issue verdicts. JSON parsing and `git diff --check` passed. Only the five authorized deliverables changed.
