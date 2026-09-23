# PAPER-GROECHENIG-WYSS-ZIEGLER-20-B — Geometric stabilisation via p-adic integration

Claude Code — session `cc-7b31c4`; issue #1428; read on 22 September 2026.

Michael Groechenig, Dimitri Wyss and Paul Ziegler, *Geometric stabilisation via p-adic integration*, Journal of the
American Mathematical Society **33** (2020), no. 3, `doi:10.1090/jams/948`. Read in the authors' public version,
[arXiv:1810.06739v2](https://arxiv.org/abs/1810.06739v2) (28 October 2019, 51 pages, sha256
`0139fc5ac0c4109e049b52c8bd298312954f84e63b29a4cb10b34cf66491a5f2`). The published version is paywalled and the AMS
site refused automated access, so every locator in the extraction refers to arXiv v2. What could be checked was
checked: the DOI resolves to the AMS page for JAMS 33 (2020), no. 3, article `S0894-0347-2020-00948-1`, the arXiv
metadata gives the same title, the same three authors and the 51-page length of the file read, and the preprint has
only the two versions v1 (15 October 2018) and v2 (28 October 2019).

The paper has been extracted into **164 items**. Four are in the pinned libraries, twenty are planned by existing
layers of the atlas, and the remaining 140 are routed exactly once: **124 to a Part II** of *Endoscopic transfer and
unitary trace comparison*, **8** as a source for `AlgebraicModuliForArithmeticGeometry` R09.4 and R09.5, **7** as a
source for `LogicAndDefinabilityInNumberTheory` LD.2, and **1** as a source for `ArithmeticGaloisDuality` R02.4.

## What the paper proves

Fix a finite field `k` with `q` elements, a smooth projective curve `X/k` with a rational point `∞`, a quasi-split
reductive group scheme `G/X` (an outer form of a split pinned `G/k` by an `Out(G)`-torsor `ρ`, with `|Θ ⋉ W|`
invertible on `X`) and a line bundle `D` of even degree `d ≥ 2g − 2` with `A^♦ ≠ ∅`. Write `M_G` for the stack of
`G`-Higgs bundles with coefficients in `D`, `M̄_G` for its rigidification by the generic stabiliser `Z(X, G)`, `A` for
the Hitchin base, `Ã → A` for Ngô's étale cover defined by evaluation at `∞`, and `P` for the Prym (the stack of
`J`-torsors for the regular centraliser `J`).

* **Geometric Stabilisation (Theorem 1.1 = Corollary 6.18; Ngô's Theorem 6.4.2).** For a coendoscopic datum
  `E = (κ, ρ_κ, ρ_κ → ρ)` for the Langlands dual `Ĝ` whose torsor `ρ_{κ,∞}` splits, and for every `a ∈ Ã_H(k)`,
  `#^{κ_a} M̄_{G,a}(k) = q^{r^G_H(D)} · #^stab M̄_{H,a}(k)`, where `r^G_H(D) = ½(dim M̃_G − dim M̃_H)` and
  `#^κ Y(k) = Tr(Fr, H*_c(Y, Q̄_ℓ)^κ)`. As Ngô explains in Section 8 of *Le lemme fondamental pour les algèbres de
  Lie*, this implies the Fundamental Lemma.
* **The non-standard fundamental lemma (Theorem 1.3 = Corollary 6.17; Ngô's Theorem 8.8.2).**
  `#^stab M̃_{G,a}(k) = #^stab M̃_{Ĝ,a}(k)` for every `a ∈ Ã_G(k) ≅ Ã_Ĝ(k)` — the geometric form of Waldspurger's
  non-standard fundamental lemma for dual groups.
* **What is new is the proof.** Ngô proves geometric stabilisation by the Decomposition Theorem and his Support
  Theorem, after a delicate study of weak abelian fibrations and the `δ`-stratification. This paper uses neither. It
  compares two `p`-adic integrals, one over the Hitchin system of `G` and one over the Hitchin system of `Ĝ`, and
  reads the point counts off the volumes. The Decomposition Theorem appears only once, at the end of Section 6.4,
  and only to upgrade an identity of point counts into an equivalence of complexes over `k̄`; the fundamental lemma
  itself does not need that upgrade.
* **Two geometric results of independent interest.** The twisted inertia stack of the anisotropic Higgs stack is the
  disjoint union of the Higgs stacks of the coendoscopic groups (Theorems 5.14 and 5.23), and duality of the Pryms of
  `G` and `Ĝ` over the smooth-cameral locus, known for split groups by Donagi–Pantev and Chen–Zhu, holds for
  quasi-split group schemes (Theorem 4.28 = Corollary A.12).

### How the proof runs

1. **`p`-adic integration on stacks (Section 2).** Weil's theorem says that for `X/O_F` smooth of relative dimension
   `d` the canonical measure gives `vol(e^{-1}(x)) = q^{-d}` for each `x ∈ X(k)`, so `vol(X(O_F)) = |X(k)|/q^d`: a
   volume is a point count. The paper generalises this to a smooth tame Deligne–Mumford stack `M/O_F` whose coarse
   space `M` is Zariski-locally a finite étale quotient. The measure `vol_M` lives on `M(O_F)^♮ = M(O_F) ∩ V(F)`,
   where `V ⊂ M` is the locus over which `M → M` is an isomorphism, and is built from `r`-gauge forms — generating
   sections of `(Ω^top_M)^{⊗r}`, which exist Zariski-locally only after a tensor power, obtained as norms of top
   forms along the local finite étale covers. The specialisation map now takes values in the **twisted inertia
   stack**, `e : M(O_F)^♮ → [I_µ̂M(k)]`, because an `O_F`-point of the coarse space whose generic point lies in `V`
   is a tamely ramified `µ_N`-torsor over the generic point, and Theorem 2.21 computes
   `vol_M(e^{-1}(x, α)) = q^{-w(x,α)}/|Aut_{I_µ̂M(k)}(x, α)|`, a *weighted* point count.
2. **The Hasse invariant (Section 3).** A `G_m`-gerbe `α` on `M` defines a function `f_α` on `I_µ̂M(k)` by pulling
   back along `B_kµ_N → M` and using `H²_ét(B_kµ_N, G_m) ≅ Z/N ⊂ Q/Z`. Proposition 3.7 proves
   `inv(x_F^*α) = f_α(e(x))`: the Hasse invariant of the restriction of the gerbe to the generic point is computed by
   the specialisation map. For a finite-order line bundle `L` this reads `inv(x_F^*α_L) = χ_L(e(x))`
   (Corollary 3.14), and through `Q/Z ↪ C^×` the right-hand side becomes an integrand.
3. **Quasi-split Hitchin systems and their Pryms (Section 4, Appendix A).** Sections 4.1–4.3 set up quasi-split
   reductive group schemes over `X`, the Hitchin system, cameral covers, the abstract Prym as `W`-equivariant
   `T`-torsors with `+`-structure (Donagi–Gaitsgory), Beilinson 1-motives, the Kostant section, the anisotropic
   locus, and the prime-to-`p` isogeny `ρ : P̄_G → P̄_Ĝ` built from the regular centralisers. Appendix A develops
   **co-descent**: norm maps for étale sheaves along a finite étale cover, the statement that the augmented
   simplicial diagram of norms is a limit, and the consequence that duality for split groups descends to quasi-split
   ones.
4. **Endoscopy is inertia (Section 5).** A point of `I_µ̂M̃^ani_G(k)` is a Higgs bundle with a homomorphism
   `µ̂ → Aut(E, θ)`, hence, by Construction 4.36, a homomorphism `κ : µ̂ → T`; taking connected centralisers and
   twisting produces a **coendoscopic datum** `E = (κ, ρ_κ, ρ_κ → ρ)` with quasi-split group `H_E`, whose Langlands
   dual is an endoscopy group for `Ĝ`. Theorem 5.14 shows the resulting morphism
   `⊔_E M̃^{G-∞,ani}_{H_E}(k) → I_µ̂M̃^ani_G(k)` is an equivalence of groupoids, and Theorem 5.23 the corresponding
   statement after rigidification, where the indexing set must be quotiented by `Hom(µ̂, Z(X, G))(k)`.
5. **The comparison (Section 6).** Over `F = k((x))` and `O = k[[x]]` the Hitchin systems of `G` and `Ĝ` become
   `O`-schemes; restricting to the `Π`-locus makes the Prym a family of abelian varieties over `A^♦`. Fubini along
   the Hitchin map (Lemma 6.13) reduces the equality of the two integrals to a fibrewise identity, which is
   Lemma 6.14 (if one fibre has no `F`-point, the character is non-trivial and the integral vanishes — this is Tate
   duality for abelian varieties over a local field, combined with Lemma 6.29 identifying the gerbe with the twist)
   and Lemma 6.15 (if both have `F`-points, the integrals agree by the prime-to-`p` isogeny and Proposition 2.2).
   Theorem 2.21 converts the resulting identity of volumes into the character-sum identity of Theorem 6.11, which
   Theorem 5.23 rewrites as the endoscopic identity of Corollary 6.12. Summing over all twists and inverting the
   Fourier transform of Lemma 6.6 gives Corollary 6.17 and Corollary 6.18; Lemma 6.20 identifies the exponent
   `dim M̃_G − F(κ)` produced by the weight function with Ngô's `r^G_{H_E}(D)`.

A consistency check on the exponent: `dim M̃ = 2 dim A` on the relevant locus, and
`dim A_G = d·(dim G + rk G)/2 − rk G·(g − 1)`, so for a coendoscopic `H` (same rank as `G`)
`r^G_H(D) = dim A_G − dim A_H = d·(dim G − dim H)/2`, which is a non-negative integer precisely because `d` is even —
the hypothesis `deg D` even in Situation 4.10(b) is doing exactly this work.

## What the atlas already has

* **The two main theorems are planned, along Ngô's route.** `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`
  plans, for a smooth proper curve over a finite field and a reductive group scheme in the good-characteristic range,
  the Chevalley quotient, Kostant section and regular centralisers with descent under outer twists, the stack of
  `G`-bundles with Higgs fields, the Hitchin base and map, cameral and spectral covers, the Picard stack acting on
  Hitchin fibres with its component groups, the anisotropic quotient, affine Springer fibres and the product formula,
  weak abelian fibrations, the `δ`-stratification, the support theorem and the endoscopic comparison of `κ`-isotypic
  perverse direct images. `ET.3` derives the fundamental lemma from it, including the non-standard variant needed in
  Waldspurger's reduction, and keeps the explicit `p > 2·(Coxeter number)` bound. `ET.0` plans endoscopic data and
  endoscopy groups. Twenty items of the extraction are marked `planned` against these layers, and against
  `tauceti:TauCetiRoadmap/ClassFieldTheory` Layer 5 (the Brauer group of a local field and the invariant map),
  `tauceti:TauCetiRoadmap/ProfiniteCohomology` Layer 9 (Hilbert 90), `tauceti:TauCetiRoadmap/ReductiveGroups`
  Layers 7 and 9 (pinnings, `Aut = G^ad ⋊ Out`) and `GeometricSatakeAndFusion:GS4:integral-dual-group` (the pinned
  dual group).
* **Four items are in the pinned libraries.** Haar measure on a locally compact group with its normalisation and
  uniqueness (`MeasureTheory.Measure.haarMeasure`, `haarMeasure_self`, `haarMeasure_unique`); the map
  `λ ↦ e^{2πiλ}` from the additive circle to the unit circle (`AddCircle.toCircle`); the Dold–Kan correspondence
  used in the proof of local co-descent (`CategoryTheory.Abelian.DoldKan.equivalence`); and the vanishing of the
  Brauer group of a finite field, used in Corollary 6.27 (`TauCeti.subsingleton_brauerGroup_of_finite`, the
  central-simple-algebra Brauer group — the identification with `H²_ét(k, G_m)` is not part of that declaration).
* **Nothing else.** Searches of every stage description in `research/blueprint/atlas/` return no hit for "Higgs",
  "Hitchin", "Prym", "inertia stack" or "gerbe"; the only hits for "Deligne–Mumford" are `R09.4` and two topology
  roadmaps, the only hits for coarse spaces are `R09.5` and the Tau Ceti `ModularCurves` roadmap, and the only hits
  for "p-adic integration" are `TropicalAndBerkovichArithmetic:TB.7` (Coleman
  integration on curves, a different subject) or "motivic integration" outside
  `LogicAndDefinabilityInNumberTheory:LD.3`.

## The routes

### 1. Part II of *Endoscopic transfer and unitary trace comparison* — 124 items

`EndoscopicTransferAndUnitaryTraceComparisonPartII`, "Endoscopic transfer and unitary trace comparison, Part II:
geometric stabilisation via `p`-adic integration", area `langlands`.

The atlas already aims at these theorems, so this is not a new roadmap; but the paper's route to them is new layers
in that roadmap's direction, so by PROTOCOL section 15 it is a Part II. Everything the second proof needs and the
first does not is here: the canonical measure on the coarse space of a tame DM stack (Lemma 2.8) and its volume
formula (Theorem 2.21); the specialisation map and the weight function; torsors over local fields, the stacks
`X_{Γ,Q}` and the identification of the Hasse invariant with the invariant on the twisted inertia stack
(Propositions 3.7, Corollary 3.14); quasi-split group schemes over a curve and their Langlands duals; the abstract
Prym, Beilinson 1-motives, the Abel–Jacobi map and the duality `AJ^* : (P^♦_G)^∨ ≅ P^♦_Ĝ` with the co-descent proof
of Appendix A; coendoscopic data and Theorems 5.14 and 5.23; and the whole of Section 6 — the `Π`-spaces, unramified
twists and their Fourier transform, the comparison of the two integrals, the character sums and the Tate-duality
argument of Section 6.5.

The Part II **imports and does not re-plan** the Hitchin system itself (ET.2b), the deduction of the fundamental
lemma (ET.3) and endoscopic data (ET.0), together with the stack, measure, duality, class-field-theory and
dual-group layers named in the brief. Two things in it are deliberately *not* imported from ET.2b: the support
theorem and the Decomposition Theorem, which the whole point of this paper is to avoid. One item in it is a general
tool that no roadmap owns and that the brief asks to be given its own layer: the Grothendieck–Lefschetz trace formula
for Deligne–Mumford stacks over a finite field ([Sun12]), which is what every `#M(k)` in Section 6 means. Lang's
theorem for connected algebraic groups over a finite field (used in Section 6.2) and the Čech-to-derived comparison
in degree two for schemes (cited by the paper as [Mil80, Theorem 2.17]) are in the same position and are also carried by this
route.

### 2. Source for `AlgebraicModuliForArithmeticGeometry` R09.4 and R09.5 — 8 items

Coarse moduli of tame DM stacks over a discrete valuation ring and the locus where the coarse map is an isomorphism
(Situation 2.6(a), Keel–Mori); Kresch's Zariski-local finite étale quotient presentation (Situation 2.6(b)); the
twisted inertia stack and the description of its rational points over a finite field (Definition 2.9, Lemma 2.10);
Giraud's classification of gerbes by degree-two cohomology (Lemma 3.2); and the quotient-stack identity for twisted
group actions (Construction 5.1). None of these is about Higgs bundles: R09.4 builds algebraic stacks in the required
class and separates the Deligne–Mumford, separated, proper and tame properties, R09.5 proves existence of coarse
spaces and rigidification, and this paper is a good source for both. The Part II should import them.

### 3. Source for `LogicAndDefinabilityInNumberTheory` LD.2 — 7 items

Sections 2.1 and 2.2 are classical `p`-adic integration: the measure `µ_ω` attached to a section of
`(Ω^top)^{⊗r}`, Weil's point-count formula, the vanishing of the measure of a positive-codimension subspace, the
change-of-variables formula for a generically free finite étale quotient, invariance under a prime-to-`p` isogeny of
dual abelian varieties, Fubini along a smooth morphism, and the worked example `π(x, y) = xy` which recovers
`|π^{-1}(0)(k)| = 2q − 1` from a double integral. LD.2 owns `p`-adic definable measures and Igusa-type local
integrals after Denef–Pas and Cluckers–Loeser, and Weil's measure is their common starting point.

There is one adjacency worth flagging to the reviewer: `AdelicAlgebraicGroups:AA.2` plans "invariant quotient
measures by Weil's integral formula" and "Tamagawa measures from invariant differential forms". That is the
invariant-measure statement for adelic groups; the items routed here are about the measure attached to an arbitrary
gauge form on a variety or algebraic space, and about `Ω^top` of a stack, so they are not the same targets. If a red
team disagrees, the fix is to move the two items "Weil's canonical measure and point counts" and "Measure attached to
an `r`-fold top-degree form" to `AA.2` and keep the rest at LD.2.

### 4. Source for `ArithmeticGaloisDuality` R02.4 — 1 item

Tate's local duality theorem for abelian varieties (Milne, *Arithmetic Duality Theorems* I.3.4) is what makes
Lemma 6.14 work. R02.4 proves finite-module Poitou–Tate duality from the local invariant maps; the abelian-variety
case belongs to the same layer, and this paper is a source for it in the formulation the Part II needs, through
`Ext²(A, G_m)`, gerbes and Hasse invariants.

## Prerequisites the atlas does not cover

Twenty entries are listed in the extraction. The ones that matter most, in order: **Ngô's `Le lemme fondamental pour
les algèbres de Lie`** (arXiv:0801.0446) — the source of the whole framework and of the theorem being reproved, and
the paper ET.2b and ET.3 are themselves built on; **Ngô's `Fibration de Hitchin et endoscopie`** (arXiv:math/0406599);
the authors' own **`Mirror symmetry for moduli spaces of Higgs bundles via p-adic integration`** (arXiv:1707.06417),
whose Section 4 is the special case that Section 2 generalises; **Donagi–Gaitsgory** (arXiv:math/0005132),
**Donagi–Pantev** (arXiv:math/0604617) and **Chen–Zhu** (arXiv:1403.3981) for the Prym and its duality; **Yasuda**
(arXiv:1412.5260, arXiv:math/0312115) and **Denef–Loeser** (arXiv:math/9903187) for the measure-theoretic
antecedents; **Abramovich–Corti–Vistoli** (arXiv:math/0106211), **Abramovich–Olsson–Vistoli** (arXiv:math/0703310),
**Keel–Mori** (arXiv:alg-geom/9508012) and **Kresch** for the stack theory; **Sun** (arXiv:1008.3689) for the trace
formula for stacks; and the books of **Igusa**, **Milne** and **Weil** for `p`-adic integration, arithmetic duality
and the canonical measure.

## Mistakes in the source

Four misprints, all cross-references, none of which affects a statement or a proof; they are recorded under
`sourceIssues` in the result file.

* **E1** (Construction 2.13, p. 11): "condition (iii) of Theorem 2.12" — 2.12 is a **Proposition**, and is cited
  correctly two sentences later in the same construction.
* **E2** (Remark 6.19, p. 42): "stated in Theorem 6.18" — 6.18 is a **Corollary**, and the same remark calls it
  "Corollary 6.18" in its first sentence.
* **E3** (Remark 6.24, p. 43): "the embedding described in Lemma 4.36" — 4.36 is a **Construction**, cited correctly
  three times elsewhere.
* **E4** (Goal 6.21(2), p. 42): both halves of Goal 6.21 end "See Lemma 6.34", but Lemma 6.34 states only the
  assertion of half (1). The identification of `λ(α)` with the unramified twist under Tate duality is made in the
  proof of Lemma 6.14, using Lemma 6.29.

The published version could not be consulted (the AMS site refused automated access on 22 September 2026), and the
arXiv preprint has no version later than v2, so no existing correction was found.

## Independent review (`REV-PAPER-GROECHENIG-WYSS-ZIEGLER-20-B`, issue #1429)

Claude Code, session `cc-fb70e5`, 23 September 2026. **Verdict: accept**, all four routes accepted, all
four findings confirmed, **two findings added**. The full review is in
[`reviews/REV-PAPER-GROECHENIG-WYSS-ZIEGLER-20-B.md`](../reviews/REV-PAPER-GROECHENIG-WYSS-ZIEGLER-20-B.md).

The recorded hash matches byte for byte, and the paywall is real: `doi.org/10.1090/jams/948` and the AMS
article page both return HTTP 403 here too, so the locators stand against arXiv v2 as recorded.
An independent simulation of the shared per-section counter gives the extraction's numbering — but only
after **stripping comments** from the source: counting the commented-out environments (`lemma:neron`,
`prop:purity`, `lemma:Tate` and others) gives 171 objects with shifted numbers instead of the correct
**154**. Every number tested then agrees, including `thm:volume` = Theorem 2.21 and `defi:weight` =
Definition 2.20. **Coverage is 150 of 154**, the rest being two Situations, a remark, and the Goal the
findings cite. The four `library` items were read in the Mathlib and Tau Ceti sources at the pins, and all
12 cited layers exist. The Part II reproduces its parent's title verbatim and is the same one the
companion paper's extraction proposes, so the two GWZ papers feed one roadmap.

All four recorded findings are confirmed verbatim. E4 is subtler than it looks: Goal 6.21(1) and (2) carry
the same pointer, and the argument for (2) lives in the **deferred** "Proof of Lemma 6.14", printed after
the proof of Lemma 6.34 — a line-order check misattributes it, and the extraction read the structure
correctly.

**Two findings were added.** All four recorded findings belong to one mechanical class — a reference whose
introducing word disagrees with the target's environment — so this review ran that class exhaustively over
every `\ref` in the source. The paper has five such mismatches and the extraction had three: §2's overview
calls Lemma 2.8 "Definition 2.8" (**E5**), and §6.3 calls Construction 2.13 "Definition 2.13" (**E6**).
Both are settled by the paper citing the same objects correctly elsewhere. The same audit found no
duplicate labels and no undefined references.
