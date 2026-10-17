# Handoff: GL₂ modularity lifting revision 2

Refs #10105. Job `BP-GL2ModularityLifting--R22.1~2`, Codex, session `codex-qkZIrl`, 17 October 2026. Branch `codex-qkZIrl-gl2-revision`, starting from atlas main `469f01060`. The [bot confirmed this session’s claim](https://github.com/CBirkbeck/tauceti-explorer/issues/10105#issuecomment-6232825466) before work began. This is the sole job taken in this run.

The assigned target-level pass is complete and ready for independent review. The packet has **104 unchecked nodes**: 14 definitions, 14 constructions, 36 lemmas, 35 theorems, four comparisons and one application. It has **93 API items, 86 test specifications, 26 planets, 11 baseline entries, 11 gaps and 28 requests** (25 open, three provided). Every definition/construction has at least three tests. All eleven scope stages are **planned**; none is closed. Packet completeness is not proof closure, review acceptance or a mathematical implementation claim.

## Deliverables and scope

The four authorized outputs are the [packet](../packets/GL2ModularityLifting--R22.1.json), [reader](../readmes/GL2ModularityLifting--R22.1.md), [suggested Lean file](../suggested/GL2ModularityLifting--R22.1.lean) and this note. No supplier packet, atlas data, live roadmap, review report or upstream checkout was edited.

The original packet’s stable identifiers and correct mathematical corrections are retained. Constructor/property bundles are split, consumed APIs have explicit theorem prerequisites, every local target is in the reader, and source passages are removed recursively. Earlier independent review objects remain in `reviewHistory`; this revision’s `review` is pending. The new source issues have no self-issued independent verdict.

The issue names `REV-GL2ModularityLifting--R22.1~1.md`, but that report is absent from this checkout, current main and the queue’s report paths. The available original `REV-GL2ModularityLifting--R22.1.md`, the subsequent area-fix reviews, and the current packet’s complete recorded findings were read. In particular, `REV-FIX-RT-AREA-langlands-2~4.md` supplies the current fifteen-node, 53-API, 46-test finding. No unavailable report is claimed as read.

R22.1–R22.6 and R32.1–R32.2 are planned here. R32.3, R32.4 and R32.5 import their exact fine targets from the separately accepted `GL2ModularityLifting--R32.3` packet. The new coverage records include its `suppliedBy` IDs and preserve its remaining obligations. They do not copy its definitions or replan its dyadic, Pan or small-prime theorems. R32.6 is outside this job.

## Disposition of the sixteen inherited gaps

| Inherited finding | Revision disposition |
| --- | --- |
| Typed suggested signatures/tests incomplete | All 93 API items and 86 tests are mathematical specifications in the reader. The suggested file follows the current universal WORKERS shape, with a layer-by-layer omission manifest. Arithmetic signatures are not represented as elaborated. See the explicit shape reconciliation below. |
| Declaration granularity/API promotion | Separate framed algebra, framed module, properties and framed map; auxiliary action image, branch ideal, deformation map, eigenvalue comparison, surjectivity, Hecke comparison, integral control and module control. Separate avoidance construction/comparison, dyadic finite datum/ring/module/torus and modern filtration/rank/support. Consumed target-level assertions are prerequisites. |
| Arithmetic patching constants/maps | `arithmetic-patching-data`, `finite-level-patching-realization`, `patching-data-finite-and-compatible` and the two enhanced dyadic targets specify c_m, r_m, r′_m, power ideals, all scalar/presentation/augmentation/action maps, shift n+a and finite-isomorphism classes. D″_m→D_m has a small kernel; only the limit identifies the fibre. |
| Finite presentation/support descent | Explicit finite presentation in framed base change; finite action image, Noetherian and depth hypotheses in `patched-support`; domain-only full support; local projectivity and positive rank in generic-fibre specialization. Avoidance retains the exact catenary/equidimensional special-fibre transfer contract from R03.6. |
| Integral R=T/presentation bound | `integral-r-equals-t-when-smooth` imports the precise Global relation bound and R03 algebra contracts. Relations, framing variables and the uniformizer form the parameter sequence; finiteness alone is not used to infer a complete intersection. |
| Solvable base change/local prescription | Two early CHT helpers now belong to R22.1. Allowable extension existence records every completion, disjointness, parity and quadratic clause, and uses pinned weak approximation. Transport of α/β is independent. Each application retains its own splitting and local-lift conditions; generic automorphic descent is not a field-choice theorem. |
| Type/determinant component transport | Import the actual R08.4/R08.5 component nodes. The additional fixed-type/determinant and base-change extensions stay precise requests, including matching ordinary quotient labels and the nonordinary residue/trivial-residual restrictions. |
| Quadratic irreducibility image bridges | Preserve E9’s H-eigenline proof, cyclic quotient/square-subgroup argument, and the Dickson/Cartan owner imports. Upper-triangular solvability is already in pinned Tau Ceti and is now cited. No replacement Borel theory is planned. |
| Hodge–Tate/modular twists | Separate normalization and weight-of-twist targets; retain k,k′≥2. Exact R06.2/R19.2 requests describe tensor weights, finite-order normalization and modular twist compatibility. |
| Finite coefficient field/stable lattice | Closed as a planning ownership gap by the existing Arithmetic R01.1 nodes `baire-descent-to-a-finite-coefficient-field`, `continuous-representations-have-stable-lattices`, and `continuity-descent-and-lattice-independence`. They are prerequisites of the four lifting predicates and the Q specialization. No compactness-only argument or duplicate descent theorem remains. |
| Multiplicity proof inputs | New filtration, corrected generic rank and weight-specific nonvanishing/support targets precede the normalized graded-piece lower bound. The generic rank is 2^{|R|}; the nonexceptional local exclusion remains. Smoothness at the relevant automorphic points, exactness, auxiliary type lifts and purity remain requested arithmetic inputs. |
| Exceptional support/independence | Kisin’s nonexceptional route, Hu–Tan’s local factors and Tung’s all-odd-prime route are distinct. R30.6/R31.5 requests retain their exact local/global support inputs. A separate R31.6 request records independence of all the auxiliary globalisations from an unconditional Serre theorem. |
| Prescribed modular witnesses | KW §8 witnesses are owned by R22.1, independent of the later lifting conclusion. Gee’s prescribed-types source has now been read in the relevant passages; the current source’s theorem is 4.6.9, rather than old 4.4.12. Independent quaternionic type/weight changes and small-prime witnesses remain R20.6 requests. |
| Ordinary-three/consumer transport | The predicate retains finite-order ψ, local quotient and residual 1⊕ω; it imports the actual R21.5 theorem-a-at-three. Ordinary overlap uses the exact nearly-ordinary supplier, including distinguishedness and its non-CM restriction. External old bundled consumers must choose the correct split predicate; see redirects below. |
| Dyadic dimension/regularity/faithfulness | Separate dimension/power-series isomorphism, generic regularity and integral faithful-module targets. Stabilized action chunks give the ambient torus action; only T[2] preserves determinant one. Generic twist-transitivity and the connected invariant base give full component support; O-flatness restores integral faithfulness. |
| Unread nonordinary crystalline endpoint | Read Kisin Durham Proposition 3.13 and Theorem 3.14 with their proof context. New Q-only crystalline target and `nonordinary-weight-p-plus-one` give the exact route. The wider Hilbert statement is not silently used. BLZ, same-weight eigenform lifting and local-domain inputs remain requests. The separate ordinary endpoint uses a precise Diamond R21.5 extension, not a widened Skinner–Wiles theorem. |

BCDT adds the type and extended-type lifting targets requested by the maintainer. They assume residual modularity, the quadratic/cyclotomic irreducibility condition, local scalar centralizer, admission and weak acceptability. The corrected coefficient Hom-modules, normal subgroup descent, dual local systems, ℓ-adic topology and w_ℓ-positive summands are explicit. The numerical route requests **CDT Theorem 5.4.2**, separately from the accepted generic-fibre patching theorem and the Kawasaki Part II algebra. An arbitrary local type is not asserted to work unconditionally.

## Suggested-file shape and the earlier API finding

The current [WORKERS.md](../WORKERS.md), “The streamlined pipeline,” requires that the suggested file **“states and does not develop”** and permits **“no definitions beyond light real-bodied ones over carriers that exist at the pins”**; it places heavy definitions and unavailable carriers in the README. This is the binding shape for this new revision. The older issue text and area review describe the former full-signature/stand-in approach; the area review itself predates applying the current universal shape to this revision.

Accordingly, the old 990-line file’s stand-in arithmetic structures, data definitions without bodies and opaque witness carriers are removed. The 136-line suggested file has real-bodied integer/group-homomorphism definitions and statable milestones: pStar, determinant exponents, their unit-restriction predicates, odd-primary square-root adjustment and the matrix oddness bridge. No substantial construction is developed there. Its concrete examples catch exponent signs, residual-weight-two restrictions and characteristic-two determinant failure.

The full omissions are explicit in the suggested-file header and reader: actual Hecke/Galois/deformation objects and maps, field/character constructions, coefficient modules, patching limits, tori, BCDT types and all four modern lifting predicates. Even when a raw number field or commutative ring carrier exists, a substantial construction remains a README target. All definition/construction API and test specifications, hypotheses, theorem/section/page locators, Check specifications and worked examples are present in the reader. This resolves the obsolete shape demand without pretending that 53 missing arithmetic signatures or their tests now elaborate. Independent review must judge compliance with the current rule.

## Ownership moves and consumer redirects

The tier list places GL2 at tier 21 and PotentialModularityAndCompatibleSystems at tier 22. The former upward CHT imports therefore move down:

| Old owner ID | New owner ID |
| --- | --- |
| `PotentialModularityAndCompatibleSystems:R23.1/cht-character-extension` | `GL2ModularityLifting:R22.1/cht-character-extension` |
| `PotentialModularityAndCompatibleSystems:R23.1/cht-soluble-prescribed-completions` | `GL2ModularityLifting:R22.1/cht-soluble-prescribed-completions` |

The maintainer/supplier follow-up should replace those R23.1 declarations by imports/redirects and point their uses, including the early residual-field choices, to the new owner. R22.1’s Lemma 7.10, allowable-field existence and soluble-base-change consumers already use the new IDs. The finite-order/p-primary character refinement comes from CHT’s proof, allowing increased order; it is not a fixed-order Grunwald assertion.

The stable R22.5 α/β identifiers retain parent R22.1 ownership so §8 does not depend on its later modularity conclusion. SerreWeightAndLevelOptimisation R20.6 must supply independent weight/type-change ingredients; an existing use of KW §8 imports the new R22.1 witness exports and cannot be the input proving them. The request explicitly separates those directions.

Existing consumers of the old bundled `R32.1/lifting-statement-table` must select that odd-prime predicate, `dyadic-lifting-proposition`, `residually-reducible-lifting-proposition`, or `ordinary-three-lifting-proposition` as appropriate. No external packet was edited. R24.4 and RS-08 stage wording should describe KW I Theorem 4.1 as an import from GL2 R22.5/R22.6, without a new dependency on potential modularity or generic deformation-ring finiteness. The packet’s rescope notes state the current boundary rather than outdated consumer claims.

## Source and library receipts

Only public sources were needed. The maintainer’s library index was read; no restricted book or book passage was copied. All source statements in these outputs are in the worker’s own words, with locators. Historical source-version and review records remain distinguished from this run’s selected-passage rechecks.

The fresh targeted readings included:

- KW II §§7.4–8.4, author pp. 63–77; §9.1–9.2, pp. 78–90; §10.2, p. 92; KW I Theorem 4.1 and its use. The full alternatives, the power-ideal construction and the dyadic comparison kernels were checked.
- CHT Lemmas 4.1.1–4.1.2 and both proofs, printed pp. 116–117: character extension, finite-order refinement, prescribed completions and disjointness. Quadratic weak approximation is cited from the pinned library.
- Kisin’s finite-flat modularity source, Proposition 3.3.1, Lemma 3.3.4, Theorem 3.4.11 and Lemma 3.4.12, author pp. 62–70, alongside the published ordinary-component hypotheses. The determinant/component refinements remain requests.
- Gee–Kisin Appendix B.1–B.5, pp. 38–41, especially the complete proofs of B.5.1–B.5.2. Generic rank, exact weight ring support and the normalized inequality are retained separately.
- BCDT author copy, §§1.1–1.4, pp. 7–15, and §10, pp. 77–78, with the corresponding CDT type/numerical/cohomology passages. **CDT’s author copy has 47 pages**, not 33; all node locators use that author pagination unless explicitly marked published. The corrigendum cites published pp. 532–554 separately.
- Kisin Durham, Theorems 2.11/2.13, Proposition 3.13 and Theorem 3.14, author pp. 19–21 for the endpoint. The Q specialization avoids its stated higher-weight Hilbert level-lowering limitation.
- Gee, *Automorphic lifts of prescribed types*, §3.1, author pp. 8–10, and §§4.4–4.6, pp. 20–26; this version’s Theorem 4.6.9 is on p. 26.

The packet records edition-specific hashes and reading dates. Earlier independent locators and source issues remain, without being presented as a new complete reading of every modern primary source. E1–E9 are preserved; E10–E11 belong to the accepted modern part. New **E12–E18** record BCDT’s known CDT corrections: the two significant residual-support errors, subgroup normality, coefficient topology, level quotient labels, the unused semisimplicity assertion, remaining numerical/type labels, and elliptic-curve consequences outside this lifting scope. The latter are routed to the existing elliptic-curve roadmap, not added as GL2 targets.

The reviewed library audit, current owner packets, accepted RS-08/RS-23 boundaries and current upstream roadmaps were read. Pinned declaration statements were checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current read-only heads were TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Nine newer roadmap directories absent from the snapshot were inspected, plus nearby upstream forms/curves/Galois roadmaps. No upstream build was run.

Two existing Tau Ceti results prevented duplicate targets: `TauCeti.UpperTriangularGroup.instIsSolvable` and `TauCeti.GlobalNumberFields.weakApproximation_denseRange`. The three Arithmetic R01.1 finite-coefficient/lattice nodes likewise prevent re-planning that theory. Hensel lifting uses `HenselianRing` together with `IsAdicComplete.henselianRing`, not `Polynomial.Splits` by itself.

## Validation and exact remaining work

`python3 scripts/check_blueprint.py research/blueprint/packets/GL2ModularityLifting--R22.1.json` reports **zero errors and zero warnings**. The final packet-reader inventory agrees on all 104 target statements and hypotheses, 93 API items and 86 test names/specifications. Names are unique; every gap/request consumer resolves; every node remains unchecked; source-issue IDs avoid the accepted modern part’s IDs. No source-passage field, private absolute path or executable Lean text is in the packet/reader.

A read-only fine-node traversal prefers current unsuffixed owner packets over historical overlapping packets and this revision over its older owner record. The 104 starts reach **3,459 fine nodes**, with **zero cycles and zero unresolved external fine prerequisites**. Stage requests are not expanded into all the declarations of a stage. This is an explicit finite dependency check, not a claim of global stage-graph promotion or independence proof.

The suggested file was elaborated sequentially with `lean-check` at the pins, after checking available memory. It returned **exit 0**, no errors, and **six expected unproved-statement warnings**. Its 136 lines are below the current 5,000-line limit. No Lean language server, dependency build, package update or cache download was started. `git diff --check` and the four-output scope check pass. No compiler is left running.

The complete request text and each direct consumer are in the packet and reader. Follow-up must discharge these eleven supplier-gap groups: KW coefficient/level control; fixed-type/determinant components; general Fontaine–Laffaille smoothness; independent weight/type changes; BCDT admission/corrected cohomology; the CDT numerical criterion; BLZ/local-domain/weight/Diamond endpoint inputs; modern multiplicity arithmetic; exceptional support and independent globalisation; twists/descent; and conductor/restriction-image adapters. R03’s current algebra targets and Part II are consumed where their actual statements suffice, rather than duplicated.

The three provided requests import TauCetiRoadmap ClassFieldTheory Layers 7/12 and Chebotarev Layer 10. They remain planning imports, not implemented global field-choice routines. No additional source download is needed to resume the outlined proof routes. The requested supplier extensions must still state and justify their exact arithmetic contracts; the missing named revision-1 report, if it becomes available, must be compared during independent review.

Next action is independent review of this revision, followed by supplier work and the recorded external redirects. The modern part’s own remaining obligations remain with its accepted owner. This run opens its one pull request and stops without taking another issue. Scratch source renderings and logs are disposable; this note, the reader and packet contain the durable handoff.
