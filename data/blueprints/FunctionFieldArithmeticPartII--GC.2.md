# GC.2 — Adelic root Picard groupoids

This layer identifies three presentations of root lines on a curve: ideles with
all frames chosen, a modified-unit action groupoid retaining the generic frame,
and a double action groupoid forgetting that frame. The distinction controls
principal divisors, signs, and automorphism weights in ramified geometric class
field theory. The construction applies to signed divisors in every degree that
occurs on the curve.

The source is Yun–Zhang, *Shtukas and the Taylor expansion of L-functions (II)*,
Annals of Mathematics 189 (2019), 393–526, specifically Definition A.1 on p. 514,
A.1.1 on p. 515, A.1.6 and Lemma A.5 on pp. 517–518, and the right quotient in
§6.2.3 on pp. 498–499. The statements below are mathematical specifications in
our own words. The exact sequences and stabilizer calculations are deductions
from the source definitions; they are not attributed to separately numbered
theorems there.

## Scope, conventions, and interfaces

Fix a finite field \(k\) of odd characteristic and a smooth projective
geometrically connected curve \(X/k\). Put \(F=k(X)\). Let \(R\subset X\) be a
finite reduced closed subscheme, possibly empty. Its indexing set consists of
closed points, without a rationality assumption. Write \(r=|R|\) for its number
of closed points, and distinguish it from
\(\deg R=\sum_{x\in R}[\kappa_x:k]\).

For every closed point \(x\), let \(F_x\) be the completed normalized valuation
field, \(O_x\subset F_x\) its valuation ring, and \(\kappa_x\) its residue field.
Normalize \(\operatorname{ord}_x(\pi_x)=1\). The all-place idele group and its
integral units are

\[
 I=\prod_x'F_x^\times\quad\text{relative to }O_x^\times,
 \qquad U=\prod_xO_x^\times.
\]

All closed points occur, including those outside any chosen affine model. For
an idele \(a\), define its valuation divisor and its weighted degree by

\[
 E(a)=\sum_x\operatorname{ord}_x(a_x)[x],\qquad
 \deg E(a)=\sum_x\operatorname{ord}_x(a_x)[\kappa_x:k].
\]

The sums have finite support. The line associated to \(a\) will be
\(L(a)=O_X(-E(a))\). In particular the Picard degree is **minus** the weighted
valuation degree. No degree-one divisor or rational point is chosen or
needed for this construction.

A root line means the GC.0 triple \((L,K_R,\iota)\), where \(L\) is an
invertible sheaf on \(X\), \(K_R\) an invertible sheaf on \(R\), and
\(\iota:K_R^{\otimes2}\simeq L|_R\). A morphism is a pair of isomorphisms
\((\phi,\psi)\) such that
\(\phi|_R\circ\iota=\iota'\circ\psi^{\otimes2}\). Here and throughout this
layer, Picard groupoids mean the groupoids of \(k\)-points. The construction of
the root Picard stack in families belongs to GC.0–GC.1. Root-line norms,
reciprocity characters, Frobenius trace, and section moduli belong to their
respective layers; GC.2 supplies their groupoids and degree conventions.

Use Mathlib's labelled action category. For a homomorphism \(p:H\to I\), an
arrow \(h:a\to b\) in the right presentation means \(b=a\,p(h)\), and the
label is part of the arrow. Its inverse has label \(h^{-1}\); composition has
the product label. Mathlib writes the acting scalar on the left and the
composite label in reverse order. The groups here are abelian, so its native
`CategoryTheory.ActionCategory` realizes exactly these equations. Replacing
\(H\) by its image, or passing to an orbit set, loses required arrows.

### Dependencies and ownership

The following are imports, with their existing definitions, APIs, and tests.

| Supplier | Exact input used here |
| --- | --- |
| `FunctionFieldArithmeticPartII:GC.0/root-picard` | Root-line triples, their arrows, tensor, dual, and degree of the ordinary line. |
| `FunctionFieldArithmeticPartII:GC.2/root-units` | Modified-unit group and its actual homomorphism to ideles. |
| `FunctionFieldArithmeticPartII:GC.2/root-divisor-groupoid` | Signed right action, divisor projection, and separate Abel–Jacobi functor. |
| `FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid` | The Lemma A.5 double-groupoid target. |
| `FunctionFieldArithmetic:FA.2/projective-adeles` | All-place completions, completed integers, residue comparisons, and projective adeles. |
| `FunctionFieldArithmetic:FA.2/projective-ideles` | All-place ideles, actual diagonal, weighted divisor and degree conventions. |
| `FunctionFieldArithmetic:FA.2/idele-divisor-exact-sequence` | Surjectivity of \(E:I\to\operatorname{Div}(X)\) with kernel \(U\). |
| `SchemeAndStackFoundations:SF.3/picard-groupoid` | The core of the native invertible-sheaf category and coherent ordinary tensor operations. |
| `SchemeAndStackFoundations:SF.3/class-group-picard-locally-factorial` | Ordinary divisor/line-class correspondence for the regular curve. |
| `SchemeAndStackFoundations:SF.3/vector-bundle-degree` | Ordinary rank-one degree and agreement with divisor degree through JacobianChallenge A. |
| `SchemeAndStackFoundations:SF.3/picard-stack-curve` | Global units of a proper geometrically connected curve are \(k^\times\). |

The FA.2 nodes replace the inherited blanket FA-ADELES request. The SF.3 nodes
are mathematical supplier contracts, not claims of implementation or of an
accepted review of its whole part packet. Ordinary Picard theory belongs to
those suppliers and JacobianChallenge; restricted-product infrastructure belongs
to Mathlib and the completed RestrictedProducts roadmap. AlgebraicVectorBundles
owns general sheaf tensor/pullback constructions. None is rebuilt here.

There is one more precise supplier contract,
**GC2-COMPLETED-LATTICES**, at
`tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`.
For every signed divisor \(D\), the generic fibre of \(O_X(D)\) is the rational
line \(F\), and its completed stalk at \(x\), inside \(F_x\), is

\[
 \widehat{O_X(D)}_x
 =\{z\in F_x:z=0\text{ or }\operatorname{ord}_x(z)\ge-D_x\}
 =\pi_x^{-D_x}O_x.
\]

The zero clause is essential if order is represented by an integer-valued
function with a default value at zero; the equivalent multiplicative-valuation
bound has no such ambiguity. This comparison must identify the residue of the
completed lattice with the algebraic fibre. For invertible sheaves with
generic frames, a rational scalar extends to a sheaf map exactly when it
carries each completed lattice into the target lattice, and the extension
is unique. The
identifications commute with rational multiplication, tensor, dual, and the
existing point/place and residue-field dictionaries. This specializes the
ordinary AlgebraicCurves Layer 12D/JacobianChallenge A dictionary; it requires
neither a new general formal-patching theory nor another Picard construction.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Native starting points are
`Valuation.Completion`, `Valued.valuedCompletion`,
`ValuationSubring.unitGroup`, its residue-unit homomorphism and surjectivity,
`RestrictedProduct` and `RestrictedProduct.unitsEquiv`, `MonoidHom.eqLocus`,
`CategoryTheory.ActionCategory` and its `stabilizerIsoEnd`, and
`FiniteField.unit_isSquare_iff`. Tau Ceti supplies normalized `Place`, finite
support of nonzero orders, signed `Divisor`, weighted `Divisor.degree`, and
`Divisor.degree_principal`. Its native `AlgebraicGeometry.InvertibleSheaf` is
the sheaf carrier. The pinned divisor-class injection into line-bundle classes
does not by itself supply completed lattices or framed groupoid descent.

## Modified units and the two action groupoids

Put \(B_R=\prod_{x\in R}\kappa_x^\times\). The inherited group of modified
units has the equalizer presentation

\[
 H=\{(u,v)\in U\times B_R:\bar u_x=v_x^2\ (x\in R)\}.
\]

Multiplication is componentwise, and \(p:H\to I\) forgets the \(v\)-coordinate.
This is a group fibre product. Squaring is not additive in odd characteristic,
so a fibre-product ring along the square map is not an appropriate carrier.

The imported `rootUnits` API constructs a pair satisfying the square relation,
projects its ordinary unit tuple, and characterizes its kernel by \(u=1\) and
\(v_x^2=1\). Its tests require \(H=U\) at \(R=\varnothing\), a nonidentity
\((1,-1)\) kernel label at a branch point, and failure to lift a unit whose
branch residue is nonsquare. These are tests of the actual homomorphism, not
only of its image.

The new theorem **root-unit-exact-sequence**, proposed name
`TauCeti.RamifiedClassField.rootUnits_exact`, gives

\[
 1\longrightarrow\prod_{x\in R}\mu_2(\kappa_x)
 \longrightarrow H\longrightarrow U
 \longrightarrow\prod_{x\in R}\kappa_x^\times/(\kappa_x^\times)^2
 \longrightarrow1.
\]

The middle image is exactly the unit tuples having square residue at every
branch point. Reduction on units is surjective at each \(x\), by the native
valuation-subring theorem. Lift the finitely many prescribed residues and take
the other units to be one; this proves surjectivity onto the square-class
product. The kernel of \(p\) consists of the freely retained square roots of
one, proving exactness without any choice of square roots as a homomorphism.

Define the inherited right and double presentations by

\[
 \mathcal D_R=I//H,\qquad
 \mathcal P_R=I//(F^\times\times H),
 \qquad (f,h):a\longrightarrow\operatorname{diag}(f)a\,p(h).
\]

The functor \(Q:\mathcal D_R\to\mathcal P_R\) is the identity on objects and
sends \(h\) to \((1,h)\). It is faithful; it need not be full. The inherited
`rootDivisorGroupoid` API has constructors from an idele and a labelled
modified-unit arrow, the functor \(E\) to the discrete groupoid of signed
divisors, tensor by idele multiplication, inverse by idele inversion, \(Q\),
and the kernel description of every automorphism group. Tensor and functor
laws must be stated for arrows as well as objects.

Four inherited tests pin that API. At empty \(R\), the right groupoid is
equivalent to all signed divisors, with a uniformizer and its inverse giving
\([x]\) and \(-[x]\). An inverse uniformizer outside \(R\) maps under \(Q\) to
\(O_X(x)^\natural\). A branch sign gives a nonidentity automorphism of the
unit idele. Finally, for \(f\in F^\times\) with nonzero principal divisor,
\(1\) and \(\operatorname{diag}(f)\) have no arrow between them in the empty-
\(R\) right quotient, although \((f,1)\) is an arrow in the double quotient.
These tests forbid inserting a principal-idele quotient into
\(\mathcal D_R\), or imposing effectivity there.

## Generic and local frames

### Root lines with a generic trivialization

The definition **generic-framed-root-picard** is the groupoid
\(\mathcal G_R(X)\) of root-line triples equipped with an actual isomorphism
\(\tau_\eta:L_\eta\simeq F\). Its arrows satisfy both the root square diagram
and

\[
 \tau'_\eta\circ\phi_\eta=\tau_\eta.
\]

There is no section of \(L\), no restriction on the degree, and no quotient of
generic frames in this definition. Tensor multiplies the generic frames;
duality takes the dual frame. Their coherence is inherited from the ordinary
Picard groupoid and the root-line triple.

The proposed type name is `TauCeti.RamifiedClassField.GenericFramedRootLine`.
Its API consists of the following eight operations and characterizations.

| Suffix of the proposed type name | Contract |
| --- | --- |
| `mk` | Construct from a root-line triple and a generic-fibre isomorphism. |
| `forget` | Forget exactly the generic frame, on objects and arrows. |
| `hom_ext` | Equality of arrows is equality of both the line and root-line isomorphisms. |
| `hom_iff` | The two displayed commuting diagrams characterize a morphism. |
| `tensor` | Tensor all four data, with inherited associator, unitors, and symmetry. |
| `dual` | Dualize the data, with evaluation to the unit preserving its generic frame. |
| `degree` | Return \(\deg L\); it is invariant on arrows, additive, and negated by duality. |
| `changeGenericFrame` | Multiply \(\tau_\eta\) by \(f\in F^\times\), with identity and multiplication laws and invariant unframed image. |

This API serves the intermediate quotient in the proof of Lemma A.5, the
signed translations of §6.2.3, and the separate Abel–Jacobi functor. In
particular `hom_ext` cannot discard the root-line map merely because the
ordinary line map has been determined.

The four definition tests, with suffixes under this same type name, are:

1. **`test_empty_R`.** At empty \(R\), forgetting the vacuous root data gives
   ordinary generically trivialized line bundles. The ordinary dictionary
   identifies this groupoid with the discrete groupoid of signed divisors.
2. **`test_generic_frame_matters`.** At empty \(R\), give \(O_X\) the generic
   frames \(1\) and \(f\), where \(\operatorname{div}(f)\ne0\). They are
   nonisomorphic as framed objects even though their unframed lines agree:
   the required generic scalar \(f^{-1}\) is not a global line automorphism.
3. **`test_root_squareclass`.** On \(\mathbb P^1_{\mathbb F_5}\) with
   \(R=\{0\}\), take the ordinary line and root line trivial and the generic
   frame equal to one. The square identifications with coefficients \(1\)
   and \(2\) are not isomorphic. A frame-preserving ordinary map is the
   identity, and its root equation would make \(2\) a square.
4. **`test_dual`.** For every \(A\), including negative-degree objects,
   \(A\otimes A^\vee\) is isomorphic to the framed unit and has degree zero.

### Fully framed root lines

The definition **fully-framed-root-picard** adds to an object of
\(\mathcal G_R(X)\) isomorphisms

\[
 \tau_x:L\otimes O_x\simeq O_x\quad(x\in|X|),\qquad
 t_x:K_x\simeq\kappa_x\quad(x\in R),\qquad
 (\tau_x\bmod\mathfrak m_x)\circ\iota_x=t_x^{\otimes2}.
\]

Arrows preserve every frame. Denote the resulting groupoid by
\(\mathcal F_R(X)\). Its transition coefficient, after scalar extension to
\(F_x\), is

\[
 a_x=\tau_\eta\circ\tau_x^{-1}\in F_x^\times.
\]

The requested ordinary lattice dictionary proves that these coefficients are
units at almost all points. This is a theorem about an algebraic line and a
rational frame; an additional summability axiom in the definition would hide
that theorem.

The proposed type name is `TauCeti.RamifiedClassField.FullyFramedRootLine`.
Its seven API items are:

| Suffix | Contract |
| --- | --- |
| `mk` | Construct the triple with generic, local, and compatible residue-root frames. |
| `forgetLocalFrames` | Forget \((\tau_x),(t_x)\), retaining \(\tau_\eta\). |
| `forgetRootFrames` | Forget the root line, square map, and root frames; this is an equivalence to ordinary fully framed lines. |
| `coefficient` | Return the idele \((\tau_\eta\tau_x^{-1})_x\). |
| `hom_ext` | A fully frame-preserving arrow is unique when it exists. |
| `changeFrames` | For \((f,h)\in F^\times\times H\) with \(h=(u,v)\), send \(\tau_\eta\) to \(f\tau_\eta\), \(\tau_x\) to \(u_x^{-1}\tau_x\), and \(t_x\) to \(v_x^{-1}t_x\); coefficients become \(\operatorname{diag}(f)a p(h)\). This action is functorial on arrows, satisfies identity and composition laws, and intertwines `forgetLocalFrames` with the generic-frame action. |
| `tensor` | Coefficients multiply under tensor, equal one on the unit, and invert under duality; the coherence maps preserve the frames. |

The root equation survives `changeFrames` because
\(\bar u_x^{-1}=v_x^{-2}\). For a fixed ordinary fully framed line, the
groupoid of compatible root data is contractible: trivialize the residue
root line by its chosen \(t_x\); this determines its square identification
and every arrow. Thus forgetting that framed root data is an equivalence,
even though forgetting the frames themselves creates root automorphisms.

The four tests under this proposed type name are:

1. **`test_empty_R`.** Empty root data gives ordinary fully framed lines;
   their coefficient groupoid is the discrete groupoid on all-place ideles.
2. **`test_uniformizer_inverse`.** For \(x\notin R\), give \(O_X(x)\) its
   rational identity frame and local frame multiplication by \(\pi_x\).
   The coefficient is \(\pi_x^{-1}\); choose coefficient one elsewhere.
3. **`test_root_sign_contractible`.** Change one chosen root frame \(t_x\)
   to \(-t_x\), with all ordinary data fixed. The two fully framed objects
   are uniquely isomorphic by root scalar \(-1\) at \(x\); they have the
   same coefficient, and do not create two components.
4. **`test_no_unframed_kernel`.** A nonidentity root sign is not an
   automorphism preserving a chosen \(t_x\). It becomes an automorphism
   only after forgetting that frame.

## Gluing and labelled descent

### The coefficient equivalence

The comparison **fully-framed-idele-comparison**, proposed name
`TauCeti.RamifiedClassField.fullyFramed_idele_equivalence`, is a symmetric
monoidal equivalence

\[
 \mathcal F_R(X)\simeq\operatorname{Discrete}(I).
\]

For its inverse, start with \(a\in I\), take \(L(a)=O_X(-E(a))\subset F\),
and use GC2-COMPLETED-LATTICES to identify its completion with \(a_xO_x\).
Use rational identity as \(\tau_\eta\) and division by \(a_x\) as \(\tau_x\).
Take \(K_R=O_R\), root frames one, and let \(\iota_x\) send the unit basis
to the class of the completed basis \(a_x\) in \(L(a)|_x\). This is the
residue of a basis of the lattice, not the residue of \(a_x\) in the field
when \(a_x\) is nonintegral.

For an arbitrary fully framed line, the generic embedding identifies its
completed lattices with \(a_xO_x\). The ordinary dictionary reconstructs
\(O_X(-E(a))\) with this rational embedding. The root frames identify the
remaining residue-root data uniquely. Two fully framed objects have a
frame-preserving arrow exactly when their coefficients agree, and that arrow
is unique. This gives both full faithfulness and essential surjectivity.
Multiplying bases proves tensor compatibility, and the frame-change formula
above proves equivariance for \(F^\times\times H\).

For any root-line triple, compatible local/root frames exist. Choose generic
and root frames. At a branch point their square identification prescribes a
nonzero residue coefficient for an ordinary local frame. The native residue-
unit surjection lifts that adjustment to a local unit. No hypothesis that
this coefficient already be square is needed: the ordinary local frame is
being adjusted as well.

### The right quotient retains the generic frame

The comparison **right-quotient-generic-frame-comparison**, proposed name
`TauCeti.RamifiedClassField.rootDivisor_genericFrame_equivalence`, is

\[
 \mathcal D_R\simeq\mathcal G_R(X).
\]

Forget local/root frames in the preceding equivalence, keeping the generic
frame. Compatible frame changes are labelled by \(H\). Explicitly, if
\(b=a u\) and \(h=(u,v)\), the rational lattices agree, and the arrow sends
the ordinary line by identity and the root line by \(v_x^{-1}\). Its square
diagram holds because \(b_xv_x^{-2}=a_x\) after reduction in the relevant
local bases. Conversely a generic-frame-preserving root-line arrow fixes
the rational line and determines this exact \(h\), including its root signs.

The equivalence is symmetric monoidal. The rational section sent to one by
the generic frame has order \(\operatorname{ord}_x(a_x^{-1})\), so its divisor
is \(-E(a)\). Thus the projection \(E\) is the negative of that section
divisor, and the underlying line is \(O_X(-E(a))\). The square formed by
\(Q\), the geometric forgetful functor \(\mathcal G_R(X)\to\operatorname{Pic}_X^{\sqrt R}(k)\),
and the double-groupoid equivalence has a specified monoidal natural
isomorphism. The component comes from the same line and root maps, rather
than from an equality of orbit sets.

### Hom descent for the double quotient

The theorem **double-quotient-arrow-descent**, proposed name
`TauCeti.RamifiedClassField.rootPicard_doubleArrow_bijection`, gives, for
every pair of ideles \(a,b\), a bijection

\[
 \{(f,h)\in F^\times\times H:b=\operatorname{diag}(f)a p(h)\}
 \simeq
 \operatorname{Isom}_{\operatorname{Pic}_X^{\sqrt R}(k)}
       (L(a)^\natural,L(b)^\natural).
\]

The forward map is rational multiplication by \(f\) on the line and scalar
\(v_x^{-1}\) on the roots. For the reverse map, restrict an ordinary line
isomorphism to its generic fibre. It is multiplication by a unique
\(f\in F^\times\). Equality of local lattices implies
\(u_x=b_x/(f a_x)\in O_x^\times\). Write the root isomorphism as scalar
\(\psi_x\). Its square diagram says

\[
 \psi_x^2=\overline{f a_x/b_x}=\bar u_x^{-1}.
\]

Consequently \(v_x=\psi_x^{-1}\) recovers an element of \(H\). The ordinary
lattice dictionary gives the actual algebraic line map, not just a formal
collection of completed maps. These constructions are mutually inverse.
They preserve identity, composition, tensor, and inverse. Together with
existence of frames they prove the inherited Lemma A.5 equivalence
\(\mathcal P_R\simeq\operatorname{Pic}_X^{\sqrt R}(k)\). Injectivity of
\(h\mapsto(1,h)\) proves the faithfulness of \(Q\).

## Fibres and automorphism groups

The theorem **root-divisor-fibres**, proposed name
`TauCeti.RamifiedClassField.rootDivisor_fibre`, describes every fibre of
\(E:\mathcal D_R\to\operatorname{Discrete}(\operatorname{Div}(X))\).
It is nonempty by the imported idele/divisor exact sequence. Once an idele
with divisor \(D\) is chosen, all other such ideles are obtained by multiplying
by \(U\). Their isomorphism classes form a torsor under

\[
 U/p(H)\simeq\prod_{x\in R}\kappa_x^\times/(\kappa_x^\times)^2.
\]

At every object, cancellation of \(a\) in \(a p(h)=a\) identifies its
automorphism group canonically, by its labels, with
\(\ker p=\prod\mu_2(\kappa_x)\). Choosing a base idele, square-class
representatives, and connecting arrows identifies the fibre with a disjoint
union of classifying groupoids indexed by that square-class product, with
each vertex group \(\prod\mu_2\). The equivalence to this displayed disjoint
union depends on choices; the torsor and labelled stabilizers do not.

Each finite odd residue field has two square classes and two roots of one.
Thus the fibre has \(2^r\) components and every automorphism group has order
\(2^r\). It is generally neither discrete nor a single classifying groupoid.
For example, one degree-two branch point over \(\mathbb F_3\) has residue
field \(\mathbb F_9\): there are two components, each with two automorphisms,
not four of either. A finite-field implementation must enumerate square
classes in \(\kappa_x\), not in \(k\), and count closed points rather than
geometric points.

The theorem **picard-stabilizer-extension**, proposed name
`TauCeti.RamifiedClassField.rootPicard_stabilizer`, gives the different
automorphism group in \(\mathcal P_R\). At any idele \(a\), its labels satisfy
\(\operatorname{diag}(f)p(h)=1\). The ordinary line map is a global unit on
the proper geometrically connected curve, hence \(f=c\in k^\times\).
Therefore the group is canonically

\[
 A_R=\{(c,(v_x))\in k^\times\times B_R:v_x^2=c^{-1}\text{ for all }x\in R\}.
\]

Let \(C_R\subset k^\times\) be the constants that are square in every
\(\kappa_x^\times\). Projection gives an exact sequence

\[
 1\longrightarrow\prod_{x\in R}\mu_2(\kappa_x)
 \longrightarrow A_R\longrightarrow C_R\longrightarrow1.
\]

For \(q=|k|\) and \([\kappa_x:k]=d\), the parity of
\((q^d-1)/(q-1)\) is the parity of \(d\). The finite-field square criterion
then shows that a nonsquare constant becomes square exactly at even-degree
points. Consequently \(C_R=(k^\times)^2\) if \(R\) has an odd-degree point,
and \(C_R=k^\times\) if all its points have even degree, including the empty
case. At empty \(R\), \(A_R=k^\times\), whereas right-quotient automorphisms
are trivial.

Do not add a splitting to this exact sequence. For \(k=\mathbb F_5\),
\(X=\mathbb P^1\), and one rational branch point, the map
\(v\mapsto(v^{-2},v)\) identifies \(A_R\) with \(\mathbb F_5^\times\),
the cyclic group of order four. Its projection onto \(C_R=\{1,4\}\) has
kernel \(\{1,-1\}\). The element \((4,2)\) has order four, so this extension
cannot be replaced by the direct product of two groups of order two. This
test detects an unjustified simultaneous choice of square roots.

## Degree and sign acceptance

The theorem **valuation-degree-comparison**, proposed name
`TauCeti.RamifiedClassField.rootPicard_degree`, states that for the equivalence
\(\Phi:\mathcal P_R\simeq\operatorname{Pic}_X^{\sqrt R}(k)\),

\[
 \operatorname{underlyingLine}(\Phi(a))=O_X(-E(a)),\qquad
 \deg\Phi(a)=-\deg E(a)
   =-\sum_x\operatorname{ord}_x(a_x)[\kappa_x:k].
\]

The ordinary degree/divisor comparison supplies the second equality from the
first. A right arrow preserves \(E\). A double arrow changes \(E\) by the
principal divisor of \(f\); the pinned product formula gives degree zero
for that difference. Hence the integer grading is invariant on all arrows,
additive under tensor, and negated by inverse. It also agrees with the degree
of the generic-framed object before applying \(Q\).

Three calculations must commute through the geometric comparisons. At a
closed \(x\notin R\) of degree \(d\), a coefficient \(\pi_x^{-1}\), with
all other coefficients one, gives \(E=-[x]\), line \(O_X(x)^\natural\), and
degree \(d\). Its inverse gives \(E=[x]\), line \(O_X(-x)^\natural\), and
degree \(-d\). A diagonal \(f\) gives \(E=\operatorname{div}(f)\) and a
trivial ordinary line up to isomorphism with degree zero, while still
retaining its generic frame in the right quotient. For \(R=\varnothing\)
these specialize to the ordinary divisor/Picard diagram. For general \(R\),
the square through \(D\mapsto O_X(-D)\) commutes after forgetting root data
to the ordinary Picard groupoid. The root data remain on the separate
\(Q\)-leg. The \(E\)-leg forgets the root labels and their residue square
classes; for nonempty \(R\), the root-sign arrows prevent a factorization
of the root Picard functor through the discrete ordinary divisor groupoid.

There is a convention discrepancy in the proof of Lemma A.5 on published
p. 518. With the source's displayed directions of \(\tau_\eta\) and
\(\tau_x\), the coefficient printed there is the reciprocal of the one used
here. The line \(O_X(x)\) with local frame multiplication by \(\pi_x\)
would then have coefficient \(\pi_x\), conflicting with the lemma's
inverse-uniformizer normalization. The convention here uses
\(\tau_\eta\tau_x^{-1}\), so its rational lattice is \(a_xO_x\) and the
line is \(O_X(-E(a))\). The same ratio occurs in arXiv v2, printed p. 85.
Packet finding EGC2-1 records the correction and the scoped correction search;
the inherited E9 records the separate root-frame tuple notation slip.

## Completion criteria and suggested forms

Acceptance requires explicit functors and inverse natural isomorphisms for
both framed comparisons; a bijection on isomorphism classes is insufficient.
Check the forward and inverse Hom formulas on a general \((f,u,v)\), on a
kernel root sign, and on composition. Check that the forgetful square for
\(Q\) commutes on arrows and tensors. Check all eight new definition tests,
the seven inherited definition tests, the degree calculations, the
degree-two residue example, and the nonsplit stabilizer example. Every use of
an ordinary geometric lattice must pass through the named supplier contract.

The packet has nine new targets: two framed definitions, two comparison
equivalences, and five theorems. Its two added planets are “Framed Picard
groupoid” and “Degree of the root Picard groupoid”; with the inherited “Ramified
root units” and “Adelic root Picard groupoid” this gives four GC.2 planets.
No additional sublayer or ordinary geometry roadmap is needed.

The companion suggested file is a compact interface aid over carriers
available at the pins. It specializes actual completed fields, valuation
subrings, the cofinite restricted product, equalizer modified units, and native
action categories. Its diagonal uses the existing finite-support theorem.
Its separate inclusion functor keeps the label \((1,h)\). It states Hom,
kernel, faithfulness, signed-degree, and principal-idele regression milestones.
The geometric framed carriers, their fifteen API items and eight tests, and
the sheaf comparison targets above are specified in this README. Their sheaf
interfaces are not present at the pins, so they are not represented by admitted
data definitions or empty placeholder structures. This follows the compact
suggested-file shape in WORKERS.md of 2026-10-12. Elaboration of that interface
file is not a proof of any target.

The target-level planning pass is complete and independently accepted.
Stage GC.2 is **planned**, with
one exact supplier request and no unassigned mathematical gaps. Its remaining
input is GC2-COMPLETED-LATTICES; discharging that input permits the geometric
comparison and degree targets to be implemented over the ordinary curve
dictionary. Implementation status of every target is unchecked.

## References

- Zhiwei Yun and Wei Zhang, [*Shtukas and the Taylor expansion of L-functions
  (II)*, published author copy](https://math.mit.edu/~zyun/GZW_ramified_published.pdf),
  Definition A.1 p. 514; A.1.1 p. 515; A.1.6 and Lemma A.5 pp. 517–518;
  §6.2.3 and Lemma 6.4 pp. 498–499. The inverse-uniformizer character consumer
  is Proposition A.12, proof p. 525. Accessed 18 October 2026.
- Yun–Zhang, [arXiv:1712.08026v2](https://arxiv.org/pdf/1712.08026v2),
  13 June 2020, A.1.6 and Lemma A.5, printed pp. 84–85, used for collation
  of the frame ratio. The packet records both file hashes and the exact
  sections read.
- [Inherited FunctionFieldArithmeticPartII packet](../packets/FunctionFieldArithmeticPartII.json)
  and [reader](FunctionFieldArithmeticPartII.md), GC.0–GC.2, own the imported
  root-line and action-groupoid definitions.
- [FunctionFieldArithmetic packet](../packets/FunctionFieldArithmetic.json),
  FA.2, supplies all-place adeles/ideles and their divisor exact sequence;
  [SchemeAndStackFoundations SF.3 packet](../packets/SchemeAndStackFoundations--SF.3.json)
  supplies the ordinary Picard contracts named above.
- [AlgebraicCurves, Layer 12](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicCurves/README.md#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts),
  [JacobianChallenge, Layers A–B](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md),
  and [Completed RestrictedProducts](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/RestrictedProducts/README.md)
  provide the existing roadmap boundaries and ordinary comparison contracts.
