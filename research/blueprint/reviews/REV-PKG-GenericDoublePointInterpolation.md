# Independent package review: GenericDoublePointInterpolation

Verdict: **accepted**, after the corrections below. Reviewer: Codex (GPT-6),
session `codex-ERTaA7`, 10 October 2026; job #7604. This session did not participate in the earlier package-authoring job.

The input was the accepted plan in
[GenericDoublePointInterpolation.json](../packets/GenericDoublePointInterpolation.json),
and the three package files in
[GenericDoublePointInterpolation](../packages/GenericDoublePointInterpolation/).
All six required checks pass. Acceptance concerns the roadmap specification
and its suggested signatures; the mathematical proofs remain to be implemented.

## Corrections

The one-subspace cubic base statement left its on-subspace support count
implicit. It now states the two cases separately: in projective dimension 5,
three double supports on L, six outside L, and a further length-two subscheme
inside a double point with trace length one; in dimension 7, seven on L and
eight outside, without a remainder. These are the specializations of
[BO, Proposition 5.4, §5, printed pp.10–11](https://arxiv.org/pdf/math/0701409v2)
and agree with the recovered finite certificates and the neighboring recursion.
The quartic projective-dimension-5 statement also had two missing spaces;
its wording now reads normally. No mathematical target was removed or added.
Suggested.lean and metadata.toml needed no changes.

## Required checks

1. **Upstream form.** Read the worker rules, PROTOCOL §§5,13,20 and
   UPSTREAM_GUIDE, and the current upstream AlgebraicVectorBundles and
   RealAlgebraicGeometry roadmaps. The introduction, scope, native-library
   baseline, conventions, six layers, exact targets, APIs, tests, prerequisites
   and numbered source locators follow that form. The final README is
   **94,920 bytes**, below the 200 KB cap.
2. **Plan fidelity and ownership.** Compared every one of the **77 targets**,
   including their hypotheses and direct dependencies. The six layer counts
   are 6,14,10,18,20,9. All **14 definitions/constructions**, **42 API entries**
   and **42 tests** appear in their respective target blocks. Every internal
   plan prerequisite is linked, all local links resolve, and there are no
   forward prerequisite links. The characteristic-zero geometric convention,
   weaker ring/field algebraic hypotheses, distinct-support conditions,
   critical integer division, partial overfilled trace and exceptional triples
   are retained. The final generic theorem uses r,n≥1, d≥5 and
   n(r+1)≤choose(r+d,d); it does not assert interpolation for every distinct
   tuple. The four supplier interfaces and the EffectiveBoundsCompactModels
   and IntegralLattices boundaries match the accepted plan. There is no
   separate GenericDoublePointInterpolation link map to reconcile.
3. **Sources and own wording.** Read the public BO v2 material used here
   (§§1–6, printed pp.1–19, and the opening univariate observation in §7.1,
   p.19), and the published
   [Couveignes §3, printed pp.491–493](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).
   Checked the target locators against these versions, including the cubic
   bases, differential-Horace branches and final quartic induction. The
   package distinguishes authored native reformulations and finite witness
   replacements from source results. The degree-five endpoint comes from
   BO, rather than the narrower degree range in Couveignes's application.
   The pair-of-subspaces hypothesis remains general, and the ambient
   dimension in the Proposition 5.3 base remains 7. The document develops
   mathematical layers in its own words, with no source passage or
   section-by-section source summary.
4. **No process language.** Inspected the complete README and Suggested.lean
   and scanned the README for packet, job, review, checkpoint and coverage
   terminology. None occurs. References name mathematical owners, layers and
   existing declarations.
5. **Lean and native vocabulary.** Ran
   `lean-check research/blueprint/packages/GenericDoublePointInterpolation/Suggested.lean`:
   **exit 0; 141 `declaration uses sorry` warnings; no errors or other warnings**.
   The checked file is unchanged by this review. Read its declarations against
   the README, including the strengthened full-coordinate examples, quotient
   algebra, transported coefficient metric, integer Horace inequalities,
   exception scheduler and native affine-scheme principal open. The standard
   opening note identifies these as nonexhaustive suggestions. The closing
   inventory explicitly identifies the geometric interfaces and two
   definition APIs/tests omitted from the Lean file; the complete contracts
   remain in the README. No unavailable geometry is replaced by an arbitrary
   Prop field or a Prop-valued admitted definition.
6. **Metadata.** The entire file is the fitting single line
   `topic = "math.AG"` followed by a newline.

## Additional verification

Checked the actual cited polynomial, square-zero, Chinese-remainder, rank,
finite-grid and spectrum APIs in the pinned Mathlib sources. The current
Tau Ceti total-degree module is cited at its actual newer commit and is
correctly treated as existing material; it is absent from the pinned Tau Ceti
snapshot and is not imported by Suggested.lean. Searched the nine upstream
roadmaps newer than the atlas snapshot, including their Lean suggestions,
and the current Tau Ceti library for this development. Existing bounded-space
and general geometry/metric APIs are reused; no interpolation development was
found to remove from this package. The reviewed atlas library coverage has no
separate entry for this new roadmap.

Recovered and authenticated the **39 authored evidence artifacts** from the
existing design handoff. `verify_certificates.py` reconstructed all **22**
integer matrices, checked their incidences, support distinctness and modular
ranks, and reproduced the collinear degree-five rank **11/21**. The package
handoff's Fraction helper passed **430** rational incidence/transversality
checks and the frame-rank checks. `arithmetic_check.py` passed **2,585** critical
cases for 3≤r≤60 and 5≤d≤40, plus its quartic cases. This finite sweep is
supplemental evidence, not a proof of the unbounded numerical scheduler.

`python3 scripts/check_blueprint.py research/blueprint/packets/GenericDoublePointInterpolation.json`
reported **0 errors and 0 warnings**. The accepted plan's ten implementation
refinements and four precise supplier requests remain intact; this review
neither declares them formalized nor changes the original plan or reader files.

`python3 research/blueprint/intake.py check-files` on all six deliverable/handoff
paths returned **6 files, 0 problems**; `git diff --check` also passed.
