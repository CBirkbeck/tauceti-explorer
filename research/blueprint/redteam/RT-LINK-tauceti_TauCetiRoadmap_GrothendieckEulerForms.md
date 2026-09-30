# Red team: Grothendieck groups, Cartan maps and Euler forms

One **medium omission**: three prerequisites delegated to the QuiverRepresentations packet do not reach the assembled atlas. All fifteen primary links have defensible contracts; the other six delegated pairs are present. No additional mathematical or library-claim finding was established.

Issue #4364; Codex — **codex-J6LwjP**, 2026-09-30. Base `92e9f1a7b9727f6ad1f75232df3c184705b114a8`. I neither wrote nor reviewed the target: its author was ChatGPT Pro — cgp-0d58f52c658d, its reviewer Codex — codex-hjdg0j. The earlier SemisimpleAlgebras audit by this session concerns a different ordered pair; this report independently tests the three GEF pairs.

## Finding 1: research-only hosting loses three prerequisites

The first three `existingLinks` entries in the accepted GEF packet are:

| Supplier | Consumer | Actual contract |
|---|---|---|
| QuiverRepresentations 2 | GEF 4 | Finite-length Krull–Schmidt decomposition and uniqueness, needed for the indecomposable-projective basis of split K₀. |
| QuiverRepresentations 3 | GEF 4 | Simple-indexed projective covers and composition multiplicities, needed for the matrix of the categorical Cartan map. |
| QuiverRepresentations 4 | GEF 5 | Length-one projective resolutions and the Ringel Hom-minus-Ext¹ identity for finite acyclic quivers, needed for categorical Ext-Euler comparison. |

GEF 4 explicitly says:

> Under the explicit finite, basic/split, and Krull--Schmidt
> hypotheses supplied by the quiver roadmap, prove that indecomposable projective classes form a
> basis of `K₀(proj A)` and simple classes form a basis of `G₀(mod A)`.

It also specifies projective columns `[P_j:S_i]` and comparison with the quiver roadmap's Cartan matrix. GEF 5 expressly asks for equality with the Ringel form on dimension vectors. The supplier descriptions provide the corresponding decomposition theorem, covers/multiplicities and homological identity. The result JSON contains complete ordered pairs and literal evidence on both sides, refreshed from current descriptions.

These pairs occur in `research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_QuiverRepresentations.json`, which has **no accepted review**. There is **no corresponding `data/links` packet**. GEF's promoted packet retains these entries only as `existingLinks`.

This is observable behavior, rather than an inference from filenames:

- `scripts/build.py:69–75` reads promoted `data/links` packets.
- `scripts/decompositions.py:267–301` checks acceptance and consumes each packet's **`links`** array. It does not consume `existingLinks`.
- `assemble(require_distances=False)` produces 2,840 stages and 8,007 distinct stage edges. All three pairs are absent, with **no forward or reverse path**. The six SPC/Zigzag hosted pairs are present as direct edges.
- A scratch-only accepted probe containing just these independently checked contracts changes the assembled graph to **8,010 edges**, without a cycle. Merging the same probe again leaves **8,010 distinct edges**.
- The raw/research graph augmented with every stage `requires`, including supplemental roadmap definitions, has **4,501 edges** and is acyclic. It already contains the three Quiver edges. A test of this union cannot establish that those edges were promoted.

Thus `present-at-review` accurately identifies text in another research packet but does not justify the accepted map's completeness at integration. The effect is limited to three missing dependencies, so severity is medium.

**Fix:** after checking whether a later Quiver review has already resolved the omission, put these three contracts in the accepted GEF packet's `links` array and update the hosting/completeness explanation. Follow normal independent verification and promotion. Do not accept the rest of Quiver's packet by association. The merger deduplicates ordered pairs, so future promotion of the Quiver host does not create duplicate graph edges.

The proposed reasons retain three essential boundaries. Krull–Schmidt is used only in the stated finite-length module setting, not for arbitrary exact categories. The two Cartan conventions are transposes: Quiver has `[P_i:S_j]`, GEF has `[P_j:S_i]`; over a nonsplitting field retain `dim_k End(S_i)` in Hom formulas. Finally, comparing the quiver resolution-cokernel Ext¹ with categorical Ext, and proving finite support, remains GEF work. None of these inputs constructs a second general Cartan map.

## Primary links and overlap checks

I read the full 643-line owner document, all eight owner layers and all **25 distinct external endpoint descriptions** across primary links, overlaps and hosted pairs. Numbering below follows the accepted packet.

| Links | Audit outcome |
|---|---|
| 1–2: GEF 0/2 → K.1 | Exact structure, admissible pullbacks and ExactK0 supply the Q-construction's input and degree-zero comparison target. Spans, nerve and homotopy comparison stay with K.1. Both K.1 evidence quotes occur in its roadmap README, as the protocol permits; they are not in its stage description. |
| 3: GEF 0 → K.2:plus | Finite projectives have the split exact structure. Arbitrary scalar extension preserves split sequences; flatness is unnecessary. The plus/group-completion comparison remains additional work. |
| 4: GEF 3 → K.3 | The general resolving-subcategory K₀ theorem is planned. The pinned projective-resolution equivalence does not already prove it. No inference from K₀ to all higher-K theorems. |
| 5–6: GEF 2 → Z.1/Z.5 | Use the categorical K₀ carrier with the actual category and exact structure. Vector-bundle extensions need not split globally. Idempotent/stable-isomorphism, Morita and rank/Pic comparisons remain consumer obligations. |
| 7–8: GEF 2 → DG 7/10 | Raw Verdier-quotient and perfect-category triangulated K₀ are distinguished. Idempotent completion is not silently a K₀ isomorphism. |
| 9–11: GEF 4/5/7 → DG 10 | Ordinary finite-dimensional finite-global-dimension specialization, finite-support RHom Euler calculus, and separate left/right numerical quotients are appropriate inputs. Triangle compatibility, properness, Serre/HRR and radical preservation remain explicit obligations. |
| 12: GEF 3 → DG 11 | Linear-resolution vocabulary and the qualified diagonal-Ext criterion are the import. Potentially infinite Koszul resolutions do not become finite resolutions; no numerical converse is imported. |
| 13: GEF 2 → InductionRestriction 6 | Split-K₀ representation ring, tensor multiplication and character homomorphism are baseline. The pinned injectivity theorem for finite groups in characteristic zero does not require algebraic closure. Artin/Brauer results remain downstream. |
| 14: GEF 2 → LieHighestWeight 6 | Exact-additive characters descend by K₀'s universal property. Tensor/weight identities are additional; a semiring must be group-completed before calling its character map a ring map. |
| 15: GEF 0 → GN.6 | The exact carrier supports duality data. Grothendieck–Witt, hermitian K-theory, localization and invertibility-of-two assumptions are not supplied by ordinary K₀. |

The five active overlaps are defensible: H.4 compares algebraic group completion with the homotopy construction only for the appropriate additive-category core; Z.6 reuses the existing general-ring Cartan map; topology, pro-p and modular-form applications share a finite-dimensional Euler calculation after their own finiteness/comparison proofs. In the pro-p case a finite p-primary module has composition length, not automatically an Fp-vector-space dimension. The retired LI.3 overlap is correctly archived.

The existing R-RADICAL request is substantive and already scoped correctly. For zero pairing on Z and hyperbolic pairing `B((a,b),(c,d))=ad+bc` on Z², maps `n↦(n,0)` preserve pairings on their images, but the image of 1 pairs nontrivially with `(0,1)`. Quotient functoriality therefore needs radical containment. R-KOSZUL deliberately leaves the stronger numerical converse unverified; this audit neither proves nor imports it. R-RELATIVE correctly calls for reuse of the already existing relative-projective/injective foundation.

## Pinned library statements

The reviewed coverage entries mark all eight GEF layers **partly built**. I read their target-level scope notes before relying on the baseline. Fresh statement reads used TauCeti `f790474821cf4256814db967cb154e7af3d0c369`; the programme Mathlib pin remains `082e2d37e8b0463410cdb532e111cd43d5a66174`. No new Mathlib availability claim is needed for the finding.

The result's `pinnedSources` manifest records all fourteen fetched files and SHA-256 hashes. Relevant statements and parameters checked:

- `CategoryTheory/Exact/{ExactStructure,Projective,Injective}.lean`: genuine E2/E2op existence/stability, relative lifting/extension predicates, presentations, `EnoughProjectives` and `EnoughInjectives`.
- `CategoryTheory/GrothendieckGroup/{Split,Exact,Triangulated}.lean`: smallness and categorical hypotheses, `liftEquiv`, `grothendieckAddGroupEquiv`, `ExactK0.map`, `fromSplitEquiv` (every conflation splits), and the pretriangulated carrier.
- `CategoryTheory/GrothendieckGroup/ProjectiveResolution.lean`: `resolutionEquiv` at lines 393ff and its explicit `hproj : P ≤ E.isProjective`; the file explicitly excludes a proof of the general resolving case. Read the actual codomain of objects admitting finite P-resolutions.
- `Algebra/Category/ModuleCat/CartanMap.lean`: ring parameter, inherited finite-module exact structures, `cartanMap` at 235ff, split projectives at 204ff, and the finite-resolution hypothesis for `cartanEquiv` at 468ff. No noetherian assumption for the inclusion map; no claim that arbitrary finitely generated modules form an abelian category.
- `Algebra/Homology/EulerCharacteristic/{FiniteDimensional,ExtEuler/Descent}.lean`: the bounded FG-module cochain identity at 143ff and `extEulerPairing` at 303ff with k-linear abelian/HasExt, smallness, closure and Euler-admissibility assumptions. These do not prove the DG triangulated descent automatically.
- `CategoryTheory/GrothendieckGroup/Laurent.lean`: the exact-K₀ type synonym and `T_smul`; neither alone establishes q = ±1 comparison theorems.
- `LinearAlgebra/SesquilinearForm/NumericalQuotient/Functoriality.lean`: `leftNumericalMap`/`rightNumericalMap` at 62/69 require radical containments; `numericalPairing_map_map` at 157 requires both. The sufficient surjectivity hypotheses are on the opposite side.
- `RepresentationTheory/RepresentationRing/{Basic,Injective}.lean`: the split-K₀ definition at 106, ring character map at 127 and finite-group characteristic-zero injectivity at 50. The split/exact distinction matters outside the semisimple situation.

## Completeness and validation limits

The fresh world contains 221 roadmap records and 2,028 stages, with one retired roadmap. Focused terms for categorical K₀, Cartan maps, numerical quotients, linear resolutions and the explicit owner name found twelve external candidates. A broad Grothendieck/Cartan/K₀/G₀/Euler/exact-category screen found 266. This is a search screen, **not** a claim to have read 266 full stages or every cited paper.

Additional full stage reads checked SchemeKTheoryOperations S.2, ArithmeticKTheory N.1 and the GeneralAlgebraicKTheory readiness-checkpoint descriptions. S.2 needs scheme/higher-K comparisons beyond the module Cartan map. N.1 imports the low-degree Z/U results. Readiness checkpoints aggregate their named owners. Euler products/systems, Cartan subalgebras and Cartan A/B produce lexical matches, not Euler-form dependencies. The named DG/SPC/Zigzag consumers are covered by the endpoint reads. No other new two-sided contract was established.

Every active quote passes the protocol's stage-or-owner-document rule: 42 literal stage substrings plus the two K.1 owner-document quotes. The two archived quotations also match. All six proposed repair quotations are literal current stage substrings; the two old Quiver quotes requiring whitespace normalization have been refreshed in the proposal.

The original packet and scratch repair both pass `check_links.py` with zero errors and warnings. Actual assembly and augmented research-graph acyclicity checks are described above. Small arithmetic diagnostics confirm `CᵀE=I` for the displayed `1→2` Cartan/Euler matrices and the radical counterexample; these are checks of orientation and hypotheses, not Lean proofs. The two deliverables pass the red-team and intake checks. No upstream roadmap or accepted packet was edited, and no Lean file was changed or compiled.
