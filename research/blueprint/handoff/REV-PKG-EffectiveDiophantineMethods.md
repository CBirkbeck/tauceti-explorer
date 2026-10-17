# REV-PKG-EffectiveDiophantineMethods handoff

Completed independent fixing review, **accepted**, by Codex session `codex-cDevhG`, 17 October 2026, issue #10087. The author was session `codex-n7dGml` (#10095); this session did none of that packaging job.

The durable review is [the report](../reviews/REV-PKG-EffectiveDiophantineMethods.md); the machine verdict is [review.json](../packages/EffectiveDiophantineMethods/review.json). All 178 targets and 507 associated API entries are retained. The report records all target-level adversarial checks, the fifteen sampled source passages, twenty Lean signature comparisons and the current-library ownership decisions.

Corrections are in the package README and Suggested.lean:

- Optional affine LLL witnesses reject a nonzero target inside the lattice.
- Signed discrete-log adapters require a sign killed by the exponent, include the trivial powered subgroup, and handle an exact zero before totalized rational valuation.
- Root perturbation uses geometric roots with multiplicity and an explicit Weierstrass root-count/cluster adapter.
- Q_p valuation certificates require local degree one, e=f=1; complex box norm minima use distance to zero rather than corner minima.
- Shared CM application assumptions replace the upward CM citation and remove the dependency cycle through the class-number application.
- Torsion classification uses a finite good-reduction group order as an exact cutoff, without an unsupplied Mazur theorem.
- Added separate light-definition boundary checks and completed the closing definition inventory.

Validation: final independent `lean-check` exited 0, with **50** warnings, all declaration-uses-sorry, and no errors or other warnings. Suggested.lean has 428 lines, eight light definitions, one structure, twenty theorems and thirty examples. All definition/construction targets have at least five Checks bullets. The target/API/internal-DAG audit passes. The unchanged packet checker exits 0 with zero errors and one existing `Finset.mem_filter` index-spelling warning. Intake-file and whitespace checks pass. Metadata remains `topic = "math.NT"`.

The representative pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The overlap audit also read current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, the nine newer current roadmaps and relevant Completed roadmaps. Existing real-algebraic root theory, integral-lattice foundations, local-field logarithm convergence/isometry and Weierstrass preparation remain imports. No additional duplicate target was removed and no upward ownership move was made.

The unused Prickett attribution remains unrecovered; the active height/index source is Siksek's public author preprint. The random sample and the 1993 Tzanakis–de Weger correction were read directly. Matveev's additive-log formula was checked directly, correcting the interpretation in the earlier author's handoff without editing that historical note. No private or uncleared source was copied into the repository.

Nothing remains for this review job. Future formalization must prove the signatures, implement the README constructions and supply/replay the explicitly conditional application transcripts; none is claimed implemented by a sorry-only build. No numerical replay of the full BDMTV, Thue–Mahler, S-unit or small-curve catalogues was performed. The theorem hypotheses retain the needed rank, analytic, CM and arithmetic data. No packet or upstream roadmap was edited.
