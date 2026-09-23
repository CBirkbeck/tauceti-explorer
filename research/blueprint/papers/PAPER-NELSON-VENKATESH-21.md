# PAPER-NELSON-VENKATESH-21: the orbit method and analysis of automorphic forms

Paul D. Nelson and Akshay Venkatesh, *The orbit method and analysis of automorphic forms*, [Acta Mathematica 226 (2021), no. 1, 1–209](https://doi.org/10.4310/ACTA.2021.v226.n1.a1); arXiv [1805.07750](https://arxiv.org/abs/1805.07750) (v3).

Extraction by Claude Code, session `cc-d67081`, 23 September 2026 (issue #2190). Status: **partial** — all twenty-five numbered theorems and the definitions they rest on are items, with the proofs unread; the remaining lemmas are listed in the handoff. Every missing item is routed exactly once.

**Source.** arXiv v3 (7 January 2021, 148 pages, SHA-256 `9bce49cb…22c03e`), the version accepted by Acta, read on 2026-09-23. The published text is paywalled and was not read; all locators are to v3. The paper numbers its theorems **1–25 consecutively**, independently of the section numbers, and this extraction follows that numbering.

## What the paper proves

**The main theorem (Theorem 25).** Let (G, H) be a Gan–Gross–Prasad pair over a number field — a form of (SO_n, SO_{n−1}) or (U_n, U_{n−1}) — with compact adelic quotients and G quasi-split, let Π be a fixed automorphic representation of G satisfying the conditions of §25.7, and let F_h be the family of automorphic representations Σ of H that are locally distinguished by Π, whose Satake parameters at a distinguished archimedean place lie in the rescaling h^{-1}Ω of a fixed compact set, and which have fixed level elsewhere in R. Then

> (1/|F_h|) Σ_{Σ ∈ F_h} L(Π, Σ) = 1/τ(G) + o_{h→0}(1),

where L(Π, Σ) is the automorphic branching coefficient. Under the paper's hypotheses τ(G) = τ(H) = 2, which is the limit 1/2 of the informal statement (1.2). Assuming the Ichino–Ikeda and N. Harris conjectures — or restricting to the unitary cases where W. Zhang has proved them — this becomes an asymptotic for averages of central Rankin–Selberg L-values, and §1.2 checks it against the Katz–Sarnak heuristic: the family is orthogonal with positive root numbers, whose global factor lim_N ∫_{SO(2N)} det(1 − x) = 2 matches (1.3). Since |F_h| is roughly the fourth power of the analytic conductor (§31.4), shrinking the family gives the weakly subconvex bound L(Π, Σ) = o(cond(Π × Σ)^{1/4}).

**The method** is a quantitative orbit method: a microlocal calculus for representations of reductive Lie groups.

- **Parts I–II (Theorems 1–9).** Symbols on the dual g^∧ of the Lie algebra are quantized to operators Op_h(a) on a tempered irreducible unitary representation π. Composition is governed by a star product with a full asymptotic expansion (Theorems 1, 3, 6, 7), Op maps symbol classes into operator classes (Theorem 2), and — the engine of the paper — traces are computed by integration over rescaled coadjoint multiorbits: tr(Op_h(a)) = h^{−d}(∫_{hO_π} a dω + O(h)), a quantitative form of the Kirillov character formula (Theorems 4, 5, 9). Theorem 8 identifies the topology on regular coadjoint multiorbits.
- **Part III (Theorems 10–16).** The invariant theory of a GGP pair: an element of g is H-stable exactly when its eigenvalue multiset is disjoint from that of its H-component (Theorem 10), the stable locus is a principal H-bundle over the space of stable pairs of invariants (Theorems 11, 13), the volume forms match up (Theorems 12, 14), and — the main local output, singled out in the introduction — relative characters admit uniform asymptotic expansions H_σ(Op_h(a)) = Σ_j h^j ∫_{hO_{π,σ}} D_j a + O(h^{(1−2δ)J}) away from the conductor-dropping locus (Theorems 15, 16). This gives a robust supply of analytic test vectors for the Ichino–Ikeda matrix coefficient integrals.
- **Part IV (Theorems 17–18).** Inverse branching: symbols are produced whose quantizations reproduce a prescribed weight on the distinguished tempered spectrum, at the distinguished archimedean place (Theorem 17) and at auxiliary p-adic places (Theorem 18, where the difficulty is the non-tempered spectrum).
- **Part V (Theorems 19–25).** Limits of the resulting states on the automorphic quotient exist along a subsequence and are multiplicative (Theorem 19); they disintegrate over the orbit into measures [δ_ξ] invariant under the G-centralizer of ξ (Theorem 20) — a generalization of the microlocal lift of quantum unique ergodicity. Ratner's measure classification then forces invariance under the full archimedean component (Theorem 22) and hence equidistribution (Theorem 21), which the spectral expansion (Theorem 23) and the weighted asymptotics (Theorem 24) convert into Theorem 25.

**What is assumed.** The Ichino–Ikeda/Harris conjecture is used only to translate the result into L-values. Ratner's theorem is used as a black box and is the sole source of ineffectivity — the authors note that an effective version for this case would yield genuine subconvexity. The standing local hypotheses of §25.7, including compactness of the quotients and quasi-splitness of G, are essential: without quasi-splitness the relevant orbit is empty and the conclusion is vacuous.

## What the libraries already have

**The substrate, and nothing else.** One library item: Mathlib at 082e2d3 has the Schwartz space `SchwartzMap` of a normed space, the Fourier transform `VectorFourier.fourierIntegral` and Haar measure `MeasureTheory.Measure.IsHaarMeasure`, and Tau Ceti builds Hermite functions as Schwartz maps on top of them. These are exactly what the symbol classes and the operator assignment are defined on.

Neither library has coadjoint orbits or the coadjoint action, unitary representations of Lie groups, characters, tempered representations, the Plancherel formula or measure, any pseudodifferential or semiclassical calculus, star products, or automorphic forms as analytic objects. Searches for `coadjoint`, `UnitaryRepresentation`, `Plancherel` and `pseudodifferential` in the pinned declaration index return nothing.

## What the atlas already has

Almost nothing. A survey of every roadmap, stage and decomposition file, in six directions, found:

- **The orbit method and Kirillov theory: nothing.** "orbit method", "coadjoint", "geometric quantization" have no stage; "Kirillov" occurs twice in the whole atlas, both as a bibliography author. The character formulas that exist are the finite-dimensional Weyl and Kostant formulas in Tau Ceti's LieHighestWeight. Symplectic and moment-map geometry is absent, and Tau Ceti's AnalyticToricGeometry explicitly puts moment maps outside its scope.
- **Microlocal and pseudodifferential analysis: nothing.** "microlocal", "pseudodifferential", "star product", "deformation quantization", "Weyl quantization", "semiclassical", "wavefront set" and "Fourier integral operator" have zero hits atlas-wide. Tau Ceti's PDE roadmap reaches Calderón–Zygmund and De Giorgi–Nash–Moser but has no symbol calculus.
- **Harmonic analysis on reductive groups: the p-adic side only.** `SmoothRepresentationsOfLocalGroups:SR.3` plans matrix-coefficient criteria for temperedness and `SR.4` the Satake transform. But Tau Ceti's representation theory hub states outright that it contains "no infinite-dimensional unitary representations of noncompact groups, no Plancherel theory, no tempered spectrum", and "Plancherel" never appears in any stage description. "relative character" has no hits.
- **Gan–Gross–Prasad and Ichino–Ikeda: nothing.** "Gan–Gross–Prasad" appears once, as an *exclusion* in the `GrossZagierAndArithmeticHeights` scope; "Ichino" only as an author name; "subconvex", "random matrix" and "Katz–Sarnak" have no stage.
- **Homogeneous dynamics: one specification-only stage.** `GeometryOfNumbersAndQuadraticArithmetic:GN.4` schedules "ergodic/mixing, unipotent-flow and nondivergence proofs needed for Oppenheim/Duke-type arithmetic applications", but is marked specification-state and does not name Ratner. The one homogeneous-dynamics Part II already proposed, `GeometryOfNumbersPartIIToralJoinings`, is torus-action measure rigidity and explicitly treats the classification results as external inputs. "Ratner", "measure classification", "quantum unique ergodicity" and "microlocal lift" have zero hits.
- **Automorphic forms as analysis: nothing.** No Weyl law, no Plancherel equidistribution of Satake parameters, no analytic families.

Two items are planned: Ratner's theorem at `GeometryOfNumbersAndQuadraticArithmetic:GN.4`, and the Satake-parameter/L-function dictionary at `SmoothRepresentationsOfLocalGroups:SR.4` with `AutomorphicLFunctionsAndLocalFactors:AL.4`.

## Routes

**1. A new roadmap: `QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups` (33 items).** Title: "The orbit method in quantitative form: microlocal analysis on representations of reductive groups"; area `representations`.

It carries Theorems 1–24 and their definitions: the symbol classes and the operator assignment, the star product with its expansions, coadjoint multiorbits and the quantitative Kirillov formula, the invariant theory of GGP pairs of Lie algebras, relative characters and their asymptotics, inverse branching, and the limit states of Part V. The brief also asks for the Plancherel technicalities of Appendix A, which nothing in the atlas plans.

A Part II of Tau Ceti's LieGroups roadmap would be the nearest home for coadjoint orbits alone — there is a precedent, `LieGroupsPartIITwistedCharacterFormula` — but the calculus, the invariant theory and the inverse branching problem exceed what a Part II of it could carry, so the brief imports that roadmap instead. The brief also asks that the character-theoretic Part IIs already proposed for `SmoothRepresentationsOfLocalGroups` (`SmoothRepresentationsCharactersPartII`, `SmoothRepresentationsPartIIUnitaryDual`) supply the p-adic local input rather than being duplicated.

**2. `GanGrossPrasadConjecturesForClassicalGroups` (8 items).** The automorphic statements: the GGP pairs, the branching coefficient with its two-restrictions definition, the Ichino–Ikeda/Harris formula, Theorem 25 with the hypotheses of §25.7 and the family F_h, the informal form (1.2) and the weakly subconvex bound (1.4). The id, title, area and brief are those proposed by PAPER-JIANG-ZHANG-20 and extended by five further extractions; this route adds the analytic side and one global theorem to them.

## Prerequisites not yet covered

Ichino–Ikeda, N. Harris and W. Zhang for the L-value formula; Gross–Prasad for the branching problem and Gross for Δ_G; Ratner for the measure classification; Kirillov and Vogan for the orbit method and Rossmann for limit characters and orbits; Sun–Zhu for archimedean multiplicity one; Katz–Sarnak for the symmetry types and Soundararajan for weak subconvexity. Every DOI was resolved on Crossref.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-NELSON-VENKATESH-21.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the three files: 3 files, 0 problems.
- Lean: none.
- The library survey ran against the declaration index of the pinned commits, Mathlib 082e2d3 and Tau Ceti f790474; the declarations cited in the one library item were read there.
- The atlas was surveyed across all roadmaps, stages and decomposition files, and the existing extractions were grepped for the neighbouring proposals before the routes were chosen.
- No `sourceIssues` field: the proofs were not read. The internal consistency of the informal statement (1.2), Theorem 25 and the L-value form (31.5) was checked — the limit 1/2 is 1/τ(G) with τ(G) = 2, and the average 2 of (1.3) is τ(H) — and they agree.
