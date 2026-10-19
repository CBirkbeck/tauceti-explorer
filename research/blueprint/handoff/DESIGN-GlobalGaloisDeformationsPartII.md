# DESIGN-GlobalGaloisDeformationsPartII — handoff

Codex, session `codex-csQTUB`, issue #3438. This is a complete target-level design pass for one roadmap, ready for independent review. It is not a checkpoint or an accepted mathematical proof. No second job was taken.

## Delivered and coverage

The roadmap definition, packet, reader and compact suggested file cover all 86 catalogue items routed from PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22 to the former continuation name GlobalGaloisDeformationsPartIIGValuedLifting. The packet preserves the catalogue mapping explicitly. It extends GlobalGaloisDeformations after its deformation functors and obstruction presentations.

There are 82 nodes: 13 definitions, 2 constructions, 6 lemmas, 51 theorems, 3 applications and 7 comparisons. The 15 definitions/constructions carry 45 API items and 45 regression tests, with uses explaining the API choices. There are 51 planets, at most six per layer; six pinned declaration citations; 41 supplier contracts; five explicit mathematical gaps; and 46 source findings. Every implementation status is `unchecked`.

| Stage | Targets | Planets | Coverage |
|---|---:|---:|---|
| GG2.0 — global lifting data | 7 | 5 | planned |
| GG2.1 — residual-image criteria | 12 | 6 | planned |
| GG2.2 — cyclic ramification classes | 9 | 5 | planned |
| GG2.3 — doubling and controlled towers | 6 | 2 | planned |
| GG2.4 — relative local conditions and Selmer images | 8 | 5 | planned |
| GG2.5 — auxiliary primes and annihilation | 5 | 4 | planned |
| GG2.6 — finite ramification and geometric lifting | 6 | 5 | planned |
| GG2.7 — Levi-valued residual applications | 8 | 5 | planned |
| GG2.8 — actual reducible modularity | 11 | 6 | planned |
| GG2.9 — function-field automorphy | 5 | 4 | planned |
| GG2.10 — symplectic compatible systems | 5 | 4 | planned |

All eleven stages are planned; none is closed. Each prerequisite chain terminates in a pinned declaration, an existing owner's target, a precise requested export, or an explicit gap. Completion means that the target pass covers the scope, as in PROTOCOL section 0. The statements of the main lifting theorem and its applications remain intended endpoints pending the listed obligations.

## Review and mathematical continuation

Start with the reader's conventions and G1, then the corresponding conditional joint-inertia node, density selection, doubling and controlled tower. The packet does not silently use the source's unconditional independence claim.

1. **G1: auxiliary-field independence.** Independently verify E45 against FKP22 arXiv v5, Lemma 3.7, pp.15–16. Over Q, take trivial SL₂ residual image, k=F_p, p≥5. Its dual adjoint is three copies of F_p with cyclotomic action. Identify two cyclic basis lines. The difference of their two η-classes at w is unramified at w, hence belongs to the fixed finite old H¹ group. Equality of these differences at two distinct new primes yields a relation among four nonzero scalar cocycles. Their four degree-p fields cannot be strongly disjoint. This satisfies Assumption 3.1 but fails C1, so it does not refute Theorem 5.2. The narrower joint-inertia conditional theorem is valid; its extra generation condition is not automatic. A follow-up must prove the quantitative input actually needed by Proposition 3.8 under C1,C3,C4, allowing repeated constituents, or replace the construction. Pairwise disjointness or generation in every projected factor does not suffice.
2. **G2: small finite-group representations.** Obtain an authorized primary text of Guralnick, *Small representations are completely reducible*, Theorem A, DOI 10.1006/jabr.1999.7963. Verify the exact H¹ and splitting consequences used in FKP19 Appendix A and FKP22 Corollary 8.3. The read Larsen–Pink normal-series theorem is not a substitute. This remains an ArithmeticGaloisRepresentations G7 contract.
3. **G3: function-field duality.** Audit a primary proof of the positive-characteristic, prime-to-characteristic versions of local Tate duality, Poitou–Tate and Greenberg–Wiles, including the stated finite-coefficient and Sha comparisons. Current supplier nodes specify number-field versions. FKP22 §2, pp.9–10, invokes NSW, but that book is not among the cleared local sources. No other copy was used. The exact requested extensions remain with ArithmeticGaloisDuality.
4. **G4: polarized coefficient module.** Verify E46 and resolve the distinction between Lie ker(multiplier)=gl_n and Lie((G_n⁰)^der)=sl_n in FKP22 §2 p.9 and Appendix A.1.2 p.47. Retain constituentwise self-polarization and the negative-transpose complex-conjugation action. This is a GlobalGaloisDeformations G7 supplier obligation. Appendix A.10 is unused in the proof of the main lifting theorem; this convention question is not evidence against that theorem.
5. **G5: all-coefficient-place monodromy.** Read the precise regular-unipotent subgroup classification and the primary independence-of-formal-character theorem. Check rank, irreducibility and the principal-GL₂ exception. BLGGT14 Lemma 5.3.1 concerns components/multiplicity and does not supply the latter theorem. The plan strengthens the local prescription to two Steinberg places of distinct residue characteristic, so each coefficient prime has an away-prime Steinberg place. This resolves that local exceptional-place issue but not the classification/formal-character obligation.

The first 44 source findings restate the paper extraction's findings in this roadmap's words and apply their corrections. Their provenance identifies the earlier review without importing its verdict as a review of this packet. E45 and E46 are new findings for independent verification. Every finding is scoped to the exact preprint read; the full published text has not been collated. The reader gives the corrected hypotheses, counterexamples and locators, including the joint determinant-field condition, GSp similitude factors, noninjective Levi projection, prime-field cyclic modules, determinant reciprocity normalization and constituentwise cyclotomic irreducibility.

## Ownership and supplier requests

The reader's 41 numbered contracts give the precise statements and consumers; the packet's `requests` list gives their machine-readable edges. They concern:

- ArithmeticGaloisDuality: arithmetic continuous-cohomology comparison, finite coefficients, local annihilators, cyclic quotients, global duality/cardinality and Selmer comparison; positive-characteristic extensions remain G3.
- ArithmeticGaloisRepresentations and current LocalGaloisGroups material: actual Galois carriers, lattices, finite fields, tame/cyclotomic conventions and finite-image input; Guralnick remains G2.
- GlobalGaloisDeformations and LocalGaloisDeformationRings: the existing fixed-multiplier deformation problem and obstruction theory, local root cocycle lattices, generic smooth neighborhoods, potentially semistable/ordinary components and exact determinant matching.
- Current ReductiveGroups, ReductiveGroupsPartII and ProfiniteProPGroups: root structure, centralizers, congruence topology, lattice tree and Frattini generation. The compact analytic/Lazard addition is requested from the reductive owner; GG2.4 owns its lifting-specific uniform-bound application.
- Current Chebotarev and FunctionFieldArithmetic: compatible Frobenius densities, including constant-field restrictions. Independence remains G1 and is not attributed to Chebotarev.
- Current ClassFieldTheory layers 7 and 13: local reciprocity and the normalized cyclotomic/global character correction.
- The modularity, automorphic, Lafforgue and compatible-system owners: the exact Skinner–Wiles/Pan hypotheses, Serre/Deligne–Serre comparisons, full residual lattices, finite-determinant function-field Langlands, prescribed local potential automorphy, all eight ANT20 Theorem 1.1 hypotheses, and the adapted Brauer-induction descent. BLGGT14 Theorem 5.5.1 cannot be applied literally to this reducible-residual ordinary situation.

Two inline ownership proposals preserve existing owners: the analytic extension of ReductiveGroupsPartII, and the broader duality/local-deformation exports. They do not propose rebuilding existing congruence groups, trees, Selmer carriers or local rings. No upward supplier was moved into a lower Caraiani–Newton tier; this continuation is outside the fixed 94-roadmap schedule.

## Library and upstream audit

Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`; pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. The six cited declarations are continuous H¹, explicit inflation–restriction exactness, Submodule.map, Submodule.span, Representation and Subgroup.map with its generated AddSubgroup.map. The source bodies were read and the relevant shared-build files compared byte-for-byte with the recorded pin. The declaration index omits the generated additive name, so the baseline entry identifies the indexed generating declaration and explains its additive form; the prototype actually elaborates AddSubgroup.map.

The reviewed library-coverage audit was read before planning. Current upstream roadmaps commit `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were checked read-only. ReductiveGroups and Chebotarev readers were read in full. Current ReductiveGroupsPartII already owns congruence quotients and the lattice tree; RG2.0/RG2.2 references mean those current upstream targets, superseding the older partial atlas packet. The nine newer roadmap Suggested files were searched, including all nested OperatorTheory files; relevant LocalGaloisGroups and ProfiniteArithmetic hits were read. The packet records the bounded search and the absent Completed roadmap directories. No Lake command was run in the read-only trees.

## Sources read and unavailable inputs

The packet and reader record URLs, editions, hashes, dates and exact read sections for nine primary texts: FKP22 arXiv v5, FKP19 arXiv v5, Larsen–Pink 2011 author offprint, Lazard 1965 published scan, Bellaïche–Chenevier 2014 author preprint, Ribet's 2010 notes, Allen–Newton–Thorne arXiv v2, BLGGT14 published PDF and BLGHT11 author preprint. FKP22 was read throughout; other read ranges are recorded individually. All mathematical prose is original wording, with theorem/section/page locators. No source passage, PDF or extracted book text enters the repository.

Unavailable inputs are the complete version-of-record collation of FKP22, the primary Guralnick text, an authorized primary function-field duality account, and the exact primary classification/formal-character inputs of G5. The publisher endpoint and the alternative FKP22 manuscript endpoint did not yield the full text. Public version/correction searches found no erratum; that observation is not a collation claim. The cleared-library index was consulted; no uncleared copy was used or copied.

## Validation

- `scripts/check_blueprint.py` against the shared pinned declaration index: **0 errors, 0 warnings**.
- Source-issue schema and source-version checks: passed for all 46 findings.
- Scoped integrity checks: all 82 target statements and all APIs/tests match the reader; all 86 routes are assigned; supplier edges, node/stage acyclicity, coverage, anchors and planet caps passed. JSON is valid; no source-excerpt fields or private absolute paths remain.
- `scripts/check_sorry_data.py`: passed. The suggested file is 137 lines: three light real-bodied definitions on existing carriers, nine API milestones and nine examples. Heavy arithmetic definitions and theorems are reader targets, following the current WORKERS shape rule.
- **Lean compiled successfully** with `lean-check` at the shared pinned build on 2026-10-19: 18 expected admitted-proof warnings, no errors or other warnings. Available memory was 86 GiB before the check. No background compiler remains.

The complete design now needs independent review, particularly the new E45/E46 findings and the five obligations above. Mathematical continuation should close those obligations and obtain the exact owner exports before marking any layer closed. There is no unfinished target-inventory pass to resume. Scratch source texts and generation scripts are disposable once the pull request opens; all information needed by the reviewer is retained in the deliverables.
