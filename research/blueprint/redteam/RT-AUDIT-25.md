# RT-AUDIT-25 — independent red team

Agent: Codex. Session: codex-c83e7a. Read: 24 September 2026.
Target: accepted AUDIT-25, after REV-AUDIT-25. Status: complete.

One **medium** finding corrects an overly broad library-absence note. Mathlib computes the units of the maximal order of the third cyclotomic field, which covers the discriminant −3 special case. This does not construct exceptional Heegner points or their unit-factor formulas.

## Scope and method

The audit and accepted review were read in full, together with the five roadmap documents and their stage extracts. All target records and cited statements were rechecked, including targets in layers labelled “not built.” The author and original reviewer were not this worker. This submission changes only the two red-team files, leaving audit corrections to independent verification and the resulting fix job.

| Roadmap | Layers | Targets |
| --- | ---: | ---: |
| GrossZagierAndArithmeticHeights | 10 | 65 |
| HeegnerPointEulerSystems | 12 | 57 |
| IntegralIwasawaTheory | 15 | 66 |
| KatoEulerSystems | 5 | 19 |
| LocallyAnalyticDistributions | 5 | 27 |
| Total | 47 | 234 |

The layer census is four partly built, 41 not built and two process. The target census is 192 absent, 34 partial, seven Mathlib and one both-libraries. All 157 citation occurrences resolve to 126 distinct declarations. Each statement was read with its section hypotheses; multiline `haveI` signatures and structure fields were retained rather than stopping at an internal assignment. Definitions were unfolded where the claimed carrier or normalization mattered.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 95 cited files matched the pinned Git blob hashes. Four additional files used in the challenges below were also verified, for 99 files total. The cited declarations are not axioms, and the cited files have no `sorry`/`admit` outside comments. This was a source audit, not a Lean compilation or a fresh proof verification.

All 226 absent/partial targets were considered through declaration-index searches followed by searches of the pinned source trees. Twenty-two topic groups covered the targets, with focused follow-ups for third-cyclotomic units, regularity, canonical-height uniqueness, group determinants, logarithm hypotheses and measure operations. Similar words in file paths, comments or unrelated theories were separated from mathematical matches. These negative searches say what was not found; they are not a proof that no equivalent declaration could exist.

## Finding RT-AUDIT-25/1 — discriminant −3 unit computation

**Location:** `AUDIT-25.result.json`, `HeegnerPointEulerSystems:HE.0`, target index 6, its note and declarations. **Kind:** library claim. **Severity:** medium.

The note states that no computation of unit groups of imaginary quadratic orders exists. In fact, [`IsCyclotomicExtension.Rat.Three.Units.mem`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Cyclotomic/Three.lean#L34-L78) proves

```text
u ∈ [1, -1, η, -η, η^2, -η^2]
```

for every `u : (𝓞 K)ˣ`, assuming `[NumberField K]`, `[IsCyclotomicExtension {3} ℚ K]` and a primitive third root `ζ`; `η` is the unit obtained from its integral image. The declaration is at line 51. Its local notation and proof show that this is an explicit computation in the actual ring of integers. It is stronger than merely having a type of torsion units. The same file’s [`eq_one_or_neg_one_of_unit_of_congruent`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Cyclotomic/Three.lean#L97-L103) further controls units satisfying the stated congruence. The existing general cyclotomic discriminant formula gives −3 at level 3.

The omitted special case matters because HE.0 explicitly singles out small discriminants and forbids silently dividing by the exceptional unit-group orders. It has a limited effect: these statements do not prove the Heegner formulas or handle arbitrary conductors.

**Fix:** retain the full target’s `absent` label, add `Three.Units.mem` with `fit: "special case"`, and replace the blanket note by a precise boundary. The maximal-order third-cyclotomic computation is present; general orders, the other exceptional case and the no-division CM/Heegner formulas are not established by that citation. Keep `NumberField.Units.torsion` as related evidence. No change to the layer’s overall verdict is justified.

## Results of the remaining challenges

### Gross–Zagier and heights: GZ.0–GZ.9

GZ.0–GZ.1 correctly distinguish projective Weil heights, Northcott, descent and the elliptic canonical-height/Mordell–Weil API from the missing line-bundle height machine and abelian-variety pairing. Searches for uniqueness, isogeny compatibility, Poincaré pairings and abelian heights did not establish the full absent targets. Generic line-bundle objects do not carry an arithmetic height.

The existing normalization warning survives. [`canonicalHeight`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean#L124) divides the doubling limit by `2`; [`neronTatePairing_self`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean#L390) identifies the diagonal with that height. Silverman’s [AEC VIII.9, pp.248–253](https://www.pdmi.ras.ru/~lowdimma/BSD/Silverman-Arithmetic_of_EC.pdf) defines the height with the degree denominator and the pairing by the unhalved polarization. [Cremona §3.4, pp.71–72](https://johncremona.github.io/book/fulltext/chapter3.pdf) uses the full x-height limit with halved polarization. Thus both displayed source pairings are twice Tau Ceti’s over ℚ; determinant scaling gives the audit’s `2^(-r)` comparison. Source conventions are read from these definitions, not inferred from a name such as “canonical height.”

For GZ.2, regular local rings and generic models/base-change maps do not supply a regular arithmetic model, resolution, local intersections, Green functions or metrized-graph heights. The numerical fibre-type structure has its fibre relation as data; its matrix theorem is not an arithmetic intersection construction. GZ.3–GZ.5 have related Petersson, quaternion and Haar-measure material but no automorphic toric-period, Tunnell–Saito, theta-kernel or Waldspurger package. Toric-variety hits and Rankin-style ideal counts are unrelated. GZ.6’s algebraic-cycle map is not Chow functoriality, an arithmetic generating series or a derivative identity. GZ.7’s reduction and formal-group definitions do not prove the local intersection formulas. GZ.8’s complex identity and GZ.9’s anticyclotomic/BDP formula remain unbuilt; the bounded Amice equivalence is only a related analytic input.

### Heegner systems: HE.0–HE.8c

Apart from the unit computation above, HE.0’s separation between generic Picard/class groups and actual orders, ring class fields and reciprocity is supported. HE.1–HE.2 need geometric CM points and norm/reduction correspondences beyond analytic periods and double-coset operators. HE.3’s multiplicative field Kummer map does not become an elliptic Kummer map by changing notation. Explicit square-class Selmer carriers used for weak Mordell–Weil do not provide the full cohomological Selmer/local-condition package claimed missing here.

HE.4 correctly credits inflation–restriction while leaving derivative classes and their descent missing. One wording refinement is available: [`explicitInfRes_exact`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean#L336), `explicitCor1` and Kato L1’s `explicitCup11` admit general topological additive coefficients with continuity hypotheses. No `DiscreteTopology` hypothesis is imposed on those coefficients. The audit’s descriptions “with discrete coefficients” are valid specializations, so they are not reported as false statements. This also does not supply derived inverse limits, compact-support duality or Tate-module comparison.

HE.5’s auxiliary prime lemma and Frobenius prime sets do not prove Chebotarev density or the required residual-representation localization assertions. HE.6–HE.7 retain the differences between nonzero and primitive classes, one-prime bounds and full finiteness of Sha, and the exceptional/dyadic/CM checks. Searches did not find the Howard, Kolyvagin–Logachev, Zhang or Cornut–Vatsal conclusions. HE.7s and HE.8c are correctly source-bookkeeping layers. HE.8 and HE.8b require constructed towers, Iwasawa classes and control/main-conjecture inputs; Weierstrass preparation alone is not a characteristic-ideal theorem.

### Integral Iwasawa theory: I.1–I.10 and L0–L4

At finite level, the cyclotomic integer-ring, discriminant, ramification, Galois and CM/unit-index statements have the stated generality. The local `haveI : NumberField K` in the discriminant and infinite-place statements was included. Element and ideal norms are genuine general inputs. Elementwise cyclotomic units, regulators, the analytic class-number formula and Dirichlet’s theorem do not define the global cyclotomic-unit subgroup or prove its index formula.

The cyclotomic character is not a construction of the ℤ_p-subextension or its arithmetic norm system. Tau Ceti’s `IsProP` describes topological groups, not maximal arithmetic pro-p extensions. The `IwasawaStructure` search hits concern simplicity of groups. Abstract measure products and pushforwards do not furnish a completed group-algebra equivalence with convolution. The available Nakayama theorem assumes finite generation; it is not the compact topological theorem used to establish that hypothesis. “Fitting” hits in Lie-weight and Krull–Schmidt material do not define Fitting ideals. No characteristic-ideal, pseudo-isomorphism, determinant-functor or arithmetic Iwasawa-complex package was found.

I.3–I.10’s p-adic pseudo-measures, Hilbert Eisenstein congruences, main conjectures, Ritter–Weiss modules, Brumer–Stark and Kurihara determinant comparison remain absent. Stickelberger’s discriminant congruence is unrelated to Stickelberger elements. L1–L4’s global towers, growth formula, Vandiver comparison, Baker–Brumer, Leopoldt and Ferrero–Washington likewise were not supplied by alternate-name hits. The overlap between I.2/L1 and the declared imports from the measure/Selmer owners is real and already recorded by the audit; it is not a new finding.

### Kato: L0–L4

Eta and Jacobi theta provide analytic ingredients but not Siegel units on algebraic modular curves. Quaternion Steinberg splitting is not Milnor/Quillen K₂ or a tame symbol. The field Kummer map and continuous cup product do not create the missing étale regulator or its symbol comparison. Searches found no modular local system, Kato zeta class, modular-symbol/de Rham comparison, explicit reciprocity identity or the required nonvanishing of modular twists. The cited modular L-function and Dirichlet nonvanishing statement have different scopes. No target was upgraded merely from the appearance of “Steinberg,” “Chern” or “Kato” in an unrelated context.

### Locally analytic distributions: L0–L4

The audit correctly credits Mahler, bounded measures/Amice, restricted power series and Gauss norms. These are not the locally analytic LF space, its dual or the unbounded Amice isomorphism. The scalar generality in Mahler’s equivalence and the character equivalence was retained. `continuousAddCharEquiv` is a one-variable pointwise equivalence, not a representable multivariable weight space with gluing. A closed polydisc as an adic-spectrum subset is not the missing glued open disc.

A plausible logarithm counterexample was rejected after opening [`LogOneAdd/Basic.lean`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Normed/Algebra/LogOneAdd/Basic.lean#L78-L129): the convergence/analyticity section requires `ContinuousSMul ℚ≥0 𝕂`. For the ordinary topology on nonnegative rationals and the p-adic topology on ℚ_p this fails (the scalars `p^(-n)` tend to zero in the former and have p-adic norm `p^n`). Its formal series/sum definition therefore does not prove the p-adic convergence-domain target. The Riesz finite-kernel result does allow complete nontrivially normed fields; its closed-range/cokernel continuation adds `IsRCLikeNormedField`. The audit already distinguishes them. Fredholm predicates and indices are not p-adic Fredholm determinants or affinoid slope decompositions.

## Ownership and freshness

All 82 overlap entries were compared with the complete relevant sections of their 67 distinct named owner stages. This includes upstream orders/class fields/elliptic curves/stable reduction/adic spaces, height and tropical suppliers, CM and Shimura suppliers, generic Euler systems, the Heegner-cycle analogues, K₂ and regulator owners, the measure and Selmer owners, and the modular-family/congruence/main-conjecture interfaces.

The comparisons preserve the direction of the handoffs: a higher-weight construction is an analogue with a specialization to prove; a local theta integral does not itself prove Gross–Zagier; the generic determinant line does not prove an arithmetic main conjecture. BCS’s two-variable comparison and its Heegner endpoint remain distinct owners. PadicFamilies L2a consumes the distribution/Fredholm theory for spectral gluing. Imports and overlap leads are allowed by PROTOCOL §15 and were not automatically recast as duplicate implementations. No additional wrong-owner claim was established. The accepted RS-16 owner table already resolves the shared global cyclotomic-unit construction to Integral L0, the tower carriers to I.2, the general Fitting-ideal carrier to upstream StableReduction Layer 1, and the determinant functor to the measure roadmap L5. RS-14 preserves the Dirichlet/Deligne–Ribet and Mellin division; RS-08 separates generic eigenvariety gluing from its arithmetic application. These decisions are context for interpreting old overlap leads, not a reason to claim the missing mathematics has been built.

The acquired audit snapshot was at `6d466a3a0cef4c949493af7c16a3cb3d671d57a9`. A guarded refresh to `ae16efd59f8727140b163dd6a3318e0da593cd2a` changed no input file. The submission guard checks the audited result, supporting input hashes and the previously absent deliverables again before publishing.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-25.result.json` — passed.
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-AUDIT-25.result.json research/blueprint/redteam/RT-AUDIT-25.md` — two files, zero problems.
- Exact layer/target census, citation-location verification, pinned-file hashes and authorized-path checks.

No Lean file is part of this job; none was compiled. No new mathematics is claimed formalized. Independent verification decides whether the finding becomes a correction job.
