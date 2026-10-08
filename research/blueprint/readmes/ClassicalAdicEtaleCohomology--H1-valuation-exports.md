# Valuation cohomology and support exports

This document develops the new results in the follow-up packet for
`ClassicalAdicEtaleCohomology:H1:valuation-exports`. Its starting point is the
accepted [H0 packet](../packets/ClassicalAdicEtaleCohomology--H0.json), whose
eleven declarations in this stage retain their ids, definitions, APIs and tests.
The [follow-up packet](../packets/ClassicalAdicEtaleCohomology--H1-valuation-exports.json)
adds three invariance theorems and one comparison. The
[suggested file](../suggested/ClassicalAdicEtaleCohomology--H1-valuation-exports.lean)
prototypes those four new statements on Mathlib's scheme, sheaf and derived
category carriers. All declarations are plans, with implementation status
unchecked.

The new input is a public statement of invariance of **total scheme cohomology**.
It supplies a target distinct from the accepted comparison on cohomology of
nearby cycles. Hansen–Scholze, *Relative perversity*, Corollary 4.5, printed
pp. 22–23, explicitly attributes this total-cohomology theorem to Huber's
Corollary 4.2.7. The bounded-below version permits arbitrary schemes over the
valuation ring; this packet restricts to qcqs schemes and retains the
coefficient setting of the public statement. The source is the
[38-page author version](https://people.mpim-bonn.mpg.de/scholze/RelativePerverse.pdf),
with coefficient conventions in §1, pp. 2–3, and §2, p. 7. The packet records its
hash and the sections read.

Coverage remains **partial**. H0's remaining target concerning a
finite-boundary alternative in 4.2.8–4.2.9 still lacks a verified statement.
The exact identification of the support comparison with 4.2.6 also remains
unverified. The 1996 book is not cleared in the maintainer's library index, and
no copy of it was read. The supported-cohomology theorem below is a mathematical
consequence of public invariance and localization; it is not assigned Huber's
4.2.6 number without evidence. These boundaries determine what a completing
worker must establish.

## Conventions and imported objects

A valuation ring here is a commutative integral domain (V) in which
divisibility is totally ordered. Its fraction field is (K), its scheme
spectrum is (S), and its closed point is (s). No topology, completion or rank
is part of this algebraic datum. Mathlib provides `ValuationRing`, `FractionRing`
and the spectrum functor at the recorded baseline. Algebraic closure of (K)
makes the normal domain (V) absolutely integrally closed, by
[Stacks Lemma 15.14.5, tag 0DCQ](https://stacks.math.columbia.edu/tag/0DCQ).
Its strict henselianity is the already accepted
`algebraically-closed-fraction-field-strictly-henselian` node; the underlying
local algebra is also in Stacks Lemma 15.14.7, tag 0DCS.

For a ring map (arphi:V	o W), use H0's
`surjective-valuation-base-change` definition and criterion. In this setting,
surjectivity of (operatorname{Spec}W	ooperatorname{Spec}V), faithful
flatness, and being an injective local map are equivalent. Mere dominance or
flatness does not suffice. Write (X_W=X	imes_V W), (g:X_W	o X), and retain
the actual scheme morphism (g) in every comparison. In the suggested file it
is the first projection from Mathlib's categorical pullback.

Fix a prime (ell), an integer (n>0), and a commutative ring (Lambda)
with (ell^nLambda=0). Require (ell) to be invertible in (V), hence in
(W). Let (D^+(X,Lambda)) be the bounded-below derived category of étale
sheaves of (Lambda)-modules on the **small** étale site. The carrier belongs to
`EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`. It uses Mathlib's
small étale topology, its Grothendieck abelian sheaf category and
`DerivedCategory.Plus`. This packet creates no second sheaf category and no
unbounded or adic coefficient carrier.

The exact inverse-image functor (g^*), derived direct image (Rg_*), derived
global sections (RGamma_X), and their coherent adjunction and composition
maps are requested from `SchemeAndStackFoundations:SF.2`. The cohomology
pullback used here is the specific natural transformation

\[
\beta_g(E):R\Gamma(X,E)
 \longrightarrow R\Gamma(X,Rg_*g^*E)
 \xrightarrow{\ \sim\ }R\Gamma(X_W,g^*E).
\]

Its first arrow applies derived global sections to the adjunction unit.
Its identity and composition laws, and naturality in (E), belong to that
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

## Total cohomology under valuation extension

The node `total-cohomology-valuation-invariance` states the following. Suppose
(V	o W) is faithfully flat, both fraction fields are algebraically closed,
and the coefficient assumptions above hold. For **every qcqs (V)-scheme**
(X) and (Ein D^+(X,Lambda)), the canonical map (eta_g(E)) is an
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
coefficients. Hansen–Scholze Lemma 3.5, §3, pp. 16–17, gives a bound (d+1)
for an affine finite-type scheme over an absolutely integrally closed valuation
base, where (d) bounds fibre dimensions. Their proof uses finite-rank
approximation and affine vanishing. These scheme inputs are part of the precise
SF.2 request. The stronger bound discussed in that source is unnecessary for
the present export.

At finite valuation rank, split a constructible object by the unit map into its
generic extension and a term supported over a proper closed subset of the
valuation spectrum. The supported term is treated by induction. The generic
term uses Hansen–Scholze Theorem 4.1, §4, pp. 19–22: on a separated finitely
presented scheme over an absolutely integrally closed valuation, (Rj_*)
extends perfect-constructible generic coefficients to universally locally
acyclic coefficients, with generic restriction as inverse. Corollary 4.2(ii),
p. 19, gives its compatibility with flat changes of such valuation bases.
Constructible (mathbb Z/ell^n)-coefficients can be reduced by their
(ell)-power filtration to (mathbb F_ell)-coefficients, where the relevant
bounded constructible objects are perfect. The coefficient reduction must
precede an application of this perfect-constructible theorem.

The generic term's global sections reduce to geometric-generic cohomology.
Use [Stacks Lemma 59.90.2, tag 0F0B](https://stacks.math.columbia.edu/tag/0F0B),
with its invertibility and bounded-below hypotheses, for invariance under
extension of separably closed fields. The cone over a proper closed subset
allows the rank induction to proceed. Ordinary constructibility of
(i^*Rj_*) on the closed fibre is insufficient to justify this step: the source
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

## Closed support and localization

For a closed subset (Zsubseteq X), import (RGamma_Z(X,E)) from EDC.0.
If (U=X\setminus Z), its localization triangle is

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
separably closed total-invariance theorem, and additionally that (U) be
quasi-compact. Set (Z_W=g^{-1}(Z)). Pullback gives a natural morphism between
the two localization triangles. The ordinary-cohomology vertical arrows for
(X) and (U) are isomorphisms by total invariance. The long exact sequences
then give

\[
R\Gamma_Z(X,E)\ \xrightarrow{\sim}\
 R\Gamma_{Z_W}(X_W,g^*E),\qquad
H^q_Z(X,E)\ \xrightarrow{\sim}\ H^q_{Z_W}(X_W,g^*E).
\]

The map commutes with forgetting supports, restriction to the complement and
the connecting morphisms. The degree is (q) on both supported terms. The
shift by one occurs in the connecting arrow of the triangle; it does not
shift the supported invariance theorem. This argument proves a global support
comparison, and does not assert arbitrary sheaf-level base change for (Ri^!).

For a microbial valuation, the imported special locus is
(Z=f^{-1}(V(\mathfrak p_V))), with generic-fibre complement. Here the present
localization diagram agrees with H0's `special-locus-support-triangle`.
At rank one the special locus is the closed fibre. At higher rank it can contain
more than the closed fibre, and the formal closed-point tube must retain its
separate meaning. Under the extra proper hypotheses of H0's comparison, the
supported groups can be expressed through vanishing cycles as
(H^q_Z(X,E)\cong H^{q-1}(X_s,R\Phi E)). That inherited comparison has its own
shift; the two supported groups under valuation base change still have equal
degree.

Compact support is a separate import. H0's compact-support export uses a proper
compactification and nearby cycles of extension by zero, with an explicit
boundary term. It cannot be replaced by compact support of the special-fibre
nearby complex without checking that term. The present theorem has a specified
closed support and a quasi-compact complement; it neither supplies Nagata
compactification nor settles the missing finite-boundary alternative.

## The comparison maps for proper schemes and formal tubes

The node `proper-nearby-invariance-coherence` reconciles the new total map with
the existing nearby and tube maps. Retain the prime-to-residue coefficient
hypotheses, faithful flatness and separably closed fraction fields, and assume
(X	o S) proper. Write (j:X_\eta	o X) and (i:X_s	o X), with their
base-changed counterparts. The generic map (j) is the actual scheme
generic-fibre inclusion; arbitrary valuation rank does not make it an open
immersion. On the specified generic coefficients use
(R\Psi F=i^*Rj_*F).

The proper comparison (alpha_X(F)) is the canonical composite

\[
R\Gamma(X_\eta,F)\ \cong\ R\Gamma(X,Rj_*F)
 \longrightarrow R\Gamma(X_s,i^*Rj_*F).
\]

H0's `proper-nearby-cycle-cohomology` proves it is an isomorphism. The inherited
nearby invariance map is pullback along (g_s), followed by global sections of
the nearby exchange transformation. The new coherence statement is the
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

One can compute the same top arrow through total cohomology of (Rj_*F) on
(X). In that calculation, (eta_g(Rj_*F)) must be followed by cohomology of
(g^*Rj_*F\to Rj'_*g_\eta^*F). Omitting this exchange map changes the target and
does not describe the nearby invariance map. This distinction matters when the
valuation extension introduces primes over the generic point: the generic-fibre
square need not be Cartesian even though (X_W) is the Cartesian base change
of (X).

For microbial valuation rings with valuation topologies, a **continuous** map
(V	o W), and the completion and type-(S) hypotheses of H0, import
`formal-adic-compatibility` and
`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/completion-comparison-base-change-naturality`.
Their maps (kappa_X,kappa_{X_W}) identify nearby cohomology with cohomology
of the actual pseudo-adic closed-point tubes. Conjugating the preceding square
by these comparisons identifies its lower arrow with tube pullback. Higher-rank
plus rings remain in (operatorname{Spa}(K,V)); replacing them with a rank-one
valuation ring would change the tube. None of the purely algebraic invariance
hypotheses supplies continuity by itself.

This is the interface for H2's algebraizable field-extension comparison and for
the formal-model inputs of H4 and H5. It does not prove their general analytic
statements from scheme invariance alone. The inherited formal and analytic
reduction obligations keep their owners and their recorded gaps.

## Acceptance cases and boundaries of the checkpoint

The new declarations must meet the following acceptance cases.

- With (V=W) and the identity ring map, cohomology pullback is the identity,
  including on nonzero constant coefficients. The proper square reduces to the
  same comparison map on its two routes.
- With (V,W) fields, the theorem is geometric-field invariance, and
  (\eta=s) reduces the nearby square to ordinary pullback under the canonical
  fibre identifications.
- For an isometric extension of algebraically closed valued fields (C\subset D),
  the map (\mathcal O_C\to\mathcal O_D) is local and injective. Nondiscrete rank
  one is admitted. For (X=\mathbb P^1_V), the comparison fixes (1) in degree
  zero and the first Chern class of (\mathcal O(1)) in degree two; its degree-two
  coefficient is (\Lambda(-1)).
- Local injective maps of rank-two valuation rings satisfy total invariance.
  Microbial formal transport also keeps the actual plus ring, continuity and
  closed-point tube. The special locus is not identified with the closed fibre
  without the rank-one hypothesis.
- For (Z=X), supported invariance is total invariance; for (Z=\varnothing),
  both support complexes are zero. A nonzero coefficient sheaf supported at the
  closed point of a rank-one valuation gives a nonzero degree-zero support
  group, retained by faithful flat extension.
- Surjectivity is necessary for the asserted generality. For a nonfield
  rank-one valuation, localization (V\to K) is flat and dominant, but loses
  the closed point. If (E=i_*\Lambda), then (R\Gamma(S,E)=\Lambda) while
  generic pullback is zero. This rules out replacing faithful flatness by
  flatness or dominance.
- The new results retain (ell\in V^\times). They assert no invariance for
  residue-characteristic torsion. H0's proper nearby comparison has a broader
  torsion scope, which does not enlarge the coefficient scope of these new
  total invariance theorems.

For the finite-presentation part of the inherited stage, the rechecked public
sources are Orgogozo, *Modifications et cycles évanescents*, arXiv
math/0507475v1, Remarks 4.4–4.5, p. 13, and Lu–Zheng, *Duality and nearby cycles
over general bases*, arXiv 1712.10216v7, Example 4.26 and Theorem 4.27, p. 37.
Orgogozo supplies the finite-presentation or finite-type/topologically-noetherian
alternative. Lu–Zheng also discuss a distinct exceptional-locus criterion for
nearby base change. Neither recheck identifies the unresolved finite-boundary
alternative with one of these statements. The checkpoint therefore leaves that
target unstated, with a source gap, rather than guessing what is finite or what
is bounded.

The four new nodes nominate two planets, **Valuation cohomology invariance** and
**Valuation support invariance**. H0 already nominates six planets for the
unsplit stage. The packet proposes separating scheme invariance from nearby and
tube exports during assembly; until that decision is applied, the nominations
must be reconciled to at most six planets in a single star. All node and stage
ids remain unchanged in this checkpoint.

The [handoff](../handoff/BP-ClassicalAdicEtaleCohomology--H1-valuation-exports.md)
records the source barrier, exact requests, verification and resumption order.
Completion requires the missing target statements, their coefficient and
presentation hypotheses, their dependency chains, and the corresponding
suggested signatures. The already available total-cohomology restatement and
the eleven accepted H0 exports are the fixed starting point for that work.
