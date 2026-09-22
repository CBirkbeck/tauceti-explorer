# Benoist: the period-index problem for real surfaces

This is a partial continuation of [PR1673](https://github.com/CBirkbeck/tauceti-explorer/pull/1673), by Codex, session `codex-c83e7a`, for issue1454. The complete 48-page published paper has been reread. The main advance is a typed repair of the degree-two argument when the Brauer evaluation is constant on the real components to be avoided. That condition covers both parity cases of the main induction. The unrestricted propositions and several foundational source proofs remain open; this report does not claim formalisation or full transitive proof closure.

## Source and coverage

The primary source is [the published article](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf), Publications Mathématiques de l’IHÉS130 (2019), pp.63–110, DOI10.1007/s10240-019-00108-7. Its SHA-256 is `8dfc0f221ab510ba1ecfe7c5b5fde12c217019f33d704ea89ce1a0c144398d3b`. Every published page, proof and reference was read in this continuation. Pages70,71,72,76,84,85,88,98,99,100,103,107 were additionally inspected as images.

The [author copy](https://www.math.ens.psl.eu/~benoist/articles/realperiodindex.pdf) has SHA-256 `e4c90a314c6d9ea38d3bd8498a6ec050aa763c4150890c98cc295390ef4ece2a`. Targeted comparisons cover its PDF pages9,14,22–23,36–38. The old arXiv and other prerequisite readings remain attributed to PR1673. No assertion that every alternate version was independently read or that the versions are textually identical is made.

For the new repair, [Benoist–Wittenberg I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), SHA-256 `daeb43ec861bd6c30564543dac796c55c7f21aa943c442f826b32613e72a46a9`, was read on pp.16–19 and39–40. This includes the fixed-locus decomposition, the coefficient-change square, and the complete proof of Proposition2.9. In particular, Picard primitivity applies to a smooth open variety, with no properness assumption in that first assertion. The other proofs of this 77-page source are not newly certified.

The inventory preserves all151 previous IDs and adds16 items. There are **167 items:11 library,8 planned,148 missing**. All148 missing items now have exactly one route. The65 definitions/constructions retain an API outline and at least three tests; the four new constructions have structured APIs and explicit consumer uses. Eighty-four direct dependency edges cover the new argument and affected consumers. The remaining old proof spines are outlines, not a complete dependency graph.

## What the paper establishes

The paper proves period equals index for real-surface Brauer classes that evaluate trivially at every real point. For an unramified class on a smooth projective real surface, it identifies a precise obstruction in the first real component of a mod-2 Kummer lift. It also treats real Enriques surfaces, the Elman–Lam u-invariant in transcendence degree two, and a non-archimedean real-closed counterexample. Its complex comparison argument uses moving hypersurfaces, integral cohomology and a Noether–Lefschetz cone.

The inventory includes the field Brauer arithmetic, all numbered main-paper results, the real-locus and trace constructions, the double-cover geometry, the Hodge variation argument, and the principal external inputs. G11 remains because several original prerequisite proofs have not yet been read to declaration-level closure; those may expose further intermediate objects.

## A typed repair sufficient for the main induction

Use the paper’s Assumptions3.1 and4.1. Write a for its period-two class, aTilde for a Kummer lift, and Psi for the avoided clopen real subset. Assume the first component of aTilde is zero on Psi and its zeroth component there is one constant t, either0 or1. The double cover is etale over Psi and has no real point above it.

First, the computation in Proposition4.4 gives the first component of the boundary class as t times the first component of the covering class. Multiply the Picard correction in the replacement preceding(4.6) by t. The two contributions then cancel. This repairs the component calculation and the remainder of its diagram chase, **conditional on the exact Jannsen comparison in item149**. It does not establish that unread comparison. This is item162.

The correction of Proposition4.5 uses the later trace quotient and has no circular dependence on the splitting theorem:

1. Restrict to U0, obtained by removing finitely many bad points, so that the cover is finite flat with smooth branch. An integral Brauer lift beta upstairs witnesses vanishing of the pulled-back Kummer Bockstein. The proof of Lemma7.2 requires only this vanishing, not full splitting of the Brauer class.
2. The exact trace sequence supplies integral classes eta and zeta with aTilde equal to the reduction of eta minus phi(zeta). Define the integral class b upstairs by subtracting psi(zeta) from the pullback of eta. Its reduction is the pulled-back Kummer class, and its trace is twice eta. No integral lift of aTilde on U0 is assumed.
3. Write beta restricted upstairs as b plus twice gamma0 plus the cycle class of phi0. Globally write the trace of beta as twice delta plus the cycle class of theta1. Subtraction gives twice the discrepancy between delta, eta and the trace of gamma0 as a Picard class. Torsion-freeness of the Picard cokernel divides that equation and supplies a line bundle mu, extended to S.
4. Over Psi, the quotient Q is the sign local system of the double cover. Its twist Q(1) has trivial stabilizer action, while its ordinary monodromy may remain nontrivial. Formula(2.12), equivalently BW1(1.33), gives the first component of phi(zeta) as the twisted Bockstein of t. This is t times the first component of the cover class, hence t times the real cycle class of a line bundle lambda. The integral class eta has zeroth component zero. These identities give the same first component for eta.
5. There are no real preimages over Psi, so the trace of gamma0 has zero first component there. Thus delta minus the cycle class of mu+t lambda has first component zero on Psi. Injection on H1 after deleting finitely many real points justifies extending the comparison from U0.
6. Assumption4.1(ii) supplies an **additional** curve class nu. Subtracting it makes this integral class a pushforward, by Proposition3.3. The final Picard correction is theta1+2mu+2t lambda+2nu. The nu term cannot be dropped merely because the restriction to Psi vanishes.

Items158–165 separate these interfaces and preserve the choice dependence of eta, zeta and the Picard extensions. Item166 uses them in the existing geometric/Hodge proof of Proposition6.6, with the added uniform-evaluation hypothesis. It retains G1, G10 and G11.

For the main induction, let alpha have even period n and put a=(n/2)alpha and Psi=Theta(alpha). Evaluation in Br(R)=Z/2 shows that t is n/2 modulo2. Consequently t=1 when n is2 modulo4, but t=0 when n is divisible by4. In the latter case Theta(a) is empty even when Psi is nonempty. The earlier handoff’s identification of these loci was too strong. Item167 records the exact distinction, and the repaired main branch uses item166 in both cases. The odd-period branch has no half-period hypothesis. After quadratic splitting, the restricted period initially only divides n/2; period-index and extension divisibility finish the induction.

For a general nonconstant evaluation function on Psi, the product of that function with a global real Picard class need not have been shown algebraic. Thus unrestricted items66,67,85 retain their original proof gates. The new main branch avoids these items; it does not silently certify them.

## Coefficient signs and library reuse

The pinned Mathlib commit is `082e2d37e8b0463410cdb532e111cd43d5a66174`, and the Tau Ceti commit is `f790474821cf4256814db967cb154e7af3d0c369`. Mathlib already contains the finite cyclic projective resolution, its periodic cochain comparison and the odd/positive-even cohomology formulas. Their actual declaration statements were inspected. These are library items152–154, not a new resolution project.

Mathlib uses the first differential sigma-minus-identity, whereas the source uses its negative. Item155 gives the explicit degreewise sign isomorphism. For even n, the induced reduction on the twisted cyclic cohomology groups is identity in degree1 and multiplication by n/2 modulo2 in degree2. This is item156. It proves the degree-one property used in Lemma7.5 without declaring its circle extension split.

**A previous suspected error is withdrawn:** visual inspection of p.100 shows that the disputed labels denote the diagonal projections. They are not labels of the horizontal coefficient-reduction arrows. This is an extracting-worker reassessment, not an independent review verdict.

With the quotient convention of(7.2), Lemma7.3 and its application in(7.13) require subtraction of the psi term. Its trace is zero, so the subsequent traced equations and final mod-2 correction are unchanged. Equality of the sheaf maps over the etale locus extends using the restriction monomorphism on their **target**. Item157 obtains that property by applying pushforward to the locally constant coefficient extension on the smooth source; it does not assume finiteness over exceptional fibres.

## Routing and ownership

Current inputs were refreshed at `38c5f2bb6aeb10e91ca02161f0dfdcbdaff5952d`:487 file blobs were checked. The reviewed SF.2 audit, current atlas stages, relevant upstream README contracts, proposed roadmaps, packets, decompositions and paper routes were consulted. The prior complete near-area README readings remain separately attributed. The missing equivariant geometry is not inferred from a failed keyword search alone.

| Owner | Route | Items | Existing stage or parent |
|---|---|---:|---|
| SchemeAndStackFoundations | source | 7 | SchemeAndStackFoundations:SF.2 |
| MotivesAndAlgebraicCycles | source | 3 | MotivesAndAlgebraicCycles:MC.2 |
| MotivesAndAlgebraicCycles | source | 3 | MotivesAndAlgebraicCycles:MC.7 |
| AlgebraicModuliForArithmeticGeometry | source | 1 | AlgebraicModuliForArithmeticGeometry:R09.1, AlgebraicModuliForArithmeticGeometry:A0-extension |
| BrauerPeriodIndexArithmetic | part-ii | 3 | tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras |
| EquivariantTopologyRealVarieties | part-ii | 29 | tauceti:TauCetiRoadmap/AlgebraicTopology |
| DegeneratingHodgeStructures | part-ii | 11 | tauceti:TauCetiRoadmap/HodgeStructures |
| QuadraticFormsRealFunctionFields | part-ii | 12 | tauceti:TauCetiRoadmap/QuadraticFormInvariants |
| RealSurfacePeriodIndex | new | 79 | Application owner |
| ShimuraData | source | 1 | ShimuraData:D3 |

SF.2 receives scheme Brauer/Kummer/purity and comparison interfaces. MC.2 receives real/equivariant cycle maps; MC.7 receives the proved divisor cases and primitive Picard-image theorem. The latter must be available as independent leaves rather than depend on general Hodge conjectures. AlgebraicModuli receives the existing coherent/projective family input. ShimuraData:D3 already owns the general variation carrier.

The four shared PartII proposals import their existing parents first. EquivariantTopologyRealVarieties adds only the involution, fixed-locus and ramified-cover interfaces over ordinary topology. DegeneratingHodgeStructures adds geometric/real Hodge criteria over the existing abstract Hodge carrier and shared D3 variation. QuadraticFormsRealFunctionFields extends the ordering-sensitive direction of QFI. BrauerPeriodIndexArithmetic imports the already-built algebraic index and splitting extension before adding class-level period/index arithmetic.

RealSurfacePeriodIndex is the application owner. It imports the topology, cycle, scheme, Brauer, Hodge and quadratic-form suppliers. Items66,67,149 are now routed as explicit unfinished obligations, as section16 requires; ownership is not proof completion.

The same proposed IDs in Benoist–Wittenberg20, Jannsen16, Gao–Habegger19 and Bakker–Klingler–Tsimerman20 were reconciled. The Hodge proposal’s area follows their common arithmeticgeometry assignment. No paper proposal is treated as an accepted planned stage. The newly present Groechenig–Wyss–Ziegler20 gerbe/local-duality tranche and changed Kisin–Pappas18 extraction, the merged Witaszek22 surface-positivity continuation and the new Böckle–Iyengar–Paškūnas23 deformation-ring routes do not introduce a competing owner for this work.

## Source findings and remaining work

The JSON has17 source findings, each with a locator, minimal quoted expression, proposed correction, argument and bounded erratum search. None has an independent-review verdict. The author page, journal record, arXiv history and exact-title correction searches were checked; no matching published correction was located. This is not proof that none exists.

| Finding | Substance |
|---|---|
| E1 | The projective double-cover model has positive-dimensional fibres at branch intersections. |
| E2 | The complex argument must choose an integral lift compatible with its Kummer class. |
| E3 | The first-component calculation omits the evaluation function; constant evaluation permits a repair. |
| E4 | The pushforward proof mixes mod-2 and integral coefficients; the trace quotient supplies a typed replacement in the uniform case. |
| E5 | Kernel generation requires an additional curve class before invoking the integral pushforward criterion. |
| E6 | The quotient contribution has the opposite sign to the one printed in Lemma7.3 and its later use. |
| E7 | Equality after restricting a sheaf map requires injectivity of restriction on the target. |
| E8 | The arbitrary-period statement needs separate odd/even cases; the first period-drop conclusion is divisibility. |
| E9 | The descended field must contain a transcendence basis before taking finite extensions. |
| E10 | The local-parameter argument requires joint independence of the two transformed differentials. |
| E11 | The Gysin coefficient twist depends on relative dimension. |
| E12 | The normal-sequence connecting map raises cohomological degree. |
| E13 | The specialization argument must avoid zeros and poles at the chosen real points. |
| E14 | The Puiseux-field example uses the function field over its stated ground field. |
| E15 | The Enriques half detector is unique among nonzero classes. |
| E16 | Dividing a cycle-class equation uses torsion-freeness of the cokernel. |
| E17 | The Voisin hypersurface parameter must agree with the degree of the family used here. |

The urgent unresolved input is Jannsen’s exact lemma on p.268 of [the letter to Gross](https://link.springer.com/chapter/10.1007/978-94-011-4098-0_8), together with the injective-complex replacement used in(4.3). Its publisher PDF request returned HTML and the old author-host URLs failed DNS. A bibliographic record is not a reading of the proof. Next obtain that public text or reconstruct the exact3-by-3 chase, including coefficients and signs, and validate it against the application. Also complete the proper-model/Stein comparison in G1 and the unread prerequisite proofs in the ledger. G6 and G9 retain their field-descent/joint-parameter and specialization details. General G4a/G4b remain explicit research obligations.

## Validation

The paper schema check passes. The structural check confirms167 unique items, exactly one owner for every missing item, API/test presence for all65 definitions/constructions, an acyclic graph on the84 explicit edges, and the repaired main branch’s avoidance of items66,67,85 while retaining item149. All7926 exact finite/integer cases pass. They check the trace operator, coefficient signs, reduction maps, twisted-circle component formula, full Picard correction and index divisibility. They cannot certify the geometric or homological source inputs. Only the three authorized deliverables are submitted. No Lean file was authorized or compiled.

## Added inventory

| Item | Name | Classification |
|---|---|---|
| 152 | Cyclic projective resolution already in Mathlib | library |
| 153 | Odd cyclic cohomology already in Mathlib | library |
| 154 | Positive even cyclic cohomology already in Mathlib | library |
| 155 | Comparison of periodic differential conventions | missing |
| 156 | Reduction on the two twisted cyclic cohomology degrees | missing |
| 157 | Equality after restriction uses the target sheaf | missing |
| 158 | Trace-quotient lifting from vanishing Bockstein | missing |
| 159 | Integral lift made from the trace quotient | missing |
| 160 | Double-cover quotient and fixed-point action | missing |
| 161 | First component under constant real evaluation | missing |
| 162 | Topological obstruction vanishes for uniform evaluation | missing |
| 163 | Primitive Picard correction of the trace comparison | missing |
| 164 | Curve adjustment before applying the pushforward criterion | missing |
| 165 | Integral pushforward adjustment for uniform evaluation | missing |
| 166 | Degree-two splitting under uniform evaluation | missing |
| 167 | Uniform evaluation of the half-period class | missing |
