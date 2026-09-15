# Noncommutative and equivariant Iwasawa theory

Revision: 2026-09-15. Curriculum extension; every stage requires source decomposition before proof execution.

## Scope and ownership

Fix a prime p, a compact p-adic Lie group G and O the valuation ring of a finite extension of Qp; a more general complete DVR is admitted only under a separately stated source theorem. Extend the commutative arithmetic owners using completed group rings, relative K-theory and equivariant complexes. IntegralIwasawaTheory retains its all-prime abelian theorem and comparison gates. This area must not erase odd-prime, mu, admissibility or uniqueness hypotheses from older noncommutative theorems.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). Construction specifications below do not assert that their interfaces or proofs already exist in Tau Ceti. Source acquisition, statement inspection, proof decomposition, elaboration and kernel-checked completion are distinct states.

## Stages

### NE.0 Completed group rings for p-adic Lie groups

**Construct and export.** Construct O[[G]] as the inverse limit over open normal subgroups and coefficient quotients, its topology and continuous module actions. Develop restriction/induction and augmentation. For an admitted normal subgroup H with G/H isomorphic to Zp, prove the needed noetherian and module-finiteness facts under the exact group hypotheses.

**Inputs.** `PadicMeasuresIwasawaAlgebras:L1`, `FoundationsAndLibraryIntegration:LI.4`

**Acceptance.** Recover O[[T]] for G=Zp and finite-level noncommutative group rings for a concrete nonabelian quotient. Separate absence of p-torsion, torsion-freeness and pro-p assumptions.

**Source route.** AE-CFKSV algebraic framework; select primary Lazard/Venjakob results for each noetherian or homological claim.

**Known/conjectural boundary.** Finite global dimension is not asserted for groups with p-torsion. Commutative dimension/ideal arguments require new proofs here.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### NE.1 Ore localization and torsion categories

**Construct and export.** Define the canonical multiplicative set relative to H and any p-saturated variant exactly as in the selected theorem. Prove both Ore conditions, denominator regularity where used and the universal localization property. Define the corresponding torsion module/perfect-complex category and compare its finiteness criterion over O[[H]].

**Inputs.** `NoncommutativeAndEquivariantIwasawa:NE.0`

**Acceptance.** Check the cyclic quotient example and a source-admitted nonabelian case. Never introduce a fraction ring merely by copying the commutative construction.

**Source route.** AE-CFKSV canonical Ore set theorem and its hypotheses; full proof extraction required.

**Known/conjectural boundary.** The denominator set is part of the theorem. Localization at all nonzero elements is neither generally defined nor equivalent to the canonical localization.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### NE.2 K1, relative K0 and characteristic elements

**Construct and export.** Construct the localization boundary K1(Lambda_S) to relative K0 and represent classes of perfect torsion complexes. Prove exactness and functoriality with the sign convention fixed. Define characteristic elements as lifts of a specified relative class and prove their ambiguity is the image of K1(Lambda).

**Inputs.** `NoncommutativeAndEquivariantIwasawa:NE.1`, `GeneralAlgebraicKTheory:K.5`, `GeneralAlgebraicKTheory:K.6`

**Acceptance.** For a commutative one-variable cyclic torsion module recover its characteristic power series up to units. Check short exact sequences and mapping cones rather than comparing only orders.

**Source route.** AE-CFKSV localized K-theory; existing GeneralAlgebraicKTheory localization construction.

**Known/conjectural boundary.** A characteristic element is not a uniquely chosen scalar generator and may require a vanishing obstruction before a lift exists.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### NE.3 Artin evaluation, reduced norms and SK1

**Construct and export.** Define twisting and evaluation at continuous finite-dimensional Artin representations where the localized map exists. Construct reduced norms and the SK1 kernel in the admitted semisimple total-quotient algebra. Prove functoriality under coefficient extension and identify precisely what character evaluations determine.

**Inputs.** `NoncommutativeAndEquivariantIwasawa:NE.2`

**Acceptance.** Evaluate a known unit and its induced representation, keeping determinant, contragredient and Frobenius conventions. Show explicitly where an SK1 ambiguity survives characterwise equality.

**Source route.** AE-CFKSV evaluation; AE-RW and AE-RW2026 uniqueness scope, newest version to be read before any strengthened claim.

**Known/conjectural boundary.** Equality of all scalar evaluations is not automatically equality in K1. Recent uniqueness work is a source-review task, not a universal theorem in this plan.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### NE.4 Equivariant arithmetic complexes

**Construct and export.** Construct compactly supported/Iwasawa Galois complexes with G action, local conditions and derived induction/restriction. Prove perfectness and S-torsion hypotheses under the selected ramification/cohomological assumptions. Track archimedean terms and duality before assigning relative K0 classes.

**Inputs.** `NoncommutativeAndEquivariantIwasawa:NE.2`, `ArithmeticGaloisDuality:R02.4`, `IntegralIwasawaTheory:I.4`

**Acceptance.** Specialize to a cyclotomic abelian extension and identify the existing arithmetic complex, including its cohomological degrees and finite correction modules.

**Source route.** Existing arithmetic duality and IntegralIwasawaTheory source register; AE-KAKDE/RW complexes with exact conventions.

**Known/conjectural boundary.** Ordinary compact-support conventions can lose real two-primary terms. Cases at p=2 require an independently proved compatible complex.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### NE.5 Zeta elements and interpolation contracts

**Construct and export.** Formulate a localized-K1 zeta element with its boundary and Artin-interpolation properties, including periods, local factors and exceptional-zero behavior. Define norm, restriction and abelianization maps and prove agreement with existing commutative determinant formulas in their shared hypotheses.

**Inputs.** `NoncommutativeAndEquivariantIwasawa:NE.3`, `NoncommutativeAndEquivariantIwasawa:NE.4`, `IntegralIwasawaTheory:I.9`

**Acceptance.** One abelian specialization must recover the actual normalized p-adic L-function and arithmetic determinant, not merely some element with the same ideal.

**Source route.** AE-CFKSV formulation; acquire Fukaya–Kato original formulation; IntegralIwasawaTheory I.9 for the scoped abelian comparison.

**Known/conjectural boundary.** Existence and uniqueness are separate propositions. A conjectural interpolation object cannot discharge a downstream theorem.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### NE.6 Source-qualified main theorems

**Construct and export.** Decompose Kakde and Ritter–Weiss routes into integral logarithms/congruences, abelian pseudomeasures, noncommutative patching and localization boundary calculation. Produce separate theorem records for their precise odd-prime, totally-real, admissibility and mu assumptions. Add newer unconditional abelian results through explicit comparison maps; create a distinct function-field route only with its own primary source and coefficient restrictions.

**Inputs.** `NoncommutativeAndEquivariantIwasawa:NE.5`

**Acceptance.** A coverage table must compare theorem statement, uniqueness assertion, p=2 status and mu assumptions source by source. At least one completed theorem includes every intermediate congruence and descent lemma.

**Source route.** AE-KAKDE v3, AE-RW, AE-ABELIAN2025; AE-RW2026 is a separate recent-source audit.

**Known/conjectural boundary.** Unconditional abelian results do not remove hypotheses from arbitrary nonabelian extensions. No claim of a universal main-conjecture theorem is made.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### NE.7 Descent, leading terms and equivariant consumers

**Construct and export.** Construct derived specialization and the Bockstein/regulator data used to define leading terms when evaluations vanish. Prove descent identities under the source semisimplicity/finiteness conditions and export the relative K-theory statement to special values. Treat exceptional zeros and noncommutative Fitting invariants with their actual orders and denominator ideals.

**Inputs.** `NoncommutativeAndEquivariantIwasawa:NE.6`

**Acceptance.** Recover a nonvanishing scalar specialization and one sourced vanishing case with its Bockstein determinant. Characterwise numerical equality is not accepted as an integral equivariant formula.

**Source route.** AE-DESCENT original paper; choose primary sources for any noncommutative Fitting-ideal application.

**Known/conjectural boundary.** Leading-term descent uses additional arithmetic and semisimplicity assumptions; it is not automatic from interpolation away from zeros.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

## Source access and preparation

The following are primary-source routes. Access descriptions state what was actually inspected during this revision; they do not claim full proof review.

- **AE-CFKSV:** [Coates–Fukaya–Kato–Sujatha–Venjakob, The GL_2 main conjecture for elliptic curves without complex multiplication](https://arxiv.org/abs/math/0404297). Primary abstract and bibliographic scope checked; localization hypotheses and theorem-level proof dependencies pending.
- **AE-KAKDE:** [Kakde, The main conjecture of Iwasawa theory for totally real fields, v3 (2011)](https://arxiv.org/abs/1008.0142v3). Primary abstract checked: odd p, totally real p-adic Lie extensions, a specified mu-vanishing assumption. Full proof not audited.
- **AE-RW:** [Ritter–Weiss, On the main conjecture of equivariant Iwasawa theory](https://arxiv.org/abs/1004.2578). Primary abstract checked; original result is qualified by its prime/mu hypotheses and uniqueness scope.
- **AE-RW2026:** [Ritter–Weiss, On uniqueness in equivariant Iwasawa theory (2026)](https://arxiv.org/abs/2608.22601). Primary abstract checked only. Recent SK1/uniqueness work requires exact version and scope review; no general uniqueness claim is inferred.
- **AE-ABELIAN2025:** [An unconditional equivariant main conjecture in Iwasawa theory and applications (2025)](https://link.springer.com/article/10.1007/s40687-025-00578-8). Primary article introduction/abelian setup checked. Does not license removal of hypotheses from arbitrary noncommutative theorems.
- **AE-DESCENT:** [Burns–Venjakob, On the leading terms of zeta isomorphisms and p-adic L-functions in non-commutative Iwasawa theory](https://arxiv.org/abs/math/0511672). Primary abstract selected for localized K1 descent; exact semisimplicity/Bockstein hypotheses pending.

For every further source requested within a stage, acquire the full accessible version, record its hash/edition, identify the exact theorem and all hypotheses, and split its proof into independently reviewable constructions and lemmas. Do not turn a title or abstract into a verified source unit. Record unresolved locators as preparation work. Check pinned library APIs through LI.0 before choosing Lean names.

## Completion contract

Complete the mathematical constructions, their functorial/API lemmas and all stated comparison maps before marking a stage implemented. Proof consumers must instantiate the actual exported maps and hypotheses. Comments and abstract structures are design artifacts. No new axiom or `sorry` is introduced by this roadmap; currently open mathematical conjectures are explicit conditional targets.
