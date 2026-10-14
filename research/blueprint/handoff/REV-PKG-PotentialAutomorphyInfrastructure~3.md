# Handoff: completed revision-3 package review

Job #9231, `REV-PKG-PotentialAutomorphyInfrastructure~3`, completed by Codex, session `codex-JnyGZE`, on 2026-10-14. One job was claimed. The claim was confirmed at 2026-10-13 23:31:48 UTC. This is a completed fixing review with verdict **needs_changes**, not an unfinished review checkpoint.

## Done

The package README and representative Lean file were reviewed against all 123 accepted nodes and the current binding shape. Every accepted target, all 122 API names and all 90 test names remain in the README. All 32 definition targets have at least three Checks and are declared or named in the Lean closing comment. The full report is `research/blueprint/reviews/REV-PKG-PotentialAutomorphyInfrastructure~3.md`; the verdict is in the package's `review.json`.

Applied repairs:

- §§1.2–1.3 require unramified K/Q_p; the Layer 1 arithmetic applications retain ACC §4's standing field assumptions. Ramified tensor/embedding negative controls are supplied.
- §0.4 supplies the closed-alcove simplicity and Ext¹ interfaces, including the Steinberg endpoint; §0.6 remains the separate strict-duality target.
- §5.3 requires q's square root congruent to 1, nonzero torus roots, a nonzero module for nonzero spherical projection, and split distinct roots for the final comparison maps. The zero-module, opposite-square-root and F₂₅/F₅ counterexamples are recorded.
- §2.10 specifies the continuous nonabelian Galois H¹ cocycle quotient and its API/three Checks. Existing Mathlib Čech and current Tau Ceti abelian H¹ are cited with their actual scopes.
- ALS references distinguish current duality ALS.5a and automorphic comparison ALS.5b. Conditional triangulability and Franke inputs are exposed, not silently dropped.
- Spectral support through the nilpotent Hecke quotient and the direction of the Bruhat trace sum are explicit. The suggested file uses `import Mathlib`, with no Tau Ceti import or unavailable arithmetic carrier construction.

No packet, supplier package, campaign file, library or upstream roadmap was edited. No duplicate target was removed. The pre-existing current-library local-field solvability deferral remains.

## What remains for a package revision

The review report's R1–R3 are the acceptance requirements:

1. **R1, ordinary primary inputs:** verify Geraghty's published Lemmas 5.2 and 5.7, with exact U^(j) eigenvalue normalization and both nonsplit base-change/descent directions. BLGGT §2.1 and Qian's proof of Lemma 4.3 verify the definition and the use of the input, not those primary statements. Package §§3.46–3.47 and §§5.21/5.23 are the affected targets. Do not treat the split local proof as the nonsplit theorem.
2. **R2, extremely weak systems:** verify Henniart's E-rational semisimple abelian locally algebraic classification before de Rhamness is known, and Larsen's density-one hyperspecial maximality after rationalization of extremely weak systems. Add the exact compatible-system exports. Current CS §1.9 assumes de Rhamness; §§1.18–1.20 use the stronger rational weak carrier. Larsen–Pink Definition 6.5 and Proposition 8.9 were checked and supply the separate unramified-monodromy input, not maximality. Preserve prime-field SL₂, not full-residue-field SL₂.
3. **R3, conditional ALS inputs:** obtain owner contracts discharging triangulability for the rounded compact Borel–Serre spaces and FrankeInput for the groups/coefficients used. ALS.2.4 and ALS.5b.8–ALS.5b.9 state these as hypotheses. Finite-cell tower freeness, perfect duality, rational amplitude and automorphic realization consume them. Galois attachment is already routed to its named lower owner. Preserve the unconditional lifting targets; do not assume their desired comparisons arbitrarily.

The seven accepted gap entries were considered. The integral highest-weight and PGL₂-form missing-owner leaves now have local sourced target chains; arithmetic signatures are absent under the binding representative-only Lean rule. Uniform arithmetic verification and the separate ordinary Satake polynomial-law target remain explicit. R3 affects the former's finite-cell input. The review does not claim that any of those planned results has been formalized.

## Ownership move and current baseline

§2.6's nonexistent upward `PL.0/auxiliary-cm-extensions` reference was replaced by this roadmap's §2.5 `auxiliary_cm_extension_prescriptions`. Future consumers of those local/CM prescriptions should use that owner, not the upward alias. The continuous nonabelian Galois H¹ interface first needed for PGL₂ forms is specified here; any later arithmetic-form consumer should import it rather than duplicate it. It differs from the existing Čech and abelian carriers.

Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Expected pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. Current read-only roadmap commit checked: `0d144d044dacebca17b654695b6f1ad58f159b27`. Current Tau Ceti checked: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Relevant actual hits and all nine newer/four Completed checks are documented in the report. No build was run in a read-only current checkout.

## Verification receipts and resumption

`lean-check` exited 0: 47 `declaration uses sorry` warnings, zero other warnings and zero errors. The 546-line file has nine theorem declarations and 35 examples; no sorry-bodied data definition. Only closing-comment wrapping and a projector docstring changed after that semantic check. `scripts/check_sorry_data.py` passed. `scripts/check_blueprint.py` on the unchanged accepted packet reported zero errors and zero warnings. The final intake check covers the README, Lean, metadata, verdict, report and this handoff; `git diff --check` passes.

Primary source locators, the reproducible 15-node sample and the 134-subsection adversarial table are in the report. Cleared Jantzen, Platonov–Rapinchuk–Rapinchuk and ACC copies were read in place under the library INDEX rules; none was copied or excerpted. The ordinary, Henniart and Larsen primary leaves remain unread. Do not report them as verified. All notes needed for the next revision are in this handoff/report; there is no dependency on scratch files. Resume with R1–R3, retaining the repairs and representative-only Lean shape. Do not restart the old exhaustive-signature demand.
