# Arakelov geometry and heights of abelian varieties

## Status and purpose of this checkpoint

**Partial blueprint; no stage is closed.** This checkpoint develops the represented rank-one part of R35.1. It does not provide a complete decomposition of R35.1, still less a construction of Faltings height. R35.2–R35.6 have not been source-decomposed here.

Job: `BP-ArakelovGeometryAndAbelianHeights`, issue #674. AI-assisted author: ChatGPT Pro, session `cgpt-20260926-6de2`, 26 September 2026.

The packet has 22 nodes: five definitions, ten constructions, five lemmas and two theorems; 60 supporting API items; 45 proposed mathematical tests; and six display planets. Every implementation status is unchecked. The companion Lean file contains actual carriers and operations, together with explicit theorem obligations. It was **not compiled**. A proposed test is not a report that a theorem has been proved.

The point of starting at this level is that changes of generic coordinate, integral ideal norms and complex-place multiplicities have to agree before an arithmetic degree can be applied to a Hodge line. Defining a function called a height cannot supply the missing metric, integral model or comparison theorem.

## Standing conventions

Let K be a number field, R its full ring of integers, and d=[K:Q]. Infinite places v are indexed modulo complex conjugation. Write m(v)=1 for a real place and m(v)=2 for a complex place. Thus the sum of m(v) is d. The value v(a) is the ordinary absolute value of an associated complex embedding, **not its square**.

N(I) denotes the existing positive rational norm of a nonzero fractional ideal. We use a unit of the existing fractional-ideal ring to store I; this excludes the zero ideal by construction. The symbols 1 and R for the unit fractional ideal are interchangeable in the mathematical discussion.

A **presentation** is a pair L=(I,w), where w is a real function on infinite places. Its complex fiber has the displayed coordinate norm

$$\|z\|_{L,v}=\exp(w(v))|z|.$$

The metric scale is a norm scale, not a squared-norm scale. There is no factor m(v) inside this local norm. A real trace scalar product on the full product of archimedean completions is a different construction: its complex component has weight two. Keeping those two constructions separate is essential for the comparison with Schoof's Hermitian lattices.

The pair is a coordinate presentation, not a complete definition of every metrized invertible sheaf. A generic generator of an unframed rank-one module will supply a presentation, but proving the corresponding classification remains part of the frontier.

## What is reused from the pinned libraries

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`.

Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`.

The statement-level reads for this checkpoint were at the Mathlib pin, not merely searches of its current default branch:

| Existing module | Input actually consumed |
| --- | --- |
| `Mathlib/RingTheory/FractionalIdeal/Basic.lean` | The actual fractional-ideal carrier, its coercions and membership extensionality. |
| `Mathlib/RingTheory/FractionalIdeal/Norm.lean` | `FractionalIdeal.absNorm`, nonnegativity, its zero criterion, and `absNorm_span_singleton`. The norm already carries multiplicativity. |
| `Mathlib/RingTheory/ClassGroup/Basic.lean` | Root-level `toPrincipalIdeal` and `coe_toPrincipalIdeal`; `ClassGroup.mk` and `ClassGroup.equiv`. The ordinary class group is not reconstructed. |
| `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean` | `InfinitePlace`, its multiplicities, positivity, chosen-embedding norm comparison, `sum_mult_eq`, `prod_eq_abs_norm`, and rational/natural scalar evaluations. |
| `Mathlib/NumberTheory/NumberField/ProductFormula.lean` | The existing full product formula, with the infinite-place multiplicities and finite-place product. |

The packet records 19 baseline declarations. Standard real logarithm, exponential, finite-sum and quotient infrastructure is used in the implementation outline. There is no new product-formula target: taking logarithms of the existing archimedean norm formula is the arithmetic calculation needed here.

The Arakelov entries of `AUDIT-08.result.json`, the current six-stage atlas record, the campaign README and the accepted RS-06 ownership decisions were read. The existing JacobianChallenge and NumberFieldArithmetic roadmaps were consulted for the unmetrized Picard and number-field boundaries. The oversized integrated library-coverage file was not successfully read in full; no global absence claim is based on that failed read. The concrete pinned inputs above are the basis for this checkpoint.

## R35.1: construction and proof graph

Node identifiers below are the suffixes after `ArakelovGeometryAndAbelianHeights:R35.1/`. All nodes retain R35.1 as their parent; none replaces an atlas stage.

### Presentations and local norms

`hermitian-fractional-ideal` constructs the pair (I,w). Its API includes the two projections, the constructor and componentwise extensionality. `fiber-norm` gives the explicit norm above, with zero, positivity, complex homogeneity, triangle inequality and conjugation compatibility. The chosen-embedding formula is obtained from the pinned `norm_embedding_eq`.

`trivial-line` is (1,0). Its norm at every place is the ordinary complex norm. In particular, its norm of 1 is one at a complex place as well as at a real place.

Tests distinguish the same ideal with different scales, reject the zero ideal, and require a scale of two to give norm two rather than four or a square root. These are checks on the definition, not additional assumptions built into the object.

### Coordinate tensor product, dual and uniform twist

The three operations are

$$
(I,w)\otimes(J,t)=(IJ,w+t),\qquad
(I,w)^\vee=(I^{-1},-w),\qquad
\operatorname{twist}_c(I,w)=(I,w+c).
$$

These are `tensor-product`, `dual-line` and `metric-twist`. Associativity, commutativity, unit and inverse identities follow componentwise from existing ideal-unit group laws and real addition. The module-theoretic comparison identifying multiplication of invertible ideals with tensor products of rank-one projective modules is **not** assumed to have been constructed.

`tensor-norm` proves

$$\|zt\|_{L\otimes M,v}=\|z\|_{L,v}\|t\|_{M,v}.$$

Expand the definitions, use the exponential addition law and multiplicativity of the complex norm. Zero coordinates cause no exception. A dual has reciprocal scale, and the product of the norms at z and 1/z is one for nonzero z. A twist multiplies the norm by exp(c) while leaving the ideal unchanged.

The tests include principal-ideal multiplication, the unit object, reciprocal scale two, evaluation against the dual and the distinction between twisting a metric and scaling an ideal.

### Arithmetic and normalized degrees

`arithmetic-degree` defines

$$\widehat{\deg}(I,w)=-\log N(I)-\sum_{v\mid\infty}m(v)w(v).$$

Prove positivity of the existing fractional norm using its nonnegativity and zero criterion before invoking logarithm-of-product identities. A unit of the fractional-ideal ring cannot be zero. This is the unnormalized degree of Schoof's pair description.

`normalized-degree` defines

$$\deg_{\mathrm{abs}}(L)=\widehat{\deg}(L)/d.$$

It does not assert extension invariance. Positivity of d follows from the nontrivial finite-dimensional Q-vector space K.

The three calculation lemmas are `degree-tensor`, `degree-dual` and `degree-twist`:

$$
\widehat{\deg}(L\otimes M)=\widehat{\deg}(L)+\widehat{\deg}(M),\qquad
\widehat{\deg}(L^\vee)=-\widehat{\deg}(L),\qquad
\widehat{\deg}(\operatorname{twist}_c L)=\widehat{\deg}(L)-dc.
$$

For tensor additivity, apply the existing multiplicative ideal norm, the positive logarithm-of-product identity and distributivity of the finite sum. For duality, apply tensor additivity to L and its dual and use the trivial degree. For a twist, the ideal is unchanged and the new sum is the old sum plus c times the sum of the multiplicities; use the existing `sum_mult_eq`.

The rejection computations are particularly useful. Over Q, both (2Z,0) and (Z,log 2) have degree -log 2. Over an imaginary quadratic field, (R,log 2) has degree -2 log 2 and normalized degree -log 2. More generally (R,c) has normalized degree -c for every number field. This last identity is a same-formula computation over each field; it is not a proof of an ideal base-change theorem.

### Generic-coordinate changes: the integral map and the metric

For a in K units, `change-of-frame` defines

$$\operatorname{reframe}_a(I,w)=(aI,w-\log v(a)).$$

Use the existing `toPrincipalIdeal` to construct aI. The scalar is not required to lie in R. On generic coordinates the map is x to ax; on the complex fiber it is multiplication by the chosen embedding of a.

`frame-norm` proves

$$\|v.\operatorname{embedding}(a)z\|_{\operatorname{reframe}_a L,v}=\|z\|_{L,v}.$$

The proof expands the definitions and cancels v(a), which is positive. It uses the pinned embedding comparison and the usual exponential/logarithm identities. It applies to all complex z, including zero.

`frame-linear-equivalence` constructs the actual R-linear equivalence I to aI. Membership in aI must first be identified with being a times a member of I, by expanding the principal ideal and collecting finite sums. Multiplication by a inverse gives the inverse map. This is an isomorphism between actual submodules, not an abstract assertion that such an isomorphism exists. Identity comparisons are stated on underlying coordinates or after the explicit codomain transport.

Schoof's principal divisor (a) has pair (a inverse R, |a|). Therefore this particular coordinate change is **D-(a)**, not D+(a). For Q and a=2, the trivial presentation becomes (2Z,-log 2); the image of 1 has coordinate 2 but still norm one. The nonintegral scalar 1/2 must also be admitted. Using +log 2 instead would give degree -2 log 2, exposing the wrong sign.

### Degree invariance and degree-zero normalization

`degree-frame-invariance` proves invariance under the above coordinate change. The complete cancellation is

$$
N(aI)=|N_{K/\mathbb Q}(a)|N(I),\qquad
\log|N_{K/\mathbb Q}(a)|=\sum_v m(v)\log v(a),
$$

and hence

$$
-\log N(aI)-\sum_v m(v)(w(v)-\log v(a))
=-\log N(I)-\sum_v m(v)w(v).
$$

The first identity uses `coe_toPrincipalIdeal`, `absNorm_span_singleton` and multiplicativity. The second is the logarithm of the existing `InfinitePlace.prod_eq_abs_norm`; all factors are positive. The proof must work for fractional coordinate changes as well as integral ones.

`degree-zero-normalization` constructs

$$\operatorname{normalize}(L)=\operatorname{twist}_{\widehat{\deg}(L)/d}(L).$$

The twist parameter has a **plus** sign, since increasing the norm decreases the degree. Apply `degree-twist` to prove zero degree. Degree-zero input is fixed, so normalization is idempotent. The ideal stays unchanged. Starting from (I,0), the new logarithmic scale is -log N(I)/d, or positive scale N(I)^(-1/d). This is not ideal reduction, and no canonical representative of a quotient class is claimed.

### The quotient and the ordinary ideal-class comparison

`frame-setoid` sets L~M exactly when there is a in K units with reframe_a L=M. Reflexivity uses 1, symmetry uses the inverse witness and transitivity multiplies witnesses. Each witness gives the actual isometry constructed above. The relation includes both the ideal equation and every metric equation. It is not defined by equality of degrees.

`hermitian-ideal-class` is the quotient by this setoid, with `classOf`, representative induction and the exact equality criterion. It is presently a quotient of coordinate presentations. The equivalence with all unframed metrized invertible modules or sheaves is not part of the completed source decomposition.

`class-degree` lifts the actual arithmetic degree. Eliminate a relation witness and apply degree invariance; quotient induction gives uniqueness of the lift. `forget-metric` lifts the existing `ClassGroup.mk K`, using `ClassGroup.equiv` to check that multiplying by a principal ideal leaves its ordinary class unchanged. The ordinary class group is not redefined here.

Finally, `metric-distinction` proves

$$[\operatorname{twist}_c 1_H]=[\operatorname{twist}_e 1_H]\quad\Longleftrightarrow\quad c=e.$$

Apply the descended degree to obtain -dc=-de and cancel d>0. Conversely substitute equal parameters. Taking c=0 and e=1 gives distinct Hermitian classes with the same ordinary ideal class, so forgetting the metric is not injective. This remains true over Q. A proposed definition that erased metrics merely because the ordinary class number is one would fail this test.

## Display and test accounting

The six planets in R35.1 are Hermitian fractional ideals, Tensor products, Arithmetic degree, Change of frame, Degree invariance and Metric distinction. Supporting lemmas and quotient mechanics remain dependency nodes rather than crowding the display with a planet for every identity.

Every definition or construction has at least three mathematical tests in the packet, with corresponding proposed examples in the Lean file: 45 in total. They include degenerate cases, explicit scalar computations, compatibility tests and wrong-definition rejection cases. Some elementary examples recur for a constructor and its consumer; they are not 45 independent proofs of the same global theorem. The imaginary-quadratic Lean examples are expressed using one infinite place of multiplicity two, not an already compiled concrete Q(i) development.

An independent Python preflight checked the local design's required fields, counts, six-stage coverage, source issue records, declared baseline references, internal prerequisite resolution and acyclicity. A numerical calculation suite executed 281 assertions for degree twists, duals, tensor products, coordinate changes and degree-zero normalization, plus the stated complex-place counterexamples. These are scalar/model checks, not proofs about number fields. The full repository validator and the pinned declaration index were not run locally, and Lean was not available locally; CI and independent review are still required.

## Source issues requiring review

The packet's four `sourceIssues` records distinguish the version read, quotation, correction, argument, search for existing corrections and effect. They do not contain a self-review verdict.

**E1 — already corrected in publication.** The arXiv v1 Definition 2.3 has a negative divisor coefficient where the published p.451 has the positive coefficient (log N(I))/d. With I=product p^(-n_p), the finite degree is -log N(I), so the coefficient must be positive to normalize the divisor degree. In metric coordinates the scale is N(I)^(-1/d). This packet uses the published correction; this is not presented as a new discovery.

**E2 — equality condition in Proposition 3.1, p.452.** The printed equality condition requires u itself to be in the diagonal real subalgebra. For F=Q(i), u=i gives equality in the displayed inequalities while u is not real. The arithmetic–geometric mean equality condition is that all absolute values |u_sigma| agree, equivalently u conjugate(u) is diagonal nonnegative real. The inequalities themselves are not refuted by this example.

**E3 — coordinate witness sign in Proposition 4.3, p.454.** From I'=gI and u'=u/|g| the proof's named witness yields D'=D-(g), or D'=D+(g inverse), rather than D'=D+(g). This is a repair of the witness sign, not a refutation of the classification theorem.

**E4 — reconstruction coefficient in Proposition 4.3, p.454.** With the trace scalar product fixed in Section 3, reconstruct the positive scale by

$$u_\sigma=\sqrt{\langle\!\langle e_\sigma,e_\sigma\rangle\!\rangle/\deg(\sigma)}.$$

For F=Q(i), the canonical trace squared norm of the idempotent 1 is two. Without the denominator the reconstructed scale is sqrt 2 and the new scalar product is twice the old one. With the denominator it is one. This is precisely the normalization that the unframed comparison must check.

For E2–E4, no corresponding correction was found in the author-linked errata at the recorded blob, the compared preprint/published versions or the correction searches. That is not a proof of novelty or an independent confirmation. The author's p.453/p.454 errata clarify the module formulation and the embedding of a rank-one projective module into its generic fiber; those corrections must also be respected. No broader failure of the chapter's results is claimed here.

## Coverage and the exact unfinished work

| Stage | Coverage in this checkpoint | Required continuation |
| --- | --- | --- |
| R35.1 Hermitian bundles and arithmetic degree | Partial | Unframed rank-one comparison; general Hermitian finite-projective modules; determinant metrics and exact sequences; section/index and finite-extension formulas; relevant intersection/height-normalization comparisons. |
| R35.2 Hodge bundle and Faltings metric | Not source-decomposed | Construct the metric on the actual invariant differential determinant; integration, positivity and period constants; product and dual comparisons. |
| R35.3 Stable Faltings height | Not source-decomposed | Semistable differential-lattice base change; model/extension independence; bad-place corrections. |
| R35.4 Isogeny variation | Not source-decomposed | Integral differential cokernel and isogeny degree formula, including primes dividing the degree. |
| R35.5 Moduli/theta-height comparison | Not source-decomposed | Boundary metric growth, compactification comparison, good-base and exceptional-place estimates, exact two-sided bounds. |
| R35.6 Inputs to finiteness | Not source-decomposed | Product/polarization and constant-dependence exports, without assuming downstream isogeny-class boundedness. |

The six explicit gaps in the packet are part of its mathematical scope, not optional enhancements. In particular, the finite-section formula needs the actual finite quotient I/Rs and its cardinality |Norm(s)|/N(I). Finite extension needs both the ideal-norm extension theorem and the weighted count of places over v; simply dividing by d proves neither.

## Ownership boundaries from accepted RS-06

Use the actual unmetrized differential/Hodge objects supplied by `AbelianSchemesAndArithmeticModuli:A6`, `PELModuli:M6` and `NeronModelsAndSemistableAbelianVarieties:R11.1`; this roadmap owns the metric and arithmetic comparisons. A semiabelian model need not be proper, so do not replace the invariant differential determinant by a pushforward of top forms without proving the hypotheses and comparison.

General projective heights and Northcott belong to the scoped ArithmeticHeights supplier. That proposal is not a registered atlas stage, and this packet invents no id for it. Reconcile the exact normalization against its actual version. Check the GZ.2 arithmetic-surface intersection boundary before decomposing only the intersection results required by the height comparison.

R35.5 does not rebuild moduli or compactifications. It must still prove its own metric degeneration and integral correction bounds. R35.6 exports inputs to R28; it must not assume R28's arithmetic boundedness in an isogeny class to establish those inputs. The mere existence of a projective embedding and Northcott does not prove a Faltings/moduli-height comparison.

No constructed node in this checkpoint needs a whole external stage: its prerequisites resolve to the explicit rank-one graph and the pinned baseline. Consequently there are no fabricated supplier requests for constructions not yet decomposed.

## Sources actually inspected

1. René Schoof, [Computing Arakelov class groups](https://library.slmath.org/books/Book44/files/14schoof.pdf), Algorithmic Number Theory, MSRI Publications 44 (2008), pp.447–495. Inspected Sections 2–4 through Proposition 4.3 and its proof, including page images pp.451–454. The chapter after that point is not source-decomposed here.
2. Schoof, [arXiv:0801.3835v1](https://arxiv.org/pdf/0801.3835v1), submitted 24 January 2008. Compared the corresponding definitions and proofs against publication. The version identifier, not a potentially regenerated title-page date, identifies the copy.
3. Schoof's [author-linked errata](https://github.com/reneschoof/reneschoof.github.io/blob/main/arakeloverrata.txt), entire file, inspected 26 September 2026; blob `f346d7e1e5080ea2b8c21cb433b9c78515dfc7fe`. The file is undated.

Faltings and Faltings–Chai remain essential sources for the higher stages, but they are not listed as proof sources for nodes that were not read at decomposition depth. Their metric, semistable and comparison arguments must be extracted before extending this packet. Start the next mathematical continuation with the unframed rank-one comparison, including the E4 coefficient and the author's generic-fiber correction, rather than pretending the present quotient already solves it.
