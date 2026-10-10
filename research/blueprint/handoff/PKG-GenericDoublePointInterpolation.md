# PKG-GenericDoublePointInterpolation — complete package

Codex (GPT-6), session `codex-duu2IN`, issue #7539, 2026-10-10.
The [claim comment](https://github.com/CBirkbeck/tauceti-explorer/issues/7539#issuecomment-6098237261)
was confirmed by the [bot](https://github.com/CBirkbeck/tauceti-explorer/issues/7539#issuecomment-6098238695).
Base commit: `8ece87df7a53dcbc4ca17840f3325d9747528f04`.
Branch: `codex-duu2IN-generic-double-point-package`.
Only the three package files and this handoff change. No second job was claimed.

## Delivered

The README packages all 77 accepted targets in GI.0–GI.5, grouped into 27
mathematical subsections. Every target has its statement, direct prerequisites,
source locator and a proof route. All 14 definitions/constructions retain their
42 API items and 42 discriminating tests. Internal target links resolve. Its
introduction fixes scope, conventions, suppliers, low-degree exceptions and the
degree-5 endpoint. The document is about 95 KB and contains no programme
status or source passage. Metadata is `topic = "math.AG"`.

The corrected accepted packet is the source of truth. Its 10 implementation
and proof-refinement gaps and four supplier requests remain in force; packaging
does not close any of the six layers. The package is ready for its independent
package review, rather than a checkpoint.

The suggested file extends the original admitted signatures using native
bounded polynomials, square-zero algebras, ideal quotients, linear maps and
matrices. It represents 12 of the 14 definitions/constructions, their 36 API
items and their 36 test contracts; there are 55 Lean examples, including
stronger versions of several original projection-only examples. It adds actual
transported normed/inner-product instances, the integer-coordinate lattice
interface, modular determinant lifting, Euler comparison, numerical Horace
bounds, the exception scheduler, selected minors and their degree bounds,
principal opens, integer-grid and parameter-pullback statements. The affine
parameter scheme is native `Spec`; evaluation is an actual `Spec k` morphism
over `Spec k`, with its evaluation-kernel image stated explicitly.

The two unrepresented definitions are `restrictionRank` and `movingSupports`.
Their six API items and six tests are fully specified in the README. The final
Lean comment inventories the other omitted geometric signatures: genuine
projective twisting sections and their affine restriction comparison,
residual/trace systems, curvilinear proper limits, contact/secant geometry,
finite base configurations, and differential-Horace moving families and
contradictions. These require the specified owning interfaces. Nothing is
replaced by an opaque geometric carrier, a freely chosen proposition field or
an assertion-valued admitted definition. All proposed mathematical results
and examples remain admitted; elaboration does not prove them.

## Reconciliation and source scope

The accepted review corrected the packet but could not edit the original reader.
This package follows the corrected packet, including the general distinct
support hypotheses, the selected-partial-trace hypothesis, the Step 2 residual
hypotheses, and all three induction hypotheses in both contradiction branches.
The packet, original reader and original suggested file were not changed here.

BO Proposition 5.3 is used for a general pair of codimension-three spaces,
never arbitrary or coincident spaces. Its seven-dimensional base is in P⁷.
These preserve the accepted E2 omitted-hypothesis finding and E1 ambient-space
misprint correction. No new erratum claim or communication was made. The
package also makes explicit r≥1,d≥1 for the hyperplane rank inequalities and
ordinary Horace estimates: the N(r,d−1) convention uses nonnegative degrees.
The accepted statement had left that positive-degree scope implicit. This
clarification does not change the d≥4 induction applications or endpoint.

Source versions freshly read for this package:

- Brambilla–Ottaviani, [arXiv:math/0701409v2](https://arxiv.org/pdf/math/0701409v2),
  10 September 2007: §§1–6, printed pp.1–19; only the opening univariate
  paragraph of §7.1, p.19. SHA256:
  `7d3dd9e6268431f4be53740bbf57ebf46d9a76b13c3472d6911d7f6deb530aa7`.
- Couveignes, [Annals 192 (2020), 487–497](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf),
  published §3, printed pp.491–493. SHA256:
  `8d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104`.

BO Theorem 1.1 supplies the inclusive d=5 case. Citations use printed
pagination: Proposition 2.1 p.3; Lemmas 2.2 pp.3–4 and 2.3 p.5; Theorem 2.4
p.6; Theorem 4.1 pp.7–8; Propositions 5.2 pp.9–10, 5.3 p.10 and 5.4 pp.10–11;
Lemma 6.1 pp.12–14; Lemma 6.3 pp.15–16; Theorem 6.4 pp.16–19, with its three
steps and two cases located individually. Finite sextic certificates replace
the historical uniqueness argument, so its unread source is not a premise.
No private or restricted source was needed. No PDF or extracted source text is
included in the submission.

## Existing-work screen and boundaries

Read the complete current AlgebraicCodingTheory and AnalyticToricGeometry
roadmaps for form and density. Screened current TauCetiRoadmap, including the
nine roadmaps newer than the atlas snapshot and their suggested files, and the
current Tau Ceti library for bounded polynomials, jets, interpolation, Horace
and Alexander–Hirschowitz overlap. Screen commits were TauCetiRoadmap
`a7712b2de0fbbe57dc06903169fe84cc69cf71ab` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No dependency build ran there.

The current Tau Ceti total-degree monotonicity, span, monomial-membership and
basis-extension APIs are already implemented. The README cites their current
module and commit; it does not plan them again. That module is absent at the
atlas Tau Ceti pin, and the suggested file therefore does not import it.
All 24 accepted Mathlib baseline statements were read at the pin. Additional
native `Spec`/affine-space and matrix determinant/submatrix rank statements
were read there and reused. Native schemes, affine spaces, their functor of
points and determinant rank bounds are not new targets.

The reviewed library audit has no GenericDoublePointInterpolation row. Its
four relevant supplier records mark SF.0, SF.5 and R09.1 partly built, and
R09.2 not built; those labels are not evidence that the requested particular
interfaces exist. The package keeps the exact projective O(d), residual/trace,
plane incidence and finite-flat/proper-family obligations with their owners.
General tangent/contact foundations belong to SchemeAndStackFoundations in
its SF.0 continuation / Part II direction. No higher-tier reference or
FoundationsAndLibraryIntegration placeholder remains in the package.
EffectiveBoundsCompactModels owns its arithmetic parametrization and the proof
that its pullback minor is nonzero. IntegralLattices owns general lattice theory.
No supplier, atlas data, link map or upstream roadmap was modified.

Searches of open Mathlib PRs for Alexander–Hirschowitz and jet-polynomial
interpolation returned no relevant open PR. The standing Lean Zulip topic and
archive could not be read through the available access route; this is a
limited-access screen, not a claim to have searched every discussion.

## Validation receipts

- `python3 scripts/check_blueprint.py research/blueprint/packets/GenericDoublePointInterpolation.json`:
  **PASS**, zero errors and zero warnings; 77 nodes, 42 API items, 42 tests,
  24 baseline declarations, 10 gaps, four requests; six planned layers,
  zero closed layers.
- README audit: exactly 77 unique anchors matching the accepted target IDs;
  every internal link resolves; sources and direct prerequisites on every
  target; all 42 API names and 42 test names present in their target blocks.
  Every definition has three API items and three tests.
- Metadata parses as the single TOML key `topic = "math.AG"`.
- `lean-check research/blueprint/packages/GenericDoublePointInterpolation/Suggested.lean`:
  **PASS**, exit 0, zero errors, **141 intentional `sorry` warnings**, zero
  other warnings; 55 examples. Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`, Lean `v4.34.0-rc2`.
  Used the existing shared pinned build, serially, through the supplied wrapper
  with its 8192 MiB and 1200-second limits. Available memory was 103 GiB.
  No Tau Ceti import is needed; the shared build is supplied for atlas Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. No Lake setup, dependency build,
  update, cache download or Lean language server was used. All checks exited.
- Final Lean source SHA256:
  `bf75e532feee49b241bace512f746f13ccb103bb430e7c2cdd2f97fe860a732e`.
  Diagnostic-only log SHA256:
  `967330dbdc95858bbccb9866430cd8aae7ecde2069a05f2bcbabeafd8fc962bb`.
  Normalization drops the wrapper's first line and changes each absolute
  diagnostic filename to `research/blueprint/packages/GenericDoublePointInterpolation/Suggested.lean`.
- Submission file checks and `git diff --check`: **PASS**. Only the four
  authorized deliverables are submitted.

## Finite evidence and replay

Recovered and authenticated 35 original evidence artifacts by their archived
byte counts and SHA256 values, without copying any repository or source PDF.
Reran `verify_certificates.py`: **PASS**, all 22 integer matrices reconstructed
modulo 101, expected ranks, projective distinctness and prescribed incidences;
the affine collinear matrix has rank 11/21. An independently written Fraction
elimination helper additionally checks **430** exact rational incidence and
transverse-direction conditions, and all subspace frame ranks. This is 429
on-subspace incidences plus the transverse direction condition. No purely
modular containment is silently treated as rational containment.

Reran `arithmetic_check.py`: **PASS**, 2,585 critical pairs in
3≤r≤60,5≤d≤40. Quartic cases (r,q,u,e,quadratic residual count) are
(6,30,21,0,9), (8,55,41,2,12), (9,71,54,4,13), (9,72,55,5,12).
These computations support only the finite bases and sampled arithmetic.
They do not prove the unbounded symbolic inequalities, Horace induction,
integer-minor lifting or generic openness in Lean. Containment evaluation rows
are necessary conditions, not a claimed basis of a containing-form ideal.

The persistent fixtures and original reconstruction/sweep scripts are already
archived in `research/blueprint/handoff/DESIGN-GenericDoublePointInterpolation.md`.
Use its documented manifest-checked extraction into an owned scratch directory,
then run recovered `verify_certificates.py` and `arithmetic_check.py` there.
Do not run the old direct Lean replay helper: use the prescribed `lean-check`
command on this package. The independent review's rational replay is also
recoverable from
`research/blueprint/reviews/REV-DESIGN-GenericDoublePointInterpolation.md`.
The following self-contained helper reproduces this package's extra rational
check against the recovered fixtures; save it in that fixture directory.

```python
from fractions import Fraction
from pathlib import Path
import json
S = Path(__file__).parent


def rank(rows):
    a = [[Fraction(t) for t in row] for row in rows]
    ans = 0
    for j in range(len(a[0])):
        i = next((i for i in range(ans, len(a)) if a[i][j]), None)
        if i is None:
            continue
        a[ans], a[i] = a[i], a[ans]
        pivot = a[ans][j]
        a[ans] = [x / pivot for x in a[ans]]
        for i in range(ans + 1, len(a)):
            t = a[i][j]
            if t:
                a[i] = [x - t * y for x, y in zip(a[i], a[ans])]
        ans += 1
        if ans == len(a):
            break
    return ans


checks = 0
for entry in json.loads((S / 'certificate-manifest.json').read_text()):
    c = json.loads((S / entry['file']).read_text())
    r = c['r']
    if c['kind'] == 'three-subspaces':
        on = 3
    elif c['kind'] == 'two-subspaces':
        on = r - 2
    else:
        on = r*(r-1)//6 if r % 3 != 2 else (r+1)*(r-2)//6
    for ix, (b, samples) in enumerate(zip(c['spaces'], c['containmentEvaluationPoints'])):
        assert rank(b) == r - 2
        for x in samples + c['doublePoints'][ix*on:(ix+1)*on]:
            assert rank([row + [x[i]] for i, row in enumerate(b)]) == r - 2
            checks += 1
    for z in c['curvilinear']:
        b = c['spaces'][0]
        assert rank([row + [z['point'][i]] for i, row in enumerate(b)]) == r - 2
        assert rank([row + [z['direction'][i]] for i, row in enumerate(b)]) == r - 1
        checks += 2
assert checks == 430
print('PASS: 430 exact rational incidence/transverse checks; all frame ranks.')
```

## Next step

Independently review these three package files against the corrected accepted
packet and rerun `lean-check`. Preserve the ten implementation/refinement gaps
and four owner requests during promotion. The source corrections and explicit
positive-degree Horace convention above are the reconciliation notes. No other
job, roadmap or source follow-up was undertaken in this run.
