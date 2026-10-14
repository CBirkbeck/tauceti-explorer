# Independent review: PadicHodgeTheory R06.5–R06.6

**Accepted with corrections as a complete target-level planned pass.** This is not closed coverage: fourteen supplier requests and two explicit gaps remain. Both scoped layers are planned, and none is closed. The mathematical consequences at supplier boundaries are conditional on the exact contracts recorded in the packet.

Job: REV-PadicHodgeTheory--R06.5, issue #466. Reviewer: Codex, session codex-sghglj, 2026-10-14. The input blueprint was completed by a different session, codex-O96Omm; this reviewer did not author it or its earlier checkpoints. The review follows WORKERS, PROTOCOL, the expansion protocol and UPSTREAM_GUIDE. Statements below are in the reviewer's own words; no source passage or source file is included.

| Item | Reviewed result |
| --- | --- |
| Nodes | 18: 15 theorems, one application, one construction, one definition |
| Per-node verdicts | 11 verified, 7 corrected, 0 added, 0 unverifiable |
| Baseline | All 9 citations confirmed; 0 removed, replaced or added |
| Planning API | 25 entries, increased from 21 |
| Discriminating definition/construction tests | 17, unchanged |
| Planets | 11: six in R06.5 and five in R06.6 |
| Supplier requests | 14, increased from 13 by separating the twist owner |
| Explicit gaps | 2, increased from 1 by recording the missing classification contract |
| Source findings | E40–E47: all 8 independently confirmed; no new finding |
| Suggested Lean | 159 lines, 5 real-bodied definitions, 8 end theorems, 12 examples |

## Corrections and their reasons

1. **Ordinary elliptic line.** Weak admissibility of the slope −1 line does not itself put it in the image of the period functor. Twist by Q_p(−1), apply the existing unit-root/unramified equivalence, twist back, and then lift the inclusion using full faithfulness. Brinon–Conrad Lemma 8.3.3 and Proposition 8.3.4, pp.118–119, supply the missing rank-one step. Added direct R06.2 unit-root and full-faithfulness prerequisites. This avoids using the R06.2 Colmez–Fontaine proposition declaration as though it proved essential surjectivity.
2. **Category closure and descent.** Added R06.2 admissible-category-tannakian to the Kummer Baer-sum proof and the de Rham subquotients in the Raynaud proof. Added R06.3/weil-deligne-descent to the ramified quadratic-twist argument. Its trivial-inertia criterion, rather than the D_pst carrier alone, excludes base-field semistability. Added explicit full faithfulness to the L-invariant classification for representations already realizing the modules.
3. **Kummer API.** Added fixed-basis extensionality, multiplication/Baer sums and finite-extension restriction, including identity/tower compatibility. Equality of H¹ classes classifies extensions with fixed subline/quotient identifications; it does not classify unframed representations without allowing rescaling. The R02.1 request now equips the existing LocalGaloisGroups completion with its inverse-limit topology rather than constructing another carrier.
4. **Actual Tate curve.** Current Tau Ceti already has `tateCurve`, its formal Laurent j-expansion, `tateCurveAt`, ellipticity and the discriminant norm calculation. The p-adic torsion adapter now explicitly consumes the specialized curve. Formal power-series specialization does not supply analytic point uniformization or an inverse-j theorem; these remain precise supplier boundaries.
5. **Twist ownership.** Current EllipticCurves Layer 5 owns quadratic twists and their point anti-equivariance, including a split twist of a nonsplit multiplicative curve. Layer 4 owns local reduction/Tate uniformization. Split the old Layer 4 request and add the actual Layer 5 prerequisite. The full v(j)<0 classification with the quadratic character's ramification, including residue characteristic 2, is not explicitly stated in current Layer 5. It is now an honest gap routed to **EllipticCurves, Part II**, building on Layers 4–5, rather than called an already existing theorem. The period calculation is conditional on this supplier contract.
6. **Suggested-file consistency.** Added the already stated arithmetic-Frobenius relation to the planning API. The subline example now also checks the trivial quotient. Added explicit root-change-sign and logarithm-branch examples. The branch identity is valid on any field; its geometric use is restricted to branch changes admitted by the imported period embedding, in particular b∈K₀. It does not construct a new embedding for arbitrary b∈K. All five data definitions have real bodies on existing matrix, vector or field carriers; no period, continuous-cohomology or geometric carrier is invented.

No target was split into routine lemma nodes. The existing target density is appropriate: the rank-one realization step imports an existing target, and the geometric refinements belong to their suppliers.

## Every node

The packet's `review.checked` contains the same verdicts and their justifications. Names below are the suffixes of the corresponding R06.5 or R06.6 node ids.

| Node | Verdict and reason |
| --- | --- |
| `proper-smooth-de-rham-comparison` | **verified**. Scholze Theorem 7.11 and Remark 7.12, pp.46–47, and Theorem 8.4, pp.48–49, give the filtered comparison and constant-coefficient degeneration. Algebraic/adic and GAGA adapters are explicit requests. |
| `crystalline-comparison-good-reduction` | **verified**. BMS Theorems 1.1(i) and 14.6(i), pp.2–4,121–123, give the rational proper smooth comparison without a ramification or torsion-freeness restriction. Brinon–Conrad 7.3.1, p.97, supplies the lift realization. |
| `proper-semistable-period-comparison` | **verified**. Česnavičius–Koshikawa Proposition 9.2 and Theorem 9.5, pp.75–77, give arithmetic descent and comparison; total tensor monodromy, ramified normalization and B_dR agreement are retained. |
| `proper-smooth-potential-semistability` | **verified**. Colmez–Nizioł Theorem 6.4 and proof, pp.40–43, and the imported rational monodromy theorem support potential admissibility. No claim that every proper smooth rigid space has a semistable model is made. |
| `geometric-period-functoriality-duality-twists` | **verified**. Naturality, cup products and normalized Tate trace are explicit AI.5/AI.6/CR.6 requests, not inferred from an unfiltered vector-space isomorphism. Duals and coefficient twists remain in the general layer. |
| `abelian-scheme-dcris` | **verified**. Brinon–Conrad Remark 7.3.3, pp.97–98, fixes the σ-pullback convention; the unread degree-one proof remains an explicit R07.2/A4 supplier boundary. The covariant filtration is the dual H¹ filtration. |
| `abelian-variety-hodge-tate-weights` | **verified**. Scholze Theorem 8.4 gives arbitrary-reduction H¹ weights 0,−1; dualization gives covariant weights 0,1 and the Lie/ω description. Good reduction is not assumed. |
| `weil-pairing-duality` | **verified**. The rational polarization pairing has the cyclotomic multiplier and determinant χ_p^g; the integral nondegeneracy condition is retained. Current elliptic Tate-module, Weil-pairing and determinant imports were read. |
| `elliptic-curve-ordinary-supersingular` | **corrected**. Added unit-root realization before lifting the slope −1 inclusion by full faithfulness, with Brinon–Conrad 8.3.3–8.3.4, pp.118–119. Verified the reciprocal polynomial and the F₉ semilinear counterexample. |
| `kummer-representation` | **corrected**. Added equality in a fixed basis, Baer-sum/multiplicativity and restriction APIs. Required topology on the existing Layer 7 completion. Integral torsion and rational splitting tests are distinct and correct. |
| `kummer-representations-semistable` | **corrected**. Added the admissible-category subquotient closure used for Baer sums. Checked the period basis, N sign, v_p normalization, log branch, units and nonzero-valuation cases against both source conventions. |
| `tate-curve-tate-module` | **corrected**. Imported current tateCurveAt and its ellipticity theorem rather than treating the curve construction as missing. Point uniformization remains an exact Layer 4 contract; corrected torsion ranges and inverse-limit action are sound. |
| `tate-curve-filtered-phi-n-module` | **verified**. Checked Nφ=pφN, the filtration line, weak admissibility, nonzero monodromy under finite base change and arithmetic WD inversion. q=p has zero logarithm but nonzero N. |
| `tate-curve-l-invariant` | **corrected**. Added explicit full faithfulness for representations already realizing the modules and the arithmetic Frobenius API. Checked canonical φ-fixed basis, ratio classification, scale and branch formulas; no general essential surjectivity is claimed. |
| `good-reduction-iff-crystalline` | **verified**. Brinon–Conrad Theorem 7.1.13, p.90, and Coleman–Iovita Introduction/Theorem 3, pp.1–3, support the criterion. The actual stable lattice, compatible finite-flat models and all-p supplier requests are retained. |
| `semistable-reduction-semistable` | **corrected**. Added admissible-category closure for the de Rham subquotients. Raynaud compatible p-power sequences and the de Rham hypothesis in the extension theorem are explicit; arbitrary semistable extensions are not asserted. |
| `multiplicative-reduction-elliptic-curves` | **corrected**. Corrected the twist owner to Layer 5, added the WD inertial descent criterion, and recorded the unstated full ramification classification as an EllipticCurves Part II supplier gap. Verified the conditional split/unramified/ramified period consequences. |
| `local-global-compatibility-good-reduction` | **verified**. Katz–Messing Theorem 1, printed pp.74–75, identifies crystalline and ℓ-adic geometric H¹ polynomials; dual inversions give the covariant arithmetic polynomial. The target claims good-place Frobenius-semisimplified compatibility only. |

## Pinned baseline and current imports

Both declaration names and their statements/standing hypotheses were read with `git show` at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. These nine citations are sufficient for the restricted uses the packet makes of them; none supplies a geometric period theorem.

| Declaration | Module, lines at the pin, and checked limitation |
| --- | --- |
| `cyclotomicCharacter` | Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean, 307–338. Root-action specification needs enough p-power roots; restrict to K-algebra automorphisms of the separable closure. |
| `WeierstrassCurve.HasGoodReduction` | Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean, 325–330. Minimal equation, multiplicative valuation Δ=1; the reduction is elliptic. |
| `WeierstrassCurve.HasMultiplicativeReduction` | Same module, 347–349. Minimal equation, v(Δ)<1, v(c₄)=1. |
| `WeierstrassCurve.HasSplitMultiplicativeReduction` | Same module, 366–370. Adds splitting of the residue-field tangent quadratic. |
| `TauCeti.AlgebraicGeometry.AbelianVariety` | TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean, 94–102. Proper geometrically integral group object; not an abelian scheme or a Tate representation. |
| `TauCeti.kummerCocycle` | TauCeti/FieldTheory/GaloisCohomology/Kummer.lean, 77–99. A chosen unit root gives a finite-coefficient cocycle; the Galois group fixes the base unit. |
| `TauCeti.kummerCocycle_mem_Z1` | Same module, 120–122. Continuity and cocycle identity at the finite level; inverse limits still need the R02.1 adapter. |
| `Representation` | Mathlib/RepresentationTheory/Basic.lean, 49–50. Algebraic linear action; continuity is a separate condition. |
| `Matrix.det_fin_two` | Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean, 806. Determinant formula over a commutative ring. |

Current read-only Tau Ceti **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039** was checked separately. Its elliptic Tate-module action, inverse-limit Weil pairing and cyclotomic determinant are actual imports. Its TateCurve/Basic and TateCurve/Specialization files also provide the curve declarations added above. The current roadmap checkout is **0d144d044dacebca17b654695b6f1ad58f159b27**. LocalGaloisGroups Layer 7, Steps 1–2 already owns `padicCompletionUnits`, its canonical map, finite torsion and free quotient. Its algebraic completion carrier needs the topology/continuous-cohomology adapter stated in the request.

The nine roadmaps newer than the atlas snapshot were inspected for overlap, including the nested OperatorTheory roadmaps. No competing period-comparison target was found. AdicSpaces and EllipticCurves were read for neighboring interfaces and target density. The reviewed library coverage has no entry closing either scoped layer; AUDIT-37 is an unreviewed lead. No audited completed theorem is replanned here.

## Source checks

The eight actual PDF versions match all eight packet SHA-256 records. Public sources were fetched only into scratch. Scholze and BMS were read in place from the maintainer-cleared library. No uncleared book was used. Every node locator was checked in the stated version; mathematical results and conventions, rather than excerpts, are recorded. This is a target/locator audit, not a section-by-section summary of the papers.

| Actual source | Locators checked and scope of the evidence |
| --- | --- |
| [Berger, arXiv math/0210184v1](https://arxiv.org/abs/math/0210184v1) | II.3.2–II.3.3, pp.14–15; II.4.1–II.4.4, pp.17–19; II.5.1, p.19. Period and Kummer examples with E40–E45 corrections. Published 2004 edition not seen. |
| [Brinon–Conrad, June 2009 preliminary notes](https://math.stanford.edu/~conrad/papers/notes.pdf) | §7 opening, pp.83–84; Theorem 7.1.13, p.90; following 7.2.8, p.94; §7.3, pp.97–98; 8.1.10–8.1.11, pp.107–108; 8.3.3–8.3.4, pp.118–119; 8.3.8–8.3.9, pp.123–126; §9.2, pp.139–144. The logarithm/monodromy sign is translated explicitly. |
| [Coleman–Iovita, arXiv math/9701229v1](https://arxiv.org/abs/math/9701229v1) | Introduction, pp.1–3, especially Theorem 3 on p.3. The public file lacks Chapter II; its good-reduction theorem is a statement locator, not a claim to have checked that missing proof. |
| [Scholze, arXiv 1205.3463v2](https://arxiv.org/abs/1205.3463v2) | Theorem 7.11, Remark 7.12, pp.46–47; Theorem 8.4 and proof, pp.48–49. Constant-coefficient filtered comparison and degeneration. |
| [Bhatt–Morrow–Scholze, arXiv 1602.03148v3](https://arxiv.org/abs/1602.03148v3) | Theorem 1.1(i), pp.2–4; Theorem 14.6(i) and proof, pp.121–123. Rational proper smooth crystalline comparison, including its residue bridge and agreement of maps. |
| [Česnavičius–Koshikawa, arXiv 1710.06145v3](https://arxiv.org/abs/1710.06145v3) | §4.7–4.8, pp.27–29; §5.43–5.44, pp.58–59; §6.7 and Proposition 6.8, pp.66–68; §9.1, Proposition 9.2, Theorem 9.5 and Remark 9.6, pp.75–77. Arithmetic descent, normalized total monodromy and filtered agreement. |
| [Colmez–Nizioł, CN5, 24 November 2024](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf) | Theorem 6.4 and proof, pp.40–42; §6.8, pp.42–43. The full analytic HK comparison is stronger than the potential-admissibility consequence consumed here. |
| [Katz–Messing, published scan](https://web.math.princeton.edu/~nmk/old/katzmessing.pdf) | Theorem 1 and proof, printed pp.74–75, PDF pp.3–4; hypotheses on printed p.73. Smooth projective geometrically connected finite-field comparison of Frobenius polynomials. |

The R07.2/A4 request remains essential: Brinon–Conrad Remark 7.3.3 gives the σ-pullback convention but does not prove the degree-one crystalline/Dieudonné comparison. The cited Berthelot–Breen–Messing volume was unavailable in the cleared library, and no substitute copy was used.

E40–E47 each now have `review.verdict = confirmed`, a reason and reviewer id. E40 violates the Frobenius–monodromy relation; E41 fails the zero-increment logarithm test; E42 fails the torsion count; E43 omits splitness; E44 fails common-scaling invariance; E45 substitutes equivariant twisted homomorphisms for the full H¹ dual; E46 omits the valuation divisor and excludes the valid zero coefficient; E47 reverses the historical directions of the good-reduction criterion. The verdicts concern the exact versions above, not unseen later published versions. Earlier errata-search records are retained as historical provenance rather than newly claimed independent searches.

## Closure, ownership, tests and planets

All 71 distinct external direct references resolve; repeated occurrences yield the checker's counts of 75 external blueprint-node, 20 stage and 10 baseline prerequisites. There are 28 internal prerequisite occurrences and no local cycle. Supplier statements were read rather than accepted from their names. H5/DD.2 supply the scheme/analytic and filtered-GAGA adapters; CR.3/CR.6 supply rational crystalline/HK carriers, comparison, products and ramified/uniformizer changes; AI.5/AI.6 supply the assembly maps. Unstated map multiplicativity remains requested. A4 and R07.2/R07.4 are the abelian H¹ and integral-lattice interfaces. R01.6 is the common finite-field Frobenius, good-fibre and ℓ-adic arithmetic interface. EDC.2 supplies geometric duality. Néron R11.3 supplies Raynaud uniformization and finite semistable extension, with its missing p-power compatibility explicitly requested. R06.1–R06.4 and P8 own the period rings, functors, descent and coefficient comparison; no substitute carrier is introduced.

The packet's direct tier-13 inputs obey bundle/lower-tier ownership. Four existing AI.6 nodes still have legacy CP.3 edges requiring the author's explicit rewiring handoff. The unedited transitive atlas is **not** claimed tier-closed. The new R06.5 de Rham target uses P8 and hence does not cycle through those AI.6 nodes. Later integral CohomologyComparisons diagrams remain outside this part.

Confirmed RT-AREA-padic-2/22 was checked against its review and the packet/reader: six automorphic targets are routed to R19.5/AG2.6, while general comparison, admissibility, duality and coefficient twists remain here. No R19/R18/GH dependency was introduced. Néron R11.4–R11.5 still own the converse semistable reduction criterion and the rank-N/toric-rank formula. General bad-place abelian WD and automorphic local-Langlands compatibility are not inferred from good-place polynomials.

The two definition/construction nodes have eight and nine tests respectively. They distinguish cocycle multiplication and transpose errors, the G_K base-fixing condition, integral versus rational torsion, root-change signs, ratio versus raw logarithm, filtration transversality, nonzero nilpotence, reciprocal Frobenius determinant and logarithm branches. Numerical checks confirm #E(F₅)=4 for y²=x³+x, #E(F₃)=4 for y²=x³−x, and #11a1(F₃)=5. The F₉ scalar φ² example correctly retains semilinear φ and no slope-half rank-one K₀ submodule. The generic coordinate examples are not proofs of the geometric targets.

The eleven planets are central named comparisons, reduction criteria and the Tate L-invariant. They describe mathematical milestones rather than source-section headings. No additional planet or node is needed for the routine proof repairs.

## Reader reconciliation and maintainer actions

The issue authorizes edits to the packet, suggested file and review report; WORKERS additionally permits the worker's own handoff. It does not authorize editing `research/blueprint/readmes/PadicHodgeTheory--R06.5.md`. This report supplies the corrections to be incorporated by its assembly/package owner:

- At “Good ordinary and supersingular elliptic realizations”, replace the short full-faithfulness step with the unit-root realization and add its source/prerequisites.
- At “Kummer lattices and rational extensions”, add the three API items from the corrected packet and the topology/restriction contract. At “The semistable period basis of a Kummer extension” and “Semistable abelian reduction”, include category closure.
- At “The p-adic Tate lattice”, import current `tateCurveAt`/ellipticity. At “The normalized Tate L-invariant”, use full faithfulness on already realized objects, add the arithmetic-Frobenius API, and distinguish the generic branch identity from the permitted period-embedding changes.
- At “Split, nonsplit and potentially multiplicative elliptic periods” and “Exact supplier contracts”, move twist ownership to Layer 5 and include the explicit EllipticCurves Part II gap. Add the WD descent criterion. Do not describe the full refinement as already present in Layer 4.
- Update inventories to 25 API items, 14 requests, 2 gaps and 12 suggested-file examples; incorporate all E40–E47 independent verdicts and the reviewer attribution. Keep planned/open coverage and the existing tier/automorphic routing limits.

The maintainer must route the missing EllipticCurves Part II supplier without inventing a snapshot stage id. The earlier handoff's four AI.6 rewiring instructions and exact R07.2/Néron contracts also remain necessary before packaging can claim dependency closure. No upstream files were edited and no finding about an existing upstream roadmap was promoted here.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicHodgeTheory--R06.5.json`: **0 errors, 0 warnings**.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/PadicHodgeTheory--R06.5.lean`: passed.
- `lean-check research/blueprint/suggested/PadicHodgeTheory--R06.5.lean`: exit 0, **16 intended sorry warnings only**, no errors. The shared build's Mathlib commit was independently confirmed at 082e2d37e8b0463410cdb532e111cd43d5a66174; this file imports Mathlib only. Tau Ceti baseline declarations were checked separately at f790474, and current-library imports remain distinct from that pin. Available memory before elaboration was 109 GB; only one Lean check was started.
- Local dependency acyclicity, complete per-node/source verdict coverage, source-excerpt absence, API/declaration-name agreement and `git diff --check`: passed.

All implementation statuses remain `unchecked`; successful signature elaboration is not formalization of the roadmap.
