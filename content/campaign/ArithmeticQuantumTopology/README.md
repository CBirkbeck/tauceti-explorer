# Arithmetic quantum topology, Habiro invariants and regulators

Revision: 2026-09-15. Curriculum extension; every stage requires source decomposition before proof execution.

## Scope and ownership

Supply the actual topological and quantum constructions connecting Habiro completions, quantum invariants, Bloch groups and arithmetic q-series. Existing Habiro roadmaps retain their ring and Nahm-series ownership. This extension separates proven integrality/comparison theorems from volume, quantum-modularity and asymptotic research conjectures.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). Construction specifications below do not assert that their interfaces or proofs already exist in Tau Ceti. Source acquisition, statement inspection, proof decomposition, elaboration and kernel-checked completion are distinct states.

## Stages

### QT.0 Framed links, surgery and normalization

**Construct and export.** Construct oriented framed links/tangles, isotopy equivalence, composition and tensor product; prove the Reidemeister/framing rules used by the chosen combinatorial model. Construct surgery presentations of oriented closed three-manifolds and formulate/prove the needed Kirby move theorem through a sourced topology development. Fix framing anomaly and orientation conventions.

**Inputs.** `FoundationsAndLibraryIntegration:LI.0`, `FoundationsAndLibraryIntegration:LI.4`

**Acceptance.** Compute the empty-link presentation of S3 and the effects of blow-up/blow-down and handle slide on linking matrices. A surgery invariant must descend through actual Kirby equivalence.

**Source route.** Acquire original Kirby-calculus/topological-category proofs; AE-HABIRO specifies the surgery conventions used downstream.

**Known/conjectural boundary.** A quotient of link diagrams is not automatically identified with a manifold invariant without the presentation and move theorems.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### QT.1 Ribbon categories and quantum group invariants

**Construct and export.** Construct ribbon categories, duals, braidings, twists and quantum traces, then the relevant Uq(sl2) modules and integral forms. Prove diagrammatic isotopy invariance and specialize at roots of unity through the admissible semisimplified/category construction. Derive the Reshetikhin–Turaev surgery normalization with its nonzero denominator conditions.

**Inputs.** `ArithmeticQuantumTopology:QT.0`

**Acceptance.** Calculate the unknot and Hopf link, check orientation/duality and framing-change formulas, and prove all denominators used at each allowed root are invertible.

**Source route.** Acquire primary Reshetikhin–Turaev construction; AE-HABIRO quantum-group and colored-link conventions.

**Known/conjectural boundary.** Root-of-unity representation categories are not generically semisimple. Integral forms, generic q and specialized categories require separate comparisons.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### QT.2 Colored Jones polynomials and cyclotomic expansions

**Construct and export.** Construct colored link polynomials with the selected reduced/unreduced normalization. Prove Habiro cyclotomic expansion and divisibility for the exact link class used in surgery. Build finite truncations and prove coefficient integrality and specialization compatibility before passing to any completion.

**Inputs.** `ArithmeticQuantumTopology:QT.1`, `HabiroCyclotomicCompletions:HC.1`

**Acceptance.** Verify unknot and one nontrivial knot coefficients, with the color index and (q;q)n convention fixed. An observed polynomial divisibility in examples is not the general integral-form theorem.

**Source route.** AE-HABIRO integral quantum-group and cyclotomic-expansion sections; theorem-level locators pending.

**Known/conjectural boundary.** A Habiro expansion depends on normalization and the precise invariant. It cannot be assigned to arbitrary q-series merely because root evaluations exist.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### QT.3 Unified invariants of integral homology spheres

**Construct and export.** Use the integral surgery expansion to construct the unified invariant in the existing cyclotomic completion. Prove convergence in that completion, independence under Kirby moves and orientation compatibility. Export a well-defined invariant of integral homology spheres, with the exact ring-valued map used for later evaluations.

**Inputs.** `ArithmeticQuantumTopology:QT.2`, `HabiroCyclotomicCompletions:HC.4`

**Acceptance.** Prove J(S3)=1 and evaluate an explicitly presented integral homology sphere in two surgery presentations. The proof must use the completed-ring universal property and topological invariance.

**Source route.** AE-HABIRO main construction and invariance proof; source abstract establishes the intended target, not implementation readiness.

**Known/conjectural boundary.** Rational homology spheres, including general lens spaces, need a separately defined coefficient completion and theorem; they are not silently in this domain.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### QT.4 WRT values, Ohtsuki series and general Lie type

**Construct and export.** Prove that root-of-unity evaluation yields the normalized SU2 WRT invariant and that Taylor expansion at q=1 yields the Ohtsuki series. Derive integrality and determination results using the existing Habiro injectivity theorems. Add simple-Lie-algebra variants with their separate integral forms and root-order hypotheses.

**Inputs.** `ArithmeticQuantumTopology:QT.3`, `HabiroCyclotomicCompletions:HC.3`, `HabiroCyclotomicCompletions:HC.4`, `HabiroCyclotomicCompletions:HC.6`

**Acceptance.** One ring element must yield both finite-level quantum values and its formal Taylor coefficients. Check exceptional low-order roots and the theorem-specific admissible orders for general Lie type.

**Source route.** AE-HABIRO evaluation/Taylor theorem; AE-HABIRO-LE general Lie algebra statement and proof, not yet decomposed.

**Known/conjectural boundary.** Injectivity/determination uses the specified coefficient ring and allowed roots. Do not import the result into a localized or twisted completion without comparison.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### QT.5 Hyperbolic geometry, Bloch classes and regulators

**Construct and export.** Construct oriented ideal tetrahedra, shape parameters, gluing/completeness equations and the Bloch/extended-Bloch element associated with a source-admitted triangulated hyperbolic manifold. Prove invariance under the allowed Pachner moves with flattening and branch data. Compare the real regulator with volume and the extended regulator with the specified Chern–Simons class.

**Inputs.** `ArithmeticQuantumTopology:QT.0`, `K3BlochGroups:V.3`, `K3BlochGroups:V.5`

**Acceptance.** Work out the figure-eight complement using proven completeness and orientation, and show the five-term relation implements a triangulation move. A numerical shape solution is insufficient.

**Source route.** Acquire original Neumann/Bloch-regulator and hyperbolic-triangulation sources; existing K3BlochGroups regulator owner supplies only the algebraic map.

**Known/conjectural boundary.** A knot diagram does not automatically produce a number-field Bloch class. Geometric existence, algebraicity, flattening and regulator normalization are proof obligations.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### QT.6 State integrals, Nahm series and arithmetic asymptotics

**Construct and export.** Define a selected convergent or formal state sum/integral with its contour, parameters and normalization. Prove its transformation/invariance in the source domain; relate critical points to gluing equations and derive a controlled stationary-phase or q-asymptotic expansion. Export only explicitly proven comparisons to HabiroNahmSeries and its arithmetic modules.

**Inputs.** `ArithmeticQuantumTopology:QT.4`, `ArithmeticQuantumTopology:QT.5`, `HabiroNahmSeries:HB.5a`, `HabiroNahmSeries:HB.9`

**Acceptance.** One example includes branch choices, convergence or formal-ring meaning, an error estimate where analytic asymptotics are claimed, and the exact regulator/exponential factor.

**Source route.** HabiroNahmSeries selected sources; acquire the original state-integral/Pachner and asymptotic theorems for the chosen family.

**Known/conjectural boundary.** Volume-conjecture or quantum-modularity behavior is not established by a formal expansion alone. Formal and analytic asymptotics remain different outputs.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### QT.7 Quantum modularity and arithmetic research statements

**Construct and export.** Formulate quantum modularity, refined volume and arithmetic resurgence conjectures with exact invariant, limit, normalization and transformation domains. Maintain separate proved example theorems and conjectural families. Build a reproducible example ledger linking cyclotomic coefficients, WRT values, Bloch regulators and admissible asymptotic comparisons.

**Inputs.** `ArithmeticQuantumTopology:QT.6`

**Acceptance.** Each claimed theorem identifies a primary proof and the complete family/range. Numerical agreement, heuristic saddle calculations and conjectural identities are distinctly labelled.

**Source route.** Primary-source selection for each proved quantum-modular or asymptotic example; AE-HABIRO alone does not establish these conjectures.

**Known/conjectural boundary.** This stage provides faithful research statements and scoped proved cases, not a claim to resolve general quantum-topological conjectures.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

## Source access and preparation

The following are primary-source routes. Access descriptions state what was actually inspected during this revision; they do not claim full proof review.

- **AE-HABIRO:** [Habiro, A unified Witten–Reshetikhin–Turaev invariant for integral homology spheres (2006/2007)](https://arxiv.org/abs/math/0605314). Primary abstract checked: integral-homology-sphere invariant, root evaluations and Taylor/Ohtsuki determination. Construction proof not audited.
- **AE-HABIRO-LE:** [Habiro–Lê, Unified quantum invariants for integral homology spheres associated with simple Lie algebras (2015)](https://arxiv.org/abs/1503.03549). Primary abstract selected; Lie-type/root-order restrictions require exact theorem transcription.

For every further source requested within a stage, acquire the full accessible version, record its hash/edition, identify the exact theorem and all hypotheses, and split its proof into independently reviewable constructions and lemmas. Do not turn a title or abstract into a verified source unit. Record unresolved locators as preparation work. Check pinned library APIs through LI.0 before choosing Lean names.

## Completion contract

Complete the mathematical constructions, their functorial/API lemmas and all stated comparison maps before marking a stage implemented. Proof consumers must instantiate the actual exported maps and hypotheses. Comments and abstract structures are design artifacts. No new axiom or `sorry` is introduced by this roadmap; currently open mathematical conjectures are explicit conditional targets.
