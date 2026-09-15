# Source contracts and restrictions

## What counts as a supplied result

A supplier contract consists of the actual objects, the quantified hypotheses, a proved theorem,
and its naturality/compatibility with the preceding definitions. It is not a typeclass field
asserting the desired result, a `sorry`, or an arbitrary equivalence with the correct domain
and codomain. The source index is a coverage ledger for the paper, not evidence that the
corresponding mathematics has already been formalized.

The milestone graph records the proposed proof order and declared prerequisites. External
roadmap nodes are obligations on their suppliers. Basic algebraic/categorical lemmas not yet
in the chosen implementation are built in the consumer's existing namespaces, rather than
silently added to the list of assumed results.

## Deep inputs that require their own proofs

| Input | Owner and required extra work |
|---|---|
| General-ring perfectoid tilting and rational acyclicity | P0–P2: almost mathematics, integral reductions, completion, gluing and site-cohomology comparison |
| Almost purity | P3: integral almost-finite-étale lifting and finite étale equivalence, not a field-only theorem |
| Zariski closed = strongly Zariski closed | PrismaticCohomology PR.0–2, DerivedDeRhamCohomology DD.0–1/DD.5 and CrystallineCohomology CR.0–2 own generic BS22 foundations; Q0–Q4 import them and own integral-perfectoid specialization, André's application, perfectoidization surjectivity and the closed-quotient endpoint |
| Affinoid étale finite-stage descent | P5, A3, P6: henselian approximation, pseudocoherent gluing and the characteristic-`p` analytic perturbation result; no use of downstream diamond locality |
| Cutoff invariance | D0/P6/D2: cardinal arithmetic, perfectoid closure bounds and the sheaf/cohomology comparison |
| Ordinary and enhanced sheaf theory | D0 and E0–E5 own models, resolutions, presentability, Postnikov limits and coherent diagrams; DerivedDeRhamCohomology DD.1 owns generic derived completion, reexported by E4 |
| Analytic valued-field invariance | H1–H2: henselian/formal-model comparison and Hub96 4.1.1(c) before ECD 16.1 |
| Analytic curve duality and relative constructibility | H3–H4: Hub96 7.2.2, 7.5.3, 6.2.2, and the relevant scheme-curve inputs |
| Biduality's curve compactification | H5: Lüt95 5.3 and its formal/curve-algebraization prerequisites |
| Point and spectral cohomological dimension | C8: import ArithmeticGaloisDuality R02.1–R02.2 all-degree continuous Hochschild–Serre and compact/discrete comparisons; prove its diamond specialization, wild/tame inertia, residue/value-group bounds and Scheiderer92 |
| General qcqs scheme lower shriek | L2: extension of the Noetherian supplier using noetherian approximation, general Nagata and coefficient/category comparisons |
| Alterations in scheme comparison | L5: de Jong's general-dimensional construction, proper hyperdescent and local boundary computations |
| Fargues–Fontaine identification | F0–F3: Witt universal property, marked untilts, Frobenius equivariance and quotient-chart descent on the existing curve |
| Untilts as Cartier divisors | F4: closed-image estimates and quotient exactness on period-annulus neighborhoods, not just a point-functor bijection |

## Restrictions which must appear in theorem statements

**Geometry.** General perfectoid rings need not live over a field. Plus rings are explicit.
Étale and quasi-pro-étale stack morphisms include local separatedness. Atlas projections of
diamonds are generally quasi-pro-étale. Point-surjectivity only gives the stated v-surjectivity
under the compactness assumptions. Spatiality is not just a statement about a quotient's
underlying set or topology.

**Compactification.** ECD 22.2 uses a partially proper second map. The local splitting
hypothesis in 22.3(vii) must be retained. In the reverse/source-descent direction of 23.13,
compactifiability of the intermediate map is not deleted. In 23.15, local finiteness of
`dim.trg` of the original map remains an assumption. The canonical compactification is not
assumed spatial, so 22.5 gives `3d` generally and `2d` only under the additional condition.

**Categories and coefficients.** `D_ét` is left-completed; its ambient v-category is larger.
Presentability/adjoints are constructed at adequate cutoffs with compatible comparison maps.
Tensor/pullback and internal Hom/pushforward behave differently with respect to the ambient
inclusion. The six-operation theorem has the prime-to-`p` coefficient hypothesis and the
stated geometric restrictions on `Rf!` and `Rf^!`. The adic coefficient theorem uses derived
completion and completed tensor/colimits, with the regular-sequence hypothesis for coefficient
reconstruction; it is not a theorem for `p`-adic coefficients.

**Constructibility and duality.** Constructible means spectral constructible; a point and its
punctured complement in a closed analytic disc do not give the required stratification.
Over general coefficients distinguish perfect-constructible from bounded constructible.
Preservation of perfect-constructibility by the cited `Rf!` theorem requires qc cohomological
smoothness. Biduality in 25.1 is over `Spa(C,𝒪_C)`, not an arbitrary `Spa(C,C⁺)`. The
counterexample in 25.2 and the conditional discussion in 25.6 are mandatory tests/restrictions.

**Quotients.** In §24, the profinite group has pro-order prime to `ℓ` where the Haar/trace
argument needs it. The nonfree quotient theorem retains its image-relation and geometric-fibre
hypotheses. The identity `q^! = q*` for the quotient map is not asserted.

**Scheme comparisons.** Full faithfulness is not an equivalence. Distinguish the two plus-ring
conventions in §27. The characteristic-`p` result 27.4 has its qcqs/separated/finite-type
scope; the mixed-characteristic statements have the complete-DVR/perfect-residue/finite-type
scope. The comparison for `Rf*` is only asserted with the constructible and finite
prime-to-`p` coefficient assumptions proved in 27.6. Alterations need not have degree prime
to `ℓ`; use cohomological descent instead of an invalid trace division.

**Fargues–Fontaine.** The initial Witt ring has its two-generator adic topology. The open
period domain is `D(p) ∩ D([ϖ])`, not their union. The quotient relation uses the existing
adic Frobenius. The product formula is an isomorphism of functors; the quotient acts on the
characteristic-`p` factor. Do not identify the fixed curve with `S × Div¹`, claim a structural
map to `S` from an equality of topological spaces, infer perfectoidness, or import the
classification of vector bundles as a prerequisite.

## Printed formulations requiring type clarification

These are explicit clarifications, not stronger mathematical claims.

* In the introductory projection formula, place the base object on the base and the source
  object on the source. This family uses `A ∈ D_ét(X,Λ)`, `B ∈ D_ét(Y,Λ)` and
  `Rf!(B ⊗ f*A) ≃ Rf!B ⊗ A`; compare the proof in 22.23.
* Use the correct order of pullback functors: `(f ∘ g)* ≃ g* ∘ f*`. Translate carefully
  to Lean's categorical composition convention rather than copying a displayed formula
  with incompatible domains.
* In the proof of 23.16(iii), tensor displays over `𝔽_ℓ` occur under the
  proposition's ℓ-power-torsion coefficient ring `Λ`; formulate with one consistent coefficient
  category and verify it by the accompanying argument; no change-of-coefficients theorem
  is supplied merely by changing a symbol.
* In Remark 25.3 the perfect global-sections complex is over the coefficient ring `Λ`,
  not over the object denoted `A` in the statement.
* Whenever `Rf^!` occurs in 23.16(iii), carry the eligibility hypotheses making it defined.
* In 27.7 retain the standing prime-to-`p` range used in 27.6 and in its proof. The shorter
  isolated phrase “finite ring” is not taken as evidence for an unproved `p`-torsion extension.

## Source questions, not theorem obligations

ECD Question 21.4 and Question 24.7 remain questions in the chosen source. The source index
labels them separately. Nothing here assumes a positive answer. A future proof of either
would be an additional mathematical result, not a missing prerequisite concealed by this plan.
