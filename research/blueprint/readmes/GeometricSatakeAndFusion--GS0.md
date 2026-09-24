# Geometric Satake over the Fargues–Fontaine curve (part from GS0)

Blueprint for the roadmap `GeometricSatakeAndFusion`, job `BP-GeometricSatakeAndFusion--GS0` (issue #741).
Packet: `research/blueprint/packets/GeometricSatakeAndFusion--GS0.json` (`"part": "GS0"`). Suggested Lean file:
`research/blueprint/suggested/GeometricSatakeAndFusion--GS0.lean`. Handoff:
`research/blueprint/handoff/BP-GeometricSatakeAndFusion--GS0.md`.

This part covers the eight stages up to the Satake closure. `GS3:fusion` and the `GS4` substages belong to the
other part of this roadmap (`BP-GeometricSatakeAndFusion--GS3`, issue #742) and are not planned here.

**Status: partial.** All eight layers in scope are decomposed, none is closed. The packet has 16 nodes
(3 constructions, one definition, 10 theorems, one lemma, one comparison), 26 API items, 16 unit tests and
14 planets; it cites 25 declarations of the pinned libraries, records 10 gaps, makes 15 requests and 2
structural proposals.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Sources

All four sources are freely available, and **all four were downloaded again in this session and their SHA-256
hashes reproduce the recorded values byte for byte.** Every locator therefore rests on the same files the
independent review of the decomposition checked.

- **`FS-geometrization`** — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*. Author-hosted 356-page PDF (MPIM Bonn), inspected 2026-09-15; corresponds to arXiv:2102.13459v4 by metadata and contents, not by byte comparison. PDF page = printed page.
  <https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf>, read 2026-09-16.
  SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905` — reproduced 24 September 2026.
- **`BS17-witt-grassmannian`** — Bhargav Bhatt, Peter Scholze, *Projectivity of the Witt vector affine Grassmannian*. arXiv:1507.06490v3 [math.AG], 21 February 2017 (published Invent. Math. 209 (2017)); library PDF, printed page = PDF page
  <https://arxiv.org/abs/1507.06490>, read 2026-09-16.
  SHA-256 `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e` — reproduced 24 September 2026.
- **`Keel99-basepoint`** — Sean Keel, *Basepoint freeness for nef and big line bundles in positive characteristic*. Annals of Mathematics 149 (1999), 253-286; library copy is arXiv:math/9901149v1 (1 January 1999) with the Annals pagination printed. Printed page = PDF page + 252.
  <https://arxiv.org/abs/math/9901149>, read 2026-09-16.
  SHA-256 `2ec4141aea36ad77e5b504f01617ffbbe17de0af27f8b2c5f4a1f4ee6afde398` — reproduced 24 September 2026.
- **`SW20-berkeley`** — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*. Annals of Mathematics Studies 207; PDF dated 'March 27, 2020'. Printed page = PDF page - 10.
  <https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf>, read 2026-09-16.
  SHA-256 `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc` — reproduced 24 September 2026.

## What the pinned libraries have, and what they do not

`data/library-coverage.json` has **no reviewed audit entry for this roadmap**, so the pinned declaration index was
searched directly. The search cut both ways.

**Present, and cited rather than planned:**

- `mathlib:CategoryTheory.Triangulated.TStructure`, with `IsLE`, `IsGE` and a `Heart`. The abstract notion of a
  t-structure is pinned, so GS1 plans only the relative perverse *normalisation*.
- `mathlib:PerfectRing` and `mathlib:Perfection` — the perfect `F_p`-algebras and the perfection functor that
  Bhatt–Scholze work with throughout, and the reason their hypothesis cannot be dropped.
- `mathlib:AlgebraicGeometry.IsProper` and `mathlib:ValuationRing` — properness, and the rings the fibral descent
  criterion reduces to.
- `mathlib:CoxeterSystem` and `tauceti:TauCeti.TitsSystem.bruhatCell` for the Bruhat and dominance combinatorics;
  `mathlib:RootPairing` for `ρ`, the dominance order, `P_μ^-` and the weight decomposition of `Lie G`.
- `mathlib:CategoryTheory.LeftRigidCategory` — the pinned form of the dualizability conclusion that
  `HeckeStacksAndLocalShtukas` consumes.
- `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` for the line bundles `L`, `L̃` and `I_S^m/I_S^{m+1}`.

**Absent, at both pins:**

- Any **ampleness, nefness or semiampleness** in the algebro-geometric sense. The only declaration whose name
  contains `Ample` is `AmpleSet` in `Mathlib/Analysis/Convex/AmpleSet.lean`, the convex-analysis notion, which is
  unrelated. There is no `IsNef`, no semiample, no basepoint-freeness and no `Proj` of a graded ring. And no
  roadmap of the atlas owns projective or birational algebraic geometry. So the Keel criterion is planned here by
  default, and the second structural proposal asks whether that is right.
- Any loop group, affine Grassmannian, perfectoid space, diamond or shtuka.

## What is deliberately absent

FS IV.6 (hyperbolic localization and Braden's theorem) and IV.7 (Drinfeld's lemma), Bhatt–Scholze sections 2–7
and 8.2–8.3, Keel beyond 1.7–1.9, Zhu's mixed-characteristic Satake paper in its entirety, and Berkeley 19–21 were
**not read** by the decomposition, and several of them are load-bearing. No node is invented for them: they are
carried as gaps with a *next source action* naming exact printed pages, and the nodes that depend on them say so
in their own hypotheses.

## GS0. Beilinson–Drinfeld Grassmannians and loop groups

An aggregate layer with no node of its own: its three substages carry the mathematics
and its coverage is the union of theirs.

**Coverage: `partial`.** Aggregate layer over the three GS0 substages; it has no node of its own and its coverage is the union of theirs.

Remaining in this layer:

- Aggregate stage; inherits the remaining items of the three GS0 substages.

## GS0:Schubert-smoothness. Early geometric return to Bun_G

Two statements, and the first is the one the rest of the atlas
actually consumes. `Gr_{G,Div¹,μ} = L⁺G/(L⁺G)_μ` is cohomologically smooth of `ℓ`-dimension `⟨2ρ,μ⟩`. Fargues–Scholze
state it twice: as Proposition IV.1.18, where they write *"We defer the proof to Proposition VI.2.4 as we do not want to
make a digression on `Gr_G` here"*, and as VI.2.4 itself. So the `Bun_G` chart of
`VStackSheavesAndLisseCategories` really does rest on this layer.

The stabilizer is computed explicitly: `(L⁺G)_μ/(L⁺G)^{≥1}_μ = (P_μ^-)^◊` inside `G^◊`, and the higher graded pieces are
the weight-`≤ m` parts of `Lie G` under the adjoint `μ`-action. The GL_n case is a lattice computation; the general case
embeds `G → GL_n` compatibly with torus and Borel and forces the inclusions to be equalities.

The second statement is the **truncation lemma**, and it is small but load-bearing: the action of `L⁺G` on a bounded
locus factors through `(L⁺G)^{<m}` where `m` bounds the weights of `μ = Σ_j μ_j` on `Lie G`. The bound is by the weights
on the Lie algebra, not by `⟨2ρ,μ⟩`. It is what puts the bounded loci in the Artin-stack setting, and the proof of
VI.6.4 records that it is used — *"Implicitly, we pass here to a bounded part of `Hck` and replace the quotient by `L⁺G`
by a finite-dimensional quotient in order to be in the setting of Artin stacks."*

**Coverage: `partial`.** Cohomological smoothness of the open Schubert cell of l-dimension <2rho,mu>, with the explicit stabilizer computation, and the truncation lemma saying the loop action on a bounded locus factors through a finite congruence quotient. The first is the same statement as Proposition IV.1.18, whose proof Fargues-Scholze defer to here, so the Bun_G chart of VStackSheavesAndLisseCategories really does consume this layer. The second is what puts the bounded loci in the Artin-stack setting, and it is consumed by name in the proof of VI.6.4.

Remaining in this layer:

- SW20 Proposition 19.4.2, used in the GL_n lattice computation of VI.2.4, was not read.
- The stage text also asks for truncated positive loop groups and their congruence filtration by VECTOR-GROUP quotients with cohomological smoothness; VI.1.11 gives the graded pieces and their smoothness, but the truncated groups (L^+G)^{<m} themselves were not separately analysed.
- The descent of the Galois-orbit cells Gr_{G,mu-bar} was not read.

### `open-cell-stabilizer-and-smoothness` — FS VI.2.4 (= IV.1.18): the open Schubert cell is cohomologically smooth of l-dimension <2rho,mu>

*theorem.* **Planet: Smoothness of the open Schubert cell.**

**Statement.** The section [mu] : Div^1_Y-curly -> Hck_{G,Div^1,mu} given by mu(xi) for a local generator xi of I_S is a v-cover, giving Hck_{G,Div^1,mu} = [Div^1/(L^+G)_mu] where (L^+G)_mu is the closed stabilizer of [mu]. Its congruence quotients are (L^+G)_mu/(L^+G)^{>=1}_mu = (P_mu^-)^diamond inside L^+G/(L^+G)^{>=1} = G^diamond, and (L^+G)_mu^{>=m}/(L^+G)_mu^{>=m+1} = (Lie G)^diamond_{mu <= m}{m}, where P_mu^- is the parabolic with Lie algebra (Lie G)_{mu<=0} and (Lie G)_{mu<=m} is the weight-<=m part for the adjoint mu-action. Consequently Gr_{G,Div^1,mu} = L^+G/(L^+G)_mu is cohomologically smooth of l-dimension <2rho,mu> over Div^1_Y-curly.

**Hypotheses that must not be dropped.**

- [mu] is independent of the choice of local generator xi only up to the action of L^+G
- The l-dimension is <2rho,mu> with the standard half-sum-of-positive-roots normalization
- The GL_n case is proved by an explicit lattice computation using [SW20, Proposition 19.4.2] to see that the filtration steps Fil^i_Xi (R^sharp)^n are finite projective of rank the multiplicity of -i among k_1,...,k_n; SW20 19.4.2 was NOT read
- The general case is reduced to GL_n; Fargues-Scholze use this to prove Proposition IV.1.18, which is stated in Chapter IV with the proof deferred to here
- The proof of VI.2.4 additionally imports [SW20, Proposition 20.3.7] (Gr_{G,mu} closed in Gr_{GL_n,mu}) and [Sch17a, Lemma 12.5] (a qcqs closed immersion that is bijective on geometric points is an isomorphism); neither was read.

**Proof outline.**

1. Show [mu] is surjective on geometric points: for GL_n and S = Spa(R,R^+) with untilt S^sharp, localize so that the Fil^i_Xi (R^sharp)^n are free, choose a compatible basis e_1,...,e_n, lift to f_j and set g_j = xi^{k_j} f_j; then the f_j form a B_dR-basis and the g_j a B^+_dR-basis of Xi, moving Xi to the standard lattice xi^{k_1}B^+_dR + ... + xi^{k_n}B^+_dR.
2. Compute the stabilizer: matrices A with A_{ij} in xi^{k_i - k_j} B^+ for i < j; this gives the identification of the first congruence quotient with (P_mu^-)^diamond and of the higher ones with the weight-truncated Lie algebra.
3. Pass from GL_n to a general split G: pick a closed immersion G -> GL_n compatible with the torus and the Borel; the congruence subquotients of (L^+G)_mu embed into those for GL_n, and containment of L^+P_mu^- and of (L^+U_a)^{>=mu(a)} for every positive root a forces those inclusions to be equalities. Consequently L^+G/(L^+G)_mu -> L^+GL_n/(L^+GL_n)_mu is a closed immersion; its target is Gr_{GL_n,Div^1,mu}, which contains Gr_{G,Div^1,mu} as a closed subspace BY [SW20, PROPOSITION 20.3.7] (not read), and the two closed subspaces have the same geometric points, hence agree BY [Sch17a, LEMMA 12.5] (not read).
4. Deduce cohomological smoothness of L^+G/(L^+G)_mu of l-dimension <2rho,mu> from the graded-piece computation of Propositions VI.1.10-VI.1.12.

**Acceptance.**

- Check <2rho,mu> for a minuscule mu of GL_2 (should be 1)
- Check the parabolic P_mu^- appearing at level 1 for a nonminuscule mu
- Check that the section [mu] is independent of xi only up to L^+G

**Prerequisites.** `GeometricSatakeAndFusion:GS0:loop-geometry/congruence-filtration-and-graded-pieces`, `DiamondSixOperations:S4`, `DiamondSixOperations:S5`, `ReductiveGroupsPartII:RG2.3`, `mathlib:RootPairing`, `mathlib:Module.Free`, `mathlib:Module.Projective`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.2.4, printed pp. 198-199.

  > In particular, Gr_{G,Div^1_Y-curly,mu} = L^+_{Div^1}G/(L^+_{Div^1}G)_mu is cohomologically smooth of l-dimension <2rho,mu> over Div^1_Y-curly.

  The exact smoothness and dimension statement, which is the stage's deliverable to BG2.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.2.4, printed p. 198.

  > (L^+G)_mu/(L^+G)^{>=1}_mu = (P_mu^-)^diamond in L^+G/(L^+G)^{>=1} = G^diamond and (L^+G)^{>=m}_mu/(L^+G)^{>=m+1}_mu = (Lie G)^diamond_{mu<=m}{m}, where P_mu^- in G is the parabolic with Lie algebra (Lie G)_{mu<=0}, and (Lie G)_{mu<=m} in Lie G is the subspace on which mu acts via weights <= m via the adjoint action.

  The parabolic-flag base and unipotent-fibre description the stage text asks for.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition IV.1.18 and the sentence after it, printed p. 112.

  > For any mu in X_*(T)^+, the open Schubert cell Gr_{G,mu}/Spd E' is cohomologically smooth of l-dimension <2rho,mu>. We defer the proof to Proposition VI.2.4 as we do not want to make a digression on Gr_G here.

  Confirms that IV.1.18 and VI.2.4 are the same statement, so the Bun_G chart really consumes this stage.

### `truncation-of-the-loop-action` — FS VI.2.8: the loop action on a bounded locus factors through a finite truncation, with an explicit congruence bound

*lemma.*

**Statement.** For mu_bullet = (mu_j)_{j in J}, the action of L^+_{Div^d}G on Gr_{G,Div^d,<=mu_bullet} factors over (L^+G)^{<m} = L^+G/(L^+G)^{>=m}, where m is chosen so that for mu = sum_j mu_j all weights of mu on Lie G are <= m.

**Hypotheses that must not be dropped.**

- The bound m is determined by the WEIGHTS OF mu = sum_j mu_j ON Lie G under the adjoint action, not by the cocharacter's pairing with 2rho
- The verification is on geometric points, legitimate because everything is separated
- The reduction to d = 1 is by a decomposition into products at a geometric point

**Proof outline.**

1. Show that (L^+G)^{>=m} acts trivially; since everything is separated this may be checked on geometric points.
2. At a geometric point decompose into products to reduce to d = 1.
3. Apply Proposition VI.2.4, whose congruence description (L^+G)^{>=m}_mu/(L^+G)^{>=m+1}_mu = (Lie G)_{mu<=m}{m} shows that (L^+G)^{>=m} is contained in the stabilizer once all weights of mu on Lie G are <= m.

**Acceptance.**

- Compute the bound m explicitly for GL_2 and mu = (1,0), and for a nonminuscule mu
- Check that the truncated group (L^+G)^{<m} is a finite-dimensional-type object as needed to be in the Artin-stack setting
- Check that the bound depends on sum_j mu_j and not on the individual mu_j

**Prerequisites.** `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `mathlib:RootPairing`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.2.8 and proof, printed p. 201.

  > For any mu_bullet = (mu_j)_{j in J} as above, the action of L^+_{Div^d_Y-curly} G on Gr_{G,Div^d,<=mu_bullet} factors over (L^+_{Div^d}G)^{<m} where m is chosen so that for mu = sum_{j in J} mu_j, all weights of mu on Lie G are <= m.

  Exact statement including the explicit congruence bound the stage text demands.

## GS0:Witt-geometry. Projectivity and the special-fibre comparison

The Witt vector affine Grassmannian is representable by the **perfection
of a projective variety**. Two things about that are worth keeping straight, and the packet's node statement keeps them
apart: Bhatt–Scholze's Theorem 8.3 is about the type-`≤λ` functor on `Perf`, the category of perfect qcqs `F_p`-schemes,
while the introduction's Theorem 1.1 is about `Gr^{Waff,[a,b]}` on perfect *rings*. The translation between them was not
read.

`R` must be **perfect**: for a general `F_p`-algebra `W(R)` may have `p`-torsion and `W(R)/p → R` may fail to be an
isomorphism. And *perfectly finitely presented* is not finite type — Bhatt–Scholze call it an open question whether a
natural finite-type structure exists beyond the minuscule cells.

The proof runs on two legs. The line bundle `L` is descended from a Demazure resolution using **h-descent for vector
bundles on perfect schemes** and the fibral criterion: `E` descends iff it is trivial on every geometric fibre. (The
hypothesis moved between versions — Theorem 6.8 asks `Rf_*O_X = O_Y`, the published Theorem 1.3 asks only for connected
geometric fibres; Remark 1.4 records the change.) Then ampleness comes from **Keel's semiampleness criterion**, by
induction on `λ`. Bhatt–Scholze are explicit that there is no alternative:

> contrary to the situation in equal characteristic, we are not able to give a direct construction of enough sections of
> `L` which would give a projective embedding.

Keel's Theorem 1.9 needs `X` projective over a field of **positive characteristic** — it is false in characteristic
zero — and it applies only to projective schemes, so it is applied to the Demazure resolution and not to
`Gr_{≤λ}` directly.

**None of that positivity theory exists at the pins, and no roadmap of the atlas owns it.** The only `Ample` in Mathlib
is `AmpleSet` in convex analysis. Tau Ceti has the carrier, `InvertibleSheaf`, and nothing more. This layer also has no
incoming stage edge in the atlas at all. Both facts are recorded as gaps, and the second structural proposal asks
whether Keel's criterion should really be owned inside a layer about the Witt vector affine Grassmannian.

The layer closes with the Mirković–Vilonen cycles: `S_λ ∩ Gr^{Witt}_{G,≤μ}` is affine and equidimensional of dimension
`⟨ρ, μ+λ⟩`. The affineness proof *starts* from the ample bundle, which is exactly why this layer owns the projectivity
input.

**Coverage: `partial`.** The Witt vector affine Grassmannian as an ind-(perfection of a projective variety), the h-descent and fibral criterion that descends the Demazure line bundle, the ampleness argument through Keel's semiampleness criterion, and the affineness and equidimensionality of the Mirkovic-Vilonen cycles. This layer has no incoming stage edge in the atlas at all, and none of the projective algebraic geometry it needs - ampleness, nefness, semiampleness - exists in either pinned library or in any other roadmap. That is recorded as a gap and as a structural proposal rather than papered over.

Remaining in this layer:

- Bhatt-Scholze sections 2-7 were NOT read: the h-topology and abstract blowup squares (Thm. 2.9), perfect schemes and the perfection functor (section 3), the proof of Theorem 1.2 (section 4), the K-theoretic determinant (section 5, which the roadmap explicitly excludes), the rest of section 6 (Props. 6.1, 6.2, Lemmas 6.4, 6.11, Rem. 6.12) and section 7 (families of torsion W(k)-modules, Lemma 7.9).
- Bhatt-Scholze section 8.2 (the Demazure resolution) and 8.3 (the construction of L, Theorem 8.8), and Lemmas 8.9, 8.10, 8.11 used in the ampleness induction, were located but NOT read.
- Keel's sections 1-2 beyond Lemmas 1.7-1.8 and Theorem 1.9 were not read; in particular 1.4, 1.5, 1.6 and the EWM theory, and the Frobenius-power extension/descent of sections that the roadmap names as a sub-obligation.
- Zhu sections 1.1-1.4 and Appendix A, which the roadmap names for the perfect-space carrier, were NOT read (Zhu_MixedCharacteristicSatake.pdf is in the library, unread).
- Berkeley Lectures 19.2-19.3, 20.3-20.5 and Lecture 21, named for the integral family and bounded properness, were NOT read.
- The identification of the v-sheaf attached to the perfections with the fibre of GS0:loop-geometry over the characteristic-p point of Div^1_Y-curly was not located as a proved statement.

### `witt-lattice-functor-and-representability` — Bhatt-Scholze Theorem 8.3 (the section-8 form used to prove Theorem 1.1): the Witt vector affine Grassmannian is an ind-(perfection of a projective variety)

*theorem.* **Planet: The Witt vector affine Grassmannian.**

**Statement.** For a sequence lambda = (lambda_1,...,lambda_n,0,...) of non-negative integers, let Gr_{<=lambda} be the functor on Perf - the category of PERFECT QCQS F_p-SCHEMES with the v-topology (their Definition 3.2) - sending X in Perf to the set of finite projective W(O_X)-submodules E in W(O_X)^n such that the defining inclusion is an isogeny and the cokernel Q has type <= lambda. Then Gr_{<=lambda} is representable by a PROPER PERFECTLY FINITELY PRESENTED F_p-scheme carrying a natural AMPLE line bundle L; in particular it is the perfection of a projective F_p-scheme. The introduction's Theorem 1.1 is the corresponding statement for the functor Gr^{Waff,[a,b]} ON PERFECT RINGS R, parametrizing W(R)-lattices M in W(R)[1/p]^n lying between p^a W(R)^n and p^b W(R)^n: it is representable by the perfection of a projective algebraic variety over F_p, and consequently Gr^{Waff} is representable by an inductive limit of perfections of projective varieties.

**Hypotheses that must not be dropped.**

- R must be PERFECT: for a general F_p-algebra W(R) may have p-torsion and W(R)/p -> R may fail to be an isomorphism; for perfect R, W(R) is the unique p-adically complete flat Z_p-algebra lifting R
- A perfectly finitely presented scheme is NOT finite type; Bhatt-Scholze note it is an open question whether a natural finite-type structure exists beyond the minuscule cells, which are canonically perfections of classical Grassmannians
- Gr_{<=lambda} is a v-sheaf by their Theorem 4.1 and Corollary 4.4; Gr_lambda = Gr_{<=lambda} minus the union of Gr_{<=mu} for mu < lambda is open, and Gr_{<=mu} is a closed immersion for mu <= lambda (Lemma 7.9)
- Their proof is INDEPENDENT of Zhu's Theorem 8.2 (representability by the perfection of a proper algebraic space)
- Theorem 8.3 and Theorem 1.1 are NOT literally the same statement: 8.3 is about the type-<=lambda functor on Perf (perfect schemes), 1.1 about the functor Gr^{Waff,[a,b]} on perfect rings; Bhatt-Scholze say the results of sections 2-7 'are exploited to prove Theorem 1.1 in section 8'. The translation between 'cokernel of type <= lambda' and 'lattice between p^a W(R)^n and p^b W(R)^n' was NOT read.

**Proof outline.**

1. Construct the line bundle L on Gr_{<=lambda}. Two constructions are given (introduction, printed pp. 2-3): a K-theoretic one, extending det : K(R) -> Pic^Z(R) along the forgetful map alpha : K(R) -> K(W(R) on R) - easy when R is the perfection of a regular F_p-algebra by Quillen devissage, and in general reduced to that case 'using de Jong's alterations and h-descent for line bundles'; and a geometric one on the Demazure resolution Gr-tilde^{Waff,[a,b]} -> Gr^{Waff,[a,b]} parametrizing filtrations of p^a W(R)^n/M with gradeds finite projective R-modules, where L-tilde exists by definition and the problem becomes descending it.
2. Prove L is ample by induction on lambda, using Keel's semiampleness criterion applied to an h-cover (Keel applies only to projective schemes, so it is applied to the Demazure resolution, not to Gr_{<=lambda} directly).
3. Conclude representability by a proper perfectly finitely presented scheme with an ample line bundle, hence the perfection of a projective variety.

**Acceptance.**

- Check the minuscule cells against perfections of classical Grassmannians
- Check that the K-theoretic construction of L is optional, as the roadmap requires the geometric route
- Check the type-<=lambda condition and the closed/open stratification

**Prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion`, `mathlib:WittVector`, `mathlib:PerfectRing`, `mathlib:Perfection`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:AlgebraicGeometry.IsProper`, `mathlib:Module.Projective`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`

**Sources.**

- `BS17-witt-grassmannian` — Bhargav Bhatt, Peter Scholze, *Projectivity of the Witt vector affine Grassmannian*, Theorem 8.3 and the paragraph after it, printed p. 32.

  > The functor Gr_{<=lambda} is representable by a proper perfectly finitely presented F_p-scheme, and there is a natural ample line bundle L in Pic(Gr_{<=lambda}). In particular, Gr_{<=lambda} is the perfection of a projective F_p-scheme. ... Our proof of Theorem 8.3 is independent of Theorem 8.2.

  Exact statement and the independence from Zhu's earlier result.
- `BS17-witt-grassmannian` — Bhargav Bhatt, Peter Scholze, *Projectivity of the Witt vector affine Grassmannian*, Theorem 1.1, printed p. 2.

  > The functor Gr^{Waff,[a,b]} on perfect rings R, parametrizing W(R)-lattices M in W(R)[1/p]^n lying between p^a W(R)^n and p^b W(R)^n, is representable by the perfection of a projective algebraic variety over F_p. Consequently, Gr^{Waff} is representable by an inductive limit of perfections of projective varieties.

  The introduction's form of the result, on perfect RINGS, which is what supplies the ind-limit clause; distinguished here from the section-8 form (Theorem 8.3).
- `BS17-witt-grassmannian` — Bhargav Bhatt, Peter Scholze, *Projectivity of the Witt vector affine Grassmannian*, 1.2 Introduction, printed p. 2.

  > The primary issue is that for a general F_p-algebra R, its ring of Witt vectors W(R) is pathological: it may contain p-torsion, and the natural map W(R)/p -> R may not be an isomorphism. However, if R is perfect ... W(R) may be characterized as the unique (up to unique isomorphism) p-adically complete flat Z_p-algebra lifting R.

  Records why the perfect hypothesis is essential, and connects to the same characterisation used for W_{O_E} in RF0.
- `BS17-witt-grassmannian` — Bhargav Bhatt, Peter Scholze, *Projectivity of the Witt vector affine Grassmannian*, 1.2, printed p. 3.

  > We remark that it is a very interesting question whether there is a natural 'finite-type' structure on the Witt vector affine Grassmannian. For example, all minuscule Schubert cells ... are canonically the perfections of classical Grassmannians; it is natural to wonder if such a story extends deeper into the stratification.

  Confirms the roadmap's warning that a perfect scheme need not itself be finite type.

### `h-descent-and-fibral-criterion` — Bhatt-Scholze Theorems 1.2 and 6.8/1.3: h-descent for vector bundles on perfect schemes and the fibral descent criterion

*theorem.* **Planet: h-descent for vector bundles.**

**Statement.** Any vector bundle E on a perfect F_p-scheme X gives an h-sheaf on perfect schemes over X via pullback, with H^i_h(X,E) = H^i(X,E) for all i, and effective descent for vector bundles holds along h-covers of perfect schemes. Moreover, if f : X -> Y is a proper perfectly finitely presented map in Perf with Rf_* O_X = O_Y (equivalently, in the published form, the perfection of a proper surjective map of F_p-schemes with connected geometric fibres), then E in Vect(X) descends to Y if and only if E is trivial on every geometric fibre X_{y-bar}.

**Hypotheses that must not be dropped.**

- X must be a PERFECT F_p-scheme; the h-topology is subcanonical on perfect schemes but not in general
- Theorem 1.2's first part is attributed to Gabber (cf. [BST13, Section 3]); the second part extends to the full derived category in their Section 11
- Theorem 6.8 is stated with the hypothesis Rf_* O_X = O_Y; Remark 1.4 records that an earlier version used this stronger hypothesis and that the published Theorem 1.3 weakens it to connectedness of the geometric fibres
- The proof of 6.8 uses v-descent for vector bundles and their Proposition 6.1, reduces by Lemma 6.2 to Y affine with connected components spectra of valuation rings, and concludes by Lemma 6.4

**Proof outline.**

1. Establish the h-sheaf property and cohomology comparison for vector bundles on perfect schemes (Theorem 1.2), using the criterion for an fppf sheaf to be an h-sheaf in terms of abstract blowup squares (their Theorem 2.9).
2. For the fibral criterion: one direction is clear; for the converse, reduce by v-descent and Proposition 6.1 to a v-cover, by Lemma 6.2 to Y affine with valuation-ring components, spread a trivialization over a clopen neighbourhood, and reduce to Y = Spec(V) for a valuation ring, where Lemma 6.4 applies.
3. Apply this to descend the Demazure line bundle L-tilde from the Demazure resolution to Gr_{<=lambda}.

**Acceptance.**

- Check the fibral criterion on the Demazure resolution used for the line bundle
- Check that the h-topology statement fails for non-perfect schemes
- Check the difference between the Rf_* O_X = O_Y hypothesis and the connected-geometric-fibres hypothesis

**Prerequisites.** `mathlib:PerfectRing`, `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:CategoryTheory.Sheaf`, `mathlib:ValuationRing`, `mathlib:Module.Projective`

**Sources.**

- `BS17-witt-grassmannian` — Bhargav Bhatt, Peter Scholze, *Projectivity of the Witt vector affine Grassmannian*, Theorem 1.2, printed p. 2.

  > Any vector bundle E on a perfect F_p-scheme X gives a sheaf for the h-topology on perfect schemes over X via pullback, and one has H^i_h(X,E) = H^i(X,E) for all i. Moreover, one has effective descent for vector bundles along h-covers of perfect schemes.

  The descent input the roadmap names as BS17 sections 2-4.
- `BS17-witt-grassmannian` — Bhargav Bhatt, Peter Scholze, *Projectivity of the Witt vector affine Grassmannian*, Theorem 6.8, printed p. 23.

  > Let f : X -> Y be a proper perfectly finitely presented map in Perf such that Rf_* O_X = O_Y; in particular, all geometric fibres of f are connected. Let E in Vect(X). Then E descends to Y if and only if for all geometric points y-bar of Y, E is trivial on the fibre X_{y-bar}.

  The trivial-on-geometric-fibres descent criterion the roadmap requires (BS17 6.8/6.12).
- `BS17-witt-grassmannian` — Bhargav Bhatt, Peter Scholze, *Projectivity of the Witt vector affine Grassmannian*, Remark 1.4, printed p. 3.

  > In a previous version this theorem was stated under the stronger hypothesis Rf_* O_X = O_Y.

  Records the hypothesis change between versions, which matters when citing 1.3 versus 6.8.

### `ampleness-via-keel` — Bhatt-Scholze section 8.4 and Keel 1.7-1.9: ampleness of L by induction using the semiampleness criterion

*theorem.* **Planet: Ampleness by Keel semiampleness.**

**Statement.** Keel's criterion: for a nef line bundle L on a scheme X projective over a field of positive characteristic, L is semi-ample (resp. EWM) if and only if L restricted to the exceptional locus E(L) is semi-ample (resp. EWM), where E(L) is the closure of the union of the irreducible subvarieties Z with L^{dim Z} . Z = 0. Two auxiliary lemmas are used: if L = A + D with A ample and D effective Cartier then E(L) is contained in D (Lemma 1.7), and if X = X_1 union X_2 with L|_{X_i} semi-ample and E(L) contained in X_1 then L is semi-ample (Lemma 1.8). Bhatt-Scholze use these to prove ampleness of L on Gr_{<=lambda} by induction on lambda: L-tilde is nef on the Demazure resolution, E(L-tilde) is contained in the preimage of the union of the Gr_{<=mu} with mu < lambda, the inductive hypothesis plus Lemma 1.8 makes L-tilde|_{E(L-tilde)} semiample, hence L-tilde is semiample by Theorem 1.9, and the Stein factorisation then yields the ample bundle downstairs.

**Hypotheses that must not be dropped.**

- Keel's Theorem 1.9 requires X PROJECTIVE over a field of POSITIVE CHARACTERISTIC; it is false in characteristic zero. Bhatt-Scholze note it 'only applies to projective schemes, so we cannot apply it directly to Gr_{<=lambda}; instead, we will apply it to a suitable h-cover'
- L must be NEF for the criterion to apply; nefness of L-tilde is their Lemma 8.10
- Bigness of L-tilde and the containment of the exceptional locus use the factorisation L-tilde^{tensor N} = A(D) with A ample and D effective missing a chosen point x in Gr_lambda, plus Keel Lemma 1.7
- Bhatt-Scholze say explicitly that, unlike in equal characteristic, they are NOT able to give a direct construction of enough sections of L giving a projective embedding

**Proof outline.**

1. Keel 1.7: if Z is not contained in D then D|_Z is effective Cartier and L^k . Z >= A^k . Z > 0; so E(L) is contained in D, and the finiteness of the union of exceptional subvarieties is by induction on dim X.
2. Keel 1.9: induct on dim X, reduce by 1.8 to L big and by 1.4-1.5 to X reduced, write L = A + D by Kodaira's lemma, apply induction to L|_D and conclude by 1.6.
3. Bhatt-Scholze: by induction assume L|_{Gr_{<=mu}} ample for mu < lambda; L-tilde is nef; E(L-tilde) is contained in psi^{-1}(union_{mu<lambda} Gr_{<=mu}); by Keel Lemma 1.8 the restriction is semiample; by Keel Theorem 1.9 L-tilde is semiample; take the Stein factorisation phi : Gr-tilde_lambda -> X of L-tilde, which is a proper surjective perfectly finitely presented map with geometrically connected fibres (hence a v-cover) with L-tilde^{tensor N} = phi^* M for M ample.

**Acceptance.**

- Check nefness of L-tilde (their Lemma 8.10) independently
- Check the base case lambda minimal, where Gr_{<=lambda} is a classical Grassmannian
- Check that Keel's criterion genuinely needs positive characteristic, e.g. via the standard counterexample

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme`, `mathlib:AlgebraicGeometry.IsProper`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `mathlib:PerfectRing`

**Sources.**

- `Keel99-basepoint` — Sean Keel, *Basepoint freeness for nef and big line bundles in positive characteristic*, 1.9 Theorem, printed p. 262.

  > Let L be a nef line bundle on a scheme X, projective over a field of positive characteristic. L is semi-ample (resp. EWM) if and only if L|_{E(L)} is semi-ample (resp. EWM).

  The exact criterion actually invoked by Bhatt-Scholze (note: their citation is to Theorem 1.9 and Lemmas 1.7, 1.8, not to Theorem 0.2).
- `Keel99-basepoint` — Sean Keel, *Basepoint freeness for nef and big line bundles in positive characteristic*, 0.1 Definition, printed p. 253.

  > An irreducible subvariety Z in X is called exceptional for L if L|_Z is not big, i.e. if L^{dim Z} . Z = 0. If L is nef the exceptional locus of L, denoted by E(L), is the closure, with reduced structure, of the union of all exceptional subvarieties.

  The definition of the exceptional locus that the roadmap names as a sub-obligation.
- `BS17-witt-grassmannian` — Bhargav Bhatt, Peter Scholze, *Projectivity of the Witt vector affine Grassmannian*, Proof of Theorem 8.3, printed p. 35.

  > First, we prove that L-tilde is semiample on Gr-tilde_lambda. Note that L-tilde is nef by Lemma 8.10. Using Keel's [Kee99, Theorem 1.9], it is enough to check that L-tilde|_{E(L-tilde)} is semiample. By Lemma 8.11, the locus E(L-tilde) is contained in psi^{-1}(Gr_{<=lambda} minus Gr_lambda) = psi^{-1}(union_{mu<lambda} Gr_{<=mu}). By induction, we know that L|_{Gr_{<=mu}} is ample for mu ...

  The exact inductive argument, naming the three Keel results used. The excerpt is truncated here; the full quotation is in data/decompositions/GeometricSatakeAndFusion.json, where the independent review checked it against the source.
- `BS17-witt-grassmannian` — Bhargav Bhatt, Peter Scholze, *Projectivity of the Witt vector affine Grassmannian*, 1.2, printed p. 3.

  > Having constructed the line bundle L, we prove that it is ample by using a fundamental result of Keel, [Kee99], on semiample line bundles in positive characteristic. Unfortunately, contrary to the situation in equal characteristic, we are not able to give a direct construction of enough sections of L which would give a projective embedding.

  Confirms that no direct section-theoretic route is available, so Keel's criterion is not optional.

### `semi-infinite-intersections-and-MV-cycles` — FS VI.3.7-VI.3.8: affineness and equidimensionality of Mirkovic-Vilonen cycles in the Witt Grassmannian

*theorem.* **Planet: Mirkovic-Vilonen cycles.**

**Statement.** In the Witt vector affine Grassmannian Gr^{Witt}_G over F-bar_q, an increasing union of perfections of projective varieties by Bhatt-Scholze, let S_lambda = LU . [lambda] be the semi-infinite orbit. Then for any dominant mu, the intersection S_lambda intersect Gr^{Witt}_{G,<=mu} is representable by an AFFINE scheme, and it is equidimensional of dimension <rho, mu + lambda>.

**Hypotheses that must not be dropped.**

- The ambient object is the WITT vector affine Grassmannian over an algebraically closed field of characteristic p, not the B^+_dR Grassmannian
- The proof picks a closed immersion G -> GL_n to reduce to GL_n, and uses the ample line bundle L on Gr^{Witt}_G constructed in Bhatt-Scholze; without that ample bundle the affineness argument does not start
- The equidimensionality argument is a dimension-drop count: at each step the dimension can drop by at most 1, and in <2rho,mu> steps it drops by <2rho,mu>
- Fargues-Scholze annotate Corollary VI.3.8 with 'cf. [MV07, Theorem 3.2], and [GHKR10], [Zhu17, Corollary 2.8] for a different proof based on point counting, the classical Satake isomorphism, and the Kato-Lusztig formula [Kat82], [Lus83]'

**Proof outline.**

1. Reduce to G = GL_n by a closed immersion.
2. Use the ample line bundle L on Gr^{Witt}_G from Bhatt-Scholze; show its pullback to Gr^{Witt}_B is trivial (the universal filtration of Xi over Gr^{Witt}_B has locally constant gradeds, trivializing det(pi^{-m}W_{O_E}(R)/Xi) on each connected component S_lambda), then extend the resulting section over the closed union of the S_{lambda'} with lambda' <= lambda so that it vanishes off S_lambda, which forces the intersection with each Gr^{Witt}_{G,<=mu} to be affine. The valuative check uses the v-descent results of [BS17] and the finite projectivity of the integral filtration steps Xi_i, quoted from [SW20, Lemma 14.2.3]; neither was read.
3. Run the dimension-drop count along the stratification to get equidimensionality of dimension <rho, mu+lambda>.

**Acceptance.**

- Check the dimension formula <rho,mu+lambda> on GL_2
- Check that the ample line bundle input is genuinely used (the roadmap identifies this as the reason GS0:Witt-geometry owns the projectivity input to VI.3.7)
- Compare with the Kato-Lusztig/point-counting proof to cross-check

**Prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `ReductiveGroupsPartII:RG2.3`, `mathlib:WittVector`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `mathlib:RootPairing`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.3.7 and the start of its proof, printed pp. 205-206.

  > For any mu in X_*(T)^+, the intersection S_lambda intersect Gr^{Witt}_{G,<=mu} is representable by an affine scheme. Proof. Picking a closed immersion G -> GL_n, one can reduce to G = GL_n. In that case, there is an ample line bundle L on Gr^{Witt}_G constructed in [BS17].

  Shows that the Bhatt-Scholze ample line bundle is a named input, confirming the roadmap's claim that this stage owns the projectivity input to VI.3.7.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Corollary VI.3.8, printed p. 207.

  > The scheme S_lambda intersect Gr^{Witt}_{G,<=mu} is equidimensional of dimension <rho, mu + lambda>.

  The Mirkovic-Vilonen dimension statement used later for the weight functors.

## GS0:loop-geometry. Integral divisors and bounded modifications

Everything here is over the **integral** divisor space `Div^d_𝒴`, and that
is the point of the whole roadmap. Remark VI.2.1 says it in one sentence:

> Since we work over `𝒴` and do not restrict ourselves to `Y`, we include the case of the Cartier divisor `π = 0`. For
> this divisor, `C^♯ = C` and `B^+_dR(C^♯) = W_{O_E}(C)`.

That characteristic-`p` fibre is the Witt vector affine Grassmannian, and keeping it is what makes the special-fibre
comparison of GS1 a theorem rather than an analogy.

The loop spaces are defined for **affine** `Z` only — affineness is what makes them v-sheaves, and Fargues–Scholze say
they do not pursue the general case. The double-quotient presentations `Hck = L⁺G \ LG / L⁺G` and `Gr = LG/L⁺G` hold
for the **étale** topology, obtained after étale-local trivialisation; they are not v-stack presentations. Over
`Div^d_X` the functors are defined only on a **basis**, the affinoid `S` with `D_S` affinoid.

The congruence filtration then gives the smoothness. For `m ≥ 1` the exponential identifies
`(L⁺G)^{≥m}/(L⁺G)^{≥m+1}` with `Lie G ⊗ I_S^m/I_S^{m+1}`, where `I_S^m/I_S^{m+1}` is a **line bundle** on `D_S` and need
not be trivial — hence the Breuil–Kisin twist. Coincident legs are handled by pulling back along
`(Div¹_𝒴)^d → Div^d_𝒴` and filtering `O_{D_S}` by the partial products of the `d` ideal sheaves.

Finally the Schubert bounds: closed subfunctors indexed by the dominance order, an ind-presentation whose index category
is a **disjoint union over `π₁(G)`** of filtered posets rather than one filtered poset, and properness of
`Gr_{G,Div^d,≤μ∙} → Div^d_𝒴`.

**Coverage: `partial`.** Loop and positive loop spaces over the INTEGRAL divisor space, the local Hecke stack and the Beilinson-Drinfeld Grassmannian with their etale double-quotient presentations, the congruence filtration with its graded pieces and their cohomological smoothness, and the Schubert bounds with closedness, the ind-presentation and properness. The integral space is the point: Remark VI.2.1 says in terms that the Cartier divisor pi = 0 is included and that there B^+_dR(C^sharp) = W_{O_E}(C), which is the characteristic-p fibre the whole degeneration argument needs.

Remaining in this layer:

- SW20 Propositions 19.4.2, 20.3.6 and 20.5.4, which supply the lattice filtration, the closedness/ind-presentation of the bounded loci and the multi-leg properness, were NOT read.
- FS VI.5 (affine flag variety, Demazure varieties: Def. VI.5.1, Prop. VI.5.2, VI.5.3, Def. VI.5.4, Thm. VI.5.5, Def. VI.5.6, Prop. VI.5.7) was read only at the level of statements located in the section listing; the parahoric-model inputs from ReductiveGroupsPartII were not inspected.
- The agreement of the torsor-modification and loop-quotient descriptions via Beauville-Laszlo is used implicitly; the explicit comparison is the RelativeFarguesFontaine RF4 material and was decomposed there, not re-verified here.
- Descent of the bounded loci under the pinned Galois action for nonsplit G, and the closure relations under finite extension of E, were not located as separate statements.

### `loop-groups-and-local-hecke` — FS VI.1.5-VI.1.9: loop groups, the local Hecke stack and the Beilinson-Drinfeld Grassmannian

*construction.* **Planet: Loop groups and the local Hecke stack.**

**Statement.** For Z an AFFINE scheme over O_E, define L^+_{Div^d_Y-curly} Z(S) = Z(B^+_{Div^d_Y-curly}(S)) and L_{Div^d}Z(S) = Z(B_{Div^d}(S)); similarly over E and over X. For G reductive, the local Hecke stack Hck_{G,Div^d} sends an affinoid perfectoid S -> Div^d (with D_S affinoid) to pairs of G-bundles E_1, E_2 on Spec B^+ with an isomorphism over Spec B; the Beilinson-Drinfeld Grassmannian Gr_{G,Div^d} sends S to a G-bundle on Spec B^+ with a trivialization over Spec B. Both are small v-stacks/v-sheaves, and as ETALE stacks/sheaves over Div^d one has Hck = (L^+G) \ (LG) / (L^+G) and Gr = (LG)/(L^+G).

**Hypotheses that must not be dropped.**

- Z must be AFFINE for L^+Z and LZ to be v-sheaves; Fargues-Scholze say affinity is what allows the reduction to the v-sheaf property of the structure sheaf, and explicitly do not pursue the general case
- In the Div^d_X case the functors are defined only on the full subcategory of affinoid perfectoid S -> Div^d_X for which D_S is affinoid; this is a BASIS, not all of them
- G-bundles are taken in the algebraic sense on the spectrum of the ring, and in Tannakian terms as exact tensor functors from Rep_E G to vector bundles
- The quotient presentations are as ETALE stacks/sheaves, obtained after etale-local trivialization; they are not v-stack presentations
- G is REDUCTIVE over O_E (resp. E); the roadmap's warning applies - a ramified group has no reductive integral O_E-model, so the integral statements are for split (or unramified) models after the splitting extension

**Proof outline.**

1. Define loop and positive loop spaces from the completed rings B^+ and B of RF2.
2. For the v-stack property: vector bundles over B^+ satisfy v-descent by checking modulo powers of I_S and applying Proposition VI.1.4; by Tannaka, G-bundles do too; the isomorphism over B is a section of an affine scheme, which again satisfies v-descent. Smallness follows as in Proposition III.1.3.
3. For the presentation: any G-bundle over B^+(S) is etale-locally trivial - at a geometric point B^+ is a product of complete discrete valuation rings with algebraically closed residue field so all torsors are trivial, and in general triviality modulo I_S lifts along nilpotent thickenings (with [GR03, Prop. 5.4.21] for the spreading step).
4. Trivializing E_1 and E_2 etale-locally produces the double-quotient presentation.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `positiveLoopSpace` | data | L^+_{Div^d}Z(S) = Z(B^+(S)) for Z an AFFINE scheme over O_E; affineness is what makes this a v-sheaf, and Fargues-Scholze do not pursue the general case. |
| `loopSpace` | data | L_{Div^d}Z(S) = Z(B(S)), the loop space. |
| `localHecke` | data | Hck_{G,Div^d}: pairs of G-bundles on Spec B^+ with an isomorphism over Spec B. A small v-stack. |
| `grassmannian` | data | Gr_{G,Div^d}: a G-bundle on Spec B^+ with a trivialization over Spec B. |
| `localHecke.presentation` | characterisation | As ETALE stacks over Div^d, Hck = (L^+G) \ (LG) / (L^+G) and Gr = (LG)/(L^+G). The presentation is etale, not v-local, and comes from etale-local triviality of G-bundles over B^+. |
| `localHecke.basis` | structure | In the Div^d_X case the functor is defined only on the affinoid perfectoid S -> Div^d_X with D_S affinoid; that is a basis, not all of them. |
| `bundle.tannakian` | structure | G-bundles are taken algebraically on the spectrum of the ring, and in Tannakian terms as exact tensor functors from Rep_E G to vector bundles. |

Derived from where the object is used:

- in `GeometricSatakeAndFusion:GS0:loop-geometry/congruence-filtration-and-graded-pieces` — the filtration is of the positive loop group defined here
- in `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness` — the bounded loci are subfunctors of these
- in `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram` — convolution is composition in a 2-category whose objects are quotients by the positive loop group

**Unit tests.** A plausible wrong definition fails one of these.

- `affineness_is_needed` — Z must be affine for L^+Z and LZ to be v-sheaves; the proof reduces to the v-sheaf property of the structure sheaf, and the source declines the general case.
- `etale_not_v_presentation` — The double-quotient presentation holds for the ETALE topology; a v-stack presentation is a different and stronger statement.
- `basis_only_over_X` — Over Div^d_X the functor is defined on a basis of the site, and Proposition VI.1.2 is what says every S admits an open cover by such; treating it as defined on all S is wrong.
- `tannakian_agreement` — Against a faithful representation of G the Tannakian description agrees with the naive one; a definition that does not is not the source's.

**Acceptance.**

- Check that the presentation is as etale stacks, by exhibiting a v-locally but not etale-locally trivial situation if one exists
- Check that the definition on Div^d_X really only uses a basis of affinoid-divisor loci
- Check the Tannakian formulation against a faithful representation of G

**Prerequisites.** `RelativeFarguesFontaine:RF0:integral-Y`, `RelativeFarguesFontaine:RF2:integral-divisors`, `RelativeFarguesFontaine:RF2:untilts`, `RelativeFarguesFontaine:RF4:G-torsors`, `ReductiveGroupsPartII:RG2.3`, `BunGAndNewtonStrata:BG0`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`, `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:AlgebraicGeometry.Scheme`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition VI.1.5 and the remark after it, printed p. 192.

  > Let Z be an affine scheme over O_E. The positive loop space L^+_{Div^d_Y-curly} Z (resp. loop space L_{Div^d_Y-curly} Z) of Z is the v-sheaf over Div^d_Y-curly given by S -> Z(B^+_{Div^d_Y-curly}(S)) (resp. S -> Z(B_{Div^d_Y-curly}(S))). ... We note that we use affinity of Z to see that these are actually v-sheaves.

  The construction with its affineness hypothesis made explicit.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.1.7, printed p. 193.

  > The local Hecke stack Hck_{G,Div^d} is a small v-stack. There is a natural isomorphism of etale stacks over Div^d_Y-curly: Hck_{G,Div^d} = (L^+ G) \ (L G) / (L^+ G).

  The torsor interpretation, stated for the ETALE topology as the stage text requires.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition VI.1.6, printed p. 193.

  > Also note that in the case of Div^d_X, the local Hecke functor is only defined on a certain full subcategory of affinoid perfectoid S -> Div^d_X, namely those where D_S is affinoid; but any S -> Div^d_X admits an open cover by such by Proposition VI.1.2, so we have still defined the functor on a basis.

  The scope caveat for the X-case.

### `congruence-filtration-and-graded-pieces` — FS VI.1.10-VI.1.12: principal congruence subgroups, their graded pieces, and cohomological smoothness

*theorem.* **Planet: The congruence filtration of L+G.**

**Statement.** L^+_{Div^d} G carries the filtration by principal congruence subgroups (L^+ G)^{>=m} = ker(G(B^+) -> G(B^+/I_S^m)). For d = 1, L^+G/(L^+G)^{>=1} = G^diamond and (L^+G)^{>=m}/(L^+G)^{>=m+1} = (Lie G)^diamond{m}, a Breuil-Kisin twist by I_S^m/I_S^{m+1}. For general d, (L^+G)^{>=m}/(L^+G)^{>=m+1} sends S -> Div^d_Y-curly to (Lie G tensor_{O_E} I_S^m/I_S^{m+1})(S), where I_S^m/I_S^{m+1} is a LINE BUNDLE on D_S; this is representable in locally spatial diamonds, partially proper, and cohomologically smooth of l-dimension d times dim G. Moreover L^+G/(L^+G)^{>=1} -> Div^d_Y-curly parametrizes maps D_S -> G, and for any quasiprojective SMOOTH Z over O_E the sheaf T_Z of maps D_S -> Z is representable in locally spatial diamonds, partially proper and cohomologically smooth of l-dimension d dim Z.

**Hypotheses that must not be dropped.**

- The identification of the graded pieces uses the EXPONENTIAL, hence needs the congruence level m >= 1
- I_S^m/I_S^{m+1} is a line bundle on D_S and need not be trivial; the twist {m} is the Breuil-Kisin twist by it
- For the filtration argument one pulls back along the QUASI-PRO-ETALE SURJECTIVE map (Div^1_Y-curly)^d -> Div^d_Y-curly, where d ideal sheaves I_1,...,I_d are available and O_{D_S} is filtered by O/I_1, I_1/I_1 I_2, ..., I_1...I_{d-1}/I_1...I_d, each isomorphic to O_{S_i^sharp} after pullback to an affinoid perfectoid S
- Z must be QUASIPROJECTIVE and SMOOTH over O_E for the T_Z statement; the proof starts from affine space and propagates along separated etale maps, using Lemma VI.1.13 to see that T_{Z'} -> T_Z is separated etale

**Proof outline.**

1. Define the congruence filtration by the kernels of reduction modulo I_S^m.
2. For d = 1: the m = 0 quotient is G^diamond by definition; the higher graded pieces come from the exponential.
3. For general d and m >= 1: the exponential identifies the graded piece with Lie G tensor I_S^m/I_S^{m+1}; representability, partial properness and cohomological smoothness are checked after pullback along (Div^1_Y-curly)^d -> Div^d_Y-curly using the filtration of O_{D_S} by the partial products of the ideals, each subquotient being O_{S_i^sharp}.
4. For T_Z: the affine-space case is the previous step; separated etale Z' -> Z gives separated etale T_{Z'} -> T_Z by Lemma VI.1.13; every geometric point of T_Z has finite image so T_Z is covered by T_{Z'} for affine Z', and affine Z admitting etale maps to A^d_{O_E} reduce to the affine-space case.

**Acceptance.**

- Check the d = 2 case at coincident legs, where the filtration of O_{D_S} still has O_{S_i^sharp} subquotients
- Check that the Breuil-Kisin twist is nontrivial on a base where I_S^m/I_S^{m+1} is not free
- Check cohomological smoothness of L^+G/(L^+G)^{>=1} -> Div^d via T_G

**Prerequisites.** `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `ReductiveGroupsPartII:RG2.5`, `DiamondSixOperations:S4`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `mathlib:Module.Projective`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.1.11, printed p. 195.

  > sends a perfectoid space S -> Div^d_Y-curly with corresponding Cartier divisor D_S in Y-curly_S with ideal sheaf I_S to (Lie G tensor_{O_E} I_S^m/I_S^{m+1})(S) where I_S^m/I_S^{m+1} is a line bundle on D_S. This is representable in locally spatial diamonds, partially proper, and cohomologically smooth of l-dimension equal to d times the dimension of G.

  Exact statement of the graded pieces with the line-bundle caveat.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition VI.1.11, printed p. 195.

  > For this in turn, note that over (Div^1_Y-curly)^d, we have d ideal sheaves I_1, ..., I_d, and one can filter O_{D_S} by O_{D_S}/I_1, I_1/I_1 I_2, ..., I_1 ... I_{d-1}/I_1 ... I_d, each of which is, after pullback to an affinoid perfectoid space S, isomorphic to O_{S_i^sharp}.

  The explicit filtration that handles coincident legs.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.1.12, printed p. 195.

  > For any quasiprojective smooth scheme Z over O_E, the sheaf T_Z -> Div^d_Y-curly taking a perfectoid S over Div^d_Y-curly to maps D_S -> Z (of locally ringed spaces) is representable in locally spatial diamonds, partially proper, and cohomologically smooth over Div^d_Y-curly of l-dimension equal to d times the dimension of Z.

  The statement with its quasiprojectivity and smoothness hypotheses.

### `schubert-bounds-and-properness` — FS VI.2.2-VI.2.7: bounded relative position, closedness, ind-presentation and properness of Schubert diamonds

*theorem.* **Planet: Schubert bounds and properness.**

**Statement.** Assume G split over O_E with T in B in G. By the Cartan decomposition over a geometric point, Hck_{G,Div^1_Y-curly}(S)/iso = X_*(T)^+. For mu dominant, Hck_{G,Div^1,<=mu} is the subfunctor of points whose relative position at every geometric point is some mu' <= mu in the dominance order; it is a CLOSED subfunctor, Hck_{G,Div^1} = colim_mu Hck_{G,Div^1,<=mu}, and Gr_{G,Div^1,<=mu} -> Div^1_Y-curly is proper and representable in spatial diamonds. For several legs and mu_bullet, Hck_{G,Div^d,<=mu_bullet} is closed and Gr_{G,Div^d,<=mu_bullet} -> Div^d_Y-curly is proper, representable in spatial diamonds and of finite dim.trg.

**Hypotheses that must not be dropped.**

- G is assumed SPLIT over O_E in this section; a general G is handled by a finite etale extension of O_E resp. E, and the results are then 'useful in the general case' by descent, not by a reductive integral model for a ramified group
- The whole of Y-curly is used, so the Cartier divisor pi = 0 is INCLUDED; at that divisor C^sharp = C and B^+_dR(C^sharp) = W_{O_E}(C) - this is the special fibre the roadmap insists on retaining
- The index category of the mu is a disjoint union over pi_1(G) of filtered partially ordered sets, not a single filtered poset
- Surjectivity of the colimit uses that for quasicompact S only finitely many strata are met, since the meromorphic isomorphism of G-bundles has bounded poles, together with separatedness of Gr -> Div^1 and properness of Gr_{<=mu} -> Div^1
- The properness and representability statements themselves are quoted from SW20 Propositions 20.3.6 and 20.5.4, which were NOT read

**Proof outline.**

1. Over a geometric point S = Spa(C,C^+) of Div^1_Y-curly = Spd O_E with untilt C^sharp, the ring B^+_dR(C^sharp) is a complete discrete valuation ring with residue field C^sharp and uniformizer xi, so the Cartan decomposition gives Hck(S)/iso = X_*(T)^+.
2. Define the bounded subfunctors by the pointwise dominance condition; closedness and the ind-presentation are SW20 20.3.6, checked after passing to Gr, which is a v-cover of Hck.
3. The colimit statement is proved by the boundedness-of-poles argument plus the v-cover assembled from the proper Gr_{<=mu}.
4. For several legs, pull back to (Div^1_Y-curly)^d and quote SW20 20.5.4.

**Acceptance.**

- Check the pi = 0 divisor case, where B^+_dR(C^sharp) = W_{O_E}(C), against the roadmap's requirement to keep the characteristic-p fibre
- Check the dominance-order closure relations on GL_2 with a nonminuscule mu
- Check that the index poset is a disjoint union over pi_1(G) of filtered posets

**Prerequisites.** `RelativeFarguesFontaine:RF2:integral-divisors`, `ReductiveGroupsPartII:RG2.3`, `mathlib:CoxeterSystem`, `tauceti:TauCeti.TitsSystem.bruhatCell`, `mathlib:WittVector`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Remark VI.2.1, printed p. 197.

  > Since we work over Y-curly and do not restrict ourselves to Y, we include the case of the Cartier divisor pi = 0. For this divisor, C^sharp = C and B^+_dR(C^sharp) = W_{O_E}(C).

  Confirms that the integral divisor space retains the ramified Witt special fibre, which the roadmap identifies as the supplier of the Satake degeneration.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.2.3 and proof, printed p. 197.

  > For surjectivity, note that for any quasicompact S with a map S -> Gr_{G,Div^1_Y-curly}, only finitely many strata can be met, as the meromorphic isomorphism of G-bundles necessarily has bounded poles.

  The finiteness argument behind the ind-presentation.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.2.7 and proof, printed p. 201.

  > The map Gr_{G,Div^d,<=mu_bullet} -> Div^d_Y-curly is proper, representable in spatial diamonds, and of finite dim. trg. Proof. This can be checked after pullback to (Div^1_Y-curly)^d. Then it follows from [SW20, Proposition 20.5.4].

  The multi-leg properness with its imported source, which is an unread boundary.

## GS1. Semi-infinite geometry and constructibility

The semi-infinite orbits stratify `Gr`, the `G_m`-action via `λ` extends to an
`A¹`-action whose fixed points are the Levi Grassmannian, and on `G_m`-**monodromic** bounded complexes the two
hyperbolic-localization correspondences agree, defining `CT_B`. Conservativity — `CT_B(A) = 0` forces `A = 0` — needs
`B` a Borel and the support quasicompact over `S`.

The relative perverse t-structure is normalised by the shift `- Σ_{i=1}^r ⟨2ρ, μ_i⟩`, where `r` is the number of
**distinct** untilts. Coincident legs are counted once. Existence and uniqueness come from Lurie's criterion applied on
each bounded closed subset and glued along t-exact inclusions; `CT_B[deg]` is t-exact and conservative, which is what
makes `^pD^{≥0}` describable at all. The pinned Mathlib already has `CategoryTheory.Triangulated.TStructure` with its
heart, so only the normalisation is planned here.

ULA sheaves on `Hck` are defined as bounded objects whose pullback to `Gr` is ULA; the condition is invariant under the
switching involution, and for one leg and split `G` there is a **stalkwise criterion**: `A` is ULA iff its restriction
along every section `[μ]` is locally constant with perfect fibres.

And then the comparison the roadmap exists for: over a complete algebraically closed `C` with residue field `k`, the
restriction functors
`D^{ULA}(Hck_{G,Spd C}) ← D^{ULA}(Hck_{G,Spd O_C}) → D^{ULA}(Hck_{G,Spd k})` are **equivalences**. The middle term is
over the integral divisor space; replacing `𝒴` by `Y` deletes the right-hand term. Fargues–Scholze's proof is two lines,
and the packet says so rather than inventing a specialization argument.

**Coverage: `partial`.** The semi-infinite stratification with the A^1-extension of the G_m-action, the hyperbolic-localization constant term and its conservativity, the relative perverse t-structure with its hyperbolic characterisation, the ULA sheaves on the Hecke stack with the one-leg stalkwise criterion, and the equivalence of the ULA categories over Spd O_C, Spd C and Spd k. That last equivalence is the special-fibre comparison the roadmap is built around, and it is exactly what the integral divisor space of GS0:loop-geometry makes possible.

Remaining in this layer:

- FS IV.6 (hyperbolic localization, Braden's theorem, Prop. IV.6.11's definition of G_m-monodromic, Prop. IV.6.13) was NOT read; it is imported at several points of VI.3-VI.7.
- FS IV.7 (Drinfeld's lemma, Prop. IV.7.3) was NOT read; it is what identifies LocSys((Div^1_X)^I) with Rep_{W_E^I}.
- The scheme-side perverse/recollement foundation (EtaleDualityAndPerverseSheaves EDC.4-EDC.5) was not inspected; it is another roadmap's stage.
- Lurie's Higher Algebra Proposition 1.4.4.11, used for the existence of the t-structure, was not read.
- FS VI.5 (affine flag variety and Demazure resolutions), used in the proof of VI.6.5, was read only at statement level.
- Propositions VI.6.1-VI.6.3 and VI.7.2-VI.7.3 (the ULA/ind-properness and Rf_!Rf^! lemmas that VI.6.4 and VI.7.1 rest on) were located but not decomposed; Proposition IV.2.28, used for the final clause of VI.6.4, was not read.

### `semi-infinite-orbits-and-hyperbolic-localization` — FS VI.3.1, VI.3.5 and VI.4.2: semi-infinite strata, the hyperbolic-localization constant term, and conservativity

*theorem.* **Planet: Hyperbolic localization and CT_B.**

**Statement.** For a cocharacter lambda with parabolic P_lambda and Levi M_lambda, the map Gr_{P_lambda,Div^d} = disjoint union over nu of Gr^nu_{P_lambda,Div^d} -> Gr_{G,Div^d} is bijective on geometric points and a locally closed immersion on each piece; the union over nu' <= nu has closed image; the G_m-action via lambda extends to an A^1-action whose fixed points are Gr_{M_lambda,Div^d}. On G_m-monodromic bounded complexes the natural map from the !-pullback-star-pushforward correspondence to the star-pullback-!-pushforward one is an isomorphism, defining CT_B. If B is a Borel and A is a bounded complex on Hck_{G,S/Div^d} with support quasicompact over S and CT_B(A) = 0, then A = 0.

**Hypotheses that must not be dropped.**

- The comparison map is only asserted on the G_m-MONODROMIC bounded subcategory in the sense of Definition IV.6.11
- Conservativity (VI.4.2) needs B to be a BOREL and the support of A to be quasicompact over S
- The proof of VI.4.2 reduces to S = Spa(C,C^+) strictly local, then removes double points to assume d distinct untilts, then lifts to a splitting unramified extension E'|E - this last step uses that one works over Y-curly where the splitting extension can be taken unramified
- Formation of CT_B commutes with any base change in S by Corollary VI.3.5

**Proof outline.**

1. Establish the stratification by semi-infinite orbits and the A^1-extension of the G_m-action with fixed points the Levi Grassmannian (VI.3.1).
2. Prove the hyperbolic-localization comparison on G_m-monodromic complexes (VI.3.5), which also gives base-change compatibility.
3. For conservativity: reduce to a strictly local S with d distinct untilts and split G; stratify Hck by tuples (mu_1,...,mu_d) of dominant cocharacters with strata the classifying stacks of the stabilizers; take a maximal stratum on which A is nonzero and apply hyperbolic localization there.

**Acceptance.**

- Check conservativity on a single nonminuscule Schubert stratum
- Check base-change compatibility of CT_B
- Check that G_m-monodromicity is needed for the comparison map

**Prerequisites.** `VStackSheavesAndLisseCategories:VS0`, `VStackSheavesAndLisseCategories:VS1`, `mathlib:RootPairing`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.3.1, printed p. 202.

  > The map Gr_{P_lambda,Div^d} = disjoint union over nu of Gr^nu_{P_lambda,Div^d} -> Gr_{G,Div^d} is bijective on geometric points, and it is a locally closed immersion on each Gr^nu. The union over nu' <= nu of Gr^{nu'} has closed image in Gr_{G,Div^d}. The action of G_m via lambda on Gr_{P_lambda,Div^d} extends to an action of the monoid A^1, and the G_m-fixed points agree with Gr_{M_lambda,Div^d}.

  The semi-infinite stratification and the attractor/fixed-point structure.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.4.2 and proof, printed p. 208.

  > Assume that B in G is a Borel. Let S -> Div^d_Y-curly be any small v-sheaf. Let A in D_et(Hck_{G,S/Div^d}, Lambda) with support quasicompact over S. Assume that the hyperbolic localization CT_B(A) = 0 of the pullback of A to Gr_{G,S/Div^d} vanishes. Then A = 0.

  The conservativity statement with its exact hypotheses.

### `relative-perverse-t-structure` — FS VI.7.1-VI.7.4: the relative perverse t-structure on the local Hecke stack and its hyperbolic characterisation

*construction.* **Planet: The relative perverse t-structure.**

**Statement.** For S -> Div^d_Y-curly a small v-stack there is a unique t-structure on D_et(Hck_{G,S/Div^d},Lambda)^{bd} with A in ^p D^{<=0} if and only if for every geometric point Spa(C,C^+) -> S and every open Schubert cell parametrized by mu_1,...,mu_r (r the number of distinct untilts) the pullback of A sits in cohomological degrees <= - sum_i <2rho,mu_i>. On the heart Perv, pullback to Gr is fully faithful, and if A in ^p D^{<=0}, B in ^p D^{>=0} then RHom(A,B) is in D^{>=0}. Pullback along S' -> S is t-exact, and for split G the shifted constant term CT_B[deg] is t-exact and conservative from the perverse t-structure to the standard one on Gr_T.

**Hypotheses that must not be dropped.**

- The t-structure is defined on BOUNDED complexes, and its existence uses a presentable stable infinity-categorical refinement on each bounded closed Z inside Hck, with Lurie's Proposition 1.4.4.11 for existence and uniqueness; t-exactness of the inclusions as Z grows lets these glue
- The shift is by sum over the r DISTINCT untilts of <2rho,mu_i>, so coincident legs are handled by the number of distinct points, not by d
- Full faithfulness of Perv -> D_et(Gr)^{bd} rests on Lemma VI.7.3 about connected group actions, applied to a finite-dimensional approximation of Gr x_{Div^d} L^+G -> Gr
- deg : Gr_T -> Z is the locally constant map obtained by pairing the sum of relative positions with 2rho

**Proof outline.**

1. Existence and uniqueness of the t-structure by Lurie's criterion on each bounded closed subset, glued along t-exact inclusions.
2. Full faithfulness on the heart: first show RHom(A,B) is in D^{>=0} for A in ^pD^{<=0}, B in ^pD^{>=0}, using that C tensor A is in ^pD^{<=-1} for C in D^{<=-1}; then by descent reduce to showing that any map between pullbacks to Gr is automatically L^+G-equivariant, which is Lemma VI.7.3.
3. t-exactness of pullback in S and of CT_B[deg] is VI.7.4; conservativity of CT_B[deg] is VI.4.2.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `relativePerverse` | data | The unique t-structure on D_et(Hck_{G,S/Div^d},Lambda)^{bd} with A in ^pD^{<=0} iff at every geometric point and every open Schubert cell the pullback sits in degrees <= - sum_i <2rho, mu_i>. |
| `relativePerverse.shift` | structure | The shift runs over the r DISTINCT untilts, not over d; coincident legs are handled by the number of distinct points. |
| `relativePerverse.bounded` | structure | The t-structure is on BOUNDED complexes; existence and uniqueness come from Lurie's criterion applied on each bounded closed subset and glued along t-exact inclusions. |
| `Perv` | data | The heart. Pullback Perv -> D_et(Gr)^{bd} is fully faithful, by Lemma VI.7.3 on connected group actions. |
| `relativePerverse.hom_positive` | characterisation | For A in ^pD^{<=0} and B in ^pD^{>=0}, RHom(A,B) lies in D^{>=0}. |
| `relativePerverse.baseChange` | compatibility | Pullback along S' -> S is t-exact. |
| `constantTerm.exact` | characterisation | For split G the shifted constant term CT_B[deg] is t-exact from this t-structure to the standard one on Gr_T, and conservative; deg pairs the sum of relative positions with 2rho. |

Derived from where the object is used:

- in `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor` — the Satake category is cut out of the heart by flatness and universal local acyclicity
- in `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram` — convolution is shown to preserve ^pD^{<=0}, which is a statement about this t-structure
- in `GeometricSatakeAndFusion:GS3:fusion/disjoint-leg-factorization-and-full-faithfulness` — the fusion construction of the second part of this roadmap is stated for this t-structure

**Unit tests.** A plausible wrong definition fails one of these.

- `shift_on_a_minuscule_cell` — On a single minuscule cell of GL_2 the shift is <2rho,mu> = 1; any other normalisation moves the whole Satake category.
- `distinct_untilts_not_d` — At coincident legs the shift uses the number of distinct untilts r, not the number of legs d.
- `CT_needs_the_shift` — CT_B[deg] is t-exact but CT_B alone is not; dropping the shift breaks the characterisation of ^pD^{>=0}.
- `mathlib_tstructure` — The pinned Mathlib has CategoryTheory.Triangulated.TStructure with its heart, so the abstract notion is cited and only the relative perverse normalisation is planned here.

**Acceptance.**

- Check the shift convention on a single minuscule cell of GL_2
- Check that CT_B[deg] is t-exact but CT_B alone is not
- Check t-exactness of pullback along a geometric point

**Prerequisites.** `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `EtaleDualityAndPerverseSheaves:EDC.4`, `EtaleDualityAndPerverseSheaves:EDC.5`, `EnhancedDerivedSheaves:E5:abstract`, `VStackSheavesAndLisseCategories:VS1`, `mathlib:CategoryTheory.Triangulated.TStructure`, `mathlib:CategoryTheory.Triangulated.TStructure.Heart`, `mathlib:CategoryTheory.Pretriangulated`, `mathlib:DerivedCategory`, `mathlib:RootPairing`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition/Proposition VI.7.1, printed p. 215.

  > the pullback of A to this open Schubert cell sits in cohomological degrees <= - sum_{i=1}^r <2rho, mu_i>.

  The exact normalization of the relative perverse t-structure, with r the number of DISTINCT untilts.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.7.4, printed p. 217.

  > Then CT_B[deg] is t-exact for the perverse t-structure on the source, and the standard t-structure on the right. As CT_B[deg] is conservative, this implies in particular that ...

  The hyperbolic characterisation of the t-structure, which is how ^p D^{>=0} becomes describable.

### `ULA-sheaves-on-the-hecke-stack` — FS VI.6.1-VI.6.6: ULA sheaves on Hck, switching invariance, and the one-leg stalkwise criterion

*theorem.* **Planet: ULA sheaves on the Hecke stack.**

**Statement.** A in D_et(Hck_{G,S/Div^d},Lambda) is ULA over S if it is bounded and its pullback to Gr_{G,S/Div^d} is ULA over S. This condition is invariant under the switching involution sw. For a Borel B with torus quotient T, a bounded A is ULA over S if and only if CT_B(A) is ULA over S, equivalently if and only if R pi_{T,S,*} CT_B(A) is locally constant with perfect fibres. For split G and d = 1, a bounded A is ULA over S if and only if for every dominant mu the restriction of A along the section [mu] : S -> Hck_{G,S/Div^1} is locally constant with perfect fibres. The ULA subcategory is stable under Verdier duality, tensor, internal Hom and the four functors j_! j^*, Rj_* j^*, j_! Rj^!, Rj_* Rj^! for a Schubert-cell immersion j, all commuting with pullback in S.

**Hypotheses that must not be dropped.**

- Boundedness is part of the definition of ULA on Hck
- sw-invariance (VI.6.2) is proved by comparing the two pro-systems (L G)_U/(L^+G)^{>=m} and (L^+G)^{>=m} \ (L G)_U, which are pro-isomorphic with cohomologically smooth transition maps (Lemma VI.6.3)
- The proof of VI.6.4 passes to a bounded part of Hck and replaces the quotient by L^+G by a FINITE-DIMENSIONAL quotient in order to be in the Artin-stack setting - this is exactly the truncation supplied by VI.2.8
- VI.6.5 is stated for SPLIT G; for general G one applies it etale-locally on S
- The stability statements of VI.6.6 are for d = 1 (S -> Div^1_Y-curly)

**Proof outline.**

1. Definition VI.6.1 and Proposition VI.6.2 (sw-invariance via the pro-isomorphic congruence towers and Lemma VI.6.3's two-out-of-six argument).
2. VI.6.4 forward direction: Corollary VI.3.5, ind-properness of pi_T,S and Corollary IV.2.12. Converse: assume S strictly totally disconnected and G split; use the dualizability criterion Theorem IV.2.23; apply Proposition VI.4.2 to G x G to reduce to CT_{B^- x B}; use that hyperbolic localization commutes with exterior tensor products and Proposition IV.6.13.
3. VI.6.5 forward: reduce to j_{mu!}Lambda, argue v-locally over Div^1, base change to S = Spd O_C, use Proposition VI.5.2 and Proposition IV.2.13 to pass to the affine flag variety, and conclude by Proposition VI.5.7 (Demazure). Converse: induct on the support, using that on a maximal Schubert cell the stratum is the classifying space of a pro-cohomologically-smooth group.
4. VI.6.6 follows from Corollary IV.2.25 for duality and base change, and from the stalkwise criterion plus the six functors for the rest.

**Acceptance.**

- Check the stalkwise criterion on j_{mu!}Lambda[d_mu]
- Check sw-invariance on a non-symmetric example
- Check that the finite-dimensional truncation used in the proof of VI.6.4 is the one from VI.2.8

**Prerequisites.** `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncation-of-the-loop-action`, `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `VStackSheavesAndLisseCategories:VS1`, `mathlib:Module.Projective`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.6.5, printed p. 214.

  > Then A is universally locally acyclic over S if and only if for all mu in X_*(T)^+, the restriction of A to the section [mu] : S -> Hck_{G,S/Div^1} is locally constant with perfect fibres in D_et(S,Lambda).

  The stalkwise one-leg criterion, which is the practical characterisation used throughout.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition VI.6.4, printed p. 213.

  > (Implicitly, we pass here to a bounded part of Hck_{G,Div^d} and replace the quotient by L^+_{Div^d}G by a finite-dimensional quotient in order to be in the setting of Artin stacks.)

  Records that the Artin-stack machinery is applied only after the truncation of VI.2.8.

### `integral-family-comparison` — FS VI.6.7: equivalence of ULA categories over Spd O_C, Spd C and Spd k

*comparison.*

**Statement.** For C a complete algebraically closed extension of E with residue field k, taking S = Spd O_C, Spd C and Spd k, the restriction functors D^{ULA}_et(Hck_{G,Spd C/Div^1},Lambda) <- D^{ULA}_et(Hck_{G,Spd O_C/Div^1},Lambda) -> D^{ULA}_et(Hck_{G,Spd k/Div^1},Lambda) are EQUIVALENCES.

**Hypotheses that must not be dropped.**

- The middle term is over Spd O_C, i.e. over the INTEGRAL divisor space Div^1_Y-curly = Spd O_E, which retains the characteristic-p point; replacing Y-curly by Y would delete the right-hand term
- The statement is about the ULA subcategories, not about all of D_et
- G is not assumed split here (Fargues-Scholze say 'In the following corollaries, we no longer assume that G is split')
- The printed proof (p. 215) is two lines and gives no further detail: base change of RHom in S, plus the equivalence between locally constant sheaves with perfect fibres on such an S and perfect Lambda-modules. No specialization argument along Spd O_C is spelled out.

**Proof outline.**

1. Fargues-Scholze's proof is two lines and is printed on p. 215: 'Use that the formation of RHom commutes with any base change in S, and that the category of locally constant sheaves with perfect fibres on any such S is equivalent to the category of perfect Lambda-modules.'
2. The first ingredient is base change for RHom in S, which Corollary VI.6.6 records for the ULA subcategory; the second identifies LocSys with perfect Lambda-modules over each of Spd O_C, Spd C and Spd k.
3. The stalkwise criterion VI.6.5 is what makes ULA objects detectable by their restrictions along the sections [mu], but Fargues-Scholze do not route the proof of VI.6.7 through it.

**Acceptance.**

- Check the equivalence on j_{mu!}Lambda[d_mu] over the three bases
- Check that the special fibre is the Witt Grassmannian side and the generic fibre the B^+_dR side
- Check that a formal analogy between the two Grassmannians does not give this equivalence, as the roadmap warns

**Prerequisites.** `GeometricSatakeAndFusion:GS1/ULA-sheaves-on-the-hecke-stack`, `VStackSheavesAndLisseCategories:VS3`, `mathlib:Module.Projective`, `mathlib:CategoryTheory.Equivalence`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Corollary VI.6.7, printed p. 214.

  > For a complete algebraically closed extension C of E with residue field k, taking S = Spd O_C, S = Spd C and S = Spd k, the functors D^{ULA}_et(Hck_{G,Spd C/Div^1}, Lambda) <- D^{ULA}_et(Hck_{G,Spd O_C/Div^1}, Lambda) -> D^{ULA}_et(Hck_{G,Spd k/Div^1}, Lambda) are equivalences.

  The special/generic fibre comparison the stage text calls for, stated exactly.

## GS2. Satake objects and convolution

An aggregate layer with no node of its own.

**Coverage: `partial`.** Aggregate layer over GS2:correspondences and GS2:Satake-closure; no node of its own.

Remaining in this layer:

- Aggregate stage; inherits the remaining items of GS2:correspondences and GS2:Satake-closure.

## GS2:Satake-closure. Closure after fusion

Convolution preserves `Sat`, and every object of `Sat` is left and
right dualizable with right dual `sw^* D(A)`. That single sentence is the hypothesis from which every formal property of
the Hecke operators in `HeckeStacksAndLocalShtukas` follows: monoidality plus dualizability gives `T_V` a left and a
right adjoint, and preservation of limits, colimits, compact objects and ULA objects is then automatic.

**And the atlas records the dependency backwards.** `data/atlas.json` has the edge
`GS3:fusion → GS2:Satake-closure`. But VI.8.1(iii) is proved from (i), (ii) and the commutation of convolution with
Verdier duality, and VI.8.2 from Propositions IV.2.24, VI.6.2 and VI.7.12. Fusion is used in neither. Both live in
section VI.8, *before* VI.9 on fusion, and it is VI.9 that consumes them — the proof of Corollary VI.9.5 opens *"By
Proposition VI.8.2, all `A ∈ Sat^I_G(Λ)` are dualizable, with dual `sw^* D(A)`."* The reviewed decomposition's own link
graph runs the other way too. This is the packet's first structural proposal.

**Coverage: `partial`.** Convolution preserves the Satake category, and every object of it is left and right dualizable with right dual sw^* D(A). This is the single hypothesis from which every formal property of the Hecke operators in HeckeStacksAndLocalShtukas follows, and the source proves it in section VI.8, BEFORE the fusion of VI.9, which is the opposite of the order the atlas records.

Remaining in this layer:

- Proposition IV.2.24, used for dualizability, was not read.
- The semi-infinite/hyperbolic-localization estimates the stage text names are those of VI.3 and IV.6; IV.6 was not read.
- The exact place where coefficient flatness excludes the Tor obstruction to t-exactness was not isolated in the source; FS record flatness as part of Definition VI.7.8 but do not display the obstruction.

### `convolution-preserves-satake-and-dualizability` — FS VI.8.1(iii) and VI.8.2: convolution preserves the Satake category, and all its objects are dualizable

*theorem.* **Planet: Convolution preserves Satake.**

**Statement.** If A_1, A_2 lie in Sat(Hck_{G,S/Div^d},Lambda) then so does A_1 star A_2. Moreover every object of the monoidal category Sat(Hck_{G,S/Div^d},Lambda) is left and right dualizable, with right dual sw^* D(A), where sw is the switching isomorphism induced by inversion on L_{Div^d}G.

**Hypotheses that must not be dropped.**

- Part (iii) is deduced from (i), (ii) and the observation that CONVOLUTION COMMUTES WITH VERDIER DUALITY; flatness is preserved because both the object and its dual are perverse
- The dualizability statement is proved for all of D^{ULA}(Hck), using Proposition IV.2.24, 'modulo the technical nuisance that everything is only ind-representable here; everything adapts to that setting'
- sw-invariance of the ULA condition is Proposition VI.6.2, and stability of Sat under Verdier duality is Proposition VI.7.12
- Fargues-Scholze remark that in the classical setting dualizability is asserted without proof at the end of [MV07, Section 11]

**Proof outline.**

1. (iii) from (i) and (ii) plus compatibility of convolution with Verdier duality: if A_1, A_2 are ULA and flat perverse, then A_1 star A_2 is ULA and lies in ^pD^{<=0}; applying the same to the duals gives ^pD^{>=0}, hence perversity, and flatness follows.
2. Dualizability: all ULA objects are left dualizable with right dual sw^* D(A) by Proposition IV.2.24 adapted to the ind-representable setting; sw^* D preserves Sat by VI.6.2 and VI.7.12.

**Acceptance.**

- Check that the right dual of ^p j_{mu!}Lambda[d_mu] is the expected object for the dual cocharacter
- Check the Tor obstruction: exhibit a nonflat perverse object whose convolution is not perverse, or record that none is given in the source
- Check that this closure is used only AFTER the fusion construction, as the roadmap requires

**Prerequisites.** `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `VStackSheavesAndLisseCategories:VS1`, `mathlib:CategoryTheory.LeftRigidCategory`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:Module.Flat`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.8.1 (iii) and the end of its proof, printed p. 225.

  > (iii) If A_1, A_2 are in Sat(Hck_{G,S/Div^d},Lambda), then also A_1 star A_2 is in Sat(Hck_{G,S/Div^d},Lambda). ... Finally, part (iii) easily follows from (i), (ii), and the observation that convolution commutes with Verdier duality.

  The closure statement and the exact mechanism.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.8.2 and proof, printed pp. 225-226.

  > All objects of the monoidal category Sat(Hck_{G,S/Div^d},Lambda) are (left and right) dualizable. The right dual of A in Sat is given by sw^* D(A) where sw : Hck_{G,Div^d} = Hck_{G,Div^d} is the switching isomorphism (induced by inversion on L_{Div^d}G).

  Dualizability with the explicit dual, needed for Tannakian reconstruction.

## GS2:correspondences. Objects and convolution before t-exactness

`Sat` is the full subcategory of objects that are universally locally
acyclic **and flat perverse**. Both conditions are part of the definition, and the source gives the reason for choosing
this normalisation: *"This definition has the virtue that it is invariant under switching `sw^*`."* Flatness over `Λ` is
what excludes the Tor obstruction to t-exactness — though the source records it in the definition without displaying the
obstruction, which the packet notes as remaining.

The fibre functor `F_{G,S} = ⊕_i H^i(Rπ_{G,S*})` is exact, faithful and conservative, and the `H^i` are local systems of
**finite projective** `Λ`-modules. That finite projectivity is a conclusion of Definition/Proposition VI.7.10, not an
extra hypothesis.

One locating remark is worth keeping: the decomposition theorem — and with it the degeneration to the Witt vector affine
Grassmannian — enters **only** in the `ℓ^{a(μ)}` bound on the kernel and cokernel of the map from the standard to the
costandard object. The source flags it: *"the final statement ultimately makes use of the decomposition theorem (and
thus requires the degeneration to the Witt vector affine Grassmannian)."* A plan that needs it earlier has mislocated
it.

Convolution is defined by pull–push, and formally as composition in the 2-category `C_T` of FS IV.2.3.3. That
formalism is built for **representable** compactifiable maps and `Hck → Div^d` is only ind-representable, so it has to
be extended to ind-representable maps with closed immersions in the ind-system, using bounded sheaves as morphisms —
a correction the source makes explicitly. Before the closure theorem, convolution is known only to preserve ULA and
`^pD^{≤0}`.

**Coverage: `partial`.** The Satake category of universally locally acyclic FLAT PERVERSE objects with its exact faithful conservative fibre functor, and the convolution product, defined as composition in the 2-category of cohomological correspondences extended to ind-representable maps. Before the closure theorem, convolution is known only to preserve universal local acyclicity and ^pD^{<=0}.

Remaining in this layer:

- The proof of Proposition VI.7.5 was read only in its first half; the Verdier-duality half and the l^{a(mu)} bound (which uses the decomposition theorem) were not fully read.
- Propositions VI.7.6, VI.7.7, VI.7.11 and VI.7.13 (constant terms for a parabolic) were located but not read.
- The 'ambient associativity and unit with coherent maps' that the stage text requires were not located as explicit statements in FS; convolution associativity is inherited from composition in the 2-category C_T, whose coherence was not verified.

### `satake-category-and-fibre-functor` — FS VI.7.8-VI.7.12: the Satake category of ULA flat perverse sheaves and its exact faithful fibre functor

*definition.* **Planet: The Satake category and its fibre functor.**

**Statement.** Sat(Hck_{G,S/Div^d},Lambda) is the full subcategory of objects that are universally locally acyclic AND flat perverse; this definition is invariant under sw^*. For split G and dominant mu with d_mu = <2rho,mu>, the objects ^p j_{mu!}Lambda[d_mu] = ^p H^0(j_{mu!}Lambda[d_mu]) and ^p R j_{mu*}Lambda[d_mu] lie in Sat. The functor R pi_{G,S*} takes values in complexes all of whose H^i are local systems of FINITE PROJECTIVE Lambda-modules, each H^i(R pi_{G,S*}) is exact, and F_{G,S} = the direct sum over i of H^i(R pi_{G,S*}) is exact, faithful and conservative; it detects kernels and cokernels whose F-image kernel is a direct summand. The image of Sat in D_et(Gr) is stable under Verdier duality, and D is an equivalence with D^2 = id.

**Hypotheses that must not be dropped.**

- FLATNESS of the perverse object over Lambda is part of the definition and is what excludes the Tor obstruction to t-exactness
- The finite-projectivity of the H^i of R pi_{G,S*} is part of Definition/Proposition VI.7.10, not an extra assumption
- For VI.7.5 (the properties of ^p j_{mu!}Lambda[d_mu]) Fargues-Scholze state that the FINAL statement - that the kernel and cokernel of ^p H^0(j_{mu!}Lambda[d_mu]) -> ^p H^0(R j_{mu*}Lambda[d_mu]) are killed by l^{a(mu)} - 'ultimately makes use of the decomposition theorem (and thus requires the degeneration to the Witt vector affine Grassmannian)'
- The degree-0 part of CT_B(A)[deg] is locally finite free because it is computed by the top compactly supported cohomology of the Mirkovic-Vilonen cycles S_lambda intersect Gr^{Witt}_{G,mu}, which is finite free for any separated variety

**Proof outline.**

1. Define Sat by the two conditions and note sw-invariance from VI.6.2 and the sw-invariance of flat perversity.
2. For VI.7.5: A = j_{mu!}Lambda[d_mu] is in ^pD^{<=0} and ULA; CT_B(A)[deg] sits in degrees <= 0 with degree-0 part locally finite free by the MV-cycle computation; t-exactness of CT_B[deg] transfers this to ^pH^0(A); Verdier duality and Proposition IV.6.13 give the dual statement and the isomorphism ^p Rj_{mu*}Lambda[d_mu](d_mu) = D(^p j_{mu!}Lambda[d_mu]).
3. VI.7.10's exactness and faithfulness use conservativity (VI.4.2) and a Barr-Beck type assertion.
4. VI.7.12 gives Verdier duality on Sat.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `Sat` | data | The full subcategory of D_et(Hck_{G,S/Div^d},Lambda) of objects that are universally locally acyclic AND flat perverse. Both conditions are part of the definition. |
| `Sat.sw_invariant` | structure | The definition is invariant under the switching involution sw^*; this is the virtue for which flat perversity is chosen over other normalisations. |
| `Sat.flat` | structure | Flatness over Lambda is what excludes the Tor obstruction to t-exactness; the source records it in the definition but does not display the obstruction. |
| `Sat.standard` | constructor | For split G and dominant mu with d_mu = <2rho,mu>, the objects ^p j_{mu!}Lambda[d_mu] and ^p Rj_{mu*}Lambda[d_mu] lie in Sat. |
| `fibreFunctor` | data | F_{G,S} = the direct sum over i of H^i(R pi_{G,S*}), exact, faithful and conservative. |
| `fibreFunctor.finiteProjective` | structure | R pi_{G,S*} takes values in complexes all of whose H^i are local systems of FINITE PROJECTIVE Lambda-modules, and each H^i is exact. |
| `Sat.verdier` | structure | The image of Sat in D_et(Gr) is stable under Verdier duality, and D is an equivalence with D^2 = id. |

Derived from where the object is used:

- in `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-preserves-satake-and-dualizability` — the closure theorem says this category is monoidal
- in `GeometricSatakeAndFusion:GS4:integral-dual-group/tannakian-left-adjoint` — Tannakian reconstruction is applied to this category with this fibre functor
- in `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms` — the constant-term functors are compared with this fibre functor

**Unit tests.** A plausible wrong definition fails one of these.

- `flatness_is_not_automatic` — Over Lambda = Z/l^2 a perverse ULA object need not be flat; dropping flatness from the definition changes the category and breaks sw-invariance.
- `fibre_functor_faithful_not_full` — F_{G,S} is exact, faithful and conservative, but not full; a Tannakian argument that assumes fullness is not the source's.
- `finite_projective_is_part_of_the_statement` — The H^i of R pi_{G,S*} are local systems of finite projective modules by Definition/Proposition VI.7.10; this is a conclusion of the definition, not an extra hypothesis.
- `decomposition_theorem_only_for_the_bound` — The decomposition theorem, and with it the degeneration to the Witt vector affine Grassmannian, enters only in the l^{a(mu)} bound on the kernel and cokernel of the map from the standard to the costandard object; a plan that needs it earlier has mislocated it.

**Acceptance.**

- Check flatness over Lambda = Z/l^2 on an example with nonsemisimple reduction
- Check that F_{G,S} is faithful but not full
- Check the l^{a(mu)} bound and confirm that the decomposition theorem enters only there

**Prerequisites.** `GeometricSatakeAndFusion:GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles`, `GeometricSatakeAndFusion:GS1/ULA-sheaves-on-the-hecke-stack`, `GeometricSatakeAndFusion:GS1/relative-perverse-t-structure`, `VStackSheavesAndLisseCategories:VS1`, `VStackSheavesAndLisseCategories:VS3`, `mathlib:Module.Flat`, `mathlib:Module.Projective`, `mathlib:CategoryTheory.Triangulated.TStructure.Heart`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition VI.7.8, printed p. 221.

  > Let Sat(Hck_{G,S/Div^d},Lambda) in D_et(Hck_{G,S/Div^d},Lambda) be the full subcategory of all objects that are universally locally acyclic and flat perverse. This definition has the virtue that it is invariant under switching sw^*.

  Verbatim definition with both conditions.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.7.9, printed p. 222.

  > The perverse sheaves ^p j_{mu!}Lambda[d_mu] = ^p H^0(j_{mu!}Lambda[d_mu]), ^p Rj_{mu*}Lambda[d_mu] = ^p H^0(Rj_{mu*}Lambda[d_mu]) lie in the Satake category Sat(Hck_{G,Div^1_Y-curly}, Lambda). Proof. This follows from Proposition VI.7.7 and Proposition VI.7.5.

  Anchors the packet's claim that the standard and costandard objects lie in Sat, and names its two inputs.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition/Proposition VI.7.10, printed p. 222.

  > takes values in complexes C in D_et(S,Lambda) such that all H^i(C) are local systems of finite projective Lambda-modules, and each functor H^i(R pi_{G,S*}) : Sat(Hck_{G,S/Div^d},Lambda) -> LocSys(S,Lambda) is exact. ... The functor F_{G,S} is exact, faithful, and conservative.

  The fibre functor with its exactness and finite-projectivity properties.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, After Proposition VI.7.5, printed p. 219.

  > We remark that the final statement ultimately makes use of the decomposition theorem (and thus requires the degeneration to the Witt vector affine Grassmannian).

  Isolates exactly where the decomposition theorem - the late GS4:rational-reductivity input - is needed.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.7.12, printed p. 223.

  > The image of the fully faithful functor Sat(Hck_{G,S/Div^d},Lambda) -> D_et(Gr_{G,S/Div^d},Lambda) is stable under Verdier duality D. The induced functor D : Sat(...)^op -> Sat(...) is an equivalence, with D^2 = id.

  Anchors the Verdier-duality clause of the node statement, which was previously unsourced.

### `convolution-diagram` — FS VI.8: convolution on bounded sheaves on the local Hecke stack, via the 2-category of correspondences

*construction.* **Planet: Convolution on the Hecke stack.**

**Statement.** The convolution product on D_et(Hck_{S/Div^d},Lambda)^{bd} is defined by pull-push along the convolution diagram; formally, D_et(Hck_{S/Div^d},Lambda)^{bd} is the category of endomorphisms of [Div^d/L^+G] x_{Div^d} S in the 2-category C_T of Subsection IV.2.3.3, for T = [Div^d/L G] x_{Div^d} S, after extending that formalism to maps that are IND-representable in locally spatial diamonds with closed immersions in the ind-system and using bounded sheaves as morphisms. Convolution preserves universal local acyclicity, and preserves ^p D^{<=0}.

**Hypotheses that must not be dropped.**

- The 2-category C_T of IV.2.3.3 is set up for REPRESENTABLE compactifiable maps; Hck -> Div^d is only ind-representable, so the formalism has to be extended, using closed immersions in the ind-system and bounded sheaves as the morphism categories. Fargues-Scholze flag this as a correction that 'is corrected by passing to bounded sheaves'
- Part (i) (preservation of ULA) uses Proposition IV.2.11 (proper pushforward) and Proposition IV.2.26
- Part (ii) (preservation of ^pD^{<=0}) is checked for S = Spa(C,C^+) strictly local and G split, after a devissage to !-extensions of constant sheaves on open Schubert cells (which are ULA), and by the Kunneth formula reduces to d = 1; one then passes to the universal situation over (Div^1_Y-curly)^2 and uses density of the complement of the diagonal plus Proposition VI.7.4

**Proof outline.**

1. Set up the convolution diagram and the pull-push operation with proper-support pushforward.
2. Identify the monoidal structure with composition in the extended 2-category C_T.
3. Prove ULA-preservation from IV.2.11 and IV.2.26.
4. Prove ^pD^{<=0}-preservation by the devissage, Kunneth reduction to d = 1, and the density argument over (Div^1)^2 followed by restriction to the diagonal, which is exactly A_1 star A_2.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `convolution` | data | A_1 star A_2 = pull-push along the convolution diagram, a monoidal structure on D_et(Hck_{S/Div^d},Lambda)^{bd}. |
| `convolution.as2category` | characterisation | Formally the bounded sheaf category is the endomorphism category of [Div^d/L^+G] x_{Div^d} S in the 2-category C_T of FS IV.2.3.3, with T = [Div^d/LG] x_{Div^d} S; convolution is composition there. |
| `convolution.indExtension` | structure | C_T is set up for REPRESENTABLE compactifiable maps, and Hck -> Div^d is only ind-representable; the formalism has to be extended to maps ind-representable in locally spatial diamonds with closed immersions in the ind-system, using bounded sheaves as morphisms. The source flags this as a correction. |
| `convolution.preservesULA` | compatibility | If A_1 and A_2 are universally locally acyclic, so is A_1 star A_2 (Proposition VI.8.1 (i)). |
| `convolution.rightExact` | compatibility | If A_1 and A_2 lie in ^pD^{<=0}, so does A_1 star A_2 (Proposition VI.8.1 (ii)); the proof reduces by Kunneth to d = 1 and uses density of the complement of the diagonal in (Div^1)^2. |

Derived from where the object is used:

- in `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-preserves-satake-and-dualizability` — the closure statement is about this operation
- in `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule` — the fusion product of the second part of this roadmap is built from this convolution
- in `GeometricSatakeAndFusion:GS4:integral-dual-group/tannakian-left-adjoint` — Tannakian reconstruction is applied to this monoidal structure

**Unit tests.** A plausible wrong definition fails one of these.

- `associativity_and_unit` — Associativity and the unit are inherited from composition in the 2-category, on three minuscule objects; the coherence of that 2-category is itself recorded as remaining.
- `not_yet_satake_closed` — Before the Satake closure, convolution is known only to preserve ULA and ^pD^{<=0}; asserting that it preserves the Satake category here is premature - that is the next node.
- `kunneth_reduction` — The reduction to d = 1 is by the Kunneth formula; a proof that works only for d = 1 without that reduction does not establish the multi-leg statement.
- `ind_representability` — The 2-category has to be extended to ind-representable maps; applying the representable formalism directly is the error the source explicitly corrects.

**Acceptance.**

- Check associativity and unit on three minuscule objects
- Check that convolution before GS3 is NOT yet known to preserve Sat (that is GS2:Satake-closure)
- Check the Kunneth reduction to one leg

**Prerequisites.** `VStackSheavesAndLisseCategories:VS1`, `VStackSheavesAndLisseCategories:VS3`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:CategoryTheory.Comma`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, VI.8, printed p. 224.

  > the category D_et(Hck_{S/Div^d},Lambda)^{bd} is precisely the category of endomorphisms of [Div^d_Y-curly/L^+_{Div^d}G] x_{Div^d} S in the 2-category C_T defined in Subsection IV.2.3.3 ... This problem is corrected by passing to bounded sheaves - one can extend the formalism to the case of maps that are ind-representable in locally spatial diamonds, with closed immersions in the ...

  The exact formal setting of convolution and the extension that has to be made. The excerpt is truncated here; the full quotation is in data/decompositions/GeometricSatakeAndFusion.json, where the independent review checked it against the source.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.8.1 (i),(ii) and proof, printed p. 225.

  > (i) If A_1 and A_2 are universally locally acyclic, then A_1 star A_2 is universally locally acyclic. (ii) If A_1 and A_2 lie in ^p D^{<=0}, then A_1 star A_2 is in ^p D^{<=0}. ... By the Kunneth formula one can then reduce to the case d = 1.

  The two preservation statements available before the Satake closure.

## Requests to other roadmaps

- **`RelativeFarguesFontaine:RF0:integral-Y`** — The integral period space Y-curly before removing the special fibre. Everything in this part turns on keeping the Cartier divisor pi = 0, where B^+_dR(C^sharp) = W_{O_E}(C); without the integral space the special-fibre comparison of GS1 has no right-hand term.
- **`RelativeFarguesFontaine:RF2:integral-divisors`** — Integral divisors Div^d_Y-curly, the base of every loop space, Hecke stack and Grassmannian here, together with the ideal sheaf I_S whose powers give the congruence filtration.
- **`RelativeFarguesFontaine:RF2:untilts`** — Untilts and the local de Rham rings B^+ and B, in which the positive loop space and the loop space are defined.
- **`RelativeFarguesFontaine:RF4:G-torsors`** — G-torsors on the curve and their modifications, with the Beauville-Laszlo comparison between the torsor-modification and loop-quotient descriptions, which this layer uses implicitly.
- **`ReductiveGroupsPartII:RG2.3`** — Reductive group schemes with their Borel, torus and parabolic subgroups, the root datum, the dominance order on cocharacters and the Cartan decomposition over a complete discrete valuation ring. The split hypothesis and the descent to a nonsplit G along a finite etale extension are statements about this layer's objects.
- **`ReductiveGroupsPartII:RG2.5`** — The Lie algebra with its adjoint action and weight decomposition, which is what the graded pieces of the congruence filtration are built from and what the truncation bound is stated in terms of.
- **`BunGAndNewtonStrata:BG0`** — Torsors with reductive structure group, the ambient notion of G-bundle used throughout, in the Tannakian form as exact tensor functors from Rep_E G.
- **`DiamondSixOperations:S4`** — Cohomological smoothness with its descent hypotheses. The graded pieces of the congruence filtration and the open Schubert cell are asserted to be cohomologically smooth, of l-dimension d dim G and <2rho,mu> respectively.
- **`DiamondSixOperations:S5`** — The worked examples of cohomological smoothness, in particular quotients by group diamonds, which is the form the open Schubert cell L^+G/(L^+G)_mu takes.
- **`EtaleDualityAndPerverseSheaves:EDC.4`** — The perverse t-structure and recollement on the scheme side, the model the relative perverse t-structure of GS1 is built after. The decomposition records that the scheme-side foundation was not inspected here.
- **`EtaleDualityAndPerverseSheaves:EDC.5`** — Duality and the decomposition theorem on the scheme side. The l^{a(mu)} bound on the kernel and cokernel of the map from the standard to the costandard object is the one place the decomposition theorem enters this part, and the source says so explicitly.
- **`VStackSheavesAndLisseCategories:VS0`** — Artin v-stacks and the operations eligible on them. Hck and Gr are Artin v-stacks after the truncation of GS0:Schubert-smoothness, and the hyperbolic-localization correspondence is stated with those operations.
- **`VStackSheavesAndLisseCategories:VS1`** — Universal local acyclicity with its perfect-constructibility condition, the dualizability criterion IV.2.23 whose 2-category this layer extends to ind-representable maps, and hyperbolic localization with Braden's theorem (FS IV.6). The decomposition records IV.6 as entirely unread, and it is imported at Corollary VI.3.5 and in the proofs of VI.6.4 and VI.7.5.
- **`VStackSheavesAndLisseCategories:VS3`** — The lisse and solid coefficient categories with their coefficient convention, in which the ULA and Satake categories are compared across Spd O_C, Spd C and Spd k.
- **`EnhancedDerivedSheaves:E5:abstract`** — The monoidal stable infinity-categorical baseline. The existence and uniqueness of the relative perverse t-structure uses a presentable stable infinity-categorical refinement on each bounded closed subset together with Lurie's Higher Algebra Proposition 1.4.4.11, and the convolution 2-category is an infinity-categorical object. The atlas links this layer into GS4:integral-dual-group but not into GS1 or GS2:correspondences, where it is actually consumed.

## Gaps

### Zhu's mixed-characteristic Satake paper is in the library and entirely unread

The roadmap names 'Zhu sections 1-2 and Appendix A' as a primary source for the perfect-space carrier of the Witt vector affine Grassmannian and its relation to finite-type models, and warns that 'Zhu's independent commutativity proof is not silently imported instead of FS fusion, nor are its inputs to equal-characteristic Satake made circular here'. VERIFIED PRESENT: references/papers/Zhu_MixedCharacteristicSatake.pdf, 'Affine Grassmannians and the geometric Satake in mixed characteristic', arXiv:1407.8519v3 (20 July 2016), 63 pages, sha256 2c23e397d21e84812daec2c637e2a763eec54ef0d784748eb74e3b2093de1e5b. Its first page and table of contents were inspected to confirm the title and edition; NOTHING ELSE WAS READ. NEXT SOURCE ACTION: read Zhu sections 1.1-1.4 (p-adic loop groups, affine Grassmannians for GL_n, the Demazure resolution, affine flag varieties), section 2 (the geometric Satake) and Appendix A. Note that FS's Theorem 8.2 attribution to Zhu (representability by the perfection of a proper algebraic space) is weaker than Bhatt-Scholze Theorem 8.3, and FS's proof is independent of it.

### Bhatt-Scholze sections 2-7 and 8.2-8.3 are unread, so the line bundle L is a read STATEMENT with an unread construction

The roadmap makes the geometric construction of L an explicit obligation: 'use the GEOMETRIC determinant line construction on a Demazure resolution and the trivial-on-geometric-fibres descent criterion (BS17 section 6, especially 6.8/6.12); prove its positivity/ampleness by the semiampleness criterion used in BS17 sections 7-8'. What was actually read: the introduction (Theorems 1.1, 1.2, 1.3, Remark 1.4, the outline), Theorem 6.8 with its proof, the statements of Definition 8.1, Theorems 8.2 and 8.3 with the strategy paragraph, and the proof of Theorem 8.3 in section 8.4 including the three Keel citations. NOT READ: section 2 (h-topology, Theorem 2.9), section 3 (perfect schemes), section 4 (proof of Theorem 1.2), section 6 apart from 6.8 (Propositions 6.1, 6.2, Lemmas 6.4, 6.11, Remark 6.12), section 7 (families of torsion W(k)-modules, Lemma 7.9 giving the closed immersions Gr_{<=mu} in Gr_{<=lambda}), section 8.2 (the Demazure resolution) and section 8.3 (Theorem 8.8, the construction of L) and the auxiliary Lemmas 8.9, 8.10 (nefness), 8.11 (the exceptional locus). NEXT SOURCE ACTION: read BS17 printed pp. 4-22 and pp. 32-35 in full. Until then the existence of the ample line bundle is an unread import, not an input package.

### Keel's semiampleness machinery beyond 1.7-1.9 is unread

The roadmap makes the Keel criterion a sub-obligation: 'construct the exceptional locus of a nef line bundle, its restriction criterion, Frobenius-power extension/descent of sections, and the reduction yielding semiampleness; verify the positivity assumptions before the projectivity conclusion'. READ: Abstract, 0.0 Definition-Lemma, 0.1 Definition (exceptional locus), 0.2 Theorem, 0.3 Corollary (printed pp. 253-254), and 1.7 Lemma with proof, 1.8 Lemma with sketch, 1.9 Theorem with proof (printed pp. 262-263). NOT READ: 1.1-1.6 (including Kodaira's lemma application 1.6 and the reductions 1.4, 1.5), the whole of Section 2 (which Keel says contains the complete proof of 1.8, e.g. 2.10.1 and 2.12), and the Frobenius-power section-extension arguments that carry the positive-characteristic content. NEXT SOURCE ACTION: read Keel printed pp. 255-262 and Section 2. Note that Keel's 1.8 is only SKETCHED in Section 1 ('Sketch of Proof. This follows easily from [Kol95,8.4] and [Ar70,6.1]'), so the complete proof genuinely requires Section 2.

### FS IV.6 and IV.7 are unread but are imported throughout Chapter VI

Section IV.6 (hyperbolic localization / Braden's theorem, including Definition IV.6.11 of G_m-monodromic and Proposition IV.6.13 on compatibility with Verdier duality) and Section IV.7 (Drinfeld's lemma, Proposition IV.7.3) were NOT opened. They are used at: Corollary VI.3.5 (the hyperbolic-localization comparison), the proofs of VI.6.4 and VI.7.5 (IV.6.13), and Proposition VI.9.2 (IV.7.3, which is what turns local systems on (Div^1_X)^I into W_E^I-representations and hence supplies the Weil action of the final Satake theorem). FS themselves caution in the Chapter IV introduction: 'The theme here is the idea pi_1((Div^1)^I) = W_E^I. Unfortunately, we know no definition of pi_1 making this true, but for example it becomes true when considering Lambda-local systems for any Lambda.' NEXT SOURCE ACTION: read FS printed pp. 155-166. This gap is shared with the VStackSheavesAndLisseCategories packet of this job, where it is recorded for stage VS1.

### GS4:classical-Satake-comparison has no corresponding passage in FS VI

Chapter VI of Fargues-Scholze ends with VI.12 (the Chevalley involution); the section list VI.1-VI.12 was inspected and contains no Frobenius-trace/spherical-Hecke-function comparison. The stage's content - comparing the trace of Frobenius on a Satake object over a finite-type special-fibre model with the spherical Hecke function, with Haar volume of the hyperspecial subgroup, geometric Frobenius, q^{<rho,mu>} and the half twist - therefore has no source in the primary reference for this roadmap. NEXT SOURCE ACTION: look in Zhu, 'Affine Grassmannians and the geometric Satake in mixed characteristic' section 2 (in the library, unread) and in the classical Satake literature (Gross, 'On the Satake isomorphism'; Haines-Kottwitz-Prasad). Also check SmoothRepresentationsOfLocalGroups SR.4, which the stage text says supplies the classical Satake transform and which belongs to another roadmap. This stage is marked not_read in coverage.

### Imported results invoked inside the inspected proofs but not named in any node

Added by independent review after reading the printed proofs. Each item is cited inside a proof that this packet decomposes, and none of the cited texts was read. (a) Proof of VI.1.7, printed p. 193: [GR03, Proposition 5.4.21] (already named) and, one page earlier in the proof of VI.1.4 on which it rests, [dJvdP96, Proposition 3.2.2] / [KL15, Proposition 8.2.20] and [SW20, Lemma 17.1.8]. (b) Proposition VI.1.10, printed p. 194: G^diamond is defined by [Sch17a, Section 27, before Proposition 27.5]. (c) Proof of VI.1.13, printed p. 196: [Sch17a, Propositions 9.7, 11.23, Lemma 15.6] and [Hub94, Proposition 3.8]. (d) Proof of VI.2.4, printed p. 199: [SW20, Proposition 20.3.7] and [Sch17a, Lemma 12.5]. (e) Proof of VI.3.7, printed p. 206: [SW20, Lemma 14.2.3] and 'the v-descent results of [BS17]'. (f) Proof of VI.7.5, printed p. 220: [Zhu17, Lemma 2.1], cf. [Gai01, Proposition 1], [Lus83]; [Zhu17, Section 1.4.2] for the Demazure-Bott-Samuelson fibres; and the decomposition theorem itself. (g) p. 236: [DM82, Proposition 2.20, Corollary 2.22, Proposition 2.23] and [MV07, Section 7]. (h) Keel's proof of 1.9, printed p. 263: Kodaira's lemma [Kol96, VI.2.16] and Keel's own 1.4, 1.5, 1.6, 1.8; Keel's 1.8 is only sketched, citing [Kol95, 8.4] and [Ar70, 6.1]. (i) Bhatt-Scholze proof of 8.3, printed pp. 34-35: Lemmas 8.9, 8.10, 8.11, Proposition 6.1 and Lemma 7.9. NEXT SOURCE ACTION: read (d), (e) and (g) first - they are the imports that carry actual mathematical content into nodes of this packet rather than routine descent bookkeeping.

### Atlas substage order is the reverse of the source's proof order: GS2:Satake-closure -> GS3:fusion (link convolution-preserves-satake-and-dualizability -> finite-set-functoriality-and-constant-terms), while the atlas has GS3:fusion -> GS2:Satake-closure

Added by independent review. The link is source-correct at NODE level: the proof of Corollary VI.9.5 (printed p. 229) opens 'By Proposition VI.8.2, all A in Sat^I_G(Lambda) are dualizable, with dual sw^* D(A)'. And Proposition VI.8.2 is proved (printed p. 226) from Proposition IV.2.24, Proposition VI.6.2 and Proposition VI.7.12 - fusion is NOT used - just as Proposition VI.8.1(iii) is proved from (i), (ii) and the commutation of convolution with Verdier duality. In Fargues-Scholze both live in section VI.8, BEFORE section VI.9 on fusion. The atlas, however, says GeometricSatakeAndFusion:GS2:Satake-closure REQUIRES GS3:fusion, and its stage text says 'Using GS3:fusion ... prove perversity, flatness and ULA preservation ... This return is after GS3's geometric fusion construction, as in FS VI.8-VI.9'. So lifting this node link to stages contradicts the atlas edge and would create a two-cycle. The node itself bundles two things with different positions in the source's order: VI.8.1(iii), the closure theorem that GS2:Satake-closure owns, and VI.8.2, dualizability, which is prior to fusion and is what VI.9.5 consumes. CONSEQUENCE AND DECISION NEEDED. The node-level link graph of all thirteen packets of this job is ACYCLIC (197 nodes, 210 edges, checked). The cycle appears only if node links are lifted to stage edges and unioned with data/atlas.json stageEdges. Nothing was reversed here, because reversing would misstate the source. The orchestrator must choose: (i) treat these as node-level edges only and do not lift them to stage edges at integration; (ii) re-parent the offending node (or split it) so that its stage matches the source's order; or (iii) revise the atlas substage ordering. Option (iii) is the one the source actually supports in each case.

### Neither pinned library has ampleness, nefness or semiampleness, and no roadmap of the atlas owns them

data/library-coverage.json has no reviewed audit entry for this roadmap, so the pinned declaration index was searched directly at Mathlib 082e2d3 and Tau Ceti f790474. The entire positivity theory that the ampleness node rests on is absent: the only declaration whose name contains Ample is AmpleSet in Mathlib/Analysis/Convex/AmpleSet.lean, which is the convex-analysis notion and is unrelated; there is no IsNef, no semiample, no basepoint-freeness, and no Proj of a graded ring. Tau Ceti does have the carrier, TauCeti.AlgebraicGeometry.InvertibleSheaf in TauCeti/AlgebraicGeometry/LineBundle/Basic.lean, so line bundles exist and positivity does not. A search of the atlas's roadmap owners found none for projective or birational algebraic geometry either. So Keel's criterion, its exceptional locus, and the ampleness of L on the Witt vector affine Grassmannian have neither a library citation nor a supplier stage, and this packet plans them here by default. A maintainer should decide whether that is right; the packet's second structural proposal says why it may not be.

### What the pinned libraries do supply, and is therefore cited rather than planned

The same index search found several carriers that this packet cites instead of planning. mathlib:CategoryTheory.Triangulated.TStructure exists, with IsLE, IsGE and a Heart, so the abstract notion of a t-structure is pinned and only the relative perverse normalisation - the shift by the sum of <2rho,mu_i> over the DISTINCT untilts - is planned in GS1. mathlib:PerfectRing and mathlib:Perfection give the perfect F_p-algebras and the perfection functor that Bhatt-Scholze work with throughout. mathlib:AlgebraicGeometry.IsProper and mathlib:ValuationRing give properness and the valuation rings the fibral descent criterion reduces to. mathlib:CoxeterSystem and tauceti:TauCeti.TitsSystem.bruhatCell give the Bruhat and dominance combinatorics, and mathlib:RootPairing the root datum with rho and the weight decomposition. mathlib:CategoryTheory.LeftRigidCategory is the pinned form of the dualizability conclusion of GS2:Satake-closure. Absent, and therefore genuine dependencies: any loop group, affine Grassmannian, perfectoid space or diamond, at either pin.

### GS0:Witt-geometry has no incoming stage edge in the atlas, and GS1 and GS2 have none from EnhancedDerivedSheaves

The stage edges of data/atlas.json give GS0:loop-geometry seven suppliers and GS0:Schubert-smoothness three, but GS0:Witt-geometry none at all, although it is where perfect schemes, properness, h-descent and the whole positivity argument are used. And EnhancedDerivedSheaves:E5:abstract is linked into GS4:integral-dual-group and GS4:rational-reductivity but not into GS1, whose t-structure existence uses a presentable stable infinity-categorical refinement and Lurie's Higher Algebra Proposition 1.4.4.11, nor into GS2:correspondences, whose convolution is composition in an infinity-categorical 2-category. Both are filed as requests here, but a kind:link job should add the edges, since a request is a note and an edge is what the atlas draws.

## Structural proposals

### The atlas has GS3:fusion supplying GS2:Satake-closure; the source proves it the other way round (`reorder-links`)

data/atlas.json contains the stage edge GeometricSatakeAndFusion:GS3:fusion -> GeometricSatakeAndFusion:GS2:Satake-closure. The source order is the reverse. Proposition VI.8.1(iii), that convolution preserves the Satake category, is proved from VI.8.1(i), (ii) and the commutation of convolution with Verdier duality; Proposition VI.8.2, that every object of the Satake category is dualizable with right dual sw^* D(A), is proved from Proposition IV.2.24, Proposition VI.6.2 and Proposition VI.7.12. Fusion is used in neither. Both are in section VI.8, BEFORE section VI.9 on fusion, and it is VI.9 that consumes them: the proof of Corollary VI.9.5 opens 'By Proposition VI.8.2, all A in Sat^I_G(Lambda) are dualizable, with dual sw^* D(A)'. The reviewed decomposition's own link graph agrees, running GS2:Satake-closure/convolution-preserves-satake-and-dualizability -> GS3:fusion/finite-set-functoriality-and-constant-terms. The decomposition records the discrepancy as its last gap; this packet repeats it as a proposal, because an edge in the wrong direction makes the atlas assert that the dualizability the Hecke roadmap consumes depends on fusion, which the source does not claim.

### The positivity theory that GS0:Witt-geometry needs has no owner and probably should not be owned here (`new-owner`)

The ampleness node of this layer needs nef and semiample line bundles, the exceptional locus of a nef bundle, Keel's semiampleness criterion in positive characteristic and Kodaira's lemma. None of it is in either pinned library, and no roadmap of the atlas owns projective or birational algebraic geometry: a search of the roadmap owners for Ample, Positivity, Birational, MinimalModel, Projective, LineBundle, Divisor or Vanishing returned nothing relevant. So this packet plans the Keel material inside a layer whose subject is the Witt vector affine Grassmannian, which is where it is used but not where it belongs: Keel's criterion is a general theorem about projective schemes over a field of positive characteristic and, as PROTOCOL section 15 puts it for the Koszul complex, a general notion that is missing should be planned once, as generally as its uses require, in the roadmap that owns it. Two remedies are possible: a sub-layer of GS0:Witt-geometry that owns positivity explicitly and is linked from wherever else the atlas needs it, or a new roadmap for positivity in algebraic geometry. The second is likely right if any other roadmap needs ampleness; the packet cannot tell, because the search found no other consumer either, which may only mean that no other decomposition has reached that point yet.

## Planets

At most six per layer; only definitions, constructions and named theorems.

| layer | planets |
| --- | --- |
| `GS0` | — |
| `GS0:Schubert-smoothness` | Smoothness of the open Schubert cell |
| `GS0:Witt-geometry` | The Witt vector affine Grassmannian; h-descent for vector bundles; Ampleness by Keel semiampleness; Mirkovic-Vilonen cycles |
| `GS0:loop-geometry` | Loop groups and the local Hecke stack; The congruence filtration of L+G; Schubert bounds and properness |
| `GS1` | Hyperbolic localization and CT_B; The relative perverse t-structure; ULA sheaves on the Hecke stack |
| `GS2` | — |
| `GS2:Satake-closure` | Convolution preserves Satake |
| `GS2:correspondences` | The Satake category and its fibre functor; Convolution on the Hecke stack |

## Nothing here is formalised

No Lean was compiled for this job and no statement in this packet is claimed to be formalised. The suggested file
is a set of signatures whose only proof is `sorry`; every `implementationStatus` is `unchecked`.
