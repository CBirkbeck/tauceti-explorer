# PKG-GL2AutomorphicRepresentationsAndTransfer — complete package

Worker: Codex, session `codex-tTVABS`; issue #7901; 2026-10-10.
Branch: `codex-tTVABS-gl2-package`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7901#issuecomment-6100220222).

**Complete for independent package review.** All 112 accepted targets and 122
reader sections are retained. The original cubic source blocker is replaced
by an all-place construction from primary GL3 induction, local LLC pair
compatibility and the full GL2 converse theorem. The package has its math.NT
metadata. Suggested.lean elaborates with 153 sorry warnings, no errors or
other warnings; six new S3 matrix fixtures are fully proved. It remains a
roadmap specification, not an implementation of automorphic transfer.

No manager-priority issue was available/eligible. This eligible focus package
was taken under WORKERS.md; no second job was claimed. Only the four permitted
deliverables changed. The accepted packets and assembled inputs are unchanged.

## All-place non-normal cubic construction

The reader’s R17.4/nonnormal-cubic-base-change now gives the following route,
with a construction API, local and global tests and exact source locators.

1. JPSS1979 Theorem 14.2 pp.253–254 constructs the cuspidal GL3 representation
   of an irreducible unitary degree-three global Weil representation when all
   character twists have entire, strip-bounded L-functions. Its monomial remark
   p.255 explicitly allows **every separable cubic extension**, not only cyclic
   extensions. For Ind_K/F θ irreducible, Tate gives all required twisted
   analytic properties. Henniart1983 Theorem 2.10 pp.20–21 identifies its finite
   local components with the actual rank-three LLC; §3.5 pp.33–34 records the
   global application. Infinity is JPSS’s Langlands component.
2. JPSS p.255 says reducible non-normal cubic induction has a character μ
   plus a monomial two-dimensional summand. Frobenius reciprocity forces
   θ=μ∘N_K/F. The S3 permutation module is1⊕Std; Std is the quadratic
   induction of the order-three resolvent character ξ. Thus AI3 θ=μ⊞μσ0,
   where σ0=AI_E/F ξ and E is the quadratic resolvent. In particular this
   isobaric branch is available with all-place parameters, using the preceding
   quadratic-induction target, without invoking a non-normal cubic lift.
3. Form the actual restricted tensor Π_w=LLC(Res rec π_v). ET.6 supplies finite
   local LLC and pair factors, AF.1 supplies infinity. Generic unitary GL2
   components remain generic: temperedness, nonzero Steinberg monodromy and
   complementary exponents strictly within ±1/2 survive restriction. Sphericity
   almost everywhere, idele-class centre and a right half-plane of Euler
   convergence hold before any converse theorem is applied.
4. WD tensor-induction gives Λ_K(Π⊗θ)=Λ_F(π×AI3 θ), with the same dual
   comparison. Henniart2002 Theorem 1.5 p.590 and §2 pp.593–596 supply the
   all-rank local pair-factor contract imported from ET.6. Keep the local
   induction constant: ε_F=λ_v²∏_w ε_K for the trace additive characters
   and self-dual measures. Deligne1973 Proposition 3.8 pp.530–531,
   Theorem 4.1 p.535,5.6.2 p.549 and5.11 p.551 imply ∏_vλ_v=1 by comparison
   of the permutation representation and the two zeta functional equations.
   Section8.12 p.572 supplies the invariant-kernel correction with N retained.
   This is a specialized factor comparison, not a second generic LLC theory.
5. AL.3’s unequal-rank pole theorem makes π×AI3 θ entire in the cuspidal
   induction case. In the norm case the product is Λ(π⊗μ)Λ(π×μσ0).
   Its only possible poles occur when π is a norm twist of σ0. The completed
   strip bounds and both functional equations are AL.3’s existing contracts;
   norm shifts give every quasicharacter twist. The full n=2 converse with
   no excluded places therefore produces a cusp with every prescribed local
   component when π is outside that family.
6. For π=σ0⊗ν, Std|C2=1⊕sgn constructs BC π=(ν∘N)⊞(ν∘N)η_L/K directly.
   These and only these inputs have non-cuspidal output. Isobaric strong
   multiplicity one proves uniqueness; local restriction gives twist and
   central character. A six-fixture integer-matrix check proves the S3
   relations, reflection eigenvectors and determinant−1. It does not prove
   the analytic or automorphic steps.

This deduction is written in our own words and attributed to its inputs.
Cogdell’s converse survey §3 applications(iv) p.10 identifies these converse
methods as the source of non-normal cubic base change. No inaccessible
passage or unsupported invocation of the 1981 note is needed. The all-place
result supplies Carayol12.2’s local conductor comparison, including the
extraordinary dyadic case, and the cubic input for octahedral Artin automorphy.
Neither good-place uniqueness nor descent through the S3 closure chooses a
bad local parameter in this proof.

The original JPSS1981 note at Gallica still returns403; its uncleared AMS
Selected Works reprint was not obtained. Mao–Rallis2000 Theorem1 p.172 and
Theorem6 p.195 give a different weak relative-trace proof. Its discriminant
and height-tail obligations are not silently assumed: that route is not the
package’s existence proof. The previously proved pure-cubic norm-phase
fragment is preserved as a subsidiary algebraic target. For Q2(cuberoot2),
discriminant squareclass−3 is nonsquare; its quadratic critical terms have
opposite signs. Do not resurrect the square-discriminant assertion.

## Validation and dependency audit

- `lean-check` of the full package Suggested.lean exited 0; 153 warnings, all
  declaration-uses-sorry; zero errors or other warnings. Available memory
  before compilation: 100 GB. The six new matrix examples have complete proofs.
  No declarations changed after compilation. No Lean process remains running;
  no language server, Lake build, update or cache command was used.
- Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`.
- Both accepted packets pass `scripts/check_blueprint.py`:0 errors, 0 warnings.
  They contain 55+57 nodes and still record 16 inherited gap entries and 67
  supplier requests. This package provides their target-level dispositions;
  their JSON records could not be edited in this job.
- Coverage check: 112/112 accepted target anchors, 122 section headings, all 19
  accepted definition/construction sections with API and tests, no undefined
  bibliography keys. API names, hypotheses, tests and source locators were
  retained while removing duplicated slug prefixes from headings and code
  formatting on dependency IDs. Reader size: 199946 bytes.
- Metadata is exactly `topic = "math.NT"`. Scoped intake (`check-files`) passes
  for all four deliverables: 4 files, 0 problems. `git diff --check` passes.
- Read WORKERS, both protocols and UPSTREAM_GUIDE. Read current upstream
  RepresentationTheory/ModularInduction and CharacterTheory completely.
  Checked the reviewed GL2 audit and relevant AL.1/3/4 and ET.6 contracts.
  The lower-tier ET.6 classical GL_m LLC supplies the pair comparison; no
  GL2-owned global cubic theorem is used to manufacture that input.
- Read-only roadmap main `3c18d9fbfceed0dc5c1edb1070a3927152d19e28` and current
  Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were inspected, never
  modified or built. The additional roadmaps do not contain this transfer.
  Generic finite induction, ordinary character theory, nuclear operators and
  arithmetic carriers retain their existing owners.

## Disposition of the inherited obligations

| Obligation | Package disposition |
| --- | --- |
| Archimedean classification/factors/quaternion comparison | Explicit chambers, full-O2 limit, epsilon and SU2 character/sign; AF.1 and AL.2 own the carriers. |
| Smooth/automorphic/test-function signatures | Exact source conditions and named §13 omissions; absent native interfaces are not replaced by arbitrary types. |
| Newvectors and ramified factors | Last-row fixed spaces, Whittaker evaluation and complete primitive U_p dictionary with three distinct fixtures. |
| Primitive dyadic example | Level1/2 compact type, conductor3, Swan1, primitive parameter; normalized coefficient and matching-test trace/sign specified through ET.6. |
| Galois convention and ramified geometry | Actual parabolic realization, dual Frobenius convention and Varshavsky curve-trace route; strong cubic comparison now available. |
| Singular/continuous trace | Separate scalar/local derivative and B1 estimates, finite measure comparison; proved native circle fragment. |
| Tensor/supplier conditions | Genuine symmetric powers and finite tensors; scalar, dimension, dual and coefficient maps, with named analytic omissions. |
| Quaternion ramification realization | Global Hilbert prescription, reciprocity and Brauer uniqueness on existing quaternion algebras. |
| Highly ramified GL3 converse | Fill-and-twist deduction from lower reduced-rank converse, with no unjustified cuspidality. |
| Non-normal cubic/all-place lift | New all-place induction/converse route above and explicit reducible exception. |
| Quaternionic globalization | Balanced EP sign, fixed-centre projection, trace norm integral and positive identity term. |
| Solvable residual lifting | All-rank integral Fong–Swan/Brauer chain and faithful arithmetic signatures. |
| Full local character prescription | Primary Chevalley S-unit route, actual modulus/idele-class interfaces, no order-preservation claim. |
| All-place Artin matching | Stability and bad-place isolation with explicit infinity matching; cubic existence supplied above. |
| GL3 recognition signature | Exact converse/pole conditions and honest omission until the concrete supplier objects exist. |
| Source-specific transfer signatures | Native field/local/global/factor/model interfaces identified; algebraic fixtures are subsidiary tests. |

## Preserved mathematical receipts

The following receipts are inherited from prior workers. Their source readings
and proofs are not represented as newly performed in this session. Their
mathematical conclusions are preserved in the package. The former cubic gap
is superseded by the construction above.

### Joint cyclic spectral bounds

R17.2/specialized-trace-comparison now controls each derivative separately,
including the logarithmic orbital correction. A combined signed trace identity
alone would not give the needed estimate.

1. Fix the other factors and the spherical unit at a good split place. Lift a
   compact-mod-centre test with a central cutoff on GL2(A)^1 and project to its
   prescribed character of the compact quotient Z(F)\Z(A)^1. The original
   compact-mod-centre test need not be L1 on GL2(A)^1: its adelic centre before
   quotienting by Z(F) is not compact. The lifted smooth compact test has all
   archimedean differential L1 seminorms finite. Central projection has norm
   at most one and commutes with the invariant-centre cyclic action.
2. Finis–Lapid–Müller2011 Theorem3/Proposition1 pp.183–184 and §5.1–2
   pp.187–191 give the joint absolute estimate. Delta=1−Omega+2Omega_K has
   block bound |mu|² >= (1+t²+lambda_pi²+lambda_tau²)/4, equation(5.2) p.188.
   Normalize M=nN and expand M^−1M'=(n'/n)Id+sum_u N_u^−1N_u'. The displayed
   scalar weighted L1 bound p.189 uses Müller2002 Theorem5.3 and bounds its
   absolute value individually. At fixed level only finitely many local
   normalized derivatives survive. Their rational degrees are bounded at
   finite places and polynomial in the archimedean K-type, with polynomial
   block dimension. Unitarity, Lemma1's integrated variation bound and Lemma2
   pp.190–191 control each one. At p-adic places q^s is periodic, so retain
   the decaying real-parameter weight. Choose the resolvent power beyond
   these powers and the discrete counting exponent (Müller1998 Cor0.3 as used
   on p.188). The dimension-weighted block sum and integrals converge before
   signed traces; central projection preserves the bound.
3. Müller–Wakatsuki2026, arXiv2607.18870v2, Theorem11.1 pp.14–16 and
   Theorem13.1 pp.17–18 give the twisted version for Res_(E/F)GL2 with sigma.
   Its unitary U_P, conjugated level and equation(11.1) preserve the resolvent
   bound. Its proof invokes those same individual FLM Proposition1 bounds.
   The paper's initially trivial twisting character is distinct from the
   fixed central character, selected by the commuting central projection.
   Retain self-associate terms and the quadratic exceptional summand as
   zero-dimensional spectral contributions.
4. B1 is separate from the normalized intertwiner. Langlands1980 §9 pp.98–99
   gives second real and third complex distributional derivatives of its
   compact logarithmic orbital function as finite measures; p.111 gives
   second derivatives for the nonsplit real twisted quotient. Fourier–Mellin
   decay is O((1+|t|)^−2) in dimension1, O((1+|(t,m)|)^−3) in dimension2,
   and order2 on the nonsplit real quotient of dimension1. Other archimedean
   Abel transforms are smooth/compact; finite-place transforms have bounded
   conductor. Fixed-level characters are finitely many lattices times a real
   norm direction, by S-units and finite ray classes. Disjoint fixed-radius
   tubes compare their sum/integral with the integrable product decay, also
   for sigma-invariant subsets. Do not attribute this B1 estimate to FLM.
5. Hence sum|c_i| and integral|d(it)| are finite in Langlands1980(11.6)–(11.7)
   pp.136–137. Push d to the circle of period 2pi/|log|uniformizer|| and its
   Weyl quotient. Countable point fibres imply zero singleton measure, with
   variation bounded by the L1 norm. The extra M3 supremum bound is unnecessary.
   The Weyl-invariant Laurent algebra is self-adjoint on the compact unitary
   Satake set, including complementary parameters, and separates its orbits.
   Uniform density equates finite measures and kills aggregated atoms. For
   each original coefficient first bound the tail, then separate the remaining
   finite set at finitely many good places (§11 p.138). This permits arbitrary
   finite changes of bad-place factors.

The new `spectralCircle_fibre_countable` and
`spectralCircle_density_singleton` use the actual `AddCircle`, Lebesgue
`volume.withDensity` and `Measure.map`. Both and three fixtures have complete
proofs. The Weyl-fixed points0 and1/2 have zero singleton measure; a Dirac input
keeps its atom. Unbounded density is permitted: the separate L1 condition is
needed for finite variation, not zero singletons. The reader also tests harmonic
cutoffs, integrable unbounded |t|^(−1/2) on(0,1), and a constant parameter map.
Native trace distributions/resolvents/Satake carriers remain explicit signature
omissions. The new circle fragment does not formalize the trace formula.


**Ramified curve trace.** R17.6/classical-conductor-comparison now has a
source-backed proof route for the gap left by Langlands1973 Proposition7.12
pp.89–90. Use Varshavsky's author preprint math/0505564v2, Definition2.1.1
p.17, Theorem2.1.3 pp.17–18, point-term formula1.5.7 p.16 and proper trace
Corollary1.2.6 p.10. On a smooth proper curve with constructible ell-adic
complex F and u:c₂*F→c₁!F, reorder the correspondence to (c₂,c₁) and use
its adjoint c₁!c₂*F→F. At a fixed branch write c₁*t=alpha t^a and
c₂*t=beta t^d, with units alpha,beta and positive unequal a,d. If d>a,
(t^d)⊂(t^a) and da≥a(a+1), so n=a gives contraction. The fixed ideal
is (t^a) up to a unit. The contracting theorem reduces the local term to
the restricted point trace; its nonreduced length a adds no multiplicity.
If a>d, dualize u and reverse the correspondence, using n=d. Evaluation
and biduality from §1.2.2 pp.8–9 preserve the alternating local trace under
transpose. Proper Lefschetz–Verdier sums these terms. At a cusp j!F has
zero ordinary stalk, but D(j!F)=Rj*DF can have a nonzero stalk; keep the
complex. Tests include (a,d)=(1,p^m),(2,3),(3,2); equal orders are excluded.

The new `TauCeti.GL2Transfer.ramification_contraction` is fully proved for
ideal powers in a commutative ring, with three proved fixtures. The equality
case is rejected using the principal ideal (2) in Z. This formalizes the
contraction inequality, not the six-operations or local-trace theorem. The
suggested file explicitly omits the latter's unavailable concrete carriers.
The target-level proof route and the native ideal fragment must not be
reported as a completed formalization of ramified trace.

**Archimedean contracts.** R16.2/classification now states real and complex
reducibility chambers, ordering, constituent dimensions and the full-O(2)
weight-one limit. For chi_i=sgn^epsilon_i |.|^s_i and Re(s₁−s₂)≥0,
reducibility means nonzero integer r=s₁−s₂ with r−(epsilon₁−epsilon₂)
odd. Positive r gives a D_(r+1) submodule with the common norm twist and
an r-dimensional quotient; reversing order reverses the sequence. At r=0
and opposite parity the full-O(2) representation is irreducible, though
restriction to positive determinant splits. For complex ratio z^p bar(z)^q,
reducibility requires p,q both positive integers or both negative integers;
the positive finite quotient has dimension pq. Raising/lowering and reflection
supply the real proof; the complex infinite constituent has SU(2) weights
n≥p+q with the required parity. Real Weil induction with m=0 is split.
AF.1 remains the owner; no private archimedean representation was created.

These locators use the UBC author retypeset of Jacquet–Langlands1970:
§5 Lemmas5.6–10, Theorem5.11 pp.83–87; §6 Lemma6.1, Theorem6.2 pp.111–113.
The reader has a separate `[jl70-ubc]` reference. Do not substitute its page
numbers into citations to the inherited IAS editorial retypeset; the two
paginate differently. R16.3 adds epsilon_C(z^m |.|^s,psi_R∘Tr)=i^|m|,
using AL.2's exact supplier. The two Gamma-normalization examples now use
`Complex.Gammaℝ_def` and `Complex.Gammaℂ_def` directly, removing two sorries.
R17.1/real-quaternionic-comparison gives the SU(2) Sym^(k−2) character,
dimension k−1 and elliptic sign −1 after summing both D_k weight tails.
It tests k=2, k=3 and exclusion of k=1. The same norm twist and central
sign^k are retained.

**Globalization and spectral ledger.** The quaternionic D₂ EP calculation
uses the split-centre-balanced pair (sl₂,O(2)), not (gl₂,O(2)). Its relative
cochain dimensions are 0,1,0, hence EP=−1; negate AS.6's EP function to get
trace +1. The fixed-centre Fourier projection now has a trace-norm argument:
for trace-class T, ||R(z)T||₁=||T||₁, and finite-rank approximation proves
trace-norm continuity. Compact centre integration therefore commutes with
trace by AS.0/trace-class. Details and source locators are below.

**Ownership.** Quadratic induction now precedes nonnormal cubic transfer in
R17.4; the old R17.5 anchor remains for links. A future permitted packet job
must move `R17.5/quadratic-induction` to `R17.4/quadratic-induction` and repoint
consumers. Its mathematics, API and tests were preserved. The accepted packets
were not edited. Earlier downward ownership moves are recorded below.

## Inherited norm-phase fragment

The three fully defined algebraic fragments `pureCubicMatrix`,
`pureCubicNorm`, `pureCubicQuadratic`, their formula lemmas, both critical-point
phase expansions and eleven fixtures remain proved without `sorry`. In
Q[t]/(t³−2), the norm is a³+2b³+4c³−6abc and the trace quadratic is
Q=3a²−6bc. At critical points C=±1 the phase expansion is
−2C+CQ(a,b,c)+N(a,b,c). The quadratic part is Q at +1 and −Q at −1.
Its Gram determinant is −27, one quarter of polynomial discriminant −108;
over Q₂ the square class is −3, whose nonsquare unit residue is5mod8.
These are algebraic receipts for the local correction, not stationary phase
or transfer, and the full cubic carrier remains explicitly omitted.

## Character prescription: complete target-level route, arithmetic proofs planned

The actual new signatures are `fg_of_units_outside_finset`,
`chevalley_power_congruence`, `chevalley_finiteIndex_congruence`, and
`finite_hecke_full_local_prescription`, in `TauCeti.GL2Transfer`. The first,
second and fourth have `sorry` proofs. The finite-index consequence is proved
from the power-congruence statement and the exponent of E/H.

They use `Modulus`, `IsCongrOne`, `HeightOneSpectrum`, adic completion units,
`ContinuousMonoidHom`, and Mathlib's actual `IdeleClassGroup`, including its
`ofAdicCompletion` and `ofCompletion` maps. The domain includes **all** local
units and uniformizers. No private idele carrier is introduced.

Chevalley's primary argument, Theorem 1 p.36 and §§1–5 pp.36–39, was read
again during the final proof audit. The reader uses this route:

1. The valuation map of S-units lands in a subgroup of the finitely generated
   group Z^S; its kernel lies in ordinary units. Dirichlet and finite generation
   of extensions give finite generation. The saturation E₀ of a finitely
   generated E is in an S-unit group; E₀/E is finite. If u kills it, an nu-th
   root in the base gives an n-th root in E.
2. Reduce to prime powers. For the dyadic case without i in the base, pass to
   M(i) and increase exponent 2^e to 2^(e+k), where 2^k is its largest
   2-power root-of-unity order. If f is the least exponent making y^(2^f)
   rational over M, quadratic conjugation gives a primitive 2^f-th root as
   sigma(y)/y, so f ≤ k. This returns the required root to M.
3. For odd p, or a base containing i, descend roots through the cyclotomic
   tower. The initial degree divides p−1 and uses the norm/Bézout identity.
   In a degree-p step the conjugation exponent f satisfies
   p^e | f(1+g+...+g^(p−1)); the sum has p-adic valuation one (h ≥ 2 for
   p=2). The ratio is therefore in mu_p. A power of the next cyclotomic
   generator makes y invariant without changing y^(p^e).
4. With mu_(p^e) in the base, the generator-root extension is an abelian
   p-extension. Select a prime inert in each degree-p subextension, avoiding
   the exponent, generator denominators, ramification and every rational
   prime below the requested avoidance set. Congruence to one gives a local
   root by Hensel. All roots now generate the **same** global field; a
   nontrivial root field contains a degree-p subextension, contradicting the
   selected inert prime. Combine the rational moduli and descend.

**Do not restore the general subgroup/derangement shortcut.** It was briefly
reintroduced from Chevalley's printed remark pp.39–40, then removed in an earlier
continuation's final audit. Without roots of unity in the base, local roots at different
primes can belong to different global root orbits. The example X^8−16 over Q
makes this failure concrete: it has no rational root, but has a root over each
odd Q_p in one of Q(sqrt(2)), Q(sqrt(−2)) or Q(i). A local root cannot be
assigned to a single previously selected root field. The primary proof's
cyclotomic and dyadic steps are essential to the reader's argument.

For full prescription let H be the kernel of the product of the prescribed
finite local characters on E=O_(M,S)^×. Choose the Chevalley modulus away S.
In the ideles take

`B = M_infinity^× × product_(v in S) M_v^× × product_(v outside S) U_v(m)`.

The product character theta kills B intersect M^×. Let D be image B and N
image ker theta in C_M. The quotient map is open, so N is open. Unit depths
killed by the prescribed characters, together with m, give a ray subgroup
inside N and hence a finite quotient C_M/N. Apply the already proved
`finite_character_extension_iff` to D,N. The resulting finite global character
has every full local component requested and is trivial at infinity. Auxiliary
ramification and growth of character order are permitted.

The earlier theorem `finite_character_extension_iff` remains fully proved:
for a commutative topological group, open finite-index N and chi on H, a
continuous finite-image extension killing N exists iff chi kills H intersect N.
It reuses Mathlib `MonoidHom.domRestrict_surjective`, not a new divisible-group
extension theorem. Its power bound is exponent(G/N), not the order of chi.
Its three generic proved tests and the concrete Q_2 uniformizer/Dirichlet
conductor-five/Z_4 order-growth examples remain.

A single quasi-character is corrected by a global norm twist; arbitrary
simultaneous exponents are not permitted. The CM application first constructs
its angular infinity character by Patrikis Lemma2.3.1 p.28. At a nonsplit prime
P, P^h=(a) gives a/conjugate(a) a unit with absolute value one everywhere,
hence a root of unity. This proves the needed finite local order before the
finite correction. A second nonsplit place detects a nontrivial sigma(x)/x;
Hilbert90 identifies norm pullbacks with sigma-invariant characters.

## Modular characters and the residual lift

`brauerCharacter` is defined on p-regular elements using a multiplicative
identification of prime-to-p roots with complex roots, with eigenvalues counted
by algebraic multiplicity. Its spectrum, identity and conjugacy APIs and three
rank-one/cubic/rank-p tests are present. It is not a lift of the modular trace.
The rank-p identity test gives p in C even though its modular trace is zero.

The reader owns the finite group algebra/projective-cover pairing needed for
Brauer character recognition, extending the ordinary-character supplier rather
than pretending it includes modular characters. Webb Theorem10.1.1 p.170,
Proposition10.1.3(5)–(6) pp.170–171, Theorem10.2.2 p.176 and Corollary10.2.3(3)
p.177 were read. Equal Brauer characters give equal composition multiplicities;
if one module is simple, the whole reduction is isomorphic to it.

`solvable_finite_image_integral_lift` now states the all-rank/all-prime Fong–Swan
conclusion on genuine carriers: finite solvable Gamma, algebraically closed
characteristic-p k, irreducible r; a number field E, a height-one prime lambda,
R=Localization.AtPrime lambda.asIdeal, a map R→k whose kernel is its maximal
ideal, rho:Gamma→GL_n(R), and P with r(g)=P map(rho(g)) P^−1. Its proof is
planned. No prime-to-group-order or projective-lift assumption is substituted.

Read Isaacs Theorem1.2 p.171, Theorem5.4 pp.179–180 and §6 pp.180–181, together
with §§2–5's Clifford/extension lemmas; Webb9.2.6 p.143 and9.4.6–7 pp.152–153
for splitting fields and stable DVR lattices. The chain is finite splitting
field descent → ordinary character lift → number-field splitting realization
→ full stable lattice → Brauer comparison → actual residual isomorphism.
Inflate from the finite image for continuity. The existing determinant and
residual-conjugacy lemmas prove total oddness when p>2. No conductor or local
ordinary property is claimed. Those lemmas have complete proofs, including the
characteristic-two counterexample. The explicit 48-element GL_2(F_3) section
and its projective/reduction tests are preserved as a separate special case.

## Local, analytic and globalization additions

**Primitive dyadic fixture.** In Q_2 take the hereditary order with lower-left
entry in 2Z_2 and alpha=[[0,−1/2],[1,0]], alpha^2=−1/2. Let E=Q_2(sqrt(−2))
and J=E^×U^1. The level-one simple character extends to Lambda and
c-Ind_J^GL2 Lambda is supercuspidal, with intertwining J. Bushnell–Henniart
15.1 p.105,15.3 p.106,15.6 Proposition1 pp.108–109,24.3 pp.149–150,25.2 pp.157–159
and44.3–6 pp.269–273 were read in the cleared copy. Changing from additive
character trivial on2Z_2 to the one trivial onZ_2 changes epsilon exponent
by2: conductor3, N=0, Swan1 and positive break1/2. The ordinary criterion
n≥3d fails for n=1 and a quadratic dyadic different exponent at least2.
A quadratic field used for its type is not evidence that its Weil parameter
is induced from that field. The division-algebra matching function has elliptic
sign−1 and normalized trace1.

**Do not duplicate local LLC.** ET.6 already owns it. BH50.3 pp.309–313 gives
a completely local primitive construction: after a tame cubic extension the
parameter is ordinary; descend the stratum through its normal closure;
2-power roots select its type character; compare cubes of epsilon factors;
use highly ramified Gauss sums and twist back. BH52.1–2 pp.316–323 proves
injectivity by tame twist orbits and the graded-unit norm/cube contradiction.
This strengthens the supplier proof outline, not a new LLC target. BH52.9
p.324 explicitly does **not** identify tame automorphic lifting with Weil
restriction by a completely local proof. It cannot be used as the missing
all-place cubic transfer theorem.

**Ramified U_p dictionary.** For n=v_p(N), c=v_p(cond epsilon), a_p is nonzero
exactly when n=max(1,c). For n=c≥1 the parameter is principal series with one
unramified character; for n=1,c=0 it is an unramified Steinberg twist. The
latter relation is a_p^2=epsilon^(p)(p) p^(k−2), where epsilon^(p) is the
away-p part; writing epsilon(p) as a character modulo N would incorrectly
make it zero. The remaining cases have L=1,a_p=0. Classical and unitary
variables differ by (k−1)/2. The reader now gives all three fixtures.

**Highly ramified GL3 converse.** At the excluded finite T fill the missing
local representations with irreducible normalized I(1,1,1). Prescribe a global
finite chi_0 highly ramified at every T using R16.1. For any chi unramified
at T, the filled twist has both local L-factors1 and epsilon=(epsilon of
chi_0 chi)^3. The supplied partial functional equation is therefore exactly
the full equation required by AL.3/gln-converse-reduced-rank at n=3,S=T.
Untwisting gives an automorphic outside-T match. Cuspidality and the missing
components require the separate adjoint argument. Read GJ§9.1–2 pp.531–534
and JPSS79§13.2–7 pp.237–245. No new generic converse proof owner is created.

**All-place finite Artin upgrade.** This target assumes weak good-place and
archimedean matching. Ordinary Brauer induction and Hecke functional equations
give the Artin meromorphic functional equation; Artin entireness is not used.
For a chosen unitary local twist, prescribe that twist and high twists at
other bad finite places. Parameter equality handles extra ramification at good
places. Determinant equality and GL2 stability cancel the other bad factors;
archimedean matching cancels infinity. Isolate the selected gamma factor.
Unitary GL2 L-poles have real part<1/2 and dual L(1−s)-poles>1/2, so there is
no cancellation: recover the L-polynomial, then epsilon. BH27's finite-Fourier
local converse gives the parameter. Read JL12.2/12.5 pp.208–213 and cleared
BH23.8 pp.146–147,25.7 p.162,26.1 and27 pp.170–176. This argument treats finite
Artin data, not general higher-weight compatible systems.

Tetrahedral descent matches infinity since its odd cyclic extension splits
there. For octahedral descent, split real places use tetrahedral comparison;
at real-to-complex places the projective involution is a transposition,
rho(c) has eigenvalues±1, restriction to W_C is1+1 and determinant is sgn.
That specifies the real parameter1+sgn needed by the upgrade. The cubic input is now supplied by the all-place converse construction above.

**Fixed-centre quaternionic globalization.** Clozel §3.2 Lemmas4–5
pp.271–272, Lemma9 p.274 and §4.3 Theorem1B pp.279–280 were inspected this
continuation. Use compactness modulo the centre, not a general semisimple
claim. R16.1 prescribes the finite centre. At the ramified finite place a
normalized local-JL matrix coefficient of dimension>1 kills norm characters.
Compact-real averages and the balanced real D₂ EP function finish the archimedean
factors. The O(2) tangent representation has weights±2: D₂ contains that type
once and has no weight-zero type, giving C⁰=C²=0, dim C¹=1 and EP=−1.
AS.6/general-euler-poincare supplies the function on the group with split
centre balanced out; its negative has D₂ trace1 and positive value at1.
Getz2015 §6.5 p.34 provides the O(2) weight calculation, with AF's operators.

For compact central quotient C of mass1,
P_Psi=integral_C Psi(z)^−1 R(z) dz projects onto the Psi subspace by
character orthogonality. AS.6/compact-trace-specialization gives trace-class T.
Unitarity gives a uniform trace-norm bound, and strong continuity plus
finite-rank approximation gives trace-norm continuity. AS.0/trace-class's
bounded trace functional then commutes with this integral. Shrinking at an
auxiliary split place and the product formula for
Delta=(trd²−4Nrd)/Nrd force supported rational elements scalar. The positive
identity trace yields the desired representation. AF.4 gives its model after
coefficient extension. This is a target-level argument, not a native trace
formalization. No semisimple result was silently extended to arbitrary centres.

**Trace ledger.** Langlands1980 §9 pp.97–111, §10 pp.112–128 and §11
pp.130–138 were inspected in the earlier continuation. The ordinary six terms include
elliptic, −1/4 self-associate intertwiner, (4pi)^−1 logarithmic derivative,
singular constant, logarithmic unipotent and (2pi)^−1 local-B derivative.
Twisted terms use10.28,10.30,10.31,10.32,10.35. Retain the quadratic exceptional
half-summand and M=−1. The norm-fibre m'/m identity comes from the product
factorization of Hecke L-functions and logarithmic differentiation.
Section9 gives A₃(c,phi)=−theta'(c,0,phi) and
theta'(c,0,phi)=d theta'(Nc,0,f), including the real-to-complex logarithmic
correction for d=2. This must precede cancellation of10.5 with d times10.32.

The joint discrete/continuous bounds are now supplied by the route at the
start of this handoff. With these, Laurent-polynomial density on the compact
unitary Satake set, including complementary parameters, separates atoms from
continuous density. Vary the other factors afterwards.
The quaternion comparison uses two K-averaged zero-constant-term factors,
as in JL §16 equation16.1.7 (UBC p.275; IAS p.277). Steinberg and supercuspidal
both qualify; do not replace this with an unsupported pointwise x,y condition.
Even a local derivative term has the other zero factor. Equation16.1.2 kills
a possible scalar difference. Retain norm characters until their equal traces
are subtracted; the product of Steinberg signs is+1. Langlands1980 p.112
explicitly omits analytical details, and p.136's asserted finite M₁,M₂,M₃
does not by itself supply the joint estimate; use the separate bounds above.

## Classical attachment and downward ownership

Four accepted prerequisite edges point upward from this tier-15 package to
AutomorphicGaloisRepresentations: rt-technical-lemma's higher-weight,
weight-one and conductor inputs, and weight-two-witness's higher-weight input.
The package supplies these local contracts and construction outlines:

| Former higher input | Classical lower owner |
| --- | --- |
| R19.1/lambda-adic-representation-of-a-weight-k-eigenform | R17.6/classical-higher-weight-attachment |
| R19.1/weight-one-artin-representation | R17.6/classical-weight-one-attachment |
| R19.4/conductor-and-local-factors-classical | R17.6/classical-conductor-comparison |

The new R17.6/classical-parabolic-realization is the shared rank-two geometry.
Its carrier is image(H_c^1→H^1) of Sym^(k−2)R^1h_*Q_ell on a neat full-level
modular curve. Take the primitive multiplicity in the level tower, rather than
all oldvector eigenspaces at a larger level. Betti cohomology gives a cusp
space plus its conjugate; multiplicity one gives rank two. The reader lists
coefficient extension, equivariant projectors, level maps and trace adjunction,
and the weight-two Jacobian, weight-twelve and Eisenstein boundary tests.

Read Deligne1969 §§1–4 in full. The precise locations are Theorem 2.10 pp.141–148;
Definition3.9 and3.10–12 pp.153–154;3.18–19 and pairing3.20 pp.158–159;4.1 and
4.2–8 pp.160–166;4.9 p.167. Good-prime T=F+epsilon V and FV=p^(k−1) give
cohomological geometric Frobenius; the arithmetic attachment is its dual.
The rank-one complex-conjugation idempotent splits the degree-two coefficient
obstruction, proving descent to the coefficient completion. The Eisenstein
branch is the direct sum of the two reciprocity characters. Image compactness
is not finite image; E_4's second character is cyclotomic cubed.

For weight one read DS1974 §§5–8, with4.1 pp.513–515,5.1/5.5 pp.517–520,
6.7/6.11–13 pp.521–523,7.2 pp.524–525 and8.1–7 pp.525–527. The reader gives
the finite-density polynomial bound, auxiliary weight raising, residual finite
image-order bound, root-of-unity polynomial set and prime-to-order integral
lifting. This last lift uses Maschke deformation averaging and a number-field
splitting realization, not Fong–Swan; an icosahedral weight-one image is allowed.
Two auxiliary primes remove extra ramification and the cusp second-moment pole
proves irreducibility.

**Exact suppliers, not HMV shorthand:** ClassicalAdicEtaleCohomology H0/H3
supplies cohomology/duality. The existing upstream proposal #196 supplies
CohomologicalPointCounting/ComplexComparison8–12 (finite-cover/site Artin,
compact/relative/equivariant comparisons) and EllAdicRealization10 (adic Artin
via derived inverse limit, including finite-rank lisse systems). These were
read at proposal head `4bd72379658126cbe9be935656396f0c9dac4de0`; build on that
planned owner even though its folder is not yet on main. Curve de Rham/Serre
duality uses AlgebraicCurves12E and JacobianChallenge A–B. Do not cite the
higher ComplexComparisonPartII/C5 or import a higher-tier generic attachment.
The parabolic coefficient specialization and primitive projector are local
subsidiary constructions, not duplicates of the generic comparison.

**Classical conductor: construction and source route.**
Carayol Theorems(A)–(B) pp.409–412 include F=Q; 0.11 p.412 specifies
parabolic H¹. Sections2.2 pp.419–420 define its commuting Hecke/Galois tower
and multiplicity;4.9 p.426 specifies the special-fibre parabolic substitution.
Section11.4 p.451 explicitly invokes the noncompact Picard–Lefschetz argument
at the end of Langlands1973. There is no independent quaternionic attachment
to identify in this case: the quaternion algebra is M₂(Q).

Langlands Proposition3.1 p.27 gives the two-dimensional multiplicity.
Theorems7.1 p.67 and7.5 p.70 treat principal series and special representations;
Lemma7.14 pp.94–98 proves the nonzero monodromy via branch-difference
cokernels and the dual incidence pairing, keeping extension by zero at cusps.
Carayol11.1–3 pp.449–451 gives the ordinary-supercuspidal CM comparison.
All pages of Langlands here use the author's retypeset pagination, not
original LNM pagination. The needed sections were read in an earlier continuation.

Langlands Proposition7.12 pp.89–90 was left unproved in that source.
The Varshavsky route in the preceding continuation supplies its unequal-order curve
specialization, with contraction on the reordered correspondence and duality
for the reversed case. The proper compactification must retain extension by
zero at cusps and its derived dual. The lower proposal#196 TraceFormula
boundary excludes general Lefschetz–Verdier; its Frobenius point-count formula
alone is not a supplier for this result. The new native ideal fragment is
proved, while the six-operations trace interface remains explicitly omitted.

For ell=2 and odd primitive level, every relevant p is odd and every local
supercuspidal is ordinary. Carayol(B) is consequently the appropriate source;
no extraordinary dyadic/cubic step is needed for that RT conductor bound.
For the full target, p=2≠ell uses the strong cubic comparison now supplied
above and Carayol’s field-change identification in12.2 pp.457–458. Residual conductor inequality
uses the actual attachment, giving N|M; if M|N this forces equality.
WD(rho_f)=rec(pi_p)^dual tensor nu_W^((k−1)/2), with dualN=−N^transpose,
remains unchanged. No accepted packet or higher consumer was edited.

The other ownership move is now explicit: R16.1's full-local prescription is
the lower owner for both GL2 consumers, the higher
CaraianiNewtonPotentialAutomorphy R23.1/cht-character-extension, determinant
level-shrinking, and CM norm-kernel prescription. ArithmeticCharacterExtensions
PA2/chevalley-congruence-for-level-shrinking and its ClassFieldTheory Part II
lead concern applications; they do not supply arbitrary S-unit prescription.
Repoint them to this single lower owner when reconciling plans. The new
character targets were placed in R16.1 so R17.3 and R17.4 do not acquire new
forward dependencies on R17.5. This is authorized by WORKERS.md, without
additional approval. These are package ownership proposals; the file scope
prevents applying their packet changes here.


## Independent review and ownership follow-up

Review the all-place cubic deduction in particular: the non-normal monomial
classification, the resolvent exception, the full local pair-factor input and
the lambda product are the critical links. The inaccessible original source
is not a premise. The package does not claim an implemented native automorphic
or trace-formula carrier.

Packaging forbids packet or consumer edits. Preserve the downward moves
recorded above: full-local character prescription belongs in R16.1;
classical rank-two attachments and conductor comparison belong in R17.6;
quadratic induction precedes the cubic construction in R17.4 (old R17.5
anchor retained). The three higher R19 attachment/conductor inputs and their
four upward edges need repointing in their permitted plan jobs. ET.6 retains
local LLC, and AL.3 retains generic converse and pole theorems.

Resume from the package for independent review; do not regenerate from the
stale assembled Suggested file, which contains invalid arbitrary-carrier
transfer statements removed in the accepted repairs. No mathematical source
blocker is left as a prerequisite of the package’s chosen construction.

## Source provenance

This session read JPSS1979 §14.2 and its monomial remark (printed pp.253–255), Henniart1983
§§2.9–12 and3.4–5, Henniart2002 §§1.1–5 and2.1–8, Deligne1973 §§3.8–12,
4.1,5.6,5.11,8.12, and Cogdell’s converse statements and applications.
Public author/publisher PDFs stayed in disposable scratch. No cleared private
book was copied, and no verbatim source passage is in the deliverables.
The source URLs and detailed locators are in the reader. The first table
records the new downloads; the following inherited hashes preserve earlier
readings and their unchanged plan inputs.

| Public source read this session | SHA256 |
| --- | --- |
| jpss1979 | `0cf1baf41a6279cd1f78b44b0e6d3ff0ed71f7b9b54b55de28210b9f02a293f7` |
| henniart1983 | `968076c8b63d4a94442c080040b684fe1f71b01a3c0933d111a49745369629f7` |
| henniart2002 | `40c0ed7c7bfb05f1415fd66642d0b1984052f0af7cb5f3061b328216e2d24306` |
| deligne1973 | `b03f483c4eeca79b75e34b88f41406fe4c9e16ba621480ce859697c93e8d5844` |
| cogdell2012 | `0c922b6e6c26bc6d98ad7cf1162955d34e61491a1e73dc1f803b987cab2f2ffe` |
| mr2000 | `8cfdd3cdd83c7cac795656ef407a8ee00a8ab1be75e70ec36838122b847484c0` |

| Public source | SHA256 |
| --- | --- |
| Varshavsky math/0505564v2 | `8b4cb7ee9b1726cc998fc4d952a2542576e85ebe21e70b0f5c9f31c4682b8ac6` |
| JL1970 UBC author retypeset | `4dae9de4ce65b6ed81a8ec4688e1f65131f188ba33195d5cf066cd923eabef0a` |
| Getz2015 author manuscript | `e52f7da0685c7e330f096b3f23beaf8832972067d191f77e3c05ac3113fff0ac` |
| Rajan2000 publisher journal issue | `0c41869c333da5acc492ed6e36748e2c6277a89e3f4abe3fde6d4839920cf25e` |
| Badulescu–Renard2010 author paper | `dc3aad1d249fda35f40f33f7b688537f226e509ed6879fe36dd5d07a15839c88` |
| Chevalley1951 | `c8ca4e2dac91b20836adaf90ac5300f7dd197bb8f7145d5c422791d436358493` |
| CHT2008 | `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c` |
| Isaacs1974 | `413add693a05e715bbe9dd480feab658ebd2ff180fce71dbd73d099fec8bdc29` |
| Webb2016 author manuscript | `3053d04310d379844d0ccac2ae078124492730a116e63343014d276169fb4c24` |
| Clozel1986 university repository | `0cbe657414bd1872a47510a433bd09a90c7fc12e42fd391830e9fa1cbd7dbcf1` |
| Langlands1973 author retypeset | `fcbc7e055ef7582e80d31c092ea0d26007007aa0bf30a0ad5b526577cb8dc644` |
| Carayol1986 | `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8` |
| JL1970 IAS editorial retypeset | `ede21b1b303d3a398eb0b9057716c4b293bafe39eba118fd9b6a871eab6f2dcf` |
| Langlands1980 author copy | `6af3f53d0eb0e841548f43151f9cb79fd2e12ceac4ca909aefeb08d5462758ab` |
| Mao–Rallis2000 | `8cfdd3cdd83c7cac795656ef407a8ee00a8ab1be75e70ec36838122b847484c0` |
| Henniart1983 | `968076c8b63d4a94442c080040b684fe1f71b01a3c0933d111a49745369629f7` |
| Deligne–Serre1974 | `65b390f6d33e827e30c6c66bbc15421eca51db3180bdf5996dcee19047be97fc` |
| Deligne1969 | `19509c19b0cb056f4a5eba83a48a99f54bb6df0c7a96ab7f4018b0765e1ed98c` |
| JPSS1979 Columbia scan | `0cf1baf41a6279cd1f78b44b0e6d3ff0ed71f7b9b54b55de28210b9f02a293f7` |
| Finis–Lapid–Müller2011 | `86271ace3fa54466817c3e6cc993a5a0b0dc8f287de5b69bda5832c9cb613746` |
| Müller–Wakatsuki2026, arXiv2607.18870v2 | `a1bf7c9a7be08e4d734fe86508084af0ed9e4d8522de6e42efed2dd171076ba2` |
| Müller–Speh2004, arXiv math/0211030v2 | `bd71ad1943ab0cf6aee6a84ddab2aff85c11f5dece0b1b3ade912bc22795d245` |

| Unchanged input packet | SHA256 |
| --- | --- |
| GL2AutomorphicRepresentationsAndTransfer--R16.1.json | `c1e3b586b2534254b10be3884e88b4c33a3dd6e8e2068f2dc809757bca89ebce` |
| GL2AutomorphicRepresentationsAndTransfer--R17.3.json | `2fcb2c938001426f0c1019d99a2bd9ba47cf82ec91ab2ad5305ef7b896301b65` |
