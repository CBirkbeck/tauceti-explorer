# Independent review of PadicFamiliesPartII

Accepted after corrections, as a complete target-level planning pass. All nine stages remain **planned**, none closed. The 14 gaps and 21 requests are precise outstanding obligations; acceptance does not establish their conclusions or any Lean implementation.

Review: `REV-DESIGN-PadicFamiliesPartII`, issue #3585, 2026-10-19. Reviewer: Codex, session `codex-n0nwuL`. The design identifies its author as the distinct session `codex-V5T3vy`. The [packet review](../packets/PadicFamiliesPartII.json) contains a verdict and individual reason for every node and source finding. The [reader](../readmes/PadicFamiliesPartII.md) and [roadmap](../roadmaps/PadicFamiliesPartII.json) were corrected together.

## Counts and scope

| Item | Result |
| --- | ---: |
| Nodes checked | 62 |
| Verified without node changes | 33 |
| Corrected in place | 29 |
| Added, removed or unverifiable nodes | 0 |
| Definitions / constructions | 6 / 11 |
| Theorems / comparisons / applications | 39 / 5 / 1 |
| API specifications / definition tests | 67 / 51 |
| Planets | 41; no layer exceeds six |
| Baseline declarations confirmed | 4 |
| Baseline declarations removed or replaced | 0 |
| Inherited source findings confirmed | 15 |
| New source findings | 1, E16 |
| Planned / closed stages | 9 / 0 |
| Open gaps / supplier requests | 14 / 21 |

Every target of P0, P1, K2, H3, D4, C5, E6, S7 and F8 has a node or an exact imported owner. Target-level granularity is appropriate: the non-routine arguments are in proof plans and explicit supplier contracts, rather than disguised as routine algebra. All implementation statuses remain unchecked. The node prerequisite graph reachable through available packet nodes is acyclic; stage requests remain leaves with stated contracts and gaps. The local stage ordering is acyclic too.

## Corrections

The following table accounts for all 29 changed nodes. Shared hypothesis corrections count as node changes even when the main statement was already right.

| Nodes | Correction and source |
| --- | --- |
| `P1/path-decomposition` | Restored the trailing arbitrary powers in the first-good-step expansion, distinguished correspondence composition from contravariant section operators, and added the four-word check at length two. BPS Theorem 4.4.1 begins on journal p. 1000; Lemma 4.4.3 is on p. 1003. |
| `K2/rank-zero` | Replaced nonexistent intermediate lemma numbers by P20 Proposition 7.4.2.2 and Lemma 7.4.2.6, author pp. 49–50. |
| `K2/spherical-amplitude` | Restricted local finiteness and amplitude [0,1] to the spherical rank-at-least-one special fiber over F_p. Global restriction is a quasi-isomorphism for r≥3; r=2 supplies only H⁰-isomorphism and H¹-injectivity. Added the missing `ShimuraCompactifications:C5` input and its exact cover/acyclicity request. P20 Lemma 8.2.1, pp. 52–53, and Proposition 8.2.1, pp. 53–54. |
| `K2/torsion-continuation` | Added a check distinguishing the continuation polynomial from its inverse and exposing the source misprint E16. The existing corrected polynomial inverse was retained. P20 Corollary 14.6.2, p. 99. |
| `H3/mixed-locus` | The chosen multiplicative-flag locus is open; a clopen component of the full rank-locus inverse image is not asserted. BCGP21 §4.1, pp. 73–74, and §4.3.4, pp. 96–97. |
| `H3/fixed-amplitude` | Restricted the numerical [0,|I|] amplitude to the spherical special-fiber mixed-rank open. Kept global restriction endpoints and the stronger l_v≥3 condition separate. The generalized supported strata retain their own perfectness/comparison statements, without an extra uniform numerical amplitude. BCGP21 Theorems 4.2.1 and 4.2.12, pp. 77–82. |
| `H3/family-complex` | The F=Q compatibility test now base changes the full Klingen torus algebra to the trivial finite-character component used by Λ_I before comparison. This does not identify the full algebra with its component. BCGP21 §4.6, pp. 105–108. |
| `D4/partial-frobenius` | Specified the interior special fiber and its rank-one divisor for the p³/p² degrees, retaining the polarization and tame marking transport. Corrected the API domain and locator. BCGP21 Definition 5.6.2 and Proposition 5.6.3, p. 126. |
| `D4/kodaira-spencer` | Separated prime-to-p isogeny compatibility from construction of the normalized integral p-correspondence trace and its subsequent reduction. Retained Norm(x_w)³/p³ and refined the bundle supplier request. BCGP21 Propositions 5.5.1–5.5.3, pp. 123–124, Proposition 5.6.1, p. 125, and Propositions 5.6.4–5.6.7, pp. 127–128. |
| `D4/second-operator` | Put the p⁴ finite-flat assertion on the interior formal locus and the F_w² identification on its special-fiber divisor; no boundary extension is inferred. Corrected the §5.7 locators, pp. 129–132. |
| `D4/no-global-eigenvector` | Made regularity on the whole mixed-rank open explicit and corrected the §5.4 locators, pp. 122–123; the main vanishing theorem remains Theorem 5.8.4, p. 134. |
| `C5/analytic-complex`, `compact-action`, `hilbert-bgg`, `multi-continuation`, `euler-family`, `one-place-comparison` | Corrected BCGP21 page ranges: analytic construction §§6.1/6.3, pp. 138–145 and 147–152; BGG §6.4, pp. 153–154; continuation through Lemma 6.5.28, p. 164; Theorem 6.3.16, pp. 152–153; §6.6 comparisons, pp. 164–167. The existing repaired BGG direction, rational comparison map and Euler sign were verified. |
| All six E6 nodes | Specified the actual domain O(𝔤,𝔟)_{λ-alg}, whose weights differ from λ by algebraic characters. Its canonical completion and continuous dual supply the analytic realization. Updated the first four statements/proofs accordingly; no theorem for arbitrary topological coefficients is asserted. Replaced a vague functor test by the contravariant distinguished triangle of a short exact coefficient sequence. Corrected Theorem 4.7.2 to pp. 99–100. BCGP25 Definition 3.4.5 and Proposition 3.4.3, p. 53, and §4.7, pp. 99–100. |
| All six S7 nodes | Carried the corrected BGG coefficient hypothesis into S7. Recast `multiplicity-balance` as balanced eigenpacket exactness and carried that independent assumption into de Rham classicality. Lemma 4.12.3 gives total tensor multiplicity; Theorem 4.12.4(3) assumes four equal graded dimensions separately. Remark 4.12.5 gives a conditional multiplicity-one verification. Also corrected the citation to **Proposition** 4.11.2. BCGP25 pp. 109–114. |

The roadmap descriptions of K2, H3, D4, E6 and S7 now express these scopes. Requests to `ShimuraCompactifications:C5`, `AutomorphicBundles:B2`, `AutomorphicSpectralTheory:AS.5` and the LieHighestWeight continuation were refined, without increasing their count. The corresponding localization and eigenpacket gaps, restructuring proposal and ownership notes were synchronized. The reader contains all corrected statements, hypotheses, proof steps, acceptance checks, API/test specifications, locators and request contracts.

## Baseline and ownership

All four declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, the recorded Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` baseline. No citation needed removal.

| Declaration | Checked statement and use |
| --- | --- |
| `LinearMap.prod`, `Mathlib/LinearAlgebra/Prod.lean` | Same-domain linear maps produce the product map under semiring/module assumptions. It supplies the two companion coordinates. |
| `LinearMap.coprod`, same module | Maps from the two summands to a common module combine as f∘fst+g∘snd. This supplies Tx+Uy. |
| `LinearMap.eventually_isCompl_ker_pow_range_pow`, `Mathlib/RingTheory/Artinian/Module.lean` | Both Artinian and Noetherian module hypotheses are required. It is a finite-length Fitting input, not the analytic derived ordinary projector. |
| `Module.Projective`, `Mathlib/Algebra/Module/Projective.lean` | Projectivity is expressed by splitting the canonical free-module surjection. It contributes no analytic finiteness or Iwasawa control theorem. |

The reviewed library audit was checked against these claims. Current read-only Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` was searched for the new carriers. AdicSpaces and AlgebraicVectorBundles were read in full; relevant current IntegralHeckeAndGaloisDeterminants, SmoothRepresentationsOfLocalGroups and LieHighestWeight sections were read. Suggested files in the nine newer roadmap families were searched, including OperatorTheory's nested roadmaps. No matching implementation or separately owned new target was found in those scoped searches.

Generic telescopes, finite-complex ordinary splitting and ghost bounds stay with IntegralHeckeAndGaloisDeterminants. The imported HigherHida D1 statement additionally requires the analytic/solid extension. Positive Klingen Hecke algebra stays with SmoothRepresentationsOfLocalGroups. Algebraic vector bundles stay with AlgebraicVectorBundles. Corrected the description of LieHighestWeight: its Lie algebra is finite-dimensional; its Verma modules need not be. Its algebraic stage does not supply the analytic completion/localization bridge.

Read the exact imported HigherHida, completed-tower and proper-GAGA statements. In particular, `SchemeAndStackFoundations:key/coherent-duality` is the coherent exceptional inverse image/duality supplier and remains a direct prerequisite. Integral fundamental-class divisibility is a further SF.2 request; it is not silently obtained from coherent duality or replaced by étale duality.

## Source findings and versions

All 15 inherited findings received their own `confirmed` verdict, with a reason, in the packet. The source field was added to each. E01–E03 retain the coordinatewise finite-map, signed-weight and closed-box repairs in BPS. E04–E07 retain the P20 BGG direction, bounded-cocycle gap, weight sign and character-component witness correction. E08–E12 retain the BCGP21 multivariable-powers error, p-torsion descent gap, BGG direction, Euler-sign repair and untruncated degree requirement. E13–E15 retain the BCGP25 weight-label correction, constrained-overlap proof gap and casewise auxiliary-prime correction.

Independently compared E08–E12 against the published BCGP21 PDF as well as arXiv v3: Proposition 4.6.19, journal pp. 289–290; Proposition 4.4.3, p. 272, with Lemma 3.8.5, p. 220; §6.4, pp. 338–339; §6.5.1, p. 339; and Theorem 6.6.4, p. 355. These passages retain the recorded issues. The augmentation-space example concerns the claimed canonical splitting; it does not assert that all underlying nonequivariant module splittings fail. The rank-one overlap finding E14 remains a proof gap: an ambient analytic kernel has not been shown to belong to the constrained fiber, so no counterexample to the proposition is asserted.

Added **E16**, a misprint in the proof of P20 Corollary 14.6.2, cleared 17 June 2019 author copy, p. 99. The linear term omits its coefficient a₁. With R=−(P−P(0))/P(0) and Q=R/X, one has R(U)=1 and UQ(U)=1 on the P-annihilated block. For P=X²+2X+1 and U=−1, the corrected value is 1 and the coefficient-omitting value is 0. This changes the displayed proof identity; the packet already used the corrected inverse. Compared BCGP21 Corollary 6.5.23, arXiv v3 p. 161, which uses the coefficient-preserving expression.

Recorded six edition records, with URLs, dates and hashes: the five normative texts and the published BCGP21 comparison. Author pages, arXiv histories and title/journal correction searches yielded no separate resolving erratum. P20 was read only in the cleared library copy, in place. Its findings are scoped to that author edition; publisher text was not served and no claim about an unread version of record is made. No source passages, restricted files or source-text extractions are deliverables.

## Validation and outstanding decisions

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicFamiliesPartII.json`: **0 errors, 0 warnings**.
- Source-issue and source-version validators: **16 findings and six edition records, no errors**.
- Reader synchronization check: every node statement, hypothesis, proof step, acceptance property, API/test specification and source locator/match, plus all request contracts, is present.
- Dependency check: no cycle through the 2,886 reachable packet nodes; requested stages remain explicit leaves. All 17 definition/construction nodes have three tests; all 41 planets meet layer limits.
- `lean-check research/blueprint/suggested/PadicFamiliesPartII.lean`: **exit 0**, 17 `sorry` warnings and no other warnings/errors. Available memory exceeded 20 GB before this check. The unchanged 125-line prototype has three real-bodied light definitions, eight admitted theorem signatures and nine examples; heavy carriers/APIs/tests stay in the reader under the current worker shape.
- `git diff --check`: passed.
- `python3 research/blueprint/intake.py check-files` on the five changed deliverables: **0 problems**.

Questions for the orchestrator concern ownership work, not an unfinished review: schedule the proposed assembly of the two higher-coherent-family Part II identities with a node-alias map; assign the dedicated LieHighestWeight analytic-localization continuation without treating its unrelated nilpotent-orbit Part II as a supplier. The planned follow-ups must retain the bounded-lattice/completion, powers-regularity, integral descent, overlap and eigenpacket-balance obligations. No additional job is claimed by this reviewer.
