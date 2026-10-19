# REV-DESIGN-GeometricSatakeAndFusionPartII

**Accepted as a complete target-level planning pass, after corrections.** All nine layers LM.0–LM.8 remain planned; none is closed, and every node remains implementation-unchecked. One planned proof route was wrong and is now a recorded gap (the closedness of the Weil-restriction local-model map behind good embeddings for acceptable data). No unresolved contradiction remains in the corrected statements.

Reviewer: Claude, session `claude-iW3aXv`, 19 October 2026. Issue: [#3538](https://github.com/CBirkbeck/tauceti-explorer/issues/3538). The design was written by the separate session `codex-JDW4oj` for #3354. The packet records the reviewer as `independent-review-REV-DESIGN-GeometricSatakeAndFusionPartII`.

## Inventory

| Item | Result |
| --- | --- |
| Node verdicts | 60 checked: 39 verified, 21 corrected, 0 added, 0 unverifiable |
| Node kinds | 41 theorems, 13 definitions, 6 constructions |
| Definition/construction interfaces | 76 API entries and 59 tests (one test added); every object has at least three tests |
| Planets | 36, at most six per layer (LM.4 has six) |
| Baseline | 5 declarations, all confirmed at the pins; none removed or added |
| Cross-roadmap node prerequisites | 17 node ids in GeometricSatakeAndFusion GS0, DiamondsAndVStacksPartII D10/D11 and RootSystemsPartII; every statement read in its accepted packet |
| Routed ledger | 158 items (107 planned, 22 imported, 29 split); one note corrected |
| Source findings | 14: the 12 original confirmed (E4 locator and E6 correction revised), 2 added (E13, E14) |
| Open work | 13 gaps (one added) and 15 requests |

## Sources

Every node's locator and `match` was read against the source itself. The 14 public PDFs were downloaded to scratch and their SHA-256 values all agree with the packet: KPZ (published Forum of Mathematics, Pi), KP (published, Numdam), KZ (author v2), GLX (arXiv v3), AGLR (arXiv v2), GL (author preprint), ALWY (arXiv), PZ (arXiv v4), Levin (arXiv), PR (arXiv), PRLSV (author preprint), FHLR (author preprint), RZ17 (arXiv) and KRZ (arXiv). The maintainer-cleared Scholze–Weinstein copy (Berkeley lectures, Ann. of Math. Studies 207, authors' March 2020 version) was read in place at printed pp. 195–206; nothing from it was copied. One page of KPZ (p. 34) was checked as an image for the weight/coweight labels of E10.

Page offsets used: printed page equals PDF page for KPZ, KZ, GL, GLX, ALWY, Levin, PR, PRLSV, FHLR, RZ17 and KRZ; KP printed page is PDF page + 120; AGLR printed page is PDF page − 6; the SW copy's printed page is PDF page − 10.

## Corrections to nodes

| Node | Correction and reason |
| --- | --- |
| `LM.0/triple` | KZ §3.1.1 uses a parahoric level; the stabilizer scheme enters in Definition 3.1.6(1), p. 19. Match and locator corrected. |
| `LM.0/hodge-data` | KZ has no §3.1.3: local Hodge embeddings are defined after Remark 3.1.3 (p. 18), and the weights 0, −1 are fixed in Definition 3.1.6(2), p. 19. |
| `LM.1/polynomial-bd` | Levin's ind-projectivity theorem is Theorem 4.2.10 on p. 28 of the arXiv text read; KPZ cites the published numbering 4.2.11. Locator and the Levin read-sections corrected (packet and roadmap). |
| `LM.1/adjoint-comparison` | KP Proposition 2.2.4 assumes p∤\|π₁(G^der)\| and uses the normality of Theorem 2.1.2; the statement had dropped this hypothesis. Restored, with a hypotheses list. |
| `LM.2/weyl-model-embedding` | The representation ρ₁ is set up in KPZ §3.3.11, and §3.3.9 is on p. 22. Locator and reference corrected. |
| `LM.2/total-lattice-embedding` | KPZ Lemma 2.3.1 is on p. 12, not pp. 13–14. |
| `LM.3/local-model-kimberlite` | GLX §3.2 records M as a kimberlite (p. 19) but does not state that (M, Gr_μ) is rich smelted; its Theorem 3.7 concerns shtukas. The GLX locator now cites §3.2 and Theorem 3.8 and says that richness is planned through the D11 criterion. |
| `LM.4/fm-lattice-bound` | The statement called the Weyl module E_ν and its "standard lattice" E⁰_ν, conflating V(ν) with the bundles 𝓔(ν)=𝓔×^G V(ν) and 𝓔⁰(ν) of KPZ Definition 4.2.6 (p. 34). Rewritten with V(ν)=Ind_B^G(−w₀ν)^*, ν∈X^*(T)^+, and both inclusions inside 𝓔(ν)[1/t]. |
| `LM.4/cartan-equality` | The characteristic hypothesis is now explicit. Case (2) of KPZ Proposition 4.3.10 needs −2m≠0, so p≠2 (new finding E13). |
| `LM.5/rank-one-curves` | KZ Case (1) is G_α≅Res_(K/F_q((t)))SL₂ with a uniformizer u of K and the curve a↦u_−(u^(−1)a), not t^(−1). |
| `LM.5/rank-one-flag-closed` | Added why the prime-to-p hypothesis on the rank-one image holds: the kernel of G_α→G^der lies in the kernel of G^sc→G^der, of order dividing \|π₁(G^der)\|. This matters for an SU₃ image when p=3. |
| `LM.5/rational-orbit-lift` | KZ Lemma 5.2.5 is on p. 52. |
| `LM.6/pel-lattice-chains` | SW Definition 21.6.1 (p. 199) requires local isomorphisms M_Λ≅Λ⊗R and M_Λ/M_Λ′≅(Λ/Λ′)⊗R as O_B⊗R-modules; the statement imposed only ranks of adjacent quotients, which admits wrong objects. Conditions restored; non-example test `ModuleChain.adjacent_quotient_type` added; "SW Proposition 21.6.6" corrected to Corollary 21.6.6. |
| `LM.6/chain-torsors` | SW numbers these Theorem 21.6.4, Remark 21.6.5 and Corollary 21.6.6, not propositions. |
| `LM.6/drinfeld-comparison` | SW §21.7 and Theorem 21.7.1 are on pp. 203–204; RZ17 5.2 is a corollary. Locators corrected. |
| `LM.6/unitary-drinfeld-comparison` | SW §21.8 spans pp. 204–206; KRZ §1.3 starts on p. 7 and Definition 2.1.1 is on p. 10. |
| `LM.7/admissible-s2` | The Bruhat-graph criterion is GL Proposition 3.4 (with Lemma 3.3), not a lemma. |
| `LM.7/general-normal-representative` | GL 1.2 is a lemma (p. 2). |
| `LM.7/acceptable-good-embedding` | **Mathematical correction.** The proof planned to obtain the closed immersion M^loc_(𝒢,μ)→M^loc_(𝒢_(K/F),μ_(K/F))⊗O_E (KZ Lemma 3.1.10) from the GS0 closed integral-Grassmannian map plus normal full faithfulness. That yields a scheme map whose diamond is a closed immersion, which is only the normalization of its schematic image (LM.3/normalization-of-image), the same conclusion as FHLR Lemma 5.27 (p. 34: a finite map that is a universal homeomorphism onto its image). By D10/uniqueness-of-integral-models(2) closedness is equivalent to normality of the Zariski closure of G/P_μ in the target Grassmannian. Statement and proof steps corrected (the stabilizer scheme may change within the facet, as in KZ's proof); a new gap records the missing closedness; two prerequisites added. |
| `LM.8/local-nearby-cycles` | KP has no Theorem 4.7.2; §4.7.2 sets up Corollary 4.7.3 on p. 212. |
| `LM.8/bernstein-characterization` | The PZ match now records the misprinted exponent in PZ's explicit minuscule A_μ (new finding E14); a check states the correct hyperspecial IC trace (−1)^d q^(−d/2). |

The other 39 nodes were verified at their locators; `review.checked` in the packet gives each verdict with its evidence. Notable verified points: the test-weight sets S_A, …, S_(D^H) of the proof of KPZ Theorem 4.2.3 (pp. 37–39); the restriction of the root upper bound to minuscule test modules, which is the correct repair of KPZ's §4.2.9 equivalence (it fails for the Weyl module V(p) of SL₂, where X_α kills the weight p−2 vector); the KZ rank-one formulas in Cases (2)–(3) and the absence of a Bertini step in Proposition 5.2.3; AGLR Theorem 7.22 before the GL tube theorem; the unshifted trace normalization φ_q=q^(d/2)z of KP Theorem 4.7.11; and the unipotent-block semisimple-trace test (1+q^(−1) against q^(−1)).

Two deliberate restrictions are kept and noted: `LM.4/big-cell-tangent` and `LM.4/root-upper-bound` assume p>2 although KPZ's root results hold in every characteristic (the roadmap's consumers all have p>2); `LM.3/endomorphism-cutout` keeps the classical-type hypothesis that KPZ §3.4.5 omits (PAPER-KISIN-PAPPAS-ZHOU-26/E36).

## Baseline citations

All five were read in source at the pins (Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`):

- `mathlib:Submodule.span` (Mathlib/LinearAlgebra/Span/Defs.lean, line 46), with `Submodule.span_le`.
- `mathlib:Algebra.trace` (Mathlib/RingTheory/Trace/Defs.lean, line 71), the R-linear trace S→ₗ[R]R.
- `mathlib:Module.Grassmannian` (Mathlib/RingTheory/Grassmannian.lean, line 68): submodules with locally free quotient of rank k; scheme representability is listed there as future work. Cited for conventions only; no node depends on it.
- `tauceti:TauCeti.AlgebraicGeometry.ZariskiTangentSpace` (TauCeti/AlgebraicGeometry/TangentSpace/Basic.lean, line 65), the residue-field dual of 𝔪/𝔪².
- `tauceti:Derivation.adjointWeightSpace` (TauCeti/Algebra/AlgebraicGroup/Tangent/RootSpace.lean, line 95).

None was removed or replaced. Current ownership was checked read-only at TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: no upstream roadmap or library module builds affine Grassmannians, loop groups, Schubert varieties or local models (TauCetiRoadmap ReductiveGroupsPartII explicitly disowns them), so nothing in LM is duplicated. The reviewed library audit (`data/library-coverage.json`) has no local-model target in the libraries.

## Cross-roadmap prerequisites

The 17 imported node ids exist in accepted packets and state what the consumers use: GS0 `schubert-bounds-and-properness`, `integral-parahoric-properness` (closed group embeddings give closed integral Grassmannians; connected-level and central comparisons), `bounded-admissible-flags`, `flag-convolution-fibres`; D10 `v-closure`, `proper-scheme-full-faithfulness`, `uniqueness-of-integral-models`, `awn-full-faithfulness`, `flat-closure-diamond`; D11 `proper-kimberlite-criterion`, `flat-pi-adic-kimberlite`, `rich-smelted-kimberlite`, `kimberlite-triple-theorem`, `tubular-neighbourhood`, `normality-via-tubes` (with its algebraically closed residue field); RootSystemsPartII `invariant-step` and `ambient-coroot-export`. The 15 requests are precise and each names its consumers; the stage graph LM.0–LM.8 is consistent with the node prerequisites.

## Source findings

| Finding | Verdict |
| --- | --- |
| E1 KPZ Remark 4.1.5 "normal surface" | confirmed: x(x+yz)=0 is reduced, reducible and not normal; the computation is right. |
| E2 KPZ Proposition 4.2.10 proof | confirmed: the §4.2.9 equivalence fails in characteristic p (SL₂, V(p)); minuscule test modules repair it. |
| E3 KP Corollary 2.3.16 | confirmed: the reduction to a hyperspecial point is not justified; the product-Grassmannian route is. |
| E4 KZ Lemma 5.2.5 | confirmed; locator corrected to p. 52. |
| E5 KZ Proposition 5.2.3 | confirmed: orbit sums of individually admissible steps need not be admissible. |
| E6 KZ Lemma 3.1.10 / FHLR Lemma 5.27 | confirmed; its proposed correction was itself insufficient and is replaced (see `LM.7/acceptable-good-embedding`). |
| E7 SW §21.8 signature pairs | confirmed: (1,1) is central and (2,2) violates SW's own weights-0/1 condition (p. 200). |
| E8 KP §2.3.15 rank | confirmed. |
| E9 KP Proposition 2.3.7 (*) | confirmed: k[[u]] is meant. |
| E10 KPZ X^* versus X_* labels | confirmed on the page image of p. 34. |
| E11 KPZ §4.3.1 signs | confirmed: Ad(x_(−α)(1))E=E−H−F. |
| E12 KP Proposition 2.3.7 multiplicities | confirmed: division-algebra multiplicities m_j are lost. |
| **E13** (new) KPZ Proposition 4.3.10 Case (2) | gap: the argument needs p≠2, which §4 never assumes; the application (Theorem 4.4.3) has p>2. |
| **E14** (new) PZ v4 §9.d.3(a) | misprint: the minuscule hyperspecial IC trace is (−1)^d q^(−d/2), not (−1)^d q^(d/2), with geometric Frobenius; Theorem 9.16 itself is unaffected. Scoped to arXiv v4. |

For E13 and E14 the Crossref records of both articles show no correction, PZ arXiv v4 is the latest version, and the errata register has no entry.

## Suggested Lean file and reader

The suggested file follows the 12 October shape. Two statements were added over pinned carriers: `formalCurve_coeff_one_eq_zero` (the power-series computation behind KPZ Remark 4.1.5) and an `example` checking the sl₂ conjugation signs of E11. `lean-check` at the pins: no errors and twelve `declaration uses sorry` warnings, nothing else. The reader was re-rendered for every changed node, finding, gap, source and ledger row (all old sections matched the old packet exactly before replacement), and its coverage section now records this review. The roadmap definition's Levin read-sections were corrected.

## Questions for the orchestrator

1. The new gap "Closedness of Weil-restriction local-model maps" sits between KZ's Proposition 3.1.9 and its use. Should the proposed ReductiveGroupsIntegralRepresentationsPartII continuation also own the special-fibre closed-immersion statement for the companion flag maps, or should it stay with LM.7?
2. E14 concerns the arXiv text of Pappas–Zhu only; a collation job against the Inventiones version would settle whether the published text has the same exponent.
3. The design's eight restructuring proposals are unchanged by this review; they still need the maintainer's decision, in particular the RationalGelfandProof split and the common algebraic loop prefix in GS0.
