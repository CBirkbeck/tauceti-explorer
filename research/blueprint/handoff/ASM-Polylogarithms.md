# Handoff: ASM-Polylogarithms (issue #6424)

This job assembles the roadmap *Polylogarithms, explicit regulators and Zagier statements* from its six parts:

- P.1–P.6, written by BP-Polylogarithms, reviewed by REV-Polylogarithms, then brought in line with the confirmed K-theory and topology red-team findings by fix rounds accepted by REV-FIX-RT-AREA-topology~3 (2 October 2026);
- P.2, P.3, P.4, P.5 and P.6, written by BP-Polylogarithms--P.2 … --P.6 and reviewed by the matching REV jobs on 6 October 2026. P.2, P.4, P.5 and P.6 are **accepted**; **P.3 is `needs_changes`** (see below).

Worker: Claude, session claude-5AkkY1. I took no part in any of the parts or their reviews.

## Files

- `research/blueprint/readmes/Polylogarithms.md`: the full roadmap document (about 97,000 words). It replaces the first part's document, which was a field-by-field dump of the first packet.
- `research/blueprint/suggested/Polylogarithms.lean`: the six parts' suggested files, joined into one. It replaces the first part's file.
- `research/blueprint/handoff/ASM-Polylogarithms.md`: this note.

The part packets are not deliverables of this job (the intake accepts only the three paths above), and they are unchanged. The fixes they need are listed below for a job that owns them, as ASM-HabiroRings and ASM-HabiroCyclotomicCompletions did.

## The P.3 part's verdict

REV-Polylogarithms--P.3 corrected the packet in place (both configuration coefficients, the rejected p. 298 finding, locators, a baseline kind, three parent conclusions removed from proof inputs, the P.5 residue supplier) and returned `needs_changes`: the suggested file must bind the first packet's B₂/B₃ symbols, differential laws, Γ, L₃ and regulator into the comparison, descent and special-value signatures, and add discriminating tests (a nonzero stabilised-cycle fixture, the quadratic transfer test, the nonzero geometric triangle class). No revision round (`BP-Polylogarithms--P.3~2`) is in the queue yet. The assembly takes the corrected P.3 packet as it stands: its mathematics is in the document, its two gaps on signatures and tests are listed, and the joined Lean file keeps the P.3 part's honest "not stated" comments. Once the revision is accepted, the document's P.3 node sections should be regenerated from the revised packet and the joined file's P3FollowUp section replaced by the revised file.

## What was done

- **The document** is generated from the six packets as their reviews left them, so it agrees with them node for node.
  - All 169 nodes (75 + 14 + 27 + 18 + 33 + 2) are there, with every statement, hypothesis, proof outline, API item, unit test, acceptance check, use, dependency, library record, prototype status and source. A scripted check finds every node id, API name, test name, prerequisite, planet name, request supplier, source id, source issue id and baseline declaration in the document; all 233 source excerpts appear verbatim.
  - Every follow-up review asked that its reader be brought in line with the corrected packet at assembly (P.2: E24 and the ownership wording; P.3: the −(1/5) sign, the rejected p. 298 finding, dates and locators, the Suslin coefficient, the residue supplier; P.4: the ℚ(i) exponent, both slips of (1.28c), the Zagier locator, the rational-curve homotopy attribution; P.5: twelve node and locator corrections, the El Mir gap, the removed Borel request, the G05 URL, E25–E29). Generating the node text from the corrected packets does this; no part document's node text is reused.
  - **New sections:** a preface with the six packets; purpose and scope with what is not here; boundaries (suppliers, consumers from the citing packets, and an owners table from the confirmed red-team findings and the proposals); conventions reconciling the parts' notation; sources grouped by file across the parts' aliases with the versions read; the 111 pinned declarations; a layer overview with the paths to the main theorems; a written overview for each layer saying how the parts fit; the merged source issues, gaps (each with its status after assembly), requests (table and full text) and structural proposals (each with its status); dependencies; and what the blueprint does not claim.
  - **Assembly notes.** 34 first-packet nodes are followed by an Assembly note that carries a reviewer's instruction or a cross-part fact into the node; none changes a packet. They are the items of "Fixes the part packets need" below, plus pointers to the follow-up nodes that now answer a first-packet gap.
  - **P.5's planets.** The first packet has 6 planets on P.5 and the P.5 part 6 more, twelve in all. The document displays P.5 as the three sub-layers the P.5 part proposes (its proposal 4), in the order P.5:currents (16 nodes, 4 planets), P.5:curves (16 nodes, 3 planets), P.5:regulators (31 nodes, 5 planets); no node uses a node of a later sub-layer. Node ids are unchanged. The membership of each sub-layer is in the document's layer sections, and in `P5GROUPS` of the generator description below. Every other layer has at most six planets (P.2 and P.4 have six; P.6 two, one of which belongs to I.2).
  - **Notation.** Node prose converts the ASCII forms pi, infinity, zeta(, >=, <=, !=, -> and |-> to π, ∞, ζ(, ≥, ≤, ≠, → and ↦, outside code spans; names, code, locators and excerpts are untouched. The Conventions section records what the remaining letters mean (C, R, Q, Z, F^x, Lambda^n, Q-bar), the three cross-ratio conventions and their conversions, Lobachevsky's Λ (the first packet's L(θ)), B(F; n) = Γ(F, n), the Zagier exponent e = n(N − d_n), the Tate-coordinate π^{n−1}, and the raw and BFT current normalisations.
- **Cross-part prerequisites.**
  - Every prerequisite that names a node of this roadmap names an existing node; all 83 references from follow-ups go into the first packet; no follow-up cites another follow-up. The node graph of the six packets is acyclic, also with every other packet on main.
  - Stage level: beyond the atlas links P.1 → P.2, P.2 → P.3, P.3 → P.4, P.2 → P.5, P.4 → P.6 and what they imply, the nodes induce P.3 → P.5, P.4 → P.5 and P.5 → P.6 (to add at promotion), and one backward edge, P.4 → P.3, from `P.3/conditional-complex-transfer` (fix 9 below).
  - Several first-packet nodes should cite follow-up nodes. Each proposed edge below was checked for cycles against the six packets; edges that would close a cycle (a follow-up node that itself uses the first-packet node) are not proposed, and the first packet's gap text is updated instead.
- **`check_blueprint.py`**, with the pinned declaration index, reports 0 errors and 0 warnings on all six part packets (the packets are unchanged).
- **The Lean file.**
  - One standard note, one import block (the union of the six parts' Mathlib imports; no Tau Ceti import, as in every part), one `noncomputable section`. The first packet's body comes first, in layer order, in `section FirstPacket`; the follow-ups follow in `P2FollowUp` … `P6FollowUp`, each with its own `open`s and options, so nothing leaks between parts.
  - Namespaces are the packets': `TauCeti.Polylog` (first packet, P.2, P.6), `TauCeti.Polylog.WeightThree` (P.3), `TauCeti.Polylog.WeightFour` (P.4), `TauCeti.CurveRegulator` (P.5, as its packet records). No name changed.
  - Duplicates are replaced by the first packet's declarations: P.2's `lobachevsky` (identical body; the first packet's now carries the P.2/lobachevsky-function docstring), P.2's local notation `D` (its integral formula is the definition of `blochWigner`, now bound to it), P.6's supplier prototypes `polylog`, `singleValuedPolylog`, `blochWigner`, and P.3's `UnitsQ` (now `TauCeti.Polylog.unitsQ`).
  - `lean-check` at the pinned Mathlib 082e2d3 (memory available 97 GB): **exit 0, only warnings are 462 `declaration uses 'sorry'`**. The six part files give 216, 52, 73, 83, 32 and 7 (463); the removed `polylog` prototype accounts for the difference.
  - Of the 455 API and declaration names of the packets, 354 are declarations and `#check` succeeds for each (checked in a scratch copy, not committed). The other 101 are named in comments with their statements, as the parts left them: the first packet's 51 signatures needing unavailable objects (currents, Chow varieties, hyperbolic space, Deligne complexes, K-groups), the P.3 part's 42 (27 API items and 15 theorems, the review's inventory), the P.5 part's 7 global-carrier signatures and the P.2 part's ideal-tetrahedron theorem. Every unit-test name appears with its example.

No reviewed mathematics was changed. The document's hand-written parts (preface, scope, boundaries, conventions, layer overviews, assembly notes, statuses, dependencies) describe the packets; where they say how a first-packet statement should be read (for example the rank-graded domain of the weight-three comparison), they repeat what the follow-up packet or its review states.

## Fixes the part packets need (not deliverables here)

None of these changes a statement's mathematics beyond what an accepted follow-up or review already states. Each added prerequisite was checked to keep the graph acyclic.

1. **`P.2/borel-comparison`** (first packet). Replace "BorelRegulators R.7 owns them (gap)" in the statement and step 5 by P.2's ownership of the exact scalar (RT-AREA-ktheory-2/23; P.2 part proposal 1); add `P.2/goncharov-elementary-calibration` as a prerequisite; replace the first packet's gap 6 by a pointer to the P.2 part's gap 1.
2. **`P.2/hyperbolic-volume`**: add `P.2/milnor-angle-volume` (REV-Polylogarithms--P.2 asks it be the direct proof input); replace step 2's "(gap)"; the first packet's gap 7 becomes "answered conditionally on the P.2 part's gap 2". **`P.2/lobachevsky-identity`**: add `P.2/lobachevsky-function` (its L(θ) is that function).
3. **`P.2/certified-numerics`** and **`-error`**: add `P.2/rational-fourier-approximation`, respectively `P.2/rational-fourier-error`, and replace step 2's near-circle expansion by the Fourier route (REV-Polylogarithms--P.2); delete the first packet's gap 9.
4. **First packet P.3.** `P.3/k-theory-comparison-weight-three`: add `P.3/stabilized-configuration-comparison` and `P.3/rank-two-vanishing`, and state the induced map's domain as the rank-graded quotient, not all of K_{6−i} (P.3 part's upstream note). `P.3/trilogarithm-regulator-borel`: add `P.3/rational-regulator-calibration` and `P.3/trilogarithm-descent`, and say the multiple is rational for Borel's original normalisation and π²·ℚ^× against R.4's coordinates. `P.3/milnor-degree-comparison`: add `P.3/steinberg-boundary-image`. `P.3/weight-three-special-value`: part (b) is `P.3/every-family-special-value` (which uses this node, so cite it in the text, not as a prerequisite), with the orientation det = q·period. Gaps 1 and 2 of the first packet: update to the statuses in the document's Gaps section.
5. **First packet P.4.** `P.4/specialization-and-delta`: add `P.4/relation-specialization-induction`. `P.4/polylog-on-higher-bloch`: add `P.4/cycle-constancy`. `P.4/explicit-to-inductive-comparison`: add `P.4/suslin-rigidity-adapter`. `P.4/zagier-statement`: drop or qualify the parenthesis "equivalently, when d_n ≥ 1, Z_n(y) = ζ_F(n) after rescaling y_1" (P.4 part's assembly note) and add `P.4/rational-existence`. `P.4/weight-four-theorem`: add `P.4/weight-four-totally-real`; its part (b) note points to `P.4/weight-four-determinant-lifting` and the P.4 part's gap 3 (that node uses this one, so in text only). `P.4/higher-bloch-group`: add the P.4 part's note that the rational-curve recursion is not Goncharov 1995's all-smooth-curve quotient.
6. **First packet P.5.** `P.5/r-forms-and-distributions`: add `P.5/manifold-currents` and `P.5/analytic-cycle-current`. `P.5/chow-polylogarithm-forms`: add `P.5/admissible-chow-locus`. `P.5/higher-arakelov-chow-degree-zero`: add `P.5/green-presentation`, and replace "has no owner in the atlas (gap)". `P.5/r-form-differential`: add `P.5/r-wang-comparison` for the sign. Update the first packet's gaps 11–16 and 18 to the statuses in the document.
7. **`P.5/beilinson-comparison-assembly`** (P.5 part) lists `P.5/regulator-induces-beilinson` as a prerequisite although its proof steps do not use it; the intended direction is the reverse (the first packet's comparison is proved by the assembly, up to the raw-model conversion gap). Removing that edge and adding `P.5/beilinson-comparison-assembly` to `P.5/regulator-induces-beilinson` is acyclic.
8. **First packet P.6.** `P.6/tests`: add `P.6/single-valued-trilogarithm-differential` and replace test (4)'s finite-difference clause by the exact tests (P.6 part, REV-Polylogarithms--P.6); remove only the weight-three clause of the first packet's gap 1. `P.6/leopoldt-statement`: remove the use that claims ownership in P.6 and the planet (both belong to IntegralIwasawaTheory I.2, RT-AREA-ktheory-2/26), and cite I.2's node ids once its packet has them. The P.6 coverage record's remaining item is answered.
9. **`P.3/conditional-complex-transfer`** (P.3 part) makes P.3 and P.4 depend on each other at stage level. Either give the node to P.4 (it assumes `P.4/homotopy-conjecture`) or replace its stage prerequisite `Polylogarithms:P.4` by `P.4/homotopy-conjecture` and `P.4/weight-four-residue-map`, keeping the residue at infinity as its open input. Both keep the node graph acyclic.
10. **Source issue ids.** The P.6 part's `Polylogarithms/E22` collides with the P.2 part's `Polylogarithms/E22`; renumber the P.6 one to `Polylogarithms/E30` (and in the register, `research/errata/REGISTER.md` and `data/source-issues.json`, which the errata script regenerates).
11. **Stale coverage.** The first packet's P.2–P.6 coverage records still read `partial` with remaining items the follow-ups answer or refine; its P.4 coverage still lists Suslin's rigidity as requested, which the P.4 part's `P.4/suslin-rigidity-adapter` now consumes.

## Structural proposals and ownership

All twenty proposals are given in full in the document's "Structural proposals" section, each with its status.

| Proposal | Part | Status |
|---|---|---|
| Bloch–Wigner nodes belong to P.1, not K3BlochGroups V.3 | first 1 | implemented in packets; retire V.3's reserved ids (maintainer) |
| Part II for the proof of the weight-four theorem | first 2, P.4 1 | current; P.4 1 gives the exact targets (GR 1.13–1.14, 1.15, 7.6, 9.1, §9.3) |
| P.5 owns η(f, g); M.8 owns the general Deligne complex | first 3, first 7, P.5 1 | awaiting the maintainer's split of M.8 into an early prefix |
| P.3 owns the explicit complexes, P.4 the inductive groups | first 4 | applied; one new P.4 → P.3 edge (fix 9) |
| P.4 owns the normalised Zagier determinant | first 5 | applied |
| The Rogers dilogarithm: plan it once as `P.1/rogers-dilogarithm` | first 6 | awaiting the maintainer; no packet plans it |
| Retained mathematics and common foundations (RT-AREA-ktheory-2/23–27) | first 8 | current |
| Early ideal-tetrahedron geometry in GeometricTopology, Part II | first 9, P.2 3 | awaiting the maintainer |
| P.2 owns the analytic regulator comparison; V.6 transports, R.7 consumes | P.2 1 | awaiting the maintainer |
| P.2 → ArithmeticQuantumTopology QT.5 for ideal-tetrahedron volume | P.2 2 | awaiting the maintainer |
| Part II exports of GeneralAlgebraicKTheory, K3BlochGroups, BorelRegulators, K2SymbolsBrauer | P.3 1 | awaiting the maintainer |
| Supplier additions to K3BlochGroups V.4, BorelRegulators R.7, SchemeKTheoryOperations S.6 | P.4 2 | awaiting the maintainer |
| AlgebraicModuliForArithmeticGeometry, Part II: Chow parameter spaces | P.5 2 | awaiting the maintainer |
| Complex comparison, Part II: smooth-manifold analytic foundations (C5) | P.5 3 | awaiting the maintainer |
| P.5 as three presentation groups | P.5 4 | displayed in the document; awaiting the maintainer for the atlas |
| I.2 owns completed units, strong Leopoldt and defect; links I.2 → P.6, L4, L0 | P.6 1 | awaiting the maintainer |

**For the maintainer.**

- **P.5 sub-layers.** P.5:currents: compact-test-forms, manifold-currents, analytic-cycle-current, current-resolution, poincare-lelong, r-form, r-forms-and-distributions, residue-map, r-form-differential, simplex-form, admissible-chow-locus, chow-polylogarithm-forms, logarithmic-green-forms, logarithmic-current-estimate, green-current-comparison, green-presentation. P.5:curves: curve-polylogarithmic-complex, weight-two-regulator-form, unramified-weight-two-class, curve-symbol-chern-comparison, chow-dilogarithm, strong-reciprocity-conjecture, strong-reciprocity-implies-suslin, reciprocity-second-triangle, chow-dilogarithm-steinberg, chow-dilogarithm-projective-line, reciprocity-projective-line, chow-dilogarithm-families, reciprocity-algebraic-numbers, chow-dilogarithm-on-elliptic-curves, chow-dilogarithm-plane-curves, general-weight-reciprocity-conjecture. P.5:regulators: the other 31 P.5 nodes (Goncharov's Deligne complex and regulator, the Arakelov complex and Gersten assembly, the BFT comparison chain, and the weight-three and elliptic nodes).
- **Unanswered requests to this roadmap**, listed in the document's Gaps section: the Rogers dilogarithm (K3BlochGroups V.3/V.5, HabiroNahmSeries HB.3/HB.4, ArithmeticQuantumTopology QT.5); the five-term identity of Li₂ itself (HabiroNumberFields HB.2); the cross-ratio identities over an arbitrary field and Li₁ at roots of unity (ColemanIntegration L2/L3); de Jeu's complexes and his map to K-theory (ColemanIntegration L3, PadicHodgeRegulators D.1/D.2, addressed to the stage P.4); the residue at infinity of the weight-four complexes (the P.3 part's request to P.4). The first is a structural proposal; the others need a follow-up blueprint job on P.1 and P.4.
- **Other roadmaps' citations.** NoncommutativeAndEquivariantIwasawa NE.7 cites `P.6/leopoldt-statement`; under RT-AREA-ktheory-2/26 it should cite I.2.
- **Stage links to add at promotion:** P.3 → P.5, P.4 → P.5, P.5 → P.6; and the proposed P.2 → QT.5 and I.2 → P.6.

## Requests of the parts

The parts file 42 requests with 27 suppliers, tabulated in the document's Requests section:

| Supplier | Requests | From |
|---|---|---|
| K3BlochGroups V.3, V.4, V.6 | 1, 3, 1 | first; V.4 also P.3 (rational symmetrised resolution) and P.4 (Suslin Corollary 5.6) |
| BorelRegulators R.3, R.4, R.5, R.7 | 1, 1, 1, 2 | first; R.7 from P.3 (configuration class scalar) and P.4 (π^{n−1} calibration) |
| MotivicEtaleKTheory M.4, M.6, M.8 | 2, 2, 2 | first and P.5 (M.8 as an early prefix) |
| K2SymbolsBrauer T.2, T.3, T.4 | 1, 2, 1 | first; T.3 also P.3 (degree-three Milnor–Quillen transfer) |
| SchemeKTheoryOperations S.4, S.6 | 1, 2 | first; S.6 also P.4 (number-field Adams purity) |
| GeneralAlgebraicKTheory K.2:plus | 2 | first, P.3 (primitive Hurewicz, rank filtration, κ) |
| IntegralIwasawaTheory I.2, L4 | 2, 2 | first, P.6 |
| PadicHodgeRegulators D.1 | 2 | first, P.6 |
| AlgebraicModuliForArithmeticGeometry R09.2, R09.7 | 1, 2 | P.5; R09.7 also first |
| ComplexComparisonPartII C0, C5 | 1, 1 | P.5 |
| AutomorphicFormsOnReductiveGroups AF.1a | 1 | P.2 (degree-three van Est, measurable cocycles) |
| Tau Ceti GeometricTopology layers 7, 8 | 2, 2 | first, P.2 |
| Polylogarithms P.4 | 1 | P.3 (weight-four residues and homotopy) |

## For the reviewer

- **The superseded part documents.** `readmes/Polylogarithms--P.2.md` … `--P.6.md` are superseded by this document. They are not this job's files and were not edited; their reviews list where they lag the corrected packets.
- **The generator.** The node sections, coverage records, library list, sources, source issues, gaps, requests and proposals are generated from the packets by a script kept in scratch space (not committed). The hand-written parts are the preface, purpose and scope, boundaries, conventions, layer overviews, sub-layer introductions, assembly notes, gap and proposal statuses, the unanswered-requests list, dependencies and the closing section. To regenerate after a packet changes, render each node as the document does (statement, hypotheses, construction or proof, API, tests, acceptance, uses, dependencies, users, library, prototype, sources, assembly note) and keep the hand-written parts.
- **Checks run.** `python3 scripts/check_blueprint.py` on all six packets with the pinned index: 0 errors, 0 warnings. Name and excerpt coverage of the document: complete. `lean-check` of the joined file: exit 0, 462 `sorry` warnings and nothing else. `#check` of the 354 declared names: all succeed.
