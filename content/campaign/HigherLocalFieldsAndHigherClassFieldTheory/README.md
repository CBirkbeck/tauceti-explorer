# Higher local fields and higher class field theory

Revision: 2026-09-15. Curriculum extension; every stage requires source decomposition before proof execution.

## Scope and ownership

Own the passage from ordinary local/global class field theory to towers of local fields, Milnor-K reciprocity and higher-dimensional arithmetic schemes. Reuse the existing symbol/norm-residue and duality owners. Fix the residue tower, higher topology and characteristic profile explicitly; higher local fields are generally not locally compact.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). Construction specifications below do not assert that their interfaces or proofs already exist in Tau Ceti. Source acquisition, statement inspection, proof decomposition, elaboration and kernel-checked completion are distinct states.

## Stages

### HL.0 Higher local fields and their topologies

**Construct and export.** Define an n-local field by its complete-discrete-valuation residue tower with finite final residue field. Construct equal-characteristic iterated Laurent examples and mixed-characteristic examples using explicit coefficient/residue data. Distinguish valuation topology, higher topology and sequential/pro-ind formulations; prove only the continuity properties actually valid in the chosen framework.

**Inputs.** `FoundationsAndLibraryIntegration:LI.4`

**Acceptance.** Work out Fq((u))((t)) and Qp((t)), with two valuation/residue steps and uniformizers. Do not reuse the locally compact Haar-measure API without proving its hypotheses.

**Source route.** AE-HLFVOLUME introductory/topology chapters; AE-HLCFT pro-ind framework.

**Known/conjectural boundary.** Different higher-topology formulations require comparison proofs. Multiplication must not be claimed jointly continuous when only the source weaker notion holds.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### HL.1 Milnor K-groups, residues and norms

**Construct and export.** Extend the unit-symbol tensor quotient to all Milnor degrees, construct discrete-valuation boundary maps and iterated residues with signs. Prove projection formulas and norm-residue compatibility for finite extensions, keeping ramification and residue degree explicit. Define topological Milnor K-groups only after fixing the quotient by the appropriate closure/divisible subgroup.

**Inputs.** `HigherLocalFieldsAndHigherClassFieldTheory:HL.0`, `K2SymbolsBrauer:T.2`, `K2SymbolsBrauer:T.3`

**Acceptance.** Compute the iterated residue of a symbol with uniformizers and a constant-field unit. Changing the order of parameters must produce the expected sign rather than an unproved canonical identification.

**Source route.** AE-HLFVOLUME Milnor/topological K-theory chapters; existing K2SymbolsBrauer tame-symbol and transfer maps.

**Known/conjectural boundary.** The algebraic and topological Milnor groups are not interchangeable. Norm maps need more than the degree-two symbol presentation.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### HL.2 Higher Galois duality and wild coefficients

**Construct and export.** Construct continuous cohomology and invariant maps with the higher-field cohomological dimension and Tate twists. Prove finite-coefficient duality for primes invertible in the relevant fields and introduce logarithmic de Rham–Witt/Artin–Schreier–Witt coefficients for the wild characteristic case. Identify symbol cup-products through the existing norm-residue theorem.

**Inputs.** `HigherLocalFieldsAndHigherClassFieldTheory:HL.1`, `MotivicEtaleKTheory:M.5d`

**Acceptance.** Recover ordinary local duality at n=1 and compute an equal-characteristic two-dimensional residue pairing. The twist and degree of the invariant map are explicitly checked.

**Source route.** AE-HLFVOLUME cohomological chapters; AE-HLCFT duality/norm-group route; primary wild-coefficient proofs to select.

**Known/conjectural boundary.** Etale roots-of-unity Kummer arguments at an invertible prime do not prove the characteristic-p case. Nondegeneracy and topological perfectness are distinct claims.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### HL.3 Higher local reciprocity and existence

**Construct and export.** Construct the reciprocity homomorphism from the appropriate degree-n Milnor K-group to the abelianized Galois group via the duality pairing. Prove compatibility with finite-extension norms and the correspondence between finite abelian extensions and the specified open norm subgroups. State precisely the kernel/completion theorem delivered by the chosen source.

**Inputs.** `HigherLocalFieldsAndHigherClassFieldTheory:HL.2`

**Acceptance.** For n=1 recover the chosen arithmetic/geometric Frobenius convention. For a finite unramified extension in dimension two, verify the constant-field Frobenius image and the norm subgroup index.

**Source route.** AE-HLCFT existence theorem pp. 165–195; individual construction/duality lemmas must be extracted.

**Known/conjectural boundary.** A dense reciprocity image is not automatically an isomorphism of raw groups. Kernel and profinite/topological completion require separate exact statements.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### HL.4 Explicit symbols and ramification filtrations

**Construct and export.** Construct higher tame symbols, Witt/residue pairings and the admitted mixed-characteristic explicit reciprocity formula. Define ramification filtrations in a fixed indexing convention and prove their relation to filtrations on Milnor K-groups. Separate the different wild-symbol regimes and track differential residues.

**Inputs.** `HigherLocalFieldsAndHigherClassFieldTheory:HL.3`

**Acceptance.** Evaluate a tame K2 symbol and an Artin–Schreier–Witt example over Fq((u))((t)); compare with the abstract reciprocity map. Every residue/sign and trace convention is tested.

**Source route.** AE-HLFVOLUME explicit reciprocity/ramification chapters; choose Kato or other original formula by characteristic profile.

**Known/conjectural boundary.** One explicit formula does not apply to all mixed-characteristic higher local fields. Exceptional ramification hypotheses remain in the theorem.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### HL.5 Parshin chains and higher adeles

**Construct and export.** Construct flags of points, successive henselization/completion and restricted products of resulting local objects on a specified regular arithmetic scheme. Prove functoriality and local residue compatibility, then define the higher idelic or cycle-complex input for global reciprocity. Keep singular schemes in a separately sourced extension.

**Inputs.** `HigherLocalFieldsAndHigherClassFieldTheory:HL.1`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.5`

**Acceptance.** Recover ordinary ideles for a curve and list the flags and residue maps for a regular surface. Define the restricted-product condition rather than taking the unrestricted product.

**Source route.** AE-HLFVOLUME global chapters; acquire original Parshin/Beilinson and higher-idelic class-field-theory sources with exact regularity/properness assumptions.

**Known/conjectural boundary.** Completed local rings along a flag can have multiple branches; do not replace a product by one field without a proven normality/unibranch condition.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### HL.6 Higher global reciprocity and local–global principles

**Construct and export.** Assemble reciprocity maps for arithmetic schemes, prove reciprocity relations and compare the resulting quotient with the appropriate abelian etale fundamental group. Add tame versus wild and proper versus open variants as different theorems. Construct Kato complexes and boundary-square-zero before attempting sourced cohomological Hasse principles.

**Inputs.** `HigherLocalFieldsAndHigherClassFieldTheory:HL.3`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5`, `SchemeAndStackFoundations:SF.2`

**Acceptance.** Show how the curve case reduces to the existing global class-field-theory owner. Every asserted kernel or exactness theorem specifies dimension, base, regularity and coefficient primes.

**Source route.** Primary-source selection required for the chosen Kato–Saito or later higher-global theorem; AE-HLCFT alone is a local source and does not prove this stage.

**Known/conjectural boundary.** General local–global exactness for arbitrary arithmetic schemes is not assumed. Resolution/alteration and wild-prime restrictions are genuine prerequisites.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### HL.7 Arithmetic consumers and comparison examples

**Construct and export.** Export explicit residue/reciprocity maps to Brauer obstructions, arithmetic duality and motivic cohomology with commutative comparison diagrams. Develop complete small examples of a two-dimensional field and a regular arithmetic surface before higher-dimensional generalization. Maintain separate formal statements for currently unproved extensions.

**Inputs.** `HigherLocalFieldsAndHigherClassFieldTheory:HL.4`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6`

**Acceptance.** A consumer receives the actual norm-compatible map, kernel/completion statement and coefficient regime. The example checks two ways around each residue/corestriction square.

**Source route.** Source lemmas selected in HL.1–6 and their downstream theorem statements; no unsourced generalization from examples.

**Known/conjectural boundary.** An analogy with one-dimensional class field theory is a design guide, not evidence for a theorem.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

## Source access and preparation

The following are primary-source routes. Access descriptions state what was actually inspected during this revision; they do not claim full proof review.

- **AE-HLCFT:** [Kato, Existence theorem for higher local class field theory (2000)](https://arxiv.org/abs/math/0012150). Primary abstract checked: Milnor-K open subgroups, higher-field topology and norm-group existence. Full argument not decomposed.
- **AE-HLFVOLUME:** [Invitation to higher local fields, Geometry & Topology Monographs 3 (2000)](https://www2.math.ethz.ch/EMIS/journals/UW/gt/ftp/main/m3/m3-hlf.pdf). Primary edited-volume route located; choose individual author/chapter/theorem for each local-field construction.

For every further source requested within a stage, acquire the full accessible version, record its hash/edition, identify the exact theorem and all hypotheses, and split its proof into independently reviewable constructions and lemmas. Do not turn a title or abstract into a verified source unit. Record unresolved locators as preparation work. Check pinned library APIs through LI.0 before choosing Lean names.

## Completion contract

Complete the mathematical constructions, their functorial/API lemmas and all stated comparison maps before marking a stage implemented. Proof consumers must instantiate the actual exported maps and hypotheses. Comments and abstract structures are design artifacts. No new axiom or `sorry` is introduced by this roadmap; currently open mathematical conjectures are explicit conditional targets.
