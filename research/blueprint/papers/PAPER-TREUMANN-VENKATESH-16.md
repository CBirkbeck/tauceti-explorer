# PAPER-TREUMANN-VENKATESH-16 — Functoriality, Smith theory, and the Brauer homomorphism

Claude Code — session `cc-7b31c4`; issue #1176; read on 22 September 2026.

David Treumann and Akshay Venkatesh, *Functoriality, Smith theory, and the Brauer homomorphism*, Annals of
Mathematics **183** (2016), no. 1, 177–228 (doi
[10.4007/annals.2016.183.1.4](https://doi.org/10.4007/annals.2016.183.1.4)). Read in the **LaTeX source** of
[arXiv:1407.2346v1](https://arxiv.org/abs/1407.2346) (9 July 2014, the only version; `TV_submit.tex`, 5733
lines, source archive sha256 `28e20b81…`).

**On the published version.** The published version **could not be read**. The Annals article page serves
the text only as a PDF; that PDF (`annals-v183-n1-p04-p.pdf`) downloads freely but is **encrypted** with the
standard security handler (`/Filter /Standard /V 2 /Length 128`), so its content streams cannot be
decompressed. No PDF text-extraction tool is installed in this environment either (`pdftotext`, `mutool`,
`gs`, `qpdf`, `pypdf`, `PyPDF2`, `fitz`, `pdfminer`, `pdfplumber` are all absent) — but that is not the
obstacle: a text extractor written for the purpose does read unencrypted PDFs, and was checked on the arXiv
PDF of this paper, which it reads in full. The encryption of the published PDF is the reason the printed text
is not cited here. Every locator below is a preprint locator, and the four source issues are recorded against
the preprint with **no claim about print**.

**On numbering.** The preprint declares `\newtheorem{theorem}[subsection]{Theorem}`, so theorems, propositions,
lemmas, corollaries and definitions **share the subsection counter**: numbered statements interleave with
subsection numbers (§2.11, Theorem 2.12, §2.13, …) and there are only 45 numbered statements in 12 sections.
Much of the paper's content sits in *unnumbered* `theorem*`/`prop*`/`lemma*` environments, each attached to a
subsection and referred to in the text as "the Theorem of §*x*". Those are located here by subsection and
position. There are no duplicate labels and no undefined references.

The paper has been extracted into **107 items**. Three are `library`, fifteen are `planned` by existing layers,
and the remaining **89 are missing and routed exactly once**: 32 to a Part II of *Arithmetic locally symmetric
spaces and their cohomology*, 49 to a Part II of the Tau Ceti *Reductive algebraic groups* roadmap, and 8 (with
2 planned items named alongside) as a source of `SmoothRepresentationsOfLocalGroups`.

## What the paper proves

Let `G` be semisimple over a number field `F`, let `k` be an algebraic closure of `F_p`, and call a *mod p
automorphic form* a Hecke eigenclass in `H^*([G]_K ; k)` — **with no assumption that it lifts to characteristic
zero**. Let `σ` be an `F`-rational automorphism of `G` of order `p` with connected fixed points `H = G^σ`.

* **The Brauer homomorphism.** For `K ⊂ G` a compact open subgroup that is *σ-plain* (§4.1: `G^σ/K^σ →
  (G/K)^σ` is a bijection and `K` is virtually prime-to-`p`), restricting a `σ`-invariant Hecke operator from
  `G/K × G/K` to the `σ`-fixed points is an algebra map `Br : H(G,K)^σ → H(G^σ,K^σ)`; it is the Brauer
  homomorphism of modular representation theory. When both algebras are commutative domains, `Br^p` extends
  uniquely and, twisted to be `k`-linear on the `F_p`-form, gives the **normalized Brauer homomorphism** `nBr`,
  with `nBr(h)(K^σ,gK^σ) = ((h ∗ ⋯ ∗ h)(K,gK))^{1/p}`.
* **Theorem 4.4 (Smith theory).** With `σ` acting compatibly on `G`, `K` and a space `X` with free proper
  `K`-action, `X/K` of finite cohomological dimension and `K` σ-plain: every composition factor of
  `H^*(X^σ/K^σ)` as an `H(G,K)^σ`-module through `Br` is a composition factor of `H^*(X/K)`; and every Hecke
  eigenvalue `χ` of the former gives the eigenvalue `χ ∘ nBr` of the latter. The proof is `Z/p`-equivariant
  fixed-point localisation, run on a **Smith double complex** whose rows alternate `1−σ` and the norm `N`, and
  kept Hecke-equivariant throughout. One spectral sequence degenerates at `E_2` onto `H_*((X/K)^σ)`; the other
  has `E_2 = T^* H_*(X/K)`.
* **First Main Theorem (Theorem 5.8).** If a mod `p` automorphic form for `G^σ` has Satake parameters `{a_v}`,
  there is a mod `p` automorphic form for `G` with Satake parameters `{ψ_v^*(a_v)}`. The geometric input is
  Proposition §5.7: `[H]_U` maps homeomorphically onto a **union of connected components** of the `σ`-fixed
  locus of `G(F)\G(A)/K^{(V)}` — the symmetric space of `G^σ` behaves, for characteristic `p` homology, like an
  "interior boundary" of the symmetric space of `G`. Almost all places are `σ`-good (Proposition 5.6), by
  spreading out `g ↦ g^{-1}σ(g)` and using Steinberg's theorem over the residue field.
* **Theorem 6.5 (ramified places).** Define `π` of `H_v` to be *linked* with a `σ`-fixed `Π` of `G_v` if the
  Frobenius twist `π^{(p)}` is a Jordan–Hölder constituent of `T^0(Π)` or `T^1(Π)`. Then every irreducible
  subquotient of `π(χ)` is linked with one of `Π(χ ∘ nBr)`. The suggestion is that **local functoriality should
  be realised by Tate cohomology**; §6.3 records two conjectures to that effect.
* **The Theorem of §8.1.** `Spec(nBr) : (Ĥ ⋊ γ)//Ĥ → (Ĝ ⋊ γ)//Ĝ` is computed: it is the **dual norm** `N̂`
  attached to a `γ`-admissible Borel class, shifted by the pseudoroots — every class has a representative
  `t ρ_H^{-1}(γ)` whose image is represented by `N̂(t) ρ_G^{-1}(γ)`, with `N̂(t)` central in the dual Levi. The
  proof extends a Borel of `H_v` to a `σ`-stable parabolic of `G_v` (Lemma 8.7), so that `T^0` of an induced
  representation surjects onto an induced representation of `H_v`.
* **Second Main Theorem (Theorem 9.1).** If `G` is simply connected and `H = G^σ` semisimple, a *σ-dual
  homomorphism* `^Lψ : ^LH → ^LG` exists — a homomorphism of `L`-groups, taken over `k`, inducing `nBr` through
  Satake — except possibly when `(Lie G, Lie H)` has a factor `(e_6, sl_3^3` or `sl_6 × sl_2` or `sp_8)`. A
  special case is **cyclic base change for torsion classes**, which does not follow from classical base change
  even for `SL_2` over `Q(i)`.

The proof of the second theorem is a long case analysis. `Out(G)` trivial with `p = 2` and `π_1 H` a 2-group is
Proposition 11.2; `σ` conjugate to a pinned automorphism is Proposition 11.5, where the dual norm extends to an
isogeny `Ĥ → Ĝ^σ` through the **exceptional isogenies** of characteristic 2 and 3 (for pinned triality on
`Spin_8` the map `G_2 → PSO_8` is the standard eight-dimensional one *twisted by the characteristic-3 isogeny*
`G_2 → G_2`); inner automorphisms of order 3 are Proposition 10.6, where the action of `^Lψ` on the Galois
component must exactly compensate the difference of half-sum shifts; and the rest is Theorem 12.1, of which only
`(e_8, sl_5^2)` with `p = 5` is given in full. If `G` is not simply connected no such `^Lψ` need exist: for
`PGL_2/Q` with `σ` inner of order 3 there is none, and none for `C`-groups either; §7.8 proposes the smaller
**c-group** `ĉG`, for which the Satake isomorphism is canonical (Theorem 7.9) and for which the example does
have a σ-dual map.

## What the atlas already has

* `ArithmeticLocallySymmetricSpaces` **ALS.0** symmetric spaces and components, **ALS.1** local systems and
  chain complexes, **ALS.3** Hecke correspondences on complexes in the derived category, **ALS.4** boundary and
  Levi cohomology with parabolic induction and Satake.
* `AdelicAlgebraicGroups` **AA.0/AA.1/AA.3/AA.4**: restricted products, adelic points and functoriality,
  reduction theory, approximation and level maps.
* `SmoothRepresentationsOfLocalGroups` **SR.0** the smooth abelian category over arbitrary coefficients with
  invariants and admissibility, **SR.1** Hecke algebras over rings (which explicitly directs characteristic-`p`
  work into the smooth action category), **SR.2** unnormalized and normalized induction and Jacquet functors,
  **SR.4** spherical representations and the Satake isomorphism at a hyperspecial level.
* `ReductiveGroupsPartII` **RG2.1** relative roots and the relative Weyl group, **RG2.3** parahoric and
  hyperspecial group schemes, **RG2.5** the integral pinned dual group and the semidirect `L`-group with Levi
  inclusions.
* `tauceti:TauCetiRoadmap/ReductiveGroups` **layer 7** Borel and parabolic subgroups, Levi decomposition, root
  data with the absolute Galois action and the relative root system; **layer 9** pinned Chevalley–Demazure group
  schemes over `Z`, base change, points over an algebraically closed field functorially in the field (so the
  `q`-power Frobenius), the isomorphism theorem for pinned groups, and the **special isogenies** in
  characteristics 2 and 3.
* **Libraries.** Mathlib has the Tate complex and Tate cohomology of a finite group with the connecting map and
  the long exact sequence (`tateCohomology`, `Rep.tateNorm`, `TateCohomology.δ`, `exact₁`, `exact₃`); Tau Ceti
  identifies degree 0 with `M^G/NM`, degree `−1` with `ker N/I_G M`, and proves 2-periodicity for a cyclic group
  (`TauCeti.TateCohomology.H0IsoNormQuotient`, `Rep.FiniteCyclicGroup.periodicIso`). Mathlib and Tau Ceti
  together have the double-coset Hecke ring with its convolution, associativity, anti-involution and
  commutativity criterion (`IsHeckeTriple`, `HeckeRing`, `HeckeAntiInvolution.bar`). Mathlib has Witt vectors and
  `linearIndependent_monoidHom`, the linear independence of characters used in §3.4. So **§3.1 is already done**,
  and must not be rebuilt.

## What the atlas lacks

A search of `data/atlas.json` for *Smith theory* returns nothing, and the only Tate cohomology in the atlas is
the class-formation layer of the Tau Ceti class field theory roadmap. Nothing plans the Brauer homomorphism, the
characteristic-`p` normalization of Satake, pseudoroots, the `C`-group or `c`-group, Borel–de Siebenthal, the
endoscopic subgroups of the dual group, admissible Borel classes, dual norms, or σ-dual homomorphisms.

## The routes

**1. `SmithTheoryAndModPFunctoriality` — Part II of `ArithmeticLocallySymmetricSpaces` (32 items, area
`automorphic`).** *Arithmetic locally symmetric spaces and their cohomology, Part II: Smith theory and mod p
functoriality.* Sections 3–6 act on exactly the objects the parent roadmap owns — the spaces (ALS.0), their
chain complexes (ALS.1) and the Hecke correspondences on them (ALS.3) — and add a `Z/p`-action on that package
together with the fixed-point localisation it supports. The layer must cover Tate cohomology of an order `p`
action on compactly supported sections of an equivariant sheaf on an `ℓ`-space and on a commutative `k`-algebra;
σ-plain subgroups and the nonabelian cohomology defining them; `Br` and `nBr`; the Smith double complex with the
degeneration of one spectral sequence and the convergence of the other; the σ-action set-up, σ-good places, and
the component analysis; linkage with the conjectures of §6.3 and the ramified theorem; and the definition of a
σ-dual homomorphism with Theorem 5.8 restated as a functorial lift.

This is **deliberately disjoint** from `ArithmeticLocallySymmetricSpacesPartII` (the derived Hecke algebra and
the reciprocity law), proposed for the same parent by `PAPER-VENKATESH-19`: that one plans a derived enhancement
of the Hecke action in characteristic zero and says nothing about group actions on the spaces.

**2. `SigmaDualHomomorphismsInCharacteristicP` — Part II of `tauceti:TauCetiRoadmap/ReductiveGroups` (49 items,
area `grouptheory`).** *Reductive algebraic groups, Part II: prime-order automorphisms, dual norms and σ-dual
homomorphisms in characteristic p.* Sections 8–12 are almost pure structure theory in characteristic `p`:
fixed subgroups of a prime-order automorphism, Borel–de Siebenthal and its dual, the Levi `L_G(γ)`, admissible
Borels and the parabolic they generate, norm and dual norm maps, the invariants `e_α, f_α, θ_α` of a pinned
automorphism, exceptional isogenies, and explicit Weyl-group computations in `E_7` and `E_8`. The Tau Ceti
reductive-groups roadmap is the roadmap in that direction; because it is **Tau Ceti it is existing work and is
never re-planned**, so what extends it is a Part II (PROTOCOL §15). The Theorem of §8.1 is placed here with the
rest of §8, since its content is the dual norm attached to an admissible Borel class; it imports the Brauer
homomorphism itself from route 1.

**3. `SmoothRepresentationsOfLocalGroups` — source for SR.0, SR.1, SR.2, SR.4 (10 items).** §7 is, in the
authors' words, folklore on the Satake transform written out because they know no reference with characteristic
`p` coefficients — and it lands inside layers SR.4 already plans. SR.4 promises the Satake transform at a
hyperspecial level, the isomorphism with the invariant algebra on the dual torus retaining the relative Weyl
group and Frobenius action, **with the coefficients and the q-half normalization to be specified** and the
unnormalized integral form recorded separately. That is precisely what §§7.1–7.4 and 7.6 supply over `k`: the
twisted action `w ∗ a = wa·√(Σ*_G/wΣ*_G)(q_v)` that removes the need for a square root of `q_v`; the invariant
theory lemma; **local pseudoroots** as the canonical substitute for the `q`-half normalization; the Satake
parameter of an unnormalized parabolic induction; and Theorem 7.9 in terms of the `c`-group. The unramified
correspondence for tori (§2.9) is the base case of the same identification. `Fun_G(S×S)` for a general discrete
`G`-set goes to SR.1, whose description already directs characteristic-`p` work to integral double-coset
operators in the smooth action category.

Items **not** routed are the fifteen already planned — level structures and the restricted tensor product
(AA.0/AA.1/AA.4), the based root datum with its Galois action and the Frobenius on points (Tau Ceti reductive
groups, layers 7 and 9), the dual group, `L`-group, local `L`-group and dual Levis (RG2.5), the Hecke action on
cohomology (ALS.1/ALS.3), `[G]_K` (ALS.0), good places (RG2.3, SR.4), properness by reduction theory (AA.3),
admissible `k`-representations (SR.0), the restricted Weyl group (RG2.1) and the Satake isomorphism itself
(SR.4) — and the three that are `library`.

## Source issues

Four misprints, all found by mechanical audits of the source and all with **`affects: nothing`**: the intended
reading is clear in each case and no proof or stated result changes.

* **E1 (§12.2, the Levi `L_G(U²)`).** The roots adjoined are printed as `±x₁, ±y₃, ±y₁, ±y₃` — only three
  distinct root pairs, which cannot give the `SL_2^4` asserted two lines later. **It should read `±x₁, ±x₃,
  ±y₁, ±y₃`.** Verified by direct computation in the `E_8` root system from the simple roots of (12.1): `U` is
  orthogonal of order 4 and equals `s_{x₁}s_{x₂+x₃}s_{−x₁−x₂}s_{y₁}s_{y₂+y₃}s_{−y₁−y₂}` exactly; `L_G(U)` has
  24 roots (type `A₃×A₃`, matching the printed Dynkin diagram); and the roots orthogonal to the fixed space of
  `U²` are exactly the eight `±x₁, ±x₃, ±y₁, ±y₃`, which are orthogonal and satisfy `U²v = −v`. The proof
  commented out in the source says the same: "`x₁, x₃, y₁, y₃` are orthogonal and generate the `(−1)`-eigenspace
  of `U²`".
* **E2 (Proposition 11.2(ii)).** "thus we may choose (Lemma 10.3) a `Γ`-admissible Borel class" — but
  Proposition 10.3 *assumes* such a class as its hypothesis (i). The reference should be to **Lemma 8.8(2)**,
  which is what the proof of Proposition 10.6 correctly cites for the same step; and 10.3 is a Proposition, not
  a Lemma.
* **E3 (proof of Proposition 11.2, first sentence).** "all cases have properties (i), (ii); and for (iii)
  `Out(H)` itself has at most two elements" — the labels **(ii) and (iii) are interchanged**. The argument that
  follows is about the image of `Γ` in `Out(H)`, which is hypothesis (ii); the exception it names, `so_{2n+1} ⊃
  so_{2u+1} × so_{2v}` with `v = 4`, is exactly where `Out(D_4) = S_3` has six elements. Hypothesis (iii), that
  `π₁ H` is a 2-group, holds throughout the list with nothing to check.
* **E4 (§7.8, the `c`-group).** `ĉG` is defined as a quotient by `(Σ_G(−1), 1, −1)` and the Bockstein sequence
  ends with `Σ_G : {±1} → Ĝ(k)`; in both places the **cocharacter `Σ*_G`** is meant, as in the definition of the
  `C`-group three paragraphs earlier (`e := (Σ*_G(−1), −1)`). `Σ_G` is the sum of positive roots, a character of
  `T_can`.

## Prerequisites proposed for a later batch

Treumann, *Smith theory and geometric Hecke algebras* ([arXiv:1107.3798](https://arxiv.org/abs/1107.3798));
Reeder, *Torsion automorphisms of simple Lie algebras* (Enseign. Math. **56** (2010), 3–47);
Kottwitz–Shelstad, *Foundations of twisted endoscopy* (Astérisque **255**);
Haines–Rostami, *The Satake isomorphism for special maximal parahoric Hecke algebras*
([arXiv:0907.4506](https://arxiv.org/abs/0907.4506));
Buzzard–Gee, *The conjectural connections between automorphic representations and Galois representations*
([arXiv:1009.0785](https://arxiv.org/abs/1009.0785));
Langlands, *Representations of abelian algebraic groups* (Pacific J. Math. **181** (1997), 231–250);
Sopkina, *Classification of all connected subgroup schemes of a reductive group containing a maximal torus*
(J. K-Theory **3** (2009), 103–122);
Ash, *Smith theory and Hecke operators* (J. Algebra **259** (2003), 43–58).

## Checks run

* `python3 scripts/check_paper.py research/blueprint/papers/PAPER-TREUMANN-VENKATESH-16.result.json` — ok.
* `python3 research/blueprint/intake.py check-files` on both deliverables — ok.
* Audits of the LaTeX source: duplicate `\label` (none), undefined `\ref` (none), and a cross-reference **type**
  audit comparing the word before each `\ref` with the environment carrying that label (which found E2).
* An independent computation in the `E_8` root system reproducing §12.2 (order and Weyl-group membership of `U`,
  the `A₃×A₃` diagram of `x₁,x₂,x₃,y₁,y₂,y₃`, the Coxeter factorisation of `U`, `U(α₅)` with its coefficient 2,
  and the roots of `L_G(U)` and `L_G(U²)`), which found E1.
* No Lean file is part of this job.
