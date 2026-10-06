# Independent review: Banach–Colmez geometry, families and HN strata (VB3, VB4)

Job: `REV-VectorBundlesAndIsocrystals--VB3`, issue #501. Reviewer: Claude, session `claude-u5DWGl`, 6 October 2026. The blueprint `BP-VectorBundlesAndIsocrystals--VB3` was written by Codex, session `codex-tqenam` (PR #6708), so this review is independent of it.

**Verdict: needs_changes.** This is a completed review, not a checkpoint. The plan is sound and closely follows its sources, and every defect I found in the packet and the suggested file is corrected in place. The verdict rests on one point. The reader document `research/blueprint/readmes/VectorBundlesAndIsocrystals--VB3.md` repeats the packet's text word for word, it is not one of this issue's deliverables, and at the places listed in the section "Required reader synchronization" it still states the text this review corrects. Some of those places are mathematical: kernels described as "of slope zero" where the source says fibrewise semistable, a garbled representability claim, and a missing standing hypothesis on C. Promotion would publish that reader as the reviewed document, so the revision round (`BP-VectorBundlesAndIsocrystals--VB3~2`) has to bring it in line with the corrected packet. It does not need to redo the plan. The ten recorded gaps and the five stages left `planned` are honest and are not reasons for this verdict.

## Scope, counts and validation

| Item | Result |
| --- | --- |
| Stages | VB3, VB3:positive-basic-examples, VB3:projectivized-properness, VB3:general-BC, VB4: all `planned`, none `closed`; packet `complete` (one finished pass, PROTOCOL §0) |
| Nodes | 76: 28 verified, 48 corrected, 0 added, 0 unverifiable |
| Kinds | 10 definitions, 3 constructions, 46 theorems, 13 comparisons, 3 applications, 1 lemma |
| API | 67 items checked, 3 added (`BC.module`, `BC.exactSequence`, `PointwiseAmple.isOpen`): 70 |
| Unit tests | All 52 checked; every definition/construction has ≥3 discriminating tests |
| Planets | 18 (general-BC 6, VB4 6, projectivized-properness 3, positive-basic-examples 3); all key definitions or named results |
| Baseline | All 13 declarations confirmed at the pinned commits; none removed |
| Sources | All seven PDFs re-downloaded; all seven SHA-256 values match the packet |
| Source issues | E16–E30 all confirmed; E31–E33 added by this review and confirmed |
| Gaps / requests | 10 gaps kept; 17 requests checked, 1 added (RD.2) |
| `check_blueprint.py --index …/declarations.tsv` | 0 errors, 0 warnings |
| `intake.py check-files` (packet, suggested file, this report) | 0 problems |
| Combined VB0+VB3 node graph (all packets loaded) | acyclic |
| `lean-check` of the suggested file | exit 0; 154 warnings, all "declaration uses `sorry`"; no errors |

The suggested file was elaborated in the shared build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, after checking free memory (104 GB available). The build's Tau Ceti checkout is a different commit (cf38662), so I compared the transitive Tau Ceti imports of the file with the pinned tree `f790474821cf4256814db967cb154e7af3d0c369`. All seven modules are byte-identical. No library build, update, cache download or language server was started.

## Corrections made in the packet

Each correction is also recorded in the node's `review.checked` note.

**Statements.**

1. `strict-positive-etale-presentations`: the kernels in FS II.3.2 and II.3.3(ii)–(iv) are *fibrewise semistable* of slopes 0, 1/r and 1/(2r). The packet said "of slope zero" and "of slope 1/(2r)", which for a bundle only fixes the degree. The semistable form is what the proof of II.3.5 uses: BC(G[1]) is separated by pro-étale descent from O(−1/(2r)) blocks.
2. `absolute-BC-spatiality`:
   - FS II.3.7(i) proves that the punctured spaces are spatial *diamonds*, and II.3.7(ii) that their E^×-quotients are cohomologically smooth. The packet said only "spatial" and moved the smoothness to the punctured spaces; both points are now stated as in the source.
   - The packet said the identification U = Frob^N holds "only after base change". In fact it holds on Perf_Fq; the base change to Spa F_q((t^{1/p^∞})) is needed only to apply Lemma II.2.17. Corrected.
   - The diamond argument in the negative case (FS p. 83) was missing. It stratifies by HN type, uses II.2.19 and a pro-étale torsor, maps to a punctured positive space, then applies ECD 11.10 and Lemma II.3.8(ii). It is now a proof step, with its prerequisites.
3. `punctured-absolute-quotients`: the packet said "the punctured scalar quotient BC(O(d))/E×→Div^d is representable in spatial diamonds and proper", which is garbled. It now states FS Remark II.3.10: the good object is the morphism (BC(O(d))∖{0})/π^Z → ∗, which is representable in spatial diamonds. The claim that BC(O(−1)[1]) is not perfectoid is now sourced to the proof of FS Lemma II.2.15 (p. 71) and restricted to p-adic E; FS footnote 5 leaves equal characteristic open.
4. `divisor-section-comparison`: added the converse direction that FS proves on p. 81. Every relative Cartier divisor of degree d comes from a section of O(d), unique up to E^×, by II.2.19. Also added the II.2.9 factorisation behind surjectivity of the sum map, and stated the diamond conclusion as FS gives it (ECD 11.4, 11.6).
5. `negative-quaternion-example`, `negative-sl2-example`: the SL₁(D) and SL₂(E) quotients are absolute statements over Perf_k, and the base change to C is a separate clause. II.2.19 (which FS invoke) and torsor prerequisites added.
6. CN standing hypothesis, in 25 nodes: CN §1 and §1.3.3 take C to be the completion of an algebraic closure of a complete discretely valued K of characteristic 0 with perfect *countable* residue field. That is why O_C/p is countable, and footnote 6 uses this for separable sympathetic closures and Hahn–Banach. The packet's hypothesis allowed any complete algebraically closed C and mentioned countability only in passing. It now records CN's assumption, and notes that SW20 Definition 15.2.1 and Theorem 15.2.12 hold for any C.
7. `slope-zero-local-systems`: H⁰(X_S,O)=E corrected to the locally constant functions underline E(S), as RS-15 requires.
8. `pure-models`: removed a duplicated, truncated sentence at the start of the statement.
9. `integral-boundary-realization`, `integral-group-torsors`: recorded SW20 §22.6's convention that S is affinoid with a fixed pseudouniformizer defining Y_[0,r](S).

**Proof steps and acceptance.**

- `positive-slope-resolution` carried the proof step and acceptance item of II.3.3(ii), which belong to the node that states (ii). They are replaced by the field-case and semicontinuity steps of FS p. 76.
- `semicontinuity-of-HN-polygon` had the acceptance item "Check that the argument does not use Thm. II.2.14". That is wrong: the convex-hull description of the polygon uses the classification at geometric points. The stage text requires only the properness proof to be classification-free, and the item now says where II.2.14 enters.
- `relative-HN-filtration-and-proetale-splitting` spoke of "a trivial rank-one subbundle". In fact O(λ) has rank equal to the denominator of λ. The step now follows FS: a fibrewise nonzero O(λ)→E over a v-cover, then surjectivity of the dual by stability.
- `robba-polygon-semicontinuity`: rewritten to KL's actual route (4.2.16, 7.1.2, 7.4.4, 7.4.3(a)). The packet's exterior-power step is not in the source.
- Concrete acceptance instances added to nine CN theorem nodes, which previously all shared one generic item.

**Excerpts.** Seven excerpts did not quote the cited result. Each is replaced by the literal statement:

| Node | Problem with the excerpt |
| --- | --- |
| `semicontinuity-of-HN-polygon` | Quoted FS Theorem II.0.5 (introduction) |
| `relative-HN-filtration-and-proetale-splitting` | Quoted FS Theorem II.0.5 (introduction) |
| `slope-zero-local-systems` | Quoted another passage that cites II.2.20 |
| `local-global-purity-counterexamples` | Quoted KL Remark 5.3.7, not Example 8.5.17 |
| `integral-frobenius-local-systems` | Quoted KL Proposition 4.2.11, labelled "Theorem 8.5.3" |
| `tilted-coherent-heart` | Quoted the sentence before the definition of Coh⁻_X |
| `affine-finite-length-equivalence` | Layout-scrambled extraction |

The other excerpts were compared with fresh text extractions and, for formulas, with page images.

**Prerequisites.** Sixteen nodes were missing direct prerequisites that their proofs cite:

- II.2.3 for II.3.1;
- II.2.16, II.2.14 and II.2.19(i) for II.3.2;
- II.2.19, II.2.9 and II.2.5 for Div^d;
- II.2.5 and v-descent for II.2.19(ii) and II.2.20;
- classification and HN base change for II.2.19(i);
- Proposition 3.2 for CN Remark 3.1(ii);
- Kedlaya's special-above-generic polygon theorem and the field slope theory for KL 7.4.5, 7.4.9 and 7.4.11;
- the KL ampleness inputs (8.8.2, 8.8.3, 8.8.7, 6.2.4, 7.3.7) for 8.8.12 and 8.8.15;
- the C4 tautness notion for Lemma II.2.17.

Kedlaya's polygon theorem is planned as `PadicDifferentialEquationsAndRigidCohomology:RD.2/special-polygon-above-generic` and `…/coincident-polygons-common-filtration`. Those nodes are stated for Kedlaya's analytic rings Γ^ℓ, which their RD.0 node allows for perfect ℓ. I cite them by id and add a `requests` entry asking that their generality cover perfect ℓ and KL's sign and order conventions.

**API.** Three items added:

- `BC.module`: the E-module structure that projectivization divides out.
- `BC.exactSequence`: the long exact sequences of BC spaces that every proof in FS II.3 uses.
- `PointwiseAmple.isOpen`: the openness recorded in KL Definition 8.8.10 and used by relative ampleness.

**Gaps.** G-ORDER now records this review's check of RT-AREA-padic-1/21 (below).

## Required reader synchronization

The reader is outside this issue's editable paths, so I could not change it. The revision should copy the corrected packet text into these sections, keeping every identifier:

| Reader location | Required update |
| --- | --- |
| "Conventions and proof order", second paragraph | Replace "a fixed complete algebraically closed C" by CN's hypothesis: C is the completion of an algebraic closure of a discretely valued K of characteristic 0 with countable perfect residue field, so O_C/p is countable. Note that SW20 15.2.1 and 15.2.12 hold for any C. |
| Every CN declaration from "Sympathetic Vector Spaces" (l. 1115) to "Nonpositive curvature extension criterion" (l. 1717), **Hypotheses** | Same CN standing hypothesis (25 declarations) |
| "Étale positive-slope presentations" (l. 971) | Kernels and middle terms fibrewise **semistable** of slopes 0, 1/r, 1/(2r); new prerequisites |
| "FS II.3.6–II.3.7 …" (l. 1043) | Spatial *diamonds*; smooth E^×-quotients; corrected Frob^N hypothesis; negative-case diamond step; new prerequisites |
| "Punctured absolute spaces and scalar quotients" (l. 1061) | Replace the garbled representability clause by FS Remark II.3.10; p-adic scope of non-perfectoidness with the p. 71 source |
| "Effective divisors and projective sections" (l. 1025) | Converse via II.2.19; II.2.9 step; diamond conclusion; new prerequisites |
| "Quaternion …" (l. 1079) and "SL₂ …" (l. 1097) | Absolute statements; base change to C as a separate clause; new prerequisites |
| "FS II.3.1 and Cor. II.3.3 …" (l. 953) | Remove the II.3.3(ii) step and acceptance item; add the field-case/semicontinuity step; new prerequisites |
| "FS II.2.19(i) …" (l. 257) | Corrected acceptance item on where II.2.14 enters; II.2.19 excerpt; new prerequisites |
| "FS II.2.19(ii) …" (l. 275) | Corrected first two proof steps; II.2.19(ii) excerpt; new prerequisites |
| "FS II.2.20 …" (l. 293) | H⁰(X_S,O)=underline E(S); corollary excerpt; new prerequisite |
| "Pure models and purity loci" (l. 347) | Remove the duplicated sentence fragment |
| "Robba slope-polygon semicontinuity" (l. 440), "Submodule at a constant polygon vertex" (l. 476), "Pointwise detection of negative Frobenius cohomology" (l. 512) | KL's proof route and the RD.2/field prerequisites |
| "Positive bundles on the geometric Proj curve" (l. 730), "Ampleness and positive fibre slopes" (l. 784) | Added KL ampleness prerequisites |
| "Banach–Colmez section and hypercohomology sheaves" (l. 101), "Pointwise ampleness" (l. 674) | Add API items `BC.module`, `BC.exactSequence`, `PointwiseAmple.isOpen` |
| "Integral boundary realization" (l. 914), "Integral group torsors and Frobenius" (l. 932) | Affinoid S with fixed pseudouniformizer |
| "The tilted coherent heart" (l. 1233), "Curvature-zero finite-length modules" (l. 1533), "Local purity without global pure models" (l. 638), "Integral Frobenius and local-system comparison" (l. 896) | Corrected source excerpts |
| CN theorem declarations (l. 1290–1717) | Concrete acceptance instances added by this review |
| "Source corrections" (l. 1751) | Mark E16–E30 confirmed by this review; add E31–E33 |
| "Closure, supplier requests and acceptance" (l. 1790) | Add the RD.2 request and the RT-AREA-padic-1/21 sentence of G-ORDER |

## Baseline confirmation

Each declaration was opened in its module at the pinned commit.

| Declaration | Module | Confirmed content and use |
| --- | --- | --- |
| `mathlib:SpectralSpace` | Topology/Spectral/Basic.lean | Class: quasi-sober, quasicompact, quasiseparated with qc-open basis; Lemma II.2.17's spectral conclusions |
| `mathlib:Specializes` | Topology/Defs/Filter.lean | `x ⤳ y ↔ 𝓝 x ≤ 𝓝 y`; chains of generalizations in II.2.17 |
| `mathlib:CategoryTheory.Sheaf` | CategoryTheory/Sites/Sheaf.lean | Full subcategory of presheaves satisfying the sheaf condition for a topology; BC v-sheaves, abstract BC |
| `mathlib:DerivedCategory` | Algebra/Homology/DerivedCategory/Basic.lean | Localization of ℤ-cochain complexes at quasi-isomorphisms; ambient category of Coh⁻_X |
| `mathlib:CategoryTheory.Abelian` | CategoryTheory/Abelian/Basic.lean | Abelian category class; BC abelian (a theorem, not replanned) |
| `mathlib:CategoryTheory.ShortComplex.ShortExact` | Algebra/Homology/ShortComplex/ShortExact.lean | Exact, mono, epi short complex; presentations and exact sequences |
| `mathlib:Submodule` | Algebra/Module/Submodule/Defs.lean | Submodules; integral lattices of pure models |
| `mathlib:ModuleCat` | Algebra/Category/ModuleCat/Basic.lean | Category of modules; values of Vector Spaces |
| `mathlib:NormedAlgebra` | Analysis/Normed/Module/Basic.lean | Normed algebra over a normed field; carrier for sympathetic algebras (their extra conditions are added) |
| `mathlib:Module.finrank` | LinearAlgebra/Dimension/Finrank.lean | Finite rank; height of a presentation |
| `mathlib:CategoryTheory.Equivalence` | CategoryTheory/Equivalence.lean | Equivalence with unit and counit; Le Bras, local systems |
| `mathlib:CategoryTheory.ShortComplex.homology` | Algebra/Homology/ShortComplex/Homology.lean | Homology of a short complex; cohomology after RΓ |
| `tauceti:TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition` | AlgebraicGeometry/AdicSpace/Spa/Spectral.lean | `SpectralSpace (spa Aplus)` for a topological ring with a pair of definition and any subring Aplus; a concrete spectral input for checking II.2.17's hypotheses. It is not needed by the lemma's proof, which is pure topology; I left the citation, since it is accurate. |

The reviewed audit `data/library-coverage.json` has no layer entry for this roadmap. Other audited layers (BunGAndNewtonStrata:BG3) record that Banach–Colmez spaces are absent from both libraries and owned by VB3. Nothing planned here is in the libraries, and no other packet plans Banach–Colmez spaces, the Le Bras equivalence or curvature.

## Public source collation

All seven PDFs were downloaded afresh into scratch and hashed. Each SHA-256 equals the packet's value.

| Source | Version read | Passages checked |
| --- | --- | --- |
| FS-geometrization | author PDF `9ab9efbd…ae905`; arXiv 2102.13459v4 (accepted version) compared for E28, E29, E32 | I.3.5 (p. 19); II.2–II.2.4 (pp. 57–61); II.2.5 (pp. 62–63); proof of II.2.15 (p. 71); II.2.16–II.2.20 (pp. 72–75); II.3.1–II.3.13 (pp. 75–85) |
| SW20 | author PDF `22550517…a4bffc` (PDF page = printed + 10) | 12.3.4 (p. 104); 15.2.1, 15.2.11–15.2.12 (pp. 133, 138–139); 22.2–22.3 (pp. 208–210); 22.6.1 (p. 213) |
| KL15 | arXiv 1301.0792v5 `a6a11742…6cfd942` | Convention 4.1.13 (pp. 105–106); 7.1–7.4 (pp. 145–156); 8.2.11 (p. 160); 8.5–8.6.3 (pp. 169–176); 8.7.1, 8.8.1–8.8.19 (pp. 178–186) |
| FF18-courbes | author PDF `8c020573…cc79` | §8.4.1 (main text pp. 245–247); preface Theorem 2.12 (pp. 16–17) |
| CN25 | author copy CN5.pdf `bb1628cf…2cd52a` (= arXiv v4); Duke version paywalled, not read | §1 and §1.3.3 (hypotheses on C); §3.1–3.3 (pp. 11–20), with p. 17 checked as a page image |
| CDN20 | author copy GPW5.pdf `2cdb1de2…155776` | §2.1.2–2.1.4, Lemma 2.7 (pp. 21–23) |
| SW13-moduli | arXiv 1211.6357v2 `984411ef…09f6d` | Theorem A (p. 3); Proposition 3.1.3 (p. 22); Lemma 3.5.1 (p. 29) |

## Source-issue decisions

| Issue | Verdict | Check |
| --- | --- | --- |
| E16 CN Lemma 3.16, "h<d" | confirmed | Page image: the goal is h>d; dimension additivity and Prop. 3.2(iii) force h>d |
| E17 CN Cor. 3.21(iv) | confirmed | U₁/Q_p t_x (x≠∞) is a height-0, curvature>0 quotient of itself; not affine |
| E18 CN §3.2.7, B_m for m=1 | confirmed | Index misprint; conclusion unaffected |
| E19 CN Cor. 3.20(b) | confirmed | W=0 is a counterexample without "nonzero" |
| E20 CN Lemma 3.16 proof | confirmed | Q_p ⊂ V₁ ⊂ V_N is a possible U₀ summand omitted by the reduction |
| E21 KL Lemma 7.1.2 proof | confirmed | F_{l+1} must use φ^a(U_{l+1}) |
| E22 KL Lemma 8.5.11 | confirmed | Loci of M; partial properness needs a base over an analytic field (Def. 8.2.11) |
| E23 KL Example 8.5.17, σ_q direction | confirmed | T↦q²T is unbounded as a map B₂→B₁ |
| E24 KL Example 8.5.17, "over X" | confirmed | The curve is over K |
| E25 KL Example 8.5.18, Ẽ^bd | confirmed | No such ring; ℛ̃^bd meant |
| E26 KL Remark 7.3.5 via 8.5.18 | confirmed (gap) | Sheaf modules need not descend to rings (Remark 8.5.10); G-PATCH kept |
| E27 KL 8.8.18–8.8.19, slope 1 | confirmed | Convention 4.1.13 and Def. 7.3.4 give slope 1/a for M(1) |
| E28 FS II.3.1, "degree 1/r" | confirmed | Also in arXiv v4; slope 1/r meant |
| E29 FS II.3.2 proof, m=dr | confirmed | Also in arXiv v4; m=d |
| E30 CN Lemma 3.16, zero subobject | confirmed | Strict inequality needs W≠0 |
| **E31** CN §3.2.6(2) (new) | confirmed | Printed n(λ₁,λ₂)=(h₁/h₂)h; correct is h₁h₂/h (O(1/2)⊗O(1/2)=O(1)⁴). Hom(O(λ₁),O(λ₂))=Hom(O,O(λ₂−λ₁)) fails for λ₁=λ₂=1/2 (dimension 4 against 1) |
| **E32** FS II.3.5 proof (new) | confirmed | The third term is BC(G^∨[1]) with G^∨ of slope −1/(2r); also in arXiv v4 |
| **E33** SW20 p. 139 (new) | confirmed | "BC(O_XFF(−1)) = G_a/Q_p" should be BC(O(−1)[1]); used by `AbstractBCTest.quotient` |

## Closure, suppliers and requests

Every target of the five stages in `content/campaign/VectorBundlesAndIsocrystals/README.md` is realised by a node, and all 69 `targetCoverage` entries point to existing nodes (one to the requested stage D5). The targets are:

- positive section sheaf, Lubin–Tate calculation and negative H¹ spaces;
- II.2.16 properness without classification;
- positive-range dimension and smoothness, degree-zero locally profinite behaviour, projectivization and nowhere-zero sections, the open-ball range, and non-representable BC spaces;
- HN semicontinuity, relative HN filtration and pro-étale splitting, and slope-zero local systems.

The README's acceptance fixtures appear as acceptance items. I read the cross-roadmap supplier nodes (RF2 untilt, divisor and B_dR nodes; DD D0, D3, D5 and D6 nodes; RD.2 nodes) and their statements supply what is cited. Nodes of other packets that are not yet reviewed are cited by id, as the protocol allows.

The 17 inherited requests name existing stages, and each states a precise contract with its consumers. I checked:

- R07.1 and R07.2 against FS II.2.1–II.2.2 and SW13;
- C4, S4, S5 and D5 against FS II.2.16, II.3.5, II.3.7, II.3.8 and the ECD numbers FS cites;
- RF0:integral-Y against SW §22.3.

I added one request, to PadicDifferentialEquationsAndRigidCohomology:RD.2, and added the contracting-action lemma to the consumers of the C4 request.

Proof closure remains open where the packet says so:

- G-LT: the Lubin–Tate φ=π Hom identity;
- G-CONTRACT: the quantitative contraction check;
- G-SPATIAL: the two FS II.3.8 criteria;
- G-LEBRAS: the construction-level proof of Le Bras;
- G-HOM: the bounded image for arbitrary VS maps;
- G-PATCH: the ring-level nodal counterexample;
- G-INTEGRAL: integral Tannakian reconstruction;
- G-COMPANION: the companion's open obligations;
- G-ORDER: atomic stage-edge replacement;
- G-LEAN: missing Lean carriers.

These gaps are precise. G-LEAN describes the suggested file rather than a mathematical input; it is honest, but listing it in every stage's `remaining` makes no stage closable for a reason that is not mathematical (question 2 below).

**Stage order.** RS-15 keeps the stage edge VB3:general-BC → VB4 until the maintainer can replace it atomically. Several general-BC nodes use VB4 nodes (II.2.19), so mechanically lifting node edges would close a cycle. `scripts/blueprints.py` adds stage links only for prerequisites in *other* roadmaps, so promotion will not create that cycle. The node graph is acyclic.

**RT-AREA-padic-1/21.** The finding concerns the order RF3 → early VB1 → geometric point → VB2:ampleness → classification in the FS II.2 chain. This part is consistent with that order:

- the positive/basic nodes use only II.2.1 descent, the RF2 untilt nodes and the Lubin–Tate inputs, with no II.2.6, II.2.9 or classification;
- the companion's cohomology-of-twists node consumes them, so they come early;
- projectivized properness uses II.2.6 from VB2:ampleness and is classification-free;
- the divisor comparison now cites the geometric-point II.2.9 node;
- VB4 uses classification and projectivized properness.

The RF3 global-map blocker itself belongs to the companion VB0 packet, whose review covers it. The finding was not mentioned in the packet or the reader; G-ORDER now records this check.

**Overlap with the companion.** The VB0 packet's review is `needs_changes` for reader synchronization only. The node contracts cited here (cohomology of twists, two-term cohomology, v-descent, ampleness, classification, Hom/Ext) were read in that packet and supply what the citing nodes need.

## API, tests and planets

Each definition or construction has an outline that lets a user work without unfolding it:

- data and constructors;
- functoriality with identity and composition;
- base change;
- the relevant universal property (`BCProjectivization.lift`, the canonical filtration's quotient property);
- compatibility with Mathlib or Tau Ceti carriers.

The tests separate plausible wrong definitions: constant presheaf against constant sheaf; cokernel of sections against hypercohomology; O[1] excluded from the heart; U₁/Q_p t_x against curvature zero; zero object against slope −∞; PBC(0) empty; (1,2) against (2,4) twisted local systems.

The three API items added serve recorded uses. Planet names come from the sources, with at most six per layer. "Contracting action lemma" is a technical lemma, but it is the key input of the layer.

## Suggested Lean file

The file opens with the standard note, imports individual Mathlib modules and one pinned Tau Ceti module, and contains every declaration, API item and test name of the packet; a scripted check finds none missing. Its contract index restates each node and is regenerated from the corrected packet. I added `BC.module`, `BC.exactSequence` and `PointwiseAmple.isOpen`. `BC.exactSequence` is *proved* from Mathlib's homology long exact sequence (`ShortComplex.ShortExact.homology_exact₁/₂/₃`); the other two are admitted.

Many theorem signatures are schematic. Following PROTOCOL §13 and the file's G-LEAN note, hypotheses that have no carrier at the pins (the curve, slopes, diamonds, sympathetic algebras) are left out rather than replaced by Prop-valued fields. The price is that several signatures are false as typed for arbitrary parameters, for example `FundamentalExactSequence (s : ShortComplex C) : s.ShortExact` and `PurityOpenness (slopes) : IsOpen …`. The file says this at each declaration and in its index. I record it as a limitation of the prototype, not a defect against the protocol (question 3).

## Questions for the orchestrator

1. Reviews of blueprint parts cannot edit the reader (`research/blueprint/readmes/<file>.md`), although the reader is promoted together with the packet and must agree with it. The same issue forced the VB0 review to `needs_changes`. Could review issues list the reader among their deliverables?
2. G-LEAN appears in every stage's `remaining` list. Should limitations of the suggested file count as gaps that keep stages from being `closed`?
3. Should suggested files avoid admitted theorem signatures that are false as typed once their geometric hypotheses are left out, for example by stating such results only in the contract index?
4. The packet's `upstreamNotes` contains a note about VectorBundlesAndIsocrystalsPartII, a routed but not yet designed Part II, not an upstream Tau Ceti roadmap. It belongs with that Part II's design job.

## Node-by-node decisions

The same decisions are in the packet's `review.checked`. "Verified" means a faithful target-level plan with its recorded refinements kept. It does not mean the theorem is proved.

| Node | Verdict | Check or correction |
| --- | --- | --- |
| `VB3:positive-basic-examples/banach-colmez-space-definition` | corrected | API: added BC.module (the E-module structure projectivization uses) and BC.exactSequence (the long exact sequences every proof in II.3 uses). |
| `VB3:positive-basic-examples/lubin-tate-universal-cover` | verified | Statement, normalization (F=σ/π, O(1) from (E,π^{-1})), equal-characteristic recurrence r_i=r_{i+1}^q and logarithm formula checked at FS pp. 58–60; SW13 Theorem A, Prop. 3.1.3(iii), Lemma 3.5.1 read at arXiv v2. The φ=π Hom identity remains G-LT as recorded. |
| `VB3:positive-basic-examples/fundamental-exact-sequence` | verified | Checked at FS pp. 60–61: E_∞ hypothesis, simple zeros of the logarithm at the Spa E_n, Spd E_∞ → Spd E → Spd E/φ^Z, Artin map via Lubin–Tate. Uses only RF2 untilt nodes, no ampleness or classification. |
| `VB3:projectivized-properness/properness-of-projectivized-BC` | verified | Checked at FS p. 72: presentation via II.2.6 with n,n′>0, closed embedding into BC(O(n))^m, reduction to π^Z by ECD 11.24, Lemma II.2.17. Classification-free as the stage requires; the quantitative contraction check is G-CONTRACT. |
| `VB3:projectivized-properness/contracting-action-lemma` | corrected | added prerequisites DiamondEtaleCohomology:C4; added the C4 request (taut spaces, ECD 18.10) for the tautness notion the statement uses. |
| `VB3:general-BC/positive-slope-resolution` | corrected | added prerequisites VB3:positive-basic-examples/fundamental-exact-sequence, VB4/semicontinuity-of-HN-polygon; moved the II.3.3(ii) proof step and acceptance item to the node that states (ii); recorded the field-case and semicontinuity steps of FS p. 76. |
| `VB3:general-BC/families-of-banach-colmez-spaces` | verified | Checked at FS pp. 79–81 including the positivity needed for exactness of 0→BC(E₀)→BC→BC(E₁[1])→0. The printed slope sign of G in the proof is recorded as E32. |
| `VB3:general-BC/absolute-BC-spatiality` | corrected | added prerequisites VB3:projectivized-properness/contracting-action-lemma, VB4/relative-HN-filtration-and-proetale-splitting, DiamondsAndVStacks:D3/locally-profinite-torsors; statement: punctured spaces are spatial DIAMONDS (FS II.3.7(i)) and the E^×-quotients are also cohomologically smooth (II.3.7(ii)); corrected the misread hypothesis that U = Frob^N holds only after base change; added the negative-case diamond argument of FS p. 83, which uses II.2.19. |
| `VB4/semicontinuity-of-HN-polygon` | corrected | added prerequisites VB2:classification/dieudonne-manin-classification-of-bundles, VB2:classification/HN-filtration-base-change; excerpt was Theorem II.0.5 of the introduction, now II.2.19(i); the convex-hull description of the polygon uses the classification at geometric points, so that prerequisite is added and the acceptance item claiming independence from II.2.14 is corrected (the stage text requires classification-independence of the properness proof only). |
| `VB4/relative-HN-filtration-and-proetale-splitting` | corrected | added prerequisites VB1/cohomology-of-twists, VB1/v-descent-for-bundles-and-cohomology; excerpt was from the introduction (II.0.5), now II.2.19(ii); proof step no longer speaks of a "trivial rank-one subbundle" (O(λ) has rank the denominator of λ); added the II.2.5 and v-descent inputs the proof cites. |
| `VB4/slope-zero-local-systems` | corrected | added prerequisites VB1/cohomology-of-twists; excerpt was another passage quoting II.2.20, now the corollary itself; H⁰(X_S,O)=E corrected to underline E(S) (as RS-15 requires); added II.2.5 (cohomology-of-twists). |
| `VB3:general-BC/strict-positive-etale-presentations` | corrected | added prerequisites VB3:projectivized-properness/properness-of-projectivized-BC, VB2:classification/dieudonne-manin-classification-of-bundles, VB4/semicontinuity-of-HN-polygon; statement: "G of slope zero" etc. corrected to fibrewise semistable of the stated slope, as FS II.3.2–II.3.3 state; the open locus BC(E′)⊃U uses II.2.16, the diagonal basis uses II.2.14. |
| `VB4/relative-cohomology-vanishing` | verified | Matches FS II.3.4(i)–(iii), p. 79, including the pro-étale cover in (ii) and the étale cover valid for every affinoid T in (iii). |
| `VB3:general-BC/divisor-section-comparison` | corrected | added prerequisites VB4/relative-HN-filtration-and-proetale-splitting, VB2:ampleness/schematic-curve-at-a-geometric-point, VB1/cohomology-of-twists, DiamondsAndVStacks:D3/locally-profinite-torsors; added the converse (every relative Cartier divisor comes from a section, via II.2.19) and the II.2.9 factorisation as explicit steps with their prerequisites; restated the diamond conclusion as FS gives it. |
| `VB3:general-BC/punctured-absolute-quotients` | corrected | statement: the garbled clause "BC(O(d))/E×→Div^d is representable" replaced by FS Remark II.3.10 (the morphism (BC(O(d))∖{0})/π^Z → ∗ is representable in spatial diamonds); the non-perfectoid clause is now sourced at FS p. 71 and scoped to p-adic E. |
| `VB3:general-BC/negative-quaternion-example` | corrected | added prerequisites VB4/relative-HN-filtration-and-proetale-splitting, DiamondsAndVStacks:D3/locally-profinite-torsors; statement: the SL₁(D) quotient is absolute (no C needed); the base change to C is a separate clause. Added II.2.19 and torsor prerequisites (FS: "here we use Theorem II.2.19"). |
| `VB3:general-BC/negative-sl2-example` | corrected | added prerequisites VB4/relative-HN-filtration-and-proetale-splitting, DiamondsAndVStacks:D3/locally-profinite-torsors; statement made absolute as in FS Example II.3.13; added the II.2.19/torsor prerequisites for the trivialization of the geometrically trivial middle term. |
| `VB4/annular-basis-approximation` | verified | Matches KL Lemmas 7.1.1–7.1.2, pp. 145–146, with the bounds on U−1 and D^{-1}UD−1; misprint E21 confirmed. |
| `VB4/pure-models` | corrected | removed a duplicated, truncated sentence at the start of the statement. |
| `VB4/pure-model-trivialization` | verified | Matches KL Proposition 7.3.6, p. 149: completed direct limit of faithfully finite étale subalgebras, basis fixed by p^cφ^d over W(S) or ℛ̃^int_S. |
| `VB4/purity-openness` | verified | Matches KL Theorem 7.3.7 and Corollaries 7.3.8–7.3.10, pp. 150–151. |
| `VB4/diagonal-gauge-normal-form` | verified | Matches KL Lemma 7.4.4, pp. 152–153, including the union (not completed union) refinement. |
| `VB4/robba-polygon-semicontinuity` | corrected | added prerequisites PadicDifferentialEquationsAndRigidCohomology:RD.2/special-polygon-above-generic, VB2:classification/dieudonne-manin-classification-of-bundles, VB1/robba-bundle-equivalence, VB2:classification/HN-filtration-base-change; proof steps rewritten to KL's actual route (4.2.16, 7.1.2, 7.4.4, 7.4.3(a)); the old exterior-power step is not in the source. Added the special-above-generic polygon theorem (Kedlaya's specialization, planned as RD.2/special-polygon-above-generic for Kedlaya's analytic rings, which include perfect ℓ) and the geometric-point classification. |
| `VB4/bounded-polygons-dense-locus` | verified | Matches KL Proposition 7.4.6 and Corollary 7.4.7, pp. 153–154; the lower bound −N/a uses Proposition 6.2.4 (quantitative-global-generation). |
| `VB4/constant-vertex-submodule` | corrected | added prerequisites PadicDifferentialEquationsAndRigidCohomology:RD.2/coincident-polygons-common-filtration, VB4/diagonal-gauge-normal-form; added Lemma 7.4.4 and the field case of the descended slope splitting ([83, Theorem 5.5.2], planned as RD.2/coincident-polygons-common-filtration), both used in KL's proof of 7.4.9. |
| `VB4/robba-constant-polygon-filtration` | verified | Matches KL Corollary 7.4.10, p. 155 (induction on rank via 7.4.9). |
| `VB4/negative-frobenius-cohomology-detection` | corrected | added prerequisites VB4/constant-vertex-submodule, VB1/robba-bundle-equivalence, VB1/cohomology-of-twists; added Theorem 7.4.9 (used directly) and the fibre vanishing H⁰=0 for negative slopes (KL Theorem 4.2.12, via the bundle comparison and II.2.5(i)). |
| `VB4/ring-sheaf-frobenius-comparison` | verified | Matches KL Remark 8.5.10, p. 172: fully faithful for all three rings, an equivalence for ℛ̃ only. |
| `VB4/adic-purity-loci` | verified | Matches KL Lemma 8.5.11, p. 173, with misprint E22 recorded in the statement. |
| `VB4/pure-modules-local-systems` | verified | Matches KL Theorem 8.5.12, p. 173 (via 8.3.5 and 8.5.8). |
| `VB4/purity-denominator-independence` | verified | Matches KL Corollary 8.5.13, p. 173; the Hilbert 90 reindexing is Definition 8.5.7. |
| `VB4/all-rings-pointwise-purity` | verified | Matches KL Corollary 8.5.14, p. 173, including the cyclic-vector argument over ℰ̃_R and ℛ̃^bd_R. |
| `VB4/surjective-purity-descent` | verified | Matches KL Corollaries 8.5.15–8.5.16, p. 174. |
| `VB4/local-global-purity-counterexamples` | corrected | excerpt was from Remark 5.3.7 (which only mentions the example); now the example itself. |
| `VB4/pure-two-out-of-three` | verified | Matches KL Lemma 8.6.3, p. 176. |
| `VB4/pointwise-ampleness` | corrected | API: added PointwiseAmple.isOpen, the openness that Definition 8.8.10 records and relative-ampleness uses. |
| `VB4/positive-tensor-domination` | verified | Matches KL Lemma 8.8.11, p. 183. |
| `VB4/geometric-positive-generation` | corrected | added prerequisites VB2:ampleness/tensor-global-ampleness, VB2:ampleness/globally-etale-positive-ampleness, VB2:ampleness/quantitative-global-generation, VB2:classification/dieudonne-manin-classification-of-bundles; added the inputs of KL's proof: the definition of ample (8.8.2), Theorem 4.2.13 (slope decomposition), Corollary 8.8.7 and Proposition 6.2.4. |
| `VB4/nonnegative-extension` | verified | Matches KL Lemma 8.8.13, pp. 183–185; the degree normalization (−1/a) follows E27. |
| `VB4/etale-at-point-resolution` | verified | Matches KL Corollary 8.8.14, p. 185. |
| `VB4/ample-iff-pointwise` | corrected | added prerequisites VB2:ampleness/globally-etale-positive-ampleness, VB2:ampleness/ampleness-power-criterion, VB4/purity-openness; added Corollary 8.8.7, Lemma 8.8.3 and Theorem 7.3.7 (making G globally étale near β), all used in KL's proof of 8.8.15. |
| `VB4/relative-ampleness` | verified | Matches KL Definition 8.8.17 and its consequences, pp. 185–186; API and three tests adequate. |
| `VB4/untilt-positive-line` | verified | Matches KL Lemma 8.8.19, p. 186, with slope 1/a per E27 (verified from Convention 4.1.13 and Definition 7.3.4). |
| `VB4/twisted-local-systems` | verified | Matches KL Definition 8.5.7, p. 172; tests discriminate the τ equation and proportional pairs. |
| `VB4/integral-frobenius-local-systems` | corrected | KL excerpt was Proposition 4.2.11 mislabelled as Theorem 8.5.3; now Theorem 8.5.3. |
| `VB4/integral-boundary-realization` | corrected | recorded the affinoid/pseudouniformizer convention under which SW define Y_[0,r](S). |
| `VB4/integral-group-torsors` | corrected | recorded the affinoid/pseudouniformizer convention under which SW define Y_[0,r](S). |
| `VB3:general-BC/sympathetic-vector-spaces` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3). |
| `VB3:general-BC/banach-colmez-presentations` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3). |
| `VB3:general-BC/exact-banach-points` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3); added prerequisites VB3:general-BC/dimension-abelian; added Proposition 3.2 (dimension-abelian): CN Remark 3.1(ii) derives faithfulness from it. |
| `VB3:general-BC/dimension-abelian` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3); acceptance: added a concrete instance. |
| `VB3:general-BC/standard-dimension-examples` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3); acceptance: added a concrete instance. |
| `VB3:general-BC/curvature` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3). |
| `VB3:general-BC/curvature-hom-orthogonality` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3); acceptance: added a concrete instance. |
| `VB3:general-BC/canonical-curvature-filtration` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3). |
| `VB3:general-BC/euler-poincare-height` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3); acceptance: added a concrete instance. |
| `VB3:general-BC/tilted-coherent-heart` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3); excerpt replaced by the defining sentence of Coh^-_X (the old excerpt quoted the preceding sentence). |
| `VB3:general-BC/le-bras-equivalence` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3). |
| `VB3:general-BC/bc-hn-invariants` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3). |
| `VB3:general-BC/bc-hn-decomposition` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3). |
| `VB3:general-BC/artinian-bc` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3). |
| `VB3:general-BC/embedding-height-bound` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3); acceptance: added a concrete instance. |
| `VB3:general-BC/bc-morphism-calculus` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3). |
| `VB3:general-BC/torsion-point-realization` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3). |
| `VB3:general-BC/affine-finite-length-equivalence` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3); excerpt replaced by the literal statement (the old one was a layout-scrambled extraction). |
| `VB3:general-BC/torsion-vs-hom-vanishing` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3). |
| `VB3:general-BC/curvature-hn-characterisation` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3). |
| `VB3:general-BC/curvature-height-signs` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3); acceptance: added a concrete instance. |
| `VB3:general-BC/curvature-subquotients` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3); acceptance: added a concrete instance. |
| `VB3:general-BC/torsion-subobjects-height` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3). |
| `VB3:general-BC/generating-image-cokernel` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3); acceptance: added a concrete instance. |
| `VB3:general-BC/nonpositive-curvature-extensions` | corrected | standing hypothesis now records CN's assumption that C is the completion of an algebraic closure of a discretely valued K with countable residue field (CN §1.3.3); acceptance: added a concrete instance. |
| `VB3:general-BC/abstract-banach-colmez-category` | verified | Matches SW20 Definition 15.2.1 (p. 133) and Theorem 15.2.12 (p. 139); the test G_a/Q_p = BC(O(−1)[1]) uses the identity whose SW misprint is E33. |
| `VB3:general-BC/semistable-period-example` | verified | Matches CDN20 §2.1.2 and Lemma 2.7 (author copy pp. 21–23): L-Dimension ([L:Q_p],2) for the supercuspidal slope-1/2 module; multiplicity one uses Proposition 2.5, not Dimension alone. |
| `VB3:projectivized-properness/scalar-projectivization` | verified | Definition, torsor, lift and base change are what II.2.16, II.3.5(ii) and II.2.19 use; the absolute non-example is FS Remark II.3.10. |
| `VB3:general-BC/positive-range-dimension` | verified | Dimension deg E₀−deg E₁ and height rk E₀−rk E₁ agree with FS I.3.5 (ball dimension = numerator) and CN (3.10)/§3.2.5; the proof via presentations and ECD dimension additivity is sound at target level. |
