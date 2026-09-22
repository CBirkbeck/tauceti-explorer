# Handoff — PAPER-CADORET-HUI-TAMAGAWA-17

Agent Codex — codex-a71f92. Refs #1157. Status: partial.

## Saved work

- Full 32-page official published text read, §§1–11 and references; provenance/hashes in JSON/report.
- 119 interfaces: 7 library, 8 planned, 104 missing; every missing item routed exactly once.
- Seven routes: four Part II extensions (geometric monodromy, Nori/integral models, integral Schur functors, uniform integral weights) and source additions to R02.1–2, SF.2 and EDC.2.
- Both semisimplicity proofs separated; all multi-part main results split. Item116 supplies total-cohomology CRT projectors, with a noncircular dependency spine.
- Pinned library statements and relevant reviewed audit entries read. Existing rational Schur/Weyl constructions and field-level group predicates are not replanned.
- Four unreviewed source findings: compact-support subscript, closed-point membership, Theorem9.1 small-prime proof scope, and BT84 bibliography.
- Exact finite certificate in the report; no Lean file requested or compiled.

## Resume

- G1: Read and verify the full primary external inputs, not just CHT's use: Gabber/Suh, CT13/CT16 (now published), Nori Theorem B, Jantzen Proposition 3.2 and Larsen95b, Larsen–Pink92/95, Milne–Ramachandran. Larsen10 Definition5/Lemma6/Theorem7 statement and initial proof were checked directly; its remaining proof is not closed.
- G2: Turn item116's CRT weight-projector argument into a fully typed lattice/subquotient proof; combine the finitely many degrees and ranks, fibre powers, shifts and geometrically trivial determinant twists to obtain a single bound independent of the subquotient.
- G3: Establish canonical versus explicit continuous H¹ comparison for compact coefficients, continuous splittings, the exact reduction/rationalization sequences and affine-curve cd≤1 on the correct coefficient carrier.
- G4: Check Bruhat–Tits big-cell hypotheses over ramified splitting O_E, affine-model hypotheses in Lemma8.1, schematic closure under base change, special Lie base change and simply connected isogeny extension. Review E3 before any small-prime export.
- G5: Verify CT16 Lemma4.1's uniform pointwise tensor stabilizer, including separate tensor bounds and scheme-level equality. Do not cite it as Nori TheoremB or infer it from finite point sets.
- G6: Read Larsen–Pink Γ-regular and common-Frobenius statements directly, prove the arithmetic torus lift and discriminant exclusion, and justify uniformity of the single chosen closed point across coefficients.
- G7: Resolve the precise rational-coefficient ℓ quantification and finite-extension stability in Corollary11.1/MR04 Lemma3.1, with both complementary Tate assumptions and integral cycle saturation.
- G8: Reconcile any overlapping future generic Lang/Tits/finite Lie-type simplicity or exterior-adjoint invariant owner at design time. CFSGStatement L3 is a carrier roadmap and explicitly does not prove simplicity. Library nonexistence claims are scoped to this pinned search, not all future work.
- G9: Expand suggested files/API/tests into reviewed blueprint packets and compile them against the pins. No Lean file was an issue deliverable; no Lean compilation or formal proof is claimed here.

Start with G1/G5/G6/G7 primary statements and G4/E3. Do not erase the partial marker just because the missing items all have routes. Do not turn geometric semisimplicity into arithmetic semisimplicity or almost hyperspecial into hyperspecial.

## Checks

Passed against fresh main 8e12351e5a49d981cf752ddfc8435a1a75ab326f: paper checker; all 104 missing items routed exactly once; acyclic 119-item dependency graph; all 9 tests.test_check_paper tests; intake check-files (3 files, 0 problems). Binding instructions, reviewed library coverage and atlas were unchanged from the extraction snapshot. The mathematical certificate passed with 166 root-system products; 4714 coefficient witnesses; 4356 exp/log group laws; 84 determinant splittings; 162 projector entries. Formal Lean compilation: not attempted and not claimed.

Only the two issue deliverables and this handoff are submitted. Independent review is required; no findings have been self-confirmed.
