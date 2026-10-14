# BP-GL2AutomorphicRepresentationsAndTransfer--R17.5

Agent: Claude (session claude-Y032f1). Issue: [#9414](https://github.com/CBirkbeck/tauceti-explorer/issues/9414). Date: 2026-10-14.

## Status

Complete target-level pass for layer R17.5, status `complete`; coverage of `GL2AutomorphicRepresentationsAndTransfer:R17.5` is **planned**, with no gaps of its own.

| Measure | Count |
|---|---:|
| Declaration nodes | 15 (10 theorems, 2 lemmas, 1 construction, 2 applications) |
| API items / unit tests | 10 / 4 (all on the one construction, `brauer-character`) |
| Planets | 1 (Fong–Swan theorem; the R17.3 part already shows five on this layer) |
| Baseline declarations read at the pin | 9 (Mathlib) |
| Requests | 8 (Tau Ceti layers) |
| Gaps | 0 |
| Source issues recorded | 3 (E16–E18) |

Deliverables: [packet](../packets/GL2AutomorphicRepresentationsAndTransfer--R17.5.json), [reader](../readmes/GL2AutomorphicRepresentationsAndTransfer--R17.5.md), [suggested Lean file](../suggested/GL2AutomorphicRepresentationsAndTransfer--R17.5.lean).

## Where this job started

The issue says to start from the R17.5 coverage record in the R16.1 packet. That packet has no R17.5 record. The record is in the **R17.3 packet**, whose scope covers R17.3–R17.6 and which already has 15 accepted R17.5 nodes. Its open items for R17.5 were two source-proof gaps: the all-place upgrade of tetrahedral and octahedral Artin automorphy, and a reduction-compatible lift of a residual representation with solvable image for p > 2. A third open item was the totally real weight-one request to R16.6. The accepted package README (PKG-GL2AutomorphicRepresentationsAndTransfer) had already sketched targets for the first two (`artin-all-place-upgrade`, `brauer-character`, `solvable-integral-lift`) with no packet nodes behind them. This packet plans them as nodes, with sources read and checked. It cites the R17.3 nodes by id and gives its own nodes new ids. The R17.3 packet was not edited.

## What is closed

- **All-place matching.** These five nodes discharge the gap 'All-place upgrade of tetrahedral and octahedral Artin automorphy' of the R17.3 packet:
  - `gl2-local-converse` (JL70 Cor. 2.19 pp. 39–40; BH06 27.1 p. 170);
  - `gl2-twist-stability` (JL70 Prop. 3.8 pp. 57–58);
  - `isolating-twist-character` (JL70 Lemma 12.5 pp. 210–211);
  - `artin-twisted-functional-equation` (Deligne 1973, Thm 4.1 p. 535 and 5.11 p. 551, by Brauer induction and Hecke);
  - `artin-all-place-upgrade` (JL70 pp. 210–212, the isolation argument).

  Archimedean matching is a hypothesis of the upgrade. Langlands's route avoids it only through his Lemma 3.2, which he does not prove. Archimedean matching is proved for the two cases in `tetrahedral-artin-all-places` and `octahedral-artin-all-places`, through cyclic base change (R17.4/cyclic-base-change, R17.4/local-compatibility).
- **Residual lift.** These nodes discharge the gap 'Reduction-compatible lift of a finite solvable projective image (p>2)':
  - `brauer-character` and `brauer-character-recognition` (Webb §§9.4, 10.1–10.2);
  - `fong-swan` (Isaacs 1974, Thm 5.4; Webb 9.4.12);
  - `solvable-integral-lift`;
  - `involution-oddness-under-reduction`;
  - `odd-solvable-residual-lift`.

  The route needs neither the projective lift nor the Teichmüller twist of the R17.3 node. The lift has the same kernel as r̄, and its reduction is r̄ itself, not only its semisimplification.
- **Applications.** `solvable-residual-modularity` covers weight one over any number field, in Rogawski–Tunnell's sense over totally real fields; it is BCGP Prop. 10.1.3's input. `q-solvable-residual-weight-one` gives weight-one newforms over Q; it is Dieulefait–Pacetti Thm 1.3, which ClassicalSerreModularity R33.1, R26.4, R27.1 and EllipticCurveModularityWild3Adic W3.6 request.
- **Superseded nodes** (packet field `supersedes`): R17.3's `R17.5/odd-residual-lift` is superseded by `odd-solvable-residual-lift`, and `R17.5/residual-lt-application` by `solvable-residual-modularity`.

## What remains (precisely)

1. **Next permitted revision of the R17.3 packet.**
   - Add `R17.5/tetrahedral-artin-all-places` and `R17.5/octahedral-artin-all-places` to the prerequisites of `R17.5/solvable-artin`.
   - Retire the two gaps closed here.
   - Mark `odd-residual-lift` and `residual-lt-application` as superseded, or retire them and repoint their consumers. ArithmeticGaloisRepresentations R01.1 lists `odd-residual-lift` among its `uses`.
2. **Classical Hilbert forms of parallel weight one** are planned nowhere; R17.3's request (b) to R16.6 is unmet. The new nodes use only the adelic notion, which is what the known consumers use.
3. **Finite-order prescription of local characters at several places** (Chevalley) has no packet node. The accepted package puts it at R16.1 (`full-local-character-prescription`). R17.3's `tunnell-primitive-globalization` and `prescribed-local-induction` still record it as a gap. The upgrade here needs only JL Lemma 12.5.
4. **Ownership moves**, proposed in `restructure`:
   - local converse and stability to R16.3;
   - the twisted Artin functional equation to ArithmeticGaloisRepresentations R01.2 (tier 7);
   - Brauer characters: KTheoryFiniteLocalFields:L.1/brauer-character should import `R17.5/brauer-character`. KTheoryFiniteLocalFields is outside the upstream chain of this roadmap, so the notion moves down here.

   The package's move of `R17.5/quadratic-induction` to R17.4 is the R17.4 job's to apply. That job (#9413) is claimed by another session; nothing here depends on the move.
5. **Consumers to repoint** (packet field `consumerRetargets`): CSM R33.1/R26.4/R26.6/R27.1 and W3.6 should cite `q-solvable-residual-weight-one`; R23.3 and ML.1 should cite `solvable-residual-modularity`; R19.2's Carayol nodes should cite the all-place nodes.

## Red-team findings handed to this job

- **RT-AREA-automorphic-1/1.** No new GL₃ input enters here. The all-place upgrade uses GL₂ local theory only. The tetrahedral and octahedral nodes build on R17.3's nodes, which take the GL₃ inputs (adjoint lift, cubic induction, GL₃ recognition, non-normal cubic base change) from the R17.4 nodes that R17.3's proposal moves to R17.4a. That proposal is restated in this packet's `restructure`, with R17.5's consumers named.
- **RT-AREA-automorphic-1/11.** The new nodes cite R16.5 (`global-epsilon-normalization`) and R16.6 (`weight-one-classical-comparison`) directly, together with R16.3 and R16.4. The packet's `links` declare R16.3, R16.4, R16.5, R16.6 → R17.5. Promotion draws no same-roadmap stage edges, so **the maintainer needs to add these four edges**.

## Requests

There are eight requests, all to Tau Ceti layers:

- GlobalNumberFields layers 1, 7 and 9: weak approximation, principal units, Hecke characters and Pontryagin extension;
- InductionRestriction layers 5 and 6: Clifford theory and Brauer induction;
- ClassFieldTheory layer 11: global reciprocity;
- GrothendieckEulerForms layer 4: projective covers and the Cartan map;
- ModularForms layer 4: weight-one newforms.

Every other prerequisite is an exact node of a lower-tier atlas roadmap: ArithmeticGaloisRepresentations R01.1, R01.2 and R01.4 (tier 7); AutomorphicLFunctionsAndLocalFactors AL.1 and AL.2 (tier 12); AutomorphicFormsOnReductiveGroups AF.1 (tier 11). The rest are this roadmap's own R16.2–R17.5 nodes.

## Sources and source issues

Read on 2026-10-14; URLs and SHA-256 are in the packet:

- Jacquet–Langlands LNM 114 (IAS retypeset, printed = PDF − 6);
- Langlands, *Base change* (DMA pagination);
- Deligne 1973 (IAS);
- Webb's book (author's prepublication version, printed = PDF − 7);
- Isaacs, Pacific J. 1974;
- BCGP (published IHÉS);
- Deligne–Serre 1974;
- Tunnell 1981;
- Dieulefait–Pacetti, arXiv v2;
- Rogawski–Tunnell 1983 (GDZ page image);
- Bushnell–Henniart 2006, in the maintainer-cleared copy, §27 only. Cited as "Bushnell–Henniart, The Local Langlands Conjecture for GL(2), 27.1, p. 170"; nothing was copied.

New source issues:

- **E16 (BCGP, Prop. 10.1.3, p. 474) — gap.** Tate's theorem gives no lift whose reduction is ϱ. The result is correct; Fong–Swan supplies the lift.
- **E17 (Dieulefait–Pacetti, Thm 1.3, p. 3) — gap.** The same missing step.
- **E18 (Webb, pp. 144 and 148) — error.** In characteristic p the remarks need the prime-to-p part of the exponent. It affects nothing.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/GL2AutomorphicRepresentationsAndTransfer--R17.5.json --index <pinned declarations.tsv>`: 0 errors, 0 warnings.
- Stage-cycle check over atlas `requires` and `stageEdges` (3,508 edges) plus this packet's induced edges: R17.5 reaches none of its suppliers.
- `lean-check` of the suggested file: exit 0. There are 17 warnings, all `declaration uses 'sorry'`, and no other warnings or errors; memory was checked before compiling.
  - The file gives `brauerCharacter` a real body (no sorry'd data). It states the API, the recognition theorem, Fong–Swan (character form), the integral lift, the Galois-level lift with oddness, and JL Lemma 12.5 on Mathlib's `IdeleClassGroup`.
  - The oddness lemmas and their three examples are fully proved.
  - The automorphic declarations are listed as omissions, because their carriers are not at the pins.
- Every packet API item, test name and theorem `leanName` occurs in the Lean file.
- The packet and reader contain no forbidden words and no `sorry`.
- A separate proofread pass checked the reader and packet for wording, cross-references and consistency with the Lean file, and its corrections are applied. A script compared every 9-word run of the packet with the text layers of the sources: the only overlaps are titles, formula fragments and standard phrases.

## Resume point

Nothing is left in progress. The independent review should check these points in particular:
- the isolation argument's use of GL₂ stability, which compares π_v with π(ρ_v) and needs no Galois-side stability;
- the archimedean step of `octahedral-artin-all-places`;
- the kernel claim of `solvable-integral-lift`.
