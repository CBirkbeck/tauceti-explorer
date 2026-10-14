# Review: REV-EndoscopicTransferAndUnitaryTraceComparison--ET.0

Issue [#394](https://github.com/CBirkbeck/tauceti-explorer/issues/394). Independent review by Claude Code (Claude Opus 5.5), session `claude-pIXAiq`, 14 October 2026. The blueprint under review is `BP-EndoscopicTransferAndUnitaryTraceComparison--ET.0` (session `claude-ilrWNW`, atlas PR #9636): the packet, its reader document and its suggested Lean file for stages ET.0, ET.1, ET.2, ET.2a, ET.2a:duality-perversity, ET.2a:pure-decomposition, ET.2b and ET.3.

**Verdict: accepted, with corrections made in place.** The review found five false or misstated results, a circular dependency, two duplications and twelve wrong locators. All of them are fixed in the packet, and the reader matches the corrected packet.

## Counts

| | before | after |
|---|---|---|
| nodes | 61 | 61 (29 corrected, 32 verified, 0 added) |
| API items | 168 | 168 (three group-level items handed to AS.6, three ET items added) |
| unit tests | 101 | 103 |
| acceptance tests | 153 | 154 |
| requests | 24 | 25 (new: AutomorphicSpectralTheory:AS.6) |
| restructure proposals | 4 | 5 (new: AS.6/ET.1 ownership) |
| gaps | 5 | 5 (one extended) |
| source issues | 1 | 1 (confirmed) |

`python3 scripts/check_blueprint.py --index <pinned declarations.tsv>` reports 0 errors and 0 warnings. `research/blueprint/intake.py check-files` passes on the three files.

## How the review was done

- **Sources.** All 24 sources were downloaded from the packet's URLs, and every SHA-256 matches the packet. Per-page text was extracted, and the printed-page offsets were confirmed: Labesse is −7, the Clay volume −13, Kottwitz's base-change paper +235 and LTXZZ +106. The two Math. Ann. scans (Langlands–Shelstad 1987 and Kottwitz 1986) have no text layer, so they were read from GDZ's per-page OCR and from page images.
- **Locators.** Every node locator was read. Haiku agents retrieved the passages; every verdict below is my own reading of the source page.
- **Baseline and anchors.** A Sonnet agent checked the 7 baseline declarations against the pinned Mathlib 082e2d3 tree and the 20 Tau Ceti layer anchors against the atlas snapshot and TauCetiRoadmap main. It also ran a duplication sweep over TauCetiRoadmap main and the current Tau Ceti library.
- **Suppliers.** A second Sonnet agent:
  - found each of the 46 external node prerequisites and read its statement;
  - reconciled the requests with the prerequisites in both directions;
  - collected the consumers of ET.0–ET.3 and the "moved down" records of lower-tier packages;
  - computed the stage cycles.
- **Lean.** The suggested file was elaborated with `lean-check`.
- **Reader.** It was re-rendered by a script that first reproduced the author's reader byte for byte from the author's packet (61 of 61 node sections, 24 of 24 supplier contracts).

## Mathematical corrections

| Node | What was wrong | Correction and evidence |
|---|---|---|
| ET.0/crossed-module-galois-cohomology | Item (5) was false as stated. It claimed a canonical abelian group structure on H⁰ and H¹ whenever ker ∂ is central and coker ∂ is abelian. The kernel of a crossed module is always central, and the crossed module ∂ = 1 : ℤ/3 → ℤ/2 (ℤ/2 acting by inversion, Γ = ℤ/3 acting trivially) satisfies the hypotheses with H⁰ ≅ S₃. This is the counterexample of the confirmed erratum PAPER-KISIN-17/E41, which the node and reader also misreported. | Restated for braided crossed modules, which covers [G_sc → G] and [Z(G_sc) → Z(G)] and every use in the roadmap. API item, proof step and the reader's corrections paragraph updated; unit test `not_abelian_without_braiding` added. |
| ET.0/rational-classes-in-stable-class | (b) identified the dual of E(T, G; F) with all of π₀((T̂/Z(Ĝ))^Γ). | Kottwitz 1986 §4.6 (p. 379): 𝔎(T/F) consists of the classes whose image in H¹(F, Z(Ĝ)) is trivial, equivalently the cokernel of π₀(Z(Ĝ)^Γ) → π₀(T̂^Γ). Also E(T, G; F) = ker[A(T) → A(G)] (§4.4), and "Kaletha Lemma 3.4" is Fact 3.4. |
| ET.1/pseudocoefficients | The orbital integral of the Euler–Poincaré function at an elliptic γ was given as SO_γ(f_ξ) = (−1)^{q(G)} vol⁻¹ tr ξ(γ). | The sign is (−1)^{q(G_γ)}, the sign of Arthur's global term (24.4), and the formula is for O_γ. Check on SL₂(ℝ) with ξ trivial: at regular elliptic γ the orbital integral of a pseudo-coefficient is vol⁻¹ Θ_π(γ⁻¹), with positive sign, by the Weyl integration formula and orthogonality. The packet sum of characters is −1 = (−1)^{q(G)} tr ξ, so O_γ(f_ξ) = vol⁻¹ > 0, consistent with tr 1(f_ξ) = 2. SO_γ sums two equal rational classes. Unit test `eulerPoincare_sl2_elliptic` added; the compact-group test and acceptance now say O_γ. |
| ET.1/local-transfer-factor | (ii) presented the twisted formulas Δ′ = (Δ_I^new Δ_III)⁻¹Δ_II Δ_IV and Δ_D = Δ_I^new Δ_II⁻¹ Δ_III Δ_IV as Kottwitz–Shelstad's correction for standard endoscopy, and said that Δ′ and Δ_D are the factors of (H, s⁻¹, ξ) in the other convention. | KS 2012 §5.1 (p. 12): in standard endoscopy the Langlands–Shelstad Δ is the classical factor; Δ_D changes only Δ_III2 (to ⟨γ, a(χ⁻¹)⟩⁻¹); Δ′ and Δ′_D are Δ and Δ_D of (H, s⁻¹, ξ). The twisted factors (1.0.3)–(1.0.4) reduce to Δ_D and Δ′ (§§5.3–5.4). Both Whittaker formulas (5.5.1)–(5.5.2) are now written out; API items `inv_s` and `convention` and the reader's conventions paragraph corrected. Unit test: |Δ_IV| = |(u − ū)²|_F^{1/2}, since u − ū ∉ F. |
| ET.2b/hitchin-moduli-stack | (c) claimed M smooth at every point when deg D > 2g − 2. | Ngô Théorème 4.12.1 (p. 84) is for points over A^♥ (and over A^ani when deg D = 2g − 2); the hypothesis was restored in the statement, proof step and API item. |
| ET.0/abelianized-cohomology; ET.0/tate-nakayama-tori | H¹(𝔸_F/F, ·) was defined as the cokernel of localization. | It is the cohomology of S(𝔸_F̄)/S(F̄) (Kottwitz) and Labesse's global-mod-local group (after Corollaire 1.6.11, p. 34, with the exact sequence of Proposition 1.6.12, p. 35). It contains the cokernel, and for a torus the two differ by ker²(F, S). The Tate–Nakayama identification holds for the quotient cohomology. |
| ET.0/degree-zero-abelianization | G(ℝ)₊ was "the identity component of G(ℝ), equivalently Z(G)(ℝ)·ρ(G_sc(ℝ))". These differ, for example for G_m. | Van Hoften's convention (§3.4, p. 40): G(ℝ)₊ is the preimage of G_ad(ℝ)⁺ = Z(G)(ℝ)·ρ(G_sc(ℝ)). The node notes that Kisin (3.4.7) uses the identity component instead, and an acceptance test for G_m was added. |
| ET.0/global-kottwitz-obstruction | The statement dropped Kottwitz's standing hypothesis and described (6.10.1) as a definition. | Kottwitz 1986 §6 (pp. 381–384) assumes G_der simply connected and allows γ₀ in a quasi-split inner form; the hypothesis is restored and the case G₀ = G marked. The product formula follows from §6.7; (6.10.1) is a conjecture, proved by Langlands–Shelstad (ET.1/transfer-factor-properties (f)). Typo Ẑ(Î₀) fixed. |
| ET.0/abelianization-theorems | (d) spoke of "the natural map ker¹(F, G′) → ker¹(F, G)" for an inner form. No such map exists. | Labesse Corollaire 1.6.11 (p. 34) is about ker¹_ab; the bijection goes through it. Borovoi's theorem is cited as Kisin does (Thm. 5.12). |
| ET.2b/kostant-section | Said the rational classes in a regular stable class form a torsor under H¹(K, J_a). | Ngô §§1.5.1–1.5.2 (pp. 14–15): they are in bijection with ker[H¹(K, J_a) → H¹(K, G)]; the whole of H¹(K, J_a) classifies pairs (E, φ) with E a G-torsor. |
| ET.2b/regular-centralizer | (f) described J_a by the cameral cover over all of X. | Ngô (1.4.2) and Lemme 1.4.3 (p. 14) give this only over 𝔠^rs. Over X, J_a is an open subgroup of (π_{a,*}(T × X̃_a))^W with the same identity component, by (d). |
| ET.1/shalika-germs | (c) said the regular germ is constant, and the 𝔤𝔩₂ acceptance had the two germs swapped. Both contradict the homogeneity in (c) itself for unnormalized orbital integrals. | Normalized germs as in Kottwitz (17.11.2). For 𝔤𝔩₂ on an elliptic Cartan, Γ₀ is constant and Γ_reg is a constant multiple of \|D\|^{−1/2}, as Kottwitz's GL₂ computation §5.9 (pp. 417–418) shows. |
| ET.1/lie-algebra-transfer-factor | The factor was written as κ(inv(X₀, X))·Δ_IV·c with "c a constant fixed by the choice of base point". | c depends on X_H (a change of base point multiplies by κ(inv(X₀, X₀′))); only the uniform Kostant-section choice fixes it. |
| ET.1/twisted-transfer-factor | Called transpose-inverse on GL(2n+1) "the first case" where Δ_I^new ≠ Δ_I. | KS 2012 introduction (p. 1): the terms differ exactly when the restricted root system is non-reduced (GL(2n+1) is an instance), and never for cyclic base change. |
| ET.0/unitary-elliptic-endoscopic-data | Φ_{n⃗} was called block antidiagonal. | Shin §3.1 (p. 12): Φ_{n⃗} = i_{n⃗}(Φ_{n₁}, …, Φ_{n_r}) is block-diagonal. Because det Φ_m = 1, Shin's constant (a square root of (−1)^{−N} det(Φ_{n₁,n₂}Φ_N), p. 14) equals the stated (−1)^{N}; both forms are now recorded. |
| ET.1/matching-functions | Test `transfer_not_function` used an imprecise example. | Replaced by an explicit SL₂ example. |
| ET.2b/chevalley-quotient | The baseline citations `Matrix.charpoly_monic` and `Polynomial.discr` were not used in the statement. | The GL_n sentence now says χ is monic of degree n and that 𝔇 is the zero locus of the discriminant. |
| ET.3/group-fundamental-lemma | An acceptance test asserted that the residue-characteristic bound "cannot be replaced" by p ∤ \|W\|. | Restated as what the proof uses (Waldspurger 2008 §4.4 (H1)). |
| ET.3/lie-algebra-fundamental-lemma | Proof step 4 cited item (d) of ET.2b/hitchin-point-count, which has no item (d). | It is (c). |
| ET.0/kottwitz-duality | Stray ";." at the end of (b). | Removed. |

## Duplication and ownership

- **Kneser's theorem.** ET.0/abelianization-theorems (a) planned Kneser's local vanishing itself. It is AdelicAlgebraicGroups:AA.4/kneser-local-torsor, which is accepted, promoted, and on TauCetiRoadmap main as AdelicAlgebraicGroups §4.1 "Local H¹ vanishing". The node now imports it; its torsor language agrees with Galois H¹ for smooth affine groups in characteristic 0.
- **Orbital integrals and pseudo-coefficients (AS.6).**
  - **The move.** The upstream order places AutomorphicSpectralTheory in tier 13 and this roadmap in tier 14. The AS package therefore planned these notions itself: the invariant orbital integral (AS.6.8a), the discrete functionals and pseudo-coefficients (AS.6.16a) and the real Euler–Poincaré test functions (AS.6.17). Its handoff asks this roadmap to import them. The AS package's own review was needs_changes for its shape, and that review endorsed the move.
  - **This packet.** ET.1/orbital-integral and ET.1/pseudocoefficients now import these from AutomorphicSpectralTheory:AS.6, with a precise request naming the targets. They keep what ET owns:
    - Waldspurger's normalization;
    - transport of centralizer measures;
    - the Lie-algebra and nilpotent orbital integrals, the Weyl integration formula and semisimple descent;
    - the packet averages and their orbital integrals;
    - the inner-form and twisted versions.
  - **What changed.** Three group-level API items, the duplicates of AS.6.8a's `invariant` and `quotient_measure`, were removed. Three ET items were added, and the group tests were restated for the Lie algebra. The RT-AREA-automorphic-1/24 handling, the ET.1 coverage note, the summary and a new restructure proposal record the change.
- **No upstream duplicates.** The sweep of TauCetiRoadmap main and the Tau Ceti library (at a91d3aa) found no plan of nonabelian H¹, crossed modules, abelianized cohomology, B(G), stable conjugacy, endoscopic data, orbital integrals, transfer factors, the fundamental lemma or the Hitchin fibration. What ET.0 imports from ReductiveGroupsPartII (Kottwitz homomorphism, z-extensions, π₁, dual and L-groups, Lang's theorem) is cited, not planned.

## Closure

- **Circular dependency.** ET.0/abelianization-theorems listed ET.0/kottwitz-duality as a prerequisite, only for a remark in (f). Meanwhile ET.0/kottwitz-duality's proof uses (a) and (d) of abelianization-theorems without listing it. The edge now runs abelianization-theorems → kottwitz-duality, and (f)'s remark says the duality does not use (f). Item (f) stays a recorded gap.
- **Suppliers.** All 46 external node ids exist and state what is used. Spot checks:
  - RG2.1/steinberg-quasi-split gives H¹(L, H) = 1 over the perfect completed unramified field;
  - DWP.8 is stated for schemes, a limitation now added to the Deligne–Mumford gap;
  - SF.1/crossed-module-category is the crossed-module notion;
  - SR.4/satake-isomorphism is Satake.
- **Requests.** They reconcile with the prerequisites in both directions. Three request texts claimed more than the Tau Ceti layer provides and were corrected:
  - Chebotarev layer 10 is for number fields only; the function-field trace comparison is the EDC.7 request;
  - ReductiveGroups layer 2 has no centralizers or regular locus; those are defined in ET.0 and ET.2b;
  - ProfiniteCohomology layers 5 and 10 have abelian coefficients only; the nonabelian parts are planned in ET.0.
- **Cycles.** The packet induces no new stage cycle. The promoted atlas already places all ET stages in one large strongly connected component, independently of this packet.

## Locators and sources

All labels were found at, or within one page of, their locators, except those corrected below:

- Kottwitz 1986: semisimple-conjugacy §4.1 (p. 378); endoscopic triples §5.4 (p. 380); §6 pages.
- Kisin: (3.2.7) does not recall Borovoi 3.8.1–3.8.2; Kisin's own (3.8.1)–(3.8.2) are unrelated. Also the proof of (3.4.11) on pp. 47–48, (3.6.7) on p. 56 and (3.6.8) on p. 57.
- Kaletha: §3.4 is on pp. 15–16, and the inner-twist definition is in §5.1 (p. 28).
- Waldspurger 2006: Théorème 7.2 is on p. 62, not p. 67, and Corollaire 9.3 on p. 71; the readSections were corrected too.
- Hales: Remark 9.3 is on PDF p. 16.
- KS 2012: Proposition 2.2.3 is on PDF p. 5.
- Shin 2011: the unramified case is on p. 16, (3.8).
- The LTXZZ edition note had the offset backwards; it is printed page = PDF page + 106.

Arthur's Clay introduction (2005), p. 203, records the nonarchimedean transfer conjecture as open. ET.3/local-transfer-existence cites it only for the conjecture and for Waldspurger's reduction, and its match now says so.

## Source issues

**E1** (Caraiani–Scholze non-compact, §5.2, p. 67, n₂ ≥ 0 for n₂ ≥ 1) is confirmed at the locator; Shin §3.2 (p. 14) has n₂ > 0. No new mistake is recorded. The packet and reader misstated the content of the existing erratum PAPER-KISIN-17/E41 (see the first table row), and that is now corrected.

## Red-team findings handed to the blueprint

- **RT-AREA-automorphic-1/24.** Handled. The single ownership it fixed is superseded by the tier-order move to AS.6, and each piece still has one owner.
- **RT-AREA-langlands-1/12.** Handled. Bun_G comes from GS.0 and the affine Grassmannian from GS.1; ET.2b constructs only the Higgs, Hitchin, Picard, affine-Springer and support geometry. Function-field adeles come from FA.2.
- **RT-AREA-langlands-1/13.** Handled. The twisted fundamental lemma consumes the non-standard one, and base change needs only the standard one. The ET.5 sentence is flagged in restructure proposal 4.
- **RT-AREA-langlands-1/14.** Handled. KS 2012 is a source; the four standard variants, Δ_I^new and the Whittaker forms are now stated correctly; the GL(2n+1) case is a unit test.
- **RT-AREA-geomlanglands/10.** Handled. z-extensions come from RG2.1, and ET.0 plans only z-pairs and integral z-extensions.

## Baseline citations

The 7 Mathlib declarations are confirmed at 082e2d3 by name, module, kind and statement: `Matrix.charpoly`, `Matrix.charpoly_monic`, `Polynomial.discr`, `MeasureTheory.Measure.IsHaarMeasure`, `LaurentSeries`, `PowerSeries` and `Matrix.IsHermitian`. Two notes:

- `Polynomial.discr` carries the sign normalization of Mathlib's Sylvester-matrix definition.
- `Matrix.IsHermitian` covers the standard Hermitian form; its `provides` text already says so.

None was removed. All 20 Tau Ceti layer anchors exist in the snapshot and on main, with identical headings.

## Suggested Lean file

`lean-check` (Mathlib 082e2d3, shared build) elaborates the file with no errors. The only warnings are the 24 marking unproved statements. One proof obligation inside a statement, the determinant side condition of the unipotent non-example, now has a real proof (`simp [Matrix.det_fin_two_of]`). Nothing else changed. The file is in the compact shape: none of the corrected statements has a carrier at the pins.

## Reader document

The 29 corrected node sections and the 5 changed or new supplier contracts were re-rendered from the packet; the renderer reproduces all 61 sections and 25 contracts. The prose paragraphs that state ownership or conventions were edited to match:

- the scope of ET.0 and ET.1;
- the transfer-factor conventions;
- the list of imports;
- the Deligne–Mumford open input;
- the E41 line of the corrections;
- the AS.6 consumer line;
- the LTXZZ reference.

## Questions for the orchestrator

1. **Outside the upstream order.** GlobalShtukasAndFunctionFieldLanglands (GS.0 Bun_G, GS.1 Beilinson–Drinfeld Grassmannian) and FunctionFieldArithmetic (FA.2 adeles) are not among Caraiani–Newton's 94 roadmaps. ET is tier 14, and ET.2b and ET.3 cite them, as RT-AREA-langlands-1/12 directed. When this roadmap is packaged, these three notions must be moved down into ET or replaced by a supplier in the order. The order file's ET line does not list these citations.
2. **AutomorphicSpectralTheory packet.** The promoted AS packet still requests the unweighted orbital integral and the Euler–Poincaré carriers from ET.1 (requests 12 and 13). With this review, ET.1 requests them from AS.6. The AS package's plan corrections should be carried into the AS packet, and the edge AS.6 → ET.1 drawn (restructure proposal 5).
3. **Tau Ceti anchors.**
   - Upstream since the snapshot: ReductiveGroupsPartII, SmoothRepresentationsOfLocalGroups and AdelicAlgebraicGroups are now on TauCetiRoadmap main, so the package should cite their sections instead of the atlas node ids.
   - Less than the requests claim: the Galois-module structure of tori over a field (ReductiveGroups layer 4), quasi-split forms and pinnings over a non-closed field (layers 7 and 9), and Out-torsors over a curve (layer 9). The package must name the section of ReductiveGroupsPartII, or the target, that supplies each.
4. **Characteristic hypothesis.** The existing gap stands: the roadmap's p > 2h against p ∤ |W| in the version read of Ngô. A reader of Publ. IHÉS 111 can settle it. Note also that Ngô (p. 23) paraphrases Waldspurger's change of characteristic with the hypothesis p ∤ |W|, while Waldspurger 2006 assumes p large relative to the rank (p. 1). The packet follows Waldspurger.
