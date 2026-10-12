# Handoff: ASM-EnhancedDerivedSheaves (issue #227)

This job assembles the roadmap *Enhanced derived categories of sheaves*
(`EnhancedDerivedSheaves`) from its two reviewed parts. It is a complete
assembly, not a checkpoint.

Worker: Claude (Claude Code, Opus 5.5), session `claude-XZgxb8`, 11–12 October
2026. This session wrote neither part nor either review.

- Part E0 (layers E0–E4, 125 declarations): BP-EnhancedDerivedSheaves--E0
  (#719), accepted by REV-EnhancedDerivedSheaves--E0 (#396).
- Part E5 (layer E5 and its sub-layers abstract, presentability, animation,
  cotangent-export and spectra-comparison, 44 declarations):
  BP-EnhancedDerivedSheaves--E5 (#720), accepted by
  REV-EnhancedDerivedSheaves--E5 (#397).

No review verdict, review record or source-issue verdict is changed.

## Files

- `research/blueprint/readmes/EnhancedDerivedSheaves.md`: the roadmap
  document, about 78,000 words. Both reviews say the part readers were not
  updated with their corrections and that the reviewed packets are
  authoritative. So every declaration block is generated from the two packets
  as corrected here, and document and packets agree by construction. A
  scripted check finds every declaration id, title, statement, hypothesis,
  proof step, prerequisite, acceptance item, use, API item and unit test,
  locator, match and planet, every gap, request, coverage remark, source-issue
  correction, structural proposal and baseline declaration in the document;
  all 1,302 internal links resolve. The handwritten sections give the purpose
  and scope, boundaries (imports, the DD.1 ownership moves, consumers from the
  atlas stage edges and other packets, and the 110 requests other packets
  address to this roadmap), reconciled conventions and a notation table,
  sources (with the copies that page numbers refer to), the library baseline
  and the newer Tau Ceti carriers, a layer overview with the order of
  construction and main paths, an introduction to each of the eleven layers,
  dependencies, coverage, source issues, the suggested Lean file, structural
  proposals and what the plan does not claim. The E1 and E4 introductions
  follow the review's ownership move (E1 owns the Koszul complex, and E4 the
  generic completion reflector, Koszul power model and regular-ideal
  quotients); the old part reader still says E4 imports these from DD.1.
- `research/blueprint/suggested/EnhancedDerivedSheaves.lean`: the two part
  files joined (2,067 lines): one standard note, one import block (55 modules,
  the deduplicated union), one namespace `TauCeti.EnhancedDerivedSheaves`, the
  E0–E4 body (formerly namespace `TauCeti.EnhancedSheaves`) in `section
  Sheaves` and the E5 body (formerly `TauCeti.EnhancedDerivedSheaves.E5`) in
  `section Monoidal`, each with its own `open`s, universes and options. No
  declaration is renamed apart from the namespace, and none is duplicated.
  `lean-check`: exit 0, 589 warnings, all `declaration uses sorry` (242 + 347,
  the two parts' totals), no errors and no other warnings.
- `research/blueprint/packets/EnhancedDerivedSheaves--E0.json` and
  `--E5.json`: the edits listed below.
- This note.

The part documents and part Lean files are unchanged; the assembled document
and file replace them for readers. The part readers are out of date with
their reviews and should not be used for packaging.

## Edits to the part packets

**Re-review is requested** for the prerequisite changes in items 1–3. No
statement, hypothesis, proof step, acceptance item, API item or test changes.
Items 4–5 are bookkeeping.

1. **Whole-layer citations made exact (E5).** PROTOCOL §3 allows a stage id
   only when no finer node exists.
   - `E5:abstract/descendable-algebras`: `EnhancedDerivedSheaves:E2` replaced
     by `E2/pro-towers` and `E2/coherent-towers-and-roos` (its Amitsur-tower
     characterization; these are the first two items of its request to E2).
   - `E5:abstract/uniform-index-colimits`: added `E2/coherent-towers-and-roos`
     (the sequential lim/lim¹ argument). The citations of layers E1 and E2
     stay: the general multiplicative derived-limit filtration (gap G5.2) and
     the Gorenstein index bound's Ext/projective-dimension facts have no
     declaration.
   - `E5:animation/bounded-totalization-colimits`: `EnhancedDerivedSheaves:E2`
     replaced by `E2/space-sheaves-and-postnikov` (the unbounded Postnikov
     convergence and hypercompleteness its statement attributes to E2).
2. **E0 interfaces named by the E5 request to E0 (R5.7).** Added
   `E0/mapping-space-kan-and-equivalences` to `E5:abstract/infinity-operad`;
   `E0/coherent-functors` to `E5:abstract/monoidal-categories-over-an-operad`
   and `E5:abstract/algebra-objects`; `E0/coherent-functors` and
   `E0/higher-category-carrier` to
   `E5:abstract/left-derivable-cocartesian-families` and
   `E5:presentability/coherent-group-actions`. Each construction uses
   functor categories, Cat∞ or mapping-space equivalences explicitly.
3. **The E0 request to E5 (R0.2).** `E2/perfect-h-cech-descent` applies the
   E5 module-descent theorem for Čech effectivity in its proof but did not
   cite it; it now cites `E5:abstract/module-descent-and-functoriality`. The
   node graph of both packets together stays acyclic (checked), because
   among this roadmap's declarations module descent depends only on E0, E1,
   E3, the two E2 tower declarations and E5:abstract and E5:presentability
   declarations (and, through E1, on D0 and the libraries). The E0 author asked for a supplier depending on E0/E1
   alone; it actually depends also on E3 and the E2 towers, and the induced
   layer cycle E2 ↔ E5:abstract is resolved by proposals 4 and 9 below.
4. **Distinct source-issue ids (E5).** Both parts numbered a finding
   `EnhancedDerivedSheaves/E1`, so two different findings shared an id in the
   errata register. The E5 finding (BS17 Remark 11.24 versus Mathew Corollary
   3.33) is now `EnhancedDerivedSheaves/E5`, with `recordedAs`
   `EnhancedDerivedSheaves/E1`; its verdict is unchanged. The E5 review
   report still uses the old id.
5. **Three structural proposals added** (proposals 4 and 5 in the E0 packet,
   9 in the E5 packet); see below.

Both packets: `check_blueprint.py` with the pinned declaration index, 0 errors
and 0 warnings.

## Requests of the parts, status after assembly

| Id | Part | Supplier | Status |
| --- | --- | --- | --- |
| R0.1 | E0–E4 | `DiamondsAndVStacks:D0` | open: ordinary site, generator and geometric cover inputs |
| R0.2 | E0–E4 | `EnhancedDerivedSheaves:E5:abstract` | answered by `E5:abstract/module-descent-and-functoriality` (item 3); the request entry is kept for the reviewer |
| R0.3 | E0–E4 | DGAInfinity layer 1 (Tau Ceti) | import of existing roadmap; unchanged |
| R0.4 | E0–E4 | DGAInfinity layer 0 (Tau Ceti) | import of existing roadmap; unchanged |
| R5.1 | E5 | `EnhancedDerivedSheaves:E1` | the E1 declarations it lists exist (perfect-ring Tor, Frobenius-root ideals, Tor and global dimension, saturated valuation modules, tensor/Hom, splitting, Dqc and perfect base change); the Gorenstein Ext/projective-dimension input of `uniform-index-colimits` is still unstated, so that node keeps the layer citation |
| R5.2 | E5 | `EnhancedDerivedSheaves:E2` | answered by `E2/pro-towers`, `coherent-towers-and-roos`, `tower-milnor`, `pro-zero-derived-limit`, `space-sheaves-and-postnikov` and the perfect h-descent declarations, except the general multiplicative filtration (gap G5.2) |
| R5.3 | E5 | `EnhancedDerivedSheaves:E4` | open: no E4 declaration states that the Amitsur completion of a finitely generated module over a Noetherian ring is its adic completion; only an acceptance check of `descendable-algebras` uses it |
| R5.4 | E5 | ProfiniteCohomology layer 0 (Tau Ceti) | import; unchanged |
| R5.5 | E5 | ProfiniteCohomology layer 10 (Tau Ceti) | import; unchanged |
| R5.6 | E5 | `EnhancedDerivedSheaves:E3` | Kan extension isolated (the E0 review cut it to E0 inputs); `E3/adjoint-functor-theorem-and-localisations` still cites `E1/derived-presentability`, used only by its étale acceptance example. Not changed here: moving the example to its consumer would change a reviewed acceptance check |
| R5.7 | E5 | `EnhancedDerivedSheaves:E0` | coherent functor categories, Cat∞ and mapping-space equivalences now cited (item 2); straightening over N(Fin_*), LM and Ass and mapping-space composition laws remain open |

E5 gap G5.1 ("Refine abstract supplier dependencies across parts") still
describes the pre-review E3 dependencies. A revision should narrow it to the
adjoint theorem's acceptance example and R5.7's open items.

## Dependencies

The union node graph is acyclic. The node-induced layer graph differs from
the atlas in three places, recorded in the document and as proposals:

1. **E2 → E3 in the atlas, E3 → E2 in the declarations.** No E3 declaration
   uses E2; `E2/space-sheaves-and-postnikov` uses `E3/accessible-localizations`.
   Proposal 5: replace the stage edge by E3 → E2 (order E0, E1, E3, E2, E4).
2. **E2 ↔ E5:abstract** (after item 3). Proposal 4: sub-layer E2:towers
   (`coherent-towers-and-roos`, which keeps its planet, and `pro-towers`),
   which uses only E0 and E1; the missing multiplicative filtration belongs
   there, and `uniform-index-colimits`' E2 citation then becomes it.
3. **E5:abstract ↔ E5:presentability** (already in the reviewed E5 packet).
   Proposal 9: sub-layer E5:descent (`descendable-algebras`, which keeps its
   planet, `module-descent-and-functoriality`, `uniform-index-colimits`) with
   parent E5, and `formal-tensor-inversion` moved under E5:presentability.

With the three proposals applied the layer graph is acyclic (checked). Planet
counts stay within six per layer.

## Structural proposals of the parts

1. *Generic enhanced sheaves belong to E1* (ownership-confirmed, E0 part).
   RS-18/RS-05 ownership; no action.
2. *Completion algebra moves down to E1/E4 for tier 4* (ownership move, E0
   part). **Action for the orchestrator:** redirect the DD.1 plan and package
   to the lower-tier owners: `DD.1/koszul-complex` → `E1/koszul-complex`;
   `DD.1/derived-completeness` → `E4/derived-complete-sheaves`;
   `DD.1/derived-completion` → `E4/the-imported-completion-interface`;
   `DD.1/koszul-completion-tower` → `E4/koszul-completion-tower`;
   `DD.1/ordinary-quotient-completion` → `E4/regular-ideal-quotients`;
   `DD.1/completed-tensor` → `E4/completed-sheaf-tensor`;
   `DD.1/derived-nakayama` → `E4/mod-ideal-detection` (the packet's
   `ownershipMoves`).
3. *Acyclic foundation interfaces* (E0 part). Carried out, with item 3 above.
4. *Sub-layer E2:towers* (new). Awaiting a structure job.
5. *Replace the atlas edge E2 → E3 by E3 → E2* (new). Awaiting the
   maintainer.
6. *Keep E5 comparison returns distinct from its foundations* (E5 part).
   Holds: DD.0 and H.5 are cited only by the return layers and the joint
   acceptance diagram.
7. *Expose the extended presentable-category targets* (E5 part). No action.
8. *Separate generic supplier statements from their concrete applications*
   (E5 part). Partly carried out (Kan extension); the adjoint theorem's E1
   input remains, as under R5.6.
9. *Sub-layer E5:descent, and formal tensor inversion in E5:presentability*
   (new). Awaiting a structure job.

## For the package job

- **Tier.** EnhancedDerivedSheaves is in tier 4. E0–E4 cite no higher-tier
  roadmap. E5 cites nine `DerivedDeRhamCohomology:DD.0` declarations (in
  `E5:cotangent-export/the-imported-interface`) and four
  `StableHomotopyKTheory:H.5` declarations (in
  `E5:cotangent-export/e-infinity-comparison-in-proved-ranges` and
  `E5:spectra-comparison/late-realisation`); the joint acceptance diagram
  `E5/single-enhancement-supplier` depends on both. These must move down or
  the return layers be stated as later extensions.
- **Duplicated targets across the parts.** E0's stable quasicategories and
  exact functors versus E5:abstract's stable and exact comparisons; E0's
  accessible and presentable quasicategories versus
  `E5:presentability/presentable-categories`; `E3/presentable-category-limits`
  versus `E5:presentability/limits-of-presentable-categories`. Each pair
  states the same object or limit, the E5 member adding monoidal or PrL
  structure; the package should state each once with the union of the API.
- **Lean carriers.** The E0–E4 section uses Mathlib's `SSet.QCat`; the E5
  section a fixed-universe subtype `QCat` of `SSet.{1}`. They coexist in the
  joined file without clashes; a package `Suggested.lean` should unify them.
- **Incoming requests.** The document lists the 110 requests of other packets
  addressed to this roadmap, by first sentence; it does not assess each one.
- **Upstream order note.** The Caraiani–Newton order lists this roadmap with
  "move down: DerivedDeRhamCohomology (15)"; the E0 review removed the E0–E4
  DD.1 citations, and the remaining DD citations are the E5 ones above.

## Checks run

- `python3 scripts/check_blueprint.py` on both part packets with the pinned
  declaration index: 0 errors, 0 warnings each.
- `lean-check research/blueprint/suggested/EnhancedDerivedSheaves.lean`:
  exit 0; 589 warnings, all `declaration uses sorry`.
- Document check (scratch script): all packet fields present, 1,302 internal
  links resolve, no local paths.
- Node graph of both packets acyclic; layer graph acyclic under proposals 4,
  5 and 9.
- `research/blueprint/intake.py check-files` on the four changed and new
  files.

Nothing in scratch is needed to resume.
