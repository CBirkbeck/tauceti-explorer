# Review: K3BlochGroups (Explicit K₃ and Bloch groups), stages V.1–V.6

Job `REV-K3BlochGroups` (issue #139), by Claude Code, session `cc-38267a`, 24 September 2026. The packet was written by Claude Code, session cc-7b31c4, in PR #2779 (`BP-K3BlochGroups`). I had no part in it. **Status: accepted**, after the corrections below, which were made in place. The packet stays `partial`, with its open gaps and requests recorded.

## What was checked

- **Sources.** Both SHA-256 sums were re-checked and match the packet.
  - Weibel, *The K-book*, author-hosted draft of 29 August 2013 (a04f53c9…).
  - Calegari–Garoufalidis–Zagier (CGZ), arXiv:1712.04887v3, PDF (024317c2…) and TeX.
  - Weibel's errata to the published GSM 145 printing, `https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf`. The live file returns 404; it was read from the Wayback Machine copy (SHA-256 ef7ed6d0…).
- **Checkers.** Six worked in parallel:

  | Checker | Scope |
  |---|---|
  | B1 | V.1–V.2 (14 nodes) |
  | B2 | V.3 (14) |
  | B3 | V.4 (18) |
  | B4 | V.5–V.6 (16) |
  | B5 | Packet-level: the 33 baseline declarations, the library audit, requests, gaps, coverage, restructure, reserved ids and §12 test kinds |
  | B6 | The suggested Lean file |

  Each compared every locator and excerpt with the rendered pages and the TeX. Each opened every cited declaration at Mathlib 082e2d3 and Tau Ceti f790474, read every supplier stage in `data/atlas.json`, and wrote its corrections as a machine-applicable patch. I applied the patches, resolved the overlaps between them, and validated the result.
- **What I checked myself.**
  - **Finite-field computations.** I independently computed P(F_p) and B(F_p) from K-book Definition VI.5.1, by Smith normal form, for p = 5, 7, 11, 13, 19:
    - P(F₅) ≅ ℤ/6 and B(F₅) ≅ ℤ/3, and ∂⟨2⟩ ≠ 0 over F₅;
    - |B(F_q)| = (q+1)/2;
    - c has order 6 over F₁₁ and order 2 over F₇ and F₁₉, and c = 0 over F₁₃.
  - **Lemma source.** I read `d₃₂_single_one_snd` at the pin.
  - **Stage cycles.** I checked all stage-level cycles on the atlas graph.
  - **Errata.** I read the errata file.
  - **Lean.** I compiled the suggested file with `lake env lean` in a project whose Mathlib is exactly 082e2d3.
- **Checks:**
  - `python3 scripts/check_blueprint.py --index <pinned declaration index> research/blueprint/packets/K3BlochGroups.json`: 0 errors, 0 warnings. The original packet also passed; the checker does not test test kinds, stage-level cycles or statement truth.
  - My own validation: every test has a §12 kind, every excerpt is ≤ 300 characters, and no node has a stage prerequisite downstream of its own stage.

## Counts

| | before | after |
|---|---|---|
| nodes | 62 | 102 (40 added; 60 corrected; 2 verified unchanged) |
| API items | 85 | 212 |
| unit tests (all with a §12 kind) | 63 (none with a kind) | 128 |
| planets | 24 | 25 (at most 6 per layer) |
| baseline declarations | 33 | 89 (60 added, 4 removed) |
| requests (all with `neededBy`) | 12 | 27 |
| gaps (all with `neededBy`) | 4 | 23 |
| source issues | 1 | 30 |

**Verified unchanged:** V.2/decomposable-exactness and V.6/certificate-soundness.

## The main corrections

**V.1: the homological model.**
- **The Hurewicz chain had missing links.** The Hurewicz theorem (Tau Ceti AlgebraicTopology stage 8), the bar-versus-singular comparison (H.1) and the fibration of Ex. IV.1.9 were used but not cited. New nodes: uce-plus-fibration, bst-plus-two-connected, bst-plus-connected-cover and eta-hurewicz-sequence.
- **uce-superperfect rested on a false exercise.** Ex. III.5.7 omits "X perfect" (E2; D₈ is a counterexample). Two lemmas were added: central-extension-comp and split-extensions-kill-h2.
- **A test was false.** A degenerate triple [g|1|h] is not a cycle (Mathlib `d₃₂_single_one_snd`).
- **A cycle was removed.** `GeneralAlgebraicKTheory:K.2` closed a stage cycle through K.2:low-degree-comparisons → V.4 → V.1. It is replaced everywhere by `K.2:plus`.

**V.2: indecomposable K₃.**
- **Injectivity of Milnor K₃ is not planned by M.7.** The packet's argument was wrong: the E₂ identification does not give injectivity. The node now follows K-book Proposition VI.4.3.2: the kernel has exponent 2, and the differential d₂ is killed. New nodes: motivic-low-degree-sequence and milnor-k3-kernel-exponent-two, with the unplanned inputs as gaps (Izhboldin; divisibility for algebraically closed fields; motivic Chern classes).
- **The field half of Cor. IV.1.20** became k3-to-h3-sl-field.
- **Bass–Tate** is a gap.
- **The Borel rank** now comes from BorelRegulators:R.3/borel-rank-theorem via N.3:ranks and N.5, because R.3 plans rings of integers, not fields.

**V.3: the Bloch group.**
- **The antisymmetric quotient.** It is coker(1+τ). Tau Ceti's `antisymmetricTensors` is ker(1+τ), and the two differ over ℤ. The prerequisites and API were rebuilt on `LinearMap.range`, `Submodule.mkQ` and `exteriorPower`.
- **⟨x⟩ = [x] + [x⁻¹] lies in P(F), not B(F).** Over F₅, ∂⟨2⟩ ≠ 0 (E9). element-c was rebuilt. angle-bracket-two-torsion and three-c-angle-minus-one (3c = ⟨−1⟩ and 6c = 0, for |F| ≥ 4) were split off.
- **Corollary 5.4.1's "∛−1 ∈ F".** It must mean a root of t² − t + 1; c has order 6 over F₁₁ (E10).
- **The CGZ comparison.** CGZ's B is not a quotient of the K-book's B(F). κ has kernel and cokernel that are elementary abelian 2-groups, and over F₁₁ it is neither injective nor surjective (E12–E14). New nodes: exterior-kernel-bloch-group (CGZ's B̃), exterior-kernel-discrepancy, cgz-bloch-group and cgz-degenerate-relations.
- **The Bloch–Wigner nodes are now pointer comparisons.** Polylogarithms P.1 owns D and its five-term identity, and P.2 owns the descent. A V.3 prerequisite on P.2 closed a cycle, so it was removed.
- **Small-field conventions** now contain only what the presentation gives (q = 2, 3, 4, 5, 7).

**V.4: Suslin's theorem.**
- **F must be infinite.** Theorem VI.5.7's H₂ formula fails for F₄: GL₂(F₄) ≅ ℤ/3 × A₅ has H₂ ≅ ℤ/2, while ∧²F₄ˣ ⊕ K₂(F₄) = 0 (E17). The printed proof of Theorem 5.2 covers infinite fields only (E18); the errata's change of "infinite field" to "field" in VI.5.2 adds no proof. The finite-field case is a gap.
- **The construction had errors.** The stabiliser of a frame is the centre, not the antidiagonal (E19). C₃ is not ℤ[G]-free (E20). The Dold–Kan claim for the injective complex is false (E21). The sign of the norm map is wrong (E22). ψ′ is misprinted (E23). Lemma 5.14's formulas contain errors, although its conclusion stands (E25).
- **New nodes (18):**
  - cross-ratio (a stage target that had no node);
  - monomial-subgroups;
  - psi-map;
  - torus-borel-homology;
  - gl2-d1-involution;
  - gl2-d3-boundary;
  - general-position-complex;
  - psi3-map;
  - psi3-torus-vanishing;
  - h3-gl3-generation;
  - dupont-sah-identity;
  - alternating-group-image;
  - pi3ind-definition;
  - pi3ind-sequence;
  - pi3ind-ahss;
  - delta-squaring;
  - e-invariant-detection;
  - enhanced-tor.
- **The Tor comparison.** tor-form-comparison records that no canonical isomorphism µ̃ ≅ Tor exists, per K-book Ex. VI.5.9(b). Suslin's sequence is natural only in the Tor form.
- **Homological stability** is owned by V.4, as its stage text requires. It is a gap: Suslin [183] was not obtained.

**V.5: calculations.**
- **Imports from other roadmaps.** Quillen's K₃(F_q) comes from L.1 (Cor. IV.1.13; the extraction had cited Harris–Segal). K₃(ℤ) and K₃(ℚ(i)) come from N.8, and the number-field structure from N.5, stated with w₂(F) as the K-book's.
- **The order of c.** The claim that the Bloch–Wigner function detects the order of c was false: D vanishes on P¹(ℝ). element-c-order-six now rests on the Rogers dilogarithm, recorded as a gap and a request to P.1.
- **New nodes:** milnor-k3-finite-field and bloch-finite-field-mod-n.

**V.6: certificates and comparisons.**
- **New nodes.** boundary-certificate (asked for by the README's V.6 row), root-of-unity-class (the valid multiples and localised classes that D.3 consumes) and regulator-agreement-padic.
- **Corrected comparisons.** The integral and finite-coefficient comparisons were corrected: K₃^ind(F)/n ≅ B(F)/n needs µ(F) ⊗ ℤ/n = 0, and it fails for ℚ(√−3) with n = 3 (E27).
- **Corrected supplier.** The p-adic request moved from D.3 to D.2, the stage that states the comparison.

**Suggested Lean file.**
- **It did not elaborate.** There were 7 errors, and it had 29 `: True := by sorry` placeholders, which §13 forbids.
- **It was rewritten.** It now elaborates against Mathlib 082e2d3 with `sorry` as its only warning, states every node honestly or records it as not stated with the missing object, and carries every packet API and test name. See "Lean" below.

## Baseline citations removed or fixed

- **Removed:**
  - `Matrix.card_GL_field`: unused, and L.1 says the order of GL_n(F_q) alone does not give Quillen's calculation.
  - `PresentedGroup`: non-abelian, a wrong-definition hazard.
  - `Complex.log`, `Complex.arg`: the analytic nodes now import from Polylogarithms.
- **Corrected `provides` texts:**
  - `groupHomology.H1`: an abbreviation; the abelianisation identification is `H1AddEquivOfIsTrivial`.
  - `CategoryTheory.Tor`: it has no computation API.
  - `Subgroup.closure`, `QuotientGroup.mk`: the additive twins are what is used.
  - `Projectivization.generalLinearGroup_is_two_pretransitive`: only 2-transitivity, for `LinearMap.GeneralLinearGroup`.
  - `TauCeti.antisymmetricTensors`: ker(1+τ), not ∧̃².
- **Added:** 60 declarations, each read at the pin, among them `groupHomology.H1AddEquivOfIsTrivial`, `groupHomology.indIso`, `Rep.FiniteCyclicGroup.*`, `exteriorPower.ιMulti`, `TensorProduct.comm`, `CharacterModule.dual_surjective_of_injective`, `TauCeti.FactorSet.*`, `OnePoint.instGLAction` and `FreeAbelianGroup.equivFinsupp`.

## Mistakes in the sources

- **E1** (Theorem VI.5.7's note): **confirmed**, and now marked known. Weibel's errata corrects the published p. 540 to the form the draft prints. The review adds that this form holds only for infinite F (E17).
- **E2–E30** are new, and each was checked at its locator:

  | Issue | Source | Kind | Summary |
  |---|---|---|---|
  | E2 | K-book Ex. III.5.7 | error | Omits "X perfect" |
  | E3–E5 | K-book §IV.1 | misprints | |
  | E6 | K-book VI.4.3.2 | gap | Divisibility of K₄ cites VI.1.6, which covers characteristic 0 only |
  | E7 | K-book Cor. VI.5.3 | misprint | r₂ counts places |
  | E8 | K-book III.5.3 | misprint | |
  | E9 | K-book Lemma VI.5.4(c) | error | ⟨x⟩ ∉ B(F) |
  | E10 | K-book Cor. 5.4.1 | misprint | "∛−1" |
  | E11 | K-book proof of 5.4 | gap | Needs x ∉ {0, 1, z⁻¹} |
  | E12–E14 | CGZ Def. 2.1, Def. 1.1, Lemma 2.2 | errors | The K-book's ∧̃² against CGZ's ⋀²; C(F) ⊄ A(F); Lemma 2.2 needs |F| ≥ 4 |
  | E15 | K-book Ex. VI.5.3 | misprint | "c = [4]" in F₇; c = 2[4] |
  | E16 | K-book Ex. VI.5.4(c) | error | False for q = 7 and 19; needs q ≡ 1 mod 12 |
  | E17 | K-book Theorem 5.7 | error | "For all F" fails for F₄ |
  | E18 | K-book Theorem 5.2 | gap | Proof covers infinite F only |
  | E19–E25 | K-book §VI.5 | | The V.4 construction errors listed above |
  | E26 | K-book Remark 5.6.1 | misprint | "|P¹(F₂)| = 7"; it is 3 |
  | E27 | CGZ Lemma 4.4 | error | Needs ζ_p ∉ F |
  | E28 | CGZ Cor. 4.5 | gap | |
  | E29 | CGZ §4.2 | error | H₃(SL₂(F_q)) is cyclic of order q² − 1 only prime to q; H₃(SL₂(F₅)) ≅ ℤ/120 |
  | E30 | K-book 5.8.2 | error | Künneth without the Tor term |

- **Duplicates.** Where two checkers found the same mistake, I kept one entry (Remark 5.6.1, CGZ Lemma 2.2, Theorem 5.2 for finite fields).
- **Not recorded.** One candidate was left out as unverified: a Borel attribution in IV.1.17.

## Lean

The file was written by checker B6. It is `research/blueprint/suggested/K3BlochGroups.lean`, 2717 lines, rewritten from scratch against the final packet, and it imports only individual Mathlib modules. I compiled it myself:

```
cd <project with Mathlib 082e2d3> && lake env lean research/blueprint/suggested/K3BlochGroups.lean
```

The result was exit 0 with 426 warnings, all of them `declaration uses 'sorry'`, and no other messages. A scripted check found:

- **API items:** all 212 are declared under the packet's name.
- **Tests:** all 128 are `example`s whose docstring names the test.
- **Theorem, lemma and comparison nodes:** 68 of the 75 are stated. The other 7 are recorded as `-- <node id>: not stated; needs …`, each naming what is missing:
  - V.1/uce-plus-fibration and V.1/eta-hurewicz-sequence need homotopy fibres, maps on homotopy groups and the composition product with η;
  - V.4/gl2-spectral-sequence and V.4/gl2-d1-involution need spectral sequences;
  - V.4/delta-squaring and V.4/e-invariant-detection need δ and the e-invariant;
  - V.6/regulator-agreement-padic needs the p-adic regulator.

**Other properties of the file:**
- **No placeholder statements:** no `True` statement remains, and `sorry` appears only in declaration bodies.
- **Data defined by `sorry`:** 49 data definitions have `sorry` bodies. These are objects Mathlib cannot model yet, such as the plus construction, hyperhomology and π₃^ind(BM⁺). §13 allows this; none is a `Prop` placeholder.
- **Implementation status:** `implementationStatus` stays `unchecked`.

**A fix made after the sync.** Four nodes are stated for fields with at least four elements: V.5/bloch-finite-field-mod-n, V.6/comparison-rational, V.6/comparison-integral and V.6/comparison-finite-coefficients. They rest on Suslin's sequence, which is now proved only for infinite fields. I added them to the `neededBy` of the finite-field gap.

## Questions for the orchestrator

1. **Two cycles belong to other packets.**
   - The Polylogarithms packet's P.1/bloch-wigner-five-term and P.2/bloch-wigner-descent cite the stage `K3BlochGroups:V.3`; they should cite V.3 node ids.
   - M.8 (étale Chern classes) is downstream of V.4 (M.8 → R.7 → P.2 → V.4), but V.4's e-invariant step needs it.

   Restructure entries record both. Neither can be fixed from this packet.
2. **Reserved ids.** The two reserved analytic ids (V.3/bloch-wigner-dilogarithm and V.3/bloch-wigner-five-term) now hold pointer comparisons. The restructure entry proposes retiring them in favour of the Polylogarithms nodes.
3. **Ownership overlaps** that this packet cannot settle (restructure entries):
   - K₃(F_q), K₃(ℤ) and K₃(ℚ(i)) between V.5 and L.1/N.8;
   - the regulator agreements of V.6 against P.2/D.2;
   - the CGZ-versus-Suslin comparison between V.3 and HabiroNumberFields HB.1;
   - the explicit K₃ model between V.1/V.4 and GeneralAlgebraicKTheory K.2:low-degree-comparisons.
4. **Sources not obtained.** Suslin's papers [183] (LNM 1046) and [187] (Proc. Steklov 183), and Hutchinson (J. K-Theory 12, 2013). The steps the K-book and CGZ cite from them without proof are gaps. Obtaining them would close the largest part of V.4.

## Summary

The review accepted the packet after correcting it in place. Of the 62 nodes, 60 were corrected, 2 verified and 40 added. Every test now has a kind, and the 89 baseline declarations were all checked at the pin. Several statements are now correct that were false before:
- V.4 is stated for infinite fields.
- ⟨x⟩ lies in P(F).
- The CGZ comparison has 2-group kernel and cokernel.
- The injectivity of Milnor K₃ follows the K-book's motivic argument.

Two cycles were removed. The Lean file now elaborates. The packet records 29 new source mistakes, 23 gaps and 27 requests.
