# Weight-two comparisons for generalized Heegner cycles

## The divisor and the quotient map

The two weight conventions must be distinguished. BDP indexes the fiber power by
\(k-2\), whereas Castella--Hsieh writes the modular weight as \(2r\). Weight two
therefore means fiber-power index zero and \(r=1\), respectively. In this degree
the graph construction gives a CM point on the modular curve, not a homologically
trivial cycle. For a CM point \(x\) and a rational degree-one cusp \(b\), the
corrected divisor is

\[
D=[x]-[b].
\]

The field must define both the level point and the chosen cusp. It must not be
replaced by a smaller ring class field merely because the CM elliptic curve has a
model there. BDP, Section 2.3, gives the index-zero correction; its positive-index
projector argument cannot be substituted for it.

Let \(C/L\) be the resulting smooth proper geometrically connected modular curve,
\(J=\operatorname{Pic}^0(C)\), and \(\pi:C\to E\) the chosen modular
parametrization. Its induced map \(q_\pi:J\to E\) satisfies

\[
q_\pi([x]-[b])=\pi(x)-\pi(b).
\]

Write

\[
\theta_C:V_pJ\xrightarrow{\sim}
 H^1_{\mathrm{et}}(C_{\overline L},\mathbf Q_p(1)),
\qquad
\gamma_\pi=V_p(q_\pi)\circ\theta_C^{-1}.
\]

The comparison is the commutativity of the Abel--Jacobi/Kummer square under this
map. If the \(f\)-projector is compatible with the quotient, so that
\(q_\pi e_f=q_\pi\), its conclusion is

\[
H^1(L,\gamma_\pi)\bigl(\operatorname{AJ}_{\mathrm{et}}(e_fD)\bigr)
 =\kappa_E(\pi(x)-\pi(b)).
\]

The finite calculation underlying the square concerns the support of the entire
divisor, including the cusp. For \(m=p^n\), the residue vector of \(D\) is in the
kernel of the degree map on \((\mathbf Z/m)^S\), where \(S\) is that support.
Compare its Gysin boundary with the Kummer boundary of \([D]\in J(L)\), using an
\(m\)-division line bundle and a trivialization over \(C\setminus S\). The
trivialization and cycle-class conventions must give the same connecting cocycle
\(\sigma(Q)-Q\). Compatibility in \(n\) and the continuous-cochain realization
are needed for the \(p\)-adic comparison; an unrestricted interchange of inverse
limits and cohomology is not an argument.

The quotient part then has a concrete proof. Applying \(q_\pi\) to a division
point sends its connecting cocycle to the connecting cocycle of
\(q_\pi([D])\). Changing the division point changes both by the corresponding
coboundary. The basepoint translation is retained throughout. In particular,
changing \(b\) to \(b'\) adds
\(\kappa_E(\pi(b)-\pi(b'))\); it does not give literal integral independence.
A rational representation comparison alone also gives no equality of integral
cycle and Tate lattices.

## Character sums

For a finite abelian extension \(F/L\), let \(G=\operatorname{Gal}(F/L)\),
and let \(\chi:G\to B^\times\) take values in a common coefficient field.
A quotient comparison defined over \(L\) commutes with the sum

\[
\sum_{g\in G}\chi(g)\,g z.
\]

Under the left-action convention this is a \(\chi^{-1}\)-eigenvector: replace
\(g\) by \(h^{-1}t\) when applying \(h\in G\). The inverse is important even
for a cyclic group of order three. There is no division by \(|G|\). For the
trivial character the expression is a trace, not an average, and at primes
dividing \(|G|\) an averaging projector is not an integral substitute. Descent
of a weighted class to a twisted cohomology group requires its own
inflation--restriction and coefficient maps.

## Stabilization and the initial conductor

Let \(p\) be good ordinary and split in the quadratic field. Fix the unit root
\(\alpha\) of \(X^2-a_pX+p\), and put \(K_n=K_{c_0p^n}\). Write
\(k_n=\kappa_E(P_n)\). At positive conductor the weight-two stabilization is

\[
k_n^{\alpha}=k_n-\alpha^{-1}\operatorname{res}(k_{n-1}),\qquad n\geq1.
\]

Linearity and restriction compatibility transport the identical expression on
cycle classes to this one. The tower normalization is a further multiplication
by \(\alpha^{-n}\).

For \(n\geq2\), suppose the geometric trace relation and ring-class degree give

\[
\operatorname{cor}(k_n)=a_pk_{n-1}-\operatorname{res}(k_{n-2}),
\qquad [K_n:K_{n-1}]=p.
\]

Then

\[
\begin{aligned}
\operatorname{cor}(k_n^{\alpha})
 &= (a_p-p/\alpha)k_{n-1}-\operatorname{res}(k_{n-2})\\
 &= \alpha k_{n-1}-\operatorname{res}(k_{n-2})
 =\alpha k_{n-1}^{\alpha}.
\end{aligned}
\]

Thus \(y_n=\alpha^{-n}k_n^{\alpha}\) is a norm-compatible positive tail.
Its extension has the uniquely determined term
\(y_0=\operatorname{cor}(y_1)\). Identifying this with an initial Euler-factor
formula is a separate calculation: the first ring-class degree need not be \(p\).

This distinction matters in the sources. The inspected CH Definition 5.2 uses
the full unit-group order in its prime-to-\(p\) branch, whereas Castella's
31-page author copy uses half that order in equation (6.7). This discrepancy
alone is not a counterexample to either formula: level descent, point and trace
normalizations must also be compared. It is not legitimate to resolve it by
silently replacing one unit factor with the other. The split recurrence printed
in CH Proposition 4.4 is explicitly for \(n>1\).

## Differential normalization

At a local field and good-reduction model in the range of the de Rham
construction, let

\[
\pi^*\omega_E=c_\pi\omega_f.
\]

Naturality of the Bloch--Kato logarithm, its comparison with the elliptic formal
group, and adjunction of the quotient map and differential pullback give

\[
\log_{E,\omega_E}(\pi(x)-\pi(b))
 =c_\pi\operatorname{AJ}_{\mathrm{dR}}(e_fD)(\omega_f).
\]

The purely linear step is evaluation of a functional after a map, or evaluation
of its transpose before the map. In a squared formula the substitution therefore
has factor \(c_\pi^{-2}\). For \(c_\pi=3\) this is \(1/9\), not \(1/3\).
Neither rational invertibility nor a vanishing CM-power exponent at weight two
makes \(c_\pi\) an integral unit. The local construction inspected in BDP uses
an unramified local base; a larger range requires the relevant comparison theorem.

## The ordinary-family boundary

Castella's Theorem 6.5 is a higher-weight statement. Remark 6.6 in the inspected
31-page author copy explicitly extends its comparison to weight-two ordinary
\(p\)-stabilizations of prime-to-\(p\) newforms, not to weight-two \(p\)-new
specializations. The residual, weight-congruence, coefficient and critical-twist
hypotheses are retained in the statement of this comparison.

The proof compares specialized regulator images and then uses two injectivity
statements: global localization and the local regulator map. Equality of scalar
regulator values is not itself equality of global cohomology classes. Moreover,
the pairing in that family proof and the pairing in the inspected 2022 CH
revision use different displayed Tate-period powers. A comparison between these
versions requires an actual coefficient/twist map.

## A coefficient identity that cannot be used literally

In the published CH Section 4.4, \(B=\operatorname{Res}_{H_K/K}A\). Put
\(h=[H_K:K]\). The displayed identification of the full symmetric power of
\(T_pB\) with the induced symmetric power of \(T_pA\) fails a dimension test.
At symmetric degree zero the dimensions are \(1\) and \(h\). At degree two they
are \(h(2h+1)\) and \(3h\). They disagree when \(h>1\).

At positive degree, the sum of pure-factor symmetric powers is an induced
submodule of the symmetric power of a direct sum; mixed monomials account for
the additional dimensions. Degree zero needs a separate treatment. The direct
weight-two divisor and Kummer construction does not depend on the false
identification. Comparison with the general CM-character construction requires
the repaired carrier, not a renamed full symmetric power. This observation
concerns the display; it is not a claim that every subsequent theorem is false.

## Ownership

The cycle construction and its realizations belong to GH.0--GH.1. The actual CM
points, modular quotient, geometric trace relation and Kummer maps belong to
HE.1--HE.3; GH.3 and HE.8 supply their tower realizations. GH.8 compares those
objects rather than rebuilding them. The general main-conjecture formulation
comparisons belong to ModularIwasawaMainConjectures L6. Source-qualified class
and differential maps feed the arithmetic consumers; the early class comparison
does not depend back on a downstream main-conjecture endpoint.

## Sources

BDP: Bertolini--Darmon--Prasanna, *Generalized Heegner cycles and p-adic Rankin
L-series*, Duke Math. J. 162 (2013), especially Section 2.3 and Sections 3.1--3.4.

CH: Castella--Hsieh, *Heegner cycles and p-adic L-functions*, Math. Ann. 370
(2018), especially Sections 4.3--4.4 and 5.2; distinguish the 2 July 2022 author
revision and the one-page erratum.

Castella: *On the p-adic variation of Heegner points*, inspected 31-page author
copy, Section 6.2, especially Lemma 6.4, Theorem 6.5 and Remark 6.6. Its numbering
and normalization are not silently identified with those of an earlier preprint.
