# Independent review of HB.4 — issue #6459

**Accepted after corrections.** Codex, session `codex-V1dOIH`, independently
reviewed the work of session `codex-kvLFkB` on 6 October 2026. This is a finished
target-level review, not a checkpoint. The packet remains `complete`, with HB.4
`planned`, three explicit gaps and one owner request. Acceptance does not certify
the missing arithmetic proofs or claim implementation.

The pass contains **13 nodes** (seven theorems, five comparisons, one construction),
**12 API items**, **four construction tests**, **two added planets**, and **18
confirmed baseline declarations**. Three nodes are verified unchanged and ten
are corrected, including their source pointers or suggested signatures. No nodes
were added, removed or split. All nine source findings are independently
confirmed: the original six and three additional published-text collations.

## Mathematical corrections

The near-unit application used `gcd(m,w_K)=1` although `K` already contains a
primitive m-th root. For m>1 that condition is impossible. CGZ Remark 2.6 uses
the number of roots of unity in the **base field before adjoining ζ**. The packet
and suggested file now use `gcd(m,w_F)=1`, with `K=F(ζ)`. In the Gauss-enlarged
application the proposed base is `F_G=Q(y_i,ζ_D)`; the coprimality condition on
`w_{F_G}` remains a hypothesis, not an automatic consequence of the CRT bounds.

The unresolved constant-term comparison was written in `H_rad=E(η_i)`, even
though the displayed Φ includes the Gauss value in `K=E(ζ_D)`. Its requested
ambient quotient is now `H_G×/H_G×m`, where `H_G=K(η_i)`. The separate descended
class must belong to the inverse-cyclotomic-character eigenspace in `K×/K×m`:
`K=F_G(ζ)` and `χ_cyc(σ)` is defined by `σ(ζ)=ζ^{χ_cyc(σ)}` for
`σ∈Aut_{F_G}(K)`. This specifies the action without confusing it with the
analytic Dedekind phase. The comparison remains a gap; enlargement alone does
not prove it or the near-unit scalar membership.

The sine formula gives `X₁=0`; the proof outline incorrectly said one. Its
forward tuple `(X₂,…,X_{r+1})` was already correct. At n=7 the printed reversed
tuple has maximum Nahm-equation residual approximately 0.1604895461, whereas the
forward tuple gives a numerical residual below 10⁻¹⁵. Telescoping the sine ratios
also proves the order directly. The inherited Rogers request and ±(r+1) product
classes are unchanged.

Removed six proof prerequisites that invoked the target being established or an
unreconciled arithmetic assertion: the parent radial expansion from the
analytic remainder proof; the parent tail bound from global domination; Kummer
invariance from the field construction and descent interface; the simplified
unit theorem from the normalization comparison; and the unit corollary from
formal root recursion. They remain parent comparison targets in the prose.
Definitions, explicit supplier formulas and recorded gaps supply the actual
proof routes. No analytic argument now relies on the unproved arithmetic claim.

Made the radial theorem's inherited rationality, positive-definiteness, odd
order and compatible denominator hypotheses explicit. Corrected the GZ (11)
page from PDF 5 to 4, the VZ Lemma 2.2(i) excerpt, the GZ Claims 2–3 excerpt,
the VZ convexity/Theorem 2.3 page range, and the Andrews–Gordon source excerpt.
The Rogers citation now points to the actual final trigonometric identity in
Zagier II.2C, printed p. 41.

## Every node checked

The packet's `review.checked` records a verdict and justification for every
immutable node id. The following describes the independent mathematical checks.

| Target | Check |
| --- | --- |
| Analytic convergence and branches | A positive Euler-product lower bound bounds reciprocal finite factorials uniformly on compact sets; positive definiteness supplies a summable quadratic majorant. Holomorphy follows locally uniformly. Rational powers use τ, and the C shift is exact. |
| Compact Pochhammer remainder | The guard bounds every deformed argument by √ρ<1. Splitting small and large logarithmic-series indices gives the stated ε⁻¹[ε(1+\|ν\|)]^{J+1} remainder; Bernoulli and factorwise-log conventions agree. |
| Finite-product modulus | Root-of-unity blocks reduce the principal integral to Li₂(e⁻ᵘ); block displacement, the first singular block and a final partial block contribute O(1+\|log ε\|), uniformly for every n, including zero. |
| Global domination | The potential has Hessian A+diag(1/(eᵘ−1)); strong convexity extends to the closed orthant. Completing the square absorbs B. The ε⁻¹/¹² window has tail bounded by a power times exp(−cε⁻¹/⁶). |
| Local remainders | After removing the quadratic term, a monomial tᵖxʲ has positive p, j≤3p and parity p. J=12(K+1), P=4(K+1) control the uniform truncations; a weaker Gaussian controls polynomial errors and lattice moments. |
| Poisson covolume | Iterate the pinned scalar Schwartz identity. Gaussian Fourier transforms give exponentially small dual modes uniformly in shift; cell volume is mᴺεᴺ/². The positive Gaussian integral is (2πm)ᴺ/²/√det H. |
| Congruence remainder | CRT supplies spacing mD√ε. Coefficients differ by D⁻ᴺ; their absolute difference is flat even if a leading coefficient is zero. G is never divided out. |
| Radial theorem | Combining the three dimensional factors gives m⁻ᴺ/², with χᴺ, negative B, the −Nε/(24m) eta term, Gaussian 1/(2m), cyclic arguments ζθ, and the exact C shift. Its coefficient identification uses the corrected parent formal bracket. |
| Coherent fields | ηᵐ=y and ηᵈ=θ fix rational powers. Bezout gives E(η)=E(θ) when (d,m)=1. The finite generators are integral over E and all their m-th-root conjugates lie in the field; characteristic zero gives a finite Galois extension. |
| Descent interface | All T coefficients lie in H_rad, but invariance of C⁻¹Tᵐ still requires the full Gaussian translation/reindexing proof. The interface acts on actual automorphisms and coherent η. Its gap is precise and is not treated as proved. |
| CGZ comparison | The displayed ω has square in Q(z)×. Conditional coefficient descent gives Φᵐ in K[[ε]]. Rational roots, Gauss values, the constant class and its character action are separated, with the last comparison explicitly unresolved. |
| Nonzero series descent | At order p the new coefficient of Uᵐ is mUₚ plus lower coefficients. Characteristic zero gives induction and uniqueness with U₀=1. Scalar membership for the near-unit corollary is separate, and Φ₀≠0 is retained. |
| Andrews–Gordon acceptance | Read the QM.0 identity and min-matrix supplier statements. B=0 excludes 0,±(r+1), not ±1 in general. Rank zero, Rogers–Ramanujan, rank two and the forward trigonometric tuple are consistent. |

Numerical checks are regression evidence, not substitutes for these proof
routes. For the Rogers–Ramanujan case the estimates of a₁/a₀ at ε=0.04,0.02,0.01
are −0.0166611123, −0.0166638892, −0.0166652778, tending to −1/60. At a=2,m=3,
the printed eta phase divided by the factorwise-log phase is exp(πi/6); the
weighted-log phase agrees with exp(πi s(a,m)). For A=1,B=0,m=3, the finite Gauss
sum is (1−1)/2=0, so the flat-difference convention is necessary. For A=1,B=1/4,
m=1 the leading value 2⁻¹/⁴ has irrational square, disproving the printed
rational-field normalization package; the half-integral B=1/2 case also
distinguishes the particular chosen normalization from the coordinate field.

## Baseline, API and suggested file

Read all declarations at **Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174**. No original citation was removed or
replaced. Five exact citations were added for the field API and fixed-element
descent. Tau Ceti was inspected at
**f790474821cf4256814db967cb154e7af3d0c369**; no Tau Ceti declaration is claimed
as new support or imported by this suggested file.

| Declaration | Hypotheses or convention checked |
| --- | --- |
| `multipliable_one_sub_of_summable` | Complete normed ring and summable norms. |
| `tprod_one_add_ne_zero_of_summable` | Nonzero factors, complete space and `NormMulClass`. |
| `Complex.cexp_tsum_eq_tprod` | Summable principal logarithms and nonzero factors. |
| `ModularForm.multipliable_one_sub_pow` | Norm q<1; exponent n+1. |
| `ModularForm.differentiableOn_tprod_one_sub_pow` | Open unit disc and the same Euler product. |
| `Matrix.PosDef.det_pos` | Finite matrix over the appropriate real/RCLike field; `PosDef` includes symmetry/Hermitian structure. |
| `integral_gaussian` | Integral of exp(−bx²) equals √(π/b); here b>0. |
| `SchwartzMap.tsum_eq_tsum_fourier` | Scalar real-domain Schwartz Poisson identity with the actual shift phase; higher dimensions are obtained by iteration. |
| `Asymptotics.IsBigO` | Eventual norm bound at a specified filter. |
| `IntermediateField.adjoin` | Field closure containing the algebra-map image and generators. |
| `PowerSeries.coeff` | Ordinary coefficient linear map over a semiring. |
| `Polynomial.bernoulli` | Rational coefficients and B₁(x)=x−1/2. |
| `IsPrimitiveRoot` | ζᵐ=1 and divisibility of every exponent giving one. |
| `IntermediateField.adjoin_le_iff` (added) | Minimality in another intermediate field. |
| `IntermediateField.finiteDimensional_adjoin` (added) | A finite set of elements integral over the base. |
| `IsPrimitiveRoot.eq_pow_of_pow_eq_one` (added) | Positive root order in a commutative domain; all roots of unity are powers of ζ. |
| `IsGalois.mem_range_algebraMap_iff_fixed` (added) | Both finite-dimensionality and Galois hypotheses are essential. |
| `IntermediateField.inclusion` (added) | Canonical algebra hom for E≤H, supplying the compatible base algebra structure. |

Added five field API items: minimality of each field, the coherent radical-power
relations, finite Galois structure, and the action of actual automorphisms.
These directly support the coefficient-descent and normalization uses. Existing
membership and generator comparisons are retained. Generic field maps,
extensionality and algebra hom laws come from Mathlib; they are not replanned.
All 12 API names occur in the suggested file. The four tests detect omitting
the radical, failing the m=1 collapse, adjoining unnecessary elements in the
integral case, and incorrect trivial-coordinate generators. The strict cubic
extension test follows because a degree-three real radical cannot lie in the
quadratic field Q(ζ₃).

Added concrete Lean holomorphy and CRT restricted-tsum remainder signatures.
The new Galois signature uses the actual inclusion algebra. The unavailable
parent ψ/formal-Gaussian, Bloch and near-unit types remain exact documented
interfaces, with no proposition-valued substitute structures. The prototype
is explicitly non-exhaustive. Every implementation status remains `unchecked`.

## Sources and source findings

Downloaded and matched all six packet SHA-256 hashes. Read the public
[GZ journal article](https://d-nb.info/1217648526/34),
[GZ arXiv v1](https://arxiv.org/pdf/1812.07690v1),
[CGZ journal article](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf),
[CGZ arXiv v3](https://arxiv.org/pdf/1712.04887v3),
[Vlasenko–Zwegers preprint](https://arxiv.org/pdf/1104.4008), and
[Zagier's chapter](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf)
at the packet locators. The VZ claims are scoped to the named preprint; the
version of record is not claimed read. Journal/preprint equation-number
differences are retained. The Springer article, current arXiv version histories,
author publication pages and title searches did not reveal a separate relevant
erratum. That is a record of the search, not an assertion that none exists.

| Finding | Independent verdict |
| --- | --- |
| E-HB4-1 | Confirmed journal phase error; use the numerator-dependent Dedekind phase. |
| E-HB4-2 | Confirmed journal integrand/Gaussian/cyclic inconsistencies. Journal (10) fixes exponentiation of ψ, but (14) does not; the missing eta correction changes the first coefficient. |
| E-HB4-3 | Confirmed incorrect Poisson prefactor and inconsistent Gaussian. |
| E-HB4-4 | Confirmed scoped proof gap: §4.3 supplies the analytic expansion, not the all-orders automorphism identity. |
| E-HB4-5 | Confirmed false exponential-decay inference for general smooth/Schwartz functions. Also recorded the missing negative exponent in the rapid-decay condition. The polynomial-Gaussian application is valid. |
| E-HB4-6 | Confirmed rational-field counterexample to the CGZ package. Odd order is the verified scope of the cited GZ result; absence of an even-order proof alone is not a counterexample. Remark 2.6 has the base-field coprimality condition. |
| E-HB4-7 (added) | Parent E9 still occurs in the journal: formal coefficient valuations must tend to infinity, not zero. |
| E-HB4-8 (added) | Parent E16's reversed sine tuple persists on published p. 420. |
| E-HB4-9 (added) | Parent E18's free-index typo persists in published (43), p. 417. |

## Coverage and ownership

Read the reviewed HB.4 library audit and the parent/supplier packets. Existing
Euler convergence, scalar Gaussian integration, scalar Poisson summation,
intermediate fields, Bernoulli polynomials and coefficient extraction are used
as library tools. Pinned Tau Ceti's Pochhammer module concerns descending
ordinary Pochhammer polynomials, not q-factorials. No Nahm/cyclic-dilogarithm or
all-orders root-of-unity theorem was found at the pins.

The accepted parent supplies definitions and corrected formulas. HB.3 supplies
the distinguished solution and coherent root/Bloch-class boundary; the exact
integral boundary is not inferred by cancelling a torsion denominator.
HabiroNumberFields:HB.2 owns the cyclic dilogarithm and R_ζ. QM.0 owns
Andrews–Gordon. Polylogarithms:P.1 owns the unsupplied Rogers circle-valued and
trigonometric identity; the request specifies its normalization and constant.

Confirmed **RT-AREA-topology/11** against the finding, independent verifier,
parent packet, this packet and this reader. HB.4 supplies radial Euler–Maclaurin
and saddle estimates to QT.6, and HB.8 supplies formal Gaussian theory. QT.6
owns topological identification, contours, Faddeev integrands and 2–3 invariance.
HB.10 knot matrices remain formal unless the QT.6 identification is imported.
HB.4 has no prerequisite on QT.6, and positive-definite radial
hypotheses are not exported to arbitrary knot matrices.

All stage targets have nodes or a precise retained gap/owner request. The three
remaining inputs are coefficientwise Kummer invariance, rational-data arithmetic
normalization, and the Rogers owner input. Thus `planned` is honest; `closed`
would be false. The two added planets are central remainder theorems; together
with the parent's four, the layer has six.

## Validation and orchestrator follow-up

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNahmSeries--HB.4.json`: zero errors, zero warnings.
- Source findings and version metadata pass `source_issues.check_issues` and `check_errata.versions_checked`. The standalone `check_errata.py` CLI expects an `errata-v1` job, so its outer job-schema check does not apply to this blueprint packet.
- `lean-check research/blueprint/suggested/HabiroNahmSeries--HB.4.lean`: exit 0, only declaration-uses-`sorry` warnings, at pinned Mathlib. Memory exceeded 20 GB; no library build or language server was used.
- All API/test names are present, all literal excerpts were checked, source hashes match, and `git diff --check` passes.

**Reader synchronization:** the issue authorizes only packet, suggested file,
report and own handoff. A reader update must therefore be routed by the
orchestrator. In `readmes/HabiroNahmSeries--HB.4.md`, synchronize the coherent-field
API (§9), the constant-class ambient field and character (§11), `w_F` rather
than `w_K` (§12), `X₁=0` (§13), direct inputs and the new source collations.
The old BP handoff also contains the superseded `w_K` phrase. These are identified
content updates, not permission requests or additional claims. The corrected
packet and suggested file are the deliverables of this review.

**Owner follow-up:** before any closed/arithmetic export, prove the exact full
integrand automorphism identity, settle the constant/eigenspace/representative
comparison over the explicitly stated fields, and supply the Rogers request.
The parent simplified theorem's smaller-field assertions should be reconciled
in that owner job, using this part's rational/half-integral counterexamples.
