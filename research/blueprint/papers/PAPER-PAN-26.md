# PAPER-PAN-26 — Lue Pan, *On locally analytic vectors of the completed cohomology of modular curves II*

**Annals of Mathematics 203 (2026), no. 1, 121–281** — [doi:10.4007/annals.2026.203.1.3](https://doi.org/10.4007/annals.2026.203.1.3), 161 Annals pages.

Read in **arXiv:2209.06366v1**, 14 September 2022, 127 pages, SHA-256 `0873b61a758c57a9c5567f8e9ed7d905adcb7b359013a24e680facd1027b31b4`. **All locators are v1's labels and pages, not the Annals pagination** — see *Provenance* below.

Issue #2168, **Claude Code** `cc-fb70e5`, 23 September 2026, read in full and solo.

**Status: `complete`.** 273 items (267 missing, 6 planned), **10 routes** — one Part II, nine source routes — 18 prerequisites, **3 source issues**, 7 gaps. Every missing item has exactly one route and none is taken twice.

> **Provenance.** The paper is published, and the published text is what a blueprint will cite; but arXiv has only **v1, from September 2022**, and the published version is **161 Annals pages against v1's 127**, four years later. Annals is paywalled within five years, and [the author's page](https://sites.google.com/view/luepan/home) links paper II **only to the DOI** — no preprint, no accepted version, no erratum. So v1 is the best available text, its numbering is used throughout, and **the published numbering may differ**. Every source issue says so in its `searched` field, and it is recorded as a gap. The author's March 2026 survey [arXiv:2603.27937](https://arxiv.org/abs/2603.27937), which recapitulates this work for the 2025 ICBS proceedings, records no correction to it.

## What the paper proves

Emerton proved that a two-dimensional absolutely irreducible `ρ : G_Q → GL₂(E)` appearing in the completed cohomology `H̃¹(K^p, E)` and de Rham at `p` with Hodge–Tate weights `0, k > 0` comes from a cuspidal eigenform of weight `k+1`. This paper reproves it **geometrically, without the p-adic local Langlands correspondence at any point** (Theorem 1.1.2 = Theorem 7.1.2), and along the way describes `Π_ρ^{la}` explicitly.

The mechanism is to build **Fontaine's monodromy operator out of p-adic geometry**. Fontaine's classification of almost de Rham `B_dR`-representations attaches to a Hodge–Tate `V` of weights `0, k` an operator `N : W₀ → W_k(k)` vanishing exactly when `V` is de Rham. On the perfectoid modular curve `X_{K^p}`, the push-forward `O_{K^p}` along the Hodge–Tate period map `π_HT` has a locally analytic subsheaf which, by Paper I, is killed by the horizontal nilpotent subalgebra, hence splits by weight for the horizontal Cartan action `θ_h`. The paper constructs two differential operators on those weight sheaves —

- `d_{k+1}`, **along the modular curve**, the `O_Fℓ`-linear extension of the classical theta operator (Theorem 4.1.4);
- `d̄_{k+1}`, **along the flag variety**, which by Beilinson–Bernstein localisation is just `(u₊)^{k+1} ⊗ (dx)^{k+1}` (Theorem 4.2.7);

— and proves that their composite `I_k`, an intertwining operator, **is the Fontaine operator up to a scalar in `ℚ^×`** (Theorem 6.2.6 = Theorem 1.2.10). Classicality then becomes a statement about `ker I¹_k`, and that is computed stratum by stratum over the Newton stratification `Fℓ = P¹(ℚ_p) ⊔ Ω`:

- on **`Ω`**, the supersingular uniformization writes `π_HT^{-1}(Ω)` as a finite union of Lubin–Tate spaces at infinite level, and the **Lubin–Tate–Drinfeld duality exchanges the two differential operators** (Theorem 5.3.20), so `ker d^{k+1}_LT` consists of the sections smooth for the quaternion group — that is, of **quaternionic automorphic forms** (Proposition 5.4.12);
- on **`P¹(ℚ_p)`**, the fibres are perfect Igusa curves and the cokernel is governed by the **rigid cohomology of Igusa curves** (Propositions 5.1.8, 5.1.11).

The eigenvalues that survive are exactly those of classical eigenforms of weight `k+1` (Theorem 5.5.7 = Theorem 1.2.3), which is classicality. The same computation yields the **Breuil–Strauch conjecture** in the supercuspidal case (Theorem 7.3.2 = 1.1.7), the **Berger–Breuil–Emerton conjecture** in the principal series case (Theorem 7.3.7 = 1.1.10), a **uniform statement** covering both — `Π_ρ^{la} ⊗̂ C ≅ H¹(DR_{k−1})[λ]/Fil¹` (Remark 1.1.13, Remark 7.3.10) — and **finite-dimensionality of the `n`-invariants** of the analytic vectors (Theorem 1.1.14, obtained independently by Dospinescu–Paškūnas–Schraen).

## Routing — the maintainer's Part II, plus nine source routes

`papers.json` says this paper is **already routed**: "a Part II, `LocallyAnalyticCompletedCohomology` (DESIGN-PAN), of the completed-cohomology roadmap. **Do not re-route it**: read the paper in full and route its items into that roadmap's layers and to existing roadmaps as sources."

**That roadmap does not yet exist as a target one can name layers in.** It has no file in `research/blueprint/roadmaps/`, no entry in `data/atlas.json`, and `research/blueprint/prompts/` (which `queue.json` points at) is absent: `DESIGN-PAN` is still `"state": "pending"` in the old expansion queue. So its layers cannot be named, and route 1 carries the items to **the same roadmap id with the parent the maintainer chose** rather than inventing a target. `check_paper.py` accepts this because the id is not yet registered. **A reviewer should re-express route 1 as a source route naming that roadmap's layers once DESIGN-PAN has run.**

| # | route | roadmap | stages | items |
|---|---|---|---|---|
| 1 | `part-ii` | `LocallyAnalyticCompletedCohomology` (parent `CompletedCohomologyAndLocalGlobalCompatibility`) | — | 206 |
| 2 | `source` | `LocallyAnalyticDistributions` | L0, L1, L2 | 17 |
| 5 | `source` | `PadicHodgeTheory` | R06.1 | 16 |
| 4 | `source` | `EndoscopicTransferAndUnitaryTraceComparison` | ET.6a, ET.6 | 7 |
| 6 | `source` | `CohomologyComparisons` | CP.3, CP.0 | 7 |
| 3 | `source` | `PerfectoidShimuraVarieties` | S3, S5 | 4 |
| 7 | `source` | `PadicDifferentialEquationsAndRigidCohomology` | RD.4 | 3 |
| 8 | `source` | `GL2AutomorphicRepresentationsAndTransfer` | R17.3, R17.1, R16.3 | 3 |
| 9 | `source` | `SmoothRepresentationsOfLocalGroups` | SR.2 | 2 |
| 10 | `source` | `AlgebraicModularFormsAndSerreWeights` | R15.2, R15.5 | 2 |

The nine source routes take what is *not* specific to this paper, and each was matched against the text of the layer, not its title:

- **`LocallyAnalyticDistributions` L0–L2** takes all of §2. L0 builds Banach spaces of functions analytic on every residue ball with their Gauss norms; §2 is the next step — locally analytic vectors of representations on **Hausdorff LB-spaces**, the criterion (Prop. 2.1.5) that a Banach subspace of an LB-space lands in one step of a presentation, the compact-operator criteria making such colimits Hausdorff including a **Cartan–Serre lemma** (Lem. 2.2.5), and the proof that LA-acyclic and *strongly* LA-acyclic coincide (Prop. 2.3.6), which settles one of the four improvements to Paper I listed in 1.3.2.
- **`PadicHodgeTheory` R06.1** takes §6.1 and the introduction's 1.2.1: R06.1 builds `B_dR^+` with its filtration, and **no layer of the atlas plans Fontaine's almost de Rham theory**. The paper supplies it in the generality the application needs — Banach and then LB modules over `B_dR^+/(t^k)`, Fontaine's generalisation of Sen theory to them, kernels and cokernels of strict maps, the Fontaine operator, and the criterion that it vanishes iff the representation is de Rham.
- **`EndoscopicTransferAndUnitaryTraceComparison` ET.6a** ("Two-tower cohomological realization (mixed characteristic)", built from formal-module deformation spaces) takes the Lubin–Tate and Drinfeld towers, Gross–Hopkins, and the Scholze–Weinstein duality — plus the thing that layer does *not* contain: that the duality **exchanges the two differential operators**, so that `GL₂(ℚ_p)`- and `D_p^×`-local analyticity coincide.
- **`CohomologyComparisons` CP.3/CP.0** takes the relative structural de Rham sheaf `OB^+_dR`, the Poincaré lemma sequence and log Faltings extension, and the comparison of completed cohomology with period-sheaf cohomology — which the paper proves **using only the étale site** (Lemma 7.2.4).
- **`PerfectoidShimuraVarieties` S3/S5** takes the basis of affinoids with affinoid-perfectoid preimages, the **Hecke-equivariant correction to the relative Hodge–Tate sequence** (4.2.3: the subobject is `∧²D ⊗ ω^{-1}`, not `ω^{-1}`, and the implicit trivialisation of `∧²D` shifts the Hecke action by the adelic norm), and the uniformization at infinite level.
- **`RD.4`**, **`R17.x`/`R16.3`**, **`SR.2`**, **`R15.2`/`R15.5`** take respectively the Igusa and Drinfeld cohomology with compact support, quaternionic forms with Jacquet–Langlands semisimplicity, smooth *and locally analytic* induction from the Borel as a sheaf on `P¹(ℚ_p)`, and the classical de Rham bundle with `θ_{k+1}` together with classical/overconvergent forms.

**Six items are `planned`, not missing**, each checked against the layer's own text: completed cohomology and its admissibility (`CompletedCohomologyPartII` CC.0/CC.2/CC.3/CC.5 with `R31.1`), the big Hecke algebra with its Galois determinant (`R31.3`, CC.8), the perfectoid tower with `π_HT` and the Hodge–Tate exact sequence (`PerfectoidShimuraVarieties` S3, S5 and `HodgeTateAndCanonicalSubgroups` T2), `B_dR^+` and `A_inf` (`PadicHodgeTheory` R06.1, `AInfCohomology` AI.0), and the finiteness of rigid cohomology with compact support (`RD.4`).

## The three source issues

Two misprints and one acknowledged gap. Both misprints came out of the **coverage audit**, not out of reading — writing each statement into an item forces every symbol in it to be accounted for.

- **`E1` (misprint, affects nothing) — Theorem 5.3.8, p. 65.** The coefficients are introduced and bounded as `d_{i,j,k}`, and the series asserted to converge is written with `c_{i,j,k}`, which the theorem never defines. The intended reading is unambiguous: in the Lubin–Tate twin, Theorem 5.2.8 on p. 59, the `c_{i,j,k}` play exactly that role. Confirmed on a 300 dpi clip.
- **`E2` (misprint, affects nothing) — Theorem 5.3.17(1), p. 67.** The theorem constructs `d̄^{k+1}_Dr`, and every other occurrence in it prints `Dr`; property (1) prints **`d̄^{k+1}_LT`**. This is more than cosmetic: `d̄^{k+1}_LT` is the *other* operator, from Theorem 5.2.16, and the property asserted is **false** of it. That theorem states `d̄^{k+1}_LT` is `O^{sm}_LT`-linear — linear over the `GL₂(ℚ_p)⁰`-smooth sections — and `O^{sm}_LT` and `O^{D_p^×-sm}_LT` are different subsheaves of `O^{la}_LT`, neither inside the other; if `d̄^{k+1}_LT` were linear over the `D_p^×`-smooth sections its kernel would contain them, whereas 5.2.16(2) computes that kernel as `Sym^k V(k) ⊗ ω^{-k,sm}_LT · t^{n₁}`, built from the `GL₂`-smooth sections. Since the whole point of §5.3 is that the two towers **exchange the roles of the two groups**, an `LT`-for-`Dr` slip is exactly the kind that misleads when read literally. Confirmed on a 320 dpi clip.
- **`E3` (gap, affects nothing) — footnote 3, p. 58.** "Here we need a compatibility between the Higgs bundle in Liu–Zhu's work and the Higgs field constructed in [Pan22]. This can be checked on a toric chart. We plan to provide more details in a future work." The author flags it himself, which is why it is a gap and not an error, and the conclusion of Theorem 5.2.6 is not in doubt — the proof opens by deducing it from [Pan22, Theorem 4.2.7] via the embedding of the height-zero Lubin–Tate space into a modular curve, and that route is complete. But the *advertised improvement* (1.3.2(2): a Kodaira–Spencer explanation of the differential equation that "works for general Shimura varieties") is the conceptual argument, and that one inherits the unproved step.

## The coverage audit

The paper **shares one counter between its named environments and its plain numbered paragraphs** — `Theorem 5.3.8` and `5.3.7 (Compare 5.2.7)` are consecutive labels — so the inventory has to catch both. It also has to *exclude* citations into Papers I and II, which are printed in the same shape: `[Pan22, Theorem 3.1.2]` begins a line as convincingly as a real statement, and a first pass invented six phantom statements in §3.1 and §4.3 from exactly those.

After repairing ligatures and filtering bracketed citations, the inventory finds **322 labels** — 29 in §1, 17 in §2, 39 in §3, 42 in §4, **94 in §5**, 78 in §6, 23 in §7 — with **no gap in any subsection's sequence**. All 322 appear in the locator of some item.

Consistency checks that passed:

- **`A` versus `A^c`.** Proposition 5.5.13 states the supersingular term with the *cuspidal* quaternionic forms for every `k`, while Proposition 5.4.15 computes `ker d_{k+1}` with the *full* `A` for `k ≥ 1`. These agree: `A¹_{D,-χ}` is non-zero only when `n₁ = n₂`, and for `χ = (−k,0)` with `k ≥ 1` one has `n₁ = −k ≠ 0 = n₂`; while for `k = 0` the extra summand of `ker d₁` contributes nothing to `H¹` since `H¹(P¹,O) = 0`.
- **The `k = 0` extra `M₀(K^p)`** in Theorem 5.5.4's degree-2 piece matches Corollary 5.4.16's extra summand together with `H¹(Fℓ, Ω_Fℓ) = C`, as the proof states.
- **The `k = 1` exceptions line up** in four places: the introduction's 1.2.5 (only a map `H¹(Fℓ,O^{la,(0,0)}) → W₀`), the exact sequence (3.4.1) that makes the discrepancy precise, the `Ext` terms in Proposition 6.2.17 that vanish for `k ≥ 2` because `sl₂(ℚ_p)` acts trivially on `colim H⁰`, and the separate map `I'_0` of 4.3.4 — which is why Theorem 1.2.10 states `k = 1` only on a `λ_τ`-isotypic part.
- **Introduction against body** wherever the introduction names its counterpart: 1.1.2↔7.1.2, 1.1.7↔7.3.2, 1.1.10↔7.3.7, 1.1.14↔7.1.2(2), 1.2.3↔5.5.7+5.5.9, 1.1.13↔5.5.15/7.2.2/5.5.16. All match.

## Gaps

Seven, recorded in `gaps`. Three matter for planning:

- **The special case is conditional.** When `π_p` is special, that the generalized eigenspace is an honest eigenspace — and hence the description of `Π_ρ^{la}` — is obtained in Remark 7.3.11 from **Emerton's local-global compatibility and the known p-adic local Langlands correspondence**, the very inputs the paper otherwise avoids. Remark 5.5.15 asks for a direct proof. A blueprint gets the supercuspidal and principal series cases self-contained and the special case only conditionally.
- **Two key coincidences are proved only by explicit calculation.** Remark 5.3.10 says of Corollary 5.3.9 — that the two notions of local analyticity agree — that "our proof relies on explicit calculations" and that an intrinsic proof would be conceptually satisfying (Dospinescu and Rodriguez Camargo obtained it independently); the proof of Corollary 5.3.13 says the natural argument should use the moduli interpretations of the two towers.
- **A simpler construction of the two operators exists and is not used.** Remark 1.3.3: after the work was finished, Rodriguez Camargo explained a more direct construction of `d₁` and `d̄₁` using `B^+_dR/t²`, which "would be very interesting" for simplifying §6 — the longest and most technical part of the paper. A design job should decide which route to follow before writing §6's 78 labels into a blueprint.

The others: `E3`'s deferred compatibility; the cokernel of `θ_{k+1}`, hence the summand `A_{(−1,k+1)}`, is not described beyond Coleman's primitive part (Remark 4.4.17); what the method suggests beyond `GL₂(ℚ_p)` is programmatic (Remarks 1.1.3 and 5.5.16 — the latter proposing that a p-adic correspondence may need a **filtered** equivariant derived category on the flag variety, since these representations "do not see the information of the Hodge filtration"); and the published-text provenance above.

## Prerequisites the atlas does not cover

Eighteen, in `prerequisites`. **Paper I** (`[Pan22]`, Forum of Math Pi 10 (2022)) is quoted by almost every item and is unavoidable. Then **Scholze** (perfectoid modular curve, period sheaves, primitive comparison), **Scholze–Weinstein** (the two towers at infinite level and their duality), **Diao–Lan–Liu–Zhu** (the log pro-Kummer-étale site and the geometric de Rham period sheaf — the resolution all of §6 runs on), **Fontaine** (almost de Rham representations), **Berger–Colmez** (locally analytic rather than finite vectors in Sen theory), **Emerton**, **Liu–Zhu** (Higgs bundles — with the caveat of `E3`), **Colmez–Dospinescu–Nizioł** (equality of the two towers' compactly supported de Rham cohomology), **Dospinescu–Le Bras**, **Coleman**, **Katz–Mazur**, **Rapoport–Zink** with **Gross–Hopkins**, **Dospinescu–Paškūnas–Schraen**, **Liu–Xie–Zhang**/**Colmez**/**Breuil** (p-adic local Langlands and `Σ(2,L)`), **Beilinson–Bernstein** with Harish-Chandra and BGG, **Schneider–Teitelbaum** and **Schneider** — with the paper's own warning that `C` is *not* spherically complete, so Schneider–Teitelbaum does not literally apply over `C` (Remark 7.3.5) — and **Kashiwara–Schmid** with **Carayol**.

## Validation and its limits

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-PAN-26.result.json` → `ok`. All `uses` references resolve within the extraction; the 267 missing items are partitioned by the 10 routes, each taken exactly once. Every stage named in a source route was verified to belong to the roadmap it is listed under, and every target roadmap checked not to be of `tauceti` origin.

Not verified: the published Annals text (see *Provenance*); the proofs quoted from Paper I, Scholze, Scholze–Weinstein, Diao–Lan–Liu–Zhu, Fontaine, Coleman and Colmez–Dospinescu–Nizioł. **§§6.3–6.5, the three-part proof of Theorem 6.2.6, were read at the level of their statements and the structure of the argument rather than line by line**; the linear-algebra mechanism of 6.3.2 with Lemma 6.3.3 was checked for internal coherence, not recomputed. No independent verification of the two explicit-calculation proofs flagged in the gaps was attempted.
