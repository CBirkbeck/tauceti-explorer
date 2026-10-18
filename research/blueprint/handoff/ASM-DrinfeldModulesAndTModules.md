# ASM-DrinfeldModulesAndTModules: assembly handoff

Issue [#225](https://github.com/CBirkbeck/tauceti-explorer/issues/225). Agent: Claude (Opus 5.5), session `claude-OaJlDs`, 2026-10-18. This is a complete assembly, not a checkpoint.

## What was assembled

The roadmap had two reviewed parts: `packets/DrinfeldModulesAndTModules--DM.0.json` (layers DM.0–DM.7, 75 nodes, accepted by REV-DrinfeldModulesAndTModules--DM.0 on 2026-10-11) and `packets/DrinfeldModulesAndTModules--DM.8.json` (DM.8, 48 nodes, accepted by REV-DrinfeldModulesAndTModules--DM.8~2 on 2026-10-14).

- **Reader** [`readmes/DrinfeldModulesAndTModules.md`](../readmes/DrinfeldModulesAndTModules.md), about 450 KB. It opens with a summary, purpose, scope and boundaries (what it owns, imports and leaves to others), conventions that reconcile the two parts' notation, and a layer overview. Then come the nine layers, with all 123 targets numbered k.n, each with an anchor, its packet id, statement, hypotheses, proof route, Needs (linked), sources, API, Checks, acceptance, uses, Used by and library home. The back matter covers the assembly reconciliation, supplier contracts, imports from current upstream roadmaps, gaps and remaining work, the 18 source corrections, the merged source register, the pinned baseline, restructuring proposals, notes for the Tau Ceti maintainers, the Lean file and status. Every target block is generated from the packets, so the reader and the packets agree. The layer introductions and front matter are new prose. The DM.8 groups follow the DM.8 part reader.
- **Suggested file** [`suggested/DrinfeldModulesAndTModules.lean`](../suggested/DrinfeldModulesAndTModules.lean), 3,393 lines. It has one header, one sorted import block and one module note. DM.0–DM.7 are in `TauCeti.Drinfeld`; DM.8 is in `TauCeti.Difference.FixedVectors` and `TauCeti.Difference.Periods`, the namespaces the packets record. Changes from the two part files:
  - `twistSeries` (DM.8/coefficient-twist) comes first, and DM.2's `carlitzOmega_twist` now uses it; the duplicate helper `inverseCoefficientTwist` is gone.
  - New theorem `carlitzExp_carlitzLog`.
  - DM.8's `lemma`s are now `theorem`s, and its test comments are docstrings like DM.0's.
  - DM.0's name register and DM.8's omission comment are joined into one closing comment.

  Every packet API and test name (445) occurs in the file.
- **Part packets**: edited as listed below. The part readers and part Lean files are unchanged input records.

## Changes to reviewed nodes (review worklist)

The input reviews certify the parts as they stood. They do not cover these changes, so an assembly review should check them.

| Packet | Node | Fields | Nature |
| --- | --- | --- | --- |
| DM.8 | `DM.8/coefficient-twist` | parentStageId, realises, notes | Layer DM.8 → DM.2. DM.2/omega, DM.4/inverse-twist-dual-motive and DM.4/star-adapter cite it, so the stage graph had the cycles DM.2↔DM.8 and DM.4↔DM.8. Id and mathematics unchanged; the node stays in the DM.8 packet (the checker accepts any own stage as parent). |
| DM.8 | 17 nodes: entire-series, tate-analytic-interface, analytic-separability, rigid-triviality, fundamental-betti-basis, integral-trivialization, betti-exact-tensor, neutral-category, tannakian-identification, specialization-rank, carlitz-deformation, logarithm-matrices, logarithm-motive-membership, carlitz-group, logarithm-linear-relations, logarithm-division, constant-denominator | prerequisites | Stage ids `DM.2`/`DM.4` replaced by DM.2/DM.4 node ids (table in the reader, "Assembly reconciliation"). Eight nodes that need the rational pre-t-motive category keep `DrinfeldModulesAndTModules:DM.4` too. |
| DM.0 | `DM.2/carlitz-exponential` | api, uses, sources, suggestedInterface | New API item `carlitzExp_carlitzLog`: for ‖z‖<‖θ‖^(q/(q−1)), log_C(z) converges and exp_C(log_C z)=z. Source PAP-v2 §1.2.2, p. 4 (re-read this run; PAP-v2 added to the DM.0 sources with its recorded hash). This is a mathematical addition. DM.8/carlitz-deformation and DM.8/logarithm-division need it. |
| DM.0 | `DM.2/omega` | hypotheses | Wording only: the twist is DM.8/coefficient-twist "which sits in this layer". |

Packet-level edits:

- **DM.8:**
  - The requests to `DM.2` and `DM.4` (own layers) are removed. The DM.2 request is fully answered by `DM.2/c-infinity`, `carlitz-exponential`, `carlitz-period` and `omega` (π̃ = −1/Ω(θ) = π_BP). The DM.4 request is answered for the dual motives, the τ↔σ star and the abelian image (`inverse-twist-dual-motive`, `star-adapter`, `dual-realization`).
  - The gap "Motive and neutral-category suggested interfaces" is now **"The pre-t-motive category of DM.4"**. It states exactly what DM.4 lacks: pre-t-motives over k̄(t), rationalization, ⊗, internal Hom, duals, the unit, the Carlitz objects C(n) with σ-matrix (t−θ)^n, and scalar extension to L. It is needed by 10 DM.8 nodes (now also carlitz-group).
  - The analytic gap gains the upstream-owner sentence.
  - Coverage `remaining` is updated, and gains Anderson's comparison (below).
  - `upstreamImports` added for RestrictedPowerSeries and NewtonPolygons.
- **DM.0:**
  - DM.2 coverage lists the moved node.
  - DM.4 coverage `remaining` gains the pre-t-motive item.
  - `upstreamImports` added for RestrictedPowerSeries and NewtonPolygons.
  - The AdicSpaces `upstreamNotes` entry no longer says "point it … when reconciling", because that is now done.
- **Unchanged:** every `review` object, source-issue verdict and `implementationStatus`.

## Found at assembly

1. **Pre-t-motive category unplanned.** DM.8's reader said DM.4 owns pre-t-motives, rationalization and the abelian tensor category, but no DM.4 node defines them. This is recorded as the DM.8 gap above, plus a DM.4 `remaining` item. **Next step:** plan a DM.4 definition node "pre-t-motive" (Papanikolas §§3.2–3.4, pp. 10–19) with API and tests. Then replace the remaining `DrinfeldModulesAndTModules:DM.4` stage prerequisites in DM.8 by that node.
2. **Anderson's comparison unplanned.** DM.4/uniformizability says DM.8 proves "uniformizable ⟺ rigid analytically trivial". That is Anderson's theorem (BP-RAPID Theorem 4.2, p. 16; dual side Papanikolas §1.1.4, p. 2; both PDFs re-read, hashes match the packets), and no DM.8 node states it. No node cites it either, so it is a DM.8 `remaining` item, not a gap. Plan it together with item 1.
3. **New upstream owners.** TauCetiRoadmap main `350e970ce49f707a327909beac0b7b7c782cc7ee` (2026-10-17) has RestrictedPowerSeries (Gauss norms, Weierstrass division/preparation, Tate algebras, entire series §7.2) and NewtonPolygons (disc factors, zero counts §4.3, entire products §5.3). These own what DM.0's and DM.8's AdicSpaces Layer-0 requests ask for beyond current Tau Ceti. They are not in the atlas snapshot, so the AdicSpaces stage stays the prerequisite and the owners are `upstreamImports`. Once the atlas registers them, repoint the two AdicSpaces requests. NewtonPolygons §5.3 also supplies the surjectivity half of the DM.0 gap "Analytic surjectivity and general-A kernel rank"; the general-A kernel rank remains open. SchemeAndStackFoundations is now on TauCetiRoadmap main too; the SF.x atlas ids stay.
4. **No upstream duplicate.** Code search on TauCetiRoadmap main, and the titles of its open pull requests, find no Drinfeld-module, t-motive, Carlitz or shtuka roadmap. ("Drinfeld" occurs only for level structures in ModularCurves and the Drinfeld centre in PivotalSpherical.)

## Restructuring proposals and requests, collected

- **Proposals:** DM.0 has one, *rescope FiniteFieldsAndCharacterSums*: a Part II of FF.4 for Maurischat's valued-skew-field invariant factors, Newton decomposition and block-rank criterion; DM.4 keeps only the Anderson-module comparison. DM.8 has none. The assembly adds no restructure entry; items 1–2 above are in-roadmap planning.
- **Requests (15):**
  - From DM.0 (8):
    - TauCetiRoadmap AdicSpaces Layer 0 (Weierstrass/Newton and infinite products, for DM.2/lattice-exponential, DM.2/omega, DM.4/uniformizability);
    - StableReduction Layer 0 (Fitting ideals, DM.6);
    - AlgebraicCurves Layers 2, 3, 5 (Dedekind model, divisors and degree, completions);
    - JacobianChallenge Layers A, B, C (line bundles, Riemann–Roch, relative cohomology, DM.7).
  - From DM.8 (7): MotivesAndAlgebraicCycles MC.6, FunctionFieldArithmetic FA.0, SchemeAndStackFoundations SF.0, SF.1, SF.3, AdicSpaces Layer 0 (C∞ zero/pole and bounded-disk zero counts), JacobianChallenge Layer B.

  The reader's "Supplier contracts" section gives each request in full with its consumers.

## For the orchestrator

- **Collision risk.** `BP-DrinfeldModulesAndTModules` (whole roadmap, scope DM.0–DM.8) is still `pending` in the queue. It writes the same `readmes/DrinfeldModulesAndTModules.md` and `suggested/DrinfeldModulesAndTModules.lean` as this assembly, plus a new whole packet. With both parts accepted and assembled, running it would re-plan accepted work and overwrite this reader and file: the output collision that legacy part assemblies have with whole-roadmap plans, in reverse. Retarget it as the follow-up for items 1–2 and the gaps, or retire it.
- **Downstream.** DESIGN-DrinfeldModulesAndTModulesPartII (multiple zeta values) imports DM.8's difference-equation interface, notably DM.8/constant-denominator. The reader's boundary section records the routing.
- **Package.** For the eventual package, the 20 sorry-bodied data definitions in the DM.0–DM.7 Lean section become README targets (PACKAGE_REVIEW.md, "Shape of a roadmap"). Examples: `TaelmanModel.exp`, `classT`, `FiniteFieldNuclearDet`, `EffectiveDualTMotive.baseChange`, `TModule.motiveLieDual`; `scripts/check_sorry_data.py` lists them all. DM.8's `carlitz_logarithm_independence` and `carlitzDeformation_value` restate the Carlitz series by formula and should use `carlitzExp`/`carlitzLog` directly.

## Checks run

- `python3 scripts/check_blueprint.py --index <pinned declaration index>` on both part packets: 0 errors, 0 warnings each.
- Union of the two packets (123 nodes): no node cycle, and the layer graph is acyclic.
- `lean-check suggested/DrinfeldModulesAndTModules.lean` (Mathlib 082e2d37e8, Tau Ceti f790474): exit 0; 430 `declaration uses sorry` warnings (311 + 118 from the part files, plus the new theorem), no errors, no other warnings.
- Packet/Lean agreement: all 445 API and test names occur in the file.
- Reader:
  - A Python port of `src/markdown.js` inline parsing finds 0 spurious emphasis or maths spans, and all 992 internal links and 178 anchors resolve, with no duplicates.
  - markdown-it (CommonMark with tables) renders 0 `<em>`.
  - The escaping round-trips all 7,489 packet strings exactly.
- `python3 research/blueprint/intake.py check-files` on the four changed deliverables: 0 problems.
