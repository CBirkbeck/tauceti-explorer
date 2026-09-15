# Homotopy foundations for algebraic K-theory

Part II to AlgebraicTopology: group completion, plus construction and concrete spectra.

## Canonical ownership and interfaces

- Import EnhancedDerivedSheaves E0/E5 for abstract higher categories, monoidal coherence, stable categories and Ind-completions. H.5 constructs spectra and compares their models; the abstract category layer does not depend on this comparison.
- Add Eilenberg–Mac Lane spectra from chain complexes, the homotopy/cohomology comparison and functorial truncation. Bockstein and Milnor sequences retain their connecting maps and naturality. The connective cover must not silently erase negative K-groups.

**Campaign dependencies:** [EnhancedDerivedSheaves](../EnhancedDerivedSheaves/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

**Prefix:** H. **Dependencies:** ordinary algebraic topology, category theory, group homology and simplicial sets. **Consumers:** K, V, L, M, R, RefinedTraceMethods and the later EnhancedDerivedSheaves E5 spectra-comparison branch. **References:** K-book IV; Handbook I.1–I.2; Quillen; Waldhausen.

## Scope

Supply the actual homotopy constructions needed by the Q-, plus- and S-constructions. Consume the existing ordinary homotopy theory; own the additional group-completion and spectrum theory. This is not a demand for all of stable homotopy theory before K₀ can be calculated.

### H.1 — Nerves, classifying spaces and basepoints

Construct the nerve of a small category, its geometric realisation, the map induced by a functor, and the homotopy induced by a natural transformation. Prove compatibility with composition, equivalence of categories, products and filtered diagrams in the precise settings used below. Supply the contractibility lemmas for categories with initial or terminal objects.

For a discrete group `G`, identify the nerve of its one-object groupoid with the bar construction. Prove that its realisation is a `K(G,1)`, with the map on fundamental groups induced by a group homomorphism. Construct local coefficient systems and the comparison of bar homology with singular homology of `BG`. Group homology cannot be replaced by trivial-coefficient cohomology when defining acyclic maps.

**Tests:** the trivial group has contractible classifying space; conjugate homomorphisms induce freely homotopic maps; the induced map on H₁ is abelianisation.

### H.2 — Homotopy fibres and Quillen's theorems

Construct homotopy fibres, homotopy pullbacks and their naturality, including basepoint choices and changes of basepoint. Prove the long exact sequence with the correct group/pointed-set distinction in degrees 1 and 0. Compare the Kan-simplicial and existing topological homotopy groups.

Prove Quillen's Theorem A from contractible comma categories. Prove Theorem B with its homotopy-fibre hypothesis on transition functors, rather than applying Theorem A as though it gave a fibration. Develop the bisimplicial diagonal/iterated-realisation comparison and the levelwise-equivalence theorem under the appropriate cofibrancy or simplicial hypotheses.

**Consumers:** K.3 uses these results to prove additivity and localisation. Their hypotheses must be checked for the specific exact categories used there.

### H.3 — The plus construction

For a connected CW-type space `X` and a perfect normal subgroup `P` of `π₁X`, construct `X → X⁺_P` by attaching 2-cells to kill `P` and 3-cells to restore the required homology. Prove `π₁(X⁺_P) = π₁(X)/P` and the homology isomorphism with coefficients pulled back from that quotient. Prove the acyclic universal property, uniqueness in the homotopy category, and functoriality for maps carrying the selected perfect subgroup into the selected perfect subgroup.

State exactly which assertions are strict maps, selected representatives, or homotopy-coherent assertions. Do not use uniqueness of a space up to homotopy as literal equality of chosen spaces. Include the relative construction needed to compare fibres after applying plus.

**Test:** applying plus with the trivial subgroup gives a weak equivalence. Applying plus to a perfect group's classifying space produces a simply connected space with the same integral homology. Hurewicz then computes its first nonzero homotopy group.

### H.4 — Homotopy group completion

Construct the group completion of a symmetric monoidal groupoid, using a Segal Γ-space or a comparably explicit simplicial construction. Its π₀ is the ordinary Grothendieck group of the monoid of components. Prove the group-completion theorem with its localisation hypothesis on homology. Include the cofinal stabilisation argument that will identify projective-module group completion with the stable general linear group plus construction.

Direct sum need not be strictly associative in the source category. Either work with its coherence maps or prove a strictification theorem and independence from strictification. Do not identify the nerve of the category of all projective-module maps with the nerve of its maximal subgroupoid: only the latter carries the intended group-completion input.

### H.5 — Spectra and deloopings

<a id="stage-H.5:spectra"></a>

**Early spectrum foundation (H.5:spectra).** Import EDS E5:abstract only, not its later spectra-comparison return. Choose a concrete spectrum model compatible with simplicial sets. Construct suspension spectra, loop and shift, stable homotopy groups indexed by integers, stable equivalences, homotopy fibres/cofibres, and long exact sequences. Construct the stable homotopy category and enough functorial fibrant/cofibrant replacement to justify the operations used. Establish the fibre/cofibre shift relation and finite products/biproducts.

<a id="stage-H.5:S-delooping"></a>

**Later S-construction comparison (H.5:S-delooping).** Prove that the iterated S-construction produces a connective spectrum after the required delooping theorem; it is not enough to write down a sequence of spaces. Supply smash products and the pairing on homotopy groups needed for graded K-theory products. An E∞ refinement is required where it is actually used, but no universal-property characterisation of all localising invariants is assumed as a substitute for these constructions.

### H.6 — Coefficients, completion and spectral sequences

Define `E/m` as the cofiber of multiplication by `m` on a spectrum. Prove the Bockstein exact sequence and

\[
0\longrightarrow\pi_n(E)/m\longrightarrow\pi_n(E/m)
\longrightarrow\pi_{n-1}(E)[m]\longrightarrow0.
\]

This is not in general a canonically split sequence. Define p-completion by the derived inverse system of `E/p^r`. Construct the Milnor `lim¹` exact sequence and prove the hypotheses under which it reduces to an ordinary inverse limit. Identify completion of homotopy groups with tensoring by `Z_p` only under proved finiteness hypotheses.

Construct exact couples from filtered spectra and convergence statements with completeness, boundedness or connectivity assumptions. Include rationalisation, arithmetic fracture comparisons in the required bounded-below cases, and the passage from towers to spectral sequences. These are used in M and L, not presumed by displaying an E₂ page.

## Completion

The classifying-space, plus, group-completion and spectrum constructions are functorial, and their homotopy groups are compared with the existing homotopy API. K-theory can then be defined using actual objects, with coefficients and relative groups supplied by these general constructions.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-existing"></a>

**KU-existing — Existing algebra, category theory, topology and arithmetic.** Readiness checkpoint for original `existing`: verify completion and map-level compatibility of `UPSTREAM:Mathlib-and-pinned-TauCeti-foundations`. This is an aggregation of those owners, not a new proof construction. Original prerequisites: none. Resolve each imported declaration at the implementation pin; a roadmap is not compiled code.

<a id="stage-KU-homotopy"></a>

**KU-homotopy — Nerves, fibres, classifying spaces and Quillen A/B.** Readiness checkpoint for original `homotopy`: verify completion and map-level compatibility of [StableHomotopyKTheory:H.1](README.md), [StableHomotopyKTheory:H.2](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `existing`. 

<a id="stage-KU-plus"></a>

**KU-plus — Plus construction and homotopy group completion.** Readiness checkpoint for original `plus`: verify completion and map-level compatibility of [StableHomotopyKTheory:H.3](README.md), [StableHomotopyKTheory:H.4](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `homotopy`. 

<a id="stage-KU-spectra"></a>

**KU-spectra — Spectrum and coefficient foundations.** Readiness checkpoint for original `spectra`: verify completion and map-level compatibility of [StableHomotopyKTheory:H.5:spectra](README.md), [StableHomotopyKTheory:H.6](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `homotopy`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `H.2` | Construct the basepoint-change transport on the homotopy-fibre sequence before using its boundary in K-theory; record whether the degree-zero term is a pointed set or a group. |
| `H.4` | Prove the cofinal stabilization map from finite projectives to the group-completion space. Include naturality of block sum on representatives and the homology localization hypothesis. |
| `H.6` | For the tower E/p^r construct transition maps on cofibres and the Milnor boundary. Supply the finite-generation lemma that kills the actual lim¹ term before replacing completion by tensoring with Z_p. |

**Producer–consumer handoff.** GeneralAlgebraicKTheory K.2:plus consumes the component-preserving group-completion comparison; MotivicEtaleKTheory M.7 and local K-theory consume the Bockstein and tower maps.

**Acceptance.** Exhibit a Bockstein sequence with a nonzero torsion right term, and a tower with a nonzero derived-limit obstruction. A degreewise isomorphism without connecting maps does not pass.

**Source-readiness boundary.** Select the precise model-level source statements for realizations and completion; full homotopy proof interiors remain to be decomposed.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
