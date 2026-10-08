# Round 2 handoff: Moret–Bailly, residual modularity and global finiteness

Job: BP-PotentialModularityAndCompatibleSystems--R23.1~2; issue #6999. Agent: Codex, session codex-BiJOuf. Date: 2026-10-08. This is a completed revision for independent review, not a checkpoint.

The [packet](../packets/PotentialModularityAndCompatibleSystems--R23.1.json) remains `complete` at target level. All 49 reviewed node IDs and the previous top-level `review` object are preserved. The previous negative verdict is historical and awaits replacement by the independent reviewer. All implementations remain `unchecked`. Nothing is claimed source-decomposed, closed or formalised.

## What changed

The [reader](../readmes/PotentialModularityAndCompatibleSystems--R23.1.md) now carries the corrected full specifications, source roles, proof routes, imports, acceptance tests, 36 API items and 22 unit tests from the packet, organized by stage. Its supplier, gap and coverage ledgers are synchronized, including the fine Hida input and all seven gaps added by the review. The expanded ledger replaces stale prose rather than adding a second competing specification.

The concrete review corrections are accounted for as follows:

| Review requirement | Revision |
|---|---|
| Moret–Bailly scalar extension | The theorem and field-point criterion use K′⊗_K L_v, with all embeddings into L_v. K′=K with nontrivial L_v remains the test distinguishing this from prescribed completions. |
| Taylor auxiliary norm and branches | β_vβ_v^c=q_v=l^{f_v}; λ₀ selects the root reducing to 1. Residual Frobenius values are compared separately in the χ_v²≠1 and Teichmüller branches. The latter needs p∤q_v−1. |
| Alpha, coefficient fields and local distinction | Choose the wp₀-unit conjugate of norm-p alpha. Its algebraic norm is not a p-adic cyclotomic Frobenius value. N and M are coefficient number fields over Q. Distinction is on the full decomposition group. |
| Ordinary inverse and weight misprints | Lemma 1.5 uses ω⁻¹, hence the excluded n=1 case. Weight i+2 uses Symm^i in Lemma 5.1. Unsupported claims of Lean-checked polynomial/weight/exponent arguments are removed from current explanatory prose. |
| Auxiliary choices versus Lemma 1.1 | Lemma 1.1 constructs the character only after the independent prime/quadratic/coefficient-field choices. The simultaneous choice remains its exact gap, separate from the Frobenius-prime node. |
| Supplier scopes | Odd auxiliary lifting is R22.5, separate from R22.6 dyadic lifting. H6 consumers, KW Annals moduli/base-change/Hida needs, character extension, torsion Fontaine–Laffaille, full Hilbert crystallinity and Picard requests match the packet. |
| Weil restriction | Reuse the three fine A6 nodes. Smoothness/connectedness and local analytic products need adapters; for general smooth varieties choose a dense affine open meeting the prescribed local opens. Abelian-scheme restriction is not the variety adapter. |
| Stronger variants | Bianchi’s exact-completion/finite-quotient input keeps its CM/Q-Galois scope; corrected BCGP requires a separate general number-field specialization contract. BHKT’s Isom scheme is finite étale over Y_K; BCGP outputs L′/K′ without descent L/K. |
| Newton–Thorne | Retain p≥5, the specified large residual image, determinant and selected components; the lift has determinant ε⁻²ω and Hodge–Tate weights {0,2}. Dimension and finiteness precede point extraction and automorphy. |
| Suggested interfaces | Keep safe objectwise/arithmetic fragments. Replace 32 unsafe or vacuous schemas with named omissions and their missing supplier contracts. The two point-extraction sketches instead retain the DVR, characteristic-zero fraction field, finite local algebra, local structure-map and positive-dimension hypotheses. |

The packet also replaces a dangling Picard proof transcription with an own-word vector-bundle torsor argument and replaces E2’s quotation with an own-word correction. Its current E4 explanation no longer claims an unverified Lean check; a note separates this from the retained historical erratum verdict. All editable source records were checked for `excerpt` fields: none remain. Source statements and proof descriptions are in our own words, with theorem/section/page locators. Mathematical formulas are retained where necessary to identify a correction.

## Checks and compilation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PotentialModularityAndCompatibleSystems--R23.1.json`: zero errors and warnings.
- `scripts/check_errata.py` on a scratch `errata-v1` projection of the nine source issues and recorded source versions: passed.
- All 19 public PDF SHA-256 values matched. All nine cited declarations were re-read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The relevant H6/SF.3 audit rows, fine supplier statements and matching incoming link maps were checked. No other owner was re-planned or edited.
- Inventory checks preserve all IDs and the top-level review, find every node statement/API/test in the reader and every API/test name in the suggested file, confirm eight planned stages and no implemented declarations, and check absence of source excerpts and private absolute paths. Submission-file validation and `git diff --check` passed.
- Full `lean-check` was attempted with 108 GB available. It stops at the first import because the shared build lacks `TauCeti.AlgebraicGeometry.LineBundle.Class.olean`. **The complete suggested file did not compile.** Shared Mathlib HEAD is exactly pinned; shared Tau Ceti HEAD is cf386627e9176a3827c1a5fe804989fd94a4d216, rather than the recorded baseline. No build, cache fetch, Lake project or language server was started.
- A 243-line Mathlib-only fragment elaborated with exit 0 and only 22 placeholder-proof warnings. It contains the exact `FiniteExtension`/`SplitOver` blocks, the `GL2`/`GaloisGroup` and Taylor auxiliary-character block with its six examples, the coprime constant-degree example, and the complete `CompatibleSystems` block with the auxiliary-field APIs/four examples, both corrected algebraic extraction signatures and the finite-ring non-example. It uses the suggested file’s non-geometric individual Mathlib imports and the same universes/namespaces. This certifies those fragment signatures only, not their proofs, the omitted supplier conditions or the geometric fragment. The fragment can be reconstructed from those blocks; scratch is not needed to resume.

## What remains

The pass has 1 definition, 3 constructions, 14 lemmas, 26 theorems and 5 applications; 36 API items, 22 test specifications, 17 planets and 9 baseline declarations. All 8 stages remain `planned`: R23.1, R23.2, R23.3, R23.4, R23.5, R23.6, R24.1 and R24.2. No second job was claimed.

All 33 exact supplier contracts remain open in the packet and reader; this revision did not send requests to other workers or change supplier packets. The 22 remaining gaps are:

1. Imported foundations of Moret–Bailly’s proof: relative geometry, representability, duality and approximation suppliers.
2. Unread Khare p=3 and Conrad–Diamond–Taylor local weight inputs used in Taylor §5.
3. KW II 8.2 and Gross/Coleman–Voloch weight inputs to 6.1.
4. Locate the published Khare Lemma 4.2 or derive finite universal residual inertia from the exact local definitions.
5. KW II 9.2–9.3/8.2 over the auxiliary field, with the exact lifting and R=T contracts.
6. Resolve the CM-induced case excluded by the existing Skinner–Wiles E11 interface.
7. Supply the unproved Taylor 2002 1.3/1.7 local geometry contracts through H6.
8. Verify the Skinner–Wiles 2001 base-change/level-adjustment input to Taylor 2006 5.5.
9. Local points outside finitely many places and arithmetic function-field Chebotarev.
10. Projective-module strong approximation and the compact S-unit quotient.
11. Exact local-completion refinement, scheme-cover Chebotarev and Jordan.
12. Obtain and verify the Moret–Bailly 1990 inverse-Galois theorem, without strengthening its scope.
13. Snowden auxiliary representation and independent residual soluble-descent/global-lift inputs.
14. Thorne ordinary finiteness specialization: polarized CM/totally-real GL2 and adequacy/local-ring adapters, including the CG application.
15. Integral characteristic-zero point to local continuous p-adic lift, residue and framing adapters.
16. Taylor Lemma 1.1 algebraic character and S-unit congruence input.
17. Exact odd auxiliary modularity lifting with Snowden’s type data.
18. Torsion Fontaine–Laffaille and full Hilbert crystallinity, separately from rational/parity-limited inputs.
19. Variety Weil-restriction property and analytic-open adapters.
20. Local analytic density in the shrinking and divisor constructions.
21. Full geometric/relative/automorphic object interfaces, associated functor laws and full unit tests; named omissions in the suggested file must be filled from these contracts.
22. Simultaneous Taylor auxiliary-prime, quadratic and coefficient-field choices, including the unit-conjugate and branch exclusions.

The packet gives each gap’s full detail and exact consumer IDs; the reader reproduces them. Follow-up work must resolve these contracts in their owners, refine their source/proof closure, restore full typed signatures as interfaces become available, and elaborate the complete file in a suitable pinned build. R23.6 remains an export panel with the retained proposal to fold it into the introduction at assembly. Compatible-system operations/purity and Qian’s auxiliary lifting lemma remain outside this part.

## Reading and source limits

Fresh reading is recorded per source under `readSections`, attributed to this session. The revision re-read the cited correction passages in MB I/II; Taylor 2002/2006; both KW sources; Qian; CHT; BLGHT; Bianchi; published BCGP; published BHKT and its correction; Snowden; Calegari; Thorne; CG; and Newton–Thorne. Critical MB splitting, Taylor branch/root and weight-coefficient displays were inspected on page images. This is passage verification, not a claim to have read every paper or its full citation tree. The older BHKT preprint’s inherited provenance is preserved; its hash was checked, and the corrected published statements were used.

No uncleared source was used and no book file or passage was copied. The unread/missing source imports remain precisely the packet’s gap ledger; their truth was not inferred from a downstream citation. Huber 1996 and Faltings–Chai were not used. Scratch sources and temporary checks are removed after opening the pull request; all information needed for review and resumption is in these four deliverables.
