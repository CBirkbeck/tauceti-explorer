# Independent review: semistable AΩ and cohomological Breuil–Kisin descent, AI.6–AI.7

Job `REV-AInfCohomology--AI.6`, issue #339. Reviewer: Claude (Opus 5.5), session `claude-az7OcR`, 6 October 2026. This session did not write the input: the planning pass `BP-AInfCohomology--AI.6` was done by Codex, session `codex-KvLAhK` (PR #6721).

**Verdict: needs_changes, for one reason, and it lies outside the packet.** The reader document `readmes/AInfCohomology--AI.6.md` is not a file this review may edit. It was written from the packet as submitted, and it still states what the review found false or unsupported; an accepted packet goes live together with that document. The corrected packet by itself meets the conditions for acceptance: each of its 60 nodes is corrected or added and justified, every baseline citation is confirmed at the pin, and no contradiction is left inside it. The revision has one task, set out in the last section: regenerate the reader document from the corrected packet.

The packet stays `complete`, with AI.6 and AI.7 `planned`. That is the right status: 18 requests and 6 gaps remain, each stated precisely. Nothing here certifies an implementation.

## Counts

| Item | Input | After review |
| --- | --- | --- |
| Nodes | 55 (3 definitions, 15 constructions, 35 theorems, 2 applications) | 60 (4, 16, 38, 2): 55 corrected, 5 added, none removed |
| Source citations with a literal excerpt | 0 of 55 | 463 of 463 |
| Nodes with a changed statement / proof steps / prerequisites | | 49 / 55 / 51 |
| API items / unit tests | 58 / 55 | 103 / 76 |
| Baseline declarations | 15 | 34: the 15 confirmed, 19 added, none removed |
| Requests / gaps | 17 / 5 | 18 / 6 |
| Source issues | 2 | 14: the 2 confirmed, 12 added |
| Planets | 12 (six per stage) | 12, one moved |
| Suggested Lean file | exit 0; 103 declarations and examples, 28 with `sorry` | exit 0; 205 declarations and examples, 23 with `sorry`; no other warning |

The first pass over the 55 nodes and the top-level fields recorded 304 observations: 2 of high severity, 105 medium, 179 low and 18 informational. Every high and medium one was re-derived at the source before a correction was written. The corrected packet was then read again by two readers who had not seen the review's conclusions; they made 42 further observations (2 high, 18 medium, 22 low), which were checked at the sources and applied. They are listed in their own section below.

## How the review was done

Each node was read against the passage it cites and against the proof in the source, in the versions the packet records: Česnavičius–Koshikawa (CK), arXiv:1710.06145v3; Bhatt–Morrow–Scholze, *Integral p-adic Hodge theory* (BMS1) and *Topological Hochschild homology and integral p-adic Hodge theory* (BMS2), both as published in Publ. math. IHÉS; Bhatt–Scholze, *Prisms and prismatic cohomology* (BS22), arXiv:1905.08229v4. The passages the submission lists as unread were read as well: CK §§3.4–3.13, 3.26–3.29, 5.35–5.37 and 6.1–6.4. Every computational test and acceptance example was recomputed. Each excerpt in the corrected packet was checked by script to be a literal substring of the text extracted from the PDF.

## Corrections of substance

1. **Excerpts and locators.** All 55 excerpts were single words ("chart", "Frobenius", and the like). They are replaced by 463 literal quotations of at most 300 characters. All 55 locators changed. CK numbers paragraphs and results with one counter, and the packet called nine of them by the wrong name: 4.6, 4.20 and 7.5 are Corollaries, 5.16 a Proposition, 5.29 a Lemma, 5.44 a Remark, and 6.5 and 7.6 are paragraphs, not Propositions.
2. **The étale comparison was stated for quasi-compact quasi-separated 𝔛.** CK Theorem 2.3 is for proper 𝔛, and the statement is false without it: for the torus chart Spf O_C{t^{±1}}, reducing both sides to C along θ̃ gives H⁰ = C⟨t^{±1}⟩ on the left and H⁰ = C on the right. `etale-comparison` is restated for proper 𝔛, and properness is added to the nodes that inherit it (`etale-bdr-agreement`, `proper-perfectness`, `hyodo-kato-interface`).
3. **"Multiplicative" and "functorial" comparisons.** `log-de-rham`, `all-coordinates-map`, `absolute-crystalline` and `crystalline-de-rham-square` asserted that the semistable de Rham and crystalline comparisons are multiplicative and functorial. CK Theorem 5.4 asserts Frobenius-equivariance only, and CK says (p.58) that the map (5.38.4) is not a map of differential graded algebras. The claims are removed; `coverage.remaining` records that multiplicativity, and functoriality for maps that are not étale, are not proved in CK and are not planned.
4. **Completeness of the sheaf AΩ was asserted before it can be proved.** `aomega` claimed the derived ξ-adic completeness of AΩ and its independence of the site; CK proves these as Corollary 4.6 (with Remark 4.5) and Corollary 4.21, using Theorem 4.2 and Proposition 4.4, which the packet places downstream of `aomega`. The statement is now the added node `aomega-sheaf-completeness`, after `hodge-tate-comparison`.
5. **Proof routes that were not the source's.** Among others: `cohomological-bkf` (CK Theorem 7.4) uses the étale comparison and the de Rham specialisation, neither of which was a prerequisite; `rank-equality` (Corollary 7.5) was derived from the B_dR⁺ comparison, which CK does not use, and now follows CK through `log-de-rham`; `freeness-criterion` (Proposition 7.7) does not use the rank equality; `bdr-comparison` took finite freeness from CP.3, where CK takes it from Corollary 5.43 (Beilinson); `proper-perfectness` cited formal GAGA where CK uses the finiteness theorem for proper formal schemes over O_C; `hodge-tate-comparison` uses formal GAGA once, for (4.11.1) only.
6. **Completions.** Several nodes cited `EnhancedDerivedSheaves:E4` for completions that CK takes termwise and classically (the divided power envelope D_{Σ,Λ}, the all-coordinates complexes). E4's statements are derived completions over one ring on a replete topos; 𝔛_ét is not replete. Those nodes now say that their completions are classical and termwise, and the request to E4 is limited to the completed extension of scalars that CK does use.
7. **False API items and tests.** `allCoordinates.single`, `logExactification.single` and `allCoordinatesPD.single` asserted that a one-element coordinate set recovers the single-chart constructions; CK requires Λ to cover the components of the special fibre and the formulas do not reduce in that way. They are replaced, and 45 API items and 21 tests are added (22 and 10 of them in the added nodes) where a definition could not be used, or a wrong definition would not have been caught.
8. **AI.7: what the sources prove, and what they do not.** BMS2 Theorem 11.2 and BS22 Theorem 1.8 give the three base changes of Breuil–Kisin cohomology. That they agree with the A_inf, de Rham and crystalline comparison maps of AI.4–AI.5 is stated in no source. Six nodes asserted that agreement as proved. It is now stated as the open part of the target in `trace-prismatic-agreement` and `comparison-diagram-agreement`, and recorded in the gap `G-MAPS`. BS22 Theorem 18.2 was applied to functors on smooth O_K-algebras, outside its domain; the step is removed.
9. **AI.7: other corrections.** BMS1 Lemma 4.30 proves flatness of f only; faithful flatness and topological freeness are asserted in BMS2 Notation 11.1, and `flat-coefficient-extension` now says which is which and proves the rest. `ainf-base-change` and `perfect-cohomological-modules` each depended on the other; perfectness is now proved by the sources' route. `de-rham-base-change` and `crystalline-base-change` need no completion. `nygaard-nondescent` is restated with its two cases; the source's argument is complete in one of them (source issue `E-AI6-13`). The dictionary between this packet's θ_𝔖, θ̃_𝔖 and the name θ_𝔖 in `R07.4` is written into `coefficient-normalization`.
10. **Hypotheses.** The common hypothesis block now fixes the embedding p^Q ⊂ C for all primes ℓ and the system ε as CK does, and takes K complete and discretely valued in the arithmetic statements (BMS2 Notation 11.1 omits "complete"; see the source issues).
11. **Prerequisites and owners.** `AInfCohomology:AI.0` is replaced throughout by its leaf `AI.0:integral`, as the accepted restructuring RS-01 requires; the period-ring facts are cited from the three nodes of `PadicHodgeTheory:R06.1` that state them; `AdicEtaleGeometry:A1` and `AdicSpacesPartII:R3` are added where CK uses Huber's results and the comparison of coherent cohomology with the generic fibre. The stage graph of `data/atlas.json`, with the accepted restructurings and link maps, has no cycle through the 38 cross-stage edges of the corrected packet, and the node graph has none.
12. **Field shapes.** `restructure` and `upstreamNotes` were not in the shapes of PROTOCOL §9–10. The submission proposed a new roadmap "AdicSpaces Part II"; a roadmap `AdicSpacesPartII` already exists, and its layer F0 plans formal GAGA for noetherian adic rings. The proposal is now a rescoping of that layer.

The per-node notes in the packet's `review.checked` say what was read and what was changed for each node.

## Nodes added

| Node | Content | Why |
| --- | --- | --- |
| `AI.6/structure-sheaf-edge` | CK Proposition 3.8, Lemma 3.12, Theorem 3.9, Remark 3.10 | The local analysis for the structure sheaf is used by `nonintegral-annihilation` and `hodge-tate-comparison` and had no node. |
| `AI.6/aomega-sheaf-completeness` | CK Remark 4.5, Corollaries 4.6 and 4.21 | See correction 4. |
| `AI.6/finite-level-acris` | CK §§3.26–3.27, Proposition 3.29, §5.35, Proposition 5.36: the rings A_cris^(m)(R) and A_cris^(m)(R′_∞) | Seven nodes cite them; they were attributed to suppliers that do not state them. The absolute rings are those of BMS1 Lemma 12.8 and are cited from AI.4. |
| `AI.6/bdr-cohomology-etale-embeddings` | CK §§6.2–6.4, Lemma 6.3.8 | The étale-topology variant of the B_dR⁺-cohomology and the embeddings with non-unit coordinates are what §6.5 builds on. |
| `AI.6/de-rham-lattice-functor` | CK §§8.2–8.6: T ↦ M(T) and the lattice (M(T)_dR)^G | The functor occurs in the statement of CK Theorem 8.7 (`model-independent-lattice`) and had no node. |

Each carries `"addedBy": "REV-AInfCohomology--AI.6"`, sources with literal excerpts, and, for the definition and the construction, API items and at least three tests.

## Baseline

All 15 declarations were read in the pinned Mathlib (082e2d3) and exist as cited. None was removed. One needed an explanation: the nodes use the minimum of a finite family, and `Finset.min'` is generated at the pin by `@[to_dual]` from `Finset.max'`, so it has no entry in the declaration index; the citation of `Finset.max'` is kept and says so. 19 declarations were added, each read at the pin, for what the corrected nodes and the suggested file use: `AdicCompletion.evalₐ_of`, `AdicCompletion.liftRingHom`, `IsAdicComplete.liftRingHom`, `AdicCompletion.isAdicComplete`, `PowerSeries.expand`, `PowerSeries.HasSubst.X_pow`, `PowerSeries.coeff_subst_X_pow`, `PowerSeries.constantCoeff_subst_X_pow`, `PowerSeries.substAlgHom_X`, `WittVector.frobeniusEquiv`, `WittVector.fontaineTheta`, `PreTilt`, `PreTilt.untilt`, `WittVector.teichmuller`, `WittVector.map`, `Module.FaithfullyFlat.zero_iff_lTensor_zero`, `Module.FaithfullyFlat.lTensor_bijective_iff_bijective`, `Module.equiv_free_prod_directSum` and `Module.equiv_directSum_of_isTorsion`. Three of the original entries (`DerivedCategory`, `DividedPowers`, `DividedPowerAlgebra`) are cited by no node; they record what Mathlib has and why it does not supply the envelope or the derived tensor product, and are kept as that. The library audit is unchanged in substance: nothing the audit shows in the libraries is planned as a new node.

## Requests, gaps and restructuring

- **Requests.** Each of the 18 now names the results it needs by source label, and its `neededBy` list is computed from the prerequisites. Changes of owner: `AI.0` to `AI.0:integral`; the stage-level requests to `PrismaticCohomology:PR.3` and `EnhancedDerivedSheaves:E1` are replaced by citations of the nodes that state what is used; new requests go to `AdicEtaleGeometry:A1`, `AdicSpacesPartII:R3` and `EnhancedDerivedSheaves:E4`; BMS1 Lemmas 12.2 and 12.8 (the rings A_cris^(m)) are asked of `AI.4`, whose sources they are, not of `CR.0`; Kato's 4.8 is asked of `CR.5`, where its users are.
- **Gaps.** `G-GAGA` is restated as three exact statements over a rank-one valuation ring (formal GAGA, CK Theorem 4.12; finiteness of coherent cohomology; the comparison used in CK Remark 4.19) with the node that needs each. `G-INPUTS` is new: external results that CK and the nodes use and for which no supplier was found, each with the node that needs it; among them base change of log crystalline cohomology along W(k₀) → W(k̄), which `hyodo-kato-interface` needs and CK does not state, and Ax–Sen–Tate for a general complete discretely valued K (the supplier node states it for K finite over Q_p). `G-CURVE` is now owned by `nodal-conic`, whose computation is written into the node. `G-MAPS` is extended as in correction 8. The two Lean gaps describe the suggested file as it now is.
- **Restructuring.** Two proposals: extend `AdicSpacesPartII:F0` to rank-one valuation rings (correction 12), and show AI.6 as three sub-layers, which changes no stage id.

## Source issues

| Finding | Source | Verdict | Check |
| --- | --- | --- | --- |
| `E-AI6-1` | BMS1 §4.4, p.280 | confirmed | "Frobenius automorphism" of 𝔖; the map is not surjective. `known` set to new: BMS2 is not a correction of BMS1. |
| `E-AI6-2` | BMS2, proof of Theorem 11.2, p.306 | confirmed | TC⁻(A;Z_p) for TC⁻(A/𝕊[z];Z_p). Already in the register as `PAPER-BHATT-MORROW-SCHOLZE-19/E12` (question 7). |
| `E-AI6-3` (added) | CK §6.3, p.62 | confirmed | Σ printed where the index set is Ψ. |
| `E-AI6-4` (added) | CK footnote 18, p.61 | confirmed | T₀ missing from the list of variables. |
| `E-AI6-5` (added) | CK §7.2, p.68 | confirmed | "(2.3)" for (2.3.1). |
| `E-AI6-6` (added) | CK Question 7.13, p.72 | confirmed | A subscript k is missing on the special fibre. |
| `E-AI6-7` (added) | CK, proof of Proposition 3.33, p.24 | confirmed | "Z[[T]]-flat" for Z_p[[T]]-flat. |
| `E-AI6-8` (added) | CK §4.15, p.30 | confirmed | 𝒳 for its base change to O_C. |
| `E-AI6-9` (added) | BS22 §15.2, p.105 | confirmed | "[BMS19, Proposition 11.5]" for Proposition 11.15. |
| `E-AI6-10` (added) | BMS2 Notation 11.1, p.298 | confirmed | "complete" omitted from the hypotheses on K. |
| `E-AI6-11` (added) | BMS1 §4.1, p.265 | confirmed | The map 𝔖 → A_inf is said to send T to [π^♭]^p, without the Frobenius on W(k) that makes the diagram commute. |
| `E-AI6-12` (added) | CK, proof of Theorem 3.9, p.13 | confirmed, kind gap | The proof checks a statement about M/M[ζ_p−1] where the criterion it applies needs M/(ζ_p−1)M. The repair is in the entry. |
| `E-AI6-13` (added) | BMS2 Remark 11.16, p.307 | confirmed, kind gap | The argument that the Nygaard filtration does not descend offers an elliptic curve with j outside W(k)[π^p]; for K unramified that subring is all of O_K and no such curve exists. The conclusion holds; `nygaard-nondescent` proves both cases. |
| `E-AI6-14` (added) | BMS2 Notation 11.1, p.298 | confirmed, kind gap | Faithful flatness and topological freeness of 𝔖 → A_inf are referred to BMS1 Lemma 4.30 and its proof, which give flatness only. Both hold; `flat-coefficient-extension` proves them. |

The first eleven are misprints that affect nothing. The last three are gaps in proofs; in each the stated result is true. The register of this repository, the arXiv histories and the publishers' pages were searched for corrections; none was found. The published text of CK could not be read, so its seven entries are scoped to arXiv v3.

## Red-team finding RT-AREA-padic-2/13

The finding asks for the link `CohomologyComparisons:CP.3 → AInfCohomology:AI.6`; its verifier adds that AI.6 keeps CK's properness, the semistable and logarithmic hypotheses and the comparison of topologies. The packet gets it right: the link is in `links` with its reason, CP.3 is a prerequisite of the three nodes that use the B_dR⁺-cohomology of the generic fibre, and the request to CP.3 names the results of BMS1 §13 by label. The comparison of topologies (CK §§6.2–6.4) was missing and is now the node `bdr-cohomology-etale-embeddings`. The reader document also has the link (its conventions paragraph and the section on the comparison map). It names the finding inside a node's section; the packet no longer does.

## Suggested Lean file

The submitted file typed the chart ring, the monomial indices at one level, the polynomial log derivations, the power-series part of the coefficient normalisation and a matrix test, and listed the other 51 declarations in a comment. That choice is kept, for a reason the review of `PrismaticCohomology--PR.0` made clear: a Lean theorem about AΩ quantified over invented carriers checks nothing, and the earlier stages AI.0–AI.5, which will define the period sheaf and AΩ, have no suggested types yet. What could be stated honestly at the pinned Mathlib was added:

- `chartRing`: both halves of the universal property (`lift`, `liftCompletion`, `liftCompletionOfFamily`) and the test `restricted`;
- `monomialExponents`: `transition`, the exact `level`, the Δ-weights `weight`, with their lemmas and the test `level_weight`;
- `logDerivations`: `commute`, preservation of the chart ideal, the derivation `onQuotient` of the chart quotient, and the action on monomials (`apply_toMonomial`);
- `rootTower`: compatible systems of roots, the uncompleted levels, the transition maps, and the non-flatness test as four statements;
- `coefficientNormalization`: the maps g, f, θ̃_𝔖, θ_𝔖 and the two θ-squares, stated with Mathlib's `WittVector.fontaineTheta` and `PreTilt`. The pinned Mathlib has no topology on these rings, so g and θ̃_𝔖 are declared by their values on generators and their uniqueness, under the hypothesis that π is nilpotent modulo p, with `sorry` as body; the squares and `eisenstein_mem` are proved from those;
- the ramified example ℤ_p[π]/(π^p − p) behind `nygaard-nondescent` and `de-rham-torsion-divisibility`.

The file has 205 declarations and examples, 182 of them proved; of the 28 `sorry` of the submitted file 24 are now proofs. The inventory at the end is generated from the corrected packet: all 60 declarations with statement, API items, tests and prerequisites, under the packet's names. 17 of the 103 API items and 18 of the 76 tests are Lean declarations or labelled examples; the inventory marks them. Three nodes (`root-tower`, `nygaard-nondescent`, `de-rham-torsion-divisibility`) have `lean.status` "partial": only an algebraic core is typed.

Typing the packet found nothing wrong in the numbers of its tests.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/AInfCohomology--AI.6.json` with the pinned declaration index: 0 errors, 0 warnings.
- `check_issues` and `versions_checked` of `scripts/check_errata.py` on the packet's 14 `sourceIssues` and its `sourceVersions`: no error.
- Excerpts: every one of the 463 is a whitespace-normalised substring of the extracted source text, has no control character and at most 300 characters.
- Cycles: none in the node graph; none in the stage graph with the packet's 38 cross-stage edges added.
- `lean-check research/blueprint/suggested/AInfCohomology--AI.6.lean` (Mathlib 082e2d3, Lean 4.34.0-rc2): exit code 0; 23 warnings, all "declaration uses `sorry`"; no error. The file imports Mathlib only.
- Atlas build (`assemble(require_distances=False)`) on a scratch copy of `data/blueprints/` with the corrected packet and the present reader added: it completes without error.
- A second reading of the corrected packet by two readers who had seen none of the review's conclusions; see the next section.

## The second reading

Two readers were given the corrected packet, the sources and the protocol, and not the review's findings. They made 42 observations. All were checked and, where right, applied; the per-node notes mark them "After a second reading". The ones of substance:

- **Galois action.** `model-independent-lattice` (CK Theorem 8.7) uses H^i_Ainf as a Breuil–Kisin–Fargues G_K-module and the G_K-equivariance of the étale comparison. No node stated either: `aomega` had functoriality for O_C-morphisms only, as CK §7.2 does, while CK §8.1 takes the semilinear action from it. `aomega` now has the semilinear functoriality over automorphisms of O_C, `etale-comparison` its naturality for them, and `cohomological-bkf` the compatibility with Frobenius.
- **`hyodo-kato-interface`.** Base change along W(k₀) → W(k̄) was stated as part of the theorem; CK has only its consequence (8.8.1) on Galois invariants. It is now marked as not in CK and recorded in `G-INPUTS`; CK Proposition 9.2 is stated in place of two sentences of instructions.
- **CK Proposition 5.36** was requested from `AI.0:integral`, a stage that precedes the rings it is about. It is CK's own lemma and is now part of `finite-level-acris`, with the rings for an arbitrary affinoid perfectoid cover.
- **A removed claim that was still used.** `crystalline-de-rham-square` needs the local multiplicativity that CK does prove (proof of Proposition 5.41, by BMS1 Lemmas 6.13 and 7.5); `log-de-rham` now says exactly what is and is not asserted, and AI.1 is a prerequisite of the square.
- **Prerequisites that did not match the proofs** in fourteen nodes (missing `finite-level-acris`, `AdicEtaleGeometry:A1`, `R07.4/bk-coefficient-rings`, supplier nodes for BMS1 Theorem 4.4; unused AI.4, AI.5, R07.4), and three proof steps that said "no supplier" of inputs whose supplier was listed.
- **Two tests of `ainf-chart-lift`** used `monomial-splitting`, which depends on it; they are restated, and one computation moved.
- **`root-tower`**: R□_m was called free over O_C; it is a p-adically completed direct sum.
- **Two source gaps** found and silently repaired by the packet are now recorded: `E-AI6-13` and `E-AI6-14`.
- **`comparison-diagram-agreement`** clause (a) used naturality and multiplicativity of the comparison AΩ_R ≃ φ_A^*Δ, which `ainf-base-change` calls unproved; the clause now says so.

Not applied: the proposal to delete `upstreamNotes` (the author's note to the maintainer about the scope of the Tau Ceti roadmap AdicSpaces is kept, in the protocol's shape), and the proposal to drop the hypothesis "quasi-compact and quasi-separated" from `crystalline-base-change` and from the Frobenius isogeny in `cohomology` (true, but the supplier nodes state these for affine or qcqs 𝔛, and the nodes follow their suppliers).

## Not checked

- The papers CK, BMS and BS22 cite for their inputs (Beilinson, Kato, Huber, Scholze, Fujiwara–Kato, Ullrich, Tsuji) were not opened beyond the statements quoted; requests and gaps name those results by the labels the citing paper gives.
- The published version of CK (Compositio Math. 155 (2019), 2039–2128) could not be read; the numbering is that of arXiv v3, the latest version. BS22 was read in arXiv v4, not in the Annals.
- Supplier packets were read only for the statements cited. Some are not yet accepted (`PrismaticCohomology--PR.0` and `PadicHodgeTheory--P7` among them); the citations are to node ids and will need a look when those packets change.
- Whether Beilinson's base change theorem (1.11.1) covers the map of log bases W(k₀) → W(k̄) (identification (iii) of `hyodo-kato-interface`).

## Questions for the orchestrator

1. **Reader document.** See the next section. Can the revision be given the reader document as a deliverable, or the reader be regenerated from the packet at intake?
2. **Formal GAGA over rank-one valuation rings.** Is `AdicSpacesPartII:F0` the owner (the `restructure` proposal), or should a layer be added after it?
3. **`R07.4`.** AI.7 needs the category of BMS1 Definition 4.1 (finitely generated 𝔖-modules, not necessarily free), which is wider than the stage's finite free Kisin modules of bounded height; the accepted restructuring RS-02 keeps R07.4 as it is (coefficient rings and classification functors) and names AI.7 a consumer. Should R07.4 widen, or AI.7 own the category?
4. **`EnhancedDerivedSheaves:E4`.** The completed extension of scalars between rings with ideals is requested there. E4's completions are stated on replete topoi; the étale site of a formal scheme is not replete. Who owns completions of sheaves of complexes on 𝔛_ét?
5. **AI.5's linear algebra over A_inf.** The nodes that state BMS1 §4.2 sit in the CohomologyComparisons packet under `CohomologyComparisons:CP.5` ids, marked as supplier material of AI.5. CP.5 consumes AI.6, so AI.6 cannot cite them by node without a cycle; it requests them from the stage AI.5. Should those nodes be re-homed under AI.5?
6. **Multiplicativity.** No semistable comparison in AI.6 is multiplicative as planned (correction 3). A consumer that uses cup products through these comparisons (CP.4 is the likely one) needs an argument in the style of BMS1 §12.3; it is not planned anywhere.
7. **Duplicate source issue.** `E-AI6-2` and `PAPER-BHATT-MORROW-SCHOLZE-19/E12` are the same misprint; the register will count it twice unless one is merged into the other.
8. **`E-AI6-12`.** A gap in the proof of CK Theorem 3.9, with a repair. It is for the maintainer to decide whether the authors hear of it.
9. **AI.3.** The stage text takes ν to the Zariski site of the formal model; CK needs the étale site. The request says so; the stage description may want the same.
10. **AI.4 and the rings A_cris^(m).** They are defined in BMS1 Lemma 12.8, among AI.4's sources, and AI.4 has no packet yet. `finite-level-acris` recalls the definition and adds CK's relative rings. When AI.4 is planned, the absolute rings should be its node and this node should cite it.
11. **`PadicHodgeTheory:R06.1`.** Its nodes for Ax–Sen–Tate and Tate–Sen are stated for K finite over Q_p; CK §8 needs a complete discretely valued K with perfect residue field. Should those nodes be stated in that generality?
12. **`E-AI6-13`, `E-AI6-14`.** Two gaps in BMS2 (Remark 11.16, Notation 11.1); both conclusions are true. As for question 8.

## What the revision has to do

Regenerate `readmes/AInfCohomology--AI.6.md` from the corrected packet. Nothing else is asked.

- **Declaration register.** The section of every node: 49 statements, all proof outlines, 51 prerequisite lists and all source lines changed, and 45 API items and 21 tests are new. Sections are missing for the five added nodes.
- **Statements that are false or unsupported as the reader now has them** (line numbers of the reader on `main`): the étale comparison "for qcqs 𝔛" (l.888); "multiplicative" or "functorially and multiplicatively" for the semistable comparisons (ll.408, 413, 641, 711, 746, 767); AΩ "ξ-derived-complete" in the section of `aomega` (l.327); the B_dR⁺ comparison proved from "CP.3 finite freeness" (l.871); the equivalence of the trace complex with Δ_{R/𝔖} "compatible with the specified A_inf, de Rham and crystalline maps" as a proved statement (l.1245).
- **Overview paragraphs** ("Conventions and ownership", "AI.6", "AI.7") and the closing sections on requests, gaps and sources: bring into line with the packet's `requests`, `gaps`, `restructure` and `sources`.
- **Register.** The reader names the red-team finding inside a node's section (l.857); the packet keeps such remarks out of node text.
