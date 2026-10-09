# PKG-PerfectoidSpaces

Package for the roadmap PerfectoidSpaces ("Perfectoid rings and spaces", upstream tier 3, last member of the adic bundle with AdicEtaleGeometry, AdicSpacesPartII and DiamondsAndVStacks), written by Claude Code session cc-3f6951 on 2026-10-09 from the two plans `research/blueprint/packets/PerfectoidSpaces--P0.json` (P0–P7, 326 nodes, review status needs_changes) and `PerfectoidSpaces--P8.json` (P8–P9, 66 nodes, accepted), the atlas stage descriptions, and the existing suggested files. No issue, no GitHub interaction.

## Delivered

- `research/blueprint/packages/PerfectoidSpaces/README.md` — the roadmap in TauCetiRoadmap form: scope, prerequisites and boundaries with a supplier table, conventions, sources with locators, then layers P0–P9 in order. Every primary node of the two plans (definition, construction, theorem, comparison, application: 202 targets after the additions below) is a numbered target Pk.n with statement, hypotheses (for headline targets), API names and examples (for definitions and constructions), source locator and prerequisites; the 199 lemma nodes are folded as lettered "Supporting results" (Pk.na, Pk.nb, …) under the primary target that first cites them in the same layer, each with its title and source locator. Internal links resolve; no plan vocabulary, no node ids, no private paths.
- `research/blueprint/packages/PerfectoidSpaces/Suggested.lean` — representative signatures in the TauCetiRoadmap form (see the Lean section below).
- `research/blueprint/packages/PerfectoidSpaces/metadata.toml` — `topic = "math.AG"`.

## What the README could not carry at full size

The plans have 392 nodes; the size cap (200 KB) allows about 480 bytes per node. Statements are therefore truncated at sentence boundaries (headline targets keep 600–1150 characters, other definitions about 340, other theorems about 175), API lists are the first 3 names, examples the first 3 with a short gloss, sources one locator per target and prerequisites the first two. The full statements, API items, tests and proof steps remain in the two plans and their readers (`research/blueprint/readmes/PerfectoidSpaces--P0.md`, `PerfectoidSpaces--P8.md`); a reviewer or porter who needs the exact hypotheses of a supporting result should read the plan node of the same slug. Nothing was invented: every target sentence in the README is a prefix of the corresponding plan statement, re-pointed to numbered targets.

## Corrections applied rather than inherited

The P0–P7 plan is at review status needs_changes. The reviewer's corrections that are already in the plan JSON were inherited through generation (the mod-pseudouniformizer category over 𝔽_p with root-ideal almost flatness; S⁺ = S° in the p-finite definition; the inverse-Frobenius continuity of the absolute-product charts; the restriction of the singular-cardinal statements to uniformly κ-small spaces; the non-full κ-bounded subcategory). The reader documents were not used as a source of statements because the reviewer recorded them as stale.

## Notions moved down from higher roadmaps (now targets here)

| Higher citation in the plan | Target here |
| --- | --- |
| DerivedDeRhamCohomology:DD.0 (classical cotangent complex interface, 7 citations) | P0 "The cotangent complex of a ring map and its deformation theory" (Illusie II.1.2.3, II.2.1.2, II.2.2.1, III.2.1.2.3; Stacks 08P5) |
| TropicalAndBerkovichArithmetic:TB.0 (Berkovich spectrum maximum formula, 2) | P1 "The Gelfand spectrum of a nonarchimedean Banach ring" (Berkovich 1.2.1, 1.2.4, 1.3.1; AWS Lemma 1.5.21), built on DiamondsAndVStacks D5's Berkovich spectrum |
| PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-… (integral perfectoid rings, 3) | P1 "Integral perfectoid rings" (BMS Definition 3.5, Lemmas 3.9–3.10) |
| PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed (5, plus the P8 gap on BS22 Theorem 10.11) | P4 "Zariski closed immersions are strongly Zariski closed" (ECD Theorem 5.8; BS22 Theorem 7.4, Remark 7.5, Corollary 8.14) and P8 "Perfectoidization of an integral extension of an integral perfectoid ring" (BS22 Theorem 1.17(1), Theorem 10.11). Both are heavy: their proofs go through the perfectoidization of semiperfectoid rings. They are stated here because the order file puts PerfectoidQuotients above this roadmap; when the bundle containing PerfectoidQuotients is ported, its Q2–Q4 targets prove the same statements and these two targets become citations. |
| ClassicalAdicEtaleCohomology:H0 (Huber tilde-limits, 4) | P7 "Tilde-limits of analytic adic spaces" (Huber 1996 Definition 2.4.2; SW13 Definition 2.4.1); the étale-topos comparison along tilde-limits is P7's existing comparison target, now stated without the H0 citation |
| PadicHodgeTheory:P8:local-rational (pro-étale structure sheaves on affinoid perfectoids, 9) | P9 "The pro-étale site of a rigid space and its affinoid perfectoid objects", "Completed structure sheaves on the pro-étale site and their values on affinoid perfectoids", "Pushforward of the completed structure sheaf to the étale site of a smooth rigid space" (Sch13 Definitions 3.9 and 4.3, Proposition 4.8, Lemma 4.10, Proposition 6.16, Corollary 6.19) |

The page numbers of Sch13 and Huber 1996 in these added targets are section/theorem locators only; I did not re-download those sources in this session.

## Duplication audit against the current Tau Ceti and upstream roadmaps

Searched (by object, with positive controls) Tau Ceti a91d3aaf, Mathlib 082e2d3, the current upstream roadmaps including the nine newer ones and `Completed/*`, and the sibling packages. Tau Ceti and Mathlib have no perfectoid predicate, no almost mathematics, no tilde-limits, no finite-group quotients of Huber pairs and no pro-étale morphisms (AdicSpaces README L33–38 excludes them); none of the nine newer upstream roadmaps touches this material. Mathlib has `PreTilt`, `PreTilt.untilt`, `WittVector.fontaineTheta`, `surjective_fontaineTheta` and nothing on ker θ (BDeRham.lean lists it as a TODO), so P1's primitive-kernel theorem is new.

Removed (deleted from the layer lists, cited under "Prerequisites and boundaries"):

| Plan node | Exists as |
| --- | --- |
| `P1/perfectoid-tate-ring-is-reduced` | `TauCeti.Huber.IsUniform.isReduced` (TauCeti/RingTheory/Huber/Uniform.lean:162; T0 + uniform Tate ⇒ reduced, the perfectoid case is a corollary) |
| `P3/henselisation-of-pairs` | SchemeAndStackFoundations SF.0 henselisation targets (package README "Henselization of pairs: the étale-neighbourhood colimit", T111–T118, and T053–T058) |
| `P3/finite-etale-filtered-colimit-of-rings` | `AdicEtaleGeometry:A4/finite-etale-algebras-filtered-colimit` (same statement) |

Kept as variants, with the library core named in the boundaries section: `P1/witt-vectors-of-perfect-plus-ring` (its completeness clause is `TauCeti.WittVector.isAdicComplete_span_p_teichmuller`, `isHausdorff_span_p_teichmuller`, `TauCeti.Huber.isHuberRing_adicTopology_span_p_teichmuller`; the remaining clauses are new), `P1/inverse-limit-of-integral-elements-along-frobenius` (`Perfection.quotientMulEquiv`), `P0/tight-henselian-idempotent-lifting` (classical existence is `TauCeti.HenselianRing.exists_isIdempotentElem_sub_mem`), `P3/henselian-pairs-colimits-and-completions` ((a) is `IsAdicComplete.henselianRing`; (b),(c) are AdicEtaleGeometry A4 `henselian-pairs-filtered-colimit`, `power-bounded-henselian-along-pseudouniformizer` and SchemeAndStackFoundations `henselian-pair-permanence`), `P4/maps-of-perfectoid-spaces-are-generalizing` (spectral half is `TauCeti.ValuationSpectrum.isSpectralMap_spaComap_of_isTateRing`), `P5/spa-of-filtered-colimit-of-tate-pairs` (clause (d) is `TauCeti.ValuationSpectrum.spaCompletionHomeomorph`, which the plan wrongly requested from AdicSpaces Layer 2), `P7/compact-open-subgroup-cofinality` (core is `Subgroup.exists_le_of_iInf_le_of_directed`), `P8/invariant-spectrum-homeomorphism` and `P8/free-action-quotient-is-torsor` (free case is AdicEtaleGeometry A4 `torsor-spa-orbits`, `finite-etale-galois-torsor`). P3's finite étale and étale morphisms of perfectoid spaces remain stated as the restriction of AdicEtaleGeometry A1's notions (the entries say so).

Citation forms: the plan cites DiamondsAndVStacks by node slug (`D0/cofiltered-limits-of-spectral-spaces` etc.); the DiamondsAndVStacks package numbers these D0.10, D0.13, D0.23, D0.24, …, and PerfectoidQuotients' package uses API names. The README keeps the slugs the sibling plans use (DiamondsAndVStacks' package cites this roadmap by slug too); at port time both sides need the same convention.

## Lean

`Suggested.lean` (111,865 bytes) was assembled from `research/blueprint/suggested/PerfectoidSpaces--P0.lean` (1 MB) and `PerfectoidSpaces--P8.lean` by selection, renamed into `namespace TauCetiRoadmap.PerfectoidSpaces`, with one module docstring, `/-! ## Layer k -/` sections in README order, `theorem` only, `sorry` bodies and `example` tests, and no process vocabulary. It imports `Mathlib` and 19 Tau Ceti modules (AdicSpace Cont/ResidueField/Spa.*, Huber Basic/Bounded/Completion/LocalizationTopology/Padic/Pair/PowerBounded/TopologicallyFiniteType/WeightedRestrictedSeries, IsUniformGroup.Subring). Counts: carriers from AdicSpacesPartII Layer 0 (adic ring maps, completed tensor products, uniformisation, finite morphisms of pairs; declared in `TauCeti.Huber` so that dot notation works) 32 declarations; Layer 0: 29 declarations, 6 examples; Layer 1: 86 and 18; Layer 2: 33 and 2; Layer 3: 13; Layer 4: 4 and 2; Layer 5: 1; Layer 6: 2 and 3; Layer 7: 4 and 3; Layer 8: 5 and 3; Layer 9: 8. Layers 5–9 are thin: the carriers they need (adic spaces as a category, tilde-limits, the pro-étale site, cofiltered limits of affinoid perfectoids) do not exist at the pins, so their statements stay in the README; the closing comment of the file names them. The declarations dropped by the agent's error-removal loop (tilt functoriality `tilt.map`, the trace-form criterion, almost faithfully flat descent, almost finite projective and finite étale algebras, the henselian finite étale approximation, the perfected Tate algebra with its disc tests, `PerfectoidRingCat`) are README targets P1.6 (tilt functoriality), P0.15 (trace form), P0.25 (descent), P0.14 (almost finite étale algebras), P3.2 (henselian approximation) and P1.30 (perfected Tate algebra) and remain unstated in Lean.

Compilation: `lean-check <worktree>/research/blueprint/packages/PerfectoidSpaces/Suggested.lean` (Tau Ceti f790474 + Mathlib 082e2d37): exit 0, 0 errors, 181 warnings, all `declaration uses 'sorry'`, no other warning (the ambiguous-namespace and duplicated-namespace warnings of the agent's draft were fixed by closing the `PerfectoidSpace` namespace after the tilting-map section and opening `_root_.CategoryTheory`).

## Checks

- `python3 research/blueprint/intake.py check-files` on the four files: 4 file(s), 0 problem(s); no `/home/` path in any deliverable.
- README: 196,875 bytes (below 200 KB); 242 anchors, 481 internal links, all resolving; no plan vocabulary (packet, node, atlas, reviewer, stand-in, optional, deferred, pending) and no "(removed)" stubs; 201 numbered targets (P0: 29, P1: 33, P2: 19, P3: 22, P4: 21, P5: 12, P6: 14, P7: 17, P8: 21, P9: 13) with 197 folded supporting results; 31 sources with locators.
- The README was generated by a script from the two plans (scratch, not committed) and then edited: the top sections (scope, boundaries, conventions, layer introductions) and the nine added targets are written by hand; the target entries are prefixes of the plan statements with node references re-pointed to numbered targets, so a comparison with the plan JSON is mechanical.

## For the maintainer

- The plan P0–P7 is still at review status needs_changes (its general-base mod-pseudouniformizer gap and the unfinished broad audit); the package inherits its corrected statements but cannot close that review. The reader documents of both plans are stale relative to the plan JSON and were not used.
- The two heavy moved-down targets (P4 Zariski-closed ⇒ strongly Zariski closed; P8 perfectoidization of integral extensions) are statements whose proofs belong to the prismatic development of PerfectoidQuotients; keeping them here follows the order file, but if PerfectoidQuotients is ported in the same pull request as this bundle, they should become citations.
- `research/blueprint/suggested/PerfectoidSpaces*.lean` and the plan JSON were not edited.
