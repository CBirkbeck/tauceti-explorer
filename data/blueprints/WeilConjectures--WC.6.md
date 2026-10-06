# Weil conjectures and cohomological zeta functions: broader geometry and realizations

This part combines the weight and cohomology theories supplied by other roadmaps. Its mathematics consists of smooth-proper integral factors and signed functional equations, the rational-homology-manifold and DM-stack extensions, mixed-sheaf divisor bounds, and zeta-facing geometric applications. The cohomology, trace formula, weight formalism, and crystalline comparison are imported. They are not reconstructed here.

The target-level pass is complete: both WC.6 and WC.7 are planned. Their prerequisite chains end in existing library declarations, exact supplier nodes, requested supplier stages or explicitly recorded gaps. Neither stage is closed, because several supplier interfaces lack declaration-level exports. In particular, the existing WC.3 integral-factor node has a projective hypothesis, whereas this part needs its generic algebraic argument. That difference is a genuine dependency gap, not permission to use a stronger theorem implicitly.

## Conventions and objects

Write q=p^f with p prime and f positive. All schemes are over F_q; X means the geometric base change of X_0. The coefficient prime ell differs from p. Constant-coefficient results use Q_ell. For a mixed constructible sheaf, work over Qbar_ell with descent to a finite coefficient extension E/Q_ell. The finite-coefficient-to-adic construction, finiteness, coefficient change, and geometric Frobenius belong to the PR196 cohomology roadmaps, integrated through SchemeAndStackFoundations:SF.2.

Use geometric Frobenius on etale cohomology with the convention for which its eigenvalue on Q_ell(-1) is q. Thus the Tate twist (1) multiplies eigenvalues by q^(-1) and decreases weight by two. All-power statements use F_q^r on the same constructed cohomology, not an unrelated Frobenius for each extension.

The arithmetic zeta function is the point-count exponential, equivalently the closed-point Euler product. The sheaf L-function has local factor

\[
\det(1-T^{\deg x}F_x\mid\mathcal F_{\bar x})^{-1}.
\]

These definitions and their equivalence with the exponential trace series belong to PR196 TraceFormula 13–14. The cohomological determinant expression is a theorem about those functions, never their definition. At a closed point of degree m, F_x is the geometric q^m-Frobenius on its stalk; the exponent m occurs on T as displayed. For a rational point over F_(q^r), do not apply an additional r-th power to an endomorphism already defined as q^r-Frobenius.

For a finite-dimensional Frobenius space put P_i(T)=det(1-TF_i). In a chosen basis this is the pinned `Matrix.charpolyRev`, not a newly defined determinant. Its value at zero is one; its linear coefficient is minus the trace. A root beta of P_i is the reciprocal of a nonzero Frobenius eigenvalue alpha. The statements distinguish roots and reciprocal roots throughout. Rational identities live in the existing `RatFunc` carrier. Finite-field analytic continuation means rationality in T, not analytic continuation of global number-field L-functions.

There are no newly owned definitions or constructions in this packet. Consequently there is no invented cohomology structure, no new zeta type, and no definition API to duplicate. The suppliers must provide the actual objects and their APIs. Nine pinned baseline declarations are recorded, with their statements read in source: `Matrix.charpolyRev`, `Matrix.eval_charpolyRev`, `Matrix.coeff_charpolyRev_eq_neg_trace`, `RatFunc`, `AlgebraicGeometry.Scheme.ellAdicSheaf`, and `AlgebraicGeometry.Scheme.EllAdicCohomology`. The last two already construct the integral pro-etale coefficient sheaf and additive cohomology groups, including an empty-scheme subsingleton instance. They are not replanned. The missing export is the comparison with the finite-dimensional rational Frobenius representation and compact-support theory, not the existence of any ell-adic cohomology carrier. Neither a determinant API nor projective-point cardinality infrastructure supplies that comparison.

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

Dropping properness replaces equalities by the relevant ordinary or compact-support bounds. Dropping smoothness removes the smooth duality input. Weil II 3.3.11 gives an extension when the dualizing complex has the stated Tate-twist/shift form; it is not a theorem for every singular proper scheme. Its functional-equation consumer requires actual duality pairings from EtaleDualityAndPerverseSheaves and the WC.2 determinant-sign theorem. The signed and dualizing-complex consumer declarations are specified below; their actual carrier and general pairing exports remain requested. Weil II 3.3.10's real-iota variant must not inherit the extra algebraic-integrality lower bounds from integral mixedness.

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


The three additional baseline references are the existing `WeierstrassCurve`, its discriminant `WeierstrassCurve.Δ`, and the affine membership predicate `WeierstrassCurve.Affine.Equation`. They support the explicit equation over F_5. A nonsingular equation over that field is not yet the same Lean object as its smooth proper scheme with etale cohomology; the supplier must prove that bridge. No general finite field is modeled as `ZMod q` for composite q. For instance F_4 is a degree-two extension of F_2, rather than the ring of integers modulo four.

### Signed functional equation on smooth proper schemes

The declaration `functional_equation_of_smooth_proper` applies to an actual smooth proper scheme of **pure** dimension d. Pure dimension is necessary for a single q^d similitude. The integral-factor assertion above instead permits a dimension bound and components of different dimensions. For this functional equation put

\[
b_i=\deg P_i,\qquad
\chi=\sum_i(-1)^i b_i,\qquad
\Delta=\prod_i\det(F_q\mid H^i)^{(-1)^i}.
\]

The theorem asserts, in Q(T),

\[
Z(X_0,1/(q^dT))=(-1)^\chi\Delta T^\chi Z(X_0,T),
\qquad \Delta^2=q^{d\chi}.
\]

Here chi is an integer. Both T^chi and q^(d chi) use integer powers; neither is truncated at zero. Delta is a nonzero rational number, obtained from the leading coefficients of the canonical integral factors. It is not replaced by an unspecified positive square root. In a degree with b_i=0 its determinant is one.

The source is Weil I 2.3–2.6, printed 281–282. It constructs the orientation twist, identifies the perfect pairing and its Galois compatibility, and relates eigenvalues in opposite degrees by alpha and q^d/alpha. EDC.2:pairings owns the genuine pairing; EDC.8 owns the reciprocal-polynomial and determinant identities. WC.2 owns the generic signed determinant-product theorem. This part applies those exports to the smooth proper integral factors, with no projectivity or Frobenius-semisimplicity hypothesis. The current integrated WC.2 correspondence-trace node is not the requested functional-equation declaration.

For P^2 the only nontrivial degrees are 0,2,4, giving chi=3 and Delta=q^3; the sign is negative. For a genus-two curve, chi=-2 and Delta=q^(-1), so the multiplier is q^(-1)T^(-2). Both checks take place in a rational-function field, where substitution by an inverse of T is defined. Ordinary substitution into the expansion at zero would not express the same operation. Disconnected pure-dimensional schemes retain the determinant of Frobenius on their components. The theorem makes no claim about analytic continuation of a global Hasse–Weil L-function over a number field.

### Proper rational homology manifolds

`weil_factors_of_dualizing_constant` is the exact consumer extension of Weil II 3.3.11. Let a:X_0→Spec F_q be proper finite type of pure dimension d. Instead of smoothness, require the actual identification

\[
a^!\mathbf Q_\ell\simeq\mathbf Q_\ell(d)[2d]
\]

in the coefficient category over F_q, for each coefficient prime in the comparison. It must be Frobenius equivariant; a bare isomorphism after forgetting the descent action does not normalize the functional equation. Exceptional inverse image, the constructible derived category and Verdier duality belong to EDC.1, rather than to a new WC structure.

DWP.7 applies the proper upper-weight bound and the duality lower-weight bound to this object. They meet in degree i. WC.1 and the same generic WC.3 extraction then give integral degree factors, and EDC.8/WC.2 give the signed functional equation. The hypothesis is a statement about the dualizing object and is independent of the desired purity conclusion. It does not require a field in a proposed cohomology structure asserting RH.

The source gives an etale-local finite quotient of a smooth d-dimensional scheme as an example satisfying the condition. This includes singular quotient examples once the supplier constructs their dualizing identification. A general proper singular scheme is not automatically a rational homology manifold. Smooth schemes recover the preceding assertions through EDC smooth purity. The general quotient calculation and its coefficient/Frobenius compatibility are imported rather than proved again here.

### Smooth proper Deligne–Mumford stacks

`pure_cohomology_of_smooth_proper_dm_stack` supplies the WC.6 input routed from Bergstrom–Faber–Payne. For a smooth proper finite-type DM stack over F_q, its actual H^i with Q_ell coefficients is pure of weight i, with geometric Frobenius and all complex conjugates. The statement does not require that the stack be a single global quotient. The local quotient and global quotient cases must not be conflated.

The proposed **Etale duality and perverse sheaves, Part II: stacks** owns the stack site/coefficient category, cohomology, coarse comparison and duality. The paper extraction calls this route `EtaleDualityAndPerverseSheavesPartIIStacks`, but this snapshot has no stage IDs or packet for it. The precise imports are therefore a recorded gap, rather than invented prerequisite names. SF.1 supplies the geometric DM-stack/coarse-algebraic-space construction and quotient charts. It is not assigned stack cohomology or stack duality.

For pi:X→C the coarse map, the required derived comparison is Rpi_*Q_ell=Q_ell, hence a Frobenius-equivariant isomorphism H^i(C,Q_ell)→H^i(X,Q_ell). On a finite quotient chart its argument uses exact finite-group invariants and finite pushforward. The coefficients have characteristic zero, so the theorem does not impose ell prime to each stabilizer order. At finite or integral coefficients this argument is different and cannot be substituted unchanged.

The coarse space C is an algebraic space in general. Its etale-local quotient of a smooth scheme must have the normalized dualizing object; the scheme version of Weil II 3.3.11 must then be extended to algebraic spaces by the supplier. Proper rational-homology-manifold purity transports to X through the coarse comparison. If X actually is [Y/G] with Y smooth proper and G finite, the conclusion also agrees with H^i(Y,Q_ell)^G. That agreement is a test, not a global-presentation assumption in the theorem.

Bergstrom–Faber–Payne uses these inputs in Proposition 3.1 and the invariant-cohomology proof of Proposition 4.2. It does not prove the general stack formalism there. The public van den Bogaart–Edixhoven v3 Lemma 3.2 contains the coarse comparison argument over an **algebraically closed field of characteristic zero**. This worker read that written hypothesis. It does not by itself close the needed finite-characteristic export. Its complex V-manifold duality proof also cannot silently be read as a finite-field argument. The packet retains both missing extensions, and makes a purity assertion only; weighted stack point counts, stack zeta functions and stack duality stay with the routed owners.

## WC.7: geometric realizations and agreement

Accepted RS-17 narrows WC.7 to zeta-facing worked realizations; it does not drop the layer. It specifically preserves projective spaces, permutation factors, curves, products, signs, negative Euler characteristic and all-power tests, while importing their generic constructions from PR196 and DWP.10. The issue also routes Schroer's six mathematical items to WC.7. Those are theorems and applications, not programme bookkeeping.

The reviewed audit's process verdict is followed for the process part: source receipts, publishing and closure accounting have no declaration nodes. It does not erase the mathematical scope explicitly retained by the accepted restructuring and the subsequent source routing. The packet supersedes the checkpoint's proposed wholesale relocation of WC.7 mathematics: it retains the distinct consumer theorems and proposes removal only of process wording from the layer display. The underlying cohomology examples remain supplier constructions, and this part identifies their factors with the canonical WC factors.

### Projective spaces and nonprime cardinalities

`degree_factors_projective_space` states that for P^n/F_q, in degrees 2j with 0≤j≤n, P_(2j)=1-q^j T, and every other factor is one. Consequently

\[
Z(\mathbf P^n,T)=\prod_{j=0}^n(1-q^jT)^{-1},
\qquad N_r=\sum_{j=0}^n q^{jr}\quad(r\ge1).
\]

The suppliers construct the hyperplane class and prove that its jth power generates Q_ell(-j). PR196 TraceFormula Layer 12 requires its projective-space calculation independently of the trace/RH endpoint. SF.2 integrates it, with the Tate/Frobenius convention. Uniqueness of the WC.6 factor identifies its integral polynomial with that actual computation; this agreement is the new declaration here, not a second projective-cohomology construction.

For n=0 there is one point over every extension and Z=1/(1-T). For P^1/F_4 the factors are 1-T and 1-4T; the first two counts are 5 and 17. The p=2 crystalline Frobenius is semilinear; its square is the linear q=4 endomorphism used here. Using p itself instead of q would fail both counts. For P^2/F_2 the factors in degrees 0,2,4 have scalars 1,2,4, giving counts 7 and 21. Existing projective-point finite-field cardinality infrastructure is not replanned; the missing theorem is its agreement with the canonical cohomological factors.

### Finite etale schemes with nontrivial component permutation

`degree_factor_finite_etale_orbits` uses the actual finite geometric point set and Frobenius permutation supplied by PR196 Layer 7. If its orbit lengths are m_1,...,m_s, then

\[
P_0(T)=\prod_a(1-T^{m_a}),\qquad
N_r=\sum_{a:\ m_a\mid r}m_a,
\]

and all positive-degree factors are one. A cyclic permutation block has this determinant and its rth power fixes all m points precisely when m divides r. This is the same endomorphism whose trace the arithmetic count formula uses.

In particular Spec F_(q^2) is connected over F_q but its two geometric components are exchanged. Its factor is 1-T^2, and its first four counts are 0,2,0,2. A split pair of F_q points instead has factor (1-T)^2 and constant count two. Geometric connectedness is thus not inferred from ordinary connectedness. For Spec F_(q^2), the reduced zeta denominator 1-T^2 has simple poles at T=1 and T=-1. The split pair has a double pole at T=1 instead. The empty finite etale scheme has an empty orbit product, factor one and zero counts. These examples also test the determinant sign in dimension zero without assuming Frobenius fixes every component.

### Products through the tensor action

`degree_factors_product_of_smooth_proper` compares the canonical factors with the actual equivariant Kunneth isomorphism. In degree n its right side is the product, over i+j=n, of det(1-T(F_i⊗G_j)) on H^i(X)⊗H^j(Y). The supplier owns the Kunneth construction, direct sums and tensor Frobenius. The WC consumer applies canonical-factor uniqueness and the all-power trace identity.

For every r, point sets give N_r(X×Y)=N_r(X)N_r(Y). Cohomology gives the same result because tensor traces multiply and the alternating degree signs distribute. This does not say Z(X×Y,T)=Z(X,T)Z(Y,T). The latter identity belongs to disjoint unions, not products.

The discriminating example is P^1×P^1. Its factors are 1-T, (1-qT)^2 and 1-q^2T in degrees 0,2,4, with odd factors one. Its count is (1+q^r)^2. At q=2 the first two counts are 9 and 25. Squaring Z(P^1,T) produces neither the degree-four factor nor those counts. The example consequently tests both arithmetic multiplication and the tensor action, rather than only a formal identity between unrelated polynomials.

### Curves, elliptic curves and the all-power recurrence

`degree_one_factor_curve` concerns a smooth proper geometrically connected curve of genus g. The genuine curve/Jacobian realization supplied by PR196 Layers 8 and 15 determines H^0, H^2 and the dimension 2g of H^1. It is not a cohomology class with a dimension or purity conclusion stipulated as a field. The function-field/curve owners supply projectivity over the finite field and the genus dictionary. The comparison states

\[
Z(C_0,T)=\frac{P_1(T)}{(1-T)(1-qT)},
\quad\deg P_1=2g,
\quad P_1(T)=q^gT^{2g}P_1(1/(qT)).
\]

For every r≥1, N_r=1+q^r-S_r, where S_r=Tr(F^r|H^1). WC.5 owns Newton identities, the recurrence attached to P_1, the finite-spectrum/pole API and its multiplicities. For q>1 the geometrically connected curve has simple poles at T=1 and T=q^(-1): weight-one numerator roots cannot cancel either extreme-degree denominator factor. A first trace alone does not determine a general higher-genus numerator. Even in a pure representation, a nontrivial Jordan block need not disappear as an endomorphism. Its characteristic polynomial and traces of powers agree with its semisimplification; DWP.10 supplies an actual coefficient example with that distinction, and WC.5 uses the multiset with algebraic multiplicities.

For an elliptic curve put a=q+1-N_1. Then P_1=1-aT+qT^2, S_0=2, S_1=a and S_r=aS_(r-1)-qS_(r-2) for r≥2. This convention is det(1-TF); det(T-F) instead has coefficients T^2-aT+q and must not be substituted without reversal.

`zeta_weierstrass_five` is a concrete actual-geometry application. Take the existing Weierstrass equation over F_5 with a_4=-1 and the other four coefficients zero. Its equation is y^2=x^3-x; the pinned discriminant is 64, equal to 4 in F_5, so its smooth proper genus-one scheme is admissible once the equation-to-scheme bridge is supplied. The affine fibers at x=0,1,2,3,4 contain respectively 1,1,2,2,1 points. The unique point at infinity gives N_1=8. Hence a=-2,

\[
P_1=1+2T+5T^2,\quad
Z(E_0,T)=\frac{1+2T+5T^2}{(1-T)(1-5T)}.
\]

The recurrence gives S_2=4-10=-6 and N_2=1+25+6=32. Independent exhaustive enumeration in F_5[u]/(u^2-3) confirms 32; three is a nonsquare in F_5, so this is a field. The enumeration fixes the sign of a and the same Frobenius squared. The suggested file uses the existing equation/discriminant carrier and a finite affine-point test. It does not claim that those equation checks alone formalize etale cohomology or the scheme bridge.

### A realized negative Euler characteristic

`zeta_artin_schreier_genus_two` replaces the checkpoint's merely formal genus-two numerator by a specified geometric realization. Let C_0 be the smooth projective model over F_2 of F_2(x,y), y^2+y=x^5. The actual model is constructed by AlgebraicCurves Layer 12, using normalization of P^1 in the extension, not by a new WC curve type.

FunctionFieldArithmetic FA.3 supplies the Artin–Schreier ramification calculation, reusing the existing function-field theory. The function x^5 has one pole of order five at infinity, reduced and prime to characteristic two. The extension is separable and nontrivial, has a unique rational place above infinity, is unramified elsewhere, and its wild different exponent is (2-1)(5+1)=6. Riemann–Hurwitz therefore gives 2g-2=2(-2)+6=2, so g=2. The perfect finite-field base and a rational place fix the constant field and geometric connectedness. These are requested geometric inputs, not a genus field assumed in a fake cohomology package.

The affine equation has y-derivative one. Direct enumeration over F_2 and F_4 gives two and four affine points; the single point at infinity gives N_1=3,N_2=5. Thus S_1=S_2=0. Newton identities give the first two numerator coefficients zero, and the degree-four reciprocal relation gives the third zero and the fourth q^2=4. It follows that

\[
P_1=1+4T^4,\qquad
Z(C_0,T)=\frac{1+4T^4}{(1-T)(1-2T)}.
\]

The recurrence gives S_3=0,S_4=-16, hence N_3=9,N_4=33. Independent exhaustive counts over F_8 and F_16 confirm them. The Euler characteristic is 2-2g=-2 and the functional equation is

\[
Z(C_0,1/(2T))=\tfrac12 T^{-2}Z(C_0,T).
\]

The suggested rational-function identity is a convention test for this now specified curve. Formal correctness of that identity does not discharge its model/genus/cohomology imports. An even pole order could not use the reduced prime-to-characteristic ramification formula unchanged; the supplier must retain that guard.

### Signs and mixed compact support

`functional_equation_projective_plane` combines the P^2 realization and the signed smooth-proper theorem: Z(P^2,1/(q^2T))=-q^3T^3Z(P^2,T). At q=2 the multiplier is -8T^3. A positive multiplier fails the identity in Q(T); it cannot be repaired by an orientation convention after the Frobenius and Tate factors are fixed.

`l_function_multiplicative_group` compares PR196 Layer 12 localization with the DWP.10 ordinary/compact example. For G_m the compact-support factors are P_(1,c)=1-T and P_(2,c)=1-qT, giving

\[
Z(\mathbf G_m,T)=\frac{1-T}{1-qT},\qquad N_r=q^r-1.
\]

H_c^1 has weight zero and H_c^2 weight two. Ordinary H^0 has scalar one and ordinary H^1 scalar q; substituting the ordinary-cohomology quotient in the compact-support trace formula gives the inverse rational function. At q=2 the correct counts are one and three. Tate twist (1) replaces T by T/q and shifts weights by minus two. On a point, the rank-one scalar q^(-1) is algebraic of weight minus two but is not an algebraic integer. A unipotent rank-two Jordan block with scalar one has factor (1-T)^2; equality of that polynomial with a scalar matrix's polynomial does not prove equality of their representations.

The reduced-divisor statement ignores roots removed by cancellation. Its upper bound controls surviving zeros and poles without falsely assigning their cohomological degree. Empty cohomology or the zero sheaf gives L=1 and an empty divisor. The actual smooth proper nonprojective and Jordan/Tate constructions remain with DWP.10; their absence is explicitly retained, so this matrix/polynomial battery cannot be read as certification of those geometric cases.

## WC.7: algebraic cycles and surface counts

These six declarations cover the routed Schroer items /235, /77, /78, /79, /80 and /241. They consume the existing arithmetic zeta, actual cohomology and cycle-map theories. The new assertions identify scalar Frobenius and its zeta/count consequences on the supplied geometry. Chow groups and Picard/numerical local systems are never defined a second time here.

### Base-field classes force scalar Frobenius

`frobenius_scalar_of_surjective_base_cycle_map` assumes a smooth proper X_0/F_q and surjectivity of

\[
\mathrm{CH}^j(X_0)\otimes\mathbf Q_\ell
\longrightarrow H^{2j}(X,\mathbf Q_\ell(j)).
\]

CH denotes cycles modulo rational equivalence, using the supplier's convention. EDC.3 supplies the map, base-change and Frobenius equivariance. A cycle defined over F_q has a fixed class in the twisted target. Surjectivity consequently forces Frobenius to be identity on the target, not merely to have eigenvalue one. Untwisting multiplies its scalar by q^j, so F on H^(2j)(X,Q_ell) equals q^j times identity. The Tate twist scalar q^(-j) is essential to the calculation.

Surjectivity from CH^j(X) over the algebraic closure would not suffice. For Spec F_(q^2), its two geometric degree-zero point classes span H^0 but are exchanged by Frobenius. Its base-field cycle map cannot be surjective onto that two-dimensional representation. This supplies a precise counterexample to dropping the base-defined hypothesis. A zero-dimensional target also passes the theorem, with trivial factor one.

`zeta_of_surjective_base_cycles` adds geometric connectedness, dimension d, odd-cohomology vanishing, and this surjectivity for each j. It identifies the arithmetic zeta as

\[
Z(X_0,T)=\prod_{j=0}^d(1-q^jT)^{-b_{2j}}.
\]

This is Schroer Proposition 7.1, with b_0=1 made explicit by geometric connectedness. Each even canonical factor is (1-q^jT)^b_(2j); odd factors are one. Smooth proper WC.6 factors supply independence of ell. The proof uses the scalar endomorphism and proper trace determinant formula, rather than conjecturing that geometric cycles or complex purity always imply a Tate representation.

`count_extension_of_surjective_base_cycles` states the derived all-power result

\[
\#X_0(\mathbf F_{q^r})=\sum_{j=0}^d b_{2j}q^{jr}\quad(r\ge1).
\]

The printed source gives r=1 by comparing linear terms. Its proof has already shown a scalar action, so the rth power is scalar q^(jr), and the all-power trace formula gives the displayed extension. This is an explicit derivation beyond the printed conclusion. In particular the r=1 count is positive since b_0=1; an r=0 count over an undefined F_(q^0) is not asserted.

### Numerical Picard hypotheses for surfaces

`count_surface_of_constant_num` specializes to a smooth proper geometrically connected surface with b_1=0, b_2=rho and constant numerical Picard local system. Here rho is the rank of Num(X) on the geometric fiber. Constancy is a statement about its descent/Galois action, not simply a choice of a basis over the algebraic closure. The conclusion, with the corrected field, is

\[
Z(X_0,T)=\frac1{(1-T)(1-qT)^{b_2}(1-q^2T)},
\qquad N_r=1+b_2q^r+q^{2r}.
\]

Schroer Corollary 7.2 prints F_p in the r=1 statement, although the setup has q=p^f. The correct count is over F_q. Its duality line repeats b_1=0; the deduction needed is b_3=0. The supplier perfect pairing gives b_4=b_0=1 and b_3=b_1=0. Degree-zero and top cycle maps span over rational coefficients; a closed point of positive degree suffices in top degree, so a rational point is not assumed to prove there is one.

The middle-degree argument requires care. The source passes from Num to H^2(1) and from constancy to base-defined classes. The needed export is a surface-specific injection Num(X)⊗Q_ell→H^2(X,Q_ell(1)), its surjectivity under b_2=rho, and descent up to a nonzero integer multiple over the finite field. It is not a general identification of numerical and homological equivalence. The paper-routed **Numerical Picard and contraction descent** owns that local system and descent. EDC.3 owns cycle/intersection compatibility, and SF.5 supplies the surface intersection/Hodge-index inputs in its stated projective scope. If a merely proper surface needs an extension of that argument, the supplier must justify it; this is explicitly recorded in the gap. No projective Hodge-index theorem is silently applied with a weaker hypothesis.

The test q=4,b_2=10 yields 57. Using F_p instead gives the wrong interpretation of the formula. Dropping b_2=rho leaves room for nonalgebraic middle cohomology; dropping constant Num permits permutation of geometric divisor classes. Neither follows from the Weil purity theorem alone.

### Twenty-five-point instances

`count_enriques_or_rational_genus_one` covers precisely the two classes in Corollary 7.3: an Enriques surface, or a smooth projective geometrically rational surface with a relatively minimal genus-one fibration to P^1. In either case require constant Num. The pending surface owners supply b_1=0,b_2=rho=10. In the rational fibration case the source uses K^2=0 and nine blowups of P^2; the geometry, its minimality and the invariant computation belong to **Genus-one fibrations and rational elliptic surfaces**. The Enriques invariants belong to **Enriques surfaces and integral nonexistence**. Those paper routes have no stage definitions in this snapshot, and their exact missing exports remain in the packet gap.

The zeta consumer then gives

\[
Z(X_0,T)=\frac1{(1-T)(1-qT)^{10}(1-q^2T)},
\qquad N_r=1+10q^r+q^{2r}.
\]

At q=2,r=1 this is 25; at r=2 it is 57. A further blowup changes the middle Betti number, so it cannot be treated as the same relatively minimal instance. The theorem does not say every Enriques surface has constant Num. It also does not import the paper's nonexistence theorem over the integers into this finite-field calculation.

### Maximal trace and constant Picard group

`constant_picard_iff_maximal_count_rational_surface` is the review-added extraction item /241, a derived supplement rather than a printed iff proposition. For a smooth projective geometrically rational surface with rho=rank Pic(X), it states

\[
\operatorname{Pic}_{X_0/\mathbf F_q}\text{ is constant}
\quad\Longleftrightarrow\quad N_1=1+\rho q+q^2.
\]

The pending rational-surface/Picard owners supply Pic^0=0, the finite-rank free geometric Picard lattice, the H^2(1) comparison and the finite-order Galois action. The trace formula reduces the count to 1+qTr(F|Pic⊗Q_ell)+q^2. A continuous action on this discrete finite-rank lattice has finite image: choose finitely many lattice generators, intersect their open stabilizers, and obtain an open kernel. Thus F has finite order. In characteristic zero its minimal polynomial divides T^m-1, with distinct roots, so it is semisimple for this reason.

After a complex embedding all eigenvalues have modulus one. Their real parts are at most one. If their sum is rho, every real part must equal one, forcing every eigenvalue to be one; finite-order semisimplicity gives F=identity. Faithfulness of tensoring the free lattice with Q_ell gives identity on the lattice itself. Conversely constant Picard gives scalar q on H^2 and the maximal count. This proof does not infer semisimplicity from purity alone.

For a quadric with its two geometric rulings exchanged, rho=2 but the lattice trace is zero, so N_1=1+q^2. A split quadric gives (q+1)^2. The criterion is specific to geometrically rational surfaces: an arbitrary Picard scheme can have connected or torsion parts invisible to this rational H^2 calculation. The packet therefore keeps those surface hypotheses and the genuine lattice comparison, rather than asserting the criterion for all surfaces.

## The assembled geometric endpoint and its separate APIs

`weil_conclusions_of_smooth_proper` concerns an actual smooth proper geometrically connected X_0/F_q of pure dimension d. It assembles normalized arithmetic rationality, the alternating determinant factorization by canonical integral ell-independent P_i, all-conjugates weight i of each reciprocal root, the signed functional equation, and the trace identity for every positive power. Its finite-field statements have no assumption equal to the desired RH theorem. DWP.7 must provide its already planned purity proof on the constructed cohomology.

The public entry points remain separate:

| Assertion | Owning or consuming API |
| --- | --- |
| Arithmetic rationality and trace | WC.1 integrates PR196 TraceFormula 13–14 through SF.2 |
| Exact functional equation | WC.2 algebra and EDC.8 determinants, applied by WC.6 `functional_equation_of_smooth_proper` |
| Integral degree factors and all-conjugates RH | WC.3 extraction, DWP.7 purity, WC.6 `exists_unique_integral_degree_factors_of_smooth_proper` |
| Betti comparison | WC.4 and the actual PR196 specialization/complex comparison family |
| Mixed divisor weights | WC.6 `reciprocal_divisor_weight_le`, using compact support |
| Finite-field crystalline agreement | The three exact RD.7 comparison nodes, with linear phi^f |
| Combined finite-field conclusions | WC.7 `weil_conclusions_of_smooth_proper` |

Betti comparison takes a genuine smooth proper comparison family, its connected base with ell invertible, the geometric finite-field and characteristic-zero fibers, transport and a chosen complex embedding. The family may be supplied through a suitable trait/comparison chain. It is not chosen for an arbitrary finite-field scheme. In that supplied situation etale and singular Betti dimensions agree; the dimensions are independent of the transport choice although comparison maps may depend on it. The finite-field theorem remains valid when no complex fiber has been specified.

There is no new definition or construction node, hence no newly owned definition API or definition-unit-test obligation. The theorem acceptance tests are concrete mathematical statements about imported objects. The suggested file carries convention and equation examples on existing carriers; all twenty geometric declarations are listed as signature omissions until their actual supplier carriers exist. This prevents inventing an abstract realization whose proposition fields restate the target theorem.

## Acceptance and dependency closure

The mathematical checks in the nodes and preceding sections include the entire checkpoint matrix, with the new source applications. Their purposes are distinct:

| Test | Discriminating assertion |
| --- | --- |
| Empty scheme / zero sheaf | All factors one; Z or L one; divisor empty |
| P^n, including n=0 | Genuine hyperplane-generated factors and geometric point counts agree |
| Nonprime q=4 | Tate line scalar four; counts five and seventeen for P^1 |
| Finite etale orbit | 1-T^m and divisibility-dependent all-power counts |
| Curve and elliptic recurrence | Actual Jacobian H^1, multiplicities and Frobenius powers |
| E/F_5 | Discriminant four, eight points, trace minus two, N_2=32 |
| Genus-two C/F_2 | Model/genus inputs, P_1=1+4T^4, counts 3,5,9,33 |
| Product | Tensor Kunneth, rather than multiplying zeta functions |
| P^2 sign | Negative multiplier -q^3T^3 |
| Negative Euler characteristic | Integer power T^(-2) and rational determinant q^(-1) |
| Jordan block | Factor/traces agree with semisimplification without equal endomorphisms |
| Tate twist | Substitution T/q and weight shift minus two |
| Ordinary / compact support | G_m rational function has the correct quotient direction |
| Smooth proper nonprojective | Genuine DWP.10 scheme required; projective cases cannot certify it |
| Crystalline q-Frobenius | Rational comparison and semilinear iteration, no torsion/lattice claim |
| Base-defined cycles | Geometric spanning alone fails on a component permutation |
| Surface formula | Constant Num and b_2=rho are explicit, q may be nonprime |
| Twenty-five-point surface | Geometric invariant imports give ten middle classes |
| Rational Picard criterion | Finite-order maximal trace, with free-lattice hypotheses |
| Family comparison | A complex fiber is provided, not invented |

The dependency direction remains PR196/SF.2 → cohomology and trace; EDC → duality and cycle maps; DWP → weights; WC.1/WC.3 → normalized rational and integral extraction; RD.7 → finite-field comparisons; WC.6 → broader consumers; WC.7 → geometric applications. WC.5 supplies generic recurrence/pole assertions. The genus-two model uses the unchanged AlgebraicCurves dictionary and FA.3 ramification. The pending stack and surface routes supply their missing geometry at their own owners. There is no RD.7 input from WC.6: its exact smooth-proper comparison remains an import, preventing a circular proof of its own purity/extraction prerequisites.

Fifteen requests specify the unresolved stage-level exports. Four gaps record actual geometric carriers, finite-field stack/algebraic-space formalism, numerical Picard/surface realizations, and imported proof/example closure. The packet checker validates the known declaration graph and all cited baseline names. Pending routes without stage IDs stay in the gaps; they are not falsely accepted as graph vertices. The combined graph must be checked again when supplier stage requests are replaced by exact nodes.

Both stages are **planned** at target level, rather than closed. Every target is specified or exactly imported, including the new source routes and crystalline interface; missing supplier work is named at its boundary. Follow-ups receive those actual exports, verify the geometric instances and run the acceptance matrix on their constructed carriers. They must not interpret an elaborating suggested file or the independent finite-field enumeration as completion of the missing cohomology proofs.

## Sources and version discipline

The packet carries source URLs, SHA-256 receipts, access dates and exact read extents. This continuation freshly read Weil I 1.2–1.7 and 2.1–2.6, Weil II 3.3.2–3.3.11, the BFP purity-consuming passages, all of Schroer section 7, the scoped vdBE coarse comparison, and the relevant PR196 TraceFormula interfaces. The prior checkpoint receipts for SGA 4 1/2 and Kedlaya are preserved as historical reads, not relabeled as fresh downloads. The original proofs imported by the RD and DWP owners remain their obligations.

- [Deligne, Weil I](https://numdam.org/item/PMIHES_1974__43__273_0.pdf): rational descent, integral factors, orientation/pairing and functional equation. The projective purity proof is an imported DWP result.
- [Deligne, Weil II](https://numdam.org/item/PMIHES_1980__52__137_0.pdf): compact and ordinary weight bounds, valuation triangles, smooth proper purity and the dualizing-complex extension.
- [Bergstrom–Faber–Payne v2](https://arxiv.org/pdf/2206.07759v2): the routed DM-purity uses. The Annals version is the version of record; its full text was not collated here.
- [Schroer v3](https://arxiv.org/pdf/2004.07025v3): section 7 cycle/Frobenius argument and surface counts. Published persistence of the slips below is not asserted.
- [Van den Bogaart–Edixhoven v3](https://arxiv.org/pdf/math/0505178v3): the characteristic-zero coarse comparison and its written scope.
- [PR196 TraceFormula at the inspected commit](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting/TraceFormula/README.md): unchanged actual-cohomology and point-count suppliers.

The checkpoint's four source issues remain: Weil II 3.3.5 cites 3.3.3 where the compact upper bound is 3.3.4; the published Kedlaya functional-equation display omits q^(-n) inside the reciprocal factor; its trace-only shortcut does not establish individual integral factors; and the preprint's wrong coefficient object is corrected in the published proof. The correction of the polynomial reciprocity is

\[
P_{2d-i}(T)=cT^{b_i}P_i(q^{-d}T^{-1}),
\qquad c=(-1)^{b_i}q^{db_i}/\det F_i.
\]

P^1 immediately detects a missing scaling: its factors are 1-T and 1-qT. The trace shortcut only gives an alternating determinant product; cancellation can hide nonintegral individual factors. WC.3's normalized extraction supplies the missing argument.

Three already recorded Schroer slips are carried with explicit extraction IDs, without a new-discovery claim. E10 overstates algebraic integrality after arbitrary positive Tate twists: the eigenvalues are q^(-j) times the untwisted algebraic integers and need not be integral. E11 writes F_p where the count is over F_q. E35 repeats b_1 instead of deducing b_3 by duality. The consumer statements above use their corrected forms. Published text was not collated for these three records. The review-added maximal-Picard criterion is labeled a derived supplement, and its finite-order proof is given explicitly rather than attributed as a printed theorem.
