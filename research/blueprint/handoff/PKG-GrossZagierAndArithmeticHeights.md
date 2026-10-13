# PKG-GrossZagierAndArithmeticHeights — completed package

Issue #9173; Codex (GPT-6), session `codex-dLsusU`; 13 October 2026.
The claim was confirmed by the swarm bot on comment 6156074639. This is the
package author's handoff, not an independent review. No second job was taken.

## Deliverables and coverage

The package consists of [README.md](../packages/GrossZagierAndArithmeticHeights/README.md),
[Suggested.lean](../packages/GrossZagierAndArithmeticHeights/Suggested.lean) and
[metadata.toml](../packages/GrossZagierAndArithmeticHeights/metadata.toml).
Both accepted inputs, `GrossZagierAndArithmeticHeights--GZ.0.json` (243 targets)
and `GrossZagierAndArithmeticHeights--GZ.8.json` (36 targets), were read without
editing them. The older assembled reader and Lean file were also inspected;
their long Lean development is not copied into the package.

The README accounts for all 279 input targets: 276 retained targets and three
existing-library definitions deleted, as listed below. All retained definition APIs and
235 original Checks survive, including the twelve Checks transferred from the
three deleted definitions to the version-normalization comparison. New controls
address weak admissibility, Laurent finite parts and characteristic dividing the
finite group order. The 69 retained input definition/construction families have
at least three discriminating prose Checks apiece. Weak admissibility is an
additional interface within the admissible-extension family. All ten layers,
worked examples, theorem hypotheses, source locators, direct prerequisite links
and the input supplier requests remain explicit. Repeated classical standing
hypotheses are factored into seven named settings, with extra restrictions kept
at their uses. The README has no packet/job/review fields or target tables.

The 157-line Suggested file contains seven real-bodied light definitions, five
milestone theorems and fourteen examples. The arithmetic carriers absent from the
pins are README targets, with their defining conditions and interfaces, and the
closing comment lists their intended names. It contains no sorry'd data,
proposition-valued substitute carrier, chains of auxiliary results or constructed
arithmetic measures. `metadata.toml` is exactly `topic = "math.NT"`.

| Layer | Retained targets |
| --- | ---: |
| 0 | 12 |
| 1 | 4 |
| 2 | 16 |
| 3 | 12 |
| 4 | 6 |
| 5 | 5 |
| 6 | 76 |
| 7 | 108 |
| 8 | 20 |
| 9 | 17 |

## Duplication and pinned-library evidence

The current TauCetiRoadmap READMEs and Suggested files were screened by objects,
operators and hypotheses, including the nine newer roadmaps AlgebraicVectorBundles,
DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory (including
its subroadmaps), OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and
RealAlgebraicGeometry, and Completed ContourIntegration, EffectiveBounds,
OrthogonalL2Bases and RestrictedProducts. EffectiveBounds and MultiquadraticExtensions
were read in full as shape examples, and the relevant EllipticCurves and
RestrictedProducts interfaces were read. General quadratic lattices, Clifford
structures, restricted products, curve/Jacobian moduli, real periods and de Rham
Poincaré duality remain imports; none is replanned as a height construction.

The current Tau Ceti a91d3aaf library was screened by mathematical objects as well
as names. The three duplicate targets are deleted, without removed-target stubs:

| Deleted input target | Existing owner | Replacement use |
| --- | --- | --- |
| `GZ.0/x-height-canonical-height` | `WeierstrassCurve.Affine.Point.canonicalHeight`, current `CanonicalHeight/Basic.lean` | 0.1 compares source and pin normalization; 0.2 adds rational scalar extension |
| `GZ.0/bsd-height-pairing` | `WeierstrassCurve.Affine.neronTatePairing` and `neronTatePairing_self` | 0.1 compares polarized conventions; Layer 1 adds a dual-abelian/coefficient-field domain |
| `GZ.0/bsd-regulator` | `MordellWeil/Regulator.lean`, `regulator_eq_abs_det_neronTateGramMatrix`, `regulator_eq_one_of_finrank_eq_zero` | 0.1 compares determinants, retaining rank-zero value 1 and all original Checks |

At f790474, `CanonicalHeight.lean` uses naiveHeight(2^n P)/(2·4^n);
at a91d3aaf, `CanonicalHeight/Basic.lean` uses naiveHeight(2^n P)/(4^n).
Both pins define the pairing by half-polarization. Thus the old pin supplies
h_(O), B_x/2 and Reg_x/2^r; the current library supplies h_x, B_x and Reg_x.
The regulator is present at **both** commits in `MordellWeil/Regulator.lean`.
The actual limit theorem is `tendsto_naiveHeight_two_pow_nsmul_div_four_pow`.
The package adds only this version comparison, not new height/pairing/regulator
implementations. Old API labels for BSD quantities in the comparison denote
these mathematical rescalings, not new constructor targets.

All 51 directly cited Mathlib prerequisite declarations were inspected through
`#check` against 082e2d37e8b0463410cdb532e111cd43d5a66174, including their exact
namespaces and assumptions. The Tau Ceti declarations were read from f790474
source: canonical height, quadratic and torsion APIs, Gram matrix/regulator,
Petersson integral and finite-index definiteness, old/new complements, newform
strong multiplicity one and mixed-place weak approximation. In particular the
Petersson pairing is conjugate-linear in the first argument, indexes cosets of
Γ.withCenter, and is not divided by quotient volume. Mathlib's Amice transform
and injectivity support general appropriate complete ultrametric coefficients;
`amiceTransformEquiv` is only the ℤ_p-coefficient equivalence. The larger
coefficient-ring surjectivity is explicitly requested, not attributed to that
pinned declaration. `Submodule.iInf` is not cited as a declaration; the complete
lattice operation supplies the intersection of kernels.

## Dependency order and ownership adjustments

The own-target graph was topologically sorted within layers. Every own-target
edge points to an earlier subsection or earlier layer. The following changes to
the accepted layer assignment are package-only; the input packets are untouched.

| Input target | Original layer | Package subsection | Reason |
| --- | ---: | --- | --- |
| `classical-rankin-normalization` | 0 | 6.22 | Its explicit formula consumes local kernels or differential periods |
| `classical-twist-real-period` | 0 | 3.12 | Its explicit formula consumes local kernels or differential periods |
| `classical-p-height-sum` | 2 | 7.92 | Its explicit formula consumes local kernels or differential periods |
| `classical-weight-two-central-value` | 5 | 6.67 | The analytic kernel must exist before its central-value specialization |
| `classical-central-value-endpoints` | 5 | 6.70 | The analytic kernel must exist before its central-value specialization |
| `classical-genus-sum-filter` | 5 | 6.71 | The analytic kernel must exist before its central-value specialization |
| `classical-definite-period-announcement` | 5 | 6.73 | The analytic kernel must exist before its central-value specialization |
| `classical-definite-square-class` | 5 | 6.75 | The analytic kernel must exist before its central-value specialization |
| `generating-series-arithmetic-theta-lifting-and-the-kernel-identity` | 6 | 8.1 | The projected comparison consumes local cancellation |
| `colmez-s2-assumption` | 7 | 6.7 | Auxiliary local data must precede the derivative that uses them |
| `colmez-test-function` | 7 | 6.21 | Auxiliary local data must precede the derivative that uses them |
| `colmez-norm-shells` | 7 | 6.37 | Auxiliary local data must precede the derivative that uses them |

GeneralizedHeegnerCycles' generic GH.1/GH.4 Abel–Jacobi comparison is consumed;
its GH.8 converse is only a downstream consumer. Likewise the low-layer
critical-value algebraicity contract is used rather than a final modular-symbol
p-adic L-function conclusion. These avoid the already-identified converse cycles.
FoundationsAndLibraryIntegration bookkeeping and UPSTREAM identifiers have been
resolved to genuine library/roadmap imports. The Carayol, CM, deformation,
measure, root-number and analytic suppliers are named with their exact added
contracts rather than treated as completed exports.

GrossZagierAndArithmeticHeights is not assigned a tier or bundle in the current
CaraianiNewton order file. That file cannot certify an invented lower-tier
position for this package or for its non-CN suppliers. The package remains an
atlas deliverable for independent review and the maintainer's upstream sequencing.
Its target-level order is acyclic. Three inherited extensions still need their
owners' Part II interfaces: semistable Coleman/Abel–Jacobi integration, integral
Jacquet–Langlands differential lattices, and abelian p-adic analytic subgroup
theorems. Nilpotent p-divisible deformation/endomorphism rigidity is also an
explicit R07.2 extension: perfect-field classification alone is insufficient.

## Mathematical corrections made while packaging

| Comparison | Correction and witness |
| --- | --- |
| Library heights | Factor 2 and determinant factor 2^r are pin-specific; current multipliers are 1. At rank zero both determinants are 1. |
| Colmez Green extension | The resolvent finite part has Hodge-line mean −1, so is weakly admissible. Mean-zero admissibility requires the constant correction. Degree-zero pairings kill a constant; positive-degree pairings do not. |
| Colmez Hodge expansion | Before both auxiliary split conditions, retain archimedean j = −½[F:ℚ]E* and all three Hodge cross terms. The final formula with finite j only is used after these vanish. |
| Derivative/Green comparison | Retain A(s)=Γ(2s+2)/((4π)^sΓ(s+2)); A(0)=1 and A′(0)=1−γ−log(4π). Finite part of (1+cs)(a/s+b) is b+ca. K−M = ½(γ+log(4π)−1)E* before auxiliary cancellation. |
| Resolvent variable | Classical Q_(s−1) is regularized at 1; Colmez Q_s is regularized at 0. The header no longer gives them the same variable. |
| Ramified BDP level | Restore 2^{#S_f}, S_f={ℓ dividing (N,D_K)} in the trivial-nebentypus case; this is separate from t_K. |
| Global sign | (gen-H) alone does not force sign −1. The 11a1, K=ℚ(√−11) example has two places in Σ and sign +1. Central vanishing is used only with the required local signs. |
| Multiplicative-prime scope | Read Castella §2.5 Theorems 2.10–2.11 directly: they give the unsquared p-new root and its Abel–Jacobi value; the residual assumptions of §3 start later. Do not infer a §2.5 residual hypothesis from the big-family theorem. Keep p≥5, semistability and the explicit semistable supplier. |
| Finite representation generality | Algebraic adapters work over any field. For C₃ acting trivially over 𝔽₃ the average is zero, not the identity on the fixed subspace. The arithmetic projector uses characteristic zero. |
| Euler numerator | 11a1 has #E(𝔽₅)=5 and #E(𝔽₂₃)=25. The curve y²=x³+3x over 𝔽₅ has ten points, so a₅=−4 and Euler factor 2 is another unit case. The p≥7 and p=5 ranges remain separate. |
| Source/prototype boundary | The square adapter consumes an existing root and normalization unit. Arbitrary power series and arbitrary ring maps establish no CM interpolation or boundedness. |

Items 62–63 in the **28 June 2026** YZZ author erratum are newer than the
accepted packet's Colmez comparison. They point to an older version of Yuan's
modular-heights paper. The new citation here is arXiv:2205.13995v3: §4.2;
Lemma 4.2, pp.63–66; Theorem 4.3 and Remark 4.4, pp.67–69; Proposition 4.5 and
Remark 4.6, pp.70–71. No theorem numbers were transferred between versions.
These are corrections to the package's formulations; they should be propagated
to the packet and assembled reader in an authorized follow-up, not by this job.

## Source checks and edition boundaries

The following primary passages were directly read in this session. This table
records statement/normalization checks and the mathematical input needed; it is
not a claim of a complete new verification of every proof in every source.

| Source actually read | Passage and check |
| --- | --- |
| Cai–Shu–Tian, arXiv:1408.1733v2 | §§1–3; explicit/global constants, local conductor conditions, relative Picard count and Lemma 2.3 completed-volume dictionary |
| Conrad, MSRI Publications 49 (2004), public SLMath PDF | §§9–10; Theorem 9.2, Theorem 9.6, Lemma 10.1 and Theorems 10.4–10.5; tensor versus coarse/modified intersections and tangent corrections |
| Gross–Zagier, Invent. Math. 84 (1986), public author scan | Classical kernel, Hom/tangent, Rankin and projection locators used in the package; OCR is poor, so the accepted sign corrections remain accompanied by exact printed locators |
| Yuan–Zhang, Annals 187 (2018), public published PDF | §§6–9; pseudo-theta cancellation, auxiliary split functions, Whittaker branches and local/global Colmez terms |
| YZZ author erratum, 28 June 2026 | All 64 items, especially measure/sign items and new items 62–63 |
| Yuan, modular heights, arXiv:2205.13995v3 | §4.2–§4.5, pp.58–71; weak admissibility, Hodge/Eisenstein correction and derivative finite-part comparison |
| Yuan, bigness, author manuscript 21 August 2024 | Appendix A, pp.102–119; admissible metric/Green conventions and the g=1 boundary |
| Česnavičius–Neururer–Saha, arXiv:1911.09446 | Introduction, Theorems 1.1–1.2 and the optimal semistable Manin input |
| Zhang, public 2010 CRM notes | Gross–Zagier normalization and the height/kernel proof route |
| Skinner, arXiv:1405.7294v1 | Height-average and logarithm/period dictionary; no reliance on the incorrectly printed e∞ identity |
| Jetchev–Skinner–Wan, arXiv:1512.06894v1 | §5.1, (5.1.a), Remark 5.1.1 and Proposition 5.1.6; character shift, Petersson ratio and good-prime Euler factor |
| Brooks, published IMRN (2015) public EPFL PDF | §6.4, p.4224; §§8.4–8.6, Propositions 8.10–8.13; correct filtered projector domain, squared logarithm and character field of definition |
| BDP, Duke (2013) public author PDF | §5.2, including the central-critical/tame branch and interpolation/logarithm conventions |
| Castella–Hsieh, arXiv:1505.08165v2 | §3.3, Definition 3.7 and Proposition 3.8; linear root, scalar and character normalization |
| Castella, arXiv:1507.04260v1 | §2.5, Theorems 2.10–2.11, pp.15–16, and the distinct later §3 residual assumptions |
| Castella, arXiv:1704.06608v2 | §3, Theorems 3.1–3.2; multiplicative p and period comparison range |
| Burungale, arXiv:1504.02342v1 | §5.2, Lemma 5.5 and (5.8); bounded CM measures precede their squares |
| Duke–Imamoğlu–Tóth, Annals 184 (2016) | §5 Theorem 4, pp.965–966, (5.16)–(5.17); 12π, both discriminant signs and unit half-weight norm |
| Burungale–Skinner–Wan, arXiv:2603.20886v2 | Theorems 1.1 and 2.8(i); degree/dimension, real-embedding and totally-real character hypotheses |

The private-library index does not supply a cleared YZZ 2013 book. No copy of
that book was obtained, copied or excerpted. The public 2011 draft fetch was
unavailable in this run, so its accepted-packet locator evidence is inherited,
not reported as a fresh read. The 2013 book, 2026 published bigness edition and
2023 published Colmez erratum remain distinct unread editions. The public
manuscripts actually used are named in the README. No primary-source passage or
book file enters the repository. A 12-word prose-window comparison against the
acquired public texts found only a bibliographic title match.

## Remaining proof and supplier work retained in the roadmap

These are limitations of mathematical source access or future formalization,
not unfinished package edits. They remain explicit named targets or contracts
in the README. An elaborating sorry file cannot discharge them.

1. **YZZ Picard modularity and bad-place comparisons:** public statements do
   not replace full correspondence/cusp, trace and approximation arguments.
2. **Arithmetic carriers:** genuine biextensions, metrized divisors, toric
   representations and curve models must come from their stated suppliers.
3. **Genus-one measure:** the g>1 dualizing-line argument cannot divide by
   2g−2 at g=1; use the separate degree-one/good/Tate construction.
4. **Tensor and modified intersections:** instantiate Conrad's coarse and
   integral deformation comparison with the real carriers, including v|6.
5. **Definite historical announcement:** prove the exact normalized theta
   coefficient comparison using the independent coherent toric identity.
6. **Half-weight proof:** obtain the local Baruch–Mao input, including 2-adic
   vectors and both signs; the DIT scalar identity alone is not its proof.
7. **Nilpotent deformation:** R07.2 must supply nilpotent p-divisible
   deformation and endomorphism-lifting rigidity, beyond perfect fields.
8. **Publication editions:** do not transfer author-version numbering to the
   unread publication editions identified above.
9. **Typed geometric realization:** run the mathematical Checks on genuine
   models once the exact supplier carriers exist; algebraic examples are not
   CM-point computations.
10. **Split Shimizu:** supply the exact (3,1) local/global normalized
    contraction; a regularized Siegel–Weil identity modulo residual image
    does not supply it automatically.
11. **YZZ projector:** the book proof of the T_alg reduction and equivalence
    with its Theorem 3.15 still requires the cleared source.
12. **Hermitian positivity:** construct the Rosati/conjugate-dual comparison
    for arbitrary finite characters in every coefficient embedding.
13. **Root normalization:** calculate the tame twist, reciprocity inversion,
    pushforward, group-like Iwasawa unit and scalar unit with fixed periods.
14. **Supplier Part II exports:** certify the three extension contracts and
    the precise lower-layer input applications listed above.
15. **Arithmetic theorem signatures:** the global height, toric nonvanishing,
    CM interpolation and Bloch–Kato/isogeny formulas await those carriers.
16. **Complete-DVR uniqueness:** prove bounded/convergent power-series
    uniqueness for the completed unramified coefficient DVR with infinite
    residue field; finite-residue preparation is not enough as quoted.
17. **Castella A′ range:** the broader BSD request allowing additive primes
    away from p and the erratum's ramification hypotheses is not inferred
    from the semistable optimal multiplicative-prime target.

## Author adversarial mathematics pass

Every retained statement, definition API and convention was considered at its
stated domain. The table below records the controls by target. For definitions,
its first discriminating input Check is a concise pointer to the fuller Checks
in the README; theorem families also use the computed controls in the next
paragraph. A control requiring a geometric supplier is a mathematical
consistency check, not an executed Lean test or proof certification. Source
and proof limitations are the seventeen items above. This author pass does not
replace the independent package review.

Concrete computations included: torsion and zero inputs; determinant of the
empty Gram matrix = 1; quadratic q=2 scaling = 4; double orbit of order 3
scaling = 1/9; C₃ over 𝔽₃ gives a zero average; C₃ over 𝔽₇ with ζ=2 gives
σ(1,2,4)=(4,1,2)=4(1,2,4), fixing the inverse character; D=−7,p=3 gives
3·23≡−1 mod7 whereas 3·11≠−1; point counts #11a1(𝔽₅)=5,
#11a1(𝔽₂₃)=25 and ten points on y²=x³+3x over 𝔽₅;
C_p=[[1,p^(−2)],[1,1]] has determinant 3/4 at p=2 and 24/25 at p=5,
while ν=0 gives the matrix [1]; Laurent (1+cs)(a/s+b) has finite part b+ca.
At local places q_v≥2, so q_v−1 and 1+q_v+q_v² are nonzero. Group/degree
normalizations divide positive finite orders/degrees, while normalized
Petersson quotients require nonzero forms or pairings. Genus, diagonal,
conductor, support and reduction assumptions are retained where each prevents
an undefined denominator or an invalid specialization. All generalities in
the light signatures are expressly distinguished from their arithmetic use.

| Target and package subsection | Control inspected / special instance | Result or restriction retained |
| --- | --- | --- |
| [0.1 `height-convention-dictionary`](../packages/GrossZagierAndArithmeticHeights/README.md#target-height-convention-dictionary) | Rank 0, torsion, q=2; order-three double average 1/9 | Pin factor 2^r and field/measure domains explicit |
| [0.2 `canonical-height-rational`](../packages/GrossZagierAndArithmeticHeights/README.md#target-canonical-height-rational) | canonicalHeightRat W (P ⊗ₜ (1/m : ℚ)) = P.canonicalHeight / m^2. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [0.3 `unitary-and-motivic-centres`](../packages/GrossZagierAndArithmeticHeights/README.md#target-unitary-and-motivic-centres) | L(1)=0; Γℂ(1)=1/π; N=1 | Completion constant is √N/π; N>0 and central zero retained |
| [0.4 `heegner-unit-index`](../packages/GrossZagierAndArithmeticHeights/README.md#target-heegner-unit-index) | unitIndex ℚ(√−1) = 2. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [0.5 `artin-map-convention`](../packages/GrossZagierAndArithmeticHeights/README.md#target-artin-map-convention) | Trivial action vs order-three character; inversion or signed input | Domain and direction stated explicitly |
| [0.6 `real-period-components`](../packages/GrossZagierAndArithmeticHeights/README.md#target-real-period-components) | Degree-d isogeny, differential doubled; nonoptimal 11a3 at p=5 | Nonzero differential, optimality and reduction range retained |
| [0.7 `root-number-and-measure-normalisation-corrections`](../packages/GrossZagierAndArithmeticHeights/README.md#target-root-number-and-measure-normalisation-corrections) | Trivial action vs order-three character; inversion or signed input | Domain and direction stated explicitly |
| [0.8 `classical-genus-character-factorization`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-genus-character-factorization) | Trivial action vs order-three character; inversion or signed input | Domain and direction stated explicitly |
| [0.9 `trace-versus-average`](../packages/GrossZagierAndArithmeticHeights/README.md#target-trace-versus-average) | Rank 0, torsion, q=2; order-three double average 1/9 | Pin factor 2^r and field/measure domains explicit |
| [0.10 `identity-rescaling`](../packages/GrossZagierAndArithmeticHeights/README.md#target-identity-rescaling) | Rank 0, torsion, q=2; order-three double average 1/9 | Pin factor 2^r and field/measure domains explicit |
| [0.11 `classical-relative-field-heights`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-relative-field-heights) | Torsion/zero input; dual sign; rational vs Hermitian self-pairing | Field degree, conjugation and positivity domain explicit |
| [0.12 `classical-cm-action-conventions`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-cm-action-conventions) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [1.1 `neron-tate-height-and-the-poincare-pairing`](../packages/GrossZagierAndArithmeticHeights/README.md#target-neron-tate-height-and-the-poincare-pairing) | h𝒫(0,y)=h𝒫(x,0)=0. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [1.2 `coefficient-valued-height`](../packages/GrossZagierAndArithmeticHeights/README.md#target-coefficient-valued-height) | For M=ℚ, H_M equals the scalar Poincaré pairing. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [1.3 `elliptic-poincare-comparison`](../packages/GrossZagierAndArithmeticHeights/README.md#target-elliptic-poincare-comparison) | Torsion/zero input; dual sign; rational vs Hermitian self-pairing | Field degree, conjugation and positivity domain explicit |
| [1.4 `character-height-pairing`](../packages/GrossZagierAndArithmeticHeights/README.md#target-character-height-pairing) | For χ=1 the pairing is the H_M pairing on G-invariants after scalar extension. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [2.1 `arithmetic-intersection-gluing`](../packages/GrossZagierAndArithmeticHeights/README.md#target-arithmetic-intersection-gluing) | An entire fibre has zero finite intersection with a degree-zero divisor. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [2.2 `arakelov-probability-form`](../packages/GrossZagierAndArithmeticHeights/README.md#target-arakelov-probability-form) | For g=2 each orthonormal summand contributes 1/2 to the mass. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [2.3 `graph-admissible-measure`](../packages/GrossZagierAndArithmeticHeights/README.md#target-graph-admissible-measure) | For one vertex of genus g and no edges, μ is that vertex’s Dirac mass and gμ=0. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [2.4 `archimedean-admissible-metric`](../packages/GrossZagierAndArithmeticHeights/README.md#target-archimedean-admissible-metric) | An admissible metric on a degree-zero bundle is flat. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [2.5 `explicit-skeleton-measure`](../packages/GrossZagierAndArithmeticHeights/README.md#target-explicit-skeleton-measure) | Degree-zero principal divisor; g=1; constant added to Green function | Product formula and weak/full admissibility separated |
| [2.6 `classical-local-intersection-height`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-local-intersection-height) | Degree-zero principal divisor; g=1; constant added to Green function | Product formula and weak/full admissibility separated |
| [2.7 `admissible-green-function`](../packages/GrossZagierAndArithmeticHeights/README.md#target-admissible-green-function) | A constant is an admissible Green function for D=0. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [2.8 `admissible-metric-existence`](../packages/GrossZagierAndArithmeticHeights/README.md#target-admissible-metric-existence) | Degree-zero principal divisor; g=1; constant added to Green function | Product formula and weak/full admissibility separated |
| [2.9 `normalized-arakelov-green`](../packages/GrossZagierAndArithmeticHeights/README.md#target-normalized-arakelov-green) | For a nonzero real c, gAr+c fails the mean-zero condition. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [2.10 `admissible-arithmetic-extension`](../packages/GrossZagierAndArithmeticHeights/README.md#target-admissible-arithmetic-extension) | The extension of zero is zero. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [2.11 `arakelov-dualizing-metric`](../packages/GrossZagierAndArithmeticHeights/README.md#target-arakelov-dualizing-metric) | For genus one its Chern form is zero. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [2.12 `classical-complex-height-symbol`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-complex-height-symbol) | Zero divisor has symbol zero. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [2.13 `hodge-index-theorem-and-admissible-arithmetic-extensions`](../packages/GrossZagierAndArithmeticHeights/README.md#target-hodge-index-theorem-and-admissible-arithmetic-extensions) | Degree-zero principal divisor; g=1; constant added to Green function | Product formula and weak/full admissibility separated |
| [2.14 `real-admissible-descent`](../packages/GrossZagierAndArithmeticHeights/README.md#target-real-admissible-descent) | A point and its conjugate have equal induced norms. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [2.15 `colmez-residue-line`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-residue-line) | Replacing local coordinate z by az+O(z²), a≠0, preserves the residue trivialization. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [2.16 `classical-archimedean-height-sum`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-archimedean-height-sum) | For h=1 the sum is one complex-place symbol. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [3.1 `normalised-hodge-class-and-xi-parametrised-realisation`](../packages/GrossZagierAndArithmeticHeights/README.md#target-normalised-hodge-class-and-xi-parametrised-realisation) | A component with Hodge degree d has normalized degree d/d=1. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [3.2 `rational-xi-realization`](../packages/GrossZagierAndArithmeticHeights/README.md#target-rational-xi-realization) | A constant map represents zero. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [3.3 `strict-gl2-realization`](../packages/GrossZagierAndArithmeticHeights/README.md#target-strict-gl2-realization) | Zero map vs nonconstant parametrization; degree-d composite | Positive Hodge degree, endomorphism field and dual domains retained |
| [3.4 `manin-constant`](../packages/GrossZagierAndArithmeticHeights/README.md#target-manin-constant) | For a nonconstant modular parametrization φ and n≠0, composition with [n] multiplies the Manin constant by n and the modular degree by n². The nonzero hypothesis keeps the composite nonconstant. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [3.5 `composition-pairing`](../packages/GrossZagierAndArithmeticHeights/README.md#target-composition-pairing) | The pairing is zero when either map is zero. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [3.6 `manin-integrality-and-p-unit`](../packages/GrossZagierAndArithmeticHeights/README.md#target-manin-integrality-and-p-unit) | Degree-d isogeny, differential doubled; nonoptimal 11a3 at p=5 | Nonzero differential, optimality and reduction range retained |
| [3.7 `manin-degree-divisibility`](../packages/GrossZagierAndArithmeticHeights/README.md#target-manin-degree-divisibility) | Degree-d isogeny, differential doubled; nonoptimal 11a3 at p=5 | Nonzero differential, optimality and reduction range retained |
| [3.8 `petersson-composition-comparison`](../packages/GrossZagierAndArithmeticHeights/README.md#target-petersson-composition-comparison) | Zero map vs nonconstant parametrization; degree-d composite | Positive Hodge degree, endomorphism field and dual domains retained |
| [3.9 `manin-isogeny-twist-transfer`](../packages/GrossZagierAndArithmeticHeights/README.md#target-manin-isogeny-twist-transfer) | Degree-d isogeny, differential doubled; nonoptimal 11a3 at p=5 | Nonzero differential, optimality and reduction range retained |
| [3.10 `classical-eigendifferential-period`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-eigendifferential-period) | Degree-d isogeny, differential doubled; nonoptimal 11a3 at p=5 | Nonzero differential, optimality and reduction range retained |
| [3.11 `classical-modular-period-degree`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-modular-period-degree) | Degree-d isogeny, differential doubled; nonoptimal 11a3 at p=5 | Nonzero differential, optimality and reduction range retained |
| [3.12 `classical-twist-real-period`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-twist-real-period) | Degree-d isogeny, differential doubled; nonoptimal 11a3 at p=5 | Nonzero differential, optimality and reduction range retained |
| [4.1 `toric-hom-space`](../packages/GrossZagierAndArithmeticHeights/README.md#target-toric-hom-space) | If χ(z)ωπ(z)≠1 for some central z, the Hom space is zero. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [4.2 `saito-tunnell-dichotomy-and-the-local-toric-functional`](../packages/GrossZagierAndArithmeticHeights/README.md#target-saito-tunnell-dichotomy-and-the-local-toric-functional) | Zero vector; spherical unramified vector; wrong character test line | No normalized division by zero; actual local representation required |
| [4.3 `normalized-toric-integral`](../packages/GrossZagierAndArithmeticHeights/README.md#target-normalized-toric-integral) | For unramified π,χ,K/F and unit-volume compact quotient, αv(f₁,f₂)=b_v(f₁,f₂) on spherical vectors. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [4.4 `admissible-toric-order`](../packages/GrossZagierAndArithmeticHeights/README.md#target-admissible-toric-order) | For n=c=0 take the maximal order with full 𝒪_K intersection. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [4.5 `unramified-toric-value`](../packages/GrossZagierAndArithmeticHeights/README.md#target-unramified-toric-value) | Zero vector; spherical unramified vector; wrong character test line | No normalized division by zero; actual local representation required |
| [4.6 `toric-test-vectors`](../packages/GrossZagierAndArithmeticHeights/README.md#target-toric-test-vectors) | Zero vector; spherical unramified vector; wrong character test line | No normalized division by zero; actual local representation required |
| [5.1 `coherent-quaternionic-specialization`](../packages/GrossZagierAndArithmeticHeights/README.md#target-coherent-quaternionic-specialization) | Zero vector and trivial finite torus orbit; double volume scaling | Split Shimizu input and probability/Tamagawa forms kept distinct |
| [5.2 `half-weight-waldspurger-value`](../packages/GrossZagierAndArithmeticHeights/README.md#target-half-weight-waldspurger-value) | Zero vector and trivial finite torus orbit; double volume scaling | Split Shimizu input and probability/Tamagawa forms kept distinct |
| [5.3 `waldspurger-period-formula-and-its-siegel-weil-proof`](../packages/GrossZagierAndArithmeticHeights/README.md#target-waldspurger-period-formula-and-its-siegel-weil-proof) | Degree-d isogeny, differential doubled; nonoptimal 11a3 at p=5 | Nonzero differential, optimality and reduction range retained |
| [5.4 `toric-period-nonvanishing`](../packages/GrossZagierAndArithmeticHeights/README.md#target-toric-period-nonvanishing) | Degree-d isogeny, differential doubled; nonoptimal 11a3 at p=5 | Nonzero differential, optimality and reduction range retained |
| [5.5 `finite-vector-variation`](../packages/GrossZagierAndArithmeticHeights/README.md#target-finite-vector-variation) | Zero vector and trivial finite torus orbit; double volume scaling | Split Shimizu input and probability/Tamagawa forms kept distinct |
| [6.1 `special-correspondence-cycle`](../packages/GrossZagierAndArithmeticHeights/README.md#target-special-correspondence-cycle) | At x=1 the cycle is the diagonal with its proper multiplicity. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [6.2 `cm-degree-zero-class`](../packages/GrossZagierAndArithmeticHeights/README.md#target-cm-degree-zero-class) | 1−1=0 on the point’s component and zero on all others. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [6.3 `colmez-pseudo-theta`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-pseudo-theta) | For V₀=∅ the inner theta is zero; for V₀={0} it is the zero-vector theta term. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [6.4 `mixed-theta-eisenstein`](../packages/GrossZagierAndArithmeticHeights/README.md#target-mixed-theta-eisenstein) | For φ=0 the meromorphic family is zero. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [6.5 `colmez-whittaker`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-whittaker) | At standard almost-all-place data W°₀,v(s,g,u)=δv(g)⁻s r(g)φ₂,v(0,u). | Full discriminating Checks retained; actual arithmetic carriers are required |
| [6.6 `colmez-torus-average`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-torus-average) | The average of 1 is 1 even when ∣C_U∣>1. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [6.7 `colmez-s2-assumption`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-s2-assumption) | The zero local function satisfies full Weil-orbit vanishing. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [6.8 `classical-partial-rankin-series`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-partial-rankin-series) | Σ_A L_A=L(f,1_K,s). | Full discriminating Checks retained; actual arithmetic carriers are required |
| [6.9 `classical-height-series-cuspidality`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-height-series-cuspidality) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.10 `classical-trace-adjunction`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-trace-adjunction) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.11 `classical-prime-to-level-detection`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-prime-to-level-detection) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.12 `classical-eisenstein-transformation`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-eisenstein-transformation) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.13 `classical-ramified-theta-reindexing`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-ramified-theta-reindexing) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.14 `classical-genus-sign-function`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-genus-sign-function) | If l∣D divides both d and n/d, the sign is zero. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [6.15 `classical-different-reindexing`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-different-reindexing) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.16 `classical-eisenstein-mellin-asymptotics`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-eisenstein-mellin-asymptotics) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.17 `classical-cusp-matrix-inverse`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-cusp-matrix-inverse) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.18 `picard-generating-series`](../packages/GrossZagierAndArithmeticHeights/README.md#target-picard-generating-series) | Zero Schwartz input gives the zero series. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [6.19 `incoherent-central-derivative`](../packages/GrossZagierAndArithmeticHeights/README.md#target-incoherent-central-derivative) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.20 `colmez-pseudo-comparison`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-pseudo-comparison) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [6.21 `colmez-test-function`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-test-function) | For N_v=2, the second auxiliary term has coefficient −1/7. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [6.22 `classical-rankin-normalization`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-rankin-normalization) | Trivial action vs order-three character; inversion or signed input | Domain and direction stated explicitly |
| [6.23 `classical-absolute-convergence`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-absolute-convergence) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.24 `classical-disjointness`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-disjointness) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.25 `classical-rankin-unfolding`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-rankin-unfolding) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.26 `classical-mobius-level-decomposition`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-mobius-level-decomposition) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.27 `classical-rankin-kernel`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-rankin-kernel) | For N=1 the trace still runs from level ∣D∣ to 1. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [6.28 `classical-trace-coset-classification`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-trace-coset-classification) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.29 `classical-eisenstein-combination`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-eisenstein-combination) | A prime discriminant gives two ordered terms. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [6.30 `classical-genus-sign-reversal`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-genus-sign-reversal) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.31 `classical-signed-divisor-sums`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-signed-divisor-sums) | σ′_A(1)=0 because log1=0. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [6.32 `classical-sign-multiplicativity`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-sign-multiplicativity) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.33 `classical-boundary-eisenstein-cusps`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-boundary-eisenstein-cusps) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.34 `arithmetic-height-kernel`](../packages/GrossZagierAndArithmeticHeights/README.md#target-arithmetic-height-kernel) | A zero normalized CM class gives zero kernel. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [6.35 `arithmetic-theta-lifting`](../packages/GrossZagierAndArithmeticHeights/README.md#target-arithmetic-theta-lifting) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.36 `colmez-pseudo-automorphic`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-pseudo-automorphic) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [6.37 `colmez-norm-shells`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-norm-shells) | For v(ad)=0 the only possible nonnegative shell is n=0. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [6.38 `classical-rankin-kernel-pairing`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-rankin-kernel-pairing) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.39 `classical-kernel-u-formula`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-kernel-u-formula) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.40 `classical-prime-eisenstein-combination`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-prime-eisenstein-combination) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.41 `classical-eisenstein-zero-coefficient`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-eisenstein-zero-coefficient) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.42 `classical-eisenstein-nonzero-coefficient`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-eisenstein-nonzero-coefficient) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.43 `classical-genus-sigma-identity`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-genus-sigma-identity) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.44 `classical-boundary-eisenstein-orthogonality`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-boundary-eisenstein-orthogonality) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.45 `classical-projection-boundary-coefficients`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-projection-boundary-coefficients) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.46 `colmez-pseudo-weight-cancel`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-pseudo-weight-cancel) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [6.47 `colmez-local-k-c`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-local-k-c) | Both corrections vanish for the zero Schwartz function. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [6.48 `colmez-series-automorphy`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-series-automorphy) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [6.49 `colmez-rev-local-whittaker-series-for-incoherent`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-rev-local-whittaker-series-for-incoherent) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [6.50 `colmez-rev-hodge-class-terms-vanish-and`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-rev-hodge-class-terms-vanish-and) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [6.51 `classical-kernel-fourier-expansion`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-kernel-fourier-expansion) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.52 `classical-logarithmic-prime-decomposition`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-logarithmic-prime-decomposition) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.53 `classical-holomorphic-projection`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-holomorphic-projection) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.54 `colmez-projected-derivative`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-projected-derivative) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [6.55 `colmez-rev-derivative-of-the-mixed-theta`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-rev-derivative-of-the-mixed-theta) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [6.56 `classical-kernel-meromorphic-continuation`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-kernel-meromorphic-continuation) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.57 `classical-prime-coefficient-parity`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-prime-coefficient-parity) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.58 `classical-single-prime-logarithm`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-single-prime-logarithm) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.59 `colmez-rev-archimedean-holomorphic-projection-of-log`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-rev-archimedean-holomorphic-projection-of-log) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [6.60 `classical-integral-kernel-values`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-integral-kernel-values) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.61 `classical-coefficient-functional-equation`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-coefficient-functional-equation) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.62 `classical-central-kernel-holomorphy`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-central-kernel-holomorphy) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.63 `classical-l-functional-equation`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-l-functional-equation) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.64 `classical-central-value-kernel`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-central-value-kernel) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.65 `classical-central-derivative-kernel`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-central-derivative-kernel) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.66 `classical-entire-functional-equation`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-entire-functional-equation) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.67 `classical-weight-two-central-value`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-weight-two-central-value) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.68 `classical-rankin-cusp-constants`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-rankin-cusp-constants) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.69 `classical-rankin-mellin-regularization`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-rankin-mellin-regularization) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.70 `classical-central-value-endpoints`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-central-value-endpoints) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.71 `classical-genus-sum-filter`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-genus-sum-filter) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.72 `classical-rankin-boundary-coefficients`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-rankin-boundary-coefficients) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.73 `classical-definite-period-announcement`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-definite-period-announcement) | Degree-d isogeny, differential doubled; nonoptimal 11a3 at p=5 | Nonzero differential, optimality and reduction range retained |
| [6.74 `classical-projected-derivative-cuspform`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-projected-derivative-cuspform) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.75 `classical-definite-square-class`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-definite-square-class) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [6.76 `classical-projected-derivative-coefficients`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-projected-derivative-coefficients) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [7.1 `degenerate-schwartz-classes`](../packages/GrossZagierAndArithmeticHeights/README.md#target-degenerate-schwartz-classes) | The zero function belongs to both subspaces. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.2 `nearby-coherent-orthogonality`](../packages/GrossZagierAndArithmeticHeights/README.md#target-nearby-coherent-orthogonality) | Zero Schwartz function; incoherent vs switched coherent data | Support and nearby-algebra orthogonality hypotheses retained |
| [7.3 `colmez-order-sandwich`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-order-sandwich) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.4 `colmez-shell-inert`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-shell-inert) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.5 `colmez-shell-ramified`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-shell-ramified) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.6 `colmez-c-arch`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-c-arch) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.7 `colmez-c-finite`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-c-finite) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.8 `colmez-arch-green`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-arch-green) | At s=0, Q₀(t)=½log((t+1)/(t−1)) for t>1. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.9 `colmez-finite-multiplicity`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-finite-multiplicity) | For r=1,v(b)=0 the upper-unipotent multiplicity is 1/(N_v−1). | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.10 `colmez-superspecial-m`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-superspecial-m) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.11 `colmez-vertical-split-zero`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-vertical-split-zero) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.12 `colmez-nonzero-theta`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-nonzero-theta) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.13 `colmez-rev-archimedean-derivative-kernel`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-rev-archimedean-derivative-kernel) | For λ=−1, k_v,0=½log2. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.14 `classical-height-green-characterization`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-height-green-characterization) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.15 `classical-resolvent-kernel`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-resolvent-kernel) | z′=γz is outside the unregularized kernel domain. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.16 `classical-cm-eisenstein-sum`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-cm-eisenstein-sum) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.17 `classical-tangent-symbol`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-tangent-symbol) | If x occurs twice in T_mx^σ subtract 2log∣g∣, not log∣g∣. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.18 `classical-eta-tangent`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-eta-tangent) | For u=1, dg at x equals ω. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.19 `classical-supersingular-eichler-order`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-supersingular-eichler-order) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.20 `classical-level-reduction-component`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-level-reduction-component) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.21 `classical-half-hom-count`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-half-hom-count) | An empty Hom degree fibre gives zero. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.22 `classical-new-hom-set`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-new-hom-set) | A split prime contributes no new CM maps. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.23 `good-local-arithmetic-identity`](../packages/GrossZagierAndArithmeticHeights/README.md#target-good-local-arithmetic-identity) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.24 `colmez-k-inert`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-k-inert) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.25 `colmez-k-ramified`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-k-ramified) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.26 `colmez-omega-self`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-omega-self) | At an E-split finite place the extended local diagonal is zero. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.27 `colmez-nonsplit-proper`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-nonsplit-proper) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.28 `colmez-ordinary-pairing`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-ordinary-pairing) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.29 `colmez-local-m-division`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-local-m-division) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.30 `colmez-vertical-pseudo`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-vertical-pseudo) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.31 `colmez-adjunction-arch`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-adjunction-arch) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.32 `colmez-small-level-diagonal`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-small-level-diagonal) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.33 `colmez-rev-corrected-cm-multiplicity-at-split`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-rev-corrected-cm-multiplicity-at-split) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.34 `classical-resolvent-residue`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-resolvent-residue) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.35 `classical-hecke-kernel-action`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-hecke-kernel-action) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.36 `classical-tangent-product-formula`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-tangent-product-formula) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.37 `classical-complex-tangent-asymptotic`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-complex-tangent-asymptotic) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.38 `classical-degree-one-intersection`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-degree-one-intersection) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.39 `classical-inert-order-model`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-inert-order-model) | D=−7,p=3,N=2 permits q=23, since −69≡1 mod7. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.40 `classical-component-orthogonality`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-component-orthogonality) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.41 `classical-prime-to-p-hom-count`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-prime-to-p-hom-count) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.42 `classical-isomorphism-intersection-count`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-isomorphism-intersection-count) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.43 `classical-split-vanishing`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-split-vanishing) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.44 `classical-endomorphism-congruence-order`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-endomorphism-congruence-order) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.45 `classical-self-intersection-tangent`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-self-intersection-tangent) | A tangent basis has self-intersection zero. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.46 `degenerate-schwartz-functions-local-decomposition-and-approximation`](../packages/GrossZagierAndArithmeticHeights/README.md#target-degenerate-schwartz-functions-local-decomposition-and-approximation) | Zero Schwartz function; incoherent vs switched coherent data | Support and nearby-algebra orthogonality hypotheses retained |
| [7.47 `colmez-arch-proper`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-arch-proper) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.48 `colmez-split-proper`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-split-proper) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.49 `colmez-local-m-inert`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-local-m-inert) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.50 `colmez-local-m-ramified`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-local-m-ramified) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.51 `colmez-local-n`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-local-n) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.52 `colmez-modified-projection`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-modified-projection) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.53 `classical-cusp-expansion`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-cusp-expansion) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.54 `classical-hecke-green-kernel`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-hecke-green-kernel) | The identity correspondence returns the original kernel. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.55 `classical-norm-one-generators`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-norm-one-generators) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.56 `classical-finite-intersection-height`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-finite-intersection-height) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.57 `classical-hom-intersection-count`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-hom-intersection-count) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.58 `classical-hom-quaternion-realization`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-hom-quaternion-realization) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.59 `classical-j-tangent-values`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-j-tangent-values) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.60 `classical-inert-hom-lattice`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-inert-hom-lattice) | 𝔟=O recovers the simpler inert-order lattice. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.61 `classical-ramified-order-model`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-ramified-order-model) | The congruence has α≡(−1)^ord𝔣(𝔟)β; omission of β does not define the claimed lattice. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.62 `cm-tensor-stabilizer-height`](../packages/GrossZagierAndArithmeticHeights/README.md#target-cm-tensor-stabilizer-height) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.63 `boundary-cusp-correction`](../packages/GrossZagierAndArithmeticHeights/README.md#target-boundary-cusp-correction) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.64 `colmez-height-decomposition-series`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-height-decomposition-series) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.65 `colmez-local-cancel-split`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-local-cancel-split) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.66 `colmez-adjunction-finite`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-adjunction-finite) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.67 `classical-marked-green-kernel`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-marked-green-kernel) | The four residues sum κ−κ−κ+κ=0. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.68 `classical-atkin-lehner-invariance`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-atkin-lehner-invariance) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.69 `classical-cm-kernel-invariants`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-cm-kernel-invariants) | For prime ∣D∣ each nonempty refined sum has one class pair. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.70 `classical-diagonal-green-kernel`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-diagonal-green-kernel) | If r_A(m)=0 no finite-part term occurs. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.71 `classical-inert-disjoint-intersection`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-inert-disjoint-intersection) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.72 `classical-ramified-disjoint-intersection`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-ramified-disjoint-intersection) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.73 `classical-new-automorphism-length`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-new-automorphism-length) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.74 `classical-inert-norm-ideal-map`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-inert-norm-ideal-map) | b₋≠0 implies N𝔠′>0, so the finite sum excludes n=0. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.75 `classical-modified-intersection`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-modified-intersection) | If every reduction automorphism lifts to W, the modified self-value is zero. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.76 `colmez-kernel-schwartz`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-kernel-schwartz) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.77 `colmez-arithmetic-adjunction`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-arithmetic-adjunction) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.78 `classical-green-constant`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-green-constant) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.79 `classical-cm-genus-orbits`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-cm-genus-orbits) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.80 `classical-hyperbolic-norm-parameter`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-hyperbolic-norm-parameter) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.81 `classical-renormalized-self-value`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-renormalized-self-value) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.82 `classical-new-hom-intersection`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-new-hom-intersection) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.83 `classical-inert-unit-count`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-inert-unit-count) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.84 `classical-tensor-global-decomposition`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-tensor-global-decomposition) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.85 `colmez-local-cancel-nonsplit`](../packages/GrossZagierAndArithmeticHeights/README.md#target-colmez-local-cancel-nonsplit) | q=2, unit/off-support input, zero-index branch and omitted diagonal | Wild different, two auxiliary places and finite-part correction retained |
| [7.86 `classical-archimedean-height`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-archimedean-height) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.87 `classical-pair-count`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-pair-count) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.88 `classical-inert-total-intersection`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-inert-total-intersection) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.89 `classical-ramified-total-intersection`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-ramified-total-intersection) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.90 `classical-split-total-intersection`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-split-total-intersection) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.91 `classical-level-intersection`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-level-intersection) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.92 `classical-p-height-sum`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-p-height-sum) | For inert p, each q_v=p² and there are h places of H above p. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [7.93 `classical-hecke-archimedean-height`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-hecke-archimedean-height) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.94 `classical-ramified-congruence-count`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-ramified-congruence-count) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.95 `classical-diagonal-archimedean-height`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-diagonal-archimedean-height) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.96 `classical-split-height-sum`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-split-height-sum) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.97 `classical-inert-height-sum`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-inert-height-sum) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.98 `classical-ramified-height-sum`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-ramified-height-sum) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.99 `classical-prime-discriminant-count`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-prime-discriminant-count) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.100 `classical-genus-pair-count`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-genus-pair-count) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.101 `classical-finite-height-sum`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-finite-height-sum) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.102 `classical-genus-kernel-evaluation`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-genus-kernel-evaluation) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.103 `classical-orbit-kernel-evaluation`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-orbit-kernel-evaluation) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.104 `classical-genus-character-filter`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-genus-character-filter) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.105 `classical-self-value-orbit-sum`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-self-value-orbit-sum) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.106 `classical-disjoint-archimedean-sum`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-disjoint-archimedean-sum) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.107 `classical-total-archimedean-formula`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-total-archimedean-formula) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [7.108 `classical-global-local-archimedean-sum`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-global-local-archimedean-sum) | Split/inert/ramified prime; b₋=0; D=−7,p=3,q=23 vs 11 | Diagonal excluded; marked-cusp N>1 and exact norm/congruence range retained |
| [8.1 `generating-series-arithmetic-theta-lifting-and-the-kernel-identity`](../packages/GrossZagierAndArithmeticHeights/README.md#target-generating-series-arithmetic-theta-lifting-and-the-kernel-identity) | k=1, N=1 or p, n of both signs; ν=0 boundary matrix [1] | Signed coefficients, zero branch, growth and derivative decay kept explicit |
| [8.2 `chi-isotypic-mordell-weil-space`](../packages/GrossZagierAndArithmeticHeights/README.md#target-chi-isotypic-mordell-weil-space) | For χ = 1 the χ-isotypic subspace is the space of vectors fixed by every σ_t (A(1) = A(K)_ℚ ⊗_M L). | Full discriminating Checks retained; actual arithmetic carriers are required |
| [8.3 `essential-case-root-number`](../packages/GrossZagierAndArithmeticHeights/README.md#target-essential-case-root-number) | χ=1 and order-three χ; zero/torsion point; gen-H sign +1 witness | Dual inverse character, local signs and completed constants retained |
| [8.4 `petersson-norm-and-parametrisation-degree`](../packages/GrossZagierAndArithmeticHeights/README.md#target-petersson-norm-and-parametrisation-degree) | χ=1 and order-three χ; zero/torsion point; gen-H sign +1 witness | Dual inverse character, local signs and completed constants retained |
| [8.5 `admissible-order-test-vector`](../packages/GrossZagierAndArithmeticHeights/README.md#target-admissible-order-test-vector) | For K=ℚ(√−7), N=11, c=1, the image !![1,−1;22,−8] of (−7+√−7)/2 has lower-left entry divisible by 11 and satisfies X²+7X+14=0. This tests the explicit embedding fragment. Full admissibility and its CM-point identification require the actual CST order/curve supplier and are recorded as a gap. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [8.6 `coefficient-identity`](../packages/GrossZagierAndArithmeticHeights/README.md#target-coefficient-identity) | χ=1 and order-three χ; zero/torsion point; gen-H sign +1 witness | Dual inverse character, local signs and completed constants retained |
| [8.7 `l-linear-neron-tate-pairing`](../packages/GrossZagierAndArithmeticHeights/README.md#target-l-linear-neron-tate-pairing) | If M = L = ℚ the coefficient pairing equals the ℚ-bilinear Néron–Tate pairing (the trace is the identity). | Full discriminating Checks retained; actual arithmetic carriers are required |
| [8.8 `chi-heegner-point`](../packages/GrossZagierAndArithmeticHeights/README.md#target-chi-heegner-point) | For G trivial, P⁰_χ(x) = x. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [8.9 `toric-integral-versus-finite-sum`](../packages/GrossZagierAndArithmeticHeights/README.md#target-toric-integral-versus-finite-sum) | χ=1 and order-three χ; zero/torsion point; gen-H sign +1 witness | Dual inverse character, local signs and completed constants retained |
| [8.10 `heegner-functional-equivariance`](../packages/GrossZagierAndArithmeticHeights/README.md#target-heegner-functional-equivariance) | χ=1 and order-three χ; zero/torsion point; gen-H sign +1 witness | Dual inverse character, local signs and completed constants retained |
| [8.11 `general-quaternionic-gross-zagier-identity`](../packages/GrossZagierAndArithmeticHeights/README.md#target-general-quaternionic-gross-zagier-identity) | χ=1 and order-three χ; zero/torsion point; gen-H sign +1 witness | Dual inverse character, local signs and completed constants retained |
| [8.12 `vacuous-case`](../packages/GrossZagierAndArithmeticHeights/README.md#target-vacuous-case) | Zero vector; spherical unramified vector; wrong character test line | No normalized division by zero; actual local representation required |
| [8.13 `nonvanishing-criterion`](../packages/GrossZagierAndArithmeticHeights/README.md#target-nonvanishing-criterion) | Torsion/zero input; dual sign; rational vs Hermitian self-pairing | Field degree, conjugation and positivity domain explicit |
| [8.14 `explicit-gross-zagier-formula`](../packages/GrossZagierAndArithmeticHeights/README.md#target-explicit-gross-zagier-formula) | χ=1 and order-three χ; zero/torsion point; gen-H sign +1 witness | Dual inverse character, local signs and completed constants retained |
| [8.15 `classical-gross-zagier-formula`](../packages/GrossZagierAndArithmeticHeights/README.md#target-classical-gross-zagier-formula) | χ=1 and order-three χ; zero/torsion point; gen-H sign +1 witness | Dual inverse character, local signs and completed constants retained |
| [8.16 `explicit-formula-variation`](../packages/GrossZagierAndArithmeticHeights/README.md#target-explicit-formula-variation) | χ=1 and order-three χ; zero/torsion point; gen-H sign +1 witness | Dual inverse character, local signs and completed constants retained |
| [8.17 `rational-shimura-curve-heegner-formula`](../packages/GrossZagierAndArithmeticHeights/README.md#target-rational-shimura-curve-heegner-formula) | χ=1 and order-three χ; zero/torsion point; gen-H sign +1 witness | Dual inverse character, local signs and completed constants retained |
| [8.18 `totally-real-trace-point-nontorsion`](../packages/GrossZagierAndArithmeticHeights/README.md#target-totally-real-trace-point-nontorsion) | χ=1 and order-three χ; zero/torsion point; gen-H sign +1 witness | Dual inverse character, local signs and completed constants retained |
| [8.19 `elliptic-curve-heegner-height-formula`](../packages/GrossZagierAndArithmeticHeights/README.md#target-elliptic-curve-heegner-height-formula) | χ=1 and order-three χ; zero/torsion point; gen-H sign +1 witness | Dual inverse character, local signs and completed constants retained |
| [8.20 `derivative-corollaries`](../packages/GrossZagierAndArithmeticHeights/README.md#target-derivative-corollaries) | χ=1 and order-three χ; zero/torsion point; gen-H sign +1 witness | Dual inverse character, local signs and completed constants retained |
| [9.1 `petersson-norm-ratio`](../packages/GrossZagierAndArithmeticHeights/README.md#target-petersson-norm-ratio) | α(f, f) = 1 when the quaternion algebra is split (N⁻ = 1). | Full discriminating Checks retained; actual arithmetic carriers are required |
| [9.2 `euler-factor-at-bdp-point`](../packages/GrossZagierAndArithmeticHeights/README.md#target-euler-factor-at-bdp-point) | a_p=0, p=5 a_p=−4; differential doubled; trivial tame branch | Squares, good vs multiplicative reduction, units and eigenlog hypotheses retained |
| [9.3 `weight-two-abel-jacobi-is-logarithm`](../packages/GrossZagierAndArithmeticHeights/README.md#target-weight-two-abel-jacobi-is-logarithm) | a_p=0, p=5 a_p=−4; differential doubled; trivial tame branch | Squares, good vs multiplicative reduction, units and eigenlog hypotheses retained |
| [9.4 `quaternionic-cm-waldspurger-formula`](../packages/GrossZagierAndArithmeticHeights/README.md#target-quaternionic-cm-waldspurger-formula) | a_p=0, p=5 a_p=−4; differential doubled; trivial tame branch | Squares, good vs multiplicative reduction, units and eigenlog hypotheses retained |
| [9.5 `isogeny-and-differential-compatibility`](../packages/GrossZagierAndArithmeticHeights/README.md#target-isogeny-and-differential-compatibility) | a_p=0, p=5 a_p=−4; differential doubled; trivial tame branch | Squares, good vs multiplicative reduction, units and eigenlog hypotheses retained |
| [9.6 `quaternionic-bdp-construction`](../packages/GrossZagierAndArithmeticHeights/README.md#target-quaternionic-bdp-construction) | For class number one the sum has one term, so L_p(f, χ) = (θ^j f_B^♭(A, t, ω̂))². | Full discriminating Checks retained; actual arithmetic carriers are required |
| [9.7 `multiplicative-prime-formula`](../packages/GrossZagierAndArithmeticHeights/README.md#target-multiplicative-prime-formula) | a_p=0, p=5 a_p=−4; differential doubled; trivial tame branch | Squares, good vs multiplicative reduction, units and eigenlog hypotheses retained |
| [9.8 `eigenlogarithm-nonvanishing`](../packages/GrossZagierAndArithmeticHeights/README.md#target-eigenlogarithm-nonvanishing) | a_p=0, p=5 a_p=−4; differential doubled; trivial tame branch | Squares, good vs multiplicative reduction, units and eigenlog hypotheses retained |
| [9.9 `bdp-p-adic-l-function`](../packages/GrossZagierAndArithmeticHeights/README.md#target-bdp-p-adic-l-function) | Evaluation at T = 0 (the trivial character) is the constant coefficient of the power series. | Full discriminating Checks retained; actual arithmetic carriers are required |
| [9.10 `quaternionic-weight-two-formula`](../packages/GrossZagierAndArithmeticHeights/README.md#target-quaternionic-weight-two-formula) | a_p=0, p=5 a_p=−4; differential doubled; trivial tame branch | Squares, good vs multiplicative reduction, units and eigenlog hypotheses retained |
| [9.11 `bdp-weight-two-heegner-formula`](../packages/GrossZagierAndArithmeticHeights/README.md#target-bdp-weight-two-heegner-formula) | a_p=0, p=5 a_p=−4; differential doubled; trivial tame branch | Squares, good vs multiplicative reduction, units and eigenlog hypotheses retained |
| [9.12 `p-optimal-quotient-formula`](../packages/GrossZagierAndArithmeticHeights/README.md#target-p-optimal-quotient-formula) | a_p=0, p=5 a_p=−4; differential doubled; trivial tame branch | Squares, good vs multiplicative reduction, units and eigenlog hypotheses retained |
| [9.13 `bdp-square-root-comparison`](../packages/GrossZagierAndArithmeticHeights/README.md#target-bdp-square-root-comparison) | a_p=0, p=5 a_p=−4; differential doubled; trivial tame branch | Squares, good vs multiplicative reduction, units and eigenlog hypotheses retained |
| [9.14 `logarithm-detects-heegner-point`](../packages/GrossZagierAndArithmeticHeights/README.md#target-logarithm-detects-heegner-point) | a_p=0, p=5 a_p=−4; differential doubled; trivial tame branch | Squares, good vs multiplicative reduction, units and eigenlog hypotheses retained |
| [9.15 `bloch-kato-logarithm-of-heegner-class`](../packages/GrossZagierAndArithmeticHeights/README.md#target-bloch-kato-logarithm-of-heegner-class) | a_p=0, p=5 a_p=−4; differential doubled; trivial tame branch | Squares, good vs multiplicative reduction, units and eigenlog hypotheses retained |
| [9.16 `bdp-measure-integrality`](../packages/GrossZagierAndArithmeticHeights/README.md#target-bdp-measure-integrality) | a_p=0, p=5 a_p=−4; differential doubled; trivial tame branch | Squares, good vs multiplicative reduction, units and eigenlog hypotheses retained |
| [9.17 `imprimitive-function-dictionary`](../packages/GrossZagierAndArithmeticHeights/README.md#target-imprimitive-function-dictionary) | a_p=0, p=5 a_p=−4; differential doubled; trivial tame branch | Squares, good vs multiplicative reduction, units and eigenlog hypotheses retained |

The conventions are additionally witnessed by the Layer Examples: u=1,2,3;
full real period factor 1 or 2; local eta(−1) sign flip; genus-one circle vs
bridge; torus volume vs its square; old/current height multiplier; ψ₂ at the
auxiliary split place with n≠0, c=2n log q but d=0; signed σ(3)=0 and σ(−3)=2
for D=−3; and a negative finite Weil-index product giving a nonzero constant
of negative sign. No positivity of that Weil-index product is assumed.

## Validation and next step

- `python3 scripts/check_blueprint.py` on each accepted input: exit 0,
  zero errors and zero warnings (243 and 36 targets respectively).
- `lean-check research/blueprint/packages/GrossZagierAndArithmeticHeights/Suggested.lean`:
  exit 0 against Mathlib 082e2d3 at the provided shared pinned build; only
  declaration-uses-sorry warnings. No Tau Ceti import is needed by the kept
  representative signatures. The source comparisons above were read at
  Tau Ceti f790474 and a91d3aaf without running Lake in the read-only checkout.
- Coverage: 279 inputs = 276 retained + 3 cited library deletions; 69 retained
  definition/construction families; 276 distinct anchors; 916 internal links,
  all resolved; every own-target edge precedes its consumer. Every named Lean
  definition/theorem is named in the README. Heavy definitions are in the
  closing comment, including the weak-admissibility interface.
- Public-source own-prose check: only a bibliography-title 12-word match;
  no deposited source excerpts or source files.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  four files, zero problems. The final staged whitespace check also passed.

No package edit remains. The next step is the independent REV-PKG job, with
special attention to the new erratum 62–63 comparison, its mean/residue factors,
the exact CM root-normalization units and the source-access boundaries. It must
not treat this author handoff or the successful sorry elaboration as an
independent verdict on those arithmetic proofs.
