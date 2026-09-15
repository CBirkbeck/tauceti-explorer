# Periods, motivic L-values and special-value conjectures

Revision: 2026-09-15. Curriculum extension; every stage requires source decomposition before proof execution.

## Scope and ownership

Own comparison-period and special-value assembly across motives. Reuse the constructions and scoped theorems in BorelRegulators, EllipticRegulators, MotivicEtaleKTheory, RankZeroOneBSD and IntegralIwasawaTheory. Record every coefficient embedding, determinant convention, local Euler factor and rationality field.

Use [the campaign execution protocol](../../campaign-guide/AI_EXECUTION.md). Construction specifications below do not assert that their interfaces or proofs already exist in Tau Ceti. Source acquisition, statement inspection, proof decomposition, elaboration and kernel-checked completion are distinct states.

## Stages

### PS.0 Comparison spaces and period lines

**Construct and export.** Construct Betti/de Rham realization comparison matrices and basis-independent determinant lines for motives with a chosen embedding. Track complex conjugation eigenspaces, Hodge filtration and Tate twists. Define period classes modulo the stated coefficient-field units, together with the effect of changing bases and embeddings.

**Inputs.** `MotivesAndAlgebraicCycles:MC.2`, `FoundationsAndLibraryIntegration:LI.4`

**Acceptance.** Compute the Tate-object period and an elliptic-curve comparison matrix in one explicit convention. Equality modulo algebraic units must not be advertised as an exact scalar formula.

**Source route.** AE-DELIGNE definitions of realizations, criticality and periods; select exact original locators.

**Known/conjectural boundary.** Existence of realizations is an input theorem, not an arbitrary tuple of vector spaces claimed to come from a motive.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### PS.1 Critical values and algebraicity statements

**Construct and export.** Define completed motivic L-functions from local Weil–Deligne data in admitted cases and derive critical integers from archimedean factors. Formulate Deligne-type normalized-value statements with sign, powers of 2πi, coefficient field and Galois equivariance. Prove the Dirichlet/Tate and separately sourced modular-form cases, retaining ramified and imprimitive corrections.

**Inputs.** `PeriodsAndSpecialValues:PS.0`, `AnalyticNumberTheory:AN.1`, `AutomorphicLFunctionsAndLocalFactors:AL.1`, `AutomorphicLFunctionsAndLocalFactors:AL.4`, `AutomorphicLFunctionsAndLocalFactors:AL.5`

**Acceptance.** Check that criticality is a simultaneous regularity condition for the relevant infinity factors. Distinguish algebraicity up to a field unit from equality using a chosen integral period.

**Source route.** AE-DELIGNE original conjecture and proved examples; existing Dirichlet/modular special-value owners for constructions.

**Known/conjectural boundary.** General Deligne conjectures remain conditional statements. Algebraicity of a normalized value does not prove nonvanishing.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### PS.2 Formal periods and the evaluation map

**Construct and export.** Construct the algebra of formal periods from algebraic integration data and its linearity, change-of-variables and Stokes relations. Prove the comparison with the coordinate ring of the Nori period torsor and construct evaluation in C. Separate identities forced by the relations from any assertion that evaluation is injective.

**Inputs.** `PeriodsAndSpecialValues:PS.0`, `MotivesAndAlgebraicCycles:MC.6`

**Acceptance.** Represent 2πi and basic algebraic periods, verify multiplication by products of pairs, and trace a relation through both torsor and integral presentations.

**Source route.** AE-NORI formal-period/torsor theorem; proof decomposition pending.

**Known/conjectural boundary.** The numerical period conjecture is not a consequence of the formal torsor theorem. Transcendence statements require their own proofs.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### PS.3 Regulator determinants and leading terms

**Construct and export.** Assemble rational motivic cohomology, real/Deligne regulators and leading-term lines. Compare higher K-theory and motivic regulators via the actual comparison maps; retain torsion information separately when moving from rational spaces to integral lattices. Export coordinate-free determinant equalities and their matrix versions.

**Inputs.** `PeriodsAndSpecialValues:PS.0`, `BorelRegulators:R.7`, `MotivicEtaleKTheory:M.8`, `EllipticRegulators:ER.5`

**Acceptance.** For a number field, check the zero-rank and nonzero-rank Borel cases with embedding multiplicities and covolume normalization. Never infer an integral index from equality after tensoring with Q.

**Source route.** Existing BorelRegulators and EllipticRegulators source registers; acquire exact Beilinson leading-term formulations for each new motive.

**Known/conjectural boundary.** Beilinson-type leading terms for general motives are conjectural. A sourced special case retains all of its rank and coefficient assumptions.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### PS.4 Integral fundamental lines and local corrections

**Construct and export.** Construct integral determinant lines of perfect global/local cohomology complexes, finite/singular conditions, archimedean corrections and the real comparison trivialization. Prove invariance under quasi-isomorphism and change of lattice; compute the contribution of finite kernels/cokernels and bad-prime Euler/Tamagawa factors.

**Inputs.** `PeriodsAndSpecialValues:PS.3`, `ArithmeticGaloisDuality:R02.4`, `GeneralAlgebraicKTheory:K.6`

**Acceptance.** Track a finite-module exact sequence through determinant and Fitting conventions. Include the p=2 real-place complex where required instead of silently killing two-primary information.

**Source route.** Existing ArithmeticGaloisDuality and IntegralIwasawaTheory conventions; source selection for the chosen Bloch–Kato/Fukaya–Kato fundamental line.

**Known/conjectural boundary.** Perfectness and local finite-condition compatibility must be proved for the selected coefficient ring. Fitting ideals and determinant generators are different objects.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### PS.5 Equivariant Tamagawa-number statements

**Construct and export.** Formulate zeta-element and equivariant Tamagawa-number assertions in the correct relative K-group/fundamental line, with regulator, functional-equation and duality normalization. Provide theorem-by-theorem adapters for proven Tate/Artin and abelian cases, without replacing noncommutative K1 by ordinary scalar units.

**Inputs.** `PeriodsAndSpecialValues:PS.4`, `NoncommutativeAndEquivariantIwasawa:NE.3`

**Acceptance.** For a commutative coefficient specialization recover the existing determinant formula. Each equivariant specialization states the order, localization and reduced-norm ambiguity.

**Source route.** AE-DESCENT; acquire original Burns–Flach and Fukaya–Kato formulations with exact versions and theorem locators.

**Known/conjectural boundary.** General ETNC and zeta-isomorphism conjectures stay explicit assumptions; the unconditional abelian theorem does not prove the arbitrary equivariant statement.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### PS.6 BSD and Bloch–Kato assembly

**Construct and export.** Build adapters identifying motivic fundamental-line terms with Mordell–Weil regulators, torsion, local Tamagawa numbers, periods and Sha in precisely established cases. Connect the rank-zero/one BSD owner and scoped Euler-system deductions. Separate rational rank/finiteness results, p-primary valuation equalities and all-prime leading-coefficient equalities.

**Inputs.** `PeriodsAndSpecialValues:PS.4`, `RankZeroOneBSD:BSD.8`

**Acceptance.** Every prime in the integral formula is either covered by a cited proved theorem or remains an explicit unresolved gate. Sha finiteness is never inferred from its formal appearance in the formula.

**Source route.** RankZeroOneBSD normalizations and source checklist; new motives require primary Bloch–Kato statement and scoped theorem sources.

**Known/conjectural boundary.** Neither higher-rank BSD nor general Bloch–Kato follows from the rank-zero/one routes; the conjectural declarations must be separate.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### PS.7 Certified computations and research boundary

**Construct and export.** Construct exact algebraic factors and certified interval/ball enclosures for period integrals and convergent L-value expressions in implemented examples. Prove error bounds and compare exact normalization maps before numerical testing. Maintain statements for period, Beilinson and higher-rank special-value conjectures with dependency gates.

**Inputs.** `PeriodsAndSpecialValues:PS.1`, `PeriodsAndSpecialValues:PS.2`, `PeriodsAndSpecialValues:PS.5`, `PeriodsAndSpecialValues:PS.6`, `ComputationalNumberTheory:CN.4`

**Acceptance.** A numerical match is recorded as a test; only an error bound proving a stated inequality or exact symbolic derivation is exported as a theorem. Recompute the effect of changing every basis/measure convention.

**Source route.** Select original algorithms with certified error analysis for each implemented family; existing regulator worked examples.

**Known/conjectural boundary.** Numerical recognition of a rational or algebraic number is not a proof of algebraicity or an exact leading-term formula.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### PS.8 Arithmetic mirror symmetry and period differential equations

**Construct and export.** For a source-selected algebraic family, construct relative de Rham cohomology, Gauss–Manin connection and its Picard–Fuchs equation by proved reduction of differential forms. Compare analytic period solutions, integral monodromy and the normalized mirror coordinate. Build the good-prime integral/crystalline model and Frobenius compatibility; prove only the family-specific coefficient integrality, congruence or point-count comparison supported by the chosen source.

**Inputs.** `PeriodsAndSpecialValues:PS.0`, `MotivesAndAlgebraicCycles:MC.2`, `CrystallineCohomology:CR.7`

**Acceptance.** Begin with a selected K3 hypergeometric family, recording singular parameter values, solution basis, denominator primes and coordinate rescaling. For a quintic-family Frobenius example prove that the computed matrix acts on the stated cohomology/lattice. A differential equation shared by two expressions is not a period comparison without matching initial/monodromy data.

**Source route.** AE-MIRROR for K3 modular/hypergeometric and integrality routes; AE-MIRROR-FROB for a specific Frobenius calculation. Acquire original mirror-theorem proofs before any enumerative equality. Exact statement and proof-leaf extraction remain open.

**Known/conjectural boundary.** General arithmetic mirror predictions are conjectural. Mirror-map integrality, enumerative Gromov–Witten identities and Frobenius congruences are distinct theorems; one does not imply the others without a proved bridge.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

### PS.9 Multiple zeta values and mixed-Tate periods

**Construct and export.** Construct convergent multiple zeta sums with a declared ordering convention and prove their iterated-integral representation on P1 minus {0,1,infinity}. Build word algebras with shuffle and stuffle products, tangential-base-point regularization and the explicit map comparing the two regularizations. Construct the source-specific mixed-Tate category and motivic fundamental group/coaction, then the motivic period map; prove selected motivic basis/spanning and numerical spanning results through the actual map.

**Inputs.** `PeriodsAndSpecialValues:PS.2`, `Polylogarithms:P.1`, `MotivesAndAlgebraicCycles:MC.4`, `MotivesAndAlgebraicCycles:MC.6`

**Acceptance.** Prove low-weight shuffle/stuffle identities and one regularized divergent-index identity without assigning a convergent series value to zeta(1). Pin the admissibility convention before indices are reversed. A motivic linear-independence theorem is never transferred to numerical periods without injectivity.

**Source route.** AE-SHUFFLE for regularization/double shuffle; AE-MZV for the mixed-Tate construction and Hoffman spanning route. Acquire the complete proof dependencies, including the specific motivic category and comparison with the general MC realization interfaces.

**Known/conjectural boundary.** Known motivic dimension/basis results and numerical spanning upper bounds are distinct from conjectural exact numerical dimensions, completeness of all proposed relation families, and algebraic independence. Broadhurst–Kreimer/depth predictions and general period injectivity remain separately labelled conjectures.

**Execution state:** curriculum specification; theorem-level locators and proof-leaf dependency audit remain required.

## Source access and preparation

The following are primary-source routes. Access descriptions state what was actually inspected during this revision; they do not claim full proof review.

- **AE-DELIGNE:** [Deligne, Valeurs de fonctions L et périodes d’intégrales (1979)](https://publications.ias.edu/node/379). Author publication page located; original PDF and conjecture/theorem locators must be read before implementation.
- **AE-NORI:** [Huber–Müller-Stach, On the relation between Nori Motives and Kontsevich Periods, v5 (2014)](https://arxiv.org/abs/1105.0865v5). Primary abstract checked: formal period torsor, with appendices constructing Nori categories; proof interiors not read.
- **AE-DESCENT:** [Burns–Venjakob, On the leading terms of zeta isomorphisms and p-adic L-functions in non-commutative Iwasawa theory](https://arxiv.org/abs/math/0511672). Primary abstract selected for localized K1 descent; exact semisimplicity/Bockstein hypotheses pending.
- **AE-MIRROR:** [Lian–Yau, Mirror Maps, Modular Relations and Hypergeometric Series I (1995)](https://arxiv.org/abs/hep-th/9507151). Primary abstract checked: K3 modular/hypergeometric identities and selected mirror-map integrality. Exact family hypotheses/proofs pending.
- **AE-MIRROR-FROB:** [Shapiro, Frobenius map for quintic threefolds, v2 (2008)](https://arxiv.org/abs/0809.3742v2). Primary abstract checked: explicit Frobenius for the indicated one-parameter family. Integral lattice, good-prime hypotheses and proof details require inspection.
- **AE-MZV:** [Brown, Mixed Tate motives over Z (2011/2012)](https://arxiv.org/abs/1102.1312). Primary abstract checked: mixed-Tate motivic generation and numerical MZV spanning by words in 2 and 3. Does not assert numerical linear independence; full proof decomposition pending.
- **AE-SHUFFLE:** [Ihara–Kaneko–Zagier, Derivation and double shuffle relations for multiple zeta values](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1112/S0010437X0500182X/fulltext.pdf). Primary author PDF route located; exact regularization identities and proof locators pending.

For every further source requested within a stage, acquire the full accessible version, record its hash/edition, identify the exact theorem and all hypotheses, and split its proof into independently reviewable constructions and lemmas. Do not turn a title or abstract into a verified source unit. Record unresolved locators as preparation work. Check pinned library APIs through LI.0 before choosing Lean names.

## Completion contract

Complete the mathematical constructions, their functorial/API lemmas and all stated comparison maps before marking a stage implemented. Proof consumers must instantiate the actual exported maps and hypotheses. Comments and abstract structures are design artifacts. No new axiom or `sorry` is introduced by this roadmap; currently open mathematical conjectures are explicit conditional targets.
