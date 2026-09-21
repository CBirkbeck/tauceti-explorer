# BSTTTZ (2020): source-critical partial checkpoint

Issue #1420; Codex, session codex-a71f92; read on 2026-09-21.

This is **partial**, not a completed extraction. Both available 2017 author texts were read from beginning to end. The final 2020 version has not been obtained, and the copies demonstrably differ. The JSON preserves twenty checked foundation items (ten library, one planned, nine missing), with a provisional route for those nine. The rest has a resumption register below. Nothing is claimed formalised.

## Source identity and version control

The article is by M. Bhargava, A. Shankar, T. Taniguchi, F. Thorne, J. Tsimerman and Y. Zhao, *Bounds on 2-torsion in class groups of number fields and integral points on elliptic curves*, JAMS 33 (2020), no. 4, 1087–1099, [DOI](https://doi.org/10.1090/jams/945). The [Princeton publication record](https://collaborate.princeton.edu/en/publications/bounds-on-2-torsion-in-class-groups-of-number-fields-and-integral/) dates revisions to November 1 and November 20, 2019. Bibliographic identity matches; agreement of the mathematical text is **not** verified.

| File read | Extent | SHA-256 |
| --- | --- | --- |
| [arXiv v1](https://arxiv.org/pdf/1701.02458), January 11, 2017 | All 12 pages, §§1–7 and references | 99ee35275ecb42c52cd8bbc615538dbe6094326fb72894e88ef82c0b89286871 |
| [Taniguchi author copy](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf), February 18, 2017 | All 13 pages, §§1–7 and references | bba54fd02aadec75b51f2cdbb312c702c06f44384e45a7ec57832704e4e106ec |
| [MPG deposit](https://pure.mpg.de/rest/items/item_3277755_1/component/file_3277756/content), November 25, 2020 | Opening inspected only; retains arXiv v1 stamp | 04e4e52e2e7d2902cfe6ef7c37793650b5a7c3128554cdc3a7a577fb176deb9d |

The February copy adds §5.4, the degree-one del Pezzo surface application, and references. It also attributes the fixed-degree coarse class-number estimate to Landau. The MPG recompile's later date is not evidence of a revised mathematical version: its public metadata labels it a preprint, while a separate publisher-version attachment has restricted visibility. That restricted attachment was not accessed.

The DOI resolves to AMS article S0894-0347-2020-00945-6. The article page, published PDF and accepted-manuscript URL returned HTTP 403 through ordinary publisher links, including the legacy journals path. JSTOR exposed no readable article text. No access restriction was bypassed. Retry: [AMS accepted manuscript](https://www.ams.org/jams/2020-33-04/S0894-0347-2020-00945-6/jams945_AM.pdf).

Use February-copy page numbers for these items; do not invent journal page locators.

## Checked foundation and provisional route

Items class-group through minkowski-class-representative import the actual class group, finiteness, discriminant, archimedean places, mixed embedding, integer/fractional-ideal covolumes and both forms of Minkowski's first theorem. Exact declarations were read at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**. Seven cited source files were compared byte for byte with upstream raw files at that commit.

Pinned source evidence:

- [ClassGroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/ClassGroup/Basic.lean#L90).
- [Class-group finiteness, class number and ideal representatives](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/ClassNumber.lean#L58).
- [Signed discriminant](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean#L37).
- [Infinite places](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean#L57).
- [Mixed embedding](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean#L187).
- [Integer and ideal covolumes](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean#L124).
- [Strict and compact Minkowski theorems](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean#L65).

Reviewed AUDIT-02 at GeometryOfNumbersAndQuadraticArithmetic:GN.1 distinguishes existing Minkowski-first machinery from missing successive minima and Minkowski-second machinery. The general successive-minimum definition is therefore **planned**, not newly owned.

The proposed Part II of **Effective arithmetic bounds and geometry of numbers** (tauceti:Completed/EffectiveBounds) owns the paper-specific balanced-generator and integral-lattice regularity arguments. For \(D_K=|\operatorname{Disc}(K)|\), the extracted targets are:

- An integral representative \(J\) of an order-m ideal class with \(J^m=(\beta)\), \(\beta\ne0\), and \(|\beta|_v\le D_K^{m/(2n)}\) at every infinite place.
- The order-two specialization, retaining the identity-class case.
- A controlled integral basis beginning with 1, the top-coordinate multiplication matrix, and its nondegeneracy.
- \(\lambda_n(\mathcal O_K)\ll_n D_K^{1/n}\) and the coarse balanced-box count \(O_n(D_K^{1/2})\).

The completed EffectiveBounds README and reviewed AUDIT-03 entries were read. Its existing \(h_K\le D_K4^n\), explicit ideal count and fixed-ambient Hermite count do not prove a power saving for 2-torsion. The multiplier construction is stronger than the existing small-norm ideal representative theorem. No completed roadmap is being rewritten.

Import general reduced-basis/second-theorem infrastructure from **Geometry of numbers and quadratic arithmetic** (GeometryOfNumbersAndQuadraticArithmetic), not a competing foundation in this Part II. The exact Siegel basis lemma still needs its original proof. The provisional brief excludes the final torsion summits until version/input checks are completed.

The earlier Couveignes extraction proposes another EffectiveBounds extension. Its unreviewed route is **not** an existing supplier. Reconcile these proposals at design time, particularly reduced-basis machinery.

Searches across both pinned trees found no Bombieri–Pila, Helfgott–Venkatesh, Brumer–Kramer, Sedunova or successive-minimum theorem under those names. Broader searches found genuine quadratic ambiguous-class and elementary-two-quotient APIs in Tau Ceti. Those are leads for the unfinished torsion audit, not evidence for a relative quadratic genus-theory bound over arbitrary base fields. Negative name searches alone do not certify absence.

## Correctness obligations for resumption

These are checks to resolve, not claims that the published article is wrong.

1. **Complex volume and metric.** A complex disc contributes \(\pi R_v^2\), not \(\sqrt\pi R_v\). With \(R_v=D_K^{1/(2n)}|\alpha|_v^{-1/m}\), volume is \(2^r\pi^s\sqrt{D_K}/N(I)\), at least \(2^n\operatorname{covol}(I^{-1})\). Compact non-strict Minkowski handles all-real equality. Do not mix unweighted volume with the trace metric's doubled complex coordinates.

2. **Identity class.** Theorem 2.1 says order m, but its proof needs only order dividing m. Record that extension or handle the identity class directly when counting all 2-torsion.

3. **Norm sign.** \(I^2=(\beta)\) implies \(|N(\beta)|=N(I)^2\), not \(N(\beta)\ge0\). The norm-polynomial argument needs both signs; §5.1 uses \(\pm y^2\).

4. **Reduced-basis comparison.** The §3 paragraph prints its comparison only through n−2, while the proof uses the last basis vector. Obtain the full Siegel lemma, with degree-only constants; handle n=2 separately.

5. **Relative genus theory.** Check the §4 index-two-subfield estimate's dependence on the base class group, units and ramified primes in a primary source. Quadratic-over-Q library results are insufficient.

6. **Squarefree degree.** For an element in a proper subfield, the squarefree part of \(N(\beta-x)\) can have degree smaller than n. Justify the Bombieri–Pila application using the actual degree and rectangle, rather than inserting n into a generic curve estimate.

7. **Hyperelliptic discriminant.** The preprint's Theorem 1.3 uses the discriminant of \(K=\mathbb Q[x]/(f)\). The étale algebra, polynomial order and chosen curve model differ, and the algebra discriminant alone need not control the model's bad-prime set. Check the revised formulation and full descent input before asserting the exact theorem. Track reducible f and non-strict discriminant comparisons.

8. **Characteristic two.** Remark 7.3's geometric 2-torsion cardinality needs the p-rank distinction: \(2^g\) is an upper bound in general, not always equality. Distinguish rational points, geometric points and scheme length.

9. **Function-field hypotheses.** Justify the degree-g divisor over k and identification of rational Picard points with divisor classes. Read Sedunova's precise characteristic, degree and uniformity/epsilon hypotheses; the one-line analogy in §7 is not a replacement.

10. **Del Pezzo fibers.** §5.4 needs singular-fiber handling, anticanonical height normalization, primitive weighted-projective representatives, canonical-height comparison and the height-sensitive integral-point estimate. This entire branch is absent from arXiv v1.

## Resumption register

These branches were read in the author copy but are **not yet JSON items with completed audits**. The numerical exponents describe that copy only.

| Author-copy locus | Extract and audit next |
| --- | --- |
| Introduction / Theorem 1.1 | h_m and h_2 carriers, degree/epsilon quantifiers, general saving \(1/(2n)\), cubic/quartic exponent \(a=0.2784\ldots\), small-degree boundary cases. |
| Theorem 1.2(a–c) | Separate elliptic 2-Selmer cardinality, rank and integral-point estimates: \(a\), \(a\log_2\lvert\Delta\rvert\), \(0.1117\ldots\). Fix an integral nonsingular Weierstrass model. |
| Theorem 1.3(a–b) | Hyperelliptic Jacobian Selmer/rank statements; étale-algebra components and discriminant/local conditions. |
| Theorem 1.4 / §6 | A4 quartic isomorphism-class count \(O_\epsilon(X^{1/2+a+\epsilon})\); normal-closure group versus automorphism group. |
| §4 / Lemma 4.1 | Relative genus theory, discriminant tower, norm polynomial, bounded subfield count, even-index square-polynomial locus, lines modulo Z, Bombieri–Pila and final sum. |
| §5.1 / Theorems 5.1–5.2 | Elliptic norm-curve family, coefficient/discriminant bounds, packing constant, exact Selmer dimension inequality, prime-divisor loss, feedback inequality. |
| §5.2 | Derive all three elliptic consequences separately. |
| §5.3 / Lemma 5.3, Remark 5.4 | Cubic resolvent, discriminant comparison, Tsimerman torsion comparison and reducible-resolvent cases. |
| §5.4 | Weighted sextic del Pezzo presentation, height, elliptic fibration and author-copy bound \(O_X(N^{2.87})\). |
| §6 / (5)–(10), Remark 6.1 | Baily weighted resolvent sum, Cohn cyclic cubic count, fixed-quadratic-resolvent count, partial summation and nonuniformity in that quadratic field. Landau/Davenport–Heilbronn/Wong comparisons are historical inputs, not new paper results. |
| §7 / Theorem 7.1 = 1.7 | Smooth projective geometrically irreducible curves; genus and k-gonality; rational Picard 2-torsion; degree-g divisor and effective representatives; even-divisor section locus; projectivization/surjection; Riemann–Roch bound \((q^{g+1}-1)/(q-1)\); separate bounded-gonality result. |
| Original inputs | Siegel, Bombieri–Pila, Brumer–Kramer, Helfgott–Venkatesh, Tsimerman, Sedunova, Baily, Cohn, Bhargava–Shnidman, Cohen–Morra; Da Costa for del Pezzo; Landau if retaining the historical baseline. |

Recover exact feedback constants rather than rounding. The author copy uses \(\alpha=\sqrt3/2\) and
\[
 b=\frac{1+\alpha}{2\alpha}\log\frac{1+\alpha}{2\alpha}
   -\frac{1-\alpha}{2\alpha}\log\frac{1-\alpha}{2\alpha},
 \qquad a=\frac1{6(1-b/\log2)}.
\]
The integral-point exponent is \(ab/\log2\). Absorb epsilon only after checking the coefficient of \(\log h_2\) is below one.

Next atlas audits: EllipticCurves layers 6–7; RP.0/RP.1; ST.0/ST.3/ST.4; EffectiveDiophantineMethods; SF.3/SF.5; finite-field curves/Jacobians; multiquadratic genus-theory suppliers. ST.4's average-Selmer programme does not automatically prove a pointwise discriminant bound. No route for these unfinished branches is settled here.

## Validation and completion gate

scripts/check_paper.py passes. The nine missing foundation items have exactly one provisional route each; all 20 IDs are unique; parent title and galaxy are valid. No Lean file is requested or compiled. Structural validation is not source matching or mathematical closure.

Obtain the accepted/published article, compare every theorem and §5.4, resolve the listed input questions, finish all item/status audits and routes, and refresh current atlas/instructions before considering complete status.
