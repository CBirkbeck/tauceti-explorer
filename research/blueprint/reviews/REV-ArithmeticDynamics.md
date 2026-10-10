# REV-ArithmeticDynamics — independent review

Accepted, 2026-10-10. Reviewer: Codex, session `codex-k1d8IE`, job `REV-ArithmeticDynamics`, issue #530. This session did not write the original blueprint. The acceptance concerns a finished, correct planning pass, with the stated partial layers, supplier requests and open gaps. It does not assert proof closure or formalization.

The review read all 415 node contracts and their cited primary-source locations, the entire suggested Lean file, all 429 baseline declaration statements at the specified commits, and the direct cross-roadmap supplier contracts. It also checked all seven reviewed library-audit rows and screened current TauCetiRoadmap and the current Tau Ceti library, including roadmaps newer than the atlas snapshot. Existing library mathematics remains an import; changes in height normalization are recorded in `upstreamNotes`.

## Counts and verdicts

| Layer | Nodes | Corrected receipts | Verified receipts | Coverage |
| --- | ---: | ---: | ---: | --- |
| DY.0 | 39 | 15 | 24 | planned |
| DY.1 | 29 | 2 | 27 | planned |
| DY.2 | 55 | 19 | 36 | partial |
| DY.3 | 68 | 10 | 58 | partial |
| DY.4 | 66 | 15 | 51 | planned |
| DY.5 | 65 | 12 | 53 | planned |
| DY.6 | 93 | 37 | 56 | partial |
| Total | 415 | 110 | 305 | complete pass |

The 110 corrected receipts comprise 96 nodes with changes to mathematical fields, two further nodes with corrected page locators, and twelve further nodes whose source-match prose was rewritten. Every receipt is in `review.checked`; there are no added or unverifiable nodes. The packet retains 69 definitions, 23 constructions, 155 lemmas, 148 theorems, nine comparisons and eleven applications, with 627 API entries, 364 unit-test statements and 42 planets (six per layer). Every definition/construction has at least three tests designed to distinguish the intended definition. All implementation statuses remain `unchecked`.

There are 429 baseline declarations, 46 sources and 46 source-version receipts. All 57 source findings have individual `confirmed` verdicts. Seventeen gaps and 26 requests remain. DY.0, DY.1, DY.4 and DY.5 are planned at target level; DY.2, DY.3 and DY.6 are partial with precise remaining lists. No stage is closed. The review keeps nonroutine proof inputs as explicit requests or gaps instead of claiming they follow from routine reasoning.

## Baseline and source evidence

The required pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 429 declaration names exist and their statements provide the uses made here; 212 cited module byte sequences were checked against the pins. No reference was removed or substituted. One `provides` description changed: `Polynomial.exists_mul_add_mul_eq_C_resultant` in `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`, line 874, requires `m ≠ 0 ∨ n ≠ 0`. The packet now states that hypothesis, and the relevant positive-degree proof uses it.

The pinned elliptic canonical height is half the naive x-coordinate Tate limit. Current Tau Ceti uses the full limit. The suggested signatures and comparisons use the pin, while `upstreamNotes` asks packaging to adapt comparison factors if its baseline changes. This is a migration observation, not an upstream error.

Every source is identified by its public URL and selected edition in `sourceVersions`, with PDF SHA-256 receipts where applicable. The independent reading date is recorded separately from historical receipts. Morton 1992 and 1998 were checked in the actual public journal PDFs, not catalogue cover sheets. Stoll’s numbered results were checked in the public QuadraticIterates blueprint at its recorded commit, rather than in the inaccessible journal article. Journal and arXiv editions are kept distinct. Restricted library books were not needed.

All inherited source-excerpt fields were removed recursively, as required by the standing own-words rule. Source-match comments and the affected source-finding descriptions are paraphrases; theorem, section and page locators remain. No source file or quoted passage is included in these deliverables.

## Node corrections

Each row records every changed mathematical field or non-excerpt source field for that node. The global excerpt removal above also applies to otherwise verified nodes. The packet’s individual receipts give the supporting source locators.

| Node within ArithmeticDynamics | Changed fields | Correction |
| --- | --- | --- |
| `DY.0/forward-orbit` | `proofSteps` | Use the actual orientation of Function.iterate_succ_apply'; commutation supplies the alternate orbit identity. |
| `DY.0/iterate-of-endomorphism-on-points` | `proofSteps` | Correct the End multiplication/composition order in the induction. |
| `DY.0/resultant-of-a-rational-map` | `sources` | Move Silverman AWS Example 23 to its actual page 19. |
| `DY.0/binary-resultant-mul` | `proofSteps` | Raise formal degrees using resultant_add_left_deg; do not assume product natDegree is additive over rings with zero divisors. |
| `DY.0/binary-form-factorisation` | `statement`, `proofSteps`, `acceptance` | Retain the nonzero scalar, including degree zero; add the constant-2 counterexample to the empty-product formula. |
| `DY.0/resultant-precomp-linear` | `proofSteps` | Handle the empty Sylvester matrix in degree zero, then retain scalar factors in the universal-polynomial proof. |
| `DY.0/rational-map-of-the-projective-line` | `statement` | Restrict RatFunc injectivity to positive degree: Lean division sends both constant zero and constant infinity to zero. |
| `DY.0/rational-map-to-scheme-endomorphism` | `proofSteps` | Make surjectivity depend explicitly on the SF.0 classification of projective-line morphisms, including constants. |
| `DY.0/moduli-space-of-rational-maps` | `statement`, `hypotheses` | Require degree at least two for identification with geometric-quotient points; degrees zero and one retain only the orbit-set meaning. |
| `DY.0/roots-of-a-binary-form` | `api` | Require a nonzero homogeneous form for cardinality and a nonzero product for multiplicativity. |
| `DY.0/fixed-point-multiplier` | `proofSteps`, `api` | Exclude the identity from the multiple-fixed-point equivalence by requiring degree at least two. |
| `DY.0/fixed-point-multiplier-conj` | `proofSteps` | Track det(gamma)^d in the eigenvalue and trace, rather than det(gamma); treat degree zero separately. |
| `DY.0/critical-points-of-a-rational-map` | `statement`, `hypotheses` | Require characteristic zero and positive degree for the Jacobian interpretation; degree-p separable maps can have zero homogeneous Jacobian. |
| `DY.0/good-reduction-of-a-rational-map` | `statement`, `proofSteps`, `tests`, `api` | Require a unit coefficient as well as a unit resultant; restrict the polynomial leading-coefficient criterion to positive degree and test a nonunit constant. |
| `DY.0/good-reduction-iff-normalized-resultant-unit` | `proofSteps` | Separate degree zero, where the resultant is always one and does not detect normalization. |
| `DY.1/mul-height-bound-algebra-map` | `proofSteps`, `prerequisites` | Use the DT.0 ring-of-integers rank comparison in the base-change estimate. |
| `DY.1/absolute-height-estimate-for-rational-map` | `proofSteps` | Separate constant maps before applying positive-degree homogeneous bounds. |
| `DY.2/lift-norm-of-good-reduction` | `statement`, `hypotheses` | Require positive degree; degree-zero unit resultants alone do not normalize the lift. |
| `DY.2/escape-rate` | `tests` | Add a nonmonic p-adic example distinguishing homogeneous escape rate from polynomial orbit boundedness. |
| `DY.2/escape-rate-scale-lift` | `sources` | Move Baker–Rumely Lemma 3.21 proof to page 13. |
| `DY.2/local-canonical-height-at-infinity` | `prerequisites` | Add the local/global decomposition needed for the height value at infinity. |
| `DY.2/multiplier-of-a-periodic-cycle` | `api`, `tests` | Require degree at least two for the multiple-root equivalence and add the identity counterexample. |
| `DY.2/residue-disc-expansion` | `statement` | Distinguish the multiplicative absolute value from the additive valuation normalized at a uniformizer. |
| `DY.2/p-power-iterate-valuation-recursion` | `statement`, `hypotheses` | State mixed characteristic and the additive valuation normalization, so ord(p) is finite. |
| `DY.2/period-exponent-bound` | `statement`, `hypotheses` | State characteristic-zero fraction field and positive residue characteristic for Hutz’s ramification bounds. |
| `DY.2/berkovich-lift-bounds` | `statement`, `hypotheses` | State positive degree and the algebraic-closure/nontrivial-norm hypotheses behind density where used. |
| `DY.2/berkovich-escape-potential` | `statement`, `hypotheses`, `proofSteps` | Separate the seminorm construction from uniqueness by classical density; supply the latter’s closure and norm hypotheses. |
| `DY.2/canonical-measure` | `statement`, `proofSteps`, `api` | Correct the common Berkovich density setting; require a positive iterate in the canonical-measure iterate API and justify positivity by bounded-total-variation weak limits. |
| `DY.2/laplacian-of-local-canonical-height` | `statement` | Correct the shared Berkovich density assertion to its algebraically closed, nontrivially valued setting. |
| `DY.2/canonical-measure-is-probability` | `statement` | Correct the shared classical-density hypothesis; retain the stated probability endpoint. |
| `DY.2/canonical-measure-invariance` | `statement` | Correct the shared classical-density hypothesis; retain pullback and pushforward conventions. |
| `DY.2/canonical-measure-of-good-reduction` | `statement`, `proofSteps`, `prerequisites` | Correct the shared density setting and name the unit-resultant lift-norm input. |
| `DY.2/good-reduction-of-canonical-measure` | `statement` | Correct the shared classical-density hypothesis in the converse setting. |
| `DY.2/canonical-measure-conjugation` | `statement` | Correct the shared density assertion without changing the conjugation direction. |
| `DY.2/potential-good-reduction-iff-point-mass` | `statement` | Correct the shared density assertion and retain the type-II point-mass condition. |
| `DY.2/example-bad-reduction-padic-cantor-map` | `proofSteps`, `prerequisites` | Compute the p=2 nonmonic homogeneous orbit explicitly: its escape rate can be negative although the polynomial orbit escapes; add the scaling input. |
| `DY.3/binary-form-order-at-a-point` | `api`, `tests` | Require homogeneity in the evaluation and affine characterizations; test X−1 at [1:1]. |
| `DY.3/multiplicity-profile-at-a-fixed-point` | `statement`, `proofSteps` | Write the positive-characteristic iteration as p^a and identify the first nonzero ramification term. |
| `DY.3/formal-period-classification` | `sources` | Rephrase the source-match note in own words; retain the verified mathematical contract and locator. |
| `DY.3/dynatomic-polynomial-reduction` | `proofSteps` | Track formal degrees and resultant factors through reduction. |
| `DY.3/lower-period-root-of-a-dynatomic-polynomial` | `sources` | Rephrase the source-match note in own words; retain the verified mathematical contract and locator. |
| `DY.3/dynatomic-polynomial-of-a-polynomial-map-product` | `proofSteps` | Use primitive monic division and Gauss’s lemma rather than assuming polynomiality in the desired ring. |
| `DY.3/dynatomic-curve` | `proofSteps`, `prerequisites` | Add Gauss/divByMonic transport and remove circular use of the curve’s monicity. |
| `DY.3/unicritical-preperiodic-archimedean-bound` | `proofSteps` | Treat c=0 separately to make the escape inequality strict outside the claimed bound. |
| `DY.3/unicritical-rational-preperiodic-points` | `statement` | Require degree at least two for the arithmetic enumeration. |
| `DY.3/poonen-type-m-one` | `proofSteps` | Handle the critical case m=1 and derive the needed \|c\|≤2 bound. |
| `DY.4/galois-orbit-measure` | `proofSteps` | Average over embeddings, with stabilizer multiplicities accounted for, rather than over unspecified automorphisms. |
| `DY.4/regularised-measure-of-a-finite-set` | `statement`, `proofSteps`, `api`, `tests` | Correct overlapping-circle energy to an inequality; require positive radius and a nonempty finite support. |
| `DY.4/regularised-self-energy-bound` | `proofSteps`, `acceptance` | Use the circle-kernel inequality, including overlapping circles, and add its boundary example. |
| `DY.4/regularisation-modulus-tends-to-zero` | `proofSteps` | Use reciprocal coordinates near infinity plus compactness to obtain uniform approximation on the sphere. |
| `DY.4/adelic-height-of-a-galois-stable-set` | `hypotheses`, `api` | Require a nonempty set for the normalized probability average. |
| `DY.4/adelic-height-decomposition` | `statement`, `hypotheses` | State the affine-support restriction needed by the infinity-based kernel formula. |
| `DY.4/small-galois-stable-sets-grow` | `hypotheses`, `acceptance` | Require nonempty supports and count primitive roots of unity by phi(n), not by n. |
| `DY.4/equidistribution-of-small-points-on-p1` | `hypotheses`, `proofSteps` | Remove infinity by a total-variation estimate; do not infer convergence of singular unregularized energy. |
| `DY.4/quantitative-equidistribution` | `proofSteps` | Retain the inverse place weight in the local quantitative estimate. |
| `DY.4/curvature-measures-of-an-adelic-metric` | `statement`, `hypotheses`, `proofSteps` | Separate distributional curvature of a continuous metric from the Radon measure supplied by semipositivity. |
| `DY.4/adelic-measures-with-common-small-points` | `acceptance`, `sources` | Replace Fili’s false interval radii with 4 and 8; their common nonpositive-height set is exactly infinity. |
| `DY.4/equidistribution-for-semipositive-adelic-line-bundles` | `proofSteps` | Retain normalized place weights in the metric perturbation argument. |
| `DY.4/dynamical-arakelov-zhang-pairing` | `api` | Require positive iterate exponents in iteration invariance. |
| `DY.4/periodic-point-average-with-multiplicity` | `prerequisites` | Name the exact-period multiplicity-profile prerequisite; retain the bounded-multiplicity gap. |
| `DY.4/holder-continuity-of-canonical-potentials` | `proofSteps` | Use a Lipschitz initial potential rather than claiming it is smooth. |
| `DY.5/tower-automorphism-group` | `statement`, `proofSteps` | Use intersections of level kernels and require surjective parents for decreasing kernels. |
| `DY.5/tree-automorphism-wreath-recursion` | `proofSteps` | Index the wreath coordinates at their destination branches. |
| `DY.5/arboreal-representation-continuous` | `acceptance` | Correct the level-zero constant action example. |
| `DY.5/arboreal-image-finite-level` | `proofSteps` | Require separable iterates before concluding that later root-action kernels lie in earlier ones. |
| `DY.5/capelli-lemma` | `proofSteps` | Supply the field-degree converse and normalize nonmonic polynomials. |
| `DY.5/eventually-stable-pair` | `statement`, `hypotheses`, `proofSteps`, `api`, `tests` | Exclude zero iterate polynomials, whose library factor multiset is empty, and test the constant-zero pair. |
| `DY.5/critical-orbit-strong-divisibility` | `proofSteps` | Supply the translation identity needed to compare critical-orbit valuations. |
| `DY.5/critical-orbit-mobius-factors` | `proofSteps` | Compute rigid divisibility modulo p^(e+1), preserving exact valuations. |
| `DY.5/stoll-integer-families` | `acceptance` | Replace the false a=−4 surjectivity example with a=−8. |
| `DY.5/discriminant-of-iterate` | `proofSteps` | Treat degree one separately in the discriminant recursion. |
| `DY.5/critical-orbit-relations-avoidable` | `proofSteps`, `prerequisites` | Use a small perturbation and Taylor estimates to avoid the critical-orbit relations; name those inputs. |
| `DY.5/odoni-generic-theorem` | `proofSteps` | Describe the affine conjugacy of the monomial exceptional case correctly. |
| `DY.6/power-map-preimage-tree` | `proofSteps`, `prerequisites` | Use the actual affine Kummer action and its asymptotic index, rather than claiming a strict binary bound at every level. |
| `DY.6/lattes-map` | `acceptance` | Correct the degree-eight third-division-polynomial example and its characteristic-zero setting. |
| `DY.6/lattes-map-canonical-height` | `statement`, `hypotheses` | State the relative/global-height-field convention for the twice-Néron–Tate comparison. |
| `DY.6/specialization-of-rational-maps` | `proofSteps`, `api` | Normalize the DVR lift primitively before detecting good specialization; a bad scalar representative is not bad specialization. |
| `DY.6/elliptic-specialization-of-canonical-heights` | `proofSteps` | Write the x-coordinate/Lattès compatibility with the pinned half-height normalization. |
| `DY.6/polynomial-variation-of-canonical-height` | `proofSteps`, `sources` | Expand Ingram’s local-to-global O(1) proof, use a Laurent Böttcher coordinate, and identify the zero-height Benedetto input in the existing gap. |
| `DY.6/critical-height-of-iterate` | `acceptance` | Add the composition critical-divisor calculation that yields linear scaling in the iterate exponent. |
| `DY.6/critical-height-is-a-moduli-height` | `proofSteps`, `sources` | Expand multiplier/local estimates and moduli comparison; record attracting-cycle inputs and the finite rigid-Lattès extension separately. |
| `DY.6/legendre-escape-rate-symmetries` | `sources` | Rephrase the source-match note in own words; retain the verified mathematical contract and locator. |
| `DY.6/legendre-local-energy-symmetries` | `proofSteps`, `prerequisites`, `sources` | Use the 2-torsion deck involution to obtain the common inversion 1/z before comparing the two measures. |
| `DY.6/legendre-measure-degeneration` | `hypotheses` | Fix the central absolute value \|T\|=exp(−1) for the numerical potential and energy. |
| `DY.6/legendre-measure-on-annuli-near-cusp` | `sources` | Rephrase the source-match note in own words; retain the verified mathematical contract and locator. |
| `DY.6/legendre-potential-continuity-near-cusp` | `hypotheses` | Separate z=0 from logarithmic annuli and retain the central norm normalization. |
| `DY.6/legendre-regularization-estimate` | `statement`, `hypotheses`, `sources` | Require nonempty affine support and strictly positive radius. |
| `DY.6/archimedean-energy-one-escaping-parameter` | `sources` | Rephrase the source-match note in own words; retain the verified mathematical contract and locator. |
| `DY.6/archimedean-energy-same-cusp-bounded-ratio` | `statement`, `proofSteps`, `sources` | For real b use the uniform Berkovich interval measure; do not treat nonintegral T^b as a Laurent-series field element. |
| `DY.6/archimedean-energy-same-cusp` | `proofSteps` | Supply the uniform large-ratio cusp estimates instead of varying the compact set in a compact-uniform theorem. |
| `DY.6/archimedean-energy-opposite-cusps` | `proofSteps` | Keep both measures in one coordinate and calculate the opposite-cusp limiting energy there. |
| `DY.6/archimedean-good-places-energy-bound` | `sources` | Rephrase the source-match note in own words; retain the verified mathematical contract and locator. |
| `DY.6/good-places-energy-sum-bound` | `sources` | Rephrase the source-match note in own words; retain the verified mathematical contract and locator. |
| `DY.6/birational-height-comparison` | `acceptance`, `sources` | Correct h(3/2,2) to log 4 using the primitive triple [3:4:2]. |
| `DY.6/legendre-pairing-height-lower-bound` | `proofSteps`, `sources` | Track the factor six when adding and dividing the two weighted energy estimates. |
| `DY.6/legendre-pairing-uniform-positivity` | `sources` | Rephrase the source-match note in own words; retain the verified mathematical contract and locator. |
| `DY.6/legendre-joint-small-points-finite` | `proofSteps`, `prerequisites`, `sources` | Replace the broad DY.4 citation with the exact Zhang inequality and canonical-metric self-intersection nodes. |
| `DY.6/legendre-pairing-upper-bound-regularized` | `statement`, `hypotheses`, `proofSteps`, `prerequisites`, `sources` | Require nonempty affine support and name the product-formula, self-energy and regularized-metric inputs. |
| `DY.6/legendre-pairing-upper-bound-small-points` | `proofSteps`, `prerequisites`, `sources` | Name the exact Fili metric and regularized-adelic-measure prerequisites. |
| `DY.6/legendre-uniform-joint-small-points` | `sources` | Rephrase the source-match note in own words; retain the verified mathematical contract and locator. |
| `DY.6/legendre-uniform-common-torsion-images` | `proofSteps`, `prerequisites`, `sources` | Specialize finite preperiodicity cross-product identities and inverted witness differences; remove the false assertion about algebraic witnesses on every fibre. |
| `DY.6/standard-projection` | `statement`, `api` | Define the standard projection as phi composed with x; absorb a 2-torsion translation into the Möbius coordinate. |
| `DY.6/common-torsion-images-three-common-branch-values` | `sources` | Rephrase the source-match note in own words; retain the verified mathematical contract and locator. |
| `DY.6/common-torsion-image-orders-unbounded` | `sources` | Rephrase the source-match note in own words; retain the verified mathematical contract and locator. |
| `DY.6/p-adic-power-series-coordinates` | `statement`, `hypotheses` | Require smoothness of the total scheme relative to the DVR, not just a smooth special-fibre point. |
| `DY.6/lech-affine-independent-family` | `sources` | Rephrase the source-match note in own words; retain the verified mathematical contract and locator. |
| `DY.6/etale-dynamical-mordell-lang` | `proofSteps` | Replace the false global component-permutation step by eventual cycles in the finite component graph. |
| `DY.6/etale-model-over-finitely-generated-ring` | `statement`, `hypotheses` | Identify the generic fibre over Frac(R), and recover the original complex variety by base change. |
| `DY.6/p-adic-model-of-unramified-endomorphism` | `statement` | Identify the generic fibre as the descended variety base changed through Frac(R) into Q_p. |
| `DY.6/polynomial-lines-dynamical-mordell-lang` | `proofSteps` | Count distinct orbit points; finite orbits have eventually periodic return sets even when the line is not periodic. |

## Other packet and Lean corrections

Seven request contracts were clarified: SF.0 projective-line morphism classification and constant maps; TB.0 classical density; TB.1 weak limits of uniformly total-variation-bounded signed measures; TB.6 continuous-potential energies and classical-diagonal conventions; TB.6 distributional versus semipositive curvature; TB.0 the hybrid norm `|T|=exp(−1)`; and SF.0 smooth, geometrically irreducible spreading with étale morphisms. Requests retain their owners. No mathematical definition was moved to a different roadmap.

The existing critical-moduli gap now names Koebe’s quarter theorem, the nonarchimedean attracting-cycle input, McMullen’s multiplier-spectrum finiteness, the moduli-height comparison and the finite rigid-Lattès classification. The GTZ input gap now also records Benedetto’s generic-zero-height criterion used in Ingram’s polynomial variation. No new gap was hidden in an accepted proof. Coverage notes were corrected to distinguish requested inputs, recorded gaps and completed checks; completed verification tasks were removed from `remaining`, while actual supplier work and future baseline migration remain.

The suggested file was checked against the corrected packet. Its edits are recorded here, including corrections to signatures that were already more precise in the packet:

| Lean declaration or interface | Change |
| --- | --- |
| `exists_prod_linear_of_isHomogeneous` | Retain a nonzero scalar, including degree zero. |
| `RationalMap.HasGoodReduction`, `hasGoodReduction_ofPolynomial_iff` | Require a unit coefficient in the lift and positive polynomial degree; add the nonunit constant-2 test. |
| `sup_abv_eval_eq_of_goodReduction` | Require positive degree. |
| Escape-rate tests | Add the negative nonmonic homogeneous escape-rate example with an unbounded polynomial orbit. |
| `canonicalMeasure_eq_dirac_gauss_iff`, `canonicalMeasure_isPointMass_iff` | Require the supplied valuation ring to be exactly the norm-unit ring, rather than merely mapping into it. |
| `binaryFormOrder_eq_zero_iff` and its tests | Require homogeneity and add the nonhomogeneous evaluation counterexample. |
| `periodicMultiplicity_profile_growth` | Guard positive-characteristic powers by `0 < p`; document the characteristic-zero constant profile. |
| `AnalyticLine.isClassical`, `energy` | Identify all classical points over the completed field, including those outside the algebraic closure image; exclude infinity and only the classical diagonal. |
| `AnalyticLine.energy_circle_circle` and its tests | Use an inequality at infinite places; add the finite-place equality and overlapping-circle counterexample. |
| `AdelicMetric.toContinuousMetric` | Give the section `X₁` norm zero at infinity. |
| `isGenericSequence_iff_finite_fibres` and its curve test | Require the native `NoetherianSpace` instance. |
| `azPairing_conj`, `localEnergy_conj` | Require both map degrees at least two. |
| `IsEventuallyStableAt`, `isEventuallyStableAt_iff_of_le` and their tests | Require every iterate-minus-target polynomial to be nonzero, require positive degree for the tail criterion, and test the zero polynomial. |
| `legendreSmallPoints_uniform`, `legendre_uniform_common_torsion_images`, `common_torsion_images_three_branch_values` | Assert finiteness as well as the cardinal bound. |
| `polynomial_orbits_on_line`, `polynomial_lines_dynamical_mordell_lang` and their tests | Require infinitely many distinct orbit points, rather than return indices; add the shared-fixed-point counterexample. |
| Lech–Cassels interface comment | Record only the remaining presentation and embedding-transport gaps; the independent perturbation chain is explicit. |

In particular, `Set.ncard` assigns zero to infinite sets, so cardinal bounds alone would not express the uniform finiteness theorem. Two polynomial maps with a common fixed point give infinitely many return indices without a common iterate. The corrected signatures address both pitfalls. These remain proposed declarations using `sorry`, not proofs.

The 42 selected planets were checked for mathematical importance, names and layer limits; none needed changing. The 364 unit-test statements were checked, including the added degenerate and counterexample contracts. Successful elaboration validates their Lean types, not their mathematical proofs.

## Source findings

The 47 inherited findings were checked at their selected-version locations and confirmed. Findings E104 and E308 duplicate the same Baker–Rumely lemma typo and remain separately identified for provenance. E711 confirms only the unresolved marker in the selected arXiv edition; the inherited published-edition replacement remains attributed to its earlier extraction, not to this review. The known Poonen errata E404–E405 remain attributed to the author’s errata list. E604’s review distinguishes the nonsquare-product polarity, leading-coefficient factors and the transitive 2-group hypothesis used by the quadratic-iterate applications; it does not assert a counterexample to the all-irreducible monic application.

Ten findings were added with explicit computations or counterexamples and individual confirmed verdicts:

| Finding | Source location | Verified correction |
| --- | --- | --- |
| E510 | Fili, arXiv v2, Remark 1, p. 2 | The printed interval radii do not give the claimed nonpositive-height set; radii 4 and 8 do. |
| E511 | Fili, arXiv v2, after (5), p. 5; Theorem 9 proof, p. 8; before (16), p. 9 | Restore the negative-kernel signs in the pairing and orbit-energy expansions. |
| E512 | Fili, arXiv v2, §4, p. 12, local/global metric comparison | The full local difference energy gives a factor √2 relative to the half-energy global metric. |
| E513 | Favre–Rivera-Letelier, arXiv v2, §4.4, p. 26 | Exclude only the classical diagonal; a nonclassical atom retains its diameter self-energy. |
| E712 | DeMarco–Krieger–Ye, arXiv v2, Proposition 2.3, p. 11 | Use the torsion deck involution to replace parameter-dependent coordinate changes with one common inversion. |
| E713 | Ingram, Variation, arXiv v3, Lemma 9, pp. 10, 12 | The Böttcher coordinate is Laurent; multiplying by the pole-order power gives the integral power-series unit. |
| E714 | Ingram, Critical height, arXiv v3, Lemma 11, p. 12 | Swap the conjugating matrix columns and normalize the point columns in the height bound. |
| E715 | Bell–Ghioca–Tucker, arXiv v1, Remark 3.1, p. 8 | A continuous Mahler expansion need not be an ordinary analytic power series; the interpolation proof supplies stronger factorial decay. |
| E716 | Bell–Ghioca–Tucker, arXiv v1, proof of Theorem 1.3, p. 15 | An étale endomorphism need not permute components; eventual component cycles suffice. |
| E717 | Hutz, arXiv v3, proof of Proposition 3, pp. 5–6 | Use joint projective coefficient height. The rational degree-two example in the finding violates the maximum-individual-coefficient bound. |

The exact edition, locator, own-word printed claim, correction, reasoning, affected result and correction search are in each `sourceIssues` entry. “No correction located” is scoped to the selected material; it is not a claim that a finding is new or that a later journal edition contains it.

## Validation and orchestration

`python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticDynamics.json` reports zero errors and zero warnings. `lean-check research/blueprint/suggested/ArithmeticDynamics.lean` at the pinned shared environment exits 0 with 1188 declaration-uses-`sorry` warnings, no other warnings and no errors. The checker’s structural checks complement the primary-source and baseline reading; neither checker proves the suggested theorems.

No question blocks this acceptance. Packaging should use the corrected packet and suggested file and reconcile its README with them: the old reader document is outside this review issue’s allowed paths. The existing 17 gaps and 26 requests are the follow-up work, with priorities and migration cautions in the handoff. Do not package any recorded endpoint as dependency-closed until its listed supplier or gap is resolved. The acceptance permits the existing partial-stage follow-up mechanism; it does not erase that work.
