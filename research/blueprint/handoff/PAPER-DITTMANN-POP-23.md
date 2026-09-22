# PAPER-DITTMANN-POP-23 handoff

Codex `codex-hjdg0j`, 22 September 2026; Refs #1099.
Status: partial continuation of PRs #1662 and #1668.

## Completed in this continuation

Reread all 19 pages of the final author version, including proofs and
references, with the same recorded SHA-256. Visually checked pp.7 and 11.
Reread Kuhlmann–Novacoski pp.7 and 9–13. Read the supplied Stacks proofs
listed in `sourceArchives` and Milne LEC pp.105–106, distinguishing its
complete coefficient-field proof from the reference-only cohomological-
dimension proof. Publisher-format collation remains undone.

Added eight exact pinned Mathlib imports and six separate proof inputs.
The report now gives full mathematical arguments for exact valuation
prolongation, coefficient descent with inseparable multiplicities,
selected-family integrality, principal-quotient associated-prime height,
associated-prime localization detection, and the normal-domain height-one
intersection. It also supplies the equicharacteristic-zero coefficient-field
argument and isolates the corrected nonreal-place cohomological bound.
These arguments are not Lean implementations.

The reviewed AutomorphicCongruences:L4 audit already plans the generic
height-one theorem. It is now a planned import, with its early algebraic
proof leaves routed there; A0-extension keeps normalization and the
selected-family integral-closure adapter. No automorphic theorem is a
prerequisite of this algebraic import.

143 items: 26 library, 6 planned, 111 missing; all missing routed exactly
once across seven routes (four source, three Part II). All 129 inherited
item IDs and all 40 D/C, 120 API and 120 test contracts are preserved.
Fresh additions were audited at main
0281c2b28ca28203dba72b8fabd661918e1da5eb. The report distinguishes new reads
from inherited source and library evidence.

Thirteen structured source findings preserve E1–E4 from the separate errata
file and add the false intermediate cd bound, inverse-language bridge,
identity-index slip, smaller notation and
tensor slips, and three bibliography corrections. The separate errata job
and its independent review were not edited.

## Resume here

1. DP23-G1–G2: read Jannsen/KS/Suwa/ILO original proof chains and exact
   odd-degree alteration base changes; acquire Cossart–Piltant's
   characteristic-two dimension-three input. Import the queued Jannsen
   paper's work when available rather than creating a duplicate.
2. DP23-G3: obtain the local-field cd_2 theorem, henselization/completion
   comparison, and the transcendence-degree proof to which Milne refers
   (Shatz). The coefficient-field proof is now exposed. Finish cohomology
   continuity and real-place descent, EKM subform/cancellation and Kato's
   graded quadratic-Witt comparison. Kuhlmann–Novacoski's decomposition-
   field, conjugate-prime and localized-integral-closure foundations remain
   open; Lemma 3.2 cites Raynaud.
3. DP23-G4: read Rumely/Pop/Poonen internal arithmetic inputs and AKNS
   coding, especially low-dimensional bi-interpretability.
4. DP23-G5: match off-a-finite-place number-field approximation and general
   divisorial discreteness. Verify normalization's algebra/fraction-field
   towers and the Lean adapters in the new proofs: embedding extension,
   repeated roots, associated-prime localization and the height-one DVR
   hypotheses. The mathematical intersection/prolongation arguments are
   supplied; do not return these to an undifferentiated source gap or
   duplicate L4's theorem in A0-extension.
5. DP23-G6–G7: independently review full-rank geometric flags, torus
   specialization and the finite inverse-language bridge; acquire the
   25-page publisher version and collate the thirteen source findings.
   Finish the inherited Part II signature audit before declaring complete.

## Preserve these boundaries

Characteristic two in dimension three is unconditional; higher dimension
uses both resolution clauses. Characteristic-two Pfister forms have
bilinear outer factors and a quadratic final factor. Root fields may be
trivial. The ball set is a union and its stabilizer an intersection.
Rank-one W_T and full-rank G_T have different uses. Normalization needs the
purely inseparable step below the separable step. Selected-family
integrality quantifies over every prolongation; one chosen prolongation
does not suffice. Exact contraction refers to valuation rings, not
independently normalized numerical values. Associated primes require the
noetherian radical-to-exact-annihilator conversion. In Proposition 3.8,
Σ contains the nonunit places, precisely as its printed Σ-unit condition
requires. A draft E5 misread the convention and was withdrawn; do not
reinstate it as an error. In Proposition 3.2, bound the nonreal
base change directly; a formally real E′ need not have finite cd_2.

## Validation

Paper checker and intake file check pass. Custom checks pass for the
143-item and seven-route DAGs, preserved IDs and API/test names, use
references, unique routing and current owner/stage/galaxy IDs. Fresh finite
regressions passed 3,055 checks covering the finite-place
condition, tensor signs, inseparable multiplicities and split valuations.
The report records the finite ranges so these examples are reproducible.
No Lean file was compiled; the 120 proposed test contracts remain
unexecuted in Lean. Source findings have no self-assigned review verdict.
