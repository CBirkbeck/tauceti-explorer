# RT-AUDIT-24 — independent red-team report

Agent: Codex — codex-a71f92  
Date: 2026-09-24  
Target: accepted AUDIT-24, including REV-AUDIT-24's additions  
Status: complete; two findings, awaiting independent verification

## Result

The audit's broad library assessment survives: seven targets are already present,
40 have supporting material, and 95 remain absent at the pins. None of the
cited declarations is fictitious. The findings concern a dropped hypothesis in
one mathematical target and an incorrect construction-owner description, not
a claim that an Euler-system or Heegner-cycle theory is already formalized.

| Roadmap | Layers | Targets | Layer verdicts |
| --- | ---: | ---: | --- |
| ColemanPowerSeries | 5 | 32 | 2 partly built, 3 not built |
| DirichletPadicLFunctions | 5 | 31 | 2 partly built, 3 not built |
| EulerSystemsAndKolyvaginSystems | 9 | 35 | 9 not built |
| EulerSystemsCyclotomicMainConjecture | 5 | 20 | 5 not built |
| GeneralizedHeegnerCycles | 9 | 24 | 9 not built |

This review used explorer commit
`44103549a6b1eda59ddfc50b25bb9ae449d371c3`,
[Mathlib 082e2d3](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib)
and [Tau Ceti f790474](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369/TauCeti).
Neither AUDIT-24 nor its accepted review was this worker's work.

## 1. The relative norm target loses the odd-prime hypothesis

**Finding RT-AUDIT-24/1 — high, error.**

The fifth target of ColemanPowerSeries:L0 displays

`N(zeta_{p^{n+1}} - 1) = zeta_{p^n} - 1`

without restricting the prime. It is an extracted mathematical target, so its
hypotheses must travel with it. A later target's restriction on the unit
decomposition does not qualify this earlier formula.

The source is correct: Rodrigues Jacinto–Williams,
[arXiv:2309.15692v2 §9](https://arxiv.org/html/2309.15692v2#S9),
fixes an odd prime before the Coleman chapters.
[Lemma 10.3](https://arxiv.org/html/2309.15692v2#S10.SS2)
then computes the relative norm using that convention. I read these public
passages on 2026-09-24; this is a hypothesis lost by the audit, not a proposed
erratum to the paper.

There is an exact counterexample within the roadmap's indexing `n >= 1).
For `p=2,n=1`, take `K_1=Q_2`, `K_2=Q_2(i)`,
`zeta_4=i`, `zeta_2=-1`. The extension is quadratic:
a square root of `-1` in `Q_2` would be a unit, but odd squares are
`1 mod 8`, whereas `-1=7 mod 8`.
Multiplication by `i-1` on the basis `(1,i)` has matrix

```text
[ -1  -1 ]
[  1  -1 ]
```

and determinant `2`. The claimed right side is `-2`.
This is the norm used by the pinned library:
[Mathlib/RingTheory/Norm/Defs.lean, norm_apply and norm_eq_matrix_det](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Norm/Defs.lean#L64).

More generally, the minimal polynomial for `zeta_{p^{n+1}}-1` is
`(X+1)^p-zeta_{p^n}`; its constant term gives

`N(zeta_{p^{n+1}}-1)=(-1)^(p+1)(zeta_{p^n}-1)`.

The minus sign at two disappears if the generator is `1-zeta` instead.
It also cancels in a ratio of two cyclotomic differences, so this finding
does not say that the smoothed unit ratio fails norm compatibility.

**Correction:** explicitly retain `p odd` on this target and its note.
Alternatively, if all primes are intended, use the signed formula or the
`1-zeta` convention. Keep the existing `partial` classification, and
do not remove any separately specified dyadic branch elsewhere in the programme.
Severity is high because the literal unqualified target is false, although the
edit is small and the source's intended odd-prime branch remains intact.

## 2. An importing Selmer stage is described as the owner

**Finding RT-AUDIT-24/2 — medium, error.**

The ES.0 overlap note for ArithmeticGaloisDuality:R02.5 assigns that stage
ownership of Selmer groups with local conditions. The
[current stage text at the reviewed explorer snapshot](https://github.com/CBirkbeck/tauceti-explorer/blob/44103549a6b1eda59ddfc50b25bb9ae449d371c3/content/campaign/ArithmeticGaloisDuality/README.md#L64)
instead explicitly imports the local-condition/mapping-fibre construction
from SelmerIwasawaCohomology:L2. It then supplies the deformation-facing
comparison with the global H1 restriction kernel and the dimension formula.

This matters because an audit's overlap notes guide later proof ownership.
The generic carrier should not acquire a second owner through this note.
The audit already identifies the correct L2 supplier in another entry.

**Correction:** distinguish the imported Selmer construction from R02.5's
dimension/comparison work in this one note. Retain the genuine
dimension-formula overlap; no deletion of that theorem, graph reorientation,
new carrier, or library-status change is requested. Regenerate the coverage
mirror through the normal audit-fix intake.

This is a current-owner correction. It makes no claim about when the importing
sentence was introduced relative to the original audit.

## Citation and hypothesis checks

I read all 111 distinct declarations used by the 125 citations, not just the
index names, and reconciled every use with its target. Additional surrounding
section hypotheses were checked where the statement relied on them.

The seven positive target classifications are supported:

- Field-norm transitivity: `Algebra.norm_norm`. Its general ring theorem
  assumes both `Module.Free R S` and `Module.Free S A`; both hold in the
  stated field tower. The note's shorthand should not be used to discard
  the first hypothesis in an unrelated ring application.
- Integral Amice theory: `AbstractMeasure.amiceTransformEquiv` and
  `invTransform`, for `Z_p` coefficients. This is not a coefficient-general
  topological convolution-algebra theorem.
- Riemann zeta at nonpositive integers: both Bernoulli conventions, including
  `k=0`, have the advertised formulas.
- Primitive-character Gauss-sum inversion: the shift identity works at
  non-units too; the Fourier version carries its minus-sign convention.
- Conductors, primitive associated characters and change of level:
  the definitions and primitivity/change-level lemmas are present.
- Euler-factor deletion: `LFunction_changeLevel` retains
  `chi != 1 or s != 1`, as the audit notes.
- Level-one Eisenstein q-expansions: the statements require
  `Even k` and `3 <= k`, hence even weights at least four.
  Tau Ceti's separate level-raising formula is only supporting input for the
  p-stabilized target.

For partial citations I checked the distinctions the audit relies on:
global versus local cyclotomic irreducibility; principal units versus an
inverse limit; norm-as-determinant versus the finite-free Coleman extension;
Weierstrass preparation versus interpolation uniqueness; flat tensor
exactness versus a constructed topological exact sequence; finite-field
Gauss-sum nonvanishing versus general composite conductor; finite-free
exterior pairing versus arbitrary finite projective modules; and actual
continuous H1 maps versus the missing arithmetic Selmer conditions.

The pinned Kummer map is injective on finite power classes; it is not the
p-adic inverse-limit isomorphism. The Artin map is for a given abelian
extension; abstract class-field formations and ray class groups do not
construct all ray class fields. The auxiliary-prime theorem is not the
full simultaneous Chebotarev localization theorem.

## Searches for missed library material

I searched the declaration inventory and both complete pinned Lean trees,
including ignored files. The searches were grouped by mathematical family
and followed by inspection of plausible candidate files. These were
adversarial searches, not a proof of universal nonexistence.

| Audited family | Alternative vocabulary and closest checked material |
| --- | --- |
| Coleman L0–L1 | compatible roots, Tate modules, norm-coherent/circular units, local-field structures, finite extensions, substitution, Frobenius expansion, normalized trace, Weierstrass preparation |
| Coleman L2–L4 | measures, Mahler/Amice, restriction, pushforward, derivatives, completed group algebras, pseudo-measures, unit filtration, Teichmuller, cyclotomic units and CM unit indices |
| Dirichlet L0 | Mellin continuation, generalized Bernoulli, Gauss-sum norm/nonvanishing, Fourier inversion, root numbers, Dedekind zeta, idele/Hecke characters |
| Dirichlet L1–L4 | Kubota–Leopoldt, smoothed measures, Kummer congruences, analytic logarithm, Eisenstein character pairs, stabilization, twisted divisor sums |
| ES.0–ES.3 | Selmer/local/cartesian conditions, core rank, Poitou–Tate, ray/class fields, Chebotarev, finite–singular/transverse conditions, Euler/Kolyvagin systems, restriction/corestriction/inflation |
| ES.4–ES.8 | Stark systems, primitivity, module length/PID elementary divisors, exterior bidual/Rubin lattice, Gorenstein/self-injective orders, Fitting/characteristic ideals, pseudo-null |
| Cyclotomic main conjecture L0–L4 | cyclotomic/circular units, Kummer maps and limits, reflection/duality, norm and Euler relations, class-number/index formulas, Iwasawa control |
| GH.0–GH.8 | Heegner, Kuga–Sato, CM isogenies, modular curves, cycle classes, Hochschild–Serre, etale Abel–Jacobi, syntomic, anticyclotomic, Hida, Yager, Gross–Zagier |

Several tempting near misses deserve explicit boundaries:

- `AbstractMeasure.Basic` provides pushforward and product integration.
  Reading the whole file did not reveal the unit-restriction/phi/psi
  identities, twisting package, or pseudo-measure requested here.
- Tau Ceti's `NormedSpace.logOneAdd` has a general series-sum definition.
  Its convergence/analyticity section requires
  `ContinuousSMul Q>=0 K`, and its inverse-exponential results use a
  normed real algebra. Those are not ready-made p-adic convergence,
  branch, and algebraic-extension compatibility theorems.
- `CliffordAlgebra.contractLeft` at zero quadratic form, and Tau Ceti's
  exterior-basis contraction formulas, are genuine ordinary exterior-algebra
  inputs. They do not supply the exterior-bidual system contractions and
  coefficient-change package of ES.6. The audit's absence statement is
  interpreted at that requested carrier, not as denying ordinary contractions.
- The general Fourier equivalence and primitive-character shift formula
  give a route to composite-conductor nonvanishing. A short derivation one
  can write is not an already named theorem at the pin; the target remains
  partial, not a claim that its proof is inaccessible.
- Tau Ceti's class-field formations are abstract representation/normal-layer
  machinery, not arithmetic existence or the idele–Dirichlet correspondence.
- The algebraic-cycle and ell-adic cohomology definitions do not constitute a
  cycle class, higher-codimension etale Abel–Jacobi map, CM-cycle construction,
  or reciprocity theorem.

## Overlaps, integration and limits

All 33 accepted coverage entries exactly match the audit's targets, notes,
verdicts and duplicate arrays. All 43 overlap references resolve; there are
38 distinct endpoints. I read their actual descriptions, including upstream
LocalFieldsRamification, ModularForms and EllipticCurves stages. The original
review's count of 41 predates its two additions and is not another finding.

The overlaps have different strengths: a shared generic constructor,
a finite-level input, an alternative proof of an endpoint, and a weight-two
specialization are not interchangeable. In particular, an application of an
imported system theorem still needs arithmetic hypothesis verification;
a Kuga–Sato projector is not supplied just by an analytic Hecke endomorphism;
and a Vandiver-conditional isomorphism is not an unconditional main conjecture.
Except for the precise owner wording in finding 2, this review does not
convert the overlap list into a request to remove these comparisons.

The integrated cyclotomic-main-conjecture and generalized-Heegner packets
remain partial planning artifacts (16 and six nodes respectively). Their
existence does not contradict the audit's pinned-library assessment. I inspected
their status and node inventories, not all their underlying primary proofs.
This job is an audit red team, not a replacement independent review of those
packets or of the whole Iwasawa programme.

## Validation and handoff

Checks performed:

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-24.result.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-AUDIT-24.result.json research/blueprint/redteam/RT-AUDIT-24.md`
- read-only scratch checks resolving all 111 citation locators, reconciling
  142 targets and 33 coverage entries, and resolving all 43 overlap endpoints;
- exact integer/rational arithmetic for the displayed quadratic norm matrix,
  the odd-square obstruction modulo eight, and the constant-term sign identity.

Only the two deliverables are submitted. The accepted audit, library coverage,
roadmap text and pinned libraries are unchanged. No Lean file was changed or
compiled, and no new mathematical formalization is claimed. An independent
verifier should check each finding before the normal fix job changes the audit.
