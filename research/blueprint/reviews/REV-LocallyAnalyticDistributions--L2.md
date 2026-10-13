# Independent review: Locally analytic distributions, L2

Accepted after corrections. Reviewer: Codex, session codex-Z8YZBz, job
REV-LocallyAnalyticDistributions--L2 (#9250), 13 October 2026.
The input was authored by Claude Opus in BP-LocallyAnalyticDistributions--L2
(PR #9342); this is an independent review.

## Scope and counts

Every node's statement, source locator and match, hypotheses, proof outline,
direct prerequisites, acceptance examples, API and tests was checked. The
review covers all 38 targets: 5 definitions, 3 constructions, 14 lemmas,
15 theorems and 1 comparison. The per-node verdicts are recorded in the
packet: 21 verified and 17 corrected; no node was added or left unverifiable.
All corrections were applied to the packet, reader and suggested file as
appropriate.

There are 61 API items (two extensionality items added), 35 unit tests and
3 planets. Each of the eight definitions/constructions has four or five
discriminating tests. The 18 retained baseline declarations were independently
checked at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
There are no requests or mathematical gaps. The complete pass and planned L2
status are justified by the target coverage in the packet; planned does not
mean implemented. Every implementationStatus remains unchecked.

## Mathematical and interface corrections

1. **colmez-wavelets.** Restricted coordinate indices to k, k′ ≤ [r]; retained the real wavelets and checked their derivative scaling and numerical tests against Lemma I.5.9 and Proposition I.5.16.
2. **cr-locally-analytic-bound.** Made C_1 nonnegative and the negative infimum explicit; checked the constant function against the sign misprint in I.5.19 (E13).
3. **amplitude-coefficient-bound.** Replaced the out-of-range recurrence in I.5.11 by leading-digit predecessor coefficients and checked the induction and factorial losses (E12).
4. **cr-composition.** Confirmed the fractional-order digit counterexample; repaired the r ≥ 1 proof by using a full C^1 Lipschitz constant rather than the false derivative-only bound (E14).
5. **order-on-one-dimensional-groups.** Distinguished the algebraic AbstractMeasure identification from its chosen topology; clarified the compact-open dual API, nonnegative orders, and chartwise extensionality; checked all five tests.
6. **admissible-algebraic-distributions.** Specified raw moments in the constructor and added their extensionality API; confirmed top-degree equivalence and Dirac, Haar, derivative and subdivision tests. Allowed all nonnegative orders in the definition of admissibility (N ≥ [r] belongs only to the extension isomorphism), so the degree-0 Haar test at r = 1 is within scope. The norm supremum is extended-valued before admissibility.
7. **order-r-valuations.** Removed the false finite-degree criterion on arbitrary analytic distributions; retained the restriction isomorphism and norm equivalences on D_r, added the all-degree criterion and d^{N+1}δ_0 counterexample, and linked the top-degree supplier directly.
8. **order-r-operations.** Replaced the false claim that restriction preserves minimal exact order by preservation of D_r membership, with δ_0 as the test; checked the transposed affine operations and derivative convention.
9. **coefficient-extension.** Removed the algebra-tensor injectivity citation, which does not apply to bounded-degree polynomial modules; faithfulness follows directly by restricting the extended form. Checked finite-dimensional norm equivalence.
10. **unit-character-determination.** Corrected the quantifier on splitting fields: extend at each conductor, descend raw moments to L, and then apply uniqueness over L; checked both sharpness examples.
11. **tensor-function-realization.** Made the projective-versus-coefficient norm convention explicit and supplied the uniform tail step in the injectivity induction; independently checked the c₀ tensor argument in I.1.8.
12. **vector-order-mixed-differences.** Handled the zero function separately in the strict valuation comparison and justified strictness for nonzero weighted-null families; rechecked the independent-coordinate counterexample to Definition 2.12.
13. **isotropic-order-functions.** Specified affine GL_d(ℤ_p) invariance and nonnegative order ranges; identified density as a consequence of the next wavelet argument; checked the digit and box tests.
14. **isotropic-wavelet-basis.** Separated n = 0, derived weighted nullity from ε_{M−1}, and proved synthesis and density without assuming the density being proved.
15. **tensor-moment-necessity.** Specified the Mahler-induced projective norm and its dual in the explicit constant, instead of using the predecessor's equivalent coefficient norm without a conversion constant.
16. **tensor-higher-degree-vanishing.** Added the moment-bound prerequisite and justified the refinement-independent C′ by normalising the fixed other-coordinate powers; checked the one-coordinate induction.
17. **block-vector-order.** Strengthened blockwise chart invariance and replaced the differing-weight observation by an actual uniformly convergent function separating the isotropic and split spaces.

The reader's section structure and introductions are retained; all 38 target
entries were synchronized with the packet, including hypotheses, source
matches, changed direct prerequisites, the 61 API items and all 35 tests.
The short source-language proof quotation was removed. No source excerpts
or copied passages are retained.

## Baseline audit

All 19 original declarations exist at the pin, but one does not supply the
claimed interface. Algebra.TensorProduct.includeLeft_injective requires
algebras and flatness hypotheses; bounded-degree polynomial functions are
modules rather than algebras. That entry and its coefficient-extension
prerequisite were removed. The required faithfulness is immediate because
the extended form restricts to the original one, so no replacement target
or library claim is needed.

The retained citations were checked with their actual hypotheses:

| Declarations | Checked interface |
| --- | --- |
| PadicInt.mahlerEquiv | Isometric ℤ_p-linear Mahler equivalence for a complete ultrametric p-adic Banach coefficient space; it supplies the native order-zero case, not higher C^r theory. |
| PadicInt.toZModPow; PadicInt.ker_toZModPow | Ring reduction and kernel ideal generated by p^n; residue fibres are the required balls. |
| LocallyConstant; LocallyConstant.charFn | The native bundled carrier and characteristic functions of clopen sets; algebraic operations are in the separate Algebra module. |
| AddChar.zmodChar; AddChar.zmodChar_primitive_of_primitive_root; AddChar.sum_mulShift | Nonzero finite modulus, primitive root/character and finite-domain orthogonality hypotheses give the additive Fourier formula with the correct inverse and factor p^{-n}. |
| DirichletCharacter.sum_char_inv_mul_char_eq | Nonzero modulus, domain of values and enough roots for the exponent of the unit group; unit orthogonality gives factor φ(p^n)^{-1}. |
| HasEnoughRootsOfUnity.of_card_le; IsPrimitiveRoot.card_rootsOfUnity; IsCyclotomicExtension.zeta_spec | Nonzero exponent and domain/extension hypotheses supply the splitting roots needed at each finite conductor. |
| LinearMap.continuous_of_isClosed_graph; ContinuousLinearEquiv.ofBijective | Complete normed spaces over a nontrivially normed field; used after the roadmap supplies its Banach carriers. |
| ZeroAtInftyContinuousMap | Native c₀ on a discrete index set with a complete coefficient space; cocompact becomes cofinite. |
| AbstractMeasure | The continuous-linear-form carrier. Its type synonym chooses a topology separately; the order-zero Banach identification here uses the operator norm. |
| Polynomial.iterate_derivative_eq_zero | natDegree below the derivative order implies zero; characteristic zero is supplied by the p-adic coefficient field where required. |
| fwdDiff_iter_eq_sum_shift | The binomial signed finite-difference identity used for native Mahler coefficients. |

No Tau Ceti declaration is cited by this packet or imported by its Lean file.
The Tau Ceti pin is retained as the programme baseline, without claiming an
unperformed pinned-library proof check.

## Closure, ownership and granularity

Read the ten external supplier nodes: this roadmap's L0
locally-analytic-radius, amice-mahler-basis and product-analytic-tensor;
L1 amice-derivative and distribution-operations; predecessor L2 c-r-functions,
order-r-distributions, amice-velu-vishik and anisotropic-tensor-wavelets; and
PadicMeasuresIwasawaAlgebras L2/residue-fiber-clopen. Their statements provide
the interfaces used here. The continuation field describes how this part
refines the accepted predecessor, without treating its target formulations
as independent proofs or duplicating their ownership.

Checked the reviewed library audit and the current read-only TauCetiRoadmap
main and Tau Ceti library, including the roadmaps that postdate the atlas
snapshot. Native Mahler theory and bounded measures are suppliers. No existing
higher C^r growth, tensor wavelet or order-r distribution target was found
that this part duplicates. Nearby upstream roadmap forms were read to check
the compact suggested-file shape. No notion moves from a higher tier and no
upstream roadmap file was edited.

The wavelet coefficient argument, tensor injectivity induction and
coordinatewise subdivision are proof steps of existing targets. They do not
need an auxiliary declaration chain at this target-level granularity. The
two formerly implicit direct links now cite admissible-algebraic-distributions
from order-r-valuations and tensor-wavelet-value-bound from
tensor-higher-degree-vanishing.

## Sources and source-issue verdicts

The public author/arXiv PDFs were independently read at every target locator,
and their SHA-256 hashes agree with the packet. This includes Colmez's Taylor,
wavelet, density, Mahler and admissibility proofs; Loeffler §2 in all three
arXiv versions; De Ieso's algebra and composition arguments; and Rodrigues
Jacinto–Williams Theorem B.1, pp. 79–80. The review also read Colmez I.1.8,
p. 6, for the completed c₀ tensor argument.

The published Colmez article is freely readable on
[Numdam](https://www.numdam.org/article/AST_2010__330__13_0.pdf), contrary to the
original source-access note. Its hash and exact read pages are now recorded.
Author and published pagination differ and are never interchanged.

| Finding | Verdict and locator |
| --- | --- |
| E7 | Confirmed integrand misprint, Colmez II.3.2(ii), author p. 33 / published p. 44. |
| E8 | Confirmed fractional-order composition failure, Colmez I.5.6, author p. 20 / published p. 31. The uniform digit-map example and Lipschitz repair were recomputed. |
| E9 | Confirmed the same fractional-order failure for F = ℚ_p, De Ieso 2.12, pp. 12–13. The claim that its higher-order proof was unaffected was qualified by E14. |
| E10 | Confirmed wrong function symbol in the remainder of h, De Ieso 2.10, p. 12. |
| E11 | Confirmed the known E3 defect in Loeffler v1 Definition 2.12, pp. 4–5, and v2 Definition 12, p. 6, as in v3. Both possible readings of the unnamed v1 limit fail the asserted normed tensor identification. |
| E12 (added) | Confirmed out-of-range coefficient indices, Colmez I.5.11 proof, author p. 22 / published p. 33. The p = 2, h = 1 case requests b_2 from b_0, b_1. |
| E13 (added) | Confirmed sign error in the chosen norm constant, Colmez I.5.19 proof, author p. 25 / published p. 36. The constant function at h = 0 contradicts the printed choice; use the negative infimum. |
| E14 (added) | Confirmed false derivative-only estimate (2.25), De Ieso 2.12 proof, p. 13. The C^1 map q(x) = Σa_n(x)p^{2n} has derivative zero yet gives a nonzero left side for f = h = q, y = p^m. A full C^1 Lipschitz bound repairs the proof. |

E12–E14 affect proofs, with explicit repairs. All eight sourceIssues have
confirmed review objects. Bounded searches of the atlas source issues,
errata register, source records and public correction searches are recorded;
they are not claims that no other correction exists. No source was quoted.

Loeffler's published Springer chapter was not read: the recorded accepted
manuscript link was not public, and the version of record was paywalled.
The remaining item asks only to compare E3/E11 with that chapter when a
readable copy is supplied; no claim about its printed text is made. The
planned mathematics and reviewed public-version counterexamples do not
depend on that comparison.

## Suggested Lean and validation

The suggested file was reduced from 831 to 390 lines to follow the binding
WORKERS.md shape. It has 15 real-bodied light definitions, seven selected
end theorem signatures and sixteen examples. Missing Banach/dual/tensor
carriers and their APIs/tests are explicit README targets, with a complete
commented name inventory. Removed data sorries, proof-sorry structure
constructions, proxy norm definitions and auxiliary theorem development.
No language server or library build was run.

- python3 scripts/check_blueprint.py research/blueprint/packets/LocallyAnalyticDistributions--L2.json: zero errors and warnings.
- lean-check research/blueprint/suggested/LocallyAnalyticDistributions--L2.lean: elaborates at pinned Mathlib; only the seventeen expected declaration-uses-sorry warnings.
- Reader/packet comparison: all statements, additional hypotheses, proof steps,
  source locators/matches, acceptance properties, API and test names agree;
  common hypotheses are given in the reader's conventions.
- Every packet API and test name is present in the suggested file's explicit
  declaration/example or README-only inventory.
- JSON validity, source-issue verdict coverage, review coverage, file scope,
  absence of private paths/data sorries and git diff --check were checked.

These checks validate proposed signatures and consistency, not theorem proofs.

## Orchestrator handoff

Package this accepted L2 continuation together with its accepted predecessor;
preserve the norm conventions, finite-degree caveat, conductorwise descent,
corrected composition and concrete block test. Carry E7–E14 and the Numdam
source record into the assembled roadmap. The published Loeffler comparison
is the sole remaining source-access item. No upstream ownership move,
request or additional review job is needed for these in-place corrections.
