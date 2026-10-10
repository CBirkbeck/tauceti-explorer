# BP-BunGAndNewtonStrata~2 — blocked revision checkpoint

Issue #6928; Codex, session **codex-vADPRt**, 10 October 2026. The bot confirmed this session’s claim in [the issue thread](https://github.com/CBirkbeck/tauceti-explorer/issues/6928#issuecomment-6096821726). This is a **partial checkpoint**, required by missing concrete supplier interfaces under G08, rather than the run’s time limit. No stage is closed or implemented. The 98 reviewed target IDs and declaration names, scope, ownership, restructuring and independent `needs_changes` review are preserved. This session takes only this job and stops after submission.

## What this continuation changes

The preceding checkpoints’ coefficient, slope, Brauer sign, right-module Morita, equal-characteristic and integral-torsion corrections remain in place. Their source audits retain their recorded provenance. This continuation adds the concrete **trivialized** tensor presentation of algebraic G-isocrystals; it does not redefine the linear isocrystal category owned by VB0.

`RepresentativeTensor` uses the pinned native finite rational comodule category and its scalar-extension fibre functor. For fields E,L, a commutative Hopf E-algebra H and an E-algebra automorphism σ of L, the value at a finite comodule M is the actual module L⊗_E M. Coefficient Frobenius is σ⊗id_M. The family associated with a native convolution point b is the invertible σ-semilinear map ρ_M(b)(σ⊗id_M). Naturality, the tensor-unit formula and compatibility with the native tensorator are explicit equations in `Data`, rather than unspecified predicates.

Composing a family with inverse coefficient Frobenius gives a native tensor automorphism. The pinned Tannakian equivalence reconstructs its point. The proposed inverse laws recover the entire family. An arrow is a genuine native tensor automorphism satisfying the Frobenius intertwining equation on every rational representation. Such arrows reconstruct precisely the points g with c=g b σ(g)⁻¹. Composition uses h g for a later conjugator h. Native functor and category-equivalence signatures compare this groupoid with the preceding representative groupoid. Native tensor automorphism groups identify multiplicatively with the point sigma-stabilizer; a component formula recovers the action on every representation.

There are **23 additional API items and ten additional typed example signatures**, attached to the existing G-isocrystal, sigma-class and centralizer targets. The examples test semilinearity, coefficient Frobenius at b=1, the tensor equation, failure of L-linearity when σ is nontrivial, conjugator intertwining, multiplication order, whole-family reconstruction, the category comparison and automorphism stabilizers. Seven providing library declarations were added to the baseline. Every new API item and example appears before the comment register in the suggested file. All proof obligations are admitted: elaboration is not implementation or proof validation.

The original full GIsocrystal API and its Witt GL_n/slope examples remain required. They were not renamed to these restricted controls. The register still contains **89 full target-signature omissions**; the other nine targets have explicitly limited typed or imported scope. This continuation narrows G08’s reconstruction boundary to the untrivialized exact category and its Steinberg comparison; it does not close G08.

## Why completion is blocked

The missing structures belong to other roadmaps. Defining their foundations here would violate PROTOCOL §15; editing their files would violate this issue’s four-path deliverable restriction. Using an arbitrary type or unspecified geometric predicate in their place would violate §13. The checked inputs establish these concrete boundaries:

- [VectorBundlesAndIsocrystals](../suggested/VectorBundlesAndIsocrystals.lean) already provides `FiniteIsocrystal`, its Hom/category, tensor object and endomorphism ring. R21 asks for its exported E-linear preadditive, Quillen exact and rigid symmetric monoidal category structures over the actual local coefficient field. This structured target and its coherence are absent from the inspected suggested file. The new trivialized presentation supplies neither the untrivialized exact target category nor Steinberg vanishing.
- The same file supplies `CurveBundle` for schemes. Current upstream AlgebraicVectorBundles supplies reusable scheme module foundations. R23 still requires the **relative analytic** FF bundle category, structured pullback and effective v-descent. Neither inspected input supplies that category.
- [RelativeFarguesFontaine](../suggested/RelativeFarguesFontaine.lean), in `DiamondFormulas`, explicitly omits the actual perfectoid v-site, represented base and coefficient sheaves. Its formulas over generic sheaf objects cannot instantiate the relative geometric hypotheses of Bun_G. The relative curve and completed-divisor interfaces remain qualified contracts.
- [DiamondsAndVStacks](../suggested/DiamondsAndVStacks.lean) explicitly leaves the perfectoid category and geometric interfaces to their suppliers and retains an omission ledger. [VStackSheavesAndLisseCategories](../suggested/VStackSheavesAndLisseCategories.lean) retains omitted signatures for `ArtinVStack`, analytic section/Jacobian geometry and cohomological smoothness. Those are required for the whole-stack and chart targets. Current Tau Ceti searches did not find their concrete replacements.

The independent review remains unchanged. This packet must not be accepted or packaged while its omission register stands in for full suggested signatures. All twelve recorded gaps and 47 supplier requests remain open; no stage is marked closed simply because the structural checker passes.

## Where to resume

1. Resolve VB0/R21 and VB1/R23 in their owners, reusing their existing carriers. Instantiate `TensorInterface` with the actual rational representation source and these structured targets. Compare the new `RepresentativeTensor` family and arrow reconstruction with the full untrivialized exact G-isocrystal category, using the actual local coefficients and Steinberg triviality. Supply the original GL_n/Witt, tensor-slope and G-bundle reconstruction examples.
2. Supply RF and D’s actual geometric carriers and the VS0/VS1 predicates, then replace the family, Bun_G, stratum and chart omission contracts with their full mathematical signatures. Use the existing coefficient-algebra centralizer functor and new tensor-automorphism comparison as algebraic inputs to represented Newton-Levi descent; retain the distinction between J_b and the full bundle automorphism v-group.
3. Import current upstream RG2.1.5/RG2.4 for integral π₁, Galois/inertia coinvariants, z-extensions and affine Weyl/Cartan foundations. Complete the nonsplit/Newton comparison through those owners. Do not restore the duplicate RG2.6 proposal or fundamental-group planet. No ownership move was made by this continuation.
4. Carry on the precise proof interiors in G01–G07 and G09–G12, already listed with consumers in the packet and reader: torus-resolution and relative Tannakian descent; Weil crossed modules; family/topology comparisons; equal-characteristic étale and p-torsion inputs; He–Nie/Chai maximum proof; unitary dimension and ordinary comparisons; G^c lifting; Levi coinvariants; published-edition collation; and Schubert components, filtered BC towers and proper-quotient refinements. These are not discharged by the new algebraic interfaces.

All information needed to resume is in the four deliverables; no scratch source or log is needed.

## Sources and existing work checked

This continuation read [Fargues–Scholze](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Definition III.2.1 and Theorem III.2.2, printed pp.89–90, for the representative Frobenius and trivialization boundary. SHA-256: `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`. Statements are in our own words. No verbatim passage, source chapter summary, restricted book or new full-source audit is included. Published-edition collation remains G11; earlier source access failures remain recorded in the packet.

At Tau Ceti f790474, the providing statements were inspected for native comodule point actions, coefficient/comodule naturality, tensor and trivial-comodule actions, finite-comodule monoidal scalar extension, tensor-automorphism components and field-valued Tannakian reconstruction. The supplying source files in the shared build were checked against the pinned git objects. Current read-only upstream AlgebraicVectorBundles, ReductiveGroups and ReductiveGroups Part II and the current Tau Ceti library were also inspected. Existing π₁ and z-extension foundations are imported, never replanned. No supplier or upstream file was changed, and no build was run there.

## Validation and coverage

- Packet checker: **0 errors, 0 warnings**, with an acyclic prerequisite graph.
- Suggested Lean file: `lean-check research/blueprint/suggested/BunGAndNewtonStrata.lean` exits **0**, with **150 declaration-uses-sorry warnings**, no errors or other warnings. Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369`. Proofs are admitted; this checks elaboration only.
- Consistency: all 98 reader statements, hypotheses, proof steps, acceptance conditions, API/test contracts and prototype notes agree with the packet; all requests and gaps agree. Register contracts agree. All 23 new API items have actual typed declarations and all ten new examples have unique labels before the register. Local links and anchors resolve. Stable review, scope/coverage, IDs/names, ownership imports and restructuring are preserved.
- `git diff --check` passes. Only the four authorized deliverables change.

Totals: **98 nodes** — 16 definitions, 14 constructions, 52 theorems, six lemmas, nine comparisons and one application; **168 API items**, **110 unit tests**, **29 planets**, **38 baseline declarations**, **12 gaps**, **47 requests**. Packet status remains **partial** and implementationStatus remains unchecked.

| Stage | Status |
|---|---|
| BG0 | planned |
| BG1 | partial |
| BG2 | partial |
| BG2:smooth-Artin | planned |
| BG2:uniformization | partial |
| BG3 | planned |
| BG4 | planned |

No stage is closed. The job remains blocked on the concrete supplier interfaces above, with the native trivialized tensor reconstruction saved for the next continuation.
