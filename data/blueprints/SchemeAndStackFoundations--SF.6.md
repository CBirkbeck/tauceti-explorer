# Arithmetic cohomology handoffs

SF.6 records the interfaces by which a mathematical consumer combines scheme
cohomology, comparison maps, cycle classes and traces. The interfaces must
retain their source and target, their coefficients, and the hypotheses making
the specified map an isomorphism. An identification of dimensions provides
none of the naturality or normalization required by a realization or period
calculation.

This layer owns no mathematical declarations. Sites and scheme cohomology
belong to SF.2; Chow groups and intersection operations belong to SF.5;
analytic, crystalline, prismatic and period comparisons belong to their
comparison owners. The nine contracts below describe the boundary at which
those outputs are consumed. Their supplier identifiers specify ownership;
they are not prerequisites of the foundation-tier package. Each unavailable
statement or conversion has a named request or gap in the packet. There are
consequently no SF.6 definition APIs, definition unit tests or planets. The
acceptance conditions are mathematical checks for the supplying and consuming
interfaces.

## Conventions and native foundation

Use cohomological degree conventions. Derived tensor, derived inverse limit,
and completion are written explicitly; ordinary tensor or inverse limit is
used only after its comparison with the derived operation has been justified.
A Tate twist is part of the coefficient object. A map involving a twisted
coefficient line names the line and the conversion used by comparison.

For a scheme over a field $k$, distinguish its geometric base change
$X_{\bar k}$, its base change $X_\sigma$ along an embedding
$\sigma:k\hookrightarrow\mathbb C$, and its analytification. For a formal
scheme, distinguish its adic generic fibre, its residue-field special fibre,
and its reduction modulo $p$. These objects are not interchangeable.

The pinned Mathlib is
`082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti is
`f790474821cf4256814db967cb154e7af3d0c369`. The baseline supplies the following
interfaces, whose statements were read at the pin:

| Native declaration | Interface available to a consumer |
| --- | --- |
| `CategoryTheory.Sheaf.H` | Cohomology of an abelian sheaf on a specified site, defined by Ext from the constant integral sheaf; the sheafification and Ext instances are required. |
| `CategoryTheory.Sheaf.H.map` | An additive map induced by a sheaf morphism on the same site. |
| `CategoryTheory.Sheaf.H.equiv₀` | Degree-zero cohomology identified with evaluation at a specified terminal object. |
| `AlgebraicGeometry.Scheme.ProEt.topology` | The native small pro-étale topology on weakly étale schemes over a scheme. |
| `AlgebraicGeometry.Scheme.etaleTopology_le_proetaleTopology` | Inclusion of the big scheme topologies. |
| `AlgebraicGeometry.Scheme.ellAdicSheaf` | The small pro-étale coefficient sheaf obtained from continuous maps into the topological group $\mathbb Z_\ell$. |
| `AlgebraicGeometry.Scheme.EllAdicCohomology` | Cohomology of the universe-lifted native coefficient sheaf, with its additive group. |
| `AlgebraicGeometry.Scheme.isZero_ellAdicSheaf_of_isEmpty` | Vanishing of the coefficient sheaf on an empty scheme; the same module supplies subsingleton cohomology in every degree. |

These declarations form contract **S1**. A topology inclusion does not prove a
cohomology comparison. A same-site coefficient map does not construct an
analytification map. The native $\ell$-adic declarations require a prime
natural number $\ell$ and use natural-number cohomological degrees. The
definition of $\ell$-adic cohomology imposes no
invertibility condition on $\ell$; purity and the comparisons below impose
their own restrictions. The native coefficient sheaf uses the topology of
$\mathbb Z_\ell$, so it must not be replaced by the discrete constant sheaf
without a comparison theorem.

Reuse `SchemeAndStackFoundations:SF.2/cohomological-brauer` for
$\operatorname{Br}'(X)=H^2_{\mathrm{et}}(X,\mathbb G_m)_{\mathrm{tors}}$.
An Azumaya Brauer group has a separate carrier and requires its own theorem
before being identified with this group. Reuse the inherited
`SF.2/linearized-sheaf`, `SF.2/invariant-sections` and
`SF.2/spectral-sequence` for equivariant cohomology. Coherent duality supplies
a different coefficient theory and does not provide étale or Betti trace
maps.

## S2. Proper complex de Rham–Betti comparison

For a smooth proper scheme $X/\mathbb C$ and $q\geq0$, the required map is

\[
c_{DB,X}:\mathbb H^q(X,\Omega^\bullet_{X/\mathbb C})
\longrightarrow H^q_{\mathrm{sing}}(X^{\mathrm{an}},\mathbb C).
\]

Construct it from the algebraic-to-holomorphic differential-complex map,
analytic Poincaré comparison with the constant complex sheaf, and the
sheaf-to-singular comparison. Proper GAGA identifies the algebraic and
analytic hypercohomology. Grothendieck, Theorem 1′ and the proper argument,
printed p.96, give this route; the argument for a nonproper smooth variety
uses additional material and is not obtained by deleting properness.

The exact existing statement is
`ComplexComparisonPartII:C5/repair-proper-de-rham-betti`, supported by
`C3/repair-relative-proper-gaga` and
`C5/repair-sheaf-singular-comparison`. Its current export is additive. The
consumer also needs, in the admitted class of morphisms $f:Y\to X$,

\[
c_{DB,Y}f^*=f_{\mathrm{an}}^*c_{DB,X},\qquad
c_{DB,X}(u\smile v)=c_{DB,X}(u)\smile c_{DB,X}(v).
\]

The product comparison needs a compatible cochain product; an additive
equivalence supplies no such datum. Request **R3** names this strengthening,
the actual differential and hypercohomology carriers, and the trace
normalization. Proper smooth family comparison and Gauss–Manin compatibility
keep their relative hypotheses. Logarithmic comparison for nonproper curves
keeps its compactification, residue and regular-singular conditions.

For $X/k$ and each specified embedding $\sigma:k\hookrightarrow\mathbb C$,
apply the theorem to $X_\sigma$. The identification of its de Rham groups
with $H^q_{dR}(X/k)\otimes_{k,\sigma}\mathbb C$ is a named scalar-base-change
map. The realization consumer must include that map in its naturality square.
Retain integral and rational Betti groups before complexification; a complex
vector-space equivalence does not choose the integral lattice or its periods.

A trace diagram also needs a Tate-period convention. With the usual
integration convention, the expected image of an untwisted algebraic divisor
class has the $2\pi i$ factor relative to the untwisted integral Betti class.
Thus a consumer must specify its twist conversion before equating first
Chern classes or traces. This normalization is part of R3, not a theorem
asserted by the additive repair node. Acceptance uses the degree-zero unit on
$\operatorname{Spec}\mathbb C$ and the actual point/hyperplane and trace
generators on $\mathbb P^1$. A dimension computation in degrees zero and two
does not pass this check.

## S3. Finite étale–Betti comparison and local systems

Let $f:X\to S$ be a finite-type morphism of schemes locally of finite type
over $\mathbb C$, and let $F$ be an abelian torsion sheaf on $X_{\mathrm{et}}$.
Write $\epsilon_X,\epsilon_S$ for the analytic-to-étale topos maps. If $f$
is proper or $F$ is constructible, SGA 4, Exposé XVI, Theorem 4.1,
marginal printed pp.232–234, gives the comparison

\[
\epsilon_S^*R^qf_{\mathrm{et},*}F
\longrightarrow R^qf_{\mathrm{an},*}\epsilon_X^*F
\]

as an isomorphism for every $q$. The absolute finite locally constant case
uses the constructible alternative. Comparing sheaf and singular cohomology
with local coefficients is an additional identified bridge. It must retain
the monodromy of the transported local system.

The construction is required to be natural in the coefficient sheaf and to
commute with exact coefficient sequences and connecting homomorphisms. In
particular, the comparison of a Kummer class is a connecting-map square, with
$\mu_n$ transported to the specified finite Tate coefficient line. It is
not a replacement of both groups by an abstract group of the same order.
The geometric point checks the degree-zero coefficient group and vanishing
of higher degrees; a nonconstant finite local system checks that monodromy
has not been discarded.

There is no verified all-degree Artin supplier node in the packets inspected
for this pass. The Landesman–Litt extraction routes a finite-cover comparison
to IG.0/IG.1. Their current descriptions concern Galois categories and
fundamental groups and do not supply the displayed higher-cohomology map.
Request **R4** coordinates a distinct proposed complex-comparison stage C7
for this theorem and its real and $\ell$-adic consequences. C7 is a
restructuring proposal, not an existing stage or usable prerequisite.

## S4. Kummer comparison over the complex and real fields

For smooth $X/\mathbb C$ and $n>0$, the finite Kummer sequence and S3
yield the consumer interface

\[
0\longrightarrow\operatorname{Pic}(X)/n
\longrightarrow H^2(X(\mathbb C),\mathbb Z/n(1))
\longrightarrow\operatorname{Br}'(X)[n]\longrightarrow0.
\]

Benoist writes the untwisted complex version in Equation (1.1), p.69. If the
finite Tate line is written as $\mathbb Z/n$, the identification used must
be retained. This sequence uses the cohomological Brauer group. Identifying
it with an Azumaya group is a separate theorem.

For smooth integral $X/\mathbb R$, put
$G=\operatorname{Gal}(\mathbb C/\mathbb R)$. The corresponding interface is

\[
0\longrightarrow\operatorname{Pic}(X)/n
\longrightarrow H^2_G(X(\mathbb C),\mathbb Z/n(1))
\longrightarrow\operatorname{Br}'(X)[n]\longrightarrow0.
\]

Here $\mathbb Z(1)$ is a rank-one sign module: conjugation acts by $-1$.
The real equivariant coefficient convention fixes that action; it does not
choose the de Rham period normalization in S2. Benoist, Equation (2.16),
p.76, uses this sequence. Benoist–Wittenberg, §1.1.1, pp.9–10, specifies
the torsion equivariant comparison and cites Scheiderer, Corollary 15.3.1.
That cited proof has not been independently read in this pass. Gap **G3**
keeps this boundary visible.

Equivariant Betti cohomology concerns the action on $X(\mathbb C)$, not
ordinary cohomology of $X(\mathbb R)$. For example,
$H^2_G(\operatorname{Spec}\mathbb C,\mathbb F_2)=\mathbb F_2$, matching
$\operatorname{Br}'(\mathbb R)[2]$; ordinary degree-two cohomology of the
complex point vanishes. This checks the descent datum. General real closed
fields require the semi-algebraic topology specified by Benoist–Wittenberg;
ordinary complex-manifold topology is used here only over the real numbers.

For proper geometrically connected $X/\mathbb R$, the units are
$\mathbb R^\times$, and degree-one Kummer gives

\[
0\longrightarrow\mathbb R^\times/\mathbb R^{\times2}
\longrightarrow H^1_G(X(\mathbb C),\mathbb F_2)
\longrightarrow\operatorname{Pic}(X)[2]\longrightarrow0.
\]

Benoist uses this in the proof of Theorem 0.6, p.106. On
$\mathbb P^1_{\mathbb R}$, the Picard 2-torsion is zero. On
$\mathbb G_{m,\mathbb R}$, the coordinate supplies an additional unit
class, so properness cannot be removed from the stated units identification.
Requests R1/R4 name the native Kummer and equivariant comparison maps and
their compatibility in $n$. The intersection/cycle-product compatibility
in S9 is an output for MC.2; it is not an input to this Kummer prefix.

## S5. Adic and scheme–diamond comparison

For the proper adic contract, name the scheme base $S$, the adic space
$R\to S$ as a map of locally ringed spaces, the scheme–adic fibre products,
and their étale topos maps. For $f:X\to Y$ proper, $X,Y$ locally of
finite type over $S$, a torsion ring $\Lambda$, and
$K\in D^+(X_{\mathrm{et}},\Lambda)$, the H5 supplier states

\[
\phi_Y^*Rf_*K\longrightarrow Rf^{\mathrm{ad}}_*\phi_X^*K.
\]

This is `ClassicalAdicEtaleCohomology:H5/proper-comparison-3-7-2`.
Its domain assumes the named fibre products exist. The supplier's torsion
statement does not impose invertibility relative to residue characteristic.
It comes from reviewed provenance for Huber 1996, Theorem 3.7.2,
pp.226–227. That book is not cleared for this worker and was not read.
The public diamond comparison proofs explicitly invoke it; they do not
provide an independent proof of the full H5 statement. Gap **G5** records
this source boundary.

For a characteristic-$p$ scheme, the comparison owner supplies
$c_X^*:D_{\mathrm{et}}(X,\Lambda)\to D_{\mathrm{et}}(X^\diamond,\Lambda)$.
Adic $\Lambda$ is complete for an ideal generated by a regular sequence
and containing an integer prime to $p$. The scheme category uses derived
complete objects with the prescribed classical reduction; unbounded
discrete coefficients require the stated left-completion convention.
Scholze, §27, Proposition 27.2, pp.163–164, gives full faithfulness in
characteristic $p$. For a separated finite-type map $f:Y\to X$ of qcqs schemes, or
the admitted perfections, Proposition 27.4, p.165, compares

\[
c_X^*Rf_!\simeq Rf^\diamond_!c_Y^*,\qquad
f^!Rc_{X,*}\simeq Rc_{Y,*}(f^\diamond)^!.
\]

The second isomorphism is the right-adjoint mate of the first. Its
units/counits and variance must be checked in those categories. Proposition
27.1 gives pullback and completed tensor compatibility. The exact supplier
nodes are L3/full-faithfulness-27-2 and L3/rf-shriek-comparison-27-4 in
`AdicCoefficientsAndComparisons`.

For mixed characteristic use the untilt-based scheme diamond over a complete
DVR $O$ with perfect residue field. Proposition 27.5, p.166, supplies
the support comparison for separated maps between schemes finite type over
$O$; its node is L4/proper-support-comparison-27-5. This does not assert
full faithfulness for arbitrary mixed-characteristic complexes. The two
scheme-diamond constructions differ even in how the special fibre is
presented. Proper maps permit $Rf_!=Rf_*$; separated finite type alone
does not. These restrictions, and the completed operations of §26,
Definition 26.1 and Remark 26.3, pp.161–163, are acceptance conditions.

## S6. Integral limits, rational coefficients and arithmetic actions

A finite-coefficient comparison does not yet identify the native
$\ell$-adic groups. For a compatible tower $K_n$ of finite-coefficient
cohomology complexes, retain the exact sequence

\[
0\longrightarrow\varprojlim{}^1 H^{q-1}(K_n)
\longrightarrow H^q(R\varprojlim K_n)
\longrightarrow\varprojlim H^q(K_n)\longrightarrow0.
\]

A Mittag–Leffler hypothesis kills the first term; finite finite-level groups
give that hypothesis. Derived completeness and the reduction maps must
identify the actual pro-étale coefficient object with the derived limit of
its reductions. Only after that identification and the vanishing argument
may a consumer replace cohomology of a derived limit by a limit of groups.
Request **R1** owns this foundation conversion. The native definition does
not make it a definitional equality.

Bhatt–Scholze, Definition 3.4.1 and Proposition 3.4.2, author PDF p.21,
distinguish derived completeness from classical completeness and separatedness.
Corollary 5.1.6 and Remark 5.1.8, pp.35–36, distinguish bounded-below
étale-to-pro-étale comparison from the unbounded case. Definition 6.8.1 and
Lemma 6.8.2, pp.58–59, specify the topological integral/rational coefficient
sheaves. None of these inputs justifies erasing a derived-limit term without
its hypotheses.

For smooth proper $X/k$ and a specified embedding
$\bar k\hookrightarrow\mathbb C$, the rational realization interface has
the form

\[
H^q(X(\mathbb C),\mathbb Q)\otimes_{\mathbb Q}\mathbb Q_\ell
\simeq H^q_{\mathrm{et}}(X_{\bar k},\mathbb Q_\ell).
\]

Its route requires compatible finite comparison, an integral coefficient
system, the needed finite-generation/finite-complex inputs, derived limits,
and rational scalar extension. For local systems supply the corresponding
finite-free integral lattice and its reductions. Transport the continuous
$G_k$ action across this specified map; an arbitrary Betti vector space
does not come with that action. Rationalization removes integral torsion and
therefore does not certify equality of integral lattices.

Ichino–Prasanna, §2.1.2, arXiv v2 pp.12–13, uses number-field coefficient
realizations and the maps obtained from this comparison. In §2.2.2,
Equation (2.1), pp.13–14, it uses representation-valued local systems at a
sufficiently small level on smooth compact Shimura varieties. The
representation factors through the specified $G/Z_s$, and the comparison
uses the given reflex-field embedding. The Shimura/local-system owner
supplies those objects. Finite étale correspondence pullback and transfer
must commute with comparison to obtain the stated Hecke equivariance;
transition maps must commute before passage over levels. A constant-sheaf
comparison cannot replace this coefficient construction. R1/R4 retain these
requirements. The published extraction locators pp.14 and 16 use a different
pagination from the 118-page arXiv version read here.

## S7. Crystalline, prismatic and integral specialization

For a bounded prism $(A,I)$ and a smooth $p$-adic formal scheme over
$A/I$, Bhatt–Scholze Theorem 1.8, pp.4–5, specifies derived comparison
maps for $R\Gamma_\Delta$. Crystalline specialization at $I=(p)$ and de
Rham specialization use completed derived base change along $\varphi_A$.
For a perfect prism, finite étale comparison uses
$R\Gamma_\Delta/p^n[1/I]$ and derived Frobenius fixed points,
the fibre of $\varphi-1$. Base change uses the
derived $(p,J)$-completion for a bounded-prism map $(A,I)\to(B,J)$.
The global comparison requires $X$ quasi-compact and quasi-separated;
the sheaf comparison has its separate local statement. A consumer must
retain these scalar maps and completed topologies on every arrow.

In the BMS setting, let $C/\mathbb Q_p$ be complete algebraically closed,
let $\mathfrak X/O_C$ be proper smooth, and put
$A_{\inf}=W(O_C^\flat)$ and
$K_A=R\Gamma_{A_{\inf}}(\mathfrak X)$. Theorem 14.3, pp.119–120,
provides the derived specializations

\[
\begin{aligned}
K_A\otimes^L_{A_{\inf},\theta}O_C
 &\simeq R\Gamma_{dR,\mathrm{cont}}(\mathfrak X/O_C),\\
K_A\otimes^L_{A_{\inf}}W(k)
 &\simeq R\Gamma_{\mathrm{crys}}(X_k/W(k)),\\
K_A\otimes^L_{A_{\inf}}A_{\mathrm{crys}}
 &\simeq R\Gamma_{\mathrm{crys}}(X_{O_C/p}/A_{\mathrm{crys}}).
\end{aligned}
\]

After the specified $\mu$-inversion, it compares with the generic-fibre
étale $\mathbb Z_p$ complex extended to the same ring. $X_k$ and
$X_{O_C/p}$ are distinct fibres. The continuous formal de Rham complex is
identified with an algebraic model only through the formal/algebraic/analytic
dictionary of CP.0.

The general-prism suppliers are
`PrismaticCohomology:PR.1/relative-prismatic-cohomology`,
`PR.1/crystalline-comparison`, `PR.1/hodge-tate-comparison`,
`PR.1/prismatic-base-change` and `PR.1/de-rham-comparison`. That packet
has a needs-changes review. Its de Rham node requires $W(A/I)$
p-torsion-free; the general case belongs to PR.3 through Corollary 15.4.
Request **R6** names this missing export and its source-proof boundary.
Request **R7** names the PR.4 finite-étale comparison and its derived
Frobenius fixed-point construction. No all-degree finite-étale node was
verified here. The global qcqs restriction applies the supplier
source correction `PrismaticCohomology/E13`, without duplicating it.

The exact CP.1 suppliers are theta-de-rham-specialization,
witt-crystalline-specialization, acris-specialization,
mu-inverted-etale-specialization and singular-and-completed-boundary.
CP.0/ainf-specialization-dictionary supplies $\theta$, the residue map,
$\mu$ and the Frobenius conventions. Degreewise ordinary tensor is a
separate conclusion requiring the appropriate Tor or torsion-freeness
conditions; derived comparison alone does not prove it.

Bhatt–Scholze, Notation 17.1 and Theorem 17.2, p.117, identifies
$\varphi^*R\Gamma_\Delta$ with the $A_{\inf}$ complex, with Frobenius
and multiplicative structure. CP.1/prismatic-frobenius-pullback-comparison
retains this pullback. The uniqueness criterion of Notation 18.1 and Theorem
18.2, pp.122–123, concerns symmetric-monoidal functors with their specified
Hodge–Tate structure map; it is not uniqueness of an arbitrary equivalence
between cohomology groups. Acceptance rejects a missing Frobenius pullback,
an unnamed replacement of $\theta$, or ordinary tensor with a surviving
next-degree Tor contribution.

## S8. Rational periods and trace lines

For a finite extension $K/\mathbb Q_p$, a smooth proper $X/K$, and its
geometric base change to the completed algebraic closure, use the specified
filtered, $G_K$-equivariant map

\[
c_{dR}:H^q_{\mathrm{et}}(X_C,\mathbb Q_p)\otimes B_{dR}
\longrightarrow H^q_{dR}(X/K)\otimes B_{dR}.
\]

The filtration on the target combines Hodge and period filtrations. The
action is semilinear on the period factor. The source-qualified CP.3
filtered-de-rham-comparison and CP.6/naturality-base-change-and-cup-products
provide this boundary. Betts–Stix Proposition 3.19, p.27, supplies its
graded-algebra, finite-extension and Künneth compatibility.

For geometrically connected $X$ of pure dimension $d$, the trace square
uses the period-line isomorphism
$a:B_{dR}(-1)\simeq B_{dR}\langle-1\rangle$ normalized on
$\mathbb P^1$. Here
$\mathrm{Fil}^i(V\langle n\rangle)=\mathrm{Fil}^{i+n}V$.
Betts–Stix Proposition 3.20, pp.27–28, compares traces with
$a^{\otimes d}$, and compares cycle and first-Chern classes with the same
twist conversion. In the untwisted presentation a codimension-$r$ class
uses $a^{-r}$. CP.6/trace-normalized-tate-period,
duality-and-cycle-class-compatibility and first-chern-class-comparison are
the exact node identifiers.

Remark 3.21 does not identify $a$ with the canonical Fontaine period.
Acceptance therefore fixes $a$ through the trace on $\mathbb P^1$ and
uses that same map for $c_1(\mathcal O(1))$. A different unproved period
identification cannot be substituted. General proper Gysin compatibility is
an additional CP.6 extension; the source's cycle and trace clauses do not
alone supply it. The rational period theorem supplies no integral lattice
recovery statement. Gap G7 retains these typing and stronger-compatibility
boundaries.

## S9. Cycle, Gysin and intersection diagrams

Use smooth pure-dimensional schemes over a perfect field and
$\Lambda=\mathbb Z/n$ with $n$ invertible, and use the geometric base
for ordinary perfect Poincaré pairings. Over a nonclosed field, retain the
relative derived duality map and its Galois action. The required class map is

\[
\operatorname{cl}^r_X:\operatorname{CH}^r(X)
\longrightarrow H^{2r}_{\mathrm{et}}(X,\Lambda(r)).
\]

SF.5 supplies the actual rational-equivalence quotient and properly scoped
intersection operations. EDC.3/cycle-class-map supplies the cohomological
construction and quotient compatibility. A class on prime cycles has not
yet factored through the Chow group. The existing EDC packet retains a
rational-equivalence gap for singular families and a Tor/intersection-to-cup
gap. Milne §23, pp.138–142, gives the construction and Theorem 23.4, but
does not provide the long proof required to identify its two cycle maps.
Requests **R2/R5** identify the needed foundation and cohomological outputs.

For a proper map $f:Y\to X$ between smooth pure-dimensional varieties,
put $e=\dim Y-\dim X$. The Gysin target is

\[
f_*:H^q(Y,\Lambda(m))\longrightarrow
H^{q-2e}(X,\Lambda(m-e)).
\]

Thus a smooth codimension-$c$ immersion has $e=-c$, shift $+2c$, and
twist $+c$. This applies the already recorded source correction
`EtaleDualityAndPerverseSheaves/E4` for Milne's display and Remark 24.2(b),
p.145. The correction is not a new SF.6 declaration or a duplicate source
issue. EDC.3/gysin-map and self-intersection-formula keep their purity,
specialization and projection-formula inputs explicit.

For smooth projective geometrically connected $X/k$, dimension $d$, and
complementary Chow classes $z,w$, the consumer diagram requires, after
geometric base change,

\[
\operatorname{tr}_X\bigl(\operatorname{cl}(z)\smile
\operatorname{cl}(w)\bigr)=\deg(z\cdot w)\quad\text{in }\Lambda.
\]

It also requires $\operatorname{cl}(z\cdot w)=\operatorname{cl}(z)\smile
\operatorname{cl}(w)$, proper pushforward, admitted pullback, projection
and trace-transitivity squares. A cross-theory diagram uses the period/twist
conversion of S2 or S8. For a nonproper smooth variety, duality pairs compact
support with ordinary cohomology. Two ordinary cohomology groups do not
give the same pairing. The $\ell$-adic passage keeps the derived-limit and
perfection hypotheses of the EDC.2 adic duality supplier.

Acceptance on $\mathbb P^1$ gives trace 1 for a geometric point and trace
$m\bmod n$ for $c_1(\mathcal O(m))$. For a finite flat map of constant degree
$\delta$ between the admitted smooth varieties, it checks $f_*f^*=\delta$. For surfaces, a graph/diagonal
intersection is computed through the SF.5 product and the displayed trace
diagram. The self-intersection comparison requires its actual deformation
and specialization theorem: smoothness of a nonproper family does not
identify its cohomology fibres.

## Ownership, source routes and acceptance boundary

The five audited targets are accounted for as follows:

| Target | Contracts |
| --- | --- |
| Crystalline and prismatic comparisons | S7, S8 |
| Complex and rigid analytic comparisons | S2, S3, S4, S5 |
| $\ell$-adic comparisons | S1, S3, S6 |
| Cycle-class comparisons | S2, S4, S8, S9 |
| Trace and intersection compatibility | S2, S8, S9 |

The direct SF.6 source route is Benoist continuation route 11, items /33,
/55 and /199. Its new assignment still requires independent route review.
The Ichino–Prasanna extraction /004 and its Shimura-consumer brief use the
Betti/local-system and rational comparison boundary. The supporting
Benoist–Wittenberg and Landesman–Litt routes identify topology and cover
inputs rather than a second comparison theory. The inherited foundation
packet contains no actual SF.6 source-worklist brief or mathematical node;
its other-stage work is preserved.

The process-layer removal proposal retains SF.2 and SF.5 as foundational
mathematics and routes comparison owners directly to their consumers. In
particular, it replaces SF.5→SF.6→MC.2 by the actual SF.5→MC.2 input and
adds C5→MC.2. The legacy C5→SF.6 edge is recorded conditionally if SF.6 is
retained and the tier conflict is resolved. The confirmed red-team finding
RT-AREA-algebraicgeometry/31 is thereby accounted for without adding an
upward mathematical prerequisite to the foundation package. MC.2 then
supplies the comparison to PeriodsAndSpecialValues PS.0 and PS.8. Both SF.6
and MC.2 should be labelled consumers in the C5 duplicate audit; C5 remains
the owner. These are proposals requiring maintainer application; the accepted
RS-25 structure remains in force.

The assembled accepted-overlay graph has exactly the two displayed incident
SF.6 edges. Paper-route assignments are additional consumer leads and must
be reconciled when the structural proposal is applied.

The proposed C7 has a separate boundary from C5: finite étale–Betti,
equivariant real comparison and their compatible $\ell$-adic passage.
IG.0/IG.1 retain Galois categories and cover equivalences. Existing CP
specialization/period nodes and adic comparison nodes are cited with their
actual statements; their accepted plans do not constitute implementations.
The C5 packet is partial and awaiting review; the EDC part containing EDC.3
has a needs-changes review. Neither is silently treated as an accepted
strengthened theorem.

This is a completed **source-decomposed process pass**, with no stage closure
claim. G1–G7 record the structural decision, additive complex frontier,
Artin/real ownership and source boundary, native $\ell$-adic limit
conversion, restricted Huber proof provenance, Chow/cycle-product gaps, and
prismatic exports and derived-period typing/compatibility boundaries. R1–R7 identify their exact
foundation or comparison owners. The Lean file checks eight existing native
types and contains no arithmetic-comparison theorem signatures: those types
are not yet available from their owners. Acceptance of the process manifest
requires every instantiated comparison and diagram to point to its true
supplier and every unresolved clause to remain visible. Mathematical proof
and implementation acceptance occur at those owners and consumers.

## Sources

All descriptions above are authored paraphrases. The packet records public
URLs, hashes, editions and the passages read on 9 October 2026. Reading was
restricted to the interface passages named here; no full-paper reading is
claimed.

- Grothendieck, [*On the de Rham cohomology of algebraic varieties*](https://www.numdam.org/article/PMIHES_1966__29__95_0.pdf), Theorem 1′ and proper argument, p.96.
- Artin, [SGA 4, Exposé XVI](https://www.normalesup.org/~forgogozo/SGA4/16/16.pdf), Theorem 4.1, marginal printed pp.232–234, PDF pp.13–14; public retypeset version 71766d9, 30 July 2024.
- Bhatt–Morrow–Scholze, [*Integral p-adic Hodge theory*](https://arxiv.org/pdf/1602.03148v3), Theorem 14.3, Remark 14.4 and Theorem 14.5, pp.119–121.
- Bhatt–Scholze, [*Prisms and prismatic cohomology*](https://arxiv.org/pdf/1905.08229v4), Theorem 1.8, pp.4–5; Theorem 17.2, p.117; Notation 18.1 and Theorem 18.2, pp.122–123.
- Bhatt–Scholze, [*The pro-étale topology for schemes*](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), author PDF: §3.4 p.21; §§5.1–5.2 pp.34–38; §§6.5 and 6.8 pp.49–50 and 58–59.
- Scholze, [*Étale cohomology of diamonds*](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf), 14 April 2026 version, §§26–27, pp.161–167.
- Betts–Stix, [*Galois sections and p-adic period mappings*](https://www.math.uni-frankfurt.de/~stix/research/preprints/BETTS_STIX-GaloisSectionsPadicPeriods20220429.pdf), 29 April 2022 version, Propositions 3.19–3.20 and Remark 3.21, pp.27–28.
- Milne, [*Lectures on Étale Cohomology*](https://jmilne.org/math/CourseNotes/LEC.pdf), version 2.21, §§23–24, pp.138–145; EDC's existing sign correction is applied.
- Benoist, [*The period-index problem for real surfaces*](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf), published version, (1.1) p.69, (2.16) p.76, proof of Theorem 0.6 p.106.
- Benoist–Wittenberg, [*On the integral Hodge conjecture for real varieties, I*](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), published author version, §1.1.1 pp.9–10.
- Ichino–Prasanna, [*Hodge classes and the Jacquet–Langlands correspondence*](https://arxiv.org/pdf/1806.10563v2), arXiv v2, §2.1.2 pp.12–13 and §2.2.2, Equation (2.1), pp.13–14.
