# REV-FIX-RT-RS-21 — independent review of the RS-21 fixes

**Verdict: accepted, with the corrections below.** Issue #5712;
Codex, session `codex-0HK3IJ`, 7 October 2026.
Review base: `85629d35ed9adf08fbd8297247d6e45a280910b2`.

This session did none of FIX-RT-RS-21, whose author was Codex session
`codex-rtOQ9t`. This review follows the accepted REV-RS-21 by Claude Code
session `cc-39fac3`; that review and its ten corrections remain verbatim in
`reviewHistory`. The scope is the two confirmed findings and their structural
corrections, rather than another review of the unrelated accepted decisions.

## Findings

| Finding | Verdict | Reason |
| --- | --- | --- |
| RT-RS-21/1 | Accepted after clarifying the coefficient contract | The verifier explicitly permits L3 to own its source-specific GL₂ minimal-lift application. Its distinct owner record now separates SR.5's structural family/invariant-map API, R16.2's field newvector theorem, and L3's integral line comparison. The R16.2 → L3 link resolves the supplier without reversing SR.5 → R16.2. |
| RT-RS-21/2 | Accepted after normalization and handoff corrections | AL.3 explicitly owns the general cuspidal GLₙ expansion and convergence needed by unfolding. AF.3 supplies its cusp inputs. R16.5 imports the rank-two specialization, retains its integral/classical comparison and full converse theorem, and no longer reproves the general expansion. |

### Integral essential-line comparison

The natural coefficient-change map is
`V^U ⊗_(A,lambda) O → (V ⊗_(A,lambda) O)^U`.
L3 composes it with the separately constructed representation-model comparison.
The resulting map's bijectivity and the freeness of both lines are targets,
rather than fields assumed in a proposed structure. The four test specifications
distinguish identity specialization, spherical conductor zero, Steinberg
conductor one, and a monodromy/conductor change excluded by the hypotheses.
General integral GLₙ theory remains with SmoothRepresentationsOfLocalGroups.

Freshly checked [Fouquet–Wan v3](https://arxiv.org/pdf/2107.13726v3),
p.5 and Appendix A §§6.1–6.2, pp.74–78, including rendered pp.77–78.
The last-row definition of the conductor subgroup and the two conclusions of
Proposition 6.9 agree with the fix. The coefficient contradiction recorded by
the fixer is real: residual characteristic zero makes `p` invertible in the
local ring `A`, while its image is not invertible in the integral `O`.
The intended integral setting in the JSON is explicitly a reconciliation
obligation. It does not silently amend the published theorem. The proof's
invariant-tensor and integral-freeness steps still require justification.

Checked [Emerton–Helm's author text](https://math.uchicago.edu/~emerton/pdffiles/families.pdf),
Theorem 1.2.1, Definition 4.5.9, Condition 6.1.1 and Theorems 6.2.1/6.2.5
(pp.3, 44–45, 49–51). The integral coefficient restrictions and preservation
of the ranks of all powers of monodromy are relevant suppliers. The uniqueness
statement assumes existence; its characteristic-zero-point comparison does
not establish the integral essential-line theorem. L3 must acquire a proof
covering its chosen coefficient regime before claiming closure.

### General adelic reconstruction

Checked [Cogdell's author PCMI notes](https://people.math.osu.edu/cogdell.1/pcmi-www.pdf),
§1.1/Theorem 1.1, printed pp.5–9 (PDF pp.9–13), and §2.2.2/Theorem 2.1,
printed pp.20–21 (PDF pp.24–25), including the rendered expansion theorem.
The revised contract fixes the source's smooth, unitary cuspidal setting and
the superdiagonal character, with compatible volume-one unipotent quotient
measures. The coset index is `N_(n−1)(k) \ GL_(n−1)(k)`; for rank two it
becomes `k^×`. Mirabolic induction uses a last-row stabilizer and its
last-column vector subgroup. Compact-uniform absolute convergence and a
noncompact integrable majorant are separate outputs. The referenced gauge
proof interior was not read here and remains a precisely located AL.3
proof-source obligation. Analytic continuation and tensor factorization remain
distinct results.

## Corrections made in the proposal

1. **L3 owner scope and handoff:** spell out the proposed integral coefficient
   regime, continuous specialization and `ell != p` local setting; require
   model existence, source-normalized Weil–Deligne data, all monodromy ranks
   and the common conductor. Mark the regime as needing a covering proof,
   and explicitly delimit what the checked Emerton–Helm statements supply.
2. **AL.3 owner scope and API:** specify complex coefficients, uniform moderate
   growth, unitary cuspidal/central normalization and the continuous unitary
   additive character. Write the coefficient and reconstruction formulas,
   require quotient volume one, and expose linear measure-scaling. Fix the
   mirabolic coordinate convention explicitly.
3. **AL.3 tests:** add two discriminating specifications. Doubling coefficient
   measure doubles the reconstructed series, exposing a missing normalization.
   The noncuspidal constant function on GL₂ has zero nontrivial coefficient,
   exposing omission of the cusp hypothesis. The existing five specifications
   remain.
4. **AL.3 handoff:** replace the obsolete claim that its packet is partial with
   AL.3 `not_read`. At this base the packet is complete/planned and has its own
   independent `needs_changes` review. Point to the existing
   `AL.3/global-whittaker-factorization`, `AL.3/gln-fourier-expansion` and
   `AL.3/global-rs-unfolding` nodes, rather than prescribe another expansion
   theorem. Route the coefficient/mirabolic APIs, at least three tests per
   definition, the separate majorant, and matching reader/Lean signatures to
   that owner. Its expansion node's last-row-unipotent wording needs alignment
   with the chosen last-column convention. No packet or packet review is
   changed or accepted by this restructuring review.
5. Replace the pending top-level review with this acceptance. All roadmap and
   layer decisions, link records, earlier owner records, fix provenance and
   historical review are unchanged from the submitted fix.

## Read scope and pinned libraries

Read the finding/result/verifier/fixes files, the family brief, prior accepted
review, and the relevant proposal/report clauses. Read both member READMEs
in full, together with AutomorphicCongruences, AutomorphicFormsOnReductiveGroups
and AutomorphicLFunctionsAndLocalFactors. For upstream comparison, read the
complete InductionRestriction and CompactGroups roadmaps. Inspected the three
AL.3 nodes above and its current coverage/review metadata; did not conduct
another independent review of that separate packet.

Read the reviewed AUDIT-14 rows for R16.2, R16.5 and AL.3 and AUDIT-23 for
L3. They do not certify the missing representation-theoretic targets as built.
There is no reviewed SR.5 row at this base; that is not an absence certificate.

Personally checked the complete pinned Mathlib
[Invariants.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Invariants.lean).
`Representation.invariants`, `mem_invariants`, `Rep.invariantsFunctor` and
`invariantsAdjunction` supply the carrier, functor and adjunction already used
by the plan. They do not prove arbitrary coefficient-change bijectivity.
Finite-group averaging requires invertible group order. The fix's sign-action
example over `Z₂`, reduced to `F₂`, correctly distinguishes the natural map
from an unconditional isomorphism. No new library absence claim or Tau Ceti
implementation claim is made. The Tau Ceti baseline remains `f790474`.

PDF receipts were reproduced on 7 October; all three match the fixer's hashes:

| Public version | SHA-256 |
| --- | --- |
| Fouquet–Wan arXiv v3, 103 pages | `39cee6cec8a5d56baf5c0b19dd892a571bc7945eab281d6ec9a9c14fa70294ee` |
| Emerton–Helm author PDF, 65 pages | `43079a450c3e053e96eae8851069a97528d5d976ce196431c5c6e61c07146289` |
| Cogdell author PCMI PDF, 85 pages | `09b82f9aed494d28327ed9692f5bf37e6bed229cf470e80927e0cc10ce70932a` |

## Validation and remaining work

`python3 scripts/check_restructure.py research/blueprint/restructure/RS-21.result.json`
passes. Independent scratch checks call the actual
`build.assemble(require_distances=False)` twice, with the promoted RS-21 and
with this revision substituted in the accepted proposals at the normal
integration point. Both graphs have **4,099 stages** and **4,150 graph vertices**
including 51 existing external endpoints. Edges change **10,772 → 10,774**.
Both graphs are acyclic; all 175 proposal links occur and no integration link
is skipped. Applying the revision again preserves the edge set.

The two added edges are exactly R16.2 → L3 and AF.3 → AL.3. Required supplier
paths exist; neither problematic reverse path exists. All **656 Tau Ceti stage
payloads** and its roadmap payloads remain unchanged. Scoped comparisons retain
23 layers, 17 narrowings, 44 owners, all 175 links, the complete R16.5 converse
target, and the prior review verbatim. The review edits only the two new owner
contracts and top-level review. Intake file/JSON checks and `git diff --check`
also pass.

Acceptance completes this independent review of the restructuring fixes.
SR.5/L3's coefficient, model, invariant and duality proof work, and AL.3's
declaration refinements and noncompact majorant remain with their existing
blueprint owners, as recorded in the JSON and handoff. Those obligations do
not become proved suppliers through this verdict. The historical fixes/report
counts are tied to their stated bases. No Lean file is a deliverable or changed;
no Lean compilation or library build was attempted.
