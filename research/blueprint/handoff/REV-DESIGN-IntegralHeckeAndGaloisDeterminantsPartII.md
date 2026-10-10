# Handoff: independent review of Integral Hecke Part II

Issue #3551, job `REV-DESIGN-IntegralHeckeAndGaloisDeterminantsPartII`.
Agent/session: Codex / `codex-CdIfiC`. Completed review, 10 October 2026.
Verdict: `needs_changes`; this submission is not a checkpoint.

The report and packet contain a complete per-node review: 43 nodes, 24 verified,
18 corrected, one unverifiable. All 20 original baseline declarations were checked at the
pins; two existing valuation declarations were added. All 18 prior source issues have
verdicts; three source corrections were added. The packet has two explicit gaps and 19
supplier requests. No new nodes or formal proofs were added.

Corrections already applied: arbitrary tame-level torus invertibility, Siegel convolution
volume, arithmetic-normalization factors, factorization freeness/étaleness, ordered
resultants, local group-identification direction, place-dependent imaginary quadratic
subfields, compact gluing of independently chosen nilpotent quotients, parabolic-intersection
decomposedness, and misleading tests. The Lean prototype now requires finite residue fields
where needed, wraps existing DVR order of vanishing, and uses an actual q-unit witness for
the modulus character. It compiles with the genuine Tau Ceti Hecke convolution import.

Resume a revision at these two precise obligations:

1. `IHR.7/auxiliary-characters`, G1. Supply an odd-prime-order global-character theorem with
   prescribed unramified Frobenius values at finitely many places, permitting ramification
   elsewhere but avoiding a prescribed finite set. Deduce both separating characters and
   their disjoint rational-prime ramification by enlarging the avoidance set for the second.
   ACC23 Lemma 3.2.1(2)–(3), pp. 956–957, omits that construction. ClassFieldTheory layers
   11–12 and Chebotarev layer 10 do not already provide the local prescriptions. Cite a
   precise freely readable theorem and prove the deduction; do not restore the former
   unsupported Kummer-independence sentence.
2. `Suggested.lean`, G2. Finish the omission ledger's actual signatures, including the
   IHR.2 representation theorems, unitary tame level and polynomial, full factorization
   theorem, inertia results, and global IHR.5–IHR.7 declarations. Import honest owner
   carriers rather than inventing `Prop` placeholders. Check every packet API/test and
   named theorem against actual Lean declarations. Compilation of the current prototype
   does not establish that coverage.

The reader file `research/blueprint/readmes/IntegralHeckeAndGaloisDeterminantsPartII.md`
was not an authorized deliverable of this review. Give the revision that path and synchronize
all corrections and gaps before packaging. In particular update its invertibility proof,
normalization, ordered resultant, gluing, decomposedness and compilation claims. The corrected
packet is the review record; the reader's old definitive label does not validate its old proof.

Ownership requiring the manager's attention: PA.0's ACC23 Theorem 2.4.8 needs the ramified
objects from IHR.1/IHR.3/IHR.5. Retain the packet's proposal, resolve it in the bundle's
prerequisite graph, and do not duplicate an upstream roadmap. Current upstream IHG.4 already
owns `Theorems.compact_determinant_gluing`; the added request refers to that existing contract.
Current ClassFieldTheory, rather than LocalGaloisGroups, owns the Weil-Artin comparison, with
its finite-ℚ_ℓ reciprocity scope and topological abelianization.

Checks: blueprint validator reports 0 errors/0 warnings; `lean-check` exits 0 at Mathlib
`082e2d3` and Tau Ceti `f790474`, with only `sorry` warnings and the genuine import.
The report records source URLs, printed pages, theorem numbers, all baseline locators,
corrections and limitations. No scratch source or log is needed by the next worker.
