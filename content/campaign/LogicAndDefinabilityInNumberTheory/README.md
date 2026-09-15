# Logic, definability, valued fields and motivic integration

Revision: 2026-09-15. Curriculum extension with explicit construction targets. These stages must be source-decomposed before proof execution.

## Scope and ownership

Formalize logical languages and interpreted structures explicitly. A uniform definability theorem cannot be strengthened across excluded residue characteristics; undecidability does not rule out certified algorithms for special families.

Subject families: 11U.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). The stages below are mathematical work specifications. Source acquisition, statement checking, proof decomposition, Lean elaboration and proof completion are distinct states.

## Stages

### LD.0 Languages and interpretations

**Construct and export.** Define first-order ring/valued-field languages, structures, formulas, definable sets and interpretation in arithmetic fields; integrate model-theory foundations from Mathlib where available. Construct ultraproducts and prove the needed Los transfer theorem; nonstandard arithmetic uses an explicit elementary extension and standard-part interface where available.

**Inputs.** `FoundationsAndLibraryIntegration:LI.0`

**Acceptance.** Parameters and quantifier domains are explicit; an interpreted arithmetic statement has a proved semantics bridge.

**Source route.** Selected sources: DENEF-PAS, CLUCKERS-LOESER, MATIYASEVICH. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### LD.1 Valued-field logic

**Construct and export.** Develop henselianity, residue/value sorts, angular components and source-scoped elimination/relative elimination results, including Ax-Kochen-Ershov/Denef-Pas routes.

**Inputs.** `LogicAndDefinabilityInNumberTheory:LD.0`, `FoundationsAndLibraryIntegration:LI.4`

**Acceptance.** State equicharacteristic/mixed-characteristic assumptions and exceptional primes; no transfer from large residue characteristic is asserted for every p.

**Source route.** Selected sources: DENEF-PAS, CLUCKERS-LOESER, MATIYASEVICH. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### LD.2 p-adic definable integration

**Construct and export.** Construct definable cells and measures, rationality of local Poincare/Igusa series in selected settings, and constructible function operations.

**Inputs.** `LogicAndDefinabilityInNumberTheory:LD.1`, `FoundationsAndLibraryIntegration:LI.2`

**Acceptance.** Singular loci, convergence domains and poles are controlled; rationality includes a specified coefficient ring and variable.

**Source route.** Selected sources: DENEF-PAS, CLUCKERS-LOESER, MATIYASEVICH. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### LD.3 Motivic integration and transfer

**Construct and export.** Develop Grothendieck/constructible-function targets, specialization, pushforward and transfer principles following a fixed complete source. Coordinate geometric realizations with motives rather than identifying different Grothendieck rings.

**Inputs.** `LogicAndDefinabilityInNumberTheory:LD.2`, `SchemeAndStackFoundations:SF.1`, `MotivesAndAlgebraicCycles:MC.4`

**Acceptance.** Specialization commutes with integrals only under the source hypotheses; denominator inversions and residue bounds are explicit.

**Source route.** Selected sources: DENEF-PAS, CLUCKERS-LOESER, MATIYASEVICH. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### LD.4 Diophantine definability and undecidability

**Construct and export.** Formalize recursively enumerable sets, Diophantine representations and the negative solution of Hilbert tenth over integers via a complete MRDP source chain. Record other-field variants individually.

**Inputs.** `LogicAndDefinabilityInNumberTheory:LD.0`, `ClassicalArithmeticCompletion:CA.4`

**Acceptance.** Integer undecidability is not copied to rational or arbitrary number fields; each transfer needs its own interpretation theorem.

**Source route.** Selected sources: DENEF-PAS, CLUCKERS-LOESER, MATIYASEVICH. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### LD.5 Uniform arithmetic applications

**Construct and export.** Provide local-density/counting transfer and definability interfaces to arithmetic statistics, nonarchimedean geometry and algorithms. Keep undecided field cases in the frontier register.

**Inputs.** `LogicAndDefinabilityInNumberTheory:LD.3`, `LogicAndDefinabilityInNumberTheory:LD.4`

**Acceptance.** Every application identifies its formula, language, parameter set and finite exceptional set or proves its absence.

**Source route.** Selected sources: DENEF-PAS, CLUCKERS-LOESER, MATIYASEVICH. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### LD.6 o-minimality, definable counting and unlikely intersections

**Construct and export.** Construct the selected o-minimal structures, definable sets and cell decomposition, then prove a source-complete Pila-Wilkie rational-point estimate outside the algebraic part with explicit height and epsilon quantifiers. Build Pila-Zannier-type applications from separate Galois-orbit bounds, definability of uniformization and functional-transcendence theorems. Include source-scoped Andre-Oort and related proven cases, recording their exact varieties and hypotheses.

**Inputs.** `LogicAndDefinabilityInNumberTheory:LD.0`, `DiophantineApproximationAndTranscendence:DT.0`, `SchemeAndStackFoundations:SF.0`

**Acceptance.** Removing the algebraic part is essential; a positive-dimensional semialgebraic component is not a contradiction to the bound. An application must provide independent orbit and functional-transcendence suppliers and cannot treat counting alone as an unlikely-intersection theorem.

**Source route.** New primary-proof acquisition: o-minimal cell decomposition and definability; Pila-Wilkie rational-point counting; source-scoped Pila-Zannier/Andre-Oort application papers; independent Galois-orbit and Ax-Lindemann/Ax-Schanuel inputs. Record the exact full proof for each.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

## Reference access and completion

See [the extension source register](../../campaign-guide/EXTENSION_SOURCES.md). A catalogue or abstract check does not count as checking a proof. Missing source editions and theorem locators are explicit preparation tasks in the generated work queue.

Before marking this area implemented, every exported object needs its construction and reusable API; every theorem needs a kernel-checked proof and actual consumer instantiation. Record failed hypotheses and conversions explicitly. If a dependency is absent, add a named construction stage and update the graph before using it.
