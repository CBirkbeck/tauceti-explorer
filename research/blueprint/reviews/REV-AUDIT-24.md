# REV-AUDIT-24 — review of AUDIT-24

**Verdict: accepted.** 142 targets checked across 33 layers of 5 roadmaps; 2 corrections, both
additions to `duplicates`. No target classification and no layer verdict needed changing.

Baseline: tauceti `f790474`, mathlib `082e2d3`.

## What the audit says

| roadmap | layers | verdict | targets |
| --- | --- | --- | --- |
| ColemanPowerSeries | 5 | 2 partly built, 3 not built | 32 |
| DirichletPadicLFunctions | 5 | 2 partly built, 3 not built | 31 |
| EulerSystemsAndKolyvaginSystems | 9 | 9 not built | 35 |
| EulerSystemsCyclotomicMainConjecture | 5 | 5 not built | 20 |
| GeneralizedHeegnerCycles | 9 | 9 not built | 24 |

7 targets present, 40 partial, 95 absent; 125 declaration citations; 41 duplicates.

## 1. Claims that a target is in the libraries

Every citation was resolved mechanically against the pinned baseline and then read in context.
All 125 citations (111 distinct declarations) name a declaration that really is on the cited line of
the cited file, no cited file contains a `sorry`, and every statement matches its note. The one
mechanical miss is `Module.IsReflexive.of_finite_of_free`, which is absent from `declarations.tsv`
because the index drops that instance; it is in `Mathlib/LinearAlgebra/Dual/Lemmas.lean:259` under
that name.

The hypotheses the notes flag are all real:

* `Algebra.norm_norm` needs `Module.Free S A` (and `Module.Free R S` from the section) — satisfied by
  a tower of finite field extensions, so the "transitivity of field norms" target really is built.
* `IsCyclotomicExtension.finrank` and `IsPrimitiveRoot.sub_one_norm_isPrimePow` both need
  `Irreducible (cyclotomic n K)`, which is why the degree/norm targets over ℚ_p stay partial.
* `gaussSum_ne_zero_of_nontrivial` is stated for a finite field `R`, i.e. prime modulus only; the
  composite-conductor `|g(χ)|² = N` is genuinely missing.
* `exteriorPower.bijective_pairingDual` obtains a basis from `Module.Free`, so the finite projective
  case is not covered, as the note says.
* `PowerSeries.exists_isWeierstrassFactorization` holds over any adically complete local ring with
  nonzero residual image — "more general" is right.
* `EisensteinSeries.q_expansion_bernoulli` needs `3 ≤ k` and `Even k`; `LFunction_changeLevel` needs
  `χ ≠ 1 ∨ s ≠ 1`.
* `riemannZeta_neg_nat_eq_bernoulli'` is proved for every `k : ℕ` including `k = 0`, so ζ(0) = −1/2
  is covered as claimed.

Two notes quote the libraries; both quotes are accurate. The ℤ_p-module structure on principal units
is the literal TODO of `Mathlib/RingTheory/PowerSeries/Binomial.lean` ("the exponentiation action
makes the multiplicative group `1 + XA[[X]]` into an `R`-module"), and `L(χ,1−n)` is the literal TODO
of `Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean` ("Extend to cover Dirichlet L-functions").

## 2. Layer verdicts

No layer in this batch is `built` or `process`, so check 2 is a consistency check, and the file is
consistent with the job's rule. Exactly four layers have a fully present target —
ColemanPowerSeries:L0 (norm transitivity), ColemanPowerSeries:L2 (the Amice transform),
DirichletPadicLFunctions:L0 (four targets) and DirichletPadicLFunctions:L4 (the level-one E_k
q-expansion) — and exactly those four are `partly built`. The other 29 have only partial and absent
targets and are `not built`. Every layer of the batch file appears in the result, with no extras.

## 3. Absent and partial claims, re-searched

All 95 absent and all 40 partial targets were re-searched independently, by Mathlib naming
convention and by concept, in `declarations.tsv` and by `grep -rn -i` over both Lean trees. Nothing
was found that the audit missed. Concretely, neither library has: a p-adic logarithm
(`PowerSeries.log` needs `Algebra ℚ A`); the decomposition ℤ_p^× ≅ μ_{p−1} × (1+pℤ_p); an inverse
limit of μ_{p^n} or a Tate module; completed group rings or Iwasawa algebras; pseudo-measures;
characteristic ideals or pseudo-null modules; Fitting ideals (the only `Fitting` hits are the
Lie-theoretic Fitting decomposition); Gorenstein orders; exterior biduals; Selmer structures for
p-adic representations, core rank or Poitou–Tate; Kolyvagin, Euler or Stark systems; the Chebotarev
density theorem; ray class fields; Hecke/idele class characters; generalized Bernoulli numbers; a
Kubota–Leopoldt p-adic L-function; modular curves as schemes, CM elliptic curves or Kuga–Sato
varieties; cycle class or étale Abel–Jacobi maps; ring class fields; Gross–Zagier; or Hida families.
The only "Coleman" in either tree is Chabauty–Coleman.

Three points that could have gone the other way and did not:

* **Irreducibility of Φ_{p^n} over ℚ_p.** Mathlib proves it over ℚ and ℤ; Tau Ceti proves it over a
  number field in which p is unramified (`IsCyclotomicExtension.irreducible_cyclotomic_of_unramified`
  and its prime-power form). ℚ_p is not a number field, so the local degree formula is out of reach
  and the `partial` verdict on that target is correct.
* **Chebotarev.** Tau Ceti has `frobeniusPrimeSet`, the Artin symbol, tagged fibres, crossing data
  and `NumberField.exists_auxiliaryPrime` (a genuine sorry-free theorem producing a large prime
  ≡ 1 mod n, unramified in two fields, with Φ_q irreducible), but the density theorem itself is not
  proved anywhere; the files say so in their own docstrings.
* **Local fields.** Mathlib has `IsNonarchimedeanLocalField ℚ_[p]` only; Tau Ceti gets local fields
  from adic completions of Dedekind domains with finite residue field. There is no instance for an
  arbitrary finite extension of ℚ_[p], exactly as ColemanPowerSeries:L0's note states.

## 4. Duplicates

All 41 duplicates were confirmed against the cited layer's own description, and every cited id is a
real atlas stage id (so all of them survive `merge_library_audit.py`'s filter). A keyword sweep of
all 1962 atlas layer descriptions for this batch's concepts produced two overlaps the audit had
missed; both were added.

* **DirichletPadicLFunctions:L1 → PadicMeasuresIwasawaAlgebras:L3.** L3 owns pseudo-measures over
  `O[[G]]`: the `([g]−1)λ ∈ O[[G]]` condition, localization at the non-zero-divisors, evaluation by
  clearing a factor, independence of `g`, and the procyclic existence/uniqueness statements "used by
  RJW §§3–4". That is the machinery L1 restates when it divides `x^{-1}Res(μ_a)` by `[a]−1` in the
  total quotient ring and proves independence of the smoothing parameter.
* **EulerSystemsCyclotomicMainConjecture:L3 → IntegralIwasawaTheory:L1.** L3 uses the exact sequence
  `0 → E^+/C^+ → U^+/C^+ → X^+ → Y^+ → 0` without naming an owner; IntegralIwasawaTheory:L1 states
  and proves that sequence from ray-class reciprocity and inverse limits.

Two further candidates were rejected because the other layer explicitly names this batch as the
owner and only asks for a comparison: `IntegralIwasawaTheory:I.3` ("import the Kubota–Leopoldt
pseudomeasure from DirichletPadicLFunctions L1–L2 … No second p-adic zeta carrier is constructed")
and `PadicHodgeRegulators:L3` ("Identify the rank-one Tate case with R04's Coleman map"). The
GeneralizedHeegnerCycles candidates that the sweep threw up (HeegnerPointEulerSystems HE.0,
PadicFamilies L0/L5, ModularCurvesPartII R14.5) are the suppliers that roadmap's own summary already
names, not second owners.

## Assessment

This is a careful audit. Its citations are accurate to the line, its notes state the differing
hypotheses correctly, and its "absent" claims hold up under independent search — which is what one
should expect for Iwasawa theory, Euler systems and generalized Heegner cycles, where the libraries
supply only generic inputs (continuous cohomology, exterior powers, module length, the PID structure
theorem, the Amice transform, Weierstrass preparation, cyclotomic-unit lemmas, the class-number
limit). The most useful thing the audit records is where the libraries are closer than the roadmap
documents assume: the Amice transform D(ℤ_p,ℤ_p) ≃ ℤ_p⟦X⟧ with its inverse, Weierstrass preparation
over any complete local ring, ζ(−n) in Bernoulli numbers including ζ(0), the Gauss-sum inversion
formula for primitive characters, imprimitive Euler-factor deletion for continued L-functions, and
the level-one E_k q-expansion, which together with Tau Ceti's V_d put the p-stabilized Eisenstein
series within reach.
