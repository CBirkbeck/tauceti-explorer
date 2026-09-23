# PAPER-SCHOLZE-26: Berkovich motives

Peter Scholze, *Berkovich motives*, [Journal of the American Mathematical Society 39 (2026), 697–764](https://doi.org/10.1090/jams/1068); arXiv [2412.03382](https://arxiv.org/abs/2412.03382).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1410). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-SCHOLZE-26.result.json](PAPER-SCHOLZE-26.result.json). It has:
- 55 items: 5 planned, 50 missing;
- 6 routes: five sources of existing layers and one coalesced Part II;
- 12 prerequisite entries;
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

**The pending Part II.** The Binda–Kato–Vezzani extraction proposed `MotivesRigidAnalyticPartII` (rigid analytic and logarithmic motives) as a Part II of MotivesAndAlgebraicCycles. It plans Ayoub's RigDA, the motivic Fontaine–Wintenberger equivalence, generation by good-reduction motives, and motivic nearby cycles and monodromy. This paper constructs the same objects differently and reproves those endpoints in its own setting.

**Planned (5 items).**
- The Berkovich spectrum (TropicalAndBerkovichArithmetic TB.0).
- The Berkovich disc and its point types (TB.1).
- Adams operations (SchemeKTheoryOperations S.6).
- Quillen's rational K-theory of finite fields (KTheoryFiniteLocalFields L.1).
- Voevodsky's étale motives (MotivesAndAlgebraicCycles MC.4, MotivicEtaleKTheory M.5a).

**Library.** Mathlib has Gelfand–Mazur for normed ℝ-algebras (`NormedAlgebra.Real.nonempty_algEquiv_or`). This covers the core of Theorem 2.12, but not the Ostrowski step from |2| > 1.

**Not in the atlas.**
- The arc-topology on Banach rings. The proposed ArcTopologyAndDescent covers schemes only.
- Finitary sheaves, D^eff_mot and D_mot.
- Six functors outside diamonds and étale sheaves.
- Efimov's K-theory of dualizable categories.

## Routes

1. **Coalesced with `MotivesRigidAnalyticPartII`** (42 missing). This is the pending Part II of MotivesAndAlgebraicCycles proposed by Binda–Kato–Vezzani; its id, title, parent, area and brief are kept.
   - **What it gains:** a Berkovich branch covering:
     - the arc-topology and finitary sheaves (§§3–4);
     - effective motives, Ḡ_m and ℤ(1) (§5);
     - transfers, torsion and tilting (§6);
     - cancellation (§7);
     - the K-theory comparison (§8);
     - D_mot, six functors and tilting (§9);
     - rigidity and mixed Tate motives (§10);
     - D_mot(k) and nearby cycles (§11);
     - the v-stack comparison (§12).
   - **A new target:** the brief asks for a separate comparison with Ayoub's RigDA, which the paper does not prove.
2. **Source of TropicalAndBerkovichArithmetic [TB.0, TB.1]** (4 missing, 2 planned).
   - **Missing:**
     - Scholze's general seminormed and Banach rings and their colimits;
     - Gelfand–Mazur for Banach fields;
     - idempotents versus clopens, uniform rings and the Gelfand transform;
     - M of pushouts and filtered colimits.
   - **Planned:** the Berkovich spectrum and the disc.
3. **Source of GeneralAlgebraicKTheory [K.5]** (1 item): Suslin's excision for Tor-unital rings.
4. **Source of SchemeKTheoryOperations [S.3, S.5]** (1 item): Thomason–Trobaugh, cdh and pro-cdh descent, and 𝔸¹-invariance over valuation rings.
5. **Source of RefinedTraceMethods [RT.5]** (1 item): Efimov's K-theory of dualizable categories.
6. **Source of EnhancedDerivedSheaves [E5:presentability]** (1 item): compactly assembled, dualizable and rigid categories, Robalo's inversion and symmetric monoidal Verdier quotients.

## Source issues (`sourceIssues` E1–E3, all misprints)

- **E1** (p. 14): "C⟨(T−a)^{pm1}⟩" should be C⟨(T−a)^{±1}⟩. It is a LaTeX slip.
- **E2** (p. 36, proof of Theorem 6.3; p. 37, Lemma 6.5 and its proof): "P¹_A" should be P¹_C, the projective line over the algebraically closed field C.
- **E3** (p. 16, Example 3.6): ∏^Ban K(x) is called totally disconnected. That needs A analytic (Definition 3.10, Proposition 3.11), which Example 3.4 can always arrange.

## Prerequisites not yet covered

Twelve entries:
- Scholze's *Six-Functor Formalisms* with Heyer–Mann;
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
- Bhatt–Mathew (already extracted as PAPER-BHATT-MATHEW-21).

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-SCHOLZE-26.result.json` reports no errors.
- Every planned and route stage id exists in `data/atlas.json`.
