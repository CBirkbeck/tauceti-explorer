# He (2021): cordial elements and affine Deligne–Lusztig dimensions

Agent: Codex. Session: `codex-c83e7a`. Issue: [#1397](https://github.com/CBirkbeck/tauceti-explorer/issues/1397). Status: **partial checkpoint**.

The full published paper was read. This checkpoint records 105 items: 7 library, 10 planned and 88 missing. It routes 85 missing items and the 10 planned items through eight source routes and two Part II briefs. Three missing proof interfaces remain deliberately unrouted: /61, /69 and /92. The proposed final theorems are recorded faithfully, but their proof closure is not certified. Nothing here claims a Lean formalization.

## Source and reading record

Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*, Forum of Mathematics, Pi **9** (2021), e9, 1–15, [DOI 10.1017/fmp.2021.10](https://doi.org/10.1017/fmp.2021.10). The primary source was the [published Cambridge PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), acquired on 2026-09-21 at 18:42:15 UTC, SHA-256 `88927779f86559df0e819095936316683ac37b2aa7e8ee338b1c3981d8fec013`. Its title page gives CC BY 4.0. All fifteen pages, every proof and the references were read. Images of pages 7 and 13 were inspected to resolve closure bars and conjugation superscripts. The arXiv 2001.03325 PDF was acquired, but the extraction uses the publication itself and does not depend on an unverified version match.

The JSON includes source and prerequisite acquisition URLs, hashes and times. Selected supporting passages were read rather than inferred from their titles:

| Source | Passages actually inspected | Remaining source work |
|---|---|---|
| GHN15, published Numdam PDF | §§2.1–2.5 and §§3.1–3.6, PDF pp.6–14 / journal pp.650–658 | Full downstream Hodge–Newton decomposition and generality transfer |
| GHN 2017 erratum | All three pages | Incorporate the corrected comparison into the actual carrier |
| GH10, author PDF | pp.6–7: relative-position geometry, Lemma 2.5.1, Proposition 2.5.2 and start of induction | Finish the induction and read §2.3/Lemma 2.6.1 in their original setting |
| MV20, arXiv PDF | pp.2,8–9: main saturation, Corollary 3.12, Definition 3.14, Theorem 3.16 and proof | Newton purity, completion comparisons and chain-length suppliers |
| He15, arXiv survey | pp.36–38: shrunken convention, Theorems 2.27, 2.29, 2.30 and their scope | Full Theorems 2.23/2.24 and ramified/perfect-geometry reduction |

The original HN14, He14, Viehmann14, He09, GHKR10 and the cited edition of Görtz–Wedhorn are listed as unfinished prerequisite reading. Bhatt–Scholze and Zhu are already explicit sources of the existing GS0:Witt-geometry owner; they are imported there rather than proposed as a second project. Background on Shimura strata, class polynomials, alcove walks and the later He–Yu application in the introduction is historical context, not a claimed new theorem of this extraction. A closure pass should still audit the supporting-paper subtrees before upgrading the checkpoint.

## Mathematical outcome and scope

Write `L=F-breve`, fix the Frobenius-stable Iwahori `I`, and use the paper’s convention that `t^λ` translates the apartment by `−λ`. After §2.2, **G is simple and quasi-split**. The unique normal form is `w=x t^λ y`, with λ dominant and `t^λ y` minimal for the left finite-Weyl coset. Thus `ησ(w)=σ⁻¹(y)x` and

`d_w(b) = (ℓ(w)+ℓ(ησ(w))−def_G(b))/2 − ⟨ν_b,ρ⟩`.

The paper proves that every `x t^λ` is cordial, with maximal Newton class `[t^λ]`. A cordial element has the virtual dimension on every nonempty ADLV and a saturated Newton set **between a known nonempty lower endpoint and its maximum**. Saturation does not by itself put the basic class in that set.

Normalized subtraction is a least dominant element in a fixed integral-coroot congruence class. It constructs the double-flat coweight `λ_w^{♭♭}`. The two-correspondence argument produces a comparison `w ⇒σ a t^γ`, with `γ ≥_Z λ_w^{♭♭}` and σ-support containing that of `ησ(w)`. The main theorem requires all of:

- the original alcove `w a` is shrunken;
- every simple-coroot coefficient of `λ_w^♦−ν_b` is strictly positive;
- `(λ_w^{♭♭})^♦ ≥ ν_b`.

Under these hypotheses, nonemptiness is equivalent to equal κ and full σ-support, and the dimension equals `d_w(b)`. Corollary 6.4 replaces the two Newton inequalities by `λ_w^♦ ≥ ν_b+2ρ∨`, retaining the shrunken condition. Neither statement solves all ADLVs. Split minuscule λ can satisfy `λ^{♭♭}=λ`, so the strict hypothesis cannot be silently dropped. The final Levi remark requires a separate Hodge–Newton decomposition and rechecking the theorem’s assumptions on the resulting simple factors.

The following item ranges make the extraction reviewable; the JSON contains individual statements and definition/construction APIs and tests.

| Items | Coverage |
|---|---|
| /1–/28 | Local field/root data, Iwahori–Weyl group, flag carrier, invariants, virtual dimension, support, orders and shrunken chambers |
| /29–/40 | Twisted reduction, minimal-length results, geometric dimension recurrence, comparison relation and Demazure product |
| /41–/52 | Generic Newton class, cordiality, saturation, Mazur criterion and closure proof for `x t^λ` |
| /53–/63 | Least dominant subtraction, its proof/API, auxiliary coweights and double-flat construction |
| /64–/84 | Relative-position geometry, both convolution estimates, every major intermediate factor/correspondence and dimension gain in §5.4 |
| /85–/105 | Levi obstruction, corrected conjugation, basic seed, both main conclusions, corollary, side remark and GHN erratum |

## Three unresolved interfaces

**G1 — /61: the auxiliary coweight lattice is not automatically the group’s lattice.** The coweight `ρ∨_J` pairs as 1 with simple roots in J and 0 with the others. For `G=SL2` and nonempty J it is `α∨/2`, while `X_*(T)=Z α∨`. The proof’s factors `t^{ρ∨_J}` therefore need an explicit enlargement/adjoint passage. Defining the rational vector is straightforward; placing its translation in the original group is not.

The [GHN erratum](https://www.esaga.uni-due.de/f/ulrich.goertz/pdf/Erratum-GHN.pdf) is directly relevant. Its corrected Proposition 0.0.1 supplies a **componentwise** affine-flag isomorphism in equal characteristic when the residue characteristic does not divide `|π1(G_ad)|`. A global immersion additionally needs injectivity on components. GHN15’s mixed-characteristic passage at that point states a set comparison, which alone proves no dimension identity. The original paper itself explains in §1.5 that it transfers results through Iwahori–Weyl combinatorics to broader groups. That is a legitimate proposed strategy, but the actual comparison needed by these auxiliary translations and κ equality has not been verified here. Do not label the main theorem false on this basis.

**G2 — /69: the fiber-dimension argument needs bounded geometric models.** On pp.11–12 the paper chooses an irreducible component Z of X3 and excludes closed subsets `Z_Y` indexed by components of its preimage. The step that their union is proper needs finiteness, or a replacement argument carrying equivalent hypotheses. An arbitrary infinite union of proper closed subsets need not be proper. Fixed-relative-position convolution should supply bounded finite-type models, but its application to these ind-scheme/perfect-space maps must be proved. The generic finite-type dimension lemma is routed to SF.0; this specific applicability bridge is left open. Universal homeomorphisms preserve the relevant topological dimension once the geometry is constructed; they must not be renamed scheme isomorphisms without perfection.

**G3 — /92: the constructed basic seed is not necessarily shrunken.** He21 p.14 cites He15 Theorem 2.27 to conclude `X_{a t^γ}(τ)≠∅`. The cited theorem assumes that `a t^γ` is shrunken, while Theorem 5.5 only states dominance of γ and full support of a. The actual construction can fail that extra assumption.

Here is an exact example in split adjoint type A2, with simple-root coordinates `(u,v)` and base alcove `u<0`, `v<0`, `u+v>−1`. Let `λ=ω2∨=(0,1)`, `y=1`, `x=s2s1` and `w=x t^λ`. Then

`w(u,v) = (v−1, 1−u−v)`.

The three positive-root coordinates lie respectively in `(-2,-1)`, `(1,2)`, `(0,1)`, so w is shrunken. The §5.4 construction has `J=∅`, `J′={s1}`, `x′=s2`, `z=s1`, `γ=λ`, `y′=1`, and `a=s1*s2=s1s2`. Consequently

`a t^γ(u,v) = (1−u−v, u)`.

Its second simple-root coordinate is in the removed strip `(-1,0)`. Both x and a have full support. For the basic class in the κ-fibre, ν is zero, λ has positive simple-coroot coefficients `(1/3,2/3)`, and `λ^{♭♭}=λ`, so the input also meets the main theorem’s Newton hypotheses. This proves that the cited shrunken theorem cannot be applied **directly to this constructed element**. It does not prove that this seed is empty or contradict the main theorem; here w itself is already cordial and can be selected differently. A general seed theorem or a modified reduction is the remaining task.

A preliminary rank-one concern was rejected: in the paper’s asymmetric strip convention, `s a=(0,1)` is shrunken. The checkpoint records that correction and relies only on the explicit A2 calculation.

## Proof corrections already made in the extraction

- The support-obstruction proof on p.13 gives inconsistent conjugating-element/inverse notation. GHN15 Lemma 3.6.3 applies with the normal-form left factor **x**: `x⁻¹wσ(x)=t^λ yσ(x)=t^λσ(ησ(w))`. This places the element in the indicated Levi Weyl group with translation λ. Item /87 states this consistent version.
- Every overbar in the p.7 closure sandwich is retained. Distinct raw Iwahori double cosets are disjoint and cannot satisfy the displayed containment without closures.
- Proposition 5.1’s coweight sums use **simple coroots** and allow zero coefficients. Its common-lower-bound argument is supplemented by nonemptiness and a finite-below-one-feasible-point argument proving actual leastness. In the A1 full coweight lattice, `0−domω∨=ω∨`; naïve truncation at zero loses the required coroot congruence.
- He15 Theorem 2.30 uses I-normalized dimension of a Newton stratum, with a **plus** Newton pairing. The ADLV formula follows after subtracting `⟨2ρ,ν_b⟩` using the comparison theorem; the two conventions are not interchangeable.
- The GHN erratum’s second correction retains the **basic** hypothesis for uniqueness of a Levi σ-class. `diag(t,1)` and `diag(1,t)` in GL2 are a counterexample without it. The emptiness direction uses every Levi representative and does not need that uniqueness assertion.

## Library and atlas ownership

The pinned commits are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Exact declarations were opened before marking the seven library items. In particular:

| Library item | Exact existing interface |
|---|---|
| /6–/7 | `CoxeterSystem.length`, `IsReduced`, `length_inv`, `length_mul_le` |
| /8 | `CoxeterSystem.BruhatStep`, `BruhatLE`, `bruhatPartialOrder` |
| /24 | `TauCeti.dominantChamber`, `openDominantChamber` |
| /25 | `TauCeti.existsUnique_mem_orbit_inter_dominantChamber`, `stabilizer_eq_closure_wallReflections` |
| /26 | `TauCeti.posRootCone`, `mem_posRootCone`, applied to the flipped pairing |
| /27 | `TauCeti.finite_setOf_dominant_sub_mem_posRootCone`, dualized with its integrality hypotheses |

These are abstract root/Coxeter statements. They do not provide an affine Deligne–Lusztig variety or the comparison between a local group’s relative Weyl group and the abstract root-pairing carrier. Searches in both pinned source trees found no appropriate ADLV, Iwahori, Kottwitz, cordiality or Demazure-product implementation. Occurrences of “Chevalley–Demazure” in algebraic-group bibliographies are unrelated. The existing Bruhat file and chamber/fundamental-domain files were read rather than treating the old upstream roadmap prose as a current library audit.

Ownership was checked at explorer commit `ca6dcd4422eb59d1518b2a0054784d36102ee17b`, using the full relevant atlas stage descriptions and README files, accepted decompositions for GS/HS, the new-roadmap and packet directories, reserved IDs and `data/library-coverage.json`. The latter’s accepted AUDIT-20/21 entries, reviewed on 2026-09-17, identify the missing BG/GS/HS geometry; no separate RG2/root-systems entry was found there, so their source files were checked directly. Old root-system prose saying chamber/Bruhat theory is absent was overridden by actual pinned declarations. The conflicting upstream root/highest-weight prose about lattice ownership is not permission to duplicate either roadmap.

The eight source routes refine existing owners: RG2.0 for the completed-field action adapter; RG2.1 for local roots; RG2.2–3 for alcove/Iwahori data; RG2.4 for decompositions; BG0 for B(G)/J_b/defect; BG1 for κ/ν/order and Levi behavior; GS0:loop-geometry/GS0:Witt-geometry for flag/convolution geometry; and SF.0 for the finite-type fiber-dimension lemma. Planned items retain their exact stage IDs.

The two new briefs are continuations, not standalone replacement foundations:

1. **RootSystemsPartIIDominanceAndDemazure** extends the Tau Ceti root-system roadmap. It imports existing Coxeter presentation/exchange, chambers, dominant representatives and lattice interfaces; adds the Demazure monoid, normalized subtraction and affine twisted reduction; and exports the exact combinatorics consumed here. Its area is `grouptheory`.
2. **HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig** extends local Frobenius-modification geometry to classical Iwahori ADLV nonemptiness and dimension theory. It imports GS flag geometry, BG invariants and RG local groups. HS2’s local shtuka diamonds alone are not classical ADLV schemes, and a comparison must be an actual theorem. Its area is `langlands`.

Both briefs specify imports by title/ID, final theorem hypotheses, intermediate proof tasks, API/tests and suggested future Lean homes. G1–G3 gate implementation; the brief must not turn them into assumed theorem fields.

## Validation and limits

Exact rational scratch computations checked 729 A2 and 512 A1 instances of iterated normalized subtraction, all 216 triples for associativity of the A2 Demazure product, and 570 A2 shrunken-input reductions with dominant coordinates from 0 through 4. Of these, 34 produced a non-shrunken reduced element; the explicit example above is one. The computations also checked singular/zero-γ cases. These finite checks are evidence for the stated examples and API tests, not proofs of the general theorems.

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-HE-21.result.json` passes. The final submission additionally checks all three paths through `intake.py check-files`, verifies stage/area ownership, item IDs, route multiplicity and API/test notes, and compares the current main input blobs before publication. No Lean file is requested or supplied by this paper issue; no Lean compilation was run.

A complete job still requires resolving G1–G3, reviewing the prerequisite proof subtrees and any resulting scope corrections, then assigning each remaining missing item exactly one route. The handoff gives concrete starting points. Do not upgrade this checkpoint to complete solely because the structural validator passes.
