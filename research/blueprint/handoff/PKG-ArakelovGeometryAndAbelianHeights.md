# Handoff: PKG-ArakelovGeometryAndAbelianHeights

Issue #9769. Author: Codex, session **codex-zt51cz**, 2026-10-14.
Status: **complete package**, ready for independent package review.

## Deliverables

The package is in `research/blueprint/packages/ArakelovGeometryAndAbelianHeights/`:

- `README.md`: six layers and all 55 topics of the accepted plan, with exact
  hypotheses, proof routes, supplier contracts, APIs, checks, examples and
  theorem/section/page locators. It retains every original API and named test.
  There are 162 API entries and 103 named checks, including the comparison
  topics and the additional Zarhin interface. The input has 158 API entries and
  84 named checks on that counting convention; the blueprint validator counts
  151 APIs and 80 tests in definition/construction topics only.
- `Suggested.lean`: 219 lines, one `import Mathlib` block, the
  `TauCetiRoadmap.ArakelovGeometryAndAbelianHeights` namespace, six layer comments,
  eight light definitions/abbreviations with real bodies, representative
  signatures and examples. Arithmetic schemes, hermitian bundle constructions,
  Néron models and moduli remain fully specified README targets. There is no
  sorry-bodied data or auxiliary lemma development.
- `metadata.toml`: `topic = "math.NT"`.

The packet, reader, earlier suggested file, atlas data and other jobs were not
edited. All prose is independently phrased; no source passage or book file was
put in the repository.

## Baselines and ownership

The library pins remain Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The read-only current roadmaps were
checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti
library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No build was run in either
current checkout. DifferentialGeometry and AdicSpaces were read in full as
roadmap models, and their suggested-file form was checked.

Ordinary vector-bundle operations and determinants are imported from
AlgebraicVectorBundles; generic covolume/Gram calculations from IntegralLattices;
forms and integration from DifferentialGeometry. Section 2.1 preserves the
plain Hodge-line interface and checks from AbelianSchemes A1/A6 and NéronModels
R11.1, while assigning only its metric enrichment here. Ordinary divisors,
Picard comparisons, line-bundle norms, normal crossings and Chow groups are
imported directly from SchemeAndStackFoundations §§3.4, 3.5, 4.17 and 5.1.
Bookkeeping `FoundationsAndLibraryIntegration` and `UPSTREAM:` references have
been replaced by their actual suppliers.

The pinned `Ideal.absNorm_algebraMap` was checked with its enclosing variables:
its freeness assumptions are over ℤ, not over the lower ring of integers.
The finite torsion-free ring extension therefore gives the degree-scaling
identity without a false assumption that O_L is free over O_K.

The old upstream note about ArithmeticHeights PR
[287](https://github.com/TauCetiProject/TauCetiRoadmap/pull/287) is stale: it was
closed unmerged on 2026-10-14. The package does not treat that proposal as an
existing owner. It uses HeightsRationalPointsAndObstructions RP.0 for ordinary
heights and owns the metric-to-height adapter. RP.0 review
[9711](https://github.com/CBirkbeck/tauceti-explorer/pull/9711) has merged.

R28 remains the downstream owner of number-field descent, isogeny-class bounds,
the global Hodge–Tate argument and Tate/Shafarevich finiteness. Its duplicate
height targets should be pointed at this package as described in the existing
packet's restructure section. HilbertModularVarietiesAndShimuraCurves is listed
as a consumer, never as a proof dependency; its earlier-tier citation to R35
still needs the manager's ordering decision.

## Corrections to the accepted input

These corrections are in the package only; the independent reviewer can compare
them with the unmodified input.

1. **Arithmetic point cycles (§1.10).** Divide the pairing with the image
   closure by `[K(x):ℚ]`, not by an arbitrary larger field of definition.
   Equivalently push forward `Spec O_K′` with multiplicity `[K′:K(x)]` before
   dividing by `[K′:ℚ]`. Over a localized base the normalization is the
   corresponding localized ring of integers. A rational point viewed over
   `ℚ(i)` tests the multiplicity.
2. **Stack degree (§1.11).** Require regularity, flatness, properness, finite
   geometric fibres and finite inertia. Avoid calling the morphism finite flat,
   which can imply representability and exclude the classifying-stack check.
   AGHMP's arithmetic-degree definition is located on pp. 79–80 of arXiv v3.
3. **Galois and projective heights (§§1.12, 1.14).** Model-specific invariance is
   over `Gal(ℚ̄/K)`. The saturated O(−1) lattice is `𝔟⁻¹x` and its dual O(1)
   lattice is `𝔟`; the degree's finite term is `−log N𝔟`. Retain the library's
   relative tuple height and explicitly normalize absolute heights. Added
   rank-dependent rescaling, normalized-degree and positive-rank slope checks.
   For O((f)), the unit-norm section is f⁻¹. The regulator uses Mathlib's
   omitted-coordinate measure, not an unqualified Euclidean hyperplane measure.
4. **Period normalization (§§2.2–2.4, 2.9–2.10).** Keep the positive
   `i^(g²)/2^g` factor and the Faltings/Deligne/unscaled dictionary. In original
   coordinates the norm of `dz₁∧⋯∧dz_g` is `|det Ω₁|²det Im τ`, whereas the
   normalized w-form has norm `det Im τ`. The weight-12 Petersson expression is
   the square of the elliptic positive term. Multiplication is an isogeny only
   for `n ≠ 0`; formulas use `|n|`. A non-minimal singular Weierstrass equation
   is a wrong differential lattice, not another smooth semi-abelian model.
5. **Duality sequencing (§§2.7, 4.3).** Section 2.7 constructs the semistable
   integral comparison using Faltings–Chai V, Lemma 3.4, p. 166. The general
   squared-line theorem is retained and constructed in §4.3 after differents
   and the isogeny formula. The semistable toric argument does not assume the
   finite kernel pieces on identity components are Cartier dual.
   The isomorphism is between determinant lines, not the rank-g Hodge bundles.
   Section 3.5 uses only the semistable comparison; the unrestricted relative
   duality assertion also moves to §4.3. Section 2.1's pushforward identity
   explicitly requires an abelian scheme, including geometrically connected
   fibres; the constant group ℤ/2 is a proper disconnected counterexample.
6. **General dual differents (§4.3).** For number-field localizations, use
   Raynaud's finite-residue-field arithmetic proof, §2.4 and Remark 2.4.1,
   pp. 211–212. The section explicitly targets the abelian-variety local Tate
   pairing, Kummer-image annihilators and Lie-filtration asymptotics. It states
   the exact sequence and the linear point-count coefficients; ClassFieldTheory
   Layer 5 supplies only the finite-module duality/Euler-characteristic input.
   This avoids an unstated import of Bégueri/Greenberg theory. It does not claim
   a replacement proof over arbitrary perfect residue fields.
7. **Different conventions (§4.1).** The determinant-line cokernel can be a
   twist of `O_K/𝔡`; it need not be that cyclic module canonically. Use the
   zeroth Fitting ideal for the full Lie cokernel, not its annihilator. The
   finite-flat comparison is at the unit section. The additive `[p]` example
   checks the necessity of the flatness hypothesis.
8. **Component lines (§§4.6–4.8).** Assume E totally real or CM, take the
   torsion-free quotient before its ordinary determinant, and assume local
   freeness for the isogeny length formula. Its comparison is a rational
   isometry, potentially with a signed finite divisor, rather than an integral
   map. The CM polynomial comparison explicitly assumes rank-one de Rham
   freeness and monogenicity; neither is hidden in the ordinary Hodge sequence.
9. **Logarithmic metrics (§§5.1, 5.3).** Fix the boundary extension; arbitrary
   twists by a boundary divisor need not preserve logarithmic growth. The local
   Lean predicate requires eventual positivity, `C > 0`, and `n : ℕ` and uses
   `1+|log ‖q‖|`. Zero, negative, and power-pole functions are negative controls.
   The period estimate retains the bounded abelian Gram block; a rank-deficient
   logarithmic part alone has zero determinant. The fixed-elliptic-factor check
   exposes that error.
10. **Moduli (§§5.4–5.5).** A toroidal stack lift may require a finite extension;
    normalize the two heights after that extension. Toroidal non-ampleness is
    witnessed by positive-dimensional contraction fibres, which do not occur
    in genus one. The integral level-one compactification over all of Spec ℤ
    remains the exact supplier contract.
11. **Theta (§§5.7–5.8).** Use Pazuki's good translated sections indexed by
    `A[r²]/A[r]`, with scalar, permutation and root-of-unity changes. An arbitrary
    unitary change does not preserve the finite sup metric. For g=1,r=2 use the
    four half-characteristics at τ (including the odd zero), or equivalent
    Mumford coordinates at r²τ; four second-order coordinates at 2τ are wrong.
    State the explicit M(r,g) and matrix constant `8g/π·(1+2g²log(4g))`.
12. **Bounds and finiteness (§§5.9, 6.1, 6.4–6.5).** A sampled elliptic envelope
    is a numerical check, not an established optimal bound or equality case.
    Retain proved constants 3 and 2.95, with a certified-bound proof route.
    An upper j-height comparison cannot turn a Faltings upper bound into a
    j-height upper bound. Bost's linear estimate is not called sharp. Fix the
    integral choices in Zarhin's construction rather than assert uniqueness
    of its polarization. Added its API and degree/base-change checks. Moduli
    finiteness has an explicit height range, not an enumeration algorithm.
    The torsion-field assertions use n ≥ 1 and the cyclotomic containment uses
    g ≥ 1: the empty Weil pairing in dimension zero cannot force μ_n into K.

There are no forward internal proof prerequisites in the resulting topic
order. The reference in §2.7 announcing §4.3 is an announcement, not an input
to the semistable proof.

## Adversarial mathematics pass

Every topic was checked against its hypotheses and examples. This table records
the instances used, grouped only where they share the same calculation.

| Statements | Instances and witness | Result |
|---|---|---|
| 1.1 | Zero module, trivial line, Gaussian conjugate norms 1 and 4 | Conjugation is data; wrong conjugate norm is excluded. |
| 1.2 | Unit tensor, orthogonal sum, quotient of ℤ² by (1,1) | Quotient generator norm is 1/√2. |
| 1.3–1.6 | Unit ideal, (1+i), section 2, rank 0 and 2, finite extension | Signs, complex multiplicity, rank rescaling and normalized degree agree. |
| 1.7 | Principal (2) over ℚ(i), zero divisor, unit lattice, section ½ | Finite log 4 cancels −2log 2; f⁻¹ trivializes O((f)). |
| 1.8–1.9 | Constant Green function and principal rational function | The square-norm/½ convention yields degree zero on principals. |
| 1.10 | Horizontal section, vertical fibre, inversion of p, field enlargement | Log p vanishes only in the localized quotient; point multiplicity corrected. |
| 1.11 | Spec O_E and B(ℤ/2); inert residue degree 2 | Automorphism and residue-norm weights retained; regularity required. |
| 1.12–1.13 | Metric shifts, trivial line, [1:1], field extension | Constant change has stated sign; invariance is relative to the model field. |
| 1.14 | Zero tuple, coprime coordinates, (2,2), sup versus FS | Zero excluded; scalar cancellation; FS at [1:1] is ½log 2. |
| 1.15 | Identity norm, Gaussian prime, tensor rationalization | Norm degree preserved; one-embedding metric fails. |
| 2.1 | G_m, zero-dimensional group, multiplication by n, constant ℤ/2 | The pushforward identity needs properness and geometrically connected fibres. |
| 2.2–2.3 | Square lattice, 2i lattice, product in g=2, coordinate rescaling | Positive parity and original-coordinate determinant verified. |
| 2.4 | [n], including n<0 and excluded n=0 | Squared pullback norm is |n|^(2g). |
| 2.5 | Néron lattice and non-minimal equation of 27.a3 | Wrong lattice shifts height by log 2; model terminology corrected. |
| 2.6–2.7 | Products, principal polarization, toric reduction | Semistable integral comparison uses V.3.4; no false Cartier-kernel argument. |
| 2.8–2.9 | c>0 metric scaling, g=0, Δ of weight 12 | Normalization shifts and the squared Petersson term agree. |
| 2.10 | 11.a2, modular inversion, analytic/lattice discriminant conversion | Computed −0.3080098411184027 matches the listed −0.308009841118403…. |
| 2.11 | Elliptic principal self-pairing | Tensor squared norm is the fourth power of the one-line norm. |
| 3.1–3.2 | g=0, semistable model, two polarization choices | Height zero and polarization independence retained. |
| 3.3–3.4 | Semistable base change and additive quadratic twists | Lattice inclusion lowers height; stable height is field independent. |
| 3.5–3.6 | Powers, duals, 27.a3 at p=3 | Strict correction requires non-unit Lie determinant. |
| 4.1–4.2 | Identity, [n], ordinary μ_p and étale quotients, additive [p] | Fitting/annihilator distinction and opposite height changes verified. |
| 4.3 | Polarization, good reduction, toric and arbitrary number-field reduction | Squared map divided by d has unit norm; local proof inputs stated. |
| 4.4 | d=1 and d=p^n | Difference zero at d=1; sharp valuation range retained. |
| 4.5 | Full ℓ-divisible group at good reduction | Tower coefficient is g−g=0; shifted closure hypothesis retained. |
| 4.6–4.7 | E=ℚ, rank-zero CM component, ramified torsion, rational map | Torsion-free determinant and four freeness hypotheses retained. |
| 4.8 | Split quadratic case and non-monogenic residue products | Δ(Φ)=1 in rank one; freeness and monogenicity are explicit. |
| 5.1–5.2 | Bounded norm, −log|q|, power pole, zero/negative norms, boundary twist | Predicate controls inverse and positivity; fixed extension required. |
| 5.3 | One cusp and a cusp times a fixed elliptic curve | Bounded abelian block prevents a zero Gram determinant. |
| 5.4–5.6 | g=1 discriminant, toroidal contraction fibre, stack lift | (2π)^12 factor and normalized extension comparison agree. |
| 5.7 | g=1,r=2; Segre product; orthogonal (3,4)/5 matrix | Odd theta constant retained; arbitrary unitary height invariance rejected. |
| 5.8–5.9 | r=2 constants, 11.a2, j=0, sampled j=−1 envelope | Deligne normalization fixed; numerical sampling gives no optimum theorem. |
| 6.1–6.2 | g=0, E⁸, polarization degree d² | Zarhin quotient degree d^16/(d^8)^2=1; height factor 8. |
| 6.3–6.4 | g=1 torsion level 12; g=0 empty pairing; fine versus coarse moduli | GL₂(ℤ/12) order 4608; cyclotomic containment requires g≥1; no descent or algorithm asserted. |
| 6.5–6.6 | Elliptic minimum at j=0; lower bound and bad-prime threshold | Bost bound is weaker than elliptic minimum; global descent stays in R28. |

## Source access and inherited limits

The 17 public source PDFs were obtained at the versions in the packet and their
SHA-256 values matched its source-version records. Selected locators, especially
those supporting corrections, were read directly. Faltings–Chai was read only in
the maintainer-cleared copy, in place: I, Lemma 5.5, p. 29, and V, Lemma 3.4,
p. 166, Definitions 4.1–4.2/Remark 4.3, p. 167, Propositions 4.4–4.6,
pp. 168–169. No uncleared book copy was used. The LMFDB example was checked on
its public [11.a2 page](https://www.lmfdb.org/EllipticCurve/Q/11/a/2) and
independently recomputed using the q-products and its rational j-invariant.

This is not a claim that every primary proof behind every secondary citation
was read, or that the input's four source/dependency gaps have been closed:

- **G1:** Bost's numerical linear bound is cited as recorded in Pazuki Remark
  1.4 and Gaudron–Rémond §9. The primary Duke/report proof was not read.
  Existence and a non-sharp effective bound have the directly read
  Deligne/Faltings–Chai/Bost Bourbaki routes. Removed the erroneous claim of
  sharpness.
- **G2:** The elliptic period formula has its independent derivation and
  numerical check. Silverman's primary formulas and the primary
  Faisant–Philibert j-estimate were not read; the latter remains attributed
  through Gaudron–Rémond Lemma 7.9. Numerical envelopes are explicitly tests.
- **G3:** The package supplies a finite-residue-field proof plan as just
  described, including its additional targets. Bégueri's primary theory was
  not read or silently imported. The broader perfect-residue-field theorem is
  not promised by this number-field package.
- **G4:** Colmez's primary rank-one integral de Rham freeness result was not
  read. It is an explicit hypothesis of §4.8. Any CM Part II owner should prove
  that supplier theorem, rather than weakening the hypothesis here.

The inherited supplier needs remain explicit, with two now replaced by actual
current roadmap targets:

| Supplier | Contract and disposition |
|---|---|
| ShimuraCompactifications C5 | Level-one integral Siegel compactifications over all Spec ℤ, valuative stack lifts and descended ample power; retained with the same mathematical scope, independently worded. |
| AbelianSchemes A3 | Good translated theta basis with scalar/permutation/root-of-unity changes; corrected from the insufficient arbitrary-unitary formulation. |
| FiniteFlat R07.1 | Cartier-dual differential length identity at arbitrary ramification/exponent; not replaced by the tame p-torsion theorem. |
| NéronModels R11.3 | Strict non-unit Lie determinant after semistabilizing non-semistable reduction. |
| EllipticCurves 4.5a | Minimal discriminant tied to the Néron differential lattice and its scaling rule. |
| SchemeAndStackFoundations SF.3 | Resolved to current §§3.4–3.5, Picard/class-group comparison and lineBundleNorm. |
| SchemeAndStackFoundations SF.4 | Resolved to current §4.17 normal-crossings API, with reduced inverse-image boundary. |

## Validation and next step

- `lean-check research/blueprint/packages/ArakelovGeometryAndAbelianHeights/Suggested.lean`:
  **exit 0**, no errors, exactly 18 warnings, all `declaration uses sorry`, at
  pinned Mathlib. Memory was checked before each invocation; only one check ran
  at a time and no language server or other Lake operation was started.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ArakelovGeometryAndAbelianHeights.json`:
  **0 errors, 0 warnings** on the unchanged accepted input.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/ArakelovGeometryAndAbelianHeights/Suggested.lean`:
  **exit 0**, no offenders.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  **4 files, 0 problems**.
- Internal prerequisite audit: **no forward references**; all 55 topics,
  original 158 API entries and 84 named tests retained. Every definition topic
  has at least three discriminating checks; Zarhin's newly explicit interface
  has three additional checks.

The next step is independent package review and then the maintainer's upstream
decision. No package-writing task remains. Formal implementation of these
targets is future Tau Ceti work, not a claim made by this submission.
