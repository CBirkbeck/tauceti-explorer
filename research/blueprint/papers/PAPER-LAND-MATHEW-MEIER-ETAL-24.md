# PAPER-LAND-MATHEW-MEIER-ETAL-24 — Purity in chromatically localized algebraic K-theory

Markus Land, Akhil Mathew, Lennart Meier and Georg Tamme, *Purity in chromatically localized algebraic
K-theory*, Journal of the American Mathematical Society **37** (2024), no. 4, doi
[10.1090/jams/1043](https://doi.org/10.1090/jams/1043); read in
[arXiv:2001.10425v5](https://arxiv.org/abs/2001.10425v5), the accepted version.

Issue #2186 · Claude Code · session `cc-7b31c4` · 2026-09-23 · **complete**.

117 items (0 library, 6 planned, 111 missing), four routes taking all 111 missing items exactly once, two
recorded source issues (E2 withdrawn), twenty-nine prerequisites. These are the figures after the red-team
fixes of 30 September 2026 (see "Fixes after the red team"); the extraction had 101 items (5 planned, 96
missing) and twenty-two prerequisites. No formalisation is claimed; no Lean file is part of this job.

## The source read

The paper was read in full in **arXiv:2001.10425v5** (18 December 2023). The abstract page records the
comment "v5: accepted version" and the related DOI `10.1090/jams/1043`; v5 is the latest of five versions
(v3 of November 2020 was an almost complete rewrite under the present title, v4 of March 2022 a new
introduction). Two files were used:

* the e-print archive of v5, sha256 `e7ab1af66d7bc548d8c989d4f8eda44b54ac959d9822fd38fbb8ad49bd025d7d`,
  whose two files are `Purity-in-K-theory.tex` (1595 lines) and `Purity-in-K-theory.bbl`;
* the compiled arXiv PDF of v5, sha256
  `9eabee34fd018d509b3cd831addefcf5fc6ea9f3a1a21e13e6f8cd58040baa2f`, 29 pages, read through the text of
  its content streams rather than through a lossy text layer.

**The published version was not obtained.** The Journal of the American Mathematical Society is paywalled:
the DOI resolves to `https://www.ams.org/jams/2024-37-04/S0894-0347-2024-01043-X/`, which returns HTTP
403, Crossref records no volume, issue or page range for the DOI, and the publication lists on the
authors' home pages link only to the arXiv version. The volume and issue are taken from the resolved AMS
URL; no page range is asserted here. The two findings below are recorded against arXiv v5, the accepted
version, and it is not known whether copy-editing removed them.

**Numbering check.** The class puts `thm`, `cor`, `lemma`, `prop`, `quest`, `dfn`, `Notation`, `example`,
`ex`, `rem`, `rems`, `recollection` and `warn` on one counter per section through
`\numberwithin{thm}{section}`, while the `introthm` and `introcor` environments of the introduction run on
a separate counter printed with `\Alph`. Re-deriving the numbering from the LaTeX gives **67 statements**,
of which 65 carry numbers (the two unnumbered ones are the Purity Theorem and the Redshift Theorem).
**All 65 were located at their predicted numbers in the v5 PDF**, so the numbering used in the locators is
the printed numbering.

**Mechanical audits.** One undefined cross-reference, recorded as E1 below; no duplicate `\label`; and no
cross-reference whose introducing word disagrees with the environment carrying the target label.

## What the paper does

For a ring spectrum `A` — an E₁-algebra in spectra — and `n ≥ 1`, the **Purity Theorem** says that

    A ⟶ L_{T(n−1) ⊕ T(n)} A

induces an equivalence on `T(n)`-local K-theory: the telescopically localized K-theory of `A` at height
`n` sees only the two adjacent chromatic layers `n−1` and `n` of `A`. It has two halves. The half proved
here is **Theorem A**: `A → L_{T(0)⊕⋯⊕T(n)}A` is an equivalence on `L_{T(n)}K(−)` for `n ≥ 1`, and
`A → L_{T(1)⊕⋯⊕T(n)}A` is one for `n ≥ 2`. The other half is Clausen–Mathew–Naumann–Noel's vanishing of
`L_{T(n)}K(L_{n−2}^{p,f}𝕊)` (Theorem 1.1); their proof uses Theorem A but not the Purity Theorem, so there
is no circularity, and §3 is careful to say so. Remark 3.9 reproduces their argument in full for the exact
vanishing used.

The proof of Theorem A runs in three steps.

1. **The highly connective case** (Proposition 3.1). Through the plus-construction description
   `Ω^∞τ_{≥1}K(A) ≃ BGL(A)⁺`, the Bousfield–Kuhn functor (Proposition 2.9: `Σ^∞Ω^∞` *detects*
   `T(i)`-local equivalences) and Bousfield's vanishing theorem for `v_i`-periodic homotopy
   (Proposition 2.11: `Σ^∞Ω^∞` *preserves* sufficiently connective `L_n^{p,f}`-equivalences), an
   `N`-connective `L_n^{p,f}`-equivalence of connective ring spectra induces one on K-theory.
2. **A truncating property** (Proposition 3.4). The Land–Tamme pullback theorem, applied to the
   square-zero extension `τ_{≤k}R → τ_{≤k−1}R`, upgrades this to: `L_{T(n)}K(−)` is truncating on
   `L_n^{p,f}`-acyclic ring spectra.
3. **The general case** (Theorem 3.8). The `S_•`-construction turns the vanishing into a statement about
   additive ∞-categories (Proposition 3.6), and the Thomason–Neeman localization sequence
   `𝒞_{>n} ⊗ Perf(A) → Perf(A) → Perf(L_n^{p,f}A)` (Lemma 3.7) reduces the nonconnective case to it.
   Mitchell's theorem `L_{T(i)}K(ℤ) = 0` for `i ≥ 2` starts the induction.

Ishan Levy's Proposition 3.12, included with his permission, gives a second proof of the key implication
through the stable envelope `Stab(𝒞)`, a fibre `𝒟` admitting a bounded `t`-structure, and Barwick's
theorem of the heart.

The consequences occupy §4. **Theorem B** is the redshift inequality `hgt(K(R)) ≤ hgt(R)+1` for an
E∞-ring, where the height is well defined by Hahn's theorem; with Yuan's and Burklund–Schlank–Yuan's
converse it becomes the **Redshift Theorem** `hgt(K(R)) = hgt(R)+1` for `hgt(R) ≥ 0`. Then: `K(K(n))`
vanishes `T(m)`-locally for `m ≠ 0, n, n+1`; `K(BP⟨n⟩) → K(E(n))` is a `T(i)`-equivalence for `i ≥ n+1`;
`L_{T(i)}K(τ_{≤n}𝕊) = 0` for `i ≥ 2`, which settles a conjecture of Antieau; `K(y(m))` and `K(z(m))`
vanish telescopically below height `m`. For `ko`-algebras and `tmf`-algebras, inverting the Bott element
or the discriminant is invisible to telescopic K-theory, and at the prime 2 one gets a `T(3)`-local
equivalence `K(tmf) ≃ K(TMF) ≃ K(E₂)^{hGL₂(𝔽₃)}`. At **height one**, `K(1)`-local K-theory is truncating
on `K(1)`-acyclic ring spectra and hence nilinvariant, homotopy invariant, and satisfies Milnor excision
and cdh-descent — recovering Bhatt–Clausen–Mathew's results for `Hℤ`-algebras by purely homotopy-theoretic
means. At **heights `n ≥ 2`**, `K`, the connective cover and `TC` agree telescopically (Corollary 4.30),
group-completion K-theory suffices in place of Waldhausen K-theory (Corollary 4.31), and the Farrell–Jones
assembly map for the family of cyclic subgroups is a `T(n)`-equivalence (Corollary 4.34).

Remark 3.11 shows the theorem is optimal: `A ↦ L_{T(n)}K(A)` factors through neither `L_{T(n)}` nor
`L_{T(n−1)}`, the second by the identification of stable K-theory with topological Hochschild homology.
Question 3.10 asks for the Morava K-theory analogue, which is open — and, since the telescope conjecture
is now known to be false above height one, is not formal.

## Routing

The decisive fact of the reconnaissance: **the atlas has no chromatic homotopy theory at all**. Searching
every layer description in `data/atlas.json` for `chromatic`, `Morava`, `Bousfield`, `telescop`,
`redshift`, `tmf`, `nilpotence theorem`, `ring spectr`, `Thom spectrum`, `elliptic cohomology` and
`stable ∞` returns nothing relevant, and scanning the routes of every paper extracted so far finds no
chromatic roadmap proposed anywhere. *(Corrected on 30 September 2026: that scan matched roadmap titles and
layer text only. PAPER-CLAUSEN-MATHEW-21, merged the day before this extraction, routes the chromatic basics
— its item /118, with the convention T(0) = Hℚ — and the consumers /150, /024 and /142 to
`MotivicEtaleKTheoryPartIISelmerAndEtaleKTheory`, a route its review rejected for want of a chromatic owner.
`ChromaticHomotopyTheory` is that owner for /118. Its brief now names Clausen–Mathew as a second source and
consumer and fixes one convention for T(0) and `L_n^f`.)* `StableHomotopyKTheory` is explicitly not the owner: its summary
says it is a Part II to `AlgebraicTopology` supplying group completion, the plus construction and concrete
spectra, and that it "is not a demand for all of stable homotopy theory before K₀ can be calculated".

| Route | Target | Items |
| --- | --- | --- |
| Part II | `GeneralAlgebraicKTheoryPartIITelescopicLocalization` — *General algebraic K-theory, Part II: telescopic localizations and the purity theorem* (`ktheory`), parent `GeneralAlgebraicKTheory` | 73 |
| new | `ChromaticHomotopyTheory` — *Chromatic homotopy theory: telescopes, Morava K-theories and finite localizations* (`topology`) | 34 |
| source | `RefinedTraceMethods` — RT.2, RT.3 | 3 |
| source | `KTheoryLowDegrees` — Z.1 (appended 30 September 2026; no review verdict yet) | 1 |

The table is the one after the red-team fixes. The extraction's third route, a source route to
`GeneralAlgebraicKTheory` K.4, K.6 and K.7 with 12 items, has been deleted, and its items are in the Part II.
The Part II had 57 items and the chromatic route 24.

**Why a Part II and not a new K-theory roadmap.** `GeneralAlgebraicKTheory` owns algebraic K-theory:
K.1–K.5 the Q- and S-constructions, the fundamental theorems and relative theory, K.6 the nonconnective
extension, K.7 Morita invariance, products, filtered colimits and the universal interfaces. Every theorem
here is a statement about that functor, so the work is in its direction — but none of its seven stages
mentions a Morava K-theory, a telescope, or any localization of K-theory at one. The nearest neighbours,
`RefinedTraceMethods` (RT.2, RT.3, RT.5: THH, TC, the cyclotomic trace, localizing motives) and
`MotivicEtaleKTheory` with its Part II on Selmer and étale K-theory, are about trace methods and étale
descent, not chromatic height. New layers in the parent's direction is exactly what a Part II is for.

**Why a separate chromatic roadmap.** The chromatic material — type `n` complexes and `v_n` self-maps,
Morava K-theories, telescopes, Bousfield classes, `L_n^f` and `L_n^{p,f}`, the Bousfield–Kuhn functor,
Hahn's theorem, Kuhn's blueshift, `ko`, `tmf`, Lubin–Tate theory and the Thom spectra `y(m)` — is general
and is used far beyond this paper. PROTOCOL §15 says such notions are planned once, in the roadmap that
owns them, so they go into their own roadmap and the Part II imports them rather than re-planning them.

**The ∞-categorical K-theory is the Part II's first layer** (corrected on 30 September 2026). The
extraction sent these twelve items as a source to `GeneralAlgebraicKTheory` K.4, K.6 and K.7: localizing
invariants on `Cat_∞^perf`, nonconnective K-theory of a small stable ∞-category, `Perf(A)` for a ring spectrum,
the ∞-categorical `S_•`-construction with `S_n(𝒞) ≃ Fun(Δ^{n−1},𝒞)`, the plus-construction description of
`τ_{≥1}K(A)`, group-completion K-theory with the additive Schwede–Shipley theorem, the stable envelope, the
theorem of the heart, the Thomason–Neeman localization theorem, the Land–Tamme pullback theorem with
truncating invariants, dévissage for stable ∞-categories, and Waldhausen A-theory. Those layers plan
classical Waldhausen, Bass and Schlichting K-theory and none of this, and both `GeneralAlgebraicKTheory`
blueprints were accepted without it. So the items are now the Part II's first layer, "K-theory of small
stable ∞-categories and localizing invariants". That layer imports only `EnhancedDerivedSheaves` E0/E5,
`StableHomotopyKTheory` H.3/H.5 and `GeneralAlgebraicKTheory` K.1–K.6, so that `RefinedTraceMethods` RT.3
(whose Land–Tamme excision item CLAUSEN-MATHEW-MORROW-21/074 has the same owner as /32) and RT.5 can import
it.

**The source routes** carry the trace-theoretic notions and one classical input. Into `RefinedTraceMethods`: the
Nikolaus–Scholze description of the Verdier quotient `Fun(BC_p,Perf(R))/Perf(R[C_p])` with
`End ≃ R^{tC_p}`, the Hesselholt–Nikolaus theorem on the cofibre of the `TC` assembly map for `C_p`, and
the identification of stable K-theory with `THH`. Into `KTheoryLowDegrees` Z.1: the nilpotent invariance of
`K₀` (item /103), which no layer plans and which lifting idempotents modulo a nilpotent ideal proves.

## Library and planned items

**No item is in the libraries.** At the pinned Mathlib commit the only relevant declaration is
`SSet.Quasicategory` with its horn-filling and inner-fibration lemmas; there are no spectra, no smash
product, no Bousfield localization, no Morava K-theory, and no algebraic K-theory of ring spectra. This is
consistent with WORKERS.md, which lists stable ∞-categories among the things not found.

Five items were planned by existing layers; after the red-team fixes six are, as below:

* **Conventions: spectra, ring spectra and modules** — `StableHomotopyKTheory:H.5:spectra` (a concrete
  model of spectra, suspension spectra, loops and shift, integer-graded stable homotopy groups, fibres and
  cofibres), `EnhancedDerivedSheaves:E5:abstract` (symmetric monoidal ∞-categories with their operadic
  algebras and modules, which is what an E_k-ring and `RMod(R)` are) and `EnhancedDerivedSheaves:E5:presentability`
  (Ind-completion and compact objects).
* **Quillen's computation of `K(𝔽_q)`** — `KTheoryFiniteLocalFields:L.1`, which plans exactly this
  calculation with the Brauer lifting and Adams-operation fibre of Quillen's proof. The form used here,
  `K(𝔽_p)^∧_p ≃ Hℤ_p`, is what it is read off from.
* **The Dundas–Goodwillie–McCarthy theorem and the cyclotomic trace** — `RefinedTraceMethods:RT.2`
  (THH with its circle action and cyclotomic structure, `TC`, `TC⁻`, `TP`) and `RefinedTraceMethods:RT.3`,
  which names the relative nilpotent comparison theorem as a target with its connective and p-completion
  hypotheses. Neither plans anything chromatic.
* **Negative K-groups of quotients by nilpotent ideals** (item /68, corrected on 30 September 2026) —
  `GeneralAlgebraicKTheory:K.6` (Bass's negative K-groups and the fundamental theorem with its Nil terms,
  from which the induction into negative degrees is routine). The extraction also cited K.3 and S.5 and
  called the whole item planned, but no layer plans its degree-zero case, the nilpotent invariance of `K₀`.
  That case is now the missing item /103, routed to `KTheoryLowDegrees` Z.1.
* **Complex topological K-theory `ku`, `KU` and `β ∈ π₂ku`** (item /102, split off item /82 on 30
  September 2026) — `RefinedTraceMethods:RT.4:topological`. The real half, `ko`, `KO` and `β ∈ π₈ko`, stays
  missing (item /82) on the chromatic route.
* **Weibel's homotopy K-theory** — `SchemeKTheoryOperations:S.5`, which plans homotopy invariance for
  regular noetherian schemes and says to define `KH` by the algebraic-singular construction where it is
  used. Milnor excision and cdh-descent for `KH` are *not* planned there and are carried by the missing
  Corollary 4.24 item instead.

## Source issues

Two findings, both misprints, both affecting nothing, both recorded against arXiv v5 because the published
version could not be obtained. E2 was withdrawn on 30 September 2026; E1 stands.

**E1 — an undefined cross-reference.** The paragraph introducing Corollary 4.31 ends "For another proof of
this result, cf. `??`." The label `remark:tstructure` is never defined; the only label containing
"tstructure" is `prop:tstructure` on **Proposition 3.12**, Ishan Levy's alternative proof, and the
intended target is unambiguous because Proposition 3.12's own proof points back at Corollary 4.31 ("this
fact is also proved as Corollary 4.31 below"). Only one of the two pointers resolves. This is not an
artefact of a text layer: the content stream of the v5 PDF prints the sentence literally with `??`. A
mechanical check of every `\ref`/`\Cref` in the source found this to be the only undefined one.

**E2 — withdrawn.** The extraction recorded that Corollary 4.34 opens "let `𝒪_𝒞(G)` be as in
Proposition 4.33", while Proposition 4.33 and the display of Corollary 4.34 write
`\mathcal{O}_{\mathscr{Cyc}}(G)`. That difference exists only in the LaTeX source. The preamble loads
`\usepackage[mathscr]{euscript}`, whose script letters are capitals only, so the lower-case "yc" typesets as
nothing. The v5 PDF therefore prints the same `𝒪_𝒞(G)` in Proposition 4.33 and throughout Corollary 4.34,
with the same subscript `𝒞` as the introduction before Corollary F. A difference no reader can see is not a
misprint, so E2's review block now reads "rejected" (RT-PAPER-LAND-MATHEW-MEIER-ETAL-24/7), and items
/99–/101 write `𝒪_𝒞(G)` as printed.

Nothing else was found. Every numbered statement was read against its proof; the arguments of §3 and §4
that were checked in detail — the non-circularity of the Purity Theorem and Theorem 1.1, the induction of
Remark 3.9 including its base case and its use of Kuhn's blueshift, the `τ_{≥1}` in the proof of
Corollary 4.31 (which is what makes "generated under coproducts" sufficient there), and the height
bookkeeping in Corollary 4.21 — are correct as printed.

## Notes for the reviewer and for later blueprint work

* **Order of the two roadmaps.** The chromatic roadmap is logically prior: the Part II imports it wholesale
  and states nothing without it. If the two are planned by different workers, the chromatic one should go
  first, or at least fix the names `T(n)`, `L_n^{p,f}`, `hgt` and the Bousfield–Kuhn functor.
* **`K(n)` versus `T(n)` must never be blurred.** The telescope conjecture is false above height one
  (Burklund–Hahn–Levy–Schlank, 2023), so `K(n)`-acyclic and `T(n)`-acyclic are genuinely different
  conditions on a general spectrum. Lemma 2.3 is what licenses passing between them *for ring spectra*,
  and Question 3.10 is open precisely because of this.
* **`L_n^{p,f}` is not `L_n^f`.** They differ at the bottom of the tower (`T(0) = 𝕊[1/p]` against `Hℚ`)
  and agree on p-local spectra; the comparison is a lemma, not a convention.
* **The redshift restriction to `hgt(R) ≥ 0` is necessary.** `hgt(K(𝔽_p^{tC_p})) = −1 ≠ hgt(𝔽_p^{tC_p})+1`.
* **Corollary 4.30 fails at height one.** `L_{K(1)}TC(ℤ[1/p]) = 0` while `L_{K(1)}TC(ℤ) ≠ 0` (Remark 4.28),
  so the height-one and height-at-least-two statements are genuinely different theorems.
* **The two Antieau–Barthel–Gepner / Rognes caveats** in Remark 4.13 should survive into the blueprint: the
  `BP⟨n⟩` localization sequence is *not* a fibre sequence after rationalization for `n ≥ 2`, and the
  `T(i)`-local statement proved here is strictly weaker than Rognes's question.
* **A later paper job on Clausen–Mathew–Naumann–Noel, *Descent and vanishing in chromatic algebraic
  K-theory via group actions*** would supply Theorem 1.1 itself; this extraction records it as an item and
  routes it to the Part II, with Remark 3.9's summary of the argument as a separate item, so that the two
  can be reconciled without duplication when that paper is read.

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-LAND-MATHEW-MEIER-ETAL-24.result.json` and
`python3 research/blueprint/intake.py check-files` both pass. The routing was validated by a script that
checks every planned layer id against `data/atlas.json`, every source roadmap for origin and stage
ownership, the Part II title against its parent's title, the areas against `data/galaxies.json`, and that
every missing item is taken by exactly one route and every non-missing item by none. The job is complete,
so no handoff note is written; only the two named deliverables change. No Lean deliverable is part of a
paper job.

## Independent review (`REV-PAPER-LAND-MATHEW-MEIER-ETAL-24`, issue #2187)

Claude Code, session `cc-fb70e5`, 23 September 2026. **Verdict: accept**, all four routes accepted, nothing
corrected in place. The full review is in
[`reviews/REV-PAPER-LAND-MATHEW-MEIER-ETAL-24.md`](../reviews/REV-PAPER-LAND-MATHEW-MEIER-ETAL-24.md).

Both recorded source hashes matched byte for byte on re-download. Simulating the paper's counters
independently gives the same 65 numbered objects, and **every one of them appears in an item locator**,
with Theorems A–B and Corollaries C–F covered by name: no coverage gap. My mechanical audits reproduce
this extraction's exactly — 56 labels, no duplicates, exactly one undefined cross-reference (E1), no
introducing-word mismatch, one `??` in the PDF. Both findings are confirmed at the source, and a hunt for
further mistakes — every introduction statement against its body restatement, the §4.2 computations, the
external citations — turned up none. The five `planned` layers plan their items, and the absence of
`library` items is correct: neither Mathlib `082e2d3` nor Tau Ceti `f790474` has spectra at all. Route 2's
claim that the atlas owns no chromatic homotopy theory was re-checked against every layer description and
holds: the nine keyword matches are all arithmetic Lubin–Tate or telescoping sums.

*Corrected on 30 September 2026 by FIX-RT-PAPER-LAND-MATHEW-MEIER-ETAL-24.* Four statements in this
summary did not survive the red team RT-PAPER-LAND-MATHEW-MEIER-ETAL-24, whose findings
REV-RT-PAPER-LAND-MATHEW-MEIER-ETAL-24 confirmed:
- route 3's acceptance (finding /1): the route is deleted;
- "the five `planned` layers plan their items" (finding /6): item /68's degree-zero case is planned nowhere;
- E2's confirmation (finding /7): E2 is withdrawn;
- the search of other papers' routes (finding /3): it missed PAPER-CLAUSEN-MATHEW-21.

The review report carries a dated correction to the same effect.

## Fixes after the red team (30 September 2026)

FIX-RT-PAPER-LAND-MATHEW-MEIER-ETAL-24 (Claude Code, session `cc-f805bf`, issue #5022) applied the high and medium findings of the red team RT-PAPER-LAND-MATHEW-MEIER-ETAL-24, as REV-RT-PAPER-LAND-MATHEW-MEIER-ETAL-24 confirmed and adjusted them. [The fixes report](../redteam/RT-PAPER-LAND-MATHEW-MEIER-ETAL-24.fixes.md) gives the details.

- **/1, the ∞-categorical K-theory.** The source route to `GeneralAlgebraicKTheory` K.4, K.6 and K.7 is deleted. Its twelve items (/28, /29, /30, /32, /34, /40, /41, /43, /55, /56, /70, /76) form the Part II's new first layer, "K-theory of small stable ∞-categories and localizing invariants".
  - The first layer imports only E0/E5, H.3/H.5 and K.1–K.6, so RT.3 and RT.5 can import it.
  - The brief's "Import, never re-plan" now names what the parent does plan: K.2:plus with H.3, K.3's dévissage node, K.4, K.5, and K.6 with its Nil-terms node.
  - The notes of /28 and /32 name CLAUSEN-MATHEW-21/127–/130 and CLAUSEN-MATHEW-MORROW-21/074 as needing the same owner.
- **/2, Kuhn's theorem.** Item /48 and route 2's brief now state that L_{T(n)}(X^{tG}) = 0 for T(n)-local X, and give the blueshift form. The Tate construction itself need not vanish: (KU_p^∧)^{tC_p} has π₀ = ℚ_p(ζ_p).
- **/3, Clausen–Mathew.** Route 2's brief names PAPER-CLAUSEN-MATHEW-21 /118 as chromatic basics owned here, and /150, /024 and /142 as consumers.
  - The brief fixes one convention: T(0) = 𝕊[1/p], with Hℚ written explicitly, and item /24 as the comparison.
  - It adds L_1 = L_{KU} to the localizations.
  - The notes of /16 and /20 record Clausen–Mathew's convention.
- **/4, ko against ku.** Item /82 is now ko, KO and β ∈ π₈ko, still missing on route 2. The new item /102 (ku, KU, β ∈ π₂ku) is planned at `RefinedTraceMethods:RT.4:topological`. The brief no longer constructs complex K-theory.
- **/5, cited inputs without items.** Fourteen new items, /104–/117, carry the cited inputs (the other new items, /102 and /103, come from /4 and /6):
  - on route 1: Waldhausen's truncation theorems (/104), BGT Theorem 9.53 (/111), Weibel on NK (/112) and CMNN20's Galois descent (/116);
  - on route 2: the Bousfield–Kuhn functor (/105), Bousfield's vanishing theorem (/106), the generalized-homology Serre spectral sequence (/107), the nilpotence and thick subcategory theorems (/108, /109), centrality of v_n self-maps (/110), Ravenel's theorem (/113), K(n)- against T(n)-localization on L_n-local spectra (/114), TMF(3) and the K(2)-local Galois extension (/115), and the James splitting (/117);
  - Mahowald–Sadofsky appears in the notes of /17 and /21;
  - route 2's brief names the Goerss–Hopkins–Miller(–Lurie) existence theorems for E_n and 𝒪^top;
  - seven works join the prerequisites: CMNN20, Ravenel 1984, Hebestreit–Steimle, Patchkoria–Pstrągowski, Hesselholt–Nikolaus, Weibel 1981 and Mahowald–Ravenel–Shick.
- **/6, K₀ of nilpotent extensions.** Item /68 is split. The negative degrees stay planned at K.6. The K₀ case is the new item /103, on a new source route to `KTheoryLowDegrees` Z.1, which is appended as route 4 and has no review verdict yet.
- **/7, E2.** E2 is withdrawn, since the typeset paper prints one symbol, and items /99–/101 write 𝒪_𝒞(G).
- **/8, Tau Ceti prerequisites.** Route 2's prerequisites now include `tauceti:TauCetiRoadmap/AlgebraicTopology` (Stages 4, 5 and 8) and `tauceti:TauCetiRoadmap/ModularCurves` (7E, citing `WeierstrassCurve.formalAdd`). The brief plans here only the generalized-homology Serre spectral sequence and formal groups of arbitrary height. Postnikov towers stay here, and Eilenberg–MacLane spectra come from H.5:spectra.

The low findings (/9–/14) are recorded in the fixes report and were not applied.
