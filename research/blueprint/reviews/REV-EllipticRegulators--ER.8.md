# Independent review: EllipticRegulators ER.8

**Accepted**, 6 October 2026. Reviewer: Codex, session `codex-DJhf3X`, job
`REV-EllipticRegulators--ER.8`, [issue #6441](https://github.com/CBirkbeck/tauceti-explorer/issues/6441).
The input was the completed planning pass by session `codex-FK9WoX`
([#6489](https://github.com/CBirkbeck/tauceti-explorer/issues/6489)); this reviewer
was not its author. The packet's reviewer is
`independent-review-REV-EllipticRegulators--ER.8`.

Acceptance covers a correct target-level planning pass. Packet status remains
`complete`, ER.8 remains `planned`, and every implementation status remains
`unchecked`. The three gaps and five supplier requests are explicit; the stage
is not closed. There is no retained mathematical contradiction.

| Inventory | Input | Reviewed |
| --- | ---: | ---: |
| Nodes | 12 | 12 |
| Definitions / constructions | 2 / 1 | 2 / 1 |
| Theorems / comparisons / applications | 3 / 1 / 5 | 3 / 1 / 5 |
| API items | 17 | 17 |
| Definition/construction tests | 13 | 13 |
| Planets | 4 | 4 |
| Pinned baseline declarations | 16 | 18 |
| Node source citations | 15 | 15 |
| Gaps / requests | 3 / 5 | 3 / 5 |
| Source issues | 2 | 2 confirmed |

`review.checked` contains all twelve nodes: ten verified and two corrected.
No nodes were added or removed. The two additions are existing library
prerequisites, so no new-node `addedBy` field is needed.

## Sources and version boundaries

I checked every locator and short excerpt, including those pointing into the
accepted parent packet. The parent's titles are the source of such excerpts
as “The rational class U” and “Bloch's theorem”; they are not purported fresh
quotations from the restricted Bloch book. The parent remains an imported,
reviewed dependency. I did not independently re-read its restricted sources.

The public sources inspected are:

- [Asakura–Chida preprint v2](https://arxiv.org/pdf/2003.08888v2), §§2.2–2.3,
  3.3–3.4, the §4.7 algorithm interface and the §5.2 Legendre interface.
- [HUSCAP accepted manuscript](https://eprints.lib.hokudai.ac.jp/repo/huscap/all/91491/Perrin-Riou-conj-v1.pdf),
  Theorems 2.2–2.3, §3.4 and §6 footnote 10.
- [Publisher preview](https://link.springer.com/article/10.1007/s40687-023-00374-2),
  especially public footnote 10. The theorem body is subscription content and
  was not read. Its public footnote confirms the Frobenius correction.
- [Besser–de Jeu v1](https://arxiv.org/pdf/1208.0516v1), introduction pp.1–4,
  especially the constant-term discussion and Remark 1.10. Only the K2
  restatement is used; its K4 comparison theorems are outside this part.
- [Brunault 2010](https://pmb.centre-mersenne.org/item/10.5802/pmb.a-125.pdf),
  introduction, §1, §3 Remark 3.1, and the relevant §9 trace/example formulas,
  particularly **Théorème** 9.4 (115). The packet's reading locator called
  the latter a remark; corrected. Its measure conventions were not silently
  identified with the modular-symbol owner's conventions.
- [Accepted ER parent](../packets/EllipticRegulators.json) and the exact pinned
  Mathlib division-polynomial module listed below.

| Node suffix | Locator verified | Hypotheses/conventions retained |
| --- | --- | --- |
| `good-reduction-elliptic-pairing` | BdJ, Remark 1.10, p.4; constant terms pp.3–4 | Proper good-reduction model, holomorphic differential, Coleman primitive, closed-point trace. Original Besser II proof remains an explicit access gap. |
| `elliptic-syntomic-etale-factor` | AM §6 footnote 10; publisher footnote 10 | Untwisted Qp-linear Frobenius of E/Q, extended to the eigenvalue field; no unsupported semilinear simplification. |
| `frobenius-regulator-scalar` | AM §3.4 definition before Conjecture 3.3, p.16 | Nonzero geometric cup denominator and independent Hodge/eigenline. |
| `neron-refinement-period-dictionary` | AM §§2.2,3.4; v2 §2.3 | Primitive oriented cycles, selected refinement, non-theta-critical slope-one case, explicitly fixed character/Gauss convention. |
| `weight-two-beilinson-relation` | AM §3.4 rationality sentence and Conjecture 3.3, pp.16–17 | A common nonzero rational scalar, sign and nonzero regulator values. |
| `weight-two-padic-beilinson-conjecture` | AM Conjecture 3.3, n=0, p.17 | Arithmetic-integral motivic group, good reduction, slope alternatives, eigenline guard; remains conjectural. |
| `cm36-full-torsion-certificate` | Parent ER.5/class U and ER.8/CM target; pinned Ψ recurrence | Full six-torsion splitting field, fixed CM uniformisation; coordinate/Galois dictionary requested. |
| `cm36-corrected-l-value` | Parent ER.5 corrected L-value theorem | Parent character, Fourier and regulator conventions; no printed extra factor six. |
| `quadratic-corrected-symbol` | Parent ER.8/nonrational target | New algebraic instance computation, using E.7's general certificate/correction. |
| `quadratic-transfer-certificate` | Same parent target's transfer acceptance | E.7 constant-field transfer; every residue tested in its own field. |
| `quadratic-regulator-trace` | Parent ER.4/trace and ER.8/nonrational target | Second-minus-first diamond, half-conjugate source regulator, real-class and Deligne-period conversions. |
| `integral-example-padic-eligibility` | Parent ER.8/integrality example | Parent arithmetic certificates and the positive period-one differential; restored explicitly in this part. |

The preprint, BdJ and Brunault PDF hashes agree with the input packet. The AM
PDF returned at review has SHA256
`c0b23ae71a8006b9bd3ce2e7529fb1cb668c9f549e188e89e5d44bd876e69043`,
where the planning copy recorded
`70103ec8703754c395e23c750e5bb6d22b46dcd6a54a5668e0e25eb71671aed8`.
The packet now records the inspected hash and preserves the earlier hash in
`previousPlanningSha256`, in both source records. The cause of the byte
change was not established. The relevant displayed statements were directly
checked in the review copy. The preprint reading locator was also clarified:
the algorithm interface is §4.7, while §5.2 is the Legendre example.

## Baseline and ownership

Every original declaration and both added bridges were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, including the ambient hypotheses.
No original declaration was removed or replaced.

| Declarations | Module at the pin | What was confirmed |
| --- | --- | --- |
| `LinearMap.BilinForm.smul_left`, `.smul_right` | Mathlib `LinearAlgebra/BilinearForm/Basic.lean` | Bilinearity supplies the scalar cancellations; the field/module instance is a valid specialization. |
| `FreeAbelianGroup`, `.of`, `.lift` | Mathlib `GroupTheory/FreeAbelianGroup.lean` | Existing free additive group and its universal evaluation equivalence into an additive commutative group. Corrected `.of` line 110 to 108 and `.lift` line 114 to 112. |
| `WeierstrassCurve.Affine.FunctionField` | Mathlib `AlgebraicGeometry/EllipticCurve/Affine/Point.lean` | Fraction ring of the actual affine coordinate ring. |
| `Affine.genericX`, `.genericY`, `.equation_genericX_genericY` | Tau Ceti `AlgebraicGeometry/EllipticCurve/Affine/FunctionField/GenericPoint.lean` | Existing generic coordinates and their base-changed curve equation. |
| `Affine.isFunctionField` | Tau Ceti `AlgebraicGeometry/EllipticCurve/Affine/FunctionField/Finrank.lean` | The one-variable function-field structure over a field. |
| `TauCeti.Divisor.principal` | Tau Ceti `FieldTheory/FunctionField/Divisor/Principal.lean` | Principal divisor of a function-field unit. |
| `Affine.exists_principal_zsmul_pointPlace_sub_infinity` | Tau Ceti `AlgebraicGeometry/EllipticCurve/Affine/FunctionField/TorsionDivisor.lean` | Requires a field, Dedekind coordinate ring, decidable equality, nonsingular point and integer-scalar affine annihilation. Corrected theorem line 44 to 42. It proves existence, not the divisor of the displayed fT by itself. |
| `WeierstrassCurve.Ψ`, `.preΨ_even` | Mathlib `AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean` | Reduced bivariate polynomial and even-index recurrence with integer index. |
| `zsmul_eq_zero_of_evalEval_ψ_eq_zero`, `evalEval_ψ_eq_zero_of_zsmul_eq_zero` | Tau Ceti `AlgebraicGeometry/EllipticCurve/DivisionPolynomial/ZSMul.lean` | Nonsingular affine coordinates, with annihilation concluded/assumed in the Jacobian point group. |
| `Affine.CoordinateRing.mk_ψ` — added | Same Mathlib division-polynomial module, line 438 | Equality of ψ and Ψ in the coordinate ring over a commutative ring; evaluation at a curve point transports their values. |
| `zsmul_fromAffine_eq_zero_iff` — added | Same Tau Ceti ZSMul module, line 1106 | Integer-cast Jacobian annihilation iff natural affine annihilation, over a field with decidable equality; natural/integer conversion at six gives the principal-divisor input. |

The last two bridges were missing from the CM node's direct prerequisites.
They now make explicit the passage from the computed Ψ6 to Tau Ceti's ψ6
and from its Jacobian conclusion to affine torsion. Both are imported library
facts, not new planned results.

The reviewed `AUDIT-28` ER.8 entry in `data/library-coverage.json` was read.
Its absent regulator/Coleman/p-adic L-function targets and its D.5/L1 ownership
boundaries agree with this packet. I read the cited supplier statements in
the accepted parent, EllipticKTheory, ColemanIntegration and
ModularSymbolsPadicLFunctions packets, and the D.2/D.5/CM.1/CM.2 stage
contracts. In particular:

- E.3 gives the rational lift; E.6 owns models and vertical integrality;
  E.7 owns correction, certificate, transfer and rational descent; E.8 gives
  the nonrational residue and positive/negative bad-fibre instances.
- Coleman L1's general pullback retains coordinate/Taylor hypotheses and a
  general-domain gap. Its punctured-line results cannot silently certify an
  elliptic computation; the request explicitly addresses this.
- Modular-symbol L1 supplies period lines and twisted Mellin, L2 the
  distribution/interpolation, L3 the non-theta-critical eigenlift, and L4
  the good-prime Euler factors. All eight named nodes were checked.
- D.2/D.5 requests specify actual maps and targets, cup/trace and the full
  vector, rather than a scalar pretending to define a regulator. CM.1/CM.2
  requests specify the oriented point dictionary and twist-sensitive Galois
  action, rather than descent of each individual summand.

I read upstream ContourIntegration and ArithmeticDirichletSeries for the
required density and explicit convention/contract standard. This target-level
review does not split the elementary calculations into extra lemma nodes.

## Mathematical checks and corrections

**Holomorphic comparison and Frobenius.** In a local parameter, integrating
`log(g) eta` for holomorphic eta produces positive-power logarithmic terms;
they have zero constant term. Adding a primitive constant cancels on the
principal divisor using residue-field degrees. This does not prove
presentation independence or reconstruct the two-dimensional regulator
vector; those remain owner obligations. Frobenius similitude and
`Phi v=gamma v` give `B(Phi z,v)=p/gamma B(z,v)`, so the pairing correction
is `1-1/(p gamma)`, distinct from the scalar's `1-p/gamma`. The period,
coefficient-extension and denominator conventions agree with the sources.

**CM certificate.** Independent exact polynomial arithmetic reproduces

`psi6=6xy(x³+4)(x³-8)(x⁹+228x⁶+48x³+64)`.

The x-factors are pairwise coprime and squarefree, and disjoint from `y=0`;
there are 32 zeros with nonzero y and three with y=0. At infinity,
`x~t^(-2), y~-t^(-3)`, so the pole order is 35 and leading coefficient is
-6. Thus rho has leading coefficient -1/6 and its uncorrected infinity
residue is `6^6`. Every symbolic finite row cancels as `c^6*c^(-6)` and
reciprocity over the split field cancels the infinity row. This checks the
schema, not a missing 105-row coordinate instantiation.

The input proof attributed a Miller construction to E.7, whose cited node
actually supplies existence of principal torsion divisors. Corrected the proof
to verify the particular displayed chain using
`div(h/v)=[P]+[Q]-[P+Q]-[O]`, including vertical/infinity cases. It gives
`div(f_n)=n[b]-[nb]-(n-1)[O]` at 2,3,6. The general existence theorem is
still imported. CM coordinates and Galois identification remain requested.
Substitution in the accepted ER.5 scalar gives `pi/(324i)` and `2pi/3`
times the three D-values. No extra factor six is introduced; the decimal
one-point relation remains an unproved exact-identity gap.

**Quadratic symbol, transfer and trace.** Exact arithmetic modulo
`zeta²+zeta+1` checks both line factorizations, `2T=A`, `3T=(-zeta,0)` and
`6T=O`, and the H/J norm identities. At T the implicit expansion is
`y=3+2zeta²t+(zeta/3)t²+…`, so ell has leading unit `zeta/3` and fT has
leading unit `1/108`. At A and B, the vanishing squared function has leading
unit `1/4`; at B, ell has leading unit `-2zeta²` and the tame sign makes the
residue **positive** `2zeta²`. All T/A/B/O rows cancel using
`cT*cA*cB=1`.

At the degree-two Q-point, the uncorrected transferred residue is
`1/(4zeta²)` in Q(zeta), not its norm `1/16`. Its sixth power cancels the
rational correction `(1/4)^(-6)`. The A/B/O cancellations hold. Removing
3-torsion root-of-unity symbols is valid only in rational K2, as stated.
Independent diamond expansion gives coefficients
`7,2,-5,2,-2,-4` at `O,T,2T,3T,4T,5T`, reducing by oddness to
`6R(T)-3R(A)`. The source factor one-half and conjugation give the packet's
individual and transferred regulator expressions. The imaginary trace
simplification uses rational real structure, and the Deligne-cycle coordinate
still requires ER.2's conversion.

**Arithmetic eligibility.** The positive I1 example and the infinite-order
negative residue are supplied by the parent/E.8 certificates. I corrected the
11a3 scalar to specify its evaluation on
`omega0=(dx/(2y+1))/Omega_plus`, the positive period-one differential. The
unnormalized Néron-differential evaluation multiplies the scalar by
`Omega_plus`; this rescaling is also an acceptance property and a suggested
file comment. Global integrality and a p-adic special-value equality are not
inferred from a horizontal certificate.

## Source issues, red-team findings, API and prototype

Both source issues now have independent `confirmed` verdicts with the exact
job id in `by`:

- **E28:** direct version comparison confirms missing `alpha^(-nu)` in
  v2 Theorem 2.2(1), p.6, and its presence in AM Theorem 2.2(1), p.7.
  Without it the U_p relation fails coset additivity. This is a preprint
  misprint already corrected in the inspected accepted manuscript.
- **E29:** the AM's displayed masses and Gauss sum produce
  `gamma^(-nu) tau(chi) L(E,chi^(-1),1)/Omega^sign` by finite Fourier
  summation, agreeing with the owner's twisted Mellin and L2 statements.
  For the odd quadratic character mod three, `tau²=-3`, hence
  `3/tau=-tau`; the printed factor has the opposite sign even though
  chi equals its inverse. Checked AM Theorem 2.3, p.7, and §3.4, p.16.
  The version history, publisher preview, author page and public correction
  searches yielded no separate correction. The unread published theorem
  body is outside this verdict.

The two handed confirmed red-team findings are addressed in both the packet
and the reader: **RT-AREA-ktheory-2/10** has direct ER.5 and E.6 imports;
**/11** has direct Coleman L1 and modular-symbol L2/L4 imports and explicitly
requests the D.5-to-Coleman supplier edge. No atlas data or other owner's file
was edited.

All seventeen API items and thirteen tests were checked against the suggested
file. The scalar's four tests distinguish its factor/denominator and scaling;
the relation's four distinguish the rational ratio, zero map and sign; the
symbol's five distinguish the explicit principal divisor, correction/sign,
infinity product and uncorrected failure. The raw residue tables are finite
generator evaluations, not a postulated geometric tame map on all K2. The
certificate API that cannot yet be typed is explicitly named in the signature
gap. Added the omitted étale-factor node to that gap's `neededBy` list.

The suggested file contains real pinned function-field/free-group types and
an existential relation body; it does not use arbitrary proposition fields
to assert the missing geometry. Its omitted actual regulator/certificate/
distribution signatures are honestly documented. The four planets are central
source constructions/comparisons and satisfy the per-layer limit and naming
rules. The five target-coverage entries account for every parent ER.8 target,
including the imported P1 and conductor-14/35/54 examples.

## Validation and handoff

`python3 scripts/check_blueprint.py research/blueprint/packets/EllipticRegulators--ER.8.json`
passes with **0 errors and 0 warnings**. Independent exact characteristic-zero
symbolic computations checked the polynomial/support, group law, local leading
units, tame rows, norm identities, degree-two cancellation, diamond, scalar
and odd-character Gauss test. These are mathematical checks, not Lean proofs.

The **full suggested Lean file was not compiled**. After checking memory
(107 GB available), `lean-check` stopped immediately because the shared build
lacks the imported Tau Ceti `GenericPoint.olean`. No available inspected shared
build supplied that original module's object file. No library build, new Lake
project, cache download, Lean server or extracted Lean file was started. The
planner's earlier algebraic-fragment elaboration is not counted as this
reviewer's compilation. The existing import names and source interfaces were
checked at the pins; whole-file elaboration remains unverified.

No orchestrator decision is needed for this verdict. Follow-up work should
start with the five supplier requests and three exact remaining gaps in the
packet, then replace the omitted geometric signatures and elaborate the full
file in an existing build with the required pinned modules. At assembly,
propagate the explicit 11a3 differential normalization and the baseline count
of eighteen into the reader; its current shorter formula refers to the parent
normalization, and its count of sixteen predates this review. The reader is
outside this review issue's editable deliverables and was left unchanged.
