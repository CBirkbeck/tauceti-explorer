# Bruinier–Ehlen–Yang: extraction under revision

**Status: partial; independent verdict: revise.** Codex `codex-7e92bd`, 23 September 2026. The original extraction was written by Claude Code `cc-39fac3`. See the [independent review](../reviews/REV-PAPER-BRUINIER-EHLEN-YANG-21.md) for the 46-row audit, pinned library evidence, mathematical checks, source findings and exact revision conditions.

The paper develops higher regularized theta lifts on orthogonal Shimura varieties, small and big CM-value formulas, arithmetic preimages of binary theta series, partial averages via Zagier/Millson lifts, and a higher-weight Gross–Kohnen–Zagier theorem. The extraction requires revision. The original 46 rows bundle many separate definitions and results; proof suppliers, API contracts and tests are not recursively closed. This review corrects clear hypotheses and locators, credits existing shifted Legendre polynomials and quadratic two-rank theory, and records 27 confirmed source findings with carefully bounded conclusions. In particular the earlier proposed odd-j constant repair is not established: p_z sign, Poincare-series normalization and SL/PSL multiplicities must be reconciled together. Example 3 also confuses two nonisometric discriminant-63 lattices. Every missing aggregate is provisionally routed once, but no route is accepted for intake in this review.

The [published article](https://doi.org/10.1007/s00222-021-01038-0) and [arXiv v2](https://arxiv.org/abs/1912.12084v2) are the sources. The independent reviewer read the v2 body and appendix and collated every source finding at the published locator. The result JSON preserves the earlier extractor’s reading claims separately; no complete recursive audit of the prerequisite originals or Lean elaboration is claimed.

## Current coverage

There are 46 stable aggregate rows: **1 library, 5 planned, 40 missing**. Each missing item is provisionally assigned once. All eight routes are rejected pending revision; none should become a design job from this review. The row-level statements in the JSON are authoritative for the corrections, with diagnostic labels retained where exact constants or hypotheses are unresolved.

Existing inputs include Mathlib’s modular/cusp forms, normalized Eisenstein forms, Δ, the fundamental-domain set, Gamma and the convergent hypergeometric series carrier. The latter is not a global analytic-continuation interface. Tau Ceti’s imaginary-quadratic two-rank theorem and Mathlib’s shifted Legendre polynomials must be imported. The finite-discriminant Weil and weak-Jacobi-generator aggregates are missing at their full asserted scopes.

## Routes

1. **GeometryOfNumbersAndQuadraticArithmetic: rejected.** Reject the present aggregate: import the built imaginary-quadratic two-rank/genus infrastructure and split off the binary-form/matrix genus-character comparison. GN.2 is a plausible adapter owner; it must not rebuild Tau Ceti Multiquadratic or the upstream Hilbert-symbol theory.

2. **MetaplecticAutomorphicForms: rejected.** MP.6 is the right theta-integral direction, but row 9 combines coherent Siegel–Weil, incoherent vanishing and operator identities without separate normalizations or extracted suppliers. Split these and state the volume/representation contracts before using this source route.

3. **MetaplecticAutomorphicForms: rejected.** MP.7 is a plausible extension owner, but its description does not explicitly supply the asserted full Shimura/Skoruppa–Zagier newform correspondence. Split the explicit lift from the isomorphism and acquire their precise sources and hypotheses.

4. **GrossZagierAndArithmeticHeights: rejected.** GZ.6 owns the incoherent derivative direction. Row 10 leaves the Kudla–Yang Fourier formulas, constant coefficient and Hilbert analogue inside quoted prerequisites; a source attribution alone does not establish this whole interface.

5. **GrossZagierAndArithmeticHeights: rejected.** GZ.7 owns finite local intersections, but rows 14–16 need separate moduli, Cartier/closure, pullback, deformation-length and weighted-intersection contracts and the external Howard/Xue/Bruinier–Yang proof suppliers.

6. **HigherGreenFunctionCMValues: rejected.** The proposed Part II has the right broad direction and should coalesce with PAPER-LI-23, but the brief is not buildable: unresolved global and odd-branch normalization, nonisometric example lattices, missing hypotheses, unsplit API/definition rows, and quoted analytic/arithmetic suppliers. Import GH.0/GH.1 rather than rebuilding their cycle construction; the unreviewed GSpin candidate is not a completed dependency and its n=1,2 boundary is uncovered.

7. **MetaplecticAutomorphicForms: rejected.** The new source route records the residual finite-discriminant Weil comparison in the shared MP.2/MP.4 direction. It is not accepted until S/T relations, contragredient/central-character conventions, dyadic cases and the finite-index sublattice comparison are individually specified.

8. **MetaplecticAutomorphicForms: rejected.** The new source route assigns weak-Jacobi generators and their normalizations to MP.8, the Jacobi/theta-decomposition owner imported by QM.1. It remains incomplete until the weak-ring theorem and its vector-valued comparison are extracted with API and coefficient tests.

## Source corrections and limits

E1–E6 are retained with independent review. E3 now confirms the inconsistency without claiming the old proposed odd-j coefficient is proved. E5 uses the correct q⁻²+O(1) pole witness. E7–E27 add checked weight, sign, discriminant, convergence, preimage-space, averaging, lattice and proof-inference findings. The full entries distinguish harmless misprints, false local identities and gaps in proofs; they do not infer that every affected final theorem is false.

The normalization audit must simultaneously fix p_z, F versus f_m, SL₂ versus PSL₂ multiplicities and the weighted CM divisors. Example 3 uses incompatible discriminant-63 lattices and cannot independently settle these constants. Off-divisor raw Green values must be separated from the finite noncontinuous regularized extension.

## Required revision

- **G1: Normalization and singular-domain closure.** Fix E3/E12/E25 simultaneously; separate raw and finite regularized values, principal-part factors, group quotients and weighted cycles. Recompute independent numerical examples with error bounds.
- **G2: Granularity, API and tests.** The 46 rows are aggregate summaries, often containing several numbered results. Split each definition/construction and every used theorem; specify constructors, coefficient/normalization maps, transformation and composition laws, and positive/negative acceptance propositions. The route-level numerical examples do not supply APIs or unit tests for these carriers.
- **G3: Analytic proof suppliers.** Acquire the named prerequisite originals and extract the exact-sequence, analytic continuation/current/L², Fourier-coefficient, bounded-denominator and lift comparison results recursively. No acceptance is implied by their occurrence in prerequisites.
- **G4: Arithmetic and CM proof suppliers.** Supply stabilizer/order comparison, proper CM ideals and binary forms, class-field reciprocity, scaled Borcherds rationality with uniform multiplier, nonvanishing/cancellation, Gillet–Soule intersection theory and Zhang/Xue/Howard comparisons. Use norm descent (E15); close fixed-orbit integrality (E24).
- **G5: Hypotheses and component conventions.** Resolve finite Weil and weak-Jacobi residuals, restriction carriers, weights and real/complex linearity. State rational/integral hypotheses for the post-Theorem-5.10 rational-log consequence and supply its omitted proof.
- **G6: Ownership and candidate boundaries.** Import built Multiquadratic and shifted Legendre material; import GH.0/GH.1 and common CM interfaces. Coalesce PAPER-LI-23 without treating its absent review as acceptance. GSpinSpecialDivisorHeights also has no review and does not automatically cover n=1,2. Do not replace the discriminant-module comparison with a finite-field Weil representation.

The Part II brief in the JSON gives the required imports and sequencing. It is a rejected revision brief, not an accepted closed plan. Definition APIs, unit tests and recursive supplier extraction remain required. The repository paper checker and focused review checks pass; no Lean file was compiled.
