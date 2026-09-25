# Coleman integration and noncritical Dirichlet L-values

## Purpose

This roadmap builds **Coleman's $p$-adic integration** on curves with good reduction, applies it to the
projective line minus $\{0,1,\infty\}$ to obtain **Coleman's $p$-adic polylogarithms** $\mathrm{Li}_k$, and uses
their values at roots of unity to prove **Coleman's formula for the Kubota–Leopoldt $p$-adic $L$-function at
positive integers**. The spine is Joaquín Rodrigues Jacinto and Chris Williams, *An introduction to $p$-adic
$L$-functions* (arXiv:2309.15692v2; Essential Number Theory **4** (2025) 101–216), §6: Theorem 6.1 (Leopoldt's
formula at $s=1$) and Theorem 6.7 (the positive integers). The integration theory follows Besser, *Coleman
integration using the Tannakian formalism* (arXiv:math/0011269; Math. Ann. **322** (2002)) and his Heidelberg
lectures, Balakrishnan–Bradshaw–Kedlaya, *Explicit Coleman integration for hyperelliptic curves*
(arXiv:1004.4936v2) and Furusho, *$p$-adic multiple zeta values I* (arXiv:math/0304085v2), but it is carried out
directly by successive extensions, so no Tannakian theorem is an unowned prerequisite. The polylogarithm layer
follows Besser–de Jeu (*The syntomic regulator for the K-theory of fields*, Ann. Sci. ENS **36** (2003)),
Besser–Buckingham–de Jeu–Roblot (arXiv:0707.3682v2), Bannai–Hagihara–Yamada–Yamamoto (arXiv:2003.08157v2) and
Besser, *Finite and $p$-adic polylogarithms* (arXiv:math/0006051). Coleman's own paper (*Dilogarithms, regulators
and $p$-adic $L$-functions*, Invent. Math. **69** (1982)) has no public copy and is never cited as read; every
result the sources attribute to it is proved here from the layers below.

The main mathematical finding concerns the target itself. Theorem 6.7(ii) of the notes, as printed in the preprint
and in the version of record, reads $L_p(\theta,k) = (1-\theta(p)p^{-k})\,G(\theta^{-1})^{-1}\sum_c
\theta^{-1}(c)\,\mathrm{Li}_{k,p}(\varepsilon_N^c)$. With the notes' own normalisation of $L_p$ (Definition 5.18)
this is false whenever $k \not\equiv 1 \pmod{p-1}$: for $p=5$, $\theta=\chi_{-3}$ and $k=2$ the left side vanishes
(the character is odd) while the right side is a $5$-adic unit. The correct statement, which this roadmap proves
for every nontrivial primitive $\theta$ and every $k\ge 1$, is

$$L_p(\theta\omega^{1-k},k) = \bigl(1-\theta(p)p^{-k}\bigr)\,G(\theta^{-1})^{-1}\sum_{c\in(\mathbb Z/N)^\times}
\theta^{-1}(c)\,\mathrm{Li}_k(\varepsilon_N^c),$$

with $\mathrm{Li}_k$ Coleman's polylogarithm for the Iwasawa branch (source issue `ColemanIntegration/E15`).

## How this document is organized

There is one section per layer. Each section opens with what the layer does, then gives its objects
(definitions and constructions, with the suggested module, the statement, the API declarations and the unit tests
that pin the definition down), then its lemmas, theorems and comparisons (statement, hypotheses, proof outline,
acceptance tests and the results used), then what is still missing. The blueprint packet
`research/blueprint/packets/ColemanIntegration.json` carries the same material with source locators and excerpts,
and `research/blueprint/suggested/ColemanIntegration.lean` sketches the Lean signatures in the namespace
`TauCeti.ColemanIntegration`. The document ends with the source issues found, the restructuring proposals, the
numerical checks and the sources read.

## Scope and boundaries

**In scope.** L0: power series on discs and annuli of $\mathbb C_p$, termwise integration and its radius loss,
residues, logarithmic primitives and the branches of the $p$-adic logarithm. L1: Frobenius continuation on curves
with good reduction, Coleman functions and the Coleman integral, the uniqueness principle, independence of the
Frobenius lift, pullback and branch independence, and the direct construction on $\mathbb P^1$ minus $0$, $\infty$
and the $N$-th roots of unity ($p\nmid N$). L2: Coleman's polylogarithms with all their relations, their values at
roots of unity and the dilogarithm identities. L3: Coleman's formula at every positive integer, the complex
formula, the case $k=1$, comparisons with the other proofs, and the syntomic-regulator interpretation, with the
$p$-adic Beilinson conjecture stated as a proposition and proved for Dirichlet motives.

**Out of scope, recorded as gaps.** The algebraic de Rham comparison and lift independence for general curves when
the differentials are not free (L1); the five-term relation in maximally degenerate configurations (L2); the proof
of Besser–de Jeu Theorem 1.10(2) and complex Artin $L$-functions with coefficients (L3).

**Boundaries with neighbouring roadmaps.**

- `DirichletPadicLFunctions` owns Gauss sums, the measures $\mu_b$ and $\mu_\theta$, the pseudo-measure
  $\zeta_p$, the definition of $L_p(\psi,s)$ and Leopoldt's formula (Theorem 6.1). L3 requests them. This roadmap
  owns the logarithm and its branches (accepted proposal RS-14), which the Dirichlet layer imports.
- `LocallyAnalyticDistributions` L1 owns the ring $\mathcal R^+$, locally analytic distributions and the Amice
  transform; L0 here owns functions on arbitrary open discs of $\mathbb C_p$ and the unique primitive there.
- `PadicMeasuresIwasawaAlgebras` owns bounded Mahler–Amice theory over $\mathcal O_K$ and the evaluation of
  pseudo-measures.
- `AdicSpacesPartII` (F1, R2), `PadicHodgeTheory` (P7, annulus foundations) and
  `PadicDifferentialEquationsAndRigidCohomology` (RD.0, RD.4–RD.6) own dagger algebras, Laurent rings of annuli,
  the generic fibre and residue discs, Frobenius lifts, rigid cohomology and its weights. L1 imports them.
- `Polylogarithms` owns the complex polylogarithm (P.1) and de Jeu's complexes (P.4); `PadicHodgeRegulators` owns
  the syntomic regulator (D.2) and consumes the branch, Frobenius and dilogarithm identities of L2 (D.1).
- `AnabelianGeometryAndNonabelianChabauty` NC.2 owns the Tannakian fundamental group and path torsors; L1 owns
  the de Rham word algebra with Frobenius and its Coleman realisation.
- `EffectiveDiophantineMethods` ED.4 should own the comparison of Coleman integrals with abelian integrals, which
  needs the logarithm of the Jacobian.

## Conventions

- $p$ is a prime, $\mathbb C_p$ is normalised by $|p| = p^{-1}$, and $v = v_p$ with $v(p) = 1$. $D^-(c,r)$ is the
  open disc; the residue disc of $x$ is $D^-(x,1)$.
- $\log_a$ is the branch of the $p$-adic logarithm with $\log_a(p) = a$; the **Iwasawa branch** is
  $\log_p = \log_0$. Changing the branch: $\log_b = \log_a + (b-a)\,v$.
- $U_N = \mathbb P^1\smallsetminus(\{0,\infty\}\cup\mu_N)$ with $p\nmid N$, and $U = U_1 = \mathbb P^1\smallsetminus
  \{0,1,\infty\}$, with the Frobenius lift $\varphi(z) = z^p$.
- Words: the letter $e_0$ stands for $dz/z$ and $e_\zeta$ for $dz/(z-\zeta)$; the first letter is the outermost
  integral; realisations are normalised at the **tangential base point at $0$** (constant term $0$ at the end $0$).
  Then $L_{e_0} = \log_a z$ and $L_{e_1} = \log_a(1-z)$.
- $\mathrm{Li}_0(z) = z/(1-z)$, $\mathrm{Li}_1(z) = -\log_a(1-z)$, $d\,\mathrm{Li}_k = \mathrm{Li}_{k-1}\,dz/z$, and
  $\mathrm{Li}_k(z) = \sum_{n\ge1} z^n/n^k$ for $|z|<1$; equivalently $\mathrm{Li}_k = -L_{e_0^{k-1}e_1}$. The
  modified polylogarithm is $\mathrm{Li}^{(p)}_k(z) = \mathrm{Li}_k(z) - p^{-k}\mathrm{Li}_k(z^p)$, and
  $\zeta_p(k) = \mathrm{Li}_k(1)$ for $k\ge2$. A superscript $a$ records the branch; without it the Iwasawa branch
  is meant.
- Characters: $\theta$ is primitive of conductor $N = Dp^n$ with $p\nmid D$, $G(\theta^{-1}) = \sum_c
  \theta^{-1}(c)\varepsilon_N^c$ for a primitive $N$-th root of unity $\varepsilon_N$, $\omega$ is the Teichmüller
  character, and $L_p(\psi,s)$ is normalised as in the notes' Definition 5.18.
- On $\mathcal R^+$, $\partial = (1+T)\,d/dT$, which corresponds to multiplication by $x$ on distributions.

## L0 Analytic differential equations on residue discs

This layer supplies the analysis the later layers integrate with. Termwise integration divides the $n$-th coefficient by $n+1$, and $|1/(n+1)|$ can be as large as $n+1$: the radius-loss estimate shows that the open disc of convergence survives while convergence on the closed disc is lost, with the counterexample $\sum p^k X^{p^k-1}$. On an open disc a function has a unique primitive with a prescribed value at a point; among locally analytic functions it does not, which is why L1 is needed. On an annulus a differential is exact exactly when its residue vanishes; otherwise a primitive needs a logarithm, and the ring $\mathcal O(A)[\ell]$ with $\ell \mapsto \log_a(z-e)$ makes every differential integrable. The branches $\log_a$ are the homomorphisms $\mathbb C_p^\times \to \mathbb C_p$ that extend the logarithm series on $1+\mathfrak m$ and send $p$ to $a$. Dagger algebras and Laurent rings of annuli are imported.

### Objects

#### Definition. The normalised formal primitive of a power series

*Module* `TauCeti/RingTheory/PowerSeries/Primitive.lean`. *Node* `ColemanIntegration:L0/formal-primitive`.

Let A be a commutative ring which is a Q-algebra. The normalised formal primitive is the A-linear map PowerSeries.primitive : A[[X]] -> A[[X]] with constant coefficient 0 and coeff (n+1) (primitive f) = (n+1)^(-1) * coeff n f for all n >= 0; that is, primitive (sum a_n X^n) = sum a_n X^(n+1)/(n+1). It is the unique power series with derivative f (Mathlib's PowerSeries.derivative) and constant coefficient zero (L0/derivative-formal-primitive, L0/formal-primitive-unique).

*Hypotheses.* A is a commutative ring with an algebra structure over Q (every positive integer is invertible in A). Without the Q-algebra hypothesis the construction is not available: over ZMod p the monomial X^(p-1) is not a derivative.

*API.*

- `PowerSeries.primitive` (*constructor*) — For a commutative Q-algebra A, the A-linear map A[[X]] -> A[[X]], sum a_n X^n |-> sum a_n X^(n+1)/(n+1).
- `PowerSeries.coeff_zero_primitive` (*simp*) — coeff 0 (primitive f) = 0.
- `PowerSeries.coeff_succ_primitive` (*simp*) — coeff (n+1) (primitive f) = (n+1)^(-1) * coeff n f.
- `PowerSeries.derivative_primitive` (*characterisation*) — d/dX (primitive f) = f (promoted to L0/derivative-formal-primitive).
- `PowerSeries.primitive_derivative` (*characterisation*) — primitive (d/dX f) = f - C (constantCoeff f).
- `PowerSeries.primitive_X_pow` (*simp*) — primitive (X^n) = (n+1)^(-1) * X^(n+1).
- `PowerSeries.map_primitive` (*functoriality*) — For a morphism of Q-algebras g : A -> B, map g (primitive f) = primitive (map g f).
- `PowerSeries.primitive_eq_log` (*compatibility*) — primitive (mk fun n => (-1)^n) = PowerSeries.log A, Mathlib's formal log(1 + X).

*Used by.*

- `ColemanIntegration:L0/disc-primitive-unique` — the primitive of a function analytic on an open disc is the formal primitive of its expansion at the base point
- `ColemanIntegration:L0/annulus-exact-iff-residue-zero` — termwise integration of both tails of a Laurent series
- Balakrishnan-Bradshaw-Kedlaya, Algorithm 8 — tiny Coleman integrals are formal primitives of expansions in a local parameter
- McCallum-Poonen, Section 5.2(3) — the integral of a differential on a residue class is the series I(t) with I' = w
- `EffectiveDiophantineMethods:ED.4` — residue-disc zero bounds are applied to the formal primitive I(t) of the local expansion of a differential

*Unit tests.* A wrong definition fails one of these.

- `PowerSeries.primitive_one` (computation) — primitive (1 : A[[X]]) = X.
- `PowerSeries.primitive_zero` (degenerate) — primitive (0 : A[[X]]) = 0.
- `PowerSeries.primitive_geometric_eq_log` (compatibility) — primitive (mk fun n => (-1 : A)^n) = PowerSeries.log A (Mathlib's formal logarithm of 1 + X).
- `PowerSeries.not_exists_derivative_eq_X_pow_pred` (non-example) — Over ZMod p there is no g with d/dX g = X^(p-1): the coefficient of X^(p-1) in d/dX g is p * coeff p g = 0. Hence the Q-algebra hypothesis cannot be dropped.

*Construction.*

1. Define primitive f := PowerSeries.mk (fun n => if n = 0 then 0 else (n : A)^(-1) * coeff (n-1) f), the inverse being the image of 1/n under algebraMap Q A.
2. A-linearity follows coefficientwise from the linearity of coeff.
3. The derivative identity and the uniqueness statement are the lemma nodes L0/derivative-formal-primitive and L0/formal-primitive-unique.

*Acceptance.*

- primitive 1 = X and primitive (X^n) = X^(n+1)/(n+1).
- primitive of the geometric series sum (-1)^n X^n is Mathlib's PowerSeries.log A, the formal log(1 + X).

*Uses.* `mathlib:PowerSeries.derivative`, `mathlib:PowerSeries.log`.

*Sources.*

- Explicit Coleman integration for hyperelliptic curves, Section 3.2, Algorithm 8, step 2, p. 6 (arXiv v2): “Formally integrate the power series in t: int_P^Q omega_i = int_P^Q x^i dx/2y = int_0^1 x(t)^i/(2y(t)) dx(t)/dt dt.” Tiny Coleman integrals are computed by formal termwise integration of a power series in a local parameter: the operation defined here.
- The method of Chabauty and Coleman, Section 5.2, item (3), p. 6: “(3) The function eta on the residue class is represented by a series I(t) in Q_p[[t]] (usually no longer in Z_p[[t]]) whose derivative is w(t).” The integral on a residue class is the formal primitive I(t) of the expansion w(t); its coefficients leave Z_p[[t]] because of the division by n.

#### Definition. Analytic functions on an open disc

*Module* `TauCeti/Analysis/Nonarchimedean/DiscAnalytic.lean`. *Node* `ColemanIntegration:L0/disc-analytic-functions`.

Let K be a complete nontrivially normed ultrametric field, a in K and r in (0, infinity]. The ring O_K(D^-(a, r)) of analytic functions on the open disc D^-(a, r) = Metric.ball a r is the K-subalgebra of functions f : D^-(a, r) -> K for which there is a formal multilinear series P with HasFPowerSeriesOnBall (any extension of) f P a r; equivalently f(z) = sum_n c_n (z - a)^n with |c_n| rho^n -> 0 for every rho < r. In the rigid-analytic language these are the global functions on the open disc; for K = C_p, a = 0, r = 1 and coefficients in L they form the ring R^+ of RJW Remark 3.39, the target of Amice's transform (LocallyAnalyticDistributions:L1). Two facts particular to the ultrametric case are part of the definition's API: the ring does not depend on the centre (D^-(a', r) = D^-(a, r) for every a' in D^-(a, r)), and a function in it that vanishes on a nonempty open subset vanishes identically.

*Hypotheses.* K complete, nontrivially normed, ultrametric; characteristic zero where primitives are used. r in (0, infinity] (ENNReal); r = infinity gives entire functions.

*API.*

- `discAnalytic` (*constructor*) — discAnalytic K a r : Subalgebra K (Metric.ball a r -> K), the functions given on the ball by one convergent power series.
- `mem_discAnalytic_iff` (*characterisation*) — f is in discAnalytic K a r iff there is P with HasFPowerSeriesOnBall (extension of f) P a r.
- `discAnalytic.coeff` (*projection*) — The coefficient sequence of f at the centre a, unique by HasFPowerSeriesAt.eq_formalMultilinearSeries.
- `discAnalytic.deriv_mem` (*structure*) — f in discAnalytic implies deriv f in discAnalytic (termwise, same radius).
- `discAnalytic.recentre` (*equivalence*) — For a' in Metric.ball a r, discAnalytic K a r = discAnalytic K a' r (same ball, recentred series).
- `discAnalytic.restrict` (*functoriality*) — Restriction to D^-(b, r') for D^-(b, r') contained in D^-(a, r) maps discAnalytic K a r to discAnalytic K b r'.
- `discAnalytic.eq_zero_of_eqOn` (*extensionality*) — If f vanishes on a nonempty open subset of the ball then f = 0.
- `discAnalytic.equivRPlus` (*compatibility*) — For a = 0, r = 1 the coefficient map is an isomorphism onto the ring R^+ of LocallyAnalyticDistributions:L1 (power series with |a_n| rho^n -> 0 for all rho < 1).
- `discAnalytic.ofIsRestricted` (*coercion*) — A power series restricted at some rho > r (in particular an element of a dagger or Tate algebra at radius > r) defines an element.

*Used by.*

- Besser, Heidelberg lectures, Definition 3 — locally analytic functions are given by a convergent power series on each residue disc
- Besser, Coleman integration using the Tannakian formalism, Section 5 — A(U_x) for a residue disc U_x, on which d is surjective
- Furusho, p-adic MZV I, Section 2.1 — A^a_log(U_x) = A(]x[) for x in Y(F_p-bar)
- `ColemanIntegration:L1/locally-analytic-log-functions` — the components of A_loc at residue discs of Y_k
- `LocallyAnalyticDistributions:L1` — the target R^+ of the Amice transform is the case a = 0, r = 1
- `ColemanIntegration:L1/word-algebra-local-expansion` — local horizontal sections of the unipotent word algebra live in this ring

*Unit tests.* A wrong definition fails one of these.

- `discAnalytic_logOneAdd` (computation) — For K = C_p, the function z |-> NormedSpace.logOneAdd K K z restricted to D^-(0, 1) lies in discAnalytic K 0 1, with coefficients (-1)^(n+1)/n.
- `discAnalytic_indicator_not_mem` (non-example) — The indicator function of D^-(0, 1/p) on D^-(0, 1) in C_p is AnalyticOnNhd (locally constant) but is not in discAnalytic C_p 0 1.
- `discAnalytic_const` (degenerate) — Constant functions lie in discAnalytic K a r for every r, including r = infinity.
- `discAnalytic_geometric` (compatibility) — The geometric series z |-> sum z^n is in discAnalytic C_p 0 1 but its coefficient sequence is not PowerSeries.IsRestricted at 1 (not in the Tate algebra).

*Construction.*

1. Membership is Mathlib's predicate: exists P, HasFPowerSeriesOnBall f P a r (mathlib:HasFPowerSeriesOnBall).
2. Subalgebra: sums and products of series convergent on the ball converge on the ball (Mathlib's HasFPowerSeriesOnBall.add and products of analytic functions).
3. Derivative: mathlib:HasFPowerSeriesOnBall.fderiv gives the termwise derivative series on the same ball, and mathlib:FormalMultilinearSeries.radius_le_radius_derivSeries shows the radius does not shrink.
4. Recentring: for a' in the ball, the ball around a' of radius r is the same set (ultrametric) and the recentred series converges on it (changeOrigin).
5. Coefficients are unique by mathlib:HasFPowerSeriesAt.eq_formalMultilinearSeries; vanishing on an open subset forces all coefficients at an interior point to vanish, hence f = 0 on the whole ball after recentring.
6. The comparison with R^+ at a = 0, r = 1 is supplied through the request to LocallyAnalyticDistributions:L1.

*Acceptance.*

- logOneAdd restricted to D^-(0, 1) in C_p lies in the ring, with coefficients (-1)^(n+1)/n.
- The indicator of D^-(0, 1/p) is locally analytic on D^-(0, 1) but not in the ring.

*Uses.* `mathlib:HasFPowerSeriesOnBall`, `mathlib:Metric.ball`, `mathlib:HasFPowerSeriesOnBall.fderiv`, `mathlib:FormalMultilinearSeries.radius_le_radius_derivSeries`, `mathlib:HasFPowerSeriesAt.eq_formalMultilinearSeries`, `mathlib:AnalyticOnNhd`, `mathlib:PowerSeries.IsRestricted`, `LocallyAnalyticDistributions:L1`.

*Sources.*

- An introduction to p-adic L-functions, Remark 3.39, p. 24 (arXiv v2): “An L-valued function on B(0, 1) is rigid analytic if it can be written as a power series sum_{n>=0} a_n T^n in L[[T]] that is everywhere convergent on B(0, 1) (i.e. |a_n|r^n -> 0 as n -> infinity for all r < 1)” The case a = 0, r = 1: rigid analytic functions on the open unit ball are the everywhere convergent power series R^+.
- Heidelberg lectures on Coleman integration, Section 1.3.1, pp. 4-5: “O(B°_n) = { sum a_I t^I , lim_{I -> infinity} |a_I| r^|I| = 0 for any r < 1 }” The ring of functions of the open polydisc; the one-variable case is this node.
- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “The differential d:A(U_x) -> Omega^1(U_x) is surjective when U_x is a disc. On the other hand, when U_x is an annulus there is no integral to dz/z. To integrate it one needs to introduce a logarithm” A(U_x) for a residue disc U_x is this ring, on which d is surjective.

#### Definition. The residue of a differential on an annulus

*Module* `TauCeti/Analysis/Nonarchimedean/Annulus/Residue.lean`. *Node* `ColemanIntegration:L0/annulus-residue`.

Let K be a complete subfield of C_p, e in K a centre, 0 <= r < s <= infinity, and A = A(e; r, s) = {z in C_p : r < |z - e| < s} (around infinity use the coordinate 1/z). Let O_K(A) be the ring of Laurent series f = sum_{n in Z} a_n (z - e)^n, a_n in K, with |a_n| rho^n -> 0 as |n| -> infinity for every rho in (r, s), as functions on A(C_p) (the carrier constructed in PadicHodgeTheory:P7:annulus-foundations). For a differential omega = f dz with f in O_K(A), res_A(omega) := a_(-1). The same definition applies to the germ ring R_e = colim_{r -> 1} O_K(A(e; r, 1)) of the end of a residue disc, the only case in which A is not a full punctured disc.

*Hypotheses.* K complete subfield of C_p (or any complete ultrametric field of characteristic zero). 0 <= r < s <= infinity; the residue is taken with respect to the coordinate z - e, oriented so that |z - e| increases outwards.

*API.*

- `annulusResidue` (*constructor*) — annulusResidue A : (O_K(A) dz) ->L[K] K, f dz |-> a_(-1).
- `annulusResidue_d` (*simp*) — annulusResidue A (d g) = 0 for g in O_K(A).
- `annulusResidue_dz_div` (*simp*) — annulusResidue A (dz/(z - e)) = 1 and annulusResidue A ((z - e)^n dz) = 0 for n != -1.
- `annulusResidue_coord` (*equivalence*) — Invariance under orientation-preserving automorphisms t = u (z - e)(1 + h) of A with |u| = 1, |h| < 1.
- `annulusResidue_inv` (*relation*) — Under t = 1/(z - e) the residue changes sign.
- `annulusResidue_restrict` (*functoriality*) — Compatible with restriction to a sub-annulus A(e; r', s') with r <= r' < s' <= s and with passage to the end germ ring R_e.
- `annulusResidue_laurentSeries` (*compatibility*) — For r = 0 and f meromorphic at e (finitely many negative powers) the residue is the coefficient of X^(-1) of the corresponding Mathlib LaurentSeries.

*Used by.*

- Balakrishnan-Bradshaw-Kedlaya, Definition 1 — the coefficient c_(-1) multiplies Log(Q/P) in the integral on annuli
- `ColemanIntegration:L0/annulus-exact-iff-residue-zero` — the obstruction to an analytic primitive
- `ColemanIntegration:L0/annulus-log-primitive` — the coefficient of the log-branch term
- `ColemanIntegration:L1/punctured-line-de-rham-h1` — the coordinates of H^1 of P^1 minus {0, infinity, mu_N} are residues at the ends
- `ColemanIntegration:L1/residue-disc-parametrisation` — residues at the ends of a wide open do not depend on the local parameter
- `EffectiveDiophantineMethods:ED.4` — meromorphic differentials with poles in exceptional residue discs

*Unit tests.* A wrong definition fails one of these.

- `annulusResidue_dz_div_z` (computation) — On A(0; r, s), annulusResidue (dz/z) = 1 and annulusResidue (z^2 dz) = 0.
- `annulusResidue_inv_sign` (compatibility) — Pulling dz/z back along z = 1/w gives -dw/w, whose residue in w is -1.
- `annulusResidue_zero` (degenerate) — annulusResidue A 0 = 0, and on a full disc (no negative powers) every residue is 0.
- `annulusResidue_pole_outside` (non-example) — For |c - e| >= s the form dz/(z - c) is analytic on A with residue 0, although as a rational form it has a pole with residue 1: the residue on A is not the algebraic residue at a chosen point.

*Construction.*

1. Define res on O_K(A) dz as the K-linear coefficient functional a_(-1).
2. res(dg) = 0 for g in O_K(A): the coefficient of (z-e)^(-1) in g' is 0 * b_0 = 0.
3. Coordinate independence: for an automorphism t = u (z - e)(1 + h) of A with |u| = 1 and |h| < 1 on A, dt/t = dz/(z-e) + d(log(u(1+h))) with log(u(1+h)) in O_K(A) (L0/log-one-add-convergence), so residues agree; under t = 1/(z - e) the orientation reverses and res changes sign.

*Acceptance.*

- res(dz/z) = 1 and res(z^n dz) = 0 for n != -1.
- For |c - e| <= r the form dz/(z - c) has residue 1 on A, for |c - e| >= s it has residue 0.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations`, `mathlib:LaurentSeries`, `mathlib:IsUltrametricDist`.

*Sources.*

- Explicit Coleman integration for hyperelliptic curves, Section 2, Definition 1, p. 3 (arXiv v2): “For sum_{i in Z} c_i t^i dt in Omega^1_{A(I)/C_p} and P, Q in A(I), define int_P^Q sum c_i t^i dt = c_{-1} Log(Q/P) + sum_{i != -1} c_i/(i+1) (Q^(i+1) - P^(i+1)). This is easily shown not to depend on the choice of the coordinate t.” The coefficient c_(-1) is the residue; the integral formula is coordinate independent, which is the invariance recorded in the API.
- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “The differential d:A(U_x) -> Omega^1(U_x) is surjective when U_x is a disc. On the other hand, when U_x is an annulus there is no integral to dz/z. To integrate it one needs to introduce a logarithm” On an annulus dz/z has no integral: its residue is 1.

#### Definition. The branches log_a of the p-adic logarithm

*Module* `TauCeti/NumberTheory/Padics/LogBranch.lean`. *Node* `ColemanIntegration:L0/log-branch`.

Fix a prime p and a in C_p. The branch log_a : C_p^x -> C_p is defined by log_a(x) := (log(x^N p^(-m)) + m a)/N for any N >= 1 and m in Z with x^N p^(-m) in 1 + m_{C_p} (L0/cp-unit-power-principal), where log is the series of L0/log-one-add-convergence. It is independent of the pair (N, m), a group homomorphism (C_p^x, *) -> (C_p, +), equal to the series on 1 + m_{C_p}, with log_a(p) = a; and it is the unique homomorphism with these last two properties. It vanishes at all roots of unity, satisfies log_a(-x) = log_a(x), and is locally analytic with d log_a = dz/z (L0/log-branch-local-expansion). The Iwasawa branch is log_p := log_0 (L0/iwasawa-logarithm).

*Hypotheses.* p prime; a in C_p. As a Lean function on all of C_p the value at 0 is the junk value 0.

*API.*

- `padicLogBranch` (*constructor*) — padicLogBranch p a : C_p -> C_p, the branch log_a (value 0 at 0).
- `padicLogBranch_mul` (*simp*) — For x, y != 0, log_a(x y) = log_a(x) + log_a(y).
- `padicLogBranch_p` (*simp*) — log_a(p) = a.
- `padicLogBranch_one_add` (*compatibility*) — For ||u|| < 1, log_a(1 + u) = NormedSpace.logOneAdd C_p C_p u (Tau Ceti's series).
- `padicLogBranch_pow` (*simp*) — log_a(x^n) = n log_a(x) and log_a(x^(-1)) = -log_a(x).
- `padicLogBranch_rootOfUnity` (*simp*) — If zeta^m = 1 with m >= 1 then log_a(zeta) = 0; in particular log_a(-x) = log_a(x).
- `padicLogBranch_unique` (*characterisation*) — A group homomorphism C_p^x -> C_p that agrees with the series on 1 + m and sends p to a equals log_a.
- `padicLogBranch_sub` (*relation*) — log_b(x) - log_a(x) = (b - a) v_p(x) (promoted to L0/log-branch-change).
- `padicLogBranch_hasDerivAt` (*other*) — For x != 0, log_a has derivative 1/x at x and is given on D^-(x, |x|) by one power series (promoted to L0/log-branch-local-expansion).
- `padicLogBranch_map` (*functoriality*) — For a continuous field automorphism sigma of C_p, log_(sigma a)(sigma x) = sigma(log_a x) (L0/log-branch-field-compatibility).

*Used by.*

- RJW, Theorem 6.1(ii) and its proof — log_p(1 - eps_N^c) and log_p(x) = log_p(-x)
- Furusho, p-adic MZV I, Section 2.1 — the branch parameter a of Coleman functions and of p-adic multiple polylogarithms
- Balakrishnan-Bradshaw-Kedlaya, Section 2 — the branch Log in the integral of dz/z on annuli
- `ColemanIntegration:L0/annulus-log-ring` — the realisation of the formal symbol l = log z on annuli
- `ColemanIntegration:L1/locally-analytic-log-functions` — the branch fixes the end components of A_loc
- `ColemanIntegration:L2` — Li_1(z) = -log_a(1 - z) starts the polylogarithms
- `DirichletPadicLFunctions:L3` — imports the Iwasawa branch (accepted RS-14 ownership)
- `PadicHodgeRegulators:D.1` — branch normalisations of the regulator

*Unit tests.* A wrong definition fails one of these.

- `padicLogBranch_p_eq` (degenerate) — padicLogBranch p a p = a and padicLogBranch p a 1 = 0.
- `padicLogBranch_four_three` (computation) — For p = 3 and every a: log_a(4) = 3 + 2*3^2 + 3^3 + 2*3^5 + 2*3^6 + 3^8 + 2*3^10 + 3^11 modulo 3^12 (PARI/GP).
- `padicLogBranch_teichmuller` (computation) — For p = 5 and zeta in Q_5 with zeta^4 = 1 and zeta = 2 mod 5: log_a(zeta) = 0; and log_a(-2) = log_a(16)/4.
- `padicLogBranch_eq_logOneAdd` (compatibility) — On the open ball of radius 1 around 1 the branch equals Tau Ceti's NormedSpace.logOneAdd composed with u |-> 1 + u.
- `padicLogBranch_not_series` (non-example) — The series sum (-1)^(n+1) (x - 1)^n/n diverges at x = p, so no branch is given by one power series on C_p^x.

*Construction.*

1. Well defined: if (N, m) and (N', m') both work then m/N = m'/N' = v_p(x), and (x^N p^(-m))^(N') = (x^(N') p^(-m'))^N, so N' log(x^N p^(-m)) = N log(x^(N') p^(-m')) by L0/log-one-add-mul; the two formulas agree.
2. Homomorphism: for x, y take a common N; then (xy)^N p^(-(m+m')) is the product of the two principal units, and L0/log-one-add-mul applies.
3. Agreement with the series on 1 + m_{C_p}: take N = 1, m = 0. log_a(p) = a: take N = 1, m = 1.
4. Uniqueness: a homomorphism h with the two properties satisfies N h(x) = h(x^N p^(-m)) + m h(p) = log(x^N p^(-m)) + m a.
5. Roots of unity map to 0 because the target is torsion free; log_a(-x) = log_a(-1) + log_a(x) = log_a(x).

*Acceptance.*

- log_a(p) = a and log_a(1 + p) = sum (-1)^(n+1) p^n/n for every a.
- log_a(zeta) = 0 for the Teichmueller lift zeta of 2 in Q_5 (zeta^4 = 1); PARI/GP returns O(5^10).
- The naive series does not converge at x = p since |p - 1| = 1: log_a is not one power series on C_p^x.

*Uses.* `ColemanIntegration:L0/log-one-add-convergence`, `ColemanIntegration:L0/log-one-add-mul`, `ColemanIntegration:L0/cp-unit-power-principal`, `tauceti:NormedSpace.logOneAdd`, `mathlib:PadicComplex`.

*Planet:* Branches of the p-adic logarithm.

*Sources.*

- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Section 2.1, p. 7 (arXiv v2): “Fix a in C_p. It determines a branch of p-adic logarithm log^a : C_p^x -> C_p ([Bes1]Definition 2.6) which is characterized by log^a(p) = a. We call this a in C_p the branch parameter of p-adic logarithm.” The branch parameter a with log^a(p) = a, exactly as defined here.
- Explicit Coleman integration for hyperelliptic curves, Section 2, opening paragraph, p. 3 (arXiv v2): “Choose once and for all a branch of the p-adic logarithm, i.e., a homomorphism Log : C_p^x -> C_p whose restriction to the disc {x in C_p : |x - 1| < 1} is given by the logarithm series log(x) = sum_{i=1}^infinity (1-x)^i/i.” A branch is a homomorphism C_p^x -> C_p restricting to the series (sign corrected, ColemanIntegration/E1).
- An introduction to p-adic L-functions, Proof of Theorem 6.1(ii), p. 38 (arXiv v2): “To complete the proof, we simply evaluate the expression F~_theta(0) (and use that log_p(x) = log_p(-x) for x in C_p^x) to find, for all N, that” RJW use log_p(x) = log_p(-x), a property of every branch recorded in the API.

#### Definition. The Iwasawa logarithm log_p

*Module* `TauCeti/NumberTheory/Padics/LogBranch.lean`. *Node* `ColemanIntegration:L0/iwasawa-logarithm`.

The Iwasawa branch of the p-adic logarithm is log_p := log_0 (L0/log-branch): the unique group homomorphism C_p^x -> C_p that is the series log(1 + u) on 1 + m_{C_p} and satisfies log_p(p) = 0. It is equivariant under every continuous field automorphism of C_p, maps K^x into K for every finite extension K of Q_p inside C_p, and log_a = log_p + a v_p. This is the branch used for every statement about L-values in ColemanIntegration:L3 and imported by DirichletPadicLFunctions:L3 (ownership: ColemanIntegration:L0, accepted restructuring RS-14).

*Hypotheses.* p prime.

*API.*

- `iwasawaLog` (*constructor*) — iwasawaLog p := padicLogBranch p 0.
- `iwasawaLog_p` (*simp*) — iwasawaLog p p = 0.
- `padicLogBranch_eq_iwasawaLog_add` (*relation*) — padicLogBranch p a x = iwasawaLog p x + a * v_p(x) for x != 0.
- `iwasawaLog_map` (*compatibility*) — iwasawaLog p (sigma x) = sigma (iwasawaLog p x) for every continuous field automorphism sigma of C_p.
- `iwasawaLog_mem_of_finite` (*structure*) — For K a finite extension of Q_p inside C_p and x in K^x, iwasawaLog p x lies in K.
- `iwasawaLog_of_unit` (*simp*) — On units of O_{C_p} the Iwasawa logarithm agrees with every branch.

*Used by.*

- RJW, Theorems 6.1(ii) and 6.7(ii) — the logarithm and polylogarithm values at roots of unity
- `ColemanIntegration:L3` — Theorem 6.7 is stated with the Iwasawa branch
- `DirichletPadicLFunctions:L3` — Leopoldt's formula, nonvanishing of log_p(a), branches of L_p
- `PadicHodgeRegulators:D.1` — the fixed branch of the regulator comparison
- PARI/GP — its p-adic log implements this branch, used for the numerical tests

*Unit tests.* A wrong definition fails one of these.

- `iwasawaLog_p_pow` (degenerate) — iwasawaLog p (p^k) = 0 for all k.
- `iwasawaLog_sixtyThree` (computation) — In Q_3: iwasawaLog 3 63 = iwasawaLog 3 7.
- `iwasawaLog_galois` (characterisation) — iwasawaLog commutes with every continuous automorphism of C_p; a branch log_a with a not in Q_p does not (sigma(a) != a for some sigma).
- `iwasawaLog_ne_branch_one` (non-example) — padicLogBranch p 1 agrees with iwasawaLog on units but padicLogBranch p 1 p = 1 != 0.

*Construction.*

1. Specialise L0/log-branch at a = 0.
2. Galois equivariance and values in finite extensions: L0/log-branch-field-compatibility with sigma(0) = 0.
3. Relation to other branches: L0/log-branch-change.

*Acceptance.*

- log_p(p) = 0; for x = p^k u with u in Z_p^x, log_p(x) = log(u^(p-1))/(p-1).
- In Q_3: log_p(63) = log_p(7) (PARI/GP: difference O(3^10)); PARI/GP's p-adic log is the Iwasawa branch (log(3 + O(3^12)) = O(3^11)).

*Uses.* `ColemanIntegration:L0/log-branch`, `ColemanIntegration:L0/log-branch-change`, `ColemanIntegration:L0/log-branch-field-compatibility`.

*Planet:* Iwasawa logarithm.

*Sources.*

- An introduction to p-adic L-functions, Theorem 6.1(ii), p. 36 (arXiv v2): “(ii) (p-adic value at s = 1). We have L_p(theta, 1) = -(1 - theta(p)p^-1) (1/G(theta^-1)) sum_{c in (Z/NZ)^x} theta^-1(c) log_p(1 - eps_N^c).” RJW's log_p, used without a definition of the branch (ColemanIntegration/E9); the notes' L-value formulas are read with this branch.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Section 2.1, p. 7 (arXiv v2): “Fix a in C_p. It determines a branch of p-adic logarithm log^a : C_p^x -> C_p ([Bes1]Definition 2.6) which is characterized by log^a(p) = a. We call this a in C_p the branch parameter of p-adic logarithm.” The branch parameter a = 0 gives the branch with log(p) = 0.

#### Definition. Functions with logarithmic terms on an annulus

*Module* `TauCeti/Analysis/Nonarchimedean/Annulus/LogRing.lean`. *Node* `ColemanIntegration:L0/annulus-log-ring`.

Let A = A(e; r, s) be an open annulus (or the end germ R_e of a residue disc) over a complete subfield K of C_p and a in C_p a branch. The logarithmic function ring is the polynomial ring O_K(A)[l] in one indeterminate l, with the derivation d extending d on O_K(A) by dl = dz/(z - e); it is realised on points by the ring homomorphism rho_a : O_K(A)[l] -> (A(C_p) -> C_p), sum f_k l^k |-> (z |-> sum f_k(z) log_a(z - e)^k), which commutes with d (L0/log-branch-local-expansion) and is injective (L0/annulus-log-transcendence). This is A_log(U_x) of Besser and A^a_log(U_x) of Furusho at an end; it does not depend on the local parameter (a change t = u (z - e)(1 + h) with |u| = 1 replaces l by l + log_a(u) + log(1 + h), an element of O(A)).

*Hypotheses.* K complete subfield of C_p; a in C_p. A an open annulus A(e; r, s) with r < s, or the end germ colim_{r -> 1} O(A(e; r, 1)).

*API.*

- `AnnulusLogRing` (*constructor*) — The ring O_K(A)[l] with its derivation d, dl = dz/(z - e).
- `AnnulusLogRing.d_ell_pow` (*simp*) — d (l^k) = k l^(k-1) dz/(z - e).
- `AnnulusLogRing.realize` (*data*) — The ring homomorphism rho_a to functions on A(C_p), l |-> log_a(z - e).
- `AnnulusLogRing.realize_injective` (*extensionality*) — rho_a is injective (L0/annulus-log-transcendence).
- `AnnulusLogRing.realize_d` (*compatibility*) — rho_a commutes with d: the derivative of rho_a(F) is rho_a(dF/dz).
- `AnnulusLogRing.changeParam` (*equivalence*) — For t = u (z - e)(1 + h), |u| = 1, |h| < 1, the substitution l |-> l + log_a(u) + log(1 + h) is an isomorphism compatible with d and rho_a.
- `AnnulusLogRing.realize_branch` (*relation*) — rho_b(F) = rho_a(F with l replaced by l + (b - a) v_p(z - e)) as functions (L0/annulus-branch-change).
- `AnnulusLogRing.restrict` (*functoriality*) — Restriction to sub-annuli and to the end germ.

*Used by.*

- Besser, Tannakian formalism, Section 5 — A_log(U_x) for the annular ends in Coleman's A_loc
- Furusho, p-adic MZV I, Section 2.1 and Proposition 2.11 — A^a_log at the ends; p-adic multiple polylogarithms restricted to ]1[ lie in A(]1[)[log^a(t - 1)]
- `ColemanIntegration:L1/locally-analytic-log-functions` — the end components of A_loc
- `ColemanIntegration:L1/word-algebra-local-expansion` — local horizontal sections at the ends
- `ColemanIntegration:L1/punctured-line-singular-disc-expansion` — expansions of polylogarithms on the singular discs
- `ColemanIntegration:L2` — Li_k near 1 and near infinity

*Unit tests.* A wrong definition fails one of these.

- `AnnulusLogRing.d_ell` (computation) — d l = dz/(z - e), and rho_a(l)(e + p) = a when r < 1/p < s.
- `AnnulusLogRing.realize_const` (degenerate) — On polynomials of degree 0 in l, rho_a is the inclusion of O_K(A) as functions.
- `AnnulusLogRing.ell_not_mem` (non-example) — rho_a(l) = log_a(z - e) is not rho_a of any element of O_K(A): dz/(z - e) has residue 1 (L0/annulus-exact-iff-residue-zero).
- `AnnulusLogRing.realize_branch_diff` (compatibility) — rho_b(l) - rho_a(l) = (b - a) v_p(z - e), which is locally constant and non-constant on A(0; p^(-2), 1).

*Construction.*

1. Define the polynomial ring and extend d by the Leibniz rule with dl = dz/(z - e).
2. rho_a is a ring homomorphism by construction; d rho_a = rho_a d by L0/log-branch-local-expansion.
3. Independence of the parameter: log_a(t) = log_a(z - e) + log_a(u) + log(1 + h) by L0/log-branch, and log(1 + h) lies in O(A) by L0/log-one-add-convergence.

*Acceptance.*

- d(l^k) = k l^(k-1) dz/(z - e).
- rho_a(l)(e + p) = log_a(p) = a whenever |p| lies in (r, s).

*Uses.* `ColemanIntegration:L0/annulus-residue`, `ColemanIntegration:L0/log-branch`, `ColemanIntegration:L0/log-branch-local-expansion`, `ColemanIntegration:L0/log-one-add-convergence`, `PadicHodgeTheory:P7:annulus-foundations`.

*Sources.*

- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “define A_log(U_x) to be A(U_x) if U_x is a disc and to be the polynomial ring in the function log(z) over A(U_x) if U_x is an annulus with local parameter z (the choice of the local parameter z does not matter).” A_log(U_x) is the polynomial ring in log(z) over A(U_x) for an annulus, independent of the local parameter.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Section 2.1, p. 7 (arXiv v2): “We note that log^a(z_x) is a locally analytic function defined on ]x[ cap Y(C_p) whose derivation is 1/z_x and it is transcendental over ind-lim_{r->1} A(]x[ cap U_r)” At an end x, A^a_log is the germ ring with log^a(z_x) adjoined; log^a(z_x) is transcendental over it.

### Lemmas, theorems and comparisons

#### Lemma. Norms of integers in an ultrametric field of characteristic zero

*Node* `ColemanIntegration:L0/ultrametric-natcast-bound`.

Let K be a nontrivially normed field whose norm is ultrametric (IsUltrametricDist) and whose characteristic is zero. Then ||(n : K)|| <= 1 for every natural number n, and exactly one of the following holds: (a) ||(n : K)|| = 1 for every n >= 1 (residue characteristic zero); (b) there is a unique prime p with ||(p : K)|| < 1, and then ||(n : K)|| = ||(p : K)||^(v_p(n)) for every n >= 1, where v_p = padicValNat p. Put s := 0 in case (a) and s := log(1/||p||)/log(p) in case (b). Then ||(n : K)||^(-1) <= n^s for every n >= 1. For K a complete subfield of C_p, normalised by |p| = 1/p, s = 1: |1/n| = p^(v_p(n)) <= n.

*Hypotheses.* K is a field with a nontrivial ultrametric norm and CharZero K. No completeness is needed.

*Proof outline.*

1. ||n|| <= 1 by induction on n from ||1|| = 1 and the ultrametric inequality ||a + b|| <= max(||a||, ||b||).
2. If two distinct primes q, l had ||q|| < 1 and ||l|| < 1, a Bezout relation a q + b l = 1 with integers a, b would give 1 = ||a q + b l|| <= max(||q||, ||l||) < 1, a contradiction; so at most one prime has norm < 1.
3. In case (b), for m prime to p choose integers with a m + b p = 1; then 1 <= max(||m||, ||p||) forces ||m|| = 1. Writing n = p^(v_p(n)) m with p not dividing m and using multiplicativity gives ||n|| = ||p||^(v_p(n)).
4. The bound: p^(v_p(n)) <= n, hence ||n||^(-1) = (1/||p||)^(v_p(n)) = p^(s v_p(n)) <= n^s; in case (a) the bound is 1 <= n^0.

*Acceptance.*

- In Q_p, ||(p^k m)|| = p^(-k) for p not dividing m, and the bound |1/n| <= n is attained exactly at n = p^k.
- In the field Q((t)) with the t-adic norm (characteristic zero, ultrametric) case (a) holds and termwise integration loses no radius at all.

*Uses.* `mathlib:IsUltrametricDist`, `mathlib:padicValNat`, `mathlib:CharZero`.

*Sources.*

- Explicit Coleman integration for hyperelliptic curves, Section 2, Remark 2, p. 3 (arXiv v2): “Note that because of the division by i + 1 in the formula for the integral, we are unable to integrate on closed discs or annuli.” The division by i + 1 is the only source of radius loss in termwise integration; this lemma bounds |1/(i+1)| polynomially.
- Heidelberg lectures on Coleman integration, Section 1.3.2, p. 5 (author copy): “Integration reduces the radius of convergence, but only slightly - if the original power series converges to radius r the integral will no longer converge to radius r but will converge to any smaller radius, hence still overconverges.” The loss is 'only slightly' because |1/n| grows at most polynomially, which is the bound proved here.

#### Lemma. The derivative of the normalised formal primitive in characteristic zero

*Node* `ColemanIntegration:L0/derivative-formal-primitive`.

Let A be a commutative Q-algebra and f in A[[X]]. Then d/dX (primitive f) = f and primitive (d/dX f) = f - C(constantCoeff f), where d/dX is Mathlib's PowerSeries.derivative.

*Hypotheses.* A is a commutative Q-algebra.

*Proof outline.*

1. Compare coefficients with mathlib:PowerSeries.coeff_derivative, coeff n (d/dX g) = coeff (n+1) g * (n+1).
2. For g = primitive f this is (n+1)^(-1) coeff n f * (n+1) = coeff n f, using that n+1 is invertible in the Q-algebra A.
3. For primitive (d/dX f) the coefficient at n+1 is (n+1)^(-1) (n+1) coeff (n+1) f = coeff (n+1) f and the constant coefficient is 0.

*Acceptance.*

- The identity fails over ZMod p (test PowerSeries.not_exists_derivative_eq_X_pow_pred of L0/formal-primitive).
- At f = mk (-1)^n it recovers mathlib:PowerSeries.derivative_log_mul_one_add_X.

*Uses.* `ColemanIntegration:L0/formal-primitive`, `mathlib:PowerSeries.coeff_derivative`, `mathlib:PowerSeries.derivative_log_mul_one_add_X`.

*Source.* Heidelberg lectures on Coleman integration, Section 1.3.2, p. 5: “This cokernel is infinite as one can write down a power series sum a_i t^i such that the a_i converge to 0 sufficiently slowly to make the coefficients of the integral sum a_i t^(i+1)/(i+1) not converge to 0.” The integral of sum a_i t^i is sum a_i t^(i+1)/(i+1), the normalised primitive whose derivative is the original series.

#### Lemma. Uniqueness of the formal primitive with given constant term

*Node* `ColemanIntegration:L0/formal-primitive-unique`.

Let A be a commutative Q-algebra, f in A[[X]] and c in A. A power series g satisfies d/dX g = f and constantCoeff g = c if and only if g = C c + primitive f.

*Hypotheses.* A is a commutative Q-algebra (in particular additively torsion free).

*Proof outline.*

1. The 'if' direction is L0/derivative-formal-primitive together with d/dX (C c) = 0.
2. For 'only if', g and C c + primitive f have the same derivative and the same constant coefficient, so they are equal by mathlib:PowerSeries.derivative.ext.

*Acceptance.*

- For f = 0 the only power series with derivative 0 and constant term c is the constant c.

*Uses.* `ColemanIntegration:L0/derivative-formal-primitive`, `mathlib:PowerSeries.derivative.ext`.

*Source.* Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “The differential d:A(U_x) -> Omega^1(U_x) is surjective when U_x is a disc. On the other hand, when U_x is an annulus there is no integral to dz/z. To integrate it one needs to introduce a logarithm” On a disc the primitive exists and, being a power series, is unique once its constant term is fixed.

#### Theorem. Radius-loss estimate for termwise integration

*Node* `ColemanIntegration:L0/formal-primitive-radius`.

Let K be a complete nontrivially normed ultrametric field of characteristic zero and f in K[[X]]. Write R(g) for the radius of convergence of the formal multilinear series FormalMultilinearSeries.ofScalars K (coeff g). Then: (a) R(primitive f) = R(f): termwise integration does not change the radius of convergence. (b) If f is restricted at rho > 0 (PowerSeries.IsRestricted rho f, i.e. |a_n| rho^n -> 0), then primitive f is restricted at every r with 0 < r < rho, with the Gauss-norm bound |primitive f|_r <= C(r, rho) |f|_rho, C(r, rho) = sup_n r^(n+1) |1/(n+1)| / rho^n < infinity; it need not be restricted at rho itself (L0/closed-disc-primitive-failure). (c) Consequently primitive maps the series restricted at some rho' > rho (overconvergent at radius rho, the dagger condition) into themselves, and the series restricted at every r < rho (analytic on the open disc of radius rho) into themselves; the series restricted at rho (the Tate algebra of the closed disc) are not preserved.

*Hypotheses.* K complete, nontrivially normed, ultrametric, characteristic zero; in particular every complete subfield of C_p. rho > 0 is a real number; radii are compared in ENNReal as in Mathlib's FormalMultilinearSeries.radius.

*Proof outline.*

1. By L0/ultrametric-natcast-bound, |1/(n+1)| <= (n+1)^s for a fixed s >= 0.
2. (a) If |a_n| r^n <= C then |a_n/(n+1)| r'^(n+1) <= C r' (n+1)^s (r'/r)^n is bounded for r' < r, so R(primitive f) >= R(f); conversely |a_n| = |n+1| |a_n/(n+1)| <= |a_n/(n+1)| because |n+1| <= 1, so a bound for the primitive at r gives one for f at r and R(f) >= R(primitive f). Conclude with the characterisation of mathlib:FormalMultilinearSeries.radius by bounded sequences.
3. (b) |a_n/(n+1)| r^(n+1) <= r (n+1)^s (r/rho)^n |a_n| rho^n, and (n+1)^s (r/rho)^n -> 0, which gives the restrictedness (PowerSeries.IsRestricted) and the Gauss-norm bound (PowerSeries.gaussNorm).
4. (c) Apply (b) with rho replaced by rho' > rho and r := any number in (rho, rho'); for the open-disc case apply (b) for every pair r < r' < rho.

*Acceptance.*

- For K = C_p (s = 1), rho = 1 and r = 1/p the constant is C(1/p, 1) = max_n p^(v_p(n+1) - n - 1) = 1/p, attained at n = 0 (for n + 1 = p^k m with k >= 1 the exponent is at most 1 - p).
- The example of L0/closed-disc-primitive-failure shows that r = rho cannot be allowed in (b).
- Over a residue-characteristic-zero field (s = 0) restrictedness at rho itself is preserved.

*Uses.* `ColemanIntegration:L0/ultrametric-natcast-bound`, `ColemanIntegration:L0/formal-primitive`, `mathlib:FormalMultilinearSeries.radius`, `mathlib:FormalMultilinearSeries.ofScalars`, `mathlib:PowerSeries.IsRestricted`, `mathlib:PowerSeries.gaussNorm`.

*Planet:* Radius-loss estimate for termwise integration.

*Sources.*

- Heidelberg lectures on Coleman integration, Section 1.3.2, p. 5: “Integration reduces the radius of convergence, but only slightly - if the original power series converges to radius r the integral will no longer converge to radius r but will converge to any smaller radius, hence still overconverges.” States (a)-(c): no loss of the radius itself, loss of convergence on the boundary, preservation of overconvergence.
- Explicit Coleman integration for hyperelliptic curves, Section 2, Remark 2, p. 3 (arXiv v2): “Note that because of the division by i + 1 in the formula for the integral, we are unable to integrate on closed discs or annuli.” The failure on closed discs, part (b) at r = rho.

#### Lemma. Termwise integration fails on the closed disc

*Node* `ColemanIntegration:L0/closed-disc-primitive-failure`.

Let K be a complete ultrametric field of characteristic zero with |p| < 1 for the prime p (for example any complete subfield of C_p). The series f := sum_{k>=0} p^k X^(p^k - 1) is restricted at 1 (it lies in the Tate algebra K<X>, since |p^k| -> 0), but primitive f = sum_{k>=0} X^(p^k) is not restricted at 1 and does not converge at X = 1. Hence d : K<X> -> K<X> dX is not surjective, whereas every f restricted at some rho > 1 (the dagger algebra) and every f analytic on the open unit disc has a primitive of the same kind (L0/formal-primitive-radius (c)).

*Hypotheses.* |p| < 1 in K.

*Proof outline.*

1. Restrictedness of f: the only nonzero coefficients are p^k at X^(p^k - 1), with |p^k| -> 0.
2. The coefficient of X^(p^k) in primitive f is p^k/p^k = 1, which does not tend to 0; so primitive f is not restricted at 1 and its partial sums at X = 1 are k + 1.
3. Any g in K<X> with dg = f dX would equal C c + primitive f by L0/formal-primitive-unique, a contradiction.

*Acceptance.*

- The same example with X replaced by X/rho shows the failure at every radius rho in |K^x|.
- Its image in the ring of functions analytic on the open disc (L0/disc-analytic-functions) does have the primitive sum X^(p^k).

*Uses.* `ColemanIntegration:L0/formal-primitive`, `ColemanIntegration:L0/formal-primitive-unique`, `mathlib:PowerSeries.IsRestricted`.

*Sources.*

- Heidelberg lectures on Coleman integration, Section 1.3.2, p. 5: “This cokernel is infinite as one can write down a power series sum a_i t^i such that the a_i converge to 0 sufficiently slowly to make the coefficients of the integral sum a_i t^(i+1)/(i+1) not converge to 0.” The cokernel of d on the Tate algebra is nonzero because of slowly decaying coefficients; the example here is one such series.
- Explicit Coleman integration for hyperelliptic curves, Section 2, Remark 2, p. 3 (arXiv v2): “Note that because of the division by i + 1 in the formula for the integral, we are unable to integrate on closed discs or annuli.” Integration is impossible on closed discs.

#### Theorem. The unique primitive with chosen base value on an open disc

*Node* `ColemanIntegration:L0/disc-primitive-unique`.

Let K be a complete nontrivially normed ultrametric field of characteristic zero, a in K, r in (0, infinity], f in O_K(D^-(a, r)) (L0/disc-analytic-functions), b in D^-(a, r) and c in K. There is a unique F in O_K(D^-(a, r)) with F' = f and F(b) = c; explicitly F(z) = c + sum_n f_n (z - b)^(n+1)/(n+1) where f(z) = sum_n f_n (z - b)^n is the expansion at b. Uniqueness is among functions analytic on the whole disc; among locally analytic functions it fails (L0/locally-analytic-primitive-nonunique).

*Hypotheses.* K complete, ultrametric, characteristic zero. b lies in the open disc D^-(a, r).

*Proof outline.*

1. Recentre at b (API recentre of L0/disc-analytic-functions): f is given by one series around b converging on D^-(b, r) = D^-(a, r).
2. Take the formal primitive of that series (L0/formal-primitive); its radius equals that of f (L0/formal-primitive-radius (a)), so F lies in the ring.
3. F' = f: the termwise derivative (mathlib:HasFPowerSeriesOnBall.fderiv) of the primitive series is f by L0/derivative-formal-primitive; F(b) = c by construction.
4. Uniqueness: G = F_1 - F_2 is in the ring with G' = 0; the expansion of G at b has (n+1) g_(n+1) = 0 for all n, so g_(n+1) = 0 in characteristic zero (uniqueness of expansions, mathlib:HasFPowerSeriesAt.eq_formalMultilinearSeries), hence G is the constant G(b) = 0.

*Acceptance.*

- The closed-disc analogue is false (L0/closed-disc-primitive-failure).
- On D^-(0, 1) in C_p the primitive of 1/(1 + z) with value 0 at 0 is logOneAdd.
- Changing the base point: the primitive with value c at b equals the primitive with value F(b') at b' for every b' in the disc.

*Uses.* `ColemanIntegration:L0/disc-analytic-functions`, `ColemanIntegration:L0/formal-primitive`, `ColemanIntegration:L0/derivative-formal-primitive`, `ColemanIntegration:L0/formal-primitive-radius`, `mathlib:HasFPowerSeriesOnBall.fderiv`, `mathlib:HasFPowerSeriesAt.eq_formalMultilinearSeries`.

*Planet:* Primitive with chosen base value on a disc.

*Sources.*

- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “The differential d:A(U_x) -> Omega^1(U_x) is surjective when U_x is a disc. On the other hand, when U_x is an annulus there is no integral to dz/z. To integrate it one needs to introduce a logarithm” d is surjective on the functions of a residue disc: existence of the primitive.
- The method of Chabauty and Coleman, Section 5.2, item (3), p. 6: “(3) The function eta on the residue class is represented by a series I(t) in Q_p[[t]] (usually no longer in Z_p[[t]]) whose derivative is w(t).” On a residue class the integral is a power series with prescribed derivative; the constant is fixed by a base value.

#### Lemma. Locally analytic primitives are unique only up to locally constant functions

*Node* `ColemanIntegration:L0/locally-analytic-primitive-nonunique`.

Let U be a nonempty open subset of C_p. (a) A function g : U -> C_p that is locally analytic (AnalyticOnNhd) with derivative identically 0 is locally constant, and every locally constant function is locally analytic with derivative 0. (b) U carries non-constant locally constant functions (for example the indicator of an open disc, which is also closed); hence if F is a locally analytic primitive of a locally analytic f on U, the set of all locally analytic primitives of f is F + {locally constant functions}, an infinite-dimensional C_p-vector space. (c) On U = D^-(0, 1), the primitive among functions analytic on the whole disc is unique once a base value is fixed (L0/disc-primitive-unique), while the locally analytic ones are not. For open subsets such as P^1(C_p) minus {0, 1, infinity}, which is a disjoint union of infinitely many residue discs and annuli, no base value fixes the primitive; Frobenius continuation (ColemanIntegration:L1) is the remedy.

*Hypotheses.* U open in C_p, nonempty.

*Proof outline.*

1. (a) Near each point g is a power series with zero derivative, hence constant near that point (L0/disc-primitive-unique uniqueness part); conversely a locally constant function is analytic at every point with zero series beyond the constant term.
2. (b) Open discs in C_p are also closed, so their indicators are locally constant; U contains infinitely many disjoint discs.
3. (c) Compare with L0/disc-primitive-unique; the locally analytic primitives on Z_p modulo locally constant functions are the objects of LocallyAnalyticDistributions:L1 (requested).

*Acceptance.*

- The function equal to log_0(z) on the residue disc of 2 and to log_0(z) + 1 on all other residue discs of C_p^x (p >= 3) is a locally analytic primitive of dz/z which is not the restriction of any branch log_a and not a Coleman function.
- On a single open disc every locally analytic primitive differs from the analytic one by a locally constant, generally non-constant, function.

*Uses.* `ColemanIntegration:L0/disc-analytic-functions`, `ColemanIntegration:L0/disc-primitive-unique`, `mathlib:AnalyticOnNhd`, `mathlib:IsLocallyConstant`, `LocallyAnalyticDistributions:L1`.

*Sources.*

- Heidelberg lectures on Coleman integration, Section 1.2, p. 2: “In the p-adic world, we immediately realize that such a strategy will not work because two open discs of radius 1 are either identical or completely disjoint. Thus, there is no obvious way of fixing simultaneously the constants of integration.” The disjointness of residue discs is why locally analytic primitives are not determined by a base value.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Section 3.1, before Theorem 3.1, p. 12 (arXiv v2): “because P^1(C_p) minus {0,1,infinity} is topologically totally disconnected, the equation (KZ^p) does not have a unique solution on P^1(C_p) minus {0,1,infinity} even locally as in the complex analytic function case.” Total disconnectedness destroys uniqueness of solutions even for unipotent equations; uniqueness holds only in the Coleman class.

#### Theorem. A differential on an annulus is exact exactly when its residue vanishes

*Node* `ColemanIntegration:L0/annulus-exact-iff-residue-zero`.

Let K be a complete subfield of C_p (or any complete ultrametric field of characteristic zero), A = A(e; r, s) an open annulus, and omega = f dz with f = sum a_n (z - e)^n in O_K(A). There is g in O_K(A) with dg = omega if and only if res_A(omega) = 0; in that case g = sum_{n != -1} a_n (z - e)^(n+1)/(n+1) + const, and g is unique up to an additive constant because ker(d on O_K(A)) = K.

*Hypotheses.* K complete, ultrametric, characteristic zero. A an open annulus or the end germ of a residue disc.

*Proof outline.*

1. Necessity: res(dg) = 0 (API annulusResidue_d of L0/annulus-residue).
2. Sufficiency: integrate both tails termwise; on every closed sub-annulus rho_1 <= |z - e| <= rho_2 with r < rho_1 < rho_2 < s the coefficients a_n/(n+1) satisfy |a_n/(n+1)| rho^(n+1) <= rho |n+1|^(-1) |a_n| rho^n with |n+1|^(-1) <= |n+1|^s (L0/ultrametric-natcast-bound), and choosing rho slightly outside [rho_1, rho_2] gives convergence as in L0/formal-primitive-radius (b).
3. Termwise differentiation of the resulting Laurent series gives back f dz.
4. Kernel: dg = 0 means n b_n = 0 for all n, so b_n = 0 for n != 0 in characteristic zero.

*Acceptance.*

- dz/z on A has no primitive in O_K(A): the nonzero-residue annulus of the roadmap's acceptance list.
- (z - e)^(-2) dz has the primitive -(z - e)^(-1).

*Uses.* `ColemanIntegration:L0/annulus-residue`, `ColemanIntegration:L0/ultrametric-natcast-bound`, `ColemanIntegration:L0/formal-primitive-radius`, `PadicHodgeTheory:P7:annulus-foundations`.

*Sources.*

- Explicit Coleman integration for hyperelliptic curves, Section 2, Definition 1 and Remark 2, p. 3 (arXiv v2): “For sum_{i in Z} c_i t^i dt in Omega^1_{A(I)/C_p} and P, Q in A(I), define int_P^Q sum c_i t^i dt = c_{-1} Log(Q/P) + sum_{i != -1} c_i/(i+1) (Q^(i+1) - P^(i+1)). This is easily shown not to depend on the choice of the coordinate t.” The terms with i != -1 integrate to c_i t^(i+1)/(i+1); the term i = -1 needs Log.
- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “The differential d:A(U_x) -> Omega^1(U_x) is surjective when U_x is a disc. On the other hand, when U_x is an annulus there is no integral to dz/z. To integrate it one needs to introduce a logarithm” On an annulus dz/z has no integral, so d is not surjective on O(A).

#### Lemma. Convergence of the logarithm series on the open unit disc

*Node* `ColemanIntegration:L0/log-one-add-convergence`.

Let K be a complete nontrivially normed ultrametric field of characteristic zero (for example C_p or a finite extension of Q_p). The Tau Ceti series NormedSpace.logOneAddSeries K K has radius at least 1, the Tau Ceti function log(1 + u) := NormedSpace.logOneAdd K K u equals sum_{n>=1} (-1)^(n+1) u^n/n for ||u|| < 1, satisfies HasFPowerSeriesOnBall (logOneAdd K K) (logOneAddSeries K K) 0 1, and its derivative is 1/(1 + u) on the open unit disc. (Tau Ceti proves the radius bound only under ContinuousSMul Q>=0 K, which fails for p-adic fields; this lemma supplies the ultrametric case.)

*Hypotheses.* K complete, nontrivially normed, ultrametric, CharZero.

*Proof outline.*

1. By L0/ultrametric-natcast-bound, ||(-1)^(n+1)/n|| <= n^s, so ||c_n|| r^n is bounded for every r < 1; hence radius >= 1 by the bound criterion for mathlib:FormalMultilinearSeries.radius.
2. HasFPowerSeriesOnBall on the ball of radius 1 follows from the radius bound as in the proof of tauceti:NormedSpace.hasFPowerSeriesOnBall_logOneAdd, which uses the radius only.
3. The derivative: the termwise derivative is sum (-1)^n u^n = 1/(1 + u); formally this is mathlib:PowerSeries.derivative_log_mul_one_add_X.

*Acceptance.*

- For p = 3 and u = 3: logOneAdd 3 = 3 + 2*3^2 + 3^3 + 2*3^5 + 2*3^6 + 3^8 + 2*3^10 + 3^11 + O(3^12), agreeing with the partial sums (checked with PARI/GP).
- At ||u|| = 1 the series diverges (terms of norm |1/n| >= 1).

*Uses.* `ColemanIntegration:L0/ultrametric-natcast-bound`, `tauceti:NormedSpace.logOneAdd`, `tauceti:NormedSpace.logOneAddSeries`, `tauceti:NormedSpace.hasFPowerSeriesOnBall_logOneAdd`, `mathlib:FormalMultilinearSeries.radius`, `mathlib:HasFPowerSeriesOnBall`, `mathlib:PowerSeries.derivative_log_mul_one_add_X`.

*Sources.*

- Explicit Coleman integration for hyperelliptic curves, Section 2, opening paragraph, p. 3 (arXiv v2; the sign is corrected in ColemanIntegration/E1): “Choose once and for all a branch of the p-adic logarithm, i.e., a homomorphism Log : C_p^x -> C_p whose restriction to the disc {x in C_p : |x - 1| < 1} is given by the logarithm series log(x) = sum_{i=1}^infinity (1-x)^i/i.” The branch restricts to the logarithm series on the disc |x - 1| < 1, which must converge there.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Section 2.1, p. 7 (arXiv v2): “We note that log^a(z_x) is a locally analytic function defined on ]x[ cap Y(C_p) whose derivation is 1/z_x and it is transcendental over ind-lim_{r->1} A(]x[ cap U_r)” The derivative of log is 1/z.

#### Lemma. The logarithm series is a homomorphism on principal units

*Node* `ColemanIntegration:L0/log-one-add-mul`.

Let K be as in L0/log-one-add-convergence. For ||u|| < 1 and ||v|| < 1, log(1 + u) + log(1 + v) = log((1 + u)(1 + v)) (note ||u + v + uv|| < 1). Hence u |-> log(1 + u) is a continuous group homomorphism from the principal units 1 + m_K to (K, +), and it vanishes at every root of unity lying in 1 + m_K.

*Hypotheses.* K complete, ultrametric, characteristic zero.

*Proof outline.*

1. Fix v. On D^-(0, 1) the function G(u) = log((1+u)(1+v)) - log(1+u) - log(1+v) is analytic (composition of the series with the affine map u |-> u + v + uv, which maps the disc into itself).
2. Its derivative is (1+v)/((1+u)(1+v)) - 1/(1+u) = 0 by L0/log-one-add-convergence, so G is constant by the uniqueness part of L0/disc-primitive-unique, and G(0) = 0.
3. Roots of unity: if zeta^m = 1 then m log(zeta) = log(zeta^m) = 0, so log(zeta) = 0 in characteristic zero.

*Acceptance.*

- In Q_5: log(-2) = log(16)/4, since (-2)^4 = 16 in 1 + 5 Z_5 (PARI/GP: difference O(5^12)).
- p-power roots of unity in C_p (for example a primitive p-th root, |zeta - 1| = p^(-1/(p-1)) < 1) have logarithm 0.

*Uses.* `ColemanIntegration:L0/log-one-add-convergence`, `ColemanIntegration:L0/disc-primitive-unique`.

*Source.* Explicit Coleman integration for hyperelliptic curves, Section 2, opening paragraph, p. 3 (arXiv v2): “Choose once and for all a branch of the p-adic logarithm, i.e., a homomorphism Log : C_p^x -> C_p whose restriction to the disc {x in C_p : |x - 1| < 1} is given by the logarithm series log(x) = sum_{i=1}^infinity (1-x)^i/i.” A branch is a homomorphism restricting to the series; the series itself must therefore be a homomorphism on the disc.

#### Lemma. Every element of C_p^x has a power that is p^m times a principal unit

*Node* `ColemanIntegration:L0/cp-unit-power-principal`.

For every x in C_p^x there are integers N >= 1 and m such that ||x^N p^(-m) - 1|| < 1. For every such pair, m/N = v_p(x) := -log_p ||x||, so v_p(x) lies in Q and ||C_p^x|| = p^Q. The same holds in every complete subfield K of C_p that is finite over Q_p, with x^N p^(-m) in 1 + m_K.

*Hypotheses.* C_p is Mathlib's PadicComplex p; its norm restricts to |p| = 1/p.

*Proof outline.*

1. Value group: on the algebraic closure (mathlib:PadicAlgCl) the norm is the spectral norm (mathlib:spectralNorm), ||y|| = |N(y)|^(1/[Q_p(y):Q_p]) in p^Q; since the algebraic closure is dense in C_p and ||x|| = ||y|| whenever ||x - y|| < ||x||, every nonzero x has ||x|| in p^Q.
2. Choose N_0 with ||x^(N_0)|| = p^(-m_0); u = x^(N_0) p^(-m_0) is a unit of the valuation ring mathlib:PadicComplexInt.
3. Choose y algebraic with ||u - y|| < 1; y is a unit in a finite extension of Q_p whose residue field is finite of order q, so y^(q-1) and hence u^(q-1) lie in 1 + m.
4. Take N = N_0 (q - 1), m = m_0 (q - 1); the identity m/N = v_p(x) is immediate from ||x^N p^(-m)|| = 1.

*Acceptance.*

- x = p^(1/2): N = 2, m = 1.
- x = 2 in Q_5: N = 4, m = 0 (2^4 = 16 is in 1 + 5 Z_5).

*Uses.* `mathlib:PadicComplex`, `mathlib:PadicAlgCl`, `mathlib:spectralNorm`, `mathlib:PadicComplexInt`, `mathlib:Real.logb`.

*Source.* p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Section 2.1, p. 7 (arXiv v2): “Fix a in C_p. It determines a branch of p-adic logarithm log^a : C_p^x -> C_p ([Bes1]Definition 2.6) which is characterized by log^a(p) = a. We call this a in C_p the branch parameter of p-adic logarithm.” A branch is characterised by its value at p; this uses that every element of C_p^x is, up to taking powers, p^m times a principal unit.

#### Lemma. Changing the branch of the logarithm

*Node* `ColemanIntegration:L0/log-branch-change`.

For a, b in C_p and x in C_p^x: log_b(x) - log_a(x) = (b - a) v_p(x), where v_p(x) = -log_p ||x|| in Q. In particular all branches agree on the units O_{C_p}^x (and on 1 + m_{C_p}), and log_a = log_p + a v_p with log_p the Iwasawa branch.

*Hypotheses.* a, b in C_p; x != 0.

*Proof outline.*

1. With (N, m) as in L0/log-branch, log_b(x) - log_a(x) = (m b - m a)/N = (b - a) m/N, and m/N = v_p(x) by L0/cp-unit-power-principal.

*Acceptance.*

- log_a(p^(1/2)) = a/2 for every square root of p.
- RJW Theorem 6.1(ii) is branch independent for non-trivial theta: v_p(1 - eps_N^c) does not depend on c in (Z/NZ)^x and sum_c theta^(-1)(c) = 0, so the branch terms cancel (source issue ColemanIntegration/E9).

*Uses.* `ColemanIntegration:L0/log-branch`, `ColemanIntegration:L0/cp-unit-power-principal`, `mathlib:Real.logb`.

*Sources.*

- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Section 2.1, p. 8 (arXiv v2): “Consider the isomorphisms iota_{a,b} : A^a_loc -> A^b_loc and tau_{a,b} : Omega^a_loc -> Omega^b_loc obtained by replacing each log^a(z_{e_i}) by log^b(z_{e_i}) for 1 <= i <= s.” Branch change replaces log^a by log^b; this lemma is the formula for the difference.
- Explicit Coleman integration for hyperelliptic curves, Section 2, p. 3 (arXiv v2): “(The choice of branch has no effect on the integrals on differentials of the second kind, i.e., everywhere meromorphic differentials with all residues zero.)” The branch enters integrals only through residues, i.e. through the term (b - a) v_p.

#### Lemma. Compatibility of the branches with automorphisms and finite extensions

*Node* `ColemanIntegration:L0/log-branch-field-compatibility`.

(a) For every continuous field automorphism sigma of C_p, every a in C_p and x in C_p^x: log_(sigma(a))(sigma(x)) = sigma(log_a(x)); in particular the Iwasawa branch commutes with every such sigma. (b) For a finite extension K of Q_p inside C_p and a in K, log_a(K^x) is contained in K, and log_a restricted to K^x is the unique homomorphism K^x -> K that agrees with the series on 1 + m_K and sends p to a. (c) Hence the logarithms of all finite (algebraic) extensions of Q_p obtained this way are compatible under inclusion: the restriction of log_a from L^x to K^x is log_a of K for K inside L.

*Hypotheses.* a in C_p; for (b) and (c), K and L are finite over Q_p inside C_p and a lies in K.

*Proof outline.*

1. (a) sigma is an isometry (the absolute value of C_p is the unique extension of that of Q_p and sigma is continuous), so it commutes with the series on 1 + m; sigma o log_a o sigma^(-1) is a homomorphism agreeing with the series and sending p to sigma(a), so it is log_(sigma(a)) by the uniqueness in L0/log-branch.
2. (b) For x in K^x choose (N, m) inside K (value group (1/e)Z, finite residue field), so x^N p^(-m) lies in 1 + m_K and its logarithm, a convergent series of elements of K, lies in the complete field K.
3. (c) Both sides are computed by the same formula on K^x.

*Acceptance.*

- For K = Q_p(mu_N) the values log_p(1 - eps_N^c) of RJW Theorem 6.1(ii) lie in K.

*Uses.* `ColemanIntegration:L0/log-branch`, `ColemanIntegration:L0/cp-unit-power-principal`, `ColemanIntegration:L0/log-one-add-convergence`.

*Source.* An introduction to p-adic L-functions, Theorem 6.1(ii), p. 36 (arXiv v2): “(ii) (p-adic value at s = 1). We have L_p(theta, 1) = -(1 - theta(p)p^-1) (1/G(theta^-1)) sum_{c in (Z/NZ)^x} theta^-1(c) log_p(1 - eps_N^c).” The formula takes values in Q_p(mu_N), which needs part (b); compatibility across extensions is needed to compare conductors.

#### Lemma. Local expansion of log_a and its derivative

*Node* `ColemanIntegration:L0/log-branch-local-expansion`.

For x_0 in C_p^x and z in D^-(x_0, |x_0|) (so |z| = |x_0|): log_a(z) = log_a(x_0) + log(1 + (z - x_0)/x_0), with log the series of L0/log-one-add-convergence. Hence the restriction of log_a to D^-(x_0, |x_0|) lies in O(D^-(x_0, |x_0|)) (L0/disc-analytic-functions) with derivative 1/z; log_a is locally analytic on C_p^x with d log_a = dz/z. Every open disc in C_p^x lies in a sphere |z| = const, so log_a is analytic on every such disc; its failure to be a single analytic function shows only on annuli (L0/annulus-log-transcendence).

*Hypotheses.* a in C_p, x_0 != 0.

*Proof outline.*

1. z = x_0 (1 + (z - x_0)/x_0) with ||(z - x_0)/x_0|| < 1; apply the homomorphism property of L0/log-branch and its agreement with the series on 1 + m.
2. The composite of the series with the affine map is given by one power series in z - x_0 on the disc (L0/log-one-add-convergence), with derivative (1/x_0)/(1 + (z-x_0)/x_0) = 1/z.

*Acceptance.*

- On D^-(1, 1) the expansion is the series itself; on D^-(p, 1/p) it is a + log(z/p).

*Uses.* `ColemanIntegration:L0/log-branch`, `ColemanIntegration:L0/log-one-add-mul`, `ColemanIntegration:L0/disc-analytic-functions`, `ColemanIntegration:L0/log-one-add-convergence`.

*Sources.*

- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Section 2.1, p. 7 (arXiv v2): “We note that log^a(z_x) is a locally analytic function defined on ]x[ cap Y(C_p) whose derivation is 1/z_x and it is transcendental over ind-lim_{r->1} A(]x[ cap U_r)” log^a(z_x) is locally analytic with derivative 1/z_x.
- Explicit Coleman integration for hyperelliptic curves, Section 2, Definition 1, p. 3 (arXiv v2): “For sum_{i in Z} c_i t^i dt in Omega^1_{A(I)/C_p} and P, Q in A(I), define int_P^Q sum c_i t^i dt = c_{-1} Log(Q/P) + sum_{i != -1} c_i/(i+1) (Q^(i+1) - P^(i+1)). This is easily shown not to depend on the choice of the coordinate t.” The term c_(-1) Log(Q/P) is the primitive of c_(-1) dt/t between two points.

#### Lemma. The logarithm is transcendental over functions on an annulus

*Node* `ColemanIntegration:L0/annulus-log-transcendence`.

Let A = A(e; r, s) with r < s and a in C_p. If f_0, ..., f_n in O_K(A) satisfy sum_k f_k(z) log_a(z - e)^k = 0 for all z in A(C_p), then all f_k = 0. Equivalently the realisation rho_a of L0/annulus-log-ring is injective.

*Hypotheses.* r < s, so that A contains circles of more than one radius; K complete subfield of C_p.

*Proof outline.*

1. n = 0: a Laurent series vanishing as a function on A(C_p) is zero (identity principle for the Laurent carrier, requested from PadicHodgeTheory:P7:annulus-foundations: the Gauss norm |f|_rho is attained on the circle |z - e| = rho for rho in |C_p^x|).
2. Induction: take a relation of minimal degree n >= 1 with f_n != 0 and apply the derivation theta = (z - e) d/dz: theta(f l^k) = theta(f) l^k + k f l^(k-1). The combination f_n * theta(relation) - theta(f_n) * relation has degree < n, so all its coefficients vanish; its coefficient of l^(n-1) gives f_n theta(f_(n-1)) - theta(f_n) f_(n-1) + n f_n^2 = 0.
3. Choose an open sub-annulus A' on which a single term dominates f_n (a radius interval between consecutive breaks of the Newton polygon of f_n; breaks are discrete); there f_n = c (z-e)^j (1 + h) with |h| < 1 is a unit of O(A').
4. Then g = f_(n-1)/f_n lies in O(A') and theta(g) = -n, i.e. dg = -n dz/(z - e) on A', whose residue -n is nonzero in characteristic zero: this contradicts L0/annulus-exact-iff-residue-zero.

*Acceptance.*

- log_a(z) is not a Laurent series on A(0; 1/p, 1).

*Uses.* `ColemanIntegration:L0/annulus-exact-iff-residue-zero`, `ColemanIntegration:L0/annulus-log-ring`, `ColemanIntegration:L0/log-branch-local-expansion`, `PadicHodgeTheory:P7:annulus-foundations`.

*Source.* p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Section 2.1, p. 7 (arXiv v2): “We note that log^a(z_x) is a locally analytic function defined on ]x[ cap Y(C_p) whose derivation is 1/z_x and it is transcendental over ind-lim_{r->1} A(]x[ cap U_r)” Furusho asserts the transcendence of log^a(z_x) over the germ ring; this node proves it.

#### Theorem. Logarithmic primitives on an annulus

*Node* `ColemanIntegration:L0/annulus-log-primitive`.

Let A be an open annulus (or end germ) over a complete subfield K of C_p. The derivation d : O_K(A)[l] -> O_K(A)[l] dz of L0/annulus-log-ring is surjective with kernel K. For f = sum a_n (z - e)^n the primitive of f dz is res_A(f dz) l + sum_{n != -1} a_n (z - e)^(n+1)/(n+1) (the log-branch term appears exactly when the residue is nonzero); in general a primitive of f l^k dz is computed by integration by parts: writing f dz = c dz/(z - e) + dg (L0/annulus-exact-iff-residue-zero), one has integral of f l^k dz = c l^(k+1)/(k+1) + g l^k - k (integral of g l^(k-1) dz/(z - e)). Realised with a branch a, the definite integral between P and Q in A is Balakrishnan-Bradshaw-Kedlaya's formula a_(-1) log_a((Q - e)/(P - e)) + sum_{n != -1} a_n ((Q-e)^(n+1) - (P-e)^(n+1))/(n+1).

*Hypotheses.* K complete subfield of C_p; A an open annulus or end germ; a a branch for the realisation.

*Proof outline.*

1. Surjectivity by induction on k using L0/annulus-exact-iff-residue-zero and integration by parts; the residue of g l^(k-1) dz/(z - e) is handled at the previous step.
2. Kernel: if F = sum_{k<=n} f_k l^k has dF = 0 then the l^n-coefficient gives df_n = 0, so f_n is constant; the l^(n-1)-coefficient gives df_(n-1) + n f_n dz/(z - e) = 0, whose residue n f_n must vanish, so f_n = 0 when n >= 1; finally df_0 = 0 gives f_0 in K.
3. The realised formula follows from rho_a(l) = log_a(z - e) and L0/log-branch-local-expansion.

*Acceptance.*

- dz/z has the primitive l, realised as log_a z, and no primitive in O_K(A): an ordinary analytic primitive does not exist on a nonzero-residue annulus (roadmap acceptance).
- For omega = z^(-2) dz + 3 dz/z on A(0; 1/p, 1) the primitive is -z^(-1) + 3 l.

*Uses.* `ColemanIntegration:L0/annulus-exact-iff-residue-zero`, `ColemanIntegration:L0/annulus-log-ring`, `ColemanIntegration:L0/annulus-log-transcendence`, `ColemanIntegration:L0/annulus-residue`.

*Planet:* Logarithmic primitive on an annulus.

*Sources.*

- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “The differential A_log(U_x) -> Omega^1_log(U_x) is surjective also for the annuli, as one easily discovers by doing integration by parts of polynomials in logs with power series coefficients.” d is surjective on A_log of an annulus by integration by parts.
- Explicit Coleman integration for hyperelliptic curves, Section 2, Definition 1, p. 3 (arXiv v2): “For sum_{i in Z} c_i t^i dt in Omega^1_{A(I)/C_p} and P, Q in A(I), define int_P^Q sum c_i t^i dt = c_{-1} Log(Q/P) + sum_{i != -1} c_i/(i+1) (Q^(i+1) - P^(i+1)). This is easily shown not to depend on the choice of the coordinate t.” The realised definite integral on annuli.

#### Lemma. How a change of branch changes logarithmic primitives

*Node* `ColemanIntegration:L0/annulus-branch-change`.

For F = sum f_k l^k in O_K(A)[l] and branches a, b: rho_b(F)(z) = sum_k f_k(z) (log_a(z - e) + (b - a) v_p(z - e))^k. In particular, for the primitive of a differential f dz on A, rho_b - rho_a = res_A(f dz) (b - a) v_p(z - e), a locally constant function, constant on each circle |z - e| = rho and non-constant on A as soon as (r, s) contains two points of p^Q. Differentials with residue zero have branch-independent primitives.

*Hypotheses.* a, b in C_p.

*Proof outline.*

1. Substitute L0/log-branch-change, log_b(z - e) = log_a(z - e) + (b - a) v_p(z - e), into the realisation map of L0/annulus-log-ring.
2. For primitives use the explicit form of L0/annulus-log-primitive: only the l-coefficient res_A(f dz) involves the branch.

*Acceptance.*

- For dz/z on A(0; p^(-2), 1): log_b z - log_a z = (b - a) v_p(z), equal to (b - a) on the circle |z| = 1/p and to 3(b - a)/2 on |z| = p^(-3/2).
- Differentials of the second kind have branch-independent integrals (Balakrishnan-Bradshaw-Kedlaya's remark).

*Uses.* `ColemanIntegration:L0/log-branch-change`, `ColemanIntegration:L0/annulus-log-ring`, `ColemanIntegration:L0/annulus-log-primitive`.

*Sources.*

- Explicit Coleman integration for hyperelliptic curves, Section 2, p. 3 (arXiv v2): “(The choice of branch has no effect on the integrals on differentials of the second kind, i.e., everywhere meromorphic differentials with all residues zero.)” The branch affects only differentials with nonzero residues.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Section 2.1, p. 8 (arXiv v2): “Consider the isomorphisms iota_{a,b} : A^a_loc -> A^b_loc and tau_{a,b} : Omega^a_loc -> Omega^b_loc obtained by replacing each log^a(z_{e_i}) by log^b(z_{e_i}) for 1 <= i <= s.” Branch change replaces log^a by log^b at the ends.

### What is missing

- Coverage status: `source_decomposed`. Convergent series and radii are baseline (HasFPowerSeriesOnBall, FormalMultilinearSeries.radius, PowerSeries.IsRestricted, Gauss norms); overconvergent (dagger) algebras and Laurent series on annuli are imported from AdicSpacesPartII:F1 and PadicHodgeTheory:P7:annulus-foundations (requests). Planned here: the normalised formal primitive in characteristic zero and its derivative; the radius-loss estimate with the closed-disc counterexample; functions on open discs and the unique primitive with chosen base value; the failure of uniqueness among locally analytic functions; residues on annuli, exactness iff zero residue, logarithmic rings, transcendence of log and logarithmic primitives; the logarithm series, the branches log_a on C_p^x with log_a(p) = a, branch change log_b = log_a + (b - a) v_p, the Iwasawa branch, compatibility with automorphisms and finite extensions, local expansions. Path-independent continuation is deferred to the theory of L1 by design (the stage text).
- **Request to `LocallyAnalyticDistributions:L1`.** (1) For a finite extension L of Q_p inside C_p, the ring R^+_L of power series sum a_n T^n over L with |a_n| r^n -> 0 for every r < 1 (functions on the open unit disc), with its Frechet topology and the derivative d/dT, and the comparison theorem that its coefficient map identifies it with ColemanIntegration:L0/disc-analytic-functions at centre 0 and radius 1 (API equivRPlus). (2) Locally analytic primitives on Z_p (and on compact open subsets) with the precise freedom of adding a locally constant function, as stated in the stage text. Needed by `ColemanIntegration:L0/disc-analytic-functions`, `ColemanIntegration:L0/locally-analytic-primitive-nonunique`.
- **Request to `PadicHodgeTheory:P7:annulus-foundations`.** For a complete subfield K of C_p, a centre e in K and 0 <= r < s <= infinity: the K-algebra O_K(A(e; r, s)) of Laurent series sum_{n in Z} a_n (z - e)^n with |a_n| rho^n -> 0 as |n| -> infinity for every rho in (r, s), as functions on {r < |z - e| < s}; its multiplicative Gauss norms |.|_rho and Frechet topology; restriction to sub-annuli and the end-germ ring colim_{r -> 1} O_K(A(e; r, 1)) (the elements of the Robba ring); the derivative; the identity principle (a Laurent series vanishing as a function on A(C_p) is zero, the Gauss norm |f|_rho being attained on the circle |z - e| = rho for rho in |C_p^x|); and the discreteness of the break radii of the Newton polygon (a nonzero f is a unit, dominant monomial times 1 + h with |h| < 1, on some open sub-annulus). Needed by `ColemanIntegration:L0/annulus-residue`, `ColemanIntegration:L0/annulus-exact-iff-residue-zero`, `ColemanIntegration:L0/annulus-log-ring`, `ColemanIntegration:L0/annulus-log-transcendence`.

## L1 Frobenius continuation

A locally analytic primitive is determined only up to a locally constant function, one constant per residue disc. Coleman removes the ambiguity by requiring compatibility with a Frobenius lift. The construction here is direct. On a wide open $Y$ of a curve with good reduction, a *Frobenius-structured datum* consists of a lift $\varphi$, a basis of $H^1$ of the dagger algebra, the matrix of $\varphi$ on it, and the weight condition that no product of eigenvalues is a root of unity. By Dwork's principle on each Frobenius orbit of residue discs, the datum determines a unique family of local horizontal sections for the unipotent word algebra. Coleman functions are the realisations of words. The Coleman integral, the uniqueness principle (a Coleman function with zero differential is constant), independence of the Frobenius lift (by a Taylor homotopy), pullback and branch independence follow. For $U_N$ the datum is explicit: $H^1$ has basis $dz/z$, $dz/(z-\zeta)$, and $z\mapsto z^p$ acts by $p$ up to a permutation. So no weight theory is needed, and the layer is complete for these curves. For general curves the construction is stated with its exact hypotheses and imports the rigid geometry; two gaps remain. The proposal in `restructure` divides the layer into L1a (general Frobenius continuation) and L1b (the punctured projective line).

### Objects

#### Definition. A curve with good reduction and an etale divisor

*Module* `TauCeti/NumberTheory/Coleman/GoodReduction.lean`. *Node* `ColemanIntegration:L1/good-reduction-pair`.

Fix a prime p and a finite extension K of Q_p inside C_p, with ring of integers O_K, uniformiser pi and residue field k = F_q. A good-reduction pair (X, D) over O_K consists of a morphism X -> Spec O_K that is smooth, proper, of relative dimension 1 with geometrically connected fibres (a smooth proper curve with good reduction) and a nonempty closed subscheme D of X that is finite etale over O_K. Put Y = X - D (affine over O_K), and write X_K, X_k, Y_k = X_k - D_k for the generic and special fibres. Because D is etale, its C_p-points D(O_Cp) correspond bijectively to D_k(F_p-bar): distinct points of D have distinct reductions. After base change to O_Cp this is Furusho's Assumption 2.1 and Besser's tight rigid triple. These are all the good-reduction hypotheses of the layer; the only other hypothesis, unipotence, concerns the differential equations integrated (L1/word-algebra). Curves over O_Cp that do not descend to a finite extension of Q_p are outside the scope: the finiteness and Frobenius input (L1/good-reduction-datum-exists) is only available over discretely valued fields.

*Hypotheses.* K finite over Q_p, contained in C_p; k = F_q. X -> Spec O_K smooth, proper, relative dimension 1, geometrically connected fibres. D a nonempty closed subscheme of X, finite etale over O_K; Y = X - D.

*API.*

- `GoodReductionPair` (*structure*) — The data (X, D) over O_K with the smoothness, properness, relative dimension, geometric connectedness and finite etaleness hypotheses as fields.
- `GoodReductionPair.affineComplement` (*projection*) — Y = X - D, with IsAffine Y.
- `GoodReductionPair.residueClasses` (*data*) — The set X_k(F_p-bar) of residue classes, with the ends D_k(F_p-bar) marked.
- `GoodReductionPair.frobenius` (*data*) — The q-power Frobenius F on X_k(F_p-bar): a bijection with finite orbits, preserving D_k.
- `GoodReductionPair.baseChange` (*functoriality*) — Base change along a finite extension K -> K' inside C_p gives a good-reduction pair over O_K'.
- `GoodReductionPair.puncturedLine` (*example*) — (P^1, {0, infinity} u mu_N) over Z_p[mu_N] for p not dividing N (L1/punctured-line).
- `GoodReductionPair.D_reduction_injective` (*characterisation*) — Reduction D(O_Cp) -> D_k(F_p-bar) is a bijection.

*Used by.*

- Furusho, p-adic MZV I, Assumption 2.1 — the setting of Coleman functions and of the uniqueness and functoriality principles
- Balakrishnan-Bradshaw-Kedlaya, Definition 3 and Theorem 5 — Coleman integration on wide opens of curves over O
- Besser, Tannakian formalism, Definition 5.1 and Section 5 — tight rigid triples and the comparison with Coleman's theory
- `EffectiveDiophantineMethods:ED.4` — a smooth proper curve over Q and a prime of good reduction
- AnabelianGeometryAndNonabelianChabauty:NC.2, NC.4, NC.5 — unipotent realisations and iterated integrals at a good-reduction prime
- `ColemanIntegration:L2` — the case P^1 minus {0, 1, infinity}

*Unit tests.* A wrong definition fails one of these.

- `goodReductionPair_thricePunctured` (computation) — (P^1_{Z_p}, {0, 1, infinity}) is a good-reduction pair for every prime p, with residue classes P^1(F_p-bar) and ends 0, 1, infinity.
- `goodReductionPair_collision` (non-example) — (P^1_{Z_p}, V(z(z - p))) is not a good-reduction pair: D is not etale over Z_p.
- `goodReductionPair_mu_p` (non-example) — (P^1, {0, infinity} u mu_p) over Z_p[mu_p] is not a good-reduction pair: all p-th roots of unity reduce to 1.
- `goodReductionPair_affineLine` (degenerate) — (P^1_{Z_p}, {infinity}) is a good-reduction pair with Y = A^1, one end and no residue class of D other than infinity.

*Construction.*

1. Package the data with Mathlib's morphism properties mathlib:AlgebraicGeometry.Smooth, mathlib:AlgebraicGeometry.IsProper, mathlib:AlgebraicGeometry.IsFinite and mathlib:AlgebraicGeometry.Etale on schemes (mathlib:AlgebraicGeometry.Scheme).
2. Y is affine: D meets every fibre in a nonempty divisor, and a proper curve minus a nonempty finite set of closed points in each fibre is affine; record mathlib:AlgebraicGeometry.IsAffine as a derived property.
3. The set of residue classes X_k(F_p-bar) carries the q-power Frobenius F; F is a bijection and every orbit is finite because every point is defined over a finite field.

*Acceptance.*

- (P^1_{Z_p}, {0, 1, infinity}) is a good-reduction pair for every p.
- (P^1_{Z_p}, {0, p}) is not: D = V(z(z - p)) is not etale (special fibre V(z^2)), and 0, p lie in one residue disc.

*Uses.* `mathlib:AlgebraicGeometry.Scheme`, `mathlib:AlgebraicGeometry.Smooth`, `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.Etale`, `mathlib:AlgebraicGeometry.IsAffine`.

*Sources.*

- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Assumption 2.1, p. 7 (arXiv v2): “Suppose that X/O_Cp is a smooth projective and surjective scheme over the ring O_Cp of integers of C_p, of relative dimension 1 with its generic fiber X_Cp and its special fiber X_Fp. Let Y = X - D where D is a closed subscheme of X which is relatively etale over O_Cp.” The same hypotheses over O_Cp; here the base is a finite extension of Q_p, as needed for the finiteness input.
- Explicit Coleman integration for hyperelliptic curves, Section 2, Definition 3, p. 4 (arXiv v2): “By a curve over O, we will mean a smooth proper connected scheme X over O of relative dimension 1.” The curve part of the hypotheses.
- Coleman integration using the Tannakian formalism, Section 5, p. 17-18 (arXiv v1): “The only essential difficulty in extending the general theory to this case is that the Frobenius behavior of rigid cohomology (indeed, even finite dimensionality) is not known in this case.” Why the base is taken discretely valued: finiteness and Frobenius behaviour of rigid cohomology are needed.

#### Definition. Wide open neighbourhoods and the dagger algebra

*Module* `TauCeti/NumberTheory/Coleman/WideOpen.lean`. *Node* `ColemanIntegration:L1/wide-open-neighbourhood`.

Let (X, D) be a good-reduction pair over O_K. Let X_an be the rigid (adic) analytic space of X_K (equal to the generic fibre of the formal completion, X being proper) with specialisation map sp : X_an(C_p) -> X_k(F_p-bar); the residue disc of x in X_k(F_p-bar) is ]x[ = sp^(-1)(x), and the tube of Y_k is ]Y_k[ = sp^(-1)(Y_k). For each e in D(O_Cp) fix a local parameter t_e (a function on a Zariski neighbourhood of the section e in X whose reduction is a uniformiser of X_k at the reduction of e). For r in (0, 1) with r in |C_p^x| the basic wide open is W_r := X_an minus the union over e of {x in ]e[ : |t_e(x)| <= r}. The W_r form a cofinal system of strict neighbourhoods of ]Y_k[ in X_an, independent of the choice of the t_e up to cofinality; each W_r is connected. The dagger algebra of Y is A+(Y) := colim_{r -> 1} O(W_r), identified with the Monsky-Washnitzer weak completion of O(Y) tensored with K, and Omega+(Y) := colim_r Omega^1(W_r); both carriers are constructed in AdicSpacesPartII:F1, the generic fibre and residue discs in AdicSpacesPartII:R2.

*Hypotheses.* (X, D) a good-reduction pair; r ranges over |C_p^x| intersected with (0, 1).

*API.*

- `wideOpen` (*constructor*) — wideOpen (X, D) r : the basic wide open W_r, an admissible open of X_an.
- `daggerAlgebra` (*data*) — A+(Y) = colim_r O(W_r), the dagger algebra (carrier from AdicSpacesPartII:F1).
- `daggerDifferentials` (*data*) — Omega+(Y) = colim_r Omega^1(W_r), a projective A+(Y)-module of rank one with the derivation d.
- `mem_tube_iff` (*characterisation*) — x lies in ]Y_k[ iff sp(x) is in Y_k.
- `wideOpen_anti` (*structure*) — r <= r' implies W_r' is contained in W_r; the W_r are cofinal among strict neighbourhoods.
- `wideOpen_param_indep` (*equivalence*) — Changing the local parameters t_e changes the system (W_r) by a cofinal one and does not change A+(Y).
- `daggerAlgebra_eq_weakCompletion` (*compatibility*) — A+(Y) is the Monsky-Washnitzer weak completion of O(Y) tensored with K (Balakrishnan-Bradshaw-Kedlaya Definition 7 for hyperelliptic curves).
- `daggerAlgebra_restrict` (*projection*) — Restriction maps A+(Y) -> O(]x[) for x in Y_k and to the end germs at points of D (L1/residue-disc-parametrisation).
- `daggerAlgebra_identity` (*extensionality*) — An element of A+(Y) or Omega+(Y) whose restriction to one residue disc of ]Y_k[ vanishes is zero (identity principle on the connected W_r; imported from AdicSpacesPartII:F1).

*Used by.*

- Balakrishnan-Bradshaw-Kedlaya, Definition 4 and Theorem 5 — Coleman integrals live on wide opens
- Besser, Tannakian formalism, Section 5 — basic wide opens as strict neighbourhoods; A(U) and Omega^1(U)
- Furusho, p-adic MZV I, Section 2.1 — U_r and A+ = Gamma(]X_Fp[, j+ O)
- `ColemanIntegration:L1/frobenius-lift` — Frobenius lifts are endomorphisms of A+(Y)
- `ColemanIntegration:L1/word-algebra` — the coefficient ring of the unipotent word algebra
- `EffectiveDiophantineMethods:ED.4` — holomorphic differentials on X restrict to elements of Omega+(Y)

*Unit tests.* A wrong definition fails one of these.

- `wideOpen_thricePunctured` (computation) — For (P^1, {0, 1, infinity}) with the standard parameters, wideOpen r = {z : r < |z| < 1/r, |z - 1| > r}.
- `wideOpen_affineLine` (degenerate) — For (P^1, {infinity}), wideOpen r = D^-(0, 1/r) and the dagger algebra is the ring of power series restricted at some rho > 1.
- `tube_not_wideOpen` (non-example) — The tube ]A^1_k[ = D(0, 1) is not a wide open: its ring of functions, the Tate algebra, has non-exact differentials (L0/closed-disc-primitive-failure), while every differential on the dagger algebra of A^1 is exact (L0/formal-primitive-radius).

*Construction.*

1. Residue discs and tubes: generic fibre and specialisation of AdicSpacesPartII:R2.
2. Strict neighbourhoods: the sets W_r are complements of closed discs inside the residue discs of the points of D; cofinality under change of the t_e follows because two parameters differ on ]e[ by t' = u t (1 + h) with |u| = 1, |h| < 1 (L1/residue-disc-parametrisation).
3. Dagger algebra, weak completion and Omega+: imported from AdicSpacesPartII:F1.
4. Comparison with Balakrishnan-Bradshaw-Kedlaya's wide opens {|f| < lambda}: take f with poles exactly along D.

*Acceptance.*

- For (P^1, {0, 1, infinity}) with t_0 = z, t_1 = z - 1, t_inf = 1/z: W_r = {r < |z| < 1/r, |z - 1| > r}.
- For (P^1, {infinity}): W_r = D^-(0, 1/r) and A+(A^1) consists of the power series restricted at some rho > 1.

*Uses.* `ColemanIntegration:L1/good-reduction-pair`, `AdicSpacesPartII:F1`, `AdicSpacesPartII:R2`, `ColemanIntegration:L0/closed-disc-primitive-failure`, `ColemanIntegration:L0/formal-primitive-radius`.

*Sources.*

- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “A "basic wide open" U, in Coleman's terminology (see [Col-de88, 2.1]), is simply a strict neighborhood of ]X[_P in ]Y[_P and its "underlying affinoid" is just ]X[_P.” Coleman's basic wide opens are strict neighbourhoods of the tube; this node takes the cofinal system W_r.
- Explicit Coleman integration for hyperelliptic curves, Section 2, Definition 4, p. 4 (arXiv v2): “By a wide open subspace of X_Q, we will mean a rigid analytic subspace of X_Q of the form {x in X_Q : |f(x)| < lambda} for some f in K(X) of absolute value 1 and some lambda > 1.” The same spaces described by one function f.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Section 2.1, p. 7 (arXiv v2): “U_r stands for the rigid analytic space obtained by removing all closed discs of radius r around e_i from X(C_p) (1 <= i <= s)” Furusho's U_r is W_r.

#### Definition. Locally analytic functions with logarithmic ends

*Module* `TauCeti/NumberTheory/Coleman/LocallyAnalytic.lean`. *Node* `ColemanIntegration:L1/locally-analytic-log-functions`.

Let (X, D) be a good-reduction pair and a in C_p a branch. The algebra of locally analytic functions is A_loc^a(Y) := product over x in X_k(F_p-bar) of A_log^a(x), where A_log^a(x) = O(]x[) (identified with O(D^-(0, 1)) by a parameter, L1/residue-disc-parametrisation) for x in Y_k(F_p-bar), and A_log^a(e) = R_e[l_e] (the end-germ version of L0/annulus-log-ring, l_e realised as log_a(t_e)) for e in D_k(F_p-bar). The module of locally analytic differentials is Omega_loc^a := product of A_log^a(x) dt_x, and d acts componentwise. A+(Y) embeds diagonally by the restriction maps; the locally constant functions LC = product of C_p form the kernel of d; for a, b the isomorphism iota_(a,b) : A_loc^a -> A_loc^b is the identity on the components at Y_k and sends the realisation of l_e with log_a to that with log_b; all this is independent of the local parameters.

*Hypotheses.* (X, D) a good-reduction pair; a in C_p.

*API.*

- `LocAn` (*constructor*) — LocAn (X, D) a : the C_p-algebra A_loc^a(Y), product of the local rings.
- `LocAn.d` (*data*) — The componentwise derivation A_loc^a -> Omega_loc^a.
- `LocAn.ker_d` (*characterisation*) — ker d = LC, the functions constant on each residue class and each end.
- `LocAn.d_surjective` (*other*) — d is surjective componentwise (L0 primitives).
- `LocAn.ofDagger` (*coercion*) — The injective K-algebra map A+(Y) -> A_loc^a(Y) by restriction.
- `LocAn.eval` (*projection*) — Evaluation at points of ]Y_k[(C_p).
- `LocAn.iotaBranch` (*equivalence*) — iota_(a,b) : A_loc^a -> A_loc^b, identity on residue discs of Y_k, l_e realised with log_b instead of log_a.
- `LocAn.paramIndep` (*equivalence*) — Changing local parameters induces the identity of A_loc^a (Furusho Lemma 2.2).

*Used by.*

- Besser, Tannakian formalism, Section 5 — Coleman's M(U) is a subspace of A_loc(U)
- Besser, Heidelberg lectures, Definition 3 — the algebra in which Coleman functions live
- Furusho, p-adic MZV I, Section 2.1 — A^a_loc and the branch-change maps iota_(a,b)
- `ColemanIntegration:L1/coleman-functions` — A_Col^a is a subalgebra
- `ColemanIntegration:L1/dwork-principle` — locally constant functions and their Frobenius equations
- `EffectiveDiophantineMethods:ED.4` — local expansions on residue discs

*Unit tests.* A wrong definition fails one of these.

- `LocAn.ker_d_eq` (characterisation) — ker(d on LocAn) equals the locally constant functions.
- `LocAn.log_element` (computation) — For (P^1, {0, 1, infinity}), the family (log_a z on each residue disc, l_0 at the end 0, l_inf with sign at infinity, log_a z on the end at 1 as an element of R_1) lies in LocAn with d = dz/z.
- `LocAn.affineLine` (degenerate) — For (P^1, {infinity}): LocAn is the product of O(]x[) over x in F_p-bar and R_inf[l_inf].
- `LocAn.iota_on_disc` (compatibility) — iota_(a,b) is the identity on the image of A+(Y) and on every component at a residue disc of Y_k.

*Construction.*

1. Components: L0/disc-analytic-functions at residue discs, L0/annulus-log-ring at ends.
2. Kernel of d: on a disc, L0/disc-primitive-unique (uniqueness part); on an end, L0/annulus-log-primitive (kernel K).
3. Surjectivity of d componentwise: L0/disc-primitive-unique and L0/annulus-log-primitive.
4. Independence of parameters: API changeParam of L0/annulus-log-ring (Furusho Lemma 2.2).

*Acceptance.*

- ker(d) = LC, a C_p-vector space of uncountable dimension (X_k(F_p-bar) is infinite).
- For P^1 minus {0, 1, infinity}: the family (log_a z on every residue disc and on the end at 0) is an element whose d is dz/z.

*Uses.* `ColemanIntegration:L1/good-reduction-pair`, `ColemanIntegration:L1/wide-open-neighbourhood`, `ColemanIntegration:L1/residue-disc-parametrisation`, `ColemanIntegration:L0/disc-analytic-functions`, `ColemanIntegration:L0/annulus-log-ring`, `ColemanIntegration:L0/disc-primitive-unique`, `ColemanIntegration:L0/annulus-log-primitive`, `ColemanIntegration:L0/log-branch`.

*Sources.*

- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “Then one defines locally analytic functions and one forms on U by A_loc(U) := prod_x A_log(U_x), Omega^1_loc(U) := prod_x Omega^1_log(U_x).” The definition of A_loc and Omega_loc as products over residue classes.
- Heidelberg lectures on Coleman integration, Section 1.3.3, Definition 3, p. 6: “restricted to each residue disc they are defined by a convergent power series.” Locally analytic functions are power series on each residue disc.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Lemma 2.2, p. 8 (arXiv v2): “These maps, iota_{a,b} and tau_{a,b}, are independent of any choice of a local parameter z_{e_i}.” Independence of the local parameters.

#### Definition. Frobenius lifts on a wide open

*Module* `TauCeti/NumberTheory/Coleman/FrobeniusLift.lean`. *Node* `ColemanIntegration:L1/frobenius-lift`.

Let (X, D) be a good-reduction pair over O_K with residue field F_q. A Frobenius lift is a K-algebra endomorphism phi of A+(Y) mapping the integral weak completion of O(Y) into itself and reducing modulo pi to the q-power Frobenius of O(Y_k); on the integral weak completion S this is Mathlib's AlgHom.IsArithFrobAt phi (pi S). It extends to Omega+(Y) by phi^*(g dh) = phi(g) d phi(h); on points it maps each residue disc ]x[ into ]F(x)[ and each end into an end, hence acts on A_loc^a by pullback, (phi^* G)|_]x[ = G|_]F(x)[ o phi; at an end e, with parameters t_e and t_(F(e)), phi^* t_(F(e)) = u t_e^q (1 + h) with u a unit constant and |h| < 1 near the boundary, so phi^* l_(F(e)) = q l_e + log_a(u) + log(1 + h), where log_a(u) does not depend on the branch (u is a unit). Frobenius lifts exist (van der Put's lifting theorem; Coleman-de Shalit Theorem 2.2), which is requested from PadicDifferentialEquationsAndRigidCohomology:RD.0; any two are homotopic.

*Hypotheses.* (X, D) a good-reduction pair; q = #k. phi is K-linear (the q-power Frobenius of Y_k is k-linear).

*API.*

- `FrobeniusLift` (*structure*) — A K-algebra endomorphism phi of A+(Y) preserving the integral weak completion S with AlgHom.IsArithFrobAt phi (pi S).
- `FrobeniusLift.isArithFrobAt` (*compatibility*) — The defining condition is Mathlib's AlgHom.IsArithFrobAt at the ideal pi S.
- `FrobeniusLift.mapsTo` (*other*) — phi maps ]x[ into ]F(x)[ for every x in X_k(F_p-bar), and ends into ends.
- `FrobeniusLift.pullback` (*functoriality*) — The induced ring endomorphism phi^* of A_loc^a, commuting with d.
- `FrobeniusLift.pullback_ell` (*simp*) — phi^* l_(F(e)) = q l_e + c_e + log(1 + h_e) with c_e = log_a(u_e) a branch-independent constant and log(1 + h_e) in R_e.
- `FrobeniusLift.pow` (*structure*) — phi^m is a Frobenius lift for q^m.
- `FrobeniusLift.exists` (*constructor*) — Every good-reduction pair admits a Frobenius lift (imported from PadicDifferentialEquationsAndRigidCohomology:RD.0).
- `FrobeniusLift.close` (*relation*) — Two lifts phi, phi' satisfy |phi'(g) - phi(g)| <= |pi| |g| on the integral algebra (the input of L1/taylor-homotopy).

*Used by.*

- Besser, Heidelberg lectures, Theorem 2 — Frobenius equivariance characterises Coleman integration
- Besser, Tannakian formalism, Section 5 — Frobenius endomorphisms of basic wide opens
- Balakrishnan-Bradshaw-Kedlaya, Algorithms 10 and 11 — explicit Frobenius lifts and the fundamental linear system
- `ColemanIntegration:L1/dwork-principle` — Frobenius equations for locally constant functions
- `ColemanIntegration:L1/word-algebra-frobenius` — the Frobenius on the unipotent word algebra
- `AnabelianGeometryAndNonabelianChabauty:NC.2` — Frobenius structure on de Rham realisations
- `EffectiveDiophantineMethods:ED.4` — computation of Coleman integrals by Frobenius

*Unit tests.* A wrong definition fails one of these.

- `frobeniusLift_zpow` (computation) — On (P^1, {0, 1, infinity}) over Z_p, z |-> z^p defines a Frobenius lift.
- `frobeniusLift_twisted` (compatibility) — For zeta a p-power root of unity, z |-> zeta^(-1) z^p is another Frobenius lift of the same curve over Z_p[zeta] (it reduces to z^p), not commuting with z |-> z^p.
- `frobeniusLift_not_scaling` (non-example) — z |-> p z and z |-> z^p + 1 are not Frobenius lifts of P^1 minus {0, 1, infinity}: their reductions are not the p-power map.
- `frobeniusLift_fixed_points` (characterisation) — The fixed points of (z |-> z^p)^m on the residue discs of U = P^1 minus {0, 1, infinity} are the roots of unity of order dividing p^m - 1 other than 1.

*Construction.*

1. Existence and homotopy of lifts: requested from PadicDifferentialEquationsAndRigidCohomology:RD.0 (Frobenius lifts on weak completions) with the carrier of AdicSpacesPartII:F1.
2. Action on points: phi(y) reduces to F(sp(y)) because phi reduces to the q-power map; so phi maps ]x[ into ]F(x)[.
3. Ends: the reduction of phi^* t_(F(e)) is the pullback by Frobenius of a uniformiser at F(e), i.e. a unit times the q-th power of a uniformiser at e; so phi^* t_(F(e)) - u t_e^q lies in pi times the integral algebra for a unit constant u, and on the part of the end where |t_e|^q > |pi|, phi^* t_(F(e)) = u t_e^q (1 + h) with |h| < 1; then log_a(phi^* t_(F(e))) = q log_a(t_e) + log_a(u) + log(1 + h) by L0/log-branch, and log_a(u) is branch independent by L0/log-branch-change.
4. Pullback on A_loc^a is a ring endomorphism commuting with d by the chain rule on each component.

*Acceptance.*

- phi(z) = z^p on P^1 minus {0, 1, infinity} over Z_p (L1/punctured-line-frobenius).
- phi^m is a Frobenius lift for the q^m-power Frobenius.

*Uses.* `ColemanIntegration:L1/good-reduction-pair`, `ColemanIntegration:L1/wide-open-neighbourhood`, `ColemanIntegration:L1/locally-analytic-log-functions`, `ColemanIntegration:L0/log-branch`, `ColemanIntegration:L0/log-branch-change`, `mathlib:AlgHom.IsArithFrobAt`, `PadicDifferentialEquationsAndRigidCohomology:RD.0`, `AdicSpacesPartII:F1`.

*Sources.*

- Heidelberg lectures on Coleman integration, Section 1.3.2, p. 6: “The Frobenius morphism varphi(x) = x^p of A-bar can be lifted, by Proposition 1, to a sigma linear morphism phi : A+ -> A+” Frobenius lifts to the dagger algebra exist by the lifting property of weak completions.
- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “An endomorphism phi : T -> T lifting a Frobenius endomorphisms X -> X is what we called in loc. cit., following Coleman, a Frobenius endomorphism of U. A theorem of Coleman [Col-de88, Theorem 2.2.] guarantees such a Frobenius endomorphism always exists.” Coleman's Frobenius endomorphisms of a wide open and their existence.
- Explicit Coleman integration for hyperelliptic curves, Section 3.3, Algorithm 10, step 1, p. 7 (arXiv v2): “Since K is an unramified extension of Q_p, it carries a unique automorphism phi_K lifting the Frobenius automorphism x |-> x^p on its residue field. Extend phi_K to a Frobenius lift on A+ by setting phi(x) = x^p,” An explicit Frobenius lift for hyperelliptic curves.

#### Definition. Frobenius-structured unipotent datum

*Module* `TauCeti/NumberTheory/Coleman/Datum.lean`. *Node* `ColemanIntegration:L1/frobenius-h1-datum`.

Let (X, D) be a good-reduction pair over O_K. A Frobenius-structured datum on (X, D) consists of a Frobenius lift phi (L1/frobenius-lift), differentials omega_1, ..., omega_r in Omega+(Y), a matrix M in M_r(K) and g in A+(Y)^r with phi^* omega_i = sum_j M_ij omega_j + d g_i, such that: (H0) ker(d : A+(Y) -> Omega+(Y)) = K; (H1) every eta in Omega+(Y) can be written eta = dh + sum c_i omega_i with c in K^r unique (and h unique up to K), i.e. the classes of the omega_i form a basis of H^1_dR+ := Omega+/dA+; (Hi) the restriction maps A+(Y) -> O(]x[) and Omega+(Y) -> Omega(]x[) are injective for each x in Y_k(F_p-bar); (Hw) for all n >= 1 and m >= 1 the endomorphism (M^(tensor n))^m of (K^r)^(tensor n) does not have the eigenvalue 1 (equivalently no product of n eigenvalues of M is a root of unity). This is exactly the input of the direct construction (L1/word-algebra to L1/coleman-functions); it is supplied for all good-reduction pairs by L1/good-reduction-datum-exists (imported rigid-cohomology input) and explicitly for P^1 minus {0, infinity} and mu_N by L1/punctured-line-datum.

*Hypotheses.* (X, D) a good-reduction pair over O_K; phi K-linear.

*API.*

- `FrobeniusDatum` (*structure*) — The tuple (phi, omega, M, g) with the hypotheses (H0), (H1), (Hi), (Hw) as hypotheses of the constructions that use them.
- `FrobeniusDatum.coords` (*projection*) — The K-linear map Omega+ -> K^r, eta |-> c with eta - sum c_i omega_i exact (by H1).
- `FrobeniusDatum.frobenius_eq` (*relation*) — phi^* omega = M omega + d g.
- `FrobeniusDatum.coords_frobenius` (*relation*) — coords (phi^* eta) = M^T coords eta (the Frobenius on H^1_dR+).
- `FrobeniusDatum.changeBasis` (*equivalence*) — For P in GL_r(K), (phi, P omega, P M P^(-1), P g) is again a datum.
- `FrobeniusDatum.pow` (*functoriality*) — (phi^m, omega, M_m, g_m) with M_m = M^m (K-linear lift) is a datum for q^m.
- `FrobeniusDatum.noRootOfUnity` (*characterisation*) — (Hw) holds iff no product of n >= 1 eigenvalues of M in an algebraic closure is a root of unity.

*Used by.*

- Besser, Heidelberg lectures, proof of Theorem 2 — phi omega = M omega + dg and the invertibility of the Frobenius equation
- Balakrishnan-Bradshaw-Kedlaya, Algorithm 11 — the fundamental linear system (M - I) int = ...
- Besser, Tannakian formalism, Section 5 — the polynomial principle with no roots of unity
- `ColemanIntegration:L1/word-algebra-integrability` — uses (H0) and (H1)
- `ColemanIntegration:L1/coleman-realization` — uses (Hw)
- `ColemanIntegration:L1/coleman-uniqueness-principle` — uses (Hi), (H0), (H1)

*Unit tests.* A wrong definition fails one of these.

- `frobeniusDatum_thricePunctured` (computation) — For (P^1, {0, 1, infinity}), omega = (dz/z, dz/(z - 1)), phi(z) = z^p: M = p times the identity and g = (0, log u) with u = (z^p - 1)/(z - 1)^p.
- `frobeniusDatum_identity_fails` (non-example) — The tuple with phi = identity on A+(G_m) (not a Frobenius lift) and M = 1 violates (Hw); for it the constant in the primitive of dz/z cannot be fixed.
- `frobeniusDatum_affineLine` (degenerate) — For (P^1, {infinity}) the datum has r = 0: H^1_dR+ = 0 and every differential is exact.
- `frobeniusDatum_changeBasis` (compatibility) — Replacing (dz/z, dz/(z - 1)) by (dz/z, dz/(z(z - 1))) gives M' = P (p I) P^(-1) = p I again.

*Construction.*

1. Record the data and the four hypotheses; no construction is involved.
2. Basis change: replacing omega by P omega (P in GL_r(K)) replaces M by P M P^(-1) and g by P g; (H1) and (Hw) are preserved.

*Acceptance.*

- For (P^1, {0, 1, infinity}) with omega = (dz/z, dz/(z - 1)) and phi(z) = z^p: M = p I and g = (0, log((z^p - 1)/(z - 1)^p)) (L1/punctured-line-frobenius).

*Uses.* `ColemanIntegration:L1/wide-open-neighbourhood`, `ColemanIntegration:L1/frobenius-lift`, `mathlib:Module.End.HasEigenvalue`, `mathlib:Derivation`, `mathlib:Module.Free`.

*Sources.*

- Heidelberg lectures on Coleman integration, Proof of Theorem 2, p. 8: “Put all the forms above into a column vector omega. Then we have a matrix M in M_{n x n}(K) such that phi omega = M omega + dg where g in (A+_K)^n.” The matrix M and the functions g of the datum.
- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “When P has no roots of unity as roots this condition fixes F_omega up to a constant.” Hypothesis (Hw): the Frobenius polynomial has no roots of unity among its roots.

#### Construction. The unipotent word algebra

*Module* `TauCeti/NumberTheory/Coleman/WordAlgebra.lean`. *Node* `ColemanIntegration:L1/word-algebra`.

Let A be a commutative K-algebra with a K-derivation d : A -> Omega into an A-module, and omega_1, ..., omega_r in Omega. The unipotent word algebra U(A; omega) is the free A-module with basis the words w in the alphabet {e_1, ..., e_r} (basis vectors L_w, L_empty = 1), made a commutative A-algebra by the shuffle product L_u L_v = sum over w in the shuffle of u and v of L_w, with the derivation D : U -> U (x)_A Omega given by D(f L_w) = L_w (x) df + f L_w' (x) omega_i for w = e_i w' (and D(f) = df). L_(e_i w) stands for the iterated integral of omega_i times L_w: the first letter is the outermost integration. U is filtered by word length; U_(<= n) with D is a unipotent connection (an iterated extension of trivial connections: Besser's M_B with a strictly triangular matrix B), and U_(<= n)/U_(<= n-1) is free of rank r^n with the trivial connection. For a Frobenius-structured datum, A = A+(Y), Omega = Omega+(Y) and omega is the H^1 basis.

*Hypotheses.* A commutative K-algebra with a derivation d : A -> Omega; K of characteristic zero.

*API.*

- `WordAlgebra` (*constructor*) — WordAlgebra A omega : the free A-module on words in Fin r with the shuffle product.
- `WordAlgebra.L` (*data*) — The basis vector L_w of a word w.
- `WordAlgebra.L_mul_L` (*simp*) — L_u * L_v = sum over the shuffles w of u and v of L_w.
- `WordAlgebra.D` (*data*) — The derivation D : U -> U (x)_A Omega.
- `WordAlgebra.D_L_cons` (*simp*) — D (L (e_i :: w)) = L w (x) omega_i and D (L []) = 0.
- `WordAlgebra.D_mul` (*structure*) — D is a derivation: D(x y) = x D y + y D x.
- `WordAlgebra.depth` (*structure*) — The filtration U_(<= n) by word length, with free graded pieces of rank r^n and trivial connection.
- `WordAlgebra.map` (*functoriality*) — Base change along A -> A' compatible with d, and linear change of the forms omega' = P omega (P in GL_r(K)), which acts on L_w through P^(tensor n).
- `WordAlgebra.isUnipotent` (*equivalence*) — U_(<= n) with D is isomorphic to Besser's unipotent connection M_B for a strictly triangular B.

*Used by.*

- Besser, Heidelberg lectures, Section 1.5 (1.4) — iterated integrals as solutions of unipotent systems
- Besser, Tannakian formalism, Remark 5.6 and Proposition 5.5 — unipotent isocrystals M_B and the degree filtration
- Furusho, p-adic MZV I, Theorem 3.3 — the fundamental solution of the p-adic KZ equation is the generating series of the L_w
- `ColemanIntegration:L1/coleman-realization` — the realisation map on U
- `ColemanIntegration:L2` — Li_k is the realisation of -L_(e_0^(k-1) e_1)
- AnabelianGeometryAndNonabelianChabauty:NC.2, NC.4 — depth-n quotients and iterated integrals of the unipotent path torsor

*Unit tests.* A wrong definition fails one of these.

- `WordAlgebra.shuffle_two` (computation) — L [e_1] * L [e_2] = L [e_1, e_2] + L [e_2, e_1] and L [e_1] * L [e_1] = 2 L [e_1, e_1].
- `WordAlgebra.D_single` (computation) — D (L [e_i]) = 1 (x) omega_i.
- `WordAlgebra.r_zero` (degenerate) — For r = 0 the word algebra is A with D = d.
- `WordAlgebra.concat_not_derivation` (non-example) — With concatenation instead of shuffle, D would send L [e_1] * L [e_1] = L [e_1, e_1] to omega_1 L [e_1] instead of 2 omega_1 L [e_1]: the shuffle product is forced by the Leibniz rule.

*Construction.*

1. Define the underlying module as finitely supported functions from words to A (mathlib:Finsupp over mathlib:FreeMonoid on Fin r).
2. Define the shuffle of two words recursively, (a u) sh (b v) = a (u sh (b v)) + b ((a u) sh v), and extend A-bilinearly; associativity and commutativity are the standard shuffle identities.
3. Define D on basis vectors by D(L_(e_i w')) = L_w' (x) omega_i and extend by the Leibniz rule; check that D is a derivation for the shuffle product by induction on word lengths (the shuffle recursion matches the removal of the first letter).
4. Filtration and graded pieces are immediate from the formula for D (it lowers length by one on the omega-part).

*Acceptance.*

- L_(e_1) L_(e_2) = L_(e_1 e_2) + L_(e_2 e_1) and D L_(e_i) = omega_i.
- For r = 1 and omega_1 = dz/z the realised L_(e_1^n) is (log z)^n/n!.

*Uses.* `mathlib:FreeMonoid`, `mathlib:Finsupp`, `mathlib:Derivation`, `mathlib:Module.Free`.

*Sources.*

- Heidelberg lectures on Coleman integration, Section 1.5, equation (1.4), pp. 9-10: “is a solution of the system of differential equations dy0 = 0, dy1 = omega1 y0, . . . dyn = omegan yn-1” Iterated integrals are the components of solutions of this unipotent system; U packages all of them.
- Coleman integration using the Tannakian formalism, Remark 5.6, p. 17 (arXiv v1): “The connection depends on the n x n upper triangular matrix B with entries in Omega^1(T) and diagonal entries 0 and is given by nabla(x_1,...,x_n) = (dx_1,...,dx_n) + (x_1,...,x_n) . B.” Unipotent isocrystals with free underlying module are M_B with B strictly triangular, as U_(<= n) is.
- Coleman integration using the Tannakian formalism, Section 2, p. 3 (arXiv v1): “A connection is called unipotent if it is a successive extension of trivial connections.” The unipotence assumption of the layer.

#### Construction. Local horizontal sections on residue discs and ends

*Module* `TauCeti/NumberTheory/Coleman/LocalExpansion.lean`. *Node* `ColemanIntegration:L1/word-algebra-local-expansion`.

Let (phi, omega, M, g) be a datum and U the word algebra. (i) For x in Y_k(F_p-bar) and b in ]x[ there is a unique A+(Y)-algebra map lambda_(x,b) : U -> O(]x[) (A+ acting by restriction) with d o lambda = lambda o D and lambda(L_w)(b) = 0 for w nonempty: the tiny iterated integrals from b. (ii) For an end e there is a unique A+(Y)-algebra map lambda_e : U -> R_e[l_e] with d o lambda = lambda o D and constant term CT(lambda(L_w)) = 0 for w nonempty, where CT of sum f_k l^k is the constant coefficient of the Laurent germ f_0 (the tangential normalisation). (iii) Every A+(Y)-algebra map lambda : U -> A_log^a(x) with d o lambda = lambda o D is of the form lambda(L_w) = sum over deconcatenations of lambda_(x,b) twisted by constants (resp. with lambda_e), for a unique family of constants c_v in C_p with c_empty = 1 satisfying the shuffle relations, namely lambda(L_w) = sum over deconcatenations w = u v of lambda_(x,b)(L_u) c_v with c_v = lambda(L_v)(b) (the constants sit on the innermost letters; Chen's composition of paths).

*Hypotheses.* A datum; b a point of ]x[ (for (i)); e a point of D_k (for (ii)); coefficients extended to C_p.

*API.*

- `localExpansion` (*constructor*) — localExpansion x b : U ->ₐ O(]x[), the tiny iterated integrals based at b.
- `localExpansionEnd` (*constructor*) — localExpansionEnd e : U ->ₐ R_e[l_e], normalised by constant term 0.
- `localExpansion_D` (*simp*) — d (localExpansion x b y) = localExpansion x b (D y).
- `localExpansion_apply_base` (*simp*) — localExpansion x b (L w) b = 0 for w nonempty.
- `constantTerm` (*data*) — CT : R_e[l_e] -> C_p, the constant Laurent coefficient of the l-free part.
- `localExpansion_classify` (*characterisation*) — Every D-compatible A+-algebra map U -> A_log(x) is localExpansion x b twisted by a shuffle character c (deconcatenation formula).
- `localExpansion_changeBase` (*relation*) — Chen's formula: for b' in ]x[, localExpansion x b' (L w) = sum over w = u v of localExpansion x b (L u) * (localExpansion x b' (L v))(b).

*Used by.*

- Besser, Heidelberg lectures, Sections 1.5.1 and 1.5.4 — fibre functors given by local horizontal sections; tangential base points via constant terms
- Balakrishnan-Bradshaw-Kedlaya, Algorithm 8 — tiny integrals
- `ColemanIntegration:L1/coleman-realization` — the realisation on each residue class is a local expansion twisted by constants
- `ColemanIntegration:L1/coleman-uniqueness-principle` — local form of Coleman functions on one residue disc
- `ColemanIntegration:L1/punctured-line-based-primitive` — the tangential base point at 0
- `ColemanIntegration:L2` — the expansion of Li_k at 0 is the power series sum z^n/n^k

*Unit tests.* A wrong definition fails one of these.

- `localExpansion_log` (computation) — For (P^1, {0, 1, infinity}) at the end 0: localExpansionEnd 0 (L [e_0]) = l_0 and localExpansionEnd 0 (L [e_1]) = sum_{n >= 1} -z^n/n.
- `localExpansion_empty` (degenerate) — localExpansion x b (L []) = 1 and localExpansion x b restricted to A+ is restriction to ]x[.
- `localExpansion_not_global` (non-example) — localExpansion x b (L [e_0]) = log(z/b) on ]x[ does not extend to an element of O(W_r): dz/z is not exact in Omega+.
- `constantTerm_analytic` (compatibility) — If the germ lies in C_p[[t]] (no l, no negative powers) then CT is its value at t = 0 (Besser-Furusho constant term).

*Construction.*

1. (i) Define lambda(L_(e_i w)) as the primitive of omega_i lambda(L_w) on the disc with value 0 at b (L0/disc-primitive-unique); multiplicativity and uniqueness by induction on length, both sides of the shuffle identity having the same derivative and value 0 at b.
2. (ii) Same with L0/annulus-log-primitive on the end germ, normalising the constant term.
3. (iii) Given lambda, set c_v := lambda(L_v)(b); the difference between lambda(L_w) and sum_(w = u v) lambda_(x,b)(L_u) c_v has derivative expressed through shorter words, which vanishes by induction, and value c_w - c_w = 0 at b; the shuffle relations for c follow from multiplicativity of lambda evaluated at b.

*Acceptance.*

- For P^1 minus {0, 1, infinity} at the end 0 with t = z: lambda_0(L_(e_0)) = l_0 and lambda_0(L_(e_1)) = log(1 - z) (the series), with CT = 0.
- lambda_(x,b)(L_w) are power series on the whole residue disc: integration preserves convergence on the open disc.

*Uses.* `ColemanIntegration:L1/frobenius-h1-datum`, `ColemanIntegration:L1/word-algebra`, `ColemanIntegration:L1/residue-disc-parametrisation`, `ColemanIntegration:L1/locally-analytic-log-functions`, `ColemanIntegration:L0/disc-primitive-unique`, `ColemanIntegration:L0/annulus-log-primitive`.

*Sources.*

- Heidelberg lectures on Coleman integration, Section 1.5.4, p. 18: “It terms of the parameter t one easily sees that it has a full set of solutions in the ring K[[t]][log(t)].” A unipotent equation with a logarithmic singularity has a full set of solutions in K[[t]][log(t)].
- Heidelberg lectures on Coleman integration, Section 1.5.4, p. 19: “Define the constant term (with respect to t) of an element in K[[t]][log(t)] by formally setting log(t) = 0 and then evaluating at 0.” The constant term used to normalise at an end.
- Heidelberg lectures on Coleman integration, Section 1.5.1, p. 11: “one can integrate power series converging on the unit open polydisc to power series with the same property (Remark 1)” Horizontal sections on residue discs exist because integration preserves the open disc.

#### Construction. Frobenius on the word algebra

*Module* `TauCeti/NumberTheory/Coleman/WordFrobenius.lean`. *Node* `ColemanIntegration:L1/word-algebra-frobenius`.

Let (phi, omega, M, g) be a datum and fix a base point fixed by phi: either a Teichmueller point b in ]x_0[ with x_0 in Y_k(F_q) and phi(b) = b (L1/teichmuller-point), or an end e_0 fixed by F with phi^* t = t^q (1 + h) (tangential normalisation). There is a unique K-algebra endomorphism phi^# of U = U(A+(Y); omega) extending phi^* on A+(Y) with D o phi^# = (phi^# (x) phi^*) o D and lambda(phi^# L_w) normalised at the base point (value 0 at b, resp. constant term 0 at e_0) for w nonempty. It satisfies phi^# L_(e_i) = sum_j M_ij L_(e_j) + g_i - g_i(b) (resp. minus the constant term of g_i), and in general phi^# L_w = sum_{|v| = |w|} (M^(tensor n))_(w,v) L_v modulo U_(<= n-1), n = |w|; moreover lambda o phi^# = phi^* o lambda for the local expansion at the base point.

*Hypotheses.* A datum; a phi-fixed base point (Teichmueller point in a residue class of an F_q-point, or an F-fixed end with phi^* t = t^q (1 + h)).

*API.*

- `frobeniusWord` (*constructor*) — frobeniusWord : U ->ₐ[K] U, the endomorphism phi^#.
- `frobeniusWord_dagger` (*simp*) — phi^# restricted to A+(Y) is phi^*.
- `frobeniusWord_D` (*compatibility*) — D (phi^# y) = (phi^# (x) phi^*) (D y).
- `frobeniusWord_L_single` (*simp*) — phi^# L [e_i] = sum_j M_ij L [e_j] + g_i - (normalising constant).
- `frobeniusWord_top` (*relation*) — phi^# L_w = (M^(tensor |w|)) L_w modulo shorter words.
- `frobeniusWord_localExpansion` (*compatibility*) — localExpansion at the base point composed with phi^# equals phi^* composed with localExpansion.

*Used by.*

- Besser, Heidelberg lectures, Section 1.5.2 — Frobenius acts on unipotent connections and on their solutions
- Balakrishnan-Bradshaw-Kedlaya, Remark 12 — the Frobenius matrix of phi^m is the product of twisted matrices
- `ColemanIntegration:L1/coleman-realization` — the Frobenius equation (iii)
- `ColemanIntegration:L2` — the Frobenius relation Li_k - p^(-k) phi^* Li_k is overconvergent

*Unit tests.* A wrong definition fails one of these.

- `frobeniusWord_log` (computation) — For (P^1, {0, 1, infinity}), phi(z) = z^p, tangential base point at 0: phi^# L [e_0] = p L [e_0].
- `frobeniusWord_empty` (degenerate) — phi^# (L []) = L [] = 1.
- `frobeniusWord_Li1` (computation) — For the same datum, phi^# L [e_1] = p L [e_1] + log((z^p - 1)/(z - 1)^p), with log u of constant term 0 at the end 0 (u(0) = 1 for odd p; u(0) = -1 and log(-1) = 0 for p = 2).
- `frobeniusWord_not_top_only` (non-example) — phi^# L [e_0, e_1] is not p^2 L [e_0, e_1]: the correction p H is nonzero (its realisation is p (Li_2(z) - p^(-2) Li_2(z^p)), nonzero at z = 2 for p = 3).

*Construction.*

1. Recursion on length: phi^#(L_(e_i w)) := the D-primitive (L1/word-algebra-integrability) of phi^*(omega_i) phi^#(L_w) = (sum_j M_ij omega_j + d g_i) phi^#(L_w), normalised at the base point.
2. The top-degree formula follows by induction from phi^* omega = M omega + dg.
3. Multiplicativity: both sides of phi^#(L_u L_v) = phi^#(L_u) phi^#(L_v) have the same D-image by induction and the same normalisation; conclude by ker D = K (L1/word-algebra-integrability (b)).
4. lambda o phi^# = phi^* o lambda: both are D-compatible maps U -> O(]x_0[) (phi maps ]x_0[ into itself) with the same normalisation at the fixed base point, so they agree by the uniqueness in L1/word-algebra-local-expansion.

*Acceptance.*

- For P^1 minus {0, 1, infinity}, phi(z) = z^p and the tangential base point at 0: phi^# L_(e_0) = p L_(e_0), phi^# L_(e_1) = p L_(e_1) + log u, and phi^# L_(e_0 e_1) = p^2 L_(e_0 e_1) + p H with H the primitive of log(u) dz/z of constant term 0.

*Uses.* `ColemanIntegration:L1/frobenius-lift`, `ColemanIntegration:L1/teichmuller-point`, `ColemanIntegration:L1/frobenius-h1-datum`, `ColemanIntegration:L1/word-algebra`, `ColemanIntegration:L1/word-algebra-integrability`, `ColemanIntegration:L1/word-algebra-local-expansion`.

*Sources.*

- Heidelberg lectures on Coleman integration, Section 1.5.2, p. 13: “is a solution of the system of differential equations dy0 = 0, dy1 = omega1 y0, . . . dyn = omegan yn-1” Frobenius pullback transforms the unipotent system for omega into the one for f^* omega; phi^# is this transformation on U.
- Heidelberg lectures on Coleman integration, Proof of Theorem 2, p. 8: “Put all the forms above into a column vector omega. Then we have a matrix M in M_{n x n}(K) such that phi omega = M omega + dg where g in (A+_K)^n.” The depth-one case: phi omega = M omega + dg.

#### Definition. Coleman functions

*Module* `TauCeti/NumberTheory/Coleman/Functions.lean`. *Node* `ColemanIntegration:L1/coleman-functions`.

Let (X, D) be a good-reduction pair with a Frobenius-structured datum (phi, omega, M, g), a in C_p a branch and rho = rho^a the realisation of L1/coleman-realization. The ring of Coleman functions is A_Col^a(Y) := rho(U) in A_loc^a(Y), filtered by depth A_Col,<=n := rho(U_(<= n)), and the module of Coleman forms is Omega_Col := A_Col Omega+(Y) in Omega_loc^a. It contains A+(Y), is closed under products and d (d A_Col,<=n in A_Col,<=n-1 Omega+), every Coleman form has a Coleman primitive (L1/coleman-integral), and it depends neither on the basis omega (API changeBasis of L1/frobenius-h1-datum), nor on the base point (change of base point by Chen's formula), nor on the Frobenius lift (L1/frobenius-lift-independence). It is Coleman's ring M(U) (Besser's Theorem 5.7) and Furusho's A^a_Col.

*Hypotheses.* A datum on (X, D); a in C_p; for independence of the lift, the hypotheses of L1/frobenius-lift-independence.

*API.*

- `ColemanFunctions` (*constructor*) — ColemanFunctions datum a : Subalgebra C_p (LocAn (X, D) a), the image of the realisation.
- `ColemanFunctions.dagger_le` (*coercion*) — A+(Y) is contained in ColemanFunctions.
- `ColemanFunctions.d_mem` (*structure*) — For F Coleman, dF lies in ColemanFunctions . Omega+(Y).
- `ColemanFunctions.depth` (*structure*) — The filtration by depth, with depth 0 equal to A+(Y).
- `ColemanFunctions.ker_d` (*characterisation*) — F Coleman with dF = 0 implies F constant (L1/coleman-uniqueness-principle).
- `ColemanFunctions.frobenius_mem` (*structure*) — phi^* preserves ColemanFunctions.
- `ColemanFunctions.pullback` (*functoriality*) — Pullback along morphisms of wide opens (L1/coleman-pullback).
- `ColemanFunctions.branch` (*equivalence*) — iota_(a,b) maps ColemanFunctions for a onto those for b (L1/branch-independence-principle).
- `ColemanFunctions.indep_basis` (*equivalence*) — The subalgebra does not depend on the H^1 basis omega nor on the phi-fixed base point.
- `ColemanFunctions.eval` (*projection*) — Values at points of ]Y_k[(C_p).

*Used by.*

- Besser, Tannakian formalism, Sections 4-5 — A_Col(T) and Coleman's M(U)
- Furusho, p-adic MZV I, Section 2 — the ring A^a_Col in which p-adic multiple polylogarithms live
- Besser, Heidelberg lectures, Section 1.5.3 — Coleman functions and their operations
- `ColemanIntegration:L2` — Li_k is a Coleman function on P^1 minus {0, 1, infinity}
- `ColemanIntegration:L3` — values of Coleman functions at roots of unity
- `AnabelianGeometryAndNonabelianChabauty:NC.4` — iterated Coleman integrals give the unipotent Albanese map
- `EffectiveDiophantineMethods:ED.4` — single Coleman integrals are Coleman functions of depth one
- `PadicHodgeRegulators:D.1` — p-adic polylogarithms as analytic functions with normalisations

*Unit tests.* A wrong definition fails one of these.

- `ColemanFunctions.log_mem` (computation) — For (P^1, {0, 1, infinity}): log_a z and log_a(1 - z) are Coleman functions of depth 1 (realisations of L [e_0] and L [e_1]).
- `ColemanFunctions.depth_zero` (degenerate) — The depth-0 part is A+(Y).
- `ColemanFunctions.not_all_locAn` (non-example) — For p >= 3, the element of LocAn equal to log_a z + 1 on the residue disc of 2 and to log_a z elsewhere has d = dz/z but is not a Coleman function.
- `ColemanFunctions.dF_zero` (characterisation) — A Coleman function with dF = 0 is a constant.

*Construction.*

1. Define A_Col^a := the image of rho, a C_p-subalgebra of A_loc^a (coefficients extended to C_p).
2. d rho = rho D gives d(A_Col) in A_Col Omega+.
3. Independence of basis: U for P omega is U for omega with L_w transformed by P^(tensor n); rho is transported by uniqueness in L1/coleman-realization.
4. Independence of the base point: realisations normalised at two base points differ by the deconcatenation formula of L1/word-algebra-local-expansion (iii), whose constants are values of lower-depth Coleman functions; the image is the same.

*Acceptance.*

- A_Col,<=0 = A+(Y); for P^1 minus {0, 1, infinity}, log_a z and log_a(1 - z) are Coleman functions of depth 1.

*Uses.* `ColemanIntegration:L1/coleman-realization`, `ColemanIntegration:L1/locally-analytic-log-functions`, `ColemanIntegration:L1/frobenius-h1-datum`, `ColemanIntegration:L1/word-algebra`, `ColemanIntegration:L1/word-algebra-local-expansion`.

*Planet:* Coleman functions.

*Sources.*

- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Section 2.1, p. 8 (arXiv v2): “In [C], Coleman constructed an A+-subalgebra A^a_Col of A^a_loc, which we call the ring of Coleman functions attached to a branch parameter a in C_p, and a C_p-linear map int_(a) : A^a_Col (x)_{A+} Omega+ -> A^a_Col / C_p . 1 satisfying d|_{A^a_Col} o int_(a) = id” Coleman's ring of Coleman functions A^a_Col with its integration map; this node constructs it.
- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “One defines recursively M_{i+1}(U) := A(U) . int(W_i(U)) and W_{i+1}(U) := M_{i+1}(U) . Omega^1(U) = (int(W_i(U))) . Omega^1(U) and checks that the principle above permits extending int uniquely to W_{i+1}(U).” Coleman's recursive construction of M(U); the depth filtration.
- Heidelberg lectures on Coleman integration, Section 1.5.3, p. 17: “Corollary 3. If dF = 0 then F is a constant function.” Coleman functions with dF = 0 are constant, part of the API.

#### Construction. The Coleman integral

*Module* `TauCeti/NumberTheory/Coleman/Integral.lean`. *Node* `ColemanIntegration:L1/coleman-integral`.

In the setting of L1/coleman-functions: for F in A_Col,<=n and eta in Omega+(Y) the Coleman primitive of F eta is int F eta := rho(D^(-1)(rho^(-1)(F) eta)) in A_Col,<=n+1 / C_p (well defined because rho is injective, L1/coleman-uniqueness-principle, and D is surjective with kernel the constants, L1/word-algebra-integrability). For points x, y of ]Y_k[(C_p) (or tangential points at ends), int_x^y F eta := G(y) - G(x) for any primitive G, and the based primitive int_x^z F eta is the Coleman function G with dG = F eta and G(x) = 0. Properties: (a) d int = id; (b) int dG = G mod C_p for G Coleman; (c) phi^* int = int phi^* mod C_p; (d) linearity; (e) int_x^y + int_y^z = int_x^z; (f) if x, y lie in one residue disc (tiny integral) int_x^y is the power-series integral on the disc; (g) change of variables along morphisms (L1/coleman-pullback); (h) int_x^y dg = g(y) - g(x) for g in A+(Y). For single integrals of eta in Omega+(Y) this is the map mu_W of Balakrishnan-Bradshaw-Kedlaya's Theorem 5 (Coleman).

*Hypotheses.* A datum on (X, D); a in C_p.

*API.*

- `colemanIntegral` (*constructor*) — colemanIntegral : ColemanForms -> ColemanFunctions / C_p.
- `d_colemanIntegral` (*simp*) — d (colemanIntegral eta) = eta.
- `colemanIntegral_d` (*simp*) — colemanIntegral (d G) = G mod C_p for G a Coleman function.
- `colemanIntegral_frobenius` (*relation*) — colemanIntegral (phi^* eta) = phi^* (colemanIntegral eta) mod C_p.
- `definiteIntegral` (*data*) — int_x^y eta for x, y in ]Y_k[(C_p) (and tangential points at ends).
- `definiteIntegral_add` (*relation*) — int_x^y + int_y^z = int_x^z.
- `definiteIntegral_tiny` (*compatibility*) — For x, y in one residue disc, int_x^y is the integral of the local power series (L0/disc-primitive-unique).
- `basedPrimitive` (*constructor*) — basedPrimitive x eta : the Coleman function with d = eta and value 0 at x.
- `definiteIntegral_d` (*simp*) — int_x^y dg = g(y) - g(x).
- `definiteIntegral_pullback` (*functoriality*) — int_(f x)^(f y) eta = int_x^y f^* eta for morphisms f (L1/coleman-pullback).

*Used by.*

- Balakrishnan-Bradshaw-Kedlaya, Theorem 5 — the axioms of Coleman integration used in explicit computation
- Furusho, p-adic MZV I, Notation 2.6 and Definition 2.9 — int_x^y and the definition of p-adic multiple polylogarithms
- McCallum-Poonen, Section 5.1 — properties (i)-(ii) of p-adic integrals used in Chabauty's method
- `EffectiveDiophantineMethods:ED.4` — Coleman integrals of holomorphic differentials between rational points
- `AnabelianGeometryAndNonabelianChabauty:NC.4` — iterated integrals from a base point
- `ColemanIntegration:L2` — Li_k(z) = int_0^z Li_(k-1)(t) dt/t

*Unit tests.* A wrong definition fails one of these.

- `definiteIntegral_dz_div_z` (computation) — On (P^1, {0, 1, infinity}): int_x^y dz/z = log_a(y) - log_a(x); for x, y roots of unity of order prime to p it is 0.
- `definiteIntegral_exact` (degenerate) — int_x^y d g = g(y) - g(x) for g in A+(Y), and int_x^x eta = 0.
- `definiteIntegral_tiny_log` (compatibility) — For p odd, int_2^(2+p) dz/z = logOneAdd (p/2), the disc integral.
- `definiteIntegral_forced` (non-example) — For p >= 5 the locally analytic primitive log_a z + (indicator of the residue disc of 2) of dz/z gives log_a 2 - log_a 3 + 1 between 3 and 2, whereas int_3^2 dz/z = log_a(2/3): an arbitrary locally analytic primitive does not compute the Coleman integral.

*Construction.*

1. Definition via U: rho^(-1)(F) eta is in U (x) Omega+; D^(-1) exists modulo K by L1/word-algebra-integrability.
2. (a), (b), (d): from d rho = rho D and linearity; (c) from phi^# D-compatibility (L1/word-algebra-frobenius) and rho phi^# = phi^* rho.
3. (e), (h): immediate from the definition of definite integrals.
4. (f): on a residue disc the Coleman primitive and the disc primitive (L0/disc-primitive-unique) have the same derivative, so they differ by a constant, which cancels in int_x^y.
5. (g): L1/coleman-pullback.

*Acceptance.*

- int_x^y dz/z = log_a(y/x); for Teichmueller points x, y of P^1 minus {0, 1, infinity} this is 0.
- For tiny integrals of dz/z between 2 and 2 + p (p odd): log(1 + p/2).

*Uses.* `ColemanIntegration:L1/word-algebra-integrability`, `ColemanIntegration:L1/coleman-realization`, `ColemanIntegration:L1/coleman-functions`, `ColemanIntegration:L1/coleman-uniqueness-principle`, `ColemanIntegration:L1/word-algebra-frobenius`, `ColemanIntegration:L0/disc-primitive-unique`, `ColemanIntegration:L0/annulus-log-primitive`.

*Planet:* Coleman integral.

*Sources.*

- Explicit Coleman integration for hyperelliptic curves, Section 2, Theorem 5 (Coleman), p. 4 (arXiv v2): “We may assign to each curve X over O and each wide open subspace W of X_Q a map mu_W : Div^0(W) x Omega^1_{W/C_p} -> C_p, subject to the following conditions.” The integration map on wide opens with linearity, compatibility with Definition 1, change of variables and the fundamental theorem.
- Explicit Coleman integration for hyperelliptic curves, Section 2, Theorem 5 (d), p. 4 (arXiv v2): “(d) (Fundamental theorem of calculus) For any Q = sum_i c_i (P_i) in Div^0(W) and any f in O(W), mu_W(Q, df) = sum_i c_i f(P_i).” Property (h).
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Notation 2.6, p. 9 (arXiv v2): “When we let y vary, we regard int_x^y omega as the Coleman function which is characterized by dF_omega = omega and F_omega(x) = 0.” The based primitive int_x^z as a Coleman function.
- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “The map int is characterized by three properties: 1. It is a primitive for the differential in the sense that dF_omega = omega. 2. It is Frobenius equivariant in the sense that int(phi^* omega) = phi^* int(omega). 3. If g in A(U), then F_dg = g + K.” Properties (a), (b), (c) characterise the integral.

#### Definition. The projective line minus zero, infinity and roots of unity

*Module* `TauCeti/NumberTheory/Coleman/PuncturedLine.lean`. *Node* `ColemanIntegration:L1/punctured-line`.

Let N >= 1 with p not dividing N, O = Z_p[mu_N] (unramified over Z_p) and K_N = Q_p(mu_N) inside C_p. The punctured line is U_N := P^1_O minus ({0, infinity} u mu_N); (P^1_O, D_N = {0, infinity} u mu_N) is a good-reduction pair (L1/good-reduction-pair) because the N-th roots of unity have distinct reductions. U_1 = P^1 minus {0, 1, infinity}. Residue classes: P^1(F_p-bar) = {0, infinity} u F_p-bar^x, with ends at 0, infinity and at the zeta in mu_N; local parameters t_0 = z, t_inf = 1/z, t_zeta = z - zeta; wide opens W_r = {r < |z| < 1/r, |z - zeta| > r for all zeta in mu_N}; dagger algebra A+(U_N) = weak completion of O[z, z^(-1), (z^N - 1)^(-1)] tensored with K_N (AdicSpacesPartII:F1).

*Hypotheses.* p prime, N >= 1, p does not divide N.

*API.*

- `puncturedLine` (*constructor*) — puncturedLine p N : the good-reduction pair (P^1_O, {0, infinity} u mu_N) for p not dividing N.
- `puncturedLine.wideOpen_eq` (*simp*) — The wide open W_r = {r < |z| < 1/r, |z - zeta| > r for zeta in mu_N}.
- `puncturedLine.residueClasses` (*data*) — Residue classes P^1(F_p-bar), ends {0, infinity} u reduction of mu_N.
- `puncturedLine.teichmuller` (*characterisation*) — For phi(z) = z^p the Teichmueller points of residue discs are the roots of unity of order prime to p not in mu_N.
- `puncturedLine.inclusion` (*functoriality*) — For N | N', U_N' is contained in U_N (more points removed).
- `puncturedLine.powerMap` (*functoriality*) — z |-> z^N maps U_N onto U_1 (finite etale of degree N on the generic fibre).
- `puncturedLine.rotation` (*functoriality*) — z |-> zeta z (zeta in mu_N) is an automorphism of U_N; z |-> 1/z and z |-> 1 - z are automorphisms of U_1.
- `puncturedLine.pPowerRotation` (*functoriality*) — For zeta a p-power root of unity, z |-> zeta z maps W_r into itself for r > |zeta - 1| and reduces to the identity.

*Used by.*

- Furusho, p-adic MZV I, Sections 2.2-3 — p-adic multiple polylogarithms and the p-adic KZ equation on U_1
- Besser, Heidelberg lectures, Section 1.2 — the circle with phi(x) = x^p
- `ColemanIntegration:L2` — Li_k on U_1; distribution relations through U_N and z |-> z^N; values at mu_N
- `ColemanIntegration:L3` — values at eps_N^c
- AnabelianGeometryAndNonabelianChabauty:NC.4, NC.5 — Chabauty-Kim for P^1 minus {0, 1, infinity} (S-unit equations)

*Unit tests.* A wrong definition fails one of these.

- `puncturedLine_one` (degenerate) — puncturedLine p 1 is P^1 minus {0, 1, infinity} for every p.
- `puncturedLine_teichmuller_count` (computation) — For N = 1 the phi-fixed points in the residue discs of U_1 are the p - 2 roots of unity of order dividing p - 1 other than 1.
- `puncturedLine_p_dvd` (non-example) — For N = p the pair is not of good reduction (L1/good-reduction-pair test goodReductionPair_mu_p).
- `puncturedLine_powerMap_fibre` (compatibility) — The fibre of z |-> z^N over 1 is mu_N, the removed points of U_N other than 0 and infinity.

*Construction.*

1. Etaleness of D_N: z^N - 1 is separable modulo p since p does not divide N.
2. The wide opens and dagger algebra are the instance of L1/wide-open-neighbourhood with these parameters.

*Acceptance.*

- U_1 = P^1 minus {0, 1, infinity} with W_r = {r < |z| < 1/r, |z - 1| > r}.

*Uses.* `ColemanIntegration:L1/good-reduction-pair`, `ColemanIntegration:L1/wide-open-neighbourhood`, `AdicSpacesPartII:F1`, `mathlib:rootsOfUnity`, `mathlib:IsPrimitiveRoot`.

*Sources.*

- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Section 2.2, before Definition 2.9, p. 9 (arXiv v2): “we fix a branch parameter a in C_p and employ Coleman's p-adic integration theory attached to this branch parameter a in C_p for X = P^1_{O_Cp} and Y = Spec O_Cp[t, 1/t, 1/(1-t)].” The case N = 1 is Furusho's setting for p-adic multiple polylogarithms.
- Heidelberg lectures on Coleman integration, Section 1.2, pp. 2-3: “we take the map phi : X -> X given by phi(x) = x^p . which is a lift of the p-power map. One notices immediately that phi^* omega = p omega.” The circle |z| = 1 with phi(x) = x^p, the tube of U_1 minus the disc of 1.

#### Definition. Coleman functions on the thrice-punctured line

*Module* `TauCeti/NumberTheory/Coleman/PuncturedLine.lean`. *Node* `ColemanIntegration:L1/punctured-line-coleman-functions`.

For N >= 1 with p not dividing N and a branch a in C_p, A_Col^a(U_N) := rho^a(U(U_N)) inside A_loc^a(U_N), where U(U_N) is the word algebra (L1/word-algebra) over A+(U_N) on the letters e_0 (for dz/z) and e_zeta (for dz/(z - zeta), zeta in mu_N), and rho^a is the realisation (L1/coleman-realization) for the datum L1/punctured-line-datum normalised at the tangential base point at 0: the constant term CT_0(rho^a(L_w)) at the end 0 vanishes for w nonempty. The iterated integrals L_w(z) := rho^a(L_w) are the regularised iterated integrals from the tangential base point at 0: L_(e_0) = log_a z, L_(e_1) = log_a(1 - z), and -L_(e_0^(k-1) e_1) is the p-adic polylogarithm Li_k of ColemanIntegration:L2. For N = 1 this is the ring of Coleman functions on P^1 minus {0, 1, infinity} (Furusho's A^a_Col), with every result of L1/coleman-functions to L1/coleman-pullback holding unconditionally.

*Hypotheses.* p prime not dividing N; a in C_p.

*API.*

- `PuncturedLine.colemanFunctions` (*constructor*) — PuncturedLine.colemanFunctions p N a : the subalgebra A_Col^a(U_N) of LocAn.
- `PuncturedLine.iteratedIntegral` (*data*) — iteratedIntegral w := rho^a(L_w), the regularised iterated integral from the tangential base point at 0.
- `PuncturedLine.d_iteratedIntegral` (*simp*) — d L_(e_0 w) = L_w dz/z and d L_(e_zeta w) = L_w dz/(z - zeta).
- `PuncturedLine.constantTerm_iteratedIntegral` (*simp*) — CT_0(L_w) = 0 for w nonempty.
- `PuncturedLine.iteratedIntegral_shuffle` (*relation*) — L_u L_v = sum over the shuffles w of u and v of L_w.
- `PuncturedLine.frobenius_iteratedIntegral` (*relation*) — phi^* L_(e_0) = p L_(e_0); phi^* L_(e_1) = p L_(e_1) + log u; in general phi^* L_w = p^|w| L_(sigma w) plus lower depth with A+ coefficients.
- `PuncturedLine.iteratedIntegral_series` (*compatibility*) — For w = e_0^(k-1) e_1, L_w = -sum_{n >= 1} z^n/n^k on D^-(0, 1): the coefficients of the complex polylogarithm Li_k^C (Polylogarithms:P.1/classical-polylogarithm).
- `PuncturedLine.pullback_S3` (*functoriality*) — z |-> 1/z and z |-> 1 - z act on A_Col^a(U_1) (L1/coleman-pullback).
- `PuncturedLine.pullback_power` (*functoriality*) — z |-> z^m (p not dividing m) pulls A_Col^a(U_1) into A_Col^a(U_m); z |-> zeta z (zeta a p-power root of unity) preserves A_Col^a(U_N).
- `PuncturedLine.branch` (*equivalence*) — iota_(a,b) maps A_Col^a(U_N) onto A_Col^b(U_N); values on the tube are branch independent.

*Used by.*

- `ColemanIntegration:L2` — Li_k := -L_(e_0^(k-1) e_1), its differential recursion, inversion (pullback along 1/z), distribution (pullback along z^m and rotations) and Frobenius relations
- `ColemanIntegration:L3` — values at eps_N^c, roots of unity in the tube (order prime to p) or in the end disc of 1 (p-power order)
- Furusho, p-adic MZV I, Sections 2-3 — p-adic multiple polylogarithms and the fundamental solution of the p-adic KZ equation are generating series of the L_w
- Besser, Finite and p-adic polylogarithms — Coleman's Li_n and Li_n^(p) = Li_n(z) - p^(-n) Li_n(z^p)
- AnabelianGeometryAndNonabelianChabauty:NC.4, NC.5 — iterated integrals of dz/z and dz/(1 - z) in Chabauty-Kim for P^1 minus {0, 1, infinity}
- `PadicHodgeRegulators:D.1` — the p-adic dilogarithm with its branch and Frobenius normalisations

*Unit tests.* A wrong definition fails one of these.

- `PuncturedLine.log_eq` (computation) — For N = 1: iteratedIntegral [e_0] = log_a z and iteratedIntegral [e_1] = log_a(1 - z); at z = zeta in mu_(p-1), zeta != 1, iteratedIntegral [e_0] (zeta) = 0.
- `PuncturedLine.Li2_frobenius` (computation) — With H the D-primitive of log(u) dz/z of constant term 0 at 0, rho(H) = p (Li_2(z) - p^(-2) Li_2(z^p)); numerically H(2) = p Li_2^(p)(2) modulo 3^10 for p = 3 (checked with PARI/GP against Besser's measure formula).
- `PuncturedLine.depth_zero` (degenerate) — On A+(U_N) the realisation is the inclusion; for N = 1 the construction is the thrice-punctured line.
- `PuncturedLine.series_compat` (compatibility) — On D^-(0, 1), -iteratedIntegral (e_0^(k-1) e_1) = sum z^n/n^k, whose coefficients are those of the complex Li_k (Polylogarithms:P.1/classical-polylogarithm).
- `PuncturedLine.not_all_primitives` (non-example) — For p >= 3, log_a z + (indicator of the residue disc of 2) has differential dz/z and is not in A_Col^a(U_1).

*Construction.*

1. Instantiate L1/coleman-realization and L1/coleman-functions with L1/punctured-line-datum and the tangential base point at 0 (phi-fixed, phi^* t_0 = t_0^p).
2. Identify L_(e_0) and L_(e_1): log_a z and log_a(1 - z) are Coleman (depth-one realisations), have the right differentials and constant term 0 at 0, so they equal rho(L_(e_0)), rho(L_(e_1)) by uniqueness.
3. Series at 0: for w whose last letter is not e_0, the local expansion at 0 lies in C_p[[z]] with value 0 at 0 (L1/word-algebra-local-expansion); for w = e_0^(k-1) e_1 it is -sum z^n/n^k.

*Acceptance.*

- -rho(L_(e_0 e_1)) = Li_2 and the depth-two Frobenius check of L1/coleman-realization.

*Uses.* `ColemanIntegration:L1/punctured-line-datum`, `ColemanIntegration:L1/coleman-realization`, `ColemanIntegration:L1/coleman-functions`, `ColemanIntegration:L1/word-algebra`, `ColemanIntegration:L1/word-algebra-local-expansion`, `ColemanIntegration:L1/coleman-uniqueness-principle`, `ColemanIntegration:L1/frobenius-lift-independence`, `ColemanIntegration:L1/branch-independence-principle`, `Polylogarithms:P.1/classical-polylogarithm`.

*Planet:* Coleman functions on the thrice-punctured line.

*Sources.*

- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Definition 2.9, p. 9 (arXiv v2): “Li^a_1(z) = -log^a(1 - z) := int_0^z dt/(1 - t).” Li_1 = -log^a(1 - z) = int_0^z dt/(1 - t) and the recursive definition of p-adic polylogarithms in A^a_Col.
- Heidelberg lectures on Coleman integration, Section 1.5.4, p. 19: “One replaces the condition Li_n(0) = 0 by the equivalent condition that the constant term there is 0.” The normalisation at 0 is by the constant term (tangential base point).
- Finite and p-adic polylogarithms, Section 1, p. 1 (arXiv v1): “Coleman defined p-adic polylogarithms, Li_n : C_p -> C_p. These functions are locally analytic in the sense that they are given by a convergent power series on each residue disc in C_p.” Coleman's p-adic polylogarithms are locally analytic, given by a power series on each residue disc.

#### Construction. The primitive from the tangential base point at zero

*Module* `TauCeti/NumberTheory/Coleman/PuncturedLine.lean`. *Node* `ColemanIntegration:L1/punctured-line-based-primitive`.

For F in A_Col^a(U_N) and eta in Omega+(U_N), the based primitive int_0^z F eta is the unique Coleman function G with dG = F eta and CT_0(G) = 0 (constant term of its expansion at the end 0). If the expansion of G at the end 0 lies in C_p[[z]] (no logarithm and no negative powers), CT_0(G) = G(0), so the normalisation is the value 0 at 0. For x, y in the tube, int_x^y F eta = G(y) - G(x). This is the operator by which ColemanIntegration:L2 defines Li_k(z) = int_0^z Li_(k-1)(t) dt/t with Li_1(z) = int_0^z dt/(1 - t).

*Hypotheses.* p does not divide N; a in C_p.

*API.*

- `PuncturedLine.basedPrimitive` (*constructor*) — basedPrimitive (F eta) : the Coleman function G with dG = F eta and CT_0(G) = 0.
- `PuncturedLine.d_basedPrimitive` (*simp*) — d (basedPrimitive (F eta)) = F eta.
- `PuncturedLine.constantTerm_basedPrimitive` (*simp*) — CT_0 (basedPrimitive (F eta)) = 0.
- `PuncturedLine.basedPrimitive_eq_zero_at_zero` (*compatibility*) — If the expansion of basedPrimitive (F eta) at 0 lies in C_p[[z]] then its value at 0 is 0.
- `PuncturedLine.basedPrimitive_unique` (*characterisation*) — A Coleman function G with dG = F eta and CT_0(G) = 0 equals basedPrimitive (F eta).
- `PuncturedLine.basedPrimitive_frobenius` (*relation*) — phi^* (basedPrimitive (F eta)) = basedPrimitive (phi^*(F eta)).
- `PuncturedLine.basedPrimitive_branch` (*relation*) — iota_(a,b) (basedPrimitive_a (F eta)) = basedPrimitive_b (iota_(a,b)(F) eta).

*Used by.*

- `ColemanIntegration:L2` — the definition of Li_k and of the tangential normalisation at 0
- Furusho, p-adic MZV I, Definition 2.9 — Li^a_(k1,...,km) defined by int_0^z
- Besser, Heidelberg lectures, Section 1.5.4 — tangential base points via constant terms
- `AnabelianGeometryAndNonabelianChabauty:NC.4` — iterated integrals from the tangential base point for P^1 minus {0, 1, infinity}

*Unit tests.* A wrong definition fails one of these.

- `PuncturedLine.basedPrimitive_Li1` (computation) — basedPrimitive (dz/(1 - z)) = -log_a(1 - z).
- `PuncturedLine.basedPrimitive_log` (characterisation) — basedPrimitive (dz/z) = log_a z, normalised by CT_0 = 0 although it has no value at 0.
- `PuncturedLine.basedPrimitive_zero` (degenerate) — basedPrimitive 0 = 0.
- `PuncturedLine.value_normalisation_fails` (non-example) — No Coleman primitive G of dz/z has G(0) = 0: G = log_a z + c has no value at 0, so the value normalisation cannot replace the constant term.

*Construction.*

1. Existence and uniqueness: L1/coleman-integral gives G modulo constants; CT_0 fixes the constant, CT_0 being linear with CT_0(1) = 1.
2. Value at 0: for germs in C_p[[z]] the constant term is the value at z = 0 (API constantTerm_analytic of L1/word-algebra-local-expansion).
3. Frobenius compatibility: CT_0 is phi-invariant because phi^* z = z^p and phi^* l_0 = p l_0.

*Acceptance.*

- int_0^z dt/(1 - t) = -log_a(1 - z); int_0^z dt/t = log_a z (normalised by constant term, not by a value at 0).

*Uses.* `ColemanIntegration:L1/punctured-line-coleman-functions`, `ColemanIntegration:L1/coleman-integral`, `ColemanIntegration:L1/word-algebra-local-expansion`.

*Sources.*

- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Notation 2.6, p. 9 (arXiv v2): “When we let y vary, we regard int_x^y omega as the Coleman function which is characterized by dF_omega = omega and F_omega(x) = 0.” The based primitive characterised by its derivative and its value at the base point.
- Heidelberg lectures on Coleman integration, Section 1.5.4, p. 19: “One replaces the condition Li_n(0) = 0 by the equivalent condition that the constant term there is 0.” The normalisation at the singular point 0 by the constant term.

### Lemmas, theorems and comparisons

#### Lemma. Residue discs are open discs and ends are annuli

*Node* `ColemanIntegration:L1/residue-disc-parametrisation`.

Let (X, D) be a good-reduction pair and x in X_k(F_p-bar). A local parameter t at a lift of x (a function regular near x on the integral model whose reduction is a uniformiser at x) induces an isomorphism of rigid spaces ]x[ -> D^-(0, 1), y |-> t(y). For e in D and r < 1 it induces ]e[ intersected with W_r -> A(0; r, 1). Two parameters t, t' differ by an automorphism t' = u t (1 + h) with |u| = 1 and |h| < 1 on the disc. Consequently there are restriction maps res_x : A+(Y) -> O(D^-(0, 1)) for x in Y_k(F_p-bar) and res_e : A+(Y) -> R_e (end germs, L0/annulus-residue), compatible with d, well defined up to the automorphisms above, which preserve O(D^-(0, 1)), R_e, residues and the logarithmic rings of L0/annulus-log-ring.

*Hypotheses.* (X, D) a good-reduction pair; x a point of X_k(F_p-bar).

*Proof outline.*

1. The formal completion of X along x is the formal disc in t (smoothness); its generic fibre is D^-(0, 1) (AdicSpacesPartII:R2).
2. At e in D the same parameter identifies ]e[ with D^-(0, 1) and W_r intersected with ]e[ with A(0; r, 1).
3. Change of parameter: t'/t is a unit of the completed local ring with unit reduction, hence of the form u (1 + h).
4. Invariance of O(D^-), R_e and residues under such automorphisms: L0/disc-analytic-functions (composition) and the coordinate-change API of L0/annulus-residue and L0/annulus-log-ring.

*Acceptance.*

- For P^1 and x = 2 (p odd): t = z - 2 identifies ]2[ with D^-(0, 1).
- In McCallum-Poonen's setting over Z_p, t maps the Q_p-points of a residue class bijectively onto pZ_p.

*Uses.* `ColemanIntegration:L1/good-reduction-pair`, `ColemanIntegration:L1/wide-open-neighbourhood`, `AdicSpacesPartII:R2`, `ColemanIntegration:L0/disc-analytic-functions`, `ColemanIntegration:L0/annulus-residue`, `ColemanIntegration:L0/annulus-log-ring`.

*Sources.*

- Explicit Coleman integration for hyperelliptic curves, Section 2, Definition 3, p. 4 (arXiv v2): “There is a natural specialization map from X_Q to X-bar; the inverse image of any point of X-bar is a subspace of X_Q isomorphic to an open unit disc. We call such a disc a residue disc of X.” Residue discs are open unit discs.
- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “while for x in {e_1,...,e_n} these are the intersections of U with the usual discs and are isomorphic to an open annulus {r<|z|<1}.” The pieces of a basic wide open at the points of D are annuli {r < |z| < 1}.
- The method of Chabauty and Coleman, Section 5.2, item (1), p. 6: “(1) The function t maps the residue class bijectively to pZ_p. (This is related to Hensel's lemma.)” The parameter identifies a residue class with a disc.
- Heidelberg lectures on Coleman integration, Section 1.3.3, Definition 2, p. 6: “will be called the residue disc of x, denoted U_x in X^geo. By Hensel's Lemma and the smoothness assumption on A-bar it is easy to see that U_x is naturally isomorphic to the space of geometric points of a unit polydisc.” Residue discs are polydiscs by Hensel's lemma; dimension one here.

#### Lemma. Teichmueller points of residue discs

*Node* `ColemanIntegration:L1/teichmuller-point`.

Let phi be a Frobenius lift on a good-reduction pair (X, D) over O_K with residue field F_q, and x in Y_k(F_(q^m)). Then phi^m maps ]x[ into itself and has a unique fixed point b_x in ]x[, the Teichmueller point of ]x[ (for phi); phi(b_x) = b_(F(x)). For P^1 minus {0, 1, infinity} and phi(z) = z^p the Teichmueller point of ]x[ is the Teichmueller lift of x, a root of unity of order prime to p.

*Hypotheses.* x has coordinates in F_(q^m).

*Proof outline.*

1. phi^m reduces to the q^m-power Frobenius, which fixes x, so phi^m maps ]x[ into itself (L1/frobenius-lift).
2. In a parameter t at x (L1/residue-disc-parametrisation), phi^m is y |-> G(y) with G(y) = y^(q^m) + pi H(y) and H with integral coefficients; hence |G(y) - G(y')| <= max(rho^(q^m - 1), |pi|) |y - y'| on D(0, rho) for rho < 1, and G maps D(0, rho) into D(0, max(rho^(q^m), |pi|)).
3. Choose rho with |pi| <= rho < 1; G is a contraction of the complete closed disc D(0, rho) into itself, so it has a unique fixed point there; any fixed point in ]x[ lies in D(0, |pi|^(1/q^m)) by the second estimate, so it is unique in ]x[.
4. phi(b_x) is fixed by phi^m and lies in ]F(x)[, hence is b_(F(x)).

*Acceptance.*

- For phi(z) = z^p and x = 2 in F_5, b_x is the Teichmueller lift of 2 in Z_5, with b_x^4 = 1 (PARI/GP: teichmuller(2 + O(5^10))).
- phi(z) = zeta^(-1) z^p (zeta a p-power root of unity) has different Teichmueller points.

*Uses.* `ColemanIntegration:L1/frobenius-lift`, `ColemanIntegration:L1/residue-disc-parametrisation`.

*Sources.*

- Explicit Coleman integration for hyperelliptic curves, Section 3.3, Definition 14, p. 8 (arXiv v2): “A Teichmueller point of X_Q is a point fixed by some power of phi. Each non-Weierstrass residue disc contains a unique such point” Teichmueller points are the fixed points of powers of the Frobenius lift, one per residue disc.
- Heidelberg lectures on Coleman integration, Section 1.2, p. 3: “Suppose now that alpha satisfies the relation alpha^(p^k) = alpha. Then we immediately obtain F_omega(alpha) = F_omega(alpha^(p^k)) = p^k F_omega(alpha) => F_omega(alpha) = 0.” The Teichmueller points of the circle for phi(x) = x^p are the roots of unity alpha with alpha^(p^k) = alpha.
- The method of Chabauty and Coleman, Remark 8.3 (2), p. 13: “(2) Coleman's theory of p-adic integration [Col85a] gives a method for setting the constant of integration directly in terms of calculations on X, through the notion of a Teichmueller point.” The constant of integration is set at Teichmueller points.

#### Lemma. Products of Weil numbers of positive weight are not roots of unity

*Node* `ColemanIntegration:L1/weil-weight-no-root-of-unity`.

Let q be a power of p and lambda_1, ..., lambda_n algebraic numbers such that for every embedding into C, |lambda_i| = q^(w_i/2) with w_i >= 1. Then for every m >= 1, (lambda_1 ... lambda_n)^m != 1. Consequently if M is a matrix whose eigenvalues are Weil q-numbers of weights 1 and 2, then (M^(tensor n))^m has no eigenvalue 1 for n, m >= 1, i.e. hypothesis (Hw) of L1/frobenius-h1-datum holds.

*Hypotheses.* The lambda_i are Weil q-numbers of positive weight.

*Proof outline.*

1. |(lambda_1 ... lambda_n)^m| = q^(m (w_1 + ... + w_n)/2) > 1 under any complex embedding.
2. The eigenvalues of M^(tensor n) are the products of n eigenvalues of M (Kronecker product), and those of its m-th power are their m-th powers; apply the first step.

*Acceptance.*

- For P^1 minus {0, 1, infinity} (M = p I) the products are p^n, never roots of unity.
- Weight 0 is excluded: a unit-root eigenvalue that is a root of unity would violate (Hw).

*Uses.* `mathlib:Module.End.HasEigenvalue`, `mathlib:LinearMap.charpoly`.

*Sources.*

- Heidelberg lectures on Coleman integration, Section 1.3.2, Theorem 1, p. 6: “Theorem 1. The eigenvalues of the kappa-linear Frobenius phi^r on H^1_MW(A-bar) are Weil numbers of weights 1 and 2.” The weights are 1 and 2; this lemma turns that into hypothesis (Hw).
- Explicit Coleman integration for hyperelliptic curves, Section 3.3, Algorithm 11, step 2, p. 8 (arXiv v2; wording corrected in ColemanIntegration/E2): “As the eigenvalues of the matrix M are algebraic integers of C_p-norm p^(m/2) != 1 (see [21, Section 2]), the matrix M - I is invertible, and we may solve (7) to obtain the integrals int_P^Q omega_i.” The invertibility of M - I from the absolute values of the eigenvalues.

#### Theorem. Every good-reduction pair carries a Frobenius datum

*Node* `ColemanIntegration:L1/good-reduction-datum-exists`.

Let (X, D) be a good-reduction pair over O_K (K finite over Q_p, residue field F_q). Then (X, D) carries a Frobenius-structured datum (L1/frobenius-h1-datum): a Frobenius lift phi exists; H^1_dR+(Y) = Omega+(Y)/dA+(Y), which is the Monsky-Washnitzer (rigid) cohomology H^1_rig(Y_k/K), is finite dimensional, of dimension 2g + #D(K-bar) - 1 with a basis of algebraic differentials on Y_K, and its Frobenius does not depend on the lift; ker d = K on A+(Y); the identity principle (Hi) holds on the connected wide opens; and the eigenvalues of the K-linear Frobenius are Weil q-numbers of weights 1 (from H^1 of X_k) and 2 (from the residues along D), so (Hw) holds by L1/weil-weight-no-root-of-unity. All inputs except the last step are imported; the comparison with algebraic de Rham cohomology and the dimension formula are a recorded gap.

*Hypotheses.* (X, D) a good-reduction pair over O_K with K finite over Q_p.

*Proof outline.*

1. Frobenius lift: PadicDifferentialEquationsAndRigidCohomology:RD.0 (lifting to weak completions), giving L1/frobenius-lift.
2. Finite dimensionality of H^1_rig of the smooth affine curve Y_k and independence of the Frobenius action from the lift: PadicDifferentialEquationsAndRigidCohomology:RD.5 and RD.4.
3. Weights 1 and 2: PadicDifferentialEquationsAndRigidCohomology:RD.6 (with the localisation sequence 0 -> H^1(X_k) -> H^1(Y_k) -> K(-1)^(D) -> H^2(X_k) and purity of H^1 of the smooth proper curve X_k); then L1/weil-weight-no-root-of-unity gives (Hw).
4. ker d = K and (Hi): Y_k is connected, the wide opens are connected, and the identity principle for rigid functions on connected smooth curves (AdicSpacesPartII:F1).
5. Algebraic basis and dimension 2g + #D - 1: the comparison of H^1_rig(Y_k) with the algebraic de Rham cohomology of Y_K (gap 'Algebraic de Rham comparison for good-reduction affine curves').

*Acceptance.*

- For (P^1, {0, infinity} u mu_N) the datum is explicit (L1/punctured-line-datum), with dimension N + 1 = 2 * 0 + (N + 2) - 1.
- For an elliptic curve E/Z_p with good reduction minus its origin: dimension 2, eigenvalues the roots of T^2 - a_p T + p (weight 1).

*Uses.* `ColemanIntegration:L1/good-reduction-pair`, `ColemanIntegration:L1/wide-open-neighbourhood`, `ColemanIntegration:L1/frobenius-lift`, `ColemanIntegration:L1/frobenius-h1-datum`, `ColemanIntegration:L1/weil-weight-no-root-of-unity`, `PadicDifferentialEquationsAndRigidCohomology:RD.0`, `PadicDifferentialEquationsAndRigidCohomology:RD.4`, `PadicDifferentialEquationsAndRigidCohomology:RD.5`, `PadicDifferentialEquationsAndRigidCohomology:RD.6`, `AdicSpacesPartII:F1`.

*Sources.*

- Heidelberg lectures on Coleman integration, Section 1.3.2, Definition 1 and the following sentence, p. 6: “It is a consequence of the work of Berthelot that H^i_MW(A-bar) is a finite dimensional K-vector space.” Finite dimensionality of Monsky-Washnitzer cohomology.
- Heidelberg lectures on Coleman integration, Section 1.3.2, Theorem 1, p. 6: “Theorem 1. The eigenvalues of the kappa-linear Frobenius phi^r on H^1_MW(A-bar) are Weil numbers of weights 1 and 2.” The weights of Frobenius on H^1.
- Coleman integration using the Tannakian formalism, Section 5, pp. 17-18 (arXiv v1): “The only essential difficulty in extending the general theory to this case is that the Frobenius behavior of rigid cohomology (indeed, even finite dimensionality) is not known in this case.” Why the base field must be discretely valued: finiteness and Frobenius behaviour of rigid cohomology.

#### Lemma. Solving Frobenius equations along finite orbits

*Node* `ColemanIntegration:L1/frobenius-orbit-linear-algebra`.

Let S be a set with a bijection F : S -> S all of whose orbits are finite, V a finite-dimensional vector space over a field L, and T in End_L(V) such that T^m - 1 is invertible for every m >= 1. Then for every e : S -> V there is a unique c : S -> V with c(F(s)) = T(c(s)) + e(s) for all s in S. On the orbit of s of length m it is c(s) = (1 - T^m)^(-1) sum_{j=0}^{m-1} T^(m-1-j) e(F^j(s)). Semilinear form (Besser's Lemma 1): if sigma is an automorphism of L of finite order r and M is a matrix with 1 - M sigma(M) ... sigma^(r-1)(M) invertible, then x |-> sigma(x) - M x is bijective on L^n.

*Hypotheses.* F bijective with finite orbits (for S = X_k(F_p-bar) every point is defined over a finite field). No eigenvalue of T in an algebraic closure is a root of unity.

*Proof outline.*

1. Decompose S into F-orbits (mathlib:Function.IsPeriodicPt, mathlib:Function.minimalPeriod).
2. On an orbit of length m, iterating the equation gives c(s) = c(F^m s) = T^m c(s) + sum_{j<m} T^(m-1-j) e(F^j s); since 1 - T^m is invertible this determines c(s).
3. Define c on the orbit by this formula at one point and propagate by the equation; the value obtained after going round the orbit is consistent by construction.
4. Semilinear form: iterate r times to reduce to the linear matrix M sigma(M) ... sigma^(r-1)(M).

*Acceptance.*

- T = p on V = K and S = mu_(p^m - 1) with F(zeta) = zeta^p: for e = 0 the solution is c = 0, which is Besser's F_omega(alpha) = 0 for dz/z at Teichmueller points.
- For T = identity the statement fails: with e constant nonzero there is no solution at a fixed point of F.

*Uses.* `mathlib:Function.IsPeriodicPt`, `mathlib:Function.minimalPeriod`, `mathlib:Module.End.HasEigenvalue`.

*Sources.*

- Heidelberg lectures on Coleman integration, Proof of Theorem 2, Lemma 1, p. 8: “Lemma 1. The map sigma - M : K^n -> K^n is bijective” The semilinear version; its proof iterates sigma around the finite order and inverts I - M_r.
- Explicit Coleman integration for hyperelliptic curves, Section 3.3, Algorithm 11, step 2, p. 8 (arXiv v2): “As the eigenvalues of the matrix M are algebraic integers of C_p-norm p^(m/2) != 1 (see [21, Section 2]), the matrix M - I is invertible, and we may solve (7) to obtain the integrals int_P^Q omega_i.” The linear system solved in practice.

#### Theorem. Dwork's principle of continuation along Frobenius

*Node* `ColemanIntegration:L1/dwork-principle`.

Let (phi, omega, M, g) be a Frobenius-structured datum on (X, D), a a branch, N >= 1 and T in M_N(K) such that T^m - 1 is invertible for all m >= 1. (a) Uniqueness: if G in (A_loc^a)^N satisfies dG = 0 and phi^* G - T G is a constant vector C in C_p^N, then G is constant, G = (1 - T)^(-1) C. (b) Existence: for G_0 in (A_loc^a)^N and R in (A_loc^a)^N with d(phi^* G_0 - T G_0 - R) = 0 there is a unique locally constant c in LC^N with phi^*(G_0 + c) - T (G_0 + c) = R. (c) Polynomial form (Coleman): if G in A_loc^a has dG = 0 and P(phi^*) G is constant for a polynomial P in K[t] with no root of unity among its roots, then G is constant.

*Hypotheses.* The datum's Frobenius lift phi; T without root-of-unity eigenvalues.

*Proof outline.*

1. Locally constant functions are functions on the residue classes S = X_k(F_p-bar), and phi^* acts on them by c |-> c o F (L1/frobenius-lift, L1/locally-analytic-log-functions).
2. (b) Write phi^* G_0 - T G_0 - R =: -e with e in LC^N; the equation for c becomes c(F(s)) - T c(s) = e(s), solved uniquely by L1/frobenius-orbit-linear-algebra (F is bijective with finite orbits by L1/good-reduction-pair).
3. (a) Apply the uniqueness in L1/frobenius-orbit-linear-algebra to the constant e = C: the constant (1 - T)^(-1) C is a solution, hence the only one.
4. (c) Use the companion matrix of P on the vector (G, phi^* G, ..., (phi^*)^(deg P - 1) G).

*Acceptance.*

- For dz/z on P^1 minus {0, 1, infinity} (T = p, N = 1): a locally analytic primitive G with phi^* G = p G + C is determined; at Teichmueller points G = 0 when C = 0.
- Without the eigenvalue hypothesis (T = 1) any function constant along Frobenius orbits solves (a), so uniqueness fails.

*Uses.* `ColemanIntegration:L1/frobenius-h1-datum`, `ColemanIntegration:L1/frobenius-orbit-linear-algebra`, `ColemanIntegration:L1/frobenius-lift`, `ColemanIntegration:L1/locally-analytic-log-functions`, `ColemanIntegration:L1/good-reduction-pair`.

*Planet:* Dwork's principle of continuation along Frobenius.

*Sources.*

- Explicit Coleman integration for hyperelliptic curves, Section 3.3, p. 7 (arXiv v2): “The method of tiny integrals is not available; we instead employ Dwork's principle of analytic continuation along Frobenius, in the form of Kedlaya's algorithm [21] for calculating the action of Frobenius on de Rham cohomology.” Dwork's principle of analytic continuation along Frobenius.
- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “If int has already been defined on some space W, and omega in Omega^1_loc(U) is such that there is a polynomial P(t) with K-coefficients such that P(phi^*)omega = eta in W, then the conditions on the integral force the equality P(phi^*)F_omega = F_eta + Const.” Coleman's polynomial principle, part (c).
- Heidelberg lectures on Coleman integration, Proof of Theorem 2, pp. 8-9: “We claim that now the vector of functions F_omega is completely determined. Indeed, since dF_omega = omega it is sufficient to determine it on a single point on each residue disc.” Constants are fixed by one equation per residue disc, which is the orbit-wise linear algebra.

#### Theorem. Every form with word-algebra coefficients has a primitive

*Node* `ColemanIntegration:L1/word-algebra-integrability`.

Let (phi, omega, M, g) be a Frobenius-structured datum and U = U(A+(Y); omega). (a) D : U -> U (x) Omega+ is surjective, and more precisely maps U_(<= n+1) onto U_(<= n) (x) Omega+. (b) ker D = K L_empty. (c) The primitive is computed recursively: for f in A+(Y) and eta in Omega+ write f eta = dh + sum c_i omega_i (H1); then f L_w eta = D(h L_w + sum c_i L_(e_i w)) - h D L_w, and h D L_w has shorter words. This is the exactness of the Coleman de Rham complex at one-forms in the direct setting.

*Hypotheses.* Hypotheses (H0) and (H1) of L1/frobenius-h1-datum.

*Proof outline.*

1. (a) Induction on the length of w using the recursion (c), which uses only (H1).
2. (b) If D(sum f_w L_w) = 0 with maximal word length n, the coefficient of L_v (|v| = n) is d f_v = 0, so f_v is constant by (H0). The coefficient of L_v for |v| = n - 1 is d f_v + sum_i f_(e_i v) omega_i = 0, so sum_i f_(e_i v) [omega_i] = 0 in H^1_dR+ and f_(e_i v) = 0 by (H1); descend in n.

*Acceptance.*

- For P^1 minus {0, 1, infinity}: the primitive of z^(-2) L_(e_1) dz is -z^(-1) L_(e_1) + L_(e_1) - L_(e_0), since z^(-1) dz/(z - 1) = dz/(z - 1) - dz/z.
- Degenerate: for r = 0 this is the exactness of d on A+(Y) modulo constants.

*Uses.* `ColemanIntegration:L1/frobenius-h1-datum`, `ColemanIntegration:L1/word-algebra`.

*Sources.*

- Coleman integration using the Tannakian formalism, Theorem 4.15, p. 14 (arXiv v1): “Suppose (F, nabla_F) is a unipotent isocrystal on T. Then the Coleman de Rham complex of (F, nabla_F) is exact at the one forms. In particular, the sequence A_Col(T) -> Omega^1_Col(T) -> Omega^2_Col(T) is exact.” Exactness at one-forms; here proved directly for the word algebra.
- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “One defines recursively M_{i+1}(U) := A(U) . int(W_i(U)) and W_{i+1}(U) := M_{i+1}(U) . Omega^1(U) = (int(W_i(U))) . Omega^1(U) and checks that the principle above permits extending int uniquely to W_{i+1}(U).” Coleman's recursion M_(i+1) = A . int(W_i): the depth filtration of U.

#### Theorem. Realisation of the word algebra by Frobenius continuation

*Node* `ColemanIntegration:L1/coleman-realization`.

Let (phi, omega, M, g) be a Frobenius-structured datum on (X, D), a in C_p a branch and a phi-fixed base point as in L1/word-algebra-frobenius. There is a unique K-algebra homomorphism rho = rho^a : U(A+(Y); omega) -> A_loc^a(Y) such that (i) rho restricted to A+(Y) is the diagonal embedding; (ii) d o rho = rho o D componentwise; (iii) phi^* o rho = rho o phi^#; (iv) rho(L_w) is normalised at the base point (value 0 at b, resp. constant term 0 at e_0) for w nonempty. On each residue class x, rho restricted to A_log^a(x) is a local expansion twisted by constants (L1/word-algebra-local-expansion (iii)).

*Hypotheses.* A datum satisfying (H0), (H1), (Hw); a in C_p; a phi-fixed base point.

*Proof outline.*

1. Induction on depth n. Suppose rho is defined on U_(<= n-1) with (i)-(iv). For the r^n words w of length n choose, on every residue class, a local primitive G_w of rho(D L_w) (L0/disc-primitive-unique on discs, L0/annulus-log-primitive on ends).
2. By (ii) and (iii) in lower depth and L1/word-algebra-frobenius, the vector E := phi^* G - M^(tensor n) G - rho(phi^# L - top part) (indexed by words of length n) has dE = 0.
3. L1/dwork-principle (b) with T = M^(tensor n) (hypothesis (Hw)) gives a unique locally constant correction c making (iii) hold for the words of length n; the remaining ambiguity is a constant vector, fixed by (iv) at the phi-fixed base point (on the base class both lambda and rho satisfy (iii) and (iv), so they agree).
4. Multiplicativity: rho(L_u L_v) and rho(L_u) rho(L_v) have the same d, satisfy the same Frobenius equation and the same normalisation, so their difference is a vector of locally constant functions killed by the uniqueness part of L1/dwork-principle.
5. Uniqueness of rho: two realisations differ in the first depth where they differ by a locally constant family satisfying the homogeneous Frobenius equation, hence by a constant (L1/dwork-principle (a)), which (iv) forces to vanish.

*Acceptance.*

- For P^1 minus {0, 1, infinity} with phi(z) = z^p and the tangential base point: rho(L_(e_0)) = log_a z, rho(L_(e_1)) = log_a(1 - z), rho(L_(e_0 e_1)) = -Li_2.
- Numerical check at depth two (p = 3, 5, 7): the element H with phi^# L_(e_0 e_1) = p^2 L_(e_0 e_1) + p H satisfies rho(H)(z) = p Li_2^(p)(z), agreeing with Besser's measure formula at z = 2, 5, 8, 1/3 (p = 3) modulo 3^10, at z = 2, 3, 7, 1/5 (p = 5) modulo 5^7 and at z = 2, 3, 5 (p = 7) modulo 7^6 (PARI/GP).

*Uses.* `ColemanIntegration:L1/frobenius-h1-datum`, `ColemanIntegration:L1/dwork-principle`, `ColemanIntegration:L1/word-algebra-integrability`, `ColemanIntegration:L1/word-algebra-local-expansion`, `ColemanIntegration:L1/word-algebra-frobenius`, `ColemanIntegration:L1/locally-analytic-log-functions`, `ColemanIntegration:L0/disc-primitive-unique`, `ColemanIntegration:L0/annulus-log-primitive`.

*Sources.*

- Heidelberg lectures on Coleman integration, Theorem 2 and its proof, pp. 7-9: “there exists a unique K-linear integration map int : (Omega^1_{A+} (x) K)_{d=0} -> A_loc/K satisfying the following conditions: 1. The map d o int is the canonical map (Omega^1_{A+} (x) K)_{d=0} -> Omega^1_loc. 2. The map int o d is the canonical map A+_K -> A_loc/K. 3. One has phi o int = int o phi” The depth-one case; the induction runs the same argument at every depth.
- Coleman integration using the Tannakian formalism, Theorem 5.7, p. 18 (arXiv v1): “In the situation above there exists a ring isomorphism theta~ : A_Col(T) -> M(U) and an isomorphism theta~ : Omega^1_Col(T) -> W(U) compatible with the isomorphism on functions” Coleman's recursively constructed M(U) is identified with the functions of algebraic (unipotent) origin, which is what rho produces.
- Finite and p-adic polylogarithms, Section 2, proof of Proposition, p. 2 (arXiv v1): “According to [Col82], the function Li^(p)_n(z) can be computed as Li^(p)_n(z) = int_{Z_p^x} x^(-n) d mu_z(x), where mu_z is the measure on Z_p defined by mu_z(a + p^m Z_p) = z^a/(1 - z^(p^m))” The measure formula used for the numerical check of the depth-two realisation.

#### Theorem. Coleman's uniqueness principle

*Node* `ColemanIntegration:L1/coleman-uniqueness-principle`.

Let a datum on (X, D) be given and F in A_Col^a(Y). If F vanishes on a nonempty open subset of one residue disc ]x[ (x in Y_k(F_p-bar)), or its germ vanishes at one end, then F = 0. Consequently rho is injective, ker(d on A_Col) = C_p, and a locally constant Coleman function is constant.

*Hypotheses.* A datum satisfying (H0), (H1), (Hi); coefficients extended to C_p.

*Proof outline.*

1. Write F = rho(y), y = sum_w f_w L_w. By L1/word-algebra-local-expansion (iii), on ]x[ one has rho(L_w) = sum over w = u v of lambda_(x,b)(L_u) c_v with constants c_v and c_empty = 1; hence F restricted to ]x[ is sum_u g_u lambda_(x,b)(L_u) with g_u := sum_v c_v f_(u v), elements of A+(Y) (x) C_p.
2. F vanishes on all of ]x[ by the identity principle on discs (API eq_zero_of_eqOn of L0/disc-analytic-functions).
3. Local independence: if sum_v g_v lambda(L_v) = 0 on ]x[ with g_v in A+ (x) C_p, then all g_v = 0. Induction on the maximal length n: applying d gives sum_v (d g_v + sum_i g_(e_i v) omega_i) lambda(L_v) = 0; the top-length coefficients give d g_v = 0 on ]x[, hence d g_v = 0 in Omega+ by (Hi) and g_v constant by (H0); the next coefficients give sum_i g_(e_i v) omega_i = -d g_v on ]x[, hence in Omega+ by (Hi), so g_(e_i v) = 0 by (H1); descend.
4. The system g_u = sum_v c_v f_(u v) is unitriangular (c_empty = 1, and g_u - f_u involves only words longer than u), so descending in length all f_w = 0 and F = 0. At an end use lambda_e and the identity principle for Laurent germs.
5. Consequences: if dF = 0 then F is constant on the residue class of x, and F minus that constant vanishes there.

*Acceptance.*

- Two Coleman functions agreeing on one residue disc agree everywhere: Li_1(z) + log_a(1 - z) vanishes on D^-(0, 1) (the series), hence on all of U_1.
- Locally analytic functions do not satisfy the principle: the indicator of one residue disc is locally analytic, vanishes on the other discs and is nonzero.

*Uses.* `ColemanIntegration:L1/frobenius-h1-datum`, `ColemanIntegration:L1/word-algebra-local-expansion`, `ColemanIntegration:L1/coleman-realization`, `ColemanIntegration:L1/coleman-functions`, `ColemanIntegration:L0/disc-analytic-functions`.

*Planet:* Coleman's uniqueness principle.

*Sources.*

- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Proposition 2.4 (Uniqueness Principle), p. 8 (arXiv v2): “Let f in A^a_Col be a Coleman function which is defined on an admissible open subset U of X(C_p). Suppose that f|_U = 0. Then f = 0 on X(C_p).” The statement, attributed to Coleman Ch. IV.
- Heidelberg lectures on Coleman integration, Section 1.5.3, Proposition 7, p. 17: “Proposition 7. Suppose that the Coleman function F is 0 on one residue disc. Then it is identically 0.” The identity principle for one residue disc.
- Coleman integration using the Tannakian formalism, Corollary 4.13, p. 14 (arXiv v1): “The uniqueness principle holds for Coleman functions, i.e., if theta(f) vanishes on an open subset of ]X[_P, then f = 0 and therefore theta(f) vanishes identically.” Vanishing on an open subset of the tube forces vanishing.

#### Theorem. Coleman integration is characterised by Frobenius equivariance

*Node* `ColemanIntegration:L1/coleman-integration-characterisation`.

For a Frobenius-structured datum on (X, D) there is a unique K-linear map int : Omega+(Y) -> A_loc^a(Y)/K with (1) d o int equal to the inclusion Omega+ -> Omega_loc; (2) int o d equal to the canonical map A+ -> A_loc/K; (3) phi^* o int = int o phi^*. It is the depth-one part of L1/coleman-integral and does not depend on phi (L1/frobenius-lift-independence). At every depth n, int : Omega_Col,<=n -> A_Col,<=n+1 / K is likewise the unique K-linear map with d int = id, int d = id on A_Col,<=n and Frobenius equivariance (Coleman's recursion M_(i+1) = A . int(W_i)).

*Hypotheses.* A datum; a in C_p.

*Proof outline.*

1. Existence: L1/coleman-integral.
2. Uniqueness: two such maps differ by delta : Omega+ -> LC/K with delta(dg) = 0 and phi^* delta = delta phi^*; so delta factors through H^1_dR+ with delta(omega) a vector of locally constant functions modulo constants satisfying phi^* delta(omega) = M delta(omega) modulo constants.
3. By L1/dwork-principle (a) (T = M, hypothesis (Hw)) delta(omega) is constant, i.e. zero in LC/K.
4. Higher depth: the same argument with T = M^(tensor (n+1)) on the depth-(n+1) graded piece.

*Acceptance.*

- For P^1 minus {0, 1, infinity}, int dz/z = log_a z mod K is the only Frobenius-equivariant choice (Besser's overview example).

*Uses.* `ColemanIntegration:L1/frobenius-h1-datum`, `ColemanIntegration:L1/dwork-principle`, `ColemanIntegration:L1/coleman-integral`.

*Sources.*

- Heidelberg lectures on Coleman integration, Theorem 2, p. 7: “there exists a unique K-linear integration map int : (Omega^1_{A+} (x) K)_{d=0} -> A_loc/K satisfying the following conditions: 1. The map d o int is the canonical map (Omega^1_{A+} (x) K)_{d=0} -> Omega^1_loc. 2. The map int o d is the canonical map A+_K -> A_loc/K. 3. One has phi o int = int o phi” The characterisation, stated for Monsky-Washnitzer algebras over finite extensions of Q_p.
- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “The map int is characterized by three properties: 1. It is a primitive for the differential in the sense that dF_omega = omega. 2. It is Frobenius equivariant in the sense that int(phi^* omega) = phi^* int(omega). 3. If g in A(U), then F_dg = g + K.” Coleman's three properties.
- Heidelberg lectures on Coleman integration, Section 1.2, pp. 2-3: “we take the map phi : X -> X given by phi(x) = x^p . which is a lift of the p-power map. One notices immediately that phi^* omega = p omega.” The example phi(x) = x^p on the circle.

#### Lemma. Taylor expansion along two nearby Frobenius lifts

*Node* `ColemanIntegration:L1/taylor-homotopy`.

Let (X, D) be a good-reduction pair with Omega+(Y) = A+(Y) dt free on the differential of some t in A+(Y) (true for P^1 minus {0, infinity} and mu_N with t = z), and let phi, phi' be two Frobenius lifts for the same q. Write partial for the derivation of U defined by D = partial (x) dt. For y in U_(<= n) the series Y := sum_{k >= 0} ((phi'^* t - phi^* t)^k / k!) phi^#(partial^k y) converges in U_(<= n) (x) O(W_r') for some strict neighbourhood W_r' (coefficientwise in the Banach algebras O(W_r')), and for every z in ]Y_k[: rho(y)(phi'(z)) = rho(Y)(z), rho = rho^a_phi. In particular phi'^* maps A_Col^(a, phi) into itself.

*Hypotheses.* Omega+ = A+ dt; phi, phi' Frobenius lifts for the same q (so |phi'^* t - phi^* t| <= |pi| on the integral algebra).

*Proof outline.*

1. On a residue disc, rho(y)(phi'(z)) is the Taylor series of the analytic function rho(y) around phi(z), evaluated at the increment phi'(z) - phi(z) (L0/disc-analytic-functions, recentring); its terms are ((phi' - phi)^k/k!)(z) (partial^k rho(y))(phi(z)) = ((phi' - phi)^k/k!)(z) rho(phi^# partial^k y)(z) by L1/coleman-realization and d rho = rho D.
2. Convergence in U: partial^k (f L_w) is a sum of products of derivatives of f and of the coefficient functions omega_i/dt with shorter words; on W_r' the Cauchy estimates |partial^j h / j!|_(r') <= |h|_r / delta^j (delta = distance of the shrunken neighbourhood, Banach norms of AdicSpacesPartII:F1) and the bound |1/k| <= k (L0/ultrametric-natcast-bound) make the terms tend to 0 because |phi' - phi| <= |pi| < delta for r' close to 1.
3. Continuity of rho along the convergent series in O(W_r') (componentwise restriction is continuous) gives rho(Y)(z) = rho(y)(phi'(z)).

*Acceptance.*

- For y = L_(e_0) on P^1 minus {0, 1, infinity} and phi'(z) = zeta^(-1) z^p: Y = p L_(e_0) + log(zeta^(-1)) = p L_(e_0), consistent with log_a(zeta^(-1) z^p) = p log_a z.

*Uses.* `ColemanIntegration:L1/frobenius-lift`, `ColemanIntegration:L1/word-algebra`, `ColemanIntegration:L1/word-algebra-frobenius`, `ColemanIntegration:L1/coleman-realization`, `ColemanIntegration:L0/ultrametric-natcast-bound`, `ColemanIntegration:L0/disc-analytic-functions`, `AdicSpacesPartII:F1`.

*Sources.*

- Heidelberg lectures on Coleman integration, Section 1.3.2, Proposition 1, p. 5: “Any two maps A+ -> B+ with the same reduction induce homotopic maps Omega._{A+} (x) K -> Omega._{B+} (x) K” Two lifts with the same reduction are homotopic; the homotopy is the Taylor expansion.
- Heidelberg lectures on Coleman integration, Proof of Theorem 2, p. 9: “one can show that the function H(x, y) = int_x^y omega is in fact an analytic function in two variables on the space of pairs (x, y) reducing to the same point, and that then the function h may be taken to be the pullback of H via the map (phi, phi') (we do not give full details here).” Besser's sketch through the two-variable function H(x, y); this lemma supplies the details (ColemanIntegration/E5).

#### Theorem. Independence of the Frobenius lift

*Node* `ColemanIntegration:L1/frobenius-lift-independence`.

Let (phi, omega, M, g) and (phi', omega, M', g') be data on (X, D) that differ in the Frobenius lift (same q). Then (a) M' = M: the Frobenius on H^1_dR+ depends only on the q-power Frobenius of Y_k; (b) A_Col^(a, phi) = A_Col^(a, phi') as subalgebras of A_loc^a, and the Coleman integrals coincide modulo constants; with a common base point fixed by both lifts (for P^1 minus {0, infinity} and mu_N: the tangential base point at 0) the realisations coincide, rho_phi = rho_phi'; (c) replacing phi by phi^m does not change A_Col or int. Proved here when Omega+(Y) = A+(Y) dt (in particular for P^1 minus {0, infinity} and mu_N); for general good-reduction pairs (a) is imported from PadicDifferentialEquationsAndRigidCohomology:RD.4 and (b) remains a recorded gap.

*Hypotheses.* Omega+ = A+ dt for (b) as proved here; phi, phi' Frobenius lifts for the same q.

*Proof outline.*

1. (a) For eta = f dt: phi'^* eta - phi^* eta = d(sum_{k >= 1} ((phi'^* t - phi^* t)^k/k!) phi^*(partial^(k-1) f)), the series converging in A+ by the estimate of L1/taylor-homotopy; so the classes agree and M' = M.
2. (b) By L1/taylor-homotopy, phi'^* rho_phi(L_w) = rho_phi(Y_w) lies in A_Col^(a, phi). Show that rho_phi satisfies the phi'-Frobenius equation (iii) of L1/coleman-realization: by induction on depth, phi'^* rho_phi(L_w) - rho_phi(phi'^# L_w) is a Coleman function (for phi) with d = 0, hence a constant by L1/coleman-uniqueness-principle, and it vanishes at the common phi- and phi'-fixed base point.
3. Then rho_phi satisfies (i)-(iv) for phi', so rho_phi = rho_phi' by the uniqueness in L1/coleman-realization; images and integrals coincide.
4. (c) phi^m-equivariance follows from phi-equivariance, and uniqueness for phi^m gives equality.

*Acceptance.*

- For P^1 minus {0, 1, infinity} and phi'(z) = zeta^(-1) z^p (zeta a p-power root of unity), log_a(1 - z) realised with phi' equals the one realised with phi: both are the branch of the logarithm composed with 1 - z.
- The roadmap's L3 acceptance 'independence of auxiliary Frobenius lifts' is (b) for P^1 minus {0, 1, infinity}.

*Uses.* `ColemanIntegration:L1/coleman-realization`, `ColemanIntegration:L1/coleman-functions`, `ColemanIntegration:L1/coleman-uniqueness-principle`, `ColemanIntegration:L1/taylor-homotopy`, `ColemanIntegration:L1/frobenius-h1-datum`, `PadicDifferentialEquationsAndRigidCohomology:RD.4`.

*Planet:* Independence of the Frobenius lift.

*Sources.*

- Heidelberg lectures on Coleman integration, Theorem 2, p. 7: “In addition, the map is independent of the choice of phi.” The independence statement for single integrals.
- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “The entire theory turns out to be independent of the choice of phi.” Independence for Coleman's whole theory.
- Coleman integration using the Tannakian formalism, Proof of Corollary 3.2, p. 8 (arXiv v1): “Any two Frobenius endomorphisms have a common power so that it is sufficient to prove the result for a single Frobenius endomorphism.” Part (c): Frobenius endomorphisms with a common power.

#### Theorem. Pullback of Coleman functions

*Node* `ColemanIntegration:L1/coleman-pullback`.

Let (X', D') and (X, D) carry data (Frobenius lifts phi', phi, with q-powers q', q having a common power) and let f be a morphism of wide opens, i.e. a K-algebra map f^* : A+(Y) -> A+(Y') reducing to a morphism Y'_k -> Y_k and mapping ends to ends (for instance an O_K-morphism X' -> X with f(Y') in Y). Then pullback of locally analytic functions maps A_Col^a(Y) into A_Col^a(Y'), commutes with d, and int f^* eta = f^* int eta modulo constants. Proved here when Omega+(Y') = A+(Y') dt' (all genus-0 cases of L1/punctured-line); for general pairs it rests on the gap recorded for L1/frobenius-lift-independence. For L1/punctured-line this covers: the involutions z |-> 1/z and z |-> 1 - z of P^1 minus {0, 1, infinity}, the rotations z |-> zeta z (zeta in mu_N) of U_N, the maps z |-> zeta z for zeta a p-power root of unity (endomorphisms of the wide open of U_N reducing to the identity), the power maps z |-> z^m from U_(m) to U_1 for p not dividing m, and the inclusions U_N -> U_1.

*Hypotheses.* Data on both pairs; f as above; Omega+(Y') free on dt' for the proof given here.

*Proof outline.*

1. By induction on depth, G := f^* rho(L_w) satisfies dG = f^*(omega_i) f^* rho(L_w') in Omega_Col(Y') by the induction hypothesis, so G minus a Coleman primitive of dG is locally constant on Y'.
2. After replacing phi, phi' by powers with the same q, the maps f o phi' and phi o f are two lifts of the same morphism Y'_k -> Y_k; the Taylor expansion of L1/taylor-homotopy (along the two maps f o phi' and phi o f, which reduce to the same map) shows phi'^* G - f^* rho(phi^# L_w) is a Coleman function on Y' of lower depth.
3. Hence G satisfies a Frobenius equation phi'^* G = M^(tensor n) G + (Coleman functions of lower depth) on Y', and by L1/dwork-principle it equals the Coleman function with that equation and the same value at one point: G is Coleman.
4. Compatibility with int: both sides are primitives in A_Col(Y') of f^* eta.

*Acceptance.*

- Pulling back log_a z along z |-> 1/z gives -log_a z; along z |-> z^m gives m log_a z.
- Pulling back log_a(1 - z) along z |-> zeta z (zeta a p-power root of unity) gives log_a(1 - zeta z), a Coleman function on the wide open of P^1 minus {0, 1, infinity} whose differential has its pole zeta^(-1) inside the removed disc ]1[.

*Uses.* `ColemanIntegration:L1/coleman-functions`, `ColemanIntegration:L1/coleman-integral`, `ColemanIntegration:L1/taylor-homotopy`, `ColemanIntegration:L1/dwork-principle`, `ColemanIntegration:L1/frobenius-lift-independence`, `ColemanIntegration:L1/coleman-realization`.

*Sources.*

- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Proposition 2.5 (Functorial Property), p. 8 (arXiv v2): “Suppose that f : X' -> X is a morphism defined over O_Cp such that f(Y') in Y. Then the pull-back morphism f# : A^a_loc -> A'^a_loc induces the morphism f^* : A^a_Col -> A'^a_Col of rings of Coleman functions” Functoriality of Coleman functions along morphisms, attributed to Coleman's Theorem 5.11.
- Explicit Coleman integration for hyperelliptic curves, Section 2, Theorem 5 (c), p. 4 (arXiv v2): “(c) (Change of variables) Let X' be another curve over O, let W' be a wide open subspace of X', and let psi : W -> W' be any morphism of rigid spaces relative to an automorphism of C_p. Then mu_W'(psi(.), .) = mu_W(., psi^*(.)).” Change of variables for Coleman integrals.
- Coleman integration using the Tannakian formalism, Definition 4.7, p. 13 (arXiv v1): “Let f : T' -> T be a map of triples. Then there is a pullback functor f^* : A_abs(T, F) -> A_abs(T', f^* F) given by f^*(E, s, y) = (f^* E, f^* s, f^* y).” Pullback of Coleman functions along maps of triples.

#### Lemma. Branch independence principle

*Node* `ColemanIntegration:L1/branch-independence-principle`.

For a, b in C_p: the isomorphism iota_(a,b) : A_loc^a -> A_loc^b of L1/locally-analytic-log-functions maps A_Col^a onto A_Col^b and iota_(a,b) o int_(a) = int_(b) o tau_(a,b) modulo constants; in the direct construction rho^b = iota_(a,b) o rho^a. Consequently the values of Coleman functions at points of the tube ]Y_k[ do not depend on the branch (a branch-independent region); only the end components, realised with log_a(t_e), do.

*Hypotheses.* A datum; a, b in C_p.

*Proof outline.*

1. The equations (i)-(iv) of L1/coleman-realization involve the end components only through the formal symbols l_e: Frobenius acts by phi^* l_(F(e)) = q l_e + c_e + log(1 + h_e) with branch-independent c_e (L1/frobenius-lift), and the tangential normalisation takes constant terms of the formal expansion.
2. Hence iota_(a,b) o rho^a satisfies (i)-(iv) for b and equals rho^b by uniqueness; the statement on integrals follows.
3. On residue discs of Y_k, iota_(a,b) is the identity, so values there are branch independent; on ends the difference is given by L0/annulus-branch-change.

*Acceptance.*

- Li_k(zeta) for zeta a root of unity of order prime to p, zeta != 1, does not depend on the branch; Li_1 at a p-power root of unity zeta != 1 (a point of ]1[) is -log_a(1 - zeta) = -log_p(1 - zeta) - a v_p(1 - zeta), which does.

*Uses.* `ColemanIntegration:L1/locally-analytic-log-functions`, `ColemanIntegration:L1/coleman-realization`, `ColemanIntegration:L1/coleman-functions`, `ColemanIntegration:L1/frobenius-lift`, `ColemanIntegration:L0/annulus-branch-change`.

*Sources.*

- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Proposition 2.3 (Branch Independency Principle), p. 8 (arXiv v2): “Suppose that a, b in C_p. Then iota_{a,b}(A^a_Col) = A^b_Col, tau_{a,b}(A^a_Col (x) Omega+) = A^b_Col (x) Omega+ and iota_{a,b} o int_(a) = int_(b) o tau_{a,b} mod C_p . 1.” The statement.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Proof of Theorem 3.10, p. 17 (arXiv v2): “Since ]P^1_Fp - {0, 1, inf}[ is a branch independent region, the special value of G^a_0(u) at u = z0 actually does not depend on any choice of branch parameter a in C_p.” The tube of P^1 minus {0, 1, infinity} is a branch-independent region.

#### Lemma. Cohomological and analytic Frobenius pullback agree

*Node* `ColemanIntegration:L1/cohomological-analytic-pullback`.

Let a datum on (X, D) be given. (a) For g in A+(Y) and x in X_k(F_p-bar): res_x(phi^* g) = phi^*(res_(F(x)) g), i.e. pulling back functions on the wide open and pulling back their restrictions to residue discs agree. (b) For eta in Omega+(Y) and x, y in one residue disc: int_(phi(x))^(phi(y)) eta = int_x^y phi^* eta (tiny integrals). (c) The class of phi^* eta in H^1_dR+, which is the cohomological pullback, is M^T applied to the class of eta, and depends only on the Frobenius of Y_k (L1/frobenius-lift-independence (a)). Together these are the comparison between cohomological and local analytic pullback of the roadmap.

*Hypotheses.* A datum on (X, D).

*Proof outline.*

1. (a) Restriction to residue discs is compatible with composition with phi, which maps ]x[ into ]F(x)[ (L1/frobenius-lift).
2. (b) Both sides are values of disc primitives; the chain rule and L0/disc-primitive-unique give the equality.
3. (c) By definition of M and the H^1 coordinates (API of L1/frobenius-h1-datum).

*Acceptance.*

- For eta = dz/z and phi(z) = z^p: int_(x^p)^(y^p) dz/z = p int_x^y dz/z = p log(y/x).

*Uses.* `ColemanIntegration:L1/frobenius-lift`, `ColemanIntegration:L1/residue-disc-parametrisation`, `ColemanIntegration:L1/frobenius-h1-datum`, `ColemanIntegration:L0/disc-primitive-unique`.

*Sources.*

- Explicit Coleman integration for hyperelliptic curves, Section 3.3, Remark 13, p. 8 (arXiv v2): “By change of variables, int_{phi^m(P)}^{phi^m(Q)} omega_i = int_P^Q (phi^m)^* omega_i” Change of variables along Frobenius, the analytic side of the fundamental linear system.
- Heidelberg lectures on Coleman integration, Section 1.3.2, Proposition 1, p. 5: “Any two maps A+ -> B+ with the same reduction induce homotopic maps Omega._{A+} (x) K -> Omega._{B+} (x) K” The cohomological pullback depends only on the reduction.

#### Lemma. Mittag-Leffler decomposition on the punctured line

*Node* `ColemanIntegration:L1/punctured-line-mittag-leffler`.

Every f in A+(U_N) has a unique decomposition f = f_inf(z) + f_0(1/z) + sum_{zeta in mu_N} f_zeta(1/(z - zeta)) with f_inf in K_N[[T]] and f_0, f_zeta in T K_N[[T]], all restricted at some common rho > 1 (PowerSeries.IsRestricted); conversely every such sum lies in A+(U_N). The expansion on each residue disc and on each end is obtained by expanding the pieces, and (Hi) holds: an element vanishing on one residue disc of the tube, or as a germ at one end, is zero.

*Hypotheses.* p does not divide N.

*Proof outline.*

1. Partial fractions give the decomposition on O[z, z^(-1), (z^N - 1)^(-1)]; the Gauss norms of the pieces on the boundary circles of W_r define the Banach norm of O(W_r) (carrier of AdicSpacesPartII:F1), so the decomposition extends to the weak completion and is unique.
2. Expansions: on ]x[ each piece is analytic on a disc containing ]x[ (L0/disc-analytic-functions); on the end at zeta the pieces other than f_zeta are analytic near zeta and f_zeta(1/(z - zeta)) is a Laurent tail (L0/annulus-residue carrier).
3. (Hi): if f vanishes on a residue disc, its expansion around a point of the disc vanishes; the pieces are then determined by their singular parts at the removed discs, which vanish by uniqueness of the decomposition (each singular part is the principal part of the Laurent expansion on the corresponding end).

*Acceptance.*

- 1/(z(z - 1)) = 1/(z - 1) - 1/z, and log u = -sum_{n >= 1} s_n/(n (z - 1)^n) is a pure f_1-series (s_n the power sums of xi - 1 over xi in mu_p minus {1}).

*Uses.* `ColemanIntegration:L1/punctured-line`, `AdicSpacesPartII:F1`, `ColemanIntegration:L0/disc-analytic-functions`, `ColemanIntegration:L0/annulus-residue`, `mathlib:PowerSeries.IsRestricted`.

*Sources.*

- Explicit Coleman integration for hyperelliptic curves, Section 3, Definition 7, p. 5 (arXiv v2): “The Monsky-Washnitzer (MW) weak completion of A is the ring A+ consisting of infinite sums of the form {sum_{i=-inf}^{inf} B_i(x)/y^i, B_i(x) in K[x], deg B_i <= 2g}, further subject to the condition that v_p(B_i(x)) grows faster than a linear function of i as i -> +-inf.” The weak completion as infinite sums of simple elements with overconvergence conditions; for the punctured line these are the Mittag-Leffler pieces.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Section 2.1, p. 7 (arXiv v2): “U_r stands for the rigid analytic space obtained by removing all closed discs of radius r around e_i from X(C_p) (1 <= i <= s)” The wide opens U_r of P^1 from which the pieces are read.

#### Theorem. The de Rham cohomology of the punctured line

*Node* `ColemanIntegration:L1/punctured-line-de-rham-h1`.

For U_N: (H0) ker(d : A+(U_N) -> Omega+(U_N)) = K_N; (H1) every eta = f dz in Omega+(U_N) = A+(U_N) dz can be written uniquely as eta = dh + c_0 dz/z + sum_{zeta in mu_N} c_zeta dz/(z - zeta), with h in A+(U_N) unique up to K_N, c_0 = res_0(eta) (residue at the end 0 in the coordinate z) and c_zeta = res_zeta(eta) (coordinate z - zeta). Thus H^1_dR+(U_N) has basis dz/z, dz/(z - zeta): dimension N + 1 = 2g + #D - 1 with g = 0 and #D = N + 2.

*Hypotheses.* p does not divide N.

*Proof outline.*

1. Decompose f by L1/punctured-line-mittag-leffler.
2. f_inf(z) dz has an overconvergent primitive (L0/formal-primitive-radius (c)).
3. f_0(1/z) dz = sum_{n >= 1} b_n z^(-n) dz: the term n = 1 is b_1 dz/z; for n >= 2, z^(-n) dz = d(z^(1-n)/(1-n)) and the coefficients b_n/(n - 1) are overconvergent in 1/z by L0/ultrametric-natcast-bound as in L0/formal-primitive-radius (b). The same at each zeta with z - zeta.
4. Uniqueness of the c's: residues at the ends vanish on exact forms (L0/annulus-exact-iff-residue-zero) and res_0(dz/z) = 1, res_zeta(dz/(z - zeta')) = delta; (H0): if dh = 0 each Mittag-Leffler piece is constant, so the polar pieces vanish (characteristic zero).

*Acceptance.*

- dz/z^2 is exact; dz/(z(z - 1)) = dz/(z - 1) - dz/z; the residue at infinity of eta is -(c_0 + sum c_zeta).
- For g_1 = log u, u = (z^p - 1)/(z - 1)^p: res_0(g_1 dz/z) = g_1(0) = 0 and res_1(g_1 dz/z) = 0 (PARI/GP to O(p^40) for p = 3, 5, 7), so g_1 dz/z is exact in A+(U_1).

*Uses.* `ColemanIntegration:L1/punctured-line`, `ColemanIntegration:L1/punctured-line-mittag-leffler`, `ColemanIntegration:L0/formal-primitive-radius`, `ColemanIntegration:L0/ultrametric-natcast-bound`, `ColemanIntegration:L0/annulus-residue`, `ColemanIntegration:L0/annulus-exact-iff-residue-zero`.

*Sources.*

- Coleman integration using the Tannakian formalism, Section 5, p. 18 (arXiv v1): “The differential d:A(U_x) -> Omega^1(U_x) is surjective when U_x is a disc. On the other hand, when U_x is an annulus there is no integral to dz/z.” dz/z and dz/(z - zeta) carry the residues at the ends, which are the H^1 coordinates.
- Explicit Coleman integration for hyperelliptic curves, Section 3.1, p. 6 (arXiv v2): “That is, the omega_i form a basis of the odd part of the de Rham cohomology of A+.” The analogue for hyperelliptic curves: a basis of de Rham cohomology of the weak completion by explicit forms.

#### Lemma. The Frobenius z |-> z^p on the punctured line

*Node* `ColemanIntegration:L1/punctured-line-frobenius`.

phi(z) = z^p is a Frobenius lift on U_N (L1/frobenius-lift): it maps A+(U_N) into itself. For the forms: phi^*(dz/z) = p dz/z, and for zeta in mu_N, with eta_0 the unique element of mu_N with eta_0^p = zeta, phi^*(dz/(z - zeta)) = p dz/(z - eta_0) + d log u_zeta, where u_zeta(z) = (z^p - zeta)/(z - eta_0)^p = product over xi in mu_p of (z - xi eta_0)/(z - eta_0), and log u_zeta lies in A+(U_N): it converges on {|z - eta_0| > p^(-1/p)} because z^p - zeta - (z - eta_0)^p lies in p O[z], so |u_zeta - 1| <= |p|/|z - eta_0|^p there (and |u_zeta - 1| <= |p|/|z| for |z| > 1). For N = 1: phi^*(dz/(z - 1)) = p dz/(z - 1) + d log u with u = (z^p - 1)/(z - 1)^p and log u(0) = 0.

*Hypotheses.* p does not divide N.

*Proof outline.*

1. 1/z^p and 1/(z^(pN) - 1) lie in A+(U_N): z^(pN) - 1 = (z^N - 1)^p (1 + p w) with w overconvergent on W_r, inverted by the geometric series.
2. z^p - zeta = product over the p-th roots of zeta, which are xi eta_0 with xi in mu_p, all in the residue disc of eta_0 (p does not divide N); take the logarithmic derivative.
3. The estimate: (z - eta_0)^p is congruent to z^p - eta_0^p = z^p - zeta modulo p O[z]; then L0/log-one-add-convergence gives log u_zeta.
4. u(0) = (-1)/(-1)^p = 1 for p odd and u(0) = -1 for p = 2, whose logarithm is 0 (L0/log-one-add-mul).

*Acceptance.*

- z^p - 1 - (z - 1)^p has content exactly p for p <= 13 (PARI/GP).
- phi fixes 0 and infinity, with phi^* t_0 = t_0^p, so the tangential base point at 0 is phi-fixed.

*Uses.* `ColemanIntegration:L1/punctured-line`, `ColemanIntegration:L1/punctured-line-mittag-leffler`, `ColemanIntegration:L1/punctured-line-de-rham-h1`, `ColemanIntegration:L1/frobenius-lift`, `ColemanIntegration:L0/log-one-add-convergence`, `ColemanIntegration:L0/log-one-add-mul`.

*Sources.*

- Heidelberg lectures on Coleman integration, Section 1.2, pp. 2-3: “we take the map phi : X -> X given by phi(x) = x^p . which is a lift of the p-power map. One notices immediately that phi^* omega = p omega.” phi(x) = x^p and phi^* (dz/z) = p dz/z.
- Explicit Coleman integration for hyperelliptic curves, Section 3.3, Algorithm 10, step 1, p. 7 (arXiv v2): “Since K is an unramified extension of Q_p, it carries a unique automorphism phi_K lifting the Frobenius automorphism x |-> x^p on its residue field. Extend phi_K to a Frobenius lift on A+ by setting phi(x) = x^p,” phi(x) = x^p as the Frobenius lift on the x-line.

#### Theorem. The Frobenius datum of the punctured line

*Node* `ColemanIntegration:L1/punctured-line-datum`.

(A+(U_N), omega = (dz/z, (dz/(z - zeta))_(zeta in mu_N)), phi(z) = z^p, M, g) is a Frobenius-structured datum (L1/frobenius-h1-datum) with M = p (1 (+) P), P the permutation matrix of zeta |-> zeta^(1/p) on mu_N, and g = (0, (log u_zeta)_zeta) from L1/punctured-line-frobenius. (H0), (H1) hold by L1/punctured-line-de-rham-h1, (Hi) by L1/punctured-line-mittag-leffler, and (Hw) holds because every eigenvalue of M is p times a root of unity, so every product of n >= 1 eigenvalues has absolute value p^n != 1 (no weight theory is needed). The points 0 and infinity are phi-fixed ends with phi^* t = t^p, and the Teichmueller points are the roots of unity of order prime to p outside mu_N. Consequently L1/coleman-realization, L1/coleman-functions, L1/coleman-integral, L1/coleman-uniqueness-principle, L1/frobenius-lift-independence and L1/coleman-pullback hold for U_N without further input.

*Hypotheses.* p does not divide N.

*Proof outline.*

1. Assemble L1/punctured-line-de-rham-h1, L1/punctured-line-mittag-leffler and L1/punctured-line-frobenius.
2. (Hw): eigenvalues of M^(tensor n) are p^n times roots of unity; their m-th powers have absolute value p^(n m) != 1 in C and in C_p.

*Acceptance.*

- For N = 1: M = p I_2 and g = (0, log u).

*Uses.* `ColemanIntegration:L1/frobenius-h1-datum`, `ColemanIntegration:L1/punctured-line`, `ColemanIntegration:L1/punctured-line-mittag-leffler`, `ColemanIntegration:L1/punctured-line-de-rham-h1`, `ColemanIntegration:L1/punctured-line-frobenius`.

*Sources.*

- Heidelberg lectures on Coleman integration, Section 1.2, p. 3: “Suppose now that alpha satisfies the relation alpha^(p^k) = alpha. Then we immediately obtain F_omega(alpha) = F_omega(alpha^(p^k)) = p^k F_omega(alpha) => F_omega(alpha) = 0.” The Frobenius equation with eigenvalue p fixes the constants at Teichmueller points.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Section 2.2, p. 9 (arXiv v2): “we fix a branch parameter a in C_p and employ Coleman's p-adic integration theory attached to this branch parameter a in C_p for X = P^1_{O_Cp} and Y = Spec O_Cp[t, 1/t, 1/(1-t)].” Coleman's theory applied to P^1 minus {0, 1, infinity}.

#### Lemma. Expansions on the removed residue discs

*Node* `ColemanIntegration:L1/punctured-line-singular-disc-expansion`.

Let U_alg be the subalgebra of U(U_N) with coefficients in the regular functions K_N[z, z^(-1), (z^N - 1)^(-1)] (functions of algebraic origin). For y in U_alg and s in {0, infinity} u mu_N, the end germ lambda_s(y) extends to the whole punctured residue disc: it lies in O(D^-(s, 1) minus {s})[l_s] with only finitely many negative powers of t_s; hence rho(y) extends to a locally analytic function on ]s[ minus {s} and can be evaluated there. In particular Li_k restricted to ]1[ lies in O(]1[)[log_a(z - 1)] and can be evaluated at the p-power roots of unity different from 1, and L_w is analytic at 0 with value 0 when the last letter of w is not e_0.

*Hypotheses.* p does not divide N; y of algebraic origin.

*Proof outline.*

1. On ]s[ the forms dz/z and dz/(z - zeta) and the coefficients have singularities only at s, since the other points of D_N lie in other residue discs.
2. Solve the local system on the punctured disc A(s; 0, 1) with L0/annulus-log-primitive (applied to the maximal annulus 0 < |t_s| < 1) with constant-term normalisation; by uniqueness its restriction to the end is lambda_s(y) (L1/word-algebra-local-expansion (ii)).
3. For words ending with a letter other than e_0 the innermost integral is of a form regular at 0, so no logarithm at 0 arises.

*Acceptance.*

- Li_1(zeta) = -log_a(1 - zeta) for zeta a primitive p-th root of unity: 1 - zeta has valuation 1/(p - 1), so the value depends on the branch (L1/branch-independence-principle).

*Uses.* `ColemanIntegration:L1/punctured-line-coleman-functions`, `ColemanIntegration:L1/word-algebra-local-expansion`, `ColemanIntegration:L0/annulus-log-primitive`, `ColemanIntegration:L0/annulus-log-ring`.

*Sources.*

- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Proposition 2.11, p. 10 (arXiv v2): “Li^a_{k1,...,km}(t)|_{]0[} in A(]0[), Li^a_{k1,...,km}(t)|_{]1[} in A(]1[)[log^a(t - 1)] and Li^a_{k1,...,km}(t)|_{]inf[} in A(]inf[)[log^a(1/t)].” The expansions of p-adic multiple polylogarithms on ]0[, ]1[ and ]infinity[.
- An introduction to p-adic L-functions, Remark 6.6, p. 39 (arXiv v2): “Coleman constructed p-adic analogues Li_{k,p}(z), which are locally analytic functions on C_p minus {1}, and showed:” Coleman's Li_(k,p) are locally analytic on C_p minus {1}, including the disc of 1 minus the point 1.

### What is missing

- Coverage status: `partial`. Complete for P^1 minus {0, infinity} and mu_N (p not dividing N), in particular P^1 minus {0, 1, infinity}: dagger algebra (carrier requested from AdicSpacesPartII:F1), Mittag-Leffler decomposition, H^1 with basis dz/z, dz/(z - zeta), Frobenius z |-> z^p with eigenvalue p, the unipotent word algebra (successive extensions), local expansions, Frobenius on the word algebra, realisation by Dwork's principle, Coleman functions with products, d, integration, uniqueness principle, independence of the Frobenius lift, pullback along the needed morphisms, branch independence, tangential base point. Stated for general good-reduction curves with the exact hypotheses: the same construction with the H^1 input imported from RD.0, RD.4, RD.5, RD.6 and AdicSpacesPartII:F1/R2.
- Gap 'Algebraic de Rham comparison for good-reduction affine curves' (algebraic basis and dimension of H^1 for general pairs).
- Gap 'Independence of the Frobenius lift and functoriality when Omega+ is not free' (general pairs).
- Requests to AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicDifferentialEquationsAndRigidCohomology:RD.0, RD.4, RD.5, RD.6 for the general-curve inputs.
- **Gap: Algebraic de Rham comparison for good-reduction affine curves.** For (X, D) a good-reduction pair over O_K, the comparison of H^1 of the overconvergent de Rham complex of A+(Y) with the algebraic de Rham cohomology H^1_dR(Y_K), giving a basis of algebraic differentials and the dimension 2g + #D(K-bar) - 1. No stage text in scope of the requests states it (RD.4-RD.5 treat rigid cohomology and its finiteness; RD.7 the crystalline comparison for proper varieties). Its role: explicit bases of H^1 by algebraic forms, as used by Balakrishnan-Bradshaw-Kedlaya (Section 3.1, for hyperelliptic curves) and by ED.4. For P^1 minus {0, infinity} and mu_N it is proved here (L1/punctured-line-de-rham-h1). NEXT ACTION: add a node in this layer proving the comparison for curves by the reduction algorithm (pole-order reduction along D and a dimension count with Riemann-Roch on X_K), sourced from Kedlaya's 'Counting points on hyperelliptic curves using Monsky-Washnitzer cohomology' (arXiv:math/0105031, Section 3) and Baldassarri-Chiarellotto, or request it from PadicDifferentialEquationsAndRigidCohomology:RD.4. Needed by `ColemanIntegration:L1/good-reduction-datum-exists`.
- **Gap: Independence of the Frobenius lift and functoriality when Omega+ is not free.** The proofs of L1/taylor-homotopy, L1/frobenius-lift-independence (b) and L1/coleman-pullback given here use a global coordinate t with Omega+(Y) = A+(Y) dt, which holds for every genus-0 pair of L1/punctured-line but not for general good-reduction pairs. The published proofs are Coleman's (Dilogarithms 1982; Coleman-de Shalit 1988), which are not public, Besser's sketch (Heidelberg lectures, proof of Theorem 2, 'we do not give full details here', ColemanIntegration/E5), and Besser's Tannakian argument (Math. Ann. 2002, Section 3, Corollary 3.2), which needs the unipotent fundamental group. NEXT ACTION: cover Y by affine opens Y_j on which Omega is free, prove the sheaf property of Coleman functions for the Zariski topology of Y_k in the direct construction (Besser, Tannakian formalism, Proposition 4.21) and glue the local Taylor homotopies; add these as nodes of this layer. Needed by `ColemanIntegration:L1/frobenius-lift-independence`, `ColemanIntegration:L1/coleman-pullback`.
- **Request to `AdicSpacesPartII:F1`.** For a smooth finitely generated O_K-algebra R with smooth compactification (in particular O[z, z^(-1), (z^N - 1)^(-1)] and the coordinate ring of the affine part Y of a good-reduction pair): its weak (Monsky-Washnitzer) completion R+, A+ = R+ (x) K, the identification of A+ with colim_r O(W_r) over the strict neighbourhoods W_r of the tube, the Banach norms of O(W_r) with Cauchy estimates for derivatives on shrunken neighbourhoods, the module of continuous differentials Omega+ with its derivation, noetherianity, and the identity principle (an element of O(W_r) or of Omega^1(W_r) vanishing on a residue disc of the tube vanishes, W_r being connected). Needed by `ColemanIntegration:L1/wide-open-neighbourhood`, `ColemanIntegration:L1/frobenius-lift`, `ColemanIntegration:L1/punctured-line`, `ColemanIntegration:L1/punctured-line-mittag-leffler`, `ColemanIntegration:L1/taylor-homotopy`, `ColemanIntegration:L1/good-reduction-datum-exists`.
- **Request to `AdicSpacesPartII:R2`.** For a smooth proper curve X over O_K (K finite over Q_p): the rigid (adic) generic fibre X_an of the formal completion, equal to the analytification of X_K, its specialisation map to X_k, residue discs ]x[, and the isomorphism of ]x[ with the open unit disc given by a local parameter at x (formal fibre of a smooth point). Needed by `ColemanIntegration:L1/wide-open-neighbourhood`, `ColemanIntegration:L1/residue-disc-parametrisation`.
- **Request to `PadicDifferentialEquationsAndRigidCohomology:RD.0`.** Existence of Frobenius lifts: for the weak completion S of a smooth finitely generated O_K-algebra (K finite over Q_p, residue field F_q), a K-algebra endomorphism phi of S (x) K preserving S with phi(x) - x^q in pi S for all x (van der Put's lifting theorem); and that two such lifts are homotopic (induce homotopic maps of overconvergent de Rham complexes). Needed by `ColemanIntegration:L1/frobenius-lift`, `ColemanIntegration:L1/good-reduction-datum-exists`.
- **Request to `PadicDifferentialEquationsAndRigidCohomology:RD.4`.** For a smooth affine curve Y_k over F_q with a smooth lift: H^1 of the overconvergent de Rham complex of its dagger algebra equals H^1_rig(Y_k/K), and the Frobenius endomorphism of H^1_rig induced by a Frobenius lift does not depend on the lift. Needed by `ColemanIntegration:L1/good-reduction-datum-exists`, `ColemanIntegration:L1/frobenius-lift-independence`.
- **Request to `PadicDifferentialEquationsAndRigidCohomology:RD.5`.** Finite dimensionality of H^1_rig(Y_k/K) for a smooth affine curve Y_k over F_q (constant coefficients). Needed by `ColemanIntegration:L1/good-reduction-datum-exists`.
- **Request to `PadicDifferentialEquationsAndRigidCohomology:RD.6`.** For a smooth affine curve Y_k = X_k - D_k over F_q with smooth compactification X_k: the eigenvalues of the F_q-linear Frobenius on H^1_rig(Y_k/K) are Weil q-numbers of weights 1 and 2 (weight 1 on the image of H^1_rig(X_k), weight 2 on the residue part K(-1)^(D)), in particular none is a root of unity. Needed by `ColemanIntegration:L1/good-reduction-datum-exists`.

## L2 Polylogarithms

$\mathrm{Li}^a_k$ is the unique Coleman function on $\mathbb P^1\smallsetminus\{0,1,\infty\}$ with $\mathrm{Li}_1 = -\log_a(1-z)$, $d\,\mathrm{Li}_k = \mathrm{Li}_{k-1}\,dz/z$ and no logarithmic term at $0$ (the tangential normalisation). It is continued to the punctured residue discs of $1$ and $\infty$, and for $k\ge 2$ defined at $1$ by the limit $\zeta_p(k)$. The layer proves:

- the distribution, inversion and Frobenius relations, and the explicit dependence on the branch;
- Galois equivariance;
- the values at roots of unity. At tame roots they lie in $p^k\mathbb Z_p[\zeta]$ and satisfy Besser's congruence. At $p$-power roots they are given by the analytic function $\lambda_k$ on the disc of $1$;
- the expansion at a root of unity that L3 uses;
- the dilogarithm identities that PadicHodgeRegulators D.1 and HabiroNahmSeries consume: reflection, the function $D_p$, and the five-term relation.

An explicit non-example shows that antiderivatives on each residue disc do not determine $\mathrm{Li}_k$. An elementary characterisation by four conditions, which uses no Coleman theory, is the definition the suggested Lean file uses.

### Objects

#### Definition. The polylogarithm power series on the open unit disc of C_p

*Module* `TauCeti/NumberTheory/Padics/Polylogarithm.lean`. *Node* `ColemanIntegration:L2/polylogarithm-power-series`.

For k ∈ Z let Li_k^ser(z) := Σ_{n≥1} z^n/n^k be the power series with rational coefficients of Polylogarithms P.1 (the formal series polylogSeries k ∈ Q[[X]] of P.1/classical-polylogarithm), read in C_p[[z]]. Its radius of convergence over C_p is exactly 1, so it defines an analytic function Li_k^ser : D⁻(0,1) → C_p on the open unit disc, given there by the convergent sum. It satisfies Li_k^ser(0) = 0; z·(d/dz)Li_k^ser = Li_{k−1}^ser on D⁻(0,1) (and (d/dz)Li_k^ser(0) = 1); Li_0^ser(z) = z/(1−z); Li_1^ser(z) = −log(1−z), where log(1+x) = Σ_{n≥1}(−1)^{n−1}x^n/n is the p-adic logarithm series on 1 + m_{C_p}, so Li_1^ser(z) = −log_a(1−z) for every branch a; for k ≤ 0 it is the rational function (z d/dz)^{−k}(z/(1−z)). Since the coefficients are rational, Li_k^ser maps D⁻(0,1) ∩ K into K for every complete subfield K ⊂ C_p, and σ(Li_k^ser(z)) = Li_k^ser(σ z) for every continuous field automorphism σ of C_p. The series does not converge at any z with |z| = 1.

*Hypotheses.* k ∈ Z; p any prime; C_p with |p| = 1/p. The analytic function is defined on the open disc |z| < 1 only; no continuation is part of this definition.

*API.*

- `polylogSer` (*data*) — polylogSer p k : ℂ_[p] → ℂ_[p], z ↦ Σ'_{n≥1} z^n/n^k; this is Li_k^ser(z) for |z| < 1 (and the junk value 0 of the unconditional sum elsewhere).
- `polylogSer_hasFPowerSeriesOnBall` (*characterisation*) — polylogSer p k has the power series Σ_{n≥1} n^{−k}X^n at 0 on the ball of radius 1.
- `radius_polylogSeries` (*other*) — The radius of convergence over ℂ_[p] of Σ_{n≥1} z^n/n^k is exactly 1, for every k ∈ Z.
- `polylogSer_zero` (*simp*) — polylogSer p k 0 = 0.
- `polylogSer_zero_index` (*simp*) — For |z| < 1, polylogSer p 0 z = z/(1 − z).
- `polylogSer_hasDerivAt` (*relation*) — For |z| < 1: HasDerivAt (polylogSer p (k+1)) (polylogSer p k z / z) z when z ≠ 0, and HasDerivAt (polylogSer p (k+1)) 1 0.
- `polylogSer_one_eq_neg_logOneAdd` (*compatibility*) — For |z| < 1, polylogSer p 1 z = −NormedSpace.logOneAdd ℂ_[p] ℂ_[p] (−z) (Tau Ceti's series logarithm).
- `polylogSer_eq_eval_polylogSeries` (*compatibility*) — The coefficients of polylogSer are the images in ℂ_[p] of the rational coefficients of Polylogarithms P.1's polylogSeries k.
- `polylogSer_mem_of_mem` (*other*) — If K ⊂ ℂ_[p] is a closed subfield, z ∈ K and |z| < 1, then polylogSer p k z ∈ K.
- `polylogSer_map` (*functoriality*) — For a continuous ring automorphism σ of ℂ_[p] and |z| < 1, σ(polylogSer p k z) = polylogSer p k (σ z).

*Used by.*

- `ColemanIntegration:L2/existence-and-uniqueness-of-coleman-polylogarithms` — the normalisation of Li_k on the residue disc of 0
- `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs` — Li_k on the residue disc of ∞ is (−1)^{k+1}Li_k^ser(1/z) − log_a^k(z)/k!, and λ_2(z) = −Li_2^ser(1 − z) on the residue disc of 1
- RJW Remark 6.6, p. 40 — the series Li_s(z) = Σ z^n/n^s whose p-adic continuation Li_{k,p} enters Theorem 6.7
- Furusho, Remark 2.10(1), p. 9 — the p-adic MPL restricts to the series on |z|_p < 1
- HabiroNahmSeries HB.9 (via HabiroNumberFields HB.7) — formal Li_n^{(p)} and Li_2 series specialised at units

*Unit tests.* A wrong definition fails one of these.

- `polylogSer_zero_index_apply_p` (computation) — polylogSer p 0 (p : ℂ_[p]) = p/(1 − p).
- `polylogSer_two_apply_p` (computation) — For p ≥ 5: ‖polylogSer p 2 (p : ℂ_[p]) − p‖ = p^{−2}.
- `polylogSer_apply_zero` (degenerate) — polylogSer p k 0 = 0 for every k ∈ Z.
- `not_summable_polylogSer_one_add_p` (non-example) — For k ≥ 0 the family n ↦ (1 + p)^n / n^k is not summable in ℂ_[p]: the series gives no value on the residue disc of 1.
- `polylogSer_one_eq_neg_logOneAdd_test` (compatibility) — For |z| < 1: polylogSer p 1 z = −NormedSpace.logOneAdd ℂ_[p] ℂ_[p] (−z).

*Construction.*

1. Radius: for k ≥ 0, |1/n^k|_p = p^{k·v_p(n)} ≤ n^k, and for k < 0, |n^{−k}|_p ≤ 1, so Σ |z|^n |n^{−k}|_p converges for |z| < 1 and the radius is at least 1 (mathlib:FormalMultilinearSeries.radius). At |z| = 1 the terms have |z^n/n^k|_p ≥ 1 for all n prime to p, so they do not tend to 0 and the radius is exactly 1.
2. A power series with positive radius r is the power series expansion of its sum on the ball of radius r (mathlib:HasFPowerSeriesOnBall), so Li_k^ser is analytic on D⁻(0,1).
3. Termwise differentiation does not change the radius: z·(d/dz)Σ z^n/n^k = Σ z^n/n^{k−1}.
4. Li_0^ser = Σ_{n≥1} z^n = z/(1−z) on D⁻(0,1); Li_1^ser = Σ z^n/n = −log(1−z) by the definition of the logarithm series, and log_a restricted to 1 + m_{C_p} is that series (ColemanIntegration:L0/log-branch).
5. The coefficients lie in Q ⊂ K and a closed subfield is closed under convergent sums; a continuous automorphism σ fixes Q and commutes with limits.

*Acceptance.*

- For p ≥ 5, Li_2^ser(p) = p + p^2/4 + p^3/9 + ⋯ satisfies |Li_2^ser(p) − p|_p = p^{−2}.
- At z = 1 + p the terms (1+p)^n/n^2 have |·|_p = p^{2j} at n = p^j, so the series diverges there: Li_2 on the residue disc of 1 is not given by this series.

*Uses.* `Polylogarithms:P.1/classical-polylogarithm`, `ColemanIntegration:L0/log-branch`, `mathlib:PadicComplex`, `mathlib:FormalMultilinearSeries.radius`, `mathlib:HasFPowerSeriesOnBall`, `mathlib:PowerSeries`, `tauceti:NormedSpace.logOneAdd`, `tauceti:NormedSpace.logOneAdd_eq_tsum`.

*Sources.*

- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, §2.2, (2.1), Lemma 2.7 and Lemma 2.8, p. 9 (arXiv v2): “Lemma 2.7. This series Li_{k1,···,km}(z) converges on the open unit disk D(0 : 1) = {z ∈ C_p | |z|_p < 1} around 0 with radius 1.” The series and its radius (the case m = 1 is Li_k^ser); Lemma 2.8 is the derivative formula d/dz Li_k = Li_{k−1}/z.
- The syntomic regulator for the K-theory of fields, §1, p. 869 (Ann. Sci. ENS 36 (2003)); p. 3 of arXiv v2: “It is shown in [11] that those functions are locally analytic in the naive topology on C_p, and that Li_n(z) is given by a convergent power series Σ_{k=1}^∞ z^k/k^n on the open unit disc in C_p.” The series as the restriction of Coleman's Li_n to the open unit disc.
- p-adic polylogarithms and p-adic Hecke L-functions for totally real fields, §1, (1.1), p. 1 (arXiv v2): “The classical polylogarithm functions Li_k(t) for integers k ≥ 0 are complex holomorphic functions defined by the convergent power series Li_k(t) := Σ_{n=1}^∞ t^n/n^k, |t| < 1.” The same series; its p-adic reading is the definition here.

#### Definition. Coleman's p-adic polylogarithm Li_k^a

*Module* `TauCeti/NumberTheory/Padics/Polylogarithm.lean`. *Node* `ColemanIntegration:L2/p-adic-polylogarithm`.

Let a ∈ C_p be a branch parameter (log_a(p) = a). Define Li^a_k : C_p ∖ {1} → C_p for k ≥ 0 by: Li^a_0(z) = z/(1 − z); for k ≥ 1, Li^a_k(z) = Li_k^ser(z) for |z| < 1 (in particular Li^a_k(0) = 0), and for z ∈ C_p ∖ {0, 1} the value at z of the Coleman function Li^a_k of ColemanIntegration:L2/existence-and-uniqueness-of-coleman-polylogarithms, continued to the whole punctured residue discs of 1 and ∞ by ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs. For k ≥ 2 put moreover Li^a_k(1) := λ_k(1) =: ζ_p(k), the p-adic zeta value (independent of a), which is the limit of Li^a_k(z) as z → 1 inside finitely ramified extensions of Q_p (ColemanIntegration:L2/value-at-one). The Iwasawa branch a = 0 gives Li_k := Li^0_k, the function written Li_{k,p} in RJW Theorem 6.7 and Li_k in Coleman's formula. The modified polylogarithm is Li^{(p),a}_k(z) := Li^a_k(z) − p^{−k}·Li^a_k(z^p) for z ∈ C_p with z^p ≠ 1 (for all z ≠ 1 when k ≥ 2); it is independent of a on {|z − 1| > p^{−1/(p−1)}} (ColemanIntegration:L2/frobenius-relation).

*Hypotheses.* p any prime; a ∈ C_p; k ≥ 0. At z = 1 the value is not defined for k ≤ 1 (Li^a_0 has a pole and Li^a_1 = −log_a(1 − z) a logarithmic singularity). Coleman functions and their continuation to the punctured discs are those of the two preceding nodes.

*API.*

- `padicPolylog` (*data*) — padicPolylog p a k : ℂ_[p] → ℂ_[p]; Li^a_k on ℂ_[p] ∖ {1}, with Li^a_k(1) = ζ_p(k) for k ≥ 2 and junk value 0 at 1 for k ≤ 1.
- `padicPolylog_zero_index` (*simp*) — padicPolylog p a 0 z = z/(1 − z) for z ≠ 1.
- `padicPolylog_one_index` (*characterisation*) — padicPolylog p a 1 z = −log_a(1 − z) for z ≠ 1.
- `padicPolylog_apply_zero` (*simp*) — padicPolylog p a k 0 = 0.
- `padicPolylog_eq_polylogSer` (*compatibility*) — For |z| < 1, padicPolylog p a k z = polylogSer p k z.
- `padicPolylog_analyticAt` (*other*) — For z ≠ 1 (and k ≥ 0), padicPolylog p a k is analytic at z (locally analytic on ℂ_[p] ∖ {1}).
- `padicPolylog_isColeman` (*characterisation*) — On U(ℂ_[p]) = ℂ_[p] ∖ {0,1}, padicPolylog p a k is the Coleman function Li^a_k of the existence theorem (stated against ColemanIntegration L1's ring of Coleman functions).
- `padicPolylog_one` (*other*) — For k ≥ 2, padicPolylog p a k 1 = padicZeta p k := λ_k(1), independent of a.
- `padicModPolylog` (*data*) — padicModPolylog p a k z := padicPolylog p a k z − p^{−k}·padicPolylog p a k (z^p).
- `padicPolylog_hasDerivAt` (*relation*) — z·(Li^a_k)'(z) = Li^a_{k−1}(z); promoted to ColemanIntegration:L2/differential-recursion.
- `padicPolylog_distribution` (*relation*) — Σ_{ζ^m=1} Li^a_k(ζz) = m^{1−k}Li^a_k(z^m); promoted to ColemanIntegration:L2/distribution-relation.
- `padicPolylog_inversion` (*relation*) — Li^a_k(z) + (−1)^k Li^a_k(1/z) = −log_a(z)^k/k!; promoted to ColemanIntegration:L2/inversion-relation.
- `padicPolylog_sub_padicPolylog` (*relation*) — The branch-dependence formula; promoted to ColemanIntegration:L2/branch-dependence.
- `padicPolylog_map` (*functoriality*) — σ(Li^a_k(z)) = Li^{σ(a)}_k(σ z) for continuous automorphisms σ of ℂ_[p]; promoted to ColemanIntegration:L2/galois-equivariance.
- `padicModPolylog_eq_frobeniusSeries` (*relation*) — Li^{(p),a}_k(z) = g_k(1/(1 − z)) for |z − 1| > p^{−1/(p−1)}; promoted to ColemanIntegration:L2/frobenius-relation.

*Used by.*

- RJW Theorem 6.7(ii), p. 40 — L_p(θ,k) = (1 − θ(p)p^{−k})G(θ^{−1})^{−1}Σ_c θ^{−1}(c)Li_{k,p}(ε_N^c): values of the Iwasawa-branch Li_k at roots of unity (ColemanIntegration L3)
- BHYY Theorem 1.1, p. 2 — Coleman's formula in terms of Li_k^{(p)}(ξ^β) for N not a power of p
- PadicHodgeRegulators D.1 — imports Li_k, the branch, Frobenius relation and the dilogarithm D_p(x) = Li_2(x) + ½ log x log(1 − x) with the Iwasawa branch (GSWZ (174))
- HabiroNahmSeries HB.9/potential-and-the-p-adic-dilogarithm — Coleman's Li_2 and log with their Frobenius relations, at the specialisation t = 1
- Besser–de Jeu Theorem 1.6 / BBDJR Theorem 4.14 — the syntomic regulator of [x]_n is ±(n−1)!·P_{n,p}(x), a combination of log^j(x)Li_{n−j}(x)

*Unit tests.* A wrong definition fails one of these.

- `padicPolylog_two_neg_one` (computation) — For p odd and every a: padicPolylog p a 2 (−1) = 0.
- `padicPolylog_two_two` (computation) — For p odd and every a: padicPolylog p a 2 2 = 0.
- `padicPolylog_two_half` (computation) — For p odd and every a: padicPolylog p a 2 (1/2) = −log(2)^2/2, with log the branch-free logarithm of the unit 2.
- `padicPolylog_two_inv_p` (non-example) — padicPolylog p a 2 (1/p) = −polylogSer p 2 p − a^2/2; so a definition of Li_2 that ignores the branch fails on the residue disc of ∞.
- `padicPolylog_apply_zero_test` (degenerate) — padicPolylog p a k 0 = 0 for all k, and padicPolylog p a 0 z = z/(1 − z).
- `padicPolylog_one_index_eq_logOneAdd` (compatibility) — For |z| < 1: padicPolylog p a 1 z = −NormedSpace.logOneAdd ℂ_[p] ℂ_[p] (−z).

*Construction.*

1. The existence theorem gives the Coleman function on U with the normalisation at 0; the continuation lemma extends it to all of C_p ∖ {1}; on D⁻(0,1) it is Li_k^ser by (iii) of the existence theorem.
2. The value at 1 for k ≥ 2 is the constant term λ_k(1) of the analytic function λ_k of the continuation lemma.
3. Li^{(p),a}_k is a combination of two values of Li^a_k.

*Acceptance.*

- Li^a_1(z) = −log_a(1 − z) for all z ≠ 1, and Li^a_0(z) = z/(1 − z).
- For every odd p and every a: Li^a_2(−1) = 0, Li^a_2(2) = 0 and Li^a_2(1/2) = −log(2)^2/2 (GP check at p = 5 to the working precision; they follow from the distribution, reflection and inversion relations with ζ_p(2) = 0). The complex values are −π²/12, π²/4 − iπ log 2 and π²/12 − log(2)²/2: the p-adic values drop the π² terms.
- Li^a_2(1/p) = −Li_2^ser(p) − a²/2, so Li^a_2 depends on the branch on the residue disc of ∞.

*Uses.* `ColemanIntegration:L2/existence-and-uniqueness-of-coleman-polylogarithms`, `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L2/polylogarithm-power-series`, `ColemanIntegration:L0/log-branch`.

*Planet:* Coleman's p-adic polylogarithm.

*Sources.*

- The syntomic regulator for the K-theory of fields, §1, p. 869 (Ann. Sci. ENS 36 (2003)); p. 3 of arXiv v2: “Let Li_1(z) = − log(1 − z) for z ≠ 0 or 1. We follow Coleman to recursively define, using his integration theory, functions Li_n(z) for n ⩾ 2.” The definition, with the branch fixed by log(π) = 0 (equivalent to fixing a = log(p)).
- The syntomic regulator for the K-theory of fields, §2, p. 876 (published); p. 10 of arXiv v2: “The functions Li_n(z) are defined on C_p \ {1}. If L is a complete finitely ramified extension of Q_p then the limit lim_{z→1, z∈L} Li_n(z) exists for n ⩾ 2, and is independent of L. Using this limit as the value for Li_n at 1, Li_n extends to a function on C_p” Domain C_p ∖ {1} and the value at 1 for n ≥ 2.
- An introduction to p-adic L-functions, Remark 6.6, p. 40 (arXiv v2): “Coleman constructed p-adic analogues Li_{k,p}(z), which are locally analytic functions on C_p\{1}, and showed:” The function used in Theorem 6.7.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Definition 2.9 and Remark 2.10(3), pp. 9-10 (arXiv v2): “Our construction of p-adic MPL is just a multiple analogue of Coleman's construction [C] of p-adic polylogarithm ℓ_k(z). His p-adic polylogarithm ℓ_k(z) can be written as Li^a_k(z) in our notation.” The branch-parameter notation Li^a_k.
- Finite and p-adic polylogarithms, Proposition 2.1, p. 2 (arXiv v1): “Proposition 2.1. Let Li_n^{(p)}(z) := Li_n(z) − Li_n(z^p)/p^n. Then Li_n^{(p)}(X) ⊂ W and the function Li_n^{(p)} reduces modulo p to (1 − z^p)^{−1} li_n(z).” The modified polylogarithm Li^{(p)}.

#### Construction. The modified polylogarithm as an integral rigid function off the residue disc of 1

*Module* `TauCeti/NumberTheory/Padics/Polylogarithm.lean`. *Node* `ColemanIntegration:L2/integral-modified-polylogarithm`.

For k ∈ Z let ℓ_k(t) := Σ_{n≥1, p∤n} t^n/n^k ∈ Z_(p)[[t]], and for m ≥ 1 let f_{k,m}(t) := (1 − t^{p^m})^{−1}·Σ_{0<b<p^m, p∤b} b^{−k}t^b. Let 𝒜 := Z_p[t, (1 − t)^{−1}]^∧ be the p-adic completion of the localisation of Z_p[t] at 1 − t; it embeds into Z_p[[t]] by expansion at t = 0. Then f_{k,m} ∈ 𝒜 (1 − t^{p^m} ≡ (1 − t)^{p^m} mod p is a unit of 𝒜), f_{k,m} ≡ ℓ_k mod p^m·Z_p[[t]] and f_{k,m+1} ≡ f_{k,m} mod p^m𝒜; so ℓ_k := lim_m f_{k,m} is an element of 𝒜 whose expansion at 0 is Σ_{p∤n}t^n/n^k. Consequently: (i) ℓ_k defines a rigid analytic function on the affinoid X_0 := {z ∈ C_p : |z| ≤ 1, |z − 1| = 1} with |ℓ_k(z)| ≤ 1 there and |ℓ_k(z) − f_{k,m}(z)| ≤ p^{−m}; its values at points of W(F̄_p) (resp. O_K for K finite over Q_p) lie in W(F̄_p) (resp. O_K); (ii) ℓ_k ≡ li_k(t)/(1 − t^p) mod p𝒜 with li_k(t) := Σ_{b=1}^{p−1}t^b/b^k; (iii) f_{k,m}(1/t) ≡ (−1)^{k+1}f_{k,m}(t) mod p^m, so z ↦ (−1)^{k+1}ℓ_k(1/z) extends ℓ_k to a rigid analytic function on the affinoid P¹ ∖ D⁻(1,1) = {|z − 1| ≥ 1} ∪ {∞}, bounded by 1, with value 0 at ∞; (iv) t·dℓ_k/dt = ℓ_{k−1} and ℓ_0 = t/(1 − t) − t^p/(1 − t^p); (v) for p ∤ m, Σ_{ζ∈μ_m}ℓ_k(ζt) = m^{1−k}ℓ_k(t^m). In the variable s = t/(1 − t) the expansion of ℓ_k has coefficients in Z_p tending to 0, i.e. it is a restricted power series.

*Hypotheses.* k ∈ Z (all integers; k ≥ 0 is what L2 uses); p any prime. No Coleman theory is used in this node; the identification with Li^{(p),a}_k is ColemanIntegration:L2/frobenius-relation.

*API.*

- `modPolylogApprox` (*data*) — modPolylogApprox p k m z := (1 − z^{p^m})^{−1}·Σ_{0<b<p^m, p∤b} b^{−k}z^b, a rational function of z.
- `modPolylogLimit` (*data*) — modPolylogLimit p k : ℂ_[p] → ℂ_[p]; on X_0 the p-adic limit of modPolylogApprox p k m z, extended to {|z| > 1} by (−1)^{k+1}·modPolylogLimit p k (1/z).
- `norm_modPolylogLimit_sub_approx_le` (*characterisation*) — For |z| ≤ 1 with |z − 1| = 1: ‖modPolylogLimit p k z − modPolylogApprox p k m z‖ ≤ p^{−m}.
- `norm_modPolylogLimit_le_one` (*other*) — For |z − 1| ≥ 1: ‖modPolylogLimit p k z‖ ≤ 1.
- `modPolylogLimit_eq_tsum` (*compatibility*) — For |z| < 1: modPolylogLimit p k z = Σ'_{n≥1, p∤n} z^n/n^k.
- `modPolylogLimit_inv` (*relation*) — For |z − 1| ≥ 1, z ≠ 0: modPolylogLimit p k (1/z) = (−1)^{k+1}·modPolylogLimit p k z.
- `modPolylogLimit_hasDerivAt` (*relation*) — For |z − 1| ≥ 1, z ≠ 0: HasDerivAt (modPolylogLimit p (k+1)) (modPolylogLimit p k z / z) z.
- `modPolylogLimit_zero_index` (*simp*) — modPolylogLimit p 0 z = z/(1 − z) − z^p/(1 − z^p) for |z − 1| ≥ 1.
- `modPolylogLimit_reduction` (*other*) — For z ∈ 𝓞_ℂ_[p] with |z − 1| = 1: ‖modPolylogLimit p k z − (1 − z^p)^{−1}Σ_{b=1}^{p−1} z^b/b^k‖ ≤ p^{−1}.
- `modPolylogLimit_distribution` (*relation*) — For p ∤ m: Σ_{ζ∈μ_m} modPolylogLimit p k (ζz) = m^{1−k}·modPolylogLimit p k (z^m) where all arguments satisfy |· − 1| ≥ 1.
- `modPolylogElement` (*constructor*) — The element ℓ_k of the p-adic completion of Z_p[t, (1 − t)^{−1}] (AdicCompletion of Localization.Away (1 − X)); its expansion at 0 is Σ_{p∤n} t^n/n^k.

*Used by.*

- `ColemanIntegration:L2/frobenius-relation` — identifies Li^a_k(z) − p^{−k}Li^a_k(z^p) with ℓ_k on P¹ ∖ D⁻(1,1)
- `ColemanIntegration:L2/values-at-tame-roots-of-unity` — values of ℓ_k at tame roots of unity give Li_k(ζ) ∈ p^kZ_p[ζ] and Besser's congruence
- BHYY Theorem 1.1 and Lemma 3.3 — Coleman's formula for L_p(χω^{1−k}, k) with Li^{(p)}_k(ξ^β), N not a power of p (ColemanIntegration L3)
- HabiroNumberFields HB.7/pochhammer-dwork-difference (GSWZ Lemma 2.1, Proposition 2.2) — Li_n^{(p)}(t) ∈ Z[t, 1/(1−t)]^∧_p and its specialisation t ↦ ζ; proposed to be imported from here (restructure)
- HabiroNahmSeries HB.9/potential-and-the-p-adic-dilogarithm — Li_n^{(p)}(1 − z_j) ∈ R^∧_p for special units z_j
- PadicHodgeRegulators D.3 (GSWZ Lemma 3.1, Proposition 3.2) — p²-integrality of D_p on special units and its reduction mod p via li_2

*Unit tests.* A wrong definition fails one of these.

- `modPolylogLimit_zero_index_test` (computation) — modPolylogLimit p 0 z = z/(1 − z) − z^p/(1 − z^p) for every z with |z − 1| ≥ 1.
- `modPolylogLimit_two_neg_one` (computation) — For p odd and every even k ≥ 2: modPolylogLimit p k (−1) = 0 (from the symmetry at z = −1 = 1/(−1)).
- `modPolylogLimit_apply_zero` (degenerate) — modPolylogLimit p k 0 = 0, and modPolylogLimit p k z → 0 as |z| → ∞.
- `modPolylogLimit_ne_polylog` (non-example) — For p odd, modPolylogLimit p 1 (−1) = −(1 − 1/p)·log(2) ≠ −log(2) = Li_1(−1): ℓ_k is not the restriction of Li_k to X_0.
- `modPolylogLimit_isRestricted` (compatibility) — The expansion of ℓ_k in s = t/(1 − t) is a power series with coefficients in ℤ_[p] that is restricted (PowerSeries.IsRestricted 1) — the Mathlib notion of a Tate-algebra element.

*Construction.*

1. For 1 ≤ r ≤ p − 1 and j ≥ 0, (r + pj)^{−1} ∈ Z_p and (r + pj)^{−k} ≡ (r + p(j + p^Nℓ))^{−k} mod p^N; splitting Σ_{p∤n} into classes mod p^N and summing the geometric series gives ℓ_k ≡ f_{k,N} mod p^N in Z_p[[t]] (GSWZ Lemma 2.1, BHYY Lemma 3.3 with F = Q).
2. 1 − t^{p^N} is a unit of 𝒜 (its reduction mod p is (1 − t)^{p^N}, a unit of F_p[t, (1 − t)^{−1}], and 𝒜 is p-adically complete: mathlib:AdicCompletion, mathlib:Localization.Away), so f_{k,N} ∈ 𝒜; the congruences make (f_{k,N}) Cauchy in 𝒜, and the expansion map 𝒜 → Z_p[[t]] is injective and continuous, so ℓ_k ∈ 𝒜.
3. (i) Elements of 𝒜 are p-adic limits of polynomials in t and (1 − t)^{−1} with Z_p coefficients, which converge uniformly on X_0 where |t| ≤ 1 and |(1 − t)^{−1}| ≤ 1; values at W(F̄_p)- or O_K-points stay in that ring.
4. (ii) is the case N = 1 of the first step.
5. (iii) f_{k,m}(1/t) = −(1 − t^{p^m})^{−1}Σ_b b^{−k}t^{p^m − b} and (p^m − b)^{−k} ≡ (−b)^{−k} mod p^m, so f_{k,m}(1/t) ≡ (−1)^{k+1}f_{k,m}(t); each f_{k,m} vanishes at ∞ (degree of numerator < p^m); pass to the limit on {|z| = |z − 1| = 1} and glue with ℓ_k on X_0.
6. (iv) and (v) hold coefficientwise in Z_p[[t]] (for (v), Σ_{ζ∈μ_m}ζ^n = m·[m | n] and p ∤ mj ⟺ p ∤ j when p ∤ m) and transfer to 𝒜 by injectivity of the expansion.
7. Restricted in s: t = s/(1 + s) turns an element of Z_p[[t]] into one of Z_p[[s]] with coefficients that are Z-linear combinations of the t-coefficients; elements of 𝒜 are limits of polynomials in s and 1 + s = (1 − t)^{−1}, so the coefficients tend to 0 (mathlib:PowerSeries.IsRestricted with c = 1).

*Acceptance.*

- ℓ_0(t) = t/(1 − t) − t^p/(1 − t^p) exactly.
- p = 5, z = 2: the f_{k,m}(2) for k = 1, 2, 3 agree to order 5^m at consecutive m (GP), and ℓ_k(2) = g_k(−1) with the series of ColemanIntegration:L2/overconvergent-expansion-of-the-modified-polylogarithm.
- Symmetry (iii): p = 5, ℓ_k(1/2) = (−1)^{k+1}ℓ_k(2) for k = 1, …, 4 to the precision of the limit formula, and ℓ_k(1/5) = (−1)^{k+1}ℓ_k(5) with ℓ_k(5) = Σ_{5∤n}5^n/n^k for k = 1, 2, 3 to 34-40 digits (GP).

*Uses.* `ColemanIntegration:L2/polylogarithm-power-series`, `mathlib:AdicCompletion`, `mathlib:Localization.Away`, `mathlib:PadicInt`, `mathlib:PowerSeries`, `mathlib:PowerSeries.IsRestricted`.

*Sources.*

- The Habiro ring of a number field, Lemma 2.1 and its proof, p. 19 (arXiv v2): “Lemma 2.1. For every integer n and prime number p we have Li^(p)_n(t) ∈ Z[t, 1/(1−t)]^∧_p.” The main statement (with Z[t, 1/(1 − t)]^∧_p = 𝒜).
- p-adic polylogarithms and p-adic Hecke L-functions for totally real fields, Lemma 3.3, proof, pp. 14-15 (arXiv v2): “In particular, we have f_m(t) ≡ f_n(t) (mod p^m B̂_α) for any integer n ≥ m, hence the sequence (f_m(t))_{m∈N} is a Cauchy sequence in B̂_α for the p-adic topology.” The limit construction; for F = Q and a = Z, B_α = O_K[t][1/(1 − t)].
- Finite and p-adic polylogarithms, Proposition 2.1 and proof, p. 2 (arXiv v1): “Since for z ∈ X μ_z takes integral values, this shows the first statement. Reducing modulo p we may replace the function x ↦ x^{−k} by the function x ↦ a^{−k} if x ≡ a (mod p)” Integrality on X and the reduction mod p, via the measure μ_z(a + p^mZ_p) = z^a/(1 − z^{p^m}) whose Riemann sums are the f_{k,m}.
- The Habiro ring of a number field, §2.1, p. 18 (arXiv v2): “In [11, Prop.6.2] Coleman proves (working with the variable 1/t) that Li^(p)_n(t) ∈ Z_(p)[[t]] is convergent for |t/(1 − t)| < p^{(p−1)^{−1}} and consequently lies in the ring Z[t/(1−t)]^∧_p” The restricted-power-series form in s = t/(1 − t), and Coleman's stronger radius (next node).

### Lemmas, theorems and comparisons

#### Lemma. In which residue disc a root of unity lies

*Node* `ColemanIntegration:L2/residue-discs-of-roots-of-unity`.

Let ζ ∈ C_p be a root of unity of exact order N ≥ 2. If N = p^r with r ≥ 1, then |ζ − 1| = p^{−1/(p^{r−1}(p−1))} < 1: ζ lies in the residue disc of 1, with |ζ − 1| > p^{−1/(p−1)} if and only if r ≥ 2 and |ζ − 1| = p^{−1/(p−1)} for r = 1. If N is not a power of p, then |ζ| = |ζ − 1| = 1: ζ and 1 − ζ are units, ζ lies in a residue disc of U = P¹ ∖ {0,1,∞}, and v(1 − ζ) = 0. For c ∈ (Z/NZ)^× the same holds for ζ^c, with |1 − ζ^c| = |1 − ζ|. When p ∤ N and K ⊂ C_p is a finite extension of Q_p containing ζ, ζ is the Teichmüller representative of its reduction (the roots of unity of order prime to p in K are the image of the Teichmüller lift of the residue field of K).

*Hypotheses.* N ≥ 2 the exact order of ζ; p any prime.

*Proof outline.*

1. Φ_N(1) = Π_{c∈(Z/N)^×}(1 − ζ^c) (mathlib:Polynomial.cyclotomic and mathlib:IsPrimitiveRoot); Φ_{p^r}(1) = p (mathlib:Polynomial.eval_one_cyclotomic_prime_pow), and for N not a prime power Φ_N(1) = 1 (mathlib:Polynomial.eval_one_cyclotomic_not_prime_pow), while Φ_{ℓ^s}(1) = ℓ for a prime ℓ ≠ p, a p-adic unit.
2. All factors have the same absolute value: 1 − ζ^c = (1 − ζ)(1 + ζ + ⋯ + ζ^{c−1}) gives |1 − ζ^c| ≤ |1 − ζ|, and exchanging ζ and ζ^c (ζ = (ζ^c)^{c'} with cc' ≡ 1) gives the reverse inequality. Hence |1 − ζ|^{φ(N)} = |Φ_N(1)|_p, which is p^{−1} for N = p^r and 1 otherwise; φ(p^r) = p^{r−1}(p − 1).
3. |ζ| = 1 since ζ^N = 1 (mathlib:PadicComplex, the absolute value is multiplicative).
4. Teichmüller: for K finite over Q_p with residue field of size q, the roots of unity of order prime to p in K are the (q−1)-st roots of unity, which are the image of the Teichmüller lift (tauceti:TauCeti.teichmuller, tauceti:TauCeti.range_teichmuller).

*Acceptance.*

- p = 3, ζ = e^{2πi/9} ∈ Q_3(ζ_9): |ζ − 1| = 3^{−1/6} > 3^{−1/2}, so the Frobenius relation applies at ζ; ζ_3 has |ζ_3 − 1| = 3^{−1/2}, the boundary radius.
- p = 5, ζ = teichmuller(2) (order 4): |1 − ζ| = 1, and 1 − ζ ≡ 1 − 2 = −1 mod 5.
- N = 6, p = 2: a primitive 6th root of unity ζ_6 = −ζ_3^2 reduces to a primitive cube root of unity in F̄_2, so |ζ_6 − 1|_2 = 1 although 2 | 6.

*Uses.* `mathlib:PadicComplex`, `mathlib:IsPrimitiveRoot`, `mathlib:IsPrimitiveRoot.prod_one_sub_pow_eq_order`, `mathlib:Polynomial.cyclotomic`, `mathlib:Polynomial.eval_one_cyclotomic_prime_pow`, `mathlib:Polynomial.eval_one_cyclotomic_not_prime_pow`, `tauceti:TauCeti.teichmuller`, `tauceti:TauCeti.range_teichmuller`.

*Sources.*

- p-adic polylogarithms and p-adic Hecke L-functions for totally real fields, §3.1, p. 14 (arXiv v2): “Note that ξ lies in Û^a_{αK} if and only if ξ(α) ≢ 1 modulo the maximal ideal of O_{K(ξ)}. In particular, any torsion point ξ ∈ T^a(Q̄) which is not of p-power order lies in Û^a_K.” Roots of unity of order not a power of p lie outside the residue disc of 1.
- An introduction to p-adic L-functions, Proof of Lemma 6.4, p. 38 (arXiv v2): “If (N, p) = 1, we know that (ε_N^c − 1) is a p-adic unit;” The unit case (N prime to p).
- Finite and p-adic polylogarithms, Proof of Corollary 2.2, p. 2 (arXiv v1): “Since α ∈ X ⊂ W the order of α is prime to p and we have α^{p^k} = α for some k.” Tame roots of unity are fixed by a power of Frobenius.

#### Theorem. Existence and uniqueness of Coleman's polylogarithms

*Node* `ColemanIntegration:L2/existence-and-uniqueness-of-coleman-polylogarithms`.

Fix a branch parameter a ∈ C_p and let A^a_Col(U) be the ring of Coleman functions with branch log_a on U = P¹ ∖ {0,1,∞} over Z_p (ColemanIntegration L1: wide open neighbourhoods of the complement of the residue discs of 0, 1, ∞, Frobenius lift z ↦ z^p). For every k ≥ 1 there is a unique sequence of Coleman functions Li^a_1, …, Li^a_k ∈ A^a_Col(U) such that (i) Li^a_1 = −log_a(1 − z); (ii) d Li^a_j = Li^a_{j−1}·dz/z for 2 ≤ j ≤ k; (iii) for 1 ≤ j ≤ k the restriction of Li^a_j to the residue annulus of 0, an element of A(annulus)[log_a z], has no logarithmic terms and is the restriction of the analytic function Li_j^ser of ColemanIntegration:L2/polylogarithm-power-series (so it extends analytically to D⁻(0,1) with value 0 at 0). More precisely, for j ≥ 2 the Coleman functions F with dF = Li^a_{j−1}dz/z are exactly Li^a_j + c with c ∈ C_p, and (iii) singles out c = 0. The functions do not depend on the auxiliary Frobenius lift.

*Hypotheses.* a ∈ C_p arbitrary; p any prime; k ≥ 1. Coleman functions and Coleman integration are those of ColemanIntegration L1 for the good-reduction pair (P¹, {0,1,∞}) over Z_p; the forms integrated are unipotent (iterated integrals of dz/z and dz/(1−z)). Normalisation (iii) is at the base point 0, which lies outside U; it is meaningful because the integrand Li^a_{j−1}dz/z is regular at 0 (Li^a_{j−1}(0) = 0), and it agrees with the tangential-base-point normalisation (ColemanIntegration:L2/tangential-base-point-at-zero).

*Proof outline.*

1. j = 1: 1 − z is a rigid-analytic unit on the wide open neighbourhoods of U, so log_a(1 − z) is a Coleman function with d log_a(1 − z) = d(1 − z)/(1 − z) (ColemanIntegration:L1/punctured-line-based-primitive: the Coleman integral of df/f for a rigid unit f is log_a f). On D⁻(0,1), 1 − z ∈ 1 + m_{C_p}, so −log_a(1 − z) = Li_1^ser(z) for every a (ColemanIntegration:L0/log-branch).
2. Inductive step j ≥ 2: ω := Li^a_{j−1}·dz/z lies in A^a_Col(U)·Ω†(U); Coleman integration gives F ∈ A^a_Col(U) with dF = ω, unique up to an additive constant (ColemanIntegration:L1/punctured-line-based-primitive).
3. On the residue annulus of 0 the restriction of Li^a_{j−1} is Li_{j−1}^ser (induction), so ω = Σ_{n≥1} z^{n−1}/n^{j−1} dz = d(Li_j^ser) there; hence F − Li_j^ser ∈ A(annulus)[log_a z] has zero differential and is a constant c (the kernel of d on log-Laurent series on an annulus is C_p: ColemanIntegration:L0/annulus-log-primitive). Put Li^a_j := F − c.
4. Uniqueness: two solutions differ by a Coleman function with zero differential, which is a global constant (ColemanIntegration:L1/coleman-uniqueness-principle); it vanishes on the residue annulus of 0, hence everywhere.
5. Independence of the Frobenius lift: A^a_Col(U) and its integration do not depend on the lift (ColemanIntegration:L1/frobenius-lift-independence), and (i)-(iii) do not mention it.

*Acceptance.*

- For k = 1 there is no choice: Li^a_1 = −log_a(1 − z).
- Normalising at an ordinary base point x_0 ∈ U(C_p) instead of 0 produces Li^a_k − Li^a_k(x_0), a different function: for p = 5 and x_0 = −1, Li_3(−1) = −(3/4)ζ_5(3) has 5-adic valuation 3 (computed), so it is not 0.
- Without the uniqueness principle, (i)-(iii) determine Li_k only on the residue disc of 0 (ColemanIntegration:L2/locally-analytic-antiderivatives-and-a-non-example).

*Uses.* `ColemanIntegration:L2/polylogarithm-power-series`, `ColemanIntegration:L0/log-branch`, `ColemanIntegration:L1/punctured-line-coleman-functions`, `ColemanIntegration:L1/punctured-line-based-primitive`, `ColemanIntegration:L1/coleman-integral`, `ColemanIntegration:L1/coleman-uniqueness-principle`, `ColemanIntegration:L1/frobenius-lift-independence`, `ColemanIntegration:L0/annulus-log-transcendence`, `ColemanIntegration:L0/annulus-log-primitive`.

*Sources.*

- The syntomic regulator for the K-theory of fields, §1, p. 869 (Ann. Sci. ENS 36 (2003)); p. 3 of arXiv v2: “We follow Coleman to recursively define, using his integration theory, functions Li_n(z) for n ⩾ 2. The defining relations are d Li_n(z) = Li_{n−1}(z) dlog z and lim_{z→0} Li_n(z) = 0, and they have a unique solution in the class of functions defined by Coleman.” The theorem, as stated there (proof by Coleman integration).
- The syntomic regulator for the K-theory of fields, §2, p. 875 (published): “Here we take ω_1 = −dlog(1 − z) and ω_i = dlog z for i > 1. Notice that dlog z has a simple pole at 0. However, if we normalize Li_r(z) at each step to vanish at 0 this zero will cancel with the pole and we will obtain a form which is also integrable at the residue disc of 0.” The inductive construction and why the normalisation at 0 makes sense.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Remark 2.10(2), p. 10 (arXiv v2): “Because we get dt/t, dt/(1−t) ∈ A^a_Col and we know that Li^a_{k1,···,km}(z) is analytic on |z|_p < 1 and takes value 0 at z = 0, it is easy to see that each p-adic MPL is well defined in A^a_Col.” The same argument for multiple polylogarithms (the case m = 1 is Li^a_k).
- Coleman integration using the Tannakian formalism, Corollary 4.14 and Theorem 4.15, p. 14 (arXiv v1): “Corollary 4.14. The kernel of d on A_Col(T) is K.” Uniqueness of Coleman integrals up to a constant (Theorem 4.15 gives existence: the Coleman de Rham complex is exact at the one-forms).
- A note on functional equations of the p-adic polylogarithms, §0, Theorem A', p. 345: “Then there exists a logarithmic F-crystal M(D) on D = C_p \ {0,1} such that the system of differential equations (*_1) has a unique solution ℓ_1(z), ..., ℓ_n(z) in M(D) which satisfies the initial condition (**_2).” Existence and uniqueness in Coleman's framework, with the initial condition lim_{z→0} ℓ_1(z) = 0.

#### Lemma. The polylogarithms on the punctured residue discs of 1 and ∞

*Node* `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`.

Let a ∈ C_p and k ≥ 1, and let Li^a_k be the Coleman function of ColemanIntegration:L2/existence-and-uniqueness-of-coleman-polylogarithms. (a) Residue disc of 1. The function λ_k(z) := Li^a_k(z) + log(z)^{k−1}·log_a(1 − z)/(k−1)!, defined on the residue annulus of 1 (where log z = log_a z is the branch-free series in z − 1), extends to an analytic function on the whole disc D⁻(1,1); λ_k does not depend on a; λ_1 = 0; dλ_k = λ_{k−1}·dz/z + log(z)^{k−1}/((k−1)!·(z − 1))·dz; and λ_2(z) = λ_2(1) − Li_2^ser(1 − z). (b) Residue disc of ∞. With u = 1/z, the restriction of Li^a_k to the residue annulus of ∞ lies in A(D⁻(0,1)_u)[log_a u]: it is a polynomial in log_a(1/z) whose coefficients are power series in 1/z converging for |z| > 1. (c) Consequently Li^a_k extends uniquely to a locally analytic function on (D⁻(1,1) ∖ {1}) ∪ {|z| > 1} by these expansions; together with its restriction to the residue discs D⁻(x,1), |x| = |x − 1| = 1 (convergent power series in z − x on the whole disc) and Li_k^ser on D⁻(0,1), this gives a locally analytic function on C_p ∖ {1} with d Li^a_k = Li^a_{k−1}·dz/z.

*Hypotheses.* a ∈ C_p, k ≥ 1. log_a(1 − z) = log_a(z − 1) since log_a(−1) = 0 for every branch. A(D) is the ring of analytic functions on the open disc D (convergent power series), A(annulus) the ring of convergent Laurent series on the annulus.

*Proof outline.*

1. (a) On the residue annulus of 1, Li^a_k ∈ A(annulus)[log_a(z − 1)] (ColemanIntegration:L1/punctured-line-coleman-functions). Using d Li^a_k = Li^a_{k−1}dz/z, d log_a(1 − z) = dz/(z − 1) and d log z = dz/z (ColemanIntegration:L0/log-branch) one computes dλ_k = [Li^a_{k−1} + log(z)^{k−2}log_a(1 − z)/(k−2)!]dz/z + log(z)^{k−1}/((k−1)!(z − 1))dz = λ_{k−1}dz/z + log(z)^{k−1}dz/((k−1)!(z − 1)).
2. Induction on k: λ_1 = −log_a(1 − z) + log_a(1 − z) = 0. If λ_{k−1} ∈ A(D⁻(1,1)), the right-hand side is an analytic 1-form on D⁻(1,1) (0 ∉ D⁻(1,1) and log(z)/(z − 1) = Σ_{n≥1}(−1)^{n−1}(z − 1)^{n−1}/n); it has an analytic primitive μ on D⁻(1,1) (ColemanIntegration:L0/disc-primitive-unique), and λ_k − μ ∈ A(annulus)[log_a(z − 1)] has zero differential, hence is constant (ColemanIntegration:L0/annulus-log-primitive). So λ_k ∈ A(D⁻(1,1)).
3. Branch independence: the transport ι_{a,b} of ColemanIntegration L1 (replace log_a of local parameters at 0, 1, ∞ by log_b) maps Li^a_k to Li^b_k, since both satisfy the characterisation of the existence theorem; λ_k has no logarithmic term, so ι_{a,b}(λ_k) = λ_k, i.e. λ_k computed with a equals λ_k computed with b.
4. k = 2: dλ_2 = log(z)dz/(z − 1) = Σ_{n≥1}(−1)^{n−1}(z − 1)^{n−1}/n dz = −d(Li_2^ser(1 − z)) termwise, so λ_2(z) = λ_2(1) − Li_2^ser(1 − z).
5. (b) Induction on k with u = 1/z, dz/z = −du/u. For k = 1, −log_a(1 − z) = log_a u − log(1 − u) (as 1 − z = −z(1 − u)), which lies in A(D⁻(0,1)_u)[log_a u]. If Li^a_{k−1} = Σ_j f_j(u)log_a(u)^j with f_j ∈ A(D⁻(0,1)), then −f_j(u)log_a(u)^j du/u has a primitive in A(D⁻(0,1))[log_a u]: write f_j = f_j(0) + u g_j(u); f_j(0)log_a(u)^j du/u integrates to f_j(0)log_a(u)^{j+1}/(j+1), and g_j(u)log_a(u)^j du integrates by parts, with G_j := ∫_0^u g_j analytic on the disc and G_j/u analytic (ColemanIntegration:L0/disc-primitive-unique). Li^a_k minus this primitive has zero differential on the annulus, hence is constant (ColemanIntegration:L0/annulus-log-primitive).
6. (c) The expansions in (a) and (b) converge on the whole punctured discs; on the residue discs of U the Coleman function is analytic on the whole disc (L1), and on D⁻(0,1) it is Li_k^ser (existence theorem). The differential relation holds on each piece by construction.

*Acceptance.*

- λ_2(z) = λ_2(1) − Li_2^ser(1 − z); with λ_2(1) = ζ_p(2) = 0 (ColemanIntegration:L2/value-at-one) this is Euler's reflection Li_2(z) + Li_2(1 − z) = −log z·log(1 − z) on the residue disc of 1.
- For p = 5 and z = 1 + t with t^8 = 5, the Frobenius relation computed from λ_1, λ_2, λ_3 (with λ_3(1) = ζ_5(3) = −(4/3)Li_3(−1)) matches the overconvergent series g_k(1/(1−z)) to the working precision (GP check).
- Li_2 itself is not analytic on D⁻(1,1) ∖ {1}: it contains −log(z)·log_a(1 − z), which is not a convergent power series in z − 1.

*Uses.* `ColemanIntegration:L2/existence-and-uniqueness-of-coleman-polylogarithms`, `ColemanIntegration:L2/polylogarithm-power-series`, `ColemanIntegration:L0/log-branch`, `ColemanIntegration:L1/punctured-line-coleman-functions`, `ColemanIntegration:L0/disc-primitive-unique`, `ColemanIntegration:L0/annulus-log-transcendence`, `ColemanIntegration:L0/annulus-log-primitive`, `ColemanIntegration:L1/punctured-line-singular-disc-expansion`.

*Sources.*

- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Proposition 2.11, p. 10 (arXiv v2): “Proposition 2.11. The p-adic MPL Li^a_{k1,···,km}(t) is locally analytic on P¹(C_p)\{1, ∞}. More precisely, Li^a(t)|_]0[ ∈ A(]0[), Li^a(t)|_]1[ ∈ A(]1[)[log^a(t − 1)] and Li^a(t)|_]∞[ ∈ A(]∞[)[log^a(1/t)].” Statements (b) and the qualitative form of (a); the proof there is 'by construction ... inductively'.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Proof of Theorem 2.13, p. 10 (arXiv v2): “its A^a_log(]1[)-component can be written as follows. Li^a_{k1,···,km}(z) = f_0(z − 1) + f_1(z − 1)log^a(z − 1) + f_2(z − 1)(log^a(z − 1))^2 + ··· + f_m(z − 1)(log^a(z − 1))^m, where f_i(z) ∈ A(D(0 : 1))” Coefficients analytic on the whole disc and independent of the branch (via Proposition 2.3).
- The syntomic regulator for the K-theory of fields, Proof of Proposition 2.6, p. 877 (published): “According to [11, Proposition 7.1], Li_{n,a}(z) − (1/(n−1)) Li_{n−1,a}(z) log(z) extends to an analytic function on |1 − z| < 1. (Note that B(0, 1) should be replaced with B(1, 1) everywhere in the formulation and the proof of loc. cit.)” An equivalent form of (a): Li_n − log(z)Li_{n−1}/(n−1) = λ_n − log(z)λ_{n−1}/(n−1) is analytic on D⁻(1,1).
- On the p-adic Beilinson conjecture for number fields, §4, class of functions (1)-(2), p. 19 (arXiv v2): “(2) for 0 < |z − 1|_p < 1 (resp. |z|_p > 1) f(z) is given by a polynomial in log_p(z − 1) (resp. log_p(1/z)) with coefficients that are Laurent series in z − 1 (resp. 1/z), convergent for 0 < |z − 1|_p < 1 (resp. |z|_p > 1).” The shape of Li_{n,p} on the punctured discs of 1 and ∞.

#### Comparison. The base-point normalisation at zero is the tangential one

*Node* `ColemanIntegration:L2/tangential-base-point-at-zero`.

For a Coleman function F with branch a on U whose restriction to the residue annulus of 0 lies in A(D⁻(0,1))[log_a z] (coefficients analytic on the whole disc, as for every iterated integral of dz/z and dz/(1−z)), write F = Σ_i f_i(z)·log_a(z)^i there and define its regularised value at the tangential base point λ·∂/∂z at 0 (λ ∈ C_p^×) by Reg_{λ∂z}(F) := Σ_i f_i(0)·log_a(λ)^i (set log_a(z/λ) = 0). Then: (1) for k ≥ 1, Li^a_k is the unique Coleman function with Li^a_1 = −log_a(1 − z), d Li^a_k = Li^a_{k−1}dz/z and Reg_{∂z}(Li^a_k) = 0; equivalently Li^a_k(z) = ∫_{→0}^z ω_1 ω_0^{k−1} with ω_1 = dz/(1−z), ω_0 = dz/z and the tangential base point ∂/∂z at 0, which is Furusho's ∫_0^z; (2) Li^a_k has no logarithmic term at 0, so Reg_{λ∂z}(Li^a_k) = Li^a_k(0) = 0 for every λ: the normalisation of Li_k is independent of the tangent vector and coincides with 'value 0 at 0'; (3) by contrast Reg_{λ∂z}(log_a z) = log_a(λ) depends on λ, and log_a z (the Coleman integral of dz/z) has no value at 0: for integrands with a pole at 0 only a tangential base point makes sense; (4) in the non-commutative generating series, the fundamental solution G^a_0 of the p-adic KZ equation normalised by G^a_0(u) ≈ u^A as u → 0 has coefficient −Li^a_k(u) at A^{k−1}B, and normalising instead at an ordinary base point x ∈ U(C_p) replaces Li^a_k by Li^a_k − Li^a_k(x) at weight one in B.

*Hypotheses.* a ∈ C_p; k ≥ 1; λ ∈ C_p^×. The regularisation uses the local parameter z at 0; changing the parameter to z·h(z) with h(0) = λ^{−1} is the same as changing the tangent vector.

*Proof outline.*

1. (1) By the existence theorem Li^a_k has no log term at 0 and value 0 there, so Reg_{∂z}(Li^a_k) = 0; conversely a Coleman function F with the same differential equation is Li^a_k + c (existence theorem, uniqueness part), and Reg_{∂z}(F) = c.
2. (2) With no logarithmic terms, Reg_{λ∂z} only reads f_0(0) = Li^a_k(0) = 0.
3. (3) log_a z = 0 + 1·log_a z, so Reg_{λ∂z}(log_a z) = log_a λ.
4. (4) Furusho's Theorem 3.3 characterises G^a_0 by G^a_0(u)·u^{−A} ∈ 1 + (terms vanishing at u = 0), and his Examples 3.25 exhibit −Li^a_2 and −Li^a_3 as the coefficients of AB and A²B; the uniqueness is ColemanIntegration:L1/coleman-uniqueness-principle.

*Acceptance.*

- Reg_{p∂z}(log_a z) = a: the Iwasawa branch a = 0 and the tangent vector p∂/∂z give 0, other branches do not.
- Reg_{λ∂z}(Li^a_2) = 0 for all λ, while Reg_{λ∂z}(Li^a_2 + log_a(z)^2/2) = log_a(λ)^2/2.

*Uses.* `ColemanIntegration:L2/existence-and-uniqueness-of-coleman-polylogarithms`, `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L1/punctured-line-coleman-functions`, `ColemanIntegration:L1/coleman-uniqueness-principle`, `ColemanIntegration:L0/log-branch`.

*Sources.*

- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Theorem 3.3, p. 15 (arXiv v2): “Theorem 3.3. Fix a ∈ C_p. Then there exists a unique (invertible) solution G^a_0(u) ∈ A^a_Col ⊗̂ A^∧_{C_p} of (KZ^p) which is defined and locally analytic on P¹(C_p)\{0, 1, ∞} and satisfies G^a_0(u) ≈ u^A (u → 0).” The tangential normalisation at 0 of the generating series of the polylogarithms.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Examples 3.25, p. 21 (arXiv v2): “G^a_0(A,B)(z) = 1 + (log^a z)A + log^a(1 − z)B + ((log^a z)^2/2)A^2 − Li^a_2(z)AB” The coefficient of AB is −Li^a_2 (and −Li^a_3 at A²B on the next line).
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Notation 2.6, p. 9 (arXiv v2): “When we let y vary, we regard ∫_x^y ω as the Coleman function which is characterized by dF_ω = ω and F_ω(x) = 0.” The base-point normalisation ∫_0^z used in Definition 2.9.
- The syntomic regulator for the K-theory of fields, §2, p. 875 (published): “Notice that dlog z has a simple pole at 0. However, if we normalize Li_r(z) at each step to vanish at 0 this zero will cancel with the pole and we will obtain a form which is also integrable at the residue disc of 0.” Why the value at 0 is an admissible normalisation for Li_k but not for log z.

#### Lemma. The differential recursion z·(d/dz)Li_k = Li_{k−1}

*Node* `ColemanIntegration:L2/differential-recursion`.

For every a ∈ C_p, k ≥ 1 and z ∈ C_p ∖ {1}, the function Li^a_k : C_p ∖ {1} → C_p is differentiable at z (in the sense of HasDerivAt over C_p), with derivative Li^a_{k−1}(z)/z if z ≠ 0 and 1 if z = 0; in particular z·(Li^a_k)'(z) = Li^a_{k−1}(z) everywhere on C_p ∖ {1}, and (Li^a_1)'(z) = 1/(1 − z). For k ≥ 2, Li^a_k is continuous at 1 along finitely ramified extensions but not differentiable at 1.

*Hypotheses.* a ∈ C_p; k ≥ 1; z ≠ 1.

*Proof outline.*

1. On D⁻(0,1): termwise differentiation of Li_k^ser (ColemanIntegration:L2/polylogarithm-power-series).
2. On the residue discs of U: the Coleman function is a convergent power series there and d Li^a_k = Li^a_{k−1}dz/z (existence theorem).
3. On the punctured discs of 1 and ∞: Li^a_k is a polynomial in log_a with analytic coefficients (ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs), and log_a is differentiable with derivative 1/z (ColemanIntegration:L0/log-branch); the relation d Li^a_k = Li^a_{k−1}dz/z holds there by the same lemma.
4. Non-differentiability at 1: near 1, Li^a_2 = λ_2 − log(z)log_a(1 − z) and the difference quotient of log(z)log_a(1 − z) at 1 contains log_a(1 − z), which is unbounded as z → 1.

*Acceptance.*

- k = 1: (d/dz)(−log_a(1 − z)) = 1/(1 − z), so z·Li_1' = z/(1 − z) = Li_0.
- k = 3 at z = −1 (p odd): the derivative of Li_3 at −1 equals −Li_2(−1) = 0.

*Uses.* `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L2/existence-and-uniqueness-of-coleman-polylogarithms`, `ColemanIntegration:L2/polylogarithm-power-series`, `ColemanIntegration:L0/log-branch`, `mathlib:HasDerivAt`, `ColemanIntegration:L0/log-branch-local-expansion`.

*Sources.*

- On the p-adic Beilinson conjecture for number fields, §4, properties (1)-(3), p. 19 (arXiv v2): “(1) Li_{0,p}(z) = z/(1−z); (2) Li_{n,p}(0) = 0 for n ≥ 0; (3) dLi_{n+1,p}(z) = Li_{n,p}(z) dz/z for n ≥ 0;” The differential recursion as a defining property.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Lemma 2.8, p. 9 (arXiv v2): “Lemma 2.8. Let z ∈ C_p such that |z|_p < 1. Then d/dz Li_{k1,···,km}(z) = (1/z) Li_{k1,···,km−1}(z) (km ≠ 1), (1/(1−z)) Li_{k1,···,km−1}(z) (km = 1)” The recursion on the disc of 0 (case m = 1).
- Finite and p-adic polylogarithms, Proof of Theorem 1.1, p. 4 (arXiv v1): “D Li_k(z) = z(1 − z) d/dz Li_k(z) = z(1 − z) Li_{k−1}(z) (1/z) = (1 − z) Li_{k−1}(z)” The recursion used pointwise on residue discs.

#### Theorem. The distribution relation

*Node* `ColemanIntegration:L2/distribution-relation`.

For every branch parameter a ∈ C_p, every k ≥ 0, every m ≥ 1 and every z ∈ C_p with z^m ≠ 1: Σ_{ζ∈μ_m} Li^a_k(ζz) = m^{1−k}·Li^a_k(z^m), where μ_m ⊂ C_p is the group of m-th roots of unity (all ζz ≠ 1 because z^m ≠ 1). Equivalently Li^a_k(z^m) = m^{k−1}Σ_{ζ^m=1}Li^a_k(ζz). For p ∤ m the same identity holds for the modified polylogarithm Li^{(p),a}_k wherever z^{pm} ≠ 1. (The extension to z^m = 1 for k ≥ 2, with Li_k(1) = ζ_p(k), is part of ColemanIntegration:L2/value-at-one.)

*Hypotheses.* a ∈ C_p; k ≥ 0; m ≥ 1; z ∈ C_p with z^m ≠ 1 (z = 0 allowed). The same branch a on both sides; log_a(ζ) = 0 for roots of unity, so no branch term appears.

*Proof outline.*

1. k = 0: Σ_{ζ∈μ_m} ζz/(1 − ζz) = m·z^m/(1 − z^m), an identity of rational functions (both sides equal Σ_{n: m|n} m z^n on |z| < 1, since Σ_{ζ∈μ_m} ζ^n = m·[m | n]; mathlib:IsPrimitiveRoot).
2. k = 1: Π_{ζ∈μ_m}(1 − ζz) = 1 − z^m and log_a is a homomorphism (ColemanIntegration:L0/log-branch), so Σ_ζ −log_a(1 − ζz) = −log_a(1 − z^m).
3. On D⁻(0,1) for all k: the power series identity Σ_ζ Σ_n (ζz)^n/n^k = m Σ_j z^{mj}/(mj)^k = m^{1−k}Li_k^ser(z^m).
4. Reduction of m: if the relation holds for m_1 and m_2 then it holds for m_1m_2 (write μ_{m_1m_2} as a union of cosets ημ_{m_2}, apply the relation for m_2 at ηz, then for m_1 at z^{m_2}, using that η ↦ η^{m_2} maps μ_{m_1m_2} onto μ_{m_1} with fibres of size m_2); so it suffices to treat m prime to p and m = p.
5. m prime to p: G_k(z) := Σ_ζ Li^a_k(ζz) − m^{1−k}Li^a_k(z^m) is a Coleman function on P¹ ∖ ({0, ∞} ∪ μ_m), a curve with good reduction because μ_m has distinct reductions, obtained by pullback of Li^a_k along z ↦ ζz and z ↦ z^m (ColemanIntegration:L1/coleman-pullback). m = p: the maps z ↦ ζz (ζ ∈ μ_p ⊂ D⁻(1,1)) are rigid automorphisms of the wide open neighbourhoods U_λ of U for λ > |ζ − 1|, and z ↦ z^p is the Frobenius lift, so G_k is a Coleman function on U_λ (ColemanIntegration:L1/coleman-pullback, change of variables).
6. dG_k = G_{k−1}dz/z, because d(z^m)/z^m = m·dz/z and m·m^{1−k} = m^{1−(k−1)} (ColemanIntegration:L2/differential-recursion); G_0 = 0 by the first step, and G_k = 0 on D⁻(0,1). By induction and the uniqueness principle (ColemanIntegration:L1/coleman-uniqueness-principle) G_k ≡ 0 on the wide open.
7. Extension to the punctured discs of 1 and ∞ (ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs). On D⁻(1,1) ∖ μ_m write m = p^r m' with p ∤ m': the terms with ζ ∉ μ_{p^r} are analytic on D⁻(1,1); for ξ ∈ μ_{p^r}, Li^a_k(ξz) = λ_k(ξz) − log(z)^{k−1}log_a(1 − ξz)/(k−1)!, and since Π_{ξ∈μ_{p^r}}(1 − ξz) = 1 − z^{p^r} and 1 − z^m = (1 − z^{p^r})·Π_{η∈μ_{m'}∖{1}}(1 − ηz^{p^r}) with the last product a unit analytic on D⁻(1,1), the logarithmic terms of G_k cancel, so G_k is analytic on D⁻(1,1) off μ_m and extends analytically across it; it vanishes on the outer annulus, hence on the disc (uniqueness of power series expansions: mathlib:HasFPowerSeriesAt.eq_zero_of_eventually with mathlib:HasFPowerSeriesOnBall.changeOrigin). On {|z| > 1}, G_k is a polynomial in log_a(1/z) with coefficients analytic in 1/z on the whole disc; it vanishes on the outer annulus, so all coefficients vanish.
8. The modified version for p ∤ m: ζ ↦ ζ^p permutes μ_m, so Σ_ζ Li^a_k(ζ^pz^p) = m^{1−k}Li^a_k(z^{pm}); subtract p^{−k} times this from the relation at z.

*Acceptance.*

- m = 2, k = 2, p = 5, z = 2: Li_2(2) + Li_2(−2) = 2^{−1}Li_2(4) holds to the working 5-adic precision; likewise at z = 7 (a non-root of unity in the residue disc of 2) for k = 2, 3 (GP; the defect decreases by a factor 5 when the truncation level of the limit formula is raised by one).
- p = 7, z = i (order 4, f = 2): Li_k(i) + Li_k(−i) = 2^{1−k}Li_k(−1) for k = 1, 2, 3 (GP in Q_7(i)).
- k = 1: the relation is Π_ζ(1 − ζz) = 1 − z^m, including the branch.

*Uses.* `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L2/differential-recursion`, `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L2/existence-and-uniqueness-of-coleman-polylogarithms`, `ColemanIntegration:L2/polylogarithm-power-series`, `ColemanIntegration:L0/log-branch`, `ColemanIntegration:L1/punctured-line-coleman-functions`, `ColemanIntegration:L1/coleman-functions`, `ColemanIntegration:L1/coleman-pullback`, `ColemanIntegration:L1/coleman-uniqueness-principle`, `mathlib:IsPrimitiveRoot`, `mathlib:HasFPowerSeriesAt.eq_zero_of_eventually`, `mathlib:HasFPowerSeriesOnBall.changeOrigin`.

*Planet:* Distribution relation.

*Sources.*

- The syntomic regulator for the K-theory of fields, §2, (2.4), p. 876 (published); p. 10 of arXiv v2: “If m and n are integers at least equal to 2, then on C_p Li_n(z^m) = m^{n−1} Σ_{ζ^m=1} Li_n(ζz). (2.4) Clearly the same formula holds for n = 1 provided 1 − z^m ≠ 0.” The theorem (quoted from Coleman, Proposition 6.1, as corrected).
- On the p-adic Beilinson conjecture for number fields, §4, (4.11), p. 20 (arXiv v2): “Li_{n,p}(z^m) = m^{n−1} Σ_{ζ^m=1} Li_{n,p}(ζz) when m ≥ 1 and z^m ≠ 1.” The same relation for all n ≥ 0 with the hypothesis z^m ≠ 1 used here.
- Finite and p-adic polylogarithms, §3, p. 6 (arXiv v1): “This determines Li_n up to a locally constant function and a Frobenius condition replaces this by a globally constant function ambiguity. As remarked by Kontsevich the distribution relation removes the ambiguity completely.” The role of the relation in characterising Li_n (see ColemanIntegration:L2/locally-analytic-antiderivatives-and-a-non-example).

#### Theorem. The inversion relation

*Node* `ColemanIntegration:L2/inversion-relation`.

For every branch parameter a ∈ C_p, every k ≥ 0 and every z ∈ C_p ∖ {0, 1}: Li^a_k(z) + (−1)^k·Li^a_k(1/z) = −log_a(z)^k/k!. Consequences: (i) for |z| > 1, Li^a_k(z) = (−1)^{k+1}Li_k^ser(1/z) − log_a(z)^k/k!, the explicit form of Li^a_k on the residue disc of ∞; (ii) for every root of unity ζ ≠ 1, Li^a_k(ζ^{−1}) = (−1)^{k+1}Li^a_k(ζ) (log_a ζ = 0); (iii) Li^{(p),a}_k(1/z) = (−1)^{k+1}Li^{(p),a}_k(z) whenever z^p ≠ 1. The right-hand side has no Bernoulli-polynomial term, unlike the complex inversion formula of Polylogarithms P.1/classical-inversion, because there is no 2πi in C_p.

*Hypotheses.* a ∈ C_p, the same branch on both sides; k ≥ 0; z ∉ {0, 1}.

*Proof outline.*

1. F_k(z) := Li^a_k(z) + (−1)^k Li^a_k(1/z) + log_a(z)^k/k! is a Coleman function on U: z ↦ 1/z is an automorphism of (P¹, {0,1,∞}) over Z_p commuting with the Frobenius lift z ↦ z^p, so pullback preserves Coleman functions (ColemanIntegration:L1/coleman-pullback).
2. F_0 = z/(1 − z) + 1/(z − 1) + 1 = 0, and dF_k = F_{k−1}dz/z because d(1/z)/(1/z) = −dz/z (ColemanIntegration:L2/differential-recursion); by induction F_k has zero differential, so it is a constant C_k (ColemanIntegration:L1/coleman-uniqueness-principle).
3. C_k = 0 for k ≥ 1: F_k satisfies the distribution relation Σ_{ζ∈μ_m}F_k(ζz) = m^{1−k}F_k(z^m) (ColemanIntegration:L2/distribution-relation for both Li-terms; for the logarithm, Σ_ζ log_a(ζz)^k = m·log_a(z)^k = m^{1−k}log_a(z^m)^k); for the constant this reads m·C_k = m^{1−k}C_k with m = 2, so C_k = 0.
4. Extension to the punctured discs: on D⁻(0,1) ∖ {0} and on {|z| > 1}, F_k is a polynomial in log_a z with coefficients analytic on the whole punctured disc and extending across its centre (ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs); it vanishes on the outer annulus, hence identically; on D⁻(1,1) ∖ {1} both z and 1/z lie in D⁻(1,1), the logarithmic terms cancel (log_a(1 − 1/z) = log_a(1 − z) − log(z) because 1 − 1/z = (z − 1)/z and log_a(−1) = 0, and log(1/z) = −log z), leaving λ_k(z) + (−1)^kλ_k(1/z) − log(z)^k/(k−1)! + log(z)^k/k!, analytic on D⁻(1,1); it vanishes on the outer annulus, hence on the disc.
5. (i) is the case z ↦ 1/z with |1/z| < 1, using Li^a_k = Li_k^ser on D⁻(0,1); (ii) uses log_a ζ = 0; (iii) subtract p^{−k} times the relation at z^p, using log_a(z^p)^k = p^k log_a(z)^k.

*Acceptance.*

- p = 5: Li_3(2) − Li_3(1/2) = −log(2)^3/6 to the working precision (GP).
- Li_k(ζ) + (−1)^k Li_k(ζ^{−1}) = 0 at ζ = teichmuller(2) ∈ Z_5 for k = 1, …, 4, and at ζ = i ∈ Q_7(i) for k = 1, 2, 3 (GP); the complex analogue at x = 1/5 is −(2πi)^k B_k(1/5)/k! ≠ 0 (mpmath).
- k = 1: −log_a(1 − z) + log_a(1 − 1/z) = −log_a(z) since 1 − 1/z = −(1 − z)/z.

*Uses.* `ColemanIntegration:L2/distribution-relation`, `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L2/differential-recursion`, `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L2/polylogarithm-power-series`, `ColemanIntegration:L0/log-branch`, `ColemanIntegration:L1/punctured-line-coleman-functions`, `ColemanIntegration:L1/coleman-uniqueness-principle`, `ColemanIntegration:L1/coleman-pullback`.

*Planet:* Inversion relation.

*Sources.*

- The syntomic regulator for the K-theory of fields, §1, (1.2), p. 869 (published); p. 3 of arXiv v2: “These functions satisfy the functional equation (1.2) Li_n(z) + (−1)^n Li_n(1/z) = −(1/n!) log^n(z), see Proposition 6.4 of [11].” The theorem as stated (quoted from Coleman).
- On the p-adic Beilinson conjecture for number fields, §4, p. 20 (arXiv v2): “the Li_{n,p}(z) for n ≥ 0 and z in C_p \ {1} satisfy Li_{n,p}(z) + (−1)^n Li_{n,p}(1/z) = −(1/n!) log^n_p(z) when z ≠ 0” Range of validity: all n ≥ 0 and z ∉ {0, 1}.
- A note on functional equations of the p-adic polylogarithms, §4, (*) before Lemma 4.2, p. 362: “The p-adic k-th polylogarithm satisfies the functional equation (*) Li_k(1/z) = (−1)^{k+1}Li_k(z) + (−1)^{k+1}(1/k!)log^k z (see [C], Proposition 6.4).” The same relation, solved for Li_k(1/z).

#### Theorem. Dependence of the polylogarithms on the branch of the logarithm

*Node* `ColemanIntegration:L2/branch-dependence`.

Let a, b ∈ C_p, β := a − b = log_a(p) − log_b(p), and v = v_p (v(p) = 1), so that log_a(z) − log_b(z) = v(z)·β for z ∈ C_p^×. For every k ≥ 1 and z ∈ C_p ∖ {1}: Li^a_k(z) − Li^b_k(z) = −(β/k!)·v(1 − z)·Σ_{j=0}^{k−1} log_a(z)^{k−1−j}·log_b(z)^j. Consequently: (i) Li^a_k = Li^b_k on {|z − 1| = 1, |z| ≤ 1}, i.e. on the residue disc of 0 and on every residue disc of U; (ii) on D⁻(1,1) ∖ {1}, Li^a_k(z) − Li^b_k(z) = −β·v(1 − z)·log(z)^{k−1}/(k−1)!, so λ_k and ζ_p(k) (k ≥ 2) do not depend on the branch; (iii) on {|z| > 1}, Li^a_k(z) − Li^b_k(z) = −(log_a(z)^k − log_b(z)^k)/k!; (iv) for k ≥ 2, Li^a_k(ζ) is independent of a at every root of unity ζ ≠ 1, while Li^a_1(ζ) − Li^b_1(ζ) = −β/(p^{r−1}(p−1)) for ζ of exact order p^r (r ≥ 1) and 0 for ζ of order not a power of p; (v) the modified Li^{(p),a}_k is independent of a on {|z − 1| > p^{−1/(p−1)}}.

*Hypotheses.* a, b ∈ C_p arbitrary; k ≥ 1; z ≠ 1 (for k ≥ 2 also z = 1, where both sides vanish).

*Proof outline.*

1. log_a(z) − log_b(z) = v(z)β: both are homomorphisms agreeing on units and differing by β on p (ColemanIntegration:L0/log-branch).
2. On D⁻(0,1) both functions equal Li_k^ser; on each residue disc of U the Coleman functions with branches a and b coincide, since the transport ι_{a,b} of ColemanIntegration L1 changes only log_a of the local parameters at 0, 1, ∞ and maps Li^a_k to Li^b_k (both satisfy the characterisation of ColemanIntegration:L2/existence-and-uniqueness-of-coleman-polylogarithms). There v(1 − z) = 0, which gives (i).
3. On D⁻(1,1) ∖ {1}: Li^c_k = λ_k − log(z)^{k−1}log_c(1 − z)/(k−1)! with λ_k independent of c (ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs); subtract and use log_a(1 − z) − log_b(1 − z) = v(1 − z)β; since log_a z = log_b z = log z there, the sum in the formula is k·log(z)^{k−1}, which gives (ii).
4. On {|z| > 1}: Li^c_k(z) = (−1)^{k+1}Li_k^ser(1/z) − log_c(z)^k/k! (ColemanIntegration:L2/inversion-relation); subtract, factor log_a^k − log_b^k = (log_a − log_b)Σ_j log_a^{k−1−j}log_b^j and use v(z) = v(1 − z) for |z| > 1.
5. (iv): log_a ζ = 0 for roots of unity, which kills the sum for k ≥ 2; for k = 1 the formula is −β·v(1 − ζ), and v(1 − ζ) = 1/(p^{r−1}(p−1)) for ζ of order p^r and 0 otherwise (ColemanIntegration:L2/residue-discs-of-roots-of-unity). (v): from (ii) and (iii) at z and z^p, using v(1 − z^p) = p·v(1 − z) when p^{−1/(p−1)} < |z − 1| < 1 and log(z^p) = p·log z.

*Acceptance.*

- k = 2, z = 1/p: Li^a_2(1/p) − Li^b_2(1/p) = −(a² − b²)/2, both from the formula (v(1 − 1/p) = −1) and from Li^c_2(1/p) = −Li_2^ser(p) − c²/2.
- k = 1, z = 1 − p: Li^a_1(1 − p) − Li^b_1(1 − p) = −β, the formula with v(p) = 1.
- GSWZ's remark that the p-adic dilogarithm depends on the choice of log only in the residue discs around 1 and ∞ is (i).

*Uses.* `ColemanIntegration:L2/inversion-relation`, `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L2/existence-and-uniqueness-of-coleman-polylogarithms`, `ColemanIntegration:L2/residue-discs-of-roots-of-unity`, `ColemanIntegration:L0/log-branch`, `ColemanIntegration:L1/punctured-line-coleman-functions`, `ColemanIntegration:L0/log-branch-change`, `ColemanIntegration:L1/branch-independence-principle`.

*Planet:* Branch dependence.

*Sources.*

- The syntomic regulator for the K-theory of fields, §2, (2.5) and Proposition 2.6, p. 876 (published); p. 10 of arXiv v2: “Let β = log_a p − log_b p, and let v be the valuation such that v(p) = 1. Note that (2.5) log_a(z) − log_b(z) = v(z)β. Proposition 2.6. We have (2.7) Li_{n,a}(z) − Li_{n,b}(z) = −(1/n!) v(1 − z)β (log_a^{n−1} z + log_a^{n−2} z log_b z + ··· + log_b^{n−1} z).” The theorem.
- The syntomic regulator for the K-theory of fields, Proof of Proposition 2.6, p. 876 (published): “the polylogarithm depends on the branch of the log chosen only on residue discs where one of the forms involved in the definition, i.e., dz/z and dz/(z − 1), has a pole. This means that Li_{n,a} and Li_{n,b} can differ at most on the residue discs of 0, 1 and ∞” Consequence (i) and the first step of the proof.
- The Habiro ring of a number field, §3.1, before (174), p. 37 (arXiv v2): “(The values of the dilogarithm only depend on this choice in the residue discs around 1 and ∞ and importantly the primes we consider will never require us to evaluate here.)” Consequence (i) for k = 2, as used by the consumers.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Proposition 2.3, p. 8 (arXiv v2): “Proposition 2.3 (Branch Independency Principle). Suppose that a, b ∈ C_p. Then ι_{a,b}(A^a_Col) = A^b_Col, τ_{a,b}(A^a_Col ⊗ Ω†) = A^b_Col ⊗ Ω† and ι_{a,b} ∘ ∫_(a) = ∫_(b) ∘ τ_{a,b} mod C_p · 1.” The transport of Coleman functions between branches used in the proof.

#### Theorem. Compatibility with automorphisms and embeddings of the coefficients

*Node* `ColemanIntegration:L2/galois-equivariance`.

Let σ be a continuous field automorphism of C_p (equivalently, the continuous extension of an automorphism of Q̄_p over Q_p; σ fixes Q_p and preserves |·|). For every a ∈ C_p, k ≥ 0 and z ∈ C_p ∖ {1}: σ(Li^a_k(z)) = Li^{σ(a)}_k(σ(z)); also σ(ζ_p(k)) = ζ_p(k) for k ≥ 2 and σ(Li^{(p),a}_k(z)) = Li^{(p),σ(a)}_k(σ(z)). In particular, for a ∈ Q_p (for instance the Iwasawa branch a = 0), Li^a_k commutes with every continuous automorphism of C_p: for a finite Galois extension L/Q_p inside C_p, z ∈ L and τ ∈ Gal(L/Q_p), τ(Li^a_k(z)) = Li^a_k(τ z) (the values lie in L by ColemanIntegration:L2/values-in-finite-extensions). This is the compatibility with coefficient embeddings: if F is a number field, z ∈ F and ι, ι' : F → C_p are embeddings with ι' = σ∘ι, then Li_k(ι'(z)) = σ(Li_k(ι(z))). For k ≥ 2 and z a root of unity ζ ≠ 1, the conclusion holds for every a, because Li^a_k(ζ) does not depend on a.

*Hypotheses.* σ a continuous ring automorphism of C_p; a ∈ C_p; k ≥ 0; z ≠ 1.

*Proof outline.*

1. Transport of structure: for a function F on (a subset of) C_p put (σ·F)(z) := σ(F(σ^{−1}z)). Then σ·(log_a) = log_{σ(a)}: both are homomorphisms C_p^× → C_p, they agree on 1 + m_{C_p} because σ is continuous and fixes the rational coefficients of the logarithm series, and σ(log_a p) = σ(a) with σ(p) = p (ColemanIntegration:L0/log-branch-field-compatibility).
2. σ· maps the class 𝒞^a of ColemanIntegration:L2/elementary-characterisation onto 𝒞^{σ(a)}: σ is an isometric field automorphism, so it maps residue discs to residue discs and a power series in z − x converging on D⁻(x,1) to the power series in z − σ(x) with coefficients transformed by σ, converging on D⁻(σ(x),1); likewise Laurent series on the punctured discs of 1 and ∞, while log_a(z − 1) and log_a(1/z) become log_{σ(a)}(z − 1) and log_{σ(a)}(1/z) by the first step. The operation commutes with z·d/dz, and a power series g(v) converging for |v| < p^{1/(p−1)} goes to the series σ(g) with the same radius.
3. σ·Li^a_k satisfies (i)-(iv) of ColemanIntegration:L2/elementary-characterisation for the branch σ(a): σ·Li_0 = Li_0 because z/(1 − z) has rational coefficients, σ·Li^a_k(0) = 0, d(σ·Li^a_{k+1}) = (σ·Li^a_k)dz/z, and σ·Li^a_k − p^{−k}(σ·Li^a_k)(z^p) = σ(g_k)(1/(1 − z)) because σ(z^p) = σ(z)^p. By the uniqueness in that characterisation σ·Li^a_k = Li^{σ(a)}_k on C_p ∖ {1}.
4. ζ_p(k) = λ_k(1) is independent of the branch (ColemanIntegration:L2/branch-dependence), so σ(ζ_p(k)) = λ_k^{σ(a)}(1) = ζ_p(k); the statement for Li^{(p)} follows since σ(z^p) = σ(z)^p.

*Acceptance.*

- p = 7, ζ = i ∈ Q_7(i) (unramified of degree 2): the nontrivial automorphism sends Li_k(i) to Li_k(−i) for k = 1, 2, 3 (GP, exact in the explicit formula).
- For a ∉ Q_p the conclusion genuinely changes the branch: σ(Li^a_1(1/p)) = σ(−log_a(1 − 1/p)) = −σ(a) − log(1 − p).

*Uses.* `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L2/branch-dependence`, `ColemanIntegration:L2/polylogarithm-power-series`, `ColemanIntegration:L0/log-branch`, `ColemanIntegration:L2/elementary-characterisation`, `ColemanIntegration:L0/log-branch-field-compatibility`.

*Sources.*

- The syntomic regulator for the K-theory of fields, Remark 2.3, pp. 875-876 (published); p. 9 of arXiv v2: “is Galois equivariant in the sense that for every automorphism σ of C_p over L we have that f(z^σ) = (f(z))^σ for every z in U. In particular, if z is defined over L then f(z) is in L.” The Galois equivariance of iterated Coleman integrals defined over L with a branch defined over L.
- The syntomic regulator for the K-theory of fields, Remark 2.3, p. 876 (published): “For Li_n, since the forms are either dlog z or dlog(1 − z), which are all defined over Q_p, this means that if we take a branch log_π, with π in Q_p, then Li_n is Galois equivariant over Q_p.” The case a ∈ Q_p.
- Explicit Coleman integration for hyperelliptic curves, §2, Theorem 5 (Coleman), (c), p. 4 (arXiv v2): “(c) (Change of variables) Let X′ be another curve over O, let W′ be a wide open subspace of X′, and let ψ : W → W′ be any morphism of rigid spaces relative to an automorphism of C_p. Then µ_{W′}(ψ(·), ·) = µ_W(·, ψ*(·)).” Coleman integration is compatible with automorphisms of C_p.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Proof of Theorem 2.25, p. 13 (arXiv v2): “Then from the Galois equivariancy stated in [BdJ] Remark 2.3, it follows that Li^a_{k1,···,km}(z) is Gal(Q̄_p/Q_p)-invariant for z ∈ P¹(Q_p)\{1, ∞} if we take a ∈ Q_p.” Use of the equivariance for values at Q_p-points.

#### Lemma. The limit at z = 1 and the p-adic zeta values

*Node* `ColemanIntegration:L2/value-at-one`.

(a) For k ≥ 2, every branch a and every subfield L ⊂ C_p of finite ramification index over Q_p (L need not be complete or of finite degree), Li^a_k(z) → λ_k(1) as z → 1 with z ∈ L ∖ {1}; the limit ζ_p(k) := λ_k(1) is independent of a and L, and Li^a_k(1) := ζ_p(k) makes Li^a_k continuous on every such L. For k = 1 there is no such limit: Li^a_1(1 − p^n) = −na and Li^a_1(1 − p^n(1 + p)) = −na − log(1 + p), so for a = 0 the two sequences have the different limits 0 and −log(1 + p) ≠ 0. (b) ζ_p(k) = 0 for every even k ≥ 2. (c) For k ≥ 2 the distribution relation holds for all z ∈ C_p: Σ_{ζ∈μ_m}Li^a_k(ζz) = m^{1−k}Li^a_k(z^m); in particular Σ_{ζ∈μ_m}Li^a_k(ζ) = m^{1−k}ζ_p(k), Σ_{ζ∈μ_m, ζ≠1}Li^a_k(ζ) = (m^{1−k} − 1)ζ_p(k), and for p odd ζ_p(k) = Li_k(−1)/(2^{1−k} − 1). (d) λ_2(z) = −Li_2^ser(1 − z) on D⁻(1,1).

*Hypotheses.* k ≥ 2 in (a)-(d); L ⊂ C_p with e(L/Q_p) < ∞; p any prime (for the formula with Li_k(−1), p odd so that −1 is not in the residue disc of 1).

*Proof outline.*

1. (a) On D⁻(1,1) ∖ {1}, Li^a_k(z) − λ_k(z) = −log(z)^{k−1}log_a(1 − z)/(k−1)! (ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs). For z ∈ L near 1, |log z| = |z − 1|, and writing 1 − z = u·π_L^n with u ∈ O_L^×, log_a(1 − z) = n·log_a(π_L) + log(u) where |log(u)| is bounded on O_L^× because L is finitely ramified (a power u^{s p^c} with p ∤ s, p^c > e_L, is ≡ 1 mod p). Hence |log(z)^{k−1}log_a(1 − z)| ≤ C_L·|z − 1|·(1 + |n|) → 0 (k − 1 ≥ 1), and λ_k is continuous at 1. Independence of a: ColemanIntegration:L2/branch-dependence.
2. k = 1: −log_a(p^n) = −na and log_a(−1) = 0; log(1 + p) ≠ 0 because 1 + p is not a root of unity (for p = 2 use 1 + 4).
3. (b) Let z → 1 in Q_p in the inversion relation Li^a_k(z) + (−1)^k Li^a_k(1/z) = −log_a(z)^k/k! (ColemanIntegration:L2/inversion-relation): both Li-terms tend to ζ_p(k) and the right side to 0, so (1 + (−1)^k)ζ_p(k) = 0.
4. (c) Given z_0 with z_0^m = 1, approach z_0 by z ∈ Q_p(z_0) with z^m ≠ 1 and apply ColemanIntegration:L2/distribution-relation; every term is continuous at z_0 along Q_p(z_0) (terms with ζz_0 ≠ 1 are locally analytic there, the others by (a)). Put z_0 = 1; for p odd take m = 2 and use that −1 is not in the residue disc of 1.
5. (d) λ_2(z) = λ_2(1) − Li_2^ser(1 − z) (continuation lemma) and λ_2(1) = ζ_p(2) = 0 by (b).

*Acceptance.*

- ζ_p(2) = ζ_p(4) = 0; numerically Li_2(−1) = 0 for p = 5 to the working precision (GP).
- p = 5: ζ_5(3) = −(4/3)Li_3(−1) has 5-adic valuation 3 (GP), and with this value the Frobenius relation on the residue disc of 1 (at z = 1 + t, t^8 = 5) holds to the working precision.
- Coleman's formula ζ_p(k) = p^k(p^k − 1)^{−1}L_p(k, ω^{1−k}) (Furusho (2.2)-(2.3)) is the trivial-character case of ColemanIntegration L3 and is not used here.

*Uses.* `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L2/distribution-relation`, `ColemanIntegration:L2/inversion-relation`, `ColemanIntegration:L2/branch-dependence`, `ColemanIntegration:L0/log-branch`.

*Sources.*

- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Notation 2.12 and Theorem 2.13, p. 10 (arXiv v2): “Moreover if it converges on C_p, this limit value is independent of any choice of branch parameter a ∈ C_p.” Branch independence of lim′_{z→1} (Theorem 2.13); lim′ is the limit along sequences in finitely ramified fields (Notation 2.12).
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Lemma 2.14, p. 11 (arXiv v2): “Lemma 2.14. For n ⩾ 0, lim′_{ǫ→0} ǫ(log^a ǫ)^n = 0.” The estimate used in (a).
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Theorem 2.18 and Examples 2.19(a), pp. 11-12 (arXiv v2): “(a) When n is even (i.e. n = 2k for some k ⩾ 1), by (2.3) we get the equality ζ_p(2k) = 0.” (b); Furusho derives it from Coleman's formula (2.3), here it is derived from the inversion relation.
- The syntomic regulator for the K-theory of fields, §2, p. 876 (published); p. 10 of arXiv v2: “If L is a complete finitely ramified extension of Q_p then the limit lim_{z→1, z∈L} Li_n(z) exists for n ⩾ 2, and is independent of L. Using this limit as the value for Li_n at 1, Li_n extends to a function on C_p” (a) and the definition of Li_n(1).
- On the p-adic Beilinson conjecture for number fields, Proof of Proposition 4.17 (case N = 2), p. 23 (arXiv v2): “Coleman proves that L_p(n, ω_p^{1−n}, Q) = (1 − p^{−n}) lim′_{x→1} Li_{n,p}(x) where the limit is taken in any subfield of C_p that is of finite ramification degree over Q_p.” The limit ζ_p(n) and its role for the trivial character (used by ColemanIntegration L3).

#### Comparison. Local antiderivatives do not determine Li_k: the ambiguity and a non-example

*Node* `ColemanIntegration:L2/locally-analytic-antiderivatives-and-a-non-example`.

Let k ≥ 2 and a ∈ C_p. Call F : C_p ∖ {1} → C_p a local antiderivative of Li^a_{k−1}dz/z normalised at 0 if F(0) = 0, F is analytic on D⁻(0,1) and on every residue disc D⁻(x,1) with |x| = |x − 1| = 1, F is a polynomial in log_a(z − 1) (resp. log_a(1/z)) with coefficients analytic on the whole punctured disc 0 < |z − 1| < 1 (resp. |z| > 1), and dF = Li^a_{k−1}dz/z. (a) These F are exactly Li^a_k + c(z̄), where c is an arbitrary function on P¹(F̄_p) ∖ {0} evaluated at the reduction z̄ of z (constant on each residue disc, on the punctured disc of 1 and on {|z| > 1}): an infinite-dimensional affine space. (b) Among them Li^a_k is the unique one that is a Coleman function; it is also the unique one satisfying the distribution relation for m = p, Σ_{ζ∈μ_p}F(ζz) = p^{1−k}F(z^p) (Kontsevich's remark). (c) Non-example: p = 5, k = 2, G := Li^a_2 + 1 on the residue disc of 2 and G := Li^a_2 elsewhere. G is a local antiderivative of Li^a_1dz/z normalised at 0 and agrees with Li_2^ser on D⁻(0,1), but G(2) + G(−2) − 2^{−1}G(4) = 1 ≠ 0 (2, −2 ≡ 3 and 4 lie in three different residue discs), so G violates the distribution relation with m = 2 and is not a Coleman function. Hence the normalisation at 0 together with the differential equation on each residue disc does not characterise Li^a_k; the Frobenius structure (Coleman's theory) or the distribution relation does.

*Hypotheses.* k ≥ 2 (for k = 1 there is no integration constant: Li^a_1 = −log_a(1 − z)); a ∈ C_p.

*Proof outline.*

1. (a) F − Li^a_k has zero derivative. On a disc a convergent power series with zero derivative is constant (characteristic 0); on a punctured disc an element of A(D)[log] with zero differential is constant (ColemanIntegration:L0/annulus-log-primitive); F(0) = 0 = Li^a_k(0) gives c(0̄) = 0. Conversely every such c gives a local antiderivative.
2. (b) Coleman: if F is a Coleman function then F − Li^a_k is a Coleman function with zero differential, hence a global constant (ColemanIntegration:L1/coleman-uniqueness-principle), equal to its value 0 at 0.
3. (b) Distribution: for F = Li^a_k + c, all ζz (ζ ∈ μ_p) reduce to z̄, so the defect of the relation for m = p is p·c(z̄) − p^{1−k}c(z̄^p) (ColemanIntegration:L2/distribution-relation for Li^a_k). If it vanishes, c(x^p) = p^k c(x) for all x ∈ P¹(F̄_p) ∖ {0}; every x has x^{p^f} = x for some f ≥ 1 (x = 1 and ∞ are fixed), so c(x) = p^{kf}c(x) and c(x) = 0.
4. (c) Li^a_2 satisfies the relation at z = 2 (distribution relation); G differs from Li^a_2 only at the first term.

*Acceptance.*

- The defect in (c) is exactly the added constant, independently of p-adic precision.
- Adding 1 on the residue disc of 1 instead (G := Li^a_2 + 1 on D⁻(1,1) ∖ {1}) violates the relation for m = p at any z ∈ D⁻(1,1): the defect is p − p^{−1}.

*Uses.* `ColemanIntegration:L2/distribution-relation`, `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L2/existence-and-uniqueness-of-coleman-polylogarithms`, `ColemanIntegration:L1/coleman-uniqueness-principle`, `ColemanIntegration:L0/annulus-log-transcendence`, `ColemanIntegration:L0/annulus-log-primitive`.

*Sources.*

- The syntomic regulator for the K-theory of fields, §2, p. 875 (published); p. 8 of arXiv v2: “Each ω ∈ Ω¹_loc(U) can be integrated in A_loc(U) in many ways, because we can choose a different constant of integration for each U_y. Coleman's theory finds a subclass of forms for which one can assign canonically an integral in A_loc(U) defined up to a global constant.” Statement (a) and the role of Coleman's theory in (b).
- Finite and p-adic polylogarithms, §3, p. 6 (arXiv v1): “This determines Li_n up to a locally constant function and a Frobenius condition replaces this by a globally constant function ambiguity. As remarked by Kontsevich the distribution relation removes the ambiguity completely.” Statement (b), the distribution characterisation.
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, §3.1, before Theorem 3.3, p. 15 (arXiv v2): “Unfortunately, because P¹(C_p)\{0, 1, ∞} is topologically totally disconnected, the equation (KZ^p) does not have a unique solution on P¹(C_p)\{0, 1, ∞} even locally as in the complex analytic function case.” Why a local differential equation does not determine the solution.

#### Lemma. Overconvergence of the modified polylogarithm: the series g_k(v)

*Node* `ColemanIntegration:L2/overconvergent-expansion-of-the-modified-polylogarithm`.

Put v := 1/(1 − z); it identifies P¹ ∖ D⁻(1,1) with the closed disc |v| ≤ 1 (z = 0 ↦ v = 1, z = ∞ ↦ v = 0, the residue disc of 1 ↦ |v| > 1). Define g_0(v) := v − 1 − (v − 1)^p/(v^p − (v − 1)^p) and, for k ≥ 1, g_k(v) := ∫_1^v g_{k−1}(w)·dw/(w(w − 1)). Then for every k ≥ 0: g_k is a power series in v with coefficients in Q_p converging on the open disc D⁻(0, p^{1/(p−1)}) (radius at least p^{1/(p−1)}; for k = 0 exactly, the poles being v = (1 − ζ)^{−1}, ζ ∈ μ_p ∖ {1}); g_k(0) = g_k(1) = 0; g_k(1 − v) = (−1)^{k+1}g_k(v); g_1(v) = p^{−1}·log(±(v^p − (v − 1)^p)) with the sign making the argument a principal unit; and ℓ_k(z) = g_k(1/(1 − z)) for all z ∈ P¹ ∖ D⁻(1,1), where ℓ_k is ColemanIntegration:L2/integral-modified-polylogarithm.

*Hypotheses.* k ≥ 0; p any prime; D⁻(0, p^{1/(p−1)}) = {v ∈ C_p : |v| < p^{1/(p−1)}}.

*Proof outline.*

1. g_0 is a rational function whose poles are the zeros of v^p − (v − 1)^p, i.e. v = (1 − ζ)^{−1} for ζ ∈ μ_p ∖ {1}, all of absolute value p^{1/(p−1)} (ColemanIntegration:L2/residue-discs-of-roots-of-unity); so g_0 is analytic on D⁻(0, p^{1/(p−1)}), and g_0(0) = g_0(1) = 0 by evaluation.
2. Induction: if g_{k−1} is analytic on the open disc and vanishes at 0 and 1, then g_{k−1}(w)/(w(w − 1)) is analytic on the same open disc (dividing a convergent power series by w − c at a zero c of it inside the disc preserves convergence on the disc), so its primitive vanishing at 1 is analytic on the same disc (ColemanIntegration:L0/disc-primitive-unique); this is g_k.
3. On the closed disc |v| ≤ 1: ℓ_k(1 − 1/v) is analytic there (ColemanIntegration:L2/integral-modified-polylogarithm (i), (iii)); t = 1 − 1/v gives dt/t = dv/(v(v − 1)), so t·dℓ_k/dt = ℓ_{k−1} becomes the recursion defining g_k, and ℓ_k vanishes at t = 0 (v = 1). A power series on the closed unit disc with zero derivative is constant, so ℓ_k(1 − 1/v) = g_k(v) by induction (base k = 0 by the explicit formula).
4. g_k(0) = ℓ_k(∞) = 0 by (iii) of ColemanIntegration:L2/integral-modified-polylogarithm (this is not implied by the differential equation when k is even); symmetry: z ↦ 1/z is v ↦ 1 − v, and ℓ_k(1/z) = (−1)^{k+1}ℓ_k(z).
5. g_1: ℓ_1 = −log(1 − z) + p^{−1}log(1 − z^p) = p^{−1}log((1 − z^p)/(1 − z)^p), and (1 − z^p)/(1 − z)^p = v^p − (v − 1)^p ≡ 1 mod p for p odd (for p = 2 it is 2v − 1 = −(1 − 2v)).

*Acceptance.*

- p = 5: the coefficients c_n of g_2 satisfy v_5(c_n) ≈ n/4 (v_5(c_{10j}) = 2, 6, 7, 11, 13, 16, 17, 22, 21, 27, 27, 31, 32, 36, 38 for j = 1, …, 15), consistent with radius 5^{1/4} (GP).
- p = 5: g_k(0) computed from the recursion is 0 to 31-40 digits for k = 1, …, 4, including the even k (GP); g_k(−1) = ℓ_k(2) and g_k(−1/2) = ℓ_k(3) to the precision of the limit formula.
- g_0 has a pole at v = (1 − ζ_p)^{−1}: the relation cannot be continued to |z − 1| ≤ p^{−1/(p−1)}.

*Uses.* `ColemanIntegration:L2/integral-modified-polylogarithm`, `ColemanIntegration:L2/residue-discs-of-roots-of-unity`, `ColemanIntegration:L0/disc-primitive-unique`, `mathlib:HasFPowerSeriesOnBall`, `mathlib:FormalMultilinearSeries.radius`.

*Sources.*

- On the p-adic Beilinson conjecture for number fields, §4, property (4), p. 20 (arXiv v2): “(4) for every n ≥ 0 there is a power series g_n(v), convergent for |v|_p < p^{1/(p−1)}, such that g_n(1/(1 − z)) = Li_{n,p}(z) − (1/p^n) Li_{n,p}(z^p) when |z − 1|_p > p^{−1/(p−1)}.” The statement (with the identification of ColemanIntegration:L2/frobenius-relation).
- The Habiro ring of a number field, §2.1, p. 18 (arXiv v2): “In [11, Prop.6.2] Coleman proves (working with the variable 1/t) that Li^(p)_n(t) ∈ Z_(p)[[t]] is convergent for |t/(1 − t)| < p^{(p−1)^{−1}}” The radius p^{1/(p−1)} in the variable t/(1 − t) = v − 1, attributed to Coleman.
- p-adic polylogarithms and p-adic Hecke L-functions for totally real fields, §1, p. 2 (arXiv v2): “The functions Li^(p)_k(t) extend to rigid analytic functions on the rigid analytic space Û_{Q_p} associated to the p-adic completion Û_{Z_p} of the scheme U := P¹ \ {0, 1, ∞} = G_m \ {1}” Rigid analyticity (on the tube of the special fibre); the present node gives the larger domain.

#### Theorem. Coleman's Frobenius relation for the polylogarithms

*Node* `ColemanIntegration:L2/frobenius-relation`.

For every branch parameter a ∈ C_p, every k ≥ 0 and every z ∈ C_p with |z − 1| > p^{−1/(p−1)} (this includes all z with |z| > 1, all z with |z − 1| = 1, and the points of the residue disc of 1 with p^{−1/(p−1)} < |z − 1| < 1, such as primitive p^r-th roots of unity with r ≥ 2): Li^a_k(z) − p^{−k}·Li^a_k(z^p) = g_k(1/(1 − z)), with g_k the series of ColemanIntegration:L2/overconvergent-expansion-of-the-modified-polylogarithm. Consequently the modified polylogarithm Li^{(p),a}_k is independent of a on this region, is the restriction of a rigid analytic function on the wide open P¹ ∖ D(1, p^{−1/(p−1)}) (an open disc around ∞ in the coordinate v = 1/(1 − z)) vanishing at ∞, and on P¹ ∖ D⁻(1,1) it equals the integral function ℓ_k of ColemanIntegration:L2/integral-modified-polylogarithm (so it takes values in O_{C_p} there and reduces mod p to li_k(z)/(1 − z^p)). The relation is Frobenius equivariance of Coleman integration for the lift φ(z) = z^p, for which φ*(dz/z) = p·dz/z.

*Hypotheses.* a ∈ C_p; k ≥ 0; |z − 1| > p^{−1/(p−1)} (so z^p ≠ 1 and z ≠ 1). The bound is sharp: g_0 has poles at v = (1 − ζ)^{−1}, ζ ∈ μ_p ∖ {1}.

*Proof outline.*

1. Put F_k(z) := Li^a_k(z) − p^{−k}Li^a_k(z^p) and G_k(z) := g_k(1/(1 − z)) on W := {|z − 1| > p^{−1/(p−1)}} ∖ {∞}. On D⁻(0,1), F_k = Σ_{p∤n}z^n/n^k = ℓ_k = G_k (ColemanIntegration:L2/polylogarithm-power-series, ColemanIntegration:L2/integral-modified-polylogarithm, ColemanIntegration:L2/overconvergent-expansion-of-the-modified-polylogarithm).
2. z·dF_k/dz = F_{k−1} (ColemanIntegration:L2/differential-recursion and the chain rule: z·d/dz[p^{−k}Li^a_k(z^p)] = p^{−k}·p·Li^a_{k−1}(z^p)) and z·dG_k/dz = G_{k−1} (the recursion for g_k with dz/z = dv/(v(v − 1))); F_0 = G_0 (explicit).
3. F_k − G_k is locally constant on W: on each residue disc of U and on D⁻(0,1) it is a power series with zero derivative; on the annulus p^{−1/(p−1)} < |z − 1| < 1 and on {|z| > 1} it is an element of A(annulus)[log_a] with zero differential (ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs; z^p lies in the residue disc of 1 when z does), hence constant (ColemanIntegration:L0/annulus-log-primitive). So F_k − G_k = c(z̄) depends only on the residue class, with c(0̄) = 0.
4. Coleman's theory removes the ambiguity: F_k is a Coleman function on a wide open neighbourhood of U, being a combination of Li^a_k and its pullback by the Frobenius lift (ColemanIntegration:L1/punctured-line-coleman-functions; the choice of lift is immaterial by ColemanIntegration:L1/frobenius-lift-independence), and G_k is rigid analytic on the wide open W, hence a Coleman function; their difference has zero differential and is a global constant (ColemanIntegration:L1/coleman-uniqueness-principle), equal to c(0̄) = 0. Each residue class of W meets the wide open, so c ≡ 0 on W.
5. Branch independence follows because G_k does not involve a; the remaining assertions are the properties of g_k and ℓ_k.

*Acceptance.*

- p = 5, z = 7 (residue disc of 2): Li_k(7) − 5^{−k}Li_k(7^5) = ℓ_k(7) for k = 1, 2, 3 to the precision of the limit formula (GP).
- p = 5, z = 1 + t with t^8 = 5 (|z − 1| = 5^{−1/8} > 5^{−1/4}, inside the residue disc of 1): λ_k(z) − 5^{−k}λ_k(z^5) + log(z)^{k−1}(k−1)!^{−1}·5^{−1}log((1 − z^5)/(1 − z)^5) = g_k(1/(1 − z)) for k = 1, 2, 3 to the working precision (GP; the residual is controlled by the precision of ζ_5(3)).
- k = 1: Li_1(z) − p^{−1}Li_1(z^p) = p^{−1}log((1 − z^p)/(1 − z)^p) = g_1(1/(1 − z)), branch-free.

*Uses.* `ColemanIntegration:L2/integral-modified-polylogarithm`, `ColemanIntegration:L2/overconvergent-expansion-of-the-modified-polylogarithm`, `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L2/differential-recursion`, `ColemanIntegration:L2/polylogarithm-power-series`, `ColemanIntegration:L1/punctured-line-coleman-functions`, `ColemanIntegration:L1/coleman-uniqueness-principle`, `ColemanIntegration:L1/frobenius-lift-independence`, `ColemanIntegration:L0/annulus-log-transcendence`, `ColemanIntegration:L0/annulus-log-primitive`, `ColemanIntegration:L1/word-algebra-frobenius`.

*Planet:* Frobenius relation.

*Sources.*

- On the p-adic Beilinson conjecture for number fields, §4, property (4), p. 20 (arXiv v2): “(4) for every n ≥ 0 there is a power series g_n(v), convergent for |v|_p < p^{1/(p−1)}, such that g_n(1/(1 − z)) = Li_{n,p}(z) − (1/p^n) Li_{n,p}(z^p) when |z − 1|_p > p^{−1/(p−1)}.” The theorem as stated there (without proof; attributed to Coleman).
- Finite and p-adic polylogarithms, Proposition 2.1, p. 2 (arXiv v1): “Proposition 2.1. Let Li_n^{(p)}(z) := Li_n(z) − Li_n(z^p)/p^n. Then Li_n^{(p)}(X) ⊂ W and the function Li_n^{(p)} reduces modulo p to (1 − z^p)^{−1} li_n(z).” Integrality and reduction on X = {z ∈ W : |z| = |z − 1| = 1}.
- The syntomic regulator for the K-theory of fields, §2, rules (1)-(3), p. 875 (published): “(1) The integral is additive. (2) When g ∈ A(U), ∫dg = g + C, for some constant C. (3) We have φ*∫ω = ∫φ*ω + C.” Frobenius equivariance of Coleman integration, the mechanism behind the relation.
- p-adic polylogarithms and p-adic Hecke L-functions for totally real fields, §1, p. 2 (arXiv v2): “The functions Li^(p)_k(t) extend to rigid analytic functions on the rigid analytic space Û_{Q_p} associated to the p-adic completion Û_{Z_p} of the scheme U := P¹ \ {0, 1, ∞} = G_m \ {1}” Rigid analyticity of Li^{(p)} (citing Coleman Prop. 6.2).

#### Comparison. An elementary characterisation of the polylogarithms

*Node* `ColemanIntegration:L2/elementary-characterisation`.

Fix a ∈ C_p and let 𝒞^a be the class of functions f : C_p ∖ {1} → C_p such that (1) for every x with |x − 1| = 1, f is given on D⁻(x,1) by a power series in z − x converging there; (2) on 0 < |z − 1| < 1 (resp. |z| > 1), f is a polynomial in log_a(z − 1) (resp. log_a(1/z)) whose coefficients are Laurent series in z − 1 (resp. 1/z) convergent on that punctured disc. Then (Li^a_k)_{k≥0} is the unique sequence in 𝒞^a with (i) Li_0(z) = z/(1 − z); (ii) Li_k(0) = 0; (iii) d Li_{k+1} = Li_k·dz/z; (iv) for each k there is a power series g_k(v) converging for |v| < p^{1/(p−1)} with g_k(1/(1 − z)) = Li_k(z) − p^{−k}Li_k(z^p) whenever |z − 1| > p^{−1/(p−1)}. This characterisation uses no Coleman theory: it may serve as the definition of Li^a_k (the suggested Lean file does this), and the comparison with the Coleman-function definition is the content of the existence theorem, the continuation lemma and the Frobenius relation.

*Hypotheses.* a ∈ C_p; k ≥ 0; the class 𝒞^a depends on the branch only through log_a on the punctured discs of 1 and ∞.

*Proof outline.*

1. Existence: Li^a_k lies in 𝒞^a by ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs and satisfies (i)-(iv) by ColemanIntegration:L2/p-adic-polylogarithm, ColemanIntegration:L2/differential-recursion and ColemanIntegration:L2/frobenius-relation.
2. Uniqueness by induction on k: if (f_k) also satisfies (i)-(iv) and f_{k−1} = Li^a_{k−1}, then c := f_k − Li^a_k has zero derivative and lies in 𝒞^a, so it is constant on each residue disc, on the punctured disc of 1 and on {|z| > 1} (ColemanIntegration:L0/annulus-log-primitive), with c = 0 near 0 by (ii).
3. By (iv) for f_k and for Li^a_k, the function z ↦ c(z) − p^{−k}c(z^p) is, in the coordinate v = 1/(1 − z), the difference of two power series converging on the open disc |v| < p^{1/(p−1)}, hence a power series h on that disc; it is constant (= 0) on the subdisc |v − 1| < 1 corresponding to z ∈ D⁻(0,1), so all derivatives of h at v = 1 vanish and h ≡ 0 on the disc (uniqueness of expansions after re-centring: mathlib:HasFPowerSeriesOnBall.changeOrigin, mathlib:HasFPowerSeriesAt.eq_zero_of_eventually).
4. Hence c(x) = p^{−k}c(x^p) for every residue class x ≠ 1̄ and also on the part of the residue disc of 1 where |z − 1| > p^{−1/(p−1)}; since x^{p^f} = x for some f ≥ 1, c(x) = p^{−kf}c(x), so c = 0 (k ≥ 1).

*Acceptance.*

- The locally-constant modification of ColemanIntegration:L2/locally-analytic-antiderivatives-and-a-non-example lies in 𝒞^a and satisfies (i)-(iii) but violates (iv).
- Condition (iv) alone with (i)-(iii) and without (1)-(2) does not determine f on the residue disc of 1 inside |z − 1| ≤ p^{−1/(p−1)}; condition (2) there is what fixes it.

*Uses.* `ColemanIntegration:L2/frobenius-relation`, `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L2/differential-recursion`, `ColemanIntegration:L2/locally-analytic-antiderivatives-and-a-non-example`, `ColemanIntegration:L0/annulus-log-transcendence`, `ColemanIntegration:L0/annulus-log-primitive`, `mathlib:HasFPowerSeriesOnBall.changeOrigin`, `mathlib:HasFPowerSeriesAt.eq_zero_of_eventually`.

*Sources.*

- On the p-adic Beilinson conjecture for number fields, §4, p. 19 (arXiv v2): “Coleman first produced the p-adic polylogarithm out of a more extensive theory of what is now called Coleman integration. For the p-adic polylogarithm it is, however, possible to give a more elementary and explicit theory.” The elementary theory.
- On the p-adic Beilinson conjecture for number fields, §4, pp. 19-20 (arXiv v2): “The p-adic polylogarithms are functions Li_{n,p}(z) (n ≥ 0) in this class with the following properties: (1) Li_{0,p}(z) = z/(1−z); (2) Li_{n,p}(0) = 0 for n ≥ 0; (3) dLi_{n+1,p}(z) = Li_{n,p}(z) dz/z for n ≥ 0;” Properties (i)-(iii); (iv) is the next item in the source.
- On the p-adic Beilinson conjecture for number fields, §4, class (1), p. 19 (arXiv v2): “(1) for any a ∈ C_p with |a − 1|_p = 1 we have a power series expansion for f(z) in z − a that converges for |z − a|_p < 1;” Condition (1) of the class.

#### Lemma. The p-adic dilogarithm D and its two-term, branch and Frobenius identities

*Node* `ColemanIntegration:L2/dilogarithm-identities`.

For a ∈ C_p and z ∈ C_p ∖ {0, 1} put D^a(z) := Li^a_2(z) + ½·log_a(z)·log_a(1 − z) (Coleman's D; GSWZ's D_p is D^0, the Iwasawa branch; Besser-de Jeu's L_{mod,2}; Wojtkowiak's Rogers function). Then: (a) reflection: Li^a_2(z) + Li^a_2(1 − z) = −log_a(z)·log_a(1 − z); (b) D^a(1 − z) = −D^a(z) and D^a(1/z) = −D^a(z), so D^a is anti-invariant under the six cross-ratio substitutions up to sign; (c) dD^a = ½(log_a(z)·d log(1 − z) − log_a(1 − z)·d log z); (d) D^a(z) − D^b(z) = ½(a − b)·(v(z)·log_b(1 − z) − v(1 − z)·log_b(z)), so D^a is branch-free on special units (|z| = |1 − z| = 1) and at all roots of unity ζ ≠ 1, where D^a(ζ) = Li_2(ζ); (e) Frobenius: D^a(z) − p^{−2}D^a(z^p) = Li^{(p),a}_2(z) − ½·log_a(z)·Li^{(p),a}_1(z) for |z − 1| > p^{−1/(p−1)}, a rigid analytic function of z on each residue disc of U (branch-free there), and for a root of unity ζ of order prime to p this reads D(ζ) − p^{−2}D(ζ^p) = ℓ_2(ζ); (f) σ(D^a(z)) = D^{σ(a)}(σ z) for continuous automorphisms σ of C_p, in particular D^0 commutes with the arithmetic Frobenius of an unramified extension.

*Hypotheses.* a, b ∈ C_p; z ∉ {0, 1}; v = v_p.

*Proof outline.*

1. (a) F(z) := Li^a_2(z) + Li^a_2(1 − z) + log_a(z)log_a(1 − z) is a Coleman function on U (pullback of Li^a_2 by the automorphism z ↦ 1 − z of (P¹, {0,1,∞}); Coleman functions are functorial for morphisms of wide opens and independent of the Frobenius lift: ColemanIntegration:L1/coleman-pullback, ColemanIntegration:L1/frobenius-lift-independence). dF = −log_a(1 − z)dz/z + log_a(z)dz/(1 − z) + log_a(1 − z)dz/z − log_a(z)dz/(1 − z) = 0, so F is constant (ColemanIntegration:L1/coleman-uniqueness-principle). As z → 0 in Q_p: Li^a_2(z) → 0, log_a(z)log(1 − z) → 0 (ColemanIntegration:L2/value-at-one, estimate (a)), and Li^a_2(1 − z) → ζ_p(2) = 0 (ColemanIntegration:L2/value-at-one (b)); so F ≡ 0; the identity extends to the punctured discs of 0, 1, ∞ as in the inversion relation.
2. (b) From (a): D(1 − z) = Li_2(1 − z) + ½log(1 − z)log z = −Li_2(z) − ½log z·log(1 − z) = −D(z). From the inversion relation with k = 2 (ColemanIntegration:L2/inversion-relation) and log_a(1 − 1/z) = log_a(1 − z) − log_a(z): D(1/z) = −Li_2(z) − ½log_a(z)² − ½log_a(z)(log_a(1 − z) − log_a(z)) = −D(z).
3. (c) Direct computation with d Li^a_2 = −log_a(1 − z)dz/z (ColemanIntegration:L2/differential-recursion).
4. (d) ColemanIntegration:L2/branch-dependence with k = 2 gives Li^a_2 − Li^b_2 = −½β·v(1 − z)(log_a z + log_b z); add ½(log_a z·log_a(1 − z) − log_b z·log_b(1 − z)) using log_a = log_b + v(·)β and simplify.
5. (e) Subtract p^{−2} times the definition at z^p, use log_a(z^p) = p·log_a(z) and Li^{(p),a}_1(z) = −log_a(1 − z) + p^{−1}log_a(1 − z^p); then ColemanIntegration:L2/frobenius-relation for k = 1, 2. For ζ of order prime to p, log ζ = 0.
6. (f) ColemanIntegration:L2/galois-equivariance and σ(log_a w) = log_{σ(a)}(σ w).

*Acceptance.*

- p = 5, a ∈ {0, 1}: D(7) + D(1 − 7) = 0 and D(7) + D(1/7) = 0 to the working precision (GP).
- Li^a_2(2) = −Li^a_2(−1) − log_a(2)log_a(−1) = 0 for p odd (reflection at z = 2, with log_a(−1) = 0 and Li_2(−1) = 0).
- Branch: p = 5, D^0(5) = 5 + 4·5² + ⋯ and D^1(5) = 3·5 + 2·5² + ⋯ differ (GP), as (d) predicts (v(5) = 1, v(1 − 5) = 0).

*Uses.* `ColemanIntegration:L2/inversion-relation`, `ColemanIntegration:L2/branch-dependence`, `ColemanIntegration:L2/value-at-one`, `ColemanIntegration:L2/galois-equivariance`, `ColemanIntegration:L2/frobenius-relation`, `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L2/differential-recursion`, `ColemanIntegration:L1/punctured-line-coleman-functions`, `ColemanIntegration:L1/coleman-uniqueness-principle`, `ColemanIntegration:L1/frobenius-lift-independence`, `ColemanIntegration:L0/log-branch`, `ColemanIntegration:L1/coleman-pullback`.

*Sources.*

- The Habiro ring of a number field, §3.1, (174), p. 37 (arXiv v2): “Then Coleman obtains a well-defined function Li_2 : C_p \ {1} → C_p and defines D_p : C_p \ {0, 1} → C_p, z ↦ Li_2(z) + ½ log(z) log(1 − z).” The consumers' normalisation (GSWZ D_p = D^a with a the chosen branch, e.g. the Iwasawa branch).
- The syntomic regulator for the K-theory of fields, §1, p. 870 (published); p. 3 of arXiv v2: “L_2(z) + ½ log(z)L_1(z) = Li_2(z) − ½ log(z)Li_1(z), which is studied in Section 6 and beyond in [11], where it is called D(z).” Identification with Coleman's D.
- A note on functional equations of the p-adic polylogarithms, §4, Example 3, p. 363: “Observe that dim V_{n+1} = n. Hence for n = 1 there is only one function (up to a multiplication by a constant) such that its sequence of coefficients belongs to V_2. This is the Rogers function Li_2(z) + ½ log(z)·log(1 − z).” D as the unique combination anti-invariant under z ↦ 1/z.

#### Theorem. The five-term relation for the p-adic dilogarithm

*Node* `ColemanIntegration:L2/five-term-relation`.

For every a ∈ C_p and all x, y ∈ C_p ∖ {0, 1} with x ≠ y: D^a(x) − D^a(y) + D^a(y/x) − D^a((1 − x^{−1})/(1 − y^{−1})) + D^a((1 − x)/(1 − y)) = 0. Equivalently, for five distinct points s_1, …, s_5 of P¹(C_p), Σ_{i∈Z/5} D^a([s_i, s_{i+1}, s_{i+2}, s_{i+3}]) = 0 with the cross-ratio [s_1,s_2,s_3,s_4] = (s_1 − s_2)(s_3 − s_4)/((s_1 − s_4)(s_3 − s_2)) of Polylogarithms P.1/bloch-wigner-five-term. Hence, for every subfield K ⊂ C_p, [x] ↦ D^a(x) is a homomorphism from the free abelian group on K ∖ {0, 1} modulo the five-term relations (the pre-Bloch group) to C_p, independent of a on the Bloch group. The proof below is complete when some four of the five points have pairwise distinct reductions in P¹(F̄_p) after a Möbius normalisation; for the remaining (maximally degenerate) configurations see the gap recorded for this node.

*Hypotheses.* a ∈ C_p; x, y ∉ {0, 1}, x ≠ y; p any prime.

*Proof outline.*

1. The differential: by ColemanIntegration:L2/dilogarithm-identities (c), dD^a(z) = ½ρ(z, 1 − z) with ρ(f, g) := log_a f·d log g − log_a g·d log f, which is bi-additive and alternating in (f, g) and vanishes when f or g is a root of unity (log_a of a root of unity is 0).
2. The five arguments x_1, …, x_5 of the relation satisfy 1 − x_i = −x_i·x_{i+2}^{−1}x_{i+3}^{−1} (Polylogarithms:P.1/five-cross-ratio-identity), so Σ_i ρ(x_i, 1 − x_i) = 0 identically in (x, y): the signed sum Φ(x, y) of the five terms has zero differential in x for fixed y (and in y for fixed x).
3. Good-reduction case: fix y with |y| = |1 − y| = 1. Then P¹ ∖ {0, 1, ∞, y} has good reduction (distinct reductions), the five maps x ↦ x_i(x, y) are morphisms from it to P¹ ∖ {0, 1, ∞}, and x ↦ Φ(x, y) is a Coleman function there (ColemanIntegration:L1/coleman-pullback: pullback functoriality) with zero differential, hence constant (ColemanIntegration:L1/coleman-uniqueness-principle). Let x → 0 in a finitely ramified field: D^a(x) → 0, D^a(y/x) = −D^a(x/y) → 0, D^a((1 − x^{−1})/(1 − y^{−1})) → 0 (its argument tends to ∞ and D^a(1/w) = −D^a(w)), and D^a((1 − x)/(1 − y)) → D^a(1/(1 − y)) = −D^a(1 − y) = D^a(y) (ColemanIntegration:L2/value-at-one estimate, ColemanIntegration:L2/dilogarithm-identities (b)); so the constant is −D^a(y) + D^a(y) = 0. This gives Φ(x, y) = 0 for all x when y is a special unit.
4. Symmetry: the relation for (s_1, …, s_5) is equivalent, up to an overall sign, to the relation for any permutation of the five points and any Möbius transformation of them (D^a(1/z) = −D^a(z) = D^a(1 − z) and the S_5-action on the five cross-ratios). So the relation holds whenever some four of the five points, moved to (∞, 0, 1, y), have y a special unit, i.e. whenever the stable reduction of the five marked points has a component carrying four special points.
5. Branch independence: D^a − D^b = ½β·(v(z)log_b(1 − z) − v(1 − z)log_b(z)) (ColemanIntegration:L2/dilogarithm-identities (d)) is again an alternating bi-additive expression in (z, 1 − z), so it cancels in the five-term sum by the same identity; the relation for one branch implies it for all.
6. Remaining configurations (stable reduction a chain of three components, e.g. |y| < |x| < 1): every argument lies in a residue disc of 0, 1 or ∞, where D^a is given by explicit convergent log-series (ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs, ColemanIntegration:L2/inversion-relation); on the region Φ is a convergent series in x and y/x with polynomials in log_a x, log_a y as coefficients, both partial differentials vanish, so Φ is constant there, and the limit y → 0 gives 0. This step is not carried out in any source read (gap).

*Acceptance.*

- p = 5, a ∈ {0, 1}: the relation holds for (x, y) = (2, 3), (7, 13) (all five arguments special units), (5, 2) (x in the disc of 0), (6, 3) (x in the disc of 1), and in the maximally degenerate configurations (5, 25) and (1/5, 1/25), where it holds exactly on the truncated series (GP).
- The relation fails if D^a is replaced by Li^a_2: for p = 5 the defect at (x, y) = (2, 3) has valuation 2, and at (5, 25) it vanishes for the Iwasawa branch (log_0 5 = 0 kills the log products) but not for a = 1 (GP).

*Uses.* `ColemanIntegration:L2/dilogarithm-identities`, `ColemanIntegration:L2/value-at-one`, `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L2/inversion-relation`, `Polylogarithms:P.1/five-cross-ratio-identity`, `Polylogarithms:P.1/bloch-wigner-five-term`, `ColemanIntegration:L1/coleman-functions`, `ColemanIntegration:L1/coleman-pullback`, `ColemanIntegration:L1/coleman-uniqueness-principle`.

*Sources.*

- The Habiro ring of a number field, §3.1, after (174), p. 38 (arXiv v2): “This function also satisfies equation (173). Therefore, this gives homomorphisms from the Bloch group in a completely analogous way to the Bloch-Wigner dilogarithm but for finite places” The statement, as used by the consumers (equation (173) is the five-term relation).
- A note on functional equations of the p-adic polylogarithms, Proposition 4.4 and proof (case n = 1), pp. 364-365: “Proof. — Let n = 1. The space V_2 is one-dimensional generated generated by (1, −½). Then for P_2(z) = Li_2(z) + ½ log z log(1 − z) we have” The proof of constancy of Σ n_k P_2(f_k(z)) for elements of ker b_2, from the vanishing differential.
- A note on functional equations of the p-adic polylogarithms, Lemma 4.3, p. 362: “LEMMA 4.3. — Let P_{n+1}(z) be such that (α_0, ..., α_n) ∈ V_{n+1}. Then lim′_{z→0} P_{n+1}(z) = 0 and lim′_{z→∞} P_{n+1}(z) = 0.” The evaluation of the constant by limits at 0 and ∞.

#### Theorem. Polylogarithm values at roots of unity of order prime to p

*Node* `ColemanIntegration:L2/values-at-tame-roots-of-unity`.

Let ζ ∈ C_p be a root of unity of order N ≥ 2 with p ∤ N, let f be the order of p in (Z/NZ)^× (so ζ^{p^f} = ζ and Q_p(ζ) is unramified of degree f), and k ≥ 1. For every branch a: (a) Li^a_k(ζ) − p^{−k}Li^a_k(ζ^p) = ℓ_k(ζ) (the Frobenius relation at a point with φ(ζ) = ζ^p), hence Li^a_k(ζ) = (1 − p^{−kf})^{−1}·Σ_{i=0}^{f−1} p^{−ik}ℓ_k(ζ^{p^i}) = p^k(p^{kf} − 1)^{−1}Σ_{i=0}^{f−1}p^{(f−1−i)k}ℓ_k(ζ^{p^i}); in particular Li^a_k(ζ) does not depend on a and lies in Q_p(ζ); (b) Li_k(ζ) ∈ p^k·Z_p[ζ] (for k = 1: Li_1(ζ) = −log(1 − ζ) ∈ pZ_p[ζ]); (c) p^{−k}Li_k(ζ) ≡ −li_k(σ(ζ))/(1 − ζ) mod p, where σ(ζ) := ζ^{p^{f−1}} is the root of unity with σ(ζ)^p = ζ and li_k(x) := Σ_{b=1}^{p−1}x^b/b^k (Besser's finite polylogarithm); equivalently p^{−k}Li_k(ζ^p) ≡ −li_k(ζ)/(1 − ζ)^p mod p; (d) Li_k(ζ^{−1}) = (−1)^{k+1}Li_k(ζ).

*Hypotheses.* ζ a root of unity of order N ≥ 2, p ∤ N; k ≥ 1; a ∈ C_p arbitrary.

*Proof outline.*

1. ζ and all ζ^{p^i} are special units (ColemanIntegration:L2/residue-discs-of-roots-of-unity), so |ζ^{p^i} − 1| = 1 > p^{−1/(p−1)} and ColemanIntegration:L2/frobenius-relation gives Li^a_k(ζ^{p^i}) − p^{−k}Li^a_k(ζ^{p^{i+1}}) = ℓ_k(ζ^{p^i}) for every i.
2. Telescoping f times and using ζ^{p^f} = ζ: (1 − p^{−kf})Li^a_k(ζ) = Σ_{i<f} p^{−ik}ℓ_k(ζ^{p^i}). The right side involves only ℓ_k, which does not depend on a.
3. (b) ℓ_k(ζ^{p^i}) ∈ Z_p[ζ] by ColemanIntegration:L2/integral-modified-polylogarithm (i) (ζ^{p^i} ∈ Z_p[ζ] with |ζ^{p^i} − 1| = 1), and p^k(p^{kf} − 1)^{−1} ∈ p^k Z_p^×.
4. (c) Modulo p only the term i = f − 1 survives in p^{−k}Li_k(ζ) = (p^{kf} − 1)^{−1}Σ_i p^{(f−1−i)k}ℓ_k(ζ^{p^i}), and p^{kf} − 1 ≡ −1; by ColemanIntegration:L2/integral-modified-polylogarithm (ii), ℓ_k(σ(ζ)) ≡ li_k(σ(ζ))/(1 − σ(ζ)^p) = li_k(σ(ζ))/(1 − ζ). The second form: apply the first to ζ^p, with σ(ζ^p) = ζ and 1 − ζ^p ≡ (1 − ζ)^p mod p.
5. (d) ColemanIntegration:L2/inversion-relation (ii).
6. Values in Q_p(ζ): ℓ_k has an expansion with Z_p-coefficients in t and (1 − t)^{−1}.

*Acceptance.*

- p = 5, ζ = teichmuller(2) ∈ Z_5 (order 4, f = 1): v_5(Li_k(ζ)) = 1, 2, 3, 5 for k = 1, 2, 3, 4 (each ≥ k), and p^{−k}Li_k(ζ) + li_k(ζ)/(1 − ζ) has valuation ≥ 1 for k = 1, …, 4 (GP).
- p = 7, ζ = i ∈ Q_7(i) (order 4, f = 2): v_7(Li_k(i)) = k for k = 1, 2, 3 (GP with the f = 2 formula).
- p odd, ζ = −1 (f = 1): Li_2(−1) = ℓ_2(−1)/(1 − p^{−2}) = 0 since ℓ_2(−1) = 0 by the symmetry of ℓ_2.
- GSWZ (175): Li_2(ζ) ∈ p²Z_p[ζ] and Li_1(ζ) ∈ pZ_p[ζ], the cases k = 1, 2 of (b).

*Uses.* `ColemanIntegration:L2/frobenius-relation`, `ColemanIntegration:L2/integral-modified-polylogarithm`, `ColemanIntegration:L2/residue-discs-of-roots-of-unity`, `ColemanIntegration:L2/inversion-relation`, `ColemanIntegration:L2/p-adic-polylogarithm`, `tauceti:TauCeti.teichmuller`.

*Planet:* Polylogarithm values at roots of unity.

*Sources.*

- Finite and p-adic polylogarithms, Corollary 2.2, p. 2 (arXiv v1): “Corollary 2.2. Let α ∈ X be a root of unity. Then we have Li_n(α) ∈ p^n W and p^{−n} Li_n(α) ≡ −li_n(σ(α))/(1 − α) (mod p).” (b) and (c), with W = W(F̄_p) and σ the inverse of the Frobenius of F̄_p.
- Finite and p-adic polylogarithms, Proof of Corollary 2.2, pp. 2-3 (arXiv v1): “Since α^{p^k} = α we may move the last term to the left hand side of the equation and obtain Li_n(α) = (1/(1 − p^{−kn})) Σ_{i=0}^{k−1} p^{−in} Li_n^{(p)}(α^{p^i})” The telescoping formula (a).
- The Habiro ring of a number field, Proof of Lemma 3.1, (175), p. 37 (arXiv v2): “Proof. From [8, Cor. 4.9] we know that Li_2(ζ) ∈ p²Z_p[ζ] and Li_1(ζ) ∈ pZ_p[ζ] .” The cases k = 1, 2 of (b), used by the consumers.
- The Habiro ring of a number field, Proposition 3.2, (178), p. 38 (arXiv v2): “Proposition 3.2. [6, Cor. 2.2] For a prime p and ζ ∈ µ(Q_{p^s}) with ζ ≠ 1, we have p^{−2}D_p(ζ^p) = (1/(ζ − 1)^p) li_{2,p}(ζ) (mod p).” The second form of (c) for k = 2 (D_p = Li_2 at roots of unity); for p odd (ζ − 1)^p = −(1 − ζ)^p, matching the sign here.

#### Lemma. Values at points of finite extensions of Q_p

*Node* `ColemanIntegration:L2/values-in-finite-extensions`.

Let K ⊂ C_p be a finite extension of Q_p and a ∈ K. Then Li^a_k(K ∖ {1}) ⊂ K for every k ≥ 0, Li^{(p),a}_k maps {z ∈ K : z^p ≠ 1} into K, and ζ_p(k) ∈ Q_p for every k ≥ 2. For a ∈ Q_p (in particular the Iwasawa branch) and K Galois over Q_p, τ(Li^a_k(z)) = Li^a_k(τ z) for z ∈ K ∖ {1} and τ ∈ Gal(K/Q_p).

*Hypotheses.* K finite over Q_p; a ∈ K; k ≥ 0.

*Proof outline.*

1. log_a(K^×) ⊂ K: K^× = π_K^Z × μ_{q−1} × U^1_K, log_a(π_K) = (a·e_K + log(π_K^{e_K}/p))/e_K ∈ K for a uniformiser π_K, roots of unity have logarithm 0, and the series logarithm maps U^1_K into K (ColemanIntegration:L0/log-branch).
2. z ∈ D⁻(0,1) ∩ K: Li_k^ser has rational coefficients. z ∈ K with |z| > 1: ColemanIntegration:L2/inversion-relation (i) and the previous step.
3. z ∈ O_K with z̄ ∉ {0, 1}: the Teichmüller representative ω of z̄ lies in K and is a root of unity of order prime to p (tauceti:TauCeti.teichmuller); Li_j(ω) ∈ Q_p(ω) ⊂ K for j ≤ k (ColemanIntegration:L2/values-at-tame-roots-of-unity (a)); the expansion of Li_k on D⁻(ω,1) is determined by the recursion (d/du)Li_j(ω + u) = Li_{j−1}(ω + u)/(ω + u) (ColemanIntegration:L2/differential-recursion) with initial values Li_j(ω) ∈ K and Li_0(ω + u) ∈ K[[u]], so its coefficients lie in K and Li_k(z) ∈ K.
4. z ∈ K ∩ D⁻(1,1), z ≠ 1: Li^a_k(z) = λ_k(z) − log(z)^{k−1}log_a(1 − z)/(k−1)!; the Taylor coefficients of λ_k at 1 come from the recursion dλ_k = λ_{k−1}dz/z + log(z)^{k−1}dz/((k−1)!(z − 1)) with rational data and constant term ζ_p(k) (ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs).
5. ζ_p(k) ∈ Q_p: for p odd, ζ_p(k) = Li_k(−1)/(2^{1−k} − 1) (ColemanIntegration:L2/value-at-one (c)) with Li_k(−1) ∈ Q_p (tame root, f = 1); for p = 2, (3^{1−k} − 1)ζ_2(k) = Li_k(ω) + Li_k(ω²) for ω a primitive cube root of unity, and by the explicit formula of ColemanIntegration:L2/values-at-tame-roots-of-unity (a) (ℓ_k has Z_2-coefficients) the two values are exchanged by Gal(Q_2(ω)/Q_2), so their sum lies in Q_2.
6. Galois: ColemanIntegration:L2/galois-equivariance, with τ extended to a continuous automorphism of C_p.

*Acceptance.*

- Furusho Theorem 2.25 (ζ_p(k) ∈ Q_p) is recovered without Ax–Sen–Tate.
- p = 5: ζ_5(3) = −(4/3)Li_3(−1) ∈ Q_5 with 5-adic valuation 3 (GP).
- For a ∉ K the value Li^a_1(p) = −log_a(1 − p) = −log(1 − p) ∈ K, but Li^a_2(1/p) = −Li_2^ser(p) − a²/2 ∉ K when a² ∉ K.

*Uses.* `ColemanIntegration:L2/values-at-tame-roots-of-unity`, `ColemanIntegration:L2/inversion-relation`, `ColemanIntegration:L2/value-at-one`, `ColemanIntegration:L2/galois-equivariance`, `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L2/differential-recursion`, `ColemanIntegration:L2/polylogarithm-power-series`, `ColemanIntegration:L0/log-branch`, `tauceti:TauCeti.teichmuller`, `ColemanIntegration:L0/log-branch-field-compatibility`.

*Sources.*

- The syntomic regulator for the K-theory of fields, §1, p. 870 (published); p. 3 of arXiv v2: “It is easily deduced from Coleman's theory (see Remark 2.3) that Li_n is Galois equivariant. In particular, if K ⊂ C_p is a complete subfield, then Li_n, and as a result also L_n and L_mod,n, send K to K provided log was defined such that log(π) = 0 with π ∈ K.” The statement (for complete subfields; here proved for finite extensions without Ax–Sen–Tate).
- p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation, Theorem 2.25, p. 13 (arXiv v2): “Theorem 2.25. All p-adic MZV's are p-adic numbers, i.e. ζ_p(k1, ···, km) ∈ Q_p.” ζ_p(k) ∈ Q_p (case m = 1).

#### Theorem. Polylogarithm values at roots of unity of p-power order

*Node* `ColemanIntegration:L2/values-at-roots-of-unity-of-p-power-order`.

Let ζ ∈ C_p be a primitive p^r-th root of unity, r ≥ 1, and a ∈ C_p. (a) k = 1: Li^a_1(ζ) = −log_a(1 − ζ), Li^a_1(ζ) − Li^b_1(ζ) = −(a − b)/(p^{r−1}(p − 1)), and Σ_{c∈(Z/p^r)^×}Li^a_1(ζ^c) = −log_a(p) = −a; for a nontrivial character θ of (Z/p^r)^×, Σ_c θ^{−1}(c)Li^a_1(ζ^c) is independent of a. (b) k ≥ 2: Li^a_k(ζ) = λ_k(ζ) with λ_k the analytic function on D⁻(1,1) of ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs; it is independent of a and lies in Q_p(ζ). (c) Frobenius: for r ≥ 2 and k ≥ 0, Li^a_k(ζ) − p^{−k}Li^a_k(ζ^p) = g_k(1/(1 − ζ)); for r = 1 and k ≥ 2, Σ_{c=1}^{p−1}Li_k(ζ^c) = (p^{1−k} − 1)ζ_p(k), and more generally Σ_{η∈μ_{p^r}}Li_k(η) = p^{r(1−k)}ζ_p(k). (d) Li^a_k(ζ^{−1}) = (−1)^{k+1}Li^a_k(ζ) for k ≥ 1. (e) For k ≥ 2 and c ∈ (Z/p^r)^×, Li_k(ζ^c) = σ_c(Li_k(ζ)) where σ_c ∈ Gal(Q_p(ζ)/Q_p) sends ζ to ζ^c (for k = 1 when a ∈ Q_p).

*Hypotheses.* ζ of exact order p^r, r ≥ 1; a, b ∈ C_p; k as indicated.

*Proof outline.*

1. |ζ − 1| = p^{−1/(p^{r−1}(p−1))} (ColemanIntegration:L2/residue-discs-of-roots-of-unity), so ζ ∈ D⁻(1,1) ∖ {1}, v(1 − ζ) = 1/(p^{r−1}(p−1)), and Π_{c}(1 − ζ^c) = Φ_{p^r}(1) = p.
2. (a) Li^a_1 = −log_a(1 − z); the branch difference is −v(1 − ζ)(a − b) (ColemanIntegration:L2/branch-dependence); the sum is −log_a(Π_c(1 − ζ^c)) = −log_a(p); for θ nontrivial the branch difference Σ_cθ^{−1}(c)·v(1 − ζ^c)(a − b) vanishes since v(1 − ζ^c) = v(1 − ζ) for all c and Σ_cθ^{−1}(c) = 0.
3. (b) On D⁻(1,1), Li^a_k = λ_k − log(z)^{k−1}log_a(1 − z)/(k−1)! and log ζ = 0 (a root of unity), so for k ≥ 2 the second term vanishes at ζ; λ_k is branch-free.
4. (c) For r ≥ 2, |ζ − 1| > p^{−1/(p−1)} and ColemanIntegration:L2/frobenius-relation applies; ζ^p has order p^{r−1}. For the sums use ColemanIntegration:L2/value-at-one (c) with m = p^r and m = p.
5. (d) ColemanIntegration:L2/inversion-relation (ii). (e) ColemanIntegration:L2/galois-equivariance with σ_c ∈ Gal(Q_p(ζ)/Q_p) ≅ (Z/p^r)^× extended continuously to C_p; values in Q_p(ζ) by ColemanIntegration:L2/values-in-finite-extensions.

*Acceptance.*

- p = 3, ζ = ζ_9: the Frobenius relation Li_k(ζ_9) − 3^{−k}Li_k(ζ_3) = g_k(1/(1 − ζ_9)) applies (|ζ_9 − 1| = 3^{−1/6} > 3^{−1/2}), but not at ζ_3.
- p = 2, ζ = −1 (order 2 = p): Li_k(−1) = λ_k(−1) = (2^{1−k} − 1)ζ_2(k) for k ≥ 2 (distribution relation with m = 2 at z = 1), and Li^a_1(−1) = −log_a(2) = −a.
- RJW Theorem 6.7 with θ of conductor p^r uses exactly these values, with the Euler factor 1 − θ(p)p^{−k} = 1.

*Uses.* `ColemanIntegration:L2/residue-discs-of-roots-of-unity`, `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L2/branch-dependence`, `ColemanIntegration:L2/frobenius-relation`, `ColemanIntegration:L2/overconvergent-expansion-of-the-modified-polylogarithm`, `ColemanIntegration:L2/value-at-one`, `ColemanIntegration:L2/inversion-relation`, `ColemanIntegration:L2/galois-equivariance`, `ColemanIntegration:L2/values-in-finite-extensions`, `mathlib:Polynomial.eval_one_cyclotomic_prime_pow`, `ColemanIntegration:L0/log-branch`.

*Sources.*

- An introduction to p-adic L-functions, Theorem 6.7, p. 40 (arXiv v2): “Theorem 6.7 ([Col82]). — Let θ be a non-trivial Dirichlet character of conductor N, let k ≥ 1 be an integer, and let ε_N denote a primitive Nth root of unity.” The theorem uses Li_{k,p}(ε_N^c) for every conductor N, including N = p^r.
- The syntomic regulator for the K-theory of fields, Proof of Proposition 2.6, p. 876 (published): “It remains to consider the case |z − 1| < 1. Note that here log(z) is independent of the branch so the formula to be proved reads Li_{n,a}(z) − Li_{n,b}(z) = −(1/(n − 1)!) v(1 − z)β log^{n−1} z.” Branch dependence on the residue disc of 1, which vanishes at roots of unity for n ≥ 2.
- On the p-adic Beilinson conjecture for number fields, §4, property (4), p. 20 (arXiv v2): “(4) for every n ≥ 0 there is a power series g_n(v), convergent for |v|_p < p^{1/(p−1)}, such that g_n(1/(1 − z)) = Li_{n,p}(z) − (1/p^n) Li_{n,p}(z^p) when |z − 1|_p > p^{−1/(p−1)}.” (c) for r ≥ 2.

#### Lemma. The expansion of Li_k((1+T)ε) at a root of unity and its logarithmic growth

*Node* `ColemanIntegration:L2/polylogarithm-expansion-at-a-root-of-unity`.

Let ε ∈ C_p be a root of unity of order N ≥ 2, a ∈ C_p and k ≥ 0. (a) If N is not a power of p, the function T ↦ Li^a_k((1 + T)ε) on the open unit disc |T| < 1 is given by a power series P_{k,ε}(T) = Σ_{n≥0}c_nT^n with coefficients in Q_p(ε), independent of a, converging for |T| < 1, such that: c_0 = Li_k(ε); P_{0,ε}(T) = ε(1 + T)/(1 − ε(1 + T)) = A_ε(T) − 1 with A_ε(T) := 1/(1 − ε(1 + T)) ∈ Z_p[ε][[T]]; ∂P_{k,ε} = P_{k−1,ε} for k ≥ 1 with ∂ = (1 + T)·d/dT; and the growth bound v_p(c_n) ≥ −k·⌊log_p n⌋ − C_{k,ε} for n ≥ 1, where C_{k,ε} := max(0, −min_{1≤j≤k}v_p(Li_j(ε))) (C_{k,ε} = 0 when p ∤ N). Hence P_{k,ε} lies in R^+ (power series converging on the open unit disc) and has logarithmic growth of order k: |c_n| ≤ p^{C_{k,ε}}·n^k. (b) For a nontrivial Dirichlet character θ modulo N (values in C_p) and ε of order N not a power of p, F̃_{θ,k}(T) := G(θ^{−1}, ε)^{−1}·Σ_{c∈(Z/N)^×}θ^{−1}(c)P_{k,ε^c}(T) (with G(θ^{−1}, ε) := Σ_cθ^{−1}(c)ε^c ≠ 0) lies in R^+, has logarithmic growth of order k, satisfies ∂^kF̃_{θ,k} = F_θ(T) := G(θ^{−1}, ε)^{−1}Σ_cθ^{−1}(c)/(1 − (1 + T)ε^c) (RJW's F_θ, Lemma 5.12) and F̃_{θ,k}(0) = G(θ^{−1}, ε)^{−1}Σ_cθ^{−1}(c)Li_k(ε^c); for k = 1 it is RJW's F̃_θ. (c) Non-example: if N = p^r, then for |T| < 1 with (1 + T)ε ≠ 1, Li^a_k((1 + T)ε) = λ_k((1 + T)ε) − log(1 + T)^{k−1}·log_a(1 − (1 + T)ε)/(k − 1)! (k ≥ 1); the first term is in R^+ but the second has a logarithmic singularity at T = ε^{−1} − 1, which lies in the open unit disc, so T ↦ Li^a_k((1 + T)ε) is not given by any power series converging on |T| < 1; for θ of conductor p^r the singularities of the twisted sum at the distinct points ε^{−c} − 1 do not cancel, and F̃_{θ,k} ∉ R^+.

*Hypotheses.* ε of exact order N ≥ 2; a ∈ C_p; k ≥ 0; R^+ = {Σ c_nT^n : |c_n|r^n → 0 for every r < 1} (RJW Remark 3.39); logarithmic growth of order h means |c_n| = O(n^h).

*Proof outline.*

1. (a) By ColemanIntegration:L2/residue-discs-of-roots-of-unity, ε is a special unit, so D⁻(ε,1) = {(1 + T)ε : |T| < 1} is a residue disc of U on which Li^a_k is a convergent power series in z − ε on the whole disc (ColemanIntegration:L2/p-adic-polylogarithm, ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs (c)), independent of a (ColemanIntegration:L2/branch-dependence (i)); composing with the affine map T ↦ (1 + T)ε gives P_{k,ε} ∈ Q_p(ε)[[T]] (values in Q_p(ε): ColemanIntegration:L2/values-in-finite-extensions).
2. P_{0,ε}: Li_0(z) = z/(1 − z) = 1/(1 − z) − 1; since 1 − ε is a unit, A_ε(T) = (1 − ε)^{−1}Σ_n(εT/(1 − ε))^n ∈ Z_p[ε][[T]].
3. ∂ = (1 + T)d/dT corresponds to z·d/dz under z = (1 + T)ε, so ∂P_{k,ε} = P_{k−1,ε} (ColemanIntegration:L2/differential-recursion).
4. Growth: n·c_n(P_k) = Σ_{l=0}^{n−1}(−1)^{n−1−l}c_l(P_{k−1}) (from P_k' = P_{k−1}/(1 + T)); with B_k(n) := min_{0≤l≤n}v_p(c_l(P_k)) this gives B_k(n) ≥ min(v_p(Li_k(ε)), B_{k−1}(n) − ⌊log_p n⌋), B_0(n) ≥ 0, and induction gives the bound. For p ∤ N, Li_j(ε) ∈ p^jZ_p[ε] (ColemanIntegration:L2/values-at-tame-roots-of-unity), so C_{k,ε} = 0. A bound |c_n| ≤ C·n^k implies |c_n|r^n → 0 for r < 1.
5. (b) Linear combination; Σ_cθ^{−1}(c) = 0 kills the constant −1 in P_{0,ε^c}; G(θ^{−1}, ε) ≠ 0 for primitive θ (and the formula is used only then). For k = 1, Li_1((1 + T)ε^c) = −log((1 + T)ε^c − 1) since log_a(−1) = 0, which is RJW's summand.
6. (c) ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs (a) with z = (1 + T)ε ∈ D⁻(1,1) and log((1 + T)ε) = log(1 + T). At T_0 := ε^{−1} − 1 (|T_0| = |1 − ε| < 1), log(1 + T) has a simple zero (log(1 + T_0) = log ε^{−1} = 0, derivative (1 + T_0)^{−1} ≠ 0), and log_a(1 − (1 + T)ε) = log_a(−ε(T − T_0)) = log_a(T − T_0); so near T_0 the function is an analytic function plus −(T − T_0)^{k−1}u(T)log_a(T − T_0)/(k−1)! with u analytic and u(T_0) ≠ 0, which is not a convergent power series in T − T_0 (transcendence of the logarithm over analytic functions on a punctured disc: ColemanIntegration:L0/annulus-log-primitive). For the twisted sum, near T_c := ε^{−c} − 1 every summand except the c-th is analytic (the points T_c are distinct), and the c-th contributes θ^{−1}(c) ≠ 0 times such a singular term, so F̃_{θ,k} is not analytic at T_c and not in R^+.

*Acceptance.*

- p = 5, ε = −1, k = 1, 2, 3, n ≤ 700: min_n [v_5(c_n) + k⌊log_5 n⌋] = 0, attained at n = 1, 2, 3 respectively; v_5(c_{125}) = −3, −5, −6 and v_5(c_{625}) = −4, −7, −9 (GP): the bound holds and has the right order.
- k = 0: P_{0,ε} = A_ε − 1 has bounded coefficients (the Amice transform of the Dirac-type measure μ_ε with μ_ε(b + p^mZ_p) = ε^b/(1 − ε^{p^m}), used by ColemanIntegration L3).
- For N = p (ε = ζ_p) and k = 1 the formal expansion of −log_a(1 − (1 + T)ζ_p) at T = 0 has radius |ζ_p − 1| = p^{−1/(p−1)} < 1.

*Uses.* `ColemanIntegration:L2/residue-discs-of-roots-of-unity`, `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L2/branch-dependence`, `ColemanIntegration:L2/differential-recursion`, `ColemanIntegration:L2/values-at-tame-roots-of-unity`, `ColemanIntegration:L2/values-in-finite-extensions`, `ColemanIntegration:L0/annulus-log-transcendence`, `ColemanIntegration:L0/annulus-log-primitive`, `mathlib:PowerSeries`, `mathlib:PowerSeries.IsRestricted`, `mathlib:gaussSum`, `mathlib:DirichletCharacter`.

*Sources.*

- An introduction to p-adic L-functions, Lemma 6.4 and its proof, pp. 37-38 (arXiv v2): “If (N, p) = 1, we know that (ε_N^c − 1) is a p-adic unit; then the coefficient of T^n has p-adic valuation bounded below by −v_p(n). This means the coefficients in F̃_θ(T) have logarithmic growth, and in particular F̃_θ(T) ∈ R^+.” The case k = 1 of (a)-(b) for N prime to p.
- An introduction to p-adic L-functions, Remark 3.39, p. 24 (arXiv v2): “An L-valued function on B(0, 1) is rigid analytic if it can be written as a power series Σ_{n≥0} a_n T^n ∈ L[[T]] that is everywhere convergent on B(0, 1) (i.e. |a_n|r^n → 0 as n → ∞ for all r < 1); write R^+ ⊂ L[[T]] for the space of such functions.” The space R^+.
- An introduction to p-adic L-functions, Lemma 5.12, p. 34 (arXiv v2): “Lemma 5.12. — The Mahler transform of µ_θ is F_θ(T) := A_{µ_θ}(T) = (−1/G(θ^{−1})) Σ_{c∈(Z/Dp^nZ)^×} θ(c)^{−1}/((1 + T)ε^c_{Dp^n} − 1).” The series F_θ that ∂^k F̃_{θ,k} recovers.
- Finite and p-adic polylogarithms, Lemma 2.4, p. 3 (arXiv v1): “Lemma 2.4. In the situation above we have v_p(a_k) ≥ −v_p(k!), where v_p is the p-adic valuation and a_k is the k-th coefficient in the power series expansion with respect to u of any of the functions f_n.” A coefficient bound for Li_n(α + u) at a tame root α obtained from the same recursion (weaker than the logarithmic bound here).

#### Lemma. Norm and trace compatibilities: sums over conjugate roots of unity

*Node* `ColemanIntegration:L2/sums-over-galois-conjugates`.

Let ε ∈ C_p be a primitive N-th root of unity, N ≥ 2, and k ≥ 1; for k = 1 take a ∈ Q_p (for k ≥ 2 any a). (a) Trace: for σ ∈ Gal(Q_p(ε)/Q_p), identified with a subgroup of (Z/NZ)^× by σ(ε) = ε^{c_σ}, σ(Li_k(ε)) = Li_k(ε^{c_σ}); hence Tr_{Q_p(ε)/Q_p}Li_k(ε) = Σ_σ Li_k(ε^{c_σ}); for p ∤ N the group is generated by c = p (Frobenius), and Tr_{Q_p(ε)/Q_p}Li^a_1(ε) = −log_a(N_{Q_p(ε)/Q_p}(1 − ε)). (b) Full sum over primitive roots: for k ≥ 2, Σ_{c∈(Z/N)^×}Li_k(ε^c) = ζ_p(k)·Σ_{d|N}μ(N/d)d^{1−k} = ζ_p(k)·N^{1−k}Π_{ℓ|N}(1 − ℓ^{k−1}); for k = 1, Σ_c Li^a_1(ε^c) = −log_a(Φ_N(1)), which is −a if N = p^r, −log(ℓ) if N = ℓ^s with ℓ ≠ p prime, and 0 if N is not a prime power. (c) Level compatibility (norm-compatible systems): if M | N and every prime dividing N divides M, then for c_0 ∈ (Z/MZ)^×, Σ_{c∈(Z/N)^×, c≡c_0 (mod M)}Li^a_k(ε^c) = (N/M)^{1−k}·Li^a_k(ε^{c_0N/M}), ε^{N/M} being a primitive M-th root of unity; in particular Σ_{c≡c_0 (p^{r−1})}Li_k(ζ_{p^r}^c) = p^{1−k}Li_k(ζ_{p^{r−1}}^{c_0}) for r ≥ 2.

*Hypotheses.* ε primitive of order N ≥ 2; k ≥ 1; a ∈ Q_p when k = 1 in (a); in (b) for k ≥ 2 the value Li_k(1) = ζ_p(k).

*Proof outline.*

1. (a) ColemanIntegration:L2/galois-equivariance and ColemanIntegration:L2/values-in-finite-extensions; for k = 1, Σ_σ log_a(σ(1 − ε)) = log_a(Π_σσ(1 − ε)) = log_a N(1 − ε); for p ∤ N, Q_p(ε)/Q_p is unramified with Galois group generated by Frobenius, ε ↦ ε^p (ColemanIntegration:L2/residue-discs-of-roots-of-unity).
2. (b) For k ≥ 2, Σ_{ζ∈μ_d}Li_k(ζ) = d^{1−k}ζ_p(k) (ColemanIntegration:L2/value-at-one (c)); the primitive N-th roots are obtained from the μ_d, d | N, by Möbius inversion. For k = 1, Π_c(1 − ε^c) = Φ_N(1) (mathlib:Polynomial.eval_one_cyclotomic_prime_pow, mathlib:Polynomial.eval_one_cyclotomic_not_prime_pow).
3. (c) If every prime of N divides M, then c ≡ c_0 (mod M) with c_0 a unit mod M forces c to be a unit mod N, so the fibre is {c_0 + Mj : 0 ≤ j < N/M} and ε^{c_0 + Mj} = ε^{c_0}·η^j with η := ε^M a primitive (N/M)-th root of unity; ColemanIntegration:L2/distribution-relation with m = N/M at z = ε^{c_0} gives the sum (z^m = ε^{c_0N/M} ≠ 1 because M ≥ 2, M being divisible by every prime of N ≥ 2).

*Acceptance.*

- N = p^r, k ≥ 2: Σ_{c}Li_k(ζ_{p^r}^c) = ζ_p(k)(p^{r(1−k)} − p^{(r−1)(1−k)}).
- N = 4, p = 5 (split): Gal(Q_5(i)/Q_5) is trivial, and (b) gives Li_k(i) + Li_k(−i) = ζ_5(k)·4^{1−k}(1 − 2^{k−1}), consistent with the distribution relation Li_k(i) + Li_k(−i) = 2^{1−k}Li_k(−1) = 2^{1−k}(2^{1−k} − 1)ζ_5(k).

*Uses.* `ColemanIntegration:L2/galois-equivariance`, `ColemanIntegration:L2/values-in-finite-extensions`, `ColemanIntegration:L2/value-at-one`, `ColemanIntegration:L2/distribution-relation`, `ColemanIntegration:L2/residue-discs-of-roots-of-unity`, `mathlib:Polynomial.eval_one_cyclotomic_prime_pow`, `mathlib:Polynomial.eval_one_cyclotomic_not_prime_pow`, `mathlib:IsPrimitiveRoot`, `ColemanIntegration:L0/log-branch`.

*Sources.*

- The syntomic regulator for the K-theory of fields, §2, p. 876 (published); p. 10 of arXiv v2: “If m and n are integers at least equal to 2, then on C_p Li_n(z^m) = m^{n−1} Σ_{ζ^m=1} Li_n(ζz).” The relation behind (b) and (c), including z = 1.
- On the p-adic Beilinson conjecture for number fields, Proof of Proposition 4.17, p. 22 (arXiv v2): “the τ-component of R_{n,p}(M^E_π) equals (n−1)! |G|^{−1} Σ′_{a=1}^N χ_τ^{−1}(a)P_{n,p}(η_p^a) by Remark 4.15, independent of our assumption on χ(−1).” Sums over the Galois conjugates ψ_a(ζ) = ζ^a, a ∈ (Z/NZ)^×, weighted by a character.

#### Lemma. Twisted sums Σ_c θ^{−1}(c)Li_k(ε^c) for primitive characters

*Node* `ColemanIntegration:L2/twisted-sums-for-primitive-characters`.

Let θ : (Z/NZ)^× → C_p^× be a nontrivial Dirichlet character (values roots of unity in C_p, i.e. θ composed with a fixed embedding of Q(μ_{φ(N)}) into C_p), ε ∈ C_p a primitive N-th root of unity, k ≥ 1, a ∈ C_p, and S^a_k(θ, ε) := Σ_{c∈(Z/N)^×}θ^{−1}(c)Li^a_k(ε^c), G(θ^{−1}, ε) := Σ_cθ^{−1}(c)ε^c. (a) S^a_k(θ, ε) is independent of a (also for k = 1). (b) S^a_k(θ, ε^b) = θ(b)S^a_k(θ, ε) for b ∈ (Z/N)^×; if θ is primitive, G(θ^{−1}, ε^b) = θ(b)G(θ^{−1}, ε) for all b ∈ Z/N, so S_k(θ, ε)/G(θ^{−1}, ε) does not depend on the primitive root ε. (c) Parity: S_k(θ, ε) = −θ(−1)(−1)^k·S_k(θ, ε), so S_k(θ, ε) = 0 unless θ(−1) = (−1)^{k+1}. (d) Euler factor: if θ is primitive of conductor N, and N ≠ p or k ≥ 2, then Σ_cθ^{−1}(c)Li^{(p),a}_k(ε^c) = (1 − θ(p)p^{−k})·S_k(θ, ε), with θ(p) = 0 when p | N. (e) Coefficient embeddings: for τ a continuous automorphism of C_p, τ(S^a_k(θ, ε)) = S^{τ(a)}_k(τ∘θ, τ(ε)) and τ(G(θ^{−1}, ε)) = G((τ∘θ)^{−1}, τ(ε)); so changing the embedding of Q(μ_N, θ) into C_p transforms the pair (S_k, G) compatibly and the ratio S_k/G by τ.

*Hypotheses.* θ nontrivial modulo N ≥ 2 (primitive where stated); ε primitive N-th root of unity; k ≥ 1; for (d) with N = p, k ≥ 2 (Li_1(1) is undefined).

*Proof outline.*

1. (a) For k ≥ 2 each Li^a_k(ε^c) is branch-free (ColemanIntegration:L2/branch-dependence (iv)); for k = 1 the branch difference is −(a − b)Σ_cθ^{−1}(c)v(1 − ε^c), and v(1 − ε^c) is independent of c (ColemanIntegration:L2/residue-discs-of-roots-of-unity) while Σ_cθ^{−1}(c) = 0.
2. (b) Reindex c ↦ b^{−1}c. For the Gauss sum with primitive θ and non-unit b, mathlib:gaussSum_mulShift_of_isPrimitive (applied to χ = θ^{−1} and the additive character determined by ε).
3. (c) Reindex c ↦ −c and use Li_k(ζ^{−1}) = (−1)^{k+1}Li_k(ζ) (ColemanIntegration:L2/inversion-relation (ii)).
4. (d) Li^{(p)}_k(ε^c) = Li_k(ε^c) − p^{−k}Li_k(ε^{pc}). If p ∤ N, c ↦ pc permutes (Z/N)^× and Σ_cθ^{−1}(c)Li_k(ε^{pc}) = θ(p)S_k. If p | N and N ≠ p, ε^p is a primitive (N/p)-th root and Σ_cθ^{−1}(c)Li_k(ε^{pc}) = Σ_{d∈(Z/(N/p))^×}Li_k(ε^{pd})·Σ_{c≡d}θ^{−1}(c); each inner sum runs over a coset of ker((Z/N)^× → (Z/(N/p))^×), on which θ is nontrivial because θ is primitive of conductor N, so it vanishes. If N = p and k ≥ 2, ε^{pc} = 1 and Σ_cθ^{−1}(c)ζ_p(k) = 0 (ColemanIntegration:L2/value-at-one).
5. (e) ColemanIntegration:L2/galois-equivariance and the definition of the Gauss sum.

*Acceptance.*

- p = 7, N = 4, θ the odd character mod 4, ε = i ∈ Q_7(i): S_k = Li_k(i) − Li_k(−i) = (Li^{(7)}_k(i) − Li^{(7)}_k(−i))/(1 + 7^{−k}), consistent with (d) since θ(7) = −1 (checked algebraically from the f = 2 formula).
- (c): for θ the quadratic character mod 5 (even) S_2(θ, ε_5) = 0, and for θ the odd character mod 4 S_1(θ, i) = 0 (Leopoldt's formula gives L_p(θ, 1) = 0 for odd θ, as RJW remark after Theorem 6.1).
- RJW Theorem 6.7 (ii) is (1 − θ(p)p^{−k})G(θ^{−1})^{−1}S_k(θ, ε_N), and BHYY Theorem 1.1 is g(χ, ξ)N^{−1}Σ_βχ(β)^{−1}Li^{(p)}_k(ξ^β); (d) with G(θ^{−1})G(θ) = θ(−1)N shows the two right-hand sides agree.

*Uses.* `ColemanIntegration:L2/branch-dependence`, `ColemanIntegration:L2/inversion-relation`, `ColemanIntegration:L2/value-at-one`, `ColemanIntegration:L2/galois-equivariance`, `ColemanIntegration:L2/residue-discs-of-roots-of-unity`, `ColemanIntegration:L2/p-adic-polylogarithm`, `mathlib:DirichletCharacter`, `mathlib:DirichletCharacter.IsPrimitive`, `mathlib:gaussSum`, `mathlib:gaussSum_mulShift_of_isPrimitive`.

*Sources.*

- An introduction to p-adic L-functions, Theorem 6.7(ii), p. 40 (arXiv v2): “(ii) (p-adic value at s = k). We have L_p(θ, k) = (1 − θ(p)p^{−k}) (1/G(θ^{−1})) Σ_{c∈(Z/NZ)^×} θ^{−1}(c)Li_{k,p}(ε_N^c).” The twisted sum and Euler factor as consumed by ColemanIntegration L3.
- p-adic polylogarithms and p-adic Hecke L-functions for totally real fields, Theorem 1.1, p. 2 (arXiv v2): “Theorem 1.1. Suppose N is not a power of p, and let ξ be a primitive N-th root of unity. Then for any integer k ∈ Z, we have L_p(χω_p^{1−k}, k) = (g(χ,ξ)/N) Σ_{β∈(Z/NZ)^×} χ(β)^{−1} Li^(p)_k(ξ^β),” The same formula with Li^{(p)}; (d) is the bridge.
- An introduction to p-adic L-functions, Proof of Theorem 6.1(ii), p. 39 (arXiv v2): “Here, we used that, since p ∤ N, the assignment c ↦ c′ = pc defines an automorphism of (Z/NZ)^×.” The reindexing in (d) for p ∤ N (there for k = 1).

#### Comparison. The complex polylogarithm at roots of unity, compared with the p-adic one

*Node* `ColemanIntegration:L2/complex-polylogarithm-at-roots-of-unity`.

Let Li_k^ℂ be the principal branch of the complex polylogarithm (Polylogarithms:P.1/classical-polylogarithm). (a) For k ≥ 2 and x ∈ R, Li_k^ℂ(e^{2πix}) = Σ_{n≥1}e^{2πinx}/n^k = expZeta(x, k) (Mathlib's HurwitzZeta.expZeta); for N ≥ 1 and j ∈ Z this equals ZMod.LFunction (n ↦ e^{2πijn/N}) k = N^{−k}Σ_{b∈Z/N}e^{2πijb/N}ζ(k, b/N) (Hurwitz zeta). For k = 1 and ζ ≠ 1 a root of unity, Li_1^ℂ(ζ) = −Log(1 − ζ) with the principal logarithm. (b) The complex values satisfy the same distribution relation (Polylogarithms:P.1/classical-distribution) but a different inversion relation at roots of unity: for 0 < x < 1 and k ≥ 1, Li_k^ℂ(e^{2πix}) + (−1)^k Li_k^ℂ(e^{−2πix}) = −(2πi)^k B_k(x)/k! (Polylogarithms:P.1/classical-inversion; Mathlib's cosZeta_two_mul_nat and sinZeta_two_mul_nat_add_one), whereas p-adically Li_k(ζ) + (−1)^kLi_k(ζ^{−1}) = 0. (c) The p-adic and complex polylogarithms share the power series Σz^n/n^k with rational coefficients, the differential recursion and the distribution relations, but their values are not related by any embedding of fields: e.g. Li_2^ℂ(−1) = −π²/12 while Li_2(−1) = 0 in C_p for p odd, and Li_2^ℂ(1/2) = π²/12 − log(2)²/2 while Li_2(1/2) = −log_p(2)²/2. The p-adic values used by ColemanIntegration L3 are computed intrinsically in C_p; complex values are evaluated at the complex roots of unity e^{2πic/N}, and a statement relating them goes through the algebraic numbers (Gauss sums, character values) with explicitly chosen embeddings, never through an isomorphism C ≅ C_p.

*Hypotheses.* k ≥ 2 in (a) except for the last sentence; x real; N ≥ 1.

*Proof outline.*

1. (a) P.1's Li_k^ℂ is continuous on the closed unit disc for k ≥ 2 (P.1 API polylog_continuousOn_closedBall) and equals Σz^n/n^k there (absolute convergence on |z| = 1); Mathlib's hasSum_expZeta_of_one_lt_re identifies the sum with expZeta(x, k); ZMod.LFunction_stdAddChar_eq_expZeta and the definition of ZMod.LFunction give the Hurwitz form.
2. (b) P.1/classical-inversion at z = e^{2πix}, where log(−z) = 2πi(x − ½) for 0 < x < 1, gives B_k(½ + (x − ½)) = B_k(x); the p-adic statement is ColemanIntegration:L2/inversion-relation (ii).
3. (c) Complex values: P.1 tests value_at_neg_one and value_at_half_weight_two; p-adic values: ColemanIntegration:L2/values-at-tame-roots-of-unity (Li_2(−1) = 0) and ColemanIntegration:L2/dilogarithm-identities with ColemanIntegration:L2/inversion-relation (Li_2(2) = 0, Li_2(1/2) = −log(2)²/2).

*Acceptance.*

- mpmath (30 digits): Li_k^ℂ(e^{2πia/N}) equals Σ_n e^{2πina/N}/n^k for k = 2, 3 and (a, N) = (1, 5), (2, 5), (1, 3); the inversion identity with Bernoulli polynomials holds for k = 1, …, 4 at x = 1/5 and 2/7.
- Li_2^ℂ(2 − i0) = π²/4 − iπ·log 2 (mpmath), whose p-adic analogue is Li_2(2) = 0.

*Uses.* `Polylogarithms:P.1/classical-polylogarithm`, `Polylogarithms:P.1/classical-distribution`, `Polylogarithms:P.1/classical-inversion`, `ColemanIntegration:L2/inversion-relation`, `ColemanIntegration:L2/values-at-tame-roots-of-unity`, `ColemanIntegration:L2/dilogarithm-identities`, `mathlib:HurwitzZeta.expZeta`, `mathlib:HurwitzZeta.hasSum_expZeta_of_one_lt_re`, `mathlib:ZMod.LFunction`, `mathlib:ZMod.LFunction_stdAddChar_eq_expZeta`, `mathlib:HurwitzZeta.cosZeta_two_mul_nat`, `mathlib:HurwitzZeta.sinZeta_two_mul_nat_add_one`, `mathlib:Complex.hasSum_taylorSeries_neg_log`.

*Sources.*

- An introduction to p-adic L-functions, Remark 6.6 and Theorem 6.7(i), p. 40 (arXiv v2): “More precisely, for s, z ∈ C, let Li_s(z) := Σ_{n≥1} z^n/n^s be the polylogarithm fuction; recall that it admits a unique analytic continuation to C\{z ∈ R : z ≥ 1}. In particular, one sees that Li_s(1) = ζ(s), and Li_1(z) = − log(1 − z).” The complex polylogarithm used in Theorem 6.7(i).
- On the p-adic Beilinson conjecture for number fields, Proof of Proposition 4.17, p. 22 (arXiv v2): “because P_n(η^a) = (Li_n(η^a) + χ_σ^{−1}(−1)Li_n(η^{−a}))/2 by our assumption on χ(−1), where Li_n is computed using the power series in (4.1).” Complex values at roots of unity as convergent series, and the parity pairing of ζ and ζ^{−1}.
- The syntomic regulator for the K-theory of fields, Remark 1.5, p. 870 (published): “Note that this formula is different from the classical case, where one uses the real or imaginary part of the functions Σ_{j=0}^{n−1} (B_j 2^j/j!) Li_{n−j}(z) log^j|z|” The p-adic and complex normalisations differ.

### What is missing

- Coverage status: `partial`. Every target of the stage text is realised by a node: existence and uniqueness in the Coleman category with the base-point normalisation at 0 (made explicit as a tangential normalisation), the differential recursion, the distribution, inversion and Frobenius relations (with the explicit overconvergent series g_k and the integral function ℓ_k), branch dependence, the explicit non-example to 'local antiderivatives determine Li_k', values at tame and at p-power roots of unity, the power-series expansion at a root of unity with its logarithmic growth (for L3), norm/trace and twisted-sum compatibilities for primitive characters, compatibility with automorphisms and embeddings of the coefficients, values in finite extensions, and the complex polylogarithm at roots of unity (cited from Polylogarithms P.1 and Mathlib). The dilogarithm identities used by PadicHodgeRegulators D.1 and HabiroNahmSeries HB.9 (reflection, D_p, its branch and Frobenius relations, five-term relation) are included.
- Close the gap 'five-term relation for D^a in maximally degenerate configurations' (two-variable lemma, or an L1 rescoping).
- Coleman 1982 (Invent. Math. 69) was not read (no public copy): the Frobenius and distribution relations are proved here from L1 and checked numerically; when a copy is available, compare Propositions 6.1-6.4 and 7.1 with these nodes and record the misprints Besser-de Jeu point out.
- **Gap: The five-term relation for D^a in maximally degenerate configurations.** The proof of the five-term relation in ColemanIntegration:L2/five-term-relation is complete when some four of the five points, after a Möbius normalisation, have pairwise distinct reductions (Coleman functions on P¹ minus four points with good reduction, ColemanIntegration L1, and S_5-symmetry). For the remaining configurations (stable reduction a chain of three components, e.g. (∞, 0, 1, x, y) with |y| < |x| < 1) the argument proposed is a two-variable one: on such a region every argument lies in a residue disc of 0, 1 or ∞, D^a is given there by explicit log-series, the signed sum is a convergent series in x and y/x with polynomial dependence on log_a x and log_a y whose partial differentials vanish, hence it is constant, and the limit y → 0 gives 0. No source read carries this out: Wojtkowiak (Proposition 4.4) proves constancy using Coleman's logarithmic F-crystals on C_p minus arbitrary finite sets (Theorem A, from Coleman 1982, §V), which is beyond the good-reduction scope of ColemanIntegration L1, and GSWZ state the relation for D_p without proof. The relation is confirmed numerically (p = 5, branches a = 0, 1) at (x, y) = (5, 25) and (1/5, 1/25). NEXT ACTION: write out the two-variable log-series argument as its own lemma node (with the uniqueness of expansions in A(D⁻(0,1)²)[log x, log y]), or rescope ColemanIntegration L1 to Coleman functions on P¹ minus finite sets with semistable reduction (see restructure). Needed by `ColemanIntegration:L2/five-term-relation`.

## L3 Positive integer values

For $\theta$ nontrivial and primitive of conductor $N$ and every $k\ge1$, $L_p(\theta\omega^{1-k},k) = (1-\theta(p)p^{-k})G(\theta^{-1})^{-1}\sum_c\theta^{-1}(c)\mathrm{Li}_k(\varepsilon_N^c)$. The proof generalises the notes' §6.2 in three steps:

1. the $L$-value is a negative moment of the measure $\mu_\theta$;
2. $\mu_\theta$ is a Gauss-sum combination of the geometric measures $\mu_w$;
3. the negative moments of $\mu_w$ are $\mathrm{Li}_k(w) - p^{-k}\mathrm{Li}_k(w^p)$. The Euler factor comes from the distribution relation.

For pure $p$-power conductor $\mu_\theta$ is not defined, and the notes' argument has a gap even at $k=1$ (`ColemanIntegration/E17`). There a smoothed measure $\mu_b$ takes its place. The layer also gives:

- the complex formula through `expZeta`;
- the case $k=1$, which recovers Theorem 6.1;
- comparisons with the notes' distribution argument and with the bounded-measure argument of Bannai–Hagihara–Yamada–Yamamoto;
- the distinction from arbitrary locally analytic solutions, and independence of the auxiliary choices;
- the regulator interpretation. This covers Besser–de Jeu's syntomic regulator of cyclotomic elements, and the $p$-adic Beilinson conjecture, stated as a proposition and proved for Dirichlet motives following Besser–Buckingham–de Jeu–Roblot.

### Objects

#### Construction. The geometric measure mu_w of a point outside the residue disc of 1

*Module* `TauCeti/NumberTheory/Padics/ColemanFormula.lean`. *Node* `ColemanIntegration:L3/geometric-measure`.

Let K be a finite extension of Q_p inside C_p and w in K with |w| <= 1 and |w - 1| = 1 (w lies in the closed unit disc but not in the residue disc D^-(1,1) of 1). The geometric measure mu_w in Lambda(Z_p) (x) O_K is the unique bounded measure on Z_p with Amice transform A_{mu_w}(T) = w(1+T)/(1 - w(1+T)) = Li_0(w(1+T)) = w/(1-w) + sum_{m>=1} w^m (1-w)^{-m-1} T^m, where Li_0(z) = z/(1-z). Its values on residue classes are mu_w(a + p^m Z_p) = w^a/(1 - w^{p^m}) for 0 < a <= p^m, and mu_w = sum_{n>=1} w^n delta_n when |w| < 1.

*Hypotheses.* K is a finite extension of Q_p (so that the bounded Mahler-Amice theory of RJW Theorem 3.25 applies over O_K). |w| <= 1 and |w - 1| = 1; for w in the residue disc of 1 the series below is unbounded and no measure exists.

*API.*

- `geometricMeasure` (*constructor*) — For w in K with |w| <= 1 and |w - 1| = 1, the bounded measure mu_w in D(Z_p, K).
- `amiceTransform_geometricMeasure` (*characterisation*) — A_{mu_w}(T) = w(1+T) (1 - w(1+T))^{-1} in K[[T]].
- `geometricMeasure_residueClass` (*simp*) — mu_w(1_{a + p^m Z_p}) = w^a/(1 - w^{p^m}) for 0 < a <= p^m.
- `geometricMeasure_moment` (*relation*) — int x^j . mu_w = Li_{-j}(w) := (z d/dz)^j (z/(1-z)) at z = w, for j >= 0 (RJW Corollary 3.30).
- `geometricMeasure_eq_tsum_dirac` (*compatibility*) — For |w| < 1, mu_w = sum_{n>=1} w^n delta_n (convergent in the weak topology).
- `geometricMeasure_norm_le_one` (*other*) — mu_w takes C(Z_p, O_K) into O_K.
- `geometricMeasure_psi` (*relation*) — psi(mu_w) = mu_{w^p}, hence Res_{pZ_p} mu_w = phi(mu_{w^p}) and Res_{Z_p^x} mu_w = mu_w - phi(mu_{w^p}); this is the distribution relation sum_{xi in mu_p} Li_0(xi z) = p Li_0(z^p) for the rational function Li_0.
- `geometricMeasure_rotate` (*relation*) — For xi in mu_{p^infinity}, xi^x mu_w = mu_{xi w} (RJW §3.5.2).
- `geometricMeasure_galois` (*functoriality*) — For a continuous automorphism sigma of C_p over Q_p, sigma o mu_w = mu_{sigma(w)}.

*Used by.*

- Besser, Finite and p-adic polylogarithms, proof of Proposition 2.1 — Coleman's formula Li_n^{(p)}(z) = int_{Z_p^x} x^{-n} d mu_z, with mu_z = mu_w + delta_0, gives integrality and the reduction mod p of Li_n^{(p)}
- BHYY, Proposition 5.6 and Theorem 5.5 with F = Q — the measure attached to the generating function t/(1-t) at a torsion point xi, whose negative moments on units are the values of Li_k^{(p)}
- `ColemanIntegration:L3/mu-theta-as-sum-of-geometric-measures` — mu_theta is the Gauss-sum weighted combination of the mu_{eps^c}
- `ColemanIntegration:L3/negative-moments-of-geometric-measure` — its negative moments on Z_p^x are the modified polylogarithms Li_k(w) - p^{-k} Li_k(w^p)
- PadicHodgeRegulators D.3 — the finite-polylogarithm congruence of the p-adic dilogarithm is the reduction mod p of the negative moments of mu_w (Besser Proposition 2.1)

*Unit tests.* A wrong definition fails one of these.

- `geometricMeasure_total_mass` (computation) — mu_w(Z_p) = w/(1-w); for p odd and w = -1 this is -1/2.
- `geometricMeasure_residue_classes_p3` (computation) — For p = 3 and w = -1: mu_{-1}(1 + 3Z_3) = -1/2, mu_{-1}(2 + 3Z_3) = 1/2, mu_{-1}(3Z_3) = -1/2.
- `geometricMeasure_zero` (degenerate) — w = 0 gives mu_0 = 0.
- `geometricMeasure_small` (compatibility) — For |w| < 1, mu_w = sum_{n>=1} w^n delta_n, and int_{Z_p^x} x^{-k} . mu_w = sum_{n>=1, p not | n} w^n n^{-k}.
- `geometricMeasure_not_near_one` (non-example) — For w = zeta_p a primitive p-th root of unity the coefficients w^m (1-w)^{-m-1} have absolute value p^{(m+1)/(p-1)}, unbounded, so the formula defines no measure: the pure p-power conductor case needs the smoothed measure.

*Construction.*

1. |1 - w| = 1 and |w| <= 1 give |w^m (1-w)^{-m-1}| <= 1, so A(T) := w(1+T)/(1 - w(1+T)) lies in O_K[[T]].
2. By the bounded Mahler-Amice bijection M(Z_p, O_K) = O_K[[T]] (RJW Theorem 3.25; PadicMeasuresIwasawaAlgebras:L2) there is a unique measure with this transform; uniqueness is mathlib:AbstractMeasure.injective_amiceTransform.
3. Residue classes: by RJW (3.6), mu(a + p^m Z_p) = p^{-m} sum_{xi in mu_{p^m}} xi^{-a} A_mu(xi - 1), and p^{-m} sum_xi xi^{-a} w xi/(1 - w xi) = w^a/(1 - w^{p^m}) for 0 < a <= p^m (an identity of rational functions of w, checked by expanding in w for |w| < 1).
4. For |w| < 1 the Amice transform of sum_{n>=1} w^n delta_n is sum_n w^n (1+T)^n = Li_0(w(1+T)).

*Acceptance.*

- Total mass: mu_w(Z_p) = A_{mu_w}(0) = w/(1-w).
- Additivity check: for p = 3 and w = -1, mu(3Z_3) = -1/2, mu(1+3Z_3) = -1/2, mu(2+3Z_3) = 1/2, summing to w/(1-w) = -1/2.
- mu_w + delta_0 is the measure mu_z of Besser (Finite and p-adic polylogarithms, proof of Proposition 2.1); they have the same restriction to Z_p^x.

*Uses.* `PadicMeasuresIwasawaAlgebras:L2`, `mathlib:AbstractMeasure`, `mathlib:AbstractMeasure.amiceTransform`, `mathlib:AbstractMeasure.injective_amiceTransform`.

*Sources.*

- Finite and p-adic polylogarithms, proof of Proposition 2.1, p. 2 (arXiv v1): “where µ_z is the measure on Z_p defined by µ_z(a + p^mZ_p) = z^a/(1 − z^{p^m}), a = 0, 1, …, p^m − 1.” The same measure up to the Dirac mass at 0 (Besser's a = 0 term is 1/(1 - z^{p^m}), ours is z^{p^m}/(1 - z^{p^m})).
- An introduction to p-adic L-functions, (3.6), §3.5.3, p. 20 (arXiv v2): “A_{Res_{b+p^nZ_p}(μ)}(T) = (1/p^n) Σ_{ξ∈μ_{p^n}} ξ^{−b} A_μ((1+T)ξ − 1).” Formula for the values on residue classes.
- An introduction to p-adic L-functions, Theorem 3.25, p. 18 (arXiv v2): “The Mahler transform gives an O_L-algebra isomorphism M(Z_p, O_L) → O_L[[T]].” Existence and uniqueness of mu_w from its bounded transform.

#### Construction. Taylor expansions of Coleman's polylogarithms on a residue disc as Amice transforms

*Module* `TauCeti/NumberTheory/Padics/ColemanFormula.lean`. *Node* `ColemanIntegration:L3/polylog-primitive-on-residue-disc`.

Fix a branch log_lambda and Coleman's polylogarithms Li_k (k >= 0; ColemanIntegration:L2/p-adic-polylogarithm). For w in a finite extension K of Q_p with |w| <= 1 and |w - 1| = 1, and k >= 0, let Ftilde^{(k)}_w(T) in K[[T]] be the Taylor expansion at T = 0 of T -> Li_k(w(1+T)). Then (a) Ftilde^{(k)}_w lies in R^+ (it converges on |T| < 1) and Ftilde^{(k)}_w(t) = Li_k(w(1+t)) for every t in C_p with |t| < 1; (b) Ftilde^{(0)}_w = A_{mu_w}; (c) (1+T) d/dT Ftilde^{(k)}_w = Ftilde^{(k-1)}_w for k >= 1. The locally analytic distribution mutilde^{(k)}_w in D^la(Z_p, K) with Amice transform Ftilde^{(k)}_w (RJW Theorem 3.43) satisfies x . mutilde^{(k)}_w = mutilde^{(k-1)}_w and x^k . mutilde^{(k)}_w = mu_w. For w a root of unity of order not a power of p, (a) and (c) are ColemanIntegration:L2/polylogarithm-expansion-at-a-root-of-unity (a), which adds the logarithmic growth of the coefficients; the general w is needed for the geometric measures of ColemanIntegration:L3/geometric-measure.

*Hypotheses.* |w| <= 1 and |w - 1| = 1, so the residue disc {w(1+t) : |t| < 1} of w contains none of 0, 1, infinity when |w| = 1, and is D^-(0,1) when |w| < 1. k >= 0; the construction does not depend on the branch, since Li_k is independent of the branch outside the residue discs of 1 and infinity (Besser-de Jeu, proof of Proposition 2.6).

*API.*

- `polylogPrimitive` (*constructor*) — Ftilde^{(k)}_w in K[[T]], the Taylor series of Li_k(w(1+T)) at T = 0.
- `polylogPrimitive_mem_openDisc` (*characterisation*) — Ftilde^{(k)}_w is restricted at every radius c < 1 (mathlib:PowerSeries.IsRestricted), i.e. lies in R^+.
- `polylogPrimitive_eval` (*simp*) — Ftilde^{(k)}_w(t) = Li_k(w(1+t)) for |t| < 1; in particular Ftilde^{(k)}_w(0) = Li_k(w) and Ftilde^{(k)}_w(xi - 1) = Li_k(xi w) for xi in mu_{p^infinity}.
- `polylogPrimitive_zero` (*simp*) — Ftilde^{(0)}_w = A_{mu_w}.
- `polylogPrimitive_derivation` (*relation*) — (1+T) d/dT Ftilde^{(k)}_w = Ftilde^{(k-1)}_w for k >= 1.
- `polylogDistribution` (*constructor*) — mutilde^{(k)}_w in D^la(Z_p, K) with Amice transform Ftilde^{(k)}_w.
- `polylogDistribution_mul_x_pow` (*relation*) — x^k . mutilde^{(k)}_w = mu_w.
- `polylogPrimitive_of_norm_lt_one` (*compatibility*) — For |w| < 1, Ftilde^{(k)}_w = sum_{n>=1} w^n (1+T)^n n^{-k}.

*Used by.*

- RJW §6.2, Lemmas 6.4 and 6.5 (k = 1) — for tame part D > 1, RJW's Ftilde_theta is G(theta^{-1})^{-1} sum theta^{-1}(c) Ftilde^{(1)}_{eps^c}, and Lemma 6.5 is x mutilde^{(1)} = mu
- `ColemanIntegration:L3/negative-moments-of-geometric-measure` — the restriction of mutilde^{(k)}_w to Z_p^x computes int_{Z_p^x} x^{-k} mu_w
- `ColemanIntegration:L3/coleman-functions-versus-locally-analytic` — a single rigid power series on the whole residue disc is what an arbitrary locally analytic primitive lacks

*Unit tests.* A wrong definition fails one of these.

- `polylogPrimitive_at_zero_point` (degenerate) — w = 0: Ftilde^{(k)}_0 = 0 for every k >= 0.
- `polylogPrimitive_weight_one` (computation) — Ftilde^{(1)}_w(T) = -log(1 - w) + sum_{m>=1} (w/(1-w))^m T^m/m, with log(1 - w) branch independent because 1 - w is a unit.
- `polylogPrimitive_derivation_weight_one` (characterisation) — (1+T) d/dT Ftilde^{(1)}_w = w(1+T)/(1 - w(1+T)) = A_{mu_w}.
- `polylogPrimitive_small_w` (compatibility) — For |w| < 1, Ftilde^{(k)}_w = sum_{n>=1} w^n (1+T)^n/n^k.
- `polylogPrimitive_not_near_one` (non-example) — For w = zeta_p (in the residue disc of 1) the Taylor series of Li_1(w(1+T)) at 0 has radius |zeta_p - 1| = p^{-1/(p-1)} < 1, so it is not in R^+.

*Construction.*

1. ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs: the restriction of Li_k to a residue disc not meeting 0, 1, infinity is a single power series convergent on the whole disc; for |w| < 1, Li_k(z) = sum z^n/n^k (ColemanIntegration:L2/p-adic-polylogarithm). This gives (a).
2. Li_0(z) = z/(1-z) and ColemanIntegration:L3/geometric-measure give (b).
3. z d/dz Li_k = Li_{k-1} (ColemanIntegration:L2/differential-recursion) with z = w(1+T), so z d/dz = (1+T) d/dT; this gives (c).
4. RJW Lemma 3.29 extended to distributions (RJW Remark 3.45; LocallyAnalyticDistributions:L1): A_{x lambda} = (1+T) d/dT A_lambda. By (c) and injectivity of the Amice transform on D^la (RJW Theorem 3.43), x mutilde^{(k)} = mutilde^{(k-1)}; mutilde^{(0)}_w is mu_w viewed as a distribution (RJW Remark 3.44).

*Acceptance.*

- At k = 1, Ftilde^{(1)}_w(T) = -log(1 - w) + sum_{m>=1} (w/(1-w))^m T^m/m; RJW's power series log((1+T) eps - 1) has the same expansion up to sign and the constant log_p(-1) = 0.
- For |w| < 1, Ftilde^{(k)}_w(T) = sum_{n>=1} w^n (1+T)^n/n^k.

*Uses.* `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L3/geometric-measure`, `LocallyAnalyticDistributions:L1`, `mathlib:PowerSeries.derivative`, `mathlib:PowerSeries.IsRestricted`, `ColemanIntegration:L2/differential-recursion`, `ColemanIntegration:L2/polylogarithm-expansion-at-a-root-of-unity`.

*Sources.*

- An introduction to p-adic L-functions, Theorem 3.43, p. 25 (arXiv v2): “The Mahler transform induces a bijection D^la(Z_p, L) → R^+ ⊂ L[[T]].” Existence and uniqueness of the distribution with transform Ftilde^{(k)}_w.
- An introduction to p-adic L-functions, Lemma 3.29, p. 19, and Remark 3.45, p. 25 (arXiv v2): “We have A_{xμ} = ∂A_μ, where ∂ denotes the differential operator (1+T) d/dT. ... every part of our ‘measure-theoretic toolbox’ from §3.5 ... carries over identically to the setting of locally analytic distributions.” Multiplication by x on distributions is (1+T) d/dT on transforms.
- An introduction to p-adic L-functions, §6.2, p. 37 (arXiv v2): “if we define F̃_θ(T) = −(1/G(θ^{−1})) Σ_{c∈(Z/NZ)^×} θ^{−1}(c) log((1+T)ε_N^c − 1), then formally ∂F̃_θ = F_θ” The case k = 1, combined over c, which this construction generalises to every k.
- Finite and p-adic polylogarithms, §1, p. 1 (arXiv v1): “Coleman defined p-adic polylogarithms, Li_n : C_p → C_p. These functions are locally analytic in the sense that they are given by a convergent power series on each residue disc in C_p.” The analyticity on residue discs that (a) uses.

#### Construction. The smoothed polylogarithm on the residue disc of 1

*Module* `TauCeti/NumberTheory/Padics/ColemanFormula.lean`. *Node* `ColemanIntegration:L3/smoothed-polylog-combination`.

Let b > 1 be an integer prime to p and k >= 0. On the punctured residue disc D^-(1,1) minus {1} put Phi^{(k)}_b(z) := -Li_k(z) + b^{1-k} Li_k(z^b) + (b - 1) log(z)^k/k!, where log is the logarithm series on D^-(1,1) (branch independent). Then Phi^{(k)}_b extends to a rigid analytic function on the whole disc D^-(1,1), and: (a) Phi^{(0)}_b(z) = F_b(z - 1) = 1/(z-1) - b/(z^b - 1); (b) z d/dz Phi^{(k)}_b = Phi^{(k-1)}_b for k >= 1; (c) for w in D^-(1,1) (in a finite extension K of Q_p), Ftilde^{(k)}_{b,w}(T) := Phi^{(k)}_b(w(1+T)) lies in R^+ and (1+T) d/dT applied k times to it gives A_{w^x mu_b}(T) = F_b(w(1+T) - 1); (d) Phi^{(1)}_b(1) = -log_p(b) and, for k >= 2, Phi^{(k)}_b(1) = -(1 - b^{1-k}) Li_k(1), with Li_k(1) the limit of Li_k(z) as z -> 1 (ColemanIntegration:L2/value-at-one). Phi^{(k)}_b does not depend on the branch of the logarithm.

*Hypotheses.* b > 1 an integer prime to p (for b = 1 the combination is 0). Li_k with any branch log_lambda; the combination is branch independent.

*API.*

- `smoothedPolylog` (*constructor*) — Phi^{(k)}_b, a rigid analytic function on D^-(1,1).
- `smoothedPolylog_analyticOnNhd` (*characterisation*) — Phi^{(k)}_b is analytic on D^-(1,1), with the values at z = 1 given by smoothedPolylog_one (removable singularity).
- `smoothedPolylog_eq` (*characterisation*) — Phi^{(k)}_b(z) = -Li_k(z) + b^{1-k} Li_k(z^b) + (b-1) log(z)^k/k! for z in D^-(1,1), z != 1.
- `smoothedPolylog_zero` (*simp*) — Phi^{(0)}_b(z) = F_b(z - 1) = 1/(z-1) - b/(z^b - 1).
- `smoothedPolylog_deriv` (*relation*) — z d/dz Phi^{(k)}_b = Phi^{(k-1)}_b.
- `smoothedPolylog_one` (*simp*) — Phi^{(1)}_b(1) = -log_p(b); Phi^{(k)}_b(1) = -(1 - b^{1-k}) Li_k(1) for k >= 2.
- `smoothedPolylog_rootOfUnity` (*simp*) — For zeta in mu_{p^infinity}, zeta != 1: Phi^{(k)}_b(zeta) = -Li_k(zeta) + b^{1-k} Li_k(zeta^b).
- `smoothedPolylog_expansion` (*other*) — Ftilde^{(k)}_{b,w} := Phi^{(k)}_b(w(1+T)) lies in R^+ and its k-fold image under (1+T) d/dT is A_{w^x mu_b}.
- `smoothedPolylog_branch_independent` (*other*) — Phi^{(k)}_b computed with any two branches log_lambda, log_lambda' is the same function.

*Used by.*

- RJW §7, (7.5) and Lemmas 7.3-7.5 — Phi^{(1)}_a(1+T) is RJW's Ftilde_a, used for the residue of zeta_p at s = 1
- `ColemanIntegration:L3/negative-moments-of-smoothed-measure` — its values give the negative moments of the rotated smoothed measures, hence the pure p-power conductor case of Coleman's formula
- `ColemanIntegration:L3/coleman-formula-trivial-character` — its value at z = 1 gives Coleman's formula for L_p(omega^{1-k}, k)

*Unit tests.* A wrong definition fails one of these.

- `smoothedPolylog_weight_one` (computation) — Phi^{(1)}_b(1+T) = log(T(1+T)^{b-1}/((1+T)^b - 1)), with value -log_p(b) at T = 0 (RJW (7.8)).
- `smoothedPolylog_weight_zero` (degenerate) — Phi^{(0)}_b(1+T) = F_b(T) in Z_p[[T]], and Phi^{(0)}_b(1) = (b - 1)/2.
- `smoothedPolylog_b_eq_one` (degenerate) — For b = 1 the defining combination is identically 0 for every k.
- `smoothedPolylog_parts_singular` (non-example) — For k >= 1 neither -Li_k(z) nor b^{1-k} Li_k(z^b) alone is analytic on D^-(1,1): each contains -+(log z)^{k-1} log_lambda(1 - z)/(k-1)!.
- `smoothedPolylog_branch_invariance` (characterisation) — Phi^{(k)}_b computed with log_lambda and with the Iwasawa branch coincide.

*Construction.*

1. ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs: on D^-(1,1) minus {1}, Li_k(z) = -(log z)^{k-1} log_lambda(1 - z)/(k-1)! + h_k(z) with h_k analytic on D^-(1,1) (k >= 1).
2. Since log(z^b) = b log z on D^-(1,1), b^{1-k} (log z^b)^{k-1} = (log z)^{k-1}, so Phi^{(k)}_b(z) = ((log z)^{k-1}/(k-1)!) log_lambda((1 - z^b)/(1 - z)) - h_k(z) + b^{1-k} h_k(z^b) + (b - 1)(log z)^k/k!.
3. (1 - z^b)/(1 - z) = 1 + z + ... + z^{b-1} is analytic on D^-(1,1), equals b at z = 1 and has no zero there (a zero would be a b-th root of unity != 1 in D^-(1,1), impossible as p does not divide b); so log_lambda of it is log_p(b) + log((1 + ... + z^{b-1})/b), analytic and branch independent (ColemanIntegration:L0/log-branch-change). Hence Phi^{(k)}_b is analytic on D^-(1,1); for k = 0 the poles of the two rational terms cancel directly.
4. (a) is algebra with Li_0(z) = z/(1-z). (b): z d/dz Li_k(z) = Li_{k-1}(z), z d/dz Li_k(z^b) = b Li_{k-1}(z^b), z d/dz (log z)^k/k! = (log z)^{k-1}/(k-1)!.
5. (c): w(1+T) runs through D^-(1,1) for |T| < 1, so the composite is in R^+; under z = w(1+T), (1+T) d/dT = z d/dz, and by (b) and (a) the k-fold derivative is F_b(w(1+T) - 1), the Amice transform of w^x mu_b (RJW §3.5.2).
6. (d): as z -> 1, (log z)^{k-1} log_lambda((1-z^b)/(1-z)) -> 0 for k >= 2 and (log z)^k -> 0, so Phi^{(k)}_b(1) = -(1 - b^{1-k}) h_k(1) and h_k(1) = Li_k(1); for k = 1, Phi^{(1)}_b(1) = log(1/b) = -log_p(b).
7. Branch independence: Li_{k,lambda}(z) - Li_{k,lambda'}(z) = -v(1 - z)(lambda - lambda')(log z)^{k-1}/(k-1)! on D^-(1,1) (Besser-de Jeu Proposition 2.6) and v(1 - z^b) = v(1 - z).

*Acceptance.*

- b = 2, k = 1: Phi^{(1)}_2(1+T) = log(T(1+T)/((1+T)^2 - 1)) = log((1+T)/(2+T)), RJW's Ftilde_2 of (7.5).
- Phi^{(0)}_b(1) = F_b(0) = (b - 1)/2.

*Uses.* `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L0/iwasawa-logarithm`, `LocallyAnalyticDistributions:L1`, `DirichletPadicLFunctions:L1`, `PadicMeasuresIwasawaAlgebras:L2`, `ColemanIntegration:L2/value-at-one`, `ColemanIntegration:L0/log-branch-change`.

*Sources.*

- An introduction to p-adic L-functions, §7, (7.5), p. 42 (arXiv v2): “F̃_a(T) = log( T/((1+T)^a − 1) · (1+T)^{a−1} ).” The case k = 1 of Phi^{(k)}_a(1+T), used by RJW for the residue of zeta_p at s = 1.
- The syntomic regulator for K-theory of fields, §2, p. 10 (arXiv v2): “According to [Col82, Proposition 7.1], Li_{n,a}(z) − Li_{n−1,a}(z) log(z) extends to an analytic function on |1−z| < 1. (Note that B(0,1) should be replaced with B(1,1) everywhere in the formulation and the proof of loc. cit.)” The local behaviour of Li_n at 1 that step 1 uses, in the corrected form with the factor 1/(n-1) (ColemanIntegration/E10).
- The syntomic regulator for K-theory of fields, Proposition 2.6, p. 10 (arXiv v2): “Li_{n,a}(z) − Li_{n,b}(z) = −(1/n!) v(1−z) β (log_a^{n−1}z + log_a^{n−2}z log_b z + ⋯ + log_b^{n−1}z).” Branch dependence, which cancels in Phi^{(k)}_b.

#### Definition. The modified p-adic polylogarithm of the syntomic regulator

*Module* `TauCeti/NumberTheory/Padics/PadicBeilinson.lean`. *Node* `ColemanIntegration:L3/padic-regulator-polylogarithm`.

For n >= 2 and a branch log = log_lambda, the modified p-adic polylogarithm L^mod_n : C_p minus {0, 1} -> C_p is L^mod_n(z) := sum_{j=0}^{n-1} (B_j/j!) Li_{n-j}(z) log(z)^j, with B_j the Bernoulli numbers (t/(e^t - 1) = sum B_j t^j/j!, B_1 = -1/2; mathlib:bernoulli) and Li_m Coleman's polylogarithms for the same branch. It satisfies L^mod_n(z) + (-1)^n L^mod_n(1/z) = 0, L^mod_n(z^m) = m^{n-1} sum_{zeta^m = 1} L^mod_n(zeta z) for z^m != 0, 1, and L^mod_n(zeta) = Li_n(zeta) for every root of unity zeta != 1.

*Hypotheses.* n >= 2; the same branch for log and the Li_m; z != 0, 1.

*API.*

- `padicRegulatorPolylog` (*constructor*) — L^mod_n(z) = sum_{j<n} (B_j/j!) Li_{n-j}(z) log(z)^j.
- `padicRegulatorPolylog_inv` (*relation*) — L^mod_n(z) + (-1)^n L^mod_n(1/z) = 0 for z != 0, 1.
- `padicRegulatorPolylog_distribution` (*relation*) — L^mod_n(z^m) = m^{n-1} sum_{zeta^m = 1} L^mod_n(zeta z) for z^m != 0, 1.
- `padicRegulatorPolylog_rootOfUnity` (*simp*) — L^mod_n(zeta) = Li_n(zeta) for zeta a root of unity, zeta != 1.
- `padicRegulatorPolylog_two` (*example*) — L^mod_2(z) = Li_2(z) - (1/2) log(z) Li_1(z).
- `padicRegulatorPolylog_galois` (*functoriality*) — For a branch with lambda in Q_p and sigma a continuous automorphism of C_p over Q_p, L^mod_n(sigma z) = sigma(L^mod_n(z)) (Besser-de Jeu Remark 2.3).
- `padicRegulatorPolylog_specialUnit_branch` (*other*) — On special units (|z| = |1 - z| = 1) L^mod_n(z) does not depend on the branch.

*Used by.*

- Besser-de Jeu, Theorems 1.6, 1.10 and 1.12 — the syntomic regulator maps the symbol [x]_n to ±(n-1)! L^mod_n(sigma(x))
- BBdJR, Theorem 4.14 and Proposition 4.17 — R_{n,p}(M_pi^E) is (n-1)! |G|^{-1} sum chi^{-1}(a) L^mod_n(eta_p^a)
- PadicHodgeRegulators D.1 and D.2 — the weight-two case L^mod_2 = Li_2 - (1/2) log . Li_1 is the modified dilogarithm compared with the syntomic regulator on K_3
- `ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements` — the regulator of the cyclotomic element [zeta]_n

*Unit tests.* A wrong definition fails one of these.

- `padicRegulatorPolylog_weight_two` (computation) — L^mod_2(z) = Li_2(z) - (1/2) log(z) Li_1(z).
- `padicRegulatorPolylog_at_root_of_unity` (degenerate) — L^mod_n(zeta) = Li_n(zeta) for zeta in mu_infinity minus {1}; for p odd, L^mod_n(-1) = (2^{1-n} - 1) Li_n(1).
- `padicRegulatorPolylog_inversion` (characterisation) — L^mod_n(z) + (-1)^n L^mod_n(1/z) = 0; for n = 2 and z = 2 this relates L^mod_2(2) and L^mod_2(1/2).
- `padicRegulatorPolylog_ne_Li` (non-example) — For the Iwasawa branch and z = p + p^2, L^mod_2(z) - Li_2(z) = (1/2) log(1 + p) log(1 - p - p^2) != 0: L^mod_n is not Li_n away from roots of unity.
- `padicRegulatorPolylog_vs_complex` (compatibility) — Zagier's complex single-valued P_n (Polylogarithms:P.1/single-valued-polylogarithm) uses coefficients 2^j B_j/j! and log|z|; at roots of unity both reduce to Li_n up to taking real or imaginary parts.

*Construction.*

1. Definition from Besser-de Jeu (Remark 1.5) and BBdJR ((4.12) with c_j = B_j).
2. Inversion: Li_m(z) + (-1)^m Li_m(1/z) = -log(z)^m/m! (Coleman; Besser-de Jeu (1.2), supplied by ColemanIntegration:L2/inversion-relation) and sum_{j=0}^{n-1} B_j/(j!(n-j)!) = 0 for n >= 2 give the functional equation (Besser-de Jeu, before Remark 1.5).
3. Distribution: from ColemanIntegration:L2/distribution-relation for each Li_m and log(zeta z) = log z for zeta a root of unity.
4. At roots of unity log(zeta) = 0 and B_0 = 1.

*Acceptance.*

- n = 2: L^mod_2 = Li_2 - (1/2) log . Li_1, Coleman's p-adic dilogarithm D(z) (Besser-de Jeu §1).

*Uses.* `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L2/distribution-relation`, `ColemanIntegration:L0/iwasawa-logarithm`, `mathlib:bernoulli`, `ColemanIntegration:L2/inversion-relation`.

*Sources.*

- The syntomic regulator for K-theory of fields, Remark 1.5, pp. 3-4 (arXiv v2): “Then the functions L_mod,n(z) defined by Σ_{j=0}^{n−1} (B_j/j!) Li_{n−j}(z) log^j(z) satisfy the above requirements as B_0 = 1, and the other identity holds by definition of the B_j if n ≥ 2.” The definition with the Bernoulli coefficients.
- On the p-adic Beilinson conjecture for number fields, §4, (4.12), p. 20 (arXiv v2): “P_{n,p}(z) = Σ_{j=0}^{n−1} c_j log_p^j(z) Li_{n−j}(z) (n ≥ 2) for any c_j in C_p satisfying c_0 = 1 and Σ_{j=0}^{n−1} c_j/(n−j)! = 0, so that P_{n,p}(z) + (−1)^n P_{n,p}(1/z) = 0.” The same function (BBdJR write P_{n,p}); BBdJR take c_j = b_j, the Bernoulli numbers.
- The syntomic regulator for K-theory of fields, §1, (1.2), p. 3 (arXiv v2): “These functions satisfy the functional equation Li_n(z) + (−1)^n Li_n(1/z) = (−1/n!) log^n(z), see Proposition 6.4 of [Col82].” The inversion relation used in step 2.

#### Definition. The p-adic Beilinson conjecture for Artin motives over Q, as a proposition

*Module* `TauCeti/NumberTheory/Padics/PadicBeilinson.lean`. *Node* `ColemanIntegration:L3/padic-beilinson-conjecture`.

Let k/Q be a finite Galois extension with group G, E a number field, pi an idempotent of E[G], n >= 2 with dim_E E[G]pi = dim_E pi K_{2n-1}(k)_E, p a prime, phi_infinity : k -> C and phi_p : k -> Qbar_p embeddings, F the closure of phi_p(k), and ordered E-bases of E[G]pi, M^E_pi = pi(E (x) k) and pi K_{2n-1}(k)_E. Let D(M^E_pi)^{1/2,*} (* = infinity, p) be the determinant of the pairing E[G]pi x M^E_pi -> E (x) C (resp. E (x) F) induced by (sigma, a) -> phi_*(sigma(a)), and R_{n,*}(M^E_pi) the determinant of the pairing E[G]pi x pi K_{2n-1}(k)_E -> E (x) C (resp. E (x) F) induced by (sigma, alpha) -> reg_*(phi_{* *}(sigma alpha)), with reg_infinity Beilinson's regulator and reg_p the syntomic regulator (BBdJR Definitions 3.5, 3.6). The proposition PBC(k, E, pi, n, p) is the conjunction of: (1) L(n, chi_pi (x) id, Q) D(M^E_pi)^{1/2,infinity} = e R_{n,infinity}(M^E_pi) in E (x) C for some e in E^x; (2) L_p(n, chi_pi (x) omega_p^{1-n}, Q) D(M^E_pi)^{1/2,p} = e_p Eul_p(n, chi_pi (x) id, Q) R_{n,p}(M^E_pi) in E (x) F for some e_p in E^x; (3) e_p = e; (4) L_p(n, chi_pi (x) omega_p^{1-n}, Q) and R_{n,p}(M^E_pi) are units of E (x) Q_p and E (x) F. This is a definition of a statement about defined objects; it is not asserted.

*Hypotheses.* n >= 2 and the dimension condition dim_E E[G]pi = dim_E pi K_{2n-1}(k)_E (by BBdJR Proposition 3.12 this holds exactly when the kernel field of E[G]pi is totally real and n is odd, or is CM, n is even and complex conjugation acts by -1). chi_pi is the character of Gal(Qbar/Q) on E[G]pi; L_p(s, chi_pi (x) omega_p^{1-n}, Q) is the p-adic Artin L-function of BBdJR §2 (Brauer induction from totally real fields); Eul_p is the Euler factor at p.

*API.*

- `padicBeilinsonConjecture` (*constructor*) — PBC(k, E, pi, n, p) : Prop, the conjunction of parts (1)-(4).
- `padicBeilinsonConjecture_basis_indep` (*other*) — The truth of each part does not depend on the chosen bases (BBdJR Remark 3.19(1)).
- `padicBeilinsonConjecture_coeff_ext` (*functoriality*) — PBC for pi in E[G] is equivalent to PBC for pi in E'[G], E' an extension of E (Remark 3.21(2)).
- `padicBeilinsonConjecture_orthogonal_sum` (*other*) — If pi = sum pi_i with orthogonal idempotents, PBC for all pi_i implies PBC for pi (Remark 3.21(1)).
- `padicBeilinsonConjecture_dimension_iff` (*characterisation*) — The dimension hypothesis holds iff the kernel field of E[G]pi is totally real with n odd, or CM with n even and complex conjugation acting by -1 (Proposition 3.12).
- `padicBeilinsonConjecture_quotient_group` (*functoriality*) — PBC for pi in E[G/N] is equivalent to PBC for its canonical lift to E[G] (Remark 3.23(1)).

*Used by.*

- BBdJR §3 and §7 — the conjecture and its numerical verification for S_3, D_8 and sextic examples
- PadicHodgeRegulators D.4 — 'a higher p-adic regulator conjecture remains a distinct proposition': this node is that proposition for Artin motives over Q
- RJW Remarks 6.2 and 6.8 — Theorems 6.1(ii) and 6.7(ii) are presented as instances of the p-adic Beilinson (Perrin-Riou) conjectures
- `ColemanIntegration:L3/padic-beilinson-for-dirichlet-motives` — parts (1)-(3) are proved for abelian pi

*Unit tests.* A wrong definition fails one of these.

- `pbc_dirichlet_instance` (computation) — k = Q(mu_N), chi primitive with chi(-1) = (-1)^{n-1}, pi its idempotent: both dimensions are 1, with bases pi, pi(1 (x) zeta_N) and pi(1 (x) [zeta_N]_n).
- `pbc_trivial_motive` (degenerate) — k = Q, pi = 1, n odd >= 3: part (2) relates L_p(n, omega^{1-n}) to (1 - p^{-n}) and the syntomic regulator of [-1]_n (BBdJR, N = 2 case of the proof of Proposition 4.17).
- `pbc_dimension_fails_imaginary_quadratic` (non-example) — k = Q(i), pi = (1 + c)/2, n = 2: dim E[G]pi = 1 but pi K_3(Q(i))_E = K_3(Q)_E = 0, so the proposition is not formed.
- `pbc_even_n_totally_real` (non-example) — k totally real and n even: pi K_{2n-1}(k)_E = 0 for every pi (Borel), so no instance exists.

*Construction.*

1. The ingredients: K_{2n-1}(k)_E and Beilinson's regulator (BorelRegulators:R.7), the syntomic regulator K_{2n-1}(O_F) -> F (PadicHodgeRegulators:D.2, BBdJR Lemma 2.15), complex Artin L-functions with coefficients (gap), p-adic Artin L-functions (AutomorphicPadicLFunctions:L3 and Brauer induction; for abelian characters DirichletPadicLFunctions:L3).
2. The quotients R_{n,*}/D^{1/2,*} are independent of the bases of E[G]pi and of phi_* (BBdJR Lemma 3.7), so each part is independent of the choices (Remark 3.19(1)).

*Acceptance.*

- For abelian k and pi attached to a primitive Dirichlet character, parts (1)-(3) are ColemanIntegration:L3/padic-beilinson-for-dirichlet-motives; part (4) is open (verified numerically by BBdJR Remark 4.19).

*Uses.* `BorelRegulators:R.7`, `PadicHodgeRegulators:D.2`, `AutomorphicPadicLFunctions:L3`, `DirichletPadicLFunctions:L3`, `Polylogarithms:P.4`.

*Planet:* p-adic Beilinson conjecture.

*Sources.*

- On the p-adic Beilinson conjecture for number fields, Conjecture 3.18, p. 14 (arXiv v2): “With notation as above, if dim_E(E[G]π) = dim_E(πK_{2n−1}(k)_E) for some n ≥ 2, then (1) in E ⊗_Q C we have L(n, χ_π⊗id, Q) D(M_π^E)^{1/2,∞} = e(n, M_π^E) R_{n,∞}(M_π^E) for some e(n, M_π^E) in (E ⊗_Q Q)^*;” The conjecture, parts (1)-(4); this node records it as a proposition.
- On the p-adic Beilinson conjecture for number fields, Definition 3.6, p. 11 (arXiv v2): “If dim_E(E[G]π) equals dim(K_{2n−1}(M_π^E)) then for ∗ = ∞ or p we let R_{n,∞}(M_π^E) be the determinant of the pairing [·,·]_∗, computed with respect to our fixed bases of E[G]π and K_{2n−1}(M_π^E).” The regulators (the printed R_{n,infinity} is R_{n,*}, ColemanIntegration/E24).
- On the p-adic Beilinson conjecture for number fields, Proposition 3.12, p. 12 (arXiv v2): “Then for n ≥ 2 the equality dim_E(E[G]π) = dim_E(K_{2n−1}(M_π^E)) holds precisely in the following cases: (1) k′ is totally real and n is odd; (2) k′ is a CM field, n is even, and the complex conjugation of k′ acts on E[G]π as multiplication by −1.” When the proposition is formed.

### Lemmas, theorems and comparisons

#### Lemma. p-adic L-values at positive integers as negative moments of the measure mu_theta

*Node* `ColemanIntegration:L3/padic-value-as-negative-moment`.

Let p be an odd prime and theta = chi*eta a nontrivial primitive Dirichlet character of conductor N = D p^n, where eta is primitive of conductor D > 1 with p not dividing D and chi is primitive of conductor p^n (n >= 0). Let L be a finite extension of Q_p inside C_p containing mu_N and the values of theta, and mu_theta = (mu_eta)_chi in Lambda(Z_p) (x) L the measure of RJW (5.5), with Amice transform F_theta (RJW Lemma 5.12). For every integer k >= 1, L_p(theta*omega^{1-k}, k) = int_{Z_p^x} x^{-k} . mu_theta. Here omega is the Teichmueller character, L_p(psi, s) is RJW Definition 5.18, and theta*omega^{1-k} = (chi*omega^{1-k})*eta, its p-part chi*omega^{1-k} being the finite-order character of Z_p^x it defines (trivial when chi = omega^{k-1}).

*Hypotheses.* p is an odd prime: RJW Definition 5.15 defines omega and <x> = omega^{-1}(x) x only for odd p. D > 1, so that eta is nontrivial and mu_eta is a bounded measure (RJW Theorem 5.7); D = 1 is ColemanIntegration:L3/padic-value-as-smoothed-negative-moment. k >= 1 is an integer; the integrand 1_{Z_p^x}(x) x^{-k} is continuous on Z_p.

*Proof outline.*

1. RJW Remark 5.19, (5.7): for psi = chi' eta with chi' a finite-order character of Z_p^x and every integer s, L_p(psi, s) = int_{Z_p^x} chi' omega^{s-1}(x) x^{-s} . mu_eta. This identity comes with the definition of L_p (DirichletPadicLFunctions:L3).
2. Take chi' = chi omega^{1-k} and s = k: chi' omega^{k-1} = chi on Z_p^x, so L_p(theta omega^{1-k}, k) = int_{Z_p^x} chi(x) x^{-k} . mu_eta.
3. By the definition of the twist (RJW (5.1)), int f . (mu_eta)_chi = int chi f . mu_eta for continuous f; with f = 1_{Z_p^x} x^{-k} this gives int_{Z_p^x} x^{-k} . mu_theta (DirichletPadicLFunctions:L2 supplies mu_theta).

*Acceptance.*

- At k = 1 the statement is RJW (6.2): L_p(theta, 1) = int_{Z_p^x} x^{-1} . mu_theta.
- When k = 1 (mod p - 1), omega^{1-k} = 1 and the left side is L_p(theta, k); for other k it is a different value, which is why RJW Theorem 6.7(ii) as printed fails (ColemanIntegration/E15).
- Parity: if theta(-1) = (-1)^k then theta omega^{1-k} is odd, L_p(theta omega^{1-k}, s) vanishes identically, and so does the negative moment.

*Uses.* `DirichletPadicLFunctions:L2`, `DirichletPadicLFunctions:L3`.

*Sources.*

- An introduction to p-adic L-functions, Remark 5.19, (5.7), p. 35 (arXiv v2); p. 147 of the version of record: “An equivalent definition is L_p(θ,s) = ∫_{Z_p^×} χω^{−1}(x)⟨x⟩^{−s}·μ_η = ∫_{Z_p^×} χω^{s−1}(x)x^{−s}·μ_η.” The identity of step 1, used at the integer s = k.
- An introduction to p-adic L-functions, (6.2), p. 37 (arXiv v2): “L_p(θ,1) := ∫_{Z_p^×} χ(x)x^{−1}·μ_η = ∫_{Z_p^×} x^{−1}·μ_θ.” The case k = 1, where no Teichmueller twist appears.
- p-adic polylogarithms and p-adic Hecke L-functions for totally real fields, proof of Theorem 5.8, p. 30 (arXiv v2): “L_p(χω_p^{1−k},k) = ∫ ω_p^{−1}(x)⟨N̂(x)⟩^{−k} dμ_{χω_p^{1−k}}(x) = ∫ ω_p^{−k}(x)⟨N̂(x)⟩^{−k} dμ_χ(x) = ∫ N̂(x)^{−k} dμ_χ(x)” The same computation for Hecke characters of a totally real field; F = Q is this lemma.

#### Lemma. p-adic L-values at positive integers for pure p-power conductor, through the smoothed measure

*Node* `ColemanIntegration:L3/padic-value-as-smoothed-negative-moment`.

Let p be an odd prime, chi a nontrivial primitive Dirichlet character of conductor p^n (n >= 1) with values in a finite extension L of Q_p, and k >= 1 an integer. Let b > 1 be an integer prime to p with chi(b) b^{1-k} != 1 (such b exist: x -> chi(x) x^{1-k} is a nontrivial continuous character of Z_p^x and the positive integers prime to p are dense in Z_p^x). Let mu_b in Lambda(Z_p) be the measure with Amice transform F_b(T) = 1/T - b/((1+T)^b - 1) (RJW Definition 4.5) and mu_{chi,b} = (mu_b)_chi its twist by chi. Then L_p(chi*omega^{1-k}, k) = (chi(b) b^{1-k} - 1)^{-1} int_{Z_p^x} x^{-k} . mu_{chi,b}.

*Hypotheses.* p is an odd prime (RJW's standing assumption for omega and <x>). chi has conductor p^n with n >= 1 (tame part D = 1); no bounded measure with Amice transform F_chi of RJW Lemma 5.12 exists in this case (ColemanIntegration/E17). b > 1 is an integer prime to p with chi(b) b^{1-k} != 1.

*Proof outline.*

1. RJW Definition 5.18 with eta = 1, zeta_eta = zeta_p: L_p(chi omega^{1-k}, k) = int_{Z_p^x} chi omega^{1-k}(x) <x>^{1-k} . zeta_p = int psi . zeta_p with psi(x) = chi(x) x^{1-k}, since omega(x) <x> = x.
2. zeta_p is a pseudo-measure with ([b] - [1]) zeta_p = x^{-1} Res_{Z_p^x}(mu_b) for every integer b > 1 prime to p (DirichletPadicLFunctions:L1: independence of the smoothing parameter; RJW Definition 4.10 uses a topological generator).
3. Evaluate the pseudo-measure at the nontrivial character psi by RJW (3.11) with g = b (PadicMeasuresIwasawaAlgebras:L3): int psi . zeta_p = (psi(b) - 1)^{-1} int_{Z_p^x} psi(x) x^{-1} . mu_b.
4. By the definition of the twist, int_{Z_p^x} chi(x) x^{-k} . mu_b = int_{Z_p^x} x^{-k} . mu_{chi,b} (DirichletPadicLFunctions:L2).

*Acceptance.*

- The right side does not depend on the admissible b.
- For chi = omega^{k-1} with k != 1 (mod p - 1), chi omega^{1-k} = 1 and the lemma computes the Kubota-Leopoldt value L_p(1, k) through zeta_p.
- At k = 1 it replaces RJW's use of mu_theta for pure p-power conductor in (6.2) by the smoothed measure, as RJW do in §7 for the trivial character.

*Uses.* `DirichletPadicLFunctions:L1`, `DirichletPadicLFunctions:L2`, `DirichletPadicLFunctions:L3`, `PadicMeasuresIwasawaAlgebras:L3`.

*Sources.*

- An introduction to p-adic L-functions, Definition 5.18, p. 35 (arXiv v2): “Let θ = χη be a Dirichlet character, where η has conductor D prime to p and χ has conductor p^n for n ≥ 0. Define L_p(θ,s) := ∫_{Z_p^×} χ(x)⟨x⟩^{1−s}·ζ_η, s ∈ Z_p.” With D = 1, zeta_eta is the pseudo-measure zeta_p.
- An introduction to p-adic L-functions, (3.11), §3.6, p. 22 (arXiv v2): “∫_G χ·λ := (χ(g) − 1)^{−1} ∫_G χ·([g] − [1])λ, where g ∈ G is any element such that χ(g) ≠ 1.” Evaluation of a pseudo-measure at a nontrivial character, used with g = b.
- An introduction to p-adic L-functions, Definitions 4.5 and 4.10, pp. 27-28 (arXiv v2): “Let µ_a be the measure on Z_p whose Mahler transform is F_a(T). ... Let a be a topological generator of Z_p^×. The p-adic zeta function is ζ_p := x^{−1}Res_{Z_p^×}(µ_a)/θ_a” The smoothed measure and the pseudo-measure zeta_p.

#### Lemma. mu_theta as a Gauss-sum combination of geometric measures

*Node* `ColemanIntegration:L3/mu-theta-as-sum-of-geometric-measures`.

Let theta = chi*eta be primitive of conductor N = D p^n with D > 1 and p not dividing D, L as in ColemanIntegration:L3/padic-value-as-negative-moment, eps_N in L a primitive N-th root of unity and G(theta^{-1}) = sum_{c in (Z/NZ)^x} theta^{-1}(c) eps_N^c. For every c in (Z/NZ)^x, |eps_N^c| = |eps_N^c - 1| = 1, and mu_theta = G(theta^{-1})^{-1} sum_c theta^{-1}(c) mu_{eps_N^c}; equivalently F_theta(T) = G(theta^{-1})^{-1} sum_c theta^{-1}(c) Li_0((1+T) eps_N^c).

*Hypotheses.* D > 1: every eps_N^c reduces to a nontrivial root of unity of order D, so it lies outside the residue disc of 1. The Gauss sum and F_theta are formed with the same root eps_N.

*Proof outline.*

1. Since gcd(c, N) = 1, eps_N^c has order N with prime-to-p part D > 1; its reduction has order D != 1 in the residue field, so |eps_N^c - 1| = 1.
2. Li_0(z) = z/(1-z) = -1 - 1/(z - 1), so -1/((1+T) eps^c - 1) = Li_0((1+T) eps^c) + 1.
3. RJW Lemma 5.12 (DirichletPadicLFunctions:L2): F_theta(T) = -G(theta^{-1})^{-1} sum_c theta^{-1}(c)/((1+T) eps_N^c - 1) = G(theta^{-1})^{-1} sum_c theta^{-1}(c)(Li_0((1+T) eps_N^c) + 1); the constants cancel because sum_c theta^{-1}(c) = 0 (mathlib:MulChar.sum_eq_zero_of_ne_one).
4. Compare Amice transforms with ColemanIntegration:L3/geometric-measure; the measures agree by mathlib:AbstractMeasure.injective_amiceTransform. G(theta^{-1}) != 0 by DirichletPadicLFunctions:L0.

*Acceptance.*

- theta = chi_{-3}, p != 3: mu_theta = (mu_eps - mu_{eps^2})/(eps - eps^2) with eps = eps_3.
- The cancellation of constants uses sum theta^{-1}(c) = 0: it fails for the trivial character.
- It fails for D = 1: the points eps_{p^n}^c lie in the residue disc of 1 (ColemanIntegration:L3/geometric-measure, non-example).

*Uses.* `DirichletPadicLFunctions:L0`, `DirichletPadicLFunctions:L2`, `ColemanIntegration:L3/geometric-measure`, `mathlib:MulChar.sum_eq_zero_of_ne_one`, `mathlib:AbstractMeasure.injective_amiceTransform`.

*Sources.*

- An introduction to p-adic L-functions, Lemma 5.12, p. 33 (arXiv v2); p. 145 of the version of record: “The Mahler transform of μ_θ is F_θ(T) := A_{μ_θ}(T) = (−1/G(θ^{−1})) Σ_{c∈(Z/Dp^nZ)^×} θ(c)^{−1}/((1+T)ε_{Dp^n}^c − 1).” The input formula for F_theta.
- An introduction to p-adic L-functions, proof of Lemma 6.5, p. 38 (arXiv v2): “∂ log((1+T)ε_D^c − 1) = (1+T)ε_D^c/((1+T)ε_D^c − 1) = 1 + 1/((1+T)ε_D^c − 1) and the fact that Σ_{c∈(Z/DZ)^×} θ^{−1}(c) = 0.” The same cancellation of constants, used by RJW at k = 1.

#### Lemma. The twisted smoothed measure as a combination of rotated smoothed measures

*Node* `ColemanIntegration:L3/smoothed-twist-as-sum-of-rotated-measures`.

Let chi be primitive of conductor p^n (n >= 1), eps = eps_{p^n} a primitive p^n-th root of unity in L, G(chi^{-1}) = sum_c chi^{-1}(c) eps^c, and b > 1 an integer prime to p. For c in (Z/p^nZ)^x the measure (eps^c)^x mu_b (multiplication by the continuous function x -> eps^{cx}, defined because |eps^c - 1| < 1) has Amice transform F_b((1+T) eps^c - 1), and mu_{chi,b} = (mu_b)_chi = G(chi^{-1})^{-1} sum_{c in (Z/p^nZ)^x} chi^{-1}(c) (eps^c)^x mu_b.

*Hypotheses.* n >= 1 and chi primitive of conductor p^n. b > 1 is an integer prime to p.

*Proof outline.*

1. RJW Lemma 5.4 applied to mu = mu_b (DirichletPadicLFunctions:L2): A_{mu_{chi,b}}(T) = G(chi^{-1})^{-1} sum_c chi^{-1}(c) F_b((1+T) eps^c - 1).
2. RJW §3.5.2: for |z - 1| < 1, A_{z^x mu}(T) = A_mu((1+T) z - 1) (PadicMeasuresIwasawaAlgebras:L2).
3. Compare Amice transforms (mathlib:AbstractMeasure.injective_amiceTransform).

*Acceptance.*

- In the variable z = 1 + T, F_b(z eps^c - 1) = -Li_0(eps^c z) + b Li_0(eps^{bc} z^b) + (b - 1); each Li_0 term has a pole at z = eps^{-c} inside D^-(1,1), and the poles cancel.
- For chi = omega (conductor p) the transform of mu_{chi,b} lies in O_L[[T]] (a twist of the bounded series F_b), whereas the rational function -G(chi^{-1})^{-1} sum_c chi^{-1}(c)/((1+T) eps^c - 1) of RJW Lemma 5.12 has poles at eps^{-c} - 1 in the open unit disc and is not an Amice transform.

*Uses.* `DirichletPadicLFunctions:L0`, `DirichletPadicLFunctions:L1`, `DirichletPadicLFunctions:L2`, `PadicMeasuresIwasawaAlgebras:L2`, `mathlib:AbstractMeasure.injective_amiceTransform`.

*Sources.*

- An introduction to p-adic L-functions, Lemma 5.4, p. 30 (arXiv v2): “The Mahler transform of μ_χ is A_{μ_χ}(T) = (1/G(χ^{−1})) Σ_{c∈(Z/p^nZ)^×} χ(c)^{−1} A_μ((1+T)ε_{p^n}^c − 1).” Applied to mu = mu_b.
- An introduction to p-adic L-functions, §3.5.2, p. 20 (arXiv v2): “Of particular interest is the measure z^xμ, for z ∈ O_L such that |z − 1| < 1. We claim the Mahler transform of z^xμ is A_{z^xμ}(T) = A_μ((1+T)z − 1).” The rotated measures (eps^c)^x mu_b.

#### Lemma. The distribution relation for the smoothed polylogarithm on the residue disc of 1

*Node* `ColemanIntegration:L3/smoothed-polylog-distribution-relation`.

For b > 1 prime to p and k >= 0: sum_{xi in mu_p} Phi^{(k)}_b(xi w) = p^{1-k} Phi^{(k)}_b(w^p) for every w in D^-(1,1), including w in mu_p.

*Hypotheses.* b > 1 an integer prime to p; k >= 0.

*Proof outline.*

1. For w with w^p != 1: apply ColemanIntegration:L2/distribution-relation (sum_{xi in mu_p} Li_k(xi z) = p^{1-k} Li_k(z^p) for z^p != 1) at z = w and at z = w^b (w^{bp} != 1 as p does not divide b), and use sum_{xi in mu_p} log(xi w)^k/k! = p log(w)^k/k! = p^{1-k} log(w^p)^k/k!, since log xi = 0.
2. Both sides are rigid analytic on D^-(1,1) (ColemanIntegration:L3/smoothed-polylog-combination; w -> w^p maps D^-(1,1) into itself) and agree off the finite set mu_p, so they agree everywhere by the identity theorem for power series on a disc.

*Acceptance.*

- w = 1, k = 1: sum_{xi in mu_p} Phi^{(1)}_b(xi) = Phi^{(1)}_b(1) = -log_p(b); dividing by p gives RJW's value (phi o psi)(Ftilde_a)(0) = -p^{-1} log_p(a) in the proof of Lemma 7.5.

*Uses.* `ColemanIntegration:L3/smoothed-polylog-combination`, `ColemanIntegration:L2/distribution-relation`, `ColemanIntegration:L0/iwasawa-logarithm`.

*Sources.*

- The syntomic regulator for K-theory of fields, §2, (2.4), p. 10 (arXiv v2): “If m and n are integers at least equal to 2, then on C_p Li_n(z^m) = m^{n−1} Σ_{ζ^m=1} Li_n(ζz). Clearly the same formula holds for n = 1 provided 1 − z^m ≠ 0.” The distribution relation for Coleman's polylogarithms (Coleman's Proposition 6.1 as corrected), used with m = p.
- An introduction to p-adic L-functions, proof of Lemma 7.5, p. 42 (arXiv v2): “Here we simplify both terms of the fraction using Π_{ξ∈μ_p}(Xξ − 1) = X^p − 1, in the denominator noting that as a is a topological generator of Z_p^×, we have {ξ^a : ξ ∈ μ_p} = μ_p.” The case k = 1, where the relation is the product formula for X^p - 1.

#### Lemma. Negative moments on Z_p^x through a locally analytic primitive

*Node* `ColemanIntegration:L3/unit-moment-via-distribution-primitive`.

Let K be a finite extension of Q_p, mu in Lambda(Z_p) (x) K a bounded measure, k >= 0, and Ftilde in R^+ subset K[[T]] with ((1+T) d/dT)^k Ftilde = A_mu. Let lambda in D^la(Z_p, K) be the distribution with A_lambda = Ftilde. Then x^k lambda = mu, and int_{Z_p^x} x^{-k} . mu = lambda(1_{Z_p^x}) = ((1 - phi o psi) Ftilde)(0) = Ftilde(0) - p^{-1} sum_{xi in mu_p} Ftilde(xi - 1), where Ftilde(xi - 1) is the value of the convergent series at the point xi - 1 of the open unit disc. The value does not depend on the choice of Ftilde.

*Hypotheses.* mu bounded; Ftilde in R^+ with the k-fold derivative condition.

*Proof outline.*

1. A_{x^k lambda} = ((1+T) d/dT)^k A_lambda = A_mu (RJW Lemma 3.29 and Remark 3.45, LocallyAnalyticDistributions:L1), so x^k lambda = mu by injectivity of the Amice transform on D^la (RJW Theorem 3.43), with mu viewed as a distribution (RJW Remark 3.44).
2. g(x) := 1_{Z_p^x}(x) x^{-k} is locally analytic on Z_p (analytic on each a + pZ_p with p not dividing a), so int g . mu = int g . (x^k lambda) = int x^k g . lambda = lambda(1_{Z_p^x}); no division by x on distributions is needed.
3. lambda(1_{Z_p^x}) = A_{Res_{Z_p^x} lambda}(0) = ((1 - phi o psi) A_lambda)(0) by RJW (3.8) and (3.9) for distributions (Remark 3.45), with (phi o psi Ftilde)(T) = p^{-1} sum_{xi in mu_p} Ftilde((1+T) xi - 1).
4. Independence: another primitive differs by sum_{j<k} c_j log(1+T)^j, and (1 - phi o psi)(log(1+T)^j)(0) = log(1)^j - p^{-1} sum_xi log(xi)^j = 0.

*Acceptance.*

- k = 0: int_{Z_p^x} mu = ((1 - phi o psi) A_mu)(0), RJW (3.8).
- k = 1 with mu = mu_theta and lambda = mutilde_theta is RJW (6.5) and Lemma 6.5.

*Uses.* `LocallyAnalyticDistributions:L1`, `PadicMeasuresIwasawaAlgebras:L2`.

*Sources.*

- An introduction to p-adic L-functions, Lemma 6.5, p. 38 (arXiv v2): “We have x μ̃_θ = μ_θ. In particular, Res_{Z_p^×}(μ̃_θ) = x^{−1}Res_{Z_p^×}(μ_θ).” The case k = 1, which RJW prove through division by x on Z_p^x; step 2 avoids that operation.
- An introduction to p-adic L-functions, (6.5), p. 38 (arXiv v2): “L_p(θ,1) = A_{x^{−1}Res_{Z_p^×}(μ_θ)}(0) = A_{Res_{Z_p^×}(μ̃_θ)}(0) = ((1 − φ∘ψ)F̃_θ)(0),” The chain of equalities generalised here to every k.
- An introduction to p-adic L-functions, (3.8) and (3.9), p. 21 (arXiv v2): “Res_{Z_p^×}(μ) = (1 − φ∘ψ)(μ). ... φ∘ψ(F)(T) = (1/p) Σ_{ξ∈μ_p} F((1+T)ξ − 1).” Restriction to units on Amice transforms.

#### Theorem. Negative moments of the geometric measure are modified polylogarithms

*Node* `ColemanIntegration:L3/negative-moments-of-geometric-measure`.

Let K be a finite extension of Q_p and w in K with |w| <= 1 and |w - 1| = 1. For every integer k >= 1, int_{Z_p^x} x^{-k} . mu_w = Li_k(w) - p^{-k} Li_k(w^p), where Li_k is Coleman's polylogarithm (for any branch; the right side is branch independent). For |w| < 1 both sides equal sum_{n>=1, p not | n} w^n n^{-k}.

*Hypotheses.* |w| <= 1, |w - 1| = 1, w in a finite extension of Q_p. k >= 1.

*Proof outline.*

1. ColemanIntegration:L3/polylog-primitive-on-residue-disc gives Ftilde^{(k)}_w in R^+ with ((1+T) d/dT)^k Ftilde^{(k)}_w = A_{mu_w} and Ftilde^{(k)}_w(t) = Li_k(w(1+t)) for |t| < 1.
2. ColemanIntegration:L3/unit-moment-via-distribution-primitive gives int_{Z_p^x} x^{-k} . mu_w = Ftilde^{(k)}_w(0) - p^{-1} sum_{xi in mu_p} Ftilde^{(k)}_w(xi - 1) = Li_k(w) - p^{-1} sum_{xi in mu_p} Li_k(xi w).
3. w^p != 1, because the reduction of w^p is the p-th power of a residue class different from 1 (or w^p = 0); ColemanIntegration:L2/distribution-relation at z = w gives p^{-1} sum_{xi in mu_p} Li_k(xi w) = p^{-k} Li_k(w^p).
4. Branch independence: Li_k depends on the branch only on the residue discs of 1 and infinity (Besser-de Jeu, proof of Proposition 2.6), which contain neither w nor w^p.

*Acceptance.*

- k = 1: int_{Z_p^x} x^{-1} . mu_w = -log(1 - w) + p^{-1} log(1 - w^p).
- Numerical check (PARI/GP 2.17.4): for p = 5 and w = eps_3, the Riemann sums of ColemanIntegration:L3/negative-moment-riemann-sums at r = 6 agree to O(5^6) with the value at w of the analytic continuation of sum_{p not | n} z^n/n^2 computed from its expansion in v = 1/(1 - z).
- The identity is Coleman's, stated in Besser (Finite and p-adic polylogarithms, proof of Proposition 2.1) and proved by BHYY (Theorem 5.5 with F = Q) for torsion points; this node proves it by the locally analytic distribution argument.

*Uses.* `ColemanIntegration:L3/polylog-primitive-on-residue-disc`, `ColemanIntegration:L3/unit-moment-via-distribution-primitive`, `ColemanIntegration:L3/geometric-measure`, `ColemanIntegration:L2/distribution-relation`, `ColemanIntegration:L2/p-adic-polylogarithm`.

*Planet:* Polylogarithms as negative moments.

*Sources.*

- Finite and p-adic polylogarithms, proof of Proposition 2.1, p. 2 (arXiv v1): “According to [Col82], the function Li_n^{(p)}(z) can be computed as Li_n^{(p)}(z) = ∫_{Z_p^×} x^{−n} dμ_z(x),” The statement, for z with |z| = |z - 1| = 1, attributed to Coleman.
- p-adic polylogarithms and p-adic Hecke L-functions for totally real fields, Theorem 5.5, p. 27 (arXiv v2): “Let ξ be a torsion point lying in Û^a_K for a ∈ I. Then we have Li_k^{(p)}(ξ) = ∫_{Δ̄∖(a⊗Z_p)^×} N̂_a(x)^{−k} dμ_{ξΔ}(x) for any integer k ∈ Z.” BHYY's version for torsion points, with their rigid Li_k^{(p)}; compared in ColemanIntegration:L3/comparison-with-bhyy-measure-argument.
- An introduction to p-adic L-functions, proof of Theorem 6.1(ii), case (2), pp. 38-39 (arXiv v2): “= (−1/G(θ^{−1}))·(1/p) Σ_{c∈(Z/NZ)^×} θ^{−1}(c) Σ_{ξ∈μ_p} log_p(ξε_N^c − 1) = (−1/G(θ^{−1}))·(1/p) Σ_c θ^{−1}(c) log_p(ε_N^{pc} − 1)” The k = 1 case of step 3 (the distribution relation for the logarithm).

#### Lemma. Negative moments of the rotated smoothed measure

*Node* `ColemanIntegration:L3/negative-moments-of-smoothed-measure`.

Let b > 1 be an integer prime to p, w in D^-(1,1) lying in a finite extension K of Q_p, and k >= 1. Then int_{Z_p^x} x^{-k} . (w^x mu_b) = Phi^{(k)}_b(w) - p^{-k} Phi^{(k)}_b(w^p). In particular, at w = 1, int_{Z_p^x} x^{-k} . mu_b = (1 - p^{-k}) Phi^{(k)}_b(1).

*Hypotheses.* b > 1 prime to p; w in the residue disc of 1; k >= 1.

*Proof outline.*

1. ColemanIntegration:L3/smoothed-polylog-combination (c): Ftilde := Phi^{(k)}_b(w(1+T)) lies in R^+ and its k-fold image under (1+T) d/dT is A_{w^x mu_b}.
2. ColemanIntegration:L3/unit-moment-via-distribution-primitive: int_{Z_p^x} x^{-k} . (w^x mu_b) = Phi^{(k)}_b(w) - p^{-1} sum_{xi in mu_p} Phi^{(k)}_b(xi w).
3. ColemanIntegration:L3/smoothed-polylog-distribution-relation: p^{-1} sum_xi Phi^{(k)}_b(xi w) = p^{-k} Phi^{(k)}_b(w^p).

*Acceptance.*

- k = 1, w = 1: int_{Z_p^x} x^{-1} . mu_b = -(1 - p^{-1}) log_p(b), which is RJW Lemma 7.5.

*Uses.* `ColemanIntegration:L3/smoothed-polylog-combination`, `ColemanIntegration:L3/unit-moment-via-distribution-primitive`, `ColemanIntegration:L3/smoothed-polylog-distribution-relation`, `DirichletPadicLFunctions:L1`.

*Source.* An introduction to p-adic L-functions, Lemma 7.5, p. 42 (arXiv v2): “We have ((1 − φ∘ψ)F̃_a)(0) = −(1 − p^{−1}) log_p(a).” The case k = 1, w = 1.

#### Lemma. Negative moments of the geometric measure as limits of finite sums

*Node* `ColemanIntegration:L3/negative-moment-riemann-sums`.

For w as in ColemanIntegration:L3/geometric-measure and every integer k: int_{Z_p^x} x^{-k} . mu_w = lim_{r -> infinity} (1 - w^{p^r})^{-1} sum_{0 < a < p^r, p not | a} a^{-k} w^a in K, and the r-th term differs from the limit by an element of absolute value at most p^{-r}. Consequently the negative moments of mu_w are the values at w of BHYY's rigid analytic function Li_k^{(p)} on {|t| <= 1, |1 - t| = 1} (BHYY Lemma 3.3 and Proposition 3.4 with F = Q).

*Hypotheses.* w as in ColemanIntegration:L3/geometric-measure; k any integer.

*Proof outline.*

1. On a + p^r Z_p with p not dividing a, (a + p^r y)^{-k} = a^{-k} (mod p^r); so 1_{Z_p^x}(x) x^{-k} is congruent modulo p^r to the locally constant function equal to a^{-k} on a + p^r Z_p (p not | a) and 0 on pZ_p.
2. mu_w takes C(Z_p, O_K) to O_K (ColemanIntegration:L3/geometric-measure), so the integral differs by at most p^{-r} from sum_{p not | a} a^{-k} mu_w(a + p^r Z_p), and mu_w(a + p^r Z_p) = w^a/(1 - w^{p^r}) (PadicMeasuresIwasawaAlgebras:L2 for integration of continuous functions against bounded measures).
3. BHYY Lemma 3.3 (g = 1): the same expressions f_r(t) = (1 - t^{p^r})^{-1} sum_{0<a<p^r, p not | a} a^{-k} t^a converge in the p-adic completion of O_K[t, (1 - t)^{-1}] to Li_k^{(p)}(t); evaluation at t = w is continuous.

*Acceptance.*

- p = 5, w = eps_3, k = 2: the r = 6 sum agrees with Li_2(w) - 5^{-2} Li_2(w^5) to O(5^6) (PARI/GP; ColemanIntegration:L3/negative-moments-of-geometric-measure).
- k = 0: the limit is sum_{0<a<p^r, p not | a} w^a/(1 - w^{p^r}) = w/(1-w) - w^p/(1-w^p) = Res_{Z_p^x} mu_w (Z_p^x).

*Uses.* `ColemanIntegration:L3/geometric-measure`, `PadicMeasuresIwasawaAlgebras:L2`.

*Sources.*

- Finite and p-adic polylogarithms, proof of Proposition 2.1, p. 2 (arXiv v1): “Reducing modulo p we may replace the function x ↦ x^{−k} by the function x ↦ a^{−k} if x ≡ a (mod p), which is congruent to it modulo p on Z_p^×.” The approximation argument at level r = 1.
- p-adic polylogarithms and p-adic Hecke L-functions for totally real fields, proof of Lemma 3.3, pp. 14-15 (arXiv v2): “f_m(t) := (1/Π_{i=1}^g(1 − t^{α_ip^m})) Σ_{α∈R_m, α∈(a⊗Z_p)^×} (uα)^{−k} t^α ... Thus the p-adic limit u^{−k}Li^{(p)}_{k,σ}(t) = lim_{m→∞} f_m(t) gives an element in B̂_α, as desired.” The same finite sums define BHYY's rigid Li_k^{(p)}.

#### Lemma. Sums of a primitive character along the fibres of reduction vanish

*Node* `ColemanIntegration:L3/primitive-character-fibre-sum-vanishes`.

Let theta be a primitive Dirichlet character modulo N with values in an integral domain, M a proper divisor of N, and f any function on (Z/MZ)^x. Then sum_{c in (Z/NZ)^x} theta(c) f(c mod M) = 0. In particular, if p | N and eps_N is a primitive N-th root of unity, then sum_{c in (Z/NZ)^x} theta^{-1}(c) g(eps_N^{pc}) = 0 for every function g on mu_{N/p}.

*Hypotheses.* theta primitive of conductor N; M | N, M != N.

*Proof outline.*

1. The reduction map (Z/NZ)^x -> (Z/MZ)^x is surjective (mathlib:ZMod.unitsMap_surjective); its fibres are the cosets u H of H = ker(mathlib:ZMod.unitsMap).
2. theta does not factor through M because its conductor is N > M (mathlib:DirichletCharacter.IsPrimitive), so by mathlib:DirichletCharacter.factorsThrough_iff_ker_unitsMap its restriction to H is a nontrivial homomorphism, and sum_{h in H} theta(u h) = theta(u) sum_{h in H} theta(h) = 0 (mathlib:sum_hom_units_eq_zero).
3. For the corollary, eps_N^{pc} depends only on c mod N/p, and theta^{-1} is primitive of conductor N.

*Acceptance.*

- N = 9, M = 3, theta of order 6 with theta(2) = zeta_6: sum_{c in (Z/9Z)^x} theta(c) f(c mod 3) = 0 for every f.
- Fails for an imprimitive character: the principal character mod 9 gives 3(f(1) + f(2)).

*Uses.* `mathlib:DirichletCharacter.IsPrimitive`, `mathlib:DirichletCharacter.factorsThrough_iff_ker_unitsMap`, `mathlib:ZMod.unitsMap`, `mathlib:ZMod.unitsMap_surjective`, `mathlib:sum_hom_units_eq_zero`.

*Sources.*

- An introduction to p-adic L-functions, proof of Theorem 6.1(ii), case (1), p. 38 (arXiv v2): “First assume that n > 1, so that χ ≠ 1; then, as χ|_{pZ_p} = 0, we see μ̃_θ = (μ̃_η)_χ is automatically supported on Z_p^× by (5.1).” RJW obtain the vanishing of the p-part by support on units; this lemma is the elementary form used in the polylogarithm computation.
- An introduction to p-adic L-functions, Remark 5.3(ii), p. 30 (arXiv v2): “(ii) G(χ) = χ(a) Σ_{c∈(Z/p^nZ)^×} χ(c)ε_{p^n}^{ac} for any a ∈ Z_p^×.” The Gauss-sum identity whose non-unit case (mathlib:gaussSum_mulShift_of_isPrimitive) is equivalent to this vanishing.

#### Lemma. The Euler factor from the p-th power map on roots of unity

*Node* `ColemanIntegration:L3/euler-factor-from-p-power-map`.

Let theta be a nontrivial primitive Dirichlet character of conductor N with values in a field of characteristic 0, eps_N a primitive N-th root of unity, k an integer and f a function on the roots of unity. Then sum_{c in (Z/NZ)^x} theta^{-1}(c) f(eps_N^{pc}) = theta(p) sum_{c} theta^{-1}(c) f(eps_N^c), with theta(p) = 0 when p | N; hence sum_c theta^{-1}(c) (f(eps_N^c) - p^{-k} f(eps_N^{pc})) = (1 - theta(p) p^{-k}) sum_c theta^{-1}(c) f(eps_N^c).

*Hypotheses.* theta primitive of conductor N; f arbitrary (in the application f = Li_k, and eps_N^{pc} != 1 whenever the tame part D > 1).

*Proof outline.*

1. If p does not divide N, c -> pc is a bijection of (Z/NZ)^x and theta^{-1}(p^{-1} c') = theta(p) theta^{-1}(c').
2. If p | N, the left side vanishes by ColemanIntegration:L3/primitive-character-fibre-sum-vanishes and theta(p) = 0.

*Acceptance.*

- p = 5, theta = chi_{-3}: theta(5) = -1 and the Euler factor is 1 + 5^{-k}.
- p = 3, theta = chi_{12}: theta(3) = 0 and the second sum vanishes.

*Uses.* `ColemanIntegration:L3/primitive-character-fibre-sum-vanishes`, `mathlib:DirichletCharacter.IsPrimitive`.

*Source.* An introduction to p-adic L-functions, proof of Theorem 6.1(ii), case (2), p. 39 (arXiv v2); p. 153 of the version of record: “Here, we used that, since p ∤ N, the assignment c ↦ c' = pc defines an automorphism of (Z/NZ)^×.” The tame case of the reindexing.

#### Lemma. Independence of the choice of primitive root of unity

*Node* `ColemanIntegration:L3/gauss-sum-root-of-unity-independence`.

Let theta be a nontrivial primitive character of conductor N with values in a field F of characteristic 0 containing mu_N, f any function from mu_N to F, eps a primitive N-th root of unity and eps' = eps^a with a in (Z/NZ)^x. Write G_eps(theta^{-1}) = sum_c theta^{-1}(c) eps^c. Then G_eps(theta^{-1}) != 0 and G_{eps'}(theta^{-1})^{-1} sum_c theta^{-1}(c) f(eps'^c) = G_eps(theta^{-1})^{-1} sum_c theta^{-1}(c) f(eps^c).

*Hypotheses.* theta primitive of conductor N, nontrivial.

*Proof outline.*

1. Substituting c -> a^{-1} c multiplies both the numerator and the Gauss sum by theta(a) (mathlib:gaussSum_mulShift_eq).
2. G_eps(theta^{-1}) != 0 because G(theta) G(theta^{-1}) = theta(-1) N (DirichletPadicLFunctions:L0).

*Acceptance.*

- N = 3: G_{eps}(chi_{-3}) = eps - eps^2 and G_{eps^2}(chi_{-3}) = -(eps - eps^2); the numerators change sign as well.

*Uses.* `DirichletPadicLFunctions:L0`, `mathlib:gaussSum`, `mathlib:gaussSum_mulShift_eq`, `mathlib:AddChar.zmodChar`.

*Source.* An introduction to p-adic L-functions, Remark 5.3, p. 30 (arXiv v2): “(i) G(χ)G(χ^{−1}) = χ(−1)p^n. (ii) G(χ) = χ(a) Σ_{c∈(Z/p^nZ)^×} χ(c)ε_{p^n}^{ac} for any a ∈ Z_p^×.” The two Gauss-sum identities, stated for p-power conductor; DirichletPadicLFunctions:L0 supplies them for every conductor.

#### Theorem. Coleman's formula for the p-adic L-values L_p(theta omega^{1-k}, k)

*Node* `ColemanIntegration:L3/coleman-formula`.

Let p be an odd prime, theta a nontrivial primitive Dirichlet character of conductor N >= 2 with values in a finite extension L of Q_p inside C_p containing mu_N, eps_N in L a primitive N-th root of unity, G(theta^{-1}) = sum_{c in (Z/NZ)^x} theta^{-1}(c) eps_N^c, and Li_k Coleman's p-adic polylogarithm for the Iwasawa branch log_p (ColemanIntegration:L2/p-adic-polylogarithm). For every integer k >= 1: L_p(theta omega^{1-k}, k) = (1 - theta(p) p^{-k}) G(theta^{-1})^{-1} sum_{c in (Z/NZ)^x} theta^{-1}(c) Li_k(eps_N^c), where omega is the Teichmueller character, L_p is RJW Definition 5.18 and theta(p) = 0 when p | N. When N is not a power of p this equals G(theta^{-1})^{-1} sum_c theta^{-1}(c) (Li_k(eps_N^c) - p^{-k} Li_k(eps_N^{pc})) = G(theta^{-1})^{-1} sum_c theta^{-1}(c) int_{Z_p^x} x^{-k} . mu_{eps_N^c}. This is RJW Theorem 6.7(ii) with the Teichmueller twist omega^{1-k} that the printed statement omits (ColemanIntegration/E15), and BHYY Theorem 1.1 for F = Q extended to conductors that are powers of p.

*Hypotheses.* p odd (RJW's L_p is defined for odd p). theta nontrivial primitive of conductor N = D p^n, any D >= 1 prime to p and n >= 0. k >= 1 an integer. Li_k for the Iwasawa branch; the right side is the same for every branch (ColemanIntegration:L3/independence-of-branch-and-frobenius-lift).

*Proof outline.*

1. Case D > 1. ColemanIntegration:L3/padic-value-as-negative-moment gives L_p(theta omega^{1-k}, k) = int_{Z_p^x} x^{-k} . mu_theta, and ColemanIntegration:L3/mu-theta-as-sum-of-geometric-measures rewrites it as G(theta^{-1})^{-1} sum_c theta^{-1}(c) int_{Z_p^x} x^{-k} . mu_{eps_N^c}.
2. ColemanIntegration:L3/negative-moments-of-geometric-measure (|eps_N^c| = |eps_N^c - 1| = 1) gives int_{Z_p^x} x^{-k} . mu_{eps^c} = Li_k(eps^c) - p^{-k} Li_k(eps^{pc}); ColemanIntegration:L3/euler-factor-from-p-power-map turns the sum into (1 - theta(p) p^{-k}) sum_c theta^{-1}(c) Li_k(eps^c).
3. Case D = 1, N = p^n, theta = chi. Choose b > 1 prime to p with chi(b) b^{1-k} != 1. ColemanIntegration:L3/padic-value-as-smoothed-negative-moment and ColemanIntegration:L3/smoothed-twist-as-sum-of-rotated-measures give L_p(chi omega^{1-k}, k) = (chi(b) b^{1-k} - 1)^{-1} G(chi^{-1})^{-1} sum_c chi^{-1}(c) int_{Z_p^x} x^{-k} . ((eps^c)^x mu_b).
4. ColemanIntegration:L3/negative-moments-of-smoothed-measure: the inner integral is Phi^{(k)}_b(eps^c) - p^{-k} Phi^{(k)}_b(eps^{pc}). The second terms sum to 0 against chi^{-1} (ColemanIntegration:L3/primitive-character-fibre-sum-vanishes: eps^{pc} depends only on c mod p^{n-1}, and equals 1 when n = 1).
5. eps^c != 1, eps^{bc} != 1 and log eps^c = 0, so Phi^{(k)}_b(eps^c) = -Li_k(eps^c) + b^{1-k} Li_k(eps^{bc}) (ColemanIntegration:L3/smoothed-polylog-combination); reindexing c -> b^{-1} c gives sum_c chi^{-1}(c) Li_k(eps^{bc}) = chi(b) sum_c chi^{-1}(c) Li_k(eps^c). The total is -(1 - chi(b) b^{1-k}) sum_c chi^{-1}(c) Li_k(eps^c); dividing by chi(b) b^{1-k} - 1 gives G(chi^{-1})^{-1} sum_c chi^{-1}(c) Li_k(eps^c), the claim since chi(p) = 0.
6. The right side does not depend on eps_N (ColemanIntegration:L3/gauss-sum-root-of-unity-independence).

*Acceptance.*

- Tame conductor, p = 5, theta = chi_{-3} (theta(5) = -1), k = 2 and k = 4: both sides agree to O(5^39) (PARI/GP 2.17.4, left side from Washington's series for L_p(s, psi) at s = k (validated against L_p(1-n, psi) = -(1 - psi omega^{-n}(p) p^{n-1}) B_{n, psi omega^{-n}}/n), right side from the expansion of the analytic continuation of sum_{p not | n} z^n/n^k in v = 1/(1 - z), with exact arithmetic in Q(mu_N)).
- Tame conductor, p = 11, theta = chi_5 (even), k = 1 and k = 3: agreement to O(11^20) and O(11^19).
- Mixed conductor, p = 3: theta = chi_{12} with k = 1 and 3, and theta = chi_{-15} with k = 2: agreement to O(3^39).
- Pure p-power conductor, p = 3, N = 9: theta of order 6 (theta(2) = zeta_6) with k = 2 and 4, theta^2 with k = 1 and 3: agreement to O(3^37).
- Conductor exactly p, p = 5, theta = omega and omega^3, k = 2: agreement to O(5^37), with Li_2(zeta_5^c) evaluated as -Li_2(1 - zeta_5^c) by the reflection formula of ColemanIntegration:L2/dilogarithm-identities (a) with log zeta = 0; for theta = omega the left side is L_5(1, 2) = 4*5^{-1} + 4*5 + 3*5^2 + ...
- Parity: Li_k(zeta^{-1}) = (-1)^{k+1} Li_k(zeta) at roots of unity (inversion formula with log zeta = 0), so the right side vanishes when theta(-1) = (-1)^k, as L_p of the odd character theta omega^{1-k} does.
- Non-example (RJW Theorem 6.7(ii) as printed): p = 5, theta = chi_{-3}, k = 2: L_5(theta, 2) = 0 because theta is odd, while the right side is the 5-adic unit 2 + 5 + 2*5^2 + ...; p = 11, theta = chi_5, k = 3: L_11(theta, 3) = 5 + 11 + ..., the right side 7 + 4*11 + ....
- k = 1 is RJW Theorem 6.1(ii) (ColemanIntegration:L3/recovers-leopoldt-formula).

*Uses.* `ColemanIntegration:L3/padic-value-as-negative-moment`, `ColemanIntegration:L3/padic-value-as-smoothed-negative-moment`, `ColemanIntegration:L3/mu-theta-as-sum-of-geometric-measures`, `ColemanIntegration:L3/smoothed-twist-as-sum-of-rotated-measures`, `ColemanIntegration:L3/negative-moments-of-geometric-measure`, `ColemanIntegration:L3/negative-moments-of-smoothed-measure`, `ColemanIntegration:L3/euler-factor-from-p-power-map`, `ColemanIntegration:L3/primitive-character-fibre-sum-vanishes`, `ColemanIntegration:L3/gauss-sum-root-of-unity-independence`, `ColemanIntegration:L3/smoothed-polylog-combination`, `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L0/iwasawa-logarithm`, `mathlib:PadicComplex`, `ColemanIntegration:L2/values-at-tame-roots-of-unity`, `ColemanIntegration:L2/values-at-roots-of-unity-of-p-power-order`, `ColemanIntegration:L2/values-in-finite-extensions`, `ColemanIntegration:L2/dilogarithm-identities`.

*Planet:* Coleman's formula for p-adic L-values.

*Sources.*

- An introduction to p-adic L-functions, Theorem 6.7(ii), p. 39 (arXiv v2); p. 154 of the version of record: “Let θ be a non-trivial Dirichlet character of conductor N, let k ≥ 1 be an integer, and let ε_N denote a primitive Nth root of unity. Then: ... (ii) (p-adic value at s=k). We have L_p(θ,k) = (1 − θ(p)p^{−k}) (1/G(θ^{−1})) Σ_{c∈(Z/NZ)^×} θ^{−1}(c) Li_{k,p}(ε_N^c).” The target statement; its left side must be read as L_p(theta omega^{1-k}, k) (ColemanIntegration/E15).
- p-adic polylogarithms and p-adic Hecke L-functions for totally real fields, Theorem 1.1, p. 2 (arXiv v2): “Suppose N is not a power of p, and let ξ be a primitive N-th root of unity. Then for any integer k ∈ Z, we have L_p(χω_p^{1−k},k) = (g(χ,ξ)/N) Σ_{β∈(Z/NZ)^×} χ(β)^{−1} Li_k^{(p)}(ξ^β),” Coleman's theorem as quoted and reproved by BHYY, with g(chi, xi)/N = 1/G(chi^{-1}) and Li_k^{(p)}(z) = Li_k(z) - p^{-k} Li_k(z^p).
- On the p-adic Beilinson conjecture for number fields, proof of Proposition 4.17, p. 22 (arXiv v2): “By (3) on page 172 of [Col82] we have L_p(n, χ_τω_p^{1−n}, Q) = (n−1)!^{−1} Eul_p(k,χ_τ,Q) R_{n,p}(M_π^E)_τ / D(M_π^E)_τ^{1/2,p}.” The same twist omega_p^{1-n} in the regulator form of Coleman's formula.

#### Theorem. Coleman's formula for L_p(theta, k) itself, in the normalisation of RJW

*Node* `ColemanIntegration:L3/coleman-formula-rjw-normalisation`.

Let p be odd, theta = chi*eta a Dirichlet character as in RJW Definition 5.18, k >= 1, and psi the primitive character attached to theta omega^{k-1}, of conductor N_psi. If psi is nontrivial, L_p(theta, k) = (1 - psi(p) p^{-k}) G(psi^{-1})^{-1} sum_{c in (Z/N_psi Z)^x} psi^{-1}(c) Li_k(eps_{N_psi}^c). If psi is trivial (theta = omega^{1-k}) and k >= 2, L_p(theta, k) = (1 - p^{-k}) Li_k(1). In particular RJW Theorem 6.7(ii) holds as printed exactly when psi = theta, that is when (p - 1) | (k - 1).

*Hypotheses.* p odd; k >= 1; for trivial psi, k >= 2 (at k = 1 the trivial component has the pole of RJW Theorem 7.1).

*Proof outline.*

1. L_p(theta, s) depends only on the restriction of theta to Z_p^x x (Z/DZ)^x, so L_p(theta, k) = L_p(psi omega^{1-k}, k) (DirichletPadicLFunctions:L3).
2. For nontrivial psi apply ColemanIntegration:L3/coleman-formula to psi; for trivial psi apply ColemanIntegration:L3/coleman-formula-trivial-character.
3. omega^{k-1} = 1 if and only if (p - 1) | (k - 1), since omega has order p - 1.

*Acceptance.*

- k = 1: psi = theta and the statement is RJW Theorem 6.1(ii).
- p = 3 and k odd: omega^{k-1} = 1 and RJW's printed formula holds.
- p = 5, theta = chi_{-3}, k = 2: psi = chi_{-3} omega (conductor 15, even), and L_5(chi_{-3}, 2) = 0 agrees with the vanishing of the right side for even psi and even k.

*Uses.* `ColemanIntegration:L3/coleman-formula`, `ColemanIntegration:L3/coleman-formula-trivial-character`, `DirichletPadicLFunctions:L3`.

*Sources.*

- An introduction to p-adic L-functions, Remark 5.19 and Theorem 5.20, p. 35 (arXiv v2): “For all k ≥ 1, we have L_p(θ,1−k) = (1 − θω^{−k}(p)p^{k−1}) L(θω^{−k},1−k).” The interpolation property fixes RJW's normalisation: the value at s = k involves theta omega^{k-1}.
- On the p-adic Beilinson conjecture for number fields, §1, p. 3 (arXiv v2): “For the p-adic L-functions one has to consider χ ⊗ ω_p^{1−n} with ω_p the Teichmüller character for the prime number p.” The twist needed at s = n.

#### Theorem. Coleman's formula for the trivial character

*Node* `ColemanIntegration:L3/coleman-formula-trivial-character`.

For p odd and every integer k >= 2: L_p(omega^{1-k}, k) = int_{Z_p^x} x^{1-k} . zeta_p = (1 - p^{-k}) Li_k(1), where Li_k(1) is the limit of Coleman's Li_k(z) as z -> 1 inside any finitely ramified extension of Q_p (ColemanIntegration:L2/value-at-one).

*Hypotheses.* p odd, k >= 2.

*Proof outline.*

1. RJW Definition 5.18 and omega(x) <x> = x: L_p(omega^{1-k}, k) = int_{Z_p^x} x^{1-k} . zeta_p = (b^{1-k} - 1)^{-1} int_{Z_p^x} x^{-k} . mu_b for any integer b > 1 prime to p, since b^{1-k} != 1 (DirichletPadicLFunctions:L1, RJW (3.11) via PadicMeasuresIwasawaAlgebras:L3).
2. ColemanIntegration:L3/negative-moments-of-smoothed-measure at w = 1: int_{Z_p^x} x^{-k} . mu_b = (1 - p^{-k}) Phi^{(k)}_b(1).
3. ColemanIntegration:L3/smoothed-polylog-combination (d): Phi^{(k)}_b(1) = -(1 - b^{1-k}) Li_k(1); combine.

*Acceptance.*

- For even k, omega^{1-k} is odd, so L_p(omega^{1-k}, k) = 0 and hence Li_k(1) = 0 (the p-adic zeta(2m) vanishes).
- k = 1 is excluded: zeta_p has a pole at s = 1 on this component (RJW Theorem 7.1).

*Uses.* `ColemanIntegration:L3/negative-moments-of-smoothed-measure`, `ColemanIntegration:L3/smoothed-polylog-combination`, `DirichletPadicLFunctions:L1`, `DirichletPadicLFunctions:L3`, `PadicMeasuresIwasawaAlgebras:L3`, `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L2/value-at-one`.

*Sources.*

- On the p-adic Beilinson conjecture for number fields, proof of Proposition 4.17, p. 23 (arXiv v2): “Coleman proves that L_p(n, ω_p^{1−n}, Q) = (1 − p^{−n}) lim'_{x→1} Li_{n,p}(x) where the limit is taken in any subfield of C_p that is of finite ramification degree over Q_p.” The statement, quoted from Coleman; this node proves it from the smoothed measure.
- The syntomic regulator for K-theory of fields, §2, p. 10 (arXiv v2): “If L is a finitely ramified extension of Q_p then the limit lim_{z→1, z∈L} Li_n(z) exists for n ≥ 2, and is independent of L.” Definition of Li_k(1).

#### Lemma. The complex polylogarithm on the unit circle and the exponential zeta function

*Node* `ColemanIntegration:L3/complex-polylog-at-roots-of-unity`.

For every integer k >= 2 and every real a: Li_k(e^{2 pi i a}) = sum_{n>=1} e^{2 pi i a n} n^{-k} = expZeta(a, k), where Li_k is the principal-branch complex polylogarithm of Polylogarithms:P.1/classical-polylogarithm and expZeta is mathlib:HurwitzZeta.expZeta.

*Hypotheses.* k >= 2 (for k = 1 the series converges only conditionally; that case is RJW Theorem 6.1(i), supplied by DirichletPadicLFunctions:L3).

*Proof outline.*

1. For k >= 2 the series sum z^n/n^k converges uniformly on the closed unit disc (comparison with sum n^{-k}); Li_k is continuous on the closed disc and equals the series on the open disc (Polylogarithms:P.1/classical-polylogarithm, API polylog_continuousOn_closedBall and polylog_hasSum), so the radial limit gives the first equality.
2. The series at z = e^{2 pi i a} is the Dirichlet series of expZeta(a, s) at s = k with Re s > 1 (mathlib:HurwitzZeta.hasSum_expZeta_of_one_lt_re).

*Acceptance.*

- a = 0: Li_k(1) = zeta(k) = expZeta(0, k).
- a = 1/4, k = 2: Im Li_2(i) is Catalan's constant.

*Uses.* `Polylogarithms:P.1/classical-polylogarithm`, `mathlib:HurwitzZeta.expZeta`, `mathlib:HurwitzZeta.hasSum_expZeta_of_one_lt_re`.

*Sources.*

- An introduction to p-adic L-functions, Remark 6.6, p. 39 (arXiv v2): “let Li_s(z) := Σ_{n≥1} z^n/n^s be the polylogarithm function; recall that it admits a unique analytic continuation to C∖{z ∈ R : z ≥ 1}. In particular, one sees that Li_s(1) = ζ(s), and Li_1(z) = −log(1−z).” The complex polylogarithm of Theorem 6.7(i) and its value at 1.
- On the p-adic Beilinson conjecture for number fields, §4, (4.1), p. 17 (arXiv v2): “Li_n(z) = Σ_{k≥1} z^k/k^n (n ≥ 0) for z in C with |z| < 1 if n = 0 or 1, and |z| ≤ 1 if n ≥ 2.” Convergence on the closed disc for n >= 2.

#### Theorem. The complex formula L(theta, k) through polylogarithms at roots of unity

*Node* `ColemanIntegration:L3/complex-coleman-formula`.

Let theta be a nontrivial primitive complex Dirichlet character of conductor N >= 2 and G(theta^{-1}) = sum_{c in (Z/NZ)^x} theta^{-1}(c) e^{2 pi i c/N} (mathlib:gaussSum with mathlib:ZMod.stdAddChar). For every s in C, L(theta, s) = G(theta^{-1})^{-1} sum_{c in (Z/NZ)^x} theta^{-1}(c) expZeta(c/N, s), with L(theta, s) = mathlib:DirichletCharacter.LFunction. Hence for every integer k >= 1, L(theta, k) = G(theta^{-1})^{-1} sum_c theta^{-1}(c) Li_k(e^{2 pi i c/N}) with the principal-branch complex polylogarithm (RJW Theorem 6.7(i)).

*Hypotheses.* theta primitive of conductor N >= 2 (so theta(0) = 0 and theta^{-1} vanishes on non-units).

*Proof outline.*

1. Put Phi := N^{-1} G(theta) theta^{-1}. By mathlib:DirichletCharacter.IsPrimitive.fourierTransform_eq_inv_mul_gaussSum applied to theta^{-1}, F(theta^{-1})(j) = theta(-j) G(theta^{-1}); with mathlib:ZMod.dft_dft and mathlib:ZMod.dft_comp_neg this gives F Phi = theta, using G(theta) G(theta^{-1}) = theta(-1) N (DirichletPadicLFunctions:L0; it also follows from mathlib:ZMod.dft_dft).
2. mathlib:ZMod.LFunction_dft (Phi(0) = 0): L(theta, s) = N^{-1} G(theta) sum_j theta^{-1}(j) expZeta(-j/N, s) for all s; substituting j -> -j and theta^{-1}(-1) = theta(-1) gives theta(-1) G(theta) N^{-1} = G(theta^{-1})^{-1} times sum_c theta^{-1}(c) expZeta(c/N, s).
3. For k >= 2 apply ColemanIntegration:L3/complex-polylog-at-roots-of-unity. For k = 1 the value is RJW Theorem 6.1(i), L(theta, 1) = -G(theta^{-1})^{-1} sum_c theta^{-1}(c) log(1 - e^{2 pi i c/N}) (DirichletPadicLFunctions:L3), and Li_1(z) = -log(1 - z) (Polylogarithms:P.1/classical-polylogarithm).

*Acceptance.*

- Numerically (PARI/GP, 75 digits) for theta = chi_{-3}, chi_{-4}, chi_5, chi_8, chi_{12}, a character of order 6 modulo 7 and one modulo 9, and k = 1, 2, 3, 4, both sides agree to 10^{-75}.
- theta = chi_{-4}, k = 1: G(chi_{-4}) = 2i and (2i)^{-1}(Li_1(i) - Li_1(-i)) = (2i)^{-1} log i = pi/4 = L(chi_{-4}, 1).
- theta = chi_{-4}, k = 2: L(chi_{-4}, 2) = (2i)^{-1}(Li_2(i) - Li_2(-i)) = Im Li_2(i), Catalan's constant.
- The identity L(theta, s) = G(theta^{-1})^{-1} sum_c theta^{-1}(c) expZeta(c/N, s) holds for every s, including s <= 0.

*Uses.* `mathlib:DirichletCharacter.LFunction`, `mathlib:DirichletCharacter.LFunction_eq_LSeries`, `mathlib:ZMod.LFunction_dft`, `mathlib:DirichletCharacter.IsPrimitive.fourierTransform_eq_inv_mul_gaussSum`, `mathlib:ZMod.dft_dft`, `mathlib:ZMod.dft_comp_neg`, `mathlib:gaussSum`, `mathlib:ZMod.stdAddChar`, `mathlib:ZMod.toAddCircle`, `mathlib:HurwitzZeta.expZeta`, `ColemanIntegration:L3/complex-polylog-at-roots-of-unity`, `DirichletPadicLFunctions:L0`, `DirichletPadicLFunctions:L3`, `Polylogarithms:P.1/classical-polylogarithm`.

*Planet:* Complex polylogarithm formula for L(theta, k).

*Sources.*

- An introduction to p-adic L-functions, Theorem 6.7(i), p. 39 (arXiv v2): “(i) (Classical value at s=k). We have L(θ,k) = (1/G(θ^{−1})) Σ_{c∈(Z/NZ)^×} θ^{−1}(c) Li_k(ε_N^c).” The target statement.
- An introduction to p-adic L-functions, proof of Theorem 6.1(i), p. 36 (arXiv v2): “Here the penultimate equality uses the standard identity G(θ)G(θ^{−1}) = θ(−1)cond(θ) of Gauss sums (cf. Remark 5.3(i)) and that θ^{−1}(c) = 0 if (c, N) ≠ 1, and the last equality follows from the change of variables c ↦ −c.” The Gauss-sum steps of step 2, for Re s > 1.
- On the p-adic Beilinson conjecture for number fields, proof of Proposition 4.17, p. 22 (arXiv v2): “according to (2) on page 172 of [Col82] with the correct sign in the exponent of the Gauss sum as used here (cf. [Zag91, p. 421]).” The complex formula in Coleman's paper, with a sign correction recorded by BBdJR.

#### Comparison. k = 1 recovers Leopoldt's formula and the complex value at s = 1

*Node* `ColemanIntegration:L3/recovers-leopoldt-formula`.

At k = 1, ColemanIntegration:L3/coleman-formula is RJW Theorem 6.1(ii): L_p(theta, 1) = -(1 - theta(p) p^{-1}) G(theta^{-1})^{-1} sum_c theta^{-1}(c) log_p(1 - eps_N^c), because omega^0 = 1 and Li_1(z) = -log_p(1 - z) for the Iwasawa branch; and at k = 1 ColemanIntegration:L3/complex-coleman-formula is RJW Theorem 6.1(i). The proof of ColemanIntegration:L3/coleman-formula covers both conductor cases of RJW §6.2: tame part D > 1 (including n = 0) through the geometric measures and the distribution relation, and pure p-power conductor D = 1 through the smoothed measure.

*Hypotheses.* theta nontrivial primitive of conductor N; p odd.

*Proof outline.*

1. Specialise ColemanIntegration:L3/coleman-formula to k = 1 and use Li_1(z) = -log_p(1 - z) (ColemanIntegration:L2/p-adic-polylogarithm, ColemanIntegration:L0/iwasawa-logarithm).
2. Compare with the statement of RJW Theorem 6.1, whose owner is DirichletPadicLFunctions:L3.

*Acceptance.*

- Tame test: p = 11, theta = chi_5 (N = 5 prime to p): the two sides agree to O(11^20) (PARI/GP 2.17.4, left side from Washington's series for L_p(s, psi) at s = k (validated against L_p(1-n, psi) = -(1 - psi omega^{-n}(p) p^{n-1}) B_{n, psi omega^{-n}}/n), right side from the expansion of the analytic continuation of sum_{p not | n} z^n/n^k in v = 1/(1 - z), with exact arithmetic in Q(mu_N)).
- Pure p-power conductor tests: p = 5, theta = omega^2 (N = 5), with log_p(1 - zeta_5^c) = (1/4) log_p((1 - zeta_5^c)^4/5) since log_p(5) = 0: agreement to O(5^34); p = 3, N = 9, theta of order 3: O(3^38).
- Mixed conductor: p = 3, theta = chi_{12}: O(3^39).
- Branch: replacing log_p by log_lambda changes log(1 - eps^c) for eps of p-power order n >= 1 by lambda/phi(p^n), a constant cancelled by sum_c theta^{-1}(c) = 0.

*Uses.* `ColemanIntegration:L3/coleman-formula`, `ColemanIntegration:L3/complex-coleman-formula`, `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L0/iwasawa-logarithm`, `DirichletPadicLFunctions:L3`.

*Sources.*

- An introduction to p-adic L-functions, Theorem 6.1, p. 36 (arXiv v2): “(i) ... L(θ,1) = −(1/G(θ^{−1})) Σ_{c∈(Z/NZ)^×} θ^{−1}(c) log(1 − ε_N^c). (ii) ... L_p(θ,1) = −(1 − θ(p)p^{−1}) (1/G(θ^{−1})) Σ_{c∈(Z/NZ)^×} θ^{−1}(c) log_p(1 − ε_N^c).” The statement recovered at k = 1.
- An introduction to p-adic L-functions, Remark 6.6, p. 39 (arXiv v2): “Theorem 6.1 has been generalised by Coleman in [Col82] for every positive integer value s = k ≥ 1.” The relation between the two theorems.

#### Comparison. Comparison with the locally analytic distribution argument of RJW §6.2

*Node* `ColemanIntegration:L3/comparison-with-rjw-distribution-argument`.

Where both apply (k = 1) the proof of ColemanIntegration:L3/coleman-formula is RJW's argument: (i) for tame part D > 1, RJW's Ftilde_theta(T) = -G(theta^{-1})^{-1} sum_c theta^{-1}(c) log((1+T) eps_N^c - 1) equals G(theta^{-1})^{-1} sum_c theta^{-1}(c) Ftilde^{(1)}_{eps^c}(T) (the constant log_p(-1) = 0), so RJW Lemma 6.4 is ColemanIntegration:L3/polylog-primitive-on-residue-disc at k = 1, Lemma 6.5 is x . mutilde^{(1)} = mu, (6.5) is ColemanIntegration:L3/unit-moment-via-distribution-primitive, and RJW's evaluation sum_{xi in mu_p} log_p(xi eps^c - 1) = log_p(eps^{pc} - 1) is the distribution relation for Li_1; (ii) for D = 1 the rational function F_theta of RJW Lemma 5.12 is not an Amice transform and the argument runs through the twist of mu_a and RJW's Ftilde_a of §7, which is Phi^{(1)}_a(1+T). For every k >= 1 the same argument works with Li_1 replaced by Li_k: in the variable z = (1+T) eps, (1+T) d/dT = z d/dz, Li_0(z) = z/(1-z) and z d/dz Li_k = Li_{k-1}, so ((1+T) d/dT)^{-k} F_theta is represented by G(theta^{-1})^{-1} sum_c theta^{-1}(c) Li_k((1+T) eps_N^c) (using sum_c theta^{-1}(c) = 0), and the Euler factor comes from sum_{xi in mu_p} Li_k(xi z) = p^{1-k} Li_k(z^p).

*Hypotheses.* k >= 1; theta nontrivial primitive.

*Proof outline.*

1. Expand log((1+T) eps - 1) = log_p(eps - 1) + log(1 + eps T/(eps - 1)) (RJW proof of Lemma 6.4) and compare with Ftilde^{(1)}_{eps}(T) = -log(1 - eps) - log(1 - eps T/(1 - eps)); log_p(-1) = 0.
2. Signs: F_theta = -G^{-1} sum theta^{-1}(c)/((1+T) eps^c - 1) = G^{-1} sum theta^{-1}(c) Li_0((1+T) eps^c) (ColemanIntegration:L3/mu-theta-as-sum-of-geometric-measures) and Ftilde_theta = G^{-1} sum theta^{-1}(c) Li_1((1+T) eps^c), consistent with -log(z - 1) = Li_1(z) + log_p(-1).
3. For D = 1 the rational function F_theta has simple poles at T = eps^{-c} - 1, of absolute value |eps - 1| < 1, with nonzero residues, so its expansion at 0 has radius |eps - 1| and it is not in R^+ (RJW Theorem 3.43); RJW's step Ftilde_theta = (Ftilde_eta)_chi needs Ftilde_eta in R^+, which fails for eta = 1 (Ftilde_1 = -log T).
4. RJW §7 (7.5): Ftilde_a(T) = log(T (1+T)^{a-1}/((1+T)^a - 1)) = Phi^{(1)}_a(1+T) (ColemanIntegration:L3/smoothed-polylog-combination).

*Acceptance.*

- RJW's Ftilde_theta(0) = -G^{-1} sum_c theta^{-1}(c) log_p(eps^c - 1) = G^{-1} sum_c theta^{-1}(c) Li_1(eps^c).
- For D = 1, n = 1 the locally analytic function T -> -G^{-1} sum theta^{-1}(c) log_p((1+T) eps^c - 1) agrees with RJW's power series Ftilde_theta near 0 but has logarithmic singularities at the points eps^{-c} - 1 of absolute value p^{-1/(p-1)}, where phi o psi evaluates: the two cannot be identified there (ColemanIntegration/E17).

*Uses.* `ColemanIntegration:L3/polylog-primitive-on-residue-disc`, `ColemanIntegration:L3/unit-moment-via-distribution-primitive`, `ColemanIntegration:L3/negative-moments-of-geometric-measure`, `ColemanIntegration:L3/negative-moments-of-smoothed-measure`, `ColemanIntegration:L3/smoothed-polylog-combination`, `ColemanIntegration:L3/mu-theta-as-sum-of-geometric-measures`, `ColemanIntegration:L3/coleman-formula`, `DirichletPadicLFunctions:L3`, `LocallyAnalyticDistributions:L1`.

*Sources.*

- An introduction to p-adic L-functions, proof of Lemma 6.4, p. 37 (arXiv v2): “log((1 + T)ε_N^c − 1) = log_p(ε_N^c − 1) + log(1 + ε_N^cT/(ε_N^c − 1)) = log_p(ε_N^c − 1) + Σ_{n=1}^∞ ((−1)^{n−1}/n)·(ε_N^{cn}/(ε_N^c − 1)^n) T^n.” The expansion compared in step 1.
- An introduction to p-adic L-functions, proof of Lemma 6.4, p. 38 (arXiv v2); p. 152 of the version of record: “Then, as in Lemma 5.4 or Lemma 5.12, we have F̃_θ(T) = (F̃_η)_χ(T) = −(1/G(χ^{−1})) Σ_{c∈(Z/p^nZ)^×} χ^{−1}(c) F̃_η((1+T)ε_{p^n}^c − 1). As F̃_η(T) ∈ R^+, the same holds for F̃_θ(T).” The step that needs Ftilde_eta in R^+, unavailable for eta = 1.
- An introduction to p-adic L-functions, §7, (7.5), p. 42 (arXiv v2): “F̃_a(T) = log( T/((1+T)^a − 1) · (1+T)^{a−1} ).” RJW's smoothed primitive, used in §7 and here for pure p-power conductor.

#### Comparison. Comparison with the bounded-measure argument of Bannai-Hagihara-Yamada-Yamamoto

*Node* `ColemanIntegration:L3/comparison-with-bhyy-measure-argument`.

For N not a power of p, BHYY (Theorem 5.5, Proposition 5.6 and Theorem 5.8 with F = Q) compute the same quantities int_{Z_p^x} x^{-k} . mu_{eps^c} as ColemanIntegration:L3/negative-moments-of-geometric-measure, by another route: they prove int_{Z_p^x} x^{-k} . mu_w = Li_k^{(p)}(w), the value of their rigid function on {|t| <= 1, |1 - t| = 1} defined by the limits of ColemanIntegration:L3/negative-moment-riemann-sums, first for k <= 0 (moments of a bounded measure, obtained by applying t d/dt to t/(1-t) - t^p/(1-t^p)) and then for k > 0 by continuity in the exponent (x^{-k} = lim_r x^{-k+(p-1)p^r} uniformly on Z_p^x). The distribution argument proves int_{Z_p^x} x^{-k} . mu_w = Li_k(w) - p^{-k} Li_k(w^p) using only the analyticity of Coleman's Li_k on residue discs and the distribution relation. Together they give the Frobenius relation Li_k^{(p)}(w) = Li_k(w) - p^{-k} Li_k(w^p) for |w| <= 1, |w - 1| = 1, in finite extensions of Q_p.

*Hypotheses.* w in a finite extension of Q_p, |w| <= 1, |w - 1| = 1; k any integer for BHYY's side, k >= 1 for the distribution side.

*Proof outline.*

1. Both sides equal int_{Z_p^x} x^{-k} . mu_w: ColemanIntegration:L3/negative-moment-riemann-sums (BHYY's limit) and ColemanIntegration:L3/negative-moments-of-geometric-measure.
2. BHYY's route needs neither Coleman integration nor locally analytic distributions, but reaches Coleman's Li_k only through the Frobenius relation (ColemanIntegration:L2/frobenius-relation); the distribution route needs the distribution relation (ColemanIntegration:L2/distribution-relation). Each gives a public proof of ColemanIntegration:L3/coleman-formula for N not a power of p.

*Acceptance.*

- BHYY exclude N a power of p (Theorem 1.1: Suppose N is not a power of p); the smoothed measure of ColemanIntegration:L3/negative-moments-of-smoothed-measure covers that case.
- Numerics: the Riemann sums and the expansion of sum_{p not | n} z^n/n^k in v = 1/(1-z) agree (p = 5, w = eps_3, k = 2, to O(5^6)).

*Uses.* `ColemanIntegration:L3/negative-moments-of-geometric-measure`, `ColemanIntegration:L3/negative-moment-riemann-sums`, `ColemanIntegration:L3/coleman-formula`, `ColemanIntegration:L2/p-adic-polylogarithm`, `ColemanIntegration:L2/distribution-relation`, `ColemanIntegration:L2/frobenius-relation`.

*Sources.*

- p-adic polylogarithms and p-adic Hecke L-functions for totally real fields, proof of Proposition 5.6, p. 28 (arXiv v2): “Hence we have N̂_a(x)^{−k} = lim_{r→∞} N̂_a(x)^{−k+(p−1)p^r} uniformly as functions on (a⊗Z_p)^×. ... Hence our assertion for the case of k > 0 follows from the result for k ≤ 0.” BHYY's passage from k <= 0 to k > 0.
- p-adic polylogarithms and p-adic Hecke L-functions for totally real fields, §1, p. 2 (arXiv v2): “The functions Li_k^{(p)}(t) extend to rigid analytic functions on the rigid analytic space Û_{Q_p} associated to the p-adic completion Û_{Z_p} of the scheme U := P^1∖{0,1,∞} = G_m∖{1}” BHYY's rigid function, independent of Coleman integration.

#### Comparison. Coleman's polylogarithms versus arbitrary locally analytic solutions

*Node* `ColemanIntegration:L3/coleman-functions-versus-locally-analytic`.

The formula distinguishes Coleman's polylogarithms from arbitrary locally analytic solutions of the same differential equations. (a) For k >= 1, a family (Lambda_j)_{j <= k} of locally analytic functions on C_p minus {1} with Lambda_j = Li_j for j < k and z d/dz Lambda_k = Li_{k-1} differs from Li_k by a locally constant function; taking Lambda_k = Li_k + delta 1_U with delta != 0 and U a disc around eps_N^{c_0} containing no other root of unity of order dividing N, the right side of ColemanIntegration:L3/coleman-formula changes by (1 - theta(p) p^{-k}) delta theta^{-1}(c_0) G(theta^{-1})^{-1} != 0 while the left side does not. (b) The ambiguity is removed by the distribution relation (Besser, remark after Proposition 2.3) and, within Coleman's theory, by the uniqueness principle (ColemanIntegration:L1/coleman-uniqueness-principle). (c) The distribution argument uses that Li_k is one power series on each whole residue disc (ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs); for Lambda_k as in (a), T -> Lambda_k(eps^{c_0}(1+T)) is not given by one power series on |T| < 1, and no distribution with that Amice transform exists.

*Hypotheses.* p odd, theta nontrivial primitive, k >= 1.

*Proof outline.*

1. A locally analytic function with zero derivative is locally constant; conversely Li_k + delta 1_U is locally analytic with the same derivative.
2. The sum sum_c theta^{-1}(c) Lambda_k(eps^c) changes by delta theta^{-1}(c_0), and the Euler factor 1 - theta(p) p^{-k} is unchanged.
3. Uniqueness within the Coleman category: ColemanIntegration:L1/coleman-uniqueness-principle.

*Acceptance.*

- p = 5, theta = chi_{-3}, k = 2: changing Li_2 by delta on D(eps_3, 5^{-1}) changes the right side by (1 + 5^{-2}) delta/(eps - eps^2).
- Arbitrary locally analytic primitives are allowed by RJW's description of Li_{k,p} ('locally analytic functions on C_p minus {1}'), which is why that description does not determine the right side (ColemanIntegration/E16).

*Uses.* `ColemanIntegration:L3/coleman-formula`, `ColemanIntegration:L3/polylog-primitive-on-residue-disc`, `ColemanIntegration:L1/coleman-uniqueness-principle`, `ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs`, `ColemanIntegration:L2/distribution-relation`.

*Sources.*

- Finite and p-adic polylogarithms, §2, remark after Proposition 2.3, p. 6 (arXiv v1): “This determines Li_n up to a locally constant function and a Frobenius condition replaces this by a globally constant function ambiguity. As remarked by Kontsevich the distribution relation removes the ambiguity completely.” Parts (a) and (b).
- The syntomic regulator for K-theory of fields, §2, p. 9 (arXiv v2): “Each ω ∈ Ω^1_loc(U) can be integrated in A_loc(U) in many ways, because we can choose a different constant of integration for each U_y.” The ambiguity of local integration that Coleman's theory removes.

#### Comparison. Independence of the root of unity, the branch and the Frobenius lift

*Node* `ColemanIntegration:L3/independence-of-branch-and-frobenius-lift`.

The right side of ColemanIntegration:L3/coleman-formula does not depend on (a) the primitive root eps_N, (b) the branch log_lambda of the logarithm used to define Li_k, (c) the Frobenius lift used in Coleman's construction of Li_k. (a) is ColemanIntegration:L3/gauss-sum-root-of-unity-independence. (b): for k >= 2, Li_{k,lambda}(zeta) is independent of lambda at every root of unity zeta != 1 (Besser-de Jeu Proposition 2.6 with log zeta = 0); for k = 1, Li_{1,lambda}(zeta) - Li_{1,lambda'}(zeta) = -v(1 - zeta)(lambda - lambda') is constant on the primitive N-th roots of unity and is cancelled by sum_c theta^{-1}(c) = 0. (c): Coleman integrals, hence Li_k, do not depend on the Frobenius lift (ColemanIntegration:L1/coleman-uniqueness-principle). Independently of (b) and (c), the proof of ColemanIntegration:L3/coleman-formula applies to Li_k built with any branch and any lift, and the left side involves neither.

*Hypotheses.* theta nontrivial primitive, k >= 1.

*Proof outline.*

1. (a) by the cited lemma; (b) by Besser-de Jeu Proposition 2.6 (supplied through ColemanIntegration:L0/log-branch-change and ColemanIntegration:L2/branch-dependence); (c) by the uniqueness principle.
2. The proof steps of ColemanIntegration:L3/coleman-formula use only the differential equations, the analyticity on residue discs and the distribution relation, which hold for every branch and every admissible lift.

*Acceptance.*

- N = p^n, k = 1: Li_1(eps^c) = -log_lambda(1 - eps^c) depends on lambda, the character sum does not.
- Frobenius lifts: the values Li_k(zeta) computed from the lift z -> z^p and from any other lift of Frobenius preserving the residue discs of 0, 1, infinity coincide.

*Uses.* `ColemanIntegration:L3/coleman-formula`, `ColemanIntegration:L3/gauss-sum-root-of-unity-independence`, `ColemanIntegration:L1/coleman-uniqueness-principle`, `ColemanIntegration:L0/iwasawa-logarithm`, `ColemanIntegration:L2/branch-dependence`, `ColemanIntegration:L2/galois-equivariance`, `ColemanIntegration:L0/log-branch-change`.

*Sources.*

- The syntomic regulator for K-theory of fields, Proposition 2.6, p. 10 (arXiv v2): “Li_{n,a}(z) − Li_{n,b}(z) = −(1/n!) v(1−z) β (log_a^{n−1}z + log_a^{n−2}z log_b z + ⋯ + log_b^{n−1}z).” Branch dependence of Li_n, which vanishes at roots of unity for n >= 2.
- The syntomic regulator for K-theory of fields, §2, p. 9 (arXiv v2): “The fact that these rules suffice to carry out the integration process uniquely and that it is independent of the choice of φ is the main result of Coleman (see [Col82] and [Col-de88]).” Independence of the Frobenius lift.

#### Theorem. The syntomic regulator of cyclotomic elements

*Node* `ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements`.

Let F be a number field, O the localisation of O_F at a prime above p, K a complete discretely valued subfield of C_p with ring of integers R and residue field algebraic over F_p, sigma : F -> K an embedding with sigma(O) in R, and n >= 2. Let reg_sigma be the composite H^1(Mtilde_n(F)) -> K_{2n-1}^{(n)}(F) = K_{2n-1}^{(n)}(O) -> K_{2n-1}^{(n)}(R) -> H^1_syn(Spec R, n) = K of de Jeu's map (BBdJR Theorem 4.7), sigma_* and Besser's syntomic regulator (BBdJR Lemma 2.15). For every root of unity zeta != 1 in F: reg_sigma([zeta]_n) = ±(n-1)! L^mod_n(sigma(zeta)) = ±(n-1)! Li_n(sigma(zeta)), the sign depending only on the normalisation of the relativity isomorphisms (BBdJR Remark 4.16). For F unramified at p, Gros's regulator reg^Gros = (1 - Frob/p^n) reg sends [zeta]_n (zeta of order prime to p) to ±(n-1)! (Li_n(zeta) - p^{-n} Li_n(zeta^p)).

*Hypotheses.* n >= 2; zeta a root of unity different from 1. The target H^1_syn(Spec R, n) is identified with K by the normalisation of Besser-de Jeu (Definition 4.6 and the following discussion).

*Proof outline.*

1. For zeta of order prime to p, zeta and 1 - zeta are special units and [zeta]_n comes from H^1(Mtilde_n(O)); Besser-de Jeu Theorem 1.10(2) gives reg_sigma([x]_n) = ±(n-1)! L^mod_n(sigma x) for x in O^flat.
2. For general zeta, the distribution relation [x^m]_n = m^{n-1} sum_{alpha^m = 1} [alpha x]_n in Mtilde_n (Besser-de Jeu Proposition 2.10) over a larger field expresses a multiple of [zeta]_n through symbols of special units, and ColemanIntegration:L3/padic-regulator-polylogarithm satisfies the same relation.
3. At roots of unity L^mod_n = Li_n (ColemanIntegration:L3/padic-regulator-polylogarithm).
4. Gros's normalisation: Frob(Li_n(zeta)) = Li_n(zeta^p) by Galois equivariance (ColemanIntegration:L2/galois-equivariance).
5. Besser-de Jeu Theorem 1.10(2) is proved in their §§3-7 (multi-relative K-theory and localisation, the syntomic regulator through rigid syntomic cohomology, the integration-down process by Coleman integration, regulators of special elements); this packet does not decompose that proof (gap), and imports the syntomic regulator (PadicHodgeRegulators:D.2) and de Jeu's map (Polylogarithms:P.4).

*Acceptance.*

- For F = Q(mu_N) the elements [zeta]_n, zeta primitive, generate K_{2n-1}(F)_Q (BBdJR Example 4.10), so the theorem describes reg_sigma completely on cyclotomic fields.
- n = 2: reg_sigma([zeta]_2) = ±Li_2(sigma zeta), Coleman's dilogarithm at a root of unity.

*Uses.* `ColemanIntegration:L3/padic-regulator-polylogarithm`, `PadicHodgeRegulators:D.2`, `Polylogarithms:P.4`, `ColemanIntegration:L2/distribution-relation`, `ColemanIntegration:L2/galois-equivariance`, `ColemanIntegration:L2/values-at-tame-roots-of-unity`.

*Planet:* Syntomic regulator of cyclotomic elements.

*Sources.*

- The syntomic regulator for K-theory of fields, Theorem 1.12, p. 6 (arXiv v2): “Under the assumptions of Theorem 1.10, the regulator map reg_σ : H^1(M̃_n(F)) → K_{2n−1}^{(n)}(F) ≅ K_{2n−1}^{(n)}(O) → K_{2n−1}^{(n)}(R) → K maps [ζ]_n to ±(n−1)! L_mod,n(σ(ζ)) if ζ is any root of unity in F^*.” The statement.
- The syntomic regulator for K-theory of fields, Remark 1.13, p. 6 (arXiv v2): “The result of Gros is that the element [ζ]_n is mapped under the syntomic regulator to Li_n^{(p)}(ζ), where Li_n^{(p)}(z) = Li_n(z) − (1/p^n) Li_n(z^p).” Gros's normalisation.
- On the p-adic Beilinson conjecture for number fields, Remark 4.15, p. 21 (arXiv v2): “This is known to hold for N[ζ]_n if ζ is any N-th root of unity other than 1 (see Theorem 1.12 of loc. cit.).” BBdJR's use of the theorem.

#### Theorem. Parts (1)-(3) of the p-adic Beilinson conjecture for Dirichlet motives

*Node* `ColemanIntegration:L3/padic-beilinson-for-dirichlet-motives`.

(BBdJR Proposition 4.17.) Let N >= 2, k = Q(mu_N), G = (Z/NZ)^x, E a number field containing a root of unity of order the exponent of G, chi an irreducible character of G with idempotent pi, and n >= 2 with chi(-1) = (-1)^{n-1}. Then dim_E E[G]pi = dim_E pi K_{2n-1}(k)_E = 1, and parts (1), (2) and (3) of PBC(k, E, pi, n, p) hold for every prime p, with e(n, M^E_pi) = e_p(n, M^E_pi) in Q^x.

*Hypotheses.* N >= 2; chi(-1) = (-1)^{n-1}; E contains the values of chi.

*Proof outline.*

1. Reduce to chi primitive and N > 2 (BBdJR Remark 3.23(1)); treat N = 2 through zeta(n), [-1]_n and ColemanIntegration:L3/coleman-formula-trivial-character.
2. Bases pi, pi(1 (x) zeta) and pi(1 (x) [zeta]_n), the last a basis because the [zeta^j]_n generate K_{2n-1}(Q(mu_N))_Q (BBdJR Theorem 4.7 and Example 4.10, Polylogarithms:P.4); D(M^E_pi)^{1/2,*} = N |G|^{-1} (sum_a chi(a) eta^{-a})^{-1}, a Gauss-sum computation (DirichletPadicLFunctions:L0).
3. Complex side: R_{n,infinity,sigma} = (n-1)! |G|^{-1} sum_a chi_sigma^{-1}(a) Li_n(eta^a) (de Jeu's regulator formula for [x]_n, BBdJR Theorem 4.7 with BorelRegulators:R.7, and the parity condition), and ColemanIntegration:L3/complex-coleman-formula gives (1).
4. p-adic side: R_{n,p,tau} = (n-1)! |G|^{-1} sum_a chi_tau^{-1}(a) Li_n(eta_p^a) (ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements), and ColemanIntegration:L3/coleman-formula gives (2) with Eul_p(n, chi, Q) = 1 - chi(p) p^{-n} and e_p = e, i.e. (3).

*Acceptance.*

- Part (4) (L_p(n, chi omega^{1-n}) != 0) is not claimed; BBdJR check it numerically for the 470 primitive characters with 2 <= N <= 50, p <= 19 and 2 <= n <= 20 (Remark 4.19).

*Uses.* `ColemanIntegration:L3/coleman-formula`, `ColemanIntegration:L3/complex-coleman-formula`, `ColemanIntegration:L3/coleman-formula-trivial-character`, `ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements`, `ColemanIntegration:L3/padic-beilinson-conjecture`, `Polylogarithms:P.4`, `BorelRegulators:R.7`, `DirichletPadicLFunctions:L0`.

*Sources.*

- On the p-adic Beilinson conjecture for number fields, Proposition 4.17, p. 22 (arXiv v2): “Let N ≥ 2, k = Q(μ_N), G = Gal(k/Q) = (Z/NZ)^* ... Then parts (1), (2) and (3) of Conjecture 3.18 hold for π and n ≥ 2 if χ(−1) = (−1)^{n−1}.” The statement.
- On the p-adic Beilinson conjecture for number fields, Remark 4.19, p. 23 (arXiv v2): “for the 470 primitive characters χ of Gal(Q(μ_N)/Q) = (Z/NZ)^* with 2 ≤ N ≤ 50, L_p(n, χ ⊗ ω_p^{1−n}, Q) lies in (E ⊗ Q_p)^* for those values of p and n = 2,…,20 whenever χ(−1) = (−1)^{n−1}.” Numerical evidence for part (4).

#### Comparison. Coleman's formula as a formula for syntomic regulators

*Node* `ColemanIntegration:L3/coleman-formula-as-syntomic-regulator-formula`.

Let theta be a nontrivial primitive Dirichlet character of conductor N >= 2, n >= 2, F = Q(mu_N) and sigma : F -> C_p with sigma(zeta_N) = eps_N. Then L_p(theta omega^{1-n}, n) = ±((n-1)!)^{-1} (1 - theta(p) p^{-n}) G(theta^{-1})^{-1} sum_{c in (Z/NZ)^x} theta^{-1}(c) reg_sigma([zeta_N^c]_n), and, when p does not divide N, L_p(theta omega^{1-n}, n) = ±((n-1)!)^{-1} G(theta^{-1})^{-1} sum_c theta^{-1}(c) reg^Gros_sigma([zeta_N^c]_n). This is the regulator interpretation that compares the Dirichlet example with PadicHodgeRegulators (R09: the syntomic regulator of D.2) and with KatoEulerSystems (R12: explicit reciprocity, where L-values are expressed through regulators of Euler-system elements); the p-adic L-value is defined by DirichletPadicLFunctions and is not defined through this formula.

*Hypotheses.* p odd; n >= 2; the sign is the one of ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements.

*Proof outline.*

1. Substitute reg_sigma([zeta_N^c]_n) = ±(n-1)! Li_n(eps_N^c) (ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements) into ColemanIntegration:L3/coleman-formula.
2. For p not dividing N, reg^Gros_sigma([zeta^c]_n) = ±(n-1)! (Li_n(eps^c) - p^{-n} Li_n(eps^{pc})), and ColemanIntegration:L3/euler-factor-from-p-power-map removes the Euler factor.

*Acceptance.*

- When theta(-1) = (-1)^n both sides vanish.
- The complex analogue L(theta, n) = ±((n-1)!)^{-1} G(theta^{-1})^{-1} sum theta^{-1}(c) (Beilinson regulator of [zeta^c]_n, up to the parity projection) is part (1) of ColemanIntegration:L3/padic-beilinson-for-dirichlet-motives.

*Uses.* `ColemanIntegration:L3/coleman-formula`, `ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements`, `ColemanIntegration:L3/euler-factor-from-p-power-map`, `PadicHodgeRegulators:D.2`.

*Sources.*

- An introduction to p-adic L-functions, Remark 6.8, p. 39 (arXiv v2): “this gives formulas for the values of L_p(θ, k) in terms of p-adic regulators of the cyclotomic units, special elements that we will see later; the right-hand sides of Theorems 6.1(ii) and 6.7(ii) can be reinterpreted in such terms” RJW's statement that the right side is a regulator.
- The syntomic regulator for K-theory of fields, Remark 1.13, p. 6 (arXiv v2): “The result of Gros is that the element [ζ]_n is mapped under the syntomic regulator to Li_n^{(p)}(ζ), where Li_n^{(p)}(z) = Li_n(z) − (1/p^n) Li_n(z^p).” Gros's normalisation, matching BHYY's form of the formula.

### What is missing

- Coverage status: `partial`. Theorem 6.7 of RJW in corrected form (L_p(theta omega^{1-k}, k)) for every k >= 1 and every nontrivial primitive theta, with a complete public proof from the L2 inputs by the locally analytic distribution argument (geometric measures for tame part D > 1, smoothed measures for pure p-power conductor), the RJW-normalisation corollary and the trivial-character case; the complex formula from Mathlib's Fourier analysis on ZMod N; k = 1 recovers Theorem 6.1 with tame, mixed and p-power-conductor tests; comparisons with RJW §6.2, with BHYY's bounded-measure proof, with arbitrary locally analytic primitives and for independence of branch, root of unity and Frobenius lift; numerical checks of every case; the modified polylogarithm, the syntomic regulator of cyclotomic elements, the p-adic Beilinson conjecture as a proposition, and its proof for Dirichlet motives.
- Decompose the proof of Besser-de Jeu Theorem 1.10(2) (gap) or import it from PadicHodgeRegulators:D.2.
- Complex Artin L-functions with coefficients for the non-abelian statement of the p-adic Beilinson proposition (gap: no owner).
- **Gap: The proof of Besser-de Jeu Theorem 1.10(2) is not decomposed.** The regulator formula reg_sigma([x]_n) = ±(n-1)! L^mod_n(sigma x) for special units occupies Besser-de Jeu §§3-7 (multi-relative K-theory and localisation, rigid syntomic regulators, the integration-down process by Coleman integration, regulators of special elements, and the appendix on Chern classes in relative cohomology). Read for structure only. NEXT ACTION: decompose Besser-de Jeu §§3-7 into nodes, in PadicHodgeRegulators:D.2 if that stage takes the regulator of symbols in all weights, otherwise in this layer. Needed by `ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements`, `ColemanIntegration:L3/padic-beilinson-for-dirichlet-motives`, `ColemanIntegration:L3/coleman-formula-as-syntomic-regulator-formula`.
- **Gap: Complex Artin L-functions with coefficients have no owner.** Part (1) of the p-adic Beilinson proposition uses L(s, chi_pi (x) id, Q) with values in E (x) C for Artin characters of Gal(Qbar/Q) (Euler product for Re s > 1 with inertia invariants at ramified primes). No stage of the atlas plans general Artin L-functions; Mathlib has Dirichlet L-functions only, which suffice for the abelian case used by ColemanIntegration:L3/padic-beilinson-for-dirichlet-motives. NEXT ACTION: ask the maintainer to assign Artin L-functions of Artin motives over Q (a candidate is AutomorphicLFunctionsAndLocalFactors). Needed by `ColemanIntegration:L3/padic-beilinson-conjecture`.
- **Request to `DirichletPadicLFunctions:L0`.** Gauss sums of primitive Dirichlet characters of every conductor N with values in a field of characteristic 0 containing mu_N (C and C_p): G(theta) = sum_{c in (Z/NZ)^x} theta(c) eps^c for a primitive N-th root of unity eps (Mathlib gaussSum with AddChar.zmodChar or ZMod.stdAddChar), the product formula G(theta) G(theta^{-1}) = theta(-1) N and G(theta) != 0 (Mathlib proves the product formula only for prime modulus; for complex values it follows from ZMod.dft_dft and IsPrimitive.fourierTransform_eq_inv_mul_gaussSum), together with the dictionary between complex and p-adic character values through fixed embeddings of Qbar. Needed by `ColemanIntegration:L3/mu-theta-as-sum-of-geometric-measures`, `ColemanIntegration:L3/smoothed-twist-as-sum-of-rotated-measures`, `ColemanIntegration:L3/gauss-sum-root-of-unity-independence`, `ColemanIntegration:L3/complex-coleman-formula`, `ColemanIntegration:L3/padic-beilinson-for-dirichlet-motives`.
- **Request to `DirichletPadicLFunctions:L1`.** For every integer b > 1 prime to p: F_b(T) = 1/T - b/((1+T)^b - 1) in Z_p[[T]], the measure mu_b with Amice transform F_b (RJW Definition 4.5), and the pseudo-measure zeta_p with ([b] - [1]) zeta_p = x^{-1} Res_{Z_p^x}(mu_b) for every such b (independence of the smoothing parameter), for odd p. Needed by `ColemanIntegration:L3/padic-value-as-smoothed-negative-moment`, `ColemanIntegration:L3/smoothed-twist-as-sum-of-rotated-measures`, `ColemanIntegration:L3/smoothed-polylog-combination`, `ColemanIntegration:L3/negative-moments-of-smoothed-measure`, `ColemanIntegration:L3/coleman-formula-trivial-character`.
- **Request to `DirichletPadicLFunctions:L2`.** For primitive theta = chi eta with tame conductor D > 1: the bounded measure mu_theta = (mu_eta)_chi (RJW (5.5)) with Amice transform F_theta(T) = -G(theta^{-1})^{-1} sum_{c in (Z/NZ)^x} theta^{-1}(c)/((1+T) eps_N^c - 1) (RJW Lemma 5.12), valid for every primitive N-th root of unity eps_N with the Gauss sum formed with the same root; and for chi of conductor p^n the twist mu_{chi,b} = (mu_b)_chi with Amice transform G(chi^{-1})^{-1} sum_c chi^{-1}(c) F_b((1+T) eps^c - 1) (RJW Lemma 5.4). The formula of Lemma 5.12 must not be used for D = 1, where it is not an Amice transform (ColemanIntegration/E17). Needed by `ColemanIntegration:L3/padic-value-as-negative-moment`, `ColemanIntegration:L3/padic-value-as-smoothed-negative-moment`, `ColemanIntegration:L3/mu-theta-as-sum-of-geometric-measures`, `ColemanIntegration:L3/smoothed-twist-as-sum-of-rotated-measures`.
- **Request to `DirichletPadicLFunctions:L3`.** The definition of L_p(psi, s) (RJW Definition 5.18, odd p) for every Dirichlet character psi = chi' eta, with chi' any finite-order character of Z_p^x (the p-part of a primitive character, possibly trivial) and eta of conductor D prime to p, including D = 1 through zeta_p; the Teichmueller character omega and <x> (Definition 5.15); the identity (5.7) L_p(chi' eta, s) = int_{Z_p^x} chi' omega^{s-1}(x) x^{-s} . mu_eta for D > 1 and integers s; the fact that L_p(theta, s) depends only on theta restricted to Z_p^x x (Z/DZ)^x; RJW Theorem 6.1 (i) and (ii) (Leopoldt), whose pure p-power conductor case must be proved with the smoothed measure (ColemanIntegration/E17); and the Iwasawa logarithm on all algebraic extensions (shared with ColemanIntegration:L0). Needed by `ColemanIntegration:L3/padic-value-as-negative-moment`, `ColemanIntegration:L3/padic-value-as-smoothed-negative-moment`, `ColemanIntegration:L3/coleman-formula-rjw-normalisation`, `ColemanIntegration:L3/coleman-formula-trivial-character`, `ColemanIntegration:L3/complex-coleman-formula`, `ColemanIntegration:L3/recovers-leopoldt-formula`, `ColemanIntegration:L3/comparison-with-rjw-distribution-argument`, `ColemanIntegration:L3/padic-beilinson-conjecture`.
- **Request to `LocallyAnalyticDistributions:L1`.** The Amice transform D^la(Z_p, K) -> R^+ as a bijection for finite K/Q_p (RJW Theorem 3.43), compatible with bounded measures (Remark 3.44); on D^la: A_{x lambda} = (1+T) d/dT A_lambda and int g . (x lambda) = int x g . lambda for locally analytic g; restriction to compact opens with A_{Res_{Z_p^x} lambda} = (1 - phi o psi) A_lambda and (phi o psi F)(T) = p^{-1} sum_{xi in mu_p} F((1+T) xi - 1) for F in R^+; lambda(1) = A_lambda(0). Division by x on distributions supported on units is not needed by this packet. Needed by `ColemanIntegration:L3/polylog-primitive-on-residue-disc`, `ColemanIntegration:L3/smoothed-polylog-combination`, `ColemanIntegration:L3/unit-moment-via-distribution-primitive`, `ColemanIntegration:L3/comparison-with-rjw-distribution-argument`.
- **Request to `PadicMeasuresIwasawaAlgebras:L2`.** Bounded Mahler-Amice theory over O_K for finite K/Q_p: every F in O_K[[T]] is the Amice transform of a unique measure (RJW Theorem 3.25; Mathlib has the bijection only for Z_p coefficients); multiplication by z^x for |z - 1| < 1 with A_{z^x mu}(T) = A_mu((1+T) z - 1) (RJW §3.5.2); values on residue classes mu(a + p^m Z_p) = p^{-m} sum_{xi in mu_{p^m}} xi^{-a} A_mu(xi - 1) (RJW (3.6)); approximation of integrals of continuous functions by Riemann sums with the sup-norm bound. Needed by `ColemanIntegration:L3/geometric-measure`, `ColemanIntegration:L3/smoothed-twist-as-sum-of-rotated-measures`, `ColemanIntegration:L3/smoothed-polylog-combination`, `ColemanIntegration:L3/unit-moment-via-distribution-primitive`, `ColemanIntegration:L3/negative-moment-riemann-sums`.
- **Request to `PadicMeasuresIwasawaAlgebras:L3`.** Evaluation of a pseudo-measure lambda on Z_p^x at a nontrivial continuous character psi: int psi . lambda = (psi(g) - 1)^{-1} int psi . ([g] - [1]) lambda for any g in Z_p^x with psi(g) != 1, independent of g (RJW (3.11)); used with g an integer b > 1 prime to p. Needed by `ColemanIntegration:L3/padic-value-as-smoothed-negative-moment`, `ColemanIntegration:L3/coleman-formula-trivial-character`.
- **Request to `PadicHodgeRegulators:D.2`.** Besser's syntomic regulator reg_p : K^{(n)}_{2n-1}(R) -> H^1_syn(Spec R, n) = K for a complete discretely valued K subset C_p with ring of integers R and residue field algebraic over F_p, n >= 2 (BBdJR Lemma 2.15, Besser-de Jeu Definition 4.6 normalisation), its compatibility with finite extensions and automorphisms, and Gros's normalisation reg^Gros = (1 - Frob/p^n) reg for unramified K; the proof of Besser-de Jeu Theorem 1.10(2) (the regulator of [x]_n for special units) if D.2 takes it (otherwise it stays the gap of this packet). Needed by `ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements`, `ColemanIntegration:L3/padic-beilinson-conjecture`, `ColemanIntegration:L3/coleman-formula-as-syntomic-regulator-formula`.
- **Request to `Polylogarithms:P.4`.** de Jeu's complexes Mtilde_n(F) of a number field, the cyclotomic symbols [zeta]_n in H^1(Mtilde_n(F)) with the distribution relation [x^m]_n = m^{n-1} sum_{alpha^m = 1} [alpha x]_n (Besser-de Jeu Proposition 2.10), and de Jeu's injection Psi_n : H^1(Mtilde_n(F)) -> K_{2n-1}(F)_Q with Beilinson's regulator reg_infinity(Psi_n [x]_n) = (n-1)! P_n(x) (BBdJR Theorem 4.7), natural in F; generation of K_{2n-1}(Q(mu_N))_Q by the [zeta]_n (BBdJR Example 4.10). Needed by `ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements`, `ColemanIntegration:L3/padic-beilinson-conjecture`, `ColemanIntegration:L3/padic-beilinson-for-dirichlet-motives`.
- **Request to `BorelRegulators:R.7`.** Beilinson's regulator reg_infinity : K_{2n-1}(C) -> R(n-1) with its normalisation (half of Borel's) and Borel's theorem giving dim_Q K_{2n-1}(k)_Q, used for the complex part of the p-adic Beilinson proposition and for its dimension condition (BBdJR Theorem 2.2 and Proposition 3.10). Needed by `ColemanIntegration:L3/padic-beilinson-conjecture`, `ColemanIntegration:L3/padic-beilinson-for-dirichlet-motives`.
- **Request to `AutomorphicPadicLFunctions:L3`.** p-adic L-functions L_p(s, chi, k) of 1-dimensional Artin characters of totally real fields k (Deligne-Ribet, Barsky, Cassou-Nogues; BBdJR Theorem 2.9) and, through Brauer induction, of Artin characters of Gal(Qbar/Q) with totally real kernel field (BBdJR (2.10) and (2.11)); needed to state the p-adic Beilinson proposition beyond abelian characters. Needed by `ColemanIntegration:L3/padic-beilinson-conjecture`.

## Source issues

Each entry gives the printed text, the correction and the reason; the packet records the versions compared and the searches for earlier reports.

- **`ColemanIntegration/E1`** (misprint; Explicit Coleman integration for hyperelliptic curves, Section 2, opening paragraph, p. 3 (arXiv v2; identical in arXiv v1)). Printed: “a homomorphism Log : C_p^x -> C_p whose restriction to the disc {x in C_p : |x - 1| < 1} is given by the logarithm series log(x) = sum_{i=1}^infinity (1-x)^i/i.” Correction: log(x) = -sum_{i >= 1} (1 - x)^i / i = sum_{i >= 1} (-1)^(i+1) (x - 1)^i / i. Reason: For x = 1 + h with h small the logarithm is h + O(h^2), while the printed series gives -h + O(h^2); the printed series is -log(x). Affects: nothing.
- **`ColemanIntegration/E2`** (misprint; Explicit Coleman integration for hyperelliptic curves, Section 3.3, Algorithm 11, step 2, p. 8 (arXiv v2)). Printed: “As the eigenvalues of the matrix M are algebraic integers of C_p-norm p^(m/2) != 1 (see [21, Section 2]), the matrix M - I is invertible” Correction: The eigenvalues are algebraic integers of complex absolute value p^(m/2) under every embedding into C (Weil numbers of weight 1); hence none equals 1 and M - I is invertible. Reason: An algebraic integer has C_p-norm at most 1, so no eigenvalue can have C_p-norm p^(m/2) > 1; for an ordinary curve some eigenvalues are p-adic units. The argument needs the archimedean absolute value (Riemann hypothesis for curves). Affects: nothing.
- **`ColemanIntegration/E3`** (misprint; Heidelberg lectures on Coleman integration, Section 1.3.3, formula for the action of phi on points, p. 7 (author copy of 7 November 2010)). Printed: “phi(z) = (sigma^(-1) g_1(z), . . . , sigma^(-1) g_1(z)) .” Correction: phi(z) = (sigma^(-1) g_1(z), ..., sigma^(-1) g_n(z)). Reason: g_i = phi(t_i) for i = 1, ..., n; the i-th coordinate of phi(z) is sigma^(-1) g_i(z). Affects: nothing.
- **`ColemanIntegration/E4`** (misprint; Heidelberg lectures on Coleman integration, Section 1.4, proof of Lemma 1, p. 8). Printed: “Then sigma^r is the identity on K and so we obtain the equation x = M_r x + d^i . ... This shows that x = (I - M_r)^(-1) d^i” Correction: x = M_r x + d_r and x = (I - M_r)^(-1) d_r, where d_r is the constant term obtained after r iterations (the index is r, not i). Reason: The iterated equation is sigma^i(x) = M_i x + d^i for each i; specialising to i = r (where sigma^r = id) gives the displayed equation with d^r. Affects: nothing.
- **`ColemanIntegration/E5`** (gap; Heidelberg lectures on Coleman integration, Section 1.4, end of the proof of Theorem 2 (independence of phi), p. 9). Printed: “This follows because one can show that the function H(x, y) = int_x^y omega is in fact an analytic function in two variables on the space of pairs (x, y) reducing to the same point, and that then the function h may be taken to be the pullback of H via the map (phi, phi') (we do not give full details here).” Correction: A complete argument: expand F_omega(phi'(x)) around phi(x) by Taylor's formula; the series sum_k ((phi' - phi)^k/k!) phi^*(partial^(k-1) f) converges on a strict neighbourhood because |phi' - phi| <= |pi| and |1/k| grows polynomially, and gives an overconvergent h with h(x) = int_(phi(x))^(phi'(x)) omega (ColemanIntegration:L1/taylor-homotopy). Reason: The analyticity of H on the tube of the diagonal and the identification of h are asserted without proof; the author says so. Affects: the proof.
- **`ColemanIntegration/E6`** (misprint; Heidelberg lectures on Coleman integration, Section 1.3.2, definition of T_n^dagger, p. 5). Printed: “T_n^dagger = { sum a_I t^I , a_I in R, exists r > 1 such that lim_{I -> infinity} |a_I| r^I = 0 }” Correction: The condition is |a_I| r^(|I|) -> 0, with |I| = i_1 + ... + i_n (as in the preceding definition of O(B°_n)). Reason: r is a real number and I a multi-index; r^I has no meaning unless read as r^(|I|). Affects: nothing.
- **`ColemanIntegration/E7`** (misprint; Coleman integration using the Tannakian formalism, Proposition 5.3, p. 16 (arXiv v1)). Printed: “Let A_Col,1(T) = A(T) and let A_Col,n+1(T) be the product inside A_Col(T) of A(T) with {f in A_Col(T), df in Omega^1(T) . A_Col,n-1(T)}.” Correction: ... with {f in A_Col(T), df in Omega^1(T) . A_Col,n(T)}. Reason: With n - 1 the recursion refers to A_Col,0(T), which is not defined, when n = 1; Proposition 5.5 and Coleman's recursion M_(i+1) = A . int(W_i) use the previous step n. Affects: nothing.
- **`ColemanIntegration/E8`** (misprint; Coleman integration using the Tannakian formalism, Definition 4.7, p. 13 (arXiv v1)). Printed: “we immediately obtain a ring homomorphism f^* : A_Col(T) -> A_Col(T') and maps f^* Omega^i_Col(T) -> Omega^i_Col(T) compatible with the differentials” Correction: maps f^* : Omega^i_Col(T) -> Omega^i_Col(T'). Reason: Pullback along f : T' -> T lands in forms on T', as for functions in the same sentence. Affects: nothing.
- **`ColemanIntegration/E9`** (gap; An introduction to p-adic L-functions, Theorem 6.1(ii), p. 36, and its proof, pp. 37-38 (arXiv v2)). Printed: “L_p(theta, 1) = -(1 - theta(p)p^-1) (1/G(theta^-1)) sum_{c in (Z/NZ)^x} theta^-1(c) log_p(1 - eps_N^c).” Correction: The notes use log_p on elements of Q_p(mu_N)^x without defining it on C_p^x; read it as the Iwasawa branch (log_p(p) = 0). For non-trivial theta the value does not depend on the branch: v_p(1 - eps_N^c) is the same for all c in (Z/NZ)^x and sum_c theta^-1(c) = 0, so the branch terms (b - a) v_p(1 - eps_N^c) cancel. Reason: Only Lemma 4.? on the exponential and the logarithm on 1 + pZ_p appear before Section 6; when N is a power of p, 1 - eps_N^c is not a unit (valuation 1/(p^(n-1)(p - 1))), so log_p(1 - eps_N^c) depends on the branch. Affects: nothing.
- **`ColemanIntegration/E10`** (misprint; The syntomic regulator for the K-theory of fields, Proof of Proposition 2.6, arXiv v1 and v2, p. 10 (the published version, p. 877, has the corrected text)). Printed: “According to [Col82, Proposition 7.1], Li_{n,a}(z) − Li_{n−1,a}(z) log(z) extends to an analytic function on |1−z| < 1.” Correction: Li_{n,a}(z) − (1/(n−1))·Li_{n−1,a}(z)·log(z) extends to an analytic function on |1 − z| < 1 (the function γ_n used in the next line). Reason: On the residue disc of 1, Li_n = λ_n − log(z)^{n−1}log(1 − z)/(n − 1)! with λ_n analytic (ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs); hence Li_n − log(z)Li_{n−1} = λ_n − log(z)λ_{n−1} + (n − 2)/(n − 1)!·log(z)^{n−1}log(1 − z), which is not analytic at 1 for n ≥ 3, while with the factor 1/(n − 1) the logarithmic terms cancel. Affects: nothing.
- **`ColemanIntegration/E11`** (misprint; The syntomic regulator for the K-theory of fields, Proof of Proposition 2.6, arXiv v1 and v2, pp. 10-11 (the published version, p. 877, has the corrected text)). Printed: “For |z − 1| < 1 this relation now reads C = m^{n−1} · m · C, which shows C = 0 as required.” Correction: For |z − 1| < 1 and m = p this relation now reads C = m^{n−1}·m·C (for general m it reads C = m^{n−1}·p^{v_p(m)}·C). Reason: For z in the residue disc of 1, ζz lies in that disc only for ζ of p-power order; the other terms vanish because γ_n = 0 off the residue discs of 1 and ∞. The conclusion C = 0 holds for every m ≥ 2. Affects: nothing.
- **`ColemanIntegration/E12`** (misprint; The syntomic regulator for the K-theory of fields, §1, p. 869 of the published version (also arXiv v1 and v2, p. 3)). Printed: “The function Li_n(z) extends to a locally analytic function on C_p \ {1} with Li_n(z) = 0 for n ⩾ 1.” Correction: ... with Li_n(0) = 0 for n ⩾ 1. Reason: Li_n is not identically zero (on the open unit disc it is Σ z^k/k^n, as the previous sentence says); the intended normalisation is the value at 0, matching lim_{z→0} Li_n(z) = 0 two sentences earlier. Affects: nothing.
- **`ColemanIntegration/E13`** (misprint; On the p-adic Beilinson conjecture for number fields, §4, p. 19 (arXiv v2; the same sentence in arXiv v1)). Printed: “Any such extension will be called a branch of the p-adic polylogarithm.” Correction: Any such extension will be called a branch of the p-adic logarithm. Reason: The sentence concerns the extensions log_p : C_p^* → C_p of the logarithm on O_{C_p}^*, fixed by the choice of log_p(p); the polylogarithms are introduced only in the next paragraph. Affects: nothing.
- **`ColemanIntegration/E14`** (misprint; A note on functional equations of the p-adic polylogarithms, §0, the system (*_1) before Theorem A', p. 345 (Bull. SMF 119 (1991), version of record)). Printed: “(*_1) ℓ′_1 = 1/(z − 1), ℓ′_2 = ℓ_1/z, ..., ℓ′_n = ℓ_{n−1}/z” Correction: ℓ′_1 = 1/(1 − z) (so that ℓ_1(z) = −log(1 − z) = Li_1(z)). Reason: With the initial condition lim_{z→0} ℓ_k(z) = 0 of (**_2), the printed system gives ℓ_1 = log(1 − z) = −Σ z^n/n and ℓ_k = −Σ z^n/n^k, contradicting the next paragraph ('The function Li_k(z) is analytic at 0 and has the convergent Taylor expansion Σ z^n/n^k at 0') and the functional equation (*) on p. 362. Affects: nothing.
- **`ColemanIntegration/E15`** (error; An introduction to p-adic L-functions, Theorem 6.7(ii), p. 39 (arXiv v2); p. 154 (Ess. Number Th. 4 (2025))). Printed: “L_p(θ,k) = (1 − θ(p)p^{−k}) (1/G(θ^{−1})) Σ_{c∈(Z/NZ)^×} θ^{−1}(c) Li_{k,p}(ε_N^c).” Correction: L_p(θω^{1−k}, k) = (1 − θ(p)p^{−k}) G(θ^{−1})^{−1} Σ_c θ^{−1}(c) Li_k(ε_N^c), with Li_k Coleman's polylogarithm (Iwasawa branch); equivalently L_p(θ,k) is given by the same formula for the primitive character attached to θω^{k−1}. The printed statement holds exactly when (p − 1) divides k − 1. Reason: With RJW's Definition 5.18, L_p(ψ, s) vanishes identically for odd ψ, while the right side vanishes exactly when θ(−1) = (−1)^k; for even k the two sides therefore vanish for opposite parities of θ. Numerically, p = 5, θ = χ_{−3}, k = 2: L_5(θ,2) = 0 but the right side is 2 + 5 + 2·5^2 + ⋯ = L_5(θω^{−1},2) (agreement to O(5^39)); p = 11, θ = χ_5, k = 3: L_11(θ,3) = 5 + 11 + ⋯, right side 7 + 4·11 + ⋯ = L_11(θω^{−2},3). BHYY Theorem 1.1 and BBdJR Proposition 4.17 state Coleman's formula for L_p(χω^{1−k}, k). Affects: a stated result.
- **`ColemanIntegration/E16`** (gap; An introduction to p-adic L-functions, Remark 6.6 and Theorem 6.7(ii), p. 39 (arXiv v2); p. 154 (version of record)). Printed: “Coleman constructed p-adic analogues Li_{k,p}(z), which are locally analytic functions on C_p∖{1}, and showed:” Correction: Li_{k,p} must be Coleman's polylogarithm Li_k (Coleman function with Li_1(z) = −log_p(1 − z), z dLi_k/dz = Li_{k−1}, Li_k(z) = Σ z^n/n^k near 0), not the modified Li_k^{(p)}(z) = Li_k(z) − p^{−k}Li_k(z^p), and the branch must be fixed (the character sums do not depend on it). Reason: Locally analytic solutions of the differential equations are determined only up to locally constant functions, and changing Li_{k,p} by a constant on one residue class changes the right side (ColemanIntegration:L3/coleman-functions-versus-locally-analytic). With the Euler factor printed, Li_{k,p} = Li_k^{(p)} would give the factor (1 − θ(p)p^{−k})^2 for p ∤ N, contradicting the case k = 1 (Theorem 6.1). Affects: a stated result.
- **`ColemanIntegration/E17`** (gap; An introduction to p-adic L-functions, §6.2, (6.2), Lemmas 6.4 and 6.5 and the proof of Theorem 6.1(ii), pp. 36-38 (arXiv v2); pp. 149-153 (version of record)). Printed: “Let θ be a non-trivial Dirichlet character, which as usual we write in the form χη, where χ has conductor p^n and η has conductor D prime to p. ... L_p(θ,1) := ∫_{Z_p^×} χ(x)x^{−1}·μ_η = ∫_{Z_p^×} x^{−1}·μ_θ.” Correction: For D = 1 (pure p-power conductor) μ_η and μ_θ = (μ_η)_χ are not defined (RJW Theorem 5.7 requires D > 1), and the rational function F_θ of Lemma 5.12 has poles at ε^{−c} − 1 inside the open unit disc, so it is no Amice transform; the step F̃_θ = (F̃_η)_χ with F̃_η ∈ R^+ in the proof of Lemma 6.4 fails since F̃_1 = −log T. The case D = 1 must use the smoothed measure: L_p(χ,1) = (χ(a) − 1)^{−1} ∫_{Z_p^×} x^{−1}·(μ_a)_χ, and the twist by χ of RJW's F̃_a of §7 (ColemanIntegration:L3/negative-moments-of-smoothed-measure at k = 1). Reason: Residues: F_θ = −G^{−1} Σ θ^{−1}(c)/((1+T)ε^c − 1) has simple poles at the distinct points T = ε^{−c} − 1, |ε^{−c} − 1| < 1, with residues −G^{−1}θ^{−1}(c)ε^{−c} ≠ 0. The corrected argument gives Theorem 6.1(ii) for conductor p^n, checked numerically for p = 5, θ = ω^2 (to O(5^34)) and p = 3, N = 9 (to O(3^38)). Affects: the proof.
- **`ColemanIntegration/E18`** (misprint; An introduction to p-adic L-functions, proof of Lemma 6.4, p. 38 (arXiv v2); p. 152 (version of record)). Printed: “F̃_θ(T) = (F̃_η)_χ(T) = −(1/G(χ^{−1})) Σ_{c∈(Z/p^nZ)^×} χ^{−1}(c) F̃_η((1+T)ε_{p^n}^c − 1).” Correction: The twist of Lemma 5.4 has the factor +1/G(χ^{−1}): F̃_θ(T) = (1/G(χ^{−1})) Σ_c χ^{−1}(c) F̃_η((1+T)ε_{p^n}^c − 1), for ε_N = ε_{p^n}ε_D. Reason: Lemma 5.4 prints A_{μ_χ}(T) = (1/G(χ^{−1})) Σ χ(c)^{−1} A_μ((1+T)ε^c − 1); with ε_N = ε_{p^n}ε_D and the Chinese remainder theorem, G(θ^{−1}) = G(χ^{−1})G(η^{−1}) and the + sign reproduces F̃_θ. Affects: nothing.
- **`ColemanIntegration/E19`** (misprint; An introduction to p-adic L-functions, proof of Theorem 6.1(ii), case (1), p. 38 (arXiv v2); p. 153 (version of record)). Printed: “First assume that n > 1, so that χ ≠ 1;” Correction: First assume that n ≥ 1, so that χ ≠ 1; Reason: Case (2) treats n = 0 only, so n = 1 (conductor Dp) would be covered by neither case; χ ≠ 1 holds for every n ≥ 1. Affects: nothing.
- **`ColemanIntegration/E20`** (misprint; An introduction to p-adic L-functions, proof of Theorem 6.1(i), p. 36 (arXiv v2); p. 149 (version of record)). Printed: “L(θ,s) = Σ_{a∈(Z/NZ)^×} θ(a) Σ_{n≡a (mod D)} n^{−s}.” Correction: Σ_{n ≡ a (mod N)} n^{−s}. Reason: θ has conductor N and the next line uses the indicator of n ≡ a mod N. Affects: nothing.
- **`ColemanIntegration/E21`** (misprint; An introduction to p-adic L-functions, proof of Lemma 6.5, p. 38 (arXiv v2); p. 152 (version of record)). Printed: “∂ log((1+T)ε_D^c − 1) = ... and the fact that Σ_{c∈(Z/DZ)^×} θ^{−1}(c) = 0.” Correction: ε_N^c and (Z/NZ)^× in place of ε_D^c and (Z/DZ)^×. Reason: The lemma concerns θ of conductor N = Dp^n and F_θ of Lemma 5.12, which is written with ε_{Dp^n}. Affects: nothing.
- **`ColemanIntegration/E22`** (misprint; An introduction to p-adic L-functions, proof of Lemma 7.5, p. 43 (arXiv v2); p. 158 (version of record)). Printed: “((1 − φ∘ψ)F̃_a)(0) = F̃_a(0) − (φ∘ψ)F̃_a(0) = −log_p(a) − p^{−1}log_p(a) = −(1 − p^{−1})log_p(a),” Correction: = −log_p(a) + p^{−1}log_p(a) = −(1 − p^{−1})log_p(a). Reason: F̃_a(0) = −log_p(a) and (φ∘ψ)F̃_a(0) = −p^{−1}log_p(a) are both printed one line earlier; their difference is −log_p(a) + p^{−1}log_p(a). Affects: nothing.
- **`ColemanIntegration/E23`** (gap; An introduction to p-adic L-functions, proof of Theorem 6.1(i), end, p. 37 (arXiv v2); p. 150 (version of record)). Printed: “Thus we may consider the Taylor series expansion −log(1−ε_N^c) = Σ_{n≥1} ε_N^{nc} n^{−1}. Substituting this into (6.1), we see the series converges at s=1 to the required result.” Correction: Two facts are needed: Σ_n ε^{nc} n^{−s} converges uniformly for real s ∈ [1, 2] (Dirichlet's test with bounded partial sums), so its value at s = 1 is the limit as s → 1^+ of the continued function; and Σ_n ε^{nc}/n = −log(1 − ε^c) by Abel's limit theorem, the series converging at the boundary point ε^c ≠ 1. Reason: At |z| = 1 the Taylor series of −log(1 − z) converges only conditionally, and identifying the value of the continued L-function at s = 1 with the value of the series needs the continuity in s. Affects: the proof.
- **`ColemanIntegration/E24`** (misprint; On the p-adic Beilinson conjecture for number fields, Definition 3.6, p. 11 (arXiv v2)). Printed: “for ∗ = ∞ or p we let R_{n,∞}(M_π^E) be the determinant of the pairing [·,·]_∗” Correction: we let R_{n,∗}(M_π^E) be the determinant of the pairing [·,·]_∗ Reason: The definition covers both ∗ = ∞ and ∗ = p, and R_{n,p}(M_π^E) is used in Conjecture 3.18(2). Affects: nothing.

## Restructuring proposals

1. **The p-adic logarithm and its branches are owned by ColemanIntegration L0** (ownership, rescope; ColemanIntegration, DirichletPadicLFunctions). ColemanIntegration:L0 ('Construct the logarithm with log_p(p)=0 on the necessary annuli and record how another branch changes it') and DirichletPadicLFunctions:L3 ('Fix log_p(p)=0 and the logarithm on all algebraic extensions compatibly') both claim the p-adic logarithm; the accepted restructuring RS-14 already names ColemanIntegration:L0 as owner of 'The common p-adic logarithm normalized by log_p(p)=0, compatible extension and branch change'. This packet plans it as L0/log-branch, L0/log-branch-change, L0/iwasawa-logarithm and L0/log-branch-field-compatibility, together with its analytic foundations (L0/log-one-add-convergence, L0/log-one-add-mul, L0/cp-unit-power-principal). *Proposal:* Keep ownership in ColemanIntegration:L0 (as RS-14 decided): DirichletPadicLFunctions:L3 imports L0/iwasawa-logarithm and L0/log-branch-field-compatibility by node id and keeps only the L-value statements (Leopoldt's formula, nonvanishing of log_p(a), branches of L_p). Reasons: the logarithm is an analytic foundation needed before Coleman integration (L1), whereas Dirichlet L3 sits after the Kubota-Leopoldt construction; nothing in L0 depends on DirichletPadicLFunctions, so the edge ColemanIntegration:L0 -> DirichletPadicLFunctions:L3 creates no cycle, while the reverse ownership would make Coleman L0 depend on Dirichlet L3, which requires LocallyAnalyticDistributions:L3, and would put an unrelated measure-theoretic chain under Coleman integration.
2. **Move the edge from DirichletPadicLFunctions L0 to ColemanIntegration L3** (edge, rescope; ColemanIntegration, DirichletPadicLFunctions). The atlas edge DirichletPadicLFunctions:L0 -> ColemanIntegration:L0 carries nothing used by L0: no node of L0 uses Gauss sums, generalised Bernoulli numbers or primitive characters (RS-14 already replaced it by direct upstream handoffs). These objects enter only at ColemanIntegration:L3 (Theorem 6.7) and possibly L2 (norm/trace compatibilities for primitive characters). *Proposal:* Replace the stage requirement DirichletPadicLFunctions:L0 of ColemanIntegration:L0 by a requirement of ColemanIntegration:L3 (and of L2 if part B uses Gauss sums there).
3. **Functions on open discs and primitives: split between ColemanIntegration L0 and LocallyAnalyticDistributions L1** (ownership, rescope; ColemanIntegration, LocallyAnalyticDistributions). AUDIT-25 lists an overlap: primitives on discs with a chosen base value and branches of the logarithm. LocallyAnalyticDistributions:L1 keeps (RS-16) the Amice transform onto functions on the open unit disc (R^+) with its Frechet topology and locally analytic primitives modulo locally constant functions on compact X; ColemanIntegration needs the algebra of functions on arbitrary open discs of C_p as functions (Mathlib's HasFPowerSeriesOnBall), the unique primitive with base value there, and the logarithm. *Proposal:* ColemanIntegration:L0 owns L0/disc-analytic-functions (all centres and radii, as a Mathlib-predicate subalgebra), L0/disc-primitive-unique and the logarithm; LocallyAnalyticDistributions:L1 owns R^+ with its Frechet topology and the Amice transform and proves the comparison equivRPlus with the case (0, 1); it imports L0/log-branch for logarithms of (1 + T) xi - 1.
4. **Overconvergent algebras, annuli, Frobenius lifts and rigid cohomology are imported by ColemanIntegration** (ownership, rescope; ColemanIntegration, PadicHodgeTheory, AdicSpacesPartII, PadicDifferentialEquationsAndRigidCohomology). AUDIT-23 records duplicates: overconvergent power series and annuli (PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicHodgeTheory:P7:annulus-foundations), dagger algebras and strict neighbourhoods (AdicSpacesPartII:F1, owner by RS-05), Frobenius lifts (RD.0) and rigid cohomology with lift-independence and finiteness (RD.4, RD.5). This packet imports them by requests and plans only the Coleman-specific parts. *Proposal:* Narrow the stage texts: ColemanIntegration:L0 'uses' convergent and overconvergent power series and Laurent series on annuli from P7:annulus-foundations and F1, and owns termwise integration, residues, primitives and the logarithm; ColemanIntegration:L1 'uses' wide opens, Frobenius lifts, H^1_rig finiteness, lift-independence of the cohomological Frobenius and weights from F1, R2, RD.0, RD.4, RD.5, RD.6, and owns Dwork's principle, the unipotent word algebra, Coleman functions and integration, the uniqueness principle, independence of the lift for Coleman functions and the direct construction for P^1 minus {0, infinity} and mu_N. Add the stage edges AdicSpacesPartII:F1, AdicSpacesPartII:R2, PadicHodgeTheory:P7:annulus-foundations, PadicDifferentialEquationsAndRigidCohomology:RD.0, RD.4, RD.5, RD.6 -> ColemanIntegration:L0/L1 (none of them depends on ColemanIntegration, so no cycle).
5. **The P^1 minus {0, 1, infinity} unipotent case: de Rham side here, Tannakian side in NC.2** (ownership, rescope; ColemanIntegration, AnabelianGeometryAndNonabelianChabauty). AUDIT-08 notes that L1's direct construction for P^1 minus {0, 1, infinity} overlaps NC.2's construction of unipotent fundamental groups for that curve. *Proposal:* ColemanIntegration:L1 owns the unipotent word algebra (the universal unipotent connection of each depth with its Frobenius structure) and the realisation by Coleman functions (L1/word-algebra, L1/word-algebra-frobenius, L1/coleman-realization, L1/punctured-line-coleman-functions); AnabelianGeometryAndNonabelianChabauty:NC.2 owns the Tannakian fundamental group, path torsors and the etale side, and identifies its de Rham depth-n quotient with the dual of U_(<= n) with its Frobenius, citing these nodes.
6. **Coleman integrals versus abelian integrals belong to EffectiveDiophantineMethods ED.4** (ownership, rescope; ColemanIntegration, EffectiveDiophantineMethods). Chabauty's method uses that the Coleman integral of a holomorphic differential on a good-reduction curve equals the abelian integral given by the p-adic logarithm of the Jacobian (Coleman, Ann. of Math. 1985, not public; McCallum-Poonen Section 5.1 define p-adic integrals through the Jacobian). No layer owns the p-adic logarithm of the Jacobian's Lie group, and ED.4 consumes ColemanIntegration:L1, so the comparison cannot live in L1 without a cycle. *Proposal:* EffectiveDiophantineMethods:ED.4 owns the p-adic logarithm of J(Q_p) and the comparison theorem 'int_P^Q omega (ColemanIntegration:L1/coleman-integral) = <log_J([Q - P]), omega_J>' for holomorphic omega, consuming L1/coleman-integral, L1/coleman-uniqueness-principle and L1/good-reduction-datum-exists.
7. **Divide L1 into general Frobenius continuation and the direct genus-0 construction** (sub-layers, split; ColemanIntegration). L1 contains a general theory for good-reduction curves resting on imported rigid-cohomology input and an unconditional construction for P^1 minus {0, infinity} and mu_N; the atlas reads better with two sub-layers. *Proposal:* L1a 'Frobenius continuation on good-reduction curves': good-reduction-pair, wide-open-neighbourhood, residue-disc-parametrisation, locally-analytic-log-functions, frobenius-lift, teichmuller-point, frobenius-h1-datum, good-reduction-datum-exists, weil-weight-no-root-of-unity, frobenius-orbit-linear-algebra, dwork-principle, word-algebra, word-algebra-integrability, word-algebra-local-expansion, word-algebra-frobenius, coleman-realization, coleman-functions, coleman-integral, coleman-integration-characterisation, coleman-uniqueness-principle, taylor-homotopy, frobenius-lift-independence, coleman-pullback, branch-independence-principle, cohomological-analytic-pullback. L1b 'The punctured projective line': punctured-line, punctured-line-mittag-leffler, punctured-line-de-rham-h1, punctured-line-frobenius, punctured-line-datum, punctured-line-coleman-functions, punctured-line-based-primitive, punctured-line-singular-disc-expansion.
8. **GSWZ Lemma 2.1 (integrality of Li_n^{(p)}) is planned twice** (ownership, rescope; ColemanIntegration, HabiroNumberFields). HabiroNumberFields:HB.7/pochhammer-dwork-difference states and proves GSWZ Lemma 2.1, Li_n^{(p)}(t) ∈ Z[t, 1/(1−t)]^∧_p, which is ColemanIntegration:L2/integral-modified-polylogarithm (the same statement, with the same proof as BHYY Lemma 3.3). ColemanIntegration is the unique owner of p-adic polylogarithms (its README and the audit AUDIT-26/AUDIT-30). *Proposal:* HabiroNumberFields HB.7/pochhammer-dwork-difference imports Lemma 2.1 from ColemanIntegration:L2/integral-modified-polylogarithm (prerequisite plus request) and keeps only GSWZ Proposition 2.2 (the Dwork difference of the infinite Pochhammer symbol and its specialisation t ↦ ζ).
9. **Complex and p-adic polylogarithms: no duplication** (boundary, rescope; ColemanIntegration, Polylogarithms). AUDIT-30 lists ColemanIntegration:L2 as a duplicate of Polylogarithms:P.1. The formal series polylogSeries and the complex Li_n with its distribution and inversion relations belong to P.1; L2 plans only the p-adic continuation and cites P.1 node ids (polylogarithm-power-series, complex-polylogarithm-at-roots-of-unity, five-term-relation). *Proposal:* Keep both layers; record the boundary: Polylogarithms P.1 owns Li_n over C and the formal series over Q; ColemanIntegration L2 owns the p-adic Li_k, Li_k^{(p)}, D_p and their relations and values.
10. **Dilogarithm identities for D_p belong to ColemanIntegration L2** (boundary, rescope; ColemanIntegration, PadicHodgeRegulators). PadicHodgeRegulators D.1 imports 'logarithms, analytic continuation and p-adic polylogarithms' and D.2 compares the regulator with the p-adic dilogarithm on the Bloch group, which needs the five-term relation for D_p (GSWZ (173)-(174)). L2 now plans D^a, its reflection, inversion, branch and Frobenius relations, and the five-term relation (ColemanIntegration:L2/dilogarithm-identities, ColemanIntegration:L2/five-term-relation). The p²-integrality of D_p on special units (GSWZ Lemma 3.1) and the spanning statement (Proposition 3.3) stay in PadicHodgeRegulators D.3, which imports the tame values and the integral ℓ_k from L2. *Proposal:* PadicHodgeRegulators D.1-D.3 cite ColemanIntegration:L2/dilogarithm-identities, ColemanIntegration:L2/five-term-relation, ColemanIntegration:L2/values-at-tame-roots-of-unity and ColemanIntegration:L2/integral-modified-polylogarithm by node id.
11. **Coleman functions on P¹ minus finite sets with bad (semistable) reduction** (scope, rescope; ColemanIntegration). L1 is scoped to curves with good reduction and to P¹ ∖ {0,1,∞}. The five-term relation for D_p in all configurations (and, more generally, functional equations of polylogarithms à la Wojtkowiak, Theorem A) uses Coleman integration on C_p minus arbitrary finitely many points, whose reductions may collide. *Proposal:* Either add to ColemanIntegration L1 the case of P¹ minus a finite set with semistable reduction (Coleman 1982 §V logarithmic F-crystals; Coleman-de Shalit), or keep L1 as is and close the gap by the two-variable lemma described in the packet's gaps; the lead decides with part A.
12. **Leopoldt's formula (RJW Theorem 6.1) and its pure p-power-conductor proof** (restructure, rescope; ColemanIntegration, DirichletPadicLFunctions). DirichletPadicLFunctions:L3 owns RJW Theorem 6.1 and plans RJW's §6.2 proof, whose pure p-power-conductor case (D = 1) uses the undefined measure mu_theta = (mu_1)_chi (ColemanIntegration/E17). ColemanIntegration:L3 proves Theorem 6.7 for all k, which contains Theorem 6.1 at k = 1, but it requires DirichletPadicLFunctions:L3, so DirichletPadicLFunctions cannot import it without a cycle. *Proposal:* Keep Theorem 6.1 in DirichletPadicLFunctions:L3 and rescope its proof for D = 1 to the smoothed measure: twist mu_a by chi and use RJW's Ftilde_a of §7 (ColemanIntegration:L3/negative-moments-of-smoothed-measure at k = 1 is exactly that computation). ColemanIntegration:L3 keeps the general k and the comparison node recovers-leopoldt-formula.
13. **Negative moments on Z_p^x through locally analytic primitives** (restructure, rescope; ColemanIntegration, LocallyAnalyticDistributions). ColemanIntegration:L3/unit-moment-via-distribution-primitive (int_{Z_p^x} x^{-k} mu = ((1 - phi psi) Ftilde)(0) when ((1+T) d/dT)^k Ftilde = A_mu) is a general statement about locally analytic distributions, the k-fold version of RJW Lemma 6.5 and (6.5); LocallyAnalyticDistributions:L1 plans 'division by x on distributions supported on units'. *Proposal:* Move ColemanIntegration:L3/unit-moment-via-distribution-primitive to LocallyAnalyticDistributions:L1 and cite it from ColemanIntegration:L3; LocallyAnalyticDistributions:L1 can state it without division by x, as in its proof step 2.
14. **Correct the L3 target statement** (restructure, rescope; ColemanIntegration). The stage text of ColemanIntegration:L3 repeats RJW Theorem 6.7(ii) as printed, L_p(theta, k) = (1 - theta(p) p^{-k}) G(theta^{-1})^{-1} sum theta^{-1}(c) Li_{k,p}(xi_N^c), which is false for k not congruent to 1 mod p - 1 in RJW's normalisation (ColemanIntegration/E15). *Proposal:* Replace the displayed target by L_p(theta omega^{1-k}, k) = (1 - theta(p) p^{-k}) G(theta^{-1})^{-1} sum_c theta^{-1}(c) Li_k(xi_N^c), with Li_k Coleman's polylogarithm for the Iwasawa branch, and add the RJW-normalisation corollary ColemanIntegration:L3/coleman-formula-rjw-normalisation.
15. **Complex polylogarithm on the unit circle** (restructure, rescope; ColemanIntegration, Polylogarithms). ColemanIntegration:L3/complex-polylog-at-roots-of-unity (Li_k(e^{2 pi i a}) = expZeta(a, k) for k >= 2) is an API statement about the complex polylogarithm owned by Polylogarithms:P.1. *Proposal:* Polylogarithms:P.1/classical-polylogarithm takes it as an API item (comparison with Mathlib's expZeta), and ColemanIntegration:L3 cites it.

## Numerical checks

All checks use PARI/GP 2.17.4; the scripts are kept with the job's scratch files, and the packet's acceptance
lines record each value.

- **L0/L1.** PARI's $p$-adic logarithm is the Iwasawa branch. The depth-two direct construction, including the
  Frobenius, the tangential normalisation and the sign of $\mathrm{Li}_2$, gives $p\,\mathrm{Li}^{(p)}_2$ in
  agreement with Besser's measure formula: for $p=3$ at $z=2,5,8,1/3$ to $O(3^{10})$; for $p=5$ at $z=2,3,7,1/5$
  to $O(5^7)$; for $p=7$ at $z=2,3,5$ to $O(7^6)$. These precisions are the depth of the Riemann sums, not points
  of disagreement.
- **L2.** Tame values: valuations, Besser's congruence, inversion, and the distribution, inversion and Galois
  relations in $\mathbb Q_7(i)$. Special values $\mathrm{Li}_2(-1) = \mathrm{Li}_2(2) = 0$ and
  $\mathrm{Li}_2(1/2) = -\tfrac12\log^2 2$ at $p=5$. The overconvergent series $g_k$, with radius $p^{1/(p-1)}$.
  The Frobenius relation inside the residue disc of $1$, at $z = 1+t$ with $t^8 = 5$. The growth of the expansion
  at $-1$. The five-term relation for branches $a=0,1$ at six configurations.
- **L3.** The complex formula for characters of conductors 3, 4, 5, 7, 8, 9 and 12 and $k=1,\dots,4$, to about
  $10^{-76}$. The $p$-adic formula, with the left side from Washington's series and exact arithmetic in
  $\mathbb Q(\mu_N)$:
  - tame: $p=5$, $\chi_{-3}$, $k=2,4$ to $O(5^{39})$; $p=11$, $\chi_5$, $k=1,3$;
  - mixed conductor: $p=3$, $\chi_{12}$ and $\chi_{-15}$, to $O(3^{39})$;
  - pure $p$-power conductor: $p=3$, $N=9$, $k=1,\dots,4$, to $O(3^{37})$;
  - conductor exactly $p$: $p=5$, to $O(5^{34})$ and $O(5^{37})$.

  The formula as printed in the notes fails: for example $L_5(\chi_{-3},2) = 0$, while its right side is a unit.

## Sources

- `rjw`: Joaquin Rodrigues Jacinto, Chris Williams, *An introduction to p-adic L-functions*, arXiv:2309.15692v2. https://arxiv.org/abs/2309.15692v2. Read: Remark 3.39 (p. 24); Section 6: Theorem 6.1 and its proof (pp. 35-38); Remark 6.6 and Theorem 6.7 (p. 39); §6.1-6.2 (pp. 36-40): Theorem 6.1, Remarks 6.2-6.3, Lemma 6.4 and proof, Lemma 6.5, proof of Theorem 6.1(ii), Remark 6.6, Theorem 6.7; Remark 3.39 and Theorem 3.43 (pp. 24-25); §5.2 (pp. 33-35): the measures μ_η, μ_θ := (μ_η)_χ and Lemma 5.12 (F_θ); §3.5 (toolbox: Lemma 3.29, Corollary 3.30, (3.6), (3.8), (3.9), §3.5.2); §3.6 ((3.11), Lemma 3.38); §3.7 (Theorem 3.43, Remarks 3.44, 3.45); §4 (Definitions 4.5, 4.9, 4.10); §5 (Lemma 5.4, Theorem 5.7, Lemmas 5.9-5.12, Definitions 5.13-5.18, Remark 5.19, Theorem 5.20); §6 in full (Theorem 6.1, §6.1, §6.2, Lemmas 6.4, 6.5, Remark 6.6, Theorem 6.7, Remark 6.8); §7 in full (Theorem 7.1, Lemmas 7.2-7.5).
- `furusho-pmzv1`: Hidekazu Furusho, *p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation*, arXiv:math/0304085v2 (published Invent. Math. 155 (2004)). https://arxiv.org/abs/math/0304085v2. Read: Section 2.1 (Assumption 2.1 to Notation 2.6, pp. 7-9); Section 2.2 (Lemma 2.7 to Proposition 2.11, pp. 9-10); Section 3.1 (Definition 3.2 to Theorem 3.10, pp. 15-17); §2.1-2.3 (pp. 7-14): Assumption 2.1, Lemma 2.2, Propositions 2.3-2.5, Notation 2.6, Lemmas 2.7-2.8, Definition 2.9, Remark 2.10, Proposition 2.11, Notation 2.12, Theorem 2.13, Lemmas 2.14-2.15, Definition 2.17, Theorem 2.18, Examples 2.19, Theorem 2.25; §3.1 (pp. 15-17): Definition 3.2, Theorem 3.3, Lemma 3.4, Proposition 3.5; Examples 3.25 (p. 21).
- `besser-tannakian`: Amnon Besser, *Coleman integration using the Tannakian formalism*, arXiv:math/0011269v1 (published Math. Ann. 322 (2002)). https://arxiv.org/abs/math/0011269v1. Read: Section 1; Section 2 (unipotent isocrystals); Section 3 (Theorem 3.1, Corollaries 3.2-3.3); Section 4 (Definitions 4.1-4.10, Proposition 4.12 to Proposition 4.21); Section 5 (Definition 5.1 to Theorem 5.7, pp. 16-18); §1 (introduction); §4 (pp. 13-15): Corollary 4.13 (uniqueness principle), Corollary 4.14, Theorem 4.15; §5 (the reformulation of Coleman's A_log, Ω_log and the characterisation of integration).
- `bbk-explicit`: Jennifer S. Balakrishnan, Robert W. Bradshaw, Kiran S. Kedlaya, *Explicit Coleman integration for hyperelliptic curves*, arXiv:1004.4936v2 (ANTS IX, LNCS 6197, 2010); v1 also checked for the source issues. https://arxiv.org/abs/1004.4936v2. Read: Section 1; Section 2 (Definitions 1-4, Theorem 5, Remark 6); Section 3 (Definition 7, Section 3.1, Algorithms 8, 10, 11, Remarks 12-13, Definition 14); §2 (Definitions 1-4, Remark 2, Theorem 5 (Coleman), Remark 6).
- `besser-finite-polylog`: Amnon Besser, *Finite and p-adic polylogarithms*, arXiv:math/0006051v1 (published Compositio Math. 130 (2002)). https://arxiv.org/abs/math/0006051v1. Read: Section 1; Section 2 (Proposition with the measure formula, Corollary 2.2); the whole paper (§§1-3, pp. 1-8); §1; §2 (Proposition 2.1 and its proof, Corollary 2.2, the remark after Proposition 2.3 on the Frobenius and distribution ambiguity).
- `besser-heidelberg`: Amnon Besser, *Heidelberg lectures on Coleman integration*, author copy dated 7 November 2010, from the author's page, read 2026-09-25; published in The Arithmetic of Fundamental Groups (PIA 2010), Contributions in Mathematical and Computational Sciences 2, Springer 2012, pp. 3-52. https://www.math.bgu.ac.il/~bessera/Heidelberg-lecture.pdf. Read: 1.1-1.3 (rigid analysis, dagger algebras, Monsky-Washnitzer cohomology, Proposition 1, Theorem 1, Definitions 1-3); 1.4 (Theorem 2, Lemma 1 and the independence argument); 1.5 (unipotent isocrystals, Frobenius invariant path, Coleman functions, Proposition 7, Theorem 6, tangential base points).
- `mccallum-poonen`: William McCallum, Bjorn Poonen, *The method of Chabauty and Coleman*, author preprint from Poonen's page, read 2026-09-25 (published in Panoramas et Syntheses 36, SMF 2012). https://math.mit.edu/~poonen/papers/chabauty.pdf. Read: Sections 4-5 (p-adic integrals on J and on X, residue classes, Theorem 5.3); Section 8, Remark 8.3.
- `besser-dejeu-syntomic`: Amnon Besser, Rob de Jeu, *The syntomic regulator for the K-theory of fields*, Ann. Sci. École Norm. Sup. (4) 36 (2003), 867-924 (version of record, read from numdam, PDF sha256 c269f455db5fc0b69452a620d639b3a9d44d56b59ce9d79ec78cd1e5a00fb872); arXiv:math/0110334v2 (sha256 67b19d01ef3da4fdc8c2a3406868fa93abd2ac49782fb536614b2f051f2ed498) and v1 (sha256 043218c8ce5fc058ecb5db1ec779928fb99bcc5fdcf8317b4fb438d1ab5051b8) compared at every cited passage. https://www.numdam.org/item/10.1016/j.ansens.2003.01.003.pdf. Read: §1 (pp. 867-872): the p-adic polylogarithms, (1.2)-(1.4), Remark 1.5, Theorem 1.6; §2 (pp. 874-878): the summary of Coleman integration, Definition 2.1, Proposition 2.2, Remark 2.3, the results quoted from Coleman, (2.4)-(2.7), Proposition 2.6 and its proof, Proposition 2.8, Proposition 2.10.
- `bbdjr-beilinson`: Amnon Besser, Paul Buckingham, Rob de Jeu, Xavier-François Roblot, *On the p-adic Beilinson conjecture for number fields*, arXiv:0707.3682v2 (published in Pure Appl. Math. Q. 5 (2009)); v1 (sha256 537c87812ca798644303597eb4e649d2220bfe03a2ceb7a7b9926fae80c176ac) compared at the misprint. https://arxiv.org/abs/0707.3682v2. Read: §4 (pp. 17-23): Theorem 4.7, Example 4.10, the definition of the p-adic polylogarithms (pp. 19-20), (4.11)-(4.13), Theorem 4.14, Remarks 4.15-4.16, Proposition 4.17 and its proof; §1; §2 (Theorem 2.9, Lemma 2.15, Conjecture 2.17); §3 in full (Definitions 3.5, 3.6, Lemma 3.7, Propositions 3.10-3.12, Conjecture 3.18, Remarks 3.19-3.22); §4 in full (Conjecture 4.5, Theorem 4.7, Example 4.10, the p-adic polylogarithm class, Theorem 4.14, Remarks 4.15, 4.16, Proposition 4.17, Remarks 4.18, 4.19).
- `bhyy-polylog`: Kenichi Bannai, Kei Hagihara, Kazuki Yamada, Shuji Yamamoto, *p-adic polylogarithms and p-adic Hecke L-functions for totally real fields*, arXiv:2003.08157v2 (25 May 2022); the arXiv version was read. https://arxiv.org/abs/2003.08157v2. Read: §1 (pp. 1-4), Theorems 1.1-1.2; §3.1 (pp. 13-16): Definition 3.1, Remark 3.2, Lemma 3.3 and proof, Proposition 3.4, Lemma 3.5, Proposition 3.6; §1 (Theorem 1.1, (1.2)); §3.1 (Definition 3.1, Lemma 3.3, Propositions 3.4, 3.6); §4.1 (Theorems 4.1, 4.2); §5 in full (Theorem 5.5, Proposition 5.6, Theorem 5.8, Lemma 5.13, Corollary 5.14).
- `gswz`: Stavros Garoufalidis, Peter Scholze, Campbell Wheeler, Don Zagier, *The Habiro ring of a number field*, arXiv:2412.04241v2. https://arxiv.org/abs/2412.04241v2. Read: §1.7 (p. 14), the remark on V(t) and D_p; §2.1 (pp. 18-19): Lemma 2.1 and proof, Proposition 2.2; §3.1 (pp. 37-39): (172)-(179), Lemma 3.1, Propositions 3.2-3.3, Theorem 9.
- `wojtkowiak-functional`: Zdzisław Wojtkowiak, *A note on functional equations of the p-adic polylogarithms*, Bull. Soc. Math. France 119 (1991), no. 3, 343-370 (version of record; numdam scan, PDF sha256 3c29dd4f28f92bf84357ac423860d43b2aab91f840a3620333fabe84fd22e97e; page images of pp. 345 and 362-364 checked). http://www.numdam.org/item/BSMF_1991__119_3_343_0/. Read: §0 (pp. 343-347): Theorems A and A', the statement of the main theorem; §4 (pp. 361-366): Lemmas 4.1-4.3, Examples 1-3, Proposition 4.4 and proof, Corollary 4.5.
- `rjw-ent`: Joaquín Rodrigues Jacinto and Chris Williams, *An introduction to p-adic L-functions (version of record)*, Essential Number Theory 4 (2025), no. 1, 101-216; PDF downloaded 25 September 2026. https://msp.org/ent/2025/4-1/p03.xhtml. Read: Theorem 6.7 (p. 154); §6.1-§6.2 (pp. 149-154); Lemma 7.5 (pp. 157-158); (5-5) and Lemma 5.12 (p. 145).
- `besser-dejeu-syntomic-arxiv`: Amnon Besser and Rob de Jeu, *The syntomic regulator for K-theory of fields*, arXiv:math/0110334v2; Ann. Sci. École Norm. Sup. (4) 36 (2003). https://arxiv.org/abs/math/0110334v2. Read: §1 in full (Theorems 1.6, 1.10, 1.12, Remarks 1.5, 1.13, Conjecture 1.14); §2 in full (Definition 2.1, Remark 2.3 on Galois equivariance, Proposition 2.6, (2.4), Proposition 2.10); outline of §§3-7 (read for structure only).
