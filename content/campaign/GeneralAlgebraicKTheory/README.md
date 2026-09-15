# General algebraic K-theory

Higher K-theory Part II building on GrothendieckEulerForms.

## Canonical ownership and interfaces

- The exact-category carrier and categorical K₀ are supplied by GrothendieckEulerForms; compare π₀ of the new spectrum to those carriers. Do not introduce another presentation of exact structures.
- The public connective functor uses K_n(C)=π_(n+1)|NQ(C)| and the S-construction spectrum, with comparison natural in conflation-exact functors. Enhanced Morita equivalence is the input for derived invariance.

**Campaign dependencies:** [StableHomotopyKTheory](../StableHomotopyKTheory/README.md), [EnhancedDerivedSheaves](../EnhancedDerivedSheaves/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

**Prefix:** K. **Dependencies:** H and the existing exact-category/Grothendieck-group development. **References:** K-book IV–V; Handbook I.1; Quillen, *Higher algebraic K-theory I*; Waldhausen; Thomason–Trobaugh; Schlichting.

## K.1 — The Q-construction and its smallness

Use `TauCeti.ExactStructure C`. Construct `Q(C)` with the same objects and morphisms represented by admissible spans `X ← Z → Y`, with admissible epimorphism on the left and admissible monomorphism on the right, modulo the appropriate isomorphism relation. Composition is constructed by pullback. Prove representative independence, associativity and identity before taking a nerve.

For essentially small categories use the established small-model conventions. Transport the exact structure to the small model and prove independence from it, natural in exact functors. Construct the zero-object basepoint. Define `K_n(C)=π_(n+1)(|NQ(C)|,0)` for every natural number, with the indexing of the shared conventions, and give its abelian-group structure, including degree zero.

Prove that `π₁ NQ(C)` is the existing `ExactK0`, preserving the class of each object and the relation from each conflation. The inverse map must use the universal property; equality of the two groups' cardinalities is not a comparison.

## K.2 — Rings and the plus comparison

<a id="stage-K.2:plus"></a>

**Early ring/plus model (K.2:plus).** Construct the essentially small exact category `Proj_fg(A)` from the existing module category and projectivity/finiteness predicates. Show that scalar extension along every unital ring homomorphism preserves these objects and their split exact sequences, without imposing unnecessary flatness. Construct `K(A)` functorially.

Compare the loop space of `Q(Proj_fg(A))` with direct-sum group completion of the maximal subgroupoid, identify its components with K₀(A), and identify its zero component naturally with `BGL(A)⁺`. After choosing component representatives obtain the space-level product description `K₀(A) × BGL(A)⁺`, without claiming a natural product splitting of infinite-loop spaces. Prove the cofinality statement that every finitely generated projective has a projective complement making it free. This is why the stable free-module group detects the higher groups even when projectives are not free.

The group-completion and zero-component comparisons must commute with ring maps and the appropriate block-sum operation; noncanonical translations between components are not part of this naturality claim. <a id="stage-K.2:low-degree-comparisons"></a>

**Late low-degree comparison (K.2:low-degree-comparisons).** Combine them with U, T and V to identify the explicit K₁, K₂ and K₃ models. These identifications are unconditional for the stated ring class; Matsumoto's presentation remains a field-specific theorem.

## K.3 — Fundamental theorems for exact categories

Prove additivity for the exact category of conflations: the source-and-quotient functor induces the expected product equivalence on K-theory. Deduce additivity of exact functors in a short exact sequence of functors.

Prove dévissage for an appropriate full abelian subcategory closed under subobjects and quotients, with a finite filtration of every object by objects of the subcategory. Prove the resolution theorem for a full exact resolving subcategory, with closure and finite-resolution hypotheses stated. Construct the alternating-resolution inverse in degree zero and compare it to the existing K₀ resolution theorem.

Prove Quillen localisation for a Serre subcategory of a small abelian category and its quotient. Do not assert localisation for arbitrary exact subcategories without the additional hypotheses needed by the chosen exact-category localisation theorem. Supply cofinality with the correct degree-zero correction: idempotent completion may change K₀ even when positive K-groups agree.

## K.4 — Waldhausen's S-construction

<a id="stage-K.4:construction"></a>

**Early S-construction (K.4:construction).** Define a Waldhausen category with zero object, cofibrations, weak equivalences, the required pushouts and gluing axiom. Define exact functors preserving this data. Construct the categories `S_n C` of filtered objects with specified quotient squares and the simplicial identities. Define their weak-equivalence subcategories and iterate S to form the spectrum.

Prove additivity and the delooping theorem. Prove the fibration theorem with cylinder, saturation and extension assumptions as required by the adopted version. Prove approximation and the comparison with the Q-construction for exact categories. Spell out the induced cofibrations on diagram categories; objectwise cofibrations alone do not automatically give every required pushout condition.

For bounded complexes of projectives, use quasi-isomorphisms and the appropriate degreewise split cofibrations. Prove the Gillet–Waldhausen comparison with `Proj_fg(A)`. Do not confuse quasi-isomorphism and arbitrary chain homotopy equivalence in categories where they differ.

## K.5 — Relative and nonunital theories

For a ring map or exact functor define relative K-theory as the homotopy fibre, with the actual map to the source theory and connecting homomorphisms. Treat a pair `(A,I)` by the map `A → A/I`; distinguish this from support K-theory for a localisation `A → S⁻¹A`.

For a nonunital ring use a specified unitisation and the corresponding relative theory. Prove the comparison with the usual unital theory. Ordinary algebraic K-theory does not satisfy unrestricted excision for every ideal: prove excision under the hypotheses of the adopted theorem and provide a counterexample or explanatory test preventing an unconditional instance.

## K.6 — Nonconnective extension

Construct a nonconnective K-theory spectrum for the enhanced exact/complex categories required by S. One concrete route uses flasque enlargement and suspension, with an Eilenberg swindle and idempotent completion at the appropriate stage. Prove independence of the enlargement and agreement with connective K-theory in nonnegative degrees on the idempotent-complete inputs used here.

Identify negative groups of rings with Bass's construction. Prove localisation in the nonconnective formulation and the fundamental theorem with Nil terms. Prove vanishing of negative groups for regular noetherian rings in the intended finite-dimensional applications. Do not infer vanishing for singular rings from the connective model's absence of negative homotopy.

## K.7 — Invariance, products and universal interfaces

Prove Morita invariance, finite-product compatibility, filtered-colimit compatibility for rings, and equivalence invariance at the enhanced categorical level. Derived Morita invariance uses enhanced perfect categories, not a naked triangulated equivalence.

Construct external products from biexact functors and their associativity, unit and symmetry homotopies. For commutative rings obtain graded-commutative K-groups. Prove compatibility with relative groups, localisation boundaries and transfers. Export the comparison with tensor products on K₀ and multiplication of units on K₁.

## Tests and completion

The zero exact category has contractible K-theory. Exact equivalences induce K-equivalences. `K(M_r(A)) ≃ K(A)` is induced by the explicit Morita equivalence. Split-exact and nonsplit-exact structures are not silently identified. Finite direct products of rings produce product spectra. The first four homotopy groups compare with Z, U, T and V on the same functorial ring carrier.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-qconstruction"></a>

**KU-qconstruction — Q-construction and existing ExactK0 comparison.** Readiness checkpoint for original `qconstruction`: verify completion and map-level compatibility of [GeneralAlgebraicKTheory:K.1](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `homotopy`, `existing`. 

<a id="stage-KU-pluscomparison"></a>

**KU-pluscomparison — Ring K-theory and plus comparison.** Readiness checkpoint for original `pluscomparison`: verify completion and map-level compatibility of [GeneralAlgebraicKTheory:K.2:plus](README.md), [KTheoryLowDegrees:U.6](../KTheoryLowDegrees/README.md), [K2SymbolsBrauer:T.1:plus](../K2SymbolsBrauer/README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `qconstruction`, `plus`, `k0classical`, `k1classical`, `k2classical`. 

<a id="stage-KU-waldhausen"></a>

**KU-waldhausen — S-construction, additivity and delooping.** Readiness checkpoint for original `waldhausen`: verify completion and map-level compatibility of [GeneralAlgebraicKTheory:K.4](README.md), [StableHomotopyKTheory:H.5:S-delooping](../StableHomotopyKTheory/README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `spectra`, `qconstruction`. 

<a id="stage-KU-fundamental"></a>

**KU-fundamental — Resolution, devissage, relative theory and localisation.** Readiness checkpoint for original `fundamental`: verify completion and map-level compatibility of [GeneralAlgebraicKTheory:K.3](README.md), [GeneralAlgebraicKTheory:K.4](README.md), [GeneralAlgebraicKTheory:K.5](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `waldhausen`, `homotopy`. 

<a id="stage-KU-nonconnective"></a>

**KU-nonconnective — Nonconnective K-theory and Morita/product interfaces.** Readiness checkpoint for original `nonconnective`: verify completion and map-level compatibility of [GeneralAlgebraicKTheory:K.6](README.md), [GeneralAlgebraicKTheory:K.7](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `fundamental`, `pluscomparison`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `K.1` | Build the equivalence relation on admissible spans and the pullback-composition congruence first; then compare the zero-component loops with the existing ExactK0 class map. |
| `K.4:construction` | Specify the weak-equivalence and cofibration structures on every S_n category and prove their compatibility with face maps. Separate the construction from the additivity and delooping proofs. |
| `K.6` | Carry the connective-to-nonconnective transformation through suspension and idempotent completion; export an actual comparison on nonnegative groups on the stated idempotent-complete inputs. |

**Producer–consumer handoff.** SchemeKTheoryOperations S.3 requires a nonconnective fibre sequence, while low-degree field calculations use the connective comparison. Neither consumer may substitute the other model without that natural transformation.

**Acceptance.** Compare scalar extension and restriction of scalars on K0, K1 and the localization boundary. Check a singular ring retains its Nil/negative contributions.

**Source-readiness boundary.** Fix the adopted Waldhausen/Schlichting versions and theorem hypotheses before producing proof leaves.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
