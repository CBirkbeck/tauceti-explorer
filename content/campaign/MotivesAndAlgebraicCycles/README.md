# Algebraic cycles, pure and mixed motives

Revision: 2026-09-15. Curriculum extension; every stage requires source decomposition before proof execution.

## Scope and ownership

Own general cycle correspondences, categories of motives and realization interfaces. MotivicEtaleKTheory continues to own higher Chow groups, motivic complexes, norm-residue and the motivic-to-K spectral sequence. Cycle regulators remain with their existing arithmetic owners. Coefficients, variance, Tate twists and the chosen equivalence relation are parameters, never silently identified.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). Construction specifications below do not assert that their interfaces or proofs already exist in Tau Ceti. Source acquisition, statement inspection, proof decomposition, elaboration and kernel-checked completion are distinct states.

## Stages

### MC.0 Cycle correspondences and equivalence relations

**Construct and export.** Construct graded correspondences of smooth projective varieties from Chow groups: external products, proper pushforward, flat/refined pullback and composition via the triple product. Prove associativity, diagonal identity, transpose and projection-formula compatibility. Define rational, algebraic, homological (relative to a selected Weil cohomology) and numerical equivalence with the proved implication maps.

**Inputs.** `SchemeAndStackFoundations:SF.5`

**Acceptance.** Compute graph composition and the diagonal action on projective space. Numerical equivalence must be tested against all complementary cycles; equality in a realization is not equality in a Chow group.

**Source route.** AE-STACKS Chow homology/correspondence chapters; select exact tags for refined intersection.

**Known/conjectural boundary.** Integral Chow groups are retained before rationalization. Moving/intersection hypotheses cannot be assumed for arbitrary singular schemes.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### MC.1 Pure motives and Tate objects

**Construct and export.** Form the additive category of correspondences, its idempotent completion and Tate localization; specify covariant or contravariant convention once. Construct tensor products, duals, unit, Lefschetz object and projective-bundle decompositions, together with the universal extension of additive functors through idempotent completion.

**Inputs.** `MotivesAndAlgebraicCycles:MC.0`

**Acceptance.** Produce explicit projectors for projective spaces and a pointed smooth projective curve; check orthogonality, sum to identity and variance on maps.

**Source route.** AE-STACKS motives chapter; AE-JANNSEN category conventions.

**Known/conjectural boundary.** Existence of all cohomological Künneth projectors as algebraic cycles is not assumed. Integral and rational categories have separate APIs.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### MC.2 Realizations and cycle-class compatibility

**Construct and export.** Construct realization functors for the admitted base fields and coefficient systems; prove cycle classes respect composition, cup products, pushforward, trace and Tate twists. Compare Betti/de Rham realizations over embeddings into C and etale realizations with their own comparison suppliers. Export named maps with normalization, rather than only equal dimensions.

**Inputs.** `MotivesAndAlgebraicCycles:MC.1`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.6`

**Acceptance.** Check degree, trace and first Chern class for a divisor on a curve; a realization must factor through the precise quotient relation used.

**Source route.** AE-STACKS cycle-class formalism; import source-checked comparison theorems from existing cohomology owners.

**Known/conjectural boundary.** A Weil cohomology does not automatically descend through numerical equivalence. Any such factorization carries a proof or an explicit conjectural assumption.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### MC.3 Numerical motives and semisimplicity

**Construct and export.** Build the rational numerical category and prove finite-dimensionality of numerical correspondence spaces using a selected Weil cohomology. Decompose the endomorphism algebras and idempotents following Jannsen to establish the semisimple abelian result in its stated coefficient setting. Export the quotient from Chow motives.

**Inputs.** `MotivesAndAlgebraicCycles:MC.1`, `MotivesAndAlgebraicCycles:MC.2`

**Acceptance.** Transcribe the coefficient-field and adequacy assumptions from Jannsen. Demonstrate why the proof applies to numerical motives without asserting it for Chow motives.

**Source route.** AE-JANNSEN full article pp. 447–452; acquisition and lemma decomposition required.

**Known/conjectural boundary.** Do not replace numerical by homological equivalence without an independent theorem. Faithful realization and neutral Tannakian structure are separate obligations.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### MC.4 Geometric mixed motives and motivic cohomology

**Construct and export.** Reuse finite correspondences and transfer sheaves from M.5a; construct the chosen derived/localized category, A1 invariance, Tate stabilization and geometric subcategory. Prove localization, homotopy and projective-bundle comparisons under the selected base/resolution or alteration hypotheses. Identify higher Chow/motivic cohomology maps with the existing M.4–M.6 APIs.

**Inputs.** `MotivesAndAlgebraicCycles:MC.0`, `MotivicEtaleKTheory:M.5a`, `MotivicEtaleKTheory:M.4`

**Acceptance.** Compute motives of A1, Gm and projective space and check the boundary map for a closed point of a smooth curve, including shifts and twists.

**Source route.** Existing MotivicEtaleKTheory source register; acquire the precise Voevodsky/Cisinski–Déglise construction used, with base and coefficient restrictions.

**Known/conjectural boundary.** A triangulated category is not an abelian category of all mixed motives. A conjectural motivic t-structure cannot be installed as a theorem.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### MC.5 Nori motives and diagram categories

**Construct and export.** Construct finite-diagram endomorphism coalgebras, filtered passage to Nori diagram categories, homology of algebraic pairs, boundary morphisms and the universal factorization property. Build tensor and duality structures and the Betti/de Rham fiber functors in the source setting. Compare to geometric motives only through a sourced functor with proved compatibility.

**Inputs.** `MotivesAndAlgebraicCycles:MC.2`, `SchemeAndStackFoundations:SF.3`

**Acceptance.** Work out the pair (Gm,{1}) and its Tate period; check exactness and functoriality of a long exact sequence of a triple before using it in the universal category.

**Source route.** AE-NORI appendices on the Nori category and tensor structure; exact numbered lemmas must be extracted.

**Known/conjectural boundary.** Nori motives provide a particular constructed category over the admitted fields; equivalence with every proposed category of mixed motives is not automatic.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### MC.6 Motivic Galois groups and periods

**Construct and export.** For each proven neutral Tannakian category, construct tensor automorphism groups of the chosen fiber functor and tensor-isomorphism torsors between two fiber functors. Prove finite-diagram approximations and the pro-algebraic reconstruction. Export period torsors to PeriodsAndSpecialValues with their coefficient embeddings.

**Inputs.** `MotivesAndAlgebraicCycles:MC.5`

**Acceptance.** Calculate Artin and Tate subcategories and their tensor automorphisms. Verify that the torsor statement concerns a formal comparison object, independent of numerical period injectivity.

**Source route.** AE-NORI main formal-period torsor statement and supporting Tannakian appendices; additional Tannakian reconstruction source to select.

**Known/conjectural boundary.** A tensor category with duals is not automatically neutral Tannakian; prove abelianness, exact faithful fiber functor and symmetry conventions.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### MC.7 Cycle conjectures and proven special cases

**Construct and export.** Give typed statements for Hodge, Tate, standard conjectures, Bloch–Beilinson filtrations and motivic t-structures. Build a theorem register separating each known class of varieties and coefficients from the general conjecture. Prove selected divisor/curve/abelian-variety cases only after acquiring their primary proofs; record implication maps between conjectures separately.

**Inputs.** `MotivesAndAlgebraicCycles:MC.3`, `MotivesAndAlgebraicCycles:MC.4`, `MotivesAndAlgebraicCycles:MC.6`

**Acceptance.** Every case lists base field, characteristic, codimension, coefficient field and any finiteness or semisimplicity premise. A conjectural target never supplies an unconditional downstream theorem.

**Source route.** Primary-source acquisition task for each selected special case; AE-JANNSEN does not supply the general cycle conjectures.

**Known/conjectural boundary.** The objective is faithful statements and proved cases, not a claim that presently open conjectures are resolved.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

## Source access and preparation

The following are primary-source routes. Access descriptions state what was actually inspected during this revision; they do not claim full proof review.

- **AE-STACKS:** [The Stacks Project: Chow homology and motives chapters](https://stacks.math.columbia.edu/browse). Primary reference route; chapter/tag selection and proof reading remain required.
- **AE-JANNSEN:** [Jannsen, Motives, numerical equivalence, and semi-simplicity (1992)](https://epub.uni-regensburg.de/26642/). Author institutional repository located; full theorem and proof transcription pending.
- **AE-NORI:** [Huber–Müller-Stach, On the relation between Nori Motives and Kontsevich Periods, v5 (2014)](https://arxiv.org/abs/1105.0865v5). Primary abstract checked: formal period torsor, with appendices constructing Nori categories; proof interiors not read.

For every further source requested within a stage, acquire the full accessible version, record its hash/edition, identify the exact theorem and all hypotheses, and split its proof into independently reviewable constructions and lemmas. Do not turn a title or abstract into a verified source unit. Record unresolved locators as preparation work. Check pinned library APIs through LI.0 before choosing Lean names.

## Completion contract

Complete the mathematical constructions, their functorial/API lemmas and all stated comparison maps before marking a stage implemented. Proof consumers must instantiate the actual exported maps and hypotheses. Comments and abstract structures are design artifacts. No new axiom or `sorry` is introduced by this roadmap; currently open mathematical conjectures are explicit conditional targets.
