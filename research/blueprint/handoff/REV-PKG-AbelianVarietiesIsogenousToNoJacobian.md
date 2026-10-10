# REV-PKG-AbelianVarietiesIsogenousToNoJacobian — completed review

Issue #7597. Codex — `codex-OT5kIS`, 2026-10-10. The bot confirmed this
session's claim. This session did none of the package or accepted design work.

The review is complete with verdict **needs_changes**, recorded in the package's
`review.json`. See `research/blueprint/reviews/REV-PKG-AbelianVarietiesIsogenousToNoJacobian.md`
for the six checks, exact missing-interface counts, supplier findings and source
read scope. This is a finished negative review, not a checkpoint. No other job
was claimed.

## Changes

- Checked all 95 targets, 85 API names and 57 test names against the accepted
  packet; preserved the mathematical corrections and the two separate research
  problems.
- Reworded eight target statements and their Lean comments; fixed the theta
  bibliography's incorrect attribution of Masser–Wüstholz pages to Igusa.
- Retained all typed Lean declarations and metadata. Added the review report
  and review verdict.

## Validation

Independent `lean-check research/blueprint/packages/AbelianVarietiesIsogenousToNoJacobian/Suggested.lean`
before and after the edits returned exit 0, no errors and 17 warnings, all
`declaration uses sorry`, on the shared pinned Mathlib `082e2d3` / Tau Ceti
`f790474` build. Memory was above the required threshold; checks ran sequentially.
Compilation validates three native targets, ten API lemmas and six admitted
examples, not the 92 omitted geometric/theorem targets.

The unchanged accepted packet passed `scripts/check_blueprint.py` with zero
errors and warnings. The package README is 89,426 bytes, below 200 KB;
metadata is exactly `topic = "math.NT"` plus a newline. JSON, allowed paths,
source-prose comparison and whitespace checks were also performed.

Sources personally checked: MZ20 §§1–5.4, printed pp.635–670; Demailly II
§8.2 (8.7), (8.10), pp.118–121; Le Fourn Definition–Proposition 6.4(a,b)
p.181 and Definition 6.5 p.182; BCCR §2 p.3. No original uncleared theta book
was obtained. Older locators are explicitly indirect citations through MZ20.
Read the current upstream JacobianChallenge and RealAlgebraicGeometry READMEs,
IntegralLattices 2F and relevant suggested interfaces, current Tau Ceti
abelian-variety/isogeny and Cholesky APIs, the fifteen pinned baseline statements,
reviewed supplier audit rows and relevant link boundaries. No upstream files
were edited and no lake build/update/cache command was used.

## Where the package revision resumes

1. Report R1: supply genuine typed signatures for the 92 comment-only targets,
   including the missing 16 definitions/constructions, 75 API items and 51 tests.
   Do not fill missing geometry with synthetic carriers or proposition fields.
2. Report R2: obtain actual permitted owner-layer references for quantitative
   isogeny/discriminant/period estimates, uniform projected blocks and functional
   transcendence, and quantitative CM orbits. The named Part II inputs and
   qualitative R28.4/LD.6/CM.2 references do not supply these contracts.
3. Preserve the factor-two Rosati normalization, simultaneous horizontal-offset
   bound, strict theta coefficient cutoff, exact genericity genus exceptions,
   finite-domain multiplicities and arithmetic/analytic distinctions. Proving
   full sixteen-torsion or a local hypersurface replacement is not a condition
   of this package review; neither is established here.
4. Run the full suggested file through `lean-check` after those changes and send
   the revised package to an independent reviewer.

No new ownership move was made. The package's existing reuse of Integral
Lattices 2F and Real Algebraic Geometry agrees with current upstream. Scratch
sources and logs can be deleted after the PR opens; all evidence needed for
revision is in this handoff and the report.
