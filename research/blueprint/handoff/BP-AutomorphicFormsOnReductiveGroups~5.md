# Automorphic forms on reductive groups — revision 5

Job `BP-AutomorphicFormsOnReductiveGroups~5`, issue #10124. Agent: Codex; session `codex-zR6rNt`, 17 October 2026. Completed target-level revision, not a checkpoint or an implementation claim. This session claimed only this job.

## Outcome and actual revision scope

The issue was generated with instructions saying that review 4 had not accepted the plan. The report and packet on the supplied main instead record its completed **accepted** verdict. This revision preserves that independent verdict, its full per-node ledger, all review history and all five direct corrections. It does not review or accept itself. The reader distinguishes the fourth revision's acceptance from this fifth revision's changes, which await independent review.

All 100 node IDs and their main statements, hypotheses, proofs, dependencies, APIs and intended BHR declarations are retained. Counts are 26 definitions, 25 constructions, 49 theorems, 311 API items, **214 specified Checks**, 30 planets, 57 baseline declarations, 36 sources, 43 requests and 23 gaps. The packet is `complete`. AF.0, AF.1, AF.1a, AF.2, AF.3, AF.4 and AF.5 are each `planned`; none is `closed`. Every implementation status remains `unchecked`.

One additional error was found in AF.5's existing `centralAMF_incompatible` Check and acceptance condition. Unequal scalar actions force a one-dimensional value to vanish over a **field**. Over a general coefficient ring, the scalar-cancellation argument needs the scalar difference to act injectively. For example, in ℤ/8ℤ the distinct units 1 and −1 agree on the nonzero value 4. A constant function with value 4 obeys the raw transformation equations for a central involution acting by −1 and trivial ψ; those data still fail the construction's separately required overlap compatibility.

The packet and reader now state the field hypothesis and the injective-difference generalization. A fourth Check, `centralAMF_ring_scalar_mismatch`, distinguishes ring coefficients from field coefficients. Suggested includes the field-cancellation implication and the ℤ/8ℤ computation as proved examples, without adding an admitted carrier or a new theory construction. This is a correction of this plan's own Check, not a new published-source erratum. No source issue, request, gap, baseline entry or ownership assignment was added or removed.

## Reviewer corrections checked and preserved

| Review-4 correction | Verification in this revision |
|---|---|
| Finite level under right translation | The packet API and reader use `y_f J y_f⁻¹` for `R(y)f(g)=f(gy)`. Suggested's noncommuting S₃ calculation proves the direction and rejects the inverse conjugation. |
| GL₂ coefficient dimension | Both the acceptance condition and `algWeight_gl2_dim` require `k≥2` before identifying the coefficient with `Sym^{k−2}` and its dimension with `k−1`. |
| BHR local quantifier | The hypotheses and intended declaration fix central parameter c before choosing R. The arithmetic statement separately chooses one bound before all weights, actual discrete occurrences and degrees. |
| Ordinary algebraic modular stabilizers | The proof explicitly uses the compact-mod-A∞ and discrete-rational-centre hypotheses as well as arithmetic discreteness. Compactness modulo the real centre alone is not substituted for them. |
| Central-character class sets | The class set is a quotient of AA's ordinary finite class set; effective-stabilizer finiteness and coefficient descent remain separate requested arithmetic inputs. |

The earlier review-3 blocker is already resolved by the retained three-part BHR statement. It distinguishes arithmetic root-wall essential temperedness for actual discrete automorphic occurrences, Pilloni's local two-limit theorem at large negative parameter, and the arbitrary-irreducible H⁰ implication with the essentially-tempered three-case all-degree classification. The full positive-similitude Hodge component, central tensor balance, `l≥2` boundary and geometric comparison restrictions remain explicit. Numerical coroot predicates are not counted as any of those representation-theoretic conclusions.

## Inherited red-team obligations

All six obligations listed in the issue were checked against the retained target/dependency contracts. Their mathematical resolutions remain those of the accepted preceding revision:

| Finding | Retained resolution |
|---|---|
| RT-AREA-automorphic-1/2 | AF.1 has the real Weil group, real/complex GL_n correspondence, Langlands classification, discrete/limit series and globalization targets. AL owns factor bridges, and the proposed AF.1b split remains an integration proposal with stable node IDs. |
| /25 | AF.4 specifies Wigner's contragredient obstruction, ℓ₀/q₀ and the tempered degree range, and Vogan–Zuckerman with its Hermitian hypotheses. Shared ALS foundations are imports. |
| /26 | The spherical-dimension node imports/requests SR.4 commutativity and proves the bound ≤1, including zero; Flath consumes it. Almost-everywhere hyperspecial existence retains its stronger global-spreading-out requirement. |
| /29 | AF.1a retains the sole AF compatible-pair/cochain interface and AF.1 consumes it. ALS.F.5 supplies the overlapping foundation; AF retains convention/action compatibility rather than constructing it again. |
| /30 | ALS.1/ALS.3 integral Betti and Hecke inputs and ALS.5/AS.5 comparison inputs are explicit. Local coefficient targets and downstream rationality/eigenclass applications remain distinguished by the recorded prefix splits. |
| /31 | AF.5 supplies the general algebraic-modular-form interface, with R18.3 its quaternionic specialization. Rational versus p-adic coefficients, full versus effective stabilizers and central quotients retain separate contracts. This revision additionally corrects the coefficient-ring non-example. |

No atlas, queue, paper route, other packet or supplier document was edited. No notion moves to a new owner in this round. Historical restructuring directions are retained, but current `supplierContract` and `upstreamContracts` records take precedence. Packaging must reconcile old registry routes and implement the recorded prefix/application splits before certifying an acyclic combined stage graph. The internal 100-node graph is acyclic; it does not establish that external certification.

## Existing libraries, suppliers and source provenance

The reviewed library audit was read for all seven AF stages. Existing baseline claims are retained from review 4's recorded inspection of all 57 declarations; this run does not claim to have independently repeated that entire source audit. Suggested was freshly elaborated in the shared build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, with the packet's Tau Ceti baseline `f790474821cf4256814db967cb154e7af3d0c369`.

The supplied read-only roadmap checkout records main `0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti records `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, unchanged from the preceding review. The existing local supplier views were inspected without modifying them; they include pre-existing working-tree changes and are not represented here as pristine Git snapshots. CompactGroups and LieGroups supplied the upstream document models. No new adelic, spectral, smooth-representation, differential-form, highest-weight or lattice theory is planned by this revision.

Live upstream PR metadata was checked on 17 October:

- ReductiveGroupsPartII #785: open, head `f24efef61443870dd47b64fd4de9828b0a685501`.
- AdelicAlgebraicGroups #792: open, head `241d5d6a9b30d24354b5867ceb0a9146cb0418b9`.
- SmoothRepresentationsOfLocalGroups #793: merged on 14 October, head `74400cd9c0a533f704148df1193bff16a1f2b021`.
- ArithmeticLocallySymmetricSpaces #871: open, head `e7e16145f2be8db4cddbda88b2ccab63f1bb52fd`.
- AutomorphicSpectralTheory #925: open, head `64380dd10f4e9f85e4b0253a6cf1aad53b336cf2`.

The ALS and AS heads match the packet's exact checked contracts. AA/RG local foundations and SR's finite-place scope remain imported. Acceptance or a familiar section name is not taken to discharge a stronger unanswered supplier request.

Fresh mathematical reading in this run:

- BCGP21, arXiv:1812.09269v3, §3.10, Theorem 3.10.1 pp.70–71, Hodge pair p.72 and proof p.73: arithmetic occurrence, regularity, essential temperedness, the three class/degree cases and the unrestricted H⁰ implication. Download SHA-256 matches `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed`.
- Pilloni, maintainer-cleared author PDF, p.108, Theorem 15.2.2.1 and the following specialization: local coefficients, negative-parameter sign and central normalization. Read in place, with no source file, passage or extraction retained anywhere.
- BCGP25, arXiv:2502.20645v1, §5.7, pp.130–133, especially Definition 5.7.2: coefficient covariance, small levels, Hecke conventions and the stated compact-unitary automorphic comparison. SHA-256 matches `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`.

These are the editions actually read, not a new collation against every published version. The coefficient-ring counterexample is a direct algebra calculation. The prior source/proof limits remain: in particular the original BHR, Harish-Chandra, general classification/globalization, Vogan, Clozel and relative-resolution proofs were not freshly audited. The 23 gap records specify the remaining work; no gap is removed merely because the target statement is complete or Lean elaborates. No source passage or section-by-section source summary was deposited.

## Validation and next step

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicFormsOnReductiveGroups.json`: **0 errors, 0 warnings**.
- Preservation check: all 100 node IDs, main statements, hypotheses, proof routes, dependencies, APIs, intended declarations, baseline, source records, gaps, requests, coverage, source findings, review/history and ownership records retained. Only the central-character node's acceptance and tests change, plus the packet summary.
- Reader correspondence: all 100 statements, all hypotheses/acceptance clauses, 311 API statements, 214 Checks and intended BHR contracts occur in the reader. The two imported supplier proof steps are represented by their exact supplier-contract paragraphs rather than repeated numbered steps.
- Internal dependency traversal: 100 nodes, 225 internal edges, no cycle. Every definition/construction has at least three specified Checks; planets remain at most six per stage.
- `lean-check research/blueprint/suggested/AutomorphicFormsOnReductiveGroups.lean`: **exit 0**, 375 lines, 30 warnings, all exactly `declaration uses sorry`. Both added coefficient examples and the inherited S₃ example are proved. Available memory exceeded 20 GiB. No language server, new Lake project, build/update/cache command or background compile was left running.
- Submission file validation and `git diff --check` pass for the four authorized deliverables.

Next: independent revision review of the additional scalar-field hypothesis and ring Check, retaining the preceding review's accepted mathematics. Then follow the programme's packaging/refinement route with the 43 requests, 23 explicit gaps and prefix-integration obligations intact. Nothing depends on a scratch artifact or another claim by this worker.
