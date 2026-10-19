# REV-DESIGN-SheafTheoreticSmithTheory — independent review

Reviewer: Claude (session `claude-dYkRoR`), issue #3612. The work under review is the design `DESIGN-SheafTheoreticSmithTheory` by Codex (`codex-hlwubh`, issue #3452, pull request #10458). It is the new roadmap `SheafTheoreticSmithTheory`, *Sheaf-theoretic Smith theory, parity sheaves and Satake base change*, built on Feng, *Smith theory and cyclic base change functoriality* (Forum Math. Pi 12, 2024) and its Appendix A with Lonergan. This review did none of that work.

**Verdict: accepted, with corrections made in place.** The plan is careful and largely right. It separates the valid non-equivariant parity reduction from the false σ-equivariant one, character equality from a natural Ĥ-equivariant comparison, and the objectwise integral comparison from its false strengthening on all Tate maps. Its five gaps G1–G5 are genuine and honestly recorded. G5 in particular is a real gap in Feng §A.4: a natural isomorphism after a faithful but non-full functor does not lift to one before it. Everything found here could be fixed in place, so nothing goes back to the designer.

## Files reviewed and corrected

- `research/blueprint/packets/SheafTheoreticSmithTheory.json`: all 65 nodes checked (23 corrected, 42 verified). Requests, sources, source issues and restructure were revised, and the review object was written.
- `research/blueprint/roadmaps/SheafTheoreticSmithTheory.json`: stage `requires` recomputed from the node prerequisites (ST.3 and ST.6 changed); `prerequisites`, the ST.3 and ST.8 descriptions, the readme paragraph on suppliers and the source list updated.
- `research/blueprint/readmes/SheafTheoreticSmithTheory.md`: layer sections regenerated from the corrected packet with the design's own template. I first checked that the template, applied to the original packet, reproduces the original layer sections line for line, apart from one singular/plural label. The supplier table, ownership paragraph, source corrections and register were edited to match. Packet-derived text is now escaped for `src/markdown.js`: the original rendered 46 spans wrongly, such as `T*i*E` as an italic `i` and `Ĥ_O … α_` as italics. A port of the renderer's inline rules finds none in the new file.
- `research/blueprint/suggested/SheafTheoreticSmithTheory.lean`: corrected and extended; details below.

## Counts

| | before | after |
|---|---|---|
| nodes (definition / construction / theorem) | 65 (11 / 12 / 42) | 65 (11 / 12 / 42) |
| API items / unit tests | 69 / 69 (tests without `kind`) | 74 / 70 (every test has a section 12 kind) |
| planets | 41 | 39 |
| sources | 8 | 9 (TV16 added) |
| baseline declarations | 9 | 9 (all confirmed) |
| gaps | 5 | 5 (G2 detail extended) |
| requests | 25 | 25 (one retargeted, one sharpened, 20 point to their upstream pull request) |
| source issues | 21, no verdicts | 24 (E36–E38 added; all have verdicts) |
| stages planned / closed | 9 / 0 | 9 / 0 |

`python3 scripts/check_blueprint.py` on the packet, with the pinned declaration index, reports 0 errors and 0 warnings. `research/blueprint/intake.py check-files` reports no problems for the four files. `lean-check` elaborates the suggested file against Tau Ceti f790474 and Mathlib 082e2d3: 189 lines, and the only warnings are 14 `declaration uses sorry`. `scripts/check_sorry_data.py` passes.

## Sources (item 1)

I downloaded every public source into scratch: the published Feng article from Cambridge Core, and LL21 (arXiv:1708.08174), JMW14 (0906.2994), JMW16 (1403.1647v1), MR18 (1501.07369), MV07 (math/0401222v5), Braden (math/0202251v5) and Treumann–Venkatesh (1407.2346). Every SHA-256 the packet records matches. I read Feng §§1.5, 3–4, pp.39–43 and Appendix A (pp.56–61) in full, and every cited passage of the others. The Stacks tags 051E, 08G1, 0DJJ, 0A5M and 0CKK were read online. In all eight PDFs the printed page equals the PDF page.

- Every `match` repeated the first sentence of the node's statement, followed by the same boilerplate sentence. All 65 are rewritten in my own words to say what the cited place states and how it supports the node. Citations of a second source, previously folded into one locator string, are now separate source entries.
- Locators corrected:
  - the coefficient and σ conventions are Feng §1.5 (Notation), p.7, not "§2.1 and conventions";
  - Nm is Definition 4.12, not a Construction;
  - §3.4.4 is on p.18, and Lemma 3.6 on p.15;
  - the stratified quotient comparison is LL21 Corollary 4.5.2, p.14, not §4.9, p.19;
  - MV07 11.1 is a Proposition (p.31), 12.1 and 14.1 are Theorems (pp.33, 40), and 3.7 is a Corollary;
  - JMW14 pariversities are Definition 2.3 in §2.2;
  - Feng's use of the Lemma 4.24 back face is in the proof of Proposition 5.12(i), p.39, not p.41;
  - E35 sits in the proof of Lemma A.2, which is in §A.4, not "Appendix A.2".

  Several page ranges were also tightened (Lemma 3.9 and Corollary 3.11 on p.16, JMW16 Theorem 1.5 on p.2, Braden Theorem 1 on p.2 and Lemma 6 on p.5).
- A Sonnet cross-check of all 112 locator rows (nodes and findings) against the extracted texts confirmed every page and label. It flagged two match sentences that overstated their passage (MV07 Corollary 13.2, MR18 §6.5). I read both passages and corrected the sentences.
- No verbatim excerpt was found or added.

## Baseline (item 2)

All nine declarations were read at the pins and do what the packet says:

- `DerivedCategory`, `WittVector`, `MonoidAlgebra` and `frobeniusEquiv`;
- `Module.free_of_flat_of_isLocalRing`, which needs `Module.Finite` (the packet uses it only for the finite case and plans the arbitrary-module case);
- `tateCohomology` (top-level abbrev in `Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean`);
- `linearIndependent_monoidHom` (MulOneClass into a commutative domain);
- Tau Ceti `TauCeti.TateCohomology.H0IsoNormQuotient` and `Rep.FiniteCyclicGroup.periodicIso`.

The `tauceti:TauCetiRoadmap/ReductiveGroups#layer-…` anchors match the headings of that README.

## Corrections of substance (items 3–5, 7, 8)

1. **Highest-weight supplier retargeted.** Four nodes requested Weyl and dual-Weyl modules, finite highest-weight ideals and the good-filtration tensor theorem from `LanglandsParameterStacks:LP3`: `satake-standard-comparison`, `tilting-category`, `tilting-tensor` and `derived-tilting-generation`. The accepted LanglandsParameterStacks packet does not plan these. It imports them, through a request to `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-…`, from the candidate ReductiveGroupsIntegralRepresentationsPartII, now part of DESIGN-ReductiveGroupsPartIII (#3357, not yet designed), and it forbids a competing owner. The Feng route brief also names that supplier. The request, the four prerequisite lists, the ST.3 `requires` and the roadmap prerequisites now point there. Tilting modules themselves, their tensor closure and derived generation stay targets of ST.3; a restructure entry asks the Part III design to import them.
2. **Positive characteristic and the JMW condition (new finding E38).** Feng §4.1 says the JMW condition holds for affine flag varieties over any separably closed field, citing JMW14 §4.1, which works over ℂ. Over a field of characteristic ℓ>0 that fails if every étale local system on a stratum is allowed. A one-dimensional Bruhat cell is A¹, and for d≥3 prime to ℓ and a nontrivial character ψ of F_ℓ with values in k^× (which exists because p≠ℓ), the Artin–Schreier sheaf L_ψ(x^d) has H¹ of dimension d−1, so Ext¹ ≠ 0. The same example shows A¹ is not simply connected for k-local systems, the hypothesis of Lemma 4.16. The correct convention is constant local systems on strata, equivalently equivariant ones, since the stabilizers are connected. That is all §4.5 uses, so nothing downstream breaks. `grassmannian-parity`, `jmw-stratification`, `parity-reduction` and the G2 detail now state this.
3. **Treumann–Venkatesh special cases.** The TV16 route brief assigns to this roadmap the Frobenius twist of k-vector spaces as well as algebras (TV §2.1, used for linkage) and the bijection Hom(A,k)^σ ≅ Hom(T⁰A,k) of TV (3.4.1). Neither was in the plan. `frobenius-algebra` gains the module twist (statement, API item, test, use), and `tate-character-extension` gains the bijection as its case A′=A^σ, κ=k, including the remark that χ̃ is k-linear for k-linear χ. TV16 is cited at both.
4. **Requests made precise.** The GS.1 Grassmannian node is stated over powers of the roadmap's global curve. The request now says the carrier is needed over an arbitrary separably closed F of characteristic ≠ p (the fibre of the Beilinson–Drinfeld Grassmannian of A¹_F), geometry only. Twenty requests now say where the item sits upstream:
   - EnhancedDerivedSheaves, pull request #908, Layers E1 and E3;
   - EtaleDualityAndPerverseSheaves, #1040. Its torsion coefficients are Noetherian rings killed by an integer invertible on the base, which covers k, W_n(k) and their group rings; its adic statements are for finite extensions of Q_p only, which confirms G1;
   - ReductiveGroupsPartII, #785, where the same slugs appear in the README;
   - SchemeAndStackFoundations, main #779, §§1.17, 1.21 and 1.23.

   I checked each requested statement against the supplier node and the upstream README; all suffice for the stated need.
5. **API.** Added `smith.coefficientChange` (Psm commutes with reduction O→k, used for the bottom face of Lemma 4.24), `tate_categories.tensorIdeal`, `norm_functor.directSum` (Nm of a sum, §A.3), `actions.fixed_closed` and `frobenius_algebra.moduleTwist`.
6. **Planets.** `reductive-comparison-maps` and `norm-image-comparison` are the G5 and G4 obligations, not named results, so their planets are removed. "Integral comparison on objects" was a caveat and is renamed "Coefficient comparison cube", for Feng's Lemma 4.24 cube. No layer has more than six planets.
7. **Unit tests.** Each of the 70 tests now has one of the five kinds. I recomputed the following:
   - the SL₂ characteristic-3 data: 0→L(1)→Δ(3)→L(3)→0, T(3) of dimension 6, and V⊗V = T(2)⊕T(0);
   - the augmentation-ideal counterexample: I^σ=0 while (I/pI)^σ≠0;
   - the punctured-disc nearby stalk [k[C_p]→k[C_p]] (map 1−σ);
   - the non-invariant-diagonal hyperbolic non-example: the two localizations are k and k[−2];
   - the P¹ index-one Tate endomorphism;
   - the torus example (2,−1,4)↦5;
   - the F₉ linearization checks;
   - the product-algebra and trivial-action Tate diagonals.

   All are right.

## Mistakes in the sources (item 6a)

E15–E34 are the PAPER-FENG-24 findings for §§3–4 and Appendix A, and the extraction lists no other finding in those sections. E35 is the design's own. I checked each at its locator in the published text and confirmed all 21; each verdict records the check. E35's locator is corrected. Three findings are new, each confirmed:

- **E36** (misprint): Lemma A.3 is stated for the constructible Tate category, but its proof starts from an ind-constructible object.
- **E37** (gap, affects nothing): §4.4 invokes LL21 Theorem 5.6.6 under vanishing negative *self*-Ext. That theorem needs vanishing negative Hom between *all pairs* of parity sheaves, without which projection to index zero is not multiplicative. The packet's `normalized-parity` already plans the right condition, and perversity supplies it on Gr.
- **E38** (error, affects nothing): as in correction 2 above.

## Suggested Lean file (item 6)

- `tate_character_extension` stated `∃! ψ` with the norm formula inside the predicate, which hides the real content of Feng's uniqueness: any extension is σ-invariant. It is now `∃! ψ, ψ` extends `χ`. The formula is a separate theorem, `tate_character_extension_pow`, with the transfer-annihilation hypothesis. Without that hypothesis it is false: for `k^p` with rotation, a coordinate projection extends the diagonal character.
- Added `invariant_character_trace_eq_zero`, the easy half of TV (3.4.1).
- Docstring locators corrected: Stacks Lemma 10.101.2, and Feng §3.4.1, p.18.

The file follows the 2026-10-12 shape: sheaf, Tate, parity and Satake carriers do not exist at the pins and remain README targets.

## Closure, granularity, library and structure (items 3, 4, 7, 8)

Every node's sketch follows from its prerequisites at target level, and each stage's targets are realised. All nine stages are correctly `planned`, with `remaining` lists naming G1–G5 and the supplier contracts; none is closed. There is no reviewed audit entry for this new roadmap. Nothing planned here is in Mathlib or Tau Ceti at the pins, nor in a TauCetiRoadmap roadmap. The layer order is sound: ST.3 depends on no later layer, and ST.8 needs only ST.0 and ST.5's twist interface.

Ownership checks:

- GlobalShtukasAndFunctionFieldLanglands GS.1 plans classical Satake with rational coefficients only, and GeometricSatakeAndFusion plans only the B_dR^+ Grassmannian. So ST.3 is the sole owner of modular equal-characteristic Satake, and ST.6 of its constant terms, as REV-PAPER-FENG-24 decided.
- A restructure entry records that the ShtukaTateCohomologyAndGlobalBaseChange Part II must import ST.3. That route's item 53, the k-coefficient Satake functor on shtukas, needs it.

## Questions for the orchestrator

1. G3, the Mautner–Riche exotic/Soergel engine behind parity perversity for every good prime, has no owner anywhere in the atlas. Its owner needs deciding.
2. Highest-weight theory: DESIGN-ReductiveGroupsPartIII (#3357) should plan Weyl and induced modules, good filtrations and the Donkin–Wang–Mathieu theorem, and should import, not replan, the tilting modules of ST.3. LanglandsParameterStacks LP3 waits on the same owner.
3. E38 applies to any roadmap that transports complex parity-sheaf results to étale sheaves in positive characteristic, for example the planned ShtukaTateCohomologyAndGlobalBaseChange Part II. Its design should adopt the constant-local-system convention.
4. G1 still proposes EtaleDualityAndPerverseSheaves, Part II for W(F̄_p)-adic coefficients. That roadmap is now TauCetiRoadmap pull request #1040, so the extension would go upstream as its Part II.
