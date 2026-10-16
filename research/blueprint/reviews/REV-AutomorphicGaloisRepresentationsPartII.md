# Independent review: Automorphic Galois Representations Part II

Review job: `REV-AutomorphicGaloisRepresentationsPartII`, issue #9925. Reviewer: Codex, session `codex-4MPfgD`, 2026-10-16. The input was written by session `codex-y94Tyw`; this reviewer did not write or review its originating blueprint job.

**Verdict: needs_changes.** The proposed mathematical contracts are supportable with their explicitly recorded gaps after the corrections below. The blocker is an unresolved contradiction between that specification and the graph installed by the current promotion mechanism. The current merger keeps 129 declarations and 54 planets, rather than 124 and 46, and does not apply 35 revised contracts or five exclusions. In particular it retains a historical parent assignment which makes the effective contracts cyclic after contraction to roadmap layers. Accepting this continuation would publish a reader describing a different graph.

This is a completed independent review, not a checkpoint. It does not reject the pass for openly recorded mathematical gaps. PROTOCOL §0 allows planned stages whose prerequisite chains end at precise gaps. No stage is closed; `complete` denotes the finished planning pass. The coverage entries describe the proposed reconciled specification, and the reader now prominently distinguishes that from the graph that would go live.

## Inventory and scope

| Item | Checked result |
| --- | ---: |
| Physical nodes | 16 |
| Imported complete contracts | 108 |
| Effective proposed targets | 124 |
| Definitions / constructions / theorems / lemmas / comparisons | 14 / 24 / 64 / 6 / 16 |
| API entries after corrections | 189 |
| Discriminating unit tests after corrections | 139 |
| Proposed planets | 46 |
| Pinned baseline declarations | 15, all confirmed |
| Source records | 26 |
| Existing source issues freshly reviewed | 16 confirmed, 0 rejected |
| Supplier requests / gaps | 49 / 18 |
| Assigned confirmed red-team findings checked | 11 |
| New target nodes / removed baseline citations | 0 / 0 |

The packet's `review.checked` records all 124 stable target ids with an individual mathematical note: five corrected and 119 verified as proposed contracts with their precise supplier/gap qualifications. This is not a claim that the mathematical statements are implemented or that the promotion mechanism installs them. Every definition and construction was checked for a usable API and at least three discriminating tests. The added odd-block twist test addresses an error which the old dimension/product tests would not catch. No duplicate generic character, ideal, local-Galois or compatible-family carrier was introduced. No planet was added merely to name a proof step.

## Corrections made in the authorized deliverables

1. **Missing auxiliary character in the discrete export.** In `AG2.7/unitary-discrete-parameter-export`, restored ϖ in `(ϖ∘N_{F/𝒦}∘det)^{ε(n−n_i)}`. A norm argument alone is not the specified complex Hecke character. CS Corollary 5.5.5, printed pp.745–746, fixes the two-block transfer and parity correction. Added coefficient-change and labelled extensionality API entries, plus a test at n₁=2,n₂=1: the twists are `|det|^(−1/2)·ϖ∘N∘det` and `|det|^(−1)`. At an idele where the auxiliary factor differs from 1, omitting it changes the first character. The transfer/cohomological-quotient hypotheses and away-ℓ range remain explicit.
2. **Undefined splitting field in the earlier discrete normalization.** `AG2.2/cs-discrete-polarization-normalization` still used the known E11 misprint `Spl_{F₀/Q}`, despite its export using the corrected field. Both now use the imaginary quadratic field 𝒦 of CS §5.1, with `F=F⁺·𝒦`, the same auxiliary character and norm. The historical id is retained; its proposed owner is AG2.3.
3. **Duplicate rank-two comparisons.** `AG2.6/rank-two-comparison-with-r19` repeated the AG2.5 memberwise assertion. It now assembles those conditional comparisons across coefficient places on the existing family carrier, with a direct dependency on the AG2.5 comparison and AG2.6 family/uniqueness producers. Common good polynomials are identified; Hodge and local conclusions retain the independent family's actual hypotheses. No canonical intertwiner, common strong field or R19 existence theorem is manufactured. The source locators distinguish CH Theorem 3.2.3/§4, pp.10–13, from ACC+ §7.1, pp.1093–1094; the family comparison is an explicit consequence, not a falsely attributed extra theorem.
4. **Reciprocity and rational normalization.** Corrected `upstreamComparison`: current LocalGaloisGroups uses arithmetic Artin reciprocity. Its character API needs inversion for this roadmap's geometric convention. ACC+ Notation, printed p.906, calls `rec^T` an arithmetic normalization while choosing geometric Frobenius. Those words do not themselves invert Frobenius. Added that precise citation to the AG2.5 normalization comparison; CT17 §1.1 p.3 merely refers to the earlier normalization source and is no longer represented as its proof.
5. **Shin bibliography and the strength of its citation.** The hashed `StableIgusa.pdf` is *Stable trace formula for Igusa varieties*, not *Counting points on Igusa varieties*. Corrected the title and description. Definition 4.2, pp.13–14, and Theorem 4.4, p.15, are the intended locators. The latter restates the earlier counting theorem [Shi09, Theorem 13.1]; reading it is not a verification of the earlier proof or of a general compact global fixed-point formula. The raw trace contract continues to request Fujiwara/Varshavsky and polarized PEL effectivity explicitly.
6. **Review provenance and reader consistency.** Preserved each old source-issue review in `reviewHistory` and supplied this review's own version-scoped verdict. The reader includes every changed contract, added API/test, the corrected request character ϖ, fresh verdicts and the promotion blocker. Its counts are now 189 API entries and 139 tests. No source passage or excerpt was added.

The suggested Lean file is unchanged: none of these higher arithmetic carriers exists at the pins, so inserting placeholders for their definitions would violate the required shape. Its light coordinate definitions and algebraic statements were independently inspected and elaborated.

## Baseline and current upstream nonduplication

All 15 declaration statements and surrounding hypotheses were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti is pinned at `f790474821cf4256814db967cb154e7af3d0c369`. No citation was removed or replaced. The packet's existing precise `provides` descriptions remain valid; the following table records the scope of this confirmation.

| Declaration | What it actually supplies |
| --- | --- |
| `mathlib:NumberField.IsCMField` | CM field predicate, with its ambient field/characteristic hypotheses; no automorphic carrier. Module `Mathlib/NumberTheory/NumberField/CMField.lean`. |
| `mathlib:NumberField.IsCMField.complexConj` | Complex conjugation over the maximal real subfield under the CM/integrality instances. Module `Mathlib/NumberTheory/NumberField/CMField.lean`. |
| `mathlib:NumberField.IsCMField.complexEmbedding_complexConj` | Compatibility of a complex embedding with conjugation under those same instances. Module `Mathlib/NumberTheory/NumberField/CMField.lean`. |
| `mathlib:Multiset.prod_X_sub_C_coeff` | Signed elementary-symmetric coefficient identity over a commutative ring, with k≤cardinality. Module `Mathlib/RingTheory/Polynomial/Vieta.lean`. |
| `mathlib:AlgebraicClosure` | Algebraic closure and its field/algebra/algebraic-closedness instances. Module `Mathlib/FieldTheory/IsAlgClosed/AlgebraicClosure.lean`. |
| `mathlib:Matrix.GeneralLinearGroup` | Units of square matrices, the actual light matrix-representation carrier. Module `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`. |
| `mathlib:Matrix.charpoly` | Characteristic polynomial det(XI−A) over a commutative ring. Module `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`. |
| `mathlib:Matrix.charpoly_map` | Characteristic polynomial commutes with coefficient ring homomorphisms. Module `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`. |
| `mathlib:Matrix.charpoly_diagonal` | Characteristic polynomial of a diagonal matrix is the product of the linear factors. Module `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`. |
| `mathlib:Matrix.charpoly_units_conj` | Characteristic polynomial is invariant under invertible conjugation. Module `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`. |
| `mathlib:Matrix.GeneralLinearGroup.map` | Coefficient change as a group homomorphism on matrix GL_n. Module `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`. |
| `mathlib:Representation.IsSemisimpleRepresentation` | Semisimplicity via the complemented subrepresentation lattice, not arithmetic existence. Module `Mathlib/RepresentationTheory/Semisimple.lean`. |
| `mathlib:Representation.IsIrreducible` | Irreducibility via the simple subrepresentation order; absolute irreducibility requires scalar extension. Module `Mathlib/RepresentationTheory/Irreducible.lean`. |
| `mathlib:Matrix.GeneralLinearGroup.toLin` | Matrix units identified with invertible linear endomorphisms. Module `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`. |
| `mathlib:Matrix.rank` | Finite rank of the matrix linear map, used only in algebraic monodromy examples. Module `Mathlib/LinearAlgebra/Matrix/Rank.lean`. |

The reviewed library audit was read for all ten stages. Current upstream roadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were checked read-only in addition to the older atlas snapshot. Relevant actual text was read in IHG's README/Suggested (polynomials, residual predicates, determinant gluing), LocalGaloisGroups (carriers and reciprocity), ProfiniteArithmetic (profinite carriers), GlobalNumberFields Layers 9–10 (Hecke characters and infinity types), and representation-theory suppliers (semisimple algebra and Schur–Weyl). Searches of current Tau Ceti did not find the proposed automorphic, WD, compatible-family, Mantovan, Igusa or Rapoport–Zink targets already implemented. This is a scoped search result, not an audit of every declaration in the current library. IHG already owns generic Galois-type/non-Eisenstein ideals and interpolation; AG2 supplies instances and geometric witnesses.

## Source and proof-chain audit

The 26 source records identify versions, URLs, hashes and read locators. I independently read the node locators and the surrounding arguments needed to check their uses, rather than treating the earlier part reviews as evidence. Four maintainer-cleared PDFs (ACC+, Liu–Tian–Xiao–Zhang–Zhu, Pilloni and Grosse-Klönne) were read in place. The accessible public versions of the other papers were read directly; Chenevier's damaged chapter encoding required page images. No cleared file or source passage was copied into the repository. HT01 was not available under the permitted access rule, so its unrecovered coefficient recipe, concentration and irreducible-multiplicity arguments remain exact gaps.

The important proof boundaries were checked as follows:

- Raw compact PEL geometry, Drinfeld/Igusa models and alternating fixed-point traces precede ET.6 and stabilization. Shin's ramified one-dimensional setting is not justified by a general unramified PEL slogan. The generic fixed-point theorem and polarized O_F-linear effectivity remain supplier extensions.
- Shin's global Mantovan identity is Weil-equivariant, alternating and uses the full smooth Ext functor with dimension/Tate normalization. ST/END evaluation is distinct from the later concentration, packet multiplicity and divisibility of each irreducible Galois multiplicity. A rank calculation does not establish an actual representation.
- CH's arbitrary-regular construction uses definite families, actual representation families on a proper cover, period closedness and solvable patching. Its first de Rham argument is retained; the false full-target exterior-square isogeny argument is not used. A common realization field is later than the regular Hodge comparison, rather than a consequence of the trace field alone.
- HLTT's noncompact split unitary group and ordinary boundary complexes are distinct from the compact tower. The dagger/rigid comparison is functorial for the specified tubes and formal closures. Intrinsic compactification independence remains unproved in the source. The Hasse congruence witness versus IHG's injective interpolation interface remains an explicit quotient-descent gap. Laurent factor separation is a separate step after determinant interpolation.
- Varma compares semisimple Weil traces and every monodromy partition/rank inequality. The polarized Caraiani route upgrades via the actual tensor-square summand, projected strata, temperedness and purity. TY's uniqueness is up to equivalence in the pure WD range; unrestricted maximal rank does not suffice.
- Caraiani at ℓ needs its own two-boundary log-crystalline comparison and projected realization. AHTW's July 2026 theorem is an identified preprint: all-CM de Rham and ss comparison, spherical crystallinity, Iwahori semistability and an N bound are retained, while arbitrary ramified N equality and arbitrary nonpolarized totally real comparison are not claimed. Its quantitative cohomology, arbitrary-multiplicity pseudodeformation quotients and maximal-orbit theorem are named supplier extensions, not already supplied by fixed-representation foundations.
- BLGGT's weak/very-weak/extremely-weak quantifiers, strict purity, multiplier parity and strong-field choices remain distinct. Residual stable-lattice independence is semisimple and at fixed λ; it gives no self-dual lattice or absolute irreducibility. Local versus global projective genericity is correctly distinguished.

All 49 requests were checked against their named supplier statements and the needed strength; the packet distinguishes a supplier from a requested extension. The proposed internal node DAG and its contraction to the ten own layers are acyclic. This does not certify the global atlas graph, nor the production graph described below.

## Fresh source-issue decisions

All sixteen issues are confirmed in the identified versions, with individual reasons in the packet and reader. EAG20-6 overlaps EAG26-3/4, and EAG20-7 overlaps EAG26-9; these are retained for extraction provenance, not counted as distinct discoveries. Old review reasons and historical edition/search claims were preserved separately; this review does not claim to have freshly inspected an inaccessible publisher edition or to prove that no erratum exists.

The substantive checks include the weight factor in BLGGT's real-place multiplier, dominant integer rather than nonnegative weights, the CH exterior-square codomain dimension, both ACC+ unitary polynomial degree slips and the GL_n terminal sign, the HLTT invertible-block label, Varma's three cross-references, and all three Caraiani two-boundary/dimension slips. For EAG20-3, independent exact rational arithmetic verifies FNF⁻¹=N/4 and N-power ranks (4,2,1,0) versus (4,2,0,0) for the two six-dimensional chains. The graded dimensions bound rank by four. The length-(4,2) strings are pure of weight zero; the length-(3,3) strings have centers ±1. This disproves unrestricted maximal-rank uniqueness without invalidating its separate rank-four application. EAG26-5 uses the ramified quadratic scalar twist of 1⊕1 over F₃ at Q₂: projectivization is unchanged while inertia is not. Global existence survives by avoiding finitely many ramified places.

## Assigned red-team findings

The original findings and their selected independent verification decisions were both read. “Addressed” in this table refers to the proposed contracts, subject to their explicit proof gaps and the promotion blocker.

| Finding | Disposition in this specification and remaining obligation |
| --- | --- |
| RT-AREA-langlands-1/2 | Raw fixed-point geometry is before ET.5 stabilization/ET.6 global comparison. Request 15 and gap 11 identify the missing Fujiwara/Varshavsky extension beyond EDC.8 trace classes; external ET.5 assignment still needs reconciliation. |
| RT-AREA-langlands-1/3 | AG2.1b's global Mantovan target retains graded Weil action and the full Ext functor; the new EL tower and Ext nodes supply the missing intermediate targets. Ramified/almost-product proofs remain gap 15. |
| RT-AREA-langlands-1/4 | Compact ramified Drinfeld/Igusa data are distinct from split U(n,n) ordinary geometry. The two datum/model producers preserve their separate hypotheses and comparison inputs. |
| RT-AREA-langlands-1/5 | Raw counting requests polarized O_F-linear effectivity with prescribed isocrystal, positivity and obstruction α₀. Unpolarized Honda–Tate is insufficient; request 9 and gap 2 remain precise. |
| RT-AREA-langlands-1/16 | AG2.6 preserves AHTW's exact conditional/preprint input chain and ss/bound conclusion, with full-N equality only in the polarized branch. Gaps 13/17 prevent a false claim that foundations already close it. |
| RT-AREA-langlands-1/18 | TC's discrete characteristic-zero consumer needs arbitrary-regular polarized constituents in AG2.3 and the labelled discrete export, rather than only Shin-regular existence in AG2.2. The source and export contracts reflect this; the external TC consumer redirect is maintainer work. |
| RT-AREA-langlands-1/19 | GSp₄ transfer/valuedness/parahoric and ordinary comparison clauses are routed to the proposed dedicated owner, not generic AG2. Generic GL_n sign and pure WD theory remain here. Gap 5 is honest because that owner has no atlas stage yet. Three historical GSp₄ targets are excluded in the specification but survive production promotion. |
| RT-AREA-langlands-1/20 | Family data and strength predicates now belong below R24, in AG2.6, as required by the current tier rules. R24 is a consumer; the old review's proposed opposite import direction is superseded by that binding ownership rule. The historical redirects remain unapplied. |
| RT-AREA-langlands-1/26 | Existing upstream IHG owns generic determinant interpolation; AG2.4 supplies exact HLTT integral witnesses and Laurent factor extraction. No torsion-concentration theorem justifies its own characteristic-zero input. The quotient-versus-injection mismatch is gap 7. |
| RT-AREA-padic-2/22 | R06 supplies generic period comparison; R19 owns its named modular applications; AG2 owns the higher-rank automorphic comparison. Request 23 does not pretend R06.5 already proves the full automorphic theorem. External consumer repairs remain outside this issue. |
| RT-AREA-padic-2/32 | GK Theorem 5.1/HLTT Lemma 6.8 are a functorial comparison for the specified dagger tubes. RD.4/5/6 own comparison/finiteness/weights; F1 owns carriers. Requests 31–33 retain the degree-zero exception and are not replaced by an equality with the whole generic fibre. |

## Promotion blocker and reproduction

`importChecks`, `reusedNodes`, `dependencyReconciliation`, `parentReconciliation` and `excludedReusedNodes` are descriptive metadata in the present implementation. `scripts/blueprints.py:merge_blueprints` unions only each packet's physical `nodes`, by stable id, in packet order. `replaced_layers` only feeds trimming of older decompositions; it does not replace promoted blueprint parts. `scripts/promote.py` copies the reviewed packet and reader without applying these metadata. The checker similarly validates the 16 physical nodes; its clean result does not validate the 108 import overrides.

I called the production merger in memory with the two promoted AG2 part packets followed by this proposed continuation, after stripping pre-existing blueprint-generated stages from an in-memory atlas snapshot. No promoted file or atlas data was written. The roadmap's returned `blueprint` record has **129 declarations, 54 planets, and no skipped links**. Comparing its effective contracts with the union of `nodes` and the proposed `importChecks` yields **35** unapplied contracts. Neither target-level internal graph has a directed cycle. However, contracting the production target prerequisites to their owning layers yields **AG2.2 ↔ AG2.3**: the new polarized-existence milestone belongs to AG2.3 and uses AG2.2's character twist, while the old CS discrete-normalization target stays in AG2.2 and uses that milestone. The proposed parent move of the CS target to AG2.3 resolves this witness, but is not applied. “No skipped links” therefore is not a layer-order certificate.

The five retained exclusions, with the common roadmap prefix omitted, are:

- `AG2.6/gsp4-crystalline-hodge-comparison`
- `AG2.6/ordinary-gsp4-coefficient-prime-shape`
- `AG2.6/pilloni-gsp4-normalization-comparison`
- `AG2.7/hecke-maximal-ideal-of-galois-type`
- `AG2.7/non-eisenstein-maximal-ideal`

The following exact field comparison documents the 35 unapplied overrides; the common roadmap prefix is omitted. Source matches, titles and proof prose are not included in this semantic comparison, so the result is not inflated by editorial differences.

| Retained target | Fields differing from proposed contract |
| --- | --- |
| `AG2.1a/compact-shin-pel-instance` | `prerequisites` |
| `AG2.1a/raw-fixed-point-trace-identity` | `prerequisites` |
| `AG2.1a/raw-nearby-cycle-traces` | `prerequisites` |
| `AG2.1b/compact-global-mantovan-formula` | `prerequisites` |
| `AG2.2/algebraic-character-polarization-twist` | `hypotheses` |
| `AG2.2/cs-discrete-polarization-normalization` | `statement`, `hypotheses`, `parentStageId`, `realises` |
| `AG2.4/hltt-ordinary-boundary-instance` | `prerequisites` |
| `AG2.5/caraiani-stratum-concentration` | `prerequisites` |
| `AG2.3/finite-number-field-of-realization` | `prerequisites`, `parentStageId`, `realises` |
| `AG2.5/late-gl2-modular-comparison` | `statement`, `hypotheses`, `prerequisites` |
| `AG2.6/extremely-weakly-compatible-system` | `statement`, `prerequisites` |
| `AG2.6/geometric-coefficient-prime-comparison` | `prerequisites` |
| `AG2.6/coefficient-hodge-comparison-through-families-and-descent` | `prerequisites` |
| `AG2.6/full-polarized-comparison-at-the-coefficient-prime` | `prerequisites` |
| `AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison` | `prerequisites` |
| `AG2.6/nonselfdual-coefficient-prime-monodromy-bound` | `prerequisites` |
| `AG2.6/compatible-system-of-pi` | `statement`, `prerequisites`, `api`, `tests` |
| `AG2.6/strong-coefficient-field` | `api`, `tests` |
| `AG2.6/uniform-strong-realization-for-polarized-systems` | `prerequisites` |
| `AG2.6/polarized-compatible-system-strictly-pure` | `prerequisites` |
| `AG2.6/very-weak-compatibility-under-dgi` | `statement`, `prerequisites` |
| `AG2.6/rank-two-comparison-with-r19` | `statement`, `hypotheses`, `prerequisites` |
| `AG2.6/tensor-automorphy-independent-of-coefficient-embedding` | `prerequisites` |
| `AG2.7/residual-representation-of-pi` | `api`, `tests` |
| `AG2.7/residual-hecke-ideal-independence` | `prerequisites` |
| `AG2.7/dual-and-character-twist-hecke-comparison` | `prerequisites` |
| `AG2.7/completely-split-generic-prime` | `api`, `tests` |
| `AG2.7/existential-decomposed-genericity` | `api`, `tests` |
| `AG2.7/strong-local-decomposed-genericity` | `api`, `tests` |
| `AG2.7/good-prime-characteristic-zero-export` | `statement`, `api`, `tests` |
| `AG2.7/nonselfdual-hodge-and-monodromy-bound-export` | `api`, `tests` |
| `AG2.7/polarized-hodge-and-wd-export` | `statement`, `api`, `tests` |
| `AG2.7/unitary-discrete-parameter-export` | `statement`, `hypotheses`, `prerequisites`, `api`, `tests` |
| `AG2.7/lattice-residual-polynomial-export` | `api`, `tests` |
| `AG2.7/rank-two-residual-comparison-with-r19` | `statement` |

To reproduce the counts without promotion, load the two `data/blueprints/AutomorphicGaloisRepresentationsPartII--*.json` packets in sorted order, append the full-scope packet, and form the production stable-id union of their physical `nodes`. Independently form the desired union of full-scope `nodes` and `importChecks` keyed by `target`. Count ids/planets and compare the seven fields above. Calling `merge_blueprints` verifies that its returned roadmap record agrees with the physical-node union. For a clean merge, remove stages marked `expansion.blueprint` and their incident edges from an in-memory snapshot first; never write that snapshot. The layer-cycle witness can be checked just from the displayed owning parents and direct prerequisites.

## Checks and orchestrator action

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicGaloisRepresentationsPartII.json`: **0 errors, 0 warnings**. Its summary covers 16 physical nodes, 59 API items, 43 tests and 13 planets, not the full intended inventory.
- A separate inventory and reference audit checked all 124 proposed targets, their reader statements/anchors, API/test counts, implementation status, and the complete 124-entry review ledger. The in-memory promotion comparison above covers what the ordinary checker does not.
- `lean-check research/blueprint/suggested/AutomorphicGaloisRepresentationsPartII.lean`: **exit 0**, 221 lines, only declaration-uses-`sorry` warnings. The shared pinned environment was used after the memory check; no dependency build, update, cache fetch or language server was started.
- Exact rational matrix computations independently checked the EAG20-3 counterexample. No source excerpts, cleared-source files or machine-local paths were added.

The maintainer must choose an authorized executable way to supersede the historical contracts and exclusions. It must preserve the existing ids and independent-review provenance, apply the full contracts (including statements, APIs/tests and parent moves, not only the 17 listed prerequisite redirects), and remove the five excluded targets from this owner. Then rerun the production merge, require agreement with the 124-target/46-planet specification and check layer/tier order and external consumer redirects. Alternatively an explicitly supported nonpromoting review artifact could separate specification acceptance from installation, but the current automatic accepted-review path does not do that. This reviewer cannot change the historical part deliverables, promotion code or other owners in issue #9925's allowed file scope.

After that scoped repair and its verification, the remaining mathematical gaps can still be accepted under PROTOCOL §0 if they remain precise. They do not need to be silently filled or misrepresented as completed formalization.
