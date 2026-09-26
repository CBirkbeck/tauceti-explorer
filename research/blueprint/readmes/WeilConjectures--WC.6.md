# Weil conjectures and cohomological zeta functions: broader geometry and realizations

This part combines the weight and cohomology theories supplied by other roadmaps. Its new mathematics consists of two consumer theorems: integral degree factors for smooth proper schemes, without a projectivity hypothesis, and a bound on the weights of reciprocal zeros and poles of mixed sheaf L-functions. The cohomology, trace formula, weight formalism, and crystalline comparison are imported. They are not reconstructed here.

The blueprint is partial. The statements and source passages below determine the consumer requirements, but several supplier interfaces lack declaration-level exports. In particular, the existing WC.3 integral-factor node has a projective hypothesis, whereas this part needs its generic algebraic argument. That difference is a genuine dependency gap, not permission to use a stronger theorem implicitly.

## Conventions and objects

Write q=p^f with p prime and f positive. All schemes are over F_q; X means the geometric base change of X_0. The coefficient prime ell differs from p. Constant-coefficient results use Q_ell. For a mixed constructible sheaf, work over Qbar_ell with descent to a finite coefficient extension E/Q_ell. The finite-coefficient-to-adic construction, finiteness, coefficient change, and geometric Frobenius belong to the PR196 cohomology roadmaps, integrated through SchemeAndStackFoundations:SF.2.

Use geometric Frobenius on etale cohomology with the convention for which its eigenvalue on Q_ell(-1) is q. Thus the Tate twist (1) multiplies eigenvalues by q^(-1) and decreases weight by two. All-power statements use F_q^r on the same constructed cohomology, not an unrelated Frobenius for each extension.

The arithmetic zeta function is the point-count exponential, equivalently the closed-point Euler product. The sheaf L-function has local factor

\[
\det(1-T^{\deg x}F_x\mid\mathcal F_{\bar x})^{-1}.
\]

These definitions and their equivalence with the exponential trace series belong to PR196 TraceFormula 13–14. The cohomological determinant expression is a theorem about those functions, never their definition. At a closed point of degree m, F_x is the geometric q^m-Frobenius on its stalk; the exponent m occurs on T as displayed. For a rational point over F_(q^r), do not apply an additional r-th power to an endomorphism already defined as q^r-Frobenius.

For a finite-dimensional Frobenius space put P_i(T)=det(1-TF_i). In a chosen basis this is the pinned `Matrix.charpolyRev`, not a newly defined determinant. Its value at zero is one; its linear coefficient is minus the trace. A root beta of P_i is the reciprocal of a nonzero Frobenius eigenvalue alpha. The statements distinguish roots and reciprocal roots throughout. Rational identities live in the existing `RatFunc` carrier. Finite-field analytic continuation means rationality in T, not analytic continuation of global number-field L-functions.

There are no newly owned definitions or constructions in this packet. Consequently there is no invented cohomology structure, no new zeta type, and no definition API to duplicate. The suppliers must provide the actual objects and their APIs. Six pinned baseline declarations are recorded, with their statements read in source: `Matrix.charpolyRev`, `Matrix.eval_charpolyRev`, `Matrix.coeff_charpolyRev_eq_neg_trace`, `RatFunc`, `AlgebraicGeometry.Scheme.ellAdicSheaf`, and `AlgebraicGeometry.Scheme.EllAdicCohomology`. The last two already construct the integral pro-etale coefficient sheaf and additive cohomology groups, including an empty-scheme subsingleton instance. They are not replanned. The missing export is the comparison with the finite-dimensional rational Frobenius representation and compact-support theory, not the existence of any ell-adic cohomology carrier. Neither a determinant API nor projective-point cardinality infrastructure supplies that comparison.

## WC.6: smooth proper integral factors

The stable node `WeilConjectures:WC.6/purity-for-proper-smooth-varieties` is retained, as required by accepted RS-17. It now names the consumer theorem
`TauCeti.AlgebraicGeometry.WeilZeta.exists_unique_integral_degree_factors_of_smooth_proper`.

For X_0 smooth proper of finite type over F_q and dimension at most d, there is, in every degree i, a unique P_i in Z[T] whose image in Q_ell[T] is

\[
\det(1-TF_q\mid H^i(X,\mathbf Q_\ell))
\]

for every ell different from p. There is no projectivity, geometric-connectedness, or semisimplicity assumption. The polynomial is one above degree 2d; for the empty scheme every factor is one. Its normalization, multiplicities, and independence of ell are parts of the single integral-factor assertion.

The proof is an application of three owner exports. First SF.2 supplies actual finite-dimensional cohomology, proper agreement between ordinary and compactly supported cohomology, and the all-power trace/determinant theorem; WC.1 supplies normalized rational descent of the arithmetic zeta function with integral power-series expansion. Second the purity assertion in DWP.7's existing `hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11` supplies algebraic eigenvalues whose every complex conjugate has absolute value q^(i/2). Finally WC.3 extracts the weight-i factor of the common rational zeta function. Distinct weights prevent cancellation; Galois stability and normalized integral factorization give the integral polynomial, retaining multiplicities. Injectivity of coefficient extension gives uniqueness.

The source is Deligne, Weil II 3.3.9, together with the proof of Weil I 1.7 implies 1.6. The latter argument is algebraic after the cohomological identity and purity are supplied. The current integrated WC.3 node, however, states its theorem only for projective smooth X. The request is to export the generic argument required by RS-17, not to copy it into WC.6 or to apply the projective theorem to a nonprojective scheme.

### Valuation and hypothesis boundaries

The old integrated node combined purity, factors, valuation triangles, and the dualizing-complex extension. Its identifier is preserved, while those distinct supplier outputs remain explicitly accounted for here rather than disappearing during refinement.

For a Frobenius eigenvalue alpha of weight w and an additive valuation v with v(q)=1, the pair is

\[
(r,s)=(v(\alpha),v(q^w/\alpha)),\qquad r+s=w.
\]

It is not `(v(alpha),v(q/alpha))`. At weight zero and alpha=1 the correct pair is (0,0). The incorrect formula would give (0,1). This is a stale integrated-node error already identified by RS-17, not an error in Deligne's source.

Weil II's printed diagram on page 206 gives, for constant coefficients in degree i on a dimension-d scheme, the compact-support triangle below r+s=i and the smooth ordinary-cohomology triangle above it. If i<=d these lie in the square [0,i]^2; if d<=i<=2d they lie in [i-d,d]^2. For smooth proper schemes both bounds apply and the pair lies on the diagonal r+s=i, with

\[
\max(0,i-d)\le r,s\le\min(i,d).
\]

These statements are imported from the DWP.7 node, not new WC lemmas. The normalization detects the Tate line, ordinary elliptic slopes (0,1), and supersingular elliptic slopes (1/2,1/2). Complex weight does not determine an individual p-adic slope. No assertion about roots of unity is inferred from equality of a single p-adic slope.

Dropping properness replaces equalities by the relevant ordinary or compact-support bounds. Dropping smoothness removes the smooth duality input. Weil II 3.3.11 gives an extension when the dualizing complex has the stated Tate-twist/shift form; it is not a theorem for every singular proper scheme. Its functional-equation consumer requires actual duality pairings from EtaleDualityAndPerverseSheaves and the WC.2 determinant-sign theorem. That declaration-level consumer is a remaining task. Weil II 3.3.10's real-iota variant must not inherit the extra algebraic-integrality lower bounds from integral mixedness.

### Finite-field crystalline agreement

Import the three exact RD.7 nodes `rigid-crystalline-comparison`, `frobenius-compatibility-of-comparison`, and `ell-adic-comparison-smooth-proper`. Their statements apply to smooth proper X, without projectivity. The first is a rational comparison

\[
H^i_{\rm rig}(X/K_0)\simeq H^i_{\rm crys}(X/W(\mathbf F_q))\otimes K_0.
\]

It does not identify integral lattices or retain crystalline torsion. With sigma the Witt Frobenius, crystalline phi is sigma-semilinear; phi^f is K_0-linear because sigma^f is the identity. The determinant uses phi^f. On a Tate basis vector e, phi(ae)=p sigma(a)e, so phi^f acts by q. Over F_4 the degree-two projective-line factor is 1-4T, not 1-2T.

The RD determinant agrees with the coefficient image of the unique integral P_i above. This is a transitive comparison test, not a second copy of the RD theorem. The rational rigid–crystalline proof and its Ogus coefficient extension retain the proof-access gaps already recorded by RD. No characteristic-zero lift or de Rham comparison is used to identify finite-field Frobenius. Equality of dimensions in a lift would not suffice.

## WC.6: mixed L-function divisor weights

The second node is `mixed-l-function-divisor-weights`, with proposed declaration
`TauCeti.AlgebraicGeometry.WeilZeta.reciprocal_divisor_weight_le`.

Let X_0 be separated finite type of dimension at most d, and let F_0 be constructible, descending to a finite E/Q_ell, mixed of integral weights at most n in the all-conjugates sense. If beta is a nonzero zero or pole of the **reduced** rational L-function, then alpha=beta^(-1) is algebraic over Q and has an integer weight w<=n+2d. Every complex conjugate of alpha has absolute value q^(w/2).

Apply the compact-support determinant identity to the actual arithmetic L-function. Cohomology vanishes outside degrees 0 through 2d. A root surviving cancellation in a finite product is a root of a constituent determinant. Its reciprocal is an eigenvalue in some H_c^i. Weil II 3.3.4, imported through DWP.7's `cohomological-bounds-3-3-2-3-3-6`, gives w<=n+i<=n+2d. Cancellation removes divisor points; it cannot create new ones.

The result neither separates cohomological degrees nor asserts integral or ell-independent individual factors. On a point, the rank-one scalar q^(-1) has weight -2 and factor 1-q^(-1)T. On G_m with constant coefficients, Z=(1-T)/(1-qT): the reciprocal zero has weight zero, whereas H_c^1 has cohomological degree one. These examples prevent an illicit reuse of smooth-proper degree purity. The zero sheaf and the empty scheme have L=1 with empty divisor. Twisting by (1) replaces T by T/q, not qT.

The coefficient bridge is a precise SF.2 request: combine PR196 TraceFormula 14 with the finite-extension coefficient descent required by DWP's mixed-sheaf carrier. The proof of the general trace theorem is not claimed to have been reconstructed here. SGA 4 1/2 Rapport 3.1–3.7 supplies the read source passage for the determinant identity and the reason compact support occurs. Its original variable is t with q=p^f; use T=t^f when comparing its formula with this document.

## WC.7: mathematical acceptance matrix

The reviewed library audit calls WC.7 a process layer. The issue prohibits nodes for such a layer, while accepted RS-17 expressly preserves its mathematical examples. Accordingly WC.7 has no new nodes or planets. The packet proposes removal of the aggregation star only after its complete mathematical matrix is retained on the relevant consumer stages. Until that reconciliation is accepted, coverage remains partial. The examples below are obligations, not a claim of completed geometric realization.

| Test | Exact zeta-facing assertion | Supplier or failure detected |
|---|---|---|
| Empty scheme, zero sheaf | Z=1; L(0)=1; all zero-dimensional determinant factors equal 1 | PR196; prevents an invented root or weight in the empty spectrum |
| Projective space | P_(2j)=1-q^j T, P_(2j+1)=1; Z is the inverse product of the even factors; counts sum q^(jr) | PR196 TraceFormula 12–13 constructs hyperplane classes independently of the trace formula |
| Transitive finite etale scheme | Spec F_(q^m) has P_0=1-T^m; N_r=m if m divides r, otherwise 0 | PR196 finite Frobenius sets; SGA Rapport 3.4–3.5; not m rational components |
| F_4 projective line | Crystalline phi=2 sigma, phi^2=4; P_2=1-4T | RD.7; detects a determinant taken before linearizing Frobenius |
| Multiplicative group | Z=(1-T)/(1-qT), from H_c^1 eigenvalue 1 and H_c^2 eigenvalue q | PR196 localization and DWP.10; ordinary H^1 instead has eigenvalue q and must not replace H_c^1 in this formula |
| Tate twist | L(F(1),T)=L(F,T/q) | DWP.10 and PR196; detects the inverse convention |
| Jordan block | A rank-two unipotent block has factor (1-T)^2 and trace of every positive power equal to 2 | DWP.10; determinants do not imply semisimplicity |
| Curve and elliptic curve | Z=P_1/((1-T)(1-qT)); genus g gives degree 2g; elliptic P_1=1-aT+qT^2 | PR196 TraceFormula 8,15, existing curve/elliptic suppliers and WC.3; no second H^1 construction |
| Elliptic all-power recurrence | S_0=2, S_1=a, S_r=aS_(r-1)-qS_(r-2); N_r=q^r+1-S_r for every r>=1 | WC.5; a one-field count is insufficient |
| Product of projective lines | P_2=(1-qT)^2, P_4=1-q^2T, P_0=1-T; N_r=(q^r+1)^2 | PR196 Kunneth; Z(X times Y) is not generally Z(X)Z(Y) |
| Signed functional equation | Z(P^2,1/(q^2T))=-q^3 T^3 Z(P^2,T) | WC.2; detects an unsigned multiplier |
| Negative Euler characteristic | For a genus-two curve, chi=-2 and Z(1/(qT))=q^(-1)T^(-2)Z(T) | WC.2; powers must support integer exponents |
| Nonprojective smooth proper input | The same canonical integral P_i agrees with the etale and RD factors on an actual nonprojective example | DWP.10 and RD.7; an abstract assumed realization or only projective examples do not pass |
| Poles and all powers | The same degree factors supply the rational divisor and the full extension-count sequence; use WC.5's recurrence/pole interface, not a count at r=1 | WC.1, WC.3, WC.5; multiplicities cannot be discarded |

The suggested file gives eight algebraic convention tests on existing matrices and rational functions. Its genus-two reciprocal-polynomial test is not asserted to be the zeta function of an actual curve. A continuation must connect the matrix and polynomial tests to the geometrically constructed suppliers. It must also attach the exact curve, elliptic, and nonprojective instances and their source proofs; assigning every example a hypothetical cohomology space would not meet this requirement.

## Source scope and corrections

The packet records public URLs, read passages, access dates and hashes. Deligne Weil I 1.1–1.14.3 and Weil II 3.3.1–3.3.11 were read for the applications. The latter's valuation diagram was inspected as an image. SGA 4 1/2 Rapport 2.11 and 3.1–3.7 were read, including the determinant algebra and the derivation of the displayed formula from the trace theorem. The geometric proof of that trace theorem belongs upstream. Kedlaya's Notes on isocrystals 8.1–8.8, 9.1–9.7 and 10.1–10.3 supply the comparison and normalization boundaries; the cited Ogus proof remains an owner gap.

The p-adic Weil II preprint's section 6.6 was collated against published section 5.3, pages 1445–1446. Four source records distinguish their versions:

1. Deligne's proof of 3.3.5 refers to 3.3.3 where the upper-weight assertion of 3.3.4 is needed. The dual sheaf need not be integral. This cross-reference issue was already noted in the integrated weight material.
2. The p-adic functional-equation display omits q^(-n) inside P_i. The omission survives in the published paper. Duality gives P_(2n-i)(T)=c T^(b_i) P_i(q^(-n)T^(-1)), with c=(-1)^(b_i)q^(n b_i)/det(F_i). Projective space of dimension one detects the missing scaling immediately.
3. Trace and finiteness alone give determinant factors over the coefficient field, not integral individual factors. The published rationality argument retains the preprint's shortcut. Normalized rational descent supplies the existential rational representation; smooth-proper purity plus WC.3 supplies the actual degree-factor integrality.
4. The preprint proof writes the wrong coefficient object in its final injection. The published proof of Theorem 5.3.2 corrects it to E. It must not be reported as an uncorrected error in the published theorem.

The last three correspond to existing RD source issues E63, E64 and E62 respectively. This part adds published-version evidence without editing the RD packet or claiming new discovery. The author's publication page and errata searches found no correction for the surviving display and proof shortcut; that is a bounded search result, not proof that none exists.

## Closure and continuation

The dependencies are acyclic in the intended ownership direction: PR196/SF.2 supplies cohomology and trace; DWP supplies weights; WC.1 and WC.3 supply rational and integral factor extraction; RD.7 imports those inputs and supplies finite-field comparisons; WC.6 applies them. There is no reverse dependency from RD.7 to WC.6. The exact combined graph must be checked again when stage requests become declaration IDs.

The two theorem nodes remain unchecked plans. Four requests cover WC.3 generic extraction, WC.1 rational descent, SF.2 coefficient/cohomology integration, and DWP.10 realized tests. The three gaps record actual carrier/owner closure, the remaining functional-equation and dualizing-complex consumers, and the WC.7 process/display reconciliation. Both stages remain partial. The missing cohomology signatures are omitted from the suggested file rather than encoded by proposition fields containing the desired conclusions.

The next work is therefore concrete: refine the owner exports, write the two signatures against actual carriers, complete the duality consumer, attach the genuine example realizations, and replace each stage prerequisite with an exact declaration or a justified remaining gap. The general purity, trace, and crystalline-comparison proofs stay with their existing owners.
