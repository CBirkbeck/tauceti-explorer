# Independent review: Locally analytic distributions, Part II (noncommutative distribution algebras and microlocalisation)

**Verdict: accepted.** The review is complete; this is not a checkpoint. Claude (session claude-oxcI9M) reviewed the new roadmap designed by Claude (session claude-1t1vpY) in PR #10350 (DESIGN-LocallyAnalyticDistributionsPartII, issue #3374). Refs #3564. Review date: 2026-10-18.

The files under review were the roadmap definition, the blueprint packet, the reader document and the suggested Lean file of `LocallyAnalyticDistributionsPartII`. All four are corrected in place. All 51 nodes were checked: **38 verified, 13 corrected, 0 added, 0 unverifiable**. The one recorded gap is genuine. It is now located more precisely, and the roadmap's end theorem does not depend on it.

| Inventory | Reviewed packet |
| --- | ---: |
| Nodes (definitions / constructions / theorems / lemmas) | 51 (5 / 15 / 30 / 1) |
| API items / unit tests / planets | 128 / 82 (one added) / 26 |
| Baseline declarations | 31 (one added, none removed) |
| Requests / gaps | 6 (one narrowed) / 1 |
| Stages planned / closed | 7 / 0 |
| Source issues | 9 (8 confirmed, 1 added) |

## What was read

- **Fu, arXiv:2201.11190v2.** All of §§1–6, including Theorems 1.5, 4.2, 4.3, 5.1, 5.2, 5.7, Propositions 5.3, 5.5, Lemmas 2.2, 3.3, 4.1, 5.6, Remark 5.8 and §6.
- **Schneider–Teitelbaum, *Algebras of p-adic distributions*, arXiv math/0206056v1.** §3 (pp. 7–14), §4 (pp. 14–28) and §5 (pp. 29–30).
- **Schneider–Teitelbaum, JAMS 2002, arXiv math/9912073v1.** §2 (pp. 6–12) and §3, Lemma 3.1 to Proposition 3.7 (pp. 12–16).
- **Schneider–Teitelbaum, Israel J. 2002, arXiv math/0005066v1.** §2, Theorem 2.3, and §3 (pp. 12–15).
- **Ardakov–Wadsley 2013, arXiv:1102.2606v3.** §2.1–2.6, §3.4–3.9, §10 and §11.1–11.3.
- **Ardakov–Wadsley 2014, arXiv:1308.5104v1.** §§4.4–5.5. The published version (Münster J. Math. 7 (2014), journal PDF) was also read at Lemma 5.2.
- **Ardakov–Brown, arXiv math/0412401v1.** §5.4.
- **Kohlhaase, Duke 2007 (author copy).** §1.4.
- **Schmidt, arXiv:1008.3897v2.** §3.1–3.2 and the statement of Theorem 4.3.3.
- **Boxer–Calegari–Gee–Pilloni, arXiv:2502.20645v1.** §2.2.27–2.2.36.
- **Schneider, *p-Adic Lie Groups*.** §§23, 25–29 (pp. 169–207), read in the maintainer's cleared copy. Printed page = PDF page − 6.

The SHA-256 of every downloaded PDF matches the packet's record. The NSF PAR copy of Fu's published paper could not be reached. Nothing is quoted here or in the corrected files.

### Baseline

All 31 `baseline.declarations` were confirmed:
- in the pinned declaration index;
- by reading their source at Mathlib `082e2d37e8` and Tau Ceti `f790474`.

These include `TauCeti.casimirElement` (the Killing-form Casimir; Δ = 4·Ω was recomputed), `TauCeti.UniversalEnvelopingAlgebra.pbwFiltration`, `TauCeti.IsProP`, `AbstractMeasure` (no convolution at this commit, as the packet says), `OreLocalization.OreSet` (a left Ore set) and `IsRingFiltration`.

One declaration was added: `TauCeti.UniversalEnvelopingAlgebra.span_orderedPBWMonomials_eq_pbwFiltration`. It is the spanning half of PBW, valid over any commutative ring.

### Duplication

Checked against:
- TauCetiRoadmap main at a08dc283: PadicMeasuresIwasawaAlgebras, PadicFunctionalAnalysis, ProfiniteProPGroups, BanachSpaceTheory, RestrictedPowerSeries and RepresentationTheory (LieHighestWeight, CompactGroups, LieGroups). The local checkout is a stale branch, so the files were fetched from GitHub.
- The atlas packets of LocallyAnalyticDistributions, PadicMeasuresIwasawaAlgebras, NoncommutativeAndEquivariantIwasawa and CompletedCohomologyPartII.
- The LocallyAnalyticDistributions package (TauCetiRoadmap PR #854).

Two overlaps were found (findings 1 and 2). Nothing else this roadmap plans exists upstream or in another atlas roadmap:
- noncommutative D(G, K);
- Fréchet–Stein algebras;
- coadmissible modules;
- microlocalisation;
- the Schneider–Teitelbaum Banach duality.

## Findings and corrections

1. **Duplicated convolution (ND.1/distribution-algebra).**
   - LocallyAnalyticDistributions already constructs the convolution product on D(G, K) for a compact analytic group, with associativity and unit, in `LocallyAnalyticDistributions:L1/distribution-convolution`. That packet is accepted and promoted, and the node is in the upstream package's §1.3.
   - Its formula integrates in the other order; the two agree by Fubini through D(G × G) ≅ D(G) ⊗̂ D(G).
   - That node is stated for K finite over ℚ_p and ℚ_p-analytic G. Here G is L-analytic and K spherically complete; the construction is the same.
   - The node now imports it and plans only what it adds: the generality, joint continuity, the Dirac homomorphism with injectivity and density, functoriality and the commutativity criterion.
   - Added: the prerequisite, a compatibility test `convolution_eq_distributionConvolution`, a hypothesis and an ST02 p. 8 source. Stage ND.1 now requires `LocallyAnalyticDistributions:L1`.

2. **Schikhof duality is already planned (ND.6/banach-iwasawa-duality).**
   - The proof of Schneider–Teitelbaum Theorem 3.5 rests on their Theorem 2.3, the G-equivariant Schikhof duality.
   - Its biduality isomorphisms (for torsion-free compact o-modules and o-lattices) are planned in `CompletedCohomologyPartII:CC.3/qualified-biduality`. That node is accepted and is in CompletedCohomologyPartII's TauCetiRoadmap PR #1035.
   - The packet left this implicit. Its remaining list even proposed planning the duality again as a node.
   - Changes:
     - ND.6 now imports CC.3/qualified-biduality.
     - The remaining item now says that a future lemma node is built on the import.
     - Stage ND.6 requires `CompletedCohomologyPartII:CC.3`.
     - The roadmap lists CompletedCohomologyPartII among its prerequisites.
   - restructure[3] said that CC.2 and CC.5 should import ND.6. CC.3 builds on CC.2, so a CC.2 import would close the stage cycle CC.2 → CC.3 → ND.6 → CC.2.
     - The proposal now names CC.5/banach-admissibility, which cites Schneider–Teitelbaum Theorem 3.5 as a source, and R30.2.
     - It says CC.2 must not import ND.6.

3. **Integral PBW (ND.3/completed-enveloping-algebra and the LieHighestWeight request).**
   - LieHighestWeight Layer 3 states the PBW basis theorem over a field only. The request asked it for PBW "over ℤ_p for a free Lie lattice", which it does not plan.
   - The node derived the integral form from gr U(h) ≅ Sym(h), which is the statement to be proved.
   - Corrected derivation:
     - The ordered monomials span U(h) over R, by the pinned Tau Ceti theorem above.
     - They are R-linearly independent because their images in U(h ⊗ K) are, by PBW over the field K.
   - The request is narrowed to the field case.

4. **Base change of Û(h) (same node).** Ardakov–Wadsley Lemma 3.9(c) needs [K′ : K] < ∞, and it sends the n-th deformation to the en-th (e the ramification index). The statement and the API item `baseChange` said "finitely ramified" and omitted the index change. Both are corrected.

5. **Lie modules (ND.4/lie-modules).** Ardakov–Wadsley §11.1 explicitly drops the very-good-prime restriction of §10.12. The statement no longer imposes it, and the hypothesis now says so. The nonsemisimple counterexample K[[ℤ_p]]/((γ − 1)²) is spelt out.

6. **Ramified coefficients (ND.4/isotypic-comparison).**
   - The proof applies Ardakov–Wadsley Proposition 11.1, which is stated for R with uniformiser p.
   - For ramified K the step now runs over ℚ_p by ND.4/microlocal-coefficient-extension. That node is now a prerequisite.
   - Fu applies the proposition over arbitrary finite K; compare source issue E3.

7. **The gap at the radii r_n (ND.5/radius-central-domain, the gap, E5).** The gap is genuine.
   - Separatedness of the weaker-norm filtration on D_r/D_r·a is equivalent to D_r ∩ D_{r′}·a = D_r·a.
   - D_r → D_{r′} is flat but not faithfully flat. For G = ℤ_p, T − t with r′ < |t| ≤ r becomes a unit in D_{r′}. So this does not follow formally.
   - At r_n itself the direct graded argument also fails. There log(1 + X) has principal symbol p^{−n}σ(X)^{p^n}, so the symbol of p²Δ − p²λ is a unit times (½H² + 2EF)^{p^n}. Frobenius is additive in characteristic p, so the graded ring of D^λ_{r_n} has nilpotents.
   - ND.5/small-radius-central (a derived statement, checked) already gives the domain property for r < p^{−1/(p−1)}. For p ≥ 5 this narrows the open range to p^{−1/(p−1)} ≤ r < 1, which still contains every r_n.
   - The node, the gap, the coverage and E5 now say this.
   - The end theorem ND.5/central-injectivity-theorem goes through Ardakov–Wadsley's Verma-module route and does not use the gap.

8. **Smaller corrections.**
   - ND.0/p-valuation: the torsion non-example now proves torsion-freeness, including elements of order prime to p. The old reason did not apply to SL_2(ℤ_p) for p ≥ 5.
   - ND.0/ordered-basis-chart: the discreteness of ω is attributed correctly. Schneider's §26 assumes G profinite.
   - ND.1/iwasawa-to-distributions: L[[G]] consists of the series with coefficients in L that are bounded. "Bounded" alone describes K[[G]].
   - ND.2/faithful-flatness: the consequence for K[[G]]-modules needs K finite over ℚ_p.
   - ND.3/crossed-product-radius: an unsourced parenthetical citing Dospinescu–Le Bras was removed.
   - ND.5/infinitesimal-character-quotients: a garbled description of the generators of ker λ was fixed.
   - ND.5/small-radius-central: at ρ = 1 the graded ring is not the commutative one. The domain property there comes from Fu Lemma 3.3 (last part).

The mathematics of every other node was checked at its locators. Highlights:
- the induced-character criterion: 2λ(Δ) + 1 is a square in ℤ_p;
- Frommer's ℓ_i = p^n and ‖log(1 + b_i)‖_{r_n} = p^{n−1};
- the crossed-product and Auslander–Gorenstein grade argument of Fu's direct route;
- the descent in the end theorem;
- every unit test.

## Source issues

| Issue | Verdict | Note |
| --- | --- | --- |
| E1 | Confirmed | |
| E2 | Confirmed | |
| E3 | Confirmed | |
| E4 | Confirmed | |
| E5 | Confirmed | Reason sharpened as in finding 7. |
| E6 | Confirmed | |
| E7 | Confirmed | Its example was wrong: it used λ_α = p^{|α|}, which gives a null sequence. It is now λ_α = p^{−|α|}. The published Münster version prints the same condition on p. 20. |
| E8 | Confirmed | |
| E9 (new) | Confirmed | Misprint in Fu §6, p. 22. The function x^k is right-invariant under the *upper* triangular unipotent subgroup; the text names a "lower upper" one. The node already uses the correct statement. |

Every verdict carries its reason in the packet.

## Planets, tests and the suggested file

- **Planets:** 26, at most six per layer (ND.2 has six). Every name is drawn from the sources.
- **Tests:** every definition and construction has at least three unit tests, each able to catch a plausible wrong definition. All were recomputed.
- **Suggested file:** it follows the 2026-10-12 shape: light real-bodied definitions over carriers at the pins, theorems with `sorry`, a few examples, and no sorry'd data.
  - Seven API names were missing from both the file and its closing list. They are added to the closing list, with the new test: `PValuation.gr`, `PValuation.restrict`, `DistributionAlgebra.D`, `DistributionAlgebra.map`, `Microlocalization.algebraMap`, `DistributionAlgebra.centralQuotient` and `BanachIwasawa.finrank_gr`.
  - `lean-check` at the pins: the file elaborates, and its only warnings are the 12 declarations using `sorry`.
  - `check_sorry_data` passes.

## Checks run

| Check | Result |
| --- | --- |
| `check_blueprint.py` with `TAUCETI_BASELINE` set to the pinned index | 0 errors, 0 warnings |
| `lean-check` | Elaborates; `sorry` warnings only |
| Dry atlas assembly (`build.assemble` with the packet, reader and definition injected, nothing written) | 33 new stages and planets, 69 new stage edges, none removed, no skipped links |

The two new cross-roadmap edges are `LocallyAnalyticDistributions:L1 → ND.1` and `CompletedCohomologyPartII:CC.3 → ND.6`.

The reader document was resynchronised with the corrected packet from the same per-node template. Before any edit, the template was checked to reproduce all 51 node sections of the original exactly. The layer dependencies, open points, source corrections and boundary sections were regenerated, and the roadmap definition's readme agrees with the document's front matter.

## Questions for the orchestrator

1. **Schikhof biduality.** It now lives in CompletedCohomologyPartII CC.3 (tier 12, upstream PR #1035), and this roadmap imports it from there. CompletedCohomologyPartII's own package says it expects Schikhof duality and Schneider–Teitelbaum Theorems 2.3 and 3.5 from a "foundational owner".
   - If the maintainer wants the biduality to sit with the foundational duality, it should move into ND.6, with CC.3 importing it.
   - restructure[3] records both options. In either case CC.2 must not import ND.6.
2. **Unreviewed supplier.** The NE.0 nodes this roadmap cites live in `NoncommutativeAndEquivariantIwasawa.json`, which is still partial and unreviewed. If that packet renames them, the citations here must follow.
3. **Frommer's preprint.** The 2003 Münster preprint is still unobtained, as the packet records. ND.3/frommer-theorem rests on Kohlhaase's §1.4 summary and proof. A sources job could close this.
