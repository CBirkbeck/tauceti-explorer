# Independent design review: quantitative isogenies and integral Tate algebras

**Job:** REV-DESIGN-FaltingsFinitenessAndIsogenyTheoremsPartII, issue #3530.  
**Reviewer:** Codex, session codex-i1OoAO, 2026-10-19.  
**Author reviewed:** codex-RlPrYD, DESIGN-FaltingsFinitenessAndIsogenyTheoremsPartII, issue #3406.  
**Verdict:** accepted after corrections, as a complete target-level planning pass with explicit open obligations. This accepts the mathematical specifications and recorded reductions; it does not certify complete proofs or a formal implementation.

## Scope and counts

All 51 nodes have individual verdicts and reasons in the packet's `review.checked`. No node was added or removed. The final inventory is 7 definitions, 3 constructions, 40 theorems and 1 application, with 55 API items (8 added), 41 discriminating tests, 41 planets, 6 baseline declarations, 4 stage-level supplier contracts and 8 open obligations. Every definition/construction has at least three tests. All implementation statuses remain `unchecked`.

| Layer | Nodes | Planets | Coverage |
| --- | ---: | ---: | --- |
| QI.1, coordinates and Rosati norms | 8 | 5 | closed |
| QI.2, periods and polarized estimates | 9 | 6 | planned |
| QI.3, order class indices | 6 | 5 | planned |
| QI.4, discriminants and stable powers | 7 | 6 | planned |
| QI.5, polarization-free estimates | 5 | 5 | planned |
| QI.6, sharp elliptic estimates | 4 | 3 | planned |
| QI.7, number-field integral algebras | 7 | 6 | planned |
| QI.8, finitely generated fields | 5 | 5 | planned |

The stage ordering follows the dependencies. Each stage target is represented. QI.1 closes relative to its imported suppliers; QI.2–QI.8 retain their explicit proof boundaries. `status: complete` records completion of this planning pass, not the stronger `closed` status. The roadmap definition remains a draft.

## Corrections made

1. **Coordinates and discriminants.** Added the A6 characteristic-polynomial prerequisite for the rational coordinate API. Added injectivity/extensionality, additive evaluation and rational-extension properties. Preserved the distinction between abelian trace, regular multiplication trace and reduced trace, and between a rational Rosati involution and an integral one. Split citations that had combined different sources under a single source id.
2. **Division-algebra hypotheses and handedness.** Made finite-dimensional division Q-algebras, torsion-free integral modules, positive dimension and origin-symmetric convex norm bodies explicit. Added positivity/finiteness of the norm-body invariant. Defined the right class index through the opposite algebra, justified its equal discriminant by equality of left/right multiplication traces, and extended the class-index theorem to right modules. The simple Hom cross-discriminant proof now invokes that interface explicitly.
3. **Regular trace.** Replaced an unsupported attribution of regular-trace nondegeneracy to the upstream Artin–Wedderburn layer by its short matrix-entry argument. Added the nonzero-discriminant API. The stage request now asks only for the algebra/module decomposition actually supplied.
4. **Generated adelic algebra.** Added the least-subalgebra property and exact local projection. The proof lifts finite coefficients and uses closedness of finite Z_ℓ-submodules, with compactness for the closure's projection. Added extensionality for supported connected products. Kept the independent-image and bounded-local-generator argument that justifies an adelic product for these Galois images; no arbitrary-subset product theorem is asserted.
5. **Existing upstream ownership.** Narrowed G8: generic bounded-index finiteness is already implemented in current Tau Ceti, whereas the compact Lie/finite-generation/Frattini input remains to be supplied. Identified the exact ProfiniteArithmetic Layer 0 owner and native declarations in G6. Its absence from the older atlas supplier inventory is a registration obligation, not a mathematical construction to repeat.
6. **Tests and locators.** Replaced all 41 unsupported generic `example` test-kind values by the applicable section 12 categories. Corrected the sharp elliptic proof locator to include GR14 §7.3 pp386–389. Replaced the broken MW93 periods candidate PDF URL by its publisher article page, without claiming access to the missing primary proof. Corrected minor spacing errors and synchronized every changed statement, proof, API, source and obligation in the reader and roadmap.

## Source verification and findings

All statements and available cited proof loci were read independently in the public versions listed in the packet. The principal checked loci are MW95 §§2–7 pp8–23 (and Theorems I–II pp5–6); MW94 MPI/91-51 §§1–6, internal pp1–12; MW93 MPI/91-28 §4 Lemmas 4.1–4.2, internal pp5–6; MZ20 §4 pp652–657 and §5.3 pp666–667; Tsimerman Theorem 2.3 pp382–383; GR14 Theorem 1.4 p347 and §§7.1–7.4 pp382–390; RY25 §§2.1 and 4.6 pp252–254/260–265; Noot §1 pp163–165; Deligne Theorem 2.7 p39; Bost §§2.1–3.2 and §5.1, including Theorem 2.2 pp119–120 and its reduction pp132–136. Preprint internal pages are distinguished from published pagination.

Page images were used to resolve the class-index exponent, complex conjugation, trace factors, period-basis exponent, Deligne's group-algebra statement and the RY saturation formula. Each public PDF's URL and SHA-256 are retained in the bibliography. The author's reading receipts are not substituted for these independent checks.

The original three source findings were corrected where needed and independently confirmed. Three further minor findings were recorded; all six have a reviewer verdict and reason:

| Finding | Location | Reviewed correction |
| --- | --- | --- |
| E1 | MZ20 p653, equation (22) | The conjugation is already printed; restore the complex trace's realification factor 2. |
| E2 | MZ20 p655, mixed Gram determinant | Keep printed conjugation and apply `2 Re` to each complex trace entry. |
| E3 | RY25 p263, large-prime conclusion | Use the larger threshold M′ required by the residual input. |
| E4 | MZ20 p655, integer-scalar length | The scalar norm uses its absolute value. |
| E5 | RY25 p263, saturation index | Saturate the commutator rows inside the dual ambient lattice E₀∨. |
| E6 | MZ20 p656, off-diagonal construction | The referenced block decomposition is equation (27), not (50). |

E6 was already routed in the MZ paper extraction; it is not claimed as a new discovery. No published corrigendum is asserted. Published MZ20 and RY25 versions are identified by `sourceVersions`. No source passage or excerpt has been copied into the deliverables.

The missing MW93 periods proof, GR14 Proposition 6.9 proof and MW95 refinements primary chapter are not certified by the available restatements. The uncleared Igusa and Faltings–Wüstholz books were not accessed. These limits are recorded in G1, G2, G4, G5 and G7 rather than hidden behind source matches.

## Baseline and supplier checks

All six baseline declarations were read in the source trees at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. None was removed or replaced.

| Declaration | Module | Confirmed scope |
| --- | --- | --- |
| `TauCeti.AlgebraicGeometry.AbelianVariety` | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean` | Native proper geometrically integral group-scheme carrier. |
| `TauCeti.AlgebraicGeometry.AbelianVariety.End` | `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean` | Native additive Hom reindexing and composition ring. |
| `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny` | `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean` | Finite surjective native homomorphisms, without a general degree API. |
| `Matrix.trace` | `Mathlib/LinearAlgebra/Matrix/Trace.lean` | Diagonal sum, with cyclicity and transpose compatibility. |
| `Matrix.det` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | Determinant, multiplicativity and transpose compatibility. |
| `LinearMap.trace` | `Mathlib/LinearAlgebra/Trace.lean` | Basis-independent finite-dimensional trace and matrix comparison. |

The 39 distinct cross-roadmap node suppliers were checked in their actual packets: 17 in AbelianSchemesAndArithmeticModuli, 7 in GeometryOfNumbersAndQuadraticArithmetic, 7 in ArakelovGeometryAndAbelianHeights, 2 in AutomorphicBundles, 3 in ArithmeticGaloisRepresentations, 1 in the parent Faltings roadmap and 2 in InverseGaloisAndArithmeticFundamentalGroups. These remain suppliers, not results re-planned here. The reviewed library audit was checked for the parent, height and abelian-scheme layers.

The current GlobalNumberFields and IntegralLattices roadmaps were checked against the lattice imports; the current JacobianChallenge scope does not already supply the quantitative exports. Current SemisimpleAlgebras Layers 2, 3 and 6 and ClassFieldTheory Layer 10 were read for the four stage contracts. The semisimple double-centralizer assertion is assembled blockwise, and the cohomological Brauer sequence is not misidentified as the missing CSA/H² bridge or index-degree maximal-splitter theorem.

Current upstream inspection used TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. ProfiniteArithmetic Layer 0 already owns the native ring/product/idempotents, including `TauCeti.zHat.ringEquivPiPadicInt` and `TauCeti.zHat.tendsto_sum_idem`. Current `TauCeti.IsTopologicallyFinitelyGenerated.finite_openSubgroup_index_eq` gives generic bounded-index finiteness under its compactness and finite-generation hypotheses. These are expressly current-upstream facts, not declarations claimed at the older pins. No upstream file was edited or built.

## Remaining work and maintainer decisions

- G1: primary period theorem and matrix-height inputs; G2: the fixed cusp-family comparison and decay; G3: the algebraic/cohomological Brauer bridge and cyclic maximal subfield; G4: the sharp elliptic slope/period input; G5: uniform residual refinement; G7: finitely-generated-field integral Tate proof; G8: compact ℓ-adic group structure and the full-image specialization input.
- G6: register the existing ProfiniteArithmetic Layer 0 stage in the atlas inventory, then move its recorded exact supply to `requests` and the two direct prerequisite lists. Inserting the genuine current stage now makes the checker reject an unknown supplier; no new ring plan should be commissioned.
- Decide the retained `OpenImageTheoremsForAbelianVarieties` split proposal. All six incoming paper briefs and their item identities remain accounted for. The quantitative/adelic three are planned here; the Qian, Calegari–Geraghty and BCGP open-image directions retain OI.1–OI.6 assignments, including geometric-End hypotheses, the RM branch, subgroup classification, lifting and density. No proposed OI layer is treated as already implemented or blueprinted.

## Validation

`check_blueprint.py` with the pinned declaration index passes with zero errors and warnings. An `errata-v1` scratch projection containing exactly the packet's six findings and two published source versions passes `check_errata.py`; that checker is for errata result files, not a blueprint packet. The embedded split is a section 9 proposal, not a standalone `restructure-v1` result. Its routes and stage assignments were checked directly.

The unchanged 102-line suggested Lean file elaborates with `lean-check` at the shared pinned build: exit 0 and only 14 expected `sorry` warnings. It contains one light real-bodied matrix definition, seven theorem signatures and seven examples. Heavy arithmetic carriers remain exact reader targets. Reader/packet/roadmap consistency and `git diff --check` also pass.
