# ArithmeticKTheory — N.1 to N.6

The blueprint for the first six layers of the K-theory of number fields and
S-integers. This document is definitive; the packet
`research/blueprint/packets/ArithmeticKTheory--N.1.json` is its machine form and
the suggested Lean file is a naming proposal, not an implementation. The last two
layers, regular primes and certified examples, are the companion packet
`ArithmeticKTheory--N.7`.

Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## The source

One book:

> Charles A. Weibel, *The K-book: An Introduction to Algebraic K-theory*. Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013)
> <https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf>,
> SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`, accessed 2026-09-24.

The file was already on disk from this session's earlier jobs and was re-hashed; the hash reproduces the value recorded by the packets of K2SymbolsBrauer, Polylogarithms, MotivesAndAlgebraicCycles, ArithmeticKTheory--N.7 and GeneralAlgebraicKTheory--K.6.

Sections read:

- IV.1.17, IV.1.18 and the Regulator Maps 1.18.1 (PDF pp. 270 to 271): Borel's theorems on the rationalised K-groups of an order and of a number field, with the period-four rank pattern and the definition of the higher regulator.
- IV.6.9 (PDF p. 324): Quillen's finite generation theorem for an integrally closed subring of a number field finite over the integers and for the coordinate ring of a smooth affine curve.
- V.6.6 with the Dedekind-domain discussion and Corollary 6.6.2 (PDF pp. 408 to 409): the localisation sequence for a Dedekind domain with its transfer maps, and the degree-two row with the semilocal surjectivity argument.
- V.6.8 and Proposition 6.8.1 with the discussion that follows (PDF pp. 411 to 412): Soule's theorem that the odd groups of the ring and of the field agree and that the even sequences split, the finite-coefficient surjectivity it rests on, and the definition of the wild kernel with its comparison to the divisible subgroup.
- VI.2.1 with Examples 2.1.1 and 2.1.2, Proposition 2.2 with Lemma 2.2.1 and Example 2.2.2, the discussion of exceptional fields, and the Harris-Segal Theorem 2.5 with Remark 2.5.1 (PDF pp. 469 to 473): the e-invariant, the invariant of the twisted roots of unity with its order and prime-primary decomposition, its computation from the cyclotomic character, the dyadic exceptional cases, and the Harris-Segal summand.
- VI.8, Classical Data 8.1 with (8.1.1), Theorem 8.2 with the opening of its proof, Theorem 8.4, and Theorems 8.7 and 8.8 (PDF pp. 512 to 514): the classical degrees zero and one with the ranks, the cohomological description of the primary parts at a prime where the cohomological dimension is two, the table for a totally imaginary field, and the two zeta-value theorems this packet admits only as certified second bounds.
- VI.9, Theorem 9.5 with the opening of its proof, Theorem 9.11 and Theorem 9.12 (PDF pp. 518, 523, 524 and 528): the four rows modulo eight for a field with a real embedding, the eight-fold two-primary table with its intermediate rank, and the divisibility for a totally real field.
- NOT read: the proofs of VI.8.2 beyond its opening, of VI.9.5 beyond its opening, and of VI.9.11; the descent spectral sequence of VI.4 and the sections VI.3 to VI.7 that develop it; and V.6.8's proof beyond its first reduction.

## What the pinned libraries already have

`AUDIT-27` records all six texts as *not built*; there is no integrated
decomposition for this roadmap. Every claim of the audit was checked against the
declaration index. Cited, never re-planned:

- `mathlib:ClassGroup` (`Mathlib/RingTheory/ClassGroup/Basic.lean`) — The class group, the torsion of the degree-zero computation.
- `mathlib:IsCyclotomicExtension` (`Mathlib/NumberTheory/Cyclotomic/Basic.lean`) — Cyclotomic extensions, in which the divisibility tests for the invariant of N.4 are carried out.
- `mathlib:IsDedekindDomain.HeightOneSpectrum` (`Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean`) — The non-zero primes of a Dedekind domain, which index the localisation sequence.
- `mathlib:IsLocalization` (`Mathlib/RingTheory/Localization/Defs.lean`) — The localisation predicate, in which N.1 states that the S-integers of a number field are a localisation of the ring of integers.
- `mathlib:NumberField.InfinitePlace.nrRealPlaces` (`Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`) — The number of real places, one of the two numbers in the rank formula and in the tables.
- `mathlib:NumberField.IsTotallyComplex` (`Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean`) — The totally imaginary hypothesis, under which the tables of N.5 and the description of N.6 take their clean form.
- `mathlib:NumberField.RingOfIntegers` (`Mathlib/NumberTheory/NumberField/Basic.lean`) — The ring of integers of a number field, the base of every carrier in this packet.
- `mathlib:NumberField.Units.rank` (`Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean`) — Dirichlet's unit rank, the degree-one rank for the empty S; the correction for a general S is recorded as absent.
- `mathlib:NumberField.Units.torsion` (`Mathlib/NumberTheory/NumberField/Units/Basic.lean`) — The torsion of the unit group, that is the roots of unity of the field, which N.4 insists is NOT its own invariant.
- `mathlib:Set.integer` (`Mathlib/RingTheory/DedekindDomain/SInteger.lean`) — The ring of S-integers of the fraction field of a Dedekind domain, defined by valuations; the carrier N.1 builds on.
- `mathlib:Set.unit` (`Mathlib/RingTheory/DedekindDomain/SInteger.lean`) — The group of S-units, likewise.
- `mathlib:Set.unitEquivUnitsInteger` (`Mathlib/RingTheory/DedekindDomain/SInteger.lean`) — The identification of the S-units with the units of the ring of S-integers, which is the right-hand side of the degree-one computation.
- `mathlib:modularCyclotomicCharacter.toFun` (`Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean`) — The modular cyclotomic character, from which the invariant of N.4 is computed.
- `mathlib:rootsOfUnity` (`Mathlib/RingTheory/RootsOfUnity/Basic.lean`) — The roots of unity, the untwisted coefficients of the invariant of N.4.
- `tauceti:IsDedekindDomain.finite_integer_classGroup` (`TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean`) — Its finiteness.
- `tauceti:IsDedekindDomain.integerClassGroupEquiv` (`TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean`) — The class group of the S-integers as the quotient of the class group by the classes of the primes of S.
- `tauceti:IsDedekindDomain.ker_integer_extendedHom` (`TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean`) — The kernel of the extension map on class groups, which is the degree-zero row of the localisation sequence in classical form.
- `tauceti:NumberField.fg_units_integralClosure` (`TauCeti/NumberTheory/NumberField/IntegralClosure.lean`) — Finite generation of the units, the classical degree-one case of Quillen's theorem.
- `tauceti:Set.unitValuation_ker` (`TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean`) — The S-unit valuation sequence in classical form, the degree-one row.
- `tauceti:Set.unit_mono` (`TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean`) — Monotonicity of the S-unit group in S; the corresponding statement for the ring is what N.1 adds.
- `tauceti:TauCeti.ExactK0` (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`) — The Grothendieck group of an exact category, the pinned degree-zero object behind the K-groups of this roadmap.
- `tauceti:TauCeti.KummerCoeff` (`TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean`) — The roots of unity of the separable closure as a discrete Galois module, the untwisted case of the coefficients N.4 twists.

Absent at both pins, and therefore this blueprint's own work or an import: any
K-group beyond degree zero; the localisation sequence; `ℚ/ℤ(j)` and every twisted
coefficient module; étale cohomology of arithmetic schemes; the tame and wild
kernels; the stable general linear group and the plus construction; and Quillen's
computation of `K_*(F_q)`.

## N.1 — Arithmetic carriers and degree zero/one

The carrier, and the two computations this layer imports.

**What N.1 owns** is the carrier: for a *number field* the ring of S-integers is
a localisation of the ring of integers — Tau Ceti's own file records that this
is false for a general Dedekind domain — together with independence of the
presentation and monotonicity in S. **What it imports** are `K₀ ≅ ℤ ⊕ Cl` from
`KTheoryLowDegrees:Z.4` and `K₁ ≅ O_{F,S}ˣ` from `KTheoryLowDegrees:U.4`.

**`K₁(F) = Fˣ` is not the S-unit group.** The first is not finitely generated,
the second is; keeping them apart is what the fourth node exists for.

Coverage: **source_decomposed**.

Four nodes. The carrier, with the two theorems the audit records as missing: that for a NUMBER FIELD the ring of S-integers is a localisation of the ring of integers, which needs the finiteness of the class group and which Tau Ceti's own file says is false for a general Dedekind domain, and that the ring grows with S, where only the unit group is pinned. Then the two imported computations, the zeroth group as the integers plus the class group and the first as the S-units by the determinant, each recorded with its owner in KTheoryLowDegrees and with the pinned halves that exist; the second carries the stage text's warning that the first K-group of the FIELD is the whole multiplicative group and is not finitely generated. Finally the comparison of norms and extension of ideals with transfer and pullback, in both degrees, with the composite formula and the projection formula and their owner. Every target of the stage text has a node.

### The ring of S-integers as a localisation, and what depends on the presentation

`ArithmeticKTheory:N.1/S-integers-as-a-localisation` · *construction*

For a number field and a finite set S of finite primes, the ring of S-integers is the subring of elements whose valuation is non-negative outside S. For a NUMBER FIELD it is a localisation of the ring of integers, at the multiplicative set generated by any elements generating the primes of S to suitable powers, and it is again a Dedekind domain; the ring does not depend on which such presentation is chosen, and enlarging S enlarges the ring. The pinned libraries define the S-integers by valuations and prove that they form a Dedekind domain whose ideals are extended, and Tau Ceti's own file records that for a GENERAL Dedekind domain the S-integers need not be a localisation, so the number-field hypothesis is where this node lives.

**Hypotheses.**

- F is a number field with ring of integers O and S a finite set of finite primes; archimedean places are not in S and appear separately in the cohomological notation of the later layers.
- The class group of the ring of integers is finite, which is what makes some power of each prime of S principal and hence makes the localisation presentation available; this is why the statement is for a number field and not for an arbitrary Dedekind domain.
- Independence of the presentation is a statement about the ring, not about the chosen generators; the generators are not canonical and nothing later may depend on them.

**Proof outline.**

1. Record the pinned definition of the S-integers and S-units by valuations, and the pinned facts that the S-integers form a Dedekind domain with all ideals extended.
2. Prove that for a number field the S-integers are the localisation of the ring of integers at the multiplicative set generated by generators of suitable powers of the primes of S, using finiteness of the class group to find them.
3. Prove independence: two such presentations give the same subring, since both are characterised by the valuation condition.
4. Prove monotonicity in S at the level of rings, which the audit records as absent (only the unit groups are known to grow).
5. Record the localisation's compatibility with the class group: the class group of the S-integers is the class group modulo the classes of the primes in S, which Tau Ceti proves, with finiteness.

**Acceptance.**

- For the empty set the ring of S-integers is the ring of integers.
- Enlarging S enlarges the ring, and the class group surjects with kernel generated by the classes of the new primes.
- The construction depends on S only, not on the chosen generators.
- For a general Dedekind domain the S-integers need not be a localisation; Tau Ceti's file says so, and the number-field hypothesis is what this node uses.

**Prerequisites.** `mathlib:Set.integer`, `mathlib:Set.unit`, `mathlib:IsLocalization`, `mathlib:NumberField.RingOfIntegers`, `mathlib:IsDedekindDomain.HeightOneSpectrum`, `tauceti:IsDedekindDomain.integerClassGroupEquiv`, `tauceti:IsDedekindDomain.finite_integer_classGroup`, `tauceti:Set.unit_mono`

**API.**

| name | role | statement |
| --- | --- | --- |
| `SIntegers` | data | The ring of S-integers of a number field. |
| `SIntegers.isLocalization` | characterisation | It is a localisation of the ring of integers. |
| `SIntegers.presentation_indep` | characterisation | Independence of the chosen presentation. |
| `SIntegers.mono` | compatibility | Monotonicity in S. |
| `SIntegers.isDedekind` | relation | It is again a Dedekind domain, which Tau Ceti proves. |
| `SIntegers.classGroup` | relation | Its class group is the quotient by the classes of the primes of S. |

**Used by.**

- *N.1, the degree-zero and degree-one computations* — Both are statements about this ring, and both are imported from KTheoryLowDegrees.
- *N.2, the localisation sequence* — The sequence is the one attached to this localisation.
- *N.3, finite generation* — Quillen’s theorem is stated for an integrally closed subring of a number field finite over the integers, which is this ring.

**Unit tests.**

- `empty_S` — For the empty set the ring is the ring of integers.
- `monotone` — Enlarging S enlarges the ring.
- `indep_of_generators` — Two presentations of the same S give the same ring.
- `not_general_dedekind` — For a general Dedekind domain the S-integers need not be a localisation; the number-field hypothesis is used.

**Sources.**

- VI.8.4 and the Classical Data VI.8.1 (PDF pp. 512 to 513), The source uses exactly this carrier throughout the chapter, with the class group and the unit rank of the S-integers appearing in degrees zero and one.

  > Theorem 8.4. Let F be a totally imaginary number field, and let O_S be the ring of S-integers in F for some set S of finite places. Then: K_n(O_S) = Z (+) Pic(O_S), for n = 0; Z^{r_2+|S|-1} (+) Z/w_1(F), for n = 1; ... Classical Data 8.1. Let O_S be a ring of integers in a number field F.

### The zeroth K-group of the S-integers

`ArithmeticKTheory:N.1/K0-of-S-integers` · *comparison*

The zeroth K-group of the ring of S-integers is the direct sum of the integers, by the rank, and the class group, by the determinant. The statement is owned by KTheoryLowDegrees, which proves it for Dedekind domains by rank and determinant and specialises it to the S-integers with the class group described as the quotient by the primes of S; this node imports it, records the two pinned halves that exist, and states the form in which the later layers use it. The rank map and the determinant map do not exist in either pinned library, so nothing here is available at the pins beyond the two sides of the isomorphism.

**Hypotheses.**

- The ring is the ring of S-integers of a number field, which is a Dedekind domain by the previous node.
- The class group is the one of that ring, which Tau Ceti computes as the quotient of the class group of the ring of integers by the classes of the primes in S.
- The isomorphism is by rank and determinant, and is natural for the inclusions given by enlarging S.

**Proof outline.**

1. Record the owner and the exact statement imported.
2. Record the two pinned halves: Tau Ceti's Grothendieck group of the finitely generated projective modules of a ring, and Mathlib's class group with Tau Ceti's computation for the S-integers with finiteness.
3. State the form used later: the zeroth group is finitely generated of rank one, with torsion the class group, so it contributes the classical data of the number-field layers.
4. Record the compatibility with enlarging S, which follows from the class-group statement.
5. Record that no rank or determinant map exists at the pins, so the isomorphism itself is entirely missing.

**Acceptance.**

- The zeroth group is the sum of the integers and the class group.
- Its torsion is finite, since the class group is.
- The statement is imported, not proved here; KTheoryLowDegrees Z.4 owns it.

**Prerequisites.** `ArithmeticKTheory:N.1/S-integers-as-a-localisation`, `KTheoryLowDegrees:Z.4`, `mathlib:ClassGroup`, `tauceti:TauCeti.ExactK0`, `tauceti:IsDedekindDomain.finite_integer_classGroup`

**Sources.**

- VI.8.4 (PDF p. 513), The degree-zero row, verbatim; the source calls the class group Pic and refers to the Classical Data for the proof.

  > Theorem 8.4. ... K_n(O_S) = Z (+) Pic(O_S), for n = 0.

### The first K-group of the S-integers, and why it is not the first K-group of the field

`ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant` · *comparison*

The determinant identifies the first K-group of the ring of S-integers with its unit group, the group of S-units, which is finitely generated of rank the number of archimedean places plus the size of S minus one, with torsion the roots of unity of the field. The statement is owned by KTheoryLowDegrees, whose proof is the Bass-Milnor-Serre theorem that the special first K-group vanishes. The first K-group of the FIELD is the whole multiplicative group, which is not finitely generated; keeping the two apart is what this node exists for, and the stage text names it.

**Hypotheses.**

- The ring is the ring of S-integers of a number field and the field is its fraction field.
- The rank statement is Dirichlet's S-unit theorem; Mathlib proves the case of the empty S with the unit lattice and the regulator, and Tau Ceti proves finite generation for the general case.
- The torsion of the unit group is the group of roots of unity of the field, which Mathlib has; it is NOT the invariant of the later layers, as N.4 insists.

**Proof outline.**

1. Record the owner and the imported statement, including that the special first K-group vanishes.
2. Record the pinned halves: Mathlib's identification of the S-units with the units of the ring of S-integers, its Dirichlet theorem for the empty S with the rank, and Tau Ceti's finite generation for a general S.
3. State the rank formula with the correction for S and record that Tau Ceti's own file says the correction is absent there.
4. State the contrast with the field: the first K-group of a number field is its multiplicative group, which is not finitely generated, and the later rank formula does not apply to degree one.
5. Record the naturality: the identification commutes with the maps induced by enlarging S.

**Acceptance.**

- The first K-group of the ring of S-integers is its unit group, finitely generated.
- Its rank is the number of archimedean places plus the size of S minus one, not the rank predicted by the later period-four formula.
- The first K-group of the field is the multiplicative group and is not finitely generated; the two may not be confused.

**Prerequisites.** `ArithmeticKTheory:N.1/S-integers-as-a-localisation`, `KTheoryLowDegrees:U.4`, `mathlib:Set.unitEquivUnitsInteger`, `mathlib:NumberField.Units.rank`, `mathlib:NumberField.Units.torsion`, `tauceti:NumberField.fg_units_integralClosure`

**Sources.**

- VI.8.4 (PDF p. 513), The degree-one row for a totally imaginary field, verbatim; the rank is the S-unit rank and the torsion is the roots of unity, written there as the first of the invariants of N.4.

  > Theorem 8.4. ... Z^{r_2+|S|-1} (+) Z/w_1(F), for n = 1.

### Norms and extension of ideals against K-theory transfer and pullback

`ArithmeticKTheory:N.1/norms-transfers-and-pullbacks` · *comparison*

For an extension of number fields the inclusion of the rings of S-integers induces a pullback of K-groups and, since the larger ring is finitely generated as a module over the smaller, a transfer in the opposite direction. In degree zero the pullback is extension of ideals and the transfer is the relative norm on class groups; in degree one they are inclusion and the field norm on units. This node states the comparison in both degrees, records that the degree-zero shadows are what the pinned libraries have, and states the two compatibilities the later layers use: the composite of transfer and pullback is multiplication by the degree, and the projection formula holds.

**Hypotheses.**

- The extension is finite and separable, as any extension of number fields is; the set S is enlarged to the primes above those of S.
- The transfer exists because the larger ring of S-integers is finitely generated projective over the smaller, which holds for a separable extension.
- The projection formula is the one of GeneralAlgebraicKTheory K.3, which owns it; this node states its arithmetic instance.

**Proof outline.**

1. Construct the pullback from functoriality and the transfer from the finite module structure, citing the owner of each.
2. Identify both in degree zero with extension of ideals and the relative norm, which Tau Ceti has.
3. Identify both in degree one with the inclusion of units and the field norm.
4. State the composite formula, that transfer after pullback is multiplication by the degree of the extension.
5. State the projection formula in this instance and record its owner.
6. Record that no K-theoretic map exists at the pins, only the degree-zero shadows.

**Acceptance.**

- In degree zero the two maps are extension of ideals and the relative norm.
- In degree one they are the inclusion and the field norm on units.
- Transfer after pullback is multiplication by the degree.
- The projection formula holds, and is imported from the general roadmap.

**Prerequisites.** `ArithmeticKTheory:N.1/K0-of-S-integers`, `ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant`, `GeneralAlgebraicKTheory:K.3`

**Sources.**

- V.6.6 and the transfer discussion (PDF pp. 409 to 410), The construction of the arithmetic transfer, verbatim.

  > Suppose that R is an inclusion of Dedekind domains, with R' finitely generated as an R-module. Then the fraction field F' of R' is finite over F, so the exact functors M(R') -> M(R) and M(F') -> M(F) inducing the transfer maps ...

## N.2 — Localisation and finite support

One sequence, three classical rows, and one additional theorem.

The class-group sequence, the S-unit valuation sequence and the tame-kernel
sequence are **the degree-zero, degree-one and degree-two rows of a single
localisation sequence**, not three separate results. Two of the three are pinned
in classical form — and are *not* derived there from a K-theoretic sequence.

**Exactness gives no injectivity.** The term preceding `Kₙ(O_{F,S}) → Kₙ(F)` is
the residue sum, which need not map to zero. Injectivity is Soulé's theorem,
with arithmetic input, and in degree zero it is false.

Coverage: **source_decomposed**.

Five nodes. The localisation sequence for a Dedekind domain in the source's form, with the transfers out of the residue fields and the specialisation to the primes outside S; finite support of the boundary, proved from the colimit description of the torsion category rather than assumed; the three classical rows in degrees zero, one and two, recorded as three rows of ONE sequence, with the two that are pinned in classical form named and the third handed to K2SymbolsBrauer; Soule's theorem, which is the additional theorem the stage text demands, with the odd isomorphism and the even short exact sequences and with the finite-coefficient surjectivity it rests on; and the non-example the stage text names, that exactness gives no injectivity, with the degree-zero failure as the witness. Every target has a node.

### The localisation sequence for a Dedekind domain

`ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain` · *theorem* · planet **The arithmetic localisation sequence**

For a Dedekind domain with fraction field F the localisation sequence of the general roadmap, taken at the multiplicative set of all non-zero elements, becomes a long exact sequence running from the direct sum over the non-zero primes of the K-groups of the residue fields, through the K-groups of the ring, to those of the field, and back to the direct sum one degree down. The maps out of the direct sum are the transfers attached to the residue fields; the boundary is the sum of the residue maps. For a ring of S-integers the primes that are inverted drop out, so the sum runs over the primes not in S, which is the form the stage text states.

**Hypotheses.**

- The ring is a Dedekind domain, so it and its residue fields are regular and the K-theory and G-theory of each agree, which is what lets the localisation sequence of the abelian categories be read as a sequence of K-groups.
- The direct sum is over the non-zero primes; for a ring of S-integers it is over the primes outside S.
- The sequence is the instance of Quillen's localisation theorem for a Serre subcategory, which GeneralAlgebraicKTheory K.3 owns; this node is its Dedekind-domain case.

**Proof outline.**

1. Record the general theorem and its owner.
2. Record the identification of K-theory with G-theory for a regular ring, which is the resolution theorem, and apply it to the ring, the field and the residue fields.
3. Read off the long exact sequence in the displayed form, with the transfer maps out of the residue fields.
4. Specialise to the ring of S-integers, where the torsion modules supported at the primes of S have been inverted.
5. Record the compatibility with a finite extension of fields, which comes from the transfer and pullback of the previous layer.
6. Record that nothing of this exists at the pins: there is no K-theory, hence no sequence, and the audit says so.

**Acceptance.**

- For a ring of S-integers the sum runs over the primes outside S.
- The maps out of the sum are the transfers of the residue fields.
- The sequence is functorial for enlarging S and for finite extensions of fields.
- In degree zero it ends in the classical right-exact sequence of class groups.

**Prerequisites.** `ArithmeticKTheory:N.1/S-integers-as-a-localisation`, `GeneralAlgebraicKTheory:K.3`, `mathlib:IsDedekindDomain.HeightOneSpectrum`

**Sources.**

- V.6.6, Dedekind Domains (PDF pp. 408 to 409), The sequence and the identification of its maps, verbatim.

  > Suppose that R is a Dedekind domain with fraction field F. Then R and F are regular, as are the residue fields R/p, so K_*(R) = G_*(R), etc. Hence the localization sequence of 6.1 with S = R - {0} becomes the long exact sequence: ... K_{n+1}(F) -> (+)_p K_n(R/p) -> K_n(R) -> K_n(F) -> ... Here p runs over the nonzero prime ideals of R, and the maps (i_p)_* : K_n(R/p) -> K_n(R) are the ...

### Finite support of the boundary

`ArithmeticKTheory:N.2/finite-support` · *lemma*

The boundary map from the K-groups of the field lands in the DIRECT SUM and not merely in the product: each class has non-trivial residue at only finitely many primes. In degree one this is the classical statement that a non-zero element of a number field has non-trivial valuation at only finitely many primes, which Tau Ceti proves; in higher degrees it is part of the construction of the sequence, since the category of torsion modules is the filtered colimit of the categories supported on finitely many primes. The statement is what makes the sequence usable for computation, and it is not a formality.

**Hypotheses.**

- The ring is a Dedekind domain with fraction field F; the primes are the non-zero primes, or those outside S.
- In degree one the statement is about valuations and is pinned; in higher degrees it is about the colimit description of the torsion category.
- Finite support is a property of each single class, not a uniform bound over the group.

**Proof outline.**

1. Record the degree-one statement and its pinned form.
2. Prove the general statement from the description of the torsion category as a filtered colimit over the finite subsets of primes, together with the fact that K-theory commutes with filtered colimits.
3. Deduce that the boundary factors through the direct sum.
4. Record the consequence used later: a computation may be carried out one prime at a time and reassembled.
5. Record the compatibility with enlarging S.

**Acceptance.**

- Each class has non-trivial residue at only finitely many primes.
- In degree one this is the classical finite-support statement for valuations.
- The target is the direct sum, not the product; a formalisation that used the product would not have the sequence's exactness.

**Prerequisites.** `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `GeneralAlgebraicKTheory:K.1`

**Sources.**

- V.6.6 (PDF p. 409), The direct sum in the statement of the sequence, verbatim; the finite-support property is what makes the sum rather than the product correct.

  > Here p runs over the nonzero prime ideals of R, and the maps (i_p)_* : K_n(R/p) -> K_n(R) are the transfer maps.

### The three classical consequences in degrees zero, one and two

`ArithmeticKTheory:N.2/the-three-classical-rows` · *comparison*

The three sequences the stage text names are the low-degree rows of one and the same localisation sequence: in degree zero the right-exact sequence of class groups, from the free group on the primes outside S to the class group of the ring of integers and onto that of the S-integers; in degree one the S-unit valuation sequence, from the units of the ring of integers through the S-units to the free group on the primes of S; and in degree two the tame-kernel sequence, from the second K-group of the ring of integers through that of the field to the direct sum of the residue fields' unit groups. Two of the three are proved classically in the pinned libraries and are NOT derived there from a K-theoretic sequence; the third does not exist at the pins because the second K-group does not.

**Hypotheses.**

- The ring is the ring of S-integers of a number field.
- The degree-two row uses that the first K-group of a finite field is its unit group and that the second vanishes, which is Quillen's computation.
- Surjectivity of the boundary in degree two is a theorem, not a formality; the source proves it for a semilocal Dedekind domain directly and in general through Soule's theorem.

**Proof outline.**

1. Write out the three rows of the sequence.
2. Record the pinned classical forms of the first two and say explicitly that they are not derived from a K-theoretic sequence there.
3. Record the degree-two row and its owner in the atlas, K2SymbolsBrauer, which proves the tame-kernel sequence.
4. Record the source's semilocal statement, where the boundary in degree two is surjective by an explicit symbol lift.
5. State the rule this node exports: the three are one construction, and a formalisation should derive them from the sequence rather than reproving each.

**Acceptance.**

- The three classical sequences are the three low-degree rows of one localisation sequence.
- The degree-zero and degree-one rows are pinned in classical form, the degree-two row is not.
- Surjectivity of the degree-two boundary is a theorem with its own proof.

**Prerequisites.** `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `K2SymbolsBrauer:T.5`, `tauceti:Set.unitValuation_ker`, `tauceti:IsDedekindDomain.ker_integer_extendedHom`

**Sources.**

- V.6.6.2 (PDF p. 409), The degree-two row with the proof of surjectivity in the semilocal case, verbatim.

  > Corollary 6.6.2. If R is a semilocal Dedekind domain, K_3(F) -> (+) K_2(R/p) is onto, and we obtain the exact sequence 0 -> K_2(R) -> K_2(F) -> (+)_p (R/p)^x -> 1. Proof. It suffices to lift a symbol in K_2(R/p). We can lift a, b to units of R as R is semilocal.

### Soule's theorem: the odd groups of the ring and of the field agree

`ArithmeticKTheory:N.2/soule-odd-isomorphism` · *theorem* · planet **Soule's odd isomorphism**

For a Dedekind domain whose fraction field is a global field the K-groups of the ring and of the field agree in every odd degree at least three, and in each even degree at least two the localisation sequence breaks into short exact sequences from the K-group of the ring through that of the field onto the direct sum of the residue fields' K-groups one degree down. This is an ADDITIONAL theorem, not a consequence of exactness: the stage text forbids inferring injectivity of the maps from the ring to the field from exactness alone, and this node is the theorem that supplies it, with the vanishing of the relative kernel as its content.

**Hypotheses.**

- The ring is a Dedekind domain whose fraction field is a global field, that is a number field or a function field of a curve over a finite field.
- The statement in degree one is the Bass-Milnor-Serre theorem, that the special first K-group vanishes; the higher-degree cases are proved from the mod-l version and a divisibility argument.
- The theorem does not say that the maps are injective for all n; it says the relative kernel vanishes for n at least one, which is what gives both halves.

**Proof outline.**

1. State the theorem in both halves, the odd isomorphism and the even short exact sequence.
2. Record the reduction: it suffices to prove that the kernel of the map from the ring to the field vanishes in each positive degree.
3. Record the degree-one case, the Bass-Milnor-Serre theorem, which is owned by KTheoryLowDegrees.
4. Record the higher-degree argument through the mod-l localisation sequence and the surjectivity of the boundary with finite coefficients.
5. State the non-example the stage text demands: exactness alone gives no injectivity, and a formalisation that asserted it would be wrong.
6. Record the consequence used by the next layers: for odd degrees the arithmetic of the ring and of the field is the same, so the tables of N.5 may be stated for either.

**Acceptance.**

- In odd degrees at least three the two K-groups agree.
- In even degrees at least two the sequence breaks into short exact sequences with a surjection onto the residue sum.
- Injectivity may not be inferred from exactness; this theorem is what supplies it.
- In degree one the corresponding statement is the vanishing of the special first K-group.

**Prerequisites.** `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.2/the-three-classical-rows`, `KTheoryLowDegrees:U.4`

**Sources.**

- V.6.8 (PDF p. 411), The theorem with the reduction its proof uses, verbatim.

  > Theorem 6.8. (Soule) Let R be a Dedekind domain whose field of fractions F is a global field. Then K_n(R) = K_n(F) for all odd n >= 3; for even n >= 2 the localization sequence breaks up into exact sequences: 0 -> K_n(R) -> K_n(F) -> (+)_p K_{n-1}(R/p) -> 0. Proof. Let SK_n(R) denote the kernel of K_n(R) -> K_n(F); it suffices to prove that SK_n(R) = 0 for n >= 1. For n = 1 this is the ...

- V.6.8.1 (PDF p. 411), The finite-coefficient input, verbatim.

  > Proposition 6.8.1. (Soule) Let R be a Dedekind domain whose field of fractions F is a global field. Then for each l and each even n >= 2, the boundary map K_n(F; Z/l) -> (+) K_{n-1}(R/p; Z/l) is onto in the localization sequence with coefficients Z/l.

### What exactness of the sequence does not give

`ArithmeticKTheory:N.2/exactness-gives-no-injectivity` · *comparison*

The localisation sequence is exact; that alone says nothing about injectivity of the map from the K-groups of the ring to those of the field, because the preceding term, the direct sum of the residue fields' K-groups, need not map to zero. The kernel of that map is the relative group the previous node kills, and killing it is a theorem with arithmetic input. This node states the distinction as a non-example, because it is the error the stage text names, and records the one place where the corresponding statement genuinely fails: the map is not injective in degree zero, where the transfer from the residue fields hits the classes of the primes.

**Hypotheses.**

- The sequence is the one of the first node of this layer, for a Dedekind domain.
- The failure in degree zero is the classical statement that the class group of the S-integers is a proper quotient of the class group of the ring of integers when some prime of S is not principal.
- The positive-degree statement is the previous node's theorem and depends on the global-field hypothesis.

**Proof outline.**

1. State the exact sequence and observe which term precedes the map in question.
2. State the non-example in degree zero explicitly, with the class-group quotient as the witness.
3. State that in positive degrees injectivity is the previous node's theorem and needs the global-field hypothesis.
4. Record the rule: every use of injectivity in the atlas must cite that theorem, not exactness.

**Acceptance.**

- In degree zero the map from the ring to the field is not injective in general.
- In positive degrees injectivity holds for a global field, by the previous node, and that is a theorem.
- No injectivity statement may be derived from exactness alone.

**Prerequisites.** `ArithmeticKTheory:N.2/soule-odd-isomorphism`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`

**Sources.**

- V.6.8 (PDF p. 411), The source itself isolates the kernel as the thing to be proved zero, which is exactly the point of this node.

  > Let SK_n(R) denote the kernel of K_n(R) -> K_n(F); it suffices to prove that SK_n(R) = 0 for n >= 1.

## N.3:finite-generation — Finiteness

Quillen's theorem, and the two inputs it needs from elsewhere.

Arithmetic-group finiteness with its finite-type homotopy consequence comes from
`BorelRegulators:R.1`; Quillen's computation of `K_*(F_q)` comes from the
general roadmap and is what makes the residue terms of the localisation sequence
harmless. Neither exists at the pins.

Coverage: **source_decomposed**.

Two nodes. Quillen's theorem in the source's form, covering both the number-field and the function-field case, with the passage from the ring of integers to the S-integers through the localisation sequence and the finiteness of the K-groups of the residue fields; and the node that records the two inputs and their owners, arithmetic-group finiteness with its finite-type homotopy consequence from BorelRegulators and Quillen's computation of the K-theory of a finite field from the general roadmap, together with the fact that the pinned libraries have neither. Both targets of the stage text have a node; the third, the passage to S-integers, is a proof step of the first.

### Quillen's finite generation theorem

`ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers` · *theorem* · planet **Quillen's finite generation theorem**

For an integrally closed subring of a number field, finite over the integers — in particular for a ring of S-integers — every K-group is a finitely generated abelian group. The same holds for the coordinate ring of a smooth affine curve over a finite field. The theorem is Quillen's; its proof runs through the finiteness properties of arithmetic groups and a finite-type homotopy statement about the plus construction, and it is combined with the localisation sequence and the computation of the K-theory of a finite field to pass from the ring of integers to the S-integers.

**Hypotheses.**

- The ring is integrally closed in a number field and finite over the integers; for the S-integers this holds by the first layer.
- The proof needs the finiteness properties of arithmetic groups, which BorelRegulators owns, and Quillen's computation of the K-theory of a finite field, which the general roadmap owns.
- Finite generation is asserted for every degree, including degree zero, where it is the finiteness of the class group together with the rank.

**Proof outline.**

1. State the theorem in the source's form, covering both the number-field and the function-field case.
2. Record the two inputs and their owners: arithmetic-group finiteness with the finite-type homotopy consequence, and the K-theory of a finite field.
3. Record the passage from the ring of integers to the S-integers through the localisation sequence: the residue terms are the K-groups of finite fields, which are finite, and finite generation is preserved by extensions.
4. Record the degree-zero and degree-one cases in classical form and the pinned facts that give them.
5. Record the consequence for the later layers: every group in the tables is finitely generated, so the rank and the torsion determine it up to extension data.

**Acceptance.**

- Every K-group of a ring of S-integers is finitely generated.
- In degree zero this is the finiteness of the class group with the rank one; in degree one it is Dirichlet's S-unit theorem.
- The K-groups of the FIELD are not finitely generated: the positive even ones are infinite torsion groups, which N.3:ranks records.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1`, `BorelRegulators:R.1`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `tauceti:NumberField.fg_units_integralClosure`, `tauceti:IsDedekindDomain.finite_integer_classGroup`

**Sources.**

- IV.6.9 (PDF p. 324), The theorem, verbatim.

  > Theorem 6.9. (Quillen) Let R be either an integrally closed subring of a number field F, finite over Z, or else the coordinate ring of a smooth affine curve over a finite field. Then K_n(R) is a finitely generated group for all n.

### The two inputs to finite generation, and where they live

`ArithmeticKTheory:N.3:finite-generation/the-two-inputs-and-their-owners` · *comparison*

Quillen's proof is not self-contained in this roadmap: it needs the finiteness properties of arithmetic groups, with the consequence that the classifying space of the stable general linear group of the ring has the homotopy type of a space with finitely many cells in each dimension, and it needs the computation of the K-theory of a finite field, which supplies the residue terms of the localisation sequence. Both are owned elsewhere, and this node records exactly what is imported and what the pinned libraries have towards each, which is almost nothing: no stable general linear group, no plus construction, no finite-type statement, and no computation of the K-theory of a finite field.

**Hypotheses.**

- The arithmetic-group input is for the groups of the ring of S-integers; BorelRegulators owns it.
- The finite-field input is Quillen's computation of the K-groups of a finite field, which GeneralAlgebraicKTheory owns through the plus construction.
- Neither pinned library has the stable general linear group, its elementary subgroup, the plus construction or any finite-field K-group beyond degree one.

**Proof outline.**

1. State the arithmetic-group input and name its owner.
2. State the finite-field input and name its owner, and record the values of those groups, which are cyclic of order one less than a power of the cardinality in odd degrees and zero in positive even degrees.
3. Record what the pinned libraries have towards each, which is the multiplicative group of a finite field and the generation of the special linear group by transvections, and nothing else.
4. Record how the two are combined in the passage from the ring of integers to the S-integers.

**Acceptance.**

- The K-groups of a finite field are finite in positive degrees, which is what makes the residue terms harmless.
- The arithmetic-group input is imported, not proved here.
- Nothing of either input exists at the pins.

**Prerequisites.** `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `BorelRegulators:R.1`, `GeneralAlgebraicKTheory:K.1`

**Sources.**

- VI.8.2, the proof (PDF p. 513), The place where the finite-field computation enters the arithmetic argument, verbatim.

  > Proof. Set R = O_S[1/l]. For p over l, K_{n-1}(R/p) has no l-torsion by IV.1.13. By the localization sequence (V, 6.6) ...

## N.3:ranks — Rank comparison

Borel's period-four pattern, and the degree it does not cover.

| n mod 4 | rank Kₙ(O_{F,S}), n ≥ 2 |
| --- | --- |
| 1 | r₁ + r₂ |
| 3 | r₂ |
| even | 0 |

**Degree one is not covered.** There the rank is the S-unit rank
`r₁ + r₂ + |S| − 1`, which differs from the table already for `S = ∅`.

Coverage: **source_decomposed**.

Two nodes. Borel's rank theorem in the form the arithmetic sections use, with the period-four pattern, the finiteness of the positive even groups of the S-integers and the contrast with the field, whose positive even groups are infinite torsion; and the non-example the stage text names, that the formula does not cover degree one, where the rank is the S-unit rank and differs already for the empty set. The pinned Dirichlet theorem is cited and the missing S-correction, which Tau Ceti's own file records, is named.

### Borel's rank theorem

`ArithmeticKTheory:N.3:ranks/borel-rank-theorem` · *theorem* · planet **Borel's rank theorem**

For a number field and every degree at least two, the rank of the K-group of a ring of S-integers is the number of archimedean places when the degree is one modulo four, the number of complex places when it is three modulo four, and zero when it is even. Equivalently the rationalised K-groups of the field are those of the ring and are given by the same period-four pattern. The theorem is Borel's; it is proved by computing the stable rational cohomology of the special linear groups of an order and taking primitives, and BorelRegulators owns it. This node states it in the arithmetic form the later layers use.

**Hypotheses.**

- F is a number field with r real and s complex places; the ring is any ring of S-integers, which is an order in F.
- The degree is at least two; degree one is NOT covered by the formula and is the subject of the next node.
- The theorem is about ranks, that is about the rationalised groups; it says nothing about torsion.

**Proof outline.**

1. Record Borel's theorem in the source's form, first for an order in a semisimple algebra and then for a number field.
2. Read off the period-four pattern and record that it depends only on the two counts of archimedean places.
3. Record the consequence: the positive even K-groups of a ring of S-integers are finite, since they are finitely generated of rank zero.
4. Record the contrast for the field: its positive even K-groups are infinite torsion groups, which the localisation sequence makes visible through the residue terms.
5. Record that the higher regulator is defined from the same construction, and that BorelRegulators owns it.

**Acceptance.**

- The positive even K-groups of a ring of S-integers are finite.
- The rank in odd degrees alternates between the number of archimedean places and the number of complex places with period four.
- The formula does not apply in degree one.
- The positive even K-groups of the field are infinite torsion groups.

**Prerequisites.** `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `BorelRegulators:R.3`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`

**Sources.**

- IV.1.18 (PDF p. 270), The theorem with the three cases, verbatim.

  > Theorem 1.18. (Borel) Let F be a number field, and A a central simple F-algebra. Then for n >= 2 we have K_n(A) (x) Q = K_n(F) (x) Q and rank K_n(A) (x) Q = r_2, n = 3 (mod 4); r_1 + r_2, n = 1 (mod 4); 0, else.

- VI.8.1, Classical Data (PDF p. 512), The arithmetic form the later sections use, verbatim.

  > Classical Data 8.1. Let O_S be a ring of integers in a number field F. By Chapter IV, 1.18 and 6.9, the groups K_n(F) are finite when n is even and nonzero; if n is odd and n >= 3 the groups K_n(F) are the direct sum of a finite group and Z^r, where r is r_2 when n = 3 (mod 4) and r_1 + r_2 when n = 1 (mod 4).

### The rank in degree one is the S-unit rank, not the period-four value

`ArithmeticKTheory:N.3:ranks/the-first-K-group-is-not-covered` · *comparison*

The period-four formula is stated for degrees at least two. In degree one the rank of the K-group of a ring of S-integers is the S-unit rank, the number of archimedean places plus the size of S minus one, which is what Dirichlet's theorem gives. The two disagree as soon as S is non-empty, and even for the empty S the period-four value in degree one would be the number of archimedean places rather than one less. This node states the distinction as a non-example, because the stage text names it and because the formula is exactly the kind of statement that is applied one degree too far.

**Hypotheses.**

- The ring is a ring of S-integers of a number field; the degree is one.
- The S-unit rank is Dirichlet's, with the correction for S; Mathlib has the case of the empty S and Tau Ceti records that the correction is absent there.
- The comparison is a comparison of ranks only; the torsion in degree one is the roots of unity of the field.

**Proof outline.**

1. State the degree-one rank and its source.
2. State the period-four value that would be predicted and observe that it differs, by one for the empty S and by one plus the size of S in general.
3. Record the pinned material and the gap Tau Ceti's own file names.
4. Record the rule: the period-four formula is quoted only for degrees at least two, and every use must say so.

**Acceptance.**

- The degree-one rank is the number of archimedean places plus the size of S minus one.
- It is not the period-four value; the two differ already for the empty S.
- The formula is quoted only in degrees at least two.

**Prerequisites.** `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`, `ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant`, `mathlib:NumberField.Units.rank`

**Sources.**

- VI.8.1, Classical Data (PDF p. 512), The source lists degrees zero and one separately from the period-four statement, which is exactly the distinction this node records.

  > The formulas for K_0(O_S) = Z (+) Pic(O_S) and K_1(O_S) = O_S^x ...

## N.3 — Finiteness and ranks (the aggregate)

Together: every group is free of the tabulated rank plus a finite group, and
every positive even group of the S-integers is finite.

**And that is all it gives.** The finite part and the extension are the subject
of N.4, N.5 and N.6; the splitting is not natural.

Coverage: **source_decomposed**.

Two nodes of its own, aggregating its two parts. The first combines finite generation with the rank formula: every group is a free group of the stated rank plus a finite group, every positive even group is finite, and the splitting is not natural. The second is the boundary node: the combination determines nothing about the finite part or the extension, and the three later layers are what supply it, with the case three modulo eight of N.5 as the witness that the rank is far from the answer. The mathematical content of the layer is in its two parts, which are separately decomposed.

### Finite generation and the ranks together

`ArithmeticKTheory:N.3/finiteness-and-ranks-combined` · *theorem*

Combining the two parts: every K-group of a ring of S-integers is a finitely generated abelian group, and for degrees at least two its rank is given by the period-four pattern, so the group is the direct sum of a free group of that rank and a finite group. In particular every positive even K-group is finite, and every odd K-group in degree at least three is a free group of the stated rank plus a finite group whose structure is the subject of the later layers. This is the statement the rest of the roadmap consumes, and it is stated here once.

**Hypotheses.**

- The ring is a ring of S-integers of a number field; the degree is at least two for the rank statement.
- The decomposition into a free part and a finite part is the structure theorem for finitely generated abelian groups and is not canonical.
- Degrees zero and one are given by the first layer and are not covered by the rank formula.

**Proof outline.**

1. Combine the two parts and state the consequence.
2. Record that the splitting into free and torsion parts is not natural, so nothing in the later layers may depend on a chosen splitting.
3. Record the two boundary cases, degrees zero and one, with their own descriptions.
4. Record the contrast with the field, whose positive even groups are infinite.

**Acceptance.**

- Every positive even K-group of a ring of S-integers is finite.
- Every odd K-group in degree at least three is a free group of the stated rank plus a finite group.
- The splitting is not natural.
- Degrees zero and one have their own descriptions.

**Prerequisites.** `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`

**Sources.**

- VI.8.1, Classical Data (PDF p. 512), The combined statement, verbatim.

  > the groups K_n(F) are finite when n is even and nonzero; if n is odd and n >= 3 the groups K_n(F) are the direct sum of a finite group and Z^r

### What the combination does not give: the torsion

`ArithmeticKTheory:N.3/what-the-combination-does-not-give` · *comparison*

Finite generation and the rank formula together determine each group up to its finite part. They do not determine that finite part, and they do not determine the extension of the free part by it. The later layers compute the finite part: N.4 builds the invariant that names its cyclic pieces, N.5 gives the integral structure of the odd groups including the extension data, and N.6 describes the even groups cohomologically. This node records the boundary so that no computation in the atlas stops at the rank and claims a group.

**Hypotheses.**

- The groups are those of a ring of S-integers in degrees at least two.
- The finite part is not determined by the rank, and the source's tables are what determine it.
- The extension data is genuinely needed: for a real number field the odd groups are not simply a free group plus a cyclic group in every residue class modulo eight.

**Proof outline.**

1. State what the combination gives and what it does not.
2. Point at the three later layers and say which piece each supplies.
3. Record the concrete witness: for a degree congruent to three modulo eight the odd group of a real number field has an extra elementary abelian factor and a doubled cyclic factor, so the rank alone is far from the answer.
4. State the rule: no statement of the form that a group IS a free group of the stated rank plus a named cyclic group may be made outside the cases the later layers prove.

**Acceptance.**

- The rank does not determine the finite part.
- The extension data is needed and is supplied by N.5.
- For a real number field the odd groups have extra two-primary factors in some residue classes modulo eight.

**Prerequisites.** `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`

**Sources.**

- VI.9.5 (PDF p. 518), The table that shows how much more than the rank is needed, verbatim.

  > Theorem 9.5. Let O_S be a ring of S-integers in a number field F. Then for each odd n >= 3, the group K_n(O_S) = K_n(F) is given by: (a) If F is totally imaginary, K_n(F) = Z^{r_2} (+) Z/w_i(F); (b) If F has r_1 > 0 real embeddings then, setting i = (n+1)/2, K_n(F) = Z^{r_1+r_2} (+) Z/w_i(F), n = 1 (mod 8); Z^{r_2} (+) Z/2w_i(F) (+) (Z/2)^{r_1-1}, n = 3 (mod 8); Z^{r_1+r_2} (+) ...

## N.4 — Roots of unity with twists

The invariant `W_j(F) = H⁰(F, ℚ/ℤ(j))`, its order `w_j(F)`, and the dyadic
exceptions.

**It is not `μ(F)`.** Over `ℚ` the roots of unity have order 2 and `w₂(ℚ) = 24`.
Mathlib has `μ(F)` complete and nothing of the twisted module, which is exactly
why the confusion is available and must be blocked.

**At 2 the single-tower description fails.** A field is *exceptional* when the
Galois groups of its 2-power cyclotomic extensions are not cyclic for large
exponent. `ℝ` and `ℚ₂` are exceptional, hence so is every real number field —
and some totally imaginary ones, such as `ℚ(√−7)`.

Coverage: **source_decomposed**.

Five nodes. The invariant itself, defined as the Galois invariants of the twisted roots of unity with the e-invariant mapping into it, with cyclicity, the order written only after finiteness and the prime-primary decomposition, and with the two standing examples; its computation from the cyclotomic character, in both the closed formula and the exponent form that makes it a finite check, with the worked cyclotomic example and the restriction and transfer formulas; the dyadic cases, with exceptional fields defined, the fact that every real number field is exceptional recorded, the four cases of the two-primary invariant, and the Harris-Segal summand with its weaker exceptional form; the value twenty-four in degree two over the rationals with its two primary factors and the general divisibility test; and the non-example the stage text names, that the invariant is not the group of roots of unity, with the orders two and twenty-four as the witness.

### The invariant W_i(F) and its order w_i(F)

`ArithmeticKTheory:N.4/the-w-invariant` · *definition* · planet **The invariant w_i(F)**

For a field F with separable closure and absolute Galois group, the map from the torsion of an odd K-group of F to the Galois invariants of the corresponding group for the separable closure is called the e-INVARIANT; its target is the group of Galois invariants of the i-th Tate twist of the roots of unity, which is exactly the zeroth cohomology of the Galois group with coefficients in that twist. When that group is finite it is cyclic, and w_i(F) denotes its order, so that the group is cyclic of that order; the notation w_i(F) is used only after finiteness has been proved. The l-primary part is written with a superscript and the order is the product over the primes of the l-primary orders, which is the prime-primary decomposition the stage text asks for.

**Hypotheses.**

- F is a field; for the arithmetic applications it is a number field, where finiteness holds for every positive i.
- The twist is the i-th Tate twist of the group of roots of unity of the separable closure, as a Galois module; neither pinned library defines it for any i, although Tau Ceti has the roots of unity of the separable closure as a discrete Galois module.
- The order is written only after finiteness; for i zero the group is not finite and the notation is not used.

**Proof outline.**

1. Define the twisted module and the Galois invariants, and record that the pinned library has the untwisted case only.
2. Define the e-invariant as the map from the torsion of the odd K-group to those invariants, and record that it is natural in the field.
3. Prove that the invariants form a cyclic group when finite, and define the order.
4. Define the l-primary invariants and prove the product decomposition.
5. Record the two standing examples the source gives: for a finite field the invariant is one less than the i-th power of the cardinality, which is the order of the odd K-group, and for the rationals the invariant in odd i is two.
6. Record what is absent at the pins: the twisted module, the invariants, the finiteness and the decomposition.

**Acceptance.**

- For a finite field the invariant is one less than the i-th power of the cardinality, which is the order of the corresponding odd K-group.
- For the rationals the invariant in odd i is two.
- The group is cyclic when finite, and the order is the product of its l-primary orders.
- The invariant is NOT the group of roots of unity of F; that is the subject of a later node.

**Prerequisites.** `mathlib:rootsOfUnity`, `tauceti:TauCeti.KummerCoeff`, `K2SymbolsBrauer:T.7`

**API.**

| name | role | statement |
| --- | --- | --- |
| `twistedRootsOfUnity` | data | The i-th Tate twist of the roots of unity as a Galois module. |
| `WInvariant` | data | Its group of Galois invariants, the module W_i(F). |
| `WInvariant.finite` | characterisation | Finiteness for a number field and positive i. |
| `WInvariant.isCyclic` | characterisation | Cyclicity when finite. |
| `wInvariant` | data | Its order, defined only after finiteness. |
| `wInvariant.prod_primary` | compatibility | The product decomposition over the primes. |
| `eInvariant` | data | The e-invariant out of the torsion of the odd K-group. |

**Used by.**

- *N.5* — The torsion of every odd K-group in the tables is a cyclic group of order this invariant, or a small modification of it.
- *N.6* — The even groups are described cohomologically and their orders involve the same invariant.
- *SpecialValuesBirchTate B.1* — The Birch-Tate roadmap uses the same invariant in degree two and gives it the same warning.

**Unit tests.**

- `finite_field` — For a finite field the invariant is one less than the i-th power of the cardinality.
- `rationals_odd` — For the rationals and odd i the invariant is two.
- `cyclic` — The group is cyclic when finite.
- `not_mu` — The invariant is not the order of the group of roots of unity of the field; the two differ already for the rationals in degree two.

**Sources.**

- VI.2.1 (PDF p. 469), The definition with the cyclicity, the order and the prime-primary decomposition, verbatim.

  > Definition 2.1. Let F be a field, with separable closure and Galois group G. Since K_*(F) -> K_*(Fbar) is a homomorphism of G-modules, with G acting trivially on K_n(F), it follows that there is a natural map e : K_{2i-1}(F)_tors -> (K_{2i-1}(Fbar)_tors)^G = (mu^{(i)})^G. We shall call e the e-invariant. If (mu^{(i)})^G is a finite group it is cyclic, and we write w_i(F) for its order. If ...

- VI.2.1.1 and 2.1.2 (PDF p. 469), The two standing examples, verbatim.

  > Example 2.1.1 (finite fields). It is a pleasant exercise to show that w_i(F_q) = q^i - 1 for all i. Since this is the order of K_{2i-1}(F_q) ... Example 2.1.2. If i is odd, w_i(Q) = 2.

### Computing the invariant from the cyclotomic character

`ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character` · *theorem*

Fix an odd prime and a field of characteristic different from it. Let a be maximal such that the field obtained by adjoining a primitive root of unity of that prime contains a primitive root of unity of the a-th power, and let r be the degree of that extension. Writing i as a power of the prime times a prime-to-it factor, the l-primary invariant is the prime to the power a plus that exponent when r divides i, and one otherwise. Equivalently, and this is the form used in practice, the l-primary invariant is the largest power such that the Galois group of the field obtained by adjoining the corresponding roots of unity has exponent dividing i. The description is by the cyclotomic character, and the restriction and transfer formulas follow from it.

**Hypotheses.**

- The prime is odd for the displayed formula; the case of the prime two is the subject of the next nodes and is genuinely different.
- The field has characteristic different from the prime.
- The equivalent formulation by exponents is the source's lemma and is what makes the computation finite.

**Proof outline.**

1. State the formula with its two cases and the definition of the two parameters.
2. State the equivalent description as a maximum over the cyclotomic extensions with exponent dividing i, and prove that the two agree.
3. Derive the two special cases the source gives: when the field contains the primitive root of the prime, and the values for a cyclotomic field.
4. Derive the restriction and transfer formulas for a finite extension from the description.
5. Record what is pinned: Mathlib has the cyclotomic extensions, their Galois groups, primitive roots and the modular cyclotomic character; what is missing is the invariant itself.

**Acceptance.**

- For a cyclotomic field of prime-power conductor the primary invariant is given by the displayed formula.
- For an odd prime not dividing the conductor the invariant is the one of the rationals, which is one unless the prime minus one divides i.
- The description by exponents makes the computation a finite check.

**Prerequisites.** `ArithmeticKTheory:N.4/the-w-invariant`, `mathlib:IsCyclotomicExtension`, `mathlib:modularCyclotomicCharacter.toFun`

**Sources.**

- VI.2.2 and Lemma 2.2.1 (PDF p. 470), The computation and its equivalent form, verbatim.

  > Proposition 2.2. Fix a prime l not 2, and let F be a field of characteristic not l. Let a be maximal such that F(zeta_l) contains a primitive l^a-th root of unity and set r = [F(zeta_l) : F]. If i = c l^b, where l does not divide c, then the numbers w^{(l)}_i = w^{(l)}_i(F) are l^{a+b} if r divides i, and 1 otherwise. ... Lemma 2.2.1. w^{(l)}_i(F) = max { l^v : Gal(F(zeta_{l^v})/F) has ...

- VI.2.2.2 (PDF p. 470), The worked cyclotomic example, verbatim.

  > Example 2.2.2. Consider F = Q(zeta_{p^a}). If i = c p^b then w^{(p)}_i(F) = p^{a+b} (p not 2). If l is not 2 or p then w^{(l)}_i(F) = w^{(l)}_i(Q) for all i. This number is 1 unless (l-1) divides i; if (l-1) divides i but l does not divide i then w^{(l)}_i(F) = l.

### The prime two: exceptional fields and the real-embedding distinction

`ArithmeticKTheory:N.4/exceptional-fields-at-two` · *comparison*

At the prime two the description by a single cyclic tower fails, because the automorphism group of the two-power roots of unity has two involutions once the exponent is at least three. A field of characteristic zero is called EXCEPTIONAL when the Galois groups of its two-power cyclotomic extensions are not cyclic for large exponent, and non-exceptional otherwise. The real numbers and the two-adic numbers are exceptional, and so is every subfield of either, so every real number field is exceptional; some totally imaginary fields are exceptional too, and the source names one. The two-primary invariant then has four cases according to whether the field contains a square root of minus one, whether it is exceptional and whether i is even, and the Harris-Segal summand of the odd K-group exists only in the non-exceptional case, with a weaker statement otherwise.

**Hypotheses.**

- The prime is two and the field has characteristic zero.
- Exceptionality is a property of the field, defined by the non-cyclicity of the Galois groups of the two-power cyclotomic extensions for large exponent.
- The four cases of the two-primary invariant are as the source lists them, and the case where the field is exceptional and i is even is proved by a separate argument.

**Proof outline.**

1. Define exceptional and non-exceptional fields.
2. Record that the reals and the two-adics are exceptional and that so are their subfields, so every real number field is exceptional; record the source's totally imaginary example.
3. State the four cases of the two-primary invariant.
4. State the Harris-Segal theorem in the non-exceptional case: the odd K-group has a cyclic direct summand of order the invariant, detected by the e-invariant.
5. State the weaker exceptional statement: there is a cyclic summand whose order is the invariant, twice it, or half it, obtained by a transfer argument along the extension by a square root of minus one.
6. Record the rule the stage text asks for: the single-tower description at odd primes does not cover the dyadic cases, and every statement at two must name which case it is in.

**Acceptance.**

- Every real number field is exceptional, so the dyadic exceptions are not a corner case in this roadmap.
- Some totally imaginary fields are exceptional; the source names the field obtained by adjoining a square root of minus seven.
- In the non-exceptional case the odd K-group has a cyclic summand of order the invariant, split by the Harris-Segal map.
- In the exceptional case only the weaker statement holds, and the order may be twice or half the invariant.

**Prerequisites.** `ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`

**Sources.**

- VI.2.2.2, the discussion at the prime two (PDF p. 470), The definition, verbatim.

  > The situation is more complicated when l = 2, because Aut(mu_{2^v}) = (Z/2^v)^x contains two involutions if v >= 3. We say that a field F is exceptional if char(F) = 0 and the Galois groups Gal(F(zeta_{2^v})/F) are not cyclic for large v. If F is not exceptional, we say that it is non-exceptional.

- VI.2.2, the remark on exceptional fields (PDF p. 470), Which fields are exceptional, verbatim.

  > Both R and Q_2 are exceptional, and so are each of their subfields. In particular, real number fields (like Q) are exceptional, and so are some totally imaginary number fields, like Q(sqrt(-7)).

- Harris-Segal Theorem VI.2.5 and Remark 2.5.1 (PDF pp. 472 to 473), The theorem and its exceptional weakening, verbatim.

  > Harris-Segal Theorem 2.5. Let F be a field with 1/l in F; if l = 2, we also suppose that F is non-exceptional. Set w_i = w^{(l)}_i(F). Then each K_{2i-1}(F) has a direct summand isomorphic to Z/w_i, detected by the e-invariant. ... Remark 2.5.1. If F is an exceptional field, a transfer argument using F(sqrt(-1)) shows that there is a cyclic summand in K_{2i-1}(F) whose order is either ...

### The value in degree two over the rationals, and the divisibility tests

`ArithmeticKTheory:N.4/w2-of-the-rationals-and-the-divisibility-tests` · *theorem*

For the rationals the invariant in degree two is twenty-four. The general test for divisibility of the invariant by a power of a prime is the cyclotomic criterion of the previous nodes: the power divides the invariant exactly when the Galois group of the corresponding cyclotomic extension has exponent dividing i, which is a finite check inside a cyclotomic subfield. This node records the value, the test and the arithmetic it rests on, and is the computation the Birch-Tate roadmap also asks for.

**Hypotheses.**

- The field is the rationals and i is two; the value is the product of the primary values.
- The test is the equivalent description of the previous node and is applied prime by prime.
- The value twenty-four is the one that appears in the Birch-Tate formula for the rationals together with the order two of the second K-group of the integers.

**Proof outline.**

1. Compute the odd primary parts from the cyclotomic criterion: the only odd primes contributing are those with the prime minus one dividing two, namely two and three, and the three-part is three.
2. Compute the two-primary part, using that the rationals are exceptional, which gives eight.
3. Multiply to obtain twenty-four.
4. State the general divisibility test and record that it is a finite check.
5. Record the appearance of the value in the Birch-Tate formula for the rationals, with the order of the second K-group of the integers equal to two and the zeta value minus one twelfth.

**Acceptance.**

- The invariant in degree two over the rationals is twenty-four.
- The three-part is three and the two-part is eight.
- The general test is a finite check inside a cyclotomic subfield.
- The value is not the order of the group of roots of unity of the rationals, which is two.

**Prerequisites.** `ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character`, `ArithmeticKTheory:N.4/exceptional-fields-at-two`, `SpecialValuesBirchTate:B.3`

**Sources.**

- VI.8.7 area, the Birch-Tate discussion (PDF p. 514), The value, verbatim, with the two companion numbers that the Birch-Tate formula relates.

  > For example, when F = Q we have zeta_Q(-1) = -1/12, |K_2(Z)| = 2 and w_2(Q) = 24.

### The invariant is not the group of roots of unity

`ArithmeticKTheory:N.4/the-invariant-is-not-the-roots-of-unity` · *comparison*

The group whose order is this invariant is the Galois invariants of a TWISTED module, and it is not the group of roots of unity of the field. They agree when i is one, and they differ in general: over the rationals the roots of unity form a group of order two while the invariant in degree two is twenty-four. This node states the distinction as a non-example, because the stage text names it and because the group of roots of unity is exactly what a formalisation has ready to hand: Mathlib has the torsion of the unit group with its order and its identification with the roots of unity, and nothing of the twisted module.

**Hypotheses.**

- The field is a number field; i is a positive integer.
- For i equal to one the twist is trivial and the two groups agree.
- The pinned library has the untwisted object completely and the twisted one not at all, which is why the confusion is available and must be blocked.

**Proof outline.**

1. State the two objects and the map between them for i equal to one.
2. State the non-example over the rationals in degree two, with both numbers.
3. Record the pinned material for the untwisted object and the absence of the twisted one.
4. Record the rule: the invariant is written only for the twisted module, and no statement about roots of unity may be substituted for it.

**Acceptance.**

- For i equal to one the two groups agree.
- Over the rationals in degree two they have orders two and twenty-four.
- The pinned library has only the untwisted object.

**Prerequisites.** `ArithmeticKTheory:N.4/the-w-invariant`, `ArithmeticKTheory:N.4/w2-of-the-rationals-and-the-divisibility-tests`, `mathlib:NumberField.Units.torsion`

**Sources.**

- VI.2.1.2 (PDF p. 469), The source computes the invariant for the rationals separately in odd and even i, and the even values are not the order of the group of roots of unity; the degree-two value twenty-four is quoted in the previous node.

  > Example 2.1.2. If i is odd, w_i(Q) = 2.

## N.5 — Odd groups, including extension data

The integral structure, not merely the rank or the completion.

For `F` totally imaginary and `n = 2j−1 ≥ 3`: `ℤ^{r₂} ⊕ ℤ/w_j(F)`. For `r₁ > 0`
the answer depends on `n` modulo **eight**, with a doubled cyclic factor and an
elementary abelian factor at `n ≡ 3`, and a halved one at `n ≡ 5` — where the
needed divisibility is part of the theorem.

**The splittings are not natural; the maps are.** What must be carried is the
e-invariant, the Chern maps, their kernels and the extension classes. A proof by
matching cardinalities is not a proof: two of the four rows differ only in which
cyclic factor is doubled or halved.

Coverage: **source_decomposed**.

Four nodes. The odd isomorphism restated for this layer, with its failure in degree one; the table for a totally imaginary field in all four degree ranges, which includes the prime two because that is exactly the hypothesis that makes the cohomological dimension two, and which the source says covers exceptional totally imaginary fields; the four rows modulo eight for a field with a real embedding, with the doubling in the case three, the halving in the case five and the divisibility that makes the halving an integer, and with the degeneration to the totally imaginary table when there are no real places as a unit test; and the node that says what is natural, namely the e-invariant, the Chern maps, their kernels and the extension classes, and what is not, namely the splittings, together with the stage text's rule that a proof by matching cardinalities is not a proof.

### The odd groups of the S-integers and of the field agree

`ArithmeticKTheory:N.5/odd-groups-of-ring-and-field-agree` · *theorem*

For every j at least two the odd K-group of the ring of S-integers maps isomorphically onto that of the field. This is the odd half of Soule's theorem of N.2, restated here because it is what makes the tables of this layer statements about either object, and because the stage text asks for it by name. It is not a consequence of exactness of the localisation sequence and it fails in degree one, where the unit group of the ring is finitely generated and the multiplicative group of the field is not.

**Hypotheses.**

- The ring is a ring of S-integers in a number field, so its fraction field is a global field.
- The degree is odd and at least three; in degree one the statement is false.
- The theorem is Soule's and is proved in N.2 from the mod-l localisation sequence.

**Proof outline.**

1. Restate the theorem from N.2 with the arithmetic hypotheses.
2. Record the failure in degree one and why: the residue terms of the sequence in that degree are the unit groups of the residue fields, which are not zero.
3. Record the consequence for this layer: the tables may be stated for the ring or for the field and mean the same thing in odd degrees at least three.
4. Record the even-degree companion, the short exact sequence, which N.6 uses.

**Acceptance.**

- In odd degrees at least three the two groups agree.
- In degree one they do not.
- In even degrees at least two there is a short exact sequence, not an isomorphism.

**Prerequisites.** `ArithmeticKTheory:N.2/soule-odd-isomorphism`

**Sources.**

- VI.9.5 (PDF p. 518), The source states the tables for the ring and the field at once, using exactly this identification, verbatim.

  > Theorem 9.5. Let O_S be a ring of S-integers in a number field F. Then for each odd n >= 3, the group K_n(O_S) = K_n(F) is given by: ...

### The integral structure for a totally imaginary field

`ArithmeticKTheory:N.5/totally-imaginary-integral-structure` · *theorem* · planet **The totally imaginary table**

For a totally imaginary number field and a ring of S-integers the K-groups are: in degree zero the sum of the integers and the class group; in degree one the free group of rank the number of complex places plus the size of S minus one, together with a cyclic group of order the invariant in degree one; in even degrees at least two the sum over the primes of the second cohomology of the ring with one inverted prime and the appropriate twist; and in odd degrees at least three the free group of rank the number of complex places together with a cyclic group of order the invariant. The odd rows are the integral structure of the stage text, not merely the rank or the completion.

**Hypotheses.**

- F is totally imaginary, which Mathlib expresses as the absence of real places; S is a finite set of finite places.
- The cohomology in even degrees is etale cohomology of the ring with one prime inverted, with the twist given by the degree; N.6 states it in full.
- The odd rows depend on the invariant of N.4, which for a totally imaginary field has no exceptional correction beyond what the general case gives.

**Proof outline.**

1. State the four rows of the theorem.
2. Record how the degree-zero and degree-one rows come from the first layer and the ranks from the third.
3. Record how the odd torsion comes from the cohomological description at each prime and the Harris-Segal summand.
4. Record that the case of the prime two is included here because the field is totally imaginary, which is exactly the hypothesis under which the odd-prime argument applies at two as well.
5. Record the source's note that this includes exceptional totally imaginary fields.

**Acceptance.**

- In odd degrees at least three the group is free of rank the number of complex places plus a cyclic group of order the invariant.
- The theorem covers the prime two because the field is totally imaginary.
- It includes exceptional totally imaginary fields, which the source says explicitly.
- The degree-one row has the S-correction in its rank and the invariant in degree one as its torsion.

**Prerequisites.** `ArithmeticKTheory:N.5/odd-groups-of-ring-and-field-agree`, `ArithmeticKTheory:N.4/the-w-invariant`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `mathlib:NumberField.IsTotallyComplex`

**Sources.**

- VI.8.4 (PDF p. 513), The four rows, verbatim.

  > Theorem 8.4. Let F be a totally imaginary number field, and let O_S be the ring of S-integers in F for some set S of finite places. Then: K_n(O_S) = Z (+) Pic(O_S), for n = 0; Z^{r_2+|S|-1} (+) Z/w_1(F), for n = 1; (+)_l H^2_et(O_S[1/l]; Z_l(i+1)) for n = 2i >= 2; Z^{r_2} (+) Z/w_i(F) for n = 2i-1 >= 3.

- VI.8.4, the preceding remark (PDF p. 513), The scope of the theorem, verbatim.

  > we obtain a description of K_*(O_S) when F is totally imaginary. This includes exceptional number fields such as Q(sqrt(-7)).

### The integral structure for a field with a real embedding

`ArithmeticKTheory:N.5/the-real-case-modulo-eight` · *theorem* · planet **The real case modulo eight**

For a number field with at least one real embedding and an odd degree at least three, writing i for half of one more than the degree, the K-group is: the free group of rank the number of archimedean places together with a cyclic group of order the invariant, when the degree is one modulo eight; the free group of rank the number of complex places together with a cyclic group of order twice the invariant and an elementary abelian group of rank one less than the number of real places, when the degree is three modulo eight; the free group of rank the number of archimedean places together with a cyclic group of order half the invariant, when the degree is five modulo eight; and the free group of rank the number of complex places together with a cyclic group of order the invariant, when the degree is seven modulo eight. The divisibility needed in the third case — that the invariant is even there — is part of the theorem, and the direct-sum decompositions are not natural.

**Hypotheses.**

- F has at least one real embedding; the ring is a ring of S-integers, and by the first node the answer is the same for the field.
- The invariant is the one of N.4 at the prime two together with the odd part; the halving in the case five modulo eight requires that the invariant be even, which holds there.
- The decompositions are of abstract groups; what is natural is the e-invariant and the Chern maps, their kernels and the extension classes, which the next node states.

**Proof outline.**

1. State the four rows with the parameter i.
2. Record the two inputs: the rank from Borel's theorem and the odd torsion from the cohomological description; what remains is the two-primary torsion.
3. Record that the two-primary calculation is the content and that it is the subject of the source's chapter section on real number fields.
4. Prove or record the divisibility in the case five modulo eight, namely that the invariant is even there, so that half of it is an integer.
5. State explicitly that the decompositions are not natural and that no argument may transport a splitting.
6. Record the sanity check: for a totally imaginary field the table degenerates to the previous node's odd row, and the extra factors in the case three modulo eight disappear when there are no real places.

**Acceptance.**

- In the case three modulo eight there is an elementary abelian factor of rank one less than the number of real places and the cyclic factor is doubled.
- In the case five modulo eight the cyclic factor is half the invariant, which requires the invariant to be even there.
- For no real places the table degenerates to the totally imaginary one.
- The decompositions are not natural.

**Prerequisites.** `ArithmeticKTheory:N.5/totally-imaginary-integral-structure`, `ArithmeticKTheory:N.4/exceptional-fields-at-two`, `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`

**Sources.**

- VI.9.5 (PDF p. 518), The four rows with the source’s own remark on what determines them, verbatim.

  > Theorem 9.5. ... (b) If F has r_1 > 0 real embeddings then, setting i = (n+1)/2, K_n(F) = Z^{r_1+r_2} (+) Z/w_i(F), n = 1 (mod 8); Z^{r_2} (+) Z/2w_i(F) (+) (Z/2)^{r_1-1}, n = 3 (mod 8); Z^{r_1+r_2} (+) Z/(1/2)w_i(F), n = 5 (mod 8); Z^{r_2} (+) Z/w_i(F), n = 7 (mod 8). Note that these groups are determined only by the numbers r_1, r_2 of real and complex places of F.

- VI.9.5, the proof (PDF p. 528 of the combined draft), The structure of the proof, verbatim; it is why the two-primary calculation is the content of this node.

  > Proof. Part (a), when F is totally imaginary, is given by Theorem 8.4. In case (b), since the rank is classically known (see 8.1), and K_n(O_S) = K_n(F) by V.6.8, it suffices to determine the torsion subgroup of K_n(O_S). The odd torsion is given by Theorem 8.2, so we need only worry about the 2-primary torsion.

### What is natural in the tables, and what is not

`ArithmeticKTheory:N.5/naturality-of-the-e-invariant-and-extensions` · *comparison*

The direct-sum decompositions of the previous two nodes are decompositions of abstract abelian groups and are not natural in the field. What IS natural, and what a formalisation must carry, is the e-invariant of N.4, the etale Chern maps that produce the cohomological descriptions, their kernels, and the extension classes by which the groups are assembled. The stage text says this in as many words, and it also says that the proof is not assembled by matching cardinalities: two finitely generated abelian groups with the same order and rank need not be isomorphic, and the tables are proved by identifying the maps, not the numbers.

**Hypotheses.**

- The naturality is in the field and in the set S, for the maps induced by inclusions.
- The Chern maps are owned by MotivicEtaleKTheory, which proves their compatibility with residues, norms and products.
- The extension classes are the ones appearing when a spectral sequence or an exact sequence determines the group only up to an extension.

**Proof outline.**

1. State which pieces of data are natural and which are not.
2. Record the owner of the Chern maps and the exact compatibilities that owner proves.
3. Record the non-example the stage text implies: an isomorphism of groups obtained by comparing orders is not a proof, and two of the four rows of the previous node differ from one another only by which cyclic factor is doubled or halved, so orders alone cannot distinguish them.
4. Record the rule for the atlas: any statement that a K-group equals a named group must cite the theorem that identifies the maps, not a computation of the order.

**Acceptance.**

- The e-invariant and the Chern maps are natural; the splittings are not.
- An identification by cardinality is not a proof of the group structure.
- The extension classes must be carried whenever a sequence determines only a filtration.

**Prerequisites.** `ArithmeticKTheory:N.5/the-real-case-modulo-eight`, `MotivicEtaleKTheory:M.8`, `MotivicEtaleKTheory:M.7`

**Sources.**

- VI.9.5, the closing remark (PDF p. 518), The source records that the ABSTRACT groups are determined by these numbers; the naturality statements of this node are about the maps, and the packet does not attribute them to this sentence.

  > Note that these groups are determined only by the numbers r_1, r_2 of real and complex places of F and the invariants w_i(F).

## N.6 — Even groups and arithmetic cohomology

Cohomological descriptions, the two-primary corrections, the two kernels, and
the certificate discipline.

The clean description holds at a prime where `cd_ℓ(O_S) = 2` — which at `ℓ = 2`
is *why* the field must be totally imaginary. With a real embedding the answer
is an eight-fold table containing an **extension**, not a direct sum, and an
intermediate rank `ρ` that the theorem does not determine.

**A certificate has four fields**: a presentation, verified relations, a proved
surjection, and a certified order or kernel. Three give only an upper bound, and
a zeta value is admitted only as a *proved* second bound — never as a definition
of an order.

Coverage: **source_decomposed**.

Four nodes. The cohomological description of the primary parts at a prime where the cohomological dimension is two, with the totally imaginary hypothesis at the prime two stated as the hypothesis it is; the eight-fold two-primary table for a field with a real embedding, with the intermediate rank that the theorem does not determine, the vanishing in one residue class, the EXTENSION in another which must be carried rather than split, and the divisibility companion for a totally real field; the tame and wild kernels as distinct objects, with the divisible subgroup, the source's identification of it with the wild kernel as a theorem with an attribution, and the stage text's rule that the identification may not be assumed in an exceptional dyadic case; and the certificate discipline, defined as a record of four fields with the lemma that three of them give only an upper bound and with the two zeta-value theorems admitted only as proved second bounds, never as a definition of an order.

### The even groups at a prime where the cohomological dimension is two

`ArithmeticKTheory:N.6/even-groups-at-odd-primes` · *theorem* · planet **The cohomological description of the even groups**

Fix a prime, and for the prime two assume the field totally imaginary. Then for every degree at least two the primary part of the K-group of a ring of S-integers is: in even degree, the second etale cohomology of the ring with that prime inverted, with the twist one more than half the degree; in odd degree, a free part of the rank given by Borel's theorem together with a cyclic group of order the primary invariant, with the rank depending on the parity of the index. This is the cohomological description the stage text asks for, and it is available exactly in the cases where the cohomological dimension of the ring at that prime is two, which is why the field must be totally imaginary when the prime is two.

**Hypotheses.**

- The prime is arbitrary; if it is two the field is totally imaginary, which is the cohomological-dimension hypothesis.
- The cohomology is etale cohomology of the ring with the prime inverted, with coefficients the twisted prime-adic integers.
- The description is of the primary part; the whole group is assembled from the primary parts and the free part.

**Proof outline.**

1. State the theorem in its three rows.
2. Record the input from the localisation sequence: the residue terms at the primes above the prime have no torsion at that prime, which is Quillen's finite-field computation.
3. Record the spectral sequence that degenerates in this range and the extension problem it leaves, which is easily solved here; the general case is the next node.
4. Record the owner of the comparison that produces the cohomological description, which is MotivicEtaleKTheory.
5. Record what the pinned libraries have towards it, which is nothing: there is no etale cohomology of arithmetic schemes and no motivic-to-etale comparison.

**Acceptance.**

- In even degrees the primary part is a single cohomology group.
- In odd degrees it is a free part plus a cyclic group of order the primary invariant.
- For the prime two the totally imaginary hypothesis is needed; without it the description is the next node's.
- The residue terms of the localisation sequence contribute nothing at the prime, which is why the description is clean.

**Prerequisites.** `MotivicEtaleKTheory:M.7`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `ArithmeticKTheory:N.4/the-w-invariant`

**Sources.**

- VI.8.2 (PDF p. 513), The theorem with its three rows and its hypothesis at the prime two, verbatim.

  > Theorem 8.2. Let F be a number field, and let O_S be a ring of integers in F. Fix a prime l; if l = 2 we suppose F totally imaginary. Then for all n >= 2: K_n(O_S)_{(l)} = H^2_et(O_S[1/l]; Z_l(i+1)) for n = 2i > 0; Z^{r_2}_{(l)} (+) Z/w^{(l)}_i(F) for n = 2i-1, i even; Z^{r_2+r_1}_{(l)} (+) Z/w^{(l)}_i(F) for n = 2i-1, i odd.

### The two-primary corrections for a field with a real embedding

`ArithmeticKTheory:N.6/the-two-primary-corrections` · *theorem* · planet **The two-primary table**

For a number field with at least one real embedding and a ring of S-integers containing one half, write j for the signature defect and the invariant for its two-primary part. Then there is an integer between the signature defect and the number of real places such that for every degree at least two the two-primary part of the K-group is given by an eight-fold table: a second cohomology group in degrees zero, two and six modulo eight, with a modified group in degree six; a group of order two in degree one; an elementary abelian group of rank one less than the number of real places together with a cyclic group of order twice the invariant in degree three; an extension of a second cohomology group by an elementary abelian group of that intermediate rank in degree four; zero in degree five; and a cyclic group of order the invariant in degree seven. The real places genuinely change the answer, and the intermediate rank is not determined by the obvious invariants.

**Hypotheses.**

- F has at least one real embedding and the ring contains one half; the signature defect is the source's invariant of the ring.
- The intermediate integer lies between the signature defect and the number of real places and is not further determined by the theorem; that is part of the statement.
- The odd rows agree with the table of N.5, which the source's proof uses in the other direction.

**Proof outline.**

1. State the eight rows of the table with the parameters named.
2. Record that the odd rows are the previous layer's theorem, so that the two tables are consistent.
3. Record the two-primary input, the descent spectral sequence with real places, and the extension it leaves in degree four modulo eight, which is where the intermediate rank appears.
4. Record that the group in degree four modulo eight is an extension and not a direct sum, so the extension data must be carried.
5. Record the companion divisibility statement for totally real fields, that a power of two divides the order of the even groups.
6. Record the owner of the corrected sequences, MotivicEtaleKTheory.

**Acceptance.**

- In degree five modulo eight the two-primary part vanishes.
- In degree four modulo eight the group is an extension, not a direct sum.
- The intermediate rank is not determined by the number of real places alone.
- For a totally real field a power of two equal to the number of real places divides the order of the even groups.

**Prerequisites.** `ArithmeticKTheory:N.6/even-groups-at-odd-primes`, `ArithmeticKTheory:N.5/the-real-case-modulo-eight`, `MotivicEtaleKTheory:M.7`

**Sources.**

- VI.9.11 (PDF p. 523), The eight rows, verbatim; the fourth row is an extension, which the source writes with a semidirect-product symbol and which this packet records as an extension.

  > Theorem 9.11. Let F be a number field with at least one real embedding, and let R = O_S denote a ring of integers in F containing 1/2. Let j be the signature defect of R, and write w_i for w^{(2)}_i(F). Then there is an integer rho, j <= rho < r_1, such that, for all n >= 2, the two-primary subgroup K_n(O_S){2} of K_n(O_S) is isomorphic to: H^2_et(R; Z_2(4k+1)) for n = 8k, Z/2 for n = ...

- VI.9.12 (PDF p. 524), The divisibility companion, verbatim.

  > Theorem 9.12. Let F be a totally real number field, with r_1 real embeddings, and let O_S be a ring of integers in F. Then for all even i > 0, 2^{r_1} divides |K_{2i-2}(O_S)|.

### Tame and wild kernels, and the divisible subgroup

`ArithmeticKTheory:N.6/tame-and-wild-kernels` · *definition*

The TAME kernel of a number field in degree two is the kernel of the sum of the tame symbols, equivalently the image of the second K-group of the ring of integers; the WILD kernel in degree two j is the intersection, over all valuations of the field, of the kernels of the maps to the K-groups of the completions. They are different objects and the stage text insists that they be developed as such. The divisible subgroup of the even K-group of the field is isomorphic to the wild kernel, a theorem of the source's later reference; the identification is NOT to be asserted in every exceptional dyadic case without that theorem, and this node records the boundary.

**Hypotheses.**

- The field is a number field; the completions are at all places, archimedean ones included.
- The tame kernel is a degree-two object and is owned by K2SymbolsBrauer; the wild kernel is defined in every even degree.
- The divisible subgroup is the subgroup of infinitely divisible elements of the even K-group of the field, which is non-trivial already in degree two, as the source records.

**Proof outline.**

1. Define the tame kernel and record its owner and its exact sequence.
2. Define the wild kernel as the intersection of the kernels of the localisation maps.
3. Record the source's statement that the divisible subgroup of the even K-group is isomorphic to the wild kernel, with its attribution.
4. Record the source's observation that the divisible subgroup can be non-zero already in degree two, which is why the notion is not vacuous.
5. State the rule the stage text asks for: no equality of the wild kernel with the divisible subgroup may be asserted in an exceptional dyadic case without citing the theorem that proves it.
6. Record the comparison with the Selmer-type kernels that the cohomological description produces.

**Acceptance.**

- The tame and wild kernels are different objects and are defined in different degrees.
- The divisible subgroup can be non-zero, already in degree two.
- Its identification with the wild kernel is a theorem with an attribution and may not be assumed in the dyadic exceptional cases.

**Prerequisites.** `ArithmeticKTheory:N.2/the-three-classical-rows`, `K2SymbolsBrauer:T.5`, `ArithmeticKTheory:N.6/even-groups-at-odd-primes`

**API.**

| name | role | statement |
| --- | --- | --- |
| `tameKernel` | data | The tame kernel in degree two, the kernel of the sum of the tame symbols. |
| `wildKernel` | data | The wild kernel in degree two j, the intersection of the kernels of the localisation maps. |
| `divisibleSubgroup` | data | The subgroup of infinitely divisible elements of an even K-group of the field. |
| `wildKernel_eq_divisible` | characterisation | The identification of the two, as a theorem with its attribution. |
| `tameKernel_ne_wildKernel` | relation | The two kernels are different objects and are not substituted for one another. |
| `wildKernel_le` | compatibility | The wild kernel is contained in the kernel of every single localisation map. |

**Used by.**

- *N.6, the cohomological descriptions* — The Selmer-type kernels those descriptions produce are compared with these two.
- *K2SymbolsBrauer T.5* — The tame kernel in degree two is owned there and is imported by name.
- *N.8, the certified examples* — A certified computation of an even group must say which kernel it has bounded.

**Unit tests.**

- `divisible_nonzero` — The divisible subgroup can be non-zero, already in degree two; the notion is not vacuous.
- `tame_vs_wild` — The tame kernel is a degree-two object and the wild kernel is defined in every even degree; they are not the same.
- `identification_is_a_theorem` — The identification of the wild kernel with the divisible subgroup is a theorem and may not be assumed in an exceptional dyadic case.
- `contained_in_each_kernel` — The wild kernel is contained in the kernel of each single localisation map, the degenerate check of the definition.

**Sources.**

- V.6.8, the discussion after the theorem (PDF p. 412), The definition of the wild kernel and its comparison with the divisible subgroup, verbatim, with the source’s attribution.

  > Tate observed that div K_n(F) can be nonzero even for K_2. In fact, div K_{2i}(F) is isomorphic to the wild kernel, defined as the intersection (over all valuations v on F) of the kernels of all maps K_{2i}(F) -> K_{2i}(F_v).

### Certificate-driven computation of an arithmetic K-group

`ArithmeticKTheory:N.6/certificate-driven-computation` · *construction*

A computation of one of these groups is accepted when it comes with a certificate: a finite presentation of the group, a verification that the proposed relations hold, a proof that the proposed generators generate, and an independent certification of the order or of the kernel, either from the cohomological description of this layer or from a second proved bound. The construction is a METHOD, reusable across the examples of the roadmap, and it is deliberately not an oracle: a zeta value does not define a group order, and a match of orders is not an isomorphism. Tau Ceti has a general presentation interface for the Grothendieck group of an exact category, which is the categorical analogue of the first half, and nothing arithmetic.

**Hypotheses.**

- The group is one of the K-groups of a ring of S-integers in a degree where this layer or N.5 gives a description.
- The certificate consists of four independent pieces and each must be checked; three of them are not enough.
- The second bound must be proved, not quoted from a conjectural formula; the Birch-Tate formula is a theorem only in the cases its own roadmap proves.

**Proof outline.**

1. Define the certificate as a record of four fields: the presentation, the verification of relations, the surjectivity of the generating map, and the certified order or kernel.
2. Record the two ways the fourth field may be supplied, cohomologically or by a second bound.
3. Prove the elementary lemma that a surjection onto a group of the certified order from a group of the same order is an isomorphism, which is where the two halves meet.
4. Record the non-example: a surjection onto a group with a matching upper bound but no lower bound is not an isomorphism, and an order taken from a zeta value is not a proof.
5. Record the pinned analogue, Tau Ceti's presentation interface for the Grothendieck group, and what it does and does not give.
6. Record the instances the roadmap's last layer will run this method on.

**Acceptance.**

- A certificate with all four fields determines the group.
- Three fields do not: a presentation with verified relations and a surjection gives only an upper bound.
- An order read off a zeta value is not a certification; the Birch-Tate formula is a theorem only where its own roadmap proves it.
- The method is reusable and is the one the examples layer uses.

**Prerequisites.** `ArithmeticKTheory:N.6/the-two-primary-corrections`, `K2SymbolsBrauer:T.5`, `tauceti:TauCeti.ExactK0`

**API.**

| name | role | statement |
| --- | --- | --- |
| `KCertificate` | structure | The four fields of a certificate. |
| `KCertificate.presentation` | projection | The finite presentation. |
| `KCertificate.relations_hold` | projection | The verification of the relations. |
| `KCertificate.generates` | projection | The surjectivity of the generating map. |
| `KCertificate.order_certified` | projection | The certified order or kernel. |
| `KCertificate.iso` | characterisation | A complete certificate determines the group. |
| `KCertificate.upper_bound_only` | relation | Without the fourth field only an upper bound follows. |

**Used by.**

- *N.8, the certified examples* — The last layer of this roadmap runs this method on the named examples.
- *K2SymbolsBrauer T.5* — The same discipline is used there for the second K-group, and the two must agree on what counts as certified.
- *SpecialValuesBirchTate* — That roadmap supplies the zeta-value side, which this method admits only as a proved second bound.

**Unit tests.**

- `four_fields_suffice` — A complete certificate determines the group up to isomorphism.
- `three_fields_do_not` — A presentation with verified relations and a surjection gives only an upper bound.
- `zeta_is_not_a_definition` — An order read from a zeta value is not a certification unless the formula is proved for that field.
- `reusable` — The method applies unchanged to a second example, which is what makes it a method rather than a computation.

**Sources.**

- VI.8.7 and VI.8.8 (PDF p. 514), The two theorems that relate zeta values to orders, verbatim. They are theorems under stated hypotheses, and this node records that they may be used as a second bound only where they are proved, never as a definition of the order.

  > Theorem 8.7. (Wiles) Let F be a totally real number field. If l is odd and O_S = O_F[1/l], then for all even integers 2k > 0 there is a rational number u_k, prime to l, such that zeta_F(1-2k) = u_k |H^2_et(O_S, Z_l(2k))| ... Theorem 8.8. If F is totally real, and Gal(F/Q) is abelian, then for all k >= 1: zeta_F(1-2k) = (-1)^{kr_1} 2^{r_1} |K_{4k-2}(O_F)| ...

## Gaps

### The descent spectral sequence and its degeneration were not read

Needed by: `ArithmeticKTheory:N.6`, `ArithmeticKTheory:N.5`.

The cohomological descriptions of N.6, and the two-primary calculation on which N.5's real table rests, are produced by the motivic-to-etale descent spectral sequence, which the source develops in the sections preceding the ones read here and whose degeneration in the relevant range it invokes. Those sections were not read, so both nodes state the resulting descriptions with their locators and record the spectral sequence as the input rather than decomposing it. NEXT SOURCE ACTION: read VI.4 (the descent spectral sequence) and VI.6 to VI.7 of the same file, and decompose the degeneration statement and the extension problem it leaves; MotivicEtaleKTheory M.7 owns the corrected form and should be read alongside.

### The proofs of the three main tables were read only in outline

Needed by: `ArithmeticKTheory:N.5`, `ArithmeticKTheory:N.6`.

Theorem 8.2, Theorem 9.5 and Theorem 9.11 were read as statements, and the opening of the proof of 9.5, which is what tells us that the content is the two-primary torsion. Their full proofs were not read, so the proof steps of the corresponding nodes record the strategy and the inputs rather than the argument. NEXT SOURCE ACTION: read the proofs of 8.2 (PDF p. 513), 9.5 (PDF p. 528) and 9.11 (PDF pp. 523 to 524) in full.

### The proof of Soule's theorem was read only to its first reduction

Needed by: `ArithmeticKTheory:N.2`.

V.6.8 was read as a statement together with the reduction to the vanishing of the relative kernel and the degree-one case; the argument from the mod-l sequence that disposes of the higher degrees was not read. Since the stage text makes this theorem the hinge of the layer, the gap matters. NEXT SOURCE ACTION: read V.6.8 and 6.8.1 in full (PDF pp. 411 to 412) and decompose the divisibility argument.

### The arithmetic-group input to finite generation has no source here

Needed by: `ArithmeticKTheory:N.3:finite-generation`.

The K-book states Quillen's finite generation theorem and does not prove it in the file read; the proof needs the finiteness properties of arithmetic groups and a finite-type homotopy statement. Both are recorded as imports from BorelRegulators R.1 and neither is decomposed here. NEXT SOURCE ACTION: read Quillen, 'Finite generation of the groups K_i of rings of algebraic integers' (LNM 341), and Borel and Serre on the corners of arithmetic quotients, and decompose the two inputs in the roadmap that owns them.

### The wild-kernel identification is quoted with an attribution, not proved

Needed by: `ArithmeticKTheory:N.6`.

The statement that the divisible subgroup of an even K-group of a number field is isomorphic to the wild kernel is quoted by the source from a later reference of its own and is not proved in the file read. The node records it as a theorem with an attribution and states the rule that it may not be assumed in an exceptional dyadic case. NEXT SOURCE ACTION: obtain the reference the source cites for it and decompose the proof, or record the statement as conditional in the atlas.

## Requests

- **`KTheoryLowDegrees:Z.4`** — The zeroth K-group of a Dedekind domain as the integers plus the class group, by rank and determinant, and its specialisation to the S-integers. AUDIT-27 names Z.4 as the owner of exactly N.1's first computation, so this packet imports it.

- **`KTheoryLowDegrees:U.4`** — The vanishing of the special first K-group for the S-integers of a number field and the determinant identification of the first K-group with the S-units, with the rank. This is N.1's second computation and also the degree-one half of N.3.

- **`BorelRegulators:R.1`** — Arithmetic groups with their finiteness properties and the finite-type homotopy consequence that Quillen's finite-generation proof uses. AUDIT-27 names R.1 as the owner.

- **`BorelRegulators:R.3`** — Borel's stable cohomology theorem and the resulting period-four rank formula for the K-groups of rings of S-integers, including the higher regulator.

- **`GeneralAlgebraicKTheory:K.1`** — The K-groups of an exact category with their elementary properties, and Quillen's computation of the K-theory of a finite field, which supplies the residue terms of the localisation sequence. The companion packet of this session decomposes the first.

- **`GeneralAlgebraicKTheory:K.3`** — Quillen's localisation theorem for a Serre subcategory of an abelian category, of which N.2's sequence is the Dedekind-domain case, together with the resolution theorem and the projection formula that N.1's transfers use.

- **`K2SymbolsBrauer:T.5`** — The tame kernel with its exact sequence and the certified presentations in degree two, which are the degree-two row of N.2 and the degree-two instance of N.6's certificate discipline.

- **`K2SymbolsBrauer:T.7`** — The twisted coefficient modules and the norm-residue symbol. N.4's invariant is defined with the twisted modules, which neither pinned library has.

- **`MotivicEtaleKTheory:M.7`** — The corrected long exact sequences and extension data at the prime two with real places, for number fields and S-integers, which is what produces N.5's real table and N.6's two-primary table.

- **`MotivicEtaleKTheory:M.8`** — The etale Chern classes with their compatibility with residues, norms and products; these are the natural maps N.5 insists on, as opposed to the splittings, which are not natural.

- **`SpecialValuesBirchTate:B.3`** — The explicit computation of the invariant in degree two over the rationals, which that roadmap also asks for; N.4 states it and the two roadmaps must agree on the value and on the warning that it is not the order of the group of roots of unity.

## Structural proposals

### N.1 is a register of imports and its stage text already says so

*note-duplicate-boundary*

N.1's text says 'import Z and U' for its two computations, and AUDIT-27 confirms that KTheoryLowDegrees Z.4 and U.4 own them. What N.1 owns is the carrier: the S-integers as a localisation of the ring of integers for a NUMBER FIELD, the independence of the presentation and the monotonicity in S, none of which is pinned and the first of which Tau Ceti's own file says is false for a general Dedekind domain. The stage text should name the two owners explicitly, as the other layers of this roadmap do, so that a reader does not plan the computations here.

### N.4 carries two independent developments

*propose-split*

N.4 asks both for the invariant of the twisted roots of unity with its computation from the cyclotomic character, which is pure Galois theory and needs no K-theory at all, and for the distinction from the group of roots of unity together with the dyadic exceptional cases, which is where the arithmetic subtlety lives. The first half is formalisable against the pins today once the twisted module is defined; the second is a body of case analysis that the later layers consume in a different way. Splitting would make visible that the invariant can be built and tested long before any K-group exists. The five nodes divide three to two along that line.

### The totally imaginary hypothesis is a cohomological-dimension hypothesis and should be named as one

*note-hypothesis-boundary*

Both N.5's clean table and N.6's clean description hold at the prime two only when the field is totally imaginary, and the reason is that the cohomological dimension of the ring at two is then two. The stage texts of N.5 and N.6 mention real places as a correction; they should say that the correction is forced by the cohomological dimension, because that is what tells a reader why the eight-fold table appears and why no amount of care with the invariant alone will avoid it.

## What this blueprint does not claim

No Lean was compiled. The Mathlib build on this machine is a shared cache that
must not be rebuilt, and this working tree has no elaborated dependency modules.
Every `implementationStatus` is `unchecked`, the suggested Lean file is a naming
proposal whose proofs are all `sorry`, and nothing here is claimed to be
formalised.

Seven excerpts ran past four hundred characters and were elided at a word
boundary, marked with an ellipsis; the locators name the pages so the full text
can be read in the source.
