# PKG-PerfectoidQuotients handoff

Complete package submission for issue #7494 by Codex (GPT-6), session
`codex-L7wvYo`, 9 October 2026. The claim bot confirmed this session. The branch
is `codex-L7wvYo-perfectoid-quotients-package`. This run takes one job only.
No package-writing task remains; independent package review is the next step.

## Delivered

The package consists of `research/blueprint/packages/PerfectoidQuotients/README.md`,
`Suggested.lean` and `metadata.toml`, together with this note. No packet,
blueprint reader, original suggested file, atlas data or foreign roadmap was
changed.

The README is 78,324 bytes. It presents the mathematical development in layer
order, groups related targets, and supplies definitions, exact hypotheses,
planning APIs, tests, proof routes, versioned theorem/section/page citations
and prerequisites. All 61 targets are retained: 3 definitions, 4 constructions,
15 lemmas, 31 theorems, 2 comparisons and 6 applications. All 42 API items and
37 tests appear under their accepted names. The test total includes the three
elementary Witt-quotient theorem tests as well as 34 definition/construction
tests. The 12 planets and the accepted seven-stage scope are preserved by
retaining their mathematical targets; this package does not change the atlas
structure or its names. The README contains no programme-process vocabulary
or source passages. It is a new mathematical exposition, rather than the
206,526-byte reader copied into a package.

The suggested file preserves the accepted suggested file's mathematical
contents exactly. Its sole change identifies the accompanying README in the
standard opening note. It has one import block with 13 individual Mathlib
imports, consistent namespaces, 71 named declarations and 33 examples. The
topic line is `topic = "math.AG"`.

Upstream models read in full were
`content/tau-ceti/AnalyticToricGeometry/README.md` and
`content/tau-ceti/AdicSpaces/README.md`. The upstream ClassFieldTheory
Suggested.lean opening and import form were also consulted. The worker,
blueprint, source-faithfulness and upstream instructions were read, along with
the accepted packet, reader, suggested file, independent review/handoff,
Q-layer audit and the relevant ownership-link entries.

## Source and library fidelity

The accepted packet, including its independent corrections, is authoritative
where the older reader differs. The README preserves positive-degree monic
root hypotheses, both reduced special fibres in the torsion decomposition,
the explicit initial-prism computation for F_p, the saturated g=0 root
extension test, and the corrected source locators. In particular, ECD
Definition 5.7 has the integral map in the direction ambient-plus to
quotient-plus; the reversed map is in the remark following Theorem 5.8 on
p.25. André's proof is on pp.61–62, BMS2 Proposition 4.19(3) has its statement
on preprint p.22 and proof on p.23, and BMS1's Tate adapter is Lemmas
3.20–3.21 on pp.26–27.

Fresh public PDF downloads matched the accepted SHA256 values for BS v4,
BMS1 v3, Česnavičius–Scholze v3, ECD's 14 April 2026 author version and
Bhatt's 23 April 2017 notes. Fresh readings included the initial-prism and
perfectoidization construction on BS pp.55–57; the covers, André argument,
ind-syntomic refinement and surjectivity proof on pp.60–62; ČS's decomposition
and completed ring operations on pp.11–17; ECD Definitions 5.6–5.7 and
Theorem 5.8 with its remark on pp.24–25; and Bhatt's monic-root theorem and
functorial transfinite construction on printed pp.113–117. These are targeted
checks, not a claim of a new full reading of all source papers. Other source
locators and their supplier boundaries come from the accepted plan. No
restricted book or uncleared copy was used, and no source passage was placed
in the repository.

The reviewed library audit was consulted. The current
`data/library-coverage.json` has no PerfectoidQuotients rows, so the specific
Q-layer audit and accepted baseline inventory were used. The packet retains
65 Mathlib baseline declarations and no Tau Ceti declarations. The pinned
statements used in the README were read directly, including the completion
and Fontaine interfaces. In particular `AdicCompletion.map_surjective` has
no Noetherian or finite-generation hypothesis. Its use with `of_surjective`
and `map_of` supplies the principal root-quotient image and the completed
integral quotient presentation; these are not new missing theorems.

Generic δ/prism, full cotangent, animation, completion, almost and analytic
objects keep their named suppliers. Q1 and the other import-contract targets
are applications, not duplicate developments. The base-change descent proof
does not invoke BS Proposition 8.5 or arc descent, which would use the
surjectivity theorem already. The two Part II directions and P7 towers stay
outside this package's mathematical scope. No new mistake in the accepted
plan was found; the stale-reader discrepancies are already recorded by its
independent review.

## Lean validation and its limits

Ran `lean-check research/blueprint/packages/PerfectoidQuotients/Suggested.lean`.
It exited successfully with **0 errors and 91 warnings, all
`declaration uses sorry`**. Available memory was checked before the run.
No Lean server, library build, update or cache download was started. The
wrapper's Mathlib commit is exactly
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The shared Tau Ceti checkout is
newer than the requested `f790474821cf4256814db967cb154e7af3d0c369`, but this
file imports no Tau Ceti modules; none of that newer code contributes to the
elaboration. Thus the relevant imported baseline is exactly pinned, and no
claim is made to have checked a Tau Ceti import at its historical pin.

Compilation checks signatures, not proofs or completeness of the whole
mathematical API. The accepted signature inventory is unchanged: 26 full
targets, 10 restricted targets, 20 explicit omissions and 5 supplier
applications. Of the 42 planned API items, 25 are typed and 17 remain explicit
omission comments. Of the 37 planned tests, 24 are typed examples and 13
remain comments for the three constructions needing absent carriers:
initial prism (4), analytic closed quotient (5) and Bhatt root extension (4).
The file also contains 9 additional typed examples. Comments do not count as
elaborated signatures. The final omission inventory explains every restricted
or absent interface. No arbitrary proposition field or arbitrary replacement
carrier was introduced to make an unavailable condition typecheck.

The semiperfectoid predicate uses the concrete Stacks 091P(7) countable-product
difference operator and an actual surjective perfectoid presentation.
Perfectoidization uses an actual ring, the integral predicate and the exact
quantified universal property. Identifying this ring with the initial-prism
formula still needs the owning prism carrier. These distinctions matter when
reviewing the successful elaboration.

The underlying plan's seven gaps G1–G7 and nine supplier requests are retained;
all seven coverage records remain planned and none is closed. They concern:

- G1: normalization and ordinary/derived/quotient completion transport,
  including finite sharp-ideal separation and p-integral closure.
- G2: the actual supplier carriers, including finite length-reducing Witt
  Frobenius and θ_r, prisms, full cotangent, animation, complete flatness,
  almost modules and analytic pairs.
- G3: cardinal bounds, stationarity and completion/colimit compatibility for
  the transfinite initial prism among all prisms.
- G4: correctly completed André limits, finite coefficient descent,
  the regular-reduction Frobenius-flatness criterion, and the finite
  divided-power calculations for ind-syntomicity modulo p.
- G5: the actual unit-cofiber comparison and complete-flat descent, without
  a circular appeal to the later base-change theorem.
- G6: identification of the completed perfectoid filtered colimit with the
  p-completion of R modulo the union of finite-stage unit kernels. The image
  argument after that identification is already in the baseline.
- G7: the analytic integral-model comparison, topology, torsion removal,
  minimal open integrally closed plus ring and almost surjectivity. The
  semiperfectoid presentation and ordinary ring-image arguments are already
  supplied as above.

These are future implementation/closure obligations described in the
mathematical roadmap, not unfinished package editing or a claim of
formalization. No supplier file was edited and no gap was silently closed.

## Checks and review starting point

`python3 scripts/check_blueprint.py research/blueprint/packets/PerfectoidQuotients.json`
reports 0 errors and 0 warnings. Deterministic comparisons check every
suggested target name and all 42 API and 37 test names in the README, with
the five import-contract targets checked by their supplier sections. The
suggested-file diff against the accepted original is exactly the one-line
opening-note change. The four allowed deliverables pass the intake file
rules; metadata parses as the sole `topic` key; the README is below 200 KB;
the changed-file allowlist and whitespace checks pass. No absolute local
filesystem path or source PDF is included in the submission.

Reproducibility hashes:

| Artifact | SHA256 |
| --- | --- |
| Accepted packet | `570bbfa78c085e4bcc23095096cce1dc1301f5e526cf1ba74320345bdc232903` |
| Accepted reader | `037e9c4c8b0b33c11911bdf2841e9d94967991ca638519d60d8a3af779ce6fe7` |
| Accepted suggested file | `0e6a66d81a8689dfcf4d133842a4ed404bed75f0ec6fabfadb3a4fc599d0fd90` |
| Package README | `faefc72ce72fdce9d1033d003ddd52190473b6dc1d82a1c9dd6c03f45052fba2` |
| Package Suggested.lean | `92b98b5c467634185710bd05f4c68213930bdd852a98bd908c8dd56f15a727af` |

Start package review with the target-to-section crosswalk below, then check
the theorem hypotheses and ownership contracts against the accepted packet,
and rerun `lean-check`. No scratch asset is needed by the next worker; public
source URLs and version locators are in the README, and the accepted packet
retains the detailed source receipts. Scratch downloads and logs are
disposable. This run stops after this package's pull request.

## Target-to-section crosswalk

The target column gives exact accepted node suffixes. Each row's layer id
supplies the prefix `PerfectoidQuotients:<layer>/`. Every target occurs once.

| README subsection | Layer | Accepted targets |
| --- | --- | --- |
| Integral rings, units and characteristic p | `Q0:integral-algebra` | `semiperfectoid-quasisyntomic-and-qrsp-rings`, `integral-perfectoid-nontrivial-criterion`, `inverse-perfection-unit-criterion`, `perfect-witt-unit-criterion`, `witt-product-first-coordinate`, `theta-kernel-characteristic-p`, `tilt-projection-injective-characteristic-p`, `characteristic-p-perfectoid-criterion` |
| Naturality, normalization and Fontaine generators | `Q0:integral-algebra` | `untilt-naturality`, `theta-naturality`, `integral-perfectoid-ring-equivalence`, `frobenius-surjectivity-equivalences`, `bms-perfectoid-normalization`, `principal-theta-kernel-criterion`, `theta-generator-unit-coordinate` |
| Elementary Witt torsion and cotangent consequences | `Q0:integral-algebra` | `witt-product-p-square-detection`, `witt-principal-p-saturation`, `witt-principal-quotient-p-torsion`, `perfectoid-bounded-p-torsion`, `perfectoid-cotangent-vanishing` |
| Reducedness, torsion removal and compatible roots | `Q0:integral-algebra` | `perfectoid-rings-reduced`, `torsion-free-perfectoid-quotient`, `compatible-roots-and-iterated-frobenius` |
| p-integral closure and perfectoid completion | `Q0:integral-algebra` | `p-integral-closure`, `p-integral-closedness-criterion`, `completed-p-integral-closure-perfectoid` |
| Ring operations and their tilts | `Q0:integral-algebra` | `completely-etale-and-henselian-perfectoid`, `completed-root-polynomial-algebras`, `completed-perfectoid-tensor-products`, `completed-root-stable-quotients`, `products-of-perfectoid-rings`, `completion-along-sharp-ideal` |
| Tate rings and the fixed-field integral model | `Q0:integral-algebra` | `tate-powerbounded-model-import-contract`, `bhatt-field-integral-model-comparison` |
| Prism and animation interfaces | `Q0:animated-application` | `prism-and-animation-import-contract` |
| Smooth prismatic cohomology and Hodge–Tate comparison | `Q1` | `smooth-prismatic-hodge-tate-reexport` |
| Semiperfectoid rings and the initial prism | `Q2` | `semiperfectoid-rings`, `initial-prism-of-a-semiperfectoid-ring` |
| The perfectoidization functor | `Q2` | `universal-perfectoidization` |
| Derived comparison and the two descent calculations | `Q2` | `derived-prismatic-initiality-import-contract`, `completed-perfectoidization-base-change`, `perfectoidization-completed-colimits` |
| Quasisyntomic lifting and the two perfection covers | `Q3` | `lifting-quasisyntomic-covers-to-prisms`, `relative-perfectoid-cover-of-smooth-site`, `frobenius-flat-prism-perfection-cover` |
| André's flatness lemma and its modulo-p refinement | `Q3` | `andre-flatness-lemma`, `andre-ind-syntomic-mod-p` |
| Rational root neighborhoods and the saturated root extension | `Q3` | `bhatt-rational-root-neighborhoods`, `bhatt-perfectoid-root-extension` |
| Almost flatness and functorial monic-root iteration | `Q3` | `bhatt-root-extension-almost-flat`, `functorial-almost-absolutely-integrally-closed-extension` |
| Characteristic-p quotients and radicals | `Q4` | `quotient-frobenius-surjective`, `perfect-quotient-radical-criterion`, `radical-quotient-integral-perfectoid`, `characteristic-p-perfectoidization-universal`, `compatible-root-ideal-radical`, `integral-perfectoid-quotient-radical-criterion` |
| The principal calculation and general surjectivity | `Q4` | `principal-root-quotient-perfectoidization`, `surjectivity-of-perfectoidization` |
| Integral models of the analytic closed quotient | `Q4` | `completed-integral-closed-quotient`, `zariski-closed-subsets-are-strongly-zariski-closed` |
