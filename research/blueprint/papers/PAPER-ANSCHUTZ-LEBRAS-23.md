# PAPER-ANSCHUTZ-LEBRAS-23 — Prismatic Dieudonné theory

Claude Code — session `cc-7b31c4`; issue #1367; read on 22 September 2026.

Johannes Anschütz and Arthur-César Le Bras, *Prismatic Dieudonné theory*, Forum of Mathematics, Pi **11** (2023),
e2, `doi:10.1017/fmp.2022.22` (open access), with *Prismatic Dieudonné Theory – ERRATUM*, Forum of Mathematics, Pi
**13** (2025), e3, `doi:10.1017/fmp.2024.30`. Read in the authors' public version,
[arXiv:1907.10525v4](https://arxiv.org/abs/1907.10525v4) (11 October 2022, the last preprint version) — in its
**LaTeX source** (`prismatic_dieudonne_111022.tex`, 6397 lines, source archive sha256 `d1765c3c…`), since
`pdftotext` was unavailable here — together with the published text and the erratum on Cambridge Core.

**On numbering.** Reading the source gives the hypotheses exactly but no page numbers, so every locator is a
statement number. The preprint numbers statements by `section.subsection.counter`
(`\newtheorem{theorem}{Theorem}[subsection]`), the published version by a single counter per section. The two were
matched statement by statement in all six sections: the published number is the statement's position within its
section. Spot checks that fix the map — arXiv Definition 4.1.24 = published Definition 4.24, arXiv Theorem 4.6.10
= published Theorem 4.74, arXiv Theorem 4.8.1 = published Theorem 4.82, arXiv Theorem 4.9.5 = published Theorem
4.90, arXiv Definition 5.2.4 = published Definition 5.11, arXiv Proposition 5.3.5 = published Proposition 5.23 —
all agree with the cross-references printed inside the published proofs. **One statement differs between the two
versions**: arXiv Remark 5.1.7, on Cartier duality for finite locally free group schemes, has no counterpart in
print (§5 has 27 numbered statements in the preprint, 26 in the published version), so from arXiv Proposition
5.2.1 onwards the published number is the preprint's position minus one. The preprint's Section 6 is Appendix A in
print. Every locator below gives the preprint number with the published number in parentheses.

The paper has been extracted into **155 items**. Thirty-six are planned by existing layers of the atlas; the
remaining 119 are routed exactly once: **99 to a Part II** of *Prismatic cohomology: relative, absolute, Nygaard
and log variants*, and **20** as sources of six existing roadmaps. Nothing in this paper is in Mathlib or Tau Ceti
at the pinned commits: the libraries have Witt vectors with Frobenius, Verschiebung and Teichmüller lifts, the
tilt (`PreTilt`, `Perfection`), Fontaine's `θ` (`WittVector.fontaineTheta`), divided powers, henselian rings, the
cotangent complex of an extension and exterior algebras, but no δ-rings, no prisms, no perfectoid rings and no
p-divisible groups, so no item is `library`.

## What the paper proves

Let `R` be a **quasi-syntomic** ring: `p`-complete, with bounded `p^∞`-torsion, and with `L_{R/Z_p}` of
`p`-complete Tor-amplitude in `[−1,0]`. On the small quasi-syntomic site of `R` the pushforward of the prismatic
structure sheaf along the morphism of topoi `v` gives `O^pris`, with its Nygaard piece `N^{≥1}O^pris` and the
prism ideal `I^pris`. For a `p`-divisible group `G` over `R` set

```
M_Δ(G) = Ext^1_{(R)_qsyn}(G, O^pris),   φ_{M_Δ(G)} induced by the Frobenius of O^pris.
```

* **Theorem 1.13 (arXiv 1.4.1), proved as Theorem 4.71 (arXiv 4.6.7).** `(M_Δ(G), φ)` is an *admissible prismatic
  Dieudonné crystal*: a finite locally free `O^pris`-module whose linearized Frobenius has cokernel killed by
  `I^pris`, and for which the image of `M → M/I^pris·M` under `φ` is a finite locally free `O`-module `F_M` with
  `(O^pris/I^pris) ⊗_O F_M → M/I^pris M` injective. Its rank is the height of `G` and
  `M_Δ(G)/φ^{-1}(I^pris·M_Δ(G)) ≅ Lie(Ǧ)`.
* **Theorem 1.16 (arXiv 1.4.4), proved as Theorem 4.74 (arXiv 4.6.10).** `M_Δ : BT(R) → DM^adm(R)` is an
  antiequivalence.

The proof has four moving parts. *Descent*: admissible crystals form a stack for the quasi-syntomic topology and
quasi-regular semiperfectoid rings are a basis of it, so everything reduces to such an `R`, where a crystal is a
module over the initial prism `Δ_R`. *Linear algebra*: over a quasi-regular semiperfectoid ring, admissibility is
exactly a **window** structure over the Nygaard frame `Δ_{R,Nyg}` (Proposition 4.29, arXiv 4.1.29), which brings
in Lau's and Zink's frame-and-window machinery — normal decompositions, `u`-morphisms of frames, base change, and
the equivalences along surjections on whose kernel the divided Frobenius is topologically nilpotent. *Full
faithfulness* (Theorem 4.82, arXiv 4.8.1): the Tate module is recovered from the crystal as
`T_pǦ ≅ ker(φ/ξ̃ − 1 : N^{≥1}M_Δ(G) → M_Δ(G))`, using Bhatt–Lurie's computation of the Frobenius fixed points of
`N^{≥1}O^pris`; the referee and Akhil Mathew observed that the whole complex, not just the kernel, is computed
(Remark 4.85, arXiv 4.8.4). *Essential surjectivity* (Theorem 4.90, arXiv 4.9.5): deform down a tower of
surjections to a perfectoid ring, where the classification is Lau's and Scholze–Weinstein's theorem — which the
proof therefore consumes rather than reproves.

Everything rests on one computation: for `X` the `p`-completion of an abelian scheme,
`Ext^1_{(R)_Δ}(u^{-1}X, O_Δ) ≅ R^1f_{Δ,*}O_Δ` is finite locally free of rank `2 dim(X)` (Theorem 4.62, arXiv
4.5.6), proved from the degeneration of the conjugate spectral sequence and the exterior-algebra structure of
`H^*(X, Δ̄_{X/A})`. Raynaud's embedding of a finite locally free group scheme into an abelian scheme, Zariski-locally
on the base (Theorem 4.65, arXiv 4.6.1), transports this to all of `BT(R)`.

Section 5 adds four complements: the exact antiequivalence between finite locally free group schemes of `p`-power
order over a perfectoid ring and **torsion** prismatic Dieudonné modules (Theorem 5.4, arXiv 5.1.4) — Lau's
theorem without `p ≥ 3` and with an explicit formula, the result used by Česnavičius–Scholze; the **Breuil–Kisin
comparison** over a complete regular local ring with perfect residue field (Theorem 5.12, arXiv 5.2.5), together
with the identification of the prismatic functor with Kisin's `M^Kis` over `O_K` (Proposition 5.18, arXiv 5.2.11);
the functor to **Zink's displays** with an antiequivalence between formal `p`-divisible groups and `F`-nilpotent
displays (Proposition 5.23, arXiv 5.3.5) — the proposition whose proof the 2025 erratum retracts; and the **étale
comparison** recovering the generic-fibre Tate module (Proposition 5.25, arXiv 5.4.2).

## What the atlas already has

The reconnaissance is unusually favourable: the atlas plans the whole apparatus and none of the subject.

* `PrismaticCohomology` PR.0 constructs δ-rings, free δ-algebras, distinguished elements, orientations,
  boundedness, prismatic envelopes and the equivalence between perfect prisms and integral perfectoid rings, from
  Bhatt–Scholze §§2–3, with `(Z_p[[q−1]], ([p]_q))` among its acceptance examples. PR.1 constructs the relative
  site, the structure sheaves, and the Hodge–Tate and crystalline comparisons; PR.2 the derived theory by left Kan
  extension, the conjugate filtration and the quasi-regular semiperfectoid calculation including `Δ_R ≅ A_crys(R)`;
  PR.3 the Nygaard filtration, the divided Frobenius, the graded pieces and the Breuil–Kisin twists; PR.4 the
  étale comparison and the `p`-adic Tate twists; PR.5 the absolute site; PR.7 prismatic `F`-crystals over
  `Spf(O_K)` and their equivalence with crystalline lattices. That is §§2–3 of the paper and the ambient theory of
  §§4–5.
* `PerfectoidQuotients` Q0's integral-algebra prefix owns integral perfectoid rings, `A_inf` and `θ`; Q3 proves
  the lifting of quasi-syntomic covers to prisms (Bhatt–Scholze 7.11) and André's lemma (7.14).
* `DerivedDeRhamCohomology` DD.0 defines quasi-syntomic morphisms by the cotangent-complex condition and DD.5
  builds the quasi-syntomic site with its semiperfectoid covers.
* `CrystallineCohomology` CR.0 exports `A_crys` by its universal property, and CR.1 the crystalline site, crystals
  and `F`-crystals.
* `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 owns finite locally free group schemes, Cartier duality,
  `p`-divisible groups and their Tate modules; R07.2 classical Dieudonné theory over perfect residue fields;
  R07.4 Breuil–Kisin modules with the height bound and the dyadic case.
* `AInfCohomology` AI.2 owns Breuil–Kisin–Fargues modules; `AbelianSchemesAndArithmeticModuli` A1–A4 abelian
  schemes and their relative `H^1_dR`.

Searches of the layer descriptions return **no** occurrence of "Dieudonné crystal" in the prismatic sense, of
"display", or of "Barsotti–Tate" beyond R07.1's level structures. Nothing plans the morphism of topoi
`u : Shv((R)_Δ) → Shv((R)_QSYN)`, the sheaves `O^pris`, `N^{≥1}O^pris`, `I^pris`, admissibility, frames and
windows, or the functor `M_Δ`.

## The routes

### 1. Part II of *Prismatic cohomology: relative, absolute, Nygaard and log variants* — 99 items

`PrismaticCohomologyPartIIPrismaticDieudonneTheory`, area `cohomology`, titled *"Prismatic cohomology: relative,
absolute, Nygaard and log variants, Part II: prismatic Dieudonné theory"*. It takes everything specific to the
Dieudonné theory: the coefficient sheaves and the topos morphisms that produce them; prismatic Dieudonné crystals
and modules with admissibility, together with the earlier equivalent formulation by filtered crystals; frames,
windows and displays; the functor `M_Δ` with its comparisons to crystalline Dieudonné theory, to the classical
Dieudonné module over a perfect field and to the Scholze–Weinstein functor; the abelian-scheme computation and the
finiteness theorems; the two main theorems with their proofs; and all four complements of Section 5.

The brief is written as the design job's instructions in seven blocks, in the order the mathematics has to be
built, and names for each import the roadmap and the layer it comes from.

**The alternative parent.** The honest competitor is
`FiniteFlatGroupsAndIntegralPadicHodgeTheory`, whose R07.2 is literally "Dieudonné theory" and whose R07.4 is the
Breuil–Kisin classification that §5.2 recovers. The reason for choosing `PrismaticCohomology` is that every object
in the paper lives on a prismatic or quasi-syntomic site, the `p`-divisible group being an input rather than the
ambient subject, while R07 is organised around local fields and Galois representations; and that the paper is
already routed as a source of PR.0–PR.3, so keeping it in the same family avoids a roadmap that would import half
of another roadmap's later layers. A reviewer who prefers R07 as the parent should say so: the brief transfers
unchanged, with the imports reversed. This is flagged in the route's `reason`.

### 2. Source of *Prismatic cohomology* — PR.0, PR.1, PR.2, PR.3 — 15 items

Sections 2, 3 and 6 are a self-contained account of exactly what those layers plan, and prove several statements
in that range that Bhatt–Scholze do not: the regularity of `(p, φ^r(d))` and `(φ^r(d), φ^s(d))` in a transversal
prism; the explicit presentation of the prismatic envelope `A{x/d}^{∧(p,d)}` by elements `z_n` with
`φ^n(d)φ^{n−1}(d)^p⋯d^{p^n}z_n = x^{p^n}`; the example of a classically `(p,f)`-complete ring with unbounded
`p^∞`-torsion, which is why boundedness is a standing hypothesis; the extension of the crystalline comparison from
`p`-completely smooth to `p`-completely syntomic algebras and thence to all quasi-syntomic `F_p`-algebras; the
`p`-torsion-freeness of `H^0(S, Δ_{S/A})`; the identification of `Fil_1^conj Δ̄_{X/A}` with the cotangent complex
*over `Spf(A)`* and the resulting lifting criterion; the Künneth formula in both forms; and the two appendix
descent statements for finite projective modules. The route also names four statements the layers already plan
(all prisms agree for a quasi-regular semiperfectoid ring, `Δ_R ≅ A_crys(R)` with the Frobenius twist over
`W(R^♭)` made explicit, and the graded pieces of the Nygaard filtration), because the paper is an unusually
complete written source for them.

### 3. Source of *Perfectoid quotients* — Q0's integral-algebra prefix — 1 item

That a `p`-completely étale algebra over a perfectoid ring is perfectoid, and that the `p`-completion of the
henselization of a perfectoid ring along an ideal is perfectoid. The second is what lets a `p`-divisible group be
lifted along a henselian pair in §4.6, and it is not in the Bhatt–Scholze material Q0 imports.

### 4. Source of *Perfectoid rings and spaces* — P7 — 1 item

The existence of a *quasi-syntomic* perfectoid cover of a complete regular Noetherian local ring with perfect
residue field: Bhatt–Iyengar–Ma's cover, refined here by a cotangent-complex computation. P7 owns
Frobenius-controlled towers and their perfectoid completions, and the extraction of Česnavičius's purity paper
already proposes adding Cohen-structure regular finite-flat towers there. This is the input that makes the
Breuil–Kisin comparison possible, and it is a statement about perfectoid covers, not about Dieudonné theory.

### 5. Source of *Finite flat group schemes and integral p-adic Hodge theory* — R07.1 — 4 items

Raynaud's embedding theorem (the one about embedding into an abelian scheme, not the generic-fibre
full-faithfulness theorem R07.1 already plans); Illusie's criterion recognising a truncated Barsotti–Tate group of
level `n` by its coLie complex, with the dimension and height of the pieces; the lifting of a `p`-divisible group
along a henselian pair; and the statement that `p`-divisible groups and finite locally free group schemes over
`p`-complete rings with bounded `p^∞`-torsion are stacks for the `p`-completely faithfully flat topology.

### 6. Source of *Integral A_inf cohomology and Breuil–Kisin–Fargues structures* — AI.2 — 2 items

That admissible prismatic Dieudonné modules over a perfectoid ring are exactly the minuscule
Breuil–Kisin–Fargues modules — the dictionary by which Lau's and Scholze–Weinstein's classifications become the
perfectoid case of the main theorem — and that a minuscule BKF module over `O_C` is determined by the triple
`(T_M, M_crys, α_M)`. The second is the crystalline companion of Fargues' `B_dR^+`-lattice description that AI.2
already plans, and belongs beside it.

### 7. Source of *Abelian Schemes And Arithmetic Moduli* — A4 — 1 item

Berthelot–Breen–Messing 2.5.2: for an abelian scheme, `H^k(X, Ω^•)` and `H^i(X, Ω^j)` are finite locally free in
*every* degree and commute with base change, and `∧^*H^1(X, Ω^•) → H^*(X, Ω^•)` is an isomorphism of algebras.
A4 constructs the same package in degree one and says so explicitly; the exterior structure in all degrees is what
makes the prismatic Ext-sheaf of an abelian scheme finite locally free of rank `2 dim(X)`.

## Prerequisites the atlas does not cover

Eleven, listed with links in the result file. The load-bearing ones are Lau's *Dieudonné theory over semiperfect
rings and perfectoid rings* and Scholze–Weinstein's *Berkeley Lectures* (the perfectoid base case the proof
consumes); Bhatt–Lurie's *Absolute prismatic cohomology* (Theorem 7.5.6, the input to full faithfulness); Zink's
*The display of a formal p-divisible group* and Lau's *Displays and formal p-divisible groups* (displays, which
the atlas plans nowhere, and the two independent proofs on which the retracted Proposition 5.23 stands);
Berthelot–Breen–Messing II, Messing and Illusie (crystalline Dieudonné theory, universal vector extensions, the
coLie criterion, Raynaud's embedding); Cais–Lau and Lau's *Divided Dieudonné crystals* (frames and windows); and
Bhatt–Iyengar–Ma. Bhatt–Scholze's prisms paper, both Bhatt–Morrow–Scholze papers and Clausen–Mathew–Morrow are
already in the queue and are not repeated here; Kisin's *Crystalline representations and F-crystals*, Kim and Liu
are covered by R07.4, which names the dyadic case explicitly.

## Mistakes found in the source

Five, recorded under `sourceIssues`. Four are misprints new as far as I can tell, all with `affects: nothing`;
the fifth is the published erratum.

1. **E1 — Theorem 4.90 (arXiv 4.9.5) says "crystals" where it means "modules."** `R` is quasi-regular
   semiperfectoid and the displayed functor is the non-calligraphic `M_Δ(−)`, whose target Definition 4.42 (arXiv
   4.2.8) fixes as prismatic Dieudonné *modules*. The paper deliberately writes `DM^adm(R)` for both categories
   (Definitions 4.8 and 4.19, arXiv 4.1.8 and 4.1.15), so the symbols are right and only the words are wrong. The
   proof settles it: "let `M ∈ DM^adm(R)`… a descent datum for expressing that it comes from an admissible
   prismatic Dieudonné **module** over `R` (namely, `M`)."
2. **E2 — the sentence before Definition 5.11 (arXiv 5.2.4) points at the wrong statement.** It reads "Recall the
   following definition, which already appeared in Proposition 4.26 before"; the definition of a Breuil–Kisin
   module appeared in **Definition 4.24** (arXiv 4.1.24). Proposition 4.26 is Cais–Lau's equivalence, which uses
   the definition without stating it. The LaTeX source confirms the slip: the reference is
   `\Cref{sec:abstr-divid-prism-remark-cais-lau-principal}`, the label of Proposition 4.1.26, while the label of
   the definition itself is attached to *both* copies and is never referred to.
3. **E3 — an exponent in Example A.4 (arXiv 6.0.4).** With the relations `p x_{i,j} = f x_{i,j+1}`, the printed
   chain `p^i x_{i,0} = p^i f x_{i,1} = … = f^i x_{i,i} ≠ 0` should read `p^i x_{i,0} = p^{i−1} f x_{i,1} = …`:
   each substitution trades one `p` for one `f`, so the total degree is `i` throughout. As printed the second
   term has degree `i+1` and is in fact `f^{i+1}x_{i,i+1} = 0`, contradicting the assertion that the chain is
   non-zero. The following sentence is correct.
4. **E4 — a stray "is" in Definitions 1.7 and 1.11 (arXiv 1.3.1 and 1.3.5):** "has its cokernel **is** killed by
   `I^pris`". The body versions, Definitions 4.5 and 4.15 (arXiv 4.1.5 and 4.1.10), read correctly.
5. **E5 — the erratum.** *Prismatic Dieudonné Theory – ERRATUM*, Forum of Mathematics, Pi **13** (2025), e3,
   `doi:10.1017/fmp.2024.30`, 7 February 2025, retracts the proof of **Proposition 5.23** (arXiv Proposition
   5.3.5), the antiequivalence between formal `p`-divisible groups and `F`-nilpotent displays. Its key step is
   that for a quasi-regular semiperfect `R` the divided Frobenius acts topologically nilpotently on
   `ker(A_crys(R) → W(R))`; Andrew Senger's counterexample is `R = F_p[x^{1/p^∞}]/x` with the element
   `Σ_{k ∈ Z} p^k [x^{1/p^k}]`, which is fixed by the divided Frobenius and lies in that kernel. The diagnosis in
   the erratum: the generators used "do topologically generate the kernel in the `p`-adic topology of
   `A_crys(R)`, [but] they fail to do so in the `p`-adic topology of the kernel itself." The statement stands —
   it is Lau's and Zink's theorem, cited immediately before it — and the erratum records that "the arguments of
   this fallacious proof are not used anywhere else in the paper". I checked the two other topological-nilpotence
   lemmas, Lemma 4.88 (arXiv 4.9.3) for `ker(Δ_S → Δ_{S̃})` and Lemma 5.15 (arXiv 5.2.8) for the Breuil–Kisin
   prism: neither is retracted, and the erratum's sentence covers them. The Part II's brief instructs the design
   job to plan Proposition 5.23 from Zink's and Lau's proofs, not from the printed argument.

There is one further oddity that is not a mistake and is therefore not recorded as one: the label
`sec:comp-case-mathc-definition-breuil-kisin-module` is defined twice in the LaTeX source, on Definition 4.1.24
and on Definition 5.2.4. Nothing refers to it, so the duplication is harmless; it is the trace of the repeated
definition behind E2.

## Judgement calls a reviewer should check

* **The parent of the Part II** — `PrismaticCohomology` against
  `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, argued above and in the route's `reason`.
* **The two q-logarithm lemmas** (arXiv 2.2.2 and 2.2.3) are routed to the Part II because their only use in this
  paper is the computation of `M_Δ(μ_{p^∞})`. PR.6 plans the `q`-crystalline charts and would be a defensible
  owner; likewise the explicit trivialisation of the Breuil–Kisin twist by `ℓ_q` (arXiv 4.7.3), whose abstract
  counterpart is in PR.3.
* **Four small general lemmas** — finite projective modules over a henselian pair (arXiv 4.1.27), the fibrewise
  isomorphism criterion (4.5.3), the primitive elements of an exterior algebra (4.5.5), and the pair of
  topos-theoretic statements computing Ext-groups (4.4.1, 4.4.2) — are routed to the Part II rather than to a
  foundational roadmap, because this paper is their only use in the atlas so far. §15 would move them if a second
  consumer appears; each item's `note` says so.
* **Prismatic cohomology of an abelian scheme** (arXiv 4.5.8) is a statement about prismatic cohomology, not about
  Dieudonné theory, but it is proved from the Ext computation, so it is kept with the Part II. PR.1/PR.2 would be
  a defensible alternative.
* **arXiv Remark 5.1.7** is an item although it is absent from the published version. It states the compatibility
  of `M_Δ` with Cartier duality on finite locally free group schemes, the analogue of Berthelot–Breen–Messing
  5.2.7, and the design job should plan it; a reviewer who insists on the published text as the source of record
  may prefer to drop it, which would cost the roadmap a duality statement it plainly wants.

## Independent review (`REV-PAPER-ANSCHUTZ-LEBRAS-23`, issue #1368)

Claude Code, session `cc-fb70e5`, 23 September 2026. **Verdict: accept**, all seven routes accepted, all
five findings confirmed, nothing corrected in place. The full review is in
[`reviews/REV-PAPER-ANSCHUTZ-LEBRAS-23.md`](../reviews/REV-PAPER-ANSCHUTZ-LEBRAS-23.md).

The recorded e-print hash matches byte for byte (a single 6397-line `.tex`, exactly as recorded). **The
erratum was fetched and read**: Pi 13 (2025) e3 identifies the same step E5 quotes — topological nilpotence
of the divided Frobenius on `ker(A_crys(R) → W(R))` — calls it "not true", gives Senger's counterexample,
and states that the fallacious arguments are used nowhere else, so no result is affected. E5 records it in
its `known` field, which is what PROTOCOL §18 asks for.

Simulating the preprint's shared `[subsection]` counter gives **190 numbered statements** and reproduces
the number *and* the kind of every statement the findings cite. The 155 items cite 155 distinct statements;
of the 35 not cited, **19 are introduction copies of body statements the extraction does cover** (including
the two definitions E4 concerns), 14 are commentary remarks, one is a Question, and one is the verbatim
repeat of Definition 4.1.24 that E2 is about. No substantive gap.

A note on method: this paper uses **cleveref** for 290 of its 311 references, so the word is generated from
the target and the "cited as Theorem, printed as Proposition" class cannot arise — which is why E2's defect
is a wrong `\Cref` *target*, and why the fix is the label rather than the word. Two harmless blemishes are
recorded in the review rather than filed: one label is defined twice (nothing references it), and two
labels contain a space, which works but reads as an undefined reference to a naive scan.

All five findings are confirmed verbatim: the target category named "crystals" for the module-valued
functor (E1); the `\Cref` pointing at the Cais–Lau proposition instead of the definition recalled (E2); a
chain of equalities that applies `p x = f x'` without decrementing the power of `p` (E3); a stray "is" in
both introductory copies of the cokernel condition, correct in the body (E4); and the erratum's proof (E5).
