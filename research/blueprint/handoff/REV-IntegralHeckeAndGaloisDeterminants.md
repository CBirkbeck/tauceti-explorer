# REV-IntegralHeckeAndGaloisDeterminants handoff

Issue #435; independent reviewer Codex, session `codex-uC8kaC`; 7 October 2026. **Review complete, verdict needs_changes.** This is not an unfinished planning checkpoint. The input author sessions include `codex-O9kH6x` and Claude checkpoints; this review session did none of their work.

The durable record is [the review report](../reviews/REV-IntegralHeckeAndGaloisDeterminants.md), [the packet](../packets/IntegralHeckeAndGaloisDeterminants.json) and [the suggested file](../suggested/IntegralHeckeAndGaloisDeterminants.lean). No scratch file is needed to resume.

All 249 nodes have individual ledger entries: 212 verified, 27 corrected, one added, nine unverifiable. All 51 Mathlib baseline declarations were read at `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti's upstream roadmap reference is `f790474821cf4256814db967cb154e7af3d0c369`. All original source locators/excerpts were checked against public versions, including direct inspection of Buchsbaum's image-only pages. All 16 source issues have independent confirmed reasons. The Quast proof defects persist in author v1, arXiv v2 and publisher HTML. Pilloni E16 now has an absolutely irreducible odd-characteristic counterexample using Q₈×D₈, not just a pointwise square-root objection; its proof is in the report.

The packet stays a complete planned pass with seven planned stages and no closed stages. Its 43 gaps are the original 37 mathematical/supplier leaves and six review additions. Those original open leaves do not cause the negative verdict. Suggested elaboration with `sorry` does not establish its assertions.

## Resume the revision at these contracts

- **IHG.0 reductive-pseudocharacter, continuous-reductive-pseudocharacter and reductive-pseudocharacter-kernel:** replace arbitrary coordinate evaluations with data satisfying reindexing and multiplication compatibility, which can already be stated using `InvariantCoordinateInput`. Propagate it through all constructors, reconstruction signatures and tests. LP3 group/invariant carriers remain supplier inputs.
- **IHG.1 reducibility-ideal:** two-block henselian/full-polynomial-law characterization is partially repaired; state prescribed residual factors and uniqueness. Quotient entry corners now use compatible primitive matrix units.
- **IHG.1 gma-extension-injection:** use actual quotient constituent modules and partition/reducibility hypotheses. Arbitrary zero modules give Ext zero with a nonzero off-diagonal dual, refuting the prototype. Preserve the image-as-extensions-through-the-chosen-CH-quotient qualification.
- **IHG.1 ribet-lattice:** add complete DVR/fraction-field, compact continuous irreducible representation and distinct residual characters; express and test the nonsplit residual orientation. The report gives a failure of even invariant-lattice existence without these conditions.
- **IHG.1 universal-cayley-hamilton-algebra:** repair `universal_matrix_specialization` by tying the coefficient map to the specialized universal determinant and adding henselian-local, split and absolutely irreducible residual hypotheses. A reducible specialization does not give the asserted matrix algebra.
- **IHG.1 symplectic-coefficient-descent:** require a nondegenerate alternating form and complete-local/common-residue, trace, continuity, residual irreducibility and residue-characteristic >2 conditions. The zero-form hypothesis currently permits false descent.
- **IHG.1 compatible-local-reconstruction:** CN23 §3.2 uses a quotient Ã→A, not coefficient extension A→B. Supply a local lift reducing to the global A-representation and with the selected generic fiber; restore disjoint residual factors and compatible corner basis. Arbitrary local and global rank-one characters are not conjugate.

These are nine contract roots; update their transitive APIs/tests too. The review report gives exact source pointers and counterexamples. Preserve the newly explicit topology/density conditions, separate ground-field splitness from absolute irreducibility, and retain full polynomial-law equalities.

The added `IHG.0/degree-one-laws-linear` node has `addedBy: REV-IntegralHeckeAndGaloisDeterminants`; characteristic-polynomial and dimension-one now import it, and trace injectivity imports Newton identities. Chenevier's nonexistent Proposition 1.32 reference is corrected to Proposition 1.30; the non-routine integral transfer proof is a new precise gap. The new quaternion regression detects accidental ground-field splitting.

## Ownership and downstream coordination

The 19 supplier requests and four rescope proposals were checked. SemisimpleAlgebras requests now distinguish Artin–Wedderburn, density and finite-central-simple/separability contracts; imperfect-field bounded-center and inseparable norm work is not assumed. DD.1's existing regular-sequence/ordinary-quotient comparison is reused; request its explicit Koszul augmentation/K-flat interface rather than duplicate its complex.

Read the independently verified findings, not only the red-team result text:

- `RT-AREA-automorphic-1/18`: IHG.2 finite images/localization → CC.8 completed limits/decomposition → R31.3 specialization. This is not langlands/18. Do not infer a duplicated TC.2 construction from two imports or close the CC.4 chain-model gap using the conditional patched complex.
- `RT-AREA-langlands-1/25`: the missing supplier edge into R19.6 is IHG.4. IHG.1 already reaches it indirectly; a direct documentation edge is optional. Geometry must produce congruence/integrality/continuity witnesses.
- `RT-AREA-langlands-1/26`: the independent factor prefix requires full Laurent-variable determinant/factorization identities for every g and integer k. AG2.4 must verify that its HLTT character family instantiates them; pointwise factors do not suffice. Keep TC.2-dependent geometry outside that algebra prefix.

Do not enact atlas/supplier changes in this revision without its scope authorizing them. The roadmap reader was read and compared, but is read-only for this review job. Regenerate it during the revision after repairing the packet/signatures, including the added lemma, two API entries, quaternion test and rescope qualifications.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/IntegralHeckeAndGaloisDeterminants.json`: zero errors and warnings.
- `lean-check research/blueprint/suggested/IntegralHeckeAndGaloisDeterminants.lean`: final unchanged file exit 0, only `sorry` warnings, at the shared pinned Mathlib.
- Per-node coverage, baseline count, source-issue verdicts, minimum tests and allowed deliverable paths checked; `git diff --check` clean.

The orchestrator can queue a revision and a fresh independent review. No unresolved maintainer question prevents that routing.
