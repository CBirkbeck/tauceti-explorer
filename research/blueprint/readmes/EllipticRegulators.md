# EllipticRegulators — ER.1 to ER.8

The blueprint for the whole roadmap: the analytic curve, the Deligne regulator,
the elliptic dilogarithm, the divisor formula, Bloch's CM theorem, the Beilinson
statement, the modular case and the worked examples. This document is definitive;
the packet `research/blueprint/packets/EllipticRegulators.json` is its machine
form and the suggested Lean file is a naming proposal, not an implementation.

Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## The source

One thesis, freely available and **in French**; this document quotes it in French
and restates the mathematics in English in the node statements:

> François Brunault, *Valeur en 2 de fonctions L de courbes elliptiques*. Doctoral thesis, Université Paris 7, defended 2005; arXiv:math/0602186v1, 165 pages. In French. Locators give the page of the arXiv PDF.
> <https://arxiv.org/abs/math/0602186>,
> SHA-256 `8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7`, accessed 2026-09-24.

- Downloaded from the arXiv on 24 September 2026; the recorded hash is of the file the arXiv e-print endpoint returns for this identifier, which for this submission is the PDF itself.
- Introduction §§0.1 to 0.7, pp. 7 to 14: Theorems 1 to 8 with their hypotheses and remarks, the two imprecisions of the classical argument and their removal, the recollection of the Zagier conjecture for the value at two and of Bloch's CM result, and the plan of the thesis.
- §1.1, pp. 24 to 27: Goncharov's function on a compact Riemann surface, the regulator on symbols with its well-definedness, and the relation to the Beilinson regulator up to a factor.
- §1.2, pp. 28 to 32: the elliptic case, the elliptic dilogarithm as an orbit sum with its convergence and regularity, the distribution relations, the real normalisation with the parameter, Proposition 26 identifying the dilogarithm with twice the imaginary part of the complex function, and the Abel-Jacobi indexing of the Fourier expansions.
- §1.3 and §1.4, pp. 35 to 40: the differential property (Theorem 29) with the uniqueness of the auxiliary form, and the behaviour under finite morphisms, which the source notes had not been written down before.
- §2.1 and §2.2, pp. 55 to 57: the construction of K-theory classes from torsion points with the regulator given by the elliptic dilogarithm, and Theorem 6 relating the function on a Jacobian to the one on the curve.
- NOT read: chapter 2 beyond §2.2, chapter 3 in full — the Eisenstein series, the Rankin-Selberg computation, the modular units and the proofs of Theorems 3 to 8 — and the appendix. The statements of those theorems were read in the introduction and are quoted from there, with their hypotheses.
- The PDF's text layer is an automatic extraction of a French thesis: accented letters appear as two characters and the name Beilinson is systematically broken. Every excerpt quoted here was repaired character by character against the surrounding text, without changing a word.

**Bloch's monograph, which ER.5's stage text names, is in the reference library
and its scan carries no text layer in this environment** — the supplied extraction
is a list of empty page markers and an independent extraction reproduces that.
There is no renderer here. The explicit scalar of Theorem 11.2.1 is therefore
recorded from the roadmap's own transcription, whose text states that it was
visually checked at the printed pages it names, and a gap records this.

There is **no integrated decomposition** for this roadmap.

## What the pinned libraries already have

`AUDIT-28` records every layer as *not built*. Every claim was checked against
the declaration index. Cited, never re-planned:

- `mathlib:Complex.exp` (`Mathlib/Analysis/Complex/Exponential.lean`) — The exponential, which turns the additive presentation into the multiplicative one.
- `mathlib:NumberField.InfinitePlace` (`Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`) — The infinite places of a number field with their conjugation action, pinned; the elliptic payload they carry is what ER.1 adds.
- `mathlib:NumberField.InfinitePlace.nrRealPlaces` (`Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`) — The number of real places, which fixes the dimension of the regulator target.
- `mathlib:PeriodPair` (`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`) — A pair of periods independent over the reals, the input of the analytic construction; pinned with its lattice.
- `mathlib:PeriodPair.lattice` (`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`) — The lattice it spans, with closedness and the rank-two basis, pinned.
- `mathlib:PeriodPair.weierstrassP` (`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`) — The Weierstrass function with its locally uniform convergence, periodicity, parity and pole orders, pinned together with its derivative, the Eisenstein coefficients and the differential equation they satisfy; ER.1 adds the group isomorphism these do not give.
- `mathlib:UpperHalfPlane` (`Mathlib/Analysis/Complex/UpperHalfPlane/Basic.lean`) — The upper half-plane, where the ratio of periods lives.

Absent at both pins: Deligne cohomology and hypercohomology of a complex of
sheaves; the dilogarithm in any form, ordinary or elliptic; Kronecker–Eisenstein
series; Riemann surfaces; differential forms on a curve; and any regulator.

## ER.1 — The analytic elliptic curve and its periods

Mathlib already has a lot of this: `PeriodPair`, the lattice, `℘` and `℘′`
with locally uniform convergence, periodicity, parity, pole orders, the
Eisenstein coefficients and `℘′² = 4℘³ − g₂℘ − g₃`, all complete. **What is
missing** is the group isomorphism `ℂ/Λ ≅ E(ℂ)`, the non-vanishing of a
lattice's discriminant, and the fact that every complex elliptic curve comes
from a lattice.

**The period matrix is not a definition.** It is the matrix of the integration
pairing under the comparison isomorphism, and its non-degeneracy is a theorem
about that pairing.

Coverage: **source_decomposed**.

Four nodes. The complex uniformisation, built on Mathlib's pinned Weierstrass functions, period lattices, Eisenstein coefficients and differential equation, and adding the three things they do not give: the group isomorphism, the non-vanishing of the discriminant of a lattice, and the fact that every complex elliptic curve comes from one; the multiplicative presentation with the parameter, its transformation under a change of basis and the real normalisation fixed by an orientation of the real locus, which is what makes the dilogarithm of ER.3 well defined up to sign; the periods, stated as the matrix of the integration pairing under the comparison isomorphism with the non-degeneracy as a consequence, exactly as the stage text demands, with the absence of algebraic de Rham cohomology at the pins recorded; and the carrying of all complex embeddings with the conjugation action, with the rule that a statement at one embedding is not a statement at all of them.

### The complex elliptic curve and its uniformisation

`EllipticRegulators:ER.1/complex-uniformisation` · *construction* · planet **Complex uniformisation**

For an elliptic curve over the complex numbers the map sending a point of the quotient of the plane by a lattice to the pair consisting of the Weierstrass function and its derivative is an isomorphism of complex Lie groups onto the curve; conversely every elliptic curve arises this way. Mathlib has a substantial part of the analytic input already: the lattice of a real-independent pair of periods, the Weierstrass function and its derivative with locally uniform convergence, periodicity, parity, meromorphy and pole orders, the Eisenstein coefficients and the differential equation they satisfy, all complete. What is missing, and what this node supplies, is the group isomorphism itself, the non-vanishing of the discriminant of a lattice, and the statement that every elliptic curve over the complex numbers comes from a lattice.

**Hypotheses.**

- The lattice is the one of a pair of periods that is independent over the reals, which is Mathlib's period pair.
- The curve is the elliptic curve of the companion roadmap's scheme, whose complex points carry the analytic structure.
- The isomorphism is of complex Lie groups: holomorphic, bijective and a group homomorphism, and all three are part of the statement.

**Proof outline.**

1. Record the pinned material: the lattice, the Weierstrass function and its derivative, the Eisenstein coefficients and the differential equation.
2. Prove that the discriminant attached to a lattice is non-zero, so that the differential equation defines an elliptic curve.
3. Prove that the map given by the Weierstrass function and its derivative is a bijection of the quotient onto the complex points of that curve and is a group homomorphism.
4. Prove the converse: every elliptic curve over the complex numbers is obtained from a lattice, using the surjectivity of the modular invariant that Mathlib supplies.
5. Record the invariant differential on both sides and that it corresponds to the differential of the coordinate on the quotient.

**Acceptance.**

- The map is an isomorphism of complex Lie groups.
- The discriminant of a lattice is non-zero.
- Every elliptic curve over the complex numbers comes from a lattice, and the lattice is determined up to a complex scaling.
- The invariant differential corresponds to the coordinate differential on the quotient.

**Prerequisites.** `mathlib:PeriodPair`, `mathlib:PeriodPair.lattice`, `mathlib:PeriodPair.weierstrassP`, `EllipticKTheory:E.1`

**API.**

| name | role | statement |
| --- | --- | --- |
| `latticeQuotient` | data | The quotient of the complex plane by a period lattice. |
| `uniformisation` | data | The map to the curve given by the Weierstrass function and its derivative. |
| `uniformisation_isGroupIso` | characterisation | It is an isomorphism of complex Lie groups. |
| `lattice_discriminant_ne_zero` | characterisation | The discriminant of a lattice is non-zero. |
| `exists_lattice` | characterisation | Every complex elliptic curve comes from a lattice. |
| `uniformisation_invariantDifferential` | compatibility | The invariant differential corresponds to the coordinate differential. |

**Used by.**

- *ER.1, the q-parameter* — The multiplicative presentation is obtained from this one by exponentiating.
- *ER.3* — The elliptic dilogarithm is a function on the quotient, transported to the curve by this isomorphism.
- *ER.2* — The regulator integral is taken over the complex points, with the analytic structure this node supplies.

**Unit tests.**

- `pinned_differential_equation` — The Weierstrass function and its derivative satisfy the pinned differential equation, which is what makes the target an elliptic curve.
- `group_homomorphism` — The map is a group homomorphism; a bijection that was not would not give the group law.
- `scaling` — Scaling the lattice by a non-zero complex number gives an isomorphic curve.
- `every_curve` — Every complex elliptic curve arises from a lattice.

**Sources.**

- §1.2, the elliptic case, p. 28 of the PDF, The source works throughout with a complex elliptic curve presented analytically; this node supplies that presentation. The thesis is in French and the packet quotes it in French, with the mathematics restated in English in the node statements.

  > Dans cette section seulement, nous faisons l'hypothèse que X est une courbe elliptique (sur C), c'est-à-dire g = 1 et X est muni d'un point distingué 0. Nous allons voir que la fonction R_E permet de retrouver le dilogarithme elliptique sur E, défini par Bloch.

### The multiplicative presentation and the parameter q

`EllipticRegulators:ER.1/the-q-parameter-and-the-multiplicative-presentation` · *construction*

Choosing an oriented basis of the lattice writes the quotient as the quotient of the multiplicative group of non-zero complex numbers by the subgroup generated by a parameter q, where q is the exponential of two pi i times the ratio of the two basis periods and that ratio has positive imaginary part. The presentation depends on the chosen basis, and a change of basis by a modular matrix changes the ratio by the corresponding fractional linear transformation. For a curve defined over the real numbers the orientation of the real locus picks out a basis for which q is REAL with absolute value less than one, and that is the normalisation the dilogarithm of ER.3 uses.

**Hypotheses.**

- The basis is oriented, that is the ratio of the second period to the first has positive imaginary part, which fixes the sign conventions everywhere downstream.
- The parameter q has absolute value less than one, which is what makes the orbit sums of ER.3 converge.
- For a curve over the reals the source fixes the basis by an orientation of the real locus and a compatible second period; q is then real and the dilogarithm is well defined up to sign.

**Proof outline.**

1. Construct the exponential map from the quotient by the lattice to the quotient of the multiplicative group and prove that it is an isomorphism of complex Lie groups.
2. Define the parameter and prove the relation with the ratio of periods, with the positivity of the imaginary part.
3. Prove the transformation rule under a change of basis by a modular matrix.
4. Record the real normalisation the source uses: an orientation of the real locus gives a canonical generator of the invariant part of the first homology, a second period completes it to a direct basis, and the resulting parameter is real between minus one and one.
5. Record the consequence: the elliptic dilogarithm attached to this normalisation depends only on the curve and the orientation, and changing the orientation changes its sign.

**Acceptance.**

- The parameter has absolute value less than one.
- For a curve over the reals with the source's normalisation the parameter is real and lies strictly between minus one and one.
- A change of basis acts on the ratio of periods by the fractional linear transformation.
- Changing the orientation of the real locus changes the sign of the associated dilogarithm.

**Prerequisites.** `EllipticRegulators:ER.1/complex-uniformisation`, `mathlib:UpperHalfPlane`, `mathlib:Complex.exp`

**API.**

| name | role | statement |
| --- | --- | --- |
| `qParameter` | data | The parameter attached to an oriented basis. |
| `qParameter_abs_lt_one` | characterisation | Its absolute value is less than one. |
| `qParameter_real` | characterisation | For a curve over the reals with the fixed orientation it is real and between minus one and one. |
| `multiplicativePresentation` | data | The isomorphism with the quotient of the multiplicative group. |
| `qParameter_changeOfBasis` | compatibility | The transformation under a modular change of basis. |

**Used by.**

- *ER.3* — The orbit sum defining the dilogarithm runs over the powers of this parameter.
- *ER.4* — The divisor formula is stated in the multiplicative coordinates.
- *ER.5* — Bloch’s CM computation uses this normalisation of the parameter.

**Unit tests.**

- `abs_lt_one` — The parameter has absolute value less than one.
- `real_case` — For a curve over the reals it is real.
- `basis_change` — A modular change of basis acts by the fractional linear transformation.
- `orientation_sign` — Reversing the orientation changes the sign of the dilogarithm attached to it.

**Sources.**

- (1.40) and (1.41), p. 30 of the PDF, The real normalisation with the parameter, verbatim; the orientation of the real locus is fixed just before it.

  > Nous posons β = ∫_{γ₂} ω / ∫_{γ₁} ω, où ω désigne une forme différentielle holomorphe non nulle quelconque sur E(C). Le nombre q = exp(2iπβ) est un nombre réel non nul. Il vérifie -1 < q < 1 et ne dépend que de E.

### Periods, homology and the comparison with algebraic de Rham cohomology

`EllipticRegulators:ER.1/periods-and-the-comparison-isomorphism` · *theorem*

The period matrix is not a datum attached to the curve by definition: it is the matrix of the integration pairing between the first singular homology of the complex points and the algebraic de Rham cohomology, under the comparison isomorphism. Its non-degeneracy is the statement that the pairing is perfect, and it is a theorem about that comparison. This node states the comparison in the elliptic case, records the pinned material on both sides — Tau Ceti has the abstract Hodge structures of weight one and the regular differentials of a function field, and neither library has algebraic de Rham cohomology of a variety — and states the intersection pairing on homology that the orientation of the previous node uses.

**Hypotheses.**

- The curve is defined over a subfield of the complex numbers; the comparison is with the base change to the complex numbers.
- The first homology of the complex points of an elliptic curve is free of rank two, and the intersection pairing on it is a perfect alternating form.
- The non-degeneracy of the period matrix is a consequence of the comparison being an isomorphism and of the pairing being perfect, not an assumption.

**Proof outline.**

1. State the comparison isomorphism between algebraic de Rham cohomology and singular cohomology with complex coefficients, and record that neither pinned library has the left-hand side.
2. State the integration pairing between homology and holomorphic differentials, and define the period matrix as its matrix in chosen bases.
3. Prove the non-degeneracy from the perfectness of the pairing.
4. Record the intersection pairing on the first homology and the notion of a direct basis, which the previous node's orientation uses.
5. Record the pinned material: the weight-one Hodge structures, the regular differentials of a function field with the dimension equal to the genus, and the absence of algebraic de Rham cohomology.

**Acceptance.**

- The period matrix is the matrix of the integration pairing and is non-degenerate.
- The first homology is free of rank two with a perfect intersection pairing.
- Neither library has algebraic de Rham cohomology, so the comparison is entirely this blueprint's work.
- The period matrix is not part of the definition of the curve; attaching it as data would be a different and weaker statement.

**Prerequisites.** `EllipticRegulators:ER.1/complex-uniformisation`, `ComplexComparisonPartII:C5`, `PadicHodgeRegulators:D.1`

**Sources.**

- (1.43) and (1.44), p. 31 of the PDF, The integration pairing and the resulting isomorphism, verbatim; the period matrix of this node is the matrix of that map.

  > l'application d'Abel-Jacobi H_1(E, Z) -> Hom_C(Ω^{1,0}(E), C), γ ↦ (ω ↦ ∫_γ ω) induit un isomorphisme d'espaces vectoriels réels H_1(E, R) = Hom_C(Ω^{1,0}(E), C).

### All complex embeddings and the conjugation action

`EllipticRegulators:ER.1/all-embeddings-and-the-conjugation-action` · *comparison*

For a curve over a number field the analytic constructions are carried out at EVERY complex embedding, and complex conjugation acts on the set of embeddings and, compatibly, on the analytic objects attached to them. A real embedding gives a curve over the reals with the normalisation of the second node; a pair of conjugate complex embeddings gives two analytic curves exchanged by conjugation. The regulator target of ER.2 is built from the conjugation-invariant part, and a computation at one embedding is not a computation at all of them. Mathlib has the infinite places, their real and complex classification and the conjugation action; what is missing is the elliptic payload they carry.

**Hypotheses.**

- The field is a number field with its real and complex places; the action of conjugation on embeddings is the pinned one.
- For a real embedding the curve is defined over the reals and the orientation normalisation applies.
- The invariant part is taken with respect to the combined action on the embedding and on the analytic object, not on either alone.

**Proof outline.**

1. Record the pinned infinite places with their classification and the conjugation action.
2. Attach to each embedding the analytic curve, the period lattice and the parameter of the earlier nodes.
3. Prove the compatibility: conjugation carries the analytic data of an embedding to that of the conjugate embedding.
4. Record the real case, where the curve is defined over the reals and the parameter is real.
5. State the rule this layer exports: every later statement names the embeddings it is about, and a statement at one embedding is not a statement at all of them.

**Acceptance.**

- Conjugation carries the analytic data of an embedding to that of its conjugate.
- At a real embedding the parameter is real.
- A statement at one embedding does not imply the statement at the others.
- The number of real and complex places is the pinned count, and the invariant part has the corresponding dimension.

**Prerequisites.** `EllipticRegulators:ER.1/the-q-parameter-and-the-multiplicative-presentation`, `mathlib:NumberField.InfinitePlace`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`

**Sources.**

- §1.2, the real normalisation, p. 30 of the PDF, The real case, verbatim; for a number field the same construction is carried out at each real embedding and in conjugate pairs at the complex ones.

  > Lorsque la courbe elliptique E est définie sur R, il existe un dilogarithme elliptique D_E bien défini au signe près. Pour voir cela, choisissons une orientation de E(R).

## ER.2 — Deligne cohomology and the symbol regulator

`η(f,g) = log|f| d arg g − log|g| d arg f`, its differential identity, and the
regulator `{f,g} ↦ (ω ↦ ∫_X log|f| ω ∧ d^c log|g|)` with the Steinberg relation
proved through the Bloch–Wigner dilogarithm.

**The factor is fixed by comparison, not by the answer.** The source itself says
its functional gives the Beilinson regulator *à un facteur près*. That factor
and the orientation must be pinned against the universal Chern/Deligne
regulator — **never** chosen so that the final L-value formula comes out true.

Coverage: **source_decomposed**.

Four nodes. The real Deligne complex with its hypercohomology, the degree-two weight-two exact sequence, the conjugation-invariant part for a number field and the one-dimensionality of the target over the rationals, with the identification with the reals depending on the normalised data of ER.1; the form attached to a symbol with its three usable facts, the differential identity, closedness on units and the local behaviour at zeros and poles; the regulator itself, with convergence, bilinearity, the Steinberg relation through the dilogarithm, independence of representatives, cuts and punctured cycles, and the identification with the period pairing when the tame symbols vanish; and the normalisation node, which records the source's own 'up to a factor', requires the factor to be fixed by comparison with the universal regulator, and states as a non-example that it may not be chosen to make the final L-value formula true.

### The real Deligne complex and the regulator target

`EllipticRegulators:ER.2/the-deligne-cohomology-target` · *construction* · planet **The Deligne regulator target**

The real Deligne complex in weight two is the complex of sheaves on the complex points that computes, in degree two, the target of the regulator. Its hypercohomology sits in an exact sequence relating it to the de Rham and singular cohomologies of the curve, and for a curve over a number field one takes the part invariant under the combined action of complex conjugation on the embeddings and on the coefficients. For a curve over the rationals the resulting real target is ONE-dimensional, and its identification with the real numbers depends on the normalised homology and differential data of ER.1. Neither pinned library has Deligne cohomology or hypercohomology of a complex of sheaves.

**Hypotheses.**

- The curve is smooth and projective over a subfield of the complex numbers; for the dimension statement it is over the rationals.
- The invariant part is taken for the combined action, as in the last node of ER.1.
- The identification of the one-dimensional target with the real numbers is not canonical: it depends on the chosen normalised generator of the invariant homology and on the differential normalised against it.

**Proof outline.**

1. Define the real Deligne complex in weight two and its hypercohomology.
2. State the exact sequence in degree two relating it to the de Rham and singular cohomologies.
3. Take the conjugation-invariant part for a number field and record how the embeddings enter.
4. Compute the dimension over the rationals and record that the answer is one.
5. Fix the identification with the real numbers through the normalised data of ER.1, and record that a different normalisation changes it by a non-zero real factor.
6. Record that neither library has any of this, so the whole node is new work.

**Acceptance.**

- Over the rationals the target is one-dimensional.
- Its identification with the real numbers depends on the normalisation and is not canonical.
- For a number field the target is built from the invariant part and its dimension is the number of real places plus the number of complex places, in the weight-two case at hand.
- Nothing of this exists at the pins.

**Prerequisites.** `EllipticRegulators:ER.1/periods-and-the-comparison-isomorphism`, `EllipticRegulators:ER.1/all-embeddings-and-the-conjugation-action`, `PadicHodgeRegulators:D.1`

**API.**

| name | role | statement |
| --- | --- | --- |
| `deligneComplex` | data | The real Deligne complex in weight two. |
| `deligneCohomology` | data | Its hypercohomology in degree two. |
| `deligneCohomology_exactSequence` | characterisation | The exact sequence relating it to de Rham and singular cohomology. |
| `deligneCohomology_invariant` | data | The conjugation-invariant part for a number field. |
| `deligneCohomology_rank_one` | example | Over the rationals the target is one-dimensional. |
| `deligneCohomology_normalisation` | compatibility | The identification with the reals through the normalised data. |

**Used by.**

- *ER.2, the regulator* — The regulator maps into this group.
- *ER.6* — The Beilinson statement is about the regulator into this target, restricted to the integral part.
- *ER.8* — The syntomic comparison is with the p-adic analogue of this target.

**Unit tests.**

- `dimension_over_Q` — Over the rationals the target is one-dimensional.
- `normalisation_dependence` — A different normalisation changes the identification with the reals by a non-zero factor.
- `invariant_part` — For a number field the target is the invariant part, not the product over all embeddings.
- `absent_at_pins` — Neither library has Deligne cohomology; this is new work.

**Sources.**

- (1.23) and (1.27), pp. 25 and 26 of the PDF, The concrete target the source uses, the dual of the holomorphic differentials, with the regulator into it; this node builds the Deligne-cohomological target that it computes.

  > l'explicitation d'une application régulateur r_X : K_2(C(X)) -> Hom_C(Ω^{1,0}(X), C). ... L'application régulateur r_X associée à X est définie par r_X : K_2(C(X)) -> Hom_C(Ω^{1,0}(X), C), {f, g} ↦ (ω ↦ ∫_X log|f| ω ∧ d^c log|g|).

### The form attached to a symbol and its differential identity

`EllipticRegulators:ER.2/the-eta-form-and-its-differential-identity` · *construction*

To a pair of non-zero meromorphic functions attach the real one-form given by the logarithm of the absolute value of the first times the differential of the argument of the second, minus the same with the roles exchanged. Away from the zeros and poles it is smooth, its exterior derivative is the imaginary part of the wedge of the two logarithmic differentials, and around a zero or a pole it has a computable singular behaviour with residue determined by the orders and by the tame symbol. These are the three facts a regulator computation uses, and they are stated here as such.

**Hypotheses.**

- The functions are non-zero meromorphic functions on the complex points of the curve; the form is defined on the complement of their zeros and poles.
- The argument is multivalued, so the form is defined by its local branches and the identity must be checked to be branch-independent.
- The behaviour at a zero or a pole is described after removing a small disc, and the limit is what the regulator integral uses.

**Proof outline.**

1. Define the form by its local branches and check that it is independent of them.
2. Prove the differential identity, that its exterior derivative is the imaginary part of the wedge of the logarithmic differentials.
3. Prove that it is closed where the functions are units, which is the case relevant to the regulator.
4. Compute the behaviour around a zero or a pole, with the leading term given by the orders and the local leading units.
5. Record what the pinned libraries supply: differential forms on normed spaces with the exterior derivative, curve integrals with a local Poincare lemma, and Tau Ceti's arguments, winding numbers and residues, none of them on a curve.

**Acceptance.**

- The exterior derivative is the imaginary part of the wedge of the logarithmic differentials.
- Where both functions are units the form is closed.
- Around a zero or a pole the singular behaviour is determined by the orders and the leading units, which is what makes the tame symbol appear.

**Prerequisites.** `EllipticRegulators:ER.2/the-deligne-cohomology-target`, `EllipticKTheory:E.3`

**API.**

| name | role | statement |
| --- | --- | --- |
| `etaForm` | data | The one-form attached to a pair of functions. |
| `etaForm_branch_indep` | characterisation | Independence of the local branch of the argument. |
| `etaForm_extDeriv` | characterisation | The differential identity. |
| `etaForm_closed_of_units` | characterisation | Closedness where both functions are units. |
| `etaForm_local_behaviour` | characterisation | The behaviour around a zero or a pole. |

**Used by.**

- *ER.2, the regulator* — The regulator is the integral of this form against a cycle, or the integral of the associated two-form.
- *ER.4* — The divisor formula is proved by integrating this form and computing the local contributions.
- *ER.7* — The modular computation integrates the same form against a modular differential.

**Unit tests.**

- `unit_case` — Where both functions are units the form is closed.
- `derivative` — Its exterior derivative is the imaginary part of the wedge of the logarithmic differentials.
- `antisymmetry` — Exchanging the two functions changes the sign.
- `local_residue` — Around a simple zero of the first function the form has the expected singular behaviour.

**Sources.**

- (1.27), p. 26 of the PDF, The integrand of the regulator, verbatim; the form of this node is the antisymmetrised version that makes the Steinberg relation visible.

  > r_X({f, g})(ω) = ∫_X log|f| ω ∧ d^c log|g|

### The regulator of a symbol

`EllipticRegulators:ER.2/the-regulator-on-symbols` · *construction* · planet **The symbol regulator**

The regulator of a symbol of two functions is the linear functional on holomorphic differentials sending a differential to the integral over the complex points of the logarithm of the absolute value of the first function times the wedge of that differential with the twisted differential of the logarithm of the absolute value of the second. The integral converges, the result is well defined on the second K-group of the function field because the Steinberg relation holds — which is where the Bloch-Wigner dilogarithm enters — and it is independent of the representative, of the cuts used to define the branches and of the punctured cycles used to avoid the zeros and poles. When the tame symbols vanish the functional is the period pairing of the layer.

**Hypotheses.**

- The functions are non-zero meromorphic; the integral is over the whole complex points and converges because the singularities are logarithmic.
- Well-definedness on the K-group is the Steinberg relation, and its proof uses the dilogarithm; this is not a formality.
- Independence of the cuts and of the punctured cycles is part of the statement, because the naive definition involves both.

**Proof outline.**

1. Define the functional by the displayed integral and prove convergence.
2. Prove bilinearity and antisymmetry.
3. Prove the Steinberg relation, through the dilogarithm identity, and deduce that the functional descends to the second K-group of the function field.
4. Prove independence of the representative, of the cuts and of the punctured cycles.
5. Record that when the tame symbols vanish the functional is the pairing against the periods, which is the case the later layers use.
6. Record the relation with the algebraic side: the localisation of the previous roadmap identifies the second K-group of the curve with a subspace of that of the function field, and the regulator is the restriction of this functional to that subspace.

**Acceptance.**

- The functional is well defined on the second K-group of the function field.
- It is bilinear and antisymmetric.
- It is independent of the cuts and of the punctured cycles.
- On classes with vanishing tame symbols it is the period pairing.

**Prerequisites.** `EllipticRegulators:ER.2/the-eta-form-and-its-differential-identity`, `EllipticKTheory:E.3`, `Polylogarithms:P.1`

**API.**

| name | role | statement |
| --- | --- | --- |
| `symbolRegulator` | data | The functional attached to a symbol. |
| `symbolRegulator_converges` | characterisation | Convergence of the defining integral. |
| `symbolRegulator_bilinear` | characterisation | Bilinearity and antisymmetry. |
| `symbolRegulator_steinberg` | characterisation | The Steinberg relation, so that it descends to the K-group. |
| `symbolRegulator_indep` | characterisation | Independence of the representative, the cuts and the punctured cycles. |
| `symbolRegulator_period_pairing` | relation | On classes with vanishing tame residues it is the period pairing. |

**Used by.**

- *ER.4* — The divisor formula computes this functional.
- *ER.6* — The Beilinson statement is about this functional restricted to the integral part.
- *ER.7* — The modular computation evaluates it against a newform differential.

**Unit tests.**

- `steinberg` — The Steinberg relation holds, which is what makes the functional defined on the K-group.
- `antisymmetry` — Exchanging the two functions changes the sign.
- `cut_independence` — The value does not depend on the cuts used for the branches.
- `vanishing_residues` — On a class with vanishing tame residues the functional is the period pairing.

**Sources.**

- (1.25) and (1.27), p. 26 of the PDF, The definition with the assertion of well-definedness, verbatim.

  > L'application régulateur r_X associée à X est définie par r_X : K_2(C(X)) -> Hom_C(Ω^{1,0}(X), C), {f, g} ↦ (ω ↦ ∫_X log|f| ω ∧ d^c log|g|). Cette application est bien définie d'après (1.25).

- §1.1, the localisation remark, p. 27 of the PDF, The relation between this functional and the Beilinson regulator, verbatim, including the words "a un facteur pres" which the next node turns into a normalisation requirement.

  > La localisation en K-théorie algébrique induit une inclusion K^{(2)}_2(X_Q) ↪ K_2(Q(X)) ⊗ Q, d'où après extension des scalaires un morphisme ... La composition de ce morphisme et de r_X donne, à un facteur près, le régulateur de Beilinson.

### Fixing the factor and the orientation, and what may not be used to fix them

`EllipticRegulators:ER.2/the-normalisation-factor` · *comparison*

The source itself says that the composite of the localisation with its explicit functional gives the Beilinson regulator UP TO A FACTOR. That factor, together with the orientation, must be fixed by comparison with the universal Chern class or Deligne regulator, and this node states the comparison as the way to fix it. What may NOT be used to fix it is the final L-value formula: choosing the power of two pi so that a theorem comes out true is circular, and the stage text names this. The node also records the two places where the factor visibly enters, the twisted differential and the identification of the one-dimensional target with the reals.

**Hypotheses.**

- The comparison is with the universal regulator, which the p-adic-Hodge and complex-comparison roadmaps own.
- The orientation is the one of ER.1, fixed by the real locus for a real embedding.
- The factor is a fixed rational multiple of a power of two pi; the statement is that it is determined, not that it is one.

**Proof outline.**

1. Record the source's own statement that its functional gives the Beilinson regulator up to a factor.
2. State the comparison with the universal Chern or Deligne regulator as the way the factor is fixed, and name the owner.
3. Record the two places the factor enters.
4. State the non-example: the factor may not be chosen to make the final formula true, and a formalisation that did so would have proved nothing.
5. Record the consequence for the later layers: every L-value statement carries the factor explicitly, and the CM theorem of ER.5 is stated with an explicit scalar rather than an unspecified non-zero constant.

**Acceptance.**

- The factor is determined by the comparison with the universal regulator.
- It may not be fixed by requiring the final formula to hold.
- Every L-value statement downstream carries it explicitly.

**Prerequisites.** `EllipticRegulators:ER.2/the-regulator-on-symbols`, `ComplexComparisonPartII:C5`, `SchemeKTheoryOperations:S.6`

**Sources.**

- §1.1, the localisation remark, p. 27 of the PDF, The source’s own "up to a factor", verbatim; this node is the requirement that the factor be pinned down independently.

  > La composition de ce morphisme et de r_X donne, à un facteur près, le régulateur de Beilinson.

## ER.3 — The elliptic dilogarithm and its companion

`D_E(x) = Σ_{n∈ℤ} D(x qⁿ)`, convergent, smooth off the origin, with the
distribution relations — and its **companion**, a regularised logarithmic series
needing a Bernoulli correction, assembled by Bloch's convention into one complex
function whose imaginary part is `D_E`.

**Both parts are needed.** The complex regulator formula is a statement about
the complex function; the identity for the imaginary part alone does not give
it. The Steinberg relation is proved by truncation on annuli, uniform estimates
on both parts, and a limit — not formally from the Bloch–Wigner identity.

Coverage: **source_decomposed**.

Four nodes. The elliptic dilogarithm as the orbit sum, with convergence, regularity, the distribution relations and the sign ambiguity for a real curve; the regularised logarithmic companion, whose naive sum diverges and needs the Bernoulli correction, with Bloch's convention assembling the two into one complex function and with the explicit statement that the imaginary part alone does not suffice for the complex regulator formula; the Steinberg relation for that function, proved by truncation on annuli, uniform estimates on BOTH parts and a limiting argument, which is the structure the stage text demands; and the Fourier and Kronecker-Eisenstein descriptions, with the interchange of sum and integral justified and with the regularised expression used where the function is singular.

### The elliptic Bloch-Wigner dilogarithm

`EllipticRegulators:ER.3/the-elliptic-dilogarithm` · *definition* · planet **The elliptic dilogarithm**

For a complex elliptic curve written multiplicatively with parameter q the ELLIPTIC DILOGARITHM is the sum over all integer powers of q of the Bloch-Wigner dilogarithm evaluated at the point multiplied by that power. The series converges uniformly on compact sets, the resulting function is smooth away from the origin and continuous there, and it satisfies the distribution relations: the value at a multiple of a point is that multiple times the sum of the values over the preimages. For a curve over the reals with the orientation normalisation of ER.1 the function depends only on the curve and the orientation, and reversing the orientation changes its sign.

**Hypotheses.**

- The parameter has absolute value less than one, which is what makes the orbit sum converge.
- The Bloch-Wigner function is the single-valued version of the dilogarithm; neither pinned library has it, nor the ordinary dilogarithm.
- The function depends on the chosen isomorphism with the multiplicative model; for a curve over the reals the normalisation removes that dependence up to sign.

**Proof outline.**

1. Record the Bloch-Wigner function and its properties from the polylogarithm roadmap, which owns it.
2. Define the orbit sum and prove uniform convergence on compact sets.
3. Prove smoothness away from the origin and continuity at the origin.
4. Prove the distribution relations.
5. Prove the behaviour under inversion and under conjugation, and the dependence on the choice of isomorphism.
6. Record the real normalisation and the sign ambiguity it leaves.

**Acceptance.**

- The series converges uniformly on compact sets.
- The function is smooth away from the origin and continuous at it.
- The distribution relations hold for every non-zero integer.
- For a curve over the reals it is determined by the curve and the orientation, up to sign.

**Prerequisites.** `Polylogarithms:P.1`, `EllipticRegulators:ER.1/the-q-parameter-and-the-multiplicative-presentation`

**API.**

| name | role | statement |
| --- | --- | --- |
| `ellipticDilog` | data | The elliptic dilogarithm of a complex elliptic curve with a chosen parameter. |
| `ellipticDilog_converges` | characterisation | Uniform convergence on compact sets. |
| `ellipticDilog_smooth` | characterisation | Smoothness away from the origin, continuity at it. |
| `ellipticDilog_distribution` | characterisation | The distribution relations. |
| `ellipticDilog_real` | compatibility | For a curve over the reals it depends only on the curve and the orientation. |
| `ellipticDilog_orientation_sign` | relation | Reversing the orientation changes the sign. |

**Used by.**

- *ER.4* — The divisor formula evaluates this function on a divisor.
- *ER.5* — Bloch’s CM theorem expresses an L-value through values of this function.
- *ER.8* — The worked examples are numerical evaluations of it.

**Unit tests.**

- `converges` — The defining series converges uniformly on compact sets.
- `distribution_two` — The distribution relation for doubling holds and is the first non-trivial check.
- `continuity_at_origin` — The function is continuous at the origin, where each term is singular.
- `sign_ambiguity` — The function is defined only up to sign for a real curve; a formalisation that fixed a sign without an orientation would be over-claiming.

**Sources.**

- (1.38), p. 29 of the PDF, The definition with the convergence and the regularity, verbatim.

  > Le dilogarithme elliptique D_{E,φ} associé à E et φ est la fonction définie par D_{E,φ} : E → R, x ↦ ∑_{n ∈ Z} D(x q^n), où nous avons utilisé l'identification (1.37). La série (1.38) définissant D_{E,φ}, vue comme série de fonctions de la variable x ∈ C*, converge uniformément sur tout compact. La fonction D_{E,φ} est de classe C-infini sur E - {0}, et continue en 0.

- (1.42), p. 30 of the PDF, The distribution relations, verbatim.

  > Nous avons encore les relations de distribution D_E(nP) = n ∑_{Q ∈ E_n} D_E(P + Q) (P ∈ E(C), n ∈ Z, n ≠ 0).

### The logarithmic companion and the convention for the complex regulator

`EllipticRegulators:ER.3/the-companion-and-Bloch-convention` · *construction* · planet **The logarithmic companion**

The elliptic dilogarithm has a companion, a regularised logarithmic series whose orbit sum needs a Bernoulli-polynomial correction to converge. Bloch's convention assembles the two into a single complex-valued function whose real part is the companion and whose imaginary part is the dilogarithm. BOTH parts are needed: the regulator formula for a complex embedding is a statement about the complex function, and comparing different real components correctly requires the companion, not only the imaginary part. This node constructs the companion with its regularisation, states the convention, and records that the source's own proof of the regulator formula proves statements about both parts.

**Hypotheses.**

- The companion's naive orbit sum diverges; the correction is by a Bernoulli polynomial in the logarithm of the absolute value, which is what the source's regularisation supplies.
- The convention is that the complex function is the companion plus i times the dilogarithm; the opposite convention changes signs throughout the later layers.
- The uniform estimates on both parts are what allow the truncation and limiting argument of the next node.

**Proof outline.**

1. Define the naive logarithmic orbit sum and show that it diverges.
2. Define the regularised companion with the Bernoulli-polynomial correction and prove convergence.
3. Assemble the complex function and fix the convention.
4. Prove the invariance under multiplication by the parameter, inversion and conjugation for both parts.
5. Record the uniform estimates that the truncation argument uses.
6. Record the non-example: the identity satisfied by the imaginary part alone does not determine the complex function, and a formalisation that built only the dilogarithm could not state the complex regulator formula.

**Acceptance.**

- The naive logarithmic sum diverges and the Bernoulli correction is necessary.
- The complex function is invariant under multiplication by the parameter.
- The imaginary part is the elliptic dilogarithm of the previous node.
- The companion is needed for the complex regulator formula; the imaginary part alone does not suffice.

**Prerequisites.** `EllipticRegulators:ER.3/the-elliptic-dilogarithm`, `Polylogarithms:P.1`

**API.**

| name | role | statement |
| --- | --- | --- |
| `ellipticLogCompanion` | data | The regularised logarithmic companion. |
| `ellipticLogCompanion_converges` | characterisation | Convergence after the Bernoulli correction. |
| `ellipticR` | data | The complex function, the companion plus i times the dilogarithm. |
| `ellipticR_q_invariant` | characterisation | Invariance under multiplication by the parameter. |
| `ellipticR_im` | projection | Its imaginary part is the elliptic dilogarithm. |
| `ellipticR_estimates` | characterisation | The uniform estimates used by the truncation argument. |

**Used by.**

- *ER.4* — The divisor formula is a statement about the complex function.
- *ER.5* — The CM computation uses the complex function and separates the parts at the end.
- *ER.3, the Steinberg relation* — The limiting argument uses the estimates on both parts.

**Unit tests.**

- `naive_diverges` — The unregularised logarithmic sum diverges; the correction is not cosmetic.
- `imaginary_part` — The imaginary part is the elliptic dilogarithm.
- `q_invariance` — The complex function is invariant under multiplication by the parameter.
- `convention` — The convention is companion plus i times dilogarithm; the opposite convention flips signs in every later formula.

**Sources.**

- Proposition 26, p. 31 of the PDF, The dilogarithm as the IMAGINARY part of a complex-valued function, verbatim; the companion of this node is the real part, and the source’s R_ω is the complex function.

  > Soit E une courbe elliptique sur C munie d'un isomorphisme φ : E ≃ C/(Z + βZ). Le dilogarithme elliptique D_{E,φ} s'exprime en fonction de R_E au moyen de la formule D_{E,φ}(P) = 2 Im(R_ω(P, 0)) (P ∈ E), où nous avons posé ω = dz.

### The Steinberg relation for the elliptic function, by truncation and a limit

`EllipticRegulators:ER.3/the-steinberg-relation-by-truncation` · *theorem*

The complex function of the previous node satisfies the relation that makes it descend to the second K-group: on a Steinberg pair the associated combination vanishes. The proof is not a formal consequence of the corresponding identity for the Bloch-Wigner function: it requires truncating the divisors on annuli, uniform estimates on both parts of the function, and a limiting argument as the annuli exhaust the curve. This node records the proof structure the stage text demands, namely that BOTH parts are handled, and records what the source proves about the function that makes the argument work.

**Hypotheses.**

- The functions are non-zero meromorphic on the curve and form a Steinberg pair in the sense of the symbols roadmap.
- The truncation is on annuli in the multiplicative model, which is why the presentation of ER.1 is needed.
- The limiting argument uses the uniform estimates of the previous node on both the companion and the dilogarithm.

**Proof outline.**

1. Record the Steinberg relation for the Bloch-Wigner function from the polylogarithm roadmap.
2. Truncate the divisors on annuli and write the finite approximation to the orbit sums.
3. Prove the uniform estimates on both parts that make the truncation error go to zero.
4. Pass to the limit and obtain the relation.
5. Record the differential property of the complex function, which is what identifies the limit, and its characterisation by that property.
6. Record the non-example the stage text implies: proving the identity for the imaginary part alone does not prove it for the function, and the complex regulator formula needs the function.

**Acceptance.**

- The relation holds for the complex function, not only for its imaginary part.
- The proof needs the truncation and the estimates; it is not formal.
- The differential property characterises the function, which is what makes the limit identifiable.

**Prerequisites.** `EllipticRegulators:ER.3/the-companion-and-Bloch-convention`, `Polylogarithms:P.1`, `K2SymbolsBrauer:T.1`

**Sources.**

- Théorème 29, p. 35 of the PDF, The differential property of the complex function with the uniqueness of the auxiliary form, verbatim; the source also proves that this property characterises the function.

  > Fixons une forme différentielle ω ∈ Ω^{1,0}(X) et un point x ∈ X. La fonction y ↦ R_ω(x, y) est de classe C-infini sur X - {x} et satisfait la propriété différentielle ∂̄_y R_ω(x, y) = i π G_X(x, y) ω_y - α_y (y ∈ X - {x}), où la forme différentielle α ∈ Ω^{1,0}(X) est déterminée de manière unique par la condition ...

### The Fourier and Kronecker-Eisenstein descriptions

`EllipticRegulators:ER.3/fourier-and-kronecker-eisenstein` · *theorem*

The complex function and the dilogarithm have Fourier expansions indexed by the first homology of the curve, and the resulting series are the Kronecker-Eisenstein series in two variables. The expansions are obtained by interchanging a sum and an integral, and the interchange must be justified; where the function is singular the regularised expression of the companion node is used rather than an unproved absolutely convergent double series. These expansions are what turn the CM computation of ER.5 into an identification with a Hecke L-series.

**Hypotheses.**

- The indexing is by the first homology, through the Abel-Jacobi isomorphism of ER.1.
- The interchange of the sum and the integral is justified by the estimates of the companion node; it is not assumed.
- At the singular point the regularised expression is used; the naive double series does not converge absolutely there.

**Proof outline.**

1. Record the Abel-Jacobi identification that indexes the expansions.
2. Compute the Fourier coefficients of the complex function and of the dilogarithm.
3. Justify the interchange of the sum and the integral with the estimates.
4. Identify the resulting series with the Kronecker-Eisenstein series in two variables.
5. Record the regularisation at the singular point and the non-example: the naive absolutely convergent double series does not exist there.
6. Record the use in ER.5, where the identification with the Hecke L-series goes through this expansion.

**Acceptance.**

- The expansions are indexed by the first homology.
- The interchange is justified, not assumed.
- At the singular point the regularised expression is used.
- The series obtained are the Kronecker-Eisenstein series, which is what makes the CM identification possible.

**Prerequisites.** `EllipticRegulators:ER.3/the-companion-and-Bloch-convention`, `EllipticRegulators:ER.1/periods-and-the-comparison-isomorphism`

**Sources.**

- (1.43) and the Fourier discussion, p. 31 of the PDF, The indexing of the Fourier expansions, verbatim.

  > Il est commode et naturel d'indexer les développements de Fourier des fonctions définies sur E par le groupe d'homologie H_1(E, Z). Rappelons que l'application d'Abel-Jacobi H_1(E, Z) → Hom_C(Ω^{1,0}(E), C) induit un isomorphisme d'espaces vectoriels réels H_1(E, R) ≃ Hom_C(Ω^{1,0}(E), C).

## ER.4 — The divisor formula and Bloch's classes

`(f)⋄(g) = Σ mᵢnⱼ [Qⱼ − Pᵢ]` — the convention is fixed **here**, matching
Bloch's multiplicative argument; the opposite one flips every later sign.

The regulator of a symbol is the complex function of ER.3 evaluated on that
divisor, independent of the permitted lifts (degree zero **and** product one).

**Transfer only after the trace formula.** Extending results to a finite
extension needs the trace formula for the regulator, stated here as the required
lemma, with the source's compatibility with finite morphisms as its geometric
half.

Coverage: **source_decomposed**.

Four nodes. The diamond convolution with the sign convention fixed once and the change the opposite convention forces recorded; the divisor formula computing the regulator of a symbol as the complex function evaluated on that convolution, with independence of the permitted lifts under the degree-zero and product-one conditions; the regulator of the corrected classes built from rational torsion, with the constant-symbol corrections contributing zero, the finite Fourier transform in the normalisation the stage text fixes and the invertibility hypothesis kept explicit; and the trace formula, which the stage text makes a precondition for extending anything by transfer, with the source's compatibility with finite morphisms as its geometric half.

### The diamond convolution of two divisors

`EllipticRegulators:ER.4/the-diamond-convolution` · *definition* · planet **The diamond convolution**

For two divisors, written as integer combinations of points, the DIAMOND CONVOLUTION is the divisor whose coefficient at a difference of two points is the product of the coefficients, summed over all pairs giving that difference; the convention used here writes the difference as the second point minus the first, matching the multiplicative argument in Bloch's formula. The opposite convention, with the first minus the second, requires the corresponding sign change in every formula downstream, and this node fixes the choice once. The construction is a bilinear pairing from divisors to divisors supported on the group generated by the differences.

**Hypotheses.**

- The divisors are on a complex elliptic curve; the differences are taken in the group law of the curve.
- The convention is fixed here and used unchanged in ER.5; the packet states the sign change the other convention forces.
- The pairing is bilinear, so it is determined by its values on pairs of points.

**Proof outline.**

1. Define the pairing on pairs of points and extend bilinearly.
2. Prove bilinearity and the behaviour under translation of either argument.
3. Record the convention explicitly and the sign change the opposite one forces.
4. Prove the degree formula: the degree of the convolution is the product of the degrees, so a degree-zero divisor convolved with anything has degree zero.
5. Record the pinned material: divisors of functions and their formal algebra exist for function fields in Tau Ceti; the convolution and the translation to the group law do not.

**Acceptance.**

- The pairing is bilinear.
- The degree of a convolution is the product of the degrees.
- Convolving with the divisor of a point translates the other argument.
- The opposite convention changes the sign of every formula downstream.

**Prerequisites.** `EllipticKTheory:E.2`, `EllipticRegulators:ER.1/complex-uniformisation`

**API.**

| name | role | statement |
| --- | --- | --- |
| `diamond` | data | The convolution of two divisors. |
| `diamond_bilinear` | characterisation | Bilinearity. |
| `diamond_degree` | characterisation | The degree of a convolution is the product of the degrees. |
| `diamond_translate` | compatibility | Convolving with a point translates. |
| `diamond_convention` | relation | The sign convention, with the change the opposite one forces. |

**Used by.**

- *ER.4, the divisor formula* — The formula evaluates the dilogarithm on this divisor.
- *ER.5* — Bloch’s CM computation is an evaluation of the same kind on a torsion divisor.
- *EllipticKTheory E.7* — The certificates there produce the divisors this pairing consumes.

**Unit tests.**

- `bilinear` — The pairing is bilinear.
- `degree_product` — The degree of a convolution is the product of the degrees.
- `two_points` — The convolution of two single points is the single point given by their difference.
- `convention_sign` — The opposite convention gives the negated divisor, and every downstream formula changes sign.

**Sources.**

- §2.1, the construction from torsion points, p. 55 of the PDF, The construction whose regulator the divisor formula computes, verbatim; the convolution of this node is how the divisors of the two functions combine in that computation.

  > Commençons par considérer une courbe elliptique E définie sur C. [Bloch construit des éléments du] groupe de K-théorie algébrique K_2(E) ⊗ Q à partir des points de torsion de E. Plus précisément, il associe à tout point de torsion P ∈ E un élément γ_P ∈ K_2(E) ⊗ Q. Un aspect important de cette construction est que le régulateur de l'élément γ_P est essentiellement donné par le ...

### The regulator of a symbol as the dilogarithm evaluated on the convolution

`EllipticRegulators:ER.4/the-divisor-formula` · *theorem* · planet **The divisor formula**

For two functions on a complex elliptic curve whose symbol has vanishing tame residues, the complex function of ER.3 evaluated on the diamond convolution of their divisors computes the regulator of the symbol. The formula is independent of the permitted lifts of the points to the multiplicative model, provided the lifted divisors satisfy the degree-zero and product-one conditions that make the lift permitted. This is the computational heart of the layer: it turns a transcendental integral into a finite sum of values of an explicit function.

**Hypotheses.**

- The symbol has vanishing tame residues, which is the condition ER.2 needs for the regulator to be the period pairing.
- The lifts are permitted when the lifted divisor has degree zero and the product of its lifted points is one; without both conditions the value changes.
- The formula is an identity of complex numbers at a chosen embedding; the real and imaginary parts separate as in ER.3.

**Proof outline.**

1. State the formula with the convolution and the complex function.
2. Prove it by integrating the form of ER.2 and computing the local contributions at the points of the divisors, using the local behaviour of that node.
3. Prove independence of the permitted lifts, and show by example that dropping either condition breaks it.
4. Record the real specialisation: for a curve over the reals with the normalisation of ER.1 the imaginary part gives the dilogarithm formula that the examples use.
5. Record the source's own form of this statement, which relates its complex function on a difference of points to the regulator, and the resulting identification with the elliptic dilogarithm.

**Acceptance.**

- The formula computes the regulator as a finite sum of values of the function.
- It is independent of the permitted lifts.
- Dropping the degree-zero or the product-one condition changes the value.
- For a real curve the imaginary part gives the dilogarithm formula.

**Prerequisites.** `EllipticRegulators:ER.4/the-diamond-convolution`, `EllipticRegulators:ER.3/the-companion-and-Bloch-convention`, `EllipticRegulators:ER.2/the-regulator-on-symbols`

**Sources.**

- (2.4) and Proposition 26, pp. 31 and 56 of the PDF, The evaluation of the complex function on a difference of points and its relation to the dilogarithm, verbatim; the divisor formula is the bilinear extension of this.

  > Dans le cas elliptique, la fonction R_J définie de manière générale à la section 2.2 coïncide donc avec le dilogarithme elliptique : R_J(P - Q) = R_E(P, Q) (P, Q ∈ E). ... D_{E,φ}(P) = 2 Im(R_ω(P, 0)).

### The regulator of the corrected classes built from torsion

`EllipticRegulators:ER.4/the-regulator-of-the-corrected-classes` · *theorem*

Applying the divisor formula to the corrected classes that the companion roadmap builds from rational torsion points computes their regulator as an explicit finite combination of values of the elliptic dilogarithm at torsion points. The constant-symbol corrections that make those classes have vanishing tame residues contribute ZERO to the regulator, which is why the correction is harmless; and the finite Fourier transform on the torsion subgroup turns the combination into the shape that the CM computation of ER.5 uses. The odd-function identities of the source's later chapter are what make the transform collapse.

**Hypotheses.**

- The torsion points are rational over the field of definition; the non-rational case is handled by transfer in the last node of this layer.
- The classes are the corrected ones, so their tame residues vanish and the divisor formula applies.
- The finite Fourier transform is normalised as the stage text fixes it, with a single factor of the order rather than its square.

**Proof outline.**

1. Apply the divisor formula to the corrected classes and write the resulting combination.
2. Prove that the constant-symbol corrections contribute zero, so that the value depends only on the torsion data.
3. Introduce the finite Fourier transform on the torsion subgroup with the stated normalisation.
4. Prove the odd-function identities that make the transform collapse the combination.
5. Record the hypothesis that the order of the torsion is invertible where the geometric argument needs it, which the stage text asks be kept explicit.
6. Record the resulting formula, which is the input to the CM computation.

**Acceptance.**

- The constant-symbol corrections contribute zero to the regulator.
- The regulator is a finite combination of values of the dilogarithm at torsion points.
- The Fourier normalisation is a single factor of the order, not its square.
- The invertibility hypothesis on the order is explicit and is used.

**Prerequisites.** `EllipticRegulators:ER.4/the-divisor-formula`, `EllipticKTheory:E.7`, `EllipticRegulators:ER.3/the-elliptic-dilogarithm`

**Sources.**

- §2.1, p. 55 of the PDF, The regulator of the classes built from torsion, verbatim, with the density remark that makes the dilogarithm determined by them.

  > Un aspect important de cette construction est que le régulateur de l'élément γ_P est essentiellement donné par le dilogarithme elliptique D_E évalué en P. L'ensemble des points de torsion étant dense dans E, la fonction continue D_E : E → R est caractérisée par [ces valeurs].

### Extension by transfer, only after the trace formula

`EllipticRegulators:ER.4/transfer-and-the-trace-formula` · *comparison*

A class constructed over a finite extension is brought down by the transfer of the companion roadmap, and its regulator downstairs is computed from the regulator upstairs by a TRACE FORMULA: the regulator of a transferred class is the sum of the regulators at the embeddings above the given one. The stage text insists that the extension of the results by transfer is legitimate only after that formula is proved, and this node states it as the required lemma rather than assuming it. The source proves the corresponding compatibility of its function with finite morphisms, which is the geometric half.

**Hypotheses.**

- The extension is finite; the embeddings above a given one are those restricting to it.
- The transfer is the one of the companion roadmap, compatible with residues through the residue-field norms.
- The trace formula is an identity of regulators, not of classes, and it is what makes a computation upstairs usable downstairs.

**Proof outline.**

1. State the trace formula for the regulator.
2. Record the source's compatibility of its function with finite morphisms, which is the geometric input.
3. Prove the formula from that compatibility and from the definition of the transfer.
4. Record the non-example: without the formula a computation over an extension says nothing about the class downstairs, and the stage text forbids the extension in that case.
5. Record the use in ER.5, where the CM class is assembled over a field where the torsion is rational and then descended.

**Acceptance.**

- The regulator of a transferred class is the sum of the regulators at the embeddings above.
- The formula is required before any extension of the results by transfer.
- The source's compatibility with finite morphisms is the geometric half of the proof.

**Prerequisites.** `EllipticRegulators:ER.4/the-regulator-of-the-corrected-classes`, `EllipticKTheory:E.7`

**Sources.**

- §1.4, the behaviour under finite morphisms, p. 24 of the PDF, The compatibility with finite morphisms, verbatim, together with the source’s own note that it had not been written down before.

  > Enfin, dans la section 1.4, nous étudions le comportement de la fonction R_X vis-à-vis des morphismes finis. ... En revanche, la propriété différentielle (1.69) et le comportement vis-à-vis des morphismes finis (1.118) n'avaient à notre connaissance pas encore été écrits.

## ER.5 — The complete CM example of Bloch

CM by the **full** ring of integers of an imaginary quadratic field of class
number one; the Hecke character and Deuring's comparison — **including the bad
primes**, which does not follow from a complex torus having extra endomorphisms.

The class `U` is a *specified* finite combination with a fixed Fourier
normalisation (one factor of `C`, not `C²`), proved to descend.

**The target is an explicit scalar**, not an existential non-zero constant. The
monograph's scan carries no text layer here, so the scalar is recorded from the
roadmap's own transcription and a gap says so.

What is **not** claimed: that `U` spans, or anything for non-maximal orders or
larger class number.

Coverage: **source_decomposed**.

Four nodes. The CM setup with the maximal-order and class-number-one hypotheses, the Hecke character and Deuring's comparison including the local factors at the bad primes, with the non-example that extra endomorphisms do not give the comparison; the class, as a specified finite combination with the Fourier normalisation the stage text fixes and with its descent proved rather than asserted; the L-value theorem itself, stated as an equality with an EXPLICIT scalar, with the proof strategy the stage text prescribes and with an explicit record that the monograph's scan carries no text layer here, so the scalar is taken from the roadmap's own transcription; and the non-vanishing with the three things that are not claimed — spanning, non-maximal orders, larger class number.

### The CM curve, its Hecke character and the comparison of L-functions

`EllipticRegulators:ER.5/the-CM-setup-and-the-hecke-character` · *construction* · planet **The CM Hecke character**

The example is an elliptic curve over the rationals with complex multiplication by the FULL ring of integers of an imaginary quadratic field of class number one. To such a curve the theory of complex multiplication attaches a Hecke character, and Deuring's theorem identifies its L-series with the Hasse-Weil L-function of the curve. That identification requires the conductor and the local Euler factors, including at the bad primes, and it does NOT follow from the observation that a complex torus has extra endomorphisms; this node states the requirement and names the owner of the CM theory.

**Hypotheses.**

- The endomorphism ring is the full ring of integers of an imaginary quadratic field of class number one; an order that is not maximal, or a field of larger class number, needs an additional theorem with its own descent and conductor hypotheses.
- The Hecke character is the one attached by the CM theory, with its conductor; Deuring's comparison is the theorem that its L-series is the curve's.
- The Euler factors at the bad primes are part of the comparison and are not a formality.

**Proof outline.**

1. Record the CM hypothesis precisely and the two ways it can fail, a non-maximal order and a larger class number.
2. Record the construction of the Hecke character from the CM theory, with its conductor, and name the owner.
3. State Deuring's comparison with the Hasse-Weil L-function, including the local factors at the bad primes.
4. Record the non-example: extra endomorphisms of a complex torus do not by themselves give the comparison, because the arithmetic of the conductor is what makes the two Euler products agree.
5. Record the data the next nodes need: the integer that measures the torsion level, the conductor element, its complement, the finite character and the roots of unity.

**Acceptance.**

- The comparison of the two L-functions holds with the conductor and all local factors.
- It does not follow from the existence of extra endomorphisms.
- The class-number-one and maximal-order hypotheses are used and their failure needs another theorem.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.6`, `EllipticCurveModularity:R29.6`, `EllipticRegulators:ER.1/all-embeddings-and-the-conjugation-action`

**API.**

| name | role | statement |
| --- | --- | --- |
| `cmHeckeCharacter` | data | The Hecke character attached to a CM elliptic curve. |
| `cmHeckeCharacter_conductor` | projection | Its conductor. |
| `deuringComparison` | characterisation | The identification of its L-series with the Hasse-Weil L-function. |
| `deuringComparison_badPrimes` | compatibility | Agreement of the local factors at the bad primes. |
| `cm_maximal_order` | relation | The hypothesis that the endomorphism ring is the full ring of integers. |

**Used by.**

- *ER.5, the class U* — The character supplies the weights of the combination.
- *ER.5, the L-value theorem* — The left-hand side of the theorem is the L-function of this character.
- *SpecialValuesBirchTate* — The same comparison is used there for the value at one.

**Unit tests.**

- `bad_primes` — The local factors at the bad primes agree; the comparison is not only away from the conductor.
- `not_from_endomorphisms` — Extra endomorphisms of a complex torus do not give the comparison.
- `maximal_order` — The maximal-order hypothesis is used; a non-maximal order needs another theorem.
- `class_number_one` — The class-number-one hypothesis is used in the descent of the next node.

**Sources.**

- §0.5, p. 12 of the PDF, The theorem this layer formalises and its scope, verbatim: Bloch proved the CM case and the general case is a conjecture.

  > Dans le cas où E est à multiplication complexe, Bloch a montré comment exprimer L(E, 2) comme combinaison linéaire de valeurs de D_E. La généralisation de cet énoncé à toute courbe elliptique est connue sous le nom de conjecture de Zagier pour L(E, 2).

### The rational class U and its descent

`EllipticRegulators:ER.5/the-class-U` · *construction*

The class the theorem evaluates is a specific finite combination of the corrected torsion classes of ER.4, indexed by a quotient of ray classes and weighted by the finite character of the CM datum; it is constructed over a field where the relevant torsion is rational and is then shown to descend to the curve over the rationals. Both halves are part of the construction: the combination is specified exactly, with the normalisation of the finite Fourier transform fixed as a single factor of the level, and the descent is proved rather than asserted. The result is a class in the rationalised second K-group of the curve over the rationals.

**Hypotheses.**

- The torsion level is the integer of the previous node, factored as the conductor element times its complement.
- The finite Fourier transform is normalised with a single factor of the level and with the kernel the stage text fixes; it is not the ordinary average with the square of the level.
- The descent is to the curve over the rationals and uses the invariance of the combination under the relevant Galois action.

**Proof outline.**

1. Record the indexing set and the weights, with the character extended as the source does.
2. Define the combination of the corrected classes.
3. Prove the invariance of the combination under the Galois action and deduce the descent, using the transfer and the trace formula of ER.4.
4. Record the normalisation of the finite Fourier transform explicitly, with the stage text's kernel.
5. Record that the class lies in the rationalised group and that no integral statement is made about it here; ER.6 is where integrality is discussed.

**Acceptance.**

- The class is a specified finite combination, not an existential one.
- It descends to the curve over the rationals.
- The Fourier normalisation is a single factor of the level.
- No integrality claim is made about it in this layer.

**Prerequisites.** `EllipticRegulators:ER.4/the-regulator-of-the-corrected-classes`, `EllipticRegulators:ER.4/transfer-and-the-trace-formula`, `EllipticRegulators:ER.5/the-CM-setup-and-the-hecke-character`, `EllipticKTheory:E.7`

**API.**

| name | role | statement |
| --- | --- | --- |
| `blochClassU` | data | The specified combination of corrected torsion classes. |
| `blochClassU_descends` | characterisation | Its descent to the curve over the rationals. |
| `finiteFourier` | data | The finite Fourier transform on the torsion subgroup, with the fixed normalisation. |
| `finiteFourier_normalisation` | relation | The normalisation is a single factor of the level, not its square. |
| `blochClassU_rational` | relation | The class lies in the rationalised group; no integrality is claimed. |

**Used by.**

- *ER.5, the L-value theorem* — The theorem evaluates the regulator of this class.
- *ER.8* — The second worked example exhibits its certificate.
- *ER.6* — The integrality question for this class is the subject of the vertical-step node.

**Unit tests.**

- `descends` — The class descends to the curve over the rationals.
- `fourier_normalisation` — The transform uses a single factor of the level; the ordinary average would change the scalar in the theorem.
- `finite_combination` — The class is a specified finite combination, not an existential one.
- `no_integrality` — No integrality is claimed here; that is the subject of ER.6.

**Sources.**

- §2.1, the construction from torsion, p. 55 of the PDF, The building blocks of the combination, verbatim; the specific combination and its weights are Bloch’s and are recorded from the roadmap’s own transcription, since the monograph’s scan carries no text layer.

  > il associe à tout point de torsion P ∈ E un élément γ_P ∈ K_2(E) ⊗ Q

### Bloch's theorem: the L-value as an explicit multiple of the regulator

`EllipticRegulators:ER.5/the-L-value-theorem` · *theorem* · planet **Bloch's CM L-value theorem**

The theorem states an EQUALITY between the value at two of the L-function of the Hecke character and an explicit scalar times the regulator of the class of the previous node. The scalar is an explicit expression in the constructed quantities — a power of pi, the order of a group of roots of unity, the Fourier transform of the character at the conjugate conductor element, that element itself, the imaginary part of the period ratio and a power of the level — and the target of this layer is that explicit equality. An existential unspecified non-zero constant is NOT the target, and the stage text says so. This packet records the transcription of the formula that the roadmap itself supplies from the monograph's scan, and records that the scan carries no text layer, so the transcription was not re-read here.

**Hypotheses.**

- The setup is that of the two previous nodes, with the parameter and the regulator conventions of ER.1 and ER.3.
- The scalar is as the roadmap transcribes it from the monograph; this packet does not re-derive it and does not re-read the scan.
- The formula is an identity of real or complex numbers at the relevant embedding, with the normalisation factor of ER.2 fixed independently.

**Proof outline.**

1. State the theorem with the explicit scalar, in the form the roadmap transcribes.
2. Record the proof strategy the stage text prescribes: evaluate the regulator of the class through the finite Fourier identity of ER.4, identify the resulting Kronecker-Eisenstein series of ER.3 with the Hecke L-series, and account for every period, conductor, Gauss-sum and root-of-unity factor.
3. Record the requirement that each factor be accounted for rather than absorbed into an unspecified constant.
4. Record the state of the source: the monograph's scan has no text layer in this environment, so the formula is taken from the roadmap's own transcription, which its text says was visually checked at the printed pages it names.
5. Record the independent-verification requirement the stage text imposes before a final signature is fixed.

**Acceptance.**

- The statement is an equality with an explicit scalar.
- An existential non-zero constant is not the target.
- Every period, conductor, Gauss-sum and root-of-unity factor is accounted for.
- The scalar depends on the conventions of ER.1, ER.2 and ER.3, and changing any of them changes it in a computable way.

**Prerequisites.** `EllipticRegulators:ER.5/the-class-U`, `EllipticRegulators:ER.3/fourier-and-kronecker-eisenstein`, `EllipticRegulators:ER.2/the-normalisation-factor`

**Sources.**

- §0.5, p. 12 of the PDF, The shape of the theorem, verbatim, from a source that can be read; the explicit scalar is in the monograph, whose scan has no text layer here, and the packet records the roadmap’s transcription rather than a reading of its own.

  > Dans le cas où E est à multiplication complexe, Bloch a montré comment exprimer L(E, 2) comme combinaison linéaire de valeurs de D_E.

### Non-vanishing of the class, and what the theorem does not say

`EllipticRegulators:ER.5/nonvanishing-and-what-is-not-claimed` · *comparison*

Since the L-series has an Euler product that converges absolutely at the point in question, the value there is non-zero; with the theorem this gives that the class is non-zero in the rationalised second K-group. That is the whole of what is proved. The theorem does NOT say that the class spans the rationalised group — the source presents that as a conjecture and this packet keeps it separate — and it does not extend to non-maximal CM orders or to imaginary quadratic fields of larger class number without an additional theorem carrying its own descent and conductor hypotheses.

**Hypotheses.**

- The Euler product converges absolutely at the point because the Hecke character has the relevant weight, which is where the convergence argument lives.
- The non-vanishing of the class is a consequence of the theorem and the non-vanishing of the L-value, not an independent statement.
- The spanning assertion is a conjecture in the source and is recorded as one.

**Proof outline.**

1. Prove the non-vanishing of the L-value from the absolutely convergent Euler product.
2. Deduce the non-vanishing of the class.
3. State the spanning assertion and record that the source presents it as a conjecture.
4. State the two extensions that need additional theorems, to non-maximal orders and to larger class number, with the hypotheses each would require.
5. Record the dependence of the whole layer on the general machinery: the source's own argument rests on Borel's theorem, on group cohomology and on the regulator construction, and none of those may be left as an implicit assumption.

**Acceptance.**

- The L-value is non-zero and hence the class is non-zero.
- The class is not claimed to span the rationalised group.
- The extensions to other CM orders and to larger class number are not claimed.
- The inputs from the general theory are named, not assumed.

**Prerequisites.** `EllipticRegulators:ER.5/the-L-value-theorem`, `BorelRegulators:R.3`

**Sources.**

- §0.5, p. 12 of the PDF, The scope, verbatim: beyond the CM case the statement is a conjecture, which is exactly what this node keeps separate.

  > La généralisation de cet énoncé à toute courbe elliptique est connue sous le nom de conjecture de Zagier pour L(E, 2).

## ER.6 — Integral parts and the Beilinson statement

**Three conclusions that are not the same:**

1. a constructed class has non-zero regulator — ER.5;
2. a constructed subspace has the expected determinant relation — ER.7;
3. the regulator on the **whole** integral part is an isomorphism — the
   conjecture, proved nowhere here.

The first two do not imply the third.

**And unramified is not integral.** Vanishing tame residues on the generic fibre
say nothing about the vertical residues on a model; a claim matching an integral
formulation must include that step.

Coverage: **source_decomposed**.

Four nodes. The restriction of the regulator to the integral part, with the observation that finite-dimensionality of the source is not part of that definition; the Beilinson statement in both formulations with their equivalence through the conductor and gamma factors and with the functional equation named as an input; the node the stage text asks for by name, keeping the three conclusions apart and stating which two do not imply the third and what would close the gap; and the vertical step, which states that unramifiedness on the generic fibre is not integrality on a model and gives the honest weaker statement for the classes this roadmap constructs.

### Restricting the regulator to the integral part

`EllipticRegulators:ER.6/the-regulator-on-the-integral-part` · *construction*

The Beilinson statement is about the regulator restricted to the INTEGRAL PART of the companion roadmap, that is the image of the K-theory of a regular proper model, and not about the whole rationalised second K-group of the curve. This node makes the restriction, records that it is a map of finite-dimensional real vector spaces once the integral part is known to be finite-dimensional, and records that finite-dimensionality is itself a statement that must come from somewhere: the companion roadmap's definition does not provide it.

**Hypotheses.**

- The integral part is the one of the companion roadmap, defined as an image and carrying no lattice property by definition.
- The regulator is the one of ER.2, with the normalisation of that layer fixed.
- Finite-dimensionality of the integral part is not part of its definition and must be imported or proved.

**Proof outline.**

1. Restrict the regulator to the integral part and record the resulting map.
2. Record that the source of finite-dimensionality is a separate statement, and name where it would come from.
3. Record the target and its dimension from ER.2.
4. State the rank question that the Beilinson statement answers, so that the next node has a precise subject.

**Acceptance.**

- The restriction is well defined.
- Finite-dimensionality of the source is not automatic and is flagged.
- The target has the dimension computed in ER.2.

**Prerequisites.** `EllipticKTheory:E.6`, `EllipticRegulators:ER.2/the-deligne-cohomology-target`, `EllipticRegulators:ER.2/the-regulator-on-symbols`

**API.**

| name | role | statement |
| --- | --- | --- |
| `regulatorOnIntegralPart` | data | The regulator restricted to the integral part. |
| `regulatorOnIntegralPart_wellDefined` | characterisation | Well-definedness of the restriction. |
| `integralPart_finiteDimensional` | relation | Finite-dimensionality, which is NOT part of the definition and must be imported. |
| `regulatorTarget_dim` | relation | The dimension of the target, computed in ER.2. |
| `rankQuestion` | relation | The rank question the Beilinson statement answers. |

**Used by.**

- *ER.6, the Beilinson statement* — The statement is about this restricted map.
- *ER.6, the three conclusions* — The third conclusion is a statement about this map being an isomorphism.
- *ER.8* — The integrality example decides whether a given class is in the source of this map.

**Unit tests.**

- `well_defined` — The restriction is well defined.
- `finite_dimension_not_free` — Finite-dimensionality of the source does not follow from the definition of the integral part.
- `target_dimension` — The target has the dimension computed in ER.2.
- `source_is_not_whole` — The integral part is a proper subspace in general.

**Sources.**

- §1.1, the localisation inclusion, p. 27 of the PDF, The inclusion that lets the regulator be evaluated on algebraic K-theory classes, verbatim; the integral part is a further subspace of the left-hand side.

  > La localisation en K-théorie algébrique induit une inclusion K^{(2)}_2(X_Q) ↪ K_2(Q(X)) ⊗ Q

### The elliptic Beilinson conjecture, in two equivalent formulations

`EllipticRegulators:ER.6/the-beilinson-statement` · *comparison*

The conjecture says that the regulator on the integral part is an isomorphism onto the real Deligne cohomology after extension of scalars, and that it carries the rational structure coming from K-theory to the period-normalised leading term of the L-function at zero; equivalently, after the functional equation, to the value at two up to the same rational factor. The two formulations are equivalent, and the equivalence involves the conductor and the gamma factors, so it is a statement to be proved and not a change of notation. This node states both and the equivalence.

**Hypotheses.**

- The curve is over a number field; the leading term is at the point the motive's weight dictates, and the value at two is its counterpart after the functional equation.
- The functional equation is an input: it is proved for a modular elliptic curve and is not available in general.
- The rational structure is the one coming from the K-theory of the model, which is why the integral part of the previous node is the subject.

**Proof outline.**

1. State the leading-term formulation with the determinant line and the period normalisation.
2. State the value-at-two formulation.
3. Prove the equivalence, tracking the conductor and the gamma factors.
4. Record that the functional equation is an input and name where it comes from.
5. Record that the conjecture is a conjecture: this packet states it and proves nothing about it beyond the equivalence.

**Acceptance.**

- The two formulations are equivalent, with the conductor and gamma factors accounted for.
- The functional equation is an input, available for a modular curve.
- Nothing about the conjecture itself is proved here.

**Prerequisites.** `EllipticRegulators:ER.6/the-regulator-on-the-integral-part`, `EllipticCurveModularity:R29.5`, `DirichletPadicLFunctions:L0`

**Sources.**

- §0.5, p. 12 of the PDF, The shape of the consequence the conjecture and the known results give, verbatim.

  > les résultats de Bloch et Beilinson entraînent l'existence d'un nombre rationnel c ∈ Q, de points P_1, ..., P_k ∈ E(...)

### Three conclusions that must not be conflated

`EllipticRegulators:ER.6/three-conclusions-that-are-not-the-same` · *comparison*

There are three logically different statements in this area and the stage text insists they be kept apart. First: a constructed class has non-zero regulator — that is ER.5's theorem. Second: a constructed rational subspace has the expected determinant relation to the L-value. Third: the regulator on the WHOLE integral part has the predicted rank and is an isomorphism after extension of scalars — that is the conjecture. The first two do not imply the third: they say nothing about classes outside the constructed subspace, and the passage needs a separate dimension or injectivity theorem. This node states the three and the two implications that fail.

**Hypotheses.**

- The three statements are about the same regulator and the same target, which is why they are easy to conflate.
- The failure of the implication is not a gap in a proof: it is that the constructed subspace may be smaller than the integral part.
- A dimension theorem, or an injectivity theorem on the complement, is what would close the gap.

**Proof outline.**

1. State the three conclusions precisely.
2. State the two implications that do not hold and why.
3. Record what would close each: a dimension count for the integral part, or an injectivity statement.
4. Record where each of the three appears in this roadmap: the first in ER.5, the second in ER.7 for modular curves, the third nowhere as a theorem.
5. State the rule: a statement in the atlas that the conjecture holds for a curve must cite a theorem of the third kind, and none of the constructions here provides one.

**Acceptance.**

- The first two conclusions do not imply the third.
- This roadmap proves conclusions of the first and second kinds only.
- A claim of the third kind must cite a separate dimension or injectivity theorem.

**Prerequisites.** `EllipticRegulators:ER.6/the-beilinson-statement`, `EllipticRegulators:ER.5/nonvanishing-and-what-is-not-claimed`

**Sources.**

- Théorème 5, p. 11 of the PDF, A statement of the SECOND kind, verbatim: a constructed subspace generates the target for the modular curve of prime level. The source states it as a theorem about that subspace, not about the whole K-group, which is exactly the distinction this node draws.

  > Pour tout nombre premier p, l'espace vectoriel réel V_p est engendré par r_p(K_p).

### Unramifiedness on the generic fibre is not integrality

`EllipticRegulators:ER.6/the-vertical-step-that-is-required` · *comparison*

A class whose tame residues on the curve vanish is unramified on the generic fibre. That is NOT the same as lying in the integral part of the companion roadmap, which is an image out of the K-theory of a regular proper model; the difference is the vertical conditions at the components of the special fibres. So a construction that produces unramified classes has not thereby produced integral ones, and a claim to match an INTEGRAL formulation of the conjecture must include the vertical step. Where the vertical step is not available, the honest statement is the weaker rational one, and this node says what that is.

**Hypotheses.**

- The model is a regular proper model as in the companion roadmap; the vertical conditions are its vertical residues.
- The classes in question are the ones ER.4 and ER.5 construct, which are unramified by construction.
- The weaker statement is about the rationalised group with no integrality assertion, and it is what ER.5 proves.

**Proof outline.**

1. State the difference between unramifiedness and integrality, with the vertical conditions named.
2. State what a proof of integrality for the constructed classes would require.
3. State the weaker rational statement that is actually established, so that it can be quoted without over-claiming.
4. Record the non-example: a class with vanishing tame residues but non-trivial vertical residue at a bad fibre is unramified and not integral.
5. Record the consequence for the atlas: any statement matching an integral formulation must cite the vertical step.

**Acceptance.**

- Unramified does not imply integral.
- The constructed classes are unramified by construction; their integrality is a separate question.
- The weaker rational statement is what ER.5 proves and is what may be quoted.

**Prerequisites.** `EllipticRegulators:ER.6/three-conclusions-that-are-not-the-same`, `EllipticKTheory:E.6`, `EllipticRegulators:ER.5/the-L-value-theorem`

**Sources.**

- §1.1, the localisation inclusion, p. 27 of the PDF, The inclusion whose image is the unramified part; the integral part is a further subspace cut out by conditions on a model, which this source does not treat.

  > La localisation en K-théorie algébrique induit une inclusion K^{(2)}_2(X_Q) ↪ K_2(Q(X)) ⊗ Q

## ER.7 — General modular elliptic curves

Modular units, their cuspidal divisors, Manin–Drinfeld, and the source's
proposition that `{u_χ, u_χ'}` lies in `K₂` of the **complete** modular curve.
Then the Rankin–Selberg evaluation, in the source's explicit finite-level form.

**Modularity is a dependency.** The parametrisation and the modularity theorem
are inputs; the theorem is stated conditionally on a supplied parametrisation
first. The source names the two imprecisions in the classical argument — the
unspecified auxiliary character and the inexplicit parametrisation — and removes
them by taking `N' = N`.

Coverage: **source_decomposed**.

Four nodes. Modular units with their cuspidal divisors, the Manin-Drinfeld relation and the source's proposition that the symbol of two units attached to even non-trivial characters lies in the K-theory of the COMPLETE modular curve; the regulator integral and its Rankin-Selberg evaluation, in the source's explicit finite-level form with the level, the Euler totient and the Gauss sum, together with the relaxations the source records and the existence of a character with non-vanishing twisted value; the explicit elliptic specialisation, with the coefficients independent of the curve and with modularity named as an input; and the pushforward node, which records the source's own account of the two imprecisions in the classical argument, states the conditional theorem first and the unconditional one only by importing modularity, and carries the stage text's warning that the phrase about Beilinson's theorem is not a proof of an unrestricted rank statement.

### Modular units, their divisors at the cusps and the Manin-Drinfeld relation

`EllipticRegulators:ER.7/modular-units-and-their-divisors` · *construction* · planet **Modular units**

On a modular curve of level N the MODULAR UNITS are the invertible functions on the open modular curve; their divisors are supported on the cusps, and the Manin-Drinfeld theorem says that a degree-zero divisor supported on the cusps is torsion in the Picard group, which is what makes the units exist in the required abundance. For each even Dirichlet character modulo N the source constructs a specific unit whose logarithm of absolute value is an explicit Eisenstein-type series, and the symbols of two such units are shown to lie in the second K-theory of the complete modular curve, not merely of the open one. This node builds the units, their divisors and that membership.

**Hypotheses.**

- The level is N and the characters are even; the units are constructed with complex coefficients, which is enough for the regulator computation.
- The Manin-Drinfeld statement is over the rationals and is an input from the modular-curves roadmap.
- The membership in the K-theory of the complete curve is the statement that the tame residues at the cusps cancel, which the source proves.

**Proof outline.**

1. Record the modular curve and its cusps, and name the supplier.
2. Record the Manin-Drinfeld relation and its role.
3. Construct the unit attached to an even character and compute its divisor at the cusps.
4. Prove that the symbol of two such units has vanishing tame residues, so that it lies in the second K-theory of the complete curve.
5. Record the source's statement of exactly this, which it gives as a proposition.

**Acceptance.**

- The divisor of a modular unit is supported on the cusps.
- A degree-zero divisor on the cusps is torsion in the Picard group.
- The symbol of two units attached to even non-trivial characters lies in the K-theory of the complete curve.

**Prerequisites.** `ModularCurvesPartII:R14.6`, `EllipticKTheory:E.3`, `EllipticRegulators:ER.2/the-regulator-on-symbols`

**API.**

| name | role | statement |
| --- | --- | --- |
| `modularUnit` | data | The unit attached to an even Dirichlet character. |
| `modularUnit_divisor` | characterisation | Its divisor, supported on the cusps. |
| `maninDrinfeld` | characterisation | Degree-zero cuspidal divisors are torsion. |
| `modularSymbol_mem_K2` | characterisation | The symbol of two units lies in the K-theory of the complete curve. |
| `modularUnit_logabs` | characterisation | The explicit formula for the logarithm of its absolute value. |

**Used by.**

- *ER.7, the regulator integral* — The integral is computed on these symbols.
- *ER.7, the pushforward* — The class pushed to the elliptic curve is the image of one of these.
- *ER.8* — The worked examples evaluate these symbols numerically.

**Unit tests.**

- `divisor_on_cusps` — The divisor is supported on the cusps.
- `tame_residues_vanish` — The symbol of two units has vanishing tame residues.
- `trivial_character` — For the trivial character the construction degenerates; the hypothesis that the character is non-trivial is used.
- `manin_drinfeld_needed` — Without the Manin-Drinfeld relation the units need not exist in the required abundance.

**Sources.**

- Proposition, p. 11 of the PDF, The membership in the K-theory of the complete modular curve, verbatim.

  > Pour tous caractères χ, χ' modulo N, pairs et non triviaux, l'élément {u_χ, u_χ'} appartient à K_2(X_1(N))_C ⊂ K_2(Q(X_1(N)))_C.

### The regulator integral and its Rankin-Selberg evaluation

`EllipticRegulators:ER.7/the-regulator-integral-and-its-evaluation` · *theorem* · planet **The Rankin-Selberg evaluation**

The regulator of a symbol of two modular units, paired against the differential of a weight-two newform, is an integral over the modular curve of a product of an Eisenstein-type series against the form; evaluating it is a Rankin-Selberg computation. The result is the source's explicit theorem: the product of the value at two of the L-function of the form and the value at one of its twist by an even character equals an explicit constant, involving the level, the Euler totient and the Gauss sum of the character, times the regulator of the symbol of the two units attached to the character and its conjugate. This is the finite-level statement the layer needs, with the level and character generality the source proves.

**Hypotheses.**

- The form is a primitive cusp form of weight two for the congruence subgroup of level N with its character.
- The character is even, distinct from the form's character and primitive; the source records that primitivity is not essential and that a level dividing N also works.
- The Gauss sum and the Euler totient are those of the character and the level; the constant is explicit and is part of the statement.

**Proof outline.**

1. Write the regulator integral against the form's differential.
2. Record the Eisenstein-type description of the logarithm of the absolute value of a modular unit.
3. Carry out the Rankin-Selberg evaluation, which is the source's chapter three computation.
4. State the resulting theorem with its explicit constant.
5. Record the two relaxations the source notes, on primitivity and on the level of the character.
6. Record the non-vanishing statement the source proves, that an even character with non-vanishing twisted value at one exists, which is what makes the theorem usable.

**Acceptance.**

- The theorem is an explicit identity with a named constant, not a proportionality up to an unspecified factor.
- An even character with non-vanishing twisted L-value at one exists.
- The primitivity hypothesis can be relaxed.
- The identity is at finite level and does not require passing to a larger level, which is the source's improvement on the classical argument.

**Prerequisites.** `EllipticRegulators:ER.7/modular-units-and-their-divisors`, `EllipticRegulators:ER.2/the-regulator-on-symbols`, `ModularSymbolsPadicLFunctions:L1`

**Sources.**

- Théorème 4, p. 11 of the PDF, The explicit finite-level theorem, verbatim.

  > Soit f une forme parabolique primitive de poids 2 pour Γ_1(N), de caractère ε. Pour tout caractère de Dirichlet χ modulo N, pair, distinct de ε et primitif, nous avons L(f, 2) L(f, χ, 1) = (N i / φ(N)) β(χ) r_N({u_χ, u_{εχ}}, f).

- Remarques after Théorème 4, p. 11 of the PDF, The relaxations and the non-vanishing, verbatim.

  > L'hypothèse χ primitif n'est pas essentielle. On a une formule analogue sans cette hypothèse. De même, on peut prendre χ de niveau m divisant N. ... D'après les résultats de l'appendice, il existe un caractère pair χ modulo N tel que L(f, χ, 1) ≠ 0.

### The explicit statement for an elliptic curve over the rationals

`EllipticRegulators:ER.7/the-explicit-theorem-for-an-elliptic-curve` · *theorem* · planet **The explicit elliptic formula**

Specialising to the newform of an elliptic curve over the rationals of prime level gives an explicit formula for the product of the value at two of the curve's L-function and the value at one of its twist by an even non-trivial character, in terms of a sum of integrals of explicit differential forms along geodesics, with coefficients built from Gauss sums. Combining it with a second identity, which uses the residue at two of the Rankin-Selberg convolution of the curve with itself, gives the value at two itself as an explicit expression in the twisted values at one. The source's proof uses the modularity of elliptic curves over the rationals, which is an input and not a consequence.

**Hypotheses.**

- The level is prime in the displayed form; the source records that the hypothesis is not essential and that a general level is handled by the appendix's theorem.
- The proof uses the Rankin-Selberg method and hence the modularity of the curve, which the modularity roadmap owns.
- The coefficients depend only on the characters and the level, not on the curve, which the source notes.

**Proof outline.**

1. State the first theorem for a prime level, with the coefficients and the geodesic integrals.
2. State the second, which extracts the value at two through the residue of the convolution.
3. Record that the coefficients do not depend on the curve.
4. Record the modularity input and name its owner.
5. Record the generalisation to arbitrary level and the relaxation of the primitivity hypothesis.
6. Record what these theorems do NOT give: they are statements of the second kind in the classification of ER.6, about a constructed subspace, and they do not establish the conjecture.

**Acceptance.**

- The formula is explicit, with coefficients independent of the curve.
- Modularity is an input, not a consequence of defining a weight-two newform.
- The prime-level hypothesis can be removed.
- The theorems are of the second kind and do not establish the conjecture.

**Prerequisites.** `EllipticRegulators:ER.7/the-regulator-integral-and-its-evaluation`, `EllipticCurveModularity:R29.5`, `EllipticRegulators:ER.6/three-conclusions-that-are-not-the-same`

**Sources.**

- Théorème 1, p. 8 of the PDF, The explicit elliptic statement, verbatim.

  > Supposons N = p premier. Pour tout caractère de Dirichlet χ modulo p, pair et non trivial, nous avons la formule L(E, 2) L(E, χ, 1) = (p w(E) β(χ) / (8 i (p-1))) ∑_{χ'} c_{χ,χ'} L(E, χ', 1), où la somme est étendue aux caractères χ' modulo p, pairs et non triviaux.

- Remarques after Théorème 1, p. 8 of the PDF, The modularity input, the independence of the coefficients from the curve and the relaxation of the level hypothesis, verbatim.

  > La démonstration du théorème 1 s'inspire de la méthode de Rankin-Selberg, déjà utilisée par Beilinson. Elle utilise donc la modularité des courbes elliptiques sur Q. ... Les coefficients c_{χ,χ'} ne dépendent que de χ, χ' et p (et pas de E). ... L'hypothèse N premier n'est pas essentielle.

### Pushing forward along a modular parametrisation, and what that needs

`EllipticRegulators:ER.7/the-pushforward-and-its-hypotheses` · *comparison*

To turn a class on the modular curve into a class on the elliptic curve one pushes forward along a modular parametrisation. That parametrisation is a DEPENDENCY: the scheme-theoretic and analytic comparison for modular curves, the parametrisation itself and the modularity theorem are inputs, not consequences of having a weight-two newform. The right order of work is to prove the theorem conditionally on a supplied parametrisation and a verified newform correspondence, and to remove the hypothesis for curves over the rationals only by importing a proved modularity theorem. The source's own account of the classical argument names two imprecisions that this ordering removes.

**Hypotheses.**

- The parametrisation is a non-constant morphism from the modular curve to the elliptic curve defined over the rationals, compatible with the newform.
- The conditional statement quantifies over a supplied parametrisation; the unconditional one for curves over the rationals imports modularity.
- The conductor, the oldform projections, the cuspidal boundary and the rationality and descent calculations are part of the work, not side conditions.

**Proof outline.**

1. State the conditional theorem, with the parametrisation as a hypothesis.
2. Record the two imprecisions the source identifies in the classical argument: the choice of the auxiliary character and level is not specified, and the parametrisation is not explicit, so the trace map is not either.
3. Record the source's improvement, that the auxiliary level can be taken equal to the level and the character among those of level dividing it.
4. State the unconditional version for curves over the rationals and name the modularity import.
5. Record the non-example the stage text names: the phrase that Beilinson proved the conjecture for modular curves is not a proof of an unrestricted rank statement for elliptic second K-groups.

**Acceptance.**

- The conditional theorem needs a supplied parametrisation and a verified newform correspondence.
- The unconditional version for curves over the rationals imports modularity.
- The classical argument's two imprecisions are removed by taking the auxiliary level equal to the level.
- No unrestricted rank statement follows.

**Prerequisites.** `EllipticRegulators:ER.7/the-explicit-theorem-for-an-elliptic-curve`, `EllipticCurveModularity:R29.5`, `ModularCurvesPartII:R14.6`

**Sources.**

- §0.3, p. 10 of the PDF, The two imprecisions and the source’s improvement, verbatim.

  > La méthode de Beilinson souffre de deux imprécisions : le choix du caractère χ, et donc de l'entier N', n'est pas précisé ; la paramétrisation modulaire X_1(N) → E n'est pas explicite. Il en va donc de même de la trace K^{(2)}_2(X_1(N)) → K^{(2)}_2(E). Nous reprenons la méthode de Beilinson et montrons qu'il est possible de choisir N' = N et χ parmi les caractères de niveau divisant N.

## ER.8 — p-adic comparison and worked examples

The syntomic side is stated with its owner and its prerequisites, and is
**separated** from ER.5: that theorem is about the real regulator and introduces
no p-adic conjecture.

Four required examples: a `P¹` normalisation check (isolating ER.2's factor), the
CM class with its certificates, a non-rational torsion computation exercising the
residue-field norms and ER.4's trace formula, and an integrality test at a bad
fibre. **A numerical approximation may accompany a proof but cannot replace a
divisor, tame-symbol or L-series identity.**

Coverage: **source_decomposed**.

Four nodes. The syntomic comparison, with its owner named, its prerequisites listed and the separation from ER.5 stated explicitly; and the three remaining required examples, the normalisation check on the projective line which isolates the factor of ER.2, the CM class with its certificates together with a non-rational torsion computation that exercises the residue-field norms and the trace formula, and the integrality test at a bad fibre whose two possible outcomes are both recorded as honest. The rule that a numerical approximation may accompany but not replace a divisor, tame-symbol or L-series identity is stated in the nodes that would be tempted by it.

### The p-adic side: syntomic regulator and p-adic integrals

`EllipticRegulators:ER.8/the-syntomic-comparison` · *comparison*

For a curve with good reduction at a prime the syntomic regulator is the p-adic analogue of the map of ER.2, and on a symbol it is computed by explicit p-adic elliptic integrals. The associated p-adic Beilinson statement may be made only AFTER its p-adic L-function, its periods and its exceptional factors have been defined; and it is not part of the proof of the CM theorem of ER.5, which is a statement about the real regulator and introduces no p-adic conjecture. This node states the comparison, names its owner and states the separation the stage text requires.

**Hypotheses.**

- The reduction is good at the prime in question, which is the case the syntomic theory of the p-adic Hodge roadmap covers.
- The p-adic L-function, the periods and the exceptional factors are inputs and must be defined before the statement is made.
- The separation from ER.5 is a statement about the logical structure of the roadmap: no p-adic object appears in that theorem or its proof.

**Proof outline.**

1. Record the syntomic regulator and name its owner.
2. Record the explicit computation on a symbol by p-adic elliptic integrals.
3. State the p-adic conjecture's prerequisites and record that they are inputs.
4. State the separation: ER.5 is a real-regulator theorem, and no p-adic statement is used in it or follows from it.
5. Record the comparison between the two regulators where both are defined, and that it is a theorem of the p-adic Hodge roadmap.

**Acceptance.**

- The syntomic regulator is computed by explicit p-adic integrals on symbols.
- The p-adic conjecture may be stated only after its ingredients are defined.
- ER.5's theorem is independent of the p-adic theory.

**Prerequisites.** `EllipticRegulators:ER.2/the-regulator-on-symbols`, `PadicHodgeRegulators:D.5`, `DirichletPadicLFunctions:L0`

**Sources.**

- §1.1, the regulator definition, p. 26 of the PDF, The complex regulator, verbatim; the syntomic one is its p-adic analogue and is owned by the p-adic Hodge roadmap, which this node cites rather than building.

  > L'application régulateur r_X associée à X est définie par r_X : K_2(C(X)) → Hom_C(Ω^{1,0}(X), C)

### The first worked example: a normalisation check on the projective line

`EllipticRegulators:ER.8/the-normalisation-example` · *comparison*

The first required example is a normalisation check: compute the regulator of an explicit symbol on the projective line, where the answer is a value of the ordinary Bloch-Wigner function, and check it against the normalisation fixed in ER.2. The example tests the factor and the orientation, and it is the only one of the four required examples that does not involve an elliptic curve. If it fails, every later number is wrong by the same factor, which is exactly why the stage text puts it first.

**Hypotheses.**

- The curve is the projective line over the rationals; the symbol is of two explicit rational functions with vanishing tame residues.
- The expected value is an explicit rational multiple of a value of the Bloch-Wigner function, which the polylogarithm roadmap owns.
- The check is against the normalisation of ER.2, not against a value chosen to make it work.

**Proof outline.**

1. Choose the symbol and verify that its tame residues vanish.
2. Compute the regulator by the formula of ER.2.
3. Compare with the expected value and read off the factor.
4. Record that a mismatch indicates an error in the normalisation of ER.2, not in the example.
5. Record that this example uses no elliptic geometry and so isolates the normalisation.

**Acceptance.**

- The computed value matches the expected one with the normalisation of ER.2.
- The example isolates the normalisation factor.
- A numerical approximation is not a proof here; the identity is exact.

**Prerequisites.** `EllipticRegulators:ER.2/the-normalisation-factor`, `Polylogarithms:P.1`

**Sources.**

- §1.1, the regulator, p. 26 of the PDF, The formula the example evaluates, verbatim.

  > {f, g} ↦ (ω ↦ ∫_X log|f| ω ∧ d^c log|g|)

### The second and third worked examples: the CM class and a non-rational residue

`EllipticRegulators:ER.8/the-CM-worked-example` · *comparison*

The second required example is the CM class of ER.5 with its exact divisor and residue certificates: the divisors of the functions involved, the local leading units, and the verification that every tame residue vanishes, in the certificate format of the companion roadmap. The third involves a NON-RATIONAL torsion point: the construction is carried out over the extension where it is defined and the class is brought down by transfer, and the residue-field norms and the trace formula of ER.4 are exercised. A numerical approximation of a regulator may accompany either but cannot replace the divisor, tame-symbol or L-series identity.

**Hypotheses.**

- The CM curve is the one of ER.5; the certificates are in the format of the companion roadmap's certificate node.
- The non-rational example must have a residue field strictly larger than the base, so that the norms are not the identity.
- The numerical approximation is admissible as a check and not as a proof, which the stage text says.

**Proof outline.**

1. Exhibit the divisors and the leading units for the CM class and verify the residues.
2. Exhibit the transfer computation for the non-rational torsion example, with the norms.
3. Verify the trace formula of ER.4 in that instance.
4. Record the role of a numerical approximation as a check.
5. Record what the two examples test that the first does not: the certificate machinery and the norms.

**Acceptance.**

- The CM class carries a complete certificate with all four fields.
- The non-rational example exercises the residue-field norms and the trace formula.
- A numerical approximation is a check, not a proof.

**Prerequisites.** `EllipticRegulators:ER.5/the-class-U`, `EllipticRegulators:ER.4/transfer-and-the-trace-formula`, `EllipticKTheory:E.7`

**Sources.**

- §0.5, p. 12 of the PDF, The statement the worked example instantiates, verbatim.

  > Dans le cas où E est à multiplication complexe, Bloch a montré comment exprimer L(E, 2) comme combinaison linéaire de valeurs de D_E.

### The fourth worked example: an integrality test on an arithmetic model

`EllipticRegulators:ER.8/the-integrality-worked-example` · *comparison*

The fourth required example is an integrality test: take a curve with a prime of bad reduction, a class constructed as in ER.4, and check the vertical conditions at the components of that special fibre. The example is where the distinction of ER.6 between unramified and integral becomes visible, and it is the only one of the four that touches the arithmetic model. Its outcome is one of two honest statements: the class is integral, with the vertical certificate exhibited; or it is unramified but not integral, in which case the rational statement is what may be quoted.

**Hypotheses.**

- The curve has at least one prime of bad reduction, so that the vertical conditions are not vacuous.
- The model is a regular proper model as in the companion roadmap.
- Either outcome is acceptable as a worked example; what is not acceptable is asserting integrality without the check.

**Proof outline.**

1. Choose a curve with bad reduction and a class from ER.4.
2. Exhibit the model's special fibre with its components.
3. Compute the vertical residues and record the outcome.
4. State the resulting honest statement in either case.
5. Record the consequence for ER.6: the example is what makes its warning concrete.

**Acceptance.**

- The example has a non-vacuous vertical condition.
- Either outcome is a valid worked example.
- Asserting integrality without the check is what the example exists to prevent.

**Prerequisites.** `EllipticRegulators:ER.6/the-vertical-step-that-is-required`, `EllipticKTheory:E.6`, `EllipticRegulators:ER.4/the-regulator-of-the-corrected-classes`

**Sources.**

- §1.1, the localisation inclusion, p. 27 of the PDF, The inclusion that gives the unramified classes; the integral ones are cut out by the vertical conditions this example checks, which this source does not treat.

  > La localisation en K-théorie algébrique induit une inclusion K^{(2)}_2(X_Q) ↪ K_2(Q(X)) ⊗ Q

## Gaps

### Bloch's monograph is in the reference library but its scan has no text layer

Needed by: `EllipticRegulators:ER.5`, `EllipticRegulators:ER.4`.

The CRM monograph the ER.5 stage text names is present in the maintainer's reference library as a scanned PDF. In this environment it yields no text at all: the supplied extraction is a list of empty page markers and an independent extraction reproduces that, and there is no renderer here to read the pages as images. The packet therefore quotes, for the shape of Bloch's CM theorem and for the construction of classes from torsion, a source that can be read, and records the explicit scalar of Theorem 11.2.1 from the roadmap's own transcription, whose stage text states that it was visually checked at the printed pages it names. NEXT SOURCE ACTION: read printed pp. 87 to 93 from page images, verify the scalar in two independent calculations as the stage text requires, and decompose Lectures 9 to 11.

### Schappacher-Scholl was not obtained

Needed by: `EllipticRegulators:ER.7`.

The ER.7 stage text selects Schappacher and Scholl's 1988 paper on Beilinson's theorem on modular curves as the implementation source, names Theorem 1.1.2 and its integral-image proof, and records that public retrieval of the author PDF failed in an earlier round. It was not obtained here either. This packet decomposes the modular half from Brunault's thesis instead, which proves an explicit finite-level theorem with the same shape and which also states the correction to the classical argument; the integral image statement is not decomposed. NEXT SOURCE ACTION: obtain Schappacher-Scholl and decompose Theorem 1.1.2 with its section 7, and compare it with the finite-level theorem recorded here.

### Chapter three of the source was read only through its introduction

Needed by: `EllipticRegulators:ER.7`.

Theorems 1 to 5 and 7 are quoted from the thesis's introduction with their hypotheses and remarks; their proofs, which occupy chapter three — the Eisenstein series, the Rankin-Selberg computation, the modular units and the explicit Beilinson theorem — were not read. The proof steps of the ER.7 nodes therefore record the strategy and the inputs rather than the argument. NEXT SOURCE ACTION: read §§3.1 to 3.6 of the same file, about sixty pages, and decompose the Rankin-Selberg computation, which is the single argument behind all of those theorems.

### Deligne cohomology has no source in this packet

Needed by: `EllipticRegulators:ER.2`.

The source read works with the explicit functional into the dual of the holomorphic differentials and relates it to the Beilinson regulator only by the phrase 'up to a factor'. The real Deligne complex, its hypercohomology and the degree-two exact sequence are stated in ER.2 without a source, as the target that functional computes. NEXT SOURCE ACTION: read Esnault-Viehweg's lectures on Deligne-Beilinson cohomology, which are freely available, and decompose the complex, the exact sequence and the dimension computation; the comparison that fixes the normalisation factor belongs to the complex-comparison roadmap.

### The syntomic side is stated, not decomposed

Needed by: `EllipticRegulators:ER.8`.

ER.8's first node records the syntomic regulator, its computation by p-adic elliptic integrals and the prerequisites of the p-adic conjecture, and cites the p-adic Hodge roadmap as the owner of all of them. No source for the syntomic theory was read here. NEXT SOURCE ACTION: read Besser's work on syntomic regulators for the definition and the integral formula, and decompose them in the roadmap that owns them.

## Requests

- **`EllipticKTheory:E.1`** — The elliptic curve as a scheme with its function field and its isogenies, on whose complex points the analytic construction of ER.1 is carried out.

- **`EllipticKTheory:E.2`** — The zeroth K-group of the curve with the Picard decomposition, which ER.4's divisors and the group law on them rest on.

- **`SchemeKTheoryOperations:S.6`** — The Chern classes and the universal regulator against which ER.2 fixes its normalisation factor.

- **`EllipticKTheory:E.3`** — The localisation sequence of a curve with the tame symbol as its degree-two boundary, and the identification of the second K-theory of the curve with a subspace of that of the function field. Every class this roadmap evaluates lives in that subspace.

- **`EllipticKTheory:E.6`** — The integral part with its model independence and its vertical-residue description; ER.6 restricts the regulator to it and ER.8 tests membership in it.

- **`EllipticKTheory:E.7`** — The corrected symbol classes built from torsion divisors with their certificates; ER.4 computes their regulator and ER.5 assembles them into the CM class.

- **`Polylogarithms:P.1`** — The Bloch-Wigner function with its Steinberg relation and its analytic properties, which is the building block of the elliptic dilogarithm and the reason the regulator descends to the K-group.

- **`BorelRegulators:R.3`** — Borel's regulator and the rank theorem, on which the source's own argument rests and which ER.5 names rather than assuming.

- **`PadicHodgeRegulators:D.1`** — The comparison isomorphism and the period pairing, which ER.1 uses to define the period matrix and whose non-degeneracy it deduces.

- **`PadicHodgeRegulators:D.5`** — The syntomic regulator with its computation by p-adic integrals, for the good-reduction cases of ER.8.

- **`ComplexComparisonPartII:C5`** — The universal Chern and Deligne regulators, against which ER.2's normalisation factor and orientation must be fixed.

- **`EllipticCurveModularity:R29.6`** — The modularity theorem in its final form with its analytic consequences, which ER.5 uses through the L-function of the curve and which ER.7 imports to make its conditional theorem unconditional.

- **`EllipticCurveModularity:R29.5`** — The modularity theorem and the modular parametrisation, which ER.7 names as inputs and which are required before its conditional theorem becomes unconditional over the rationals.

- **`ModularCurvesPartII:R14.6`** — The modular curve as a scheme with its analytic comparison and its cusps, which ER.7's modular units live on.

- **`ModularSymbolsPadicLFunctions:L1`** — Modular symbols and the L-values of a newform with its twists, which appear on the left-hand side of ER.7's theorems.

- **`ArithmeticGaloisRepresentations:R01.6`** — The theory of complex multiplication with the attached Hecke character and its conductor, which ER.5 uses and does not build.

- **`DirichletPadicLFunctions:L0`** — The L-functions with their functional equations, gamma factors and conductors, which ER.6's equivalence of the two formulations tracks, and the p-adic L-function whose definition ER.8 requires before any p-adic statement is made.

- **`K2SymbolsBrauer:T.1`** — The second K-group of a field with the Steinberg relation, which is what the regulator must descend through.

- **`SpecialValuesBirchTate:B.1`** — The special-value conventions of the neighbouring roadmap, with which the scalars of ER.5 and ER.7 must agree where both speak of the same L-function.

## Structural proposals

### ER.3 and ER.4 have a readable source that the stage texts do not name

*note-source-boundary*

The ER.3 and ER.4 stage texts direct the reader to Lectures 9 and 10 of Bloch's monograph, whose scan carries no text layer here. Brunault's thesis, which is freely available on the arXiv, proves the same material in a form that can be read: the elliptic dilogarithm as an orbit sum with its convergence and distribution relations, its identification with the imaginary part of an explicit complex function, the differential property that characterises that function, the behaviour under finite morphisms that the trace formula needs, and the construction of classes from torsion points with their regulator. The stage texts should name it as a permitted implementation source alongside the monograph, so that a worker without page images can still make progress.

### ER.5 carries two developments with very different dependencies

*propose-split*

ER.5 asks both for the CM theory of the curve — the Hecke character, Deuring's comparison, the conductor and the Euler factors — and for the K-theoretic computation that evaluates the regulator of an explicit class and matches it with the L-value. The first is arithmetic of complex multiplication and is owned elsewhere in the atlas; the second is this roadmap's own and depends on ER.3 and ER.4. Splitting would make visible that the second half can be developed against a supplied Hecke character, which is how the work will actually be done. The four nodes divide one to three along that line.

### The three conclusions of ER.6 should be named in the stage texts of ER.5 and ER.7 as well

*note-hypothesis-boundary*

ER.6 draws the distinction between a class with non-zero regulator, a subspace with the expected determinant relation, and the regulator on the whole integral part being an isomorphism. ER.5 proves a statement of the first kind and ER.7 statements of the second; neither stage text says which kind it is proving, and the phrase that Beilinson proved the conjecture for modular curves is exactly the confusion the distinction prevents. Each stage text should classify its own conclusion.

## What this blueprint does not claim

No Lean was compiled. The Mathlib build on this machine is a shared cache that
must not be rebuilt, and this working tree has no elaborated dependency modules.
Every `implementationStatus` is `unchecked`, the suggested Lean file is a naming
proposal whose proofs are all `sorry`, and nothing here is claimed to be
formalised.

One excerpt ran past four hundred characters and was elided at a word boundary;
every other quotation is the full sentence or sentences the locator names.
