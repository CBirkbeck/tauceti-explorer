# Hopf–Rinow, Part II: Riemannian curvature and comparison

**New design for issue #3069; six stages RG.0–RG.5; partial blueprint.** This extension begins after the existing metric, connection, exponential-map, normal-neighbourhood and first-variation programme. Its declaration-level contribution is the Jacobi/index/Riccati calculus in a fixed parallel model. The intrinsic comparison, global theorems and variational topology remain required work, not conclusions assumed by that model.

## 1. Ownership and conventions

HopfRinow owns the actual Levi–Civita connection and its regularity, along-curve covariant derivatives, geodesics, the interval-aware flow and exponential, Gauss lemma, minimization, completeness and first variation of half-energy. GeometricTopology Layer 7 owns curvature and the Riemannian volume measure. OptimalTransport Layer 7 owns the early cut-locus, injectivity-radius and volume-nullity interface. This roadmap imports these outputs, leaving their upstream files unchanged. It is registered as Part II of HopfRinow, not a competing basic Riemannian library.

This ownership has concrete consequences. We do not define a new distance, curvature tensor, volume measure or geodesic carrier. A parallel frame must be constructed from the actual along-curve connection. A theorem about a matrix differential equation does not by itself establish that a field along a manifold curve has that equation. The early cut-locus supplier must be separated from any transport theorem that in turn consumes comparison results; importing the entire transport programme would risk a cycle.

For geometry, use smooth finite-dimensional boundaryless real Riemannian manifolds and state connectedness, completeness and dimension bounds at each theorem. The analytic prefix instead works on actual functions into a real Hilbert space E. Its operator coefficient is an actual function K from the real parameter to continuous linear endomorphisms of E. The intended geometric value in a parallel orthonormal frame is R(−,gamma′)gamma′.

The conventions are

    J″ + K J = 0,
    I_K(V,W) = integral_a^b (inner(V′,W′) - inner(K V,W)).

The curvature sign agrees with a positive coefficient in the round-sphere normal Jacobi equation. The energy functional has a factor one-half; its Hessian, the displayed index form, does not. All integrals use existing Lebesgue interval integrals and are oriented. Positivity therefore requires a≤b, and statements detecting a field from its integral require a<b. The zero-length interval is a separate regression, not a source of positivity.

Regularity in the suggested file means C1 or C2 **at every point** of the closed interval, hence on suitable neighbourhoods of those points. It is not a within-derivative of an arbitrary off-interval extension. Derivatives and integrals are total in Lean; their fallback values do not prove regularity, integrability or geometry. The integrability lemma supplies the relevant analytic hypotheses before integral arithmetic is used.

## 2. Wronskians of actual fields

The definition `wronskian` is

    W(J,L)(t) = inner(J′(t),L(t)) - inner(J(t),L′(t)).

It uses existing derivatives and inner products; neither an ODE nor constancy is a field of a new data structure. The API consists of its evaluation formula, the sign change under exchanging J and L, and the zero self-pairing. These algebraic laws do not require the fields to solve any equation.

For C2 fields, differentiate both pairings with the pinned inner-product derivative rule. The mixed terms inner(J′,L′) cancel, giving

    W′ = inner(J″,L) - inner(J,L″).

Now suppose that J and L satisfy the same equation with pointwise symmetric K. Substitution gives minus inner(KJ,L) plus inner(J,KL), which is zero. The actual Wronskian is differentiable, and its derivative is the zero function on the interval, hence integrable there. The vector/scalar fundamental theorem on each subinterval [a,t] proves W(t)=W(a). No existence theorem for solutions is smuggled into this calculation.

The definition tests are W(t v,w)=inner(v,w), W(sin,cos)=1, and vanishing when the second field is zero. The trigonometric sign matters: the opposite order of the two derivative terms would give minus one. The same convention gives one for the sinh/cosh pair in the negative-curvature scalar model. Wronskian conservation is also the algebra underlying symmetry of a Riccati operator constructed from an appropriate Jacobi tensor, but that construction is a separate RG.2 obligation.

## 3. The index form and its Green identities

### Integrability and bilinear laws

`indexForm` is the displayed oriented integral. For continuous K and C1 fields, the fields and their actual first derivatives are continuous on the compact interval. Evaluation of a continuous operator on a vector and the inner product are continuous, so the density is continuous and interval integrable. The pinned continuous-integrability theorem supplies this final step.

For additivity in the first field, differentiate the actual sum, use linearity of K and bilinearity of the real pairing, then split the integral under the established integrability hypotheses. For constant real scaling, the scalar factors through differentiation, K, the pairing and the integral. Symmetry uses the pointwise identity inner(KV,W)=inner(V,KW). The definition itself does not impose symmetry of K. These properties yield the second-slot linear laws in the symmetric geometric regime.

The remaining API records evaluation, equal-endpoint zero and reversal of the interval. Tests give I_0(t v,t w)=inner(v,w) on [0,1]; scalar K=1 with both fields constantly one gives minus one; a collapsed interval gives zero; and the flat linear field integrated from 1 to 0 gives minus one. In particular, nonzero endpoint data may have negative index even in a comparison problem where a zero-endpoint positivity statement is valid.

### Smooth Green identity

Let V be C2, W be C1, and K be continuous. The existing derivative rule gives

    d/dt inner(V′,W) = inner(V″,W) + inner(V′,W′).

Rearrange, subtract the potential term, and integrate. The derivative pairing and both residual densities are continuous and integrable. The pinned fundamental theorem and integral-subtraction theorem give

    I_K(V,W) = [inner(V′,W)]_a^b
                 - integral_a^b inner(V″+KV,W).

This identity does not require symmetry of K. Its endpoint pairings cannot be deleted merely because the coefficient is a curvature operator or because one field solves a Jacobi equation.

For an actual solution J″+KJ=0, the residual integral vanishes. Consequently I_K(J,W) equals the boundary term. It is zero when W vanishes at both endpoints. This implication is all that is needed in the two-zero uniqueness proof below; a full characterization of the annihilator by arbitrary test fields, including weak regularity and jumps, remains part of the intrinsic variational programme.

### A corner contributes a jump

For two separately C2 pieces U on [a,c] and V on [c,b], with U(c)=V(c), apply the Green identity to each against the same C1 test field W. The internal endpoint terms combine to

    inner(U′(c),W(c)) - inner(V′(c),W(c))
      = -inner(V′(c)-U′(c),W(c)).

Thus the sum of the two index forms is the outer endpoint term, minus this right-minus-left derivative jump, minus the two residual integrals. Continuity of the pieces is retained for the interpretation as a broken field, although the two-interval algebraic identity itself only needs the shared test value.

For the scalar tent field U(t)=t on [0,1] and V(t)=2−t on [1,2], both pieces solve the flat equation and the derivative jump is −2. Against W=1, both index integrals are zero. The outer endpoint term is −2 and the jump correction is +2. Omitting the corner term gives the false result −2. This is the two-piece specialization of Ballmann's Proposition 3.7, whose general formula sums such jumps.

A complete intrinsic implementation still needs the finite-partition carrier, independence under refinement, matching traces and the correct one-sided derivatives. Differentiating a total piecewise function at its corner and treating its default derivative as the needed one-sided data would not prove that theorem.

## 4. Nonpositive coefficients and endpoint detection

Suppose inner(K(t)v,v)≤0 for every t and v. The density for I_K(V,V) is at least norm(V′) squared, so integral monotonicity gives

    I_K(V,V) >= integral_a^b norm(V′)^2 >= 0.

This estimate does not require an endpoint condition. It is a lower bound by **derivative** energy, not by position energy: a nonzero constant field for K=0 has index zero. Symmetry of K is unnecessary for this particular estimate, although the geometric curvature coefficient is symmetric.

Assume now a<b, V(a)=0 and I_K(V,V)=0. The derivative-energy bound forces the integral of the continuous nonnegative function norm(V′)^2 to be zero. If it were positive at any point of the closed interval, the pinned continuous strict-positivity theorem would make its integral positive. Hence V′ is zero throughout the interval. The vector-valued fundamental theorem on [a,t] gives V(t)=V(a)=0.

Continuity is doing real work: an almost-everywhere conclusion from an integral is not simply replaced by pointwise equality. The proof deliberately uses the actual continuous derivative before making that conclusion. A collapsed interval would not determine a field away from its sole point, which explains the strict endpoint inequality.

If J solves the Jacobi equation and vanishes at both endpoints, the boundary formula with W=J gives I_K(J,J)=0. The anchored detection theorem then gives J=0 throughout [a,b]. This is the fixed-frame no-two-zero theorem. It becomes a no-conjugate-point statement only after RG.1 has established the intrinsic Jacobi/exponential comparison.

The sign hypothesis is essential. With K=1, J(t)=sin(t) is nonzero but vanishes at 0 and pi. Its index on that interval is the integral of cos²−sin², which is zero. Positive-curvature Jacobi fields therefore supply a regression against dropping the coefficient condition. Conversely, the flat t and negative-curvature sinh models have the expected single zero and normalized initial derivative.

## 5. Riccati square-completion

Let S be an actual C1 field of symmetric continuous endomorphisms satisfying

    S′ + S composed with S + K = 0.

The equation is a concrete hypothesis to check for a constructed S; it is not a structure field asserting the desired index factorization. To differentiate S(t)V(t), use the pinned bounded bilinear evaluation derivative. Pairing with W gives

    d/dt inner(SV,W)
      = inner(S′V+SV′,W) + inner(SV,W′).

Expand inner(V′−SV,W′−SW). Its mixed terms cancel the corresponding terms in the displayed derivative using symmetry of S. The remaining operator term is S′+S², equal to −K. Hence the index density equals

    inner(V′−SV,W′−SW) + d/dt inner(SV,W).

Integrating and applying the fundamental theorem gives the exact factorization

    I_K(V,W) = integral_a^b inner(V′−SV,W′−SW)
                 + [inner(SV,W)]_a^b.

For W=V with both endpoints zero, the boundary disappears and the remaining integral is a squared norm. This proves Dirichlet nonnegativity even without assuming K nonpositive, provided the specified symmetric Riccati solution genuinely exists on the full interval with the stated regularity.

That last clause cannot be ignored. In the scalar positive-curvature model, S=cot(t) solves S′+S²+1=0 only away from its poles. It is not a C1 solution on [0,pi]. To construct S geometrically as Y′Y inverse, RG.2 must prove the actual Jacobi tensor equation, invertibility on the chosen domain and symmetry from its Wronskian condition. Neither division by a singular tensor nor a total inverse outside that domain may enter the factorization proof.

There is also a frame boundary. Rotate a constant vector in R² by a time-dependent orthogonal matrix, obtaining (cos t,sin t). Its norm remains one, but its derivative energy on [0,1] is one, whereas the original constant vector has derivative energy zero. An arbitrary orthonormal frame is therefore not a parallel frame. Its connection matrix changes the derivative formula. The local regression suite checks this failure; the roadmap's parallel-transport bridge supplies the correct interpretation.

## 6. The six-stage programme

**RG.0: fixed-model Jacobi/index calculus.** The eighteen nodes above use actual fields, derivatives, operators and integrals. They do not construct manifold geometry by fiat. All regularity and integrability hypotheses must be elaborated at the pin.

**RG.1: intrinsic Jacobi fields and second variation.** Construct the parallel orthonormal frame along the actual geodesic and identify ordinary derivatives with the owned covariant derivative. Identify its K with R(−,gamma′)gamma′ and prove symmetry using the owned curvature identities. Reuse first variation and half-energy from HopfRinow. Prove second variation for genuine two-parameter variations, including endpoint acceleration and broken-field terms, and the actual variation/ODE correspondence for Jacobi fields. Relate singularity of d exp to endpoint-vanishing Jacobi fields. This is not an identification of conjugate and cut times.

**RG.2: index lemma and comparison.** Construct invertible Jacobi tensors and their Riccati operators on their genuine domains. Prove the index lemma under absence of conjugate times in (a,b], including its equality case. Establish scalar and matrix comparison with explicit initial or singular-endpoint conditions. Derive Rauch comparison with matching initial data and the correct direction of curvature bounds; every theorem must state the interval before the relevant conjugate time. Derive the corresponding distance-Hessian statements only where distance is smooth, away from the basepoint and cut locus. The full Rauch proof and the fine-grained cut-locus dependency need further source decomposition.

**RG.3: global topology.** For complete connected boundaryless manifolds of dimension m≥2 with Ric≥(m−1)kappa g and a fixed kappa>0, prove the diameter bound pi/sqrt(kappa), compactness and finiteness of the fundamental group. Uniformity and dimension are hypotheses, not implicit properties of positive Ricci. For sectional curvature at most zero, prove the exponential map is a universal covering using the intrinsic Jacobi result, completeness of the pullback metric and the covering theorem for a complete local isometry. Simple connectivity of the target makes it a diffeomorphism. Without that assumption, a flat torus rejects global injectivity. Reuse Hopf–Rinow rather than proving a second completeness theorem from coordinate ODEs.

**RG.4: volume comparison.** Use the actual Riemannian measure, exponential polar Jacobian and volume-null cut locus. Establish the Jacobi determinant asymptotic and trace Riccati estimate, integrate radial density only before the cut time and extend it by zero afterwards. Prove the Bishop–Gromov ratio is nonincreasing and at most one, with positive ordered radii and the model radius below pi/sqrt(kappa) when kappa>0. State finite volume and change-of-variables prerequisites, and split monotonicity from equality/rigidity. A signed determinant continued through a conjugate point is not the volume density of the minimizing polar chart. The source's two slips listed below are not propagated into these targets.

**RG.5: variational topology.** Prove fixed-endpoint Morse index equals the sum of interior conjugate multiplicities, with final-endpoint multiplicity giving nullity rather than an additional negative direction. Construct the actual piecewise-Jacobi finite-dimensional reduction and its positive complement. Build compact-sublevel broken-geodesic approximations and the full deformation/minimax argument for a nonconstant closed geodesic on a compact connected boundaryless smooth manifold of positive dimension. Include the periodic-velocity condition of the free-loop problem; a fixed-basepoint critical loop does not automatically satisfy it. The point manifold is excluded, while the circle is an acceptance case. The entire minimax proof is not claimed checked by the present prefix.

## 7. Sources, corrections and verification boundary

The source spine consists of Werner Ballmann's author-hosted notes: *Critical Point Theory of the Energy Functional on Path Spaces* (January 27, 2015), *Riccati Equation and Volume Estimates* (March 9, 2016), and the 2003 *Global Riemannian Geometry* notes. Exact URLs and inspected passages are in the packet. The energy notes' printed pp.7,14,15, the Riccati notes' pp.4,6,9,10 and the global notes' pp.6–8 were rendered and inspected. Some other passages were read as parsed text; additional image attempts at energy pp.10 and 16 failed. No fresh PDF bytes or hash were obtained, and no whole-paper or book verification is claimed.

Two source slips are recorded against those author copies, awaiting independent review. Equation (17) of the 2016 notes prints N minus its cut locus as the normal-exponential target; it must be the ambient M minus the cut locus. The point submanifold in Euclidean space makes the distinction immediate. Corollary 5.4 on p.10 omits the factor m−1 in the Ricci lower bound for its stated radius. A round 3-sphere of radius sqrt(2) has Ric=g but diameter pi sqrt(2), disproving the printed diameter bound pi when kappa=1. The preceding Theorem 5.3 and the separate 2003 Theorem 2.2 already state the correctly normalized hypothesis. Limited author-page and exact-title correction searches found no separate erratum; that is not a claim of priority or exhaustive absence. Nothing was sent to authors.

The twelve Mathlib baseline declarations were inspected at commit 082e2d37e8b0463410cdb532e111cd43d5a66174, with file blobs in the packet. They supply the actual inner-product and operator-evaluation derivatives, interval integral arithmetic, continuity/integrability, strict positivity, monotonicity and the fundamental theorem. The source-derived proofs above are on those actual carriers, not a freshly invented ODE or field category.

Tau Ceti is pinned at f790474821cf4256814db967cb154e7af3d0c369. Its geodesic/along-curve infrastructure was read, including its documented chart-independence/coordinate-regularity boundaries. Current default-branch curvature files were found, but those paths returned 404 at the required pin. They are post-pin implementation leads for their existing owner, not entries in this packet's pinned baseline. This corrects the initial overly broad status description made while searching.

The aggregate reviewed library-coverage file returned empty content. The relevant HopfRinow, GeometricTopology Layer 7 and OptimalTransport Layer 7 texts and atlas identifiers were checked; limited keyword searches are not an exhaustive absence audit. A global atlas-cycle test has not run. The proposed early cut-locus interface therefore remains an explicit ownership/DAG gap to resolve before global integration.

The suggested file has 23 named declarations: eighteen node declarations plus five API-only lemmas. Its two definitions have nine API entries and seven definition tests, with three additional theorem-level checks. **The file is not Lean-compiled.** Local symbolic checks differentiate and integrate actual polynomial/trigonometric fields, with exact rational coefficients. Their 200 assertions verify examples and sign regressions, not the universal theorems or the intrinsic geometric bridge. Current-head repository validation is reported separately in the PR; a structural pass is not elaboration or independent mathematical review.

The immediate continuation is to elaborate the fixed-model identities and then construct RG.1's actual parallel-frame and second-variation comparison. Preserve endpoint and jump terms and avoid chart-dependent derivative substitutes. Complete the Jacobi tensor, singular-endpoint comparison, covering, polar integration and variational-topology proof chains before closing their respective stages. The six-stage programme remains partial until those named obligations are proved.
