# Independent review of finite isocrystals and geometric vector bundles, revision 2

Job `REV-VectorBundlesAndIsocrystals--VB0~2`, issue #7097. Reviewer: Codex, session `codex-86hI8t`, 8 October 2026. This session authored neither the original blueprint nor revision 2.

**Verdict: accepted.** This is a completed independent target-level review. All corrections required by the first review are present in the reader, and the additional corrections below are made in the permitted packet, reader and suggested file. The plan is one complete pass with five stages planned, none closed. Its seven proof and integration gaps remain explicit; acceptance does not assert proof closure or implementation.

## Counts and validation

| Check | Result |
| --- | --- |
| Nodes | 51: 45 verified, 6 corrected; none added or unverifiable |
| Kinds | 6 definitions, 12 constructions, 24 theorems, 7 comparisons, 2 lemmas |
| Definition/construction API | All 98 contracts checked; names retained |
| Unit tests | All 72 checked for scope and discriminatory examples |
| Planets | 17: VB0 4, VB1 6, ampleness 4, classification 3 |
| Baseline | All 16 full statements read at the exact pins; none removed or replaced |
| Sources | 68 node/source records, nine public PDFs with matching full SHA-256 values |
| Source issues | 19 confirmed: 15 inherited and four added; none rejected |
| Coverage | Five stages planned, none closed; target-level scope fully represented |
| Refinements | Seven named gaps; fifteen owner requests |
| Packet checker | 0 errors, 0 warnings |
| Source-issue/version validators | 0 problems |
| Submission file checker | All five permitted files: 0 problems |
| Suggested Lean | Exit 0; 77 warnings, all declaration uses `sorry`; no errors |

The Lean check used the existing shared build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, after checking available memory. Tau Ceti statements were read at `f790474821cf4256814db967cb154e7af3d0c369`. Its three suggested imports remain commented because the pinned compiled modules are absent. No library build, update, cache download or language server was started. The successful elaboration checks types of admitted Mathlib specializations, not a compiled Tau Ceti integration or the unavailable geometric theorems.

The suggested file has 36/98 typed API specializations, 30/72 example specializations, 3/33 named theorem signatures and 8/18 definition/construction interfaces. Its contract index identifies 62 omitted API signatures, 42 omitted examples and 30 omitted theorem signatures. Actual unavailable curve, annular topology, HN and diamond carriers are retained as named omissions under G-LEAN. No arbitrary proposition substitutes for those hypotheses. Every planned name and mathematical contract is accounted for; all implementation statuses remain unchecked.

## Resolution of the previous review

The previous report required reader synchronization, not a new decomposition of its valid target plan. I checked the reader sections below against the corrected packet and the cited sources.

| Previous requirement | Revision-2 verification |
| --- | --- |
| VB0 division algebra before its invariant | The early theorem states division, center, dimension and cyclic presentation; the later CFT comparison owns the invariant. |
| Galois/Frobenius compatibility | VB0 §9 uses conjugation by the coefficient lift, with ordinary commutation only in the centralizing case. |
| Infinite-free non-example | VB1 §1 requires nonemptiness and the residue-field stalk test. |
| General functor coefficient scope | VB1 §8 requires S/k; cyclic standard matrices over F_q and later geometric degree are separate comparisons. |
| Open-ball scope | VB1 §9 makes the bounded-slope and fixed algebraically closed k hypotheses explicit. |
| Degree/regularity locators | VB1 §§12,15,16 have the corrected phrase and FF printed pages 162–164. |
| K₀ ownership | Ampleness §1 and its supplier contract use Z.1 finite-projective presentations, not Z.2 rank. |
| Norms, actions and ampleness citations | The action is E-linear and imports generation; KL6.3.18, 8.7.7 and 8.8.2–4 have their correct type and pages. |
| Key extension in equal characteristic | The reader and A1/G-KEY use the perfected analytic affine line and allow fractional exponents before π-linearity. |
| Classification torsor step | The Isom torsor is used conditionally after triviality over an extension is established by induction. |
| Hom/Ext ambient category | The abelian module-sheaf/QCoh category, GAGA and two-affine inputs are explicit. |
| Coherent sheaf scope | The general-E proof uses regular DVR charts, not KL absolute Prüfer rings, and cites CN3.9(iii). |
| Source corrections and suggested limits | E15 is confirmed with the twist sign; FF/SW editions and the typed/omitted counts agree. |

## Corrections made by this review

1. **Both coefficient adjunctions.** FS II.2.14, pp. 70–72, transfers a nonzero map from O(s) to the pullback of a slope-s/h bundle into a map from O(s/h) to the original bundle. The earlier Adj contract only stated pullback left adjoint to induction, which gives the opposite Hom direction. The corrected contract states both directions. A finite separable trace pairing identifies restriction with coinduction; finite cyclic induction equals coinduction. On a finite étale curve map this is trace self-duality of the pushed-forward structure sheaf. SF.1 now supplies both units/counits and Frobenius compatibility, without division by the degree. Classification explicitly uses the reverse map transfer, and twist cohomology directly lists Adj. SW13.5.7, printed p. 114, independently supplies the perfect-trace input. [Stacks Lemma 49.3.1, tag 0BVH](https://stacks.math.columbia.edu/tag/0BVH) corroborates that finite locally free étaleness is characterized by that perfect pairing; no new generic trace development is duplicated here.
2. **Actual supplier integration state.** The current RF0 packet already narrows RF3 to rank-one twists and partial homogeneous charts. The current VB3 definition/Lubin–Tate nodes already have early analytic VB1 prerequisites. The inherited G-INTEGRATION description incorrectly reported these repairs as absent. A remaining cycle is concrete: the VB3 fundamental exact sequence node bundles its early untilt sequence with a VS1 divisor-to-Weil comparison; VS1 consumes later classification, which uses that early sequence. A new request isolates the sequence/divisor identification from the later Weil comparison. G-INTEGRATION and the restructuring note now describe this residual task, and the reader recognizes the completed retargeting. The current VB3 packet remains under a needs_changes review; acceptance here does not certify that supplier as closed.
3. **FF tensor-calculus proof.** FF5.6.23, pp. 181–183, has projection, pullback, degree and tensor-index slips, plus noncoprime reduction gaps. The Hom/Ext sketch now keeps both degree/rank pairs and divides both denominators by their gcd before applying the coprime calculation. E16–E19 record the source findings and their explicit repairs. These partly overlap confirmed FF extraction findings E116–E120, so their known fields identify that record rather than claiming discovery. The current author copy already fixes the older condition-number slip in E120, but retains its sheaf-subscript slip.
4. **Locators and provenance.** Lurie Theorem 6 is on p. 2; FF8.2.10 continues to p. 239; the FF5.6.23(4)–(5) proof is on p. 183; SW13.5.7 and its proof are on printed p. 114 (PDF p. 124). Source access and exact-pin baseline confirmations are dated 8 October. The previous packet verdict and inherited source verdicts are retained in review history. The suggested index has the corrected two-sided adjunction contract; its already valid typed code is retained.

No nodes, API names, unit-test names or planets were added or removed. Six nodes changed: the DM source locator, Adj, twist cohomology, geometric classification, Hom/Ext and the finite étale theorem locator. All other changes are source findings/provenance, owner contracts, integration-gap accuracy, the review object and synchronized reader prose.

## Baseline and library audit

The reviewed library catalogue has no entry for this roadmap; absence is not an audited zero-coverage result. All sixteen cited declarations were read in their stated modules at the pins. The plan reuses the following infrastructure and does not relabel it as missing work.

| Declaration | Confirmed contract and boundary |
| --- | --- |
| `mathlib:WittVector.FractionRing.frobenius` | Ring automorphism of Frac(W(k)) for perfect characteristic-p domain k; q-Frobenius is its appropriate iterate. |
| `mathlib:WittVector.Isocrystal` | Module over Frac(W(k)) with a bijective p-Frobenius-semilinear equivalence; no finite-dimensionality field. |
| `mathlib:WittVector.IsocrystalHom` | Linear maps commuting with Frobenius. |
| `mathlib:WittVector.IsocrystalEquiv` | Intertwining linear equivalences. |
| `mathlib:WittVector.StandardOneDimIsocrystal` | Rank-one block with Frobenius p^m times coefficient Frobenius. |
| `mathlib:WittVector.isocrystal_classification` | Only the finrank=1 classification over algebraically closed k. Does not supply higher-rank Dieudonné–Manin. |
| `mathlib:AlgebraicGeometry.Scheme.Modules` | Sheaves of modules over a scheme structure sheaf; underlying carrier of schematic bundles. |
| `mathlib:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData` | A local generator family whose free-to-module maps are isomorphisms; does not impose finite ranks. |
| `mathlib:SheafOfModules.LocalGeneratorsData.IsFiniteType` | Each local generator family is finite. Combine with locally free data on the SAME family for bundles. |
| `tauceti:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation` | Finite locally free local generator data implies finite presentation. |
| `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` | Full subcategory of invertible structure-sheaf modules on a scheme. |
| `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass` | Isomorphism classes of invertible sheaves; tensor-product commutative monoid at this pin, with equality iff underlying sheaves are isomorphic. |
| `mathlib:CommRing.Pic` | Picard group of a commutative ring, defined from invertible modules; does not compute Pic of the curve. |
| `tauceti:TauCeti.CSA.of` | Bundles an already central simple finite-dimensional algebra; does not construct cyclic algebras or arithmetic invariants. |
| `tauceti:TauCeti.BrauerGroup.mk_end` | The Brauer class of End_K(V) is split for nonzero finite-dimensional V. |
| `tauceti:TauCeti.BrauerGroup.baseChange_mk` | Algebraic Brauer class commutes with scalar extension. |

The upstream AdicSpaces and RepresentationTheory/SemisimpleAlgebras roadmaps were read for the expected density and declaration style; the LocalFieldsRamification Frobenius layer and ClassFieldTheory Layers 5–9 were read for the exact supplier scopes. Generic local invariants and cyclic-algebra arithmetic remain CFT owner requests. The upstream note preserves the mixed-characteristic scope of its current Layer 9 reciprocity isomorphism.

## Closure, granularity and the assigned area findings

Every scoped stage target is represented. VB0 covers finite semilinear categories, blocks, classification, tensor/dual slopes, endomorphisms, invariant specialization and coefficient/Galois descent. VB1 covers the analytic descent/cohomology prefix and the geometric degree/saturation/HN prefix. VB2:ampleness covers generation, global Proj coverage, compatible twists, GAGA, coherent correspondence, norms/actions and the full ampleness criteria. VB2:classification covers stability, HN base change, the key extension, classification, Hom/Ext, endomorphisms, coherent sheaves and finite étale algebras. VB2 aggregates its two children. This is target granularity: proof calculations were clarified without inventing a lemma-level expansion.

I read the exact current R3 finite-free, Kiehl-gluing and trace statements; D0 Čech comparison, D2 v-function/acyclicity and D3 torsor statements; RF0/annuli, RF1, RF2 and both RF3 statements; and the current VB3 basic statements. SF0/SF1, A1, Q4, Z1 and VS1 were checked at their actual milestone descriptions. Where the supplier does not yet state the required exact theorem, the request specifies its extension instead of pretending its broader title proves the input.

**RT-AREA-padic-1/21** is addressed by rank-one RF3 descent, partial homogeneous charts, an early bundle/Frobenius-complex prefix, the early basic BC sequence, an independent geometric cover before degree/HN, and general-S global coverage only after generation. G-GEOM and G-HN explicitly reserve the reordered coverage and boundedness proofs. The refined G-INTEGRATION identifies the remaining exact-sequence/VS1 split; it no longer incorrectly asks for RF3 and basic VB3 retargetings already present. The local declaration DAG is acyclic; the proposed graph uses narrowed supplier contracts and is not presented as the repaired current aggregate graph.

**RT-AREA-geomlanglands/31** is addressed by the constant finite étale algebra export. A finite separable E′/E still gives a coefficient cover; geometric coefficient base change splits it. The proof uses trace, geometric bundle classification, slope-product nilpotence and constant H⁰ algebra operations. VS1 owns SW16.3.2–6, the divisor-to-Weil map and Drinfeld’s lemma; this packet requests that consumer integration and does not reproduce those developments. Its upstream note retains the equal-characteristic reciprocity boundary.

The seven remaining refinements are precise: G-DM names the eigenvector and equal-characteristic proofs; G-GEOM the independent geometric separation/localization comparison; G-HN bounded subbundle degrees and generic-fiber axioms; G-GG the general-E normalization of the corrected contraction route; G-KEY the analytic/perfected affine-line and open-image input; G-INTEGRATION the early-sequence/late-Weil split; G-LEAN the actual missing carriers. None is a hidden proof claim. Fifteen owner contracts terminate the external parts of the proposed dependency chains.

Every definition/construction has at least three discriminatory tests. Examples check semilinearity rather than linearity, numerator/denominator and sign choices, finite rank, nonempty infinite-free failures, tensor ranks, global rather than pointwise étaleness, zero-slope cohomology scope, saturated degree defects, HN rank weighting, fixed-twist norm equivalence and the tensor-ampleness quantifier. The 17 planets name the principal objects/theorems; no stage exceeds six or uses a caveat as a planet.

## Public sources and source findings

All nine PDFs were independently downloaded and their bytes matched the packet's complete hashes. The table lists mathematical passages checked, not source excerpts or a section-by-section summary. FF main-text printed pages have PDF offset +60, SW +10, CS −648 and Ked05 −446. FF pp. 182–183 were also checked as page images to distinguish actual formula slips from text extraction.

| Source | Passages checked in the public version |
| --- | --- |
| [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) | II.1.11–14 and II.1.22, pp. 53–57: classical points, annular rings and quotient curve; II.2, pp. 57–72: complete descent, basic cohomology, ampleness, GAGA and geometric classification proofs; II.3.4, p. 79: relative slope-vanishing uses assigned to the VB3/VB4 part |
| [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf) | 5.5.1–5.5.6, pp. 162–164: exact-category HN axioms, filtration, polygons, fixed slope; 5.6.22–5.6.23, pp. 181–183: pullback, tensor, dual and Hom/Ext of slope bundles; 8.2.3–8.2.4, pp. 236–239: isocrystals, cyclic endomorphism algebra, coefficient adjunction, classification; 8.5.1 and 8.6.1, pp. 248–249: geometric simple connectivity and finite étale algebras |
| [KL15](https://arxiv.org/pdf/1301.0792) | 6.2.1–6.2.6, pp. 135–137: complete contraction and two-half-annulus generation proof; 6.3.5–6.3.19, pp. 138–143: Prüfer charts, categories, invariant norms and cohomology; 7.3.4–7.3.5, pp. 148–149: local and global pure/étale models; 8.7.6–8.7.7, p. 178: two affine charts and cohomological dimension; 8.8.1–8.8.9, pp. 180–182: global ampleness, power and cohomology criteria, affineness |
| [CS17](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) | 3.2.10–3.2.13, printed p. 681: relative tilted Robba ring and Frobenius modules; 3.3.4, printed p. 683: exact tensor equivalence with curve bundles |
| [CN25](https://arxiv.org/pdf/2108.12785) | 3.2.1–3.2.4, pp. 14–15: Q_p curve, closed points, completed local rings, slopes and cohomology; abstract Banach–Colmez theory remains VB3-owned |
| [SW20](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf) | 13.5.7 and proof, printed p. 114 (PDF p. 124): finite étale algebras and classification argument for simple connectivity |
| [Ked05](https://ems.press/content/serial-article-files/25974) | 2.0.1 and 2.1.1–2.1.4, pp. 451–452: ramified Witt coefficients and Frobenius; 3.1.1–3.1.6, pp. 477–478: standard modules and pushforward; 4.1.1–4.1.2, printed p. 487; 4.5.1–4.5.12, pp. 497–499: Dieudonné–Manin and descent; Lemma 4.3.3 remains a specifically identified proof input |
| [Lurie26](https://www.math.ias.edu/~lurie/205notes/Lecture26-Isocrystals.pdf) | Definition 1 and standard blocks, p. 1; Theorem 6, p. 2; Warning 17, p. 3 on lack of full faithfulness |
| [GLX26](https://arxiv.org/pdf/2208.07195) | 5.1, pp. 31–32: tensor isocrystal input to filtered/G-isocrystal consumers; filtered objects are outside this part |

Published-edition conclusions are made only for the publisher PDFs actually read (CS17 and Ked05). KL, CN and GLX findings/use are scoped to the stated arXiv versions; FF and FS use the exact hashed author copies. The older FF extraction’s pagination is preserved as historical provenance, not silently substituted for the current copy. No restricted library source was needed.

All inherited findings were rechecked at their own locator, with a new independent review verdict and the old verdict retained as history. The following checks explain why the corrections are used.

| Finding | Independent check |
| --- | --- |
| E1 — confirmed | The KL8.8.4 proof on pp. 180–181 treats one nonvanishing chart; sections extended from that chart cannot generate along its complement. Repeat on the other degree-one chart and choose a common extension exponent. |
| E2 — confirmed | KL8.8.6 on p. 181 invokes the generation lemma while deriving vanishing from generation. The independently established difference-equation vanishing in 6.2.2 breaks the circular implication. |
| E3 — confirmed | The exponent and chosen divisor in KL8.8.6 depend on the test twist e. Fix n₀ at e=0 first, then choose each later exponent as a multiple of n₀; this gives one power satisfying the global ampleness quantifier. |
| E4 — confirmed | In CN §3.2.2 p. 14, O(5)→O(5)⊕O→O satisfies the stated lower/upper hypotheses for [0,1] but has an HN slope 5. Bounds on both terms repair the extension claim. |
| E5 — confirmed | For f=Σ[r_i]π^i, comparing the coefficient of π^i in φ(f)=π^n f gives φ(r_i)=r_{i−n}. FS p. 63 has the index in the opposite direction. |
| E6 — confirmed | At λ=1/2 the denominator cover has degree two and the invariant equation is φ²=p, so the FS p. 63 display with numerator and denominator exchanged gives the wrong slope. |
| E7 — confirmed | For n<−1 the displayed O(−n) on FS p. 64 is positive and has no H¹ on affinoids. The consecutive negative-twist sequence O(n)→O(n+1) gives the required induction. |
| E8 — confirmed | With the FS radius ρ=log\|ϖ\|/log\|π\| and \|ϖ\|=q^−1, one has \|π\|=q^−1/ρ. In equal characteristic a constant π^M term in the difference equation gives the size q^−M/q at radius q, exceeding q^−M−1; the homogeneous correction cannot cancel that coefficient while converging on the annulus. The printed p. 65–66 estimate fails. |
| E9 — confirmed | The calculation on FS p. 66 must retain π^−N. After inverse Frobenius iteration the valuation bound has the extra −N term, M+(q−1)N−N′; the printed implication therefore fails already at q=2. A separately chosen cutoff or the KL contraction route is required. |
| E10 — confirmed | The p. 67 construction is on the union of homogeneous nonvanishing opens. For P¹ with the chosen line O(−1), all positive-degree section spaces are zero, so that union is empty. Chart coverage needs the generation hypothesis. |
| E11 — confirmed | FF Theorem 5.5.3 p. 163 places degree before rank. Polygon segments have horizontal length rank and slope degree/rank; the O(1/2) endpoint is (2,1), forcing (rank,degree). |
| E12 — confirmed | FF Definition 5.5.5 p. 164 includes the identity strict subobject in its stability test. That would demand μ(V)<μ(V); restricting to nonzero proper subobjects agrees with the fixed-slope simple-object characterization. |
| E13 — confirmed | The rings in FF pp. 229,234–236 are integral Witt rings where scalar fields are required. Invert π for finite-dimensional isocrystals, and distinguish the cyclic division algebra from its integral order. |
| E14 — confirmed | FF p. 238 places the coefficient pullback/pushforward diagram in a category labelled Fix although its objects are vector bundles; use Fib and correct the primed coefficient subscript. |
| E15 — confirmed | KL Definition 6.2.1 p. 135 scales twisted Frobenius by p^−n. Fixed vectors in M(n) satisfy φ(v)=p^n v, not the p^−n equation in 6.3.17 p. 142. A rank-one φ(v)=pv example distinguishes the spaces; reindexing preserves the norm-equivalence theorem. |
| E16 — confirmed | The preceding projection formula tensors the trivial rank-δ pushforward with O(d/δ). At d=0,h=2 the printed conclusion would turn the trivial rank-two bundle into O(1)^{⊕2}. |
| E17 — confirmed | The displayed pullback has the wrong target. For n=4,h=2,δ=2 the claimed coprime reduction still has gcd(2,2)=2. The final decomposition has slope nd/h; replacing it by d/h loses the coefficient degree factor. |
| E18 — confirmed | The first printed tensor has rank h₂² but its pushforward expression has rank h₁h₂. Its numerator drops d₂. For h₁=4,h₂=2 the supposed coprime pair (2,2) is not coprime; decomposing both denominators before using that case restores rank and degree. |
| E19 — confirmed | The finite-map cohomology identity computes the pushforward of the line on X_h, so its sheaf must live on X_h. The current copy repairs the older condition-number slip but retains this subscript slip. |

## Node-by-node verdicts

Verified means a source-faithful, justified target plan with its named proof or supplier refinement retained. It does not mean a Lean proof exists.

| Node | Verdict | Check |
| --- | --- | --- |
| `VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block` | verified | Finite dimension is added to the existing Witt carrier; coefficient automorphism, fixed field, fraction field and morphism intertwining are retained. The raw category does not require annular geometry. |
| `VectorBundlesAndIsocrystals:VB0/rational-standard-block` | verified | The cyclic matrix has positive rank and invertible wrap coefficient. The zero exponent and rank-one Witt tests distinguish the operator from its inverse; nonreduced blocks are permitted. |
| `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals` | corrected | Ked05 4.5.5–8 supplies the mixed-characteristic route; the rank-one library theorem is not overstated. Added p. 2 to the Lurie statement locator. G-DM explicitly reserves its missing eigenvector input and equal-characteristic proof. |
| `VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes` | verified | The inverse-dual operator intertwines evaluation. The block multiplicity h_a h_b/h_{a+b} preserves rank; the half-slope tensor has four rank-one summands, as Ked05 Lemma 4.1.2 requires. |
| `VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra` | verified | Solving the cyclic intertwining equations gives center E and dimension h²; simplicity makes nonzero endomorphisms invertible. The early calculation does not invoke the later invariant comparison. |
| `VectorBundlesAndIsocrystals:VB0/slope-division-algebra` | verified | The chosen arithmetic cyclic presentation has Π^h=π^d and dimension h². The generic central-simple/cyclic machinery stays with the CFT supplier and existing CSA carrier; only slope specialization is planned here. |
| `VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign` | verified | For the chosen arithmetic generator the invariant is d/h. Opposite algebras negate it and scalar extension multiplies by total degree; the requested algebraic/cohomological comparison is explicit. |
| `VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction` | corrected | Added the reverse trace adjunction required to transfer O(s)→f*V into O(s/h)→V. Finite cyclic induction/coinduction and separable trace self-duality give both Hom identities without dividing by the degree. Strengthened SF.1 and added the trace locator. |
| `VectorBundlesAndIsocrystals:VB0/finite-galois-descent` | verified | The conjugation identity Φ′ρ_g=ρ_{σ′gσ′^{-1}}Φ′ preserves the invariant space for both Φ′ and its inverse. Ordinary commutation is correctly limited to a centralizing lift. |
| `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles` | verified | One generator witness is both finite and free, matching the pinned finite-presentation theorem. The infinite-free non-example uses a nonempty curve and a residue-field stalk, avoiding the empty-scheme exception. |
| `VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent` | verified | The quotient presentation, finite-projective Kiehl gluing and Stein inputs precede degree and classification. Tensor, dual and rational pullback APIs respect equivariant transition data. |
| `VectorBundlesAndIsocrystals:VB1/tilted-robba-ring` | verified | The directed annular completion and designated Frobenius match CS17 §§3.2–3.3. Base-change and coefficients retain the affinoid pair; RF0 supplies the general-E ring comparison rather than a new period construction. |
| `VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules` | verified | Finite projective modules have invertible linearized Frobenius. Global integral étale models impose stronger data than pointwise zero slopes, as KL7.3.4–5 explicitly distinguish. |
| `VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence` | verified | CS17 Theorem 3.3.4 gives an exact tensor equivalence for finite projective objects. The proof uses annular spreading and effective gluing rather than replacing arbitrary sheaves by modules. |
| `VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology` | verified | The two-term complex and derived comparison use an E-linear φ−1 map. They retain kernels, cokernels, derived functoriality and the unit case; no larger-ring linearity is asserted. |
| `VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology` | verified | FS II.2.1 matches the D2 function-descent and higher-acyclicity contracts. The fpqc module descent request supplements these v-inputs rather than claiming fpqc descent alone suffices. |
| `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor` | verified | General coefficients require the specified k=bar F_q structure on S. Cyclic standard bundles remain defined over F_q; the negative slope sign, base-change and later geometric degree comparison agree with the packet and reader. |
| `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists` | corrected | All three sign cases and the bounded positive open-ball claim have their source scopes. Added Adj as a direct denominator-cover input and isolated the early fundamental sequence from its later VS1 consumer in the supplier request. |
| `VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains` | verified | FS II.1 distinguishes classical maximal ideals from all adic points. Annular Dedekind/PID facts are separate from curve-complement PID facts; the Q4 geometric quotient extension is requested precisely. |
| `VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover` | verified | The elementary coverage/localization prefix is explicitly independent of general-S GAGA. G-GEOM retains the existence/separation and overlap comparison steps that the printed proof order does not supply. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point` | verified | Regularity, noetherianity, dimension one and PID complements have geometric-point hypotheses. They do not assert finite type over E; the early chart comparison remains G-GEOM. |
| `VectorBundlesAndIsocrystals:VB1/completed-local-ring-comparison` | verified | CN §3.2.1 and the RF2 degree-one completed Cartier ideal contract match. Residue fields and chosen local uniformizers vary with the untilt; Q_p is a specialization, not an all-E assumption. |
| `VectorBundlesAndIsocrystals:VB1/picard-degree` | verified | The Picard computation uses one completed DVR and a PID complement. Existing invertible-sheaf classes and ring Picard groups are carriers, not the new curve computation; classification is not used to establish its own degree. |
| `VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism` | verified | Determinant degree is integer-valued at the connected geometric curve, and slope requires nonzero rank. Tensor/dual and exact-sequence identities match the rank-weighted formulas; no global relative degree function is invented. |
| `VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree` | verified | Saturation removes finite-support torsion from the quotient. DVR lengths measure the determinant degree defect; the O(−1)→O test detects the false equal-rank-implies-isomorphism shortcut. |
| `VectorBundlesAndIsocrystals:VB1/geometric-semistability` | verified | Only proper nonzero saturated subbundles enter the stability test. Equal-slope direct sums are semistable but not stable; zero is separately admitted in slope categories and receives no slope. |
| `VectorBundlesAndIsocrystals:VB1/harder-narasimhan-filtration` | verified | The ranked decreasing filtration and threshold functoriality match FF5.5.1–4 and FS II.2.12. G-HN retains bounded subbundle degrees and meromorphic trivialization without using ampleness or classification. |
| `VectorBundlesAndIsocrystals:VB1/harder-narasimhan-polygon` | verified | Cumulative ranks are horizontal and degrees vertical; ranked segment lengths give endpoint (2,1) for O(1/2). Concavity and equal-slope merging agree with the filtration APIs. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation` | verified | The two-half-annulus KL6.2.2–4 contraction route supplies all sufficiently large twists. The optional K₀ stabilization comes from Z.1; G-GG retains the general-E normalization and excludes the defective FS estimates. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists` | verified | The homogeneous chart union is proved to cover only after generation. Consecutive sufficiently large invertible shifts define the degree-one line and all tensor powers, avoiding an unjustified naive Proj shift. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence` | verified | The exact tensor bundle and cohomology comparisons use the actual generation/vanishing hypotheses of FS II.2.7. Coherent correspondence over arbitrary relative bases is not inferred. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/independence-of-positive-twist` | verified | Only line bundles meeting the generation/vanishing hypotheses are compared. Intrinsic affine nonvanishing charts yield the cocycle identification; the affineness input is a direct prerequisite. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/prufer-and-coherent-correspondence` | verified | KL6.3.5–14 is used in its absolute analytic-field scope. The finite-presentation coherent comparison allows torsion objects, whereas bundle objects are finite projective; relative Bézout claims are excluded. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/norms-on-twisted-invariants` | verified | The Banach topology is independent up to equivalent norms for each fixed twist. The π^n eigenvalue convention repairs KL6.3.17; no uniform constant over n is claimed. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/continuous-frobenius-group-actions` | verified | The group acts by continuous E-algebra automorphisms fixing π. KL6.3.18 uses global generation, present as a direct input; the typed prototype has the matching algebra-automorphism and intertwining data. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension` | verified | KL8.7.6 supplies two sections with no common zero. Separatedness makes their intersection affine; the two-open Čech complex and affine QCoh acyclicity give H^i=0 for i≥2. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness` | verified | The all-finite-type-QCoh tensor-power quantifier, test-sheaf-dependent threshold and strong rational locality match KL8.8.2. The zero bundle satisfies this convention vacuously, while the unit fails against a negative line. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/ampleness-power-criterion` | verified | A positive tensor-power exponent is required. Decomposing all large exponents into finitely many residue classes gives the reverse implication of KL8.8.3. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/positive-lines-and-finite-type-presentations` | verified | The corrected KL8.8.4 proof extends generators on both affine charts with a common exponent. The finite-type QCoh quantifier and denominator-clearing input have the needed nonnoetherian scope. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/cohomological-ampleness-criterion` | verified | The vanishing-to-generation and generation-to-vanishing implications avoid the printed circular step. Fixing n₀ before every test twist repairs the quantifier issue in KL8.8.6. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness` | verified | A global integral étale model and a positive twist are required. The untwisted unit and merely pointwise-pure non-examples detect missing hypotheses; G-GG retains the all-E coefficient comparison. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness` | verified | The nonvanishing locus of a positive section is affine, including the empty locus. Cohomological ampleness and the generic QCoh affineness criterion supply the proof, and graded localization gives the ring. |
| `VectorBundlesAndIsocrystals:VB2:classification/standard-bundle-stability` | verified | After denominator pullback, wedge injections and negative H⁰ bound every subbundle slope. Coprimality rules out equality at smaller rank, giving stability before classification. |
| `VectorBundlesAndIsocrystals:VB2:classification/fixed-slope-abelian-category` | verified | Kernels and cokernels are corrected by saturation and slope inequalities. The zero object is present; finite length does not prematurely identify the simple objects with standard bundles. |
| `VectorBundlesAndIsocrystals:VB2:classification/HN-filtration-base-change` | verified | Extension of C preserves slopes, while coefficient extension scales them by total degree. The local adjunction and HN uniqueness supply the comparison; the two changes of field are not conflated. |
| `VectorBundlesAndIsocrystals:VB2:classification/key-extension-lemma` | verified | FS II.2.15 uses the extension and affine-line contradiction after allowing field extension. Mixed-characteristic analytic and equal-characteristic perfected affine lines are distinguished; G-KEY/A1 retain the missing comparison and open-image proof. |
| `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles` | corrected | Made the reverse trace adjunction explicit in fixed-slope reduction and extended the FF statement locator through p. 239. The conditional Isom torsor argument and rank induction avoid assuming local triviality before proving it. |
| `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus` | corrected | Ext is in the abelian module-sheaf/QCoh category, using direct GAGA and two-affine cohomology inputs. Expanded the tensor proof to repair both denominators before the coprime step and corrected its proof locator to p. 183. |
| `VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison` | verified | Equal-block endomorphisms compare to the cyclic division algebra with dimension h². This full comparison on one simple block is compatible with failure of full faithfulness between different slopes. |
| `VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification` | verified | Regular DVR charts give the finite-support torsion part and locally free quotient. Finite-support H¹ vanishing splits the extension noncanonically; CN3.9(iii) is the Q_p specialization, with no absolute Prüfer input imposed on general E. |
| `VectorBundlesAndIsocrystals:VB2:classification/finite-etale-constant-algebras` | corrected | Trace self-duality and nilpotence exclude nonzero slopes; H⁰(O)=E makes the algebra structure constant. Coefficient-field covers remain over E. Corrected SW proof pagination to printed p. 114 and retained the VS1 export. |

## Actions for the orchestrator

- Integrate the narrowed early fundamental exact sequence separately from the VS1 Weil/reciprocity comparison; preserve the RF3 and basic VB3 repairs already present. Adjust aggregate parent ordering to the resulting declaration graph.
- Keep G-DM, G-GEOM, G-HN, G-GG and G-KEY open until their named proofs or supplier extensions are written. This accepted review is not a closure certificate for those obligations.
- Have VS1 consume the finite étale constant-algebra export with the appropriate characteristic scope for reciprocity. Apply the proposed reader sublayers through the ordinary restructuring process.

No unresolved question blocks this review. The packet, definitive reader and suggested contract index are consistent; no Tau Ceti roadmap, atlas data, supplier file or promotion was edited.
