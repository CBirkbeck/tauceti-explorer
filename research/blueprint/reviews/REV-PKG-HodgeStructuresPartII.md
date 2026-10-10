# Independent package review: Hodge structures, Part II

Verdict: **needs_changes**. Reviewer: `independent-review-REV-PKG-HodgeStructuresPartII`. Date: 2026-10-10. Agent: Codex, session `codex-imGFlM`.

This completes the independent package review requested by #7523. The package has substantial mathematical specifications and useful native local prototypes. Its Lean file elaborates, but the global definitions, comparison theorems, APIs and geometric tests required by the accepted plan are largely comment inventories. Two foundational supplier contracts also exceed what their cited suppliers actually specify. These are substantive gaps, so successful elaboration cannot justify acceptance.

The reviewed starting revision was `4d7c5071a5cb34e311750e1f3f831581c31e4cca`. The package was written by other sessions; this reviewer did none of its package work.

## Checks and corrections

| Requested check | Result |
| --- | --- |
| 1. Upstream form and size | Nine mathematical layers, conventions, ownership, APIs, tests and versioned references are present. The corrected README is 199,806 bytes, below the 200,000-byte limit. Read current upstream HodgeStructures and AlgebraicVectorBundles for scope and form. |
| 2. Fidelity and prerequisite closure | **Fails.** The global targets remain required, and the CR.1 and DD.1 imports do not provide their full consumer contracts; see R2 and R3. Acceptance of the input plans does not discharge their recorded gaps or supplier requests. |
| 3. Own words and source locators | Read the whole README. No source passage or source-by-source synopsis was found. References identify editions and the layer statements use theorem/section/page locators, or stable Stacks tags. Independently checked the source statements relevant to R2 and R3. Corrected the extension/curvature citation to Stacks Remark 60.6.8. This does not certify every theorem in every cited paper anew. |
| 4. No programme process | Replaced the signature-coverage discussion with mathematical supplier comparisons and geometric tests. The README contains no packet filenames, job IDs, review verdicts or checkpoint statuses. |
| 5. Suggested Lean file | Elaboration **passes**; correspondence to the full plan **fails**, as detailed in R1. |
| 6. Metadata | Passes: exactly `topic = "math.AG"` followed by a newline; the category fits the roadmap. |

In-place corrections also point the parent link to the current `Completed/HodgeStructures` roadmap, restore the Donaldson functional's five discriminating metric tests, and restore the admissibility projections, coordinate-change API and four explicit punctured-disc tests. The latter distinguish relative-filtration failure from failure of the limiting flag. The Lean file and metadata were unchanged.

The ten accepted inputs are the parent packet and continuations H.0–H.8. Their inventory contains 885 nodes, including 195 definitions/constructions. Each was run through `scripts/check_blueprint.py`: all ten returned zero errors and zero warnings. The inventory and the full README were checked across all nine layers; the decisive signature omissions below were then inspected in executable Lean and in their surrounding scope comments. There is no dedicated HodgeStructuresPartII edge in the current `research/blueprint/links` files; supplier requests and packet prerequisites were therefore checked directly rather than treating unrelated parent-Hodge links as closure evidence.

## R1 — Required global signatures are missing

**High; check 5 and PROTOCOL §§13,20.** The standard non-exhaustiveness note makes the prose definitive. It does not waive the protocol's requirement to supply the plan's definitions/constructions, API lemmas, tests and named theorems. Omission comments are honest descriptions of unfinished interfaces, but Lean does not elaborate their mathematical claims.

Representative evidence in the unchanged [Suggested.lean](../packages/HodgeStructuresPartII/Suggested.lean):

| Layer | Required material absent at its stated geometric scope | Evidence |
| --- | --- | --- |
| H.0 | Intrinsic `LambdaBundle`, its unit-fibre connection equivalence, global twisted Higgs operations, `GriffithsFiltration` and its Rees connection/specializations | Signature/API/test omissions at lines 940–1340. The affine `Preconnection` and twisted Higgs carriers elsewhere have narrower types. In particular, `LambdaBundle`, `oneEquivConnection` and `reesConnection` have no executable occurrence. |
| H.1 | Relative parameter families; represented Betti, Dolbeault, de Rham and Hodge moduli; Riemann–Hilbert; harmonic presentations, metric functional and correspondence; coarse formal/étale product | Lines 9221–9469 explicitly inventory omitted nodes and APIs/tests. Native representations, intertwining quotients and scalar-automorphism results provide algebraic components, rather than these schemes, analytic spaces and family functors. |
| H.2 | Global admissible variations, reparametrization and essential-singularity test; global mixed and coefficient comparisons | The omission inventory starts at line 9916. The necessary fibre/disc data do not provide the holomorphic extension and all-disc pullback theory. |
| H.3 | Represented period manifolds/orbits, geometric derivative, logarithmic curve Kodaira–Spencer and coherent trace/Serre comparison | Lines 10692–10804. Native subspaces and coordinate exponential actions lack the represented and cohomological comparisons. |
| H.4 | Global parabolic bundle, saturated sheaf subobjects, filtered duality, trace sheaf kernel and geometric rank/Artinian applications | Lines 12146–12208 describe exactly what the numerical/fibre constructions leave out. In particular, a supplied catalogue is not the complete collection of saturated subbundles. |
| H.5 | Geometric deformation/cohomology comparisons, prescribed-monodromy moduli and realization/integrality applications | The inventory at lines 13357–14072 retains these as mathematical requirements. Native group cohomology, arithmetic models and a relative quasi-finite locus do not alone supply their moduli or geometric provenance. |
| H.6 | Semistable cohomology/residue comparisons, polarized nilpotent and SL₂ orbits, limiting mixed structures, norm estimates and fixed-K Siegel containment | Lines 14124–14182 explicitly state that these names are not declarations. Local logarithmic equations, matrix identities and coordinate flags omit the variation, positivity and comparison hypotheses. |
| H.7 | Actual rough-function algebra, reduction/Siegel estimates, definable period maps and Hodge-locus algebraicity | The inventory at lines 14965–14976 lists the missing signatures. `specialHodgeImage` is `Set.range` of an arbitrary map; its own interval example shows that this operation gives no closed-analytic-image theorem. |
| H.8 | Geometric real variation and derivative, Green/Voisin and normal-boundary comparisons, real density, affine CW/Gysin statements and equivariant divisor export | Global omission ledger at lines 15479–15514. Local analytic submersion and lattice results are useful inputs, but do not state the corresponding geometric theorems. |

**Required correction:** construct/import the actual native supplier carriers, state each global target at its intended scope, and transfer its API and discriminating tests into Lean. Preserve the local constructions and their narrower scope. Do not create arbitrary result types, `Prop := sorry`, theorem-valued fields assuming the desired result, or independent supplied maps masquerading as geometric comparisons. The omitted interfaces require design and supplier work; inserting declarations around arbitrary placeholders would not be a clear review fix.

## R2 — The ordinary-connection import does not cover the consumer

**High; check 2.** Parent nodes `H.0/intrinsic-preconnection` and `H.0/ordinary-fiber` require an additive sheaf operator on any commutative ringed Grothendieck site with supplied exterior calculus. The λ=1 comparison must preserve its actual section maps, restrictions, exterior extension and curvature.

`CrystallineCohomology:CR.1/integrable-connection` in the CR.0 continuation instead assumes, for rings, a surjection from the relative Kähler module onto the chosen one-form module. Its sheaf version is on the small crystalline site with its PD-base and nilpotence hypotheses. Neither clause supplies the arbitrary differential-site carrier. The H.0 continuation explicitly records this request; the README's ordinary-fibre paragraph still consumes it.

A separating example is a one-point site with O=Q, Ω¹=Qω, higher positive exterior degrees zero and scalar differential zero. On E=Q, D(q)=qω is additive, satisfies unit-parameter Leibniz and is flat, while D(1) is nonzero. The relative Kähler module Ω¹_(Q/Q) vanishes, so it cannot surject onto this Ω¹. At pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, `KaehlerDifferential.subsingleton_of_surjective` proves the required vanishing for the identity algebra map. The package's `NonUniversalDifferentialChecks` confirms the affine calculation independently of the supplier.

[Stacks Remark 60.6.8](https://stacks.math.columbia.edu/tag/07I0) states the quotient-calculus convention. [§60.15 and Lemma 60.15.1](https://stacks.math.columbia.edu/tag/07J5) concern the crystalline-site connection of a crystal. Neither source asserts the general-site equivalence required here.

**Required correction:** reconcile/export the arbitrary supplied-calculus sheaf carrier in the owning connection roadmap and then build the same-calculus λ=1 comparison. Retain crystalline hypotheses only for crystal comparisons. Narrowing H.0 to universal-generated forms would change the accepted consumer and exclude its stated test. This review is not authorized to edit the supplier packet or relocate ownership.

## R3 — The finite ordinary Rees export is absent

**High; check 2.** The parent `griffiths-filtration`, `rees-parameter` and `rees-specialization` nodes require a finite locally split filtration by subbundles, finite locally free graded quotients, the ordinary sheaf lattice ΣFᵖt⁻ᵖ, and natural sheaf isomorphisms at t=0, t=1 and after t inversion. Restriction, descent, tensor and quotient coherence are needed before the operator t∇ can be compared.

The cited DD.1 nodes `filtered-modules` and `rees-description` specify enhanced filtered derived objects, a graded derived Rees equivalence, a derived t-cofiber and inversion. Their statement does not construct the finite locally free sheaf lattice or its ordinary fibres, especially the t=1 map and descent/compatibility package. The H.0 supplier request correctly distinguishes the two contracts. The module case has a precise source: Bhatt's [Prismatic F-gauges notes](https://www.math.ias.edu/~bhatt/teaching/mat549f22/lectures.pdf), §2.2.1, Proposition 2.2.6 and Remark 2.2.8, pp.16–17, distinguish the derived equivalence from its finite-projective, finite-filtration specialization. Applying that specialization locally and constructing the natural descent maps remains a required target/export.

Current Tau Ceti's `reesAlgebra.grade` and `mem_grade_iff` in `TauCeti/RingTheory/ReesAlgebra/Grading.lean` concern powers of an ideal inside R[X]. They do not provide this arbitrary filtered module-sheaf carrier. Current AlgebraicVectorBundles and native sheaf dual/tensor APIs are useful existing inputs; they must be consumed rather than replanned, but do not themselves supply the missing Rees construction.

**Required correction:** supply the finite ordinary filtration/Rees interface and its comparison to DD.1, including all three operator-compatible specializations and geometric tests. Resolve ownership consistently with the existing request before declaring that import closed. A rank calculation, a split coordinate model or derived completeness cannot replace these natural sheaf maps.

## Validation receipt and limits

Managed `lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean` exited 0 against the shared pinned build (Mathlib `082e2d3`, Tau Ceti build designated `f790474`). There were **zero errors, 1,619 warnings, all exactly “declaration uses `sorry`”, and no other warning kind**. Memory was checked before compilation. The reviewed Lean file's SHA-256 is `778f52349358e94c6e8de9d4b1f1611865d32fcdf03fbdb00f10cf9d22eec8e4`; it was not edited, so this receipt applies to the submitted file.

The reviewed library audit's four parent-Hodge entries and the current read-only upstream roadmaps/library were consulted. Current roadmap main was `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`; current Tau Ceti was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The parent is now completed, so this review introduces no replacement plan for its pure, polarized, mixed or period-point theory. In particular, older audit notes are not treated as proof that current native APIs are missing. Current `Scheme.Modules.isIso_dualTensorIhom_of_isLocallyFree` was read with its local-freeness and finite-type hypotheses.

This is a finished negative review, not a package implementation or an unfinished review checkpoint. R1–R3 are sufficient to prevent acceptance. They identify the first work needed by a package revision without claiming an exhaustive new source audit or formalization of any admitted result.
