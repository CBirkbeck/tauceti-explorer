# Independent review: PeriodsAndSpecialValues, PS.0–PS.7

Job: `REV-PeriodsAndSpecialValues--PS.0`, issue #542. Reviewer: Codex,
session `codex-9Uy8Fb`, 2026-10-19. The input was written by Codex session
`codex-Ha7lES` for `BP-PeriodsAndSpecialValues--PS.0` (#1034); this reviewer
did none of that work.

## Verdict and scope

**Accepted after corrections.** This is a complete target-level planning pass,
not an implementation or a proof of the conjectures. All eight stages remain
`planned`, none `closed`; their `remaining` lists retain the precise supplier,
arithmetic and conjectural premises. There is no unverifiable node or unresolved
contradiction in the corrected conditional statements. Acceptance does not turn
an outstanding supplier contract into an available theorem.

The review read all 39 nodes and the companion reader, the stage targets, the
reviewed library audit, the cited red-team finding, actual pinned declarations,
and the statements behind the cross-roadmap prerequisites. Counts after correction:

| Item | Result |
| --- | --- |
| Nodes | 39: 23 verified, 16 corrected, 0 added, 0 unverifiable |
| Kinds | 11 definitions, 11 constructions, 11 comparisons, 4 applications, 2 theorems |
| Definition/construction API and tests | 117 API entries and 71 tests; each has at least three tests |
| All API/test entries | 122 / 74, including the fundamental-line comparison |
| Planets | 22, retained as key mathematical definitions, constructions and results |
| Baseline citations | 14 confirmed; none removed or replaced |
| External prerequisite statements | 76 distinct atlas references plus five current upstream layer exports |
| Requests / gaps / rescoping records | 16 / 7 / 3 |
| Source records / versions / findings | 10 / 11 / 7, with all seven findings confirmed |

## Mathematical and interface corrections

1. **Period conventions and API (PS.0).** Kept integration β and Deligne's
   inverse comparison I=β⁻¹ distinct. In column coordinates I changes by
   C⁻¹PA, and its determinant belongs to Hom(det B,det D). Added identity and
   inverse/dual operations to the simultaneous coefficient-unit quotient API.
   Independent rescaling at each coefficient embedding is still disallowed.
   Corrected the Deligne filtration-cut reference to §1.7 and checked the
   sign-swapping Tate-twist formula against (5.1.8), translation pp. 17–18.
2. **The explicit elliptic comparison (PS.0).** Checked the two substitutions,
   the two oriented paths and the inverse-transpose period matrix for
   y²=x(1−x)(1−x/2), ω=dx/(2y), η=xω. Elementary integration does not identify
   these as de Rham and homology bases. Removed the false attribution of complex
   uniformization to EllipticCurves and attached the second-kind class/path
   comparison to the explicit C5 prerequisite, request and gap.
3. **Archimedean factors (PS.1).** Specified the complex-place product as
   Γ_C(s−min(p,q)) over ordered Hodge types for a chosen embedding, with
   multiplicities, and added a two-block test. Retained the real-place
   off-diagonal and diagonal-sign rules, both gamma conventions and their
   powers of 2. Corrected Serre's printed/PDF page locators. The criticality
   tests use both M at m and M∨ at 1−m; the off-diagonal condition is p<m≤q.
4. **Value versus leading coefficient (PS.1/PS.3).** Clarified that Deligne's
   embedding tuple contains ordinary finite values, including zero. Its star
   notation there does not mean a first nonzero Laurent coefficient. PS.3's
   leading term retains meromorphic orders, poles and the factorial convention.
   Corrected the Dirichlet proof locator through translation §6.7, p. 22.
5. **Formal periods (PS.2).** Added the additive, scalar and zero evaluation
   API. The algebra is the localization P_eff[L⁻¹]; numerical evaluation sends
   L to 2πi and its inverse to (2πi)⁻¹. No numerical injectivity is inferred.
   The current MC.6 supplier already owns the full formal algebra and torsor
   comparison. PS owns actual integration descent and its normalization diagram.
6. **Fundamental lines (PS.3/PS.4).** Checked all six exponents of BF's Ξ,
   Δ=Ξ⁻¹, the real regulator sequence, finite-length signs and local factors.
   Corrected BF Lemma 5 from §3.3 to §3.4 and BV's integral comparison to
   published equation (18), p. 187. For [O --πᵃ→ O] in degrees 0,1, the
   acyclic lattice is πᵃO; generally the exponent is −Σ(−1)ⁱ length Hⁱ.
   The real dyadic unbounded Tate complex is still an explicit gate.
7. **Finite coefficient reduced norms (PS.5).** NE.3's dimension-one Iwasawa
   quotient algebra does not supply BF's finite semisimple rational norm-image
   theorem. Replaced that prerequisite by IHG.0's Azumaya reduced norm, extended
   the KU request to the finite K₁ and relative-boundary comparison, and added
   the missing rational norm-image/real-positivity gap and routing record.
   PS retains only the arithmetic obstruction adapter.
8. **Zeta orientation and conditional proved families (PS.5).** The finite-level
   FK inverse line remains correct. The current NE review is `needs_changes`:
   the normalized BV leading term requires an actual shifted/dual complex and
   typed determinant comparison. Added an explicit NE.7 prerequisite/request,
   stage remainder and a failure test; neither ζ's existence nor formal
   inversion proves interpolation. Retained the odd-prime, totally real,
   cyclotomic-disjointness, Stark/Leopoldt, order/projectivity and character
   hypotheses. Used the published Q-valued correction, retained nonzero-regulator
   premises, and rejected the permutation-character converse discussed below.
   BF Theorems 3.1 and 4.1 are cited at pp. 531 and 539; BV Theorem 5.5 and
   Corollary 5.7 at pp. 193 and 196. Original FK/Burns–Greither proofs remain gaps.
9. **Rankin cycle direction (PS.6).** Corrected the API and source description:
   LTXZZ Conjecture 8.3.1, p. 315, predicts cycle nonvanishing; it is not a
   height formula. Derivative nonvanishing, that conjecture, Abel–Jacobi
   injectivity and the actual geometric-level hypotheses give the usable
   diagonal class. No converse follows from injectivity. Kept Hypothesis
   3.2.10, full admissibility L1–L7, strong coefficient field, F⁺≠Q and the
   relevant rank-zero/one scope. Corrected Definition 1.1.3/Remark 1.1.4,
   Definition 3.2.5 and their page locators. The extraction's routed proof
   gates remain supplier obligations.
10. **Upstream export requests.** Added five precise consume-existing-export
    requests for EllipticCurves layers 1, 2, 4, 6 and 7: differential, Tate
    module, local Tamagawa input, height/regulator and elliptic Selmer/Sha/BSD
    quotient. These describe imports, not proposed upstream extensions.
11. **Bibliography and suggested file.** Corrected HMS v5 to 21 May 2014,
    pinned BCGP v3 and Conjecture 1.1.1 pp. 3–4, collated BV's author and
    published copies instead of applying a fixed page offset, and recorded
    the public NSF version of LTXZZ. Four Lean comment lines now expose the
    BV orientation and Rankin cycle gates; no declaration or proof was added.

## Closure, ownership and the red-team finding

RT-AREA-iwasawa-3/8 concerned the full formal-period algebra and its inverse
Tate element. The current supplier has already resolved the ownership issue:
MC.6 plans the localized algebra and its algebraic torsor theorem; MC.5 is
categorical stabilization. The reader's localization, inverse-Tate tests and
actual-integration boundary agree with that division. The packet preserves it
and records that the older brief needs rescoping; it does not duplicate MC.6.

Likewise M.8 supplies selected motivic fundamental lines and regulator
comparison from independent MC.2/PS.0/L5 inputs. It must not depend on all of
PS.3 or PS.4. Generic determinant functors stay with L5, regulator theory with
Borel/ER and existing owners, all-prime BSD reconstruction with BSD.8, and
quadrature with the integration/numerical owners. Borel's power of 2, ER's CM
sign/index qualifications, local bad factors, real components and the prime 2
are retained in their adapters and tests.

All original atlas supplier statements were read, followed by the replacement
IHG norm statement and the added NE.7 stage contract. A stage identifier is
not treated as a theorem: the requests distinguish existing exports from
extensions. In particular current C5 does not give all singular relative pairs;
AL.5 does not give the general LTXZZ Rankin theorem; R11.5's local H¹ polynomial
does not give all-degree strict compatibility. Their exact requested extensions
remain visible. No extra node was needed at target granularity: the new
non-routine leaves are recorded as supplier requests and gaps.

The seven open gap groups are geometric Artin/modular periods; relative-pair
and explicit elliptic integration; integral real dyadic determinants; original
FK/Burns–Greither sources plus normalized BV orientation; routed Rankin proof
and cycle gates; Deligne original-version collation; and finite semisimple
norm-image/sign comparison. Each has named consumers and an actionable contract.

## Baseline and current upstream

Each declaration below was opened at the full pinned SHA. Eight distinct files
were fetched at those SHAs and matched the shared Lean build byte for byte.
The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

| Declaration(s) | Scope actually available |
| --- | --- |
| `Matrix.det`, `Matrix.det_mul`, `Matrix.det_fin_zero` | Finite square matrices, commutative ring; no determinant functor of complexes |
| `IsLocalization.Away`, `mul_invSelf`, `lift` | Commutative semiring localization; lift needs a unit image of the inverted element |
| `TauCeti.Hodge.tate`, `tate_F` | Weight −2m, type (−m,−m); the lattice inclusion supplies no 2πi geometric comparison |
| `intervalIntegral` | Difference of the two Ioc integrals; analytic identities need integrability |
| `intervalIntegral.norm_integral_le_of_norm_le` | a≤b, a.e. bound on Ioc, integrable majorant |
| `intervalIntegral.integral_comp_mul_deriv'` | HasDerivAt on uIcc, continuous derivative and integrand on the image |
| `MeasureTheory.tendsto_integral_of_dominated_convergence` | Measurability, integrable domination, a.e. sequential convergence |
| `MeasureTheory.Measure.haarMeasure` | Locally compact topological group/Borel structure and positive compact normalization |
| `MeasureTheory.Measure.infinitePi` | Probability factors; otherwise the definition gives zero |

The reviewed audit and current upstream were checked separately. Read-only
upstream commits were roadmaps `0d144d044dacebca17b654695b6f1ad58f159b27`,
Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, Mathlib
`6b7abb3c7686292736be2955bd3eb9ebf63b456a`. The new-roadmap/Completed inventory
was screened, with relevant statements read in IntegralLattices,
EllipticCurves, DifferentialGeometry and the integration/restricted-product
boundaries, plus current Hodge/Haar inputs. Existing upstream material is
imported. No build was run there. Quaternion reduced norm alone is not the
missing general rational norm-image theorem.

## Source evidence and findings

The packet's `sources` and `sourceVersions` give public URLs, versions, reading
dates and hashes where available. These are checks of the cited claims, not
section-by-section source summaries. The key locators read were:

| Source | Checked locations |
| --- | --- |
| Deligne, Ghate–Beineke translation revised 2018 | §§0–1 pp. 3–8, §§2–5 pp. 10–18, §§6.3–6.7 pp. 20–22, §7.8 p. 25 (PDF numbering) |
| Huber–Müller-Stach, arXiv v5 | Theorem 0.2 p. 2; Definition 2.8/Remark 2.9/Theorem 2.10 pp. 10–11; §3 pp. 12–13 |
| BCGP, arXiv v3 | Conjecture 1.1.1 pp. 3–4; purity p. 31; §2.8 pp. 35–38 |
| Serre, original seminar scan | §§3.1–3.3 printed 19-10–19-11; C9 and (26)–(29), printed 19-12–19-13, PDF pp. 13–14 |
| Tate | §3.4, (3.4.3)–(3.4.8), printed p. 15 |
| Burns–Flach, publisher PDF | §§3.1–3.5 pp. 517–533; §§4.2–4.4 pp. 534–540, including Lemma 9 and Conjecture 4 |
| Burns–Venjakob, both copies | Published Definitions 2.5/3.7 pp. 170–171/177; equations (17)–(18) p. 187; Conjecture 4.1 p. 188; §5 pp. 189–196; corresponding author-final locations collated |
| Bloch–Kato | pp. 333–336; Theorem 4.1 p. 362; Proposition 5.4/Definition 5.5 pp. 370–372; §§5.9–5.15 pp. 373–377 |
| LTXZZ, published public NSF copy | §1.1 pp. 109–113; Definition 3.2.5 p. 145; Definition 8.1.1 pp. 303–304; Conjecture 8.3.1/Theorem 8.3.2 pp. 315–316 |
| Johansson, arXiv v1 | §§1–2 pp. 1–3; the two explicit PS error estimates are independently checked specializations |

All seven source findings have a review verdict and reason. E1/E2 were
already in the packet; E3–E7 were added here. E4–E7 credit the existing NE
findings rather than claiming priority.

| Finding | Independent check and limitation |
| --- | --- |
| E1, BCGP §2.8 p. 37 | The alternating exponent is cohomological i, not complex s; elliptic point counts test it. Confirmed for v3 only; published wording not collated. |
| E2, Deligne translation Prop.–Def. 2.3(ii), PDF p. 10 | The dual test needs −s, equivalently 1−s before the twist; Q(0) at m=−1 tests it. Original French wording remains uncollated. |
| E3, BF Remark 7 p. 534 | Missing reciprocal in the local factor: the unit realization gives (1−q⁻ˢ)⁻¹. An intended-convention misprint, not a failure of the surrounding theorem. |
| E4, BV Corollary 5.7 | The author's Q_p-valued condition is corrected to Q-valued in published p. 196. C₃ at p=7 detects the difference. Credits NE/E12. |
| E5, BV definitions and Remark 5.6 pp. 194–195 | ζ has inverse-determinant target while the unshifted [C,a] construction needs d(C). This is a typed proof/interface gap, not a counterexample to the arithmetic identity. Credits NE/E28. |
| E6, BV Corollary 5.7 proof p. 196 | C₂ sign = regular − trivial is an integer combination but not a permutation character. Keep the sufficient implication, discard the converse. Credits NE/E32. |
| E7, BV §5.2 p. 193 | Equal dimensions and factorization do not prove the logarithmic regulator is invertible. Retain the nonzero-regulator/Leopoldt premise. Credits NE/E27. |

The searches in the packet are explicitly bounded. They do not assert that no
erratum exists. No source passage is reproduced. The permitted source was read
in place when appropriate; no source file or passage is included in the commit.

## Reader synchronization and orchestrator actions

The issue authorizes edits to the packet, suggested file and review report,
plus the WORKERS handoff. It does not authorize editing the companion reader.
Consequently the accepted packet is the corrected plan; its reader must be
synchronized before packaging. This is a concrete downstream action:

- Apply items 1–11 above to the reader's APIs, statements, source table,
  source issues, dependency/coverage tables and seven-gap register. In particular
  remove the EllipticCurves uniformization claim, add the complex gamma block
  test and quotient/evaluation API, and distinguish the finite Deligne tuple
  from a Laurent leading term.
- Replace the finite coefficient NE.3 norm import by the IHG/KU route, and
  expose the new finite norm-image/sign prerequisite and the NE.7 orientation
  gate. Do not display the normalized BV import as an established theorem.
- Replace any LTXZZ height-formula/converse wording by the derivative-to-cycle
  conditional direction, with its actual class-transfer premises. Correct the
  HMS/BCGP/BF/BV/Deligne/LTXZZ version and page references and include E3–E7.
- Route the finite rational norm-image theorem to the central-simple-algebra
  direction; the current upstream boundary names AlgebrasWithInvolution, but
  this checkout has no registered theorem node to cite. Register the routed
  ArithmeticLevelRaisingAndBipartiteEulerSystems Part II and retarget L4's
  request once its real stage identifiers exist. Preserve the MC.6/M.8 scope
  and the original-source/dyadic gates.

These are synchronization/routing tasks, not unresolved choices in the
corrected mathematics. No source supplier or upstream roadmap was edited.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PeriodsAndSpecialValues--PS.0.json`:
  **0 errors, 0 warnings**.
- Source finding and source-version validators: **no errors**.
- `lean-check research/blueprint/suggested/PeriodsAndSpecialValues--PS.0.lean`:
  **exit 0**, 31 warnings, all declarations using `sorry`; no other warning or
  error. The final file has 217 lines and only real-bodied light definitions on
  existing carriers. Missing motivic carriers remain reader targets.
- `git diff --check`: passed. All 39 node IDs have exactly one review verdict;
  all remain `unchecked`; required definition/construction tests and the
  eight planned stage statuses were checked.

## Per-node verdicts

The packet carries the same individual verdicts and reasons.

| Node (stage/local id) | Verdict | Check |
| --- | --- | --- |
| `PS.0/comparison-period-line` | verified | Checked inverse-integration convention, Hom(det B,det D), zero rank and determinant basis covariance. |
| `PS.0/real-infinity` | verified | Checked E-linear geometric infinity involution and its distinction from semilinear Hodge conjugation. |
| `PS.0/period-class` | corrected | Added the identity and dual/inverse operations to the simultaneous coefficient-unit quotient API. |
| `PS.0/deligne-periods` | corrected | Corrected the filtration-cut and quotient-isomorphism route to Deligne §1.7; checked the sign-swapping twist formula (5.1.8). |
| `PS.0/tate-elliptic-normalizations` | corrected | Checked the inverse-transpose matrix and both elementary substitutions. Removed the false attribution of complex uniformization to EllipticCurves and attached the second-kind de Rham/path identification to the explicit C5 contract. |
| `PS.1/motivic-euler-product` | verified | Checked BCGP strict compatibility including coefficient primes, (ker N)^I, purity convergence and exact conductor request. |
| `PS.1/archimedean-completion` | corrected | Specified the complex-place min(p,q) product and added its two-block regression; corrected Serre page conventions. |
| `PS.1/critical-integer` | verified | Checked simultaneous dual regularity and both Hodge-block criteria; unit/modular tests detect omitted dual factors. |
| `PS.1/deligne-algebraicity` | corrected | Clarified that the starred tuple means ordinary finite values, including zero; the leading-coefficient notation in PS.3 is distinct. |
| `PS.1/dirichlet-tate-adapter` | corrected | Corrected the Deligne §6.7 proof locator through PDF p. 22; the actual Gauss-sum/geometric comparison remains a recorded supplier gap. |
| `PS.1/modular-period-adapter` | verified | Checked Deligne §7.8 and AL.5 scope; actual geometric modular period identification is a recorded gap. |
| `PS.1/serre-system-predicate` | verified | Checked BCGP epsilon/conductor normalization and Tate measure scaling; dual composition gives εε∨=N. |
| `PS.1/hasse-weil-predicates` | corrected | Corrected the BCGP Conjecture 1.1.1 and Serre C9 locators; checked alternating signs, all cohomological degrees and conductor normalization. |
| `PS.2/integration-evaluation` | corrected | Added the linear/simp evaluation API; independently confirmed localized inverse evaluation and the actual relative-pair supplier gap. |
| `PS.2/torsor-integration-comparison` | verified | Checked HMS localized algebra and both torsor actions; MC.6 owns the algebra/torsor, PS only matches actual integration. |
| `PS.2/tate-torsor-test` | verified | Checked Q[t,t⁻¹] versus effective Q[t], inverse evaluation and the noninjective-point counterexample. |
| `PS.3/rational-fundamental-line` | corrected | Corrected the published BV locator; checked all six BF exponents and Δ=Ξ⁻¹. |
| `PS.3/real-regulator-trivialization` | verified | Checked BF exact sequence, period map and height nondegeneracy as supplied/conjectural data. |
| `PS.3/leading-term-line` | verified | Checked meromorphic order including poles, factorial normalization and rational versus integral membership. |
| `PS.3/regulator-specializations` | verified | Read Borel R.7 and ER.5 contracts; retained Borel factor 2 and exact CM sign/index qualifications. |
| `PS.4/integral-fundamental-line` | corrected | Corrected BV published equation (18), p. 187; checked odd-prime/perfectness/coherence gates and acyclic two-term lattice. |
| `PS.4/finite-lattice-correction` | corrected | Corrected BF Lemma 5 to §3.4; checked the alternating cohomology-length exponent and the inverse L3 supplier orientation. |
| `PS.4/local-correction-adapter` | verified | Checked the away-p two-term map, crystalline/tangent alternative and zero-factor order changes. |
| `PS.4/real-dyadic-gate` | verified | Checked the two periodic C₂ Tate complexes; no determinant of the unbounded integral tail is inferred. |
| `PS.5/equivariant-obstruction` | corrected | Replaced the dimension-one Iwasawa norm import by generic IHG Azumaya norms; made the finite semisimple K₁/sign theorem and boundary comparison explicit leaves. |
| `PS.5/etnc-predicate` | verified | Checked BF four-part conjecture and scalar inverse-line generator specialization, with localization preserving the omitted prime 2. |
| `PS.5/zeta-orientation-adapter` | corrected | Retained the correct inverse FK line, and added the unresolved normalized leading-term domain gate, precise NE.7 request and failure test. |
| `PS.5/proved-case-adapters` | corrected | Retained full conditional arithmetic scope, published Q-valued correction, projectivity for restriction and the shifted/dual determinant gate; corrected BV locators and rejected the false permutation converse. |
| `PS.6/bloch-kato-motivic-pair` | verified | Checked all P1–P4 quantifiers, Fontaine–Laffaille small weights, real weight condition and actual triple comparisons. |
| `PS.6/bloch-kato-points-and-measure` | verified | Checked BK local/global points, good mass P_p(V,1), probability normalization, product formula and the exact Sha kernel. |
| `PS.6/elliptic-fundamental-adapter` | verified | Checked conditional weight −1/BSD height formulation, all-components Ω, MW index square and separate dyadic gate. |
| `PS.6/bsd-prime-assembly` | verified | Read BSD.8 all-prime valuation certificate; no new prime-dispatch theory or missing-prime conclusion is introduced. |
| `PS.6/bloch-kato-tamagawa` | verified | Checked original weight≤−3, dual-torsion numerator, total Sha finiteness and distinction from fixed-prime formulations. |
| `PS.6/rankin-bbk-prediction` | corrected | Corrected the API’s derivative-to-cycle direction; Conjecture 8.3.1 and injectivity do not supply a converse. |
| `PS.6/rankin-proved-scope` | corrected | Replaced the erroneous height-formula description by the cycle-nonvanishing prediction; retained Hypothesis 3.2.10, admissibility and actual geometric-level contracts. |
| `PS.7/period-quadrature` | verified | Checked the geometric-series remainder, rational endpoint substitution, positive radicand and midpoint/rounding budgets; generic quadrature is imported. |
| `PS.7/normalized-enclosure` | verified | Checked finite-value/derivative normalization, strict denominator separation and exact-membership recognition gate. |
| `PS.7/normalization-covariance` | verified | Checked determinant, regulator, MW-index, gamma-convention and Haar scaling factors. |
| `PS.7/period-conjecture-boundary` | verified | Checked that injective numerical evaluation is additional to HMS formal/torsor comparison and independent of special-value conjectures. |
