# Handoff: REV-DESIGN-KloostermanMomentsAndPotentialAutomorphy

Codex session `codex-bgObmW`, issue #3556, 2026-10-19. Completed independent
review, not a checkpoint. Claim comment 6258062599 was confirmed by the bot
in comment 6258064023. The only claimed job was this review; the branch is
`codex-bgObmW-kloosterman-review`.

The verdict is **accepted as a complete planning pass**, with 48 verified and
14 corrected targets, no added targets and no unverifiable targets. The
inventory is 62 nodes, 85 API items, 63 tests, 59 planets, seven pinned baseline
declarations, twelve planned stages and zero closed stages. Nine gaps and
thirteen supplier requests remain. The full report is
[REV-DESIGN-KloostermanMomentsAndPotentialAutomorphy.md](../reviews/REV-DESIGN-KloostermanMomentsAndPotentialAutomorphy.md),
and each node's individual verdict is in the packet's `review.checked`.

Corrections synchronized in the packet, reader and roadmap:

- The conjectured sign `(−1)^floor(k/8)` belongs to the factor at two. The
  predicted global sign also contains the away-from-two exponent v′ from FSY
  Remark 5.37, p. 56. At k=8 the two predictions are −1 and +1 respectively.
- R06.2 uses the opposite Hodge–Tate labels. The reader and compatible-system
  target now explicitly use `HT_KM = −HT_R06`, preserving the representation
  and filtered period functor. Five exact existing period nodes replace a
  redundant stage request, reducing fourteen requests to thirteen.
- Rational perverse coefficient extension now cites EDC.6 as well as the
  torsion-coefficient EDC.5 theorem. The étale analogue is no longer listed as
  a supplier of a holonomic middle extension; that missing input stays G1.
- The normalized sheaf directly imports the purity target. The odd conductor
  proof uses exactness of finite-inertia invariants, rather than an
  unsupported local Frobenius semisimplicity assertion.
- Five mixed-source citations now separately attribute FSY and XZ. FSY's PDF
  length is 74 pages, with all theorem locators unchanged. AddChar's baseline
  description now states its actual weaker monoid assumptions.
- E1–E9 each have a confirmed independent verdict. E6 now identifies the
  erroneous unshifted i* display and expressly preserves the correct i!
  display. E9 remains a proof gap, not a disproof of Proposition 5.23.

For the most substantial remaining issue, G6/E9, k=9,p=3,a=3 has critical
value 18 and smoothing thickness two. The inspected RD.7 comparison assumes
unit thickness one after adjoining sqrt(−p). A further semistable resolution
or comparison argument is still required. The de Rham and stated good-prime
crystalline assertions do not use that missing step. G3, G4, G8 and G9 still
identify original sources not read at proof level. No restricted book was
used in this review.

The report records the seven independent pinned declaration checks, exact
supplier checks, current upstream/library ownership checks and validation.
The blueprint checker reports zero errors and warnings. The unchanged compact
suggested Lean file elaborated with `lean-check` at the pinned shared build,
with only its 22 expected `sorry` warnings; the placeholder-data checker
passed. It has 174 lines and no data placeholder. Reader consistency, both
dependency DAGs, numerical examples, the five-file intake check and
`git diff --check` passed. No Lean
server or upstream build was started. No source files or passages are part of
the deliverables.

The next programme action is to route the recorded supplier extensions and
package the accepted plan when the upstream dependency requirements permit.
Do not replace the even two-adic invariants with conjectures, infer all local
factors from weak compatibility, or infer cuspidality without irreducibility.
No mathematical work is left pending for this review itself. Scratch sources
and checks are deleted after the PR submission checks; all durable findings
needed by another worker are in this handoff, report, packet and reader.
