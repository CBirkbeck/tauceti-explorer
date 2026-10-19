# REV-K2SymbolsBrauer--T.3-localization-comparison

Completed independent review of #10813 for #10786, by Codex, session
`codex-sr7SnE`, 19 October 2026. Branch:
`codex-sr7SnE-review-k2-localization`. The original author was session
`codex-QcGmv4`; this reviewer did none of the original work.

Verdict: **accepted after corrections**, as a complete planning pass.
The packet remains `complete` with its scoped stage `planned`, not closed.
The review report records the source, baseline, dependency and mathematical
checks. No further work on this review is required.

## Changes delivered

- Replace the ineffective finite-field degree-three sign check with
  k=ℚ(t), R=k[[π]], x={2,t,π}. A second boundary distinguishes 1/2 from
  2, so the sign is actually tested.
- Supply all construction test kinds and add principal-divisor and
  degree-three tests. Final inventory: three new nodes, nine API entries,
  seven tests, eleven baseline declarations and three new planets.
- Reduce arbitrary finite extensions to simple steps before applying the
  Milnor base-change theorem in the two-transfer proof. Transport the
  difference to Milnor K₂ before finite descent.
- Retain the `Small.{v} k` hypothesis in the split-K₀ baseline descriptions.
- Add the packet's independent `review` object, a full report, and an
  elementary rational sign calibration to the suggested file.

## What later work must preserve

Use Φ₂=θ₂♮m, with θ₂♮=θ₂∘ε, when comparing products and boundaries.
The actual right-linear boundary has D₁[π]=1 and
DₙΦₙ=(−1)ⁿ⁻¹Φₙ₋₁rₙ. Thus D₂ is inverse tame. Transporting an exact
row to the roadmap residue convention negates both the residue coordinate
and its outgoing map. The left-[π] specialization differs from Milnor
unit-part specialization by rₙ(x){−1}; the latter uses right [−π].
Pushforward uses residue norms without extra e; pullback residues use e;
norm valuations use f.

The four imported local, Dedekind and transfer targets remain single-owned
in the earlier T.3 packet. Assembly must apply the normalization notes
already recorded in this packet. Keep T.3:symbols → T.4 →
localization-comparison, with S.3 and E.3 as consumers. No outside owner or
atlas data file was changed.

Two supplier requests remain: K.3's Dedekind torsion Serre quotient with
localization/transfer naturality, and the inherited K.7 degree-(1,1)
comparison of biexact and plus products. Two inherited gap records retain
T.2's finite-classical/stable-witness presentation inputs and T.4's generic
arbitrary-residue complete-DVR support brief. These prevent closure; they
are not unfinished corrections to this review. The finite-residue upstream
local-field roadmap does not discharge the generic DVR contracts.

## Verification

The source PDF hash matches the packet. All eleven baseline statements were
read at Mathlib 082e2d3 / Tau Ceti f790474, along with the relevant reviewed
audit, owner contracts and current read-only AlgebraicCurves and
LocalFieldsRamification interfaces. Current roadmap/Tau Ceti commits are
recorded in the packet. Neither read-only checkout was built or modified.
The explicit-node dependency traversal found no cycle; stage-level supplier
boundaries remain open.

- Blueprint check with the pinned declaration index: **0 errors, 0 warnings**.
- Corrected suggested file: **101 lines**, `lean-check` exit 0, **ten `sorry`
  warnings only**; 80 GB available before checking. No data definitions or
  replacement K-theory carriers.
- Submission path/privacy check and whitespace check pass.

All durable findings are in the review, packet and reader. No scratch file is
needed to resume any later job. This review is complete, not a checkpoint.
