# PAPER-WITASZEK-22 handoff

Status: **partial checkpoint**, Codex `codex-c83e7a`, 23 September 2026. Refs [#1101](https://github.com/CBirkbeck/tauceti-explorer/issues/1101). Continues [PR2012](https://github.com/CBirkbeck/tauceti-explorer/pull/2012); no independent review performed.

## Completed here

195 items (21 library, 9 planned, 165 missing), 40 definitions/constructions, 120 API contracts and 120 proposed tests. The 371 internal and 19 external prerequisite edges resolve; the internal graph is acyclic. All prior169 IDs and prior source findings E1–E11 are retained. Only the old Stein, resolution-sections and resolution-Euler nodes changed among prior items. There are26 new items and a seventh source route, SF.2.

The Stein source is corrected to algebraic spaces0A1C/0A1B. The plan separates relative Spec, coherence, formal idempotents, Noetherian approximation and normal-target descent. Canonical projection formula gives section isomorphisms, and surjectivity detects generation without flatness. The surface direct-image dimension bound, finite-support lengths/cohomology and Leray sequence now explain the Euler correction even when d₂ is nonzero. R¹ is not assumed zero. The finite Noetherian Stein conclusion is not imposed on arbitrary bases.

Import formal functions from AdicSpacesPartII:F0, coherent projection from StableReduction2 and ordinary Leray from DiamondsAndVStacks:D0. Reuse the pinned integrally closed/idempotent/Euler/Artin–Rees/adic-completion declarations. Do not re-plan this algebra or create another Stein/cohomology owner. Existing Benoist19 and Gille–Parimala consumers share these suppliers.

Freshly read published661–664,700–701 and20 archived Stacks pages listed with hashes in JSON. Prior complete51-page published reading, image inspections, Keel99 reading and v2 comparisons remain attributed to PR2012/earlier workers. Three new source findings E12–E14 concern **external Stacks proofs**:08AR typing,08AY absolute-index shift,08B1 missing restriction subscript. All14 findings still await independent review.

## Resume in this order

1. Finish the transitive Stein/coherent foundations: formal-functions cofinal filtrations and stabilization; relative normalization; weak Chow/coherent dévissage; proper approximation and clopen limit descent; Lazard and cohomology-colimit compatibility. Use the named F0/SR2/D0/SF requests. The Artin–Rees and local-completion algebra is already built. The20 displayed proofs were read, but their entire dependency chains were not.
2. Continue the surface prerequisites: projective resolution, regularity in codimension one/dimension, smooth surface RR (already SF.5), Hodge index, Cartier–Weil projection, intersection positivity and duality. The normal-target function and finite-support Euler arguments are decomposed here. Preserve the Leray d₂ and use Euler cutoff3. Complete published/v2 statement collation separately; acquisition is already done.
3. Finish Keel5.4's general top-cohomology bound by reading Hartshorne III.7.3 and Kollár96 VI.2.1–2.2 precisely. Do not reinstate the unsupported arbitrary-coherent-F top-cohomology strengthening. The auxiliary dévissage statement concerns sections of negative nef powers.
4. Acquire published Kollár97, compare weak normalization with the seminormal scope in Witaszek, then close the proper-action and finite-relation inputs. Read Artin70 Thm3.1/6.2 and Temkin11 Thm1.1.3 to exact hypotheses and proof prerequisites. Keep these interfaces open until read.
5. Read Keeler03 original§5 with the2018 corrigendum and de Jong roots. E1.3 uses finite faithfully flat base change; do not use the uncorrected alteration argument. Keep the correct Keeler citation distinct from Keel’s polarized pushouts.
6. Close Tanaka16/18, KM98/Kollár13, HK10/BCHM10, MNW15, generic conics and mixed-characteristic adjunction inputs used in§6.4. Keep perfect closed residue fields for Cor6.7 and locally finite positive-characteristic residues for its semiampleness conclusion.
7. Close Stacks root tags, conductor/Picard patching, finite approximation, normalization/excellence and the arbitrary-excellent-base dimension induction. Do not strengthen the base to finite-dimensional without proof.
8. Coordinate numerical Picard finiteness with the SAME pending NumericalPicardAndContractionDescent proposal in PAPER-SCHROER-23. Refresh all ownership inputs before expanding it. Do not introduce a duplicate Picard or intersection roadmap.
9. Complete the final paragraph-level closure audit, splitting any bundled property interfaces and routing each newly exposed exact lemma against current atlas stages and pinned libraries. The dependency DAG is syntactically closed only for recorded items; this is not full mathematical closure.
10. Run paper/intake validation and the structural audit again. No Lean deliverable belongs to this issue; the prototype gap is downstream design work. Never report the120 planned tests as compiled.


## Guards and verification

Preserve finite SURJECTIVE bigness, the all-subvarieties EWM inequality, direct-limit monoid perfection, Picard GROUPOIDS and2-pullbacks, genuine geometric versus topological pushouts, empty conductor, h⁰≥2 in the surface repair and every residue-field guard. For normal-target functions keep reducedness, generic dominance and normality. Formal functions must support algebraic spaces; an étale target cover is not a scheme-source reduction.

Current snapshot `277594a65a53ae5f7530539524add19c453b4e19`, 531 guarded input hashes; pinned Mathlib082e2d3 and Tau Ceti f790474. Paper/intake and structural checks pass;11,236 fresh exact diagnostics pass. The prior55,157 diagnostics were not rerun. No Lean deliverable or compilation;120 tests remain plans. Keep partial status until substantive root gaps are closed.
