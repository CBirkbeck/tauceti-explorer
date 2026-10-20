# BP-OverconvergentAutomorphicForms — complete planning pass

Worker: Codex — codex-A4O1yY, 2026-10-20. Issue: [#10836](https://github.com/CBirkbeck/tauceti-explorer/issues/10836). Branch: `codex-A4O1yY-overconvergent-automorphic-forms`. The claim bot confirmed this session's claim before work began. This run takes no second job.

The root [packet](../packets/OverconvergentAutomorphicForms.json), [reader](../readmes/OverconvergentAutomorphicForms.md) and [suggested file](../suggested/OverconvergentAutomorphicForms.lean) form the complete O0–O8 planning deliverable. All nine stages are **planned**, with explicit mathematical gaps; none is declared closed or implemented. Every implementation status is unchecked. Independent review is the next programme step.

## Assembly and retained identities

The retained O0 packet contains 74 targets across O0–O7; the retained O8 packet contains 18. Their global IDs cannot be redeclared in the root: the repository checker rejects duplicate blueprint IDs. Following the same import approach as the AInfCohomology and EnhancedDerivedSheaves assemblies, the root records both part paths, SHA-256 hashes and complete ID sets in `importedPackets`. Its `importedTargets` contains the **full effective contracts** for those 92 IDs, keyed by `nodeId`. These are explicit assembly refinements of the imports, not 92 new declarations. `nodes` holds four new IDs:

- `O0/siegel-analytic-coefficients`: normalized analytic induction, the actual Gauss lattice and its supported action domain.
- `O0/analytic-induction-conventions`: the BP/Siegel character, Weyl, radius and action adapter.
- `O4/effective-arithmetic-descent`: the completed effective deck group and all congruence-unit central cancellations.
- `O8/siegel-factor-neighbourhood`: the stronger matrix-factor estimate that makes the intended analytic action well-defined.

The catalogue includes exact current supplier nodes in place of broad requests wherever they suffice. `assemblyRefinement` marks substantive changes, and `assembly.libraryLayout` reconciles the planned modules. Stable declaration names are retained. The reader reproduces every effective statement, hypothesis, proof step, API item, definition test, Check and source locator, with a worked check in each layer.

O0's historical review is `needs_changes` (9 October), principally demanding the old exhaustive typed prototype. The binding 12 October shape in WORKERS supersedes that requirement. Its mathematical supplier gaps remain explicit. O8's historical part review is accepted (6 October). **Neither verdict accepts this root, its changed dependencies, or its new corrections.** The 22 unchanged source findings retain their historical independent review records; the new E-O8-17 has no review verdict.

## Mathematical changes

The Siegel coefficient problem is a concrete analytic domain mismatch. DRW Definition 3.1.10 uses normalized lower coordinates `u_ij/p`, while its group thickenings are entrywise. An r-analytic function in the normalized variable extends to entry radius p^−(r+1). Remark 3.1.12/Definition 3.1.13 assert the larger radius p^−r. For g=2, trivial weight, integer r≥3 and v_p(a)=r−1/2, the function 1/(t−a) is r-analytic at all Z_p centers, but the claimed larger ball contains its pole. The element h=I+p a E12 lies in M_r; its transpose sends the identity to normalized coordinate a, making the claimed translate undefined. This is recorded as **E-O8-17**, confined to the hashed arXiv v3 and awaiting independent review.

The actual geometric factor repairs the application: for strict-Iwahori γ=[A,B;C,D], C is divisible by p. If Z=Z₀+E with ‖E‖≤p^−w, then J₀=A+Z₀C lies in the strict GL_g Iwahori and ‖J−J₀‖≤p^−(w+1). Thus J acts on the full intended normalized w-analytic module. The reader does not weaken that coefficient module. Its integral lattice is the Gauss unit ball, retaining the independently reviewed correction to pointwise integrality and the fixed-weight algebra claim.

The convention adapter uses λ_BP=w₀,M(κ_D⁻¹), entry radius n=r+1, and τ(h)=h^−T. Identity on functions identifies the right Borel rules and norms; ρ_D(h)=ρ_BP(τ(h)). This concerns open Iwahori induction and retains BP's general closed-subgroup and distribution-dual conventions. It is not an AIP-intertwiner comparison or a classicality theorem.

Arithmetic descent now uses U_N of **all** units congruent to one modulo N and its closure Z∞. Norm congruence and N≥4 give norm one without a positivity hypothesis. This kills the actual central embeddings (zI,z²) and zI for κ=w²(t∘N)⁻¹. The hybrid deck group is the completed quotient `(Γ₀×Δ(p∞N))/Z∞`; the positive-unit quotient used in BHW is a dense subgroup. Separated continuous equivariance extends from it to the whole group. The raw pairing is confined to the hybrid tower. Polarization transport uses global positive p-units, not arbitrary local units. The explicit unit −7−4√3 at N=4 tests a representative change omitted by a positivity-only kernel.

The supplier audit removes obsolete requests for generic analytic vectors, full noncompact torus character spaces and coherent Jacquet modules: LR.2/LR.6 already own them. Ding's general-n single-place coefficient model still exceeds CC.8's GL3/all-p-variable application. The remaining Jacquet Hecke geometry belongs to an extension of LocallyAnalyticRepresentationsOfLocalGroups, not a second PadicFamilies Part II. Existing T6 comparison and finite-Levi-torsor nodes also remove an obsolete full-group logarithmic comparison request. Exact C6, H4/S5, B2/B4, R0/R3/R5 and LAD interfaces are cited with their restrictions.

## Remaining mathematical obligations and requests

These are recorded gaps, not hidden hypotheses presented as established results. The packet has 11 gap records and 11 requests, because several requests combine related inputs or address different contracts at the same owner.

| Gap | Supplier and precise next result |
|---|---|
| Universal compact-torus weight spaces | PMIA L0a: the representing functor and universal weights absent as exact nodes in its current packet. |
| General-n unitary completion and eigenvariety geometry | CC.8: Ding's one varying p-place, fixed other-place lattice, admissible nonzero local regular model; LR.6: the Hecke spectral construction, dimension/depth and classical-density/reducedness proof leaves. Generic Jacquet theory is already supplied. |
| All-open geometric coefficient descent | P9: finish its inherited general-base/all-open extension, site-specific coefficient sheaves, genuine geometric O+ invariants on the analytic AIP torsor, and valued-point lifting/reflection of bounds. Completed lattice tensors do not supply geometric O+. |
| Hilbert equality endpoints | T4: supply equality at ε=1/(c_p p^m), rather than importing a strict-endpoint argument. |
| Positive-radius full-character integral freeness | T5/P9: base-local unit eigenfunctions and integral-unit transition ratios for the normalized finite-Igusa factor, including p-primary characters. Universal formal freeness and rational/ordinary invertibility alone do not imply this. |
| Ordinary integral models and completion | T5: actual flat formally smooth ordinary charts and finite étale covers after permitted coefficient extension; P9: finite-level R_i=A_i°, isometric maps and the separated spectral completion of the analytic tower. No reduced O_Cp/p or automatic perfectoidness is assumed. |
| Cuspidal formal cohomology | Extend existing ShimuraCompactifications Part II/C6: AIP's structural R^qρ_*O(−D)=0 with formal-functions/base-change adapters. Retain or extend the reviewed ordinary model's extra tame-level restrictions. O6 then applies it to the analytic coefficient and (Pr) argument. |
| p-level family expansions | B5: the precise p-level and analytic-family expansion interface, beyond its classical prime-to-p theorem. |
| Siegel canonical-domain comparison | T3: the quantitative genus-specific canonical/anticanonical comparison, with p>2g and all Hasse/radius hypotheses. General Bruhat reductions do not prove it. |
| Toroidal log-to-v comparison | S6: its inherited density/openness obligation for the exact period-map and coefficient-domain nodes. The T6 Tate-twisted Levi comparison is already supplied. |
| DRW version of record | Collate all seventeen DRW findings with the journal full text when it is accessible. No claim about their persistence there or novelty in the literature is made. |

O5 compares independently defined integral **equalizers**, without assuming the unresolved local freeness of the full finite-character lattice. O7 proves its unit-ball completion argument conditional on the actual integral-model and tower contracts; Heuer's natural map alone does not supply them. The ordered-limit worked example distinguishes continuous functions on Z_p from locally constant functions. O6 distinguishes boundary ideal pushforward from higher cohomology vanishing, (Pr) from finite projectivity, and a rational normalized Hecke operator from an integral renormalization.

## Sources and current upstream

Eight distinct source PDFs were read in the target passages, with hashes and exact scopes in the packet and reader: BHW's published paper and arXiv v4; both AIP author copies; BP's 180-page author manuscript; Ding's published §4.2.2; Heuer's published Corollary 1.4/Proposition 3.8; and DRW arXiv v3. The two inherited BP identifiers were unified because their hashes agree. All source results are stated in our own words, with theorem/section/page locators; no excerpts remain.

The arXiv landing page checked on 20 October still lists DRW v3 (9 April 2026) as the latest revision and links DOI 10.1007/s40687-026-00610-5. Publisher PDF requests returned a challenge page, not a PDF. The cited BHS and related proof leaves for Ding's geometry have not been independently audited here and are explicitly part of the LR.6 request. The full logarithmic Riemann–Hilbert proof is imported from T6. No restricted book was needed or copied. No suspicious external instruction was encountered.

The read-only current roadmap/library commits are recorded in `upstreamNotes`: TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nearby readers, relevant AlgebraicVectorBundles contracts, nine post-snapshot roadmap declaration inventories and all four Completed roadmap inventories were checked. Actual baseline declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No upstream file or build was changed.

## Validation and counts

- `python3 scripts/check_blueprint.py research/blueprint/packets/OverconvergentAutomorphicForms.json`: 0 errors, 0 warnings. Its summary counts the **four new nodes**, not the 92 imported contracts.
- Expanded validation with the unchanged checker: **96 effective targets**, 0 errors, 0 warnings, including full internal DAG and prerequisite resolution. To reproduce, replace `nodes` in a temporary view with importedTargets (renaming nodeId to id) followed by nodes; remove importedTargets from that view; in the checker's external ownership map identify only these 96 IDs with that temporary filename; keep all other context and the baseline index unchanged. Call the same `check` function on the view. This checks the assembled graph without redeclaring retained global IDs in the repository.
- Import SHA-256/ID-set checks, unique API/test names, all coverage counts, ≤6 planets per layer, no excerpts and unchecked implementation statuses passed.
- Reader synchronization checked every effective statement, hypothesis, proof step, API/test statement, acceptance Check and source locator. All 879 Markdown destinations were checked for local file/anchor resolution where applicable; this is not a claim that every remote URL was fetched.
- `lean-check research/blueprint/suggested/OverconvergentAutomorphicForms.lean`: **compiled**, exit 0, at the pinned shared build after the memory check. **240 lines**, one `import Mathlib`, 16 admitted-theorem warnings, no errors or other warnings; all six examples have proofs.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/OverconvergentAutomorphicForms.lean`: passed. No admitted data definitions or geometric placeholder structures remain.
- Deliverable-path/private-path intake check and `git diff --check`: passed.

| Quantity | Count |
|---|---:|
| Effective targets | 96 = 92 imports + 4 new |
| Definitions / constructions / lemmas | 5 / 32 / 13 |
| Theorems / comparisons / applications | 30 / 13 / 3 |
| API items | 139 total; 138 in definition/construction outlines |
| Definition/construction tests | 117 |
| Planets / baseline declarations | 38 / 65 |
| Source findings / gaps / requests | 23 / 11 / 11 |
| O0, O1, O2, O3, O4, O5, O6, O7, O8 | all planned |

The next worker should independently review the complete root assembly, particularly E-O8-17, the normalized coefficient/BP adapter, the strengthened factor estimate, the completed arithmetic quotient, and the narrowed supplier contracts. A follow-up then supplies the exact mathematical obligations above. The exhaustive old typed-prototype requirement must not be reintroduced. No second issue was claimed.
