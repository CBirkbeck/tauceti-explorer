# Independent review of StableHomotopyKTheory, revision round 2 (checkpoint)

Job `REV-StableHomotopyKTheory~2`, issue [#7095](https://github.com/CBirkbeck/tauceti-explorer/issues/7095).
Reviewer: Claude (Claude Code, model Opus 5.5), session `claude-qMTtSD`, 8 October 2026. This session wrote
none of `BP-StableHomotopyKTheory` (session `claude-mib2G7`), `REV-StableHomotopyKTheory` (session
`claude-RkTlmB`) or `BP-StableHomotopyKTheory~2` (Codex session `codex-Rodm1k`).

**This is a checkpoint, not a verdict.** The packet's `review` object is still the first review's
(`needs_changes`). The node-by-node check covered 29 of the 213 nodes in full, plus targeted corrections
to 33 others from the library, reader and Lean passes. The rest of the run was lost to an API usage limit
that stopped every checking pass at once. Every correction below was verified before it was applied. The
next round finishes the node check, applies the findings recorded as not applied, and writes the verdict.

## The earlier review's requirement

The first review asked for one thing: regenerate the reader from the corrected packet. That has been done.

- A generator written for this review reproduces the round-2 reader byte for byte from the round-2 packet,
  including its tail sections (coverage, gaps, requests, baseline, source issues, references). All 4,620
  packet strings checked (statements, hypotheses, steps, API, tests, uses, prerequisites, locators,
  matches, gaps, requests, source issues, coverage) appear in the reader. After the corrections below,
  4,685 of 4,685 appear.
- The hand-written prose of the reader (introduction, conventions, layer introductions, section intros)
  had thirteen inaccuracies: acceptance checks that no node contains, gaps left out of layer summaries,
  dropped hypotheses, a space called a map, and process wording. They are corrected in place and listed
  under "Reader corrections" below.

## What was checked in full in this round

- **Sources.** All fifteen public sources were downloaded again from the recorded URLs, and every SHA-256
  in the packet was reproduced.
- **Source issues.** All fifteen (E1–E15) were read at their locators and are confirmed. The reasons are
  given below, in the form the finishing round writes into the review objects. For E2, E4–E7, E10, E11 and
  E13, Weibel's list of corrections to the published K-book was also checked. The link on the author's
  page now returns 404, so the copy read was the Internet Archive's of 29 August 2024 (the file is dated
  17 October 2022); it has no entry for any of these passages. The `searched` fields now say so, in place
  of "not reachable in this run".
- **Library.** All 88 baseline names exist at the pins under their full names. Entries 1–59 were read in
  full against their citing nodes: seventeen `provides` texts lacked hypotheses (universes,
  `[Nonempty N]`, essential smallness, cohomological indexing) and are corrected. Twenty-one declarations
  that nodes use without citing them are added, each read at the pin, and one uncited entry is now cited.
  Entries 60–88 still need their statements read against the citing nodes.
- **Requests.** Every request's `neededBy` now lists exactly the nodes that cite its supplier: 63 consumers
  were missing, and three listed nodes do not cite the supplier. The request to AlgebraicTopology stage 3 is removed: no node cites that
  stage, and excision enters only through the stage-4 cellular homology. Four requests had process wording
  or imprecise needs, now corrected: K.4:construction; T.1:classical, which needs the Type-u forms of its
  Type-0 statements; R02.1; and E5:abstract, which needs the little-cubes operads and stably E_m-monoidal
  categories by name.
- **Own words.** A scan for runs of nine or more words shared with any of the fifteen sources found six
  quotations: Weibel IV p. 28 in an acceptance line, Weibel's ℓ-adic example, the stage text, Carlsson's
  range in a source match, Hatcher's remark in a gap detail, and Carlsson's zero-object sentence in E14. It
  also found six statements or proof steps that followed a source sentence nearly word for word. All are reworded. The remaining shared runs are formulae, such as the relative
  groups π_i(A, A ∩ B) → π_i(C, C ∩ D).
- **Checks.** `python3 scripts/check_blueprint.py` with the pinned declaration index
  (`TAUCETI_BASELINE` set to the workers' baseline): 0 errors, 0 warnings. The node-level prerequisite
  graph of all packets has no cycle. A trial atlas build with this packet succeeds: 213 declarations,
  36 planets, one skipped link (see the questions). The suggested file elaborates with `lean-check` at
  Mathlib 082e2d37e8, exit 0, with no warnings other than `declaration uses sorry` (594).

## Principal corrections

Two statements were false, and both are corrected:

- **H.1/simplicial-covering-realisation.** The clause "equivalently, every simplex has exactly one lift
  through each lift of its 0-th vertex" describes discrete left fibrations, not coverings. For F : [1] → Set
  with F(0) = {a}, F(1) = {b, c} and a ↦ b, the nerve of the category of elements satisfies it, but its
  realisation (an interval plus an isolated point over [0, 1]) is not a covering. The equivalent condition
  is unique lifting through a lift of *any* vertex. The Lean comment repeated the wrong hypothesis and is
  corrected too.
- **H.5:spectra/simplicial-spheres-and-smash, test `sphere_toTop`.** The simplicial model Sⁿ = (S¹)^∧n has
  more cells than one 0-cell and one n-cell: S¹ ∧ S¹ has one, one and two nondegenerate simplices in
  dimensions 0, 1 and 2. The realisation is still Sⁿ.

Further corrections:

- **H.2/functor-homology-spectral-sequence.** The proof relied on Mathlib's spectral objects giving a
  first-quadrant homological spectral sequence with convergence "automatic". At the pin, Mathlib's E₂ data
  cores applied to a filtration spectral object put the classical E¹ at page 2. There is no convergence or
  abutment API, and the spectral object has to be built through `HomotopyCategory.spectralObjectMappingCone`
  and `mapHomologicalFunctor`. The step now says what has to be built and proved.
- **H.2, homotopy fibres.** Several smaller errors are corrected:
  - the degree-0 connecting map was attributed to a Mathlib isomorphism π₁ ≅ π₀(Ω) that does not exist (it
    is Tau Ceti's `zerothHomotopyLoopSpaceEquivFundamentalGroup`);
  - free-homotopy invariance was attributed to a based-homotopy lemma (it is `homotopyGroupTransport_map`);
  - the π₁-action on π₀ of the fibre is a left action for Mathlib's multiplication p * q = q.trans p;
  - the Serre case of the strict-versus-homotopy-fibre comparison now runs through the pair sequences;
  - the boundary identification in the long exact sequence holds up to inversion;
  - the contractible-base step is written with a transport that is continuous in the base point.
- **H.3/plus-universal-cover** cited the bare stage KTheoryLowDegrees:U.1 for E(R) perfect and SL(R)/E(R)
  abelian. It now cites the nodes `U.1/whitehead-lemma` and `U.1/stable-elementary-perfect`, and defines
  SL(R) as the kernel of the determinant.
- **H.4.** The cofinal-sequence comparison now proves that E = [Aut(S), Aut(S)] is perfect from the
  packet's own nodes, so it no longer depends on the Bass gap. The group-completion-acyclic node now
  defines the telescope map it states a theorem about. The cofinality theorem now notes the naturality its
  Whitehead step needs. Mathlib's `HSpace` uses the ordinary product topology, and the H-space nodes now
  say so.
- **H.5:spectra.**
  - The stable homotopy category is a localisation in the sense of `Functor.IsLocalization`. It is not
    Mathlib's `MorphismProperty.Localization`, whose hom-types lie one universe higher.
  - The Eilenberg–Mac Lane functor on chain complexes needs the lax symmetric monoidal Dold–Kan
    normalisation, which Mathlib lacks.
  - The model-category triangulation of Ho(Ch(ℤ)) must agree with Mathlib's derived-category signs; this
    is now part of the Shipley gap.
  - The Postnikov t-structure is pinned in Mathlib's cohomological indexing.
  - Two pairing tests could not fail (the zero spectrum, and degree (0, 0)). They are replaced by the unit
    test `piPairing_sphere_unit` and the ι₁ · ι₁ test `piPairing_iota_iota`.
- **H.6.**
  - Maps of Moore spectra are unique when m *or* m′ is odd.
  - p-completeness is characterised by the vanishing of holim(⋯ →p E), not by restating the definition,
    and closure is stated for products and towers.
  - The finite-type fracture square does not need bounded below.
  - Hidden steps are now explicit: the (p)-adic completion of ℤ, the first stable stems, and the
    lim/lim¹ vanishing for towers with vanishing composites.

## Gaps added

Six missing suppliers found in this round are recorded as packet gaps, each with its consumers:

- the (p)-adic completion of ℤ as ℤ_p;
- relative homotopy groups of coverings (Hatcher Lemma 4.38 uses the relative form of Proposition 4.1);
- the first stable stems;
- flat symmetric spectra and the invariance of smashing with them (Schwede I 5.41–5.54);
- Hurewicz fibrations (the notion is used but defined nowhere);
- relative homotopy lifting for Serre fibrations.

Each should become a node in the next round. The coverage records name them, and the H.3 record now also
names its two older gaps that it had left out.

## Questions for the orchestrator

1. **Register labels.** `scripts/errata.py` lists any finding whose `known` is not exactly "new" under
   "already corrected in print". Atlas-wide, 477 findings use `known` to cross-reference another atlas
   record, which is not a published correction. Here that applies to E3, E4 and E7. The register therefore
   claims printed corrections that do not exist. Changing those packets one at a time would duplicate
   entries among the new mistakes. A separate field for atlas cross-references would fix it.
2. **Declaration index.** The checker's index (`declarations.tsv`, 16 September) lists
   `Topology.CWComplex` as `Topology.CWComplex.` (a class declared with an explicit universe). It also
   omits names generated by `to_additive`, such as `Algebra.GrothendieckAddGroup`. Both exist at the pin.
   This round cites them through indexed neighbours. Regenerating the index would let packets cite them
   directly.
3. **Skipped link.** The trial build skips GeneralAlgebraicKTheory:K.4 → H.5:S-delooping. The live
   `GeneralAlgebraicKTheory--K.1` packet still files `K.4/delooping-and-the-spectrum` under K.4, while its
   research version files it under K.4:construction. Once that version is promoted, the loop through the
   atlas edge H.5:S-delooping → K.4 disappears. The dependency is drawn meanwhile through
   K.4:construction → H.5:S-delooping.
4. The consumer pointers and stage edges in the first review's questions 1–2 still stand.

## Corrections applied in this checkpoint

Each row is one node or packet record, with the changes made to it. Node rows are in packet order; the packet, the reader and the suggested file were regenerated together from the base commit.

| Record | Changes |
| --- | --- |
| `H.1/nerve-and-classifying-space` | api:CategoryTheory.classifyingSpaceMap_universes: The universe constraint is attributed to the wrong type. |
| `H.1/realisation-boundary-inclusion-disk` | proofSteps[2]: The pair homeomorphism (Δⁿ, ∂Δⁿ) ≅ (𝔻ⁿ, ∂𝔻ⁿ) is a named non-routine fact ('radial projection from the barycentre') with no prerequisite. · prerequisites: Steps 2–3 use the colimit presentation of ∂Δ[n] by its faces and the convex-body homeomorphism; |
| `H.1/classifying-space-cw-structure` | prerequisites: the node uses the classical CW structure Topology.CWComplex (statement, proofSteps[2], api), cited through the baseline entry Topology.RelCWComplex.closedCell |
| `H.1/classifying-space-prod` | proofSteps[2]: 'Applied in each variable' also uses the mirror lemma (quotient map in the right factor), which is a separate declaration. |
| `H.1/simplicial-covering-realisation` | statement: (Outside this batch, found while checking the closure of the coverings node.) The 'Equivalently' clause is false: unique lifting through each lift of the 0-th vertex characterises discrete left fibrations (nerves of categories … |
| `H.1/coverings-fundamental-group-local-coefficients` | prerequisites: The node cites the Tau Ceti stage 'UniversalCovers stage 2' (and the packet keeps a request to it) for the category of coverings and the lifting/classification it uses, but at the pin Tau Ceti already has the precise … · proofSteps[2]: Step 3 waves at 'Tau Ceti UniversalCovers stage 2'. · hypotheses[0]: 'BC is locally contractible, hence locally path-connected' is not supplied by the cited declarations. · acceptance[0]: Wrong reference: Weibel 3.3.1 and Ex. |
| `H.1/category-homology` | prerequisites: The API (constIso) relies on Mathlib's simplicial chain complex and homology of a simplicial set, which are not cited. |
| `H.1/cellular-chains-local-coefficients` | Acceptance line: a quotation of Weibel IV p. 28 replaced by a paraphrase. |
| `H.1/groupoid-nerve-kan` | proofSteps[0]: Miscount. A 2-face {a,b,c} of Δ[n] lies in exactly n−2 of the (n−1)-faces, so for n = 4 it may lie in only one face other than the k-th. |
| `H.2/weak-homotopy-equivalence` | proofSteps[1]: Invariance under (free) homotopy and the homotopy-equivalence compatibility are attributed to HomotopyGroup.map_eq_of_homotopicRel, which only covers homotopies relative to a set containing the basepoint (and is not even a … · sources[0].locator: Page 346 contains Theorem 4.5 (Whitehead, for connected CW complexes, isomorphisms on all π_n); · sources[0].match: Match claims the term is used 'in the surrounding text' of p. · prerequisites: The baseline declarations that the corrected proof uses are missing from the prerequisites (and from baseline.declarations). · tests:isWeakHomotopyEquivalence_not_all_basepoints: The hypothesis insists on all basepoints, but no test separates this from the tempting one-basepoint definition (the two-point test only probes π₀). |
| `H.2/homotopy-fibre-and-long-exact-sequence` | statement: Weibel 1.2 defines a homotopy fibration sequence by asking F → F(f) to be a homotopy equivalence; · api:TauCeti.IsHomotopyFiberSequence: The statement defines homotopy fibre sequences for F → B strictly constant at b, while the API predicate takes a chosen null-homotopy of f ∘ i; · acceptance[2]: Process instruction, not a property of this node that tests it (the node no longer contains the long exact sequence). · tests:homotopyFiber_ofFiber_not_weakEquiv: With the path-space model of this node the homotopy fibre of BH → BG is not literally the discrete set G/H; |
| `H.2/fibration-relative-homotopy-iso` | Proof step reworded (near-verbatim run from Hatcher p. 376). · proofSteps[0]: the relative lifting property is a non-routine step with no supplier; recorded as a gap |
| `H.2/fibre-to-homotopy-fibre` | proofSteps[1]: The Serre case is said to follow by comparing 'the long exact sequences of p and of E_p → B (Hatcher Theorem 4.41 and H.2/long-exact-sequence)' with the π₀ end handled by 'the π₁-action of H.2/fibre-sequence-low-degree'. · acceptance[1]: Understated: covering maps are Hurewicz fibrations by the very Mathlib lemma cited, so the first half of the node gives a homotopy equivalence, not only a weak equivalence. · prerequisites: The corrected proof uses the based-pair long exact sequence (AT stage 8) and the homotopy-equivalence invariance of homotopy groups; |
| `H.2/connecting-map` | statement: The degree-0 case is attributed to 'Mathlib's π₁ ≅ π₀(Ω)'. · tests:connecting_basepointChange: Not a precise statement: it does not say which path in the homotopy fibre joins the two basepoints, nor what happens on π_{n+1}(B). · prerequisites: Degree-0 declarations used by the construction are not listed (nor in baseline.declarations). |
| `H.2/long-exact-sequence` | proofSteps[2]: 'Identify the resulting boundary with H.2/connecting-map' holds only up to inversion on π_{n+1}(B, b), depending on the face convention of the AT stage-8 relative groups. · prerequisites: Step 1 transfers π_n(E_f) to π_n(A) along the homotopy equivalence A ≃ E_f (and identifies the projection F → A with the inclusion F ⊂ E_f up to a based homotopy, by truncating paths). |
| `H.2/fibre-sequence-low-degree` | statement: The side of the action is not pinned, and the notation '(a, γ) · ω = (a, γ · ω)' reads as a right action. · proofSteps[0]: Same side issue in the proof step. · proofSteps[1]: 'have path-connected images in A' is not the intended condition (images of points are points); |
| `H.2/homotopy-fibre-transport` | api:TauCeti.homotopyFiber.connecting_transport: Basepoints do not compose literally: (transport f ω)_* lands at (a₀, (Path.refl b).trans ω), but the basepoint-change path t ↦ (σ t, ω\|[t,1]) starts at (a₀, ω); · tests:transport_loopSpace: 'Right concatenation by ω' is right only as an operation on paths; · sources[0].match: Hatcher's proof of Prop. · prerequisites: proofSteps[0] names Mathlib Path.Homotopy (associativity/unitality of concatenation up to homotopy rel endpoints) and continuity of concatenation on path spaces, but no Mathlib baseline reference is listed. · prerequisites: api connecting_transport changes basepoint in π_n(F) for n ≥ 0. |
| `H.2/homotopy-pullback` | tests:isHomotopyCartesian_id: 'The square with two identity maps' does not determine the square (identities could be α and h, or p′ and p); |
| `H.2/homotopy-cartesian-contractible-base` | proofSteps[0]: '{b′} ×ʰ_B E = F(p, h b′)' conflates the two path conventions: in the homotopy pullback {b′} ×ʰ_B E the path runs from h(b′) to p(e), while F(p, h b′) has paths from p(e) to h(b′); |
| `H.2/homotopy-cartesian-pasting` | proofSteps[0]: 'so the comparison maps factor through each other' hides the one non-formal step: the factorisation E″ → B″ ×ʰ_{B′} E′ → B″ ×ʰ_{B′}(B′ ×ʰ_B E) ≃ B″ ×ʰ_B E needs the middle map (homotopy base change of a weak equivalence over … · prerequisites: Both non-trivial ingredients need the comparison of strict and homotopy fibres of a Hurewicz fibration (H.2/fibre-to-homotopy-fibre), which is not listed. |
| `H.2/comma-category-to-homotopy-fibre` | tests:commaToHomotopyFiber_subgroup: With the path-space model the homotopy fibre is not discrete; |
| `H.2/excisive-triad-homotopy-comparison` | Statement reworded in the roadmap's own words (it repeated a sentence of Hatcher Thm 4.23 nearly verbatim); mathematics unchanged. |
| `H.2/simplicial-space-realisation` | proofSteps[1]: SSet.toTop is not defined by a coend. |
| `H.2/functor-homology-spectral-sequence` | proofSteps[2]: This step makes false or incomplete claims about Mathlib. · prerequisites: Library declarations used to build the spectral object are not cited, and the comma categories T/d and T(c_q)\D are used without citing the comma-category declarations. |
| `H.2/quillen-theorem-a` | prerequisites: The dual statement (f/Y) and proof step 3 (C′/fX₀) use costructured arrows, which are not cited. |
| `H.2/prefibred-iff-fibre-adjoint` | prerequisites: The acceptance text cites Mathlib's CategoryTheory.Grothendieck, which is not a prerequisite. |
| `H.3/acyclic-spaces-and-maps` | api:TauCeti.IsAcyclicSpace.of_homotopyEquiv: Invariance under weak homotopy equivalence needs the theorem that weak equivalences induce homology isomorphisms. · prerequisites: Proof step 2 uses Mathlib's computation of singular H₀, which is not a prerequisite. |
| `H.3/abelian-space` | api:TauCeti.IsAbelianSpace: The Lean signature takes the index type N and the basepoint explicitly. |
| `H.3/relative-hurewicz-trivial-action` | proofSteps[1]: Hatcher Lemma 4.38 uses the relative form of Prop. 4.1, which no library or stage supplies; recorded as a gap |
| `H.3/abelian-extension-corollary` | Statement reworded (near-verbatim run from Hatcher Cor. 4.73); content unchanged. |
| `H.3/plus-pi2-universal-central-extension` | hypotheses[0]: Process reference '(RT-AREA-ktheory-1/30)' inside a mathematical hypothesis. |
| `H.3/plus-universal-cover` | statement: The SL(R) application uses the stable special linear group SL(R) = colim SL_n(R) and E(R) ⊆ SL(R) for commutative R; · prerequisites: the bare stage KTheoryLowDegrees:U.1 is replaced by its nodes whitehead-lemma and stable-elementary-perfect, which supply what the SL(R) application uses |
| `H.4/symmetric-monoidal-groupoid-core` | prerequisites: The API names several Mathlib declarations that are not prerequisites: WideSubcategory with MorphismProperty.IsStableUnderBraiding, Functor.core/coreComp, Skeleton.instCommMonoid and Skeleton.monoidHom. |
| `H.4/classifying-space-hspace` | hypotheses[0]: Mathlib's HSpace X requires hmul : C(X × X, X) on the ordinary product topology. |
| `H.4/S-inverse-S-pi0` | statement: The comparison with Tau Ceti's SplitK0 needs the category to be essentially small. |
| `H.4/group-completion` | Opening of the definition reworded (near-verbatim run from Weibel IV Definition 4.4); content unchanged. · hypotheses[0]: Requiring Mathlib HSpace excludes BS for uncountable S (for example iso P(R) with R uncountable), yet the acceptance cites BS → B(S⁻¹S) in general. |
| `H.4/group-completion-acyclic` | hypotheses[0]: The node states a theorem about 'the map B Aut(S) → Y_S from the mapping telescope', but no node constructs this map for a general S before this node. |
| `H.4/cofinal-sequence-plus-comparison` | hypotheses[1]: This is a process remark ('not read') about a conclusion, not a hypothesis, and normality of a commutator subgroup is automatic. · proofSteps[1]: The identification of the kernel of π₁ of the telescope map with E, and K₁(S) = Aut(S)/E, need π₁(Y_S) to be abelian, i.e. |
| `H.4/cofinality-theorem` | proofSteps[1]: Whitehead's theorem for H-spaces needs the specific map Y_S → Y_T to induce the homology isomorphism. |
| `H.4/cofinality-projective-modules` | statement: F(R) → iso P(R) is called an inclusion, but it is injective on isomorphism classes only under IBN, as the node's own proofSteps[1] and H.4/based-free-module-groupoid say. · proofSteps[2]: Stale part label: H.4/cofinality-theorem now contains only Weibel's part (b), and part (a) is H.4/cofinality-action. · acceptance[0]: This test is not concrete ('a ring with nontrivial projective modules'). |
| `H.4/segal-gamma-space-delooping` | Source match: quotation replaced by a paraphrase. |
| `H.5:spectra/simplicial-spheres-and-smash` | tests:sphere_toTop: False cell count for n ≥ 2. |
| `H.5:spectra/stable-model-structure` | statement: Mathlib's ModelCategory provides only the existence of factorisations, not functorial ones. |
| `H.5:spectra/stable-homotopy-category` | statement: SHC is built with its own hom-sets [X, ωY] and shown to be a localisation, as the API's Functor.IsLocalization says. · prerequisites: Functor.IsLocalization is used in the API and in proof step 1 but is not cited. |
| `H.5:spectra/twist-sign` | acceptance[0]: Acceptance uses letters p, q that the node never introduces (the statement is in m, n). · acceptance[1]: Same undefined letter p. · prerequisites: The proof uses sphere representability SHC(S^n, X) ≅ π_n X (Example 1.15) and that Σ is an equivalence of SHC with the suspension isomorphism π_n X ≅ π_{1+n}(S¹ ∧ X) (to see β_n is invertible); |
| `H.5:spectra/homotopy-group-pairing` | sources[0].match: The match still refers to the connectivity statement that moved to smash-connectivity, and does not mention the definition (4.13) that the node constructs. · tests:piPairing_zero_spectrum: Vacuous: π_{p+q}(X ∧ᴸ *) = 0 for every definition, so the test cannot fail. · tests:piPairing_HA_HB: With α_{0,0} = id the test restates the definition in degrees (0,0); · api:TauCeti.SymmSpectrum.piPairing_derived_eq_pointset: Missing compatibility with the point-set pairing of true-homotopy-pairing (Schwede I Thm. · test piPairing_zero_spectrum (vacuous: X ∧ᴸ * is zero for any definition) replaced by the unit test, renamed piPairing_sphere_unit · test piPairing_HA_HB (a restatement of the definition in degrees (0,0)) replaced by the ι₁ · ι₁ test, renamed piPairing_iota_iota |
| `H.5:spectra/smash-connectivity` | Statement reworded (near-verbatim run from Schwede II Prop. 5.22); content unchanged. |
| `H.5:spectra/eilenberg-maclane-of-chain-complex` | proofSteps[0]: Applying Mathlib's Dold–Kan equivalence levelwise is not enough. |
| `H.5:spectra/eilenberg-maclane-of-chain-complex-homotopy` | proofSteps[0]: The cited supplier does not supply the sign comparison the step needs. |
| `H.5:spectra/postnikov-sections` | proofSteps[2]: The node's homological indexing (τ_{≥n}, connective/coconnective) has to be translated into Mathlib's cohomological le/ge, and the translation is not pinned. · acceptance: KU and ku are built in RefinedTraceMethods:RT.4:topological, as the node's uses entry says; StableHomotopyKTheory:KU-spectra is only a readiness checkpoint |
| `H.6/moore-spectrum` | statement: The indeterminacy Ext(ℤ/m, ℤ/m′ ⊗ ℤ/2) = ℤ/gcd(2, m, m′) vanishes as soon as m OR m′ is odd; · sources[0].locator: Definition 6.33 is only the homological definition of a Moore spectrum; · hypotheses[0]: The packet's spectra are symmetric spectra of simplicial sets; |
| `H.6/nonzero-lim-one-example` | Acceptance line: quotation of the stage text replaced by a paraphrase. · prerequisites: proofSteps[0] names Mathlib PadicInt.lift and PadicInt.toZModPow, which are neither prerequisites nor in the cited PadicInt module. |
| `H.6/l-adic-completion-milnor-sequence` | Acceptance line: quotation replaced by a paraphrase. |
| `H.6/completion-finite-type` | proofSteps[0]: The Mathlib equivalence needs M in the universe of ℤ (Type 0). · proofSteps[0]: the identification AdicCompletion (p) ℤ ≃ ℤ_p is not a routine step and has no supplier; recorded as a gap |
| `H.6/p-complete-criteria` | prerequisites: proofSteps[1] concludes holim(⋯ →p E) = 0 from the Milnor sequence 'since the tower of homotopy groups is pro-zero', i.e. · statement: The first 'iff' is the definition restated: E^∧_p is by definition F(S/p^∞, ΣE) with the canonical map (H.6/p-completion), so 'E → E^∧_p is an isomorphism iff E → F(S/p^∞, ΣE) is an isomorphism' has no content. · statement: '(c) ... homotopy limits of p-complete spectra' is broader than what is defined or proved: the packet has only homotopy limits of towers (H.6/homotopy-limit-of-tower), and the proof step treats products and towers only. · sources[0].match: The match says only (a) is packet-authored, but Schwede states none of the criteria: the holim criterion and (a)–(d) are all derived by the packet. · prerequisites: Named facts used in the statement and proof are not direct prerequisites: the homotopy limit of a tower (statement, steps 1 and 3) is H.6/homotopy-limit-of-tower; |
| `H.6/arithmetic-fracture-square` | statement: The finite-type corollary assumes 'bounded-below' although H.6/completion-finite-type (and Schwede Remark 9.12) need only finitely generated homotopy groups; |
| `H.6/burklund-quotient-tower` | Statement reworded (near-verbatim run from Burklund Thm 1.5); content unchanged. |
| `coverage` | remaining lists of H.2, H.3, H.5:spectra and H.6 name the gaps recorded by this review and the two H.3 gaps they omitted |
| gap:Spectral sequence comparison theorem: base and total space imply fibre | Detail: quotation of SSAT p. 1.12 replaced by a paraphrase. |
| request:GeneralAlgebraicKTheory:K.4:construction | requests[0].need: Process references in the need ('RS-33; |
| request:ArithmeticGaloisDuality:R02.1 | requests[4].need: The item 'invariance of lim and lim¹ under pro-isomorphism of towers and their vanishing on pro-zero towers (requested by KTheoryFiniteLocalFields; · neededBy now lists exactly the nodes that cite the supplier (3 → 4) |
| request:EnhancedDerivedSheaves:E0 | requests[5].need: The need ends by pointing to 'the comparison itself is EnhancedDerivedSheaves:E5:spectra-comparison', but that stage (data/atlas.json) runs after StableHomotopyKTheory H.5 and compares concrete spectra with E5:abstract; |
| request:EnhancedDerivedSheaves:E5:abstract | requests[6].need: Imprecise. The Burklund nodes need (i) the little-cubes ∞-operads E_n and E_n-algebras (Lurie HA §5.1), (ii) stably E_m-monoidal stable ∞-categories (tensor exact in each variable), (iii) E∞-algebras. · neededBy now lists exactly the nodes that cite the supplier (1 → 2) |
| request:K2SymbolsBrauer:T.1:classical | requests[3].need: The universe requirement is the only part of the need not already supplied, and it is stated vaguely. |
| baseline:mathlib:AddSubgroup.torsionBy | baseline.provides: The group must be commutative and the index is an integer; |
| baseline:mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian | baseline.provides: Two things are missing: R and M must lie in the same universe, and the equivalence is linear over AdicCompletion I R. |
| baseline:mathlib:AlgebraicTopology.singularHomologyFunctor | baseline.provides: The provides text omits the preadditivity and coproduct hypotheses and the universe link between the spaces and the coproducts. |
| baseline:mathlib:CategoryTheory.Abelian.SpectralObject | baseline.provides: Three corrections. The structure is cohomologically indexed. |
| baseline:mathlib:CategoryTheory.MorphismProperty.Localization | baseline.provides: The provides text omits the universe behaviour. |
| baseline:mathlib:CategoryTheory.Pretriangulated | baseline.provides: In Mathlib's labelling TR4 is the octahedron (IsTriangulated), so 'TR1–TR4 minus the octahedron' is confused. |
| baseline:mathlib:CategoryTheory.Triangulated.SpectralObject.mapHomologicalFunctor | baseline.provides: The provides text omits the ShiftSequence hypothesis and the cohomological indexing of the result, which fixes the degree conventions. |
| baseline:mathlib:CategoryTheory.Triangulated.TStructure | baseline.provides: The provides text does not say that Mathlib's t-structures are cohomologically indexed, or that they are a type rather than a class. |
| baseline:mathlib:CategoryTheory.nerve | baseline.provides: The provides text does not give the universe the nerve lands in. |
| baseline:mathlib:CategoryTheory.nerveFunctor | baseline.provides: Universes are missing. |
| baseline:mathlib:CategoryTheory.nerveMap | baseline.provides: nerveMap applies only when source and target have the same object universe and the same morphism universe. |
| baseline:mathlib:DerivedCategory | baseline.provides: The provides text omits the required choice of a localisation with morphisms in a chosen universe, and does not mention the ℤ-indexed cochain convention or the triangulated structure the nodes use. |
| baseline:tauceti:HomotopyGroup.mapHom | baseline.provides: Omits the positive-dimension hypothesis. |
| baseline:tauceti:TauCeti.SplitK0.grothendieckAddGroupEquiv | baseline.provides: Omits the EssentiallySmall hypothesis and the actual requirements: zero morphisms, a zero object and binary biproducts, not additivity. |
| baseline:tauceti:TauCeti.fundamentalGroupMulAut | baseline.provides: Omits the hypotheses: N finite, nonempty (positive dimension) and with decidable equality. |
| baseline:tauceti:TauCeti.homotopyGroupMulEquivOfPath | baseline.provides: Omits the hypotheses: N finite, nonempty and with decidable equality. |
| baseline:tauceti:TauCeti.IsEilenbergMacLaneSpaceOne | baseline.provides: Homotopy invariance is not in the cited module. |
| request:stage-3 | request removed: no node cites AlgebraicTopology stage 3; H.3/plus-integral-homology uses relative cellular chains (stage 4) |
| gap:Bass commutator lemma for Aut(S) | H.4/cofinal-sequence-plus-comparison no longer needs it (E = P from acyclicity and the abelian π₁ of the H-space B(S⁻¹S)) |
| gap:p-adic integers as the (p)-adic completion of ℤ | gap added by this review |
| gap:Relative homotopy groups of coverings | gap added by this review |
| gap:First stable stems | gap added by this review |
| gap:Flat symmetric spectra and invariance of smashing | gap added by this review |
| gap:Hurewicz fibrations | gap added by this review |
| gap:Relative homotopy lifting for Serre fibrations | gap added by this review |
| request:KTheoryLowDegrees:U.1 | neededBy now lists exactly the nodes that cite the supplier (2 → 3) |
| request:KTheoryLowDegrees:Z.1 | neededBy now lists exactly the nodes that cite the supplier (1 → 2) |
| request:tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology | neededBy now lists exactly the nodes that cite the supplier (3 → 6) |
| request:tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations | neededBy now lists exactly the nodes that cite the supplier (5 → 23) |
| request:tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent | neededBy now lists exactly the nodes that cite the supplier (3 → 13) |
| request:tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality | neededBy now lists exactly the nodes that cite the supplier (2 → 5) |
| request:tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead | neededBy now lists exactly the nodes that cite the supplier (6 → 24) |
| request:tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence | neededBy now lists exactly the nodes that cite the supplier (2 → 6) |

## Reader corrections

Hand-written prose of the reader, corrected in place (the generated node sections and tail follow the packet).

- Process note in the opening of the mathematical document (packet status, planning pass, declaration budget). The preceding sentences already state that all coverage records are planned and none asserts closure.
- X⁺_P is a space, not a map; the acyclic map is the inclusion X → X⁺_P (H.3/plus-construction-predicate: 'a map f : X → Y is a plus construction relative to P if f is acyclic and P is the kernel').
- Claims an acceptance check that the packet does not contain. H.1/bar-complex-comparison has no tests and its acceptance is only H₁(BG; ℤ) ≅ G/[G,G] and the homology of ℤ/n; no node or test anywhere in the packet uses a noncommutative group to check the entrywise inverse (packet-wide search for …
- 'Quillen B over a contractible base' is not an acceptance item of any H.2 node. Theorem B's acceptance items are the fibred functor EA → QA (Theorem B fails unless A ≅ 0) versus S⁻¹EA → QA, the basepoint and pointed-set end of the sequence, and the consumers' obligation to check the transition …
- The list of H.2 proof imports omits Thomason's homotopy colimit theorem (gap 8, needed by H.2/thomason-homotopy-colimit-theorem), which the coverage record for H.2 lists.
- The gap sentence lists only two H.3 gaps, while H.3 carries six: gap 9 (Serre spectral sequence with twisted total-space coefficients, for H.3/acyclic-map-homology-criterion), gap 10 (acyclicity of the cell-attachment plus construction, for H.3/plus-is-acyclic), gap 25 (base-and-total case of the …
- 'the fibre of an H-map' names no H.3 node. The H-space results of H.3 are H.3/hspace-is-abelian, H.3/hspace-homology-whitehead (whose statement says f need not be an H-map) and H.3/plus-hspace-recognition; no node concerns fibres of H-maps.
- 'the distinction between trivial π₁-action and centrality in a fibration' is not an acceptance item of any H.3 node (the closest, H.3/principal-fibration-criterion, uses that a central extension gives a trivial action; it does not test a distinction). The acceptance items that the H.3 nodes do …
- Hypotheses dropped: H.3/rational-hurewicz-hspace assumes CW homotopy type and H_n(X; ℚ) finite-dimensional for each n; the introduction states the comparison for all connected H-spaces.
- The definitions do not use local coefficients: an acyclic space has vanishing reduced integral homology and an acyclic map has an acyclic homotopy fibre; local coefficients enter through the criterion theorem H.3/acyclic-map-homology-criterion.
- The hermitian application H.4/hermitian-group-completion-integers covers four cases: symmetric forms (orthogonal groups), symplectic forms, quadratic forms (π₀ = ℤ ⊕ ℤ generated by H and E₈) and (−1)-quadratic forms (rank and Arf invariant). The introduction omits the quadratic case.
- Incomplete list of H.4 proof imports: gap 19 (Bass commutator lemma for Aut(S), H.4/cofinal-sequence-plus-comparison), gap 20 (K^top(ℝ) ≃ ko, H.4/simplicial-ring-topological-realisation) and gap 1 (compactly generated products, H.4/classifying-space-hspace) are also H.4 gaps and are listed in the …
- The list of H.5:spectra proof imports omits gap 17 (Patel's Picard groupoids versus 1-truncated spectra, needed by H.5:spectra/picard-one-truncated-spectra), which the H.5:spectra coverage record lists.
- Overclaim: 21 of the 35 gap entries state no action to close them (gaps 2, 5, 8, 9, 11, 12, 14, 15, 17, 18, 20–23, 25, 26, 28, 31, 32, 34, 35 only record what is quoted and not read).
- Process wording in the framing paragraph ('inherited findings', 'retain their independent-review dispositions', 'in our own words'), which describes the work rather than the issues.
- The introduction now lists the AlgebraicTopology stages actually cited (1, 2, 4–6 and 8) and mentions Tau Ceti's category of covering spaces with its monodromy functor.

## Findings recorded but not applied

These need new nodes, splits or API and Lean work. The next round applies them (with `addedBy` for new nodes); where a supplier is missing, a packet gap now records it.

| Finding | Node | What is needed |
| --- | --- | --- |
| H2a#9 | `H.2/mapping-path-space-fibration` | split of the mapping-path-space node into fibration and deformation-retraction declarations. Bundles two independent declarations that Hatcher proves separately: Prop. 4.64 (p : E_f → B is a fibration) and the deformation retraction of E_f onto A stated in the paragraph after it (so A → E_f is a homotopy equivalence over B). Consumers use them separately (fibre-to-homotopy-fibre and the … |
| H2a#10 | `H.2/fibration-relative-homotopy-iso` | relative homotopy lifting needs its own lemma node; recorded as a gap and in proofSteps[0]. The step hides a non-routine geometric lemma with no supplier: the homeomorphism of pairs (D^k × I, D^k × 0) ≅ (D^k × I, D^k × 0 ∪ ∂D^k × I), transported to cubes (the relative groups and Mathlib's GenLoop are cubical, while the AT stage-5 carrier is defined by lifting for discs, so a homeomorphism … |
| H2a#14 | `H.2/fibre-to-homotopy-fibre` | definition node for Hurewicz fibrations; recorded as a gap. The notion 'Hurewicz fibration' (homotopy lifting for every space) is a hypothesis here and the conclusion of H.2/mapping-path-space-fibration, but no node defines it and AT stage 5 plans only the Serre (disc-lifting) carrier; neither library has it. A definition node is needed (predicate, the … |
| BASE#10 | `H.1/filtered-colimits-of-categories` | promote API items of H.1/classifying-space-cw-structure to lemma nodes. The step cites API items (SSet.toTop_isCompact_subset_finite_subcomplex, SSet.toTop_map_isClosedEmbedding_of_mono) of H.1/classifying-space-cw-structure as the facts it uses; PROTOCOL §4 asks that an API item another node needs be promoted to its own lemma node and cited by id. (These are also the … |
| H4b#7 | `H.4/cofinality-projective-modules` | planet name on Corollary 4.11.1 (cosmetic). The planet named 'Cofinality theorem' sits on Weibel's Corollary 4.11.1, not on the theorem node H.4/cofinality-theorem. |
| H6b#0 | `H.6/p-complete-criteria` | split H.6/p-complete-criteria into five lemma nodes. At lemma level the node bundles five separate declarations: the holim criterion and (a), (b), (c), (d). Each has its own proof (Milnor sequence; UCT exponent bound; closure of the kernel of F(S[1/p], −); detection mod p through the octahedral axiom), and no source proves them together (Schwede … |
| H6b#5 | `H.6/rationalisation` | rationalisation as S_Q smash E with functoriality and universal property (needs API and Lean changes). The statement asserts that rationalisation is an exact functor, but the constructor is a sequential homotopy colimit in SHC, which is functorial only up to non-unique choice (H.5:spectra/sequential-homotopy-colimit gives no functoriality), and the API has no functoriality item, no naturality of E → … |
| H1a#1 | `H.1/nerve-and-classifying-space` | compatibility API item with Tau Ceti orderComplex realisation. No compatibility item with the Tau Ceti notion that B of a poset refines. Quillen p. 89 identifies BJ, for a partial order J, with the simplicial complex of finite chains in the weak topology; Tau Ceti f790474 has exactly this object (orderComplex and its Realization with the weak topology). The … |
| H1a#4 | `H.1/realisation-boundary-inclusion-disk` | move the CW-structure construction out of the boundary lemma into an API item or node. The second sentence bundles a separate construction (the categorical CW structure TopCat.CWComplex (SSet.toTop.obj X) with cells ≃ X.N) into this lemma. It is a different declaration, it is what H.1/classifying-space-cw-structure step 2 consumes, and it is not routine Lean plumbing: Mathlib has … |
| H5b#2 | `H.5:spectra/derived-smash-product` | split exactness of the derived smash product into its own node. Granularity: one node bundles three separately proved results — invariance of smashing with flat spectra (Schwede I Props. 5.50/5.54), the construction of the closed symmetric monoidal ∧ᴸ with the lax monoidal γ (II Thm. 3.1), and exactness of ∧ᴸ in each variable (II Prop. 3.19, (3.20)). At lemma … |
| LEAN1#8 | `H.1/filtered-colimit-homology` | Generalise the Lean form of `classifyingSpace_homology_filtered_colimit` from ℤ to an arbitrary coefficient module A, as the node states. |
| READER#2 | `reader` | The ownership section could list, layer by layer, which external stages each layer uses (compute it from the prerequisites after the next round). |

## Source issues: verdicts of this round

All fifteen were read at their locators and are confirmed. The packet keeps the first review's verdict objects for now, because a verdict counts in the register only once its review job has finished; the round that finishes this review writes the verdicts below into each `review` object (by `REV-StableHomotopyKTheory~2`).

- **E1**: confirmed. Checked on p. 55 of arXiv v3: the sentence gives an n-simplex n − 1 morphisms, while the display right after it has n arrows f₀, …, f_{n−1} between n + 1 objects and the next sentence identifies 1-simplices with morphisms. A slip in the count; nothing depends on it.
- **E2**: confirmed. Checked on p. IV.22: the extension stated in 2.9 places the Tate module of π_{n−1}(E) in π_n(E; ℤ_ℓ). For E = K(ℂ) and n = 1 the completion of the divisible group ℂ^× vanishes and T_ℓ(ℤ) = 0, so K₁(ℂ; ℤ_ℓ) = 0 and the Tate module ℤ_ℓ of ℂ^× lies in K₂(ℂ; ℤ_ℓ). The example contradicts the formula of its own paragraph.
- **E3**: confirmed. Checked at Definition C.4 on p. 162: for a covariant X the coefficient of a string i₀ → ⋯ → i_n must be X(i₀) for the last face map (which drops i_n) to be defined; X(i_n) is the formula for contravariant diagrams, or for strings written in the opposite direction. The proofs around it are unaffected.
- **E4**: confirmed. Checked on p. V.8: S_n f contains C as the constant filtrations and maps onto S_nB, so it is an extension of S_nB by C and the split fibrations are |wS.C| → |wS.(S_nf)| → |wS.(S_nB)| with constant first term |wS.C|. With the printed roles the realised sequence would not be the one Proposition 1.7 states; the proposition itself is right.
- **E5**: confirmed. Checked on pp. IV.18 and IV.21: P^m(ℤ/ℓ) is S^{m−1} with an m-cell attached by a map of degree ℓ, so its cellular complex is ℤ → ℤ (multiplication by ℓ) in degrees m and m − 1 and its only reduced homology is ℤ/ℓ in degree m − 1. The same index slip recurs in the proof of Proposition 2.7.
- **E6**: confirmed. Checked on p. IV.14: the first part of the exercise gives some homotopy equivalence S³ → X⁺ for a homology 3-sphere X, but the composite of the 120-sheeted covering S³ → S³/Γ with X → X⁺ multiplies H₃ ≅ ℤ by 120, so that particular map is not an equivalence.
- **E7**: confirmed. Checked on p. IV.21: the statement of Proposition 2.7 and the last line of its proof repeat the modulus q₁ where the second factor should have q₂, as the displayed decomposition in the proof shows.
- **E8**: confirmed. Checked on printed p. 8 (chapter PDF p. 6): the range n > 1 leaves out n = 1. For n ≥ 1 the simplicial set Sp_n(C) is connected, so Segal's theorem makes σ_n an equivalence, as the claim that the Sp_n assemble into a spectrum needs.
- **E9**: confirmed. Checked on printed p. 297: the displayed sequence has lim¹ π_k(ΣP_nX) = lim¹ π_{k−1}(P_nX), whereas applying [S^k, −] to the triangle defining the homotopy limit gives lim¹ π_{k+1}(P_nX). The proof is unaffected, since the towers stabilise and the lim¹ term vanishes with either index.
- **E10**: confirmed. Checked on p. IV.14: SL₂(F₅) has exactly one element of order 2, while every subgroup of O₃(ℝ) of order 120 is A₅ × ℤ/2 and has many; the binary icosahedral group lies in SU(2) = S³ over the rotation group A₅ ⊂ SO(3) and acts freely on S³. The homology-sphere conclusion is unaffected.
- **E11**: confirmed. Checked on pp. IV.27–28: if the graph of T consists of the edges of T and their endpoints, then T = ∅ in a one-object category has empty graph, which is not contractible and meets no object, yet Application 3.4.1 uses T = ∅. The graph must contain all vertices of BC.
- **E12**: confirmed. Checked on printed p. 287 (PDF 288): the draft asserts that for no n ≥ 2 is the mod-n Moore spectrum a symmetric ring spectrum, with the proof deferred. Burklund's Theorem 1.1 (arXiv:2203.14787v2, p. 1) gives E₁-structures on S/8 and on S/p² for odd p, and E₁-algebras in spectra rectify to symmetric ring spectra, so the assertion fails in general; it holds for n = 2 and for odd primes n = p, as recalled on Burklund's p. 1.
- **E13**: confirmed. Checked on p. IV.34 and recomputed: in the printed double complex the rows are nerves of d₀\F, which for a cofibred F need not be equivalent to F⁻¹(d₀). For D the category with two parallel arrows 0 ⇉ 1 and the Grothendieck construction of two points over 0 and one over 1, the printed complex gives E²_{1,0} = ℤ and E²_{0,1} = ℤ, whereas H_p(D; H_q F⁻¹) gives ℤ² and 0; both abut to H₁(BC) = ℤ².
- **E14**: confirmed. Checked on printed pp. 7–8: summing functors must send ∅ to a zero object, and Sum_C has natural isomorphisms as morphisms. Finite sets have no zero object; finite pointed sets under wedge sum do, and give the sphere spectrum by the Barratt–Priddy–Quillen theorem.
- **E15**: confirmed. Checked on printed pp. 279, 297, 366 and 368–370 of the v3.0 draft: the equivariance condition of Definition 5.3, Example 5.11, the homology version of Proposition 6.23 and the sense of the homotopy limit in the proof of Theorem 8.3 are left as editorial notes. The packet states the missing conditions and rests nothing on the unfinished passages.

## Nodes and their state after this checkpoint

Checked in full in this round (source, closure, API, tests, Lean): 29 nodes. Corrected through the baseline, reader and Lean passes without a full node check: 33 nodes. Not yet checked in full: 184 nodes, including those partly checked; the table marks each node.

| Node | State |
| --- | --- |
| `H.1/nerve-and-classifying-space` | checked: verified |
| `H.1/realisation-boundary-inclusion-disk` | checked: needs-correction |
| `H.1/classifying-space-cw-structure` | partly checked (baseline, reader or Lean pass) |
| `H.1/classifying-space-op-homeomorph` | not yet checked |
| `H.1/classifying-space-prod` | partly checked (baseline, reader or Lean pass) |
| `H.1/classifying-space-prod-compactly-generated` | not yet checked |
| `H.1/natural-transformations-adjoints-contractibility` | not yet checked |
| `H.1/adjunction-homotopy-equivalence` | not yet checked |
| `H.1/contractible-of-initial-or-terminal` | not yet checked |
| `H.1/nerve-filtered-colimit` | not yet checked |
| `H.1/filtered-colimits-of-categories` | not yet checked |
| `H.1/filtered-colimit-homotopy-equivalence` | not yet checked |
| `H.1/filtered-category-contractible` | not yet checked |
| `H.1/filtered-colimit-homology` | not yet checked |
| `H.1/pi0-classifying-space` | not yet checked |
| `H.1/simplicial-covering-realisation` | partly checked (baseline, reader or Lean pass) |
| `H.1/coverings-fundamental-group-local-coefficients` | checked: needs-correction |
| `H.1/fundamental-groupoid-localization` | not yet checked |
| `H.1/maximal-tree-presentation` | not yet checked |
| `H.1/local-systems-as-functors` | not yet checked |
| `H.1/category-homology` | partly checked (baseline, reader or Lean pass) |
| `H.1/category-homology-derived-colimit` | not yet checked |
| `H.1/cellular-chains-local-coefficients` | partly checked (baseline, reader or Lean pass) |
| `H.1/homology-of-small-categories` | not yet checked |
| `H.1/classifying-space-of-group` | not yet checked |
| `H.1/translation-category-classifying-space` | not yet checked |
| `H.1/classifying-space-of-group-is-KG1` | not yet checked |
| `H.1/conjugate-homomorphisms-freely-homotopic` | not yet checked |
| `H.1/bar-complex-comparison` | not yet checked |
| `H.1/groupoid-nerve-kan` | partly checked (baseline, reader or Lean pass) |
| `H.1/groupoid-nerve-one-type` | not yet checked |
| `H.2/weak-homotopy-equivalence` | checked: needs-correction |
| `H.2/homotopy-fibre-and-long-exact-sequence` | checked: needs-correction |
| `H.2/mapping-path-space-fibration` | checked: verified |
| `H.2/fibration-relative-homotopy-iso` | checked: needs-correction |
| `H.2/fibre-to-homotopy-fibre` | checked: needs-correction |
| `H.2/connecting-map` | checked: needs-correction |
| `H.2/long-exact-sequence` | checked: needs-correction |
| `H.2/fibre-sequence-low-degree` | checked: needs-correction |
| `H.2/homotopy-fibre-transport` | checked: needs-correction |
| `H.2/homotopy-pullback` | checked: verified |
| `H.2/homotopy-cartesian-contractible-base` | checked: verified |
| `H.2/homotopy-cartesian-pasting` | checked: needs-correction |
| `H.2/comma-category-to-homotopy-fibre` | checked: verified |
| `H.2/quasi-fibration` | not yet checked |
| `H.2/excisive-triad-homotopy-comparison` | partly checked (baseline, reader or Lean pass) |
| `H.2/dold-lashof-criteria` | not yet checked |
| `H.2/dold-lashof-exhaustion` | not yet checked |
| `H.2/dold-lashof-deformation` | not yet checked |
| `H.2/simplicial-space-realisation` | partly checked (baseline, reader or Lean pass) |
| `H.2/bisimplicial-realization-lemma` | not yet checked |
| `H.2/proper-simplicial-space` | not yet checked |
| `H.2/realisation-preserves-finite-limits` | not yet checked |
| `H.2/gluing-lemma` | not yet checked |
| `H.2/h-cofibration-pushout-product` | not yet checked |
| `H.2/levelwise-equivalence-theorem` | not yet checked |
| `H.2/levelwise-fibration-realisation` | not yet checked |
| `H.2/bisimplicial-fibration-pi-kan` | not yet checked |
| `H.2/bousfield-kan-homotopy-colimit` | not yet checked |
| `H.2/realisation-is-homotopy-colimit` | not yet checked |
| `H.2/quasi-fibration-lemma` | not yet checked |
| `H.2/thomason-homotopy-colimit-theorem` | not yet checked |
| `H.2/functor-homology-spectral-sequence` | partly checked (baseline, reader or Lean pass) |
| `H.2/quillen-theorem-a` | partly checked (baseline, reader or Lean pass) |
| `H.2/prefibred-iff-fibre-adjoint` | partly checked (baseline, reader or Lean pass) |
| `H.2/quillen-theorem-a-prefibred` | not yet checked |
| `H.2/quillen-theorem-b` | not yet checked |
| `H.2/quillen-theorem-b-prefibred` | not yet checked |
| `H.2/group-extension-fibration` | not yet checked |
| `H.3/acyclic-spaces-and-maps` | partly checked (baseline, reader or Lean pass) |
| `H.3/hurewicz-degree-one` | not yet checked |
| `H.3/acyclic-space-perfect-fundamental-group` | not yet checked |
| `H.3/acyclic-map` | not yet checked |
| `H.3/acyclic-map-fundamental-group` | not yet checked |
| `H.3/twisted-homology-via-cover` | not yet checked |
| `H.3/serre-comparison-fibre` | not yet checked |
| `H.3/acyclic-map-homology-criterion` | not yet checked |
| `H.3/plus-construction-predicate` | not yet checked |
| `H.3/acyclic-pi1-iso-weak-equivalence` | not yet checked |
| `H.3/plus-construction-by-cell-attachment` | not yet checked |
| `H.3/plus-fundamental-group` | not yet checked |
| `H.3/plus-integral-homology` | not yet checked |
| `H.3/plus-is-acyclic` | not yet checked |
| `H.3/abelian-space` | partly checked (baseline, reader or Lean pass) |
| `H.3/hspace-is-abelian` | not yet checked |
| `H.3/eilenberg-maclane-space` | not yet checked |
| `H.3/relative-hurewicz-trivial-action` | partly checked (baseline, reader or Lean pass) |
| `H.3/principal-fibration-criterion` | not yet checked |
| `H.3/postnikov-limit-weak-equivalence` | not yet checked |
| `H.3/cohomology-representability` | not yet checked |
| `H.3/postnikov-principal-fibrations` | not yet checked |
| `H.3/obstruction-lifting` | not yet checked |
| `H.3/abelian-extension-corollary` | partly checked (baseline, reader or Lean pass) |
| `H.3/abelian-homology-whitehead` | not yet checked |
| `H.3/hspace-homology-whitehead` | not yet checked |
| `H.3/plus-construction-universal-property` | not yet checked |
| `H.3/plus-construction-uniqueness` | not yet checked |
| `H.3/plus-construction-functoriality` | not yet checked |
| `H.3/plus-hspace-recognition` | not yet checked |
| `H.3/plus-pi2-universal-central-extension` | partly checked (baseline, reader or Lean pass) |
| `H.3/plus-pi2-natural` | not yet checked |
| `H.3/plus-universal-cover` | partly checked (baseline, reader or Lean pass) |
| `H.3/plus-uce-fibration` | not yet checked |
| `H.3/plus-relative-fibre-comparison` | not yet checked |
| `H.3/serre-class-fibration` | not yet checked |
| `H.3/serre-class-eilenberg-maclane` | not yet checked |
| `H.3/serre-class-theorem` | not yet checked |
| `H.3/rational-hurewicz-hspace` | not yet checked |
| `H.4/symmetric-monoidal-groupoid-core` | partly checked (baseline, reader or Lean pass) |
| `H.4/classifying-space-hspace` | partly checked (baseline, reader or Lean pass) |
| `H.4/symmetric-monoidal-S-inverse-S` | not yet checked |
| `H.4/monoidal-action-category` | not yet checked |
| `H.4/S-inverse-S-pi0` | partly checked (baseline, reader or Lean pass) |
| `H.4/group-completion` | partly checked (baseline, reader or Lean pass) |
| `H.4/action-projection-cofibred` | not yet checked |
| `H.4/invertible-action-equivalence` | not yet checked |
| `H.4/quillen-localization-of-homology` | not yet checked |
| `H.4/group-completion-uniqueness` | not yet checked |
| `H.4/group-completion-uniqueness-countable` | not yet checked |
| `H.4/S-inverse-S-fibration` | not yet checked |
| `H.4/plus-of-product` | not yet checked |
| `H.4/plus-hspace-block-sum` | not yet checked |
| `H.4/based-free-module-groupoid` | not yet checked |
| `H.4/gl-telescope-plus-comparison` | not yet checked |
| `H.4/group-completion-acyclic` | checked: needs-correction |
| `H.4/cofinal-sequence-plus-comparison` | checked: needs-correction |
| `H.4/cofinality-action` | checked: verified |
| `H.4/cofinality-theorem` | checked: needs-correction |
| `H.4/cofinality-projective-modules` | checked: needs-correction |
| `H.4/gl-plus-comparison-naturality` | not yet checked |
| `H.4/strictification-independence` | not yet checked |
| `H.4/gamma-space` | not yet checked |
| `H.4/segal-gamma-space-delooping` | partly checked (baseline, reader or Lean pass) |
| `H.4/coherent-subset-construction` | not yet checked |
| `H.4/segal-delooping-theorem` | not yet checked |
| `H.4/segal-group-completion-homology` | not yet checked |
| `H.4/group-completion-adjunction` | not yet checked |
| `H.4/picard-groupoid-grouplike` | not yet checked |
| `H.4/hermitian-group-completion-integers` | not yet checked |
| `H.4/simplicial-ring-topological-realisation` | not yet checked |
| `H.5:spectra/simplicial-spheres-and-smash` | partly checked (baseline, reader or Lean pass) |
| `H.5:spectra/symmetric-spectrum` | not yet checked |
| `H.5:spectra/naive-homotopy-groups` | not yet checked |
| `H.5:spectra/omega-spectra-and-eilenberg-maclane` | not yet checked |
| `H.5:spectra/suspension-spectrum` | not yet checked |
| `H.5:spectra/loop-shift-suspension` | not yet checked |
| `H.5:spectra/semistable` | not yet checked |
| `H.5:spectra/stable-equivalence` | not yet checked |
| `H.5:spectra/naive-isomorphism-is-stable-equivalence` | not yet checked |
| `H.5:spectra/true-homotopy-groups` | not yet checked |
| `H.5:spectra/true-homotopy-pairing` | not yet checked |
| `H.5:spectra/stable-model-structure` | partly checked (baseline, reader or Lean pass) |
| `H.5:spectra/stable-homotopy-category` | partly checked (baseline, reader or Lean pass) |
| `H.5:spectra/mapping-cone-and-homotopy-fibre` | not yet checked |
| `H.5:spectra/cofibre-long-exact-sequence` | not yet checked |
| `H.5:spectra/fibre-cofibre-shift` | not yet checked |
| `H.5:spectra/finite-biproducts` | not yet checked |
| `H.5:spectra/shc-products` | not yet checked |
| `H.5:spectra/triangulated-structure` | not yet checked |
| `H.5:spectra/smash-product` | not yet checked |
| `H.5:spectra/derived-smash-product` | checked: needs-correction |
| `H.5:spectra/twist-sign` | checked: needs-correction |
| `H.5:spectra/homotopy-group-pairing` | checked: needs-correction |
| `H.5:spectra/smash-connectivity` | partly checked (baseline, reader or Lean pass) |
| `H.5:spectra/ring-spectrum` | not yet checked |
| `H.5:spectra/module-spectra-model-structure` | not yet checked |
| `H.5:spectra/operadic-algebras` | not yet checked |
| `H.5:spectra/eilenberg-maclane-spectrum` | not yet checked |
| `H.5:spectra/eilenberg-maclane-uniqueness` | not yet checked |
| `H.5:spectra/eilenberg-maclane-ring` | not yet checked |
| `H.5:spectra/eilenberg-maclane-of-chain-complex` | partly checked (baseline, reader or Lean pass) |
| `H.5:spectra/eilenberg-maclane-of-chain-complex-homotopy` | partly checked (baseline, reader or Lean pass) |
| `H.5:spectra/eilenberg-maclane-cohomology` | not yet checked |
| `H.5:spectra/postnikov-sections` | partly checked (baseline, reader or Lean pass) |
| `H.5:spectra/sequential-homotopy-colimit` | not yet checked |
| `H.5:spectra/cellular-approximation` | not yet checked |
| `H.5:spectra/connective-generation` | not yet checked |
| `H.5:spectra/connective-spectra-via-deloopings` | not yet checked |
| `H.5:spectra/grouplike-einfty-connective-spectra` | not yet checked |
| `H.5:spectra/picard-one-truncated-spectra` | not yet checked |
| `H.5:S-delooping/k-theory-symmetric-spectrum` | not yet checked |
| `H.5:S-delooping/iterated-S-construction-omega-spectrum` | not yet checked |
| `H.5:S-delooping/k-theory-spectrum-functoriality` | not yet checked |
| `H.6/moore-spectrum` | checked: needs-correction |
| `H.6/coefficient-spectrum` | not yet checked |
| `H.6/bockstein-long-exact-sequence` | not yet checked |
| `H.6/mod-l-homotopy-and-bockstein-sequence` | not yet checked |
| `H.6/uct-splitting` | not yet checked |
| `H.6/coprime-coefficient-decomposition` | not yet checked |
| `H.6/moore-spectrum-change-of-coefficients` | not yet checked |
| `H.6/qp-zp-coefficients` | not yet checked |
| `H.6/homotopy-limit-of-tower` | not yet checked |
| `H.6/milnor-sequence` | not yet checked |
| `H.6/nonzero-lim-one-example` | partly checked (baseline, reader or Lean pass) |
| `H.6/p-completion` | not yet checked |
| `H.6/l-adic-completion-milnor-sequence` | partly checked (baseline, reader or Lean pass) |
| `H.6/completion-ext-hom-sequence` | not yet checked |
| `H.6/completion-finite-type` | partly checked (baseline, reader or Lean pass) |
| `H.6/p-complete-criteria` | checked: needs-correction |
| `H.6/rationalisation` | checked: needs-correction |
| `H.6/rational-spectra-generalized-eilenberg-maclane` | checked: verified |
| `H.6/arithmetic-fracture-square` | checked: verified |
| `H.6/filtered-spectrum` | not yet checked |
| `H.6/exact-couple` | not yet checked |
| `H.6/filtered-spectrum-spectral-sequence` | not yet checked |
| `H.6/spectral-sequence-convergence-exhaustive` | not yet checked |
| `H.6/spectral-sequence-convergence-complete` | not yet checked |
| `H.6/spectral-sequence-conditional-convergence` | not yet checked |
| `H.6/atiyah-hirzebruch-spectral-sequence` | not yet checked |
| `H.6/moore-spectrum-multiplication` | not yet checked |
| `H.6/burklund-quotient-tower` | partly checked (baseline, reader or Lean pass) |
| `H.6/browder-scholium-mod-products` | not yet checked |
| `H.6/burklund-moore-multiplicative` | not yet checked |
