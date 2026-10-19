# DESIGN-HermitianKTheoryOfPoincareCategories

Claude (session `claude-JQBZPP`), 2026-10-19, issue #3346, branch `claude-JQBZPP-design-hermitian`. One sitting.

## Deliverables

- `research/blueprint/roadmaps/HermitianKTheoryOfPoincareCategories.json` — roadmap definition, area `ktheory`, no parent (see the restructure note on Part II status), nine stages HK.0–HK.8.
- `research/blueprint/packets/HermitianKTheoryOfPoincareCategories.json` — complete target-level packet: 62 nodes (48 theorems, 7 constructions, 6 definitions, 1 comparison), 78 API items, 49 unit tests, 26 planets (at most 6 per layer), 16 baseline declarations, 2 requests, 6 gaps, 7 source issues, 2 restructure proposals, 2 upstream notes, and `routedItems` mapping all 104 routed items.
- `research/blueprint/readmes/HermitianKTheoryOfPoincareCategories.md` — the reader, generated from the packet with hand-written front matter (scope against the neighbours, conventions, layer overview, how the four main proofs are assembled, identities checked, corrections table).
- `research/blueprint/suggested/HermitianKTheoryOfPoincareCategories.lean` — 274 lines in the compact shape.

`python3 scripts/check_blueprint.py research/blueprint/packets/HermitianKTheoryOfPoincareCategories.json --index …/declarations.tsv`: 0 errors, 0 warnings. A separate depth-first check of the stage graph (node-level dependencies and `requires`) finds no intra-roadmap cycle; every node-level dependency between stages is listed in `requires`.

## The scope decision

The brief (PAPER-CALMES-ETAL-26, route 1) was written when nothing in the atlas owned Poincaré ∞-categories. Since then GeometryOfNumbersAndQuadraticArithmetic Layer 6 (TauCetiRoadmap PR #851, head d63953a, read via the GitHub API) has absorbed the foundations: §6.8a plans Poincaré ∞-categories, Poincaré objects and isotropic surgery, invertible modules with involution, D^p(R), the family Q^{≥m}_M, the GW and L spectra, Poincaré–Verdier sequences, the fundamental fibre sequence, Hebestreit–Steimle, the heart Witt groups (CDH III Corollary 1.3.8) and Corollary 1.3.15; §6.10a states the ℤ-instances of Theorem 5 and of Corollaries 1.2.12/1.3.9/Remark 1.3.16; §6.10b the two-inverted comparison. The handoff of FIX-PKG-GeometryOfNumbersAndQuadraticArithmetic~adv records that this subset moved there from "HermitianKTheoryOfPoincareCategories". This design therefore imports all of that and plans:

| Layer | Content | Paper |
| --- | --- | --- |
| HK.0 | module-with-involution operations, flavour notation, Tate collapse criterion, shift periodicity, opposite ring, GW^{[n]} and symplectic forms | R.2, R.4, R.6, R.7, R.9, R.11, R.12 |
| HK.1 | Met(C,Q), Bott–Genauer, GW(Met) ≃ K and fgt/hyp, Karoubi periodicity without 2, its special cases, bordism-invariant periodicity | R.8–R.10; CDH I 2.3.5, 2.3.7; CDH II 1.2.5, 3.5.8, 4.3.1–4.3.4 |
| HK.2 | r-symmetric/m-quadratic, bounds for Q^{≥m}, opposite bounds, width criterion, Lemma 1.2.10 | 1.1.1–1.1.8, 1.2.10 |
| HK.3 | cobordism presentation of L_n, Lagrangian surgery, L^{a,b}_n, Witt group = L^{0,0}_0, strictly metabolic 1-quadratic = hyperbolic, L^{a,a} ≅ L^{a,a+1} | 1.1.9–1.1.15, 1.2.1–1.2.5, 1.2.14 |
| HK.4 | quadratic surgery, representatives, Cor 1.2.12, Witt groups in degree 0, controlled variants, Ranicki's short groups, Theorem 5 and its steps, Ranicki's quadratic groups | 1.2.6–1.2.25 |
| HK.5 | ring spectra: setting, π₀ recognition, surgery, HA 7.2.2.19, Prop 1.2.29, Cor 1.2.30/Ex 1.2.31, Cor 1.2.33, Ex 1.2.35 | 1.2.26–1.2.35 |
| HK.6 | coherent rings/global dimension, Postnikov t-structure on D^p(R), t-structured bounded L, Prop 1.3.1, Cor 1.3.3, Cor 1.3.4 | 1.3.1–1.3.7 |
| HK.7 | Cor 1.3.9, Theorem 6, sharpness, right-coherent, Dedekind, 2-torsion-free, form parameters, Burnside, L-groups of fields in every flavour | 1.3.9–1.3.18 |
| HK.8 | Theorem 1, quadratic fibre sequence, Karoubi's splitting after inverting 2, Theorem 3 | Intro pp. 2–4 |

Routed items: 9 are pure GN imports (items 12, 100, 102, 108, 109, 119, 214, 269, 271), 10 combine a GN import with a node here, and 85 map to nodes only; `routedItems` in the packet lists them all.

## Requests

- `GeometryOfNumbersAndQuadraticArithmetic:GN.6` — existing upstream roadmap (PR #851), cited as it stands; the request lists the §6.8a/§6.1a/§6.4/§6.10a/§6.10b declarations used.
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4…` — the Witt ring of a field, cited as it stands.

Other suppliers are cited by packet node id: EnhancedDerivedSheaves E0/E5 (stable categories, spectra, modules, compact objects), RefinedTraceMethods RT.2 (orbits, fixed points, norm/Tate, Tate of Eilenberg–Mac Lane, Tate diagonal, vanishing on induced objects), GeneralAlgebraicKTheoryPartII KII.0/KII.3 (K of stable ∞-categories, bounded t-structures), StableHomotopyKTheory H.4 (group completion), ChromaticHomotopyTheory CH.11 (ko), GN.6 packet nodes (exact Witt/GW groups, Lagrangians, diagonal Lagrangian, hyperbolic space, genuine-L invert-two comparison). TauCetiRoadmap main roadmaps GeneralizedCohomology (Postnikov covers, ring spectra) and BordismFormalGroups F6.5 (Borel C₂-actions) postdate the atlas snapshot and are named only in prose, through GN's adapters.

## Gaps (all recorded in the packet)

G1 Lin's theorem (no atlas owner); G2 Ranicki–Shaneson splitting, Read's ℤ/4 and Schlichting 2025 (quoted in the sharpness node only); G3 π_*(ko^{tC₂}) (CH.11 builds ko, not its Tate construction); G4 Schlichting's equivalence between form parameters and degree-two polynomial functors; G5 odd genuine L-groups as formation groups (left to the reader by the source); G6 the two-inverted genuine comparison inherits GN §6.10b's open Paper IV input.

## Source issues

E1–E3 are the accepted extraction's E1–E3 (Corollary 1.2.12 misprint, Proposition 1.3.1 printed for D^p(R), "Remark 1.1.6"). E4 (Example 1.3.11: L^gs_{−2}(𝔽₂) = 0, not L^gs(𝔽₂) = 0), E5 (Corollary 1.3.10's "By Theorem 1" should be the fibre sequence of Paper II), E6 (Remark R.7 needs the Frobenius-twisted module structure on R[2]) and E7 (Remark 1.3.17 needs coherent of global dimension ≤ 1, not "1-dimensional") were raised by the red team RT-PAPER-CALMES-ETAL-26 (review #4030 pending) and were checked here against the printed pages before use. E5 and E7 are visible on pp. 31 and 32; E4 by computing L^gs_0(𝔽₂) = W(𝔽₂) = ℤ/2; E6 by b(rx,rx) = r²b(x,x) (stated and proved in Suggested.lean as `bilin_diag_smul`).

## Restructure proposals

1. Keep the id; record that RT-PAPER-CALMES-ETAL-26/6 argues for Part II status under GeometryOfNumbersAndQuadraticArithmetic. Since GN already has a Part II, a retitle would make this "Part III: algebraic surgery and the flavours of L-theory" with GN as parent; the maintainer decides. The mathematics does not change.
2. Retarget the consumers that named this roadmap without stage ids: GeometryOfNumbersAndQuadraticArithmeticPartII gap G1 (DA.0, DA.1) and the KTheoryFiniteLocalFields foundation gap, to the nodes listed in the packet.

## Upstream notes (for GN reviewers)

- PR #851 §6.8a states CDH III Corollary 1.3.15 with only a citation; its proof is the coherent-ring surgery chain HK.6–HK.7. GN may want the Dedekind-ring surgery input stated in §6.8a/§6.10a.
- §6.10a's ℤ-statements are specialisations of HK.4/HK.7 nodes; no duplication, but consumers should cite the general nodes.

## Lean

`lean-check research/blueprint/suggested/HermitianKTheoryOfPoincareCategories.lean` (shared build, Tau Ceti f790474 + Mathlib 082e2d3; `import Mathlib` and `TauCeti.RepresentationTheory.Homological.TateCohomology.LowDegree`): exit 0, only `declaration uses sorry` warnings. Contents: `IsLeftCoherentRing`, `HasGlobalDimensionLE` with Noetherian/semisimple/Dedekind statements and tests; `IsConcentratedIn`, `IsNDimensional`, the one-sided width criterion; the width bounds of Definition 1.2.1 with `decide` tests; the numerical cores of Propositions 1.2.6 and 1.3.1 proved by `omega`; the comparison ranges with their values (`decide`/`omega`); `bilin_diag_smul`, `skew_diag_two_torsion`, `even_form_alternating_charTwo` proved; Ĥ^{−1}(C₂;ℤ) = 0 from Tau Ceti. Everything whose carrier is not at the pins (Poincaré categories, Q^{≥m}, L- and GW-spectra, bounded L-monoids) is a README target, not a declaration.

## Independent cross-check before submission

Two read-only Sonnet agents checked all 62 nodes against the source pages: locators, ranges, hypotheses, signs, proof arithmetic, and every concrete test value. All locators were on their cited pages and all numerical ranges recomputed correctly. Eight issues were found; each was verified against the paper and fixed:

- **HK.0/shift-periodicity:** the twisting coefficient for a double shift is 𝕊^{1−σ}⊗M with the genuine part suspended once (CDH I, Prop. 3.5.3 with n = 1), not 𝕊^{2−2σ}⊗M. The node also now cites Lemma 3.5.1.
- **HK.1/karoubi-periodicity-special-cases:** the third equivalence also needs Q^{≥3}_{−R} = Q^{≥2}_{−R}, which follows from Ĥ^{−2}(C₂;−R) = 0.
- **HK.2/opposite-ring-bounds:** the acceptance check is now restricted to M = R. For a line bundle L, L^∨ = L^{−1}.
- **HK.3/widen-lagrangian-bound:** the M-compatibility hypothesis is now explicit.
- **HK.4/ranicki-short-complexes:** Ranicki's section numbers are corrected: complexes and Wu classes are in §1; pairs, cobordism and the L-groups are in §3. The cobordism witness is now written in the paper's convention.
- **HK.7/sharpness-examples:** the sharpness of the L^gq bijectivity bound is now stated; it follows from the Σ⁴-periodicity.
- **HK.7/field-l-groups:** the ε = −1 case had its residues exchanged.
- **HK.8/quadratic-symmetric-gw-comparison:** the unsupported sharpness claim is removed, and the form-parameter version is limited to the ranges d + 2 and d + 3.

A Paper II citation in HK.1/forgetful-hyperbolic-sequence was also corrected (Cor. 4.3.1 rests on its Ex. 2.3.3 and Cor. 3.1.5).

An own-words check found no shared run longer than 77 characters between the reader and the three papers, apart from the author list and title.

## Sources read

CDH III arXiv v4 (SHA-256 matches the extraction) pp. 1–34 in full; CDH I v3 pp. 21, 23, 36–38, 43, 47, 52–53, 59, 68, 73–74; CDH II v5 pp. 20, 87, 100–101, 106–107; Ranicki, *The algebraic theory of surgery I* (author archive), §§1, 3 and the statement of Proposition 4.5; Lurie, *Higher Algebra* (2017), Corollary 7.2.2.19, pp. 1245–1246. Not read: Hebestreit–Steimle (used only through GN), Lin 1980, Weiss–Williams, Dotto–Ogle, Read 2024, Schlichting 2025 (all quoted only).

## What a follow-up should do

Each stage is `planned`; the `remaining` lists in `coverage` are lemma-level refinements plus the gaps above. A package job would compress the reader into TauCetiRoadmap form; until GN's PR #851 merges, the imports from GN §6.8a are contracts against that PR's head.
