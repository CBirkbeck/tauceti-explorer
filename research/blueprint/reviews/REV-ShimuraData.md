# REV-ShimuraData: independent review

Reviewer: Codex, session `codex-ysNeXc`. Date: 2026-10-06. Issue: [#489](https://github.com/CBirkbeck/tauceti-explorer/issues/489). The claim was confirmed by bot comment 6013619968. This session did none of BP-ShimuraData, whose checkpoint and completion were written by sessions `cc-fb70e5` and `codex-pY3oII` (PRs #3779 and #992).

**Verdict: needs_changes. This is a completed independent review, not a checkpoint.** The packet's mathematical targets are represented and its remaining supplier leaves are explicit. Its suggested file still assigns several planned names to different objects or conclusions, and some tests assume the result they are meant to distinguish. The verdict does not reject a plan for leaving an honest gap or explicitly omitting an unavailable condition, which PROTOCOL §13 permits.

## Counts and coverage

All 115 original nodes were checked individually for source locator/excerpt, hypotheses, proof dependencies, granularity, API, tests and prototype. The packet records the result for every original node and three added lemma nodes in `review.checked`.

| Stage | Original nodes | Final nodes | Verified | Corrected | Unverifiable | Added |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| D0 | 5 | 5 | 5 | 0 | 0 | 0 |
| D1 | 21 | 23 | 7 | 2 | 12 | 2 |
| D2 | 12 | 13 | 6 | 1 | 5 | 1 |
| D3 | 25 | 25 | 11 | 3 | 11 | 0 |
| D4 | 15 | 15 | 5 | 1 | 8 | 0 |
| D5 | 37 | 37 | 15 | 11 | 11 | 0 |
| Total | 115 | 118 | 49 | 18 | 48 | 3 |

“Unverifiable” identifies an unresolved node-level acceptance contradiction, usually between the mathematical specification and its named API/prototype/tests. It does not mean the source statement is false. Some such nodes received clear mathematical corrections as well; **35 original nodes changed**, while only 18 have no remaining acceptance defect and receive the final verdict `corrected`.

The final packet has 17 definitions, 23 constructions, 52 lemmas and 26 theorems; 122 API items, 120 unit tests, 27 planets, 25 baseline declarations, 26 supplier requests and 12 gaps. Every definition/construction has three packet tests. Counting their names is insufficient to establish that the suggested examples discriminate the proposed definition.

`status: complete`, six `planned` stages and zero `closed` stages are retained. The D0–D5 target register, including the routed MT/genericity, polarized variations, flag combinatorics, explicit symplectic conventions and neatness items, has nodes. Prerequisite leaves and signature revisions are recorded in `gaps` and `coverage.remaining`. No implementation is claimed: all 118 nodes remain `unchecked`.

## Source check

All 11 sources were inspected in public copies. The ten existing PDF hashes reproduced exactly. The previously un-hashed Hansen–Johansson reference now points to a public published PDF, whose hash was computed. The source URLs and hashes are retained in `sources`/`sourceVersions`, with precise sections read.

| Source | Passages independently read and result |
| --- | --- |
| [Deligne, 1979](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf) | Printed pp.251–256 and 265–267, checked from page images because the scan's OCR is inadequate. The graded S/Hodge equivalence, negative character signs, adjoint type/Cartan axioms and full-versus-connected orbit conventions agree. |
| [Milne, Introduction to Shimura varieties, 2017](https://www.jmilne.org/math/xnotes/svi.pdf) | §§1–3 selected pp.10–12,15–18,23–32,34; §§4–6 pp.44–45,54–59,63–64,67–69; §9 pp.91–95; §12 pp.111–113; A.5–A.6 p.155. The definition, homogeneous domain, variation, reflex, neatness and examples were checked against these passages. Two p.69 slips are confirmed below. |
| [Boxer–Pilloni, Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf) | Author copy dated 2025-11-05, pp.2–5,33–34,60. Checked the Levi, left Kostant representatives, BP block Borel, sequence/flag interpretation and Schubert loci. Findings are scoped to this copy; no claim is made about an inaccessible final Inventiones text. |
| [Boxer–Pilloni, Higher Coleman theory](https://arxiv.org/pdf/2110.10251v1) | Explicitly arXiv v1, pp.31–32, especially Lemma3.1.2. Its use of BL03 I Lemma1 is an unread proof leaf, preserved in the integral-incidence gap. |
| [Calegari–Geraghty, Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf) | PDF pp.7–11,28–29. The file is publisher-typeset Duke advance publication, ©2019, DOI10.1215/00127094-2019-0044, with final pagination unassigned. Corrected the prior “author prepublication” description and the incomplete title in sourceVersions. Findings concern this exact copy, not an unchecked final journal copy. |
| [Pilloni, Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf) | Author copy 2019-06-17, pp.20–24,107–108. Checked positive/simple roots and coroot pairings, lower-Borel chamber, parabolics and rank-four Siegel action. Findings remain scoped to this copy. |
| [Bakker–Klingler–Tsimerman](https://par.nsf.gov/servlets/purl/10200187) | The cited polarized-variation passage is §1.3 on **published pp.920–921, PDF pp.4–5**, not pp.6–7. Corrected the node locator and ledger; also read PDF6–7, which is §2.1. This is an application of polarized variation, not a replacement for Milne's construction. |
| [Benoist, The period-index problem for real surfaces](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf) | The geometric local system/Gauss–Manin/Hodge filtration example is **§6.2, Proposition6.6 proof, published p.94**, within pp.93–95. Corrected the ledger's §5.3 attribution; §5.3 occurs earlier and is a different argument. |
| [Boxer–Calegari–Gee–Pilloni](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf) | Published Definition3.2.1 pp.201–202 and Lemma7.8.3 p.409. Distinguished strong adelic neatness from its rational consequence; the local generated-products step repairs the proof gap without changing the lemma's truth. |
| [Masser–Zannier](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf) | Published p.637, §1.2. Full GSp is the genericity target; this passage does not prove the elliptic MT classification, which remains a precise independent leaf. |
| [Hansen–Johansson](https://pure.mpg.de/rest/items/item_3525265_3/component/file_3560933/content) | Published J. Lond. Math. Soc.107 (2023), §4.1 p.1980, PDF27; Definition4.1 and preceding type definitions. SHA256 `24fa8fb4040cb374d90fd9fafc7d086027312eb16a1dfc6e37f65ded817f4cdf`. The definitions use compatible **connected adjoint data**, which the suggested file does not yet retain. The publisher DOI endpoint refused access; this public published copy replaces it. |

The D1 trivial-object excerpt was not literal on p.26. It now quotes the actual Hodge dictionary and explicitly describes the trivial-character specialization. CG source locators referring to extraction erratum numbers E10/E11/E12 were replaced by the packet's actual E6/E7/E8 references. Root formulas and scan subscripts were visually checked rather than inferred from OCR.

### Source issues

All 15 original issues now have an independent `confirmed` verdict, with the following qualifications/corrections. E16 is added and confirmed. These findings are not claims of an author or publisher corrigendum; the already known extraction findings remain credited.

| Issue | Independent check |
| --- | --- |
| E1 | BP's p.2 Mμ must be the centralizing Levi, not the unipotent radical, as p.34 also requires. |
| E2 | The minimal-left-representative criterion uses positive **Levi** roots. At genus one the printed noncompact-root condition excludes a required Weyl element. |
| E3 | BP's concrete inverse-index inequalities need cyclic order g+1,…,2g,1,…,g. In genus two the mirror-preserving permutation (4,2,3,1) has inverse indices (3,1), cyclically increasing but numerically decreasing; it sends the positive Levi root to a positive noncompact root. |
| E4 | Corrected the packet's description of the error. On p.60 the closure formulas already use Xw correctly; the wrong words are “Schubert cell” and “opposite Schubert cell”, which should be varieties. It is not an Xw→Cw correction to a disjoint stratification. |
| E5 | CG repeats exponent a on t₂; coordinate character (0,1;0) detects b. |
| E6 | The a,b swap is the **Levi** longest element. The full longest sends (a,b;c) to (−a,−b;a+b+c). |
| E7 | The full orthogonal similitude group has a negative-similitude element anticommutes with J. Kh is positive scalars times K∞,1. |
| E8 | Corrected the quoted label to what PDF9–10 actually print: **K1,∞**, an index transposition of the already defined K∞,1. |
| E9 | The exponential kernel misses the coset (π,π;πi) modulo the even 2π lattice; angular and scalar exponentials multiply to identity there. |
| E10 | Confirmed with a qualification: the fixed angular/scalar coordinates require a+b≡c mod2. The abstract rank-three character lattice **is** isomorphic to ℤ³, and its tensor with ℝ is ℝ³. The packet no longer calls that abstract fact false. |
| E11 | The printed positive system itself is valid. Its declared simple pair and the printed α₂ coroot are incompatible: α₂ pairs with f₂ to −2. Corrected lower-Borel simples e₂−e₁,−2e₂+e₃ have coroots f₂−f₁,−f₂ and rho(−2,−1;0), agreeing with the later chamber. BP has a different compact order. |
| E12 | The identity in aI+bJ is I₄, since V and J have rank four. |
| E13 | Id lies in LieGSp but gives 2ψ in the printed zero-right-side equation. The scalar differential is necessary; SV1 still holds with middle dimension g²+1. |
| E14 | Milne p.56 defines weight by the inverse diagonal. For the homology action its value is r⁻¹Id, though both it and rId are rational, so SV4 remains true. |
| E15 | The published local proof treats individual torsion eigenvalues. Neatness tests their generated group. Product/inverse closure of the ≥1/4 bound supplies the missing argument, and one place then certifies the adelic definition. |
| E16 (added) | Pilloni p.20 defines PW from W but says it stabilizes PW. The Klingen-line and Siegel-plane examples show that the stabilized object is W. Credited the existing PAPER-PILLONI-20/E21 extraction finding. |

For E13–E14 I checked Milne's author errata page and the full Jungin Lee SV_errata PDF; these two p.69 corrections were not listed. For E15 the published article listing, public author proof, existing extraction findings and correction search were checked. The conclusion is a proof gap, not a false neatness criterion.

## Baseline and library audit

Every original baseline declaration was read at the exact Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` commit, including its surrounding hypotheses. No original citation was removed or renamed. The two new predicates used to state the split MT lemmas were also read at the Tau Ceti pin. All **25** names/modules are confirmed by the pinned declaration index as well as the source inspection.

| Confirmed declarations | Scope actually supplied |
| --- | --- |
| `Algebra.trace` | Finite-algebra multiplication trace; nondegenerate separable trace pairing is a further mathematical input, not the bare definition. |
| `IntermediateField.fixedField` | Fixed field of an automorphism subgroup; neither finite degree nor a rational cocharacter representative follows from this definition alone. |
| `Subgroup.closure` | Generated subgroup, including products/inverses; crucial for neatness. |
| `TauCeti.DiagonalizableGroup.weightSpace`, `isInternal_weightSpace`, `finite_setOf_weightSpace_ne_bot` | Split coalgebra/comodule decomposition, with finite support under `Module.Finite`; they do not descend arbitrary comodules by themselves. |
| `TauCeti.Hodge.HodgeStructureOn`, `ofDecomposition`, `decompositionEquiv` | Existing pure opposed-filtration carrier and its decomposition equivalence. This is not the new graded real S-representation categorical equivalence. |
| `TauCeti.Hodge.HodgeStructureOn.tensorProduct`, `dual`, `tateTwist` | Weights add, dual weight negates, twist subtracts 2m; dual filtration uses 1−p and twist p+m. These are Hodge-side inputs to the planned representation comparisons. |
| `TauCeti.Hodge.HodgeStructureOn.weilOperator`, `weilOperator_apply_of_mem`, `TauCeti.Hodge.complexificationConjugation`, `TauCeti.Hodge.tate` | Canonical conjugation, pure Tate object and Weil action i^(p−q); Deligne h(i) is its inverse. |
| `TauCeti.LocalCoefficientSystem` | Fundamental-groupoid functor to modules. It does not supply a holomorphic bundle or connection. |
| `TauCeti.ReductiveCommHopfAlgCat` | The existing reductive Hopf-algebra carrier, with finite type, smoothness and geometric connectedness; no new reductive-group definition is needed. |
| `AddValuation`, `map_mul`, `map_le_add`, `map_inv`, `map_zero` | Additive valuation algebra, with ordered-group-with-top hypotheses; the cyclotomic valuation formula is separate. |
| `TauCeti.geometricallyConnectedCommHopfAlgProperty` (added citation) | Connected prime spectrum after every field extension; used to **state**, not prove, MT connectedness. |
| `TauCeti.reductiveCommHopfAlgProperty` (added citation) | Reductivity predicate on finite-type commutative Hopf algebras; used to **state**, not prove, polarizable MT reductivity. |

I read the reviewed D0–D5 library audit and the nearby native ReductiveGroups and HodgeStructures roadmap documents. Existing pure Hodge operations, weight decomposition, local coefficient systems and additive valuation algebra are reused. General analytic quotients, variation geometry, reflex descent and neatness are not claimed present. In particular a compact-group quotient/stabilizer homeomorphism cannot be applied to noncompact G(ℝ) without its hypotheses. The proposed GL₂ theory and trace examples are applications of native owners, not replanning those libraries.

## Closure, owners and clear corrections

The 26 request texts were compared with their named supplier stages, together with accepted RS-04, RS-23 and RS-31 ownership. These are the actual supplier matches and stronger leaves:

| Supplier | Review result |
| --- | --- |
| AA.1 | Correct owner for adelic point comparisons and compact-open operations. |
| ALS.0 | Correct owner for general symmetric-space/proper-action input; the precise Cartan/Killing/central qualification and compact effective stabilizers remain requested. D2 owns its Hodge complex structure. |
| AF.1 | Its current target is (g,K)-modules/globalizations/cohomology, **not** the requested real analytic algebraic-point and quotient-chart bridge. Added a precise gap naming that extension. |
| CM.0 | Downstream CM-type input is used only by D5. Generic MT/special-point definitions do not acquire a cycle through CM.0, which consumes D3. |
| RG2.0 | Correct local point topology owner; real algebraic component finiteness is a stronger extension request, recorded explicitly. |
| RG2.0a | Affine Weil restriction, Deligne torus, splitting and Hilbert group points are its scope. It does **not** supply nonaffine Resℙ¹. Added the parabolic-type/descent route and precise remaining comparison gap for the Hilbert compact dual. |
| RG2.3 | Parahoric/Iwahori owner; the standard Iw₁ characteristic-polynomial reduction is the precise requested application. |
| RG2.5 | Corrected to symplectic **dualization** of corrected bases. Absolute root/Weyl/lattice inputs were reassigned to native R7, integral pinning to R9, as RS-31 requires. |
| SF.1 | General descent owner; effective equivariant projective/parabolic-type descent is its requested specialization, not a proof of an E-point. |
| Hodge H0 | Reuses pure structures/operations. Elliptic H₁/H¹ comparison is a stronger precise request. |
| Hodge H1 | Polarization/semisimplicity supplies the MT reductivity and fiberwise polarized-variation inputs; the elliptic MT classification remains a separate gap. |
| LocalFields LF0 | Normalized valuations/extensions are within scope; the exact cyclotomic root-of-unity valuation is **not** stated by the current target. Added an extension gap. |
| Native R0 | Group/Hopf dictionary and rational subgroup intersection; corrected the ideal construction to the sum of defining ideals. |
| Native R1 | Comodules, tensors/duals/subquotients and faithful scalar extension; effective real comodule descent and tensor generation after extension to subfields of ℂ are precise stronger requests. |
| Native R2 | Adjoint/bracket and centralizer differential inputs. General SV1 now uses the general Hodge decomposition, not the GL₂ test. |
| Native R3 | Closed subgroups/components and rational torus scheme-theoretic images; separates MT connectedness. |
| Native R4 | Rational weight grading and tori/diagonalizable closures. |
| Native R6 | Reductive/derived/adjoint groups and central isogenies; independently requests algebraic GSp for D1 genericity, without depending backward on the D5 datum. |
| Native R7 | Absolute based roots/lattices, field flags/Bruhat and parabolic-type representability. Effective reflex-type representability remains explicit. |
| Native R9 | Integral pinning, parabolic quotient/cell/closure/base-change incidence extensions; no field-only theorem is called integral. |
| LieGroups L2 | Closed subgroups are in scope; homogeneous quotient charts/tangent sequence are a stronger request. |
| LieGroups L4 | Real Frobenius does not establish complex quotient integrability; the precise complex analytic extension is an existing explicit gap. |
| LieGroups L7 | Compact real forms, complexification and compact-torus exponential comparison. |
| LieGroups L8 | Its Borel flag quotient does not automatically give arbitrary parabolic charts and the open real orbit theorem; that stronger request is recorded with the complex-quotient gap. |
| LieGroups L9 | Cartan/decomposition and symmetric-space inputs; Hodge holomorphic structure stays in D2. |
| AA.3 | General arithmetic reduction owner. The rank-two rational adelic lattice/class-number-one instance is a precise extra request used by GL₂ congruence neatness, before V0. |

The packet and suggested file receive these further clear corrections:

- MT's weight statement concerns the **image** of the weight cocharacter. For the trivial rational line this image and MT are trivial. The old unconditional “includes Gm” wording contradicted its own test.
- MT connectedness and polarizable reductivity are now separate D1 lemma nodes, marked `addedBy: REV-ShimuraData`. Their arguments use the rational identity component and faithful semisimple representation criterion respectively, with the exact polarizability hypothesis.
- The finite number of real h-orbit components is a separate D2 lemma node, also marked `addedBy`. The domain theorem cites it rather than hiding that input.
- `gradedRealHodge` now requires finite-dimensional V in Lean. Its API gains constructor `gradedMk` and dependent extensionality `gradedExt`.
- Borel injectivity now explicitly assumes SV1 and central weight, so the weight decomposition is constant on the full real orbit. No rational-weight assumption is added unnecessarily.
- Schubert/opposite closure unions are statements about underlying loci, not isomorphisms from disjoint unions of schemes.
- A lift through a **fixed** central isogeny is unique when it exists: connected S has no nontrivial algebraic map into the finite kernel. The old differing-central-weights assertion is removed. Existence remains a hypothesis.
- The adjoint prototype now uses a finite joint adjoint/abelian kernel and continuous orbit maps into a Hausdorff real group, not a false joint-injectivity hypothesis.
- `reflexFlagDescent` now concludes an E-model whose complex base change is isomorphic **over ℂ** to the given complex compact dual. The earlier output merely re-used a scheme already supplied over E. The unavailable effective descent/projectivity conditions remain explicitly omitted.
- Neat representation independence is stated over subfields of ℂ after scalar extension, as the source does, so it applies to the real effective quotient. It does not apply to arbitrary abstract group maps.
- The neat-level definition no longer depends on the later GL₂ example. Stale Lean comments naming downstream V0 as the principal-congruence input now name D5/AA.3.
- The Iwahori proof first treats **every local component of every k∈K**, applies the generated-products bound, certifies strong adelic neatness at one place and then deduces rational neatness for all conjugate-level intersections.

No general theorem was duplicated from its owner. Added nodes are the Shimura/Hodge applications of the structural inputs. No file in native roadmaps, campaign data or the published atlas was edited.

### Handed-on red-team finding

I checked confirmed [RT-AREA-algebraicgeometry/27](../redteam/RT-AREA-algebraicgeometry.review.json). The original packet and reader both request H0→D1 for pure real/rational Hodge inputs and H1→D3 for polarized variations; direct prerequisites also occur on the relevant nodes. Those own-scope consumer requirements are present and correct. They do not assert that the native outgoing stage edges have already been installed.

The rest of the finding concerns native Hodge stages and Selmer L4, Compactifications C1 and AbelianSchemes A5. This review cannot edit their files. A packet `upstreamNotes` entry hands the unresolved native/cross-roadmap graph work to the maintainer. There is no claim that all four native stages acquire every edge or that this review edits the effective atlas.

## Exact revision required

`review.checked` names each affected node. These examples establish the remaining contradictions:

1. **D1 representation/Hodge equivalence.** `representationHodgeEquivalence` is assigned the existing pure `decompositionEquiv`, not an equivalence of graded real algebraic S-representations and graded Hodge structures. The two round trips and tensor/dual/Tate comparisons likewise state only the pure Hodge-side facts. Use the actual graded comodule/category objects; retain the existing pure results as inputs. `representationOfHodge` must expose a lawful coaction, and `conjugationPieces` must take the semilinear coaction/Galois relation rather than its own conclusion.
2. **D2 domain geometry.** Integrability is represented by bracket closure of a supplied LieSubalgebra; the domain theorem is represented by J(Jx)=−x; uniqueness assumes J=K pointwise. These change the named conclusions, rather than omitting predicates on the correct objects. State the complex manifold/domain/holomorphic-filter criterion with actual supplier carriers. The derivative and general bracket lemmas must derive their conclusions from equivariance.
3. **D3 variation/flags/Borel.** `flatBundleLocal` is identity path transport, not flat holomorphic bundle construction. `homogeneousVariation` accepts arbitrary fiber H rather than ρ∘h_x; its tensor API is local-system pullback. The Borel embedding assumes an open embedding. The Siegel compact-dual test uses an arbitrary GL₄ two-plane stabilizer and never imposes isotropy. Replace these signatures and examples with their named constructions/conclusions; add constructor/extensionality and filtration/connection-compatible morphism/pullback APIs. A nonhorizontal test must actually assert rejection by the variation predicate, not unrelated vector nonmembership.
4. **D4 arithmetic specialness/types.** Abstract commutative-group factorization makes every h factor through its image, destroying the rational torus special-point distinction. The CM/non-CM tests respectively take a factorization or assume its negation. Keep the ℚ-algebraic torus/descent object, and test actual elliptic cases once the independently requested classification is supplied. Abelian/preabelian witnesses must compare **connected adjoint data** through the map induced by the derived isogeny, rather than independently chosen maps and equality of full orbits. `hodgeTypeRationalWeight` currently states centrality, not rationality.
5. **D5 named example APIs.** Several reflex/geometry APIs are generic fixed-field implications or scalar-action identities and never refer to the constructed μ/domain. `gsp4CompactCartan` constructs an additive character lattice, not the compact torus. The trace-embedding signature proves a pairing identity without constructing its faithful rational datum immersion. Effective freeness assumes the effective subgroup is torsion-free, instead of deducing it from neatness. Retain the useful linear/local/finite-combinatorial calculations as auxiliary lemmas, and give the planned names to the actual output and comparison.

The 27 planet names are mathematical definitions/constructions/theorems, not locators, and no change is required. Source sign calculations, rank-one/sequence tests, trace pairing, the meaningful real example actions and local generated-eigenvalue calculations should be retained during revision.

The reader is **not** a deliverable of #489, so it was read but left untouched. Revision must synchronize its statements, source ledger/errata, ownership, added MT/component lemmas, grading API and precise supplier leaves with the corrected packet. There is now an intentional, documented reader/packet difference rather than an unauthorized reader edit.

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraData.json`, with the exact pinned declaration index: **0 errors, 0 warnings**.
- Errata schema/version validation of a temporary `errata-v1` wrapper containing these sourceIssues/sourceVersions: **0 errors**.
- Structural check of the 118 node names, 122 API names and 120 example labels against the suggested file; complete, unique per-node review and all 16 source-issue verdicts: passed. This checks coverage of names, not elaboration or acceptance semantics.
- Scope check and `git diff --check`: passed.
- **Lean was not compiled.** Available memory exceeded 20GB, but no existing shared build had both exact required commits. The default shared build has a different Tau Ceti revision. WORKERS forbids creating/updating/building a project, so no Lean invocation, language server, build or cache download was started.

For the orchestrator: queue BP-ShimuraData revision around the exact signature/API/test defects above, including reader synchronization. Route the upstream graph note and stronger real analytic/cyclotomic/parabolic quotient requests to their owners; they are not changes that this review can apply to native roadmaps. The review itself has no unfinished node audit or external question blocking submission.
