# Independent verification of RT-PAPER-LANDESMAN-LITT-24

Job `REV-RT-PAPER-LANDESMAN-LITT-24`, issue #4049. Codex, session `codex-5ebb6f`, 2 October 2026. Input snapshot: repository commit `8272d65`.

**Verdict: 63 confirmed, 1 rejected.** All 64 findings have an individual, evidence-based reason in [the review JSON](../redteam/RT-PAPER-LANDESMAN-LITT-24.review.json). The confirmed findings comprise 3 high, 35 medium and 25 low findings. Finding **/54**, concerning the original integral matrix lift, is rejected. The 38 confirmed high/medium findings require fixes; several proposed fixes need the qualifications below.

I did none of the extraction, its independent review or this red team. Those jobs identify sessions `cc-7b31c4`, `cc-39fac3` and `cc-c2c06b`, respectively. The shared GitHub account does not identify the worker session. No extraction, route, blueprint or upstream file was edited in this verification.

## Evidence and scope

The main source was [Landesman–Litt, arXiv:2205.15352v4](https://arxiv.org/pdf/2205.15352v4), posted 23 February 2025, 62 pages. The downloaded PDF has SHA-256 `4cb511ba40675aa6899b351f2ee27eb9487b4a21f65ec8000c1f2cc1a5107ceb`, matching the extraction. I checked the passages cited by the findings in the introduction, §§2–10 and Appendix A against the extraction, including the surrounding hypotheses and uses. I inspected the rendered page 29 to distinguish the induced filtration map from the Gauss–Manin connection. This is a targeted verification of every finding, not a claim to have re-proved the whole paper or read every cited proof. The published Annals edition and the paper's TeX were not used; source wording/corrections in this review concern v4.

Additional primary sources read at the relevant passages:

- [Cousin–Heu, arXiv:1612.05779v4](https://arxiv.org/pdf/1612.05779v4), introductory connection/deformation definitions and Theorem A, pp.3–4.
- [Mochizuki, Astérisque 309 (2006)](https://www.numdam.org/item/AST_2006__309__R1_0.pdf), §10.1.4, Theorem 10.5 and its proof, printed pp.98–99, and §10.2.3, Lemma 10.13, p.101.
- [Landesman–Litt, arXiv:2202.00039v3](https://arxiv.org/pdf/2202.00039v3), Lemma 7.5.1 and proof, pp.54–55.
- [Klevdal–Patrikis, arXiv:2009.07350v2](https://arxiv.org/pdf/2009.07350v2), Remark 4.8 and §6.1/Theorem 6.1, pp.16–17.
- [Esnault–Groechenig, arXiv:1711.06436v3](https://arxiv.org/pdf/1711.06436v3), §2 and Remark 2.4, p.6. The earlier v2 was also inspected but is not the source for that remark.
- [SGA1, arXiv:math/0206203v2](https://arxiv.org/pdf/math/0206203v2), X, Corollary 1.8, and XIII, Proposition 4.6, in the recomposed SMF edition. The latter is a Künneth proposition with desingularization and prime-to-characteristic hypotheses, not an unrestricted positive-characteristic scalar-extension theorem.
- [Putman–Wieland, public author version dated 17 October 2012](https://www3.nd.edu/~andyp/papers/HigherPrym.pdf), conjectures and Theorem C, pp.3–4.
- [Stacks Project, Tag 0BTX](https://stacks.math.columbia.edu/tag/0BTX), the field exact sequence for schemes.

Anderson74's full primary text and Debarre's original proof were not obtained. The confirmations concerning them establish an omitted cited input and an unclosed source/hypothesis contract. They do not certify the exact original hypotheses from a secondary quotation. SGA4's full neighborhood proof, the admissibility literature, and Marković's original counterexample were not independently proved or source-completed here. Their use/missing inventory is visible in the main paper and is identified as supplier work in the verdicts.

I read all 139 extraction items, all five routes/briefs, the 17 prerequisite entries, the relevant sourceIssues and their review notes, the extraction/report/review, and all 64 red-team entries and the report. I checked the named supplier descriptions and overlapping routes: R02–R04, R09, SF.3, IG.0/1/3/5, D0, H0, DWP.7/8, GS.6, C4/5, ShimuraData:D3, and the upstream topology, representation, Hodge, curve, Jacobian and stable-reduction contracts. In particular I read the LV.5 proposed stage/nodes, its restructuring and review qualification, RT-AREA-etale/4 and Edit 2, CHEN24/77/127/128 and route 7, the Gao–Habegger/BKT/Benoist Hodge requests, DGH/BFP pointed-moduli requests, Abe's crystalline route and KP25's group-companion proposal. Related character-variety items in Ghosh–Sarnak, Yu and Paškūnas–Quast were compared for ownership.

The reviewed library audit was consulted, including AUDIT-02's pure/rational-mixed distinction. Declaration statements and their surrounding assumptions were then read at **Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`** and **Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`**. Searches alone were not treated as proof of a declaration's scope.

## Corrections the fixer must preserve

The three high findings are confirmed, with an ownership qualification on /3.

- **/1:** §3's abstract-group, complex Artinian deformation and normal-subgroup constancy are not supplied by the present arithmetic R04 contracts. Plan an explicit earlier abstract-deformation interface; import discrete Hochschild–Serre from a generalized cohomology owner. R02.2's arithmetic/continuous description needs an explicit discrete contract. The universal arithmetic deformation-ring input stays separate.
- **/2:** use the generic point of the moduli stack over **Q** in every copy. The geometric subgroup enters only after restricting the arithmetic moduli action.
- **/3:** LV.5 already proposes the surface/mapping-class infrastructure. Its packet is `needs_changes`, with ownership transfer unresolved; it is not a certified completed supplier. Coordinate the single owner and Part II proposal rather than creating another copy or silently applying the proposed restructuring.

The other confirmed findings fall into these groups; the JSON gives each locator, limitation and correction:

| Findings | Confirmed repair |
|---|---|
| /4–6, /18–19, /36, /55 | Split built objects/results from genuinely missing theorem interfaces; preserve coefficient, finite-dimensionality, group and analytic hypotheses. |
| /7–8, /21–22, /27–28, /39, /43–44, /49–53, /59–61 | Correct hypotheses, theorem implications, domain/type distinctions, notation and locators. |
| /9–17, /20, /23–26, /29, /37 | Inventory the missing definitions and cited contracts; supply the exact bridge to the consumer, with original-source gates where necessary. |
| /30–35, /38, /63 | Resolve shared ownership and order foundational contracts before application results. |
| /40–42, /45–48, /56–58, /62, /64 | Complete proof/inventory interfaces and propagate existing corrections through notes and summaries. |

Specific changes to the proposed fixes matter:

1. **Vector-bundle duality (/4):** the assertion that no owner plans it is too strong. StableReduction Layer 2 and shared contract J-B/SR-2 already own relative trace/duality. Ask that owner/SF.3 for the explicit locally-free-sheaf, cup-product-compatible specialization. Do not build a separate general duality theory inside the Hodge application.
2. **Unitary semisimplicity (/5):** the pinned invariant-complement theorem applies to any group acting by unitary continuous linear operators in finite dimensions. Mathlib's `ContRepresentation` does not require a topology on the acting group. A compact image-closure argument is not compulsory for this use.
3. **Ext and deformation families (/6, /20):** specify the underlying-module splitting needed for the Ext/H1 dictionary. Mochizuki's analytic/continuous deformation does not become the connected finite-type algebraic family consumed by Lemma 8.5.2 merely by rewriting the theorem. Record and prove the fixed-determinant/connected-component/family bridge. The absence of a formalization definition alone is not an established published error.
4. **Stack comparison and moduli (/24, /26, /30–31):** reuse CHEN24/128's stack request and the shared StableReductionPartII pointed-moduli request. Current C4 is GAGA, not Riemann existence. Current IG.5 needs its explicit marked-genus extension. Keep smooth moduli distinct from their proper stable compactifications; the smooth open is not proper.
5. **Hodge dependency order (/35):** moving general definitions to route 2 is insufficient if the Hodge engine still imports later application lemmas from route 1. Extract an earlier curve/moduli/topology foundation and identify each cross-route layer edge. Keep generic VHS owned by D3 and real mixed theory as an additional contract.
6. **Companions (/37):** the actual KP20b proof uses Drinfeld2018's pro-semisimple comparison, retaining group-valued algebraic monodromy. Drinfeld2012 GL_n companions alone are not that contract. Coordinate KP25's existing proposal and its unresolved source gates, rather than calling it an accepted closed supplier or conflating it with Abe's crystalline tranche.
7. **Deformation rings (/22, /38):** non-flatness alone does not imply failure of complete intersection. Retain the established weaker consequence and leave the claimed negative answer to Flach unsupported unless another argument is supplied. The resulting application consumes R04 representability; it must not become a foundational input of R04.
8. **Source/proof issues (/15, /20, /24, /39–41, /47):** distinguish ambiguous wording, a missing formalization bridge and an actual false statement. Routine reductions should be made explicit in the blueprint without automatically declaring a published theorem false. The genus exceptions in /27 and torus counterexample in /28 are concrete statement failures of the unrestricted extracted forms.

## Pinned library ledger

These are the principal declarations whose scope determines the disputed statuses. Line numbers refer to the pinned source, not to a suggested implementation.

| Use | Declaration/source and verified limit |
|---|---|
| /4 | Mathlib `Representation.IsIrreducible.algebraMap_intertwiningMap_bijective_of_isAlgClosed`, `RepresentationTheory/Irreducible.lean:71`; `FDRep.finrank_hom_simple_simple`, `FDRep.lean:160`; `isotypicComponent`, `RingTheory/SimpleModule/Isotypic.lean:178`. These do not supply arbitrary infinite-group Clifford theory. |
| /4, /13 | Mathlib `ProfiniteGrp.ProfiniteCompletion.denseRange` and `etaFn_injective_iff_residuallyFinite`, `Topology/Algebra/Category/ProfiniteGrp/Completion.lean:103/97`; `Group.ResiduallyFinite`, `GroupTheory/ResiduallyFinite.lean:33`. Density is general; injectivity needs residual finiteness. Neither establishes surface residual finiteness or completed-extension exactness. |
| /5 | Tau Ceti `haarProb`, `Compact/Haar.lean:93`; `haarAverage`, `Compact/Averaging.lean:59`; `ContRepresentation.isUnitarizable`, `Compact/Unitarizable.lean:271`; `exists_isUnitary_congr`, `Compact/UnitaryModel.lean:92`; `ContRepresentation.IsUnitary.isSemisimpleRepresentation`, `Continuous/InvariantComplement.lean:198`. Check compactness, action continuity, completeness and finite dimension where each theorem requires them. |
| /6 | Mathlib `groupCohomology.H1InfRes`/`H1InfRes_exact`, `Homological/GroupCohomology/Functoriality.lean:365/393`, and `groupCohomologyIsoExt`, `Basic.lean:205`. The displayed restriction codomain lacks Q-invariants; the Ext result has the trivial representation as source. |
| /18 | Tau Ceti `HodgeStructureOn`, `Geometry/Hodge/Structure.lean:62`, and `complexificationConjugation`, `Conjugation.lean:84`, provide the conjugation-parametric pure input. `MixedHodgeStructure`, `Mixed/Basic.lean:72`, `deligneSplitting`, `DeligneSplitting.lean:81`, and `Hom.range_inf_F_eq_map_F`, `Strictness.lean:108`, concern the rational/integral mixed model. |
| /19 | Mathlib `Module.Grassmannian`, `RingTheory/Grassmannian.lean:68`, and its functor at line 188 describe rank-k projective quotients, not an analytic manifold or tangent bundle. |
| /36 | Tau Ceti `LocalCoefficientSystem`, `AlgebraicTopology/LocalCoefficient.lean:41`, pullback at 73, monodromy at 267, functor at 319 and basepoint-change equivalence at 348 are built groupoid/local-coefficient inputs. No locally-constant-sheaf equivalence follows merely from a monodromy-functor definition. |
| /55 | Mathlib `NumberField.Embeddings.finite_of_norm_le`, `NumberTheory/NumberField/InfinitePlace/Embeddings.lean:109`, gives finiteness of integral elements bounded under every embedding. Matrix-entry bounds in the chosen integral basis remain an application argument. |

The files can be read in the [pinned Mathlib tree](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib) and [pinned Tau Ceti tree](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369/TauCeti).

## Rejection of /54

The paper's proof on pp.40–41 explicitly uses the finite morphism `G -> PGL_r`. Let `x` be the integral projective point and `y=rho(alpha)` its actual complex lift. The pullback fibre over `Spec O_K` is affine and finite, with coordinate algebra `A` finite over `O_K`. Evaluate `A` at **y**, not at an arbitrarily chosen torsor section. Its image `B` in C is an integral domain finite over `O_K`; its fraction field is a finite number-field extension `K'/K`, and `B` lies in `O_{K'}`. Thus the original matrix, including inverse coordinates in the group scheme, is integral over that extension. Take a compositum for finitely many generators.

Adjoining the finite central roots of unity also compares any two chosen lifts. It is a valid explanatory alternative, but the existing finiteness argument already proves the required existential conclusion. I would spell out that finite-algebra argument in a blueprint; I would not record this as a paper error or require the proposed new sourceIssue.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-LANDESMAN-LITT-24.review.json`.
- `python3 research/blueprint/intake.py check-files` on the two deliverable paths.
- Exact ordered coverage of all 64 input finding IDs, unique review IDs, verdict/severity counts, and `git diff --check`.

No Lean file is a deliverable of this job. No Lean compilation, Lake setup, cache download or library build was run; there is no usable pre-existing compiled build at the pinned commits. These checks validate the review artifacts, not the missing mathematics or proposed proof interfaces.
