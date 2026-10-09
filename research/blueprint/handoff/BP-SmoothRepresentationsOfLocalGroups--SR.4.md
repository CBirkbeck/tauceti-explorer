# BP-SmoothRepresentationsOfLocalGroups--SR.4 handoff

Codex, session `codex-GXC1TE`, issue #997. This is one completed target-level planning pass for SR.4, SR.5 and SR.6, submitted for independent review. It is not a formalization or a claim of prerequisite closure. The four issue deliverables are the packet, reader, suggested file and this note.

## Coverage and checks

The packet contains 70 nodes: 11 definitions, 6 constructions, 47 theorems, 5 comparisons and 1 application. Its seventeen definition/construction nodes have 51 API contracts and 51 tests. There are 14 planets, distributed 4/4/6 across SR.4/SR.5/SR.6, 14 exact-baseline declaration citations, 17 source records, 8 gaps and 13 supplier requests. Every implementation status is unchecked. Each scoped stage is **planned**, with a precise remaining list; **zero stages are closed**. Packet status complete means the pass reached all targets and prerequisite chains end at baseline, requests or recorded gaps, as specified by PROTOCOL section 0.

`python3 scripts/check_blueprint.py research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.4.json` reports **0 errors and 0 warnings**. The packet was also checked for agreement of all node, API, test and proposed declaration names with the reader and suggested-file inventory. The reader has approximately 16,400 words of mathematical statements, conventions, proof routes, tests and source locators. Planet limits, acyclicity, JSON parsing, allowed file scope and absence of private paths/source passages were checked.

`lean-check research/blueprint/suggested/SmoothRepresentationsOfLocalGroups--SR.4.lean` exits **0**, with **only declaration-uses-`sorry` warnings**. The wrapper used the existing shared build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and the declared Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` baseline. Only individual Mathlib modules are imported, so no newer Tau Ceti declaration enters the elaboration. Available memory was above 100 GB before the successful checks. No project, cache, library build or language server was started. An instance-elaboration problem in the prime-fiber lemma was resolved by retaining the explicit universally quantified prime and its instance in the statement; it did not cause the fiber condition to be dropped.

The executable portion has 114 named declarations, including adapters and helper definitions, and 44 examples. These are suggested forms with omitted proofs. **Compilation does not validate the 72 full signatures recorded as unelaborated comment contracts:** 53 node-level theorem/comparison/application contracts, 11 API contracts and 8 tests. Their exact names are in `suggestedLean.omittedSignatures`. Full unavailable carriers and conditions were left out rather than fabricated as Prop-valued fields or assumed geometric action axioms. This omission must be resolved before a stage is closed; it is not a declaration elaboration success. The reader's signature-scope table also identifies narrower executable adapters whose names alone could suggest a stronger statement.

Independent finite calculations confirmed the product-ring counterexample: the tuple (1,2), (2,1), (3,3) in F_5 times F_5 has a reciprocal cubic but no listed root squares to one, so there is no permissible odd middle root. Direct enumeration in the standard hermitian spaces over F_4 gave 3 maximal isotropic lines in dimension 2, 9 in dimension 3, and 27 maximal isotropic planes in dimension 4. The last count detects the corrected factor q^3+1 at q=2. These checks verify small acceptance cases; they do not prove universal Hall–Littlewood integrality or the full unitary triangular matrix.

## Resume at these gaps

1. **G-SATAKE-CARRIER (SR.4).** Reconcile SR.0–SR.2 and RG2.4 exports: actual smooth carrier, local reductive decompositions, hyperspecial torus quotient, finite-sum integration, volume comparison and convolution. Replace the coefficient-matrix Satake/descent adapters with the actual maps and state their ring equivalence, dual-Levi square and xi substitution. The generic linear-combination adapter does not contain this construction.
2. **G-HL-COUNT (SR.4).** Obtain an open primary proof of universal symmetric Laurent integrality and the elementary-divisor/isotropic-flag count proving the Macdonald and unitary triangular matrices. Leslie cites Macdonald/Minguez; Liu invokes Xiao–Zhu. The exact target formulas and recurrence routes are planned, but those interior proofs were not reconstructed. Universal cancellation precedes specialization at colliding variables. Preserve q_E=q_F^2, both Gaussian parameters, q^(2i-1)+1 and the distinct d/d_bullet polynomials. No uncleared Macdonald book was read.
3. **G-MODULAR-TYPES (SR.5).** Refine Helm's integral-center article §§4–10 and the modular multisegment inputs of the Whittaker paper's Theorem 4.8. Supply finite-group projective envelopes, integral type covers, their compact inductions, center saturation and the modular classification. These are substantial prerequisites, not a consequence of the ordinary representation carrier. Construct the block universal Whittaker module, its free derivative line and scalarity on the true GL_n smooth carrier.
4. **G-ESSENTIAL (SR.5).** Find a primary integral GL_n essential-vector theorem with precise coefficient, torsion and level assumptions. Free rank-one top derivative does not define a canonical level vector. Preserve RS-21's ownership: RepresentationTheory:R16.2 owns the GL_2 field conductor/newvector theorem; AutomorphicCongruences:L3 owns the Fouquet–Wan minimal-lift line. Only the general integral-family contract belongs here.
5. **G-INTERPOLATION (SR.5).** Read the subsequent Helm–Moss interpolation theorem and recursively plan its prerequisites if unconditional existence is required. The selected Helm 2012 v1 Theorem 7.8 is conditional on Conjecture 7.4. Do not relabel it an unconditional theorem.
6. **G-GEOMETRIC-ACTION (SR.6).** Construct the actual minimum Fargues–Scholze Hecke action required by DHKM: the Fargues–Fontaine curve and Bun_G strata, Hecke correspondences, the lisse/solid category and ULA/compact finiteness, six-functor comparison, geometric Satake/fusion, Weil descent and simultaneous finite-wild bound. Then construct the excursion-center map and prove torus, adjoint-map and normalized parabolic compatibility. The reader gives exact contracts and FS VIII.4/IX.5–IX.7 proof routes, including the unstable-stratum constant-term argument. An abstract supplied action or matrix coefficient is insufficient. Follow the current tier rule: construct the needed minimum here and make the higher roadmap consume it; do not introduce an upward request.
7. **G-INTEGRAL-GIT (SR.6).** Refine finite wild-centralizer strata, Borel-normalizing extensions, integral twisted Chevalley–Steinberg and closed-orbit results, plus DHKM parameters Theorem 4.1(ii)/Corollary 4.2's ell-adic extension proof. Use the maximal fixed subtorus and n Fr-q isogeny. Keep one chosen scheme over Z[1/p], with Z_ell base changes; comparison of discretizations is asserted in the ell-adic setting, not as a canonical integral identification.
8. **G-DEPTH (SR.6).** Read the integral Dat (2009) appendix invoked by DHKM Lemma 3.2 and plan the depth splitting and finite projective generators. Use these to replace the supplied-action ZFinite predicate with the actual categorical-center image and to type the Hecke/Jacquet stabilization, cogenerator-dual and final second-adjunction signatures.

No recursive refinement was stopped halfway through an unrecorded prerequisite. The pass stops below the node budget because every target is planned. The next planning work is the refinement above and the corresponding signature replacements, followed by review; it is not another blanket restatement of the three stage targets.

## Exact signature limits

All seventeen construction/definition names occur as executable definitions or structures, but several are adapters. See the reader's table for each:

- `satakeTransform` and `parabolicDescent` are finite coefficient-matrix maps. They omit construction of the N integral and all local reductive/Hecke hypotheses. Their GL_2/unit/descent examples test the coefficient algebra; they do not construct the relevant double cosets.
- `Pseudoroot` states both square and twisted-fixed equations. The characteristic-two test is the identity specialization; the dual-root calculation remains an import.
- `PairedParameter`, `UnitaryGenericity` and `SpinPolynomial` are concrete algebraic objects. The spin reciprocal uses fixed degree-four reflection, allowing arbitrary coefficient specializations to lower the degree. Local Satake identifications remain contracts.
- `HallLittlewood` is rational evaluation with separated-variable/nonvanishing-normalizer hypotheses on its tests. Its integral signature covers dominant nonnegative weights in characteristic zero. Universal Laurent specialization, especially at variable collisions, is not supplied.
- `WhittakerCoinvariants` reuses Mathlib coinvariants after untwisting by inverse **units**. Its quotient and tensor relations are concrete. `BZDerivative` only fixes iteration order on a common endofunctor carrier. It does not build the rank-changing mirabolic functors or establish that the top derivative is Whittaker coinvariants.
- `SchwartzSubmodule` is the range of a supplied linear map; canonical mirabolic construction and its representation-theoretic comparisons are absent. `EssentiallyAIG` includes absolute simplicity after extensions, socle containment, nongeneric quotient and local finite length. `CoWhittaker` includes all prime fibers and their smooth duals. Their GL_n scalarity/field-cosocle theorems are not asserted for arbitrary groups.
- `UniversalWhittaker` supplies only locally constant psi-equivariant functions with compact support modulo U. The block projector, smooth action and projectivity/center/free-line comparisons are missing.
- `CrossedCocycle` has the actual crossed equation, gauge and equivariant map. `ExcursionDatum` has concrete diagonal-fixed matrix coefficients and a tensor multiplication calculation. It is not the free-group colimit algebra, finite Weil component or geometric action.
- `ZFinite` checks finite type and finite compact-open invariant modules for a supplied commutative action; constructing the actual center image is missing. `StableOperator` states the real nilpotent/invertible direct-sum decomposition; localization/Jacquet and injective-cogenerator dual comparisons are missing.

The 19 omitted API/test names are:

| Object | Missing API or test signatures |
| --- | --- |
| parabolicDescent | xiVariables |
| BZDerivative | induced |
| SchwartzSubmodule | derivative, endomorphisms, tensor |
| EssentiallyAIG | endomorphisms |
| UniversalWhittaker | represents, center, line, nongeneric, genericSimple, baseChange |
| CoWhittaker | scalars, field |
| ZFinite | image, subquotient, infiniteDirectSum |
| StableOperator | invertiblePart, dual |

The remaining 53 unelaborated names are the theorem, comparison and application nodes. They are listed with their full mathematical statements in the reader, proposed names in the suggested comment inventory, and node identifiers in the packet. An independent reviewer should check these omissions explicitly against PROTOCOL section 13, rather than infer full-signature coverage from the successful compile.

## Supplier requests and ownership reconciliation

The thirteen requests are recorded, with exact direct consumers, in the packet: SR.0:abelian-category; SR.1; SR.2; SR.2a; SR.3; ReductiveGroupsPartII:RG2.1, RG2.4 and RG2.5; the existing ModularForms Hecke layer; the existing ClassFieldTheory local-Weil layer; and existing ReductiveGroups layers 3, 7 and 9. No higher roadmap is a prerequisite. The smoothness/admissibility/extension helpers in Lean are temporary adapters for those earlier exports, not new ownership nodes.

A `rescope` proposal records the overlap of SR.6, LanglandsParameterStacks and ExcursionOperatorsAndSpectralAction. Current WORKERS tier rules override the older campaign import direction. Apply the following redirects when reconciling the higher plans; this job does not edit them.

| Existing higher contract | Lower SR.6 owner/export |
| --- | --- |
| `LanglandsParameterStacks:LP0/functoriality-of-cocycles` | `SR.6/crossed-cocycles` for the crossed equation and gauge; condensed refinements remain LP |
| `LanglandsParameterStacks:LP0/finite-wild-ramification` and `LP0/discretization-and-unique-extension` | `SR.6/finite-wild-discretization`, `finite-wild-representability`, `ell-adic-extension` for the minimum needed here |
| `LanglandsParameterStacks:LP0/change-of-discretization` | `SR.6/ell-adic-extension`; preserve the coefficient distinction |
| `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p` | `SR.6/finite-wild-representability`; one chosen Z[1/p] construction and all Z_ell base changes |
| Campaign import `LanglandsParameterStacks:LP2:excursion-presentation` and packet `LP2/three-way-separation` | `SR.6/excursion-algebra`, `excursion-invariant-comparison`; do not merge universal-homeomorphism and good-prime integral-isomorphism statements |
| `ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator`, `ES0/excursion-algebra-to-bernstein-center`, `ES0:classical-center/map-to-the-classical-bernstein-center` | `SR.6/geometric-hecke-action`, `excursion-center-action` for the required ordinary central action; ES retains enhanced lifting |
| `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`, `finite-wild-Hecke-category` | The simultaneous finite-wild minimum in `SR.6/geometric-hecke-action`/`excursion-center-action`; enhanced subcategories remain ES |
| Campaign import `ExcursionOperatorsAndSpectralAction:ES6:functoriality` | `SR.6/torus-central-compatibility` for products, Weil restriction, adjoint-isomorphism maps and central characters |
| `ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`, `constant-term-computation`, `parabolic-induction`, `normalised-induction-dictionary` | The exact ordinary-action result in `SR.6/parabolic-excursion-compatibility`; the enhanced stratum comparisons remain ES |

Preserve the single-scheme rule of confirmed finding RT-AREA-geomlanglands/26 while changing its owner under the tier rule. LP keeps its flatness/lci, derived stacks, cotangent and singularity targets beyond this minimum; ES keeps enhanced and spectral actions. These moves do not back-propagate late center finiteness into SR.0–SR.4, and SR.2a's early characteristic-zero adjunction remains independent.

Other boundaries follow the accepted RS-21 review: ModularForms owns the arithmetic GL_n multiplication and local comparison; SR.4 owns Satake. GeometricSatakeAndFusion:GS4 consumes the classical trace contract; it does not prove SR.4. The unitary level-raising roadmap owns the complete two-parahoric operator category; this part exports spherical products. GSp4LocalLanglandsAndGaloisRepresentations owns full Iwahori/Klingen/Galois applications; this part exports the spherical spin polynomial and normalization. SR.5 owns integral families and their general essential-vector contract, with the specific GL_2 exceptions described above.

## Sources read, source restrictions and corrected claims

All seventeen primary-source URLs, PDF SHA-256 hashes, access date 2026-10-09, selected editions and read-section locators are in the packet; the reader includes the same bibliography. Target statements and relevant proof routes were read, not the unrelated entirety of each work. The proof interiors still missing are named in the eight gaps above. The maintainer's cleared-library index was consulted; neither cleared book was needed and no uncleared book or alternate copy was used. Restricted source files and source passages were never copied into the deliverables.

The core source reading comprised published Treumann–Venkatesh §7.1–§7.5, pp. 204–211; its separate arXiv v1 §§7.8–7.9, pp. 29–31; Leslie v3 §3.1, pp. 22–25; Liu et al. §3.1, pp. 139–142 and Appendix B, pp. 331–346; Venkatesh v3 §§3–4, pp. 21–31; Pilloni §5.1.3–§5.1.5, author PDF pp. 21–22; Calegari–Geraghty 2020 Definition 6.7, author PDF pp. 38–39; Clozel–Thorne §2.1, author PDF pp. 4–8; Helm Whittaker v1 §§2–7, pp. 3–17; selected integral-center v3 §§4 and 10–12 target statements/proofs, pp. 13–14 and 53–69; Emerton–Helm v1 §3.1–§3.2, pp. 12–24 and §6.3, pp. 50–52; Nakamura Appendix B Proposition B.10, pp. 274–275; Calegari–Geraghty 2018 §9.4.1, PDF pp. 123–127; Atobe–Kondo–Yasuda v4 introduction and §2.3, pp. 2–3 and 8; DHKM finiteness v2 §§1–4, pp. 1–16; DHKM parameters v3 §§1.2 and 2, pp. 4–6 and 10–12, plus Theorem 4.1(ii)/Corollary 4.2 statements, pp. 29–30; and Fargues–Scholze v4 VIII.3–VIII.4 and the relevant IX.0/IX.5–IX.7 statements and proof routes, pp. 285–296, 318–319 and 327–338. Full proof refinement of the latter geometric bootstrap and integral extension remains outstanding.

Version distinctions to retain in review:

- TV Theorem 7.9 is in arXiv v1 and absent from the published §7. It is not silently cited to the final paper.
- Helm's chosen Whittaker version is 2012 v1; its integral-center companion is 2016 v3 with different theorem numbering. Interpolation is conditional in the former.
- Calegari–Geraghty 2018's derived comparison is **Theorem** 9.16; its locators are PDF pp. 123–127, not journal pagination inferred from another version. The 2020 spin-polynomial source is *Minimal modularity lifting for nonregular symplectic representations*.
- Fargues–Scholze is arXiv v4 (2024); DHKM parameter-extension locators are v3 pp. 29–30, not pp. 40–42.
- Nakamura's notation swaps the local and coefficient prime names compared with this roadmap. Proposition B.10 states GL_2(Q_l); the general GL_n tensor theorem is a planned Schwartz proof extension.

Existing confirmed catalogue findings were applied in own words, not duplicated as new quoted source issues: PAPER-LIU-ETAL-22/E5, E6, E27, E28; PAPER-PILLONI-20/E22, E24; PAPER-CLOZEL-THORNE-17/E6, E24. In particular arbitrary-ring reciprocity is not equivalent to a paired ordering; unitary counts use q^3+1; root interpretations retain collision restrictions; inert-unitary global applications retain the central-character condition; spin roots pair alpha delta=beta gamma; and integral Iwahori presentations use the positive braid monoid and the correct quadratic relation.
