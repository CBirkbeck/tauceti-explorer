# Independent review: Complex Comparison PartII

**Accepted as a target-level planning pass**, with corrections. Reviewer: `independent-review-REV-ComplexComparisonPartII`; Codex session `codex-N8Tedj`; issue [#378](https://github.com/CBirkbeck/tauceti-explorer/issues/378); date 2026-10-09. I did not write or review the submitted blueprint. This is a completed review, not a checkpoint.

The packet now has **97 nodes**: 60 theorems, 24 constructions, 6 definitions, 6 applications and 1 lemma. Its review checks every node: **67 verified, 28 corrected, 2 added**. All 30 definitions/constructions retain at least three discriminating tests: **91 API items and 90 tests** in total. There are **25 planets** and **17 independently confirmed pinned baseline declarations**, including six added native carriers. No baseline citation was removed. Every implementation status remains `unchecked`.

| Layer | Nodes | Coverage verdict |
| --- | ---: | --- |
| C0 | 16 | Planned; includes the canonical comparison-map construction formerly positioned under C3 |
| C1 | 11 | Planned; independent analytic vanishing/generation route |
| C2 | 7 | Planned; projective, relative and nonreduced comparison |
| C3 | 8 | Planned; proper schemes, descent and explicit algebraic-space leaves |
| C4 | 10 | Planned; coherent ideals, graphs, proper support and imported curve completion |
| C5 | 45 | Planned; ordinary/relative de Rham, geometric Hodge, regular singular and fine log targets |
| C6 | 0 | Process/source-decomposed; examples remain in the acceptance matrix and its removal is proposed |

`complete` means the planning pass is complete. **No stage is closed**, and acceptance does not certify the missing supplier proofs or any Lean implementation. The nine declared gaps are sufficiently precise and remain visible. In particular, the Whitney dimension-locus proof and the relative algebraic-space proof are not independently established by the available sources.

## Corrections made

1. **Preparation precedes division in the cited proof.** Demailly II2.1, pp.79–80, constructs the distinguished polynomial from contour power sums. II2.3, pp.80–81, then divides by the prepared polynomial. I corrected both proof outlines and prerequisite direction, and retained division as a direct input to Noetherianity (II2.6–2.7, p.81). This removes reliance on a division-first proof that the recorded locator does not give.
2. **Proper coherent algebraization needs Ext comparison.** SGA1 XII4.4, printed p.250/PDF266, reconstructs the module through the adjunction to a projective Chow modification. Its kernel and cokernel have smaller support; full faithfulness algebraizes the map to the cokernel, and Ext¹ algebraizes the remaining extension. I replaced the unsupported fibre-product descent outline and added `C3/proper-coherent-ext-comparison`, for all degrees with naturality, Yoneda products and extension classes. SF.2 now explicitly supplies coherent sheaf Ext, flat pullback and the natural local-to-global spectral sequence. The native suggested map uses `Abelian.Ext.mapExactFunctor`.
3. **The proper fibre-dimension image consequence belongs in C4.** C0 states the source analytic locus without properness. Its proper image is now a consequence of Remmert in C4 with the actual C0 dependency. PS08 Lemma8.2, pp.22–23, redirects general source-locus analyticity to Whitney9F, p.240; the existing gap is retained. Upper semicontinuity alone is insufficient.
4. **The log monodromy triangle needs split cotangent transitivity.** Added `C5/log-differential-transitivity-split`: Kato Propositions3.10 and3.12, printed pp.203–204/PDF14–15, give finite locally free relative log differentials and locally split injectivity for a log-smooth first morphism. No smoothness of the second morphism is required for that implication. Exterior powers supply the short exact absolute-to-relative complex over the standard logpoint. Qian companion Proposition3.6, pp.18–19, then compares its connecting operator. The new elementary log result is included in the CR.5 export.
5. **Source attribution and locators.** Both seminar exposés18 and19 are by **Jean-Pierre Serre**, in the Séminaire Henri Cartan; I corrected their authors, titles and edition descriptions. Serre’s Theorems1–3 are stated in §12, printed pp.19–20, and proved in §§13–17, pp.20–27. The finite presentation belongs to §17, p.27, not Lemma5. In seminar exposé18, projective charts and Proposition4 are no5, pp.18-5–18-6; twists are nos5–6, pp.18-5–18-8; the all-degree hyperplane calculation and Remark1 extend through no7, p.18-10. Their former page ranges omitted the relevant proof or located a different subsection. Hom pullback is §14, Lemma6, pp.22–23. Deligne1968 5.3 is a **Proposition**; Theorem5.5 starts on p.123 and its proof continues through p.125. Differential-operator analytification is Deligne70 **II6.6**, printed pp.100–101/PDF103–104. Proper ordinary de Rham comparison is Grothendieck1966 **Theorem1′**. Hall5.5 and7.4 are **Lemmas**; tom Dieck2.2.4 is a **Corollary**. Demailly’s cutoff misprint is in the VIII2.4 proof on p.367, after its statement on p.366.
6. **Working source URLs and version identity.** PS08’s author HTTP endpoint and the NSF servlet endpoints for Qian23 and BKT20 return the exact recorded PDF hashes. I replaced the challenge/broken endpoints without changing editions. Deligne’s three-page author erratum now has its own SHA256. I also read the four-page BKT author erratum and recorded its hash and scope: its arithmetic-quotient functoriality correction does not change the Theorem4.12 definable-Chow input used here.
7. **Native suggested signatures.** Differential operators now have A-module/scalar-tower data and an actual iterated-commutator order bound; an arbitrary complex-linear map with an order label is insufficient. Analytification of the coordinate operator is restricted to the chosen polynomial-to-convergent-germ inclusion. A derivative cannot extend along arbitrary algebra maps, such as evaluation at zero. The algebraic de Rham complex is built from its specified exterior forms and derivative. The bundle dictionary domain is finite locally free, rather than every coherent module. Sheaf–singular comparison retains native local contractibility. Relative Hodge bundles retain the complex base, local Noetherianness and finite local freeness; proper de Rham and log comparisons retain native smoothness/properness where their scheme carriers permit it.
8. **Meaningful representative comparisons.** The suggested Gauss–Manin construction now models a constant family over the affine line, differentiating base coefficients and identifying its horizontal kernel with the fibre. It does not construct a connection on every module. The packet retains the full Katz–Oda filtration construction and distinguishes general characteristic-zero construction from analytic comparison after a specified complex base change. I added the proper/operator comparison dependencies used by its horizontal comparison. The Čech signature uses the native complex of the supplied sheaf and covering opens, with higher-cohomology vanishing on all indexed finite intersections. The curve signature uses the imported proper smooth one-dimensional model and dense open immersion, and proves finite boundary instead of merely asserting existence of an arbitrary morphism. The full curve target is stated componentwise for finite-type smooth curves.

Both added nodes have `addedBy: REV-ComplexComparisonPartII`. Existing node IDs, API/test names, planet names, coverage statuses and the nine gaps are preserved. The per-node `review.checked` records the individual verdict and proof locator, including the corrected statements and the scope of unresolved leaves.

## Pinned baseline and duplication audit

I independently read every declaration’s statement and context at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. The shared Mathlib checkout has that exact commit. For the four Tau Ceti source modules, official raw files at the pinned commit match the shared build’s source bytes.

| Confirmed declaration | What is reused; what it does not supply |
| --- | --- |
| `AlgebraicGeometry.LocallyRingedSpace` | Local stalk carrier; no nonreduced analytic local models or analytification |
| `CategoryTheory.Sheaf.H` | Native Ext-defined sheaf cohomology; no comparison theorem |
| `TauCeti.Topology.subsingleton_H_succ_of_isFlasque` | Positive-degree flasque acyclicity on a topological space |
| `Filter.Germ.valueRingHom` | Evaluation homomorphism for neighbourhood germs |
| `AnalyticAt` | Convergent analytic expansion predicate; no ring of convergent germs by itself |
| `SheafOfModules.IsFinitePresentation` | Local finite presentations; analytic coherence remains new |
| `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf` | Algebraic coherent-category carrier under the stated Noetherian hypotheses |
| `KaehlerDifferential.D` | Universal ordinary derivation; exterior de Rham d remains new |
| `exteriorPower.ιMulti` | Native exterior-power generator |
| `TauCeti.Hodge.Conjugation` | Abstract conjugation carrier |
| `TauCeti.Hodge.HodgeStructureOn` | Abstract pure Hodge carrier; no geometric Hodge theorem |
| `LocallyContractibleSpace` — added | Null-homotopic neighbourhood inclusions, matching the packet’s semilocal convention |
| `SheafOfModules.IsLocallyFree` — added | Existing local-free module predicate, combined with finite presentation |
| `CategoryTheory.Abelian.Ext.mapExactFunctor` — added | Canonical map for an additive exact functor; its bijectivity remains the new GAGA target |
| `AlgebraicGeometry.IsLocallyNoetherian` — added | Native relative-base hypothesis |
| `topologicalKrullDim` — added | Native dimension-one curve hypothesis |
| `CategoryTheory.cechComplexFunctor` — added | Existing alternating Čech complex; D0 supplies the Leray comparison |

I read the reviewed `data/library-coverage.json` entries C0–C6, including duplicates. Formal power-series Weierstrass results do not supply convergent division. Native sheaf-module finite presentation/local freeness and the abstract Hodge structures are reused, rather than planned again. The Čech complex already exists; its comparison is imported from D0. SF.6 and MC.2 are realization consumers, not competing owners. AlgebraicCurves owns the completed function-field model and holomorphy-ring dictionary; this packet adds its analytic consequences.

Current read-only upstream was checked at TauCetiRoadmap **f9e4a9026b04c282878900edaada0a3f3eb3c82a**, with current Tau Ceti **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039**. AlgebraicVectorBundles L0A–L0C already plans general sheaf-module tensor/Hom, finite local freeness, duals, exterior powers and determinants. DifferentialGeometry already plans smooth forms, integration, de Rham, products and duality. OperatorTheory’s bounded/Hilbert family does not supply Montel/Schwartz coherent cohomology. General Hermitian Chern connections, Ehresmann, compact bundle elliptic estimates and compact-map cohomology remain named extensions with their existing directions, rather than duplicate foundational constructions here.

The public supplier proposals [ComplexComparison PR196](https://github.com/TauCetiProject/TauCetiRoadmap/pull/196) and [AnalyticGeometry PR279](https://github.com/TauCetiProject/TauCetiRoadmap/pull/279) remain open at heads **4bd72379658126cbe9be935656396f0c9dac4de0** and **581f66fed0f12fe49b8f5dd96aa18d3e435c190a**, respectively; their status and hashes were rechecked during this review. The packet correctly retains tracked integration as a gap. No accepted stage or pinned implementation is invented for either proposal.

The external statements were checked in the available supplier packets: D0’s general acyclic-cover comparison; SF.2’s Tor-independent derived base change, scheme D_QCoh pushforward/projection and perfect generator; R09.7’s SNC compactification; and the precise R09.1/R09.2/R09.3 contracts. Scheme-only SF.2 does not provide Hall’s algebraic-space QCoh-inclusion adjoint or perfect-support approximation. Proper pushforward’s adjoint is a different adjoint. The broad all-dimensional algebraic Serre/coherent and effective groupoid-descent inputs are explicit requests, not claims that current curve or partial moduli statements already prove them. No upward C5 prerequisite borrows the elementary log/ordinary prefix from tier9 CR/DD or geometric Hodge from HodgeStructuresPartII.

## Source and source-error checks

The packet has 22 primary source/contract entries. All public downloaded source PDFs were checked against their recorded SHA256; printed and PDF page numbers were distinguished. Source proofs were read at the target locators, including the Cartan seminar Laurent/independent generation route, SGA1 proper reduction and Ext reconstruction, Katz–Oda integrability, Kato’s chart/lifting arguments, Deligne’s corrected regularity criterion and Hall’s reconstruction hypotheses. These are mathematical paraphrases, not source excerpts.

| Source route | Scope checked |
| --- | --- |
| Demailly CADG | II2–3 pp.79–90; II8–9 pp.116–124; weighted estimates pp.363–372; coherent vanishing/finiteness pp.419–428; Hodge pp.287–311 and322–323; Chern/Bochner pp.270–281 and329–331; currents/positivity pp.130–140 |
| Serre GAGA; Serre’s seminar exposés18–19 | Statements and complete projective comparison/algebraization proofs; independent analytic chart/twist/generation/vanishing proofs |
| SGA1 XII | 1.1–1.3 pp.239–241/PDF255–257; 4.1–4.5 pp.247–251/PDF263–267, including nonreduced/relative/proper hypotheses |
| Grothendieck1966; Sella | Proper ordinary de Rham argument pp.95–96; full small-cochain proof and its non-Hausdorff counterexample, pp.1–19 |
| Deligne1968; Deligne70 and author erratum | Trace/pure/relative Hodge pp.120–125; canonical extension II5; operator/hypercohomology II6; relative connection II7; all three erratum pages |
| Hall | Theorem3.8, Lemmas5.5/7.4 and Theorems8.1/9.1, pp.8–14 and18–21, with proper/Noetherian and support hypotheses |
| PS08 | Theorem7.2 and Lemma8.2, pp.21–23; redirect to inaccessible Whitney9F remains a gap |
| Kato89 | §§1–3, printed pp.192–205; image-only pages were read with OCR, checked against the page numbering and notation |
| Qian companion; Qian23 | Theorem1.8/Proposition3.6, pp.3–4 and18–19; main Lemma3.10(2), printed p.1266 |
| MPT19; BKT20 and erratum | Graph/definable closure application and definable Chow Theorem4.12, BKT printed p.933; the four-page author erratum does not alter that input |
| DGH21; Caraiani–Scholze17 | Proposition4.2 integration/line-bundle contract and regular-singular horizontal tensor application |
| AlgebraicCurves contract; tom Dieck; Katz–Oda68 | Single projective-model owner Layers6/12; proper-submersion Corollary2.2.4 pp.52–53; connection/integrability Theorem1 and proof pp.201–206 |

Every `sourceIssues` entry now has my independent `confirmed` verdict:

- **E1:** Deligne’s author erratum withdraws II1.23–1.24 and replaces the proof of II4.1. The corrected route avoids those results and circular use of II5.9.
- **E2:** The decreasing cutoff in Demailly VIII2.4’s proof, p.367, cannot have a nonnegative derivative; the estimate uses the absolute derivative bound.
- **E3:** Demailly VI11.3, pp.322–323, supplies degeneration/dimension equality but its argument does not construct a canonical splitting for every compact complex manifold. The packet’s Kähler harmonic and proper-algebraic transport route supplies the needed stronger structure under its narrower hypotheses.
- **E4:** The references needed by Demailly VII1.1–1.2, pp.329–330, are V12.10, VI6.8 and VI5.7. The printed placeholder/misnumbered references do not locate those inputs.

No copy of Whitney’s book was used. Its Theorem9F, p.240, is not cleared in the maintainer’s library index. The source-locus claim is reviewed as an honestly recorded target with a proof gap, not as a verified Whitney proof.

## Confirmed red-team findings

I read the ten issue-listed findings and checked their resolution in the packet and the submitted reader. The older campaign text is not the reviewed planning output and must be refreshed through the normal integration process.

| Finding | Independent disposition |
| --- | --- |
| /3 | Shared nonreduced analytic carrier and all named consumers are recorded; PR196 integration is still a visible gap, not supplied by locally ringed spaces alone. |
| /4 | C5 contains the geometric harmonic/Kähler, proper pure and relative Hodge targets; completed HodgeStructures supplies only linear algebra. HodgeStructuresPartII imports these outputs and replaces the obsolete prospective DegeneratingHodgeStructures route. |
| /9 | AlgebraicCurves Layers12B–12C and6 supply the one completed curve; C4 adds finite boundary and connectedness. |
| /28 | The packet records the shared PR279 gluing/bundle integration and AnalyticToricGeometry/Shimura consumers without fabricating stages. |
| /29 | Arbitrary-abelian-coefficient small cochains and sheaf–singular comparison are separate C5 targets, not imported from PR196’s finite-coefficient theorem. Products are a separate chain/smooth comparison interface. |
| /30 | The canonical relative exchange precedes projective/proper proofs. C3 has the nonprojective proper comparison; C5 has relative Poincaré, Betti local constancy/Ehresmann, filtration connection and horizontality. Source and supplier leaves remain explicit. |
| /31 | SF.6 and MC.2 appear as actual comparison/product/trace consumers in `exports`, not prerequisites pointing upward. |
| /32 | The all-degree algebraic twist/Serre/proper-coherent contracts are named precisely through R09.1/R09.2 and coherent/base-change owners. Independent analytic generation prevents circular GAGA. |
| /33 | C4 cites the completed AlgebraicCurves model, rather than attributing closure/normalization to R09.3. The corrected boundary signature states its content. |
| /35 | SGA1 XII provides the nonreduced/relative/proper scheme route. Serre’s reduced projective argument is not treated as proof of the stronger targets. C6 is process, with the source route distributed over C0–C5. |

## Packaging handoff and limits

The remaining nine gaps are unchanged: shared analytic supplier integration; Whitney’s analytic dimension-locus proof; current sheaf/smooth carriers outside the snapshot; exhaustion/Chern/compact-map interfaces; proper algebraic-space derived reconstruction; relative algebraic-space comparison; Noetherian compactification; compact bundle elliptic estimates; and Ehresmann/finite-CW interfaces. None is concealed by the review’s accepted status.

The issue permits edits to the packet, suggested file, this report and my handoff. It does **not** permit editing the reader or campaign document. The orchestrator/packager should reconcile them with the corrected packet before producing the upstream roadmap: add both new key targets, correct the preparation/division graph and proper-Ext proof, move the proper dimension-image consequence, correct source authors/locators/URLs, update the changed native signatures and counts, and carry forward all existing gaps and owner exports. In particular `GaussManin.degreeZero` is now a constant-family identification accompanied by `degreeZero_connection`; the full packet target remains the ordinary connection on H⁰. The packet’s new cotangent-transitivity target is definitive; the suggested file is representative and does not pretend to include its missing global log-scheme carrier.

The maintainer still needs to apply the proposed C6 removal/C5 subdivision and encode supplier/consumer integrations. No other roadmap, audit, atlas edge, upstream repository or source file was edited. No work was promoted and no theorem is claimed formalized.

Validation: `python3 scripts/check_blueprint.py research/blueprint/packets/ComplexComparisonPartII.json` passes with **zero errors and warnings** using the installed declaration index. `lean-check research/blueprint/suggested/ComplexComparisonPartII.lean` exits **0**, with **419 `sorry` warnings and no other warnings** at the pinned shared build. JSON review completeness, all definition test counts, prerequisite/export IDs, source review verdicts, allowed paths and whitespace were also checked. No language server, Lake build, dependency update or cache download was run.
