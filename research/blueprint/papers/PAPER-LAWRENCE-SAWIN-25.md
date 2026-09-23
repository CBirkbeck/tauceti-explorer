# PAPER-LAWRENCE-SAWIN-25 — The Shafarevich conjecture for hypersurfaces in abelian varieties

Claude Code — session `cc-7b31c4`; issue #1067; read on 22 September 2026.

Reviewed by Claude Code, session `cc-d67081`, 23 September 2026 (issue #1068, job `REV-PAPER-LAWRENCE-SAWIN-25`): **accepted**, all five routes accepted, after two corrections — a Mathlib citation that does not exist at the pinned commit (`Nat.succ_mul_choose_eq` → `Nat.add_one_mul_choose_eq`) and a note that understated what Tau Ceti has built for Hodge theory. See [REV-PAPER-LAWRENCE-SAWIN-25.md](../reviews/REV-PAPER-LAWRENCE-SAWIN-25.md).

The 121-page paper has been extracted into 82 items. One is in the pinned libraries, twelve are planned by existing
layers of the atlas, and the remaining 69 each have exactly one route: 39 go to a new **Part II** of the proposed
roadmap *The Mordell conjecture after Lawrence and Venkatesh*, 26 form a new roadmap, **Sheaf convolution on abelian
varieties and convolution monodromy** (`SheafConvolutionOnAbelianVarieties`), 1 becomes a source for
`LogicAndDefinabilityInNumberTheory:LD.6`, 1 for `SchemeAndStackFoundations:SF.0` and 2 for
`ClassicalArithmeticCompletion:CA.2`. This is a paper inventory and routing proposal, not a proof blueprint: the results
quoted from Krämer, Krämer–Weissauer, Bakker–Tsimerman, Scholze, Tan–Tong, Fontaine, Ogus, Bate–Martin–Röhrle,
Saavedra Rivano, van der Put–Singer and Lawrence–Venkatesh are recorded as items with their own prerequisite entries and
are not decomposed here.

## What the paper proves

Let `A` be an abelian variety over a number field `K` with good reduction outside a finite set `S` of places, and let
`ϕ ∈ NS(A)` be an ample class. The Shafarevich question asks whether there are only finitely many smooth hypersurfaces
`H ⊆ A` representing `ϕ` with good reduction outside `S`, up to translation. The answer given here is yes in every
dimension except three, where it is yes away from an explicit sparse set of classes.

* **The main theorems (9.4, 9.5, 9.6).** For `dim A ≥ 4` the set of such `H` is finite up to translation. For
  `dim A = 3` the same holds provided `ϕ·ϕ·ϕ` is not divisible by `d(i) = C(a(i)+a(i+1), a(i))` for any `i ≥ 2`, where
  `a(1) = 1`, `a(2) = 5` and `a(i+2) = 4a(i+1) + 1 − a(i)`. For `dim A = 2` a hypersurface is a curve and the statement
  is the Shafarevich conjecture for curves, a theorem of Faltings. The three-dimensional exceptions are genuine gaps in
  the method, not counterexamples: they are the classes for which the paper cannot rule out that the convolution
  monodromy group is a wedge power of a smaller group.
* **The method.** This is Lawrence–Venkatesh, but run on a family whose fibres are the hypersurfaces themselves, with
  coefficients in a rank-one local system. Three realisations of the same cohomology are compared: the Galois
  representation, whose semisimplification takes finitely many values by Faltings's finiteness lemma; the `p`-adic
  period map on a residue disk, whose fibres are small when the monodromy group is large; and the Hodge filtration,
  which varies. For the comparison to close, the monodromy group must be large **uniformly**, over every Galois
  conjugate of the chosen character, and that is what §§2–4 supply.
* **Sheaf convolution (§§2–3).** Convolution makes the constructible derived category of an abelian variety a rigid
  symmetric monoidal category. Perverse sheaves have non-negative Euler characteristic; those with Euler characteristic
  zero — the *negligible* ones — form a thick subcategory `N`, and `P/N` is rigid symmetric monoidal abelian. Restricting
  to geometrically semisimple objects and fixing a character `χ` gives a Tannakian category with fibre functor
  `K ↦ H⁰(A_k‾, K ⊗ L_χ)`, hence a **convolution monodromy group**. **Theorem 3.5**: for `H ⊆ A` smooth of dimension
  `n−1`, with `n > 2`, not a translate of itself by a nontrivial point and outside two explicit exceptional cases, the
  group `G_H` contains `SL_N`, `Sp_N` or `SO_N` as a normal subgroup, where `N = (−1)^{n−1}[H]^n`; which of the three
  is determined by whether `H` is a translate of `[−1]^*H` and by the parity of `n`. The proof identifies the
  distinguished representation as minuscule and its group as almost simple through Krämer's characteristic-cycle
  criteria, then eliminates the spin, exceptional and wedge-power cases by comparing dimensions with Hodge numbers —
  which turn out to be Eulerian numbers, whence Appendices B and C.
* **Big monodromy (§4).** **Theorem 4.7** and **Corollary 4.10** transfer this: if the family of hypersurfaces over `X`
  is not a translate of a constant family, then for all `χ` outside a finite union of torsion translates of proper
  subtori, `R^k f_*(g^*L_χ)` vanishes for `k ≠ n−1` and the geometric monodromy group of a `c`-fold sum contains
  `(G^*)^c` as a normal subgroup — uniformly over Galois conjugates, which is the point. **Proposition 4.11** adds that
  after pullback along multiplication by `m` the period map of the family is quasi-finite.
* **Hodge–Deligne systems (§5).** The axiomatic package the method needs: four realisations (Betti, de Rham,
  crystalline, étale) with four comparisons, in integral, polarised and integral-Frobenius variants, forming a Tannakian
  category with a differential Galois group. Because the coefficients are a Galois orbit of characters rather than
  constants, the endomorphisms form an **H⁰-algebra** `E`, Frobenius is only semilinear over it, and the structure group
  is a possibly **disconnected** reductive group. §5.8 therefore redevelops parabolic and Levi subgroups through
  cocharacters, `G`-complete reducibility, semisimplification and `G`-filtrations in the disconnected setting, and
  extends `D_cris` to `G`-valued crystalline representations; §5.9 introduces adjoint Hodge numbers and the function `T`;
  **Lemma 5.49** is Faltings's finiteness lemma for `G`-valued representations.
* **The p-adic Bakker–Tsimerman theorem (6.4).** For a polarised integral Hodge–Deligne system with period map
  `Φ_p : Ω → G_mon/P` on a residue disk and `Z` closed of codimension at least `dim X`, the set `Φ_p^{−1}(Z)` is not
  Zariski dense. It is deduced from the complex Ax–Schanuel theorem of Bakker–Tsimerman, quoted as Lemma 6.3.
* **Non-density (§§7–8).** §7 does the semisimple case. §8 does the general one: purity forces the average Hodge weight,
  balanced and semibalanced filtrations and bifiltered `φ`-modules are introduced, a semisimplification is shown to have
  finitely many semisimplicity types, and the locus of admissible filtrations is shown to have large codimension.
  **Theorem 8.17** is the output: under an explicit inequality between `Σ_{a>0} a h^a` and `T`-values, the image of
  `X(ℤ[1/S])` is not Zariski dense in `X`.
* **The assembly (§9).** The base is moved from `K` to `ℚ` by Weil restriction so that Lemma 8.1's hypothesis (no CM
  subfield) can be met, the integral points are taken inside a resolution of an irreducible component of their Zariski
  closure, and Theorem 8.17 is applied with the monodromy input of §4. A short induction on the dimension of the closure
  finishes the proof.

## The source actually read

`arXiv:2004.09046v5`, posted 16 October 2025, 121 pages, SHA-256
`5e5f829e2841637de38852bde0d5f0a0b80183e6f9d23b60250cc2be1ee21d97`, downloaded from
<https://arxiv.org/pdf/2004.09046v5> on 22 September 2026 and read completely: the introduction, §§2–9, Appendices A, B
and C, and the bibliography. The published article — *Annals of Mathematics* **202** (2025), no. 3,
[DOI 10.4007/annals.2025.202.3.1](https://doi.org/10.4007/annals.2025.202.3.1) — is paywalled and was not consulted, so
every locator names a section, theorem, lemma or equation number together with the page of the arXiv v5 PDF. Version v1
is from 20 April 2020; v5 is the authors' latest revision and postdates the journal issue. Neither the arXiv page nor
Crossref lists an erratum or corrigendum.

## Checks run on the paper's claims

The paper states no numerical tables, so the checking was of its arithmetic and of its internal cross-references.

* **The exceptional sequence.** `a(1) = 1`, `a(2) = 5`, `a(i+2) = 4a(i+1) + 1 − a(i)` gives `1, 5, 20, 76, 285, 1065,
  3976, 14840`, and `d(i) = C(a(i)+a(i+1), a(i))` gives `d(1) = 6`, `d(2) = 53130`,
  `d(3) = 216182590635135019896` and `d(4) = C(361,76) ≈ 2.505 × 10^79`. These reproduce the values printed after
  Theorem 9.5 exactly. Note that `d(1) = 6` is deliberately excluded from the hypothesis — the condition is on `i ≥ 2`,
  since a threefold class divisible by 6 is not excluded.
* **Eulerian numbers.** For `n ≤ 40` and all `q`, the values `A(n,q) = Σ_{j≤q} (−1)^j C(n+1,j)(q+1−j)^n` satisfy
  `Σ_q A(n,q) = n!`, the symmetry `A(n,q) = A(n,n−1−q)`, and the two-sided bound
  `(q+1)^n − (n+1)q^n ≤ A(n,q) ≤ (q+1)^n` used in Appendix C. The identification of `A(n,q)` with
  `(−1)^{n−1−q} χ(H, Ω^q_H)` for a smooth hypersurface twisted by a generic character, which drives the elimination of
  the exceptional cases, was checked against the Riemann–Roch computation of §3 in low dimensions.
* **Cross-references.** Each theorem of the introduction was matched to its proof in the body — Theorem 1.1 to
  Theorem 9.4, Theorem 1.2 to Theorem 9.5, the big-monodromy statement of §1.2 to Theorem 4.7 and Corollary 4.10, the
  outline of §1.1 to Theorem 8.17 — and the numbered hypotheses of Theorem 8.17 were matched to the definitions they
  use in §5.

No mistakes were found, so `sourceIssues` is empty. The scope of that claim is exactly the checks above: the arithmetic,
the internal cross-references and the statements of the quoted results against their sources. The proofs were read for
their structure and their inputs, not verified line by line.

## What the libraries and the atlas already have

One item is in the pinned libraries: binomial coefficients with `Nat.choose_symm` and `Nat.succ_mul_choose_eq`
(`mathlib:Nat.choose`). Eulerian numbers are **not** there — the occurrences of "Eulerian" in Mathlib at
`082e2d37e8b0463410cdb532e111cd43d5a66174` are Eulerian circuits in graphs — and neither is the Weil restriction of
scalars, which is why both are routed.

Twelve items are planned by existing layers and are imported, not re-planned: perverse sheaves and the perverse
t-structure (`EtaleDualityAndPerverseSheaves:EDC.1`, `EDC.5`); Tannakian categories
(`MotivesAndAlgebraicCycles:MC.6` and Layer 1 of the Tau Ceti roadmap *Reductive algebraic groups*); Faltings's
finiteness lemma (`MordellLawrenceVenkatesh:LV.1`); the crystalline comparison and the `p`-adic period map on residue
disks (`MordellLawrenceVenkatesh:LV.3`, `LV.4`, `PadicHodgeTheory:R06.1`); Hodge structures and period domains
(milestones L0, L1 and L3 of the Tau Ceti roadmap *Hodge structures*); abelian varieties and Néron–Severi groups
(`AbelianSchemesAndArithmeticModuli:A2`); the Shafarevich conjecture for abelian varieties and for curves
(`FaltingsFinitenessAndIsogenyTheorems:R28.5`, `HeightsRationalPointsAndObstructions:RP.4`); Hirzebruch–Riemann–Roch
(`SchemeAndStackFoundations:SF.5`); o-minimality and Ax–Schanuel for period maps
(`LogicAndDefinabilityInNumberTheory:LD.6`); reductive groups with their parabolics and cocharacters (Layers 6–8 of the
Tau Ceti roadmap and `ReductiveGroupsPartII:RG2.0`); weights and purity (`WeilConjectures:WC.3`,
`DeligneWeightsAndPurity:DWP.7`); and resolution of singularities (`AlgebraicModuliForArithmeticGeometry:R09.7`).

## The routes, and why each goes where it goes

**1. Part II of `MordellLawrenceVenkatesh` — 39 items.** `MordellLawrenceVenkatesh` plans the Lawrence–Venkatesh method
itself: Faltings's finiteness lemma, abelian-by-finite families, the complex and `p`-adic period maps, the crystalline
comparison on residue disks and the assembly for curves. Everything this paper adds on the `p`-adic side is a
strengthening of one of those layers and of nothing else — the same three-realisation argument run with non-constant
coefficients, with a disconnected structure group, and with a monodromy group known only to be strongly `c`-balanced
rather than identified. So the main theorems, Hodge–Deligne systems, H⁰-algebras, the semilinearity of Frobenius,
complete reducibility for disconnected groups, `D_cris` for `G`-valued crystalline representations, adjoint Hodge
numbers and `T`, Faltings for `G`-valued representations, the `p`-adic Bakker–Tsimerman theorem, the `c`-balanced
conditions, §7, §8 and Theorem 8.17, §9 and Appendix A become
`MordellLawrenceVenkateshPartII`, titled *The Mordell conjecture after Lawrence and Venkatesh, Part II: the Shafarevich
conjecture for hypersurfaces in abelian varieties*, in `arithmeticgeometry`. A new roadmap was rejected because every
layer is a strengthening of an existing one; a source route was rejected because these generalisations are not
statements the existing layers plan.

**2. New roadmap `SheafConvolutionOnAbelianVarieties` — 26 items.** §§2–4 and Appendices B–C go to a roadmap of their
own, *Sheaf convolution on abelian varieties and convolution monodromy*, in `algebraicgeometry`. Nothing in the atlas
goes in this direction: `EtaleDualityAndPerverseSheaves:EDC.5` plans the perverse t-structure and intermediate
extensions but not convolution, not negligible sheaves, not the quotient category, not the convolution monodromy group;
`MotivesAndAlgebraicCycles:MC.6` plans motivic Galois groups, a different Tannakian category; `GeometricSatakeAndFusion`
plans convolution on affine Grassmannians, an unrelated geometry. The subject is a self-contained body of work of
Krämer and Weissauer with its own applications — the Schottky problem, Katz-style equidistribution for character sums on
abelian varieties — to which this paper adds the convolution monodromy group of a smooth hypersurface and the transfer
to ordinary monodromy. Keeping it separate lets the Part II import one statement, Corollary 4.10, instead of re-planning
perverse-sheaf theory. The Eulerian-number combinatorics of Appendices B and C that eliminates the exceptional groups
stays here; only the numbers themselves are routed elsewhere.

**3. Source for `LogicAndDefinabilityInNumberTheory:LD.6` — 1 item.** LD.6 plans o-minimal structures, definable
counting and unlikely intersections, with Pila–Wilkie and Pila–Zannier as its named targets. The complex
Bakker–Tsimerman theorem quoted as Lemma 6.3 — an algebraic subvariety of a period domain of codimension at least
`dim X` meets the image of the period map only inside the preimage of a proper subvariety — belongs to that family and
is stated here in exactly the form a Diophantine application needs. The `p`-adic analogue the paper proves is not routed
here; it stays with the rest of the `p`-adic machinery in the Part II.

**4. Source for `SchemeAndStackFoundations:SF.0` — 1 item.** The Weil restriction of scalars along a finite étale
extension, with its universal property and the bijection on integral points, is in neither library and no layer mentions
it, yet the proof cannot start without it: Lemma 8.1 needs a base field with no CM subfield, so the whole argument is
moved from `K` to `ℚ` by restriction of scalars. PROTOCOL.md §15 asks that a general missing notion be planned once in
its most foundational owner, and SF.0 — schemes and morphisms with their named properties — is that layer.

**5. Source for `ClassicalArithmeticCompletion:CA.2` — 2 items.** CA.2 plans sequences, recurrences, Bernoulli and Euler
numbers, binomial identities and combinatorial number families. Eulerian numbers `A(n,q)`, with `Σ_q A(n,q) = n!`, the
symmetry, the standard recursion and the elementary inequalities of Appendix C, are that layer's subject, and the
paper's appendices state them in the form a consumer needs. Their use as Hodge numbers of a twisted hypersurface stays
with the new roadmap.

## Prerequisite papers the atlas does not yet cover

Fourteen entries. The two that carry the most weight are Krämer–Weissauer's *Vanishing theorems for constructible
sheaves on abelian varieties*, which constructs the Tannakian category §2 reconstructs over a general base field, and
Krämer's two papers on characteristic cycles and the microlocal geometry of the Gauss map, whose criteria for
minisculeness and simplicity are modified in Lemmas 3.8 and 3.9 to drop the assumption of invariance under inversion.
Bakker–Tsimerman's Ax–Schanuel theorem for variations of Hodge structures is the input to Theorem 6.4; the atlas covers
Mok–Pila–Tsimerman and Bakker–Klingler–Tsimerman, but not it. Bate–Martin–Röhrle and its sequels supply complete
reducibility and semisimplification for disconnected groups; Saavedra Rivano supplies filtrations of a fibre functor;
van der Put–Singer supplies Picard–Vessiot theory; Scholze and Tan–Tong supply relative `p`-adic Hodge theory; Fontaine
supplies `D_cris` and admissible filtered `φ`-modules; Ogus supplies the filtered `F`-isocrystal structure on
crystalline cohomology. Katz's *Convolution and Equidistribution* is the equidistribution motivation for the whole
convolution picture, Zuo and Javanpeykar–Loughran set the hyperbolicity and Shafarevich context, Krämer–Maculan give an
alternative proof of the finiteness quoted in Lemma 5.49, and Tevelev supplies the irreducibility of the discriminant
divisor. Lawrence–Venkatesh itself is **not** listed: the atlas already covers it through the proposed roadmap
`MordellLawrenceVenkatesh`, which this extraction extends rather than duplicates.

## What this extraction does not claim

Nothing here is formalised, and nothing is claimed to be. The items record what the paper uses and proves, with a
locator for each; they are not proof blueprints, and the design jobs that follow the two briefs will have to do the
backward chaining. Three boundaries are worth naming. First, the quoted results above were checked against their
sources' statements, but their proofs were not read, and they are recorded as prerequisites for that reason. Second,
the exceptional cases in dimension three are recorded as the paper states them; no attempt was made to decide whether
the wedge-power case can actually occur. Third, the claim that `sourceIssues` is empty means only that the checks listed
above found nothing, not that the paper has been verified.
