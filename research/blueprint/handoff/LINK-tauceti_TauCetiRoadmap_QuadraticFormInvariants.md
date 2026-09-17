# LINK-tauceti_TauCetiRoadmap_QuadraticFormInvariants

Worker: ChatGPT Pro — cgp-866dc6aebdcc. Issue #28.
State: working checkpoint, not a completed submission.
Claim comment 5713527370; session-specific acceptance 5713529337.
Branch: `swarm/cgp-866dc6aebdcc/quadratic-form-links`.
Input revision: `dbafc759460581dbd23999a3c112149fedefe2b5`.

## Input access and provenance

The browser instructions and atlas-extract README have been read, together with both protocols and the upstream guide. The complete inputs are now available in scratch from the authorised GitHub Pages artifact for the exact input revision: run 35210869629, artifact 10491219312, SHA-256 `42073dce6a2708590def6f040b6b88fa988a03f7ca5bf1da18b9314b8cbadfb7` (verified). No input-access blocker remains.

The full QuadraticFormInvariants README and all eighteen atlas stage descriptions have been read. The source file equals the atlas README byte-for-byte, and every normalised stage description is contained in it. The accepted AUDIT-05 entry was read in full, including its declaration inventories and limitations. Its claims are audit evidence, not an independent declaration-availability certificate in this link job. The current link validator and retirement policy have been read.

## Source input/output outline

- Layers 0–3: square classes, regular-form classes, chain equivalence, Witt decomposition/cancellation, quaternion norm and split criteria, and discriminants. The reviewed audit reports much of the elementary layer already built; do not rebuild it merely because the README's inventory is older.
- Layer 4: Witt/Grothendieck-Witt rings, fundamental ideal, elementary Pfister theory and signed discriminant on I/I². General Pfister roundness and higher Milnor/Merkurjev theorems are excluded.
- Layer 5: general quaternion central simplicity, quaternion Brauer symbols, Hasse/Clifford invariants and the map I²/I³ to Brauer 2-torsion. Neither injectivity nor surjectivity of that map is supplied.
- 6A: intrinsic local-field exports plus uniformizer/square-class and norm-equation adapters. Separate v_K(2) from relative ramification and from absolute ramification over a specified p-adic base.
- 6B–6D: quadratic defect, norm index, Hilbert signs, local Hasse invariant, mixed-characteristic local classification/realization. The dyadic case is essential. Shared notation does not turn an arbitrary-field sign indicator into a bilinear pairing.
- 6E: compare the two-element quaternion subgroup with Hilbert signs; the additional local-invariant comparison comes after 7B and the class-field-theory invariant.
- 7A: coefficient-specific mu_2/trivial-F2, Kummer and field-subgroup adapters. Cup, corestriction, index-two Evens norm and Kummer exactness come from ProfiniteCohomology, not a second local construction.
- 7B: crossed products, finite separable/Galois splitting, explicit cocycles and finite-quotient descent, then algebraic Brauer versus continuous H². The normalisation equation on crossed products is essential.
- 7C: arbitrary-field cup/norm/quaternion criterion. The local sign identification has additional local hypotheses and does not run backwards into class field theory.
- Layers 8–9: descended low-degree Stiefel–Whitney classes and Scharlau/trace transfer. The relative formula here is quadratic/separable and rank one, with an index-two Evens norm; it is not an all-degree or arbitrary-extension theorem.

## Source issues already located

In 6B the asserted implication that a unit value x²-a*y² forces min(v(x),v(y))=0 is false for unit a: over Q_2 take a=5 and x=y=1/2, giving -1. The nonintegral coordinates must be handled before claiming exhaustive unit-norm representatives. This is a defect in the stated reduction, not a counterexample to the local norm-index theorem. No source README was changed.

Existing peer submissions flag the separate 7B semilinear Skolem–Noether issue: one must remove the coefficient-field automorphism before applying the linear inner-automorphism theorem. This will be checked against the source and preserved without duplicating their links.

## Work still in progress

Complete the catalogue-wide exact/synonym screen, including all upstream and same-area roadmaps and the six new roadmap definitions. Read full source and target descriptions for every proposed pair. Deduplicate against the atlas and all 25 existing link packets, especially LocalFieldsRamification, ClassFieldTheory, GlobalQuadraticForms, SpinRepresentations and SemisimpleAlgebras. Record precise hypotheses, evidence and any unresolved direction as an overlap. Run the unmodified canonical validator against the full world, recheck live ownership and inputs, and submit only the two authorised files.

No validator pass, mathematical acceptance, implementation, integration or final submission is claimed by this checkpoint. No git command or default-branch write was performed.
