# PAPER-FINTZEN-21 — Types for tame p-adic groups

Claude Code — session `cc-7b31c4`; issue #1105; read on 22 September 2026.

The 39-page paper has been extracted into 33 items. None is in the pinned libraries, seven are planned by existing
layers of the atlas, and the remaining 26 each have exactly one route: 22 go to a **Part II** of
`SmoothRepresentationsOfLocalGroups` and 4 become sources for `ReductiveGroupsPartII:RG2.2` and `RG2.3`. This is a
paper inventory and routing proposal, not a proof blueprint: the results quoted from Yu, Kim, Kim–Yu,
Bushnell–Kutzko, Moy–Prasad, Adler–Roche, Kim–Murnaghan and Kaletha are recorded as items with their own prerequisite
entries and are not decomposed here.

## What the paper proves

Let `k` be a non-archimedean local field of **arbitrary** characteristic with residue characteristic `p`, and let `G`
be a connected reductive group over `k` that splits over a tamely ramified extension, with `p ∤ |W|` for `W` the Weyl
group of `G` (Assumption 2.1).

* **Types (Theorem 7.12).** Every smooth irreducible complex representation of `G(k)` contains an `s`-type of the form
  constructed by Kim and Yu. Since a Bernstein block `R^s(G)` with an `s`-type is equivalent to the category of
  modules over the corresponding spherical Hecke algebra, this reduces the study of all smooth representations to
  Hecke algebras of compact open subgroups.
* **Exhaustion (Theorem 8.1).** Every smooth irreducible supercuspidal representation of `G(k)` arises from Yu's
  construction — so the many results proved for Yu's representations (distinction, character formulas, an explicit
  local Langlands correspondence, the theta correspondence) now apply to all of them.
* **The bound.** Both statements were previously known only for `char k = 0` and `p` "very large" in an ineffective,
  field-dependent sense, by Kim, with Kim–Yu deducing the type statement from it. Here the bound is explicit and
  expected to be optimal: if `p | |W|` or `G` does not split tamely, `G` generally has tori that are not tame, and
  Reeder–Yu's construction, whose ingredients exist in that range, suggests supercuspidal representations of Levi
  subgroups outside Yu's list. Corollary 8.3 adds that supercuspidality is visible in the combinatorics: `π` is
  supercuspidal exactly when a maximal datum has its point in a minimal facet of `B(G_{n+1}, k)` and
  `Z(G_{n+1})/Z(G)` is anisotropic.
* **The method.** Kim matched summands of the Plancherel formula for the group and the Lie algebra, obtaining a
  statement about a measure-one set of representations. This paper instead works explicitly with the action of
  one-parameter subgroups on the Bruhat–Tits building, so the input for the construction can actually be extracted
  from a given representation. It runs in two halves.
  * **Half one (Theorem 6.1).** Every irreducible `π` contains a *datum*: a point `x ∈ B(G, k)`, elements
    `X_i ∈ 𝔤*` generic of depth `−r_i` with `r₁ > ⋯ > r_n > 0` cutting out a tower of twisted Levi subgroups
    `G = G₁ ⊇ G₂ ⊋ ⋯ ⊋ G_{n+1} = Cent_G(ΣX_i)`, and an irreducible representation of
    `(G^der_{n+1})_{x,0}/(G^der_{n+1})_{x,0+}` — a skeleton of Yu's input, differing from it in using elements of the
    dual Lie algebra rather than characters and in not yet requiring cuspidality. The proof is an induction driven by
    a `G_j(k)`-invariant function on the buildings, the semistability of the successive `X_j`, and a correction lemma
    (Lemma 5.1) that moves a subspace by a small group element to replace an approximate character by an exact one.
  * **Half two (§7).** From a *maximal* datum one builds the characters `φ_j`, verifies Yu's genericity condition GE1
    for them, checks Kim–Yu's conditions D1, D3, D4, D5, and runs Yu's construction. The two hard steps are the
    existence of the depth-zero part `ρ` with `ρ ⊗ κ_φ⃗ ≅ π|_K` (Lemma 7.8) and the cuspidality of its components
    (Lemma 7.10).
* **A correction to the literature.** Remark 7.11 records that, contrary to Kim's Proposition 17.2(2), the
  representation `ρ|_{(G_{n+1})_{x,0}} ⊗ κ_φ⃗|_{(G_{n+1})_{x,0}} ⊗ ∏φ_i^{-1}` need not be cuspidal as a representation
  of `(G_{n+1})_{x,0}/(G_{n+1})_{x,0+}`, so that proof is not correct and Lemma 7.10 is proved afresh.

## The source actually read

`arXiv:1810.04198v2`, posted 3 November 2020, 39 pages, SHA-256
`bd332fd73956082656d767870566fdafd0fce3d834cccb223779a7724c3da8cc`, downloaded from
<https://arxiv.org/pdf/1810.04198v2> on 22 September 2026 and read completely: the introduction, §§2–8 and the
bibliography. The published article — *Annals of Mathematics* **193** (2021), no. 1,
[DOI 10.4007/annals.2021.193.1.4](https://doi.org/10.4007/annals.2021.193.1.4) — is paywalled and was not consulted,
so every locator names a section, theorem, lemma or definition number together with the page of the arXiv v2 PDF.
Version v1 is from 9 October 2018; the arXiv comment on v2 reads "39 pages, accepted for publication in Annals of
Mathematics", so v2 is the accepted text. Neither the arXiv abstract page nor Crossref lists an erratum or
corrigendum.

## Checks run on the paper's claims

The paper states no numerics, so the checking was of its internal consistency and its use of the hypothesis.

* **Where `p ∤ |W|` is used.** Each of the five consequences in Lemma 2.2 was traced to its use: (a) passes the
  hypothesis to Levi subgroups, which is what makes the induction along the twisted Levi tower legitimate; (b) and
  (c) are used in Proposition 3.12; (d) and (e) give `H_α = dα̌(1) ≠ 0`, which Definition 3.5 needs to be meaningful,
  and (e) is the hypothesis of Adler–Roche's Proposition 4.1 supplying the bilinear form of Remark 3.10. The
  side-condition `p ≠ 2` invoked before running Yu's construction on p. 29 does follow from `p ∤ |W|` whenever `G` is
  not a torus, since `|W|` is then even.
* **Consistency of the data definitions.** Definition 4.1's conditions — `X_i ∈ 𝔤*_i`, `X_i` generic of depth `−r_i`
  at `x` as an element of `𝔤*_i`, and `G_{i+1} = Cent_{G_i}(X_i)` — do make `G_{i+1}` a twisted Levi subgroup of
  `G_i`, by Lemma 3.4 applied inside `G_i`, so condition (c) of Definition 4.1 is not an extra hypothesis; and the
  representation in (e) is of the quotient by `(G^der_{n+1})_{x,0+}` while Definition 4.2 phrases the same thing
  through `Cent_G(Σ X_i)^der(k) ∩ G_{x,0}`, which agrees because `G_{n+1} = Cent_G(Σ_i X_i)` by the telescoping of
  (iii). Lemma 4.4, that a truncated datum stays one when `x` moves inside `B(G_{n+1}, k)`, is what makes
  Definition 4.6's maximality a condition on facets of `B(G_{n+1}, k)` rather than of `B(G, k)`.
* **Cross-references.** The two theorems of the introduction were matched to Theorem 7.12 and Theorem 8.1; the "main
  difficulty" flagged on p. 5 was matched to Lemma 7.10; Corollary 8.3 was matched to its use in the proof of
  Theorem 8.1; and the three corollaries of §5 were matched to their invocations in §6.

**No mistakes were found in the paper**, so `sourceIssues` is empty. The scope of that claim is exactly the checks
above: the proofs were read for their structure and their inputs, not verified line by line. Note that Remark 7.11 is
a correction *by* this paper *to* Kim's 2007 paper, not a defect of this one, and is recorded in the item on
Lemma 7.10 and in the prerequisite entry for Kim.

## What the libraries and the atlas already have

Nothing in this paper is in the pinned libraries. Seven items are planned and are imported rather than re-planned:
the smooth category, Hecke algebras, induction and Jacquet functors, admissibility, supercuspidal support and the
Bernstein decomposition (`SR.0`–`SR.3`); the Bruhat–Tits building and the parahoric and congruence group schemes
(`ReductiveGroupsPartII:RG2.2`, `RG2.3`); root data, closed subsystems and the index of connection (the Tau Ceti
reductive-groups and root-systems roadmaps); tame ramification and the tame quotient of the absolute Galois group
(the Tau Ceti local-fields roadmap); closed orbits and semistability (`LanglandsParameterStacks:LP3`); and cuspidal
representations of a finite reductive group (the Tau Ceti character-theory and induction–restriction roadmaps).

Searches over every stage description in the atlas determined the rest. **"Moy–Prasad"**, **"twisted Levi"**,
**"Yu's construction"**, **"G-cover"**, **"Bushnell"** and **"Heisenberg"** return nothing; **"s-type"** returns only
an unrelated occurrence in a Shimura-variety layer; **"supercuspidal"** returns only the excursion-operator layers,
which treat supercuspidal support on the spectral side and construct nothing.

## The routes, and why each goes where it goes

**1. Part II of `SmoothRepresentationsOfLocalGroups` — 22 items** (`representations`), titled *Smooth representations
of local groups, Part II: types, depth and the construction of supercuspidal representations*. The parent plans the
general theory — the smooth category, Hecke algebras, induction and Jacquet functors, admissibility with supercuspidal
support, the Bernstein decomposition and centre, Satake, integral families for `GL_n` — and stops precisely where this
paper begins. Everything here is a strengthening of that roadmap in its own direction and of nothing else: the
Moy–Prasad filtration refines the congruence subgroups it needs, types refine the Bernstein blocks it constructs, and
Yu's construction produces the supercuspidal representations whose support `SR.3` already uses. None of it fits inside
an existing layer, since no layer of the parent plans a construction of representations at all; and a new roadmap was
rejected because every layer consumes `SR.0`–`SR.3` and nothing else at the same level. The parent is a campaign
roadmap, so both routes were formally available.

**2. Source for `ReductiveGroupsPartII:RG2.2`, `RG2.3` — 4 items.** The Moy–Prasad filtration `G_{x,r}` with the
lattices `𝔤_{x,r}` and their duals, which refines `RG2.3`'s congruence subgroups to a real-indexed filtration; twisted
Levi subgroups with the tame Galois descent giving a well-defined image of `B(G′, k)` in `B(G, k)`, which refines
`RG2.2`'s building theory; the Adler–Roche non-degenerate `G`-equivariant bilinear form identifying `𝔤_{x,r}` with
`𝔤*_{x,r}` and staying non-degenerate on every twisted Levi subalgebra; and the exactness of the depth filtration on a
short exact sequence of tame tori, with the consequence that `(G_j)_{x,r}` is generated by `T(k)_r` and `(H_j)_{x,r}`.
All four are general local-structure facts with no representation theory in them, and every consumer of Bruhat–Tits
theory in the atlas will want them, not only the Part II proposed alongside.

## Prerequisite papers the atlas does not yet cover

Thirteen entries. Yu's 2001 paper is the construction itself, with the genericity condition GE1, the Heisenberg
structure of its Proposition 11.4 and the restriction statement of its Theorem 11.5; Kim–Yu 2017 the variant producing
types, with the conditions D1, D3, D4, D5; Bushnell–Kutzko 1998 the definition of an `s`-type, the Hecke-algebra
equivalence and the theory of `G`-covers, and their 1993 monograph the model case of `GL_n`. Moy–Prasad supply the
filtration and the notion of depth; Kim 2007 the previous exhaustion theorem, whose Proposition 17.2(2) Remark 7.11
corrects; Adler–Roche the bilinear form and a coset lemma; Kim–Murnaghan the coset statement translated as Lemma 3.11;
Kaletha the exactness of the depth filtration for tame tori; Fintzen's own IMRN paper the equivalence between
Assumption 2.1 and the tameness of all tori; Reeder–Yu the epipelagic construction that motivates the expectation
that the bound is optimal; Springer–Steinberg and Steinberg the notions of bad and torsion primes; and Gérardin the
Weil–Heisenberg representations of finite Heisenberg groups.

## Mistakes found in the source

**None.** `sourceIssues` is `[]`. The one correction in the paper is a correction *of the literature*: Remark 7.11
shows that Kim's Proposition 17.2(2) is false as stated, which is why Lemma 7.10 receives a new proof here. That is
recorded in the item on Lemma 7.10 and in the prerequisite entry for Kim, not as a finding against this paper.

## What this extraction does not claim

Nothing here is formalised, and nothing is claimed to be. Four boundaries are worth naming. First, Yu's construction
and the Kim–Yu variant are recorded as items with their inputs and outputs, not decomposed: a blueprint for the Part II
will have to plan them layer by layer, and they are substantial papers in their own right. Second, the paper's
verification that its tuple satisfies Kim–Yu's conditions D1, D3, D4 and D5 is recorded as a statement; the conditions
themselves live in Kim–Yu and are listed under prerequisites. Third, the expectation that the hypothesis `p ∤ |W|` is
optimal is recorded as an expectation, with the Reeder–Yu evidence, and not as a theorem; the brief says so. Fourth,
the claim that no mistakes exist means only that the checks listed above found none.
