# PAPER-CHEN-24 — Nonabelian level structures, Nielsen equivalence, and Markoff triples

Claude Code — session `cc-7b31c4`; issue #1073; read on 22 September 2026.

The 96-page paper has been extracted into 115 items. Six are in the pinned libraries, nine are planned by existing layers
of the atlas, and the remaining 100 each have exactly one route: 3 become sources for `ClassicalArithmeticCompletion:CA.4`,
13 go to the pending **Arithmetic dynamics, Part II: Markoff actions and strong approximation**, 4 to
`InverseGaloisAndArithmeticFundamentalGroups:IG.3` and `IG.5`, 11 to `AlgebraicModuliForArithmeticGeometry:R09.4`–`R09.6`,
2 to `AnabelianGeometryAndNonabelianChabauty:NC.0`, and 65 form a new roadmap, **Nonabelian level structures on elliptic
curves and congruences for Hurwitz components** (`NonabelianLevelStructures`). This is a paper inventory and routing
proposal, not a proof blueprint: the results quoted from Abramovich–Corti–Vistoli, Bertin–Romagny,
Bourgain–Gamburd–Sarnak, Macbeath, Nakamoto, Olsson, Vdovin and Meiri–Puder are recorded as items with their own
prerequisite entries and are not decomposed here.

## What the paper proves

Fix a finite group `G` and let `Adm(G)‾` be the stack of admissible `G`-covers of 1-generalized elliptic curves — stable
1-pointed curves of genus 1 — branched only above the origin. It is a smooth proper Deligne–Mumford stack of dimension 1,
its open substack `Adm⁰(G)` of smooth covers is an étale gerbe over the stack `M(G)` of elliptic curves with
`G`-structures, and `M(G) → M(1)` is finite étale. So the components of `Adm(G)‾` are in bijection with the orbits of
`Out⁺(Π) ≅ SL₂(ℤ)` on `Epi^ext(Π,G)`, the Nielsen equivalence classes of generating pairs of `G`, where `Π` is free of
rank 2.

* **The main congruence (Theorems 1.3.1, 3.5.1).** For a component `X ⊂ Adm(G)‾` classifying covers of ramification
  index `e` above the origin, `deg(X → M(1)‾) ≡ 0 mod 12e/gcd(12e, m_X d_X)`. The idea, due to de Jong, is that on the
  universal family `σ_O*ω_{E/X} ≅ (σ*ω_{C/X})^{⊗e}`, so the pullback of the Hodge bundle is an `e`-th tensor power and
  `deg f · deg λ = e · deg(σ*ω)`; since `deg λ = 1/24` and degrees on a stack are rational with controlled denominators,
  `deg f` must be divisible by `e` up to the two obstructions `d_X` (the universal cover need not admit a ramified
  section) and `m_X` (local characters of a line bundle on a stack).
* **The cusps (Theorems 4.8.4, 4.10.3, 4.10.5).** The boundary of `Adm(G)‾` is described by normalising a cuspidal cover
  of the nodal cubic to a `G`-cover of `P¹` branched over `{0,1,∞}` together with a `G`-equivariant gluing bijection of
  the two fibres over the node. Galois theory with tangential base points turns this into pairs `(F,α)` of a `(Π,G)`-set
  and a bijection, and the isomorphism classes are labelled by the **δ-invariant** in `I(G) := G\(G×G)/ℤ`, that is by
  conjugacy classes of generating pairs up to `(u,h) ↦ (u,u^k h)`. The automorphism group of the cusp `[[u,h]]` is
  `A_{G,u,h}`, an extension of a cyclic group by `Z(G)`, which converts `m_X` into a group-theoretic quantity and yields
  the combinatorial congruence `deg ≡ 0 mod |c|/gcd(|c|, m′_c d′_c)`.
* **Congruences from the group (Theorem 1.1.1, Corollary 4.12.5).** With `r = ord_ℓ(|c|)` and `ord_ℓ(|G|) = r+s`,
  `deg ≡ 0 mod ℓ^{⌈(r−3s−j)/2⌉}`, and for nonabelian simple `G` not isomorphic to any `PSL₂(F_q)` with
  `ℓ^{r+1} ≥ |G|^{1/3}`, `deg ≡ 0 mod ℓ^{⌈r/2⌉}`, using Vdovin's bound on abelian subgroups of simple groups.
* **Markoff triples (Theorems 1.2.5, 1.2.6).** For `G = SL₂(F_p)` the `SL₂` character variety of `Π` is `A³` in trace
  coordinates, the fibre of trace invariant `−2` is the Markoff surface `x²+y²+z²−xyz = 0`, and `Aut(Π)` acts through the
  Markoff group `Γ`. A commutator of trace `−2` has order `2p`, so the congruence gives that **every `Γ`-orbit on
  `X*(p)` has cardinality divisible by `p`**. Since Bourgain, Gamburd and Sarnak proved that the complement of the
  largest orbit has size at most `p^ε`, no second orbit can exist for large `p`: their exceptional set `E_bgs` is finite
  and explicitly bounded, and the Markoff equation satisfies strong approximation at every `p ∉ E_bgs`.
* **The curves `M_p` (Theorems 5.6.3, 5.6.4, 5.6.6).** Working with the explicit `Γ`-action, the degree, the ramification
  above `j = 0` and `j = 1728` and the cusps of `M_p = M(SL₂(F_p))^{abs}_{−2}` are computed, giving
  `genus(M_p‾) = p²/12 − ((p−1)/4)Φ(p−1) − ((p+1)/4)Φ(p+1) + ε(p)`, genus `≥ 2` for `p ≥ 13`, and by Faltings only
  finitely many elliptic curves over a number field with an `SL₂(F_p)`-structure of ramification index `2p`. With
  Meiri–Puder, for a density-one set of primes these curves are noncongruence.

## The source actually read

`arXiv:2011.12940v2`, posted 19 June 2021, 96 pages, SHA-256
`f60283b0b406554c064e3135b18d4446617aed05eb74f7b8d7b66a2f453980cc`, downloaded from
<https://arxiv.org/pdf/2011.12940v2> on 22 September 2026 and read completely: the introduction, §§2–5, the appendix and
the bibliography. The published article — *Annals of Mathematics* **199** (2024), no. 1,
[DOI 10.4007/annals.2024.199.1.5](https://doi.org/10.4007/annals.2024.199.1.5) — is paywalled and was not consulted, so
every locator names a section, theorem or equation number together with the page of the arXiv v2 PDF, and the two
findings below are recorded against that version. The author's comment on v2 reads "Changed title, rewrote introduction,
improved results and exposition"; no erratum is listed on the arXiv page, in Crossref or on the journal's volume page.

## Checks run on the paper's claims

The arithmetic of §5 is finite and was checked by exhaustive computation over `F_p` for `p = 5, 7, 11, 13, 17, 19, 23`,
using the explicit action of `R₃, τ₁₂, τ₂₃, γ₀, γ₁₇₂₈` and `rot₁` on `X*(p)`.

| Claim | Check |
| --- | --- |
| Proposition 5.3.3, `\|X*(p)\| = p(p+3)` or `p(p−3)` | 40, 28, 88, 208, 340, 304, 460 — all match |
| Theorem 5.5.4, every `Γ`-orbit has size divisible by `p` | holds in every case; in fact `Γ` is transitive for all seven primes, consistent with `E_bgs` containing no small prime |
| Proposition 5.3.5, the number of `rot₁`-orbits (the cusps) | 8, 5, 14, 26, 37, 34, 41 — all match the closed formula |
| Proposition 5.6.1(b), `\|f^{−1}(1728)\|` and the unramified points | 20, 15, 44, 104, 171, 152, 231 with 0, 2, 0, 0, 2, 0, 2 fixed points — matches all four cases and the `p ≡ 1, 7 mod 8` criterion |
| Proposition 5.6.1(a), `\|f^{−1}(0)\|` | 14, 10, 30, 70, 114, 102, 154 with exactly one `γ₀`-fixed point; the printed formula gives `37/3, 25/3, …`, never an integer — finding E1 |
| Theorem 5.6.3, the genus formula | Riemann–Hurwitz from the computed fibres gives 0, 0, 1, 5, 10, 9, 18, matching the closed formula exactly, so the formula and the claims "genus 0, 0, 1 at `p = 5, 7, 11`" and "genus `≥ 2` for `p ≥ 13`" are correct |
| Proposition 5.2.5, the action on trace coordinates | `tr(A^{−1}B) = tr A · tr B − tr AB` gives `r ↦ R₃`, `s ↦ τ₁₂`, `t ↦ τ₂₃` as printed |

## What the libraries and the atlas already have

At Mathlib `082e2d3` and Tau Ceti `f790474`, six items are present: Galois categories with fibre functors, Galois
objects, prorepresentability and the `IsFundamentalGroup` predicate (`Mathlib/CategoryTheory/Galois/`); free groups;
Weierstrass curves with the `j`-invariant and the discriminant; `SL₂` over a commutative ring with trace and commutator,
together with Tau Ceti's congruence subgroups; Tau Ceti's permutation triples with their combinatorial Euler
characteristic and the classification of covering spaces by `π₁`-sets; and Euler's totient with the divisor sums. Nine
further items are planned but not built: prestable and stable pointed curves (Tau Ceti's Stable reduction roadmap,
layer 3), generalised elliptic curves and the moduli stack of elliptic curves (`ModularCurvesPartII:R13.1` and the
Katz–Mazur layer), algebraic and Deligne–Mumford stacks (`R09.4`), coarse spaces and the Keel–Mori theorem (`R09.5`),
étale local rings versus deformation rings (`R09.6`), tangential base points (`NC.0`), Hurwitz moduli with Nielsen
classes (`IG.5`), Riemann existence and branch cycles (`IG.3`), the Riemann–Hurwitz genus formula (Tau Ceti's Algebraic
curves, layer 7) and Faltings' theorem (`RP.4`). Everything else — 100 items — is missing from both the libraries and
the atlas. The audits agree: `R09.4`, `R09.5` and `NC.0` record that there are no stacks, no coarse spaces, no
Keel–Mori and no tangential base points anywhere in the baseline, and `IG.5` records that no Hurwitz space or Nielsen
class exists.

## The routes, and why each goes where it goes

**1. The Markoff carrier → `ClassicalArithmeticCompletion:CA.4` (3 items).** The accepted extractions of PAPER-MARTIN-25
and PAPER-GHOSH-SARNAK-22 already make `CA.4` the owner of the Markoff equation, the Vieta involutions and the group `Γ`.
Chen works in the trace-coordinate normalisation `x²+y²+z²−xyz = 0`, records the twist `(x,y,z) ↦ (3x,3y,3z)` that
identifies it with the coefficient-three equation over `ℤ[1/3]` and on integral points, and restates Markoff's theorem.
Routing these three items to `CA.4` keeps one carrier for all three papers.

**2. The Markoff-modulo-`p` endpoints → the pending Part II of Arithmetic dynamics (13 items).** Martin's accepted brief
for `ArithmeticDynamicsPartIIMarkoff` already says to use "Chen divisibility" to exclude every `Γ`-orbit outside a giant
orbit, and to synchronise future PAPER-CHEN-24 work on the same carrier. The items routed there are exactly those
endpoints: the Bourgain–Gamburd–Sarnak conjecture and their two theorems, the divisibility of every orbit by `p`, the
finiteness of `E_bgs`, strong approximation at `p` and modulo squarefree `n`, the size of `X*(p)` with the Frobenius
congruence conditions, the cusp count, and the congruences for the generalized equations. This is the same Part II and
the same design job, not a second one; the machinery that proves the divisibility is routed to the new roadmap below,
which that Part II imports.

**3. Nielsen equivalence and its conjectures → `IG.3`, `IG.5` (4 items).** `IG.5` plans Hurwitz moduli with braid and
Nielsen-class components. The vocabulary of exterior epimorphisms, Nielsen equivalence classes and `T_r`-systems, the
Wiegold–Garion transitivity conjecture, the McCullough–Wanderley `T`-classification conjecture and the paper's own
Question 1.4.1 are statements about `Out(F_r)`-orbits on generating tuples, independent of elliptic curves, and belong
there. The `(g,n) = (1,1)` Hurwitz theory itself does not: it is the new roadmap's subject.

**4. The general stack technology → `AlgebraicModuliForArithmeticGeometry:R09.4`–`R09.6` (11 items).** Smoothness of the
coarse scheme of a smooth proper 1-dimensional Deligne–Mumford stack; rigidification of a stack by a group of
automorphisms, with its gerbe and coarse-space properties; vertical automorphism groups and representability; categorical
quotients of curves by finite groups; relative differentials and dualizing sheaves for representable morphisms of stacks
and the canonical map between them; degrees of line bundles on 1-dimensional stacks with Olsson's local-character
criterion; and the appendix's local tools — Noetherian approximation, the eigenspace decomposition of a tame cyclic
action, the commutation of henselization with invariants, and normalized coordinates for tame balanced actions at smooth
points and at nodes. None of these mentions elliptic curves, and each is stated in the generality those layers plan.

**5. Tangential base points → `AnabelianGeometryAndNonabelianChabauty:NC.0` (2 items).** `NC.0`'s acceptance condition is
precisely the comparison of a rational and a tangential point on `P¹` minus three points. The two items routed there are
the specialization bijection `⟨γ_t⟩\Y_t ≅ Y_x` onto a ramified fibre, functorial in the cover, and the calculus of good
and symmetric paths `t₀ ⇝ t_∞` in the fundamental groupoid of `P¹ − {0,1,∞}`.

**6. Everything else → a new roadmap, `NonabelianLevelStructures` (65 items).** The atlas plans abelian level structures
on elliptic curves — `Γ(N)`, `Γ₁(N)`, `Γ₀(N)` — in the Tau Ceti roadmap Modular curves, following Katz–Mazur and in
Modular Curves PartII, and Hurwitz moduli in general at `IG.5`, but nothing plans the moduli of elliptic curves with
`G`-structures for nonabelian `G`, the stacks `Adm(G)‾` of admissible `G`-covers, their cusps and automorphism groups, or
the congruence on the degree of their components over the `j`-line. A Part II of Modular curves was considered and
rejected: the objects are covers classified by Nielsen classes rather than Katz–Mazur level structures, and the resulting
curves are generically noncongruence, the opposite of that roadmap's subject. A Part II of Inverse Galois theory was
rejected too: the material is moduli of elliptic curves rather than realization theory, and that roadmap's Part II
direction is already claimed by the accepted route of PAPER-ELLENBERG-VENKATESH-WESTERLAND-16 for Hurwitz homological
stability. The new roadmap therefore owns the `(g,n) = (1,1)` theory — admissible covers and their stacks, the Higman
invariant and the reduced ramification divisor, `G`-structures and `M(G)‾`, the dualizing-sheaf computation and the
degree congruence, the δ-invariant classification of cusps, the `SL₂` character variety and the `SL₂(F_q)` consequences,
the genus formula and noncongruence — and imports everything else from the layers named above.

## Prerequisite papers the atlas does not yet cover

Eighteen entries are listed. The load-bearing ones are Abramovich–Corti–Vistoli (the stacks of twisted and admissible
covers and the rigidification theorem), Abramovich–Vistoli (finiteness of the coarse map), Bertin–Romagny (the
deformation theory giving the ramification index at a cusp), Chen's own earlier paper on moduli interpretations for
noncongruence modular curves (`G`-structures and `M(G)`), Bourgain–Gamburd–Sarnak (the two estimates the main
application combines with), Meiri–Puder (composite moduli and the monodromy group), McCullough–Wanderley (the
`T`-classification conjecture and `q`-admissible classes), Macbeath (the subgroups of `SL₂(F_q)` and the surjectivity of
the trace map), Nakamoto (character varieties as geometric quotients), Vdovin (abelian subgroups of simple groups),
Olsson (local characters on tame stacks) and Edidin–Hassett–Kresch–Vistoli with Kresch–Vistoli (finite flat covers of
Deligne–Mumford stacks, without which degrees are undefined). Bourgain–Gamburd–Sarnak is listed again here; the accepted
extractions of PAPER-MARTIN-25 and PAPER-GHOSH-SARNAK-22 already list it, and the three papers share it through the
pending Part II of Arithmetic dynamics.

## Mistakes found in the source

Two findings are recorded, both in §5.6 and both against arXiv v2.

* **E1 (error).** Proposition 5.6.1(a) displays `|f^{−1}(0)| = (p(p±3)−3)/3`. That expression is never an integer:
  `deg f = |X*(p)| = p(p±3) ≡ p² ≡ 1 (mod 3)` for every prime `p ≠ 3`. The sentence preceding the display gives the
  correct count — one unramified point together with `(deg f − 1)/3` points of ramification index 3 — so the fibre has
  `(deg f + 2)/3` points. Direct computation of the `γ₀`-orbits confirms 14, 10, 30, 70, 114, 102, 154 for
  `p = 5, 7, 11, 13, 17, 19, 23`, with exactly one fixed point in each case.
* **E2 (misprint).** Proposition 5.6.1(b) writes `π^{−1}(1728)` for the fibre of the forgetful map `f : M_p → M(1)`;
  `π` denotes the universal admissible cover elsewhere in the paper. The displayed formula itself is correct in all four
  residue classes, as the computation above confirms.

Neither affects the paper's results: recomputing the genus by Riemann–Hurwitz from the corrected fibre counts reproduces
Theorem 5.6.3 exactly, so the genus formula, the values 0, 0, 1 at `p = 5, 7, 11` and the bound genus `≥ 2` for `p ≥ 13`
all stand. A formaliser working from Proposition 5.6.1(a) as printed would, however, be stopped at once, which is why it
is recorded.

## What this extraction does not claim

It does not claim that any proof has been decomposed. The stack-theoretic infrastructure of §§2–3 rests on
Abramovich–Corti–Vistoli, Abramovich–Vistoli and Bertin–Romagny, which are routed as prerequisites rather than planned
here; the main application rests on Bourgain–Gamburd–Sarnak's analytic estimates, which this paper quotes and does not
reprove. It does not claim that anything is formalised, and it marks nothing as present in the libraries without a
declaration read at the pinned commit; the Galois-category, free-group, Weierstrass-curve, `SL₂` and permutation-triple
citations were checked in the Mathlib and Tau Ceti trees at `082e2d3` and `f790474`. The Bourgain–Gamburd–Sarnak
conjecture itself remains open for the finitely many exceptional primes, Conjectures 1.1.3 and 1.1.4 and Question 1.4.1
are recorded as open, and the reading is of the authors' arXiv version: where the published text differs, the two
findings would have to be rechecked against it.
