# Independent package review: Abelian varieties isogenous to no Jacobian, round 2

**Verdict: needs_changes.** Codex, session `codex-OSUsu4`,
`independent-review-REV-PKG-AbelianVarietiesIsogenousToNoJacobian~2`, 2026-10-14.
Refs [#9198](https://github.com/CBirkbeck/tauceti-explorer/issues/9198).
This is a completed independent review. This session authored neither package round.

The revision resolves the earlier Lean-shape objection and gives the formerly unlocated
quantitative inputs actual target statements. It preserves the 95 accepted targets, all 85
API names and all 57 test names, and adds 22 targets. The representative Lean file elaborates.
However, stating an arithmetic or o-minimal end theorem does not plan the key theories used
to prove it. The explicit gaps below prevent upstream acceptance. Clear errors and test
omissions have been corrected in the package itself.

## Previous review and the required remaining work

**R1 is superseded by the binding 2026-10-12 shape.** The earlier review required Lean
signatures for geometric objects whose carriers are absent at the pins. The current rule
requires those targets in the README and forbids inventing their carriers. The revision's
real-bodied matrix, theta and Newton definitions meet that rule. Missing geometric Lean
declarations are not a reason for this verdict.

**R2 is partly resolved.** Layers 1–2 now state the numerical isogeny, CM and block-counting
outputs with usable locators. They no longer cite unplanned Part II stage identifiers as
though they supplied those outputs. But several proof sketches require entire constructions
or named key theorems that neither their local prerequisites nor their suppliers provide.
The package now labels these gaps at the point of use:

| Section | Missing contract needed to close the plan |
| --- | --- |
| 0.4 | A proper stable Torelli map to Satake, its inverse-image characterization of the open A_g, and the relative Picard/Jacobian construction for compact-type curves. Properness of the whole stable moduli stack does not prove properness of its open compact-type substack. |
| 1.1 | Adelic Hermitian bundles, slopes and cubist metrics; the height comparison and the auxiliary-section/interpolation estimate used in the period theorem. GR14 §3.2, pp.358–360 and §§6.1–6.8, pp.368–380 identify substantial inputs absent from the listed height and polarization suppliers. |
| 1.3 | Canonical representatives of isogeny classes, the controlled endomorphism orders and the period/discriminant estimate behind GR23 Théorèmes 1.3–1.5, pp.12–13 and 1.8, p.15, including extension-field descent. Finiteness of Hom alone does not supply them. |
| 1.6 | The orthogonal integral models, big CM cycle, arithmetic divisors, Green functions and arithmetic intersection formula used in AGHMP Theorem B and Theorems 6.3.1/6.4.2, pp.395, 473–474; also the removal of the bad-prime error term. |
| 1.8 | Comparison of the unpolarized CM field of moduli with the polarized-pair field, and the reduction from general CM types/orders to the primitive maximal-order estimate. Level-three rigidity for a polarized pair cannot silently be applied to an unpolarized variety. |
| 2.2 | Restricted-analytic/exponential model completeness and the theorem establishing o-minimality of R_an,exp. Semialgebraic projection and the definition of a structure do not establish it. |
| 2.4 | Uniform reparametrization and determinant bounds for block counting. Pila 2011 Theorem 3.6 still invokes Pila 2009 Theorem 3.5 in the rational-point step, pp.1796–1797; changing the citation does not remove that proof input. |
| 6.3 | Deligne's absolute-Hodge theorem for abelian varieties and its tensor comparison with Galois invariants. The cited ShimuraData nodes define the groups and genericity, without this key theorem. |

These need mathematical definitions and target statements, with APIs/tests for the
constructions and actual predecessor contracts. An extension of an existing owner's
direction must follow PROTOCOL §15. Merely adding another broad source citation is
insufficient. The remaining task is too large for a fixing package review: for example,
arithmetic intersection theory and the auxiliary-section method each require a real plan,
not a paragraph claiming that the cited end theorem follows from heights.

The accepted packet's 27 gaps were also read. Not all are independent rejection reasons:
ordinary matrix estimates, convergence arguments and degree adapters may live in target
proof sketches. Nor must the supplementary torsion and local analytic existence problems
be solved before the main roadmap can be accepted. The failures above concern missing
key theories/interfaces in the main prerequisite chains. The packet remains unchanged.

## Corrections made in place

- **Definability, §2.5.** The compact set for restricted j-uniformization is now compact
  semialgebraic. A claim for every compact set was false: the graph over a translated
  Cantor set would have a nondefinable projection. Added this negative control.
- **Fourier normalization, §0.11.** With exp(πi tr(Mτ)), the period is now 2d for the
  condition dM half-integral. A period t instead gives (t/2)M half-integral. Coefficients
  use normalized Haar measure over a box of side 2d. This preserves the downstream
  denominator e: Γ(2e) supplies translations by 2e. The period-two character Check
  distinguishes the convention from exp(2πi tr(Mτ)).
- **CM degree, §1.9.** Replaced the unsupported use of the bound 2g for a common field
  of all algebraic period entries by the sufficient bound b_g=(2g)!. The cited public
  PT13 proof uses 4g for its primitive CM step, rather than the package's 2g claim.
  A normal closure containing all embeddings of CM factors of total degree at most
  2g has degree at most (2g)!. Northcott only needs a fixed genus-dependent degree.
  No claim is made that the sharper bound is always false.
- **Rigidity, §1.8.** The bounded level-three descent statement explicitly concerns
  (A,λ) and Q(A,λ). Added the unpolarized E² shear fixing E²[3] as a counterexample
  to the unqualified rigidity argument, and recorded the missing CM comparison.
  The correction qualifies the proof interface; it does not assert that the published
  CM orbit theorem is false.
- **Elliptic specialization, §1.1.** The principal-polarization specialization is
  explained separately from an arbitrary line bundle. The general period bound and
  the sharper elliptic bound have different constants even when δ=ρ.
- **Compact-type closure, §0.4.** Replaced the invalid restriction-of-properness
  argument by the needed stable-to-Satake extension argument and recorded its gap.
- **Lattice ownership, boundary section and §5.9.** Restored the actual current
  IntegralLattices 2D–2F contracts in place of the revision's proposed GeometryOfNumbers
  supplier. Squared minima become lengths by square roots; their witnesses are
  independent and need not form an integral basis.
- **Current-library boundaries.** Added exact semialgebraic, covolume and basic
  isogeny declarations. The semialgebraic image and quantifier-elimination theorems
  require `hproj`; they are not an unconditional Tarski–Seidenberg theorem.
- **Image domains, §2.3.** The block-image assertion now explicitly means φ(W∩B),
  with φ defined on B. It does not evaluate φ outside its domain.
- **Model descent locator, §7.2.** Added Tsimerman Lemma 4.1, p.384 for polarized
  level-three rigidity; MZ p.663 only records its use in the candidate count.
- **Definition tests and APIs.** Added independent Checks for Siegel symmetry,
  primitive-vector Minkowski reduction, diagonal comparisons, the algebraic part,
  fixed-dimension block families, the Rosati helpers, ψ, half-integrality, the
  numerical Minkowski bound, half-characteristics and the Schottky sums. Added six
  Lean negative-control/example declarations and explicit omitted algebraic-part
  and block-family names in the closing comment. Removed a process-like carrier
  description from the Lean module documentation.

No accepted target was deleted. Metadata stays `topic = "math.NT"`.

## Sources: independent locator audit

All statements of Layers 1–2 and all locators identified as indirect/unverified by the
revision handoff were inspected in public sources where available. The unavailable
original MW93/MW94 and Igusa proofs are not certified as read. Their exact citations
were checked in MZ, and their missing prerequisite machinery is not treated as library
content. The cleared-library index was consulted; no uncleared book copy was used.

The 15 random original subsections were selected with seed 9198, excluding the 22 added
targets. Section numbers below are package numbers; source pages are printed pages.

| Sample | Locator inspected and result |
| --- | --- |
| 11.2 | MZ §3.4, p.652 and §5.4, pp.668–669: coefficient tolerances and matrix interpolation use. |
| 5.8 | MZ (26)–(28), p.655: off-diagonal extraction with the nonzero coordinate. |
| 5.2 | MZ (22), p.653 and p.656: trace convention and indirect MW94 Lemma 2.2, p.644. |
| 7.2 | MZ p.663 is an application, not a model-construction proof; supplemented by Tsimerman Lemma 4.1, p.384. |
| 13.3 | MZ pp.668–670 motivates interpolation, without the global obstruction theorem; the actual Demailly II(8.7), II(8.10), pp.118–121 and Le Fourn 6.4, p.181 support it. |
| 5.11 | MZ Lemma 4.3, pp.656–657: stable height controls the imaginary periods. |
| 7.6 | MZ Lemma 5.2, (34)–(35), p.660: product discriminant and height. |
| 0.3 | MZ pp.635, 637: moduli/Torelli dimensions and the genus restriction. |
| 6.5 | MZ p.659: indirect Deligne Hodge II Lemma 4.4.16. Original proof not certified. |
| 9.3 | MZ p.663 and Gao, arXiv:1802.03204v1, Lemma 10.2.6, pp.27–28: the Hodge-generic weakly-special dichotomy. |
| 10.8 | MZ Corollary 1.6, p.640: the rational fourfold conclusion remains conditional. |
| 6.4 | MZ Lemma 5.1(c), p.658: indirect Serre p.35, including the permitted dimensions. |
| 5.6 | MZ Lemma 4.1, pp.653–655: the lower-right entry estimate. |
| 0.7 | MZ (23)–(24), p.653: the diagonal comparison, indirectly from Igusa. |
| 0.10 | MZ (37), p.660, (40)–(42), p.661 and (44), p.662: the real block correspondence, signs and denominator. |

Additional primary statements and proof passages inspected:

| Source | Read scope relevant to the revision |
| --- | --- |
| [Gaudron–Rémond 2014](https://content.ems.press/assets/public/full-texts/serials/cmh/89/2/12625/online/10.4171-cmh-322.pdf) | Théorèmes 1.1–1.3, pp.345–346; 1.4, p.347; Lemme 7.9, p.393; the auxiliary constructions named in the gap at 1.1. |
| [Gaudron–Rémond 2023](https://hal.science/hal-02445032/document) | Théorèmes 1.3–1.4, p.12; 1.5, p.13; 1.8–1.9, p.15, with the constructions leading to the quantitative output. Public author manuscript, not the publisher's short sample. |
| [Tsimerman 2018](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) | Theorem 2.1, p.382; 2.3, pp.382–383; Corollary 3.3, pp.383–384; Lemma 4.1, p.384; Theorems 4.2 and 5.2, p.385. |
| [AGHMP 2018](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf) | Theorem A, p.392; B, p.395; Theorems 6.3.1 and 6.4.2, pp.473–474 and the arithmetic objects needed for the comparison. |
| [Pila 2011](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n3-p11-p.pdf) | Definition 2.1, p.1791; 3.1, p.1792; 3.4, p.1794; Lemma 3.5, p.1795; Theorem 3.6 and its proof, pp.1795–1797; Propositions 4.3–4.4, p.1799. |
| [Peterzil–Starchenko](https://arxiv.org/pdf/1103.3110v1) | Theorem 1.1, arXiv p.2 and the stated uniformization domain; no claim of auditing the whole proof. |
| [Pila–Tsimerman 2013](https://arxiv.org/pdf/1106.4023v1) | Theorem 3.1, arXiv p.3 and proof pp.3–8, especially the degree estimate on p.6. |
| [Pila–Tsimerman 2014](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p05-p.pdf) | Theorem 2.6, p.665; Theorem 6.1, p.670; Lemma 7.4, p.675, compared with the cited earlier version. |
| [van der Geer](https://arxiv.org/pdf/math/0605346v1) | §4, Definition 4.1 and Theorems 4.3–4.4, pp.9–10, for the Fourier convention and Koecher restriction. |
| [BCCR](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/paper1.pdf) | §2, p.3, the principal congruence/diagonal definition of the Igusa level. |

This certifies the stated read scope and locators, not independent proofs of every external
theorem. Nothing from a source was copied into a repository deliverable.

## Adversarial mathematics pass

I walked all fourteen layers and the typed statements, checking dimension restrictions,
positivity, nonzero denominators, finite regular domains, dependence of constants and
polarization conventions. The following records the concrete witnesses and resulting fixes.

| Statements/conventions | Instances and outcome |
| --- | --- |
| Siegel space and reduced domain, 0.1/0.6 | iI, dimension zero, zero in dimension one, and the nonsymmetric matrix with entries (i,1;0,i). Positivity alone misses the last counterexample. Added Checks and Lean examples. |
| Minkowski reduction and diagonal comparison, 0.6–0.8 | diag(1,2) passes; diag(2,1) fails the primitive-tail inequality; negative adjacent entry −1/4 fails the sign convention. For δ=1, iI passes, iI/2 fails the lower bound, and an imaginary off-diagonal 1/2 fails the Loewner comparisons. Block products do not impose a new diagonal ordering. |
| Torelli/closure, 0.2–0.5 | g=2 and g=3 have full-dimensional closure; g=4 gives 9<10. Product elliptic Jacobians are compact-type boundary points. The open-substack properness argument fails; corrected and marked the missing Satake contract. |
| Period correspondence, 0.10/5.12 | Identity gives τ; a zero block denominator is excluded for positive genus. The signed full matrix and η(cτ+d)=aτ+b yield a kernel contradiction, without a polarization hypothesis. Dimension-zero empty matrices cause no division contradiction. |
| Fourier forms, 0.11/8.1–8.10 | exp(πiτ) changes sign under τ↦τ+1 and is invariant under τ↦τ+2. Corrected 2d. The zero form has infinite order; a nonzero constant has order zero. g=1 needs a cusp condition; strict order >W remains necessary in the kernel argument. |
| Period/isogeny/CM inputs, Layer 1 | Principal elliptic degree-one polarization, arbitrary line bundles, the unpolarized E² level-three shear, and a product of three quadratic CM factors. Qualified the elliptic and rigidity interfaces; replaced the unnecessary sharp degree assertion by a safe fixed degree bound. |
| Definability/blocks, Layer 2 | A singleton has empty algebraic part; a line is wholly algebraic; the exponential graph has no semialgebraic arc. Two disconnected points fail a block condition; point/interval dimension jumps fail a fixed-dimension family. Translated Cantor domains refute arbitrary-compact restriction. |
| Elliptic counting/elimination, Layers 3–4 | m=1, M=0/1/2, ψ(4)=6 versus σ(4)=7, ψ(6)=12, and a prime p giving p+1. The logarithmic square sum retains M≥2; resultant nonzero and polynomial degree hypotheses remain present. The safe offset remains 2d⁴+1. |
| Rosati/entry bounds, Layer 5 | At τ=i, identity gives rational trace 2 and analytic trace 1. ε²=−I and ε⁻¹=εᵀ. Zero has length zero; [n] gives 2g n². κ=0 cannot represent ρ=I. Added explicit helper APIs/Checks and two Lean controls. Rank-one minimum/product checks retain √D and independent witnesses. |
| Genericity/specialization, Layers 6–7 | p=2 is allowed; g=4 cannot use End=Z as an open-image proxy; odd g and g=2,6 can use the cited Serre theorem. CM and nongeneric points are excluded before polarization/class counts. Finite regular fibres and the separate bad-locus count are retained. |
| Theta/level/index conventions, Layer 8 | Odd genus-one characteristic vanishes; a second integral shift at m=1/2 multiplies by −1. The shear (1,e;0,1) fails Γ(e,2e) for every e≠0; Γ(2e) passes. Half-integral off-diagonal 1/2 passes, diagonal 1/2 and off-diagonal 1/4 fail. W=0 leaves only M=0. |
| Quantitative consequences, Layers 9–10 | g=2 is allowed in avoidance and g≥4 is needed for no-Jacobian. Constants remain tied to the fixed family and ε; image dimension zero counts points rather than whole matrix fibres. Distinct CM moduli points, rather than exceptional parameter fibres, are counted. |
| Schottky helpers, 10.10–10.12 | At rank zero U=V=1 and F=0. At τ=i, putting b=θ_(1/2,0)(i)=θ_(0,1/2)(i), Jacobi gives U₁=18b¹⁶, V₁=6b⁸, F₁=0. On diag(i,i), U₂=324b³² and V₂=36b¹⁶, so F₂=0. Added computed Checks; product factorization preserves the 2+2 and 1+3 conclusions. |
| Newton interpolation, Layer 11 | Zero and constant coefficients, and t_n=n+1 with a₁=1 give 0, c and z−1. Injectivity prevents vanishing denominators; the summable envelope is required for holomorphy at accumulating parameters. I+wwᵀ is positive definite for real w; complex-parameter positivity is not asserted. |
| Supplementary problems, Layers 12–13 | Full sixteen-torsion implies μ₁₆ and degree divisible by 8, without proving torsion splitting or the main field bound. The strict Satake dimension condition is valid for g≥2; the global analytic hypersurface obstruction does not rule out the separately specified local problem. Neither problem feeds the main theorem. |

The examples admitted by `sorry` pin intended statements. Their elaboration does not
prove these mathematical assertions; the witnesses above were checked independently.

## Lean signature audit and validation

Ten signatures were compared directly with the corresponding README hypotheses:

| Signature | Match checked |
| --- | --- |
| `igusaDiagonalComparison` | δ>0, δ≤1, membership in the reduced domain, lower diagonal bound and ordering. |
| `diagonalComparison_fromBlocks` | Both comparison predicates and δ>0; no ordered-diagonal conclusion. |
| `periodMatrixCorrespondence.mem_iff` | Same four blocks, complex casts, nonsingular denominator and target set. |
| `ellipticMatrix_bound` | Both periods in the closed domain, integer entries, positive m and determinant m. |
| `finiteSubgroupCount` | Finite subgroups, order at most m, m≥1 and one genus-dependent constant. |
| `rationalAnalyticTrace` | Siegel positivity and analytic/rational compatibility; the factor two is present. |
| `abs_det_le_rosatiSq_pow` | g≥1, positivity, compatibility and the denominator 2g. |
| `entry_d_bound` | Positive δ≤1, full diagonal comparison, compatibility and the ratio y_j/y_i. |
| `fourierIndexCount` | e≥1, W≥0, symmetry, positivity and eM half-integral. |
| `newtonSeries.holomorphic` | Injective nodes and the summable envelope for every positive radius. |

Additional checks covered all other typed declarations, including the signed denominator
and the genus-four product signatures. Every README definition has an intended API and
at least three discriminating prose Checks; the lightweight helper definitions now have
their own computed and negative controls. Heavy definitions remain in the README and
the closing Lean comment rather than being given admitted data bodies.

- Independent `lean-check`: before fixes exit 0 with 60 warnings; after code fixes exit 0
  with 66 warnings, all `declaration uses sorry`, no errors or other warnings. Only comments
  were adjusted after the latter run. The file has 613 lines, below both the issue's
  approximate 1,500-line size and the binding 5,000-line maximum.
- Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin:
  `f790474821cf4256814db967cb154e7af3d0c369`. All 15 packet baseline declarations
  were read in the pinned source, including the nonzero resultant alternative, the grid
  cardinality/degree hypotheses, the matrix inverse hypothesis and both native Cholesky
  interfaces. The library audit was consulted.
- `scripts/check_sorry_data.py`: passes; no admitted data definitions or placeholder
  propositions. `scripts/check_blueprint.py` on the unchanged packet: 0 errors,
  0 warnings, 95 nodes, 85 APIs, 57 tests, 27 gaps and no closed stages.
- `research/blueprint/intake.py check-files` on all deliverables: 0 problems.
  `git diff --check`: passes. API/test inventory: all 85/57 retained after normalizing
  the old namespace prefix. All fourteen layer headings and 117 target subsections
  remain. No local source paths or source passages occur in the deliverables.

## Current ownership and tier audit

Read the upstream JacobianChallenge and ConformalMapping roadmap models and checked the
current upstream/Completed trees at `0d144d044dacebca17b654695b6f1ad58f159b27`, plus
Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches used mathematical
objects, including forms, projections, isogenies, lattices, period matrices and analytic
comparison, across the nine newer roadmaps and Completed. The relevant actual declarations
and IntegralLattices/RealAlgebraicGeometry contracts were read; no Lake commands were run
in those trees.

**Target removals: none.** The revision already imports basic geometric definitions.
The correction is an ownership repair: existing IntegralLattices owns the successive
minimum theory; this roadmap specializes it to Rosati lattices. Current library covolume,
semialgebraic and isogeny interfaces are recorded only under boundaries. No new generic
Tarski–Seidenberg, basic isogeny or Cholesky target is introduced.

No `FoundationsAndLibraryIntegration` or `UPSTREAM:` identifiers remain in the package.
The indexed atlas suppliers occupy tiers 2–17 in CaraianiNewton: SchemeAndStackFoundations
(2), AlgebraicModuli/DiophantineApproximationAndTranscendence (4), ComplexComparisonPartII
(5), InverseGaloisAndArithmeticFundamentalGroups/AbelianSchemesAndArithmeticModuli (6),
ArithmeticGaloisRepresentations (7), ModularCurvesPartII (11), ShimuraData (12),
PELModuli/ShimuraVarieties (13), AnalyticNumberTheory (14), AutomorphicBundles (15), and
FaltingsFinitenessAndIsogenyTheorems (17). This roadmap and its CM, stable-reduction and
Jacobian Part II suppliers are outside the 94-roadmap index. Consequently that index
alone cannot certify their relative submission order; this report does not invent a
tier or approve an upstream order. InverseGalois IG.2.5 now really includes the quantitative
integral thin-set count, and IG.2.6 the Frattini detection interface; the older packet's
objection to those supplier outputs is no longer current.

Resume a revision at the eight explicitly marked prerequisite gaps above. Preserve the
main field bound, unpolarized isogeny avoidance, corrected Fourier convention and the two
inactive research problems. Once actual owner contracts or local prerequisite plans are
supplied, the package needs a new independent acceptance review.
