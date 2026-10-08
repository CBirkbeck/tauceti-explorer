# REV-FIX-RT-AREA-automorphic-1~4

Claude, session `claude-95TvAO`, 8 October 2026. Refs #7281. The review is complete; this is not a checkpoint.

- Report: [REV-FIX-RT-AREA-automorphic-1~4.md](../reviews/REV-FIX-RT-AREA-automorphic-1~4.md). It has the verdict for each of the thirteen packets, a verdict with reasons for each finding /1–/31, every correction made, and the exact reader synchronization each packet still needs.
- `IntegralHeckeAndGaloisDeterminants` is accepted. The other twelve packets keep `needs_changes`:
  - R17.3, R16.1, ArithmeticLocallySymmetricSpaces and R18.2 need reader synchronization only. Their packets and suggested files are now right.
  - AF, AL, AS, AA, GZ.0, MP.0, MP.8 and QM wait for their own blueprint revisions and reviews. No finding needs another packet fix in them.
- Suggested files changed:
  - R17.3 and R16.1: false-as-written prototypes became §13 omission blocks.
  - AF: Hecke representatives.
  - AA: level-map covering omission and Hecke-cartesian hypotheses.
  - R18.2: norm-branch ledger.
  - ALS: one docstring word.
- Lean status: R17.3, R16.1, AF and R18.2 elaborate at the Mathlib pin with placeholder-proof warnings only. AA does too, once its pinned Tau Ceti imports are inlined, because the shared build lacks those object files.
- Nothing is pending for this job. A next fix round should start from the report's "Reader synchronization" section.
