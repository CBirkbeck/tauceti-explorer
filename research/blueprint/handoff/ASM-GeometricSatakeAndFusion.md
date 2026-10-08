# Handoff: ASM-GeometricSatakeAndFusion (issue #235)

This job assembles the roadmap *Geometric Satake over the Fargues–Fontaine curve* (`GeometricSatakeAndFusion`) from its two reviewed parts. It is a complete assembly, not a checkpoint.

Worker: Claude (Claude Code, Opus 5.5), session `claude-7BPrLf`, 8 October 2026. This session wrote neither part nor either review. (An earlier session of the same worker slot, `claude-XcD1F2`, wrote the GS3 revision BP-GeometricSatakeAndFusion--GS3~2.)

- Part GS0 (layers GS0–GS2, 62 nodes): BP-GeometricSatakeAndFusion--GS0~2, accepted by REV-GeometricSatakeAndFusion--GS0~2.
- Part GS3 (layers GS3–GS4, 32 nodes): BP-GeometricSatakeAndFusion--GS3~2, accepted by REV-GeometricSatakeAndFusion--GS3~2.

No review verdict, review record or source-issue verdict is changed.

## Files

- `research/blueprint/readmes/GeometricSatakeAndFusion.md`: the roadmap document, about 58,000 words. Its declaration blocks are generated from the two packets as corrected here, so the document and packets agree by construction. A scripted check finds every node id, title, statement, hypothesis, proof step, prerequisite, acceptance item, use, API item, unit test, locator, non-boilerplate match, prototype note, planet, declaration name, gap, request, coverage item, source issue, structural proposal, upstream note and baseline declaration of both packets in the document; all 1,140 internal links resolve. Hand-written sections give the purpose and scope, boundaries (suppliers by roadmap, consumers from the atlas links and other packets, and an assessment of the twelve requests other packets address to this roadmap), reconciled conventions and notation, sources, the library baseline, a layer overview with the order of construction and the main path, an introduction to each of the fourteen layers, dependencies, coverage, and what the plan does not claim. The 30 hypotheses shared by all GS3–GS4 declarations are stated once as S1–S3, and the boilerplate GS0 source match is stated once under Conventions. Process history and review records are left out of the document; they stay in the packets, reviews and this note.
- `research/blueprint/suggested/GeometricSatakeAndFusion.lean`: the two part files joined (1,500 lines): one standard note, one import block (36 Mathlib and 4 Tau Ceti modules, the deduplicated union), one namespace `TauCeti.GeometricSatake`, the GS0–GS2 body and the GS3–GS4 body in their own sections with their own `open`s and options. No declaration is renamed apart from the namespace, and none is duplicated.
- `research/blueprint/packets/GeometricSatakeAndFusion--GS0.json` and `--GS3.json`: bookkeeping and citation edits listed below.
- This note.

The part documents and part Lean files are unchanged; the assembled document replaces them for readers.

## Edits to the part packets

The queue lists both packets as outputs of this job. The edits are below. Items 1–4 are bookkeeping. Items 5–8 touch reviewed nodes. **Re-review is requested** for item 5 (added prerequisites), item 6 (one proof-step citation) and item 7 (one typo). No statement, hypothesis or acceptance item changes mathematically.

1. **One namespace (GS0).** GS0 named its declarations, API items and tests `TauCeti.Suggested.GeometricSatake.*`, although its own `library.namespace` and all of GS3 use `TauCeti.GeometricSatake`. 208 names (62 declaration names, 73 API names, 72 test names, one prototype note) now use `TauCeti.GeometricSatake.*`. The Lean file follows.
2. **Distinct source-issue ids (GS3).** Both parts numbered their source issues `GeometricSatakeAndFusion/E1…`, so eleven ids were shared by different findings in the errata register. GS3's issues are renumbered E25–E35; each keeps its verdict and records its former id in `recordedAs`. Two GS3 findings duplicate GS0 findings: E34 (formerly GS3 E10) = E1 (Zhu's coweight order, PAPER-ZHU-17/E2), and E35 (formerly GS3 E11) = E10 (Zhu's opposite filtration, PAPER-ZHU-17/E51). Both carry `sameAs`. They are kept, not deleted, because each carries its own review verdict. The six "source issue E<n>" references in GS3 node text are updated; those that pointed to the duplicates now cite E1 and E10. GS3's review notes and the GS3 review report still use the old numbers; the table is:

   | Former GS3 id | New id | Kind | Locator | Note |
   | --- | --- | --- | --- | --- |
   | E1 | E25 | misprint | Author-hosted 356-page PDF, VI.11.1 rank-one proof, printed p237 |  |
   | E2 | E26 | misprint | Chapter VI, §VI.10, proof of Proposition VI.10.2, p. 234 (author-hoste… |  |
   | E3 | E27 | misprint | Chapter VI, §VI.10, proof of Proposition VI.10.2, p. 234, first senten… |  |
   | E4 | E28 | misprint | Chapter VI, §VI.11, proof of Lemma VI.11.3, p. 237 (author-hosted 356-… |  |
   | E5 | E29 | misprint | Chapter VI, §VI.11, proof of Theorem VI.11.1, p. 237, last paragraph (… |  |
   | E6 | E30 | misprint | Chapter IX, §IX.6.2, Proposition IX.6.2, p. 331, top row of the diagra… |  |
   | E7 | E31 | misprint | Chapter IX, §IX.6.2, Proposition IX.6.2, second paragraph, p. 331 (aut… |  |
   | E8 | E32 | error | Chapter VI, §VI.11, Lemma VI.11.2 and its proof, p. 237 (author-hosted… |  |
   | E9 | E33 | misprint | §0.2 pp407–408, setting of Theorem 0.3 (publisher PDF) |  |
   | E10 | E34 | misprint | §0.5 p412, the dominance order on coweights | same as E1 |
   | E11 | E35 | error | proof of Corollary 2.10, p436 (publisher PDF) | same as E10 |

3. **Routed coverage (GS0).** Five `routedCoverage` entries (PAPER-ZHU-17 T03, T04, T06, T07 and the dual-group item) named the nonexistent layer `GS4:dual-group-reconstruction`; they now name `GS4:integral-dual-group`.
4. **Two structural proposals added** (proposals 5 and 9 below; one in each packet). Both come from the layer-level cycles under Dependencies.
5. **Cross-part citations (GS3), 31 prerequisites added.** These GS3 declarations used or restated GS0 results without citing them; each added id is an existing GS0 node whose statement supplies what the GS3 node uses (checked against the statements). The prerequisites are appended; none is removed.
   - `GS3:fusion/disjoint-leg-locus`: `GS0:loop-geometry/ordered-leg-base-change`, `GS0:loop-geometry/local-hecke-stack`.
   - `GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`: `GS1/perverse-descent-and-shifted-ct`.
   - `GS3:fusion/fusion-product-and-sign-rule`: `GS2:correspondences/satake-fibre-functor`, `GS2:correspondences/convolution-associativity-and-unit`.
   - `GS3:fusion/finite-set-functoriality-and-constant-terms`: `GS0:loop-geometry/ordered-leg-base-change`, `GS0:loop-geometry/grassmannian`.
   - `GS3:fusion/drinfeld-fibre-realization`: `GS2:correspondences/satake-fibre-functor`.
   - `GS3:fusion/symmetric-constant-term`: `GS2:correspondences/satake-verdier-duality`, `GS2:correspondences/satake-fibre-functor`.
   - `GS3:fusion/fusion-verdier-duality`: `GS2:correspondences/satake-verdier-duality`, `GS2:Satake-closure/satake-rigidity`.
   - `GS4:integral-dual-group/tannakian-left-adjoint`: `GS1/standard-costandard-objects`, `GS1/standard-costandard-torsion-bound`, `GS2:correspondences/satake-fibre-functor`.
   - `GS4:integral-dual-group/relative-tannaka-hypotheses`: `GS2:correspondences/satake-fibre-functor`.
   - `GS4:integral-dual-group/multileg-and-coefficient-reconstruction`: `GS1/standard-costandard-torsion-bound`, `GS2:correspondences/satake-fibre-functor`.
   - `GS4:rational-reductivity/rational-semisimplicity`: `GS1/standard-costandard-torsion-bound`, `GS2:Satake-closure/one-leg-satake-comparison`, `GS0:Witt-geometry/perfect-model-and-etale-comparison`.
   - `GS4:rational-reductivity/witt-rational-tannakian-category`: `GS1/standard-costandard-torsion-bound`.
   - `GS4:integral-dual-group/rank-one-integral-identification`: `GS2:Satake-closure/one-leg-satake-comparison`.
   - `GS4:integral-dual-group/adjoint-isomorphism-naturality`: `GS0:loop-geometry/grassmannian`, `GS0:loop-geometry/schubert-bounds-and-properness`.
   - `GS4:integral-dual-group/product-naturality`: `GS0:loop-geometry/grassmannian`, `GS0:loop-geometry/schubert-bounds-and-properness`.
   - `GS4:integral-dual-group/weil-restriction-naturality`: `GS0:loop-geometry/grassmannian`, `GS0:loop-geometry/schubert-bounds-and-properness`.
   - `GS4:classical-Satake-comparison/normalized-frobenius-function`: `GS0:Witt-geometry/perfect-model-and-etale-comparison`.
   - `GS4:classical-Satake-comparison/trace-convolution`: `GS0:Witt-geometry/perfect-model-and-etale-comparison`.
6. **One proof-step citation (GS3).** In `GS4:integral-dual-group/witt-rational-satake-equivalence`, the splitting of the semi-infinite filtration was credited to "the Satake fibre functor node", whose statement says it gives no canonical splitting. It is now credited to "the symmetric constant-term node, through F ≅ F_T ∘ CT_B[deg]", which the node already cites.
7. **Typo (GS3).** `GS4:integral-dual-group/levi-naturality`: "ĤM" → "M̂" (two occurrences in the statement).
8. Nothing else in either packet changed. The checker gives 0 errors and 0 warnings on both.

## Cross-part prerequisites

- GS0 never cites GS3. Every GS3 prerequisite that is a GS0 id names an existing GS0 node.
- **One cross-part need has no node:** `GS4:integral-dual-group/rank-one-integral-identification` cites the layer `GS2:correspondences` with request R3.21. It needs the modular Hom-to-top-Borel–Moore identification for the minuscule PGL₂ convolution, and gap G3.11 records it. No GS0 node supplies it: `rational-special-fibre-convolution` is rational only. The fix is not clear enough for an assembly, since it would need a new GS0 node. **The next plan of GS2:correspondences should add this declaration**, after which R3.21 and the stage prerequisite become an exact node id.
- **Restated content.** `GS4:rational-reductivity/rational-semisimplicity` restates the special-fibre semisimplicity and IC classification that `GS1/standard-costandard-torsion-bound` already states. GS3's EDC.7 request R3.9 overlaps GS0's direct use of `EtaleDualityAndPerverseSheaves:EDC.7/proper-direct-image-decomposition`. The node now cites the GS0 node (item 5). A revision of the GS3 part should narrow its statement to the new content (transport to the Satake category over the leg base, no Weil semisimplicity) and merge R3.9 into the GS0 use.
- **Gap G3.3** says the early Satake node does not isolate the uniform ℓ-torsion bound for Δ_μ → ∇_μ. `GS1/standard-costandard-torsion-bound` does state that bound, and `tannakian-left-adjoint` and `multileg-and-coefficient-reconstruction` now cite it. The coefficient inverse-limit and F-split coequalizer parts of G3.3 remain open. A revision should narrow the gap text.
- **Facts used without a declaration.** The document records three facts that GS3–GS4 use, that follow from GS0–GS2, and that no declaration states. First, F commutes with the one-leg restrictions. Second, S_λ ∩ Gr_{≤μ} is empty unless λ_dom ≤ μ. Third, S_μ ∩ Gr_{≤μ} is irreducible of dimension ⟨2ρ,μ⟩. They belong in the next plan of GS1/GS2.
- **Notation.** IC_μ is untwisted in GS0–GS2 and in the rational GS4 nodes, but means IC_μ(d_μ/2) in `normalized-frobenius-function`, `normalized-satake-equivalence` and `classical-satake-comparison`. The document says so under Conventions. A revision of GS3 could write IC_μ^♮ for the twisted object. The other notation differences are reconciled in the document's notation table; none is a convention conflict. These cover divisor subscripts, Hck^I_G, Sat_G(S,Λ), F/F^I/F_W/H* and CT_P with named maps p⁺ and q⁺.

## Dependencies

The union node graph is acyclic, also together with every other packet on main. Three layer-level conflicts are recorded in the document:

1. GS2:Satake-closure → GS3:fusion is what the nodes use. The atlas has the reverse edge GS3:fusion → GS2:Satake-closure (proposals 3 and 6).
2. GS0:loop-geometry ↔ GS0:Witt-geometry, through `affine-flag-demazure` using `parahoric-ind-projectivity` (new proposal 5: give it the aggregate parent GS0; it keeps its planet, since GS0:Witt-geometry and GS1 already have six).
3. GS4:integral-dual-group ↔ GS4:rational-reductivity, through the four reconstruction nodes (new proposal 9: a sub-layer GS4:reconstruction).

## Structural proposals of the parts

1. **rescope** (GeometricSatakeAndFusion, SchemeAndStackFoundations; part GS0–GS2). Make SF0/SF1 the single owner of perfect pfp models/effective quotient and boundary pinching theory, SF3/SF4 the owner of general bundle descent and SF5 the owner of all general positivity/Keel theory. GS0:Witt-geometry owns their determinant-line and projectivity application. Remove the old text “sub-obligation here” and add the supplier edges. RF2’s finite-thickening descent is imported; RF4 must supply its separate completed-module algebraization and Tannakian torsor transfer. *Status:* Awaiting the maintainer (SF supplier ownership).
2. **rescope** (GeometricSatakeAndFusion, AdicCoefficientsAndComparisons, EtaleDualityAndPerverseSheaves, VStackSheavesAndLisseCategories; part GS0–GS2). GS0 imports L1 scheme diamondification and D6 pre-adic diamondification/topological comparison; do not declare nonanalytic v-sheaves diamonds without an additional representability theorem. GS1 imports early L1/L3 and EDC5 perversity/recollement. Drop EDC4 and VS3 lisse-category prerequisites here. EDC7 appears only in rational standard/costandard torsion refinement; it does not precede GS0 smoothness. *Status:* Awaiting the maintainer (L1/D6/EDC/VS supplier interfaces).
3. **rescope** (GeometricSatakeAndFusion; part GS0–GS2). Reverse the atlas edge GS3:fusion→GS2:Satake-closure. FS VI.8.1–VI.8.2 prove closure and duals first; VI.9 then uses dualizability. VI.8.1(ii) uses an elementary two-leg collision family, which is explicitly planned here, but not VI.9’s coherent symmetric fusion. Keep GS2:correspondences before closure and closure before GS3; generic bounded properness and integral Witt properness remain distinct targets. *Status:* Same proposal as 6. Awaiting the maintainer: the atlas still has GS3:fusion → GS2:Satake-closure.
4. **rescope** (SchemeAndStackFoundations, RelativeFarguesFontaine, VStackSheavesAndLisseCategories, EnhancedDerivedSheaves, ReductiveGroupsPartII; part GS0–GS2). Refine existing supplier directions by the exact requests in this packet. In particular Scheme and stack foundations, Part II: perfect models, pinching and integral local-model functoriality extends SF0/SF1/SF4; Relative Fargues–Fontaine, Part II: punctured A_inf torsors extends RF4; V-stack sheaves and lisse categories, Part II: hyperbolic localization and proper relative ULA kernels extends VS1; Enhanced derived sheaves, Part II: coherent kernel correspondences extends E3/E5; Reductive groups, Part II already owns parahoric/affine-root and adjoint comparisons. These are extensions of the named owners, not new GS-owned general theories. *Status:* Awaiting the maintainer (supplier Part II refinements; the requests state the contracts).
5. **sublayers** (GeometricSatakeAndFusion; part GS0–GS2). GS0:loop-geometry/affine-flag-demazure uses GS0:Witt-geometry/parahoric-ind-projectivity, while GS0:Witt-geometry/integral-family-bounded-properness uses GS0:loop-geometry/ordered-leg-base-change and schubert-bounds-and-properness, so the induced layer edges GS0:loop-geometry -> GS0:Witt-geometry -> GS0:loop-geometry form a cycle. The affine flag declaration is used only by GS1 (ULA-sheaves-on-the-hecke-stack, rational-weight-concentration). *Proposal:* Give GS0:loop-geometry/affine-flag-demazure the aggregate GS0 as parent layer, keeping its identifier and its planet "Demazure spaces" (GS0 has no planets; GS0:Witt-geometry and GS1 already have six each). The layer edges then run GS0:loop-geometry -> GS0:Witt-geometry -> GS0 -> GS1. *Status:* New with this assembly. Awaiting a structure job.
6. **rescope** (GeometricSatakeAndFusion; part GS3–GS4). RT-AREA-geomlanglands/1: the atlas edge GS3:fusion→GS2:Satake-closure conflicts with FS VI8 preceding VI9 and would make imported rigidity cyclic. *Proposal:* Remove GS3:fusion as a prerequisite of GS2:Satake-closure; rename its title from Closure after fusion to Convolution closure and rigidity. Add GS2:Satake-closure→GS3:fusion. Preserve the independent VI8 two-leg degeneration proof, which does not use the constructed VI9 fusion tensor. *Status:* Same proposal as 3.
7. **rescope** (ReductiveGroupsPartII, LanglandsParameterStacks, GeometricSatakeAndFusion; part GS3–GS4). RT-AREA-geomlanglands/16 and /19 identify inputs not covered by the present supplier statements. *Proposal:* Add general Prasad–Yu Cor5.2 (author preprint Cor1.3) to RG2.3 alongside PY02/Bruhat–Tits. Add general classifying-stack highest-weight base change to LP3 and free stable exact representation completion to LP4, separately from their restricted parameter-stack generation. GS4 retains only the Satake applications; HS1 imports its enhanced kernel export. *Status:* Awaiting the maintainer (RG2.3, LP3, LP4 scope additions; requests R3.4, R3.10, R3.11, R3.17, R3.20).
8. **rescope** (GeometricSatakeAndFusion, GeometricSatakeAndFusionPartII; part GS3–GS4). The Zhu route (PAPER-ZHU-17 route 18) sends Zhu's Gelfand symmetry proof to a Part II and asks it to export that symmetry to the GS4 rational equivalence. GS4 now plans the rational Witt equivalence (GS4:integral-dual-group/witt-rational-satake-equivalence) with the monoidal structure on H* transported from fusion. Zhu's monoidal structure (Proposition 2.20, from equivariant bimodules) and his constraint (Proposition 2.21) are a different construction; Zhu states without proof that the three known monoidal structures agree in equal characteristic (§2.3.1), and neither source proves that the mixed-characteristic structures agree. *Proposal:* The Part II design states its rational Witt equivalence for its own monoidal structure on H* and imports the GS4 node only for comparison, or plans the agreement of the two monoidal structures as a theorem of its own; it does not feed its symmetry into GS4 as a prerequisite. GS4 keeps the transported statement and the FS degeneration proof. The Part II also owns Zhu's equivalence for algebraically closed k larger than an algebraic closure of F_p, unless the invariance of these categories under extension of algebraically closed base field is planned elsewhere. *Status:* Awaiting DESIGN-GeometricSatakeAndFusionPartII.
9. **sublayers** (GeometricSatakeAndFusion; part GS3–GS4). The four reconstruction declarations of GS4:integral-dual-group (tannakian-left-adjoint, relative-tannaka-hypotheses, geometric-coordinate-hopf-algebra, multileg-and-coefficient-reconstruction) are used by GS4:rational-reductivity (generic-fibre-reductivity, witt-rational-tannakian-category), which is used by the identification declarations of GS4:integral-dual-group (torus-and-rank-one-identification, generic-root-datum, witt-rational-satake-equivalence). The induced layer edges GS4:integral-dual-group -> GS4:rational-reductivity -> GS4:integral-dual-group form a cycle, and the atlas skips one of them. The reconstruction declarations use only declarations of GS0–GS3 and each other; none uses GS4:rational-reductivity or the identification declarations of GS4:integral-dual-group. *Proposal:* Add a sub-layer GS4:reconstruction, "Reconstruction of the Satake group", with parent GS4, holding the four reconstruction declarations under their present identifiers (geometric-coordinate-hopf-algebra keeps its planet "Satake coordinate Hopf algebra"). Its layer edges are GS3:fusion -> GS4:reconstruction -> GS4:rational-reductivity -> GS4:integral-dual-group; GS4:integral-dual-group keeps the identification, normalization, naturality and export declarations. *Status:* New with this assembly. Awaiting a structure job.

## Requests of the parts

All 44 requests, in packet order. The full text is under "Requests to other roadmaps" in the document. Overlapping suppliers: R0.9 and R3.4 (RG2.3), R0.10 and R3.6 (RG2.4), R0.20 and R3.1 (VS1) ask for different statements and are kept separate. The three LP3 requests R3.10, R3.17 and R3.20 likewise ask for different statements.

| Id | Part | Supplier | Needed by | Status after assembly |
| --- | --- | --- | ---: | --- |
| R0.1 | GS0–GS2 | `CrystallineCohomology:CR.1` | 2 | open |
| R0.2 | GS0–GS2 | `CrystallineCohomology:CR.7` | 1 | open |
| R0.3 | GS0–GS2 | `EnhancedDerivedSheaves:E3` | 2 | open |
| R0.4 | GS0–GS2 | `EnhancedDerivedSheaves:E5:presentability` | 1 | open |
| R0.5 | GS0–GS2 | `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2` | 1 | open |
| R0.6 | GS0–GS2 | `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6` | 1 | open |
| R0.7 | GS0–GS2 | `KTheoryLowDegrees:Z.3` | 2 | open |
| R0.8 | GS0–GS2 | `PadicHodgeTheory:P8:local-rational` | 1 | open |
| R0.9 | GS0–GS2 | `ReductiveGroupsPartII:RG2.3` | 12 | open |
| R0.10 | GS0–GS2 | `ReductiveGroupsPartII:RG2.4` | 9 | open |
| R0.11 | GS0–GS2 | `ReductiveGroupsPartII:RG2.1` | 6 | open |
| R0.12 | GS0–GS2 | `RelativeFarguesFontaine:RF4:G-torsors` | 4 | open |
| R0.13 | GS0–GS2 | `RelativeFarguesFontaine:RF4:vector-bundles` | 3 | open |
| R0.14 | GS0–GS2 | `SchemeAndStackFoundations:SF.0` | 10 | open |
| R0.15 | GS0–GS2 | `SchemeAndStackFoundations:SF.1` | 6 | open |
| R0.16 | GS0–GS2 | `SchemeAndStackFoundations:SF.3` | 3 | open |
| R0.17 | GS0–GS2 | `SchemeAndStackFoundations:SF.4` | 5 | open |
| R0.18 | GS0–GS2 | `SchemeAndStackFoundations:SF.5` | 4 | open |
| R0.19 | GS0–GS2 | `VStackSheavesAndLisseCategories:VS0` | 3 | open |
| R0.20 | GS0–GS2 | `VStackSheavesAndLisseCategories:VS1` | 6 | open |
| R0.21 | GS0–GS2 | `EtaleDualityAndPerverseSheaves:EDC.5` | 5 | open |
| R0.22 | GS0–GS2 | `RelativeFarguesFontaine:RF2:untilts` | 5 | open |
| R0.23 | GS0–GS2 | `RelativeFarguesFontaine:RF2:integral-divisors` | 1 | open |
| R3.1 | GS3–GS4 | `VStackSheavesAndLisseCategories:VS1` | 3 | open |
| R3.2 | GS3–GS4 | `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group` | 1 | open |
| R3.3 | GS3–GS4 | `ReductiveGroupsPartII:RG2.5` | 13 | open |
| R3.4 | GS3–GS4 | `ReductiveGroupsPartII:RG2.3` | 1 | open |
| R3.5 | GS3–GS4 | `ReductiveGroupsPartII:RG2.0` | 1 | open |
| R3.6 | GS3–GS4 | `ReductiveGroupsPartII:RG2.4` | 1 | open |
| R3.7 | GS3–GS4 | `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups` | 1 | open |
| R3.8 | GS3–GS4 | `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ` | 5 | open |
| R3.9 | GS3–GS4 | `EtaleDualityAndPerverseSheaves:EDC.7` | 1 | open |
| R3.10 | GS3–GS4 | `LanglandsParameterStacks:LP3` | 1 | open |
| R3.11 | GS3–GS4 | `LanglandsParameterStacks:LP4` | 1 | open |
| R3.12 | GS3–GS4 | `SmoothRepresentationsOfLocalGroups:SR.4` | 4 | open |
| R3.13 | GS3–GS4 | `SchemeAndStackFoundations:SF.2` | 3 | open |
| R3.14 | GS3–GS4 | `ReductiveGroupsPartII:RG2.0a` | 1 | open |
| R3.15 | GS3–GS4 | `VStackSheavesAndLisseCategories:VS3` | 1 | open |
| R3.16 | GS3–GS4 | `DiamondSixOperations:S6` | 1 | open |
| R3.17 | GS3–GS4 | `LanglandsParameterStacks:LP3` | 1 | open |
| R3.18 | GS3–GS4 | `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components` | 1 | open |
| R3.19 | GS3–GS4 | `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory` | 1 | open |
| R3.20 | GS3–GS4 | `LanglandsParameterStacks:LP3` | 1 | open |
| R3.21 | GS3–GS4 | `GeometricSatakeAndFusion:GS2:correspondences` | 1 | open; internal to this roadmap: the next plan of GS2:correspondences must add the declaration |

## Requests other roadmaps address here

The document's Boundaries section has a table of the twelve. Open, as far as the present nodes go:

- HeckeStacksAndLocalShtukas asks for four things this roadmap does not state:
  - the descended Białynicki-Birula map for nonsplit G with its points (GS0:Schubert-smoothness);
  - Demazure kernel generation of solid ULA duals (GS1);
  - the convolution Grassmannian over a product of leg bases and its dim.trg bound (GS0:loop-geometry);
  - the convergence and finite-extension statements on the solid Satake functor and the other-square-root case of Weil restriction (GS4:integral-dual-group).
- ExcursionOperatorsAndSpectralAction asks for the relation between the centre and the dual torsion.
- BunGAndNewtonStrata asks for the identification of the components with π₁(G) coinvariants.
- MetaplecticAutomorphicForms asks for a twisted-Satake Part II.

The other requests are met by the nodes named in the table.

## The Lean file

- Built by joining the two part files at commit 87fa91822. The GS0–GS2 body keeps `set_option autoImplicit false` and its `open`s in its own section. Its comments now name `TauCeti.GeometricSatake`. One GS3 comment cites "source issue E32" instead of "packet source issue E8".
- Every API name (120) and unit-test name (99) of both packets appears in the file. Three GS0 declarations are reserved only by name, in comments, because no honest signature exists yet (PROTOCOL §13): `etaleOverDivisor`, `divisorLengthUpperSemicontinuous` and `latticeRelativePositionUpperSemicontinuous`.
- **Elaboration.** The shared `lean-check` build (Mathlib 082e2d3) has no compiled Tau Ceti modules for the file's four Tau Ceti imports, so the committed file itself was not compiled. Instead I built a scratch copy:
  - It inlines the pinned sources (Tau Ceti f790474, read with `git show`) of the import closure of those modules: 127 modules, about 27,300 lines.
  - It hoists all Mathlib imports and wraps each module in its own section. It inlines the GS3 closure before the line-bundle module, because the line-bundle module opens a `TauCeti.AlgebraicGeometry` namespace that would otherwise shadow `AlgebraicGeometry` in later modules.
  - It then appends the joined file.

  Result:
  - **The joined file's part:** no errors, and no warnings other than 280 "declaration uses `sorry`".
  - **The inlined prelude:** 10 errors inside four inlined Tau Ceti modules (ScalarExtension.Monoidal 5, Tannaka.Monoidal 1, Tannaka.Equivalence 1, HopfIdeal.Quotient.Basic 3), plus the usual `@[expose]` notices. These are artefacts of merging 127 modules under one import set; the same modules compile in Tau Ceti's own build.

  This checks signatures and names. It checks neither the omitted geometric conditions nor the committed file's own import lines. More than 100 GB of memory was available; one check ran at a time and nothing was left running.

## Validation

- `python3 scripts/check_blueprint.py` on both part packets (with the pinned declaration index): 0 errors, 0 warnings.
- Document correspondence and link check: no missing packet string, no unresolved link, no placeholder, no local path, no trailing whitespace. The union graph of all packets is acyclic.
- `lean-check` on the scratch elaboration copy: as above.
- Two pre-submission reviewers (prose and cross-references; packet diff and Lean join) were run; their findings were checked and applied as listed in the pull request.

## For the maintainer and the next jobs

- Apply or reject proposals 3/6, 5 and 9; the atlas edge GS3:fusion → GS2:Satake-closure is the one that conflicts with the declarations.
- The next plan of GS2:correspondences adds the modular minuscule convolution declaration requested by R3.21. The next plan of GS1/GS2 states the three facts listed above.
- The GS3 part's next revision narrows `rational-semisimplicity` and gap G3.3, and may introduce IC_μ^♮.
- DESIGN-GeometricSatakeAndFusionPartII (Zhu's Gelfand proof) should import `GS4:integral-dual-group/witt-rational-satake-equivalence` only for comparison (proposal 8).
- The assembled outputs need their ordinary independent review. Re-review the packet edits of items 5–7 with it.
