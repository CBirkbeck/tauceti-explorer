# Independent review of Drinfeld modules, t-motives and characteristic-p special values

**Accepted as a complete planning pass, with open inputs recorded.** This review covers
DM.0–DM.7 in `DrinfeldModulesAndTModules--DM.0.json` and its suggested Lean file.
All eight stages are `planned`; none is `closed`. Acceptance does not claim that
the mathematical proofs or the omitted geometric interfaces have been implemented.

Reviewer: Codex (GPT-6), session `codex-ljXclE`, 11 October 2026.
Job: `REV-DrinfeldModulesAndTModules--DM.0`, issue #513. This session wrote none of
the input, authored by `codex-zJGrQH` continuing `cc-fb70e5`.

## Counts and scope

| Item | Before | Reviewed |
| --- | ---: | ---: |
| Targets | 75 | 75 |
| Definitions / constructions / theorems / comparisons | 18 / 30 / 22 / 5 | unchanged |
| API items | 195 | 216 |
| Unit tests | 151 | 152 |
| Planets | 42 | 42 |
| Pinned baseline declarations | 21 | 21 |
| Recorded gaps | 10 | 16 |
| Supplier requests | 10 | 8 |
| Source issues | 6 | 10 |

The packet records a specific verdict and explanation for every target: 57 corrected,
18 verified unchanged, no added or unverifiable nodes. No proof was expanded into
lemma-level nodes. The 368 API/test names have a matching interface-register entry:
137 signatures, 118 examples, 10 coordinate interfaces and 103 explicit omissions.
Every definition and construction retains at least three discriminating tests.
The added nonreduced-base test detects an incorrect relative dimension definition.
The planets are definitions, central constructions and named theorems, with at most
six per stage; their names and allocation required no changes.

## Mathematical corrections

1. **Uniformization morphisms require equal ranks.** Brownawell–Papanikolas §2.4,
   pp. 6–7, constructs a finite subspace polynomial only after the lattice quotient
   has finite index. DM.2 now fixes the same positive rank for both objects. For
   `A=F[t]`, the inclusion `A ⊂ A+Aα` with `α∈F_(q²)∖F` is a scalar inclusion
   between ranks one and two, but cannot produce a nonzero Ore intertwiner.
   The lattice category, uniformization equivalence and morphism theorem agree.
2. **Relative dimension includes its annihilation bound.** Hartl Definition 1.1,
   p. 2, requires both locally free rank `d` of the cokernel and annihilation by
   `J^d`. An unspecified power defines effectiveness without the specified
   dimension. Over `R=F[ε]/(ε²)`, multiplication by `t−ε` has cokernel `R`, killed
   by `t²` but not `t`. The packet includes this negative example, and the Lean
   test states the corresponding polynomial-ideal memberships. The field-only
   coordinate motive still permits an unspecified support exponent: Hartl
   Proposition 2.3(d), pp. 5–6, proves the dimension bound there.
3. **Characteristic completion is locally free.** Hartl Definition 7.1 and
   Example 7.2, p. 27, use a locally free `R[[z]]` module. Freeness requires a
   local frame. DM.1 and DM.7 now retain the compatible residue-field embedding,
   characteristic factor, `q^deg(p)` Frobenius and the dimension-one cokernel
   killed by `z−γ(z)`. Neither target substitutes separable points for connected
   characteristic torsion.
4. **Purity has a substantive weight theorem.** The previous native
   `weight_eq` repeated the definition `weight=d/r`. The revised signature
   takes an actual infinity lattice and proves `u/v=d/r` for every witness.
   `PureLattice` exposes all its rank, spanning and Frobenius conditions.
   See Brownawell–Papanikolas §4.1, p. 15, and Maurischat Definition 7.1,
   p. 35. Perfect coefficients remain explicit for the raw-image formulation.
5. **Nuclear cyclicity retains all source hypotheses.** Taelman Theorem 2,
   p. 380, requires `a`, `ab` and `ba` locally contracting, not merely the
   two products. The packet and signature now state the linear-in-series-variable
   identity with these three hypotheses. Determinants remain independent of
   common nuclei for the chosen norm; unrestricted norm independence and an
   arbitrary-series cyclic law were removed.
6. **The tangent series acts on the source.** The native `tangentDelta` now
   has coefficients `(t1−γ⁻¹t2γ)t1^(n−1)` on the source space, matching Taelman
   pp. 385–386. This agrees with the determinant orientation
   `[Λ1:Λ2]·|H2|/|H1|`, and hence with the class numerator.
7. **Completed coefficient rings retain their factors.** DM.5 now says that
   `Frac` of a split coefficient algebra means its total quotient ring, generally
   a product of fields. The rational scalar extension is kept separate from
   the full Laurent-series completion, as required by Stalder's period-ring
   algebraization argument.
8. **The analytic domain is explicit.** The coordinate t-module exponential,
   uniformizability predicate and period kernel now all take `1<‖θ‖` as an
   argument. Their domain agrees with the generic-characteristic infinity
   setting of Brownawell–Papanikolas §3.1, pp. 8–10.
9. **Period-ring cohomology is not restricted to curves.** A finitely generated
   coefficient field can have higher transcendence degree. Stalder's Claim 5.2
   and Lemma 5.3, p. 27, use proper normal models. The packet chooses a
   projective normal model and bounds the exceptional divisors by an effective
   Cartier divisor. Proper coherent finiteness supplies the bounded-pole section
   space in any dimension; the curve-only cohomology import was replaced by
   the read SF.2 `ample-serre-vanishing` contract with a chosen ample line.

The API additions give action/matrix/carrier extensionality, identities and
composition laws, compatible-system construction and extensionality of the Tate
limit, and `F`-scalar linearity of the lattice exponential with its scalar-tower
hypothesis. Relative family, level-frame, modular-section and chain-map
extensionality are explicitly named mathematical interfaces where their full
native geometric carriers are omitted. Geometric-point values are not used to
identify sections over a nonreduced base.

## Sources and source issues

Each node's statement, hypotheses and cited locator was compared with its public
source. Fourteen downloaded PDF artifacts match the packet's recorded SHA-256
values. The deposited published Stalder PDF could not be retrieved as an artifact;
its published recap on p. 595 was checked through the publicly indexed text.
Its existing artifact hash was not independently verified. No uncleared book or
alternative copy of such a book was used.

The packet retains the exact public versions: the [Brownawell–Papanikolas survey](https://arxiv.org/pdf/1806.03919v1),
[Pink's author copy](https://people.math.ethz.ch/~pink/ftp/Pink_DrinfeldModularForms_2012.pdf),
[Hartl's preprint](https://arxiv.org/pdf/1706.06807v1) and
[published article](https://journals.sns.it/index.php/annaliscienze/article/download/668/654/886),
[Papikian's public lectures](https://websites.umich.edu/~asnowden/seminar/2017/drinfeld/ODM.pdf),
[Taelman](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf),
[Wiedmann](https://www.uni-math.gwdg.de/wiedmann/Diss_Englisch/master.pdf),
[Tamagawa](https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/0884-17.pdf),
[Stalder's preprint](https://arxiv.org/pdf/0809.0224v1) and
[published deposit](https://www.research-collection.ethz.ch/bitstreams/47bc6b90-ad56-4a15-a6c8-46b7da8de09f/download),
[Ngo Dac's HAL version](https://hal.science/hal-03298790v1/document),
[Thakur](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/ffafinal.pdf),
[Crew's notes](https://people.clas.ufl.edu/rcrew/files/LCFT.pdf),
[Hartl–Yu v2](https://arxiv.org/pdf/2009.13934v2), and
[Maurischat's online-first article](https://aif.centre-mersenne.org/item/10.5802/aif.3754.pdf).
The HAL cover offsets its PDF numbering by one; Maurischat's PDF cover likewise
offsets printed pages. Their packet citations use printed page numbers.

Source locator changes are recorded in the diff and per-node review notes.
In particular, Hartl 3.9 is a **theorem**, 6.3 a **lemma**, and 6.5 a
**proposition**. Pink's standardization is Proposition 3.4, pp. 11–12.
Stalder's period construction is Definitions 6.6 and 6.10, pp. 37–38;
5.5 is a definition, not a proposition. Taelman's finite-module notation is
on pp. 369 and 376, and nuclear theory starts on p. 377.

All six existing source issues are confirmed, with corrected locators:
E2's preprint display is on p. 9; E3's preprint recap on p. 43; E4's three
subscript occurrences span pp. 18–19; E6's preprint proof is on p. 10.
E2 is already corrected in the published article. Four findings were added:

| Issue | Locator | Correction and independent check |
| --- | --- | --- |
| E7 | Brownawell–Papanikolas, after (2.2), p. 6 | Evaluate the sublattice polynomial at `az`; its derivative must be `a`, not one. |
| E8 | Hartl–Yu v2, (3.7), p. 18 | Use unordered subsets in the coefficient sum. For `q=2,r=2,i=2`, ordered tuples repeat the nonzero leading product six times and incorrectly give zero. |
| E9 | Stalder preprint, Proposition 6.4 proof, p. 36 | The induction branch keeps the exponent `m` in `q^m−1`; division of the preceding inequality verifies it. |
| E10 | Stalder preprint, Theorem 5.4 proof, p. 28 | The tensor `V(M)∨⊗V(N)` identifies with `Hom(V(M),V(N))`, without a second source dual. |

Each entry has this review's `confirmed` verdict, an original diagnosis and a
search record. E8 changes a displayed coefficient identity; the roadmap uses the
correct finite product and unordered expansion. No claim about an uncollated
journal version of the new preprint findings is made.

## Baseline and ownership

All 21 baseline names and their supplying statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. None was removed or replaced.
The packet now records an independent confirmation on each entry. In particular:

| Native input | Checked convention or limitation |
| --- | --- |
| `SkewPolynomial`, `SkewPolynomial.monomial_mul_monomial` | Native coefficient skew ring and twisted multiplication; FF.4 owns its polynomial-composition comparison. |
| `FiniteField.frobeniusAlgHom`, `FiniteField.coe_frobeniusAlgHom` | Works for commutative coefficient algebras, not just fields. |
| `Polynomial.aeval`, `Polynomial.algHom_ext` | Polynomial generator extension/extensionality with the required algebra structure, including the Ore target. |
| `Polynomial.Separable`, `Polynomial.card_rootSet_eq_natDegree` | Field root/separability hypotheses are retained; these do not prove relative strict-group theorems. |
| `Module.End`, `RingHom.ker`, `Ideal.span` | Native endomorphism, characteristic-ideal and generated-ideal carriers. |
| `TauCeti.CommHopfAlgCat.kernelSpec` | Kernel scheme is a contravariant quotient construction on Hopf algebras. |
| `TauCeti.AdditiveGroup.gaPointsMulEquiv` | Native additive-group functor of points over a commutative value algebra. |
| `PowerSeries.IsRestricted.subring` | Native ultrametric restricted-series carrier at a specified radius. |
| `LinearMap.charpoly` | Finite free module characteristic polynomial; DM.6 adds the monic finite-module comparison. |
| `UniformSpace.Completion`, `NormedField.instCompletableTopField` | Native completion and field instance; an algebraic-closure extending norm is still an input. |
| `AlgebraicGeometry.Scheme.Modules`, `.Modules.pullback` | Actual sheaf category and contravariant pullback functor. |
| `SheafOfModules.IsLocallyFree`, `.IsFinitePresentation` | Local freeness alone does not impose finite rank; native finite presentation is reused. |

The reviewed library audit does not provide Drinfeld modules, motives or their
realizations. It does identify the duplicated generic polynomial direction.
For **RT-AREA-finitefields/13**, both packet and companion reader give FF.4 the
single Ore/composition owner. The Lean namespace is an adapter to the pinned
skew ring, not another foundational target. The three older FF.4 field-only
linearity/root/subspace nodes retain their actual hypotheses; only the newer
Ore comparison has arbitrary commutative coefficient-ring generality. The old
request claiming arbitrary rings for all four nodes was removed.

Current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` already has
`fittingIdeal`, `fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_quotient_zero`
and `fittingIdeal_baseChange`. Their statements were read, as were the current
StableReduction and IntegralHeckeAndGaloisDeterminants supplier documents.
They are absent at the build pin and are not added as false pinned citations.
DM.6 plans only its monic characteristic-polynomial comparison.

Current TauCetiRoadmap `070dc2becd74419e76303ede84b465ed4a69461f` was read,
including relevant README and Suggested statements. Existing AlgebraicCurves
Layers 2, 3 and 5 replace blanket FA.1/FA.2 requests. Existing
AlgebraicVectorBundles L0B/L2B replaces vector-bundle foundations; JacobianChallenge
A–C supplies divisor twists and curve cohomology. The atlas lacks the newer
AlgebraicVectorBundles stage identifiers, so exact contracts are retained in
`upstreamImports` with a catalogue-registration gap, rather than invented
pinned declarations. AdicSpaces' restricted-series input is retained.

Unsupported supplier imports were corrected in place:

- SF.2 is sites/cohomology, not the strict finite F-module/finite-shtuka
  anti-equivalence. Hartl Definitions 4.1–4.2, 4.5 and Theorem 4.7,
  pp. 12–15, specify the missing shared input, routed as a Part II gap.
- HS2 does not supply Hartl's equal-characteristic local-shtuka category.
  The exact completion and finite-group comparison is a Part II/reassignment
  gap, not a claim about Fargues–Fontaine moduli.
- SF.4 is not the blanket Proj/normalization/quotient supplier. Exact SF.0
  and SF.1 nodes now supply those portions. Projective quotient descent and
  the normal section-ring comparison remain separate inputs.
- SF.1 affine/QCoh descent, SF.2 Hilbert 90, its étale abelian-sheaf/Galois
  comparison and proper Noetherian Serre vanishing are used only within
  their read hypotheses. Finite étale bases and compatible limits are not
  inferred from the sheaf comparison.

## Checks and orchestrator actions

`check_blueprint.py`, also run against an index of the shared pinned source
trees, reports **0 errors, 0 warnings**. Source-issue and source-version schema
checks pass. The full revised
suggested file elaborated with `lean-check` at the shared pinned build,
exit 0, with **311 `sorry` warnings and no other diagnostics**. The interface
register covers every API/test name exactly once. Intake checks report
**four files, zero problems**; `git diff --check` passes.

The ten previous gaps remain explicit; five mathematical/supplier integration
gaps and one catalogue gap were added. Coverage `remaining` lists were regenerated
from the exact gaps and requests. The complete pass satisfies the target-level
budget rule without a closure claim. Source proofs that cite an uninspected
non-routine input, especially rank integrality, analytic surjectivity,
standardization, reciprocal normality, Tate saturation and elliptic-chain
category reconciliation, remain clearly identified.

The companion reader is outside this review's allowed edit paths. Its FF.4
ownership conclusion was checked and is correct, but its mathematical text and
supplier lists must be synchronized from this reviewed packet before packaging.
The handoff identifies the affected targets. Register the current bundle imports,
route the shared Part II gaps to one owner each, and preserve the public-version
qualification when collecting E7–E10. There is no additional job claimed by this
session and no unresolved contradiction in the corrected plan.
