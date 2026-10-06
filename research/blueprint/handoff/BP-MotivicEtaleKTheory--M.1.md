# Handoff: BP-MotivicEtaleKTheory--M.1

Agent: Claude (session claude-86zQCd), issue #957, 6 October 2026.

Deliverables:

- `research/blueprint/packets/MotivicEtaleKTheory--M.1.json` (status `complete`)
- `research/blueprint/readmes/MotivicEtaleKTheory--M.1.md` (about 33,000 words, generated from the packet so the two agree)
- `research/blueprint/suggested/MotivicEtaleKTheory--M.1.lean`

## Summary

This packet is a target-level plan of the first part of the roadmap, stages M.1, M.2, M.3, M.4, M.5, M.5a, M.5b and M.5c. The second part (M.5d–M.8) is the sibling packet `MotivicEtaleKTheory--M.5d.json`, and this packet supplies the stages it requests.

- 72 nodes: 5 definitions, 21 constructions, 45 theorems, 1 lemma.
- 168 API items and 105 unit tests.
- 32 planets, at most 6 per layer.
- 15 baseline declarations, each read at the pinned commits (Tau Ceti f790474, Mathlib 082e2d3).
- 12 requests, 0 gaps.

`python3 scripts/check_blueprint.py` (with the pinned index) reports 0 errors and 0 warnings. Every excerpt from a source with a text layer was checked by script: NFKC normalisation, whitespace removed, substring of the extracted text. The excerpts from Tate's 1976 paper were typed from the GDZ scan, which has no text layer, and are marked as typed in each `match`.

## Stage status

All eight stages are `planned`. Each `remaining` list names refinements, not missing targets.

- **M.1** (11 nodes; narrowed by RS-08). It covers:
  - the finite, ℓ-adic and primewise ℚ/ℤ twists, with the correct inclusion ι (multiplication by ℓ^b);
  - the bigraded Galois cohomology ring and the continuous ℓ-adic limits;
  - étale twists on schemes, with continuous étale cohomology as a derived limit;
  - the field and S-integer étale–Galois comparisons, including filtered colimits of fields and purely inseparable invariance;
  - the étale Kummer sequences, henselian rigidity, and the Dedekind localization (Gysin) sequence with its residues.

  Remaining: cite Jannsen 1988 for continuous étale cohomology.
- **M.2** (8 nodes; narrowed by RS-08). It covers:
  - the real restriction maps α;
  - positive cohomology H_+ and the kernel groups H̃, kept separate from D7's Tate-modified groups;
  - cd ≤ 2 and α^n bijective for n ≥ 3;
  - Br'(O_S), the mod-2 dimension formulas with Pic⁺ and the signature defect, K-book Lemma 9.3, and ℓ-adic finiteness and rationalisation;
  - the degree-two comparison diagram.

  Remaining: Weibel's wild-kernel §6.2 (its text layer is unreadable, so pages must be rendered), and N.6's corestriction and cyclotomic-localisation asks.
- **M.3** (10 nodes). It covers:
  - the cohomological Steinberg relation, the mod-m Galois symbol for every field, and Tate's ℓ-adic symbol;
  - compatibility with norms and with residues;
  - Tate's local, global (mod ℓ, adic, prime powers) and S-integer theorems, with Tate (6.1)/(6.3) and (6.2).
- **M.4** (20 nodes). It covers:
  - simplices and cubes, admissible cycles, and the simplicial and cubical complexes with their comparison;
  - functoriality, homotopy invariance, moving, localization, products and pullback, CH(X, 0) = CH(X), weight zero and one, vanishing above the weight;
  - Nesterenko–Suslin–Totaro and the weight-two comparison;
  - the projective bundle formula, purity, and Zariski descent;
  - the Dedekind-base cycle complex with localization and Gersten (Geisser).

  Remaining: read Bloch 1986/1994 and Levine 1994 for the original statements, and add P.5's Gersten graph-map ask.
- **M.5** (1 node). It is the norm residue theorem, assembled from M.5c/mod-l-norm-residue and the sibling node M.5d/prime-power-norm-residue.
- **M.5a** (9 nodes). It covers:
  - finite correspondences, presheaves and Nisnevich sheaves with transfers, the Suslin complex and ℤ(q);
  - Voevodsky's theorem on homotopy invariant sheaves (MVW 13.8), DM^eff with representability, and cancellation over any perfect field (Voevodsky 2010);
  - transfers on higher Chow groups with the comparison input, the étale comparison ℤ/n(q)_et ≃ μ_n^{⊗q} with the motivic-to-étale map, and imperfect fields (p inverted) and filtered colimits.

  Remaining: read Suslin 2017 for imperfect fields.
- **M.5b** (8 nodes). It covers:
  - the motivic Steenrod operations and their relations, and the Milnor operations;
  - ν_n-varieties and norm varieties, and Voevodsky's degree theorem;
  - the Pfister-neighbour norm varieties at l = 2, Rost's Chain Lemma and Norm Principle, and the existence of norm varieties (characteristic 0).

  Remaining: read Suslin–Joukhovitski 2006.
- **M.5c** (5 nodes). It covers:
  - Čech simplicial schemes and the generalised Rost motive;
  - the norm residue homomorphism in all degrees, with its Kummer, product, norm and residue compatibilities;
  - the inductive step (Hilbert 90 for K^M_n, H^{n+1,n}(𝒳, ℤ_(l)) = 0) and the mod-l theorem in characteristic 0.

## RS-08 and the confirmed red-team findings

RS-08 was accepted on 23 September 2026, and this packet follows it: the M.1 and M.2 `keeps`, and the owners MC.0, MC.1, MC.4, SF.5, R02.1–R02.4 and D7, which are imported and not re-planned.

- **RT-AREA-ktheory-1/2 (Beilinson–Lichtenbaum).** The sibling packet already plans BL as `M.7/beilinson-lichtenbaum`, with the Dedekind version in `M.7/dedekind-motivic-comparison`. This part supplies their inputs: M.4's cycle complexes over fields and Dedekind bases, M.5a's `cycle-complex-transfers` and `etale-motivic-comparison`, and M.5c's mod-l theorem. A BL node is not duplicated inside M.5, because M.7 consumes M.5 and placing it in M.5 would create a stage cycle. K3BlochGroups V.2 and KTheoryFiniteLocalFields, which ask M.5 for BL, should cite `M.7/beilinson-lichtenbaum`.
- **RT-AREA-ktheory-1/8.** M.3 is the single owner of the Galois symbol (`M.3/galois-symbol`, for every field), its symbol formula, `M.3/cohomological-steinberg`, and Tate's theorems as separate declarations (`tate-local`, `tate-global`, `tate-s-integer`). K2SymbolsBrauer's T.3 packet already imports these from M.3.
- **RT-AREA-ktheory-1/12.** `M.4/nesterenko-suslin-totaro` imports K2SymbolsBrauer `T.4/milnor-transfer-transitivity` (Kato) and `T.4/weil-reciprocity` (Suslin reciprocity in all degrees). The edge T.4 → M.4 is in `restructure`.
- **RT-AREA-ktheory-1/14.** M.5's degree-one case is imported from ProfiniteCohomology Layer 9. `M.5c/galois-symbol-all-degrees` is defined from Layer 9's Kummer isomorphism, Layer 12's cup product and M.3's Steinberg relation. The edges Layer 9 → M.5c and M.3 → M.5c are in `restructure`.
- **RT-AREA-ktheory-2/41.** M.4 uses no λ- or Adams operations, so `restructure` proposes to replace S.6 → M.4 by S.6 → M.6b. The Z.5/Z.6 edges belong to other roadmaps' jobs.

## Consumer requests answered

Each request addressed to M.1–M.5 by an existing packet was matched to the nodes that answer it.

- **K2SymbolsBrauer T.3.**
  - (i) Answered by `M.3/galois-symbol` and `cohomological-steinberg`.
  - (ii) The Chern class c_{2,2} is the sibling's `M.8/finite-etale-chern`, and its comparison with h_F is T.7/chern-class-agreement. M.3 does not construct Chern classes (RS-08: the higher Chern and regulator maps belong to M.8).
  - (iii) Answered by the three Tate nodes.
  - The twists are `M.1/finite-tate-twist`.
- **ArithmeticKTheory N.1, N.5, N.6, N.7.**
  - Twists: `M.1/primewise-q-mod-z-twist` and `adic-tate-twist`.
  - Real places: `M.2/real-restriction-map`, `positive-and-modified-cohomology` and `high-degree-real-isomorphism`.
  - Brauer and dimension formulas: `s-integer-brauer-sequence` and `mod-two-dimension-formulas`.
  - ℓ-adic finiteness: `adic-s-integer-cohomology`.
  - Tate's theorems: `M.3/tate-s-integer`, `tate-torsion-symbols` (Tate 6.1) and `tate-picard-sequence` (Tate 6.2).
  - The cyclotomic S-unit Kummer sequence that N.1 asked of M.3 is `M.1/etale-kummer-sequences`.
  - Still open: N.6's corestriction and cyclotomic-localisation asks, listed in M.2 `remaining`.
- **HabiroNumberFields.** `M.1/etale-kummer-sequences`, the twist nodes, and `M.3/tate-global` (b) with `adic-galois-symbol`.
- **KTheoryFiniteLocalFields.** `M.1/field-etale-galois-comparison`, `henselian-residue-comparison`, `M.4/nesterenko-suslin-totaro` and `M.5/norm-residue-theorem`. Bloch–Gabber–Kato is the sibling's `M.5d/bloch-gabber-kato`.
- **MotivesAndAlgebraicCycles MC.4.** The M.4 and M.5a nodes, mapped to MVW 17–19 and 1–14.
- **K3BlochGroups and EllipticKTheory.** `M.4/nesterenko-suslin-totaro`, `vanishing-above-weight`, and the coefficient API of `cycle-complex`.
- **SpecialValuesBirchTate.** `M.3/tate-s-integer`, natural in S ⊆ T.
- **Polylogarithms P.5.** `cycle-complex`, `cubical-cycle-complex` and `simplicial-cubical-comparison`. The Gersten graph map is in M.4 `remaining`.
- **GeneralizedHeegnerCycles GH.0.** It asks M.4 for rational Chow correspondences. RS-08 assigns those to MotivesAndAlgebraicCycles MC.0, so GH.0 should cite MC.0.
- **PadicHodgeRegulators D.1.** The classes c_{n,1} are the sibling's `M.8/finite-etale-chern`. M.1 supplies the target lim H¹(F, μ_{p^ν}^{⊗n}) (`continuous-limit-comparison`).
- **The sibling M.5d packet.** All five of its requests to M.1, M.2, M.4, M.5a and M.5c are answered by nodes. The packaged higher-Chow comparison is MC.4's (RS-08), and `restructure` proposes the edge MC.4 → M.5d.

## Requests made (12)

- Tau Ceti ProfiniteCohomology Layers 3, 4, 9, 10, 11 and 12.
- ClassFieldTheory Layers 5 and 10.
- QuadraticFormInvariants Layer 4 (Pfister forms).
- SchemeAndStackFoundations SF.2 (Hilbert 90 for étale G_m, Br') and SF.5 (Chow groups and Chern classes; there are no SF.5 nodes yet).
- EnhancedDerivedSheaves E5:abstract (localisation for DM^eff).

The packet cites node ids directly from ArithmeticGaloisDuality (R02.1, R02.3, R02.4, D7), K2SymbolsBrauer (T.1–T.5), EtaleDualityAndPerverseSheaves `EDC.3/smooth-pair-purity`, ClassicalAdicEtaleCohomology `H1:henselian/affine-henselian-comparison-3-2-5`, and the sibling `M.5d/prime-power-norm-residue`.

## Structure

`restructure` lists:

1. the stage edges that the prerequisites need and that the atlas lacks;
2. the replacement of S.6 → M.4 by S.6 → M.6b;
3. the edge MC.4 → M.5d.

Together with `data/atlas.json` and the accepted restructuring links, the full set was checked acyclic by script.

## Suggested Lean file

The file imports Mathlib only, because the shared build's Tau Ceti tree is not the pinned one. Tau Ceti's `KummerCoeff`, `kummerMap` and `explicitCup11` are the cited baseline but are not imported.

`lean-check` elaborates the file in the shared build at Mathlib 082e2d3 with `sorry` as the only warning (173 of them).

Coverage of the packet's declarations:

- Every node has an entry.
- The main carriers and 20 theorem signatures are Lean declarations.
- 108 API items and unit tests have Lean signatures or `example`s.
- The other 165 are catalogued by name and statement in a comment block. Their carriers are `sorry`-bodied types that do not yet expose the needed operations, for example tensor structure in DM^eff, the simplicial structure of the cycle complex, and function fields of k-varieties.

A follow-up at lemma level should replace those carriers by real constructions as the supplier roadmaps land.

## Sources

Read, with URLs and SHA-256 recorded in the packet:

- Weibel, *K-book* (III.6.9–6.10, VI.1–2, VI.4, VI.8–9)
- Tate 1976 (GDZ scan, all of §§1–6)
- MVW (Lectures 1–6, 10, 13–14, 16–17, 19–20)
- Voevodsky 2011 (arXiv v2), Voevodsky RPO (arXiv v1, §§6, 9, 10, 13), Voevodsky 2010 cancellation (arXiv v1)
- Totaro 1992, Geisser 2004 (author's copy), Spitzweck (arXiv v3)
- Haesemeyer–Weibel, chain lemma (introduction)
- NSW 2.3 ((2.7.6), (8.6.10)), Milne ADT (I.4.10, II.2.9)

Not obtained or not read:

- Bloch 1986 and 1994, Levine 1994, Suslin–Joukhovitski 2006, Suslin 2017, Jannsen 1988 (each listed in a `remaining` entry).
- Weibel's 'Higher wild kernels', which was downloaded but has an unreadable text layer.
- Weibel's 'Axioms for the norm residue isomorphism', which was downloaded but has an unreadable text layer; it is not cited.

`sourceIssues` is empty: no misprints or errors were found in the passages read.
