# PAPER-MOK-PILA-TSIMERMAN-19 — Ax–Schanuel for Shimura varieties

Claude Code — session `cc-7b31c4`; issue #1137; read on 22 September 2026.

## Corrections by the independent review (REV-PAPER-MOK-PILA-TSIMERMAN-19)

Reviewed by Claude Code, session `cc-442dc5`, on 23 September 2026, against the same arXiv v3 (same SHA-256). The extraction now has **44 items (8 planned, 36 missing) and three routes**. The report below is the extraction's, with these changes.

- **Item 2 moved from D4 to the Part II.** The ShimuraData D4 source route is rejected. D4 comes before the construction of X = Γ\Ω (ShimuraVarieties V0 depends on D5, which depends on D4), so a D4 source cannot own *subvarieties* of X. The Part II, which already imports ShimuraData and ShimuraVarieties, now defines them.
- **Item 2 corrected.** The paper says weakly special subvarieties are bi-algebraic, not that they are exactly the bi-algebraic ones; the converse is Ullmo–Yafaev's and is not used. The item now also records that they come in countably many families, which are defined over Q̄ and stable under Galois (§12.1, used in Lemma 4.3).
- **Item 36 narrowed.** Closed analytic subspaces and Chow's theorem are planned in ComplexComparisonPartII C0 and C4, not C2. The classical Remmert–Stein theorem and the local dimension theory of analytic sets were claimed as planned, but no layer plans them, and the paper does not use them.
- **Item 38 re-cited.** Siegel sets and the finite covering of the quotient are planned in AdelicAlgebraicGroups AA.3 (with ShimuraVarieties V0 consuming them), not in ArithmeticLocallySymmetricSpaces ALS.0.
- **Five items added:**
  - **40:** the proper mapping theorem and the semicontinuity of fibre dimension, used for A(k) and in Lemma 9.2. It has a new source route to ComplexComparisonPartII C0 and C4.
  - **41:** the weighted-projective compactification of jet spaces (§9.1).
  - **42:** Theorem 12.5.
  - **43:** the deduction of Theorem 9.1 from Theorem 12.3 (§12.4).
  - **44:** the remark that second-order partial derivatives of q generate all of them.
- **Part II brief amended.**
  - It now covers weakly special subvarieties and the new items, and imports AA.3 and C0.
  - It carries a design constraint: import only LD.6's o-minimality and counting content, since LD.6's applications consume this Part II and a whole-layer import would close a stage cycle.
  - It records the overlap with PAPER-TSIMERMAN-18, which routes weakly special subvarieties to LD.6.
- **Mistakes.**
  - E1–E5 are confirmed. E1's reason was corrected: in Example 7.1.1, o = 0 is the centre of the disc model, not a point of the upper half-plane. E3 was extended to two further occurrences, in the VMRT sentence after Theorem B.
  - Six further misprints are added, each checked on the page image:
    - **E6:** the Schwarzian coordinate in Example 7.1.1 is off by the factor 6.
    - **E7:** B = K_ℂN⁺ should be B = K_ℂN⁻.
    - **E8:** G(ℂ) "acts on X" should read "acts on Ω̂".
    - **E9:** Lemma 3.3 should be Lemma 9.4.
    - **E10:** q(gv) should be q(gw).
    - **E11:** the index of the rank matrix should run over the d derivations.
  - The `known` field of every finding is now the canonical "new".

The 29-page paper has been extracted into 39 items. None is in the pinned libraries, eight are planned by existing
layers of the atlas, and the remaining 31 each have exactly one route: 28 go to a **Part II** of
`LogicAndDefinabilityInNumberTheory`, 2 become sources for `LogicAndDefinabilityInNumberTheory:LD.6` itself, and 1 for
`ShimuraData:D4`. This is a paper inventory and routing proposal, not a proof blueprint: the results quoted from
Peterzil–Starchenko, Klingler–Ullmo–Yafaev, Hwang–To, André, Deligne, Ochiai, Mok, Pila–Wilkie, Seidenberg and Kazhdan
are recorded as items with their own prerequisite entries and are not decomposed here.

## Fixes from the red team (FIX-RT-PAPER-MOK-PILA-TSIMERMAN-19)

Applied by Claude Code, session `cc-c2c06b`, on 1 October 2026. The fixes apply the 13 confirmed findings of RT-PAPER-MOK-PILA-TSIMERMAN-19. The extraction now has **49 items (8 planned, 41 missing)** and the same three routes.

**The published version.** The fix job read the published article (*Ann. of Math.* **189** (2019), 945–978, <https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p07-s.pdf>, SHA-256 `1eab0797…762a0ab`) for the passages the findings concern.
- **New theorem.** Its Theorem 1.2 is the new 2-sorted inequality.
- **Renumbering.**
  - arXiv v3 Theorems 1.2–1.4 are published 1.3–1.5.
  - v3 Theorems 12.3 and 12.5 are published 12.1 and 12.2.
  - v3 §9.1 is published §9.2.
- **Extra hypothesis.** Published Theorems 1.1 and 9.1 add that W is the full restriction of one irreducible Ŵ.
- **Locators.** Changed items now give both versions' locators.

**Statements corrected.**
- **Item 20:** the adjoint Hodge structure has weight 0, not 2. This was a preprint misprint, corrected in print; it is recorded as E12.
- **Item 41:** the jet compactification removes the locus (constant jet, s = 0). It is functorial only for maps that preserve nonconstant jets (E13).
- **Item 32:** "p₂ is a function of p₁" means rank(p₁, p₂) = rank(p₁), propagating errata E7.
- **Item 43:** derivatives are recovered algebraically from the formal matrix r, and differential Ax–Schanuel is applied with rank(z) = dim(z), propagating errata E6.
- **Items 30, 31 and 33:**
  - The printed proof of Lemma 11.1 is invalid (errata E4). Finite-order determination is now an unresolved prerequisite.
  - Theorem 11.3 needs the compatibility du = v₁ ∘ dw (errata E5), and uniformized loci carry it.
- **Item 16:** Hwang–To growth is stated for positive-dimensional analytic subvarieties of Ω and applied upstairs. On a quotient it is false. The printed "γ·W ∩ X ∩ B(R)" is recorded as E14. Hwang–To's exact hypotheses must still be read from the primary paper.
- **Item 22:** freeness holds for the effective image of G in Aut(Ω̂), since −I ∈ SL₂ fixes every jet. In the expected-dimension terms, dim G means the dimension of that image.
- **Items 13, 14 and 29:** the stabilizer lemmas are restated as steps of the contradiction argument, under its hypotheses.
- **Items 18, 19 and 31:** jet maps keep the arity fixed.
- **Items 4 and 5:** "a basis of modular functions" becomes finitely many generators of the modular function field (errata E3).

**Items added.**
- **45:** the smallest weakly special envelope.
- **46:** the 2-sorted Theorem 1.2.
- **47:** Theorem A.
- **48:** the highest-weight tangent orbit (VMRT).
- **49:** Ochiai's Theorem B.

All five go to the Part II, and item 23 consumes 47–49.

**Prerequisites.**
- The Mok entry is now his 1999 Contemp. Math. article ([23], §(2.3)), not his 1989 book.
- The compactification sources are separated.
- The DOIs of Scanlon, Bertrand–Zudilin and Daw–Ren are corrected.

**The Part II brief** now records these as binding design obligations. "Errata E3–E7" refers to the separate errata file `research/blueprint/errata/PAPER-MOK-PILA-TSIMERMAN-19.json`, not to this file's own `sourceIssues`, which use the same numbers for other misprints.

## What the paper proves

Let `Ω` be a Hermitian bounded symmetric domain for a semisimple group `G`, `Γ ⊂ G(ℤ)` of finite index,
`X = Γ\Ω` the resulting connected pure Shimura variety, `q : Ω → X` the uniformization and `D ⊂ Ω × X` its graph.
An algebraic subvariety of `Ω × X` means a component of an algebraic subvariety of `Ω̂ × X` restricted to `Ω × X`,
where `Ω̂` is the compact dual.

* **Ax–Schanuel (Theorem 1.1).** If `W ⊂ Ω × X` is algebraic and `U` is an irreducible component of `W ∩ D` with
  `dim W < dim U + dim X` — equivalently `codim U < codim W + codim D` — then the projection of `U` to `X` lies in a
  proper **weakly special** subvariety. Since every component has `dim U ≥ dim W − dim X`, the theorem says that all
  atypical components come from the bi-algebraic subvarieties, which do genuinely produce them: for `W = Ω₁ × X₁`
  with `X₁` weakly special and `Ω₁` a component of its preimage, `dim W = dim U + dim X₁`. For
  `q = exp : ℂⁿ → (ℂ^×)ⁿ` the statement is an equivalent form of Ax's theorem, though `(ℂ^×)ⁿ` is mixed and not pure.
* **How.** Definability of `q` on a Siegel fundamental set (Klingler–Ullmo–Yafaev, after Peterzil–Starchenko) plus
  definable Chow gives the crucial new algebraicity: a `Γ`-invariant closed analytic set definable on a fundamental
  domain descends to an algebraic subset of `X × X`. Applied to a Hilbert-scheme family of atypical intersections
  this produces an algebraic `V ⊂ X × X` with Zariski-dense monodromy (André–Deligne), from which the stabilizer
  `Θ` of a very general member is shown to be normal in `G(ℝ)` and then trivial. On the other hand, the uniform
  volume bound coming from definability, played against the exponential volume growth of Hwang–To, puts polynomially
  many integer matrices in a definable set, so Pila–Wilkie produces algebraic curves through at least two integer
  points and `W` acquires an infinite stabilizer — a contradiction. The whole runs as a triple induction on `dim Ω`,
  on `dim W − dim U` and on `dim U`.
* **With derivatives (Theorem 9.1).** The same statement in the jet spaces `J^{nd,r}_kΩ × J^{nd,r}_kX`, with the
  expected-dimension condition now `dim W < dim U + dim G`, because by Lemma 9.2 the Zariski closure of the jet graph
  is its `G(ℂ)`-orbit. Two corollaries: finitely many generators of the modular function field together with their partial derivatives to order
  `k ≥ 2` has transcendence degree `dim G` over `ℂ` and over `ℂ(z)` (Theorem 1.2, generalising Bertrand–Zudilin), and
  restricted to a variety `V` not inside a proper weakly special subvariety the degree is at least `dim G + dim V`
  (Theorem 1.3).
* **Schwarzians.** To make this work the paper develops the Schwarzian differential equation of a Hermitian symmetric
  domain: with `𝔤 = 𝔫⁻ ⊕ 𝔨_ℂ ⊕ 𝔫⁺` and `Ω̂ = G_ℂ/B`, set `W_m := G · id_m(o) ⊂ J_mΩ̂`. Then `B` fixes `id₁(o)`
  exactly on `N⁻`, the effective image of `G` acts freely on `id₂(o)`, and a map with `J₃F ∘ id₃ ⊂ W₃` is a `G(ℂ)`-translate; in the ball
  order 2 suffices, by the Fundamental Theorem of Projective Geometry, and in rank at least 2 order 1 suffices, by
  Ochiai's theorem. The Schwarzian variety `S_k(Ω̂) = G\J_kΩ̂`, the map `ψ_k` and the connection formula then show
  that the Schwarzian of an automorphic function is algebraic, so `q` is characterised up to `G(ℂ)` by an algebraic
  differential equation. For `PSL₂` and `k = 3` this is the classical Schwarzian.
* **In a differential field (Theorem 1.4).** For a differential field `(K, D, C)` and a uniformized locus `(z, x, y)`
  of rank `k`, `tr.deg._C C(z, x, y) ≥ rank(z) + dim G` unless `x` lies in a proper weakly special subvariety. This
  rests on §11, which characterises `(w, u, v) = L(w, g, r)` by differential equations, using an integrable algebraic
  foliation to keep the group element constant, and on the Seidenberg embedding theorem to turn the hypothesis into
  holomorphic functions on a disc.

## The source actually read

`arXiv:1711.02189v3`, posted 20 September 2018, 29 pages, SHA-256
`b3de4f10ea6243fafcfc4a12adc939b1c8c6fab620afa00d2860d5313e1c0167`, downloaded from
<https://arxiv.org/pdf/1711.02189v3> on 22 September 2026 and read completely: the introduction, Parts I, II and III
and the bibliography. The published article — *Annals of Mathematics* **189** (2019), no. 3,
[DOI 10.4007/annals.2019.189.3.7](https://doi.org/10.4007/annals.2019.189.3.7) — is paywalled and was not consulted,
so every locator names a section, theorem, lemma or equation number together with the page of the arXiv v3 PDF, and
the five findings below are recorded against that version. Version v1 is from 6 November 2017; the arXiv abstract page
carries no comment and no journal reference, and neither it nor Crossref lists an erratum or corrigendum.

## Checks run on the paper's claims

The paper contains no numerics, so the checking was of its dimension bookkeeping, its normalisations and its
cross-references.

* **The two forms of atypicality.** In `Ω × X` of dimension `2n` with `dim D = n`, the condition
  `codim U < codim W + codim D` reads `2n − dim U < (2n − dim W) + n`, which is exactly `dim W < dim U + dim X`, as
  printed. The remark that such a component always has `dim U ≥ dim W − dim X` is the general intersection bound
  `dim U ≥ dim W + dim D − dim(Ω × X)`.
* **The extreme case.** For `W = Ω₁ × X₁` with `X₁` weakly special and `Ω₁` a component of its preimage, `W ∩ D`
  is the graph of `q|_{Ω₁}`, so `dim U = dim X₁` and `dim W = 2 dim X₁ = dim U + dim X₁`, as printed; it is atypical
  precisely when `X₁` is proper.
* **The classical Schwarzian.** Example 7.1.1 computes that `(0, a, b, c)` in the coordinates
  `t ↦ z + at + bt²/2 + ct³/6` on `J₃ℂ` reduces to `(0, 1, 0, c/(6a) − b²/(4a²))`. With `f′ = a`, `f″ = b`,
  `f‴ = c` at the origin, the classical Schwarzian is `S(f) = f‴/f′ − (3/2)(f″/f′)² = c/a − 3b²/(2a²)`, and
  `S(f)/6 = c/(6a) − b²/(4a²)` exactly, so the invariant produced is the classical one up to the factor `6`.
* **Theorem 1.2 in the smallest case.** For `G = PSL₂`, `dim G = 3` and `n = 1`; the classical statement that
  `j, j′, j″` are algebraically independent while `j‴` is algebraic over them gives transcendence degree `3`,
  matching `dim G`. Theorem 1.3 with `V = Ω` then gives `≥ 4` for `z, j, j′, j″`, again classical.
* **Cross-references.** Theorem 1.1 was matched to §4, Theorem 1.2 to Corollary 9.3, Theorem 1.3 to Corollary 10.4
  and Theorem 1.4 to Theorem 12.3; this is how findings E4 and E5 were located.

Five misprints were found; they are recorded in `sourceIssues` and listed below. None affects a proof.

## What the libraries and the atlas already have

Nothing in this paper is in the pinned libraries. Eight items are planned and are imported rather than re-planned:
o-minimal structures, definable sets and cell decomposition (`LD.0`, `LD.6`); the Pila–Wilkie counting theorem, which
`LD.6` plans as "a source-complete Pila-Wilkie rational-point estimate outside the algebraic part"; Hermitian
symmetric domains, the compact dual, the Borel embedding and the Hodge decomposition of the adjoint representation
(`ShimuraData:D2`, `D3`); arithmetic groups, Siegel sets and fundamental sets (`ShimuraVarieties:V0`,
`ArithmeticLocallySymmetricSpaces:ALS.0`); the analytic tower and Baily–Borel algebraicity (`ShimuraVarieties:V1`,
`V2`, `V3`); Chow's theorem and the analytic comparison (`ComplexComparisonPartII:C2`, `C4`); and Hilbert schemes
(`AlgebraicModuliForArithmeticGeometry:R09.1`, `R09.2`).

Three searches over every stage description in the atlas came back empty and shaped the routing: **"weakly special"**
and **"bi-algebraic"** return nothing; **"Peterzil"**, **"definable Chow"**, **"jet space"**, **"Schwarzian"**,
**"differential field"** and **"Hwang"** return nothing; and **"Ax–Schanuel"** returns only `LD.6`, where it appears
not as a plan but as an input to be acquired.

## The routes, and why each goes where it goes

**1. Part II of `LogicAndDefinabilityInNumberTheory` — 28 items** (`modeltheory`), titled *Logic, definability, valued
fields and motivic integration, Part II: functional transcendence and Ax–Schanuel for Shimura varieties*. The atlas
has already committed to this proof. `LD.6` builds Pila–Zannier applications "from separate Galois-orbit bounds,
definability of uniformization and functional-transcendence theorems", and its source route reads: "independent
Galois-orbit and Ax-Lindemann/Ax-Schanuel inputs. Record the exact full proof for each." So the question is not
whether but where. It cannot go inside `LD.6`, which is about o-minimal structures, definable sets, cell decomposition
and rational-point counting: the bulk of this paper is the Schwarzian differential equation of a Hermitian symmetric
domain, jet spaces, Ochiai's theorem, Hwang–To volume growth, the André–Deligne monodromy theorem and differential
algebra. Those are new layers in `LD.6`'s direction, which PROTOCOL.md §15 calls a Part II. A new roadmap was rejected
because the theorem exists to feed the unlikely-intersection programme `LD.6` owns and because half its proof is
`LD.6`'s own subject; the parent is a campaign roadmap, not a Tau Ceti one, so both routes were formally available.

**2. Source for `LogicAndDefinabilityInNumberTheory:LD.6` — 2 items.** Definable Remmert–Stein and definable Chow,
with the constructible corollary: a definable complex analytic subset of a quasiprojective variety, closed in it, is
algebraic. These are theorems of o-minimality with no Shimura content — the definable form of GAGA — and every
consumer of o-minimality in the atlas will want them, not only the functional-transcendence layers. `LD.6` plans
o-minimal structures and definable sets and should own them, but its text does not mention them. This is a source
route on an existing layer of the same roadmap whose Part II takes the rest of the paper; the two are complementary,
one adding to a layer that exists and the other adding layers that do not.

**3. Source for `ShimuraData:D4` — 1 item.** Weakly special subvarieties and their bi-algebraicity. `D4` constructs
the category of Shimura data and defines the distinguished classes — special pairs, special points, Hodge type,
abelian type, pre-abelian type — and weakly special subvarieties belong to exactly that list, with the special
subvarieties being the weakly special ones containing a special point, a definition `D4` already has half of. The
notion occurs nowhere in the atlas, and PROTOCOL.md §15 asks that a general missing notion be planned once in the
layer that owns its neighbours. The Part II then imports it, which matters because every statement in this paper has
"is contained in a proper weakly special subvariety" as its conclusion.

## Prerequisite papers the atlas does not yet cover

Thirteen entries. Peterzil–Starchenko supply the definable GAGA theorems; Klingler–Ullmo–Yafaev the definability of
`q` on a Siegel set, the volume bound of their Lemma 5.8, and the Ax–Lindemann theorem this generalises; Pila–Wilkie
the counting theorem; Hwang–To the exponential volume growth; André and Deligne the Zariski density of monodromy;
Ochiai the characterisation of automorphisms of S-structures (Theorem B) and Mok's 1999 Contemp. Math. article the
local holomorphic Fundamental Theorem of Projective Geometry (Theorem A; corrected by the fix job, which had cited
Mok's 1989 book), while the alternative compactification route to Lemma 3.3 cites a 2017 preprint of Mok and Mok–Zhong; Ax the original theorem; Pila–Tsimerman the `j`-function case with derivatives that Theorems 1.2 and 1.3
generalise; Scanlon the general theory of algebraic differential equations from covering maps and the form of
Seidenberg's embedding theorem used here; Bertrand–Zudilin the Siegel case of Theorem 1.2; Kazhdan the theorem that a
conjugate of an arithmetic variety is arithmetic; and Daw–Ren and Bakker–Tsimerman the downstream applications to
Zilber–Pink and to variations of Hodge structure.

## Mistakes found in the source

Five misprints, none of which affects a proof.

* **E1** (§7.1, p. 11). "Picking a base-point `o ∈ X`" should be `o ∈ Ω`: `N⁺` acts on the compact dual, not on
  `Γ\Ω`, and everywhere else in §7 the base point is in the domain — the sections are `id_m : N⁺ → J_mN⁺`, the
  Schwarzian equation is `W_m = G·id_m(o) ⊂ J_mΩ̂`, and Example 7.1.1 takes `Ω = ℍ`, `o = 0`.
* **E2** (§7.3, p. 13). "Ochai's Theorem" for "Ochiai's Theorem"; the name is spelled correctly three times nearby
  and in the bibliography.
* **E3** (§7.3, pp. 13–14). In the paragraph preparing Theorem B, `T_x(X)` appears three times where `T_x(S)` is
  meant: the space there is written `S = G/B` and `x ∈ S`, while `X` is reserved throughout the paper for the Shimura
  variety. Theorem B itself, stated two lines later, is correctly phrased in terms of `S`.
* **E4** (proof of Theorem 8.2, p. 16). "Theorem 7.3" should be "Corollary 7.3"; §7 has Lemma 7.1, Proposition 7.2,
  Corollary 7.3, Theorem 7.4 and Theorem 7.5, and no Theorem 7.3.
* **E5** (proof of Theorem 12.3, p. 25). "`rank(k)`" should be "`rank(z)`", or simply `k`: two lines earlier the
  proof states `dim U′ = k = rank(z)`, and rank is an operation on `K`-points, not on integers.

Each finding is recorded in `sourceIssues` with its quotation, correction, reason and the places checked for a
published correction: the arXiv abstract page and version history for 1711.02189 and the Crossref record for
DOI 10.4007/annals.2019.189.3.7. The items above use the corrected statements.

## What this extraction does not claim

Nothing here is formalised, and nothing is claimed to be. Four boundaries are worth naming. First, "planned" means a
named layer states the material as a construction target; in particular `LD.6` plans Pila–Wilkie but has not acquired
its proof, which is why Pila–Wilkie's paper is also listed under prerequisites. Second, two theorems the paper quotes
without proof — Hwang–To volume growth and Kazhdan's theorem on conjugates of arithmetic varieties — are recorded as
items with their hypotheses and as prerequisites; a blueprint will have to decide whether to import or to decompose
them. Third, the paper's own remark that a purely complex-analytic approach to Lemma 3.3 exists, via compactification
of complete Kähler manifolds of finite volume and `L²` estimates for `∂̄`, is recorded but not routed: the extraction
follows the o-minimal proof the paper actually gives. Fourth, the applications to Zilber–Pink and André–Oort are
noted as downstream consumers of the Part II and are not among its targets; they belong to `LD.6`.
