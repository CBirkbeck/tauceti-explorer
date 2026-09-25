# HabiroNumberFields — HB.1, HB.2, HB.6 and HB.7

The blueprint for the four layers in scope: the integral Bloch conventions with
the finite Chern class, the cyclic quantum dilogarithm, the number-field Habiro
ring, and the modules graded by `K₃`. This document is definitive; the packet
`research/blueprint/packets/HabiroNumberFields.json` is its machine form and the
suggested Lean file is a naming proposal, not an implementation.

Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## The sources

Three, all freely available and all hash-recorded:

> Stavros Garoufalidis, Peter Scholze, Campbell Wheeler, Don Zagier, *The Habiro ring of a number field*. arXiv:2412.04241; the PDF of the version on disk. Locators give the section and the numbered statement.
> <https://arxiv.org/abs/2412.04241>, SHA-256 `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9`, accessed 2026-09-24.

> Frank Calegari, Stavros Garoufalidis, Don Zagier, *Bloch groups, algebraic K-theory, units, and Nahm's conjecture*. arXiv:1712.04887v3, 6 April 2021. Locators give the section and the numbered statement.
> <https://arxiv.org/abs/1712.04887>, SHA-256 `024317c20a1d8b66234e608af46941093a675b6399ef480dfedd52a31dcd7bf5`, accessed 2026-09-24.

> Kevin Hutchinson, *The Chern class and the cyclic quantum dilogarithm*. arXiv:2104.14413v4, LaTeX source. Locators give the section and the label of the numbered statement in that source.
> <https://arxiv.org/abs/2104.14413>, SHA-256 `ee224a185b2bd1b8094e35f7f6b11ce282981ec639c1220869a66b0f3d15df5e`, accessed 2026-09-25.

### The Habiro ring of a number field: what was read

- The file was already on disk from this session's HabiroNahmSeries job, where its hash was checked against the record in plans/HABIRO.md, and it was re-read here. The hash recorded in this packet is the one computed from the file on disk.
- §1.4, Definition 1.1 with its three footnotes and the remark that follows: the gluing property, the restricted rings, the vacuity at inverted primes, the abelian case with its global Frobenius lift and base-change description, and the identification with the classical Habiro ring.
- §1.5, Definition 1.3 with Theorem 1, and Definition 1.4 with the remarks that follow: invertible local sections with their logarithmic Frobenius condition and formal completion, the existence and rank-one statement, the global module with its two conditions, the role of the equivariance of the units, the restriction to primes prime to six, and the change-of-index operation with the difficulty the source flags.
- NOT read for this packet: §§2 and 3 in full, which contain the proofs and the admissible-series machinery, and §§4 to 5. The earlier job in this session read §§1 to 2 for the Nahm-series packet.

### Bloch groups, algebraic K-theory, units, and Nahm's conjecture: what was read

- Also already on disk from the Nahm-series job of this session and re-read here; the hash recorded is the one computed from the file on disk.
- §1, the abstract and introduction: the construction of the unit from a Bloch-group element and an order, Theorem 1.2 with the finite excluded set and the two sharper hypotheses, Remark 1.3 on the dependence on the chosen root of unity, and Theorem 1.6 with the universal scalar and the conjecture about it.
- The table of contents and the section headings, which locate the finite-field reduction, the local Chern class maps and the comparison whose statement is Theorem 1.6.
- NOT read for this packet: §§2 to 7 in full. The Nahm-series job of this session read the sections on Nahm sums and asymptotics.

### The Chern class and the cyclic quantum dilogarithm: what was read

- Downloaded from the arXiv e-print endpoint as LaTeX source; the hash recorded is of the gzipped file the endpoint returns. Quotations are from the source, with the mathematics written out in words.
- The abstract and §1: the statement that the units map is the square of the Chern class, with the hypotheses on the order and on the roots of unity in the field.
- §2: Suslin's exact sequence with the corollary giving an isomorphism modulo an odd integer, the Chern-class isomorphism for the indecomposable part with its number-field corollary and the vanishing of the Milnor group, and Soule's product formula with the specialisation used.
- §3, the theorem computing the Chern class on the distinguished element, with the commutative diagram its proof begins from.
- NOT read: the rest of §3 and §4, which contain the Bott-element computation and the completion of the proof.

There is **no integrated decomposition** for this roadmap.

## What the pinned libraries already have

Almost nothing, and it is named exactly:

- `mathlib:IsAdicComplete` (`Mathlib/RingTheory/AdicCompletion/Basic.lean`) — Adic completeness, which the coefficient completions of HB.6 carry and which the substitution lemma needs.
- `mathlib:PowerSeries.subst` (`Mathlib/RingTheory/PowerSeries/Substitution.lean`) — Substitution into a power series under topological nilpotence, which is exactly what makes the gluing condition of HB.6 a definition rather than a formal expression.

Everything else is **imported by name** from the roadmap that owns it — Suslin's
sequence and the Bloch group from `K3BlochGroups`, the norm-residue and Chern
comparison from `MotivicEtaleKTheory`, the p-adic regulator from
`PadicHodgeRegulators`, and the classical cyclotomic completion with its
substitution lemma from `HabiroCyclotomicCompletions`, whose packet was written
in the same session as this one. Fifteen requests in all.

## HB.1 — Integral Bloch conventions and finite Chern classes

**Two Bloch groups, not one.** The units paper's convention and Suslin's agree
after inverting 6; integrally they differ by bounded 2- and 3-primary groups,
and this layer identifies the difference instead of treating the names as the
same.

`K₃(−; ℤ/n)` with its Bockstein sequence and the Chern class into
`H¹(F, μ_n^{⊗2})` — **imported by name**, not assumed: the stage text insists
the cohomological theorem be formalised, and that is what keeps the later
Nahm-sum theorem unconditional.

**And when the eigenspace projection divides by a group order**: invert the
order, or use the integral kernel formulation. Never divide formally.

Coverage: **source_decomposed**.

Four nodes. The two Bloch conventions with the comparison maps and the bounded two- and six-primary difference, so that the names are never identified integrally, resting on Suslin's sequence which is imported. The third K-group with finite coefficients, its Bockstein sequence and the Chern class, with the isomorphism onto the first Galois cohomology and its number-field form, and with the stage text's demand honoured: the cohomological input is imported BY NAME from the motivic-etale and arithmetic roadmaps rather than assumed, which is what keeps the later Nahm-sum theorem unconditional. The finite excluded set defined explicitly from the discriminant, the roots of unity and the second K-group, with each injectivity and image statement carrying its own hypothesis. And the eigenspace node, which fixes the cyclotomic-character convention and states the rule the stage text gives: where the projection divides by a group order, invert the order or use the integral kernel formulation.

### Two Bloch groups, and the bounded primary difference between them

`HabiroNumberFields:HB.1/bloch-group-conventions` · *comparison*

The Bloch group appears in this area under two conventions, the one the units paper uses and Suslin's, and they are NOT identical integrally: the maps between them are isomorphisms after inverting a small set of primes and their kernels and cokernels are bounded two- and six-primary groups. This node defines both, constructs the comparison maps in both directions, and identifies the difference, so that no later statement treats the two names as interchangeable. Suslin's exact sequence, relating the third K-group to the Bloch group with a torsion term, is the bridge and is owned by the K-three roadmap.

**Hypotheses.**

- The field is a number field; the two definitions are by the same generators and different relation sets.
- The comparison is integral: after inverting six the two groups agree, and the statement records what happens at two and three.
- Suslin's sequence is imported, with its torsion term, and is not reproved here.

**Proof outline.**

1. Define both Bloch groups with their relation sets.
2. Construct the comparison maps and prove that they are mutually inverse after inverting six.
3. Identify the kernel and cokernel at two and three, with the bound the sources give.
4. Record Suslin's exact sequence and the induced isomorphism modulo an odd integer, which is the form the later nodes use.
5. State the rule this node exports: every statement about the Bloch group names its convention, and a comparison across conventions carries the primary correction.

**Acceptance.**

- After inverting six the two groups agree.
- The difference at two and three is bounded and is identified.
- Suslin's sequence gives an isomorphism modulo an odd integer with no roots of unity in the field.
- No later statement may treat the two conventions as the same group integrally.

**Prerequisites.** `K3BlochGroups:V.4`, `K3BlochGroups:V.1`

**Sources.**

- Theorem labelled thm:suslin and its corollary, §2 of the source, Suslin’s sequence and the induced isomorphism modulo an odd integer, verbatim from the LaTeX source, with the mathematics written out in words.

  > For any infinite field F, there is a natural short exact sequence 0 -> mu_F-twiddle -> K_3^{ind}(F) -> B(F) -> 0. ... Let F be an infinite field and let N >= 1 be odd with mu_N(F) = {1}. Then the map K_3(F) -> B(F) induces an isomorphism K_3^{ind}(F)/N = B(F)/N.

- §1, the abstract and introduction, The identification of the Bloch group with the third K-group that this node makes precise, verbatim.

  > Given an element of the Bloch group of a number field F and a natural number n, we construct an explicit unit in the field F_n = F(e^{2 pi i/n}), well-defined up to n-th powers of nonzero elements of F_n. The construction uses the cyclic quantum dilogarithm, and under the identification of the Bloch group of F with the K-group K_3(F) gives (up to an unidentified invertible scalar) a ...

### The third K-group with finite coefficients and its Chern class

`HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class` · *construction* · planet **The finite Chern class**

For an integer prime to the characteristic, the third K-group with coefficients in the integers modulo that integer sits in a Bockstein sequence with the integral groups, and the second Chern class in that degree is an isomorphism from its indecomposable part onto the first Galois cohomology with coefficients in the second Tate twist of the roots of unity. For a number field containing the relevant roots of unity the Chern class is an isomorphism onto the units modulo n-th powers tensored with the roots of unity, because the Milnor group vanishes there. This node builds the group, the sequence and the Chern class, and records that the comparison is owned by the motivic-etale roadmap rather than assumed.

**Hypotheses.**

- The integer is prime to the characteristic; for the second statement the field is a number field containing the roots of unity of that order.
- The vanishing of the third Milnor K-group of a totally imaginary field is what makes the indecomposable part the whole group there.
- The norm-residue comparison that identifies the Chern class with the Galois symbol is imported, not assumed: the stage text insists that the cohomological theorem be formalised rather than assumed.

**Proof outline.**

1. Construct the finite-coefficient group and the Bockstein sequence.
2. State the Chern class into the first Galois cohomology with the twisted coefficients.
3. Record the isomorphism statement for the indecomposable part with its hypothesis.
4. Record the number-field corollary, with the vanishing of the Milnor group as the reason the indecomposable part is everything.
5. Name the owners of the imported inputs: the norm-residue and Chern comparison, the finite-coefficient exact sequence and the arithmetic finiteness statements.
6. Record what the pinned libraries have towards this, which is Galois cohomology in low degrees and nothing K-theoretic.

**Acceptance.**

- For a number field containing the roots of unity the Chern class is an isomorphism onto the units modulo n-th powers tensored with the roots of unity.
- The indecomposable part is the whole group for a totally imaginary field.
- The cohomological input is imported by name and is not an assumption of this roadmap.
- The Bockstein sequence relates the finite-coefficient group to the integral ones.

**Prerequisites.** `HabiroNumberFields:HB.1/bloch-group-conventions`, `MotivicEtaleKTheory:M.3`, `MotivicEtaleKTheory:M.8`, `ArithmeticKTheory:N.4`

**API.**

| name | role | statement |
| --- | --- | --- |
| `K3mod` | data | The third K-group with finite coefficients. |
| `K3mod.bockstein` | characterisation | The Bockstein sequence with the integral groups. |
| `chernClass` | data | The second Chern class in degree one. |
| `chernClass_iso_ind` | characterisation | It is an isomorphism on the indecomposable part. |
| `chernClass_iso_numberField` | example | The number-field form of the isomorphism. |
| `milnorK3_eq_zero` | relation | The vanishing of the Milnor group for a totally imaginary field. |

**Used by.**

- *HB.2* — The comparison of the cyclic-dilogarithm map with the Chern class is the theorem of that layer.
- *HB.7* — The modules are graded by the third K-group and their local sections use its classes.
- *HabiroNahmSeries* — The Nahm-sum theorem rests on this comparison, which is why the stage text asks that it be formalised rather than assumed.

**Unit tests.**

- `totally_imaginary` — For a totally imaginary field the indecomposable part is the whole group.
- `bockstein` — The Bockstein sequence is exact.
- `char_hypothesis` — The isomorphism needs the integer prime to the characteristic.
- `imported_not_assumed` — The cohomological comparison is imported by name; assuming it would make the later theorems conditional.

**Sources.**

- Theorem labelled lem:levine with its corollary, §2 of the source, The Chern class with its isomorphism statements and the reason the indecomposable part is everything, verbatim.

  > For any field E, the Chern class c-bar_{2,1} induces an isomorphism K_3(E; Z/n)^{ind} = H^1(E, mu_n^{tensor 2}), provided n is prime to the characteristic of E. ... Let E be a number field containing mu_N. In this case, the Chern class c_{2,1} : K_3(E, Z/N) -> E^x/(E^x)^N tensor mu_N is an isomorphism. Proof. Since E is totally imaginary, K_3^M(E) = 0 and hence K_3(E; Z/N) = K_3(E; Z/N)^{ind}.

### The finite set of excluded primes and the hypotheses that use it

`HabiroNumberFields:HB.1/the-excluded-primes` · *definition*

The sharp statements of this area hold for integers prime to a finite set attached to the field: the set is determined by the discriminant, by the roots of unity in the field and by the second K-group of its ring of integers, and it is defined here explicitly rather than referred to. The injectivity and isomorphism statements of the units paper are then stated only with those hypotheses, and this node records each hypothesis with the statement it belongs to, so that no result is quoted outside its range.

**Hypotheses.**

- The field is a number field; the excluded set is finite and depends only on the field.
- The hypotheses are on the integer n: prime to the excluded set, and in the sharper statements n prime.
- The condition that the field contains no non-trivial root of unity of the relevant order is separate and is also recorded.

**Proof outline.**

1. Define the excluded set from the three data the sources name.
2. State the injectivity statement with its hypothesis on the integer and on the roots of unity.
3. State the sharper statement for a prime integer and record what it adds.
4. Record the containment statements for the image, which distinguish the S-unit target from the unit target.
5. State the rule: no result of this layer is quoted for an integer that is not prime to the excluded set.

**Acceptance.**

- The excluded set is finite and depends only on the field.
- The injectivity statement holds for integers prime to it and fails in general otherwise.
- The image is contained in the S-units in general and in the units under the sharper hypothesis.
- Each statement is quoted only with its own hypothesis.

**Prerequisites.** `HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class`, `ArithmeticKTheory:N.1`

**API.**

| name | role | statement |
| --- | --- | --- |
| `excludedSet` | data | The finite set attached to the field. |
| `excludedSet_finite` | characterisation | Its finiteness. |
| `RMap_injective` | characterisation | Injectivity for integers prime to it. |
| `RMap_image_units` | characterisation | The image in the units under the sharper hypothesis. |
| `RMap_image_Sunits` | characterisation | The image in the S-units in general. |

**Used by.**

- *HB.2* — Every statement about the map carries these hypotheses.
- *HB.7* — The units that index the modules are the values of this map, so its hypotheses propagate.
- *HabiroNahmSeries* — The Nahm-sum application quotes this statement and must carry the hypotheses with it.

**Unit tests.**

- `finite` — The excluded set is finite.
- `prime_case` — For a prime integer prime to the set the map is onto the stated target.
- `roots_of_unity_hypothesis` — The hypothesis that the field has no non-trivial root of unity of that order is separate and is used.
- `outside_range` — For an integer not prime to the set no injectivity is claimed.

**Sources.**

- Theorem 1.2 with Remark 1.3, §1, The map with its target, the finite excluded set and the two sharper hypotheses, verbatim.

  > Suppose that F does not contain any non-trivial n-th root of unity. Then there is a map R : B(F)/nB(F) -> O_{S,n}^x/(O_{S,n}^x)^n twisted by chi^{-1}, for some finite set S of primes depending only on F. If n is prime to a certain integer M_F depending on F, then the map R is injective and its image is contained in the units modulo n-th powers twisted by chi^{-1}, and equal to this if n is prime.

### The eigenspace projection, and what to do when its order is not invertible

`HabiroNumberFields:HB.1/the-eigenspace-and-division-by-a-group-order` · *comparison*

The target of the units map is an EIGENSPACE for the cyclotomic character, and identifying it inside the cyclotomic units requires a projection whose formula divides by the order of a Galois group. Where that order is not invertible in the coefficients the projection does not exist and the correct formulation is the integral kernel description: the eigenspace is the kernel of the appropriate twisted difference operator. This node fixes the cyclotomic-character convention, states both formulations, and records the rule the stage text gives: invert the order or use the kernel formulation, never divide formally.

**Hypotheses.**

- The character is the cyclotomic one, with the convention fixed here and used in all later layers.
- The Galois group is that of the cyclotomic extension; its order is what the projection divides by.
- The kernel formulation is available integrally and agrees with the projection when the order is invertible.

**Proof outline.**

1. Fix the cyclotomic-character convention and say which twist the eigenspace is for.
2. State the projection formula and the hypothesis under which it is defined.
3. State the kernel formulation and prove the two agree when the order is invertible.
4. Record the source's own remark about how the map depends on the chosen root of unity, which is the equivariance this eigenspace expresses.
5. State the rule: divide only after inverting the order, or use the kernel formulation.

**Acceptance.**

- The two formulations agree when the order is invertible.
- The kernel formulation is available integrally.
- The dependence of the map on the chosen root of unity is the stated equivariance.
- No formal division by a non-invertible group order is admitted.

**Prerequisites.** `HabiroNumberFields:HB.1/the-excluded-primes`, `ArithmeticKTheory:N.4`

**Sources.**

- Remark 1.3, §1, The equivariance that the eigenspace expresses, verbatim, together with the observation that the field and the character do not depend on the chosen root.

  > Note that the field F_n and the character chi depend only on n and not on the primitive n-th root of unity zeta. The map R_zeta from B(F) to F_n^x/(F_n^x)^n does depend on zeta, but in a very simple way, described by either of the formulas alpha R_zeta(beta) = R_{alpha(zeta)}(beta) for alpha in the Galois group, and R_{zeta^k}(beta) = R_zeta(beta)^k for k prime to n.

## HB.2 — The cyclic quantum dilogarithm

The map `R_ζ : B(F)/n → F_nˣ/(F_nˣ)ⁿ` built from the cyclic quantum
dilogarithm, well defined by the five-term relation, with its distribution and
Galois equivariance.

**The scalar.** CGZ prove `R = c^β` for a universal invertible `β` and
conjecture it is 2; **Hutchinson proves `R_ζ = c_ζ²` for odd orders**. The
refinement is stated with its hypotheses and the weaker comparison is retained
outside them — the scalar is **not** set to one.

Units, S-units, Kummer classes and their quotients are **four different**
**objects**, and the module index is the class under the actual `K₃`–Bloch
comparison.

Coverage: **source_decomposed**.

Five nodes. The cyclic quantum dilogarithm with the unit it produces and the three targets kept apart. The five-term relation, the distribution relation and the Galois equivariance, which together make the construction a map out of the Bloch group. The comparison with the Chern class, stated first in the source's form with a universal invertible scalar and the source's own conjecture about it, and then with Hutchinson's refinement that the scalar is the square for odd orders, with that paper's hypotheses; the stage text's instruction is followed exactly, in that the scalar is NOT set to one and the weaker comparison is retained outside the refinement's range. The three inputs of the refinement — the cyclic bar cycle, the Bott element and Soule's product formula — as their own node, so that what is imported general K-theory and what is the paper's own computation are visible. And the exported interface, with the four objects the stage text insists be kept distinct and the rule that the index is the class under the actual comparison.

### The cyclic quantum dilogarithm and the unit it produces

`HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm` · *construction* · planet **The cyclic quantum dilogarithm**

For a natural number n and a primitive n-th root of unity, the CYCLIC QUANTUM DILOGARITHM is a finite product built from that root; evaluated on the terms of an element of the Bloch group of a number field it produces an explicit element of the cyclotomic extension, well defined up to n-th powers. The construction depends on the chosen root of unity in the simple way the source records, and what it yields is a class in the units modulo n-th powers, or in the S-units before the sharper hypotheses of HB.1 are imposed. The three targets — units, S-units and Kummer classes — are kept distinct, as the stage text requires.

**Hypotheses.**

- The field is a number field with no non-trivial root of unity of the relevant order; the extension is obtained by adjoining a primitive one.
- The element is in the Bloch group in the convention fixed in HB.1.
- The value is well defined only up to n-th powers; the class, not the element, is the output.

**Proof outline.**

1. Define the cyclic quantum dilogarithm as the finite product the source gives.
2. Evaluate it on a representative of a Bloch-group element and prove that the class modulo n-th powers is independent of the representative.
3. Record the dependence on the chosen root of unity, in both of the source's forms.
4. Distinguish the three targets and record which hypotheses are needed to land in each.
5. Record the Kummer class attached to the unit and the torsor of choices of an n-th root, which is what the interface of the last node exports.

**Acceptance.**

- The class modulo n-th powers is independent of the representative.
- Changing the root of unity by a Galois element or by a power changes the class in the stated way.
- The unit, its Kummer class and the choice of an n-th root are three different data and are kept apart.

**Prerequisites.** `HabiroNumberFields:HB.1/bloch-group-conventions`, `HabiroNumberFields:HB.1/the-excluded-primes`

**API.**

| name | role | statement |
| --- | --- | --- |
| `cyclicQuantumDilog` | data | The finite product attached to a root of unity. |
| `RMap` | data | The induced map from the Bloch group modulo n to the units modulo n-th powers. |
| `RMap_wellDefined` | characterisation | Independence of the representative. |
| `RMap_galois` | compatibility | The dependence on the chosen root of unity. |
| `kummerClass` | data | The Kummer class of the unit. |
| `rootTorsor` | data | The torsor of choices of an n-th root. |

**Used by.**

- *HB.2, the comparison* — The theorem compares this map with the Chern class of HB.1.
- *HB.7* — The modules are defined with these units and their root choices.
- *HabiroNahmSeries* — The Nahm-sum asymptotics are expressed through these units.

**Unit tests.**

- `representative` — The class does not depend on the representative of the Bloch-group element.
- `root_change` — Changing the root of unity by a power raises the class to that power.
- `three_targets` — The unit, its Kummer class and a chosen root are different data.
- `no_roots_hypothesis` — The hypothesis that the field has no non-trivial root of unity of that order is used.

**Sources.**

- §1, the abstract, The construction and the exact sense in which its output is well defined, verbatim.

  > Given an element of the Bloch group of a number field F and a natural number n, we construct an explicit unit in the field F_n = F(e^{2 pi i/n}), well-defined up to n-th powers of nonzero elements of F_n. The construction uses the cyclic quantum dilogarithm.

### The five-term relation, distribution and Galois action

`HabiroNumberFields:HB.2/five-term-distribution-and-galois` · *theorem*

The map of the previous node is well defined on the Bloch quotient because the cyclic dilogarithm satisfies the five-term relation there; it satisfies a distribution relation as the order varies, and it is equivariant for the Galois action in the sense recorded in HB.1. These three properties are what make it a map out of the Bloch group rather than a function of a representative, and they are the compatibilities the later layers use when the order or the field changes.

**Hypotheses.**

- The five-term relation is the defining relation of the Bloch group, and the statement is that the dilogarithm expression respects it modulo n-th powers.
- The distribution relation compares the values at an order and at its multiples.
- Equivariance is for the Galois group of the cyclotomic extension, acting on both the root of unity and the value.

**Proof outline.**

1. State and prove the five-term relation for the cyclic dilogarithm modulo n-th powers.
2. Deduce well-definedness on the Bloch quotient.
3. State and prove the distribution relation.
4. State the Galois equivariance in both of the source's forms.
5. Record the compatibilities as the order and the field vary, which the source gives as lemmas and which the later layers use.

**Acceptance.**

- The map is well defined on the Bloch group.
- The distribution relation holds as the order varies.
- The map is Galois-equivariant in the stated sense.
- The compatibilities in the order and in the field are what allow a computation to be transported.

**Prerequisites.** `HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm`, `K3BlochGroups:V.2`

**Sources.**

- Theorem 1.2 with Remark 1.3, §1, The compatibilities and the equivariance, verbatim.

  > The map R satisfies various natural compatibilities as one varies either n or the field F. ... R_zeta(beta)^k = R_{zeta^k}(beta) for k prime to n

### The comparison with the finite Chern class, and its scalar

`HabiroNumberFields:HB.2/the-comparison-with-the-chern-class` · *theorem* · planet **Hutchinson's refinement**

The units paper proves that its map agrees with the Chern class of HB.1 up to an invertible universal scalar: for integers prime to the excluded set the two differ by a unit modulo n that does not depend on the field. The paper conjectures that the scalar is, up to sign, a power of two independent of the field and the order, and more optimistically that it is two. Hutchinson's later paper proves exactly that for odd orders, under its stated hypotheses on the field and the roots of unity: the units map is the SQUARE of the Chern class. This node states the general comparison with its scalar, states the refinement with its hypotheses, and records that outside those hypotheses only the weaker statement is available; the scalar is not set to one.

**Hypotheses.**

- The general comparison holds for integers prime to the excluded set of HB.1.
- The refinement is for odd orders and for a field with no non-trivial root of unity of that order, which is Hutchinson's hypothesis.
- The scalar is universal: it does not depend on the field, which is what makes the comparison transportable along extensions.

**Proof outline.**

1. State the general comparison with its invertible scalar and record the source's own conjecture about it.
2. Record the argument that the scalar is field-independent, namely that both maps are compatible with finite extensions so the comparison can be made in a compositum.
3. State Hutchinson's refinement and its hypotheses.
4. Record the two inputs of Hutchinson's proof that this layer needs by name: Soule's Chern-product formula and the computation of the Chern class on the cyclic bar element.
5. State the rule: outside the refinement's hypotheses the weaker comparison is what may be used, and the scalar is never set to one.

**Acceptance.**

- The two maps agree up to a universal invertible scalar.
- For odd orders the scalar is the square, by Hutchinson.
- The scalar does not depend on the field.
- Outside the refinement's hypotheses only the weaker statement is available.

**Prerequisites.** `HabiroNumberFields:HB.2/five-term-distribution-and-galois`, `HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class`

**Sources.**

- Theorem 1.6 with the discussion after it, §1, The comparison with its universal scalar and the conjecture about it, verbatim.

  > For n prime to M_F, the map R equals c to the power beta for some beta in (Z/nZ)^x. The constant beta does not depend on the underlying field; both our construction and the Chern class map are well behaved in finite extensions, so we can compare the maps over any two fields with the maps in their compositum. We conjecture that the constant beta is, up to sign, a power of 2 that is ...

- The abstract of the source, The refinement, verbatim.

  > In this note we confirm the conjecture of Calegari, Garoufalidis and Zagier that R_zeta = c_zeta^2 where R_zeta is their map on K_3 defined using the cyclic quantum dilogarithm and c_zeta is the Chern class map on K_3.

- Theorem labelled thm:main, §3 of the source, The computation of the Chern class on the distinguished element, which is what pins the scalar, verbatim.

  > Let N = l^m, l an odd prime, as above. Then c_zeta(eta_zeta) = zeta. Equivalently, c-bar_{2,1}(eta_zeta) = zeta tensor zeta in (F_N^x)/(F_N^x)^N tensor mu_N.

### The inputs to the refinement: bar cycles, the Bott element and the product formula

`HabiroNumberFields:HB.2/bar-cycles-bott-element-and-souls-formula` · *construction*

Hutchinson's proof is assembled from three pieces this node names and states: the cyclic bar cycle that produces a distinguished class of exact order in the third K-group modulo the order; the Bott element in the first K-group with finite coefficients; and Soule's formula for the Chern class of a product, which in the degrees at hand reduces to a cup product of a first Chern class with a second. Stating them here rather than inside the theorem makes visible which parts of the refinement are general K-theory, owned elsewhere, and which are the paper's own computation.

**Hypotheses.**

- The order is an odd prime power; the field contains no non-trivial root of unity of that order.
- Soule's formula is the general product formula for Chern classes with finite coefficients and is owned by the motivic-etale roadmap.
- The Bott element requires the order to be invertible in the ring.

**Proof outline.**

1. Construct the cyclic bar cycle and prove that its class has exact order.
2. Record the Bott element and its degree.
3. State Soule's product formula in the general form and specialise it to the two degrees at hand.
4. Assemble the computation of the Chern class on the distinguished element.
5. Record which pieces are imported and which are the paper's own.

**Acceptance.**

- The distinguished class has exact order, which is what makes the comparison determinable.
- Soule's formula specialises to a single cup product in the degrees at hand.
- The Bott element needs the order invertible.
- The general pieces are imported by name.

**Prerequisites.** `HabiroNumberFields:HB.2/the-comparison-with-the-chern-class`, `MotivicEtaleKTheory:M.8`, `StableHomotopyKTheory:H.2`

**API.**

| name | role | statement |
| --- | --- | --- |
| `cyclicBarCycle` | data | The distinguished cycle in the third K-group modulo the order. |
| `cyclicBarCycle_order` | characterisation | Its exact order. |
| `bottElement` | data | The Bott element in the first K-group with finite coefficients. |
| `souleProductFormula` | characterisation | The Chern class of a product. |
| `souleProductFormula_deg` | example | Its specialisation to the degrees at hand. |

**Used by.**

- *HB.2, the refinement* — The three pieces are what its proof is assembled from.
- *HB.1* — The Chern class they compute is the one built there.
- *HabiroNahmSeries* — The scalar fixed by this computation appears in the asymptotics.

**Unit tests.**

- `exact_order` — The distinguished class has exact order, not merely non-zero order.
- `product_specialisation` — In the degrees at hand the formula is a single cup product.
- `bott_needs_invertible` — The Bott element needs the order invertible in the ring.
- `imports_named` — The general pieces are imported and are not proved here.

**Sources.**

- Theorem labelled thm:sou with its corollary, §2 of the source, The product formula with the specialisation the proof uses, verbatim.

  > (Soule) Let q = l^m with l prime. Let A be a commutative ring in which l is invertible. Let a in K_n(A; Z/q), b in K_r(A; Z/q), n, r >= 1. Then c_{i,k}(a * b) is the stated sum of cup products of Chern classes of a and b. ... If a in K_1(A; Z/q) and b in K_2(A; Z/q) then c_{2,1}(a * b) = - c_{1,1}(a) cup c_{1,0}(b).

### What HB.2 exports, and what must be kept apart

`HabiroNumberFields:HB.2/the-exported-interface` · *comparison*

The interface this layer exports to the number-field Habiro ring and its modules consists of the units attached to a Bloch class and an order, their Kummer classes, the torsors of choices of an m-th root, and the coherence of all three under change of the order. The stage text adds a warning that this node records: the index of a module is the class under the actual K-three-to-Bloch comparison of HB.1 together with the stated localisation, and not an unrelated symbol; and the units, the S-units, the Kummer classes and their quotients are four different objects.

**Hypotheses.**

- The order varies over positive integers prime to the excluded set; the coherence is for divisibility of orders.
- The torsor of root choices is non-trivial exactly when the relevant roots are not already in the field.
- The index is a class in the third K-group, transported to the Bloch group by the comparison of HB.1.

**Proof outline.**

1. List the four exported items with the node that supplies each.
2. State the coherence under change of order, in the form the modules of HB.7 need.
3. State the indexing rule and record what it excludes.
4. State the four-way distinction among units, S-units, Kummer classes and quotients.
5. Record the consumer roadmaps that take this interface.

**Acceptance.**

- The four exported items are coherent under change of order.
- The index is a class in the third K-group under the stated comparison.
- The four objects are kept apart and no statement substitutes one for another.

**Prerequisites.** `HabiroNumberFields:HB.2/the-comparison-with-the-chern-class`, `HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm`

**Sources.**

- Theorem 1.2, §1, The map whose values are the exported units, with the S-unit target that the interface keeps distinct from the unit target, verbatim.

  > Then there is a map R : B(F)/nB(F) -> O_{S,n}^x/(O_{S,n}^x)^n twisted by chi^{-1}, for some finite set S of primes depending only on F.

## HB.6 — The number-field Habiro ring

GSWZ Definition 1.1: families `(f_m)` with
`f_m(x + ζ_{pm} − ζ_m) = (φ_p f_{pm})(x)` in `R^_p[ζ_{pm}][[x]]`.

**The substitution is legitimate** because `ζ_{pm} − ζ_m` is topologically
nilpotent in that completion — which is exactly the hypothesis Mathlib's
`PowerSeries.subst` requires. Without it the condition would be a formal
substitution of a non-zero constant.

**Three things that are false in general**: the ring is not an `R`-algebra by
constant families (they need not glue); it need not be a domain because `O_F`
is; and a p-adic comparison keeps the **full** cyclotomic coefficient algebra,
not one residue field. The Frobenius acts on the completed algebra and is **not**
a global automorphism — except for `K/ℚ` abelian, which is a separate result.

Coverage: **source_decomposed**.

Five nodes. The coefficient rings with their completions and the Frobenius endomorphisms, with the stage text's point made precise: the Frobenius acts on the completed coefficient algebra and need NOT be a global automorphism of the field, and the abelian case in which it lifts globally is recorded as a separate result. The gluing condition of the source's Definition 1.1, with the restricted rings and the vacuity at inverted primes. The substitution lemma, which proves that the difference of the two roots is topologically nilpotent in the completion so that the condition is a definition and not a formal substitution of a non-zero constant — the pinned power-series substitution requires exactly that hypothesis. The ring operations with the comparison to the classical Habiro ring for the rationals. And the three negative statements the stage text lists, each with the reason: no naive scalar structure, no domain property inherited from the ring of integers, and no single residue field in a p-adic comparison.

### The coefficient rings, their completions and the Frobenius endomorphisms

`HabiroNumberFields:HB.6/coefficient-rings-and-frobenius` · *construction*

Fix a number field, a rational integer divisible by its discriminant, and the ring of integers with that integer inverted. For each positive integer the coefficient ring is that ring with the roots of unity of that order adjoined; at each prime not inverted these are completed, and the completion carries a FROBENIUS ENDOMORPHISM lifting the one of the residue field. The Frobenius is an endomorphism of the completed coefficient algebra; it need NOT be a global automorphism of the field, and that is the point at which the number-field case differs from the rational one. Where the field is abelian over the rationals a global lift exists and the construction simplifies, and the source records that as a separate remark rather than as the general case.

**Hypotheses.**

- The inverted integer is divisible by the discriminant; the source also asks that it be divisible by six for the module theory.
- The completion is at a prime not dividing the inverted integer; at an inverted prime the completed ring is trivial and the conditions below are vacuous.
- The Frobenius is an endomorphism of the completion, extended to the power-series ring fixing the variable and the adjoined root.

**Proof outline.**

1. Define the coefficient rings and their completions.
2. Construct the Frobenius endomorphism of each completion and its extension to the relevant power-series ring.
3. Prove that it lifts the residue Frobenius and record that it is not in general a global automorphism.
4. Record the abelian case, where a global lift exists and gives a module structure over the base, as the source's remark rather than as the general statement.
5. Record the degenerate case at an inverted prime, where the completed ring is trivial.

**Acceptance.**

- The Frobenius lifts the residue-field Frobenius.
- It is not a global automorphism of the field in general.
- At an inverted prime the completed ring is trivial and the gluing condition is vacuous.
- For a field abelian over the rationals a global lift exists, which is a special case and not the definition.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.1`, `ArithmeticKTheory:N.1`, `mathlib:IsAdicComplete`

**API.**

| name | role | statement |
| --- | --- | --- |
| `coeffRing` | data | The coefficient ring at an order. |
| `coeffRing.completion` | data | Its completion at a prime not inverted. |
| `frobenius` | data | The Frobenius endomorphism of that completion. |
| `frobenius_lifts` | characterisation | It lifts the residue Frobenius. |
| `frobenius_not_global` | relation | It is not in general a global automorphism. |
| `abelian_case` | example | The abelian case with a global lift. |

**Used by.**

- *HB.6, the gluing condition* — The condition is stated with this Frobenius.
- *HB.7* — The local sections are defined over these completions.
- *HabiroRings:HR.5* — The relative etale construction is compared with this one.

**Unit tests.**

- `inverted_prime` — At an inverted prime the completed ring is trivial.
- `lifts_residue` — The Frobenius lifts the residue-field Frobenius.
- `abelian` — For an abelian field a global lift exists.
- `not_automorphism` — In general the Frobenius is not an automorphism of the field; a construction that assumed it would be wrong.

**Sources.**

- Definition 1.1 with its footnote 1, §1.4, The abelian case with the global Frobenius lift, verbatim; the general case has no such lift, which is why the module structure is not naive.

  > We remark that both problems disappear when K is abelian over Q. Indeed, in this case we can define an R-module structure on H_R from the embedding R -> H_R given by a -> (phi_m a)_m, where phi_m is the product of lifts from K_p to K of the Frobenius automorphisms phi_p, which exists for fields K abelian over Q. This embedding also gives a canonical isomorphism H_R = H_{Z[1/Delta]} ...

- Definition 1.1 with its footnote 2, §1.4, The choice of the inverted integer, verbatim.

  > One could also let Delta be a non-zero element of O_K divisible by all prime ideals whose square divides the discriminant, but for simplicity we will always choose Delta in Z.

### The Frobenius-twisted Taylor gluing condition

`HabiroNumberFields:HB.6/the-gluing-condition` · *definition* · planet **The number-field Habiro ring**

The number-field HABIRO RING is the set of families of power series, one at each root of unity, satisfying the gluing condition of the source: for every prime and every order, the series at that order, shifted by the difference of the two roots of unity, equals the Frobenius applied to the series at the multiplied order, as an identity in the completed coefficient ring with the finer root adjoined. When the prime divides the inverted integer the condition is vacuous because the completed ring is trivial. Restricted versions, in which the orders are taken prime to a given integer, are defined at the same time and are used throughout the module theory.

**Hypotheses.**

- The families are indexed by positive integers, one power series in the variable q minus the root at each; the coefficients lie in the coefficient rings of the previous node.
- The shift is by the difference of the two roots of unity, and the identity is in the completion with the finer root adjoined.
- At a prime dividing the inverted integer the identity holds trivially, which the source notes.

**Proof outline.**

1. State the gluing condition exactly, with the Frobenius, the shift and the ring in which the identity holds.
2. Define the Habiro ring as the set of families satisfying it.
3. Define the restricted versions, with the orders prime to a given integer.
4. Record the vacuity at inverted primes.
5. Record that the shift is a substitution in a completed ring and not a formal substitution of a constant, which the next node proves.

**Acceptance.**

- The condition is vacuous at a prime dividing the inverted integer.
- The restricted versions are defined for every integer and are used in the module gluing.
- The identity is in the completion with the finer root adjoined, not in the base field.

**Prerequisites.** `HabiroNumberFields:HB.6/coefficient-rings-and-frobenius`, `HabiroCyclotomicCompletions:HC.1`

**API.**

| name | role | statement |
| --- | --- | --- |
| `HabiroRing` | data | The ring of glued families. |
| `HabiroRing.glue` | characterisation | The gluing condition. |
| `HabiroRing.restrict` | data | The restricted versions. |
| `HabiroRing.vacuous_at_inverted` | characterisation | Vacuity at an inverted prime. |
| `HabiroRing.proj` | projection | The series at a given order. |

**Used by.**

- *HB.6, the ring operations* — The operations are proved to preserve the condition.
- *HB.7* — The modules are defined by a version of the same condition twisted by the units of HB.2.
- *HabiroRings:HR.5* — The relative construction specialises to this ring.

**Unit tests.**

- `vacuous` — At an inverted prime the condition is vacuous.
- `restricted` — The restricted version is a ring and the restriction map is a homomorphism.
- `shift_ring` — The identity is in the completion with the finer root adjoined.
- `classical_case` — For the rationals with nothing inverted the definition returns the classical Habiro ring.

**Sources.**

- Definition 1.1, §1.4, equation (13), The definition with the gluing condition, the vacuity at inverted primes and the restricted versions, verbatim.

  > The Habiro ring H_R is the subset of P_R consisting of elements f(q) = (f_m(x))_{m > 0} that satisfy the gluing property f_m(x + zeta_{pm} - zeta_m) = (phi_p f_{pm})(x) in R^_p[zeta_{pm}][[x]] for primes p and all positive integers m, where phi_p is the Frobenius endomorphism of R^_p, lifted to an endomorphism of R^_p[zeta_{pm}][[x]] fixing both zeta_{pm} and x. Note that if p divides ...

### The substitution by the difference of two roots is defined

`HabiroNumberFields:HB.6/the-substitution-exists` · *theorem*

The gluing condition substitutes the difference of two roots of unity into a power series, and that is legitimate only because the difference is topologically nilpotent in the completed coefficient ring: the difference of a root of order a multiple of a prime and the corresponding root of the smaller order lies in the maximal ideal of the completion at that prime. This node proves that, and records that without it the condition would be a formal substitution of a non-zero constant into a power series, which is not defined. The same hypothesis is the one the classical roadmap's re-expansion node states.

**Hypotheses.**

- The prime does not divide the inverted integer; at an inverted prime the ring is trivial and there is nothing to prove.
- The difference lies in the maximal ideal of the completion, which is exactly topological nilpotence there.
- The completion is the one of the previous nodes and is complete for that ideal.

**Proof outline.**

1. Prove that the difference of the two roots lies in the maximal ideal of the completion.
2. Deduce that substitution into a power series converges and defines a ring homomorphism.
3. Record the pinned statement about substitution into power series and the hypothesis it requires.
4. State the non-example: substituting an arbitrary non-zero constant is not defined, and the gluing condition would be meaningless without this lemma.
5. Record the same statement in the classical roadmap, so that the two agree.

**Acceptance.**

- The difference is topologically nilpotent in the completion.
- Substitution therefore defines a ring homomorphism.
- An arbitrary constant substitution is not defined, and the condition depends on this.
- At an inverted prime there is nothing to prove.

**Prerequisites.** `HabiroNumberFields:HB.6/the-gluing-condition`, `HabiroCyclotomicCompletions:HC.3`, `mathlib:PowerSeries.subst`

**Sources.**

- Definition 1.1, §1.4, equation (13), The substitution whose legitimacy this node proves, verbatim.

  > f_m(x + zeta_{pm} - zeta_m) = (phi_p f_{pm})(x) in R^_p[zeta_{pm}][[x]]

### The operations preserve gluing, and the comparison with the classical ring

`HabiroNumberFields:HB.6/ring-operations-and-the-classical-comparison` · *theorem*

Sum and product of glued families are glued, so the definition gives a ring; the restricted versions are rings and the restriction maps are homomorphisms. For the rationals with nothing inverted the construction returns the classical Habiro ring, and the source records that the two rings can be identified canonically. What is NOT available in general is the naive scalar structure: the constant families need not glue, so the ring is not automatically an algebra over the coefficient ring, and the abelian case in which it is is a separate result.

**Hypotheses.**

- The field is arbitrary for the first two statements; the comparison is for the rationals with nothing inverted.
- The scalar statement is negative in general and positive for a field abelian over the rationals, which is the source's remark.
- Preservation of gluing uses that the Frobenius is a ring endomorphism and that the substitution of the previous node is a ring homomorphism.

**Proof outline.**

1. Prove that sums and products of glued families are glued.
2. Prove that the restricted versions are rings and that restriction is a homomorphism.
3. Prove the comparison with the classical Habiro ring for the rationals, and record the source's own identification.
4. State the negative scalar statement: a constant family need not glue, so the naive algebra structure does not exist.
5. Record the abelian case, where the Frobenius lifts globally and gives both the scalar structure and a base-change description, as a separate result.

**Acceptance.**

- The construction is a ring and the restrictions are homomorphisms.
- For the rationals with nothing inverted it is the classical Habiro ring.
- The naive scalar structure does not exist in general.
- For an abelian field it does, and the ring is then a base change of the classical one.

**Prerequisites.** `HabiroNumberFields:HB.6/the-substitution-exists`, `HabiroCyclotomicCompletions:HC.6`

**Sources.**

- §1.4, the remark after Definition 1.1, The comparison with the classical ring, verbatim.

  > (The two rings H = H_Z and H = H_Z-hat can be identified canonically.)

- Definition 1.1, footnote 1, §1.4, The abelian scalar structure with its base-change description, verbatim; the general case is exactly the absence of this.

  > we can define an R-module structure on H_R from the embedding R -> H_R given by a -> (phi_m a)_m ... This embedding also gives a canonical isomorphism H_R = H_{Z[1/Delta]} tensor_Z R for such K.

### Three things that are not true of the number-field Habiro ring

`HabiroNumberFields:HB.6/what-is-not-true-of-this-ring` · *comparison*

Three negative statements belong to the definition and are recorded here so that no later layer assumes them. The ring is not an algebra over the coefficient ring by constant families, since those need not glue. It is not an integral domain merely because the ring of integers is: inverting primes restricts which root orders are available and produces the decomposition phenomena the classical roadmap describes. And a p-adic comparison must keep the full cyclotomic coefficient algebra, or all the finite etale local factors, rather than a single residue field chosen for convenience.

**Hypotheses.**

- The first statement is the negation of the naive scalar structure and is the source's footnote read in the general case.
- The second follows from the decomposition phenomena of the classical roadmap once primes are inverted.
- The third is about the p-adic comparisons of the module theory and is the stage text's warning.

**Proof outline.**

1. State the first with the reason: a constant family need not satisfy the gluing condition.
2. State the second and point at the classical roadmap's decomposition, which is what produces the counterexample.
3. State the third and record what a comparison must keep.
4. Record what IS true in each case: the abelian scalar structure, the restrictions on root orders after inverting primes, and the full coefficient algebra.
5. State the rule: each of the three is a hypothesis to be proved where it is needed, never an assumption.

**Acceptance.**

- Constant families need not glue, so the naive algebra structure is absent.
- The ring need not be a domain even when the ring of integers is.
- A p-adic comparison keeps the full cyclotomic coefficient algebra, not one residue field.
- Each positive counterpart is available only under its own hypothesis.

**Prerequisites.** `HabiroNumberFields:HB.6/ring-operations-and-the-classical-comparison`, `HabiroCyclotomicCompletions:HC.5`

**Sources.**

- Definition 1.1, footnote 1 and the surrounding text, §1.4, The source’s own acknowledgement that there ARE problems in the general case, verbatim; this node states what they are.

  > We remark that both problems disappear when K is abelian over Q.

## HB.7 — K₃-indexed Habiro modules

GSWZ Definitions 1.3 and 1.4: invertible `L_p(ξ)`-sections with a logarithmic
Frobenius condition — the logarithmic form of **Dwork's** condition — whose
formal completion carries the p-adic regulator; then the global module, with
the local condition at **every** prime and the gluing condition under `q ↦ q^γ`.

The `χ^{-1}`-equivariance of the units is what makes the ambiguity of their
`m`-th roots disappear in that condition.

**Locally a line is not globally free.** The rank-one theorem is *local*; global
freeness does not follow, and a multiplication map is not an isomorphism just
because the local description resembles one.

Coverage: **source_decomposed**.

Four nodes. The invertible local sections of the source's Definition 1.3, with the logarithmic Frobenius condition, the formal completion built from the p-adic regulator, the existence theorem and the rank-one statement, and with the condition identified as the logarithmic form of Dwork's. The global module of Definition 1.4, with both of its conditions, the role of the equivariance of the units in removing the ambiguity of their roots, the restriction to primes prime to six, and the source's own flag on interpreting a class divided by an integer. The operations the stage text lists, each with its invertibility and localisation hypotheses and with the ring case. And the node the stage text asks for by name: locally a line does not mean globally free, and a multiplication map is not an isomorphism just because the local description resembles one.

### Invertible local sections attached to a K-three class

`HabiroNumberFields:HB.7/invertible-local-sections` · *definition* · planet **Invertible local sections**

Fix a class in the third K-group of the field and a prime not dividing the inverted integer. An INVERTIBLE LOCAL SECTION at that prime is a family of power series, indexed by the orders prime to the prime, each lying in the coefficient module obtained by multiplying the units of HB.2 to the power one over the order, and satisfying a logarithmic Frobenius condition: the logarithm of the ratio of the Frobenius of the formal completion at the p-th power of the variable to the p-th power of the formal completion lies in p times the variable times the completed coefficient ring. The formal completion is defined by adding the p-adic regulator of the class divided by the square of the order times the logarithm of the variable. The condition is a logarithmic form of Dwork's lemma.

**Hypotheses.**

- The prime does not divide the inverted integer, which is divisible by the discriminant and by six.
- The units are those of HB.2, with a chosen root of the appropriate order; the choice torsor is part of the data and the equivariance of the units makes the ambiguity disappear in the module gluing.
- The p-adic regulator is the one of the p-adic Hodge roadmap, with the normalisation fixed there.

**Proof outline.**

1. Record the coefficient module in which each series lies, with the unit and its root.
2. Define the formal completion with the p-adic regulator term.
3. State the logarithmic Frobenius condition exactly.
4. Record that it is the logarithmic form of the condition in Dwork's lemma, which is what makes the existence proof work.
5. Record that the span of the invertible sections over the completed Habiro ring is the local module, and that it is of rank one, which is the source's first theorem.
6. Record the existence statement with its hypotheses on the inverted integer.

**Acceptance.**

- Invertible sections exist for every class and every prime not dividing the inverted integer.
- The local module is of rank one over the completed Habiro ring.
- The condition is a logarithmic Dwork condition and not an arbitrary congruence.
- The p-adic regulator enters through the formal completion and its normalisation matters.

**Prerequisites.** `HabiroNumberFields:HB.2/the-exported-interface`, `HabiroNumberFields:HB.6/coefficient-rings-and-frobenius`, `PadicHodgeRegulators:D.4`

**API.**

| name | role | statement |
| --- | --- | --- |
| `LocalSection` | structure | An invertible local section at a prime. |
| `LocalSection.formalCompletion` | data | The formal completion with the regulator term. |
| `LocalSection.frobCondition` | characterisation | The logarithmic Frobenius condition. |
| `LocalSection.exists` | characterisation | Existence for every class and admissible prime. |
| `LocalModule` | data | The span of the invertible sections. |
| `LocalModule.rankOne` | characterisation | Its rank-one property. |

**Used by.**

- *HB.7, the global module* — The global definition imposes the local condition at every prime.
- *HabiroNahmSeries* — The series produced there are elements of these modules.
- *HabiroRings:HR.5* — The relative construction is compared with this one.

**Unit tests.**

- `exists` — An invertible section exists for every class and every admissible prime.
- `rank_one` — The local module is of rank one.
- `dwork_form` — The condition is the logarithmic form of Dwork’s condition.
- `delta_hypothesis` — The hypothesis that six divides the inverted integer is used.

**Sources.**

- Definition 1.3, §1.5, The definition with its Frobenius condition and the formal completion, verbatim.

  > Fix xi in K_3(K) and a prime p. An invertible L_p(xi)-section is a collection f(q) = (f_m(x))_{m >= 1, (m,p) = 1}, f_m(x) in epsilon_m(xi)^{1/m} (R^_p[zeta_m]^x + x K_p[zeta_m][[x]]) of power series (here x = q - zeta_m as usual) that satisfies log(phi_p f-hat(q^p) / f-hat(q)^p) in the product over m of p x R^_p[zeta_m][[x]]. Here f-hat(q) = (f-hat_m(x))_m is the formal completion of f ...

- Theorem 1, §1.5, The existence and rank-one statement with its hypotheses, verbatim.

  > Let K be a number field, and Delta a number divisible by its discriminant and by 6. For xi in K_3(K) and p a prime with (p, Delta) = 1, there exist invertible L_p(xi)-sections. Moreover, the module of such sections is of rank one over the completed Habiro ring.

### The global module graded by the third K-group

`HabiroNumberFields:HB.7/the-global-module` · *definition* · planet **The K-three-graded module**

For a class in the third K-group the MODULE is the set of families of power series, one at each order, each lying in the coefficient module given by the unit of HB.2 to the power one over the order, such that the family restricted to the orders prime to a prime is a local section at that prime for every prime, and such that a gluing condition holds under raising the variable to a positive power: the ratio of the family at the power to the power of the family at the inverse lies in the restricted Habiro ring of the quotient. The equivariance of the units for the inverse cyclotomic character is exactly what makes the ambiguity in their roots disappear in that condition. The source restricts to primes prime to six for the condition to have the intended meaning.

**Hypotheses.**

- The class is in the third K-group of the field; the module is over the Habiro ring of HB.6.
- The local condition is imposed at every prime through the canonical map to the completion.
- The gluing condition under raising to a power needs an interpretation of the class divided by that power, which the source flags as an issue.

**Proof outline.**

1. State the coefficient module at each order, with the unit and its root.
2. State the local condition at every prime.
3. State the gluing condition under raising the variable to a power.
4. Record the role of the equivariance of the units in removing the ambiguity of their roots.
5. Record the source's own caveat about the interpretation of the class divided by the power, and the restriction to primes prime to six.
6. Record the degenerate case of the zero class, where the module is the ring itself.

**Acceptance.**

- For the zero class the module is the ring of HB.6.
- The equivariance of the units removes the root ambiguity in the gluing condition.
- The restriction to primes prime to six is the source's and is used.
- The interpretation of the class divided by a power is a flagged issue, not a silent step.

**Prerequisites.** `HabiroNumberFields:HB.7/invertible-local-sections`, `HabiroNumberFields:HB.6/the-gluing-condition`

**API.**

| name | role | statement |
| --- | --- | --- |
| `HabiroModule` | data | The module attached to a class. |
| `HabiroModule.local` | characterisation | The local condition at every prime. |
| `HabiroModule.glue` | characterisation | The gluing condition under raising to a power. |
| `HabiroModule.zero` | example | For the zero class it is the ring. |
| `HabiroModule.equivariance` | relation | The equivariance that removes the root ambiguity. |

**Used by.**

- *HB.7, the operations* — Multiplication and change of index are maps of these modules.
- *HabiroNahmSeries* — The q-series constructed there are elements of these modules.
- *ArithmeticQuantumTopology* — The unified quantum invariants are expected to live here.

**Unit tests.**

- `zero_class` — For the zero class the module is the ring.
- `local_everywhere` — The local condition is imposed at every prime, not at one.
- `equivariance_used` — Without the equivariance of the units the gluing condition is ambiguous.
- `six_restriction` — The restriction to primes prime to six is used.

**Sources.**

- Definition 1.4, §1.5, The definition with both conditions, verbatim.

  > Fix xi in K_3(K). The H_R-module H_{R,xi} consists of collections f(q) = (f_m(x))_{m >= 1}, f_m(x) in epsilon_m(xi)^{1/m} K[zeta_m][[x]] such that under the canonical map K -> K_p we have (f_m(x))_{m >= 1, (m,p) = 1} in the local module at p, and the following gluing condition for gamma in Z_{>0} is satisfied: f(q^gamma)^gamma / f(q^{-1}) lies in the restricted Habiro ring H_{R/gamma}|gamma.

- §1.5, the remarks after Definition 1.4, The role of the equivariance and the restriction to primes prime to six, verbatim.

  > We also note that the chi^{-1}-equivariance of epsilon_m makes the a priori ambiguity of their m-th roots disappear in equation (24). For the moment we assume that p is prime to 6, because only then does the above condition yield the correct gluing condition.

### Multiplication, change of index, scalars, Galois and evaluation

`HabiroNumberFields:HB.7/operations-on-the-modules` · *construction*

The modules carry the operations the stage text lists: multiplication pairing the module of one class with that of another into the module of the sum, change of index along a map of classes, extension of scalars, the Galois action, restriction of the root orders and evaluation at a root of unity. Each is constructed with exactly the invertibility and localisation hypotheses the source proves, and the node records which of them need a prime inverted and which do not. The ring case, where the class is zero, is the ring of HB.6 acting on itself, and the comparisons with tensor powers are recorded where the source proves them.

**Hypotheses.**

- The classes are in the third K-group; the operations are over the Habiro ring of HB.6.
- Several operations need primes inverted, and the node records which; the inverted integer is the one fixed in HB.6.
- Evaluation is at a root whose order is admissible, and its target is the coefficient ring at that order.

**Proof outline.**

1. Construct the multiplication and prove that it lands in the module of the sum of the classes.
2. Construct the change of index and the extension of scalars, with their hypotheses.
3. Construct the Galois action and prove its compatibility with the units.
4. Construct the restriction of root orders and the evaluation.
5. Record the ring case and the tensor comparisons the source proves.
6. Record the compatibility of the Frobenius gluing with the transfer in the third K-group, which the stage text asks for.

**Acceptance.**

- Multiplication lands in the module of the sum of the classes.
- The ring case is the module of the zero class.
- Evaluation lands in the coefficient ring at the order.
- Each operation carries its own invertibility and localisation hypotheses.

**Prerequisites.** `HabiroNumberFields:HB.7/the-global-module`, `HabiroNumberFields:HB.6/ring-operations-and-the-classical-comparison`, `ArithmeticKTheory:N.5`

**API.**

| name | role | statement |
| --- | --- | --- |
| `HabiroModule.mul` | data | The multiplication pairing. |
| `HabiroModule.changeIndex` | data | Change of index along a map of classes. |
| `HabiroModule.baseChange` | data | Extension of scalars. |
| `HabiroModule.galois` | data | The Galois action. |
| `HabiroModule.restrictOrders` | data | Restriction of the root orders. |
| `HabiroModule.evalAt` | data | Evaluation at an admissible root of unity. |

**Used by.**

- *HB.7, the negative statements* — The next node says which of these are not isomorphisms.
- *HabiroNahmSeries* — The series are multiplied and evaluated with these operations.
- *HabiroRings:HR.5* — The relative construction must reproduce them.

**Unit tests.**

- `mul_grading` — Multiplication adds the classes.
- `ring_case` — The zero class gives the ring acting on itself.
- `eval_target` — Evaluation lands in the coefficient ring at the order.
- `hypotheses_recorded` — Each operation names the primes it needs inverted.

**Sources.**

- §1.5, the remark after Definition 1.4, The change-of-index operation with the difficulty the source flags, verbatim.

  > Note that the function (gamma * f)(q) := f(q^gamma) behaves like an element of the module H_{R/gamma, xi/gamma}|gamma (where again |gamma denotes the restriction to roots of unity of order prime to gamma). The issue is that one must make sense of xi/gamma as an element of K_3.

### Locally a line, globally not free

`HabiroNumberFields:HB.7/what-the-local-picture-does-not-give` · *comparison*

The local modules are of rank one over the completed Habiro ring, and that is exactly what makes the global modules look like line bundles. It does NOT follow that a global module is free, nor that every multiplication map between them is an isomorphism: the local description is a local statement and the global object is obtained by a gluing condition over all primes together with the condition under raising the variable to a power. This node states both non-implications and records what would be needed to close each: a global triviality statement, and an invertibility statement for the particular multiplication.

**Hypotheses.**

- The local rank-one statement is the source's first theorem and is available at every admissible prime.
- The global object is defined by conditions at all primes; freeness would be a statement about the family, not about each member.
- A multiplication map is an isomorphism when both factors are invertible in the appropriate sense, which is a hypothesis to be proved.

**Proof outline.**

1. State the local rank-one theorem.
2. State the first non-implication, that global freeness does not follow, and say what would give it.
3. State the second, that a multiplication map need not be an isomorphism, and say what would give it.
4. Record the source's own care on this point, which is that the theorem is stated locally.
5. State the rule this node exports: any global statement about these modules cites a global theorem, never the local rank-one description.

**Acceptance.**

- The local modules are of rank one.
- Global freeness does not follow and is not claimed.
- A multiplication map need not be an isomorphism.
- Each global statement needs a global theorem.

**Prerequisites.** `HabiroNumberFields:HB.7/operations-on-the-modules`, `HabiroNumberFields:HB.7/invertible-local-sections`

**Sources.**

- Theorem 1, §1.5, The rank-one statement, verbatim, which is LOCAL: the theorem is stated at a prime, and the global statements this node forbids do not follow from it.

  > Moreover, the module of such sections is of rank one over the completed Habiro ring.

## Gaps

### The proofs in the number-field paper were not read

Needed by: `HabiroNumberFields:HB.6`, `HabiroNumberFields:HB.7`.

Definitions 1.1, 1.3 and 1.4 and the statement of the rank-one theorem were read in full, with their remarks and footnotes. The proofs, which are in the paper's sections two and three together with the admissible-series machinery and Dwork's lemma, were not read for this packet. The proof steps of the HB.6 and HB.7 nodes therefore record the structure and the inputs rather than the arguments. NEXT SOURCE ACTION: read §§2 and 3, in particular the proof of Theorem 1 and Lemmas 3.4 and 3.6, which are what the existence of invertible sections and the gluing condition rest on.

### The units paper was read only through its introduction

Needed by: `HabiroNumberFields:HB.1`, `HabiroNumberFields:HB.2`.

Theorems 1.2 and 1.6 and Remark 1.3 were read with their hypotheses, and the section headings locate the finite-field reduction and the local Chern class maps. The construction of the cyclic quantum dilogarithm in §2, the reduction to finite fields in §4 and the comparison proof in §5 were not read. The HB.2 nodes state the construction and its properties from the introduction's description. NEXT SOURCE ACTION: read §§2, 4 and 5, which is where the five-term relation and the comparison are actually proved.

### Hutchinson's proof was read only to its third section

Needed by: `HabiroNumberFields:HB.2`.

The abstract, the review of Suslin's sequence and the Chern-class isomorphism, Soule's product formula and the theorem computing the Chern class on the distinguished element were read. The Bott-element computation and the completion of the proof in the later sections were not. NEXT SOURCE ACTION: read §§3 and 4 of the LaTeX source in full.

### The cohomological input of HB.1 has no source in this packet

Needed by: `HabiroNumberFields:HB.1`.

The stage text insists that the cohomological theorem used in the units paper's third section be formalised rather than assumed: the norm-residue and Chern comparison, the finite-coefficient exact sequence and the arithmetic finiteness inputs. This packet imports all three by name from the motivic-etale, K-three and arithmetic roadmaps, and decomposes none of them; what it adds is the statement of what is imported, so that the dependency is visible. NEXT SOURCE ACTION: none here; the three owners should be read and their packets checked to confirm that what they prove is what this layer needs.

## Requests

- **`K3BlochGroups:V.4`** — Suslin's exact sequence relating the third K-group to the Bloch group, with its torsion term, which is the bridge HB.1 uses to compare the two Bloch conventions.

- **`K3BlochGroups:V.1`** — The Bloch group itself in Suslin's convention, one of the two HB.1 compares.

- **`K3BlochGroups:V.2`** — The five-term relation, which is what makes HB.2's map well defined on the Bloch quotient.

- **`MotivicEtaleKTheory:M.3`** — The norm-residue map and the finite-coefficient comparison, which HB.1 imports rather than assuming; the stage text makes this explicit.

- **`MotivicEtaleKTheory:M.8`** — The etale Chern classes with their compatibilities and Soule's product formula, which HB.1 uses and which HB.2's refinement rests on.

- **`ArithmeticKTheory:N.4`** — The twisted coefficient modules and the cyclotomic character conventions, which HB.1's eigenspace node fixes against.

- **`ArithmeticKTheory:N.1`** — The ring of S-integers with its discriminant data, which is the coefficient ring of HB.6.

- **`ArithmeticKTheory:N.5`** — The odd K-groups of a number field, whose classes index the modules of HB.7.

- **`HabiroCyclotomicCompletions:HC.1`** — The classical cyclotomic completion with its projections and functorialities, which HB.6 generalises and to which it compares for the rationals.

- **`HabiroCyclotomicCompletions:HC.3`** — The substitution and re-expansion lemma under topological nilpotence, which HB.6's gluing condition needs; the two roadmaps must state it in the same form.

- **`HabiroCyclotomicCompletions:HC.6`** — The exported interface of the classical roadmap and its comparison with the number-field case, which HB.6 is the other half of: that roadmap states the map and this one states the ring it lands in.

- **`HabiroCyclotomicCompletions:HC.5`** — The decomposition phenomena after inverting primes, which is why HB.6 does not claim that its ring is a domain.

- **`PadicHodgeRegulators:D.4`** — The p-adic regulator with its normalisation, which enters the formal completion of HB.7's local sections.

- **`HabiroRings:HR.5`** — The relative etale construction, which specialises to the ring of HB.6; the stage text records that HB.6 can be built first and that the comparison is not an input to it.

- **`StableHomotopyKTheory:H.2`** — The Bott element and the finite-coefficient K-theory machinery that Hutchinson's proof uses.

## Structural proposals

### HB.2's refinement now has a proved source and the stage text should say the scalar is settled for odd orders

*note-source-boundary*

The stage text says that the units paper 'initially allows an invertible universal power' and asks for Hutchinson's refinement to be proved with its hypotheses. Hutchinson's note proves exactly that the scalar is the square for odd orders, and its LaTeX source is freely available; this packet quotes it. The stage text should record that the scalar is settled in that range, while keeping its instruction that outside the range the weaker comparison is retained, so that a reader does not treat the question as open where it is not.

### The inverted integer carries two conditions and both should be named in HB.6 and HB.7

*note-hypothesis-boundary*

The number-field paper asks that the inverted integer be divisible by the discriminant, and for the module theory that it also be divisible by six. HB.6's stage text names only the discriminant condition and HB.7's discussion of two and three is separate. Both conditions should be named in both stage texts, because the rank-one theorem and the gluing condition of the modules use the second, and a reader who fixes the integer from HB.6's text alone will not have enough.

### HB.1 carries two independent developments

*propose-split*

HB.1 asks both for the comparison of the two Bloch conventions, which is Bloch-group algebra with a bounded primary correction, and for the finite-coefficient K-theory with its Chern class, which is imported cohomology. The first can be done against the K-three roadmap alone; the second waits on the motivic-etale one. Splitting would let the first close while the second is still blocked. The four nodes divide one to three along that line.

## What this blueprint does not claim

No Lean was compiled. The Mathlib build on this machine is a shared cache that
must not be rebuilt, and this working tree has no elaborated dependency modules.
Every `implementationStatus` is `unchecked`, the suggested Lean file is a naming
proposal whose proofs are all `sorry`, and nothing here is claimed to be
formalised.

Five excerpts ran past four hundred characters and were elided at a word
boundary; the locators name the printed pages so the full text can be read.
