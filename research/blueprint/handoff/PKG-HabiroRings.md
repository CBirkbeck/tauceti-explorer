# PKG-HabiroRings — issue #7476

Completed by Codex (GPT-6), session `codex-SikpB2`, on 9 October 2026.
The bot confirmed the claim in
[comment 6073127056](https://github.com/CBirkbeck/tauceti-explorer/issues/7476#issuecomment-6073127056).
This is a complete package submission, not a checkpoint.

## Deliverables

- [README.md](../packages/HabiroRings/README.md): an authored mathematical roadmap, 187,236 UTF-8 bytes, covering all 89 targets of the six accepted inputs. It gives the hypotheses, proof routes, sources and prerequisites; 294 API entries and 131 named unit specifications are grouped by mathematical layer. Target paragraphs are shorter than the blueprint records, and no source passages or process records are included.
- [Suggested.lean](../packages/HabiroRings/Suggested.lean): the assembled suggested file, with one import block, one standard header and the consistent outer namespace `TauCeti.Habiro`. The ordinary interfaces use genuine ring, module and completion carriers. Proofs remain admitted suggestions.
- [metadata.toml](../packages/HabiroRings/metadata.toml): `topic = "math.NT"`.
- This handoff. No packet, reader, atlas or library file changed.

I read WORKERS, both protocols, UPSTREAM_GUIDE and BROWSER_AGENTS; the complete upstream Multiquadratic and RepresentationTheory/SemisimpleAlgebras roadmaps; the reviewed HabiroRings library audit; all six accepted packets; and the assembly's handoff and source corrections. The package uses the accepted mathematical specifications, rather than copying the assembled reader's source excerpts.

## Lean result and its precise scope

Final command:

```text
lean-check research/blueprint/packages/HabiroRings/Suggested.lean
```

**Exit 0; 454 warnings, all `declaration uses sorry`; no errors or other Lean warnings.** The final check was on 9 October 2026. Available memory exceeded the required threshold, the check used the shared build, and no library build, update, cache command or language server was started.

Mathlib was exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`. The Tau Ceti source declarations were inspected at `f790474821cf4256814db967cb154e7af3d0c369`. The shared checkout's Tau Ceti HEAD differs from that pin and has no compiled cyclotomic Lift module; the submitted file imports only individual Mathlib modules, so its elaboration does not rely on the unpinned Tau Ceti checkout. As in the accepted assembly, `phiFiveResidues` gives the same four-root residue comparison over Mathlib. The header names the pinned native `TauCeti.Cyclotomic.conjugateResiduesRingHom` and `conjugateResidues_lift` APIs an implementation should use. This check does not claim that the native module itself was elaborated.

Of the 294 planned API names, 213 are typed declarations or structure projections, and 81 are named mathematical specifications in comments. There are no unmatched names. The latter concern unavailable enhanced, spectral, solid, coherent-descent or completed cohomological carriers and identify the required supplier. This retains the honest omitted-signature discipline of PROTOCOL §13; compilation does not certify those specifications as Lean statements. All 131 unit names occur, including specifications whose carriers are unavailable. No arbitrary `Prop` placeholder supplies a missing condition.

## Validation

- `python3 scripts/check_blueprint.py` passed separately on `HabiroRings.json`, `HabiroRings--HR.1.json`, `HabiroRings--HR.2.json`, `HabiroRings--HR.3.json`, `HabiroRings--HR.4.json` and `HabiroRings--HR.6.json`: zero errors and zero warnings in each. Their mathematical gap/status records were not edited.
- The package inventory found all 89 unique target anchors, all 294 API names, all 131 unit names and valid internal anchor links. The README is below the 200 KB limit and contains no job, packet, review, checkpoint or coverage prose. TOML parses to the required single topic.
- The 109 existing declarations cited by the inputs were located and their statements read at the relevant pinned source commits.
- Independent arithmetic checks found all four roots of Φ₅ over 𝔽₁₁, namely 3, 4, 5 and 9, and four distinct lifts modulo 11⁴. The cubic example factors modulo 5 as `(x − 3)(x² + 3x + 4)`, with the quadratic irreducible over 𝔽₅.
- A twelve-word overlap scan against the downloaded primary source texts found no mathematical source passage in either package document. The only README matches were bibliographic author/title text. Sources stayed in disposable scratch; no private-library files were needed or copied.

The final local intake and whitespace checks are recorded in the pull request.

## Source versions and mathematical reconciliation

The README cites fixed public versions: Wagner's Habiro paper **2510.04782v2**, q-Witt paper **2410.23078v5**, Hesselholt **1006.3125v3**, Borger **0801.1691v6**, Garoufalidis–Scholze–Wheeler–Zagier **2412.04241v2**, Bosco **2306.06100v1**, Wagner's thesis of **15 August 2025**, Lurie's **18 September 2017 Higher Algebra** and **9 April 2017 Higher Topos Theory**, and Stacks tags **04D1** and **0ALI**. Their exact theorem, section and page locators are in the package. The January 2026 author-hosted Habiro version was also checked for the completed-regulator assertion; the package's locators remain those of arXiv v2.

The package carries forward the accepted corrections and refinements, including:

1. Étaleness remains part of the standing hypotheses of the relative ring and Theorem 2.9. Cyclotomic coefficients retain the full finite étale algebra, with every idempotent factor; a chosen irreducible finite-field factor would lose Taylor coordinates.
2. The two-term localization resolution uses `d(e_i) = e_i − (1 − q^(i+1))e_(i+1)`, or coordinates `d(a)_i = a_i − (1 − q^i)a_(i−1)`. The q-factorial belongs in the augmentation denominator. The completed tensor products, homotopy conventions, λ³ sign and Witt Frobenius target indices are explicit.
3. Staticity of the finite-stage limit uses the finite cyclotomic cofiber, commutation with limits, the constant cofinal divisible tail and HR.2 detection. It does not discard a possible inverse-limit obstruction merely because every stage is static.
4. HQ.4's smooth derived q-de Rham–Witt forms, rather than its Hodge/Nygaard comparison, are the degree-zero supplier. PR.0's precise torsion-free Frobenius-equivalence node is named. The inherited packet dependencies and stale gap records remain for a job authorized to edit them, as already listed in ASM-HabiroRings.
5. Reindexing the presentation of the full root algebra is distinguished from a Galois automorphism on a fixed realization; the latter can be nontrivial. Abstract identity relabeling must not be interpreted as a trivial realized arithmetic action.
6. Subsection locators in the older q-Witt citations needed correction: 2.6–2.14 lie in **§2.2**, 2.31–2.37 in **§2.4**, 2.40–2.47 in **§2.5**, and 2.48–2.52 in **§2.6**. The package now uses these v5 sections. A packet-owning job should correct its legacy §2.1/§2.3 labels without changing the mathematics.

## Ownership and remaining mathematical prerequisites

Generic big Witt, arithmetic Λ-ring and degree-zero q-Witt theory is an imported interface of **QWittVectors QW.0–QW.4** under accepted RS-10. Its temporary placement in the HR.1/HR.4 inputs does not make it a second development here. HR.2's five solid statements remain conditional on the full light solid spectral product/tower/tensor/resolution contract. The written abelian input does not prove that spectral contract, and the nonsolid relative construction does not depend on it.

The HB.7 line comparisons retain effective global descent, the integral linear-jet condition, the actual tensor inverse and supported arithmetic naturality as hypotheses. The package makes no unconditional global freeness, nonzero Picard class or arbitrary field-pullback claim. The completion-triviality argument is typed for an actual invertible module and a surjective first-fiber map; the arithmetic construction supplying these hypotheses remains HB.7's responsibility.

No package work remains. The independent package reviewer should check the final README against the six accepted inputs and the ownership boundaries above, then rerun the displayed Lean command. Subsequent implementation requires the explicitly named suppliers; it should replace the 81 commented interfaces with genuine types rather than weaken their mathematical conditions. Nothing needed for that review is left solely in scratch.
