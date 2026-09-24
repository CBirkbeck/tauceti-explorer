# Isocrystals, vector bundles and Banach–Colmez spaces (part from VB0)

Blueprint for the roadmap `VectorBundlesAndIsocrystals`, job `BP-VectorBundlesAndIsocrystals--VB0` (issue #1002).
Packet: `research/blueprint/packets/VectorBundlesAndIsocrystals--VB0.json` (`"part": "VB0"`). Suggested Lean
file: `research/blueprint/suggested/VectorBundlesAndIsocrystals--VB0.lean`. Handoff:
`research/blueprint/handoff/BP-VectorBundlesAndIsocrystals--VB0.md`.

This part covers `VB0`, `VB1` and `VB2` with its two substages. `VB3` and `VB4` belong to
`BP-VectorBundlesAndIsocrystals--VB3` (issue #1003).

**Status: partial.** All five layers in scope are decomposed, none is closed. The packet has 13 nodes
(one definition, one construction, 8 theorems, two lemmas, one comparison), 15 API items, 9 unit tests and
10 planets; it cites 30 declarations of the pinned libraries, records 9 gaps, makes 10 requests and 2
structural proposals.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Sources, and one hash that does not reproduce

Two of the three sources reproduce their recorded SHA-256 **byte for byte**. The third does not, and the reason
and the consequences were traced rather than left as a bare failure.

- **`FS-geometrization`** — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*. Author-hosted 356-page PDF (MPIM Bonn), inspected 2026-09-15; corresponds to arXiv:2102.13459v4 by metadata and contents, not by byte comparison. PDF page = printed page.
  <https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf>, read 2026-09-16.
  SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905` — reproduced 24 September 2026.
- **`FF18-courbes`** — Laurent Fargues, Jean-Marc Fontaine (with a preface by Pierre Colmez), *Courbes et fibres vectoriels en theorie de Hodge p-adique*. Book PDF, 400 pages, printed pages running to 389; published as Asterisque 406, SMF 2018. Colmez's preface occupies printed pp. 1-50 and is NOT part of the Fargues-Fontaine text. Printed page = PDF page - 10. Correspondence with the printed Asterisque volume was not byte-verified.
  <https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf>, read 2026-09-16.
  SHA-256 `cc159f38a3801c736b71ecea363496abe7706550bfb416600718ee9933922ca3` — **does NOT reproduce**; see below.
- **`SW13-moduli`** — Peter Scholze, Jared Weinstein, *Moduli of p-divisible groups*. arXiv:1211.6357v2 [math.NT], 13 April 2013 (published Camb. J. Math. 1 (2013) 145-237); library PDF, printed page = PDF page
  <https://arxiv.org/abs/1211.6357>, read 2026-09-16.
  SHA-256 `984411ef6c3d735a713684d4c9251fbad411a40eab33cefed8ab5c8412b09f6d` — reproduced 24 September 2026.

### The Fargues–Fontaine file has changed, and the printed pages moved by exactly 50

The file at the recorded URL was downloaded again in this session. Its SHA-256 is
`8c020573d3dce341088ea7e83fe1063b410686c08e3a144fa3c0de634667cc79`; the record says
`cc159f38a3801c736b71ecea363496abe7706550bfb416600718ee9933922ca3`. The author's page carries a living version of
the book. The current file was extracted — its object streams inflated and its text operators read — and checked
against the locators. Two things came out.

**Every cited statement number is present and unchanged:** Définition 5.5.1, Théorème 5.5.4, Définition 5.5.5,
Proposition 5.5.6, §8.2.3 *Lien avec les isocristaux*, Définition 8.2.5, Proposition 8.2.6, Définition 8.2.7,
Proposition 8.2.8, Remarque 8.2.9 and Théorème 8.2.10.

**Every printed page number is uniformly 50 lower:**

| locator | recorded printed page | found in the current file |
| --- | --- | --- |
| §5.5 *Filtrations de Harder–Narasimhan* | pp. 212–215 | p. 162 |
| Définition 8.2.5 | p. 286 | p. 236 |
| Proposition 8.2.8 | pp. 287–288 | p. 236 |
| Théorème 8.2.10 | p. 288 | p. 238 |

The current file has 404 PDF pages where the record says 400. **Fifty is exactly the length of Colmez's**
**preface**, which the record's own `edition` field puts at printed pp. 1–50: the version the decomposition read
paginates preface and main text continuously, and the current file restarts the main text at 1. So the
mathematical half of every Fargues–Fontaine locator is corroborated here, and a reader of the current file should
subtract 50 from the page half.

## What the pinned libraries have, and what they do not

`data/library-coverage.json` has **no reviewed audit entry for this roadmap**, so the pinned declaration index was
searched directly, and `Mathlib/RingTheory/WittVector/Isocrystal.lean` was read at the pinned commit.

**Present, and cited rather than planned:**

- `WittVector.Isocrystal`, `IsocrystalHom`, `IsocrystalEquiv`, `StandardOneDimIsocrystal` and
  **`isocrystal_classification`** — the rank-one case of Dieudonné–Manin over an algebraically closed field of
  characteristic `p`, already proved in Lean. Plus `FractionRing.frobenius` and `frobeniusRingHom`, which give
  `K(p,k) = W(k)[1/p]` with Frobenius as an **automorphism** for `k` perfect.
- `IsPrincipalIdealRing`, `IsDedekindDomain`, `ValuationRing`, `AlgebraicGeometry.Scheme`,
  `AlgebraicGeometry.IsProper`, `IsAlgClosed`, `PerfectRing`, `IsFractionRing` — the commutative-algebra and
  schematic half of VB2.
- `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `TauCeti.Huber.Pair`, `TauCeti.ValuationSpectrum.spa`.

**Absent, at both pins:** `HarderNarasimhan`, `Semistable`, `SemiStable`, `PicardGroup`, and any ampleness in the
algebro-geometric sense. The slope formalism of VB1 is entirely new work.

## VB0. Isocrystals and slope conventions

**This is the layer the pinned libraries reach furthest into.**
`Mathlib/RingTheory/WittVector/Isocrystal.lean` at `082e2d3` already has `WittVector.Isocrystal` — a vector space over
`K(p,k) = W(k)[1/p]` with a bijective Frobenius-semilinear map, which *is* the category `φ-Mod_L` of this layer for
`E = Q_p` — together with `IsocrystalHom`, `IsocrystalEquiv`, `StandardOneDimIsocrystal m` for `m ∈ ℤ`, and the theorem
`isocrystal_classification`: over an algebraically closed field of characteristic `p`, a **one-dimensional** isocrystal
is isomorphic to a standard one. That is the rank-one case of Dieudonné–Manin, proved in Lean, at the pin.

So the node cites all of that and plans what is missing: the general-`E` version over
`L_E = W_{O_E}(F̄_q)[1/π]` with `σ_E`; the higher-rank blocks `φ^h = π^{-d}σ^h` with `gcd(d,h) = 1`; Dieudonné–Manin in
all dimensions, which the decomposition records as quoted and never proved in anything read; and the functor `E(D,φ)`
to bundles.

Three things about the definition have to survive. The category depends on `E` and **not only on `L`**: if `E'|E` is
unramified then `L_E = L_{E'}` but `φ-Mod_{L_E} ≠ φ-Mod_{L_{E'}}`, and Fargues–Fontaine flag the abuse of notation
themselves — so a Lean signature carrying only the Witt ring cannot even express the block's `π^{-d}`. `φ` is a
semilinear **isomorphism**, not merely an injection. And the sign: the block `φ(e_h) = π^{-d}e_1` has isocrystal slope
`-d/h` and gives a bundle of slope `+d/h`, which is Fargues–Scholze's *"note the change of sign — the functor `E`
reverses slopes"*. The atlas stage text uses the opposite normalisation. The packet records both and says the sign must
be fixed once.

The division algebra `D_λ = E_h[Π]` with `Π^h = π^d` and `Πx = σ_E(x)Π` is the endomorphism algebra of `O_X(λ)`; the
proof is a dimension count against `O_X(λ) ⊗ O_X(-λ) ≅ O_X^{h²}`. The **Brauer invariant is not computed** in anything
read, and the stage text makes it an obligation — carried as a gap.

**Coverage: `partial`.** Isocrystals over L = W_{O_E}(F_q-bar)[1/pi] with the standard slope block, the division algebra D_lambda, and the change-of-coefficient-field adjunction. This is the layer the pinned libraries reach furthest into: Mathlib already has WittVector.Isocrystal, IsocrystalHom, IsocrystalEquiv, StandardOneDimIsocrystal and isocrystal_classification, which is the one-dimensional case of Dieudonne-Manin over an algebraically closed field. What this layer adds is the general-E version, the higher-rank blocks and the functor to bundles.

Remaining in this layer:

- The Dieudonne-Manin classification itself was NOT read in a source that proves it. Fargues-Fontaine Prop. 8.2.6 quotes it ('Du theoreme de Dieudonne-Manin on deduit le resultat suivant'); the only statement inspected is in Pierre Colmez's preface to the volume (Prop. 2.36, printed p. 26), which is a survey and gives no proof. The E-ramified version over L = W_{O_E}(F_q-bar)[1/pi] was not located with a proof.
- The Brauer invariant of D_lambda and its compatibility with the cyclic-algebra presentation - which the stage text makes an explicit obligation - is NOT in the passages read; Fargues-Fontaine give only the presentation and the dimension count.
- Fargues-Fontaine Proposition 5.6.23(4), used to compute dim_E End(O(lambda)) = h^2, was not read.
- Descent forms of isocrystals over a non-algebraically-closed perfectoid field are not covered by anything read.

### `isocrystal-category-and-standard-block` — Isocrystals over L = W_{O_E}(F_q-bar)[1/pi] and the standard slope block

*definition.* **Planet: Isocrystals and the standard slope block.**

**Statement.** Let L = W_{O_E}(F_q-bar) (i.e. E-breve's ring of integers) with its Frobenius sigma; phi-Mod_L is the category of finite-dimensional L-vector spaces D with a sigma-linear isomorphism phi. For coprime d, h with h > 0 the standard block has basis e_1,...,e_h with phi(e_i) = e_{i+1} for i < h and phi(e_h) = pi^{-d} e_1, so phi^h = pi^{-d} sigma^h. Fargues-Fontaine's functor E(D,phi) sends it to a bundle isomorphic to the direct sum of O_X(-lambda)^{m_lambda}, where m_lambda is the multiplicity of the slope lambda in the Dieudonne-Manin decomposition; it is compatible with tensor products and duals.

**Hypotheses that must not be dropped.**

- The category depends on E and not only on L: if E'|E is unramified then L_E = L_{E'} but phi-Mod_{L_E} differs from phi-Mod_{L_{E'}}; Fargues-Fontaine flag this abuse of notation explicitly
- phi is required to be a sigma-linear ISOMORPHISM (bijective), not merely injective
- The residue field of L is algebraically closed (F_q-bar); the Dieudonne-Manin decomposition is used in that setting only
- The block convention phi(e_h) = pi^{-d} e_1 gives slope -d/h for the isocrystal and slope +d/h for the associated bundle; the atlas stage text uses the opposite block normalization phi^r = pi^s sigma^r, for which E(-) yields O(-s/r). The sign must be fixed once and recorded.

**Proof outline.**

1. Fargues-Fontaine define phi-Mod_L (Def. 8.2.5), form the graded P-module M(D,phi) = direct sum over i in N of (D tensor_L B)^{phi = pi^i}, and identify M of the standard block with the module M(d,h) computed in the preceding section.
2. Proposition 8.2.6 then deduces from the Dieudonne-Manin theorem that E(D,phi) := the sheaf associated to M(D,phi) is a vector bundle isomorphic to the sum of O_X(-lambda)^{m_lambda}.
3. Compatibility with tensor products and duals is asserted as part of Prop. 8.2.6; the alternative description as (Y x D)/phi^Z is Remark 8.2.9.
4. Fargues-Scholze use the same functor with the normalization O_{X_S}(n) = E(E-breve, pi^{-n} sigma) and record 'note the change of sign - the functor E reverses slopes'.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `IsocrystalE` | data | phi-Mod_{L_E}: finite-dimensional L_E-vector spaces with a sigma_E-linear ISOMORPHISM, where L_E = W_{O_E}(F_q-bar)[1/pi]. Mathlib's WittVector.Isocrystal is exactly this for E = Q_p; what is added here is the ramified and unramified general-E version. |
| `IsocrystalE.dependsOnE` | structure | The category depends on E and not only on L: if E'\|E is unramified then L_E = L_{E'} but phi-Mod_{L_E} differs from phi-Mod_{L_{E'}}. Fargues-Fontaine flag this abuse of notation explicitly, and any Lean signature must carry E, not only its Witt ring. |
| `standardBlock` | data | For coprime d and h > 0 the block with basis e_1,...,e_h, phi(e_i) = e_{i+1} for i < h and phi(e_h) = pi^{-d} e_1, so phi^h = pi^{-d} sigma^h. Mathlib has the rank-one case as WittVector.StandardOneDimIsocrystal m; the higher-rank blocks are what this node adds. |
| `standardBlock.slope` | characterisation | The block has isocrystal slope -d/h and gives a bundle of slope +d/h. The sign must be fixed once: the atlas stage text uses the opposite normalisation phi^r = pi^s sigma^r, for which E(-) yields O(-s/r). |
| `bundleOfIsocrystal` | data | The functor E(D,phi), sending a block to the direct sum of O_X(-lambda)^{m_lambda} with m_lambda the multiplicity of lambda in the Dieudonne-Manin decomposition. |
| `bundleOfIsocrystal.monoidal` | compatibility | Compatibility with tensor products and duals, asserted as part of Proposition 8.2.6. |
| `bundleOfIsocrystal.reversesSlopes` | structure | Fargues-Scholze's normalisation O_{X_S}(n) = E(E-breve, pi^{-n} sigma), with their own parenthesis: 'note the change of sign - the functor E reverses slopes'. |

Derived from where the object is used:

- in `VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra` — D_lambda is by construction the endomorphism algebra of the simple isocrystal of slope -lambda, and the functor transports it to End(O_X(lambda))
- in `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles` — the classification says the functor is a bijection on isomorphism classes, so this is the source of the classifying objects
- in `VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction` — the adjunction is between these categories for E and for E', and the functor intertwines it with pullback and pushforward on the curve

**Unit tests.** A plausible wrong definition fails one of these.

- `agrees_with_mathlib_over_Qp` — For E = Q_p the category must agree with the pinned WittVector.Isocrystal, and the rank-one blocks with WittVector.StandardOneDimIsocrystal. A definition that does not is a replacement of the library, not an extension.
- `rank_one_classification_is_pinned` — Over an algebraically closed field of characteristic p, Mathlib's WittVector.isocrystal_classification already gives the one-dimensional case of Dieudonne-Manin; the higher-rank case is what remains, and it must restrict to the pinned statement.
- `depends_on_E_not_only_on_L` — For E'|E unramified of degree 2, L_E = L_{E'} but the two categories differ. A signature carrying only the Witt ring cannot express the standard block's pi^{-d}, and is wrong.
- `standard_block_rank_and_degree` — The standard block of slope d/h gives O_X(d/h) of rank h and degree d; a sign error here inverts every slope statement downstream.
- `tensor_and_dual` — Slopes add under tensor and negate under dual on two explicit blocks; the functor is monoidal, and a construction that is not cannot support the classification.

**Acceptance.**

- Check the standard block of slope d/h against O_X(d/h) having rank h and degree d
- Check tensor additivity and dual negation of slopes on two explicit blocks
- Check that the category really depends on E by comparing phi-Mod_{L_E} and phi-Mod_{L_{E'}} for E'|E unramified of degree 2

**Prerequisites.** `RelativeFarguesFontaine:RF0:integral-Y`, `mathlib:WittVector`, `mathlib:WittVector.frobenius`, `mathlib:WittVector.FractionRing.frobenius`, `mathlib:WittVector.FractionRing.frobeniusRingHom`, `mathlib:WittVector.Isocrystal`, `mathlib:WittVector.IsocrystalHom`, `mathlib:WittVector.IsocrystalEquiv`, `mathlib:WittVector.StandardOneDimIsocrystal`, `mathlib:WittVector.isocrystal_classification`, `mathlib:IsAlgClosed`, `mathlib:PerfectRing`, `mathlib:IsFractionRing`, `mathlib:CategoryTheory.MonoidalCategory`

**Sources.**

- `FF18-courbes` — Laurent Fargues, Jean-Marc Fontaine (with a preface by Pierre Colmez), *Courbes et fibres vectoriels en theorie de Hodge p-adique*, Definition 8.2.5 and the remark after it, printed p. 286.

  > On note phi-Mod_L la categorie des isocristaux formes d'un L-espace vectoriel de dimension finie muni d'un isomorphisme sigma-lineaire. ... Remarquons cependant qu'il s'agit la d'un abus de notation puisque cette categorie ne depend pas seulement de L_E mais egalement de E (si E'|E est non-ramifiee alors L_E = L_{E'}).

  Fixes the definition and the E-dependence caveat that the stage text needs.
- `FF18-courbes` — Laurent Fargues, Jean-Marc Fontaine (with a preface by Pierre Colmez), *Courbes et fibres vectoriels en theorie de Hodge p-adique*, Before Proposition 8.2.6, printed p. 287.

  > Si D = <e_1, ..., e_h> avec phi(e_i) = e_{i+1} si i < h et phi(e_h) = pi^{-d} e_1 alors M(D,phi) = M(d,h).

  The explicit standard block with its Frobenius normalization.
- `FF18-courbes` — Laurent Fargues, Jean-Marc Fontaine (with a preface by Pierre Colmez), *Courbes et fibres vectoriels en theorie de Hodge p-adique*, Proposition 8.2.6, printed p. 287.

  > C'est un fibre vectoriel isomorphe a la somme directe sur lambda dans Q de O_X(-lambda)^{m_lambda} ou m_lambda est la multiplicite de la pente lambda dans la decomposition de Dieudonne-Manin de (D,phi). Cela definit un foncteur compatible au produit tensoriels et aux duaux.

  The slope-reversal statement and the tensor/dual compatibility.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, II.2 preamble, printed p. 58.

  > We denote by O_{X_S}(n) the image of (E-breve, pi^{-n} sigma) (note the change of sign - the functor E reverses slopes).

  Fargues-Scholze's normalization, which the roadmap follows.

### `endomorphism-division-algebra` — The endomorphism division algebra D_lambda of the stable bundle O_X(lambda)

*theorem.* **Planet: The division algebra D_lambda.**

**Statement.** For lambda = d/h in lowest terms with h > 0, let D_lambda be the central division algebra over E given by D_lambda = E_h[Pi] with Pi^h = pi^d and Pi x = sigma_E(x) Pi for all x in E_h, where E_h is the unramified extension of E of degree h. Then there is an isomorphism D_lambda -> End(O_{X_E}(lambda)).

**Hypotheses that must not be dropped.**

- lambda = d/h with gcd(d,h) = 1 and h > 0; E_h is the degree-h unramified extension of E inside E-bar
- The cyclic-algebra presentation is the explicit one: generators E_h and Pi, relations Pi^h = pi^d and Pi x = sigma_E(x) Pi
- F is algebraically closed (this is Chapter 8's standing hypothesis: 'le cas F alg. clos'); the statement is about the curve X = X_{F,E}
- The dimension count uses O_X(lambda) tensor O_X(-lambda) = O_X^{h^2}, which is point (4) of Fargues-Fontaine Proposition 5.6.23

**Proof outline.**

1. D_lambda is by construction the endomorphism algebra of the simple isocrystal of slope -lambda, so Prop. 8.2.6 gives an embedding D_lambda -> End(O_X(lambda)).
2. End(O_X(lambda)) = H^0(X, O_X(lambda) tensor O_X(lambda)^dual).
3. By Prop. 5.6.23(4), O_X(lambda) tensor O_X(-lambda) is isomorphic to O_X^{h^2}, so dim_E End(O_{X_E}(lambda)) = h^2 = dim_E D_lambda, and the embedding is an isomorphism.
4. NOTE: the Brauer invariant of D_lambda is NOT computed in the passage read; only the cyclic presentation and the dimension are. The stage text makes the Brauer-invariant compatibility an explicit obligation; see gaps.

**Acceptance.**

- Check D_0 = E and D_{1/h} = the division algebra of invariant 1/h for small h
- Check the dimension count h^2 on lambda = 1/2
- Check that the E-algebra structure, not only the E-dimension, matches

**Prerequisites.** `mathlib:Module.finrank`, `mathlib:Module.Free`, `mathlib:WittVector.Isocrystal`

**Sources.**

- `FF18-courbes` — Laurent Fargues, Jean-Marc Fontaine (with a preface by Pierre Colmez), *Courbes et fibres vectoriels en theorie de Hodge p-adique*, Definition 8.2.7, printed p. 287.

  > Pour lambda dans Q nous noterons D_lambda l'algebre a division centrale sur E definie par D_lambda = E_h[Pi] si lambda = d/h, (d,h) = 1, avec Pi^h = pi^d et pour tout x dans E_h, Pi x = sigma_E(x) Pi.

  The explicit cyclic-algebra presentation demanded by the stage text.
- `FF18-courbes` — Laurent Fargues, Jean-Marc Fontaine (with a preface by Pierre Colmez), *Courbes et fibres vectoriels en theorie de Hodge p-adique*, Notation introduced in 4.1 (E_h), printed p. 152.

  > E_h = W_{O_E}(F_{q^h}) l'extension non-ramifiee de degre h de E associee.

  Anchors the gloss of E_h used in Definition 8.2.7, which Definition 8.2.7 itself does not restate; the source's own formula writes the extension as W_{O_E}(F_{q^h}), i.e. by its ring of integers.
- `FF18-courbes` — Laurent Fargues, Jean-Marc Fontaine (with a preface by Pierre Colmez), *Courbes et fibres vectoriels en theorie de Hodge p-adique*, Proposition 8.2.8 and proof, printed pp. 287-288.

  > Il y a un isomorphisme D_lambda -> End(O_{X_E}(lambda)). ... Or, d'apres le point (4) de la proposition 5.6.23 on a O_X(lambda) tensor O_X(lambda)^dual = O_X(lambda) tensor O_X(-lambda) = O_X^{h^2} et donc dim_E End(O_{X_E}(lambda)) = h^2.

  Statement and the full proof, including the imported dimension computation.

### `scalar-extension-adjunction` — Change of coefficient field: adjoint functors on isocrystals match pullback and pushforward on the curve

*comparison.*

**Statement.** Let E'|E be a finite extension with maximal unramified subextension E'_0|E of degree f, so sigma_{E'} = sigma_E^f. There are two adjoint functors between phi-Mod_{L_E} and phi-Mod_{L_{E'}}: upward, (D,phi) -> (D tensor_{L_E} L_{E'}, phi^f tensor sigma_{E'}); downward, (D,phi) -> the induced isocrystal on the direct sum over i = 0..f-1 of D tensor_{L_E, sigma_E^i} L_E with the explicit cyclic Frobenius xi. Under E(-) these correspond to pi_{E'|E}^* and pi_{E'|E *} along pi_{E'|E} : X_{E'} -> X_E.

**Hypotheses that must not be dropped.**

- E'|E finite; f is the degree of the maximal unramified subextension E'_0|E, and the identity sigma_{E'} = sigma_E^f is used
- The downward functor is given by the explicit formula xi(x_0 tensor lambda_0, ..., x_{f-1} tensor lambda_{f-1}) = (phi(x_{f-1}) tensor sigma_E(lambda_{f-1}), x_0 tensor sigma_E(lambda_0), ..., x_{f-2} tensor sigma_E(lambda_{f-2}))
- Slopes are NOT preserved: Fargues-Scholze record that for E'|E finite separable of degree r the pullback of O_{X_{C,E}}(1) is O_{X_{C,E'}}(r), so HN slopes scale by r

**Proof outline.**

1. Fargues-Fontaine write down the two functors and state that E(-) intertwines them with pullback and pushforward along pi_{E'|E}.
2. Fargues-Scholze use exactly this in the proof of Thm. II.2.14: 'Let E'|E be the unramified extension of degree r, and consider the covering f : X_{C,E'} -> X_{C,E}. Then O_{X_C}(lambda) = f_* O_{X_{C,E'}}(s)', reducing a slope s/r to an integral slope.
3. The slope-scaling factor is recorded in Prop. II.2.13's second statement and its proof ('the pullback of O_{X_{C,E}}(1) is O_{X_{C,E'}}(r), causing the mismatch in slopes').

**Acceptance.**

- Check f_* O_{X_{C,E'}}(s) = O_{X_C}(s/r) for the unramified extension of degree r
- Check the slope-scaling factor r on an explicit rank-one example
- Check that the adjunction unit/counit are the expected maps

**Prerequisites.** `RelativeFarguesFontaine:RF1`, `mathlib:CategoryTheory.Adjunction`, `mathlib:WittVector.Isocrystal`, `mathlib:Module.Finite`

**Sources.**

- `FF18-courbes` — Laurent Fargues, Jean-Marc Fontaine (with a preface by Pierre Colmez), *Courbes et fibres vectoriels en theorie de Hodge p-adique*, 8.2.3, printed p. 288.

  > On verifie alors que via le foncteur E(-) ces deux foncteurs correspondent aux deux fleches Fib_{X_E} <-> Fib_{X_{E'}} ou pi_{E'|E} : X_{E'} -> X_E.

  The comparison statement between the isocrystal adjunction and the geometric pullback/pushforward.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Theorem II.2.14, printed p. 70.

  > Let E'|E be the unramified extension of degree r, and consider the covering f : X_{C,E'} = X_{C,E} tensor_E E' -> X_{C,E} = X_C. Then O_{X_C}(lambda) = f_* O_{X_{C,E'}}(s), and so it suffices to find a nonzero map O_{X_{C,E'}}(s) -> f^* E.

  Shows precisely how the change-of-coefficients comparison is consumed in the classification proof.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition II.2.13, printed p. 69.

  > Note that the pullback of O_{X_{C,E}}(1) is O_{X_{C,E'}}(r), causing the mismatch in slopes.

  The slope-scaling factor, which must not be dropped.

## VB1. Vector bundles, descent and cohomology

Cohomology of a bundle on `X_T` is a v-sheaf of **complexes**, not merely of
cohomology groups, and bundles themselves form a v-stack. The mechanism is the two-term Frobenius description
`RΓ(X_S,ℰ) = [H⁰(Y_S,ℰ) →^{φ-1} H⁰(Y_S,ℰ)]`, and the reduction to the structure sheaf works because `ℰ` restricted to a
compact rational interval is a **retract** of `O^n`.

The Harder–Narasimhan half is where this layer is entirely new. `Pic(X_C) = ℤ` via `n ↦ O_{X_C}(n)`, so
`deg(ℰ) := deg(det ℰ)` is well defined and `μ(ℰ) = deg/rk`; rank and degree are additive, which is exactly the
hypothesis Fargues–Fontaine's axiomatics in 5.5.1 need. Out of it come semistability, the vanishing
`Hom(C_{≥λ}, C^{≤μ}) = 0` for `λ > μ`, the abelian semistable category of a fixed slope with finite-length objects, and
the unique functorial `Q`-indexed filtration by saturated subbundles.

**None of that exists at either pin.** An index search found no declaration whose name contains `HarderNarasimhan`,
`Semistable`, `SemiStable` or `PicardGroup`, at Mathlib `082e2d3` or Tau Ceti `f790474`.

Then the twists. For `λ < 0`, `H⁰ = 0` and `BC(O(λ)[1])` is representable, partially proper and cohomologically smooth;
for `λ = 0` the Banach–Colmez space is the constant sheaf `E`; for `λ > 0`, `H¹` vanishes on affinoids; and for small
positive `λ = r/s` the space is `Spd k[[x_1^{1/p^∞},…,x_r^{1/p^∞}]]`. Those assertions consume locally spatial diamonds
and cohomological smoothness, and **the atlas links neither supplier into VB1** — a finding recorded as a gap.

**Coverage: `partial`.** v-descent for bundles and their cohomology, the degree-rank-slope apparatus with the Harder-Narasimhan formalism, and the cohomology of the twists with the representability of the associated Banach-Colmez spaces. Nothing in the Harder-Narasimhan half exists at either pin: an index search found no HarderNarasimhan, no Semistable, no PicardGroup.

Remaining in this layer:

- ECD Theorem 8.7 / Proposition 8.8 (v-descent for perfectoid spaces) and SW20 Lemma 17.1.8, imported by the proof of II.2.1, were not read.
- The comparison of bundles on X_S with finite projective modules on annuli plus Frobenius descent is used implicitly throughout but no source statement for it was read (candidate: SW20 Theorem 5.2.8 / KL15 Theorem 2.7.7, statement read but not proof).
- Saturated subbundles, torsion quotients and the degree formula for a generic-fibre isomorphism were read only in Fargues-Fontaine's general formalism (5.5.2.1), not verified for X_S.
- ECD Propositions 23.13 and 24.2, used in the proof of II.2.5(i),(iii), were not read.

### `v-descent-for-bundles-and-cohomology` — FS II.2.1: cohomology of bundles on X_T is a v-sheaf of complexes, and bundles form a v-stack

*theorem.* **Planet: Bundles on the curve form a v-stack.**

**Statement.** For S perfectoid over F_q and E a vector bundle on X_S, the functor T -> RGamma(X_T, E|_{X_T}) on Perf_S is a v-sheaf of complexes; the functor T -> H^0(Y_T, E|_{Y_T}) is a v-sheaf whose cohomology vanishes for T affinoid. Moreover S -> {groupoid of vector bundles on X_S} is a v-stack.

**Hypotheses that must not be dropped.**

- S perfectoid over F_q; the reduction to Y_T uses the two-term Frobenius description RGamma(X_S,E) = [H^0(Y_S,E) --(phi-1)--> H^0(Y_S,E)]
- The proof reduces to compact rational intervals I and uses that E|_{Y_{T,I}} is a RETRACT of O^n_{Y_{T,I}}, hence reduces to the structure sheaf
- Exactness of the Cech complex is checked after completed tensor with E_infty = E(pi^{1/p^infty})^wedge, where all algebras become perfectoid, and then quoted from ECD Theorem 8.7 and Proposition 8.8
- v-descent of the groupoid of bundles is quoted from SW20 Lemma 17.1.8 and Proposition 19.5.3

**Proof outline.**

1. Reduce RGamma(X_S,E) to H^0(Y_S,-) via the phi-fixed-point description from the Stein exhaustion.
2. Reduce to affinoid S and to a single compact rational interval I.
3. Reduce to the structure sheaf because E|_{Y_{T,I}} is a retract of a free module.
4. Base change to E_infty to make all algebras perfectoid, so that the Cech complex for the v-cover Y_{T,I} x_E E_infty -> Y_{S,I} x_E E_infty is exact by ECD Thm 8.7/Prop 8.8, and descend back along the split inclusion.

**Acceptance.**

- Check the exactness of the Cech complex for a split v-cover and for a pro-etale cover
- Check that the vanishing of higher cohomology of H^0(Y_T,-) really needs T affinoid
- Check effectivity of descent for a bundle with nontrivial descent datum

**Prerequisites.** `DiamondsAndVStacks:D3`, `RelativeFarguesFontaine:RF1`, `RelativeFarguesFontaine:RF2:untilts`, `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:DerivedCategory`, `mathlib:Module.Projective`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition II.2.1 and proof, printed p. 57.

  > The functor taking any T in Perf_S to RGamma(X_T, E|_{X_T}) is a v-sheaf of complexes. In fact, the functor taking any T in Perf_S to H^0(Y_T, E|_{Y_T}) is a v-sheaf, whose cohomology vanishes in case T is affinoid. Moreover, sending S to the groupoid of vector bundles on X_S defines a v-stack.

  Verbatim statement including the affinoid hypothesis for the vanishing.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition II.2.1, printed p. 57.

  > Then E|_{Y_{T,I}} is a retract of O^n_{Y_{T,I}}, so we can reduce to the structure sheaf. ... This can be checked after taking a completed tensor product with E_infty = E(pi^{1/p^infty})^wedge. In that case, all algebras become perfectoid, and Y_{T,I} x_E E_infty -> Y_{S,I} x_E E_infty is a v-cover of affinoid perfectoid spaces.

  The two reduction steps and the perfectoid base change that makes the imported descent theorem applicable.

### `degree-rank-slope-and-HN-formalism` — Degree, rank, slope, the Harder-Narasimhan formalism and its axioms

*construction.* **Planet: Degree, slope and the HN formalism.**

**Statement.** Pic(X_C) = Z via n -> O_{X_C}(n), so deg(E) := deg(det E) is well defined and mu(E) = deg(E)/rk(E) for E nonzero. Rank and degree are additive in short exact sequences, so the Harder-Narasimhan axiomatics of Fargues-Fontaine 5.5.1 apply: semistable means mu(F) <= mu(E) for all proper nonzero subbundles F, stable means strict inequality, Hom(C_{>= lambda}, C^{<= mu}) = 0 for lambda > mu, C_lambda^ss is abelian and stable under extensions, its objects have finite length and its simple objects are the stable objects of slope lambda. Every E on X_C admits a unique exhaustive separating Q-indexed HN filtration by saturated subbundles, functorial in E.

**Hypotheses that must not be dropped.**

- The degree is defined via Pic(X_C) = Z, which is Proposition II.2.10, itself proved from Proposition II.2.9 (removing a closed point leaves a principal ideal domain) and Proposition II.2.2 (O([x]) = O(1))
- Slope requires POSITIVE rank; the zero bundle is excluded (the stage's completion contract makes this explicit)
- The HN formalism in Fargues-Fontaine is stated for an exact category C with a fibre functor to an abelian category and two additive functions rank and degree, with the degree formula for a morphism that is a generic-fibre isomorphism: deg(E') = deg(E) + deg(E'/u(E)), the torsion sheaf degree being the sum over points of deg(x) times the length
- Proposition II.2.12 is stated over a GEOMETRIC point X_C, not over a general base

**Proof outline.**

1. Establish Pic(X_C) = Z: any line bundle becomes trivial after removing one closed point of X_C^alg (Prop. II.2.9); the local rings of X_C^alg are discrete valuation rings, so any line bundle is O(n[x]); and O([x]) = O(1) by Prop. II.2.2.
2. Verify additivity of rank and degree in short exact sequences and the torsion-quotient degree formula, which is Fargues-Fontaine's example 5.5.2.1.
3. Apply the general formalism to get the HN filtration, its uniqueness and functoriality, and the abelian category C_lambda^ss with stable objects as its simple objects (Prop. 5.5.6).
4. Example II.2.11 verifies that O_{X_C}(lambda) is stable of slope lambda by passing to r-th wedge powers: det(F) = O(s) embeds in O(r lambda)^m, giving s <= r lambda with equality forcing r to be at least the denominator of lambda.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `degree` | data | deg(E) := deg(det E), well defined because Pic(X_C) = Z via n -> O_{X_C}(n). |
| `rank` | data | rk(E), the rank of the bundle; both are additive in short exact sequences, which is the hypothesis the Harder-Narasimhan axiomatics need. |
| `slope` | data | mu(E) = deg(E)/rk(E) for E nonzero. |
| `IsSemistable` | data | mu(F) <= mu(E) for every proper nonzero subbundle F; stable means strict inequality. |
| `hnFiltration` | data | The unique exhaustive separating Q-indexed filtration by saturated subbundles with semistable graded pieces of strictly decreasing slopes, functorial in E. |
| `hom_vanishing` | characterisation | Hom(C_{>= lambda}, C^{<= mu}) = 0 for lambda > mu, the orthogonality that makes the filtration unique. |
| `semistableCategory` | structure | C_lambda^ss is abelian and stable under extensions, its objects have finite length, and its simple objects are the stable objects of slope lambda. |
| `axioms` | structure | The abstract input is Fargues-Fontaine 5.5.1: an exact category with additive degree and rank, an exact faithful generic-fibre functor to an abelian category inducing a bijection on strict subobjects, and the crucial hypothesis that a morphism which is an isomorphism on generic fibres does not decrease degree, with equality only for an isomorphism. |

Derived from where the object is used:

- in `VectorBundlesAndIsocrystals:VB2:classification/HN-filtration-base-change` — the base-change lemma is a statement about this filtration
- in `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles` — the classification is stated for semistable bundles first and then in general through this filtration
- in `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point` — the schematic model is what makes the degree and the saturation of subbundles algebraic

**Unit tests.** A plausible wrong definition fails one of these.

- `nothing_pinned` — Neither pinned library has Harder-Narasimhan filtrations, semistability, slopes in this sense, or a Picard group: an index search at both pins found no declaration whose name contains HarderNarasimhan, Semistable or PicardGroup. This node is genuinely new and cites nothing for its core.
- `degree_needs_Pic_is_Z` — deg is well defined because Pic(X_C) = Z; on a curve with larger Picard group the same formula does not define a degree, so the identification is part of the construction.
- `additivity` — Rank and degree are additive in short exact sequences; without additivity the Fargues-Fontaine axiomatics do not apply and the filtration need not exist.
- `sign_convention` — The dominance convention must be pinned once: the decomposition records that the HN sign convention is not consistent across the sources, and a filtration indexed by decreasing rather than increasing slopes reverses every later statement.

**Acceptance.**

- Verify stability of O(lambda) for lambda = 1/2 by the wedge-power argument
- Verify Hom(O(lambda), O(mu)) = 0 for lambda > mu
- Verify that the HN filtration is by SATURATED subbundles, and give an example where a non-saturated subsheaf has larger slope

**Prerequisites.** `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`, `RelativeFarguesFontaine:RF3`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `mathlib:CategoryTheory.Abelian`, `mathlib:Module.finrank`, `mathlib:Module.Free`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition II.2.10 and proof, printed p. 68.

  > The map Z -> Pic(X_C), n -> O_{X_C}(n), is an isomorphism. Proof. By Proposition II.2.9, any line bundle becomes trivial after removing one closed point x in X_C^alg. As the local rings of X_C^alg are discrete valuation rings, this implies that any line bundle is of the form O_{X_C}(n[x]) for some n in Z. But O_{X_C}([x]) = O_{X_C}(1) by Proposition II.2.2.

  The basis of the degree function, with its full proof.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, After Proposition II.2.10, printed p. 69.

  > It is easy to see that this satisfies the Harder-Narasimhan axiomatics [FF18, 5.5.1] (for example, rank and degree are additive in short exact sequences).

  Names the imported axiomatics.
- `FF18-courbes` — Laurent Fargues, Jean-Marc Fontaine (with a preface by Pierre Colmez), *Courbes et fibres vectoriels en theorie de Hodge p-adique*, Theoreme 5.5.4 (1)-(3), Definition 5.5.5 and Proposition 5.5.6, printed p. 214.

  > 2. Lorsque lambda > mu, Hom(C_{>=lambda}, C^{<=mu}) = 0. ... 3. Pour tout lambda dans R, C_lambda^ss = C^{<=lambda} inter C_{>=lambda} est une categorie abelienne stable par extensions dans C. ... Proposition 5.5.6. Soit lambda dans R. Tout objet de la categorie abelienne C_lambda^ss est de longueur finie. Les objets simples de C_lambda^ss sont les objets stables de pente lambda.

  The actual content of the imported axiomatics, read in the source.
- `FF18-courbes` — Laurent Fargues, Jean-Marc Fontaine (with a preface by Pierre Colmez), *Courbes et fibres vectoriels en theorie de Hodge p-adique*, Theoremes 5.5.2 and 5.5.3, printed p. 213.

  > Pour X comme dans l'enonce precedent on note HN(X) l'unique polygone concave d'origine (0,0) et ayant pour pentes mu(X_i/X_{i-1}) avec multiplicites respectives rg(X_i/X_{i-1}). Theoreme 5.5.3. Si X' contenu dans X est un sous-objet strict, le point (deg(X'), rg(X')) est situe en dessous du polygone HN(X). On obtient donc que HN(X) est l'enveloppe concave des points (deg(X'), rg(X')) ...

  Fargues-Fontaine's own polygon convention, in the coordinates (deg, rg) and with the CONCAVE envelope. Fargues-Scholze (printed p. 74) instead use the CONVEX hull of the points (i, d_i) with i the rank. The two differ by an axis swap and a sign; see the HN-convention gap. The excerpt is truncated here; the full quotation is in data/decompositions/VectorBundlesAndIsocrystals.json, where the independent review checked it against the source.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Example II.2.11, printed p. 69.

  > Passing to r-th wedge powers, we get an injection det(F) = O_{X_C}(s) -> O_{X_C}(r lambda)^m, using that the r-th wedge of O_{X_C}(lambda) is a direct sum of copies of O_{X_C}(r lambda). This implies that s <= r lambda.

  The stability proof for O(lambda).

### `cohomology-of-twists` — FS II.2.5: cohomology of O(lambda) and representability of the associated Banach-Colmez spaces

*theorem.* **Planet: Cohomology of the twists O(lambda).**

**Statement.** Let lambda be rational. (i) If lambda < 0 then H^0(X_S, O(lambda)) = 0 for all S, and BC(O(lambda)[1]) -> * is relatively representable in locally spatial diamonds, partially proper and cohomologically smooth. (ii) For lambda = 0, E -> BC(O) is an isomorphism of pro-etale sheaves, the pro-etale sheafification of S -> H^1(X_S,O) vanishes, and RGamma_proet(S,E) -> RGamma(X_S,O_{X_S}) is an isomorphism. (iii) For lambda > 0, H^1(X_S,O(lambda)) = 0 for all AFFINOID S, and BC(O(lambda)) -> * is relatively representable in locally spatial diamonds, partially proper and cohomologically smooth. (iv) If 0 < lambda <= [E:Q_p] (resp. all positive lambda in equal characteristic) then BC(O(lambda)) = Spd k[[x_1^{1/p^infty},...,x_r^{1/p^infty}]] where lambda = r/s in lowest terms with r, s > 0.

**Hypotheses that must not be dropped.**

- The vanishing H^1(X_S, O(lambda)) = 0 for lambda > 0 requires S AFFINOID; the statement is false without it
- Part (iv) has the bound 0 < lambda <= [E:Q_p] in mixed characteristic; there is no such bound in equal characteristic. Outside that range BC(O(lambda)) is not claimed to be a perfectoid ball
- The reduction to lambda = n integral is by replacing E by its unramified extension of degree s
- The p-adic case of (iv) is quoted from Scholze-Weinstein 'Moduli of p-divisible groups' [SW13, Theorem A, Proposition 3.1.3(iii)]
- Parts (i) and (iii) use ECD Proposition 23.13 (extensions) and Proposition 24.2 (closed immersions), which were not read

**Proof outline.**

1. Reduce to lambda = n integral by an unramified base change of E of degree s.
2. Prove surjectivity of phi - pi^n : B_{R,[1,q]} -> B_{R,[1,1]} by splitting an element into a part in B_{R,[0,1]}[1/pi], where g = phi^{-1}(f) + pi^n phi^{-2}(f) + ... converges, and a part in [varpi]B_{R,[1,infty]}, where g = -pi^{-n}f - pi^{-2n}phi(f) - ... converges. This gives H^1(X_S,O(n)) = 0 for n > 0 and affinoid S.
3. Upgrade to a quasi-isomorphism of two-term complexes using the two short exact sequences involving W_{O_E}(R^+)[1/pi], reducing to invertibility of phi - pi^n on B_{R,[0,q]}[1/pi] and on W_{O_E}(R^+)[1/pi].
4. Part (iv) in equal characteristic is an explicit power-series computation: phi(r_i) = r_{i+n} forces free choice of r_1,...,r_n, and convergence holds exactly when all r_i are topologically nilpotent. In mixed characteristic reduce to E = Q_p by pushforward along X_{S,E} -> X_{S,Q_p} and quote [SW13].
5. Part (iii) for general n > 0 by induction along 0 -> BC(O(n)) -> BC(O(n+1)) -> (A^1_{S^sharp})^diamond -> 0 (from Prop. II.2.3), with base case n = 1.
6. Part (ii) from the n = 0 sequence 0 -> H^0(X_S,O) -> H^0(X_S,O(1)) -> R^sharp -> H^1(X_S,O) -> 0, whose middle map is the Lubin-Tate logarithm, pro-etale locally surjective with kernel E.
7. Part (i) from 0 -> E -> (A^1_{S^sharp})^diamond -> BC(O(-1)[1]) -> 0 and induction using 0 -> (A^1_{S^sharp})^diamond -> BC(O(-n)[1]) -> BC(O(-n+1)[1]) -> 0.

**Acceptance.**

- Verify the explicit convergence of the two series for a ramified E
- Verify BC(O(1)) = Spd F_q[[x^{1/p^infty}]] and its identification with the universal cover of the Lubin-Tate group
- Verify that the bound lambda <= [E:Q_p] in (iv) is used, e.g. by checking that BC(O(2)) for E = Q_p is not a perfectoid ball

**Prerequisites.** `RelativeFarguesFontaine:RF3`, `DiamondSixOperations:S4`, `DiamondSixOperations:S5`, `DiamondsAndVStacks:D5`, `mathlib:DerivedCategory`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition II.2.5, printed p. 62.

  > (iii) For lambda > 0, one has H^1(X_S, O_{X_S}(lambda)) = 0 for all affinoid S in Perf_{F_q}, and the projection from BC(O(lambda)) : S -> H^0(X_S,O_{X_S}(lambda)) to the point * is relatively representable in locally spatial diamonds, partially proper, and cohomologically smooth. (iv) If 0 < lambda <= [E:Q_p] (resp. for all positive lambda if E is of equal characteristic), there is an ...

  Exact statement with the affinoid hypothesis in (iii) and the slope bound in (iv). The excerpt is truncated here; the full quotation is in data/decompositions/VectorBundlesAndIsocrystals.json, where the independent review checked it against the source.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition II.2.5, printed pp. 62-63.

  > If f is in B_{R,[0,1]}, then the series g = phi^{-1}(f) + pi^n phi^{-2}(f) + pi^{2n} phi^{-3}(f) + ... converges in B_{R,[0,q]} (with its evident definition) and thus in B_{R,[1,q]}, and f = phi(g) - pi^n g.

  The explicit convergent series that proves the surjectivity, i.e. the actual mechanism behind the vanishing.

## VB2. Ampleness, algebraization and geometric classification

An aggregate layer with no node of its own.

**Coverage: `partial`.** Aggregate layer over VB2:ampleness and VB2:classification; no node of its own.

Remaining in this layer:

- Aggregate stage; inherits the remaining items of VB2:ampleness and VB2:classification.

## VB2:ampleness. Positive twists and algebraization

Three theorems in a chain. Sufficiently positive twists are globally
generated with vanishing `H¹` — the quantitative statement, after Kedlaya–Liu 6.2.4. That is exactly the hypothesis of
an **axiomatic GAGA theorem**: for a locally ringed spectral space with a line bundle whose twists are eventually
globally generated and eventually have vanishing higher cohomology, pullback along `(X,O_X) → Proj P` is an equivalence
on vector bundles and an isomorphism on all cohomology. And then the conclusion for the curve: `X_C^alg` is a
connected regular noetherian scheme of Krull dimension 1, the classical points of `|X_C|` are exactly its closed
points, and the complement of any classical point is the spectrum of a **principal ideal domain**.

That last is what makes the whole classification possible: it turns a question about an adic curve into commutative
algebra over a PID. Mathlib supplies `IsPrincipalIdealRing`, `IsDedekindDomain`, `ValuationRing`,
`AlgebraicGeometry.Scheme` and `AlgebraicGeometry.IsProper` for that half; it supplies nothing for ampleness.

Kedlaya–Liu, of which the first theorem is a proof and the second an axiomatisation, is in the reference library and
**unread**; and the independence of `X^alg` from the chosen `O_X(1)` is stated in the source without proof (*"One can
check that …"*). Both are carried as gaps.

**Coverage: `partial`.** Quantitative global generation of positive twists, the axiomatic GAGA theorem it feeds, and the resulting schematic curve X_C^alg: connected, regular, noetherian of dimension 1, with PID complements of classical points. Kedlaya-Liu, of which the first two are respectively a proof and an axiomatisation, is in the reference library and unread.

Remaining in this layer:

- Kedlaya-Liu Proposition 6.2.4 and Theorem 6.3.9, of which FS II.2.6 and II.2.7 are respectively a proof and an axiomatisation, were not read; KedlayaLiu_RelativePadicHodgeFoundations.pdf is present in the library but unread.
- Kedlaya-Liu Corollary 1.5.3, cited for the reduction to a free phi-module, was not read.
- The claim that X^alg is independent of the choice of O_X(1) (Remark II.2.8) is stated without proof in the source ('One can check that ...').

### `quantitative-global-generation` — FS II.2.6 (after KL15 6.2.4): sufficiently positive twists are globally generated with vanishing H^1

*theorem.* **Planet: Positive twists are globally generated.**

**Statement.** Let S = Spa(R,R^+) be affinoid perfectoid over F_q and E any vector bundle on X_S. There is an integer n_0 such that for all n >= n_0 the twist E(n) is globally generated, i.e. admits a surjection O_{X_S}^m -> E(n), and H^1(X_S, E(n)) = 0.

**Hypotheses that must not be dropped.**

- S AFFINOID perfectoid; a pseudouniformizer varpi in R is chosen and all B_{R,I} carry the spectral norm normalized by ||[varpi]|| = 1/q
- One first reduces to M_{[1,q]} FREE, using that equality in the Grothendieck group of finite projective B_{R,[1,1]}-modules is stable isomorphism, so after increasing m the kernel modules become isomorphic
- One then arranges A in GL_m(B_{R,[1,q]}) (not merely GL_m(B_{R,[1,1]})) by repeating the argument with the presentation of X_S as the quotient of Y_{S,[1,q^2]}
- Integers N, N' are chosen with A having entries in pi^N W_{O_E}(R^+)<([varpi]/pi)^{+-1}> and A^{-1} in pi^{-N'} W_{O_E}(R^+)<[varpi]/pi^{1/q}, [varpi]/pi>; after twisting one arranges qN > N' and N > 0
- A rational r with 1 < r <= q is fixed; M is chosen large depending only on N, N' and r

**Proof outline.**

1. Reduce to M_{[1,q]} free by a Grothendieck-group/stable-isomorphism argument that produces a phi-equivariant surjection from a free phi-module.
2. Write phi_M = A^{-1} phi with A in GL_m(B_{R,[1,q]}); twisting by O(n) replaces A by A pi^n, so the integers N, N' can be shifted to satisfy qN > N' and N > 0.
3. Seek sections v_i = [varpi]^M e_i - v'_i with ||v'_i||_{B_{R,[r,q]}} <= q^{-M-1}; such v_i restrict to a basis of B_{R,[r,q]}^m because the change-of-basis matrix lies in [varpi^M](Id + [varpi]M_m(B^circ_{R,[r,q]})).
4. Reduce to the quantitative surjectivity (II.2.1): for w in pi^M W_{O_E}(R^+)<([varpi]/pi)^{+-1}>^m there is v in B_{R,[1,q]}^m with (phi - A)v = w and ||v||_{B_{R,[r,q]}} <= q^{-M-1}.
5. Prove it by the explicit splitting w = w_1 + w_2 with w_1 in [varpi]^{N-1}pi^{M-N+1}W<[varpi]/pi>^m and w_2 in [varpi]^N pi^{M-N}W<[varpi]/pi>^m, setting v = phi^{-1}(w_1) - A^{-1}w_2 and checking that the residual w' lies in pi^{M+1}W<([varpi]/pi)^{+-1}>^m, using N > 0 for one term and qN > N' for the other; iterate and sum.
6. Estimate ||phi^{-1}(w_1)||_{B_{R,[r,q]}} <= q^{-(N-1)/q - rM + rN - r} and ||A^{-1}w_2||_{B_{R,[r,q]}} <= q^{rN' - rM}, both <= q^{-M-1} for M large; conclude convergence.
7. Repeat over different strips and different pseudouniformizers to get global generation of E.

**Acceptance.**

- Verify the two norm estimates numerically for E = Q_p, m = 1 and an explicit A
- Verify that the reduction to a free phi-module is needed, i.e. that the naive argument fails for a non-free finite projective module
- Verify the conclusion on E = O(-1) where n_0 must be at least 1

**Prerequisites.** `RelativeFarguesFontaine:RF3`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.ValuationSpectrum.spa`, `mathlib:Module.Projective`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem II.2.6, printed p. 64.

  > Let S = Spa(R,R^+) be an affinoid perfectoid space over F_q and let E be any vector bundle on X_S. Then there is an integer n_0 such that for all n >= n_0, the vector bundle E(n) is globally generated, i.e. there is a surjective map O_{X_S}^m -> E(n) for some m >= 0, and moreover H^1(X_S, E(n)) = 0.

  Exact statement with the affinoid hypothesis.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Theorem II.2.6, printed p. 65.

  > Let us choose integers N and N' such that the matrix A has entries in pi^N W_{O_E}(R^+)<([varpi]/pi)^{+-1}>, the matrix A^{-1} has entries in pi^{-N'} W_{O_E}(R^+)<[varpi]/pi^{1/q}, [varpi]/pi>. By twisting, we can replace N and N' by N + n and N' + n; we can thus arrange that qN > N', N > 0.

  The exact numerical hypotheses that the twisting achieves; these are the quantitative core of the theorem.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Theorem II.2.6, printed p. 66.

  > Thus, taking M large enough (depending only on N, N' and r > 1), the process above converges, giving the desired result.

  The convergence conclusion and the exact parameters it depends on.

### `gaga-equivalence` — FS II.2.7: an axiomatic GAGA theorem for a locally ringed spectral space with an ample twist

*theorem.* **Planet: The axiomatic GAGA theorem.**

**Statement.** Let (X,O_X) be a locally ringed spectral space with a line bundle O_X(1) such that for every vector bundle E there is n_0 with E(n) globally generated for n >= n_0, and such that H^i(X, E(n)) = 0 for i > 0 and all sufficiently large n. Let P be the graded ring of sections of the twists and X^alg = Proj P. Then pullback along the natural map (X,O_X) -> X^alg is an equivalence between vector bundles on X^alg and on X, and H^i(X^alg, E^alg) -> H^i(X,E) is an isomorphism for all i >= 0. X^alg is independent of the chosen O_X(1) up to canonical isomorphism.

**Hypotheses that must not be dropped.**

- X is a locally ringed SPECTRAL space (quasicompactness is used to reduce to finitely many sections)
- BOTH hypotheses are needed: eventual global generation of every vector bundle AND eventual vanishing of all higher cohomology of every twisted bundle
- The functor E -> E-tilde is exact precisely because H^1(X, E(n)) = 0 for n large
- The splitting obstruction argument needs H^1(X, Hom(E,F)(n')) = 0 for n' large, i.e. the vanishing hypothesis applied to Hom-bundles

**Proof outline.**

1. Define E-tilde as the quasicoherent O_{X^alg}-module attached to the graded P-module of sections of E(n); exactness comes from the vanishing hypothesis.
2. Show E-tilde is a vector bundle: take a surjection O_X^m -> E(n) with kernel F; the surjection splits after twisting by a section f in P_{n'} because the obstruction lies in H^1(X, Hom(E,F)(n')), which vanishes for n' large; hence E-tilde is a vector bundle on Spec P[f^{-1}]_0, and these cover X^alg.
3. The natural map f^* E-tilde -> E is an isomorphism locally, hence globally.
4. For cohomology: by ampleness of O_{X^alg}(1) write a surjection O(-n)^m -> (E^alg)^dual, dualize to an injection E^alg -> O(n)^m with vector-bundle cokernel; deduce injectivity then bijectivity on H^0; conclude for higher i by the Cech complex for the cover Spec P[f_i^{-1}]_0, whose terms are filtered colimits of H^0 of twists.

**Acceptance.**

- Check that the equivalence fails if only global generation and not the H^i-vanishing is assumed
- Check independence of the choice of O_X(1) on an explicit example
- Check the isomorphism on H^1 for E = O(-2) on X_C

**Prerequisites.** `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:CategoryTheory.Equivalence`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition II.2.7, printed p. 66.

  > Let (X,O_X) be a locally ringed spectral space equipped with a line bundle O_X(1) such that for any vector bundle E on X, there is some n_0 such that for all n >= n_0, the bundle E(n) is globally generated. Moreover, assume that for i > 0, the cohomology group H^i(X, E(n)) = 0 vanishes for all sufficiently large n.

  The exact hypotheses of the axiomatic GAGA statement.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition II.2.7, printed p. 67.

  > The map O_X^m -> E(n) splits after twisting, i.e. for any f in P_{n'} with n' large enough, there is a map E(n - n') -> O_X^m such that E(n-n') -> O_X^m -> E(n) is multiplication by f. Indeed, the obstruction to such a splitting is a class in H^1(X, Hom(E,F)(n')) which vanishes for n' large enough.

  The step that makes E-tilde a vector bundle, and which consumes the vanishing hypothesis for Hom-bundles.

### `schematic-curve-at-a-geometric-point` — FS II.2.9: X_C^alg is connected regular noetherian of dimension 1 with PID complements

*theorem.* **Planet: The schematic curve X^alg.**

**Statement.** Let C be a complete algebraically closed nonarchimedean field over F_q. Then X_C^alg is a connected regular noetherian scheme of Krull dimension 1; the map |X_C| -> |X_C^alg| induces a bijection between the classical points |X_C|^cl and the closed points of X_C^alg; and for any classical point x, the complement X_C^alg \ {x} is the spectrum of a principal ideal domain.

**Hypotheses that must not be dropped.**

- C complete algebraically closed over F_q; the statement is at a geometric point, not in families
- The key input is the exact sequence 0 -> O_{X_C} -> O_{X_C}(1) -> O_{C^sharp} -> 0 coming from Lubin-Tate theory (Prop. II.2.3), which supplies for each classical point x a section f_x in H^0(X_C, O(1)) with vanishing locus exactly x
- The factorisation argument uses that a nonzero g in H^0(X_C, O(n)) has only finitely many zeroes, all at classical points, which is Cor. II.1.12

**Proof outline.**

1. For a classical point x with untilt C^sharp, the section f from the Lubin-Tate exact sequence has vanishing locus Spec C^sharp in X_C^alg; this locus is affine because it is Zariski closed in D_+(g) for any g in H^0(O(1)) not vanishing at x, and its global sections are computed by Prop. II.2.2.
2. For a nonzero g in H^0(X_C, O(n)): its zeroes are finitely many classical points x_1,...,x_m, and g = f_{x_1}^{n_1} ... f_{x_m}^{n_m} h with h nowhere vanishing; h then trivializes O(n') so n' = 0 and h lies in E^times.
3. This factorisation shows P[f^{-1}]_0 is a principal ideal domain and that every maximal ideal comes from a classical point of |X_C|.

**Acceptance.**

- Verify the factorisation of an explicit degree-2 section
- Verify that Pic^0 is trivial, i.e. that the complement of a point has trivial Picard group
- Verify the bijection between closed points and classical points on X_C for E of equal characteristic

**Prerequisites.** `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`, `VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:IsPrincipalIdealRing`, `mathlib:IsDedekindDomain`, `mathlib:IsAlgClosed`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition II.2.9 and proof, printed p. 68.

  > Then X_C^alg is a connected regular noetherian scheme of Krull dimension 1, and the map |X_C| -> |X_C^alg| induces a bijection between |X_C|^cl and the closed points of |X_C^alg|. Moreover, for any classical point x in |X_C|, the complement X_C^alg \ {x} is the spectrum of a principal ideal domain.

  Exact statement.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition II.2.9, printed p. 68.

  > This has finitely many zeroes on X_C, all at classical points x_1, ..., x_m. For each x_i, we have a section f_{x_i} in H^0(X_C, O_{X_C}(1)) as before, and then g = f_1^{n_1} ... f_m^{n_m} h for some n_i >= 1, and some h in H^0(X_C, O_{X_C}(n')) that is everywhere nonzero. In particular, h defines an isomorphism O_{X_C} -> O_{X_C}(n'), whence n' = 0, and h is in E^times.

  The factorisation that gives the PID property.

## VB2:classification. Geometric points

The classification: **every** vector bundle on `X_C` is a direct
sum of the stable `O_{X_C}(λ)`, and a semistable bundle of slope `λ` is `O_{X_C}(λ)^m`. The packet keeps the exact
strength of the statement: the functor from isocrystals induces a **bijection on isomorphism classes**, and full
faithfulness on morphisms is *not* asserted. The stage text requires that distinction and the source's own wording
supports it.

Underneath sit three things. The classical points of `X_C` are `|Y_C|^cl/φ^ℤ`, in bijection with `Div¹(C)`, and a
connected affinoid of `Y_C` has PID ring while a connected affinoid open of `X_C` has Dedekind ring — a PID, by the
Picard computation. The HN filtration commutes with extension of `C` and **rescales** under extension of `E`: for
`E'|E` separable of degree `r`, `(ℰ')^{≥λ}` is the pullback of `ℰ^{≥λ/r}`, because the pullback of `O_{X_{C,E}}(1)` is
`O_{X_{C,E'}}(r)`. And the key extension lemma: an extension of `O(1/n)` by `O(-1)` acquires a nonzero global section
after enlarging `C`.

That enlargement is the device the whole proof turns on, and it is why the theorem is stated at a *geometric* point.

**Coverage: `partial`.** Classical points and the PID and Dedekind structure, base change of the Harder-Narasimhan filtration in both directions, the classification of bundles as sums of the stable O(lambda), and the key extension lemma it turns on. The classification is recorded as a bijection on ISOMORPHISM CLASSES; full faithfulness on morphisms is not asserted, and the stage text requires that distinction to be kept.

Remaining in this layer:

- FS Proposition II.0.2 ('Zariski closed implies strongly Zariski closed'), imported into the proof of II.1.11, cites [Sch15, Section II.2], [BS22, Remark 7.5] and [Sch17a, Definition 5.7, Theorem 5.8]; none was read. BhattScholze_Prisms.pdf is in the library (Remark 7.5 unread).
- ECD Lemma 10.13 (v-descent of torsors under a locally profinite group), essential to the 'free to enlarge C' device, was not read.
- SW20 Proposition 10.2.3, used to classify E-linear maps of (A^1)^diamond in the p-adic case of Lemma II.2.15, was not read.
- FS Proposition II.2.12 (existence/uniqueness/functoriality of the HN filtration on X_C) is stated with an empty proof box in the source; the argument is the general formalism of FF 5.5.1, read, but the verification of its hypotheses for Bun(X_C) was not written out anywhere read.
- The stage text's requirement that the isocrystal functor be recorded as NOT fully faithful is supported by the wording of FS Theorem II.0.3 ('induces a bijection on isomorphism classes'), but no source passage exhibiting a failure of full faithfulness was found.

### `classical-points-and-principal-ideal-domains` — FS II.1.11-II.1.12 and II.1.22: classical points, maximal ideals and PID/Dedekind structure

*theorem.* **Planet: Classical points and PID complements.**

**Statement.** Let U = Spa(B,B^+) be an affinoid subset of Y_C. Then for any maximal ideal m of B the quotient B/m is a nonarchimedean field, and Spm(B) -> |U| is a bijection onto |U|^cl = |U| intersect |Y_C|^cl. U has finitely many connected components, and if U is connected then B is a principal ideal domain. Correspondingly, the classical points of X_C are |Y_C|^cl/phi^Z and are in bijection with Div^1(C); for U = Spa(B,B^+) an affinoid open of X_C with U connected, B is a Dedekind domain (in fact a PID, by the Picard computation).

**Hypotheses that must not be dropped.**

- C is complete algebraically closed over F_q; these statements are at a geometric point
- The key input is Proposition II.0.2 ('Zariski closed implies strongly Zariski closed', quoted from [Sch15, II.2], [BS22, Remark 7.5], [Sch17a, Def. 5.7, Thm. 5.8]), which lets one transport Zariski closed subsets through tilting
- The finiteness of connected components uses that any quasicompact open subset of |D_C| has finitely many connected components
- The PID argument uses that the spectral norm on U is a supremum over the finitely many Shilov boundary points

**Proof outline.**

1. Show a nonzero f in B vanishes only at classical points: if V(f) contained a nonclassical point it would contain a nonclassical rank-1 point (V(f) is generalizing), hence after base change to some C'|C an open subset U', contradicting injectivity of O(U) -> O(U').
2. Injectivity of O(U) -> O(U') is reduced through Prop. II.0.2 to open subsets of D_{C,perf}, where O(V) -> O(V') is topologically free over the classical Tate-algebra map O(W) -> O(W') with basis t^i, i in [0,1) intersect Z[1/p], and injectivity is classical.
3. For the PID property: each maximal ideal is principal since it comes from a closed Cartier divisor. For nonzero f, V(f) is closed with no nontrivial specializations hence profinite; normalising xi_x to have norm >= 1 on the Shilov boundary and assuming f = xi_x^n g_n for all n gives ||f||_{U_x} <= |[varpi]|^n ||f|| -> 0, a contradiction; hence f = xi_x^n g with g(x) nonzero, so V(f) is discrete and finite, and f factors as a product of the xi_{x_i} times a unit.
4. For X_C, Y_C -> X_C is locally split, so the result is local on U and glues.

**Acceptance.**

- Verify Prop. II.0.2's role by exhibiting a nonclassical rank-1 point whose preimage in some |Y_{C'}| contains an open set (Prop. II.1.9, Lemma II.1.10)
- Verify the Shilov-boundary normalisation argument on an explicit annulus
- Verify the footnote's upgrade from Dedekind to PID via Pic(X_C) = Z

**Prerequisites.** `PerfectoidSpaces:P2`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.ValuationSpectrum.spa`, `mathlib:IsPrincipalIdealRing`, `mathlib:IsDedekindDomain`, `mathlib:ValuationRing`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition II.1.11, printed p. 53.

  > Let U = Spa(B,B^+) be an affinoid subset of Y_C. Then for any maximal ideal m of B, the quotient B/m is a nonarchimedean field, inducing an injection Spm(B) -> |U|. This gives a bijection between Spm(B) and |U|^cl := |U| intersect |Y_C|^cl.

  Exact statement.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Corollary II.1.12, printed p. 53.

  > We may normalize xi_x so that its norm at all of these finitely many points is >= 1. Then for any n, if f = xi_x^n g_n, one has ||g_n|| <= ||f||. But inside the open neighborhood U_x = {|xi_x| <= |[varpi]|} of x, this implies that ||f||_{U_x} <= |[varpi]|^n ||f|| for all n, and thus ||f||_{U_x} = 0 as n -> infinity.

  The quantitative argument giving discreteness of the zero locus, hence the PID property.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition/Proposition II.1.22 and its footnote, printed p. 56.

  > Any such U has only finitely many connected components, and if U is connected, then B is a Dedekind domain. [footnote] The results on the Picard group of X_C proved below actually imply that B is a principal ideal domain.

  The X_C-version and the Picard upgrade.

### `HN-filtration-base-change` — FS II.2.13: the Harder-Narasimhan filtration commutes with extension of C and rescales under extension of E

*lemma.*

**Statement.** Let E be a vector bundle on X_C and C'|C an extension of complete algebraically closed nonarchimedean fields with pullback E'. Then (E')^{>= lambda} is the pullback of E^{>= lambda}. If instead E'|E is a finite separable extension of degree r and E' is the pullback along X_{C,E'} = X_{C,E} tensor_E E' -> X_{C,E}, then (E')^{>= lambda} is the pullback of E^{>= lambda/r}.

**Hypotheses that must not be dropped.**

- C and C' complete algebraically closed over F_q
- For the coefficient-field statement E'|E is finite SEPARABLE of degree r; one may assume it Galois by passing to Galois hulls
- The proof for C'|C uses v-descent of bundles (Prop. II.2.1) and an induction on the rank
- The slope shift by r comes from the pullback of O_{X_{C,E}}(1) being O_{X_{C,E'}}(r)

**Proof outline.**

1. By uniqueness of the HN filtration it suffices to show that pullbacks of semistable bundles are semistable.
2. Assume E semistable but E' not; by induction on rank assume the HN filtration of E' is compatible with base change; take the first nontrivial piece F of E' with mu(F) > mu(E').
3. Show F descends to X_C: by Prop. II.2.1 it suffices that the two pullbacks of F to X_{C' hat-tensor_C C'} agree, and this holds because there are no nonzero maps F -> E'/F after base change to X_R for any perfectoid C'-algebra R (such a map would exist for some algebraically closed C'', but F is semistable of slope larger than every HN slope of E'/F).
4. For E'|E use Galois descent instead, and record the slope shift.

**Acceptance.**

- Verify the rank-2 case explicitly for an unramified quadratic E'|E
- Verify that the statement fails without separability of E'|E, or record that the hypothesis is used
- Verify the descent step on a rank-3 bundle with two HN slopes

**Prerequisites.** `VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`, `RelativeFarguesFontaine:RF1`, `mathlib:Module.Free`, `mathlib:IsAlgClosed`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition II.2.13 and proof, printed p. 69.

  > This is true as there are no nonzero maps from F to E'/F after base change to X_R for any perfectoid C'-algebra R: If there were such a nonzero map, there would also be a nonzero map for some choice of R = C'' a complete algebraically closed nonarchimedean field. But then F is still semistable and all pieces of the Harder-Narasimhan filtration of E'/F are of smaller slope, so such maps do ...

  The descent step of the proof, which is where v-descent and the slope inequalities are used. The excerpt is truncated here; the full quotation is in data/decompositions/VectorBundlesAndIsocrystals.json, where the independent review checked it against the source.

### `dieudonne-manin-classification-of-bundles` — FS II.2.14: every bundle on X_C splits as a sum of the stable O(lambda)

*theorem.* **Planet: Classification of bundles on the curve.**

**Statement.** Any vector bundle E on X_C is isomorphic to a direct sum of bundles O_{X_C}(lambda), lambda in Q. If E is semistable of slope lambda then E is isomorphic to O_{X_C}(lambda)^m for some m >= 0. Equivalently the functor Isoc -> Bun(X_C) induces a bijection on isomorphism classes; it is NOT asserted to be fully faithful on morphisms.

**Hypotheses that must not be dropped.**

- C complete algebraically closed over F_q
- The induction is on the rank n, assuming the theorem for all bundles of rank <= n-1 over ALL choices of the coefficient field E
- The non-semistable case uses H^1(X_C, O(lambda)) = 0 for lambda > 0 (Prop. II.2.5(iii))
- The semistable case uses stability of O(lambda) (Ex. II.2.11) and Ext^1(O(lambda),O(lambda)) = 0 (Prop. II.2.5(ii))
- One is free to enlarge C: the v-sheaf of isomorphisms E -> O_{X_C}^n is a v-quasitorsor under GL_n(E) and becomes a torsor once a section exists somewhere; v-descent of GL_n(E)-torsors (ECD Lemma 10.13) makes it pro-etale over Spa C, hence with a section
- Existence of SOME injection O(-d) -> E is Theorem II.2.6 (ampleness)

**Proof outline.**

1. Induct on rank; rank 1 is Prop. II.2.10.
2. If E is not semistable, its HN filtration splits by vanishing of H^1(X_C, O(lambda)) for lambda > 0, so the theorem follows from the induction hypothesis.
3. If E is semistable of slope lambda = s/r, it suffices to find a nonzero map O(lambda) -> E: stability makes it injective, the quotient is again semistable of slope lambda hence O(lambda)^{m-1} by induction, and the extension splits since Ext^1(O(lambda),O(lambda)) = 0.
4. Reduce to integral lambda by the unramified base change of degree r using O_{X_C}(lambda) = f_* O_{X_{C,E'}}(s); then twist to lambda = 0.
5. Let d >= 0 be minimal (after possibly enlarging C) with an injection O(-d) -> E; such d exists by Thm. II.2.6. Suppose d > 0. Minimality makes F = E/O(-d) a bundle, to which induction applies.
6. If d >= 2, find O(-d+2) -> F by induction, pull back to an extension O(-d) -> G -> O(-d+2), twist to O(-1) -> G(d-1) -> O(1) and apply Lemma II.2.15 to get O -> G(d-1), hence O(-d+1) -> E, contradicting minimality.
7. If d = 1 and F is not semistable, take F' in F of degree >= 1 and rank <= n-2; the pullback extension E' has slope >= 0 and by induction has a global section.
8. If d = 1 and F is semistable, then F = O(1/(n-1)) and the remaining case is exactly Lemma II.2.15.

**Acceptance.**

- Verify that the functor is not fully faithful: compare Hom in isocrystals with H^0 of the Hom-bundle for O(0) (End = E vs. H^0(X_C,O) = E - then check a case where they differ, e.g. Hom(O(-1),O(0)))
- Verify the minimal-d argument on a rank-2 bundle of slope 0
- Verify the extension-splitting step using Prop. II.2.5(ii)

**Prerequisites.** `VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`, `VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`, `VectorBundlesAndIsocrystals:VB2:classification/key-extension-lemma`, `mathlib:WittVector.isocrystal_classification`, `mathlib:WittVector.StandardOneDimIsocrystal`, `mathlib:IsAlgClosed`, `mathlib:Module.Free`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem II.2.14, printed p. 70.

  > Any vector bundle E on X_C is isomorphic to a direct sum of vector bundles of the form O_{X_C}(lambda) with lambda in Q. If E is semistable of slope lambda, then E is isomorphic to O_{X_C}(lambda)^m for some m >= 0.

  Exact statement.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Theorem II.2.14, printed p. 70.

  > Next, we observe that we are free to replace C by an extension. Indeed, consider the v-sheaf sending S in Perf_C to the isomorphisms E -> O_{X_C}^n. This is a v-quasitorsor under GL_n(E) (using Proposition II.2.5 (ii)). If there is some extension of C where we can find a nonzero section of E (and thus also trivialize E), then it is a v-torsor under GL_n(E). By v-descent of ...

  The enlargement-of-C device, which is what lets Lemma II.2.15 be used even though it only produces a section after an extension. The excerpt is truncated here; the full quotation is in data/decompositions/VectorBundlesAndIsocrystals.json, where the independent review checked it against the source.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Theorem II.2.14, printed p. 70.

  > Let d >= 0 be minimal such that there is an injection O_{X_C}(-d) -> E, possibly after base enlarging C; by Theorem II.2.6 some such d exists. We want to see that d = 0, so assume d > 0 by way of contradiction.

  The minimal-twist induction, and its dependence on the ampleness theorem.

### `key-extension-lemma` — FS II.2.15: the key lemma producing a global section of an extension of O(1/n) by O(-1)

*lemma.*

**Statement.** Let 0 -> O_{X_C}(-1) -> E -> O_{X_C}(1/n) -> 0 be an extension of vector bundles on X_C, n >= 1. Then there is an extension C'|C of complete algebraically closed nonarchimedean fields with H^0(X_{C'}, E|_{X_{C'}}) nonzero.

**Hypotheses that must not be dropped.**

- C complete algebraically closed over F_q; the conclusion only holds after an extension C'|C, which is why Thm. II.2.14 needs the v-torsor device
- The proof uses the identification BC(O_{X_C}(-1)[1]) = (A^1_{C^sharp})^diamond/E from Prop. II.2.5(i)
- The classification of E-linear maps (A^1_{C^sharp})^diamond -> (A^1_{C^sharp})^diamond is reduced to maps of adic spaces A^1 -> A^1 by [SW20, Proposition 10.2.3] in the p-adic case, and to A^1_{C,perf} -> A^1_{C,perf} in the equal-characteristic case, where fractional powers X^{1/p^i} may a priori occur
- The contradiction in the p-adic case uses that A^1_{C^sharp} is not a perfectoid space; in equal characteristic Fargues-Scholze explicitly say they could not settle whether BC(O(-1)[1]) is perfectoid, and argue differently

**Proof outline.**

1. Assume H^0 vanishes after every extension; then passing to Banach-Colmez spaces gives an injection of v-sheaves f : BC(O(1/n)) -> BC(O(-1)[1]).
2. The image cannot lie in the classical points (those are totally disconnected while the source is connected and not a point), so it contains a nonclassical point; after base change to some C' it contains a nonempty open subset, by the presentation BC(O(-1)[1]) = (A^1_{C^sharp})^diamond/E and the behaviour of nonclassical points of A^1 (as in the proof of Prop. II.1.11).
3. Translate to the origin and rescale by the contracting E^times-action to conclude f is surjective, hence an isomorphism.
4. Then BC(O(-1)[1]) would be a perfectoid space. In the p-adic case this is absurd since (A^1_{C^sharp})^diamond would be pro-etale over a perfectoid space.
5. In general: there is a nonzero map BC(O(1/n)) -> (A^1_{C^sharp})^diamond (evaluate at the chosen untilt); composing with f^{-1} gives a nonzero E-linear map (A^1_{C^sharp})^diamond -> (A^1_{C^sharp})^diamond, i.e. an additive convergent power series g with g(aX) = a g(X) for a in E. The relation g(pi X) = pi g(X) alone forces g(X) = cX, so g is zero or an isomorphism; but the constructed map is nonzero with nontrivial kernel - contradiction.

**Acceptance.**

- Verify that the classical points of BC(O(-1)[1]) form a totally disconnected subset while BC(O(1/n)) is connected
- Verify the power-series argument: derive from g(pi X) = pi g(X) that only the linear coefficient survives, including the fractional-exponent case
- Verify the claim that A^1_{C^sharp} is not perfectoid

**Prerequisites.** `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `mathlib:IsAlgClosed`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Lemma II.2.15, printed p. 71.

  > Let 0 -> O_{X_C}(-1) -> E -> O_{X_C}(1/n) -> 0 be an extension of vector bundles on X_C, for some n >= 1. Then there is some extension C'|C of complete algebraically closed nonarchimedean fields such that H^0(X_{C'}, E|_{X_{C'}}) is nonzero.

  Exact statement, including the necessity of enlarging C.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Lemma II.2.15, printed pp. 71-72.

  > The equation g(pi X) = pi g(X) alone in fact shows that only the linear coefficient of g may be nonzero, so g(X) = cX for some c in C^sharp, and thus g is either an isomorphism or zero. But our given map is nonzero with nontrivial kernel, giving a contradiction.

  The final contradiction, which is the actual content of the 'new and direct proof' Fargues-Scholze advertise.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Footnote 5 to Lemma II.2.15, printed p. 71.

  > We believe that also when E is of equal characteristic, BC(O_{X_C}(-1)[1]) is not a perfectoid space, but we were not able to settle this easily.

  Records that the p-adic shortcut is unavailable in equal characteristic, so the power-series argument is the one that must be reproved in general.

## Requests

- **`RelativeFarguesFontaine:RF0:integral-Y`** — The integral period space Y and the ring W_{O_E}(O_F) with its Frobenius, before the special fibre is removed. L = W_{O_E}(F_q-bar)[1/pi] and the uniformizer pi of E are this layer's objects.
- **`RelativeFarguesFontaine:RF1`** — The quotient by phi^Z and the curve X_S itself, functorially in the base. Every bundle in this packet lives on X_S, and the change-of-coefficients comparison is along pi_{E'|E} : X_{E'} -> X_E.
- **`RelativeFarguesFontaine:RF2:untilts`** — Untilts and the local de Rham rings, and Div^1(C), with which the classical points of X_C are identified.
- **`RelativeFarguesFontaine:RF3`** — Line bundles on the curve and the graded algebra P of sections of the twists, with the computation Pic(X_C) = Z. The degree of a bundle is defined through that identification, and X^alg is Proj of that algebra, so this layer cannot even state its degree function without it.
- **`DiamondsAndVStacks:D3`** — Effective descent and the v-topology on perfectoid spaces, in which the v-sheaf and v-stack statements of VB1 are made.
- **`DiamondsAndVStacks:D5`** — Locally spatial diamonds and relative representability. Theorem II.2.5 asserts that BC(O(lambda)) and BC(O(lambda)[1]) are relatively representable IN LOCALLY SPATIAL DIAMONDS; the atlas has no edge from this layer into VB1, although that is where the statement is made.
- **`DiamondSixOperations:S4`** — Cohomological smoothness with its descent hypotheses. The same Theorem II.2.5 asserts that those Banach-Colmez spaces are partially proper and COHOMOLOGICALLY SMOOTH. The atlas links this layer into VB3:general-BC but not into VB1.
- **`DiamondSixOperations:S5`** — The worked examples of cohomological smoothness, in particular the perfectoid open unit ball: part (iv) of Theorem II.2.5 identifies BC(O(lambda)) with Spd of a perfectoid power series ring for small positive lambda.
- **`PerfectoidSpaces:P2`** — Perfectoid pullback and rational localisations, used for the affinoid subsets U = Spa(B,B^+) of Y_C whose maximal ideals give the classical points.
- **`VectorBundlesAndIsocrystals:VB3:positive-basic-examples`** — The Lubin-Tate universal cover and the fundamental exact sequence, which are stage content of the other part of this roadmap (BP-VectorBundlesAndIsocrystals--VB3) and are consumed here: the decomposition's link graph runs VB3:positive-basic-examples/lubin-tate-universal-cover -> VB1/cohomology-of-twists and VB3:positive-basic-examples/fundamental-exact-sequence -> VB2:ampleness/schematic-curve-at-a-geometric-point. The atlas records the opposite direction, which the last gap and the structural proposal address.

## Gaps

### Dieudonne-Manin is quoted, never proved, in anything read

Fargues-Scholze use 'the simple isocrystal of slope lambda in the Dieudonne-Manin classification' (printed p. 58) and 'By the Dieudonne-Manin classification, we can find a basis for D so that phi is E-rational and U := phi^N is a diagonal matrix with entries powers of pi' (printed p. 82) without proof. Fargues-Fontaine Prop. 8.2.6 says 'Du theoreme de Dieudonne-Manin on deduit le resultat suivant' (printed p. 287) - also a quotation. The only statement located in the library is Proposition 2.36 on printed p. 26, which is inside PIERRE COLMEZ'S PREFACE to the Fargues-Fontaine volume and is explicitly a recollection ('Rappelons l'enonce du classique theoreme de Dieudonne-Manin'), stated for Q_p-breve and with no proof. NEXT SOURCE ACTION: read a source that proves Dieudonne-Manin over W_{O_E}(k)[1/pi] for k algebraically closed - candidates are Zink, 'Cartiertheorie kommutativer formaler Gruppen' (cited as [62] in the Fargues-Fontaine bibliography, not in the library) or Demazure's Lectures on p-divisible groups. Until then VB0's central classification is an unread import, NOT an input package.

### The Brauer invariant of D_lambda is an open obligation

The VB0 stage text says: 'Use the campaign's Brauer/local-field theory for the invariant and prove its compatibility with the explicit cyclic algebra; absent such an input, the cyclic-algebra and Brauer-invariant calculation is an obligation here.' Fargues-Fontaine Definition 8.2.7 (printed p. 287) gives only the presentation D_lambda = E_h[Pi], Pi^h = pi^d, Pi x = sigma_E(x) Pi, and Proposition 8.2.8 computes only dim_E End(O(lambda)) = h^2. No passage read computes inv(D_lambda). NEXT SOURCE ACTION: read Serre, Corps locaux (cited as [59] in the Fargues-Fontaine bibliography) Ch. XII-XIII, or the campaign's own Brauer-group roadmap, for the invariant of a cyclic algebra (E_h/E, sigma_E, pi^d), and record the resulting sign relative to lambda = d/h.

### Kedlaya-Liu is present in the library but unread, while three theorems are attributed to it

FS attribute Theorem II.2.6 to [KL15, Proposition 6.2.4], call Proposition II.2.7 'an axiomatization of [KL15, Theorem 6.3.9]', and attribute Theorem II.2.19 to [KL15, Theorem 7.4.5, Theorem 7.4.9, Theorem 7.3.7, Proposition 7.3.6] and Corollary II.2.20 to [KL15, Theorem 8.5.12]. VERIFIED PRESENT in the library: references/papers/KedlayaLiu_RelativePadicHodgeFoundations.pdf, 'Relative p-adic Hodge theory: foundations', 210 pages, sha256 a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942. NOT READ. FS give self-contained proofs of II.2.6, II.2.7 and II.2.19, which is what this packet decomposed; the Kedlaya-Liu originals are therefore not on the critical path, but the attribution should be checked before any statement is credited to them. NEXT SOURCE ACTION: read KL15 6.2.4, 6.3.9, 7.3.6-7.3.7, 7.4.5, 7.4.9, 8.5.12 and compare hypotheses (in particular whether KL15 covers equal-characteristic E, which FS say they extend).

### Fargues-Scholze compress the step from [SW13, Theorem A] to the explicit B^{phi=pi} identification

RESOLVED IN PART. The library file references/papers/R02_DF_ScholzeWeinsteinModuli.pdf was opened and verified to be Scholze-Weinstein, 'Moduli of p-divisible groups', arXiv:1211.6357v2 (13 April 2013), sha256 984411ef6c3d735a713684d4c9251fbad411a40eab33cefed8ab5c8412b09f6d. Theorem A (printed p. 3), Proposition 3.1.3 (printed p. 22) and Lemma 3.5.1 (printed p. 29) were read and are now cited directly in the nodes. WHAT REMAINS: Theorem A asserts full faithfulness of the Dieudonne module functor over f-semiperfect rings. Fargues-Scholze's proof of Proposition II.2.2 writes 'then [SW13, Theorem A] gives the desired B^{phi=pi}_{R,[1,infty]} = Hom_{O_E}(E/O_E, G(R^{sharp+}/pi))[1/pi] = G-tilde(R^{sharp+}/pi) = G-tilde(R^{sharp+})', with no intermediate argument. Full faithfulness does not by itself compute the phi = pi eigenspace of B^+_crys; the missing link is the identification of that eigenspace with the Dieudonne module of the Lubin-Tate group, i.e. an essential-surjectivity/classification input. NEXT SOURCE ACTION: read [SW13] Section 5 (the classification of p-divisible groups over O_C) and Proposition 5.1.6 / Theorem 5.2.1 there, and the corresponding passage in Scholze-Weinstein's Berkeley Lectures Lecture 14, to supply the missing step. Until then the p-adic half of Proposition II.2.2 is an unresolved import boundary.

### Harder-Narasimhan sign/dominance convention is not pinned across sources

SHARPENED BY INDEPENDENT REVIEW with exact locators. Fargues-Scholze describe the HN polygon as 'the convex hull of the points (i,d_i) for i = 0,...,n, where d_i is the maximal integer such that H^0(X_C,(wedge^i E)(-d_i)|_{X_C}) is nonzero' (printed p. 74) - so their first coordinate is the RANK and their second the degree, and the polygon is a CONVEX hull. Fargues-Fontaine, in the general formalism this packet cites for the HN axiomatics, write instead (printed p. 213, Theoreme 5.5.2 and Theoreme 5.5.3): 'on note HN(X) l'unique polygone CONCAVE d'origine (0,0) et ayant pour pentes mu(X_i/X_{i-1})' and 'HN(X) est l'enveloppe CONCAVE des points (deg(X'), rg(X')) lorsque X' parcourt les sous-objets de X' - so their coordinates are (DEGREE, RANK) and the polygon is a concave envelope. The two descriptions therefore differ both by an axis swap and by convex-vs-concave; neither source reconciles them, and the isocrystal functor E(-) reverses slopes on top of that. A third normalisation appears inside the same volume: Colmez's preface (printed p. 26, section 2.5.3, Proposition 2.36) states Dieudonne-Manin with the block phi(e_h) = pi^d e_1, whereas Fargues-Fontaine's own section 8.2 (printed p. 287) uses phi(e_h) = pi^{-d} e_1. This is a live normalisation risk for any consumer comparing an isocrystal Newton polygon with a bundle HN polygon. NEXT SOURCE ACTION: read Fargues-Fontaine 5.5 in full (printed pp. 212-220) and fix ONE convention explicitly in the roadmap text, recording the translation to the other two.

### Atlas substage order is the reverse of the source's proof order: VB2:ampleness -> VB1, VB2:classification -> VB2:ampleness and VB3:positive-basic-examples -> VB1, while the atlas has all three edges the other way

Added by independent review. All three links are source-correct at NODE level. (a) The proof of Proposition II.2.10 (Pic(X_C) = Z, printed p. 68) opens 'By Proposition II.2.9, any line bundle becomes trivial after removing one closed point x in X_C^alg', so II.2.9 precedes the degree/slope formalism; the atlas has VB1 -> VB2:ampleness. (b) The proof of II.2.9 uses the classical points of X_C and their principal-ideal-domain property (II.1.11, II.1.22), which this packet parents to VB2:classification; the atlas has VB2:ampleness -> VB2:classification. (c) The proof of Proposition II.2.5(iv) (printed p. 63) says 'BC(O(1)) = Spd F_q[[x^{1/p^infty}]] by Proposition II.2.2', so the Lubin-Tate computation precedes the cohomology of twists; the atlas has VB1 -> VB3:positive-basic-examples. Note that II.2.2's own proof in turn says 'as in the proof of Proposition II.2.5 below', so the two are mutually referential in the source and cannot both be ordered strictly. CONSEQUENCE AND DECISION NEEDED. The node-level link graph of all thirteen packets of this job is ACYCLIC (197 nodes, 210 edges, checked). The cycle appears only if node links are lifted to stage edges and unioned with data/atlas.json stageEdges. Nothing was reversed here, because reversing would misstate the source. The orchestrator must choose: (i) treat these as node-level edges only and do not lift them to stage edges at integration; (ii) re-parent the offending node (or split it) so that its stage matches the source's order; or (iii) revise the atlas substage ordering. Option (iii) is the one the source actually supports in each case.

### The Fargues-Fontaine source hash does not reproduce: the book on the author's page has changed, and the printed pages have shifted by exactly 50

The file at the recorded URL was downloaded again in this session. Its SHA-256 is 8c020573d3dce341088ea7e83fe1063b410686c08e3a144fa3c0de634667cc79 and the record says cc159f38a3801c736b71ecea363496abe7706550bfb416600718ee9933922ca3, so the recorded hash does NOT reproduce; the URL carries a living version of the book. Rather than leave that as a bare failure, the locators were checked against the current file by inflating its object streams and extracting the text. Two things came out. First, EVERY cited statement number is present and unchanged: Definition 5.5.1, Theoreme 5.5.4, Definition 5.5.5, Proposition 5.5.6, section 8.2.3 'Lien avec les isocristaux', Definition 8.2.5, Proposition 8.2.6, Definition 8.2.7, Proposition 8.2.8, Remarque 8.2.9 and Theoreme 8.2.10. Second, the PRINTED PAGE NUMBERS are uniformly 50 lower: section 5.5 begins on printed p. 162 where the record says 212-215, Definition 8.2.5 is on printed p. 236 where the record says 286, and Theoreme 8.2.10 on printed p. 238 where the record says 288. The current file has 404 PDF pages where the record says 400. Fifty is exactly the length of Colmez's preface, which the record's own edition field puts at printed pp. 1-50: the version the decomposition read paginates the preface and the main text continuously, and the current file restarts the main text at 1. So the mathematical half of every Fargues-Fontaine locator in this packet is corroborated in this session and the page half is not, and a reader of the current file should subtract 50. A maintainer may wish to record the hash of a fixed edition - the text is published as Asterisque 406 - or to cite by statement number alone, which is the portable half.

### Mathlib already has isocrystals, the standard one-dimensional block and the rank-one Dieudonne-Manin theorem

data/library-coverage.json has no reviewed audit entry for this roadmap, so the pinned declaration index was searched directly. Mathlib/RingTheory/WittVector/Isocrystal.lean, read at the pinned commit 082e2d3, contains WittVector.FractionRing.frobenius and frobeniusRingHom (Frobenius as an automorphism of K(p,k) = W(k)[1/p] for k perfect), the class WittVector.Isocrystal, WittVector.IsocrystalHom and IsocrystalEquiv, WittVector.StandardOneDimIsocrystal m for m in Z, and the theorem WittVector.isocrystal_classification, which says that over an algebraically closed field of characteristic p a ONE-DIMENSIONAL isocrystal is isomorphic to a standard one. So for E = Q_p the category of VB0 and the rank-one case of Dieudonne-Manin are already formalised, and this packet cites them rather than planning them. What remains, and is what the node plans: the general-E version over L_E = W_{O_E}(F_q-bar)[1/pi] with sigma_E, whose standard block is phi^h = pi^{-d} sigma^h for coprime d and h; Dieudonne-Manin in all dimensions, which the decomposition records as quoted and never proved in anything read; and the functor E(D,phi) to bundles on the curve. The pinned one-dimensional theorem is where a proof of the general case would start, and the packet's first gap - that Dieudonne-Manin is quoted, never proved - should be read together with this.

### Nothing in the Harder-Narasimhan half of VB1 exists at either pin, and two supplier edges are missing

The same index search found no declaration at either pin whose name contains HarderNarasimhan, Semistable, SemiStable or PicardGroup, and no ampleness in the algebro-geometric sense. Tau Ceti has the line-bundle carrier, TauCeti.AlgebraicGeometry.InvertibleSheaf, and Mathlib has IsPrincipalIdealRing, IsDedekindDomain, ValuationRing, AlgebraicGeometry.Scheme and AlgebraicGeometry.IsProper, which cover the commutative-algebra and schematic half of VB2; the slope formalism itself is entirely new. Separately, two supplier edges are absent from the atlas: Theorem II.2.5 asserts that the Banach-Colmez spaces BC(O(lambda)) and BC(O(lambda)[1]) are relatively representable in LOCALLY SPATIAL DIAMONDS and COHOMOLOGICALLY SMOOTH, so VB1 consumes DiamondsAndVStacks:D5 and DiamondSixOperations:S4, and the atlas links the second only into VB3:general-BC and the first not at all. Both are filed as requests here; a kind:link job should draw the edges. Finally, the atlas records UPSTREAM:LocalFieldsRamification as a supplier of VB0, but that identifier is not a stage of data/atlas.json, so it cannot be named in a request; the unramified extensions E_h and the uniformizer pi are cited from the pinned libraries instead.

## Structural proposals

### Three atlas edges inside this roadmap run against the source's proof order (`reorder-links`)

The reviewed decomposition's last gap records it and the link graph confirms it. Its node links run VB2:ampleness/schematic-curve-at-a-geometric-point -> VB1/degree-rank-slope-and-HN-formalism, VB2:classification/classical-points-and-principal-ideal-domains -> VB2:ampleness/schematic-curve-at-a-geometric-point, and VB3:positive-basic-examples/lubin-tate-universal-cover -> VB1/cohomology-of-twists together with VB3:positive-basic-examples/fundamental-exact-sequence -> VB2:ampleness/schematic-curve-at-a-geometric-point; the atlas has all three the other way. The mathematics is not in doubt: the degree function needs Pic(X_C) = Z and the saturation of subbundles, which the schematic model supplies; the PID structure of affinoids of Y_C is what makes X_C^alg regular of dimension one; and the fundamental exact sequence and the Lubin-Tate cover are inputs to the cohomology of the twists, not consequences of it. An edge in the wrong direction makes the atlas assert a dependency the source reverses, and, since these are edges between substages of one roadmap, it also makes the roadmap look internally circular to a reader who follows the arrows. A kind:link job should correct all three.

### VB0's isocrystal node should cite the pinned Mathlib rather than restate it (`narrow-layer`)

The stage text of VB0 asks for the category of isocrystals, the standard slope block and the Dieudonne-Manin decomposition. At the pinned commit Mathlib already has the category (WittVector.Isocrystal, with its morphisms and isomorphisms), the standard block in rank one (WittVector.StandardOneDimIsocrystal) and the rank-one classification over an algebraically closed field (WittVector.isocrystal_classification), all for E = Q_p. Narrowing the stage text to what is genuinely missing - the ramified and unramified general-E version with sigma_E and pi, the higher-rank blocks phi^h = pi^{-d} sigma^h, Dieudonne-Manin in all dimensions, and the functor to bundles - would stop the layer reading as though the notion had to be built here, and would make the boundary with the pinned library visible in the text as well as in this packet's baseline. It would also sharpen the layer's own first gap, which records that Dieudonne-Manin is quoted and never proved in anything read: the rank-one case is proved, in Lean, at the pin.

## Planets

| layer | planets |
| --- | --- |
| `VB0` | Isocrystals and the standard slope block; The division algebra D_lambda |
| `VB1` | Bundles on the curve form a v-stack; Degree, slope and the HN formalism; Cohomology of the twists O(lambda) |
| `VB2` | — |
| `VB2:ampleness` | Positive twists are globally generated; The axiomatic GAGA theorem; The schematic curve X^alg |
| `VB2:classification` | Classical points and PID complements; Classification of bundles on the curve |

## Nothing here is formalised

No Lean was compiled for this job and no statement in this packet is claimed to be formalised. The suggested file
is a set of signatures whose only proof is `sorry`; every `implementationStatus` is `unchecked`.
