# Independent review: MotivicEtaleKTheory M.1–M.5c

**Verdict: accepted.** This is the target-level review of BP-MotivicEtaleKTheory--M.1, written by Claude (session claude-86zQCd) and reviewed by Claude (session claude-yNDrjZ) on 6 October 2026, issue #455. Every node was read against its sources, its prerequisites and its suppliers. Every error found was corrected in place in the packet and the suggested Lean file. What could not be established is recorded as gaps, requests or `remaining` entries. The packet's `review` object gives a verdict and a note for every node.

| Item | Before | After |
| --- | --- | --- |
| Nodes | 72 | 82: 72 corrected, 10 added; no node verified without change |
| Definitions / constructions / theorems / lemmas | 5 / 21 / 45 / 1 | 5 / 22 / 54 / 1 |
| API items / unit tests / planets | 168 / 105 / 32 | 223 / 117 / 34 (at most 6 per layer) |
| Baseline declarations | 15 | 42: 27 added, 6 `provides` corrected, none removed |
| Requests / gaps | 12 / 0 | 21 / 7 |
| Source issues | 0 | 17, each with a verdict |
| Sources | 12 | 16, with 18 `sourceVersions` |
| Stage coverage | 8 planned | 8 planned; `remaining` lists corrected |
| `check_blueprint.py` (pinned index) | 0 errors, 0 warnings | 0 errors, 0 warnings |

## Method

- **Sources.** All twelve sources were downloaded, and their SHA-256 hashes match the packet.
  - Tate 1976 is a scan. It was read on the GDZ page images, with the GDZ OCR used for searching.
  - Every excerpt was checked by script against the source text, after NFKC normalisation and removal of non-alphanumerics.
  - In the corrected packet, all 216 excerpts from text-layer sources match literally. The 22 Tate excerpts were checked on the images.
- **Further sources read for the review:**
  - Levine, *Bloch's higher Chow groups revisited* (1994);
  - Park, arXiv:2108.13561v2;
  - Voevodsky, *Motivic cohomology with ℤ/2-coefficients* (Publ. Math. IHÉS 98, Numdam);
  - Voevodsky, *Motives over simplicial schemes* (arXiv:0805.4431v1);
  - the published RPO (Publ. Math. IHÉS 98, Numdam);
  - the authors' corrections to MVW and to the K-book (Wayback snapshots).

  URLs and hashes are in `sources` and `sourceVersions`.
- **Baseline.** Each declaration was read at Mathlib 082e2d3 and Tau Ceti f790474.
- **Suppliers.** Every cross-roadmap prerequisite was read at its supplier node or stage. RS-08's owners and `keeps` were checked against what the packet plans, and so was the reviewed library audit (AUDIT-30).
- **Consumers.** All requests addressed to M.1–M.5c by other packets were checked.
- **Red-team findings.** The five findings handed to the blueprint were checked against their verifiers' binding corrections.
- **Graphs.** A script checked stage-edge acyclicity against `data/atlas.json` and the accepted restructurings. A node-level cycle check was run over all packets.

## Corrections by stage

### M.1 (11 nodes, all corrected)

- **localization-gysin-sequence.**
  - It cited `EDC.3/smooth-pair-purity`, which explicitly excludes regular pairs over a trait. Purity at the closed points of a Dedekind scheme is now proved from the henselian trait (Milne ADT II Remark 1.7(b)).
  - The claimed generic-point sequence with ℤ_ℓ(j) coefficients was false and is removed. H¹_cont(ℚ, ℤ_ℓ(1)) is the ℓ-adic completion of ℚ^×, which does not map into ⊕_p ℤ_ℓ.
  - The acceptance example used the non-henselian ℤ_(p).
- **s-integer-galois-comparison.**
  - Now restricted to number fields and finite S, which is what ArithmeticGaloisDuality R02.3 and R02.4 supply.
  - The inputs Milne's proof uses are now prerequisites: the Kummer sequence, the principal ideal theorem (ClassFieldTheory Layer 13), the Brauer sequence and high-degree vanishing.
  - The identification with `R02.3/s-unit-kummer-sequence` and the transfer clause are added.
- **Duplication removed.**
  - w_j(F) belongs to `ArithmeticKTheory:N.4/the-w-invariant`, as the library audit says; the API items `TateTwist.w` and `w_eq_prod` are removed.
  - The étale twist sheaf is `EDC.0/tate-twist`.
  - The field comparison is cited from SF.2 (Stacks 03QQ) and `AnabelianGeometryAndNonabelianChabauty:NC.0/field`.
  - continuous-limit-comparison now cites `R02.1/tate-inverse-limit`, `rationalization`, `continuous-section-long-exact` and `discrete-quotient-colimit` instead of re-proving them.
- **Statements and tests.**
  - ℚ_ℓ/ℤ_ℓ(j) is the colimit along ι. Along the factorwise inclusions the colimit is 0 for j ≥ 2.
  - Br′(X) is the torsion of H²(X, G_m), as in `SF.2/cohomological-brauer`.
  - An unneeded finite-generation hypothesis is dropped.
  - A test assumed a discrete G_F-module ℤ_ℓ(1), which does not exist; it is replaced.
  - Transfer for ℓ-adic coefficients is added as continuous-limit-comparison (e), which the stage text requires.
- **Supplier routing.** ProfiniteCohomology Layer 10 is for discrete coefficients only, so the cohomology of ℤ_ℓ(j) and ℚ_ℓ(j) is taken from R02.1.

### M.2 (8 nodes, all corrected)

- **degree-two-localization-diagram.** It claimed that the ring column is "the unique map making the left square commute". That is false.
  - The kernel of H²_et(O_S, μ_m^{⊗2}) → H²(F, μ_m^{⊗2}) is (Pic(O_S)/m) ⊗ μ_m when μ_m ⊂ F. This is nonzero for ℚ(μ_37), m = 37.
  - The node also used M.3 objects, although M.2 precedes M.3.
  - It now states the two exact rows, the residue columns, the non-uniqueness and the five-lemma criterion.
- **high-degree-real-isomorphism.** The claim that α²_S(i) on ℤ/2^∞(i) is an isomorphism is replaced by the exact criterion (iff H²_cont(R, ℤ_2(i)) is finite). That finiteness comes from K-theory (K-book Ex. VI.8.1 and VI.9.1), so the sibling's M.7 must supply it. vcd_ℓ(G_{F,S}) ≤ 2 is added.
- **positive-and-modified-cohomology.** "For ℓ odd all three agree" was false in degrees 0 and 1: for F = ℚ(√2) and M = ℤ/3, H¹_+ → H¹ has kernel ℤ/3. The vacuous API item `not_tate_modified` is replaced by the comparison map to Tate cochains.
- **s-integer-brauer-sequence.**
  - The proof used a μ_m-only localization sequence with G_m coefficients. It now follows Milne ADT II.2.1, with an SF.2 request.
  - The sum map is onto only when S contains a finite place (source issue E1).
- **The other four nodes:** closure fixes. These are Pic[2] and the S-unit rank (Mathlib's `NumberField.Units.finrank_eq`, `ClassGroup.equivPic`, Tau Ceti's `NumberField.NarrowClassGroup`) and R02.1 applied to G_{F,S}. An ill-formed test is replaced, and the parity of the even-twist surjection is made exact.

### M.3 (10 nodes corrected, 3 added)

- **Tate's text.** Every Tate locator was checked on the page images, and all are right. Tate's "(∗) (a, 1−a)_F = 0, if a∈F˙, a≠1." is now quoted literally.
- **tate-s-integer: the map K_2(O_S)/ℓ^r → H²_et(O_S, μ^{⊗2}) was never constructed.**
  - It was taken from the M.2 diagram's false uniqueness. No finite-level repair exists, because Div(K_2F){ℓ} can be nonzero.
  - It is now the adic symbol restricted to K_2(O_S), landing in H²_cont(O_S, ℤ_ℓ(2)). That group is finite by the Euler characteristic and Tate (6.5), and its inflation into H²(F, ℤ_ℓ(2)) is injective.
  - The map is then reduced mod ℓ^r using H³_cont(O_S, ℤ_ℓ(2)) = 0, which also holds for ℓ = 2 with real places.
  - The hypothesis S ⊇ S_∞ ∪ {v | ℓ} is exact; this was checked on ℤ[1/2].
- **Global nodes: number fields only.** The upstream global class field theory, K2SymbolsBrauer T.5 and the finiteness of K_2(O_F) are all for number fields. tate-global, tate-torsion-symbols, tate-picard-sequence and tate-gamma-kernel are therefore stated for number fields, and the function-field case is a gap.
- **tate-global (c) and tate-local (b)** now follow from Tate (3.5), which applies to every field.
- **tate-torsion-symbols** bundled Tate (6.3), which is circular with (6.2). Tate (6.3) and (6.5) now form the node `tate-gamma-kernel`.
- **Added nodes:**
  - `tate-adic-comparison` (Tate (3.3)–(3.5) and the prime-power consequence);
  - `tate-injectivity-criterion` (Tate (4.1)–(4.5), stated through h_{F,ℓ} so that T.7's Brauer-valued symbol is not duplicated);
  - `tate-gamma-kernel`.
- **galois-symbol.**
  - The coefficient pairing is the tensor product μ_m ⊗ μ_m, not multiplication; this is RT-1/14's binding correction.
  - Naturality now covers all field extensions.
  - The change-of-m map is (r ⊗ r)_*.
  - The norm compatibility takes the prime-to-ℓ closure first and covers purely inseparable extensions.
- **New requests:** ClassFieldTheory Layers 0, 11 and 12 (Lemma (5.2)), ProfiniteCohomology Layer 6 (Mackey formula), K2SymbolsBrauer T.4 (res ∘ N = Σ_s s on K_2), and ArithmeticKTheory `N.3:ranks` (Garland finiteness) as a node prerequisite.

### M.4 (20 nodes corrected, 1 added)

- **localization-sequence.** The global long exact sequence of CH groups was claimed over any Dedekind scheme.
  - Geisser Cor. 3.3(a) gives only a triangle of Zariski sheaves, hence a hypercohomology sequence. The global sequence holds over a field (Bloch 1994, Levine 2001) and over a DVR (Geisser Thm 3.2).
  - The prerequisite `moving-lemma` (smooth X) cannot give localization for singular X. It is replaced by the cubical route (Park 2021).
- **homotopy-invariance** holds for every X separated of finite type over k, using only the translation lemma; `moving-lemma` is dropped as a prerequisite.
- **moving-lemma, arithmetic part.** It is restated as the source has it: Spitzweck Thm 5.8, for smooth affine X over a mixed-characteristic Dedekind domain.
- **Cycle complexes.**
  - simplicial-cubical-comparison: Levine 1994 Thm 4.7 needs no quasi-projectivity, and the maps are augmentations.
  - The cubical product exists only over a field.
  - The dimension index r ranges over ℤ.
  - Two meaningless `cycle-complex` tests are replaced; the weight-one sign is checked on lines in Δ².
- **purity-gysin-triangle.** It cited Geisser Thm 1.2(1), which is étale, truncated and conditional on Bloch–Kato. The Zariski triangle is unconditional (Spitzweck Cor. 3.2). The node also required Z to be smooth over B, which excluded the closed fibre that M.7 uses; that condition is removed.
- **Geisser's conditional results.** Thm 1.1 is conditional and is not asserted. The local vanishing above the weight (Cor. 4.4) needs Nesterenko–Suslin–Totaro, so it moved from vanishing-above-weight into dedekind-gersten. That avoids a cycle.
- **nesterenko-suslin-totaro.** Rewritten to RT-1/12's binding correction:
  - regular (not smooth) normalisations and the regular proper model;
  - inseparable residue fields;
  - K2SymbolsBrauer `T.4/weil-reciprocity` (Suslin reciprocity in all degrees) and `T.4/milnor-transfer-transitivity` (Kato's norms);
  - Totaro's Lemma 2 and §5 for representing classes by points.
- **weight-zero-and-one** was circular through MC.4. It is now Bloch's divisor computation, with a gap for Pic(X × 𝔸^n) = Pic(X).
- **Dedekind nodes.** Global descent is limited to what Geisser proves. The Gillet–Levine presentation lemma is requested from SchemeKTheoryOperations S.4, which uses it without stating it.
- **Added `gersten-graph-comparison`.** It answers Polylogarithms P.5's request, which P.5 records as a gap waiting on M.4.
- **Mathlib.** `AlgebraicCycle.map` is now cited for proper pushforward of cycles and `AffineSpace` for the simplices. Nothing in the libraries is re-planned.

### M.5a (9 nodes corrected, 3 added)

- **etale-motivic-comparison.**
  - "O(X)^×/n ≅ H^{1,1}(X, ℤ/n)" was false when Pic(X)[n] ≠ 0. It is replaced by MVW 4.9.
  - MVW's proof of 10.2/10.3 uses Lemma 9.31, which assumes cd_n(k) < ∞; that fails for k = ℝ, n = 2. The reduction to finitely generated fields is added (source issue E6).
  - The three missing proof engines are now nodes: `suslin-rigidity` (MVW 7.20), `etale-a1-local-complexes` (MVW Lecture 9) and `tensor-product-transfers` (MVW 8.13–8.18, 10.4–10.6).
- **effective-motives.**
  - Definition 14.1 requires closure under direct sums.
  - Only 14.8, 14.11 and 14.16 need k perfect.
  - The unsupported imperfect-field clause is removed, and so is the motive of ℙ¹ (MC.4's).
  - Verdier and monoidal localisation are taken from Mathlib (`ObjectProperty.trW`, `Triangulated.Localization`, `LocalizedMonoidal`, `DerivedCategory.Minus`), and the EnhancedDerivedSheaves E5:abstract request is withdrawn. E5:abstract plans only ∞-categorical structure.
- **cancellation.** Voevodsky proves it over perfect fields only; the imperfect-field claim is removed and the proof sketch corrected.
- **cycle-complex-transfers.** Narrowed to MVW 17.21. The higher-Chow comparison is MotivesAndAlgebraicCycles MC.4's (RS-08).
- **imperfect-field-passage.** It cited a Voevodsky passage that does not support it. It now covers what MVW 3.9 and 5.3 prove.
- **suslin-complex-and-motivic-complexes.** The products are corrected and the non-example fixed.
- **presheaf-with-transfers.** It takes the Nisnevich site from `SchemeKTheoryOperations:S.4/nisnevich-site`.
- **finite-correspondence.** Composition needs X and Y smooth, and Lemma 1.7 needs Y normal (source issue E8).

### M.5b (8 nodes corrected, 1 added, 1 moved in)

- **Base field.**
  - RPO needs a perfect base field, not only l ≠ char k: the published version says so, and v1 uses it.
  - The theorem numbers in §§3, 7 and 9 differ by one between arXiv v1 and the published version; locators give both.
  - Voevodsky 2011 §§4–6 and Haesemeyer–Weibel work in characteristic 0 with μ_l ⊂ k and n ≥ 2.
- **norm-variety-existence** was stated with no conditions. It now assumes Bloch–Kato in degree n − 1, {a} ≠ 0 and μ_l ⊂ k, as Haesemeyer–Weibel state (source issue E12).
- **nu-variety.** It conflated norm varieties with Rost varieties, which made the Norm Principle assume what norm-variety existence derives from it; the two are now separated.
- **False statements fixed:**
  - I(S) = lℤ in the Chain Lemma (S is cellular, so I(S) = ℤ);
  - the weakened conclusion of the Norm Principle;
  - "for l = 2 with ρ = 0 the Steenrod algebra is the topological one" (the Adem relations carry τ);
  - the commutator definition of Q_i for l = 2 (RPO Example 13.7);
  - three tests.
- **Added `dn-degree-theorem`.** This is Rost's DN theorem (Haesemeyer–Weibel Thm A.1), the degree formula the Norm Principle uses.
- **The Čech simplicial scheme moved from M.5c to M.5b,** with new id `MotivicEtaleKTheory:M.5b/cech-simplicial-scheme`.
  - `degree-theorem` (M.5b) needs it, and M.5c consumes the degree theorem, so leaving it in M.5c would make the stages M.5b and M.5c depend on each other.
  - Its prerequisites are M.5a nodes only, and no other packet cited the old id.
  - Its statement was also corrected (MCZ2 Appendix B and Lemma 7.3; *Motives over simplicial schemes* Lemmas 6.9, 6.11, 6.18).
- **Pfister quadrics.** QuadraticFormInvariants Layer 4 explicitly excludes Pfister theory beyond 2-fold forms. The request is narrowed, and the general case is a gap.

### M.5c and M.5 (6 nodes corrected, 2 added)

- **Characteristic p ≠ l was planned nowhere.**
  - M.5c's mod-l theorem was characteristic 0 only and left the rest to M.5d. The sibling's `M.5d/inseparable-and-characteristic-reductions` does not specialise across characteristics, and `M.5d/prime-power-norm-residue` assumes M.5c covers every field.
  - `mod-l-norm-residue` now states Voevodsky 2011 Thm 6.16 for every field of characteristic ≠ l. It plans the specialisation: perfect closure, Frac W(k) via Mathlib's Witt vectors, rigidity of K^M/l (K2SymbolsBrauer T.3) and the split residue sequence.
  - The deduction Voevodsky credits to MCZ2 is not in MCZ2 for odd l in characteristic p (source issue E16). MCZ2's Hilbert 90 hypothesis H90(n, l) is for every field (Definition 6.4, Theorem 6.6), while Voevodsky 2011 proves it in characteristic 0 only.
- **Added `hilbert-ninety-implies-beilinson-lichtenbaum`.** This is the MCZ2 §§5–6 engine that every inductive step uses; nothing upstream planned it.
- **Added `symmetric-power-operation`.** This is Voevodsky 2011 Thm 3.8, the "reduced-power argument" of the stage, previously an API line.
- **rost-motive.**
  - The class μ is now Q̃_0Q_1⋯Q_{n−2}(δ).
  - The hypotheses n ≥ 2 and Q_0⋯Q_{n−1}(δ) ≠ 0 are added.
  - A degenerate test contradicted the construction and is replaced.
  - Duality cites MC.4.
- **galois-symbol-all-degrees.** The residue sign is now (−1)^{n−1}, consistent with M.1's and K2SymbolsBrauer T.3's conventions.
- **hilbert-ninety-induction.** Step (d) was wrong and is corrected (Lemma 6.9 and MCZ2 pp. 96–97).
- **M.5's proof:** M.5c for mod ℓ, M.5d for ℓ^r, then the Chinese remainder theorem.

## Unit tests and planets

- **Tests.**
  - 23 test statements were corrected and 5 removed, because they were false, ill-formed or non-discriminating; 17 tests were added.
  - Of the API items, 31 statements were corrected, 4 removed (duplicates of other owners or vacuous) and 59 added.
  - Every definition and construction has at least three tests (the checker enforces it).
  - `GaloisSymbol.test_one` and `test_adic_one` asserted h{1, b} = 0, which every additive map out of K_2 satisfies. They now test the Kummer-class formula on m-th powers and ℓ-divisible entries.
- **Planets.** Two were added: "Rost's Chain Lemma and Norm Principle" and "Suslin's rigidity theorem". The maximum is 6 (M.5a). All names come from the sources.

## Baseline citations

- **All 15 original declarations exist under the cited names at the pin.** Six `provides` fields were corrected:
  - `LineBundleClass` is only a `CommMonoid` at the pin; inverses are deliberately not provided.
  - `Sheaf.H` is cohomology of the whole site, with no functoriality in X.
  - `continuousCohomology` is valued in `TopModuleCat`; its long exact sequences and res/cor are TODOs.
  - The two cyclotomic characters were given their exact hypotheses.
  - `smallEtaleTopology` is the small site of one scheme, so `presheaf-with-transfers` now uses `Scheme.smallGrothendieckTopology`.
- **Moved citations.** `AlgebraicCycle` was cited by `algebraic-simplex`, which involves no cycles; it is replaced there by `AffineSpace`.
- **27 declarations added,** each read in its file:
  - G_F: `TauCeti.AbsoluteGaloisGroup`, `TauCeti.ofDiscreteModule`;
  - local rings and number fields: `HenselianLocalRing`, `CommRing.Pic`, `ClassGroup.equivPic`, `NumberField.InfinitePlace`, `NumberField.Units.finrank_eq`, the class group's `Fintype` instance, `NumberField.NarrowClassGroup`;
  - cohomology of cyclic groups: `Rep.FiniteCyclicGroup.groupCohomologyIsoEven/Odd`;
  - schemes and cycles: `AffineSpace`, `AlgebraicCycle.map`, `smallGrothendieckTopology`;
  - derived categories and localisation: `DerivedCategory`, `DerivedCategory.Minus`, `ObjectProperty.trW`, `Triangulated.Localization.pretriangulated` and `isTriangulated`, `Localization.Monoidal.toMonoidalCategory`, `LocalizedMonoidal`, `MorphismProperty.IsMonoidal`, `IsGrothendieckAbelian` and `enoughInjectives`;
  - Witt vectors: three lemmas.
- **None removed.**

## Requests, gaps and coverage

- **Requests: 21.**
  - **Made precise:** ProfiniteCohomology Layers 3, 9, 10 and 12. Layer 10 is discrete-only.
  - **Removed:** the Layer 4 request, which asked for the wrong statement.
  - **New:** Layer 6; ClassFieldTheory Layers 0, 11, 12 and 13; K2SymbolsBrauer T.4; SF.2 (field comparison, Kummer exactness, the Dedekind divisor sequence, proper base change and homotopy invariance); SF.5 (cycle-level intersection products); SchemeKTheoryOperations S.4.
  - **Narrowed:** QuadraticFormInvariants Layer 4.
  - **Withdrawn:** EnhancedDerivedSheaves E5:abstract.
- **Gaps: 7.**
  - Pfister forms in every degree.
  - Tate's global theorems for function fields; FunctionFieldArithmetic FA.4 is the class-field supplier when they are planned.
  - Homotopy invariance of Pic for regular schemes.
  - The unstable A¹-homotopy category and motivic Eilenberg–MacLane spaces.
  - Algebraic cobordism.
  - Voevodsky's degree map and the lemmas on motives over embedded simplicial schemes.
  - The resolution-free step of MCZ2 §6.
- **Stages.** All eight stages remain `planned`. Their `remaining` lists were corrected:
  - the obsolete P.5 graph-map item is removed (it is now a node);
  - the MotivesAndAlgebraicCycles items not yet planned are added (MVW 11.2, 13.14, 12.20, the cdh topology, 14.12, App. 1A, 18.3);
  - Dedekind homotopy invariance is added;
  - the readings still to be done are listed (Bloch 1986/1994, Levine 2001, Suslin 2017, Suslin–Joukhovitski, Levine–Morel, Voevodsky's Eilenberg–MacLane papers, Geisser–Levine 2001).

## Red-team findings

- **RT-AREA-ktheory-1/2 (Beilinson–Lichtenbaum).** The node is the sibling's `M.7/beilinson-lichtenbaum`, after the norm-residue engine. This packet now supplies its inputs exactly:
  - `M.5c/mod-l-norm-residue` for every field of characteristic ≠ ℓ;
  - `M.5c/hilbert-ninety-implies-beilinson-lichtenbaum`;
  - M.5a.

  Handled.
- **RT-AREA-ktheory-1/8.** M.3 alone owns the general-field Galois symbol, its formula, the Steinberg relation, the norm and residue compatibilities and Tate's local, global and O_S theorems, as separate declarations. Handled.
- **RT-AREA-ktheory-1/12.** `nesterenko-suslin-totaro` imports T.4's all-degree norms and Suslin reciprocity, over regular proper models with inseparable residue fields, as the verifier requires. Handled.
- **RT-AREA-ktheory-1/14.**
  - The degree-one case is Layer 9's `kummerIso`.
  - `M.5c/galois-symbol-all-degrees` is built from Layer 9, Layer 12 and M.3's general-field symbol and Steinberg relation, with tensor (not multiplicative) coefficients.
  - The edges Layer 9 → M.5c and M.3 → M.5c are in `restructure`.

  Handled.
- **RT-AREA-ktheory-2/41.** No M.4 node uses λ- or Adams operations. S.6 → M.6b is already in the atlas (RS-18). RS-18's K.7 → M.4 and Z.3 → M.4 are equally unused, so `restructure` now proposes dropping all three edges into M.4. Handled.
- **Reader document.** It still describes the uncorrected packet; see the questions below.

## Restructure

- **Stage edges.** `restructure[0]` was recomputed from the corrected prerequisites. Against `data/atlas.json` and every accepted RS link it lists:
  - the four drops: S.6, K.7 and Z.3 → M.4, and E5:abstract → M.5a;
  - the needed edges, among them Layer 9 → M.1, M.3, M.5 and M.5c, Layer 12 → M.5c, MC.4 → M.5b and M.5c, and S.4 → M.4 and M.5a.
- **The S.4 edges are real uses.** They are the Gillet–Levine presentation lemma, Brown–Gersten descent and the Nisnevich site. They do, however, put S.1–S.4 among M.4's ancestors again.
- **Acyclicity.** All proposed edges are acyclic with the existing graph, and no node-level cycle runs through this packet.
- **`restructure[1]`** (MC.4 → M.5d) is unchanged and acyclic.

## Source issues (17, verdicts recorded in the packet)

**E1–E3: K-book VI (Weibel's 2014 errata list has none of them).**
- E1: (8.1.1) "→ 0" fails when S has no finite place.
- E2: (9.2) cites ADT I.4.20 where it should cite I.4.10(c).
- E3: VI.8.6 credits Tate with the ring isomorphism, which Tate's paper does not contain.

**E4: Tate 1976.** A misprint: (5.1) for (6.1) in the proof of (6.2).

**E5: Totaro 1992 p. 183.** The normalisation is called smooth, which is false over imperfect fields; the proof works with regular models.

**E6–E8: MVW.**
- E6: 10.2/10.3 cite Lemma 9.31, which needs cd_n(k) < ∞.
- E7: Cor. 4.8 lacks 1/l ∈ k (in the authors' corrections).
- E8: Lemma 1.7 needs Y normal (in the authors' corrections).

**E9, E10, E14, E15: RPO misprints.** Two are in both versions (Prop. 9.6 and Thm 10.2's odd case); one is in v1 only and corrected in print (§6 u/v); one is in both (the range in Thm 10.3).

**E11, E12, E16, E17: Voevodsky 2011.**
- E11: signs in Lemma 5.13.
- E12: Thm 6.3 omits the hypotheses of its source (noted by Haesemeyer–Weibel).
- E16: the characteristic-p deduction credited to MCZ2 is not there.
- E17: "next section" is a misprint.

**E13: Haesemeyer–Weibel.** In §9, p^n − 1 should be p^{n−1} − 1.

Where an errata search could not be done (web search for RPO, Voevodsky 2011 and Haesemeyer–Weibel), the `searched` field says what was compared instead.

## Suggested Lean file

**Compiled.** `lean-check` elaborates `research/blueprint/suggested/MotivicEtaleKTheory--M.1.lean` (2586 lines) in the shared build at Mathlib 082e2d3 with 283 `declaration uses 'sorry'` warnings and no other message. The file imports 23 individual Mathlib modules and no Tau Ceti module, because the shared build contains none of the cited Tau Ceti modules. The two Tau Ceti abbreviations it needs (`AbsoluteGaloisGroup` and `KummerCoeff`) are reproduced verbatim from f790474, and the opening note says so.

**Name coverage.** Every API item and unit test in the packet occurs in the file under its packet name: as a declaration, as a labelled `example`, or in the generated catalogue with a specific reason for omitting the signature.

| Against the corrected packet | Original file | Reviewed file |
| --- | --- | --- |
| API items as declarations | 84 of 168 | 136 of 223 (87 catalogued) |
| Unit tests as labelled `example`s | 21 of 105 | 61 of 117 (56 catalogued) |
| Theorem and lemma nodes with signatures | 20 of 46 | 26 of 55 (29 catalogued) |

**Definitions given honest bodies.** Mathlib provides these, so they no longer have `sorry` bodies:
- the twists μ_m^{⊗j}, ℤ_ℓ(j) and ℚ_ℓ(j), as continuous representations of Gal(F^sep/F) with action χ^j;
- the cyclotomic characters, on the separable closure rather than the algebraic closure;
- the coefficient inclusion ι;
- the cohomology carriers, as Mathlib's `continuousCohomology`.

**Hollow or vacuous items fixed (10).** Examples:
- `Subsingleton (ZMod 1)`;
- a `Fin r₁` test with r₁ assumed 0;
- `trivialise`, which assumed χ = 1;
- `etale_kummer_units`, whose statement was satisfiable by an unrelated map;
- `GaloisSymbol.test_one` and `test_adic_one`, which held for any additive map; they were also restated in the packet.

**Signatures corrected:**
- "m invertible in F" was missing from about ten declarations.
- In M.2, S is a set of finite places of F, not a `Finset ℕ`.
- `localization_exact` was false as stated: a free codimension and truncated ℕ subtraction. It is now dimension-indexed with r : ℤ.
- `res` meant cohomology restriction, while the packet's `TateTwist.res` is module restriction.
- The Rost motive had ℤ instead of ℤ_(l) coefficients.
- The Steenrod operations now need a perfect field, and the Rost motive needs characteristic 0, μ_l ⊂ k and n ≥ 2.
- The mod-l theorem needs only char ≠ l.
- External products land in X ×_k Y.

## Questions for the orchestrator

1. **Reader document.** `research/blueprint/readmes/MotivicEtaleKTheory--M.1.md` is not a deliverable of this review and still describes the uncorrected packet. Regenerate it from the reviewed packet, for example in the assembly job.
2. **Sibling M.5d (under revision).**
   - `M.5d/mod-prime-motivic-comparison` plans the same conditional implication as the new `M.5c/hilbert-ninety-implies-beilinson-lichtenbaum`, which sits upstream and is needed inside the induction. The M.5d revision should consume the M.5c node.
   - `M.7/dyadic-s-integer-extensions` must take the finiteness of H²_cont(R, ℤ_2(i)) from K-theory (see M.2/high-degree-real-isomorphism).
   - M.5d and M.7 should cite `MC.4/motivic-cohomology-higher-chow` for the higher-Chow comparison.
3. **PadicHodgeRegulators D.1** asks M.1 for the realisation K_{2n−1}(F) → H¹(F, ℤ_p(n)) built from c_{n,1}.
   - RS-08 gives the Chern and regulator maps to M.8, but M.8 requires PadicHodgeRegulators D.2, so redirecting the request to M.8 would create a cycle.
   - This ownership conflict is unresolved.
4. **K2SymbolsBrauer `T.7/chern-class-agreement`** says that M.3 exports c_{2,2}. M.3 constructs no Chern class, and under RS-08 the class is the sibling's `M.8/finite-etale-chern`.
5. **Consumers that must re-point.**
   - GeneralizedHeegnerCycles GH.0 asks M.4 for rational Chow correspondences, which belong to MC.0.
   - K3BlochGroups V.2 and KTheoryFiniteLocalFields ask M.5 for Beilinson–Lichtenbaum, which is `M.7/beilinson-lichtenbaum`.
   - ArithmeticKTheory N.1's twisted cyclotomic S-unit Kummer sequence is only partly answered by `M.1/etale-kummer-sequences`.
6. **Polylogarithms P.5's convention.** Its request writes Λ²k(Y)^× for the last Gersten term. Integrally, the tame symbol is not defined on Λ²F^×, so P.5 should say whether it means rational coefficients or the antisymmetric quotient. The new node uses ⊕ K^M_2(k(y)).
7. **ArithmeticGaloisDuality `R02.1/rationalization`** claims "no nonzero divisible elements", which is stronger than Tate's (2.1). Its reviewer should check it.
8. **Unreviewed suppliers.** Several cited suppliers are unreviewed or `needs_changes`: ArithmeticGaloisDuality, K2SymbolsBrauer T.1–T.5, EDC.0 and the sibling M.5d. The cited node ids should survive their revisions.
