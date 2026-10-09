# BP-SchemeKTheoryOperations~3 handoff

Issue: #7565. Agent: Codex. Session: `codex-vUDvTK`. Date: 9 October 2026.

This revision is complete at target planning granularity and ready for independent review. It is not a checkpoint. The packet's status is `complete`; S.1–S.7 are each `planned`, and none is `closed`. All implementation statuses remain `unchecked`. The existing independent `review` object and every source finding's independent review are unchanged: their verdicts concern the preceding version. This worker has not supplied an independent verdict on its own revision.

The deliverables are [the packet](../packets/SchemeKTheoryOperations.json), [the reader](../readmes/SchemeKTheoryOperations.md) and [the suggested Lean file](../suggested/SchemeKTheoryOperations.lean). All 284 node identifiers, 40 planets, 134 pinned baseline declarations, supplier boundaries and assigned paper routes are retained. Twenty-five nodes change; no node is added, removed or renamed.

## Counts and closure

| Item | Result |
| --- | --- |
| Nodes | 284: 29 definitions, 37 constructions, 83 lemmas, 95 theorems, 24 comparisons, 16 applications |
| API items / mathematical test specifications, all kinds | 458 / 294 |
| Validator-counted API items / tests | 444 / 285; its count excludes the additional items on applications and comparisons |
| Planets / pinned baseline declarations | 40 / 134 |
| Explicit gaps / owner requests | 42 / 42 |
| Source findings | 51; historical independent verdicts remain 49 confirmed and two rejected |
| Coverage | S.1, S.2, S.3, S.4, S.5, S.6 and S.7 each planned; zero closed |

Every target's prerequisite chain ends in a baseline declaration, an imported declaration, a requested supplier stage or an explicit gap. These are planning contracts, not assertions that their suppliers are implemented or their mathematical gaps proved. The coverage records, `gaps.neededBy` and `requests.neededBy` give the precise continuation worklist.

## The model correction

The round-2 review permits either a new proof for the unrestricted perfect-complex model or a consistent ample-family restriction. This revision takes the latter route. A regular noetherian finite-dimensional scheme on which the global higher operations are used must have an ample family of line bundles. TT 3.8–3.10, printed p.316, identify vector-bundle, strictly perfect and perfect-complex K-theory naturally at this scope. TT 2.1.2(e), p.284, supplies the comparison on every open used in descent and localisation. Agreement on affine stalks alone is not used to identify the global theories.

The sheaf-model theorem precedes and supplies the scheme/support K-coherence theorem; their proofs do not use each other in a cycle. The latter combines the global model comparison with the explicitly requested uniform affine finite-rank stability and integral-completion comparison. It retains both comparison families in the definition of K-coherence. For U=X∖Y, the support cofiber has the stated bound D=max(dim X,dim U+1), with D=dim X when U is empty. The stabilization argument uses degrees through m+D+1 and the adjacent injectivity fringe. Finite-rank mapping sets retain their pointed π₀/π₁ treatment; the group law belongs to the stable group-completed model.

The regression cases include O(1) on P¹, empty and whole supports, and a proper support with its pointed fringe. The doubled affine line is a positive nonseparated example: its affine-chart intersection is G_m, hence its diagonal is affine, and Stacks Divisors Lemma 31.17.8, tag 0GML, supplies an ample family. The doubled affine plane is excluded by TT Exercise 8.6. The fresh scan places that exercise on printed **p.374**, PDF p.128; the inherited p.376 locator is corrected outside the historical review records. Its vector-bundle K₀ is ℤ and perfect-complex K₀ is ℤ⊕ℤ.

The obsolete requirement to prove unrestricted model transfer is removed from the current gaps and S.6 remaining list. This reduces 43 gaps to 42; it does not prove a theorem for regular schemes without an ample family. The uniform stability, completion, weighted-filtration, polynomial-operation and coefficient interfaces remain named inputs or gaps.

## Propagation through consumers

| Contracts | Current scope and retained distinction |
| --- | --- |
| S.6 sheaf model and scheme/support K-coherence | Regular noetherian finite-dimensional ambient schemes with ample families; closed supports need not be regular. |
| S.6 Soulé operations, scheme λ-algebra, functoriality and multiplicativity | The same scope on every scheme carrying an operation. Pullback requires it on both schemes. An external product also requires its product scheme to be regular, finite-dimensional and to have an ample family; regular factors alone do not imply a regular product. |
| S.6 γ bound, rational weights and finite-coefficient weights | The same ambient scope, with the existing support bound D and all endpoint, exponent and additivity hypotheses retained. Full weighted γ-filtration length is not inferred from vanishing of individual γ operations. |
| S.6 Riemann–Roch without denominators and Gysin weights | X and Y have ample families. The regular base need not have one when these hypotheses on X and Y are supplied. Affine, projective and open deformation constructions inherit the required families by TT 2.1.2(e),(g),(h). |
| S.6 finite étale transfer, coniveau Adams action and global residues | Finite sources are affine over the target and inherit an ample family. Open neighbourhoods and their closed regular support schemes inherit it as well. The DVR residue case remains affine. |
| S.6 singular operations and S.7 G-theory operations/Adams Riemann–Roch | The regular finite-dimensional base has an ample family. Quasi-projective schemes can be singular; their regular ambient and auxiliary schemes inherit ample families by TT 2.1.2(h). Vector-bundle K and coherent G remain distinct. |
| S.6 Riou comparison | Riou's regular noetherian separated representability/uniqueness scope is retained without a new dimension bound. Only comparison with the packet's finite-dimensional Soulé construction assumes finite-dimensional base. The smooth separated schemes then satisfy TT 2.1.2(d). |
| S.7 γ-filtration and γ/coniveau/Chow comparisons | Arbitrary quasi-compact vector-bundle K₀ keeps its γ-filtration. The noetherian degree-zero coniveau inclusion concerns its image in perfect-complex K₀ and retains the SGA 6 gap. Higher-operation comparisons use regular finite-type schemes over a field with ample families. |
| S.7 γ-Chern character | The abstract finite-filtration λ-ring contract retains its generality. Scheme specialization requires the full weighted λ-module bridge already requested from Z.3, in addition to the ample-family scope. |
| S.7 supported Chow/K₀ and dimension-one G-cycle comparisons | Their existing separated regular noetherian ambient hypotheses imply an ample family by TT 2.1.2(d). Pure dimension, catenarity, the dimension formula and the distinction between ambient codimension and support dimension remain explicit. |

The degree-zero comparison records where the higher model is used while retaining the independent arbitrary-ring affine comparison. The first γ-graded pieces remain an independent vector-bundle K₀ contract. Generic λ-ring algebra and perfect-complex tensor pairings retain their own hypotheses. API descriptions, examples and extracted catalogue statements carry the same restrictions as their parent nodes.

## Previously accepted repairs

The 35 corrections applied by the preceding reviewer were checked against the current contracts and retained. The unchanged nodes retain their historical review notes. In the changed nodes, this revision adds scope or specifies the remaining filtration input while preserving the earlier repairs:

| Stage | Retained corrections |
| --- | --- |
| S.1 | Local lifting is distinguished from affine lifting against quasi-coherent targets. Enhanced compactness is in D_QCoh, not the category of all sheaves. |
| S.2 | Base change lands in G(V). A single ℤ rank summand for a curve requires connectedness. |
| S.3 | Supported cone indices and projection order, direct Frobenius localisation, connective covers of support fibres, the nodal characteristic hypothesis, proper smooth finite-field good reduction, v∈V, and torsion rather than finiteness of an infinite direct sum of residue units remain correct. |
| S.4 | Mayer–Vietoris uses qc opens and nonconnective K; Nisnevich field covers require a splitting component; completion excision uses the infinitely-near criterion. Component-intersection exclusions, residue indices, ambient cycle relations, regular curve examples and the ordinary-node counterexample are retained. Gersten equivalences do not prove the mixed-characteristic DVR case; semilocal generic rings are products of fraction fields, and the K₀ induction uses integers. |
| S.5 | Blowup negative-twist vanishing retains d≥2; the d=1 index range is empty. |
| S.6 | A clopen support may have a unit. Representation-ring generation replaces a false tensor-product claim. Vector-bundle K₀ λ-operations retain a conditional perfect-complex comparison; the special unit axiom has k≥2. Gysin weights use finite induction with the weighted-module input. Hypercohomology is covariant in coefficients; additive Adams maps and the nonadditive λ fringe stay distinct. The zero-section compactification remains P_quot(N⊕1), with affine chart Spec Sym N for the conormal convention. |
| S.7 | The separated Chern-character scope, ambient cycle relation, connected γ–Chow curve example, Newton sign and exponential explanation, algebraically closed HRR scope, and explicit projective-space Euler/Bott calculation are retained. |

The twelve earlier disputed routes also keep their corrected contracts: compact finite-extension factorization, exact graded resolving filtration, finite-dimensional coniveau convergence, triangular power-series substitutions, global representation homotopies, support bound D, conditional finite coefficients, unstable pointed fringes, semilocal mixed-characteristic effacement, integral supported Chern classes, source-scoped GRR and dimension-one cycle indexing. None is expanded into an unconditional theorem by this revision.

## Owners and assigned source routes

RS-18's accepted ownership and the existing `restructure` proposals are retained. No atlas data, upstream roadmap or foreign packet is edited. The eight assigned findings continue to have the following boundaries:

| Finding | Boundary |
| --- | --- |
| RT-AREA-ktheory-1/17 | K.6 supplies ring Bass/Nil and categorical inputs; S.2 supplies negative scheme G vanishing and S.5 scheme nonconnective agreement. S.3 uses direct Frobenius localisation. |
| RT-AREA-ktheory-1/23 | H.6 owns filtered spectra, exact couples and convergence; S.4 instantiates them for schemes and residues. |
| RT-AREA-ktheory-2/38 | The S.4 Nisnevich site and distinguished-square fallback remains the unique owner until an adopted foundations move replaces it. M.5a imports it. |
| RT-AREA-ktheory-2/39 | R09.1 supplies projective and flag geometry; R09.7a supplies blowups, with StableReduction's overlap imported. S.5/S.7 supply the K-theoretic formulas. |
| RT-AREA-ktheory-2/40 | StableReduction layer 2 supplies proper coherence; JacobianChallenge layer C supplies its proper flat finitely presented overlap. S.2 retains the derived and proper-support bridges. |
| RT-AREA-ktheory-2/41 | The proposal removes unused S.6→M.4, S.6→Z.5 and S.7→Z.6 edges. It adds S.6→M.6b and Z.3→Z.5, retaining RS-18's S.2/S.5 comparison inputs. |
| RT-AREA-ktheory-2/42 | S.3 owns Dedekind localisation and valuation boundaries; ArithmeticKTheory N.2 imports them and adds arithmetic consequences. |
| RT-AREA-ktheory-2/45 | DGAInfinity layer 5 supplies arbitrary-ring perfect modules. S.1 owns scheme locality and the affine comparison, including P7's complete-local overlap. |

The paper-route ledger is unchanged. Zhang's proved scheme statements remain separate from the explicitly unproved formal extension. Li–Liu uses the strict supported GS87 model and its cycle/product interface; étale intersection theory remains with SF.5. Zhu's K-spectrum comparison question remains an obligation. The four Bhatt–Scholze Witt v-descent assertions remain distinct. Scholze's completion comparison does not imply unrestricted valuation-ring A¹, cdh, pro-cdh or rigidity claims.

All 42 owner requests remain. The K.2:plus uniform stability/completion, Z.3 weighted-module, H.6 Moore coefficient and K.7 additive coefficient requests now state the scope of their scheme consumers explicitly; their abstract supplier scopes are unchanged. Other requests continue to name GeneralAlgebraicKTheory, EnhancedDerivedSheaves, SchemeAndStackFoundations, R09 geometry, AdicCoefficientsAndComparisons, DerivedDeRhamCohomology and the relevant existing Tau Ceti layers.

## Reading and evidence

Fresh source receipts, public URLs, dates and SHA-256 hashes are in `sourceVersions`, with the named passages rather than a whole-volume reading claim. This pass checked:

- **Thomason–Trobaugh (1990):** 2.1.1–2.1.3, pp.283–285; 3.8–3.10, p.316; Exercises 8.5–8.6, p.374. The comparison and counterexample pages were read as rendered images as well as text. These establish the chosen model scope and its stability under the auxiliary morphisms.
- **Gillet–Soulé (1999), archived 60-page author copy:** Definition 1 and Proposition 5 with proof, pp.38–41; §3.2.4, p.42. The two K-coherence comparisons, uniform stability argument and finite-diagram support step were checked in context. The published AMS version was not read; E45 remains confined to this author copy.
- **Soulé (1985):** §4.2/Lemme 1, pp.509–511; the stable-group context in §4.3, pp.511–512; Proposition 5, pp.513–514; §4.6/Théorème 3, pp.517–519; §5.1/Proposition 6, pp.519–521; §5.2/Théorème 4, pp.521–522; §§6.1–6.2, pp.526–528; §§7.1–7.2/Théorème 7, pp.532–534. The full-filtration distinction and regular ambient construction were checked in context.
- **Riou, arXiv:0907.2710v2:** conventions, p.3; §3.3/Théorème 3.3.2 and proof context, pp.13–15. The core representability scope is distinguished from the finite-dimensional comparison.
- **Stacks:** Divisors Lemma 31.17.8, tag 0GML, and its proof; resolution-property tag 0F8A and degree-zero comparison tag 0FDJ. A K₀ comparison is not substituted for a higher model theorem.

The reviewed S.1–S.7 library audit, RS-18 contracts, current packet and both companions, prior reports/handoffs and relevant owner contracts were read. All 134 cited declaration statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including the outer contexts needed for their hypotheses. No new baseline declaration is proposed. SemisimpleAlgebras and GrothendieckEulerForms supplied upstream style and degree-zero conventions.

No private book was needed. Existing unread primary proofs, including Gillet–Levine, Panin and the specified EGA/SGA 6 inputs, remain explicit gaps; fresh access to the named passages above is not claimed to resolve them. No source passage, PDF or extracted book text is included in the deliverables. Public receipts suffice to reacquire the material after scratch cleanup.

## Validation and compilation

- `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeKTheoryOperations.json`: **zero errors, zero warnings**.
- Submission allowlist, JSON and local-path checks: **zero problems**.
- Catalogue comparison: all 284 statements, hypotheses, proof steps, prerequisites, acceptance conditions and API/test specifications agree with the reader and the suggested-file catalogue.
- Preservation checks: node identifiers, pinned baseline, historical review objects, paper-route ledger and ownership proposals are unchanged. Active Lean declarations and imports are unchanged; this pass changes their documented contracts.
- `git diff --check`: clean.

**The suggested Lean file did not compile.** Available memory exceeded the required threshold. The permitted `lean-check research/blueprint/suggested/SchemeKTheoryOperations.lean` invocation stopped immediately because the shared build lacks the compiled `TauCeti.Algebra.Category.ModuleCat.CartanMap` import. It therefore checked neither the declarations nor their proofs. Unavailable enhanced, spectral and supported Chow carriers remain explicit comment omissions under PROTOCOL §13; catalogue test specifications are not executed examples.

No Lean language server, library build, Lake update or cache download was started. No compiler remains running. Compilation must be retried once the existing shared build supplies the pinned Tau Ceti imports.

## What follows

Independent review should first check the natural global comparison on the ample-family scope and its propagation through every higher-operation consumer, the support cofiber dimension/fringe argument, auxiliary deformation/ambient schemes, the γ-filtration distinction and the unchanged accepted corrections. The historical `needs_changes` review is intentionally retained for that reviewer to replace.

| Stage | Remaining refinement after this complete target pass |
| --- | --- |
| S.1 planned | Doubled-origin bundle proof, enhanced finite-diagram continuity and affine/cohomological supplier interfaces. |
| S.2 planned | Enhanced K/G models, derived proper-support pushforward/base change and pairing compatibility. |
| S.3 planned | Boundary/tame-symbol and divisor proofs, Popescu/perfection, fractional spectrum coherence, Witt gluing and completion bridges. |
| S.4 planned | Gersten primary-source and power-series inputs, Nisnevich/cohomological-dimension machinery, descent/coniveau comparison and distinct Witt hyperdescent bridges. |
| S.5 planned | Graded/Rees and sign proofs, blowup geometric inputs, non-affine Nil and coherent scheme nonconnective comparison. |
| S.6 planned | Uniform stability/completion, global representation homotopies, supported polynomial/gluing operations, full weighted λ-module filtration, coefficient additivity and formal support/product inputs. |
| S.7 planned | Integral supported Chern classes, general supported Adams/coniveau and arithmetic Chow-valued RR inputs, and the declared γ/Chow/source refinements. |

The packet and reader identify the affected node and supplier for each of these obligations. No continuation depends on scratch files. This run submits this one revision and stops without claiming a second issue.
