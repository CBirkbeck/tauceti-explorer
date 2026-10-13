# Integral forms on definite quaternion algebras — R18.3

This layer builds integral coefficient-function spaces on a finite quaternionic
class set. Finite isotropy explains both small-level base change and its failure
at arbitrary dyadic levels. The geometric Taylor–Wiles outputs concern an already
specified set of primes: diagonal levels, free diamond fibres, their integral
group-algebra module, selected-root control and quadratic norm twists. Prime
choice, deformation rings and patching consume these results.

The targets cover the class set, weights, integral forms, pairing, Hecke
normalization, norm branch, degeneracy, characteristic-zero comparison,
isotropy bounds, base-change annihilators, Taylor–Wiles levels and stabilisers,
freeness, localized control, dyadic twists, sign extensions and residual
Hecke ideals. Generic algebraic modular forms, their coefficient lattices
and Hecke actions are imported from their owning layers. The statements
below are mathematical targets with explicit prerequisite contracts.

## Conventions and existing foundations

Let \(F\) be totally real of even degree and \(D/F\) ramified at every real place.
Let \(\Sigma\) denote its finite ramification set, \(p\) a rational prime,
\(\mathcal O\) the integers of a finite extension of \(\mathbb Q_p\), \(K\) its
fraction field and \(k\) its residue field. The coefficient lattice \(W\) is
finite free over \(\mathcal O\). Write \(k_0\geq2\) for the parallel weight.
Fix local splitting identifications wherever matrix operators occur.

Put \(D_f^\times=(D\otimes_F\mathbb A_{F,f})^\times\) and
\(Z_f=\mathbb A_{F,f}^\times\). A continuous character
\(\psi:Z_f/F^\times\to\mathcal O^\times\) and coefficient action \(\tau\)
satisfy \(\tau(z)=\psi(z)^{-1}\) on \(U\cap Z_f\). Extend \(\tau\) to \(UZ_f\)
by \(\psi^{-1}\) on the centre. The transformation laws are
\(f(gu)=\tau(u)^{-1}f(g)\) and \(f(gz)=\psi(z)f(g)\).
Right translation is \(R_hf(g)=f(gh)\). At a good split place use
\(T_v=[U\operatorname{diag}(\varpi_v,1)U]\) and
\(S_v=[U\operatorname{diag}(\varpi_v,\varpi_v)U]\).
Then \(S_v=\psi(\varpi_v)\) and the arithmetic Frobenius polynomial is
\(X^2-T_vX+q_vS_v\), where \(q_v=\#k_v\).

Compact open \(U=\prod U_v\) is the default. The weight-two dyadic variant can
have full \(D_v^\times\) at specified finite division factors, each compact
modulo its scalar centre. Its coefficient extensions are part of the data.
All stabilisers are effective quotients by scalars; the full group
\(UZ_f\cap t^{-1}D^\times t\) is not asserted finite.

AdelicAlgebraicGroups owns the general class-number theorem AA.3, strong
approximation for \(D^1\) at a split noncompact factor AA.4, and neat levels AA.4.
The definite AA.5 example over \(\mathbb Q\) is not the general totally real
theorem. AF.4 owns coefficient lattices, weights, duals and rational structures.
AF.5 owns generic coefficient-function forms, evaluation, Hecke operators and
change of level. It must include fixed central character modulo \(Z_f\), with
effective stabilisers: its discrete rational centre hypothesis excludes fields
with positive unit rank.

Mathlib supplies DoubleCoset.Quotient, DoubleCoset.eq, Representation,
Representation.invariants, Module.Free, Module.Finite, MonoidAlgebra and
LinearEquiv. Tau Ceti's QuaternionAlgebra.normForm_coe gives square scalar norm;
NumberField.card_elementaryTwoQuotient_units supplies the unit square-class
cardinality. Current Tau Ceti also supplies generic Hecke sums. None of these
carriers or theories is reconstructed here. Integral semigroup coefficients and
the fixed-central-character extension remain AF.5 supplier contracts.

## Class sets, coefficients and evaluation

**DefiniteClassSet** specializes the existing double-coset quotient to
\(C_U=D^\times\backslash D_f^\times/(UZ_f)\). It is finite. At a representative
\(t\), define
\(\Gamma_t=(UZ_f\cap t^{-1}D^\times t)/F^\times\), a finite effective group
acting on \(W\). Representative changes transport this group, its invariant
coefficients and evaluation. The API provides quotient projection and equality,
finiteness, stabiliser, conjugate transport, and evaluation compatibility.
These maps support level changes and diamond-fibre calculations.

Check that real quadratic central units are infinite before the effective
quotient; that \(\Gamma_t=1\) contributes all of \(W\); and that \(t\) and
\(dtu z\) define the same class with transported coefficient data. These tests
exclude a false finite full stabiliser and an evaluation map that depends on
representatives. The class-set input is AA.3, and the effective evaluation
convention is KW §7, pp.57–59, formula (5).

**QuaternionWeight** specializes AF.4 to the tensor over embeddings of
\(\operatorname{Sym}^{k_0-2}(\mathcal O^2)\), of rank
\((k_0-1)^{[F:\mathbb Q]}\). Its scalar action is the relevant
\((k_0-2)\)-norm power. The character \(\psi\) must match this inversely on scalar
level elements. Use actual split identifications at active \(p\)-places;
division places above \(p\) require weight two in the source application.
The semigroup action for Hecke operators is a separate part of the AF.4 contract.

Its API includes the tensor data and basis, rank, central action, coefficient
extension with identity/composition, weight-two identification, and dual pairing
with its norm similitude. Evaluation, Hecke operators and the complex weight
comparison use these maps. Checks: weight two has rank one; degree two and
weight four have rank nine; the derivative-normalized \(\operatorname{Sym}^2\)
pairing has determinant \(\pm4\) and is not perfect over \(\mathbb Z_2\).
The last check rules out unrestricted integral duality.

**DefiniteSpecialisation** identifies AF.5's actual fixed-central-character space
\(S_{\tau,\psi}(U,A)\) with
\(\bigoplus_{t\in C_U}(W\otimes A)^{\Gamma_t}\) by evaluating at \(t\).
Invariant values recover functions using rational invariance and the right
transformation laws. Stabiliser invariance makes recovery well defined.
This is a specialization of AF.5, not another generic form carrier.
KW formula (5), pp.58–59, and Taylor pp.737–738 pin its conventions.

**NeatnessBaseChange** assumes each \(|\Gamma_t|\) is a unit in \(\mathcal O\).
Then \(S(U,\mathcal O)\) is finite free and
\(S(U,\mathcal O)\otimes A\to S(U,A)\) is an isomorphism for every
\(\mathcal O\)-algebra \(A\). Averaging splits invariants; finite projective
modules over the local ring are free. Taylor Lemma 1.1 and Corollary 1.2,
pp.738–739, establish automatic prime-to-\(p\) isotropy when \(p>3\), \(p\) is
unramified in \(F\), and \(D\) is split at every finite place. That automatic
conclusion is not extended to arbitrary \(F,D\).

The supporting **exists_effectiveNeatLevel** chooses an actual small compact
\(U'\subset U\), without changing \(F\). Use a neat compact open subgroup of
\(\mathrm{PGL}_1(D)(\mathbb A_f)\) from AA.4 and an open compact subgroup in
its inverse image. Each finite effective \(\Gamma_t(U')\) injects into a neat
torsion-free arithmetic subgroup, so it is trivial. Evaluation gives finite
direct sums of \(W\) and arbitrary base change even at \(p=2\).
Neatness must control the projective quotient, not leave unexamined central
stabilisers. This theorem gives no field-degree bound. The distinct field
extension/smallness statement in Khare's Duke Lemma 2.2 remains an exact source
obligation; its conclusion cannot be inferred from choosing \(U'\).

## Liftable reduction and pairing

**LiftableReductionImage** names an application of existing invariant-submodule
and image operations:
\(L_t=\operatorname{im}(W^{\Gamma_t}\otimes k\to W_k^{\Gamma_t})\).
The map is injective because \(W^{\Gamma_t}\) is saturated in \(W\):
the invariance equations have torsion-free target. Evaluation identifies the
image of \(S(U,\mathcal O)\otimes k\to S(U,k)\) with \(\bigoplus L_t\).
The global statement is part of the target, not just a pointwise definition.

The API gives inclusion; membership as the existence of an integral invariant
lift; reductionInjective; unitIsotropy, identifying full invariants when averaging
is possible; transport under coefficient intertwiners with identity/composition;
and globalEvaluation compatible with representative transport. These operations
are used by the coefficient-twist comparison.

Four checks discriminate this image from residual invariants. The sign action of
\(C_2\) on \(\mathbb Z_2\) has zero integral invariants, but all of
\(\mathbb F_2\) is invariant after reduction. The trivial \(C_2\) action has
full liftable image despite nonunit group order. For \(C_3\) over
\(\mathbb Z_2\), averaging makes every residual invariant liftable. The direct
sum of trivial and sign \(C_2\) characters has liftable dimension one and residual
invariant dimension two. KW Lemma 7.4(1), pp.64–65, compares reduction images;
it does not assert unrestricted surjectivity onto residual forms.

**IntegralPairing** assumes a perfect coefficient pairing with its stated norm
similitude and central compatibility, and unit stabiliser orders. The global
sum on evaluation components is weighted by
\(|\Gamma_t|^{-1}\psi(\operatorname{Nrd}t)^{-1}\).
It is representative independent and perfect; the adjoint of \([UgU]\) is
\(\psi(\operatorname{Nrd}g)[Ug^{-1}U]\).
Neither nonunit denominators nor a nonperfect coefficient pairing may be removed.
Taylor pp.739–742 specifies the pairing and its perfect range
\(2\leq k_0\leq p+1\) in the stated local setup.
Check ordinary coefficient duality when \(\Gamma_t=1\), the scalar adjoint
factor, and failure of the weight-four pairing over \(\mathbb Z_2\).

## Norm forms, degeneracy and spectral comparison

**SplitHeckeNormalisation** specializes generic Hecke sums to \(T_v,S_v\).
It fixes the constant coefficient \(q_vS_v\) in the arithmetic polynomial.
Defining these double cosets requires no global transfer.

The weight-two **NormBranch** consists of functions factoring through Nrd,
with trivial coefficient action. For finite residual coefficient action first
pass to an open subgroup killing that action. The KW Eisenstein condition is
that, outside finitely many places splitting completely in a suitable finite
abelian extension, the residual operators satisfy \(T_v=2,S_v=1\).
Norm forms vanish after localization at a non-Eisenstein ideal.
The proof uses AA.4 strong approximation for \(D^1\) and then the norm quotient,
rather than global transfer. This is the ingredient of KW Lemma 7.1, p.60.

**DefiniteDegeneracy** is that lemma: at a split \(w\nmid p\), hyperspecial
\(U_w\), and trivial residual coefficient action there, the pair of residual
degeneracy maps to Iwahori level has Eisenstein kernel, hence is injective after
non-Eisenstein localization. Exclude \(w\) from the away-place Hecke algebra.
A kernel vector is invariant under additional \(\mathrm{SL}_2(F_w)\)
translations, and strong approximation forces it to factor through Nrd.
The statement is over the residual field with these coefficient hypotheses.
It supplies neither indefinite Ihara nor arbitrary-ring integral saturation.

The supporting **finiteQuaternionJL** is the degree-two classical local
correspondence at a nonarchimedean division place. It bijects irreducible
admissible \(D_v^\times\) representations with essentially square-integrable
\(\mathrm{GL}_2(F_v)\) representations, preserves central characters and twists,
and gives opposite distribution characters on matching regular elliptic classes.
An unramified \(\kappa\circ\operatorname{Nrd}\) transfers to
\(\mathrm{St}\otimes(\kappa\circ\det)\).
Use the actual split isomorphism at split places. SR supplies smooth/admissible
representations, normalized induction, square-integrable representations and
Steinberg, with the requested character/elliptic-orthogonality extension.
Jacquet–Langlands Theorem 15.1, p.239, identifies the image; Theorems 14.2 and
14.4, pp.232,238, give the character construction.
Check a compact-fixed division character transfers to Steinberg; a generic
unramified principal series is outside this classical division image.

**realQuaternionWeightJL** matches the \(\mathrm{SU}(2)\)-type
\(\operatorname{Sym}^{k_0-2}(\mathbb C^2)\) with real essentially discrete series
of weight \(k_0\), retaining the norm twist needed to match central characters.
The function realization uses the dual coefficient type prescribed by the
inverse right transformation law. Badulescu–Renard Remark 9.6, pp.18–20, and
§13.1, p.32, match the parameters; Taylor Lemma 1.3, pp.741–742, pins the
function realization; Carayol §0.10, p.412, retains its norm twist.
Weight two has coefficient dimension one and transfers to discrete series of
weight two, not principal series. Weight four has dimension three and transfers
to weight four. Transport the algebraic \(p\)-adic norm factors when passing
\(\psi\) to the complex central character.

**quaternionicSpectralTransfer** supplies the characteristic-zero comparison
used by DefiniteJl. The classical global comparison takes quaternionic
automorphic representations of dimension greater than one to cuspidal
\(\mathrm{GL}_2\) representations essentially square-integrable at ramified
places. Split components agree and multiplicity one is preserved. Its
degree-two quaternionic statement also serves the early curve comparison.
Use the lower-tier discrete spectrum and trace-formula comparison with matching
functions at real and finite places, and the two local targets above.
The matching contracts are explicitly requested from AS.4 and AS.6.

Badulescu–Renard Theorem 18.1 and Proposition 18.2, author pp.44–45, give a
proved global discrete transfer and its cuspidal classification with ramified
real places. The extended transfer also handles residual \(\mathrm{GL}_2\)
representations, so its full image cannot be called cuspidal.
The classical local restriction and exclusion of norm characters are necessary.
Jacquet–Langlands Theorem 16.1, pp.252–254, describes a conjectural converse
proof; it is not used alone to justify that converse.

For definite \(D\), take the fixed-level multiplicity spaces with AF.4 weight
transport. The resulting **DefiniteJl** decomposition of \(S(U,K)\) modulo norm
forms, after extension to \(\mathbb C\), is split-Hecke equivariant.
Taylor Lemma 1.3 checks the all-finite-split instance.
AF.4 must supply actual rational multiplicity models and scalar extension,
not just complex eigenvalues. No equality of integral quaternionic and Hilbert
lattices is asserted. Check the constant weight-two norm form is removed and
the split Hecke polynomial is unchanged. Integral congruences between cusp
and norm forms do not yield an integral direct-sum decomposition.

## Isotropy bounds and auxiliary levels

**IsotropyExponent** bounds the Sylow-\(p\) exponents of effective stabilisers
uniformly in \(t\) and allowed levels. Choose a split auxiliary \(w\nmid p\)
with the stated compact local control, and put
\(N_w=|\mathrm{GL}_2(k_w)|\). The compact bound is \(2N_w\); with the KW full
division factors it is \(4N_w\). The norm-one kernel is controlled at \(w\)
by reduction to a finite matrix group. Only its \(p\)-subgroups must inject
through reduction: the reduction kernel is pro-\(\operatorname{char}(k_w)\),
not necessarily trivial.

The norm map gives a left-exact sequence from the norm-one kernel modulo
\(\{\pm1\}\), through \(\Gamma_t\), to
\(B=((Z_f)^2V\cap F^\times)/(F^\times)^2\), with
\(V=\prod_{v<\infty}\mathcal O_v^\times\). It is not asserted surjective onto
\(B\). The latter fits in
\(0\to\mathcal O_F^\times/(\mathcal O_F^\times)^2\to B\to\mathrm{Cl}(F)[2]\to0\).
Its exponent two explains the extra compact factor, and the division parity
quotients account for the full-level variant. KW §7.2, pp.61–62, formulas
(6)–(7), give these effective sequences. Tau Ceti supplies the unit square-class
cardinality. Check that central units disappear in the effective quotient and
the bound survives transport of representatives.

**BaseChangeAnnihilator** concerns a given totally real \(F'/F\) with \(w\)
completely split and the prescribed local residue-field divisibility.
Choose \(\chi_0\) of order the \(p\)-part of \(2p(4N_w)\), and set
\(\chi=\chi_0^{4N_w}\). It kills all effective stabilisers and has order \(p\)
for odd \(p\), four for \(p=2\). Its triangular-level action uses the diagonal
ratio \(a/d\). KW Lemma 7.3, pp.62–63, proves this from the uniform bound.
Global auxiliary field choice belongs to its consumer. Check the exact local
character order and complete splitting before applying the theorem.

**QuaternionTWLevel** accepts an exponent bound \(N=p^b\) and a finite \(Q\)
away from the bad set \(S\), with \(D\) split, \(U_v\) hyperspecial and
coefficients trivial at \(Q\). Require \(q_v\equiv1\pmod{p^n}\), \(n\geq1\).
Put \(\Delta'_v\) equal to the maximal \(p\)-power quotient of \(k_v^\times\)
and \(\Delta_v=\Delta'_v/\Delta'_v[N]\). The denominator is the subgroup
killed by \(N\), not the subgroup of \(N\)th powers.
Let \(U^0_{Q,v}\) be the Iwahori and \(U_{Q,v}\) the kernel of
\(a/d\to\Delta_v\), leaving the other factors unchanged.
Then \(U_Q^0/U_Q\simeq\Delta_Q=\prod_{v\in Q}\Delta_v\).
Scalars have ratio one, so the quotient respects the centre.

The API gives diamondGroup, projection from residue units, quotient, normal
level kernel, the quotient isomorphism, right diamond action, and changeQ for
subsets, with identity/composition and projection compatibility.
KW Lemma 7.4 and Corollary 7.5, pp.63–66, use these operations.
Checks: \(Q=\varnothing\) gives unchanged level and trivial diamonds;
\(C_8/C_8[2]\) is \(C_4\); quotienting by squares instead gives \(C_2\).
The last two computations distinguish the source quotient from the tempting
incorrect power quotient.

**TwStabilisers** says every character of \(\Delta_Q\), over a
sufficient coefficient extension, kills the effective stabilisers at \(U_Q^0\).
As a character of \(\Delta'_Q\) it is an \(N\)th power, while all Sylow-\(p\)
stabiliser exponents divide \(N\). Characters separate the finite abelian
\(p\)-quotient. Thus the stabilisers at \(U_Q\) and \(U_Q^0\) agree, and every
class-set fibre is a free transitive diamond orbit. KW Lemma 7.4, pp.64–65,
does not require those stabilisers themselves to be trivial.

The supporting **twTwist_commonLiftableImage** makes the coefficient comparison
precise. For each \(\chi:\Delta_Q\to\mathcal O^\times\), enlarge \(\mathcal O\)
to contain all character values. Evaluation at the same representatives
identifies every twisted integral module with the same
\(\bigoplus W^{\Gamma_t}\). Integral identifications need not intertwine Hecke.
Their reduction images are identical and Hecke stable since \(p\)-power
character values reduce to one. These are the liftable subspaces, not all
residual forms. The sign example above remains a counterexample to the latter
assertion. For empty \(Q\) the comparison is the identity.

**TwFreeness** gives
\(S(U_Q,\mathcal O)\simeq\mathcal O[\Delta_Q]^{r_0}\), where
\(r_0=\operatorname{rank}_{\mathcal O}S(U_Q^0,\mathcal O)\).
Evaluation on free fibres gives the regular representation tensored with each
\(W^{\Gamma_t}\). Those invariant lattices are finite free over a DVR, even
when their group orders are nonunits. Freeness does not imply arbitrary base
change of invariants. A diamond-equivariant localized direct factor is
projective over the local ring \(\mathcal O[\Delta_Q]\), hence free.
KW Lemma 7.4(2) and Corollary 7.5, pp.64–66, give these conclusions.
The rank is a group-algebra rank; multiply by \(|\Delta_Q|\) only when
converting to an \(\mathcal O\)-rank.

## Selected roots and localized control

The supporting **iwahori_selectedRoot** fixes the local normalization.
For an irreducible unramified normalized principal series with inducing
characters \(\chi_1,\chi_2\), the Iwahori fixed space has dimension two, with
\(U_v\)-eigenvalues \(a=q_v^{1/2}\chi_1(\varpi_v)\) and
\(b=q_v^{1/2}\chi_2(\varpi_v)\). Its polynomial is
\((X-a)(X-b)=X^2-T_vX+q_vS_v\). The square root is chosen in a coefficient
extension for normalized induction; the actual double-coset conventions are
independent of that choice. SR.2's normalized induction and Iwahori/Jacquet
comparison supply the existing substrate. Taylor Lemma 1.6(2), pp.744–745,
calculates the vectors, \(U\)-eigenvalues and diagonal character action.

In the completed local Hecke algebra, distinct residual roots
\(\alpha_v,\beta_v\) lift by Hensel to \(A_v,B_v\).
Their difference is a unit and separates the summands integrally.
The selected-root map in the right-translation convention is
\(\xi_v(f)=A_vf-R_{\operatorname{diag}(1,\varpi_v)}f\).
Taylor Lemma 2.2, pp.746–747, and KW pp.65–66 give this formula and its
degeneracy matrix. An arbitrary lift with no root identity cannot replace
\(A_v\). Coincident residual roots do not give integral complementary projectors.
For example, roots 1 and 2 in \(\mathbb F_3\) separate, while two roots 1 do not.

The supporting **quaternionEigenformGaloisCompatibility** is the early
rank-two eigensystem target. For each characteristic-zero non-norm eigenform
of algebraic parallel weight, construct a continuous rank-two Galois
representation after finite coefficient extension and a stable integral lattice.
At good split \(v\nmid p\), its arithmetic Frobenius polynomial is
\(X^2-T_v(f)X+q_vS_v(f)\). At Steinberg places away from \(p\), its
Frobenius-semisimplified Weil–Deligne representation is special; for an
unramified automorphic twist the local semisimplification is
\(\varepsilon_p\gamma_{v,f}\oplus\gamma_{v,f}\), with \(\gamma_{v,f}\)
unramified. At division places above \(p\), weight-two semistable compatibility
with the same determinant is another precise component of the target.
This does not realize an arbitrary abstract residual polynomial evaluation
as an automorphic eigensystem.

The construction must use early cohomology and spectral comparison before
Taylor–Wiles control. In the finite-discrete-series case, extract the
rank-two Hecke eigensummand from genuine quaternionic curve cohomology and
apply Carayol Theorem A, §§0.3–0.7, pp.409–411, away from \(p\).
Translate its geometric Frobenius and contragredient convention (§0.5)
to our arithmetic polynomial. At even degree Carayol requires a finite
essentially square-integrable component. For even degree with no such
component, Taylor's congruence/pseudorepresentation extension must supply
the construction; its exact proof remains a source obligation.
The \(v\mid p\) statement needs the precise PadicHodgeTheory geometric
semistable comparison. Neither follows by deleting Carayol's hypotheses.
KW Lemma 7.2 and the proof of Corollary 7.5, pp.60–61,66, identify these inputs.

The supporting **steinberg_distinctResidualRoots_impossible** isolates the
arithmetic obstruction. Let \(v\nmid p\), \(q_v\equiv1\pmod p\), and let a
stable lattice have unramified residual semisimplification with two distinct
Frobenius roots. If its local characteristic-zero semisimplification were
\(\varepsilon_p\gamma\oplus\gamma\), with \(\gamma\) unramified, its residual
polynomial would have the repeated root
\(\overline{\gamma(\mathrm{Frob}_v)}\). This is impossible.
Local compatibility therefore excludes such Steinberg components from the
given residual eigensystem. Without the congruence on \(q_v\), the special
roots can be distinct. A genuine stable lattice and the special local
Galois shape are substantive inputs to this argument.

**TwLocalisedControl** combines free diamonds, the Iwahori root
calculation, characteristic-zero rank equality from Steinberg exclusion,
and residual injectivity from definite degeneracy.
Assume an actual non-Eisenstein acting eigensystem with residual representation
unramified at \(Q\) and distinct roots there. The early Galois target supplies
the compatible characteristic-zero lifts. The product of the \(\xi_v\)
maps gives \(S(U,\mathcal O)_{\mathfrak m}\simeq
S(U_Q^0,\mathcal O)_{\mathfrak m}\).
Residual injectivity kills the integral cokernel once the characteristic-zero
ranks agree. Thus \(S(U_Q,\mathcal O)_{\mathfrak m}\) is free over
\(\mathcal O[\Delta_Q]\), with rank
\(\operatorname{rank}_{\mathcal O}S(U,\mathcal O)_{\mathfrak m}\),
and diamond coinvariants give the original module.
The Hecke map sends diamonds to one, \(U_v\) to \(A_v\), and away-place
\(T_v\) to \(T_v\). This is KW Corollary 7.5, pp.65–66, with its exact
local–global input exposed. Patching is not used to prove its own geometric input.

## Division factors and ramified signs

The construction **DivisionParityCharacter** supplies the coefficient action
at a full division factor. For a quaternion division algebra over \(F_v\),
normalize \(\nu_D=v_v\circ\operatorname{Nrd}:D_v^\times\to\mathbb Z\).
It is surjective, its kernel is \(\mathcal O_{D_v}^{\times}\), and its value
on a scalar \(z\) is \(2v_v(z)\). Consequently
\(D_v^\times/(F_v^\times\mathcal O_{D_v}^{\times})\simeq\mathbb Z/2\mathbb Z\).
This follows from the index-two division valuation, not from regarding a
division uniformizer as a scalar uniformizer. Platonov–Rapinchuk–Rapinchuk,
§1.4.2, pp.31–33, equation (1.16), gives the valuation and uniformizer input;
the scalar norm identity already belongs to Tau Ceti.

Assume \(\psi_v\) is unramified. Choose a division uniformizer \(\Pi\) and
\(r\in\mathcal O^\times\) with
\(r^2=\psi_v(\operatorname{Nrd}\Pi)^{-1}\), extending coefficients finitely
if required. Then \(\tau_r(g)=r^{\nu_D(g)}\) is trivial on
\(\mathcal O_{D_v}^{\times}\) and acts on scalars by \(\psi_v^{-1}\).
Its right-translation eigenvalue at \(\Pi\) is \(r^{-1}\), because our form
transformation law uses the inverse coefficient action.
The API exposes valuation and its kernel through valuation, the effective parity
quotient through effectiveQuotient, evaluation through apply, scalar action
through central, and the two-root classification through classify.
changeCoefficients transports along coefficient maps with identity and composition;
dyadicReduction identifies the two reductions when \(p=2\).
These are used to specify the full division-level form space and to identify
the unramified Galois character in local compatibility.

Check trivial \(\psi_v\): the two uniformizer values are \(1,-1\).
Over a coefficient ring such as \(\mathbb Z_3\), a value
\(\psi_v(\operatorname{Nrd}\Pi)=4\) instead requires \(r=1/2\) or \(-1/2\);
\(r=1\) fails central compatibility. A scalar uniformizer has valuation two
and acts by \(r^2\). Over \(\mathbb Z_2\), the choices \(1,-1\) are distinct
integrally but coincide over \(\mathbb F_2\). These four checks distinguish
parity, the central character and reduction from an arbitrary sign function.

The accepted **DyadicSignExtension** applies this construction at a
specified finite set \(\Sigma'\) of division places. Fix one compatible root
at each place. Changing its sign yields \(2^{|\Sigma'|}\) extensions, all with
the same dyadic reduction. Their API restricts to the original compact action,
changes the chosen sign, preserves the central character, and identifies
reductions through the identity on the coefficient lattice. The tests are:
the empty set gives one extension; one place gives two different integral
actions with the same reduction; and a nontrivial central character requires
the chosen roots rather than arbitrary values \(1,-1\).
For KW's weight-two dyadic sign-control statement, take full \(D_v^\times\)
at **every** \(v\in\Sigma\), not just the division places above two.
KW §7 opening, pp.57–59, and Lemma 7.2 and its remark, pp.60–61, specify this.

The supporting theorem **ramifiedSign_independentOfEigenform** fixes the
unramified character throughout a localized eigensystem, subject to an explicit
identifiability hypothesis. Assume an actual non-Eisenstein acting maximal
ideal whose characteristic-zero eigenforms have the same residual
representation, early local–global compatibility, and unramified \(\psi_v\)
at \(\Sigma\). Take compact division units when \(p>2\), full division factors
when \(p=2\); take weight two in the dyadic case and require
\(\Sigma\cap\{v\mid p\}=\varnothing\) in larger weight.
Local compatibility gives
\(\left(\begin{smallmatrix}\varepsilon_p\gamma_{v,f}&*\\0&\gamma_{v,f}\end{smallmatrix}\right)\)
with unramified \(\gamma_{v,f}\) and \(\gamma_{v,f}^2=\psi_v\).
Its Frobenius value is the inverse division-uniformizer eigenvalue.

For odd \(p\) and \(v\nmid p\), require either \(1+q_v\ne0\) in the residue
field or that the common residual local representation is ramified.
In the first case its trace distinguishes the two roots; in the second,
nonzero unipotent inertia singles out the invariant line and unramified
quotient character. At \(v\mid p\), retain the assumption that \(p\) is
unramified in \(F\); the nontrivial residual cyclotomic inertia character
distinguishes the two diagonal roles. Distinct characteristic-zero roots
remain distinct on reduction for odd \(p\). For \(p=2\), the fixed full-level
coefficient extension fixes the integral eigenvalue itself.
The resulting \(\gamma_v\) is common to the eigenforms; the upper-right
extension class can still vary.

There is an unresolved qualification in the unrestricted odd-prime claim of
KW Lemma 7.2(i), proof p.61. If \(q_v\equiv-1\pmod p\) and the residual local
representation is unramified, opposite signs give the same unordered
Frobenius pair. In \(\mathbb F_3\), both choices give \(\{1,-1\}\).
Thus the local residual argument alone does not identify the sign.
This is a candidate gap in that inference, not an exhibited global
automorphic counterexample. A proof of the unrestricted statement must give
additional global information or a ramified Hecke operator which distinguishes
the signs. The safe target above records the needed hypothesis.

## Dyadic norm twists and residual Hecke ideals

The accepted **DyadicNormTwist** is multiplication by a quadratic norm
character. Let \(p=2\), let \(Q\) be the prescribed good auxiliary places,
and let \(\chi\) be a quadratic idele class character split at the prescribed
bad and infinite places and unramified outside \(Q\). Require
\(\chi(\operatorname{Nrd}U_Q)=1\). Then
\[
 (T_\chi f)(g)=\chi(\operatorname{Nrd}g)f(g)
\]
defines an integral linear automorphism of the same weight-two form space.
It preserves the central character because a scalar has norm \(z^2\),
and \(T_\chi^2=1\). Its reduction is the identity, since values \(1,-1\)
coincide in characteristic two. The API consists of evaluation,
involutivity, central compatibility and reduction compatibility.
Check that the trivial character gives the identity, a central scalar
cannot change the character, and a character of order four can change
the central character and so fails this definition.
KW §7.5, pp.66–67, Proposition 7.6, provides the use in changing residual
Taylor–Wiles data without changing integral ranks.

The supporting **dyadicLevel_det_isSquare** proves the level condition rather
than assuming all auxiliary matrices have square norm. Write the common
stabilizer exponent bound as \(N=2^b\), and suppose
\(a=v_2(q_v-1)\ge n>b\) for each \(v\in Q\). In
\(\Delta'_v=C_{2^a}\), the kernel of
\(\Delta'_v\to\Delta'_v/\Delta'_v[N]\) is generated by the
\(2^{a-b}\)-th power of a generator, hence consists of squares.
The odd part of \(k_v^\times\) also consists of squares. For an Iwahori
matrix with diagonal entries \(a_v,d_v\), the determinant modulo \(v\) is
\((a_v/d_v)d_v^2\). Its ratio lies in this kernel, so the determinant is
a square. Quadratic characters unramified outside \(Q\) are trivial on
compact unit norms elsewhere; their specified splitting handles the full
division factors. Thus \(\chi(\operatorname{Nrd}U_Q)=1\).
The cyclic quotient convention is KW §7.4, pp.63–64; the determinant
application is §7.5, p.66.

Check \(C_8,N=2\): the kernel is \(\{0,4\}\), inside its square subgroup
\(\{0,2,4,6\}\) in additive notation. The edge case \(N=1\) gives trivial
kernel and still works. By contrast \(C_2,N=2\) has the whole group as
kernel, including a nonsquare. The strict inequality on the exponents is
therefore essential.

The accepted **DyadicHeckeTwist** is a direct double-coset
calculation. At a split place where the character is unramified,
\[
 T_vT_\chi=\chi(\varpi_v)T_\chi T_v,\qquad
 S_vT_\chi=T_\chi S_v.
\]
The same formula holds for \(U_v\) at an auxiliary Iwahori place.
For right translation,
\((R_h f)_\chi=\chi(\operatorname{Nrd}h)^{-1}R_h(f_\chi)\).
Every residual Hecke eigenvalue is unchanged at \(p=2\), so the maximal
ideal and localization are preserved; integral linear equivalence transports
ranks. Diamond characters are transported by the displayed scalar factor.
If that factor is nontrivial, a twisted coinvariant quotient is transported;
one cannot silently identify it with untwisted augmentation coinvariants.
This calculation requires neither Galois representations nor localized
Taylor–Wiles control. Its checks are an away-place norm \(\varpi_v\), a
central norm \(\varpi_v^2\), and the inverse scalar in right translation.
KW Proposition 7.6, pp.66–67, uses these identities.

The accepted **ResidualHeckeIdeal** separates an abstract polynomial
evaluation from an automorphic realization. For a given residual
representation \(\bar\rho\) unramified at the good places, map the polynomial
Hecke algebra over \(\mathcal O\) to \(k\) by
\[
 T_v\longmapsto\operatorname{tr}\bar\rho(\mathrm{Frob}_v),\qquad
 S_v\longmapsto q_v^{-1}\det\bar\rho(\mathrm{Frob}_v).
\]
The coefficient map \(\mathcal O\to k\) is surjective, so its kernel is
maximal. To descend to the actual acting Hecke algebra, require its relations
to lie in this kernel, equivalently a specified factoring eigensystem.
An abstract residual representation does not supply that hypothesis.
The API evaluates both generators, identifies the maximal kernel, and
descends along the acting-algebra quotient under the explicit relation
hypothesis. These operations use the generic AF.5 Hecke algebra and the
existing quotient and residue-field algebra; the actual eigensystems in
KW §7.4, pp.65–66, are the motivating application.

Check over \(\mathbb F_7\) that \(q_v=3\) and determinant 6 give \(S_v=2\).
The constant term is \(q_vS_v\), not \(S_v\). A map with nonsurjective
coefficient image need not have maximal kernel: \(\mathbb Z\to\mathbb Q\)
has kernel zero. Finally, imposing the relation \(T_v=0\) when the proposed
trace is one prevents descent. This last check makes the acting-factor
hypothesis visible.

## Supplier contracts and acceptance

Use AdelicAlgebraicGroups AA.2 for the quaternionic algebraic group,
AA.3 for general-number-field reduction theory and anisotropic norm-one
compactness, and AA.4 for strong approximation of \(D^1\).
AA.5's definite example over \(\mathbb Q\) does not by itself give the
general-\(F\) class-set or isotropy statements.
Use SmoothRepresentationsOfLocalGroups SR.0 and SR.3 for actual smooth
representations, essentially square-integrable and Steinberg modules,
characters and elliptic character comparison. The normalized induction
and Iwahori operators use SR.2. IntegralHeckeAlgebras supplies integral
double-coset operators. AutomorphicFormsOnReductiveGroups AF.1 supplies
adelic automorphic and cuspidal representations; AF.4 supplies rational
models; AF.5 owns the generic fixed-central-character integral algebraic
modular-form carrier. AutomorphicSpectralTheory AS.4 and AS.6 supply the
degree-two global spectral comparison and multiplicity-one input.

ArithmeticGaloisRepresentations R01.1–R01.2 must supply continuous rank-two
representations, stable lattices, pseudorepresentations and specialization.
PadicHodgeTheory R06.5 must supply the precise geometric semistable comparison
at places above \(p\). These are lower-tier contracts. The minimum quaternionic
transfer and early eigensystem results stated here supply the higher GL2
transfer and automorphic Galois roadmaps; the present Taylor–Wiles control
does not import those higher targets. The choice of Taylor–Wiles primes and
patching belong to their respective later applications.

The layer is accepted mathematically only after the following obligations
are met. Obtain the exact published Khare smallness/field-degree lemma used
by NeatnessBaseChange; the projective neat-level argument does not prove its
degree assertion. Supply the even-degree, no-finite-discrete-series early
Galois construction beyond Carayol and the weight-two comparison above \(p\).
Build the genuine integral adelic and local representation carriers in the
owning supplier layers. Ensure the full prerequisite closure uses the owning supplier layers
and the minimum quaternionic transfer and early Galois results stated here. Resolve the
exceptional odd-prime ramified-sign inference before asserting the unrestricted
version of Lemma 7.2(i). These are explicit mathematical obligations, not
claims of established or formalized results.

The suggested Lean file states only elementary consequences on existing
carriers: integer-valued character powers, cyclic torsion kernels, the image
of actual invariant lattices, and multiplication by a quadratic character.
The heavy adelic, transfer and Galois objects are targets in this document.
All six principal objects/results remain visible: definite class sets,
neatness and base change, Taylor–Wiles level, diamond freeness, dyadic norm
twists, and residual Hecke ideals.

## Sources

- Khare–Wintenberger, *Serre's modularity conjecture (II)*,
  [author copy dated 30 May 2009](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf):
  §7, pp.57–67; Lemmas 7.1–7.4, Corollary 7.5 and Proposition 7.6.
- Taylor, *On the meromorphic continuation of degree two L-functions*,
  [Documenta Mathematica Extra Volume (2006)](https://ems.press/content/book-chapter-files/27484?nt=1),
  pp.729–779: Lemma 1.1 and Corollary 1.2, pp.738–739; Lemma 1.3,
  pp.739–742; Lemma 1.6(2), pp.744–745; Lemmas 2.2–2.3 and Corollary 2.4,
  pp.746–748.
- Jacquet–Langlands, *Automorphic Forms on GL(2)*,
  [IAS monograph (1970)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2-rpl_1.pdf):
  Theorem 14.2, p.232; Corollary 14.3 and Theorem 14.4, pp.237–238;
  §15, Theorem 15.1, p.239; §16, Theorem 16.1, pp.252–254.
- Badulescu–Renard, *Unitary dual of GL(n) at Archimedean places and global
  Jacquet–Langlands correspondence*,
  [author preprint dated 16 November 2009](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf),
  Duke Mathematical Journal 154 (2010), 427–508: §1.5, pp.5–7;
  §9, pp.18–20, especially Remark 9.6; §13.1, pp.32–33;
  Theorem 18.1 and Proposition 18.2, pp.44–45. Page numbers refer to the preprint.
- Carayol, *Sur les représentations l-adiques associées aux formes modulaires
  de Hilbert*,
  [Annales scientifiques de l'École Normale Supérieure 19 (1986)](https://www.numdam.org/item/10.24033/asens.1512.pdf),
  409–468: introduction §§0.1–0.11, pp.409–412, Theorems A, B and B';
  §1 opening, pp.413–414.
- Platonov–Rapinchuk–Rapinchuk, *Algebraic Groups and Number Theory*, volume 1,
  second edition, Cambridge Studies in Advanced Mathematics 205 (2023):
  [§1.4.2](https://doi.org/10.1017/9781139017756.004), pp.31–33, equation (1.16).
  The cleared reference-library copy supplies the division valuation statement.
