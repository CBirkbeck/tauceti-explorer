# Independent review: ExcursionOperatorsAndSpectralAction, part ES7

Reviewer: Claude, session `claude-Y3Iujd`, 2026-10-07. Job `REV-ExcursionOperatorsAndSpectralAction--ES7`, issue #405. The input was written by Codex sessions (`codex-yiSh7u`, PR #6854, continuing the checkpoint of PR #2866). This reviewer did none of that work.

Verdict: **needs_changes**. This is a finished review, not a checkpoint. Every correction whose fix was clear has been applied to the packet and the suggested file. The verdict rests on three things:

- the reader document `research/blueprint/readmes/ExcursionOperatorsAndSpectralAction--ES7.md` is not a deliverable of this review. It still shows the packet as submitted: the old layer placement, the wrong SW20 citation, the old statements and API names. Promoting the packet with that reader would publish two contradicting documents. The revision round must regenerate it (sync table below);
- the submitted suggested file stated only two algebraic fragments and listed the rest of the packet in an "omission ledger". It has been rewritten here, but its elaboration and naming should be checked again against the synchronized reader;
- one step of the source proof the packet follows (FS IX.7.2, the reduction to quasi-split G) does not work in equal characteristic for groups with non-smooth centre. This is recorded as source issue E2 and gap `z-embedding`. It is not by itself a reason to withhold acceptance, and the parabolic layer’s coverage now says which targets it limits (see "What the revision must do").

## Counts

| | submitted | after review |
|---|---|---|
| nodes | 49 (5 definitions, 6 constructions, 29 theorems, 6 lemmas, 3 comparisons) | 50 (one theorem added) |
| node verdicts | | 43 corrected, 6 verified, 1 added, 0 unverifiable |
| API items / unit tests / planets | 49 / 33 / 21 | 53 / 33 / 21 |
| source citations (excerpts) | 55 | 56; 53 excerpts replaced by passages that show the content; 17 locators corrected |
| baseline declarations | 23 | 30 (3 removed, 10 added, 16 kinds corrected) |
| requests / gaps | 40 / 15 | 32 / 14 |
| source issues | 1 | 9 (E1 confirmed; E2–E9 added and confirmed) |

`python3 scripts/check_blueprint.py` (pinned declaration index): 0 errors, 0 warnings. `scripts/check_errata.py`'s `check` on the packet's issues: no errors.

## Sources read

All seven source files were downloaded again and their SHA-256 values match the packet.

- **Fargues–Scholze**, author manuscript ([PDF](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), `9ab9efbd…`): IX.7, pp. 334–338, read in full by the reviewer; Theorem IX.6.1 (p. 330), Corollary III.4.3 (p. 101), the §I.13 conventions and the bibliography.
- **Hausberger 2005** ([AIF PDF](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), `d51dc221…`): every cited statement and its surrounding proof, §§1, 3, 6–10 and A.12. Printed page = PDF page + 1283. Symbols ∉, ≠, primes and overbars are lost in the text layer; Theorem 10.4(2) was read on the page image (“v ∉ S”).
- **Laumon–Rapoport–Stuhler 1993** (GDZ scan, `05ea7ab8…`): §§4–6, 13, 14.1–14.19, 15.10–15.17 read on the page images (PDF page = printed − 215). The library's OCR (`https://gdz.sub.uni-goettingen.de/gdzocr/PPN356556735_0113/000003NN.xml`) was used only to locate passages.
- **Kaiser, Errata for [LRS]** (`6aa9e01d…`): both pages, on images.
- **Kaletha, JEMS 2018** (`cfd4f90f…`): §2 (standing hypothesis: F p-adic), §5.1, Definition 5.1, Proposition 5.2, Corollary 5.3, Facts 5.4–5.5.
- **Kottwitz, arXiv:1401.5728** (`37c9980b…`): §10.1, Proposition 10.4, Lemma 10.5, Proposition 13.1.
- **Scholze–Weinstein, Berkeley lectures** (`22550517…`): Theorem 24.2.5 (p. 227) and §24.3 through Corollary 24.3.5 (p. 231).

Every replacement excerpt from a text-layer source was checked programmatically against `pdftotext` output (NFKC, whitespace removed); LRS and Kaiser excerpts were transcribed from the page images.

## Main corrections

### 1. The two function-field layers depended on each other

`ES7:function-field-automorphic` held the D-elliptic cohomology nodes (global cohomology, the geometric trace identity, the dual pairing, the three Kaiser nodes, the selected middle cohomology), which need the D-elliptic moduli of `ES7:equal-characteristic`; and `ES7:equal-characteristic` held the local character identity that the function-field layer's simple trace comparison and transfer use. Together with the atlas edge function-field-automorphic → equal-characteristic this was a layer cycle. The seven cohomology nodes now live in `ES7:equal-characteristic` (whose description asks for "purity, finiteness, automorphic decomposition" and contains the Kaiser paragraph), and `local-character-identity` lives in `ES7:function-field-automorphic`. Their ids changed accordingly; no other packet referenced them.

### 2. The characteristic-zero layer depended on the equal-characteristic layer

`ES7:GLn-comparison` ("Proved characteristic-zero agreement") had `equal-characteristic/hecke-fibre-transport` and `equal-characteristic/classical-local-correspondence` among its prerequisites, against the layer descriptions (the equal-characteristic layer is to "repeat ES7:GLn-comparison's trace argument"). Now:

- `two-leg-excursion-is-a-trace` is stated for an abstract two-operation realization, so both characteristics use it;
- `supercuspidal-agreement` and `all-irreducible-representations` are stated for E of characteristic zero;
- the added node `equal-characteristic/equal-characteristic-agreement` is the equal-characteristic half of FS IX.7.4;
- `ES7/agreement-for-every-local-field` combines the two halves, and `classical-centre-agreement` (FS's remark after IX.7.4, valid for every E) moved to layer ES7.

### 3. SW20 Theorem 24.2.5 has no "O_E-module form"

`two-tower-realisation`, the ET.6a request, gap `mixed-tower` and the RT/2 structural note cited "SW20 24.2.5 in its O_E-module form". Theorem 24.2.5 (p. 227) is for p-divisible groups over ℤ_p and `GL_n` over ℤ_p, i.e. E = ℚ_p. For E ≠ ℚ_p the relevant statement is Corollary 24.3.5 (p. 231) for the EL data of `Res_{E/ℚ_p}GL_n` (Lubin–Tate side) and of D (Drinfeld side), plus the identification of `Res_{E/ℚ_p}GL_n`-shtukas with `GL_n/E` local shtukas. All four places now say so. This agrees with the RT/2 verifier's refinement ("the Drinfeld side needs 24.3.5").

### 4. The quasi-split reduction in equal characteristic

FS (proof of IX.7.2, p. 335) take "a z-embedding G ↪ G′ as in [Kal18, Section 5]" for every E. Kaletha's §5 assumes F p-adic. In characteristic p with Z(G) not smooth (e.g. SL_p), no embedding with torus quotient D and Z(G′) a torus has Z(G′)(E) → D(E) surjective: the cokernel injects into ker(H¹_fppf(E, Z(G)) → H¹(E, Z(G′))), and H¹_fppf(E, μ_p) = E^×/E^{×p} is infinite while H¹ of a torus is finite. The packet's gap asked to "extend Definition 5.1/Fact 5.5 to equal characteristic", which is impossible in that case. The node now restricts the z-embedding to p-adic E and cites FS IX.6.1 (stated for maps inducing an isomorphism of adjoint groups, which a z-embedding is) rather than "isogeny functoriality". The gap and the ES6 request now ask for the smooth-centre extension plus a different argument for non-smooth centres. The issue is recorded as E2. The ES5 packet's E5 already restricts IX.6's use of z-embeddings to p-adic fields; E2 is the IX.7.2 step, with the obstruction.

### 5. Statements corrected against the sources

- `special-formal-modules`: D^× acts on Ω̂^d ⊗̂ Ô^nr only through Frobenius on Ô^nr (Hausberger Prop. 7.6), so O_D^× acts trivially on the formal scheme. The node had claimed these actions are not O^nr-linear.
- `local-correspondence-independence`: LRS 15.13–15.14 prove independence over the globalizations of one fixed global setup, not of the curve.
- `cuspidal-local-selector`: LRS use the matrix-coefficient map φ(A)(g) = tr(π(g^{-1})A), and f acts by 0 on every other irreducible admissible representation, not only on "incompatible supercuspidals". The node said "compact induction".
- `kaiser-graded-chain-lemma`: the hypothesis is LRS 14.13's relation ~ (equal orders at T = q_∞^n), of which a Laurent-monomial difference is a special case.
- `moduli-and-hecke`: only I ≠ ∅ is needed; Hausberger 6.4 represents special D-elliptic sheaves and is not smooth at o.
- `uniformisation` and `geometric-hochschild-serre`: Theorem 8.3 phrases the covers by restriction of scalars (Res′ enters in §§9–10), and the coefficient space is a space of automorphic forms on Z_{I^o}, not a representation.
- `jacquet-langlands-transfer`: S is any finite set outside which D splits.
- Every node's `hypotheses` was one of two boilerplate sentences; each now states the hypotheses of that node (field, group, coefficients, levels, places).
- 17 locators were corrected: for example, LRS Theorem 14.9 is on pp. 297–298, 13.6 is a Proposition, 15.14 a Corollary, Theorem 5.1 is on p. 241, and the Hausberger Hecke excerpt was not on the cited pages (it is §6.3, pp. 1315–1316).

### 6. Suppliers made exact

The protocol asks for a supplier's node wherever one exists. The following stage citations were replaced by nodes that state exactly what is used, and their requests (GS4:integral-dual-group, EDC.8, R02.2, DWP.5, BG2, VS3, FA.5, LP2:semisimple-characters) were withdrawn. `SR.0` became its child stage `SR.0:abelian-category`.

- GS4:integral-dual-group → `levi-naturality`, `dual-group-identification`, `normalized-satake-equivalence`.
- HS4 generic node → also `HS4/levi-compatibility` (constant terms) and `HS4/creation-annihilation-and-triangles` (two-leg).
- HS2 → `HS2/framed-bundle-fibres` for the modification spaces of IX.7.2/IX.7.3.
- VS3 → `VS3/lisse-comparisons`, `VS4/compact-generation-and-compact-objects`.
- BG2 → `BG2:uniformization/bun-g-as-v-stack` and `HS0/structure-group-and-inner-form`.
- EDC.8 → `correspondence-composition`, `correspondence-pushforward`, `correspondence-trace`, `lefschetz-verdier-formula`, `similitude-reciprocal-charpoly`.
- EDC.2 for rigid spaces → `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image` and `H3/berkovich-derived-duality-interface`; for the pairing, `EDC.2:pairings/adic-and-rational-poincare-duality`.
- R02.2 → `R02.2/first-quadrant-spectral-sequence`. DWP.5 → `DWP.5/local-monodromy-purity` (DWP.7's global purity was cited for the purely local chain lemma).
- LP2 (and the finite-group Tau Ceti theorem) → `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces`, which states trace determination for any group with d! invertible. Gap `trace` is closed by it.
- The number-field recognition node and FA.5 → `R01.5/curve-recognition-from-an-open-subset`.
- `stratum-maps` now cites `ES5/stratum-centre-embedding-independence` and `ES0:classical-center/map-to-the-classical-bernstein-center`; `two-leg` cites `ES0/excursion-datum-and-operator` instead of the ES1 node for ℓ | |π₀Z|, irrelevant to GL_n.
- `normalised-induction-dictionary` cited `ES6:functoriality/central-characters-and-twisting`, which contains no twisting theorem; it now cites `ES6:functoriality/twisting-by-abelianized-characters`. `drinfeld-carayol` no longer cites it (its twist is the classical one).
- The global restricted Haar product (AA.0) was cited by four purely local nodes; they now cite a local Haar measure. AA.0 stays where adelic measures are used (`kernel-trace-identity`, `division-quotient-compactness`), as RT/12 asks.

Every remaining stage prerequisite has a request whose `neededBy` is exactly its consumers (checked mechanically).

## Baseline citations

All 23 submitted entries exist at the pinned commits with the stated module; 16 of those kept had the non-Lean kind `declaration` (or a wrong one) and were given their actual kind. Removed: `tauceti:Representation.nonempty_equiv_of_character_eq` (needs `[Finite G]`; W_E is infinite), `mathlib:Module.Projective` (the degeneration needs injective objects), `mathlib:CategoryTheory.Preadditive` (replaced by `Abelian.Ext`). Added, each read at the pin: `CategoryTheory.CatCenter`, `CategoryTheory.Functor.FullyFaithful`, `coevaluation`, `Representation.ind`, `Algebra.IsCentral`, `Submodule.IsLattice`, `Module.Invertible` (the right notion for "Lie H invertible", where `Module.Free` was cited), `CategoryTheory.Injective`, `CategoryTheory.Abelian.Ext`, `MeasureTheory.Measure.haar`. `modularCharacter`'s convention (`map (·*g) μ = Δ(g)•μ`) agrees with δ_P on P = MU. The reviewed audit (AUDIT-20 via `data/library-coverage.json`) finds all five layers not built; nothing planned here is in the libraries.

## Source issues

- **E1** (LRS 14.11/14.16 self-duality; Kaiser's correction) — **confirmed** on the images; locator tightened (Corollary 14.11 is on p. 299).
- **E2** (FS IX.7.2 proof, z-embeddings in equal characteristic) — added, gap; see §4 above.
- **E3** (LRS p. 291: F^×\𝔸^×/ϖ_∞^ℤ printed "finite"; it is compact and infinite) — added, misprint.
- **E4** (LRS 14.13–14.14, p. 302: factor printed (1 − q^{−d}T), against 14.16 and Kaiser's (1 − q^{−d}T^{−1})) — added, misprint.
- **E5** (LRS 14.16 cites "(14.10)(ii)" for 14.11(iii)) — added, misprint.
- **E6–E9** (Hausberger: 9.2(ii) χ ∈ A⁰_d for A⁰_1; Lemma 10.2 A⁰_n for A⁰_d; Σ(Π) defined from V^d for V^{d−1}; §7.2 "proposition 3.4" for Théorème 3.4) — added, misprints.

Further slips noticed but not recorded (no mathematical content or not settled): Hausberger Def. 9.3 defines Ψ^i_d "pour i = d − 1" and uses it for all i; the proof of Lemma 10.14 concludes from Lemma 10.15 (projectivity) where Remark 10.16 (injectivity) is what is used; the end of §10.4 switches j ↔ 2(d−1)−j and π ↔ π^∨ without comment.

## Red-team findings handed to the blueprint

- **/2** (classical tower comparison): the packet follows the verifier's option (a), ET.6a owns it; corrected as in §3. Note for the orchestrator: the unreviewed HeckeStacksAndLocalShtukas packet now has `HS3/classical-comparison` (SW 24.2.5 for ℚ_p, depending on ET.6a), which does not match the RT/2 fix's assignment. ES7 keeps ET.6a.
- **/7**: `stratum-maps` cites the ES1 spectral-to-geometric node. The edge ES1:spectral-center → ES7:parabolic is same-roadmap, so promotion will not draw it; it is listed in the packet's `restructure` (kind `stage-edges`) with the two other undrawn same-roadmap edges.
- **/9**: the SR.1 request asks for the Λ-linear centre, its pro-p corner limit and ℓ-adic separatedness; correct.
- **/11**: the reduction is planned (node `basic-case-and-quasisplit-reduction`), with the BG1 request for Kottwitz 10.4 plus κ (Prop. 13.1) and the ES6 request. The equal-characteristic part is now precise (§4).
- **/12**: function-field-automorphic imports FA.2/FA.6/AA.0/AA.1 and plans only the D-specific results. After the moves of §1 its nodes are maximal orders, compactness, spectrum, kernel trace formula, EP functions, simple comparison, globalization, transfer, selectors and the local character identity.

The reader repeats the submitted text on /2 and does not mention /7.

## Granularity, API, unit tests, planets

The roadmap is planned at target level; each node is a target or a key definition or theorem on the way. No proof was split into lemma nodes. The API outlines cover constructors, projections, functoriality and the key compatibilities. Added: `restrictCentre`/`restrictCentre_app` (the construction behind Ψ_G^b), `DOrder.units_isCompactOpen`, `DEllipticLevel.unitAction`. The API `U`, `U.*` was renamed `FundamentalLocalRepresentation`, `FundamentalLocalRepresentation.*`. Every definition and construction has three tests that a plausible wrong definition fails (rank/degree values, a non-example, a compatibility). Planets: 5, 3, 6, 6 and 1 per layer after the moves, named from the sources.

## Suggested Lean file

The submitted file stated two algebraic fragments (ring-map composites and the twisted cocycle formula) plus numerical checks, and listed everything else in a comment ledger: 9 of the 11 definitions and constructions and all 38 theorems, lemmas and comparisons were not stated, against PROTOCOL §13. Its `cocycleMap.conjugation` was also wrong: it conjugated φ(w) by m on both sides, ignoring the Weil action, which is not the conjugation of cocycles.

The file has been rewritten (Mathlib imports only, namespace `TauCeti.ES7`). A shared section introduces the objects no pinned library has as opaque carriers attached to their genuine parameters (local field, reductive group, Kottwitz class, coefficient ring, curve, place, division algebra), each with a docstring naming its owning layer. Nodes are then stated about these specific carriers, never about arbitrary maps supplied as hypotheses. Where Mathlib has the notion it is used: `CatCenter`, `Functor.FullyFaithful`, `coevaluation`, `LinearMap.trace`, `Representation`, `Matrix.GeneralLinearGroup`, `Algebra.IsCentral`, `Subalgebra`, `Module.Invertible`, `LaurentSeries`, `GaloisField`. Several pieces are genuine definitions with complete proofs, among them `restrictCentre` (restriction of the centre along a fully faithful additive functor, with its ring-map laws), the cocycle lemmas, the two-leg scalar identity and the numerical normalisation tests. Every definition and construction node has its signature, every packet API item a declaration under its packet name, every unit test an `example` under a comment with its packet name, and every theorem, lemma and comparison node a `theorem` named by its slug. Conditions that need a missing carrier are left out and named in the docstrings; no `True` statement, no opaque `Prop`, no hypothesis equal to its conclusion is used. The z-embedding carrier is restricted to characteristic zero, in line with source issue E2.

The file was compiled with `lean-check` (pinned Mathlib 082e2d3, more than 20 GB of memory free): it elaborates with `declaration uses 'sorry'` as its only warning. It has about 600 declarations and 53 examples (4,685 lines). A script checked that every node of the corrected packet has a declaration whose docstring names it, and that every API item and unit test appears under its packet name. Tau Ceti is not imported: the shared build's Tau Ceti is not the pinned commit, and the cited Tau Ceti declarations were read in source at f790474.

Points found while writing the file, now reflected in the packet: `DEllipticLevel.unitAction` is an action of the finite group 𝒟_I^× (a general unit of 𝒟_I ⊗ O_S does not preserve t∘τι = ι); D-elliptic sheaves are defined for central simple D (needed for `matrix_case`), division being a hypothesis only where used; for regular elliptic γ the Kottwitz sign in `euler-poincare-orbital-integrals` is +1 (the (−1)^{d−1} belongs to the character identity).

## What the revision must do

The packet is corrected in place; the revision regenerates the reader from it and rechecks the suggested file. The reader must change as follows.

| Reader content | Change |
|---|---|
| Layer sections | `global-cohomology`, `geometric-automorphic-trace`, `dual-isotypic-pairing`, `kaiser-erratum`, `kaiser-graded-chain-lemma`, `kaiser-graded-chain-proposition`, `selected-isotypic-cohomology` move from the function-field-automorphic section to the equal-characteristic section (new ids `…:ES7:equal-characteristic/<slug>`); `local-character-identity` moves the other way; `classical-centre-agreement` moves to the ES7 section. |
| New node | `ES7:equal-characteristic/equal-characteristic-agreement`. |
| Statements | two-tower-realisation, two-leg-excursion-is-a-trace, supercuspidal-agreement, all-irreducible-representations, agreement-for-every-local-field, basic-case-and-quasisplit-reduction, special-formal-modules, moduli-and-hecke, jacquet-langlands-transfer, uniformisation, geometric-hochschild-serre, local-correspondence-independence, cuspidal-local-selector, kaiser-graded-chain-lemma, kaiser-graded-chain-proposition, trace-determines-semisimplification, geometric-automorphic-trace. |
| Hypotheses, sources | Every node: specific hypotheses; 53 excerpts and 17 locators. |
| Prerequisites | The supplier swaps of §6 (all nodes listed in the per-node table as “prerequisites made exact”). |
| API and tests | `restrictCentre`, `restrictCentre_app`, `DOrder.units_isCompactOpen`, `DEllipticLevel.unitAction` added; `U`, `U.*` renamed `FundamentalLocalRepresentation`, `FundamentalLocalRepresentation.*`. |
| Requests | GS4:integral-dual-group, EDC.8, R02.2, DWP.5, BG2, VS3, FA.5, LP2:semisimple-characters withdrawn; SR.0 → SR.0:abelian-category; texts of ET.6a, ES6:functoriality, VS4, EDC.2, WC.2, HS2, BG0 rewritten. |
| Gaps | `trace` closed; `z-embedding`, `mixed-tower`, `equal-transport`, `weights`, `classical-local`, `local-geometry`, `prototypes` rewritten; coverage `remaining` lists follow the moves. |
| Source issues | E1 review verdict; E2–E9. |
| Structure | `restructure`: the stage-edges entry; the shared-node and RT/2 notes rewritten. |
| Conventions paragraph | Remove “SW20 24.2.5 in its O_E-module form”; state the characteristic split of IX.7.4 as in §2. |

Beyond the reader:

- In equal characteristic the target IX.7.2 (hence IX.7.3 and IX.7.4 for groups other than GL_n) is planned only for G with smooth centre until gap `z-embedding` finds an argument. For GL_n itself the centre is smooth and the reduction is not needed, so the GL_n targets are unaffected. The parabolic layer's coverage entry now says so.
- Re-run `lean-check` on the suggested file after the reader sync, if any name changes.

## Questions for the orchestrator

1. Three same-roadmap layer dependencies are not drawn by promotion: ES1:spectral-center → ES7:parabolic (RT/7), ES0:classical-center → ES7:parabolic, and ES7:GLn-comparison → ES7:equal-characteristic. They are acyclic and recorded in the packet's `restructure`. Please declare them.
2. The ES0 and ES5 packets together induce the cycle ES6:functoriality → ES7:parabolic → ES6:duality → ES6 → ES6:functoriality (ES5 nodes parented at ES6 are prerequisites of ES6:functoriality nodes). It does not come from ES7, but ES7:parabolic lies on it.
3. RT/2's fix gives the classical tower comparison to ET.6a, yet the unreviewed HeckeStacksAndLocalShtukas packet has `HS3/classical-comparison` (depending on ET.6a). One owner should be chosen; ES7 keeps ET.6a.
4. Several requests ask stages for things outside their stated scope: BG4 (quantitative bounded-modification estimate; no owner anywhere), HS2 (equal-characteristic formal O-modules; no owner), AA.1 (number fields only), SR.3 (complex coefficients only), DM.7 (Morita interface), WC.2 (pair L-functions and Laumon's product formula), AS.0, SR.1, FA.6. They are precise and recorded, but the owners' layer descriptions do not yet promise them.
5. ES1 has no node for Λ-base change of the excursion action without the centre-order condition, which `coefficient-reduction` uses.

## Per-node check

Ids are abbreviated to `<layer>/<slug>` (layer `ES7:…` or `ES7`).

| Node | Verdict | Check or correction |
|---|---|---|
| `ES7:parabolic/stratum-maps` | corrected | FS Def. IX.7.1 and the following paragraph (p. 334) read: Ψ_G via j_!, Ψ_G^b via the fully faithful embedding (left adjoint to i_b^*), all choices giving the same map. Added exact suppliers ES5/stratum-centre-embedding-independence and ES0:classical-center/map-to-the-classical-bernstein-center, Mathlib CatCenter/FullyFaithful, and API restrictCentre(_app); excerpt replaced. Centre-order condition is FS IX.5.2’s. |
| `ES7:parabolic/twisted-levi-inclusion` | corrected | Formula (2ρ_Ĝ − 2ρ_Ĝb)(√q)^{\|w\|}φ(w), \|geometric Frobenius\| = 1 checked (p. 334, §IX.7.1, not Definition IX.7.1); GS4 stage replaced by GS4 levi-naturality and dual-group-identification, which state t_G/t_M = (2ρ̂_G − 2ρ̂_M)(κ(w)) centralizing M̂. GL₂ test diag(√q, 1/√q) checked. |
| `ES7:parabolic/coefficient-reduction` | corrected | Matches the opening of the proof of IX.7.2 (p. 335): torsion coefficients, excursion algebra when ℓ \| \|π₀Z\|, ℓ-adic separatedness for Λ = ℤ_ℓ[√q]. VS3 stage replaced by VS3/lisse-comparisons and VS4/compact-generation-and-compact-objects. The Λ-base change of the excursion action without the centre-order condition is not stated by the cited ES1 node (recorded in the report). |
| `ES7:parabolic/basic-case-and-quasisplit-reduction` | corrected | Checked FS p. 335, Kaletha Def. 5.1/Fact 5.5 (p-adic only, induced torus required for a z-embedding), Kottwitz Prop. 10.4 (central torus extensions, any local field). Statement now restricts the z-embedding to p-adic E, cites FS IX.6.1 for adjoint-isomorphism maps, adds HS0 and BG2 node suppliers; the equal-characteristic step is source issue E2 and gap z-embedding (no such embedding exists when Z(G) is not smooth). |
| `ES7:parabolic/increasingly-unstable-sequence` | corrected | b_N = bμ(π^N), G_{b_N} = G_b, unique modification of type μ^N, HN preservation for large N: FS pp. 335–336 (locator was p. 336). HS2/framed-bundle-fibres and GS4/normalized-satake-equivalence replace stage citations. μ is central in its centralizer Levi automatically. |
| `ES7:parabolic/constant-term-computation` | corrected | Theorem IX.7.2 and the P/M Hecke diagram (pp. 336–337) checked, including CT_P(S_V) up to [deg_P] with cyclotomic twist and the degree-zero component. Added HS4/levi-compatibility and GS4/levi-naturality (exact suppliers). |
| `ES7:parabolic/parabolic-induction` | corrected | Corollary IX.7.3 and proof (p. 337): unnormalized Ind, σ = c-Ind_K^{M(E)}Λ, b = μ(π^{-1}), T_{μ^{-1}}(A)\|Bun^1 = Ind σ(−d/2)[−d], modification space G(E)/P(E). HS2 stage replaced by HS2/framed-bundle-fibres; excerpt replaced. |
| `ES7:parabolic/normalised-induction-dictionary` | corrected | Independently checked on GL₂: δ_B^{1/2} corresponds to Frobenius ↦ diag(q^{-1/2}, q^{1/2}) = c^{-1}, so normalized induction uses the ordinary inclusion; unnormalized trivial principal series has diag(√q, 1/√q). FS states only the unnormalized result (match text says so). Mis-cited ES6 central-character node replaced by ES6:functoriality/twisting-by-abelianized-characters; GS4 by its levi-naturality node. |
| `ES7:GLn-comparison/two-tower-realisation` | corrected | FS p. 338 read. SW20 Theorem 24.2.5 is for p-divisible groups over ℤ_p only (E = ℚ_p); there is no ‘O_E-module form’ of it in SW20. Statement, ET.6a request and gap mixed-tower now cite 24.2.5 for ℚ_p and Corollary 24.3.5 (EL data of Res_{E/ℚ_p}GL_n and D) otherwise. GS4 stage replaced by normalized-satake-equivalence. |
| `ES7:GLn-comparison/two-leg-excursion-is-a-trace` | corrected | Restated for an abstract two-operation realization (FS p. 338 argument; trace tr ρ(γ₁γ₂^{-1}) and ab = 1 checked by hand). Realization prerequisites removed so the characteristic-zero layer no longer depends on the equal-characteristic layer; ES0/excursion-datum-and-operator and HS4/creation-annihilation-and-triangles cited (the ES1 coefficient-condition node was irrelevant here). |
| `ES7:GLn-comparison/trace-determines-semisimplification` | corrected | ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces already states the lemma for any group with d! invertible; it replaces the LP2 citation and request and the finite-group Tau Ceti theorem (which needs [Finite G]). Gap ‘trace’ removed as supplied. |
| `ES7:GLn-comparison/supercuspidal-agreement` | corrected | Restricted to characteristic zero with two-tower-realisation as a direct prerequisite; direct-summand argument checked against FS p. 338. |
| `ES7:GLn-comparison/all-irreducible-representations` | corrected | Restricted to characteristic zero (ET.6 classical LLC); the reduction via supercuspidal support and normalized induction is equivalent to FS’s use of IX.7.3. |
| `ES7:function-field-automorphic/maximal-orders` | corrected | Hausberger §1.1 (p. 1291) fixes 𝒟 as data; maximality and existence are the node’s additions (gap orders). Added Mathlib Algebra.IsCentral and Submodule.IsLattice citations and API DOrder.units_isCompactOpen; excerpt replaced. |
| `ES7:function-field-automorphic/division-quotient-compactness` | verified | LRS p. 291 asserts compactness of D^×\D_𝔸^×/ϖ_∞^ℤ for division D split at ∞; discreteness and the D̄ case are standard additions (match text says so). LRS’s ‘finite’ for F^×\𝔸^×/ϖ^ℤ is source issue E3. Excerpt/locator replaced; statement unchanged. |
| `ES7:function-field-automorphic/discrete-spectrum` | corrected | LRS p. 291 gives the algebraic decomposition with finite multiplicities; SR.0 citation narrowed to the child stage SR.0:abelian-category. L²/tensor-product parts are standard (AS.0 request). |
| `ES7:function-field-automorphic/kernel-trace-identity` | verified | Display (13.5), p. 291, matches; kernel/integrability details are the node’s own and correctly flagged. Excerpt/locator replaced; statement unchanged. |
| `ES7:function-field-automorphic/euler-poincare-function` | corrected | Formula Σ_{I⊂Δ}(−1)^{\|Δ−I\|}χ_I/((\|Δ−I\|+1)vol(𝒫_I⁰)), sign character of the vertex permutation, normalizer vs pointwise stabilizer: LRS §13.1 p. 290 checked. Global restricted Haar product replaced by Mathlib Measure.haar (a local volume). |
| `ES7:function-field-automorphic/euler-poincare-orbital-integrals` | corrected | Theorem 13.2(i), p. 290 checked (vanishing on non-elliptic, Kottwitz sign, f̄_∞ = 1/vol). Global Haar product replaced by the local Haar measure; transfer of centralizer measures stays in gap EP. |
| `ES7:function-field-automorphic/euler-poincare-character-traces` | verified | Theorem 13.2(ii) checked: trivial 1, Steinberg (−1)^{d−1}; LRS assert in one sentence that Kottwitz’s characteristic-zero assumption is unused (match text corrected). Excerpt/locator replaced; statement unchanged. |
| `ES7:function-field-automorphic/simple-trace-comparison` | verified | LRS 15.10 uses only the GL_d simple trace formula; the D^× comparison is Henniart A.4 via 15.11, already gap simple-transfer. Match text corrected. Excerpt/locator replaced; statement unchanged. |
| `ES7:function-field-automorphic/globalisation` | verified | Lemma 15.10 (p. 314) checked: Π_∞ ≃ St, Π_{x₀} ≃ π, Π_{x₁}, Π_{x₂} supercuspidal, x₃ elliptic support; excerpt replaced by the statement. Excerpt/locator replaced; statement unchanged. |
| `ES7:function-field-automorphic/jacquet-langlands-transfer` | corrected | Hausberger 10.4(2) (page image: ‘v ∉ S’) and Lemma 10.3, LRS 15.11 checked; S is a finite set outside which D splits, not literally Ram(D). LRS and this packet use opposite letters Π/Π̃ (noted). |
| `ES7:equal-characteristic/D-elliptic-sheaf` | verified | Hausberger Def. 1.1 checked (t from τE_{i−1} to E_i in the source; the node’s relabelling is consistent), rank d², periodicity, cokernel ranks d, zero avoiding ∞ and R, χ(E_0) ∈ [0, d). Excerpt replaced. Excerpt/locator replaced; statement unchanged. |
| `ES7:equal-characteristic/level-structure` | corrected | Hausberger §1.3 (p. 1293) checked; restriction for I′ ⊃ I is §6.3, p. 1315. API DEllipticLevel.unitAction added. |
| `ES7:equal-characteristic/moduli-and-hecke` | corrected | Hausberger 6.1/6.4 and LRS 4.1/5.1/6.1 checked: only I ≠ ∅ is needed (‘sufficiently small’ removed); 6.4 represents SPECIAL D-elliptic sheaves and is not smooth at o; LRS Theorem 5.1 is on p. 241 and projectivity uses Corollary 6.2. |
| `ES7:equal-characteristic/frobenius-hecke-correspondences` | corrected | Locator fixed to Hausberger §6.3 pp. 1315–1316 (the excerpt was not on the cited pp. 1338–1339); EDC.8 stage replaced by EDC.8 correspondence-composition/pushforward; AA.0 vocabulary citation removed. |
| `ES7:equal-characteristic/special-formal-module` | corrected | Hausberger Def. 3.1 checked. ‘Lie H invertible O_d ⊗ B-module’ is Mathlib Module.Invertible, not Module.Free (citation replaced). |
| `ES7:equal-characteristic/special-formal-modules` | corrected | Theorems 3.4, 7.2 and Propositions 7.5–7.6 checked. The claim that the O_D^× action is not O^nr-linear was wrong: D^× acts on Ω̂^d ⊗̂ Ô^nr only through Frobenius on Ô^nr (Prop. 7.6), so O_D^× acts trivially there; corrected. |
| `ES7:equal-characteristic/uniformisation` | corrected | Theorems 8.1/8.3 and §8.1 checked: D̄ swaps the invariants at o and ∞, Z_I = D̄^×(F)\D̄^×(A^∞)/K_I^{∞,o}; Theorem 8.3 phrases the covers by restriction of scalars and §§9–10 use Res′ (statement now says so). Locator pages fixed. |
| `ES7:equal-characteristic/fundamental-local-representation` | corrected | §9.2, Def. 9.3 checked (Res′ ℤ-indexed coproduct, P_d = {det(g)Nrd(b)Cl(w)^{-1} ∈ O^×}, Cl(geometric Frobenius) = uniformizer). API/test names `U.*` renamed FundamentalLocalRepresentation.*; rigid compact support cited from ClassicalAdicEtaleCohomology:H3 and compact induction from Mathlib Representation.ind. |
| `ES7:equal-characteristic/local-cohomology-finiteness` | corrected | Prop. 10.6(i) and the Prop. 9.4 admissibility caveat checked; EDC.2/EDC.8 replaced by H3/proper-support-direct-image (rigid-analytic compact support). |
| `ES7:equal-characteristic/global-cohomology` | corrected | Moved to ES7:equal-characteristic (D-elliptic cohomology needs that layer’s moduli). LRS §§14.1–14.2 and Theorem 14.9 (pp. 297–298, locator fixed) and Hausberger Theorem 10.1 checked. |
| `ES7:equal-characteristic/geometric-automorphic-trace` | corrected | Moved to ES7:equal-characteristic. LRS 13.6 is a Proposition and 14.9 is on p. 297 (locator fixed); EDC.8 stage replaced by correspondence-trace and lefschetz-verdier-formula. The Steinberg-isotype formula holds for almost all o (LRS 14.9(ii)); statement corrected. |
| `ES7:equal-characteristic/dual-isotypic-pairing` | corrected | Moved to ES7:equal-characteristic. Kaiser does not state the Π/Π^∨ pairing; it is the standard Poincaré-duality consequence (match text says so). EDC.2/EDC.8/WC.2 replaced by EDC.2:pairings/adic-and-rational-poincare-duality and EDC.8/similitude-reciprocal-charpoly. |
| `ES7:equal-characteristic/kaiser-erratum` | corrected | Moved to ES7:equal-characteristic. Kaiser p. 1: L_x(V•, q_x^{-d}T^{-1}) → L_x(V•∨, q_x^{-1}T^{-1}) in statement and proof, checked on the image. |
| `ES7:equal-characteristic/kaiser-graded-chain-lemma` | corrected | Moved to ES7:equal-characteristic. Hypothesis restated with LRS 14.13’s relation ~ (equal orders at T = q_∞^n); the Laurent-monomial form was stronger. DWP.7 (global purity) replaced by DWP.5/local-monodromy-purity. |
| `ES7:equal-characteristic/kaiser-graded-chain-proposition` | corrected | Moved to ES7:equal-characteristic; restriction to the decomposition group at ∞ made explicit; DWP.5 node cited. |
| `ES7:equal-characteristic/selected-isotypic-cohomology` | corrected | Moved to ES7:equal-characteristic. LRS 15.12 (pp. 316–317) and remark, Hausberger Prop. 10.5 checked; number-field recognition node and FA.5 replaced by R01.5/curve-recognition-from-an-open-subset. |
| `ES7:equal-characteristic/local-correspondence-independence` | corrected | LRS 15.13 and Corollary 15.14 (pp. 317–318) prove independence only within one global setup; statement corrected (it claimed independence of the curve). |
| `ES7:equal-characteristic/classical-local-correspondence` | corrected | Hausberger 9.2 and LRS 15.14–15.17 checked; surjectivity via Henniart’s numerical theorem stays in gap classical-local. Recognition citation made the curve version. |
| `ES7:function-field-automorphic/local-character-identity` | corrected | Moved to ES7:function-field-automorphic (it was in the equal-characteristic layer but used by that layer’s simple trace comparison and transfer, which made the two layers depend on each other). Hausberger 9.1 (Badulescu) checked: characters agree up to (−1)^{d−1} on associated regular elements. RG2.5 and the global Haar product removed. |
| `ES7:equal-characteristic/geometric-hochschild-serre` | corrected | Prop. 10.6(ii), Cor. 10.7, Rem. 10.8, A.12 checked; A_{D̄} is the space of automorphic forms on Z_{I^o} trivial at ∞ (statement corrected). Suppliers made exact: R02.2/first-quadrant-spectral-sequence, H3 proper support and Berkovich duality, Mathlib Abelian.Ext. |
| `ES7:equal-characteristic/hochschild-serre-and-degeneration` | corrected | Lemmas 10.14–10.15, Rem. 10.16, Prop. 10.17 checked; the argument needs injectivity of finite representations (Rem. 10.16), so Mathlib CategoryTheory.Injective replaces Module.Projective. |
| `ES7:equal-characteristic/drinfeld-carayol` | corrected | Theorem 9.5 (p. 1337) and the final proof (pp. 1356–1357) checked, twist \|·\|^{(1−d)/2}; the mis-cited ES6 central-character node removed (the twist comparison used is the classical one, Hausberger 9.2(ii)). |
| `ES7:equal-characteristic/hecke-fibre-transport` | corrected | FS give no equal-characteristic identification (gap equal-transport, now naming Boyer [Boy99] for the Lubin–Tate side); GS4 stage replaced by normalized-satake-equivalence. |
| `ES7:equal-characteristic/equal-characteristic-agreement` | added | Added: the equal-characteristic conclusion that ES7:equal-characteristic states (‘repeat ES7:GLn-comparison’s trace argument’) had no node. FS cite [Boy99] and [Hau05] for the equal-characteristic towers. |
| `ES7/agreement-for-every-local-field` | corrected | Theorem IX.7.4 holds for every E (FS §I.13 convention). Prerequisites are now its two halves. |
| `ES7:function-field-automorphic/cuspidal-local-selector` | corrected | LRS pp. 314–315: matrix-coefficient map φ(A)(g) = tr(π(g^{-1})A) [Be-Ze], f acts as π(1_K) on π and 0 on every other irreducible, f(1) = c^{-1}dim π^K. Statement corrected (it said compact induction and only ‘incompatible supercuspidals’); local Haar measure cited. |
| `ES7/classical-centre-agreement` | corrected | Moved to layer ES7 (FS’s remark after IX.7.4 holds for every E) with agreement-for-every-local-field as prerequisite; integral refinement (Helm–Moss) correctly not upgraded to an integral LLC. |
