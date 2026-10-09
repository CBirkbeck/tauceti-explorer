# Deligne weights, purity and the Weil bounds, Part II: Arithmetic cohomology and eigenform applications

This roadmap connects weight theorems to the arithmetic representations that occur in good reduction, modular forms and local comparison theorems. It builds the comparisons that identify Frobenius on a representation with Frobenius on a geometric fibre, checks the coefficient and Tate-twist conventions, and applies the resulting weights to traces and Hecke eigensummands. The first prerequisite is **DeligneWeightsAndPurity**. Its Weil-number theory, independent curve and abelian Weil bounds, sheaf and complex weight theory, and absolute hard Lefschetz are imported at the individual layers that need them.

The arithmetic comparisons are substantial targets in their own right. A cohomology group does not become a representation with the desired local polynomial merely by being given the same dimension. A projector must come from the specified correspondence and commute with the arithmetic action. Likewise, continuity of a representation gives neither algebraicity of Frobenius eigenvalues nor a Weil bound. The roadmap makes these distinctions usable in a library, with positive examples, counterexamples and normalization tests.

The six layers are:

| Layer | Mathematical purpose | Main output |
| --- | --- | --- |
| R34.1 | Frobenius and representation weight conventions | Pure, integral and chosen-embedding predicates; operations and sheaf comparisons |
| R34.2 | Good reduction of curves and abelian varieties | Tate/H¹ variance, integral cohomological polynomials and all-extension trace formulas |
| R34.3 | Arithmetic traits and specified degeneration models | Specialization, nodal comparisons, Picard–Lefschetz normalization and Saito's model |
| R34.4 | Finite-field pencil comparisons | Descent of pencil data and the original-coefficient monodromy hypotheses |
| R34.5 | Arithmetic cohomology with projectors | Parabolic purity, classical and Hilbert degree comparisons, weight two and hard Lefschetz |
| R34.6 | Eigenform applications | Ramanujan bounds, fixed-form good-prime polynomials and the restricted Hilbert local export |

The early route through the numerical part of R34.1 and R34.2 uses only DeligneWeightsAndPurity DWP.0–1. It supplies FaltingsFinitenessAndIsogenyTheorems R28.4 and the good-reduction input to MordellLawrenceVenkatesh LV.1. It does not require the later sheaf or complex suffix of R34.1, general Weil II, decomposition, or the local monodromy results. The trait and semistable-curve route is also distinguished from the late invariant-cycle route. These separations keep the arithmetic inputs independent of the theorems that consume them.

## Scope, prerequisites and conventions

### Boundaries with neighbouring roadmaps

DeligneWeightsAndPurity owns the general theory of Weil numbers, weights, cohomological bounds and weight transport. LefschetzPencilsAndVanishingCycles owns nearby and vanishing cycles, pencil geometry, the vanishing quotient, geometric monodromy, and the early semistable-curve/SNC comparisons. EtaleDualityAndPerverseSheaves owns cup products, trace pairings, Chern and cycle classes, weak Lefschetz and blowup comparisons. R34.1–4 instantiate those interfaces on arithmetic representations, fields and models; they do not construct a second version of them.

ArithmeticGaloisRepresentations R01.1–2 supplies continuous representations, their operations, decomposition and inertia groups, arithmetic Frobenius classes, tame characters and the arithmetic Weil–Deligne carrier. R01.6 supplies the Tate module functor and specialization of torsion. AbelianSchemesAndArithmeticModuli A4 supplies the Tate/cohomology comparison, and A6 supplies endomorphism characteristic polynomials. NeronModelsAndSemistableAbelianVarieties R11.5 supplies Néron–Ogg–Shafarevich. The finite-field Weil bound comes from DWP.1; the genus-one comparison agrees with Tau Ceti's EllipticCurves, Layer 3, rather than providing a second proof of Hasse's theorem.

ModularCurvesPartII R13.5 and HilbertModularVarietiesAndShimuraCurves R18.2 supply the actual bad-fibre models for R34.3. R13.6 consumes the degeneration comparison and is not its model-construction prerequisite. CohomologyComparisons CP.4 supplies the geometric semistable-period comparison. R34.3 verifies that comparison's hypotheses on the model and exports to PadicHodgeTheory R06.5; R06.5 is not an input to that verification.

For eigenforms, AutomorphicGaloisRepresentations R19.1 owns the parabolic premotive, the Scholl projector, and the newform projector with coefficient descent. Classical compactification and good-prime model data come from ModularCurvesPartII R14.3 and GeneralizedHeegnerCycles GH.0. R14.5 supplies the weight-two modular abelian quotient. The Hilbert geometry and projector belong to R18.2. R34.5–6 check their arithmetic realizations and apply weights. The geometric Eichler-congruence polynomial used as input must be supplied independently of the purity theorem here.

PotentialModularityAndCompatibleSystems R24.5 owns generic compatible-system carriers, predicates and operations. The fixed-form good-prime polynomial theorem here supplies one of their inputs; it does not construct all their local or Hodge-theoretic data. AutomorphicGaloisRepresentations R19.3 consumes the fixed-source exports. PadicHodgeTheory R06.6 owns the source-qualified Hilbert modular compatibility theorem at the residue characteristic, including its crystalline coefficient arguments. R34.6 uses that theorem in its stated range and translates its normalization.

### Frobenius, characteristic polynomials and weights

Let \(K\) be a number field, \(G_K=\operatorname{Gal}(\overline K/K)\), and \(v\) a finite place with residue field of cardinality \(q_v>1\). Fix a place of \(\overline K\) above \(v\) when naming decomposition and inertia groups. Arithmetic Frobenius acts on the residue algebraic closure by \(x\mapsto x^{q_v}\). **Geometric Frobenius is its inverse**, and all weights below use geometric Frobenius. Replacing it by arithmetic Frobenius negates the weights. This choice follows [Deligne I, (1.15), p. 279][WI].

For a finite-dimensional continuous \(E\)-representation \(\rho\), unramified at \(v\), write

\[
 P_v(\rho;X)=\det(X-\rho(F_v^{\mathrm{geom}})).
\]

This is a monic characteristic polynomial, with roots the Frobenius eigenvalues, counted with multiplicity. An Euler factor instead has the form

\[
 L_v(\rho;T)^{-1}=\det(1-\rho(F_v^{\mathrm{geom}})T)
   =T^{\dim\rho}P_v(\rho;T^{-1}).
\]

The two polynomials must be distinguished in source comparisons. In particular, restoring a cohomological degree or using the symbol \(P\) from a source does not settle whether the polynomial is written in characteristic or reciprocal form.

The Tate representation \(\mathbf Q_\ell(1)\) has geometric eigenvalue \(q_v^{-1}\) and weight \(-2\). A twist by \((n)\) changes weight by \(-2n\), a dual negates weight, and tensor products add weights. On a curve, \(H^1\) and the covariant Tate module are dual representations: the former has geometric weight \(1\), the latter \(-1\).

Four arithmetic properties have separate interfaces:

* algebraicity of every eigenvalue over \(\mathbf Q\);
* algebraic integrality of every eigenvalue over \(\mathbf Z\);
* descent of the whole monic characteristic polynomial to \(\mathbf Z[X]\);
* equality of the absolute values of all complex conjugates to \(q_v^{w/2}\).

Algebraic-integral roots give coefficients integral over \(\mathbf Z\) in a coefficient number field. They need not give rational coefficients. A monic factor of a polynomial in \(\mathbf Z[X]\) lies in \(\mathbf Z[X]\) if that factor is in \(\mathbf Q[X]\); a factor in a larger coefficient field does not satisfy that conclusion. This distinction matters for Hecke eigensummands and is tested explicitly below.

For a smooth variety of pure dimension \(d\), the dualizing complex is \(\mathbf Q_\ell(d)[2d]\). A pure lisse sheaf of punctual weight \(r\), viewed as a complex in degree zero, has complex weight \(r\). Its shift and twist \(\mathcal F[a](b)\) have complex weight \(r+a-2b\). Complex purity is defined using Verdier duality, as in DWP.8; a statement about arbitrary singular supports cannot be inferred just from this smooth lisse formula.

### Library vocabulary

The numerical interface uses Mathlib's `Representation`, `Representation.dual`, `Representation.ofDistribMulAction`, `LinearMap.charpoly` and `Matrix.charpoly`. A `Representation` is a monoid homomorphism into linear endomorphisms. Continuity and actual arithmetic local data are additional inputs from R01.1–2. The contragredient dual acts by the transpose of the inverse action. `LinearMap.charpoly` supplies the characteristic polynomial for a finite free module; `Matrix.charpoly` is \(\det(XI-M)\) on a finite index type over a commutative ring.

Mathlib's `IsArithFrobAt` is an algebraic Frobenius predicate for an action on a ring: modulo an ideal \(Q\), the action is the power given by the cardinality of the residue quotient of the base ring. It is not itself the construction of the decomposition group of a number-field place. Its lemmas provide useful algebraic inputs to R01.2:

* `IsArithFrobAt.mul_inv_mem_inertia` places the quotient of two arithmetic Frobenius lifts in the ideal's inertia group.
* `IsArithFrobAt.conj` transports a Frobenius lift to the conjugate ideal.
* `IsArithFrobAt.exists_of_isInvariant` gives a lift for a prime ideal when the acting group is finite, the base algebra is invariant, and the residue quotient is finite.

Use these statements with their actual algebra and action hypotheses. The arithmetic adapters below add the continuous Galois representation, the place and its local groups; supplied group elements alone do not establish an arithmetic realization.

## R34.1 — Frobenius, algebraicity and representation weights

The numerical portion of this layer gives the local-polynomial and weight API needed by the early arithmetic applications. Its two geometric comparisons have their own additional prerequisites: sheaf weights use DWP.5 and the integral-sheaf interface of DWP.7; complex normalization uses DWP.8 and smooth duality. A user of numerical representation weights need not acquire these suffixes.

### Frobenius polynomials of Galois representations

Let \(E\) be a characteristic-zero coefficient field with the topology used for the continuous representation \(\rho:G_K\to\operatorname{GL}_E(V)\), where \(V\) is finite-dimensional. For a finite place \(v\) at which inertia acts trivially, construct \(P_v(\rho;X)\) with geometric Frobenius. The weight applications take \(E\) finite over \(\mathbf Q_\ell\); the polynomial construction and its algebraic API use only the field and finite-dimensional representation. Prove independence of the lift modulo inertia and independence of the chosen place above \(v\), the latter through conjugation. Changing the decomposition group changes an operator by conjugation and hence does not change its polynomial. At a ramified place, an arbitrary lift does not give this invariant.

The planned namespace is `TauCeti.Weights.GaloisRep`. Its local-polynomial API is:

| Name | Required interface |
| --- | --- |
| `frobCharpoly` | The monic polynomial of the action of a supplied geometric lift, specialized to actual unramified place data |
| `frobCharpoly_arith` | The arithmetic-Frobenius polynomial of \(\rho\) equals the geometric-Frobenius polynomial of \(\rho^\vee\) |
| `frobCharpoly_roots_inv` | Over an algebraically closed coefficient field, the root multiset at the inverse lift is the inverse of the original root multiset |
| `frobCharpoly_conj` | Conjugate lifts have equal polynomials |
| `frobCharpoly_inertia` | Multiplying a lift by an inertia element preserves the polynomial when inertia acts trivially |
| `frobCharpoly_equiv` | A coefficient-linear representation equivalence intertwining every group element preserves the polynomial |

The inverse-root statement uses the invertibility of a group action, so no root is zero. All root equalities retain multiplicity. The arithmetic/geometric identity follows from contragredience, not from treating the same action as both a representation and its dual. For inertia independence, require the whole inertia subgroup to act as the identity, rather than requiring just the one multiplier to do so.

Four tests, with names in `TauCeti.Weights`, specify the convention and the failure mode:

* `frobCharpoly_cyclotomic`: at residue cardinality \(3\), the geometric polynomial of \(\mathbf Q_\ell(1)\) is \(X-1/3\).
* `frobCharpoly_trivial`: a trivial representation of rank \(d\) has polynomial \((X-1)^d\).
* `not_unramified_scalar_inertia`: the scalar representation of \(\mathbf C^\times\) on \(\mathbf C\), with the full group as supplied inertia, fails triviality on inertia; changing the supplied lift from \(3\) to \(2\cdot3\) changes the polynomial.
* `frobCharpoly_arith_elliptic`: inversion of a rank-two operator with polynomial \(X^2-aX+q\), \(q\ne0\), gives \(X^2-(a/q)X+1/q\). The inverse companion matrix supplies a direct computation.

The scalar and matrix tests check the numerical core, not the existence of a number-field representation with those supplied local data. Sources are [Deligne I, (1.15), p. 279][WI], and [Deligne II, (1.1.13), p. 152][WII]. Prerequisites are ArithmeticGaloisRepresentations `R01.1/continuous-representation`, `restriction-dual-tensor-twist`, `finite-coefficients-and-finite-quotients`, `compact-subgroups-stabilise-lattices`, and `R01.2/decomposition-group-at-a-place`, `frobenius-characteristic-polynomial`; DWP.0 `spectra-of-tensor-products-and-duals`; and the Mathlib interfaces above. These dependencies include the passage from finite-level Frobenius to the continuous representation.

### Pure and integral representations outside a finite set

For a finite extension \(E/\mathbf Q_\ell\) and a finite-dimensional continuous \(E\)-representation, let \(T\) be a finite set of finite places and \(w\in\mathbf Z\). Define **pure of weight \(w\) outside \(T\)** to mean that, for every \(v\notin T\), the representation is unramified at \(v\), every root of \(P_v\) is algebraic over \(\mathbf Q\), and every complex embedding of the field generated by that root gives absolute value \(q_v^{w/2}\). This uses DWP.0's Weil-number and endomorphism-weight definitions rather than a second numerical weight theory.

Define **integral Frobenius polynomials outside \(T\)** separately: for every \(v\notin T\), require unramifiedness and require \(P_v\) to be the coefficient-field image of a polynomial in \(\mathbf Z[X]\). The characteristic polynomial is already monic, so its integer preimage is monic. An integral representation in this sense has algebraic-integral eigenvalues. The converse needs rationality of the polynomial as an additional hypothesis.

For an isomorphism \(\iota:\overline{\mathbf Q}_\ell\simeq\mathbf C\) and a real number \(r\), define **\(\iota\)-pure of weight \(r\) outside \(T\)** by unramifiedness and the norm condition for roots under this chosen embedding. This predicate makes no algebraicity assertion. The numerical Lean forms use an algebraically closed characteristic-zero coefficient field containing \(\mathbf Q\), supplied inertia/Frobenius/cardinality functions, and a ring embedding to \(\mathbf C\); the arithmetic form supplies the actual continuous representation and place data.

The predicate API, also in `TauCeti.Weights.GaloisRep`, is:

| Name | Meaning and hypotheses |
| --- | --- |
| `IsPureOutside` | Unramified outside \(T\), with algebraic roots and the all-embeddings weight condition |
| `HasIntegralFrobOutside` | Unramified outside \(T\), with each polynomial descending to \(\mathbf Z[X]\) |
| `IsIotaPureOutside` | Unramified outside \(T\), with the chosen-embedding norm condition at real weight |
| `isPureOutside_iff` | Expand purity into local unramifiedness, algebraicity and norms |
| `hasIntegralFrobOutside_iff` | Expand integrality into local unramifiedness and an integer polynomial preimage |
| `isIotaPureOutside_iff` | Expand the chosen-embedding condition without adding algebraicity |
| `IsPureOutside.mono` | Enlarge the exceptional set: \(T\subseteq T'\) preserves purity at the same weight |
| `HasIntegralFrobOutside.mono` | Enlarge the exceptional set for the integer-polynomial predicate |
| `IsIotaPureOutside.mono` | Enlarge the exceptional set for the same embedding and real weight |
| `IsPureOutside.iota` | All-embeddings purity implies the chosen-embedding predicate at the corresponding real weight |
| `IsPureOutside.weight_unique` | Equal weights follow for a nonzero representation and a place outside \(T\) with \(q_v>1\), using a complex embedding |

The rank-zero case is intentionally excluded from uniqueness. Its root set is empty, so it is pure of every weight and has characteristic polynomial \(1\). Nor does uniqueness hold merely from a vacuous condition on an exceptional set containing every supplied place. The prototype records a place outside the set, positive rank and cardinality greater than one explicitly.

Five further tests, in `TauCeti.Weights`, determine the intended predicate:

* `isPureOutside_tate`: \(\mathbf Q_\ell(n)\) has geometric weight \(-2n\). At an unramified place its polynomial is \(X-q_v^{-n}\).
* `isPureOutside_trivial`: the trivial representation is pure of weight zero and has integer Frobenius polynomials.
* `not_integral_tate_one`: \(\mathbf Q_\ell(1)\) is pure of weight \(-2\), while \(X-q_v^{-1}\notin\mathbf Z[X]\) for \(q_v>1\).
* `not_isPureOutside_sum`: the direct sum \(\mathbf Q_\ell\oplus\mathbf Q_\ell(1)\) is not pure of any single integer weight at a place with \(q_v>1\).
* `isPureOutside_zero`: a rank-zero representation is pure at every weight, has polynomial \(1\), and satisfies the integer-polynomial predicate.

At places away from \(\ell\), the Tate character tests apply with trivial inertia. For a nonzero Tate twist, the arithmetic exceptional set contains the places above \(\ell\). Such places can occur outside a general representation's exceptional set only when the representation is actually unramified there. Tate polynomials are integral for nonpositive twists; positive twists display the denominator obstruction.

The arithmetic definition follows [Lawrence–Venkatesh, §2.3 and Lemma 2.3, p. 9][LV], with the convention distinguished above. Prerequisites are the preceding Frobenius construction and DWP.0 `endomorphism-weights`, `weil-q-number`, `iota-weight`. Mathlib's `Representation.ofDistribMulAction` supplies the scalar numerical tests. The basic chosen-embedding language is [Deligne II, (1.2.6), p. 154][WII].

### Linear algebra operations and rational integrality

For representations unramified outside the stated exceptional set, prove that a subrepresentation and a quotient of a pure representation remain pure of the same weight. For a short exact sequence, purity of the middle term implies purity of both ends. Conversely, if all three representations are unramified outside \(T\) and both ends are pure of the same weight \(w\), the middle is pure of weight \(w\). Unramified endpoints alone do not make an extension unramified: the middle term's local hypothesis must be supplied.

Direct sums of equal-weight representations have that weight. The dual of weight \(w\) has weight \(-w\), a tensor product of weights \(w,w'\) has weight \(w+w'\), and the determinant of a rank-\(d\) representation of weight \(w\) has weight \(dw\). Twisting by \(\mathbf Q_\ell(n)\) changes the weight to \(w-2n\), after adjoining the places above \(\ell\) to the exceptional set when required. Exterior and symmetric powers use the corresponding imported spectral operations. Retain multiplicity and the zero-rank conventions when deriving these statements.

The integer-polynomial statements form a separate family. They are preserved by direct sums, tensor products, determinants and nonpositive Tate twists. For subquotients, the characteristic-polynomial factor must be monic and rational before the integer-coefficient factor lemma applies. Arbitrary coefficient-field summands preserve algebraic-integral roots but can lose rational coefficients. Duality and positive Tate twists can introduce denominators, so they do not preserve the integer-polynomial predicate in general.

As a nonexample, take the diagonal operator with eigenvalues \(\sqrt2\) and \(-\sqrt2\). Its full polynomial is \(X^2-2\in\mathbf Z[X]\), while either invariant line has polynomial \(X\mp\sqrt2\), which is not rational. The `integer_charpoly_factor_nonexample` suggestion records this factorization. Together with the Tate-one test, it prevents a false integrality API for arbitrary summands and duals.

For an elliptic curve at a good place, \(H^1\otimes H^1\) has weight two and integer Frobenius polynomials, while its dual has weight minus two and has a noninteger constant coefficient. Its determinant test is \(\det H^1=\mathbf Q_\ell(-1)\), of weight two. These geometric examples supplement the scalar and factorization tests.

Sources are [Deligne II, (1.2.5)(ii), p. 154][WII], and [Lawrence–Venkatesh, §2.5, p. 13][LV]. Prerequisites are the predicates above and DWP.0 `purity-under-subquotients-and-extensions`, `spectra-of-tensor-products-and-duals`, `twisting-by-rank-one-characters`, `weil-number-arithmetic`. This target applies those numerical theorems to the arithmetic exceptional-set conditions; it does not reprove them.

### Restriction and induction along a finite extension

Let \(L/K\) be finite. If \(\rho\) is pure of weight \(w\) outside \(T\), its restriction to \(G_L\) is pure of weight \(w\) outside the places over \(T\). For a place \(u\mid v\) of residue degree \(f=f(u/v)\), the local comparison is

\[
 \rho(F_u^{\mathrm{geom}})=\rho((F_v^{\mathrm{geom}})^f),
 \qquad q_u=q_v^f,
\]

where the Frobenius equality is first an equality modulo inertia and then an equality of actions because the original representation is unramified. Taking powers preserves the weight relative to the enlarged residue cardinality. It preserves integer Frobenius polynomials as well, by the symmetric polynomial expressions in powers of roots.

For a representation \(\tau\) of \(G_L\), define continuous induction using R01.1. At a place \(v\) unramified in \(L\), and with \(\tau\) unramified at all \(u\mid v\), prove

\[
 P_v(\operatorname{Ind}_{G_L}^{G_K}\tau;X)
   =\prod_{u\mid v}P_u(\tau;X^{f(u/v)}).
\]

The cyclic-block determinant from R01.2 is the local input. If \(\tau\) has weight \(w\), an \(f\)-th root of an eigenvalue of norm \((q_v^f)^{w/2}\) has norm \(q_v^{w/2}\), at every embedding. The induced representation therefore has the same weight after excluding the places under \(T\) and the places ramified in \(L/K\). Integer polynomials are preserved by the displayed product. A ramified extension cannot be inserted into this unramified formula without an additional local theorem.

For \(\mathbf Q(i)/\mathbf Q\), induction of the trivial character is \(1\oplus\chi_{-4}\), pure of weight zero outside \(\{2\}\). At an inert prime \(p\equiv3\pmod4\), its polynomial is \(X^2-1\). The roots are \(\pm1\), demonstrating both the cyclic block and preservation of weight zero; the suggestion `charpoly_induced_inert_trivial` computes its two-by-two matrix.

Sources are [Deligne II, (1.2.5)(i), p. 154][WII], and [Lawrence–Venkatesh, §2.5, proof of Lemma 2.10, p. 14][LV]. Prerequisites are R34.1's predicates; DWP.0 `finite-field-base-extension-of-weights`, `weil-number-base-extension`; R01.1 `continuous-induction`; and R01.2 `decomposition-group-at-a-place`, `local-restriction`, `determinant-of-a-cyclic-block-endomorphism`.

### Continuous Frobenius eigenvalues need not be algebraic

For a finite field \(k=\mathbf F_q\), the Galois group is \(\widehat{\mathbf Z}\). Given any \(u\in\mathbf Z_\ell^\times\), construct its continuous one-dimensional \(\ell\)-adic representation whose geometric Frobenius acts by \(u\). Construct the homomorphism through the finite unit quotients and their compatible inverse limit. This does not require the whole unit group to be procyclic. The extension is determined by the image of the chosen topological generator. Compactness requires a unit; a representation of the Weil group alone can have any nonzero \(\overline{\mathbf Q}_\ell\)-eigenvalue.

There are transcendental elements of \(\mathbf Z_\ell^\times\), since that set is uncountable whereas the elements algebraic over \(\mathbf Q\) form a countable set. The resulting representation has finite dimension and is continuous, yet its Frobenius eigenvalue is not algebraic and it is not pure of any integer weight in the all-embeddings definition. For a chosen embedding, it still has a real \(\iota\)-weight \(2\log_q|\iota(u)|\).

An algebraic example separates finite dimension from integer-weight purity without a transcendental choice. For odd \(\ell\), take \(u=2\) and an odd prime \(q\ne\ell\). If this eigenvalue had integer weight \(w\), then \(4=q^w\), impossible for an odd prime and integer \(w\). Thus even algebraicity does not force integer-weight purity. The numerical suggestion `transcendental_not_pure` only records existence of a complex transcendental; the continuous finite-field character requires the actual R01.2 construction.

The rational unit \(u=1+\ell\) gives another test: its chosen-embedding weight is \(2\log_q(1+\ell)\), independent of the embedding, but an integer weight exists only when \(1+\ell\) is an integer power of \(\sqrt q\). The profinite-unit construction also covers \(\ell=2\).

Sources are [Deligne II, (1.2.3), (1.2.6)–(1.2.7), pp. 154–155][WII]. Prerequisites are the predicates, DWP.0 `iota-weight`, R01.1 `continuous-representation` and R01.2 `unramified-character-lambda`.

### Every embedding and a chosen embedding

For a representation over \(\overline{\mathbf Q}_\ell\), prove that all-embeddings purity at integer weight \(w\) is equivalent to \(\iota\)-purity at weight \(w\) for every field isomorphism \(\iota:\overline{\mathbf Q}_\ell\simeq\mathbf C\). The forward implication is immediate from the definition. The reverse implication uses the DWP.0 theorem that the norm constraint for every such isomorphism forces algebraicity; it must not silently assume the eigenvalues algebraic first. The construction and abundance of these isomorphisms use the cardinality and transcendence-basis argument in DWP.0 `embeddings-into-the-complex-numbers`.

For a common coefficient number field \(E\), an equivalent practical test is that every polynomial \(\sigma(P_v)\), for every \(\sigma:E\hookrightarrow\mathbf C\), has all its roots of the required norm. Roots are taken in an algebraic closure and with multiplicity. This is the form used for fixed-form coefficient descent in R34.6. If a polynomial is already rational, its full root set under one embedding contains every algebraic conjugate, so testing all of those roots suffices. Testing one eigenvalue under one embedding is a weaker assertion.

A chosen embedding can fail even at integer weight zero. Use

\[
 f(X)=X^4-X^3-X^2-X+1.
\]

It is irreducible over \(\mathbf Q\), as seen by reduction modulo \(2\). For a root \(\alpha\), put \(t=\alpha+\alpha^{-1}\); then \(t^2-t-3=0\). One real value of \(t\) lies in \((-2,2)\) and gives a pair on the unit circle. The other exceeds \(2\) and gives reciprocal positive real roots, one greater than \(1\). All roots are algebraic units, since the polynomial is monic with constant term \(1\). A root gives a continuous finite-field rank-one character in a finite \(\ell\)-adic coefficient extension. Choose the embedding carrying that root to the unit circle: the character is \(\iota\)-pure of weight zero, but fails the all-embeddings condition because another conjugate has norm greater than one.

The example is a finite-field character, not a claim of a global number-field character with prescribed purity at every place. The polynomial suggestion `chosen_embedding_integer_weight_nonexample` records irreducibility and the two norms; the arithmetic character and embedding choices are separate inputs. Sources are [Deligne II, (1.2.6), p. 154][WII]. Prerequisites are the preceding character construction and DWP.0 `weil-number-iff-iota-pure-for-every-iota`, `weil-q-number`, `embeddings-into-the-complex-numbers`.

As a positive coefficient-field test, the H¹ polynomial of an elliptic curve with complex multiplication by \(\mathbf Q(i)\) is rational. Testing its full root multiset over either embedding of that coefficient field gives the same all-conjugates assertion.

### Representation–sheaf comparison on an arithmetic model

Let \(U\) be a normal connected arithmetic model over \(\mathbf Z[1/\ell]\), with a specified generic geometric point, and let a continuous representation factor through its actual étale fundamental group. Under the lisse-adic sheaf/continuous fundamental-group representation equivalence, construct its corresponding sheaf \(\mathcal F\). At every relevant closed point, identify the action on the geometric stalk with the local Frobenius action on the representation. Hence identify the two characteristic polynomials and transport punctual purity and chosen-embedding purity.

The model and the fundamental-group factorization are part of the hypotheses. Unramifiedness outside a finite set is not by itself a proof of a lisse extension over an arbitrary model. Equality of the root multisets also identifies the algebraic-integral-eigenvalue condition on the representation with sheaf integrality in DWP.7's sense. If the representation polynomial descends to \(\mathbf Z[X]\), it satisfies that condition. The converse from sheaf integrality to an integer polynomial needs rationality.

At a closed point of degree \(d\), the comparison uses \(F^d\) and residue size \(q^d\). The weight remains \(w\) relative to that size. Check this identification on both arithmetic and geometric Frobenius before applying the base-extension theorem. Retain compatibility with coefficient extension and the chosen embedding. The sheaf predicates are exactly those of DWP.5, not new predicates specialized to this model.

Check the constant rank-one sheaf, of weight zero, and the Tate sheaf \(\mathbf Q_\ell(1)\), of weight minus two on its prime-to-\(\ell\) arithmetic model. At degree-\(d\) points the weights remain zero and minus two, respectively.

Sources are [Deligne II, (1.1.13), (1.2.2)–(1.2.3), pp. 152–154][WII]. Prerequisites are the R34.1 Frobenius and weight definitions; DWP.0 `finite-field-base-extension-of-weights`; DWP.5 `punctual-purity-and-mixedness`; DWP.7 `integral-sheaf`; and SchemeAndStackFoundations SF.2's lisse-adic equivalence. The exact SF.2 interface is stated under the supplier requirements below.

### Arithmetic normalization of complex weights

Let \(X_0/\mathbf F_q\) be smooth of pure dimension \(d\), and let \(K\) be a bounded constructible adic complex with lisse cohomology sheaves. Use the duality comparison

\[
 D_XK=R\mathcal Hom(K,\mathbf Q_\ell(d)[2d]).
\]

Prove the smooth-lisse specialization of DWP.8: \(K\) is pure of complex weight \(w\) if and only if \(\mathcal H^i(K)\) is punctually pure of weight \(w+i\) for every \(i\). For a lisse sheaf \(\mathcal F\) of weight \(r\), obtain

\[
 \mathrm{wt}(\mathcal F[a](b))=r+a-2b.
\]

In particular \(\mathcal F(d)[d]\) has weight \(r-d\), while \(\mathcal F(N)[2N]\) has the same weight as \(\mathcal F\). Upper complex weight bounds are cohomological upper bounds; lower bounds are defined by duality, and the identification with punctual lower bounds uses the smooth lisse hypotheses. Do not export that identification for arbitrary constructible complexes on singular supports.

On a smooth curve, the weight-zero constant sheaf shifted by \([1]\) has complex weight one; an additional twist \((1)\) gives weight minus one. This test fixes the sign of the cohomological shift independently of the Tate sign.

Sources are [Deligne II, (6.2.1)–(6.2.5)(b), p. 247][WII]. Prerequisites are DWP.8 `mixed-complexes`, `pure-complexes`, `twist-shift-and-smooth-lisse-purity-6-2-5`; EDC.2:trace-purity `smooth-purity`; EDC.2:pairings `cup-product-trace-pairing`, `galois-frobenius-equivariance`, `adic-and-rational-poincare-duality`; and the preceding arithmetic sheaf comparison. This target has no place on the early numerical route to Faltings.

## R34.2 — Curves, abelian varieties and good reduction

This layer turns the independent curve and abelian estimates of DWP.1 into statements about number-field representations. The required geometric comparisons are Tate/H¹ duality, exterior powers, specialization at good reduction, and the curve–Jacobian trace comparison. General Weil II and decomposition are not prerequisites of these targets.

### Frobenius on the Tate module and first cohomology

Let \(A/\mathbf F_q\) be an abelian variety of dimension \(g\), and let \(\ell\) be different from the residue characteristic. Its Frobenius endomorphism \(\pi_A\) acts on geometric torsion points by the same power map as arithmetic Frobenius. This equality on points identifies their actions on \(T_\ell A\); it does not identify the endomorphism of the variety with an automorphism of the coefficient field. Write \(P_{\pi_A}(X)\in\mathbf Z[X]\) for the degree-\(2g\) polynomial of the endomorphism, independent of \(\ell\).

The geometric Frobenius action on \(V_\ell A=T_\ell A\otimes\mathbf Q_\ell\) is \(\pi_A^{-1}\). The Galois-equivariant comparison

\[
 H^1_{\mathrm{et}}(A_{\overline{\mathbf F}_q},\mathbf Q_\ell)
   \simeq \operatorname{Hom}_{\mathbf Q_\ell}(V_\ell A,\mathbf Q_\ell)
\]

therefore gives the geometric action on \(H^1\) the polynomial \(P_{\pi_A}\). Import the all-conjugates Weil estimate for \(\pi_A\) from DWP.1. It gives geometric weight \(1\) on \(H^1\) and \(-1\) on \(V_\ell A\). This statement uses the contragredient action and the identification on torsion points, not an unspecified transpose.

For an elliptic curve, \(P_{\pi_A}=X^2-aX+q\), where \(a=q+1-\#A(\mathbf F_q)\). For example, \(y^2=x^3-x\) over \(\mathbf F_3\) has four points, so \(a=0\), the cohomological polynomial is \(X^2+3\), and its complex roots are \(\pm i\sqrt3\). The geometric Tate roots are their inverses. The suggested `tate_h1_inverse_dual` identity isolates precisely this variance convention.

Sources are [Milne, Chapter II, §1, Theorem 1.1 and its proof, pp. 75–76; Chapter I, Remark 12.5, p. 56][AV]. Prerequisites are R34.1's Frobenius and weight definitions; A6 `characteristic-polynomial-on-tate-module`; A4's equivariant H¹ comparison; R01.6 `tate-module-of-an-abelian-variety`, `functoriality-products-and-isogenies`; R01.2 `cyclotomic-and-dirichlet-characters`; DWP.0 `spectra-of-tensor-products-and-duals`; and DWP.1 `frobenius-endomorphism-over-a-finite-field`, `weil-estimate-for-abelian-varieties`. The A6 endomorphism-polynomial theorem alone does not supply A4's cohomology comparison.

### Purity and integral polynomials at good reduction

Let \(A/K\) have dimension \(g\), fix a coefficient prime \(p\), and let \(T\) contain the places of bad reduction and the places above \(p\). At each \(v\notin T\), require an actual abelian scheme over \(\mathcal O_v\) with generic fibre \(A\). Néron–Ogg–Shafarevich gives unramifiedness of \(V_pA\); smooth proper base change and Tate/H¹ duality give the Frobenius-equivariant cohomological specialization.

The resulting assertions are:

* \(H^1(A_{\overline K},\mathbf Q_p)\) is pure of weight \(1\) outside \(T\), and its geometric Frobenius polynomial is \(P_{\pi_{A_v}}\in\mathbf Z[X]\), independent of the coefficient prime different from the residue characteristic.
* \(V_pA\) is pure of weight \(-1\). If \(g>0\), it fails the integer-polynomial predicate at every such place: the constant coefficient of its geometric polynomial is \(q_v^{-g}\), which is not an integer.
* The equivariant cup-product isomorphism \(H^i\simeq\bigwedge^iH^1\) makes \(H^i\) pure of weight \(i\), with integer Frobenius polynomials. This includes the zero groups outside the cohomological range.
* \(\det H^1\simeq\mathbf Q_p(-g)\) has weight \(2g\). At \(g=0\), both degree-one representations have rank zero and polynomial \(1\); the nonintegrality assertion does not apply.

The integer polynomials of exterior powers come from the specified abelian reduction polynomial and its symmetric expressions, not merely from purity. Track the coefficient embeddings and specialization maps so the statement applies to the genuine arithmetic representation. The suggestions `positive_dimension_tate_constant` and `rank_zero_integral` check the strict dimension hypothesis and its boundary case.

For a smooth proper geometrically connected curve \(C/K\) with a smooth proper model at \(v\nmid p\), apply smooth proper base change **to the curve itself**. Then use the Jacobian of its smooth residue curve and the finite-field curve–Jacobian comparison to obtain purity of its geometric \(H^1\) of weight \(1\), and an integer polynomial. This route does not require a theorem asserting that the generic Jacobian has good reduction. The cohomological groups in degrees zero and two have weights zero and two. Singular reduction requires the degeneration layer instead.

These are the early inputs for FaltingsFinitenessAndIsogenyTheorems R28.4 and the good-reduction cohomology in MordellLawrenceVenkatesh LV.1. Semisimplicity and finiteness arguments belong to those consumers. Sources are [Lawrence–Venkatesh, equation (3.2), p. 16][LV]; [Milne, Chapter I, Theorem 12.1, p. 55, Remark 12.5, p. 56, Remark 17.2, p. 70; Chapter II, Corollary 1.5 and Remark 1.6(a), p. 78][AV]. Milne's \(P_r(t)\) in the latter passage is a reciprocal factor; convert it to the characteristic-polynomial convention used here.

For the curve \(y^2=x^3-x\) over \(\mathbf Q\), good reduction holds outside \(\{2\}\). At the place \(3\), with coefficient prime different from \(3\), the H¹ polynomial is \(X^2+3\) and the geometric Tate polynomial is \(X^2+1/3\). The top exterior-power test for a general \(A\) has polynomial \(X-q_v^g\).

Prerequisites are the preceding finite-field comparison, R34.1 `pure-and-integral-galois-representations` and `purity-under-linear-algebra-operations`; DWP.1 `weil-estimate-for-abelian-varieties`, `weights-of-the-cohomology-of-curves`; A6 `characteristic-polynomial-of-an-endomorphism`; A4's H¹/exterior-power comparisons; R11.5 `neron-ogg-shafarevich`; R01.6 `specialisation-of-torsion-at-good-reduction`; and SF.2 smooth proper base change. The needed A4 and SF.2 interfaces are specified below.

### Point counts and traces at good places

For the reduction \(A_v/\mathbf F_{q_v}\), let \(\alpha_1,\ldots,\alpha_{2g}\) be the roots of \(P_{\pi_{A_v}}\). Apply DWP.1's point-count theorem to obtain, for every \(m\ge1\),

\[
 \#A_v(\mathbf F_{q_v^m})=\prod_{j=1}^{2g}(1-\alpha_j^m).
\]

Its explicit estimate is

\[
 \left|\#A_v(\mathbf F_{q_v^m})-q_v^{mg}\right|
 \le 2g\,q_v^{m(g-1/2)}
   +(2^{2g}-2g-1)q_v^{m(g-1)}.
\]

At \(g=1\), identify \(a_v\) with the trace of geometric Frobenius on \(H^1\), and obtain \(|a_v|\le2\sqrt{q_v}\). Verify agreement with Tau Ceti's EllipticCurves Layer 3 Hasse theorem. The trace on the geometric Tate representation is instead \(a_v/q_v\), by the inverse-root formula. The statement is about the finite-field reduction and its arithmetic specialization, not about counting points of the generic variety over a local field.

Sources are [Milne, Chapter II, Theorem 1.1, pp. 75–76][AV]. Prerequisites are R34.2's good-reduction comparison and DWP.1 `point-counts-of-abelian-varieties`, `compatibility-with-the-hasse-bound`. The point-count proof and positivity input stay with DWP.1; this target identifies their arithmetic traces and retains the formula at every residue extension.

### Curve traces over every residue extension

Let \(C_v/\mathbf F_{q_v}\) be the smooth proper geometrically connected reduction of a genus-\(g\) curve. Let \(\alpha_1,\ldots,\alpha_{2g}\) be its geometric H¹ roots. The fixed-point trace formula, including its curve–Jacobian identification, gives

\[
 \#C_v(\mathbf F_{q_v^m})=1+q_v^m-\sum_j\alpha_j^m,
 \qquad
 \left|\#C_v(\mathbf F_{q_v^m})-(1+q_v^m)\right|
   \le2gq_v^{m/2}
\]

for every \(m\ge1\). The degree-zero root is \(1\), the degree-two root is \(q_v\), and the H¹ comparison with the Jacobian is the pullback along an Abel–Jacobi map over the appropriate geometric field. Retain the descended arithmetic action when a rational base point is not supplied. For genus zero the H¹ contribution is empty and the formula is exactly \(q_v^m+1\).

For a rank-two polynomial \(X^2-aX+q\), define \(t_m=\alpha^m+\beta^m\). The tests use \(t_0=2\), \(t_1=a\), and \(t_m=at_{m-1}-qt_{m-2}\) for \(m\ge2\). The curve \(y^2=x^3-x\) over \(\mathbf F_5\) has eight points, so \(a=-2\) and \(t_2=a^2-2q=-6\). Its point count over \(\mathbf F_{25}\) is \(25+1-(-6)=32\). `card_points_y2_eq_x3_sub_x_F5` computes the affine count plus the point at infinity; `elliptic_second_power_trace` and the accompanying numerical example check the extension formula.

Sources are [Deligne I, (1.5.1), p. 275, and (1.13)–(1.15), pp. 278–279][WI]. Prerequisites are the smooth-curve part of the preceding good-reduction target; DWP.1 `weights-of-the-cohomology-of-curves`, `weil-estimate-for-curves`; and SF.2's smooth proper base change, fixed-point trace and curve–Jacobian comparison. The latter includes the unchanged CohomologicalPointCounting/TraceFormula Layer 8 supplier. No trace construction or new Rosati positivity proof belongs here.

## R34.3 — Arithmetic specialization and comparison models

This layer identifies the traits, coefficient systems, specialization maps and inertia actions used by arithmetic applications. A general nearby-cycle theorem supplies a tool; applying it requires the actual mixed-characteristic model and verification of its coefficient and limit hypotheses. The early `LPV.7:semistable-curves` exports are used independently of the later invariant-cycle branch.

### Proper specialization over an arithmetic trait

Let \(S=\operatorname{Spec}\mathcal O_L\) be an excellent henselian mixed-characteristic trait with finite residue field, let \(f:X\to S\) be proper of finite type, and let \(\ell\) be invertible on \(S\). For \(\Lambda_n=\mathbf Z/\ell^n\), take the actual bounded constructible finite-Tor coefficient complexes \(\mathcal F_n\), their generic and special restrictions, and compatible transition morphisms. With geometric generic and special points, establish the arithmetic proper-base-change comparison

\[
 R\Gamma(X_{\bar s},R\Psi\mathcal F_{n,\bar\eta})
   \simeq R\Gamma(X_{\bar\eta},\mathcal F_{n,\bar\eta}).
\]

Identify the specialization map from the special-fibre coefficients to nearby cycles. Apply the nearby/vanishing triangle and obtain the cohomological specialization sequence. All maps carry the correct decomposition-group and inertia actions, with the corresponding descended residue Galois action. The comparison is functorial for the coefficient and trait changes in LPV.0. Generic smoothness by itself does not give these arithmetic assertions, and replacing the trait by one with algebraically closed residue field loses the finite-residue arithmetic datum unless descent is also supplied.

For the adic and rational version, verify uniform constructibility and amplitude, finite-Tor conditions, derived completeness, and compatibility of the transition maps on the specified coefficient system. Take derived inverse limits before tensoring with \(\mathbf Q_\ell\). Invoke Mittag–Leffler or the exact applicable derived-limit theorem before identifying cohomology of that limit with an ordinary inverse limit. An unchecked equality \(H^i(\varprojlim\mathcal F_n)=\varprojlim H^i(\mathcal F_n)\) is not a substitute.

At smooth proper good reduction with a lisse extension, vanishing cycles are zero, specialization is an isomorphism and inertia acts trivially. A nonproper affine degeneration is outside this proper comparison and would require the separately specified compact-support theorem.

Carayol's application uses nonconstant lisse coefficient sheaves at finite level, extended by his étale level covers. Prove the compatibility and finiteness conditions on those sheaves, not only on constant coefficients. The level maps and coefficient extensions are actual model data. The specialization sequence then applies to those coefficients and can be restricted to the relevant cuspidal eigensummand.

Sources are [Carayol, §4.1–§4.3, pp. 423–424][C]. Prerequisites are SF.2 proper base change and LPV.0 `derived-nearby-cycles-RPsi-and-vanishing-triangle`, `derived-functorialities-and-specialization-sequence`, `constructibility-and-finite-amplitude`, `coefficient-and-trait-change`, `adic-nearby-cycle-realization`. LPV.1 supplies inertia, variation and \(N\); it does not replace the adic realization or the verification of these coefficient hypotheses.

### Normalization, nodes and the descended graph action

For an actual proper semistable curve over a trait, let \(C_{\bar\eta}\) be the smooth geometric generic fibre, \(Y\) its geometrically reduced nodal special fibre, \(\nu:\widetilde Y\to Y\) its geometric normalization, and \(\Gamma\) its geometric dual graph. With constant \(\mathbf Q_\ell\)-coefficients, identify the Frobenius-equivariant sequences

\[
 0\longrightarrow H^1(\Gamma,\mathbf Q_\ell)
  \longrightarrow H^1(Y,\mathbf Q_\ell)
  \longrightarrow H^1(\widetilde Y,\mathbf Q_\ell)
  \longrightarrow0,
\]

\[
 0\longrightarrow H^1(Y,\mathbf Q_\ell)
  \longrightarrow H^1(C_{\bar\eta},\mathbf Q_\ell)
  \longrightarrow H_1(\Gamma,\mathbf Q_\ell)(-1)
  \longrightarrow0.
\]

The graph, components and branches are geometric. Frobenius may permute them, and the sequences carry that descended action; a graph built only from rational components can give the wrong representation. Import the specialization and normalization maps, their choice independence and their base-change compatibilities from the semistable-curve supplier.

Apply these formulas only after R13.5 or R18.2 supplies the specified regular or semistable model, including any required finite extension and the node-thickness and level-cover data. No assertion that every modular or Drinfeld level model is nodal or semistable is included. R13.5 is the model prerequisite; R13.6's downstream degeneration results cannot supply it.

For Carayol's nonconstant coefficient sheaves, use his coefficient normalization sequence in §4.5. Retain the residual term \(A\) and remove it only after applying the cuspidal eigensummand result of §4.4. The constant-coefficient graph formula alone does not prove that removal. R19.2 `carayol-vanishing-cycle-filtration` supplies this coefficient and eigensummand step.

The tests distinguish a good-reduction fibre, whose graph has no cycle, from a split one-node genus-one fibre. In the latter, the graph line has weight zero and the vanishing quotient \(\mathbf Q_\ell(-1)\) has weight two. The generic representation therefore has a monodromy filtration rather than a good-reduction pure-weight-one decomposition. Its degree-one geometric monodromy satisfies \(N^2=0\) and the normalization in the next target.

Sources are [Carayol, §4.2–§4.5, pp. 423–425][C], and [Saito, §8, Claim 5, pp. 37–38][S]. Prerequisites are proper-trait specialization; LPV.7:semistable-curves `curve-normalization-cohomology`, `curve-specialization-sequence`, `curve-choice-basechange-compatibility`; R13.5; R18.2; and R19.2's coefficient filtration. These imports require no late invariant-cycle or hard Lefschetz theorem.

### Mixed-characteristic Picard–Lefschetz normalization

Take a proper flat degeneration over the stated arithmetic trait, with regular total space and one isolated nondegenerate quadratic singularity in the special fibre. Specify the local smoothing equation \(Q-b\), where \(b\) is the uniformizing parameter. The quadratic and regularity hypotheses, not just the existence of a singular point, are required to apply LPV.2.

For odd relative dimension \(n=2m+1\), let \(\delta\in H^n(X_{\bar\eta},\mathbf Q_\ell(m))\) be the transported vanishing cycle. With the pairing in this twisted normalization, prove

\[
 \sigma x=x+(-1)^{m+1}\varepsilon_b(\sigma)(x,\delta)\delta,
\]

where \(\varepsilon_b\) is the tame Kummer character attached to \(b\). The parameter is \(b\), not \(-b\). In the untwisted convention the cup-product pairing has target \(\mathbf Q_\ell(-n)\), and converting the formula must retain the resulting Tate factors. The mixed-characteristic Picard–Lefschetz and cup-product comparison are required LPV.2 theorems; they do not follow solely from the arithmetic quasi-unipotence theorem.

For even relative dimension, use the separate reflection formula and quadratic character, with the source's residue-characteristic restrictions. In residue characteristic two, use the Clifford-centre branch rather than a prime-to-two discriminant shortcut. An even-dimensional reflection need not be unipotent. The alternating odd-dimensional formula is not an even-dimensional symplectic statement.

Normalize the logarithmic operator with geometric Frobenius by

\[
 FNF^{-1}=q^{-1}N.
\]

For a curve, this agrees with the graph-to-vanishing map and gives \(N^2=0\). The suggestion `nodal_monodromy_scaling` checks the convention with \(F=\operatorname{diag}(1,q)\) and \(N=\begin{pmatrix}0&1\\0&0\end{pmatrix}\), for \(q\ne0\). The matrix test fixes the scaling; it does not construct the degeneration or its tame inertia action.

Sources are [Deligne I, (4.2)–(4.3), pp. 288–289][WI]. Prerequisites are proper-trait specialization and LPV.2 `odd-relative-dimension-picard-lefschetz-3-3`, `even-relative-dimension-variation-3-2`, including their coefficient and cup-product compatibilities. Preserve the separate odd, even and characteristic-two branches when translating to an arithmetic local representation.

### Saito's semistable model and period comparison

Use Saito's specified Hilbert–Shimura construction, with sufficiently small levels \(K,H\), and assume every geometric component of the curve \(M_K\) has genus greater than one. The auxiliary imaginary quadratic field \(E_0\) splits at the prime \(p\), and the chosen completion \(E_{\mathfrak q}\) is identified with \(F_{\mathfrak p}\). Let \(V\) be a finite extension of the **completed maximal unramified extension** of that local field. It is not thereby a finite extension of \(E_{\mathfrak q}\); its residue field is algebraically closed. Construct the minimal semistable curve model over \(\mathcal O_V\) and the corresponding model of \(M_K\times N_H\).

Retain the exact local equalities in Lemma 4. A level morphism \((g,h)^*\) extends uniquely to a finite étale morphism of the minimal semistable models when

\[
 K_{\mathfrak p}=(g^{-1}K_1g)_{\mathfrak p},
 \qquad H_{\mathfrak q}=H_{1,\mathfrak q}.
\]

The specified abelian scheme extends over this model. For the lattice pairs defining its isogenies, require their \(p\)-components to remain unchanged; then the prime-to-\(p\) isogenies extend étale. Merely calling a map a change of prime-to-\(p\) level does not state all of these equalities. Extend the rational algebraic projector from Lemma 3 through its permutations and prime-to-\(p\) endomorphisms, with their actual correspondence compatibilities.

The resulting total variety is proper and is an abelian scheme over the semistable curve. Its geometric special fibre has smooth projective strata \(Y^{(0)}\) and \(Y^{(1)}\), with no higher intersections. Instantiate the SNC restriction/Gysin differentials, monodromy maps and the curve comparison on these strata. Section 8 supplies the Galois descent action, after a suitable Galois choice of extension of the completed unramified base. Preserve that action in the étale and log-crystalline constructions and in the projector image.

Apply CP.4's semistable-period comparison only after verifying its base, chart, coefficient and completion hypotheses for this model. The comparison must commute with the Galois/Weil action, Frobenius, \(N\), twists and the specified algebraic correspondences. If the comparison carrier requires a finite local field, supply descent to a finite local extension as a separate model theorem. To discuss weights of strata over finite fields, likewise descend the required equations, maps and correspondences to a finite residue extension while preserving the original Weil action. There is no residue cardinality \(\#k(V)\) to insert into a finite-field weight formula on the algebraically closed base itself.

The model verification exports to R06.5. The general geometric period comparison belongs to CP.4, not to a theorem deduced back from that export. The local Hilbert eigenform theorem in R34.6 uses these specific data and the auxiliary projector, rather than an arbitrary semistable variety with a vector-space idempotent.

Sources are [Saito, §7, Lemma 4 and proof, pp. 32–34; §8, Claim 4(1), pp. 35–36][S]. Prerequisites are proper-trait specialization; LPV.7:semistable-curves `snc-weight-spectral-sequence`, `snc-restriction-gysin-differential`, `snc-monodromy-and-curve-comparison`; R18.2's actual Hilbert model and projector; and CP.4 `semistable-period-comparison`, with the descent interface below. A generic SNC theorem neither constructs Saito's model nor verifies the finite-local-field hypotheses.

## R34.4 — Descended pencils and original-coefficient monodromy

This layer verifies the arithmetic inputs to the pencil arguments in DWP.2–4. The geometry comes from LPV.3–5 and EDC.2–4. Finite-extension descent, removal of the radical, and openness in the original coefficient group are independent conditions; none can be replaced by a numerical example of a symplectic matrix.

### A pencil over a common finite extension

Let \(X_0/\mathbf F_q\) be smooth, projective and geometrically connected of dimension \(n+1\), with a specified projective embedding. After a Veronese embedding of degree at least two, LPV.3 provides a geometrically nonempty open in the pencil parameter space. Take a closed point of that open. Its residue field is \(\mathbf F_{q^d}\) for some finite \(d\); the construction does not promise an \(\mathbf F_q\)-rational point of the open.

Over a common finite extension, construct the chosen axis, its incidence blowup, the critical-point data and the smooth parameter open \(U\). Identify the incidence variety with the blowup of this axis and the map to the pencil's parameter line. It is the family of the selected pencil, not an unrelated fibration with the same dimension. Use SF.2 arithmetic descent of finite-type equations and morphisms to keep all data over a single finite field. EDC.4 supplies the actual axis blowup and weak-Lefschetz comparison maps.

If the model is further extended by degree \(e\), Frobenius becomes \(F^e\) and the residue size becomes \(q^{de}\). Transport cohomology with those precise operators and cardinalities. When an eigenvalue \(\alpha^d\) is a Weil \(q^d\)-number of weight \(w\), the DWP.0 power criterion shows that \(\alpha\) is a Weil \(q\)-number of weight \(w\). This descends a cohomological weight assertion for an already defined arithmetic action. It does not descend the chosen pencil itself to \(\mathbf F_q\). Purely inseparable field extensions use étale invariance; the finite extensions of finite fields in this construction are separable.

Sources are [Deligne I, (5.6)–(5.7), pp. 291–292, and (6.1), pp. 294–295][WI]. Prerequisites are LPV.3 `lefschetz-pencil`, `existence-of-lefschetz-pencils`; EDC.4 `weak-lefschetz`, `pencil-axis-blowup`; DWP.0 `weil-number-base-extension`; and SF.2's common finite-residue-field descent. This target verifies the arithmetic descent of the supplier's construction; the weight induction remains in DWP.4.

### The arithmetic vanishing quotient and its parity

For the smooth open of that pencil, take the original \(\mathbf Q_\ell\)-local system \(R^nf_*\mathbf Q_\ell\). In a geometric smooth fibre let \(H=H^n\), let \(E\subseteq H\) be the span of the transported vanishing cycles, and let \(E^\perp\) be its orthogonal complement for Poincaré duality. Construct

\[
 R=E\cap E^\perp,
 \qquad V=E/R.
\]

The induced pairing

\[
 V\otimes V\longrightarrow\mathbf Q_\ell(-n)
\]

is nondegenerate. It is alternating for odd \(n\) and symmetric for even \(n\). A perfect pairing on \(H\) alone does not imply that its restriction to \(E\) is perfect; quotienting by the radical is essential. Prove that the arithmetic action permutes the critical points and the transported cycles and preserves the cup-product pairing with its Tate target. Thus \(E\) and \(R\) are invariant and \(V\) has the descended Frobenius action.

Retain the coefficient field and the pairing multiplier when applying a weight theorem. Even-dimensional symmetric pairings cannot be passed to an odd-dimensional transvection or symplectic argument. Characteristic-two variation likewise uses its specified geometric branch. If \(E=0\), then \(V=0\), and the quotient and weight assertions are vacuous; do not assert irreducibility of the zero representation. LPV.4's corresponding zero-cycle formula retains the extra skyscraper term in \(R^{n+1}f_*\), rather than substituting the nonzero branch's \(j_*\) expression.

Sources are [Deligne I, (5.8)–(5.9), pp. 292–293][WI]. Prerequisites are the preceding pencil descent; LPV.4 `cohomology-sheaves-of-a-lefschetz-pencil`, `vanishing-quotient-and-its-pairing`; EDC.2:trace-purity `smooth-purity`; and EDC.2:pairings `cup-product-trace-pairing`, `galois-frobenius-equivariance`, `adic-and-rational-poincare-duality`. The arithmetic invariance and twisted pairing are the comparison inputs to the next target.

### Open monodromy in the original coefficient group

In odd middle degree, for the nonzero quotient \(V\) over its original \(\mathbf Q_\ell\)-model, instantiate LPV.5's absolute irreducibility and Kazhdan–Margulis open-image theorems. The geometric monodromy image must be **open in the original symplectic \(\mathbf Q_\ell\)-group**. Zariski density is weaker, and scalar extension to a larger coefficient field does not preserve an assertion of openness in the required larger local group.

Use DWP.3 `rationality-of-pencil-local-factors` on the actual descended local factors of \(V\). Rationality is an independent hypothesis for the DWP.2 fundamental estimate and cannot be supplied by the desired purity conclusion. Together with the nondegenerate alternating pairing into \(\mathbf Q_\ell(-n)\), these verifications instantiate the fundamental estimate with pairing weight \(n\). Keep all local factors and residue-degree powers in the arithmetic field of definition. This target verifies the application hypotheses; DWP.2 owns the estimate and DWP.4 owns the ensuing Weil-bound induction.

Handle \(V=0\) separately, with characteristic polynomial \(1\), rather than using a nonzero irreducibility or open-monodromy premise. For even degree the pairing is symmetric and the symplectic estimate does not apply. These parity, zero-rank and coefficient restrictions are part of the theorem's interface, not choices to be suppressed in a generic monodromy assertion.

Sources are [Deligne I, (3.1)–(3.2), pp. 283–284, and (5.10), p. 293][WI]. Prerequisites are the preceding quotient; LPV.5 `absolute-irreducibility-of-the-vanishing-quotient`, `kazhdan-margulis-open-image`; DWP.3 `rationality-of-pencil-local-factors`; and DWP.2 `fundamental-estimate-theorem-3-2`. The original coefficient field must appear in the monodromy statement supplied to that theorem.

## R34.5 — Parabolic realizations, projectors and hard Lefschetz

These targets identify the particular arithmetic cohomology and correspondences used in eigenform applications. The classical higher-weight construction, the weight-two abelian quotient, and Saito's Hilbert construction have different degree and auxiliary-character formulas. Each comparison states its model, coefficient, degree and equivariance data before applying a general weight theorem.

### Purity of parabolic cohomology

Let \(S_0/\mathbf F_q\) be a smooth curve, let \(h:\mathcal A\to S_0\) be an elliptic scheme, and assume \(\ell\nmid q\). For \(k\ge2\), put \(r=k-2\) and

\[
 \mathcal F_r=\operatorname{Sym}^rR^1h_*\mathbf Q_\ell,
 \qquad
 W_r=\operatorname{Im}\bigl(H_c^1(S_{\overline{\mathbf F}_q},\mathcal F_r)
                 \to H^1(S_{\overline{\mathbf F}_q},\mathcal F_r)\bigr).
\]

Use the actual lisse sheaf \(R^1h_*\mathbf Q_\ell\), whose stalks have weight one by R34.2 and its abelian-fibre comparison. Its symmetric power has punctual weight \(r\). The DWP.7 upper bound on \(H_c^1\) and smooth-lisse lower bound on \(H^1\) make their image pure of weight \(r+1=k-1\). It is the image, rather than the entire cohomology of the open curve, that has this exact weight: boundary contributions can give other weights in ordinary \(H^1\).

For the arithmetic modular application, specify the good residue model, the coefficient embeddings, and the rational algebraic Hecke projector that commutes with Frobenius. The projected parabolic summand inherits the weight. Finite-character summands have weight zero and preserve the calculation under tensoring. Use R19.1's parabolic premotive to identify the actual arithmetic realization; an abstract image of vector spaces is not the geometric identification.

The numerical suggestion `parabolic_degree_weight` tests \((k-2)+1=k-1\). Also retain the boundary test: removing the compact-support-to-ordinary image operation must not falsely make all ordinary open-curve cohomology pure. The statement needs both smoothness of the curve and lissity of the coefficient sheaf for the lower bound.

The weight-two input gives weight one; the weight-twelve input gives weight eleven. In the classical Kuga–Sato realization the latter lies in degree eleven of the eleven-dimensional compactification, with zero Tate twist.

Sources are [Deligne II, Corollary (3.3.6), p. 206, and (3.7.1), p. 215][WII]. The earlier [Deligne modular, Theorem 5.1 and Lemma 5.3, pp. 168–169][DM] gives the modular construction with its then-conditional Weil input; DWP supplies the unconditional weight theorem used here. Prerequisites are R34.2's H¹ comparison; DWP.0 `purity-under-subquotients-and-extensions`, `spectra-of-tensor-products-and-duals`; DWP.7 `cohomological-bounds-3-3-2-3-3-6`; and R19.1 `parabolic-realisation-premotive`.

### Classical Kuga–Sato and Hilbert projector comparisons

For the classical branch, take a fine modular curve \(Y(M)\), with \(M\ge3\), its universal elliptic scheme \(\mathcal A\), and \(r=k-2\ge1\). Specify the smooth projective compactification \(W_r\) of the \(r\)-fold fibre power, together with its boundary resolution and good-prime model. Instantiate R19.1's rational algebraic Scholl projector. Its degree-one symmetric-power piece identifies, Hecke- and Galois-equivariantly, the parabolic \(\operatorname{Sym}^rR^1\) realization with the corresponding interior-image subquotient of

\[
 H^{r+1}(W_{r,\overline K},\mathbf Q_\ell).
\]

At a prime of actual smooth proper reduction, away from the level, coefficient characteristic and required model denominators, the projector must extend as a correspondence and commute with Frobenius. DWP.4 smooth-projective purity makes its image pure of weight \(r+1\). A twist by \((b)\) gives weight \(r+1-2b\). The point is the specified degree \(r+1\), not just the total dimension of a fibre power. Weight two, where \(r=0\), is the separate Jacobian target below.

Supply \(W_r\)'s construction and good-prime extension through R14.3 and GH.0, with the correspondence's denominator and boundary hypotheses. A rational algebraic projector does not automatically extend integrally at its denominator primes, give a saturated integral eigensummand, or establish unrestricted freeness. The GH.0 CM-product construction \(W_r\times A^r\) has total degree \(2r+1\); it does not replace the classical degree-\(r+1\) comparison needed here.

For the Hilbert branch use Saito's actual \(X_{K,H,\widehat T,\widehat R}\), curve \(M_K\), auxiliary zero-dimensional scheme \(N_H\), and algebraic projector \(e\). If \(g=[F:\mathbf Q]\), put \(q_0=(2g-1)(w-2)\). Lemma 3 identifies

\[
 eH^q(X_{\overline E},L_\lambda)
 \simeq H^{q-q_0}(M_{\overline F},\mathcal F^{(k)}_\lambda)
    \otimes H^0(N_{\overline E},\mathcal F(\chi_0^{(g-1)(w-2)})).
\]

Retain the auxiliary character and its weight in this formula. After the specified auxiliary projector \(e^\circ\), it produces the Tate-twisted comparison used in R34.6. This is not the classical \(r+1\) formula. R18.2 supplies the Hilbert model, projector and coefficient correspondence; the completed-unramified model and its descent requirements are as in R34.3. Projector images inherit weights only through the actual equivariant realization, not through an arbitrary vector-space idempotent or a Betti comparison.

Sources are [Deligne modular, Lemmas 5.2–5.4, pp. 168–170][DM], and [Saito, §6, Lemma 3, pp. 30–31][S]. Prerequisites are GH.0 and R14.3 for the classical model; R18.2 for the Hilbert construction; R19.1 `scholl-projector`; DWP.4 `smooth-projective-purity`; R34.1's linear-algebra operations; and the preceding parabolic purity target. These interfaces construct and identify the specific projectors; no second abstract Scholl projector is required.

### Weight two and modular Jacobians

For a weight-two normalized cuspidal eigenform \(f\), use the specified modular Jacobian quotient \(J\to A_f\), with coefficient-field action by \(K_f\). R14.5 supplies the quotient and its dimension before any aggregate theorem about the eigenform representation is used. At a place of good reduction away from the coefficient characteristic, R34.2 makes the full \(H^1(A_f)\) pure of weight one with integer Frobenius polynomials.

For a finite coefficient place \(\lambda\) and its specified embedding, the cohomological eigensummand \(M_{f,\lambda}\) inherits weight one and algebraic-integral geometric eigenvalues. Its polynomial over \(K_{f,\lambda}\), or the common coefficient number field when supplied, need not be rational and need not lie in \(\mathbf Z[X]\). If \(\rho_{f,\lambda}=M_{f,\lambda}^\vee\), then \(\rho\) has geometric weight \(-1\). Its arithmetic eigenvalues are the geometric eigenvalues of \(M\) and remain algebraic integers; its geometric eigenvalues are their inverses and need not be integral.

For rational coefficients, \(A_f\) is the corresponding elliptic quotient. For coefficient degree \(d\), the modular quotient has dimension \(d\) and the coefficient eigensummand has rank two. Track the Hecke action and the coefficient descent explicitly; an integer polynomial for the full rank-\(2d\) cohomology does not make every rank-two coefficient-field factor rational.

Sources are [Diamond–Flach–Guo, §5.4, Lemma 5.7, pp. 58–59][DFG], for rank and coefficient realization, and [Milne, Chapter I, Remark 12.5, p. 56][AV], for equivariant duality. Prerequisites are R14.5 `modular-quotient`, `modular-quotient-dimension`; R34.2's good-reduction theorem; and R34.1's linear-algebra operations. Higher-weight forms use the parabolic/Kuga–Sato branch, not an asserted abelian-variety realization.

### Hard Lefschetz with arithmetic Tate twists

Let \(X_0/\mathbf F_q\) be smooth and projective of pure dimension \(d\), and let \(\mathcal L\) be an ample line bundle defined over \(\mathbf F_q\). Its arithmetic Chern class is

\[
 \eta=c_1(\mathcal L)\in H^2(X_{\overline{\mathbf F}_q},\mathbf Q_\ell(1)).
\]

For \(0\le a\le d\), identify the actual cup-product map

\[
 \eta^a\cup-:H^{d-a}(X_{\overline{\mathbf F}_q},\mathbf Q_\ell)
       \xrightarrow{\ \sim\ }
       H^{d+a}(X_{\overline{\mathbf F}_q},\mathbf Q_\ell(a)).
\]

DWP.9 supplies its absolute hard Lefschetz isomorphism, while the arithmetic definition of the ample class supplies Frobenius equivariance. Restore the twists suppressed in Deligne II's algebraically closed convention: both sides have geometric weight \(d-a\), because \((d+a)-2a=d-a\). The suggestion `hard_lefschetz_target_weight` tests precisely this equality. At \(a=d\) both sides have weight zero, including the top-degree Tate twist.

For a projected summand, require that the specified arithmetic algebraic projector commute with \(\eta^a\cup-\); an arbitrary projector need not do so. The absolute isomorphism makes no assertion of arithmetic Frobenius semisimplicity and does not yield a relative hard Lefschetz or decomposition theorem without its own hypotheses. The relative/decomposition layer EDC.7 is not a prerequisite of this absolute arithmetic comparison.

Sources are [Deligne II, Theorem (4.1.1), p. 217][WII], with Tate twists restored. Prerequisites are DWP.9 `lefschetz-operator`, `hard-lefschetz-4-1-1`; DWP.4 `smooth-projective-purity`; EDC.2:trace-purity `first-chern-class`; EDC.3 `cycle-class-map`; and R34.1's complex-weight normalization. The theorem uses the actual arithmetic class and cup product, not just matching dimensions of two pure representations.

## R34.6 — Eigenform purity, compatibility and the restricted local export

The final layer combines the particular arithmetic realizations of R34.3 and R34.5 with the general weight theorems. Good-prime compatibility is proved from a common Hecke polynomial. Local monodromy weights are imported only for the Hilbert modular forms and hypotheses of Saito's theorem. Neither equal root norms nor a general quasi-unipotence theorem proves these assertions.

### Eigenform purity and the Ramanujan bound

Let \(f\) be a normalized cuspidal newform of weight \(k\ge2\), level \(N\), nebentypus \(\psi\), and coefficient field \(K_f\). For every finite place \(\lambda\mid\ell\) of \(K_f\), use R19.1's specified coefficient descent and projector to obtain the rank-two **normalized cohomological realization** \(M_{f,\lambda}\). At every good prime \(p\nmid N\ell\), supply the geometric Hecke/Frobenius comparison

\[
 P_p(M_{f,\lambda};X)
     =X^2-a_p(f)X+\psi(p)p^{k-1}.
\]

The polynomial comparison must come from the geometric construction independently of the purity theorem here. Its inputs are the actual rank-two eigensummand, model, coefficient embedding and Eichler-congruence relation. An aggregate construction whose proof already uses R34.6 cannot serve as this input. The parabolic, Scholl and coefficient-descent constructions identify the required realization without that circular dependence.

R34.5 gives \(M_{f,\lambda}\) geometric weight \(k-1\). For \(\rho_{f,\lambda}=M_{f,\lambda}^\vee\), geometric weight is \(1-k\) and the **arithmetic** Frobenius polynomial is the displayed Hecke polynomial. For every complex embedding \(\sigma:K_f\hookrightarrow\mathbf C\), both roots of the corresponding polynomial have norm \(p^{(k-1)/2}\). The triangle inequality gives

\[
 |\sigma(a_p(f))|\le2p^{(k-1)/2}.
\]

This is the Ramanujan bound for the stated good primes and all coefficient embeddings. The geometric eigenvalues on \(M\), equivalently the arithmetic eigenvalues on \(\rho\), are algebraic integers through the cohomological realization. The geometric eigenvalues on \(\rho\) are their inverses. The coefficient-field polynomial is not asserted to be rational or in \(\mathbf Z[X]\). A Tate twist \(M(b)\) has weight \(k-1-2b\). There is no weight-one or noncuspidal extension of this target.

When using Diamond–Flach–Guo's conventions, identify \(M_{f,\lambda}\) with the actual normalized realization \((M_g\otimes M_{\psi_g^{-1}})_\lambda\) by a Hecke/Frobenius-equivariant comparison. Untwisted \(M_g\) has geometric determinant \(\psi(p)^{-1}p^{k-1}\); it is not identified with \(M_{f,\lambda}\) just by sharing a letter. The finite-character twist changes this determinant to the stated nebentypus convention and preserves weights and algebraic-integral eigenvalues. It does not establish rational coefficients.

DFG's characteristic-zero étale realizations and lattices exist at every coefficient prime. Its integral crystalline and Fontaine–Laffaille comparison data have the separate restriction \(\lambda\notin S_N\), where \(S_N\) consists of coefficient primes dividing \(Nk!\). The good-prime purity assertion uses the specified étale eigensummand and geometric polynomial at every \(\lambda\); it does not extend integral crystalline comparison, freeness or saturation through an excluded coefficient prime by changing coefficients.

For the discriminant form \(\Delta\), \(k=12\), \(a_2=-24\), and the polynomial is \(X^2+24X+2048\). Its geometric cohomological weight is \(11\), and the geometric weight of the arithmetic dual is \(-11\). The suggestion `ramanujan_trace_bound` isolates the triangle inequality for two roots of equal norm; the degree and polynomial comparisons are supplied by the actual geometric realization.

Sources are [Deligne modular, Theorems 5.1 and 5.6, pp. 168 and 170–171][DM]; [Deligne II, (3.7.1), p. 215][WII]; and [DFG, §§1.1–1.3, pp. 6–13, §5.4, Lemma 5.7, pp. 58–59][DFG], for the coefficient and normalization data. Prerequisites are R34.5's parabolic purity, classical projector and weight-two quotient targets; R34.1's every-embedding comparison; R19.1 `newform-projector-and-coefficient-descent` and the independent geometric polynomial interface; and DWP.10 `weight-transport-to-stable-subquotients`.

### A fixed eigenform's common good-prime polynomials

For the fixed newform above and a good prime \(p\nmid N\), set

\[
 P_p(X)=X^2-a_p(f)X+\psi(p)p^{k-1}\in K_f[X].
\]

For every coefficient place \(\lambda\nmid p\), prove that its image in \(K_{f,\lambda}[X]\) is the geometric polynomial on \(M_{f,\lambda}\), equivalently the arithmetic polynomial on \(\rho_{f,\lambda}\). The coefficient field and polynomial are common because the realizations use the **same** Hecke eigenvalues and nebentypus. Equality of root norms alone does not imply equality of the trace, determinant or polynomial; the suggestion `equal_root_norms_not_same_polynomial` distinguishes \(X-1\) from \(X+1\).

Supply the characteristic-zero coefficient realizations and the common geometric polynomial comparison at every finite \(\lambda\). Any exceptional set needed by model denominators is enlarged explicitly at that geometric interface. The theorem concerns primes away from the level and the coefficient characteristic. Bad-prime Weil–Deligne data, and the realization at \(\lambda\mid p\), require their separate local comparison theorems.

R24.5 `weakly-compatible-system-rank-n` and `compatible-system-predicates` give the generic system language receiving these common polynomials. Their full carrier also needs de Rham/crystalline conditions and Hodge–Tate data; this target proves the fixed-source good-prime polynomial component and does not assert that those other obligations follow from it. R19/R06 supply the relevant local data, with their exact source restrictions. R19.3 is the downstream consumer of the fixed-form exports rather than the owner of a second generic system carrier.

The DFG excluded set \(S_N\) still restricts its integral crystalline comparison. Its all-prime étale lattices do not remove that restriction. Retain the normalized \(M_g\otimes M_{\psi_g^{-1}}\) identification when comparing coefficient realizations; twisting each member without fixing a common character would not give the specified common polynomial.

Sources are [DFG, §§1.1–1.3, pp. 6–13; §5.4, Lemma 5.7, and §5.5, pp. 58–60][DFG]. Prerequisites are the preceding eigenform theorem, R19.1 `newform-projector-and-coefficient-descent` and its independent polynomial comparison, and the two R24.5 fine interfaces just named. This is a fixed-eigenform theorem, not an existence or potential automorphy theorem for a general compatible system.

### Transport through actual arithmetic comparisons

Given a coefficient-linear isomorphism between two specified arithmetic realizations, require that it intertwine their actual arithmetic Frobenius actions, equivalently their geometric inverses at an unramified place. Then their local characteristic polynomials and weights agree. More generally, an arithmetic algebraic projector commuting with Frobenius has an invariant image that inherits the ambient purity. Apply DWP.10's general transport theorem to the actual Tate, parabolic and Kuga–Sato comparisons already constructed here.

For a finite extension of residue degree \(d\), a comparison concerns \(F^d\) and \(q^d\). Use DWP.0's power criterion to recover the original weight relative to \(q\), with \(q>1\), when the original Frobenius action is specified. This does not construct a descent datum for an otherwise unspecified representation or correspondence. Coefficient extension likewise needs the given coefficient map and the induced action; a bare vector-space isomorphism is insufficient.

Algebraic-integral eigenvalues pass to an invariant image. To conclude that its polynomial lies in \(\mathbf Z[X]\), add rationality of that image polynomial and the monic-factor argument of R34.1. A Betti projector alone supplies neither the arithmetic correspondence nor Frobenius equivariance. Semisimplicity is a separate Faltings-type hypothesis, and is not a consequence of purity or equality of weights.

The early good-reduction comparison may be used directly by the Faltings application through DWP.0–1 and R34.2; the position of this reusable transport target does not add general Weil II to that route. The target verifies particular arithmetic comparison inputs to the general owner theorem, not another proof of general weight transport.

Sources are [Lawrence–Venkatesh, §2.3, Lemma 2.3, pp. 9–10][LV], for the arithmetic use, and [Deligne II, (1.2.5)(i), p. 154][WII], for the weight operation. Prerequisites are DWP.10 `weight-transport-to-stable-subquotients`; DWP.0 `weil-number-base-extension`; R34.1's linear-algebra operations; R34.2's good-reduction comparison; and R34.5's actual projector comparison.

### Hilbert eigensummands and local monodromy weights

Restrict to Saito's source range. Let \(F\) be totally real of degree \(g>1\) and let \(f\) be a cuspidal Hilbert eigennewform of multiweight \((k_1,\ldots,k_g,w)\), with

\[
 w\ge k_i\ge2,\qquad k_i\equiv w\pmod2.
\]

When \(g\) is even, retain Carayol's finite discrete-series hypothesis in Theorem 0. For the comparison at a fixed \(\mathfrak p\), retain the source's quadratic base-change reduction when it is used to obtain an auxiliary discrete-series place different from \(\mathfrak p\). Take the actual Hilbert model, coefficient sheaf, projector and auxiliary character from R34.3 and R18.2; a general idempotent on a cohomology space does not supply them.

With \(q_0=(2g-1)(w-2)\) and \(b=(g-1)(w-2)\), verify the equivariant normalization

\[
 e^\circ e\,H^{q_0+1}(X)(b)
      \simeq H^1(M,\mathcal F^{(k)}).
\]

Its weight calculation is

\[
 (q_0+1)-2b=w-1.
\]

The auxiliary projector and Tate twist are the ones in Saito's Lemma 3 and its use on p. 31. Specify the coefficient embeddings and prove that the comparison commutes with Frobenius and \(N\). An alternating trace identity without those data does not determine monodromy on a projected summand.

For \(\lambda\mid\ell\), \(\ell\ne p\), and \(\mu\mid p\), import R06.6 `hilbert-modular-form-compatibility-at-p`. It gives potential semistability at \(\mu\), comparison of the rank-two Frobenius-semisimplified Weil–Deligne realizations with the source-normalized \(\check\sigma_h(\pi_{f,\mathfrak p})\), and the monodromy-graded weight assertion. For residue size \(q=N\mathfrak p\), with geometric Frobenius \(F\), use

\[
 N^2=0,\qquad FNF^{-1}=q^{-1}N,
\]

and the filtration

\[
 0\subset\operatorname{Im}N\subset\ker N\subset V.
\]

The graded piece \(\operatorname{Gr}_iV\) has weight \(w-1+i\), and

\[
 N:\operatorname{Gr}_1V(1)\xrightarrow{\ \sim\ }\operatorname{Gr}_{-1}V.
\]

If \(N=0\), the representation has weight \(w-1\). If \(N\ne0\), its kernel line has weight \(w-2\) and its cokernel line has weight \(w\). The suggestion `local_monodromy_twist_weight` checks the twist from the upper piece to the lower piece. Equality of Frobenius traces together with these source-qualified graded weights distinguishes the zero and nonzero monodromy cases; equal traces without the weight theorem do not by themselves prove equality of \(N\).

In particular, \(w=2\) and nonzero \(N\) give graded weights zero and two, consistent with the nodal curve calculation and the factor \(q^{-1}\) in geometric monodromy scaling.

Use the geometric normalization consistently on the \(p\)-adic side: \(N\varphi=p\varphi N\). The formulas printed on p. 12 of arXiv v2 with \(\varphi N=pN\varphi\) and the opposite Frobenius exponent conflict with the geometric convention and the twisted graded isomorphism on p. 13. The comparison here uses the compatible inverse exponent \(q^{-1}\). This is an explicit convention correction for that version; it does not identify a differently paginated journal text with the examined preprint.

The crystalline argument for nonconstant coefficient vanishing in §9 belongs to the imported R06.6 theorem. It requires the actual coefficient isocrystal and the interior-weight argument, not just a theorem for constant coefficients. The geometric CP.4 comparison, the Saito model and its descent hypotheses remain prerequisites. This target exports their application and the projected degree/twist normalization. It asserts no general mixed-characteristic weight–monodromy theorem beyond the source's Hilbert range.

Sources are [Saito, §2, Theorem 1, Claim 1 and Theorem 2, pp. 12–13; §6, Lemma 3 and its auxiliary projector, pp. 30–31; §8, Claims 4–5, and §9, Proposition 1′, pp. 35–39, with the crystalline argument on pp. 40–43][S]. Prerequisites are R34.3's Saito and nodal comparisons; R34.5's Hilbert projector comparison; R19.2 `carayol-sigma-lambda-construction`; DWP.1 `weights-of-the-cohomology-of-curves`; R06.6 `hilbert-modular-form-compatibility-at-p`; and R24.5 `weakly-compatible-system-rank-n`, `compatible-system-predicates`. The generic compatible-system interfaces receive the local export but do not prove the geometric or crystalline theorem used to obtain it.

## Required arithmetic supplier interfaces

The general owner theorems above are used with the following concrete mathematical interfaces. These requirements specify the objects and compatibilities needed for the arithmetic applications. A theorem about endomorphism polynomials, coherent duality, or generic semistable periods cannot replace a different étale or model comparison merely by having the same layer reference.

### AbelianSchemesAndArithmeticModuli A4

Supply the canonical Galois-equivariant isomorphism

\[
 H^1(A_{\bar K},\mathbf Z_\ell)
   \simeq\operatorname{Hom}_{\mathbf Z_\ell}(T_\ell A,\mathbf Z_\ell)
\]

and the cup-product isomorphisms \(\bigwedge^iH^1\simeq H^i\), with functoriality and base-change naturality. These are the geometric comparisons used by R34.2, with [Milne, Chapter I, Theorem 12.1 and Remark 12.5, pp. 55–56][AV] as source. A6's characteristic polynomials for endomorphisms remain a separate input.

### SchemeAndStackFoundations SF.2

Supply the actual equivalence between lisse adic sheaves and continuous étale fundamental-group representations; proper and smooth base change away from the residue characteristic; the cohomological fixed-point trace formula, including the curve–Jacobian comparison; and arithmetic descent of finite-type equations, maps and specified data to a common finite residue extension. R34.1 uses the equivalence, R34.2 the good-reduction and trace comparisons, R34.3 proper base change, and R34.4 the descent. The curve–Jacobian interface retains CohomologicalPointCounting/TraceFormula Layer 8. Coherent-duality results do not provide these étale interfaces. Sources for the applications are [Deligne I, (1.13)–(1.15), pp. 278–279][WI], [Deligne II, (1.1.13), p. 152][WII], and [Carayol, §4.1–§4.3, pp. 423–424][C].

### LefschetzPencilsAndVanishingCycles LPV.0

Supply finite-level functoriality, constructibility, finite amplitude, coefficient/trait change and the adic nearby-cycle realization. For the **specified Carayol coefficient extensions**, verify uniform amplitude and constructibility, finite-Tor hypotheses, derived completeness and the transition-map/Mittag–Leffler conditions needed for derived inverse-limit specialization. R34.3's proper-trait comparison uses those verifications and preserves inertia equivariance. The general existence of an adic realization is not a verification of this system's hypotheses. Source: [Carayol, §4.1–§4.3, pp. 423–424][C].

### ModularCurvesPartII R13.5

Construct the actual bad-prime modular curve model and its required regular or semistable extension, with geometric node thicknesses, level-cover morphisms and coefficient extension data. Those are the hypotheses used to instantiate LPV's formulas in R34.3. The model construction precedes the R13.6 degeneration application and cannot be obtained from it. The exact level and model hypotheses must state where semistability holds, rather than assuming it for every level. The arithmetic comparison is sourced at [Carayol, §4.1–§4.5, pp. 423–425][C], with the source-qualified model data supplied by R13.5.

### HilbertModularVarietiesAndShimuraCurves R18.2

Supply Carayol's named \(M_{n,H}\) integral model, its coefficient extensions and geometric special-fibre normalization. Separately supply Saito's sufficiently small-level model with genus-greater-than-one geometric components, \(E_0\) split at \(p\), unchanged local level and lattice components, and the abelian scheme and prime-to-\(p\) isogeny extensions of Lemma 4. Supply Lemma 3's actual algebraic projector, degree \(q_0\), auxiliary character and equivariant comparison. R34.3 and R34.5 use these distinct model inputs. Include finite-residue descent of strata/correspondences preserving the original Weil action, and finite-local descent when the comparison carrier requires it. Sources: [Carayol, §4, pp. 423–425][C]; [Saito, §6, Lemma 3, pp. 30–31, §7, Lemma 4, pp. 32–34, and §8, pp. 34–38][S].

### GeneralizedHeegnerCycles GH.0

Supply the actual classical \(W_r\) compactification and the denominator, boundary resolution and good-prime correspondence-extension data needed to instantiate R19.1's Scholl projector. Preserve its Hecke/Galois-compatible parabolic étale comparison. Coordinate the classical geometry with R14.3. The degree-\(2r+1\) CM-product construction does not supply the required degree-\(r+1\) realization by itself, and the Hilbert projector remains in R18.2. The required classical comparison is [Deligne modular, Lemmas 5.2–5.4, pp. 168–170][DM].

### ModularCurvesPartII R14.3

Supply the higher-weight classical Kuga–Sato compactification, universal elliptic local system, modular good-prime/base-change geometry and boundary/resolution data for R34.5. Coordinate these model inputs with GH.0 and use the existing R19.1 Scholl comparison. A weight-two Betti or cohomological construction is not a higher-weight algebraic model, and the \(k=2\) Jacobian branch remains in R14.5. Source for the required realization: [Deligne modular, Lemmas 5.2–5.4, pp. 168–170][DM].

### CohomologyComparisons CP.4

Instantiate `semistable-period-comparison` on the actual proper Saito model over \(\mathcal O_V\). Verify the base and semistable charts, and compatibility with Galois/Weil actions, Frobenius, \(N\), twists and the algebraic correspondences. Where the chosen period carrier is over finite local fields, supply finite-local descent and compatibility with the original Weil action. Saito's finite extension of the completed maximal unramified base is not already such a field. This is the geometric input to R34.3, which then exports to R06.5. Sources: [Saito, §7, pp. 32–34, and §8, Claim 4, pp. 35–36][S].

### AutomorphicGaloisRepresentations R19.1

Use `parabolic-realisation-premotive`, `scholl-projector`, and `newform-projector-and-coefficient-descent` for the characteristic-zero realizations at every finite coefficient place. Supply an **independent geometric** rank-two and Eichler-congruence comparison, with the actual auxiliary good-prime models, identifying normalized \(M_{f,\lambda}\), its arithmetic dual, and the polynomial \(X^2-a_p(f)X+\psi(p)p^{k-1}\). This comparison's premises must not include R34.6 purity. Identify the DFG character-twisted realization rather than identifying untwisted \(M_g\) by notation. Retain projector, boundary/resolution, coefficient-descent and denominator hypotheses; do not extend integral freeness or Fontaine–Laffaille comparisons to excluded coefficient primes. R34.6 uses this interface to prove weights and common good-prime polynomials. Sources: [Deligne modular, Theorems 5.1 and 5.6, pp. 168 and 170–171][DM]; [DFG, §§1.1–1.3, pp. 6–13, and §5.4, Lemma 5.7, pp. 58–59][DFG].

## Suggested Lean forms

[Suggested.lean](Suggested.lean) gives numerical representation, polynomial and matrix forms using Mathlib's own objects, together with the named API and tests above. The README is the mathematical specification. The supplied inertia subgroups, Frobenius elements and cardinality functions in the numerical forms must be connected to the genuine continuous arithmetic carrier through R01.1–2. They do not construct that carrier.

Full arithmetic or geometric signatures require the supplier objects described in the layers: actual lisse sheaves and adic complexes; Tate modules and cohomology with specialization; traits and nearby cycles with the compatible coefficient systems; modular models, geometric normalization graphs and quadratic degenerations; pencil incidence families and original-coefficient vanishing quotients; algebraic projectors and equivariant parabolic, Kuga–Sato and Hilbert comparisons; and the local Weil–Deligne and period carriers. The suggested file lists the full signatures needing these objects. Scalar identities and weight arithmetic are useful convention tests, but are not statements of the omitted geometric comparison theorems. The eventual Lean forms must express those hypotheses through the owners' actual objects and maps, rather than through arbitrary proposition-valued replacement fields.

## References

All page numbers in the targets are printed page numbers in the editions below. The fixed arXiv versions are specified because their numbering differs from other versions or journal editions.

* **[WI] Pierre Deligne**, *La conjecture de Weil. I*, Publications Mathématiques de l'IHÉS **43** (1974), pp. 273–307. [Public Numdam scan][WI]. For one-based PDF pages, printed page = PDF page + 271.
* **[WII] Pierre Deligne**, *La conjecture de Weil. II*, Publications Mathématiques de l'IHÉS **52** (1980), pp. 137–252. [Public Numdam scan][WII]. Printed page = one-based PDF page + 135.
* **[LV] Brian Lawrence and Akshay Venkatesh**, *Diophantine problems and p-adic period mappings*, arXiv:1807.02721 **v3**, 25 October 2019; published in Inventiones Mathematicae **221** (2020). [Public v3 PDF][LV]. The locators here refer to the preprint; printed and one-based PDF pages agree.
* **[AV] J. S. Milne**, *Abelian Varieties*, course notes, **version 2.00**, 16 March 2008. [Public notes][AV]. Chapter I is geometric and Chapter II arithmetic; printed page = one-based PDF page − 6.
* **[DM] Pierre Deligne**, *Formes modulaires et représentations l-adiques*, Séminaire Bourbaki, exposé **355**, 1968/69, pp. 139–172. [Public Numdam scan][DM]. Printed page = one-based PDF page + 137.
* **[S] Takeshi Saito**, *Hilbert modular forms and p-adic Hodge theory*, arXiv:math/0612077 **v2**, 11 December 2006. [Public v2 PDF][S]. Printed and one-based PDF pages agree. The theorem numbers and the monodromy normalization discussion here refer to this preprint, rather than assuming the 2009 journal edition has the same pagination or formulas.
* **[DFG] Fred Diamond, Matthias Flach and Li Guo**, *Adjoint motives of modular forms and the Tamagawa number conjecture*, arXiv:2512.02348 **v2**, December 2025. [Public v2 PDF][DFG]. Printed and one-based PDF pages agree. In particular, Lemma 5.7 is on pp. 58–59 of this expanded preprint; these are not page locators for the differently numbered 2004 journal article.
* **[C] Henri Carayol**, *Sur les représentations l-adiques associées aux formes modulaires de Hilbert*, Annales scientifiques de l'École normale supérieure (4) **19** (1986), pp. 409–468. [Public Numdam scan][C]. Printed page = one-based PDF page + 407.

[WI]: https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf
[WII]: https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf
[LV]: https://arxiv.org/pdf/1807.02721v3
[AV]: https://www.jmilne.org/math/CourseNotes/AV.pdf
[DM]: https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf
[S]: https://arxiv.org/pdf/math/0612077v2
[DFG]: https://arxiv.org/pdf/2512.02348v2
[C]: https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf
