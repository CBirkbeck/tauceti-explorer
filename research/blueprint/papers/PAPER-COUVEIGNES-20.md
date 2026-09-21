# PAPER-COUVEIGNES-20 — Enumerating number fields

**Checkpoint, not a completed extraction audit.** Issue #1129. Agent: ChatGPT. Session: `chatgpt-couveignes-20260921-c7e4`. Date: 2026-09-21.

The accompanying `PAPER-COUVEIGNES-20.result.json` contains 42 items: four baseline-library items, two already planned items, and 36 provisionally missing interfaces. Each of those 36 has exactly one proposed route. “Missing” in this checkpoint does **not** certify global absence from the pinned libraries: the unresolved exact-declaration and ownership checks are identified below and in the handoff. These results should not be integrated as an accepted, complete paper extraction yet.

## Source and scope

The source read was the published eleven-page paper, Jean-Marc Couveignes, *Enumerating number fields*, Annals of Mathematics 192 (2020), no. 2, 487–497, DOI `10.4007/annals.2020.192.2.4` [C]. Sections 1–4 and the references were read through browser PDF extraction, with page images used for mathematical notation. The original PDF bytes were not obtained in the worker's scratch directory: container download/clone attempts failed DNS resolution. Consequently `source.sha256` is deliberately null. The arXiv identifier `1907.13617` is bibliographic information, not a claim that all versions were compared.

For the interpolation input, Theorem 1.1 and its exception list were read in Brambilla–Ottaviani, arXiv `math/0701409v2` [BO]. Its full proof has not been extracted. Siegel's second-minimum theorem, Martinet's orthogonal-lattice corollary and Fulton's isolated-intersection bound are recorded with the statements actually needed, but their original proofs have not yet been independently read. These are explicit source-closure tasks, not hidden assumptions of a completed formalization.

The extraction concerns the proof of the component-model and counting theorems. Historical bounds and conjectures discussed in the introduction are context, not prerequisites of this proof. In particular it does not create projects to prove the introductory Schmidt, Ellenberg–Venkatesh or Malle statements merely because the paper discusses them.

## What the paper proves

Write `n = [K : Q]`, `d_K` for the signed discriminant, and `delta = |d_K|^(1/n)`. All logarithms below are natural. Couveignes first proves the following explicit statement (Proposition 2, p. 495). For `d >= 5`, `r >= 1`,

`n(r+1) <= M = binom(d+r,d)`, and `ell = M-n`,

there are `r` integral polynomials of total degree at most `d`, all of whose coefficients have absolute value at most

`ell^(ell/(2n)) * sqrt(M) * [n^2 d(r+1)]^d * delta^(2d)`,

such that `Spec K` is one irreducible component of their common zero scheme on the open set where the Jacobian determinant is invertible. This is a **component model**. It is not a presentation of the whole field by those equations without further localization/component extraction. [C, Proposition 2]

Choosing logarithmic `r` and `d` gives an absolute constant `Q > 0` such that, for `n >= Q`, one can arrange

`r,d <= Q log(n)`, `M <= Q n log(n)`, and coefficient height at most `(n delta)^(Q log(n))`.

This is Theorem 1. Counting coefficient lists and then components gives Theorem 2: for sufficiently large `n` and `H >= 1`,

`N_n(H) <= n^(Q n (log n)^3) * H^(Q (log n)^3)`,

where `N_n(H)` counts degree-exactly-`n` number fields up to `Q`-algebra isomorphism, with absolute discriminant at most `H`. It is an unweighted upper bound, not an asymptotic formula and not a running-time certificate. [C, Theorems 1–2 and Section 4]

## Proof interfaces and the points that must survive formalization

### 1. Short integral elements, not a short integral basis

In signature `(r1,s)`, the paper uses the maximum of the absolute values of all conjugates as its gauge. Its auxiliary canonical Euclidean metric is the real dot product plus twice the real part of the complex dot product. The associated Haar measure is `2^s` times the usual product Lebesgue measure on `R^r1 x C^s`. With that measure the sup unit ball has volume `2^r1 (2 pi)^s >= 2^n`, and the covolume of the integer lattice is `sqrt(|d_K|)`. The normalization bridge must be proved when transporting Mathlib's mixed-embedding statements; identifying the two measures by notation would lose a factor. [C, Section 2]

Every nonzero algebraic integer has sup gauge at least one, because its field norm is a nonzero integer. Minkowski's second theorem gives independent integral elements with the product of their gauges bounded by `delta^(n/2)`. After ordering them, more than half, namely `floor(n/2)+1`, have gauge at most `delta`.

Their pairwise products span `K`. The elementary reason deserves its own interface: if a subspace `V` of a finite field extension has dimension greater than half the field dimension, a nonzero linear functional annihilating `V V` would make `V` isotropic for the nondegenerate form `(a,b) -> f(ab)`, an impossibility by dimensions. Selecting independent products proves Proposition 1: there are `n` independent integral elements `alpha_i`, each with all conjugates at most `delta^2`.

Neither the successive-minimum witnesses nor the selected `alpha_i` are claimed to be a `Z`-basis of the full ring of integers. They are a `Q`-basis of the field. The actual integral basis used later to compute a discriminant is a separate object. [C, Proposition 1]

### 2. Generic first jets and bounded integral parameters

The coefficient module of polynomials in `r` variables of degree at most `d` has the monomial basis of cardinality `M`. Homogenization identifies its complexification with sections of `O(d)` on projective `r`-space. For `n` distinct affine points, their double-point scheme is defined by the square of their ideal sheaf and has length `n(r+1)`. Its restriction map records the values and first derivatives; “well poised” means that this joint map is surjective. [C, Section 3, p. 491]

The Alexander–Hirschowitz input provides a nonempty open locus of full-rank first-jet matrices for `d >= 5` and `n(r+1) <= M`, in characteristic zero. The exceptions listed in [BO, Theorem 1.1] all have degree at most four. This does not prove full rank for every configuration, nor in positive characteristic.

Set `kappa_j = sum_i u_ij alpha_i`. The embedding matrix of the `Q`-basis `alpha` is invertible, so pulling a nonzero maximal minor back to the parameters `u_ij` leaves a nonzero polynomial. Its degree in each variable is at most `dn(r+1)`. Integer-grid nonvanishing therefore supplies parameters in `0,...,dn(r+1)` with the required rank. This is an exact algebraic argument, not rounding a generic complex configuration. [C, p. 492]

Surjective joint first jets imply surjective value evaluation in degree at most `d`. Descending the complex rank statement gives surjectivity over `Q` and `R`, and a closed immersion of `Spec K`. It does **not** give surjectivity of the integral coefficient module onto `O_K`.

### 3. The relation lattice and its finite-index dual image

Let `W` be the real kernel of degree-bounded evaluation and `L = W intersect Z^M`. Then `L` is saturated, has rank `ell = M-n`, and spans `W`. The expression for scalar extension must be `L tensor_Z R` or its identified real span; the printed `L tensor_Q R` should not be copied as a typed construction. [C, p. 493]

For `Lperp = Wperp intersect Z^M`, the unimodular orthogonal-complement theorem gives `covol(L) = covol(Lperp)`. The transpose of integral evaluation embeds `Hom_Z(O_K,Z)` as a full-rank sublattice of `Lperp`. Consequently

`covol(L) <= covol(image of the transpose)`.

The finite index can be nontrivial. Replacing this inclusion by equality would require the unavailable integral surjectivity. A simple regression test is a full-rank integral map with an even-valued row. Primitivity is likewise essential in the orthogonal-covolume statement. [C, p. 493; Martinet, Corollary 1.3.5, original proof pending]

If `M0` is the value matrix and `T` is the inverse embedding matrix of an actual integral basis, `T M0` is integral and

`covol(image)^2 = det(M0 conjugate(M0)^t) / |d_K|`.

This is a positive Hermitian Gram matrix, not an unconjugated transpose. With

`D = M [n^2 d(r+1)]^(2d) delta^(4d)`,

the diagonal entries are at most `D`, so Hadamard yields `covol(L) <= D^(n/2)`. The exact library declarations for this consumer calculation remain to be attached; no second generic determinant theory is proposed. [C, pp. 493–494]

### 4. Discarding exactly `n-1` large relations

Apply Minkowski's second theorem in the `ell`-dimensional Euclidean space `W`. Its unit ball contains the coordinate cube of radius `1/sqrt(ell)`, so its volume is at least `2^ell ell^(-ell/2)`. This is the induced measure in `W`, not the ambient `M`-dimensional measure; the relevant set is a ball, even where the source says sphere. [C, p. 494]

One obtains independent relations `E_i` with product of coefficient norms at most `ell^(ell/2) D^(n/2)`. Since every nonzero integral coefficient vector has norm at least one, the first

`q = ell+1-n = M+1-2n`

relations have norm at most `ell^(ell/(2n)) D^(1/2)`. Their complex span has codimension `n-1` in the full relation space. The retained relations need not generate the integral lattice.

Full first jets imply that the gradient map on the value kernel surjects onto `(C^r)^n`. If the retained subspace projected properly to each of the `n` gradient blocks, its image would have codimension at least `n`, contradicting codimension `n-1`. Hence one block has rank `r`; choose `r` retained equations witnessing it. Their single Jacobian determinant is nonzero at one conjugate, and therefore at every conjugate: its value is one nonzero element of `K`, and every embedding is injective. There is no assumption that `K/Q` is Galois. [C, pp. 494–495]

The localized quotient at this determinant is finite etale over `Q`; the surjective map to `K` then exhibits a field factor. Generic etaleness/component extraction is assigned to the scheme owner, not assumed as an unproved property of a new field-model structure.

### 5. The passage from descriptions to field classes

Take the least positive `r` with `n(r+1) <= binom(2r,r)` and set `d=r`. The elementary central-binomial and Catalan-ratio estimates give, eventually, `r >= 5`, `r <= 3 log(n)` and `M <= 4n(r+1)`. Small degrees must be separated from this eventual statement, rather than applying `d >= 5` to the degree-one test case. [C, Section 4]

There are exactly `(2 floor(B)+1)^(rM)` bounded coefficient lists of height `B`. The isolated-point form of Bezout gives at most `d^r` common zeros with nonzero Jacobian for each list, even when other components of the common zero scheme are positive dimensional. A proper-complete-intersection equality would be the wrong input. Admissible field components map surjectively to field isomorphism classes; an injective selection of one equation list per field is unnecessary. Substituting `delta <= H^(1/n)` and `rM = O(n (log n)^2)` gives Theorem 2. [C, p. 496; Fulton, Chapter 13, exact auxiliary locator pending]

## Library baseline and proposed ownership

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The statements used as positive baseline citations were opened at those commits, not merely found by a name search.

In `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean`, `NumberField.discr` and `discr_ne_zero` supply the signed invariant. Here `delta` is notation; no declaration called `rootDiscr` is asserted at the pin. In `CanonicalEmbedding/Basic.lean`, the checked interfaces include `canonicalEmbedding.norm_le_iff`, `mixedEmbedding.finrank`, `mixedEmbedding.latticeBasis`, `mixedEmbedding.norm_eq_norm` and `mixedEmbedding.fundamentalDomain_integerLattice`. Its anonymous `IsZLattice` instance is consumed without inventing a declaration name. `det_matrixToStdBasis` supplies the complex-coordinate determinant `(2^-1 * I)^s`, but the complete canonical-measure comparison remains an audit task.

The merged reviewed `data/library-coverage.json` was read through blob `5e708cfc74a51b10e62149113872fe4e00eb5846`, including the GN.0 and GN.1 entries. GN.0 is already built; GN.1 is partly built, and explicitly lacks successive minima and Minkowski's second theorem at the pins. Thus the paper imports `GeometryOfNumbersAndQuadraticArithmetic:GN.1`; it must not create a second proof owner.

Tau Ceti already proves `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le` in `TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean`. Its count is over bounded-discriminant subfields of a fixed ambient field, bounded through coefficient and degree bounds. The existing `tauceti:Completed/EffectiveBounds` roadmap is therefore the correct parent for a continuation, not a blank slate.

The four proposed routes are:

| Route | Owner | Boundary |
| --- | --- | --- |
| Source | GeometryOfNumbersAndQuadraticArithmetic, GN.0–GN.1 | Only unbuilt lattice-volume consequences and normalized interfaces after exact overlap checks; existing GN.0 is not replanned. |
| Source | SchemeAndStackFoundations, SF.0 and SF.5 | Generic Jacobian-open component extraction and isolated Bezout, respectively. |
| New, provisional | GenericDoublePointInterpolation | Characteristic-zero double-point restriction and the exception-free Alexander–Hirschowitz input, importing existing polynomial and scheme foundations. |
| Part II | Effective Bounds, Part II: compact models and degree-sensitive field counts | The arithmetic assembly from short integers through simultaneous equations to the degree-sensitive bound. |

`ArithmeticStatistics:ST.0` already plans the unweighted family-count carrier and is an import, not a new carrier in the continuation. Both new-route briefs in the JSON identify their final statements, imports and exclusions. General elementary lemmas provisionally placed beside their immediate consumers must be removed from new work when a pinned declaration already supplies them.

## Validation, tests and remaining work

The packet supplies planning API and regression-test notes, including real/imaginary measure examples, a merely independent integral family, a nontrivial transpose-image index, a multiple-component equation, the empty Jacobian-open of `x^2`, and the small-degree cutoff. These are **planned tests**, not executed Lean examples. No Lean file is required by this paper-routing issue, and none was compiled.

A local candidate JSON was parsed and checked for 42 unique item identifiers and exactly one route for each of its 36 missing items. That local candidate and the connector-uploaded JSON were serialized separately; this limited integrity check is not a byte-for-byte or full-catalogue validation of the submitted file. The repository's `scripts/check_paper.py` was read, but no successful invocation against a complete local checkout is claimed here. Any subsequently observed CI result must be reported separately and does not close the mathematical/source gaps.

Before promotion to `complete`, resolve `G-PROVENANCE`, `G-BASELINE`, `G-OWNERS`, `G-SOURCES` and `G-CHECKS` in the JSON. In particular, finish the complete packet/link/new-roadmap overlap search; read the integrated ArithmeticStatistics decomposition; complete a second nearby upstream roadmap read; and replace provisional absence claims with exact positive declarations or defensible missing interfaces. `EffectiveBounds` was read completely; `NumberFieldArithmetic` and `IntegralLattices` were read only in relevant portions. The generic interpolation ownership is a proposal pending those checks, not an accepted new roadmap.

## Sources

[C] Jean-Marc Couveignes, *Enumerating number fields*, Annals of Mathematics 192 (2020), no. 2, 487–497. Published paper read, accessed 2026-09-21. [Publication](https://annals.math.princeton.edu/2020/192-2/p04), [published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf). DOI `10.4007/annals.2020.192.2.4`.

[BO] Maria Chiara Brambilla and Giorgio Ottaviani, *On the Alexander–Hirschowitz theorem*, J. Pure Appl. Algebra 212 (2008), 1229–1251. [Public version](https://arxiv.org/abs/math/0701409), v2, Theorem 1.1 and exception list checked 2026-09-21; full proof not yet extracted.

Auxiliary original proofs still to acquire/read: Siegel, *Lectures on the Geometry of Numbers*, Lecture III, Section 4, Theorem 16; Martinet, *Perfect Lattices in Euclidean Spaces*, Corollary 1.3.5; Fulton, *Intersection Theory*, second edition, Chapter 13. Bibliographic links and exact required statements are recorded in the JSON prerequisites.
