# Valuation base change and constructible cohomology

Étale cohomology over a valuation base has three distinct exports: invariance
under a surjective change of valuation spectrum, local support comparisons
along a constructible subset of the base, and finite generation for
constructible coefficients. Their hypotheses differ. Keeping the sheaf-local
and global functors separate makes the finite-rank proofs and the comparison
with nearby cycles precise.

The definitive statements are below. The
[packet](../packets/ClassicalAdicEtaleCohomology--H1-valuation-exports.json)
records their dependency graph, and the
[suggested signatures](../suggested/ClassicalAdicEtaleCohomology--H1-valuation-exports.lean)
use Mathlib's actual schemes, small étale sheaves and bounded-below derived
categories. These are specifications, with no implementation claim. The
[H0 packet](../packets/ClassicalAdicEtaleCohomology--H0.json) supplies the eleven
nearby-cycle and tube declarations listed below; their definitions and API keep
their original ownership.

The primary source for the full sheaf and finiteness statements is
[Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*](https://doi.org/10.1007/978-3-663-09991-8),
Aspects of Mathematics E30, Vieweg 1996, first edition, Corollaries 4.2.6–4.2.9,
printed pp. 243–246. The derived specialization also has an independent proof
in Hansen–Scholze, *Relative perversity*, Corollary 4.5, pp. 22–23 of the
[38-page author version](https://people.mpim-bonn.mpg.de/scholze/RelativePerverse.pdf).
Every source locator uses the pagination of its specified edition.

## Conventions and imported objects

A valuation ring here is a commutative integral domain \(V\) in which
divisibility is totally ordered. Its fraction field is \(K\), its scheme
spectrum is \(S\), and its closed point is \(s\). No topology, completion or rank
is part of this algebraic datum. Mathlib provides `ValuationRing`, `FractionRing`
and the spectrum functor at the recorded baseline. Algebraic closure of \(K\)
makes the normal domain \(V\) absolutely integrally closed, by
[Stacks Lemma 15.14.5, tag 0DCQ](https://stacks.math.columbia.edu/tag/0DCQ).
Its strict henselianity is the already accepted
`algebraically-closed-fraction-field-strictly-henselian` node; the underlying
local algebra is also in Stacks Lemma 15.14.7, tag 0DCS.

For a ring map \(\varphi:V\to W\), use H0's
`surjective-valuation-base-change` definition and criterion. In this setting,
surjectivity of \(\operatorname{Spec}W\to \operatorname{Spec}V\), faithful
flatness, and being an injective local map are equivalent. Mere dominance or
flatness does not suffice. Write \(X_W=X\times_V W\), \(g:X_W\to X\), and retain
the actual scheme morphism \(g\) in every comparison. In the suggested file it
is the first projection from Mathlib's categorical pullback.

For the bounded-below specializations, fix a prime \(\ell\), an integer \(n>0\),
and a commutative ring \(\Lambda\)
with \(\ell^n\Lambda=0\). Require \(\ell\) to be invertible in \(V\), hence in
\(W\). Let \(D^+(X,\Lambda)\) be the bounded-below derived category of étale
sheaves of \(\Lambda\)-modules on the **small** étale site. The carrier belongs to
`EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`. It uses Mathlib's
small étale topology, its Grothendieck abelian sheaf category and
`DerivedCategory.Plus`. The sheaf and derived carriers are imported, together
with their coefficient conventions.

The exact inverse-image functor \(g^*\), derived direct image \(Rg_*\), derived
global sections \(R\Gamma_X\), and their coherent adjunction and composition
maps are requested from `SchemeAndStackFoundations:SF.2`. The cohomology
pullback used here is the specific natural transformation

\[
\beta_g(E):R\Gamma(X,E)
 \longrightarrow R\Gamma(X,Rg_*g^*E)
 \xrightarrow{\ \sim\ }R\Gamma(X_W,g^*E).
\]

Its first arrow applies derived global sections to the adjunction unit.
Its identity and composition laws, and naturality in \(E\), belong to that
supplier API. They must preserve the canonical maps, rather than selecting
isomorphisms after computing cohomology. The suggested file writes the
component formula using Mathlib's actual adjunction and natural-transformation
types; its functor interfaces are explicitly labelled supplier obligations.

The imported H0 declarations can be grouped by their exports. In the table,
every short id is prefixed by
`ClassicalAdicEtaleCohomology:H1:valuation-exports/` and refers to the accepted H0
packet, not a new declaration in this follow-up.

| Imported ids | Export retained |
| --- | --- |
| `surjective-valuation-base-change`, `algebraically-closed-fraction-field-strictly-henselian` | The valuation map criterion and the strict-local algebraic hypotheses. |
| `invariance-comparison-map` | The nearby cohomology map: pullback on the special fibre, followed by cohomology of the nearby base-change map. |
| `finite-rank-finite-type-reduction` | The reduced finite-presentation model under a topologically noetherian base hypothesis. |
| `special-locus-support-triangle`, `proper-nearby-cycle-cohomology` | Localization along the microbial special locus; proper restriction to the closed fibre and the nearby-cycle comparison, with the vanishing-cycle shift. |
| `nearby-cycle-invariance-under-surjective-base-change` | The supported public nearby-cycle invariance statement in its recorded coefficient and presentation range. |
| `compact-support-nearby-cycle-cohomology`, `nearby-cycle-cohomology-finiteness` | Compactification with the boundary term, and finite constructible cohomology in the specified prime-to-residue range. |
| `formal-adic-compatibility`, `tube-cohomology-invariance-export` | Compatibility with the actual formal completion comparison and its pseudo-adic tubes, with continuity and the plus ring retained. |

The definitions, API items and unit tests for these imports remain in H0 and its
suggested file. There is no new definition or construction node here. In
particular, the general support functor is the one owned by
`EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports`.

Two further coefficient ranges are used. For the full torsion-sheaf statements,
\(F\) is an abelian étale torsion sheaf, with torsion orders prime to the
residue characteristics occurring on the specified scheme. No common exponent
is required. “Prime to \(\operatorname{char}(X)\)” concerns the characteristics
of residue fields on \(X\), rather than just that of the fraction field of the
valuation base. The local-support base-change statements instead require the
prime-to-\(\operatorname{char}(X_W)\) condition.

For constructibility and finiteness, use a noetherian commutative coefficient
ring \(B\) killed by an integer \(m>0\) that is a unit in every residue field
of \(X\). A constructible \(B\)-module sheaf means that each quasi-compact open
has a finite partition into constructible locally closed subschemes, on each
of which the restriction is étale locally constant with finitely generated
\(B\)-module stalks. This general scheme definition is requested from SF.2;
it must not impose noetherianity on \(X\). The suggested supplier specification
expands this condition using actual closed/open immersions, étale
trivializations and Mathlib's constant-sheaf functor. It also includes checks
for zero sheaves, constant finite modules and inverse image. It contains no
admitted `Prop` predicate.

Write \(\mathcal H^n_T(X,F)\) for **sheaf local cohomology**, the degree-\(n\)
cohomology sheaf of \(i_*Ri^!F\) on \(X\), with \(i:T\hookrightarrow X\).
Write \(H^n_T(X,F)\) for the **global** cohomology of
\(R\Gamma_T(X,F)\), a \(B\)-module. EDC.0 owns both supported functors and the
localization triangles; SF.2 supplies their natural exchange maps and the
local-to-global support spectral sequence. No compact-support functor is
substituted for either one.

## Global invariance and adjunction descent

The theorem `torsion-sheaf-total-cohomology-valuation-invariance` has the
following generality. Let \(V,W\) be valuation domains with separably closed
fraction fields and let \(q:\operatorname{Spec}W\to\operatorname{Spec}V\)
be surjective. For **any** \(V\)-scheme \(X\), and an abelian torsion sheaf
\(F\) on \(X_{\mathrm{\acute et}}\) prime to
\(\operatorname{char}(X)\), the canonical maps

\[
H^n(X,F)\ \xrightarrow{\sim}\ H^n(X_W,g^*F)
\qquad(n\geq0)
\]

are isomorphisms. There is no finite-type, qcqs, constructibility or
single-exponent assumption. The equivalent bounded-below statement is that
\(\beta_g(F[0])\) is an isomorphism. This uses a sheaf concentrated in degree
zero; it asserts no arbitrary unbounded derived equivalence. Source: Huber,
Corollary 4.2.7(i), pp. 244–245.

The theorem `torsion-sheaf-valuation-adjunction-descent` records the stronger
sheaf conclusion from part (ii) of the same corollary:

\[
F\ \xrightarrow{\sim}\ g_*g^*F,
\qquad R^n g_*g^*F=0\quad(n>0).
\]

Equivalently the **actual adjunction unit** \(F[0]\to Rg_*g^*F[0]\)
is an isomorphism. Its degree-zero map is not chosen independently of its
higher vanishing. This conclusion concerns the sheaf pulled back from \(X\);
it does not say that every sheaf on \(X_W\) descends. It follows from global
invariance applied on each affine étale chart of \(X\), followed by
sheafification. By [Stacks Lemma 59.51.6, tag 03Q8](https://stacks.math.columbia.edu/tag/03Q8),
\(R^n g_*g^*F\) is the sheaf associated to
\(U\mapsto H^n(U_W,g^*F)\). Global invariance identifies this presheaf
with \(U\mapsto H^n(U,F)\). For \(n>0\), the latter has zero
sheafification, since it computes \(R^n(\mathrm{id}_X)_*F=0\); every
class dies on an étale cover. The groups on an individual affine chart need
not be zero. Affine étale charts cover arbitrary schemes, including schemes
that are not qcqs.

The global proof reduces a fixed cohomological degree to finite-rank valuation
bases, then inducts on their dimension. In rank zero, collapsed-boundary
vanishing removes the source's nongeneric strata and separably closed field
invariance handles the generic fibre. In positive rank choose a nonempty
proper closed interval in the chain of base points. Local-support base change
compares the support spectral sequences; the quotient valuation supporting
the closed interval and the localization defining its complement have lower
dimension. Induction handles these two terms, and the localization sequence
handles the total cohomology. All maps arise from restriction or the adjunction
unit.

This proof uses the two local-support results stated below. Its reduction for
arbitrary torsion sheaves and arbitrary schemes needs SF.2's affine-limit,
coefficient and descent inputs, with the existing
`AdicCoefficientsAndComparisons:L2/etale-cohomology-continuity` import. It is
distinct from descent of finitely presented constructible data. The field
comparison is [Stacks Lemma 59.90.2, tag 0F0B](https://stacks.math.columbia.edu/tag/0F0B)
on qcqs charts, followed by sheaf descent. Huber cites SGA 4, XVI.1.6 for this
step; the Stacks statement is the directly checked field input.

The same unit theorem on sheaves also recovers the separably closed
bounded-below, fixed-exponent specialization by cohomology sheaves and
bounded-below truncations. An alternative proof passes through algebraic
closure and the ULA theorem as follows.

## Total cohomology under valuation extension

The node `total-cohomology-valuation-invariance` states the following. Suppose
\(V\to W\) is faithfully flat, both fraction fields are algebraically closed,
and the coefficient assumptions above hold. For **every qcqs \(V\)-scheme**
\(X\) and \(E\in D^+(X,\Lambda)\), the canonical map \(\beta_g(E)\) is an
isomorphism. It follows that

\[
H^q(X,E)\ \xrightarrow{\sim}\ H^q(X_W,g^*E)
\qquad(q\in\mathbb Z).
\]

There is no finite-type, finite-presentation, properness or constructibility
condition in this bounded-below statement. The public Corollary 4.5 first treats
finite-type schemes in its left-completed coefficient setting; its final
sentence and proof supply the version used here. This distinction prevents the
finite-type hypothesis from being retained unnecessarily, and prevents the
unbounded setting from being imported without its enhancement.

The proof route has substantive prerequisites. On affine finite-presentation
models, finite cohomological dimension allows reduction to constructible
coefficients. Hansen–Scholze Lemma 3.5, §3, pp. 16–17, gives a bound \(d+1\)
for an affine finite-type scheme over an absolutely integrally closed valuation
base, where \(d\) bounds fibre dimensions. Their proof uses finite-rank
approximation and affine vanishing. These scheme inputs are part of the precise
SF.2 request. The stronger bound discussed in that source is unnecessary for
the present export.

At finite valuation rank, split a constructible object by the unit map into its
generic extension and a term supported over a proper closed subset of the
valuation spectrum. The supported term is treated by induction. The generic
term uses Hansen–Scholze Theorem 4.1, §4, pp. 19–22: on a separated finitely
presented scheme over an absolutely integrally closed valuation, \(Rj_*\)
extends perfect-constructible generic coefficients to universally locally
acyclic coefficients, with generic restriction as inverse. Corollary 4.2(ii),
p. 19, gives its compatibility with flat changes of such valuation bases.
Constructible \(\mathbb Z/\ell^n\)-coefficients can be reduced by their
\(\ell\)-power filtration to \(\mathbb F_\ell\)-coefficients, where the relevant
bounded constructible objects are perfect. The coefficient reduction must
precede an application of this perfect-constructible theorem.

The generic-extension theorem is stated in the pro-étale derived category.
Its use here requires the scheme supplier's comparison with the classical
bounded-below étale carrier. For \(\nu_X:X_{\mathrm{pro\acute et}}\to X_{\mathrm{\acute et}}\),
Bhatt–Scholze, *The pro-étale topology for schemes*, Corollary 5.1.6 and
Proposition 5.2.6, §5, pp. 35 and 37 of the
[72-page author copy](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf),
give full faithfulness and the adjunction-unit identification on bounded-below
complexes. Lemmas 5.4.1 and 5.4.3, p. 39, give compatibility with pullback
and derived direct image along qcqs scheme maps. In particular, the generic
inclusion \(j\) is affine, being a base change of a localization of the
valuation ring; arbitrary valuation rank does not obstruct this comparison.
The requested comparison must preserve the unit map \(E\to Rj_*j^*E\),
its cone and derived global sections. Proposition 5.3.2, p. 38, instead uses
the left-completed carrier for unbounded complexes. The unbounded conclusion
is not an input to the present signatures.

The generic term's global sections reduce to geometric-generic cohomology.
Use [Stacks Lemma 59.90.2, tag 0F0B](https://stacks.math.columbia.edu/tag/0F0B),
with its invertibility and bounded-below hypotheses, for invariance under
extension of separably closed fields. The cone over a proper closed subset
allows the rank induction to proceed. Ordinary constructibility of
\(i^*Rj_*\) on the closed fibre is insufficient to justify this step: the source
needs the total-scheme generic extension and its ULA property. That exact
extension is requested from
`ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles`; its existing
nearby-cycle definition and constructibility theorem are imports rather than
substitutes for the missing input.

To remove finite type, descend a constructible sheaf on an affine chart along a
cofiltered system of affine finite-type models. Import the exact node
`AdicCoefficientsAndComparisons:L2/etale-cohomology-continuity`. The bounded-below
argument works degree by degree, followed by descent on qcqs affine charts and
their quasi-compact intersections. This proof route does not assume that
arbitrary unbounded totalizations commute with filtered colimits. Naturality of
the canonical cohomology map must survive each reduction.

The second node, `total-cohomology-separably-closed-valuation-invariance`, extends
the conclusion to **separably closed** fraction fields. In characteristic zero
the first theorem applies directly. In positive characteristic, pass from each
fraction field to its perfect closure. Because the fields are separably closed,
these perfect closures are algebraically closed. Extend the valuations through
the purely inseparable extensions. Their integral-closure valuation rings have
the same spectra via universal homeomorphisms. The algebraic uniqueness of the
extended valuation is already an input of H0's
`radicial-invariance-of-nearby-cycles` node; this consequence does not rebuild
that nearby-cycle theory.

The extended map of valuation rings is still injective and local, hence
faithfully flat. Apply the first theorem there and descend along the two
universal homeomorphisms. The natural square of canonical cohomology pullbacks
commutes by composition. Both vertical maps are isomorphisms by
[Stacks §59.45, tag 04DY](https://stacks.math.columbia.edu/tag/04DY),
Theorems 59.45.1–59.45.2 and Proposition 59.45.4. This gives the desired
isomorphism over the original fields. The suggested theorem uses `IsSepClosed`
and keeps this reduction explicit in its proof obligation; it does not infer
`IsAlgClosed` from `IsSepClosed` in positive characteristic.

## Sheaf local support along the base spectrum

For `local-cohomology-valuation-base-change`, let \(V,W\) have separably closed
fraction fields, let \(q:S'=\operatorname{Spec}W\to S=\operatorname{Spec}V\)
be **any** scheme morphism, and put \(g:X_W\to X\). Let \(F\) be an abelian
torsion sheaf on \(X\) prime to \(\operatorname{char}(X_W)\). For a closed
constructible subset \(Z\subset S\) with \(Z'=q^{-1}Z\ne S'\), set
\(T=f^{-1}Z\) and \(T'=g^{-1}T\), and write \(r:X\setminus T\to X\)
and \(r':X_W\setminus T'\to X_W\). Then the canonical maps

\[
g^*R^n r_*r^*F\ \xrightarrow{\sim}\ R^n r'_*r'^*g^*F,
\qquad
g^*\mathcal H^n_T(X,F)\ \xrightarrow{\sim}\
\mathcal H^n_{T'}(X_W,g^*F)
\]

are isomorphisms for every \(n\geq0\). The two formulations are equivalent
through the sheaf localization triangle. In degree zero and one, local support
is the kernel and cokernel of \(F\to r_*r^*F\); in degree \(n\geq2\), it
is \(R^{n-1}r_*r^*F\). These are sheaves on \(X_W\), not global groups.
Source: Huber, Corollary 4.2.6(i), pp. 243–244.

Neither dominance, surjectivity nor localness of \(q\) is assumed, and neither
finite type nor qcqs is imposed on \(X\). The **proper pulled-back boundary**
and prime-to-characteristic condition must both remain. At a point of \(T'\),
let \(\eta,\eta'\) be the closed points of the quasi-compact open intervals
\(S\setminus Z,S'\setminus Z'\). The valuation map takes \(\eta'\) to
\(\eta\), yielding a morphism of valuation quadruples. These closed points
need not be generic points. The nearby-cycle base-change map on these
quadruples is precisely the stalk map of the displayed restriction comparison.
Huber Proposition 4.2.4, p. 243 and proof pp. 246–249, supplies this full
Cartesian comparison. Its owner is H1:valuation-nearby-cycles. The existing
node restricted to locally finite type and dominant morphisms must be extended
to this exact generality; its restrictions cannot be inserted into the present
export.

For `local-cohomology-collapsed-boundary-vanishing`, take any proper closed
constructible \(Z'\subset S'\) and let \(\eta'\) be the closed point of
\(S'\setminus Z'\). It need not be a pullback boundary. Suppose
\(q(z')=q(\eta')\) for every \(z'\in Z'\). With \(T'=f'^{-1}Z'\),

\[
\mathcal H^n_{T'}(X_W,g^*F)=0\qquad(n\geq0).
\]

The target quadruple now has its two base points equal, so its nearby
restriction has the original stalk in degree zero and vanishes in positive
degrees. Cartesian nearby base change gives the same stalk computation on
\(X_W\), and the localization triangle kills local support. The support
spectral sequence then also kills global \(H^n_{T'}\). Source: Huber,
Corollary 4.2.6(ii), p. 244.

For example, a rank-one valuation with separably closed fraction field over a
separably closed base field satisfies the collapse condition on its closed
point. The vanishing applies to sheaves pulled back from the base-field scheme;
it does not apply to arbitrary sheaves supported on that valuation's special
fibre. For identity \(q\), a nonempty proper boundary fails the collapse
condition. This separates the vanishing theorem from a false assertion that
all special support vanishes.

## Closed support and localization

For a closed subset \(Z\subseteq X\), import \(R\Gamma_Z(X,E)\) from EDC.0.
If \(U=X\setminus Z\), its localization triangle is

\[
R\Gamma_Z(X,E)\longrightarrow R\Gamma(X,E)
 \longrightarrow R\Gamma(U,E|_U)
 \longrightarrow R\Gamma_Z(X,E)[1].
\]

This is the global support triangle in
[Stacks §59.79, tag 09XP](https://stacks.math.columbia.edu/tag/09XP),
preceding Lemma 59.79.1; Lemma 59.79.3, tag 0A45, gives the corresponding
sheaf-level statement. These are unpaginated HTML references. The support
functor depends on the closed subset and is invariant under changing the
nilpotent structure of its defining closed subscheme.

The node `closed-support-valuation-invariance` requires the hypotheses of the
separably closed total-invariance theorem, and additionally that \(U\) be
quasi-compact. Set \(Z_W=g^{-1}(Z)\). Pullback gives a natural morphism between
the two localization triangles. The ordinary-cohomology vertical arrows for
\(X\) and \(U\) are isomorphisms by total invariance. The long exact sequences
then give

\[
R\Gamma_Z(X,E)\ \xrightarrow{\sim}\
 R\Gamma_{Z_W}(X_W,g^*E),\qquad
H^q_Z(X,E)\ \xrightarrow{\sim}\ H^q_{Z_W}(X_W,g^*E).
\]

The map commutes with forgetting supports, restriction to the complement and
the connecting morphisms. The degree is \(q\) on both supported terms. The
shift by one occurs in the connecting arrow of the triangle; it does not
shift the supported invariance theorem. This argument proves a global support
comparison, and does not assert arbitrary sheaf-level base change for \(Ri^!\).

For a microbial valuation, the imported special locus is
\(Z=f^{-1}(V(\mathfrak p_V))\), with generic-fibre complement. Here the present
localization diagram agrees with H0's `special-locus-support-triangle`.
At rank one the special locus is the closed fibre. At higher rank it can contain
more than the closed fibre, and the formal closed-point tube must retain its
separate meaning. Under the extra proper hypotheses of H0's comparison, the
supported groups can be expressed through vanishing cycles as
\(H^q_Z(X,E)\cong H^{q-1}(X_s,R\Phi E)\). That inherited comparison has its own
shift; the two supported groups under valuation base change still have equal
degree.

Compact support is a separate import. H0's compact-support export uses a proper
compactification and nearby cycles of extension by zero, with an explicit
boundary term. It cannot be replaced by compact support of the special-fibre
nearby complex without checking that term. The present theorem has a specified
closed support and a quasi-compact complement. Constructibility along a finite
base boundary is the separate theorem stated below; the inherited compact-support
export retains its compactification input.

## Finite-rank models and constructible finiteness

The lemma `finite-rank-descent-of-valuation-data` is the common input to the
finite-presentation branches. Let \(V\) have separably closed fraction field,
let \(X\to\operatorname{Spec}V\) be finitely presented, let \(F\) be a
constructible \(B\)-module with the coefficient conventions above, and let
\(Z\subset\operatorname{Spec}V\) be closed constructible. The conclusion
is a valuation subring \(V_0\subset V\), with separably closed fraction field
and finite Krull dimension, together with an injective local inclusion, a
finitely presented \(X_0\to S_0=\operatorname{Spec}V_0\), a closed
constructible \(Z_0\subset S_0\), and a constructible sheaf \(F_0\), such that

\[
X\cong X_0\times_{V_0}V,
\qquad Z=q^{-1}Z_0,
\qquad F\cong p^*F_0.
\]

Here \(q:\operatorname{Spec}V\to S_0\) is surjective, \(p:X\to X_0\)
is the actual projection under the displayed isomorphism, and the annihilator
\(m\) can be kept prime to \(\operatorname{char}(X_0)\). Source: Huber,
proof of Corollary 4.2.8(2), p. 245, and proof of Corollary 4.2.9(2), p. 246.
This does not restate the inherited `finite-rank-finite-type-reduction`, which
keeps its base fixed and constructs a reduced finite-presentation model.

To produce \(V_0\), capture the finite coefficients of the scheme, the boundary
and the sheaf descent data in a finitely generated prime-field subfield of
\(\operatorname{Frac}V\). Take its relative separable closure there and
restrict the valuation. The resulting intersection with \(V\) is a valuation
subring and its inclusion is local. Finite rational rank of the restricted
valuation bounds its rank; algebraic extension preserves this bound. The
finite-rank capture result is requested from the existing AdicSpaces valuation
foundation. SF.2 owns descent of finite presentations, constructible strata,
étale trivializations and constructible sheaves along the resulting affine
limits. Descending the equations of \(X\) alone would leave the proof
incomplete: \(F,Z\) and the coefficient invertibility data must descend too.

The theorem `constructibility-along-finite-valuation-boundary` states:
if \(f:X\to S\) is **locally of finite type**, \(Z\subset S\) is closed
constructible, and **either \(f\) is locally of finite presentation or \(Z\)
has finitely many points**, then, for \(T=f^{-1}Z\) and \(j:X\setminus T\to X\),

\[
R^n j_*j^*F\quad\text{and}\quad\mathcal H^n_T(X,F)
\quad\text{are constructible for all }n\geq0.
\]

Source: Huber, Corollary 4.2.8, p. 245. Finiteness refers to \(Z\), a subset of
the **base spectrum**. It is unrelated to finite fibres, a compactification
boundary or an exceptional locus of \(X\). There is no global quasi-compactness
or properness requirement on \(X\).

For finite \(Z\), each base singleton is locally closed constructible. On each
fibre the restriction of \(R^n j_*j^*F\) is a nearby cohomology sheaf for the
closed point of \(S\setminus Z\) specializing to that base point. Apply the
already owned constructibility-of-nearby-cycles theorem, Huber Proposition
4.2.5, p. 243 and proof pp. 249–250. Combine the finitely many boundary strata
with the open complement. For local finite presentation, work affine locally,
descend \(X,F,Z\) to the finite-rank model, use the finite-boundary branch
there, and pull constructibility back using the canonical local-support base
change. If \(Z=S\), the empty-complement calculation replaces that base-change
step, whose proper-boundary hypothesis would otherwise fail. Noetherian
coefficient closure under kernels, cokernels and extensions gives the local
support formulation.

The theorem `constructible-cohomology-finiteness` states:
if \(X\to S\) is **of finite type**, and **either it is of finite presentation
or \(\dim V<\infty\)**, then

\[
H^n(X_{\mathrm{\acute et}},F)
\quad\text{is a finitely generated }B\text{-module for every }n\geq0.
\]

Source: Huber, Corollary 4.2.9, pp. 245–246. This is ordinary global cohomology.
It imposes no properness condition, and in the finite-dimensional branch no
separatedness condition. Finite type here is global, unlike the locally finite
type of the preceding theorem. Finite presentation includes quasi-compactness
and quasi-separatedness; in Lean these are explicit alongside
`LocallyOfFinitePresentation`. The conclusion is `Module.Finite`, not finite
cardinality, and it includes no extra vanishing range.

In finite rank, induct on the dimension of the valuation base. Its generic
point is open constructible, and its complementary boundary is finite. The
preceding constructibility theorem applies to the local-support sheaves. Their
cohomology over the lower-rank quotient base is finitely generated by induction.
Use the first-quadrant spectral sequence

\[
H^p(T,\mathcal H^q_T(X,F)|_T)\ \Longrightarrow\ H^{p+q}_T(X,F).
\]

Only finitely many terms contribute to a fixed total degree; noetherianity of
\(B\) preserves finite generation through subquotients and extensions. The
generic fibre is finite type over a separably closed field, where prime-to-
characteristic constructible cohomology is finitely generated. Huber cites
SGA 4½, Th. finitude 1.10 on p. 246. This exact field finiteness result, for
noetherian torsion coefficients and without a separatedness restriction, is a
named SF.2 request. The directly read Stacks 0F0B supplies field-extension
invariance, not that finiteness theorem. Finally the localization sequence
combines the generic and supported terms. For finite presentation over an
arbitrary-rank base, descend to the finite-rank model and transfer its global
cohomology using the torsion-sheaf invariance theorem. The comparison must be
\(B\)-linear and preserve the canonical pullback map.

## The comparison maps for proper schemes and formal tubes

The node `proper-nearby-invariance-coherence` reconciles the total map with
the existing nearby and tube maps. Retain the prime-to-residue coefficient
hypotheses, faithful flatness and separably closed fraction fields, and assume
\(X\to S\) proper. Write \(j:X_\eta\to X\) and \(i:X_s\to X\), with their
base-changed counterparts. The generic map \(j\) is the actual scheme
generic-fibre inclusion; arbitrary valuation rank does not make it an open
immersion. On the specified generic coefficients use
\(R\Psi F=i^*Rj_*F\).

The proper comparison \(\alpha_X(F)\) is the canonical composite

\[
R\Gamma(X_\eta,F)\ \cong\ R\Gamma(X,Rj_*F)
 \longrightarrow R\Gamma(X_s,i^*Rj_*F).
\]

H0's `proper-nearby-cycle-cohomology` proves it is an isomorphism. The inherited
nearby invariance map is pullback along \(g_s\), followed by global sections of
the nearby exchange transformation. The coherence statement is the
commuting square

\[
\begin{array}{ccc}
R\Gamma(X_\eta,F)&\xrightarrow{\beta_{g_\eta}}&
R\Gamma((X_W)_{\eta'},g_\eta^*F)\\
\downarrow\alpha_X&&\downarrow\alpha_{X_W}\\
R\Gamma(X_s,R\Psi F)&\xrightarrow{\operatorname{inv}_\varphi}&
R\Gamma((X_W)_{s'},R\Psi'(g_\eta^*F)).
\end{array}
\]

This is an equality of morphisms, not a statement about equality of dimensions.
Expand the maps using adjunction units and direct-image composition; their
naturality and the two scheme squares establish the equality. The SF.2 request
includes the needed coherent exchange identities. The generic-field total
invariance theorem makes the top arrow an isomorphism, so proper comparison
identifies the lower arrow with it.

One can compute the same top arrow through total cohomology of \(Rj_*F\) on
\(X\). In that calculation, \(\beta_g(Rj_*F)\) must be followed by cohomology of
\(g^*Rj_*F\to Rj'_*g_\eta^*F\). Omitting this exchange map changes the target and
does not describe the nearby invariance map. This distinction matters when the
valuation extension introduces primes over the generic point: the generic-fibre
square need not be Cartesian even though \(X_W\) is the Cartesian base change
of \(X\).

For microbial valuation rings with valuation topologies, a **continuous** map
\(V\to W\), and the completion and type-(S) hypotheses of H0, import
`formal-adic-compatibility` and
`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/completion-comparison-base-change-naturality`.
Their maps \(\kappa_X,\kappa_{X_W}\) identify nearby cohomology with cohomology
of the actual pseudo-adic closed-point tubes. Conjugating the preceding square
by these comparisons identifies its lower arrow with tube pullback. Higher-rank
plus rings remain in \(\operatorname{Spa}(K,V)\); replacing them with a rank-one
valuation ring would change the tube. None of the purely algebraic invariance
hypotheses supplies continuity by itself.

This is the interface for H2's algebraizable field-extension comparison and for
the formal-model inputs of H4 and H5. It does not prove their general analytic
statements from scheme invariance alone. The inherited formal and analytic
reduction obligations keep their owners and their recorded gaps.

## Acceptance and dependency boundaries

Identity maps must give identity cohomology maps and adjunction units. Rank-zero
valuations give separably closed field invariance. Nondiscrete rank one and
rank-two local inclusions are included without completion. For
\(X=\mathbb P^1_V\) and constant \(B\), the usual degree-zero generator and
degree-two first Chern class give \(B\) and \(B(-1)\); the proper coherence
square preserves them.

The following edge cases distinguish the statements.

- For the empty base boundary, local support is zero and complement extension
  is the identity. For the whole base boundary, local support is \(F[0]\) and
  the complement extension is zero. Whole-boundary cases belong to the
  constructibility theorem; the arbitrary-map base-change theorem requires
  a proper pulled-back boundary.
- In finite rank, every base boundary has finitely many points, so local finite
  type suffices for its constructibility. In infinite rank a finite boundary
  still permits local finite type; an infinite boundary retains the local
  finite-presentation alternative.
- Global finiteness allows all finite-type schemes over a finite-dimensional
  base. Over an arbitrary-rank base it retains finite presentation. It does
  not inherit a properness condition from the earlier nearby finiteness export.
- For a nonfield rank-one valuation, the generic localization \(V\to K\) is
  flat and dominant but not faithfully flat. A nonzero special-fibre
  skyscraper has global sections over \(\operatorname{Spec}V\) and zero after
  generic pullback. This rules out dropping surjectivity from total invariance.
- Sheaves with varying invertible torsion orders are admitted by Huber's full
  sheaf theorem. The bounded-below specialization uses its explicit
  \(\ell^n\)-coefficient convention. Neither form licenses arbitrary
  residue-characteristic torsion on \(X\). H0's proper nearby comparison has
  its own larger torsion scope.

The imported scheme support, nearby, formal and analytic targets keep their
owners. The precise additional inputs are the SF.2 functor/constructibility/
descent/field-finiteness request, including sheafification of higher
direct-image presheaves; H1:valuation-nearby-cycles' full Cartesian
base-change and generic \(Rj_*/\mathrm{ULA}\) request; and the AdicSpaces
finite-rank algebraic capture and strict-local valuation algebra request.
The source statements are definite;
these requests identify where their proof interfaces are built. H0's
formal-completion naturality and generic compactification prerequisites remain
part of those inherited chains.

The atlas nominations are **Valuation cohomology invariance**, **Valuation
support invariance**, **Finite-boundary constructibility**, and **Constructible
cohomology finiteness**. The proposed organization separates scheme invariance,
finite-boundary/global finiteness, and nearby/tube exports. The latter retains
H0's six planets. Assembly must apply that split or choose at most six planets
in the unsplit stage; the four nominations do not authorize ten planets in
one star.

## Source conventions and notation corrections

The packet records the exact editions, dates and hashes. Huber's first edition
has three notation slips on p. 246. The support spectral sequence in the proof
of Corollary 4.2.9 uses the coefficient sheaf \(F\), not the boundary set \(T\).
The finite-rank model in that proof has the Cartesian orientation
\(X\cong X'\times_{V'}V\). In the first reduction of Proposition 4.2.4, the
special-fibre inverse/direct-image counit applies to the special-fibre sheaf
\(C\), rather than the generic-fibre sheaf \(D\). The surrounding categories
and maps force these corrections; the intended mathematical conclusions stay
the same. Findings `E-H1-valuation-exports-2` and `-3` record the checks and
searches for existing corrections.

The packet records a subscript misprint in Lemma 5.4.3, also present in the
published version, *Astérisque* 369 (2015), pp. 153–154. For a qcqs map
\(f:Y\to X\) and an étale complex \(F\) on \(Y\), the comparison has the typed form

\[
\nu_X^*Rf_{\mathrm{\acute et},*}F
 \longrightarrow Rf_{\mathrm{pro\acute et},*}\nu_Y^*F.
\]

The source reverses the subscripts on the two \(\nu\) functors; its proof's
affine test object belongs over \(X\), and the input complex belongs over
\(Y\). These are notation corrections, with the bounded-below and qcqs
hypotheses retained. Finding `E-H1-valuation-exports-1` identifies both versions
and the type check; it does not dispute the intended comparison theorem.
