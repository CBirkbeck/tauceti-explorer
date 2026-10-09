# Independent package review: relative Habiro rings

**Verdict: accepted.** Codex (GPT-6), session `codex-oSU38t`, completed this
independent review for issue #7520 on 2026-10-09. The package was written by
another worker. All six required checks pass after one clarification in the
README. This verdict accepts a mathematical roadmap and its suggested
signatures; it does not certify admitted proofs or the unavailable enhanced
interfaces as formalized results.

## Required checks

| Check | Finding |
| --- | --- |
| Upstream form and size | Pass. Mathematical motivation, conventions, ordered layers, statement/proof-route paragraphs, prerequisites, API tables and meaningful examples follow the upstream roadmap form. Compared with Multiquadratic, RepresentationTheory/SemisimpleAlgebras and the scope and presentation of ClassFieldTheory. The final README is 187,277 UTF-8 bytes, below 200 KB. |
| Fidelity and boundaries | Pass. All 89 distinct targets, 294 API items and 131 unit specifications of the six inputs occur. Statements, hypotheses, suppliers and exclusions were checked individually, including the conditional spectral and arithmetic comparisons. |
| Own words and locators | Pass. The text is an authored mathematical development rather than source passages or a source synopsis. Source statements and relevant proof arguments were read directly. The fixed versions and theorem, section and page references support the stated scope. |
| No programme process | Pass. The README contains no packet filenames, job identifiers, reviews, checkpoints or coverage statuses. Mathematical layer and supplier identifiers express dependencies. |
| Suggested.lean | Pass. `lean-check research/blueprint/packages/HabiroRings/Suggested.lean` returned exit 0, zero errors and 454 warnings, all `declaration uses sorry`. Typed statements agree with the README. The 81 explicitly omitted signatures retain named mathematical specifications and supplier requirements under PROTOCOL §13. |
| metadata.toml | Pass. Its entire content is `topic = "math.NT"` followed by a newline. Number theory fits the arithmetic relative completion and number-field applications. |

## Input and signature inventory

The comparison used the parent input and its HR.1, HR.2, HR.3, HR.4 and HR.6
parts, including their review qualifications and remaining prerequisite gaps.
Acceptance here does not erase those qualifications or promote a conditional
target to an unconditional theorem.

| Input | Targets | API items | Unit specifications |
| --- | ---: | ---: | ---: |
| HabiroRings | 50 | 164 | 81 |
| HabiroRings--HR.1 | 17 | 42 | 16 |
| HabiroRings--HR.2 | 5 | 31 | 11 |
| HabiroRings--HR.3 | 7 | 22 | 12 |
| HabiroRings--HR.4 | 7 | 24 | 7 |
| HabiroRings--HR.6 | 3 | 6 | 4 |
| Total | 89 | 294 | 131 |

All target anchors resolve, and every API and unit name is represented in the
README and suggested file. Of the API items, 213 have typed declarations or
structure projections; 81 are explicitly named specifications in comments.
The latter require enhanced derived, spectral, solid, coherent-descent or
completed cohomological carriers absent from the pins. Their comments state
the mathematical contract and identify its supplier. They do not introduce
arbitrary propositions or `True` substitutes to make a signature elaborate.
The unit specifications likewise distinguish expressible examples from
carrier-dependent mathematical tests. Name coverage is not reported as proof
coverage.

The reviewed library audit and accepted RS-10 ownership decision were checked.
Generic big Witt, arithmetic Λ-ring and degree-zero q-Witt interfaces remain
owned by QWittVectors QW.0–QW.4, including the temporarily retained HR.1 and
HR.4 specifications. Classical polynomial completion, root adjoining and
Taylor injectivity remain with HabiroCyclotomicCompletions. Enhanced categories,
principal derived completion, smooth q-de Rham–Witt forms and number-field
lines have their stated separate suppliers. Existing upstream link maps have
no positive HabiroRings contract contradicting these boundaries; exclusion
entries were not treated as constructive supplier theorems.

## Mathematical fidelity checks

**Arithmetic Λ-data and Frobenius.** The torsion-free Adams definition retains
the prime congruence and multiplicative index law. Arbitrary rings use the Witt
coalgebra definition; the converse from Adams data requires torsion-freeness.
Dwork's ghost divisibility is by the appropriate prime-power exponent, and its
chosen lifts need not commute. Exterior λ-operations are distinguished from
Witt coordinates, including the signs in λ² and λ³. The free Λ-ring statements
allow arbitrary generator sets and retain the prime-local freeness argument.
These checks use Hesselholt, [v3](https://arxiv.org/pdf/1006.3125v3), Lemmas
1.4 and 1.8, pp.8–11, Proposition 1.14, pp.14–15, Proposition 1.19, p.17,
Remark 1.22, p.18 and Lemma 1.24, p.19; Borger,
[v6](https://arxiv.org/pdf/0801.1691v6), §§1.17–1.18, pp.12–13; and Wagner's
[q-Witt v5](https://arxiv.org/pdf/2410.23078v5), §§2.4–2.5, pp.26–32.

Perfect coveredness retains faithful flatness. Completed étale Frobenius is
semilinear, with invertible completed linearization; the roadmap does not
assert an automorphism of the untwisted ring or a global Adams structure on
an arbitrary étale algebra. The relative constructions keep both perfect
coveredness of A and étaleness of R/A, including the finite-stage comparison.
The relevant references are Wagner's [Habiro v2](https://arxiv.org/pdf/2510.04782v2),
§2.2, 2.7 and Remark 2.8, pp.15–16, and Theorem 2.9 and proof, pp.16–17.

**Derived completion and solid hypotheses.** The two-term localization
differential and its q-factorial augmentation have compatible signs and
indices. The written correction to the source's coefficient placement is
retained. Factor-by-factor cofiber arguments supply joint detection; neither
single-factor conservativity nor arbitrary commutation of completion with
limits is asserted. The complete tensor unit is the completed base, rather
than the localization that completion kills. Spherical coefficients and
restriction to them are distinguished from Eilenberg–Mac Lane coefficients.
See Habiro v2, Appendix B, B.1–B.5, pp.77–79, and
[Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Proposition
2.2.1.9, p.197, and Theorem 7.1.2.13, p.1212.

The five solid targets are conditional on the full spectral product, tower,
tensor, bounded-below resolution and countable-colimit contract. An abelian
compact-generator theorem does not discharge this contract. Reverse pointwise
profile order, finite-support maps, and bounded-below hypotheses on both
tensor factors were checked. Bosco, [v1](https://arxiv.org/pdf/2306.06100v1),
Proposition A.3 and Lemma A.4, pp.92–93, and Wagner's
[thesis](https://guests.mpim-bonn.mpg.de/ferdinand/q-Thesis.pdf), §5.3,
pp.85–86 (PDF pp.89–90), supply the cited abelian arguments, not an unstated
all-spectra theorem. The ordinary relative construction remains independent
of these additional solid assumptions.

**Coherent descent and finite stages.** The arbitrary coefficient ring,
distinct-order cyclotomic exceptions, actual maximal prime-power subsets,
and inclusion-poset height are retained. Mapping spaces are homotopy
equalizers with path data; strict equalizers would lose information. Coherent
sections and marked solution spaces remain part of the gluing contract.
Fixed-category algebra limits are distinguished from limits of varying
categories. Checked against Habiro v2, §2.1, Setup 2.1 through Remark 2.5,
pp.13–15; Higher Algebra, Proposition 3.2.2.4, pp.358–359; and
[Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf),
Theorem 3.2.0.1, pp.169–170 (PDF pp.187–188), and the cited presentability
and diagram results.

The relative q-Witt construction retains its Verschiebung-generated quotient.
Ghost injectivity has the required torsion hypotheses, and Frobenius targets
use the divisor index. The restriction obstruction concerns the whole
specified commuting diagram, with a nonzero prime scalar in the target.
Marked étale lifting keeps its reduction marking, arbitrary nilpotent ideals
for existence, and finite-generation hypotheses where ordinary adic
completion needs them. Sources: q-Witt v5, §2.2, Definition 2.8 through 2.14,
pp.11–13; §2.5, Definition 2.40 through Remark 2.47, pp.30–32; §2.6,
Proposition 2.48 through Corollary 2.52, pp.33–35;
[Stacks 04D1](https://stacks.math.columbia.edu/tag/04D1), §10.143,
Lemma 10.143.10 and proof; and [Stacks 0ALI](https://stacks.math.columbia.edu/tag/0ALI),
§15.11, Lemma 15.11.2 and proof.

**Inverse limits, Taylor coordinates and arithmetic examples.** Staticity of
the infinite relative ring is justified by finite cofibers commuting with
limits, stabilization along the cofinal divisible tail, and HR.2 detection.
It is not inferred solely from staticity of each finite stage. Base change
remains completed; adjoining a polynomial variable illustrates why an
ordinary tensor product is insufficient. Transitions deform Witt Frobenius.
Taylor coefficients retain the full finite étale root algebra and every
idempotent factor. Compatible root choices, convergent prime-adic translation
and realized Galois action are distinguished from formal relabeling. See
Habiro v2, §2.2, 2.11 and Lemma 2.12, pp.17–18, and Corollary 2.13, p.19.
The splitting at Φ₅ over F₁₁ and the cubic completed-Frobenius obstruction
match the written computations. The latter's finite-stage obstruction uses
q-Witt v5, Corollary 2.52, p.35, including completion injectivity.

**Cohomology and number-field lines.** The étale comparison has degree zero
and empty framing, retains the q-Hodge filtration, and imports actual derived
smooth forms from HQ.4. It does not substitute a Hodge/Nygaard comparison for
that supplier. Habiro v2, Corollary 3.13 and its preceding argument, p.27,
uses Theorem 3.11(b), p.25, in the role for which the source prints (a).

The number-field ring comparison needs discriminant inversion; the line
construction retains inversion of 6 as well. Picard classes refer to actual
invertible modules. Effective global descent, inverse tensor certificates,
the integral linear-jet condition and supported arithmetic naturality remain
explicit HB.7 hypotheses. The order-one fiber and Nakayama argument trivialize
the completed line over R[[X]] without adding local or Noetherian assumptions
on R. They do not establish global freeness or a nonzero Picard class over
the original Habiro ring. Checked against Habiro v2, §1.1, 1.4, p.4, and
Garoufalidis–Scholze–Wheeler–Zagier,
[v2](https://arxiv.org/pdf/2412.04241v2), Definition 1.4, Theorem 2 and
Proposition 1.5(f), pp.9–11, and §3.3, pp.39–45. The January 2026
[author-hosted Habiro paper](https://ferdinand-wagner.github.io/papers/q-Habiro.pdf),
§1.1, 1.4, p.4, still states the completed-regulator conclusion without
discharging the global input isolated here. Multiplicativity in the cited
number-field paper alone is insufficient to remove that hypothesis.

## Correction and independent validation

The sole edit clarifies the notation paragraph: perfectly covered means the
faithful flatness criterion, and every perfect Λ-ring is perfectly covered.
The former wording called the condition stronger, which could suggest the
opposite implication. The detailed target and Lean interface already had
the correct implication. No Lean or metadata correction was needed.

All 13 distinct primary-source downloads matched the SHA-256 receipts in
the accepted inputs. Both arXiv and published Hesselholt pagination were
checked where the package distinguishes them. A sixteen-alphabetic-word
overlap scan against all eleven PDF source texts found no matching passage
in the README; the two Stacks statements were checked manually. This
supplements the direct reading, rather than proving authorship by itself.
No source file or passage was added to the repository.

All 109 distinct library declarations cited by the inputs were inspected at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Each of the six inputs passed
`python3 scripts/check_blueprint.py` with zero errors and zero warnings.
The final inventory, metadata, internal-anchor and whitespace checks pass.

The shared Lean build has the pinned Mathlib but a different Tau Ceti HEAD
and no compiled cyclotomic Lift module. Suggested.lean imports only Mathlib
modules, so the successful check does not depend on that unpinned checkout.
Its standalone finite-residue signature and header retain the distinction
from the native pinned Tau Ceti cyclotomic APIs. This review does not claim
that native integration was compiled. The Lean source was unchanged after
the successful check.

No revision remains within this package-review job. Subsequent implementation
must supply the stated prerequisite mathematics and replace the 81 omitted
signatures with genuine carriers without weakening their contracts.
