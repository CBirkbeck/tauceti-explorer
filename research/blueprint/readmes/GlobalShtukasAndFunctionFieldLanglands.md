# Global shtukas and Langlands over function fields

Blueprint for the roadmap `GlobalShtukasAndFunctionFieldLanglands`, job
`BP-GlobalShtukasAndFunctionFieldLanglands` (issue #1010).
Packet: `research/blueprint/packets/GlobalShtukasAndFunctionFieldLanglands.json`. Suggested Lean file:
`research/blueprint/suggested/GlobalShtukasAndFunctionFieldLanglands.lean`. Handoff:
`research/blueprint/handoff/BP-GlobalShtukasAndFunctionFieldLanglands.md`.

**Status: partial.** All eight layers in scope are decomposed and none is closed; each carries a precise
`remaining` list. The packet has 65 nodes (8 definitions, 10 constructions, 40 theorems, 2 lemmas, 5 applications),
135 API items, 72 unit tests and 42 planets; it cites 29 declarations of the pinned libraries, records 8 gaps,
makes 20 requests to other roadmaps and makes 4 structural proposals.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Sources

Three sources, all downloaded in this session and hashed.

- **`vl`** — Vincent Lafforgue, *Chtoucas pour les groupes reductifs et parametrisation de Langlands globale*. arXiv:1209.5352v10, 10 January 2018; in French; 184 pages; page numbers are the printed page numbers of that file
  <https://arxiv.org/abs/1209.5352>.
  SHA-256 `b37715f9c42862b7560d8b71da07924376e3cbbbe862ef9e89a57d8c91a64295`.
- **`vl-icm`** — Vincent Lafforgue, *Shtukas for reductive groups and Langlands correspondence for function fields*. arXiv:1803.03791v1, 10 March 2018; the author's ICM 2018 plenary lecture; in English; 31 pages
  <https://arxiv.org/abs/1803.03791>.
  SHA-256 `b51a2f0057043313c489cfbb0ffb58c0121356f2b3ba962eb285045c67fd6e7a`.
- **`ll`** — Laurent Lafforgue, *Chtoucas de Drinfeld et correspondance de Langlands*. IHES preprint M/00/70, author-hosted PDF at ihes.fr; published as Invent. Math. 147 (2002) 1-241; in French; 241 pages; page numbers are the printed page numbers of that file
  <https://www.ihes.fr/~lafforgue/math/fulltext.pdf>.
  SHA-256 `af732dac0d2dd00056ff46075f069f09cb2239bcac5cec68b13d17faa8d2ea76`.

**What was read, and what was not.** Vincent Lafforgue's paper is 184 pages in French; its introduction,
pages 2–31, is a largely self-contained account of the whole construction, and it was read in full. Every
statement cited in this packet from that source is taken from the introduction, with the introduction's own
numbering and with the pointer it gives to the chapter where the result is proved. The bodies of chapters 1
to 14 were **not** read. His ICM 2018 survey is 31 pages in English and was read in full; it supplies
Drinfeld's lemma, the dual group, the Satake compatibility, the heuristic decomposition and the account of
the local aspects. Laurent Lafforgue's paper is 241 pages in French; **only its two-page introduction was
read**, and GS.6 is written from it. That is the largest reading gap in this packet and the coverage record
for GS.6 says so in those words.

The text of all three was extracted with a purpose-written pure-Python PDF reader. Two defects had to be
fixed before the sources were legible: the reader associated font resources globally rather than per page,
so a mathematics font's `ToUnicode` map was applied to the text-italic font and every theorem statement — all
of which are set in italics — decoded as a substitution cipher; and the `fi`, `ff`, `fl`, `ffi` and `ffl`
ligatures of the Computer Modern text fonts, which carry no `ToUnicode` entry, were silently dropped, so that
“field” came out as “eld” and “coefficients” as “coecients”. Both were repaired; every excerpt here comes
from the repaired extraction and was read as running text.

## What the pinned libraries already have, and is therefore not planned

The reviewed library audit **AUDIT-20** (review `REV-AUDIT-20`, 17 September 2026, 240 targets checked, 89
corrections) covers all eight layers of this roadmap. Its verdict for every one of them is **not built**, and
of the thirty-eight targets it lists, thirty-seven are recorded as *absent* and one — descent data for
nonsplit groups — as *partial*. Reading the pinned declaration index confirms it. There is no moduli stack of
bundles and no algebraic-stack formalism to define one in: Mathlib's stack notion is the descent condition
for a pseudofunctor on a site, with no representability or atlas theory, and no Deligne–Mumford stack exists.
There is no loop group, no affine Grassmannian and nothing over powers of a curve. There are no perverse
sheaves, no six-functor formalism and no intersection complex; `grep -i satake` and `grep -i perverse` return
nothing in either tree. There is no dual group and no L-group. There is no adele ring of a function field and
no automorphic form over one. There is no étale fundamental group of a scheme. There is no
Grothendieck–Lefschetz trace formula and there are no nearby cycles. There are no Harder–Narasimhan
filtrations: `grep -i harder` and `grep -i semistab` find nothing relevant.

What the libraries *do* have is cited and never re-planned:

- `Module.Grassmannian`, the functor of rank-`n` quotients of a module — the finite-dimensional Grassmannian,
  which the audit names as the nearest pinned notion to the affine and Beilinson–Drinfeld Grassmannians.
- `RootPairing` and `RootPairing.flip`, the pinned carrier of a root datum and its duality, which is the
  combinatorial shadow of Langlands duality and what the dual group must be built from.
- `CategoryTheory.GaloisCategory` and `PreGaloisCategory`, abstract Galois categories with a fibre functor and
  a recognition theorem for the fundamental group — the nearest pinned notion to the étale fundamental group,
  which Drinfeld's lemma is a statement about.
- `CategoryTheory.Pseudofunctor.DescentData`, `IsStack` and `toDescentData`, which is exactly the descent
  condition and no more.
- `AlgebraicGeometry.Scheme.ellAdicSheaf` and `Scheme.ProEt.topology`: Mathlib defines ℓ-adic cohomology as
  pro-étale cohomology with `Z_ℓ`-coefficients and proves nothing about it.
- `NumberField.AdeleRing`, the adele ring of a *number* field, the nearest pinned notion for Weil
  uniformization.
- Tau Ceti's `AlgebraicGeometry.Scheme.CartierDivisor` with the exact sequence relating rational units,
  divisors and the Picard group, and `ReductiveCommHopfAlgCat`, reductive affine group schemes **over a
  field** — so the group scheme over the curve that `Bun_G` needs still has to be built.

## RS-22 and the seven duplications

The accepted restructuring **RS-22** (review accepted) covers this roadmap and **keeps all eight layers**,
giving in each case the reason why the overlapping layer of another roadmap is not a substitute. The audit
records seven duplications; this packet follows RS-22 exactly.

| layer | duplicate recorded by AUDIT-20 | what this packet does |
| --- | --- | --- |
| GS.0 | `BunGAndNewtonStrata:BG2:uniformization` | plans the global-curve bundle stack; BG2 is over a different curve |
| GS.1 | `GeometricSatakeAndFusion:GS2` and `GS0` | imports the Satake category, the fusion product and the dual group **by node identifier**; plans the equal-characteristic statement over powers of `X` |
| GS.2 | `DrinfeldModulesAndTModules:DM.7`, `HeckeStacksAndLocalShtukas:HS2` | imports DM.7's elliptic sheaves as an optional realisation; HS2 is a different, local, moduli problem |
| GS.3 | `FunctionFieldArithmetic:FA.6` | requests the cusp-form space; plans the cohomological side |
| GS.4 | `ExcursionOperatorsAndSpectralAction:ES0`, `VStackSheavesAndLisseCategories:VS1` | plans the classical scheme statement; VS1 is a different divisor-and-local-Weil theorem |
| GS.5 | `ExcursionOperatorsAndSpectralAction:ES0` and `ES5` | **plans the global construction**: the ES0 and ES5 packets already file requests to `GS.5` for exactly these statements |
| GS.6 | `FunctionFieldArithmetic:FA.4` | imports FA.4 as the rank-one case |
| GS.7 | `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic` | imports it, as RS-22 prescribes |

The GS.5 row is worth spelling out. `ExcursionOperatorsAndSpectralAction--ES0.json` and `--ES5.json`, written
earlier in this programme, each carry a `requests` entry whose supplier is
`GlobalShtukasAndFunctionFieldLanglands:GS.5` and whose text says that the audit records the two as
duplicates and that PROTOCOL.md section 15 requires the shared construction to be planned once. This packet
plans it. The two roadmaps are now consistent and the excursion operators over a function field are planned
in exactly one place.

## Layers

---

## GS.0. Global G-bundles and level structures

**Coverage: partial.** 9 nodes.

Nine nodes cover the objects the layer names: Bun_G with its Artin-stack structure and the finiteness of the automorphism groups of F_q-points, level structures as a torsor under the Weil restriction of G along N, the deformation complex with the smoothness and dimension of Bun_G, the Harder-Narasimhan truncations, the central lattice Xi, Weil uniformization with the ker^1 correction for nonsplit groups, cuspidal automorphic forms with the constant terms and the finite dimensionality, nonsplit descent, and the GL_1 case with the Picard scheme and the Lang isogeny. The reviewed audit AUDIT-20 records every target of this layer as absent except the descent data, which it records as partial.

**Planets (5):** *Bun_G of the global curve*, *Level structure*, *Harder-Narasimhan truncation*, *Weil uniformization*, *Cuspidal automorphic forms*.

### `bun-g-of-the-global-curve`

*construction* — **The stack of G-bundles on the global curve** · planet **Bun_G of the global curve**

**Statement.** Let X be a smooth projective geometrically irreducible curve over a finite field F_q with function field F, and let G be a connected reductive group over F together with a chosen smooth affine group scheme model over X. Bun_G is the Artin stack over F_q whose groupoid of S-points, for S a scheme over F_q, classifies G-bundles over X x S. It is locally the quotient of a smooth algebraic variety by a smooth algebraic group, by Grothendieck's Quot construction, and the automorphism groups of its points are algebraic groups of finite type; the automorphism groups of the F_q-points are finite. Neither library has a moduli stack of G-bundles, and neither has an algebraic-stack formalism in which to define one: Mathlib's stack notion is the descent condition for a pseudofunctor on a site, with no representability or atlas theory.

**Hypotheses and conventions.**

- G is a connected reductive group over F; the stack is formed from a chosen smooth affine group scheme over X extending it, and the choice matters at the finitely many places where G is ramified.
- A G-bundle over X x S means a scheme over X x S with a simply transitive action of G on the fibres; for G = GL_r this is the same as a vector bundle of rank r.
- The Artin-stack structure is not a formality: it needs an atlas and the representability of the diagonal, neither of which exists in the pinned libraries.

**Proof outline.**

1. Define the prestack sending S to the groupoid of G-bundles over X x S, with pullback along S' -> S.
2. Prove it is a stack for the fppf topology, using faithfully flat descent for torsors under a smooth affine group scheme.
3. Produce an atlas: locally on Bun_G exhibit the stack as the quotient of a smooth quasiprojective variety by a smooth algebraic group, via the Quot construction applied to bundles with a level structure at a large enough divisor.
4. Prove that the automorphism group of a point is an affine algebraic group of finite type, and that for an F_q-point it is finite.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.BunG` | data | The stack of G-bundles on X, as a stack over F_q. |
| `FunctionField.BunG.ofBundle` | constructor | A G-bundle over X x S determines an S-point. |
| `FunctionField.BunG.isStack` | instance | Bun_G satisfies fppf descent. |
| `FunctionField.BunG.atlas` | structure | A smooth surjective map from a scheme, exhibiting Bun_G as an Artin stack. |
| `FunctionField.BunG.aut_finiteType` | characterisation | Automorphism groups of points are affine algebraic groups of finite type. |
| `FunctionField.BunG.aut_finite_of_fqPoint` | characterisation | Automorphism groups of F_q-points are finite. |
| `FunctionField.BunG.glOne` | compatibility | For G = GL_1 the stack is Pic quotiented by the trivial G_m-action. |
| `FunctionField.BunG.functorial` | functoriality | A morphism of group schemes over X induces a morphism of stacks. |

**Where and how it is used.**

- *V. Lafforgue, Definition 0.6 and the ICM survey section 7.* The stack of shtukas is the intersection of a Hecke stack, seen as a correspondence from Bun_{G,N} to itself, with the graph of the Frobenius morphism of Bun_{G,N}; both factors are built from this stack.
- *V. Lafforgue, Remark 0.5 and (0.5).* Cht_{N,I,1}/Xi is the constant stack G(F)\G(A)/K_N, which is how the cohomology in the empty-leg case is identified with the space of automorphic forms.
- *GS.1 and GS.2.* The Hecke stacks and the truncations Cht^{<= mu} are defined by conditions on the Harder-Narasimhan polygon of a point of Bun_G.

**Unit tests.**

- `gl_one` — For G = GL_1 the isomorphism classes of F_q-points are Pic(F_q); a construction that does not reproduce the Picard group is wrong.
- `trivial_bundle` — The trivial G-bundle is an F_q-point with automorphism group G(F_q), which is finite (the degenerate case).
- `not_quasicompact` — Bun_G is not quasicompact and Bun_G(F_q) is infinite unless G is a torus, so no finiteness may be built into the definition (a non-example).
- `descent` — A G-bundle given by descent data along an fppf cover of X x S is an S-point, matching the pinned DescentData API.

**Acceptance.**

- For G = GL_1, Bun_{GL_1} is the quotient of the relative Picard scheme Pic of X over F_q by the trivial action of G_m; Pic^0 is the Jacobian, an abelian variety over F_q.
- Bun_G(F_q) is a groupoid with finite automorphism groups; its set of isomorphism classes is the object automorphic forms are functions on.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme`, `mathlib:CategoryTheory.Pseudofunctor.IsStack`, `mathlib:CategoryTheory.Pseudofunctor.DescentData`, `mathlib:CategoryTheory.Groupoid`, `tauceti:TauCeti.ReductiveCommHopfAlgCat`, `SchemeAndStackFoundations:SF.0`

**Sources.**

- Section 2, Remark 2.1, p. 7 — “It is the groupoid of points over F_q of the Artin stack Bun_G over F_q whose groupoid of S-points (with S a scheme over F_q) classifies the G-bundles over X x S. Examples of Artin stacks are given by the quotients of algebraic varieties by algebraic groups.” *(The definition of the object this node constructs.)*
- Section 2, Remark 2.1, p. 7 — “The Quot construction of Grothendieck implies that Bun_G is an Artin stack (locally it is even the quotient of a smooth algebraic variety by a smooth algebraic group). The automorphisms groups of points in the groupoid Bun_G(F_q) are finite.” *(The two facts about Bun_G that everything later uses.)*

### `level-structures`

*definition* — **Level structures on G-bundles** · planet **Level structure**

**Statement.** Let N be a finite closed subscheme of X, called a level. Bun_{G,N} is the stack whose S-points classify a G-bundle G over X x S together with a trivialisation psi of its restriction to N x S. The forgetful map Bun_{G,N} -> Bun_G is a G(O_N)-torsor, where O_N is the ring of functions on N. On F_q-points, Bun_{G,N}(F_q) is the double quotient G(F)\G(A)/K_N with K_N the kernel of G(O) -> G(O_N), when G is split.

**Hypotheses and conventions.**

- N is a finite closed subscheme, not merely a finite set of places: the level is allowed to be nonreduced, which is what gives deeper congruence subgroups.
- The trivialisation is over N x S, so it is a section of the restricted torsor, and a morphism of bundles with level structure must respect it.

**Proof outline.**

1. Define the stack Bun_{G,N} by the stated moduli problem and check descent.
2. Prove that forgetting psi is a torsor under the Weil restriction of G along N, that is, under the smooth affine group scheme G(O_N) over F_q.
3. Prove that Bun_{G,N} -> Bun_G is representable, smooth and surjective, so that Bun_{G,N} is again an Artin stack.
4. Prove the compatibility with the adelic description, which is the uniformization node.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.BunG.level` | data | The stack Bun_{G,N} of G-bundles with a trivialisation along N. |
| `FunctionField.BunG.level.forget` | data | The forgetful morphism to Bun_G. |
| `FunctionField.BunG.level_isTorsor` | characterisation | The forgetful morphism is a torsor under the Weil restriction of G along N. |
| `FunctionField.BunG.level_smooth` | structure | The forgetful morphism is representable, smooth and surjective. |
| `FunctionField.BunG.level_empty` | compatibility | For N empty the two stacks agree. |
| `FunctionField.BunG.level_mono` | functoriality | For N' containing N there is a smooth surjective morphism Bun_{G,N'} -> Bun_{G,N}. |
| `FunctionField.BunG.level_adelic` | equivalence | On F_q-points, Bun_{G,N}(F_q) = G(F)\G(A)/K_N for split G. |

**Where and how it is used.**

- *V. Lafforgue, Definition 0.6.* Every shtuka carries compatible level structures on the intermediate bundles, and the modifications are required to respect them.
- *V. Lafforgue, Theorem 0.1.* The main decomposition is stated for cuspidal functions on G(F)\G(A)/K_N and the Langlands parameters are unramified outside N.
- *GS.3 and GS.5.* The Hecke algebra C_c(K_N \ G(A) / K_N, E) acts on the cohomology of shtuka stacks with level N, and the excursion operators are endomorphisms of Hecke-modules.

**Unit tests.**

- `empty_level` — For N empty, Bun_{G,N} = Bun_G (the degenerate case).
- `torsor` — The fibre of Bun_{G,N} -> Bun_G over a point is a G(O_N)-torsor; a definition giving a different group is wrong.
- `gl_r_congruence` — For G = GL_r and N a point of degree one, K_N is the standard principal congruence subgroup, and Bun_{G,N}(F_q) is the corresponding adelic double quotient.
- `nonreduced_level` — A nonreduced N gives a strictly finer level than its reduction, so the definition must not silently replace N by its reduction (a non-example).

**Acceptance.**

- For N empty, Bun_{G,N} = Bun_G. For G = GL_r and N a reduced point of degree one, K_N is the standard congruence subgroup of level one at that place.
- The shtuka stacks are defined over (X minus N)^I, so the legs are required to avoid the level, which is what makes the situation one of good reduction.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme`, `mathlib:CategoryTheory.Pseudofunctor.IsStack`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/bun-g-of-the-global-curve`, `SchemeAndStackFoundations:SF.0`

**Sources.**

- Section 0, Definition 0.6, p. 6 — “for i in {0, ..., k-1}, (G_i, psi_i) is in Bun_{G,N}(S), that is G_i is a G-torsor over X x S and psi_i is a trivialisation of G_i restricted to N x S over N x S.” *(The definition of a bundle with level structure, as used throughout the construction of shtukas.)*
- Section 8, formula (8.9), p. 20 — “We denote by Bun_{G,N}(F_q) the set of isomorphism classes of G-bundles over X trivialized on N. If G is split we have Bun_{G,N}(F_q) = G(F)\G(A)/K_N, where A is the ring of adeles, O the ring of integral adeles, O_N the ring of functions on N and K_N = Ker(G(O) -> G(O_N)).” *(The adelic description, which is the reason level structures are introduced.)*

### `deformation-complex-and-smoothness`

*construction* — **The deformation complex of a G-bundle and the smoothness of Bun_G**

**Statement.** For a G-bundle G on X, the adjoint bundle ad(G) is the vector bundle associated with the adjoint representation of G. The deformation theory of G is governed by the cohomology of ad(G) on X: the tangent space is H^1(X, ad(G)), the obstruction space is H^2(X, ad(G)), which vanishes since X is a curve, and the automorphisms are H^0(X, ad(G)). Consequently Bun_G is smooth, of dimension minus the Euler characteristic of ad(G), that is (g - 1) dim G for G semisimple over a curve of genus g. Neither library has a cotangent complex for stacks and neither has Lie-algebra-valued cohomology of a bundle on a curve.

**Hypotheses and conventions.**

- The vanishing of H^2 uses that X is a curve, so the statement is genuinely one-dimensional.
- For G reductive but not semisimple, the dimension formula picks up the contribution of the centre, and the correct statement is in terms of the Euler characteristic of ad(G).

**Proof outline.**

1. Construct ad(G) as the vector bundle associated with G and the adjoint representation of the group scheme over X.
2. Prove that the groupoid of deformations of G over a square-zero extension is controlled by the two-term complex computing H^i(X, ad(G)), that is, exhibit the deformation complex.
3. Deduce that Bun_G is smooth because H^2(X, ad(G)) = 0 for a curve, and compute its dimension as minus the Euler characteristic of ad(G).
4. Record the version with level structures: the deformation complex of Bun_{G,N} is the complex of ad(G) twisted down by N.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.adjointBundle` | data | The adjoint vector bundle ad(G) of a G-bundle on X. |
| `FunctionField.deformationComplex` | data | The two-term complex computing the deformations of a G-bundle. |
| `FunctionField.deformation_tangent` | characterisation | The tangent space of Bun_G at G is H^1(X, ad(G)). |
| `FunctionField.deformation_obstruction_vanishes` | characterisation | H^2(X, ad(G)) = 0 because X is a curve. |
| `FunctionField.BunG.smooth` | structure | Bun_G is smooth. |
| `FunctionField.BunG.dim` | characterisation | Its dimension is minus the Euler characteristic of ad(G). |
| `FunctionField.deformation_level` | compatibility | With a level N the complex is the one for ad(G) twisted by minus N. |
| `FunctionField.frobenius_derivative_zero` | relation | The derivative of the Frobenius morphism of Bun_G vanishes. |

**Where and how it is used.**

- *V. Lafforgue, Proposition 2.8.* The smoothness of the local model map from the shtuka stack to the bounded Beilinson-Drinfeld Grassmannian quotient is proved from the vanishing of the derivative of Frobenius on Bun_G.
- *GS.2.* The intersection complex of a truncated shtuka stack is the pullback of a Satake sheaf exactly because that map is smooth of the computed dimension.
- *GS.6.* The dimension 2r - 2 of the rank-r shtuka variety over the product of two copies of the curve is the corresponding computation for GL_r.

**Unit tests.**

- `gl_r_dimension` — For G = GL_r the dimension of Bun_G is r^2(g-1), which is negative for g = 0 and matches the stacky count.
- `torus` — For G a torus the adjoint bundle is trivial of rank dim G and Bun_G is smooth of dimension (g-1) dim G (the degenerate case).
- `frobenius_derivative` — The derivative of the Frobenius morphism of Bun_G is zero; a construction in which it is not is wrong.
- `h2_vanishes` — H^2(X, ad(G)) = 0; the same statement for a surface is false, so the curve hypothesis is not decorative (a non-example).

**Acceptance.**

- For G = GL_r the deformation complex is the cohomology of End(E) for E the corresponding vector bundle, and dim Bun_{GL_r} = r^2(g-1).
- The smoothness of Bun_G is what makes the local model map of GS.2 smooth and is the reason the intersection complexes there are computable.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme`, `mathlib:CategoryTheory.Sheaf.cohomologyPresheaf`, `mathlib:LieAlgebra.IsSemisimple`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/bun-g-of-the-global-curve`, `SchemeAndStackFoundations:SF.2`

**Sources.**

- Section 2, Remark 2.1, p. 7 — “The Quot construction of Grothendieck implies that Bun_G is an Artin stack (locally it is even the quotient of a smooth algebraic variety by a smooth algebraic group).” *(The local description from which smoothness is deduced; the deformation-theoretic proof is the one this node plans.)*
- Section 0, discussion after (0.12), p. 8 — “One shows in proposition 2.8 that the morphism (0.12) is smooth of dimension dim G_{sum n_i x_i} = (sum_{i in I} n_i) dim G; the idea is the following: it suffices to show it in the case where N is empty and then this results easily from the fact that the Frobenius morphism of Bun_G has zero derivative.” *(The place where the deformation theory of Bun_G is used, and the statement that the derivative of Frobenius vanishes.)*

### `harder-narasimhan-truncations`

*theorem* — **Harder-Narasimhan polygons and bounded open substacks of finite type** · planet **Harder-Narasimhan truncation**

**Statement.** For a G-bundle G on X one attaches the Harder-Narasimhan polygon of the associated G^ad-bundle, a concave polygon with values in the coweight lattice of G^ad. For a dominant coweight mu of G^ad the condition that the polygon is at most mu defines an open substack Bun_G^{<= mu}, and these exhaust Bun_G. Modulo the action of a chosen lattice Xi inside Z(F)\Z(A) of finite index, the quotient Bun_G^{<= mu}/Xi is an algebraic stack of finite type. A grep of both pinned libraries for Harder-Narasimhan and for semistability finds nothing relevant, so slopes and HN filtrations of bundles do not exist there.

**Hypotheses and conventions.**

- The truncation is by the polygon of the G^ad-bundle, not of G itself; this is what makes the condition invariant under twisting by the centre.
- The lattice Xi has to be chosen; the quotient by Xi is what makes the truncations of finite type, and it is preserved by the truncations.

**Proof outline.**

1. Construct the HN filtration of a G-bundle: the canonical reduction to a parabolic subgroup, and the associated polygon.
2. Prove that the polygon is upper semicontinuous in families, so the condition polygon at most mu is open.
3. Prove that Bun_G^{<= mu} is quasicompact, hence of finite type once the centre is quotiented out.
4. Prove that the union of the Bun_G^{<= mu} over dominant mu is all of Bun_G.

**Acceptance.**

- For G = GL_r the polygon is the usual HN polygon of a vector bundle and the truncation is by slopes.
- The truncations are what make the cohomology of shtuka stacks defined at all: the cohomology of Cht itself is of infinite dimension.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.CartierDivisor`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/bun-g-of-the-global-curve`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/automorphisms-and-the-central-lattice`, `SchemeAndStackFoundations:SF.2`

**Sources.**

- Section 0, after Definition 0.2, p. 4 — “For every dominant coweight mu of G^ad one denotes by Cht^{(I), <= mu}_{N,I,W} the open substack of Cht^{(I)}_{N,I,W} defined by the condition that the Harder-Narasimhan polygon of G (or rather, to be precise, of the associated G^ad-torsor) is at most mu. One fixes a lattice Xi inside Z(F)\Z(A). One will show that Cht^{(I), <= mu}_{N,I,W}/Xi is a Deligne-Mumford stack of finite type.” *(The exact form of the truncation, including the G^ad correction and the quotient by Xi.)*
- Section 0, Definition 0.6, p. 6 — “Moreover one denotes by Cht^{(I_1,...,I_k), <= mu}_{N,I,W} the open substack of Cht^{(I_1,...,I_k)}_{N,I,W} defined by the condition that the Harder-Narasimhan polygon of G_0 is at most mu.” *(The version for a factorised shtuka, which is what makes the forgetful map an isomorphism on truncations.)*

### `automorphisms-and-the-central-lattice`

*theorem* — **Automorphism groups, the central lattice Xi, and the quotient**

**Statement.** The automorphism group of an F_q-point of Bun_G is finite. Let Z be the centre of G. One fixes a subgroup Xi of finite index in Bun_Z(F_q), equivalently a lattice Xi inside Z(F)\Z(A); when Z is finite one may take Xi trivial. Then Xi acts on Bun_G and on the shtuka stacks by twisting, preserves the Harder-Narasimhan truncations, and the quotient Bun_G(F_q)/Xi is still infinite unless G is a torus. Finite dimensionality is obtained only after restricting to cuspidal functions.

**Hypotheses and conventions.**

- The finiteness of automorphism groups is a statement about F_q-points, not about geometric points of Bun_G in general.
- Xi is a choice; every later statement carries it, and the notation usually suppresses it.

**Proof outline.**

1. Prove that the automorphism group of a G-bundle over X defined over F_q is the group of F_q-points of an affine algebraic group of finite type, and that it is finite.
2. Construct the action of Bun_Z(F_q) on Bun_G by twisting, and check that it preserves the HN truncations since twisting by a central bundle changes the associated G^ad-bundle not at all.
3. Choose Xi of finite index and record the quotient stack Bun_G^{<= mu}/Xi.
4. Record that the quotient Bun_G(F_q)/Xi is still infinite except for tori.

**Acceptance.**

- For G a torus, Bun_G(F_q)/Xi is finite, which is the case in which the whole theory reduces to class field theory.
- For G = GL_r the group Xi may be taken to be a^Z for an idele a of degree one, which is the choice L. Lafforgue makes.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/bun-g-of-the-global-curve`, `SchemeAndStackFoundations:SF.0`

**Sources.**

- Section 0, before (0.1), p. 2 — “One fixes a lattice Xi inside Z(F)\Z(A) (where Z is the centre of G).” *(The choice that every statement of the paper carries.)*
- Section 2, after Remark 2.1, p. 7 — “From now on we fix a subgroup Xi of finite index in Bun_Z(F_q) (for example the trivial subgroup if Z is finite) and we consider functions on Bun_G(F_q)/Xi. However, except when G is a torus, Bun_G(F_q)/Xi is still infinite.” *(The precise statement of what the quotient does and does not achieve.)*

### `weil-uniformization`

*theorem* — **Weil uniformization: the adelic description of the F_q-points** · planet **Weil uniformization**

**Statement.** Let G be split. Then the set of isomorphism classes of G-bundles on X trivialised along N is the double quotient G(F)\G(A)/K_N, where A is the ring of adeles of F, O the ring of integral adeles, O_N the ring of functions on N and K_N the kernel of G(O) -> G(O_N). For G not necessarily split the right-hand side must be replaced by a direct sum, indexed by the finite pointed set ker^1(F, G) of everywhere-locally-trivial torsor classes, of adelic double quotients for the inner forms of G. There is no adele ring of a function field in either library.

**Hypotheses and conventions.**

- Splitness is used for the single-quotient statement; the general statement is the ker^1 sum, and the audit and the paper both insist on it.
- The statement is about isomorphism classes; the groupoid structure is recorded separately by the finiteness of automorphism groups.

**Proof outline.**

1. Construct the adele ring A of F as the restricted product of the completions F_v with respect to the O_v, and the integral adeles O.
2. Prove Weil uniformization: a G-bundle on X is trivial over the generic point after a finite extension and trivial over the formal neighbourhood of each place, so it is glued from an element of G(A) modulo G(F) on the left and G(O) on the right.
3. Insert the level: the trivialisation along N cuts the right quotient down to K_N.
4. In the nonsplit case, the set of G-bundles that are everywhere locally trivial is ker^1(F, G), and the fibres of the classifying map are the adelic quotients of the corresponding inner forms.

**Acceptance.**

- For G = GL_1 the statement is Pic(F_q) = F^x \ A^x / O^x, the idele class description of the Picard group, which is one half of class field theory for function fields.
- For G = GL_r with N of degree one the statement recovers the classical adelic description of vector bundles with level structure.

**Prerequisites.** `mathlib:NumberField.AdeleRing`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.CartierDivisor`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/bun-g-of-the-global-curve`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/level-structures`, `FunctionFieldArithmetic:FA.1`, `FunctionFieldArithmetic:FA.4`

**Sources.**

- Section 8, after Theorem 8.4, p. 20 — “If G is split we have Bun_{G,N}(F_q) = G(F)\G(A)/K_N. When G is non necessarily split the right-hand side must be replaced by a direct sum, indexed by the finite group ker^1(F, G), of adelic quotients for inner forms of G, and in the definition of global Langlands parameters we must replace the dual group by the L-group.” *(The statement of the node, including the nonsplit correction.)*
- Section 0, after (0.5), p. 5 — “One uses here the hypothesis that G is split; in general Bun_{G,N}(F_q) is a finite union of adelic quotients for inner forms of G, as will be seen in chapter 12.” *(The same warning in the main paper.)*

### `cuspidal-automorphic-forms`

*definition* — **Automorphic forms, constant terms and the cuspidal subspace** · planet **Cuspidal automorphic forms**

**Statement.** For a field E containing Q, C_c(Bun_{G,N}(F_q)/Xi, E) is the E-vector space of finitely supported functions. For a proper parabolic subgroup P of G with Levi quotient M and unipotent radical U, the constant term along P is the map to functions on Bun_M(F_q)/Xi given by the correspondence Bun_G <- Bun_P -> Bun_M, which involves only finite sums; adelically it is the integral of f(ug) over U(F)\U(A). The cuspidal subspace C^cusp_c is the intersection of the kernels of all constant terms, and it is finite dimensional. It carries an action of the Hecke algebra C_c(K_N\G(A)/K_N, E). There are no automorphic forms over a function field in either library.

**Hypotheses and conventions.**

- Finite dimensionality of the cuspidal subspace is a theorem, not part of the definition.
- E is any field containing Q; for the Langlands correspondence one works with E a finite extension of Q_ell or with an algebraic closure, because continuous Galois representations with complex coefficients have finite image.

**Proof outline.**

1. Define C_c(Bun_{G,N}(F_q)/Xi, E) and the Hecke module structure, with the convention that the characteristic function of K_N is the unit.
2. Define the constant term along a parabolic through the correspondence of stacks Bun_G <- Bun_P -> Bun_M and check that it is a finite sum.
3. Define the cuspidal subspace as the intersection of the kernels of all constant terms for proper parabolics.
4. Prove that the cuspidal subspace is finite dimensional, using the description of the support of a constant term as contained in a translate of a cone in a free finitely generated Z-module.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.automorphicForms` | data | The space C_c(Bun_{G,N}(F_q)/Xi, E) of finitely supported functions. |
| `FunctionField.constantTerm` | data | The constant term along a parabolic subgroup, as a map to functions on Bun_M. |
| `FunctionField.constantTerm_finiteSum` | characterisation | The constant term is a finite sum, so it is defined without any convergence hypothesis. |
| `FunctionField.cuspidal` | data | The cuspidal subspace, the intersection of the kernels of the constant terms for proper parabolics. |
| `FunctionField.cuspidal_finiteDimensional` | structure | The cuspidal subspace is finite dimensional. |
| `FunctionField.cuspidal_heckeModule` | instance | It is a module over the Hecke algebra C_c(K_N\G(A)/K_N, E). |
| `FunctionField.cuspidal_torus` | compatibility | For a torus every function is cuspidal. |
| `FunctionField.cuspidal_coefficients` | compatibility | The construction is compatible with extension of the coefficient field E. |

**Where and how it is used.**

- *V. Lafforgue, Theorem 0.1.* The main theorem is a decomposition of exactly this space, indexed by global Langlands parameters.
- *V. Lafforgue, Proposition 0.28 c) and Proposition 8.23.* The Hecke-finite part of the space of all automorphic forms is exactly the cuspidal subspace, which is how the cohomological and the classical definitions are matched.
- *GS.6.* The Langlands correspondence for GL_r is a bijection between cuspidal automorphic representations with central character of finite order and irreducible ell-adic Galois representations with determinant of finite order.

**Unit tests.**

- `torus` — For a torus the cuspidal subspace is the whole space, which is finite dimensional (the degenerate case).
- `gl_two_constant_term` — For GL_2 there is one proper parabolic up to conjugacy and cuspidality is the vanishing of a single constant term.
- `finite_dimensional` — The cuspidal subspace is finite dimensional while the ambient space is not, unless G is a torus (the non-example that makes the restriction necessary).
- `hecke_stable` — The cuspidal subspace is stable under all Hecke operators; a definition that is not is wrong.

**Acceptance.**

- For G a torus there is no proper parabolic and every function is cuspidal; the space is finite dimensional because Bun_T(F_q)/Xi is finite.
- For G = GL_r the parabolic subgroups are conjugate to block upper triangular subgroups and the Levi quotients are block diagonal.

**Prerequisites.** `mathlib:NumberField.AdeleRing`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/weil-uniformization`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/level-structures`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/automorphisms-and-the-central-lattice`, `FunctionFieldArithmetic:FA.6`

**Sources.**

- Section 2, p. 7 — “It is defined as the intersection of the kernel of all constant term morphisms C_c(Bun_G(F_q)/Xi, E) -> C(Bun_M(F_q)/Xi, E) (which are given by the correspondence Bun_G(F_q) <- Bun_P(F_q) -> Bun_M(F_q) and involve only finite sums), for all proper parabolic subgroups P of G with associated Levi quotient M.” *(The definition of cuspidality used here.)*
- Section 0, p. 2 — “A function f in C_c(G(F)\G(A)/K_N, E) is called cuspidal if for every parabolic P of G, with Levi M and unipotent radical U, the constant term f_P sending g to the integral over U(F)\U(A) of f(ug) is zero as a function on U(A) M(F) \ G(A) / K_N. We recall that the E-vector space of cuspidal automorphic forms is finite dimensional.” *(The adelic form of the definition and the finite dimensionality.)*

### `nonsplit-descent-and-inner-forms`

*theorem* — **Descent data for nonsplit groups, inner forms and the ramified places**

**Statement.** Let G be a connected reductive group over F, not assumed split. The G-bundle theory above is developed by Galois descent from a splitting field, retaining the finitely many ramified places where the chosen smooth model is not reductive. The set of G-bundles on X that are everywhere locally trivial is the finite pointed set ker^1(F, G), and the adelic description becomes a direct sum over ker^1(F, G) of double quotients for the corresponding inner forms of G. General faithfully flat descent for modules and the fpqc and etale topologies are available in the pinned libraries, and Tau Ceti has faithfully flat descent for points of affine group schemes and builds nonsplit tori from Galois lattices by Galois descent; what is absent is the descent of bundles and of the Satake data through the L-group.

**Hypotheses and conventions.**

- ker^1(F, G) is finite; this finiteness is what makes the direct sum a finite one.
- The ramified places are those where the chosen smooth affine model over X is not reductive; the theory is developed relative to a fixed model and the dependence must be tracked.

**Proof outline.**

1. Fix a finite Galois extension F' of F splitting G and a smooth affine model over the corresponding curve.
2. Prove Galois descent for G-bundles along X' -> X, using faithfully flat descent for torsors under a smooth affine group scheme.
3. Identify the everywhere-locally-trivial classes with ker^1(F, G) and prove that it is finite.
4. Deduce the direct sum description of Bun_{G,N}(F_q) over ker^1(F, G) in terms of inner forms.

**Acceptance.**

- For G split, ker^1(F, G) is trivial and the direct sum has one term.
- For G a nonsplit torus, the theory reduces to Galois descent from a lattice with Galois action, which is what Tau Ceti already does for tori.

**Prerequisites.** `mathlib:CategoryTheory.Pseudofunctor.DescentData`, `mathlib:CategoryTheory.Pseudofunctor.IsStack`, `tauceti:TauCeti.ReductiveCommHopfAlgCat`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/weil-uniformization`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/bun-g-of-the-global-curve`, `FunctionFieldArithmetic:FA.1`

**Sources.**

- Section 0, p. 3 — “In chapter 12 one treats the case of reductive groups that are not necessarily split and one proves theorem 12.3 which is similar to the theorem above, except that the left-hand side is replaced by a direct sum indexed by ker^1(F, G) of spaces of cuspidal automorphic forms for inner forms of G, and the Langlands parameters sigma are defined with the help of the L-group.” *(The statement of the nonsplit case and where it is proved.)*
- Section 8, after Theorem 8.4, p. 20 — “When G is non necessarily split the right-hand side of (8.9) must be replaced by a direct sum, indexed by the finite group ker^1(F, G), of adelic quotients for inner forms of G.” *(The same statement in the survey.)*

### `picard-and-the-gl1-case`

*application* — **The GL_1 case: the Picard scheme, the Lang isogeny and class field theory**

**Statement.** For G = GL_1 the stack Bun_{GL_1} is the quotient of the relative Picard scheme Pic of X over F_q by the trivial action of G_m, and Pic^0, the kernel of the degree map, is the Jacobian of X, an abelian variety over F_q. Unramified class field theory states that there is a canonical isomorphism from the fibre product of the abelianized fundamental group of X with Z over the profinite completion of Z to Pic(F_q), characterised by sending Frob_v to the class of O(v). The Lang isogeny L from Pic to Pic^0, sending the class of a line bundle E to the class of E^{-1} tensor the Frobenius pullback of E, is surjective with kernel Pic(F_q); this is the geometric construction behind the isomorphism and the rank-one case of the whole theory.

**Hypotheses and conventions.**

- This layer only records the GL_1 case as the acceptance test of the general theory; the reciprocity isomorphism itself is FunctionFieldArithmetic:FA.4's.
- Tau Ceti has Pic^0 and the degree exact sequence as abelian groups, but not the Picard stack with its degree decomposition.

**Proof outline.**

1. Construct Pic as the relative Picard scheme, and Pic^0 as the kernel of the degree map.
2. Construct the Lang isogeny and prove that it is surjective with kernel Pic(F_q).
3. For a finite family (n_i) with sum zero, form the Abel-Jacobi map from X^I to Pic^0 and pull back the Lang isogeny; the result is a Galois covering of X^I with group Pic(F_q) carrying partial Frobenius morphisms, and it is the shtuka scheme in the GL_1 case.
4. Apply Drinfeld's lemma to get a morphism from the I-fold product of the fundamental group to Pic(F_q)/a^Z, and characterise the character sigma(chi) by the compatibility with the exterior product of its powers.

**Acceptance.**

- The characterisation of the isomorphism by Frob_v mapsto O(v) is the unramified reciprocity law.
- For a split torus T the same construction with T-bundles gives the Langlands correspondence for T through the dual torus, and it is the particular case for tori of the Satake compatibility.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.CartierDivisor`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.principalCartierDivisor`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/bun-g-of-the-global-curve`, `FunctionFieldArithmetic:FA.4`

**Sources.**

- Section 3, pp. 8-9 — “Class field theory states that there is a canonical isomorphism from pi_1(X, eta bar)^ab times_{Z hat} Z to Pic(F_q), characterized by the fact that for any place v of X, it sends Frob_v to the class of O(v), where O(v) is the line bundle on X whose sections are the functions on X with a possible pole of order at most 1 at v.” *(The rank-one statement this application records.)*
- Section 3, p. 8 — “The Lang isogeny L from Pic to Pic^0 is such that, for any scheme S over F_q and every line bundle E on X x S, the class of E is sent by L to the class of E^{-1} tensor the Frobenius pullback of E. The Lang isogeny is surjective and its kernel is Pic(F_q).” *(The geometric construction which is the GL_1 shtuka scheme.)*

**What remains in GS.0.**

- The algebraic-stack formalism itself: an atlas, the representability of the diagonal and the Quot construction are needed to make Bun_G an Artin stack, and neither library has any of it. SchemeAndStackFoundations:SF.0 and SF.2 are requested for it.
- The adele ring of a function field, requested from FunctionFieldArithmetic:FA.1; Weil uniformization is stated against it.
- The finiteness of ker^1(F, G) and the classification of inner forms, which the nonsplit descent node needs and which is requested from FunctionFieldArithmetic:FA.1.
- Harder-Narasimhan filtrations and slopes of G-bundles: a grep of both pinned libraries finds nothing, so the entire theory has to be built.

---

## GS.1. Global Hecke stacks and classical geometric Satake

**Coverage: partial.** 9 nodes.

Nine nodes cover the Beilinson-Drinfeld Grassmannian in both its descriptions, the closed strata with the Zariski-closure convention the roadmap text demands, the smallness of the forgetful map, the global Hecke stacks with the local model map, the Satake functor with its four compatibilities as Theorem 0.9 states them, the modified commutativity constraint with the half-Tate twist, the triviality of the central action, the unramified Hecke algebra with the classical Satake isomorphism, and the nonsplit descent through the L-group. The audit records GeometricSatakeAndFusion:GS0 and GS2 as duplicates of this layer; RS-22 keeps GS.1 because the equal-characteristic classical statement over powers of the global curve is not obtained from the Fargues-Fontaine one by a change of notation, and the packet imports the Satake category and the dual group from those packets by node identifier.

**Planets (4):** *Beilinson-Drinfeld Grassmannian*, *Global Hecke stack*, *Geometric Satake functor*, *Modified commutativity constraint*.

### `beilinson-drinfeld-grassmannian`

*construction* — **The Beilinson-Drinfeld Grassmannian over powers of the curve** · planet **Beilinson-Drinfeld Grassmannian**

**Statement.** For a finite set I and an ordered partition (I_1, ..., I_k) of I, the Beilinson-Drinfeld Grassmannian Gr^{(I_1,...,I_k)}_I is the ind-scheme over X^I whose S-points classify legs (x_i), a chain of G-torsors G_0 -> G_1 -> ... -> G_k over X x S with the j-th modification an isomorphism away from the graphs of the x_i for i in I_j, and a trivialisation theta of G_k. Equivalently the torsors may be taken on the formal neighbourhood of the union of the graphs, and then the Weil restriction G_{sum infinity x_i} of G along that neighbourhood acts by changing theta. Mathlib's Module.Grassmannian is the functor of rank-n quotients of a module, the finite-dimensional Grassmannian; there is no loop group, no affine Grassmannian and nothing over powers of a curve.

**Hypotheses and conventions.**

- The two descriptions, global and formal, give the same ind-scheme; the second is what makes the Weil-restriction action visible and is used for the Satake sheaves.
- Over the open locus of X^I where the x_i are pairwise distinct the Grassmannian is a product of usual affine Grassmannians; this factorisation is the source of the fusion product.

**Proof outline.**

1. Define the functor by the global description and prove that it is an ind-scheme over X^I, ind-proper over the bounded strata.
2. Construct the comparison with the formal description and prove that it is an isomorphism, using that a torsor on X x S trivial away from the graphs is determined by its restriction to the formal neighbourhood together with the trivialisation.
3. Construct the Weil restriction group schemes G_{sum n_i x_i} for a family of integers n_i and prove that they are smooth of dimension (sum n_i) dim G, and that G_{sum infinity x_i} acts through G_{sum n_i x_i} on bounded strata for n_i large.
4. Prove the factorisation over the locus of pairwise distinct legs.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.BDGrassmannian` | data | The ind-scheme Gr^{(I_1,...,I_k)}_I over X^I. |
| `FunctionField.BDGrassmannian.ofChain` | constructor | A chain of torsors with a trivialisation determines an S-point. |
| `FunctionField.BDGrassmannian.formalDescription` | equivalence | The comparison with the description by torsors on the formal neighbourhood of the legs. |
| `FunctionField.BDGrassmannian.weilRestriction` | data | The smooth group scheme G_{sum n_i x_i} over S, of dimension (sum n_i) dim G. |
| `FunctionField.BDGrassmannian.action` | structure | The action of the Weil restriction by change of trivialisation, factoring through a finite level on bounded strata. |
| `FunctionField.BDGrassmannian.factorisation` | characterisation | Over the locus where the legs are pairwise distinct, Gr is the product of the Grassmannians of the individual legs. |
| `FunctionField.BDGrassmannian.forget` | functoriality | The map to the coarse partition that composes the modifications. |
| `FunctionField.BDGrassmannian.diagonal` | compatibility | For a map of finite sets, the restriction along the diagonal X^J -> X^I. |

**Where and how it is used.**

- *V. Lafforgue, (0.11), (0.12) and Proposition 2.8.* The shtuka stack maps smoothly to the quotient of a bounded stratum by the Weil restriction group scheme; this is the local model of the whole theory.
- *V. Lafforgue, Theorem 0.9.* The Satake perverse sheaves are constructed on this ind-scheme, and the fusion and convolution compatibilities are statements about its factorisation and its forgetful maps.
- *GeometricSatakeAndFusion:GS0.* The same geometric input is constructed there for the Fargues-Fontaine and Witt-vector settings; this layer builds the classical equal-characteristic version over powers of the global curve.

**Unit tests.**

- `affine_grassmannian` — For I a singleton and the leg fixed at a point, the fibre is the usual affine Grassmannian G(k((z)))/G(k[[z]]).
- `factorisation` — Over the locus of pairwise distinct legs the Grassmannian for I is the product over i of the Grassmannians for singletons; a construction without this factorisation cannot produce the fusion product.
- `diagonal_restriction` — The restriction along the diagonal X -> X^I is the convolution Grassmannian for the corresponding partition (the degenerate case).
- `not_finite_dimensional` — The Beilinson-Drinfeld Grassmannian is an ind-scheme and not a scheme; Mathlib's finite-dimensional Module.Grassmannian is a different object (the required non-example).

**Acceptance.**

- For I a singleton and X a point the construction is the usual affine Grassmannian G(k((z)))/G(k[[z]]).
- The forgetting-intermediate-modifications map to the coarse partition is proper and, on bounded strata, small.

**Prerequisites.** `mathlib:Module.Grassmannian`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:CategoryTheory.Limits.HasPullbacks`, `tauceti:TauCeti.ReductiveCommHopfAlgCat`, `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `SchemeAndStackFoundations:SF.0`

**Sources.**

- Section 0, Definition 0.7, p. 7 — “The Beilinson-Drinfeld affine Grassmannian is the ind-scheme Gr^{(I_1,...,I_k)}_I over X^I whose S-points classify the data of (x_i), a chain G_0 -> G_1 -> ... -> G_k of G-torsors over X x S, where phi_i is an isomorphism over (X x S) minus the union of the graphs for i in I_j, and theta is a trivialisation of G_k.” *(The global description, verbatim.)*
- Section 0, after Definition 0.7, p. 7 — “Gr^{(I_1,...,I_k)}_I can also be defined as the ind-scheme whose S-points classify the same data with the G_i torsors on the formal neighbourhood of the union of the graphs of the x_i in X x S. The Weil restriction of G from that formal neighbourhood to S therefore acts on Gr by changing the trivialisation theta.” *(The formal description and the group action, which the Satake sheaves are equivariant for.)*

### `bounded-strata-and-schubert-bounds`

*definition* — **Closed strata cut out by dominant coweights**

**Statement.** Let W = box-product of W_i be an irreducible representation of the I-fold product of the dual group, with highest weights omega_i. The closed stratum Gr^{(I_1,...,I_k)}_{I,W} is the reduced closed subscheme of Gr^{(I_1,...,I_k)}_I defined by the condition that the relative position of G_{j-1} with respect to G_j at x_i, for i in I_j, is bounded by the dominant coweight of G corresponding to omega_i. Over the open locus of pairwise distinct legs this is the product of the usual closed Schubert strata; in general the stratum is defined as the Zariski closure of that restriction. For a reducible W, Gr_{I,W} is the union of the strata of the irreducible constituents.

**Hypotheses and conventions.**

- The Zariski-closure definition is not a convenience: the naive condition on relative positions is not closed in the family as legs collide, and taking the closure is what makes the bounded stratum flat over X^I.
- The correspondence between dominant weights of the dual group and dominant coweights of G is the one fixed by the choice of a pinning.

**Proof outline.**

1. Define, over the open locus of pairwise distinct legs, the product of the usual closed Schubert strata for the coweights corresponding to the omega_i.
2. Define the stratum in general as the Zariski closure inside Gr^{(I_1,...,I_k)}_I of that restriction, with its reduced structure.
3. Prove that the stratum is ind-proper over X^I, and that the action of the Weil restriction factors through a finite level.
4. Extend to reducible W by taking the union over the irreducible constituents.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.BDGrassmannian.stratum` | data | The closed stratum Gr_{I,W} attached to a representation W of the I-fold product of the dual group. |
| `FunctionField.BDGrassmannian.stratum_reduced` | structure | The stratum is reduced by definition. |
| `FunctionField.BDGrassmannian.stratum_closure` | characterisation | It is the Zariski closure of the product of the usual closed strata over the locus of pairwise distinct legs. |
| `FunctionField.BDGrassmannian.stratum_proper` | structure | The stratum is ind-proper, indeed proper, over X^I. |
| `FunctionField.BDGrassmannian.stratum_union` | constructor | For reducible W the stratum is the union over the irreducible constituents. |
| `FunctionField.BDGrassmannian.stratum_action_level` | compatibility | For n_i large the action of the Weil restriction on the stratum factors through G_{sum n_i x_i}. |
| `FunctionField.BDGrassmannian.stratum_minuscule_smooth` | example | For W minuscule the stratum is smooth and the corresponding orbit is closed. |

**Where and how it is used.**

- *V. Lafforgue, Definition 0.2 and Remark 0.8.* The bound on a shtuka is defined as the inverse image of the bounded stratum under the local model map, which is the cleanest way to state the boundedness condition.
- *V. Lafforgue, Theorem 0.9 d).* For irreducible W the Satake sheaf is the intersection complex of the bounded stratum.
- *V. Lafforgue, Proposition 0.16.* The proof that the Hecke operator is the creation-Frobenius-annihilation composite is carried out first in the minuscule case, where the stratum is smooth.

**Unit tests.**

- `minuscule` — For W minuscule the stratum is smooth and the intersection complex is the shifted constant sheaf (the degenerate case).
- `gl_r_standard` — For GL_r and the standard representation, the stratum classifies modifications with elementary divisors bounded by the first fundamental coweight.
- `closure_is_needed` — The naive relative-position condition is not closed as two legs collide, so a definition that omits the Zariski closure gives a nonflat family (the required non-example).
- `reducible` — For W the sum of two irreducibles, the stratum is the union of the two strata, matching the definition on the open locus.

**Acceptance.**

- For G = GL_r, I a singleton and W the standard representation, the bounded stratum is the closed Schubert cell of minuscule coweight, which is smooth and proper.
- For a nonminuscule coweight the stratum is singular, which is why the intersection complex and not the constant sheaf appears.

**Prerequisites.** `mathlib:RootPairing`, `mathlib:RootPairing.flip`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/beilinson-drinfeld-grassmannian`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `GeometricSatakeAndFusion:GS4:integral-dual-group/dual-group-identification`

**Sources.**

- Section 0, Definition 0.7, p. 7 — “The closed stratum Gr^{(I_1,...,I_k)}_{I,W} is the reduced closed subscheme of Gr^{(I_1,...,I_k)}_I defined by the condition that the relative position of G_{j-1} with respect to G_j at x_i (for i in I_j) is bounded by the dominant coweight of G corresponding to the dominant weight omega_i of W_i.” *(The definition of the bound.)*
- Section 0, Definition 0.7, p. 7 — “More precisely above the open subset U of X^I where the x_i are pairwise distinct, Gr is a product of usual affine Grassmannians and one defines the restriction of Gr_{I,W} above U as the product of the usual closed strata; then one defines Gr_{I,W} as the Zariski closure in Gr of its restriction above U.” *(The Zariski-closure prescription, which the roadmap text and the audit both demand be kept.)*

### `forgetting-intermediate-modifications-is-small`

*theorem* — **The forgetful map between bounded strata is small**

**Statement.** The morphism from Gr^{(I_1,...,I_k)}_{I,W} to Gr^{(I)}_{I,W} that composes the successive modifications is proper and small. Consequently the direct image of the intersection complex of the source is the intersection complex of the target, and the corresponding statement for the shtuka stacks follows, so that the cohomology sheaves defined using any ordered partition of I agree with those defined using the coarse partition.

**Hypotheses and conventions.**

- Smallness is with respect to the relative perverse normalisation over X^I; it is the standard fact behind the convolution description of the Satake category.
- The inverse image of the truncated shtuka stack under the forgetful map is exactly the truncated stack for the finer partition, because the truncation is by the Harder-Narasimhan polygon of G_0 alone.

**Proof outline.**

1. Prove that the convolution map on Grassmannians is proper, being a composition of proper maps between ind-proper strata.
2. Prove smallness by the standard dimension estimate on the fibres over the strata of the target.
3. Deduce that the direct image of the intersection complex is the intersection complex.
4. Transport to shtukas: the forgetful map Cht^{(I_1,...,I_k)}_{N,I,W} -> Cht^{(I)}_{N,I,W} is small because the local model maps are smooth and the inverse image of the truncation is the truncation.

**Acceptance.**

- This is what makes Definition 0.4 and Definition 0.11 agree and makes the cohomology sheaves independent of the partition.
- It is also what allows the partial Frobenius morphisms, which only exist on the finer stacks, to act on the cohomology defined by the coarse one.

**Prerequisites.** `mathlib:CategoryTheory.Sheaf.cohomologyPresheaf`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/bounded-strata-and-schubert-bounds`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/beilinson-drinfeld-grassmannian`, `EtaleDualityAndPerverseSheaves:EDC.4`, `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-preserves-satake-and-dualizability`

**Sources.**

- Section 0, after (0.13), p. 8 — “One deduces that the forgetful morphism of the intermediate modifications, which sends (0.8) to the composite, is small. Indeed it is known that the analogous morphism Gr^{(I_1,...,I_k)}_{I,W} -> Gr^{(I)}_{I,W} sending (0.10) to the composite is small.” *(The statement and the reduction to the Grassmannian.)*
- Section 0, after (0.13), p. 8 — “The inverse image of Cht^{(I), <= mu}_{N,I,W} by (0.13) is exactly Cht^{(I_1,...,I_k), <= mu}_{N,I,W} since the truncations were defined using the Harder-Narasimhan polygon of G_0. One therefore has the same cohomology sheaf for every partition of I.” *(The compatibility with truncations, which is why the conclusion transports to shtukas.)*

### `global-hecke-stacks-and-convolution`

*construction* — **Global Hecke stacks, convolution and the local model map** · planet **Global Hecke stack**

**Statement.** The global Hecke stack Hecke_I classifies a point of X^I and a modification of G-bundles at the legs; it is a correspondence between Bun_G and Bun_G times X^I, with the two maps remembering the source and the target bundle. Its factorised version Hecke^{(I_1,...,I_k)}_I records a chain of modifications, and composing them is the convolution map. There is a natural formally smooth morphism from Hecke_I to the quotient of the Beilinson-Drinfeld Grassmannian by the Weil restriction group scheme, which is the local model map; for shtukas it becomes the map (0.12), which is smooth of dimension (sum n_i) dim G. Bounded Hecke stacks are the inverse images of the bounded strata.

**Hypotheses and conventions.**

- Formal smoothness of the local model map is what lets the Satake sheaves be pulled back; its smoothness in the shtuka case is Proposition 2.8 and rests on the vanishing of the derivative of Frobenius.
- The local model map does not factor through the quotient by the central lattice Xi; only its composition with the further quotient by the centre does, which is Remark 0.10 and the reason the sheaves are taken G^ad-equivariant.

**Proof outline.**

1. Define Hecke^{(I_1,...,I_k)}_I as the stack of chains of modifications of G-bundles at the legs, with the two projections to Bun_G.
2. Define the bounded Hecke stacks as the inverse images of the bounded strata under the local model map.
3. Construct the local model map by restricting the bundles to the formal neighbourhood of the legs and forgetting everything else, and prove that it is formally smooth.
4. Construct the convolution map that composes the modifications, and prove the collision and factorisation statements: over the locus of pairwise distinct legs the Hecke stack factors as a product, and over the diagonal it is the convolution.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.HeckeStack` | data | The stack Hecke^{(I_1,...,I_k)}_I of chains of modifications of G-bundles at the legs. |
| `FunctionField.HeckeStack.source` | data | The projection remembering the source bundle. |
| `FunctionField.HeckeStack.target` | data | The projection remembering the target bundle and the legs. |
| `FunctionField.HeckeStack.localModel` | data | The formally smooth morphism to the quotient of the Beilinson-Drinfeld Grassmannian by the Weil restriction group scheme. |
| `FunctionField.HeckeStack.bounded` | constructor | The bounded Hecke stack, the inverse image of the bounded stratum. |
| `FunctionField.HeckeStack.convolution` | structure | The convolution map composing the modifications, compatible with the forgetful map of Grassmannians. |
| `FunctionField.HeckeStack.factorisation` | characterisation | Over the locus of pairwise distinct legs the Hecke stack is the product of the one-leg Hecke stacks. |
| `FunctionField.HeckeStack.collision` | compatibility | Over the diagonal the Hecke stack is the convolution of the one-leg Hecke stacks. |
| `FunctionField.HeckeStack.notFactoringThroughXi` | relation | The local model map does not factor through the quotient by the central lattice, only its composition with the quotient by the centre does. |

**Where and how it is used.**

- *V. Lafforgue, Definition 0.6 and Remark 0.3.* The shtuka stack is the Hecke stack intersected with the graph of Frobenius, so the Hecke stack must exist first.
- *V. Lafforgue, (0.7) and Corollary 6.5.* The Hecke operators on the cohomology of shtuka stacks are induced by Hecke correspondences between shtuka stacks, which are built from these.
- *GS.3.* The identification of the Hecke operator with the creation-Frobenius-annihilation composite is an identity of cohomological correspondences supported on the Hecke correspondence Gamma^{(I)}.

**Unit tests.**

- `classical_hecke` — For I a singleton, a place v and a minuscule coweight, the bounded Hecke stack is the classical correspondence of modifications at v of relative position lambda.
- `identity` — For W trivial the Hecke stack is Bun_G times X^I and both projections are the identity on the bundle (the degenerate case).
- `frobenius_graph` — Intersecting with the graph of the Frobenius morphism of Bun_{G,N} gives the shtuka stack; a construction for which this fails is wrong.
- `no_xi_factorisation` — The local model map does not descend to the quotient by the central lattice Xi, so a construction that assumes it does is wrong (the required non-example).

**Acceptance.**

- Remark 0.3: Cht^{(I)}_{N,I,W} is the intersection of a Hecke stack, viewed as a correspondence from Bun_{G,N} to itself, with the graph of the Frobenius morphism of Bun_{G,N}. This is the conceptual definition of a shtuka.
- For I a singleton and W minuscule the bounded Hecke stack is the classical Hecke correspondence H_{v,lambda} of modifications of relative position lambda.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/bun-g-of-the-global-curve`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/level-structures`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/beilinson-drinfeld-grassmannian`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/bounded-strata-and-schubert-bounds`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/deformation-complex-and-smoothness`, `HeckeStacksAndLocalShtukas:HS0/global-hecke-correspondence`

**Sources.**

- Section 0, Remark 0.3, p. 4 — “Readers who know the geometric Langlands program will note that Cht^{(I)}_{N,I,W} is the intersection of a Hecke stack, considered as a correspondence between Bun_{G,N} and itself, with the graph of the Frobenius morphism of Bun_{G,N}.” *(The conceptual description of the shtuka stack as a Hecke stack intersected with the Frobenius graph.)*
- Section 0, (0.11), (0.12) and Remark 0.8, pp. 7-8 — “One has a natural morphism from Cht^{(I_1,...,I_k)}_{N,I,W} to Gr^{(I_1,...,I_k)}_{I,W} modulo the Weil restriction, associating with a shtuka the torsor G_k on the formal neighbourhood. The best way to state the condition on relative positions in definition 0.6 is to define Cht as the inverse image of the bounded stratum under this morphism.” *(The local model map and the clean form of the boundedness condition.)*

### `geometric-satake-functor`

*theorem* — **One direction of the classical equal-characteristic geometric Satake equivalence** · planet **Geometric Satake functor**

**Statement.** For every finite set I and every ordered partition (I_1, ..., I_k) there is an E-linear functor W mapsto S^{(I_1,...,I_k)}_{I,W,E} from finite dimensional E-linear representations of the I-fold product of the dual group to G-equivariant perverse E-sheaves on Gr^{(I_1,...,I_k)}_I, for the perverse normalisation relative to X^I. Each S_{I,W,E} is supported on the bounded stratum Gr_{I,W} and is universally locally acyclic relative to X^I. The functor satisfies: a) compatibility with the forgetful maps, so the sheaf for the coarse partition is the direct image of the one for a finer partition; b) compatibility with convolution; c) compatibility with fusion, that is, a canonical isomorphism between the restriction along a diagonal and the sheaf for the composed representation, functorial in W and compatible with composition; d) for irreducible W the sheaf is the intersection complex of the bounded stratum.

**Hypotheses and conventions.**

- Only one direction of the geometric Satake equivalence is used: the functor from representations of the dual group to perverse sheaves. The Tannakian reconstruction of the dual group is not needed here and belongs to GeometricSatakeAndFusion.
- The functoriality in W is stronger than knowing the isomorphism class of the sheaf for each irreducible W, and it is exactly what makes the later constructions canonical.
- The fibre functor is total cohomology; for that to be tensor-valued in vector spaces rather than super vector spaces the commutativity constraint must be modified and a half-Tate twist inserted.

**Proof outline.**

1. Construct the Satake category of G(k[[z]])-equivariant perverse sheaves on the affine Grassmannian with the fusion product and the total-cohomology fibre functor.
2. Transport it to the Beilinson-Drinfeld setting, using that the perverse sheaves are equivariant for the automorphisms of k[[z]] so that the formal disc may be allowed to move along the curve.
3. Construct the functor W mapsto S_{I,W,E} and prove a), b), c), d) by the corresponding statements for the fusion product and for convolution.
4. Prove universal local acyclicity relative to X^I for the constructed sheaves.

**Acceptance.**

- Total cohomology of S^{(I_1,...,I_k)}_{I,W,E} in the fibres of Gr over X^I is W itself, with the sign and Tate-twist conventions recorded separately.
- For W trivial the sheaf is the skyscraper at the base point, and for W minuscule it is the shifted constant sheaf on a smooth proper stratum.

**Prerequisites.** `mathlib:RootPairing`, `mathlib:AlgebraicGeometry.Scheme.ellAdicSheaf`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/bounded-strata-and-schubert-bounds`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/forgetting-intermediate-modifications-is-small`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS4:integral-dual-group/dual-group-identification`, `EtaleDualityAndPerverseSheaves:EDC.4`

**Sources.**

- Section 0, Theorem 0.9, p. 11 — “One has for every finite set I and every partition (I_1, ..., I_k) an E-linear functor W mapsto S^{(I_1,...,I_k)}_{I,W,E} from the category of finite dimensional E-linear representations of the I-fold product of the dual group to the category of G-equivariant perverse E-sheaves on Gr^{(I_1,...,I_k)}_I. Moreover S is supported on Gr_{I,W} and universally locally acyclic relative to X^I.” *(The statement of the node.)*
- Section 0, Theorem 0.9 c) and d), pp. 11-12 — “One then has a canonical isomorphism from the restriction along the diagonal of S_{I,W,E} to S_{J,W_zeta,E}, functorial in W and compatible with composition for zeta. When W is irreducible, the perverse sheaf S_{I,W,E} on Gr_{I,W} is isomorphic to the intersection complex (with the perverse normalisation relative to X^I).” *(The fusion compatibility and the identification with the intersection complex.)*

### `modified-commutativity-and-tate-twist`

*theorem* — **The modified commutativity constraint and the half-Tate-twist normalisation** · planet **Modified commutativity constraint**

**Statement.** The tensor structure on the Satake category is given by the fusion product, and the fibre functor by total cohomology. With the naive commutativity constraint the fibre functor takes values in super vector spaces; one therefore modifies the sign rule, so that the constraint is the one obtained if every intersection complex for irreducible W were normalised to sit in even cohomological degree at the generic point of its stratum. To be canonical one also twists by E(i/2) in cohomological degree i, which requires a square root of q in the coefficient field. With these conventions the fibre functor is tensor with values in vector spaces and the category is equivalent to finite dimensional representations of the dual group with its canonical pinning.

**Hypotheses and conventions.**

- The existence of a square root of q in E is a hypothesis, not a convention: E is taken to be a finite extension of Q_ell containing one.
- The modified constraint changes the resulting group by at most the twist by the central element of the dual group determined by the sum of the positive coroots, which is why the pinning has to be tracked.

**Proof outline.**

1. Record the fusion product and the total cohomology fibre functor.
2. Compute the parity of the cohomology of the intersection complex of a stratum at its generic point and record the resulting normalisation.
3. Define the modified commutativity constraint by that normalisation and prove that the fibre functor becomes tensor with values in vector spaces.
4. Insert the half-Tate twist so that the equivalence is canonical, and record the canonical pinning of the dual group.

**Acceptance.**

- Without the modification the fibre functor lands in super vector spaces and the reconstructed group is a Z/2-extension; this is the standard subtlety.
- The half-Tate twist is what makes the Hecke operator appear with the factor q^{-d/2} in the proof of Proposition 0.16.

**Prerequisites.** `mathlib:RootPairing`, `mathlib:RootPairing.flip`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/geometric-satake-functor`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS4:integral-dual-group/chevalley-involution`, `DeligneWeightsAndPurity:DWP.0`

**Sources.**

- Section 0, before Theorem 0.9, p. 10 — “As is explained, one modifies a little the sign rule in the commutativity constraint so that the fibre functor is tensor with values in the category of vector spaces (and not of super vector spaces). To be more canonical one must moreover introduce a Tate twist, that is tensor by E(i/2) the part of cohomological degree i for every i.” *(The two normalisations.)*
- Section 0, after Theorem 0.9, p. 12 — “The modified commutativity constraint is the one that one would obtain naturally if all the intersection sheaves S_{I,W,E} for W irreducible were normalised, from the point of view of the cohomological degree modulo 2, to be in even cohomological degree at the generic point.” *(The precise description of the modification.)*

### `centre-acts-trivially-on-satake-sheaves`

*lemma* — **The centre acts trivially, so the Satake sheaves are equivariant for the adjoint group**

**Statement.** The Weil restriction of the centre Z of G along the formal neighbourhood of the legs acts trivially on the Beilinson-Drinfeld Grassmannian, and therefore, by the identification of the Satake sheaves with intersection complexes, on all the sheaves S^{(I_1,...,I_k)}_{I,W}. Consequently these sheaves may be considered, up to a shift, as perverse sheaves equivariant for the Weil restriction of the adjoint group G^ad, or equivalently as perverse sheaves on the quotient of the bounded stratum by the Weil restriction of G^ad at a finite level.

**Hypotheses and conventions.**

- This is what makes the local model map usable after quotienting the shtuka stack by the central lattice Xi: the map (0.12) does not factor through that quotient, but its composition with the forgetful map to the G^ad-quotient does.
- The statement is about the action on the Grassmannian, not about the action of the centre on representations of the dual group.

**Proof outline.**

1. Observe that a central automorphism of the trivialisation theta changes the point of the Grassmannian not at all, because the modifications are unchanged.
2. Deduce that the sheaves, being intersection complexes of strata, are equivariant for the quotient group.
3. Record the resulting factorisation (0.20) of the local model map through the quotient of the shtuka stack by Xi.

**Acceptance.**

- Remark 0.10 and the discussion around (0.20) are exactly this statement and its use.
- It is the reason Definition 0.11 can define the perverse sheaf on the quotient Cht/Xi and not only on Cht.

**Prerequisites.** `mathlib:RootPairing`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/geometric-satake-functor`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/global-hecke-stacks-and-convolution`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/automorphisms-and-the-central-lattice`

**Sources.**

- Section 0, Remark 0.10, p. 12 — “In the previous theorem the Weil restriction of Z acts trivially on Gr^{(I_1,...,I_k)}_I and therefore, by d), on all the sheaves S^{(I_1,...,I_k)}_{I,W}. One may therefore consider S as a perverse sheaf (up to a shift) equivariant for the Weil restriction of G^ad.” *(The statement of the node, verbatim.)*
- Section 0, before Definition 0.11, p. 12 — “The morphism (0.12) does not factor through the quotient by Xi (as an anonymous referee pointed out to me), but this is the case for its composition with the forgetful morphism to the quotient by the Weil restriction of G^ad.” *(The use, and the correction the referee forced.)*

### `unramified-hecke-algebra-and-satake-isomorphism`

*theorem* — **The unramified Hecke algebra and the classical Satake isomorphism**

**Statement.** For a place v of X the spherical, or unramified, Hecke algebra H_v is the convolution algebra C_c(G(O_v)\G(F_v)/G(O_v), E), and it acts on the cuspidal automorphic forms. The Hecke operator T_{lambda,v} attached to a dominant coweight lambda is pullback and pushforward along the Hecke correspondence of modifications at v of relative position lambda. The classical Satake isomorphism is a canonical isomorphism from the Grothendieck ring of finite dimensional representations of the dual group to H_v, sending a class V to an element h_{V,v} with h_{V + V'} = h_V + h_{V'} and h_{V tensor V'} = h_V h_{V'}; for irreducible V, h_{V,v} is a combination of the T_{lambda,v} for lambda a weight of V. The algebras H_v for distinct v commute.

**Hypotheses and conventions.**

- The normalisation of the isomorphism involves the half sum of positive roots and the square root of q, which is why E is assumed to contain one.
- Two nonconjugate global parameters can give the same characters of all H_v, so the Hecke algebras do not in general determine the decomposition; this is the Blasius and Lapid phenomenon that forces excursion operators with more than two legs.

**Proof outline.**

1. Define H_v as the convolution algebra of compactly supported bi-invariant functions, with the characteristic function of G(O_v) as the unit.
2. Define T_{lambda,v} through the Hecke correspondence and prove that it agrees with convolution by the characteristic function of the double coset of lambda.
3. Prove the Satake isomorphism from the Grothendieck ring of representations of the dual group, in the normalisation with the half-Tate twist.
4. Prove that the actions of H_v for distinct places commute.

**Acceptance.**

- For G = GL_r and lambda the first fundamental coweight, T_{lambda,v} is the classical Hecke operator at v.
- For G a torus the Satake isomorphism is the identification of the group algebra of the cocharacter lattice with the characters of the dual torus.

**Prerequisites.** `mathlib:RootPairing`, `mathlib:RootPairing.flip`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/cuspidal-automorphic-forms`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/global-hecke-stacks-and-convolution`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/modified-commutativity-and-tate-twist`, `GeometricSatakeAndFusion:GS4:classical-Satake-comparison`, `FunctionFieldArithmetic:FA.6`

**Sources.**

- Section 5, pp. 10-11 — “These operators form an abstract commutative algebra H_v, the so-called spherical (or unramified) Hecke algebra at v, and this algebra acts on the cuspidal automorphic forms. This algebra H_v is equal to C_c(G(O_v)\G(F_v)/G(O_v), Q_ell). The actions of these algebras H_v for different v commute with each other.” *(The algebra and the commutation.)*
- Section 5, p. 10 — “The Satake isomorphism is a canonical isomorphism from the Grothendieck ring of representations of the dual group to the unramified Hecke algebra H_v, namely we have h_{V + V'} = h_V + h_{V'} and h_{V tensor V'} = h_V h_{V'}. If V is an irreducible representation, h_{V,v} is a combination of the T_{lambda,v} for lambda a weight of V.” *(The Satake isomorphism in the form used to state the compatibility of the main theorem.)*

### `nonsplit-satake-descent-via-the-l-group`

*theorem* — **Descent of the Satake data for a nonsplit group through the L-group**

**Statement.** For G connected reductive but not split, the dual group carries an action of the Galois group of a splitting extension, and the relevant object is the L-group, the semidirect product of the dual group with that Galois group. The Satake category and the sheaves S_{I,W} are obtained by Galois descent from a splitting extension, the representations W being representations of the I-fold product of the L-group; the Satake isomorphism at an unramified place is then an isomorphism onto the unramified Hecke algebra of the quasisplit inner form. There is no dual group and no L-group in either library.

**Hypotheses and conventions.**

- The descent is along a finite Galois extension splitting G, and the ramified places have to be kept: at a place where the chosen model is not reductive there is no unramified Hecke algebra and no Satake isomorphism.
- Global Langlands parameters in the nonsplit case are morphisms to the L-group whose composition with the projection to the Galois group is the identity, which is the projection condition the roadmap text insists on.

**Proof outline.**

1. Construct the action of the Galois group on the dual group determined by the based root datum of G with its Galois action.
2. Construct the L-group as the semidirect product and define representations of its I-fold product.
3. Prove that the Satake functor descends: the sheaves for a split form, together with their Galois equivariance data, give sheaves for G.
4. Prove the unramified Satake isomorphism for the quasisplit inner form and record the places where it does not apply.

**Acceptance.**

- For G split the L-group is the product of the dual group with the Galois group and everything reduces to the split case.
- For a nonsplit torus the construction is the Galois lattice description that Tau Ceti already has for tori.

**Prerequisites.** `mathlib:RootPairing`, `mathlib:RootPairing.flip`, `mathlib:ProfiniteGrp`, `tauceti:TauCeti.ReductiveCommHopfAlgCat`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/geometric-satake-functor`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/nonsplit-descent-and-inner-forms`, `GeometricSatakeAndFusion:GS4:integral-dual-group/dual-group-identification`

**Sources.**

- Section 8, after Theorem 8.4, p. 20 — “When G is non necessarily split the right-hand side of (8.9) must be replaced by a direct sum, indexed by the finite group ker^1(F, G), of adelic quotients for inner forms of G, and in the definition of global Langlands parameters we must replace the dual group by the L-group.” *(The role of the L-group in the nonsplit case.)*
- Section 0, p. 3 — “In chapter 12 one treats the case of reductive groups that are not necessarily split and one proves theorem 12.3, and the Langlands parameters sigma are defined with the help of the L-group. Sections 12.1 and 12.2, which may be read as a complement to this introduction, contain the statements in the nonsplit case.” *(Where the nonsplit statements are proved.)*

**What remains in GS.1.**

- The Tannakian half of the geometric Satake equivalence, that is the reconstruction of the dual group from the Satake category, is not planned here: only the functor from representations to perverse sheaves is used and it is imported from GeometricSatakeAndFusion.
- Perverse sheaves themselves, the relative perverse t-structure over X^I, universal local acyclicity and intersection complexes are absent from both libraries and are requested from EtaleDualityAndPerverseSheaves:EDC.4.
- The smallness of the convolution map is quoted from the literature by the source and is stated here without a proof read from it.
- The descent of the Satake data through the L-group for a nonsplit group is stated and not proved; the source treats it in chapter 12, which was not read.

---

## GS.2. Shtuka stacks, modifications and truncations

**Coverage: partial.** 8 nodes.

Eight nodes cover the multi-leg shtuka stacks with the direction of the Frobenius modification fixed, the truncations and their finite type, the smoothness of the local model map, the cohomology sheaves with their functoriality in W and independence of the partition, the partial Frobenius morphisms with the commutation and product rules, the coalescence isomorphisms, the Hecke correspondences, and the elliptic-sheaf realisation imported from DM.7. The audit records HeckeStacksAndLocalShtukas:HS2 as a duplicate; RS-22 keeps GS.2 because HS2 is a different, local, moduli problem.

**Planets (5):** *Global shtuka*, *Cohomology sheaves of shtuka stacks*, *Partial Frobenius*, *Coalescence of legs*, *Hecke correspondences on shtukas*.

### `global-shtuka-stack`

*definition* — **Multi-leg global shtukas as successive Frobenius modifications** · planet **Global shtuka**

**Statement.** Fix a level N, a finite set I, an irreducible representation W = box-product of W_i of the I-fold product of the dual group, and an ordered partition (I_1, ..., I_k) of I. The stack Cht^{(I_1,...,I_k)}_{N,I,W} is the reduced Deligne-Mumford stack whose S-points classify legs x_i in (X minus N)(S), bundles with level structure (G_0, psi_0), ..., (G_{k-1}, psi_{k-1}) in Bun_{G,N}(S), with (G_k, psi_k) set to be the Frobenius twist (tau G_0, tau psi_0) where tau G denotes the pullback along Id_X times Frob_S, and isomorphisms phi_j from G_{j-1} to G_j away from the graphs of the x_i for i in I_j, bounded at x_i by the dominant coweight corresponding to the dominant weight of W_i, and compatible with the level structures. The direction of the modification is from G_0 to its Frobenius twist and not the other way. Neither library has a notion of bundle modification or of shtuka.

**Hypotheses and conventions.**

- The reducedness and the Zariski-closure convention are part of the definition: one demands that Cht be reduced and equal to the Zariski closure of its intersection with the open locus where the x_i are pairwise distinct, so that the boundedness condition is unambiguous.
- The legs are required to lie in X minus N, which is what puts the situation in good reduction relative to the level.
- The direction of phi, towards the Frobenius twist, is a convention that must be fixed once and kept: the opposite convention gives the dual theory.

**Proof outline.**

1. Define the ind-stack Cht^{(I_1,...,I_k)}_{N,I} with no condition on relative positions.
2. Define the bounded stack as the inverse image of the bounded stratum of the Beilinson-Drinfeld Grassmannian under the local model map, which is Remark 0.8's clean form of the condition.
3. Prove that it is a Deligne-Mumford stack: the automorphism groups of geometric points are finite because an automorphism commuting with phi is fixed by Frobenius.
4. Record that Cht^{(I)}_{N,I,W} is a G(O_N)-torsor over the restriction of Cht^{(I)}_{I,W} to (X minus N)^I.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.Shtuka` | data | The reduced Deligne-Mumford stack Cht^{(I_1,...,I_k)}_{N,I,W} of global shtukas. |
| `FunctionField.Shtuka.ofData` | constructor | Legs, a chain of bundles with level structure and bounded modifications to the Frobenius twist determine an S-point. |
| `FunctionField.Shtuka.legs` | projection | The morphism to (X minus N)^I remembering the legs. |
| `FunctionField.Shtuka.unbounded` | data | The ind-stack with no condition on relative positions. |
| `FunctionField.Shtuka.bounded_eq_preimage` | characterisation | The bounded stack is the inverse image of the bounded stratum under the local model map. |
| `FunctionField.Shtuka.isDeligneMumford` | structure | The automorphism groups of geometric points are finite. |
| `FunctionField.Shtuka.levelTorsor` | compatibility | Cht_{N,I,W} is a G(O_N)-torsor over the restriction of Cht_{I,W}. |
| `FunctionField.Shtuka.emptyLegs` | example | For I empty and W trivial the stack is the discrete stack Bun_{G,N}(F_q). |
| `FunctionField.Shtuka.heckeGraph` | relation | Cht is the intersection of the Hecke stack with the graph of the Frobenius morphism of Bun_{G,N}. |

**Where and how it is used.**

- *V. Lafforgue, Definition 0.4 and Definition 0.11.* The cohomology sheaves of the theory are the degree-zero pushforwards of intersection complexes on truncations of these stacks.
- *V. Lafforgue, (0.6) and section 0.4.* The partial Frobenius morphisms exist between the stacks for different orderings of the partition, which is why the factorised version is needed.
- *GS.6.* For GL_r the corresponding objects are Drinfeld's shtuka varieties, and L. Lafforgue's compactification is a compactification of exactly these.

**Unit tests.**

- `empty_legs` — For I empty and W trivial, Cht is the discrete stack Bun_{G,N}(F_q) (the degenerate case that identifies the cohomology with automorphic forms).
- `drinfeld_gl_r` — For GL_r, I of size two and W = St box St^*, the two partitions give Drinfeld's left and right shtukas.
- `direction_matters` — Reversing the direction of phi gives a different stack; a definition that does not fix the direction is wrong (the required non-example).
- `trivial_bound` — For W trivial the stack Cht_{N,I,1}/Xi is the constant stack G(F)\G(A)/K_N over (X minus N)^I.

**Acceptance.**

- Remark 0.3: Cht^{(I)}_{N,I,W} is the intersection of a Hecke stack with the graph of the Frobenius morphism of Bun_{G,N}.
- For G = GL_r, I = {1, 2} and W = St box St^*, the stacks for the two partitions are Drinfeld's stacks of left and right shtukas, x_1 and x_2 being the zero and the pole.
- For I empty and W trivial, Cht_{N, empty, 1} is the discrete stack Bun_{G,N}(F_q).

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme`, `mathlib:frobenius`, `mathlib:iterateFrobenius`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/bun-g-of-the-global-curve`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/level-structures`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/global-hecke-stacks-and-convolution`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/bounded-strata-and-schubert-bounds`, `SchemeAndStackFoundations:SF.0`

**Sources.**

- Section 0, Definition 0.2, p. 4 — “One defines Cht^{(I)}_{N,I,W} as the reduced Deligne-Mumford stack whose points over S classify points (x_i) in (X minus N)^I, a G-torsor G over X x S, an isomorphism phi from G to tau G away from the graphs of the x_i whose relative position at x_i is bounded by the coweight corresponding to omega_i, and a trivialisation of (G, phi) on N x S.” *(The one-step definition, verbatim, including the direction of phi.)*
- Section 0, Definition 0.2 and Definition 0.6, pp. 4 and 6 — “So that the condition bounding the relative positions is defined without ambiguity one demands that Cht^{(I)}_{N,I,W} be reduced and equal to the Zariski closure of its intersection with the open locus where the x_i are pairwise distinct.” *(The reducedness and closure convention that makes the bound well defined.)*

### `truncations-and-finite-type`

*theorem* — **Truncations by the Harder-Narasimhan polygon, and finite type**

**Statement.** For a dominant coweight mu of G^ad, Cht^{(I_1,...,I_k), <= mu}_{N,I,W} is the open substack where the Harder-Narasimhan polygon of G_0 is at most mu. The central lattice Xi acts by twisting and preserves these open substacks, and the quotient Cht^{(I_1,...,I_k), <= mu}_{N,I,W}/Xi is a Deligne-Mumford stack of finite type over (X minus N)^I; as soon as the degree of N is large enough as a function of mu it is even a scheme of finite type, so that only the etale cohomology of schemes is needed. The action of a partial Frobenius morphism or of a Hecke operator increases mu by a bounded amount.

**Hypotheses and conventions.**

- The truncation is by the polygon of G_0 only, which is what makes the forgetful map between partitions compatible with truncations.
- There is no truncation stable under both the partial Frobenius morphisms and the Hecke operators; this is the basic difficulty of the subject and the reason for the inductive limit over mu.

**Proof outline.**

1. Prove that the condition on the polygon of G_0 is open, by semicontinuity of the polygon in families.
2. Prove that Cht^{<= mu}/Xi is of finite type, using that the truncated Bun_G is of finite type and that the modifications are bounded.
3. Prove that for deg N large relative to mu the automorphism groups are trivial, so that the quotient is a scheme.
4. Prove that partial Frobenius and Hecke operators increase mu by an amount bounded in terms of W, respectively of W and the Hecke function.

**Acceptance.**

- The bound kappa in (0.6) and (0.7) is exactly this increase; every statement of the theory is stated as a morphism from the truncation at mu to the truncation at mu + kappa.
- L. Lafforgue's account of the GL_r case records the same phenomenon: there is no open substack of finite type in Cht^r_N/a^Z stable under Frob_infinity, Frob_0 or the Hecke algebra.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/global-shtuka-stack`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/harder-narasimhan-truncations`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/automorphisms-and-the-central-lattice`, `SchemeAndStackFoundations:SF.2`

**Sources.**

- Section 0, after Definition 0.2, p. 4 — “For every dominant coweight mu of G^ad one denotes by Cht^{(I), <= mu}_{N,I,W} the open substack defined by the condition that the Harder-Narasimhan polygon of G is at most mu. One will show that Cht^{(I), <= mu}_{N,I,W}/Xi is a Deligne-Mumford stack of finite type.” *(The statement of the node.)*
- Section 0, after Definition 0.4, p. 5 — “In the right-hand side the intersection sheaf has coefficients in E, and the etale cohomology of schemes would suffice: indeed, as soon as the degree of N is sufficiently large as a function of mu, Cht^{(I), <= mu}_{N,I,W}/Xi is a scheme of finite type.” *(The statement that only schemes are needed once the level is deep enough.)*

### `local-model-map-and-smoothness`

*theorem* — **The local model map is smooth of the expected dimension**

**Statement.** The morphism from Cht^{(I_1,...,I_k)}_{N,I,W} to the quotient of the bounded Beilinson-Drinfeld stratum by the Weil restriction group scheme G_{sum n_i x_i}, for integers n_i large enough as a function of W, is smooth of dimension (sum_{i in I} n_i) dim G. Consequently, composing with the forgetful map to the quotient by the adjoint Weil restriction, the map factors through the quotient by the central lattice Xi. This local model is not smooth as a map to a smooth target unless all the I_j are singletons and all the coweights are minuscule.

**Hypotheses and conventions.**

- The proof reduces to the case of empty level and then to the vanishing of the derivative of the Frobenius morphism of Bun_G.
- One must not conclude that the shtuka stack is smooth: the local model itself is singular in general, and that is why intersection complexes rather than constant sheaves appear.

**Proof outline.**

1. Reduce to the case where N is empty.
2. Observe that the map is the base change along the graph of Frobenius of the projection from the Hecke stack, and that the derivative of the Frobenius morphism of Bun_G vanishes.
3. Conclude smoothness and compute the dimension as that of the Weil restriction group scheme, which is (sum n_i) dim G.
4. Deduce the factorisation (0.20) through the quotient by Xi from the triviality of the central action on the Grassmannian.

**Acceptance.**

- Proposition 2.8 of the paper is exactly this statement.
- For all I_j singletons and all coweights minuscule the target is smooth and so is the shtuka stack; this is the case used in the elementary proof of Proposition 0.16.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/global-shtuka-stack`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/global-hecke-stacks-and-convolution`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/deformation-complex-and-smoothness`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/centre-acts-trivially-on-satake-sheaves`

**Sources.**

- Section 0, after (0.12), p. 8 — “One will show in proposition 2.8 that the morphism (0.12) is smooth of dimension dim G_{sum n_i x_i} = (sum_{i in I} n_i) dim G; the idea is the following: it suffices to show it in the case where N is empty and then this results easily from the fact that the Frobenius morphism of Bun_G has zero derivative.” *(The statement and the idea of the proof.)*
- Section 0, before Definition 0.7, p. 7 — “Readers familiar with Shimura varieties may consider this morphism as a local model, on condition of noting that one is in a situation of good reduction since the x_i belong to X minus N, and that nevertheless this local model is not smooth (except if all the I_j are singletons and all the coweights are minuscule).” *(The warning about the singularity of the local model.)*

### `cohomology-sheaves-of-shtuka-stacks`

*construction* — **The intersection complex on a shtuka stack and the cohomology sheaves** · planet **Cohomology sheaves of shtuka stacks**

**Statement.** For a partition (I_1, ..., I_k) of I one defines the perverse sheaf F^{(I_1,...,I_k)}_{N,I,W,Xi,E} on Cht^{(I_1,...,I_k)}_{N,I,W}/Xi, with the perverse normalisation relative to (X minus N)^I, as the inverse image of the Satake sheaf S^{(I_1,...,I_k)}_{I,W,E} under the local model map to the quotient by the adjoint Weil restriction. One then defines H^{0, <= mu, E}_{N,I,W} as the degree-zero part of the derived pushforward with compact supports of the restriction of that perverse sheaf to the truncation. The definition does not depend on the choice of partition, and for W irreducible the perverse sheaf is the intersection complex of the truncated quotient, so the construction refines and makes canonical the naive definition by intersection complexes.

**Hypotheses and conventions.**

- The functoriality in W is the whole point: the naive definition attaches a sheaf to each isomorphism class of irreducible W, whereas this one is a functor, which is what makes the coalescence isomorphisms canonical.
- The perverse normalisation is relative to (X minus N)^I, not absolute; every degree statement has to be read with that convention.

**Proof outline.**

1. Pull back the Satake sheaf along the map (0.20) to the quotient of the shtuka stack by Xi.
2. Define the cohomology sheaves as the degree-zero compactly supported pushforward along the leg map restricted to the truncation, and prove that this is a constructible E-sheaf on (X minus N)^I.
3. Prove the independence of the partition, using that the forgetful map is small and part a) of the Satake theorem.
4. Prove that for W irreducible the pulled-back sheaf is the intersection complex, using the smoothness of the local model map and the dimension computation.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.Shtuka.satakeSheaf` | data | The perverse sheaf F_{N,I,W,Xi,E} on the quotient of the shtuka stack by Xi, pulled back from the Satake sheaf. |
| `FunctionField.Shtuka.cohomologySheaf` | data | The constructible sheaf H^{0, <= mu, E}_{N,I,W} on (X minus N)^I. |
| `FunctionField.Shtuka.cohomologySheaf_functorial` | functoriality | W mapsto H^{0, <= mu, E}_{N,I,W} is an E-linear functor, with H(u) attached to a morphism u of representations. |
| `FunctionField.Shtuka.cohomologySheaf_partition_indep` | characterisation | The definition does not depend on the chosen ordered partition of I. |
| `FunctionField.Shtuka.satakeSheaf_irreducible` | compatibility | For W irreducible the perverse sheaf is the intersection complex of the truncated quotient. |
| `FunctionField.Shtuka.cohomologySheaf_empty` | example | For I empty and W trivial the limit over mu is the space of automorphic forms of level N. |
| `FunctionField.Shtuka.cohomologySheaf_constructible` | structure | Each H^{0, <= mu, E}_{N,I,W} is a constructible E-sheaf on (X minus N)^I. |
| `FunctionField.Shtuka.transition` | structure | The transition maps of the inductive system in mu. |

**Where and how it is used.**

- *V. Lafforgue, (0.6), (0.7) and section 0.3.* The partial Frobenius morphisms and the Hecke operators are morphisms of this inductive system, raising mu by a bounded amount.
- *V. Lafforgue, Definition 0.12 and (0.17).* The coalescence isomorphisms are isomorphisms of these sheaves along the diagonal maps, and they are canonical precisely because the construction is functorial in W.
- *V. Lafforgue, Definition 0.26 and Proposition 0.28.* The vector spaces H_{I,W} on which the excursion operators act are the Hecke-finite parts of the fibres of these sheaves at a geometric generic point.

**Unit tests.**

- `empty_case` — For I empty and W trivial the inductive limit is C_c(G(F)\G(A)/K_N, E).
- `partition_independence` — The sheaf computed with the coarse partition and with any finer one is the same; a construction for which this fails cannot carry the partial Frobenius action.
- `irreducible_is_ic` — For W irreducible the pulled back sheaf is the intersection complex; for reducible W it is the direct sum over the constituents (the degenerate case).
- `functoriality_in_W` — A morphism of representations induces a morphism of sheaves; attaching a sheaf only to isomorphism classes is not enough (the required non-example).

**Acceptance.**

- For I empty and W trivial, the inductive limit over mu of the sheaves is C_c(G(F)\G(A)/K_N, E), because Cht_{N, empty, 1} is the discrete stack Bun_{G,N}(F_q).
- The sheaves for different partitions are literally equal, so the partial Frobenius morphisms defined on finer partitions act on the same object.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme.ellAdicSheaf`, `mathlib:CategoryTheory.Sheaf.cohomologyPresheaf`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/global-shtuka-stack`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/truncations-and-finite-type`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/local-model-map-and-smoothness`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/geometric-satake-functor`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/forgetting-intermediate-modifications-is-small`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.4`, `DeligneWeightsAndPurity:DWP.0`

**Sources.**

- Section 0, Definition 0.11, p. 12 — “One defines the perverse sheaf F^{(I_1,...,I_k)}_{N,I,W,Xi,E} on Cht^{(I_1,...,I_k)}_{N,I,W}/Xi as the inverse image of S^{(I_1,...,I_k)}_{I,W,E} by the morphism (0.20). One then defines the functor (0.15) by setting H^{0, <= mu, E}_{N,I,W} to be the degree-zero compactly supported pushforward of that sheaf restricted to the truncation, for any partition of I.” *(The definition of the node, verbatim.)*
- Section 0, after Definition 0.11, p. 13 — “When W is irreducible, the smoothness of the morphism (0.12), hence of (0.20), and the computation of its dimension imply that F is isomorphic to the intersection sheaf of Cht^{(I_1,...,I_k)}_{N,I,W}/Xi. So the previous definition is coherent with definition 0.4 and refines it by making it more canonical.” *(The comparison with the naive definition.)*

### `partial-frobenius-morphisms`

*construction* — **Partial Frobenius morphisms of shtuka stacks and of their cohomology** · planet **Partial Frobenius**

**Statement.** For an ordered partition (I_1, ..., I_k) of I the partial Frobenius morphism Fr^{(I_1,...,I_k)}_{I_1} from Cht^{(I_1,...,I_k)}_{N,I,W} to Cht^{(I_2,...,I_k,I_1)}_{N,I,W} sends a chain (G_0, ..., G_{k-1}) with modifications phi_j to the chain (G_1, ..., G_{k-1}, tau G_0) with the modifications shifted and tau phi_1 appended, and moves the legs indexed by I_1 by the Frobenius of X. It lies above the morphism Frob_{I_1} of (X minus N)^I. It is a totally radicial local homeomorphism, so it identifies the intersection complexes, and proper base change gives morphisms F_{I_1} from the Frobenius pullback of H^{0, <= mu, E}_{N,I,W} to H^{0, <= mu + kappa, E}_{N,I,W}. Taking I_1 a singleton gives the maps F_{i}; they commute with each other and their product over i in I is the natural action of the total Frobenius.

**Hypotheses and conventions.**

- The morphism only exists between stacks for different orderings of the partition, which is why the factorised stacks are introduced; the target sheaf is the same by the partition-independence.
- The increase kappa of the truncation is unavoidable: if the polygon of G_1 is at most mu then that of G_0 is at most mu + kappa with kappa depending on W.

**Proof outline.**

1. Define Fr^{(I_1,...,I_k)}_{I_1} by the displayed formula and check that it lies above Frob_{I_1}.
2. Prove that it is a totally radicial local homeomorphism, hence that pushforward along it identifies the intersection complexes of source and target.
3. Apply proper base change to obtain the morphism F_{I_1} of constructible sheaves, with the truncation shift kappa.
4. Prove that the F_{i} commute and that their product is the total Frobenius action.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.Shtuka.partialFrobenius` | data | The morphism Fr^{(I_1,...,I_k)}_{I_1} of shtuka stacks. |
| `FunctionField.Shtuka.partialFrobenius_over` | characterisation | It lies above the partial Frobenius morphism Frob_{I_1} of (X minus N)^I. |
| `FunctionField.Shtuka.partialFrobenius_radicial` | structure | It is a totally radicial local homeomorphism, so it identifies the intersection complexes. |
| `FunctionField.Shtuka.F` | constructor | The induced morphism F_{i} of cohomology sheaves, raising the truncation by kappa. |
| `FunctionField.Shtuka.F_comm` | relation | The F_{i} commute with each other. |
| `FunctionField.Shtuka.F_prod` | characterisation | Their product over i in I is the natural action of the total Frobenius. |
| `FunctionField.Shtuka.F_singleton` | example | For I a singleton the partial Frobenius is the total Frobenius. |
| `FunctionField.Shtuka.F_coalescence` | compatibility | The coalescence isomorphism intertwines the pullback of F_{zeta^{-1}(j)} with F_{j}. |

**Where and how it is used.**

- *V. Lafforgue, Lemma 0.18 and section 0.4.* Drinfeld's lemma applies to a lisse sheaf equipped with commuting partial Frobenius morphisms whose composite is the total Frobenius, which is exactly this structure.
- *V. Lafforgue, Definition 0.14 and Proposition 0.16.* The Hecke operator at v is the composite of a creation morphism, the deg(v)-th power of a partial Frobenius and an annihilation morphism.
- *V. Lafforgue, Proposition 0.17.* The Eichler-Shimura relation says that a partial Frobenius is annihilated by a polynomial in the Hecke operators at v.

**Unit tests.**

- `singleton` — For I a singleton, F_{i} is the natural Frobenius action (the degenerate case).
- `product` — The product of the F_{i} over i in I is the total Frobenius; a construction for which the product is something else is wrong.
- `commutation` — The F_{i} commute; this is what Drinfeld's lemma needs and is not automatic.
- `needs_finer_partition` — The partial Frobenius does not exist as a morphism of Cht^{(I)}_{N,I,W} to itself, only between stacks for different orderings, so a construction that defines it on the coarse stack is wrong (a non-example).

**Acceptance.**

- The composite over all i in I is the natural Frobenius of (X minus N)^I acting on the sheaf, which is the hypothesis of Drinfeld's lemma.
- For I a singleton the partial Frobenius is the ordinary Frobenius and the statement is vacuous.

**Prerequisites.** `mathlib:frobenius`, `mathlib:iterateFrobenius`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/global-shtuka-stack`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/cohomology-sheaves-of-shtuka-stacks`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/truncations-and-finite-type`, `EtaleDualityAndPerverseSheaves:EDC.0`

**Sources.**

- Section 0, before (0.6) and after Definition 0.6, pp. 5, 8-9 — “The partial Frobenius morphism Fr^{(I_1,...,I_k)}_{I_1} from Cht^{(I_1,...,I_k)}_{N,I,W} to Cht^{(I_2,...,I_k,I_1)}_{N,I,W} is above the morphism Frob_{I_1}. As it is a totally radicial local homeomorphism, one has a canonical isomorphism of intersection complexes, and the proper base change isomorphism then furnishes a morphism F_{I_1}.” *(The construction and the reason it acts on cohomology.)*
- Section 0, (0.6), p. 5 — “One has, for kappa large enough as a function of W, for every i in I and for every mu, a morphism F_{i} from the Frobenius pullback of H^{0, <= mu, E}_{N,I,W} to H^{0, <= mu + kappa, E}_{N,I,W} of constructible sheaves on (X minus N)^I, so that the F_{i} commute with each other and their product for i in I is the natural action of the total Frobenius morphism.” *(The statement of the action on cohomology, with the commutation and the product rule.)*

### `coalescence-isomorphisms`

*theorem* — **Coalescence of legs: the isomorphisms chi_zeta** · planet **Coalescence of legs**

**Statement.** For a map zeta from I to J let Delta_zeta be the corresponding diagonal morphism from X^J to X^I and let W_zeta be the representation of the J-fold product of the dual group obtained by composing W with the diagonal morphism from the J-fold to the I-fold product of the dual group. There is a canonical isomorphism chi_zeta from the pullback along Delta_zeta of H^{0, <= mu, E}_{N,I,W} to H^{0, <= mu, E}_{N,J,W_zeta}, functorial in W and compatible with composition of maps of finite sets. It is defined, through proper base change, by the canonical isomorphism between the perverse sheaf for J and the pullback of the one for I along the inclusion of shtuka stacks, which comes from part c) of the Satake theorem. Moreover chi_zeta intertwines the pullback of the partial Frobenius indexed by the fibre of zeta over j with the partial Frobenius indexed by j.

**Hypotheses and conventions.**

- The word coalescence is reserved for legs fusing with each other; fusion is reserved for the fusion product of perverse sheaves on the Beilinson-Drinfeld Grassmannians. The paper is explicit about this distinction and it is worth keeping.
- The canonicity is what matters: the source and target of chi_zeta are sheaves on different spaces, so an isomorphism chosen only up to scalar would be useless.

**Proof outline.**

1. Take an arbitrary ordered partition (J_1, ..., J_k) of J; its inverse image is an ordered partition of I.
2. Identify Cht^{(J_1,...,J_k)}_{N,J} with the fibre product of Cht^{(zeta^{-1}(J_1),...)}_{N,I} with (X minus N)^J over (X minus N)^I.
3. Use part c) of the Satake theorem to identify the perverse sheaf for J with the pullback of the one for I along that inclusion.
4. Apply proper base change to obtain chi_zeta, and check that the result is independent of the chosen partition, which also yields the compatibility with the partial Frobenius morphisms.

**Acceptance.**

- Applying the construction to the map from I to a singleton gives the isomorphism used to define the excursion operators; applying it to the map from the empty set to a singleton gives the identification of the cohomology with and without an inactive leg.
- Compatibility with composition is what makes the relations among excursion operators hold.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme.ellAdicSheaf`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/cohomology-sheaves-of-shtuka-stacks`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/geometric-satake-functor`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/partial-frobenius-morphisms`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/global-shtuka-stack`, `EtaleDualityAndPerverseSheaves:EDC.0`

**Sources.**

- Section 0, (0.17) and Definition 0.12, pp. 10 and 13 — “One has a morphism of constructible sheaves on (X minus N)^J, called coalescence, chi_zeta from the pullback along Delta_zeta of H^{0, <= mu, E}_{N,I,W} to H^{0, <= mu, E}_{N,J,W_zeta}. This isomorphism is canonical, in the sense that it is an isomorphism of functors in W, compatible with the composition of zeta.” *(The statement and the canonicity.)*
- Section 0, Remark 0.13, p. 13 — “The fact of having taken an arbitrary partition (J_1, ..., J_k) allows one to show the compatibility between the coalescence isomorphism (0.17) and the partial Frobenius morphisms, namely that for every j in J, the pullback of F_{zeta^{-1}({j})} and F_{{j}} correspond under the isomorphism chi_zeta.” *(The compatibility with partial Frobenius, which is used for the Eichler-Shimura argument.)*

### `hecke-correspondences-on-shtuka-stacks`

*construction* — **Hecke correspondences between shtuka stacks and the operators T(f)** · planet **Hecke correspondences on shtukas**

**Statement.** For a function f in C_c(K_N \ G(A) / K_N, E), for kappa large enough as a function of W and f, and for every mu, there is a morphism T(f) from H^{0, <= mu, E}_{N,I,W} restricted to (X minus P)^I to H^{0, <= mu + kappa, E}_{N,I,W} restricted to (X minus P)^I, where P is a finite set of places containing the support of N outside which f is trivial. These are morphisms of constructible sheaves, called Hecke operators, and they are obtained from Hecke correspondences between shtuka stacks. For I empty and W trivial they are the usual Hecke operators on automorphic forms. They are extended to morphisms of sheaves on all of (X minus N)^I only after the identification of a Hecke operator with a creation-Frobenius-annihilation composite, which is GS.3's business.

**Hypotheses and conventions.**

- The restriction to (X minus P)^I is genuine at this stage: the naive Hecke correspondence is only defined where the legs avoid the places where f is nontrivial. Removing that restriction is a theorem, not a construction.
- The correspondence is finite etale, which is what makes the cohomological correspondence it defines well behaved.

**Proof outline.**

1. Define the Hecke correspondence Gamma^{(I)} whose points are a shtuka together with a second shtuka and an isomorphism of the underlying bundles away from v with prescribed relative position at v, respecting the level structures.
2. Prove that the two projections to the shtuka stack are finite etale.
3. Define T(h_{V,v}) as the corresponding cohomological correspondence, and extend to general f by writing the Hecke algebra as a restricted tensor product over places.
4. Prove compatibility with composition of Hecke operators and with the truncations.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.Shtuka.heckeCorrespondence` | data | The correspondence Gamma^{(I)} of pairs of shtukas related by a modification at v of prescribed relative position. |
| `FunctionField.Shtuka.heckeCorrespondence_finiteEtale` | structure | Both projections of the correspondence are finite etale. |
| `FunctionField.Shtuka.T` | constructor | The Hecke operator T(f) as a morphism of cohomology sheaves over (X minus P)^I. |
| `FunctionField.Shtuka.T_comp` | functoriality | T is compatible with the product of the Hecke algebra. |
| `FunctionField.Shtuka.T_empty` | compatibility | For I empty and W trivial, T(f) is the classical Hecke operator on automorphic forms. |
| `FunctionField.Shtuka.T_truncation` | structure | T(f) raises the truncation by an amount bounded in terms of W and f. |
| `FunctionField.Shtuka.T_commutes_partialFrobenius` | relation | T(f) commutes with the partial Frobenius morphisms. |

**Where and how it is used.**

- *V. Lafforgue, Proposition 0.16 and Corollary 6.5.* The identification of T(h_{V,v}) with the creation-Frobenius-annihilation composite is what extends T(f) to a morphism of sheaves on all of (X minus N)^I.
- *V. Lafforgue, Definition 0.20.* Hecke-finiteness is defined relative to the action of all T(f) with coefficients in the ring of integers of E.
- *GS.5.* The excursion operators are endomorphisms of Hecke modules, and the unramified Hecke operators are themselves excursion operators with two legs.

**Unit tests.**

- `classical` — For I empty and W trivial the operators are the classical Hecke operators.
- `unit` — The characteristic function of K_N acts as the identity (the degenerate case).
- `commutation` — Hecke operators at distinct places commute.
- `restriction_is_needed` — The naive construction only gives a morphism over (X minus P)^I; asserting it on all of (X minus N)^I without Proposition 0.16 is wrong (the required non-example).

**Acceptance.**

- For I empty and W trivial this is the usual action of the Hecke algebra on C_c(G(F)\G(A)/K_N, E).
- The correspondence Gamma^{(I)} is exactly the fibre product of the two subcorrespondences Y_1 and Y_2 that appear in the proof of Proposition 0.16.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/global-shtuka-stack`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/cohomology-sheaves-of-shtuka-stacks`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/unramified-hecke-algebra-and-satake-isomorphism`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/global-hecke-stacks-and-convolution`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/cuspidal-automorphic-forms`, `EtaleDualityAndPerverseSheaves:EDC.2`

**Sources.**

- Section 0, (0.7), p. 6 — “for every f in C_c(K_N \ G(A) / K_N, E), for kappa large enough as a function of W and of f, and for every mu, a morphism T(f) from H^{0, <= mu, E}_{N,I,W} restricted to (X minus P)^I to H^{0, <= mu + kappa, E}_{N,I,W} restricted to (X minus P)^I of constructible sheaves, where P is a finite set of places containing the support of N and outside which f is trivial.” *(The statement of the construction and the restriction it initially carries.)*
- Section 0, after (0.7), p. 6 — “The morphisms T(f) are called Hecke operators although they are morphisms of sheaves. They are obtained thanks to the rather evident construction of Hecke correspondences between the stacks of shtukas. Of course when I is empty and W is trivial, the morphisms T(f) are the usual Hecke operators.” *(Where they come from and the degenerate case.)*

### `elliptic-sheaf-realisation`

*application* — **Rank-r elliptic sheaves as a specialised realisation of a global shtuka**

**Statement.** For G = GL_r and suitable legs and bounds, a global shtuka is the same datum as a rank-r elliptic sheaf in the sense of Drinfeld and of Laumon-Rapoport-Stuhler: a chain of vector bundles with modifications and an isomorphism with the Frobenius pullback, shifted by a fixed line bundle. This realisation is owned by DrinfeldModulesAndTModules:DM.7 and is imported here, not planned again. The accepted restructuring RS-22 records that it is an optional specialised realisation and not a prerequisite of this layer.

**Hypotheses and conventions.**

- The identification requires a choice of level structure and of bounds, and is specific to GL_r; it does not extend to a general reductive group.
- The audit records DM.7 as constructing the rank-r elliptic sheaf that this layer says is an optional specialised realisation of a global shtuka, and notes that both state the Frobenius-modification definition.

**Proof outline.**

1. Record the definition of a rank-r elliptic sheaf as DM.7 gives it.
2. Construct the comparison functor to global shtukas for GL_r with the corresponding legs and bounds.
3. Prove that it is an equivalence onto the corresponding substack, and record which data on each side correspond.

**Acceptance.**

- The comparison is what links this roadmap to the D-elliptic-sheaf realisation used in ES7:equal-characteristic for the local correspondence in equal characteristic.
- RS-22 keeps GS.2 and says DM.7 remains an optional specialised realisation, not a prerequisite.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/global-shtuka-stack`, `DrinfeldModulesAndTModules:DM.7`

**Sources.**

- Section 0, p. 3 — “The stacks of shtukas were introduced by Drinfeld for GL_r (and I = {1, 2}, W = St tensor St^*) and generalised to reductive groups (and to arbitrary coweights) with division algebras studied by Laumon-Rapoport-Stuhler, Laurent Lafforgue, Ngo Bao Chau and Eike Lau, and arbitrary coweights introduced simultaneously by Ngo Bao Chau and Eike Lau.” *(The historical statement identifying the specialised realisations, with the attributions.)*

**What remains in GS.2.**

- Deligne-Mumford stacks and their intersection complexes, which are the ambient objects of every node here, are absent from both libraries and are requested from SchemeAndStackFoundations and EtaleDualityAndPerverseSheaves.
- The proofs in the body of the source, in particular proposition 2.8 for the smoothness of the local model map and the finite-type statement for the truncations, were not read: only the introduction's statements and proof sketches were.
- The elliptic-sheaf realisation is imported from DrinfeldModulesAndTModules:DM.7 and is not planned.

---

## GS.3. Cohomology, correspondences and cuspidal sectors

**Coverage: partial.** 9 nodes.

Nine nodes cover the creation and annihilation morphisms, the identification of a Hecke operator with a creation-Frobenius-annihilation composite and the resulting extension of the Hecke operators to the whole of (X minus N)^I, the Eichler-Shimura relation, Hecke-finiteness, its description as a union of constructible subsheaves stable under partial Frobenius, the fact that specialisation is an isomorphism on Hecke-finite parts, the identification of Hecke-finiteness with cuspidality, the functor H_{I,W} with its three properties, and the conjectural decomposition with the multiplicity spaces A_sigma, recorded as a conjecture.

**Planets (6):** *Creation and annihilation*, *Hecke operator as an excursion*, *Eichler-Shimura relation*, *Hecke-finiteness*, *Cuspidality is Hecke-finiteness*, *The spaces H_{I,W}*.

### `creation-and-annihilation-morphisms`

*construction* — **Creation and annihilation morphisms** · planet **Creation and annihilation**

**Statement.** Let I and J be finite sets, W a representation of the I-fold product of the dual group, U a representation of the J-fold product, and x in U and xi in U^* invariant under the diagonal action of the dual group. Write zeta_J for the map from J to a singleton. The creation morphism C^sharp_x is the composite of the coalescence isomorphism for the inclusion of I into the disjoint union of I and a singleton, the map induced by the morphism of representations Id_W box x, and the inverse of the coalescence isomorphism for the map from the disjoint union of I and J to that of I and a singleton. The annihilation morphism C^flat_xi is the composite in the opposite direction, using Id_W box xi. Both are morphisms of sheaves on (X minus N)^I times (X minus N): the legs indexed by I are unchanged and the legs indexed by J are created, respectively annihilated, at one and the same point of the curve.

**Hypotheses and conventions.**

- x and xi must be invariant under the diagonal action of the dual group, so that they are morphisms of representations and induce maps of cohomology sheaves.
- The two morphisms are defined over the locus where the created legs sit at a single point, which is why the target sheaf lives on the product of (X minus N)^I with a single copy of the curve.

**Proof outline.**

1. Record the two evident maps of finite sets and the corresponding coalescence isomorphisms.
2. Define C^sharp_x as the displayed composite and C^flat_xi as the composite in the other direction.
3. Prove that they are morphisms of constructible sheaves on the stated space and that they are functorial in W and in U.
4. Prove that they intertwine the natural action of the partial Frobenius on the created legs with the product of the corresponding partial Frobenius morphisms, which is Remark 0.13.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.Shtuka.create` | data | The creation morphism C^sharp_x attached to a diagonally invariant vector x. |
| `FunctionField.Shtuka.annihilate` | data | The annihilation morphism C^flat_xi attached to a diagonally invariant covector xi. |
| `FunctionField.Shtuka.create_functorial` | functoriality | Both are functorial in W and in U. |
| `FunctionField.Shtuka.create_empty` | example | For J empty the creation morphism is the identity. |
| `FunctionField.Shtuka.create_frobenius` | compatibility | The creation and annihilation morphisms intertwine the natural Frobenius action on the created legs with the product of the corresponding partial Frobenius morphisms. |
| `FunctionField.Shtuka.create_annihilate_comp` | relation | Composing creation with annihilation for the coevaluation and evaluation of a representation gives the operator attached to that representation. |

**Where and how it is used.**

- *V. Lafforgue, (0.22)-(0.25) and Definition 0.15.* The operator S_{V,v} is the composite of a creation for the coevaluation, the deg(v)-th power of a partial Frobenius, and an annihilation for the evaluation.
- *V. Lafforgue, Definition 0.29.* The excursion operator is the composite of a creation, a Galois action and an annihilation, with the legs at a generic point of the curve.
- *GS.5 and ExcursionOperatorsAndSpectralAction:ES0.* The same creation-Weil-annihilation shape defines the local excursion operators of Fargues-Scholze; the global ones here are the original.

**Unit tests.**

- `empty_creation` — For J empty the creation morphism is the identity (the degenerate case).
- `coevaluation` — For J of size two, U = V tensor V^*, x the coevaluation and xi the evaluation, the composite with a partial Frobenius is the Hecke operator at v.
- `invariance_required` — For x not invariant under the diagonal dual group the composite is not defined, since x is not a morphism of representations (the required non-example).
- `frobenius_intertwining` — The morphisms intertwine the Frobenius action on the created legs with the product of the partial Frobenius morphisms; a construction for which this fails breaks the descent in Definition 0.15.

**Acceptance.**

- Taking J of size two, U = V tensor V^* and x and xi the coevaluation and the evaluation gives the operator S_{V,v} of the next node.
- For J empty the creation morphism is the identity (the degenerate case).

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.2/coalescence-isomorphisms`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/cohomology-sheaves-of-shtuka-stacks`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/partial-frobenius-morphisms`, `mathlib:RootPairing`

**Sources.**

- Section 0, Definition 0.14, p. 14 — “One defines the creation morphism C^sharp_x as the composite of the coalescence isomorphism for the inclusion of I, of the morphism induced by Id_W box x, and of the inverse of the coalescence isomorphism for the map from the disjoint union of I and J. The annihilation morphism C^flat_xi is the composite in the opposite direction with Id_W box xi.” *(The definition of both morphisms, verbatim.)*
- Section 0, before Definition 0.14, p. 13 — “One will define the creation and annihilation morphisms, whose idea is the following. The legs indexed by I remain unchanged and one creates (or annihilates) the legs indexed by J at one and the same point of the curve.” *(The geometric description.)*

### `hecke-operator-as-creation-frobenius-annihilation`

*theorem* — **A Hecke operator is a creation, a partial Frobenius and an annihilation** · planet **Hecke operator as an excursion**

**Statement.** Let v be a place outside N and V an irreducible representation of the dual group. Define S_{V,v} as the composite of the creation morphism for the coevaluation of V, the deg(v)-th power of the partial Frobenius at the first created leg, and the annihilation morphism for the evaluation of V, all restricted to the locus where the two created legs sit at v; by descent along Z/deg(v)Z it is a morphism of sheaves on (X minus N)^I. Then the restriction of S_{V,v} to (X minus (N union v))^I is equal to the Hecke operator T(h_{V,v}). Consequently every Hecke operator T(f) extends naturally to a morphism of sheaves on all of (X minus N)^I, compatibly with composition.

**Hypotheses and conventions.**

- The proof is geometric. In the case where V is minuscule and deg(v) = 1 it reduces to the transverse intersection of two smooth substacks Y_1 and Y_2 inside a smooth Deligne-Mumford stack, whose intersection is exactly the Hecke correspondence; in general the substacks are singular and the argument is harder.
- A correction factor q^{-d/2}, where d is the dimension of the orbit attached to V, comes from the action of the partial Frobenius; the paper checks that no further sign is needed.

**Proof outline.**

1. Introduce the stack Z of shtukas for the partition with the two created legs at v and the legs of I in between, and the two closed substacks Y_1 and Y_2 cutting out the loci where a composite of two modifications extends to an isomorphism.
2. Show that the creation followed by the partial Frobenius is realised by a cohomological correspondence supported on Y_2 with the correction factor q^{-d/2}, and the annihilation by one supported on Y_1.
3. Show that the fibre product of Y_1 and Y_2 over Z is exactly the Hecke correspondence Gamma^{(I)}, by contracting the two isomorphisms in the diagram.
4. In the minuscule case, a tangent space computation shows the two substacks are smooth and transverse over the smooth loci, and since Gamma^{(I)} is a finite etale correspondence the equality of cohomological correspondences propagates from the smooth locus to everything.

**Acceptance.**

- This is the statement that removes the restriction to (X minus P)^I in the definition of the Hecke operators, and therefore makes the Eichler-Shimura relation, which is stated on the fibre over v, meaningful.
- For Shimura varieties over number fields such extensions have been constructed in many cases by Zariski closure; here the construction is uniform.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.3/creation-and-annihilation-morphisms`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/hecke-correspondences-on-shtuka-stacks`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/partial-frobenius-morphisms`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/local-model-map-and-smoothness`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/geometric-satake-functor`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/modified-commutativity-and-tate-twist`, `EtaleDualityAndPerverseSheaves:EDC.2`, `DeligneWeightsAndPurity:DWP.0`

**Sources.**

- Section 0, Proposition 0.16, p. 15 — “The restriction of S_{V,v} to (X minus (N union v))^I is equal, as a morphism of sheaves on (X minus (N union v))^I, to the Hecke operator T(h_{V,v}).” *(The statement of the node.)*
- Section 0, proof sketch of Proposition 0.16, pp. 15-16 — “The composite of the creation morphism and of the partial Frobenius is realised by a cohomological correspondence supported by Y_2, with a correction coefficient of q^{-d/2}, and the annihilation morphism by one supported by Y_1. The product of Y_1 and Y_2 over Z is nothing but the Hecke correspondence Gamma^{(I)}, which is finite etale.” *(The structure of the proof, with the correction factor.)*

### `eichler-shimura-relation`

*theorem* — **The Eichler-Shimura relation** · planet **Eichler-Shimura relation**

**Statement.** Let I and W be as above and let V be an irreducible representation of the dual group. Then the deg(v)-th power of the partial Frobenius at a leg indexed by a singleton, acting on the inductive limit over mu of the cohomology sheaves for the representation W box V restricted to (X minus N)^I times v, is annihilated by a polynomial of degree dim V whose coefficients are the restrictions of the morphisms S^i_{V,v}. Precisely, the alternating sum over i from 0 to dim V of the i-th power of that partial Frobenius composed with S^{dim V - i}_{V,v}, restricted to (X minus N)^I times v, vanishes.

**Hypotheses and conventions.**

- The statement is on the fibre over v, so the extension of the Hecke operators to all of (X minus N)^I is absolutely necessary before it can even be written down; the paper says so explicitly.
- The proof is a tensor-algebra computation inspired by a proof of the Cayley-Hamilton theorem, and rests only on the vanishing of the (dim V + 1)-st exterior power of V.

**Proof outline.**

1. Write S^i_{V,v} through the creation and annihilation morphisms as in the previous node.
2. Expand the alternating sum using the functoriality of the cohomology sheaves in W and the relations among coevaluation and evaluation morphisms.
3. Reduce the identity to the vanishing of the (dim V + 1)-st exterior power of V, which is the Cayley-Hamilton input.
4. Conclude on the fibre over v, where all the terms are defined thanks to the extension of the Hecke operators.

**Acceptance.**

- The relation is what makes the Hecke-finite part stable under the partial Frobenius morphisms, which is the hypothesis of Drinfeld's lemma and is the content of Lemma 0.22.
- For V the standard representation of GL_r the relation is the classical Eichler-Shimura relation between Frobenius and the Hecke operators.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.3/hecke-operator-as-creation-frobenius-annihilation`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/creation-and-annihilation-morphisms`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/partial-frobenius-morphisms`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/cohomology-sheaves-of-shtuka-stacks`, `mathlib:LinearMap.charpoly`, `mathlib:ExteriorAlgebra`

**Sources.**

- Section 0, Proposition 0.17, p. 20 — “The deg(v)-th power of the partial Frobenius at the leg {0} is annihilated by a polynomial of degree dim V whose coefficients are the restrictions to (X minus N)^I times v of the morphisms S^i_{V,v}. More precisely the alternating sum over i from 0 to dim V of the i-th power of the partial Frobenius composed with S^{dim V - i}_{V,v} restricted to (X minus N)^I times v vanishes.” *(The statement of the node.)*
- Section 0, after Proposition 0.17, p. 20 — “One recalls that S^i_{V,v} extends the Hecke operator T(h^i_{V,v}) and one remarks that this extension is absolutely necessary in order to take the restriction to (X minus N)^I times v. The proof is a simple tensor algebra computation (inspired by a proof of the Hamilton-Cayley theorem, and founded only on the fact that the (dim V + 1)-st exterior power of V vanishes).” *(Why the extension is needed and what the proof is.)*

### `hecke-finiteness`

*definition* — **Hecke-finiteness** · planet **Hecke-finiteness**

**Statement.** Let x bar be a geometric point of (X minus N)^I. An element of the fibre at x bar of the inductive limit over mu of the cohomology sheaves is Hecke-finite if it belongs to a finitely generated O_E-submodule of that fibre stable under T(f) for every f in C_c(K_N \ G(A) / K_N, O_E). The Hecke-finite elements form an E-subspace, stable under the fundamental group of the point and under the Hecke algebra with coefficients in E. Hecke-finiteness is a technical but crucial condition: it is what produces a finite-dimensional object out of the infinite-dimensional cohomology of the truncations.

**Hypotheses and conventions.**

- The definition uses coefficients in the ring of integers O_E, not in E: a finitely generated O_E-module stable under all the integral Hecke operators.
- The definition is applied with x bar the image of a geometric generic point of the diagonal, or a geometric generic point of (X minus N)^I; in those two cases the action of the Hecke operators is the evident one and does not need their extension to sheaf morphisms.

**Proof outline.**

1. Define the O_E-module of Hecke-finite elements at a geometric point.
2. Prove that it is an E-subspace, using that the Hecke algebra over E is the O_E-algebra inverted.
3. Prove that it is stable under the fundamental group of the point and under the Hecke algebra.
4. Record the two cases in which the definition is applied and the fact that in those cases the action of T(f) needs no extension.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.Shtuka.HeckeFinite` | data | The predicate on an element of the fibre of the cohomology at a geometric point. |
| `FunctionField.Shtuka.heckeFinitePart` | data | The E-subspace of Hecke-finite elements. |
| `FunctionField.Shtuka.heckeFinite_subspace` | structure | It is an E-subspace, not merely an O_E-submodule. |
| `FunctionField.Shtuka.heckeFinite_pi1Stable` | structure | It is stable under the fundamental group of the point. |
| `FunctionField.Shtuka.heckeFinite_heckeStable` | structure | It is stable under the Hecke algebra with coefficients in E. |
| `FunctionField.Shtuka.heckeFinite_of_cuspidal` | relation | For I empty and W trivial, a cuspidal function is Hecke-finite. |
| `FunctionField.Shtuka.cuspidal_of_heckeFinite` | characterisation | Conversely a Hecke-finite function on Bun_{G,N}(F_q) is cuspidal. |

**Where and how it is used.**

- *V. Lafforgue, Lemma 0.22 and Proposition 8.27.* The Hecke-finite part is a union of the fibres of constructible subsheaves stable under the partial Frobenius morphisms, which is what makes Drinfeld's lemma applicable.
- *V. Lafforgue, Proposition 0.25 and Corollary 8.34.* Specialisation is an isomorphism on Hecke-finite parts, which is what makes the Galois action canonical.
- *V. Lafforgue, Definition 0.26.* H_{I,W} is defined as the Hecke-finite part of the fibre at the image of a geometric generic point of the diagonal.

**Unit tests.**

- `cuspidal` — For I empty and W trivial, Hecke-finiteness is exactly cuspidality.
- `integral_coefficients` — The definition uses O_E-modules of finite type; replacing O_E by E makes the condition vacuous (the required non-example).
- `stable_under_galois` — The Hecke-finite part is stable under the fundamental group; a definition for which it is not cannot carry a Galois action.
- `zero` — The zero subspace is Hecke-finite, and the whole fibre is not, unless the cohomology is already finite dimensional (the degenerate case).

**Acceptance.**

- For I empty and W trivial, Hecke-finiteness of a function on Bun_{G,N}(F_q) is equivalent to cuspidality; that is Proposition 0.28 c) and is the bridge to automorphic forms.
- Hecke-finiteness is also, conjecturally and in the split case provably, equivalent to a cuspidality condition defined by stacks of shtukas for parabolic subgroups.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.2/hecke-correspondences-on-shtuka-stacks`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/cohomology-sheaves-of-shtuka-stacks`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/cuspidal-automorphic-forms`, `mathlib:Module.Finite`

**Sources.**

- Section 0, Definition 0.20, p. 21 — “Let x bar be a geometric point of (X minus N)^I. An element of the fibre at x bar of the inductive limit of the H^{0, <= mu, E}_{N,I,W} is called Hecke-finite if it belongs to a finitely generated O_E-submodule of that fibre which is stable under T(f) for every f in C_c(K_N \ G(A) / K_N, O_E).” *(The definition, verbatim.)*
- Section 7, the ICM survey, p. 13 — “An element of this ell-adic intersection cohomology is said to be Hecke-finite if it belongs to a sub-Z_ell-module of finite type stable by all Hecke operators. Hecke-finiteness can equivalently be defined by a cuspidality condition (defined using stacks of shtukas for parabolic subgroups of G and their Levi quotients) and it has finite dimension.” *(The comparison with cuspidality and the finite dimensionality, which the paper does not prove and which is only available for split groups.)*

### `hecke-finite-part-is-a-union-of-constructible-subsheaves`

*theorem* — **The Hecke-finite part is a union of constructible subsheaves stable under partial Frobenius**

**Statement.** The Hecke-finite part of the fibre of the inductive limit of the cohomology sheaves at a geometric generic point of (X minus N)^I is the union of the fibres of the O_E-submodules M = G restricted to that point, where G runs over the constructible O_E-subsheaves of the inductive limit over the generic point that are stable under the action of the partial Frobenius morphisms.

**Hypotheses and conventions.**

- The statement is at a geometric generic point; the subsheaves are over the generic point of (X minus N)^I, and are lisse on a dense open subset.
- The proof uses the Eichler-Shimura relation, which is why that relation has to be established first.

**Proof outline.**

1. Reduce to W irreducible and let M be a finitely generated O_E-submodule of the fibre stable under the fundamental group and under the integral Hecke algebra.
2. Choose mu_0 with M inside the image of the truncation at mu_0 and a dense open on which that truncation is lisse; let G be the unique lisse subsheaf with the given fibre.
3. For a family of closed points v_i, the Eichler-Shimura relation gives an inclusion of the deg(v_i) dim W_i-th power of the partial Frobenius applied to G into the sum of lower powers composed with Hecke operators, over the product of the v_i.
4. Smoothness propagates the inclusion from the product of the closed points to the generic point, and the stability of G under the Hecke operators simplifies it to an inclusion stable under the partial Frobenius, which gives the required subsheaf.

**Acceptance.**

- This is Lemma 0.22, proved as Proposition 8.27.
- It is the step at which the infinite-dimensional cohomology of the shtuka stacks is replaced by a system of honest constructible sheaves.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.3/hecke-finiteness`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/eichler-shimura-relation`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/partial-frobenius-morphisms`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/cohomology-sheaves-of-shtuka-stacks`, `EtaleDualityAndPerverseSheaves:EDC.0`

**Sources.**

- Section 0, Lemma 0.22, p. 22 — “The Hecke-finite part of the fibre at a geometric generic point is the union of the O_E-submodules M = G restricted to that point, where G is a constructible O_E-subsheaf of the inductive limit over the generic point, stable under the action of the partial Frobenius morphisms.” *(The statement of the node.)*
- Section 0, proof of Lemma 0.22, p. 22 — “For every i, the Eichler-Shimura relation (proposition 0.17) then implies the displayed inclusion over the product of the v_i. Thanks to the smoothness of the pullback of G at the product of the v_i, the inclusion propagates to the generic point.” *(The step of the proof that uses Eichler-Shimura.)*

### `specialisation-is-an-isomorphism-on-hecke-finite-parts`

*theorem* — **Specialisation is an isomorphism on Hecke-finite parts**

**Statement.** Fix an algebraic closure of F, a geometric generic point eta bar of X and a geometric point eta bar^I above the generic point of X^I together with a specialisation arrow from eta bar^I to the image of eta bar under the diagonal. The specialisation homomorphism from the fibre of the inductive limit of the cohomology sheaves at the diagonal geometric point to its fibre at eta bar^I restricts to an isomorphism on Hecke-finite parts. Consequently one may define H_{I,W} as the Hecke-finite part of the fibre at the diagonal geometric point, which is the more canonical of the two and does not depend on the choice of eta bar^I and of the specialisation arrow.

**Hypotheses and conventions.**

- The specialisation arrow is a choice; the point of the theorem is that the resulting Galois action does not depend on it.
- The role of the arrow is to make the fibre functor compatible with the coalescence of legs.

**Proof outline.**

1. Construct the specialisation homomorphism between the two fibres.
2. Prove that it is injective on Hecke-finite parts, using the previous node to write the Hecke-finite part as a union of fibres of lisse subsheaves.
3. Prove surjectivity by the same description together with Drinfeld's lemma, which extends such a subsheaf to a lisse sheaf on a power of a dense open.
4. Deduce that the natural map from H_{I,W} to the inductive limit of the fibres of the subsheaves at the diagonal point is an isomorphism, so the Galois action transported from Drinfeld's lemma is independent of the choices.

**Acceptance.**

- This is Proposition 0.25, proved as Corollary 8.34.
- It is what makes Definition 0.26 legitimate and the action of the I-fold product of the Galois group on H_{I,W} canonical.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.3/hecke-finite-part-is-a-union-of-constructible-subsheaves`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/hecke-finiteness`, `GlobalShtukasAndFunctionFieldLanglands:GS.4/drinfeld-lemma-for-lisse-sheaves`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/coalescence-isomorphisms`, `EtaleDualityAndPerverseSheaves:EDC.0`

**Sources.**

- Section 0, Proposition 0.25, p. 24 — “The restriction of the specialisation homomorphism (0.32) to the Hecke-finite parts is an isomorphism.” *(The statement of the node.)*
- Section 0, before Lemma 0.18, p. 20 — “The role of sp is to make the fibre functor at eta bar^I more canonical, and in particular compatible with the coalescence of legs. So eta bar^I and sp go together and the statements below involving eta bar^I depend on the choice of sp.” *(Why the specialisation arrow is introduced at all.)*

### `cuspidality-equals-hecke-finiteness`

*theorem* — **Hecke-finite automorphic forms are exactly the cuspidal ones** · planet **Cuspidality is Hecke-finiteness**

**Statement.** For I empty and W trivial, the Hecke-finite part of C_c(G(F)\G(A)/K_N, E) is exactly the subspace of cuspidal automorphic forms. Consequently H_{empty, 1} is the space of cuspidal automorphic forms of level N with coefficients in E.

**Hypotheses and conventions.**

- One inclusion is elementary: the cuspidal forms are a finitely generated O_E-module stable under all integral Hecke operators.
- The other inclusion is the substance and uses a support argument with the degree map relative to M/Z.

**Proof outline.**

1. Cuspidal implies Hecke-finite: C^cusp_c with coefficients in O_E is a finitely generated O_E-module stable under every T(f) with integral f.
2. Hecke-finite implies cuspidal: suppose f is Hecke-finite and not cuspidal, so some constant term f_P along a proper parabolic with Levi M is nonzero.
3. Since the representation ring of the dual of M is a finitely generated module over that of the dual of G, f_P is Hecke-finite for the Hecke operators of M at a place v; these include the translations by the elements of the centre of M at v.
4. The support of f_P is contained in a translate of a cone in a free finitely generated Z-module on which those translations act nontrivially, which contradicts f_P lying in a finite-dimensional space stable under them.

**Acceptance.**

- This is Proposition 0.28 c), proved as Proposition 8.23.
- It is the bridge between the cohomological side of the theory and classical automorphic forms, and is what makes the main theorem a statement about cuspidal forms.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.3/hecke-finiteness`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/cuspidal-automorphic-forms`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/cohomology-sheaves-of-shtuka-stacks`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/unramified-hecke-algebra-and-satake-isomorphism`, `FunctionFieldArithmetic:FA.6`

**Sources.**

- Section 0, proof of Proposition 0.28 c), p. 26 — “Property c) results from the fact that the Hecke-finite part of (0.5) is formed exactly of the cuspidal automorphic forms, that is, C_c(G(F)\G(A)/K_N, E)^{Hf} = C^cusp_c(G(F)\G(A)/K_N, E).” *(The statement of the node.)*
- Section 0, proof of Proposition 0.28 c), p. 26 — “One has a degree map (relative to M/Z) from U(A) M(F) \ G(A) / K_N with values in a free finitely generated Z-module, on which the centre of M at v acts by nontrivial translations. But the support of f_P is contained in the translate of a cone in that free module, and this contradicts the fact that f_P belongs to a finite dimensional vector space stable under that centre.” *(The support argument that proves the hard inclusion.)*

### `the-functor-H-I-W`

*definition* — **The vector spaces H_{I,W} and their functorial properties** · planet **The spaces H_{I,W}**

**Statement.** Define H_{I,W} as the Hecke-finite part of the fibre of the inductive limit of the cohomology sheaves at the image under the diagonal of a geometric generic point of X. Then: a) for every finite set I, W mapsto H_{I,W} and u mapsto H(u) is an E-linear functor from finite dimensional representations of the I-fold product of the dual group to inductive limits of finite dimensional continuous representations of the I-fold product of the Galois group of F; b) for every map zeta from I to J there is an isomorphism chi_zeta from H_{I,W} to H_{J,W_zeta}, functorial in W, equivariant for the J-fold product of the Galois group acting on the source through the diagonal, and compatible with composition; c) for I empty and W trivial, H_{empty, 1} is the space of cuspidal automorphic forms of level N. All the H_{I,W} are modules over the Hecke algebra compatibly with a), b) and c).

**Hypotheses and conventions.**

- The paper proves only that H_{I,W} is an inductive limit of finite dimensional continuous representations; that it is itself finite dimensional is a delicate further result, available only for split groups, and the argument is arranged so as not to need it.
- The Galois action is canonical: it does not depend on the auxiliary geometric point of X^I or on the specialisation arrow.

**Proof outline.**

1. Define H_{I,W} as the Hecke-finite part at the diagonal geometric point.
2. Prove a) from the functoriality of the cohomology sheaves in W.
3. Prove b) from the coalescence isomorphisms, which respect the Hecke-finite parts trivially, together with the equivariance coming from Drinfeld's lemma.
4. Prove c) from the identification of Hecke-finiteness with cuspidality.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.HIW` | data | The E-vector space H_{I,W}, the Hecke-finite part at the diagonal geometric generic point. |
| `FunctionField.HIW.functor` | functoriality | W mapsto H_{I,W} is an E-linear functor, with H(u) attached to a morphism of representations. |
| `FunctionField.HIW.galoisAction` | structure | The continuous action of the I-fold product of the Galois group of F. |
| `FunctionField.HIW.chi` | data | The coalescence isomorphism chi_zeta attached to a map of finite sets. |
| `FunctionField.HIW.chi_equivariant` | characterisation | chi_zeta is equivariant for the J-fold product of the Galois group acting diagonally on the source. |
| `FunctionField.HIW.chi_comp` | relation | chi is compatible with composition of maps of finite sets. |
| `FunctionField.HIW.empty` | compatibility | H_{empty, 1} is the space of cuspidal automorphic forms of level N. |
| `FunctionField.HIW.heckeModule` | instance | Each H_{I,W} is a module over the Hecke algebra, compatibly with the three properties. |

**Where and how it is used.**

- *V. Lafforgue, Definition 0.29.* The excursion operator is built from H(x), chi_zeta, the Galois action and H(xi), and nothing else.
- *V. Lafforgue, Lemma 0.31 and Proposition 0.36.* All the relations among excursion operators are formal consequences of properties a) and b).
- *ExcursionOperatorsAndSpectralAction:ES0.* The local analogue in the Fargues-Scholze setting has the same shape, with the category of sheaves on Bun_G in place of the H_{I,W}.

**Unit tests.**

- `empty` — H_{empty, 1} is the cuspidal automorphic forms (the degenerate case that anchors the whole theory).
- `trivial_representation` — For W trivial, H_{I,1} is H_{empty,1} with the trivial Galois action, by b) applied to the map from the empty set.
- `functoriality` — A morphism of representations induces a Galois-equivariant morphism; a construction attaching spaces only to isomorphism classes is wrong.
- `not_known_finite_dimensional` — H_{I,W} is only known to be an inductive limit of finite dimensional continuous representations; asserting finite dimensionality in general is not proved (the required non-example).

**Acceptance.**

- Applying b) to the map from the empty set to a singleton gives an isomorphism between H_{empty, 1} and H_{{0}, 1}, which is the identification used to state the main theorem.
- Properties a), b) and c) are all that the construction of the excursion operators and the proof of the main theorem use; the geometry is not needed again.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.3/specialisation-is-an-isomorphism-on-hecke-finite-parts`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/hecke-finiteness`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/cuspidality-equals-hecke-finiteness`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/coalescence-isomorphisms`, `GlobalShtukasAndFunctionFieldLanglands:GS.4/galois-action-on-hecke-finite-cohomology`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/cuspidal-automorphic-forms`

**Sources.**

- Section 0, Definition 0.26 and Proposition 0.28, pp. 24-25 — “One defines H_{I,W} as the left-hand side of (0.36). The H_{I,W} satisfy: a) W mapsto H_{I,W} is an E-linear functor to inductive limits of finite dimensional continuous representations of the I-fold product of the Galois group; b) for every zeta one has an isomorphism chi_zeta, functorial, equivariant and compatible with composition; c) for I empty and W trivial, the cuspidal automorphic forms.” *(The definition and the three properties, verbatim.)*
- Section 0, Remark 0.27, p. 24 — “In this article we show only that H_{I,W} is an inductive limit of finite dimensional E-vector spaces equipped with continuous representations of the I-fold product of the Galois group. The arguments of our article allow us to prove our main result without this result, which is delicate and is only available in the case of split groups for the moment.” *(The honest statement of what is and is not proved about finite dimensionality.)*

### `conjectural-decomposition-and-the-multiplicity-spaces`

*application* — **The conjectural decomposition of H_{I,W} by Langlands parameters**

**Statement.** One conjectures that there is a finite set of semisimple Langlands parameters, depending on N, and for each such sigma an E-linear representation A_sigma of the centraliser S_sigma of the image of sigma in the dual group, trivial on the centre of the dual group, such that for every I and W one has an isomorphism of H_{I,W} with the direct sum over sigma of the S_sigma-invariants of A_sigma tensor the representation of the I-fold product of the Galois group obtained by composing W with sigma. The isomorphism should be one of Hecke modules, functorial in W and compatible with the coalescence isomorphisms, and for I empty and W trivial it should be the decomposition of the main theorem with H_sigma the S_sigma-invariants of A_sigma. This conjecture is not proved, and following an idea of Drinfeld one can only show that properties a) and b) imply a decomposition close to it, expressed by a sheaf of modules on the stack of Langlands parameters rather than by the finite family of the A_sigma.

**Hypotheses and conventions.**

- This is a conjecture and is used nowhere in the proofs; it is recorded because it explains what the excursion operators mean and because it is the form in which Arthur and Kottwitz multiplicity conjectures are expected to appear here.
- For GL_r one expects the parameters to be the irreducible r-dimensional representations of the fundamental group of X minus N, with S_sigma the centre of the dual group and A_sigma the K_N-invariants of the corresponding automorphic representation.

**Proof outline.**

1. Record the conjecture in the form of the displayed isomorphism, with its functoriality and compatibility requirements.
2. Record Drinfeld's rigorous substitute: a structure of module over the algebra of functions on the space of morphisms from the Galois group to the dual group, together with an algebraic action of the dual group, on H_{{0}, Reg} for Reg the left regular representation.
3. Record that A_sigma is then defined as the largest quotient of H_{{0}, Reg} on which each function attached to a matrix coefficient and a Galois element acts by the corresponding scalar, and that this agrees with the conjectural A_sigma if the conjecture holds.
4. Record Zhu's observation that for elliptic sigma the parameter is isolated and the conjecture holds after restricting both sides to the parts lying over sigma.

**Acceptance.**

- In the heuristic, an excursion operator acts on H_sigma by the scalar f of the tuple sigma(gamma_i), which is exactly the eigenvalue property that the main theorem proves.
- One does not know whether the excursion algebra B is reduced, which is the obstruction to proving the conjecture in general.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.3/the-functor-H-I-W`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursion-operator`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/reconstruction-of-a-langlands-parameter`, `mathlib:RootPairing`

**Sources.**

- Section 0, Remark 0.30, p. 27 — “One conjectures that there exists a finite set of semisimple Langlands parameters and, for each sigma, an E-linear representation A_sigma of the centraliser S_sigma of the image of sigma, trivial on the centre, such that for every I and W one has the displayed isomorphism, of modules over the Hecke algebra.” *(The conjecture, verbatim.)*
- Section 8, Remark 8.5, the ICM survey, pp. 20-21 — “Rigorously we define A_sigma as the biggest quotient of H_{{0}, Reg} on which any function F_{f, gamma} acts by multiplication by the scalar f(sigma(gamma)), and S_sigma acts on A_sigma. In general due to deformation of some nonelliptic sigma there could a priori be nilpotents, and for example we don't know how to prove that B is reduced so we don't know how to prove the heuristics.” *(Drinfeld's rigorous substitute and the precise obstruction.)*

**What remains in GS.3.**

- The proof of Proposition 0.16 in the general, nonminuscule case is in chapter 6 of the source and was not read; the introduction gives it only in the minuscule case of degree one.
- The equivalence of Hecke-finiteness with a cuspidality condition defined by stacks of shtukas for parabolic subgroups, and the finite dimensionality of H_{I,W}, are recorded as known only for split groups and are not proved here; the source arranges its argument so as not to need them.
- Compactly supported cohomology, cohomological correspondences and the six operations are absent from both libraries and are requested from EtaleDualityAndPerverseSheaves.
- The comparison with the cusp-form space of FunctionFieldArithmetic:FA.6 is stated and requested, not proved.

---

## GS.4. Partial Frobenius and Drinfeld lemma

**Coverage: partial.** 7 nodes.

Seven nodes cover Drinfeld's lemma for finite etale coverings and for lisse sheaves, the resulting continuous action of the I-fold product of the Galois group on the Hecke-finite sector with its canonicity, the equivariance of the coalescence isomorphisms, their compatibility with the partial Frobenius morphisms, the commutation of the creation, annihilation, partial Frobenius and Hecke operators with the descent that defines S_{V,v} on the base, and the specialisation and independence statements that make the operation of moving the legs meaningful.

**Planets (5):** *Drinfeld's lemma*, *Drinfeld's lemma for lisse sheaves*, *Galois action on the Hecke-finite sector*, *Equivariance of coalescence*, *Commutation of the operators*.

### `drinfeld-lemma-for-finite-etale-coverings`

*theorem* — **Drinfeld's lemma for finite etale coverings of a power of the curve** · planet **Drinfeld's lemma**

**Statement.** Let U be a dense open subscheme of X and I a finite set. For i in I let Frob_i be the partial Frobenius morphism of U^I which applies the Frobenius of U to the i-th coordinate and the identity to the others. Then there is an equivalence of categories between the category of finite sets endowed with a continuous action of the I-fold product of the etale fundamental group of U at a geometric point, and the category of finite etale coverings of U^I equipped with partial Frobenius morphisms, that is, morphisms above each Frob_i, commuting with each other and whose composite is the total Frobenius of the covering. Neither library has an etale fundamental group of a scheme; Mathlib has abstract Galois categories with fibre functors and a recognition theorem for their fundamental group, and finite etale algebras with a fibre functor at a geometric point, but no Galois-category structure on finite etale coverings of a scheme.

**Hypotheses and conventions.**

- The hypothesis that the composite of the partial Frobenius morphisms is the total Frobenius of the covering is essential: without it there is no descent and the statement is false.
- The equivalence is stated with a chosen geometric point of U; changing it changes the fundamental group by an inner automorphism.

**Proof outline.**

1. Construct the functor from the first category to the second: if the action factors through the product of the Galois groups of finite etale Galois coverings U_i of U, send the finite set A to the quotient of the product of the U_i times A by the product of the Galois groups, with partial Frobenius given by the Frobenius of U_i in the i-th factor and the identity elsewhere.
2. Prove full faithfulness by comparing the automorphisms of both sides.
3. Prove essential surjectivity: a finite etale covering of U^I with commuting partial Frobenius morphisms whose composite is the total Frobenius descends, in each variable separately, to a covering of U, which gives the required action of the product of the fundamental groups.
4. Record the compatibility with the diagonal morphisms associated with maps of finite sets.

**Acceptance.**

- For I a singleton the statement is the ordinary Galois correspondence for finite etale coverings of U.
- In the GL_1 case the shtuka schemes Cht_{I, (n_i)} are exactly Galois coverings of X^I with group Pic(F_q) equipped with partial Frobenius morphisms, and this lemma is what produces the character of the fundamental group.

**Prerequisites.** `mathlib:CategoryTheory.GaloisCategory`, `mathlib:CategoryTheory.PreGaloisCategory`, `mathlib:AlgebraicGeometry.Scheme.Etale`, `mathlib:ProfiniteGrp`, `mathlib:frobenius`, `SchemeAndStackFoundations:SF.3`

**Sources.**

- Section 1, Lemma 1.1, the ICM survey, p. 5 — “We have an equivalence of categories between the category of finite sets A endowed with a continuous action of the I-fold product of the fundamental group of U, and the category of finite etale coverings T of U^I equipped with partial Frobenius morphisms, i.e. morphisms above Frob_i, commuting with each other, and whose composition is the total Frobenius of T.” *(The statement of the node, verbatim.)*
- Section 1, after Lemma 1.1, the ICM survey, p. 5 — “The functor is the following: if the action on A factorizes through the product of the Galois groups of finite etale Galois coverings U_i of U, then its image is the quotient of the product of the U_i times A, with the partial Frobenius morphisms given by the Frobenius of U_i and the identity elsewhere.” *(The explicit construction of the functor.)*

### `drinfeld-lemma-for-lisse-sheaves`

*theorem* — **Drinfeld's lemma for lisse sheaves with partial Frobenius** · planet **Drinfeld's lemma for lisse sheaves**

**Statement.** Let E be a constructible lisse O_E-sheaf on a dense open subscheme of (X minus N)^I equipped with an action of the partial Frobenius morphisms, that is, with isomorphisms from the pullback along Frob_i of its restriction to the generic point to itself, commuting with each other and whose composite is the natural isomorphism for the total Frobenius. Then E extends to a lisse sheaf on U^I for a small enough dense open U of X minus N, and its fibre at the image of a geometric generic point of X under the diagonal carries an action of the I-fold product of the etale fundamental group of U. Moreover, for fixed U, the functor sending such a sheaf to that fibre is an equivalence from the category of constructible lisse O_E-sheaves on U^I with an action of the partial Frobenius morphisms to the category of continuous representations of the I-fold product of the fundamental group on finitely generated O_E-modules, compatibly with coalescence.

**Hypotheses and conventions.**

- The statement is for lisse sheaves; the cohomology sheaves of shtuka stacks are not lisse and the limit over mu is not constructible, which is why the Hecke-finite part has to be extracted first.
- The specialisation map from the fibre at the diagonal point to the fibre at a geometric generic point of U^I is an isomorphism in this situation, which is Remark 0.19.

**Proof outline.**

1. Reduce to the case where the sheaf is finite, that is, corresponds to a finite etale covering, by considering the O_E/ell^n-reductions.
2. Apply Drinfeld's lemma for finite etale coverings to each reduction, and pass to the limit.
3. Prove the extension to U^I for a small enough U and the equivalence of categories for fixed U.
4. Prove the compatibility with the inverse image along the diagonal morphism attached to a map of finite sets.

**Acceptance.**

- The corresponding statement in the diamond setting is VStackSheavesAndLisseCategories:VS1's version of Fargues-Scholze IV.7; that is a different divisor-and-local-Weil theorem and this one is the classical scheme statement, as RS-22 records.
- Remark 0.19: in this situation the specialisation map is an isomorphism, so the fibre at the auxiliary generic point also carries the action.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.4/drinfeld-lemma-for-finite-etale-coverings`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/partial-frobenius-morphisms`, `mathlib:CategoryTheory.GaloisCategory`, `mathlib:ProfiniteGrp`, `mathlib:AlgebraicGeometry.Scheme.ellAdicSheaf`, `EtaleDualityAndPerverseSheaves:EDC.0`

**Sources.**

- Section 0, Lemma 0.18, p. 21 — “If E is a constructible lisse O_E-sheaf on a dense open of (X minus N)^I equipped with commuting partial Frobenius morphisms whose composite is the natural isomorphism, then it extends to a lisse sheaf on U^I for a small enough dense open U, and its fibre at the diagonal geometric point carries an action of the I-fold product of the fundamental group of U.” *(The statement, attributed by the paper to Drinfeld.)*
- Section 0, Lemma 0.18 and Remark 0.19, p. 21 — “Moreover, if one fixes U, the functor sending E to its fibre at the diagonal point gives an equivalence from the category of constructible lisse O_E-sheaves on U^I equipped with an action of the partial Frobenius morphisms to the category of continuous representations of the I-fold product of the fundamental group on finitely generated O_E-modules, compatibly with coalescence.” *(The equivalence and its compatibility with coalescence.)*

### `galois-action-on-hecke-finite-cohomology`

*theorem* — **The continuous action of a product of global Galois groups on the Hecke-finite sector** · planet **Galois action on the Hecke-finite sector**

**Statement.** There is an increasing union, indexed by the natural numbers, of constructible O_E-subsheaves F_lambda of the inductive limit of the cohomology sheaves over the generic point of (X minus N)^I, stable under the partial Frobenius morphisms, and a decreasing sequence of dense opens U_lambda of X minus N such that F_lambda extends to a lisse sheaf on U_lambda^I, whose union of fibres at a geometric generic point is the Hecke-finite part. Applying Drinfeld's lemma to each F_lambda gives H_{I,W} a continuous action of the I-fold product of the Galois group of F as an inductive limit of finite dimensional continuous representations, and that action is canonical.

**Hypotheses and conventions.**

- The parameters lambda and the opens U_lambda are not canonical, but the resulting action is: the natural map from H_{I,W} to the inductive limit of the fibres of the F_lambda at the diagonal point is an isomorphism, and Drinfeld's lemma provides the action on the right-hand side.
- The action is by an inductive limit of finite dimensional continuous representations; finite dimensionality of H_{I,W} itself is not proved here.

**Proof outline.**

1. Use the description of the Hecke-finite part as a union of fibres of constructible subsheaves stable under the partial Frobenius morphisms.
2. Shrink the base so that each of them is lisse, obtaining the sequence of dense opens.
3. Apply Drinfeld's lemma for lisse sheaves to each F_lambda to get an action of the I-fold product of the fundamental group of U_lambda, and pass to the inductive limit.
4. Prove that the resulting action on H_{I,W} is independent of the auxiliary geometric point and of the specialisation arrow, using that the isomorphism (0.37) is one of representations.

**Acceptance.**

- This is Proposition 0.23 together with Proposition 0.25, and is what gives meaning to the phrase a continuous action of the I-fold product of the Galois group on the Hecke-finite sector.
- The action factors through the I-fold product of the fundamental group of a dense open depending on the element, which is the unramifiedness outside a finite set that appears in the definition of a global Langlands parameter.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.4/drinfeld-lemma-for-lisse-sheaves`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/hecke-finite-part-is-a-union-of-constructible-subsheaves`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/specialisation-is-an-isomorphism-on-hecke-finite-parts`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/hecke-finiteness`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/partial-frobenius-morphisms`

**Sources.**

- Section 0, after Definition 0.26, p. 24 — “One can find an increasing union indexed by lambda of constructible O_E-subsheaves F_lambda of the inductive limit over the generic point, stable under the partial Frobenius morphisms (to which Drinfeld's lemma therefore applies), and a decreasing sequence of dense opens U_lambda such that F_lambda extends to a lisse sheaf on U_lambda^I, so that the union of the fibres is the Hecke-finite part.” *(The statement of the node.)*
- Section 0, after Definition 0.26, p. 24 — “The action of the I-fold product of the Galois group on the right-hand side of (0.37), which is given by Drinfeld's lemma, does not depend on the choice of the auxiliary geometric point and of the specialisation arrow, and therefore the action on the left-hand side does not depend on them either.” *(The canonicity of the action.)*

### `coalescence-is-galois-equivariant`

*theorem* — **The coalescence isomorphisms are equivariant for the diagonal Galois action** · planet **Equivariance of coalescence**

**Statement.** For every map zeta from I to J the coalescence isomorphism chi_zeta from H_{I,W} to H_{J,W_zeta} is equivariant for the J-fold product of the Galois group, acting on the source through the diagonal morphism sending a tuple indexed by J to the tuple indexed by I obtained by composing with zeta. The reason is that if the sequence F_lambda realises the Hecke-finite part for I and W, then the sequence of pullbacks along the diagonal morphism realises it for J and W_zeta, so the two Galois actions are the two sides of the same instance of Drinfeld's lemma.

**Hypotheses and conventions.**

- Equivariance is not formal: the source and target carry actions of different groups, related by the diagonal morphism determined by zeta.
- The compatibility of chi with composition of maps of finite sets is part of the same statement.

**Proof outline.**

1. Take the sequence F_lambda realising the Hecke-finite part for I and W and pull it back along the diagonal morphism from U^J to U^I.
2. Check that the pullbacks satisfy the same hypotheses relative to J and W_zeta, using the compatibility of coalescence with the partial Frobenius morphisms.
3. Deduce that chi_zeta is the identity on the inductive limits of the fibres, hence equivariant.
4. Deduce the compatibility with composition from the corresponding compatibility of the diagonal morphisms.

**Acceptance.**

- This is the content of the paragraph proving (0.39), and it is property b) of Proposition 0.28.
- It is what makes the excursion operators well defined, since they are built from chi_zeta for the map from I to a singleton.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.4/galois-action-on-hecke-finite-cohomology`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/coalescence-isomorphisms`, `GlobalShtukasAndFunctionFieldLanglands:GS.4/drinfeld-lemma-for-lisse-sheaves`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/the-functor-H-I-W`

**Sources.**

- Section 0, after (0.38), p. 25 — “Indeed, if the diagonal morphism is as above and if the sequence F_lambda is as above relative to I and W, then the sequence of pullbacks satisfies the same properties relative to J and W_zeta, so chi_zeta is equivariant for the J-fold product of the Galois group.” *(The proof of the node, verbatim.)*
- Section 0, Proposition 0.28 b), p. 25 — “for every map zeta from I to J, one has an isomorphism chi_zeta from H_{I,W} to H_{J,W_zeta}, functorial in W, equivariant for the J-fold product of the Galois group acting on the left-hand side through the diagonal morphism, and compatible with composition.” *(The packaged statement.)*

### `compatibility-of-coalescence-with-partial-frobenius`

*lemma* — **Coalescence intertwines the partial Frobenius morphisms**

**Statement.** For a map zeta from I to J and j in J, the pullback along the diagonal morphism of the partial Frobenius indexed by the fibre of zeta over j corresponds, under the coalescence isomorphism chi_zeta, to the partial Frobenius indexed by j. The proof is that the coalescence isomorphism may be computed using any ordered partition of J, in particular one whose blocks are unions of fibres of zeta.

**Hypotheses and conventions.**

- The freedom to use an arbitrary ordered partition of J in the definition of chi_zeta is exactly what makes this compatibility provable; with a fixed partition the two partial Frobenius morphisms would live on different stacks.
- The statement is used both to make the creation and annihilation morphisms intertwine the Frobenius actions and to descend the operator S_{V,v} along Z/deg(v)Z.

**Proof outline.**

1. Recall that chi_zeta is defined using an arbitrary ordered partition (J_1, ..., J_k) of J and its inverse image, and that the definition is independent of the choice.
2. Choose the partition so that the fibre of zeta over j is one block.
3. Compare the two partial Frobenius morphisms on the corresponding shtuka stacks and check that they correspond under the identification used to define chi_zeta.

**Acceptance.**

- This is Remark 0.13.
- Its first use is in the proof that S_{V,v} commutes with the Frobenius action on the created legs, which is what allows the descent of Definition 0.15.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.2/coalescence-isomorphisms`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/partial-frobenius-morphisms`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/creation-and-annihilation-morphisms`

**Sources.**

- Section 0, Remark 0.13, p. 13 — “The fact of having taken an arbitrary partition (J_1, ..., J_k) allows one to show the compatibility between the coalescence isomorphism (0.17) and the partial Frobenius morphisms, namely that for every j in J, the pullback of F_{zeta^{-1}({j})} and F_{{j}} correspond under the isomorphism chi_zeta of (0.17).” *(The statement and its proof, verbatim.)*

### `creation-annihilation-commute-with-hecke-and-frobenius`

*theorem* — **Creation, annihilation, partial Frobenius and Hecke operators commute** · planet **Commutation of the operators**

**Statement.** As a morphism of constructible sheaves on the product of (X minus N)^I with a place v, the operator S_{V,v} commutes with the natural action of the Frobenius morphism on the constant sheaf at v. Indeed the creation and annihilation morphisms intertwine that action with the action of the partial Frobenius indexed by the two created legs, and the deg(v)-th power of the partial Frobenius at the first created leg commutes with the product of the partial Frobenius morphisms at both. Consequently S_{V,v} descends along Z/deg(v)Z to a morphism of sheaves on (X minus N)^I, which is Definition 0.15. Moreover creation and annihilation commute with the Hecke operators, so the Hecke-finite part is stable under all of these operations.

**Hypotheses and conventions.**

- The descent along Z/deg(v)Z is taking invariants under the natural action of the Frobenius on the constant sheaf at v; it is what turns a morphism over the product with v into a morphism over the base.
- The commutation with the Hecke operators is what makes the operators of GS.5 endomorphisms of Hecke modules.

**Proof outline.**

1. Record that creation and annihilation intertwine the Frobenius action on the created legs with the product of the corresponding partial Frobenius morphisms, which is the previous lemma.
2. Observe that the partial Frobenius morphisms commute, so the deg(v)-th power at one created leg commutes with the product at both.
3. Deduce the commutation and perform the descent along Z/deg(v)Z.
4. Prove the commutation of creation and annihilation with the Hecke operators, which follows from the functoriality of the cohomology sheaves and from the fact that Hecke correspondences do not move the legs.

**Acceptance.**

- Definition 0.15 is exactly the descended morphism and is what makes Proposition 0.16 a statement about morphisms of sheaves on (X minus N)^I.
- Stability of the Hecke-finite part under the Galois action, the partial Frobenius morphisms and the creation and annihilation morphisms is what makes H_{I,W} a well behaved object.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.4/compatibility-of-coalescence-with-partial-frobenius`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/creation-and-annihilation-morphisms`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/partial-frobenius-morphisms`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/hecke-correspondences-on-shtuka-stacks`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/hecke-finiteness`

**Sources.**

- Section 0, after (0.25) and Definition 0.15, pp. 14-15 — “As a morphism of constructible sheaves on (X minus N)^I times v, S_{V,v} commutes with the natural action of the partial Frobenius morphism on the constant sheaf at v, since the creation and annihilation morphisms intertwine that action with the action of F_{{1,2}} and since F_{{1}}, hence its deg(v)-th power, commutes with F_{{1,2}} = F_{{1}} F_{{2}}.” *(The commutation statement.)*
- Section 0, Definition 0.15, p. 15 — “By abuse one again denotes by S_{V,v} the morphism of sheaves on (X minus N)^I obtained by descent relative to Z/deg(v)Z, taking the invariants under the natural action of the Frobenius morphism on the constant sheaf at v.” *(The descent that defines the operator on the base.)*

### `specialisation-and-independence-of-legs`

*theorem* — **Specialisation of legs, independence and coalescence isomorphisms**

**Statement.** The fibre functor at the image under the diagonal of a geometric generic point of X is related to the fibre functor at a geometric generic point of (X minus N)^I by a chosen specialisation arrow, and on Hecke-finite parts the specialisation homomorphism is an isomorphism. The Galois action obtained from Drinfeld's lemma is independent of these choices, and the coalescence isomorphisms are compatible with them. Consequently the legs may be specialised independently of one another and then brought back together, which is precisely the operation the excursion operators perform, and the resulting endomorphisms of H_{{0}, 1} do not depend on any of the auxiliary choices.

**Hypotheses and conventions.**

- Independence is the content: the operation of moving the legs is only meaningful because the fibre functor, the Galois action and the coalescence isomorphisms are all canonical.
- The specialisation arrow is needed to make the fibre functor compatible with coalescence, and in practice the specialisation map is an isomorphism.

**Proof outline.**

1. Record the specialisation arrow and the specialisation homomorphism between the two fibre functors.
2. Record that the restriction to Hecke-finite parts is an isomorphism.
3. Record that the Galois action and the coalescence isomorphisms transported through it do not depend on the arrow.
4. Deduce that the composite of a creation, an arbitrary tuple of Galois elements and an annihilation is a well defined endomorphism of H_{{0}, 1}.

**Acceptance.**

- This is the packaging of Proposition 0.23, Proposition 0.25 and the discussion after Definition 0.26, and is what Definition 0.29 rests on.
- For I a singleton the statement is empty; the content appears as soon as there are at least two legs to move independently.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.4/galois-action-on-hecke-finite-cohomology`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/specialisation-is-an-isomorphism-on-hecke-finite-parts`, `GlobalShtukasAndFunctionFieldLanglands:GS.4/coalescence-is-galois-equivariant`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/the-functor-H-I-W`

**Sources.**

- Section 0, before Lemma 0.18, p. 20 — “One fixes a geometric point eta bar^I above the generic point of X^I and a specialisation arrow from it to the image of eta bar under the diagonal. The role of sp is to make the fibre functor at eta bar^I more canonical, and in particular compatible with the coalescence of legs.” *(The setup.)*
- Section 0, after Definition 0.26, p. 24 — “The action of the I-fold product of the Galois group on H_{I,W} does not depend on the choice of eta bar^I and of the specialisation map.” *(The independence statement.)*

**What remains in GS.4.**

- The etale fundamental group of a scheme is absent from both libraries; Mathlib has abstract Galois categories and the recognition theorem for their fundamental group, but no Galois-category structure on finite etale coverings of a scheme. That structure is requested from SchemeAndStackFoundations:SF.3.
- The proof of Drinfeld's lemma in the lisse case is attributed by the source to Drinfeld and stated without proof in the introduction; chapter 8 of the source, where it is proved, was not read.
- Nothing here is claimed about the diamond analogue: VStackSheavesAndLisseCategories:VS1 proves a different divisor-and-local-Weil theorem, as RS-22 records.

---

## GS.5. Excursions and general reductive parameters

**Coverage: partial.** 8 nodes.

Eight nodes cover the excursion operators, their four relations, the indexing by invariant functions on the coarse quotient, the excursion algebra with its four properties including continuity, the reconstruction of a global Langlands parameter with the three conditions and the uniqueness up to conjugacy, the main decomposition with its characterisation and its Satake compatibility, the Chebotarev discussion with the Blasius-Lapid obstruction that forces more than two legs, and the nonsplit case with the L-group. The audit records ExcursionOperatorsAndSpectralAction:ES0 and ES5 as duplicates; RS-22 keeps GS.5 because the local Weil-group theorem is not a theorem for the global Galois group, and the ES0 and ES5 packets themselves already file a request to GS.5 for exactly these global statements.

**Planets (6):** *Excursion operator*, *Excursion relations*, *The excursion algebra*, *Reconstruction of a parameter*, *The canonical decomposition*, *The nonsplit case and the L-group*.

### `excursion-operator`

*definition* — **Excursion operators** · planet **Excursion operator**

**Statement.** Let I be a finite set, W a finite dimensional E-linear representation of the I-fold product of the dual group, zeta_I the map from I to a singleton, and x in W and xi in W^* invariant under the diagonal action of the dual group, regarded as morphisms of representations from the trivial representation to W_{zeta_I} and back. Let (gamma_i) be a tuple of elements of the Galois group of F indexed by I. The excursion operator S_{I,W,x,xi,(gamma_i)} is the endomorphism of H_{{0}, 1} obtained as the composite of H(x), the inverse of the coalescence isomorphism chi_{zeta_I}, the action of the tuple (gamma_i), the coalescence isomorphism chi_{zeta_I}, and H(xi). It is a creation operator, which creates legs at one and the same generic point of the curve, followed by a Galois action, which walks the legs on the curve independently of one another and then brings them back to the same generic point, followed by an annihilation operator.

**Hypotheses and conventions.**

- x and xi must be invariant under the diagonal dual group, so that they are morphisms of representations of the dual group and induce morphisms H(x) and H(xi).
- The operator is an endomorphism of H_{{0}, 1}, which is canonically the space of cuspidal automorphic forms by the identification of GS.3.
- Only properties a) and b) of the functor H are used: the geometry of shtuka stacks does not appear again after this point.

**Proof outline.**

1. Record the maps of representations x and xi and the induced morphisms H(x) and H(xi).
2. Record the coalescence isomorphism chi_{zeta_I} and its inverse.
3. Define the operator as the displayed composite.
4. Check that it is an endomorphism of Hecke modules, using that the coalescence isomorphisms and the Galois action commute with the Hecke operators.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.excursion` | data | The excursion operator attached to I, W, x, xi and a tuple of Galois elements. |
| `FunctionField.excursion_isHeckeLinear` | structure | It is an endomorphism of H_{{0},1} as a module over the Hecke algebra. |
| `FunctionField.excursion_functorial` | functoriality | It is functorial in W, in the sense that transporting x and xi along a morphism of representations does not change the operator. |
| `FunctionField.excursion_trivial` | example | For I a singleton and gamma the identity, the operator is multiplication by the pairing of xi with x. |
| `FunctionField.excursion_hecke` | compatibility | For I of size two, W = V box V^*, the coevaluation and the evaluation, and the tuple (Frob_v, 1), the operator is the unramified Hecke operator T(h_{V,v}). |
| `FunctionField.excursion_depends_on_f` | characterisation | The operator depends only on I, the tuple of Galois elements and the invariant function attached to W, x and xi. |
| `FunctionField.excursion_continuous` | structure | For fixed I and invariant function, the map from the I-fold product of the Galois group to the excursion algebra is continuous for the ell-adic topology. |

**Where and how it is used.**

- *V. Lafforgue, Theorem 0.1.* The main decomposition is the spectral decomposition of the commutative algebra generated by these operators.
- *V. Lafforgue, Remark 8.3 in the survey.* By Chebotarev the subalgebra generated by all Hecke algebras is the subalgebra generated by the excursion operators with two legs; in general more legs are needed.
- *ExcursionOperatorsAndSpectralAction:ES0.* The same creation-Weil-annihilation composite defines the local excursion operators of Fargues-Scholze, with the same relations; the audit records the two as duplicates and RS-22 keeps both because the groups differ.

**Unit tests.**

- `hecke` — The unramified Hecke operator at v is the excursion operator with two legs and the tuple (Frob_v, 1).
- `one_leg` — For I a singleton and gamma the identity the operator is a scalar (the degenerate case).
- `two_legs_not_enough` — For some groups G there are nonconjugate parameters with the same characters of all H_v, so the excursion operators with two legs do not generate the whole algebra (the required non-example, due to Blasius and Lapid).
- `invariance_required` — For x not diagonally invariant the composite is not defined; the definition must not drop the invariance hypothesis.

**Acceptance.**

- For I of size two, W = V box V^*, x the coevaluation, xi the evaluation and the tuple (Frob_v, 1), the operator is the unramified Hecke operator T(h_{V,v}); this is what makes the decomposition compatible with the Satake isomorphism.
- For I a singleton and gamma the identity the operator is multiplication by the pairing of xi with x.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.3/the-functor-H-I-W`, `GlobalShtukasAndFunctionFieldLanglands:GS.4/galois-action-on-hecke-finite-cohomology`, `GlobalShtukasAndFunctionFieldLanglands:GS.4/coalescence-is-galois-equivariant`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/creation-and-annihilation-morphisms`, `mathlib:RootPairing`

**Sources.**

- Section 0, Definition 0.29, p. 27 — “One defines the operator S_{I,W,x,xi,(gamma_i)} in End(H_{{0},1}) as the composite of H(x), the inverse of chi_{zeta_I}, the action of (gamma_i), chi_{zeta_I} and H(xi). This operator will be called an excursion operator.” *(The definition, verbatim.)*
- Section 0, after Definition 0.29, p. 27 — “Paraphrasing (0.42) it is the composite of a creation operator associated with x, whose effect is to create legs at the same generic point of the curve, of a Galois action, which walks the legs on the curve independently of one another, then brings them back to the same generic point of the curve, and of an annihilation operator associated with xi, which annihilates the legs.” *(The description that explains the name.)*

### `excursion-relations`

*theorem* — **The relations satisfied by the excursion operators** · planet **Excursion relations**

**Statement.** The excursion operators satisfy the following relations, all of which are formal consequences of properties a) and b) of the functor H. First, for a morphism u of representations of the I-fold product of the dual group, the operator for W with x and the transpose of u applied to xi' equals the operator for W' with u applied to x and xi'. Second, for a map zeta from I to J, the operator for J and W_zeta with the tuple indexed by J equals the operator for I and W with the tuple obtained by composing with zeta. Third, for a disjoint union of index sets the operator for the box product of representations and of vectors is the composite of the two operators. Fourth, the operator for the tuple whose i-th entry is gamma_i times the inverse of gamma'_i times gamma''_i equals the operator for the threefold disjoint union with the representation W box W^* box W, the vector given by the coevaluation and x, and the covector given by xi and the evaluation.

**Hypotheses and conventions.**

- The proofs use only a) and b) of Proposition 0.28; no geometry enters.
- The third relation is what makes the algebra generated by the excursion operators commutative.

**Proof outline.**

1. Prove the first relation from the functoriality of H in W.
2. Prove the second from the compatibility of the coalescence isomorphisms with composition and their equivariance.
3. Prove the third from the compatibility of coalescence with disjoint unions, which follows from b) applied to the evident map.
4. Prove the fourth by inserting the coevaluation and the evaluation and using b) again.

**Acceptance.**

- Commutativity of the excursion algebra follows from the third relation applied with both index sets equal to I, followed by the second relation for the evident map from the disjoint union of I with itself to I.
- The fourth relation is the one that encodes the group law of the Galois group inside the algebra.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursion-operator`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/the-functor-H-I-W`, `GlobalShtukasAndFunctionFieldLanglands:GS.4/coalescence-is-galois-equivariant`, `mathlib:RootPairing`

**Sources.**

- Section 0, Lemma 0.31, pp. 28-29 — “The excursion operators satisfy the relations (0.44) to (0.47), where u is a morphism equivariant for the I-fold product of the dual group, x and xi' are invariant, and the coevaluation and evaluation morphisms are the natural ones.” *(The four relations, which are the whole content of the node.)*
- Section 0, after Lemma 0.31, p. 29 — “The proof is very simple: it uses only properties a) and b) of proposition 0.28.” *(The statement that no geometry is needed.)*

### `invariant-functions-and-the-index-f`

*construction* — **Excursion operators are indexed by invariant functions on the coarse quotient**

**Statement.** The functions on the I-fold product of the dual group obtained as the pairing of xi with the action of a tuple on x, as W, x and xi vary, are exactly the regular functions on the coarse quotient of the I-fold product of the dual group by left and right translation by the diagonal dual group. Moreover the excursion operator depends only on I, on that function f and on the tuple of Galois elements. One therefore writes S_{I,f,(gamma_i)}. The coarse quotient is a scheme, unlike the stacky quotients considered elsewhere, so it forgets the automorphism groups of points.

**Hypotheses and conventions.**

- The identification of the available functions with the regular functions on the coarse quotient is an elementary statement about the invariant theory of a reductive group.
- The independence of the choice of W, x and xi follows from the first excursion relation.

**Proof outline.**

1. Prove that the function attached to W, x and xi is invariant under left and right translation by the diagonal dual group, hence a regular function on the coarse quotient.
2. Prove conversely that every regular function on the coarse quotient arises in this way, by decomposing the algebra of functions on the group into matrix coefficients.
3. Prove that the operator depends only on f, using the first excursion relation.
4. Record the resulting notation S_{I,f,(gamma_i)} and the reformulation of the relations in terms of f.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.invariantFunction` | data | The function on the I-fold product of the dual group attached to W, x and xi. |
| `FunctionField.invariantFunction_mem` | characterisation | It is a regular function on the coarse quotient by left and right diagonal translation. |
| `FunctionField.invariantFunction_surjective` | characterisation | Every regular function on that coarse quotient arises this way. |
| `FunctionField.excursionOfFunction` | constructor | The excursion operator S_{I,f,(gamma_i)} indexed by a function rather than by a triple. |
| `FunctionField.excursionOfFunction_wellDefined` | relation | The operator depends only on f, by the first excursion relation. |
| `FunctionField.coarseQuotient_iso` | equivalence | For I of size n+1 the coarse quotient identifies with the coarse quotient of the n-fold product by diagonal conjugation, through the map inserting the identity in the first coordinate. |

**Where and how it is used.**

- *V. Lafforgue, Proposition 0.36.* The relations are restated in terms of f, and in that form they say that f mapsto S_{I,f,(gamma_i)} is a morphism of commutative algebras with two further compatibilities.
- *V. Lafforgue, Proposition 0.37.* The reconstruction of the parameter from a character of the excursion algebra is carried out on the coarse quotients of powers of the dual group.
- *ExcursionOperatorsAndSpectralAction:ES0.* The local excursion operators are indexed by the same invariant functions, which is why the audit records the two constructions as duplicates.

**Unit tests.**

- `hecke_function` — The function sending a pair to the character of V at the product of the first with the inverse of the second is a regular function on the coarse quotient, and the corresponding operator is the Hecke operator.
- `constant_function` — A constant function gives a scalar operator (the degenerate case).
- `coarse_not_stacky` — The coarse quotient is a scheme and forgets the automorphism groups; using the stacky quotient would give a different and wrong indexing set (the required non-example).
- `independence_of_W` — Two triples giving the same function give the same operator; a construction depending on W is wrong.

**Acceptance.**

- For I of size two and f the function sending a pair to the character of V evaluated at the product of the first with the inverse of the second, S_{I,f,(Frob_v,1)} is the unramified Hecke operator T(h_{V,v}).
- The coarse quotient for I of size n+1, with the first coordinate set to the identity, is the coarse quotient of the n-fold product of the dual group by diagonal conjugation.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursion-operator`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursion-relations`, `mathlib:RootPairing`, `mathlib:CategoryTheory.Limits.HasLimits`

**Sources.**

- Section 0, Observation 0.32 and Lemma 0.33, p. 29 — “The functions obtained by varying W, x and xi are exactly the regular functions on the coarse quotient of the I-fold product of the dual group by left and right translation by the diagonal. The operator depends only on I, f and the tuple of Galois elements.” *(The two statements that justify the notation.)*
- Section 8, before Proposition 8.2, the ICM survey, p. 17 — “Unlike the stacky quotients considered before, the coarse quotients are schemes and therefore forget the automorphism groups of points.” *(The warning about what the coarse quotient forgets.)*

### `the-excursion-algebra`

*theorem* — **The excursion algebra B and its properties** · planet **The excursion algebra**

**Statement.** Let B be the subalgebra of the algebra of Hecke-linear endomorphisms of H_{{0},1} generated by all the excursion operators. Then B is commutative, and the operators satisfy: for every I and tuple of Galois elements, f mapsto S_{I,f,(gamma_i)} is a morphism of commutative algebras from the regular functions on the coarse quotient to B; for a map zeta from I to J, the operator for the composed function and the tuple indexed by J equals the operator for f and the composed tuple; for a threefold disjoint union, the operator for the function obtained by the rule sending a triple of tuples to f evaluated at the tuple whose i-th entry is g_i times the inverse of g'_i times g''_i equals the operator for f at the corresponding product tuple; and for fixed I and f, the map from the I-fold product of the Galois group to B is continuous for the ell-adic topology on B. It is not known whether B is reduced.

**Hypotheses and conventions.**

- Commutativity comes from the third excursion relation; it is what makes a spectral decomposition possible at all.
- Continuity comes from the fact that H_{I,W} is an inductive limit of continuous finite dimensional representations, which is all that is proved about it.

**Proof outline.**

1. Define B as the subalgebra generated by the excursion operators and prove commutativity from the third relation.
2. Deduce the algebra-morphism property from the third relation applied with both index sets equal to I followed by the second relation.
3. Deduce the second and third listed properties from the second and fourth excursion relations.
4. Prove continuity from the continuity of the Galois action on the finite dimensional pieces of H_{I,W}.

**Acceptance.**

- Since B is commutative one obtains a spectral decomposition of H_{{0},1}, that is a decomposition into generalized eigenspaces indexed by the characters of B.
- The algebra B is not known to be reduced, so the decomposition is into generalized eigenspaces and not into eigenspaces; simultaneous diagonalisability of the excursion operators is not proved.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursion-relations`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/invariant-functions-and-the-index-f`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursion-operator`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/the-functor-H-I-W`, `GlobalShtukasAndFunctionFieldLanglands:GS.4/galois-action-on-hecke-finite-cohomology`

**Sources.**

- Section 0, Proposition 0.36, pp. 29-30 — “(i) for every I and tuple, f mapsto S_{I,f,(gamma_i)} is a morphism of commutative algebras from the regular functions on the coarse quotient to B, (ii) for every map zeta the compatibility with composition holds, (iii) the threefold relation holds, (iv) for every I and f the map from the I-fold product of the Galois group to B is continuous for the ell-adic topology on B.” *(The four properties, verbatim.)*
- Section 0, after Proposition 0.36, p. 30 — “One does not know whether B is reduced. One nevertheless has a spectral decomposition, that is a decomposition into generalized eigenspaces, indexed by the characters of B.” *(The honest statement about reducedness and about what kind of decomposition is obtained.)*

### `reconstruction-of-a-langlands-parameter`

*theorem* — **Reconstruction of a global Langlands parameter from a character of the excursion algebra** · planet **Reconstruction of a parameter**

**Statement.** For every character nu of B with values in an algebraic closure of Q_ell there is a morphism sigma from the Galois group of F to the dual group over that closure such that: sigma takes its values in the dual group over a finite extension E' of E and is continuous; sigma is semisimple, that is, if its image is contained in a parabolic subgroup then it is contained in an associated Levi subgroup, equivalently the Zariski closure of its image is reductive; and for every I and every regular function f on the coarse quotient, nu of S_{I,f,(gamma_i)} equals f evaluated at the tuple of sigma(gamma_i). Moreover sigma is unique up to conjugation by the dual group. The proof uses only the four properties of the excursion algebra.

**Hypotheses and conventions.**

- Uniqueness follows because, for I the set from 0 to n, the coarse quotient identifies with the coarse quotient of the n-fold product by diagonal conjugation, so the condition applied to the tuple beginning with the identity determines the conjugacy class of the tuple of the sigma(gamma_j).
- Existence and continuity are the substantial parts and use the relations and the topological properties of the excursion operators.
- The parameter obtained factors through the fundamental group of X minus N; unramifiedness outside N is part of the conclusion.

**Proof outline.**

1. Reformulate the required condition as the statement that a compatible family of algebra morphisms nu_n from the regular functions on the coarse quotient of the n-fold product by diagonal conjugation to functions on the n-fold product of the Galois group is given by evaluation at a tuple of images.
2. Deduce from the relations that the family nu_n is functorial for all maps between the index sets and that each nu_n is a morphism of algebras.
3. Construct sigma by a Tannakian or a direct argument from that family, obtaining first the conjugacy class of each tuple and then a coherent morphism.
4. Prove continuity from property (iv) and semisimplicity from the reductivity of the Zariski closure, and prove uniqueness up to conjugation.

**Acceptance.**

- This is Proposition 0.37, proved as Proposition 11.7.
- Together with the spectral decomposition of B it yields the main theorem, by assigning to each character nu the parameter sigma and setting H_sigma to be the generalized eigenspace H_nu.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-excursion-algebra`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/invariant-functions-and-the-index-f`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursion-relations`, `mathlib:RootPairing`, `mathlib:ProfiniteGrp`, `mathlib:CategoryTheory.GaloisCategory`

**Sources.**

- Section 0, Proposition 0.37, pp. 30-31 — “For every character nu of B there is a morphism sigma from the Galois group of F to the dual group such that (C1) sigma is continuous with values over a finite extension of E, (C2) sigma is semisimple, and (C3) for every I and f, nu of S_{I,f,(gamma_i)} equals f of the tuple of sigma(gamma_i). Moreover sigma is unique up to conjugation.” *(The statement of the node, verbatim.)*
- Section 0, proof of Proposition 0.37, p. 31 — “The morphism from the n-fold product to the (n+1)-fold product sending a tuple to the tuple beginning with the identity induces an isomorphism from the coarse quotient of the n-fold product by diagonal conjugation to the coarse quotient of the (n+1)-fold product by left and right diagonal translation.” *(The identification from which uniqueness follows.)*

### `the-main-decomposition`

*theorem* — **The canonical decomposition of the space of cuspidal automorphic forms** · planet **The canonical decomposition**

**Statement.** There is a canonical decomposition of the space of cuspidal automorphic forms of level N with coefficients in an algebraic closure of Q_ell as a direct sum, indexed by global Langlands parameters, that is by conjugacy classes of continuous semisimple morphisms from the Galois group of F to the dual group over that closure, defined over a finite extension of Q_ell and unramified outside N. The decomposition is characterised by the property that H_sigma is the generalized eigenspace attached to the character nu of B defined by sending S_{I,f,(gamma_i)} to f evaluated at the tuple of sigma(gamma_i). It is a decomposition of modules over the Hecke algebra, it is compatible with the Satake isomorphism at every place outside N, in the sense that for every irreducible representation V of the dual group the operator T(h_{V,v}) acts on H_sigma by multiplication by the character of V evaluated at sigma(Frob_v), and it is compatible with the limit over N.

**Hypotheses and conventions.**

- The decomposition is into generalized eigenspaces, not eigenspaces, because B is not known to be reduced.
- The parameters are unramified outside N and factor through the fundamental group of X minus N; the statement is for split G, the nonsplit case being Theorem 12.3.
- The compatibility with Satake is what makes this the automorphic-to-Galois direction of the global Langlands correspondence.

**Proof outline.**

1. Decompose H_{{0},1} spectrally with respect to the commutative algebra B, obtaining a decomposition indexed by the characters of B.
2. Attach to each character nu the parameter sigma given by the reconstruction theorem, and check that the assignment is injective on the characters that occur.
3. Transport the decomposition through the identification of H_{{0},1} with H_{empty,1} and with the cuspidal automorphic forms.
4. Prove the compatibility with the Satake isomorphism by identifying the unramified Hecke operator with the excursion operator with two legs and the tuple (Frob_v, 1), which is Proposition 0.16.

**Acceptance.**

- For G = GL_r, since a semisimple linear representation is determined up to conjugation by its character and the Frobenius elements are dense by Chebotarev, the decomposition is uniquely determined by its compatibility with Satake.
- For general G this is false: Blasius and Lapid exhibit nonconjugate parameters with the same characters of every H_v, which is why excursion operators with more than two legs are needed.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.5/reconstruction-of-a-langlands-parameter`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-excursion-algebra`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/cuspidality-equals-hecke-finiteness`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/the-functor-H-I-W`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/hecke-operator-as-creation-frobenius-annihilation`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/unramified-hecke-algebra-and-satake-isomorphism`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/cuspidal-automorphic-forms`

**Sources.**

- Section 0, Theorem 0.1, p. 2 — “One has a canonical decomposition of Hecke modules of the cuspidal automorphic forms as a direct sum indexed by global Langlands parameters, that is conjugacy classes of morphisms sigma to the dual group, continuous, semisimple and unramified outside N. It is characterised by H_sigma being the generalized eigenspace associated with the character nu defined by (0.4).” *(The main theorem, verbatim.)*
- Section 0, after Theorem 0.1, p. 3 — “It is compatible with the Satake isomorphism at every place v of X minus N, that is for every irreducible representation V of the dual group, T(h_{V,v}) acts on H_sigma by multiplication by the scalar given by the character of V at sigma(Frob_v). It is also compatible with the limit over N.” *(The Satake compatibility and the compatibility with the level.)*

### `satake-compatibility-and-chebotarev`

*theorem* — **Satake compatibility, Chebotarev and the necessity of more than two legs**

**Statement.** The unramified Hecke operator T(h_{V,v}) is the excursion operator with two legs, the function sending a pair to the character of V at the product of the first with the inverse of the second, and the tuple (Frob_v, 1). Consequently the decomposition is compatible with the Satake isomorphism. By Chebotarev, the subalgebra of B generated by all the unramified Hecke algebras is exactly the subalgebra generated by the excursion operators with two legs. For G = GL_r that subalgebra determines the decomposition, since a semisimple linear representation is determined up to conjugation by its character. For a general reductive group it does not: there are finite groups and pairs of nonconjugate morphisms to the dual group whose values are conjugate element by element, so two nonconjugate parameters can give the same characters of every H_v, and excursion operators with more than two legs are necessary.

**Hypotheses and conventions.**

- The identification of the Hecke operator with a two-leg excursion operator is Proposition 0.16 and is proved by a geometric argument, essentially a computation of the intersection of algebraic cycles in a stack of shtukas.
- The failure for general G is due to Blasius and Lapid and is the reason the whole theory is organised around excursion operators rather than Hecke operators.

**Proof outline.**

1. Identify T(h_{V,v}) with the excursion operator with two legs by Proposition 0.16, which realises both as cohomological correspondences supported on the Hecke correspondence.
2. Deduce the compatibility of the decomposition with the Satake isomorphism from the eigenvalue property of the excursion operators.
3. Apply the Chebotarev density theorem to identify the algebra generated by the Hecke algebras with the algebra generated by two-leg excursion operators.
4. Record the Blasius-Lapid examples showing that for some G the two-leg operators do not generate B.

**Acceptance.**

- For GL_r the decomposition is uniquely determined by Satake compatibility; for a general group the main theorem has to state the characterisation through the excursion operators, which is what Theorem 0.1 does.
- This is why the paper waits until the excursion operators are constructed before stating its main theorem.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-main-decomposition`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/hecke-operator-as-creation-frobenius-annihilation`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursion-operator`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/unramified-hecke-algebra-and-satake-isomorphism`, `FunctionFieldArithmetic:FA.4`

**Sources.**

- Section 8, before Remark 8.3, the ICM survey, p. 19 — “For every place v and for every irreducible representation V of the dual group with character chi_V, the unramified Hecke operator T_{V,v} is equal to the excursion operator with two legs and the function sending a pair to chi_V of the product of the first with the inverse of the second, and Frob_v a Frobenius element at v.” *(The identification of the Hecke operator as an excursion operator.)*
- Section 6, the ICM survey, p. 11 — “For some groups other than GL_r, according to Blasius and Lapid, one can find finite groups and couples of morphisms to the dual group that are not conjugated but whose values are conjugate element by element. Thus the algebra B may not be generated by the Hecke algebras and Hecke compatibility may not characterise the decomposition.” *(The obstruction that forces excursion operators with more than two legs.)*

### `nonsplit-groups-and-the-l-group`

*theorem* — **The nonsplit case: inner forms, the L-group and the projection to the Galois group** · planet **The nonsplit case and the L-group**

**Statement.** For a connected reductive group G over F that is not necessarily split, the same construction gives a canonical decomposition in which the left-hand side is replaced by a direct sum, indexed by the finite set ker^1(F, G), of spaces of cuspidal automorphic forms for inner forms of G, and the global Langlands parameters are defined with the help of the L-group: they are conjugacy classes of continuous semisimple morphisms from the Galois group of F to the L-group whose composition with the projection to the Galois group is the identity. The decomposition is again into generalized eigenspaces and is compatible with the Satake isomorphism at the unramified places of the quasisplit inner form.

**Hypotheses and conventions.**

- The projection condition on a parameter is part of the definition and must not be dropped: a morphism to the L-group that does not lift the identity of the Galois group is not a parameter.
- The statement is Theorem 12.3; sections 12.1 and 12.2 of the paper contain the statements in the nonsplit case and may be read as a complement to the introduction.

**Proof outline.**

1. Develop the theory of shtukas for the chosen smooth model of G, retaining the ramified places.
2. Construct the Satake data by Galois descent through the L-group, which is GS.1's node.
3. Prove the analogue of the main theorem with the ker^1 sum on the automorphic side and the L-group on the Galois side.
4. Record the two conjectures stated in the same sections: that the parameters occurring come from elliptic Arthur parameters, and that the decomposition is defined over an algebraic closure of Q and is independent of ell.

**Acceptance.**

- Conjecture 12.7 asserts that the parameters occurring come from elliptic Arthur parameters; Conjecture 12.12 asserts independence of ell and rationality.
- Chapter 13 shows that the decomposition also exists with coefficients in an algebraic closure of F_ell, and chapter 14 indicates the adaptation to the metaplectic case.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-main-decomposition`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/nonsplit-descent-and-inner-forms`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/nonsplit-satake-descent-via-the-l-group`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/reconstruction-of-a-langlands-parameter`, `mathlib:RootPairing`, `mathlib:ProfiniteGrp`

**Sources.**

- Section 0, p. 3 — “In chapter 12 one treats the case of reductive groups that are not necessarily split and one proves theorem 12.3 which is similar to the theorem above, except that the left-hand side is replaced by a direct sum indexed by ker^1(F, G) of spaces of cuspidal automorphic forms for inner forms of G, and the Langlands parameters are defined with the help of the L-group.” *(The statement of the node.)*
- Section 0, p. 3 — “Conjecture 12.7 asserts that the Langlands parameters intervening in the decomposition come from elliptic Arthur parameters. Conjecture 12.12 asserts that the decomposition is defined over an algebraic closure of Q and is independent of ell. Chapter 13 gives the case of coefficients in an algebraic closure of F_ell, and chapter 14 the metaplectic case.” *(The two conjectures and the two further chapters.)*

**What remains in GS.5.**

- The proof of the reconstruction proposition is proposition 11.7 of the source and was not read; the introduction gives the reformulation and the first steps only.
- The nonsplit case, theorem 12.3, and the two conjectures 12.7 and 12.12 are stated from the introduction; chapter 12 was not read. The same holds for chapter 13, the case of coefficients in an algebraic closure of F_ell, and chapter 14, the metaplectic case, which are recorded in the node and not planned.
- Whether the excursion algebra B is reduced is unknown, so the decomposition is into generalized eigenspaces; this is not a gap in the reading but a gap in the mathematics, and it is what blocks the conjectural decomposition of GS.3.

---

## GS.6. The full GL_n global correspondence

**Coverage: partial.** 8 nodes.

Eight nodes cover the rank-r Drinfeld shtuka varieties with their smooth morphism of dimension 2r - 2 and their two partial Frobenius morphisms, the truncations with the absence of an open of finite type stable under Frobenius or Hecke, the compactification and boundary analysis, the negligible cohomology and the induction on the rank with Deligne's recurrence principle, the trace formula count, the correspondence itself with both directions and both uniqueness statements, the local factors and purity and multiplicity conclusions, and the rank-one case as global class field theory. RS-22 keeps this layer as an independent route and says that GS.5 and the specialised local realisations are not substitutes for it.

**Planets (6):** *Drinfeld shtuka variety*, *Truncation of shtuka varieties*, *Compactification and boundary*, *Negligible cohomology and induction*, *The trace formula count*, *The GL_r correspondence*.

### `drinfeld-shtuka-varieties-of-rank-r`

*definition* — **Drinfeld shtuka varieties of rank r with level structure** · planet **Drinfeld shtuka variety**

**Statement.** For every level N, that is every finite closed subscheme N = Spec O_N of X, there is a Deligne-Mumford stack Cht^r_N classifying Drinfeld shtukas of rank r with level structure N. It carries a smooth morphism of dimension 2r - 2 to the product of two copies of X minus N, two endomorphisms called partial Frobenius morphisms, Frob_infinity and Frob_0, whose composite is the total Frobenius, and an action by correspondences of the subalgebra H^r_N of the Hecke algebra consisting of the functions bi-invariant under K_N, the kernel of the reduction of GL_r of the integral adeles modulo N. There are infinitely many connected components; to have only finitely many one considers the substack Cht^{r,d}_N of shtukas of fixed degree d, or the quotient by a^Z for an idele a of degree one, which is the disjoint union of the Cht^{r,d}_N for d between one and r and is still equipped with Frob_infinity, Frob_0 and H^r_N.

**Hypotheses and conventions.**

- This is the rank-r case of the general definition, with the two legs called the zero and the pole; the general definition of GS.2 specialises to it for G = GL_r, I of size two and W the box product of the standard representation with its dual.
- The quotient by a^Z is the rank-r instance of the quotient by the central lattice Xi.

**Proof outline.**

1. Specialise the general shtuka stack to G = GL_r with two legs and the standard bounds.
2. Prove the smoothness of dimension 2r - 2 over the product of two copies of X minus N.
3. Construct the two partial Frobenius morphisms and prove that their composite is the total Frobenius.
4. Construct the action of H^r_N by Hecke correspondences, and the decomposition of the quotient by a^Z into the components of degrees one to r.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.DrinfeldShtuka` | data | The Deligne-Mumford stack Cht^r_N of rank-r Drinfeld shtukas with level N. |
| `FunctionField.DrinfeldShtuka.smooth` | structure | The structure morphism to the product of two copies of X minus N is smooth of dimension 2r - 2. |
| `FunctionField.DrinfeldShtuka.frobZero` | data | The partial Frobenius morphism at the zero. |
| `FunctionField.DrinfeldShtuka.frobInfty` | data | The partial Frobenius morphism at the pole. |
| `FunctionField.DrinfeldShtuka.frob_comp` | relation | The composite of the two partial Frobenius morphisms is the total Frobenius. |
| `FunctionField.DrinfeldShtuka.degreeComponent` | constructor | The substack of shtukas of fixed degree d. |
| `FunctionField.DrinfeldShtuka.quotientByIdele` | data | The quotient by a^Z for an idele a of degree one, with its decomposition into the components of degrees one to r. |
| `FunctionField.DrinfeldShtuka.heckeAction` | structure | The action of H^r_N by correspondences. |

**Where and how it is used.**

- *L. Lafforgue, the compactification and boundary analysis.* The compactified shtuka varieties are compactifications of exactly these, and the boundary is described in terms of the Levi subgroups of GL_r.
- *L. Lafforgue, the trace computation.* The Lefschetz numbers of composites of powers of Frobenius with Hecke correspondences on the truncations are computed by the Arthur-Selberg trace formula.
- *GS.7 and ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic.* The D-elliptic-sheaf variants of these varieties realise the local correspondence in equal characteristic.

**Unit tests.**

- `rank_one` — For r = 1 the shtuka variety is the Lang covering of the Picard scheme and the correspondence is class field theory (the degenerate case).
- `dimension` — The structure morphism is smooth of dimension 2r - 2; a construction giving another dimension is wrong.
- `infinitely_many_components` — Cht^r_N has infinitely many connected components, so the quotient by a^Z or the fixing of the degree is necessary (the required non-example).
- `partial_frobenius_product` — The composite of Frob_infinity and Frob_0 is the total Frobenius.

**Acceptance.**

- For r = 1 the shtuka variety is the Lang covering of the Picard scheme and the theory reduces to class field theory.
- The two legs are traditionally called the zero and the pole of the shtuka.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme`, `mathlib:frobenius`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/global-shtuka-stack`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/truncations-and-finite-type`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/level-structures`, `DrinfeldModulesAndTModules:DM.7`

**Sources.**

- Introduction, p. 2 of the preprint — “For every level N one has the Deligne-Mumford stack Cht^r_N classifying the Drinfeld shtukas of rank r with level structure N; it is equipped with a smooth morphism of dimension 2r - 2 over the product of two copies of X minus N, with two partial Frobenius morphisms Frob_infinity and Frob_0 whose composite is Frob, and with an action by correspondences of H^r_N.” *(The statement of the node, verbatim.)*
- Introduction, p. 2 of the preprint — “In Cht^r_N there are infinitely many connected components; in order to have only a finite number of them, one can consider the substack Cht^{r,d}_N of shtukas of fixed degree d, or the quotient Cht^r_N/a^Z, the disjoint union of the Cht^{r,d}_N for d between 1 and r, by an idele a of degree 1. Such a quotient remains equipped with an action of Frob_infinity, Frob_0 and H^r_N.” *(The finiteness device and what survives it.)*

### `truncation-and-the-absence-of-a-stable-open`

*theorem* — **Truncations of finite type, and the absence of an open of finite type stable under Frobenius and Hecke** · planet **Truncation of shtuka varieties**

**Statement.** The connected components of Cht^r_N are not of finite type: their ell-adic cohomology is of infinite dimension, and a naive count of the fixed points of Hecke correspondences gives infinitely many. Moreover there is no open substack of Cht^r_N/a^Z of finite type that is stable under Frob_infinity, under Frob_0 or under H^r_N. One defines nevertheless opens of finite type Cht^{r, p-bar <= p}_N/a^Z by bounding by a truncation polygon p from the interval [0, r] to the nonnegative reals the canonical Harder-Narasimhan polygon of the shtukas. This is the rank-r instance of the general truncation by the Harder-Narasimhan polygon.

**Hypotheses and conventions.**

- The absence of a stable open of finite type is the principal difficulty in the study of shtukas, and it is what forces both the truncation-and-limit strategy of the general theory and the compactification strategy of the rank-r proof.
- The truncation polygon is a function on [0, r], not a single number; the bound is the pointwise inequality of concave polygons.

**Proof outline.**

1. Prove that the connected components are not of finite type, and that the ell-adic cohomology of a component is of infinite dimension.
2. Prove that no open of finite type in the quotient by a^Z is stable under either partial Frobenius or under the Hecke algebra.
3. Construct the canonical Harder-Narasimhan polygon of a rank-r shtuka and prove that the condition of being bounded by a truncation polygon is open.
4. Prove that the resulting opens are of finite type and exhaust the quotient.

**Acceptance.**

- This is the rank-r case of the truncations of GS.0 and GS.2 and is the point at which the two treatments, by excursion operators and by the trace formula, diverge.
- The combination of the Arthur-Selberg trace formula with Drinfeld's adelic description of shtukas computes the number of fixed points in these truncations.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.6/drinfeld-shtuka-varieties-of-rank-r`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/harder-narasimhan-truncations`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/truncations-and-finite-type`, `SchemeAndStackFoundations:SF.2`

**Sources.**

- Introduction, p. 2 of the preprint — “The principal difficulty is that the connected components of Cht^r_N are not of finite type. Their ell-adic cohomology is of infinite dimension and the numbers of fixed points by the Hecke correspondences are infinite. Moreover there is no open of finite type in Cht^r_N/a^Z stable under Frob_infinity, Frob_0 or H^r_N.” *(The statement of the difficulty, verbatim.)*
- Introduction, p. 2 of the preprint — “One has nevertheless defined opens of finite type Cht^{r, p-bar <= p}_N/a^Z inside Cht^r_N/a^Z by bounding by a truncation polygon p from [0, r] to the nonnegative reals the canonical Harder-Narasimhan polygon of the shtukas.” *(The truncation device.)*

### `compactification-and-boundary-analysis`

*theorem* — **Compactifications of the shtuka varieties and the analysis of their boundary** · planet **Compactification and boundary**

**Statement.** The truncated shtuka varieties admit compactifications, obtained by allowing the shtuka structure to degenerate in a controlled way, whose boundary strata are described in terms of the proper parabolic subgroups of GL_r and their Levi quotients. The analysis of the boundary is what allows the contribution of the noncuspidal spectrum to be separated from the cuspidal one and is the geometric input of the induction on the rank. This is the compactification and boundary analysis that GS.6 owns; the corresponding compactifications in the general reductive setting, and their relation to the Lefschetz SL_2 acting on the intersection cohomology, are conjectural and are recorded in GS.5's conjectures rather than proved.

**Hypotheses and conventions.**

- The compactification is of the truncated varieties, not of the whole shtuka variety, which is not of finite type.
- The boundary strata are indexed by the proper parabolic subgroups, which is the same indexing as the constant terms defining cuspidality.

**Proof outline.**

1. Construct the compactification of a truncated shtuka variety by allowing degenerate shtuka structures, in the sense of the iterated shtukas of the preparatory work.
2. Describe the boundary strata in terms of the proper parabolic subgroups of GL_r and their Levi quotients.
3. Compute the contribution of each stratum to the cohomology, and identify the terms that involve the Hecke eigenvalues of the cuspidal automorphic representations of the strict Levi subgroups.
4. Isolate the cuspidal contribution.

**Acceptance.**

- The trace computation of the introduction exhibits, besides the cuspidal terms, other terms in which appear the Hecke eigenvalues of the cuspidal automorphic representations of the strict Levi subgroups of GL_r; those are exactly the boundary contributions.
- The preparatory work referred to is the transformation of the shtuka varieties without level structure into varieties of iterated shtukas.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.6/truncation-and-the-absence-of-a-stable-open`, `GlobalShtukasAndFunctionFieldLanglands:GS.6/drinfeld-shtuka-varieties-of-rank-r`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/cuspidal-automorphic-forms`, `EtaleDualityAndPerverseSheaves:EDC.5`, `DeligneWeightsAndPurity:DWP.7`

**Sources.**

- Introduction, p. 1 of the preprint — “preparatory works carried out previously by the author: the computation by means of the Arthur-Selberg trace formula of the numbers of fixed points in the shtuka varieties suitably truncated, in the book, and of the shtuka varieties without level structures into varieties of iterated shtukas.” *(The preparatory works on which the compactification rests.)*
- Introduction, p. 2 of the preprint — “plus other terms where appear the Hecke eigenvalues of the cuspidal automorphic representations of the strict Levi subgroups of GL_r.” *(The boundary contribution that the analysis must isolate.)*

### `negligible-cohomology-and-induction-on-the-rank`

*theorem* — **Negligible cohomology and the induction on the rank** · planet **Negligible cohomology and induction**

**Statement.** One argues by induction on the rank: one fixes r at least two and supposes the automorphic-to-Galois assertions already known in ranks strictly less than r. Combining the functional equations of Grothendieck's L-functions, Laumon's product formula and the converse theorems of Hecke, Weil and Piatetski-Shapiro, one deduces, by Deligne's recurrence principle, that the Galois-to-automorphic assertions are also known in ranks at most r. One is thus reduced to constructing the map from cuspidal automorphic representations of rank r to Galois representations. The cohomological contributions that do not come from the cuspidal spectrum of rank r are shown to be negligible, in a sense made precise by the boundary analysis, and the remaining part of the ell-adic cohomology above the generic point of the product of two copies of the curve is identified with the direct sum over the cuspidal representations of rank r of the tensor product of the representation with the two pullbacks of its parameter and its dual, twisted by 1 - r.

**Hypotheses and conventions.**

- The induction is on the rank and uses the converse theorems as an external input; the paper does not reprove them.
- The twist by 1 - r in the identification is part of the statement and must be kept.

**Proof outline.**

1. Set up the induction and record Deligne's recurrence principle, with the three external inputs: the functional equations of Grothendieck L-functions, Laumon's product formula and the converse theorems.
2. Identify, in the ell-adic cohomology of the shtuka varieties above the generic point of the product of two copies of the curve, the piece corresponding to the cuspidal representations of rank r.
3. Prove that the remaining contributions are negligible, using the boundary analysis and the induction hypothesis.
4. Conclude the construction of the map from cuspidal automorphic representations to Galois representations.

**Acceptance.**

- The uniqueness in the automorphic-to-Galois direction follows from the Chebotarev density theorem, and the uniqueness in the Galois-to-automorphic direction from the strong multiplicity one theorem of Piatetski-Shapiro.
- The assertions in rank one are equivalent to the reciprocity law of class field theory over F.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.6/compactification-and-boundary-analysis`, `GlobalShtukasAndFunctionFieldLanglands:GS.6/drinfeld-shtuka-varieties-of-rank-r`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/cuspidal-automorphic-forms`, `FunctionFieldArithmetic:FA.5`, `FunctionFieldArithmetic:FA.6`, `DeligneWeightsAndPurity:DWP.7`

**Sources.**

- Introduction, p. 1 of the preprint — “Reasoning by recurrence, one fixes an integer r at least 2 and one supposes the assertions (i) already known in ranks less than r. Combining the functional equations of Grothendieck L-functions, Laumon's product formula and the converse theorems of Hecke, Weil and Piatetski-Shapiro, one deduces (this is Deligne's recurrence principle) that the assertions (ii) are also known in ranks at most r.” *(The induction and its external inputs, verbatim.)*
- Introduction, p. 2 of the preprint — “one will identify in the ell-adic cohomology above the generic point of the product of two copies of the curve of the rank-r shtuka varieties, equipped with the action of the Hecke algebra by correspondences, a piece of the form the direct sum over the cuspidal representations of the tensor product of the representation with the two pullbacks of its parameter and its dual, twisted by 1 - r.” *(The identification that is the heart of the proof.)*

### `trace-formula-and-the-matching-of-terms`

*theorem* — **The Arthur-Selberg trace formula and the matching of Hecke and Frobenius terms** · planet **The trace formula count**

**Statement.** Combining the Arthur-Selberg trace formula with Drinfeld's adelic description of shtukas, one computes the numbers of fixed points of the composites of powers of the total Frobenius with Hecke correspondences in the fibre of a truncated shtuka variety modulo a^Z above a point of the product of two copies of the curve mapping to two distinct places outside N. The answer has the shape: q to the power (r - 1)s times the sum over the cuspidal representations with prescribed central character of the trace of the Hecke function times a product of the s-th powers, suitably normalised by the degrees of the two places, of the Hecke eigenvalues at the two places, plus other terms in which the Hecke eigenvalues of the cuspidal automorphic representations of the strict Levi subgroups appear. Matching the Hecke terms with the Frobenius terms is what produces the correspondence.

**Hypotheses and conventions.**

- The count is for the fibre above a point whose two coordinates are distinct places outside N, so the two legs are separated; this is the situation of good position.
- The other terms are the boundary contributions, which the compactification and boundary analysis isolate.

**Proof outline.**

1. Recall Drinfeld's adelic description of shtukas and use it to write the fixed-point count as an orbital-integral expression.
2. Apply the Arthur-Selberg trace formula to that expression.
3. Read off the cuspidal contribution and identify the remaining terms with contributions of strict Levi subgroups.
4. Match the two sides, using the induction hypothesis to control the Levi contributions.

**Acceptance.**

- There is no Grothendieck-Lefschetz trace formula in either pinned library, so the whole of this node rests on an external input that has to be planned in EtaleDualityAndPerverseSheaves and DeligneWeightsAndPurity.
- The factor q to the power (r-1)s is the normalisation coming from the middle-degree twist.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.6/compactification-and-boundary-analysis`, `GlobalShtukasAndFunctionFieldLanglands:GS.6/negligible-cohomology-and-induction-on-the-rank`, `GlobalShtukasAndFunctionFieldLanglands:GS.6/truncation-and-the-absence-of-a-stable-open`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/weil-uniformization`, `EtaleDualityAndPerverseSheaves:EDC.2`, `DeligneWeightsAndPurity:DWP.7`, `FunctionFieldArithmetic:FA.6`

**Sources.**

- Introduction, p. 2 of the preprint — “Combining the Arthur-Selberg trace formula and the adelic description of shtukas by Drinfeld, one has computed the numbers of fixed points by the composites of powers of Frobenius and of Hecke correspondences f in H^r_N which are in the fibre of the truncated shtuka variety modulo a^Z above a point x of the product of two copies of the curve which maps to two distinct places outside N.” *(The setting of the computation, verbatim.)*
- Introduction, p. 2 of the preprint — “Simplifying, these numbers of fixed points have the form q to the power (r-1)s times a sum over the cuspidal representations with central character trivial on a, of the trace at f times a product of normalised powers of the Hecke eigenvalues at the two places, plus other terms.” *(The shape of the answer.)*

### `the-global-correspondence-for-gl-r`

*theorem* — **The global Langlands correspondence for GL_r over a function field** · planet **The GL_r correspondence**

**Statement.** For every integer r at least one: to every irreducible cuspidal automorphic representation pi of GL_r of the adeles whose central character is of finite order one can associate a unique ell-adic representation sigma_pi of the Galois group of F, almost everywhere unramified, irreducible of dimension r and with determinant of finite order, which is unramified at every place where pi is unramified and whose Frobenius eigenvalues there are the Hecke eigenvalues of pi; and conversely, to every such Galois representation sigma one can associate a unique irreducible cuspidal automorphic representation pi_sigma whose Hecke eigenvalues are the Frobenius eigenvalues of sigma. Uniqueness in the first direction follows from the Chebotarev density theorem, and in the second from the strong multiplicity one theorem of Piatetski-Shapiro. In rank one the two assertions are equivalent to the reciprocity law of class field theory over F.

**Hypotheses and conventions.**

- The hypotheses are exact: the central character of pi is of finite order, and the determinant of sigma is of finite order. Dropping either makes the statement false.
- This is a bijection between two explicitly described sets, and it is proved by an induction on r that uses the converse theorems; it is not a corollary of GS.5, whose theorem is a parametrisation rather than a bijection with multiplicities.

**Proof outline.**

1. Set up the two sets A_r(F) and G_r(F) as in the source.
2. Prove uniqueness in both directions from Chebotarev and from strong multiplicity one.
3. Construct the map from A_r(F) to G_r(F) by the cohomological identification of the previous nodes, by induction on r.
4. Deduce the converse direction from Deligne's recurrence principle and the converse theorems.

**Acceptance.**

- For r = 1 the statement is global class field theory for F, which is FunctionFieldArithmetic:FA.4.
- The theorem is independent of the methods of GS.5: V. Lafforgue's paper proves a parametrisation for a general reductive group and does not reprove this bijection, and RS-22 keeps the two routes separate.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.6/negligible-cohomology-and-induction-on-the-rank`, `GlobalShtukasAndFunctionFieldLanglands:GS.6/trace-formula-and-the-matching-of-terms`, `GlobalShtukasAndFunctionFieldLanglands:GS.6/compactification-and-boundary-analysis`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/cuspidal-automorphic-forms`, `FunctionFieldArithmetic:FA.4`, `FunctionFieldArithmetic:FA.5`, `FunctionFieldArithmetic:FA.6`

**Sources.**

- Introduction, p. 1 of the preprint — “For every r at least 1: (i) to every cuspidal automorphic representation pi in A_r(F) one can associate a unique Galois representation sigma_pi in G_r(F), unramified wherever pi is and with Frobenius eigenvalues the Hecke eigenvalues of pi; (ii) conversely, to every sigma in G_r(F) a unique pi_sigma in A_r(F) with matching eigenvalues.” *(The main theorem, verbatim.)*
- Introduction, p. 1 of the preprint — “The uniqueness in the assertions (i) results from the Chebotarev density theorem and the uniqueness in the assertions (ii) from the strong multiplicity one theorem of Piatetski-Shapiro. The assertions (i) and (ii) in rank 1 are equivalent to the reciprocity law in class field theory over F.” *(The two uniqueness statements and the rank-one case.)*

### `local-factors-purity-and-multiplicity`

*theorem* — **Local factors, purity and multiplicity conclusions in the range of the theorem**

**Statement.** In the range of the theorem the correspondence is compatible with the local factors at every place, including the ramified ones, in the sense that the local L-factors and epsilon-factors of pi and of sigma_pi agree; the Galois representations obtained are pure of weight zero after the normalisation fixed by the finite order of the determinant, which is the Ramanujan-Petersson conjecture for GL_r over a function field; and the multiplicity of pi in the cuspidal spectrum is one, by strong multiplicity one. These conclusions are part of the statement of the correspondence in rank r and are not consequences of the parametrisation of GS.5.

**Hypotheses and conventions.**

- Purity in this range is a theorem for GL_r over a function field and is the Ramanujan-Petersson conjecture there; for a general reductive group the corresponding statement is only expected and is recorded as a conjecture in GS.5.
- The compatibility with local factors at the ramified places is the local-global compatibility that GS.7 studies in general; for GL_r it is known without semisimplification.

**Proof outline.**

1. Record the local L-factors and epsilon-factors on both sides and prove their agreement, using the functional equations and the product formula.
2. Prove purity of the Galois representations obtained, in the normalisation fixed by the determinant condition.
3. Record multiplicity one, which follows from strong multiplicity one.
4. Record what is not proved for a general reductive group.

**Acceptance.**

- V. Lafforgue's introduction records that for GL_r the conjectures consist in a bijection with a precise compatibility of L-functions, while for a general G they are rather a parametrisation together with Arthur multiplicity formulas which his methods do not compute.
- The Ramanujan-Petersson conjecture for general G would follow from the expectation, recorded in GS.5, that generic cuspidal forms appear exactly in the elliptic parameters.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.6/the-global-correspondence-for-gl-r`, `GlobalShtukasAndFunctionFieldLanglands:GS.6/negligible-cohomology-and-induction-on-the-rank`, `FunctionFieldArithmetic:FA.5`, `DeligneWeightsAndPurity:DWP.7`, `DeligneWeightsAndPurity:DWP.10`

**Sources.**

- Section 0, p. 3 of V. Lafforgue — “In the case where G = GL_r the Langlands conjectures consist rather in a bijection, whereas for a general G they consist rather in a parametrisation, obtained in the theorem above, and in Arthur multiplicity formulas for the H_sigma, which we do not know how to compute with the methods of this article.” *(The precise difference between the two theorems, which is why GS.6 is a separate layer.)*
- Section 11, the ICM survey, p. 23 — “Moreover we expect that generic cuspidal automorphic forms appear exactly in H_sigma such that sigma is elliptic as a Langlands parameter. This would imply the Ramanujan-Petersson conjecture, an archimedean estimate on Hecke eigenvalues.” *(The status of purity for a general group, against the theorem for GL_r.)*

### `rank-one-is-class-field-theory`

*application* — **The rank-one case is global class field theory**

**Statement.** In rank one the two assertions of the correspondence are equivalent to the reciprocity law of global class field theory for the function field F: the canonical isomorphism from the fibre product of the abelianized fundamental group of X with Z over the profinite completion of Z to Pic(F_q), characterised by sending Frob_v to the class of O(v). That statement is owned by FunctionFieldArithmetic:FA.4 and is imported here as the base case of the induction on the rank and as the acceptance test of the whole layer.

**Hypotheses and conventions.**

- The reciprocity isomorphism is the input, not the output, of the induction: rank one is assumed and ranks at least two are proved from it.
- The audit records that global class field theory for function fields is itself absent from both libraries.

**Proof outline.**

1. Import the reciprocity isomorphism from FunctionFieldArithmetic:FA.4.
2. Check that it matches the rank-one instance of the two assertions of the correspondence, that is, that characters of the idele class group of finite order correspond to characters of the fundamental group with the prescribed Frobenius values.
3. Record it as the base case of the induction.

**Acceptance.**

- The GL_1 acceptance case of GS.0 gives the geometric construction of the character sigma(chi) through the Lang isogeny and Drinfeld's lemma, which is the shtuka-theoretic proof of the same statement.
- The n = 1 acceptance case of GS.6 is exactly FA.4's global reciprocity map, as the audit records.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.6/the-global-correspondence-for-gl-r`, `GlobalShtukasAndFunctionFieldLanglands:GS.0/picard-and-the-gl1-case`, `FunctionFieldArithmetic:FA.4`

**Sources.**

- Introduction, p. 1 of the preprint — “The assertions (i) and (ii) in rank 1 are equivalent to the reciprocity law in class field theory over F.” *(The statement of the node, verbatim.)*

**What remains in GS.6.**

- Only the introduction of L. Lafforgue's paper was read, two printed pages of a 241-page article. Every node of this layer therefore carries the introduction's statement of a result and the introduction's description of the method, and no proof read from the source. This is the largest single reading gap in the packet and the coverage status reflects it.
- The compactification of the truncated shtuka varieties, the description of its boundary, the negligible-cohomology argument and the trace computation are stated at the level of the introduction only; the preparatory book on the Arthur-Selberg computation and on iterated shtukas was not read at all.
- The Grothendieck-Lefschetz trace formula, which the whole layer rests on, is absent from both libraries and is requested from EtaleDualityAndPerverseSheaves:EDC.2 and DeligneWeightsAndPurity:DWP.7.
- The converse theorems of Hecke, Weil and Piatetski-Shapiro, Laumon's product formula and the functional equations of Grothendieck L-functions are external inputs, requested from FunctionFieldArithmetic:FA.5.

---

## GS.7. Local--global and equal-characteristic comparison

**Coverage: partial.** 7 nodes.

Seven nodes cover the Bernstein centre with the local parametrisation up to semisimplification, the stacks of restricted shtukas and the local excursion elements, the local-global compatibility itself, the nearby cycles over general bases that it uses, the distinction between semisimplification and monodromy, the GL_r local comparison with local shtuka uniformization, and the unramified Satake compatibility as the first case. The audit records ES7:equal-characteristic as a duplicate; RS-22 says to import it, which is what the packet does.

**Planets (5):** *Local parameters from the Bernstein centre*, *Restricted shtukas and local excursion elements*, *Local-global compatibility*, *Semisimplification versus monodromy*, *Local shtuka uniformization*.

### `bernstein-center-and-local-parameters`

*theorem* — **The Bernstein centre and local Langlands parameters up to semisimplification** · planet **Local parameters from the Bernstein centre**

**Statement.** Let G be a reductive group over a local field K of equal characteristic. The Bernstein centre of G(K) is, equivalently, the centre of the category of smooth representations of G(K) or the algebra of central distributions on G(K) acting as multipliers on the algebra of locally constant compactly supported functions; it acts by a character on every irreducible smooth representation with coefficients in an algebraic closure of Q_ell. There is a map associating with every character nu of the Bernstein centre with values in that closure a local Langlands parameter sigma_K(nu) up to semisimplification, that is, assuming G split to simplify, a conjugacy class of continuous semisimple morphisms from the Weil group of K to the dual group over that closure, defined over a finite extension of Q_ell. This is joint work of Genestier and V. Lafforgue.

**Hypotheses and conventions.**

- The parametrisation is only up to semisimplification; the survey records that one cannot hope for more in general, which the roadmap text repeats.
- The construction is for a local field of equal characteristic, which is why this layer is the equal-characteristic comparison and not a statement about p-adic fields.

**Proof outline.**

1. Define the Bernstein centre in both of its equivalent descriptions and prove that they agree.
2. Prove that it acts by a character on every irreducible smooth representation.
3. Construct the map from characters of the Bernstein centre to semisimple local parameters, by the local analogue of the excursion construction using stacks of restricted shtukas.
4. Record that the construction is only up to semisimplification.

**Acceptance.**

- In the case of GL_r the local correspondence was known by Laumon-Rapoport-Stuhler and by L. Lafforgue, with local-global compatibility without semisimplification.
- The local analogue in the p-adic setting is ExcursionOperatorsAndSpectralAction:ES0 and ES5, which construct the same objects for the Fargues-Scholze parametrisation.

**Prerequisites.** `mathlib:RootPairing`, `mathlib:ProfiniteGrp`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/reconstruction-of-a-langlands-parameter`, `ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`, `ExcursionOperatorsAndSpectralAction:ES5/abstract-semisimple-parameter`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic`

**Sources.**

- Section 9, p. 22, the ICM survey — “We recall that the Bernstein center of G(K) is defined, in two equivalent ways, as the center of the category of smooth representations of G(K), or the algebra of central distributions on G(K) acting as multipliers on the algebra of locally constant functions with compact support. On every irreducible smooth representation of G(K), the Bernstein center acts by a character.” *(The definition of the Bernstein centre.)*
- Section 9, p. 22, the ICM survey — “to every character nu of the Bernstein center of G(K) with values in an algebraic closure of Q_ell a local Langlands parameter sigma_K(nu) up to semisimplification, i.e. (assuming G split to simplify) a conjugacy class of morphisms from the Weil group of K to the dual group defined over a finite extension of Q_ell, continuous and semisimple.” *(The parametrisation and the semisimplification caveat.)*

### `restricted-shtukas-and-the-local-excursion-element`

*construction* — **Stacks of restricted shtukas and the local excursion element** · planet **Restricted shtukas and local excursion elements**

**Statement.** If all the Galois elements gamma_i lie in the decomposition group at a place v, the global excursion operator S_{I,f,(gamma_i)}, as an endomorphism of the cuspidal automorphic forms of level N, acts by multiplication by an element z_{I,f,(gamma_i)} of the ell-adic completion of the Bernstein centre of G(F_v) which depends only on the local data at v. That element is constructed using stacks of restricted shtukas, which are the analogues of truncated Barsotti-Tate groups: one truncates the shtuka structure to a finite level at v rather than imposing a global boundedness condition.

**Hypotheses and conventions.**

- The point is the dependence only on the local data: the global excursion operator is a priori an operator on a global space, and the theorem says that when the legs stay at v it is local.
- The restricted shtukas are the shtuka analogue of truncated Barsotti-Tate groups, which is the analogy that makes the construction work at finite level.

**Proof outline.**

1. Construct the stacks of restricted shtukas at a place v, truncating the modification to a finite level.
2. Construct the local excursion element z_{I,f,(gamma_i)} in the ell-adic completion of the Bernstein centre from their cohomology.
3. Prove that the global excursion operator acts by multiplication by that element when all the gamma_i lie in the decomposition group at v.
4. Record the dependence only on the local data.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FunctionField.restrictedShtuka` | data | The stack of shtukas restricted to a finite level at a place v. |
| `FunctionField.restrictedShtuka.truncation` | structure | The truncation morphisms between consecutive levels. |
| `FunctionField.localExcursionElement` | constructor | The element z_{I,f,(gamma_i)} of the ell-adic completion of the Bernstein centre. |
| `FunctionField.localExcursionElement_acts` | characterisation | When all the Galois elements lie in the decomposition group at v the global excursion operator acts by multiplication by that element. |
| `FunctionField.localExcursionElement_local` | relation | The element depends only on the local data at v. |
| `FunctionField.restrictedShtuka.barsottiTate` | example | The analogy with truncated Barsotti-Tate groups: the level-n restricted shtukas play the role of the n-torsion. |

**Where and how it is used.**

- *V. Lafforgue and Genestier, the local parametrisation.* The character of the Bernstein centre determined by these elements is what defines the local parameter sigma_K(nu).
- *GS.7's local-global compatibility node.* The equality of the semisimplification of the restriction of the global parameter with the local parameter is proved by comparing the two through these elements.
- *ExcursionOperatorsAndSpectralAction:ES0.* The local excursion operators in the Fargues-Scholze setting are constructed by the same pattern, with local shtukas in place of restricted shtukas.

**Unit tests.**

- `level_zero` — At level zero the restricted shtuka stack is the unramified Hecke correspondence and the element is the Satake element (the degenerate case).
- `locality` — The element depends only on the local data at v; a construction depending on the global level N away from v is wrong.
- `hecke` — For the two-leg excursion function and the tuple (Frob_v, 1) the element is the image of the spherical Hecke function h_{V,v} in the Bernstein centre.
- `not_global` — The global excursion operator for a tuple whose entries do not all lie in the decomposition group at v is not given by any element of the local Bernstein centre (the required non-example).

**Acceptance.**

- The elements z_{I,f,(gamma_i)} are the local excursion operators of the Genestier-Lafforgue construction and are the equal-characteristic analogue of the operators of ExcursionOperatorsAndSpectralAction:ES0.
- The proof uses nearby cycles over general bases, which are defined on oriented products of topoi.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.7/bernstein-center-and-local-parameters`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursion-operator`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/global-shtuka-stack`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/truncations-and-finite-type`, `HeckeStacksAndLocalShtukas:HS2/local-shtuka-moduli`, `ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator`

**Sources.**

- Section 9, p. 22, the ICM survey — “Technically we show that if all the gamma_i are in the decomposition group at v then the global excursion operator acts by multiplication by an element z_{I,f,(gamma_i)} of the ell-adic completion of the Bernstein center of G(F_v) which depends only on the local data at v. We construct z_{I,f,(gamma_i)} using stacks of restricted shtukas, which are analogues of truncated Barsotti-Tate groups.” *(The statement of the node, verbatim.)*

### `local-global-compatibility-up-to-semisimplification`

*theorem* — **Local-global compatibility up to semisimplification** · planet **Local-global compatibility**

**Statement.** Let X be a smooth projective geometrically irreducible curve over a finite field and let N be a level. If sigma is a global Langlands parameter and pi is an irreducible representation of G of the adeles, a restricted tensor product of local representations, such that the K_N-invariants of pi are nonzero and appear in H_sigma in the decomposition with level N, then for every place v of X there is an equality between the semisimplification of the restriction of sigma to the decomposition group at v and the semisimple local parameter sigma_K(nu), where nu is the character of the Bernstein centre by which it acts on the irreducible smooth representation pi_v. The proof uses nearby cycles over general bases, defined on oriented products of topoi.

**Hypotheses and conventions.**

- The statement is up to semisimplification on both sides, and the survey records that in general one cannot hope for more.
- For GL_r the local correspondence and local-global compatibility without semisimplification were known earlier, by Laumon-Rapoport-Stuhler and by L. Lafforgue.

**Proof outline.**

1. Construct the local excursion elements at v and prove that the global excursion operators with all legs at v act through them.
2. Identify the character of the Bernstein centre determined by those elements with the one by which the Bernstein centre acts on pi_v.
3. Identify the parameter attached to that character with the semisimplification of the restriction of sigma to the decomposition group at v, using the characterisation of both by the excursion functions.
4. Use nearby cycles over general bases to compare the global and the local cohomological constructions.

**Acceptance.**

- The nearby cycles used are those of Deligne, Laumon, Gabber, Illusie and Orgogozo over arbitrary bases, defined on oriented products of topoi.
- The statement is exactly the local-global compatibility that the roadmap text asks this layer to prove, beginning with unramified Satake and GL_r.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.7/restricted-shtukas-and-the-local-excursion-element`, `GlobalShtukasAndFunctionFieldLanglands:GS.7/bernstein-center-and-local-parameters`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-main-decomposition`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/reconstruction-of-a-langlands-parameter`, `GlobalShtukasAndFunctionFieldLanglands:GS.7/nearby-cycles-over-general-bases`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic`

**Sources.**

- Section 9, p. 22, the ICM survey — “If sigma is a global Langlands parameter and pi is an irreducible adelic representation whose K_N-invariants are nonzero and appear in H_sigma, then for every place v we have equality between the semisimplification of the restriction of sigma to the decomposition group at v and the local parameter sigma_K(nu), nu being the character by which the Bernstein centre acts on pi_v.” *(The statement of the node, verbatim.)*
- Section 9, p. 22, the ICM survey — “We use nearby cycles on arbitrary bases (Deligne, Laumon, Gabber, Illusie, Orgogozo), which are defined on oriented products of toposes.” *(The technical input.)*

### `nearby-cycles-over-general-bases`

*theorem* — **Nearby cycles over general bases and oriented products of topoi**

**Statement.** Nearby cycles over a general base, in the sense of Deligne, Laumon, Gabber, Illusie and Orgogozo, are defined on oriented products of topoi rather than over a trait, and they satisfy the finiteness and compatibility properties that make them usable for a comparison between the cohomology of a global object and of its local models. They are the technical device by which the comparison maps of this layer are constructed: the legs of a shtuka are allowed to approach the place v, and the nearby cycles at that degeneration relate the global cohomology to the cohomology of the restricted shtukas. There are no nearby cycles in either pinned library.

**Hypotheses and conventions.**

- The general-base theory is required because the base is a power of the curve and the degeneration is not over a trait; the classical theory over a discrete valuation ring does not suffice.
- Orgogozo's finiteness theorem, which says that after a modification of the base the nearby cycles are constructible and commute with base change, is what makes the comparison work.

**Proof outline.**

1. Construct the oriented product of two topoi and the vanishing-cycles topos over a general base.
2. Define the nearby cycles functor and prove its basic compatibilities.
3. Prove Orgogozo's finiteness theorem in the generality needed.
4. Apply the theory to the degeneration of the legs of a shtuka towards a place v.

**Acceptance.**

- The classical case of a trait is recovered when the base is the spectrum of a discrete valuation ring.
- This is the one piece of the comparison that is a general theorem of etale cohomology rather than a statement about shtukas, and it belongs by rights to EtaleDualityAndPerverseSheaves; it is requested there and recorded here because the layer cannot be closed without it.

**Prerequisites.** `mathlib:CategoryTheory.Sheaf`, `mathlib:AlgebraicGeometry.Scheme.ellAdicSheaf`, `EtaleDualityAndPerverseSheaves:EDC.6`, `EtaleDualityAndPerverseSheaves:EDC.0`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/global-shtuka-stack`

**Sources.**

- Section 9, p. 22, the ICM survey — “We use nearby cycles on arbitrary bases (Deligne, Laumon, Gabber, Illusie, Orgogozo), which are defined on oriented products of toposes and whose properties are recalled in the survey.” *(The statement of what is used and by whom it is due.)*

### `semisimplification-versus-monodromy`

*theorem* — **Semisimplification and monodromy must be kept distinct** · planet **Semisimplification versus monodromy**

**Statement.** In every comparison of this layer the object on the local side is a semisimple parameter, a conjugacy class of continuous semisimple morphisms from the Weil group to the dual group, and not a Weil-Deligne representation: the monodromy operator is not determined by the construction. Accordingly the local-global compatibility asserts an equality of semisimplifications and not an equality of Weil-Deligne parameters. In general one cannot hope for more than compatibility up to semisimplification. For GL_r the finer statement, with the monodromy, is known by the work of Laumon-Rapoport-Stuhler and of L. Lafforgue. There is no Weil-Deligne representation in either library.

**Hypotheses and conventions.**

- This is the distinction the roadmap text insists on; conflating the two would make the statements of this layer false.
- The failure is not a defect of the proof: the survey records that in general one cannot hope for more.

**Proof outline.**

1. Define a Weil-Deligne representation and the passage to its Frobenius-semisimplification.
2. Record that the Genestier-Lafforgue construction produces only the semisimple parameter.
3. Record the GL_r case, where the finer statement is known.
4. State the local-global compatibility of this layer in terms of semisimplifications only.

**Acceptance.**

- In the case of GL_r the local correspondence was known by Laumon-Rapoport-Stuhler and the local-global compatibility without semisimplification was known; in general only the semisimplification is available.
- The corresponding distinction in the Fargues-Scholze setting is recorded in ExcursionOperatorsAndSpectralAction:ES5 and ES7.

**Prerequisites.** `mathlib:RootPairing`, `mathlib:ProfiniteGrp`, `GlobalShtukasAndFunctionFieldLanglands:GS.7/bernstein-center-and-local-parameters`, `GlobalShtukasAndFunctionFieldLanglands:GS.7/local-global-compatibility-up-to-semisimplification`, `ExcursionOperatorsAndSpectralAction:ES5/abstract-semisimple-parameter`

**Sources.**

- Section 9, Remark 9.1, p. 22, the ICM survey — “In the case of GL_r the local correspondence was known by Laumon-Rapoport-Stuhler, with local-global compatibility without semisimplification. In general we cannot hope more than the local-global compatibility up to semisimplification.” *(The statement of the node, verbatim.)*

### `gl-r-local-comparison-and-uniformization`

*theorem* — **The GL_r local comparison and local shtuka uniformization** · planet **Local shtuka uniformization**

**Statement.** For GL_r the local Langlands correspondence was constructed by Laumon-Rapoport-Stuhler through the cohomology of the moduli of D-elliptic sheaves, and local-global compatibility holds without semisimplification. The comparison of the global parameter with that local correspondence is made through local shtuka uniformization: the completion of the global shtuka moduli along a suitable stratum is described by a moduli of local shtukas, and the induced map on nearby cycles is the comparison map. The level and boundedness hypotheses under which that uniformization holds must be preserved; the D-elliptic-sheaf realisation itself is owned by ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic and by HeckeStacksAndLocalShtukas:HS2 and HS3, and is imported here.

**Hypotheses and conventions.**

- The uniformization is a statement about a formal completion along a stratum and carries level and boundedness hypotheses; the roadmap text calls them source-gated and asks that they be preserved.
- The comparison maps are maps of nearby cycles, not isomorphisms of moduli; the conclusion is a comparison of cohomology, not of spaces.

**Proof outline.**

1. Import the moduli of local shtukas and its cohomology from HeckeStacksAndLocalShtukas.
2. Construct the uniformization map from the formal completion of the global moduli along a stratum, under the stated hypotheses.
3. Construct the induced comparison map on nearby cycles.
4. Compare with the GL_r local correspondence of Laumon-Rapoport-Stuhler and record that in that case the compatibility holds without semisimplification.

**Acceptance.**

- The audit records that GS.7 reuses the ES7 function-field branch as a local Langlands input, and that ES7:equal-characteristic owns the D-elliptic-sheaf realisation for the local field F_q((t)).
- RS-22 says to import HS2 and HS3 for the local endpoint and ES7:equal-characteristic for its specialised package, and that additional general-G ramified comparison proofs remain here.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.7/local-global-compatibility-up-to-semisimplification`, `GlobalShtukasAndFunctionFieldLanglands:GS.7/nearby-cycles-over-general-bases`, `GlobalShtukasAndFunctionFieldLanglands:GS.6/the-global-correspondence-for-gl-r`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/global-shtuka-stack`, `HeckeStacksAndLocalShtukas:HS2/local-shtuka-moduli`, `HeckeStacksAndLocalShtukas:HS3`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic`

**Sources.**

- Section 9, Remark 9.1, p. 22, the ICM survey — “In the case of GL_r the local correspondence was known by Laumon-Rapoport-Stuhler, with local-global compatibility without semisimplification.” *(The GL_r input imported here.)*
- Section 0, p. 4 of V. Lafforgue — “was studied by Laumon-Rapoport-Stuhler, Laurent Lafforgue, Ngo Bao Chau and Eike Lau, and arbitrary coweights introduced simultaneously by Ngo Bao Chau and Eike Lau.” *(The attribution of the D-elliptic-sheaf and general-coweight variants that the uniformization uses.)*

### `unramified-satake-as-the-first-case`

*application* — **Unramified Satake compatibility as the first case of local-global compatibility**

**Statement.** At a place v outside the level, the compatibility of the decomposition with the Satake isomorphism is exactly the local-global compatibility at v for the unramified local parameter: the operator T(h_{V,v}) acts on H_sigma by the character of V evaluated at sigma(Frob_v), and the unramified local parameter attached to the character of the Bernstein centre by which the spherical Hecke algebra acts on the unramified representation pi_v is the unramified parameter sending Frobenius to the Satake parameter. This is the first case of local-global compatibility, and the roadmap text asks that the layer begin with it and with GL_r.

**Hypotheses and conventions.**

- At an unramified place the Bernstein centre acts on an unramified representation through the spherical Hecke algebra, so the character nu is the Satake character and the local parameter is unramified.
- The statement is already contained in the main theorem of GS.5; it is recorded here as the base case of the comparison.

**Proof outline.**

1. Record the compatibility of the decomposition with the Satake isomorphism from GS.5.
2. Record that at an unramified place the character of the Bernstein centre on an unramified representation is determined by the spherical Hecke algebra.
3. Identify the associated local parameter with the unramified parameter determined by the Satake parameter.
4. Deduce the equality of semisimplifications at v, which is the first case of the comparison.

**Acceptance.**

- This is the case in which local-global compatibility is an immediate consequence of the construction and requires no nearby cycles.
- For GL_r the compatibility at the ramified places is also known, by L. Lafforgue, which is the content of GS.6's local factors node.

**Prerequisites.** `GlobalShtukasAndFunctionFieldLanglands:GS.5/satake-compatibility-and-chebotarev`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-main-decomposition`, `GlobalShtukasAndFunctionFieldLanglands:GS.7/bernstein-center-and-local-parameters`, `GlobalShtukasAndFunctionFieldLanglands:GS.1/unramified-hecke-algebra-and-satake-isomorphism`

**Sources.**

- Section 0, after Theorem 0.1, p. 3 of V. Lafforgue — “It is compatible with the Satake isomorphism at every place v of X minus N, that is for every irreducible representation V of the dual group, T(h_{V,v}) acts on H_sigma by multiplication by the scalar given by the character of V at sigma(Frob_v).” *(The unramified compatibility that is the first case of the comparison.)*

**What remains in GS.7.**

- The Genestier-Lafforgue construction of the local parametrisation is stated from the ICM survey; the joint paper itself was not read, so the construction of the local excursion elements is recorded at the level of the survey's description.
- Nearby cycles over general bases, on oriented products of topoi, are absent from both libraries and are requested from EtaleDualityAndPerverseSheaves:EDC.6. Orgogozo's finiteness theorem is the piece the comparison actually uses.
- Weil-Deligne representations are absent from both libraries; the node that keeps semisimplification and monodromy apart defines what it needs and requests the rest.
- The local shtuka uniformization is imported from HeckeStacksAndLocalShtukas:HS2 and HS3 and from ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic; the general-G ramified comparison proofs that RS-22 leaves here are stated and not proved.

---

## Dependencies on other roadmaps

| supplier | what is needed |
| --- | --- |
| `SchemeAndStackFoundations:SF.0` | The algebraic-stack formalism: stacks in groupoids over a site with an atlas and a representable diagonal, Artin and Deligne-Mumford stacks, quotient stacks, and the Quot construction. The reviewed audit AUDIT-20 records that Mathlib's stack notion is the descent condition for a pseudofunctor on a site, with no representability or atlas theory, and that no Deligne-Mumford stack exists. Bun_G, the Hecke stacks and the shtuka stacks are all objects of this kind. |
| `SchemeAndStackFoundations:SF.2` | Finite type, quasicompactness and smoothness for algebraic stacks, and the deformation theory of a stack including its cotangent complex, so that the smoothness and dimension of Bun_G and the finite type of the truncations can be stated and proved. The audit records that there is no cotangent complex for stacks. |
| `SchemeAndStackFoundations:SF.3` | The etale fundamental group of a scheme: the Galois-category structure on finite etale coverings of a connected scheme with a geometric point, and the comparison with the abstract theory Mathlib has. The audit records that Mathlib has abstract Galois categories with fibre functors and finite etale algebras with a fibre functor, but no Galois-category structure on finite etale coverings of a scheme. Drinfeld's lemma is a statement about that group. |
| `EtaleDualityAndPerverseSheaves:EDC.0` | Constructible ell-adic sheaves on a scheme, the six operations, proper base change and the smooth and proper base change theorems. The audit records that Mathlib defines ell-adic cohomology as pro-etale cohomology with Z_ell-coefficients and proves nothing about it, and that there is no six-functor formalism. |
| `EtaleDualityAndPerverseSheaves:EDC.2` | Cohomological correspondences, their composition, and the Grothendieck-Lefschetz trace formula. The identification of a Hecke operator with a creation-Frobenius-annihilation composite is an identity of cohomological correspondences, and the whole of GS.6 rests on the trace formula, which the audit records as absent. |
| `EtaleDualityAndPerverseSheaves:EDC.4` | Perverse sheaves, the perverse t-structure relative to a base, intersection complexes, the decomposition theorem and the smallness criterion, and universal local acyclicity. The audit records that there are no perverse sheaves in either library. Every sheaf appearing in GS.1, GS.2 and GS.3 is a perverse sheaf or an intersection complex. |
| `EtaleDualityAndPerverseSheaves:EDC.6` | Nearby and vanishing cycles over a general base, on oriented products of topoi, with Orgogozo's finiteness theorem. This is the technical input of the local-global comparison of GS.7 and the audit records that there are no nearby cycles in either library. |
| `DeligneWeightsAndPurity:DWP.0` | The foundations of weights for ell-adic sheaves over a finite field: Tate twists, the half-Tate twist that the Satake normalisation of GS.1 requires, and the conventions on Frobenius eigenvalues. The modified commutativity constraint and the correction factor q^{-d/2} in the identification of a Hecke operator with an excursion composite are stated against them. |
| `DeligneWeightsAndPurity:DWP.10` | Purity in the range relevant to the GL_r correspondence, that is the archimedean estimate on Hecke eigenvalues known as the Ramanujan-Petersson conjecture for GL_r over a function field, which GS.6 records as one of the conclusions in the range of the theorem. |
| `EtaleDualityAndPerverseSheaves:EDC.5` | Compactifications and boundary strata in the etale setting, with the comparison of the cohomology of a compactification with that of the open part, which is the general machinery the compactification and boundary analysis of GS.6 instantiates. |
| `DeligneWeightsAndPurity:DWP.7` | Weights, purity and the Weil conjectures for the cohomology of a variety over a finite field, in the form needed for the trace computation of GS.6 and for the purity statement in the range of the GL_r correspondence. |
| `FunctionFieldArithmetic:FA.1` | The adele ring of a function field, the idele class group, the finiteness of the class number and of ker^1(F, G), and the classification of inner forms. Weil uniformization and the nonsplit descent of GS.0 are stated against these. |
| `FunctionFieldArithmetic:FA.4` | Global class field theory for a function field: the reciprocity isomorphism from the abelianized fundamental group of X, fibred over the profinite completion of Z, to Pic(F_q), characterised by sending Frob_v to the class of O(v). This is the rank-one case of GS.6 and the acceptance test of GS.0's GL_1 node; the audit records that it is absent. |
| `FunctionFieldArithmetic:FA.5` | Grothendieck L-functions of ell-adic sheaves on a curve over a finite field with their functional equations, Laumon's product formula, and the converse theorems of Hecke, Weil and Piatetski-Shapiro. These are the three external inputs of Deligne's recurrence principle, which is the backbone of the induction on the rank in GS.6. |
| `FunctionFieldArithmetic:FA.6` | The space of cuspidal automorphic forms for a reductive group over a function field, with its Hecke module structure, its finite dimensionality and the strong multiplicity one theorem. The audit records that there are no automorphic forms over a function field in either library, and names FA.6 as the owner of the cusp-form space that GS.3's trivial-representation acceptance case must match. |
| `GeometricSatakeAndFusion:GS2` | The Satake category with its fibre functor, its convolution and its monoidal structure, and the identification of the dual group. The reviewed audit records GeometricSatakeAndFusion:GS2 as owning the Satake objects and convolution and GS0 as owning the Beilinson-Drinfeld Grassmannians and loop groups. This packet imports those by node identifier and plans only the classical equal-characteristic statement over powers of the global curve, as RS-22 prescribes. |
| `GeometricSatakeAndFusion:GS4:classical-Satake-comparison` | The comparison of the geometric Satake equivalence with the classical Satake isomorphism of the unramified Hecke algebra, in the normalisation with the half-Tate twist. GS.1's unramified Hecke node is stated against it. |
| `HeckeStacksAndLocalShtukas:HS3` | The cohomology of local shtuka moduli with its compactness, admissibility and duality properties, which is the local endpoint of the comparison of GS.7. RS-22 says to import HS2 and HS3 for that endpoint. |
| `DrinfeldModulesAndTModules:DM.7` | Rank-r elliptic sheaves and their moduli, which the audit records as the specialised realisation of a global shtuka that DM.7 constructs. GS.2 imports it and does not plan it; RS-22 says it remains an optional specialised realisation and not a prerequisite. |
| `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic` | The D-elliptic-sheaf realisation and the local-parameter package for the local field F_q((t)), which the audit records ES7:equal-characteristic as owning and which RS-22 says GS.7 should import for its specialised local endpoint. |

Node prerequisites that resolve inside other packets are taken from the reviewed
`GeometricSatakeAndFusion--GS0.json` and `--GS3.json` (the loop groups and Schubert bounds, the Satake
category with its fibre functor, the convolution and dualizability statement, the fusion product with its
sign rule, the dual-group identification and the Chevalley involution), from
`HeckeStacksAndLocalShtukas.json` (the global Hecke correspondence and the local shtuka moduli) and from
`ExcursionOperatorsAndSpectralAction--ES0.json` and `--ES5.json` (the Bernstein centre of a category and the
abstract semisimple parameter, used in GS.7). Those are imported by node identifier and are never re-planned
here. The six other supplier roadmaps the issue names have no packet yet, so every dependency on them is a
request against a stage identifier; a `restructure` entry asks that a link job convert them when those
packets land.

## Gaps

### Only the introduction of L. Lafforgue's paper was read

GS.6 rests on Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands, IHES preprint M/00/70, SHA-256 af732dac..., 241 printed pages. Two pages of introduction were read: the statement of the theorem with both assertions, the two uniqueness statements, the rank-one case, the recurrence on the rank with its three external inputs, the definition of Cht^r_N with its dimension, its partial Frobenius morphisms and its Hecke action, the absence of an open of finite type stable under those, the truncation by the Harder-Narasimhan polygon, and the shape of the Arthur-Selberg fixed-point count. Nothing of chapters I to VIII was read, and the preparatory book on the trace-formula computation and on iterated shtukas was not read at all. Every GS.6 node therefore states a result and describes a method without a proof read from the source. Next source action: read chapters I and II of the preprint for the compactification and the boundary, then the chapters on the trace computation, and read the preparatory book.

### Only the introduction of V. Lafforgue's paper was read

The introduction, pp. 2-31, is a complete and largely self-contained account of the construction, and every statement cited in this packet is taken from it with its numbering and with the pointer the introduction gives to the chapter where it is proved. The bodies of chapters 1 to 14 were not read. The proofs that the introduction sketches rather than gives, and that a continuation must read, are: proposition 6.2 for the general case of the identification of a Hecke operator with an excursion composite, proposition 8.27 and corollary 8.34 for the Hecke-finite part and the specialisation isomorphism, proposition 8.23 for the identification of Hecke-finiteness with cuspidality, proposition 9.7 for the properties of the functor H, proposition 11.7 for the reconstruction of a parameter, and chapter 12 for the nonsplit case and the two conjectures. Next source action: read chapters 6 to 12 in that order.

### The geometric Satake equivalence is used as a black box

Theorem 0.9 of the source is stated as one direction of the geometric Satake equivalence and is attributed to Lusztig, Drinfeld, Ginzburg and Mirkovic-Vilonen, with references the source gives and which were not followed. This packet plans the functor and its four compatibilities as GS.1 nodes because the roadmap text assigns the classical equal-characteristic statement to GS.1, but the proof is not in either source read here and the reviewed audit records that GeometricSatakeAndFusion owns the general equivalence. Next source action: read Mirkovic and Vilonen, Geometric Langlands duality and representations of algebraic groups over commutative rings, and the Beilinson-Drinfeld chiral-algebras manuscript, for the fusion product and the commutativity constraint.

### The Genestier-Lafforgue local construction was not read

GS.7 rests on joint work of Alain Genestier and Vincent Lafforgue, described in section 9 of the ICM survey in about one page. The construction of the local excursion elements through stacks of restricted shtukas, the properties of those stacks and the proof of the local-global compatibility are described and not proved there, and the joint paper itself was not obtained. Next source action: obtain Genestier and Lafforgue, Chtoucas restreints pour les groupes reductifs et parametrisation de Langlands locale, and read the construction of the restricted shtukas and of the local parameters.

### Nearby cycles over general bases have no source in this packet

The survey names Deligne, Laumon, Gabber, Illusie and Orgogozo for nearby cycles on arbitrary bases, defined on oriented products of topoi, and says that their properties are recalled in a survey it cites; that survey was not read. The finiteness theorem of Orgogozo is the piece the comparison of GS.7 actually uses. Next source action: read Orgogozo, Modifications et cycles proches sur une base generale, and Illusie's survey on vanishing cycles over general bases.

### The Blasius-Lapid examples are cited and not verified

The survey states that for some groups other than GL_r there exist finite groups and pairs of nonconjugate morphisms to the dual group whose values are conjugate element by element, so that two nonconjugate global parameters can give the same characters of every unramified Hecke algebra. This is the reason excursion operators with more than two legs are necessary and is recorded as a required non-example in GS.5. The examples themselves were not read. Next source action: read Blasius, On multiplicities for SL(n), and Lapid's note on the same phenomenon.

### The finite dimensionality of H_{I,W} is not available

The source proves only that H_{I,W} is an inductive limit of finite dimensional continuous representations of the I-fold product of the Galois group, and says explicitly that finite dimensionality is delicate and available only for split groups at the time of writing. Its argument is arranged so as not to need it. This packet follows the source exactly and records the limitation in the node and in the coverage; a continuation must not assume finite dimensionality.

### Whether the excursion algebra is reduced is unknown

The source states twice that it does not know whether B is reduced, and that consequently the decomposition is into generalized eigenspaces rather than eigenspaces and the excursion operators are not known to be simultaneously diagonalisable. This is the obstruction to proving the conjectural decomposition of GS.3 and to Drinfeld's heuristic. It is not a reading gap but a gap in the mathematics, and it is recorded here so that no continuation states the decomposition in a stronger form than the source does.

## Structural proposals

### 1. GS.4 and GS.5 duplicate ExcursionOperatorsAndSpectralAction:ES0 and ES5, and the two owners have now filed requests to each other

*kind: `note-duplicate-boundary`.* The reviewed audit AUDIT-20 records ES0 as a duplicate of GS.4 and GS.5 (the creation, Weil-element and annihilation composition and its relations) and ES5 as a duplicate of GS.5 (the assignment of a semisimple parameter to an excursion character). The accepted restructuring RS-22 keeps GS.5, on the ground that the local Weil-group theorem is not already a theorem for the global Galois group. The ES0 and ES5 packets, written earlier in this programme, already file requests to GlobalShtukasAndFunctionFieldLanglands:GS.5 for exactly the global statements, and this packet plans them. The two roadmaps are therefore now consistent, and the shared material is planned once, here. Proposal: record the resolution in the audit's duplicate notes, so that a future reader of AUDIT-20 sees which of the two layers owns the construction rather than only that they overlap.

### 2. GS.1's stage text does not say that the Satake category itself is imported

*kind: `note-layer-boundary`.* GS.1's text asks for the classical equal-characteristic geometric Satake equivalence with its pinning and commutativity constraint. The audit records GeometricSatakeAndFusion:GS2 as owning the Satake objects and convolution and GS0 as owning the Beilinson-Drinfeld Grassmannians and loop groups, and RS-22 keeps GS.1 on the ground that the Fargues-Fontaine Satake roadmap does not supply this theorem by a change of notation. Both are right, but a reader of GS.1 alone cannot tell which half is imported. Proposal: add a sentence to GS.1's text saying that the Satake category, its fibre functor and the identification of the dual group are imported from GeometricSatakeAndFusion, and that what GS.1 owns is the statement over powers of the global curve with the relative perverse normalisation, the fusion and convolution compatibilities and the identification with intersection complexes.

### 3. GS.6 should be divided, because its two halves have different sources and different states of knowledge

*kind: `split-layer`.* GS.6 asks for four things: the compactification of the shtuka varieties and the analysis of its boundary; the negligible-cohomology argument and the induction on the rank; the trace formula and the matching of Hecke and Frobenius terms; and the correspondence itself with its local factors, purity and multiplicity conclusions. The first three are the machinery of a 241-page paper whose body has not been read by any worker; the fourth is a statement that can be stated and used immediately, and is what every other roadmap imports. As one layer GS.6 can never be closed and a reader cannot see which part a consumer needs. Proposal: divide GS.6 into GS.6:statement, carrying the correspondence with its uniqueness, local factors and rank-one case, and GS.6:proof, carrying the compactification, the boundary, the negligible cohomology, the induction and the trace formula.

### 4. Six of the seven suppliers the issue names have no packet yet

*kind: `note-empty-supplier`.* The issue names BP-DeligneWeightsAndPurity--DWP.0, BP-DeligneWeightsAndPurity--DWP.7, BP-EtaleDualityAndPerverseSheaves--EDC.0, BP-EtaleDualityAndPerverseSheaves--EDC.4, BP-FunctionFieldArithmetic and BP-SchemeAndStackFoundations as suppliers and says to reuse their packets' node identifiers where the packets exist and to file requests otherwise. None of those packets exists in research/blueprint/packets at the time of writing, so every one of those dependencies is filed as a request against a stage identifier rather than as a node prerequisite. Only GeometricSatakeAndFusion, HeckeStacksAndLocalShtukas, ExcursionOperatorsAndSpectralAction and PerfectoidSpaces have packets, and this packet uses their node identifiers where it can. Proposal: when those six packets land, a link job should convert the corresponding requests here into node prerequisites; the requests name precisely what is wanted so that the conversion is mechanical.

## Acceptance tests for the roadmap

The stage texts name acceptance cases for several layers, and they are carried by nodes of this packet.

- **GS.0, the GL_1 case.** `picard-and-the-gl1-case`, with the Lang isogeny and the Abel–Jacobi map, and the
  `gl_one` test of `bun-g-of-the-global-curve`; the reciprocity isomorphism itself is requested from
  `FunctionFieldArithmetic:FA.4`.
- **GS.1, the classical Satake normalisation.** The `modified-commutativity-and-tate-twist` node and the
  `minuscule` and `gl_r_standard` tests of `bounded-strata-and-schubert-bounds`.
- **GS.2, the Drinfeld case.** The `drinfeld_gl_r` and `empty_legs` tests of `global-shtuka-stack`: for
  `GL_r`, `I` of size two and `W = St ⊠ St*` the two partitions give Drinfeld's left and right shtukas, and
  for `I` empty the stack is `Bun_{G,N}(F_q)`.
- **GS.3, the trivial-representation case.** `cuspidality-equals-hecke-finiteness` and the `empty` test of
  `the-functor-H-I-W`: `H_{∅,1}` is the space of cuspidal automorphic forms, which is what must match
  `FunctionFieldArithmetic:FA.6`.
- **GS.5, the unramified compatibility and the Blasius–Lapid obstruction.** The `hecke` test of
  `excursion-operator` and the `two_legs_not_enough` test of the same node, together with
  `satake-compatibility-and-chebotarev`.
- **GS.6, the rank-one case.** `rank-one-is-class-field-theory` and the `rank_one` test of
  `drinfeld-shtuka-varieties-of-rank-r`.
- **GS.7, the first case of local–global compatibility.** `unramified-satake-as-the-first-case`, and the
  `not_global` test of `restricted-shtukas-and-the-local-excursion-element`, which is the required
  non-example.

## What is not claimed

Nothing in this packet is claimed to be formalised. Every `implementationStatus` is `unchecked`, the suggested
Lean file proves everything by `sorry`, and it was not compiled: the Mathlib build on this machine is a shared
cache that must not be rebuilt and this working tree has no elaborated dependency modules. The words
“optional”, “deferred” and “later” do not appear in this document or in the packet.
