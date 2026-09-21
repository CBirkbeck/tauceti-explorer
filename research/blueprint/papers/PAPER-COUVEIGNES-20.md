# PAPER-COUVEIGNES-20 — Enumerating number fields

Complete paper extraction and routing proposal. Issue #1129. Agent: Codex. Session: `codex-a71f92`. Date: 2026-09-21.

This continues the partial checkpoint merged through PR #1213, preserving its 42 item IDs and adding seven explicit inputs. The result has 49 items: 10 library, 2 planned and 37 missing. Every missing item has exactly one route. “Complete” describes the extraction and ownership screen under PROTOCOL §16; it does not mean that the proposed roadmaps exist, that their blueprints are closed, that the routes are independently accepted, or that any new theorem is formalized.

## Source and scope

I downloaded the published eleven-page Annals paper and read all of pp. 487–497, including every proof and the references. Its SHA-256 is `8d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104`; this closes the inherited download/provenance gap. The arXiv identifier is bibliographic, not a claim to have compared all versions.

For the interpolation input I downloaded Brambilla–Ottaviani, arXiv `math/0701409v2`, and read Sections 1–6, pp. 1–19: the theorem, exceptions, plane case, residual/trace argument, cubics, curvilinear lemma and differential-Horace induction. SHA-256: `7d3dd9e6268431f4be53740bbf57ebf46d9a76b13c3472d6911d7f6deb530aa7`. The historical Section 7 is not part of that reading claim.

Fulton's publisher-hosted Chapter 13 opening, p. 210, was checked: its refined Bézout bound explicitly includes all irreducible components even without properness of the entire intersection. The full book proof is not provided by that preview. Martinet Corollary 1.3.5 and Siegel Lecture III, §4, Theorem 16 were checked as citations and used statements in Couveignes, not independently read in the original books. Their exact obligations and owners remain explicit below and in the JSON. An extraction job identifies these inputs; it does not silently certify unread auxiliary proofs.

Historical Schmidt and Ellenberg–Venkatesh bounds, Malle's conjecture, and comparisons in the introduction are context, not inputs of this proof. No separate project to prove each introductory statement is proposed.

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

There are exactly `(2 floor(B)+1)^(rM)` bounded coefficient lists of height `B`. The isolated-point form of Bezout gives at most `d^r` common zeros with nonzero Jacobian for each list, even when other components of the common zero scheme are positive dimensional. A proper-complete-intersection equality would be the wrong input. Admissible field components map surjectively to field isomorphism classes; an injective selection of one equation list per field is unnecessary. Substituting `delta <= H^(1/n)` and `rM = O(n (log n)^2)` gives Theorem 2. [C, p. 496; Fulton, Chapter 13 opening, p. 210; full auxiliary proof remains an SF.5 obligation]

## Pinned baseline: what must not be rebuilt

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.

I opened the declarations used in the positive classifications. Ten local source files were compared byte-for-byte with raw upstream files at those commits; all matched. These are the three NumberField discriminant/embedding files, ZLattice/Covolume, MvPolynomial/SchwartzZippel, RingTheory/MvPolynomial/Basic, Smooth/StandardSmooth, Smooth/StandardSmoothCotangent, Etale/Field, and Tau Ceti's EffectiveBounds/HermiteCount/Basic.

| Input | Checked declaration/interface | Boundary |
| --- | --- | --- |
| Signed and root discriminant | `NumberField.discr`, `discr_ne_zero`, `discr_eq_discr_of_algEquiv`; `NumberField.rootDiscr` | The checkpoint was wrong to deny a root-discriminant declaration: Basic.lean 74–86 defines exactly the required real power. |
| Archimedean lattice and gauges | `canonicalEmbedding.norm_le_iff`; `mixedEmbedding.finrank`, `latticeBasis`, `fundamentalDomain_integerLattice`, `norm_eq_norm` | The multiplicative field-norm function is not the sup norm or coefficient Euclidean norm. The IsZLattice instance is anonymous. |
| Product-measure covolume | `mixedEmbedding.covolume_integerLattice`, `volume_fundamentalDomain_latticeBasis` | Value is $2^{-s}\sqrt{\lvert d_K\rvert}$, not the paper's $\sqrt{\lvert d_K\rvert}$. Multiply the measure by $2^s$. Even `euclidean.volumePreserving_toMixed` uses the unweighted metric. |
| Determinant/index | `ZLattice.covolume_eq_det_mul_measureReal`, `covolume_eq_measure_fundamentalDomain`, `covolume_div_covolume_eq_relIndex` | Transport to orthonormal coordinates of the actual span; smaller full lattice means larger covolume. This does not itself prove the primitive-orthogonal equality. |
| Bounded polynomial module | `MvPolynomial.restrictTotalDegree`, `mem_restrictTotalDegree`, `basisRestrictSupport` | Carrier, basis and finite generation exist. The finite binomial count, metric and homogeneous-section identification remain a comparison package, not a new polynomial ring. |
| Integer-grid input | `MvPolynomial.schwartz_zippel_totalDegree` | The actual maximal minor has total degree at most $dn(r+1)$. On a grid of $dn(r+1)+1$ points in each coordinate, the zero fraction is strictly less than one. |
| Jacobian/étale infrastructure | `Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension` and `IsStandardSmoothOfRelativeDimension` | The dimension-zero-to-Etale instance in StandardSmoothCotangent.lean is anonymous. Construct the concrete localized quotient presentation; do not assume the required instance without doing so. |
| Finite étale structure | `Algebra.Etale.iff_exists_algEquiv_prod` | Already proves finite products of finite separable extensions, including the empty product. The particular surjective evaluation/component identification remains to connect. |

The per-variable grid statement extracted from the paper is stronger than the total-degree library statement. It remains a source item, but the proposed design should use the existing total-degree theorem for this paper's determinant instead of building an unnecessary general lemma first. Pullback through the invertible embedding matrix is linear, so total degree does not increase. A determinant with $n(r+1)$ rows and entries of degree at most $d$ has degree at most $dn(r+1)$.

Minkowski's first theorem is present; the reviewed GN.1 audit and source searches do not supply the second theorem with independent-vector product bounds. The latter is already planned at GN.1 and is not routed to a competing project.

The primitive-orthogonal covolume equality was not found in the integral-lattice or real-lattice APIs. The completed IntegralLattices development includes rational carriers, duals, discriminant forms, finite-module perpendiculars, orthogonal sums and gluing. These do not by themselves identify Euclidean covolumes of saturated complementary sublattices. A direct proof extends a primitive basis to a unimodular integral basis, uses the complementary dual basis, and compares Gram determinants. For example $\mathbb Z(1,1)$ and $\mathbb Z(1,-1)$ both have covolume $\sqrt2$; replacing the former by $2\mathbb Z(1,1)$ breaks equality. This is a small GN.0 addition, not a re-plan of IntegralLattices.

Likewise the generic Gram determinant upper bound is separated as `hadamard-gram`. Searches of matrix, determinant, Gram, inner-product and measure APIs did not locate that exact bound. The file named Hadamard concerns the entrywise matrix product, not the determinant inequality. Existing Gram positivity and Gram–Schmidt infrastructure is reusable; no guessed determinant-bound declaration is cited.

These absence classifications mean that the specified combined statement was not located after the recorded source/audit search. They do not assert that its elementary substeps lack library support. Several consumer bridges are deliberately short consequences of existing facts.

## Ownership screen and four routes

The screen used all atlas stage descriptions, accepted decomposition inventory, draft packet and new-roadmap inventory, relevant link maps and reviewed coverage. The six registered new-roadmap definitions do not contain generic double-point interpolation or compact number-field component models. No new owner was inferred from thematic similarity alone.

I read two nearby upstream documents completely: `content/tau-ceti/Completed/EffectiveBounds/README.md` (178 lines) and `content/tau-ceti/Completed/IntegralLattices/README.md` (430 lines). I also read the full GN and ArithmeticStatistics campaign READMEs, relevant SF.0/SF.5 and R09.1/R09.2 descriptions, and the reviewed GN.0/GN.1, SF.0/SF.5, ST.0/ST.2/ST.3 and all EffectiveBounds/IntegralLattices coverage targets. The accepted ArithmeticStatistics decomposition's coverage, gaps, ST.3 node, source and review records were checked: it concerns binary quartic/Selmer counts and quoted low-degree predecessors, not Couveignes's compact models. It explicitly leaves general field counting undecomposed.

The current accepted RS-07 proposal preserves ST.0's arithmetic-family/discriminant/equivalence interface and distinguishes ST.3's selected asymptotics/moments from analytic per-field inputs. Its Davenport supplier at GN.4 is not the Minkowski second theorem used here. This proposal does not remove ST.0 as a supplier. The EffectiveBounds link map supplies unit-square indices to Multiquadratic; IntegralLattices' seven relevant links concern coding/gluing, not the new primitive-orthogonal Euclidean comparison. No retired FoundationsAndLibraryIntegration stage is used as a supplier.

The atlas snapshot was checked forward from `3a9e9d7877bad538bc4e0ed202e88b8bc0fef8f0` through `a740e11431256af2d2108be5a1a73a27095da3be` to `ba0bc2ee5af0c420e4afe987cc286394addab9a3`: the mathematical atlas/README/audit records relevant here did not change; accepted-restructure promotion and refreshed link records were considered separately.

1. **GN source addition (four items).** GN.0/GN.1 receive the primitive-orthogonal covolume equality, ordered-product estimate, intrinsic ball-volume lower bound and Gram determinant bound. Existing covolume/measure/index infrastructure stays baseline. The genuine second theorem is already a GN.1 import.
2. **SF source addition (two items).** SF.0 receives the concrete Jacobian-open presentation/component comparison. SF.5 receives isolated-point Bézout, with no global proper-intersection assumption. Abstract étale and finite-product theory stays baseline.
3. **GenericDoublePointInterpolation (five items).** A new algebraic-geometry roadmap supplies the bounded-degree/homogeneous-section comparison, double points, first-jet matrix, generic Alexander–Hirschowitz consequence and small grid interface. R09.1/2's projective/Hilbert/Quot foundations are inputs when the proof uses them, not competing interpolation theorems. ArithmeticDynamics' periodic-point equations are also not this generic interpolation endpoint.
4. **EffectiveBoundsCompactModels (26 items).** Extend **Effective arithmetic bounds and geometry of numbers** (`tauceti:Completed/EffectiveBounds`) as its Part II, starting after its effective Hermite–Minkowski theorem. The Part II owns arithmetic assembly, not a second lattice or scheme foundation. Its full title and `algebraicnt` galaxy ID are corrected from the checkpoint. The interpolation project uses `algebraicgeometry`.

Tau Ceti's `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le` was read in HermiteCount/Basic.lean 172ff: it bounds finite-degree subfields of a fixed extension $A/\mathbb Q$ by $(2C+1)^{D+1}D$, where $C,D$ depend on a discriminant cutoff. It is neither an exact-degree isomorphism-class carrier nor Couveignes's exponent. It supplies a useful finiteness input after a comparison, not the new theorem. ST.0 owns the unweighted class carrier; ST.3 may consume the Part II bound without becoming a prerequisite of its model construction.

## Interpolation proof obligations are visible

The $d\ge5$ hypothesis avoids every exception in BO Theorem 1.1, but does not eliminate the low-degree base cases of its proof. Sections 4–6 use residual/trace restriction sequences and Hilbert-function semicontinuity. Theorem 5.1 reduces cubics by codimension-three specialization; Propositions 5.2–5.4 include explicit finite-dimensional rank computations. Lemma 6.1 reduces independence to curvilinear subschemes; Theorem 6.4 handles the rounded dimension counts through differential-Horace degeneration. Its final quartic starting cases include the $\mathbb P^5$, degree-four, 21-point configuration.

The proposed design must give verified exact rank certificates for the computer-check instructions, and the actual scheme-theoretic specialization/semicontinuity inputs. Reading those instructions is not running or verifying the computations. This is why the main source can be fully extracted while the future interpolation blueprint is not yet closed. No computation, formal proof, or source closure is falsely reported.

For the orthogonal-covolume and isolated-Bézout additions, the JSON records the exact source statements, what was read, and what the later supplier decomposition must acquire/prove. The source-route classification does not pretend that a book title is a Lean theorem.

## API and regression requirements

The JSON notes give the construction APIs. The following precise checks are part of the downstream design, not executed Lean tests:

- For $K=\mathbb Q$, root discriminant and integer-lattice covolume are one. For $K=\mathbb Q(i)$, the product-measure covolume is one, the canonical covolume is two, and the two-dimensional sup ball is a disc with canonical area $2\pi$.
- A short independent family need not be an integral basis: $1,2i$ is a rational basis consisting of Gaussian integers but has index two in $\mathbb Z[i]$.
- The coefficient space has dimensions $d+1$ for one variable, one for degree zero, and six for two variables of degree at most two. A rectangular per-variable bound would incorrectly give nine in the last case.
- A single double point in $\mathbb A^r$ has length $r+1$. Two coincident points do not give length $2(r+1)$; the distinctness condition cannot be removed.
- Three distinct collinear points in $\mathbb A^2$ admit full degree-five first-jet rank. Four distinct collinear points do not: values and tangential derivatives impose eight conditions on a univariate polynomial space of dimension six, despite the ambient capacity inequality $4(2+1)\le21$. The generic theorem must not say every distinct configuration works.
- In one variable, generic first jets recover Hermite interpolation whenever $2n\le d+1$.
- The full-rank map $\mathbb Z^2\to\mathbb Z$, $(a,b)\mapsto2a$, has transpose image $2\mathbb Z(1,0)$ of index two in the orthogonal complement lattice. Covolume equality with that image would be wrong.
- The primitive complementary lines generated by $(1,1)$ and $(1,-1)$ have equal intrinsic covolumes. Ambient two-dimensional measure of either line is zero and is the wrong measure.
- With $n\ge1,r\ge1,M\ge n(r+1)$, the retained number $q=M+1-2n$ satisfies $q\ge r$, since $q-r\ge(n-1)(r-1)$. Its codimension is exactly $n-1$, not $n$.
- For $E=x(x-1)$ over $\mathbb Q$, the Jacobian-open algebra is $\mathbb Q\times\mathbb Q$; a chosen field component is not the whole algebra. For $E=x^2$, the Jacobian-open is empty.
- A surjection from admissible components onto field classes is sufficient for counting. Duplicate models must not be assumed absent.
- The least $r$ at $n=1$ is one; applying the eventual $r\ge5$ or $r\le3\log n$ assertions there is invalid.

## Validation and handoff

The repository's `scripts/check_paper.py` is the structural check. The additional scratch checker verifies preserved IDs, unique single routes for every missing item, no routed library items, existing stage/roadmap IDs, valid galaxy IDs, exact Part II parent-title prefix, no duplicate new owner, and coverage of every library citation in the baseline manifest. Simple arithmetic checks exercise the capacity/truncation and eventual binomial bounds. Neither check establishes a mathematical proof.

No Lean file is required by a paper-v1 job and none was written or compiled. Only the result JSON, this report and this job's handoff are submitted. Source PDFs and diagnostic scripts remain scratch files. Independent paper review is still required; no route or roadmap is manually promoted.

## Sources

[C] Jean-Marc Couveignes, *Enumerating number fields*, Annals of Mathematics 192 (2020), no. 2, 487–497. DOI `10.4007/annals.2020.192.2.4`. [Publisher](https://annals.math.princeton.edu/2020/192-2/p04), [published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf). Accessed 2026-09-21.

[BO] Maria Chiara Brambilla and Giorgio Ottaviani, *On the Alexander–Hirschowitz theorem*, JPAA 212 (2008), 1229–1251. [arXiv v2](https://arxiv.org/abs/math/0701409v2). Sections 1–6 read; access and checksum above.

[M] Jacques Martinet, *Perfect Lattices in Euclidean Spaces* (2003), Corollary 1.3.5. [DOI](https://doi.org/10.1007/978-3-662-05167-2). Original proof not independently read; Couveignes's use and a proof route are recorded.

[F] William Fulton, *Intersection Theory*, second edition (1998), Chapter 13, pp. 210–234. [Publisher's chapter opening](https://link.springer.com/chapter/10.1007/978-1-4612-1700-8_13). The p. 210 refined-Bézout statement was read, not the full subscription chapter.

[S] C. L. Siegel, *Lectures on the Geometry of Numbers*, Lecture III, §4, Theorem 16. [DOI](https://doi.org/10.1007/978-3-662-08287-4). Already-planned GN.1 supplier; original proof not independently read.

## Corrections by the independent review

The independent review (REV-PAPER-COUVEIGNES-20, `research/blueprint/reviews/REV-PAPER-COUVEIGNES-20.md`) accepted this extraction and all four routes. It corrected two statuses in the JSON:

- `grid-nonvanishing` is in pinned Mathlib as `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`.
- `integer-gauge-lower-bound` is in pinned Mathlib as `NumberField.one_le_house_of_isIntegral`.

Both are now `library` and have left routes 3 and 4. The corrected file has 12 library, 2 planned and 35 missing items.
