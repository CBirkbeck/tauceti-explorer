# Handoff: BP-AutomorphicBundles--B5

## Identity and scope

- Issue: #681, `BP-AutomorphicBundles--B5`.
- Agent: ChatGPT Pro; session `cgpt-20260926-qseries-a91f`.
- Branch: `cgpt-20260926-qseries-a91f-b5-fibers`.
- Claim comment: 5848768692; bot confirmation: 5848769471. The claimed issue was re-read before work.
- Submission: **partial checkpoint**, `Refs #681`, not a request to close the issue or mark B5 complete.
- Continuation of the merged work in #2932, #2935 and #2938. All fifteen existing node ids, five baseline entries, nine definition/construction APIs and nine tests are retained.
- Scope remains exactly `AutomorphicBundles:B5`. Only its packet, reader and this handoff change. The suggested Lean file is intentionally unchanged: no new geometric node or fabricated signature is introduced.

## Concrete advance

The previous handoff asked for the residue-base-change and component-detection step of `B5/fj-injectivity-cyclic`. This continuation supplies two explicit owner proof routes rather than another undifferentiated request to prove the expansion principle.

### 1. Component detection via smooth proper closures

The reader's new subsection **The smooth-closure component-detection interface** states and proves the following generic mathematical implication.

Let X be a smooth proper algebraic space over a regular Noetherian base. Suppose finitely many smooth proper closed subspaces W_a have opens Z_a dense in every geometric fiber of W_a. If the Z_a meet every irreducible component of the total X, then they meet every irreducible component of every geometric fiber of X.

The proof takes the finite etale Stein factor X -> E -> base. Each W_a -> E is proper and smooth: for smoothness factor its graph through W_a times_base E, whose graph is open because E is etale. Its image is therefore open and closed. Total-component detection makes these images cover E. For a geometric base point, the fibers over the discrete points of E are the connected regular, hence irreducible, components of X. Fiberwise density of Z_a in W_a then reaches each of them. The reader also proves the correspondence between the total connected-component sets and explains why no arbitrary nonflat base-change theorem for the formation of E is used.

This is **not** the invalid inference from smoothness or constant fiber component counts alone. The essential additional premise is fiberwise density in the proper smooth closures. The reader includes the P1 boundary-section test and its failure after removing the closed fiber, the two-disjoint-curves test, and the distinction between a connected finite etale cover and a geometrically connected fiber.

Lan's actual relative normal-crossing description gives a precise neat-level instantiation route. The inspected p. 520 supplies the no-self-intersection clause at neat level; p. 523 proves that the neat model is an algebraic space. Early C5 must identify the selected stratum components with the corresponding relative coordinate-stratum opens in smooth proper closed intersections. The local coordinate description must show fiberwise density. Merely quoting the source's statement that a stratum is open dense in its total closure does not discharge that point.

**The generic implication has a written mathematical proof; the actual PEL instantiation and its Lean implementation remain open.** The non-neat case additionally needs a proper branch-normalization or actual stack/level-change construction, coverage of geometric components, and descent. A neat cover does not automatically preserve the chosen detecting collection on every lifted component, and a toroidal level map is not automatically etale everywhere. No averaging is proposed.

The packet keeps the original all-level source target and explicitly separates this neat-level route. It does not advertise the conditional cyclic lemma as the completed expansion principle.

### 2. Residue coefficients at finite thickenings

For the actual chart algebra A, its stratum ideal I, Hodge module P and S=R/p, the reader gives the elementary cokernel proof of

`(P/I^(n+1)P) tensor_R S = P_S/I_S^(n+1)P_S`.

Tensor the quotient sequence and identify the image of its first map. That map need not remain injective; right exactness is enough. Identify the two inverse systems with their transition maps before taking limits. Do not exchange tensor and an arbitrary inverse limit, and do not replace AF(k,R/p) by AF(k,R) tensor R/p.

The packet refines the F0, SF.0 and early-C5 contracts accordingly: localization and Hodge/chart transports must commute with the finite-level maps; the actual completed coefficient sheaf and degree projections must be identified with this system; descent remains an explicit step. Completion along a locally closed stratum uses the open obtained by first removing the other closure strata, as in Lan 6.4.1.1(5).

## Retained work and counts

The packet still has **15 nodes**, **9 API entries**, **9 prose definition/construction tests**, **3 planets**, **5 pinned baseline declarations**, **11 supplier requests**, **8 gaps**, and **3 source issues**. There are now **8 source records**, adding the algebraic-space Stein reference. Every node remains `unchecked`, and both packet and stage remain `partial`.

The six coefficient-devissage nodes from #2938 are preserved: naturality; flat-tensor/section left exactness; product/invariant left exactness via unique lifts; prime-quotient injectivity; nonsplit extension using the existing short-complex monomorphism theorem; and finite prime filtrations. The arbitrary-coefficient argument still lifts a section from a finite submodule and uses injection of coefficient families, not a product/colimit interchange. Its nilpotent-torsion and nonfree-projective safeguards remain.

The previous common-boundary-completion repair and the obstruction to a coordinate-preserving map from k[[x,y]] to k[y,y^-1][[x]] are unchanged. Refinement cohomology and the tensor-exact boundary sequence are separate obligations. The new finite-thickening comparison does not prove the common-chart construction or either of those results.

The unchanged suggested file has thirteen low-level example blocks and the linear recognition theorem, not fifteen geometric signatures. Six algebraic example bodies still contain sorry; none was compiled in this continuation. The missing geometric signatures and nine geometric tests remain explicit, with no Prop-valued replacement storing the desired theorem.

## Ownership and dependency order

Generic morphism/regularity and quotient-tensor facts belong to SF.0. Algebraic-space and stack descent interfaces belong to SF.1. Proper coherent cohomology/formal functions and the cohomological proof of the Stein theorem require SF.2 coordination. Early C5 supplies the actual relative boundary and PEL stratum comparison; F0 supplies the finite-thickening inverse systems and completions. B5 consumes their actual outputs.

**Before promoting whole-stage edges, resolve the foundations export granularity.** The packet's SF.1 component-interface request coordinates SF.2; it must not be implemented as an import of the entire later SF.2 stage into foundational SF.1. A safe module order is early SF.1 spaces/descent -> SF.2 proper coherent cohomology and Stein factor -> the generic component-detection application -> early C5's PEL instantiation -> B5. Place the late assembled theorem in the appropriate owner module or split the interface explicitly. No global stage-DAG validation is claimed here.

Likewise preserve the existing early/late C5 separation: early toroidal charts feed B5; the late minimal compactification consumes B5 constant terms. The Stein factor in the new proof is over the **arithmetic base**, not that Shimura minimal compactification, and does not consume its Hodge positivity theorem.

The generic prime-filtration request in R03.3 still needs confirmation at the general Noetherian scope, rather than merely its current complete-local patching conventions. No extra private commutative-algebra or Shimura component carrier has been created.

## Source and repository evidence

Unchanged pins:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

All five baseline verification records are retained from preceding checkpoints; none is claimed as a fresh pinned declaration audit here. In particular, the earlier check of `CategoryTheory.ShortComplex.mono_τ₂_of_exact_of_mono` and the ModuleCat abelian import is not rebranded as current Lean compilation. No new Stein-factor declaration is asserted to exist or be absent in the pinned libraries.

Read the required worker, blueprint, browser-agent, expansion and upstream protocols. Read the AutomorphicBundles atlas stages, the current ShimuraCompactifications and SchemeAndStackFoundations reader documents, the existing B5 packet/reader/suggested/handoff, and the B5 section of reviewed `AUDIT-13.result.json` (blob `3d64f2dd7d5dcdb228f3db06088b7f79f1b3163e`). The oversized `data/library-coverage.json` again returned empty content, so it is not claimed read. The ModularForms and AdicSpaces introductions were consulted as interface/density examples, not fully re-reviewed or replanned.

Input blobs:

- Packet: `9556aa0a9af4f6b3ed7eb9533a6de9b8cd75abe8`.
- Reader: `6a7d9dae2c60430cbd7da4b0b5df81be9a9caf9f`.
- Suggested Lean, unchanged: `8e6ddc50b4bc0f57e1da94cfc7f78061dfa71baf`.
- Previous handoff: `5c477f88c590a9d90acbc0b9b5cb710d674a5814`.

### Primary sources actually inspected in this continuation

- Lan, author-hosted revision dated 14 March 2021: https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf. Read the surrounding theorem text and inspected rendered printed pp. **520, 523 and 539**, PDF indices **547, 550 and 566**. These cover the relative boundary/no-self-intersection and formal-completion clauses, neat algebraic-space conclusion, component-count corollary, and the actual expansion-principle statement/diagram. Earlier page readings are retained as history, not all repeated.
- Stacks https://stacks.math.columbia.edu/tag/0A18: Lemma 76.36.1, Theorem 76.36.4 and its proof through formal functions/idempotents, and Lemma 76.36.9 with its proof. Also opened the latter separately at https://stacks.math.columbia.edu/tag/0E0D. These are algebraic-space results, so the neat argument does not require an unproved scheme realization.
- Revisited Stacks 00IP's local Krull-intersection statement. The earlier prime-filtration, projective-summand and stack-colimit verification notes remain provenance of the preceding checkpoint, not fresh full reads in this continuation.

No publisher edition of Lan's book was inspected. No PDF binary hash was measured; direct downloads/local network access failed. The new clopen-image and finite-thickening proofs are explicit deductions, not newly numbered source propositions or new source-error allegations.

## Source issues retained

E6811 (p. 536 indices), E6812 (unsupported direct map between different completions), and E6813 (p. 533 union-of-free-submodules inference) are unchanged. Their scope is the inspected author revision, not an uninspected publisher edition. They are objections to specified proof steps, not newly certified counterexamples to the final theorems. Existing errata searches and novelty limitations are preserved, not re-adjudicated. Independent review is still needed; no author was contacted.

## Validation boundary

- The file updates used the connected GitHub tools on the dedicated branch. No complete local repository checkout, `scripts/check_blueprint.py`, full repository unittest suite, global stage-cycle check or pinned Lean compilation was available or run.
- **Actually ran four finite-ring regression checks** in local Python, for R=Z/4, S=Z/2, A=R[q]/(q^3), P=A and I=(2,q), at ideal powers m=1,2,3,4. By enumerating generated ideals, the preimage of I_S^m was exactly I^m+2A; both quotient sides had respectively 2,4,8,8 elements. This tests the finite cokernel comparison with a nonflat coefficient quotient. It is not a proof of the generic lemma, a completion-limit test, a Lean test or a geometric verification.
- Current-head browser CI and changed-path checks are to be recorded in the PR conversation after observation. No predecessor check result is borrowed. Passing submission validation does not establish the geometric instantiations or elaborate the unchanged suggested file.
- The new result is a source-backed mathematical proof refinement and a narrower implementation handoff, not completion of B5.

## Exact next work

First finish the **actual neat C5 stratum-closure identification**: use the relative normal-crossing/toric orbit incidence description to construct the correct W_a and prove that the chosen Z_a is its relative coordinate-stratum open, dense in every geometric fiber. This is stronger than total open density. Feed that precise instance to the smooth-closure lemma; do not restart the coefficient-devissage argument.

Then address **non-neat component transport** using the actual proper branch normalization/stack or compatible level-change geometry. Prove coverage of every geometric component and the required section descent, rather than assuming that a neat pullback has the needed detection property or dividing by a group order.

In the formal-chart strand, match the finite-thickening quotient isomorphisms to the actual Mumford-family chart ideals, Hodge transports, coefficient projections and flat-atlas descent. Keep the distinction between completion of the coefficient sheaf and tensoring an already completed module.

Resolve the foundations export granularity and the early/late C5 split before promoting full-stage dependency edges. Accept the generic prime-filtration scope. Keep the common-boundary-completion, coefficient-sensitive refinement cohomology, boundary exact sequence and genuine Lean-carrier/signature obligations open.

The untouched B5 scope still includes the geometric pull-identify-trace Hecke action, arithmetic normalization and Hecke-ring composition, non-neat Hecke descent, general Levi weights, ramified Hilbert cases and actual analytic comparisons. Reuse the reviewed analytic and modular-curve suppliers before adding such nodes.
