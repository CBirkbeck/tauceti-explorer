# Independent review: CohomologyComparisons (REV-CohomologyComparisons)

**Verdict: needs_changes.** The plan is sound at target level and every correction with a clear fix has been made in place, in the packet and in the suggested file. The verdict is not `accepted` for two reasons:

1. 55 nodes, 4 gaps, 10 requests and 6 source issues changed in fields that the reader `research/blueprint/readmes/CohomologyComparisons.md` mirrors verbatim. The reader is not a deliverable of this review, so promoting the packet now would publish a reader that contradicts it.
2. Three structural decisions belong to the owners and the maintainer (§3.4).

The revision round (`BP-CohomologyComparisons~2`) is mostly mechanical: regenerate the reader from this packet, then settle the items in §10.

Job `REV-CohomologyComparisons`, issue #372. Reviewer: Claude, session `claude-0gMhNi`, 7 October 2026. The blueprint was written by Codex, session `codex-mCCbxV` (BP-CohomologyComparisons, issue #697, PR #6804). This session did none of that work. Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Counts

| Item | Before | After |
|---|---|---|
| Nodes | 82 (2 definitions, 2 constructions, 54 theorems, 18 applications, 6 comparisons) | 82; none added or removed; 55 corrected, 27 verified, 0 unverifiable |
| Citations read at their locators | — | 83 of 83; 33 locators corrected; 83 excerpts replaced |
| Acceptance | 26 nodes with only a generic sentence | 26 nodes with concrete instances |
| API items / unit tests | 20 / 12 | 24 / 13 |
| Baseline declarations | 14 | 16 (14 confirmed, 2 added) |
| Requests | 51 | 46; every one carries a `review` scope note |
| Gaps | 13 | 14 (G-spreading-inputs added; 3 updated) |
| Source issues | 3 | 7 (E1–E3 confirmed, two of them corrected; E4–E7 added) |
| CP stages on a cross-roadmap stage cycle | 5 of 7 | 0 |
| `check_blueprint.py` | 0 errors, 0 warnings | 0 errors, 0 warnings |

Most of the work was in the source check, the supplier check and the graph. The submitted excerpts were almost all bare labels ("Theorem 14.3.", "Lemma 13.11."), and every `match` read "Statement and construction at the cited passage; hypotheses retained." Neither said what the source supports, so every citation was re-read.

## 1. Sources (item 1)

All eleven public sources were downloaded, and every SHA-256 matches the recorded value:

- BMS1 arXiv v3: printed page = PDF page.
- ČK v3, GR v3, Guo v1 (a v2 now exists with shifted pages), CN5, the Betts–Stix 2022 manuscript, Pan v1, CDN GPW5.
- BS22 v4, Scholze arXiv v2, and the erratum.

**Excerpts.** For each of the 83 citations the cited result was found, and a contiguous passage of at most 280 characters was copied. Each passage was checked by normalised substring search against the extracted text; formula-heavy ones were checked against the page image. It replaces the label excerpt, and a one-sentence `match` now says what it supports.

**Locators corrected (33).** The main errors were these:

- BMS1 §13 page ranges were one or two pages early. The cited ranges were pp.108–110 for Lemmas 13.11–13.13, pp.110–113 for Proposition 13.15/Corollary 13.16, and pp.105–106 for Definition 13.5. The correct ranges are pp.109–112, pp.112–113 and p.106.
- Theorem 14.3(i)–(iv) is on p.120, not p.119, and Example 4.24 is on p.41.
- `CP.1/hodge-tate-specialization` cited BMS1 Theorem 1.8, which has no Hodge–Tate specialization. The content is Theorem 8.3 (p.61) and Theorem 9.2(i) (p.69), with Proposition 6.12 and the proof of Theorem 14.1.
- BS22 Theorem 17.2 is on p.117 and §18 is on pp.122–123.
- ČK Remark 9.6 is on p.77 and Proposition 6.8 on pp.66–68.
- Guo Lemma 4.1.10 is on p.31.
- Pan Proposition 6.3.9 is on pp.100–101.
- The Enriques Remarks 1.2–1.3 were removed from `CP.2/crystalline-geometric-examples`, which they do not support.

Every change is in the node's review note.

**Statement corrections** (all marked in `review.checked`):

| Node | Correction |
|---|---|
| `CP.0/no-c-section-and-choice-transport`, `CP.3/descended-de-rham-lattice` | Perfect residue field restored. The continuous lift K→B_dR⁺ is unique only then (BMS1 Theorem 13.1 assumes it). For an imperfect residue field, lifts to B_dR⁺/ξ² form a torsor under Hom(Ω̂¹_{O_K},C(1)). |
| `CP.1/acris-specialization`, `CP.1/witt-crystalline-specialization`, `CP.1/mu-inverted-etale-specialization` | φ-compatibility and products were stated as source claims. BMS1 Theorems 12.1 and 14.3(i),(iii),(iv) state neither; they are now marked as targets. The E∞ form of §12.3 rests on an admitted lax symmetric monoidal Lη. |
| `CP.1/multiplicative-bockstein-coherence` | Coherent associativity and Frobenius compatibility are marked as targets beyond BMS1, which treats AΩ only as a commutative algebra in the derived category (footnote 3). |
| `CP.3/embedding-independence-and-reduction` | "Double embedding joining two smooth lifts" and "triple refinements" are not in Lemma 13.13 or Definition 13.14. They are replaced by the source's argument (strict transition maps, one chosen lift) and the comparison of two lifts is marked as packet-authored. |
| `CP.3/integral-rational-bdr-map-agreement` | BMS1 only says the agreement is checked "on the level of the explicit complexes". The tower verification is marked as reconstruction (gap G-map-agreement). |
| `CP.3/noetherian-approximation-interface` | Lemma 13.7's proviso "at the expense of enlarging Σ" restored. |
| `CP.3/relative-infinitesimal-site` | GR Definition 10.1: "a Zariski closed immersion U → T defined by a nilpotent ideal". |
| `CP.3/filtered-de-rham-comparison` | Scholze's Theorem 8.4 says only "preserving filtrations". Strictness comes from its proof (a quasi-isomorphism in the filtered derived category); the locator now cites the proof. |
| `CP.4/logarithmic-integral-diagram` | ČK §7.1's purely d-dimensional special fibre added. |
| `CP.4/uniformizer-change-and-monodromy` | ČK §9.1 treats only a change of torsor trivialisation (T↦T+log a, N=−d/dT). The sign must be translated from CR.6's formula ρ_{πu}=ρ_π∘exp(log_K(u)N), which uses CR.6's own convention; it is not "fixed by the CR.6/Fontaine convention N=−d/dT". |
| `CP.6/duality-and-cycle-class-compatibility` | The proper pushforward/Gysin clause is the packet's extension; Betts–Stix proves (6)–(7) only. |

The other checks found no discrepancy:

- ČK Theorems 7.9, 7.12 and 9.5.
- CN Theorems 6.2, 6.4 and 6.8 and Remark 6.10.
- GR Corollary 10.9, (36) and Theorem 10.13.
- BS22 Notation 18.1 and Theorem 18.2 (End = {1}).
- Betts–Stix Remark 3.21: the equality of a with the canonical period is indeed left unproved.
- BMS1 Theorems 2.1, 2.10, 14.5 and 14.6, Proposition 13.21 and Remark 13.22.

The CP.5 torsion and lattice nodes (`integral-torsion-length-inequality-over-C`, `lattice-recovery-over-C` with both tiers, `dvr-lattice-recovery-via-breuil-kisin` and `mod-p-de-rham-dimension-bound`) state the source's hypotheses exactly, including degree i+1. They were the strongest part of the packet. Remark 2.11's values (H¹_ét(H_C,Z/p) ≃ Z/p, H¹_dR(H_k) ≃ k⊕k) are verbatim. BMS1 §2.2 works over O_C; the ramified-O form is footnote 9.

**Acceptance.** 26 nodes had only the sentence "Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism." Each now has concrete instances, for example:

- the point and the torus;
- elliptic curves with good, ordinary, supersingular and Tate reduction;
- P¹ and abelian varieties with their ranks;
- D_dR(Q_p(1)) with its jump at −1;
- θ̃ versus θ on 𝔖→A_inf (u↦π versus u↦π^p);
- Σ={T} against Σ′={T,T²}.

These items are the reviewer's own and are marked as such in the node notes.

## 2. Baseline (item 2)

All fourteen `baseline.declarations` were opened in the pinned Mathlib source (`.lake/packages/mathlib` at 082e2d37), and each exists with the stated meaning:

| Declaration | Where | What the pin says | Citing nodes |
|---|---|---|---|
| `WittVector` | RingTheory/WittVector/Defs.lean:52 | structure of coefficient sequences | CP.6/pan-etale-site-truncated-comparison-map |
| `WittVector.fontaineTheta` | RingTheory/Perfectoid/FontaineTheta.lean:165 | `𝕎 R♭ →+* R`, the limit of `fontaineThetaModPPow` | CP.0/ainf-specialization-dictionary |
| `BDeRhamPlus` | RingTheory/Perfectoid/BDeRham.lean:77 | `AdicCompletion (ker fontaineThetaInvertP) (Localization.Away p)`, a CommRing; needs `Fact p.Prime`, `Fact ¬IsUnit p` and p-adic completeness; no field/DVR theorem | CP.0 dictionary |
| `BDeRham` | same file:90 | localization of `BDeRhamPlus` at the submonoid generated by single generators of ker θ | none |
| `PadicInt` | NumberTheory/Padics/PadicIntegers.lean:62 | elements of ℚ_[p] of norm ≤ 1 | none |
| `Module.length` | RingTheory/Length.lean:32 | ℕ∞-valued | CP.5 torsion inequalities |
| `Module.finrank` | LinearAlgebra/Dimension/Finrank.lean:62 | ℕ-valued `Cardinal.toNat` of the rank | CP.5/mod-p-de-rham-dimension-bound |
| `DerivedCategory` | Algebra/Homology/DerivedCategory/Basic.lean:87 | `HomologicalComplexUpToQuasiIso C (up ℤ)` | CP.2/rational-degreewise-comparison |
| `TensorProduct` | LinearAlgebra/TensorProduct/Defs.lean:71 | | CP.2 nodes |
| `IsAdicComplete` | RingTheory/AdicCompletion/Basic.lean:55 | Hausdorff and precomplete | none |
| `AdicCompletion` | same file:171 | compatible sequences in M/(I^n•⊤) | CP.3/infinitesimal-envelope |
| `AdicCompletion.isAdicComplete` | AdicCompletion/Completeness.lean:184 | needs `I.FG` | CP.3/infinitesimal-envelope |
| `AdicCompletion.eval_of` | Basic.lean:387 | `eval I M n (of I M x) = mkQ (I^n • ⊤) x` | CP.3/infinitesimal-envelope |
| `AdicCompletion.ext` | Basic.lean:314 | equality from equality at every level | CP.3/infinitesimal-envelope |

Every provision is accurate except `DerivedCategory`'s, which said one node "of CP.5" was "entirely about" it. That node is now `CP.2/rational-degreewise-comparison`; the text was corrected. `BDeRham`, `PadicInt` and `IsAdicComplete` are listed but cited by no node, which is harmless. Two declarations were added:

- `mathlib:WittVector.frobeniusEquiv` (Frobenius.lean:286; `WittVector.frobenius` at :221), for φ on A_inf and on W(k), cited by the dictionary.
- `mathlib:cyclotomicCharacter` (Cyclotomic/CyclotomicCharacter.lean:307), for χ_p, cited by the twist node.

No citation was removed.

## 3. Closure (item 3)

### 3.1 Stage cycles

I checked the stage graph that promotion actually builds: atlas `requires` and `stageEdges`, the links of accepted restructurings, and the cross-roadmap edges induced by every packet's node prerequisites. The handoff says it was checked acyclic, but it was not. Five CP stages lay on cycles, all closed by edges of this packet:

| Closing edge | Cycle | Fix |
|---|---|---|
| PR.7 → CP.3 (`relative-filtered-prismatic-agreement`) | CP.2/CP.3/CP.4 → R06.5 → PadicHodgeRegulators:L1 (D.1 packet) → PG.5 (RS-26) → PG.6 → P7 → PR.7 (PR.0 packet) → CP.3 | The node's parent moves to CP.6. It still realises CP.3, as the Pan adapters do. |
| R06.4 → CP.0 (`twist-frobenius-filtration-normalization`) | CP.0 → CP.2 → R06.5 → … → P7 → R06.3 → R06.4 (P7 packet) → CP.0 | R06.4 and R07.3 removed from the node, with R06.1 and `cyclotomicCharacter` cited instead. The CP.0 stage text makes CP.0 "the common source of conventions for R07", so the edge pointed the wrong way. CP.5/small-weight-integral-interface keeps R07.3 and R06.4. |
| packet `links` CP.6 → R06.6 | R06.6 → R11.5 → ShimuraVarieties V5 → V6 → V8 → ShimuraCompactifications C2 → T6:comparison (RS-32) → CP.6 (Pan adapters); and R06.6 → L1 → … → PR.7 → CP.6 | The link was dropped (promotion ignores packet links anyway). `returnInterfaces` and the restructure record the condition under which R06.6 may cite CP.6 (§3.4). |
| PR.8 → CP.4 (stage citation) | stage-level only, through PR.7 → PR.8 (the PR.8 packet's Laurent F-crystal nodes) | CP.4/log-prismatic-agreement now cites PR.8's comparison nodes: log-crystalline-comparison, log-de-rham-comparison, etale-comparison-over-ainf, semistable-aomega-comparison and log-hyodo-kato-isomorphism. None depends on PR.7. |

After these fixes no cycle passes through a CohomologyComparisons stage in the cross-roadmap graph that promotion draws. The node graph of the packet is acyclic. The only remaining chain needs an intra-PrismaticCohomology stage edge (PR.7 → PR.8), which promotion does not draw and which is not a cycle at node level. A supplier-check helper also reported a "CP.3 → T6:comparison → CP.3" cycle. It treated `realises` as the layer, but `scripts/blueprints.py:layer_of` places a node by its `parentStageId` (CP.6 for the Pan adapters), so that cycle is not drawn.

### 3.2 Supplier statements

Each of the 63 distinct cross-roadmap prerequisites was read in `data/atlas.json`, the new-roadmap definitions, the supplier packets and the accepted restructurings (RS-01, RS-05, RS-27, RS-02, RS-09). All exist and none is retired. The mechanical check is clean: every stage prerequisite has a request listing its consumer, and every `neededBy` entry cites its supplier. The scope check is not:

| Scope | Count | Suppliers |
|---|---|---|
| covered | 19 | AI.4; the 12 AI.6 nodes; CR.4; EDC.2:pairings; T6:log-sites; PR.5; PR.8 (stage text); R07.3 |
| partly | 41 | AI.0:integral, AI.0:period-comparison, AI.1, AI.2, AI.3, AI.5; A1, F0, R0, R3; R09.3, R09.6, R09.7; H1:formal-adic-comparison, H5; CC.2, CC.4, CC.8; CR.0, CR.1, CR.2, CR.3, CR.3:Frobenius-isogeny, CR.3:duality, CR.5, CR.6; E4, E5:animation; EDC.2:trace-purity, EDC.3, EDC.4; R07.1, R07.4; T6:comparison; P8:local-rational, R06.1, R06.2, R06.4; P3; PR.4, PR.6 |
| not covered | 3 | AdicSpacesPartII:R5, CrystallineCohomology:CR.7, PrismaticCohomology:PR.7 |

Each request now carries `review: {scope, missing, candidateNodes, by}`. `missing` quotes what the supplier lacks; `candidateNodes` lists that supplier's exact nodes for the consumers (72 per-consumer candidates in all). The most consequential gaps are these:

- PR.7 states the crystalline-lattice/F-crystal equivalence only for Spf O_K (BS22 Theorem 5.6). No PR packet defines analytic prismatic F-crystals or states GR Theorem 9.15.
- No CR node states BMS1 Proposition 13.21, and CR.3:Frobenius-isogeny is proper-only.
- CR.3:duality has no de Rham half.
- CR.6 states the uniformizer change in its own monodromy convention, and lacks the W(k̄),ℚ≥0 → W(k₀),ℕ descent and the h-descent/rigid Hyodo–Kato realizations.
- R5 is about sousperfectoid spaces and states none of BMS1 13.7–13.16.
- CR.7 has no elliptic slopes; CR.3 has them.
- PR.4 states only the syntomic c₁, not the prismatic or crystalline one.
- CC.8's comparison is not Pan22 Corollary 4.4.3.

Corrections made in place:

- R5 removed from both CP.3 approximation/spreading nodes. These BMS1 results are routed to CP.3 by the BMS1 extraction (route 8); their unsupplied inputs are the new gap G-spreading-inputs.
- F0 replaced by the accepted nodes `AdicSpacesPartII:R2/raynaud-theorem` and `R2/admissible-blow-up`.
- CR.7 replaced by CR.3 in the elliptic-examples node and dropped from the CN Theorem 6.4 node.
- `H5` replaced by the accepted node `H5/proper-comparison-3-7-2` in the CP.0 dictionary, and removed from two nodes that use nothing in it.
- `R0/smooth-toric-chart` cited for the toric charts.
- AI.0:period-comparison added to the dictionary, which uses the composites A→A_cris→B_dR⁺ and A[1/μ]→B_cris→B_dR, and removed from the μ-inverted node, which uses no period ring.
- Unused citations removed: E5:animation (smooth statement), E4 (site of thickenings) and PR.6 (singular boundary, which is PR.5's).
- The PR.7 request restated as a scope extension.
- The R09.7 request's finite-field Bertini item moved to G-counterexamples, because its listed consumers were CP.4/CP.6 nodes.
- Five requests removed (R5, F0, CR.7, E5:animation, PR.8), leaving 46.

Node-id swaps into packets that are themselves under revision (CR.0, CR.5, PR.0, AI.0/AI.6, EDC, PerfectoidShimuraVarieties) were not made. Their ids can still change, so they are listed as `candidateNodes` for the revision round.

### 3.3 Gaps

New gap: `G-spreading-inputs`. It covers the descent of a framed smooth affinoid to a discretely valued subfield and the deformation theory of proper flat formal schemes used in BMS1 Proposition 13.15.

Updated gaps:

- `G-primitive` now records FIX-RT-AREA-padic-1's settled order: P8:primitive after P8:local-rational, with the edge P8:primitive → CP.3, checked acyclic there. That stage is not yet in `data/atlas.json` or the reserved ids.
- `G-relative-filtration` records the PR.7 finding.
- `G-counterexamples` takes the Bertini input.

Coverage `remaining` lists were regenerated from the gaps by the packet's own rule (verified to reproduce the submitted lists before editing). All seven stages stay `planned`, none closed.

### 3.4 Structural items for the owners and the maintainer

- **A late CP.6 substage.** The Pan adapters (which consume T6:comparison) and the GR relative filtered adapter (which consumes PR.7) must sit in a substage after CP.6's core, proposed as CP.6:log-truncated. Until then R06.6 and AutomorphicGaloisRepresentationsPartII cannot cite CP.6 without a cycle. This sharpens restructure entry 1.
- **New owners.** Needed for: the Guo–Reinecke relative equivalence and GR Theorem 9.15 (a PrismaticCohomology extension downstream of PR.7's crystals); BMS1 §13's approximation and deformation inputs; finite-field Bertini; BMS1 Proposition 13.21 (no CR node); and de Rham trace/duality.
- **The P8:primitive stage** proposed by FIX-RT-AREA-padic-1.

## 4. Granularity (item 4)

The roadmap is planned at target level, and every target of CP.0–CP.6 has a node with its direct prerequisites. Under RS-01, CP.0 keeps the dictionary, the geometric adapters and the twist conventions. CP.5 keeps the geometric applications. Ten former nodes are preserved as supplier records and aliases rather than owned: Witt-vector coherence, the generic §4.2 module/complex lemmas and Proposition 13.21. The CP.3 supporting chain of BMS1 §13 (Definition 13.5 to Lemma 13.13, Proposition 13.15, Corollary 13.16, Definition 13.18, Theorem 13.19, Proposition 13.23; Lemma 13.4 is requested from R0) is present at target granularity. No proof was split into lemma nodes.

One coverage point is new. The AMMN extraction's route 7 (Theorem 7.13, the Colmez–Nizioł/Tsuji pullback square for smooth proper O_K-models) was accepted route by route in that extraction's review (its overall verdict is revise) and points at CP.2/CP.3, but it was not among the routed sources handed to BP-CohomologyComparisons. Nothing plans it.

## 5. API (item 5)

The four definition/construction nodes were checked against their uses. Four items were added, each serving a recorded use:

- `SpecializationDictionary.ker_theta` (ker θ=(ξ), ker θ̃=(ξ̃)), which the statement asserts but the API did not expose.
- `SpecializationDictionary.witt_frobenius` (w∘φ=F∘w), needed for the φ-compatible Witt specialization and lattice recovery. A use was added.
- `InfinitesimalEnvelope.map` (functoriality in the presentation), needed for the Σ⊂Σ′ refinement maps of Lemma 13.13 and GR's Čech nerves.
- `InfinitesimalEnvelope.lift` (universal property).

The CanonicalBdrCohomology and RelativeInfinitesimalSite outlines cover construction, functoriality, reduction, completeness/perfectness and independence. They are adequate.

## 6. Unit tests, suggested file and planets (item 6)

**Unit tests.** Each of the four definition/construction nodes has at least three tests that a plausible wrong definition fails:

- θ against Witt reduction on ξ;
- completion against quotient on Q[X] → Q;
- K_dR⁺ of P¹ with H¹ = 0;
- a thickening without a map to the base.

`SpecializationDictionary.test_mathlib_theta` was added: the standard dictionary's θ is Mathlib's `WittVector.fontaineTheta`. It pins the dictionary to the library, as RS-01 requires ("not an arbitrary package satisfying the desired comparison theorem").

**Suggested file.** The submitted file elaborated (14 admitted-proof warnings), but it typed only `SpecializationDictionary` and `InfinitesimalEnvelope`. The other 80 nodes, including the construction `CanonicalBdrCohomology` and the definition `RelativeInfinitesimalSite` with their API and tests, were comments marked OMITTED. Section 13 requires each definition with its API and tests, and each named theorem, under the packet's names.

The review completed the file in the imported-data pattern of the accepted `PrismaticCohomology.lean`:

- Coefficients come from Mathlib where it has them: A_inf = `WittVector p (PreTilt O p)`, θ = `fontaineTheta`, θ̃ = θ∘φ⁻¹ through `WittVector.frobeniusEquiv`, Witt reduction through `WittVector.map`, `BDeRhamPlus`/`BDeRham`, and `AdicCompletion` for the envelope.
- Objects no library has are owner-named placeholder carriers or imported-data structures, each with one specific placeholder value. Examples are formal schemes, rigid spaces, A_cris/B_cris/B_st, the site of thickenings, crystals, Hyodo–Kato/period data and the modular-curve tower.
- Every theorem is stated about those specific values. None quantifies over the structures.
- There is no axiom, and no `Prop`-valued placeholder; one the review had introduced for geometric connectedness was replaced by dim_K H⁰_dR = 1.
- Hypotheses a carrier cannot express are left out only where the statement stays true, and each docstring says so.
- The sign of the uniformizer change is existential (c = ±1), matching gap G-hk-conventions.

The result is 3,032 lines. `lean-check` at Mathlib 082e2d37 reports 411 admitted-proof warnings and no other warning or error. A name-coverage script finds every `declarationName`, API name and test name of the packet, with one exception: `CP6.habiro_and_trace_specialization_export`, an export interface with no separate statement, which the trailing inventory explains. Each node's `lean` field, gap G-lean-types and `validation.lean` record this. The reader's "Prototype and acceptance boundary" section is now out of date (§10).

**Planets.** 32 planets, at most six per layer; all are key definitions or named theorems named from the sources. "Hodge–Tate spectral sequence degeneration" (BMS1 Theorem 13.3(ii)) was added to CP.3. The CP.6 Pan planets follow their nodes into the late substage if it is created.

## 6a. Mistakes in the sources (item 6a)

| Id | Verdict | Notes |
|---|---|---|
| E1 (Scholze Prop. 3.7(i), erratum (1)) | confirmed | The quote is verbatim. The reason was corrected: the erratum cites Ribes–Zalesskii Example 5.6.9 for the counterexample rather than giving it, and says the paper's results are intact and the deleted point statements were unused. |
| E2 (Scholze's OB⁺_dR, erratum (3)) | confirmed in substance; corrected | The recorded quote ("First, the definition of OB+dR should be corrected as follows.") does not occur in the erratum. It was replaced by the erratum's own sentence. The locator was pp.2–3, now Definition 6.8 (arXiv v2 p.37) and erratum (3), pp.1–2. The kind is now error, since the author calls the definition wrong. |
| E3 (Betts–Stix Prop. 3.20(8)) | confirmed | The proof applies (2) and (7), which are stated for smooth proper varieties, to the non-proper total space V, and footnote 18 confirms that definition of c₁. arXiv 2204.13674 has only v1, which is identical on pp.26–28; the Annals text was not accessible. The proposed repair through the zero section of P(O⊕L) works. |
| E4 (ČK proof of Prop. 9.2, p.76) | added, confirmed, misprint | The proof writes RΓlog cris(𝒳k0/W(k0)) for the left side of (9.2.2), which is the 𝒴k0 complex. Harmless in Theorem 9.5. |
| E5 (Pan Prop. 6.3.9, p.101) | added, confirmed, misprint | The hypothesis k > i is missing. OB⁺_dR,k = OB⁺_dR/Fil^k (§6.3.7), so gr^i vanishes for i ≥ k while the target does not. The next sentence presupposes k > i, and the CP.6 node already has it. |
| E6 (CN5 Theorem 6.4, display (6.5), p.40) | added, confirmed, misprint | H^r_dR(X)^* should be H^r_{dR,K}(X)^*: over X = X_{K,C} the former is a C-space, not a filtered K-module. |
| E7 (BMS1 §4.4, p.43) | added, confirmed, misprint | 𝔖 = W(k)[[T]] carries a Frobenius *endomorphism*, not an automorphism, since T is not in the image. Not among PAPER-BHATT-MORROW-SCHOLZE-18/E1–E22. |

The source check also noted p.115 of BMS1 writing X_u ↦ [(X_u, X_u^{1/p}, …)] where [u^♭] is meant. This is a notational conflation rather than an error, so it is not recorded. The slip in the proof of Proposition 13.15 is already PAPER-BHATT-MORROW-SCHOLZE-18/E17. `sourceVersions` gained the ČK, Pan, CN and BMS1 copies read.

## 7. Library audit (item 7)

`data/library-coverage.json` has no CP entry. AUDIT-35 is accepted by REV-AUDIT-35 but not yet merged into it. It audits all seven CP layers and finds every one not built, with partial coefficient-level citations:

- `fontaineTheta`, `WittVector.frobenius`, `BDeRhamPlus`/`BDeRham`;
- `cyclotomicCharacter`, `DividedPowers`, `Module.length`;
- `WittVector.Isocrystal`, `continuousCohomology`.

The packet plans none of them again. It now cites `frobeniusEquiv` and `cyclotomicCharacter`, and the suggested file builds on `fontaineTheta`, `BDeRhamPlus`, `WittVector.map` and `frobeniusEquiv`. The packet's `libraryAudit.result` records this.

## 9. Checks (item 9)

- `python3 scripts/check_blueprint.py research/blueprint/packets/CohomologyComparisons.json` (pinned declaration index): 0 errors, 0 warnings, both before and after the review.
- The `sourceIssues` were validated with `scripts/check_errata.py`'s `check` on `{roadmapId, protocol, sourceIssues, sourceVersions}`.
- Stage-cycle and node-cycle checks were run as described in §3.1.

## 9a. Red-team findings (item 9a)

| Finding | Packet and document | Review |
|---|---|---|
| RT-AREA-padic-1/24 | G-primitive and restructure | Handled; the gap stays open. The response called the two proposed orderings unresolved, but FIX-RT-AREA-padic-1 (fixes.md /24) had already settled them: P8:primitive after P8:local-rational, because Scholze §5 uses Lemma 5.2's toric charts, with P8:primitive → CP.3. G-primitive and the restructure now say so. The stage is not yet in the atlas. |
| RT-AREA-padic-2/3 | G-primitive, consumer list | Handled; the gap stays open. The consumers in neededBy are the right ones: the CP.1 input package via AI.5, the CP.3 canonical comparison and Hodge–Tate degeneration, and the CP.4 semistable comparison. |
| RT-AREA-padic-2/4 | R07.4 request, G-kisin | Handled. The supplier check adds candidate nodes PR.7/breuil-kisin-evaluation and PR.7/kisin-functor-comparison. Neither gives BMS1 Proposition 4.34's B_cris⁺ comparison. |
| RT-AREA-padic-2/23 | PR.8 → CP.4, R07.3/R06.4 → CP.5, PR.4/EDC.3 → CP.6, CP.6 → R06.6 | Partly handled. The first three are prerequisites; PR.8 is now at node level. R06.4/R07.3 were also cited from CP.0, which closed a cycle, and were removed there. The declared CP.6 → R06.6 return closes a cycle while CP.6 holds the Pan and GR adapters; it waits for the late substage (§3.4). |

## 10. What the revision round must do

1. **Regenerate the reader** from this packet; it currently mirrors the submitted packet verbatim. The fields to resync are listed below; also the gaps G-primitive, G-relative-filtration, G-counterexamples and the new G-spreading-inputs, and the source issues E1, E2 and E4–E7.
   - The removed requests are AdicSpacesPartII:F0, AdicSpacesPartII:R5, CrystallineCohomology:CR.7, EnhancedDerivedSheaves:E5:animation and PrismaticCohomology:PR.8.
   - The changed requests are AI.0:period-comparison, R09.7, H5, CR.3, E4, R07.3, R06.1, R06.4, PR.6 and PR.7.
   - `CP.3/relative-filtered-prismatic-agreement` now belongs in the CP.6 section.
   - The reader's "Prototype and acceptance boundary" section, which describes two typed adapters, must describe the completed suggested file (§6).
   - The source register should give Guo v1's page numbers.
2. **Decide the CP.6 substage** for the Pan and GR adapters with the maintainer (§3.4). Only after that may R06.6 and AutomorphicGaloisRepresentationsPartII cite CP.6.
3. **Re-point prerequisites to supplier nodes** where the supplier packets settle: the `review.candidateNodes` of each request.
4. **Resolve the remaining citation/use mismatches.**
   - CR.5 is cited by CP.0's site node for the log→ordinary generic-fibre morphism, which is not in CR.5. CR.5's log-PD content is used in CP.4 through AI.6/CR.6.
   - T6:comparison is cited by CP.6/pan-completed-coefficient-and-flag-descent and pan-truncated-period-isomorphism, whose actual inputs are π_HT with affinoid-perfectoid preimages (PerfectoidShimuraVarieties S3), AI.3/P3 almost acyclicity and non-log B_dR,k⁺.
   - E4 is cited by CP.4/algebraic-beilinson-period-comparison, which needs hyperdescent (E2) and h-descent HK/de Rham.
5. **Plan the AMMN route.** AMMN Theorem 7.13 (route 7 of that extraction) should be planned in CP.2/CP.3, or the orchestrator should send it to a follow-up job.

| Node | Reader-visible fields changed |
|---|---|
| `CP.0/ainf-specialization-dictionary` | prerequisites, api, tests, source locator |
| `CP.0/formal-algebraic-analytic-dictionary` | acceptance, prerequisites |
| `CP.0/site-and-geometric-point-compatibility` | prerequisites |
| `CP.0/twist-frobenius-filtration-normalization` | proofSteps, acceptance, prerequisites, source locator |
| `CP.0/no-c-section-and-choice-transport` | statement, source locator |
| `CP.1/theta-de-rham-specialization` | acceptance, source locator |
| `CP.1/hodge-tate-specialization` | acceptance, source locator |
| `CP.1/witt-crystalline-specialization` | statement, acceptance, source locator |
| `CP.1/acris-specialization` | statement, acceptance, source locator |
| `CP.1/mu-inverted-etale-specialization` | statement, acceptance, prerequisites, source locator |
| `CP.1/prismatic-frobenius-pullback-comparison` | source locator |
| `CP.1/multiplicative-bockstein-coherence` | statement, acceptance |
| `CP.1/singular-and-completed-boundary` | prerequisites |
| `CP.2/residue-section-descent-adapter` | acceptance |
| `CP.2/rational-degreewise-comparison` | acceptance, source locator |
| `CP.2/period-invariants-and-admissibility` | acceptance |
| `CP.2/crystalline-geometric-examples` | proofSteps, prerequisites, source locator |
| `CP.3/very-small-affinoid-embedding` | source locator |
| `CP.3/infinitesimal-envelope` | acceptance, api |
| `CP.3/noetherian-approximation-interface` | statement, proofSteps, prerequisites, source locator |
| `CP.3/completed-smooth-lift` | acceptance, source locator |
| `CP.3/envelope-normal-form` | source locator |
| `CP.3/embedding-independence-and-reduction` | statement, acceptance, source locator |
| `CP.3/proper-formal-spreading` | proofSteps, prerequisites, source locator |
| `CP.3/canonical-bdr-cohomology` | acceptance |
| `CP.3/bdr-cohomology-finite-freeness` | acceptance |
| `CP.3/canonical-bdr-etale-comparison` | acceptance, source locator |
| `CP.3/descended-de-rham-lattice` | statement |
| `CP.3/filtered-de-rham-comparison` | proofSteps, source locator |
| `CP.3/hodge-de-rham-degeneration` | acceptance |
| `CP.3/hodge-tate-degeneration` | acceptance, source locator |
| `CP.3/integral-rational-bdr-map-agreement` | statement, source locator |
| `CP.3/relative-infinitesimal-site` | statement, acceptance, prerequisites |
| `CP.3/relative-cech-de-rham-comparison` | source locator |
| `CP.3/relative-infinitesimal-perfectness` | acceptance |
| `CP.3/relative-crystalline-infinitesimal-base-change` | acceptance |
| `CP.3/relative-filtered-prismatic-agreement` | parentStageId, acceptance |
| `CP.3/absolute-relative-infinitesimal-agreement` | prerequisites, source locator |
| `CP.4/logarithmic-integral-diagram` | statement, source locator |
| `CP.4/hyodo-kato-log-base-adapter` | acceptance |
| `CP.4/semistable-period-comparison` | acceptance |
| `CP.4/semistable-filtered-bdr-agreement` | acceptance, source locator |
| `CP.4/uniformizer-change-and-monodromy` | statement |
| `CP.4/log-prismatic-agreement` | prerequisites |
| `CP.4/semistable-geometric-examples` | source locator |
| `CP.4/proper-rigid-potential-semistable-comparison` | prerequisites |
| `CP.4/proper-rigid-c-period-comparison` | source locator |
| `CP.5/functorial-log-de-rham-lattice-export` | source locator |
| `CP.5/small-weight-integral-interface` | source locator |
| `CP.4/proper-curve-potential-period-interface` | source locator |
| `CP.6/duality-and-cycle-class-compatibility` | statement |
| `CP.6/geometric-arithmetic-export` | source locator |
| `CP.6/habiro-and-trace-specialization-export` | source locator |
| `CP.6/pan-graded-analytic-decompletion` | source locator |
| `CP.6/pan-etale-site-truncated-comparison-map` | prerequisites |

## 11. Questions for the orchestrator

1. **Regenerating the reader.** A review cannot edit `research/blueprint/readmes/CohomologyComparisons.md`, yet this packet's reader mirrors every statement. Please route `BP-CohomologyComparisons~2` to regenerate it from this packet (§10.1) before the next review. Or allow review jobs to resync the reader when they correct statements in place.
2. **The CP.6 substage.** Should the late substage proposed in restructure entry 1 (CP.6:log-truncated, holding the Pan and GR adapters) be created? R06.6's return cannot be declared until it is (§3.1, §3.4).
3. **P8:primitive.** FIX-RT-AREA-padic-1 settled its order, but it is still not a stage or reserved id, so G-primitive cannot close.
4. **New owners.** The Guo–Reinecke relative equivalence and GR Theorem 9.15 have no owner, nor do BMS1 §13's approximation/deformation inputs, finite-field Bertini, BMS1 Proposition 13.21 (no CR node states it) and the de Rham half of CR.3:duality. Each is recorded as a gap or request here. The supplier roadmaps need scope extensions or Part II cuts.
5. **AMMN Theorem 7.13.** Route 7 of the AMMN extraction (accepted at route level) points at CP.2/CP.3, but it was not in BP-CohomologyComparisons' instructions.

## Summary

REV-CohomologyComparisons reviewed Codex's complete target-level pass, which has 82 nodes over CP.0–CP.6. The verdict is needs_changes, with every clear correction made in place.

- **Sources.** All 11 sources match their hashes, and all 83 citations were re-read. The excerpts, most of which were bare labels, were replaced by verified passages, and 33 locators were corrected. Thirteen statements were corrected: missing perfect-residue-field hypotheses; claims BMS1 does not make (φ-compatibility, coherence); and reconstructions presented as source content.
- **Graph.** The packet closed stage cycles through PR.7 → CP.3, R06.4 → CP.0 and the declared CP.6 → R06.6 link. These are fixed, and the graph through CP is now acyclic.
- **Suppliers.** All 63 exist; 41 cover the need only partly and 3 not at all (R5, CR.7, PR.7). Each request now records what is missing, and a new gap was added.
- **Source issues.** E1–E3 are confirmed, with E2's quote corrected, and E4–E7 were added.
- **API, tests, planets.** Four API items, one Mathlib compatibility test and one planet were added.
- **Suggested file.** It went from 2 typed nodes to 81 of 82 and elaborates with admitted proofs only.

The reader must now be regenerated, and the CP.6 substage needs a decision.
