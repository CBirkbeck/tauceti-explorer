# Roadmap: Commutative algebra for deformation theory and patching

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Build the reusable commutative algebra needed for representability, dimension estimates and patching. The theory is about complete local commutative rings and modules, not about modular forms; arithmetic examples are acceptance tests rather than the definitions.

## Existing material and ownership

Consume Mathlib's local rings, adic completion, Noetherian rings, Krull dimension, tensor products and homological algebra after checking the exact pin. The open Gorenstein homological-algebra roadmap #323 concerns Gorenstein projective/injective modules and explicitly does not own this local commutative-ring theory. Reuse its general homological results only where the hypotheses match.

## Conventions

Fix a complete DVR O with uniformiser π and residue field k. Distinguish Artinian local O-algebras with specified residue-field identification from complete Noetherian local ones. Morphisms are local continuous O-algebra maps. Framing variables change dimensions; record both relative and absolute dimension.


<a id="r03-1"></a>

## R03.1. Complete local coefficient categories

**Milestone:** `R03.1`

Construct the coefficient categories and prove presentation as inverse limits of Artinian quotients. Develop continuous maps from power-series rings, completed tensor products over O, residue-field extension, and descent/ascent of finite generation. State exactly when completed tensor products remain Noetherian and local. Nilpotent ideals, small extensions, and square-zero extensions receive explicit APIs used by the deformation functors.

**Dependencies:** the existing mathematical suppliers identified in the ownership section.

<a id="r03-2"></a>

## R03.2. Representability and obstruction algebra

**Milestone:** `R03.2`

Prove the form of Schlessinger's criterion used by unframed deformation functors and the corresponding framed representability construction. Include tangent-space finiteness, fibre products of Artinian rings, hulls versus prorepresenting objects, and uniqueness. Relate presentation relations to obstruction spaces. Do not identify a hull with a representing ring when automorphisms prevent representability.

**Dependencies:** R03.1 (preceding layer).

<a id="r03-3"></a>

## R03.3. Dimension, depth and complete intersections

**Milestone:** `R03.3`

Develop regular sequences, depth, Cohen–Macaulay rings/modules, projective dimension, Auslander–Buchsbaum and the exact complete-intersection criteria used in patching. Prove depth and dimension formulas under the local maps actually used. Give equidimensionality, associated-prime and support lemmas for finite modules. State hypotheses on catenarity and excellence rather than importing geometric conclusions for arbitrary local rings.

**Dependencies:** R03.2 (preceding layer).

<a id="r03-4"></a>

## R03.4. Finiteness and characteristic-zero points

**Milestone:** `R03.4`

Prove the commutative-algebra lemma extracting a characteristic-zero point from a finite O-algebra together with an appropriate dimension or non-torsion statement. A nonzero finite O-algebra can be k, so nonzeroness is insufficient. Prove the finite-over-a-subring criteria used in KW II §10 and their completed versions. Separate a finite unframed global deformation ring from its framed power-series enlargement.

**Dependencies:** R03.3 (preceding layer).

<a id="r03-5"></a>

## R03.5. Patching modules

**Milestone:** `R03.5`

Construct inverse-limit patching from finite-level rings, modules, presentations and compatible transition data, including the compactness or diagonal-subsequence argument. Prove existence and finite generation of the patched module, its power-series action, specialisation, and the depth comparison. Separate integral assertions from those after inverting π. The abstract theorem must expose all numerical hypotheses and the faithfulness/support conclusion actually obtained.

**Dependencies:** R03.4 (preceding layer).

<a id="r03-6"></a>

## R03.6. Support, components and descent

**Milestone:** `R03.6`

Prove support transport along flat maps, coefficient changes, quotient maps and removal of framing variables. Derive when a patched module is faithful, nearly faithful, or supported on a specified union of components. Do not infer support on every component merely from Cohen–Macaulayness. Provide an explicit algebraic theorem for the torsion-free/reduced quotient at which an R=T argument concludes, and a separate stronger theorem when its additional hypotheses are verified.

**Dependencies:** R03.5 (preceding layer).

## Required examples and checks

Use O[[X₁,…,X_d]], a hypersurface, an O-torsion finite algebra, and a reducible local ring with a Cohen–Macaulay module supported on one component. These examples must detect the false characteristic-zero-point and full-support shortcuts.



## References

KW2, DIAMOND97, KISIN09F. The bibliography records what was inspected and what remains to be transcribed.

<a id="p7"></a>

## P7. Perfect complexes and derived coefficient change

For complete Noetherian local O-algebras and bounded complexes of finite projective modules, build homotopy-equivalence and quasi-isomorphism APIs using Mathlib HomologicalComplex, homotopy and derived categories. Define perfectness through local finite-projective resolutions; construct minimal representatives over local rings, uniqueness up to homotopy, Tor-amplitude, duals, derived tensor products and derived completion. Prove derived Nakayama and specialization/extension results under explicit derived completeness and finiteness hypotheses. Distinguish the amplitude of a chosen complex, Tor-amplitude and the degrees of nonzero cohomology.

Prove the spectral sequence Tor_i^A(H^j(C),B) ⇒ H^(j−i)(C⊗ᴸ_A B) and convergence for the stated boundedness. Work with finite coefficient quotients before inverse limits, prove derived Mittag–Leffler comparisons, and retain lim¹ whenever it does not vanish. Morphisms, homotopies and Hecke actions must survive the inverse system; equalities only on cohomology do not specify a compatible chain action.

<a id="p8"></a>

## P8. Patching complexes with cohomology in several degrees

Construct patching from systems (R_N,S_N,C_N) where S_N is a finite quotient of O[Δ_N], Δ_N has bounded generator rank and unbounded p-power exponent, and C_N has a uniformly bounded finite-projective presentation over S_N. State the compatibility of derived augmentation, residual rings, chosen framings and transition maps. Fix the ultrafilter in the ultrapatching construction. Prove independence of representatives and comparisons of presentations/transition maps when actual compatible comparison data are supplied; no general independence of the ultrafilter is asserted. Uniform bounds, compactness of finite presentation data and cofinality are proved before taking a limit.

Construct S_∞=O[[z₁,…,z_q]], the patched local deformation base R_∞, its continuous action on C_∞ in the derived category, and the augmentation isomorphism C_∞⊗ᴸ_{S_∞}O ≅ C_original with all remaining framing variables explicit. Prove finite generation, perfectness and the comparison of finite-level Hecke actions. Group-algebra freeness at auxiliary level is an arithmetic input of ArithmeticLocallySymmetricSpaces; do not infer it merely from the cardinality of a finite covering.

<a id="p9"></a>

## P9. Amplitude, depth and component support

Prove the commutative-algebra inequalities relating codimension of support, projective dimension and Tor-amplitude over a regular local base, then the balanced-dimension conclusions used in Calegari–Geraghty. Include the non-Cohen–Macaulay and torsion cases through support of the whole perfect complex. Derive a one-degree module theorem as a specialization, not an assumption imposed on every C_N. Distinguish integral support from support after inverting p; characteristic-zero concentration does not imply vanishing of torsion cohomology outside the same degrees.

Build component-support transport under finite flat coefficient changes, removal of framing variables, specialization of local conditions and comparison of two patched systems. State the precise nearly faithful, radical-annihilator and union-of-components conclusion of each theorem; neither Cohen–Macaulayness nor a nonzero complex implies full support. Provide algebraic derived Ihara-avoidance lemmas comparing support when auxiliary local types change, with common residual specialization, local component maps and dimensions explicit. The arithmetic verification is PotentialAutomorphyInfrastructure. ACC+ §§6.2–6.4 use this interface without a blanket mod-p vanishing conjecture or integral R=T assertion.

Make the derived length identity of ACC+ §6.3.4 a reusable intermediate theorem. For an excellent local base S, a nonzerodivisor f in its maximal ideal, and a finite S-algebra T acting through End in the bounded derived category on a perfect S-complex, localize this derived action by idempotents; do not assume an unprovided strict T-module chain model. Under the stated irreducibility and zero-dimensional special-fibre hypotheses, prove the dimension-zero vanishing and dimension-one generic-length formula for the Euler characteristic after derived reduction modulo f. Establish localization, additivity and the needed finite-length assertions before using this identity to transport component support.

## Derived acceptance examples

Compute the two-term complex [O --p→ O], whose rationalization is acyclic but whose integral cohomology is nonzero; a two-term Koszul complex over O[[x]]; a perfect complex supported on one component of a reducible local ring; and a genuine one-degree Taylor–Wiles module. Check derived specialization and support before/after p-inversion in all four. Sources: Calegari–Geraghty, Modularity lifting beyond the Taylor–Wiles method (arXiv:1207.4224), and the published ACC+ patching sections in the campaign reference archive.


## Implementation handoff: Algebra with checkable arithmetic inputs

**Stages:** R03.1, R03.2, R03.4, R03.5, R03.6, P7, P8, P9. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Construct complete local rings and completed tensor products by their topology and universal property, then prove representability and tangent/obstruction criteria. The characteristic-zero-point lemma must expose its flatness/dimension input. Derived patching takes actual finite perfect complexes with a uniform amplitude, maps and coefficient-change equivalences.

**Acceptance and consumer contract.** Track dimensions relative to O, the local deformation base and the auxiliary power-series ring separately. Test a torsion-only coefficient ring and a complex with cohomology in two degrees. Prove support/component coverage from annihilators and depth after patching; a nonzero fibre or a dense collection of points cannot replace the stated support theorem. Consumers must discharge every numerical hypothesis.

## Source anchors and prototype coverage

- DeformationAndPatchingAlgebra source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
