# PKG-KatoEulerSystems — completed package

Issue: #7908. Author: Codex GPT-6, session codex-4ArQBz, 10 October 2026.
The bot confirmed the claim before work began. This run claims no other job.

The deliverables are the README, Suggested.lean and metadata.toml in
`research/blueprint/packages/KatoEulerSystems/`. The README is the normative
specification. This is a completed packaging job, not a claim that its
mathematics has been formalized or that the accepted plan's supplier gaps
have been closed. The original packet, reader and suggested file are
unchanged. The package does not contain a review verdict for its own work.

## Inputs and build order

Used the accepted `research/blueprint/packets/KatoEulerSystems.json`, its
reader and suggested file, with the independent REV-KatoEulerSystems~2
review. There are 40 targets, 60 API items, 41 construction tests, 31 requests,
14 gaps and 12 source findings. All target statements appear in the package;
all 60 API names and all 41 test names were checked against the README.

The eight package layers expose the actual construction order instead of
retaining the five original thematic stages. Geometric classes and
reciprocity precede analytic detection and Iwasawa module structure, which
precede the canonical rational map. The CM supplier must precede that map.
The small-slope and elliptic applications follow it. Within Layer 0 the
analytic product precedes its use in the degeneracy comparison.

The table is both a target crosswalk and the adversarial pass over every
README target. The numbers in the first column are positions in the
unchanged packet; the final column records the cases checked and scope
retained. None of these numerical or signature checks proves the target.

| Input | Package | Target | Adversarial cases and result |
| --- | --- | --- | --- |
| 1 | 0.1 | Normalized theta unit | c=5 divisor 25[0]−E[5]; nonzero two-torsion gives pullback coefficient 24 versus original 0. Selection has an existence input; no fake geometric existence. |
| 2 | 0.2 | Torsion evaluation and rational auxiliary independence | c=5 and d=7 give 24 and 48; equality only after cross-normalization. Nonzero pair and auxiliary conditions retained; c²−1 nonzero. |
| 3 | 0.3 | Galois action and distribution | Upper/lower shear and determinant two distinguish row/column and constant actions. A=1 one-element fiber, A=0 excluded, both torsion coordinates vary. |
| 4 | 0.5 | Degeneracy product | A=1,2,4 give 1,2,4 second-coordinate roots, not 1,4,16. Exact τ↦Aτ identity and composite A retained. |
| 5 | 1.1 | Ordered Beilinson symbol | Ordered determinant 1 versus −1, either identity entry gives zero, bilinearity and four-term smoothing. Generic Y(M,N) is supplied rather than replanned. |
| 6 | 1.2 | Same-prime-set norms | Identity map and an existing-prime raise have identity factor; a genuinely new prime is excluded from this branch. Projection-formula slot order retained. |
| 7 | 1.3 | Auxiliary-prime operator | Both ℓ∤N and ℓ|N branches retained; quadratic coefficient ℓ occurs only in the first. Arbitrary independent classes cannot satisfy this norm identity. |
| 8 | 1.5 | Étale Chern moment | k=2,r=1 gives twist 1; k=4,r=1 gives 3; monomial degrees nonnegative only in the stated range. Four constituent maps, finite coefficients, trace and edge retained. |
| 9 | 1.6 | Hecke/diamond equivariance | n=1 identity; central diamond at k=2,r=1 scales by n^(−2), Hecke by 1. Actions have different carriers and cannot be identified by name. |
| 10 | 2.1 | S-integral cyclotomic limit | Zero coefficients versus nonzero finite coefficients; separating local duality and residue restriction required. No assumed lift or fake integral inclusion. |
| 11 | 2.2 | Geometric p-adic classes | At k=2,r=1 new-prime coefficients are ℓ^(−1); ramified branch drops the quadratic term. Repeated p-prime uses an actual commuting source/moment square; identity moment preserves one. |
| 12 | 2.3 | Concrete Euler-system adapter | Arithmetic Frobenius raw polynomial distinguished from its ℓ^(−1)σ^(−1) evaluation; repeated prime identity, constant coefficient 1. Uses ES.2 carrier, not a duplicate system definition. |
| 13 | 5.3 | Canonical critical interpolation | k=2 and k=4 parity witnesses; γ=0; dual form and χ inversion retained. Global semilinear twist precedes specialization and localization. |
| 14 | 3.1 | Modular filtration/dual exponential | k=4 gives F¹=F² but gr¹=0; i=k gives zero; k=2 critical range nonempty. Range restriction is separate from proving the geometric range. |
| 15 | 3.4 | Generalized reciprocity | All three p|M, p|N, p∤MN branches; exceptional M condition; weight-two ℓ powers. Non-perfect-residue-field comparison remains conditional. |
| 16 | 5.2 | Integral span and finite index | Finite quotient may be nonzero; rational equality does not prove finite index or integral equality. Regular μ, p-torsion-free quotient and full dyadic support contract retained. |
| 17 | 3.3 | Real regulator/derivative | Z(0)=0 so using value instead of derivative loses the class. Relative cusp endpoints retained; real half-projector gives no integral dyadic projector. |
| 18 | 4.2 | Analytic twist nonvanishing | Trivial weight-two twist may vanish; finite exceptional set retained. Full-level spanning has equal indices. Detection is of geometric classes before the canonical map. |
| 19 | 7.1 | Non-torsion zeta span | Zero map in rank-one module is a negative control; zero Betti vector can have zero image. Nonzero detection on every component requires the analytic argument and actual smoothing. |
| 20 | 7.2 | Cohomological upper bound | Lengths (2,1,1) pass, (2,1,0) fail. Exceptional local term retained; integral H²(T), H¹(T)/Z(T) at p-primes and integral freeness distinguished from rational modules. |
| 21 | 7.5 | Ordinary modular divisibility | Nonordinary form excluded; good periods lie in U⊂V(f*), not V(f). Odd/full image and all-height-one integral clause kept distinct from rational away-p bound. |
| 22 | 4.1 | Image hypotheses and CM boundary | x=2 works rationally but is not an integral unit; x=0 fails rational rank-one quotient. Division quaternion algebra has no such unipotent. Dyadic H¹ vanishing not used. |
| 23 | 0.4 | Analytic product/cusp descent | Bernoulli values 1/12, −1/24, −11/300; missing-square alternative −23/300 fails. Zero pair excluded; width-N parameter multiplies order by N. |
| 24 | 1.4 | Chern sign/denominators | ch=−c equals ordered Kummer cup; inverting both slots cancels signs, one slot changes sign. Rational projector denominators and literal duals retained. |
| 25 | 2.5 | Full-level moment classes | Zero/additive/nonzero literal-dual moments; new-prime operator gives 3 for identity actions. Separate Chern-transfer, source-transfer and Euler squares act on both constructed moments. |
| 26 | 2.4 | Literal-dual/Hecke dictionary | p=2,k=4 degree-two pairing determinant −4b³ is not a unit. Factorial hypothesis on symmetric self-duality and Γ₁ rank-two quotient retained. |
| 27 | 5.1 | Rational canonical morphism/span | Zero/additive, prescribed basis value 1, sign distinction over ℚ; zero span versus identity span. Basis realization does not prove arithmetic generator consistency. |
| 28 | 3.2 | Eisenstein products/periods | Endpoint formulas agree using E¹=F¹; unsmoothed exclusions and regularized E² retained. Weight/character parity, zero/additive/nonzero period checks and four smoothing terms retained. |
| 29 | 3.5 | Parabolic characterization | Open boundary/Eisenstein cohomology excluded from injectivity; splitting rational, not integral. All-weight conductor inverse-limit injection is a separate contract. |
| 30 | 5.4 | Twist-one transport | (1−k)+k=1; two minus signs cancel; zero and three identity maps. Corrected d² smoothing and Y₁ rank-two realization; integral clause has extra hypotheses. |
| 31 | 6.1 | Scalar regulator | Zero/additive/nonzero classes, period doubling and class tripling give 3/2. α and periods nonzero; strict slope proves eigenpairing nonzero. De Rham/dyadic exports separate. |
| 32 | 6.2 | Small-slope equality | Exact ramified conductor/Gauss sum and all powers retained. α=1,ε=0 gives zero; α=−1 gives 2; α=2,ε=1 weight-two algebraic specialization gives 1/4. Growth needed for uniqueness. |
| 33 | 6.3 | Critical/bad-reduction comparison | α=0/absent crystalline line excludes scalar assertion. Decent neighborhood, dense locus, nonvanishing periods and compatible arithmetic section required, not inferred. |
| 34 | 4.3 | Modular use of generic bound | Rational versus full integral image, parity and purity distinguished. Weak Leopoldt precedes supplier rank comparison and evaluation-index comparison; local H² term not erased. |
| 35 | 4.4 | All-prime Iwasawa structure | Zero module does not give rank one. Rational p=2 statement retained, integral freeness requires odd p/residual irreducibility. CM/nonsplit proofs retain separate earlier inputs. |
| 36 | 6.4 | Elliptic lattice/period | Actual logarithm lattice at 2; curve y²+xy=x³+1 has Δ=−433 and E₁ log image 4ℤ₂. Fixed r_E independent of p; local index not reduced cardinality at bad places. |
| 37 | 7.3 | Cyclotomic Mordell–Weil finiteness | Bounded rank/finite torsion alone insufficient. Finite fixed torsion exponent kills every translation homomorphism on one uniform subgroup, then finite-layer Mordell–Weil. Each-prime Sha finiteness distinguished from global. |
| 38 | 7.4 | Elliptic ordinary/multiplicative bounds | Split α=1 keeps augmentation ideal; nonsplit α=−1 gives nonunit 2 at p=2. Fractional L-value permits integer t; exact integral bound requires full image and unit factors. |
| 39 | 7.6 | No finite Selmer submodule | Λ/(p,γ−1) is torsion with a finite submodule. Actual local p-torsion exclusions at every bad prime and Greenberg sequence required; ordinary reduction retained. |
| 40 | 7.7 | Rank-zero elliptic p-part | Nonzero L-value ensures finite cardinality; inequality not equality. Ordinary nonunit correction cancels on both sides; odd supersingular reduced cardinality prime to p. Almost-all-prime argument uses elliptic surjectivity. |

## Lean signatures and their limits

Followed the newer binding representative-file form in PACKAGE_REVIEW.md.
The original suggested file contains declarations asserting reciprocity or
transfer for unrelated arbitrary maps. Copying those signatures would create
false statements despite a successful sorry build. The package instead has
transparent algebraic ingredients, typed theorem signatures and examples;
arithmetic statements with unavailable carrier APIs remain in the README and
the named closing comment. In particular, no theorem pretends to prove
geometric theta existence, all-prime Iwasawa freeness, actual arithmetic
reciprocity, Greenberg's theorem or elliptic finite generation from arbitrary
linear maps or rank numbers. The conditional theta selector and basis
realization explicitly describe what they do and what they do not establish.

The following audit covers every Lean definition and theorem family in
addition to the 40 target rows above. Examples were read with their containing
family. No `False`, `True` placeholder, `Prop := sorry`, or theorem hypothesis
simply assuming its final arithmetic conclusion is present.

| Declarations | Instances/generalization checked |
| --- | --- |
| thetaCondition; cTheta; divisor/norm/unique API | General commutative ring units and additive divisor group; ∃! supplied normalization; no geometric existence claimed. c=5/a=2 and nonzero divisor direction. |
| siegelUnit; pullback/level API | Units.map and ring-map composition for any commutative rings; identity map preserves a nonconstant unit. |
| rationalSmoothing; smoothing/auxiliary API | ℚ-module, not arbitrary characteristic; fixed-index c=5,d=7; c=1 denominator excluded in geometric rationalization. |
| torsionIndexAction; siegelLeadingExponent | Rational row representatives, not a duplicate finite torsion action; shear, identity, determinant two; 0,1/2,2/5 and reflection. |
| beilinsonElement; symbol/bilinear/smoothing API | Ordered ℚ-bilinear pairing; zero entry, determinant sign, both negative cross terms. Does not claim arbitrary pairing is a scheme Chern map. |
| chernMoment; factorization/twist/ext API | Four separate typed maps over any field; zero and identity modules, k=2/4, critical range. Coefficient comparison omitted rather than reduced to scalar linearity. |
| padicZeta; def/pDirection/coefficients API | Supplied linear moment of sequence; transfer square and coherent source are separate inputs; zero/constant-one tower. Scalar theorem is not the whole arithmetic coefficient theorem. |
| katoEulerPolynomial and def | Rational evaluated factor with total zpow syntax; ℓ=3 computed, ramified ε=0, constant term 1. Arithmetic ℓ=0 excluded in README. |
| fullLevelEulerOperator | Any commutative coefficient ring; composition order as written; identity actions at 3 and 0, zero u. Degenerate algebraic instances do not extend geometric Frobenius hypotheses. |
| fullLevelZeta; moment/transfer/ext API | Literal Module.Dual over any commutative ring; constructed high/low maps and three constituent squares. Zero, additivity, identity functional one, new-prime transfer tested. |
| modularFiltration; three branch API | Any field/module/submodule; weight≥2 for endpoint theorem; i=0, critical interiors and i=k. Equal successive steps give zero associated graded. |
| modularDualExp; coe API | Imported map and proved range restriction over any field; no arbitrary-map reciprocity statement. Actual arithmetic range theorem in README. |
| criticalSign | Integer parity, using natAbs only for exponent parity; characteristic-zero sign witnesses. Does not create integral dyadic sign projectors. |
| upperUnipotent; rational range/integral quotient | Nonzero x over field versus unit x over general ring; x=2 over ℤ versus ℚ, x=0. Trivial ring causes no false dimension assertion: integral theorem states an actual linear equivalence. |
| katoZetaMap; generator/unique/conjugation API | Genuine basis realization over field; covariance verified on basis extends by linearity. Empty/zero source, nonzero prescribed generator; no assumed canonical geometric map. |
| katoZetaSubmodule; mem/eq_span API | Span over specified Λ with no extra scalar-tower assumption; zero and identity maps on ℚ, member one. Arithmetic nonvanishing separate. |
| twistedKatoZeta; def/ext API | Three supplied maps over field, two sign changes, total degree one and nonzero identity case; Iwasawa twist/norm assertions omitted until supplier APIs exist. |
| katoScalarRegulator; def/linear/scale/projection_add API | Any field, linear maps, zero module; a≠0 period normalization and a⁻¹b scaling. Eigenline existence not proved by this composite. |
| ordinaryEulerFactor | Rational numerical coefficient function; split zero/nonsplit 2/two-factor 1/4; source arithmetic prime and nonzero α scope separate from total field inversion. |
| lengthBoundWithLocalTerm; cancelOrdinaryControlLength | Natural finite lengths; correction added only through specified length identity; same ordinary factor on both sides. No fake cohomology or characteristic ideal. |
| nonzeroZetaSpan | Any commutative ring/module, requires actual z≠0; zero-span control. No theorem states all chosen arithmetic vectors are nonzero. |

Additional library mismatch found during this pass: Mathlib
`Module.IsTorsionFree R M` means all nonzero scalars act injectively, whereas
Kato/Nakamura's full group-ring terminology tests regular scalars. A free
rank-one module over ℚ×ℚ fails the former: (1,0)(0,1)=0 with both elements
nonzero. The README now distinguishes the predicates, uses the zero regular
`Submodule.torsion` condition on the full algebra, and the Lean file records
the product-ring counterexample. Do not reinstate the stronger predicate
for a full semilocal or dyadic algebra. This clarification is not an edit to
the input packet.

## Current-library and upstream audit

Read in full the current ArithmeticDirichletSeries and AlgebraicVectorBundles
READMEs, and their suggested forms, plus the relevant LocalGaloisGroups and
ProfiniteArithmetic interfaces. Current upstream commit:
`618e0b30d21791d6a492ce88ba8602745697b21a`.
Current Tau Ceti commit: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The checkouts were read only; no Lake operation ran there.

Searched mathematical objects across current upstream and Tau Ceti:
normalized theta/Siegel units, ordered K₂ classes, scheme Chern moments,
modular Euler systems, regulator and Iwasawa/dual coefficient interfaces.
No existing Kato-class construction was found. Generic bundle operations,
field Kummer classes and continuous cup/restriction machinery are boundaries
rather than newly planned targets. Specifically re-read the current
`TauCeti.kummerMap`, `kummerIso`, `kummerRes_kummerMap` and
`kummerCor_kummerMap` in FieldTheory/GaloisCohomology/Kummer: invertible n,
chosen separable-closure embedding and finite extension where required.
These are field results and do not prove the modular scheme K₂ Chern map.
AlgebraicVectorBundles L0B/L0C owns generic tensor/dual/symmetric/determinant
operations. The package introduces only the modular arithmetic dictionary.
No substantive Kato target was removed as already implemented; the generic
Y(M,N) description is explicitly a supplier input within its symbol target.

KatoEulerSystems is outside the 94-roadmap Caraiani–Newton ordering. The
package retains named owner layers, removes inherited bookkeeping-stage
citations, and creates no PadicFamilies→Kato prerequisite. It imports ES.2,
ES.4 and ES.8 rather than routing generic bounds through the cyclotomic-unit
application. The maintainer still needs to reconcile the inherited atlas
edges noted in the input's upstreamNotes; those files are outside this job.
No target has been moved to a higher supplier in this packaging job.

## Source audit

Used public original articles/draft editions and the accepted locators;
consulted the cleared-library index, with no restricted book needed. No
source file or passage is committed. All source prose is paraphrased; source
excerpts in older workflow instructions were not followed.

The page-image/formula sample included Kato pp.124,126,131,142,143,163,188,
221,222,227,234,270,271,273; Nakamura pp.205,221,268; Rubin draft p.49;
and Ribet p.191. Text-layer collation additionally checked the CM sections
263–265, definitions 5.1–5.2 on 152–154, Rubin III.5 pp.48–54,
Nakamura Appendix A and Theorem 5.2, and Burungale–Tian v2 pp.4–5.
The PDF page images, rather than OCR, controlled sign and exponent displays.
This is a statement/interface audit, not full proof verification of [KK3],
the early CM supplier, Greenberg's results or every cited reduction.

Corrected package locators for the early CM comparison (263–265), 15.14
(264), §5.2 (153–154) and the reference index's early section ranges.
Burungale–Tian's title is *A rank zero p-converse to a theorem of
Gross–Zagier, Kolyvagin and Rubin*, not a generic description of its §2.
Rubin page numbers refer to the public draft, not the published book.
Nakamura's twist transport additionally cites Definition A.4 and
Proposition A.5, pp.268–269. The source's full-level multiplicity error is
corrected by using its Γ₁ rank-two quotient. All twelve accepted source
repairs are retained at their mathematical uses: Bernoulli square,
odd-prime log lattice, dyadic GL₂ cohomology restriction, theta-divisor
inverse, d², Γ₁ quotient, integral symmetric dual, integral modules in
12.5(4), dual-form good periods, Nakamura cross-references, 12.4(3) integral
freeness, and split versus division quaternion image.

Source identities for reproducibility:

| Source/version | Public URL | SHA-256 |
| --- | --- | --- |
| Kato, Astérisque 295 (2004), 117–290 | https://www.numdam.org/item/AST_2004__295__117_0.pdf | 3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d |
| Rubin, public 1999 AWS draft | https://swc-math.github.io/notes/files/99RubinES.pdf | de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50 |
| Nakamura, Invent. Math. 234 (2023), 171–290 | https://link.springer.com/content/pdf/10.1007/s00222-023-01203-7.pdf | 47682f856244439d8cc3d3e6e0a4e1f804e6a710ec1a2dde8fad76f94aea20e4 |
| Burungale–Tian, arXiv v2, 11 Oct 2025 | https://arxiv.org/pdf/2506.03465v2 | cbb8284a13ed40bd15df9713001485724bc4d2a3b5c38d8fd83f9b6f3f3e4664 |
| Ribet, Glasgow Math. J. 27 (1985), 185–194 | https://math.berkeley.edu/~ribet/Articles/rankin.pdf | 88adbb7f4a931e5c8705a4773453315c06a98b52c434ce57e54336f8dc9353f8 |

## Supplier gaps retained; next work belongs to their owners

All 31 requests are expressed in the exact supplier contracts and the
consuming subsections. None of the 14 existing gaps is relabeled as closed.
For the package reviewer, their locations are:

| Input gap | Package location and required result |
| --- | --- |
| 1 | 3.4, PadicHodgeRegulators D.2: exact big-local-field reciprocity/square. |
| 2 | Contracts, 4.1/4.4/5.1/7.1–7.2: early all-prime CM elliptic-unit module structure and separate length bound; owner stage still unstaged. |
| 3 | 6.3: compatible arithmetic section on the same decent neighborhood; no cycle through PadicFamilies. |
| 4 | 6.1/6.3/7.5: exact de Rham scalar and integral ordinary image, with domains and periods. |
| 5 | 4.3–4.4/7.2: modular strict-Selmer/H² and rank comparison, including dyadic character decomposition. |
| 6 | 7.6–7.7: Greenberg criterion, formal-group norm freeness and exact ordinary control. |
| 7 | 3.2/6.2: complete period, Mellin, U_p, Gauss and character-inversion dictionary. |
| 8 | 1.5/3.1: open-curve finite-coefficient and logarithmic de Rham comparison, including Eisenstein step. |
| 9 | 2.5: completed Borel–Moore classical moment on the literal dual. |
| 10 | 6.1–6.4/7.4–7.5: dyadic regulator/Coleman/interpolation/growth exports. |
| 11 | 5.3–5.4: all-prime global-to-local semilinear twist compatibility. |
| 12 | 5.1–5.2: full-algebra finite support, regular μ and p-torsion-free quotient. |
| 13 | 4.1/4.3–4.4/7.2: cyclotomic determinant/splitting and nonsplit alternative; elliptic Serre consequences for 7.3/7.7. |
| 14 | 3.5/5.4: parabolic conductor inverse-limit torsion-freeness and exponential injection. |

The mathematical endpoints remain conditional exactly where the accepted
plan is conditional. Packaging does not authorize an assertion that all
supplier proofs already exist, or an upstream port before its prerequisite
roadmaps are upstream. The next worker can review the four committed files
without any scratch material. There is no unfinished package-writing step.

## Validation

Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
Suggested.lean imports Mathlib; no unavailable current-Tau-Ceti API is
silently used as a pinned import. The field Kummer audit is a boundary audit.

- Final `lean-check` on the package file: exit 0, with 113 warnings, all
  `declaration uses sorry`; no errors or other warnings.
- `python3 scripts/check_blueprint.py research/blueprint/packets/KatoEulerSystems.json`:
  0 errors, 0 warnings. Input unchanged, 40 nodes/60 API/41 tests.
- Coverage checks: 40 numbered target subsections, all 60 accepted API names
  and all 41 accepted construction-test names; 72 Lean examples.
- Independent exact-rational calculations: Bernoulli exponents, 24/48/1152
  smoothing, Euler factors, twist/parity, localized lengths and determinant
  −4 passed. Elaborated sorry proofs are not treated as mathematical proofs.
- Intake file validation: four deliverable files, zero problems. The staged
  diff also passes `git diff --cached --check`.

No checkpoint or additional claim is needed. The independent package review
should check the conditional interfaces and the representative Lean omissions
before a maintainer decides to port this roadmap.
