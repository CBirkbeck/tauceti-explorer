# Handoff: BP-PerfectoidShimuraVarieties

Claude (Claude Code, model Claude Opus 5.5) — session `claude-hkZHP3`, 2026-10-06. Refs #972.
Claim confirmed by the bot at [issue comment 6026222224](https://github.com/CBirkbeck/tauceti-explorer/issues/972#issuecomment-6026222224).
This run takes exactly one job and completes its target-level planning pass under PROTOCOL §0; it is not a checkpoint.

## Deliverables and coverage

The [packet](../packets/PerfectoidShimuraVarieties.json), [roadmap document](../readmes/PerfectoidShimuraVarieties.md) and [suggested Lean file](../suggested/PerfectoidShimuraVarieties.lean) agree; the document is generated from the packet, with an introduction and a prose overview of each layer. No other file is edited.

- 90 nodes: 4 definitions, 20 constructions, 51 theorems, 7 lemmas and 8 comparisons; per layer S0 9, S0.general 2, S1 26, S2 10, S3 13, S4 7, S5 11, S6 12. Every implementationStatus is `unchecked`.
- 154 API items and 97 unit tests (at least three for every definition and construction).
- 27 planets: S0 4, S0.general 1, S1 6, S2 2, S3 6, S4 3, S5 3, S6 2.
- 21 pinned baseline declarations (20 Mathlib at 082e2d3, one Tau Ceti at f790474; each statement read at its pin), 15 sources, 3 gaps, 18 requests, 3 restructuring proposals and 39 source issues.
- Packet status `complete`: all eight stages have coverage `planned` with explicit remaining lists; no stage is closed.

The plan starts from the leads of the extraction EXT-12 draft (41 nodes for S1–S4; S0, S5 and S6 were empty) and from the accepted restructuring RS-05 (P7 owns tilde-limits and the Frobenius tower criterion, P8 the finite quotients and closed-locus gluing, Q4 the closed perfectoid quotient, D6 diamondification). Every EXT-12 lead was checked against the source and either rewritten as a node, merged, or routed to its owner below.

Layer by layer:

- **S0** builds the tower, its right action (Milne's convention `T_{gh} = T_h ∘ T_g`), the diamond limit (through `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, Scholze ECD Lemma 11.22), perfectoid representatives in the sense of Scholze–Weinstein 2.4.1 (with P7's tilde-limits), the kernel of the action (the closure of the central rational elements with prime-to-p part in `K^p`; a tower is a `K_p`-torsor only when `Z(ℚ) ∩ K^pK_p = 1`), the component set, the neutral-component tower and rigidified moduli towers with a pro-system of finite groups (used by S5's hybrid Hilbert tower, whose groups `Δ(pⁿN)` grow with `n` and whose deck groups differ from those of the Shimura tower).
- **S0.general** gives the general-datum diamond and the toroidal tower diamond with fixed cone decomposition, refinement maps and Hecke translations on common refinements (the O8 request).
- **S1** plans Scholze's §§3.1–3.3 statement by statement (26 nodes), compares Scholze's fixed-similitude spaces over `ℚ_p^cycl` with the S0 tower over `C` (`S1/siegel-similitude-comparison`), adds Heuer's description of the elliptic cusps at infinite level (closing the case `g = 1` that the codimension hypothesis of §2.3 excludes), Pilloni–Stroh's perfectoid toroidal Siegel tower, and the open Siegel tower with strict Iwahori level for O8.
- **S2** and **S4** plan Scholze §4.1 and Hansen–Johansson §§5.2–5.3 on top of P8's general results (P8 owns HJ §5.1: analytic separation, finite quotients, good towers, closed loci in towers).
- **S3** owns the Hodge-type period map on the tower (RT-AREA-padic-1/22) with the right-action convention `FL = P_μ\G`, Scholze's left-action `Fl` compared through `x ↦ x⁻¹`, the Levi-torsor pullback with the cyclotomic twist `M_HT = M_dR ×^{μ,ℤ_p^×} ℤ_p(1)` (missing from Boxer–Pilloni v1, present in their revised manuscript), the graph chart and frame asked for by O8, the elliptic and Hilbert cases and Pan's Hecke-equivariant sequence.
- **S5** compares the modular and the three Hilbert towers and plans every item O0/O4 asked for: the three towers and their maps, the `ℤ_p^×`-torsor span, the full profinite polarization torsor, the `𝒪_p^×`-valued Weil pairing with `(γ, x)^*w(e_β) = w(x⁻¹)w(det γ)w(e_β)`, and the common Hodge–Tate coordinate.
- **S6** owns Boxer–Pilloni Theorem 4.4.40 on the general toroidal tower (RT-AREA-padic-1/4), the abelian-type minimal period map (4.4.41–4.4.53), and the integral and Bruhat reductions of §4.6 asked for by O8 (with the `m = n` pushout of the revised manuscript).

## Internal review before submission

Before submitting, two independent checking agents read every node against its sources at the cited locators (S0/S0.general/S1/S5 and S2/S3/S4/S6), and four agents applied the findings file by file; the main session re-checked the consequential ones against the texts. About 45 findings were applied. The main corrections:

- Scholze's spaces live over `ℚ_p^cycl` with a fixed similitude (Weil-pairing) component, while the S0 tower over `C` has all components; the new comparison node `S1/siegel-similitude-comparison` carries the passage, and every node that moved between the two now cites it. Over `ℚ_p^cycl` the strict-Iwahori tower is a `K ∩ ker c`-torsor; it is a `K`-torsor only after base change to `C`.
- Conventions are pinned: `μ(t) = diag(1_g, t·1_g)`, `P_μ = Stab⟨e_{g+1}, …, e_{2g}⟩`, `π_HT(x·γ) = γ⁻¹·π_HT(x)` for Scholze's left action. The Levi-torsor twist is `f_p(V) ≅ f_∞(V)(⟨μ, κ⟩)` (Boxer–Pilloni revised manuscript, Remark 4.4.12). The graph chart `rowspace(1 Z)` is Scholze's chart `Fl_J`, `J = {g+1, …, 2g}`. The strict-Iwahori-stable domains are `{dist(Z_ij, ℤ_p) ≤ r}`. The frame lives on `π_HT^*(𝒪^{2g}/W) ≅ ω_{A^∨}`, and the twisted form asked for by O8 differs by the similitude character (recorded in a `uses` entry of `S3/siegel-graph-chart-and-frame`).
- Dependency cycles in S1 were removed: Scholze's Lemmas 3.3.19–3.3.20 moved into `siegel-main-theorem`, and the case `g = 1` now uses Heuer's finite-level results only.
- Rigidified towers carry a pro-system of finite groups. Hansen–Johansson's Hodge-type statements are used over `C` only. The connected case of Proposition 5.18 uses finite maps of towers instead of the false equality of towers (E37). Torsor fibre products need a smooth surjection. Boxer–Pilloni's `G^c` is `G/Z_s(G)`.
- Tests that were false or vacuous were replaced. Two tests were renamed (`anticanonical_not_affinoid_m0` → `anticanonical_affinoid_of_lift`, `htMapTop_not_defined_boundary` → `htMapTop_tate_curve`), and five are new (`finiteLevel_fixed_similitude_g1`, `FL_parabolic_pinned`, `graph_domain_not_disc`, `graph_chart_lagrangian`, `hodge_frame_similitude`).

One reviewer finding was rejected after reading the PDF page: the claimed slip in Boxer–Pilloni v1, p. 95 is an artefact of the text extraction (the page prints `x₂ = x′₂wh₂`, which is consistent).

## Red-team findings handed to this job

- RT-AREA-padic-1/22: S3 is planned as the single owner of the Hodge-type period map on the tower; the packet's first `restructure` entry proposes the owners entries and the narrowing of T2.
- RT-AREA-padic-1/4: S6 is planned as the single owner of the general toroidal `π^tor_HT` and Levi-torsor pullback; T6:comparison is narrowed (in the request to it and in the same `restructure` entry) to the finite-level logarithmic content.
- RT-AREA-padic-1/1: the perfectoidization of integral algebras (Bhatt–Scholze 10.11) is recorded as a gap with its consumers, and the second `restructure` entry proposes the edges from the pending PerfectoidQuotients Part II stage.

## Gaps

- **Perfectoidization of integral algebras over perfectoid rings (Bhatt–Scholze, Prisms and prismatic cohomology, Theorem 1.17(1) = 10.11, with §8.2 and §§10.1–10.2).** Needed by `S2/siegel-tame-level-removal`, `S2/hodge-genuine-minimal-perfectoid-tower`, `S2/hodge-good-tower-arbitrary-level`, `S4/property-p-from-adjoint`, `S4/hodge-adjoint-property-p`, `S4/preabelian-minimal-perfectoid`, `S6/abelian-minimal-period-map`.
- **Boundary strata and finite étaleness in Scholze's Lemma 3.2.35 for general ε.** Needed by `S1/full-level-anticanonical-perfectoid`.
- **Boxer–Pilloni §3.3 flag-variety dynamics: tubes ]C_{w,k}[_{m,n} = P\PwG¹_{m,n} of Bruhat cells and the normalisation Lemma 3.3.15.** Needed by `S6/bruhat-levi-reduction`, `S6/toroidal-hecke-correspondences`.

The packet's `gaps` entries give the detail: what is verified, what is not, and the natural owner.

## Requests

The requests go to roadmaps that have no packet (HodgeTateAndCanonicalSubgroups, HilbertModularVarietiesAndShimuraCurves, TorsionCohomologyInfrastructure) or whose packets do not yet contain the needed node (ShimuraCompactifications C2.general, C3, C3.general, C5; ShimuraVarieties V2, V8; ShimuraData D4). Each states the exact statement needed and the consuming nodes.

## Mistakes found in the sources

The packet records 39 source issues, `PerfectoidShimuraVarieties/E1`–`E39`. Those already in the atlas (the PAPER-SCHOLZE-15 extraction) are cross-referenced in `known`; the others were found in this job. Each has a printed text, a correction, its effect and the places searched. The ones that change a proof or a stated result:

- `PerfectoidShimuraVarieties/E2` (error, affects a stated result): §3.3, the paragraph before Lemma 3.3.9 and Theorem 3.3.18(i), p. 1012, with Theorem 3.1.2(iii) and Theorem 4.1.1(i); inherited by Pilloni–Stroh Théorème 1.18(2)–(3), Lemme 1.20 and Théorème 1.22.
- `PerfectoidShimuraVarieties/E4` (error, affects the proof): §3.2.2, proof of Theorem 3.2.15, p. 986.
- `PerfectoidShimuraVarieties/E8` (gap, affects the proof): §3.2.5, Lemma 3.2.31 as used in the proof of Lemma 3.2.30, pp. 999–1000.
- `PerfectoidShimuraVarieties/E9` (gap, affects the proof): §3.2.5, proof of Lemma 3.2.35, pp. 1001–1002.
- `PerfectoidShimuraVarieties/E10` (gap, affects the proof): §3.1 p. 975, §3.2.2 p. 987 (proof of Theorem 3.2.15), §3.2.5 pp. 995–1001 (Proposition 3.2.33, Lemma 3.2.35).
- `PerfectoidShimuraVarieties/E11` (gap, affects the proof): §3.2.5, Theorem 3.2.36, p. 1002.
- `PerfectoidShimuraVarieties/E13` (gap, affects the proof): §4.1, Theorem 4.1.1(i) and its proof, pp. 1019–1020.
- `PerfectoidShimuraVarieties/E15` (gap, affects a stated result): §1.3, Theorem 1.5, p. 4, against §5.3.
- `PerfectoidShimuraVarieties/E16` (error, affects the proof): §5.3, Definition 5.17 against the proof of Proposition 5.18 and Theorem 5.20, pp. 36–38.
- `PerfectoidShimuraVarieties/E20` (error, affects a stated result): §4.4.8, the relative Hodge–Tate filtration and the identification of M_HT, p. 65; also §4.4.25–4.4.26, §4.4.38, Theorem 4.4.40, Propositions 4.4.29, 4.6.3 and 4.6.12 (arXiv v1).
- `PerfectoidShimuraVarieties/E21` (error, affects a stated result): §2.3, proof of Proposition 2.3.9, p. 21.
- `PerfectoidShimuraVarieties/E23` (gap, affects a stated result): §4.4, Theorem 4.4.45, last clause, p. 82.
- `PerfectoidShimuraVarieties/E26` (error, affects the proof): §8.4, proof of Lemma 8.20, p. 37.
- `PerfectoidShimuraVarieties/E27` (error, affects the proof): §8.5, proof of Lemma 8.28, p. 40.
- `PerfectoidShimuraVarieties/E28` (error, affects a stated result): §8.2.2, after (8.3), p. 34, and §8.4.2, p. 39.
- `PerfectoidShimuraVarieties/E29` (error, affects a stated result): §9, proof of Lemma 9.2, p. 41.
- `PerfectoidShimuraVarieties/E30` (gap, affects a stated result): §2.2, proof of Proposition 2.6, p. 9.
- `PerfectoidShimuraVarieties/E31` (gap, affects the proof): §3.1, proof of Proposition 3.8, pp. 10–11.
- `PerfectoidShimuraVarieties/E32` (gap, affects the proof): §12.9.1, p. 81 (and Boxer–Calegari–Gee–Pilloni §6.2.1, arXiv pp. 144–145).
- `PerfectoidShimuraVarieties/E36` (gap, affects the proof): §5.3, proof of Proposition 5.18, p. 24.
- `PerfectoidShimuraVarieties/E37` (error, affects the proof): §5.3, proof of Proposition 5.18, connected case, p. 36.
- `PerfectoidShimuraVarieties/E38` (gap, affects the proof): §3.3.2, proof of Corollary 3.3.12, p. 1009.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PerfectoidShimuraVarieties.json` with `TAUCETI_BASELINE` set to the pinned index: 0 errors, 0 warnings; status complete, all eight stages planned.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- `lean-check research/blueprint/suggested/PerfectoidShimuraVarieties.lean` (shared build at Mathlib `082e2d37e8`): elaborates; the only warnings are the 30 `declaration uses 'sorry'` warnings. The native part (level groups of `GSp_{2g}(ℤ_p)` against `Matrix.J`, `PadicInt.toZModPow` and `CongruenceSubgroup.Gamma*`; the graph-chart matrix identities; the unit computation for `ℚ(√5)`, proved by `decide`) is real Lean; everything else is contract comments. A script confirms that every API name and unit-test name of the packet occurs in the file. No build, update, cache retrieval or language server was started.
- Every excerpt was compared with the text of the cited version after normalising to letters and digits. All match, except the two excerpts from Milne's notes, whose PDF text layer mangles symbols; those were compared by eye. Every excerpt is at most 300 characters.
- A script checked that the packet has no dependency cycles among its own nodes, that the readme and the packet contain no forbidden word and no local path, that every definition and construction has at least three tests, and that no layer has more than six planets.
- The roadmap document is generated from the packet, so the two agree node by node. Only the four issue-authorised files are in the pull request.

## Sources read and missing

- `sch15`: Peter Scholze, *On torsion in the cohomology of locally symmetric varieties*, Annals of Mathematics 182 (2015), no. 3, 945–1066, published version (doi:10.4007/annals.2015.182.3.3); printed page numbers 945–1066 and the published (arabic) numbering, e.g. Theorem 3.3.18 = arXiv Theorem III.3.18. Read: §2.3.3 (Definition 2.3.8 and the paragraph after it), p. 967; §3.1 (pp. 970–972: Definition 3.1.1, Theorem 3.1.2 and footnote 7); §3.2.2–§3.2.5 (pp. 983–1002: Definition 3.2.12 to Theorem 3.2.36 with proofs); §3.3.1–§3.3.3 (pp. 1003–1015: Remark 3.3.3 to Theorem 3.3.18 with proofs); §4.1 (pp. 1018–1020: introduction, footnotes 15–16, Theorem 4.1.1 with proof).
- `hj25`: David Hansen, Christian Johansson, *Perfectoid Shimura varieties and the Calegari–Emerton conjectures*, arXiv:2011.03951v2, 29 August 2025 (paper dated 1 September 2025; the revised version, from which the Hodge–Tate period map for pre-abelian data was removed); printed page = PDF page. Read: §1.3, Theorem 1.5 and the paragraph after it, pp. 4–5; §5.2, Proposition 5.14 with proof, the remark after it and Corollary 5.15, pp. 34–35; §5.3, conventions, Proposition 5.16, Definition 5.17, Propositions 5.18–5.19, Theorem 5.20 and Corollary 5.21 with proofs, pp. 35–38.
- `cs17`: Ana Caraiani, Peter Scholze, *On the generic part of the cohomology of compact unitary Shimura varieties*, arXiv:1511.02418v1, 8 November 2015 (published in Ann. of Math. 186 (2017), 649–766; preprint numbering used). Read: §2.1, Example 2.1.1, Theorems 2.1.2–2.1.3 and footnote 8, pp. 11–12; §2.3, Lemma 2.3.7, the construction of π_HT and the paragraphs after it, pp. 20–21.
- `bp21`: George Boxer, Vincent Pilloni, *Higher Coleman theory*, arXiv:2110.10251v1, 19 October 2021. Read: §4.4.10–Remark 4.4.11, p. 66; §4.4.27, p. 74; §4.4.38–§4.4.53, pp. 77–85 (Theorem 4.4.40, Proposition 4.4.42, Theorems 4.4.43 and 4.4.45, Principle 4.4.44, Lemmas 4.4.50–4.4.52, Proposition 4.4.53); §4.6.1–§4.6.20, pp. 87–96 (Propositions 4.6.3, 4.6.9, 4.6.19, Remarks 4.6.5–4.6.6, Example 4.6.10, Lemma 4.6.20).
- `bhw`: Christopher Birkbeck, Ben Heuer, Chris Williams, *Overconvergent Hilbert modular forms via perfectoid modular varieties*, arXiv:1902.03985v4, 10 May 2021 (published in Ann. Inst. Fourier 73 (2023), no. 4, 1709–1794); printed page = PDF page of the arXiv version. Read: §2.1–§2.2 (display (2.1), Lemma 2.4, Proposition 2.6), pp. 7–9; §3.1 (proof of Proposition 3.8), pp. 10–11; §3.3 (formula (3.2), Lemma 3.17 to Remark 3.23), pp. 12–14; §5.1.1 (Remark 5.5), §5.3 (Proposition 5.18), §5.4 (Remark 5.21), pp. 19–25; §8 (Proposition 8.4 to Lemma 8.28, with (8.1), (8.2) and diagram (8.7)), pp. 32–40; §9 (Definition 9.1, Lemma 9.2 and (9.1), Lemma 9.7), pp. 40–43.
- `sw13`: Peter Scholze, Jared Weinstein, *Moduli of p-divisible groups*, arXiv:1211.6357v2, 13 April 2013 (published in Camb. J. Math. 1 (2013), 145–237). Read: §2.4: Definition 2.4.1, Propositions 2.4.2–2.4.5, pp. 19–21.
- `ecd`: Peter Scholze, *Étale cohomology of diamonds*, arXiv:1709.07343v4. Read: §11, Definition 11.17 and Lemmas 11.21–11.22, pp. 62–63.
- `milne`: J. S. Milne, *Introduction to Shimura varieties*, October 23, 2004; revised September 16, 2017 (numbering unchanged from the published version in Harmonic analysis, the trace formula, and Shimura varieties, Clay Math. Proc. 4, 2005). Read: §5: Lemma 5.13, Definition 5.14 and the paragraph before it, Theorem 5.17, 'Passage to the limit', Theorem 5.28 and Remark 5.29, pp. 57–65.
- `pan22`: Lue Pan, *On locally analytic vectors of the completed cohomology of modular curves II*, arXiv:2209.06366v1, 14 September 2022 (published in Ann. of Math. 203 (2026), no. 1, 121–281; not obtained, preprint read). Read: §3.1.1, sequence (3.1.1), p. 17; §3.2.1, pp. 18–19; §4.2.3, sequences (4.2.1)–(4.2.3), p. 38.
- `bcgp21`: George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular*, arXiv:1812.09269v3, 28 November 2021 (published in Publ. Math. IHÉS 134 (2021), 153–501; statement numbers agree). Read: §6.2.1, arXiv pp. 144–145.
- `ps16`: Vincent Pilloni, Benoît Stroh, *Cohomologie cohérente et représentations Galoisiennes*, Author's version from V. Pilloni's homepage (published in Ann. Math. Québec 40 (2016), 167–202); PDF page numbers. Read: Introduction, Théorème 0.4 and the paragraph after it, PDF p. 2; §1.1 and Proposition 1.2, PDF pp. 3–4; §§1.14–1.27 (Proposition 1.15, Corollaire 1.16, Théorème 1.18, Lemmes 1.20–1.21, Théorème 1.22, Remarques 1.23–1.27), PDF pp. 7–10; §2.3.1 and Proposition 2.5, PDF pp. 12–13; Appendice A: A.1, PDF p. 21, and A.12–Corollaire A.19, PDF pp. 27–30.
- `pil20`: Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*, Author's version (113 pages, dated 17 June 2019) from V. Pilloni's homepage (published in Duke Math. J. 169 (2020), no. 9, 1647–1807). Read: §12.9.1, p. 81.
- `heuer20`: Ben Heuer, *Cusps and q-expansion principles for modular curves at infinite level*, arXiv:2002.02488v1, 6 February 2020. Read: §1.1 (Theorem 1.1 and the surrounding discussion); §2.3 (Lemma 2.9, the Tate-curve parameter spaces at tame level); §3: Lemma 3.4, Proposition 3.8, Theorem 3.17, Corollary 3.18, Proposition 3.19, Proposition 3.20, Lemma 3.21, Theorem 3.22.
- `bpa`: George Boxer, Vincent Pilloni, *Higher Coleman theory (authors' revised manuscript)*, Authors' manuscript from V. Pilloni's homepage (180 pp., PDF dated 3 March 2025), the version cited by OverconvergentAutomorphicForms O8; differs from arXiv v1 by the cyclotomic twists in §4.4 and the renumbering of §4.4.12–4.4.30. Read: §4.4.8 and §4.4.23 (twisted identification M_HT = M_dR ×^{μ,ℤ_p^×} ℤ_p(1)); Remark 4.4.12; §4.4.38–Theorem 4.4.40; §4.6, Proposition 4.6.12 and its proof, the m = n pushout (pp. 94–95).
- `bp26`: George Boxer, Vincent Pilloni, *Higher Hida theory for Siegel modular forms*, Authors' version from V. Pilloni's homepage (built 5 November 2025, 65 pages; published in Invent. Math. 244 (2026), 45–141); printed page = PDF page. Read: §1.3.9; §3.3 and Remark 3.3.1, pp. 34–35.

Every excerpt in the packet was compared with the text of the version listed (normalised to letters and digits); Milne's notes and a few Annals passages are transcribed from a PDF whose text layer mangles symbols, and were compared by eye. Not read: the published version of Pilloni–Stroh (Ann. Math. Québec 40, 2016), whose numbering differs from the author's version read here; the packet cites the author's version with its own numbering and notes where other papers cite the published numbering.

## Where to resume

The packet is complete at target level; the next step is its independent review. A reviewer should check first: (1) the conventions of S0 and S3 (right actions, `x ↦ x⁻¹`, the cyclotomic twist) against Milne §5, Caraiani–Scholze §2.1 and Boxer–Pilloni §4.4; (2) the S1 chain against Scholze §3.2.5, especially the recorded gap at Lemma 3.2.35 and the issues E7–E11; (3) the Hilbert Weil-pairing and polarization statements of S5 against Birkbeck–Heuer–Williams §8 and the issues E26–E31. Three consumer corrections follow from this work and belong to other jobs: `OverconvergentAutomorphicForms:O8/hodge-frame-transformation` asks for the frame on `π_HT^*W^∨ ≅ h^*ω`, whose transformation law differs from `s·(A + ZC)` by the similitude character `c(γ)` unless the Tate trivialisation is transported with `γ` (see `S3/siegel-graph-chart-and-frame`); `OverconvergentAutomorphicForms:O4/arithmetic-representatives` (and its test `presentation-arithmetic-full`) copies Birkbeck–Heuer–Williams' `Z_∞ = closure of (1 + N𝒪_F)^{×,+}`, which should be the closure of `(1 + N𝒪_F)^×` (PerfectoidShimuraVarieties/E29); and HodgeTateAndCanonicalSubgroups T3/T4 should cite the S1 Frobenius-lift nodes rather than plan them again (third `restructure` entry).
