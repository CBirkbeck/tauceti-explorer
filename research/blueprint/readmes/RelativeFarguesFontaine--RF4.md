# Relative Fargues–Fontaine curves and period geometry (part from RF4)

Blueprint for the roadmap `RelativeFarguesFontaine`, job `BP-RelativeFarguesFontaine--RF4` (issue #986).
Packet: `research/blueprint/packets/RelativeFarguesFontaine--RF4.json` (`"part": "RF4"`). Suggested Lean
file: `research/blueprint/suggested/RelativeFarguesFontaine--RF4.lean`. Handoff:
`research/blueprint/handoff/BP-RelativeFarguesFontaine--RF4.md`.

This part covers `RF4` with its two substages. `RF0`–`RF3` belong to `BP-RelativeFarguesFontaine--RF0`
(issue #985).

**Status: partial.** Both substages are decomposed, neither is closed. The packet has 5 nodes — the four of the
reviewed decomposition in this scope, **and one added**: the three notions of a `G`-torsor. 7 API items,
5 unit tests, 3 planets; it cites 21 declarations of the pinned libraries, records 9 gaps, makes 7 requests
and one structural proposal.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Sources — all four hashes reproduce

- **`FS-geometrization`** — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*.
  <https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf>, read 2026-09-16.
  SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905` — reproduced 24 September 2026.
- **`SW20-berkeley`** — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*.
  <https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf>, read 2026-09-16.
  SHA-256 `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc` — reproduced 24 September 2026.
- **`BMS18-integral`** — Bhargav Bhatt, Matthew Morrow, Peter Scholze, *Integral p-adic Hodge theory*.
  <https://arxiv.org/abs/1602.03148>, read 2026-09-16.
  SHA-256 `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a` — reproduced 24 September 2026.
- **`GR02-almost`** — Ofer Gabber, Lorenzo Ramero, *Almost ring theory*.
  <https://arxiv.org/abs/math/0201175>, read 2026-09-16.
  SHA-256 `c4ab39ad5cd3f95f12a4c2f1f100f0c9f91578c6cbe2085a1962d111df8d7dc8` — reproduced 24 September 2026.

## The one node that is not inherited

The decomposition has four nodes here and **none of them is a definition**: the geometric, cohomological and
Tannakian notions of a `G`-torsor appear only inside the statement of the theorem that compares them. The stage is
named *Tannakian transfer*, and PROTOCOL §0 requires that no definition of the sources be left out. So
`RF4:G-torsors/three-notions-of-G-torsor` was added, with an API outline and five unit tests.

**Its four locators were read directly from `Berkeley.pdf` in this session** — the file's SHA-256 reproduces the
recorded value byte for byte — by inflating the PDF's object streams and reading its text operators; the printed
pages were confirmed from the running heads:

- **printed p. 179** — the three definitions, as a displayed list;
- **printed p. 179**, immediately before them — why the sousperfectoid hypothesis is imposed;
- **printed p. 178**, footnote — that an exact `⊗`-functor is automatically faithful;
- **printed p. 170** — that the Tannakian definition is the working one and that meromorphy is tested on all
  algebraic representations.

A reviewer should check those four first.

## What the pinned libraries supply

`data/library-coverage.json` has no reviewed audit entry, so the pinned index was searched directly.

**Tau Ceti already has Tannaka reconstruction** — `tensorAutFunctor`, `pointsFunctorIsoTensorAutFunctor`,
`reconstructedPoint` and 122 further declarations — and both of the first two are cited here. But they are
reconstruction **over a field**, for finitely generated comodules over a Hopf algebra. The theorem of this layer is
the equivalence of three notions of **torsor** over a sousperfectoid analytic adic space over `ℤ_p`, proved through
étale descent of vector bundles on such spaces and the relative spectrum of a faithfully flat quasicoherent
algebra. It does not follow from the pinned statement, and no node here re-plans it.

Also cited: `IsAdicComplete` and `AdicCompletion` for the `f`-adic completion of the gluing lemma —
whose whole subtlety is that `R → R̂` may fail to be flat — `IsLocalization` for `R[f^{-1}]`, `Module.Projective`
for its finite-projectivity clause, and **`IsDiscreteValuationRing`**, because the base case of the étale-local
triviality argument is that at a geometric point `B^+` is a *product of complete discrete valuation rings with
algebraically closed residue field*, where every `G`-torsor is trivial.

**Absent at both pins**, as everywhere in this family: adic spaces, perfectoid rings and diamonds.

## RF4. Patching and modifications

An aggregate layer with no node of its own.

**Coverage: `partial`.** Aggregate layer over RF4:vector-bundles and RF4:G-torsors; no node of its own.

Remaining in this layer:

- Aggregate stage; inherits the remaining items of RF4:vector-bundles and RF4:G-torsors.

## RF4:G-torsors. Tannakian transfer

**The decomposition had no node for the three notions of a `G`-torsor**,
although the stage is named *Tannakian transfer* and its equivalence theorem is a statement about objects it did not
define. One was added, read directly from `Berkeley.pdf` in this session (SHA-256 reproduces byte for byte):

> **(Geometric)** A geometric `G`-torsor is an adic space `P → X` over `X` with an action of `G` over `X` such that
> étale locally on `X`, there is a `G`-equivariant isomorphism `P ≅ G × X`. **(Cohomological)** … an étale sheaf `Q` on
> `X` with an action of `G` such that étale locally `Q ≅ G`. **(Tannakian)** … an exact `⊗`-functor
> `P : Rep G → Bun(X)`.

with the two standing hypotheses and the reason for the second:

> There is the problem that in general, if `X` is an adic space over `ℤ_p`, it is not clear whether `G × X` is also an
> adic space. For this reason, we restrict to one class of spaces where this happens, at least when `G` is smooth.

Two further things the added node records. Exactness **implies** faithfulness — a footnote observes that the trivial
representation embeds into `V ⊗ V^∨`, so `O_X` embeds into `P(V) ⊗ P(V)^∨` and `P(V) ≠ 0` — so faithfulness is not an
extra hypothesis. And the Tannakian notion is the *working* one: meromorphy of a trivialization is tested on **all**
algebraic representations, which is precisely the condition the modification node uses.

The equivalence theorem then follows, with the bonus that a geometric `G`-torsor is itself sousperfectoid and locally
étale over a ball. And v-descent: `G`-torsors form a v-stack, bundles over `B^+_{Div^d}` descend, and any `G`-bundle
over `B^+_{Div^d_𝒴}(S)` is étale-locally trivial — because at a geometric point `B^+` is a **product of complete
discrete valuation rings with algebraically closed residue field**, where all torsors are trivial, and triviality lifts
along nilpotent thickenings.

**Tau Ceti already has Tannaka reconstruction** — 125 declarations including `tensorAutFunctor` and
`pointsFunctorIsoTensorAutFunctor` — but over a *field*, for finitely generated comodules over a Hopf algebra. The
transfer here is between three notions of *torsor* over a sousperfectoid adic space and does not follow from it. Saying
so in the stage text is the packet's structural proposal.

**Coverage: `partial`.** The three notions of a G-torsor and their equivalence, and v-descent with etale-local triviality over the completed divisor rings. This packet adds a definition node for the three notions, read directly from the Berkeley lectures in this session; the decomposition had only the equivalence theorem, which is a statement about objects it did not define. Tau Ceti already has Tannaka reconstruction over a field, which is cited, but the transfer here is between three notions of TORSOR over a sousperfectoid adic space and does not follow from it.

Remaining in this layer:

- KL15 Theorem 8.2.22 (c) and (d), used for the etale sheaf property and etale descent of vector bundles on sousperfectoid spaces, were not read.
- SW20 Proposition 6.3.3 (stability of sousperfectoidness under etale maps) was not read.
- The reference [GR03, Proposition 5.4.21] used by FS for etale-local triviality of G-torsors over B^+ could not be matched in the locally available copy of Gabber-Ramero (see gaps).
- Independence of the faithful representation and compatibility with extension of structure group are asserted by the stage text; only the general Tannakian equivalence was read.

### `three-notions-of-G-torsor` — Scholze-Weinstein 19.5: the geometric, cohomological and Tannakian notions of a G-torsor

*definition.* **Planet: The three notions of G-torsor.**

**Statement.** Let G be a SMOOTH affine group scheme over Z_p and X an analytic adic space over Z_p that is SOUSPERFECTOID, so that every Y in X_et is again sousperfectoid and in particular an adic space, O_{X_et} is an etale sheaf, and so are vector bundles. Write G also for the adic space with G(S) = G(O_S(S)). A GEOMETRIC G-torsor is an adic space P -> X with a G-action over X such that etale-locally on X there is a G-equivariant isomorphism P = G x X. A COHOMOLOGICAL G-torsor is an etale sheaf Q on X with a G-action such that etale-locally on X there is a G-equivariant isomorphism Q = G. A TANNAKIAN G-torsor is an EXACT tensor-functor P : Rep G -> Bun(X), where Bun(X) is the category of vector bundles on X. Scholze-Weinstein say that for their purposes the Tannakian definition is the easiest, and it is the one in which the meromorphy of a trivialization is tested: a trivialization is meromorphic along a divisor if and only if the corresponding statement holds for the vector bundles attached to ALL algebraic representations of G.

**Hypotheses that must not be dropped.**

- G must be SMOOTH: it is what makes P -> X smooth by descent, hence admits etale-local sections, so that the geometric and cohomological notions may be taken on the etale site rather than the fppf site
- X must be analytic over Z_p and SOUSPERFECTOID, locally Spa(R,R^+) with R sousperfectoid. Scholze-Weinstein explain the reason: in general, for an adic space X over Z_p, it is not clear whether G x X is an adic space at all, and sousperfectoidness is the class where it is
- The convention G(S) = G(O_S(S)) identifies the group scheme with an adic space; without it the geometric notion cannot be stated
- The tensor-functor of the Tannakian notion must be EXACT. Scholze-Weinstein note in a footnote that any exact tensor-functor is automatically faithful, since the trivial representation embeds into V tensor V^dual for any V, so O_X embeds into P(V) tensor P(V)^dual and P(V) is nonzero
- Meromorphy of a trivialization is tested on ALL algebraic representations of G; it is not automatic from one faithful representation without its tensor constructions

**Proof outline.**

1. Scholze-Weinstein first record the scheme-theoretic version and its proof, then restrict to sousperfectoid adic spaces because G x X need not be an adic space in general.
2. They then give the three definitions as a displayed list and state their equivalence as Theorem 19.5.2, which is the next node.
3. In section 19.1 they say that for their purposes the Tannakian definition is the easiest, and use it to define meromorphy of a trivialization representation by representation.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `IsGeometricTorsor` | data | An adic space P -> X with a G-action over X, etale-locally G-equivariantly isomorphic to G x X. |
| `IsCohomologicalTorsor` | data | An etale sheaf Q on X with a G-action, etale-locally G-equivariantly isomorphic to G. |
| `TannakianTorsor` | data | An EXACT tensor-functor Rep G -> Bun(X). This is the working definition, and the one in which meromorphy is tested. |
| `TannakianTorsor.faithful` | structure | Exactness implies faithfulness automatically, because the trivial representation embeds into V tensor V^dual; so faithfulness is not an extra hypothesis. |
| `sousperfectoid` | structure | The standing hypothesis on X: locally Spa(R,R^+) with R sousperfectoid, i.e. admitting a perfectoid R-tilde with R -> R-tilde split as topological R-modules. It is what makes G x X an adic space and O_{X_et} an etale sheaf. |
| `groupAsAdicSpace` | coercion | The convention G(S) = G(O_S(S)) turning the affine group scheme into an adic space, without which the geometric notion cannot be stated. |
| `meromorphic` | characterisation | A trivialization is meromorphic along a divisor iff the associated map of vector bundles is, for EVERY algebraic representation; this is the condition the modification node uses. |

Derived from where the object is used:

- in `RelativeFarguesFontaine:RF4:G-torsors/three-descriptions-of-G-torsors` — the equivalence theorem is about exactly these three categories
- in `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor` — meromorphy of a modification is defined representation by representation through the Tannakian notion
- in `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality` — the v-descent proof reduces to GL_n via the Tannakian description, and etale-local triviality is a statement about the geometric one

**Unit tests.** A plausible wrong definition fails one of these.

- `GL_n_case` — For G = GL_n all three notions are vector bundles of rank n; a definition under which they differ there is wrong.
- `smoothness_moves_fppf_to_etale` — Smoothness of G is what lets the etale site replace the fppf site: P -> X is then smooth by descent and admits etale-local sections. Without it the definitions must be taken fppf-locally.
- `sousperfectoid_is_not_cosmetic` — Without sousperfectoidness it is not clear that G x X is an adic space at all, so the geometric notion may not even be statable; the source says so in terms.
- `exactness_gives_faithfulness` — An exact tensor-functor is automatically faithful; adding faithfulness as a hypothesis is redundant, and omitting exactness is not.
- `meromorphy_needs_all_representations` — Meromorphy is tested on all algebraic representations. Testing on one faithful representation alone, without its tensor constructions, is strictly weaker and is not the source's condition.

**Acceptance.**

- Check that the three notions agree for G = GL_n, where all three are vector bundles of rank n
- Check that smoothness is used: exhibit where the etale site replaces the fppf site
- Check that meromorphy tested on a single faithful representation, without its tensor constructions, is strictly weaker

**Prerequisites.** `AdicSpacesPartII:R2`, `AdicSpacesPartII:R3`, `PerfectoidSpaces:P2`, `PerfectoidSpaces:P3`, `BunGAndNewtonStrata:BG0`, `tauceti:TauCeti.AffineGroupSchemeCat`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`, `tauceti:TauCeti.Tannaka.tensorAutFunctor`, `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:Representation`, `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:Module.Projective`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.ValuationSpectrum.spa`

**Sources.**

- `SW20-berkeley` — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, 19.5, printed p. 179.

  > (Geometric) A geometric G-torsor is an adic space P -> X over X with an action of G over X such that etale locally on X, there is a G-equivariant isomorphism P = G x X. (Cohomological) A cohomological G-torsor is an etale sheaf Q on X with an action of G such that etale locally on X, there is a G-equivariant isomorphism Q = G. (Tannakian) A Tannakian G-torsor is an exact tensor-functor P ...

  The three definitions verbatim. Read directly from Berkeley.pdf in this session; the file's SHA-256 reproduces the recorded value, and the printed page was confirmed from the running head.
- `SW20-berkeley` — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Before the three definitions, printed p. 179.

  > There is the problem that in general, if X is an adic space over Z_p, it is not clear whether G x X is also an adic space. For this reason, we restrict to one class of spaces where this happens, at least when G is smooth. ... assume from now on that G is smooth, and that X is an analytic adic space over Z_p that is sousperfectoid.

  The reason the sousperfectoid hypothesis is imposed, which the stage text asks to be retained rather than assumed away.
- `SW20-berkeley` — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Footnote 1 to 19.5, printed p. 178.

  > any exact tensor-functor is faithful, as the trivial representation embeds into V tensor V^dual for any V in Rep G, and so O_X embeds into P(V) tensor P(V)^dual, thus P(V) is nonzero.

  Records that faithfulness is automatic from exactness, so it is not an extra hypothesis on a Tannakian torsor.
- `SW20-berkeley` — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, 19.1, printed p. 170.

  > For our purposes, it is easiest to define G-torsors in terms of the Tannakian formalism, i.e., as exact tensor-functors from the category Rep_C G of algebraic representations of G towards the category of vector bundles; cf. Theorem 19.5.2 in the appendix. In this language, a trivialization of E is meromorphic along S-sharp if and only if this holds true for the corresponding vector ...

  The Tannakian definition is the working one, and it is where the meromorphy condition of the modification node is tested. Read directly from the hash-verified PDF in this session.

### `three-descriptions-of-G-torsors` — Equivalence of geometric, cohomological and Tannakian G-torsors on sousperfectoid spaces

*theorem.* **Planet: Three notions of G-torsor agree.**

**Statement.** Let G be a smooth affine group scheme and X an analytic adic space over Z_p that is sousperfectoid. The categories of geometric G-torsors (adic spaces P -> X with G-action, etale-locally G x X), cohomological G-torsors (etale sheaves with G-action, etale-locally G) and Tannakian G-torsors (exact tensor functors Rep G -> Bun(X)) are canonically equivalent, with the explicit comparison functors. Moreover any geometric G-torsor P -> X is itself sousperfectoid and locally etale over a ball over X.

**Hypotheses that must not be dropped.**

- G is SMOOTH; X is analytic over Z_p and SOUSPERFECTOID (locally Spa(R,R^+) with R sousperfectoid, i.e. admitting a perfectoid R-tilde with R -> R-tilde split as topological R-modules)
- Sousperfectoidness is what makes every Y in X_et an adic space (SW20 Prop. 6.3.3) and makes O_{X_et} and vector bundles etale sheaves (KL15 Thm 8.2.22(c))
- Step (2) uses etale descent of vector bundles (KL15 Thm 8.2.22(d)); step (3) uses that P(O_G(G)) is a faithfully flat R-algebra whose spectrum analytifies to the torsor
- Bun(X) means vector bundles on X, and the tensor functor must be exact

**Proof outline.**

1. (1) The etale sheaf of sections of a geometric torsor is a cohomological torsor.
2. (2) For a cohomological torsor Q and V in Rep G, the pushout Q x^G (V tensor_{Z_p} O_X) is a vector bundle by etale descent of vector bundles, and V -> Q x^G V is an exact tensor functor.
3. (3) For a Tannakian torsor P, write O_G(G) as a filtered colimit of objects of Rep G, extend P colimit-preservingly; then for affinoid X = Spa(R,R^+), P(O_G(G)) is faithfully flat over R and the analytification of its spectrum is a geometric torsor. Smoothness makes it locally etale over affine space, hence its analytification is locally etale over a ball, hence sousperfectoid by Prop. 6.3.3.
4. The three composites are equivalent to the identity.

**Acceptance.**

- Verify that the equivalence is independent of the chosen faithful representation of G
- Verify compatibility with extension of structure group along G -> H
- Check that the sousperfectoid hypothesis is satisfied by the annuli Y_{S,I} and by Spec B^+_dR-style bases before transferring the equivalence

**Prerequisites.** `RelativeFarguesFontaine:RF4:G-torsors/three-notions-of-G-torsor`, `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor`, `AdicSpacesPartII:R2`, `AdicSpacesPartII:R3`, `PerfectoidSpaces:P2`, `PerfectoidSpaces:P3`, `BunGAndNewtonStrata:BG0`, `tauceti:TauCeti.Tannaka.tensorAutFunctor`, `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`, `tauceti:TauCeti.AffineGroupSchemeCat`, `mathlib:CategoryTheory.Equivalence`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:Module.Projective`

**Sources.**

- `SW20-berkeley` — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Theorem 19.5.2, printed pp. 179-180.

  > The categories of geometric, cohomological, and Tannakian G-torsors on X are canonically equivalent. ... Moreover, any geometric G-torsor P -> X is itself a sousperfectoid adic space that is locally etale over a ball over X.

  Exact statement of the transfer used by this stage.
- `SW20-berkeley` — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Before Theorem 19.5.2, printed p. 179.

  > So, assume from now on that G is smooth, and that X is an analytic adic space over Z_p that is sousperfectoid ... By Proposition 6.3.3, any Y in X_et is itself sousperfectoid, and in particular an adic space. This implies that O_{X_et} is an etale sheaf by [KL15, Theorem 8.2.22 (c)] (that is acyclic on affinoid subsets), and the same holds for vector bundles.

  Records the two standing hypotheses (smooth G, sousperfectoid X) and the imported sheaf statements, which must not be dropped.

### `v-descent-and-local-triviality` — v-descent of G-torsors and etale-local triviality over the completed divisor rings

*theorem.* **Planet: v-descent and etale-local triviality.**

**Statement.** G-torsors on open subsets of S x-dot Spa Z_p form a v-stack (SW20 19.5.3). Applied to the completed divisor rings: the category of vector bundles over B^+_{Div^d} satisfies v-descent (check modulo powers of I_S and apply VI.1.4), hence by the Tannakian formalism so does the category of G-bundles; and any G-bundle over B^+_{Div^d_{Y-curly}}(S) is etale-locally on S trivial. Consequently Hck_{G,Div^d} and Gr_{G,Div^d} are small v-stacks with the quotient presentations by loop groups.

**Hypotheses that must not be dropped.**

- G reductive over O_E (resp. E, resp. E) for the local Hecke and Grassmannian statements; smooth affine for the general descent statement
- The v-descent proof reduces to GL_n via Tannaka, then uses that U x_{Spa Z_p} Spa Z_p[p^{1/p^infty}]^wedge_p is perfectoid, so the base change of the cover is a v-cover of perfectoid spaces
- Etale-local triviality over B^+: at a geometric point B^+ is a product of complete discrete valuation rings with algebraically closed residue field, so torsors are trivial; in general triviality modulo I_S implies triviality by lifting along nilpotent thickenings, and the passage from the residue to a neighbourhood is the step FS attribute to [GR03, Proposition 5.4.21]
- The isomorphism Hck = L^+G \ LG / L^+G is an isomorphism of ETALE stacks over Div^d, obtained after etale-local trivialization

**Proof outline.**

1. SW20 prove 19.5.3 by reducing to vector bundles via Tannaka, base changing to Z_p[p^{1/p^infty}]^wedge to make everything perfectoid, invoking v-descent for perfectoid spaces (Prop. 17.1.8) and then descending back along the split inclusion.
2. FS apply this modulo I_S^m and pass to the limit, obtaining v-descent for bundles and hence for G-bundles over B^+_{Div^d}.
3. The isomorphism E_1 = E_2 over B_{Div^d} is a section of an affine scheme over that ring, which again satisfies v-descent; smallness follows as in Prop. III.1.3.
4. Etale-local triviality of G-torsors over B^+ gives the double-quotient presentation of Hck and the single-quotient presentation of Gr.

**Acceptance.**

- Verify that the presentation is as etale stacks and not merely v-stacks
- Verify triviality of G-torsors on B^+ at a geometric point directly from the complete-discrete-valuation-ring description
- Check the affineness hypothesis on Z used in Definition VI.1.5, without which L^+Z and LZ need not be v-sheaves

**Prerequisites.** `RelativeFarguesFontaine:RF4:G-torsors/three-notions-of-G-torsor`, `RelativeFarguesFontaine:RF4:G-torsors/three-descriptions-of-G-torsors`, `DiamondsAndVStacks:D3`, `DiamondsAndVStacks:D4`, `PerfectoidSpaces:P2`, `RelativeFarguesFontaine:RF2:integral-divisors`, `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.GrothendieckTopology`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`, `mathlib:IsDiscreteValuationRing`, `mathlib:Module.Projective`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition VI.1.7, printed p. 193.

  > Any G-bundle over B^+_{Div^d_{Y-curly}}(S) is etale locally on S trivial. Indeed, if S is a geometric point then B^+_{Div^d_{Y-curly}}(S) is a product of complete discrete valuation rings with algebraically closed residue field, so that all G-torsors are trivial. In general, note that triviality of the G-torsor over B^+_{Div^d_{Y-curly}}(S) is implied by triviality modulo I_S (as one can ...

  Exact local-triviality argument and the imported reference whose numbering could not be matched in the locally available copy (see gaps). The excerpt is truncated here; the full quotation is in data/decompositions/RelativeFarguesFontaine.json, where the independent review checked it against the source.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition VI.1.5 and following, printed p. 192.

  > We note that we use affinity of Z to see that these are actually v-sheaves - this makes it possible to reduce to the v-sheaf property of the structure sheaf.

  Records the affineness hypothesis on the target scheme in the loop-space construction.
- `SW20-berkeley` — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Proof of Proposition 19.5.3, printed p. 180.

  > We use the Tannakian interpretation of G-torsors. This directly reduces us to the case of G = GL_n, i.e. vector bundles. ... Recall that U is sousperfectoid; in fact, more precisely, the product U' = U x_{Spa Z_p} Spa Z_p[p^{1/p^infty}]^wedge_p is a perfectoid space.

  The proof route of the imported descent theorem, showing where sousperfectoidness enters.

## RF4:vector-bundles. Linear patching

The Beauville–Laszlo gluing lemma: for `f` a nonzerodivisor in `R`,
modules on which `f` is a nonzerodivisor are the same as triples (a module over the `f`-adic completion, a module over
`R[f^{-1}]`, and a comparison isomorphism), and `M` is finite projective exactly when both halves are.

**The non-noetherian hypotheses are the content.** Scholze–Weinstein say why in one sentence:

> This does not follow from fpqc descent because of two subtle points: `R → R̂` might not be flat if `R` is not
> noetherian, and also we have not included a descent datum on `R̂ ⊗_R R̂`.

Applied with `R` the ring of an annulus chart and `f` a local generator of the Cartier ideal, it glues a bundle off the
divisor to a bundle on the formal neighbourhood along an isomorphism on the punctured neighbourhood.

That is what makes a **meromorphic modification** describable: an isomorphism off `D` that extends to `ℱ → ℱ'(kD)` for
`k ≫ 0`, tested on **every** representation in the Tannakian description. And it is what identifies `Gr_G/φ^ℤ → Div¹`
with the moduli of a divisor, a bundle, and a modification from the trivial bundle.

`Gr_G` itself is `GeometricSatakeAndFusion`'s object; this layer supplies the linear half it rests on, and the atlas
edge runs from here to there — the right direction, unlike the two edges inside this roadmap that the companion packet
proposes correcting.

**Coverage: `partial`.** The Beauville-Laszlo gluing lemma for NON-NOETHERIAN coefficient rings, and the meromorphic modification at a degree-one divisor that it makes possible. The non-noetherian hypotheses are the content: Scholze-Weinstein point out that R -> R-hat may fail to be flat and that no descent datum on the double completion is included, so the lemma does NOT follow from fpqc descent. This layer supplies the linear half of the Beauville-Laszlo description of the affine Grassmannian; Gr_G itself is GeometricSatakeAndFusion's object, and the atlas edge runs from here to there, which is the right direction.

Remaining in this layer:

- Only the statement of SW20 Lemma 5.2.9 was read; its proof (Beauville-Laszlo, Un lemme de descente, CRAS 1995) was not, so the non-noetherian argument itself is unverified.
- Compatibility of the gluing with tensor, dual, base change and several disjoint divisors is asserted by the stage text but no source proof of these compatibilities was read.
- Essential surjectivity and full faithfulness are packaged inside Lemma 5.2.9; the separate 'comparison on morphisms' the stage text asks for was not isolated.

### `beauville-laszlo-module-gluing` — The Beauville-Laszlo gluing lemma for non-noetherian coefficient rings

*lemma.*

**Statement.** Let R be a commutative ring, f in R a nonzerodivisor and R-hat the f-adic completion of R. Then the category of R-modules M on which f is a nonzerodivisor is equivalent to the category of triples (M_{R-hat}, M_{R[f^{-1}]}, beta) where f is a nonzerodivisor on the R-hat-module M_{R-hat}, M_{R[f^{-1}]} is an R[f^{-1}]-module, and beta : M_{R-hat}[f^{-1}] -> M_{R[f^{-1}]} tensor_R R-hat is an isomorphism. Under this equivalence M is finite projective if and only if M_{R-hat} and M_{R[f^{-1}]} are finite projective.

**Hypotheses that must not be dropped.**

- f is a nonzerodivisor in R; M is required to have f a nonzerodivisor
- No noetherian or flatness hypothesis is imposed, and this is essential: Scholze-Weinstein point out that R -> R-hat may fail to be flat and that no descent datum over R-hat tensor_R R-hat is included, so the statement does NOT follow from fpqc descent
- The finite projectivity criterion is part of the lemma, not an addendum

**Proof outline.**

1. Scholze-Weinstein state the lemma as the key input for the equivalence between finite projective A-modules and locally finite free O_X-modules on a sheafy analytic adic space (Theorem 5.2.8, attributed to KL15 Theorem 2.7.7 and Kedlaya).
2. They record the two subtleties that block a descent-theoretic proof: possible non-flatness of R -> R-hat and the absence of a descent datum on the double completion.
3. Applying it with R the ring of an annulus chart and f a local generator of the Cartier ideal I_S gives the gluing of a bundle off D_S, a bundle on the formal neighbourhood, and an isomorphism on the punctured neighbourhood.

**Acceptance.**

- Verify the lemma on a non-noetherian example, e.g. R = W_{O_E}(R^+)[1/[varpi]] and f = xi
- Verify that the equivalence is compatible with tensor products and duals, and with several disjoint divisors by iterating
- Verify the finite-projectivity clause in both directions

**Prerequisites.** `RelativeFarguesFontaine:RF2:integral-divisors`, `RelativeFarguesFontaine:RF2:untilts`, `mathlib:IsAdicComplete`, `mathlib:AdicCompletion`, `mathlib:IsLocalization`, `mathlib:Module.Projective`, `mathlib:Module.Free`, `mathlib:Ideal.span`

**Sources.**

- `SW20-berkeley` — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Lemma 5.2.9, printed p. 38.

  > Let R be a commutative ring, let f in R be a non-zero-divisor, and let R-hat be the f-adic completion of R. Then the category of R-modules M where f is not a zero-divisor is equivalent to the category of pairs (M_{R-hat}, M[f^{-1}], beta) ... Under this equivalence, M is finite projective if and only if M_{R-hat} and M_{R[f^{-1}]} are finite projective.

  Verbatim statement including the finite-projectivity criterion required by this stage.
- `SW20-berkeley` — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, After Lemma 5.2.9, printed p. 38.

  > This does not follow from fpqc descent because of two subtle points: R -> R-hat might not be flat if R is not noetherian, and also we have not included a descent datum on R-hat tensor_R R-hat.

  States exactly why the non-noetherian hypotheses must be retained, matching the stage text.

### `meromorphic-modification-at-a-divisor` — Modifications at a degree-one divisor and the Beauville-Laszlo description of Gr_G

*comparison.*

**Statement.** For E, E' bundles (or G-bundles) on X_S and D in Div^1(S), a modification between E and E' at D is an isomorphism E|_{X_S \ D} -> E'|_{X_S \ D} that is meromorphic along D, meaning that for every representation the associated isomorphism of vector bundles extends to a morphism F -> F'(kD) for k >> 0 via F' -> F'(kD). Beauville-Laszlo gluing identifies Gr_G/phi^Z -> Div^1 with the moduli of D in Div^1(S), E in Bun_G(X_S), and a modification between the trivial G-bundle and E at D.

**Hypotheses that must not be dropped.**

- D is a degree-one closed Cartier divisor, so I_D is invertible and the formal neighbourhood is Spec B^+_dR(R^sharp)
- Meromorphy is tested on all representations in Rep_E(G) in the Tannakian description; it is not automatic
- Gr_G is the B^+_dR-affine Grassmannian: G-torsors on Spec B^+_dR(R^sharp) with a trivialization over Spec B_dR(R^sharp); FS consider it 'absolutely' over Spd(E) rather than over a fixed algebraically closed C
- The identification is quoted from SW20 Proposition 19.1.2

**Proof outline.**

1. Recall Gr_G over Spd E as the etale sheafification of (R,R^+) -> G(B_dR(R^sharp))/G(B^+_dR(R^sharp)), equivalently as G-torsors on Spec B^+_dR with a trivialization over Spec B_dR (SW20 19.1.2, proved by showing every such torsor is etale-locally trivial, lifting trivializations along Spec B^+_dR/xi^n using H^1_et(S^sharp,O)=0).
2. Since S^sharp is a closed Cartier divisor in the ambient space, the Beauville-Laszlo lemma turns a torsor on the formal neighbourhood plus a trivialization on the punctured neighbourhood into a torsor on the complement glued to a torsor near D.
3. Descending along phi^Z gives the map Gr_G/phi^Z -> Div^1 and hence the morphism of v-stacks Gr_G -> Bun_G.

**Acceptance.**

- Verify the meromorphy condition is representation-independent for a faithful representation plus its tensor constructions
- Verify the case G = GL_n against the classical lattice description of Gr
- Verify the compatibility of the modification with tensor products and duals

**Prerequisites.** `RelativeFarguesFontaine:RF4:G-torsors/three-notions-of-G-torsor`, `RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing`, `RelativeFarguesFontaine:RF2:untilts`, `RelativeFarguesFontaine:RF3`, `RelativeFarguesFontaine:RF1`, `BunGAndNewtonStrata:BG0`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:Representation`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `mathlib:Module.Projective`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, III.3, printed p. 97.

  > a modification between E and E' at D is an isomorphism E|_{X_S \ D} -> E'|_{X_S \ D} that is meromorphic along D. The latter means that for any representation in Rep_E(G), the associated isomorphism between vector bundles, F|_{X_S \ D} -> F'|_{X_S \ D} extends to a morphism F -> F'(kD) for k >> 0 via F' -> F'(kD). Beauville-Laszlo gluing then identifies Gr_G/phi^Z -> Div^1 with the moduli ...

  Verbatim definition of meromorphic modification and the Beauville-Laszlo identification with its citation. The excerpt is truncated here; the full quotation is in data/decompositions/RelativeFarguesFontaine.json, where the independent review checked it against the source.
- `SW20-berkeley` — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Proof of Proposition 19.1.2, printed p. 170.

  > Recall that S^sharp -> S x-dot Spa Z_p x_{Spa C^flat x-dot Spa Z_p} U is a closed Cartier divisor by Proposition 11.3.1. Thus, the identification with G-torsors over this locus follows from the Tannakian formalism and the Beauville-Laszlo lemma, Lemma 5.2.9.

  Shows that the imported identification is exactly Beauville-Laszlo plus Tannaka, so this stage supplies the linear half.

## Requests

- **`AdicSpacesPartII:R2`** — Analytic adic spaces and their etale site. The whole of RF4:G-torsors is stated for an analytic adic space over Z_p, and the etale-local conditions in the three definitions are conditions on that site.
- **`AdicSpacesPartII:R3`** — Sousperfectoid rings and spaces, with the stability of sousperfectoidness under etale maps. Scholze-Weinstein impose this hypothesis because, for a general adic space X over Z_p, it is not clear that G x X is an adic space at all; the decomposition records SW20 Proposition 6.3.3 as unread.
- **`PerfectoidSpaces:P2`** — Perfectoid pullback and rational localisations. Sousperfectoidness is defined by the existence of a perfectoid R-tilde with R -> R-tilde split, and the v-descent proof base changes to a perfectoid cover.
- **`PerfectoidSpaces:P3`** — Almost purity and the finite-etale site, on which the etale sheaf property of vector bundles over sousperfectoid spaces rests; the decomposition records KL15 Theorem 8.2.22 (c) and (d) as unread.
- **`BunGAndNewtonStrata:BG0`** — Torsors with reductive structure group, the ambient notion of G-bundle. The atlas already links this layer into RF4:G-torsors, and the Tannakian description of a G-bundle used throughout this part is its object.
- **`DiamondsAndVStacks:D3`** — Effective descent and the v-topology, in which the v-stack statement for G-torsors and the v-descent of vector bundles over the completed divisor rings are made.
- **`DiamondsAndVStacks:D4`** — Small v-stacks and diamonds, needed for the smallness of the local Hecke stack and the Grassmannian and for their quotient presentations.

## Gaps

The decomposition's seven gaps are roadmap-wide and are carried in both parts; two are added here.

### Fargues' [Far20b] is absent from the supplied library

FS cite [Far20b] (L. Fargues) for (a) the equivalence of their Definition II.1.19 with a relative-Cartier-divisor definition (Remark II.1.20), (b) Remark VI.1.3's characterisation of Div^d(S) by geometric fibres, and (c) Corollary II.2.4 (Far20b Proposition 2.12) and the Lubin-Tate/Artin reciprocity comparison in Section 2.3. Searched the supplied library: CATALOGUE.json and the diamonds source files list no Fargues single-author paper besides FarguesFontaine_Courbes. NEXT SOURCE ACTION: obtain L. Fargues, 'Simple connexite des fibres d'une application d'Abel-Jacobi et corps de classes local' (Ann. Sci. ENS, author-hosted preprint) and read Definition 2.6, Proposition 2.12 and Section 2.3. Until then the geometric-fibre criterion is recorded as an unread import, not as an established input.

### [GR03, Proposition 5.4.21] could not be matched in the locally available Gabber-Ramero copy

FS's proof of Proposition VI.1.7 concludes etale-local triviality of G-torsors over B^+_{Div^d} by citing [GR03, Proposition 5.4.21], i.e. the Springer LNM 1800 (2003) edition of Gabber-Ramero 'Almost ring theory'. The library copy is arXiv:math/0201175v3, the 2002 'sixth (and final) release'; in that numbering Proposition 5.4.21 (PDF p. 121) is a henselian-approximation density statement ('Let X be a smooth quasi-projective R[t^{-1}]-scheme ... the natural map X(R[t^{-1}]) -> X(R^wedge[t^{-1}]) has dense image'), while the torsor lifting/descent results are in Section 5.8 (e.g. Theorem 5.8.14, PDF p. 148, which resumes the assumptions of 5.4.21). The two editions plausibly renumber. NEXT SOURCE ACTION: consult the published LNM 1800 numbering (or a copy with the 2003 pagination) to identify the exact cited statement, then check that the hypotheses (henselian pair, smooth quasi-projective scheme, (t,I)-adic completion) are actually satisfied by B^+_{Div^d}(S) -> B^+/I_S. Recorded as an unresolved import boundary, not as an input package.

### Sousperfectoid machinery is quoted but unread

Three separate steps rest on sousperfectoid theory that was located but not read: (i) FS II.1.1 cites [HK20] and [SW20, Section 6.3] for descending sheafiness along the split inclusion; (ii) the Stein exhaustion asserts Y_{(R,R^+),I} is affinoid sousperfectoid; (iii) SW20 Theorem 19.5.2 needs Proposition 6.3.3 and KL15 Theorem 8.2.22 (c),(d). Verified present in the library: Scholze-Weinstein Berkeley PDF Definition 6.3.1 and Example 6.3.2 were read (printed p. 47). KedlayaLiu_RelativePadicHodgeFoundations.pdf is present in the library (sha256 a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942) but Theorem 8.2.22 was not read. Hansen-Kedlaya 'Sheafiness criteria for Huber rings' was NOT found in the library (unchecked beyond CATALOGUE.json and the diamonds source files). NEXT SOURCE ACTION: read SW20 Proposition 6.3.3 and KL15 Theorem 8.2.22, and locate Hansen-Kedlaya.

### Ramified Witt vector foundations are assumed, not decomposed

FS state the existence and uniqueness of the pi-adically complete flat O_E-lift and the Teichmueller section in one sentence with no proof and no citation. The stage text explicitly warns that 'A general E is not obtained by renaming p in a formula'. Nothing in the passages read proves the mixed-characteristic comparison with W(-) tensor-hat_{W(F_q)} O_E or the change-of-uniformizer isomorphism. NEXT SOURCE ACTION: read a ramified-Witt-vector source (Hazewinkel, 'Formal groups and applications', Ch. IV; or Drinfeld's pi-typical Witt vectors; or Fargues-Fontaine Courbes Chapter 1, which is in the library as FarguesFontaine_Courbes.pdf, sha256 cc159f38a3801c736b71ecea363496abe7706550bfb416600718ee9933922ca3) and decompose the universal property there.

### Classical points of Y_C and X_C are not covered by any RF stage text

FS II.1.6-II.1.14 and Definition/Proposition II.1.22 (classical points, the bijection with untilts, Proposition II.1.11's Spm(B) = |U|^cl, Corollary II.1.12's principal-ideal-domain property, Lemma II.1.14's inertia-surjectivity point used later in IV.7.3) were read but correspond to no stage text in the RelativeFarguesFontaine roadmap. They are consumed by VectorBundlesAndIsocrystals VB2:classification ('Geometric points') and by DiamondSixOperations/Drinfeld's lemma. They are decomposed in the VectorBundlesAndIsocrystals packet of this job rather than duplicated here. Flagged as a possible scope correction to the RF roadmap text.

### F4 supplies the fixed-field Q_p estimate only; the ramified relative assembly of FS II.1.4 has no supplier

Added by independent review. The proposed edge FarguesFontaineDiamonds:F4 -> RelativeFarguesFontaine:RF2:untilts was checked against F4's atlas description, which fixes Q_p coefficients ('sections of Y_F-diamond -> S with maps S -> Spd Q_p', 'marked untilts of S over Q_p') and a fixed perfectoid field F. The coefficient-independent part of what RF2:untilts needs - the maximum-modulus / Shilov-boundary statement for one-variable period annuli, the perfectoidness of their compatible-root base extension, and the transfer through the split topological-module base extension - is inside F4's stated scope. The ramified and relative part is not: FS II.1.4 (printed p. 50) works over W_{O_E}(R^+) with xi = pi - a[varpi] obtained from pi = varpi^sharp theta(a), normalizes the spectral norm on each completed residue field of Y-curly_S by |[varpi]| = 1/q, and only then reduces the maximum principle to a geometric point. No stage in the atlas is declared to own that ramified relative step; RF2:untilts does it itself, and this packet decomposes it there. NEXT ACTION (orchestrator): either accept the edge as an analytic-estimate-only edge with this limitation recorded, or widen F4's stage text to cover a general nonarchimedean local coefficient field E, or add the ramified estimate as an explicit obligation of RF2:untilts. Also note the atlas currently lists F4's only consumer as RelativeFarguesFontaine:RF3, and RF2:untilts' requires does not contain F4, so integrating this packet adds a new stage edge; a reachability check confirms it introduces no cycle in stageEdges.

### Atlas substage order is the reverse of the source's proof order: RF0 -> RF0:integral-Y and RF2:untilts -> RF2:integral-divisors, while the atlas has both edges the other way

Added by independent review. Both links are source-correct at NODE level. (a) Y-curly_S is defined as Spa W_{O_E}(R^+) minus V([varpi]) (printed p. 47), so the ramified Witt construction precedes the integral period space; but the atlas has RelativeFarguesFontaine:RF0:integral-Y -> RF0. (b) The proof of Proposition VI.1.2 (printed p. 191) says 'Each of the xi_i defines a closed Cartier divisor by Proposition II.1.4', so the single-untilt norm estimate of RF2:untilts precedes the degree-d product construction of RF2:integral-divisors; but the atlas has RF2:integral-divisors -> RF2:untilts. In both cases the SOURCE's order of proof is the reverse of the atlas's substage order. CONSEQUENCE AND DECISION NEEDED. The node-level link graph of all thirteen packets of this job is ACYCLIC (197 nodes, 210 edges, checked). The cycle appears only if node links are lifted to stage edges and unioned with data/atlas.json stageEdges. Nothing was reversed here, because reversing would misstate the source. The orchestrator must choose: (i) treat these as node-level edges only and do not lift them to stage edges at integration; (ii) re-parent the offending node (or split it) so that its stage matches the source's order; or (iii) revise the atlas substage ordering. Option (iii) is the one the source actually supports in each case.

### The three notions of G-torsor had no node; one was added from a source read in this session

The reviewed decomposition has four nodes in this part and none of them is a definition: the geometric, cohomological and Tannakian notions of a G-torsor appear only inside the statement of the equivalence theorem that compares them. The stage is named 'Tannakian transfer' and its text asks for the transfer, and PROTOCOL section 0 requires that no definition of the sources be left out. A node was therefore added, RelativeFarguesFontaine:RF4:G-torsors/three-notions-of-G-torsor, with an API outline and five unit tests. Its four locators were read directly from Berkeley.pdf in this session, from a file whose SHA-256 reproduces the recorded value byte for byte, by inflating the PDF's object streams and reading its text operators; the printed pages were confirmed from the running heads. They are: the three definitions as a displayed list on printed p. 179; the paragraph immediately before them explaining that the sousperfectoid hypothesis is imposed because for a general adic space over Z_p it is not clear that G x X is an adic space; the footnote on p. 178 recording that any exact tensor-functor is automatically faithful, so faithfulness is not an extra hypothesis; and the sentence on printed p. 170 that the Tannakian definition is the working one and that meromorphy of a trivialization is tested on ALL algebraic representations. A reviewer should check these four first, since they are the only content of this packet not inherited from the reviewed decomposition.

### Tau Ceti has Tannaka reconstruction, but over a field; the transfer here is a different statement

data/library-coverage.json has no reviewed audit entry for this roadmap, so the pinned declaration index was searched directly. Tau Ceti at f790474 has a substantial Tannaka development, 125 declarations across twelve files under TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/, including tensorAutFunctor and pointsFunctorIsoTensorAutFunctor, and both are cited here. But they are RECONSTRUCTION over a field, for finitely generated comodules over a Hopf algebra, and the theorem of this layer is the equivalence of three notions of TORSOR over a sousperfectoid analytic adic space over Z_p, whose proof runs through etale descent of vector bundles on such spaces and through the relative spectrum of a faithfully flat quasicoherent algebra. It does not follow from the pinned statement, and no node here plans the pinned statement again. Also cited from the pinned libraries: IsAdicComplete and AdicCompletion for the f-adic completion of the Beauville-Laszlo lemma, IsLocalization for R[f^{-1}], Module.Projective for its finite-projectivity clause, and IsDiscreteValuationRing, because the base case of the etale-local triviality argument is that at a geometric point B^+ is a PRODUCT OF COMPLETE DISCRETE VALUATION RINGS with algebraically closed residue field. Absent at both pins, as everywhere in this family: adic spaces, perfectoid rings and diamonds.

## Structural proposal

### RF4:G-torsors should say which Tannakian statement it owns, since the pinned libraries have the other one (`narrow-layer`)

The stage is called 'Tannakian transfer' and its text asks for the equivalence of the three notions of G-torsor, for independence of the chosen faithful representation and for compatibility with extension of structure group. At the pinned commit Tau Ceti already has Tannaka reconstruction - tensorAutFunctor, pointsFunctorIsoTensorAutFunctor, reconstructedPoint and 122 further declarations - over a FIELD, for finitely generated comodules over a Hopf algebra. That is a different statement from the one this layer needs, and the difference is exactly where the work is: the transfer here is over a sousperfectoid analytic adic space, its proof uses etale descent of vector bundles on such spaces and the relative spectrum of a faithfully flat quasicoherent algebra, and its conclusion includes that a geometric torsor is itself sousperfectoid and locally etale over a ball. Saying so in the stage text would stop a reader thinking the layer has to build the Tannakian formalism, and would make the boundary with the pinned library visible where it matters. The same narrowing is proposed for GeometricSatakeAndFusion:GS4:integral-dual-group in the packet for that roadmap's second part, for the same reason: Tau Ceti's Tannaka is over a field, and both consumers need something else.

## Planets

| layer | planets |
| --- | --- |
| `RF4` | — |
| `RF4:G-torsors` | The three notions of G-torsor; Three notions of G-torsor agree; v-descent and etale-local triviality |
| `RF4:vector-bundles` | — |

`RF4:vector-bundles` has no planet: both of its nodes are a lemma and a comparison, and PROTOCOL §14 allows only
definitions, constructions and named theorems.

## Nothing here is formalised

No Lean was compiled for this job and no statement in this packet is claimed to be formalised. The suggested file
is a set of signatures whose only proof is `sorry`; every `implementationStatus` is `unchecked`.
