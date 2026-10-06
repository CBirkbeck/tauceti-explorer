# ER.6 — Integral parts and the Beilinson statement

This is the ER.6 follow-up of the [reviewed parent packet](../packets/EllipticRegulators.json), not a replacement of its definitions. It makes the determinant comparison usable, supplies a published local-descent proof of potentially good reduction integrality, and pins the analytic input behind the two Beilinson formulations. The pass is complete at target granularity; ER.6 is **planned**, with supplier interfaces and the inherited ER.2 normalisation comparison still open. Nothing is claimed to be formalised.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed audit `AUDIT-28` finds the higher regulator, arithmetic integral part and Beilinson statement absent. We consume the existing matrix determinant, tensor-basis extension, gamma residue and analytic order. Mathlib's `WeierstrassCurve.LSeries` is a Dirichlet series; it supplies neither a conductor nor its own continuation or functional equation.

## Imported objects and conventions

Let (F) be a number field, (E/F) an elliptic curve and

\[
d=[F:\mathbb Q]=r_1+2r_2>0.
\]

Write (K=K_2(E)\otimes\mathbb Q). The arithmetic integral part is

\[
I=\operatorname{im}\bigl(K_2(\mathcal E)\otimes\mathbb Q
\longrightarrow K_2(E)\otimes\mathbb Q\bigr),
\]

where \(\mathcal E\) is a **regular**, proper, flat model over \(\mathcal O_F\). This is `EllipticKTheory:E.6/the-integral-part`, with its model-independence theorem. It is not G-theory of an arbitrary singular model. No finiteness or lattice hypothesis on (I) is built into the definition.

Use the parent `EllipticRegulators:ER.6/the-regulator-on-the-integral-part` to restrict the universal regulator to (r:I\to D\), with

\[
D=H^2_{\mathcal D}(E_{\mathbb R},\mathbb R(2)).
\]

The rational structure (B\subset D) is the Betti structure of `EllipticRegulators:ER.2/the-deligne-cohomology-target`, with that node's Tate twist and combined conjugation convention. It has rational dimension (d), and its real scalar extension identifies with (D). A real rescaling of a period does not automatically preserve this rational structure. In particular, do not choose a period so that a desired L-value formula becomes true.

`EllipticKTheory:E.3/what-the-sequence-does-not-identify` embeds (K) into (K_2(F(E))\otimes\mathbb Q). Horizontal unramifiedness involves **all closed points** of (E), not only rational points. Arithmetic membership in (I) requires the additional vertical conditions of `EllipticKTheory:E.6/vertical-residues`.

The parent remains the owner of these targets:

| Target | Imported parent node |
| --- | --- |
| Restricted regulator | `ER.6/the-regulator-on-the-integral-part` |
| Full conjecture | `ER.6/the-beilinson-statement` |
| Three different conclusions | `ER.6/three-conclusions-that-are-not-the-same` |
| Vertical integrality requirement | `ER.6/the-vertical-step-that-is-required` |
| Potentially good reduction equality | `ER.6/potentially-good-reduction-integrality` |
| Exact functional-equation scalar | `ER.6/beilinson-forms-equivalent` |

Here and below, shortened `ER.6/…` identifiers have prefix `EllipticRegulators:`. New nodes have distinct identifiers; no parent file is edited.

## The determinant in Betti coordinates

`ER.6/regulator-determinant-in-betti-coordinates` constructs the coordinate form of the determinant line. For a rational basis (b=(b_i)_{i<d}) of (B) and a tuple (x=(x_j)_{j<d}) in (I), put

\[
M_b(r;x)_{ij}=b_{\mathbb R}.\operatorname{repr}(r(x_j))_i,
\qquad \Delta_b(r;x)=\det M_b(r;x).
\]

The columns are the regulator images. This is a **signed** determinant. The determinant line is understood relative to the fixed Betti rational line: changing rational bases multiplies the coordinate by a nonzero rational number, so the comparison is a \(\mathbb Q^\times\)-class. This coordinate construction uses Mathlib's determinant rather than introducing another determinant theory.

The proposed names below lie in `TauCeti.EllipticRegulators.ER6`:

- `regulatorDet_eq_matrix`: agreement with `Matrix.det` in the basis `b.baseChange ℝ`.
- `regulatorDet_changeFrame`: for any rational square matrix (A), including singular matrices, \(\Delta_b(r;xA)=\Delta_b(r;x)\det A\).
- `regulatorDet_changeBetti`: if (C_{ij}=b.\operatorname{repr}(b'_j)_i), then \(\Delta_b(r;x)=\det C\,\Delta_{b'}(r;x)\).
- `regulatorDet_zero`: in positive dimension the zero regulator on the zero tuple has determinant zero.
- `regulatorDet_pullback`: for a rational linear map (f:J\to I), \(\Delta_b(r\circ f;x)=\Delta_b(r;f\circ x)\).

The uses are DJZ's regulator determinant, the constructed-subspace statement, and conversion of ER.7's explicit formula after its normalisation comparison. The four unit tests are:

- `regulatorDet_identity`: (I=B), (r(y)=1\otimes y), (x=b), giving (1).
- `regulatorDet_empty`: in dimension zero, the empty determinant is (1). Arithmetic applications have positive dimension.
- `regulatorDet_swap_two`: in dimension two, swapping the basis vectors gives (-1).
- `regulatorDet_double_one`: in dimension one, replacing the generator by twice itself gives (2).

The last two tests distinguish signed coordinates from an absolute determinant and from a falsely basis-independent numerical regulator.

## Constructed subspaces and the full conjecture

`ER.6/constructed-determinant-witness` defines `HasDeterminantWitness(b,r,ℓ)` by

\[
\ell\ne0\quad\text{and}\quad
\exists x:\operatorname{Fin}(d)\to I,\ \exists q\in\mathbb Q^\times,
\quad \Delta_b(r;x)=q\ell.
\]

The tuple is rationally independent because its regulator images are real linearly independent. It is a basis of its own span (V\subset I); the scalar-extended regulator on (V) is an isomorphism onto (D). This is the weak Beilinson statement on constructed integral classes. It asserts no dimension bound on the entire (I). An approximate numerical ratio supplies neither exact equality nor the rational coefficient.

The API serves construction, comparison and transport:

- `HasDeterminantWitness.mk`: construct it from \(\ell\ne0\), a tuple, (q\ne0) and the exact equality.
- `HasDeterminantWitness.det_ne_zero`: extract a tuple with nonzero determinant.
- `HasDeterminantWitness.rescaleValue`: replacing \(\ell\) by (a\ell), (a\in\mathbb Q^\times), preserves the predicate.
- `HasDeterminantWitness.changeBetti`: any two rational bases of (B) give equivalent predicates.
- `HasDeterminantWitness.liftAlongSurjection`: a surjective rational linear map (J\to I) lifts witnesses, and composition carries them forward.
- `HasDeterminantWitness.surjective`: a witness makes (r_{\mathbb R}:\mathbb R\otimes_{\mathbb Q}I\to D) surjective. Its scalar-extension identity is (r_{\mathbb R}(a\otimes x)=a\,r(x)).

Its four unit tests are:

- `determinantWitness_identity`: the inclusion (B\to\mathbb R\otimes B) has a witness for \(\ell=1\).
- `determinantWitness_zeroValue`: no map has a witness for \(\ell=0\).
- `determinantWitness_zeroRegulator`: in positive dimension the zero regulator has no witness for any \(\ell\).
- `determinantWitness_extraKernel`: in dimension one the projection (B\oplus B\to B), followed by (y\mapsto1\otimes y), has a witness for (1) and a nontrivial kernel.

`ER.6/full-integral-basis-criterion`, named `fullBasisCriterion`, proves the precise extra requirement:

\[
\begin{split}
&\operatorname{HasDeterminantWitness}(b,r,\ell)
\ \land\ r_{\mathbb R}\text{ injective}\\
&\quad\Longleftrightarrow\quad
\ell\ne0\ \land\ \exists\text{ a rational basis }a:\operatorname{Fin}(d)\to I,
\ \exists q\in\mathbb Q^\times,\ \Delta_b(r;a)=q\ell.
\end{split}
\]

A witness supplies surjectivity; real injectivity gives an isomorphism. Cardinal rank preservation under scalar extension then proves finite dimensionality and rank (d) for (I). The witness tuple becomes a basis of the whole group. Conversely, a basis with nonzero regulator determinant gives an invertible real regulator matrix.

This is a reformulation of the **conjectural** full integral statement, not a proof that it holds. It does not assert finite generation of an integral lattice. Merely writing a numerical `finrank` equality would not justify the missing finiteness hypothesis. Nor can rational injectivity replace real injectivity: ((a,b)\mapsto a+\sqrt2 b) is injective on \(\mathbb Q^2\) while its real scalar extension has a kernel.

## The conductor and gamma factors

`ER.6/modularity-supplied-leading-term-limit` imports `EllipticCurveModularity:R29.6` and its `l-function-continuation` node. This is the explicit **R29.6 → ER.6** dependency required by `RT-AREA-ktheory-2/9`. For (E/\mathbb Q), modularity supplies continuation and the completed functional equation of the full L-function, including its bad-prime factors:

\[
\Lambda(E,s)=N^{s/2}(2\pi)^{-s}\Gamma(s)L(E,s),
\qquad \Lambda(E,s)=w\Lambda(E,2-s),\quad w=\pm1.
\]

Here (L) is the continued function agreeing with the raw Dirichlet series in its convergence region. Evaluating Mathlib's totalised raw series at zero does not construct that continuation. The requested R29.6 interface also exposes (L(E,2)\ne0), from absolute convergence of the Euler product and Hasse bounds, for the exact-order conclusion.

The analytic calculation for a completion with \(\Gamma(s)^d\) is

\[
L^*(E,0)=\lim_{s\to0}\frac{L(E,s)}{s^d}
=\Lambda(E,0)=w\Lambda(E,2)
=wN(2\pi)^{-2d}L(E,2).
\]

The inputs are (N>0), the completed identity on a punctured neighbourhood of zero, continuity of \(\Lambda\) there, and \(\Gamma(2)=1\). Mathlib supplies \(s\Gamma(s)\to1\). No value of the totalised gamma function at its pole is used. If (L) is analytic at zero and (L(2)\ne0), the order is exactly (d); the coefficient is (L^{(d)}(0)/d!\). The prototypes are `leadingTermLimit` and `leadingTermOrder`.

`ER.6/determinant-witnesses-in-the-two-normalisations`, named `atTwoWitness_iff`, applies the rational conversion

\[
L^*(E,0)=\underbrace{wN2^{-2d}}_{\in\mathbb Q^\times}\,
\pi^{-2d}L(E,2).
\]

Thus the two witness predicates, and the full basis criteria with the same real-injectivity condition, are equivalent. Their exact rational coefficients change by (q_2=q_0wN2^{-2d}\). They are not the same coefficient. The Betti structure and regulator remain fixed.

For a general number field, continuation and the completed functional equation are **hypotheses**. Use (d=r_1+2r_2) and (N=|\operatorname{disc}F|^2\operatorname{Norm}_{F/\mathbb Q}(\mathfrak f_E)\) in this normalisation. In the specified CM setting, ER.5's Hecke-character comparison and its AL.1 route can supply the analytic inputs. The at-two statement is meaningful without continuation; equivalence to a leading-term formulation needs the functional equation.

Acceptance checks include (N=32,w=1,d=1\), which gives (L'(0)=8\pi^{-2}L(2)\); changing (w) changes the sign. For (d=2), the factor is (wN/(16\pi^4)\), with a second derivative divided by (2!\). If the at-two value is zero, both determinant witness predicates fail.

## Integral membership by local descent

`ER.6/potentially-good-integrality-by-local-descent` refines the proof of the parent's potentially-good equality. Suppose (E/F) has potentially good reduction at every finite place. Then

\[
I(E)=K_2(E)\otimes\mathbb Q.
\]

For a rational class \(\alpha\) and a finite place (v), choose a finite extension (L_v/F_v) where (E) has good reduction. The existing local-reduction layer defines this with **minimisation after base change**. E.6's good-reduction result puts \(\alpha_{L_v}\) in the local integral image: the special fibre is a smooth proper finite-field curve and its rational (K_1\) boundary is zero.

Integral membership reflects down finite extensions. Scholl I, Corollary 1.3.4, proves the corresponding alteration intersection statement using degree-normalised transfer; Scholl II, §2, explicitly recalls the finite-extension equality. Scholl I, Proposition 1.3.6, then identifies global membership with membership over every completion by the localisation diagram. Therefore \(\alpha\in I(E)\).

This route needs no common global field with everywhere good reduction and no classification of rational fibre trees. It applies to ramified extensions in residue characteristics (2) and (3). It proves rational image equality; it does not prove a lift of every integral class without a multiple, or any finite-rank assertion.

The exact E.6 request is finite-extension reflection and local-global membership for the **full rational (K_2\) image**. Scholl states the motivic results weightwise. His §1.3.3 identifies the graded integral image with the direct sum of weightwise images; the supplier must justify the passage to unweighted (K_2\) using S.6's finite Adams-weight decomposition. This interface is not already a theorem in the E.6 packet.

Scholl II's \(H_{M,\mathrm{nr}}\) means **ℓ-adic** unramified motivic cohomology. It is not the horizontal tame kernel. This proof uses the paper's integral-membership descent discussion, not its integral-versus-unramified comparison theorem with a changed meaning of “unramified”.

## An elliptic obstruction and the Bloch application

`ER.6/strictness-and-a-vertical-non-example` tests the arithmetic distinction with DJZ Theorem 8.3(2). On

\[
y^2+(x+12)y+x^3=0,
\qquad M=\left\{\frac{y^2}{x^3},\frac{x-4}{-4}\right\},
\]

the two-torsion polynomial satisfies

\[
-4t(x)=(x-4)(4x^2+15x+36).
\]

The quadratic discriminant is (-351), and its value at (4) is (160); the curve is smooth of genus one with its point at infinity. In the source notation (g=1\), (d_{\rm source}=3\), (m=x-4\), (m(0)=-4\), and (2\nmid b_1=1\). The theorem gives horizontal unramifiedness and a nontorsion vertical obstruction at (2): **no nonzero multiple of (M) is integral**. This is an explicit substitution into the theorem, not an example copied from its tables.

Putting (u=-x\) gives the Mathlib Weierstrass coefficients ((-1,0,12,0,0)\), with (c_4=289\) and \(\Delta=-561600\). Thus (v_2(j)=-6\), consistent with failure of potentially good reduction. The suggested file states the invariant computation against the existing Weierstrass definitions.

`ER.6/integral-nonzero-bloch-class` imports the exact ER.5 class (U\) and its nonzero symbol regulator. Under potentially good reduction everywhere, the descent theorem gives (U\in I\). Under the **explicit ER.2 normalisation-comparison hypothesis**, the universal regulator also has (r(U)\ne0\), so \(\mathbb Q U\) gives an isomorphism after real scalar extension onto the one-dimensional target, and the map on all (I\) is surjective. The local-reduction (j\)-integrality criterion supplies the arithmetic hypothesis for (j=0\) and (1728\).

This conclusion does not say (U\) spans the whole (I\). Nonvanishing alone also does not give an exact rational determinant certificate in the fixed Betti structure. The parent's comparison between its Bloch/Brunault symbol normalisation and the M.8 universal regulator remains an inherited source gap. The CM class and the parent's corrected constants are imported unchanged; this pass did not read the maintainer's private Bloch scan.

## Dependencies, sources and completion boundary

The three supplier requests are E.6's full rational descent/localisation interface, R29.6's continued-function and nonvanishing interface, and the existing Tau Ceti elliptic local-reduction layer's potentially-good predicate and (j\)-criterion. E.6 obtains the smooth proper model; the upstream equation layer is not silently treated as a scheme construction. ER.2 owns the outstanding universal-regulator comparison. Full integral rank and real injectivity remain the Beilinson conjecture, not missing proofs advertised as theorems.

Sources read on **6 October 2026**, with edition, PDF hash and precise locators in the packet:

- [Dokchitser–de Jeu–Zagier, arXiv v2](https://arxiv.org/pdf/math/0405040v2), §§2–3 and §8 through the proof of Theorem 8.3.
- [Schappacher–Scholl, author retypesetting](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/RSS.pdf), §§0–1.2.3 and §7. In particular, §7 supplies arithmetic integrality for their modular construction, while §1 distinguishes its constructed subspace from conjectural injectivity.
- [Scholl I, author version](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/k1.pdf), introduction and §1 in full, including Corollary 1.3.4 and Proposition 1.3.6.
- [Scholl II, arXiv v1](https://arxiv.org/pdf/0710.5453v1), §1 and §2 through diagram (3), including the explicit finite-extension reflection statement. The subsequent integral-versus-ℓ-adic-unramified theorem is not used as a horizontal tame-kernel identification.

The four new planets are **Regulator determinant**, **Weak Beilinson statement**, **Elliptic functional equation comparison**, and **Potentially good reduction integrality**. Together with the parent's two ER.6 planets, this stays within the six-planet layer limit.

The [suggested file](../suggested/EllipticRegulators--ER.6.lean) elaborates using individual modules at the pinned Mathlib commit, with placeholder-proof warnings only. It contains the two definitions, eleven API statements, eight named tests and the linear-algebra/analytic theorem signatures. The two arithmetic signatures are explicitly omitted until the imported higher K-theory, models and Deligne objects exist; no substitute types claim to represent them. The [packet](../packets/EllipticRegulators--ER.6.json) records these limits and marks every node unchecked.
