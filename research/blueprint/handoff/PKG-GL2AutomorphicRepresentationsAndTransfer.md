# PKG-GL2AutomorphicRepresentationsAndTransfer — source-blocked checkpoint

Worker: Codex (GPT-6), session `codex-yKwdy4`; issue #7901; 2026-10-10.
Branch: `codex-yKwdy4-gl2-package`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7901#issuecomment-6097498242).

**Partial.** This continuation makes substantial progress on the package but does
not certify mathematical closure. The original JPSS nonnormal cubic argument
could not be obtained from an authorized readable source; the accessible later
proof has specific errors and an unavailable convergence dependency. Its
all-place upgrade is also unresolved. These are actual source/proof blockers,
not a request for permission to move ownership or to use proposed interfaces.
Metadata remains absent so the three-file existence check cannot mistake this
checkpoint for a finished package. No second job was claimed.

The manager's forty priority issues had no suitable available job. The worker
then selected this available focus package under WORKERS.md. Only the package
README, Suggested.lean and this handoff changed; neither accepted packet changed.
This note replaces the recursively accumulated historical handoffs. Preserved
mathematics is summarized below; historical validation results are not current
validation.

## What changed

All 112 accepted targets remain in the reader. Its starting 115 target headings
also included three provisional classical attachments; all survive. Seven
supporting targets were added, giving 122 headings:

- R16.1/chevalley-congruence and full-local-character-prescription;
- R17.4/highly-ramified-converse;
- R17.5/artin-all-place-upgrade, brauer-character and solvable-integral-lift;
- R17.6/classical-parabolic-realization.

The reader additionally expands the primitive dyadic example, ramified classical
U_p dictionary, trace-term ledger and comparisons, fixed-centre quaternionic
globalization, higher-weight and weight-one constructions, and conductor proof
contract. Compression removed repeated source prose, labels and a duplicate
compatible-descent paragraph. It did not remove a target, hypothesis or source
locator. README is **199,708 bytes**, below the 200 KB ceiling.

Suggested.lean adds arithmetic character statements on the existing idele and
modulus carriers, an all-rank modular-character interface, and the integral
solvable lift with its residual change of basis. Analytic and geometric interfaces
which cannot yet be typed remain explicit signature omissions, not false
statements over arbitrary types. The Lean file is a planning aid; `sorry` does
not constitute mathematical proof or gap closure.

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
reintroduced from Chevalley's printed remark pp.39–40, then removed in this
run's final audit. Without roots of unity in the base, local roots at different
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
That specifies the real parameter1+sgn needed by the upgrade. The weak cubic
input to octahedral automorphy is still source-blocked.

**Fixed-centre quaternionic globalization.** Read Clozel§3.1–4 pp.268–277
and4.3 pp.279–280. The reader gives a compact-quotient proof tailored to CDN20:
finite centre extension by R16.1; a normalized local JL matrix coefficient
which kills norm characters; compact-real averages; the full-O(2) D_2
Euler–Poincaré function with sign chosen to have trace1; AS6.16/17 and central
Fourier projection; shrinking at an auxiliary split place. The product formula
on Delta=(trd^2−4Nrd)/Nrd forces supported rational elements scalar; the
positive identity trace gives the desired representation. AF4 gives a model
after coefficient extension, beyond merely its field of rationality. The
GL2 cohomology/sign computation and central trace-class projection remain
specific verification obligations; generic AS infrastructure alone does not
certify them. No semisimple-group statement was silently extended to arbitrary
quaternionic centres.

**Trace ledger.** Read Langlands§§10–11 pp.112–138 and JL§16 pp.262–278.
The ordinary six terms include elliptic, −1/4 self-associate intertwiner,
(4pi)^−1 logarithmic derivative, singular constant, logarithmic unipotent and
(2pi)^−1 local-B derivative terms. Twisted terms use10.28,10.30,10.31,10.32,10.35.
Keep the quadratic exceptional half-summand and M=−1. The reader identifies
the index-d norm-fibre cancellations and describes how split good Hecke
separation kills the remaining atomic/continuous discrepancy. The quaternion
comparison uses two zero-constant-term projectors; even local derivative
terms have a zero factor. JL16.1.2 forces a possible scalar coefficient
difference to vanish; norm characters are retained until their equal traces
are subtracted, with product of Steinberg signs+1. JL1970 explicitly leaves
analytic details formal; AS6 must supply convergence and the rank-two
expansion. The full §9 logarithmic identity and that analytic specialization
are not newly certified closed by this checkpoint.

## Classical attachment and downward ownership

Four accepted prerequisite edges point upward from this tier-15 package to
AutomorphicGaloisRepresentations: rt-technical-lemma's higher-weight,
weight-one and conductor inputs, and weight-two-witness's higher-weight input.
The package already had provisional local contracts; this run supplies their
construction outlines and separates the missing ramified bridge:

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

Read Deligne1969 §§1–4 in full. The precise locations are Theorem2.10 pp.141–148;
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

**Conductor remains unresolved.** The reader now specifies the actual parabolic
attachment's Frobenius-semisimple WD representation, including N, with
WD(rho_f)=rec(pi_p)^dual tensor nu_W^((k−1)/2). Dual N is −N^transpose.
The desired characteristic-zero conductor equals exact primitive level away
ell, and residual conductor is at most that conductor. A Steinberg twist has
conductor1 despite unramified semisimple Weil action; forgetting N fails.

Carayol's quaternionic §§11–12, read pp.449–460, gives the principal-series
special-fibre piece, ordinary cusp comparison using global CM induction, and
special-branch Picard–Lefschetz monodromy. Extraordinary dyadic comparison
requires the all-place cubic transfer and a cohomological field-change
identification. Those arguments cannot simply be applied to the split
classical parabolic multiplicity without a bridge. HMV R18.2's maximal split
models are smooth proper; principal-level normalizations are regular with
Drinfeld basis, not automatically semistable. Its model tower distinguishes
smooth split places from the semistable division/Mumford case. R18.4 supplies
finite H^1, local systems, integral freeness and pairings; its
cohomological-eigenspaces proof explicitly leaves the Galois identification to
R19. An unspecified quaternionic eigenprojector is not the actual classical
attachment. Do not claim HMV already proves the bridge.

A possible narrower route for the RT consumer is to prove only residual
conductor ≤ primitive level at odd primes for ell=2 and odd N. All those
local supercuspidals are ordinary, so that consumer does not itself require
an extraordinary dyadic comparison. This is a lead, not a proved replacement
for the current general conductor target. The geometric bridge is still
required. No accepted packet or higher consumer was edited.

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

## Cubic blocker and research leads to preserve

The missing primary item is Jacquet–Piatetski-Shapiro–Shalika,
*Relèvement cubique non normal*, C.R.Acad.Sci.Paris292(12) (1981),567–571.
Tunnell1981 Theorem[4] p.173 quotes only weak almost-everywhere transfer.
Carayol12.2.1 p.457 additionally quotes the all-place lift, and12.2.2–3
pp.457–458 needs its identification with restriction of extraordinary
parameters. Neither announcement gives the original proof.

Authorized access was checked repeatedly. Gallica's relevant volume identifier
is `bpt6k98224180`; the likely scan position for p.567 is f599. Public ark,
texte, image/PDF, IIIF-manifest and pagination endpoints returned Cloudflare
HTTP403. Author publication lists did not provide the original note. The AMS
Selected Works reprint pp.497–502 belongs to an uncleared book; no alternate
copy was obtained or read. Repeating source search did not make the original
callable/readable. The five-page note or an independently complete replacement
is the concrete next input needed.

A public later primary proof is [Mao–Rallis2000](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5049F4E78E15635E58E158F1CF1C93FC/S0008414X00008798a.pdf/cubic_base_change_for_textgl2.pdf),
Theorem6 p.195. It proves weak cubic transfer, but its field germ contains
mistakes and its convergence argument refers to Mao–Rallis1999,
*On a cubic lifting*, DOI10.1007/BF02780174. The latter publisher copy was
paywalled and the author route unavailable. A Fatou inequality in the displayed
argument does not justify the limit-under-integral equality by itself.
No quantitative dominating height bound was verified.

[Henniart1983](https://www.numdam.org/item/10.24033/msmf.295.pdf), Appendix6
pp.171–180, was obtained and read as another lead. Its analytic base change is
**quadratic GL3**, not nonnormal cubic GL2. A6.6 pp.177–180 constructs the
local GL3 datum, uses global GL2×GL3 integrals against induced characters,
the converse theorem and bad-place isolation. Its reliance on JPSS analytic
pair factors does not prove the missing cubic theorem. Ginzburg–Rallis–Soudry's
G2 cubic correspondence and the triple cover of SL2 are likewise not ordinary
GL2 nonnormal base change.

The following are our own candidate calculations, **unverified**, removed from
the reader as separate targets. They preserve useful leads without certifying
a repaired proof:

1. Use the ordinary rank-eight oscillator: over a splitting field the
   symplectic space is the tensor product of three standard two-dimensional
   spaces; Galois permutes factors. For Lambda=F⊕E,
   theta(t)=N(t)/t (polynomially extended) and
   Q_t(x0,x)=N(t)x0^2+x0 Tr(theta(t)x)+Tr(t theta(x)),
   the identity x0 Q_t=N(x+x0 t)−N(x) gives the unipotent action. Candidate
   coordinates on S(F^××Lambda) have n(t) action
   psi(y^−1 Q_t) phi(y,x0,x+x0 t); scalar z acts by
   [z,delta]|z|^3 phi(z^2 y,z x0,z x); Levi a by
   |N(a)|^2 phi(N(a)y,N(a)x0,N(a)a^−1x). Fourier/Weil scalars and rational
   splitting must be checked. This is not a D4 minimal representation;
   MP5's restricted totally-real positive-definite setting is insufficient.
2. Retain general discriminants. For E=Q_2(cuberoot(2)), discriminant−108 has
   square class−3, a nonsquare (5 modulo8); MR's field assertion that delta
   is square is false. Their p.186 use of −3 as a square is also unavailable
   in general. For q(V)=Tr(theta(V)), use
   q=((Tr V)^2−Tr(V^2))/2, det(q)=delta/4 and q=H⊕<−delta>.
   If Tr w=0, q(w^−1)=N(w^−1)Tr(w)=0. In this example
   q=3b^2−6cd. For phase uN(t)−Tr t, a critical point satisfies
   u theta(t)=1, so t is scalar and u t^2=1. Nonsquare u should have no
   small-parameter germ. Near C=±1 the quadratic part is Cq. The candidate
   Gaussian ratio is gamma(−2C delta/v)/gamma(−2C/v)
   =mu(delta)[2Cv,delta]. The changes z_old=vz and z=Cz contribute the
   otherwise missing [v,delta] and [C,delta], leaving
   mu(delta)[2,delta], independent of C. Measures, stationary phase,
   vanishing bounds and matching in both directions still need proof.
3. Candidate local identity, with self-dual measures:
   I(a^−1,phi)=[2a,delta]|a|lambda(a)mu(delta)J(a,f),
   I_s(phi)=|Delta_(E/F)|^(1/2)J_s(f).
   The I(y) phase is y^−1N(t)−Tr t, not yN(t)−Tr t.
   Its singular integral has [z,delta]|z|^3 phi(z^2,0,z)lambda(z).
   For E=F⊕K, partial Fourier transform should reduce to rank-two Hermitian
   Kloosterman matching. Jacquet–Ye1996§2 Theorem2.1 p.927,
   Proposition2.3 pp.932–933 and§3 Proposition3.1 pp.934–935 supplies small
   ideal germ arguments, including dyadic fields. For R⊕C use Schwartz
   functions and Aizenbud–Gourevitch2011 TheoremA p.2, KeyLemma3.2.8 pp.10–11,
   §5 pp.15–17,6.0.3/6.0.5 pp.17–19, AppendicesA–B pp.19–27. Its jet and
   Fourier decomposition cannot be replaced by a bare density assertion.
4. Global oscillator theta–Whittaker vs double-Whittaker trace unfolds into
   F^× regular terms and a singular product. Good odd-place fundamental
   lemma uses the three splitting cases and MR's Gauss multiplication (53).
   Spectral terms include cusp, (4pi i)^−1 sum_chi integral I_(chi,s), and
   in the nonnormal case an extra I'_mu satisfying
   mu^2=(zeta lambda) composed with Norm on the norm-one ideles, coefficient
   one-half at s=0. The cyclic half-residue vanishes. A candidate convergence
   repair subtracts the s^−1 Eisenstein constant term, uses rapid vertical
   decay and controls truncated theta height tails. The quantitative tail
   estimate was **not established**. Good Hecke separation should isolate a
   cusp atom or the quadratic-resolvent order-three induction exception,
   but only after that convergence is proved.

Even a complete weak relative-trace proof does not settle the all-place gap.
For the S3 normal closure L with quadratic resolvent K and cubic E, cyclic
base change and quadratic descent identify the class over E by good places.
At a bad place they can leave the quadratic norm-kernel twist of its local
parameter undetermined, with the same determinant. Strong multiplicity one
of global classes does not select that local parameter. The finite-Artin
all-place upgrade above does not resolve general ell-adic cohomology.
Carayol12.2.3 first globalizes a finite primitive local parameter by Tunnell
and then uses a **strong** cubic lift of its Artin automorphic class.
Identifying it from good traces alone would assume the conclusion.

## Remaining recorded obligations

The unchanged accepted packets contain 112 nodes,16 gaps,67 requests,12 planned
stages and0 closed stages. Their JSON status says complete, but that does not
certify those recorded gaps. The following is the current disposition:

| Obligation | Current resume point |
| --- | --- |
| Archimedean classification/factors/real quaternion comparison | AF1 and AL2 remain owners. Check their full chambers, limit representations, epsilon and SU2 character interfaces; no second AF carrier. |
| Smooth/automorphic/test-function suggested carriers | Explicit omissions retain exact conditions. Use concrete supplier interfaces where possible; absent implementation alone is not a mathematical blocker. Never restore arbitrary-type equivalences. |
| Newvectors and ramified factors | Existing actual-representation newvector signatures and last-row convention preserved; new complete U_p dictionary supplied. Concrete SR model and normalized Whittaker realization tests still need checking. |
| Primitive dyadic fixture | New n=1,conductor3,Swan1 fixture and matching sign supplied at target level; exact operator and quaternion matching normalization still needs final audit. |
| Arithmetic/geometric Galois convention | Good-prime dual and twist explicit; the actual ramified parabolic comparison remains open. |
| Singular/continuous trace terms | Ledger and detailed cancellations added; AS convergence/expansion and the full logarithmic identity remain to certify. |
| Full tensor/supplier conditions | Existing genuine symmetric-power tensor, scalar, dimension, dual and coefficient-map APIs preserved; analytic conditions remain named omissions. |
| Prescribed quaternion ramification | GlobalQuadraticForms4.4 prescribed Hilbert signs plus QuadraticFormInvariants2 algebra supplies existence; check the exact global uniqueness/isomorphism-class interface, not parity alone. |
| Highly ramified GL3 converse | New fill-and-twist target gives a route from the exact lower generic converse; native analytic signature remains omitted. |
| Original cubic and all-place local lift | Actual source/proof blocker detailed above. |
| Quaternionic globalization | Compact fixed-centre proof supplied; finish the real EP trace/sign and central Fourier trace projection checks. |
| Solvable reduction-compatible lift | All-rank integral Fong–Swan/Brauer chain supplied; signatures elaborate with planned proofs. |
| Full local character prescription | Correct primary Chevalley proof chain and actual arithmetic signatures supplied; no order preservation and no arbitrary simultaneous norm exponents. |
| All-place Artin matching | New stability/isolation target supplied with infinity hypothesis; relies on weak octahedral existence, still blocked by cubic proof. |
| GL3 recognition suggested signature | No fabricated global L-function or cusp carrier was added; exact omission remains. |
| Source-specific transfer signatures | Actual field extensions, local/global classes, factors, central characters and rational models remain necessary; matrix/parity fragments are not the full transfer theorem. |

## Resume order

1. Obtain the original JPSS cubic note from an authorized readable source, or
   prove the alternative local matching and quantitative convergence above.
   Establish its all-place comparison, not just good Satake powers.
2. Complete the classical parabolic ramified comparison or its exact narrower
   RT conductor bound, with the geometric bridge and monodromy.
3. Audit the remaining trace and globalization proof contracts against the
   concrete AS/AF supplier statements, then the other table entries.
4. Reconcile the downward ownership moves in the permitted future plan job.
   Packaging forbids editing the accepted packets in this issue.
5. Complete faithful suggested signatures/tests where the conditions can be
   stated; do not manufacture `Prop` fields or arbitrary carriers. Add the
   one-line math.NT metadata only when the package is complete and rerun checks.

Do not regenerate from the stale assembled 801 KB Suggested file. It contains
false unrestricted arbitrary-carrier transfers removed by earlier repairs.
Continue from this package, the individual accepted packets and the reviewed
library audit. Do not append this entire handoff to the next one; replace it
with an updated current account preserving the mathematical receipts.

## Validation and existing work audit

- Full `lean-check` exited0 with **154 warnings, all declaration-uses-sorry**,
  and no errors. Memory available before compile:104GB. The subsequent Lean
  changes only adjust comments; no declaration/import/proof changed after
  this final compile. No language server, build/update/cache or second
  concurrent compile was started; nothing is left compiling.
- Both accepted packets pass `scripts/check_blueprint.py`:0 errors,0 warnings.
  Neither packet was changed. Their SHA256 values appear below.
- Scoped `intake.py check-files`:3 files,0 problems. `git diff --check`:pass.
  Only the three authorized deliverables changed; metadata is absent.
- Pinned elaboration baseline: Mathlib `082e2d37e8`, Tau Ceti `f790474`.
  Current read-only library: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
  Current upstream roadmaps at the final audit:
  `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`.
- GlobalNumberFields and RepresentationTheory/ModularInduction READMEs were
  read in full, as well as the reviewed GL2 library audit. Actual pinned
  character-extension, idele, modulus, representation, matrix and localization
  declarations were read before use. GNF9 factors existing Hecke characters;
  GNF7's congruence finite-index theorem starts from an existing modulus;
  CFT12 has prime-p S-unit Kummer, not this full prescription contract.
  Current RepresentationTheory explicitly excludes modular Brauer theory.
- Upstream advanced during the run. Final diff against `e255659` was checked:
  AA, RG2, IntegralHeckeAndGaloisDeterminants and SR changed. Their local modulus
  owner is now RG2.4, and AA2.4 expands Artin–Hecke determinant factor assembly;
  neither adds the missing full-local prescription or cubic/classical bridge.
  AA's new Artin factors remain its owner; this package's analytic upgrade
  uses their comparison and R01 local constants, without re-planning them.
- Read-only trees were never built or modified. Cleared BH2006 was read in
  place; no book, excerpt or extracted book text was copied. Public papers
  were kept only in scratch, and no source passage is in the deliverables.

## Primary-source receipts

Bibliographic URLs and locators are in the reader. These checksums identify
public copies used for this continuation; the files themselves are not retained
in the repository. Source access dates:2026-10-10. The cleared BH copy is
identified by the maintainer's index, not an alternate internet copy.

| Public source | SHA256 |
| --- | --- |
| Chevalley1951 | `c8ca4e2dac91b20836adaf90ac5300f7dd197bb8f7145d5c422791d436358493` |
| CHT2008 | `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c` |
| Isaacs1974 | `413add693a05e715bbe9dd480feab658ebd2ff180fce71dbd73d099fec8bdc29` |
| Webb2016 author manuscript | `3053d04310d379844d0ccac2ae078124492730a116e63343014d276169fb4c24` |
| Clozel1986 university repository | `0cbe657414bd1872a47510a433bd09a90c7fc12e42fd391830e9fa1cbd7dbcf1` |
| Carayol1986 | `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8` |
| JL1970 IAS editorial retypeset | `ede21b1b303d3a398eb0b9057716c4b293bafe39eba118fd9b6a871eab6f2dcf` |
| Langlands1980 author copy | `6af3f53d0eb0e841548f43151f9cb79fd2e12ceac4ca909aefeb08d5462758ab` |
| Mao–Rallis2000 | `8cfdd3cdd83c7cac795656ef407a8ee00a8ab1be75e70ec36838122b847484c0` |
| Henniart1983 | `968076c8b63d4a94442c080040b684fe1f71b01a3c0933d111a49745369629f7` |
| Deligne–Serre1974 | `65b390f6d33e827e30c6c66bbc15421eca51db3180bdf5996dcee19047be97fc` |
| Deligne1969 | `19509c19b0cb056f4a5eba83a48a99f54bb6df0c7a96ab7f4018b0765e1ed98c` |
| JPSS1979 Columbia scan | `0cf1baf41a6279cd1f78b44b0e6d3ff0ed71f7b9b54b55de28210b9f02a293f7` |

| Unchanged input packet | SHA256 |
| --- | --- |
| GL2AutomorphicRepresentationsAndTransfer--R16.1.json | `c1e3b586b2534254b10be3884e88b4c33a3dd6e8e2068f2dc809757bca89ebce` |
| GL2AutomorphicRepresentationsAndTransfer--R17.3.json | `2fcb2c938001426f0c1019d99a2bd9ba47cf82ec91ab2ad5305ef7b896301b65` |
