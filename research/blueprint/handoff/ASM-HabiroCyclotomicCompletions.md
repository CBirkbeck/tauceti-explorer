# Handoff: ASM-HabiroCyclotomicCompletions (issue #6419)

This job assembles the roadmap *Cyclotomic completions and classical Habiro rings* from its three reviewed parts. The parts and their reviews are:

- HC.1–HC.6, written by BP-HabiroCyclotomicCompletions and reviewed by REV-HabiroCyclotomicCompletions;
- HC.4, written by BP-HabiroCyclotomicCompletions--HC.4 and reviewed by REV-HabiroCyclotomicCompletions--HC.4;
- HC.6, written by BP-HabiroCyclotomicCompletions--HC.6 and reviewed by REV-HabiroCyclotomicCompletions--HC.6.

Worker: Claude, session claude-DDCZ1y. I took no part in any of the parts or in their reviews.

## Files

- `research/blueprint/readmes/HabiroCyclotomicCompletions.md`: the full roadmap document. It replaces the first part's document, which described that packet before its review.
- `research/blueprint/suggested/HabiroCyclotomicCompletions.lean`: the three parts' suggested files, joined into one. It replaces the first part's file.
- `research/blueprint/handoff/ASM-HabiroCyclotomicCompletions.md`: this note.

The part packets are not deliverables of this job, so they are unchanged. The fixes they need are listed below for a job that owns them.

## What was done

- **The roadmap document** is generated from the three packets as their reviews left them, so it agrees with them node for node.
  - All 107 nodes (48 + 59 + 0) are there: every statement, hypothesis, proof outline, API item, unit test, acceptance check, use, dependency and source.
  - All 161 source excerpts appear verbatim, and a scripted check finds every node id, API name, test name, prerequisite and source issue in the document.
  - The introduction is new: purpose and scope; boundaries, with the RS-10 owners and every consumer, from the atlas stage links, the RS-10 links and the packets that cite this roadmap's node ids; conventions; sources, with every alias of their source ids; the 119 pinned declarations; and a layer overview.
  - Each layer has a short overview. The closing sections merge the parts' 23 source issues and the HC.6 part's four reused findings, the two gaps, the eight structural proposals with their current status, and the layer dependencies.
  - It adds a table of the requests other roadmaps have filed with this one, with the node ids that answer each.
- **HC.4** is displayed in the two sub-layers the HC.4 part proposes: HC.4a, classical rigidity, has 17 nodes and 5 planets; HC.4b, the integral Taylor comparison of GSWZ §5.1, has 57 nodes and 6 planets. The node ids are unchanged.
- **Notation.**
  - The first part follows Habiro and the HC.4 part follows GSWZ, and many nodes of both are written in ASCII. The document's node prose uses one set of spellings: Φ_n, ζ, σ_ζ, ρ, ε, →, ⇒, ⇔, ≤, ≥, ≠, and ℤ, ℚ, ℕ, 𝔽_p where they denote number systems. Code spans, Lean names and literal excerpts are untouched.
  - A standalone Z is left alone in the three nodes and three source issues where Habiro uses Z for a set of roots of unity.
  - The conventions record the two index shifts (GSWZ's digit n is HC.2's digit n − 1; precision N in HC.4b is the quotient by P_{N−1}) and the two Taylor coordinates.
  - They also record the clash of names between Habiro's ι : R[q] → R[q]^S and GSWZ's Taylor comparison, which the document writes `iota`, as the HC.4 part and the Lean file do.
- **Cross-part prerequisites.**
  - Every prerequisite of the HC.4 part that points into the first packet names an existing node id: 27 references to 12 nodes of HC.1–HC.5. The first packet never refers to the later parts.
  - The node graph of all three packets is acyclic, also through the one external node `HabiroRings:HR.2/habiro-complete-modules`, whose prerequisites never return to this roadmap.
  - Two nodes of the HC.4 part use a node of HC.5, which the atlas places after HC.4: `HC.4/odd-order-idempotent-example` and `HC.4/companion-projector` use `HC.5/inverting-a-prime-and-the-rational-case`. At node level this is acyclic; at stage level it runs against the layer order. The document records it, under Dependencies.
  - One cross-part reference is missing; it is the first packet-side fix below.
- **`check_blueprint.py`**, with the pinned declaration index, reports 0 errors and 0 warnings on all three part packets. `intake.py check-files` passes on the two document files.
- **The Lean file.**
  - It has one standard note, one import block (the union, 40 Mathlib modules) and one namespace, `TauCeti.Habiro`.
  - The HC.4 part's declarations sit in `TauCeti.Habiro.HC4`, the namespace its packet records. Its two finite-domain lemmas stand before Habiro's rigidity theorems, and the integral comparison after them. The HC.6 part's 39 examples are at the end.
  - The HC.4 part's own sketch of the completion is replaced by the objects of HC.1–HC.3. That sketch was `naiveCompat`/`Naive`, its own `factorialPoly` and `fromPoly`, `hProjection`, `digit`, `naiveMap`, `additiveTaylor` and `substituteTwo`. They become `HabiroRing R`, `factorialPoly`, `fromPoly R Set.univ`, `projFactorial`, `factorialCoeff R h (n - 1)`, `mapRing R Set.univ`, `taylorAt` at the universal root, and `powSubst`. The HC.6 examples use `factorialPoly` instead of a local product.
  - One instance is added, `HC4.instCommRingHabiroRing : CommRing (HabiroRing R) := Subalgebra.toCommRing _`. Without it, instance search does not find the quotients `HabiroRing R ⧸ hFiltration R N`; the first part's file notes a similar timeout for `IsTopologicalAddGroup`. It is a prototyping device, not a packet item.
  - Every node id, API name and unit-test name of the packets appears in the file. All 147 examples of the three files are kept.
  - `lean-check` at the pinned Mathlib 082e2d3 exits 0. Its only warnings are 380 `declaration uses 'sorry'`: the parts' 230 + 118 + 39, less the seven placeholder declarations of the replaced sketch. The file imports no Tau Ceti module.

## Fixes the part packets need (not deliverables here)

1. **`HC.4/rootwise-taylor-injectivity` (first packet) should cite the HC.4 part's transfer lemmas.**
   - Add `HabiroCyclotomicCompletions:HC.4/finite-domain-module-embedding` and `HabiroCyclotomicCompletions:HC.4/finite-domain-separation-transfer` to its prerequisites. Both depend only on Mathlib, so no cycle arises.
   - Replace its last hypothesis (the Noetherian transfer through Krull's intersection theorem) by a reference to the transfer lemma. `mathlib:Ideal.iInf_pow_eq_bot_of_isDomain` can then go.
   - Remove the gap "Theorem 5.2 for non-Noetherian coefficient rings".
   - No statement changes. The HC.4 review asked the assembly to resolve this gap; it could not be done without editing the first packet.
2. **The first packet's coverage of HC.4 and HC.6 is superseded.**
   - It still reads `partial`, with remaining items. The HC.4 part closes HC.4, planning GSWZ §5.1 and fixing the Theorem 6.2 scope. The HC.6 part closes HC.6, and RS-10, accepted on 29 September 2026, settles its open item.
   - The HC.6 note and several restructure entries of the first packet still say that RS-10 is "not accepted".
3. **The second gap of the first packet** ("Theorem 6.2 when the fraction field of R meets the cyclotomic fields") is outside the scope fixed by the HC.4 part's rescope proposal. Once the maintainer accepts that proposal, the gap should become a recorded non-goal.

## Notes for other roadmaps

- **HabiroNumberFields.**
  - `HB.6/ring-operations-and-the-classical-comparison` lists the stage `HabiroCyclotomicCompletions:HC.4` beside its node prerequisites. Its packet's request to HC.4 (GSWZ §5.1: M_N, the determinants, Proposition 5.2) is answered by `HC.4/taylor-matrix`, `HC.4/finite-taylor-coordinate-matrix`, `HC.4/leading-factor`, `HC.4/graded-taylor-map`, `HC.4/finite-taylor-determinant`, `HC.4/finite-taylor-determinant-positive`, `HC.4/finite-taylor-injective`, `HC.4/global-integral-image-criterion` and `HC.4/local-integrality-detection`. The stage citation should become these node ids.
  - The determinant is δ_N = ∏_{1≤n<N} D_1(n)D_2(n), not the printed product through N (source issue E19).
- **The elementary q-toolkit** has no planning node here. RS-10's reason for keeping HC.1 says to incorporate it (PLAN-HABIRO §6.1), but QSeriesPartitionsAndMockModularForms plans it in QM.0, and the reviewed HabiroNahmSeries packets already cite QM.0's nodes.
  - Recommendation: let QM.0 own the toolkit. HC.1 keeps only the polynomial P_N, which is QM.0's (q; q)_N under R[q] ⊂ R[[q]].
  - The ArithmeticQuantumTopology request to HC.6 for the quantum binomial identities should be redirected to QM.0.
- **ArithmeticQuantumTopology.** Three QT.4 nodes state a "limit point" hypothesis: `QT.4/determination-by-WRT`, `QT.4/general-simple-lie-type` and `QT.4/the-coefficient-ring-may-not-be-changed`. That hypothesis asks for Habiro's open Conjecture 6.1. This roadmap supplies Theorem 6.1 under its adjacency condition, and the failure for finite sets.
- **Stage texts.** The stage texts of HC.4 (GSWZ §5.1, the Theorem 6.2 scope), HC.5 (no derived-limit correction) and HC.6 (the comparison with ℚ's Habiro ring moved to HB.6) lag the accepted proposals; the document's Structural proposals section gives each.

## Structural proposals of the parts

All eight are given in full in the document's "Structural proposals" section, each with its status.

| Proposal | Part | Status |
|---|---|---|
| Move the F = ℚ comparison test from HC.6 to HB.6 | first | settled by RS-10; HB.6 should cite HC.4b node ids instead of the stage HC.4 |
| Derived-limit corrections belong to HR.2; the ordinary module completion is exact | first | settled by RS-10; the HC.5 stage text is to be reworded |
| The elementary q-toolkit has two planned owners | first | open; recommendation above |
| Bring the HC.4 stage text in line with PLAN-HABIRO | first | the planning is done by the HC.4 part; the stage text is still to be changed |
| HC.2: the normal form is in the source, the algorithms are not | first | a stage-text note only |
| Two consumer statements that HC cannot supply as written | first | HB.6 half done; QT.4 half open |
| Rescope HC.4: add GSWZ §5.1, keep the irreducible case of Theorem 6.2 | HC.4 | awaiting the maintainer |
| Split HC.4 into HC.4a (17 nodes, 5 planets) and HC.4b (57 nodes, 6 planets) | HC.4 | awaiting the maintainer; the document already displays it. The two finite-domain lemmas belong to HC.4a although they live in the HC.4 packet. |

## Requests of the parts

None of the three packets files a request. The one cross-roadmap input is cited by node id: `HabiroRings:HR.2/habiro-complete-modules`, cited by `HC.5/ordinary-versus-derived-completion`. The requests other roadmaps have filed with this roadmap are tabulated in the document's Requests section, with the nodes that answer them.

## For the orchestrator and the reviewer

- **The superseded part documents.** `readmes/HabiroCyclotomicCompletions--HC.4.md` and `--HC.6.md` are superseded by the assembled document. They are not this job's files and were not edited. The HC.4 one still gives the pre-review node counts, for instance "the thirty-four new comparison declarations"; the packet has 57.
- **The packets carry 11 planets on HC.4**, more than the six a layer may show, until the split is applied.
- **No reviewed mathematics changed.** No node statement, hypothesis, prerequisite or verdict of any packet was edited; the document's prose differs from the packets only in notation. The Lean file changes signatures only where the HC.4 part's sketch objects were replaced by the first part's, and it keeps every name the packets give.
