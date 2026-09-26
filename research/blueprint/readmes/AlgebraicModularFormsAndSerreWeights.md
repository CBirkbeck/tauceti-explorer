# Modular forms — Hecke theory, newforms, and L-functions, Part II: Geometric reduction, Serre weights and eigenvalue lifting

**Base:** `tauceti:TauCetiRoadmap/ModularForms`. **Ownership:** accepted RS-06, reviewed in `REV-RS-06.md`. **Checkpoint:** partial, for issue #671. This document does not declare any of the six stages closed. It expands the algebraic core of R15.5; its stage-specific continuation requirements are part of the specification, not claims that the omitted proofs have been supplied.

The reviewed decomposition remains the source register for the full roadmap. The node `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma` keeps its identifier. Its new prerequisite nodes expose the algebra hidden inside the old single-node outline. The other reviewed nodes must be retained or explicitly refined on continuation; this checkpoint must not be promoted as a complete replacement of that decomposition.

## Carriers and conventions

Use the existing module, linear endomorphism, subalgebra, tensor product, algebra homomorphism, ideal, fraction-field and valuation-subring carriers. A character is an algebra homomorphism, not a new structure containing unspecified representation-theoretic conditions. A finite extension in the lifting statement means a **finite extension of fraction fields**. A chosen dominating valuation ring is not required to be module-finite over the original DVR. Completeness, a perfect residue field and separability of the extension are not standing assumptions.

For an O-module M and an O-algebra A, write M_A=A tensor_O M. All scalar-extension identifications must commute with the actual action of the operator algebra. Distinguish H acting on M_A from the larger algebra A tensor_O H: faithfulness of the former is not a substitute for faithfulness of the latter.

The input residual eigenvector is nonzero. The output integral eigenvector is nonzero but its reduction is **not prescribed**. The output controls the eigenvalues, using an explicit embedding of residue fields. Comparing two residue values without this map is not a well-typed congruence.

## R15.1 — Geometric forms and comparison

**Required construction.** Define all-weight forms as sections of powers of the Hodge line on the actual moduli family or a rigidified cover with descent data; define cusp forms by the cusp ideal. Use the Hodge line and formal cusp geometry supplied by R12.5 and R13.3. Do not assert descent of the Hodge line to a coarse curve in all weights, or identify an analytic form with an arbitrary power series.

**Required comparisons and acceptance.** State coefficient extension as a map before asserting a base-change isomorphism. Record the necessary cohomology/base-change assumptions and the stabilizer action. The analytic comparison must agree with the existing analytic modular-form carrier, including q-expansion normalizations. Test low-level stabilizers and restriction to a Tate-curve chart. This stage's reviewed source decomposition has not been reconstructed into a complete blueprint by this checkpoint.

## R15.2 — q-expansions, integral structures and Hecke actions

**Required construction.** Establish section detection at the actual required cusps and the integral version. Compare geometric Hecke actions with the arithmetic normalization of ModularForms. Separate integral Hecke-algebra finiteness from the existence of a particular lattice in a space of forms: the ModularForms weight-at-least-two symbol argument does not, by itself, provide that lattice.

**Required application interface.** For each module to which R15.5 is applied, specify O, the weight, the level, the character, which operators act integrally, and the exact map from its reduction into characteristic-p forms. Supply a preimage of the residual eigensystem under that map. A characteristic-p form is not automatically such a preimage. Cases in which the residue characteristic divides the level cannot be justified by a theorem assuming invertible level.

**Acceptance.** Test reduction of a characteristic-zero form separately from lifting a characteristic-p form. Check all-cusp integrality and the exact operator family. These are open supplier obligations, recorded in the packet's requests, rather than hypotheses silently built into a generic object called a modular form.

## R15.3 — Characteristic-p operations

The required objects are the Hasse invariant, Frobenius/Verschiebung operations and theta, with their q-expansion formulas, Hecke compatibilities and filtration consequences. Import the Igusa geometry from its owner rather than reconstructing it. The source proof for each operation must state its characteristic and level assumptions; characteristics two and three require their own checks. Ordinary complex differentiation or a Witt-vector identity is not already the modular characteristic-p operator.

The accepted scope still requires explicit Hasse q-expansion and theta-on-a-known-form tests. This checkpoint supplies no replacement for the reviewed Katz/Edixhoven construction nodes and no assertion that their low-characteristic cases are resolved.

## R15.4 — The local Serre recipe

Keep the full local residual representation, including its extension class when required. Equal semisimplified inertia does not imply the same weight recipe. The recipe is defined by the local case table, not by taking a minimum among weights of modular realizations. Separate the classical Serre weight from a Katz minimum; import the local finite-flat and ramification results from R07. Actual modular-weight optimization belongs to R20.3.

Continuation must preserve the irreducible, reducible, scalar, extension-sensitive and twisting rows, coefficient/isomorphism invariance, and the dyadic weight-two/weight-four distinction. Required tests include two extensions with equal semisimplified inertia, the dyadic finite-flat and non-finite-flat branches, and an untwisted weight outside the familiar twist-normalized interval. These are explicit coverage requirements, not completed statements in the present Lean prototype.

## R15.5 — The algebraic eigenvalue-lifting core

### The input and the conclusion

Let O be a DVR, k its residue field, K its fraction field and M a finite free O-module. Let T_i be an arbitrary pairwise commuting family of endomorphisms. A nonzero common eigenvector of their action on M_k determines residue eigenvalues a_i. Deligne–Serre 6.11 supplies a DVR V dominating O, with fraction field finite over K, and a nonzero common eigenvector in M_V whose eigenvalues reduce to the images of a_i. Neither a specified lift of the original vector nor a separable extension is part of the conclusion. [DS, Lemme 6.11, printed p. 522.]

### 1. The character of the invariant line

`adjoin_invariant_line` proves that stability under all T_i extends to the generated algebra H=O[T_i]. The endomorphisms preserving the line form a subalgebra, so the statement is an application of the existing adjoin universal property. This preservation lemma is valid even for the zero line; the construction of a character is not.

`eigencharacter` takes an action r of an R-algebra H on a compatible vector space over a field k, a nonzero vector f, and invariance of its line. Each r(h) acts by a unique scalar. Cancellation against f proves additivity, multiplicativity, preservation of one and compatibility with R. The result is the existing algebra-homomorphism type H -> k. Its three API lemmas are:

- `eigencharacter_apply`: evaluate the action on f without unfolding the choice of scalar.
- `eigencharacter_unique`: identify any candidate character by the action equation.
- `eigencharacter_rescale`: a nonzero scalar multiple of f gives the same character.

The three unit tests are `scalar_character_test` (the ordinary scalar action on k gives the identity character), `nilpotent_character_test` (nilpotent elements map to zero), and `diagonal_character_test` (the two coordinate lines of k x k produce different characters). They reject, respectively, the wrong scalar normalization, an erroneous semisimplicity assumption, and a construction that forgets the selected invariant line. The suggested file states all three as examples.

### 2. The horizontal branch and its integral character

Since H is an O-submodule of a finite free endomorphism module, it is finite and torsion-free. Over the DVR it is free. Commutation of the T_i makes H commutative. These are existing-library facts whose exact instance chain still needs baseline integration; they are not a new Hecke theory.

`horizontal_prime` uses the residual character chi:H -> k. Its kernel is maximal because chi restricts to the surjective residue map of O. Flatness of H and going down produce P contained in that kernel and contracting to zero in O. The packet cites the actual pinned going-down statements rather than a generic appeal to minimal primes.

`character_valuation_lift` spells out the next construction. Put B=H/P and L=Frac(B). The field L is finite over K. Let C be the integral closure of O in L. The pinned theorem `TauCeti.integralClosure.isDedekindDomain` proves that C is Dedekind **without separability**. Because B is integral over O, it embeds in C, and C is integral over B. Choose a prime q of C above ker(chi)/P. It contains the nonzero image of an O-uniformizer, so q is nonzero. Then V=C_q is a DVR with fraction field L. The map H -> B -> V gives a lifted character. Factoring its residue map through H/ker(chi) produces the embedding k -> k_V and the required reduction square.

This expands the integral character step by a normalization argument; it is not a claim that the paper separately states this construction. It also explains why no assertion of module-finiteness of V/O belongs in the interface. The exact pinned lying-over, generic-fiber and Dedekind-localization APIs remain a named baseline-integration worklist, not unmentioned mathematical assumptions.

### 3. Why the selected character actually occurs

`generic_action_faithfulness` concerns the entire algebra L tensor_O H. Tensoring H -> End_O(M) with the flat O-module L preserves injectivity. For a finite basis of M, the natural map from the tensor of its endomorphism module to the endomorphisms of its tensor extension is the identity between the corresponding matrix modules. Thus the scalar-extended algebra acts faithfully.

`nilpotent_ideal_socle` states that a nilpotent ideal I acting on a nonzero module kills a nonzero vector. Choose the last nonzero module I^n V in the finite descending sequence. This requires neither finite generation of V nor semisimplicity.

`localized_socle_descent` is the necessary denominator step. For a maximal ideal I of a Noetherian ring A, suppose V_I is nonzero and A_I is Artinian. Its maximal ideal is nilpotent, giving an annihilated nonzero localized vector w/s. Choose finitely many generators of I and clear the annihilation equation for each generator with a denominator outside I. Multiplying those denominators gives t w in V, killed by I. Its localization is still nonzero, so t w is nonzero. It would be a gap to stop with a vector that exists only in V_I.

`faithful_character_occurrence` now applies to a finite-dimensional commutative k-algebra H acting faithfully on a finite-dimensional k-vector space V. The annihilator is zero; the pinned finite-module support theorem makes the localization at ker(chi) nonzero. The localized-socle argument gives a vector killed by that kernel. Subtracting chi(h) from h gives the desired eigenvalue equation. This proof works for nonreduced algebras. The product-of-fields theorem for **reduced** Artinian algebras is not a substitute.

### 4. Return to the integral module

`integral_eigenvector` clears the finitely many coordinates of one common eigenvector over the fraction field. The index set of operators can be infinite: no operator-specific denominators are introduced. Homogeneity preserves all eigenvector equations, and injectivity of a finite free module into its generic fiber descends them to the integral module.

`deligneSerreEigenvalueLifting` assembles the preceding declarations. The suggested statement displays the field extension, the valuation subring, the scalar embedding, the residue-field embedding, maximal-ideal contraction and every eigenvalue congruence. Its retained node ID is the integration anchor; the prototype name is a proposed Lean spelling, not a claim of an existing declaration.

### Regression examples

**A prescribed residual vector need not lift.** For T=[[0,pi],[0,0]] on O^2, the reduction of T is zero and e_2 is a residual eigenvector. Over any dominating domain, T^2=0 forces the eigenvalue of a nonzero eigenvector to be zero; then pi*y=0 forces y=0. Thus no eigenvector reduces to e_2. Nevertheless e_1 gives the required lift of the eigenvalue zero.

**A field extension can be necessary.** For T=[[0,pi],[1,0]], every eigenvalue satisfies lambda^2=pi. A uniformizer is not a square in the fraction field of a DVR because its valuation is odd. Adjoining a root alpha gives the eigenvector (alpha,1). This can be inseparable in characteristic two, precisely a case the interface must admit.

**Faithfulness is load-bearing.** Let k x k act on k by its first projection and choose the second projection as the character. Evaluating at (1,0) forces any putative eigenvector to be zero. A bare character of an algebra does not automatically occur in a particular module.

These examples are explicit tests constructed for the blueprint, not examples attributed to Deligne and Serre. Exact rational and finite-field calculations were run for the matrix identities and finite-characteristic cases; their uniform proofs are specified in the suggested file but have not been checked by Lean.

### The modular-form application still required

The reviewed node `R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform` remains on the continuation worklist. Split its actual module-lifting application from its Eisenstein weight shift and from R19's Galois attachment. DS 6.9 and 6.10 are on printed page **522**, not 521. The weight-shift argument needs its actual congruence and weight divisibility conditions; it is not supplied merely by writing a formal Hasse multiplier.

Reuse ModularForms Layer 8 and its weight-one sublayer 8W for their exact integral input. Deligne–Serre Proposition 2.7 is not Lemme 6.11. Layer 4 supplies the relevant newform/normalization and bad-prime information. A good-prime eigensystem alone is not a normalized full eigenform, and the algebraic lemma alone does not prove lifting of every Katz weight-one form at weight one. The packet makes three precise requests for these interfaces.

## R15.6 — Residual modularity witnesses

After R19.1 supplies the associated Galois representation, define the witness using its coefficient field, a prime over p, the eigenform and the isomorphism with the residual semisimplification. Use R01.5 for the finite-field descent input and R15.4 for the local weight recipe. Keep modularity-existence, weight optimization and the exceptional dyadic completion with their accepted owners. Continuation must type all maps and determinant comparisons; this checkpoint does not introduce an unspecified predicate standing for those constructions.

## Source and baseline record

**DS:** Pierre Deligne and Jean-Pierre Serre, *Formes modulaires de poids 1*, Annales scientifiques de l'ENS, fourth series 7 (1974), 507–530, published Numdam scan, <https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf>. Section 6.8–6.11 on printed page 522 was read; Lemme 6.11 and its proof were checked in the page image on 26 September 2026. No new error is asserted for this checked passage. Unread source material is not certified by the empty source-issues list.

The eight baseline declarations listed in the packet were read in their actual files at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. In particular, `IsDiscreteValuationRing.exists_lift_of_le_one` concerns bounded elements of an **existing fraction field**; it is not an existence theorem for a new DVR or a substitute for the normalization argument. No unchecked search hit is promoted to a verified baseline declaration.

The suggested file is uncompiled. No mathematical implementation is claimed. The remaining exact-API, full-audit/link reconciliation, source and geometric/local construction obligations are recorded explicitly in the packet and handoff.
