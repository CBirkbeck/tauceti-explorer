# REV-SieveMethodsAndPrimePatterns

Accepted on 11 October 2026 by Codex (GPT-6), session `codex-XHLCjD`, for issue [#544](https://github.com/CBirkbeck/tauceti-explorer/issues/544). This is an independent review of the complete pass submitted by session `codex-F8Bvum` in [#8666](https://github.com/CBirkbeck/tauceti-explorer/pull/8666), including the inherited work. The input author and reviewer are different worker sessions.

The verdict accepts the mathematical plan at the protocol's target granularity. Six stages are **planned**, none is **closed**, and all 29 proof/interface gaps remain recorded. “Complete” means a finished planning pass; it does not mean that these theorems are proved or that the full roadmap is ready to elaborate against all upstream interfaces.

## Inventory and review scope

| Item | Reviewed result |
| --- | --- |
| Nodes | 224: 193 verified, 31 corrected, 0 added |
| Kinds | 70 lemmas, 110 theorems, 26 definitions, 14 constructions, 3 comparisons, 1 application |
| Pinned baseline | 206 declarations confirmed in 104 modules; 0 removed or replaced |
| API | 251 items, including constructors, characterizations, structural laws and native comparisons |
| Tests | 170 definition/construction tests and 2 additional lemma tests |
| Planets | 27 central definitions, constructions and named theorems |
| Paper routes | All 40 routed entries checked against their named nodes |
| Sources | 25 source records; 62 dated version/read receipts, including historical records |
| Source findings | 68 independently confirmed at their specified scopes; 13 added here |
| Closure | 21 supplier requests and 29 explicit gaps; no unresolved statement contradiction |
| Suggested file | 204 main declarations present; 20 explicitly omitted |
| Other prototype omissions | 22 API items and 13 tests, covered by 22 omission records |

Every definition/construction has at least three API items and three tests that distinguish plausible wrong conventions. The full suggested file was read, including all examples. A namespace-aware scan excludes comments when counting declarations; test labels occur on examples or named declarations. It finds 229 present API items and 159 present test labels, counting the two additional lemma tests. There are no unexplained omissions. The native spin and geometric interfaces listed in `prototypeOmissions` are precise open interfaces, not opaque propositions inserted to make applications appear complete.

Fresh reading covered the relevant locators, definitions, statements and proof routes of every node. Reading was complete for Heath-Brown's sieve notes, the seven cited live Kedlaya chapters including exercises, the five-page 2007 Bombieri lecture, Bombieri's four-page article, Maynard's published §§1–8, Jutila's article, KM's §§1–5, Chen's original 18 pages and the three-page FIMR erratum. The other papers were read at the packet's relevant scopes: Bennett–Siksek §8.2; GGPY §2; Skorobogatov–Sofos Lemma 6.3; Heath-Brown's real-character statements and Corollary 4 proof; Smith Proposition 6.6; Khayutin §9, Proposition 10.10 and Appendix B; FIMR §2 and §5; BSKK's sieve/large-sieve sections; BGS §3.1 and §3.3; and Koymans–Pagano §7.2. Unread proofs named in the gap list remain unread. No other copy of an uncleared book was used; Halberstam–Richert and Richert's original 1969 paper remain explicit source limitations.

## Corrections to existing nodes

The packet's ordered `review.checked` list gives an individual verdict for every node. The following table records every changed node; all original IDs and all baseline entries are retained.

| Node suffix | Correction |
| --- | --- |
| `level-of-distribution` | Corrected the source page to p.384 and repaired the θ>1 test: moduli divisible by6 need a prime other than2 or3. Added the AN.2 input for the test’s prime-count and reciprocal-totient estimates. |
| `bombieri-vinogradov-level` | Replaced obsolete source-decomposition gap by the direct maximal Bombieri–Vinogradov node; corrected Theorem 18.4 section to §18.2. |
| `selberg-diagonal-sum-dimension-one` | Cited the existing precise AN.2 Mertens supplier node; its supplier proof status remains separate from the consumer plan. |
| `admissible-tuple` | Checked every admissibility API/test; replaced a claim of verbatim reproduction by an explicit finite-set paraphrase. |
| `lambda-max-bound` | Cited the existing precise AN.2 Mertens supplier node; its supplier proof status remains separate from the consumer plan. |
| `s1-diagonalization` | Added the Selberg diagonal-sum dependency and the growing-cutoff hypothesis δ<θ/2. |
| `s2-diagonalization` | Added δ<θ/2 to the growing-cutoff assumptions. |
| `y-m-relation` | Added δ<θ/2 to the growing-cutoff assumptions. |
| `s1-asymptotic` | Added δ<θ/2 to the growing-cutoff assumptions. |
| `s2-asymptotic` | Added δ<θ/2 and an explicit k=1 branch to avoid using the k≥2 diagonal theorem outside its domain. |
| `maynard-sum-asymptotics` | Added δ<θ/2 to both the target and its common assumptions. |
| `maynard-many-primes` | Corrected the extra I-factor in the positivity expansion; separated k=0 and k=1 before using the general variational argument. |
| `symmetric-polynomial-quadratic-forms` | Corrected the matrix-positivity qualification: independent basis for A₁; positive semidefiniteness suffices for A₂. Checked a nonzero symmetric fiber-kernel polynomial. |
| `m105-lower-bound` | Preserved the historical numerical result separately and supplied a reproducible exact 42-coefficient rational witness for M₁₀₅>4. |
| `first-primes-above-k-admissible` | Corrected the diameter formula to zero-based prime indices, matching the existing Lean signature, and separated the empty tuple. |
| `prime-quadratic-bilinear` | Added the stronger Heath-Brown Corollary 4 input for arbitrary numerator coefficients; the Skorobogatov–Sofos prime/prime special case alone is insufficient. |
| `binary-extremely-smooth-average` | Moved fixed α before the implicit constant in packet and Lean. The source proof needs a separate α=0 branch; its bounded-z branch is valid for α>0. |
| `conic-normal-form-adapter` | Added the current upstream even-bilinear half-norm input; local classification and dyadic theory remain imported, with the conic-specific comparison gap explicit. |
| `polynomial-brun-arbitrary-law` | Replaced the FF.1 umbrella by the existing exact finite-field count node supplying this polynomial sieve step. |
| `polynomial-euler-excluding-variable` | Replaced the FF.1 umbrella by the existing exact finite-field count node supplying this polynomial sieve step. |
| `polynomial-farey-large-sieve` | Replaced the FF.1 umbrella by the existing exact finite-field count node supplying this polynomial sieve step. |
| `selberg-dimension-kappa` | Corrected the locator: Chapter14 contains Theorem14.1 and display(14.2.1), not a Theorem14.2. The analytic input and its normalization remain explicit. |
| `linnik-exceptional-nonresidues` | Repaired the smooth-number support argument: p>N^ε makes every smooth integer coprime to p, and the sieve forbids only symbol−1 classes. Kept the AN.5 positive-density input and the recorded counting gap. |
| `chen-switched-distribution` | Corrected the Chen Lemma 6 logarithmic exponent from20 to2.01 and independently certified the switched integral envelope. |
| `joint-spin-setup` | Removed a duplicated GlobalNumberFields Layer3 prerequisite; the native ideal and unit inputs remain imported. |
| `joint-spin-short-character-input` | Recorded the published FIMR erratum and the precise q∤k progression condition, including its reduced conductor; retained the explicit conjectural hypothesis. |
| `fimr-prime-sieve-conversion` | Repaired the FIMR dyadic endpoint while preserving the TypeI/II power-saving exponent. |
| `affine-local-densities` | Cited the existing exact uniform Lang–Weil supplier, separating its proof status from the strong-approximation and intersection-geometry gaps. |
| `affine-expansion-level` | Made the spectral-to-mixing qualification explicit; the theorem already assumes the actual discrepancy estimate and does not infer it from a one-sided gap. |
| `sl2-squarefree-expansion` | Separated the unconditional ordinary expander theorem from the additional mixing comparison needed by the affine sieve. |
| `chen-original-family-lower` | Corrected Chen’s false decimal lower endpoint and independently certified that the desired2.6408 margin survives. |

The growing Maynard cutoff now requires 0<δ<θ/2 in both the mathematical hypotheses and the six affected Lean signatures. The fixed-α extremely-smooth theorem chooses α before its implicit constant. The α=0 branch still requires its own argument; the source's bounded-z branch is valid for fixed α>0. The prime-distribution and short-character conjectures remain explicit hypotheses, and the spin progression condition is q∤k rather than the unnecessarily strong gcd(q,k)=1.

No new target was needed: the missing analytic or geometric work already has a target, supplier request or precise gap. The reader document is outside this issue's permitted edits. Its corresponding statements need the changes in the table when the package is written; the accepted packet and corrected suggested file are authoritative for that work.

## Baseline, suppliers and existing roadmaps

Each of the 206 baseline entries was checked in its actual source file at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, for both its name and the statement used. Native sieve/arithmetic-function, character, finite-field, polynomial, norm and ideal interfaces are imports. No near-miss library result was promoted into an asserted analytic theorem. The reviewed library audit was checked against the new targets.

The current read-only upstream audit used TauCetiRoadmap main `070dc2becd74419e76303ede84b465ed4a69461f` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The newer roadmap inventory, including the nine roadmaps absent from the atlas snapshot, and current library names were screened for duplicates. Relevant actual declarations and README interfaces were read in IntegralLattices, GlobalNumberFields, the completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts roadmaps, and the number-theory library. No upstream file was edited and no upstream build was run.

IntegralLattices Layer 0 already supplies the even-bilinear half-norm construction, including the integral/dyadic convention. Layer 3 supplies odd-prime orthogonal bases and the stated dyadic local targets. The new work is the conic-specific rank-two residue-count comparison, not another local quadratic classification. GlobalNumberFields Layer 3/3C and Layer 11 own generator/unit and order arithmetic. Proper ideals are not automatically invertible ideals. Hilbert reciprocity remains ClassFieldTheory Layer 14; the principal-class natural prime count remains Chebotarev Layer 13.

The exact existing suppliers now cited are AN.2's `mertens-first-theorem` and `mertens-prime-reciprocal`, AN.5's `smooth-rankin-bound`, FF.2's `monic-polynomials-of-degree` and `uniform-lang-weil-estimate`, and FF.3's `irreducible-count-upper-bound`. Their mathematical statements were read; citing a proposed supplier does not assert its proof is closed. The stronger quantitative PNT and boundary adapters still require the recorded requests.

Other supplier near misses remain explicit: AA.4's density of all G(Q) is not strong approximation for a fixed finitely generated subgroup; AC.1's entropic PFR target is not the BGS squarefree-ring sum-product theorem; ES.0's existing interval estimates are not the conjecture C_m; and GN.4's Davenport estimates do not supply the curvature-uniform or codimension-two counts required here. These are requests to the existing owners, not duplicated definitions.

For **RT-AREA-combinatorics/9**, the packet's ownership reconciliation correctly identifies the obsolete SV.3→AC.4 edge as having no exact consumer. The reader does not use that edge as a theorem input: its level-of-distribution definition keeps Elliott–Halberstam conditional, and its tuple W-trick is distinct from AC.4's one-form majorant. RS-07's mathematical ownership is retained. The accepted graph reconciliation withholds the AN.3/SV.2 edge reversal; neither atlas edges nor another roadmap's packet was edited.

## Source findings and reproducible finite checks

All inherited E1–E55 have independent verdicts. E56–E68 add the following scoped findings. Explanations and statements are in our own words; formulas identify the relevant mathematical error. Dated URLs and hashes are retained in `sourceVersions`. “New” records the outcome of bounded publisher/arXiv/author-page correction searches, not an exhaustive novelty claim. The Bonner sieve volume, the Duke KM publication and the published GGPY version were not collated with the specified preprints.

| Findings | Locator and effect |
| --- | --- |
| E56–E57 | Heath-Brown sieve preprint p.24: the definition of E_c and its downstream decay estimate need the x factor. |
| E58 | Same preprint p.33, (5.4): the first-failure tail has minus sign and is divided by X. |
| E59 | Same preprint p.28, Theorem 4.1 before (4.5): the claimed (0,2] argument range applies only above x^(1/3), with the endpoint handled separately. |
| E60 | Maynard p.404: the free index in the single distinguished fiber is m. |
| E61 | Maynard p.411: A₂ need only be positive semidefinite; it can have a kernel. Positive definiteness of A₁ also requires an independent basis. |
| E62 | Khayutin p.230, Lemma 9.21: the coarse prime-harmonic bound does not close the claimed uniform constant. |
| E63 | Khayutin p.231, Lemma 9.23: the log α split omits α=0. For α>0 the bounded-z argument is valid. |
| E64 | FIMR §5: the last dyadic block needs a factor-two endpoint allowance. |
| E65 | Known published FIMR 2015 erratum pp.923–925: progression/conductor, different and exceptional norm divisibility corrections. |
| E66–E67 | BGS §3.3 pp.577,581: ordinary one-sided spectral gap leaves a possible negative extremal eigenvalue, and the numerical saturation endpoint must be strict. |
| E68 | Chen p.127, (27): the printed decimal lower endpoint is too high; −0.0164727 is safe. |

For [Maynard, Lemma 8.2 and (8.15)–(8.17), pp.410–412](https://annals.math.princeton.edu/wp-content/uploads/annals-v181-n1-p07-p.pdf), the corrected factorial/G formulas were evaluated with exact fractions, including G_0=1. The four-term k=5 polynomial gives I₅=29509/1222452000 and ratio 1417255/708216>2; omitting the empty composition gives the wrong 26784/17753. For k=105, the `m105-lower-bound.reviewCertificate` contains all 42 monomials, rational coefficients, I and ΣJ. Recomputing those formulas and checking I>0 and ΣJ>4I by rational cross multiplication gives ratio 4.000543795842…>4. This is a reproducible lower-bound certificate, not a fresh claim about the optimal eigenvalue. Engelsma's 105 entries, endpoints and all 27 relevant prime residues were checked independently.

The positive-semidefinite qualification has a concrete witness: on the two-dimensional simplex, F=∂_x∂_y[x²y²(1−x−y)²] is symmetric and nonzero, with F(1/4,1/4)=1/128 and I₂=1/3150, but both fiber integrals vanish. Its coefficient expansion was integrated exactly.

Chen's numerical checks use rational log intervals, not decimal floating-point assertions. For r≥1 and t=(r−1)/(r+1), use the first 200 terms of 2Σ t^(2j+1)/(2j+1), with remainder bounded by 2t^401/[401(1−t²)]. For (24), sum over i=0,…,6 with a=(16−i)/10 the expression

( log a + (4+i)/(16−i) ) log((108+23i−i²)/(78+23i−i²)) − (3/a) log((27−i)/(26−i)).

The upper interval endpoint is below 0.49255 (value approximately 0.49246325640747). For (27), V=1/2+(3/4)log(9/8)−(3/2)log(4/3)−(1/4)log2 is approximately −0.01647262707537: it is below the printed −0.0164725 and above −0.0164727. The final envelope 8(log4−(1/2)log8+V) is greater than 2.6408 (approximately 2.64080770563682). These finite certificates still need Lean proofs in the eventual implementation. The corrected Lemma 6 error is N/(log N)^2.01, sufficient to be negligible beside N/log²N.

The [Khayutin Appendix B](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf) checks directly enumerate the residue spaces: x²−y² has 5 zeros modulo 3; Q=x²+3y²+12 has 3 zeros modulo 3 and none modulo 9; the restricted genus sum at p=3,u=u_A=ω=1,k=1,ε=−1 is 18 rather than the printed 9. Ordinary x² has 27 zeros modulo 9, demonstrating why its stronger ordinary-density estimate is separate from the corrected-density hypothesis.

For the exact ordered-prime window in Kedlaya's Chapter 16 exercise, the floor sums are 36,745 versus 35,819 smooth integers at N=100,000, and 387,659 versus 344,299 at N=1,000,000. The primes satisfy p⁴>N and p²<N. Independent primality and nonsmooth-multiple enumeration confirms the overcount; the source sum cannot serve as a lower bound for the distinct smooth population.

The [published FIMR erratum](https://link.springer.com/content/pdf/10.1007/s00222-015-0613-9.pdf) is now a source in its own right. In particular the reduced nonprincipal conductor is q/gcd(q,k)>1 when q∤k. Reading this correction does not prove the conjectural character input or the retained native spin and exceptional-set gaps.

## Remaining work and handoff

The coverage lists precisely identify the remaining work. SV.0 needs mass control, conic/local-root comparisons and conductor-local ideal counts. SV.1 needs curvature, binary Euler/smooth estimates, ordinary-density and congruence transport, uniform Selberg denominators, the unread GGPY book input and polynomial Brun uniformity. SV.2 needs the sharp Hilbert proof, quadratic/Jutila analytic inputs, multiplicity-safe Linnik counting and the polynomial Farey comparison. SV.3 needs Vaughan/maximal covering, small-conductor estimates and variance/weighted log budgets. SV.4 needs the stated smooth/asymptotic analytic inputs. SV.5 needs normalized β-functions, Richert and Chen analytical proofs, the separate even-shift route, native spin/tail/TypeI interfaces and actual affine group/mixing/primitive-coset comparisons. These obligations are already in the packet; none is silently discharged by this review.

There is no blocking question for the orchestrator. Proceed to packaging from the accepted packet. Propagate all 31 node corrections, the source scopes, supplier changes, omission/gap lists and numerical certificates into the authorized reader/package documents. Keep Elliott–Halberstam, C_m and general affine expansion explicitly conditional. Let the maintainer reconcile the obsolete edge through the accepted graph procedure. Do not infer a closed stage from the acceptance verdict.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/SieveMethodsAndPrimePatterns.json`: zero errors and warnings.
- Unmodified `source_issues.check_issues` and `check_errata.versions_checked` on the packet fields: zero errors. The file-only `errata-v1` protocol check is inapplicable to a blueprint.
- Namespace-aware main/API/test inventory: no unexplained omissions; all definition/construction minimums satisfied.
- Exact rational Maynard, Chen, tuple, ordered-prime and local-conic checks described above: passed.
- `lean-check research/blueprint/suggested/SieveMethodsAndPrimePatterns.lean`: exit 0 on Lean 4.34.0-rc2 with pinned Mathlib; 566 `sorry` warnings and no other warnings or errors. Available memory before this single check was 97 GiB. This is an admitted native Mathlib prototype, not a proof check or combined Tau Ceti elaboration.
- Swarm `check-files` on the four authorized paths and `git diff --check`: passed.
