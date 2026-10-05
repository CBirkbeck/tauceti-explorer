# Independent review of HabiroNahmSeries HB.3

Job `REV-HabiroNahmSeries--HB.3`, issue #6458. Reviewer: Codex, session
`codex-HoUI3E`, 5 October 2026. The input was written by Codex in the distinct
session `codex-G5RbR1` (PR #6528); this session had no part in that work.

**Accepted after corrections.** This is a target-level planning review, not an
implementation. Packet status remains `complete`; HB.3 remains `planned`, with
four supplier gaps and a precise remaining list. It is not `closed`.

## Counts and scope

| Item | Input | Reviewed |
|---|---:|---:|
| Nodes | 7 | 7: 5 corrected, 2 verified |
| Definitions / constructions / theorems / comparisons | 1 / 1 / 4 / 1 | unchanged |
| Baseline declarations | 16 | 16, all confirmed; 1 citation replaced |
| API items | 13 | 13 |
| Unit tests | 9 | 9 |
| New planets | 2 | 2 |
| Parent imports | 12 | 12, with 3 explicit restrictions |
| Requests / gaps | 4 / 4 | 4 / 4 |
| Source issues | 1 | 2, both independently confirmed |
| Added / removed nodes | — | 0 / 0 |

The review covered every local node, locator and excerpt; each baseline
statement with its surrounding typeclass hypotheses; all twelve imported
parent HB.3 statements; and the four direct external node suppliers:
`K3BlochGroups:V.3/cgz-bloch-group`, `antisym-exterior-comparison`,
`cgz-convention-comparison`, and `Polylogarithms:P.2/borel-comparison`.
The four requested supplier stages were checked for ownership and scope.
The reviewed HB.3 entry in `data/library-coverage.json` was read. Polynomial
evaluation, differentials, determinants, real powers and exterior powers are
consumed from the libraries; Bloch conventions and regulator machinery stay
with their owners. No existing layer is planned again.

## Source verification and corrections

The public texts inspected were [CGZ arXiv v3](https://arxiv.org/pdf/1712.04887v3),
§§1.1, 1.3, 2.1–2.2 and 7.1; [Zagier's public chapter](https://www.maths.dur.ac.uk/users/herbert.gangl/zagier_dilog.pdf),
II.1A and II.3A–B; [GSWZ arXiv v2](https://arxiv.org/pdf/2412.04241v2), §1.7;
and the statement and proof of [Stacks Lemma 10.148.3, tag 00UO](https://stacks.math.columbia.edu/tag/00UO).
The three downloaded PDF hashes agree with the packet's source records. Added
`sourceVersions` records identify exactly these public copies and their hashes;
findings are scoped to those copies.

Two GSWZ (41) excerpts had silently replaced the printed product variable
`z_j` by the intended `z_i`. Both now quote the printed variable, with an
explicit correction in `match`. The mathematical statements already used the
correct system. The same slip occurs in (34); taking q=1 in the preceding
shift-operator equation (33) supplies the variable indexed by the product.
For the symmetric matrix [[2,1],[1,1]], the intended first monomial is
z₁²z₂, whereas the printed first monomial is z₁³. Visual inspection of the
actual PDF confirms the slip. Added the already known parent identifier
`HabiroNahmSeries/E36` to this part, with a confirmed review, rather than
registering a new discovery. The signed-boundary Lean comment identifies this
correction too. [GSWZ v2, pp.13–14](https://arxiv.org/pdf/2412.04241v2).

Confirmed the existing `HabiroNahmSeries/E-HB3-rank-one` finding by visual
inspection of Zagier's PDF page 42 (printed p.44) and exact substitution.
For r=(√5−1)/2, r²=1−r, so r solves the A=2 equation and r² solves the A=1/2
equation. The printed first and last solutions are reversed, while the set
of three matrices is unaffected. The field was normalized from `sourceId`
to the protocol's `source`. The finding remains a claim about the inspected
chapter copy; its recorded searches found no published correction.
[Zagier, II.3B(a)](https://www.maths.dur.ac.uk/users/herbert.gangl/zagier_dilog.pdf).

## Mathematical checks and in-place changes

| Node suffix | Verdict | Reason |
|---|---|---|
| `clearing-polynomial-system` | corrected | Restored the literal source excerpt; the formula and unit restriction are sound. |
| `cleared-system-jacobian` | corrected | Clarified the derivative cancellation and added the full determinant factor to the Lean signature. |
| `coordinate-field-differential-bridge` | corrected | Used the pinned finite-generation theorem directly on the ambient field. |
| `positive-coherent-root-lift` | verified | Positive canonical roots give F⊆E and a finite root field, without asserting F=E. |
| `coherent-root-exterior-boundary` | verified | Symmetry cancels in the true exterior square; the root field and coordinate field are kept distinct. |
| `signed-exterior-boundary-obstruction` | corrected | Restored the source excerpt; the unmultiplied integral class stays an explicit gap. |
| `regulator-field-and-normalization-comparison` | corrected | Spelled out the embedding-extension converse and restricted inherited interfaces. |

For the Jacobian, with aᵢⱼ=max(Mᵢⱼ,0), the proof now records the off-zero
identity

    Jᵢⱼ + cᵢ(Mᵢⱼ + d δᵢⱼ xᵢ/(1−xᵢ))/yⱼ = aᵢⱼ Pᵢ(y)/yⱼ.

Thus the factorization requires the stated zero-equation hypothesis; a
derivative term is not simply discarded. At a unit zero, all row and column
scalings are units. The existing packet determinant equality is now also a
conjunct of `clearingJacobian` in Lean. The positive-definite branch is over ℝ,
where `Matrix.PosDef.det_pos` applies and d is nonzero.

For algebraicity, applying the universal derivation to the polynomial equations
and inverting the Jacobian kills all coordinate differentials. Field-adjoin
induction extends vanishing through addition, multiplication and inversion;
the range of the universal derivation spans the differential module. The
finite coordinate set generates the field, so it is essentially finite type;
it is free as a vector space. These are exactly the hypotheses of the pinned
`Algebra.FormallyUnramified.finite_of_free`. Neither algebraicity nor finite
generation as an algebra is assumed. Replaced
`IntermediateField.essFiniteType_iff` by `IntermediateField.fg_top_iff` in the
baseline, direct prerequisites and proof sketch. The former exists but speaks
about an intermediate-field subtype; the replacement gives the instance on
L itself. The read-only reader's former citation remains usable after
transport through the top intermediate-field equivalence.

The unsigned exterior boundary cancels by symmetry in an alternating square,
not merely an antisymmetric tensor quotient. Over the coordinate field F,
only the denominator multiple is certified integral. In the signed system,
the remaining boundary is Σ Mᵢᵢ zᵢ∧(−1); doubling kills it. This does not
justify the parent's unmultiplied integral class. The local gap and supplier
request retain this distinction.

For the regulator comparison, changing denominators gives the same rational
class by its image in the rational pre-Bloch group. The embedding-extension
converse is now explicit: fix E→Qbar, extend each embedding E→ℂ across the
algebraic extension Qbar/E, and use functoriality to turn a zero class over
Qbar into zero Bloch–Wigner values. The requested Borel criterion then detects
torsion. No integral injectivity of field base change is assumed. Rogers is
applied only to integral c_d or β; if m c_d=0, then m d S lies in
(π²/2)ℤ, implying S∈ℚπ². The rank-one values π²/10, π²/12, π²/15 are in the
CGZ complementary normalization; no division homomorphism on a circle is used.
[CGZ §7.1](https://arxiv.org/pdf/1712.04887v3),
[Zagier II.1A](https://www.maths.dur.ac.uk/users/herbert.gangl/zagier_dilog.pdf).

Three parent imports now state their permitted use explicitly: algebraicity
for d>1 uses this part's cleared root system, not the parent's d=1 discriminant;
the signed integral-class assertion remains conditional on the V.3 request;
and Rogers evaluations use integral classes or the real coordinate sum.
The parent packet and reader are outside this job's authorized edit scope.
The local proof chains terminate in verified library declarations, imported
supplier statements or the four precise recorded requests. No extra local node
or lemma-level decomposition is required at the prescribed target level.

## Pinned baseline

Read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:

| Declaration | Checked content and relevant hypotheses |
|---|---|
| `MvPolynomial.aeval` | Algebra-hom evaluation; commutative coefficient and target semirings with an algebra. |
| `MvPolynomial.pderiv` | Polynomial partial derivative as a derivation. |
| `Matrix.det` | Finite square matrix over a commutative ring. |
| `Matrix.PosDef` | Hermitian matrix and positive quadratic form. |
| `Matrix.PosDef.det_pos` | Finite index, RCLike scalars; used over ℝ for positivity. |
| `KaehlerDifferential.D` | Universal derivation of a commutative algebra. |
| `KaehlerDifferential.span_range_derivation` | The target module is spanned by the universal derivative's range. |
| `Algebra.FormallyUnramified` | Defined by subsingleton Kähler differentials. |
| `Algebra.FormallyUnramified.finite_of_free` | Formal unramifiedness, essential finite type and module freeness imply module finiteness. |
| `IntermediateField.adjoin` | Field generation, without an algebraic-coordinate assumption. |
| `IntermediateField.adjoin_induction` | Generators, base scalars, addition, multiplication and inversion. |
| `IntermediateField.fg_adjoin_of_finite` | Finite adjoining set gives finite field generation. |
| `IntermediateField.fg_top_iff` | Finite generation of the top intermediate field iff essential finite type of the ambient field. |
| `Real.rpow_inv_natCast_pow` | Nonnegative base and nonzero natural denominator. |
| `exteriorPower.ιMulti` | Canonical alternating map; use degree two over ℤ on Additive Kˣ. |
| `IsAlgClosed.surjective_domRestrict_of_isAlgebraic` | Extends a base-linear embedding across an algebraic extension into an algebraically closed field. |

Each entry's module is recorded in the packet. The Tau Ceti tree was searched
at `f790474821cf4256814db967cb154e7af3d0c369`; no Tau Ceti declaration is cited or
imported. A newer shared Tau Ceti working-tree revision was not used as evidence
for the pin.

## API, tests, planets and validation

Both new objects have usable APIs: polynomial evaluation, Laurent-system
characterization, nonnegative simplification, field-map compatibility and
reindexing; root evaluation, power, cube membership, uniqueness, equations,
field inclusion and finiteness. No separate record extensionality or universal
property is needed for these functions; field generation uses the existing
adjoin API. The polynomial has five tests (rank one, negative exponent, zero
denominator, spurious nonunit zero and evaluation compatibility), and the root
lift has four (the golden-ratio half matrix, denominator one, empty index and
exclusion of the negative branch). All thirteen API names and nine test names
are present in the suggested file.

The two local planets name central mathematical objects, not source locators.
Together with the three parent HB.3 planets they total five, below the limit.
Every node remains `implementationStatus: unchecked`.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNahmSeries--HB.3.json`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/HabiroNahmSeries--HB.3.lean`: exit 0; 28 warnings, all declaration-uses-`sorry`.
- The Lean file imports only individual Mathlib modules, elaborated against the
  pinned Mathlib commit in the existing shared build. No library build or
  language server was started.
- `python3 scripts/check_errata.py` on a scratch errata-format view of the two findings: passed.
- `git diff --check`: passed; `research/blueprint/intake.py check-files` on all four submitted files: zero problems.

The six available node signatures, thirteen API signatures and nine examples
elaborate. `regulatorConventionComparison` remains a precise mathematical
comment because the Bloch/regulator supplier types are unavailable. The Bloch
consequences of the exterior theorems are likewise comments. This is permitted
by protocol §13; elaboration establishes the available interfaces, not the
missing types or any proof.

## Questions and remaining work for the orchestrator

No local correction remains outstanding. Route and eventually integrate the
four existing requests: the exact Rogers projective/five-term interface from
`Polylogarithms:P.1`, Borel injectivity from `BorelRegulators:R.4`, unique
divisibility with convention transport from `K3BlochGroups:V.4`, and the signed
integral Bloch/K₃ convention from `K3BlochGroups:V.3`. Once supplied, use exact
node identifiers and replace the comparison comment by actual signatures.
During HB.3 assembly preserve the three import restrictions above, especially
before using the signed integral torsion order for the Habiro twist. This
review does not authorize editing or promoting the parent or sibling packets.
