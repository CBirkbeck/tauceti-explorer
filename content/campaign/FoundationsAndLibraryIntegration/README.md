# Foundations, existing libraries, and proof integrity

Revision: 2026-09-15. Curriculum extension with explicit construction targets. These stages must be source-decomposed before proof execution.

## Scope and ownership

Owns integration and missing general foundations. Existing Mathlib and TauCeti declarations retain their owners; a roadmap, an import, or an assumed structure field is never evidence of a proved result.

Subject families: 11A, 11C, 11R, 11S.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). The stages below are mathematical work specifications. Source acquisition, statement checking, proof decomposition, Lean elaboration and proof completion are distinct states.

## Stages

### LI.0 Pinned libraries and declarations

**Construct and export.** Record Lean, Mathlib, TauCeti and supplier-roadmap commits separately. Search by name, type and mathematical concept. For each reused theorem record its fully qualified type, imports, source file and transitive axioms. Convert unavailable external interfaces into construction tasks.

**Inputs.** Pinned source/code audit; no mathematical theorem is assumed proved by this root task.

**Acceptance.** A clean scratch checkout reproduces every claimed reuse; no imported requirement is accepted solely because a similarly named file exists.

**Source route.** Selected sources: LOCAL, KED-CFT, STACKS. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### LI.1 Commutative algebra and linear algebra

**Construct and export.** Inventory localization, integral closure, Dedekind domains, completions, finite presentation, flatness, tensor products, dimension, regular sequences, dualizing modules, determinants and Fitting ideals. Supply missing universal properties and base-change maps in their general algebraic owners.

**Inputs.** `FoundationsAndLibraryIntegration:LI.0`

**Acceptance.** Check a nonflat tensor example and distinguish finite type from finite presentation; map each geometric consumer to an actual theorem.

**Source route.** Selected sources: LOCAL, KED-CFT, STACKS. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### LI.2 Analysis and topology

**Construct and export.** Audit Haar and product measures, Lebesgue/Bochner integration, Fourier and Mellin transforms, holomorphic/meromorphic continuation, distributions, Sobolev spaces and spectral theory. Assign convergence, compactness and continuity lemmas before arithmetic applications.

**Inputs.** `FoundationsAndLibraryIntegration:LI.0`

**Acceptance.** Fourier inversion is instantiated only under its hypotheses, with explicit measure and sign normalization; contour shifts state residues and decay assumptions.

**Source route.** Selected sources: LOCAL, KED-CFT, STACKS. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### LI.3 Categories, homological algebra and sheaves

**Construct and export.** Unify universes, limits, adjunctions, abelian and exact categories, resolutions, derived functors, spectral sequences, monoidal structures and sheafification. Separate ordinary derived categories from enhanced or infinity-categorical constructions owned by the existing advanced areas.

**Inputs.** `FoundationsAndLibraryIntegration:LI.1`

**Acceptance.** Every comparison map is natural and respects shifts and signs. A derived equivalence requires constructed inverse functors and coherence, not an equivalence-valued field.

**Source route.** Selected sources: LOCAL, KED-CFT, STACKS. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### LI.4 Imported arithmetic foundations

**Construct and export.** Integrate NumberFieldArithmetic, GlobalNumberFields, LocalFieldsRamification, ClassFieldTheory, ProfiniteCohomology, Chebotarev, ModularForms and EllipticCurves from the pinned supplier snapshots. Audit local/global reciprocity, norms, arithmetic/geometric Frobenius, ramification and class formations against the actual stage consumers.

**Inputs.** `FoundationsAndLibraryIntegration:LI.1`, `FoundationsAndLibraryIntegration:LI.2`, `FoundationsAndLibraryIntegration:LI.3`

**Acceptance.** Publish a declaration-level import ledger; preserve class-field-theory construction independent of later automorphy. Explicitly schedule every missing supplier proof.

**Source route.** Selected sources: LOCAL, KED-CFT, STACKS. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

### LI.5 Integration and axiom gates

**Construct and export.** Turn each source-decomposed stage into small proof tasks, with cleanup after each three tasks per file and before endpoints. Compile on the target pin, inspect axioms of exported theorems, and test consumer instantiations. Track source review, specification, elaboration and proof completion independently.

**Inputs.** `FoundationsAndLibraryIntegration:LI.4`

**Acceptance.** No newly assumed theorem, opaque proposition or placeholder can discharge a dependency; changing a signature invalidates its dependent checks.

**Source route.** Selected sources: LOCAL, KED-CFT, STACKS. Select the exact original statement, page and full proof before dividing this stage into proof tasks.

**Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.

## Reference access and completion

See [the extension source register](../../campaign-guide/EXTENSION_SOURCES.md). A catalogue or abstract check does not count as checking a proof. Missing source editions and theorem locators are explicit preparation tasks in the generated work queue.

Before marking this area implemented, every exported object needs its construction and reusable API; every theorem needs a kernel-checked proof and actual consumer instantiation. Record failed hypotheses and conversions explicitly. If a dependency is absent, add a named construction stage and update the graph before using it.
