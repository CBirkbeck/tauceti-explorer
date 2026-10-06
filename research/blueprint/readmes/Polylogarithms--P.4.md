# Polylogarithms, explicit regulators and Zagier statements: P.4

This is the target-level continuation of the accepted Polylogarithms blueprint,
restricted to `Polylogarithms:P.4`. It builds the general-weight statement
infrastructure and identifies the precise extra input required by the
weight-four proof. The accepted parent remains the owner of its definitions.
All declarations in this continuation are proposed and unchecked.

The packet is **complete**, and P.4 has coverage **planned**. This means that
every target has a statement and a dependency chain ending in the pinned
libraries, an existing blueprint, an exact supplier request or a recorded gap.
It does not mean that P.4 is closed. The five gaps and three supplier requests
are listed below with their mathematical scope. General-weight motivic
comparison and weight-four homotopy are conjectures; source theorem status is
kept distinct from the proof inputs missing in this plan.

The fixed baselines are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit does not
supply the general polylogarithmic relation groups, their scalar regulator or
Zagier comparison. It does supply much of the algebraic infrastructure. In
particular, native kernels, submodule quotients, tensor products, exterior
powers, determinants and homological complexes are used throughout.

## Targets and inherited objects

The four targets of this stage are: the rational relation complex; the
embedding-wise determinant with its period and discriminant factors; the
separate existence, comparison and every-family assertions; and the explicit
weight-four theorem with a separately owned full proof. This packet adds 18
nodes, including eight definitions or constructions with 47 API entries and 32
tests. It imports the following parent nodes rather than repeating them:

| Parent node, prefixed `Polylogarithms:P.4/` | Interface imported |
| --- | --- |
| `higher-bloch-group` | Simultaneous rational-curve recursion defining the inductive Bₙ |
| `delta-map` | The boundaries on rational symbols with the fixed endpoint convention |
| `specialization-and-delta` | The angular-component specialization statement, whose proof is refined here |
| `general-polylog-complex` | Γ(F,n) in degrees 1 through n |
| `explicit-to-inductive-comparison` | Natural comparison maps in weights two, three and four |
| `polylog-on-higher-bloch` | The scalar Lₙ quotient map, once analytic descent is proved |
| `condition-o-n` | Actual first-boundary cycles and embedding conditions |
| `goncharov-comparison-conjecture` | Conjectural comparison with the gamma-graded K-group |
| `zagier-determinant`, `zagier-statement` | Normalized determinant and the three logical assertions |
| `weight-four-theorem` | Published theorem, with the parent's empty-case correction and presentation caveat |
| `freeness-extension` | The combinatorial B₄ symbol span inside L₄ and its exact sequence |

Other prerequisites are P.1's classical and single-valued polylogarithms and
continuity, P.3's explicit trilogarithm, weight-three complex and exterior
residue, K3BlochGroups V.3's five-term presentation and sign adapter, and
BorelRegulators R.4–R.7. The original consumers remain AlgebraicKTheoryUnits,
P.6's arithmetic applications and SpecialValuesBirchTate B.8. They consume
this infrastructure; B.8 is not made a prerequisite of the determinant it uses.
P.3 also consumes the explicit weight-four homotopy hypothesis for its
conditional derived transfer.

Write U(F)=F×⊗ℚ additively, with u(x) the class of a nonzero element. The
class of −1 is zero in this rational vector space. The inductive Bₙ(F) is the
parent's quotient of the rational free symbol space by Rₙ(F), with the infinity
symbol zero. For n≥2 its relation generators are the zero symbol and
sp₁(α)−sp₀(α), where α is a raw δₙ-cycle over F(t). The recursion is
simultaneous across fields and weights. Its use of rational curves is part of
the definition, not a notation for the all-smooth-curve quotient in Goncharov
1995, §1.9.

The parent boundaries are

\[
\delta_2\{x\}_2=u(1-x)\wedge u(x),\qquad
\delta_n\{x\}_n=\{x\}_{n-1}\otimes u(x)\quad(n\ge3),
\]

with boundary zero at the endpoint symbols. At x=1 this does not require
the odd-weight symbol itself to vanish. Relative to V.3's chosen Bloch
boundary, δ₂ is the negative of the rational antisymmetric-to-exterior
adapter. All comparison squares retain that sign.

## Specialization and the rational-curve relation recursion

The new theorem `relation-specialization-induction` specifies the missing
joint induction. For an infinite field F and a rational point a of P¹(F),
prove spₐ(Rₙ(F(t)))⊆Rₙ(F), and then prove that spₐ preserves δₙ-cycles and
δₙ kills Rₙ(F). This is stronger than checking the boundary on one symbol.
A generator of Rₙ(F(t)) is witnessed by a family over F(t)(s); specialization
in t must turn that witness into a relation over F even when fibres collide
or acquire poles. This two-variable degeneration step is a recorded gap.

Choose π=t−a at a finite point and π=1/t at infinity. Use the
multiplicative angular component

\[
\operatorname{ac}_{\pi}(g)=\overline{g\pi^{-v_a(g)}}.
\]

Its rationalization U(F(t))→U(F) is a linear map. On a Bloch symbol, spₐ
is the residue symbol when the rational function is a valuation unit, and
zero for a zero or pole. The specializer on a tensor is the tensor product
of these two maps. On a symbol generator, the boundary square is checked in
four cases: positive valuation, negative valuation, unit residue 1 and
ordinary unit residue. In the pole case the angular components of 1−f and
f differ by −1, so their rational unit classes coincide and the wedge is
zero. In the unit-residue-1 case the lower symbol can be nonzero but is
multiplied by u(1)=0.

This correction matters in the source proof. Goncharov 1995, p. 222, defines
a tensor specialization by reducing both factors when both are valuation units and
sending all other cases to zero. Over ℂ(t) at t=0, both
\(\{1\}_3\otimes t\) and \(\{1\}_3\otimes(2/t)\) are sent to zero,
whereas their sum \(\{1\}_3\otimes2\) is sent to a nonzero tensor. The first
factor is detected by L₃(1)=ζ(3), and 2 has nonzero rational unit class.
Thus the printed rule is not bilinear. Replacing it by angular components
repairs this defect; it does not prove the two-variable relation-preservation
step. The packet records this as `Polylogarithms/E-P4-01`, a defect in the
proof, without claiming that Lemma 1.16 is false.

Once the relation maps exist, `complex-specialization` gives a native cochain
map Sₐ:Γ(F(t),n)→Γ(F,n). In degree i<n its map is
spₐ⊗Λⁱ⁻¹acπ, and in degree n it is Λⁿacπ. It is the identity on constants
and is natural under compatible field embeddings and choices of parameter.
Its exterior components depend on π. A uniformizer-independent map on every
degree is not part of this assertion.

`higher-symbol-inversion` records the induction
\(\{x\}_n+(-1)^n\{x^{-1}\}_n=0\) for n≥2. The variable-t inversion
expression has zero boundary by the lower-weight identity and
u(t⁻¹)=−u(t); compare its specialization at infinity with its value at x.
Putting x=1 in even weight gives \(\{1\}_{2m}=0\) over ℚ. In odd weights
n≥3 the class \(\{1\}_n\) is a cycle and is nonzero over ℂ, detected by
the descended scalar Lₙ(1)=ζ(n). Analytic descent is a prerequisite of this
nonvanishing argument, so it is not used circularly to construct that map.

## Scalar evaluation and analytic descent

`cycle-evaluation` is a finite linear combination, not another definition of
Lₙ or Bₙ. If α=Σq_f[f] is a raw rational symbol family over ℂ(t), set

\[
E_n(\alpha,a)=\sum_f q_f L_n(f(a)).
\]

Here f(a) is evaluated on P¹(ℂ); a pole has value infinity and contributes
Lₙ(∞)=0. For n≥2 the imported scalar is continuous on the projective line.
Consequently this finite sum is continuous across the finite bad set of its
rational functions. A constant function equal to 1 contributes ζ(n) in odd
weight and zero in even weight. A totalized field evaluation at a pole must
not replace projective evaluation.

The new theorem `cycle-constancy` supplies the proof read in Goncharov 1994,
Theorem-motivation 1.15, pp. 7–9, and Goncharov 1995, Proposition 1.18 and
Corollary 1.19, pp. 223–224. If α∈ker δₙ over ℂ(t), then Eₙ(α,a) is
independent of a∈P¹(ℂ). Therefore the scalar kills every defining relation
sp₁α−sp₀α, as well as the zero symbol, and descends uniquely by the quotient
universal property to the parent's `polylog-on-higher-bloch`.

At weight two use

\[
r_2(f\wedge g)=-\log|f|\,d\arg g+\log|g|\,d\arg f,
\qquad dL_2(f)=r_2\delta_2[f].
\]

For n≥3 put \(\widehat L_n=L_n\) in odd weight and \(\widehat L_n=iL_n\)
in even weight, and β_k=2ᵏB_k/k!. Away from 0,1 and infinity, the differential
formula is

\[
\begin{split}
d\widehat L_n(z)={}&\widehat L_{n-1}(z)i\,d\arg z\\
&-\sum_{k=2}^{n-2}\beta_k\log^{k-1}|z|\widehat L_{n-k}(z)\,d\log|z|\\
&-\beta_{n-1}\log^{n-2}|z|
 \bigl(\log|z|\,d\log|1-z|-\log|1-z|\,d\log|z|\bigr).
\end{split}
\]

The last exponent is n−2. The unified formula (1.28c) in the 1995 published
scan prints n−1, although its adjacent odd formula (1.28b) gives n−2. The
1994 manuscript's equation (14) also gives n−2. At weight three on the real
axis, x=1/2 gives L₃′(x)=4(log 2)²/3; the misprinted term would give
−4(log 2)³/3. This is `Polylogarithms/E-P4-02`, a misprint whose correction
is already visible in the inspected source formulas.

The differential factorization is the substantial step. The first term uses
the already descended lower-weight scalar. For every log-power term, iterate
the lower δ maps and apply the symmetric multilinear product of logarithms.
The final term factors through δ₂ and r₂ together with the remaining logs.
Goncharov's rₙ is consequently well defined on the lower quotient and satisfies
dÊₙ=rₙδₙ. A cycle has derivative zero off a finite bad set. The punctured
complex sphere is connected, so the sum is constant there; continuity extends
that value across all missing points. This proves scalar descent, without
claiming a classification of all functional identities. General Deligne
complexes and current maps remain with P.5 and MotivicEtaleKTheory M.8.

The algebraic lower-weight specialization used in this induction retains the
first gap. The full scalar proof has been read and specified; it is not used
to conceal the unproved rational-curve degeneration argument.

## Suslin's rigidity and the weight-two comparison

`suslin-rigidity-adapter` adds the exact input required by the parent's
weight-two explicit-to-inductive comparison. Suslin's Corollary 5.6 in the
English translation, p. 237, gives B(F(t))≅B(F) for an infinite field F.
The word rational in that statement refers to a rational function field;
tensoring with ℚ is a subsequent step. Goncharov–Rudenko explicitly cite
this corollary in their B₂ comparison, p. 9, footnote 2.

A raw δ₂-cycle over F(t) maps, using V.3's boundary sign and exterior
adapter, into Suslin's Bloch kernel. The constants map is an isomorphism
onto that kernel. Its two compatible specialization retractions agree,
so sp₁α−sp₀α is zero in the rational five-term pre-Bloch group. Conversely,
vary a generic five-point configuration in a rational parameter: the five-term
expression has zero boundary, and its degenerate specialization consists of
inversion and endpoint relations. These two containments identify the
relation subspaces at weight two. Degenerations and exceptional parameters
must be justified; the field is infinite.

K3BlochGroups V.4 owns Suslin's theorem and the K₃-ind homotopy invariance
used to establish it. Its existing `suslin-exact-sequence` does not export
the required rigidity and specialization retractions. This packet requests
that exact Part II addition rather than recreating K-theory. Suslin's
specialization on the full integral pre-Bloch presentation should also not be
identified blindly with the rational zero-at-poles symbol convention; the
adapter is on the rational Bloch kernel, with the degeneration relations
accounted for. Goncharov 1995's distinct constant-field rigidity conjecture
for all smooth-curve relations is not substituted for Suslin's result.

## Three Zagier assertions and their logical relations

Let F have r₁ real embeddings and r₂ pairs of complex embeddings, and let
N=[F:ℚ]=r₁+2r₂. For n≥2 choose one embedding from each complex pair and use
the parent's real coordinate convention. Then

\[
d_n=\begin{cases}r_1+r_2&n\text{ odd},\\r_2&n\text{ even},\end{cases}
\qquad e_n=n(N-d_n).
\]

Thus eₙ=nr₂ in odd weight and n(r₁+r₂) in even weight. For a family of
dₙ actual δₙ-cycles y_j the normalized determinant is

\[
Z_n(y)=\frac{\pi^{e_n}}{\sqrt{|D_F|}}
       \det\bigl(L_n(\sigma_i(y_j))\bigr)_{i,j}.
\]

The sign/orientation choices alter rational proportionality by a rational
sign. The empty matrix has determinant 1. These are exactly the parity,
period and discriminant conventions in Zagier 1990, introduction (2), p. 393,
and Goncharov 1994, Remark 2.4, p. 13. Zagier's two relation models in §8
are not identified with the inductive rational-curve quotient without a
comparison. His weight-one polynomial has a different expression from the
parent's unit logarithm; the Bernoulli normalization comparison here is for
n≥2.

The parent statements distinguish rank existence, motivic comparison and
numerical rationality for every family. This continuation makes two refinements.

`rational-existence` requires a family y and q∈ℚ× satisfying
Zₙ(y)=qζ_F(n). The nonzero rational factor is essential. If dₙ>0,
multiplying one column by q⁻¹ produces exact equality with ζ_F(n).
Existence of a nonzero real determinant by itself does not license that
rational scaling. One can instead combine rank existence with the every-family
assertion to obtain a nonzero rational factor. This correction is recorded
as an assembly note on the parent `zagier-statement`.

`regulator-comparison` asks for a ℚ-linear equivalence
φ:ker δₙ≅grᵞₙK₂ₙ₋₁(F)_ℚ and a nonzero rational λ satisfying

\[
p_L(y)=\lambda\pi^{n-1}r_{\rm Bo}(\phi(y)).
\]

The Borel regulator here is R.4's selected real Tate-divided Burgos
coordinate convention. Merely finding an abstract equivalence of vector
spaces does not give this compatibility. Its existence remains conjectural
in general weight. No arbitrary equivalence is described as canonical.
The generic Lean signature keeps a specified scale A; its arithmetic
specialization is A=πⁿ⁻¹.

`assertion-logic` proves the exact elementary implications. Rational
existence gives rank existence. Rank existence plus every-family rationality
gives rational existence. Positive determinant size gives exact rationally
normalized equality. Conversely, if dimℚ(ker δₙ)=dₙ and rational existence
holds, a nonzero-period family is a ℚ-basis. Every other family is obtained
by a rational coefficient matrix, so determinant multiplicativity gives
the every-family rational factor. That factor is permitted to be zero:
repeated columns and the zero family are required tests, not contradictions.
The dimension hypothesis cannot be dropped.

## Calibrating the period with Borel's theorem

`period-calibration` is a conditional comparison, using the exact statements
in BorelRegulators R.4–R.5. In the Tate-divided Burgos convention their
covolume formula is

\[
R_{{\rm Bo},n}\sim_{\mathbb Q^\times}
  \sqrt{|D_F|}\,\pi^{d_n-Nn}\zeta_F(n).
\]

Multiplication of each period coordinate by λπⁿ⁻¹ changes a determinant
by (λπⁿ⁻¹)ᵈ. The exponent becomes

\[
(n-1)d+d-Nn=-n(N-d)=-e_n.
\]

Hence the normalized scalar determinant has nonzero rational ratio to
ζ_F(n). An integral free K-basis modulo torsion furnishes one witness;
rational basis changes and coefficient matrices give every-family
rationality. This argument requires the number-field Adams purity
identification of the weight-n eigenspace with the whole rational K₂ₙ₋₁
group. SchemeKTheoryOperations S.6 owns the general operations and receives
the precise arithmetic adapter request. A gamma graded piece and the full
K-group are not identified merely by notation.

BorelRegulators R.7 receives the exact scalar normalization request.
Its existing factor-two comparison is within the same Tate coordinates;
it does not supply the πⁿ⁻¹ conversion from scalar polylogarithms. Dropping
that factor changes the exponent by (n−1)d and gives a wrong statement.
Checks are F=ℚ with odd n (d=1,e=0), F=ℚ with even n (d=0,e=n), and
F=ℚ(i) (d=1, e=n in odd weight and 2n in even weight).

For weight four and totally real F, d=0. The only determinant is
π⁴ʳ¹/√|D_F|. The functional equation and rank-zero Borel covolume imply
nonzero rational proportionality to ζ_F(4), not exact equality. For ℚ,
the factor is 90 because ζ(4)=π⁴/90. There is no column to rescale.
`weight-four-totally-real` imports the arithmetic formula and reuses the
parent's recorded correction `Polylogarithms/E2`.

## The explicit weight-four complex

`explicit-weight-four-complex` specifies exactly Goncharov–Rudenko's complex
(44), p. 16. Its four terms are

\[
B_4^{\rm comb}(F)\longrightarrow B_3^{\rm exp}(F)\otimes U(F)
\longrightarrow B_2^{\rm exp}(F)\otimes\Lambda^2 U(F)
\longrightarrow\Lambda^4 U(F),
\]

in degrees 1–4, with zero objects outside. B₄-comb is the symbol span in
the parent's combinatorial L₄; B₃-exp is P.3's explicit 22-term quotient;
B₂-exp is the rational five-term quotient with the V.3 sign convention.
The first boundary is {x}₄↦{x}₃⊗u(x). Interior boundaries insert u(x) into
the exterior factor, and the final boundary inserts u(1−x)∧u(x).
Repeated exterior factors give the square-zero identities once relation
descent is supplied. There is no incoming map at degree one, so the first
cohomology is its first-boundary kernel.

Theorem 1.14 and the cobracket relation descent are the proof input, owned by
the named Polylogarithms Part II described below. Corollary 1.15 identifies
this explicit complex with the relevant weight-four Chevalley–Eilenberg
complex. It does not identify B₃-exp with B₃-ind. In particular Λ²B₂ is
part of the comparison Lie-coalgebra complex, not an extra degree-two
summand of Γ-exp. This distinction is an acceptance test.

`presentation-chain-map` uses the parent's maps p₄, p₃ and p₂ to form
P:Γ-exp→Γ-ind. Its components are p₄, p₃⊗id, p₂⊗id and id.
The degree-two square is

\[
(p_3\otimes\mathrm{id})\delta_4^{\rm exp}
       =\delta_4^{\rm ind}p_4.
\]

It sends every explicit cycle to an inductive cycle and preserves scalar
L₄ periods. The group map p₄ is surjective because both groups are spanned
by the single symbols and the natural map respects them. This does not imply
surjectivity on cycle kernels. No injectivity or quasi-isomorphism is asserted.

## The precise cycle-lifting obstruction

`cycle-obstruction` makes the remaining presentation issue testable. Write
C=B₄-comb, D=B₄-ind, E=B₃-exp⊗U, J=B₃-ind⊗U, with
a=δ₄-exp, b=δ₄-ind, p=p₄ and q=p₃⊗id. Thus qa=bp and p is surjective.
Let T=ker q and let H be the image of ker p under a, regarded as a submodule
of T by the commuting square. For y∈ker b choose x with p(x)=y and define

\[
\omega(y)=[a(x)]\in T/H.
\]

Two lifts differ by an element of ker p, so this class is independent of
the lift and is linear. Its vanishing is equivalent to the existence of
an explicit cycle lift. Indeed, if a(x)=a(k) with k∈ker p, then x−k is
such a lift; a cycle lift gives vanishing directly. The kernel of ω is
therefore the image of ker a→ker b, and the kernel of that cycle map is
ker p∩ker a. Native submodules and their quotient suffice for this
construction; a new general homology theory is not planned here.

A required non-example has C=D=E=ℚ and J=0, with p=a=id and b=q=0.
Every element of D lifts as a group element, but only zero has a cycle
lift; ω(1) is nonzero. Thus group surjectivity cannot close the inductive
part-(b) gap. If q is injective, every inductive cycle lifts as a cycle,
providing a distinct positive compatibility check. A full isomorphism
B₃-exp≅B₃-ind would imply this sufficient condition, but it remains a
conjectural stronger input and is never granted here.

## The regulator interface and the numerical theorem

`weight-four-regulator-input` separates two inputs supplied by the full
explicit-complex proof. First, a natural map
κ:K₇(F)_ℚ→ker δ₄-exp must have scalar period a nonzero rational multiple
of the correctly calibrated Borel regulator. Second, the periods of **all**
explicit cycles must lie in that same rational regulator image. The second
containment is not implied by existence of κ. Neither statement says that
κ is an isomorphism. Borel's real isomorphism gives an existence witness;
its rational lattice formula, together with the containment, gives the
every-family determinant identity.

The source's Hodge period is not a pointwise scalar multiple of the parent's
L₄. In §8.2, its convention is

\[
L_4^*(z)=\frac{5L_4(z)+\tfrac13 L_2(z)\log^2|z|}{16}.
\]

The lower-weight correction must be killed on actual cycles using the
boundary and the period-map factorization. A pointwise scalar replacement
would discard a real term. The corresponding normalization issue is named
in the R.7 request, while its motivic and configuration proof belongs to
the weight-four Part II owner.

`weight-four-determinant-lifting` has two different conclusions. An
explicit nonzero rational determinant witness always pushes forward to an
inductive witness, because P preserves periods. For r₂>0 it can be
rationally normalized to exact equality. For an arbitrary inductive family,
the explicit every-family identity transfers when every column has ω=0.
Thus vanishing of ω on all inductive cycles is one sufficient missing
input. A weaker sufficient input is containment of every inductive cycle's
period in the calibrated rational K₇ regulator image, even if some cycles
do not lift. Either input would supply part (b) in that presentation.

Goncharov–Rudenko's weight-four theorem remains a published theorem. The
accepted parent's caveat concerns interpreting its part (b) with an
inductive B₃ boundary when the proof uses explicit complex (44). The packet
does not relabel the source theorem as a conjecture. It records that the
sections read do not supply the required lifting or excess-period argument,
and gives its exact obstruction and a weaker alternative. Corollary 1.15
and the nonzero Borel class alone are not used to fill this gap.

The proposed owner is **Polylogarithms, explicit regulators and Zagier
statements, Part II: weight four via motivic correlators and cluster
polylogarithms**. It refines the accepted parent proposal and starts from
P.4. Its targets are Theorems 1.13–1.14, Corollary 1.15, the flag/configuration
cocycles in Theorems 7.6 and 9.1, §9.3's regulator comparison, the cycle-level
Hodge period adapter, and the all-explicit-cycle period-image containment.
It imports the foundations already owned by MotivicEtaleKTheory M.8,
BorelRegulators R.7 and the other K-theory roadmaps. This packet does not
invent an assigned stage id or claim to have decomposed the full proof in
§§2–10.

## Finite-place residues and the homotopy conjecture

P.3's transfer consumer requires the exact weight-four hypothesis. For a
characteristic-zero field F and a monic irreducible polynomial p, write
k_p=F[t]/(p), and use v_p on F(t). `weight-four-residue-map` specifies
∂_p:Γ-ind(F(t),4)→Γ-ind(k_p,3)[−1]. Its component in degree one is zero.
In degree two it sends {f}₃⊗u(g) to v_p(g){f̄}₃ when f is a valuation
unit, and to zero otherwise. In degree three it is sp_p⊗Res_p on
B₂⊗Λ²U, and in degree four it is the parent exterior residue
Λ⁴U→Λ³U(k_p). The exterior residue puts the uniformizer first, so
Res(π∧u₁∧⋯)=ū₁∧⋯ and unit-only wedges have zero residue.

With the displayed parent differential signs these components satisfy
∂d=−d∂, which is the native cochain shift [−1]. For example, starting
from {f}₃⊗u(g) with f a unit, the residue of u(f)∧u(g) is
−v_p(g)u(f̄); this fixes the sign. The source's unsigned commuting wording
must be translated with its bicomplex convention, not copied over the
native shifted differential.

Non-rational polynomial places have residue fields different from F.
Relation descent at these places is a separate recorded gap; a specializer
at a rational point does not automatically provide it. Finite support follows
from the finite symbol and rational-function support. Constant classes have
zero residues, allowing the map to factor through the quotient by Γ(F,4)
once those descended maps and their squares are proved.

`homotopy-conjecture` is the concrete statement that

\[
\rho_4:\Gamma(F(t),4)/\Gamma(F,4)
 \longrightarrow\bigoplus_{p\text{ monic irreducible}}
       \Gamma(k_p,3)[-1]
\]

is a quasi-isomorphism. Infinity is omitted. The target has terms in degrees
2–4 and has no degree-one term. This is Goncharov 1995, Conjecture 1.39,
p. 240, at n=4. It is not installed as a Lean instance. Even under this
hypothesis, derived transfers need proofs of primitive-element independence,
tower compatibility and agreement with Milnor transfer in top cohomology.
The paragraph on p. 241 suggests independence can be proved; it does not
give such a proof. This higher homotopy input is neither a consequence of
the scalar determinant theorem nor the same comparison as GR Corollary 1.15.

## API and discriminating tests

All names below have namespace `TauCeti.Polylog.WeightFour`. Every
definition or construction uses existing mathematical objects, with native
linear maps and their extensionality. Their APIs are derived from the uses
specified above: descent, determinant normalization, explicit-cycle transfer
and finite-place residues. The suggested file includes all 47 API names and
all 32 test identifiers. It treats missing parent maps as explicit parameters
and states the necessary squares, period identities and surjectivity hypotheses.
Full source theorems requiring unavailable parent or supplier definitions are
omitted rather than represented by an unconstrained proposition. The concrete
reductions present in the file are identified in its opening note.

The prototype elaborates at the pinned Mathlib with only its expected proof
placeholder warnings. Elaboration checks the types, not the conjectures or
the source proofs. Every implementation status stays unchecked.

### Specialization of polylogarithmic complexes

| API declaration | Required behavior |
| --- | --- |
| `specializeTerm` | For sp:B→ₗ B′ and u:U→ₗ U′, specializeTerm_j=sp⊗Λ^j u. |
| `specializeTerm_tmul` | specializeTerm_j(b⊗Y)=sp(b)⊗Λ^j u(Y). |
| `specializeLast` | The terminal specialization is Λ^n u. |
| `specializeTerm_comp` | Composing two specialization pairs agrees with specialization for their composite maps. |
| `specializeTerm_id` | Identity symbol and unit maps give the identity on B⊗Λ^j U. |
| `specializeLast_wedge` | specializeLast_n(u₁∧…∧u_n)=u(u₁)∧…∧u(u_n). |

The test statements are:

- `specialize_unit_product`: At t=0, specializing {1}_3⊗(t·(2/t)) gives {1}_3⊗u(2), equal to the sum of the correctly specialized tensor factors {1}_3⊗t and {1}_3⊗(2/t).
- `specialize_uniformizer`: For parameter t, u_t(t)=0 in the additive rational unit space, hence specializeTerm_1(b⊗u(t))=0 for every b.
- `specialize_constant_tensor`: Identity maps on constant classes send b⊗(u₁∧u₂) to the same native pure tensor.
- `specialize_pole_symbol`: If sp(b)=0, specializeTerm_j(b⊗Y)=0, even when Λ^j u(Y) is nonzero.

### Polylogarithmic evaluation of rational families

| API declaration | Required behavior |
| --- | --- |
| `cycleEvaluation` | E_n(α) is the Q-linear finite-sum evaluation function. |
| `cycleEvaluation_single` | E_n(q[f],a)=q L_n(f(a)), with projective evaluation. |
| `cycleEvaluation_add` | E_n(α+β,a)=E_n(α,a)+E_n(β,a). |
| `cycleEvaluation_smul` | E_n(qα,a)=q E_n(α,a). |
| `cycleEvaluation_specialize` | E_n(α,a)=the finite-sum L_n evaluation of sp_a α. |
| `cycleEvaluation_constant` | A constant rational symbol c gives the constant function L_n(c). |

The test statements are:

- `evaluation_pole`: At t=0 the family [1/t] evaluates to L_n(∞)=0.
- `evaluation_odd_one`: At weight three the constant family [1] evaluates to ζ(3), which is nonzero.
- `evaluation_even_one`: At weight four the constant family [1] evaluates to zero.
- `evaluation_cancellation`: The family [f]+[g]−[f] evaluates to L_n(g(a)), including at a common pole.

### Rational existence in Zagier’s conjecture

| API declaration | Required behavior |
| --- | --- |
| `rationalExistence` | The concrete predicate ∃y,q∈Q, q≠0 and c det(p(y_j))=qζ. |
| `rationalExistence_of_witness` | A displayed family and nonzero rational factor establish the predicate. |
| `rationalExistence_nonzero` | When ζ≠0, obtain a family with c det(p(y_j))≠0. |
| `rationalExistence_normalize` | When d>0, rationalExistence iff ∃y,c det(p(y_j))=ζ. |
| `rationalExistence_empty` | At d=0, rationalExistence iff ∃q∈Q×,c=qζ. |
| `rationalExistence_transport` | A Q-linear equivalence M≃M′ transporting p preserves the predicate. |

The test statements are:

- `existence_empty_rational`: For d=0,c=90,ζ=1, rationalExistence is true although the empty normalized determinant is 90, not 1.
- `existence_zero_factor`: For d=1,p=0,c=1,ζ=1 the predicate is false, although the every-family identity holds with q=0.
- `existence_rank_one`: For M=Q,d=1,p(x)=x,c=2,ζ=1, the family y=1/2 establishes exact normalized equality.
- `existence_transport_test`: Replacing p by p∘e⁻¹ along a Q-linear equivalence leaves rationalExistence unchanged.

### Regulator-compatible Zagier comparison

| API declaration | Required behavior |
| --- | --- |
| `regulatorComparison` | ∃φ:M≃ₗ[Q]K,λ∈Q×, p(y)=λ A r(φ y) for all y. |
| `regulatorComparison_witness` | Recover an equivalence and its calibration equation from the predicate. |
| `regulatorComparison_forget` | The predicate implies Nonempty(M≃ₗ[Q]K). |
| `regulatorComparison_rescale` | For b∈Q×, replacing r by b r replaces λ by λ/b and preserves the predicate. |
| `regulatorComparison_injective` | If A≠0 and r is injective, a compatible p is injective. |
| `regulatorComparison_transport` | Transporting the source along a Q-linear equivalence preserves the predicate. |

The test statements are:

- `comparison_identity`: For M=K=Q,d=1,p=r the usual inclusion in R and A=1, the identity with λ=1 is a witness.
- `comparison_zero_period`: For the same nonzero r and A=1, p=0 gives no compatible comparison.
- `comparison_rational_scale`: With p=3r and A=1, the identity and λ=3 give a witness.
- `comparison_zero_spaces`: For M=K the zero Q-vector space, p=r=0 and A≠0, the unique equivalence and λ=1 give a witness.

### The explicit weight-four polylogarithmic complex

| API declaration | Required behavior |
| --- | --- |
| `explicitComplex` | Package the four specified terms and boundary maps into a native cochain complex. |
| `explicitComplex_X` | The object in degree i is the displayed term for i=1,2,3,4, and zero otherwise. |
| `explicitComplex_d` | The maps in degrees 1→2,2→3,3→4 are the three specified native linear maps. |
| `explicitComplex_first_kernel` | Since degree zero is zero, the cycle space in degree one is ker δ₄^exp. |
| `explicitComplex_map` | Field embeddings act termwise on symbols and unit exterior powers, commuting with the differentials. |

The test statements are:

- `explicit_degree_one`: The degree-one object is the supplied B₄^comb, not the whole L₄.
- `explicit_zero_outside`: The degree-zero and degree-five objects are zero modules.
- `explicit_first_boundary`: The native degree-one differential equals δ₄^exp.
- `explicit_no_extra_summand`: The degree-two term is B₃^exp⊗U; Λ²B₂ is a summand of the comparison CE complex, not of Γ_exp itself.

### Explicit-to-inductive weight-four chain map

| API declaration | Required behavior |
| --- | --- |
| `presentationMap` | The cochain map with the four displayed components. |
| `presentationMap_first` | Its degree-one component is p₄. |
| `presentationMap_second` | Its degree-two component is p₃⊗id_U. |
| `presentationMap_square` | (p₃⊗id)δ₄^exp=δ₄^ind p₄. |
| `presentationMap_cycles` | Restrict p₄ to a Q-linear map ker δ₄^exp→ker δ₄^ind. |
| `presentationMap_period` | Embedding-wise L₄ of p₄(x) equals embedding-wise L₄ of x. |

The test statements are:

- `presentation_zero_cycle`: The restricted cycle map sends zero to zero.
- `presentation_pure_tensor`: The degree-two component sends b⊗u to p₃(b)⊗u.
- `presentation_cycle_boundary`: For an explicit δ₄-cycle x, δ₄^ind(p₄x)=0.
- `presentation_top_identity`: The degree-four component is exactly the identity on Λ⁴U.

### Obstruction to lifting an inductive cycle

| API declaration | Required behavior |
| --- | --- |
| `obstructionSubmodule` | H=range of a restricted from ker p to ker q. |
| `cycleObstruction` | ω:ker b→ₗ[Q](ker q)/H, using the surjective p and its square. |
| `cycleObstruction_lift` | If p x=y and b y=0, ω(y) is the quotient class of a x. |
| `cycleObstruction_zero_iff` | ω(y)=0 iff ∃x,px=y and ax=0. |
| `cycleObstruction_image` | ker ω equals the image of the restricted explicit-cycle map. |
| `cycleObstruction_injective_target` | If q is injective, ω=0. |

The test statements are:

- `obstruction_explicit_cycle`: If ax=0, ω(px)=0.
- `obstruction_change_lift`: For k∈ker p, the quotient classes of ax and a(x+k) in T/H agree.
- `obstruction_missing_cycle`: For C=D=E=Q, J=0, p=id,a=id,b=0,q=0, the only explicit cycle is 0 but every y is an inductive cycle; ω(1) is nonzero.
- `obstruction_injective_square`: If q is injective, every inductive cycle has an explicit cycle lift.

### Weight-four residues at finite polynomial places

| API declaration | Required behavior |
| --- | --- |
| `residueTensor` | For sp:B→ₗB′ and v:U→ₗQ, residueTensor:B⊗U→ₗB′ sends b⊗u to v(u)·sp(b). |
| `residueTensor_tmul` | residueTensor(sp,v)(b⊗u)=v(u)·sp(b). |
| `residueTensor_add` | The residue is additive in the full native tensor product. |
| `residueTensor_zero_unit` | If v(u)=0, the residue of b⊗u is zero. |
| `residueTensor_comp` | Applying a linear map h to the residue equals residueTensor(h∘sp,v). |
| `residueTensor_uniformizer` | If v(uπ)=1, the residue of b⊗uπ equals sp(b). |

The test statements are:

- `residue_uniformizer`: With v(uπ)=1, the residue of b⊗uπ is sp(b), fixing the degree-two sign.
- `residue_unit`: With v(u)=0, the residue of b⊗u is zero even if sp(b)≠0.
- `residue_inverse_uniformizer`: With v(uπ)=1, the residue of b⊗(−uπ) is −sp(b).
- `residue_symbol_pole`: If sp(b)=0, the tensor residue vanishes regardless of the unit-factor valuation.

## Source record and baseline verification

The packet records URLs, editions, read sections, access date 2026-10-06 and
SHA-256 digests for five original sources. The digest identifies the exact
PDF consulted; citations do not silently move between preprint and published
pagination. Short excerpts in the packet anchor each node; the mathematical
statement and its proof dependencies remain explicit.

| Source | Version and passages read |
| --- | --- |
| [Goncharov 1994](https://sasha-goncharov.github.io/SeattleMotives.pdf) | Author's 50-page manuscript of the Proceedings contribution; §§1.4–1.5, pp. 6–9, inversion example p. 10, and §2.3 pp. 13–14. Locators use manuscript pagination. |
| [Goncharov 1995](https://sasha-goncharov.github.io/Advances1995.pdf) | Published Advances in Mathematics 114, 197–318; scan inspected visually at pp. 220–225 and 237–241. Published page is PDF page plus 196. |
| [Zagier 1990](https://people.mpim-bonn.mpg.de/zagier/files/scanned/PolylogsDedekindZetaAndKTheory/fulltext.pdf) | Published Progress in Mathematics 89, 391–430; introduction pp. 391–394 and §§7–8 pp. 410–417, including parity, polynomial normalization and final conjecture. |
| [Goncharov–Rudenko](https://arxiv.org/pdf/1803.08585v5) | arXiv v5, 15 July 2026; §§1.1–1.2 pp. 3–18, §§8.1–8.2 pp. 72–78, and §9.3 pp. 91–94. The full correlator/cluster proof in §§2–7 and §10 has not been decomposed by this P.4 pass. |
| [Suslin](https://www.maths.dur.ac.uk/users/herbert.gangl/Suslin_K3_Bloch_group.pdf) | English translation, Proceedings of the Steklov Institute (1991), issue 4, 217–239; §5 pp. 233–238, especially Theorem 5.2, Corollary 5.6 and specialization/transfer remarks. |

No source needed for the statement infrastructure was unavailable. The missing
full weight-four proof decomposition has a named owner, rather than a claim
that the corresponding sections were read in full. No separate publisher
erratum was located for the two new 1995 source issues in the inspected author
copies and correction search. The corrected derivative exponent is independently
present in the adjacent published formula and the 1994 manuscript.

The 13 cited Mathlib declaration statements were read at the pinned commit:
Finsupp.linearCombination; Submodule.liftQ; LinearMap.ker and LinearMap.range;
TensorProduct.map and TensorProduct.lift; exteriorPower.map and
exteriorPower.ιMulti; CochainComplex.of and CochainComplex.ofHom;
quasiIso_iff; Matrix.det and Matrix.det_mul. The quasi-isomorphism class is
in the root namespace; the indexed characterization is quasiIso_iff.
These references provide infrastructure, not any polylogarithmic comparison
or arithmetic theorem. The suggested file imports individual modules and
uses the actual objects they define.

## Coverage, ownership and acceptance

The four target chains are recorded in targetCoverage. The first imports the
parent relation groups and complex and adds specialization, with its exact
family-degeneration gap. The second imports the determinant and adds analytic
descent and conditional period calibration. The third imports the parent
assertions and adds rational existence, compatible comparison and their logical
relations. The fourth imports the published theorem and combinatorial symbol
span, adds Γ-exp, its presentation map and cycle obstruction, and identifies
the exact regulator-proof interface and numerical transfer.

P.4's five remaining mathematical inputs are:

1. Relation preservation under specialization of degenerating two-variable
   rational-curve kernel families, in the exact parent model.
2. The explicitly owned weight-four correlator, flag cocycle, Hodge-period
   adapter and all-explicit-cycle regulator-image containment proof.
3. Vanishing of the inductive cycle obstruction, or the weaker calibrated
   period-image containment for every inductive cycle.
4. Finite-polynomial-place symbol descent, finite support and native signed
   residue chain squares through the inductive quotients.
5. The weight-four homotopy conjecture and, separately, primitive-element,
   tower and Milnor compatibility for conditional derived transfers.

The three precise supplier requests retain their existing owners:
K3BlochGroups V.4 for Suslin rational-function invariance and compatible
specializations; BorelRegulators R.7 for scalar polylogarithm versus Tate-divided
Borel normalization, including the cycle-level L₄* correction; and
SchemeKTheoryOperations S.6 for the number-field Adams purity adapter.
The packet proposes Part II exports where these are missing and imports the
existing exact-sequence, regulator and operations nodes. It does not recreate
motivic categories, valuations, Deligne complexes or general K-theory.

There are two new planets: **Higher polylogarithmic functional relations** and
**Explicit weight-four polylogarithmic complex**. Together with the four parent
P.4 planets this gives six. The cycle obstruction is a necessary construction
and acceptance test, not a seventh planet. The assembly must preserve the
three parent correction notes: rank existence needs rationality before exact
rescaling; the weight-four explicit/inductive presentation boundary remains
visible; and the rational-curve quotient is not equated with the all-smooth-curve
quotient without a proof.

Acceptance requires the following checks in addition to the per-object tests:

- Every defining relation has an exact field/curve model and endpoint
  convention, and specialization acts linearly on the full tensor product.
- The analytic cycle proof differentiates only away from a finite bad set and
  uses continuity for the global statement; its final exponent is n−2.
- The Suslin input is rational-function invariance on the Bloch kernel with
  compatible retractions, and the V.3 boundary sign is retained.
- Rational existence has a nonzero rational factor; every-family rationality
  permits zero; the empty determinant test for ℚ has factor 90.
- The period calculation includes πⁿ⁻¹ in each Tate-divided coordinate and
  imports number-field purity instead of conflating the graded and full K-groups.
- Γ-exp uses the explicit B₃ presentation and exactly the four displayed
  terms. Group surjectivity never replaces cycle surjectivity.
- The all-cycle regulator image condition is separate from κ's existence.
  Source theorem status and missing proof inputs are stated separately.
- Finite-place homotopy omits infinity, has the correct shift sign, and remains
  a concrete conjectural quasi-isomorphism hypothesis.

The packet checker passes with zero errors and zero warnings, including the
pinned declaration index. The suggested file elaborates with only proof
placeholder warnings. These checks establish consistency and type correctness
of the proposed signatures; independent mathematical review remains required.
