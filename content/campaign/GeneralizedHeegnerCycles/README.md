# Generalized Heegner cycles and their Iwasawa variation

Construct higher-weight Heegner cycles, their étale and p-adic Abel–Jacobi classes, norm relations, explicit reciprocity, Kolyvagin systems and ordinary-family specialization. These are genuine higher-dimensional cycles, not Heegner points with a renamed coefficient module. Weight two must compare with the existing point system by a proved map.

## Owners and source-specific generality

[HeegnerPointEulerSystems](../HeegnerPointEulerSystems/README.md) HE.0–2 supplies ring-class fields, CM points, reciprocity and isogenies. [MotivicEtaleKTheory](../MotivicEtaleKTheory/README.md) M.4 supplies cycle complexes and functoriality; [ModularCurvesPartII](../ModularCurvesPartII/README.md), [AbelianSchemesAndArithmeticModuli](../AbelianSchemesAndArithmeticModuli/README.md) and the scheme cohomology owners supply universal families, compactification, cycle classes and spectral sequences. [EulerSystemsAndKolyvaginSystems](../EulerSystemsAndKolyvaginSystems/README.md) owns generic derivatives/descent; [PhiGammaModulesAndIwasawaCohomology](../PhiGammaModulesAndIwasawaCohomology/README.md), [PadicHodgeRegulators](../PadicHodgeRegulators/README.md), [SelmerIwasawaCohomology](../SelmerIwasawaCohomology/README.md) and [PadicFamilies](../PadicFamilies/README.md) supply local cochains, regulators, Selmer cones and ordinary families. Here own cycle geometry and all source-specific checks.

Use distinct hypothesis structures for Castella–Hsieh (CH), Longo–Vigni (LV) and Castella's family comparison (Cas), with implication lemmas only where proved. CH's running Hypothesis (H) has a weight-2r newform of level N, odd-discriminant imaginary quadratic K with −D_K<−3, p∤2(2r−1)!Nφ(N), all primes of N split in K, p split in K, and anticyclotomic χ of conductor prime to N. Do not replace these conditions by merely p∤N. CH's rank-zero and reciprocity statements require f ordinary; its rank-one implication from a nonzero generalized class has a separate nonordinary range and is not a Gross–Zagier nonvanishing theorem.

## GH.0 — Kuga–Sato geometry and coefficient projectors

Construct the relevant desingularized fiber powers of the universal elliptic curve and their products with powers of a CM elliptic curve. Define all symmetric/alternating, Hecke and CM-character correspondences and prove idempotence and compatibility with cohomological realization. Track factorials, CM units, level and discriminant denominators before asserting an integral projector. Identify the modular coefficient representation with the correct cohomological summand and self-dual Tate twist. Import resolution/smooth-proper comparison only in the verified characteristic-zero setting; an abstract motive labelled f is not a cycle carrier.

## GH.1 — Algebraic cycles and Abel–Jacobi realizations

Form generalized Heegner cycles from graphs of the actual CM isogenies and project by GH.0's correspondences. Prove codimension, rationality over the precise ring-class field and homological triviality. Construct the étale Abel–Jacobi map from the cycle class and the Hochschild–Serre filtration, including independence of choices and the comparison with the chosen lattice in V_f(r)⊗χ. Construct the de Rham/syntomic realization in the good-reduction range and prove compatibility with the étale class. A class in rational cohomology is not automatically integral; bound every denominator and prove descent.

## GH.2 — Ring-class trace, congruence and local conditions

Prove tame and p-power trace relations through correspondences, the geometric Frobenius congruences, conjugation and character-twist identities, including conductor/CM-unit initial exceptions. Verify unramified and finite local conditions using actual reduction and p-adic comparison maps. For CH's §7 argument apply the erratum: the unramified-coefficient hypothesis is required in Lemma 7.5; the original proof is not silently extended to ramified coefficients. Prove Proposition 7.8's local condition by the corrected Perrin–Riou route of Kobayashi–Ota, Lemma 4.10, or retain the unramified range until that proof is formalized. Lemma 7.10 concerns p-ramified **abelian** extensions. Test these restrictions explicitly.

## GH.3 — Ordinary stabilization and universal norms

For ordinary f choose the unit root with its actual Hecke polynomial and construct stabilized classes over the anticyclotomic tower. Prove the initial Euler factor, coefficient completion, corestriction compatibility and universal-norm lifting; retain finite ring-class torsion and p∤h_K whenever needed to average. Construct the class in the actual derived-Iwasawa-cohomology carrier and compare its finite-level specializations with GH.1. LV's Lemma 4.2 and Proposition 4.5 are explicit universal-norm construction targets; formal inverse limits without existence or integral compatibility do not discharge them.

## GH.4 — Explicit reciprocity and p-adic Abel–Jacobi formulas

Prove CH's generalized p-adic Gross–Zagier/Abel–Jacobi formula (Theorem 4.9), then its big-logarithm reciprocity (Theorem 5.7) by interpolation on the justified character set. Import the vector-valued local regulator, and explicitly construct the differential/period functional producing the scalar. Track the self-dual twist, CM conductor factor, factorial, Gauss sum, unit root and the element σ_{−1,p}; the acquired revised version includes that group-like factor and fixes the t-power convention in the theorem. Distinguish the square-root BDP distribution from its square interpolating complex central L-values. Prove the precise identity in the source's coefficient extension, not up to an unspecified unit.

## GH.5 — Higher-weight Kolyvagin system and arithmetic hypotheses

Apply ES.2–5 to GH.2–3 after proving the finite–singular compatibility, residual self-duality, auxiliary-prime existence and local cartesian properties. For LV preserve Definition 2.1: exclude its explicit finite exceptional set Ξ (including 6N(k−2)!φ(N)c_f and the stated big-image condition), p∤h_K, p unramified in the coefficient field, p split in K, and a_p a unit; exclude K=Q(i),Q(√−3) in that presentation. Verify (H.1)–(H.5) and Assumption 3.2, including the ordinary crystalline filtration, annihilator pairing and finiteness of both listed local invariant groups. Derive Theorem 3.5's rank-one module, paired torsion pseudo-isomorphism and oriented characteristic-ideal divisibility. Neither a generic abstract Euler system nor irreducibility alone supplies these checks.

## GH.6 — Nonvanishing and source-qualified Selmer consequences

Use [AutomorphicPadicLFunctions](../AutomorphicPadicLFunctions/README.md) L3h's Hsieh theorem with its local-root-number, conductor and residual hypotheses to prove the nonvanishing used in CH Theorems 3.7/6.1. Combine it with GH.4 and GH.5 to prove LV Theorem 4.12's rank-one universal-norm module and CH's actual rank-zero, nonzero-class rank-one and parity statements. Incorporate the corrected dimension formula of CH Theorem 6.3: ((1−ε(V_f,χ))/2)[K_{p^n}:K]+e, not the uncorrected expression. Do not infer nonzero higher cycles from a simple complex L-zero without the additional height/nondegeneracy theorem identified in CH's remarks; that generalized Bloch–Kato implication remains distinct.

## GH.7 — Hida-family classes and specialization

Construct Howard/Castella big Heegner classes using the ordinary projector, integral Hida coefficient ring and tower correspondences. Prove the actual weight moments and comparison of the specialized family class with GH.3's cycle class. Prove Castella's two-variable explicit reciprocity and the resulting comparison in the exact source hypotheses, including residual/lattice and character conditions. Build the unramified Yager-module exponential comparison and its ideal J=(Ψ(Frob_p)−1,γ₀−1) and pseudo-null correction where the source requires them; a one-variable Perrin–Riou map alone does not supply this. Cas Theorems 2.11, 3.4/3.7, 4.3, 5.3 and 6.5 are separate geometry/local/family comparison checkpoints, not one black-box 'big class' theorem.

## GH.8 — Weight-two and main-conjecture consumer comparisons

Prove specialization at weight two agrees with HE.3/HE.8 after the exact modular parametrization, differential, twist and period comparisons. Export GH.4/7's source-qualified reciprocity to AutomorphicCongruences L2 and BSD.6a; these consumers still own congruence divisibilities and their arithmetic specialization. Do not generalize from a source-qualified ordinary family to all supersingular cycles: signed local conditions and the exact nonordinary Wan branch require their independent suppliers. Keep characteristic ideals, determinant lines and primitive/imprimitive versions identified by maps, not by matching ranks or names.

## Acceptance and source versions

Test a weight-two cycle/point comparison, a nontrivial CM-character projection, a conductor recurrence and an auxiliary-prime finite–singular square. Include counter-tests at a factorial-denominator prime, p|h_K, ramified coefficient field in the uncorrected CH lemma, and a nonordinary specialization of an ordinary theorem. Prove all required maps and correction factors before exporting a main-conjecture input.

The acquired CH author file is **dated 2 July 2022**, despite the 2018 publication label; use its separately acquired erratum and compare against the published numbering before transcription. LV is the arXiv version underlying its Kyoto 2019 paper; Cas is the author/arXiv version underlying JIMJ 2020. Exact access, hashes and theorem checks are in the round-two register. Kobayashi–Ota is an additional proof source required by the erratum, not optional bibliographic background.

Suggested.lean contains non-exhaustive elementary projector/transfer algebra on existing Mathlib types. No generalized cycle, comparison theorem or main conjecture is claimed formalized by this prototype; unavailable signatures are specified precisely above, without stand-in axioms.

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `GH.0` | Construct each Kuga–Sato/CM projector and calculate its factorial/level denominators; identify the realized higher-weight summand independently of a weight-two Jacobian quotient. |
| `GH.2` | Apply the CH erratum local-condition proof, with the ramified-coefficient extension supplied through Kobayashi–Ota rather than the invalid original lemma. |
| `GH.7` | Compare the Hida-family class to cycle classes through actual moments, the Yager exponential and its ideal J; retain the pseudo-null correction at specialization. |

**Producer–consumer handoff.** AutomorphicCongruences L2 and BSD.6a consume source-qualified GH.4/7 reciprocity. Weight two compares with HeegnerPointEulerSystems through GH.8.

**Acceptance.** Test a factorial-denominator prime, p dividing h_K, a nonordinary specialization and a nontrivial CM-character projection.

**Source-readiness boundary.** CH revised file/erratum, LV and Castella family proof chains remain exact source tasks; nonzero cycles from simple complex zeros require a separate theorem.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
