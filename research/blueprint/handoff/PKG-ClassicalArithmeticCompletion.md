# PKG-ClassicalArithmeticCompletion

Completed package for issue #9795 by Codex (GPT-6), session `codex-IccSd7`, on 2026-10-14. The package is ready for its independent package review. No packet, assembled reader, atlas data or upstream checkout was changed.

## Deliverables and coverage

- [README](../packages/ClassicalArithmeticCompletion/README.md): the mathematical roadmap, including ownership boundaries, conventions, exact supplier contracts, eight ordered layers, APIs, Checks, proof routes and source locators.
- [Suggested.lean](../packages/ClassicalArithmeticCompletion/Suggested.lean): 708 lines, one Mathlib import, one namespace, real-bodied light definitions, representative milestone signatures and discriminating examples. It elaborates at the pins with only `sorry` warnings. These are proposed statements, not formalised results.
- [metadata.toml](../packages/ClassicalArithmeticCompletion/metadata.toml): `topic = "math.NT"`.

All 570 accepted input nodes are accounted for: 333 in the root packet and 42, 20, 25, 43, 8, 30 and 69 in the CA.1–CA.7 packets respectively. All 915 input API entries occur in the README. The mathematical content of the 582 named input tests and the additional acceptance examples is retained, with corrections and additional controls described below. All 135 input definitions/constructions have at least three Check bullets. Tautological instructions to check an API were replaced by concrete tests.

The final new-target counts by README layer are 1, 76, 81, 67, 120, 25, 77 and 123. Two input nodes became existing supplier contracts in the boundaries; two explicitly needed analytic interfaces became additional Layer 6 targets. Thus there are 570 numbered new-target subsections and two separate existing-input contracts. Internal-link validation found no missing anchors, duplicate anchors or numbering gaps.

Each input target can be found by its mathematical title; the following changes need special attention when comparing with the accepted packets:

| Input or interface | Final location and ownership |
| --- | --- |
| `CA.5/index-of-the-order-z-sqrt-d` | Layer 3, “The index of ℤ[√d] in the ring of integers”, before the imaginary quadratic Pólya classification that consumes it. This repairs the layer-order dependency. |
| `CA.5/kummer-dedekind-for-a-monogenic-presentation` | Boundaries, “Monogenic prime-factorisation input”, anchor `monogenic-prime-factorisation-input`. Reuses Mathlib's prime-factor equivalence and companions, with exponent one. It is no longer a new layer target. |
| `CA.7/continuation/reduced-characteristic-polynomial` | Boundaries, “Reduced-characteristic-polynomial input”, anchor `reduced-characteristic-polynomial-input`. Reuses current IntegralHeckeAndGaloisDeterminants §§0.2, 0.6. It is no longer a new layer target. |
| Recurrence closed forms | Layer 2, “Uniqueness of recurrence closed forms”; existence is the DT.2 supplier contract, uniqueness is the added target. |
| `CA.7/continuation/norm-one-group` | Layer 7, “Norm-one groups of semisimple matrix components”. Imports the division-algebra carrier from AdelicAlgebraicGroups §3.4; new work is matrix components, products, restriction of scalars and the arithmetic restricted-product comparison. |
| Semisimple reduced norm | Layer 7 imports the component Azumaya law from IHG.0 and adds product-centre, completion and idele comparisons. |
| `IsTotallyPositiveAlgebraicInteger`, `totallyPositiveTraceRatio`, `traceFiniteExceptionThreshold`, `auxiliaryResultantTraceBound` | Layer 6.76, “Totally positive trace ratios and auxiliary resultants”. Supplies the trace interfaces actually used by Smith's argument. |
| `asymptoticDobrowolskiBound`, `degreeDroppingPrimes` | Layer 6.77, “Asymptotic Dobrowolski bounds and exceptional powering primes”. Supplies the stronger bound and powering-prime estimate used in the random-polynomial argument. |
| Smith 2024 routing item 17 | Already represented by `CA.3/squarefree-integral-combination`; Lemma 2.10 gives the cited squarefree combination. No extra node was added. |

Layer 5 topics after the former monogenic-input topic, and Layer 7 topics after the former characteristic-polynomial topic, were renumbered consecutively. Internal references point to the new anchors.

## Libraries, closure and duplication

Read the reviewed CA.0–CA.7 entries of `data/library-coverage.json`. Read the statements of all 900 distinct baseline declarations actually used by the input prerequisites at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The larger baseline inventory contains 62 declarations not used by those prerequisites; this does not claim a read of those unused entries.

Screened the targets against the supplied current TauCetiRoadmap tree, including its nine newer roadmaps and `Completed`, and against the current Tau Ceti library. Current revisions were TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read the relevant statements after mathematical-object searches, including the Smith form, local-symbol, Grothendieck-group, determinant and norm-one interfaces. Both current trees were read only; no Lake command was run there.

Existing square nonsingular Smith existence and uniqueness are boundary inputs from `TauCeti.LinearAlgebra.Matrix.SmithNormalForm`. Rectangular/singular certificates, inverse transformations, cokernel comparisons and the terminating algorithms remain distinct targets. The existing congruence/lcm identity supplies uniqueness around a chosen compatible CRT solution; the new CRT target is existence under the gcd compatibility condition. Existing Pell and square-representation existence results are used, while the new interfaces count representations or certify finite search and unit orbits.

Use existing `SplitK0`, `ExactK0`, `ExactK0.fromSplitEquiv` and `finiteProjectiveModulesExactStructure_eq_split`; no second Grothendieck-group carrier is proposed. Layer 7 adds stable-free equality and balanced scalar change. Existing ordinary Brauer induction is an input and does not discharge the field-of-definition induction obligation.

AdelicAlgebraicGroups §4.6 already supplies quaternion norm images over ℚ. The remaining target concerns arbitrary central-simple number-field components. IntegralLattices owns its quadratic-lattice and discriminant-form carriers; the matrix and ideal certificates here do not redefine them. The full supplier contracts distinguish lower-tier inputs from downstream consumers. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` token remains. The 1,104 input internal prerequisite edges were acyclic after the quadratic-index ordering adjustment; the README retains their mathematical references.

## Mandatory adversarial mathematics pass

Read every input target statement and hypothesis, then every definition/construction API and test. Checked the proposed Lean signatures against the corresponding README scope. The following table records the principal instances and corrections; it supplements the concrete Checks in each target.

| Statements checked | Instances tried | Result or correction |
| --- | --- | --- |
| Layer 0 compatible CRT | Moduli 0, negative moduli, equal moduli; residues 1 mod 4 and 3 mod 6; incompatible parity | Congruence mod 0 remains equality; existence uses gcd compatibility and existing lcm uniqueness is imported. |
| Layer 1 power maps and residue symbols | Exponent 0; trivial cyclic group; finite field 𝔽₂; unit denominators and zero denominators; `(7,2)` and `(2,7)` at ℚ₇ with n=3 | Nonzero-element root count handles n=0. Added nonzero ideal/element hypotheses to denominator and norm-compatibility interfaces. Fixed Artin orientation by values 4 and 2. Coefficient-domain Gauss sums remain R-valued when stated over R. |
| Layer 1 higher reciprocity | Gaussian units, primary associates and quartic quotient; dyadic and real signs; n=1 | Retained supplementary factors and the real sign −1 exactly for two negative arguments. The `(1+i)` supplement remains an explicit source obligation, not inferred from main reciprocity. |
| Layer 2 rational series and closed forms | Zero/order-zero recurrence; repeated roots; zero characteristic root; polynomial numerators; exponential series | Denominator constant is nonzero; no proper-fraction condition is added. DT.2 supplies existence; the target adds uniqueness. Lucas repeated-root values pin recurrence signs. |
| Layer 2 automata and Eulerian symmetry | Empty word and value at zero; noncommuting transitions; radix 1 versus radix ≥2; binary parity; identity permutation on Fin 3 | Head-first fold and least-significant-first digits are explicit. Added finite-state direction controls. Replaced the incorrect one-based complement on Fin n by `Fin.rev ∘ σ`, giving n−1−σ(i); identity on Fin 3 reverses from zero to two descents. |
| Layer 2 elliptic divisibility | Primes dividing W₂W₃; singular attached curve; b=1,c=3,d=1 at p=3 | The bad-prime and singular strong-divisibility branch remains explicit; it is not justified by an inappropriate nonsingular formal-group argument. |
| Layer 3 normal forms | Zero-size, rank-zero, rectangular and singular matrices; diag(2,3); negative pivots | Positive factors and inverse transforms are stored. Pivot measure decreases only after failed divisibility; already-divisible clearing is a finite sweep. diag(2,3) has factors 1,6. |
| Layer 3 integer-valued polynomials and Perron | X(X−1)/2 versus X/2; equality polynomials; ±1 roots; `(X−i)²` | Distinguishes integer values from integer coefficients. Perron retains the nonzero constant and both endpoint exclusions; the boundary argument requires real coefficients. |
| Layer 4 Gaussian counts | Norms 0,1,5,13,25,65 | Added finite fibres, unit quotient and product equivalence. Unit action is free only at positive norm; coprimality is necessary for multiplicativity (25 has three classes, not four). |
| Layer 4 generalised Pell search | d=2,n=−1; d=194,n=−1; n=0; square d | Added an integer search bound, filtered finite square, orbit completeness and a terminating unit search. At d=2,n=−1,u=3+2√2, B=20 retains (1,1). Zero and square-radicand cases are separate. |
| Layer 4 Ramanujan–Nagell and rational elliptic points | θ²=θ−2; norms 2 and 4; units ±1; divisor 0; affine (0,0), point at infinity and denominator 0 | Specified `QuadraticAlgebra ℤ (-2) 1`, norm x²+xy+2y² and Euclidean remainder bound. Added primitive weighted coordinates, square-factor separation and the nonzero-denominator map to Fermat's fourth-power equation. |
| Layer 4 Markoff conventions | Characteristic 3; `(1,1,1)` and `(1,1,2)`; even-dimensional Hurwitz tuple | Coefficient-three fibre has nine points over 𝔽₃; coefficient-one zero fibre has one. Point-count scaling requires p≠3. Integral scaling uses a separate divisibility theorem. Lean examples pin both cardinalities and Vieta directions. |
| Layer 5 number-field outputs | Monogenic ramified primes; squarefree d≡1 mod 8 and d≡5 mod 8; norm −1 units; strict interval margin | Existing Dedekind–Kummer covers all primes when the exponent is one. Full integer-ring units are distinguished from ℤ[√d]. Interval certificate retains both errors and strict factor-two margin. |
| Layer 6 conjugates and analytic bounds | Pisot 2,1,3/2; golden ratio versus Salem quartic; exponent 0; finite compact sets; one/two-point Fekete products; hedgehog midpoint and endpoint | Integrality, strict lower endpoint and positive-power hypotheses are retained. Fekete indices below 2 are zero; the two-point unit-disc value is 2 and transfinite value is 1. The exact Smyth short-gap argument remains an obligation. |
| Layer 6 heights, trace and Dobrowolski | `[1:0]`, `[0:1]`, `[2:1]=[4:2]`, `[i:1]`, invalid `[0:0]`; X²−3X+1; degrees 0 and 1; zero and cyclotomic roots | Added both projective charts and representative independence. Trace threshold is a supremum of finite-exception lower bounds, not the source introduction's erroneous “least” formulation. Asymptotic L(m) uses factor 2, not the printed 1/2; logarithms and nonzero constant are guarded. Exceptional powering count requires α≠0. |
| Layer 6 dyadic prime estimate | x=41/2; application parameters y=13 and y=10 | Exactly five primes lie in (20.5,41]: 23,29,31,37,41. Retained the exact bound 3x/(5 log x) and threshold, with positive denominator; an asymptotic substitute is insufficient. |
| Layer 7 orders, norms and stable classes | Field versus DVR; characteristic p with G=C_p; trivial group; zero module; scalar matrices and quaternion 1+i; rank mismatch | Group-ring nonmaximality requires |G| invertible in F and not a unit in R; over R=F=𝔽_p, F[C_p] is the maximal order in itself. Rank-one representation is restricted to arithmetic orders, not arbitrary Dedekind bases. Reduced norm uses component degree; ordinary real determinant of 1+i is the square of its reduced norm. Stable equality adds the same free summand. |
| Layer 7 local constants and determinant descent | Zero virtual character; unramified degree-one character; p=2 signs; finite versus infinite root-sign representatives; ℓ=p versus ℓ≠p | Ordinary and adjusted Gauss sums differ (trivial local adjusted value −1). Positivity at infinity is kept separate from finite signs. Preserved all coefficient-ring, Frobenius-lift, field-of-definition, crossed-product and torsion inputs listed below. |

## Source audit and limits

The README is organised by mathematical dependency, in our own words, rather than as a source's section-by-section summary. No source passages, book files or source-text scratch files are included in the deliverables. Read the library index before using the cleared Platonov–Rapinchuk–Rapinchuk volume; used only its cleared chapters for reduced norm and SL_m(D), without copying the book or passages into the repository.

Opened and checked this reproducible 15-locator sample (seed 9795), in addition to the targeted source checks:

| Source | Locator checked and scope |
| --- | --- |
| Johnston, Notes on Galois Modules | Remark 3.14(ii), printed p.6: integral normal generator implies rational normal generator. |
| Ghosh–Sarnak, arXiv v3 | Theorem 1.1(c), p.4: class-number upper bound. This confirms the result's locator, not a complete proof of every unit estimate. |
| Gamburd–Magee–Ronan, arXiv v3 | §2.1, pp.12–13: signed-to-positive passage and bounded exceptional orbits. |
| Bertrandias 1964 | §3.1, printed p.12 (PDF p.13): rationality theorem, finite nonintegral-prime allowances and continuation hypotheses. The integer variant here has its separate Hankel proof route. |
| Conrad, Jacobi sums and Stickelberger's congruence | Theorem 1 p.2, Theorem 2 and C1–C2 pp.3–4, proof p.5; inspected scan images for the coefficient normalization. |
| Smyth survey 2008 | §5.1, (15), printed pp.328–329: nonreciprocal bound and outline; does not discharge the short-gap multiplier obligation. |
| Milne, Algebraic Number Theory | Proposition 7.26 and following paragraph, printed pp.116–117: complete-DVR expansion and p-adic digits. |
| Smyth survey 2008 | §5.1, printed p.327: reciprocal polynomial conventions, including the sign. |
| Chen, arXiv v2 | Theorem 1.2.1, p.6: positive coefficient-one zero-level orbit. |
| Leriche 2011 | Proposition 2.4, pp.240–241: quadratic Pólya-group cardinality. |
| Fröhlich 1975 | §2 p.114 and §4 p.118: component reduced norms and idele extension; read page images. |
| Conrad, Hasse–Davenport relation | Appendix (A.6), p.19: fixed-character product convention; book proof still unverified. |
| Lawrence–Sawin 2025 | Appendix C, proof of Lemma C.4, p.117: Eulerian unimodality used in the proof. |
| Cahen–Chabert 2016 | §1, (1)–(3), printed pp.311–312: integer-valued binomial basis and forward differences. |
| PlanetMath, decimal expansion | §2.2: canonical expansion and exclusion of eventually maximal digits. |

Additional primary checks included Smith 2024's introduction and Lemma 2.10, Bary-Soroker–Koukoulopoulos–Kozma §7 p.37, Banwait's Ramanujan–Nagell ring §§2.1–2.3, Katre's Stickelberger formulas, CPT 2009 Theorems 5.4, 6.2, 6.6 and Lemma 6.8/Propositions 6.9–6.10, and printed Fröhlich 1976/Taylor 1981 pages. In the GDZ scans, use printed pagination rather than the viewer's page labels. Corrected three inherited locators: Fröhlich's virtual local laws are §2 (2.11)–(2.16), pp.392–393, while Theorem 3 p.392 is global covariance; Taylor Proposition 3.10(v) is p.48, not p.47; Taylor's Ia reference to FT1980 §5.1 is in §9 p.66, not §10.

The package retains explicit source/proof obligations. An independent reviewer should start with these marked subsections:

- Layer 1.65: the `(1+i)` quartic supplement, including exponent integrality and multiplicativity.
- Layers 3.15 and 3.35: Mignotte 1988 Theorem 1′, DOI `10.1016/0022-314X(88)90014-5`; the exact √m-scale irreducible-factor estimate cannot be replaced by the weaker Mahler coefficient bound.
- Layer 2's Ward endpoint: singular curves and primes dividing W₂W₃.
- Layer 6.34: exact Rosser–Schoenfeld dyadic estimate and numerical threshold, cited through Berrevoets Lemma 4.5 p.16.
- Layers 6.62, 6.67, 6.70 and 6.73: Smyth 1971's short-gap multiplier/Parseval calculation, with its full parameters; a reduced Schur compression does not imply the desired quartic bound.
- Layer 6.77: the stronger asymptotic Dobrowolski form needed for the random-polynomial application. The earlier explicit 1/11700 form does not supply it.
- Layer 7.13: relation-independent virtual local constants, degree corrections, duality, additive-character change and Galois covariance.
- Layers 7.29–7.30: Hasse–Davenport exact sign, especially at p=2, and the Artin functional-equation normalization.
- Layer 7.63: Witt–Berman field-of-definition induction with integral/prime-to-prime multiplier conditions; ordinary complex Brauer induction is insufficient.
- Layer 7.86: Wall's integral crossed-product matrix identification and its norm/restriction compatibility, imported by CPT Theorem 6.2.
- Layer 7.93: ℓ≠p determinant descent, including the unread Fröhlich Theorem 15A p.66 and Reiner Theorems 41.1/41.7 invoked by CPT Propositions 6.9–6.10. No uncleared copy of either book was used.
- Layers 7.112, 7.118 and 7.119: Fröhlich–Taylor 1980 Theorem 5(ii)–(iii), §5.1 and Taylor's four congruence families. The determinant logarithm image does not by itself supply the torsion comparison.

These are explicit roadmap proof targets and limitations inherited from, or exposed while checking, the accepted plan. They are not reported as established library facts. Their consumers retain the qualification. The independent review may strengthen their proof routes; no source obligation was hidden by a `sorry` carrier or by claiming completion of a theorem proof.

## Validation and next step

- `python3 scripts/check_blueprint.py` on each of the eight named input packets: exit 0, no errors or warnings. Packets were unchanged.
- `python3 scripts/check_sorry_data.py` on the package Suggested.lean: exit 0, no offenders.
- Final `lean-check` on Suggested.lean: exit 0; all warnings are declaration uses `sorry`. Initial elaboration errors were corrected in radix argument order and scalar multiplication for the binomial polynomial; the final file has no errors.
- Coverage, API-name, consecutive-heading and internal-anchor checks: passed as described above.
- `python3 research/blueprint/intake.py check-files` on all four deliverables: 4 files, 0 problems.
- Final staged whitespace and scope checks are recorded in the pull request.

No further implementation is required for this package job. Next is the independent package review; this worker must not take that review. The maintainer owns any subsequent TauCetiRoadmap port. All information needed after scratch cleanup is in these four deliverables.
