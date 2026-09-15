# Reusable infrastructure for torsion in arithmetic cohomology

## Purpose and scope

Supply the interfaces linking perfectoid Shimura geometry, integral automorphic forms, Hecke actions and arithmetic boundary cohomology. The organizing source is Scholze's *On torsion in the cohomology of locally symmetric varieties*, published version, Annals 182 (2015), 945–1066. The target is a reusable library underlying its argument, not an additional requirement to formalize its final Galois-representation theorem.

This roadmap owns comparison and transport results between the named suppliers below. It does not reconstruct adic spaces, perfectoid spaces, Shimura varieties, completed cohomology, arithmetic quotients or determinants. An interface is discharged by a proved comparison on the suppliers' actual objects, not by a structure field asserting that comparison exists.

## Source-to-owner contracts

| Source | Canonical supplier | Precise reusable output |
| --- | --- | --- |
| §2.1 | AdicSpacesPartII | Gluing compatible formal models from admissible affinoid covers and model comparison |
| §§2.2–2.3 | PerfectoidSpaces; AdicSpacesPartII | Closed embeddings and extension of bounded functions with the source's hypotheses |
| §§3.1–3.2 | HodgeTateAndCanonicalSubgroups; PerfectoidShimuraVarieties | Anticanonical towers and affinoid perfectoid charts with controlled integral sheaves |
| §3.3; §4.1 | PerfectoidShimuraVarieties; AutomorphicBundles | Hodge–Tate period map, equivariance and pullback of automorphic bundles |
| §4.2 | CompletedCohomologyPartII:CC.1/CC.2/CC.4/CC.8; TC.2 | General completed cohomology and the Shimura-tower adapter, compared here with automorphic sections; the older GL₂/Q_p owner is a specialization |
| §4.3 | IntegralHeckeAndGaloisDeterminants | Comparison of Hecke image algebras and quantified nilpotent errors |
| §5.1 | ArithmeticGaloisRepresentations; AutomorphicGaloisRepresentationsPartII; IntegralHeckeAndGaloisDeterminants:IHG.0/IHG.4 | Independently constructed CM/unitary characteristic-zero systems and Frobenius/Hecke normalization; determinant recollections/interpolation 5.1.9–5.1.11. The symplectic characteristic-zero branch has the conditional external input below. |
| §5.2 | ArithmeticLocallySymmetricSpaces | Boundary strata, Levi cohomology and induced Hecke actions |
| §5.3 | TC.3 below | Algebra of extracting factors from determinant-valued Hecke data |
| §5.4 | TC.4 below | Compatibility checks and reusable specialization infrastructure |

## Coefficients and conventions

Use torsion coefficients O/varpi^m and integral lattices before any inversion of p. Record the order of inverse limits over m and direct limits over p-level. Almost mathematics over O_C uses the maximal ideal of topologically nilpotent elements; an almost isomorphism is not an isomorphism of ordinary modules. Use the campaign arithmetic-Frobenius convention with explicit conversion from each source normalization. Geometric period-map statements retain Hodge-type and good-level hypotheses.

The CM/unitary realization uses the stated ET/AG2/Shin hypotheses. The totally-real symplectic realization additionally requires Arthur's endoscopic transfer/classification input, **conditional until the exact classification theorem and all its source assumptions are verified**; ModularityAndLanglandsExtensions ML.4 owns that later source-qualified classification programme. Sp and its similitude group are not interchangeable: track the precise group, central character and passage used by the Shimura realization. The algebraic boundary and determinant-factor constructions below are unconditional constructions on their stated inputs; their symplectic arithmetic application inherits this extra hypothesis. Scholze's published Theorem 1.0.3 already distinguishes the branches. For the present source status, Atobe–Gan–Ichino–Kaletha–Mínguez–Shin, arXiv:2410.13504v3 (2026), §§0.3–0.4 distinguish existing stabilization work from the remaining twisted weighted fundamental-lemma assumption. The selected simple unitary trace comparison does not prove that assumption.

### TC.0. Integral sheaf and formal-model transport

Prove that the integral structure sheaves defined by formal models, power-bounded affinoid sections and the relevant sites compare on the specified covers. Establish ideal-of-boundary sheaves, their pullback under level maps and compatibility with completion. Prove the exact extension theorem needed for bounded functions across the chosen boundary and its stability under admissible refinement. Connect it to almost acyclicity on affinoid perfectoid charts, retaining the almost ideal and any p-power loss through Čech complexes. General Hartogs statements without codimension/normality or perfectoid hypotheses are not inferred.

### TC.1. Period-map bundles and approximating sections

For a Hodge-type Shimura tower construct the comparison between the chosen automorphic bundle lattice and pullback along the Hodge–Tate map. Prove Hecke equivariance away from p, describe the p-action on the flag side separately, and compare finite-level sections with infinite-level sections modulo varpi^m. Develop the approximation/extension lemmas that produce finite-level classical sections after twisting by sufficiently high powers of an ample automorphic line bundle. Carry the actual boundary ideal, power of the ample bundle and congruence exponent throughout. An abstract period map without these integral sections cannot supply the cohomological Hecke comparison.

### TC.2. Coherent, completed and torsion cohomology

Build the cohomological comparison diagram between finite-level torsion classes, completed cohomology, Čech cohomology on perfectoid charts and sections from TC.1. Prove naturality for Hecke correspondences and changes of coefficient exponent. Establish the cohomological-dimension/amplitude estimates and derived limit bounds used to control the kernel of the Hecke map. Invoke IHG.2 only after this action is defined on one bounded object. Export a quantified nilpotent ideal and compatible quotient maps; do not erase the error by tensoring with a field and then claiming an integral result.

TC.2 imports CompletedCohomologyPartII:CC.1, CC.2, CC.4 and CC.8 on the actual general tower. Inverse limits, their order, finite-level chain models and the Shimura Hecke adapter are supplied there, not by the GL₂/Q_p local–global compatibility theorem. Its finite-level inputs are ALS.0–4; there is no requirement that CC be constructed from this completed comparison.

### TC.3. Boundary induction and determinant factor extraction

For the symplectic/unitary parabolics whose Levi contains a restriction of scalars of GL_n, identify the boundary fibration and calculate the Hecke action through the Levi Satake map. Prove polynomial identities relating Levi factors, contragredients and character twists to the ambient Hecke polynomial. Build the abstract factor-separation lemma using actual auxiliary characters with the source's separation property, the coefficient-ring endomorphisms and determinant identities. Prove uniqueness, change-of-ring and compatibility when two choices of auxiliary data yield the same factor. Include the case of nilpotent coefficient quotients. The ability to factor a polynomial pointwise is insufficient to produce a continuous determinant over the ring.

At the arithmetic point of use, the symplectic instance of TC.3 retains the explicitly conditional Arthur input above; only the matching CM/unitary instance consumes AG2's constructed characteristic-zero package. Neither a polynomial factor identity nor an abstract determinant removes that distinction.

### TC.4. Reusable output and validation examples

Assemble a compatibility theorem saying that all four routes from a finite-level class to Hecke characteristic polynomials commute after the quantified quotient. Prove uniformity in m and tame level where the source provides it, and passage to inverse systems. Supply GL_1 class-field and GL_2 modular-curve normalization examples; test a genuinely torsion class at the level of the universal-coefficient sequence so the construction never assumes that every mod-p class lifts to characteristic zero. No new terminal claim about all Galois representations of all groups is part of this layer.

## Completion criteria

Every row above has an exported theorem on actual supplier objects. All almost, nilpotent, integral and characteristic-zero comparisons are separate named maps, and every composite has its compatibility proof. The finite-level correspondence and boundary spectral sequence use the same Hecke algebra. Suggested.lean illustrates the expressible algebraic part and explicitly marks the missing geometric types.

Primary source: [Scholze, published paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf). Local file: scholze-torsion.pdf. The source's theorem numbering is used only after checking the published PDF; section references above were checked against its contents.

## Implementation handoff: Integral comparison and source-conditional branches

**Stages:** TC.0, TC.1, TC.2, TC.3, TC.4. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Construct the formal-model, power-bounded, period-bundle and completed-cohomology maps before the Hecke determinant handoff. Each map carries its almost or nilpotent error category, ideal, exponent and coefficient change; these two kinds of error are not identified. Boundary factor extraction carries the Levi Satake normalization and chosen auxiliary characters.

**Acceptance and consumer contract.** Compare the four routes on a finite-level torsion class and prove compatibility as the coefficient exponent and level vary. GL₁ and GL₂ checks validate inverse-Frobenius and determinant conventions. The symplectic arithmetic branch remains conditional until ModularityAndLanglandsExtensions ML.4 supplies the precise classification/transfer result with its actual assumptions. ML.4 is a later application dependency, not a prerequisite for the input-parametrized constructions TC.0–TC.3. The CM/unitary branch uses only the matching ET/AG2 theorems.
