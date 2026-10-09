# Completed package revision: classical Habiro rings

Issue #7904, job `PKG-HabiroCyclotomicCompletions~2`.
Agent: Codex, session `codex-4GnCRN`, 2026-10-09.
Status: complete revision, ready for independent package review.

The swarm bot confirmed the claim at
https://github.com/CBirkbeck/tauceti-explorer/issues/7904#issuecomment-6086588543.
None of the manager's priority issues was available. This was the one package
job taken from the available focus candidates. No second job was claimed.

## Deliverables and boundaries

Revised the package README and Suggested.lean. The one-line metadata remains
`topic = "math.NT"`. Left the previous independent `review.json`, all three
packets, their reader document, their suggested file, source records and link
maps unchanged, as required by the issue. This note is the only other changed
file. The package retains all 107 distinct accepted targets and the HC.6 finite
specifications, with the added interfaces required by the package review.
Proofs in Suggested.lean remain prototypes, not implementation claims.

Read WORKERS, PROTOCOL, the expansion protocol and UPSTREAM_GUIDE; the parent,
HC.4 and HC.6 inputs; the assembled reader and suggested file; the independent
package report and review object; the reviewed library audit; PLAN-HABIRO and
accepted RS-10. Read current upstream ArithmeticDirichletSeries and
AlgebraicCodingTheory READMEs in full for form and density. Searched the current
read-only upstream roadmap tree and current Tau Ceti library, including the
roadmaps newer than the atlas snapshot. No Habiro or elementary q-toolkit
implementation was found there. The pinned Mathlib Pochhammer module lists
q-factorials, q-binomials and q-Pochhammer as future work; its ordinary rising
and descending Pochhammer polynomials are different objects.

## Resolution of the five required revisions

1. **HC.1 presentation comparisons.** Added the explicit polynomial-quotient
   `PolynomialLimit`, mutually cofinal directed-family equivalences,
   polynomial and reduction-coordinate equations, inverse, composition, and
   continuity both ways. `CycloCompletion.cofinalEquiv` connects this to the
   actual cyclotomic carrier. Added the actual `FiniteOrderLimit`, with finite
   *completed* coordinates, reconstruction, polynomial equations, continuity,
   coefficient and order naturality. Replaced the old tautological
   `ext_of_finite_restrict` with detection by actual completed restrictions.
   Added `HabiroRing.factorialEquiv`, positive-order `OrderAdic` and the actual
   compatible `OrderAdicLimit`, inverse reconstruction and topology, adic
   transition identity/composition, finite-divisor comparison, and coefficient
   naturality. The finite-S adic equivalence now also has a continuity statement.
   Tests reject incompatible constants at orders 1 and 2 and distinguish a
   product from the compatible limit, including empty and exponent-zero cases.

2. **HC.4 individual-root uniqueness.** Added `selectedRootEvaluation` and its
   injectivity theorem for a subring of the algebraic numbers. The signature
   includes connected positive S, actual primitive order data, admitted orders,
   actual cyclotomic root equations, irreducibility over `FractionRing A`, and
   infinitely many selected roots with orders adjacent to one order in S.
   The proof route is finite fibers of root order, injection of each selected
   residue evaluation using fraction-field irreducibility, then Theorem 6.1.
   This is distinct from the universal-order quotient theorem and the integral
   prime-power special case, both retained. The Z[i] obstruction to dropping
   irreducibility and the empty-root-family failure are explicit tests.

3. **HC.5 general localized components.** Added positive `LocalizedIntegers Δ`,
   its finite prime-divisor indexing, valuation tuples and positive-order
   classes, their connectedness and partition, the full topological product
   equivalence, component projectors, the restriction-meets-every-class iff,
   and simultaneous universal-value detection. The component Taylor injection
   and domain statements now cover every tuple and every primitive order,
   including inverted odd primes. The root-algebra bridge exposes separation
   at non-inverted primes, transitivity of cyclotomic R-algebra conjugations,
   joint Taylor detection after splitting, scalar-image invariance, and
   conjugate-root Taylor naturality. Descent applies to the base image, not to
   arbitrary elements of the split completion. Tests include Δ=6 versus Δ=12,
   the order-three component over Z[1/3], and a split cubic completion with
   two factors despite the base component being a domain. The ordinary
   Theorem 5.2 separation hypotheses were not silently weakened.

4. **HC.5 completed-ring localization.** Added a general restriction projector
   for comaximal retained/complementary order sets, uniqueness, surjectivity,
   kernel, and the ring equivalence from the actual `Localization.Away`
   carrier, with canonical-map and polynomial equations. Added the general
   non-comaximal-factor nonunit and incompatible-map obstruction. For
   Propositions 7.2–7.3, added the integral-domain instance, a single explicit
   fraction-field ambient, the rational-function embedding, denominator
   monoids, actual completed and Laurent `Localization` carriers, their
   injective embeddings and finite-fraction characterizations. The sum and
   intersection are equalities of images inside that same fraction field.
   Retained `mem_range_fromLaurent_of_mul`. Tests cover localization at 0 and
   1, the Φ₂ obstruction, denominator 1, 1/(q-1), and q inverse.

5. **HC.1 toolkit ownership and actual scope.** Followed PLAN-HABIRO §6.1,
   decision D11 and accepted RS-10's HC.1 decision: the elementary toolkit is
   owned here; QM.0 imports it. Added `QToolkit` with integral q-integers and
   factorials, recursive Gaussian and multinomial polynomials, finite
   Pochhammer, Jackson polynomial/series derivatives, the finite q-binomial
   theorem, coefficient-defined infinite Pochhammer and reciprocal series,
   the general q-binomial series, normalized Jackson exponential, logarithm,
   integral coefficientwise q-adic infinite product, positive Adams
   Laurent/double-series dilation, and the elementary plethystic operation
   with integrality. Added APIs and discriminating examples, including the
   corrected raw Proposition 1.5 series. The README distinguishes a
   coefficient-defined rational series from an infinite product: the latter
   does not converge t-adically over Q(q). The integral double series uses
   coefficientwise q-adic stabilization. General lambda-ring theory remains
   with QWittVectors:QW.1 and is not a prerequisite of this toolkit.

## Maintainer reconciliation outside this job

The parent packet's “The elementary q-toolkit has two planned owners” entry,
its reader's corresponding unresolved note, and the QM.0 plan still need to
be aligned with PLAN-HABIRO D11 and accepted RS-10. Point QM.0's elementary
objects and the arithmetic/quantum-topology consumers at HC.1; do not restore
QM.0 as this package's supplier. HC.6 now explicitly exports `QToolkit`.
Those files are not deliverables of this issue, so none was edited. This is
an ownership-record migration, not an unresolved mathematical dependency of
the package. No additional toolkit has been planned in the consumer.

The pre-existing derived comparison remains at the honest HabiroRings:HR.2
supplier boundary, as the independent review permitted. There is no fabricated
derived carrier or Proposition-valued placeholder. The classical coefficient
completion remains distinct from the Frobenius-glued arithmetic ring owned by
HabiroNumberFields. Conjecture 6.1 and the integral unit-group conjecture remain
open and unused.

## Primary-source and library evidence

Freshly read the relevant H arguments in §3.1 and (3.2), p.1131;
Theorem 4.1 and Corollary 4.1, pp.1135–1136; Lemma 5.1 and Theorem 5.1,
p.1137; Theorem 6.2 and its proof, pp.1140–1141; Propositions 7.2–7.3,
pp.1142–1143; and §7.5, p.1146. Rechecked G §1.4 and Remark 1.2, p.7,
and §2.1, (46), p.18. Read O Definition 1.1, p.2; Proposition 1.5 and
its t-deformed proof, p.3; Table 1 and Proposition 2.1, p.7;
Propositions 2.2 and 2.5 and Corollary 2.6, p.8; Proposition 2.7, p.9;
and Definitions 5.4–5.5 with the product calculation, pp.26–27.
All repository statements are in our own words, with mathematical formulas
and locators; no source passage or source file was copied into the repository.

Public PDFs accessed 2026-10-09:

| Source | URL | SHA-256 |
| --- | --- | --- |
| H | https://ems.press/content/serial-article-files/40881 | `f56094672ada5ba71bbce69785be8c9d1377807c937b1011b1004f51dbf3071f` |
| G, v2 | https://arxiv.org/pdf/2412.04241v2 | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| O, author's current 50-page PDF | https://wgabrielong.github.io/academic-writing/notes/bonn-winter-24-25/V5A2-Habiro-Rings/Habiro_Rings_Notes.pdf | `6e1757b177f62808ef6ce3241dfe90de3831eb19d93a39c5afb7b41a43615955` |

O's hash matches the rendering listed in PLAN-HABIRO, whose text comparison
identifies it with the 6 March 2025 text. The old Apostol references are
unchanged; this revision does not claim a fresh reading of the publisher PDF
that the independent review could not access. No uncleared book was used.

Inspected the pinned Mathlib statements used for quotient maps,
`AdicCompletion.evalₐ`, `PowerSeries.rescale`, `PowerSeries.expand`,
`PowerSeries.exp`, `PowerSeries.logOf`, `HahnSeries.ofPowerSeries`,
Laurent-series coefficients and fraction/localization carriers. The baseline
is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Suggested.lean imports individual
Mathlib modules only and consumes the existing Tau Ceti interfaces in the
README rather than redeclaring their implementation. No library build,
update, cache download or language server was run.

## Validation and remaining work

Final command:

```text
lean-check research/blueprint/packages/HabiroCyclotomicCompletions/Suggested.lean
```

**Exit 0, zero errors, 615 warnings, all `declaration uses sorry`.** Replaced
the deprecated `Pi.ringHom` with `RingHom.pi`; no linter or deprecation warning
remains. Every compilation ran serially through lean-check after verifying
sufficient available memory.

All three unchanged packet validators report **zero errors and zero warnings**:

```text
python3 scripts/check_blueprint.py research/blueprint/packets/HabiroCyclotomicCompletions.json
python3 scripts/check_blueprint.py research/blueprint/packets/HabiroCyclotomicCompletions--HC.4.json
python3 scripts/check_blueprint.py research/blueprint/packets/HabiroCyclotomicCompletions--HC.6.json
git diff --check
```

Performed 462 exact finite checks with integer coefficient arrays, Fraction
arithmetic, polynomial Euclidean division and extended gcd. These checked
Gaussian recursions/symmetry/factorial identities through n=8; finite q-binomial
and inverse-parameter formulas; both Euler series, general q-binomial and
logarithm at q=0, 2/3, -2; the corrected Nahm/product coefficients through
degree 20; double-series stabilization through q-degree 8; PE(t) and PE(-t);
valuation tuples through order 300; and four orthogonal cyclotomic CRT
projectors at orders 1,2,3,6 whose only denominator primes are 2 and 3.
These finite calculations verify examples, not the infinite theorem proofs.

Package shape, exact one-line TOML, unchanged review object, permitted paths,
README size and private-path/process-text screens pass. README is 116,075
bytes; Suggested.lean is 173,106 bytes. No mathematical task from the five
required revisions remains in this job. The next step is an independent
package review and the maintainer's ownership-record alignment above.
