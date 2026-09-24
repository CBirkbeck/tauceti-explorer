# RT-PAPER-COUVEIGNES-20: independent red team of Couveignes (2020)

**Complete; no new findings.** Codex / `codex-7e92bd`, 24 September 2026. Refs #1735. This worker neither extracted nor reviewed PAPER-COUVEIGNES-20. The target is the accepted revision at atlas commit `a28cd83edb7929dfdee8d03a3b85a95c98d6eb2b`: 49 items, comprising 12 library, 2 planned and 35 missing, with four routes.

The clean result concerns the extraction's mathematical statements, status decisions and routing. It does not certify future blueprints or Lean proofs. The following records the attempted attacks and their boundaries so that an empty findings array is reviewable.

## Source and proof checks

The main source was [Couveignes, *Enumerating number fields*, Annals 192 (2020), 487–497](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf), read in full on 24 September 2026. PDF SHA-256: `8d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104`. Auxiliary checks used [Brambilla–Ottaviani v2](https://arxiv.org/pdf/math/0701409v2), SHA-256 `7d3dd9e6268431f4be53740bbf57ebf46d9a76b13c3472d6911d7f6deb530aa7`, and the [publisher opening of Fulton, Chapter 13](https://link.springer.com/chapter/10.1007/978-1-4612-1700-8_13), read the same day.

**Published source and accepted revision.** Read Couveignes, Enumerating number fields, Annals 192 (2020), all printed pages 487–497, including both theorem statements, both propositions, all four proof sections and references. Read the accepted extraction JSON and report, REV-PAPER-COUVEIGNES-20, and the existing erratum E1. Audit the post-review statuses, including the appended corrections, not the superseded draft totals.

**Discriminant, measure and short integers.** Checked signed discriminant versus absolute root discriminant, multiplicity two at complex places, the 2^s conversion from standard product measure to the canonical weighted metric, the sup-gauge unit ball, and both uses of Minkowski second. The first floor(n/2)+1 independent integers have gauge at most delta; products span K and yield n independent integers with gauge at most delta^2. This produces a Q-basis of integral elements, not a Z-basis of O_K.

**Interpolation hypotheses and proof dependencies.** Checked the double-point length n(r+1), the first-jet matrix, fixed-degree homogenization and the d>=5 characteristic-zero Alexander–Hirschowitz interface. Independently read Brambilla–Ottaviani v2 Theorem 1.1 and its complete exception list, Lemma 6.1, Lemma 6.3, Theorem 6.4 hypotheses and initial proof steps, and the concluding induction/base-case discussion on p. 19. The proposed brief retains residual/trace, curvilinear, semicontinuity, cubic and quartic obligations. It does not treat a source instruction to use a computer as a rank certificate.

**Integral parameter specialization.** Checked the invertible embedding-matrix parameterization, nonzero maximal-minor polynomial, total/per-variable degree bounds, integer grid 0..d*n*(r+1), and algebraic-integer evaluation height. Full jets imply surjectivity of value evaluation over Q/R/C; no unjustified surjectivity onto the ring of integers is claimed.

**Relation lattice and covolume.** Checked saturation and rank ell=M-n, intrinsic Euclidean spans, primitive-orthogonal equality, finite-index transpose image, direction of the covolume inequality, and determinant division by |disc K|. The comparison uses an actual integral basis at the dual-image step and does not promote the earlier short independent family into one. Checked Hadamard and the Euclidean cube/ball lower bound used in the second Minkowski application.

**Truncation and Jacobian minor.** Checked the ordered-product argument retaining q=ell+1-n relations and discarding exactly n-1. Joint gradient surjectivity and codimension <=n-1 force one full-rank gradient block. The same chosen minor is an element of K and remains nonzero under every embedding; K need not be Galois. The available count q>=r follows from M>=n(r+1).

**Etale component and explicit model.** Checked that the selected r equations of degree <=d define the model only after inverting the Jacobian determinant, and that Spec K is a field component. Checked Proposition 2 coefficient height ell^(ell/(2n))*sqrt(M)*[n^2*d*(r+1)]^d*delta^(2d), and the distinction between existing abstract standard-smooth/finite-etale APIs and the concrete localized presentation/component bridge.

**Asymptotics and count.** Checked least-r central-binomial choice, eventual d=r>=5, M<=4*n*(r+1), and common absolute-constant absorption in Theorems 1 and 2. Checked the coefficient box exponent r*M, floor handling, isolated-point Bezout d^r despite positive-dimensional components elsewhere, and the surjective model-component cover of unweighted Q-isomorphism classes. No injective assignment of a unique model, asymptotic equivalent or runtime theorem is asserted.

Two small calculations are particularly useful for testing the extraction. Put M=binom(d+r,r), ell=M-n and q=ell+1-n. Then q-r >= (n-1)(r-1)>=0, so selecting r retained relations is numerically possible. If t_1<=...<=t_ell are the positive integral-relation norms, t_i>=1 and product(t_i)<=ell^(ell/2) D^(n/2), then t_q^n is at most that product. Thus t_q<=ell^(ell/(2n))*sqrt(D), with exactly n-1 relations discarded. The extraction preserves both counts.

For the common-minor step, if every embedding block lost rank on the retained span, its image would lie in a product of n proper subspaces of C^r, forcing codimension at least n. This contradicts the loss of at most n-1 dimensions. A full block therefore exists; its selected determinant belongs to K and every embedding of a field is injective. The same determinant works at all embeddings without a normality assumption.

## Library-status challenges

**All library-positive items.** Read actual statements for all 12 library-status items at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, including the two review corrections (house and per-variable grid), the anonymous lattice/finiteness/Etale instances and their hypotheses. Read Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 HermiteCount/Basic.lean around the cited fixed-ambient counting theorem. Sixteen source files, including near misses, were byte-matched against public pinned URLs.

**Missing-status challenge.** Searched both complete pinned source trees for successive minima, Alexander–Hirschowitz/differential Horace/Hermite interpolation, primitive orthogonal covolume, span/product dimension and determinant-bound terms; inspected GramMatrix, NormDet, GramSchmidtOrtho and Polynomial/Homogenize near misses. The existing univariate-to-bivariate homogenization is not the required arbitrary-variable fixed-degree section comparison. Gram determinant identities do not supply the asserted determinant upper bound by themselves. Missing means no exact supplier located, not a proof of global nonexistence.

The positive evidence is the actual declaration statement, not its name. In particular:

| Items / API | Boundary checked |
| --- | --- |
| `NumberField.discr`, `discr_ne_zero`, `discr_eq_discr_of_algEquiv`, `rootDiscr` | Signed integer discriminant; root discriminant uses its absolute value. |
| `canonicalEmbedding`, `canonicalEmbedding.norm_le_iff`, `mixedEmbedding`, `finrank`, `latticeBasis`, `fundamentalDomain_integerLattice` | Sup norm and lattice carrier; these do not identify the paper's weighted Euclidean measure with standard product measure. |
| `mixedEmbedding.norm_eq_norm` | Multiplicative place norm equals absolute field norm, including complex multiplicity two. |
| `house`, `one_le_house_of_isIntegral` | Nonzero integral element has house at least one; integral and nonzero hypotheses are retained. |
| `mixedEmbedding.covolume_integerLattice`, `volume_fundamentalDomain_latticeBasis` | Existing covolume is 2^(-s)*sqrt(abs(discr)), so the extra measure conversion is necessary. |
| `ZLattice.covolume_div_covolume_eq_relIndex`, determinant/fundamental-domain formulas | Full discrete lattices; the quotient direction is smaller-lattice covolume divided by larger-lattice covolume. Intrinsic orthonormal coordinates are required for the relation subspace. |
| `MvPolynomial.restrictTotalDegree`, `mem_restrictTotalDegree`, `basisRestrictSupport` | Existing module, support basis and finite-module instance. The new item retains the binomial dimension and homogeneous-section comparison. |
| `eq_zero_of_eval_zero_at_prod_finset`, `schwartz_zippel_totalDegree` | Finite variables over an integral domain, strict degree-versus-grid-cardinality hypotheses; characteristic zero gives D+1 distinct integer grid values. |
| `SubmersivePresentation.isStandardSmoothOfRelativeDimension` and the dimension-zero `Etale` instance | An actual finite submersive presentation is needed. The localized quotient construction is left as a bridge. |
| `Algebra.Etale.iff_exists_algEquiv_prod` | Over a field, the result gives a finite product of finite separable extensions; empty product is allowed. |
| Tau Ceti `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le` | Counts subfields of a fixed ambient extension with a different explicit bound; neither exact-degree isomorphism-class conventions nor Couveignes' sharper exponent follow by renaming it. |

The two statuses changed by the independent review are already correct in the accepted JSON. The report's appended correction identifies the old totals and finite-grid discussion as superseded; they were not treated as live missing targets. No exact Hadamard upper-bound, second-minimum witness or generic double-point theorem was found by the named source-tree searches. This negative search is necessarily less conclusive than a positive declaration match.

## Ownership and omissions

**Existing owners and library audit.** Read GN.0/GN.1, SF.0/SF.5, ST.0/ST.3 and R09.1/R09.2 stage descriptions and corresponding document sections; the whole EffectiveBounds README and IntegralLattices conventions/duality/overlattice sections. Read the relevant reviewed library-coverage targets, including built rational duality versus intrinsic real orthogonal-lattice covolume and existing fixed-ambient Hermite counting versus Couveignes degree-sensitive bounds.

**Duplication and route closure.** Screened all captured atlas roadmap/stage extracts, all six new-roadmap definitions, reserved node IDs, relevant EffectiveBounds/IntegralLattices link packets and the integrated ArithmeticStatistics decomposition. No existing GenericDoublePointInterpolation or EffectiveBoundsCompactModels definition was found. Checked four routes, parent-first Part II prerequisite, reusable lattice/geometry imports, ST.0 count carrier and ST.3 consumer direction. Exactly all 35 missing items occur in routes, each once; all 49 item IDs are unique. The two planned items import GN.1 and ST.0.

The GN source route adds four consequences to the existing lattice owner. IntegralLattices' dual quotient, determinant and discriminant-form machinery remains an import; it is not a second owner of the real covolume comparison. The SF source route similarly distinguishes existing abstract étaleness from a concrete Jacobian presentation, and refined Bézout from a proper-intersection equality.

The interpolation route has an independent endpoint absent from the checked catalogue. Its brief expressly imports the scheme and parameter-space owners when needed and preserves the low-degree induction work. EffectiveBoundsCompactModels is a Part II of the existing EffectiveBounds roadmap, whose entire README was read; the existing fixed-ambient count is retained. The arithmetic construction consumes ST.0's equivalence/count conventions, while ST.3 receives its bound. No reverse dependency on statistical asymptotics was introduced.

## Item-by-item coverage index

Each row was compared with its source locator and status; proof checks and library/owner boundaries are recorded above. `missing` means the exact interface is new in the extraction, even when constituent APIs are imported.

| Item suffix | Accepted status | Disposition |
| --- | --- | --- |
| `signed-discriminant` | library | No new finding. |
| `embedding-sup-gauge` | library | No new finding. |
| `integer-lattice` | library | No new finding. |
| `norm-product` | library | No new finding. |
| `measure-normalization` | missing | No new finding. |
| `discriminant-covolume` | missing | No new finding. |
| `integer-gauge-lower-bound` | library | No new finding. |
| `minkowski-second` | planned | No new finding. |
| `ordered-product-bound` | missing | No new finding. |
| `half-small-integers` | missing | No new finding. |
| `product-span` | missing | No new finding. |
| `short-integers` | missing | No new finding. |
| `bounded-polynomials` | missing | No new finding. |
| `double-points` | missing | No new finding. |
| `first-jet-matrix` | missing | No new finding. |
| `generic-hermite` | missing | No new finding. |
| `grid-nonvanishing` | library | No new finding. |
| `parameterized-generators` | missing | No new finding. |
| `bounded-parameter-choice` | missing | No new finding. |
| `value-surjectivity` | missing | No new finding. |
| `relation-lattice` | missing | No new finding. |
| `primitive-orthogonal-covolume` | missing | No new finding. |
| `dual-image` | missing | No new finding. |
| `gram-discriminant-identity` | missing | No new finding. |
| `evaluation-height` | missing | No new finding. |
| `relation-covolume-bound` | missing | No new finding. |
| `euclidean-ball-bound` | missing | No new finding. |
| `independent-short-relations` | missing | No new finding. |
| `truncate-relations` | missing | No new finding. |
| `gradient-surjectivity` | missing | No new finding. |
| `one-full-gradient-block` | missing | No new finding. |
| `common-jacobian-minor` | missing | No new finding. |
| `jacobian-open` | missing | No new finding. |
| `jacobian-etale-components` | missing | No new finding. |
| `explicit-small-model` | missing | No new finding. |
| `central-binomial-choice` | missing | No new finding. |
| `asymptotic-small-model` | missing | No new finding. |
| `isolated-bezout` | missing | No new finding. |
| `coefficient-box` | missing | No new finding. |
| `field-count-carrier` | planned | No new finding. |
| `components-to-classes` | missing | No new finding. |
| `discriminant-count-bound` | missing | No new finding. |
| `baseline-mixed-covolume` | library | No new finding. |
| `baseline-lattice-index` | library | No new finding. |
| `baseline-bounded-polynomials` | library | No new finding. |
| `baseline-total-degree-grid` | library | No new finding. |
| `baseline-standard-smooth` | library | No new finding. |
| `baseline-finite-etale` | library | No new finding. |
| `hadamard-gram` | missing | No new finding. |

## Existing correction and limits

Couveignes p. 493 tensoring the relation lattice over Q is already recorded as erratum E1 and corrected to tensoring over Z; it is not a new finding. Read the Fulton Chapter 13 publisher opening supporting isolated components in improper intersections. Full proofs in the Siegel/Martinet books and Fulton chapter were not independently acquired here. No new full proof audit of every Brambilla–Ottaviani induction case or exact base-case certificate is claimed. Those boundaries are already explicit downstream obligations, not falsely completed work. The main source's tensor-product typo must not be counted twice. The extraction already treats source access and rank certificates as downstream obligations. Completing this red-team task does not complete those obligations.

## Pinned source register and validation

Every file below was compared byte-for-byte with its public pinned source. The JSON additionally records each SHA-256 digest. Reading was at the cited declarations and nearby hypotheses, not a claim to have reviewed every proof in these files.

- [Mathlib/Algebra/Module/ZLattice/Covolume.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/ZLattice/Covolume.lean)
- [Mathlib/Algebra/MvPolynomial/SchwartzZippel.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/SchwartzZippel.lean)
- [Mathlib/Algebra/Polynomial/Homogenize.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Homogenize.lean)
- [Mathlib/Analysis/InnerProductSpace/GramMatrix.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/InnerProductSpace/GramMatrix.lean)
- [Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean)
- [Mathlib/Analysis/InnerProductSpace/NormDet.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/InnerProductSpace/NormDet.lean)
- [Mathlib/Combinatorics/Nullstellensatz.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Combinatorics/Nullstellensatz.lean)
- [Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean)
- [Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean)
- [Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean)
- [Mathlib/NumberTheory/NumberField/House.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/House.lean)
- [Mathlib/RingTheory/Etale/Field.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Etale/Field.lean)
- [Mathlib/RingTheory/MvPolynomial/Basic.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPolynomial/Basic.lean)
- [Mathlib/RingTheory/Smooth/StandardSmooth.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Smooth/StandardSmooth.lean)
- [Mathlib/RingTheory/Smooth/StandardSmoothCotangent.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Smooth/StandardSmoothCotangent.lean)
- [TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean)

Validation: **PASS** — red-team checker; 49 unique extraction items and all 35 missing items routed exactly once; two-file intake with zero problems. All 239 captured input blobs, both output guards and both roadmap-catalogue path sets matched fresh main `38a6a43c8378742bbd4763a90693991d841744c7` before publication. The bot-confirmed claim and whole issue instructions were unchanged. No Lean compilation was performed; these deliverables contain no Lean prototype.
