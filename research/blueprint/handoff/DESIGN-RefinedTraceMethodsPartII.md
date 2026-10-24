# DESIGN-RefinedTraceMethodsPartII — Refs #3387

Agent: Codex. Session: codex-XwnVxb. This is a completed design pass for independent review, not a checkpoint or an implementation.

The claim was confirmed by the swarm bot (comment 6262383607). The five deliverables are the roadmap definition, complete packet, reader document, suggested Lean file and this handoff, all named RefinedTraceMethodsPartII except the handoff's DESIGN prefix.

## Completed scope

The three henselian-pair briefs are combined into one dependency graph. Its main theorem is finite-coefficient henselian invariance of the fibre of the cyclotomic trace. The graph includes intrinsic nonunital henselian algebra, finite-coefficient TC continuity, projective pseudocoherence and its rigidity criterion, finite approximations of K and TC, Cartier defects, arbitrary-pair rigidity, F-finite adic continuity, pro logarithmic comparisons, étale comparisons and quasisyntomic K-theory consequences.

The packet has 79 nodes: eight definitions, six constructions, 61 theorems, two comparisons and two applications. It records 70 API items, 44 discriminating unit tests, 40 planets and eight pinned-library declarations. Every implementationStatus is unchecked. All ten stages HP.0–HP.9 have status planned. There are no recorded gaps and 15 open supplier contracts; no stage is claimed closed.

The sourceRouting ledger accounts for all 98 routed items individually: 83 CMM henselian items, nine CMM tower items, four BMS2 items and two BS22 items. The independent CMM §5.2 tower direction has a precise split proposal with three layers QT.0–QT.2 under RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses. This assigns its definitions, continuity targets, hypotheses, source corrections, imports and acceptance examples. The maintainer must apply that proposal and reconcile it with the AMMN route; this submission does not create a second roadmap or claim a second job. HP.6 retains arbitrary-ideal F-finite continuity.

## Boundaries and remaining work

Independent review should verify the statements and proof routes, the source corrections, all supplier contracts, and the proposed tower split. Each coverage record names its direct unresolved suppliers. The packet's requests give their full mathematical statements and consuming node ids; the reader reproduces them. Supplier resolution precedes implementation.

The 15 requested interfaces belong to:

- EnhancedDerivedSheaves:E3 — algebraic theories, discrete resolutions and the connective-spectrum bar adjunction.
- StableHomotopyKTheory:H.5:spectra and H.6 — uniform finite-cell/Postnikov estimates and the countable Mittag–Leffler criterion.
- RefinedTraceMethods:RT.2 and RT.3 — strong monoidality of triv, Brun's THH change-of-rings spectral sequence and generic higher Goodwillie approximation. The specific suspension–loop tower is a target here.
- DeformationAndDerivedPatchingAlgebra:R03.1 and R03.3 — completion/pro-Tor, including varying quotient coefficients, and excellent F-finite henselization/regular completion models.
- CrystallineCohomology:CR.4 — classical logarithmic Witt interfaces for singular rings and complete/pro-thickening inputs. Existing regular-only targets do not cover these extensions.
- KTheoryFiniteLocalFields:L.6 — finite-coefficient regular-local Geisser–Levine, integral p-torsion-freeness and symbol compatibility. The existing completed statement is insufficient.
- GeneralAlgebraicKTheory:K.2:low-degree-comparisons and K.7 — many-units/w-local low-degree comparisons and multiplicative Steinberg symbols.
- SchemeAndStackFoundations:SF.2 — the all-p-primary-sheaf cohomological-dimension criterion, TC Postnikov descent and w-local refinement.
- SchemeKTheoryOperations:S.4 and S.6 — étale Postnikov K-theory/descent and the integral perfect-ring Adams consequence.
- DerivedDeRhamCohomology:DD.5 — the w-local quasiregular semiperfectoid basis with p-divisible units and correctly completed Čech terms.

Existing nodes are cited wherever their statements suffice. Ordinary Hochschild complexes and elementary K-zero constructions retain their DGAInfinity and GrothendieckEulerForms ownership. Current Tau Ceti already has ordinary henselian idempotent lifting. HP.3 obtains projective-module lifting using the smooth idempotent-matrix scheme and SF.0/henselian-smooth-lifting. It does not re-plan ordinary idempotent lifting.

RT.3's unproved henselian trace-square export should import HP.5/henselian-trace-rigidity. This packet does not import that export. The HP.6 converse implication from continuity to rigidity is not used to prove rigidity. These avoid proof cycles.

## Sources and version checks

Read CMM arXiv:1803.10897v2, §§1–6 relevant to these targets, including §5.2 for the split boundary; checked the journal copy at the source-issue locators. Read BMS2, §§7–8 at the listed statements; BS22 arXiv v4, §14; Morrow's logarithmic Hodge–Witt paper at Proposition 2.20 and Corollaries 4.1–4.2, 4.8; Bhatt–Lurie–Mathew at the strict Dieudonné completion and filtered-colimit results; van der Kallen's stable-range theorem and proof; and Dundas–Morrow's pro-Tor, finiteness, continuity and pro HKR inputs. The source ledger gives exact versions, URLs, page ranges and hashes.

BS22 was read in the maintainer-cleared library in place. No private source file or passage is included. No required source is missing for the design pass. The open supplier statements are requests to their existing owners, not assertions that their libraries are implemented. The 13 inherited source findings were checked at their locators and recorded in original prose; the limited version/corrigendum search found no separate published correction. Their independent review is still required.

The baseline audit and supplier statements were read. Mathlib is pinned at 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti at f790474821cf4256814db967cb154e7af3d0c369. The newer upstream roadmaps were checked against TauCetiRoadmap main 0d144d044dacebca17b654695b6f1ad58f159b27; current Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 was also searched. Neither read-only checkout was built or changed.

## Validation and resumption

- The blueprint validator reports zero errors and zero warnings: 79 nodes, ten planned stages, zero gaps and 15 requests.
- The 157-line suggested Lean file elaborated with lean-check at pinned Mathlib 082e2d3, with only the expected placeholder-proof warnings. Its three light definitions have real bodies. Full spectral, Witt and quasisyntomic statements stay in the reader because their carriers are absent at the pins, following the 12 October roadmap-shape rule.
- The route-ledger, packet/reader/API/test agreement, internal dependency and stage acyclicity, planet limits, source-locator and deliverable checks passed. The local blueprint validator had no declaration index; the eight baseline declaration statements were checked directly in pinned sources. GitHub's submission check also indexes the baseline.

Resume from the packet's coverage and requests, then its sourceRouting and restructure entries. The reader carries all target statements, proof sketches, named APIs, unit tests, source corrections and eight worked acceptance examples. Nothing required for review depends on disposable scratch files. No mathematical assertion is claimed formalised.
