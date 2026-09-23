# Kisin (2017): mod p points on Shimura varieties of abelian type, extraction and routing

Issue [#1434](https://github.com/CBirkbeck/tauceti-explorer/issues/1434). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoint, whose report follows below as history.
- **The paper.** M. Kisin, *Mod p points on Shimura varieties of abelian type*, J. Amer. Math. Soc. 30 (2017), 819–914.
  - The 99-page author version was re-fetched; its SHA-256 (d3c19cdd…) matches the checkpoint.
  - The AMS copy of the published version returned HTML to this environment.
- **Items.** The result has **205 items: 17 library, 12 planned and 176 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Five are recorded under `sourceIssues`. The checkpoint had none.

## Independent review (REV-PAPER-KISIN-17)

The independent review (Claude Code, session cc-2aeb03, 23 September 2026) corrected this extraction in place. The review
report is `research/blueprint/reviews/REV-PAPER-KISIN-17.md`; the counts in the sections below it are the checkpoint's and are
superseded by these.

- **Items: 297** (17 library, 16 planned, 264 missing), each missing item routed once.
  - 97 fields corrected against the page images: 75 statements, 19 locators, 2 names, 1 kind.
  - 96 items added for definitions, constructions and cited inputs the proofs use.
  - 4 items removed that the paper never uses: P02 (Bruhat–Tits parahorics), P04 (pinned root subgroups), and X07, X08
    (lemmas of the Chen–Kisin–Viehmann corrigendum, which this paper does not cite).
- **Routes.** The nine routes stand. The four Part II titles now begin with their parents' exact atlas titles, and each brief
  names the confirmed corrections its design must carry.
- **Prerequisites.** Rebuilt as 18 papers the paper cites, one per entry with its DOI. Kisin–Pappas (2018) and
  Kisin–Pappas–Zhou (2026) are dropped because they are already in the paper registry.
- **Mistakes: 107** (74 misprints, 19 gaps, 14 errors).
  9 reach a stated result, 18 a proof. E1–E5 are reviewed and confirmed; E6–E107 are
  new, each checked independently on the page image. The main ones:
  - **E53:** the definition of X̃^p(φ) in (3.6.1) admits ramified twists of ε_l. Lemma 3.6.2(2),(3), Corollary 3.6.4 and
    Proposition 3.6.10 fail as printed when G^der is not simply connected. The fix is to require ε_l unramified for almost
    all l, as footnote 20 has in mind.
  - **E34:** Corollary (2.3.5) is false at a non-neat level over a small field, for example a supersingular elliptic curve
    over F_5. The paper's later uses fit the corrected form (k large, or I_{/k}).
  - **E70:** Corollary 3.8.6 omits the reflex degree r.
  - **E8:** the isomorphism (1.1.14) needs G_{Z_p} connected.
  - **E104:** Theorem 4.6.7 as printed omits p > 2, which Theorem 0.3 has.
  - **E98:** the κ-step in the proof of Lemma 4.5.6 fails when π_1(G)_Γ has torsion; the lemma survives by the argument of
    (3.4.2).
  - **E7:** footnote 8's correction of [Ki 2]: T_p𝒢* should be T_p𝒢*(−1) in (1.4.2), (1.4.3) and (1.5.11).

  None of these is shown to make the main theorem false.

## This continuation (cc-442dc5)

**Findings.** The paper ends with "Errata for [Ki 2]", correcting Kisin's 2010 integral-models paper. These are printed corrections, recorded with `known` values that name this paper:
- **E1.** [Ki 2] (1.5.2) lacks the hypothesis that Lie H is Frobenius-stable. (1.5.3) is deleted, and ∇_{R_G} has coefficients in Lie G.
- **E2.** The proof of [Ki 2] (1.5.8) is replaced (E.2–E.4); its statement stands.
- **E3.** The finiteness claimed in [Ki 2] (3.3.9) is false. Lemma E.6 and E.7 rebuild the quotient in (3.4.11) without it.
- **E4.** The same assertion in Moonen's [Mo, 3.21.1], which E.5 notes.
- **E5 (new).** The bibliography uses the label [Mo] for both Moonen and Morita.

**New items.** Five numbered statements had no items: Corollary (1.1.7), Lemma (1.1.12), Proposition (1.3.7), Corollary (3.4.16) and Corollary (3.8.6).

**Gaps.**
- All fourteen are deferred as cited suppliers' proofs or design work.
- Q-source-conventions is among them: whether Corollary 2.2.5 should read μ_T^{-1} needs the published text.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the printed corrections are recorded.

## Mistakes found (`sourceIssues`)

- **E1** (error; affects a stated result), Kisin, Integral models for Shimura varieties of abelian type, J. Amer. Math. Soc. 23 (2010) ([Ki 2]), (1.5.2)–(1.5.4). *Printed:* (1.5.2) without the condition that Lie H is stable under h ↦ φ∘h∘φ^{-1}; (1.5.3); the connection ∇_{R_G} with coefficients in Lie U°_G *Correction:* Add to (1.5.2) the hypothesis that Lie H is stable under Frobenius conjugation; delete (1.5.3); in (1.5.4) the connection ∇_{R_G} has coefficients in Lie G.
- **E2** (error; affects the proof), Kisin, Integral models for Shimura varieties of abelian type, J. Amer. Math. Soc. 23 (2010) ([Ki 2]), proof of (1.5.8), fourth and fifth paragraphs. *Printed:* the fourth and fifth paragraphs of the proof of (1.5.8) *Correction:* Replace them by the argument of Errata E.2–E.4: the parallel transports σ_α of the s_α cut out Spf A_G (Lemma E.3), and the Frobenius-invariant s̃_α are parallel, so the map factors through A_G.
- **E3** (error; affects a stated result), Kisin, Integral models for Shimura varieties of abelian type, J. Amer. Math. Soc. 23 (2010) ([Ki 2]), (3.3.9), used in (3.4.11). *Printed:* ker(A(G_{Z(p)})° → A(G_{2,Z(p)})) is finite *Correction:* The kernel need not be finite. Lemma E.6 shows that the central part has finite index in it, and E.7 rebuilds the quotient S_{K_{2,p}}(G_2, X_2) = [A(G_{2,Z(p)}) × S_{K_p}(G, X)^+]/A(G_{Z(p)})° and its extension property without the finiteness.
- **E4** (error; affects a stated result), Moonen, Models of Shimura varieties in mixed characteristics (1998), 3.21.1, cited as [Mo, 3.21.1] in Errata E.5. *Printed:* the same finiteness of ker(A(G_{Z(p)})° → A(G_{2,Z(p)})) *Correction:* As in E3: replace the finiteness by the finite-index statement of Lemma E.6.
- **E5** (misprint; affects nothing), Kisin 2017, bibliography (author version p.98). *Printed:* [Mo] B. Moonen, Models of Shimura varieties in mixed characteristics …; [Mo] Y. Morita, Ihara's conjectures and moduli space of abelian varieties … *Correction:* Give the two references distinct labels.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **Q-comparison** (deferred). A cited supplier's proof or design work (see remaining); the paper uses it as an input.
- **Q-display** (deferred). A cited supplier's proof or design work (see remaining); the paper uses it as an input.
- **Q-adlv** (deferred). A cited supplier's proof or design work (see remaining); the paper uses it as an input.
- **Q-ckv-correction** (deferred). The CKV corrigendum is a cited supplier; its omitted D4/E6 verification is its own.
- **Q-stacks** (deferred). A cited supplier's proof or design work (see remaining); the paper uses it as an input.
- **Q-cohom** (deferred). A cited supplier's proof or design work (see remaining); the paper uses it as an input.
- **Q-gerb** (deferred). A cited supplier's proof or design work (see remaining); the paper uses it as an input.
- **Q-shimura** (deferred). A cited supplier's proof or design work (see remaining); the paper uses it as an input.
- **Q-isogeny** (deferred). A cited supplier's proof or design work (see remaining); the paper uses it as an input.
- **Q-global** (deferred). A cited supplier's proof or design work (see remaining); the paper uses it as an input.
- **Q-source-conventions** (deferred). Whether Corollary 2.2.5 should read μ_T or μ_T^{-1}, against the μ_0^{-1} convention of (1.1.12) and (1.3.7), needs the published text; the AMS copy returned HTML here.
- **Q-components** (deferred). A cited supplier's proof or design work (see remaining); the paper uses it as an input.
- **Q-main** (deferred). A cited supplier's proof or design work (see remaining); the paper uses it as an input.
- **Q-granularity** (deferred). Declaration-sized splitting is design work; every numbered statement is now an item.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## PAPER-KISIN-17: twisted mod-p point classification

This is a full-main-paper extraction checkpoint for Mark Kisin, *Mod p points on Shimura varieties of abelian type*, JAMS 30 (2017), 819–914, DOI [10.1090/jams/867](https://doi.org/10.1090/jams/867). All 99 pages of the author's version were read, including the integral-model errata and bibliography. The result remains `partial`: the original cited-source proofs and several multi-part arguments still need recursive, declaration-sized decomposition. Nothing in this submission claims a Lean formalization.

The principal result gives a point-tower description at an odd hyperspecial prime for an abelian-type Shimura datum. Its rational automorphism-group action is modified by an adelic inner twist τ. That qualification is part of the theorem. The paper's stronger untwisted Langlands–Rapoport assertions are retained as conjecture predicates, not supplied with proof fields.

### Source identity and actual reading

The source used is the [author's 99-page PDF](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1). The [author's publication list](https://people.math.harvard.edu/~kisin/preprints.html) associates that file with the published JAMS article, and the Crossref DOI record confirms author, title, volume and pages. The PDF metadata dates this author version to 2016-08-27. Its printed page numbers equal PDF page numbers. The published page range has 96 pages; text identity between the versions has not been asserted. The author PDF's SHA-256 is recorded in the result so a continuation can inspect exactly the version used. Direct AMS and repository access attempts did not supply a journal PDF.

The reading covered the introduction; integral comparisons, adapted deformations and minuscule components in §1; isogeny automorphisms and special lifts in §2; gerbs, refined admissibility and components in §3; torsor twists, triples, obstruction fibers and abelian-type descent in §4; and E.1–E.7. The long argument was read sequentially rather than inferred from its introduction. Visual checks of author pages 16, 33 and 42 confirmed the expressions that require qualifications below.

Two additional primary sources were inspected. The [Borovoi author PDF](https://www.tau.ac.il/~borovoi/papers/galofile.pdf) for *Abelian Galois cohomology of reductive groups*, Memoirs AMS 132 (1998), no.626, has 46 pages. Only PDF pages 15–21 and 39–41 were read: crossed-module cohomology, its reductive abelianization, and the common-torus/global-real comparison results. The original source cited for some quasi-isomorphism arguments was downloaded as a 20-page `nonab.pdf`, but was not read. It remains an acquisition lead, not discharged evidence.

The [Chen–Kisin–Viehmann corrigendum](https://doi.org/10.1112/S0010437X1600782X), Compositio 153 (2017), 218–222, was read completely: six PDF pages including the cover. Its repairs affect the component theorem used in §1.2. The original 2015 CKV paper remains an original-source gate. Full published KP18 and KPZ26 papers were read in preceding jobs of this session; their extraction proposals supply ownership and correction links, not implemented lemmas.

### What the theorem requires

The geometric side begins with a reductive integral Hodge embedding and a hyperspecial subgroup at p>2. An integral model is the normalization of a closure inside a sufficiently small good-level Siegel model. A point carries crystalline and away-p étale tensors. A quasi-isogeny belongs to its tensor isogeny class only when it preserves those tensors and the weak polarization; an isogeny of the underlying abelian varieties is insufficient.

The local parameter is an affine Deligne–Lusztig set of Dieudonné lattices. The source first defines connectedness through smooth characteristic-p frames and then takes the equivalence relation generated by connected frame families. A later geometric realization must prove comparison with its own component functor. Calling a point-set bijection a scheme-component theorem would skip this step.

The integral comparison and adapted-deformation arguments provide enough characteristic-zero lifts to meet every local component. Propagation along framed families proves that the entire local parameter set maps into the Hodge integral model. This is the bridge between a local lattice calculation and a geometric isogeny class. It uses an integral connection after suitable Frobenius pullback, an adapted formal deformation quotient and the criterion for tensor-compatible branches of the normalization.

The global argument then finds a special point in every geometric tensor isogeny class. It proves that the rational tensor automorphism group has full rank, chooses the required cocharacter on a maximal torus, and lifts an isogenous object with that filtration and its endomorphisms. The resulting lift has toric Mumford–Tate group. Its CM Frobenius gives a common rational representative for the local Frobenius data and identifies the automorphism group with the appropriate local centralizers.

The arithmetic parameterization is constructed independently. A quasi-motivic gerb carries prescribed local fundamental classes, rational cocharacters and almost-all integral sections. Its Weil-torus quotient gives the gerb used for admissible morphisms. This construction does not assert a category of actual motives realizing the gerb. The two stages and their finite-level transitions are separate constructions in the extraction.

Admissibility uses the monoidal quotient G/Gsc. Replacing this by the ordinary torus quotient Gab loses information: for PGL2, Gab is trivial but the algebraic fundamental group has Z/2 torsion. The refined quotient keeps the local Kottwitz class needed to lift the adjoint p-condition. At p one must retain an actual unramified descent witness; an isomorphism class of quotient functors alone does not supply it.

Both geometric classes and admissible morphisms give stabilized Kottwitz triples. A triple needs a global inner form and compatible local centralizer identifications, not just unrelated abstract local isomorphisms. An adelic refinement specifies the rational group's action on the product of local and away-p parameters. Forgetting this refinement can change the double quotient while retaining the same bare triple.

The fiber over a triple on either side is an obstruction torsor. The relevant group is constructed through abelianized reductive cohomology and localization kernels. It must distinguish classes trivial in the ambient G locally from those trivial in the automorphism group I locally. Matching special torus triples and the two obstruction torsors aligns the isogeny classes. A further J_b adjustment aligns connected components. The adelic τ aligns the refined rational actions.

The direct Hodge-type matching assumes the center is a torus. A permitted Hodge-derived cover and central-isogeny descent transfer the result to abelian type. The maximal permitted Hodge-derived cover is not automatically the simply connected cover in every D-type case. The proof also arranges the same local reflex field, so Frobenius powers cannot be chosen independently of that construction.

The resulting theorem is a Frobenius, center and arithmetic-action-equivariant bijection of geometric special-fiber point towers. It does not assert an isomorphism of schemes, perfect spaces or stacks. It retains p>2, hyperspecial level, abelian type and the τ-twisted action. The original theorem is not silently generalized to parahoric level by borrowing a later paper's terminology.

### Corrections and convention gates that change the plan

**Crossed-module abelianity.** Author §3.2.7(4), page42, states a general abelianity implication from abelian cokernel. That implication is too broad. Let Δ=C3 act trivially on the crossed module F=C3→H=C2, with zero boundary and the inversion action of C2 on C3. Equivariance and Peiffer hold, and the cokernel is abelian. The degree-zero cocycles modulo F gauge are C3⋊C2, which is nonabelian. The finite diagnostic verifies this explicitly. This does not refute the reductive application: Borovoi identifies Gsc→G with the center complex and the maximal-torus complex, whose hypercohomology is abelian. The plan uses that specific comparison, not the false general implication.

**Specialized frames.** The proof of author Lemma1.2.18 on page16 uses an integral frame where a rational frame can be necessary. For Gm, the lattice pO has Kottwitz class1, whereas an integral unit has class0. The extracted conclusion is κ(g0)=κ(g), with g0∈G(L); it does not force g0 into G(OL). The finite valuation diagnostic catches the incorrect strengthening while leaving the actual specialization theorem as the intended endpoint.

**Linear and Cartier duals.** The contravariant comparison uses the linear dual of the Tate module: Tp(G)∨=Tp(Gᴰ)(−1). Omitting the Tate twist changes even the rank-one étale example. Automorphisms of the abelian object act on its contravariant realization through D(i⁻¹). These are interface conventions, not cosmetic renamings.

**Inverse Hodge cocharacters.** Lemma2.2.2 has the average μ_T-bar=ν_δ⁻¹, and Proposition1.1.19 uses the inverse filtration. Author Corollary2.2.5 calls the associated filtration μ_T. The report records an explicit convention gate; it does not claim that comparison with the published version has established an editorial correction. A future Lean interface must expose the map between the Hodge cocharacter, the filtration cocharacter and the ADLV double coset.

**CKV invariant-lattice repair.** The corrigendum augments the claimed generators of the invariant fundamental-group kernel by specified small root orbits Φ0. The additional generators must map trivially into the G-ADLV component set. Its corrected transfer lemma includes an integer multiple of the full orbit sum. The proof also corrects a sign in the cited root calculation. The original component theorem remains the endpoint, with the same adjoint-simple, minuscule and HN-indecomposable hypotheses and the μ=0,b~1 discrete exception. The printed corrigendum leaves final D4/E6 verification to the reader; that work is explicitly unfinished.

A separate lattice example illustrates why invariant lifts cannot be assumed: swap the two basis vectors of Z² and quotient by e1−e2. The quotient class1 is invariant, but invariant vectors map to even classes. This example is not presented as the actual CKV root-system counterexample. It is a diagnostic against the invalid general lifting argument.

**Kisin2010 connection errata.** E.1 adds Frobenius-conjugation stability of Lie(H), deletes the old1.5.3 and changes the connection coefficients to Lie(G). E.2–E.3 construct the horizontal tensor locus inside the rational completion and identify its Fil0 locus with the adapted completion. E.4 repairs the factorization proof while retaining the referenced proposition and corollary statements. Importing the old connection lemma without these repairs would leave the adapted-deformation route unsound.

**Infinite descent kernels.** E.5 retracts finiteness of the relevant arithmetic kernel. E.6 gives a finite-index central intersection, and E.7 uses finite actions at suitable finite levels before taking inverse-level quotients. An infinite group can act through finite quotients at every level; the Z acting on Z/nZ diagnostic makes that distinction concrete. The extraction never turns finite action into finiteness of Δ°.

**Fixed-field versus stabilized automorphisms.** I_/k and I differ until all geometric endomorphisms are defined. The Frobenius centralizer comparisons use sufficiently divisible extensions. This is stronger than taking an arbitrary sufficiently large exponent. The common inner-form description must use the stabilized centralizer, as the later proof explicitly does after enlarging the field.

**Topological and real conditions.** The component formulas use closures of rational positive subgroups. Removing the closure can change the inverse-level quotient. Positive adjoint lifts require the real-trivial cohomology condition. The canonical comparison of component torsors need not equal the tautological identity on underlying sets. These conditions are kept in the R-items and the component closure gate.

**Toric local levels.** For ramified tori, the denominator is the connected Néron model T°, and the Kottwitz target uses inertia coinvariants. Frobenius invariants and coinvariants are not interchangeable. The universal gerb's p-presentation, inverse cocharacter and infinity sign are fixed before the reciprocity construction.

**Twists and actions.** A right torsor acts on its functions by (zf)(x)=f(xz). The evaluation frame has the inverse cocycle in its Galois transformation formula. Twisting a level by ω changes it to ωKω⁻¹. The arithmetic action on the parameter uses i_h⁻¹gh. Reflex Frobenius uses the ordered product bσ(b)…σ^(r−1)(b); noncommutative factors cannot be reordered. Tests address these choices directly.

### Ownership and baseline decisions

The pinned commits are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Declaration statements and their enclosing hypotheses were read before use, with module digests recorded. Existing carriers include Witt vectors and their fraction-field Frobenius, reductive and torus predicates, character/cocharacter lattices and perfect pairing, dominant chambers, abelian varieties over fields and divided powers. These carrier imports do not establish integral Shimura models, tensor displays, gerbs or the LR theorem.

Four additional checks prevent false claims that elementary categorical infrastructure is absent. Mathlib has abstract `GroupExtension`, ordinary `CategoryTheory.Comma`, and `CategoryTheory.MonoidalCategory`. They are imported in their actual scope. Galois topology and algebraic semilinear conjugation, invertibility in a two-fiber product, strictness and Picard data remain separate adapters. The pinned Hilbert90 file supplies uniqueness of H1 for the algebra-automorphism action on the units of a finite field extension. That declaration alone is not a profinite nonabelian GLn or arbitrary-torus Hilbert90 theorem.

The reviewed library audit and relevant upstream roadmap scopes were read. The current atlas, decomposition and prior-extraction manifest is recorded with Git blob and SHA-256 digests. A planned item names an actual existing stage. A candidate Part II from another extraction is linked through `relatedExtractionItems`; it remains missing until a genuine planning stage owns that declaration. This distinction matters for the existing display, ADLV, global arithmetic and Shimura reduction proposals.

ET.0 expressly owns rational/stable conjugacy, inner forms, two-term torus complexes, abelianized reductive cohomology and localization. It therefore owns the Borovoi and Sha-kernel material. The continuous abelian coefficient machinery comes from the existing profinite and arithmetic-duality owners. This paper does not create a second cochain theory or a private nonabelian cohomology development under Shimura varieties.

SF.1 owns the reusable gerb, descent and quotient-category interfaces. BG0/BG1 already own G-isocrystals, J_b and their Newton/Kottwitz invariants. RG2 owns the integral unramified Cartan/coset adapters. AbelianSchemesAndArithmeticModuli owns up-to-isogeny torsor twists, their realizations and levels. These routes use the paper as a source within existing directions.

The four Part II routes reuse candidates already identified by other papers: FiniteFlatGroupsWithTensorsPartII, HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig, ReductiveGroupsArithmeticPartII and ShimuraVarietiesHondaTatePartII. The ADLV candidate's existing dimension/cordial branch is retained separately from this component branch. The gerb construction extends global reductive arithmetic; it does not replace the neutral Tannakian scope of MotivesAndAlgebraicCycles MC6. The Shimura route imports all these interfaces before the final matching theorem.

The detailed route briefs below state their producer/consumer boundaries, final theorems, imports, suggested Lean homes and unresolved proof gates. The file paths are suggestions for later design/blueprint work. This paper issue did not authorize a Lean deliverable, so no suggested file was created or compiled.

### Inventory and route map

The checkpoint contains **200 items**: 17 library imports, 12 items assigned to existing planned stages, and 171 missing items. Its 77 definitions/constructions have 231 API statements and 231 specified examples. Every missing item has exactly one route. The result records 24 statement-read baseline declarations and 366 current input records.

The final input refresh also inspected the updated KMPS22 normalizer and fiber-product repairs and the expanded HE21 ADLV brief. These preserve the owner decisions; they do not discharge this paper’s independent CKV or cohomology proof gates.

| Owner | Route | Items | Existing stages or parent |
|---|---|---:|---|

| SchemeAndStackFoundations | source | 18 | SchemeAndStackFoundations:SF.1 |

| EndoscopicTransferAndUnitaryTraceComparison | source | 11 | EndoscopicTransferAndUnitaryTraceComparison:ET.0 |

| ReductiveGroupsPartII | source | 3 | ReductiveGroupsPartII:RG2.3, ReductiveGroupsPartII:RG2.4 |

| BunGAndNewtonStrata | source | 3 | BunGAndNewtonStrata:BG0, BunGAndNewtonStrata:BG1 |

| AbelianSchemesAndArithmeticModuli | source | 3 | AbelianSchemesAndArithmeticModuli:A2, AbelianSchemesAndArithmeticModuli:A3, AbelianSchemesAndArithmeticModuli:A6 |

| FiniteFlatGroupsWithTensorsPartII | part-ii | 22 | FiniteFlatGroupsAndIntegralPadicHodgeTheory |

| HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig | part-ii | 11 | HeckeStacksAndLocalShtukas |

| ReductiveGroupsArithmeticPartII | part-ii | 18 | tauceti:TauCetiRoadmap/ReductiveGroups |

| ShimuraVarietiesHondaTatePartII | part-ii | 85 | ShimuraVarieties |

#### SchemeAndStackFoundations

SF.1 owns gerbs, descent and the reusable quotient-category/torsor interfaces. Add strict monoidal crossed modules and invertible two-fiber adapters to its existing categorical foundations; preserve ordinary Mathlib carriers.

The item statements below and their JSON APIs define the specialized source obligations within the named existing stage scope.

Imports: Scheme, stack, cohomology and intersection foundations (SchemeAndStackFoundations); pinned GroupExtension, Comma and MonoidalCategory.

Suggested future Lean file: `TauCeti/AlgebraicGeometry/Stacks/GaloisGerb.lean`. No file was created for this issue.

Prior extraction ownership screened in this direction: PAPER-BAKKER-TSIMERMAN-16, PAPER-BENOIST-19, PAPER-BENOIST-WITTENBERG-20, PAPER-BHATT-ETAL-23, PAPER-BRESCIANI-24, PAPER-CARO-PASTEN-23, PAPER-CESNAVICIUS-19, PAPER-CESNAVICIUS-22, PAPER-CHARLES-16, PAPER-COUVEIGNES-20, PAPER-DIMITROV-GAO-HABEGGER-21, PAPER-GAO-GE-KUHNE-26, PAPER-GAO-HABEGGER-19, PAPER-GILLE-PARIMALA-26, PAPER-HACON-WITASZEK-23, PAPER-HARPAZ-WITTENBERG-20, PAPER-HARPAZ-WITTENBERG-23, PAPER-HE-21, PAPER-KISIN-PAPPAS-18, PAPER-LAWRENCE-SAWIN-25, PAPER-MERKURJEV-SCAVIA-26, PAPER-MOK-PILA-TSIMERMAN-19, PAPER-RICHARD-YAFAEV-25, PAPER-SCHROER-23, PAPER-SHENDE-TSIMERMAN-17, PAPER-WITASZEK-22. Exact prior item IDs are recorded in the JSON; same owner is an overlap lead, not an assertion that every pair of items is identical.

#### EndoscopicTransferAndUnitaryTraceComparison

ET.0 explicitly owns rational/stable conjugacy, inner forms, torus complexes and abelianized reductive cohomology. It owns these Borovoi statements and obstruction kernels; use its shared localization API.

The item statements below and their JSON APIs define the specialized source obligations within the named existing stage scope.

Imports: Continuous cohomology of profinite groups (tauceti:TauCetiRoadmap/ProfiniteCohomology), existing continuous abelian-cohomology carriers; Arithmetic Galois duality (ArithmeticGaloisDuality), compact/derived coefficient interfaces; SchemeAndStackFoundations:SF.1 quotient groupoids.

Suggested future Lean file: `TauCeti/GroupTheory/GaloisCohomology/ReductiveAbelianization.lean`. No file was created for this issue.

Prior extraction ownership screened in this direction: PAPER-ATOBE-KONDO-YASUDA-22. Exact prior item IDs are recorded in the JSON; same owner is an overlap lead, not an assertion that every pair of items is identical.

#### ReductiveGroupsPartII

Existing local integral reductive-group layers own Cartan cosets, Kottwitz maps and invariant-class lifting. Import upstream reductive/root constructions without replanning them.

The item statements below and their JSON APIs define the specialized source obligations within the named existing stage scope.

Imports: Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups); Bun_G and Newton strata (BunGAndNewtonStrata):BG0/BG1.

Suggested future Lean file: `TauCeti/Algebra/AlgebraicGroup/Unramified/Kottwitz.lean`. No file was created for this issue.

Prior extraction ownership screened in this direction: PAPER-CESNAVICIUS-19, PAPER-CESNAVICIUS-22, PAPER-FINTZEN-21, PAPER-GILLE-PARIMALA-26, PAPER-HARPAZ-WITTENBERG-20, PAPER-HE-18, PAPER-HE-21, PAPER-KISIN-PAPPAS-18, PAPER-KISIN-PAPPAS-ZHOU-26, PAPER-KISIN-ZHOU-25. Exact prior item IDs are recorded in the JSON; same owner is an overlap lead, not an assertion that every pair of items is identical.

#### BunGAndNewtonStrata

BG0 already plans G-isocrystals and J_b, and BG1 their Newton/Kottwitz invariants. Add the exact invariant-π1 surjectivity of J_b(Qp) as a source theorem, importing ET.0 cohomology.

The item statements below and their JSON APIs define the specialized source obligations within the named existing stage scope.

Imports: ReductiveGroupsPartII:RG2.3/RG2.4; EndoscopicTransferAndUnitaryTraceComparison:ET.0.

Suggested future Lean file: `TauCeti/Algebra/Isocrystal/ReductiveAutomorphisms.lean`. No file was created for this issue.

Prior extraction ownership screened in this direction: PAPER-HE-21, PAPER-KISIN-MADAPUSIPERA-SHIN-22, PAPER-KISIN-ZHOU-25. Exact prior item IDs are recorded in the JSON; same owner is an overlap lead, not an assertion that every pair of items is identical.

#### AbelianSchemesAndArithmeticModuli

Abelian-scheme up-to-isogeny descent and twisting are already in the reviewed family scope. Add the exact realization comparison and conjugated adelic level adapter used by Kisin; generic torsor descent stays in SF.1.

The item statements below and their JSON APIs define the specialized source obligations within the named existing stage scope.

Imports: Abelian schemes and arithmetic moduli (AbelianSchemesAndArithmeticModuli); SchemeAndStackFoundations:SF.1.

Suggested future Lean file: `TauCeti/AlgebraicGeometry/AbelianScheme/TorsorTwist.lean`. No file was created for this issue.

Prior extraction ownership screened in this direction: PAPER-CARO-PASTEN-23, PAPER-CHARLES-16, PAPER-DIMITROV-GAO-HABEGGER-21, PAPER-GAO-GE-KUHNE-26, PAPER-GAO-HABEGGER-19, PAPER-KISIN-MADAPUSIPERA-SHIN-22, PAPER-KISIN-PAPPAS-18, PAPER-LIPNOWSKI-TSIMERMAN-18, PAPER-TSIMERMAN-18, PAPER-YUAN-26. Exact prior item IDs are recorded in the JSON; same owner is an overlap lead, not an assertion that every pair of items is identical.

#### FiniteFlatGroupsWithTensorsPartII

Reuse the existing candidate in this direction; these are additional source obligations, not a second roadmap or implemented stages.

Reuse the KPZ26/KP18 tensor-display candidate. Import finite flat groups and integral p-adic Hodge theory (FiniteFlatGroupsAndIntegralPadicHodgeTheory), p-adic Hodge theory (PadicHodgeTheory), crystalline cohomology (CrystallineCohomology), SF.1 descent and RG2 integral reductive groups. Add the hyperspecial height-one Breuil–Kisin specialization as an explicit interface, not a duplicate classification. Build the integral tensor frame, adapted-lift predicate, formally smooth R_G and relative period comparison before Kisin1.1.13/1.1.19. End with Kisin1.2.18–1.2.19 lattice specialization, κ preservation and quotient compatibility, and1.4.6 integral connection along frame families. Apply E.1–E.4 to Kisin2010: Frobenius conjugation stability of Lie(H), delete1.5.3, use Lie(G), and identify the horizontal Fil0 locus with the adapted completion. Retain the linear dual/Cartier dual Tate twist and inverse filtration. Break relative comparison, connection convergence and adapted factorization into declaration-sized proofs. Test Gm lattice p, zero modules and wrong E² height. Do not use the false integral representative g0∈G(OL) in the printed proof.

Imports: FiniteFlatGroupsAndIntegralPadicHodgeTheory; PadicHodgeTheory; CrystallineCohomology; SchemeAndStackFoundations:SF.1; ReductiveGroupsPartII.

Suggested future Lean file: `TauCeti/ArithmeticGeometry/IntegralPadicHodge/AdaptedHyperspecial.lean`. No file was created for this issue.

Prior extraction ownership screened in this direction: PAPER-KISIN-PAPPAS-18, PAPER-KISIN-PAPPAS-ZHOU-26, PAPER-KISIN-ZHOU-25. Exact prior item IDs are recorded in the JSON; same owner is an overlap lead, not an assertion that every pair of items is identical.

#### HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig

Reuse the existing candidate in this direction; these are additional source obligations, not a second roadmap or implemented stages.

Reuse the HE21 ADLV candidate. Keep its cordial/dimension branch separate from this minuscule mixed-characteristic component branch. Import Hecke stacks and local shtukas (HeckeStacksAndLocalShtukas), geometric Satake and fusion (GeometricSatakeAndFusion) for affine Grassmannians, BG0/BG1 for B(G), J_b, κ and Newton, RG2 for integral cosets, and the tensor-display Part II for lifts. Define frame-family π0 and prove its comparison with whichever geometric component functor is used. Prove nonemptiness, relative-position loci, Hodge–Newton reduction and the corrected CKV component theorem in the adjoint Qp-simple HN-indecomposable minuscule case; retain the μ=0,b~1 discrete G(Qp)/G(Zp) exception. Explicitly import CKV2017 Proposition0.0.1 and Lemma0.0.2 with the extra small orbits and full-orbit integer correction; fill the omitted D4/E6 verification before closure. End with Kisin1.2.21/1.2.23: rational Tate-lattice modifications of an adapted lift meet every frame component. Unit tests must distinguish invariants from coinvariants, orbit norms from invariant lifts and rational κ from torsion κ.

Imports: HeckeStacksAndLocalShtukas; GeometricSatakeAndFusion; BunGAndNewtonStrata:BG0/BG1; ReductiveGroupsPartII; FiniteFlatGroupsWithTensorsPartII.

Suggested future Lean file: `TauCeti/ArithmeticGeometry/AffineDeligneLusztig/MinusculeComponents.lean`. No file was created for this issue.

Prior extraction ownership screened in this direction: PAPER-HE-21. Exact prior item IDs are recorded in the JSON; same owner is an overlap lead, not an assertion that every pair of items is identical.

#### ReductiveGroupsArithmeticPartII

Reuse the existing candidate in this direction; these are additional source obligations, not a second roadmap or implemented stages.

Reuse the global reductive-arithmetic candidate of KMPS22 and Kisin–Zhou25. Import reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups), adelic algebraic groups and arithmetic quotients (AdelicAlgebraicGroups AA.1/AA.3/AA.4), global number fields (tauceti:TauCetiRoadmap/GlobalNumberFields), ET.0 reductive cohomology, SF.1 gerb foundations, and Néron models and semistable abelian varieties (NeronModelsAndSemistableAbelianVarieties) for connected torus Néron models. Build Q_L, weighted trace relations, norm-power transitions, local fundamental gerbs, the quasi-motivic gerb and universal ψ before the Weil tori P^L, their Frobenius elements and pushout gerb P. This constructs the gerb used by the paper and assumes no motivic realization conjecture; MotivesAndAlgebraicCycles MC6 remains its own Tannakian owner. Give the Serre-cocharacter condition both Galois identities and its split-times-compact consequence. Prove toric local/adelic parameter trivialization with connected T° level and inertia coinvariants; prove sufficiently divisible reciprocity and gerb Frobenius constructions agree already at a finite unramified level. The endpoint includes Kisin2.2.2 cocharacter selection,3.1.9 gerb existence/uniqueness,3.5.3 Weil trace property,3.6.7 toric trivialization and4.3.11 toric triple agreement. Original Langlands–Rapoport, Milne, class-field and approximation proofs remain explicit closure obligations.

Imports: tauceti:TauCetiRoadmap/ReductiveGroups; AdelicAlgebraicGroups:AA.1/AA.3/AA.4; tauceti:TauCetiRoadmap/GlobalNumberFields; EndoscopicTransferAndUnitaryTraceComparison:ET.0; SchemeAndStackFoundations:SF.1; NeronModelsAndSemistableAbelianVarieties.

Suggested future Lean file: `TauCeti/Algebra/AlgebraicGroup/Arithmetic/QuasiMotivicGerb.lean`. No file was created for this issue.

Prior extraction ownership screened in this direction: PAPER-KISIN-MADAPUSIPERA-SHIN-22, PAPER-KISIN-ZHOU-25. Exact prior item IDs are recorded in the JSON; same owner is an overlap lead, not an assertion that every pair of items is identical.

#### ShimuraVarietiesHondaTatePartII

Reuse the existing candidate in this direction; these are additional source obligations, not a second roadmap or implemented stages.

Reuse the KMPS22/Kisin–Zhou25/KPZ26/KP18 integral-reduction candidate. Import Shimura varieties (ShimuraVarieties), Shimura data (ShimuraData), PEL moduli (PELModuli), abelian-scheme twisting (AbelianSchemesAndArithmeticModuli), every local/gerb/cohomology owner listed in this extraction and AdelicAlgebraicGroups for approximation. First prove the Hodge integral isogeny map and frame-family propagation with tensor branches, then every isogeny class has a special lift (Kisin2.2.3) and tensor automorphisms match all local Frobenius centralizers. Stabilize geometric endomorphisms using sufficiently divisible fields. Build refined G/Gsc admissibility, special morphisms, local parameter torsors, component identifications and arithmetic Frobenius extensions; these import generic gerb and nonabelian cohomology rather than defining them privately. Build torsor twists of geometric classes and gerb morphisms, stabilized Kottwitz triples, adelic refinements, and the two Sha_G torsor-fiber theorems4.4.13/4.5.7. Match special torus triples, adjust components using J_b, and choose the adelic tau matching the actions. Prove4.6.2/4.6.5 with torus center, then the permitted Hodge-derived cover and central-isogeny descent. The final theorem4.6.7 is a Frobenius, center and A(G2)-equivariant point-tower bijection for p>2, abelian type and hyperspecial level with I(Q) action twisted by tau∈Iad(Af) depending only on the adjoint morphism class. It is not an untwisted LR theorem or a geometric-space isomorphism. Keep3.3.7/3.7.8 as conjecture predicates. Apply the integral-model errata: Δ° can be infinite; prove finite action at suitable levels before inverse-limit descent. Preserve real positivity, topological closures, Serre-center assumptions and conjugated levels throughout.

Imports: ShimuraVarieties; ShimuraData; PELModuli; AbelianSchemesAndArithmeticModuli; FiniteFlatGroupsWithTensorsPartII; HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig; ReductiveGroupsArithmeticPartII; SchemeAndStackFoundations:SF.1; EndoscopicTransferAndUnitaryTraceComparison:ET.0; AdelicAlgebraicGroups.

Suggested future Lean file: `TauCeti/ArithmeticGeometry/ShimuraVariety/LanglandsRapoportTwisted.lean`. No file was created for this issue.

Prior extraction ownership screened in this direction: PAPER-KISIN-MADAPUSIPERA-SHIN-22, PAPER-KISIN-PAPPAS-18, PAPER-KISIN-PAPPAS-ZHOU-26, PAPER-KISIN-ZHOU-25. Exact prior item IDs are recorded in the JSON; same owner is an overlap lead, not an assertion that every pair of items is identical.

### Item statements

The JSON is the authoritative machine-readable inventory: it includes prerequisites, consumers, source locators, ambient hypotheses, proof steps, API specifications, examples and closure gates. The table makes each result reviewable without requiring a reader to infer the mathematics from its identifier. Library status is limited to the stated carrier; planned status is limited to the named existing stage.

| ID | Status and owner | Source locator | Statement |
|---|---|---|---|

| L01 | library; baseline | §§1–4, imported foundational carrier in the limited scope stated | **Witt-vector coefficient carrier.** For prime p and perfect field k of characteristic p use the existing p-typical Witt vectors W(k), with coefficient sequence indexed by natural numbers; its fraction field supplies L. This item is only the coefficient carrier, not a crystalline site. |

| L02 | library; baseline | §§1–4, imported foundational carrier in the limited scope stated | **Frobenius on the Witt fraction field.** For a perfect domain k of characteristic p, the Witt Frobenius induces a ring automorphism of FractionRing(WittVector p k). |

| L06 | library; baseline | §§1–4, imported foundational carrier in the limited scope stated | **Connected reductive group predicate.** Reuse the finite-type commutative Hopf-algebra property expressing smoothness, geometric connectedness and trivial geometric connected normal smooth unipotent subgroups. |

| L07 | library; baseline | §§1–4, imported foundational carrier in the limited scope stated | **Algebraic torus predicate.** A finite-type affine group over a field is a torus when its coordinate Hopf algebra becomes that of a finite-rank split torus after extension to an algebraic closure. |

| L08 | library; baseline | §§1–4, imported foundational carrier in the limited scope stated | **Geometric character lattice.** Use the additive group of group-like elements of the geometrically extended coordinate Hopf algebra, with its absolute Galois action. For a torus this is X*(T). |

| L09 | library; baseline | §§1–4, imported foundational carrier in the limited scope stated | **Cocharacter lattice and pairing.** For a torus use geometric group-scheme morphisms G_m to T, their integral-dual comparison to X*(T), and the evaluation pairing. Its Galois action is contragredient. |

| L10 | library; baseline | §§1–4, imported foundational carrier in the limited scope stated | **Perfect character-cocharacter pairing.** For a torus over a field, its integral character-cocharacter pairing is perfect. |

| L11 | library; baseline | §§1–4, imported foundational carrier in the limited scope stated | **Closed dominant chamber of a root pairing.** For an ordered coefficient ring and a root-pairing base, the closed dominant chamber consists of vectors on which all simple coroot functionals are nonnegative. For cocharacters apply the dual root-pairing convention. |

| L12 | library; baseline | §§1–4, imported foundational carrier in the limited scope stated | **Unique dominant representative in a Weyl orbit.** For a finite reduced crystallographic root system over a strictly ordered ring, with the flipped pairing reduced, each Weyl orbit meets the closed dominant chamber in exactly one vector. Rationalization and the central torus direction of a reductive group are separate adapters. |

| L13 | library; baseline | §§1–4, imported foundational carrier in the limited scope stated | **Abelian variety over a field.** Reuse the existing proper geometrically integral group scheme over a field, with its derived smooth and commutative structure. This supplies A_x, not a universal abelian scheme. |

| L15 | library; baseline | §§1–4, imported foundational carrier in the limited scope stated | **Divided-power structure.** Use DividedPowers on an ideal of a commutative semiring, including its zero-outside-the-ideal convention and divided-power identities. A compatible PD enlargement still requires new geometry. |

| L16 | library; baseline | §§1–4, imported foundational carrier in the limited scope stated | **Finite free cocharacter lattice.** For a torus over a field its integral cocharacter module is finite free. |

| L17 | library; baseline | §§1–4, imported foundational carrier in the limited scope stated | **Galois invariance of the pairing.** For a multiplicative-type group, simultaneously applying a Galois automorphism to character and cocharacter leaves their integral pairing unchanged. |

| P02 | planned; ReductiveGroupsPartII:RG2.3 | §§1–4, imported foundational carrier in the limited scope stated | **Bruhat–Tits smooth stabilizers and connected parahorics.** Construct the smooth affine integral fixer and its neutral parahoric for a building point, retaining the Kottwitz distinction between the full fixer and connected fixer. |

| P03 | planned; ReductiveGroupsPartII:RG2.0a | §§1–4, imported foundational carrier in the limited scope stated | **Affine Weil restriction.** For a finite locally free base extension and affine finite-type scheme, represent the restriction-of-scalars functor; export base change and the induced group structure. |

| P04 | planned; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ | §§1–4, imported foundational carrier in the limited scope stated | **Pinned root subgroup maps.** For a split pinned Chevalley–Demazure group scheme, use root maps x_alpha, their Chevalley relations and base change, with the differential matching the pinning. |

| P08 | planned; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2 | §§1–4, imported foundational carrier in the limited scope stated | **Dieudonné and nilpotent deformation theory.** Contravariant Dieudonné modules classify p-divisible groups over perfect residue fields; nilpotent divided-power thickenings admit the corresponding Hodge-filtration deformation theory. |

| P09 | planned; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4 | §§1–4, imported foundational carrier in the limited scope stated | **Integral p-divisible group classification.** Use the Breuil–Kisin integral comparison for p-divisible groups over the relevant mixed-characteristic complete DVR, with tensors requiring the separate display continuation. |

| P10 | planned; AlgebraicModuliForArithmeticGeometry:R09.6 | §§1–4, imported foundational carrier in the limited scope stated | **Formal moduli and Artin approximation.** Relate completed local rings to deformation functors and prove the Artin algebraization/approximation comparison under its exact excellence and finite-presentation hypotheses. |

| P12 | planned; PELModuli:M1, PELModuli:M2 | §§1–4, imported foundational carrier in the limited scope stated | **Siegel and PEL good-level moduli.** Use the moduli of polarized abelian schemes with endomorphisms, Rosati and determinant conditions and sufficiently rigid prime-to-p level. Representability and smoothness here require the good-prime and no-p-level hypotheses of M2; parahoric chain moduli are the distinct supplier S38. |

| P13 | planned; ShimuraVarieties:V1, ShimuraVarieties:V6, ShimuraVarieties:V8 | §§1–4, imported foundational carrier in the limited scope stated | **Canonical generic Shimura models.** Use complex adelic Shimura varieties, reflex fields and canonical models with their away-p Hecke action and connected components. |

| A03 | planned; AbelianSchemesAndArithmeticModuli:A4 | §§1–4, imported foundational carrier in the limited scope stated | **Serre–Tate comparison with structures.** Deformations of the polarized abelian scheme with the source’s endomorphisms and level are identified with its structured p-divisible-group deformations, preserving the Hodge tangent map. |

| D01 | missing; display | §1.1.1, author pp5–6 | **Breuil–Kisin coefficient frame.** For perfect k of characteristic p>2, W=W(k), K0=Frac W, finite totally ramified K/K0 and uniformizer π with Eisenstein polynomial E, put S=W[[u]], φ(u)=u^p; retain the embedding u↦π and the p-completed divided-power envelope of (E). |

| D02 | missing; display | §1.1.1 | **Finite free Frobenius module and height one.** A finite free S-module M has φ_M:φ* M[1/E]≃M[1/E]. The Barsotti–Tate subcategory has an integral linearized map with cokernel killed by E. |

| D03 | missing; display | Theorem1.1.2(1) | **Crystalline lattice functor.** The functor M from crystalline G_K-stable Zp-lattices to finite free Frobenius S-modules is fully faithful and compatible with tensor, symmetric and exterior operations in Theorem1.1.2. |

| D04 | missing; display | Theorem1.1.2(2) | **Rational crystalline and de Rham specializations.** For T crystalline, identify Dcris(T[1/p]) with (M(T)/u)[1/p], and DdR with φ*M(T)⊗_S K, with the filtration, Frobenius and comparison normalizations of Theorem1.1.2. |

| D05 | missing; display | Theorem1.1.2(3) | **Unramified integral period comparison.** Over the specified unramified period extension, M(T) and T become naturally isomorphic with their tensors and Frobenius structures. This integral comparison does not assert a frame over S itself. |

| D06 | missing; display | Theorem1.1.4 | **Integral tensor frame for a reductive stabilizer.** For crystalline T and G⊂GL(T) reductive over Zp defined by the invariant tensors, those tensors give M(T) a G-frame over S when k is separably closed, or k is finite and G is connected, in Theorem1.1.4. |

| D07 | missing; display | Theorem1.1.6 and footnote2 | **Barsotti–Tate comparison and variance.** The height-one classification compares a p-divisible group with its contravariant Dieudonné crystal and the linear dual Tp(G)∨. Record Tp(G)∨=Tp(G^D)(−1), not Tp(G^D). Give the equivalence with the appropriate opposite-category adapter. |

| D08 | missing; display | §1.1.9 | **Adapted p-divisible-group lift.** For a p-divisible group over k with Frobenius-invariant integral crystalline tensors and reductive stabilizer G, an adapted lift carries the integral PD tensor lifts, a reductive tensor stabilizer, and de Rham tensors in Fil0 with the prescribed conjugacy class of filtration. |

| D09 | missing; display | Proposition1.1.10 | **Smooth adapted deformation quotient.** The universal deformation ring has a formally smooth quotient R_G whose maps to the admitted finite DVR extensions classify adapted lifts, in the hyperspecial reductive setting. |

| D10 | missing; display | Proposition1.1.13 | **Étale criterion for adaptedness.** A lift is adapted iff its crystalline tensors arise from integral étale tensors with reductive stabilizer as in Proposition1.1.13. The comparison carries Fil0 and the specified tensor frame. |

| D11 | missing; display | §1.1.15 | **Relative crystalline period ring.** For the normal noetherian integral p-complete p-torsion-free coefficient ring R of §1.1.15, construct the normalization through finite extensions étale after inverting p, the tilt, θ and its p-completed PD envelope A_cris(R). |

| D12 | missing; display | §§1.1.15–1.1.17 | **Relative crystalline comparison after the period.** The relative comparison for the p-divisible group becomes an isomorphism after inverting the specified period t, and its Fil0,φ=1 rational invariants recover the rational étale tensors. |

| D13 | missing; display | Proposition1.1.13 proof, §§1.1.11–1.1.14 | **Explicit adapted lift with chosen cocharacter.** Using the lift μ0 of the filtration and b, the source constructs the height-one module with Frobenius involving c μ0(E(u))^−1, c=σ^−1(b)μ0(E(0)), and obtains the adapted p-divisible lift. |

| D14 | missing; display | Proposition1.1.19 | **Admissible filtration gives an adapted isogenous lift.** For a cocharacter μ conjugate to μ0 whose inverse filtration is admissible on the rational crystal, after a finite extension there is a quasi-isogenous p-divisible-group lift with a suitable integral G-lattice, adapted to its conjugate reductive stabilizer. |

| G01 | missing; local | §§1.2.1–1.2.2 | **Unramified Cartan and Kottwitz data.** For connected reductive G/Zp, choose a maximal split torus, maximal torus and Borel. The Cartan cocharacter μ_b is dominant; tildeκ:G(L)→π1(G) retains the coroot quotient, and κ takes Frobenius coinvariants. |

| G02 | missing; local | Lemma1.2.3 | **Invariant cocharacters lift invariant fundamental classes.** For unramified G and its torus chosen in a rational Borel, X_*(T)^Γ→π1(G)^Γ is surjective. This is a statement about invariants, not coinvariants. |

| G03 | missing; local | Lemma1.2.4 | **Adjoint Cartan coset lift.** An adjoint G(L)/G(OL) coset lifts through G when its tildeκ-class lifts to π1(G), with the compatibility in Lemma1.2.4. |

| X01 | missing; adlv | §1.2.5 | **Smooth characteristic-p frame.** A frame for an Fpbar-algebra R is the p-complete p-torsion-free OL-algebra lifting R with Frobenius lift and the smoothness/base-change conditions of §1.2.5. |

| X02 | missing; adlv | Lemmas1.2.6–1.2.8 | **Relative-position loci in a frame.** For a framed G-isocrystal family, bounded relative position is closed and exact relative position locally closed with locally constant tildeκ; for minuscule μ use the source’s étale-local factorization. |

| X03 | missing; adlv | §1.2.9 | **Affine Deligne–Lusztig set and frame components.** X_μ(b)={gG(OL):g^−1bσ(g)∈G(OL)p^μG(OL)}. Define π0 using the equivalence relation generated by smooth connected frame families, as in §1.2.9. Comparison with components of a perfect scheme is a separate obligation. |

| B01 | planned; BunGAndNewtonStrata:BG0 | §1.2.12 | **G-isocrystal and sigma-centralizer.** For connected reductive G/Qp and b∈G(L), B(G) is the set of σ-conjugacy classes, and J_b(R)={g∈G(R⊗Qp L):g b=b σ(g)} with its algebraic descent and inner-Levi structure. |

| B02 | planned; BunGAndNewtonStrata:BG1 | §1.2.10, equation1.2.11 | **Newton invariant and acceptable classes.** The rational dominant Newton point ν_b and Kottwitz invariant define B(G,μ) by κ(b)=[μ] and ν_b≤μ-bar. Distinguish the set of b representatives from its σ-conjugacy quotient. |

| X04 | missing; adlv | §1.2.10, after equation1.2.11 | **ADLV nonemptiness criterion.** For unramified G and the source’s minuscule μ, X_μ(b) is nonempty exactly when [b]∈B(G,μ). |

| X05 | missing; adlv | §1.2.13 | **Hodge–Newton indecomposable pair.** For b in the Newton centralizer Levi and a minuscule μ, require that no proper admitted Levi M contains the datum with κ_M(b)=μ in π1(M)_Γ. Retain the source’s chosen dominant/conjugacy conventions. |

| X06 | missing; adlv | Theorem1.2.14 | **Minuscule connected-components classification.** Suppose G is adjoint and Qp-simple, μ is minuscule, b∈B(G,μ), and (μ,b) is HN-indecomposable. For c with σ(c)−c=[μ]−tildeκ(b), either tildeκ bijects π0(X_≤μ(b)) with the coset c+π1(G)^Γ, or μ=0 and b is σ-conjugate to1, with X_μ(b)=X_≤μ(b)=π0(X_μ(b))≃G(Qp)/G(Zp). Use the corrected CKV proof. |

| X07 | missing; adlv | CKV2017 Corrigendum Proposition0.0.1, published218–221 | **Corrected invariant kernel generators.** In CKV’s hypotheses, enlarge the coroot-orbit generators meeting C by the specified small orbits Φ0, so they generate ker(π1(M)^Γ→π1(G)^Γ); every additional orbit sum maps trivially to the G-ADLV component set. |

| X08 | missing; adlv | CKV2017 Corrigendum Lemma0.0.2, pp218–219 | **Connected transfer with an orbit-sum correction.** For x′=x+α∨−α_m∨ in the corrected CKV setup, choose connected g,g′ with w_M(g)−w_M(g′)=Σ_{i=0}^{m−1}α_i∨+nΣ_{β∈Ω}β∨ for an integer n. |

| D15 | missing; display | Lemma1.2.18, author pp15–16 | **Specialized lattice preserves the Kottwitz class.** Changing the Tate lattice of an adapted lift by g gives a special Dieudonné lattice g0D with tildeκ(g0)=tildeκ(g). The frame representing g0 lies in G(L), not necessarily G(OL). |

| D16 | missing; display | Lemma1.2.19 | **Central quotient compatible specialized frame.** Under the Galois-image condition of Lemma1.2.19, choose the specialized frame so that its image under the stated central quotient agrees with the original Tate frame modulo integral points. |

| X09 | missing; adlv | §1.2.20 | **Frobenius change of relative-position convention.** The map g↦σ^−1(b^−1g) identifies the X_{σ(μ)^−1}(b) and X_{μ^−1}(b) descriptions used for the contravariant crystal. |

| X10 | missing; adlv | Proposition1.2.21 | **Liftable lattice classes meet every component.** In the HN-indecomposable case of Proposition1.2.21, the rational Tate-lattice cosets of the chosen adapted lift meet every frame component of the relevant ADLV. |

| X11 | missing; adlv | Proposition1.2.23 | **Levi-adapted lift meets all components.** For the general minuscule datum, choose the Levi-adapted lift of Proposition1.2.23 so that its liftable Tate-lattice image meets every relevant connected component. |

| S01 | missing; shimura | §§1.3.1–1.3.3 | **Hyperspecial Hodge-type integral model.** For a Hodge-type Shimura datum at p>2 with a reductive integral symplectic embedding and hyperspecial Kp, take the normalization of its closure in the sufficiently small Siegel good-level model; retain the universal abelian scheme and tensor system. |

| S02 | missing; shimura | §§1.3.5–1.3.8 | **Integral realizations of absolute Hodge tensors.** The absolute Hodge tensors defining the Hodge embedding have compatible integral étale, de Rham and crystalline realizations at the admitted integral points, with the inverse Hodge-cocharacter convention. |

| S03 | missing; shimura | Proposition1.3.9; Corollary1.3.11 | **Tensor description of formal branches.** The adapted formally smooth deformation space identifies the appropriate formal component of the normalization; branches above a closure point agree exactly when their crystalline tensors agree. |

| S04 | missing; shimura | §§1.4.1–1.4.2 | **Frobenius action on the isogeny parameter.** Let r be the local reflex residue degree and b the crystalline Frobenius matrix. Define Φ_r(g)=bσ(b)…σ^{r−1}(b)σ^r(g) on the prescribed ADLV cosets. |

| S05 | missing; shimura | Proposition1.4.4 | **Isogeny map into the integral Hodge model.** For x in the special fiber, the unique map ι_x from the crystalline-tensor ADLV to the Hodge integral model realizes the corresponding p-divisible lattice modification and preserves its tensors. |

| S06 | missing; display | Lemma1.4.6 | **A framed lattice family acquires an integral connection.** For the smooth framed family in Lemma1.4.6, sufficiently many Frobenius pullbacks make the transformed connection preserve the lattice; the height-one crystal then comes from a p-divisible group with the stated filtration. |

| S07 | missing; shimura | Proposition1.4.9 | **A family through one Hodge point factors through Hodge type.** The family of modified abelian varieties in Proposition1.4.9 factors through the Hodge integral model if one point does, using the adapted deformation rings, horizontal tensors and the stated connected smooth frame. |

| S08 | missing; shimura | Proof of Proposition1.4.4, author pp25–26 | **All ADLV components satisfy the Hodge condition.** The good locus for the isogeny map is a union of frame components; the liftable characteristic-zero quasi-isogenies meet every component, so the locus is the whole ADLV. |

| S09 | missing; shimura | Corollary1.4.12 | **Characteristic-zero specialization diagram.** The generic Tate-lattice isogeny map specializes to the crystalline ADLV isogeny map in the diagram of Corollary1.4.12. |

| S10 | missing; shimura | Corollary1.4.13 | **Isogeny map equivariance.** The isogeny map commutes with geometric reflex Frobenius, Z_G(Qp) and the away-p Hecke action. |

| S11 | missing; shimura | §1.4.14; Proposition1.4.15 | **Tensor-preserving geometric isogeny class.** The class of x is the image of ι_x with all away-p levels. Equivalently it consists of points linked by a quasi-isogeny preserving weak polarization, every away-p étale tensor and every crystalline tensor. |

| S12 | missing; shimura | §§2.1.1–2.1.2 | **Fixed-field and geometric tensor automorphism groups.** For x over finite k, I_/k is its rational tensor-preserving quasi-automorphism group; I is the group after geometric endomorphisms stabilize. Define I_ell/k and I_ell using Frobenius centralizers, and I_p/k via δσ; stabilized groups use sufficiently divisible extensions. |

| S13 | missing; shimura | Proposition2.1.3 | **Rational double quotient injects into the Shimura tower.** The map ι_x induces an injection I(Q)\(X_ν(δ)×G(Af^p)) into the special-fiber tower, with image the isogeny class. |

| S14 | missing; shimura | Proposition2.1.5 | **Finite-field adelic class-set injection.** For the specified compact stabilizers H^p,H_p, the finite-field adelic I_/k class set injects into the finite-level k-points; neat level removes the residual automorphism ambiguity. |

| S15 | missing; shimura | Corollary2.1.7 | **Full-rank tensor automorphism group.** There is an auxiliary split prime ell with I_Qell≃I_ell; hence rank I=rank G. |

| G04 | missing; arithmetic | Lemma2.2.2 | **A maximal centralizer torus admits the required cocharacter.** Every maximal Qp-torus T⊂I_p admits μ_T conjugate to μ with Galois average μ_T-bar=ν_δ^−1. |

| S16 | missing; shimura | Theorem2.2.3; Theorem0.4 | **Special point in every Hodge-type isogeny class.** Every tensor-preserving geometric isogeny class of the hyperspecial Hodge-type special fiber at p>2 contains the reduction of a special point. |

| S17 | missing; shimura | Corollary2.2.5, author pp32–33 | **Special lift with prescribed torus filtration.** For maximal global T⊂I and μ_T conjugate to μ with average ν_δ^−1, a point in the isogeny class admits a special lift with T-action and the associated admissible filtration. Fix the inverse-filtration dictionary of Lemma2.2.2 and its proof; author Corollary2.2.5 writes μ_T for that filtration. |

| S18 | missing; shimura | Corollary2.3.1 | **Common rational Frobenius representative.** There is γ0∈G(Q) conjugate to γ_ell in G(Qell) for every ell≠p, stably conjugate to γ_p at p, and elliptic over R. |

| S19 | missing; shimura | Corollary2.3.2 | **All-prime tensor automorphism comparison.** For every finite prime, including p, I_Qell≃I_ell and (I_/k)_Qell≃I_ell/k via the realization maps. |

| S20 | missing; shimura | Corollary2.3.5; §4.3.1; proof4.4.13 p84 | **Global automorphism group as an inner form.** After increasing the finite field so the Frobenius centralizer has stabilized, I is an inner form of I0=C_G(γ0), and its local realization isomorphisms agree with that inner twisting up to inner automorphisms. |

| C01 | missing; stacks | §3.1.1 | **Galois gerb with algebraic kernel.** For a characteristic-zero Galois extension k′/k, a gerb is a topological extension 1→H(k′)→Q→Gal(k′/k)→1, with discrete kernel, algebraic semilinear conjugation, and a continuous section over a finite-index Galois subgroup giving the required descent and semidirect-product chart. |

| C02 | missing; stacks | §3.1.1 | **Morphisms and conjugacy of Galois gerbs.** A gerb morphism is continuous over the Galois group and algebraic on the kernel. Conjugacy is by target-kernel points. For pro-gerbs keep the compatible finite-stage conjugacy data. |

| C03 | missing; stacks | §3.1.1 | **Gerb isomorphism scheme and automorphism group.** For morphisms f1,f2 into the neutral gerb of G, the functor of kernel-point conjugators is the descended k-scheme Isom(f1,f2); I_f=Isom(f,f) is its automorphism group. |

| C04 | missing; stacks | Lemma3.1.2(1) | **Descent of the kernel-image centralizer.** I_f becomes the centralizer of f_alg(H) after scalar extension to k′, with descent action induced by f of a continuous section. Its cocycle defect acts trivially on that centralizer. |

| H01 | missing; cohom | Lemma3.1.2(2) | **Gerb morphisms with fixed algebraic restriction.** Morphisms f′ with exactly the same algebraic restriction as f correspond to continuous Z1(Gal(k′/k),I_f(k′)); f′ is conjugate to f exactly when its class in the twisted H1 is trivial. |

| C05 | missing; stacks | §3.2.1; Borovoi3.2.1 | **Crossed module and quotient groupoid.** A homomorphism ∂:F→H with H-action on F satisfies equivariance and the Peiffer identity. Its quotient groupoid H/F has objects H and arrows f:h1→h2 when h2=∂(f)h1, with the induced strict monoidal structure. |

| C06 | missing; stacks | §3.2.1 | **Monoidal isomorphism and conjugacy data.** For strict monoidal functors, retain natural isomorphisms respecting tensor and unit, conjugacy by a target group element, and the composite relation conjugate-isomorphism. |

| C07 | missing; stacks | §3.2.2; Borovoi3.7.1 | **Simply connected quotient as a Picard groupoid.** For connected reductive G over characteristic zero, the canonical G-action on Gsc from the lifted commutator gives Gsc→G a crossed module and the quotient G/Gsc a Picard groupoid; retain its neutral-gerb analogue. |

| C08 | missing; stacks | Lemma3.2.3 | **Conjugacy is redundant in the Picard quotient.** For functors into G/Gsc over the algebraic closure, conjugate-isomorphic is equivalent to isomorphic. |

| C09 | missing; stacks | Lemma3.2.4, first assertion | **Cocharacters of the Picard quotient.** Algebraically induced monoidal cocharacters of G/Gsc modulo isomorphism are naturally π1(G). |

| C10 | missing; stacks | Lemma3.2.4, second assertion | **Picard-stack cocharacters lift to G.** Every morphism of Picard stacks Gm→G/Gsc over the algebraic closure lifts to G, and its equivalence class is the cocharacter class of C09. |

| C11 | missing; stacks | §3.2.5 | **Two-fiber product of categories.** For F1:C1→C and F2:C2→C, objects are (c1,c2,α:F1(c1)≃F2(c2)); arrows are pairs making the comparison square commute. Strict monoidal structures induce the compatible monoidal two-fiber product. |

| C12 | missing; stacks | Lemma3.2.6, group assertion | **Reconstruction from adjoint and Picard quotient.** G(Qbar) is equivalent, as a monoidal category, to Gad(Qbar)×_{Gad/Gsc}(G/Gsc)(Qbar). |

| C13 | missing; stacks | Lemma3.2.6, gerb assertion | **Neutral gerb reconstruction.** The analogous two-fiber-product equivalence reconstructs the neutral gerb of G from its adjoint gerb and its G/Gsc quotient gerb. |

| H02 | missing; cohom | §3.2.7; Borovoi3.1–3.3,3.6 | **Continuous cohomology of a crossed module.** For a profinite Δ continuously acting on discrete crossed-module groups F→H, construct H^−1,H0,H1 from the cocycle formulas and gauge relations. H0 is a group; H1 is initially a pointed set. |

| H03 | missing; cohom | §3.2.7(2); Borovoi3.5.3 | **Crossed-module quasi-isomorphism invariance.** A morphism of crossed modules inducing isomorphisms on kernel and cokernel induces bijections on the stated continuous H^−1,H0,H1. |

| H04 | missing; cohom | §3.2.7(3); Borovoi Corollary3.4.3 | **Crossed-module low-degree exact sequence.** The exact sequence runs from H^−1(F→H) through H0(F),H0(H),H0(F→H),H1(F),H1(H),H1(F→H), with pointed-set exactness at nonabelian terms. |

| H05 | missing; cohom | Borovoi3.8.1–3.8.2, correcting the scope of Kisin3.2.7(4) | **Reductive abelianized cohomology.** For connected reductive G, the central and maximal-torus complexes Z(Gsc)→ZG and Tsc→T are quasi-isomorphic to Gsc→G. Transport their abelian hypercohomology to give canonical functorial abelian H^i(Gsc→G). |

| H06 | missing; cohom | Theorem3.4.6; Borovoi Theorem5.12 | **Global-real abelianization square.** For connected reductive H/Q, the square H1(Q,H)→H1(Q,Hsc→H) over H1(R,H)→H1(R,Hsc→H) is cartesian, and all four arrows are surjective. |

| Q01 | missing; arithmetic | §3.1.3 | **Universal quasi-motivic torus at a finite level.** For finite Galois L/Q, write L(v)=L∩Qv. Define Q_L=(Res_{L(∞)/Q}Gm×Res_{L(p)/Q}Gm)/Gm diagonally, with its two local cocharacters and ψ_L given by p inclusion times inverse infinity inclusion into Res_{L/Q}Gm. |

| Q02 | missing; arithmetic | Lemma3.1.4 | **Universal weighted local cocharacter relation.** (Q_L,ν∞,νp) is initial among L-split Q-tori with local cocharacters satisfying Σ_{v=p,∞}[L_v:Q_v]^−1 tr_{L/Q}(ν_v)=0. |

| Q03 | missing; arithmetic | §§3.1.5–3.1.6 | **Quasi-motivic protorus and rational p-cocharacter.** Take Q=lim_L Q_L with the specified norm-power transitions; D=lim_{n\|n′}Gm has transition x↦x^{n′/n}, n>0. Construct ν∞:Gm_R→Q_R and νp:D→Q_Qp using the local degree rescalings. |

| Q04 | missing; arithmetic | §3.1.6 | **Local fundamental-class gerbs.** At v≠p,∞ use Gal(Qbarv/Qv); at infinity use the fundamental extension by C×; at p use the inverse system of local fundamental-class extensions, with kernel D and its unramified presentation. |

| Q05 | missing; arithmetic | §3.1.7 | **Quasi-motivic Galois gerb.** A pro-gerb Q with kernel the protorus Q has local morphisms ζ_v matching ν∞,νp, a Galois-compatible kernel identification, and integral local sections at almost all finite primes after each finite torus pushout. |

| Q06 | missing; arithmetic | Theorem3.1.9, first assertion | **Existence and uniqueness of the quasi-motivic gerb.** A quasi-motivic gerb exists and is unique up to a gerb isomorphism respecting each local morphism up to conjugacy; that isomorphism is itself unique up to conjugacy. |

| Q07 | missing; arithmetic | Theorem3.1.9, second assertion | **Universal induced-torus gerb morphism.** The protorus map ψ_alg lifts to ψ:Q→G_{lim Res Gm}, uniquely up to conjugacy. |

| Q08 | missing; arithmetic | §3.1.10 | **Gerb morphism attached to a torus cocharacter.** For T/Q and μ∈X_*(T) defined over finite Galois L, send Σ a_τ τ to Σ a_τ τ(μ) on cocharacters of Res_{L/Q}Gm, and compose ψ to obtain ψ_μ:Q→G_T. |

| Q09 | missing; arithmetic | §3.5.1 | **Weil torus.** For a CM field L and q=p^m, take q-Weil numbers of an integral weight, units away from p and with the stated integral local norm valuations; quotient by roots of unity. The power transition systems define the stable finite-rank character lattice of P^L. |

| Q10 | missing; arithmetic | Lemma3.5.3 | **Universal Weil-torus trace relation.** The Weil torus is initial among the split tori with rational infinity and L(p)-defined p-cocharacters satisfying [L_p:Qp]^−1 tr_{L/L0}νp+ν∞=0; Q_L surjects onto P^L. |

| Q11 | missing; arithmetic | Corollary3.5.4 | **Distinguished Weil Frobenius elements.** For sufficiently divisible positive n choose δ_n∈P^L(Q), unique modulo torsion, with χ_π(δ_n)=π^{n/m} for q=p^m and m\|n. Retain power and CM-extension compatibility. |

| Q12 | missing; arithmetic | §3.5.5 | **Motivic pro-gerb as a pushout.** Set P=lim_L P^L with its rescaled ν∞,νp and push out the quasi-motivic gerb Q along Q→P. This is the gerb used here, without asserting a category of actual motives realizing it. |

| Q13 | missing; arithmetic | §3.5.6 | **Serre condition on a torus cocharacter.** For complex conjugation c, require (τ−1)(c+1)η=(c+1)(τ−1)η=0 for every τ. A Serre torus satisfies this for all cocharacters; it is isogenous to a Q-split torus times a real-compact torus. |

| R01 | missing; shimura | §§3.3.1–3.3.2 | **Refined abelianization of a gerb morphism.** Compose a morphism Q→G_G with G_G→G_G/Gsc; attach ψ_mu^ref through the group-ring construction in the quotient monoidal category. This retains the full π1(G) class. |

| R02 | missing; shimura | §3.3.3 | **Local gerb isogeny parameter set.** For θ:Gp→G_G(p), Xp(θ) consists of g modulo G(Zp^ur) such that Int(g^−1)θ descends to the unramified gerb and sends d_σ to b_g⋊σ with b_g∈G(Zp^ur)p^{−μ}G(Zp^ur). |

| R03 | missing; shimura | Lemma3.3.4 | **Local gerb parameter equals an ADLV.** After choosing g0 giving an unramified presentation, g↦g0g identifies X_{−μ}(b_g0) with Xp(θ), compatibly with Frobenius. |

| R04 | missing; shimura | §§3.3.5–3.3.6 | **Admissible gerb morphism.** For a hyperspecial unramified Shimura datum, φ:Q→G_G is admissible when its refined abelianization is conjugate-isomorphic to ψ_mu^ref, its local maps at v≠p are conjugate to ξ_v, and Xp(φ) is nonempty. At infinity ξ∞ uses the weight and μ_h(−1). |

| R05 | missing; shimura | §3.3.6; §3.4.15 | **Adelic point parameter and its twisted quotient.** For admissible φ, X^p is the restricted-product torsor of local conjugators, X=Xp×X^p, and S_tau(φ)=lim_{K^p}I_phi(Q)\X/K^p with the rational I-action conjugated by tau∈I_phi^ad(Af). |

| R06 | missing; shimura | Lemma3.4.1 | **Refined compatibility implies local quotient compatibility.** Condition1 of admissibility implies the refined local quotient is conjugate-isomorphic to ξ_v for every v≠p. |

| R07 | missing; shimura | Lemma3.4.2 | **Admissibility lifts the adjoint p-condition.** If φ satisfies refined abelianization and Xp(φad) is nonempty, then Xp(φ) is nonempty. |

| R08 | missing; shimura | §3.4.7; Lemma3.4.8 | **Positive rational-adjoint lifting group.** G(Qbar)^natural+ is the preimage of Gad(Q)^+; its quotient by G(Q)^+ is identified with central cocycles whose class is real-trivial and comes from H1(Q,ZGsc). |

| R09 | missing; shimura | Proposition3.4.11 | **Admissible lifts form a nonempty torsor.** For admissible φ0 into Gad, admissible lifts into G form a torsor under G(Qbar)^natural+/G(Q)^+; the lifts conjugate to one fixed φ form an I_phi0(Qbar)^natural/I_phi(Q)-torsor. |

| R10 | missing; shimura | §3.4.15 | **Parameter set with fixed adjoint morphism.** S_tau(G,φ0) is the tower quotient of the disjoint union of X(φ) over all admissible lifts of φ0 by I_phi0(Qbar)^natural, using the tau-conjugated action. |

| R11 | missing; shimura | Lemma3.5.8 | **Special torus morphisms are admissible.** If i:T→G and h_T define a toric Shimura subdatum, i∘ψ_mu_hT is admissible. |

| R12 | missing; shimura | §3.5.9 | **Special admissible morphism.** An admissible morphism is special if it is conjugate to i∘ψ_mu_hT for some toric Shimura subdatum (T,h_T,i). |

| R13 | missing; shimura | Lemma3.5.10 | **Specialness detected on the adjoint quotient.** An admissible φ is special iff φad is special. |

| R14 | missing; shimura | Theorem3.5.11 | **All admissible morphisms are special.** Every admissible morphism into a Shimura datum is special, in the hypotheses of §3. |

| R15 | missing; shimura | Lemma3.5.7 | **Factorization through the motivic gerb.** If ZG° splits over a CM field and the weight is rational, every admissible φ factors through P; in particular this holds when ZG° satisfies the Serre condition. |

| R16 | missing; shimura | §3.6.1 | **Refined quotient local parameter sets.** For the refined functor φ, X^p uses pairs (g_ell,ε_ell) with monoidal local isomorphisms, modulo Gsc(Qbar adeles). Xp uses G(Qbarp)/(Gsc(Qp^ur)G(Zp^ur)), exact unramified descent, and tildeκ(b)=[−μ] before Frobenius coinvariants. |

| R17 | missing; shimura | Lemma3.6.2 | **Gerb connected-component torsor.** Form tildeπ(G,φ0) from the quotient local sets over all admissible lifts, then quotient by G(Qbar)^natural+ and take the away-p level limit. It is a torsor under π(G)=closure(G(Q)^+)\G(Af)/G(Zp). |

| R18 | missing; shimura | Corollary3.6.4; §3.6.5 | **Canonical comparison for adjoint-conjugate morphisms.** If φad and φ′ad are conjugate, their π(G)-torsors are canonically isomorphic as in Corollary3.6.4. This identification need not be the tautological identity on coincident underlying sets. |

| R19 | missing; arithmetic | §3.6.6 | **Toric local parameter with connected Néron level.** For any Q-torus T and μ_T, use tildeκ_T:T(Qp^ur)→X_*(T)_I with kernel T°(Zp^ur), the connected Néron model. Define toric X and S=closure(T(Q))\X; for protori take the stated inverse systems. |

| R20 | missing; arithmetic | Proposition3.6.7 | **Canonical trivialization of the toric double quotient.** X(ψ_muT) is a T(Af)/T°(Zp)-torsor and S(ψ_muT) is canonically T(Q)^−\T(Af)/T°(Zp), functorially in (T,μ_T). |

| R21 | missing; shimura | §3.6.8; §3.8.1 | **Integral Shimura datum category.** An object of SHp is a reductive G/Z_(p) with a Shimura datum on its generic fiber; morphisms are integral reductive maps inducing Shimura maps. Fix the adjoint datum and optionally X+ for the indicated subcategories. |

| R22 | missing; shimura | Proposition3.6.10 | **Gerb components identify with Shimura components.** There is a unique system θ_G:π(G,φ0)≃π0(Sh_Kp(G,X)(C)), natural for fixed-adjoint integral Shimura maps and compatible with every special-torus reciprocity diagram. |

| R23 | missing; stacks | §3.7.3 | **Semidirect quotient for compatible actions.** If Δ acts on H and Γ⊂H, with equivariant Γ→Δ acting by conjugation on H, define H*ΓΔ=(H⋊Δ)/{(γ,φ(γ)^−1)}. This is the source’s semidirect quotient, not an arbitrary free amalgamated product. |

| R24 | missing; shimura | Lemma3.7.2; §3.7.3 | **Arithmetic action group and its component kernel.** A(G)=G(Af^p)*_{G(Z_(p))^+}Gad(Z_(p))^+, and A(G)° uses the closure of G(Z_(p))^+ in G(Af^p). It acts on S_tau(G,φ0) and projects to π(G). |

| R25 | missing; shimura | Lemma3.7.4 | **Surjective equivariant component projection.** The local quotient maps induce c_G:S_tau(G,φ0)→π(G,φ0), surjective and A(G)-equivariant for every admitted tau. |

| R26 | missing; shimura | Remark3.7.10(2) | **Central equivariance follows from Hecke equivariance.** For the unramified center in §3.7.10, ZG(Qp)=ZG(Zp)ZG(Q), with the finite component quotient treated by Lang and finite flatness. Hence the indicated bijection’s ZG(Qp)-equivariance follows from away-p equivariance and trivial diagonal rational action. |

| R27 | missing; shimura | §3.8.1 | **Connected gerb parameter fiber.** Fix X+ in the adjoint datum, let y be its preimage under θ_G, and set S_tau(G,φ0)^+=c_G^−1(y). Retain the ambient group action and chosen component. |

| R28 | missing; shimura | Lemma3.8.2 | **Connected fiber invariant under a derived isomorphism.** A surjective map of integral reductive Shimura data inducing an isomorphism on derived groups induces a bijection on S_tau^+. |

| R29 | missing; shimura | §3.8.4; Lemma3.8.5 | **Arithmetic Frobenius stabilizer extension.** E_p^r is the stabilizer of S_tau^+ in A(G)×〈Φ_r〉. It is an extension of 〈Φ_r〉 by A°, determined by derived integral G, X+ and r, independently of φ0 and tau. |

| R30 | missing; shimura | Lemma3.8.8 | **Reconstruction from the connected parameter fiber.** There is an A(G)×〈Φ〉-equivariant bijection S_tau(G,φ0)≃[A(G)×S_tau(Gder,φ0)^+]/A°, with the extension action defined by the semidirect-quotient construction. |

| R31 | missing; shimura | Lemma3.8.10 | **Induced central torus quotient of parameters.** For a surjective integral reductive map with induced central torus kernel Z, S_tau(G2,φ0)≃S_tau(G,φ0)/Z(Af^p); the connected fibers and Frobenius extensions are induced along A(G)°→A(G2)°. |

| R32 | missing; shimura | Corollary3.8.12 | **Central derived isogeny comparison.** For an integral central isogeny Gder→G2der with the same adjoint Shimura datum and r′ divisible by both local reflex degrees, S_tau(G2,φ0)≃[A(G2)×S_tau(Gder,φ0)^+]/A(G)°, equivariantly for A(G2)×〈Φ_r′〉; retain the corresponding extension and connected-fiber identifications. |

| T01 | missing; stacks | §4.1.1 | **Twist of a representation by a torsor.** For an affine Q-group Z, right Z-torsor P and Q-representation W, define W^P=(W⊗Q O(P))^Z using (zf)(x)=f(xz) on functions and the diagonal action. |

| T02 | missing; stacks | Lemma4.1.2(1) | **Exact tensor and dual compatibility of twisting.** The twist functor is exact and respects tensor products and duals; its comparison after O(P) is an isomorphism. |

| T03 | missing; stacks | Lemma4.1.2(2) | **Galois cocycle of a twist frame.** For ω∈P(F), F/Q finite Galois, the evaluation frame θ_ω satisfies τθ_ωτ^−1=c_ω(τ)^−1 θ_ω with c_ω(τ)=ω^−1τ(ω). |

| T04 | missing; stacks | Lemma4.1.5 | **Tensor isomorphisms of a twisted representation.** For finite free R-module W with Z-fixed tensors defining G_R, the tensor-isomorphism scheme W^P→W is the induced torsor (P_R×G_R)/Z with the stated inverse left action on G_R. |

| T05 | planned; AbelianSchemesAndArithmeticModuli:A2, AbelianSchemesAndArithmeticModuli:A6 | §4.1.6 | **Twist of an abelian scheme up to isogeny.** For an abelian S-scheme A up to isogeny with affine Q-group Z action and Z-torsor P, the functor (A(T)⊗O(P))^Z is represented by an abelian scheme A^P up to isogeny, with compatible dual and weak polarization. |

| T06 | missing; abelian | Lemma4.1.7 | **Exact additive realizations commute with twisting.** Any exact additive Q-linear realization of abelian schemes up to isogeny satisfies H(A^P)≃H(A)^P canonically. |

| T07 | missing; abelian | §4.1.8 | **Twisted adelic level structure.** For compact K in the commutant of Z, represent P as a GL(V)/Z fiber at ω; the twisted level uses V→V^P via ω^−1 and lands in the level K_ω=ωKω^−1 on A^P. Over a Z_(p)-base use only the away-p Tate module. |

| T08 | missing; shimura | §§4.2.1–4.2.2 | **Shimura subdatum twisted by a rational quotient point.** For G′⊂G and ω∈(G/ZG′)(Q), conjugate G′ by a lift of ω and descend. For Shimura data require the obstruction to vanish in H1(R,K∞), giving (G′_ω,X′_ω) and the analytic map i_ω. |

| T09 | missing; shimura | Lemma4.2.4 | **Center compatibility of the Shimura level.** The adelic level structure of the abelian scheme on a Shimura subdatum commutes with the action of its center. |

| T10 | missing; shimura | Proposition4.2.6 | **Moduli and analytic twisting coincide.** The abelian torsor twist with weak polarization and twisted level factors through the prescribed Shimura subvariety and agrees with i_ω on complex points. Its Betti Hodge tensors are the transported tensors. |

| T11 | missing; shimura | Lemma4.2.9 | **Integral twist frame preserves the p-lattice.** For ω∈Gad(Z_(p))^+ and a lift in G(O_F,(p)), the twist comparison after coefficient extension is an isomorphism up to prime-to-p isogeny. |

| K01 | missing; shimura | §4.3.1 | **Kottwitz triple at a finite level.** For r>0 and k=Fp^r, a triple (γ0,γ^p,δ) has γ0∈G(Q) up to geometric conjugacy, γ^p∈G(Af^p), and δ∈G(Frac W(k)) up to integral σ-conjugacy. Match γ0 stably with γ_ell and N_rδ and require real ellipticity and the global inner-form condition K02. |

| K02 | missing; shimura | §4.3.1(iv) | **Global inner twisting attached to a triple.** For the stabilized centralizer I0 of a sufficiently divisible power of γ0, require an inner twisting I/Q, anisotropic modulo center at R, and inner-compatible identifications with each stabilized local I_ell, including the σ-centralizer at p. |

| K03 | missing; shimura | §4.3.1, author p75 | **Refined Kottwitz triple and its parameter set.** A refinement adds an adelic inner-compatible isomorphism ι:I_Af≃I_p×I_Af^p. Define S(ktilde) from the rational I-action through ι on X_ν(δ)×G(Af^p), with the away-p level tower understood. |

| K04 | missing; shimura | §§4.3.1–4.3.2 | **Equivalence of Kottwitz triples.** First identify finite-level triples along power extensions. The second equivalence relation compares representatives at a common level by adelic conjugacy away from p and rational σ-conjugacy at p; do not conflate it with integral σ-conjugacy of a fixed representative. |

| K05 | missing; shimura | §4.3.4 | **Stabilizer arithmetic group of a refined triple.** Let Gad(Z_(p))^{+,I} be the positive integral adjoint points with trivial image under H1(Q,ZG)→H1(Q,I). Define A(G)^I from this subgroup and G(Af^p). |

| K06 | missing; shimura | Lemma4.3.5 | **Well-defined commuting arithmetic action on triples.** The formula i_h^−1gh preserves X_ν(δ)×G(Af^p), is independent on the rational quotient of all choices, and defines an A(G)^I-action commuting with Frobenius and ZG(Qp). |

| K07 | missing; shimura | §4.3.6 | **Cohomological twist of a triple.** For β∈H1(Q,I) real-trivial and trivial in H1(Qell,G) for ell≠p, choose local trivializations. Set γ_ell^β=g_ell γ_ell g_ell^−1 and δ^β=g0 δ σ(g0)^−1 after enlarging the finite field to solve the p-torsor. Use the inner form I^β. |

| K08 | missing; shimura | Lemma4.3.7 | **Criterion for a twist to preserve a triple.** K^β is equivalent to K iff β has trivial image in H1(Qell,I) for every finite prime, under the real-trivial hypothesis of K07. |

| K09 | missing; shimura | §4.3.9 | **Special Kottwitz triple from a toric datum.** For a toric Shimura subdatum with Serre torus, map the sufficiently divisible Weil Frobenius δ_n through ψ_mu and use the local gerb, with its completion correction, to produce γ0 and δ with N_nδ=γ0. Its image in G is a special triple. |

| K10 | missing; arithmetic | §4.3.10 | **Reciprocity construction of the same toric triple.** Use N(μ):Res_{L/Q}Gm→T, a local uniformizer π and a sufficiently small compact H with T(Q)∩H=1. A power of N(μ)(π^−1) gives γ0′∈T(Q); a Lang correction gives δ′ with the matching norm. |

| K11 | missing; arithmetic | Lemma4.3.11 | **Agreement of toric triple constructions.** For sufficiently divisible common n, γ0=γ0′ and δ,δ′ are σ-conjugate already over Qp^n; hence K09 and K10 yield equivalent triples. |

| H07 | missing; cohom | §4.4.1; Lemma4.4.2 | **Real-trivial reductive cohomology kernel.** For connected reductive H/Q, Sha∞(Q,H) is the kernel of localization to H1(R,H). Identify it with the corresponding abelianized kernel through Hsc→H and retain that canonical abelian group structure. |

| H08 | missing; cohom | Lemma4.4.3 | **Inner-form invariance of the real-trivial kernel.** An inner twisting Q→Q′ induces a canonical isomorphism of Sha∞ kernels; embeddings of Q,Q′ into H conjugate under that twisting induce the same map to Sha∞(Q,H). |

| H09 | missing; cohom | Lemma4.4.5 | **Real compact-adjoint cohomology kernel injectivity.** For connected reductive H′⊂H over R, with H_ad(R) compact and H′ containing the maximal real-split central torus, ker(H1(R,H′)→H1(R,H)) is trivial. |

| H10 | missing; cohom | Borovoi Theorem5.11; Kisin§4.4.7 | **Finite cohomology classes lift through a common torus.** For connected reductive H over a number field and a finite subset of H1(K,H), there is a maximal K-torus whose H1 image contains the subset. |

| K12 | missing; cohom | §§4.4.7–4.4.9 | **Global and everywhere-local obstruction groups.** Sha∞_G(Q,I)=ker(Sha∞(Q,I)≃Sha∞(Q,I0)→Sha∞(Q,G)); Sha_G(Q,I) is its kernel under localization to every finite H1(Qell,I). Retain the inner-twisting comparison and the two different kernels. |

| K13 | missing; shimura | §4.4.6 | **Geometric class yields a refined triple.** The tensor isogeny class I_x has a well-defined triple-equivalence class K(I_x), and a chosen point x gives its natural refinement via the all-prime tensor automorphism identifications. |

| K14 | missing; shimura | §4.4.7 | **Twist of a geometric isogeny class.** For β∈Sha∞_G(Q,I), choose a maximal torus lifting β, a special lift with its T-action, and the torus torsor twist at an admissible rational quotient point; reduce it to define I_x^β. |

| K15 | missing; shimura | Proposition4.4.8 | **Geometric twisting is independent and injective.** I_x^β depends only on β, and β↦I_x^β is injective on Sha∞_G(Q,I). |

| K16 | missing; shimura | Lemma4.4.11 | **Geometric twisting commutes with triples.** K(I_x^β) is equivalent to K(I_x)^β. |

| K17 | missing; shimura | Proposition4.4.13 | **Geometric fiber is an obstruction torsor.** The fiber over K(I_x) of tensor isogeny classes→triple equivalence classes is naturally a Sha_G(Q,I)-torsor. |

| K18 | missing; shimura | Proposition4.4.14 | **Geometric summand stabilizer and parameterization.** A(G)^I is the stabilizer of I_x, and I_x≃S(Ktilde(x)) is Frobenius, ZG(Qp) and A(G)^I-equivariant, taking x to1. |

| K19 | missing; shimura | Proposition4.4.17, first assertion | **Central twist of a geometric parameterization.** For β induced by h∈Gad(Q)^+, the twisted geometric class has the equivariant parameterization I_x^β≃S(Ktilde(x)^β) of Proposition4.4.17, independent of the lift of h. |

| K20 | missing; shimura | Proposition4.4.17, second assertion; footnote24 | **Component formula for a central geometric twist.** If ZG is a torus, the parameterization K19 satisfies c_G(x′)=(h_tilde g_x′^−1)c_G(x). The connected-center condition permits a coefficient splitting field unramified at p. |

| K21 | missing; shimura | §4.5.1 | **Triple attached to an admissible morphism.** When ZG° satisfies the Serre condition, an admissible φ factors through P. For g∈X(φ), use δ_n, a completed correction c and sufficiently close finite-unramified c′ to obtain an integral σ-class δ and a refined triple Ktilde(g). Its triple-equivalence class depends only on φ. |

| K22 | missing; shimura | Lemma4.5.2 | **Gerb-to-triple local parameter bijection.** The map g′↦g^−1 y_phi g′ identifies X(φ) with X_ν(δ)×G(Af^p), bivariantly for I(Af) and Frobenius×G(Af^p). |

| K23 | missing; shimura | Corollary4.5.4 | **Twisted gerb quotient matches a refined triple.** S_tau(φ)≃S(Ktilde(g,tau)), where the adelic refinement is conjugated by tau; the map is Frobenius and away-p Hecke equivariant. |

| K24 | missing; shimura | Lemma4.5.6 | **Cohomological twists remain admissible.** For β∈Sha∞_G(Q,I_phi), φ^β is admissible, its conjugacy class depends injectively on β, and K(φ^β) is equivalent to K(φ)^β. |

| K25 | missing; shimura | Proposition4.5.7 | **Admissible-morphism fiber is an obstruction torsor.** A nonempty fiber of admissible morphism conjugacy classes→triple equivalence classes is naturally a Sha_G(Q,I)-torsor. |

| K26 | missing; shimura | Lemma4.5.9 | **Gerb summand stabilizer and full equivariance.** A(G)^I stabilizes S_tau(φ) inside S_tau(G,φ0), and K23 is also ZG(Qp) and A(G)^I-equivariant. |

| K27 | missing; shimura | Proposition4.5.11 | **Central gerb twist and component formula.** For h∈Gad(Q)^+ and β its central cocycle, S_tau(φ^β)≃S(Ktilde(g,tau)^β) via g′↦h_tilde g^−1y_phi g′, equivariantly; its component is h_tilde g^−1g′ times c_G(g). |

| M01 | missing; shimura | §4.6.1 | **Geometric and gerb special data give the same triple.** For a toric Shimura datum, the class of its special reduction and the corresponding special gerb morphism have the same Kottwitz triple equivalence class. |

| M02 | missing; bg | Lemma4.6.4 | **Sigma-centralizer surjects onto invariant fundamental classes.** For b∈G(L) with G unramified, J_b(Qp)→π1(G)^Γ is surjective. |

| M03 | missing; shimura | Proposition4.6.2 | **Match an adjoint orbit of geometric and gerb classes.** For Hodge type with connected torus center, the union I^0=∪_{h∈Gad(Q)^+}I^[h] admits a Frobenius, center and A(G)-equivariant bijection to S_tau(G,φ0) for some tau, commuting with c_G and θ_G and matching each central twist summand. |

| M04 | missing; shimura | Corollary4.6.5 | **Refined Hodge-type point classification.** Under the §4.6 Hodge-type and connected-center hypotheses, the special-fiber tower is the disjoint union of S_tau(phi0)(G,φ0), equivariantly for Frobenius, center and A(G), and compatibly with its connected-component map. |

| M05 | missing; shimura | Lemma4.6.6(1)–(2) | **Maximal Hodge-derived cover of an abelian-type datum.** For an adjoint abelian-type Shimura datum (H,Y), Hsharp→H is the central isogeny through which the derived group of every Hodge-type lift is a quotient. It has a Hodge-type realization with derived group Hsharp and torus center. |

| M06 | missing; shimura | Lemma4.6.6(3) | **Unramified Hodge cover with the same local reflex field.** If H is quasi-split and unramified at p, choose M05 quasi-split unramified at p with E(G,X)_p=E(H,Y)_p and center a torus. |

| M07 | missing; shimura | Theorem4.6.7; Theorem0.3 | **Twisted Langlands–Rapoport theorem for abelian type.** Let p>2 and (G2,X2) be of abelian type with hyperspecial K2,p. Its tower admits an integral canonical model over the local reflex integers, and its geometric special-fiber points are in bijection with the disjoint union over admissible φ of S_tau(phi0)(φ). The bijection is equivariant for geometric Φ_r2, ZG2(Qp) and A(G2); tau∈I_phi^ad(Af) depends only on the adjoint class φ0. |

| M08 | missing; shimura | Conjectures3.3.7,3.7.8; Remark3.7.10 | **Untwisted and refined Langlands–Rapoport statements.** Record Conjectures3.3.7 and3.7.8 as predicates asserting the untwisted equivariant bijection and the refined component-compatible diagram. This paper proves M07 with tau, and does not supply a proof field for either general untwisted predicate. |

| E01 | missing; display | Errata E.1, author p96 | **Frobenius-stability condition for the connection iteration.** Kisin2010 Lemma1.5.2 requires Lie(H) stable under h↦φhφ^−1; with that condition the iterated series remains Lie(H)-valued. |

| E02 | missing; display | Errata E.1 | **Correct Lie algebra of the universal connection.** The construction of Kisin2010 §1.5.4 has connection coefficients in Lie(G), not in general Lie(U_G°); the original1.5.3 is deleted. |

| E03 | missing; display | Errata E.2–E.3 | **Horizontal tensor locus over the rational completion.** Complete R[1/p] and R_G[1/p] at the deformation origin, parallel-transport s_alpha to σ_alpha, and define A′_G as the largest closed formal subspace on which every σ_alpha lies in Fil0. |

| E04 | missing; display | Errata Lemma E.3 | **Horizontal Fil0 locus is the adapted completion.** A′_G=A_G in E03; the tangent calculation uses the Frobenius-compatible dual-number maps and regularity of A_G. |

| E05 | missing; display | Errata E.4 | **Corrected adapted-factorization proof.** The proof of Kisin2010 Proposition1.5.8 is repaired by Frobenius-invariance implying horizontality, Fil0 of the lifted tensors, and E04; Proposition1.5.8 and Corollary1.5.11 retain their statements. |

| E06 | missing; shimura | Errata Lemma E.6, author p97 | **Finite-index central control of the descent kernel.** For Δ(G,G2)=ker(A(G)→A(G2)), its intersection with the indicated quotient of ZG(Af^p) has finite index; the analogous derived-central intersection has finite index in Δ°. The kernel itself need not be finite. |

| E07 | missing; shimura | Errata E.5–E.7 | **Integral descent through finite actions at suitable levels.** Using E06, Δ° acts through a finite quotient at sufficiently small finite away-p levels. Form the inverse-level quotient to construct the abelian-type integral model and verify its extension property through the levels away from an additional prime. |

| L19 | library; baseline | Pinned Mathlib/GroupTheory/GroupExtension/Defs.lean | **Abstract group extension.** An abstract extension of groups has injective kernel map, surjective quotient map, and range equal to kernel. This is only the algebraic carrier of a Galois gerb. |

| L20 | library; baseline | Pinned Mathlib/CategoryTheory/Comma/Basic.lean | **Ordinary comma-category carrier.** For functors L:A→T and R:B→T, Comma L R has objects a,b and a morphism L(a)→R(b); comparison is not required invertible. |

| L21 | library; baseline | Pinned Mathlib/CategoryTheory/Monoidal/Category.lean | **Monoidal-category carrier.** A monoidal category has tensor, unit, associator, unitors and coherence laws. The pinned general carrier does not impose strictness, invertibility of every arrow or the Picard commutativity data. |

| L22 | library; baseline | Pinned Hilbert90.lean:107 | **Finite field-extension Hilbert 90.** For fields K⊂L with [FiniteDimensional K L], H1 of the representation of Aut_K(L) on L× has a unique element. This is the finite algebra-automorphism/unit-module theorem; profinite nonabelian GLn and arbitrary tori need separate adapters. |

### API and example design

Each construction exports a constructor, a usable characterization and a transport/functoriality statement. Its uses name its located source and consuming items. The API is a plan for future declarations; the examples are specified tests, not existing Lean theorems. The constructors deliberately retain comparison witnesses, actions, levels, filtrations and local compatibility data that a plausible oversimplified definition would forget.

The most consequential examples are the nonabelian crossed-module H0 with abelian cokernel, PGL2 torsion, the rank-one Tate dual twist, the Gm nonintegral specialized frame, ordered Frobenius norms, conjugated compact levels and finite actions by an infinite group. Degenerate and invalid-input examples accompany the ordinary examples for all constructions. Nine exact finite/arithmetic diagnostics were also run independently to check these traps; they do not verify the general source theorems.

### Unfinished closure and continuation

All main-paper pages have been read, but a full source read is not a proof-closure certificate. Some entries summarize multi-part results or several steps of a long argument. The next worker should preserve the stable IDs, split those entries with explicit child dependencies, and acquire the original cited proofs in the following order.

- **Q-comparison — Integral period comparison.** Read the original Kisin2006/Kisin2010, Faltings, Fontaine, Wintenberger and relative comparison proofs; split tensor integrality, étale descent and finite-field connectedness hypotheses.

- **Q-display — Corrected deformations and connections.** Read Kisin2010 with E.1–E.4, Breuil/de Jong/Zink inputs; prove each connection convergence, horizontality and tangent-space lemma with its actual Lie algebra.

- **Q-adlv — Frame components and Hodge–Newton reduction.** Read full Wintenberger and CKV2015 proofs and compare frame π0 with the geometric component carrier; retain minuscule, adjoint-simple and exceptional-case assumptions.

- **Q-ckv-correction — Corrigendum root cases.** All CKV2017 corrigendum pages were read. Its final D4/E6 verification is omitted in print and must be supplied, along with original root-orbit definitions and the exact corrected sign.

- **Q-stacks — Gerb/category descent.** Close algebraic Isom representability, continuous pro-gerb conjugators, strict/Picard adapters and the pullback-extension argument using original descent sources.

- **Q-cohom — Original nonabelian cohomology proofs.** Borovoi author PDF15–21 and39–41 read. Read the cited original quasi-isomorphism theorem, Kneser–Harder–Chernousov, real compact-group and global abelianization proofs. The nonab.pdf source is downloaded but unread. Abelian cokernel alone is insufficient.

- **Q-gerb — Arithmetic and admissible gerbs.** Read the original Langlands–Rapoport Satz5.3, Reimann and Milne constructions and recursive references. Prove norm-power inverse systems, almost-all integral sections, specialness and finite-level approximations.

- **Q-shimura — Hodge cycles and integral tensor branches.** Read original Deligne/Blasius/Kisin2010 comparison and normalization arguments. Prior KP18/KPZ26 candidates identify owners but do not discharge their proofs.

- **Q-isogeny — Integral family propagation.** Split1.4.6/1.4.9 and1.4.4 into the connection, crystal, abelian quotient, formal-branch and component-propagation declarations; close cited de Jong/Grothendieck–Messing inputs.

- **Q-global — Global tori and CM lifting.** Read Borel–Tits and finite adelic class-set arguments, special-torus existence, Shimura–Taniyama reciprocity and endomorphism lifting with original assumptions.

- **Q-source-conventions — Contravariant inverse dictionary.** Reconcile the μ_T notation of Corollary2.2.5 with Lemma2.2.2 and Proposition1.1.19; compare the published version before asserting an editorial correction. Keep dual and p-Frobenius signs explicit.

- **Q-components — Topological components and infinite kernels.** Close strong approximation, closures, compact inverse limits, canonical component identifications and E.5–E.7 finite-level descent. Do not claim the kernel itself finite.

- **Q-main — Matching and abelian-type cover.** Split4.6.2–4.6.7, the two obstruction torsor fibers, Hodge-derived cover and same-reflex-field construction. Preserve tau and center hypotheses; close original Deligne cover/classification inputs.

- **Q-granularity — Declaration-sized recursive closure.** This is a full-main-paper checkpoint. Several multi-part lemmas and long proofs still bundle more than one declaration; split them and their cited facts to PROTOCOL §§3–4 density before status complete.

The original-source acquisition list follows. Sources already represented elsewhere in the atlas are linked as imports or continuation evidence; a citation does not itself establish coverage.

- **Kisin, Crystalline representations and F-crystals (2006); Integral models of Shimura varieties of abelian type (2010).** Integral comparison and corrected deformation/model foundations;2010 must be read with the present E.1–E.7. Reference: Kisin17 bibliography, Kisin crystalline-representation and integral-model entries.

- **Chen–Kisin–Viehmann, Connected components of affine Deligne–Lusztig varieties in mixed characteristic (2015), and corrigendum (2017).** Original2015 component proof remains unread here; all6 corrigendum PDF pages read, with omitted root cases still open. Reference: https://doi.org/10.1112/S0010437X1600782X.

- **Wintenberger, Existence de F-cristaux avec structures supplémentaires; Un scindage de la filtration de Hodge.** Nonemptiness and integral tensor-frame inputs need exact original hypotheses. Reference: Kisin17 bibliography, Wintenberger entries.

- **Borovoi, Abelian Galois cohomology of reductive groups (1998).** Read authorPDF15–21,39–41; close recursive nonabelian and arithmetic H1 proofs. Reference: https://doi.org/10.1090/memo/0626.

- **Borovoi, Abelianization of the second nonabelian Galois cohomology.** Downloaded20 pages, unread; cited by the quasi-isomorphism discussion. Reference: https://www.math.tau.ac.il/~borovoi/papers/nonab.pdf.

- **Langlands–Rapoport, Shimuravarietäten und Gerben; Reimann, The semi-simple zeta function of quaternionic Shimura varieties.** Gerb existence, local normalizations and specialness Satz5.3 remain original-source obligations. Reference: Kisin17 bibliography [LR],[Re].

- **Milne, canonical models and Langlands–Rapoport references; Kottwitz, Isocrystals with additional structure I/II and Shimura-point references.** Universal quasi-motivic/Weil gerbs, B(G), finite-level norm and point-counting prerequisites. Reference: Kisin17 bibliography, Milne and Kottwitz entries.

- **Deligne, Travaux de Shimura; Variétés de Shimura; absolute Hodge cycles; Blasius comparison.** Special lifts, Hodge cover classification, CM reciprocity and tensor realization inputs. Reference: Kisin17 bibliography, Deligne and Blasius entries and cited Hodge-cycle sources.

- **Borel–Tits; Platonov–Rapinchuk; Kneser–Harder–Chernousov; Serre Galois cohomology.** Finite adelic quotients, rational parabolics, strong approximation and local/global simply connected H1 vanishing. Reference: Kisin17/Borovoi cited original sources.

- **Grothendieck–Messing; de Jong; Faltings; Breuil; Zink.** Relative crystals, p-divisible-group comparison, deformation and horizontality closure. Reference: Kisin17 §1 cited sources.

- **Kisin–Pappas (2018); Kisin–Pappas–Zhou (2026).** Read full published sources in preceding jobs of this session; reuse candidate ownership and later correction links, not completed formal proofs. Reference: https://doi.org/10.1007/s10240-018-0100-0.

### Validation and handoff

Validation checks the paper schema, authorized paths, JSON, stage IDs, exact-once routing of missing items, unique identifiers, the dependency DAG, API/example cardinalities, source hashes, pinned declaration module digests and current input blobs. The nine executable diagnostics check conventions and counterexamples only. No Lean file was written or compiled. Exact check outcomes are recorded in the result and PR.

The deliverables are this report, `PAPER-KISIN-17.result.json`, and `handoff/PAPER-KISIN-17.md`. Only those three files are submitted. Status remains `partial` until the original-source and declaration-sized closure gates are resolved.
