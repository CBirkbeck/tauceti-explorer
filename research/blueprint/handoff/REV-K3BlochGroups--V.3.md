# REV-K3BlochGroups--V.3 handoff

Codex, session `codex-VPXw22`; issue
[#6398](https://github.com/CBirkbeck/tauceti-explorer/issues/6398); 2026-10-05.
The [bot confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6398#issuecomment-6005189322).
This is a completed independent review, not a checkpoint. No second job was claimed.

The [report](../reviews/REV-K3BlochGroups--V.3.md) and the
[packet review](../packets/K3BlochGroups--V.3.json) accept the target-level pass
after corrections: 17 nodes, 10 verified and 7 corrected, 35 API items,
27 tests, 19 confirmed baseline citations, no new nodes or planets, two
explicit gaps and one precise upstream request. All implementation statuses
remain unchecked. Source issues E101–E104 each have an independent confirmed
verdict; E104 separates the false integral inversion-cycle assertion from
the E102 rationalization typo.

The [suggested file](../suggested/K3BlochGroups--V.3.lean) elaborated via
`lean-check` with zero errors and 123 warnings, all declarations using
`sorry`. The packet checker reports zero errors and zero warnings. Independent
integer presentation calculations for F₂, F₃, F₅, F₇ and F₁₁ agree with
all named finite-field tests; the report records the method and results.
No source downloads, Lean logs or scratch artifacts are required by a successor.

The corrections are recorded individually in the report and packet. Preserve
the new distinction between the all-field angle assignment and its
size-at-least-four homomorphism. Preserve the relation quotient before
rationalizing the lecture comparison, the exact rational curve correction,
and the two distinct integral CGZ versions.

Remaining programme work, outside this completed review:

- The AlgebraicCurves dictionary must provide canonical projective evaluation
  at rational points, local DVR/fraction/residue identifications, and the
  compatibility contract, including smooth open curves. The current prototype
  exposes the exact relation containments rather than pretending arbitrary
  evaluation data meet the contract.
- Locate and read an applicable proof for vanishing of the all-curve rational
  correction over fields of size at least four, or retain the stated gap.
  The P.4 F(t)-inductive theorem has a different relation set and is now a
  contextual reference, not a prerequisite or substitute proof. F₃ is a
  proved exception with correction ℚ.
- Apply the original
  [BP handoff's assembly actions](BP-K3BlochGroups--V.3.md): V.3 owns the
  integral conventions; update HB.1 to consume the versioned published nodes
  when using the published source, keeping its finite Chern/root-of-unity
  hypotheses. Synchronize the direct stage edge and PLAN-HABIRO. P.1 owns
  the analytic function/identity and P.2 its descent; update reservations and
  analytic consumers without deleting inherited V.3 consumer pointers.
- Synchronize the read-only reader at assembly: section 7's denominator
  argument needs the torsion-killing multiple; the prototype now specifies
  separated finite-type curves; baseline count is nineteen; source issue
  E102 is the coefficient typo and E104 the integral inversion error. These
  were outside this review's named edit paths and are documented in its report.

The independent source access hashes retain the author's original provenance.
The three PDF hashes match; the dynamic Bloch HTML fetch has a different byte
hash but the cited mathematical passage agrees. The packet records this
under `reviewAccess` without overwriting the original hash.
