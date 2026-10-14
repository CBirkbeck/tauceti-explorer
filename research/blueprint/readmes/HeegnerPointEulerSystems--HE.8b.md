# Anticyclotomic Heegner main conjectures: the HE.8b proof interface

This layer proves the anticyclotomic main conjectures of Burungale–Castella–Skinner
(BCS), with their distinct rational and integral conclusions. It consumes the
early Heegner family of HE.8, the reciprocity and normalization of GZ.9, and the
quartic-CM congruence argument of AutomorphicCongruences L5w through the shared
two-variable comparisons of L5a. Its conclusions supply the cyclotomic return
in L5b and the conditional nonvanishing/refined-divisibility applications of
HE.8. There is no analytic-rank hypothesis in the BCS endpoint.

This is a target-level follow-up, not another construction of the main-conjecture
targets. The accepted [HE.7s packet](../packets/HeegnerPointEulerSystems--HE.7s.json)
already contains thirteen HE.8b nodes. Their IDs are retained and imported below.
The generated issue points to HE.0, but that packet now covers HE.0–HE.7 and has
no HE.8b coverage record. The present packet adds two key inputs to the inherited
proof: primitive Greenberg μ-vanishing and the exact anticyclotomic specialization
comparison. It leaves three explicit supplier gaps. Coverage is **planned**, and
the pass is **complete**; no implementation or mathematical closure is claimed.

The reviewed AUDIT-25 records all four HE.8b targets as absent at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Searches of those trees agree.
Tau Ceti's explicit classical 2-Selmer group and Mathlib's multiplicative
Dedekind Selmer group are different objects. The current upstream
ProfiniteArithmetic and JacobianChallenge documents were read, and the current
library and the nine post-snapshot roadmaps were checked for overlap. Their
profinite, curve and algebraic infrastructure is imported; none supplies these
arithmetic main-conjecture targets.

## Objects and conventions

Fix an elliptic curve $E/\mathbb Q$ of conductor $N$, an imaginary quadratic
field $K$, and a prime $p$ of good ordinary reduction. Write $D_K<0$ for the
**signed** fundamental discriminant. The BCS endpoint requires:

| Condition | Meaning |
| --- | --- |
| (disc) | $D_K$ is odd and $D_K\ne-3$. |
| (Heeg) | Every rational prime dividing $N$ splits in $K$; thus $N^-=1$ and $(N,D_K)=1$. |
| (spl) | $p=v\bar v$ splits in $K$, with $v$ fixed by the chosen embedding into $\overline{\mathbb Q}_p$. |
| (irr) | $E[p]$ is irreducible as a $G_{\mathbb Q}$-module. |
| (sur) | The actual residual image over $\mathbb Q$ is $\mathrm{GL}_2(\mathbb F_p)$. |

For the BCS endpoints $p>3$. The Euler-system input separately uses
irreducibility over $G_K$. The auxiliary-field verification must supply this
restriction condition for both members of the pair it uses. Neither
non-anomalous reduction nor $p\nmid h_K$ is added to the endpoint.

Here (irr) implies irreducibility over $G_K$. Otherwise the irreducible
two-dimensional representation would be induced from the quadratic field
$K$; inertia at a prime dividing $D_K$ would permute its two lines
nontrivially. This contradicts unramifiedness away from $Np$, since
$(D_K,Np)=1$.

Put $T=T_pE$, $W=E[p^\infty]$, and let $K_\infty^-/K$ be the anticyclotomic
$\mathbb Z_p$-extension. In this document

\[
 B=\mathbb Z_p\llbracket\Gamma^-\rrbracket,\qquad
 A=\mathbb Z_p\llbracket\Gamma_K\rrbracket,\qquad
 \Gamma_K=\operatorname{Gal}(K_\infty/K)\simeq\mathbb Z_p^2,
\]

where $K_\infty$ is the composite of the two $\mathbb Z_p$-extensions.
The quotient $\pi^-:A\to B$ kills the cyclotomic variable $\gamma^+-1$.
Use the inverse tautological action on the induced cohomology module, and
$\iota(\gamma)=\gamma^{-1}$ for the involution. An identification with a
power-series ring depends on a topological generator; the ideal statements do
not depend on that choice.

Let $R=\widehat{\mathbb Z_p^{\mathrm{ur}}}$, and write $A_R,B_R$ for the
**completed** coefficient extensions. The Greenberg equality is an ideal
statement in $B_R$ or $B_R[1/p]$, not an equality in $B$ obtained by dropping
the coefficient extension. The existing PMA L4 finite-flat base-change theorem
does not itself state this completed-unramified extension; request R4 below
specifies what is needed.

The compact ordinary Selmer module is
$S_E=H^1_{\mathcal F_\Lambda}(K,T\otimes B)$. Its discrete ordinary dual is
$X_E^{\mathrm{ord}}$; the latter has rank one in the Heegner main conjecture,
so the characteristic ideal in that conjecture belongs to its **torsion
submodule**. The actual stabilized Kummer class is $y_\infty\in S_E$. Put

\[
 I_E=\operatorname{char}_B(S_E/B y_\infty),\qquad
 H_E=\operatorname{char}_B((X_E^{\mathrm{ord}})_{\mathrm{tors}}).
\]

These are native characteristic ideals of finitely generated torsion modules,
defined by their height-one lengths. They are not initial Fitting ideals of
arbitrary presentations. A finite module over $\mathbb Z_p[[t]]$ has unit
characteristic ideal even when its initial Fitting ideal is proper.

The discrete Greenberg group used here imposes **zero at $v$** and **no
condition at $\bar v$**, with the specified propagated conditions away from
$p$. Its duals over $A,B$ are $X_E^{(2)}$, $X_E^-$, respectively. The
compact dual conditions are orthogonal under local Tate duality. Source
subscripts such as $X_{\emptyset,0}$ must be translated together with their
chosen prime and dual convention, using complex conjugation if necessary.
This torsion Greenberg dual is distinct from the all-$p$ ordinary rank-one
dual appearing in the Castella–Sano determinant statement.

Write $G_E=L_p^{\mathrm{Gr}}(E/K)\in A_R$ and
$B_E=L_p^{\mathrm{BDP,BCS}}(E/K)\in B_R$. BCGS uses a square-root distribution
$\mathcal L_E$; the normalization comparison must establish

\[
 (\pi^-G_E)=(B_E)=(\mathcal L_E^2).
\]

Equality of these ideals allows a proved unit, including a character-dependent
group-like unit. It does not permit division by an unverified period, class
number, regulator cokernel or Euler factor. BCGS Theorem 1.2.1 (PDF p.10) and
BCS Theorem 1.2.4 (v2 p.3) use the two different function conventions. GZ.9's
square-root-comparison node explicitly leaves an integral normalization gap;
that gap is retained here.

All formulas above use **primitive** functions and matching local conditions.
For a finite set $\Sigma$ away from $p$, an imprimitive version multiplies
the analytic function by the corresponding Euler polynomials and changes the
Selmer module by the matching local terms. Their nonunit factors must be
recorded. In particular, a general imprimitive modification cannot inherit a
primitive μ-vanishing statement without checking those factors.

## Imported definitions: use, API and checks

There is no new definition or construction in this part. The following are
requirements on the existing owners, with integration checks for this consumer.
The checks do not create duplicate API nodes.

| Imported object and owner | API consumed here | Discriminating checks |
| --- | --- | --- |
| Stabilized universal-norm family, `HE.8/universal-norm-heegner-family` | Actual level projection; fixed corestriction/auxiliary trace relations; dependence on the finite-solvability data. | The bottom is the corrected trace with its initial factor; a zero point family gives zero; two solutions of the same constraints need not coincide. |
| Kummer class, `HE.8/anticyclotomic-heegner-class` | `heegnerIwasawaClass_level`, scalar/isogeny functoriality, corestriction comparison and the zero-family law. | Projection agrees with the actual Kummer map; a $p$-isogeny retains its nonunit lattice index; a nonzero family need not be nonzero at every character. |
| Characteristic ideal, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal` | Height-one divisor; multiplicativity for exact torsion sequences; pseudo-isomorphism invariance; API-6's μ content; precisely scoped coefficient extension. | The zero module has unit ideal; $B/(p,t)$ has unit characteristic ideal but proper Fitting ideal; $B/(p)$ has characteristic ideal $(p)$, and rationalization erases that divisor. |
| BDP distribution, `GZ.9/bdp-square-root-comparison` and `GZ.9/imprimitive-function-dictionary` | Primitive ideal comparison; character/twist transport; unit and Euler-factor bookkeeping. | A simple zero of the root becomes a double zero of its square; rescaling by a proved unit preserves the ideal; multiplying by $p$ changes the integral ideal. |
| Selmer local conditions, `SelmerIwasawaCohomology:L2/change-of-conditions`, `L3/kernel-control` | Restriction maps, localization images, exact sequences and explicit invariant/cokernel errors. | Strict and unrestricted conditions at $v$ give different kernels; invariants do not preserve a surjection without its $H^1$ error; a finite control kernel can be ignored for divisors but cannot be discarded from every Fitting calculation. |
| Divisibility profile, `HE.8/heegner-divisibility-profile` | $M_r$, the bottom value, the infinite infimum and rescaling with coefficient depth. | The zero system has value $\infty$; indices $2,5$ in one stratum give $2$; a bottom index $3$ with a later index $1$ has $M_\infty\le1$, not $3$. |

The Tate lattice is part of the arithmetic data. BCGS distinguishes the
$X_0(N)$-optimal curve $E_0$ and the modular-symbol curve $E_\bullet$
(§1.2.2, PDF pp.11–12). Transport through an isogeny uses its actual lattice
map and differential. Agreement of the bottom class up to a **unit** suffices
for the ideal; agreement up to a $p$-power does not. This consumes the existing
HE.8 optimal-lattice and stabilization comparisons.

## Endpoints and their exact branches

Under (disc), (Heeg), (spl), good ordinary reduction and $p>3$, BCS proves:

| Residual hypothesis | Heegner formulation | Greenberg formulation |
| --- | --- | --- |
| (irr) | $\operatorname{rank}_B S_E=\operatorname{rank}_B X_E^{\mathrm{ord}}=1$, $H_E=I_E^2$ in $B[1/p]$. | $X_E^-$ is torsion, $\operatorname{char}_B(X_E^-)B_R=(B_E)$ in $B_R[1/p]$. |
| (sur) | The same rank statements and $H_E=I_E^2$ in $B$. | The same torsion statement and equality in $B_R$. |

These are BCS v2 Theorems 1.2.2(a)/(b) and 1.2.4(a)/(b), PDF p.3
(publisher-form pp.3–4). A rational equality alone leaves the $(p)$ divisor
undetermined. No assertion of integral equality under mere irreducibility is
made.

The independent Eisenstein branch has $p>2$, $p\nmid N$, a rational
$p$-isogeny with actual kernel character $\varphi$, and
$\varphi|_{G_p}\ne1,\omega$, together with (disc), (Heeg), (spl). Import
`RankZeroOneBSD:BSD.7a/cgs-anticyclotomic-main-conjecture`: CGS v2 Theorem C
(p.3), Theorem 6.5.3 and Corollary 6.5.4 (p.29) give the integral Greenberg
and Heegner equalities. The earlier CGLS Theorem 4.2.2 also assumes (Sel), a
corank-one condition; it cannot replace this supplier. CGS removes (Sel),
retaining the residual local-character exclusions. The $p=3$ range comes
only through this exact Eisenstein theorem, not through an extension of BCS.

BCGS Theorem A (v2 pp.2–3) consumes the rational Greenberg equality and the
early HE.8 nonvanishing machinery to obtain a nonzero finite Heegner Kolyvagin
system. Theorem 1.2.13(i)/(ii)/(iii) (pp.14–15) supplies, respectively, the
Eisenstein integral, irreducible rational and surjective integral branches.
Theorem B (p.3, proof pp.19–20) additionally requires $p>3$, (sur), an
integral main conjecture, and a $p$-optimal parametrization. Its conclusion is

\[
 M_\infty=\sum_{\ell\mid N}v_p(c_\ell(E/\mathbb Q)).
\]

The $p$-optimal condition concerns the minimal $p$-valuation of the degree
across parametrizations in the isogeny class; it is not removed by knowing a
rational ideal equality.

The imported Castella–Sano application retains $p>3$, (sur), good ordinary
reduction, $p\nmid D_K$, and a $p$-unit Manin constant for the fixed
parametrization. Theorem C (arXiv v1 p.4) identifies the refined finite index
formula with its determinant main conjecture. Proposition 3.2.3 (p.14) compares
that determinant with

\[
 \operatorname{char}_B(S_E/B y_\infty)\,
 \operatorname{char}_B(S_E/B y_\infty)^\iota
 =\operatorname{char}_B((X_E^{\mathrm{ord}})_{\mathrm{tors}}).
\]

The existing HE.8 determinant/functional-equation comparison is required to
pass between this expression and the square convention. In the split case the
integral BCS endpoint discharges the main conjecture. This chain proves no
inert-$p$ main conjecture.

## The proof and the two new key inputs

The order is early HE.8 family and geometric nonvanishing → Euler-system bound;
independently, L5w and L5a → two-variable reverse product bound → anticyclotomic
product bound → individual equality. No completed cyclotomic equality occurs
among the inputs.

**1. Formulation and Euler-system bounds.** BCK Theorem 5.2, published
pp.1646–1647, supplies the integral comparison in both directions for the
classical split setting with $p>3$ and $H^0(G_K,E[p])=0$. Its Theorem 5.1's
non-anomalous and stronger ramification assumptions are not assumptions of
Theorem 5.2. The proof compares the localization cokernel at each height-one
prime: its doubled length occurs on the Greenberg side, and its single length
occurs in the order of the square-root logarithm. Thus the same defect cancels
when comparing the two divisibilities. All lattice and reciprocity factors
remain part of that comparison.

BCS Theorem 4.2.1 (v2 p.8) then supplies

\[
 H_E\supseteq I_E^2,\qquad
 \operatorname{char}_B(X_E^-)B_R\supseteq(B_E)
\]

after inverting $p$, and integrally under (sur). This is the anticyclotomic
Euler-system theorem, **not** the two-variable comparison. Its weak-residual
input is CGS v2 Theorem 6.5.2 (p.28), called Theorem 5.5.2 in the earlier
revision BCS cites. The imported ES.8 contract must certify the augmentation
prime and the integral surjective branch; Howard's narrower theorem cannot be
applied with its class-number and image hypotheses silently removed.

**2. Choose $F$ while preserving the theorem's $K$.** The six conditions
of BCS Proposition 5.2.1 (v2 pp.9–10) are: $p$ inert in $F$; $D_F$ odd
with all its prime divisors split in $K$; each $\ell\mid N$ inert in $F$
exactly when $\ell\equiv-1\pmod p$; residual irreducibility over $FK$ and
over $F(\zeta_p)$; and exclusion of $F=\mathbb Q(\zeta_5)^+$ when $p=5$.
These supply the precise Fujiwara conditions, not merely a real quadratic
field with convenient splitting at $p$.

Lemma 5.2.3 (v2 p.10) states existence of a pair $(K,F)$. For the fixed
$K$ in the anticyclotomic theorem the local-choice step can be made explicit.
Choose primes $q\equiv1\pmod{8|D_K|}$, with prescribed nonzero square or
nonsquare classes modulo the odd primes dividing $Np$: require
$(q/p)=-1$ and $(q/\ell)=-1$ precisely at those $\ell\mid N$ with
$\ell\equiv-1\pmod p$. The moduli are coprime. Dirichlet/Chebotarev gives
infinitely many such $q$. Then $F=\mathbb Q(\sqrt q)$ has $D_F=q$, and
the local conditions hold. If $2\mid N$, the choice modulo $8$ makes $2$
split, as required for $p>3$. Avoid the finitely many quadratic subfields of
the compositum of $K$ and the residual splitting field; restriction to
$G_{FK}$ preserves the $G_K$ residual image. Exclude the exceptional field
at $p=5$; the residual-restriction argument at the end of Lemma 5.2.3 gives
the $F(\zeta_p)$ condition. This expands the existing auxiliary-field node's
proof without changing $K$.

The twist $E^F$ is good ordinary at $p$. Twisting tensors the residual
representation by the quadratic character, preserving irreducibility on
$G_K$. Any new conductor primes divide $D_F$ and split in $K$, so the
Heegner condition persists. The integral use also needs residual surjectivity
for the twist. A quadratic character is trivial on commutators, so the
twisted image still contains the commutator subgroup
$\mathrm{SL}_2(\mathbb F_p)$ of the original full image for $p>3$.
Its determinant remains cyclotomic and surjective; the twisted image is
therefore $\mathrm{GL}_2(\mathbb F_p)$. This checks both curves' residual
hypotheses before using their integral bounds.

**3. Use the congruence engine and separate rational from integral input.**
Import the fine L5w nodes `quartic-cm-divisibility` and
`selected-base-change-hypotheses`. They retain Fujiwara's (H1)–(H3), minimal
lifting, ramification, narrow-class-field and period conditions; here the
selected quartic CM field has $\mathfrak n^-=1$. The arithmetic specialization
node retains its height-one majorant and control errors, rather than taking an
unjustified image of a divisorial ideal.

L5a supplies BCS Theorem 4.1.3 and Corollary 4.1.4 (v2 p.8): the ordinary and
Greenberg two-variable product containments are equivalent, both before and
after inverting $p$. It also supplies Lemma 5.1.1 (p.9), the Selmer restriction
inclusion from the quartic CM field, and Lemma 5.1.2 (p.9), the PR-function
factorization **after inverting $p$**. The latter is not an integral
period comparison.

**4. `primitive_greenberg_mu_vanishing`**, new node
`HE.8b/primitive-greenberg-mu-vanishing`, realizes BCS Proposition 4.2.2
(v2 p.9) at these coefficients. The toric theorem of APL L3h gives
$\mu(B_E)=0$. The integral analytic comparison gives
$(\pi^-G_E)=(B_E)$; in CGS v2 this is Lemma 2.4.4 and Proposition 2.4.5,
pp.9–10 (older numbering 1.4.4/1.4.5). Reduction modulo $p$ then shows
$\mu(G_E)=0$: its projection is nonzero modulo $p$, hence so is the
original function. This does not require a unit constant coefficient.

The integrality in Lemma 2.4.4 has an independent proof input: Rubin's
theorem and Hida–Tilouine Theorem 0.3 control the CM congruence denominator,
and BDP22 Theorem A(i) excludes its augmentation factor. L5a must import
these inputs before exporting the integral analytic projection. They cannot
be inferred from the main-conjecture equality being proved here.

For an integral ideal $J\subseteq A_R$, the rational containment
$(G_EG_{E^F})\supseteq J$ already controls all height-one primes away from
$(p)$. At $(p)$ the analytic generator has order zero and the integral
ideal has nonnegative order. This proves the integral containment, as in
BCS Proposition 5.2.1. It does **not** show that $\mu(J)=0$. The toric
μ theorem here and the Katz μ theorem in the Eisenstein branch have different
objects and hypotheses.

**5. `anticyclotomic_specialization_control`**, new node
`HE.8b/anticyclotomic-specialization-control`, supplies the precise remaining
arrow in the proof on BCS v2 p.11. With torsionness of $X_E^-$ supplied by
the independent Euler-system bound, the intended arithmetic comparison is

\[
 \operatorname{char}_B(X_E^-)B_R
 \subseteq \pi^-(\operatorname{char}_A(X_E^{(2)}))B_R.
\]

JSW v1 Lemma 3.4.1 and Corollary 3.4.2 (pp.20–21) prove the imprimitive
version for $\Sigma$ containing all away-$p$ ramification. The map from
two-variable coinvariants onto the anticyclotomic dual has finite kernel;
it need not be an isomorphism. The Fitting argument uses a power of the
maximal ideal and then principal reflexive closure. Fitting and characteristic
ideals are not simply identified. Torsionness of the specialized module,
with finite control errors, gives torsionness of the two-variable module by
localization and Nakayama; there is no assumption that a nonzero analytic
generator alone proves this.

Application to the **primitive** groups requires matching local exact
sequences and Euler factors on both towers, with their $\pi^-$ compatibility.
The inspected generic SIC nodes do not yet supply this arithmetic comparison.
The source's §3.1 also has standing corank/local-surjectivity assumptions for
its finite-level work; the supplier must check their use in the §3.4 proof,
rather than adding analytic rank one to the BCS endpoint. These precise
checks, and completed-unramified coefficient extension, form gap G1.

With them supplied, the two-variable reverse bound projects to

\[
 (B_E B_{E^F})\supseteq
 \operatorname{char}_B(X_E^-)\operatorname{char}_B(X_{E^F}^-)B_R.
\]

**6. Separate the two factors.** Set $J_E=\operatorname{char}_B(X_E^-)B_R$.
At each height-one prime, the independent Euler-system inclusions give
$\nu(J_E)\le\nu(B_E)$ and the corresponding inequality for $E^F$.
The product reverse inclusion gives the reverse inequality for their sum.
Both differences therefore vanish. The nonzero BDP functions, supplied by
μ-vanishing, make these finite orders and cancellations legitimate.

Under irreducibility the individual upper bounds are rational, so this
argument gives equality away from $(p)$. Under surjectivity they are integral,
and it gives equality at $(p)$ as well. This is precisely why an integral
reverse **product** bound does not upgrade the irreducible branch to an
integral **individual** equality. Apply the integral/rational formulation
comparison to finish the Heegner endpoint.

## Target map and ownership

Every suffix in this table has prefix `HeegnerPointEulerSystems:HE.8b/`.
The thirteen imported IDs belong to HE.7s; the two new IDs belong to this part.
No imported statement is replaced by a duplicate node.

| Node suffix | Role and source locator |
| --- | --- |
| `bdp-function-convention-comparison` | Align $(B_E)$ with $(\mathcal L_E^2)$, retaining the GZ.9 normalization gap; BCGS 1.2.1/1.2.10 pp.10,14 and BCS 1.2.4 p.3. |
| `anticyclotomic-formulation-comparison` | Both directions of the Heegner/Greenberg containment comparison; BCK 5.2 pp.1646–1647; the odd-$p$ rational extension is CGLS 4.2.1 pp.28–29. |
| `auxiliary-quadratic-field-verification` | Verify the six conditions for fixed $K$, with the proof expansion above; BCS 5.2.1/5.2.3 pp.9–10. |
| `anticyclotomic-euler-system-divisibility` | Rank one and the rational bound, integral under (sur); BCS 4.2.1 p.8. |
| `anticyclotomic-reverse-product-divisibility` | L5w/L5a input, primitive μ step, specialization and factor separation; BCS §5 pp.9–11. Assembly adds the two new fine-node dependencies. |
| `rational-heegner-main-conjecture` | BCS 1.2.2(a) p.3, including the rank statements. |
| `integral-heegner-main-conjecture` | BCS 1.2.2(b) p.3. |
| `rational-greenberg-bdp-main-conjecture` | BCS 1.2.4(a) p.3. |
| `integral-greenberg-bdp-main-conjecture` | BCS 1.2.4(b) p.3. |
| `eisenstein-main-conjecture-adapter` | Import the exact BSD.7a early CGS theorem; CGS C p.3 and 6.5.3/6.5.4 p.29; BCGS 1.2.13(i) p.14. |
| `split-kolyvagin-nonvanishing-branches` | Discharge the conditional HE.8 theorem with each matching branch; BCGS A pp.2–3 and 1.2.13 pp.14–15. |
| `split-refined-kolyvagin-divisibility` | Integral surjective branch, $p$-optimal parametrization and the Tamagawa sum; BCGS B p.3 and proof pp.19–20. |
| `split-determinantal-heegner-main-conjecture` | Integral BCS equality through the existing determinant/functional-equation comparison; CS C p.4 and 3.2.3 p.14. |
| **`primitive-greenberg-mu-vanishing`** | Primitive analytic μ and the integral reverse-product $p$-divisor step; BCS 4.2.2 p.9 and 5.2.1 p.10. |
| **`anticyclotomic-specialization-control`** | Exact arithmetic application of JSW 3.4.1/3.4.2 pp.20–21 to the BCS projection p.11; primitive adaptation is gap G1. |

The four audited targets are therefore covered: the Heegner rational/integral
endpoint by the two Heegner nodes; Greenberg/BDP normalization and equality by
the convention and Greenberg nodes; comparison/reciprocity/reverse proof by
the inherited input nodes with the two new refinements; and the BCGS branch
exports by the nonvanishing/refined nodes. Generic Selmer theory, regulators,
toric distributions and characteristic ideals remain with their existing
owners.

## RT-AREA-iwasawa-1/5 and the independent Eisenstein route

The finding has two ownership obligations, with distinct uses. CGLS
Theorem 1.2.2 (PDF p.8) identifies its character Selmer module with a Galois
module governed by Rubin's imaginary-quadratic main conjecture and uses
Hida's Katz μ-vanishing. Theorem 2.2.3 (p.15) compares the elliptic Selmer and
BDP μ/λ invariants using those character inputs. CGS §6.5 removes (Sel)
through a uniform Kolyvagin bound; it does not remove the character-theoretic
inputs. A construction of the Katz function alone is insufficient.

Adopt the existing HE.7s/BSD.7 proposal for **Elliptic units and the Iwasawa
main conjectures for imaginary quadratic fields**. Its scope is integral
elliptic-unit distributions and norm relations, their Euler system, the
unit/class-group modules and Rubin's 1991/1994 two-variable theorem,
Hida–Tilouine's Invent. Math.117 (1994) Theorem 0.3 anticyclotomic theorem,
and Hida's Annals 172 (2010) Katz μ theorem. It imports Katz from APL L3,
Euler-system/Iwasawa machinery from ES.3/ES.8, and CM.1–CM.4 reciprocity.
It must state the exact character, conductor, exceptional-character and
coefficient hypotheses, including finite correction factors. Its exports go
to BSD.7a's existing `cgls-residual-character-comparison` and
`cgls-equal-iwasawa-invariants`, then to the independent CGS theorem and this
adapter. Those proof-level exports remain missing; this proposal creates no
reserved IDs or second plan for them.

The same unit owner must supply the Rubin/Hida–Tilouine CM congruence-ideal
divisibility to L5a's integral Greenberg-function construction, CGS Lemma
2.4.4 (pp.9–10), with the augmentation-factor exclusion from the CM Hida
family supplied by its existing congruence owner. This is a second use of
the independent input, preceding the primitive Greenberg μ theorem even
in the irreducible branch. It is distinct from both Hsieh's toric μ theorem
and Hida's Katz μ theorem.

The separate Wüthrich obligation already has a BSD.7a
`distinguished-lattice-integral-input` adapter and a Kato L4 request. It needs
the distinguished $E_\bullet$, its modular-symbol/Tate lattice comparison,
integral Kato class and integral ordinary divisibility, with the exact
isogeny/period transport: Wüthrich Theorems 4,13,16, Proposition 8, Lemma 17
and Corollary 18, using IntegralIwasawaTheory L4 Ferrero–Washington. Route
that addition to **Kato L4**, not a new Heegner node. CGS uses this divisibility
in the cyclotomic return (§§5 and 7), whereas its early Theorem C proof is in
§6.5. It is not made a new premise of the anticyclotomic adapter. This keeps
both portions of the finding visible without introducing a false dependency
or a cycle through completed CGS Theorem A.

The unit owner also supplies HE.7s's Rubin/Iwasawa CM alternative. The reviewed
direct Nekovář HE.7 CM-descent route is not given an artificial elliptic-unit
prerequisite. None of the Rubin/Hida–Tilouine/Hida/Wüthrich proof contracts is
declared verified here from second-hand citation; acquisition and exact proof
decomposition belong to those owners.

## Requests, gaps and acceptance

The packet has eight requests. Existing exact node contracts are imported;
the table identifies the additional certifications needed.

| Request | Supplier | Required export |
| --- | --- | --- |
| R1 | AutomorphicCongruences L5a | Exact two-variable comparison, restriction, rational factorization, integral Greenberg construction and analytic projection, including the independent Rubin/Hida–Tilouine congruence input to CGS 2.4.4; the BCS locator is 4.1.3/4.1.4. |
| R2 | AutomorphicPadicLFunctions L3h | The precise primitive toric μ theorem in BCS 4.2.2's branch and normalization. |
| R3 | SelmerIwasawaCohomology L3 | JSW arithmetic restriction, finite errors, Fitting argument, primitive Euler-factor transport and hypothesis-range verification. |
| R4 | PadicMeasuresIwasawaAlgebras L4 | Completed-unramified coefficient extension and the exact specialization/reflexive-closure calculus. |
| R5 | GZ.9 `bdp-square-root-comparison` | Discharge its existing explicit integral comparison-unit gap. |
| R6 | EulerSystemsAndKolyvaginSystems ES.8 | Weak-residual augmentation-inclusive bound and the exact surjective integral branch. |
| R7 | RankZeroOneBSD BSD.7a | Complete the independent early CGS character-invariant inputs through the proposed elliptic-unit owner. |
| R8 | KatoEulerSystems L4 | Fulfil the existing Wüthrich/Ferrero–Washington integral request for the downstream cyclotomic Eisenstein branch. |

G1 is the exact primitive specialization and completed-coefficient gap.
G2 collects the still uncertified period, toric μ, L5a/L5w and integral
Euler-system proof inputs. G3 is the independent elliptic-unit input to
both analytic integrality through L5a and the Eisenstein character invariants.
These are supplier contracts with named consumers, not assertions of
unconditional closure. The packet records the two fine dependency additions
to the inherited reverse-product node and replacement of the Eisenstein
adapter's coarse BSD.7a prerequisite by its exact early node; assembly must
apply those changes while retaining the original IDs. This job edits no
predecessor or supplier.

Acceptance requires all of the following:

1. Preserve the four coefficient-sensitive BCS endpoints, the $p>3$
   restriction, and every distinct BCGS/CS residual and parametrization
   hypothesis. Reject an integral result inferred from rational equality.
2. Check both curves of the auxiliary pair, all six field conditions and
   fixed-$K$ quantification. Check periods and coefficient rings before
   clearing denominators.
3. Verify the direction of specialization, all primitive/imprimitive local
   terms and the finite-error/Fitting argument. No universal rule that
   characteristic ideals commute with quotient is used.
4. Keep early HE.8 → independent BSD.7a → HE.8b, and HE.8b → cyclotomic L5b.
   Never feed the completed return theorem into its own anticyclotomic input.
5. Retain six combined planets: the predecessor's rational/integral Heegner,
   rational/integral Greenberg and Eisenstein planets, plus primitive
   Greenberg μ-vanishing. Specialization is a key comparison, not a seventh
   planet.

The [suggested file](../suggested/HeegnerPointEulerSystems--HE.8b.lean) follows
the 2026-10-12 WORKERS shape. All fifteen arithmetic statements require
carriers absent at the pins and remain in this README. Eight concrete examples
use native power series, ideals and natural-number orders to check: zero
augmentation versus nonzero reduction, square versus root, reduction modulo
$5$, the loss of the $5$-divisor over $\mathbb Q$, containment direction,
and factor separation. They are algebra checks, not substitute arithmetic
theorems. The file has no admitted data definitions or arbitrary
characteristic-ideal/Selmer stand-ins.

BCS's minor cross-reference and coefficient-ring misprints in the relevant
proof displays are recorded separately as source issues
`HeegnerPointEulerSystems/E11` and `HeegnerPointEulerSystems/E12`.
They were checked in arXiv v2 and the publisher-form author-hosted PDF;
the intended comparison is Theorem 4.1.3 and both factors **before**
$\pi^-$ are over $A$. No change to a theorem is proposed.

## Sources read

All sources were accessed on 14 October 2026; hashes and reading boundaries
are in the packet. Locators in this document are to the specified versions.

- Burungale–Castella–Skinner, [arXiv:2405.00270v2](https://arxiv.org/pdf/2405.00270v2),
  main text pp.1–11; collated the relevant §§4–5 with the
  [IMRN publisher-form copy](https://web.math.ucsb.edu/~castella/BCS-print.pdf), pp.9–13.
- Burungale–Castella–Grossi–Skinner,
  [arXiv:2312.09301v2](https://arxiv.org/pdf/2312.09301v2), Theorems A/B,
  §1.2 and their applications in §2.
- Burungale–Castella–Kim, [ANT 15 (2021)](https://web.math.ucsb.edu/~castella/PRconj-print.pdf),
  Theorem 5.2, pp.1646–1647.
- Castella–Grossi–Skinner, [arXiv:2303.04373v2](https://arxiv.org/pdf/2303.04373v2),
  Theorem C, §2.4 and §6.5. Its 2.4.5 and 6.5.2 correspond to the earlier
  1.4.5 and 5.5.2 cited by BCS.
- Castella–Grossi–Lee–Skinner,
  [author copy](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorems
  1.2.2 and 2.2.2–2.2.3, Proposition 4.2.1 and Theorem 4.2.2.
- Jetchev–Skinner–Wan, [arXiv:1512.06894v1](https://arxiv.org/pdf/1512.06894v1),
  §§3.1 and 3.4, especially pp.20–21.
- Castella–Sano, [arXiv:2601.14504v1](https://arxiv.org/pdf/2601.14504v1),
  Theorem C, §3.2 and §3.4.
