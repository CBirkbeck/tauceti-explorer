# Independent verification: Schiffmann 2016 red team

Reviewer: Codex, session `codex-a71f92`, 30 September 2026. Job
`REV-RT-PAPER-SCHIFFMANN-16`, issue #4121. The reviewer did none of the
extraction, its original review, or the red-team investigation. Their recorded
sessions are respectively `cc-7b31c4`, `cc-d67081`, and `cc-f805bf`.

All 13 findings are confirmed: three high, five medium, five low. Confirmation
is of the defect, not unqualified endorsement of every proposed fix. The
machine-readable reasons specify the corrected scope. In particular, /5 is a
proof gap rather than a disproof of parabolic regularity; /7 and /9 identify
reusable prerequisites, not complete sheaf-level implementations.

## Verdict ledger

Numbers below mean `RT-PAPER-SCHIFFMANN-16/<number>`. Extraction item numbers
mean `PAPER-SCHIFFMANN-16/<number>` unless prefixed by Yu or GWZ.

| Finding | Independent evidence and required correction |
| --- | --- |
| /1, high | Published Corollary 1.4, p.301, visually checked; v2 Corollary 1.9 p.5; proof/dimension pp.351-352. The reciprocal factor is `q^D` and top ordinary cohomological degree is `2D`, for `D=1+(g-1)r^2`. Rank one disproves the printed exponents. Separate this from E4's typographical issues. |
| /2, high | Published Corollary 1.3 p.300 has the alternating sign missing in v2 pp.4 and extraction /11. Use a signed compact-support polynomial, or negate the Weil variables for the unsigned convention. Record that print already corrects the sign. |
| /3, high | Yu /027, /036, /037, /046, /100, /131, /178 and route 12 overlap Schiffmann route 1; Yu /044 and /099 go to QM.0 and ClassicalGroupsPartII. Both counting designs are pending. Reconcile suppliers, retaining Mellit's stronger theorem and the integral/rational character-ring distinction. |
| /4, medium | Mellit v1 Theorem 1.1 p.2 and its published counterpart give all-degree independence for `g>=1`. Preserve historical conjecture provenance but change the current target and prerequisite. Do not infer positivity or every refined/parabolic regularity result. |
| /5, medium | Published Corollary 8.1 p.353 weakens v2 p.33 to `K_g`; /55 does not. Theorem 7.1 still states the stronger ring but refers only to a parallel proof of a localized theorem. Record that extra regularity obligation, not a false-theorem verdict. |
| /6, medium | ET.2b and GS.0 do not supply the entire canonical-twist stable coarse-moduli/proper-Hitchin contract of pp.336-337,351. Resolve conflicting route ownership. Keep the stable stack's `G_m`-gerbe distinct from its coarse scheme. |
| /7, medium | All four named Tau Ceti Krull-Schmidt declarations and both Mathlib radical declarations exist at the pins. Cite them, but keep the categorical transfer, existence and local-End arguments explicit. |
| /8, medium | Published pp.331-335,310-311,341,349 contain omitted proof contracts; p.305 supplies a useful rank-two test. Add descent effectivity as well as uniqueness, restrict the torsion count to positive degree, and justify a degree-one line bundle. |
| /9, low | Arm/leg, GL cardinality, Kronecker carrier and module Grassmannian are real pinned APIs. The QM.0 q-binomial node exists, but needs a rational-coefficient/formal-log adapter. Grassmannian quotient rank is `a-b`, not `b`. |
| /10, low | Published Lemma 6.1 p.338 versus uses pp.340,347 confirms `(b)->(a)` and `(d)->(c)`. Correct v2 comparison locators to pp.23,24,29; the red team's pp.26,30 are not the corresponding passages in this PDF. |
| /11, low | Dependency uses on pp.300,314,317,348 and bibliography pp.359-361 substantiate MS14, GPHS14, GPH13, HN75 and optional Hei12. Add Mellit separately; absence from the paper register alone is not an atlas-wide coverage proof. |
| /12, low | GS.0's actual HN node does not state the whole coherent-sheaf package. R09.2 does not promise strong generation or the Quot tangent formula. Split planned parts from missing adapters/requests. |
| /13, low | Current metadata and generated register mix the initial failed print access with a later successful reading. Preserve the dated history but repair current provenance. Replace `q^{dim}/2` by `q^{dim/2}` in /10. |

## Mathematical checks

### Reciprocal count and cohomological degree

For rank one and genus `g>=1`, the stable Higgs space is
`Pic^d(X) x A^g`, and its nilpotent cone is `Pic^d(X)`. Write
`A(alpha)=product_i(1-alpha_i)`. Since there are `2g` variables and
`product_i alpha_i=q^g`,

`A(alpha^{-1})=q^{-g}A(alpha)`.

Consequently `q^g A(alpha^{-1})` counts the nilpotent cone. The printed
`q^{2g}` introduces an erroneous factor `q^g`; merely adding a closing
parenthesis, as E4 proposes, cannot repair it. Independently,
`b_g(Pic^d)=binomial(2g,g)`, whereas `b_{2g}(Pic^d)=1=A(0)`.
Already an elliptic curve has `b_1=2`, not 1.

For a concrete arithmetic diagnostic, `y^2=x^3+1` over `F_5` has six points.
Its rank-one count is 6 and its reciprocal value is `6/5`; the two candidate
factors give 6 and 30 respectively. This example is not offered as a check of
the paper's general characteristic bound: the rank-one product description
establishes the identity directly. The formal product argument applies in
every genus in this rank-one case.

The general normalization is consistent with the smooth Higgs dimension
`2D` on p.352: Poincare duality in dimension `2D`, applied to the
compact-support count `q^D A`, gives the reciprocal count `q^D A(alpha^{-1})`.
The comparison with the nilpotent cone still needs the contracting-action
geometry. This review does not assert that the numerical diagnostics alone
prove that geometry. Over finite fields the coefficient theory must be
geometric l-adic cohomology, not a literal complex-coefficient etale theory.

### Signed versus unsigned polynomial

In the same rank-one case the unsigned compact-support polynomial is
`t^{2g}(1+t)^{2g}`, while the proposed right side is
`t^{2g}A(t,...,t)=t^{2g}(1-t)^{2g}`. The odd coefficient already differs.
The published formula's `(-1)^n` resolves exactly this discrepancy. Its
finite-field hypothesis `p>C(r,d)` must not be silently removed.

### The bridges that remain work

Krull-Schmidt's existing module APIs cannot take a coherent sheaf as a
finite-length module argument. A Hom-finite category with split idempotents
admits the relevant finite decomposition/local-endomorphism argument, but
one must construct the transfer or the categorical argument. Nor does the
nilpotent-radical theorem alone calculate every block in `End(M)`.

The q-binomial node is stated in `R[[q]]`, with its substitution variable
having zero constant coefficient. Schiffmann uses a separate formal variable
`u` and a rational parameter `v`, ultimately an inverse finite-field power.
Use the universal coefficient recurrence to obtain coefficients
`1/product_{j=1}^n(1-v^j)`, then the formal logarithm over a rational
coefficient ring. Evaluation of an arbitrary q-adic series at `q^{-l}` is
not a permitted shortcut. Similarly, the existing module Grassmannian
parametrizes submodules with locally free quotient of specified rank; its
file explicitly leaves scheme representability as future work.

## Sources and reproducibility

The source inspection was targeted to all findings, not a claimed new
line-by-line audit of every proof of every paper. The full 59-item extraction,
its four routes and four recorded source issues were compared with the red
team. The independent review reasons, not the original review's assertions,
determine the verdicts.

Public sources obtained on 30 September 2026:

- [Schiffmann, published Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf):
  66 pages, printed page = PDF page + 296; SHA-256
  `8e486963410368afe461a6f2a848eb7ddb618aa48fda7db2c0bd51710286c7a5`.
  Inspected the implicated introduction/corollaries pp.299-307, local algebra
  and descent pp.309-311, dependency uses pp.314,317, the proof chain
  pp.331-335, Higgs/Quot and cited proof steps pp.336-338,340-341,347-349,
  cohomological argument pp.351-352, refinements pp.352-355, Appendix A and
  the opening of Appendix B pp.356-357, and bibliography pp.359-362.
  Rendered pp.300,301,305 were visually read to check the signs, exponents
  and the rank-two formula; text extraction alone was not trusted for these.
- [Schiffmann, arXiv 1406.3839v2](https://arxiv.org/pdf/1406.3839v2):
  38 pages; SHA-256
  `7e5cbf6e3bb9caf4c48959493987c4543c2244cccdf17fa0fa426593a8639bb2`.
  Compared pp.4-5,23-24,29-30,32-34, including the different Lemma 6.1
  ordering. Pages 26 and 30 were also checked when correcting /10's locators.
- [Mellit, arXiv 1707.04214v1](https://arxiv.org/pdf/1707.04214v1):
  19 pages; SHA-256
  `300492e260092efd696f2e2d046603ab36ae0981c0f504709762b7e3cf6f9f6a`.
  Read introduction pp.1-2 and Theorem 1.1/Corollary 1.2, then compared their
  [published full-text counterparts](https://doi.org/10.1007/s00222-020-00950-1),
  Inventiones 221 (2020), 301-327. No claim to have reconstructed Mellit's
  full polynomiality proof.

The Annals article page, arXiv version history and a title-plus-erratum search
were checked. No separate correction of the exponent problem was found in
that bounded search. This is not proof that none exists. The published sign
and `K_g` changes are positively verified corrections, not negative searches.

Repository inspection base:
`02d1e8a91ea92321b596254190f3c7f87ce688b5`. Before submission, the relevant
instructions, extraction, red-team input, supplier contracts and validator
were compared with refreshed main `6aca82f63ec82e9a679937730b5702cca7cc0f14`;
they were unchanged. The shared working tree was left untouched.

Repository evidence read includes the original Schiffmann review; Yu's nine
items and routes 7,12,13; GWZ-20 /62 and its route; the BFP red-team review
/7; the etale-area fix /1; the three named atlas stage contracts; GS's
`harder-narasimhan-truncations` packet node; QM's `cauchy-q-binomial-theorem`
node; the pending design queue entries; the paper register and the Schiffmann
entries of `research/errata/REGISTER.md`. Reviewed library-audit entries for
GS.0 and R09.2 were read. Upstream QuiverRepresentations and
SemisimpleAlgebras roadmaps were read for ownership and API conventions.

Pinned declaration statements were read in the existing library checkouts:

| Pin | File and declarations |
| --- | --- |
| Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` | `RingTheory/KrullSchmidt/DirectSum.lean:154`, `Indecomposable.lean:263`, `Existence.lean:181`, `Uniqueness.lean:187`: the four `TauCeti` declarations named in verdict /7, with their actual finiteness hypotheses. |
| Same | `Combinatorics/Young/HookLength/Basic.lean:136,140`: `YoungDiagram.armLength`, `legLength`; `RepresentationTheory/Quiver/Kronecker/Basic.lean:69`: `TauCeti.Quiver.Kronecker`. |
| Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` | `RingTheory/Artinian/Ring.lean:54`: `IsArtinianRing.isNilpotent_jacobson_bot`; `Artinian/Module.lean:650` and following instance: semisimplicity/radical and semiprimary structure. |
| Same | `LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:99`: `Matrix.card_GL_field`; `RingTheory/Grassmannian.lean:68`: `Module.Grassmannian`, including the quotient-rank convention and representability TODO. |

## Validation and limits

`python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-SCHIFFMANN-16.review.json`
passes using the repository's unchanged validator and red-team input in the
job's small scratch layout. An additional check verifies a bijection between
the 13 input IDs and 13 verdicts, no duplicates/extras, and the exact three
deliverable paths.

The retained `check_math.py` diagnostics pass: reciprocal factors and Betti
coefficients for genera 1-5; the explicit elliptic point count; the p.305
rank-two formula at three genus-zero and nine genus-one rational samples;
and Heine's identity through degree 10 at three rational parameters.
These are bounded exact-arithmetic checks, not formalization or a proof of
the general formulas. No Lean file is a deliverable and no Lean build was
started. No extraction, route, source-issue record or supplier packet is
changed here: applying the accepted corrections belongs to the follow-up
fix job, coordinated with the existing etale-area work.
