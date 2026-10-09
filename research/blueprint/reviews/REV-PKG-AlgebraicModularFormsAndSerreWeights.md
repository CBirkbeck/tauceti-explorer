# Independent package review: Algebraic modular forms, reduction and Serre weights

Verdict: **accepted after corrections**.

Reviewer: Codex, session `codex-bZkdgh`, independent of the package's authorship.
Date: 2026-10-09. Issue: #7504.

The package satisfies all six review requirements. Its README gives the accepted mathematical plan in upstream roadmap form, preserves its supplier boundaries and hypotheses, and uses original prose with precise source locators. The suggested file elaborates after the corrections below. Acceptance concerns a roadmap and suggested signatures, not completed proofs or implementation.

## Scope and completeness

I compared the entire package README and suggested file with the accepted `research/blueprint/packets/AlgebraicModularFormsAndSerreWeights.json`, including its prerequisites, library inputs, API items, tests and outstanding supplier contracts. The inventory contains 66 targets, 72 API items, 64 tests and 22 planets. All targets have corresponding README anchors, every API and test name occurs in the README, and the suggested file retains their names, sometimes as the identifying comment on an `example`. All internal README fragment links resolve.

| Layer | Targets | Mathematical checks |
| --- | ---: | --- |
| R15.1 | 6 | Actual moduli geometry, all integer Hodge powers, full cusp ideal, coefficient maps, analytic comparison, and logarithmic Kodaira–Spencer normalization. |
| R15.2 | 14 | q-expansion and coefficient descent, conditional base change, small-level descent, weight-one reduction, bounded denominators, coherent Hecke and Fricke actions, and the full boundary. |
| R15.3 | 13 | Elliptic Hasse section, theta, coefficient-linear U and V, supersingular sections and periodicity, all small-prime and large-prime theta tables, weight reduction, ordinary congruences, weight-one doubling and duality. |
| R15.4 | 13 | Ordered tame and wild data, extension-sensitive weight recipe, determinant congruence, finite-flat and Fontaine–Laffaille comparisons, dyadic and semistable cases, normalized bad-dihedral bounds, and Edixhoven's distinct invariant. |
| R15.5 | 14 | Operator algebra, residual character, going down, dominating DVR, support and socle arguments, common eigenvector, denominator clearing, eigenvalue lifting and the modular-form application. |
| R15.6 | 6 | S-type representations, a form and chosen coefficient place, stable-lattice reduction, semisimple comparison, modularity predicates, and the classical weight/level/character target. |

In particular, the README does not silently turn an arbitrary coefficient map into a base-change isomorphism. Its q-expansion principle chooses a cusp on every relevant component. Low-level statements retain their invertibility conditions, and the level-one descent description uses both rigidifying levels rather than treating one invariant space as the answer. Weight-one geometric forms are distinguished from the reduction of a characteristic-zero lattice.

The supersingular space is not identified with cusp forms; its negative weights and the non-isomorphic map into a dual space are retained. The theta tables distinguish ordinary from nonordinary forms and keep the requirement that theta be nonzero. V over a larger residue field is coefficient-linear rather than the absolute pth-power operation. At p=2 the classical wild weight can be four even though Edixhoven's corresponding weight is three. The unramified weight-one phenomenon is likewise not confused with the classical Serre recipe.

The lifting statement uses an arbitrary commuting family on a finite free module over an arbitrary DVR. It permits inseparable finite fraction-field extensions and does not require the dominating valuation ring to be module-finite. It lifts a system of eigenvalues, not a prescribed residual eigenvector. Its application retains the actual cusp lattice, the full chosen operator family and the separate justification for a Hasse-power weight shift. The final residual witness retains the form, coefficient place, stable lattice and semisimple comparison, rather than inferring full modularity from a list of good-prime eigenvalues alone.

## Boundaries and upstream form

I checked the upstream guide and the available upstream ClassFieldTheory and ModularForms reader material, including the analytic supplier layers used here. The package starts as Part II of the analytic ModularForms roadmap. It introduces its purpose, conventions and dependency spine before developing six layers with definitions, theorem statements, APIs, examples, prerequisites and sources. Its final README is 140,477 bytes, below the 200 KB limit. It is organized by mathematical constructions and dependency order, not by a source's section order.

The reviewed library audit and roadmap/link data agree with the supplier contracts. ModularCurvesPartII owns the modular-curve geometry; this package specializes that geometry to forms and their operations. FiniteFlatGroupsAndIntegralPadicHodgeTheory owns general finite-flat, Raynaud and Fontaine–Laffaille theory. ArithmeticGaloisRepresentations owns conductors, tame characters and representation recognition. AutomorphicGaloisRepresentations owns attachment, SerreWeightAndLevelOptimisation owns weight and level minimization, and ClassicalSerreModularity owns the universal modularity theorem. The abstract R15.5 lifting input for representation attachment precedes R15.6's use of attached representations, so the final witness predicate does not create an attachment cycle.

The README has no programme-process narrative, job identifiers, review or checkpoint discussion, or claims of implementation. `metadata.toml` remains exactly the single line `topic = "math.NT"`, which fits this roadmap.

## Sources and precise hypotheses

I read the relevant portions of the thirteen public primary sources below. Their downloaded files matched the SHA-256 values in the accepted plan. The source material was used for checking mathematical statements, with no source passage added to the repository. The following locators describe the review's focus, not a claim to have read every page of each work.

| Source | Checked locators and use |
| --- | --- |
| [Deligne–Serre, 1974](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) | §2.7, pp.511–512, for the weight-one lattice; §§6.7–6.13, pp.521–523, for weight shift, eigenvalue lifting, attachment and residual coefficient descent. |
| [Serre, 1987](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf) | §§1–2, pp.180–192, for tame and wild normalization and local comparisons; §§3.1–3.2, pp.192–198, for mod-p cusp forms and the classical target. |
| [Edixhoven, author DVI](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi) | §§2–4, author pp.3–11, and §§7–8, pp.23–28: filtration, theta tables, supersingular arguments, the finite-flat comparison and exceptional small-prime values. |
| [Raynaud, 1974](https://www.numdam.org/article/BSMF_1974__102__241_0.pdf) | §§3.3–3.4, pp.267–271, especially Theorem 3.4.3 and Corollary 3.4.4: ramification inequalities, the boundary case, and the distinction between strict-henselian classification and descent. |
| [Katz, 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf) | §§1.5–1.12, pp.82–95, for section spaces, q-expansion, base change, levels and Hecke conventions; §§2.0–2.1, pp.97–99, for Hasse and lifting; §4.4, pp.151–152, for ordinary congruences; Appendix A1.3.17–18, p.169, for Kodaira–Spencer. |
| [Katz, 1977](https://web.math.princeton.edu/~nmk/old/modformcharp.pdf) | Part II, pp.55–56, and the associated argument: theta's weight change and pth-power kernel, including small characteristic. |
| [Darmon–Diamond–Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) | §4.1, Lemma 4.1, p.107: integral Hecke generation and the odd-level or invertible-two condition. |
| [Calegari–Geraghty, 2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf) | §§3.2.1–3.2.3, pp.313–318, for coherent operations; duality after Lemma 3.7, pp.322–323; proof of Theorem 3.11, pp.327–328, for torsion weight-one doubling. |
| [Calegari–Geraghty, 2020](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf) | The GL₂ model in the proof of Lemma 8.14, author local pp.65–67, for U, V and weight-one ordinary operations. No higher-rank theorem is imported here. |
| [Calegari–Dimitrov–Tang, 2025](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf) | Lemma 4.2.2, p.655: the bounded-denominator application and its q=e^{πiτ} normalization. Its invoked bounded-denominator input is not treated as a newly proved theorem here. |
| [Pan, arXiv:2209.06366v1](https://arxiv.org/pdf/2209.06366v1) | §4.1.2, p.34: the logarithmic Kodaira–Spencer input; this is a subsection, not a numbered proposition. |
| [Dieulefait–Pacetti, arXiv:2108.07577v2](https://arxiv.org/pdf/2108.07577v2) | Definition 1.12 and Lemma 1.14, pp.8–9: the odd-prime, normalized bad-dihedral alternatives and their niveau distinction. |
| [Khare–Wintenberger I, author preprint](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | §1, pp.2–3, for S-type and modularity conventions; Lemma 6.2(ii), p.11, for the normalized bad-dihedral weight bound. |

The package retains the prior mathematical safeguards: Raynaud's correct theorem locator and boundary hypotheses; the general coefficient-field action beyond a type-(p,p) special case; the full two-character boundary calculation beyond a single cusp orbit; and the dyadic correction to the semistable weight statement. I found no clear additional mathematical correction to the accepted README targets.

## Corrections made in this review

1. In the bibliography, changed Pan's locator from Proposition 4.1.2 to §4.1.2, retaining the exact version and page.
2. Replaced the purported E₄ coefficient example's `240*n` series by the actual `240*σ₃(n)` series, adding the necessary Mathlib divisor import. The example checks coefficients 0, 1 and 2, including 2160 at index 2, so the incorrect series cannot satisfy the stated example.
3. Added the concrete Delta theta coefficient example modulo five promised in the README: from its supplied coefficient −24 at index 2, theta has coefficient 2. The geometric identification remains explicitly supplied.
4. Repaired the arithmetic `thetaCycles` signature. It no longer asserts that every arbitrary input list equals a table row. It asserts existence of a row of length p−1 and explicitly excludes the nonordinary k=p+1 case, as required by Edixhoven's large-prime table. Its comment preserves the separate missing geometric classification conditions.
5. Added `[Fact p.Prime]` to `determinantWeightCongruence`, matching the residual-prime convention. Without it, p=0, a=1, b=0 gives a false assertion because modulus zero means equality.

## Pinned libraries, suggested-file limits and validation

I read the eight baseline declaration statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: `Algebra.adjoin_le`, `Algebra.HasGoingDown.of_flat`, `Ideal.exists_ideal_le_liesOver_of_le`, `TauCeti.integralClosure.isDedekindDomain`, the two cited Artinian-ring lemmas, `Module.mem_support_iff_of_finite`, and `TensorProduct.AlgebraTensorModule.map_tmul`. Their hypotheses and roles agree with the README. In particular the integral-closure theorem permits inseparability and does not supply module finiteness.

The suggested file's header and local comments distinguish representable algebraic statements from missing geometric or Galois conditions. Protocol §13 explicitly permits leaving an unstateable condition out, provided it is not replaced by a fabricated proposition field. Several signatures remain such partial suggestions: for example the form-space comparison hypotheses, actual geometric Hecke operators, continuity in the S-type predicate, and identification of witness data with genuine attached representations. The definitive README retains those conditions. Acceptance does not promote these partial suggestions into unconditional mathematical results.

The accepted plan still records 13 gaps and 29 supplier requests. This package review preserves those obligations; it does not close them, prove any of the six layers or change implementation status. The general lifting algebra is specified more completely than interfaces that await their geometric suppliers.

Validation on the final suggested file:

- `lean-check research/blueprint/packages/AlgebraicModularFormsAndSerreWeights/Suggested.lean`: exit 0, no errors, 161 warnings, all for declarations using `sorry`.
- The shared build's Mathlib commit is exactly the pinned commit. The suggested file imports only Mathlib modules; its Tau Ceti integral-closure input is a source-level prerequisite, not an elaboration import. That statement was checked at the required Tau Ceti commit separately.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicModularFormsAndSerreWeights.json`: no errors or warnings; six planned stages and zero stages claimed closed.
- Target/API/test inventory, internal links, README size, single-line TOML metadata and absence of process prose checked.
- `git diff --check`: passed.

No further package revision is required by this review.
