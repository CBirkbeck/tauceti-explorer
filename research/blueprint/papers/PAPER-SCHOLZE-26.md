# PAPER-SCHOLZE-26: Berkovich motives

Peter Scholze, *Berkovich motives*, [Journal of the American Mathematical Society 39 (2026), 697–764](https://doi.org/10.1090/jams/1068); arXiv [2412.03382](https://arxiv.org/abs/2412.03382).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1410). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-SCHOLZE-26.result.json](PAPER-SCHOLZE-26.result.json). It has:
- 64 items: 5 planned, 59 missing (after FIX-RT-PAPER-SCHOLZE-26; 55 items, 5 planned and 50 missing before);
- 9 routes: six sources of existing layers and three Part II routes (see the closing section);
- 12 prerequisite entries (two removed and two added by the fix);
- 3 recorded misprints.

## Sources read

- **arXiv v3** (22 January 2026), read in full: 65 pages. Page numbers below are v3's.
  - v2 (19 November 2025) and v3 are both marked "final version, to appear in Journal of the AMS".
  - The JAMS version (published electronically 11 December 2025) is paywalled and was not read.
- **Errata:** the JAMS issue page lists no erratum for this article, and Crossref records no update.
- **Misprints:** all three recorded misprints were checked on the page images and are in both v2 and v3.

## What the paper proves

**The construction.** Scholze builds étale motives on Berkovich spaces from scratch, uniformly in the archimedean and nonarchimedean settings.
- **The site.** The objects are Banach rings (seminormed, complete, possibly discrete or archimedean) with their Berkovich spectra M(A). A family is an **arc-cover** when finitely many members are jointly surjective on Berkovich spectra.
- **The key sheaf property (Theorem 4.1).** Strictly totally disconnected Banach rings form a basis on which the topology is subcanonical. On this basis, any functor commuting with finite products and filtered colimits is a hypercomplete arc-sheaf.
- **The categories.**
  - D^eff_mot(X) consists of the **finitary, ball-invariant** arc-sheaves.
  - Ḡ_m = G_m/(1 + O_{<1}) computes ℤ(1) ≅ Ḡ_m[−1].
  - D_mot(X) inverts ℤ(1).

**The main results.**
- **Cancellation over any base** (Theorem 1.9). Classically it holds only over fields.
- **K-theory** (Theorem 1.7). Rational motivic cohomology is the Adams eigenspaces of rational K-theory, 𝒦 ⊗ ℚ ≅ ⊕ ℚ(n)[2n]. There are explicit descriptions via cofib(K(A_{<1}) → K(A)), using almost mathematics, Suslin excision, Efimov's K-theory of dualizable categories and cdh descent.
- **Six functors and rigidity** (Theorem 1.12). There is a six-functor formalism on small arc-stacks in which smooth maps are cohomologically smooth. D_mot(X) is rigid for analytic X of finite cohomological dimension.
- **Comparison with Voevodsky** (Proposition 1.13). D_mot(k) is Voevodsky's category of étale motives for a discrete algebraically closed field k.
- **Nearby cycles** (Theorem 1.14). For C the completed algebraic closure of k((T)), motives over C are pairs (A, N) over k: N is a locally nilpotent monodromy, and the equivalence is given by motivic nearby cycles. The proof uses the motivic Galois stacks MG_k and MG_C.
- **Comparison with diamonds** (§12). Torsion motives are the overconvergent étale sheaves on v-stacks, which bridges to the companion work on the motivic geometrization of local Langlands.

## What the atlas already has

**No rigid-analytic motives.** The Binda–Kato–Vezzani extraction proposed `MotivesRigidAnalyticPartII` (rigid analytic and logarithmic motives, Ayoub's RigDA), but its review rejected that route (verdict revise), so nothing in the atlas plans rigid-analytic motives. Ayoub's RigDA, Vezzani's tilting and Binda–Gallauer–Vezzani's nearby cycles are prior work in the literature (corrected by FIX-RT-PAPER-SCHOLZE-26, RT-PAPER-SCHOLZE-26/1).

**Planned (5 items).**
- The Berkovich spectrum (TropicalAndBerkovichArithmetic TB.0).
- The Berkovich disc and its point types (TB.1).
- Adams operations (SchemeKTheoryOperations S.6).
- Quillen's rational K-theory of finite fields (KTheoryFiniteLocalFields L.1).
- Voevodsky's étale motives were listed here, but MC.4 and M.5a plan only the Nisnevich, with-transfers version; the fix routes item 49 to route 1 (RT-PAPER-SCHOLZE-26/3). de Jong's alterations are planned at AdicCoefficientsAndComparisons L5 (item 61, added by the fix).

**Library.** Mathlib has Gelfand–Mazur for normed ℝ-algebras (`NormedAlgebra.Real.nonempty_algEquiv_or`). This covers the core of Theorem 2.12, but not the Ostrowski step from |2| > 1.

**Not in the atlas.**
- The arc-topology on Banach rings. The proposed ArcTopologyAndDescent covers schemes only.
- Finitary sheaves, D^eff_mot and D_mot.
- The six-functor formalism on arc-stacks. Its abstract machinery is planned by the proposed AnalyticStacks AS.0–AS.1 (RT-PAPER-SCHOLZE-26/2).
- Efimov's K-theory of dualizable categories.

## Routes

1. **A Part II of MotivesAndAlgebraicCycles, `MotivesRigidAnalyticPartII`** (45 missing after the fix). It stands alone: the Binda–Kato–Vezzani route it once coalesced with was rejected (RT-PAPER-SCHOLZE-26/1).
   - **What it covers:** Berkovich motives:
     - the arc-topology and finitary sheaves (§§3–4);
     - effective motives, Ḡ_m and ℤ(1) (§5);
     - transfers, torsion and tilting (§6);
     - cancellation (§7);
     - the K-theory comparison (§8);
     - D_mot, six functors and tilting (§9);
     - rigidity and mixed Tate motives (§10);
     - D_mot(k) and nearby cycles (§11);
     - the v-stack comparison (§12).
   - **Also:** the étale-motive target DM_ét(k, ℤ) of Proposition 1.13 (item 49) and the inputs of Lemma 6.4 (items 62, 63).
   - **A gap, not a target:** the comparison with Ayoub's RigDA, which the paper does not prove and no roadmap plans.
2. **Source of TropicalAndBerkovichArithmetic [TB.0, TB.1]** (4 missing, 2 planned).
   - **Missing:**
     - Scholze's general seminormed and Banach rings and their colimits;
     - Gelfand–Mazur for Banach fields;
     - idempotents versus clopens, uniform rings and the Gelfand transform;
     - M of pushouts and filtered colimits.
   - **Planned:** the Berkovich spectrum and the disc.
3. **Source of GeneralAlgebraicKTheory [K.5]** (1 item): Suslin's excision for Tor-unital rings.
4. **Source of SchemeKTheoryOperations [S.3]** (1 item): Thomason–Trobaugh. The other K-theory inputs were split off by the fix to routes 7 and 8 (RT-PAPER-SCHOLZE-26/4).
5. **Source of RefinedTraceMethods [RT.5]** (1 item): Efimov's K-theory of dualizable categories.
6. **Source of EnhancedDerivedSheaves [E5:presentability, E5:abstract]** (2 items after the fix): a request for dualizable, compactly assembled and rigid categories without compact generation (item 60), and for Robalo's inversion, Verdier quotients, Barr–Beck–Lurie and descendable algebras (item 47) (RT-PAPER-SCHOLZE-26/5).
7. **Part II of GeneralAlgebraicKTheory, joining Land–Mathew–Meier–Tamme** (1 item): cdh descent for KH.
8. **Part II of SchemeKTheoryOperations** (3 items): pro-cdh descent, 𝔸¹-invariance over valuation rings, Gabber–Suslin rigidity.
9. **Source of EnhancedDerivedSheaves [E2]** (1 item): Postnikov completeness of replete hypercomplete ∞-topoi.

## Source issues (`sourceIssues` E1–E3, all misprints)

- **E1** (p. 14): "C⟨(T−a)^{pm1}⟩" should be C⟨(T−a)^{±1}⟩. It is a LaTeX slip.
- **E2** (p. 36, proof of Theorem 6.3; p. 37, Lemma 6.5 and its proof): "P¹_A" should be P¹_C, the projective line over the algebraically closed field C.
- **E3** (p. 16, Example 3.6): ∏^Ban K(x) is called totally disconnected. That needs A analytic (Definition 3.10, Proposition 3.11), which Example 3.4 can always arrange.

## Prerequisites not yet covered

Twelve entries after the fix, which removed Scholze's *Six-Functor Formalisms* with Heyer–Mann (planned by AnalyticStacks AS.0) and Bhatt–Mathew (extracted, with the accepted ArcTopologyAndDescent route) and added van der Put 1980 and Mondal–Reinecke 2025 (RT-PAPER-SCHOLZE-26/2, /6):
- *Étale cohomology of diamonds*;
- Ayoub–Gallauer–Vezzani;
- Vezzani 2017 and 2019;
- Binda–Gallauer–Vezzani;
- Voevodsky's *Cancellation theorem*;
- Efimov;
- Ramzi;
- Aoki;
- Suslin;
- Cisinski with Kerz–Strunk–Tamme;
- van der Put;
- Mondal–Reinecke.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-SCHOLZE-26.result.json` reports no errors.
- Every planned and route stage id exists in `data/atlas.json`.

## Review (REV-PAPER-SCHOLZE-26, 23 September 2026)

The independent review, by Claude Code (session `cc-7b31c4`, issue #1411), **accepted** this
extraction and all six routes, and needed no correction. The full record is
[REV-PAPER-SCHOLZE-26.md](../reviews/REV-PAPER-SCHOLZE-26.md).

The recorded hash of arXiv v3 reproduces. 55 items, all 50 missing ones routed exactly once; all
seven stage ids and five planned layer ids exist; 143 locator checks land exactly, the exceptions
being list parsing and E2's proof of Theorem 6.3, stated on p.35 and proved on p.36. Of the 167
numbered environments in the text, all but Remark 1.4 — a comparison with v-sheaves in the
introduction — are carried into items. The two planned items that appear in the TB.0/TB.1 source
route are allowed there by PROTOCOL §16, which lets a source route name planned items the paper is a
good source for. The Part II title reproduces the parent's atlas title exactly, the area is a galaxy
id, and the route opens no roadmap: it coalesces with `MotivesRigidAnalyticPartII` as proposed by
`PAPER-BINDA-KATO-VEZZANI-25`, with the same id, title, parent and area, which the review checked in
that file.

All three findings are **confirmed** at their locators: the unescaped `\pm` printed as `pm1` on
p.14, where the same ring is written with `±` one clause later; `P¹_A` for `P¹_C` in three places on
pp.36–37, where the ambient is `A¹_C` and no Banach ring `A` is in scope; and Example 3.6's claim
that `∏^Ban K(x)` is totally disconnected for any Banach ring, which fails for a discrete `A`
because Definition 3.10(i) requires analytic — repaired, as recorded, by the paper's own Example
3.4.

## Fixes (FIX-RT-PAPER-SCHOLZE-26, 30 September 2026)

Claude Code, session `cc-c2c06b`, issue #5005. This fix applies the high finding and six medium findings of
`RT-PAPER-SCHOLZE-26`, with the qualifications of its verifier (Codex, codex-J6LwjP). The full record is
`research/blueprint/redteam/RT-PAPER-SCHOLZE-26.fixes.md`. The sections above were corrected where they described the
coalescence, the routes and the prerequisites; the rest is as the extraction and review left it.

- **Route 1 stands alone (/1).** The Binda–Kato–Vezzani route it said it coalesced with was rejected, so the queue
  gave the design job (#3463) only this route.
  - The brief now plans Berkovich motives on their own, with Theorems 1.7, 1.9, 1.12, 1.14 and Proposition 1.13
    stated in full.
  - It says that BKV's proposal, once resubmitted, should coalesce into this roadmap.
  - It records the comparison with Ayoub's RigDA as a gap.
  - The title drops "and logarithmic".
  - The notes of items 17, 27, 44, 50 and 52 cite RigDA, Vezzani's tilting and BGV as prior literature, not as planned
    layers.
- **Six functors (/2).** Items 42 and 14 name the proposed AnalyticStacks AS.0 and AS.1 as suppliers; the arc-stack
  application stays missing. The Six-Functor Formalisms/Heyer–Mann and Bhatt–Mathew prerequisite entries are removed.
  The scheme arc-site is not identified with the Banach-ring one.
- **Étale motives (/3).** Item 49 is missing and owned by route 1. MC.4 and M.5a plan only the Nisnevich,
  with-transfers version.
- **K-theory (/4).** Item 37 keeps Thomason–Trobaugh (S.3), and the other inputs are split off:
  - cdh descent for KH (56) joins Land–Mathew–Meier–Tamme's GeneralAlgebraicKTheory Part II (route 7);
  - pro-cdh descent (57), 𝔸¹-invariance over valuation rings (58) and Gabber–Suslin rigidity (59) go to a new
    SchemeKTheoryOperations Part II (route 8).

  The cdh and pro-cdh arguments are alternatives, not both required.
- **Categories (/5).** Item 60 is the dualizable, compactly assembled and rigid theory without compact generation.
  Route 6 requests it and the rest of item 47 from E5, whose text assumes compact generation.
- **Cited inputs (/6).** Four items are added:
  - de Jong's alterations (61), planned at L5;
  - van der Put's compactification after shrinking (62);
  - the marked-point generalised Jacobian (63);
  - Mondal–Reinecke's Postnikov completeness (64), requested from E2 (route 9).
- **Proposition 5.17 (/7).** The characteristic-polynomial isomorphism in item 22 is for G_m, not Ḡ_m. Ḡ_m
  appears only after ball-localisation.
- **Result:** 64 items (5 planned, 59 missing), 9 routes, 12 prerequisites and 3 source issues.
