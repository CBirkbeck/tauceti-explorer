# BP-PotentialAutomorphyInfrastructure handoff

Job: [#1018](https://github.com/CBirkbeck/tauceti-explorer/issues/1018). Worker: Codex, session `codex-tK01RB`. The bot confirmed this session’s claim on 7 October 2026 at 10:21:10 UTC. Branch: `codex-tK01RB-potential-automorphy`. This submission does one job and claims no second issue.

## Completed planning pass

The packet, reader and suggested file cover PA.0–PA.5 at target granularity. The packet is `complete` in the issue’s coverage sense: **all six stages are planned, none is closed**. Every node remains `implementationStatus: unchecked`. Nothing is claimed formalised.

There are **118 nodes: 27 definitions and 91 theorems; 110 API items; 82 mathematical unit tests; 34 planets; 9 checked baseline declarations; 26 supplier requests; 9 gaps; 6 restructuring proposals**. Every definition has two recorded uses and at least three tests. The 153 supplied extraction items are routed, including the BCGP composite item split into definitions, imported predicates and its three corrected theorem parts. The packet records 76 source corrections, with reviewed-extraction attribution and original search provenance distinguished from this worker’s checks. The target-coverage map explains why general operations and general highest-weight constructions are imports or gaps, rather than duplicate nodes.

The reader gives conventions, both complete good-level profiles (seventeen and fifteen clauses), stage narratives, every named statement, proof outline, direct prerequisite, API, test, acceptance check and source. It also gives the supplier contracts, gaps, source corrections and target/extraction routing. The suggested file and reader both contain all 310 declaration/API/test names and all 118 mathematical statements. No application, atlas, supplier or other worker’s deliverable is changed.

## Validation and precise prototype boundary

- `python3 scripts/check_blueprint.py research/blueprint/packets/PotentialAutomorphyInfrastructure.json`: **0 errors, 0 warnings**, with the available pinned declaration index. All nine baseline names resolve exactly, rather than through suffix matches.
- `lean-check research/blueprint/suggested/PotentialAutomorphyInfrastructure.lean`: **exit 0**, 59 warnings, all from admitted proofs; no other warnings or errors. Memory was checked first and was well above the 20 GB requirement. No language server, dependency update, cache download or library build was started.
- The shared build’s Mathlib commit is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`. Its Tau Ceti checkout differs from `f790474821cf4256814db967cb154e7af3d0c369`, so the suggested file imports only individual Mathlib modules. Tau Ceti searches and source statements used the recorded Tau Ceti commit. Compilation must not be described as a build of the pinned Tau Ceti library.
- Additional consistency checks: all node statements/names occur in both reader and suggested file; every node is unchecked; extraction ids are unique; own-node prerequisite graph is acyclic; neither lifting branch transitively requires the other branch’s patching verification; each stage has at most six planets and every planet name is at most sixty characters; no private paths occur in the deliverables; no prohibited planning words or proof admissions occur in the packet or reader.

**Compilation checks only the available prototype.** Eight concrete definition cores are typed: the categorical equivariant retract, Siegel shuffles, CTG computed-table predicate, positive split-torus monoid, normalized lowest-weight character, unitary Levi-weight dictionary, rank-two weight-zero multiset condition and determinant core of oddness. The numeric ν part of the weight-independent Hida twist and the shifted-partition recovery theorem are typed as well. There are 28 compiled examples and 26 explicit lemma signatures, plus definitions and the finite theorem.

Full arithmetic theorem/definition signatures depend on absent owner interfaces. They are omitted under PROTOCOL §13’s prohibition on proposition-valued stand-ins, with **complete named mathematical obligations in a comment**, not fake arithmetic types. The CTG cuspidal exclusion, integral lowest-weight projection and automorphic oddness APIs also remain untyped. Comment obligations do not elaborate and compilation does not verify them. The eight cores are algebraic/combinatorial cores, not eight implemented arithmetic definitions. The positive torus core handles one split local factor; the full torus is a product with arithmetic topologies. Oddness requires the actual coefficient-member and real-place indices. The Hida prototype types ν, not the unavailable B complex. The arithmetic-signature gap explicitly covers these limitations.

## Confirmed red-team findings

- **RT-AREA-langlands-1/7:** use the issue’s six-stage alternative. PA.4 owns both unpolarized lifting endpoints, ACC Theorems 6.1.1 and 6.1.2, their good-level Corollary 6.5.5/Theorem 6.6.2 and controlled descent. It proposes PA.1→PA.4, PA.2→PA.4 and PA.4→ML.2. No PA.6 outside the assigned scope is introduced. Every image, scalar, weight, p-bound, local and level hypothesis is retained. No polarization assumption is inserted.
- **RT-AREA-langlands-1/21:** G7 owns auxiliary prime sets, diamonds and enormous presentations. PA.4 imports them and constructs/verifies only the associated arithmetic levels and complexes. The G7→PA.4 edge is proposed.
- **RT-AREA-langlands-1/22:** the PA.3 component/action nodes request the actual L7, L8, R08.2, G7 and G8 data. All five supplier edges to PA.3 and L7→P9 are proposed. PA.3’s support contract is conditional; PA.4 supplies the patched pair and applies it. No PA.4→PA.3 cycle is created.
- **RT-AREA-geomlanglands/24:** RG2.6 is proposed as the sole general integral highest-weight owner, independent of parameter stacks, exporting to PA.1 and LP3. PA.1 keeps only its specific GL_n linkage/alcove and Kostant calculations. LP3 keeps the cocycle-scheme assertions. RG2.6 is not yet an atlas stage; the packet records a gap instead of forging a supplying node.

The extra restructuring proposals preserve the R24.5 general-operation owner, broaden the existing PL.0 iota-ordinary owner rather than create a second definition, and route the separate real-multiplication large-image argument to AbelianSurfacesPotentialModularity.

## Mathematical corrections and decisions to preserve

1. Ordinary cohomology uses coefficient-characteristic-p smooth monoid categories, not the ell-not-p Jacquet theorem. Positive torus action on N-invariants uses transfer. The unitary contracting operator runs through 2n−1 simple operators, not n−1.
2. CTG tests computed conjugate-dual rows, with reversal and addition. The sufficient perturbation criterion uses the corrected plus sign in ACC (4.3.7); a trace-only condition is not the definition. The ordinary CTG construction has n≥2; the Hecke-character branch handles n=1.
3. IG.7 concentration is requested independently for both branches. No conjectural mod-p GL_n vanishing is used.
4. Ordinary local–global compatibility includes the ordered matrix identity for arbitrary g₁,…,g_n, as well as all characteristic polynomials. The full flag is proved at the characteristic-zero arithmetic point using the distinct-character local criterion. Unit eigenvalues do not replace that proof.
5. The ordinary boundary map is surjective only onto its Satake image. Proposition 5.4.18 needs a polynomial-law transfer argument to reach the whole GL_n coefficient algebra. This proof leaf is a gap, not an assumption of full Hecke surjectivity.
6. Fixed-ultrafilter patching gives the stated transition-map choice compatibility, not independence from the ultrafilter. Mod-varpi endomorphism images live in D(S∞/varpi). Nilpotence does not imply integral R=T.
7. The dimension count uses **g=qn−n²[F⁺:Q]**. The printed repeated n in place of n² is corrected. For rational GL_n cohomology q_GL=n(n−1)[F⁺:Q]/2 and ℓ₀=n[F⁺:Q]−1. The dual RHom(RΓ,O)[−d] has lower degree **q_patch=q_GL+1**, since 2q_GL+ℓ₀=d−1. P9’s abstract q₀ is q_patch here.
8. Auxiliary levels retain original factors at every v outside Q, including v in S. Ordinary Proposition 6.6.9 uses A(μ,χ,Q), the Q-deformation map and Frobenius polynomials only at v outside S∪Q. The ordinary lifting-point specialization is the finite A₁(λ,1,1), not A(λ,1,1).
9. The quadratic-field examples impose splitting congruences for primes below all three V sets and exclude p_b=p in the FL branch. FL unramified descent at p uses E_w/F_v unramified, hence equal inertia; the all-place local base-change statement is still required. Elsewhere one uses the source’s split test-prime and Varma argument.
10. Qian avoidance applies ACC Lemma 7.1.6(3), m=n−1, to the original F,F₁. Intermediate fields are used only in the adjoint-image proof. AG2.7 is an explicit PA.5 dependency. The residual normal-closure disjointness is over Q for the auxiliary Galois K, not for FK. Ordinary automorphy means automorphic-side iota-ordinarity. Qian’s parallel-weight Steinberg criterion has +jλτ. Equality of compatible Frobenius polynomials initially identifies semisimplifications; an upgrade needs absolute irreducibility.
11. Compatible-system operations remain with R24.5. Its weak all-member-Hodge carrier and weakened-compatible-data node need reconciliation, as already recorded by the AG2.6 review. The current weak-system operation node alone does not supply very/extremely weak operation signatures; the exact extension is requested, with canonical metadata and integral/WD comparisons.
12. BCGP Lemma 9.1.10(3) is corrected to a conjugate of SL₂(F_l) over the normal closure for strongly irreducible systems, without regularity. It does not assert SL₂(O_M/λ). The quartic-twist obstruction is recorded. Its downstream real-multiplication use requires a separate argument, not a reinstatement of the false claim.

## What remains for closure

All stages need their open owner contracts before they can be marked closed. Resume from the packet’s `coverage`, `requests`, `gaps` and `targetCoverage`, and the matching reader sections. No scratch file is needed to reconstruct the plan.

| Stage | Remaining work |
| --- | --- |
| PA.0 | ALS arithmetic groupoid/cellular and coefficient/boundary comparisons; free cells only after freeness; RG2.6 lattice evaluation splitting. |
| PA.1 | Create RG2.6; export the exact contravariant Fontaine–Laffaille interval and twists from R07.3; obtain IG.7 concentration and prescribed finite/crystalline character leaves. |
| PA.2 | Characteristic-p smooth monoid categories and actual arithmetic functor signatures; independently check Geraghty normalizations; polynomial-law transfer through the Satake image; rank-one Hecke-character branch. |
| PA.3 | Complete L7/L8/R08.2/G7/G8 action and component contracts and local-to-global mod-varpi diagrams; import the full P9 support/specialization hypotheses. |
| PA.4 | P8 fixed-ultrafilter contract; P7/ALS uniform minimal-rank, free-cell and perfect c-limit reconstruction inputs; primary-source soluble unpolarized descent and all-place local compatibility; type the lifting signatures. |
| PA.5 | R24.5 weakened-carrier/operation reconciliation and extremely weak character/monodromy leaves; finite projective-group inputs; AG2.5 purity/local comparison; type weak automorphy and its transport; separate downstream RM large image. |

The nine gaps are: the uncreated highest-weight owner; prescribed finite character; arithmetic signatures and weakened-system interface; Geraghty primary-source normalization; extremely weak monodromy/rank-one leaves; uniform freeness/reconstruction; unpolarized base-change/local comparison; finite projective-group classification; and ordinary Satake-image polynomial-law transfer.

The 26 supplier-stage contracts are ALS.1/ALS.3/ALS.4; SR.0:derived-extension/SR.1/SR.2/SR.3; IG.7; R07.3; R06.4; AG2.0/AG2.5/AG2.6; R24.5:operations; L7/L8/R08.2; G7/G8; P7/P8/P9; PL.0; ML.1; and the upstream ReductiveGroups structure/integral-group-scheme layers. AG2.7 is an additional exact-node import for genericity and its split witness, not one of those 26 requests. General highest-weight RG2.6, finite character globalization and finite PGL₂ inputs are recorded gaps/proposals where an exact existing supplying stage was not established. Follow-up work must preserve single ownership.

## Sources read and not independently read

Read public copies and recorded SHA-256/date/edition metadata in the packet:

- ACC, published Annals 197 (2023), author-hosted published PDF: conventions and coefficient/Hecke/boundary setup in §§1.2, 2.1.9, 2.2, 2.4; §§4.1–4.5, §§5.1–5.5; lifting statements, §6.3.5 contract, §6.4.1 setup and Proposition 6.4.17; arithmetic §§6.5.1–6.5.12, 6.6.1–6.6.10; §7.1 through Lemma 7.1.10. Printed Annals locators are used consistently.
- Qian, published Inventiones (2023), NSF copy: Definition 1.3, Lemma 2.6 and its proof, Lemma 4.3 and Remark 4.4, relevant ordinary base-change and composita/genericity passages.
- Boxer–Calegari–Gee–Newton–Thorne, 2025 author copy: §6.1 Definitions 6.1.1–6.1.2, Lemmas 6.1.4–6.1.5 and symmetric-power uses. The author PDF places these on pp. 58–59; extraction page numbers refer to another edition.
- Boxer–Calegari–Gee–Pilloni, 2021 author manuscript: §9.1, definitions immediately before Lemma 9.1.10 and all three parts, pp. 251–252.

The primary Geraghty 2019 definitions/lemmas, Henniart/Serre character-family theorem, precise Larsen–Pink/Larsen editions, DDT/Dieudonné finite-group inputs, full Arthur–Clozel soluble descent/local comparison and Varma’s 2024 Theorem 1 were not independently read. ACC/Qian/Bianchi applications were checked, but these underlying proof leaves remain supplier requests or gaps. No publication-wide erratum database search is claimed; recorded searches from accepted extractions are explicitly attributed.

The scratch source copies, generators, worklist and logs are disposable and are not repository deliverables. Everything a follow-up needs is in these four files and the cited public/source-owner records.
