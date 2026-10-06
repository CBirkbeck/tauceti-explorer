# REV-EllipticRegulators--ER.5 handoff

Issue #6438; Codex session `codex-PVOz7e`; independent of planning author
`codex-0vAUOp`. Review completed 2026-10-06 and accepted after corrections as
one complete target-level planned pass. This is a finished review, not a
checkpoint. No further job was claimed.

Deliverables are the corrected ER.5 packet and suggested file, the independent
review report and this handoff. The packet has ten new nodes, eight retained
parent imports plus two finer AL imports, eight confirmed baseline declarations,
nine API items, seven definition tests, two new planets, five owner requests
and no local mathematical gap. Every new node has an independent verdict:
six verified, four corrected. All implementation statuses remain unchecked.

The main correction distinguishes Γ from the opposite-kernel Γ_op=−Γ:

\[
L(2,\psi)=\pi\Gamma R_q(U)/(iy^2C^4)
        =-\pi\Gamma_{\mathrm{op}}R_q(U)/(iy^2C^4).
\]

Both formulas have the same coefficient. The two |μ| factors cancel. The
same-level classes supply C³; the Fourier comparison supplies C. Distribution
for C=f̄ḡ supplies prefactor g, and indexes all residues W invertible modulo f.
No natural conjugation on ℂ/O is inferred for an arbitrary rational twist;
the chosen real-structure transport is a required incoming CM.1/CM.2 datum.

The raw Gauss coefficient now has pointwise congruence API and a Gaussian
generator-change test. Direct prerequisite omissions were filled. The Gaussian
row proof now justifies locally uniform differentiation. AL.1's existing
unramified/ramified local-factor nodes replace the redundant whole-stage
request. Away from the conductor their unitary parameter is ψ(P)/N(P)^(1/2)
at argument s−1/2. At conductor primes the local factor is 1; the ideal weight's
zero extension is not a local quasi-character taking value zero.

All eight baseline statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Exact ideal-congruence/cyclotomic
checks give Γ=2,3,7,28 at levels 4,6,7,14, and W/orbit counts 8/2,18/3,42/21,
168/84. At level 14 full units give 42/21 instead. All character products,
Fourier support norms and unit generator changes were checked. Independent
60-digit, 40-term q diagnostics reproduce the reported values; the Gaussian
odd-row sum through 79 agrees within 10⁻⁵⁰. These diagnostics carry no certified
error bound. Public source URLs, hashes, locators and the inherited E7/E8/E9
verdicts are retained in the packet and report; Bloch collation is limited to
the public HTML transcription, with damaged bars checked algebraically.

Validation: packet checker 0 errors/0 warnings; revised suggested file
elaborated through `lean-check` at pinned Mathlib, exit 0 with exactly 24 expected
`sorry` warnings. Tau Ceti object files and CM/K₂ carriers were unavailable;
their illustrative signatures are comments/omissions, not compiled results.
No Lean library build or language server was started.

The remaining work belongs to the owners and roadmap assembly. Fulfil the five
CM.1/CM.2/CM.4 and GlobalNumberFields layers 9/10 requests. Then apply the packet's
`coverage.remaining` edits to the read-only parent and reader:

1. Wire the parent L-value/nonvanishing targets to the new certificates and
   remove the obsolete natural-number Euler-product citation.
2. Fix the parent conductor API to ideal equality f̄O=fO.
3. Add the selected real-structure compatibility to the parent U descent API
   and tests, with the actual Galois-image qualification.
4. Replace the broad AL.1 request/edge with its two finer imported nodes and
   update reader API/test/request lists.
5. Correct the reader's opposite-kernel paragraph after the boxed L-value
   theorem using Γ_op explicitly. Preserve the W index and stage-text proposal.

The part's custom import metadata does not apply these edits automatically.
The complete report is [REV-EllipticRegulators--ER.5.md](../reviews/REV-EllipticRegulators--ER.5.md).
This finished job needs no scratch files for continuation.
