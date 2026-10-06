# Independent review of EllipticRegulators ER.6

Accepted after corrections. Job `REV-EllipticRegulators--ER.6`, issue #6439,
6 October 2026. Reviewer: Codex, session `codex-Hx77dG`. The original
follow-up was written by Codex `codex-YKJFCx` for #6487, PR #6609,
commit `58692806`; this session did none of that work.

This is a target-level review of the packet, suggested Lean file and reader.
It accepts a complete planning pass with ER.6 **planned**, rather than closed
or implemented. Four precise supplier requests and one inherited regulator
normalisation gap remain. The packet records a verdict for every final node.

| Item | Result |
| --- | --- |
| Original nodes | 8: 2 verified, 6 corrected |
| Added nodes | 3 existing reused API lemmas promoted to declaration nodes |
| Final nodes | 11; none unverifiable; all implementation statuses unchecked |
| Definition/construction APIs | 11 items retained |
| Definition/construction tests | 8 retained, four for each object |
| Baseline citations | All 23 confirmed; none removed, replaced or added |
| Baseline descriptions corrected | 1: mixed-linearity tensor lift |
| Planets | 4 new plus 2 parent ER.6 planets, total 6 |
| Sources | 4 public PDFs independently obtained; all recorded hashes match |
| Source findings | Empty `sourceIssues`; no mistake found in the used passages |
| Gaps and requests | 1 inherited gap; 4 requests, including 1 added during review |

## Corrections

1. The DJZ source identifier remains `DJZ.2006`, but its edition and
   `sourceVersions` citation now distinguish the actual arXiv v2 date,
   4 May 2005, from journal publication in 2006. The downloaded bytes and
   SHA-256 were already correct. This is a packet metadata correction,
   not an erratum in the paper.
2. ER.2's parent target node computes the real Deligne target and its real
   dimension; its API does not construct the rational structure required
   by the determinant. Added an exact ER.2 request for
   `B = H¹(E(C), Q(1))⁻`, with `Q(1)=2πiQ`, minus for geometric `c*`,
   its inclusion in the real minus part, the canonical comparison
   `R ⊗Q B ≃ H²_D(E_R,R(2))`, rational dimension `[F:Q]` and determinant
   line. The determinant and its users now explicitly consume this request.
   Combined de Rham conjugation is still coefficient conjugation composed
   with geometric conjugation: on the imaginary Tate twist it is `−c*`.
   This request is separate from comparison with the universal regulator.
3. E.6's current model, model-independence and good-prime statements concern
   number fields. They do not by themselves define the integral image over
   a completion or its finite extension. Strengthened the existing request
   to construct these local images from regular proper flat models, prove
   local model independence and prove the good-reduction equality using
   S.3 localisation and E.5's finite-field K₁ calculation. Retained the
   request for finite-extension reflection, local-global membership and
   justification of the passage from Scholl's Adams-weight statements to
   full rational K₂ through S.6. The proof now identifies those local
   supplier obligations explicitly.
4. The ER.5 Hecke route is restricted to the actual supplier's E/Q,
   maximal-order, class-number-one CM setup. It cannot supply continuation
   and a functional equation for arbitrary CM elliptic curves over number
   fields. The general number-field equivalence remains conditional on the
   completed continuation and functional equation with the stated conductor.
5. Corrected the description of
   `TensorProduct.AlgebraTensorModule.lift`: its input is R-linear in the
   first variable and Q-linear in the second, for R a Q-algebra. This gives
   the R-linear extension on `R ⊗Q I`; it is not an unspecified change of
   linearity. The declaration and citation themselves were correct.
6. Two excerpts were broken by PDF line layout. The vertical-obstruction
   anchor now uses the contiguous phrase “no non-zero multiple”; the
   Scholl II extension anchor uses “stable under”. Locators and mathematical
   matches remain unchanged.
7. Promoted `regulatorDet_changeBetti`,
   `HasDeterminantWitness.surjective` and
   `HasDeterminantWitness.rescaleValue` from outlined API items to lemma
   nodes because other nodes use their statements as prerequisites
   (PROTOCOL §4). Their APIs and existing Lean signatures are retained.
   Each added node has `addedBy: REV-EllipticRegulators--ER.6`, a direct
   dependency, proof sketch and acceptance criteria. These are already
   exposed, reused declarations, rather than subdivisions of target proofs.
8. Updated summary, coverage and suggested-file boundary comments to reflect
   the four interfaces, added declarations and local supplier scope. Added
   independent verification records to all baseline entries and the required
   top-level review object.

## Public sources and locator checks

The following exact public versions were independently downloaded. Every
SHA-256 agrees with the packet. No private Bloch scan was used: Bloch's class
and nonvanishing theorem are imported contracts from the reviewed parent,
not newly sourced claims from this review.

| Source | Public version read | Sections checked |
| --- | --- | --- |
| Dokchitser–de Jeu–Zagier | [arXiv math/0405040v2](https://arxiv.org/pdf/math/0405040v2), 4 May 2005 | §§2–3, pp.3–7; §8, pp.22–24, including Theorem 8.3 and its proof |
| Schappacher–Scholl | [author retypeset version](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/RSS.pdf) of the 1988 paper | §§0–1.2.3, PDF pp.1–4; §7, PDF pp.18–20 |
| Scholl, Integral elements I | [author version](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/k1.pdf), 2000 | Introduction and §1, PDF pp.1–9, especially §1.3.3, Corollary 1.3.4 and Proposition 1.3.6 |
| Scholl, Integral elements II | [arXiv 0710.5453v1](https://arxiv.org/pdf/0710.5453v1), 29 October 2007 | §§1–2, PDF pp.1–5, especially the discussion before diagram (3) |

The source hashes and complete URLs remain in `sources` and
`sourceVersions`; reproduction does not depend on disposable scratch files.
Every final node's locator and excerpt was checked, including the three
promoted API lemmas. The source `match` fields distinguish derived linear
algebra and genus-one substitutions from statements actually printed in the
papers.

DJZ Conjecture 3.11, footnote 3, and Remarks 3.12–3.14 separate rational
rank, nondegeneracy and constructed regulator subspaces. Schappacher–Scholl
§1.1.0 and Theorem 1.1.2 fix the rational target structure; §1.1.3(iii)
does not turn constructed classes into a proof of injectivity. DJZ §2
provides the conductor/gamma calculation under analytic continuation and
the functional equation, rather than proving those inputs for all curves.

For the vertical example, substitute genus one, `b₁=1`, `b₀=12` in DJZ
Theorem 8.3(2):

`y²+(x+12)y+x³=0`,
`−4t(x)=(x−4)(4x²+15x+36)`.

The quadratic has discriminant `−351` and value `160` at `x=4`, so the
factor `m=x−4` has `m(0)=−4`. The prime 2 divides this constant but not
`b₁=1`; the theorem gives a non-torsion vertical obstruction for the
horizontal symbol `{y²/x³,(x−4)/(−4)}`. No nonzero multiple is integral.
With `u=−x`, the Weierstrass coefficients are `(-1,0,12,0,0)`,
`c₄=289`, `Δ=−561600`, and `v₂(j)=−6`. Thus it also fails potentially
good reduction at 2; it does not contradict the local descent theorem.

Scholl I's alteration transfer and localisation, together with Scholl II's
explicit finite-extension discussion, supply the requested descent argument.
Scholl II's ℓ-adically unramified motivic group is not the horizontal tame
kernel. No identification of these notions or misuse of its Theorem 1.1 is
needed. No new source error was discovered; the empty `sourceIssues` remains
appropriate.

## Pinned baseline verification

All 23 declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`; the existing shared Mathlib tree
has exactly that HEAD. The following table groups citations without omitting
any. All statements have the hypotheses and conventions required by their
uses. No Tau Ceti declaration is cited in `baseline.declarations`.

| Declarations | Module under `Mathlib/` | Actual input checked |
| --- | --- | --- |
| `Module.Basis` | `LinearAlgebra/Basis/Defs.lean` | Linear equivalence with finitely supported coordinates |
| `Module.Basis.baseChange`, `baseChange_apply`, `baseChange_repr_tmul` | `LinearAlgebra/TensorProduct/Basis.lean` | Scalar-extended basis and coordinates of pure tensors |
| `Matrix.det`, `det_mul`, `det_fin_zero`, `det_fin_one`, `det_fin_two` | `LinearAlgebra/Matrix/Determinant/Basic.lean` | Signed determinant, multiplication, and dimensions 0, 1 and 2 |
| `Pi.basisFun` | `LinearAlgebra/StdBasis.lean` | Coordinate basis of finite function spaces |
| `TensorProduct.AlgebraTensorModule.lift`, `lift_tmul` | `LinearAlgebra/TensorProduct/Tower.lean` | Mixed R/Q bilinearity and evaluation of the R-linear tensor extension |
| `Module.rank_baseChange` | `LinearAlgebra/Dimension/Constructions.lean` | Rank preserved under base change with its free-module/nontrivial scalar hypotheses; these hold over Q and R |
| `Complex.tendsto_self_mul_Gamma_nhds_zero` | `Analysis/SpecialFunctions/Gamma/Deriv.lean` | Residue-one limit at zero |
| `Complex.Gamma_one`, `Gamma_add_one` | `Analysis/SpecialFunctions/Gamma/Basic.lean` | Value at one and functional recurrence with its nonzero argument condition |
| `analyticOrderAt`, `AnalyticAt.analyticOrderAt_eq_natCast` | `Analysis/Analytic/Order.lean` | Analytic order and factorisation by a nonzero analytic unit |
| `WeierstrassCurve.LFunction`, `LSeries` | `AlgebraicGeometry/EllipticCurve/LFunction.lean` | Arithmetic coefficients and raw complex series; no continuation or functional equation |
| `WeierstrassCurve.c₄`, `Δ` | `AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | Exact invariants of the displayed equation |
| `Matrix.isUnit_iff_isUnit_det` | `LinearAlgebra/Matrix/NonsingularInverse.lean` | Determinant unit iff matrix unit over the required commutative ring |

No near miss was treated as a theorem. The single description repair is
item 5 above; all 23 references remain. In particular the raw elliptic
`LSeries` is never silently substituted for an entire continued function.

## Closure, suppliers and target coverage

Read the reviewed ER.6 library audit (`AUDIT-28`, verdict not built), parent
packet, original reader and all direct supplier statements. The linear
algebra, gamma and elliptic-series baseline is reused; the missing arithmetic
integral image, regulator and Beilinson proposition are owned by their
existing roadmaps. The two upstream style documents, ArithmeticDirichletSeries
and HodgeStructures, were read for scope and density. The upstream
EllipticCurves local-field layer supplies the definition of potentially good
reduction after finite extension and minimisation, and the j-integrality
criterion. It does not construct the regular scheme required for K-theory;
that interface stays with E.6.

The parent ER.6 nodes realise the restricted regulator, the full conjectural
statement, the three distinct conclusions, the vertical step and equivalence
of the L-value formulations. The follow-up makes their determinant,
logical-strength, analytic and descent contracts explicit. All stage targets
are accounted for; no target is discarded and no conjecture is claimed proved.

For a nonzero determinant witness, the regulator images form an R-basis of
the target, and the tuple is a Q-basis of its own span. They need not span the
whole integral image. The real scalar-extended regulator is surjective.
Adding **real scalar-extension injectivity** makes the tuple a basis of the
whole rational space, by faithful scalar extension. No prior finiteness
assumption is needed. Rational injectivity alone is weaker: the Q-linear map
`Q² → R`, `(a,b) ↦ a+sqrt(2)b`, is injective but its real extension has a
kernel. The packet uses the stronger condition correctly.

The completed functional equation, with all finite factors, gives

`L*(E,0) = w N (2π)^(-2d) L(E,2)`.

Consequently `q₂=q₀ w N 2^(-2d)`; the same rational coefficient is not
preserved. For `d=1,N=32,w=1`, the factor is 8. For number fields the
completion uses `d=r₁+2r₂` and
`N=|disc F|² Norm_(F/Q)(f_E)`. Continuation and the functional equation
are assumptions there. Over Q, the actual supplier is
`EllipticCurveModularity:R29.6/l-function-continuation`; nonvanishing at two
is explicitly requested for the exact-order conclusion. The ER.5/AL.1 route
has the restricted CM scope recorded above.

The local argument takes each completion separately, chooses a finite
extension with good reduction, uses local good-reduction integrality,
reflects membership and then applies local-global membership. It does not
require a single global field giving simultaneous good reduction. Its full
rational K₂ version awaits the explicit E.6 weight-decomposition interface,
rather than assuming Scholl's weightwise theorem already has that type.
The ER.5 Bloch class then belongs to the integral image. Its universal
regulator is nonzero only under the inherited ER.2 comparison hypothesis.
This gives neither a full-rank theorem nor regulator injectivity.

Checked the combined declaration prerequisites and the atlas stage edges:
there is no declaration cycle, nor a return path from ER.6 to R29.6 or ER.2
that would make either supplier edge circular. Read both the result and
independent confirmation of `RT-AREA-ktheory-2/9`. The packet and reader
correctly include the R29.6 dependency, distinguish the raw series from
continuation, and retain conditional number-field analytic inputs.

## API, tests, suggested file and planets

The determinant's five API items cover its matrix formula, frame change,
Betti basis change, zero and pullback. The witness's six cover construction,
nonzero determinant extraction, rational value rescaling, basis invariance,
lifting along a surjection and real surjectivity. Neither object is a
structure requiring an additional extensionality theorem; their equalities
and equivalences provide the observed interfaces without unfolding them.

The determinant tests check identity, empty determinant, transposition sign
and scalar multiplication. They catch reversed or unsigned conventions and
incorrect handling of dimension zero. The witness tests check the identity
map, excluded zero value, zero regulator for positive dimension and a
projection with extra kernel. The last test catches accidental inclusion of
injectivity in the weak predicate. Each object has four tests, above the
required three. All eleven API names and eight test statements are present
in the suggested file; the three promoted declarations retain their existing
signatures.

The definitions `regulatorDet` and `HasDeterminantWitness` are concrete.
Unproved API and theorem statements use `sorry` openly. Arithmetic signatures
for local integrality and the Bloch class are explicitly omitted until the
imported K₂ and Deligne objects exist; their exact targets remain in the
packet and boundary comments. No vacuous replacement or assumed theorem is
introduced to force elaboration.

The four new planets expose the regulator determinant, weak Beilinson
statement, elliptic functional equation comparison and potentially-good
integrality. With the parent's restricted regulator and full conjecture
planets there are six. The promoted
API lemmas receive no extra planets.

## Validation and orchestrator follow-through

`python3 scripts/check_blueprint.py research/blueprint/packets/EllipticRegulators--ER.6.json`
reports zero errors and zero warnings for the final packet. `lean-check`
on the suggested file succeeds with only declaration-uses-sorry warnings.
The shared Mathlib is exactly pinned. The file imports only Mathlib; the
shared Tau Ceti tree is newer than its recorded pin and contributes no input
to this elaboration. No Tau Ceti compilation at its pin is claimed, and no
library build, cache download or language server was started.

Independent exact-rational arithmetic also checks the example's c₄,
discriminant, 2-adic j-valuation, quadratic factor and conductor-32 rescaling.
These checks supplement the proof review; the suggested theorem proofs
remain unimplemented.

No unanswered mathematical question blocks this review. Supplier and
assembly work remains:

- ER.2 should expose the requested Betti rational API and separately resolve
  its inherited universal-regulator normalisation comparison.
- E.6 should provide the specified local model/good-reduction and descent
  interfaces with the weightwise-to-full-K₂ justification.
- R29.6 should expose its continued function and nonvanishing-at-two interface;
  the upstream local reduction layer is consumed without replanning it.
- Assembly should update the reader's old count of three requests to four,
  add the precise rational Betti and local-model obligations, restrict the
  CM analytic route, and list the three promoted API nodes. The reader was
  reviewed but is outside this issue's permitted edits. Its original
  determinant and local-descent discussion is retained; the corrected packet
  and suggested-file comments are the authoritative contracts for assembly.

Acceptance certifies this planning pass and the recorded boundaries; it does
not close the supplier requests or the inherited gap.
