# BP-CompletedCohomologyPartII--CC.0 — handoff

Worker: **Claude — claude-u0XBo5**. Issue: **#701**. Branch: `claude-u0XBo5-701-completed-cohomology`. Completed 14 October 2026.

## What this job found

This part job (scope CC.0–CC.7, "part 1 of 2") was queued before the roadmap was planned as one job. Since then the whole-roadmap job BP-CompletedCohomologyPartII (#9407, PR #9450) has planned all nine stages in `research/blueprint/packets/CompletedCohomologyPartII.json` (68 nodes, importing the accepted CC.8 part). Its review REV-CompletedCohomologyPartII (#9378, PR #9455) accepted it on 13 October 2026. That job received the same five added sources as this one (Fu, Boxer–Pilloni, Nakamura, Le–Le Hung–Levin–Morra, Boxer–Calegari–Gee–Pilloni) and the same red-team findings (RT-AREA-automorphic-1/3 and /17, together with /15, /16 and /18). Planning CC.0–CC.7 again here would have planned them twice (PROTOCOL.md section 15).

So this packet is an import index, together with five targets that no owner node states. Three come from the added sources; two answer requests that the accepted CohomologyComparisons plan makes of CC.2 and CC.4:

- `CC.3/finite-coefficient-model-of-completed-homology` (comparison): Fu's model, lim_s lim_U H_n(Y_U, O/varpi^s), is homeomorphic to the owner's H̃_n, and rationalisation comes after both limits (Fu (4) and §7; CE §1.1). The circle tower is the non-example: E ⊗ H̃_1 = 0, while the limit of the rational H_1 is E.
- `CC.3/tame-level-completed-modules` (construction; 6 API items, 4 tests): the colimits over tame levels at Σ₀ of completed compact-support cohomology (along restriction) and of completed Borel–Moore homology (along transfer). They carry a smooth G_{Σ₀}-action and recover the level invariants for pro-order invertible in O (Nakamura §2.3.1–2.3.2).
- `CC.3/tame-level-borel-moore-duality` (theorem): the Haar-normalised fixed-level duality maps assemble into an isomorphism from the tame-level Borel–Moore module onto the smooth contragredient of the tame-level compact-support cohomology. It holds when the next compact-support torsion vanishes, as for modular curves. This is Nakamura §2.3.2, with the misprint PAPER-NAKAMURA-23/E3 corrected. It uses SR.0's smooth-dual identification (Ṽ)^K ≅ Hom_O(V^K, O).

- `CC.2/complete-torsion-free-complex-control` (theorem): Pan (2022), Lemma 4.4.4. For a bounded-above complex of varpi-adically complete torsion-free O-modules, cohomology has no divisible elements, the Bockstein sequences have multiplication by varpi on their torsion terms with zero limit, and cohomology is the limit of its reductions when those limits have bounded torsion.
- `CC.4/completed-coefficient-interchange` (theorem): Pan II, Lemma 7.2.6(1), on the owner's admissible cochain model S̃, with H^i(S̃) = H̃^i and H^i(S̃/varpi^m) = A^i_m. Completed cohomology with coefficients in any complete torsion-free M is lim_m (A^i_m ⊗ M), and it is the completion of H̃^i ⊗ M when the torsion of H̃^{i+1} is bounded.

None of the five is a planet: they are supporting results, and the owner's six CC.3 planets fill that layer.

## Packet contents

- `imports`: 67 declarations read (65 owner nodes of CC.0–CC.7; CC.8/localisation-limit-support-dual-compatibility and CC.8/definite-unitary-degree-zero of the accepted CC.8 part).
- `targetCoverage`: 49 targets, taken from the eight stage descriptions, the added sources and the two requests, each mapped to its owning declarations with what they state.
- `routeCoverage`: every item of the five added papers. Nakamura's Lemma B.16 (inside item 52) concerns coadmissible modules, which PAPER-NAKAMURA-23/53 routes to CompletedCohomologyAndLocalGlobalCompatibility:R31.4 with SmoothRepresentationsOfLocalGroups:SR.5. Its only use is Corollary 2.5 (item 12, also R31.4), so it is not planned in CC.3.
- `findingsCoverage`: RT-AREA-automorphic-1/3, /17 and the CC.4 route of /18, which the fix rounds (`redteam/RT-AREA-automorphic-1.fixes-5.md`) handed to this job by name. The owner discharges all three through its NE.0 and L1 requests, gap G1, its restructure entry and its CC.4 nodes, and the accepted CC.8 part covers the Hecke-algebra side of /18.
- `consumerRequests`: every request another packet makes of CC.0–CC.7. CohomologyComparisons asks CC.2 and CC.4; its review had marked both "partly", and the two new nodes answer them. Its request to CC.8 is outside this part. TorsionCohomologyInfrastructure asks CC.4; the owner answers it (CC.4 chain complex, CC.7 Iwasawa duality with gap G7, CC.1 tame action).
- `coverage`: all eight stages `planned`. Each `remaining` list repeats the owner's open items for that stage, marked as the owner's. Nothing is closed and nothing is formalised.
- `requests`: one, to `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-…`, for finite-cover transfer on (Borel–Moore) homology and its adjointness to the cohomological trace. The owner has a broader request to the same stage.
- `gaps`: none new. The owner's G1–G12 remain the owner's.
- `sourceIssues`: one new finding, `CompletedCohomologyPartII/E5` (the next free number after the owner's E1–E4). It is a misprint in the proof of Pan (2022), Lemma 4.4.4: a limit of H^{i+1}[p^n] is written as Hom(Q_p/Z_p, H^i), where H^{i+1} is meant. The slip is harmless, since the vanishing is shown in every degree. It is the same in the version of record and in arXiv v3.
- `sourceIssueReferences`: the owner's CE findings E1–E4; PAPER-BOXER-PILLONI-26/E7, E9, E110; PAPER-NAKAMURA-23/E3. All are confirmed.
- `restructure`: one `rescope` entry, described below.

## For the maintainer

- **The assembly collides with the whole-roadmap job.** The queued ASM-CompletedCohomologyPartII waits for this job's review and REV-…--CC.8. Its outputs `readmes/CompletedCohomologyPartII.md` and `suggested/CompletedCohomologyPartII.lean` are the whole-roadmap job's reader and suggested file. Rebuilding that reader from the two parts would replace the accepted whole-roadmap document. The assembly should start from the owner's reader and add the CC.8 part and this part's five declarations. The same collision blocks ASM-DeformationAndDerivedPatchingAlgebra (#222), whose reader is under review in PR #9458; I released that issue with a comment.
- **Whether to keep the queue's part structure.** Part jobs still in the queue for roadmaps that now have an accepted whole-roadmap plan can only become import indexes like this one.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/CompletedCohomologyPartII--CC.0.json --index <pinned declarations.tsv>`: 0 errors, 0 warnings. The owner and CC.8 packets still give 0 errors and 0 warnings with this packet present.
- In-memory `merge_blueprints` of the owner, CC.8 and this packet on `data/atlas.json`: no error, no skipped links.
- Reader: generated from the packet. A script check finds no unescaped `*`, `$`, `](` or `_` after a non-ASCII-word character outside code spans, which the site renderer would read as markup.
- `lean-check research/blueprint/suggested/CompletedCohomologyPartII--CC.0.lean`: **compiled**, exit 0, no warnings. The file is Mathlib-only, with no `sorry`. The five new targets are not light statements at the pins: the arithmetic tower is the owner's README target, smooth representations over O are SR.0's, and the CC.2 lemma needs the reductions of a complex modulo every power of the uniformizer. So the file names them and proves the arithmetic behind the acceptance tests. That arithmetic covers the circle-tower limits, the zero p-power transition mod p, averaging as the normalised group sum, the Haar index identity, and the vanishing reduction in the `[O → O]` example of the CC.2 lemma. `scripts/check_sorry_data.py`: exit 0.
- Baseline: `tauceti:Representation.averageMap_eq_invOf_card_smul_norm`, `mathlib:Representation.averageMap`, `mathlib:Representation.dual` and `mathlib:IsAdicComplete`, read at the pins and present in the pinned index.

## Sources read

- Calegari–Emerton, *Completed cohomology — a survey* (the owner's file, SHA-256 926a5de4…): §1.1 and Theorem 1.1.
- Fu, arXiv:2201.11190v2 (SHA-256 d71e9d3f…): (4) on p. 3, and §7 on pp. 23–24.
- Nakamura, arXiv:2006.13647 (SHA-256 0d8fa462…) and the open-access version of record, Inventiones 234 (2023), 171–290 (SHA-256 47682f85…): §2.3.1–2.3.3 (arXiv pp. 20–25, Inventiones pp. 191–196), and Appendix B.2.4 (arXiv pp. 95–96) to place Lemma B.16.
- Pan, *On locally analytic vectors of the completed cohomology of modular curves*, Forum Math. Pi 10 (2022), e7 (open access, SHA-256 61549f3a…), checked against arXiv:2008.07099v3: §4.4, Lemma 4.4.4.
- Pan, the same title, II, arXiv:2209.06366v1 (SHA-256 0873b61a…, the version CohomologyComparisons cites): §7.2, Lemmas 7.2.5–7.2.6.
- Paper extractions and routes: PAPER-FU-24, PAPER-BOXER-PILLONI-26, PAPER-NAKAMURA-23, PAPER-LE-LEHUNG-LEVIN-ETAL-20 and PAPER-BOXER-CALEGARI-GEE-PILLONI-25. The CC.0–CC.7 nodes, gaps, requests and review of the owner, and the CC.8 part.

No source passage is copied into the repository.

## Resume

Nothing remains for this job. Next comes its independent review, which should check the 49 target mappings and the five new declarations against Nakamura §2.3, Fu §7 and Pan (2022) §4.4 and (II) §7.2.
