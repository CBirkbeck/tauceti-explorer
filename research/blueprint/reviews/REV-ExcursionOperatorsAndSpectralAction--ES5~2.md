# Independent review: Schur parameters and functoriality, revision 2

Job: `REV-ExcursionOperatorsAndSpectralAction--ES5~2`. Issue: [#7048](https://github.com/CBirkbeck/tauceti-explorer/issues/7048). Reviewer: Codex, `codex-czFgim`. Date: 2026-10-09. Reviewed revision: `BP-ExcursionOperatorsAndSpectralAction--ES5~2`, authored by a different worker; this session authored neither the original plan nor its revisions.

## Verdict and counts

**Accepted at target level.** The source-backed proof plans now establish the universal-coefficient torus operator/sign and the rational-central-character comparison over every nonarchimedean local field. The earlier rejection's two unverified torus nodes and missing all-field target are resolved. This is acceptance of a plan: all implementation statuses remain unchecked, and every stage remains planned rather than closed.

| Item | Reviewed result |
| --- | --- |
| Nodes | 21: 2 definitions, 2 constructions, 16 theorems, 1 comparison |
| Per-node verdicts | 19 verified, 2 corrected, 0 unverifiable |
| Nodes added or deleted | 0 |
| Definition/construction APIs | 22: 5, 7, 5, 5 on the four respective nodes |
| Named unit tests | 12, three per definition/construction |
| Planets | 13: ES5 has 5, ES6:functoriality has 6, ES6:duality has 2 |
| Baseline declarations | 27, all confirmed at the exact pins; none removed |
| Sources / node-source references | 7 public sources / 34 references |
| Source issues | 10: E2–E6 reconfirmed; E7–E11 added and confirmed |
| Requests / gaps | 14 / 9, precise owner or prototype interfaces |
| Coverage | Four planned stages, none closed; complete target-level pass |

The library audit for ES5/ES6, the supplier statements, the earlier review and revision handoff, and confirmed red-team findings were read. Upstream InductionRestriction and CompactGroups were read as density/API models; ClassFieldTheory layer 9 was checked for field range and Artin conventions. The packet does not rebuild upstream mathematics.

## Proof-critical review

### Torus endpoints, signs and arbitrary coefficients

FS VI.1.6–VI.1.9, pp. 193–194 and VI.2.2–VI.2.4, pp. 197–198 fix relative position on the first bundle. For the Std modification, holding output O(d+1) fixed makes the input O(d+1)(-D). Tensoring away the output identifies the input frames with Isom(O(-1),O(-D)). Fargues Remark 2.17, pp. 10–11 supplies that frame torsor. A section f with divisor D gives O(D) to O(1); dualizing yields the input frame, and scaling f scales that frame in the same direction. The stated associated-module convention consequently transports vectors by the representation's direct action.

FS II.2.2–II.2.4, pp. 60–61 and Fargues Proposition 2.16, pp. 9–10 identify the height-one cover. The descent operator and the residue-Frobenius transport are inverse directions: Fargues Proposition 3.3 proof, p. 13 yields transport by the inverse uniformizer for arithmetic Frobenius. The inertia action agrees with the inverse arithmetic-Artin character. Thus the packet's geometric reciprocity is arithmetic Artin precomposed with inversion, and its inverse function is the frame-transport map. Std-dual contributes inverse transport. HS4's independent-leg action and actual creation/evaluation triangles give the ratio of the two leg actions; torus Satake has no rho shift and rank-one evaluation adds no scalar. This checks the endpoint sign, including the unramified inverse-eigenvalue test.

The calculation is performed on the actual left regular module over Lambda[E-times/K], naturally in arbitrary Lambda and under K-refinement, before character specialization. FS IX.5.1–IX.5.2, pp. 327–329 supplies objectwise compact finite-wild factorization; the wild level can be refined so its reciprocity image is inside K. The torus finite-piece group algebra has a Laurent valuation factor, and excursion presentation is an isomorphism here because dual torus pi_1 has no torsion. Its group generators determine the action. Evaluation of regular multiplication on the identity basis element detects every coefficient, including nilpotents. Taking each completed coordinate and then every degree proves the diagonal map of IX.6.5, p. 333. No inference from field-valued points to integral equality occurs.

The reusable coefficient-free cover, full equal-characteristic reciprocity and induced-torus resolution are precisely requested from their existing owners. They are not claimed formalised by the algebraic suggested fragments.

### Rational central characters over every local field

The replacement for the false connected-centre surjective cover is valid. A finite permutation lattice surjecting onto the character module of the multiplicative-type centre embeds that centre in a torus with torus quotient. The central fppf pushout has the same adjoint group and smooth torus centre. This elementary construction uses no p-adic H1-killing argument. RG2.6 owns its scheme and dual-group interfaces.

For the central surjection G times T to Gplus, Henniart–Vignéras Lemma 3.1 and Proposition 3.3, pp. 238–240 give a closed normal rational image H and compact abelian cokernel, after the explicit proof corrections E7–E9 below. H need not be open. The map onto H is open by the locally compact sigma-compact group argument: compact neighbourhood images and Baire category suffice. Smooth extension of the rational central character follows by first passing through a compact-open discrete quotient of T(E), then extending into divisible L-times. This proves smoothness rather than merely abstract extension.

The representation tau on H is irreducible and admissible. Compactness of the quotient makes its smooth induction admissible, by the finite double-coset invariant calculation. Choose a nonzero finitely generated subrepresentation, apply finite length, and take an irreducible subobject. Right-adjoint Frobenius reciprocity produces a nonzero map from its restriction to tau, which is surjective. This is exactly the weaker route of section 2.2.4(2), p. 236. Vignéras sections 4–5, pp. 337–340, especially the finite-length assertion on p. 340, supply the early input. Property (2-2), Theorem 3.2, Dat noetherianity, SR.6 and ES7 are not proof inputs.

HS4 clause (d) supplies the pre-evaluation adjoint-isomorphism kernel comparison. VS4 restriction to the neutral open stratum is ordinary restriction of the induced representation; the entire bundle pullback need not be supported there. Natural central operators pass through the surjective equivariant map to pi. ES5 uniqueness therefore projects the larger parameter to the original one and transfers its actual T-central character to the original Z(E)-character.

After aligning conjugacy through the central dual quotient, the difference of two continuous lifts is a central Weil crossed cocycle. For a nonsplit quotient torus this is not an ordinary homomorphism. Torus reciprocity and rational-point naturality show that the difference character pulled back to T(E) is trivial on Z(E); surjectivity of T(E) to C(E) is unnecessary. A common torus pushout compares different choices, using one further quotient lift and this fixed-pushout comparison. Central projection preserves semisimplicity by pulling back parabolics and applying the LP2 Levi criterion. These steps establish independence of choices.

Kaletha Definition 5.1, Proposition 5.2 and Corollary 5.3, pp. 17–19 are retained in their p-adic range as the stronger injective construction. Conrad Proposition 4.1.7(i), p. 22 and the flat Kummer example separate this from the impossible full centre-H1 bijection for mu_p over F_q((t)). The weaker all-field target requires no such bijection.

### Other non-routine interfaces

The admissible Schur proof uses a nonzero finite-dimensional fixed-vector space, an eigenvalue over L and irreducibility to propagate the scalar. The enriched fixed-vector comparison identifies families with relatively discrete scalars without asserting compactness of pi. VS4 supplies the fully faithful left adjoint with invertible unit; the additional condensed and eligible right-extension interfaces remain explicit requests. The two extensions' centre actions compare through restriction and adjunction triangles.

FS VIII.3.8, pp. 289–290 and IX.4.1, p. 327 are the local modular character supplier. Lafforgue Proposition 11.7 and Lemma 11.10, pp. 143–147 explain anchors and uniqueness, but the characteristic-zero Reynolds step is not transported to characteristic ell. The abstract arbitrary-discrete-W theorem uses LP2's actual group-independent excursion action and an explicitly requested classifier variant.

Product and adjoint-isomorphism comparisons use the actual GS4/HS4 kernels. Product exterior generators come from VS5's lisse Kunneth statement; the centre tensor map is not asserted to be an isomorphism. Weil restriction requires a finite separable extension, common normal wild level, the nonabelian coset cocycle and its fppf conjugacy comparison, and the residue-degree q-half dictionary. The pinned abelian Shapiro theorem is background only.

The full Chevalley argument was checked in FS VI.12.1 and proof, pp. 239–241 and IX.5.3, pp. 329–330. The rho(-1) inner adjustment precedes passage to conjugacy invariants. Compact lisse BZ is supplied by VS5; enhanced-centre/domain refinements remain requested. Smooth contragredients retain the all-Hecke duality dictionary and the late IX.7.3 parabolic input, pp. 337–338, without introducing a reverse dependency into functoriality.

## Resolution of the earlier review

| Earlier requirement | Current disposition |
| --- | --- |
| Establish torus operator over general coefficients and fix the endpoint sign | Verified by the frame/descent/regular-module argument above; both former unverifiable nodes now verified |
| Replace scalar testing of the integral diagonal map | Compact finite-wild factorization, algebra generators and faithful regular coordinates are explicit |
| Supply an all-field disconnected-centre target or mark it partial | The central-pushout/quotient-lift/central-cocycle route supplies the target; all four stages may be planned |
| Remove the false connected-centre surjective cover and full-H1 transfer | Removed; the flat Kummer countertest is retained and the stronger Kaletha construction stays p-adic |
| Synchronize abstract action and exact prerequisites | Reader and packet use LP2's current abstract action; arbitrary-W classifier remains precisely requested |
| Reconcile HS4/VS5 duplicate requests | Current pre-evaluation kernels, lisse Kunneth, compact BZ and ordinary lisse adjunction are imported; only the remaining enrichment/domain refinements are requested |
| Preserve real coefficient extension and generation in prototypes | Present in the compiled file with the omission ledger; these fragments make no geometric claim |
| Carry E5/E6 and source-version scope into the reader | All source findings and review verdicts are synchronized |
| Correct opening/closing status claims | Replaced stale claims about accepted node ids and the preserved rejection by this review's actual verdict and remaining gaps |

## Per-node verdicts

Suffixes below refer to the packet's exact full node ids; the packet review object records each full id.

| Node | Verdict | Check |
| --- | --- | --- |
| `schur-irreducible-object` | verified | The specified scalar unit is an isomorphism in condensed algebras, tested on all sections; zero and point-only alternatives fail the stated tests. |
| `condensed-schur-from-admissibility` | verified | The nonzero finite-dimensional fixed-vector space gives an eigenvalue and irreducibility propagates it; enriched fixed-vector evaluation gives the relatively discrete scalar family. The noncompact owner refinement remains explicit. |
| `excursion-character-of-a-schur-object` | verified | Inverting the actual condensed scalar unit transports the excursion algebra action and both ordered tuple relations, preserving family continuity. |
| `abstract-semisimple-parameter` | verified | Uses the group-independent excursion action and precisely requested arbitrary-discrete-W LP2 classifier; no Bun_G compactness assumption or abelian Shapiro substitute. |
| `parameter-of-a-schur-irreducible-sheaf` | verified | FS VIII.3.8 and IX.4.1 give the continuous prescribed-projection semisimple parameter; the modular local supplier is distinguished from Lafforgue’s characteristic-zero Reynolds step. |
| `parameter-of-an-irreducible-smooth-representation` | verified | The existing fully faithful stratum left adjoint carries the scalar unit; centre restriction and uniqueness identify the parameter without compactness of pi. |
| `stratum-centre-embedding-independence` | verified | The two fully faithful extensions compare through restriction and the adjunction triangles; natural central actions, not arbitrary categorical extensions, give independence. |
| `invariance-and-coefficient-transport` | verified | Isomorphism invariance and coefficient extension retain Schur and the exact base-change square. The prototype uses genuine coefficient-field maps. |
| `coefficient-policy-for-the-functorial-diagrams` | verified | The component-order hypothesis is attached to each spectral-centre diagram; scalar excursion reconstruction keeps every ell different from p. |
| `isogenies` | verified | Checked FS IX.6.1 projection formula against HS4 clause (d), Satake adjoint naturality and VS4 neutral restriction; actual restriction may have other strata. |
| `products` | verified | Distinct factors, exterior Satake kernels and compact lisse generators give the centre tensor map and constituent parameters; no centre tensor isomorphism is claimed. |
| `weil-restriction` | verified | Finite separability, common normal wild subgroup, explicit nonabelian coset cocycle, fppf conjugacy transport, and compatible q-half normalization give the Shapiro comparison. |
| `tori-spectral-center` | corrected | The centre has all torus strata and possibly infinite Laurent quotients. Induced-torus resolution, nonsplit crossed cocycles, all-E BG1 and full reciprocity are exact owner requests; made BG1 field extension explicit. |
| `torus-two-leg-calculation` | verified | Checked actual Std input O(d+1)(-D), its ideal-sheaf frame, scaling and inverse residue-Frobenius descent. Independent legs give the claimed regular-module translation over arbitrary Lambda. |
| `tori-diagonal-embedding` | verified | Compact finite-wild factorization precedes generation; group-algebra basis actions determine each faithful regular coordinate, including nilpotents, in every physical degree. |
| `central-characters-and-twisting` | verified | For a smooth torus centre, multiplication Z times G to G and dual central projection compare actual rational central characters; nonsmooth connected mu_p is not silently a torus. |
| `twisting-by-abelianized-characters` | verified | The graph into G times its abelianization and product compatibility multiply only the dual-group component by the central cocycle, leaving the Weil projection fixed. |
| `z-embedding` | verified | Kaletha Definition 5.1, Proposition 5.2 and Corollary 5.3 checked in their p-adic range. Definition/API/tests preserve injection, torus quotient and H1 comparison; modular extension is separately proved/requested. |
| `z-embedding-central-character-comparison` | corrected | Verified all-field central torus pushout, smooth character extension, closed-cocompact quotient lift using only finite length, geometric restriction to a scalar quotient, central crossed-cocycle comparison and common pushout. Corrected supplier proof slips E7–E9 explicitly; kept the flat-Kummer obstruction. |
| `bernstein-zelevinsky-duals` | verified | Checked full FS VI.12.1 and IX.5.3 proofs, rho(-1) inner correction, compact lisse BZ supplier, enhanced-centre domain and exact ES1 input; noncompact enrichment remains requested. |
| `smooth-duals` | verified | All-Hecke smooth duality uses the admissible contragredient dictionary and late ES7 parabolic support argument. No reverse ES7 or SR.6 edge enters ES6 functoriality. |

## Baseline and library audit

Every following declaration was independently read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet modules locate their declarations. All 27 claimed outputs hold with the consumer's hypotheses. None was removed or replaced in this review; only review provenance was updated.

| Declaration | Confirmed scope |
| --- | --- |
| `mathlib:Representation` | A monoid homomorphism G to the algebra of linear endomorphisms of a module; smoothness, admissibility and irreducibility are additional representation-theoretic inputs. |
| `mathlib:Representation.IntertwiningMap` | Equivariant linear maps between representations, including the endomorphism algebra used in the global-point prototype. This does not prove Schur’s lemma. |
| `mathlib:MonoidHom` | Bundled group homomorphisms, their composition, products, kernels and ranges. A parameter also needs the prescribed projection, semisimplicity and condensed continuity from LP0/LP2. |
| `mathlib:AlgHom` | Algebra homomorphisms, for excursion characters and all centre comparison diagrams. |
| `mathlib:Condensed` | C-valued sheaves on CompHaus for its coherent topology. This supplies condensed algebras when C is AlgCat; it supplies neither animated enhancement nor D_lis. |
| `mathlib:AlgCat` | The category of associative R-algebras and algebra homomorphisms, used as values of the actual condensed scalar and endomorphism algebras. |
| `mathlib:CategoryTheory.IsIso` | Invertibility of the scalar unit in the category of condensed algebras; Schur irreducibility is this property of a specified unit, not a chosen abstract algebra equivalence. |
| `mathlib:CategoryTheory.CatCenter` | Natural endomorphisms of the identity of an ordinary category. The enhanced degree-zero centre and its comparison are owned by ES0. |
| `mathlib:Module.End` | Linear endomorphism rings. Equivariant endomorphisms, rather than all linear endomorphisms, enter Schur’s lemma for a representation. |
| `mathlib:CategoryTheory.Adjunction` | Unit/counit adjunctions; the enriched stratum adjunction and its invertible unit remain a VS4 input. |
| `mathlib:TensorProduct` | Algebraic tensor products; this is the algebraic substrate of the product-centre diagram, not an exterior-product theorem for sheaves. |
| `mathlib:MonoidAlgebra` | Group algebras of arbitrary discrete quotient groups T(E)/K; no finiteness of those quotients is assumed. |
| `mathlib:Subgroup` | Subgroups including the finite-index free subgroup in the excursion-colimit comparison. |
| `mathlib:IsFreeGroup` | A group with a free basis. The subgroup instance is supplied by Mathlib/GroupTheory/FreeGroup/NielsenSchreier.lean, read together with this definition. |
| `mathlib:Subgroup.fg_of_index_ne_zero` | A finite-index subgroup of a finitely generated group is finitely generated. Together with Nielsen–Schreier this supplies exactly the finite-generation/freeness input of IX.6.3; no rank formula is needed. |
| `mathlib:groupCohomology.coindIso` | Abelian Shapiro cohomology in all degrees. The nonabelian cocycle/quotient-stack comparison in IX.6.3 is stronger and is planned at its use here, not identified with this declaration. Retained as a background contrast only, not a proof prerequisite of nonabelian Shapiro. |
| `tauceti:TauCeti.IsSmoothDiscrete` | A TopRep object with discrete module topology and open stabilizers. It does not supply admissibility, scalar endomorphisms or a sheaf equivalence. |
| `tauceti:TauCeti.SmoothDiscreteTopRep` | The full subcategory of smooth discrete TopRep objects. Derived enhancement and the arbitrary-coefficient Bernstein centre are imported from their respective owners. |
| `tauceti:TauCeti.ClassFieldTheory.Formation` | The smooth discrete integral coefficient carrier for class formations. This is existing class-field-theory infrastructure, not the local Artin reciprocity isomorphism needed for tori. |
| `mathlib:subgroupIsFreeOfIsFree` | For a subgroup H of a group G with IsFreeGroup G, gives IsFreeGroup H, with no finite-index hypothesis. Combined with Subgroup.fg_of_index_ne_zero it supplies the finite free subgroup used in IX.6.3. |
| `mathlib:Representation.leftRegular` | The actual left regular representation on MonoidAlgebra R A, induced by left multiplication, for a semiring R and monoid A; no finite quotient hypothesis. |
| `mathlib:MonoidAlgebra.mapDomainLinearMap` | Pushforward of finitely supported coefficients along a map of index sets. It sends single a r to single (f a) r, so supplies quotient-transition transport for regular modules. |
| `mathlib:MonoidAlgebra.mapRingHom` | Coefficient-ring transport R[A] to S[A], sending single a r to single a (f r), for a ring homomorphism f. |
| `mathlib:MonoidAlgebra.mapDomainRingHom` | The group-algebra ring homomorphism induced by a monoid homomorphism. It supplies quotient-coordinate transitions; coefficients remain unchanged. |
| `mathlib:IsAlgClosed.exists_pow_nat_eq` | Over an algebraically closed field every element has an nth root for n greater than zero. For a unit the root is nonzero, giving divisibility of the multiplicative unit group in every characteristic. |
| `mathlib:AddCommGrpCat.injective_of_divisible` | An additive abelian group divisible by the integers is an injective object of AddCommGrpCat. Apply the additive type tag to the multiplicative group of coefficient-field units. |
| `mathlib:CategoryTheory.Injective.factorThru` | Given an injective target, a morphism to it extends along any monomorphism; comp_factorThru states that restriction equals the original morphism. This is the discrete character extension, not a smoothness theorem. |

In particular, the subgroup instance supplies Nielsen–Schreier without a new roadmap proof; finite-index finite generation supplies only the needed finiteness, not a rank formula. IsAlgClosed root existence applies to positive exponents; divisibility of the additive form of L-times yields injectivity and character extension through a genuine monomorphism. The existing ordinary category centre and condensed carriers do not supply enhanced centres or animated/lisse categories. The reviewed library audit has no built target reintroduced here.

## Sources and independently confirmed corrections

All seven source PDF hashes were reproduced. The reader and packet retain exact titles, URLs, receipt dates, hashes and theorem/section/page locators. Their proof-critical passages were read independently, including the complete cited torus, Kaletha, Conrad, local-character, duality and representation-lift arguments. No unavailable book proof is claimed read.

FS source findings E2–E6 were independently visually checked in the author PDF and separately collated with arXiv v4 at pp. 276, 331, 333. The prior metadata/sample record for Astérisque 466 does not make the unread full published passages checked. Henniart–Vignéras was read in its published journal PDF, then collated with arXiv v2 and the author's proof copy. Journal metadata, arXiv history, the author's publications page and an erratum search revealed no correction for E7–E11 as of 2026-10-09. All records use our own words.

| Finding | Verdict and corrected meaning | Effect |
| --- | --- | --- |
| E2 | Confirmed: The second factor is the geometric centre for G2. | nothing |
| E3 | Confirmed: A_i lies in D_lis(Bun_(G_i),L), for i=1,2. | nothing |
| E4 | Confirmed: The group morphism has direction Gprime to G; its dual has direction Ghat to Gprimehat. | nothing |
| E5 | Confirmed: Use injective z-embeddings as defined in Kaletha §5.1, with its p-adic hypotheses. | nothing |
| E6 | Confirmed: The compact exterior product and generators are in D_lis(Bun_G,Λ). | nothing |
| E7 | Confirmed: Use compactness of that cokernel. A surjective map of split tori has full-rank, finite-index image on the valuation lattice; compact unit representatives then give a compact set surjecting onto the cokernel. Compactness suffices for the subsequent Levi and Iwasawa steps. | the proof |
| E8 | Confirmed: Choose a maximal split torus in the inverse image, mapping surjectively onto the target split torus, and choose a minimal parabolic containing the target torus. Its centralizer is the required Levi; the source centralizer and inverse-image parabolic give the central Levi map and unipotent isomorphism used in the proof. | the proof |
| E9 | Confirmed: The lifted expression is the commutator of x and y; the image f(H) is a subgroup of G; the rational-point quotient is G/f(H). | nothing |
| E10 | Confirmed: The infinite-dimensional second branch belongs to characteristic two. | nothing |
| E11 | Confirmed: For characteristic zero and residue characteristic two, use two plus [F:Q_2], equivalently two plus ramification index times residue degree. For odd residue characteristic the dimension is two; characteristic two has the infinite branch as corrected in E10. | a stated result |

The new E7 counterexample is the pth-power central map on G_m over F_q((t)): its rational cokernel is infinite although the valuation cokernel is finite. Compact units together with finitely many valuation representatives give compactness, which is all Proposition 3.3 needs. E8 is exposed already by projection G_m times an anisotropic torus onto G_m. Choosing a maximal split source subtorus and a minimal target parabolic repairs the reduction. The explicit corrections are incorporated in the all-field node, its source match, the RG2.6 request and the reader. E9 fixes the commutator and ambient quotient symbols. E10 concerns the adjacent unused square-class formula's repeated characteristic condition. E11 corrects its finite branch: the unramified quadratic extension of Q_2 has sixteen square classes, while the displayed ramification-only expression predicts eight. The packet gives the unit-filtration calculation, so no restricted book copy is needed for this counterexample. The journal page range was also corrected to 229–286.

## APIs, tests, coverage and red-team routing

Each of the four definition/construction APIs covers its consumer-facing scalar inverse/sections, character functoriality/relations, representation assignment/comparisons or z-embedding factorization. All 12 named tests distinguish plausible alternatives: point-only or zero Schur objects, reversed excursion order, inconsistent centre assignment, and failure of central lifting. The file states the tests as named examples or declarations and explicitly limits their algebraic scope. Its actual condensed algebras, Mathlib representations, coefficient extension maps and regular group algebras avoid fictitious geometric structures or unnamed predicate fields. No Lean edit was needed.

The 21 suggested names, 22 API names and 12 test names agree with the file, accounting for namespace-qualified declarations and named example comments. The reader's prototype ledger states every omitted geometric/continuous condition. The two added algebraic helpers from the revision cover scalar transport along a surjective intertwiner and the central difference of aligned lifts; they do not claim the induction or geometric comparison that supplies their data.

All four stages realise their targets at the issue's requested target granularity. Proof expansions remain inside the nodes rather than adding lemma nodes. The 14 requests and 9 gaps concern specifically stated supplier or prototype interfaces, not a hidden absent target. The complete status denotes a completed planning pass; it does not claim closure. Planet counts and names meet the six-per-layer and named-mathematics rules.

Confirmed RT-AREA-geomlanglands/7 has exact ES1 spectral-map prerequisites in both ES6 children and the coefficient node. Confirmed /8 routes modular admissibility and finite length to early SR.3b after SR.2, keeping condensed Schur here and excluding SR.6. Qbar_ell is uncountable; Fbar_ell is countable. Confirmed /10 routes foundational induced resolutions, surjective z-extensions and the central-pushout extension to RG2.6 while retaining injective p-adic z-embeddings here. Finding /9 puts the abelian arbitrary-coefficient Bernstein centre in SR.1. No live atlas, upstream document or other job's packet was edited.

## Orchestrator handoff

No unresolved contradiction or mathematical question prevents acceptance. The following owner work remains, as the packet explicitly records:

- Create the foundational SR.3b and RG2.6 work, including the weaker closed-cocompact quotient lift and the corrected central-image compactness proof. Keep noetherianity and late SR.6 out of the early path.
- Route the reusable Lubin–Tate cover to RelativeFarguesFontaine Part II and full equal-characteristic wild reciprocity to ClassFieldTheory Part II; consume upstream's arithmetic normalization unchanged.
- Extend BG1's torus classification to every local E. Finish LP2's arbitrary-discrete-W classifier and exact modular continuity interface, LP0's continuous central crossed-cocycle comparison, and the VS4/HS1/VS5 enrichment/domain refinements.
- Apply remaining RT /7 stage links and RT /10 BG2/ET0 consumers only in their own authorized jobs. This review's accepted packet already contains its scoped links and requests.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES5.json`: **0 errors, 0 warnings**. Source-issue/source-version validation and the complete review/name/reader correspondence checks passed. `git diff --check` passed. Only the authorized packet, reader, report and handoff are changed.

`lean-check research/blueprint/suggested/ExcursionOperatorsAndSpectralAction--ES5.lean`: **exit 0**, 61 warnings, all declarations using `sorry`. Available memory was 114 GB before the run. The suggested file imports only Mathlib and the shared Mathlib build is at the exact pinned commit; Tau Ceti baseline statements were independently read at their exact pin. No Lean language server or library build/update/cache operation was run. Elaboration checks the honest algebraic signatures, not the omitted geometry or implementation of the proof plans.
