# Independent review: Smooth representations, SR.4–SR.6

**Finished review; verdict: needs_changes.** Codex, session `codex-yqkgzi`, reviewed BP-SmoothRepresentationsOfLocalGroups--SR.4 independently on 9 October 2026, for issue #495. The input author was `codex-GXC1TE` (PR #7966, input commit `05f3305e0`). This submission completes the review; it is not a checkpoint of an unfinished review.

The mathematical contracts now preserve the checked source hypotheses and conventions, and the remaining proof inputs are recorded as gaps. Acceptance still requires the definition/construction and Lean-signature corrections below. Protocol §13 requires declarations under the promised names, APIs as lemma signatures and tests as examples. Naming a contract inside a comment does not provide that signature. This is separate from leaving an unavailable condition out of a prototype, which §13 explicitly permits. In particular the current excursion node's definition/API/tests describe matrix-coefficient data rather than its stated algebra construction, and the finite-wild scheme has no separate construction API/tests. Recorded research gaps alone are not the reason for the verdict.

The issue authorizes edits to the packet, suggested file and report. The reader document is therefore read-only in this job. The synchronization instructions below are part of the completed review, rather than an unreported disagreement with that document.

## Counts and scope

| Item | Result |
| --- | --- |
| Nodes | 70: SR.4 24, SR.5 19, SR.6 27 |
| Node kinds | 11 definitions, 6 constructions, 47 theorems, 5 comparisons, 1 application |
| Per-node review | 52 corrected, 18 verified, 0 added, 0 unverifiable |
| Definition/construction API outlines | 55, including 4 added crossed-cocycle lemmas |
| Definition/construction test contracts | 51, three for each of the 17 listed objects |
| Planets | 14: 4, 4, 6 across the three stages |
| Exact-pin baseline declarations | All 14 confirmed; none removed |
| Sources / source-version records | 19 / 19, including two additional published PDFs |
| Source findings | 10 confirmed, none rejected |
| Requests / explicit gaps | 17 / 13 |
| Coverage | Three planned stages, zero closed stages |
| Suggested file | 118 executable declarations including one local instance; 44 examples |
| Omitted full signatures | 72: 53 node contracts, 11 APIs, 8 tests |

All 70 statements, hypotheses, proof steps, prerequisites, source matches, acceptance properties and node roles were inspected. The per-node table below records the result, including formulas that needed no change. This remains a target-level pass under the original node budget; the review does not split every proof into lemmas. `status: complete` records completion of that pass, not completion of formalisation or closure of its targets. Each stage still has explicit remaining work and ends in identified proof/carrier gaps.

## Corrections made

The detailed changed-node record is also in the packet's `review.checked`. The following are the material mathematical changes; locator-only corrections are included in that record.

* **Satake conventions:** retained the integral twisted transform without a Weyl-order invertibility assumption. TV's published §7.1–§7.5 occupies pp. 204–211; the torus dictionary points back to §2.9, pp. 186–187. Restricted Frobenius-component invariants to the sourced algebraically closed field of characteristic different from p; integral invariant theory remains a gap. Corrected pseudoroot translation to multiplication by `a0` from ordinary to twisted orbits (TV (7.4.4), pp. 209–210); the inverse gives the opposite identification and the spherical parameter still uses the inverse. Distinguished the capital C-group central quotient from the lower c-group's cyclotomic square constraint (arXiv v1, Theorem 7.9). Its coefficient characteristic excludes p and 2.
* **Explicit formulas:** Leslie's Hall–Littlewood/Macdonald formula is on p. 24, with branching on p. 25; parabolic descent is Lemmas 3.1–3.2, pp. 23–24. The two positive determinant twists over E give substitutions `q^-b` and `q^-a`, since `q_E=q^2`. Liu's paired parameters are Definition 3.1.3, p. 139, and Construction 3.1.8, pp. 141–142; the polynomial predicates are Definition 3.1.5, p. 140, including the source's term “level-raising speciality”. Retained the correct isotropic-count factors and the restrictions from the source findings. The GL_n minuscule count is a planned specialization of TV, not a formula literally displayed there.
* **GSp_4:** retained every coefficient of the degree-four spin polynomial and replaced its irrelevant GL_n-generator prerequisite by general Satake. Specified the twist `pi tensor |nu|^(-3/2)`. With spin roots `alpha,beta,gamma,delta` and `alpha delta=beta gamma`, the eigenvalues are `T0=q^-3 alpha delta`, `T2=alpha+beta+gamma+delta` and `T1=q^-1(alpha beta+alpha gamma+alpha delta+beta delta+gamma delta)-q^-3 alpha delta`. Pilloni's comparison is Remark/Lemma 5.1.5.1, p. 21, rather than §5.1.4; Calegari–Geraghty Definition 6.7, p. 38, supplies the monic reciprocal convention.
* **Ramified Hecke comparison:** Clozel–Thorne §2.1 concerns a ramified quadratic E/F with odd residue characteristic and rank `2k+1`. Its chamber stabilizer B contains the connected Iwahori with index two, and the unitary K is special. Proposition 2.2 compares its Hecke algebra with the split symplectic Iwahori algebra. The complex Bernstein center is `C[Lambda]^W`; the hyperspecial comparison belongs to split Sp. The integral relation is `(T_s+1)(T_s-q)=0`, and braid generators are units only after inverting q. Added distinct building, parahoric and ramified double-coset requests plus `G-RAMIFIED-HECKE`. Corrected the journal metadata to Duke Mathematical Journal 166 (2017), 325–402.
* **Mirabolic families:** corrected adjunctions to `Phi+ ⊣ Phi- ⊣ hat-Phi+` and `Psi- ⊣ Psi+`. Used the sourced Noetherian W(k)-algebra regime with k perfect of characteristic ell different from p, chosen/descended character and arbitrary tensor coefficient modules; exactness does not acquire an artificial flatness assumption. EH Proposition 3.1.3 is p. 12, descent Proposition 3.1.4 p. 13, and the Schwartz construction is Lemma 3.1.5 p. 14 and Proposition 3.1.16 p. 17. The general Schwartz endomorphism comparison is an adjunction consequence; the named proposition treats a free derivative line. Added modular-field and coefficient-generality gaps rather than deriving modular classification from SR.3's complex theory.
* **Local Langlands and field adapters:** restored the conditional status of Helm v1's family construction (Theorem 7.1, p. 13; Conjecture 7.4, p. 15; Theorem 7.8, pp. 15–16), residue coefficient field, continuous rho, complete reduced Noetherian ell-torsion-free coefficient ring and the dual Breuil–Schneider convention in generic fibers. Nakamura's tensor endomorphism result is Lemma B.10, p. 274. Calegari–Geraghty's result is Corollary 9.13; its published correction requires completed unramified variables `A[[X]]`, retaining polynomial finite cyclic factors. AKY §2.3, p. 8, uses irreducible complex `Z(m)` and shortens `[a,b]` to `[a,b-1]`, deleting empty segments; classification is an explicit missing input.
* **DHKM/FS integral scope:** restored the coefficient `Z_ell[sqrt(q)]`, and the inverse limit of finite-wild excursion algebras mapping to the full smooth center, with action on any finitely generated object factoring through a finite level (DHKM Theorem 1.7/Corollary 1.8, p. 4). Finite-order wild strata are at fixed finite wild level (Lemma 2.2, p. 5). The reduction uses the full connected central torus, possibly nonsplit, and `M_der times Z_M -> M`; it cannot use only the split central torus. FS Proposition IX.6.4 identifies the torus algebra and Proposition IX.6.5 supplies its diagonal action. The kernel in FS Theorem VIII.3.6, pp. 287–288, is nilpotent ell-torsion; torsion-freeness kills it, not nilpotence alone. The excursion singleton example is constant only on the identity finite-Weil-component slice.
* **Finiteness and adjointness:** corrected DHKM pages and nonexistent subsection numbers. The central map for general Noetherian `Z_ell` coefficients starts from `Z_{Z_ell}(G)_r tensor R`; the intrinsic `Z_R(G)->Z_R(M)` assertion uses flatness in Theorem 4.1, pp. 12–13. Lemma 3.3 permits ascent along any Noetherian extension and descent along a faithfully flat one. Stability fixes depth, K, P and a contracting element before bounding uniformly in the object. The injective cogenerator covers the entire fixed-depth `Z_ell` category, and simple `Z[1/p]` modules also include the rational case. Jacquet cogenerator duality is Lemma 4.10, p. 15, with opposite Jacquet and no extra modulus. Unnormalized second adjointness uses `delta_P R_barP`; normalized forms require the chosen half. Corollary 4.12, p. 16, concerns algebraically closed k and arbitrary irreducible Levi sigma, with a dense open twist locus. Its Dat inputs are now a gap, not an unsupported characteristic-zero descent.

## Required signature and API revision

The inventory is candid and its `implementationStatus` fields remain unchecked. Nevertheless, §13 requires actual signatures, including when conditions have to be omitted. The complete list of 72 missing names is in `suggestedLean.omittedSignatures`; repeating their English contracts in the comment inventory is not an elaboration check. The review added executable `CrossedCocycle.ext`, `gaugeOne`, `gaugeMul` and `mapGauge` signatures, without supplying proofs. Other full APIs require carriers and should be revised as one coherent contract rather than adding assumptions that assert the desired result.

| Object | API/test assessment and required revision |
| --- | --- |
| Satake transform | Support/coefficient/base-change and torus/unit/GL_2 contracts are appropriate. Executable tests merely feed chosen coefficients to `Finsupp.linearCombination`; construct the local coefficients and compare them with the actual double cosets. |
| Pseudoroot | Square, fixed-point and translation API and three boundary tests are suitable; identify the abstract group/action with the dual torus and its twisted action. |
| Hall–Littlewood | Symmetry, degree, integrality and three small weights are useful. A numerator over a field with a scalar denominator is narrower than the universal integral Laurent polynomial contract; expose cancellation and specialization without variable-difference inverses. |
| Parabolic descent | Support, nested descent and Satake square are useful; executable square assumes its basis equality and tests arbitrary coefficient functions. Construct the actual integrals and implement the `xiVariables` example. |
| Paired parameter | Polynomial, reciprocity and Weyl action plus rank-one/two/product-ring tests detect ordering errors. Preserve the failure of a middle root over product rings. |
| Unitary predicates | Polynomial projections/base change and collision tests detect incorrect genericity conditions. Preserve the source restrictions; do not replace unit conditions by field nonvanishing. |
| Spin polynomial | Coefficients, reciprocal and scaling tests distinguish all normalizations. Add the genuine Hecke-generator and Satake-root comparison to the coefficient prototype. |
| Twisted coinvariants | Relation, universal lift and tensor comparison are appropriate; trivial-character/group and incompatible-character tests distinguish the quotient. Expose the actual nondegenerate GL_n/mirabolic comparison. |
| Derivatives | Zero/top/base-change contracts are useful. The endofunctor iteration tests do not establish GL_n top Whittaker or induced tensor comparison; give the five actual mirabolic functors, adjunctions and rank-changing types. |
| Schwartz submodule | Injectivity, derivative and endomorphism contracts are right. An arbitrary map range with assumed injectivity does not construct the canonical mirabolic map; tensor test and two APIs are missing. |
| Essentially AIG | Absolute socle, quotient and scalarity with simple/two-simple/zero tests are discriminating at contract level. State local finite length and genericity on the smooth carrier, with the arbitrary-field input recorded. |
| Universal Whittaker | Current executable definition supplies only the compact-induction function space. All three block-projective APIs and all three tests are omitted. Add the action, block projection, representing property, center identification and derivative line. |
| Co-Whittaker | Rank-one derivative, all-prime dual AIG and scalarity contracts are appropriate. Prime-fiber and genericity carriers remain abstract; the field example and scalar theorem are omitted. |
| Crossed cocycles | All seven API items and three tests have executable algebraic signatures. Four added lemmas supply extensionality and gauge/map coherence. Continuity and integral point-functor behavior belong to the finite-wild construction below. |
| Excursion algebra | Current API and tests are those of `ExcursionDatum`, not the stated free-group colimit algebra. Separate datum from algebra. Add generators/relations, colimit universal property, level transition maps, base change and coefficient-to-algebra maps, with actual algebra tests. |
| Z-finiteness | Current carrier uses a chosen commutative scalar algebra. Identify the actual center image and expose subquotient, extension, base-change and finite-generation criteria. The infinite-sum test is omitted; zero/scalar tests alone miss the central-image requirement. |
| Stable operator | Nilpotent/automorphism/mixed tests and split characterization are suitable. Supply the localization and cogenerator-dual APIs, preserving uniform bounded nilpotence. |

The finite-wild representing scheme is additionally a key construction hidden inside a theorem node. Its revision must expose the representing functor/algebra, universal cocycle, conjugation action, changes of finite presentation/tame generators and coherent base-change equivalences. Test a trivial or torus example, change of tame generators, and the functor-of-points comparison for **two distinct ell different from p**, compatible with gauge action. This is `G-FULL-SIGNATURES`; no construction was counted as added in this review under the target-level node budget. The gaps name the missing work explicitly.

## Baseline and supplier audit

All baseline declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The two relevant Tau Ceti source files in the shared snapshot matched the exact-pin public source bytes. No baseline citation was removed: each provides the limited interface claimed below, not a local representation or Satake theorem.

| Declaration | Pinned module | Actual supplied interface |
| --- | --- | --- |
| `mathlib:Representation` | `Mathlib/RepresentationTheory/Basic.lean` | An algebraic representation is a monoid homomorphism to module endomorphisms; smoothness is additional. |
| `mathlib:Representation.invariants` | `Mathlib/RepresentationTheory/Invariants.lean` | Submodule defined by all vectors fixed by every acting element; restrict the representation to obtain compact-open invariants. |
| `mathlib:Representation.Coinvariants` | `Mathlib/RepresentationTheory/Coinvariants.lean` | Quotient by the span of rho(g)v-v; its quotient map and universal linear map are already available. |
| `mathlib:CategoryTheory.CatCenter` | `Mathlib/CategoryTheory/Center/Basic.lean` | Natural endomorphisms of the identity, with the central action and commutative multiplication. |
| `mathlib:CategoryTheory.Linear.toCatCenter` | `Mathlib/CategoryTheory/Center/Linear.lean` | For a linear preadditive category, the ring map from scalars to its categorical center. |
| `mathlib:HeckeCosetModule` | `Mathlib/NumberTheory/HeckeRing/Defs.lean` | Finitely supported combinations of double cosets for a Hecke triple; the type alone does not supply analytic convolution. |
| `tauceti:LeftCosetModule.deg` | `TauCeti/NumberTheory/HeckeRing/Degree.lean` | The ring map from a Hecke ring to coefficients counting left cosets, with deg_single = degree times coefficient. |
| `tauceti:TauCeti.AffineGroupSchemeCat` | `TauCeti/AlgebraicGeometry/AffineGroupScheme/Basic.lean` | Full subcategory of group objects over Spec(R) with affine underlying scheme; neither reductivity nor cocycle moduli is supplied. |
| `mathlib:Finsupp.linearCombination` | `Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean` | The linear map taking finitely supported coefficients to their finite linear combination in a specified module. |
| `mathlib:LinearMap.baseChange` | `Mathlib/LinearAlgebra/TensorProduct/Tower.lean` | Extension of a linear map f to A tensor M by the identity on A tensor f; it requires an algebra but no flatness. |
| `mathlib:Representation.IsIrreducible` | `Mathlib/RepresentationTheory/Irreducible.lean` | Simplicity of the subrepresentation order, with the theorem identifying it with a simple group-algebra module. |
| `mathlib:Subrepresentation.subrepresentationSubmoduleOrderIso` | `Mathlib/RepresentationTheory/Subrepresentation.lean` | Order isomorphism from subrepresentations to group-algebra submodules. |
| `mathlib:Representation.prod` | `Mathlib/RepresentationTheory/Basic.lean` | The componentwise representation on a product of two modules. |
| `mathlib:Representation.tprod` | `Mathlib/RepresentationTheory/Basic.lean` | The representation on the tensor product defined by tensoring the two action maps. |

No SmoothRepresentations row was found in the reviewed library audit. The relevant AUDIT14, AUDIT16 and AUDIT21 entries were inspected. Existing polynomial Hecke surjectivity for GL_1/GL_2 is not general Satake; ordinary algebraic representations and affine group objects are not smooth local carriers or reductive integral models. There is no new node duplicating one of the 14 cited baseline declarations.

The actual SR.0–SR.3/SR.2a supplier texts were checked. SR.3 complex admissibility/Bernstein theory does not supply the modular field, Ext or multisegment inputs; `G-MODULAR-FIELD` records the distinction. ReductiveGroupsPartII RG2.1, RG2.2, RG2.3, RG2.4 and RG2.5 supply valued roots, building/fixer notions, connected parahorics, local decompositions and pinned dual data respectively. These justify the directions of the precise requests; their general stage statements do not already prove the ramified CT matrix/parameter calculation. The existing ReductiveGroups Layer 7 structure text does not state highest-weight Weyl-module trace triangularity. Its request was narrowed to its actual structure scope, and a separate requested Layer 1 rational-representation refinement was added. No upstream roadmap was rewritten. The relevant ClassFieldTheory Layer 9 reciprocity and ModularForms Hecke convention sections were also checked, along with upstream roadmap form and source-faithfulness rules.

## Confirmed RT26 and ownership handoff

The confirmed finding `RT-AREA-geomlanglands/26` and its verified fixes require **one finite-wild scheme over Z[1/p]** with every `Z_ell` model obtained by base change; separate ell-adic schemes are not a substitute. The packet and reader preserve this mathematical invariant. Its earlier verified fix assigned construction to LP1 and import to SR.6. The packet instead proposes moving the minimum into SR.6 because current WORKERS.md forbids its upward LP/ES prerequisites and explicitly instructs moving needed notions down. That rule has precedence, but the ownership change is a **proposal requiring coordination**, not evidence that the old owner has already been rescoped.

The handoff therefore records the exact move: finite-wild cocycles/representability, minimum excursion algebra and the geometric action, continuity, torus and parabolic contracts needed for DHKM become SR.6 exports. LP1/LP2 and ES1/ES6/ES7 import those exports; broad derived-stack and enhanced/spectral-action goals remain with their existing owners. The proposed restructuring and `upstreamNotes` preserve one owner and no upward citation. The actual minimum construction and its test/API obligation remain unfinished in the blueprint. The maintainer must coordinate the higher-roadmap imports before treating the ownership proposal as applied. This review edits none of those files.

## Sources and source mistakes

All 17 originally cited public PDF hashes were verified, and their cited sections were checked rather than substituting later unpinned versions. Two additional published PDFs were read: the two-page Calegari–Geraghty correction and EH §3.1, pp. 671–675. The packet records exact URLs, editions, SHA-256 values and reading scope for all 19 versions. No library book or uncleared source was used. The report and packet state mathematics in original words; no source passages or source-by-source chapter summaries are copied.

| Source id and public version | Checked scope |
| --- | --- |
| [tv](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p04-p.pdf) — Annals of Mathematics 183 (2016), 177–215; published PDF | §7.1–7.5, pp. 204–211 |
| [tvpre](https://arxiv.org/pdf/1407.2346v1) — arXiv:1407.2346v1, 9 July 2014; separate earlier formulation | §7.8–7.9, pp. 29–31; Theorem 7.9 |
| [leslie](https://arxiv.org/pdf/1911.07907v3) — arXiv:1911.07907v3 author preprint; locators use this version, not Annals pagination | §3.1, pp. 22–25, including Lemma 3.2 |
| [liu](https://par.nsf.gov/servlets/purl/10323568) — Inventiones Mathematicae 228 (2022), 107–375; published PDF | Notation 1.3.1, pp. 119–120; §3.1, pp. 139–142; Appendix B.1–B.4, pp. 331–346 |
| [cg](https://math.uchicago.edu/~fcale/papers/CG.pdf) — Author PDF of Inventiones Mathematicae 211 (2018), 297–433 | §9.4.1, Lemmas 9.9–9.15 and Theorem 9.16, PDF pp. 123–127 |
| [venkatesh](https://arxiv.org/pdf/1608.07234v3) — arXiv:1608.07234v3 | §3, pp. 21–26, Theorem 3.3; §4, pp. 26–31, Lemmas 4.5 and 4.7 |
| [pilloni](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf) — Author PDF for Duke Mathematical Journal 169 (2020), 1647–1807 | §5.1.3–5.1.5, author PDF pp. 21–22 |
| [cg20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf) — Author PDF for Duke Mathematical Journal 169 (2020), 801–896 | §6.1, Definition 6.7, author PDF pp. 38–39 |
| [ct](https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf) — Accepted author PDF, 10 December 2015; Duke Mathematical Journal 166 (2017), 325–402; published printing not collated | §2.1, author PDF pp. 4–8; Bernstein presentation and center |
| [helm](https://arxiv.org/pdf/1210.1789v1) — arXiv:1210.1789v1, 5 October 2012 | §§2–7, pp. 3–17; Definitions 3.3 and 6.1, Theorems 5.2 and 6.3, conditional Theorem 7.8 |
| [helmcenter](https://arxiv.org/pdf/1201.1874v3) — arXiv:1201.1874v3, 16 May 2016 | Definition 4.12, pp. 13–14; §§10–12, pp. 53–69, especially Theorems 10.9, 11.8, 11.17, 12.8 and 12.9 |
| [eh](https://arxiv.org/pdf/1104.0321v1) — arXiv:1104.0321 v1, 2 April 2011; locators use its printed pages | §3.1, pp. 12–17; §3.2, pp. 17–24, Theorem 3.2.13; §6.2–6.3, pp. 48–52 |
| [nakamura](https://link.springer.com/content/pdf/10.1007/s00222-023-01203-7.pdf) — Inventiones Mathematicae 234 (2023), author/publisher PDF | Appendix B, Lemma B.10 and proof, p. 274 |
| [aky](https://arxiv.org/pdf/2110.09070v4) — arXiv:2110.09070v4, 28 September 2022 | Introduction and §2.3, pp. 2–3 and 8; highest derivative convention |
| [dhkm](https://arxiv.org/pdf/2203.04929v2) — arXiv:2203.04929v2, 22 April 2022 | §§1–4, pp. 1–16; Theorems 1.1–1.2, 1.7, 2.3, 4.1, 4.3; Lemmas 2.2, 2.8, 3.4, 4.7–4.10 |
| [dhkmparameters](https://arxiv.org/pdf/2009.06708v3) — arXiv:2009.06708v3, 29 February 2024 | §§1.2 and 2.1–2.3, pp. 4–6 and 10–12; Proposition 1.2; Theorem 4.1 and Corollary 4.2 used as explicitly unrefined prerequisites |
| [fs](https://arxiv.org/pdf/2102.13459v4) — arXiv:2102.13459v4, 27 November 2024 | §VIII.3–VIII.4, pp. 285–296; Theorems IX.0.1, IX.0.3, IX.6.1, IX.7.2; Propositions IX.5.1, IX.6.2–IX.6.5; Corollary IX.7.3, pp. 317–319, 327–338 |
| [cgcorrection](https://link.springer.com/content/pdf/10.1007/s00222-021-01095-5.pdf) — Inventiones Mathematicae 227 (2022), 855–856; published PDF | Entire two-page correction, especially item 11, p. 856 |
| [ehpublished](https://www.numdam.org/item/10.24033/asens.2224.pdf) — Annales scientifiques de l’École normale supérieure 47 (2014), 655–722; published PDF | §3.1, pp. 671–675, especially corrected product derivative definition, p. 674 |

The source findings are confirmed as follows. For Pilloni and CT, the finding applies to the read author copy; their journal printings were not collated, and no claim of absence of a published correction is made.

| Packet findings | Result and source locator |
| --- | --- |
| E1–E4, Liu | Existing E5/E6/E27/E28 catalogue findings confirmed: ordered middle root need not exist over a product ring (Construction 3.1.8, p. 141); corrected isotropic factor in B.3.5/B.3.6, pp. 342–343; root interpretations of the predicates need coefficient restrictions (Remark 3.1.6, p. 140); construction requires the strengthened condition in 3.1.10, p. 142. |
| E5–E6, Pilloni | Author-copy bibliography reference should select [25], whose entry is on p. 111; spin product is alpha delta, not alpha beta (§5.1.5, pp. 21–22). |
| E7–E8, CT | Quadratic sign and integral braid-group presentation defects confirmed in accepted author §2.1, pp. 6–8; corrected double-coset relation and positive monoid/unit distinction are recorded. |
| E9, Calegari–Geraghty | Added the published Correction, item 11, p. 856 (2022): completed unramified variables, with unchanged cyclic polynomial variables. |
| E10, Emerton–Helm | Added the v1 product-derivative order defect (p. 17); the published article uses the corrected order on p. 674. |

Each has an independent confirmed verdict, reason and review job identifier. The finite algebra kernel, inverse-limit and opposite-parabolic corrections are blueprint errors, not additional asserted source mistakes.

## Reader synchronization and remaining revision

The following precise synchronization is necessary in `readmes/SmoothRepresentationsOfLocalGroups--SR.4.md`. The reader was not edited because it is outside #495's deliverables. Match its declaration headings by the node ids in the next table; all corrected locators/statements are available in the packet and suggested inventory.

1. SR.4 introduction and declarations: update TV/Leslie/Liu locators, remove the unsourced integral Frobenius-invariant statement, reverse the pseudoroot orbit translation, separate capital C from lower c, correct the unitary source terminology and GSp_4 twist/eigenvalues, and replace the unramified/hyperspecial CT comparison by the ramified special/chamber comparison. Update its proof requests, not just the displayed statement.
2. SR.5 conventions and declarations: source the Noetherian Witt regime, correct all mirabolic adjunctions and Schwartz locators, preserve conditional interpolation with the continuous dual Breuil–Schneider fiber convention, fix Nakamura/CG names and the completed deformation variables, and state the complex highest-derivative rule with its classification gap.
3. SR.6 introduction and declarations: use finite-flat `Z_ell[sqrt(q)]`, inverse-limit-to-center action and finite-level factorization, fixed wild level and finite-order theta, full connected central torus (rename the split-central heading), FS theorem/proposition names, corrected DHKM locators, flat versus coefficient-base central maps, arbitrary Noetherian ascent, uniform stability quantifiers, full cogenerator category, opposite Jacquet duality, correct adjoint modulus and the algebraically closed coefficient scope of Corollary 4.12.
4. Add the four crossed-cocycle APIs, qualify excursion singleton by the identity finite-Weil component, and carry all five new gaps and four new requests into the dependency/remaining lists. Preserve the 72 omitted-signature disclosure and unchecked implementation status. The executable declaration count is now 118, including the local instance, rather than 114.
5. Add source-version records and the ten checked source findings, including the published correction and EH comparison, pinned arXiv revisions and corrected CT journal metadata. Preserve the bounded author-copy scope for Pilloni/CT.
6. Explain the RT26 ownership change as the current-tier proposal above; coordinate the higher consumers instead of presenting the original LP1-owner fix as already applied to SR.6.

The revision priorities are: separate and expose actual excursion/scheme construction contracts; supply the promised signatures/API/examples under their names with unavailable conditions stated as omissions; synchronize the reader; and coordinate the proposed downward ownership move. Refinements of classical counting, modular types, essential vectors, geometric bootstrap, integral GIT, depth and Dat consequences can remain precise open gaps. None should be concealed behind a Prop-valued assumption asserting the intended theorem.

Questions for the orchestrator: arrange a revision job that includes the reader as a deliverable; coordinate LP/ES import rescoping under the current-tier instruction; and route the precise Weyl-module/ramified-building supplier refinements to their existing owners. No promotion, upstream modification or issue closure is requested in this review.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.4.json` reports **0 errors and 0 warnings**. The source-finding and source-version validators also report no errors. `git diff --check` passes. The suggested file was checked through `lean-check` against the shared pinned Mathlib build and exited successfully; all 133 warning lines are declaration-uses-sorry warnings. This checks the executable adapters and 44 examples, not the 72 commented contracts and not the proofs. No Lean server, library build, dependency update or cache download was run.

## Per-node audit

Ids below are suffixes of `SmoothRepresentationsOfLocalGroups:<stage>/`. The packet contains the full ids. “Verified” concerns the corrected mathematical planning contract and its honestly recorded gaps; it does not mean implemented or proved in Lean.

| Stage / node | Verdict | Independent check / correction |
| --- | --- | --- |
| SR.4 / `satake-transform` | corrected | Checked finite support, vol(N∩K)=1 and S=delta^(1/2)S*. Corrected published pagination; geometric carrier remains G-SATAKE-CARRIER. |
| SR.4 / `twisted-weyl-invariance` | corrected | Checked the integral twisted action and even coroot difference. Corrected pagination; folded rank-one calculation is requested from RG2.1. |
| SR.4 / `satake-isomorphism` | corrected | Checked triangular integral Satake and q-half normalization. Corrected pagination; no Weyl-order invertibility is imposed on the integral version. |
| SR.4 / `torus-character-dictionary` | corrected | Checked the unramified torus character lattice dictionary and its reference to §2.9; nonsplit Frobenius coinvariants are retained. |
| SR.4 / `frobenius-component-invariants` | corrected | Removed an unsupported integral extension of the field statement. Integral twisted quotient theory remains G-INTEGRAL-GIT; corrected pages. |
| SR.4 / `pseudoroot` | corrected | Corrected the direction of translation: TV (7.4.4) sends ordinary to twisted by multiplication by a0. The executable translate lemma has this direction already. |
| SR.4 / `spherical-parameter` | corrected | Checked the unnormalized spherical vector, theta(S*f), and inverse-pseudoroot parameter. Corrected pagination. |
| SR.4 / `c-group-formulation` | corrected | Separated capital C-group from lower c-group, which has the cyclotomic square constraint. The original statement conflated them; Theorem 7.9 is the source. |
| SR.4 / `gln-generators` | corrected | Checked the standard minuscule q-half exponent and Laurent scalar generator. Corrected locator; the all-n count is a planned specialization, not a quoted TV display. |
| SR.4 / `hall-littlewood` | corrected | Checked the rational formula and stabilizer normalization. Corrected page; universal integral Laurent cancellation remains G-HL-COUNT. |
| SR.4 / `macdonald-formula` | corrected | Checked q_E=q^2, hence q^-2 and exponent 2 rho, and branching total degree. Corrected pages; the classical proof is explicitly a gap. |
| SR.4 / `parabolic-descent` | corrected | Checked the two normalized integrals and both positive determinant twists, giving q^-b and q^-a variable substitutions. Corrected lemma/page locator. |
| SR.4 / `paired-unitary-parameter` | corrected | Checked paired tuple and reciprocal polynomial, including the product-ring obstruction E5. Corrected the definition number and pages; no general ordering existence is claimed. |
| SR.4 / `unitary-genericity` | corrected | Checked all four polynomial predicates and collision examples; retained the E27 restriction on root interpretations. Corrected the source term to level-raising speciality and its page. |
| SR.4 / `unitary-weyl-traces` | verified | Checked Liu Lemmas B.1.1–B.1.4, pp. 331–333: pinned involution, signed swap and subset trace. The formula uses the source relative torus coordinates, not arbitrary GL_N eigenvalues. |
| SR.4 / `unitary-triangular-transform` | verified | Checked Lemma B.2.6, pp. 336–337, including Gaussian coefficient and q exponent. Unitriangular inversion is valid over the localized integral ring; classical count refinement remains G-HL-COUNT. |
| SR.4 / `unitary-isotropic-counts` | verified | Checked B.2.4, B.2.7–B.2.8, pp. 335–339 and residual dimensions. Products use odd exponents 1,3,... in even dimension and 3,5,... in odd dimension; E6 is recorded. |
| SR.4 / `unitary-even-formulas` | verified | Checked B.3.1–B.3.5, pp. 339–343 and corrected E6 factor. Apparent q+1 divisions are polynomial identities, not arbitrary coefficient-ring inversion. |
| SR.4 / `unitary-odd-formulas` | verified | Checked Notation 1.3.1, pp. 119–120 and B.4.1–B.4.3, pp. 344–345. Checked odd-rank product, Gaussian d coefficients and the even-rank polynomial quotient convention. |
| SR.4 / `gsp4-spin-polynomial` | corrected | Checked all five coefficients, central generator and fixed-degree reciprocal. Narrowed the locator and replaced the irrelevant GL_n prerequisite by general Satake. |
| SR.4 / `gsp4-galois-comparison` | corrected | Replaced the ambiguous q^-3/2 twist by \|nu\|^-3/2; supplied all generator eigenvalues and corrected the mistaken §5.1.4 reference. |
| SR.4 / `derived-satake` | verified | Checked Venkatesh Theorem 3.3 and Lemmas 4.5,4.7: split G, q=1 modulo ell^r and ell prime to Weyl order retained; Morita comparison restricted to etale locus. Geometric derived Satake is not substituted. |
| SR.4 / `unitary-iwahori-center` | corrected | Corrected ramification, coefficient field and subgroup scope. CT B is an index-two extension of an Iwahori and its unitary K is special; hyperspecial comparison belongs to split Sp. Added a precise building/presentation gap. |
| SR.4 / `geometric-trace-contract` | corrected | Checked this as a classical normalization export, not the geometric equivalence. Corrected pages; geometric proof inputs stay in the moved minimum gap. |
| SR.5 / `twisted-coinvariants` | verified | Checked the psi-inverse untwist and Mathlib quotient relation; ordinary psi=1 case and arbitrary-module tensor quotient are correct. Actual nondegenerate GL_n comparison uses the requested mirabolic carrier. |
| SR.5 / `mirabolic-derivatives` | corrected | Corrected adjoint directions and distinguished Phi^+ from hat-Phi^+. Restored the sourced Noetherian W(k) coefficient regime and correct proposition locators. |
| SR.5 / `derivative-exactness` | corrected | Narrowed to the source coefficient setup rather than asserting an unsourced arbitrary-ring theorem. Tensor modules remain arbitrary, hence no flatness hypothesis is added. |
| SR.5 / `schwartz-submodule` | corrected | Checked the canonical injective mirabolic map, derivative and tensor comparison. General End(J)=End(top derivative) follows from the displayed adjunction computation; the named proposition specializes to a free line. Corrected locators. |
| SR.5 / `essentially-aig` | verified | Checked Helm Definition 3.3/Lemma 3.4 and EH Definition 3.2.1: absolute generic socle, nongeneric quotient and union of finite-length subobjects. Arbitrary-field type/duality inputs are newly exposed in G-MODULAR-FIELD. |
| SR.5 / `integral-blocks` | verified | Checked Helm center Definition 4.12, Theorems 11.8,12.8–12.9 and Corollary 12.12: mod-ell inertial blocks, reduced torsion-free finite-type centers and exact support points. Integral type refinement stays G-MODULAR-TYPES. |
| SR.5 / `type-projectives` | verified | Checked Helm Theorem 4.1, Proposition 4.3, Theorem 4.8 and Corollary 4.9: commutative type endomorphisms, admissibility, line derivative and every-prime generic fibers. Classification inputs are not treated as read proofs. |
| SR.5 / `universal-whittaker` | verified | Checked Helm Theorem 5.2 and Proposition 5.3: block center/endormorphism identification, center-admissibility and free derivative line. Existing Lean function-space prototype omits the block projector and six full API/tests. |
| SR.5 / `co-whittaker` | verified | Checked Helm Definition 6.1 and Proposition 6.2: Noetherian W(k), admissibility, free derivative line and all-prime smooth-dual AIG fibers. Scalarity is a theorem, not a replacement definition. |
| SR.5 / `universal-domination` | verified | Checked Helm Theorem 6.3: universal base change co-Whittaker, unique center character and surjection onto families with that character. No universal isomorphism claim is made. |
| SR.5 / `reduced-family-reconstruction` | verified | Checked Helm Lemma 6.4: reduced Noetherian algebra, finitely many minimal primes, prescribed generic-cosocle quotients, diagonal image, torsion-freeness and uniqueness. Reducedness is essential. |
| SR.5 / `llc-family-conditional` | corrected | Restored residue field, continuous Galois input and dual Breuil–Schneider fiber conventions. The interpolation assumption remains explicit, not an unconditional theorem. |
| SR.5 / `tensor-endomorphisms` | corrected | Checked the exact GL_2(Q_l), Noetherian Z_p and arbitrary-module theorem. Corrected Lemma B.10 and pagination; general GL_n remains a proposed Schwartz proof. |
| SR.5 / `invariants-duality-base-change` | corrected | Checked the split-projector tensor argument. Corrected nonexistent DHKM §4.2; arbitrary hyperspecial base change and scalar-dual/cogenerator-dual confusion remain excluded. |
| SR.5 / `ext-support-orthogonality` | verified | Checked EH Theorem 3.2.13/Corollary 3.2.14: exact, not merely inertial, support; all Ext degrees and GL_n Levi groups. Modular type and field adjunction inputs are explicitly G-MODULAR-FIELD. |
| SR.5 / `cg-distinct-block` | corrected | Checked ordered character variables and finite-length colimit. Corrected Corollary numbering and recorded the published formal-power-series correction; cyclic residual-unit variables remain polynomial. |
| SR.5 / `cg-derived-projector` | verified | Checked CG Lemmas 9.14–9.15/Theorem 9.16, PDF pp. 125–127. Hyperspecial-to-line-parahoric derived comparison is restricted to the distinct-residual-eigenvalue block and uses the stabilized polynomial projector. |
| SR.5 / `highest-derivative-adapter` | corrected | Restored irreducibility and complex coefficients, made endpoint shortening explicit and recorded the classification gap absent from SR.3. |
| SR.5 / `essential-vector-contract` | verified | Checked the Helm/EH derivative and generation exports. A free derivative line alone does not construct a canonical integral level vector; G-ESSENTIAL and the existing GL_2/minimal-lift ownership are retained. |
| SR.6 / `crossed-cocycles` | corrected | Checked the cocycle law, gauge formula and semidirect section. Added value extensionality, identity/composition gauge laws and covariance signatures to the actual algebraic adapter. |
| SR.6 / `finite-wild-discretization` | corrected | Checked finite presentation and chosen Fr,s discretization. Made the kernel-of-action condition explicit; no canonical global scheme independence from choices is asserted. |
| SR.6 / `finite-wild-representability` | corrected | Checked the closed relation locus over one Z[1/p] base and every Z_ell model by base change. The dimension convention satisfies RT-AREA-geomlanglands/26. Scheme API/tests still need a dedicated construction contract. |
| SR.6 / `ell-adic-extension` | verified | Checked DHKM parameters Theorem 4.1(ii)/Corollary 4.2, pp. 29–30: relative discrete ell-adic extension and choice comparison. This does not identify independently chosen integral schemes over Z[1/p]; proof refinement stays open. |
| SR.6 / `wild-strata` | corrected | Restored fixed finite wild level: finiteness across all wild levels is not asserted. Corrected the nonexistent DHKM subsection reference. |
| SR.6 / `twisted-component-finiteness` | corrected | Restored the finite-order automorphism and specified integral base required by Lemma 2.2. Corrected pages; integral twisted invariant proof remains a gap. |
| SR.6 / `tame-torus-engine` | corrected | Checked allowed normalizer components, the maximal fixed subtorus and the n Fr-q isogeny. Corrected nonexistent §2.1–2.2 and pages; closed-orbit theory remains G-INTEGRAL-GIT. |
| SR.6 / `frobenius-quotient-finite` | corrected | Checked integral Frobenius evaluation and subgroup restriction finiteness. Corrected pages; no separate good-prime condition or field-only substitute is used. |
| SR.6 / `excursion-algebra` | corrected | Checked the free-group colimit and finite Weil-action data. Corrected datum pages and restricted the singleton test to the trivial Weil-component slice. Lean currently supplies only data, not the algebra. |
| SR.6 / `excursion-invariant-comparison` | corrected | Specified that nilpotent ell-torsion concerns the kernel, not the whole algebra; corrected Theorem VIII.3.6 and the DHKM page. |
| SR.6 / `geometric-hecke-action` | corrected | Checked finite-set action, Weil descent, compact/ULA preservation and uniform wild bound. Corrected Theorem pages and Proposition IX.5.1; bootstrap remains explicitly unconstructed. |
| SR.6 / `excursion-center-action` | corrected | Corrected global versus finite-level action: inverse limit acts on the entire center, and a level is chosen for each finitely generated object. Made finite flat coefficient extension explicit. |
| SR.6 / `torus-central-compatibility` | corrected | Corrected split-center restriction to the full connected central torus needed for cuspidal finiteness. Proposition IX.6.5 proves the actual diagonal action; IX.6.4 alone identifies rings. |
| SR.6 / `parabolic-excursion-compatibility` | corrected | Checked unnormalized cyclotomic rho_G/rho_M twist and normalized cancellation. Corrected DHKM page; the geometric minimum moves down rather than importing ES upward. |
| SR.6 / `z-finite` | corrected | Checked actual center image, finite type and compact-open finite invariants. Corrected nonexistent §3.2 and pages; subquotient and coefficient lemmas use the Noetherian hypotheses. |
| SR.6 / `depth-generators` | corrected | Checked the generator/Hecke-corner reduction; corrected pages. Integral depth projectors are not provided by compact induction alone and remain G-DEPTH. |
| SR.6 / `cuspidal-embedding` | corrected | Specified the finite flat coefficient ring of Lemma 3.4, replacing an ambiguous algebraic ell-adic base; corrected page. |
| SR.6 / `cuspidal-excursion-finiteness` | corrected | Corrected the coefficient ring, full central torus and nilradical argument; fixed nonexistent §3.3. A nilpotent operator alone need not vanish on a torsion-free module. |
| SR.6 / `integral-center-finiteness` | corrected | Restored the precise bounded-depth coefficient regime and corrected Corollary 3.5 page. Lemma 3.3 ascent does not require flatness; descent does. |
| SR.6 / `parabolic-center-map` | corrected | Separated flat-coefficient center maps from arbitrary Noetherian coefficient finiteness over the scalar-extended integral center. Corrected pages and removed nonexistent §4.1. |
| SR.6 / `stable-operator` | corrected | Checked the nilpotent/invertible splitting and contracting Jacquet localization. Corrected DHKM pages; the concrete definition does not substitute ordinary scalar duality. |
| SR.6 / `ell-adic-stability` | corrected | Specified the fixed depth/compact/parabolic/contracting data and extended the uniform bound to all depth-r objects as in Lemma 4.7; corrected pages. |
| SR.6 / `cogenerators` | corrected | Corrected the false ell-primary restriction and stated fixed-depth cogeneration. Retained the rational-simple case essential to the all-Z[1/p] adjunction. |
| SR.6 / `jacquet-cogenerator-duality` | corrected | Checked the opposite-parabolic injective duality and natural stable pairings. Corrected Corollary to Lemma 4.10 and its page; no modulus is inserted in this duality. |
| SR.6 / `integral-second-adjointness` | corrected | Checked all-Z[1/p] second adjointness, opposite parabolic and unnormalized delta_P factor. Corrected nonexistent §4.2; normalized triangle identities are required. |
| SR.6 / `integral-noetherian-consequences` | corrected | Checked Noetherian Z[1/p] consequences separately from stronger Z_ell center finiteness. Corrected pages; no characteristic-p extrapolation is made. |
| SR.6 / `cuspidal-reduction-consequences` | corrected | Restored algebraic closure, arbitrary irreducible Levi input and dense-open conclusion. Replaced the unsupported characteristic-zero descent sketch by the actual cited Dat inputs and a gap. |
