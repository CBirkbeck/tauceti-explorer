# Habiro cohomology foundations, Part II

This roadmap uses refined trace theory to supply and compare inputs to
algebraic Habiro cohomology. Its outputs are the Habiro descent of a chosen
trace pair, a spherical-lift criterion for the existing naive filtration,
the agreement of canonical and framed trace filtrations, and usable
cyclotomic and Taylor maps on the number-field trace realization.

HabiroCohomologyFoundations constructs the algebraic objects without these
trace comparisons. RefinedTraceMethods constructs the trace objects and
proves its comparisons independently. This sequel consumes both. In
particular, the trace-free pair and descent formalism comes before
RefinedTraceMethods, and the applications here come after it.

The intended consumers are HabiroNahmSeries and the applications in
HabiroNumberFields. Their series, regulator lines and arithmetic modules
remain with those roadmaps. The arithmetic result here concerns a ring in
degree zero; it supplies no comparison of those additional modules.

## Conventions and imported objects

Write (h=q-1). All tensor products, quotients, limits and completions of
enhanced objects are derived unless an ordinary static preimage is explicitly
specified. A decreasing filtration is constant in degrees at most zero.
In the Rees presentation the coefficient ring is
\(\mathbb Z[\beta][[t]]\), with \(|\beta|=1\), \(|t|=-1\) and
\(\beta t=h\). The filtered quotient by \(h\) means

\[
 (F/\beta)^i=\operatorname{cofib}(h:F^{i-1}\longrightarrow F^i).
\]

The degreewise cofiber of \(h:F^i\to F^i\) is a different quotient.
The first of these is the quotient used by the Hodge comparison.

A **chosen pair** \((R,F)\) is the object of
HabiroCohomologyFoundations:HQ.3 with all four identifications:

- \(F^0\simeq qdR_{R/A}\).
- \(F/\beta\simeq\mathrm{fil}_{\rm Hdg}dR_{R/A}\).
- \((F\otimes\mathbb Q)^\wedge_h\) is the combined Hodge and
  \(h\)-adic filtration on \((dR_{R/A}\otimes\mathbb Q)[[h]]\).
- For every \(p\), \((F^\wedge_p[1/p])^\wedge_h\) is the combined
  filtration on \(((dR_{R/A})^\wedge_p[1/p])[[h]]\).

The last comparison is a separate requirement. These equivalences agree in
nonpositive filtration degrees with the specified unfiltered maps. Their
comparison squares and the compatibility between those squares are data.
Underlying filtered objects alone do not specify chosen pairs. These
conventions are QH Convention 3.1 and Definition 3.2, pp.20–21, with the
correct target of the filtered quotient retained from Part I.

Write \(H(R,F)\) for Part I's Habiro–Hodge object. Its
\(h\)-completion is the q-Hodge complex

\[
 qHdg(R,F)=\left(\operatorname*{colim}_{i\geq0}
       (F^i\xrightarrow{h}F^{i+1})\right)^\wedge_h.
\]

The factorial limit defining \(H\), the cyclotomic partial descents, the
completed tensor product and the monoidal descent theorem are all imported.
They are QH Theorem 3.11, p.25, as planned in Part I HQ.3. This roadmap
introduces no second Habiro completion or category of pairs.

### Dependency interfaces

The following names refer to the exact supplier nodes in the packet, rather
than to an assertion that the suppliers have been implemented.

| Interface | Supplier |
| --- | --- |
| Filtered quotients and derived coefficient operations | Part I HQ.2, especially `the-quotient-convention-for-filtered-modules` |
| Chosen pairs, q-Hodge complex, Habiro descent, q-Witt graded reduction and multiplicative transport | Part I HQ.3, especially `q-hodge-filtrations`, `the-q-hodge-complex`, `the-habiro-hodge-complex`, `habiro-descent`, `habiro-descent-the-q-de-rham-witt-filtration`, `multiplicative-upgrades` |
| Naive preimage, injectivity, completed flat base change and canonical smooth/framed maps | Part I HQ.5 |
| Structured spherical inputs and trace pair | RefinedTraceMethods:RT.4:q-Hodge, nodes `spherical-lift`, `compatible-spherical-lifts`, `q-hodge-global`, `q-hodge-multiplicativity` |
| Identity-cover comparison and the prime two | RefinedTraceMethods:RT.4:q-Hodge, nodes `quasi-regular-quotients`, `p-complete-comparison-odd`, `p-complete-comparison-two` |
| Full framed comparison of KU 6.10 | RefinedTraceMethods:RT.4:q-Hodge; supplier contract **HT-RT-framed** |
| Genuine-fixed-point arithmetic ring comparison | RefinedTraceMethods:RT.4:Habiro-comparison, nodes `etale-einfty-lift`, `number-field-habiro`; RT.6 `habiro-trace-interface` |
| Existing coefficient reductions and twisted Taylor equalizer | HabiroRings:HR.5, HR.5-number-field-comparison and HR.6 |
| Independent Frobenius-divisibility Nygaard | PrismaticCohomology:PR.3; supplier contract **HT-PR-independent** |
| Independent trace filtration and subsequent prismatic comparison | RefinedTraceMethods:RT.6, nodes `motivic-filtrations`, `trace-prismatic-comparison` |

Generic derived de Rham, décalage, crystalline and perfectoid theories enter
through their owners and the imported Part I/RT interfaces. In particular,
AI.1's generic \(L\eta\), HQ.4's q-Witt Nygaard and the trace-free Part I
comparison squares require no result of this sequel. No direct prerequisite
on the entire Part I comparison atlas is introduced.

## Layer 1: Trace pairs and perfected spherical lifts (HT.1)

### The structured trace input

The general input is the relative theorem, not just a spherical polynomial
example. Let \(A\) be a perfectly covered \(\Lambda\)-ring. For every
prime \(p\), choose the spherical base data of KU 3.1, p.24: a connective
p-complete \(E_\infty\)-lift of \(\widehat A_p\), whose Tate-valued
Frobenius induces the given \(\delta\)-Frobenius on \(\pi_0\), together
with its \(S^1\)-equivariant \(E_\infty\)-structure. The source has trivial
circle action on the base and residual \(S^1/C_p\)-action on the Tate target.
Agreement of an unstructured map on \(\pi_0\) is insufficient.

Let \(R/A\) be quasi-lci, so the cotangent complex has homological
Tor-amplitude \([0,1]\), and assume bounded \(p^\infty\)-torsion for each
prime. At every \(p\), choose one of the two inputs of KU 3.2, p.24:

- **Spherical \(E_2\) input.** A connective p-complete \(E_2\)-algebra over
  the chosen spherical base, with its specified reduction to \(\widehat R_p\).
- **Spherical \(E_1\) resolution.** The ring \(\widehat R_p\) is
  p-torsion-free. It has a p-quasisyntomic cover by a ring whose reduction
  modulo \(p\) is relatively semiperfect over the base. The augmented
  p-completed Čech nerve has a lift to an augmented cosimplicial diagram of
  connective p-complete \(E_1\)-algebras over the spherical base, including
  its maps and coherence.

The choice can vary with \(p\). Also impose KU 4.18a(R2), p.49: the
2-adic completion has the \(E_1\)-resolution input. This is automatic if
2 is a unit, since then that completion is zero. Retain the compatible
arithmetic gluing data of RT's `compatible-spherical-lifts` node.

For the \(E_1\) branch, the ad hoc even filtration is the limit over the
Čech diagram of the double-speed connective truncations
\(\tau_{\geq2i}\mathrm{THH}\), followed by the residual circle's homotopy
fixed points. This is a construction on a coherent diagram. An isolated
\(E_1\)-algebra lift does not replace it. The local comparison includes
\(p=2\); KU Theorem 4.14, Remark 4.15 and the Nikolaus argument on
pp.43–45 supply this case. For the identity cover, KU Theorem 4.17,
pp.45–46, identifies the filtration with the static naive preimage,
independently of the lift, and gives its filtered \(E_\infty\) structure.
For a general cover the limit carries the induced multiplicative structure.
These are RT-owned results.

With these hypotheses, import the full pair \((R,F_{\rm tr})\) of KU
Theorem 4.27, p.50, including all four comparison clauses and coherences.
Only its filtration completion has the trace description

\[
 \widehat F_{\rm tr}^{\,i}\simeq
 \Sigma^{-2i}\operatorname{gr}^{i}_{\rm even,hS^1}
           \mathrm{TC}^-(ku_R/ku_A).
\]

Over \(\mathbb Z\), the familiar sufficient input is a quasisyntomic ring
with 2 invertible and a connective spherical \(E_2\)-lift reducing to it
(KU Theorem 1.2, p.3). The relative theorem retains its additional base,
resolution and coherence data.

### 1.1 Habiro descent of a chosen trace pair

**Construction `TauCeti.QHodge.Trace.traceHabiro`.** Define

\[
 \mathrm{traceHabiro}(R,L)=H(R,F_{\rm tr}(L)),
\]

where \(L\) denotes the supplied compatible structured lift datum. Its
morphisms are those supplied by the RT lifted diagrams, including compatible
reductions and rational maps. It is not a functor on arbitrary ring maps
without these data. Apply the existing descent functor to the trace pair;
construct neither the trace pair nor the descent again.

For each \(m\geq1\), its derived reduction modulo \(q^m-1\) has the
exhaustive ascending filtration with

\[
 \operatorname{gr}_i\bigl(\mathrm{traceHabiro}(R,L)/(q^m-1)\bigr)
       \simeq \Sigma^{-i}qW_m dR^i_{R/A}.
\]

This is an associated-graded assertion. At \(m=1\) it is the conjugate
filtration. It does not identify the whole reduction with an unfiltered
q-Witt complex. Sources: KU Theorem 4.27 and Remark 4.28, p.50, composed
with QH Theorem 3.11(a),(b), p.25.

**API.**

- `traceHabiro` returns the Habiro-complete object over \(A[q]\).
- `traceHabiro_map` acts on compatible lifted morphisms and satisfies identity
  and composition laws by composition of the two imported functors.
- `traceHabiro_hCompletion` identifies its h-completion with
  \(qHdg(R,F_{\rm tr})\).
- `traceHabiro_partialCompletion` identifies its \((q^m-1)\)-completion
  with the existing partial descent \(T_m\), compatibly with factorial
  transitions.
- `traceHabiro_qWittGraded` provides the ascending reduction filtration and
  its displayed graded equivalence.
- `traceHabiro_multiplicative` transports exactly the structure supplied by
  KU Remark 4.28. For \(n\geq2\), compatible local \(E_n\) structures,
  with the permitted \(E_1\) branches, give \(E_{n-1}\) structure. A bare
  \(E_2\) lift gives no additional automatic commutativity.
- `traceHabiro_pairEquiv` sends a specified equivalence of chosen pairs to an
  equivalence of descended objects, preserving the completion and reduction
  maps. This does not assert independence of arbitrary lift choices.

**Checks.**

1. `traceHabiro_etale`. For finite étale \(R/A\) with its compatible étale spherical lift, the
   output is the existing relative Habiro ring \(H_{R/A}\); its
   h-completion is \(R[[h]]\). This tests agreement with the nearest
   algebraic construction rather than with a new coefficient-ring definition.
2. `traceHabiro_unitFiltration`. For the unit pair \(F^i=h^{\max(i,0)}A[[h]]\), the filtered quotient is
   \(A\) in degrees at most zero and zero in positive degrees. The
   degreewise quotient incorrectly leaves a nonzero \(A\) in degree one.
3. `traceHabiro_polynomial`. For \(R=\mathbb Z[1/2][x]\) with its polynomial lift, the q-Hodge
   differential sends \(x^r\) to \((q^r-1)x^{r-1}dx\). The q-de Rham
   differential instead has coefficient \([r]_q\); returning q-de Rham
   as the h-completion fails this test.
4. `traceHabiro_kuLiftInsufficient`. The perfected free-\(\delta\)-ring exponent-one quotient of KU 1.11,
   p.5, admits an \(E_1\) ku-lift but fails the naive deformation test.
   The constructor cannot accept that ku-lift as a spherical resolution.
5. `traceHabiro_mOne`. At \(m=1\), the ascending conjugate filtration with graded shifted
   derived forms remains distinct from the descending Hodge filtration
   \(F_{\rm tr}/\beta\).

The algebraic failure in Check 4 is already Part I HQ.5's
`the-exponent-one-quotient-is-not-a-q-deformation`. Supplier contract
**HT-RT-boundary** asks RT for the accompanying ku-lift and structured
quotient range. KU 1.11, p.5, supplies no known \(E_2\)-ku counterexample.
Its proposed image-of-J replacement requires an \(S^1\)-equivariant diagram
that is not constructed there; it is not a theorem used here.

### 1.2 A spherical lift after perfection makes the naive filtration a deformation

**Theorem `perfectedLiftNaive`.** Let \(p\) be any prime and \(A\) a
p-complete p-completely perfectly covered \(\delta\)-ring. Let \(R\) be
a p-complete p-torsion-free p-quasi-lci \(A\)-algebra, with \(R/p\)
relatively semiperfect over \(A\). For the perfected base \(A_\infty\), put

\[
 R_\infty=(R\otimes_A A_\infty)^\wedge_p.
\]

If \(R_\infty\) admits a connective p-complete spherical \(E_1\)-lift,
then the existing ordinary-preimage naive filtration satisfies

\[
 F_{\rm naive}/\beta\simeq\mathrm{fil}_{\rm Hdg}dR_{R/A}.
\]

The lift proves a property of this filtration; choosing it is not part of the
filtration's definition. The statement includes \(p=2\). Source: QH
Theorem 4.22(b), p.62, with proof on pp.65–66.

**Proof route.** Part I's mod-\(\beta\) injectivity leaves surjectivity.
Its completed flat-base-change lemma allows p-completely faithfully flat
base change \(A\to A_\infty\). Over the perfect base, the relative
cotangent complex reduces the calculation to \(\mathbb Z_p\), as in QH's
proof. RT's identity-cover comparison, KU Theorem 4.17, pp.45–46, then
identifies the existing preimage with the trace filtration; KU 4.14 supplies
the prime-two comparison. Descend surjectivity using the same completed flat
base change. The tensor product in this argument is completed at \((p,h)\).

The direct Part I imports are `the-naive-filtration-for-quasi-regular-inputs`,
`the-naive-filtration-is-injective-modulo-q-minus-one`,
`flat-base-change-for-the-naive-filtration`,
`the-quasi-lci-inputs-and-condition-R`, and HQ.2's
`derived-base-change-and-its-completion-hypotheses`.

**Checks.**

- A higher-power perfect-regular presentation with exponents at least two
  gives the cited spherical lift for odd \(p\). At \(p=2\), that quotient
  spectra argument needs even exponents at least four (QH Remark 4.23, p.63).
  Part I's independent algebraic Theorem 4.22(a) still covers every exponent
  at least two at 2; this theorem does not replace that argument.
- For \(A=\mathbb Z_p[x]^\wedge_p\), \(\delta(x)=0\), and
  \(R=A/(x-1)\), spherical polynomial evaluation at \(x=1\) gives the
  lift after perfected base change. This input need not have the higher-power
  presentation. The q-PD expressions
  \(\prod_{0\leq i<n}(x-q^i)/[n]_q!\) reduce to
  \((x-1)^n/n!\), providing the ordinary Hodge divided powers
  (QH Example 4.25, p.64).
- The perfected free-\(\delta\)-ring exponent-one quotient still fails the
  deformation condition. Its \(E_1\) ku-lift cannot discharge this theorem's
  spherical hypothesis.
- Prime-by-prime applications feed Part I's canonical quasi-regular section
  through its full arithmetic pullback. The rational combined-filtration
  corner is retained; local factors alone do not specify the global pair.

### Independent prismatic and trace constructions

Import PrismaticCohomology:PR.3's Nygaard construction by Frobenius
divisibility on QRSP covers and quasisyntomic descent. In the relative smooth
bounded-prism setting, BS Theorem 15.3, pp.103–104, uses
\(\Delta^{(1)}=\varphi_A^*\Delta\), its divided Frobenius, Hodge–Tate
truncation description and \(L\eta_I\) factorization. Supplier contract
**HT-PR-independent** asks for precise nodes exposing this existing stage
scope. None of these objects is defined using trace theory.

Separately, RT.6 constructs the trace filtration by quasisyntomic descent of
double-speed Postnikov truncations from QRSP covers. Evenness is a local
property on those covers, not an assertion about all global THH. BMS2
Theorem 1.12, pp.6–7, retains the Breuil–Kisin twists: the trace
\(\mathrm{TC}^-\) graded terms use
\(N^{\geq n}\widehat\Delta\{n\}[2n]\), and the periodic terms use
\(\widehat\Delta\{n\}[2n]\). No arbitrary trivialization of these twists
is added.

RT.6's `trace-prismatic-comparison` subsequently identifies its trace complex
with **Nygaard-completed** prismatic cohomology, compatibly with filtration,
Frobenius and multiplication. It need not identify \(\Delta\) with its
completion. BS Theorem 15.7, p.105, gives a relative Breuil–Kisin instance;
its relative hypotheses are retained when that instance is used.

**Acceptance.** Check both construction directions in the dependency graph:
PR.3, AI.1 and HQ.4's Nygaard/décalage squares do not require RT; the trace
existence theorem uses Part I HQ.3, PR.0–PR.3, AI.1, DD.2 and the earlier
trace constructions, without Part II or Part I's completed comparison atlas.
Compare the independently built objects only after these inputs exist.
Syntomic comparisons are RT.6 targets. This imported comparison proves no
new equality of the canonical \(\theta\) and Witt specialization maps;
those are the separate trace-free Part I §§9.18–9.19 targets.

## Layer 2: Canonical and arithmetic exports (HT.2)

### 2.1 Agreement of the canonical and framed trace filtrations

**Theorem `canonicalFramedTrace`.** Let \(A\) be a perfectly covered
\(\Lambda\)-ring with the chosen spherical cyclotomic base data of KU
3.1/4.18, and let
\(\square:A[x_1,\ldots,x_d]\to S\) be an étale framing as in KU
Example 6.7, p.82. Assume every prime at most \(d\) is a unit in \(S\).
Use the canonical étale spherical lift \(\mathbb S_{S,\square}\), with
KU Theorem 6.10's coherent resolution data. On this common input domain the
completed trace and canonical filtrations agree through the coordinate
complex, whose \(i\)-th filtered piece in cohomological degree \(j\) is

\[
 h^{\max(i-j,0)}\Omega^j_{S/A}[[h]].
\]

The differential here is the coordinate q-de Rham differential. Pulling back
the specific coordinate equivalence along \(qdR\to q\Omega\) gives an
equivalence of chosen pairs, and hence of their Habiro descents.

**Proof route and dependencies.** Supplier contract **HT-RT-framed** imports
KU Theorem 6.10, p.83, with its framed Čech proof in 6.11–6.13, pp.84–86,
and multiplicative refinement in Remark 6.14, p.86. RT's existing
`raksit-polynomial-example` node states the case \(\mathbb Z[x]\); a
source citation mentioning framed generality is not a replacement for its
precise full statement. The contract retains the applicable 2-adic resolution
verification rather than deleting the addendum from the global theorem.

Part I's `framed-and-fixed-point-descriptions-of-the-canonical-filtration`
provides the particular canonical-to-coordinate map: the truncation counit,
with the fixed identification of the defining pullback, reduces to the
identity on the Hodge filtration. Completeness proves that map is an
equivalence. It would not make an arbitrary map an equivalence. Pull back
these specified maps to \(qdR\), carrying all four pair comparisons and
coherences through the defining pullbacks. Apply `traceHabiro_pairEquiv`.
This uses neither a proposed uniqueness statement for arbitrary filtrations
nor an unproved uncompleted framed Habiro Koszul model. The Part I source
is QH Remark 4.4, p.55, and Lemma 4.7, p.56, with Example 3.12,
pp.25–26, and Remark 3.6, p.22.

**Checks.**

1. For \(\mathbb Z[1/2][x]\), use the explicit flat spherical polynomial
   lift \(\mathbb S[1/2][x]\). The trace, coordinate and canonical
   filtrations compare through the displayed subcomplex.
2. For \(d=0\), the framing is étale, the filtration is
   \(h^{\max(i,0)}S[[h]]\), and Habiro descent is the existing
   relative Habiro ring.
3. In the polynomial q-Hodge complex \(M\) over \(\mathbb Z\), the
   differential is \(x^r\mapsto(q^r-1)x^{r-1}dx\). Thus
   \(H^0(M/^Lh)=\mathbb Z[x]\), while \(H^0(M)/h=\mathbb Z\).
   The missing polynomial classes lie in the \(h\)-torsion correction
   \(H^1(M)[h]\). Replacing derived reduction by reduction of cohomology
   fails the comparison.
4. The canonical smooth domain contains \(\mathbb Z[x]\) but its tensor
   square is \(\mathbb Z[x,y]\), which requires 2 inverted. The theorem
   does not claim closure of the canonical domain under that tensor product.
5. The Laurent example over \(\mathbb Q\) distinguishes uncompleted
   \(qdR\) from \(q\Omega\). A completed trace comparison must not
   identify them before the defining completion.

The polynomial, étale, tensor-domain and Laurent calculations are existing
Part I Checks. Their algebraic constructions remain there; this layer uses
them to test the trace comparison. The statement uses the full common framed
domain, not just the \(\mathbb Z[1/2][x]\) Check, and imposes no blanket
inversion of 2 beyond its stated domain and the imported trace hypotheses.

### 2.2 Number-field trace specializations

Let \(F\) be any number field, let \(\Delta>0\) be divisible by 6 and
\(\operatorname{disc}(F)\), and put \(R=\mathcal O_F[1/\Delta]\).
This is finite étale over \(\mathbb Z[1/\Delta]\) and has its unique
étale spherical lift \(\mathbb S_R\). Write

\[
 P_R=\pi_0\left(\operatorname*{lim}_{m,\mid}
   \left(\mathrm{THH}(KU\otimes\mathbb S_R/KU)^{\mathrm{genuine}\ C_m}
        \right)^{h(S^1/C_m)}\right).
\]

The order is genuine finite-group fixed points, residual-circle homotopy
fixed points, spectral limit indexed by divisibility, then \(\pi_0\).
Import RT's ring equivalence \(\varepsilon_R:H_R\simeq P_R\),
KU Corollary 6.15, p.86. This uses periodic \(KU\), with RT's genuine
cyclonic reconstruction. It is not obtained by replacing \(ku\) with
\(KU\) in a connective formula. Neither homotopy fixed points for \(C_m\)
nor \(\lim_m\pi_0\) is substituted for the expression above.

**Construction `TauCeti.QHodge.Trace.numberFieldTraceExports`.** Compose
\(\varepsilon_R^{-1}\) with HabiroRings' existing maps to obtain

\[
 \rho_m:P_R\longrightarrow qW_m(R/\mathbb Z[1/\Delta]),\qquad
 \tau_m:P_R\longrightarrow R[\zeta_m][[q-\zeta_m]].
\]

The Taylor coefficients and transitions use HR.5's Frobenius-twisted
conventions. The family \((\tau_m)_m\) identifies \(P_R\) with the same
twisted Taylor equalizer as \(H_R\); \(P_R^\wedge_h\simeq R[[h]]\).
The arithmetic/relative Habiro identification is supplied by HR.5's
number-field comparison and HR.6. Source: GSWZ Definition 1.1, pp.6–7;
the étale Habiro–Hodge identification is QH **Corollary 3.13**, p.27.

**API.**

- `numberFieldTraceExports` transports the existing specializations along
  the specified ring equivalence.
- `numberFieldTraceExports_cyclotomic` supplies
  \(\rho_m=\mathrm{reduction}_m\circ\varepsilon_R^{-1}\), including
  its completed factor \(H_{R,m}\).
- `numberFieldTraceExports_taylor` supplies
  \(\tau_m=\mathrm{Taylor}_m\circ\varepsilon_R^{-1}\), with the
  chosen root and the existing change-of-root maps.
- `numberFieldTraceExports_transition` transports the cyclotomic transition
  and p-adic Frobenius/re-expansion diagrams.
- `numberFieldTraceExports_equalizer` identifies the product of the Taylor
  maps with the existing twisted equalizer. It introduces no componentwise
  constant \(R\)-algebra structure.
- `numberFieldTraceExports_hCompletion` identifies h-completion with
  \(R[[h]]\) using \(\tau_1\); the cyclotomic and \(\Phi_m\)-adic
  completion descriptions are transported from HR.5 as well.
- `numberFieldTraceExports_naturality` gives the specialization squares,
  identity and composition laws on compatible arithmetic/étale morphisms
  for which the supplied \(\varepsilon\) is natural.

All laws follow by applying the imported Habiro law to
\(\varepsilon_R^{-1}(z)\). The construction proves no additional
fixed-point theorem and reconstructs no coefficient ring.

**Checks.**

1. `numberFieldTraceExports_rational`. For \(F=\mathbb Q\) and \(\Delta=6\), the m=1 completed Taylor
   factor is \(\mathbb Z[1/6][[h]]\); the class \(h\) maps to its
   formal parameter.
2. `numberFieldTraceExports_mOne`. At \(m=1\), \(\zeta_1=1\) and
   \(qW_1(R/\mathbb Z[1/\Delta])=R\). Reducing \(\tau_1\) modulo
   \(h\) gives \(\rho_1\). This does not identify the uncompleted
   \(P_R\) with \(R\).
3. `numberFieldTraceExports_twisted`. A family constant at a coefficient moved by an unramified Frobenius need
   not satisfy the twisted gluing. Treating every coefficient as a constant
   Taylor family would admit invalid elements, particularly in the general
   nonabelian number-field case.
4. `numberFieldTraceExports_gluing`. Every valid Frobenius/re-expansion family comes from one \(P_R\)
   element, through the existing HR.5 equalizer. An unrestricted product of
   independent expansion series fails this test.
5. `numberFieldTraceExports_inversion`. For \(F=\mathbb Q\), \(\Delta=1\) meets the discriminant condition
   for the coefficient ring but fails the additional trace inversion
   condition. It is outside this theorem. A native coefficient Check verifies
   that inverting 6 forces both 2 and 3 to be units.
6. `numberFieldTraceExports_degreeZero`. The conclusion is a ring comparison with \(\pi_0\) of the indicated
   spectral limit. It supplies no \(K_3\)-indexed modules or higher
   cohomology equivalences, and does not interchange \(\pi_0\) and limit.

## Acceptance and native suggestions

The four new targets are `traceHabiro`, `perfectedLiftNaive`,
`canonicalFramedTrace`, and `numberFieldTraceExports`. The trace existence,
E₁-resolution comparison, arithmetic ring equivalence and trace/prismatic
comparison retain their exact supplier ownership. Their hypotheses and Checks
above are part of the specification even when a target is imported.

The mathematical carriers for these enhanced constructions are absent at the
recorded library pins. Consequently the suggested Lean file contains only an
elementary native coefficient Check, against Mathlib's actual unit API. It
contains no replacement for spectra, chosen pairs or prismatic cohomology.
The README specifies all heavy definitions, maps, coherence and end theorems.

The pins are Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
The native fact used is
[`Commute.isUnit_mul_iff`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Commute/Units.lean#L75):
a product of two commuting elements is a unit exactly when both factors are.
No new unit predicate or unit theorem is a roadmap target.

Two source qualifications affect use of the references. KU 6.15's proof has
the QH reference-number slip corrected above. TC 3.5/3.7, pp.31–32,
drops a rational corner when describing an **uncompleted** finite-coefficient
pair. Use Part I §5.26's arithmetic pullback instead: even for \(m=1\),
\(qdR_{0/\mathbb Z}\simeq\mathbb Q[[h]]\), with constant filtration,
although its filtration completion and q-Hodge complex vanish. This changes
neither the completed Corollary 3.8 used by trace applications nor the
trace-free ownership of that algebraic pair. The packet records the precise
read versions and the two source findings.

## References

Locators use the printed pagination of these fixed public versions. Numbered
paragraphs share the theorem counter in the Wagner papers. All text above
states the results in the roadmap's own words.

- **QH:** Ferdinand Wagner, [q-Hodge complexes over the Habiro ring](https://arxiv.org/pdf/2510.04782v2), v2; chosen-pair/descent interfaces pp.20–27, canonical filtered interface pp.55–56, and perfected-lift criterion pp.62–66.
- **KU:** Ferdinand Wagner, [q-de Rham cohomology and topological Hochschild homology over ku](https://arxiv.org/pdf/2510.06057v1), v1; Theorem 1.2 and discussion pp.3–5, input conditions p.24, comparisons pp.43–51 and framed/arithmetic applications pp.81–86.
- **TC:** Samuel Meyer and Ferdinand Wagner, [q-Hodge complexes and refined TC⁻](https://arxiv.org/pdf/2410.23115v4), v4; finite-coefficient trace interface and its completion distinction, pp.30–32.
- **GSWZ:** Stavros Garoufalidis, Peter Scholze, Campbell Wheeler and Don Zagier, [The Habiro ring of a number field](https://arxiv.org/pdf/2412.04241v2), v2; Definition 1.1 and the twisted Taylor conventions, pp.6–7.
- **BS:** Bhargav Bhatt and Peter Scholze, [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), v4; Theorem 15.3, pp.103–104, and relative completion comparison Theorem 15.7, p.105.
- **BMS2:** Bhargav Bhatt, Matthew Morrow and Peter Scholze, [Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/pdf/1802.03261v2), v2; Theorems 1.8, 1.10 and 1.12, pp.5–7.
