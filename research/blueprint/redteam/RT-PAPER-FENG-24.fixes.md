# FIX-RT-PAPER-FENG-24 — corrections to the extraction contracts

Codex, session `codex-rtOQ9t`, 2026-10-01;
[issue #5518](https://github.com/CBirkbeck/tauceti-explorer/issues/5518),
base `f0d9a21`. All four high-severity findings were independently confirmed
in `RT-PAPER-FENG-24.review.json` and are applied in the extraction and reader.
These changes await independent fix review.

The 142 original item IDs, their 3 library / 11 planned / 128 missing
classifications and supplier assignments are unchanged. Every missing item
still occurs once in the same route: 63 Smith, 33 global, 32 local. The six-item
source route remains. No atlas, roadmap packet or library file is changed.
Historical extraction/review statements remain explicitly historical.
E41's active correction is qualified; the other 56 previous source records
and all 57 independent historical verdicts are preserved. E58–E60 are new
source records with confirmed red-team evidence, without invented fix verdicts.

## 1. Effective descent: qualify the fixed-locus theorem

**Applied:** item /60, comparison items /62–/64, E41, summary, route 2 and
its local consumers /85–/87,/91,/94,/95 and route 3. The unrestricted main
results are retained as published targets with explicit proof obligations;
they are not declared false. Items /3–/6 identify the limitation of their
quoted proof route. The working geometric comparison now requires
$\pi:X'\to X$ **finite étale**, rather than merely cyclic of degree $p$.
No sufficient branch-level repair is claimed.

Here is the proof of the qualified descent statement. Representability of
the truncation removes automorphisms. A fixed point consequently has a
unique isomorphism to its $\sigma$-translate, whose $p$-fold composite is
identity. For finite étale $\pi$, the canonical morphism

$$
C_p\times X'_S\ \xrightarrow{\sim}\ X'_S\times_{X_S}X'_S
$$

identifies this cocycle with a datum on the **entire** faithfully flat descent
relation. Effective descent of affine torsors supplies the $H$-torsor over
$X_S$. Full faithfulness descends the compatible Frobenius, level frame and
modification maps. Apply this to each stage of an iterated shtuka. The
construction commutes with every test scheme $S$ and is inverse to pullback,
so it gives the scheme isomorphism, not just a bijection of geometric points.
The HN pullback square is the separate existing missing item /rev-25;
it is not inferred from descent without its own proof.

In a ramified cover, the graphs of the group action meet at branch points.
The displayed disjoint relation is false there. A group cocycle on those
graphs supplies a linearization, but need not be effective descent.

The confirmed counterexample is retained as an acceptance specification:
$p=3$, geometric characteristic $7$, $X=\mathbf P^1_t$,
$X'=\mathbf P^1_u$, $t=u^3$, $\sigma(u)=2u$, $H=\mathbf G_m$, no legs,
$D=\varnothing$ and $x_0=(t=1)$. The trivial line bundle has Frobenius identity
and frame $u$ on $A_n=\mathbf F_7[u]/((u^3-1)^n)$. It is fixed via $4$:
$(2u)4=u$ and $4^3=1$. Its framed automorphisms vanish. It belongs to the
trivial, degree-zero torsor piece for every sufficiently deep representable
truncation.

A descended line bundle $M$ on $\mathbf P^1_t$ with trivial pullback has
$3\deg M=0$, hence $M\simeq\mathcal O$. A pulled-back frame is invariant;
a global isomorphism to the displayed bundle multiplies it by a constant.
But $cu$ has distinct values $c,2c,4c$ above $t=1$ for $c\ne0$. This obstructs
pullback already modulo $u^3-1$, and therefore at every $n$. The unique
linearization acts by $4$ at $u=0$. Increasing level at $x_0$ does not remove it.

For $\beta=\phi_*(\alpha)$, the old E41 repair is now conditional. Under the
finite-étale comparison the fixed $\beta$-sector is the disjoint union of
$H$-sectors $\alpha'$ with $\phi_*(\alpha')=\beta$, and the $\alpha$-sector
is an $\mathrm{Exc}'$-stable summand. In the ramified case that decomposition
has not been supplied. Smith localization remains valid for the **whole**
fixed scheme; restricting to a descended subfunctor does not automatically
provide the required stable summand or the excursion comparison.

Route 2 therefore owns the ramified repair: construct the descent/inertia
comparison, prove compatibility with geometric creation/annihilation,
Galois transport, partial Frobenius and the $\mathrm{Exc}'$-action, and
establish the sector support argument. If changing branch level is used,
state and prove sufficient conditions at every branch place, their descent
criterion, change-of-level compatibility and the claimed fixed-level control.
These are explicit design obligations in the existing route, not a new
unjustified theorem. The existing E27/E29 naturality obligations also remain.

Route 3 imports this work. Its working statements assume a compatible finite
étale globalization, prescribed local models and faithful local-global input.
Such a cover has unramified completion at $v$; it supplies no ramified local
result. Corollaries 6.13–6.15, Theorems 6.21/6.26 and the depth conclusion
cannot use the false global identification in a ramified model. The local
positive-depth double-coset and plainness repairs remain useful but do not
prove descent. The original unrestricted formulas are retained in
`sourceTarget`. This repairs the extraction's assertion and routing; it does
not claim a new proof of unrestricted ramified base change. PROTOCOL §16
routes such missing proof mathematics to the blueprint; proof closure is
not a prerequisite for completing an extraction correction.

## 2–3. A coefficient-linear, correctly typed excursion construction

**Applied:** items /13,/56,/53,/rev-20,/rev-23, comparison /63, route 2,
summary and reader. E59 records the omitted coefficient-linearity contract;
E60 records the geometric/full-L-group typing error. E35's index repair is
retained separately. Item /56's `functorContract` gives each condition
explicitly, with the original owner and classifications retained.

Let $A$ be a unital $k$-algebra with central scalar action and let
$F_I:\operatorname{Rep}_k(\widehat G^I)\to\operatorname{Mod}_A$ be additive
$k$-linear **geometric** functors, including $I=\varnothing$. Fusion
$\chi_\zeta:F_J(V^\zeta)\simeq F_I(V)$ is natural in geometric morphisms,
identity/composition coherent, and compatible with Galois transport.
The tensor, permutation and duality maps used below are actual morphisms
in this geometric domain. No strong monoidality of cohomology is assumed.

Fix the compatible algebraic/geometric L-group normalization of item /8.
Write $T_\gamma V$ for the representation with action
$g\mapsto\rho_V(\gamma^{-1}g\gamma)$, and take natural $A$-linear transport
$a_{\gamma,V}:F_I(V)\to F_I(T_\gamma V)$ satisfying

$$
a_{1,V}=1,\qquad
 a_{\gamma\delta,V}=a_{\gamma,T_\delta V}\,a_{\delta,V}.
$$

For $W\in\operatorname{Rep}_k(({}^LG)^I)$, its underlying geometric
representation is $V$ and its descent map is
$r_\gamma:T_\gamma V\to V$, $v\mapsto W(\gamma)v$.
Set $D^W_\gamma=F_I(r_\gamma)a_{\gamma,V}$. Naturality gives

$$
D^W_\gamma D^W_\delta
=F_I(r_\gamma T_\gamma(r_\delta))
 a_{\gamma,T_\delta V}a_{\delta,V}
=D^W_{\gamma\delta}.
$$

The unit comparison identifies $F_I(1)$ with $M=F_\varnothing(k)$, with
trivial unit transport. If $V$ is inflated from the geometric factors indexed
by $J\subset I$, transport in the unused legs $I\setminus J$ is identity under the
forgotten-leg comparison: pull the tuple back along $J\hookrightarrow I$
to get the identity tuple, and apply the transport-compatible fusion square.
Similarly, the square for $\varnothing\to I$ forces trivial unit transport.
These are consequences of the geometric contract, recorded explicitly for
the normalization and inflation proofs below. The actual cohomology instance
must verify its geometric transport-compatible fusion, rather than merely
the two printed ordinary-functor axioms.

For $\zeta:I\to\{0\}$ define

$$
S_{I,W,x,\xi,\gamma}
=F_{\{0\}}(\xi)\,\chi_\zeta^{-1}\,D^W_\gamma\,
 \chi_\zeta\,F_{\{0\}}(x).
$$

Here $x:1\to V^\zeta$ and $\xi:V^\zeta\to1$ need only be
$\widehat G$-equivariant. These outer arrows are defined **before** arithmetic
equivariance. They are not required to be L-group morphisms.

The six relations of §2.4.2 follow with the following checks of the
conditions actually used.

1. **Empty set.** At $I=\varnothing$, the middle action is identity.
   Additivity and $k$-linearity canonically identify
   $F_\varnothing(U)=M\otimes_k U$ for finite-dimensional $U$.
   The composite is $F_\varnothing(\xi x)=\langle\xi,x\rangle\,1_M$.
   Unit fusion transports this normalization to $F_{\{0\}}(1)$.
2. **Representation morphisms.** For an L-group morphism $u:W\to W'$,
   naturality of $a$ and equivariance of $u$ imply
   $D^{W'}_\gamma F_I(u)=F_I(u)D^W_\gamma$.
   Naturality of $\chi$ then moves $u$ through the creation/middle/annihilation
   diagram, giving the relation with $u(x)$ and $u^*\xi'$.
3. **Products, sums and scalars.** Use disjoint leg sets and the map to two
   singleton sets. Factor $x_1\boxtimes x_2$ as creation of the first and then
   the second block; factor annihilation in the reverse direction. The
   natural fusion squares and trivial transport in absent legs allow the
   operations on one block to pass those on the other. The two tuple actions
   commute in $\Gamma^{I_1\sqcup I_2}$. The resulting composite is $S_1S_2$.
   Swapping the two blocks shows $S_1S_2=S_2S_1$. Finite biproduct injections
   and projections give direct-sum addition. Linearity of $F_{\{0\}}$ on
   creation/annihilation gives $S_{x+x'}=S_x+S_{x'}$,
   $S_{\lambda x}=\lambda S_x$, and $S_0=0$, and the same in $\xi$.
   This argument does not identify $F(V\otimes V')$ with
   $F(V)\otimes F(V')$.
4. **Reindexing.** For $I\to J\to\{0\}$, composition coherence identifies
   the two creation and annihilation maps. Transport-compatible fusion
   identifies the tuple on $J$ with $(\gamma_{\zeta(i)})_i$ on $I$.
   Substitution in the displayed composite gives the relation.
5. **Three tuples and inverse.** Coevaluation of $W$ and evaluation of
   $W^*$ are equivariant for the full diagonal L-group on their paired legs.
   Their natural transport squares, with trivial action on the unit, let
   one multiply the first two tuples simultaneously on the right by
   $\beta=(\gamma')^{-1}\gamma''$, and the last two simultaneously on the
   left by $\alpha=\gamma(\gamma')^{-1}$. All three tuples become
   $h=\gamma(\gamma')^{-1}\gamma''$. Fuse the three copies of $I$.
   The geometric map
   $u=\delta_W\otimes1_W:W\to W\otimes W^*\otimes W$
   is also an L-group morphism. The duality triangle
   $(1_W\otimes\operatorname{ev}_W)u=1_W$ and relation 2 reduce the
   operator to $S_{I,W,x,\xi,h}$, which is exactly (2.8).
6. **Inflation.** If $W$ is inflated from $({}^LG)^J\times\Gamma^{I\setminus J}$,
   its geometric representation is inflated from $\widehat G^J$. Under the
   forgotten-leg comparison, transport of the unused tuple is identity;
   its remaining action is the geometric morphism
   $F_J(W(1_J,\gamma_{I\setminus J}))$. The two tuple blocks commute.
   Move that morphism into creation by naturality. This gives the operator
   on $J$ with $x$ replaced by $W(1_J,\gamma_{I\setminus J})x$, exactly
   relation (vi). The replacement remains diagonal-$\widehat G$-invariant.

Thus the operators satisfy the presented relations and define a $k$-algebra
map to $\operatorname{End}_A(M)$. Route 2 must verify the stated geometric
conditions for Satake/cohomology and its Tate instance, including the
partial-Weil factorization and the already routed norm/naturality inputs;
this fix does not manufacture those geometric proofs. It replaces the false
abstract implication with an explicit sufficient contract and its argument.

Two independent negative tests explain why both corrections are needed.
The constant ordinary functor with every map sent to $1_k$ satisfies the
printed fusion conditions, but its zero creation acts as $1_k$.
It is excluded by $k$-linearity. Conversely, adding linearity alone does
not type an L-group functor's application to a geometric-only arrow.
For $p=3$, split $G_m$ and $W=k(\chi)$ with quadratic $\Gamma$-character,
$x=\xi=1$ are geometric maps but not L-group maps. The corrected inflation
formula gives $S=\chi(\gamma)1_M$, including $-1_M$ for odd degree.
Requiring $x$ and $\xi$ to be L-group-invariant would delete valid generators
and is not this repair.

## 4. Separate compact-support and open direct image

**Applied:** /rev-6, route 1 and the reader. Its existing Smith owner remains;
EDC.0 supplies the six-operations/cohomological-dimension foundations.
No source issue is added: the false numerical strengthening came from the
extraction review, not Feng or Stacks.

For a separated finite-type $f$ with geometric fibre dimension at most $d$,
the stated étale torsion coefficients and projection-formula hypotheses,
$Rf_!$ has the finite-Tor bound $[a,b+2d]$. Fibrewise compact-support
cohomological dimension supplies $2d$. For a quasi-compact open immersion
$j$, retain finite-Tor preservation with an ambient finite
cohomological-dimension bound, without a numerical relative-dimension
bound or a t-exactness assertion. A compatible adic $W(k)$ system needs a
uniform torsion bound and the completed projection-formula/limit argument.
The consumer on Feng p.16 requires finite amplitude. The underlying
SGA 4 statements cited there remain supplier inputs; no fresh full reading
of SGA 4 or adic completion proof is claimed.

The concrete test is $j:\mathbf G_m\hookrightarrow\mathbf A^1$ over
$\overline{\mathbf F}_7$, with $A=\overline{\mathbf F}_3[C_3]$ constant and free.
On the punctured strict henselian trait at zero, $z^3=t$ is an étale Kummer
torsor with no section: any cube has valuation divisible by $3$, while
$v(t)=1$. It supplies nonzero $H^1$ with $\mathbf F_3$ coefficients, and
then with $k$ and the free $A$-coefficient summands. Therefore
$(R^1j_*A)_0\ne0$. Tensoring with $A$ itself already detects positive
cohomological degree, contradicting a tor-amplitude bound $[0,0]$ for an
open immersion of relative dimension zero. This establishes the rejection
of the bound; it does not require a claim that every input has exact
amplitude $[0,1]$. The companion compact-support test on $\mathbf A^1$
has $H_c^2=k[C_3](-1)$ and reaches the valid $d=1$ bound.

## Sources and ownership checks

Downloaded the actual
[published Cambridge PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/76E09C985494E340189BDD496BDBD3C1/S205050862300032Xa.pdf/div-class-title-smith-theory-and-cyclic-base-change-functoriality-div.pdf)
on **2026-10-01**: 66 pages, SHA-256
`0e6d8a7577bd20408f2c9b0d42f8f1f96e089701ee581373293a4714011ea666`.
Reread pp.10–13,15–17,32–45,50–56; inspected images 33 and 37.
Cambridge embeds a download timestamp, explaining the hash difference from
the earlier full red-team reading. This fix uses a bounded rereading;
the accepted red-team report documents the full article reading.

Inspected [arXiv's version record](https://arxiv.org/abs/2009.14236),
[Tony Feng's papers page](https://math.berkeley.edu/~fengt/papers.html),
[Crossref's DOI record](https://api.crossref.org/works/10.1017/fmp.2023.32)
and a bounded title/erratum/ramified-descent search. arXiv still lists v6
of 29 November 2023; Crossref has no update-to entry and an empty relation
object. No applicable correction was found. The publisher's article-page
web rendering exceeded the browsing size limit; its actual version-of-record
PDF was available and read. These checks do not prove absence of a correction.
No author was contacted.

Read [Stacks 0F10](https://stacks.math.columbia.edu/tag/0F10) and
[03PK](https://stacks.math.columbia.edu/tag/03PK) at the finite
cohomological-dimension and Kummer statements/proofs. The former supplies
finiteness, not the review's numerical bound. Compared the geometric linear
functor interface with Proposition 1.3, Remark 1.4 and Lemma 5.2 of
[Lafforgue's introduction](https://arxiv.org/html/1404.3998), a targeted
interface comparison rather than a full supplier audit. The corrected
nonsplit/full-L-group argument and inflation condition are stated above.

Read current atlas descriptions and accepted AUDIT-18/20/21 entries for
EDC.0, GS.1, GS.2, GS.4, GS.5, ES0 and LP2:excursion-presentation.
The three proposed route owners are not yet installed roadmap owners at
this snapshot. The modular abstract mechanism remains in route 2, the
finite-Tor group-ring theorem in route 1, and route 3 imports the global
comparison. No new roadmap or duplicate supplier is introduced. No
library declaration or implementation classification is added or changed.

## Validation

- Paper checker and intake validation on the three issue deliverables: passed.
- Source-issue schema and version checks, including E58–E60: passed.
- Structural checks: 142 unique IDs; classifications and suppliers unchanged; all 128 missing items routed once with the four original memberships; only E41's active text changes among previous source records; independent verdicts unchanged.
- Exact finite-field checks of the frame/cocycle, the quadratic-character domain obstruction and corrected scalar action; zero/scalar/addition, empty-set, direct-sum, product, reindexing, duality and inflation matrix-coefficient identities: passed. These are concrete mathematical tests, not proofs of the geometric cohomology instance.
- `git diff --check`: passed.

No Lean file is required or compiled. No library build, cache download,
Lake project or language server was started. The mathematical boundaries,
especially the routed ramified proof obligation and previously recorded
geometric naturality inputs, are explicit.
