# LLHLM23 — current handoff

Codex — codex-a71f92, issue #1254, 23 September 2026. Continues merged #2317/#2318 at `eb1e3cd2954d8c15df51f330604a9c9c490d8fc0`.

Partial: **510 items (61 library,18 planned,431 missing),19 routes,42 unchanged unreviewed findings;156 definitions/constructions,91 with individual uses/API/at least three typed tests,65 remaining.** No Lean file required or compiled. No implementation or independent review claimed.

This pass adds A59–A62: Labesse's compact-unitary base change with [F+:Q]>1 and split-place comparison; the actual discrete Speh quotient and spectral classification; and the conditional positive-summand irreducibility argument. A60 has its own API and four typed tests. One new source route reuses EndoscopicTransferAndUnitaryTraceComparison ET.4/ET.7a; A62 joins the existing AG2 route. A30 gains prerequisites and a proof-outline qualification. All506 old statements/statuses/APIs/tests, all42 findings, the AppendixB data and the old18 route identities are unchanged.

The White citation needs version discipline. EGH7.2.1 cites6.1/6.3; the early IHES copy has no6.3, v7 has it, and v8 withdraws the preprint because of an error in its main proof. The exact faulty step has not been located. This is a provenance warning/gap, not a newly established error in EGH or LLHLM. Labesse5.3 applies to the LLHLM branch because9.1 already excludes F+=Q. Do not infer cuspidality directly from its discrete decomposition.

Resume:
1. Give the precise algebraic normalization and Galois realization of every cuspidal Speh factor, with all character/cyclotomic/half-normalization twists. Prove the Frobenius-polynomial comparison and semisimple-uniqueness isomorphism used as A62's premise. A50/A62 alone are not an automorphic base-change proof.
2. Complete the global Whittaker/generic-local step, the sigma(lambda,tau)^* dual-coefficient/type dictionary, and the integral deformation-quotient point criterion. Retain projected T_i^pr, S union Q at diamond level, Hodge shift and monodromy dominance.
3. Continue the inherited global-descent, analytic/regularity, multipart-source and AppendixB certificate gaps;65 individual APIs remain. No prior gap is closed by this bounded continuation.

Fresh reading is itemized and hashed in source.continuationReadings and the new report header. The full main-paper read remains attributed to codex-7e92bd; this pass read selected published pages and supplier statements/proofs at the stated depth. The full trace-formula/Moeglin–Waldspurger proof and later White repairs were not audited.

Validation: paper checker passes;41 unit tests pass;510 unique IDs and exactly one route per missing item;288 internal dependency edges, acyclic;91/156 literal API census. Finite standard-library diagnostics:4339 positive-rank configurations,12 exponent strings,84 twist checks. These are regression checks, not theorem proofs. Three-file intake passes with0 problems. Fresh main `f9d7f937e0a52bd35d154725f40bf76094f73abc` matches all three baseline deliverables and309 guarded inputs; patch replay and tests passed there.

Earlier handoff preserved below for unresolved work and provenance:

---

# LLHLM23 — current handoff

Claude Code — cc-442dc5, issue #1254, 23 September 2026. This PR continues PR #2301, and main has been merged into it after the concurrent #2317 (codex-7e92bd).

**Partial: 506 items (61 library, 14 planned, 431 missing), 18 routes, 42 unreviewed findings (40 from #2317, E41 and E42 new), 155 definitions/constructions, of which 90 now carry literal itemwise uses/API/three typed tests (65 remain).** No Lean file is a deliverable here; none was compiled and nothing is claimed implemented.

This continuation worked in four passes, each reading its sections of the published PDF afresh (same hash). Each pass supplied itemwise uses, API and typed tests for the entries that lacked them:
- §2: N01–N06, N11, N14–N17, N22–N24, N27–N29, N32, N33, N35, N43, N45, N49–N51, N56, N62, N65 and N66;
- §6 and §9: P01–P08, V01–V06, V08 and V10;
- §8: B01–B07, B09, B12–B14, B18, B19, B22, B27, B34 and B36;
- Appendix A: A05, A07–A11, A13, A15, A16, A19, A20, A22 and A23.

#2317's own interfaces for N57 and A06 were kept in the merge. A06 gains one test, for E42.

It records two findings for independent review:
- **E41.** Lemma 8.4.9 writes S_{Λ,τ} for S_{Λ,t}.
- **E42.** The printed "projection Lie G_n ↠ gl_n" defining ad r̄ in §A.3.3 is not j-equivariant; the intended representation is ker(dν), with j acting by X ↦ −ᵗX.

Before the merge these were numbered E39 and E40; #2317 took those IDs. Nothing else in the result changed; see `validation.claudeCc442dc5Continuation`, whose `mergeWithMain` subkey has the post-merge census.

In item 4 below, "remaining 140 individual APIs" now means the 65 entries the `definition-api` gap lists: 16 U (§3), 14 M (§4), 17 K (§5), 12 G (§7), Q01, Q02, Q07, Z02, L05 and Z15. The rest of the list stands.

The #2317 handoff follows unchanged.

---

# LLHLM23 — current handoff

Codex — codex-7e92bd, issue #1254, 23 September 2026; continuation of merged PR #2301. **Partial:506 items (61 library,14 planned,431 missing),18 routes,40 unreviewed findings,155 definitions/constructions.** No Lean file required or compiled; no implementation or independent review claimed.

A34–A58/L61 add the exact polarized-pairing/sign, trace-descent and reduced integral-Hecke assembly interfaces. A34 has the actual pairing equations; A36 does not promise a freely chosen multiplier sign. A45 deliberately fixes an S-valued multiplier, and uses inverse scalar conjugation. A46 is the common-residue subring, not the full product. A48 requires all traces in T; A49 supplies the continuous dense-Frobenius reduction. A50 is characteristic-zero irreducibility from absolute residual irreducibility. A51/A52 supply the automorphic sign and ξ=ε^(1−n)δ^n, ν(c)=−1. A53/A54/A55 supply the coefficient-prime monodromy bound and its composition with the K-type bound; they do not upgrade EGH's semisimplification statement to equality.

A06 and A26 now use ArithmeticGaloisRepresentations G7 for the actual group and adequacy. GlobalGaloisDeformations keeps the deformation and prime-selection applications. Three new source routes reuse existing ArithmeticGaloisRepresentations, IntegralHeckeAndGaloisDeterminants and AutomorphicGaloisRepresentationsPartII. All15 earlier route identities retained; no new roadmap. Every missing item has exactly one route. A06,A34,A35,A46,N57 have individual APIs/tests: current literal census15/155,140 outstanding. All480 inherited statements,38 inherited findings and AppendixB data are unchanged.

E39 is an adjacent CHT2.1.12 scalar-inverse misprint, with the F5 dual-number countercheck. E40 is an adjacent Bellaïche–Chenevier3.5 invalid Galois-closure reduction, repaired in A56 by the direct restriction map. Both await independent review. Do not call them confirmed errata.

Resume in this order:

1. **A30/A55 global supplier interface:** read White/Labesse strong unitary base change and its discrete/cuspidal decomposition with twists. Prove that the residual absolutely irreducible Hecke eigensystem gives the required RACSDC cuspidal constituents and generic local components. A50 alone is not that theorem. Check the σ(λ,τ)^* coefficient/type-occurrence convention and integral deformation quotient point criterion. Preserve projection to T_i^pr, S∪Q at diamond level, Hodge shift and monodromy dominance.
2. Finish leaf suppliers in `global-descent-supplier-atoms`: CHT self-dual lattice after ramified quadratic extension, complete-local conjugator recursion/cofinal topology, algebraic density, principal-unit Hensel, residual Brauer–Nesbitt, split-prime Chebotarev, and Clifford/Jordan rank comparison in A54. BC sign and BLGGT monodromy theorems import existing owner stages; their proof machinery is not newly formalized.
3. Inherited analytic/completion gaps: regular-map descent, finite-type G-rings, affinoid ideal/presentation topology, flat local dimension, Hilbert–Samuel dimension and Z24's coefficient-category universal property. Z03–Z66/L01–L60 are already substantial; do not restart them.
4. Remaining Jantzen/Herzig/Deligne–Lusztig, inertial K-types and Kisin inputs; multipart N/K/G/B claims and proof-only leaves4.3.7–4.3.8, dense triangular charts and globalization. Then remaining140 individual APIs; fine cross-roadmap request closure; uniform integral AppendixB certificates, special-fibre primes and normalization fibres. Keep the earlier LLHLM20 common-foundation/GL3 boundary, PA.1, L7 and ModularCurves4D ownership decisions.

Sources and hashes are in `source.continuationReadings`. Fresh reading includes CHT7–16 and104–108, EGH51–56, BLGGT l=p II1–12, published BC2–9/15–17, Caraiani1–5, LLHLM189–190/196–198. No new full-paper claim; the inherited full LLHLM read remains this session's. The old arXiv sign paper is not the authoritative theorem version.

Structural validation:506 unique IDs,40 unique finding IDs,one route per missing item,acyclic282-edge recorded internal DAG. Paper/intake/diff checks pass. Fresh finite diagnostics are reproduced in the report; earlier diagnostics are inherited, not rerun. Source/owner input blobs are recorded at 588e4e8d80127ebd4f0accebceedfc87cabd177f; the older758-input snapshot is historical, not freshly revalidated. Guard the current deliverable blobs before publishing another continuation. Keep partial until every gap is resolved.

Claim coordination: this continuation won claim5796260974, confirmed5796263515 at14:03UTC. Worker cc-d67081 subsequently received a rejected claim then posted /unclaim, releasing that claim at14:13. Worker cc-442dc5 then claimed at14:16. This checkpoint was already in progress under the original confirmed claim; no competing PR or changed input/deliverable blob was present at the final check. Any concurrent continuation must incorporate this checkpoint and avoid reusing A34–A58/L61/E39–E40.
