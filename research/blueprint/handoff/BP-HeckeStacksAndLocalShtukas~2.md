# Hecke correspondences on the Fargues–Fontaine curve and local shtuka cohomology: revision round 2

Job `BP-HeckeStacksAndLocalShtukas~2`, issue #6970. Worker: Claude, session `claude-77HyZ1`, 8 October 2026. This is a finished revision round, not a checkpoint. The packet is `complete`: all five stages are `planned`, none is `closed`; every `implementationStatus` is `unchecked`. The `review` object of `REV-HeckeStacksAndLocalShtukas` is left in place for the next reviewer to replace. All 51 node ids are kept. No file outside the three deliverables and this note is changed.

## What the review asked, and what this round did

The review accepted the packet and the suggested file as it had corrected them and asked for one thing: the roadmap document had to be regenerated from the corrected packet.

1. **Roadmap document regenerated** (`research/blueprint/readmes/HeckeStacksAndLocalShtukas.md`). It is rendered from the packet by a script, so the two agree by construction: every node with its statement, hypotheses, construction or proof outline, API, unit tests, uses, acceptance tests, prerequisites and source places; then the requests, gaps, proposed changes of structure and the mistakes found in the sources. The introduction (scope, boundaries, conventions with the one orientation used throughout, order of the layers) and the five layer overviews are written by hand from the packet. None of the statements that the review listed as false in the old document remains (the dictionary "μ_FS = μ_SW⁻¹", independence of b of the twisted Grassmannian, σ(y)by⁻¹, the general-E tower "explicitly supplied", the theorem resting on an "unresolved gap", "Λ = Q_ℓ", the reversed inflation, the Levi node as a list of conditions, the old counts).
2. **Rendering.** The atlas's own Markdown renderer (`src/markdown.js`) reads `*` and `_` as emphasis and `[x](y)` as a link, so that unescaped text such as `p_1^*A ⊗ S′_V … q^*` or `Λ[d](d/2)` and `Y_[0,r](S)` (about 100 places) loses characters; the same happens on GitHub. The generator escapes these. A port of the renderer's inline parser was run on every line of the document: the rendered text equals the intended text on all lines, with no unintended emphasis, link or mathematics.

## Each correction of the review, checked

I read the nodes in full against the sources (re-fetched; the four author and arXiv files reproduce the recorded SHA-256; see *Sources*): HS0 to HS3 node by node, HS4 at the computations listed below. Then nine independent readers, fresh agents given the node texts, the sources and the suggested file but none of my conclusions, went over everything again: six re-read the 51 nodes layer by layer against the cited places, three compared the suggested file with the packet declaration by declaration.

Their result on the review's corrections: every node statement is sound; every unit test and every acceptance computation was recomputed and agrees; the corrections of sources that the review recorded (pro-p levels in the compactness theorem, the chain of dualities, the orientation [b] ∈ B(G, μ⁻¹), the direction of the map from shtukas to the Rapoport–Zink tower, the gap for compact ρ) were derived again and stand. They found 43 places in the packet to tighten. None overturns a result: where a statement changed, it gained hypotheses that the source has (`HS3/classical-comparison`), or its notation or scope was made exact. All 43 are applied (see *Changes to the packet*). Their findings on the Lean file are under *The suggested Lean file*.

Checks I made myself, beyond reading:

- the sign finding on Fargues–Scholze III.3.6(ii) (E1), on G_m with the lattice ξB⁺_dR;
- the Weil descent datum (`HS2/weil-descent-datum`), which the review had flagged as derived once only: I re-derived ψ_Gr = b_f·ψ_can, with b_f read through the structure of the translated point, from the description of sections of E_b as functions h with b·φ^*h = h; it agrees with the node;
- the two topological lemmas (T) and (N) that replace Lemma 3.2 of Gleason–Lim–Xu, and the counterexample Z acting on Z_p;
- the GL_2/Borel constant-term computation of `HS4/levi-compatibility` and the shifts of `HS3` on the Lubin–Tate tower;
- the composite of the inner-form equivalence in `HS3/hecke-operators-between-strata` (class b·b′⁻¹);
- the eight baseline declarations, at the pinned commits (lines 108, 77, 389, 162, 44, 40, 113 and 55 of their modules); and that Mathlib at the pin has no lemma carrying an exact pairing forward along a monoidal functor (only `ExactPairing.ofFaithful` and `ExactPairing.ofFullyFaithful`, which go backwards).

## Changes to the packet

All changes are made by one script from the reviewed state; the checker reports 0 errors and 0 warnings before and after.

- **Word-for-word passages of the sources removed.** The nodes, one gap and the records of mistakes still carried about forty short quotations of the sources (in statements, proof steps, `match`, `correction`, `reason`, `searched`). Each is restated in my own words; formulas are kept. The maintainer's sweep of 7 October had rewritten the `printed` fields only.
- **Three sources added** (question 7 of the review), each fetched and read at the cited places, with URL, SHA-256, version and read sections, and cited by the nodes that use them: Dat–Helm–Kurinczuk–Moss, arXiv:2203.04929v2 (Theorem 1.1, Corollary 1.4: `HS3/compactness-of-shtuka-cohomology`); Hamann–Hansen–Scholze, arXiv:2409.07363v1 (Theorems 1.3.1 and 7.1.4, footnote 1: `HS3/admissibility-duality-and-adjunction`); Hamann–Imai, arXiv:2401.06342v4 (Propositions 4.1 and 4.4, Lemma 4.7: an independent check in `HS3/admissibility-duality-and-adjunction` and `HS4/levi-compatibility`).
- **Suppliers reconciled with the main branch of 8 October.** Since the review, the packets of v-stack sheaves, geometric Satake (GS0, GS3), RF4, VB0, VB3, ES7 and Igusa varieties changed. 34 cited supplier nodes changed statement or hypotheses; I read each change. Consequences:
  - `RelativeFarguesFontaine:RF4:G-torsors/three-descriptions-of-G-torsors` exists only in the old integrated decomposition, which the promoted RF4 blueprint replaces; the checker still resolved it. The two nodes that cited it (`HS2/local-shtuka-moduli`, `HS2/lattice-extension-functor`) now cite `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`, and the first says which form of torsor it uses.
  - `HS1/continuous-weil-descent` uses Fargues–Scholze VII.2.6(ii), which the v-stack roadmap now states in a node of its own; `VStackSheavesAndLisseCategories:VS2/solid-geometric-base-change` is added as prerequisite.
  - `HS2/hecke-fibre-description` glues along divisors of Y_S; it now also cites `RF4:G-torsors/tannakian-transfer-of-gluing`.
  - The request to `VStackSheavesAndLisseCategories:VS2` now says exactly what the supplier's node states (comparison maps for extension and restriction of coefficients) and what is requested (that the map for restriction is an isomorphism).
  - No request became obsolete: none of the nodes added to the suppliers states a requested statement. Requests and stage-level prerequisites still agree one to one (22 and 22).
  - The main branch moved again during the round (GS3, ES5 and AG2.0 among others). At the commit this branch starts from, no supplier node cited here differs in statement, hypotheses or kind from what I read, and every citation of a node of this packet by another packet resolves.
- **Baseline.** A remark on the history of the packet in the entry for `ExactPairing` is removed, and the entry now names the two Mathlib declarations that exist.
- **Scope words.** Five references of the form "a later node of this stage" now name the node; five uses of "later" in the records of mistakes are reworded. The document contains none of "optional", "deferred", "later"; in the packet the word "later" remains only in three notes of the `review` object, which is left as the reviewer wrote it.
- **The 43 findings of the independent readers** (8 in HS0, 8 in HS1, 12 in HS2, 9 in HS3, 6 in HS4). Those with mathematical content:
  - `HS1/duality-exchange`, acceptance item for PGL_2: the pinned Chevalley involution of SL_2 is the identity, so the switch acts on representations through conjugation by the image of diag(−1, 1) alone; the item said otherwise. Its conclusion (the switch fixes every V up to isomorphism) stands.
  - `HS4/isogeny-product-and-weil-restriction-diagrams`, proof step 2: the isomorphism of one-leg components holds over a geometric point, or for split groups; over Div¹ it fails for the norm from a quadratic Weil restriction of G_m to G_m. Parts (a) to (d) do not use it over Div¹ and are unaffected.
  - `HS3/classical-comparison`, part (2): the standing data of the appendix to Lecture 21 of Scholze–Weinstein (centre of B a field, a maximal order, a self-dual chain and p ≠ 2 in the PEL case) are now hypotheses.
  - `HS3/compactness-of-shtuka-cohomology`, step 5: the route through Dat–Helm–Kurinczuk–Moss is made exact (Theorem 1.2, Lemma 3.1, Remark 3.6, after decomposition by depth).
  - `HS2/minuscule-rigidification`: partial properness is argued as in Scholze–Weinstein 17.4.7, on all affinoid perfectoid pairs; the step on the action of J_b now uses that the action covers an automorphism of the flag variety, with 10.2.3 for full faithfulness on seminormal rigid spaces.
  - `HS2/nonemptiness-and-period-connectedness`, step 4: the Levi subgroup and the sign of the Newton point in the dimension count.
  - `HS2/weil-descent-datum`: one symbol was used for the q-Frobenius and the q_F-Frobenius; φ_F is now composition with the f-th power of the q-Frobenius of S, f the residue degree.
  - `HS0/descent-and-bounded-fibres` (c): why p_1 has finite dim.trg on a bounded part. `HS2/levels-and-tower-limit` (f): in which group K lies for each of the two actions.
  - Reflex fields are written F_i, with completed maximal unramified extension F̆_i, in all nodes (five nodes and one request used E_i).
  - The other findings are locators and `match` sentences made exact: what the cited place states and what is this node's own (about 25 places, for instance two places where Fargues–Scholze say "up to shift" and the node computes the shift).
- **Owner of the Rapoport–Zink comparison** (next section).

Counts after this round: 51 nodes (18 theorems, 17 constructions, 13 comparisons, 2 definitions, 1 application), 215 API items, 94 unit tests, 22 planets, 8 baseline declarations, 8 sources, 22 requests, 8 gaps, 46 recorded mistakes in the sources.

## A finding for the maintainer: Rapoport–Zink spaces already have an owner

The review's first question was who owns the comparison of classical towers with shtuka towers (Scholze–Weinstein 24.2.5, 24.3.5): the verifier of RT-AREA-geomlanglands/2 said ET.6a, the stage texts say HS2/HS3. Neither the first packet nor the review mentions that the **accepted routing of the Scholze–Weinstein lectures** (`PAPER-SCHOLZE-WEINSTEIN-20`, route 4, items 172–175; its review accepts all routes) sends the Rapoport–Zink spaces for GL_n and for EL and PEL data, **and both comparison theorems**, to a Part II of this roadmap, `HeckeStacksAndLocalShtukasIntegralPartII`, whose design job `DESIGN-HeckeStacksAndLocalShtukasPartII` is queued. The packet's second proposal even asked for these spaces as a Part II of the finite flat groups roadmap.

Following PROTOCOL.md section 9, I kept the current structure and the node `HS3/classical-comparison`, and corrected what the packet says about it: the node now states that the Rapoport–Zink spaces are not objects of this roadmap; the first proposal has a third option (c), that the continuation owns the spaces and the comparison and the node moves there unchanged; the second proposal and the gap on comparison inputs name the continuation. I think (c) is right: it is the only option that agrees with the accepted routing, and in option (a) a layer of this roadmap would depend on its own continuation. Whoever designs the Part II must import or take over this node, not restate it.

Two more accepted routes continue this roadmap (`HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig`, `HeckeStacksAndLocalShtukasKottwitzPartII`); the queue groups all three directions in the one design job. The Kottwitz direction names the preservation of finite length by i^{1*}T_V i^b_!; part (5) of `HS3/admissibility-duality-and-adjunction` already states this for Q̄_ℓ after Fargues–Scholze IX.3, and should be imported there.

## Red-team findings handed to this job

Unchanged from the review, which I checked: /13 and /29 (the lisse VII.7.6–VII.7.10 statements: cited from the supplier's nodes, which exist); /19 (the perfect-complex extension is `GS4:integral-dual-group/enhanced-perfect-satake-extension`; HS1 asks LP3 only for the two reductions to exterior tensor products); /20 (`HS2/minuscule-rigidification`, `HS3/huber-cohomology-comparison` with its gap); /21 (the node is in HS1; its id still begins `HS0/`); /22 (`HS2/general-local-field`). /2 is the question of the previous section.

## Requests that other roadmaps address to this one

| From | To | Where it is met |
| --- | --- | --- |
| ES0 | HS1 | Relative discreteness of Hom out of a compact object: `HS1/condensed-enrichment`. Change of coefficients of kernels with the √q convention: `HS1/coefficient-base-change`. Equivariance for a quotient of the Weil group: `HS4/continuous-tensor-generator-export` (E3). |
| ES0 | HS3 | The comparison of IX.3.2 for several legs with levels and both actions: `HS3/hecke-cohomology-comparison`. |
| ES5 | `HS1/condensed-enrichment` | Asked without compactness of A; the source and the node have it for compact A only. Not met. |
| ES5 | `HS4/isogeny-product-and-weil-restriction-diagrams` | Parts (a)–(d) of that node, `HS4/product-hecke-diagram`, `HS4/weil-restriction-hecke-diagram`. The revision of ES5 merged on 8 October withdrew this request and cites the three nodes as prerequisites. |
| ES7 | HS2 | The tower in equal characteristic: `HS2/general-local-field`. Formal O_K-modules and their deformations are outside this roadmap. Not met. |
| ES7 | HS3 | The nodes of HS3 are stated for every local field E; the comparison with classical towers for E ≠ Q_p is part (3) of `HS3/classical-comparison` with item (5) of its gap. |
| AG2.0 | HS3 | `HS3/compact-support-at-levels`, `HS3/huber-cohomology-comparison`, `HS3/classical-comparison`; ramified EL data rest on the gap. |
| Igusa varieties | HS2 | `HS2/minuscule-rigidification` is stated for every reductive group over Q_p, hence for Weil restrictions of products of GL_n, with the orientation [b] ∈ B(G, μ⁻¹); the identification with shtukas over the larger field is item (5) of the gap. |
| Global shtukas | HS3 | `HS3/general-bound-compactness`, `HS3/admissibility-duality-and-adjunction`. |

## The suggested Lean file

**It elaborates.** `lean-check` (that is `lake env lean` in the shared build at Mathlib 082e2d37 and Tau Ceti f7904748) exits with 0; its 999 messages are all "declaration uses `sorry`"; there is no error and no other warning.

**It agrees with the packet.** All 215 API items are declarations under the packet's names (`globalKernel.tensor` is an instance and `HckI.Bounded.«class»` is escaped), all 94 unit tests are `example`s under a comment line with the test's name, and every theorem, comparison and application node has a declaration carrying its id. A `run_cmd` over the environment, after renaming the examples to theorems, finds no placeholder inside the statement of any of 1404 constants: placeholders occur as bodies and proofs only.

**What the three readers found, and what changed.** They compared 727 declarations with the packet: 4 findings of high weight, 4 of medium and 34 of low weight, the last almost all clauses left out with no mark. No declaration had a wrong direction, shift, twist, index or order of composition. All findings are dealt with (60 edits, the file grows from 9521 to 9752 lines):

- High. `TwistedPeriodData.truncation` asked for a quasicompact map to Spd k, which no open of the base has, and embedded into a Grassmannian over the wrong base; it now takes an open with compact underlying space and embeds, as a locally closed immersion, into the Schubert variety over the reflex bases. `globalKernel.torsion` asserted a bound with no condition tying it to the kernel (the empty bound satisfied it); the support condition is now inside. `HckI.Bounded.nonsplit_test` and `TwistedPeriodData.GL2_collision_test` were instances of the theorems they test; the first is now the Weil restriction of G_m along a separable quadratic extension (a cocharacter that is not Galois-stable, with the degree 2 cover), the second states that the composition map is not injective on points over the twisted diagonal.
- Medium. The three statements comparing with étale sheaves in HS1 (`globalKernel.torsion`, `heckeOperator.torsion` and its test) took any Λ killed by a power of ℓ; the packet proves them for Λ = Z/ℓⁿ[√q], now the definition `Coeff.IsBaseTorsion` (no placeholder), and the bound no longer depends on the sheaf. `LatticeSpace.twoModels_test` assumed the index p + 1 it was meant to test; both level groups are now given explicitly. `admissiblePeriodTorsor.tate_module_test` says plainly that no clause of the packet test can be stated (no p-divisible groups in the interfaces). Clause (e) of `multiLegPeriodAndRepresentability` marks the equivariance it omits.
- Low. Clauses that were expressible are now stated, as nine new declarations (`structureGroupAndInnerForm_bounded`, `structureGroupAndInnerForm_kottwitz_bounded`, `HckI.BoundedLe.toHck_legs`, `HckI.BoundedLe.ofSplit`, `globalKernel.map_linear`, `heckeOperator.map_smul`, `FramedModification.idPoint_comp`, `shtukaKernel.torsion_sheaf`, `towerCompactSupport.ι_action_of_mem`) or as conjuncts (`classicalPeriodPoints` (e), five unit tests, `torusProductsAndDeterminant` (1)); `heckeOperator.geometricFibre` is now defined from `globalKernel.geometricFibre` with no placeholder; in `noLegsAndBasicDuality` the identification G(Q_p) = J_b̌(Q_p) is asserted to exist instead of being quantified over. The clauses that the interfaces cannot state are marked `-- Omitted:` with the reason: thirty new marks (121 before, 151 now).
- Not changed: `ShtukaDatum.isVSheaf` holds by typing, as its docstring says, because the sheaf condition is part of the type.

**A design choice the next reviewer should judge.** Notions that other roadmaps own (étale, proper, cohomologically smooth, lisse, ULA, split, basic and so on: 24 `MorphismProperty`, 11 `ObjectProperty`, 2 `Set`, 37 in all) are opaque declarations with the placeholder as body and the owner in the docstring; the header of the file says so. They are stand-ins for definitions that exist in the suppliers' plans, not conditions of this roadmap replaced by a proposition, and they let the statements of this roadmap be written as declarations and not as comments. If the rule of PROTOCOL.md section 13 is read to forbid them too, the 37 are the list to replace when the suppliers' definitions exist.

## Still open

- The 22 requests and 8 gaps, listed in the document; they are honest and unchanged in substance.
- Questions of the review for the orchestrator that this round cannot settle: SR.6 as a supplier of HS3 (2); latent cycles from packets of other roadmaps (3); the two node ids that no longer fit their content (5); whether the fourteen records of mistakes that repeat register entries stay (6: they stay, each names its register entry under `known`). The notes for owners of other roadmaps at the end of the review report still apply.
- Lemma-level refinement of every stage.

## Sources

- Fargues–Scholze, author-hosted file; Scholze–Weinstein, print-ready file; Howe–Klevdal, arXiv v2; Gleason–Lourenço, arXiv v2: fetched again on 8 October 2026, SHA-256 equal to the recorded values.
- Gleason–Lim–Xu, published PDF: the publisher's site answered with a challenge page on 8 October, so the recorded file of 7 October could not be fetched again; I read arXiv:2208.07195v3 for cross-checks by statement number. Page numbers of the published version are those the review verified.
- Dat–Helm–Kurinczuk–Moss, Hamann–Hansen–Scholze, Hamann–Imai: arXiv, fetched 8 October 2026; hashes in the packet.
- Not read: Astérisque 466 (the published Fargues–Scholze), the published Berkeley lectures, Hansen's paper on Harris's conjecture, Rapoport–Viehmann; the gaps say where their statements are needed.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/HeckeStacksAndLocalShtukas.json --index <declaration index of the pinned libraries>`: 0 errors, 0 warnings; status `complete`, 51 nodes, 215 API items, 94 unit tests, 22 planets.
- `python3 research/blueprint/intake.py check-files` on the four files of this job: 0 problems.
- The atlas built in memory with this packet (`merge_blueprints` of `scripts/blueprints.py`): 51 declarations, 22 planets, 5 layers, no link skipped.
- The document is the output of the generator on the final packet (byte for byte), and the port of the site's inline parser reports 0 differences on its 3616 lines.
- `lean-check research/blueprint/suggested/HeckeStacksAndLocalShtukas.lean`: exit 0, placeholder warnings only, as said above. The audit for placeholders in statements: 0 of 1404.
- `git diff --check`: clean.
