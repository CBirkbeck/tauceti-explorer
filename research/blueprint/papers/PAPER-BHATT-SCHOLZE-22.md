# PAPER-BHATT-SCHOLZE-22 — Prisms and prismatic cohomology

Claude Code — session `cc-7b31c4`; issue #1103; read on 22 September 2026.

The 125-page paper has been extracted into 96 items. One is in the pinned libraries, **83 are planned by existing
layers of the atlas**, and the remaining 12 each have exactly one route: 5 become sources for
`PrismaticCohomology:PR.2`, 2 for `PerfectoidQuotients:Q2` and `Q4`, and 5 for `PerfectoidSpaces:P0` and `P3`. There is
no new roadmap and no Part II, and that is the main finding: the atlas already covers this paper almost completely. It
is a paper inventory and routing proposal, not a proof blueprint — the results quoted from Joyal, Borger, André,
Gabber–Ramero, Mathew, Clausen–Mathew–Morrow, Bhatt–Mathew and the authors' earlier work with Morrow are recorded as
items or prerequisites and are not decomposed here.

## What the paper proves

Fix a prime `p`. A **δ-ring** is a ring with a p-derivation δ, equivalently — when `p`-torsionfree — a lift
`φ(x) = x^p + pδ(x)` of the Frobenius. A **prism** is a pair `(A, I)` with `A` a δ-ring and `I` a Cartier divisor such
that `A` is derived `(p, I)`-complete and `p ∈ I + φ(I)A`; when `I = (d)` the condition says exactly that `δ(d)` is a
unit. Perfect prisms are the same thing as perfectoid rings, via `R ↦ (A_inf(R), ker θ)`, so a prism is a
"deperfection" of a perfectoid ring, and the four basic examples — `(ℤ_p, (p))`, `(A_inf, ker θ)`,
`(W(k)⟦u⟧, (E(u)))` and `(ℤ_p⟦q−1⟧, ([p]_q))` — name the four cohomology theories the paper unifies.

* **The comparison package (Theorem 1.8).** For a bounded prism `(A, I)` and a smooth `p`-adic formal scheme `X` over
  `A/I`, the prismatic site `(X/A)_∆` of prisms over `(A, I)` with a map `Spf(B/IB) → X` has cohomology
  `RΓ_∆(X/A)` with a `φ_A`-semilinear Frobenius, and: it recovers crystalline cohomology when `I = (p)`, after a
  Frobenius twist (Theorem 5.2); `H^i` of its reduction mod `I` is `Ω^i{−i}` (the **Hodge–Tate comparison**,
  Theorem 6.3), so `RΓ_∆(X/A)` is perfect for `X` proper; its Frobenius-twisted reduction is the de Rham complex
  (Theorem 6.4, Corollary 15.4); `(∆_{X/A}[1/d]/p^n)^{φ=1}` is the étale cohomology of the generic fibre
  (Theorem 9.1); it commutes with base change along maps of bounded prisms (Corollary 4.12); and `φ` becomes an
  isomorphism after inverting `I`, with explicit inverses `V_i` (Corollary 15.5).
* **Semiperfectoid rings (Theorems 1.12, 1.14).** A semiperfectoid ring `S` has an initial prism `∆^init_S`, hence a
  universal map to a perfectoid ring `S → S_perfd`, and that map is **surjective** — which shows that Zariski closed
  and strongly Zariski closed subsets of an affinoid perfectoid space agree, correcting a claim of the second author,
  and gives a good notion of almost mathematics with respect to *any* closed subset. When `S` is quasiregular
  semiperfectoid, `∆_S` is a ring, the Nygaard filtration `Fil^i_N ∆_S = {x : φ(x) ∈ d^i∆_S}` has graded pieces given
  by the conjugate filtration of `∆̄_S`, and `π₀TP(S; ℤ_p)` is the Nygaard completion of `∆_S` and so carries a δ-ring
  structure.
* **Three applications.** *Almost purity* (Theorem 1.17): every integral algebra over a perfectoid ring has a
  perfectoid perfectoidization, and a finite algebra that is finite étale outside `V(J)` becomes `J`-almost finite
  étale after perfectoidization. This contains the classical almost purity theorem (`J = (p)`) and improves André's
  perfectoid Abhyankar lemma, and the proof uses no adic spaces at all. *Cohomological dimension* (Theorem 11.1): the
  `F_p`-étale cohomological dimension of `Spec(R[1/p])` is at most 1 for `R` perfectoid. *K-theory* (Theorem 1.18): the
  syntomic complexes `ℤ_p(n)` are discrete and `p`-torsionfree, so mod-`p` K-theory is locally concentrated in even
  degrees; in particular `π_*K(O_C/p^n; ℤ_p)` is even.
* **q-deformations (§§16–18).** A `q`-analogue of divided powers — `γ(x) = φ(x)/[p]_q − δ(x)` — gives `q`-PD pairs, a
  `q`-crystalline site, and complexes `qΩ_{R/D}` which specialise to crystalline cohomology at `q = 1`, are computed by
  the `q`-de Rham complexes of a framing, and equal prismatic cohomology over the `q`-de Rham prism. This settles
  Scholze's conjecture that `qΩ_R` is independent of the coordinates, and identifies `AΩ_R ≅ qΩ_{R/A_inf} ≅ φ^*_A∆_{R/A_inf}`.
  Finally, prismatic cohomology has **no nontrivial endomorphisms** (Theorem 18.2), so all these comparisons are
  automatically compatible.

## The source actually read

`arXiv:1905.08229v4`, posted 12 January 2022, 125 pages, SHA-256
`1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a`, downloaded from
<https://arxiv.org/pdf/1905.08229v4> on 22 September 2026 and read completely: the introduction, §§2–18 and the
bibliography. The published article — *Annals of Mathematics* **196** (2022), no. 3,
[DOI 10.4007/annals.2022.196.3.5](https://doi.org/10.4007/annals.2022.196.3.5) — is paywalled and was not consulted,
so every locator names a section, theorem, lemma or equation number together with the page of the arXiv v4 PDF, and
the four findings below are recorded against that version. Version v1 is from 20 May 2019; the arXiv comment on v4
reads "v4: further updates". Neither the arXiv abstract page nor Crossref lists an erratum or corrigendum.

## Checks run on the paper's claims

The paper states no tables and runs no computations, so the checking was of its internal consistency, its small
algebraic identities and its cross-references.

* **The introduction against the body.** Each of the six parts of Theorem 1.8 was matched to its body statement —
  5.2, 6.3, 6.4, 9.1, 4.12 and 15.5 — and likewise Theorems 1.12, 1.14, 1.16, 1.17 and 1.18 to 7.2/7.3/7.4,
  12.2/13.1, 15.3, 10.9/10.11 and 14.1. This is how finding E1 was located: Corollary 15.4, which Theorem 1.8 (3)
  cites, has a stray `R` where its own hypothesis provides only `X`.
* **Distinguished elements.** `δ(p) = (φ(p) − p^p)/p = 1 − p^{p−1}`, a unit in `ℤ_p`, as printed in Example 2.20 (1);
  `[p]_q = (q^p − 1)/(q − 1) = 1 + q + … + q^{p−1} ≡ p mod (q−1)`, as used throughout §16; and
  `pδ(q−1) = (q^p − 1) − (q−1)^p = (q−1)([p]_q − (q−1)^{p−1})`, the identity in the proof of Corollary 16.8.
* **Lemma 12.6 (1).** The identity `[mp]_q! = u · φ([m]_q!) · [p]_q^m` with `u` a unit was verified by hand for
  `p = 2`: for `m = 1` it holds with `u = 1`, and for `m = 2` one gets `u = [3]_q`, which is a unit in `ℤ_p⟦q−1⟧`
  because `[3]_1 = 3` is a unit in `ℤ_2` — consistent with the general pattern that `[m]_q` is a unit when `p ∤ m`.
* **Remark 2.29.** The two examples showing that the hypotheses of Lemma 2.28 are incomparable check out:
  `ℤ_p[x]/(x^p − 1)` is reduced, since `x^p − 1` is separable, and has `φ(x−1) = 0`; `ℤ_p[x]/(x²)` is non-reduced and
  `φ(a + bx) = a + pbx` is injective, with `δ(x) = (px − x^p)/p = x` well defined.
* **Lemma 2.32.** `δ(x^{p^n}) ∈ p^nA` was checked in the first case: for `p = 2`,
  `δ(x²) = 2x²δ(x) + 2δ(x)² ∈ 2A`. (The statement reads `δ(x^p) ∈ p^nA` in a naive text extraction; the exponent on
  `x` is `p^n` and the printed statement is correct.)

Four misprints were found and are recorded in `sourceIssues`. One open point is worth flagging separately, since it is
not a mistake: in Lemma 7.7 (3) the authors prove only that `(∆_{R/A}, I∆_{R/A})` is *weakly* initial, a retract of the
initial object under an idempotent, and state as a conjecture that it is initial. Any blueprint built on that lemma has
to carry the retract, not the conjecture.

## What the libraries and the atlas already have

One item is in the pinned libraries: the p-typical Witt vectors with their Frobenius, Verschiebung and Teichmüller map
(`mathlib:WittVector`, `mathlib:WittVector.frobenius`, `mathlib:WittVector.verschiebung`,
`mathlib:WittVector.teichmuller`), which WORKERS.md already lists among the notions present. What is *not* in the
libraries — δ-rings, prisms, perfectoid rings, derived completion, the Koszul complex, the cotangent complex, animated
rings, divided power envelopes — is exactly the list WORKERS.md gives as "not found", and every one of those is planned.

Eighty-three items are planned, and the fit is unusually tight because the `PrismaticCohomology` roadmap names this
paper section by section:

| Layer | Named source | Items |
| --- | --- | --- |
| `PR.0` Delta-rings, prisms and envelopes | BS22 §§2–3, "including Lemma 3.9 and Theorem 3.10" | δ-rings and their stability, distinguished elements, perfect δ-rings, PD envelopes and δ-structures, prisms, rigidity, perfection, perfectoid = perfect prism, prismatic envelopes |
| `PR.1` Relative sites and the basic comparisons | BS22 §§4–6, "Theorems 5.2, 6.3, 6.4 and Corollary 4.12" | the prismatic site, ν to the étale site, Čech–Alexander complexes, the Hodge–Tate, crystalline and de Rham comparisons, base change |
| `PR.2` Derived extension, semiperfectoid inputs and descent | BS22 §§7–8 and BMS2 §4 | derived prismatic cohomology by left Kan extension, discreteness, the lci and quasiregular semiperfectoid calculations, perfected cohomology |
| `PR.3` Nygaard filtration, divided Frobenius and twists | BS22 §§12–15 | the Nygaard filtration, its graded pieces, the divided Frobenius, the `Lη_I` factorization, the `π₀TP` comparison |
| `PR.4` Étale comparison and p-adic Tate twists | BS22 §§9, 11, 14 | the étale comparison, `ℤ_p(n)` for perfectoid rings, cohomological dimension, the vanishing theorem |
| `PR.6` q-crystalline charts and the AΩ comparison | BS22 §§16–18 | q-PD pairs and envelopes, the q-crystalline site, q-de Rham complexes, `AΩ_R ≅ φ^*∆`, the uniqueness criterion |

`PerfectoidQuotients` Q0–Q4 reexport and extend the same material for the semiperfectoid half — Q3 plans André's
flatness lemma (Theorem 7.14) and Q4 plans Theorem 7.4 and Remark 7.5 by name — and the supporting theories are owned
elsewhere: PD envelopes and the crystalline site at `CrystallineCohomology:CR.0`–`CR.2`, the cotangent complex, derived
completion and the quasisyntomic site at `DerivedDeRhamCohomology:DD.0`, `DD.1`, `DD.5`, the décalage functor and
`AΩ` at `AInfCohomology:AI.1`, `AI.3`, `AI.7`, simplicial commutative algebra at `EnhancedDerivedSheaves:E5`, the trace
methods at `RefinedTraceMethods:RT.3`, the absolute site at `PrismaticCohomology:PR.5`, and adic generic fibres at the
Tau Ceti adic-spaces roadmap and `AdicEtaleGeometry:A1`.

## The routes, and why each goes where it goes

**1. Source for `PrismaticCohomology:PR.2` — 5 items.** The arc-topology on `p`-adic formal schemes (Definition 8.7),
the fact that perfectoids form a basis for it and that the structure sheaf is an arc-sheaf on that basis (Lemma 8.8,
Proposition 8.10), the formula `S_perfd = RΓ_arc(Spf S, O)` (Corollary 8.11), the excision pullback square and
monoidality of perfectoidization (Corollary 8.12, Proposition 8.13, Corollary 8.14), and Mathew's descendability as
used in Lemma 8.6. PR.2 names BS22 §8 among its sources and owns perfected prismatic cohomology, but it plans only the
comparison between the perfected and the non-perfect theory. A text search of every stage description in the atlas for
**"arc-topology"**, **"arc-descent"**, **"arc cover"** and **"descendability"** returns nothing; the pro-étale and
v-topologies of `DiamondsAndVStacks:D2` are topologies on diamonds and v-stacks, not on `p`-adic formal schemes, and
are not a substitute — arc-covers are tested against `p`-adically complete rank-one valuation rings, and the whole
point of §8 is that the structure sheaf fails to be an arc-sheaf on all formal schemes but succeeds on perfectoids.
A reviewer should note that the arc-topology has its own paper, already queued as `PAPER-BHATT-MATHEW-21` (batch 2);
if that extraction proposes a different home, this route should defer to it.

**2. Source for `PerfectoidQuotients:Q2`, `Q4` — 2 items.** Theorem 10.11, that `∆_{S/A,perf}` is discrete and
`S_perfd` perfectoid for *any* integral algebra over a perfectoid ring, and Lemma 10.12, the constructible
stratification of a finitely presented finite map into finite étale pieces up to universal homeomorphisms, along which
its proof inducts. Q2 constructs perfectoidization and Q4 proves its surjectivity, both for semiperfectoid quotients
only; the integral case is planned nowhere. These are statements about the perfectoidization functor, so they belong
with the perfectoidization layers rather than with the almost-purity ones.

**3. Source for `PerfectoidSpaces:P0`, `P3` — 5 items.** The almost setting attached to an arbitrary finitely
generated ideal `J` of a perfectoid ring, with `J_perfd = ker(R → (R/J)_perfd)` idempotent by Lemma 10.3 and the
`J`-almost zero objects identified with derived `p`-complete `(R/J)_perfd`-modules (Definition 10.1, Propositions 10.2
and 10.4); the connectivity criterion of Lemma 10.5; `J`-almost Galois extensions and their almost finiteness
(Definition 10.6, Proposition 10.8); the almost purity theorem for integral algebras (Theorem 10.9); and the
Hochster–Ma application of Remark 10.13. P0 builds almost ring theory for an abstract idempotent base ideal but says
that P1–P2 instantiate it only with the fractional powers of a pseudouniformizer; P3 proves almost purity only for
perfectoid Tate rings, by the Scholze and Kedlaya–Liu route, and insists that its proofs not depend on
diamondification — which is exactly what the proof here delivers, since it uses no adic spaces at all. So this is a
second instantiation of an existing framework plus a stronger theorem for an existing layer, not new territory.

## Prerequisite papers the atlas does not yet cover

Thirteen entries. Two of them are already in the maintainer's queue and are flagged as such: Bhatt–Mathew's *The
arc-topology* (`PAPER-BHATT-MATHEW-21`) and Clausen–Mathew–Morrow's *K-theory and topological cyclic homology of
henselian pairs* (`PAPER-CLAUSEN-MATHEW-MORROW-21`), the latter being what converts Theorem 14.1 into a statement
about K-theory. The genuinely uncovered inputs are Mathew's *The Galois group of a stable homotopy theory* for
descendability; André's two 2018 papers, whose Proposition 1.9.1 is quoted without proof as Proposition 10.8 and whose
perfectoid Abhyankar lemma Theorem 10.9 improves on; Gabber–Ramero's *Almost Ring Theory* for the basic setup and the
flatness hypothesis that `J_perfd` is checked to satisfy; Hochster–Ma for the commutative-algebra theorems reproved in
Remark 10.13; Lurie's *Spectral Algebraic Geometry* for the ∞-categorical foundations of §1.2; Joyal and Borger for
δ-rings and the Witt-vector adjunction, and Rezk for the `W₂`-description; Elkik for the algebraization results behind
"completely étale"; Scholze's *Canonical q-deformations in arithmetic geometry*, whose Conjecture 1.1 §16 resolves;
Bhatt–Lurie for the absolute prismatic site and the algebraic prismatic logarithm of Remark 9.5; and
Berthelot–Ogus and Fontaine–Messing for the crystalline background.

## Mistakes found in the source

Four misprints, none of which affects a proof.

* **E1** (Corollary 15.4, p. 104). The statement quantifies over a smooth formal `A/I`-scheme `X` but concludes
  `∆_{X/A} ⊗̂^L_{A,φ} A/I ≅ Ω^*_{R/(A/I)}`, with an `R` that is never introduced; it should be `Ω^*_{X/(A/I)}`, as in
  Theorem 6.4 on p. 53, of which this is the version without the hypothesis that `W(A/I)` be `p`-torsionfree. The
  likely origin is that the proof reduces to the affine case `R`.
* **E2** (Example 7.12, p. 61). "the natural map `A/ItoD/IC` factors over …": the arrow has been typeset as the italic
  product of `t` and `o`, so the source is missing a backslash in `\to`. The target should be `D/ID`; the example
  writes `D/IC` twice for that reduction, which is consistent with the rigidity of Lemma 3.5 but inconsistent with the
  notation `(D, ID)` introduced in the same sentence.
* **E3** (Remark 2.37, p. 24). "`ℤ_(p){x, φ(x)/p} ≃ D_{(x)}(ℤ_(p))`" should be `D_{(x)}(ℤ_(p){x})`; the divided power
  envelope of Lemma 2.36 is of the ideal `(x)` in the free δ-ring, and `x` is not an element of `ℤ_(p)`.
* **E4** (Theorem 1.8 (3), p. 4). "of commutative **algberas** in `D(A)`" — a transposition typo; the same sentence
  spells the word correctly one line later. Recorded only because PROTOCOL.md §18 asks that every mistake found be
  listed.

Each finding is recorded in `sourceIssues` with its quotation, correction, reason and the places checked for a
published correction: the arXiv abstract page and version history for 1905.08229, whose only v4 comment is "further
updates", and the Crossref record for DOI 10.4007/annals.2022.196.3.5.

## What this extraction does not claim

Nothing here is formalised, and nothing is claimed to be. Four boundaries are worth naming. First, "planned" means
that a named layer of the atlas states this material as a construction target, usually citing the very section of this
paper; it does not mean that any of it has been blueprinted, and the tightness of the fit here is a property of the
`PrismaticCohomology` roadmap's unusually explicit source register, not evidence that the work is done. Second, the
results quoted from other papers were checked against the statements given here, but their own proofs were not read,
which is why they appear under prerequisites. Third, the conjecture in Lemma 7.7 (3) is recorded as a conjecture, and
the item notes that only the weakly initial statement is proved. Fourth, the claim that only four misprints exist means
only that the checks listed above found only those.
