# REV-DiamondsAndVStacks

Accepted on 7 October 2026 by Codex, session `codex-nYijoc`, as an independent target-level review of BP-DiamondsAndVStacks. This is a completed review, not a checkpoint. Acceptance covers the corrected planning pass. It does not claim formalisation, closed stages, implemented supplier interfaces or a published-text collation that this reviewer did not perform.

The packet remains `complete`: every D0–D6 target is represented, and prerequisite chains end in the pinned libraries, actual supplier nodes, precise requests or explicit gaps. All seven stages are `planned`; none is `closed`. The protocol expressly permits acceptance with those honest open inputs. The node-by-node verdicts and qualifications are in `review.checked`.

| Item | Reviewed result |
| --- | ---: |
| Nodes | 90: 12 definitions, 18 constructions, 50 theorems, 8 lemmas, 1 application, 1 comparison |
| Node verdicts | 60 verified, 30 corrected; no added or unverifiable nodes |
| Nodes by stage | D0 26; D1 11; D2 9; D3 10; D4 10; D5 15; D6 9 |
| Baseline declarations | 107 confirmed: original 106 plus one exact flatness theorem |
| Sources / node citations | 15 sources / 166 citations |
| API / unit tests | 213 items / 116 tests, across 30 definition/construction nodes |
| Planets | 41, within the six-per-stage limit |
| Open inputs | 7 gaps and 6 requests |
| Suggested signatures | 87 typed API items, 20 complete typed tests, 11 named-target prototypes |
| Explicit omissions | 222 API/test signatures and 49 named-target signatures |

The corrected verdict count includes the universally-open-presentation node: its statement was unchanged, but the reconstruction gap now explicitly names it as a consumer. Twenty-nine node bodies changed. The original blueprint's signature ledger remains honest: comments are omissions, not declarations or completed tests. A finite clause of the coproduct test is typed, while its stronger infinite clause remains in that ledger. Geometry is supplied through named carriers and contracts; unavailable conditions are not replaced by opaque propositions.

## Sources and mathematical corrections

Every node locator and excerpt was checked directly, including the surrounding hypotheses and the proof inputs relevant to its targets. Normalized literal comparison confirms all 166 excerpts; this was a supplement to reading, not a substitute for checking mathematical context. Independently downloaded and hashed the ten original PDFs and the added Bhatt–Scholze manuscript; all 11 hashes match the packet. Public URLs, editions and hashes are in `sources` and `sourceVersions`.

The principal new reference is [Bhatt–Scholze, §2.1](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), which supplies the finite-T0 w-localization construction and its right-adjoint universal property. Added the primary [Stacks Leray comparison](https://stacks.math.columbia.edu/tag/072X), checking the geometric-morphism and bounded-below hypotheses. Live Stacks tags 0APA/0APB are scheme/flat comparison results, not replacements for ECD's generalizing spectral-space argument; the packet now quotes the actual tag text.

The substantive corrections are:

- **D0 Hochster realization:** removed the false construction through finite rings. A finite ring has discrete prime spectrum and cannot represent the two-point specialization chain. The finite-T0 inverse-system presentation is distinct from ring realization; the latter remains the existing precise Hochster gap.
- **D0 topos finiteness:** corrected the unconditional terminal-map quasicompactness implication inherited from ECD p. 41. It now requires a quasicompact terminal object. In sheaves on the infinite discrete space, the terminal object is not quasicompact, although its identity is a quasicompact morphism. Strengthened the suggested algebraic-topos predicate by the generators' terminal-map quasiseparatedness condition of SGA VI 2.2–2.3; the weaker predicate only describes local coherence.
- **D0 comparisons:** Leray uses a geometric morphism with exact inverse image, so direct image preserves injectives. A continuous site functor alone does not establish this. Replaced its irrelevant excerpt and added the primary source.
- **D1 Fargues criterion:** replaced preservation of all finite colimits of set-valued sheaves by preservation of epimorphisms. On the two-point discrete space global sections is the product functor, which fails both the finite-coproduct and arbitrary-coequalizer assertions printed in ECD 7.2. Retained the abelian exactness/cohomology equivalences and supplied the corrected proof.
- **D1 geometric inputs:** added actual completed-residue-field and point-injection suppliers to component, strictness and point constructions; made the w-localization construction explicit. Corrected pro-étale source spaces from spectral to locally spectral, retaining spectrality in the affinoid case. Infinite discrete coproducts discriminate the two scopes. Automatic flatness now uses torsion freeness for every nonzero valuation-ring scalar, not merely for a pseudouniformizer.
- **D2–D3 descent:** fixed the inverse-image/pushforward typo in the pro-étale cohomology proof. Added the direct almost faithfully flat descent input, the filtered-colimit/algebraic-topos inputs for inverting the pseudouniformizer, and a precise request for the bounded-below Čech complex extension of the supplier's currently bounded almost-exactness theorem. Exposed general-base perfectoid reconstruction as a gap. Removed the invented discrete-group quotient test and corrected the Frobenius-quotient non-example from universal to existential scope.
- **D5 spatial geometry:** corrected the map label in the two-out-of-three proof, added direct point-localization inputs where acyclic, and exposed the early point-localization input where importing the later result would create a cycle. In ECD 13.12 the separatedness criterion gives uniqueness; it does not provide the extension imported from 18.7(iv). That early extension and the ordinary proper-base-change/closed-neighbourhood comparison of 13.13 are explicit gaps.
- **Routed foundations:** replaced the inverse-topology patch-only excerpt; spelled out the spectral-space adaptation of Arc 2.17 by constructible descent; corrected the ordinal-assembly lemma/proposition locators and marked its auxiliary derivation; replaced the unrelated Arc excerpt with the ordinary profinite-sheaf/ultrafilter statements. D0 imports no infinity-category interface.
- **Routed geometry:** exposed the lattice/normalization/convergence argument in vector-bundle descent as a precise gap. Corrected the localization citation to ECD 11.31, the profinite-product citation to the actual proof of Howe–Klevdal 9.3.4, and the seminormality citation to Kedlaya–Liu Theorem 8.2.3. Updated every affected omission-ledger statement in the suggested file.

No nodes were added or removed. API changes preserve the names and make the mathematical hypotheses precise. Planet names describe definitions, constructions and named results rather than checks or source locators.

## Baseline, audit and ownership

Opened the full statements and ambient hypotheses of every original baseline declaration at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; checked their fit to consumers. No citation was removed. Corrected `TauCeti.ValuationSpectrum.residueFieldValuation`: it constructs the valuation on the algebraic residue field, not its completion. The entry has no direct consumer, and completed residue fields are imported from the actual P2 node where needed.

Added `Module.Flat.flat_iff_torsion_eq_bot_of_isBezout`, in `Mathlib/RingTheory/Flat/TorsionFree.lean`, after reading its commutative Bézout-domain/module hypotheses and the valuation-ring `IsBezout` instance at the pin. This exactly supplies the automatic-flatness step once full torsion freeness is proved.

Read the reviewed AUDIT-36 result and REV-AUDIT-36 report, including the D0 target-by-target baseline and the missing D1–D6 interfaces. Its DiamondsAndVStacks result is not yet projected into `data/library-coverage.json`, which currently covers the earlier audit batch. Existing spectral/pro-constructible, sheafification, enough-injectives and descent-data declarations remain imports/bridges, not new library work. Pro-categories extend the existing Ind carrier; perfectoid geometry is imported from its owner.

Read actual supplier statements, especially the combined `PerfectoidSpaces--P0.json` packet containing P0–P7, rather than inferring contracts from its filename or older stage decompositions. Its named completed-residue-field, point-injection, almost descent, tilting, limits and pro-étale inputs exist as plans. A planned input is not an implemented or independently accepted library theorem. The bounded-complex restriction and general-base reconstruction limitation are now explicit. The five existing requests and the added sixth each state the needed hypotheses and consumers; no unsupported near match is treated as an exact supplier.

The seven gaps are Hochster ring realization, noncompact period-torsor component transitivity, general-base almost-algebra reconstruction, early minimal-plus-ring extension, ordinary proper base change, early point localization, and convergent matrix descent. Their exact contracts and consuming nodes are in `gaps`, with corresponding stage `remaining` entries.

## Source issues

Confirmed both inherited findings independently against the specified text: the GLX universal component-orbit formula fails for dense integer orbits in the profinite integers; ECD 7.12's adjoint is a right adjoint. Preserved inherited published-GLX provenance and distinguished it from this review's arXiv-v3 verification.

Added and confirmed five findings: ECD 7.2's finite-colimit assertion, ECD 7.13's localization direction, Arc 3.10's proof saying coproducts instead of products, ECD 11.30's map/intermediate-object labels, and ECD p. 41's unconditional terminal-map implication. Counterexamples or type/variance checks, locators, corrected statements, effects and limited searches for known corrections are recorded individually. These findings concern the hashed preprints, not an uncollated published edition. Every one of the seven findings now has this review's verdict.

## Red-team findings and orchestrator actions

Checked the four assigned confirmed RT-AREA-padic-1 findings against the packet and reader:

- **/3:** D6 includes pre-adic/integral diamondification, the proper integral Galois v-cover and quotient, and only the analytic case's homeomorphism. It does not turn the integral cover into a torsor or claim every integral v-sheaf is a diamond. This supports the listed relative Fargues–Fontaine, Satake and integral Part II consumers.
- **/10:** TB.0 owns the normalized complete-Tate seminorm spectrum and affinoid maximal-Hausdorff theorem. D5 owns its extension to small v-sheaves. The packet requests the exact missing complete-Tate prefix; neither rank-one equivalence nor normalization is redefined here.
- **/11:** canonical compactification geometry stays at DiamondEtaleCohomology:C4. D5 supplies only the preliminary quotient/spatiality geometry, D2 the sites and D3 descent. The RS-05 owner row still incorrectly assigns canonical compactification geometry to D5; the report records that maintainer action without importing C4 backwards or editing another job's files.
- **/12:** the ordinary set/abelian-group profinite sheaf and ultrafilter interfaces are in D0. The infinity-valued theory is not asserted here and creates no enhanced-cohomology back edge.

The orchestrator should synchronize the reader with the corrected Fargues/terminal-object claims, locally spectral scope, existential tests, revised proof inputs and source locators. The reader is not an authorized deliverable of #389, so this review records those edits rather than changing it. Apply the already confirmed RS-05 owner correction and route the precise gaps/requests to their owning follow-ups. Preserve the preprint/published distinction if an errata or collation job consumes these findings. These are assembly and follow-up actions, not reasons to reject this honest completed planning pass.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/DiamondsAndVStacks.json` passes with zero errors and zero warnings. The prerequisite graph is acyclic and the stage/planet/test limits pass. The source-issue and source-version validators also pass. All named API/test statements were compared with their typed or omitted signature entries.

`lean-check research/blueprint/suggested/DiamondsAndVStacks.lean` exits zero in the shared pinned-Mathlib build with 95 warnings, all declaration-uses-`sorry` warnings and no other warnings. The file uses individual imports and claims no implementation. The Tau Ceti adic carrier test remains explicitly omitted because that dependency is not elaborated in the shared build; pinned source-statement verification was performed independently of compilation. No Lake build, update, cache fetch or language server was started.
