# PAPER-SCHIFFMANN-16 — Indecomposable vector bundles and stable Higgs bundles over smooth projective curves

Claude Code — session `cc-7b31c4`; issue #1181; read on 22 September 2026.

Olivier Schiffmann, *Indecomposable vector bundles and stable Higgs bundles over smooth projective curves*,
Annals of Mathematics **183** (2016), no. 1, 297–362. Read in the author's public version,
[arXiv:1406.3839v2](https://arxiv.org/abs/1406.3839v2) (4 October 2014, the last preprint version, whose comment
records that the corollaries on the irreducible components of the stable global nilpotent cone were added) — in
its **LaTeX source** (`Indecomposables.tex`, 2143 lines, source archive sha256 `a84104fa…`), since `pdftotext`
was unavailable here.

**On the published version.** The Annals article page and its PDF are reachable, but no PDF text extraction is
available in this environment, so the published text **could not be read**. Every locator is therefore a preprint
locator, and the four source issues below are recorded against the preprint with no claim about print; the
preprint predates publication by more than a year, so they may well have been corrected. Each issue's `searched`
field says so.

**On numbering.** The preprint numbers Theorems, Lemmas, Corollaries, Propositions and Conjectures by a single
counter per section: Theorem 1.1, Theorem 1.2, Conjecture 1.3, Conjecture 1.4, Theorem 1.5, Corollary 1.6, …
The four theorems called **Theorem 1, 2, 3, 4** in the text are Theorems **1.1, 1.2, 1.5, 7.1**. Definitions are
unnumbered and made in running text inside numbered paragraphs (1.1, 2.2, 6.4, …), whose numbers are used as
locators for the definitional items.

The paper has been extracted into **59 items**. One is in Mathlib, three are planned by existing layers, and the
remaining 55 are routed exactly once: **51 to a new roadmap**, and **4** as sources of three existing roadmaps.

## What the paper proves

Let `X` be a smooth projective geometrically connected curve of genus `g` over `F_q`, with Weil numbers
`σ_1, …, σ_{2g}`. Let `T_g` be the torus of tuples with `α_{2i−1}α_{2i}` independent of `i`, acted on by
`W_g = S_g ⋉ (S_2)^g`, so that the Weil numbers give a class `σ_X ∈ T_g/W_g`; let `R_g = Q[T_g]^{W_g}` and `K_g`
its localization at the `q^l − 1`. Write `A_{r,d}(X)` for the number of **geometrically indecomposable** vector
bundles of rank `r` and degree `d`.

* **Theorem 1** (1.1). There is a unique `A_{g,r,d} ∈ K_g` with `A_{r,d}(X) = A_{g,r,d}(σ_X)` for *every* curve of
  genus `g` over *every* finite field — the global analogue of Kac's theorem for quivers.
* **Theorem 2** (1.2). It is computed explicitly: with `J_λ(z) = ∏_{s∈λ} ζ*_X(q^{−1−l(s)}z^{a(s)})` a product over
  the boxes of a Young diagram and `H_λ(z)` an iterated residue of a symmetrising kernel `L(z_n,…,z_1)`,
  `Σ_{r≥1} A_{g,r}(z)T^r = (q−1)·Log(Σ_λ q^{(g−1)⟨λ,λ⟩}J_λ(z)H_λ(z)T^{|λ|})` and
  `A_{g,r,d} = −Σ_{ξ∈μ_r} ξ^{−d} Res_{z=ξ}(A_{g,r}(z) dz/z)`.
* **Theorem 3** (1.5). For `(r,d)` coprime and `char(F_q) > C(r,d)` explicit,
  `|Higgs^st_{r,d}(X)(F_q)| = q^{1+(g−1)r²}·A_{r,d}(X)`.
* **Corollaries 1.6–1.10.** Hence `A_{g,r,d} ∈ N[−z_1,…,−z_{2g}]^{W_g}`, the cohomology of `Higgs^st_{r,d}` is
  pure with Poincaré polynomial `t^{2(1+(g−1)r²)}A_{g,r,d}(t,…,t)` over `F_q` and over `C`, the stable global
  nilpotent cone `Λ^st_{r,d}` is pure with `A_{g,r,d}(0)` irreducible components, and `A_{g,r,d}(0)` has its own
  generating series, differing from Hua's formula for the `g`-loop quiver only by a term `−l(λ)`.
* **Theorem 4** (7.1) does the same for quasi-parabolic bundles along a fixed divisor; §8 refines the count by
  Harder–Narasimhan slope and proposes a curve analogue of Kac's conjecture through a *spherical Hall Lie
  algebra*.
* **Conjecture 1** (1.3/1.4): `A_{g,r,d}` does not depend on `d` — equivalent, by Theorem 2, to regularity of
  `A_{g,r}(z)` at the nontrivial `r`-th roots of unity, proved for `r` prime in Appendix C, and essentially
  equivalent to a conjecture of Hausel and Thaddeus.

**The two halves of the proof.** *Arithmetic* (§§2–5): the groupoid `Nil^{≥0}_α(X)` of pairs `(F,θ)` with `θ`
nilpotent has volume `Exp(Σ_α A^{≥0}_α(X)z^α/(q−1))` by Krull–Schmidt and the ratio
`|End^nil(M)|/|Aut(M)| = ∏_i |k_{M_i}|^{n_i(n_i−1)}/|GL(n_i,k_{M_i})|`; stratifying by the **Jordan type** of `θ`
and computing the fibres of `π = π″∘π′` reduces this to the volume of the stack of filtered sheaves, which the
**Hall algebra** of `X` computes as a pairing of Eisenstein series. The spherical Hall algebra has a generic form
over `R_g` (Schiffmann–Vasserot, Schiffmann), so every volume becomes a function of `σ_X` alone; Zariski density
of `{σ_X}` in `T_g/W_g` (Appendix B) gives uniqueness; and the shuffle formulas of §5, together with a plethystic
identity turning the answer into a product over boxes, give Theorem 2. *Geometric* (§6): the stack of Higgs
bundles is presented by a quot scheme built from **two** line bundles and embedded in the representation space of
a Kronecker quiver (Álvarez-Cónsul–King); with `λ(u_1,u_2) = l_2 Tr(u_1) − l_1 Tr(u_2)` and `p > l_1 l_2`, a point
`φ : (L_1⊗V_1)⊕(L_2⊗V_2) ↠ F` has `kλ ⊆ Im(μ_φ)` exactly when `F` is indecomposable; the GIT quotient of
`μ^{−1}(kλ)` is a smooth family `Y → A^1` with `Y_0 ≅ Higgs^st_{r,d}(X)`, and a contracting `G_m`-action with the
Bialynicki-Birula–Hesselink decomposition forces `|Y_0(k)| = |Y_1(k)|`, which is Theorem 3.

## What the atlas already has

The atlas has the two ends of the story and neither of its middles.

* `GlobalShtukasAndFunctionFieldLanglands` **GS.0** constructs `Bun_G` on the global curve with level structures,
  the deformation complex and **Harder–Narasimhan bounded opens**, proves finite type for them and gives the
  adelic description; its acceptance examples are `GL_1` giving the Picard stack and `GL_n` with unstable bundles.
* `EndoscopicTransferAndUnitaryTraceComparison` **ET.2b** constructs, for a smooth proper curve over a finite
  field and a reductive group in good characteristic, the stack of `G`-bundles, **Higgs fields** twisted by a
  sufficiently positive divisor, the **Hitchin base and map**, cameral and spectral covers, and the Picard stack
  acting on Hitchin fibres — as machinery for Ngô's proof of the fundamental lemma.
* `AlgebraicModuliForArithmeticGeometry` **R09.2** constructs Hilbert and **Quot schemes** with representability,
  projectivity and the Grassmannian embedding; **R09.4** algebraic stacks.
* `FunctionFieldArithmetic` **FA.0–FA.2** the curve, divisors, adeles and global Fourier analysis, **FA.5** the
  zeta function by an Euler product over closed points, **FA.6** automorphic forms with constant terms.
* `DeligneWeightsAndPurity` **DWP.0** Weil `q`-numbers with their weights and functorial linear algebra.
* The **Tau Ceti** roadmap on quiver representations plans the path algebra, Krull–Schmidt for finite-length
  modules over a finite-dimensional algebra (recording that Mathlib has neither), the Euler and Tits forms,
  Gabriel's theorem and Auslander–Reiten theory. That is the exact *local* model for what this paper does
  globally — and it is existing work, never re-planned.
* Mathlib has `YoungDiagram` with `transpose`, `rowLen`, `colLen` and `Nat.Partition`, which is the only item of
  the paper the libraries supply.

What no layer plans: **Hall algebras** in any form, Eisenstein series in Hall-algebra form, Siegel's formula as a
stack volume, the orbifold of nilpotent pairs, plethystic operators, GIT for quiver representations, the
Bialynicki-Birula–Hesselink decomposition, Kac polynomials, or any counting problem for bundles.

## The routes

### 1. New roadmap — 51 items

`CountingBundlesAndHallAlgebrasOfCurves`, area `functionfields`, titled *"Counting bundles over function fields:
Hall algebras, Kac polynomials and Higgs moduli"*. It takes everything from the arithmetic frame (`T_g`, `K_g`,
the counting functions), through Krull–Schmidt for coherent sheaves and the orbifold of pairs, the Jordan
stratification, the Hall algebra with its Eisenstein series, truncations and spherical subalgebra, the shuffle
computation and the explicit formulas, to the two-line-bundle presentation, King stability, the deformation of
the Higgs moduli space and the purity corollaries, and finally the parabolic case and the conjectures.

**Why new and not a Part II.** It is not a Part II of `GlobalShtukas`, which is organised around shtukas and the
Langlands correspondence and of which this work uses only the first layer; nor of
`EndoscopicTransfer`, which is organised around the trace formula and of which this work uses only the Hitchin
geometry. The closest direction is the **Tau Ceti** quiver roadmap — but a Tau Ceti roadmap is existing work that
is never re-planned, and this is not an extension of quiver theory, it is its global analogue over a curve. The
brief names the imports layer by layer and records that the conjectures must be stated as open.

### 2. Source of *Global shtukas and Langlands over function fields* — GS.0 — 3 items

**Siegel's formula** in stack-volume form,
`(1^vec_{r,d} | 1^vec_{r,d}) = (q^{(g−1)(r²−1)}/(q−1))·|Pic^0(X)|·ζ_X(q^{−2})⋯ζ_X(q^{−r})`, with the companion
formula for `vol(Coh_{r,d})`; and the **volume of the stack of torsion sheaves**,
`Σ_l (1_{0,l} | 1_{0,l})s^l = Exp(|X(F_q)|s/(q−1)) = ∏_{i≥1} ζ_X(q^{−i}s)`, proved in Appendix A. GS.0 proves the
bounded opens of `Bun_G` are of finite type; these are the quantitative statements it leaves open. The route also
names the Euler-form and Harder–Narasimhan package of §2.1, which GS.0 plans and for which this paper is a clean
`GL_r` source.

### 3. Source of *Deligne weights, purity and the Weil bounds* — DWP.0 — 1 item

**Zariski density** of `{σ_X : X of genus g over a finite field of characteristic ≠ l}` in `T_g/W_g`
(Appendix B). DWP.0 owns Weil `q`-numbers and their formal properties; this says which tuples actually occur, and
it is what turns "the same formula for every curve of genus `g`" into an identity in `Q[T_g]^{W_g}`.

### 4. Source of *Endoscopic transfer and unitary trace comparison* — ET.2b — 2 items

The **good pair of line bundles** `(L_1, L_2)` of Lemma 6.1 — a boundedness statement for semistable Higgs
bundles, indecomposable bundles and destabilizing Higgs subsheaves of a fixed class, for the *canonical* twist —
which is what makes a quot-scheme presentation of the Higgs stack possible. The route also names the definitions
of Higgs sheaves and of `Higgs^st_{r,d}`, which ET.2b plans for a general reductive group with a sufficiently
positive twist and for which this paper is a source in the `GL_r`, canonical-twist, coprime case.

## Prerequisites the atlas does not cover

Thirteen. The load-bearing ones are **Kac** (the quiver theorem and conjectures this paper globalises),
**Crawley-Boevey–Van den Bergh** (the deformation argument §6 transports), **Schiffmann–Vasserot** and
**Schiffmann** (the spherical Hall algebra and its generic form, quoted as Theorem 4.5 and used everywhere),
**Kapranov–Schiffmann–Vasserot** (the Hall algebra of a curve), **Álvarez-Cónsul–King** (the two-line-bundle quot
presentation and the Kronecker embedding), **King** (GIT for quiver representations), **Atiyah** (Krull–Schmidt
for sheaves), **Harder** (rationality of Eisenstein series over a function field), **Hesselink**
(Bialynicki-Birula–Hesselink), **Hausel–Rodriguez-Villegas** and **Hausel** (the character-variety conjecture and
Kac's conjecture), and **Hua** (the generating series for Kac polynomials).

## Mistakes found in the source

Four, all `affects: nothing`, all recorded against **arXiv v2 only**.

1. **E1 — Lemma 2.2 has two parts labelled `ii)`.** The lemma has three parts and the second and third are both
   `ii)`. The reference in the proof of Lemma 2.3, "It follows from Lemma 2.2, ii)", uses the *third* part (a
   composite through a different indecomposable lies in the radical), not the second.
2. **E2 — two slips in the displayed identity of Proposition 5.1.** It reads
   `G^{≥0}_{r_s,…,r_1}(z_s,…,z_1;w) = X_{r_1,…,r_s}(z_s,…,z_1;w)·A^{≥0}_{r_s,…,r_1}(z_r,…,z_1;w)`: the index of
   `X` is reversed relative to its own definition four lines below, and the first argument of `A^{≥0}` is `z_r`
   where it should be `z_s` — there is no variable `z_r`, since `r = Σ_i r_i` and `s` is the number of variables.
3. **E3 — the examples after Corollary 1.10 drop the argument `0`.** The sentence says the list gives the values
   `A_{g,r,d}(0)`, and the first two entries are written that way, but the third and fourth read `A_{g,3,d}` and
   `A_{g,4,d}`. Without the `(0)` they would be false already for `r = 1`, where
   `A_{g,1,d} = ∏_i(1−α_i)` while `A_{g,1,d}(0) = 1`.
4. **E4 — summation indices in Corollaries 1.6 and 1.9 i).** `λ = ∏_j σ_j^{n_j}` is constrained by `Σ n_i = n`,
   which should be `Σ_j n_j = n`; and in Corollary 1.9 i) the eigenvalues `∏_j α_j^{l_j}` are constrained by
   `Σ_i l_j = i`, summing over an index the summand does not depend on, and reusing `i` for the cohomological
   degree on the same line. Corollary 1.9 i) also has an unmatched parenthesis, `q^{2(1+(g−1)r^2}`.

There are no duplicate labels in the source and no other numbering inconsistencies.

## Judgement calls a reviewer should check

* **New roadmap versus a Part II**, argued above and in the route's `reason`. If a reviewer decides that
  `GlobalShtukasAndFunctionFieldLanglands` is the right parent after all, the brief transfers unchanged with the
  GS.0 import replaced by inheritance.
* **Krull–Schmidt for coherent sheaves** (Lemma 2.2) is routed into the new roadmap. The Tau Ceti quiver roadmap
  owns Krull–Schmidt for finite-length modules over a finite-dimensional algebra and records that Mathlib has
  neither; the version needed here is Atiyah's theorem for a Hom-finite category. Since a Tau Ceti roadmap is
  never re-planned, the alternative is a Part II of it for the general Krull–Schmidt-category statement; that
  seemed disproportionate for one lemma, and the item's `note` says so.
* **Higgs bundles** are marked `planned` at ET.2b and GS.0 even though ET.2b works with a *sufficiently positive*
  twist and a general reductive group, while this paper uses the canonical twist, `GL_r`, and the stable locus
  for coprime `(r,d)`. The Serre-duality reformulation by pairs `(V, ν)` is the paper's own and is recorded in
  the item.
* **Quot schemes** (§6.3) are marked `planned` at R09.2. The tangent-space description `Hom(Ker φ, F)` and the
  strong-generation condition are part of R09.2's package as written; a reviewer who reads R09.2 more narrowly
  should move the item into a source route for it.
* The **conjectures** (1.3, 1.4, 8.2, 8.3, 8.4) are recorded as items of kind `theorem` with names that begin
  "Conjecture", following the convention of the earlier extractions in this directory; their notes say plainly
  that they are open.
