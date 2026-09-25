# HabiroRings — HR.1 to HR.7

The blueprint for the whole roadmap: relative bases and the local Frobenius,
Habiro-complete modules, finite cyclotomic descent, relative q-Witt rings and the
étale lift, the relative Habiro ring with its equaliser presentation and its two
comparisons, the cohomology interfaces, and the acceptance tests. This document is
definitive; the packet `research/blueprint/packets/HabiroRings.json` is its
machine form and the suggested Lean file is a naming proposal, not an
implementation.

Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## The source

One paper, taken as LaTeX:

> Ferdinand Wagner, *q-Hodge complexes over the Habiro ring*. arXiv:2510.04782v2, LaTeX source. Statements are numbered by a single counter per section, shared by the numbered paragraphs and the theorem environments, with lettered appendix sections; that is the numbering the stage texts use. Locators here name the section and the statement's role, which identifies the statement under that counter.
> <https://arxiv.org/abs/2510.04782>, SHA-256 `9c338455871808eb2265681199279607b4b179b3973752d48eca3f711bc25b47`, accessed 2026-09-25.

- Downloaded from the arXiv e-print endpoint as LaTeX source; the hash recorded is of the gzipped file the endpoint returns. Quotations are from that source with the mathematics written out in words.
- §1, the introduction: the definition of a perfectly covered Lambda-ring with its equivalent description and its three examples, the descent theorem in its introductory form with the q-de Rham-Witt comparison, the recollection of the q-de Rham-Witt complexes from the companion paper, and the paragraph on the Habiro ring of a number field with the hypotheses on the inverted integer.
- §2, the relative Habiro rings: the unique Frobenius lift on the completion of an etale algebra with the linearised Frobenius as an equivalence, the local algebras, the general descent principle and the complete-descent corollary with its proof strategy, the q-Witt comparison theorem with staticity and uniqueness, the equaliser lemma with its proof after completion at each prime, the corollary identifying the ring with the number-field one, and the remark giving the classical Taylor presentation.
- The appendix on Habiro completion: the completion functor, the claim that it behaves like completion at a finitely generated ideal, and the definition of Habiro-complete spectra by killing an idempotent.
- NOT read: §3 and the later sections on Habiro descent for q-Hodge complexes in full, the twisted q-de Rham complexes, and the body of the appendix beyond its opening. The companion q-Witt paper was not obtained at all.

**The stage texts' citation numbering does match this version**, once the source's
counter is read correctly: one counter per section, shared by the numbered
paragraphs and the theorem environments, with lettered appendix sections. On that
reading Corollary 2.4 is the complete-descent corollary, Theorem 2.9 the étale
lift and q-Witt comparison, Lemma 2.12 the equaliser lemma, Corollary 2.13 the
identification with the number-field ring, Remark 2.14 the Taylor presentation,
Corollary 3.13 the descent comparison, and B.2, B.3, B.4 and B.8 the appendix's
statements. An earlier revision of this document reported the numbering as
unmatched; that was wrong, and the locators here name the number as well as the
role.

There is **no integrated decomposition** for this roadmap.

## What the pinned libraries have

**Nothing**, and the packet cites no baseline declaration. There are no Λ-rings
with commuting Adams operations, no Habiro completion, no q-Witt vectors and no
descent machinery of this shape in either tree. Every node is either new work or
an import from one of the eight prerequisite roadmaps — fifteen requests in all.

## HR.1 — Relative bases and local Frobenius

**Λ-ring here is the arithmetic notion, never an Iwasawa algebra.** Torsion-free,
with commuting Adams operations, the Frobenius congruence at each prime and the
composition law at a product.

**Perfectly covered**: a faithfully flat Λ-map to a perfect Λ-ring, equivalently
every `ψ^m` faithfully flat. True for `ℤ`, free Λ-rings and toric polynomial
rings — **not for every Λ-ring**.

`ψ^p` extends *uniquely* to a Frobenius lift on `R̂_p`, and the linearised
relative Frobenius is an equivalence. **There need be no global Frobenius**
**endomorphism of `R`.**

Coverage: **source_decomposed**.

Four nodes. Lambda-rings with commuting Adams operations, with the Frobenius congruence and the composition law, the three standing examples and the naming rule that keeps them apart from Iwasawa algebras; perfect covering in both of the source's equivalent descriptions, with the consequence that the base is torsion free and its completions static, and with the explicit record that the condition is not automatic; the unique Frobenius lift on the completion of an etale algebra with the linearised relative Frobenius as an equivalence, its functoriality, base-change squares and prime-power iterates, completed tensor products kept explicit and the stage text's warning that there need be no global Frobenius endomorphism; and the category of pairs, which fixes the class of morphisms every later naturality statement is for.

### Torsion-free Lambda-rings with commuting Adams operations

`HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations` · *definition* · planet **Lambda-rings with commuting Adams operations**

The base of the whole roadmap is a LAMBDA-RING in the arithmetic sense: a commutative ring with lambda-operations, equivalently with a family of Adams operations indexed by the positive integers that commute with one another and satisfy the Frobenius congruence at each prime, that the operation at a prime is the identity modulo that prime. The composition law is that the operation at a product is the composite of the operations at the factors. This is NOT an Iwasawa algebra, and the packet uses a name that cannot be confused with one. The generic delta-ring interface at a single prime is imported from the prismatic roadmap; what belongs here is the all-prime structure with its commutation.

**Hypotheses.**

- The ring is commutative and torsion free; torsion freeness is what makes the Adams operations determine the lambda-structure.
- The Adams operations commute and the one at a prime is congruent to the identity modulo that prime.
- The delta-structure at a single prime is the prismatic roadmap's; this node states the compatible family over all primes.

**Proof outline.**

1. Define the Adams operations with their commutation and congruence conditions.
2. Prove the composition law for a product of indices.
3. Record the equivalence with the lambda-ring structure for a torsion-free ring.
4. Record the import of the single-prime delta-ring interface and say exactly which part is new.
5. Record the standing examples: the integers, the free Lambda-rings on a set of generators, and a polynomial ring with the toric structure in which the higher lambda-operations of a generator vanish.
6. State the naming rule: Lambda-ring here always means the arithmetic notion and never an Iwasawa algebra.

**Acceptance.**

- The integers form a Lambda-ring with every Adams operation the identity.
- A free Lambda-ring on a set of generators is one.
- A polynomial ring with the toric structure is one.
- The name is the arithmetic one and is not an Iwasawa algebra.

**Prerequisites.** `PrismaticCohomology:PR.0`

**API.**

| name | role | statement |
| --- | --- | --- |
| `LambdaRing` | structure | A torsion-free ring with commuting Adams operations. |
| `LambdaRing.adams` | projection | The operation at an index. |
| `LambdaRing.adams_comm` | characterisation | Their commutation. |
| `LambdaRing.frobCongruence` | characterisation | The congruence at a prime. |
| `LambdaRing.adams_mul` | characterisation | The composition law at a product. |
| `LambdaRing.toric` | example | The toric structure on a polynomial ring. |

**Used by.**

- *HR.1, perfect cover* — The covering condition is a condition on these operations.
- *HR.4* — The q-Witt rings are relative to this base.
- *HR.5* — The coefficients of the equaliser are twisted by these operations.

**Unit tests.**

- `integers` — The integers with the identity operations form a Lambda-ring.
- `toric` — The toric structure on a polynomial ring is one.
- `congruence` — The operation at a prime is the identity modulo that prime.
- `not_iwasawa` — The name is the arithmetic one; an Iwasawa algebra is a different object.

**Sources.**

- §1.1, the paragraph fixing the base, The base of the paper with the three standing examples, verbatim from the LaTeX source, with the mathematics written out in words.

  > In the following, we work relative to a Lambda-ring A which is perfectly covered in the sense that there exists a faithfully flat Lambda-morphism A -> A_infinity into a perfect Lambda-ring. Equivalently, the Adams operations psi^m : A -> A are all faithfully flat. This condition is satisfied in all examples of interest; for example, it holds for Z, for any free Lambda-ring on a set of ...

### Perfectly covered Lambda-rings, in two equivalent descriptions

`HabiroRings:HR.1/perfectly-covered` · *definition* · planet **Perfectly covered bases**

A Lambda-ring is PERFECTLY COVERED when it admits a faithfully flat map of Lambda-rings into a perfect one; equivalently, when every Adams operation is faithfully flat. The source states both descriptions and records that the condition holds in the examples of interest but NOT for every Lambda-ring, which is the caution the stage text repeats. The condition has an immediate consequence the later layers use: a perfectly covered base is torsion free at every prime, because the perfect cover is, and hence its completions are static.

**Hypotheses.**

- The cover is by a perfect Lambda-ring, that is one on which the Adams operation at each prime is an isomorphism.
- The equivalence of the two descriptions is stated in the companion q-Witt paper and is cited, not reproved.
- The condition is not automatic and the packet never assumes it of an unnamed base.

**Proof outline.**

1. State both descriptions and record the reference for their equivalence.
2. Prove the torsion-freeness consequence at each prime.
3. Deduce that the completions of the base are static, which the later constructions use.
4. Record the three examples of the previous node as instances.
5. Record the non-example: a general Lambda-ring need not be perfectly covered, and no statement of this roadmap applies to one.

**Acceptance.**

- The integers, the free Lambda-rings and the toric polynomial rings are perfectly covered.
- A perfectly covered base is torsion free at every prime and its completions are static.
- Not every Lambda-ring is perfectly covered.
- The two descriptions are equivalent, by the cited companion paper.

**Prerequisites.** `HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations`

**API.**

| name | role | statement |
| --- | --- | --- |
| `IsPerfectlyCovered` | data | The condition on a Lambda-ring. |
| `IsPerfectlyCovered.flat_adams` | characterisation | The equivalent description by faithful flatness of the operations. |
| `IsPerfectlyCovered.torsionFree` | characterisation | Torsion freeness at each prime. |
| `IsPerfectlyCovered.completion_static` | characterisation | Staticity of the completions. |
| `IsPerfectlyCovered.examples` | example | The three standing examples. |

**Used by.**

- *HR.1, the etale Frobenius lift* — The lift is constructed over a perfectly covered base.
- *HR.3 and HR.4* — Both descent and the q-Witt comparison assume it.
- *HR.5* — The relative Habiro ring is defined over such a base.

**Unit tests.**

- `integers` — The integers are perfectly covered.
- `torsion_free` — A perfectly covered base is torsion free at each prime.
- `not_automatic` — A general Lambda-ring need not be perfectly covered.
- `static_completions` — The completions of such a base are static, which later constructions use.

**Sources.**

- §1.1, the same paragraph, The definition in both forms, verbatim.

  > a Lambda-ring A which is perfectly covered in the sense that there exists a faithfully flat Lambda-morphism A -> A_infinity into a perfect Lambda-ring. Equivalently, the Adams operations psi^m : A -> A are all faithfully flat.

- §2, the construction of the relative Habiro rings, The torsion-freeness consequence and the staticity it gives, verbatim.

  > We also remark that A being perfectly covered implies that A is p-torsion free (because this is true for the perfect Lambda-ring A_infinity), and so all p-completions above are static.

### The Frobenius lift on an etale algebra and its linearisation

`HabiroRings:HR.1/the-etale-frobenius-lift` · *construction* · planet **The relative Frobenius**

For an etale algebra over a perfectly covered base, the Adams operation at a prime extends UNIQUELY to a Frobenius lift on the completion of that algebra at the prime, and the linearised relative Frobenius, from the completed base change along that Adams operation to the completion, is an EQUIVALENCE. The source checks this modulo the prime, where it is the classical statement about etale algebras. There need not be a global Frobenius endomorphism of the algebra: the lift lives on the completions, and every later construction respects that.

**Hypotheses.**

- The algebra is etale over the base and the base is perfectly covered.
- The completion is at a prime; the base change is along the Adams operation at that prime and is itself completed.
- The uniqueness of the lift is part of the statement and is what makes the construction functorial.

**Proof outline.**

1. State the existence and uniqueness of the lift on the completion.
2. Define the linearised relative Frobenius and state that it is an equivalence.
3. Record the source's proof strategy: check modulo the prime and invoke the classical statement for etale algebras.
4. Record the functoriality, the base-change squares and the iterates at prime powers, keeping completed tensor products explicit.
5. State the non-example: there need not be a global Frobenius endomorphism of the algebra, so no construction may use one.

**Acceptance.**

- The lift exists and is unique on the completion.
- The linearised relative Frobenius is an equivalence.
- There need not be a global Frobenius endomorphism of the algebra.
- Completed tensor products are kept explicit and are not replaced by ordinary ones.

**Prerequisites.** `HabiroRings:HR.1/perfectly-covered`, `PrismaticCohomology:PR.0`

**API.**

| name | role | statement |
| --- | --- | --- |
| `frobLift` | data | The Frobenius lift on the completion. |
| `frobLift_unique` | characterisation | Its uniqueness. |
| `linearisedFrob` | data | The linearised relative Frobenius. |
| `linearisedFrob_equiv` | characterisation | That it is an equivalence. |
| `linearisedFrob_baseChange` | compatibility | The base-change squares. |
| `linearisedFrob_iterate` | compatibility | The prime-power iterates. |

**Used by.**

- *HR.3* — The prime-edge gluing maps of the descent are these linearisations.
- *HR.4* — The etale lift is assembled from them.
- *HR.5* — The second arrow of the equaliser is this Frobenius followed by re-expansion.

**Unit tests.**

- `unique` — The lift is unique.
- `equivalence` — The linearised Frobenius is an equivalence.
- `no_global` — There need not be a global Frobenius endomorphism of the algebra.
- `iterates` — The prime-power iterates compose as expected.

**Sources.**

- §2, Relative Habiro rings, The lift and the linearisation with the proof strategy, verbatim.

  > Let R be an etale A-algebra. For all primes p, the p-th Adams operation psi^p : A -> A can be uniquely extended to a Frobenius lift phi_p on the p-completion of R. Let us denote by phi_{p/A} the linearised Frobenius, from the p-completion of the base change of the p-completion of R along psi^p, to the p-completion of R. It is an equivalence as indicated. Indeed, this can be checked modulo ...

### Morphisms of pairs and the naturality that follows

`HabiroRings:HR.1/morphisms-of-pairs` · *comparison*

The objects of this roadmap are PAIRS consisting of a perfectly covered base and an etale algebra over it, and a morphism of pairs is a map of algebras over a map of bases that is compatible with the Lambda-structures. Every construction of the later layers is natural for these morphisms and for no larger class: in particular a map of algebras that does not respect the Adams operations induces nothing. This node fixes the category and records the naturality claims that the later layers are entitled to make.

**Hypotheses.**

- The base map is a map of Lambda-rings between perfectly covered bases; the algebra map is over it and the algebras are etale.
- Compatibility with the Lambda-structure is part of the data of a morphism, not a property to be checked later.
- Naturality statements downstream are for this category.

**Proof outline.**

1. Define the category of pairs and its morphisms.
2. Prove that the Frobenius lifts and their linearisations are natural for these morphisms.
3. Record which constructions of the later layers are functorial on this category.
4. State the non-example: a ring map that does not respect the Adams operations is not a morphism here and induces nothing.
5. Record the base-change squares that the naturality produces.

**Acceptance.**

- The Frobenius lift is natural for morphisms of pairs.
- A map not respecting the Adams operations is not a morphism of pairs.
- Every later naturality statement is for this category.

**Prerequisites.** `HabiroRings:HR.1/the-etale-frobenius-lift`

**Sources.**

- §2, Relative Habiro rings, The construction is stated for a pair of a base and an algebra, and everything downstream is functorial in that pair; this node fixes what a morphism of pairs is.

  > For all m, let us now define a (q^m - 1)-complete E-infinity A[q]-algebra H_{R/A, m}

## HR.2 — Habiro-complete modules and derived detection

Complete = killed by the idempotent inverting every `q^m − 1`. The completion is
the limit over divisibility, idempotent, computable along the factorial tower.

**Completion is not inverting.** `q` becomes a unit after completing; the
elements `q^m − 1` do not.

Four detection results do the work: the two-term resolution, completeness on
homotopy groups, joint conservativity of the cyclotomic reductions, and
detection of degree bounds and **staticity** — which is what HR.4's staticity
proof uses, rather than assuming completion is exact.

The solid comparison is **bounded below**, on VS2's qualified formalism.

Coverage: **source_decomposed**.

Four nodes. Habiro-complete objects defined by killing the idempotent that inverts every q to the m minus one, with the completion functor, its adjointness and idempotence, the cofinal factorial tower imported from the classical roadmap, the invertibility of q after completion and the stage text's distinction between completing and inverting; the four detection results of the appendix — the two-term resolution, completeness on homotopy groups, joint conservativity of the cyclotomic reductions and detection of degree bounds and staticity — with the statement that derived limits are never replaced by ordinary ones without proof; the completed tensor product with its unit and the spectral comparison proved rather than assumed; and the solid comparison, stated as the bounded-below statement it is, with the two readings that are excluded.

### Habiro-complete modules and the completion functor

`HabiroRings:HR.2/habiro-complete-modules` · *definition* · planet **Habiro-complete modules**

A module over the Laurent ring in q is HABIRO-COMPLETE when its derived mapping object out of the localisation that inverts every q to the m minus one vanishes; equivalently, when it lies in the full subcategory obtained by killing that idempotent algebra. The HABIRO COMPLETION is the limit over all m of the completions at q to the m minus one, indexed by divisibility, and it is the left adjoint to the inclusion of the complete objects; it is idempotent, and the factorial tower is cofinal in the divisibility system, so the limit may be computed along it. The source's appendix shows that the functor behaves for all practical purposes like completion at a finitely generated ideal, and that is the form in which this layer states it.

**Hypotheses.**

- The ambient category is the derived category of modules over the Laurent ring in q, or its spectral analogue.
- The localisation inverts every q to the m minus one and is an idempotent algebra over the Laurent ring, which is what makes the subcategory a Bousfield localisation.
- The cofinality of the factorial tower is the statement of the classical roadmap and is imported.

**Proof outline.**

1. Define the localisation and record that it is idempotent.
2. Define Habiro-complete objects by the vanishing of the derived mapping object out of it.
3. Define the completion functor as the limit over the divisibility system and prove that it is left adjoint to the inclusion.
4. Prove idempotence of the completion.
5. Prove that the factorial tower is cofinal, citing the classical roadmap, and deduce the limit description along it.
6. Prove that q is invertible in the completed coefficient ring, and record the distinction the stage text insists on: completion is not adjoining inverses of the elements q to the m minus one.

**Acceptance.**

- The completion is idempotent and left adjoint to the inclusion.
- The factorial tower computes the same limit.
- q is invertible in the completed coefficient ring.
- Completion is not the same as inverting the elements q to the m minus one; the two are opposite operations.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.1`, `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E0`

**API.**

| name | role | statement |
| --- | --- | --- |
| `HabiroLocalisation` | data | The localisation inverting every q to the m minus one. |
| `IsHabiroComplete` | data | The completeness condition. |
| `habiroCompletion` | data | The completion functor. |
| `habiroCompletion_adjoint` | characterisation | It is left adjoint to the inclusion. |
| `habiroCompletion_idempotent` | characterisation | Idempotence. |
| `habiroCompletion_factorial` | characterisation | The limit along the factorial tower. |
| `q_invertible` | characterisation | q is invertible in the completed ring. |

**Used by.**

- *HR.4* — The staticity proof uses the detection results, which are statements about these objects.
- *HR.5* — The relative Habiro ring is Habiro-complete and the equaliser comparison is checked there.
- *HR.6* — The exported module interfaces are of these objects.

**Unit tests.**

- `idempotent` — The completion is idempotent.
- `factorial_tower` — The factorial tower computes the same limit.
- `q_unit` — q is invertible after completion.
- `not_inverting` — Completion is not inverting the elements q to the m minus one; a construction that confused them would invert what it meant to complete.

**Sources.**

- Appendix, Habiro-complete spectra, The definition of Habiro-complete objects by killing an idempotent, and the claim about the completion functor, verbatim.

  > In this appendix we'll study the Habiro completion functor, the limit over m of the completions at q^m - 1, and show that it behaves for all practical purposes like completion at a finitely generated ideal. ... let us denote the localisation of Z[q^{pm 1}] inverting all q^m - 1 by R, and let S_R be its obvious spherical lift. Then S_R is an idempotent algebra over S[q^{pm 1}] and we ...

### Detecting completeness, conservativity and degree bounds

`HabiroRings:HR.2/the-detection-results` · *theorem*

The appendix's working tools are four: the two-term resolution of the localised module, which is what makes the completion computable; completeness detected on homotopy groups, so that a spectral object is complete exactly when each of its homotopy modules is; joint conservativity of the cyclotomic reductions, so that a map is an equivalence exactly when all its reductions modulo the cyclotomic polynomials are; and the detection of degree bounds and of staticity by the same reductions. The last is what the staticity proof of HR.4 uses, and the stage text insists that it be used rather than an assumption that completion is exact on arbitrary inputs.

**Hypotheses.**

- The objects are Habiro-complete modules or spectra over the Laurent ring in q.
- The conservativity is joint over all the cyclotomic reductions, not at a single one.
- The detection statements are for complete objects; without completeness they fail.

**Proof outline.**

1. State the two-term resolution of the localised module.
2. State the detection of completeness on homotopy groups.
3. State the joint conservativity of the cyclotomic reductions.
4. State the detection of degree bounds and staticity.
5. Record that all derived-limit corrections are carried: a derived inverse limit is never replaced by an ordinary one without proof.
6. Record how HR.4's staticity proof consumes the fourth statement.

**Acceptance.**

- A complete object is static exactly when its cyclotomic reductions are.
- The reductions are jointly conservative.
- Completeness is detected on homotopy groups.
- No derived inverse limit is replaced by an ordinary one without proof.

**Prerequisites.** `HabiroRings:HR.2/habiro-complete-modules`, `EnhancedDerivedSheaves:E5:abstract`

**Sources.**

- Appendix, the Habiro completion functor, The appendix’s claim, of which the four detection statements are the working form; the packet states them as the stage text lists them; they are B.2, B.3, B.4 and B.8 in the source and were not read in their own statements.

  > show that it behaves for all practical purposes like completion at a finitely generated ideal

### The completed tensor product and its unit

`HabiroRings:HR.2/the-monoidal-structure` · *construction*

Habiro-complete modules carry a symmetric monoidal structure given by completing the ordinary tensor product, with the completed Laurent ring as unit. The construction is the standard one for a Bousfield localisation at a smashing or idempotent-killing localisation and this node records which of the two it is, since the properties that follow differ. The spectral version is imported from the stable-homotopy roadmap with the SAME localisation comparison proved rather than assumed, which is the stage text's requirement.

**Hypotheses.**

- The localisation is by killing an idempotent algebra, which is what the previous node establishes.
- The unit is the completion of the Laurent ring, not the Laurent ring itself.
- The spectral version is over the sphere with q inverted, and the comparison of the two localisations is proved.

**Proof outline.**

1. Construct the completed tensor product and prove that it is symmetric monoidal.
2. Identify the unit and prove that it is the completion of the Laurent ring.
3. Record which kind of localisation this is and what follows from it.
4. Record the spectral version and the comparison, and state that it is proved here rather than assumed.
5. Record the compatibility of the completion functor with the tensor product.

**Acceptance.**

- The unit is the completed Laurent ring, not the Laurent ring.
- The completion functor is monoidal for these structures.
- The spectral comparison is proved, not assumed.

**Prerequisites.** `HabiroRings:HR.2/the-detection-results`, `StableHomotopyKTheory:H.3`

**API.**

| name | role | statement |
| --- | --- | --- |
| `habiroTensor` | data | The completed tensor product. |
| `habiroTensor_unit` | characterisation | Its unit is the completed Laurent ring. |
| `habiroTensor_symmetric` | structure | The symmetric monoidal structure. |
| `habiroCompletion_monoidal` | compatibility | The completion functor is monoidal. |
| `spectral_comparison` | relation | The comparison with the spectral localisation, proved. |

**Used by.**

- *HR.5* — The base-change statements are about this tensor product.
- *HR.6* — The exported perfect complexes and invertible modules are for this structure.
- *HabiroNumberFields:HB.7* — The modules there are compared with invertible objects here.

**Unit tests.**

- `unit` — The unit is the completed Laurent ring.
- `monoidal_completion` — The completion functor is monoidal.
- `spectral` — The spectral comparison holds and is proved.
- `not_ordinary_tensor` — The ordinary tensor product of two complete objects need not be complete.

**Sources.**

- Appendix, Habiro-complete spectra, The spectral setting in which the monoidal structure is built, verbatim.

  > S_R is an idempotent algebra over S[q^{pm 1}] and we define the infinity-category of Habiro-complete spectra to be the full subcategory obtained by killing the idempotent S_R.

### The solid comparison is a bounded-below statement

`HabiroRings:HR.2/the-solid-comparison-is-bounded-below` · *comparison*

The appendix also compares Habiro completion with the solid tensor product of condensed mathematics. That comparison is a BOUNDED-BELOW statement: it uses the qualified solid formalism of the v-stack roadmap and it is not an unrestricted preservation statement for unbounded objects, and neither is it a claim that the two completions agree on all inputs. This node states the comparison with its bound, names the roadmap that owns the solid formalism, and records the two readings that are not available.

**Hypotheses.**

- The objects are bounded below; the comparison is not asserted for unbounded ones.
- The solid formalism is the qualified one the v-stack roadmap supplies, whose restrictions are recorded there.
- The comparison is with the solid tensor product, not with an arbitrary completion.

**Proof outline.**

1. State the comparison with its boundedness hypothesis.
2. Name the owner of the solid formalism and the restrictions it carries.
3. State the two non-examples: unrestricted unbounded preservation, and an identification of the two completions on all inputs.
4. Record what the comparison is used for in the later layers.

**Acceptance.**

- The comparison holds for bounded-below objects.
- It is not an unrestricted unbounded statement.
- It is not an identification of the two completions on all inputs.

**Prerequisites.** `HabiroRings:HR.2/the-monoidal-structure`, `VStackSheavesAndLisseCategories:VS2`

**Sources.**

- Appendix, the opening, The subject of the comparison, verbatim; the boundedness qualification is the stage text’s and is recorded as a hypothesis here.

  > We'll also study Habiro completion in the setting of solid condensed mathematics.

## HR.3 — Finite cyclotomic arithmetic descent

Divisors of `m`, closed sets `Φ_d(q) = 0`. Two divisors whose ratio is not a
prime power have **empty** intersection after completion; the survivors are the
prime edges.

So the descent diagram degenerates and **no coherence data is needed** — the
source says so explicitly. That is a theorem about *this* diagram, **not a**
**licence to glue arbitrary pairwise isomorphisms**.

And the conclusion is an equivalence of categories, with the morphism-level
universal property — not merely an object with the right completions.

Coverage: **source_decomposed**.

Four nodes. The divisor poset with the cyclotomic closed sets and the intersection computation, in which two divisors whose ratio is not a prime power have empty intersection and the survivors are the prime edges; the complete-descent corollary, with its unique conclusion and the source's own emphasis that no coherence data is needed; the morphism-level statement, which the stage text demands and which makes the comparison an equivalence of categories rather than a construction of an object; and the node that says what the degeneration does not license, namely gluing arbitrary pairwise isomorphisms or transporting the argument to a diagram whose higher intersections do not vanish.

### The divisor poset, the cyclotomic closed sets and their intersections

`HabiroRings:HR.3/the-divisor-poset-and-its-intersections` · *construction*

Fix a positive integer. Its positive divisors form a finite poset, and to each divisor is attached the closed subset of the spectrum of the polynomial ring in q where the corresponding cyclotomic polynomial vanishes; together they cover the closed subset where q to that power minus one vanishes. The intersections are what make the descent manageable: two divisors whose ratio is not a prime power have EMPTY intersection after completion, and the surviving intersections are organised by prime-power chains. This node computes them, which is the input the descent corollary needs.

**Hypotheses.**

- The integer is positive; the divisors are its positive divisors and the poset is by divisibility.
- The intersections are computed after completion at the relevant ideals; the emptiness statements are statements about those completions.
- The computation uses the comaximality of cyclotomic polynomials whose orders have a ratio that is not a prime power, which the classical roadmap proves.

**Proof outline.**

1. Define the poset and the closed sets and prove that they cover.
2. Compute the pairwise intersections, with the emptiness statement for a ratio that is not a prime power.
3. Organise the surviving intersections by prime-power chains.
4. Record the comaximality input from the classical roadmap.
5. Record the consequence: in the descent diagram only the prime edges carry data, which is what removes the coherence problem.

**Acceptance.**

- Two divisors whose ratio is not a prime power have empty intersection after completion.
- The surviving intersections are indexed by prime edges.
- The closed sets cover the vanishing locus of q to the power minus one.
- This is what makes the descent diagram carry no higher coherence.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.4`, `EnhancedDerivedSheaves:E0`

**API.**

| name | role | statement |
| --- | --- | --- |
| `divisorPoset` | data | The finite poset of divisors. |
| `cycloClosedSet` | data | The closed set attached to a divisor. |
| `cycloClosedSet_cover` | characterisation | That they cover. |
| `intersection_empty` | characterisation | Emptiness for a non-prime-power ratio. |
| `primeEdges` | data | The surviving intersections, indexed by prime edges. |

**Used by.**

- *HR.3, the descent corollary* — The corollary is stated on this diagram.
- *HR.4* — The etale lift is assembled along the prime edges.
- *HabiroCyclotomicCompletions:HC.5* — The same computation underlies the Chinese remainder decomposition there.

**Unit tests.**

- `cover` — The closed sets cover.
- `empty_intersection` — Two divisors with ratio six have empty intersection after completion.
- `prime_edges` — The surviving intersections are the prime edges.
- `finite` — The poset is finite, which is what makes the descent a finite gluing problem.

**Sources.**

- §2, the proof of the descent corollary, The cover and the emptiness of many intersections, verbatim, which is exactly this node’s computation.

  > The idea is to apply descent for R = A[q] and the cover of the vanishing locus of q^m - 1 by the vanishing loci of the Phi_d(q) for d dividing m. The simplifications come from the observation that many intersections are empty.

### Gluing cyclotomically complete algebras along prime edges

`HabiroRings:HR.3/the-complete-descent-corollary` · *theorem* · planet **The cyclotomic descent corollary**

Given, for each divisor of a fixed integer, a derived complete algebra at the corresponding cyclotomic polynomial, and for each prime edge an equivalence of the completions at that prime, there is a UNIQUE complete algebra at q to the power minus one whose cyclotomic completions are the given ones and whose prime-edge comparisons are the given equivalences. The point, which the source states explicitly, is that NO higher coherence data has to be provided: the intersections of the previous node are empty except along the prime edges, so the descent diagram degenerates. That is a theorem about this diagram and not a licence to glue arbitrary pairwise isomorphisms.

**Hypotheses.**

- The algebras are derived complete at the respective cyclotomic polynomials and are E-infinity over the polynomial ring in q over the base.
- The gluing data is an equivalence of the completions at the prime, for each pair of divisors related by a prime.
- The conclusion is unique existence, so the construction is determined and not merely possible.

**Proof outline.**

1. State the data and the conclusion.
2. Record the source's own remark that no coherence data is needed, and why: the emptiness computation of the previous node.
3. Record the proof strategy, which applies descent for the cover of the vanishing locus and uses the emptiness to collapse the diagram.
4. State the morphism-level statement: the construction is functorial in the data, so a map of gluing data induces a map of the glued algebras, which the stage text demands.
5. State the non-example: without the emptiness computation the same diagram would require coherence, and gluing arbitrary pairwise isomorphisms is not licensed.

**Acceptance.**

- The glued algebra exists and is unique.
- Its cyclotomic completions are the given data and its prime-edge comparisons the given equivalences.
- No higher coherence data is required, and this is a theorem about this diagram.
- The construction is functorial in the data.

**Prerequisites.** `HabiroRings:HR.3/the-divisor-poset-and-its-intersections`, `HabiroRings:HR.2/habiro-complete-modules`

**Sources.**

- §2, the descent corollary, The corollary with its data and its unique conclusion, and the source’s own emphasis that no coherence data is needed, verbatim.

  > In the case that we're actually interested in, the descent diagram simplifies considerably; in particular, no coherence data needs to be provided! Let m be a positive integer. Suppose we're given the following data: for all divisors d of m, a derived Phi_d(q)-complete E-infinity A[q]-algebra E_d; for all divisors pd of m, where p is a prime, an equivalence of E-infinity A[q]-algebras h_d ...

### The comparison is an equivalence of categories, not an object

`HabiroRings:HR.3/the-morphism-level-statement` · *theorem*

The descent corollary produces an object with prescribed completions; the stage text asks for more, namely that the comparison be an equivalence between the category of gluing data and the category of complete algebras, with its universal property at the level of morphisms. This node states that equivalence, records what it adds over the object statement — that a map of glued algebras is the same thing as a compatible family of maps of the local data — and records the joint conservativity and right-Kan-extension conditions that the generic descent argument requires and that the previous nodes verify.

**Hypotheses.**

- The categories are those of the descent diagram and of complete algebras at q to the power minus one.
- The generic descent argument needs joint conservativity of the local restrictions and a right-Kan-extension condition, both verified by the intersection computation.
- The equivalence is of infinity-categories, so it includes the mapping spaces.

**Proof outline.**

1. State the equivalence of categories.
2. Record what it gives at the level of morphisms.
3. Record the two conditions the generic argument requires and where they were verified.
4. State the non-example: an object with the right completions is not by itself a solution to the descent problem, because the morphism-level statement can fail.
5. Record the use: HR.4 constructs its transition maps through this statement.

**Acceptance.**

- A map of glued algebras is a compatible family of maps of the local data.
- The two conditions of the generic argument hold for this diagram.
- An object statement alone does not give the descent equivalence.

**Prerequisites.** `HabiroRings:HR.3/the-complete-descent-corollary`, `EnhancedDerivedSheaves:E5:abstract`

**Sources.**

- §2, the general descent principle, The descent principle of which the corollary is the special case, verbatim; the morphism-level statement is what makes it a principle rather than a construction.

  > To construct H_{R/A}, we'll first construct the completions at each Phi_m(q) and then glue them together using a very general descent principle that we'll explain in this subsection.

### What the absence of coherence data does not license

`HabiroRings:HR.3/what-the-degeneration-does-not-license` · *comparison*

The descent diagram of this layer degenerates because of an arithmetic fact about cyclotomic polynomials, and the stage text warns against reading the degeneration as a general permission. Two readings are excluded here. First, gluing arbitrary pairwise isomorphisms without coherence: that is legitimate only for a diagram whose higher intersections vanish, and the vanishing is the theorem of the first node. Second, transporting the degeneration to a diagram indexed by a poset that is not the divisor poset of a single integer, where the intersections need not vanish.

**Hypotheses.**

- The degeneration is a property of the divisor poset with the cyclotomic closed sets.
- For a general cover the higher intersections do not vanish and the coherence data is genuinely needed.
- The warning is about the shape of the argument, not about its correctness here.

**Proof outline.**

1. State the degeneration and the fact it rests on.
2. State the first non-example, with a diagram where pairwise gluing is not enough.
3. State the second, with a poset for which the computation fails.
4. Record the rule: every use of the corollary names the integer whose divisors index it.

**Acceptance.**

- The degeneration holds for the divisor poset of an integer with the cyclotomic closed sets.
- It does not hold for a general cover.
- Pairwise isomorphisms without coherence do not glue in general.

**Prerequisites.** `HabiroRings:HR.3/the-morphism-level-statement`, `HabiroRings:HR.3/the-divisor-poset-and-its-intersections`

**Sources.**

- §2, the descent corollary, The source’s own framing, verbatim: the simplification is for the case at hand and is not a general principle.

  > In the case that we're actually interested in, the descent diagram simplifies considerably; in particular, no coherence data needs to be provided!

## HR.4 — Relative q-Witt rings and finite étale lifts

Degree-zero `qW_m(R/A)` with its ghost description under torsion hypotheses.

**There is no restriction operator.** The companion paper proves the
obstruction; so there is no big q-Witt ring in the naive sense, and the
transition maps `H_{R/A,m} → H_{R/A,d}` induce **`F_{m/d}`**, named Frobenius,
not restriction.

The lift: `H_{R/A,m}/(q^m − 1) ≅ qW_m(R/A)`, it is the **unique** such complete
lift, and it is **static** — proved through HR.2's detection result.

Coverage: **source_decomposed**.

Four nodes. The degree-zero relative q-Witt rings with their universal construction, the ghost description under its torsion hypotheses, the Frobenius and Verschiebung in the domains the source gives, and the boundary with the cohomology roadmap, which owns the positive-degree complex; the obstruction to a restriction operator, which the stage text insists be proved rather than worked around, with the consequence that no big q-Witt ring in the naive sense exists; the etale lift, which is the source's theorem that the glued object's quotient is the q-Witt ring, that it is the unique such lift and that it and the limit are static, with the staticity proved through HR.2's detection result as the stage text requires; and the transition maps, which compose and induce the FROBENIUS on quotients, named so rather than by the restriction operator the theory does not have.

### The degree-zero relative q-Witt rings

`HabiroRings:HR.4/relative-q-witt-rings` · *definition* · planet **Relative q-Witt rings**

For a positive integer, the RELATIVE q-WITT RING of an algebra over a perfectly covered base is the degree-zero part of the q-de Rham-Witt theory of the companion paper: an algebra over the polynomial ring in q modulo q to that power minus one, defined by a universal property with a quotient construction, and described by ghost components under a torsion hypothesis. It is functorial in the pair, and it carries Frobenius and Verschiebung operators in the exact domains the source establishes. The positive-degree q-de Rham-Witt complex is an EXTENSION of these rings and is owned by the cohomology roadmap; it is not a second construction of them.

**Hypotheses.**

- The base is perfectly covered and the algebra is over it; the degree-zero part is the one this layer owns.
- The ghost description holds under the torsion hypotheses the source states and not in general.
- The Frobenius and Verschiebung operators are defined in the domains the source gives, which are not the whole of the classical Witt-vector API.

**Proof outline.**

1. Define the ring by its quotient and universal construction.
2. Prove the ghost description under its torsion hypotheses.
3. Construct the Frobenius and Verschiebung operators in the stated domains and record what is NOT available.
4. Prove functoriality in the pair.
5. Record the boundary with the cohomology roadmap, which owns the positive-degree complex, and state that this layer does not construct a second version of these rings.

**Acceptance.**

- The ghost description holds under the torsion hypothesis.
- The Frobenius and Verschiebung are defined in the stated domains only.
- The ring is functorial in the pair.
- The positive-degree complex is an extension owned elsewhere.

**Prerequisites.** `HabiroRings:HR.1/perfectly-covered`, `HabiroCohomologyFoundations:HQ.4`

**API.**

| name | role | statement |
| --- | --- | --- |
| `qWitt` | data | The relative q-Witt ring at an integer. |
| `qWitt.universal` | characterisation | Its universal property. |
| `qWitt.ghost` | characterisation | The ghost description under the torsion hypothesis. |
| `qWitt.frobenius` | data | The Frobenius operator in its domain. |
| `qWitt.verschiebung` | data | The Verschiebung in its domain. |
| `qWitt.functorial` | functoriality | Functoriality in the pair. |

**Used by.**

- *HR.4, the etale lift* — The lift is characterised by its quotient being this ring.
- *HQ.4* — The positive-degree complex extends these rings.
- *HR.7* — The acceptance tests check the transition map against the Frobenius.

**Unit tests.**

- `ghost_hypothesis` — The ghost description needs the torsion hypothesis; without it it fails.
- `functorial` — The ring is functorial in the pair.
- `degree_zero_only` — This layer owns the degree-zero part only.
- `operators_domains` — The operators are defined in the stated domains and not on the whole ring.

**Sources.**

- §1, the introduction, on the companion paper, The q-de Rham-Witt complexes with their universal property, verbatim; the degree-zero part is the relative q-Witt ring this node owns.

  > In a previous work of the author, we showed that for all m the cohomology of the coordinate-dependent q-Hodge complex modulo q^m - 1 agrees with the (q-1)-completion of a certain object, which we call the m-truncated q-de Rham-Witt complex. The system of these objects satisfies a similar universal property as the de Rham-Witt pro-complex and so it is functorial.

### There is no compatible restriction operator on q-Witt rings

`HabiroRings:HR.4/there-is-no-restriction-map` · *comparison*

The classical Witt vectors carry restriction maps along divisibility, and the stage text warns that the q-theory does NOT: the companion paper proves an obstruction, and there is no compatible extension of the ordinary restriction to this q-Witt theory, hence no big q-Witt ring in the naive sense. This node states the obstruction as the source states it, records that the transition maps of the next node are the FROBENIUS and not a restriction, and forbids an interface that names a restriction operator it cannot provide.

**Hypotheses.**

- The comparison is with the ordinary Witt restriction maps along divisibility.
- The obstruction is proved in the companion paper's first section and is cited here.
- The transition maps that DO exist are the ones of the next node, and they are Frobenius maps.

**Proof outline.**

1. State the obstruction and its source.
2. Record what the classical theory has and this one does not.
3. State the rule: no interface may expose a restriction operator, and the transition maps are named Frobenius.
4. Record the consequence for the pro-structure: the system of q-Witt rings is a pro-object for the Frobenius maps and not for restrictions.
5. Record the non-example: an unrestricted big q-Witt ring built from a restriction system does not exist.

**Acceptance.**

- There is no compatible restriction operator.
- The transition maps are Frobenius maps.
- No big q-Witt ring in the naive sense exists.
- An interface that named a restriction would be exposing something the theory does not have.

**Prerequisites.** `HabiroRings:HR.4/relative-q-witt-rings`

**Sources.**

- §1, the introduction, on the companion paper, The pro-structure the theory does have, verbatim; the stage text records that the companion paper proves there is no compatible restriction, and this node states that as the boundary.

  > The system of the m-truncated q-de Rham-Witt complexes satisfies a similar universal property as the de Rham-Witt pro-complex

### The relative Habiro ring at an integer, as the unique etale lift

`HabiroRings:HR.4/the-etale-lift` · *theorem* · planet **The unique etale lift**

For each positive integer, gluing the local algebras at the cyclotomic polynomials along the prime edges by the linearised Frobenius of HR.1 produces a complete algebra at q to the power minus one, and the theorem identifies it: its quotient by q to the power minus one is the relative q-Witt ring, and it is the UNIQUE lift of that etale algebra to a complete algebra over the completed polynomial ring. In particular it is STATIC, an ordinary ring rather than a higher one, and so is the limit over all integers. The staticity is proved through the detection results of HR.2 and not by assuming that completion is exact.

**Hypotheses.**

- The base is perfectly covered; the algebra is over it, and for the etale-lift statement the relevant etaleness is that of the q-Witt ring over the quotient ring.
- The local algebras are the completions of the base changes along the Adams operations, and the gluing maps are the linearisations of HR.1.
- Uniqueness is as a complete algebra over the completed polynomial ring, which is what makes the construction canonical.

**Proof outline.**

1. Assemble the local data and the prime-edge equivalences and apply the descent corollary.
2. State the quotient identification with the q-Witt ring.
3. State the uniqueness as an etale lift.
4. Deduce staticity, using the detection result of HR.2 rather than an exactness assumption.
5. Deduce staticity of the limit over all integers.
6. Record the naturality of the quotient identification and the invariance under an equivalent etale presentation.

**Acceptance.**

- The quotient by q to the power minus one is the relative q-Witt ring.
- The lift is unique, so the construction is canonical.
- Both the finite stage and the limit are ordinary rings.
- The staticity proof uses the detection result and not an exactness assumption.

**Prerequisites.** `HabiroRings:HR.3/the-complete-descent-corollary`, `HabiroRings:HR.4/relative-q-witt-rings`, `HabiroRings:HR.1/the-etale-frobenius-lift`, `HabiroRings:HR.2/the-detection-results`

**Sources.**

- §2, the q-Witt comparison theorem, The theorem with the quotient identification, the uniqueness and the staticity, verbatim.

  > Let A be a perfectly covered Lambda-ring, R an A-algebra, and m a positive integer. Then H_{R/A, m}/(q^m - 1) is equivalent to qW_m(R/A). In fact, H_{R/A, m} is the unique lift of the etale A[q]/(q^m - 1)-algebra qW_m(R/A) to a (q^m - 1)-complete E-infinity algebra over the (q^m - 1)-completion of A[q]. In particular, H_{R/A, m} is an ordinary ring for all m, and the same is true for the ...

- §2, the construction, The local data and the gluing maps, verbatim.

  > For every d dividing m, let E_d be the Phi_d(q)-completion of (R tensor_{A, psi^d} A)[q], and for every pd dividing m, where p is a prime, let the gluing equivalence h_d be the A[q]-linear map induced by phi_{p/A}.

### The transition maps and what they induce on q-Witt rings

`HabiroRings:HR.4/the-transitions-are-frobenius` · *theorem*

For each divisor there is a transition map from the ring at the multiple to the ring at the divisor, obtained from the descent construction; the transitions compose, and on the quotients they induce the FROBENIUS operator of the q-Witt rings, not the restriction operator. Naming them correctly is the point: the previous node has shown that no restriction operator exists, so a map called by that name would be claiming something false. This node constructs the transitions, proves the composition law and identifies the induced map.

**Hypotheses.**

- The divisor relation is divisibility; the transitions are along it.
- The identification on quotients is with the Frobenius at the ratio of the two integers.
- The composition law is for a chain of divisors.

**Proof outline.**

1. Construct the transition maps from the descent construction.
2. Prove the composition law.
3. Identify the induced map on the quotients with the Frobenius at the ratio.
4. Record the source's own remark making that identification.
5. State the naming rule and the reason for it.
6. Record the naturality of the whole system in the pair.

**Acceptance.**

- The transitions compose.
- On quotients they induce the Frobenius at the ratio.
- They are not restriction maps and are not named as such.
- The system is natural in the pair.

**Prerequisites.** `HabiroRings:HR.4/the-etale-lift`, `HabiroRings:HR.4/there-is-no-restriction-map`

**Sources.**

- §2, the proof of the q-Witt comparison, The ghost relation that identifies the induced map, verbatim.

  > If p is prime and pd divides m, then the ghost maps for the usual Witt vectors satisfy gh_{m/d}(x) = gh_{m/pd}(x)^p. It follows that the ghost maps for relative q-Witt vectors fit into a commutative diagram

## HR.5 — The relative Habiro ring and its Taylor presentation

`H_{R/A} = lim_m H_{R/A,m}`, computable along a factorial sequence, complete,
with a universal property; base change **only** under the hypotheses the
construction supports.

The equaliser: compatible cyclotomic Taylor series, coefficients twisted by
`ψ^m`, with the **canonical** arrow and the **Frobenius-then-re-expansion**
arrow. Keep the **full cyclotomic coefficient algebra**, not one p-adic
embedding.

**A proof line needs repair.** `Φ_m` modulo `ℓ ∤ m` is separable with finite
étale quotient — but it can **split** (`Φ₅` over `𝔽₁₁`). Do the fracture
componentwise with idempotent descent. The theorem is not false; the line is.

Coverage: **source_decomposed**.

Four nodes. The relative Habiro ring as the limit, with the equivalence of the divisor and factorial systems, completeness, the universal property and base change under its own hypotheses rather than an unrestricted formula; the equaliser presentation, with both arrows named — the canonical re-expansion and the relative Frobenius followed by re-expansion — and with the source's proof strategy of checking after completion at each prime and rationally at each cyclotomic polynomial; the root choices with their change-of-choice invariance and the convergence of the substitutions, carrying the stage text's requirement that the full cyclotomic coefficient algebra be kept; and the repair node, which states the false proof line, gives the splitting counterexample and prescribes componentwise idempotent descent, while recording that the theorem itself is not in doubt.

### The relative Habiro ring as a limit

`HabiroRings:HR.5/the-relative-habiro-ring` · *construction* · planet **The relative Habiro ring**

The RELATIVE HABIRO RING of an etale algebra over a perfectly covered base is the limit of the rings of HR.4 over all positive integers, along the transition maps. The divisor system and any cofinal factorial sequence give canonically equivalent limits, so the ring may be computed along either. It is complete in the sense of HR.2 and it has the universal property of a complete ring for continuous maps; every functorial map of the relative etale construction is inherited by it. Base change holds under the flatness and completion hypotheses the construction supports, and no unrestricted tensor formula is part of the interface.

**Hypotheses.**

- The base is perfectly covered and the algebra is etale over it.
- The limit is along the transition maps of HR.4, which are Frobenius maps on the quotients.
- Base change is asserted only under the stated hypotheses; the general formula is not claimed.

**Proof outline.**

1. Define the ring as the limit and prove that it is well defined.
2. Prove that the divisor system and a cofinal factorial sequence give equivalent limits.
3. Prove completeness and state the universal property.
4. Record the inherited functorial maps.
5. State the base-change statement with its hypotheses and record what is not claimed.
6. Record staticity, which the theorem of HR.4 gives for the limit as well as for each stage.

**Acceptance.**

- The ring is static, an ordinary ring.
- The divisor and factorial limits agree.
- Base change holds under the stated hypotheses only.
- The ring is Habiro-complete in the sense of HR.2.

**Prerequisites.** `HabiroRings:HR.4/the-etale-lift`, `HabiroRings:HR.2/habiro-complete-modules`, `HabiroRings:HR.4/the-transitions-are-frobenius`

**API.**

| name | role | statement |
| --- | --- | --- |
| `relativeHabiro` | data | The limit over the integers. |
| `relativeHabiro_factorial` | characterisation | Equivalence with the factorial limit. |
| `relativeHabiro_static` | characterisation | Staticity. |
| `relativeHabiro_complete` | characterisation | Habiro-completeness. |
| `relativeHabiro_universal` | characterisation | The universal property. |
| `relativeHabiro_baseChange` | compatibility | Base change under its hypotheses. |

**Used by.**

- *HR.5, the equaliser* — The presentation is of this ring.
- *HR.6* — The cohomology comparison identifies its coefficient object with this ring.
- *HabiroNumberFields:HB.6* — The number-field ring is the case of the integers as base.

**Unit tests.**

- `factorial` — The factorial limit gives the same ring.
- `static` — The ring is an ordinary ring.
- `no_general_base_change` — No unrestricted base-change formula is claimed.
- `universal` — A continuous map into a complete ring factors through it.

**Sources.**

- §2, the section opening, The construction and its scope, verbatim, including the source’s own note that the etale case is the accessible one.

  > relative Habiro ring H_{R/A} for any etale algebra R over A, and to relate this construction to the theory of q-Witt vectors. In the case where A = Z, our construction H_{R/Z} recovers the ring H_R from the Habiro ring of a number field paper. As we'll see, the construction of H_{R/A} is a special case of a much more general construction. However, the general case is vastly more ...

### The equaliser presentation by compatible cyclotomic Taylor series

`HabiroRings:HR.5/the-equaliser-presentation` · *theorem* · planet **The equaliser presentation**

The relative Habiro ring is the EQUALISER of two maps between products of power-series rings: the product over all integers of the power series in the variable q minus the root of unity of that order, with coefficients the base change of the algebra along the corresponding Adams operation with the root adjoined; and the product over pairs of a prime and an integer of the corresponding completed rings. The two arrows are the CANONICAL map, which re-expands a series at the coarser root, and the FROBENIUS, which applies the relative Frobenius and then re-expands. The equaliser may be taken in E-infinity algebras or in ordinary ones, and the source proves the comparison by checking it after completion at each prime and rationally at each cyclotomic polynomial.

**Hypotheses.**

- The algebra is etale over a perfectly covered base.
- The two arrows are the ones the source names; the second is the relative Frobenius followed by re-expansion and not either alone.
- The check is after completion at each prime and rationally at each cyclotomic polynomial, which is legitimate because both sides are Habiro-complete.

**Proof outline.**

1. State the equaliser with both products and both arrows.
2. Record the source's proof strategy: compare with the equaliser built from the cyclotomic completions, use staticity and coconnectivity to get a map, and check after the two families of completions.
3. Record the prime-completion step, in which the factors at other primes die and the surviving Frobenii become equivalences.
4. Record that the equaliser may be taken in either category, which is the source's parenthesis.
5. Record the intuition the source gives: the ring consists of power series that can be Taylor-expanded around each root of unity, and whenever two expansions can be compared p-adically they must agree.

**Acceptance.**

- The equaliser may be taken in E-infinity algebras or in ordinary ones.
- The two arrows are the canonical map and the Frobenius followed by re-expansion.
- The comparison is checked after completion at each prime and rationally at each cyclotomic polynomial.
- The presentation makes precise the intuition that the ring is one of Taylor-expandable series.

**Prerequisites.** `HabiroRings:HR.5/the-relative-habiro-ring`, `HabiroRings:HR.1/the-etale-frobenius-lift`

**Sources.**

- §2, the comparison lemma, The equaliser with both arrows, verbatim.

  > The ring H_{R/A} agrees with the following equaliser (which can be taken both in E-infinity A[q]-algebras or in ordinary A[q]-algebras): H_{R/A} is the equaliser of the canonical map and the Frobenius, from the product over m of (R tensor_{A, psi^m} A)[zeta_m][[q - zeta_m]] to the product over p and m of the p-completion of (R-hat_p tensor_{A, psi^m} A)[zeta_{pm}][[q - zeta_m]].

- §2, the proof of the comparison lemma, The proof strategy, verbatim.

  > Since both sides are Habiro-complete, whether this map is an equivalence can be checked after p-completion for all primes and after rationalised completion at each Phi_d(q). Proof after l-completion. After l-completion, all factors with p not l die, and the surviving Frobenii become equivalences.

### Root choices, their change and the convergence of the substitutions

`HabiroRings:HR.5/roots-choices-and-substitutions` · *construction*

The equaliser is written with a chosen root of unity of each order, and the re-expansion maps substitute the difference of two roots into a power series. This node constructs the choices, proves that the presentation is invariant under changing them, and proves that the substitutions converge — which is the same statement the classical roadmap proves, that the difference of two roots is topologically nilpotent in the relevant completion. The stage text adds a requirement this node carries: work with the FULL cyclotomic coefficient algebra, or with all of its finite etale factors, rather than silently choosing one p-adic embedding of a root.

**Hypotheses.**

- The roots are chosen for each order; the change of choice is by a Galois element or by a power.
- The substitution is of the difference of two roots, in the completion at a prime.
- The coefficient algebra is the full one; a single embedding is a choice that must not be made silently.

**Proof outline.**

1. Construct the choices and the re-expansion maps.
2. Prove the invariance of the presentation under change of choice.
3. Prove convergence of the substitutions from topological nilpotence, citing the classical roadmap's statement.
4. State the full-algebra requirement and record what goes wrong with a single embedding.
5. Record the source's own description of the maps as re-expansion morphisms.

**Acceptance.**

- The presentation does not depend on the chosen roots.
- The substitutions converge, by topological nilpotence.
- The coefficient algebra is the full cyclotomic one; a single embedding loses the other factors.
- The re-expansion maps are the ones the source names.

**Prerequisites.** `HabiroRings:HR.5/the-equaliser-presentation`, `HabiroCyclotomicCompletions:HC.3`

**API.**

| name | role | statement |
| --- | --- | --- |
| `rootChoice` | data | A choice of root of unity at each order. |
| `reExpansion` | data | The re-expansion map. |
| `reExpansion_converges` | characterisation | Convergence from topological nilpotence. |
| `presentation_indep_of_choice` | characterisation | Invariance under change of choice. |
| `fullCyclotomicAlgebra` | relation | The requirement to keep the full coefficient algebra. |

**Used by.**

- *HR.5, the number-field comparison* — The comparison is read off the presentation with these choices.
- *HR.7* — The acceptance test on two elements with the same value and different expansions uses them.
- *HabiroNumberFields:HB.6* — The same substitution lemma is stated there.

**Unit tests.**

- `change_of_choice` — Changing the chosen roots does not change the ring.
- `converges` — The substitutions converge.
- `full_algebra` — Keeping one embedding instead of the full algebra loses information.
- `classical_case` — For the integers the presentation is the classical Taylor description.

**Sources.**

- §2, the remark on the classical ring, The re-expansion maps and the intuition they make precise, verbatim.

  > Here the Frobenius is just given by the reexpansion morphisms from Z[zeta_{pm}][[q - zeta_{pm}]] to Z_p[zeta_{pm}][[q - zeta_m]] for all p and all m. This gives precise meaning to the intuition that the Habiro ring is the ring of power series that can be Taylor-expanded around each root of unity. Whenever two such expansions can be compared p-adically, they must coincide.

### A proof line that needs repair: the cyclotomic polynomial need not stay irreducible

`HabiroRings:HR.5/the-cyclotomic-splitting-repair` · *comparison*

The adopted route contains a proof line asserting that the cyclotomic polynomial of an order is irreducible modulo every prime not dividing that order. That is FALSE as stated: the polynomial is separable there and its quotient algebra is finite etale, but it can split — the fifth cyclotomic polynomial over the field with eleven elements is the standing counterexample. The repair is to carry out the arithmetic fracture step componentwise, by idempotent descent over the finite etale algebra, and to reassemble. This node states the defect, the counterexample and the repair, and records that it is a proof obligation in the route and not a claim that the theorem is false.

**Hypotheses.**

- The prime does not divide the order; the quotient of the polynomial ring by the cyclotomic polynomial is then finite etale over the residue field.
- Finite etale does not mean a field: it is a finite product of fields, one for each factor.
- The repair is idempotent descent over that product, followed by reassembly.

**Proof outline.**

1. State the assertion as it appears and say precisely what is true instead: separability and finite etaleness, not irreducibility.
2. Give the counterexample explicitly and compute the number of factors.
3. State the repair: perform the fracture componentwise and reassemble by idempotent descent.
4. Record that the equaliser theorem itself is not in doubt; what is in doubt is one line of one proof.
5. Record the acceptance test the stage text attaches to this, which is exactly the counterexample.

**Acceptance.**

- The cyclotomic polynomial is separable modulo a prime not dividing its order, and its quotient is finite etale.
- It need not be irreducible: the fifth one splits over the field with eleven elements.
- The repair is componentwise fracture with idempotent descent.
- The theorem is not false; one proof line needs the repair.

**Prerequisites.** `HabiroRings:HR.5/the-equaliser-presentation`, `HabiroCyclotomicCompletions:HC.4`

**Sources.**

- §2, the proof of the comparison lemma, The fracture step of the proof, verbatim; the stage text records that the line justifying it by irreducibility of the cyclotomic polynomial modulo the prime needs the repair this node states.

  > After l-completion, all factors in E with p not l die, and the surviving Frobenii become equivalences.

## HR.5-number-field-comparison — Number-field comparison

`R = A = ℤ` gives the classical Habiro ring in its Taylor presentation; and for
`R = O_F[1/Δ]` the relative ring **is** the GSWZ ring that `HabiroNumberFields`
constructs directly — with the two gluing conditions matched, not just the
underlying sets. Neither construction is an input to the other.

Coverage: **source_decomposed**.

Two nodes. The classical Habiro ring, recovered by specialising the equaliser to the integers and compared with the classical roadmap's inverse limit with matching projections; and the number-field ring, recovered as the source's corollary and compared with the Frobenius-glued ring the number-field roadmap constructs, with the gluing conditions matched rather than only the underlying sets, and with the stage text's note that neither construction is an input to the other.

### Recovering the classical Habiro ring

`HabiroRings:HR.5-number-field-comparison/the-classical-ring` · *theorem*

Taking the base and the algebra both to be the integers, the equaliser presentation becomes the classical description of the Habiro ring: the equaliser of the canonical and the re-expansion maps between the product over all orders of the power series over the cyclotomic integers and the product over pairs of a prime and an order of the corresponding p-adic rings. The source states exactly this, and the comparison with the classical roadmap's inverse-limit construction is what makes the two descriptions the same object.

**Hypotheses.**

- The base and the algebra are the integers; the roots are the ordinary roots of unity.
- The comparison with the inverse-limit construction is with the classical roadmap's ring at all orders.
- The identification is of rings, and it is compatible with the projections on both sides.

**Proof outline.**

1. Specialise the equaliser presentation.
2. Record the source's own statement of the resulting description.
3. Compare with the classical roadmap's inverse limit and prove that the two agree, matching the projections.
4. Record the intuition the source attaches to it.
5. Record what the comparison needs from the classical roadmap, namely its first four layers.

**Acceptance.**

- The specialisation is the classical Taylor description.
- It agrees with the classical inverse-limit construction, with matching projections.
- The comparison uses the classical roadmap's first four layers.

**Prerequisites.** `HabiroRings:HR.5/the-equaliser-presentation`, `HabiroCyclotomicCompletions:HC.1`, `HabiroCyclotomicCompletions:HC.3`

**Sources.**

- §2, the remark on the classical ring, The classical specialisation, verbatim.

  > In the special case where R = Z, we obtain the following presentation of the ordinary Habiro ring: H is the equaliser of the canonical map and the Frobenius, from the product over m of Z[zeta_m][[q - zeta_m]] to the product over p and m of Z_p[zeta_{pm}][[q - zeta_m]].

### Recovering the Habiro ring of a number field

`HabiroRings:HR.5-number-field-comparison/the-number-field-ring` · *theorem* · planet **The number-field comparison**

For a number field and the ring of integers with the discriminant inverted, the relative Habiro ring over the integers agrees with the Frobenius-glued ring the number-field roadmap constructs. The source states this as a corollary of the equaliser presentation, and the comparison is an identification of RINGS: it matches the two Frobenius-gluing conditions, the two families of coefficient algebras and the two systems of projections, and it is the point at which the general construction of this roadmap and the explicit one of that roadmap meet.

**Hypotheses.**

- The field is a number field and the inverted integer is divisible by the discriminant, and by six where the module theory of the other roadmap needs it.
- The comparison is with the ring of that roadmap's Definition, which is the Frobenius-glued family of power series.
- The identification matches the gluing conditions, not merely the underlying sets.

**Proof outline.**

1. Specialise the equaliser presentation to the base of the integers and the algebra of S-integers.
2. Match the equaliser's two arrows with the gluing condition of the number-field roadmap.
3. Record the source's own corollary.
4. Record what the comparison requires of the other roadmap, namely its already-constructed ring and its substitution lemma.
5. Record the stage text's point that this roadmap's ring can be constructed first and that the comparison is not an input to the other construction.

**Acceptance.**

- The two rings agree, with their gluing conditions matched.
- The comparison is a corollary of the equaliser presentation.
- Neither construction is an input to the other; the comparison is a theorem about both.

**Prerequisites.** `HabiroRings:HR.5-number-field-comparison/the-classical-ring`, `HabiroNumberFields:HB.6`

**Sources.**

- §2, the corollary after the comparison lemma, The comparison with the number-field ring, verbatim.

  > If F is a number field with discriminant Delta and R is O_F[1/Delta], then H_{R/Z} agrees with the Habiro ring H_R defined in the Habiro ring of a number field paper. Proof. This follows immediately from the comparison lemma.

- §1, the introduction, on the number-field ring, The hypotheses on the inverted integer, verbatim.

  > Let F be a number field and let Delta be divisible by 6 times the discriminant of F. Garoufalidis, Scholze, Wheeler and Zagier construct a certain formally etale H-algebra: the Habiro ring of the number field F.

## HR.6 — Coefficient and cohomology interfaces

The degree-zero part of Habiro cohomology **is** the ring of HR.5, compatibly
with multiplication, every cyclotomic specialisation, the `q−1` completion and
functoriality in pairs.

Imports `HB.7`'s K₃-graded modules and proves **only** what that roadmap
supports: no new K₃, no assumption that every module is free, and **a graded**
**line module is not a higher-degree cohomology class**.

**A late return edge, not a cycle**: HR.1–5 precede HQ.3–5; this layer consumes
them afterwards.

Coverage: **source_decomposed**.

Three nodes. The degree-zero identification of the coefficient object of Habiro cohomology with the ring of HR.5, with the four compatibilities the stage text lists and with the cohomology functor imported rather than constructed; the module interfaces, exporting complete modules, derived scalar extension, perfect complexes and the Picard comparison, importing the K-three-graded modules from the number-field roadmap and proving only what that roadmap supports, with an explicit completion map exhibiting what is lost at q minus one and with the warning that a graded line module is not a cohomology class; and the ordering node, which records that this is a late return edge and not a cycle and that the crystalline, A-infinity and prismatic comparisons enter through their own owners.

### Identifying the coefficient object of Habiro cohomology with the relative ring

`HabiroRings:HR.6/the-degree-zero-identification` · *comparison*

Once the cohomology roadmap has constructed the Habiro-Hodge complex and its comparisons, its degree-zero part is identified with the relative Habiro ring of HR.5, compatibly with multiplication, with every cyclotomic specialisation, with the completion at q minus one and with the functoriality in pairs. The cohomology functor and its filtered comparisons are that roadmap's; what this layer supplies is the identification of the coefficient object with the ring built here independently. The source's descent theorem is the statement that makes the identification possible, and it is quoted here rather than reproved.

**Hypotheses.**

- The pair is a perfectly covered base with an algebra satisfying the hypotheses the cohomology roadmap imposes.
- The identification is of E-infinity algebras and is compatible with the four structures listed.
- The cohomology functor is imported; this node states only the identification.

**Proof outline.**

1. Record the descent theorem that produces the Habiro-level object.
2. State the degree-zero identification with the ring of HR.5.
3. State the four compatibilities: multiplication, cyclotomic specialisations, the completion at q minus one, and functoriality in pairs.
4. Record the boundary: the cohomology functor, its filtrations and its comparisons belong to the cohomology roadmap.
5. Record the quotient identification with the q-Witt complexes, which is the same theorem's second half and which the cohomology roadmap owns in positive degrees.

**Acceptance.**

- The degree-zero part is the relative Habiro ring.
- The identification respects multiplication, the specialisations, the completion and the functoriality.
- The cohomology functor itself is imported and is not constructed here.

**Prerequisites.** `HabiroRings:HR.5/the-relative-habiro-ring`, `HabiroCohomologyFoundations:HQ.5`, `HabiroCohomologyFoundations:HQ.3`

**Sources.**

- §1, the descent theorem in the introduction, The descent theorem and the q-de Rham-Witt comparison, verbatim; the degree-zero identification of this node is what connects its coefficient object with the ring of HR.5.

  > The q-Hodge complex functor admits a non-trivial symmetric monoidal factorisation through the Habiro-complete objects. ... For all m, the quotient by q^m - 1 admits a functorial exhaustive ascending filtration whose associated graded is the m-truncated q-de Rham-Witt complex.

### What is exported to the cohomology roadmap, and what is imported back

`HabiroRings:HR.6/the-module-interfaces` · *construction*

This layer exports the complete modules of HR.2, derived scalar extension, perfect complexes and the comparison of invertible modules, and it imports the modules graded by the third K-group from the number-field roadmap. What it proves about those is ONLY the scalar-extension and Picard comparisons that roadmap supports: it does not construct a new third K-group and does not assume that every module is free. It also records, through an actual completion map, what information can disappear after completion at q minus one, and states that a line module graded by a K-theory class is not automatically a higher-degree cohomology class on a scheme.

**Hypotheses.**

- The modules are Habiro-complete in the sense of HR.2; the graded ones are the number-field roadmap's.
- The Picard comparison is only for the invertible objects both sides actually have.
- The completion at q minus one is a map, and the information it loses is exhibited rather than asserted.

**Proof outline.**

1. List the exported objects with the node that supplies each.
2. State the import from the number-field roadmap and exactly what is proved about it.
3. Exhibit the completion map at q minus one and what it kills.
4. State the two non-examples: no new third K-group is constructed, and a graded line module is not a cohomology class.
5. Record the freeness caution: not every module is free, which the number-field roadmap also states.

**Acceptance.**

- The exported objects each have a supplying node.
- Only the comparisons the number-field roadmap supports are proved.
- Completion at q minus one loses information, exhibited by an explicit map.
- A graded line module is not a higher-degree cohomology class.

**Prerequisites.** `HabiroRings:HR.2/the-monoidal-structure`, `HabiroNumberFields:HB.7`, `HabiroRings:HR.6/the-degree-zero-identification`

**API.**

| name | role | statement |
| --- | --- | --- |
| `exportedCompleteModules` | data | The complete modules exported. |
| `derivedScalarExtension` | data | Derived scalar extension along a map of pairs. |
| `perfectComplexes` | data | The perfect complexes exported. |
| `picardComparison` | characterisation | The comparison of invertible modules, as far as supported. |
| `completionAtQMinusOne` | data | The completion map at q minus one, with what it kills. |

**Used by.**

- *HQ.5* — The cohomology roadmap consumes these interfaces.
- *HabiroNumberFields:HB.7* — The graded modules are imported from there and compared.
- *HR.7* — The acceptance tests include the degree-zero comparison.

**Unit tests.**

- `no_new_K3` — No third K-group is constructed here.
- `not_free` — Not every module is free; the comparison does not assume it.
- `completion_loses` — The completion at q minus one kills information, exhibited by the map.
- `line_not_class` — A graded line module is not a higher-degree cohomology class.

**Sources.**

- §1, on the number-field ring and its regulator, The K-theoretic grading whose modules this layer imports, verbatim as far as the source states it here; the modules themselves are the number-field roadmap’s.

  > Moreover, the authors construct a regulator map from K_3(F) to ...

### This is a late return edge, not a cycle

`HabiroRings:HR.6/the-late-return-edge` · *comparison*

The dependency between this roadmap and the cohomology roadmap runs in both directions but not in a circle: the first five layers here precede the cohomology roadmap's middle layers, and this layer consumes those completed stages afterwards. The stage text calls it a late return edge and this node records the ordering explicitly, together with the boundary for the crystalline, A-infinity and prismatic comparisons, which enter through the cohomology roadmap's last layer and through their own owners and never through a second construction inside this roadmap.

**Hypotheses.**

- The ordering is: HR.1 to HR.5, then the cohomology roadmap's construction layers, then HR.6.
- The comparisons named enter through their owners; this roadmap builds none of them.
- The edge is one of consumption, not of construction.

**Proof outline.**

1. State the ordering explicitly.
2. Record that HR.1 to HR.5 do not depend on the cohomology roadmap.
3. Record the boundary for the three comparisons.
4. State the rule: no construction inside this roadmap duplicates a comparison owned elsewhere.

**Acceptance.**

- The first five layers are independent of the cohomology roadmap.
- This layer consumes its completed stages.
- The crystalline, A-infinity and prismatic comparisons are owned elsewhere.

**Prerequisites.** `HabiroRings:HR.6/the-degree-zero-identification`, `HabiroCohomologyFoundations:HQ.8`, `PrismaticCohomology:PR.0`

**Sources.**

- §1, the introduction, The source’s own ordering of the material, verbatim: the etale construction comes first and the general descent afterwards, which is the ordering this node records.

  > As we'll see, the construction of H_{R/A} is a special case of a much more general construction. However, the general case is vastly more technical, and we hope that discussing the etale case first will make the general case easier.

## HR.7 — Acceptance tests and executable boundary

Seven tests, each attached to the node it exercises — including `Φ₅` over `𝔽₁₁`
(guarding HR.5's repair) and two elements agreeing at a root but with different
full Taylor expansions there.

**The generic equaliser is not a Habiro construction.** The suggested Lean file
proves an equaliser universal property with abstract input maps; every
coefficient, topology, completion and descent contract above remains required,
and **no placeholder or axiom stands for them**.

Coverage: **source_decomposed**.

Two nodes. The seven acceptance tests, each attached to the node it exercises, with the three structural checks the stage text adds and with the reason the splitting test and the value-versus-expansion test are required; and the executable boundary, which states what the suggested Lean file proves — a generic equaliser universal property with abstract input maps — and what it does not, namely any of the coefficient, topology, completion or descent contracts, for which no placeholder or axiom is admitted.

### The required acceptance tests

`HabiroRings:HR.7/the-acceptance-tests` · *comparison*

The layer is accepted when seven computations have been carried out: the base and the algebra both the integers; a non-trivial finite etale arithmetic algebra; a toric Lambda-base; a localisation at a prime with the resulting behaviour of the cyclotomic components; the fifth cyclotomic polynomial over the field with eleven elements, which guards the finite-etale-versus-field distinction of HR.5; two elements with the same value at a chosen root but different full Taylor expansions there; and the degree-zero cohomology comparison. Each test is attached here to the node it exercises, and three structural checks are added: that the q-Witt transition is the Frobenius, that the square diagrams commute, and that no ring action uses incompatible constant families.

**Hypotheses.**

- The tests are over the bases and algebras named; the fifth test is the counterexample of HR.5.
- A test is carried out when its data are exhibited, not when its existence is asserted.
- The three structural checks are about the interfaces rather than about particular objects.

**Proof outline.**

1. List the seven tests with the node each exercises.
2. State the standard for a test being carried out.
3. State the three structural checks.
4. Record why the fifth and sixth tests are required: they are the two places where a plausible shortcut is wrong.
5. Record the boundary with the cohomology roadmap for the seventh.

**Acceptance.**

- Every test has a node that supplies what it exercises.
- The fifth test is the splitting counterexample and guards the repair of HR.5.
- The sixth distinguishes a value from a full Taylor expansion.
- The transition map is the Frobenius, not a restriction.

**Prerequisites.** `HabiroRings:HR.5/the-cyclotomic-splitting-repair`, `HabiroRings:HR.4/the-transitions-are-frobenius`, `HabiroRings:HR.6/the-degree-zero-identification`, `HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations`

**Sources.**

- §2, the construction, The construction the tests exercise, verbatim; the tests themselves are the stage text’s and are attached here to the nodes that supply them.

  > For every d dividing m, let E_d be the Phi_d(q)-completion of (R tensor_{A, psi^d} A)[q]

### What the suggested Lean file is, and what it is not

`HabiroRings:HR.7/the-executable-boundary` · *comparison*

The suggested Lean file for this roadmap proves a concrete equaliser-ring universal property against the current library, with abstract input maps that will later be instantiated by the canonical and Frobenius Taylor maps of HR.5. That is a useful skeleton and it is NOT a Habiro construction: the coefficient, topology, completion and descent contracts of HR.1 to HR.6 all remain required, and no placeholder proposition or axiom stands in for any of them. This node states the boundary so that the file is read for what it is.

**Hypotheses.**

- The universal property proved is that of an equaliser of two maps of rings, with no Habiro content.
- The input maps are abstract; instantiating them is the work of HR.5.
- No axiom or placeholder is admitted for any of the contracts.

**Proof outline.**

1. State what the file proves.
2. State what remains to be supplied, layer by layer.
3. State the rule about placeholders and axioms.
4. Record how the instantiation will proceed once HR.5's maps exist.
5. Record that the generic equaliser is also what the number-field roadmap's presentation would instantiate, so the skeleton is shared.

**Acceptance.**

- The generic equaliser is not a Habiro construction.
- Every contract of the earlier layers remains required.
- No placeholder or axiom stands for a contract.
- The skeleton is shared with the number-field presentation.

**Prerequisites.** `HabiroRings:HR.7/the-acceptance-tests`, `HabiroRings:HR.5/the-equaliser-presentation`

**Sources.**

- §2, the comparison lemma, The equaliser the Lean skeleton abstracts, verbatim; the abstraction keeps the shape and drops all the content, which is what this node records.

  > The ring H_{R/A} agrees with the following equaliser (which can be taken both in E-infinity A[q]-algebras or in ordinary A[q]-algebras)

## Gaps

### The companion q-Witt paper was not obtained

Needed by: `HabiroRings:HR.4`, `HabiroRings:HR.1`.

HR.4 is about the relative q-Witt rings, and the stage text cites the companion paper by section for their construction, their ghost description and, crucially, the obstruction to a restriction operator. That paper was not obtained: the source read cites it throughout but does not restate those results. The HR.4 nodes therefore state the rings and the obstruction as the stage text states them, with the attribution, and decompose neither. The same paper is cited for the equivalence of the two descriptions of perfect covering in HR.1. NEXT SOURCE ACTION: obtain Wagner's q-Witt paper and decompose the construction of the relative q-Witt rings, the ghost description and the no-restriction obstruction.

### The appendix was read only at its opening

Needed by: `HabiroRings:HR.2`.

The appendix's definition of Habiro-complete spectra and its claim about the completion functor were read; the four detection results the stage text names, and the solid comparison, were not read in their own statements. The HR.2 nodes state them as the stage text lists them and record that. The numbering is now resolved: the appendix's statements are B.2, B.3, B.4 and B.8 under the source's per-section counter. NEXT SOURCE ACTION: read the appendix in full and decompose each of those four statements.

### The later sections on Habiro descent were not read

Needed by: `HabiroRings:HR.6`.

The descent theorem was read in its introductory form, which is what HR.6's identification rests on; its proof and the whole treatment of twisted q-de Rham complexes were not read. HR.6's nodes state the identification and its compatibilities and decompose no proof. NEXT SOURCE ACTION: read the descent section in full; it is also what the cohomology roadmap needs.

## Requests

- **`PrismaticCohomology:PR.0`** — The generic delta-ring interface at a single prime, which HR.1 imports; the commuting all-prime Lambda-structure is this roadmap's own.

- **`HabiroCyclotomicCompletions:HC.1`** — The ordinary inverse-limit completion with its cofinal factorial tower, which HR.2 imports and HR.5 compares with.

- **`HabiroCyclotomicCompletions:HC.3`** — The substitution and re-expansion lemma under topological nilpotence, which HR.5's root choices need.

- **`HabiroCyclotomicCompletions:HC.4`** — The comaximality of cyclotomic polynomials with non-prime-power ratio, which is the arithmetic input to HR.3's intersection computation.

- **`DerivedDeRhamCohomology:DD.1`** — Generic derived completion, of which the Habiro completion of HR.2 is a specialisation.

- **`EnhancedDerivedSheaves:E0`** — The enhanced module and localisation machinery HR.2 and HR.3 are built in.

- **`EnhancedDerivedSheaves:E5:abstract`** — The abstract descent and conservativity statements HR.2's detection results and HR.3's morphism-level statement specialise.

- **`StableHomotopyKTheory:H.3`** — The spectral setting for the monoidal structure of HR.2, with the localisation comparison proved rather than assumed.

- **`VStackSheavesAndLisseCategories:VS2`** — The qualified solid formalism, in which HR.2's bounded-below solid comparison is stated.

- **`HabiroCohomologyFoundations:HQ.3`** — The construction of the Habiro cohomology functor, whose coefficient object HR.6 identifies.

- **`HabiroCohomologyFoundations:HQ.4`** — The positive-degree q-de Rham-Witt complex, which extends HR.4's rings and which this roadmap does not construct a second time.

- **`HabiroCohomologyFoundations:HQ.5`** — The filtered comparisons HR.6 consumes.

- **`HabiroCohomologyFoundations:HQ.8`** — The crystalline, A-infinity and prismatic comparisons, which enter through that layer and their own owners and never through a construction inside this roadmap.

- **`HabiroNumberFields:HB.6`** — The explicit Frobenius-glued ring of a number field, which HR.5's number-field comparison identifies with the relative construction; the stage text records that either may be built first.

- **`HabiroNumberFields:HB.7`** — The K-three-graded modules, which HR.6 imports and about which it proves only the scalar-extension and Picard comparisons that roadmap supports.

## Structural proposals

### HR.4 has no obtainable source for its central objects

*note-missing-source*

The relative q-Witt rings, their ghost description and the obstruction to a restriction operator are all in the companion q-Witt paper, which the source read cites but does not restate and which was not obtained here. HR.4's stage text should name that paper explicitly as its implementation source, as the other layers name this one, so that the dependency is visible before a worker starts.

### HR.2 carries a general theory and a specific one

*propose-split*

HR.2 asks both for the generic derived-completion machinery, imported from three other roadmaps, and for the Habiro-specific completion with its detection results and its monoidal and solid comparisons. The first is import and glue; the second is the appendix's content. As one layer it cannot record that the imports are available now while the appendix is still being read. The four nodes divide one to three along that line.

## What this blueprint does not claim

No Lean was compiled. The Mathlib build on this machine is a shared cache that
must not be rebuilt, and this working tree has no elaborated dependency modules.
Every `implementationStatus` is `unchecked`, the suggested Lean file is a naming
proposal whose proofs are all `sorry`, and nothing here is claimed to be
formalised.

Six excerpts ran past four hundred characters and were elided at a word
boundary; the locators name the printed pages so the full text can be read.
