# REV-FIX-RT-BP-EllipticCurveModularity~2

Verdict: **accepted**, with the corrections below. All five confirmed findings
are resolved. The packet remains **partial**: its eleven supplier requests and
two recorded gaps remain open. This verdict accepts the fixes and their proof
outlines; it does not certify implementation or a closed dependency graph.

Codex — `codex-Ds9t4O`; issue #5718; 7 October 2026.
Base: `f87edf62b855826d21bccf1c457fa7eeca23fa9c`.
Reviewed Claude `claude-deuavf`'s FIX #5717,
[PR #6712](https://github.com/CBirkbeck/tauceti-explorer/pull/6712), merged as
`6975532bdcf948989c879363e3780047dc48f01a`.

I did none of that fix, the original blueprint, the red-team report, its
verification, or the earlier reviews. This review follows
`independent-review-REV-FIX-RT-BP-EllipticCurveModularity`, dated 2 October and
marked `needs_changes`. Its review object is preserved verbatim in
`reviewHistory`, alongside the original blueprint review. I read the confirmed
findings, their verifier's qualifications, the earlier review and the round-two
fix report before checking the packet, suggested file and reader.

## /1 — cross-level strong multiplicity one

**Accepted.** The duplicate local node is absent. Its replacement is an explicit
request to upstream ModularForms Layer 5 and an imported contract in the
suggested file. The requested theorem compares normalized weight-two newforms
of arbitrary nonzero levels, with trivial character, agreeing at almost all
primes outside the product of those levels. Both inputs remain newforms. The
level-11/22 oldform regression is retained.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, I read
`HeckeRing.GL2.Newform` and
`Newform.eq_of_forall_notMem_eigenvalue_eq`. The latter fixes level and weight,
requires equal characters, and assumes agreement at all coprime positive
indices outside a finite set. It supplies neither the cross-level theorem nor
the prime-only variant used here. The request does not misrepresent it as
doing so. The Layer 5 text and reviewed AUDIT-16 entry agree on this boundary.

The change from an initial level dividing N to an initial level **N** is sound
for the revised construction: the exact-level newforms already supplied by
R27.6 are the witnesses selected by pigeonhole. I read the supplier's
`finite-flat-weight-two-export`; it does not assume elliptic-curve modularity.
Serre's original lifted-eigenform route can first have primitive level dividing
N, as the packet explains. The general attached-newform theorem still proves
exact conductor separately, and the quotient converse still starts at an
arbitrary level N′ and returns a divisor M of N′. No arbitrary-level constructor
or API dependency cycle is introduced.

## /2 — supplier prerequisites

**Accepted, with a character qualification corrected here.** Every surviving
supplier/consumer pair from the verified finding is explicit. All **26**
`requests.supplier`/`neededBy` pairs have the supplier in the consumer's ordinary
`prerequisites`. The old `upstreamPrerequisites` encoding, packet import links
and checker-workaround gap are removed; the current checker recognizes these
upstream IDs as stages.

The finer supplier citations are appropriate. I read the statements and
hypotheses of the finite-flat torsion and weight-two criterion; Deligne–Serre
lifting; the R27.6 export; R19.1's rank-two realization, R19.4's conductor/local
factor comparison and R19.6's individual quotient Tate comparison; the R28.4
and R28.6 semisimplicity, Tate–Hom, isogeny and finiteness nodes; and R14.5–R14.6's
quotient dimension, J₀/J₁ comparison, rational Tate exactness, differentials,
nonconstant composite and cusp-normalized Abel–Jacobi statements. These are
imports, not new local constructions. The R14.5 stage request correctly keeps
the missing decomposition of the **whole J₀**, rather than claiming that the
individual-quotient comparison supplies it.

One request still said that conjugation preserves a newform's character in
general. ModularForms Layer 8G instead gives the conjugated character. I
restricted the request to weight two and **trivial nebentypus**, the case both
consumers use, with the coefficient-embedding law stated explicitly. Trivial
character is preserved under conjugation. This changes no consumer theorem or
reader argument.

The prerequisite checks found no cycle. Following the current blueprint nodes
recursively, with baseline references and stage requests as boundary inputs,
gives 2,080 reachable nodes and 6,595 node-to-node edges. This does not claim that
all those supplier plans are closed. Projecting this packet's prerequisites to
stages and adding them to the current atlas graph adds 35 distinct edges;
the resulting graph has 2,234 endpoint vertices and 3,543 edges and is acyclic.

## /3 — whole-Jacobian multiplicities and the quotient converse

**Accepted.** The requested decomposition is over Galois orbits and includes
the divisor multiplicity σ₀(N′/M). The individual A_f comparison preserves its
coefficient field and dimension 2[K_f:ℚ]. Neither multiplicities nor restriction
of scalars are discarded.

I checked the three new nodes and the eight restated nodes. The converse now has
the missing argument:

1. Faltings semisimplicity and Tate–Hom, together with the requested
   End_ℚ(E)=ℤ, give a simple rational Tate module with scalar commutant. For the
   finite-dimensional image algebra, faithful simplicity and Wedderburn give
   the full matrix algebra. Extending scalars therefore preserves
   irreducibility. This includes geometrically CM curves over ℚ; the analogous
   assertion over a field containing their CM field would fail.
2. Surjectivity J₀(N′)→E gives a surjection on rational Tate modules. The old/new
   isogeny decomposition yields a nonzero map from one A_f summand. The
   J₀-to-J₁ quotient isogeny lets the proof use the supplier's Tate realization.
3. Over an algebraic closure of ℚ_r, the coefficient field splits by its
   embeddings. A nonzero map from one two-dimensional component to the
   absolutely irreducible two-dimensional target is an isomorphism.
4. Fixing an embedding ℚ̄→ℚ̄_r descends the selected coefficient-field embedding
   to ℚ̄: its image consists of elements algebraic over ℚ and lies in that
   embedding's algebraically closed image. Injectivity transfers the integral
   Frobenius traces. The supplier constructs the conjugate newform; no
   discontinuous automorphism is applied to an analytic series.
5. The attached-newform results give integer coefficients, exact conductor and
   every local factor for this form. They do not depend on the existence of
   Serre witnesses. I checked the local prerequisite closures of both
   `isogeny-to-E` and `newform-from-a-modular-quotient`: neither reaches the
   witnesses, the existence theorem or `newform-of-E`.

The matching reader contains these steps and the correct multiplicity. Exact
genus arithmetic gives g(X₀(11))=1 and g(X₀(22))=2; f(q), f(q²) are independent
and exhaust the level-22 space. Thus its Tate module has dimension four, rather
than the two given by the rejected formula. The coefficient-field regression
at level 23 is also sound: the
[newform orbit 23.2.a.a](https://www.lmfdb.org/ModularForm/GL2/Q/holomorphic/23/2/a/a/)
has field ℚ(√5) and a₂=(−1±√5)/2. The attached-newform rationality theorem
excludes an elliptic quotient; the proof does not assume that a coefficient
prime has degree one.

The restated bad-factor proof uses **arithmetic Frobenius on Tate-module
coinvariants**, equivalently geometric Frobenius on invariants of the dual.
This matches R19.4 and Mathlib's local polynomial. Arithmetic Frobenius on
Tate-module invariants would give the wrong split multiplicative factor.
Exact conductor uses the all-place comparison, not only equality of good
traces. The three modularity formulations and their implications, and the
L-function transfer after equality of all finite factors, are consistent in the
packet, reader and suggested signatures.

## /4 — discriminating exceptional-prime tests

**Accepted.** Independent exact integer and rational arithmetic gives:

| Curve, using Cremona labels | c₄ | Δ | Behavior at p=7 |
| --- | --- | --- | --- |
| 11a1 | 496 | −11⁵ | neither extra clause; 7∉Σ_E |
| 26b1 | 129 | −2⁷·13 | both extra clauses; 7∈Σ_E |
| 274a1 | 337 | −2⁷·137 | valuation clause only; 7∈Σ_E |
| 162b1 | 225 | −2³·3⁴ | rational-isogeny clause only; 7∈Σ_E |

All four models are good at 7. Point counting at 3 gives a₃=−1 for 11a1 and
a₃=−2 for 274a1; their mod-7 Frobenius discriminants are respectively 3 and 6,
both nonsquares. Neither has a rational cyclic 7-subgroup. The relevant
multiplicative j-valuations are −5 at 11 for 11a1 and −7 at 2 for 274a1.

The six nonzero multiples of (1,0) on 26b1 are (1,0), (−1,−2), (3,−6),
(3,2), (−1,2), (1,−2), followed by O. For 162b1 the irreducible cubic
g=x³−3x²+3 divides ψ₇ exactly. Reducing the duplication map modulo g gives
x([2]P)=(2x−3)/(x−1); g divides the numerator of g(x([2]P)), and no root is
fixed. Its roots are the three pairs of nonzero points of a Galois-stable
cyclic subgroup of order seven. The model is multiplicative at 2 with
v₂(j)=−3, and additive at 3, so the valuation clause does not add 7.

These tests now separately detect deleting either substantive clause, deleting
both, and over-including primes. Their names and assertions occur in both
packet and suggested file. I also checked all nine fixtures' nonzero
discriminants, the order-five point on 11a1, agreement of the three 11a curves'
good traces through 31, the negative-one twist relation at those odd primes,
and a₃=−3 for 37a1. The parametrization-degree expectations agree with the
public records for
[11a1](https://www.lmfdb.org/EllipticCurve/Q/11/a/2),
[11a3](https://www.lmfdb.org/EllipticCurve/Q/11a3/) and
[37a1](https://www.lmfdb.org/EllipticCurve/Q/37/a/1): 1, 5 and 2.
These are mathematical checks of proposed tests, not formal proofs of them.

## /5 — suggested-file coverage and carriers

**Accepted, with the compilation boundary recorded accurately.** All **23 API
items and 19 unit tests** are typed declarations with the packet's names,
instead of a comment inventory. Each definition/construction has at least
three tests. `IsNewformOf` uses the pinned newform carrier, character and actual
q-expansion coefficients; `exceptionalPrimes` uses the existing reduction
predicates and the finite cyclic Galois-stable subgroup condition;
`modularParametrisation` is the actual proposed composite. Missing supplier
objects are typed interfaces whose docstrings identify their owners. No
unknown condition is encoded by a proof-placeholder-valued proposition and no
test concludes `True`.

The residual witness includes its newform and coefficient prime, the residual
comparison is equivariant and spans after scalar extension, and the determinant
signature uses the cyclotomic character. The newform constructor is at the
conductor, the arbitrary-level attached predicate has independent conductor
and Tate comparison theorems, and both directions of the curve/Jacobian
implications are typed. The analytic signature agrees with the Dirichlet series
only in its convergence half-plane, so it does not identify Mathlib's raw
`tsum` with the entire continuation outside that domain.

I ran `lean-check` on the submitted file after checking memory. It stopped at
the import because the shared pinned build lacks
`TauCeti.NumberTheory.ModularForms.Newforms.Newform.olean`. **The submitted
file did not elaborate.** No build, cache acquisition or language server was
started. I separately extracted its unchanged Mathlib-only definitions and
signatures: the Galois point map, reduction predicates, cyclic-subgroup
predicate, residual/Tate interfaces, exceptional set and R29.1 signatures,
all nine curves and their ellipticity instances, exceptional-prime tests,
root-of-unity lemma, pigeonhole and norm signatures. That fragment elaborated
with only proof-placeholder warnings. It contains no substitute Newform
structure and does not validate the omitted Tau Ceti-dependent portion. The
fix author's stub compilation is disclosed in its report and is not treated
as a compilation of the submitted file here.

## Corrections, sources and validation

This review changes only the packet and this report, plus its required handoff:

- restrict the Layer 8G request to the trivial-character case;
- replace all sixteen baseline `checked` records with fresh statement checks,
  removing the inherited present-tense claim that the suggested file elaborates;
- append the fresh source readings and matching hashes to the source records;
- preserve the preceding review and install this verdict.

All sixteen baseline declarations were read in their source modules at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or the Tau Ceti pin above.
In particular, the norm theorem's domain/free-finite hypotheses, integer
divisibility bound, finite-fiber theorem, subgroup-dependent cusp forms and
Weierstrass local-polynomial/L-function conventions fit their uses. I read the
relevant reviewed coverage entries for R01.6, R14.5, R19.6, R27.6, R28.6 and
upstream ModularForms Layer 5, and RS-06's ownership decisions. Full upstream
documents read were `JacobianChallenge/README.md` and
`ArithmeticDirichletSeries/README.md`; the relevant ModularForms and
EllipticCurves layers were also read. R29 has distance nine, so this is a
target-level plan under `detail.json`.

Fresh public PDF downloads on 7 October match all five packet SHA-256 values:

| Source | Passages checked |
| --- | --- |
| [Serre, Duke 54 (1987)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf) | §2.8, pp. 189–190; §2.9, pp. 191–192; §3.1 lifting, pp. 194–195; §3.3, p. 198; §4.6–4.7, pp. 207–209 |
| [Faltings, Inventiones 73 (1983)](https://math.uchicago.edu/~drinfeld/Deligne%27s_conjecture_Manin_conf/Faltings_argument/Faltings.pdf) | §5, Satz 3–4 and Korollar 1–2, pp. 360–361 |
| [Carayol, ENS 19 (1986)](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) | §0.1–0.9, pp. 409–411 |
| [Deligne–Serre, ENS 7 (1974)](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) | Lemme 6.11, proof and Variante, p. 522 |
| [Cremona, Chapter II](https://johncremona.github.io/book/fulltext/chapter2.pdf) | §§2.6–2.7, pp. 25–26; §2.15.1, p. 47 |

The existing excerpts match the mathematical content; spacing differs between
OCR extractors. No new source erratum is claimed.

`python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularity.json`
passes with **0 errors, 0 warnings**: 23 nodes, 23 API items, 19 tests, seven
planets, sixteen baseline declarations, eleven requests, two gaps and six
planned stages. There is no link map or restructuring proposal under review.
Request coverage, declaration-name inventory, acyclicity, the local
non-circularity checks, reader agreement and exact numerical computations pass.
The suggested file was not changed by this review.

The remaining End_ℚ(E)=ℤ owner gap is explicit: RS-06 assigns it to R28.6,
whose Hom node still assumes it. The unread sharp Mazur refinement is not
needed by the finite-exception argument. Keep these boundaries and the
whole-J₀ decomposition request visible. Serre's real-multiplication application
remains a separately scoped inherited target; this review does not supply its
proof. The FIX report's supplier-quotient example and completion-comparison
notes remain for their owners, outside this job's deliverables.
