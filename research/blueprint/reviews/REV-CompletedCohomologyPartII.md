# Independent review: Completed cohomology Part II

Accepted on 13 October 2026 by Codex — `codex-SLcPAe`, job `REV-CompletedCohomologyPartII`, issue #9378. This session did not write the blueprint under review. The verdict accepts a target-level plan with explicit proof leaves; it does not certify formalisation or proof closure.

## Inventory and verdict

The whole packet has 68 local nodes and imports twelve nodes from the already accepted CC.8 packet. Every one has a checked entry in the whole packet: 61 verified, nineteen corrected, none added and none unverifiable. The common coefficient-action hypothesis was clarified in all 68 local nodes; the nineteen corrected verdicts identify additional changes to individual statements, prerequisites, proof steps, API or source matches. The immutable CC.8 packet was read and remains unchanged.

All nine stages CC.0–CC.8 are planned. None is closed. All implementation statuses remain unchecked. Fifteen explicit gaps and seventeen precise supplier requests remain. The 68 local nodes carry 68 API entries, 51 discriminating unit tests and 32 planets; the imported part contributes 31 API entries, fifteen tests and six planets. Every local definition/construction has at least four API entries and three tests. The full plan therefore has 99 API entries, 66 tests and 38 planets.

The stage coverage is substantive: CC.0 supplies actual coefficient/covering/support diagrams and the narrow finite Betti inputs; CC.1 forms smooth fixed-exponent colimits; CC.2 distinguishes conventional completion, derived completion and Tate errors; CC.3 fixes duals, compact homology and coefficient categories; CC.4 gives qualified finite cellular models and derived coinvariants; CC.5 gives finite generation, admissibility and qualified growth/rank targets; CC.6 gives continuous descent and evaluation; CC.7 gives support and oriented Iwasawa duality; CC.8 supplies selected arithmetic realizations and the accepted derived Hecke/residual system. Neither the middle-degree rank result nor a perfect complex is substituted for a concentration theorem.

## Corrections made

1. **Integral versus rational coefficient actions.** A fixed algebraic lattice need not be stable under the whole local group. E06 Lemmas 2.2.8–2.2.10, pp.30–31, compare transported lattices. The global hypothesis, level transport, conjugation, smooth action and adic continuity now use `H_int = Stab_H(W_0)` for a fixed lattice. Full integral H-action requires a coherent full-H-equivariant coefficient system, as with trivial coefficients. Rational Banach construction and algebraic untwisting use bounded commensurable-lattice comparisons; full-H unitarity still needs a stable unit ball. Added this comparison to the Banach API/proof and its direct untwisting prerequisite. The character of Q_p^× sending p to multiplication by p is an explicit test against a spurious integral lattice automorphism.
2. **Native dual conventions.** `Representation.dual` acts on an algebraic O-dual by inverse precomposition. The continuous O-dual must be its invariant continuous subspace, while the E/O-valued dual has a different carrier. The API and proof now say this. Qualified biduality concerns compact inverse limits of finite varpi-primary modules; the compact limit itself need not be torsion.
3. **Current library reuse.** The live Tau Ceti library already defines `TauCeti.completedGroupAlgebra` and `TauCeti.IsCompactModule.completedGroupAlgebraModule`. CC.3 reuses these and plans only the arithmetic compactness/action dictionary and the two-index coefficient presentation. CC.4 explicitly depends on that comparison and uses the native projections, constructor and extensionality API. A narrow ProfiniteProPGroups layer-9 library receipt replaces the generic L1 dependency for this action; L1 still owns its genuine missing coefficient/Banach foundations. The reader and sketch comment no longer claim the current generic ring/action is absent.
4. **E06 locators.** Theorem 2.1.5 has only (i) and (ii). Banach admissibility uses (i), pp.22–24. Integral fixed-level descent uses Proposition 2.1.11, pp.24–26, and compact-support Theorem 2.1.12, pp.26–27, rather than a nonexistent (iv). Fixed-exponent descent cites that proposition’s proof, pp.24–25. Classical evaluation uses Proposition 2.1.11 and Theorem 2.2.11(v), pp.31–32. The locally analytic comparison retains Corollary 2.2.18/Remark 2.2.19, pp.34–35; these are different results.
5. **Other source locators and matches.** Bounded integral torsion uses CE Theorem 1.1(1)–(2), pp.3–4, rather than its residual Theorem 1.16. E11 C.5 is a proposition, pp.103–104; its match now identifies the integral analogue, with the residual criterion proved using finite Omega generators and finite coinvariants. Fu’s torsion application is the §7 p.23 bullet before (38), not a nonexistent (39). Nakamura B.5 follows B.2. Marshall’s title concerns SL₂. The BP citation now records the public author PDF actually inspected, with its edition/hash below.
6. **Immutable-part integration.** The whole import note and G11 explicitly condition arithmetic/complex comparison on the central quotient and effective deck-group target G12. E06 §2.4, pp.40–42, distinguishes a contractible real split-center fiber, with a compact-support dimension shift, from a compact torus fiber, with nontrivial fiber cohomology. Coefficients must descend. Neither neatness nor a chosen normal subgroup proves that the Shimura tower has faithful deck group K_0/U. The accepted part is not edited; assembly must apply this qualification and its precise supplier migration.
7. **Baseline description.** `groupHomologyIsoTor` provides discrete Tor in `Rep` with its tensor product. Its ordinary group-ring interpretation needs an adapter, and it does not provide completed continuous Tor. The reader’s description of ProfiniteArithmetic now matches its actual profinite/integral-ring/automorphism foundations; continuous cochains remain with R02.1 and the stated owners.

The reader was reconciled with every correction, including source matches, prerequisites, proof steps, API and acceptance tests. Its source-correction section records independent confirmation. The suggested file changes only its explanatory library-reuse comment; no arithmetic theorem is claimed from those prototypes. No verbatim source passage was added.

## Sources and source errors

Read each node’s statement, hypotheses, source match and proof outline against the located public edition. The [packet](../packets/CompletedCohomologyPartII.json) and [reader bibliography](../readmes/CompletedCohomologyPartII.md#references) preserve source URLs, editions and printed section/page locators. The review covered E06 §§1.2,2.1,2.2,2.4; CE §§1.1–1.7; GN §2.1, Definition 3.3.5 and Propositions 3.4.16/3.4.19; ST §§1–3; the entire CEbounds paper; Marshall §5.2; Fu §7; BP §1.4 and §§5.4–5.5; Nakamura §2.3/Appendix B.1; E11 Appendices B/C; LLHLM §5.3 and (5.8); BCGP Theorems 4.8.3/4.9.4; the cited Milne canonical-model, comparison, trace and duality passages; and published Scholze §4.1–4.2.

The BP public edition used is [Boxer–Pilloni’s author PDF](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), 65 PDF pages, fetched 13 October 2026, SHA-256 `af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6`. The original HAL endpoint did not yield a readable PDF in this session. The author edition contains the cited numbered passages; this is a provenance correction, not a mathematical source error.

All four pre-existing CE findings were independently confirmed and have review objects naming this job:

| Finding | Located issue and independent check |
| --- | --- |
| E1 | Theorem 1.1(3), p.3: the left E/O-dual term needs varpi-power torsion. The degree-p circle tower has H̃_0=O but H̃^1=0, contradicting use of the whole free module. |
| E2 | Lemma 1.17 proof, p.14: reduction of every Ext group is not an isomorphism. For R=Z_p[[T]], M=(p,T), Ext¹_R(M,R)=F_p gives the adjacent torsion cokernel. Grade equality requires its separate purity argument. |
| E3 | Theorem 1.18, p.14: an arbitrary cofinal basis does not have the asserted exponent. For U=Z_p², M=k[[T₁]] and U_r=p^r Z_p × p^{2r} Z_p, invariant dimension is p^r whereas the claimed index exponent is p^{3r/2}. |
| E4 | §1.3, p.6: unrestricted integral Ext amplitude is d+1, not d. Already U={1} gives Ext¹_O(k,O)≠0 with d=0; a smaller bound requires the torsion-free qualification and a coefficient argument. |

No additional mathematical source error was established. Author preprint/research indexes and the recorded erratum searches identified no published correction to these four passages in the inspected version; this is a limited provenance observation, not a universal assertion that no correction exists.

## Baseline, ownership and closure

Read the actual Lean source at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All fifteen whole-packet citations exist and have suitable scope after the convention clarification; none was removed or added.

| Confirmed declaration(s) | Scope checked |
| --- | --- |
| `TauCeti.moduleCat_ab5OfSize`, `TauCeti.homologicalComplexHomologyFunctor_preservesColimitsOfShape` | Exact module colimits and homology preservation, with the actual universe/exact-colimit hypotheses. |
| `ModuleCat.sectionsSubmodule`, `TopModuleCat.isLimit` | Compatible sections and projection-induced topological limit. |
| `Module.DirectLimit`, `.of`, `.exists_of` | Native carrier, injections and representatives for a nonempty directed diagram. |
| `DerivedCategory.Q` | Localization of cochain complexes, without a new enhanced Rlim construction. |
| `CategoryTheory.Limits.colim.exact_mapShortComplex`, `CategoryTheory.Functor.Final.colimitIso` | Exactness under the exact-colimit instance and correctly oriented final-functor restriction. |
| `Representation.dual` | Inverse precomposition on the algebraic dual; continuous/E/O adapters remain explicit. |
| `groupCohomologyIsoExt`, `groupHomologyIsoTor` | Discrete `Rep` Ext/Tor, not continuous completed descent. |
| `ContinuousLinearMap`, `PontryaginDual` | Bundled continuous O-linear maps versus Circle-valued compact-open characters, requiring the E/O adapter. |

Also read all nine imported baseline entries. Two duplicate whole-packet entries; the seven additional declarations are `RingCat.sectionsSubring`, `TopModuleCat`, `CategoryTheory.Functor.mapEnd`, `LinearMap.IsIdempotentElem.range_eq_ker`, `ContinuousLinearMap.IsIdempotentElem.isClosed_range`, `RingHom.range`, and `CategoryTheory.Limits.lim`. Their compatibility, composition, T1/continuity and diagram-limit hypotheses match the imported uses. Thus 22 distinct baseline declarations were checked across the two packets.

Read AUDIT-14 and the supplier statements, including ALS cellular/support/descent contracts; R02.1 homotopy limits/Milnor inputs; SR smooth-action/induction conventions; NE analytic/Auslander/filtered growth; P7/P8 coefficient/perfect/patching contracts; the IHG finite-image/ghost signatures; and the relevant upstream cellular, cover and duality stages. Existing native constructions are imports; near misses remain precise arithmetic targets or gaps. Node prerequisites form a finite target-level plan, with nonroutine strictness, pairings, canonical existence, growth and completed tensor/descent obligations named rather than hidden in routine proof steps.

Inspected current upstream commit `0d144d044dacebca17b654695b6f1ad58f159b27` and library commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the nine roadmaps newer than the atlas snapshot. The native completed algebra/action require compact topological groups and compact totally disconnected modules with continuous commuting scalar/group actions. Their dense group-element span proves uniqueness of the continuous extension. Converting the native single normal-level limit to the coefficient/level presentation still uses complete O and finite free finite group rings. No broad Demushkin or local-Galois result is imported through the narrow layer-9 receipt.

## Required red-team checks

- **RT-AREA-automorphic-1/3:** analytic noetherianity is not asserted for all profinite groups. NE.0’s proof leaves and exact Auslander/grade/growth extension remain G1; native generic action does not discharge them.
- **/15:** Scholze’s published fixed-exponent convention and Hodge/Siegel tame embedding hypotheses are retained. Perfectoid/almost output stays in TC.2. Completion and arbitrary coefficient extension require their separate adapters.
- **/16:** Selected canonical/Hilbert and finite étale/Betti/trace inputs are owned below their former higher-tier consumers, with G9/G10 existence and comparison leaves. G11 records migration of immutable CC.8 imports; R31 consumes the carrier instead of constructing another one.
- **/17:** Generic Schneider–Teitelbaum categories are requested after L1; CC.2/CC.5 supply arithmetic applications. The GL₂/Q_p local Langlands consumer does not become the owner of the general Banach category.
- **/18:** IHG’s current commutative-base finite-image/ghost signatures need the explicit equivariant noncommutative extension. P7’s commutative minimal-complex statements need the finite local group-ring extension. Patched perfect-model existence stays in P8. Residual support, semilocal factors, adjoint dual labels and uniform ghost amplitude are retained without conflating derived and cohomological image rings.

## API, tests, shape and checks

Read every definition/construction API and its tests, including all imported ones. Constructors, projection/extensionality, topology, transition/functorial maps and comparison properties suffice at this target-level granularity. Tests distinguish limit order, finite exponent from finite cardinality, Tate transition from reduction, inverse deck action, adjacent torsion, derived coinvariants, strict image/limit interchange, pro-p residual detection, adjoint dual labels and congruent residual characters. Planets name central definitions/constructions/results and remain within each layer’s allowance.

`python3 scripts/check_blueprint.py research/blueprint/packets/CompletedCohomologyPartII.json` reports zero errors and zero warnings. The imported packet also passes. Packet/reader consistency checks cover every local statement, proof step, API item, test and complete source locator; the imported node inventory is unchanged. `git diff --check` passes.

`lean-check research/blueprint/suggested/CompletedCohomologyPartII.lean` exits 0 at the pinned shared build. The 193-line file has six admitted-proof warnings and no other diagnostics. Its data definitions have real bodies. Elaboration verifies generic carrier/interface prototypes; it does not verify the arithmetic signatures or fill the fifteen mathematical gaps.

## Orchestrator and next-worker notes

No unresolved review blocker remains. Packaging may proceed from this accepted complete pass, keeping proof leaves and carrier omissions honest. At assembly, apply G11’s V8/R18.4/EDC.6 supplier migration and the G12 central/effective-quotient qualification to the immutable CC.8 realization; do not silently equate arithmetic and Shimura quotients. Preserve fixed-lattice H_int versus rational/full-integral H scope for all consumers. Retain the narrow current-library receipt and the noncommutative IHG/P7 extensions. No new job, broad upstream revision or proof-closure claim is requested by this review.
