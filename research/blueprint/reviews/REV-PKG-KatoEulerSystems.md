# Fixing package review: KatoEulerSystems

Verdict: **needs_changes**. The review is complete. The package faithfully preserves
the accepted plan's forty targets, but that plan deliberately left fourteen proof
closure gaps. Several remain actual missing prerequisites under the stronger
upstream standard. Merely naming their prospective supplier does not build them.
The corrections below are applied; the outstanding exports are specified below
so that the maintainer can assign their owners without another unchanged review.

Reviewer: Codex (GPT-6), session `codex-1pMy97`, 2026-10-10. Issue #7936;
package author session `codex-4ArQBz`. This reviewer did not author the package.
Only the authorized package files, this report and the review's handoff change.
The packet, reader document, original suggested file and other roadmaps remain
inputs to this review.

## Standard, fidelity and corrections

Read WORKERS, PROTOCOL, the expansion protocol, UPSTREAM_GUIDE and the binding
PACKAGE_REVIEW method. The form comparison used Multiquadratic and
ArithmeticDirichletSeries, and the current AlgebraicVectorBundles README and
representative signatures. All forty accepted target statements were matched to
the forty numbered README subsections. Their hypotheses, APIs and checks remain;
none was shortened away. The eight layers separate geometric nonvanishing from
the subsequently constructed canonical map. Metadata remains the single line
`topic = "math.NT"`. The README remains below the issue's 200 KB limit.

Applied corrections:

1. **Separate level prime sets, §1.2.** Kato Proposition 2.3, p.126, requires
   equality for each index, not equality of the combined sets. The transition
   `(2,3) → (6,9)` preserves the combined set but introduces 3 in the first
   index. Added that negative control and identified Proposition 2.4's ramified
   operator instead of the identity norm.
2. **Native torsion-freeness.** At Mathlib `082e2d37`,
   `Module.IsTorsionFree` tests regular scalars. The former statement that it
   tested every nonzero scalar was false. The native predicate applies to the
   full semilocal algebra. Added the free module over `ℚ×ℚ` as a positive
   instance alongside the two nonzero zero divisors that disprove the stronger
   condition. This supersedes the contrary claim in the package author's handoff.
3. **Locators.** The Euler-system adapter cites Kato §13.1 and Example 13.3,
   pp.224–225; §§13.9–13.10 concern construction of the canonical map instead.
   Nakamura A.5, pp.268–269, is a **Corollary**, not a Proposition.
4. **Explicit reciprocity source.** Retrieved the public archived author version
   of Kato's *Generalized explicit reciprocity laws*. Kato 2004 Proposition
   10.12, p.198, explicitly cites its Theorem 4.3.1. Replaced the inherited
   inaccurate §4.2 pointer, recorded internal author-version pp.19, 23–24,
   and identified h as the Λ-Tate-module rank, equal to height when Λ=ℤₚ.
   Kept its normalization distinct from the modular comparison. Obtaining
   a readable statement does not construct the D.2 API or comparison square.
5. **Constructed-map tests.** Added sixteen direct examples for the normalization
   predicate/selector, unit pullback, bilinear symbol, four-map Chern moment,
   coherent-tower image and restricted dual exponential. They include failed
   divisor/norm clauses, zero maps, and nonidentity numerical values. Together
   with corrections 1–2 and the reciprocity sign witness, there are nineteen additional
   examples, ninety-one total.
6. **Dependencies.** §7.1 now uses explicit reciprocity and canonical critical
   interpolation (§§3.4, 5.3). §7.5 uses noncritical equality (§6.2): its ordinary
   unit root has slope zero and k≥2. Neither proof needs §6.3's additional
   arithmetic family assumption. Removed time-dependent qualifiers in the
   ownership prose. The source theorem's all-prime scope remains visible where
   its proof requires an unsupplied all-prime export.
7. **Library version.** The four field Kummer exports are explicitly attributed
   to current Tau Ceti `a91d3aaf`. At the original `f7904748` pin the inspected
   Kummer file has `kummerMap`, but not the three additional isomorphism and
   norm/restriction names. They are current-library deferrals, not claims about
   the older pinned API; Suggested.lean imports only Mathlib.

All new prose is original mathematical description with locators. No source
passage, PDF, extracted text, or section-by-section source digest is included.

## Public source verification

The reproducible random sample is `random.Random('codex-1pMy97-KatoEulerSystems')`
applied to the forty packet positions, selecting fifteen without replacement.
All locators attached to those sampled targets were checked against the stated
public editions. Page renderings were used where extraction obscured formulas;
in particular the arithmetic-Frobenius polynomial in Kato pp.224–225 is retained.
These are the sample's positions and principal checks:

| Position / README | Public locator checked | Result |
| --- | --- | --- |
| 1 / 0.1 | Kato 1.3(1), p.121; 1.10, pp.124–125 | Normalized unit, norm and uniqueness agree. |
| 2 / 0.2 | Kato 1.1, 1.4, pp.121–122; 1.9, p.124 | Torsion evaluation and rational smoothing agree; the squared Bernoulli term is already corrected. |
| 4 / 0.5 | Kato Lemma 2.12 and following comparison, p.132 | One coordinate varies, including composite A. |
| 6 / 1.2 | Kato 2.3, p.126; 2.11, pp.130–132 | Separate prime-set hypothesis repaired. |
| 10 / 2.1 | Kato Lemma 8.5 and proof, pp.183–184; 8.6, p.184 | Integral inverse limit and residue-field argument agree. |
| 12 / 2.3 | Kato §13.1, Example 13.3, pp.224–225; Rubin II.1.1, draft pp.21–22, IX.6.1, pp.141–143 | Adapter locator repaired; arithmetic normalization and support retained. |
| 13 / 5.2 | Kato 12.6, p.222; 8.1, p.180; 13.10–13.12, pp.230–232 | Finite quotient, regular denominator and integral limit agree. |
| 14 / 3.1 | Kato 9.2.2–9.4, pp.187–188 | Target is a filtration step; it is not the associated graded. |
| 15 / 3.4 | Kato 9.5–9.7, pp.188–189; §10 opening, p.189 | Three level branches and exceptional M condition agree. |
| 26 / 2.4 | Nakamura Lemma 3.1, pp.205–206; Lemma A.3, p.268 | Literal dual and the dual-Hecke convention retained. |
| 27 / 5.1 | Kato 12.5(1), p.221; 13.9–13.12, pp.228–233; Burungale–Tian v2 2.4, Remark 2.5, p.5 | Rational map and characterization agree. |
| 29 / 3.5 | Nakamura Lemma 3.4, Remark 3.5, Corollary 3.6, pp.221–222 | Global parabolic inverse limit is essential. |
| 31 / 6.1 | Kato 16.4–16.6, pp.270–271 | Refinement, pairing and de Rham domain retained. |
| 34 / 4.2 | Kato 13.5–13.7, pp.226–228; Rubin III.5.6, draft p.49 | Finite exceptional set, sign and smoothing nonzeros retained. |
| 37 / 7.3 | Rubin III.5.4–5.6, draft p.49, 5.8–5.11, pp.50–51 | Finite-level bounds need uniform descent to conclude finite generation. |

The author-flagged uncertain items were also investigated. The [KK3] access
gap is repaired with the archived author version; its complete proof has not
been converted to prerequisites. Ribet's primary PDF was read as images at
pp.190–192: Theorem 3.1 has almost-all-place scope, and the quaternion-valued
openness discussion does not produce a nontrivial unipotent in a division
algebra. No alternative every-place argument was found in that cited result.
The flagged modular complex, parabolic injectivity and elliptic control items
remain proof/export gaps, not silently verified consequences of generic APIs.

Public copies used, accessed 2026-10-10 (SHA-256 fixes the edition):

| Source | Public copy | SHA-256 |
| --- | --- | --- |
| Kato 2004 | [Numdam](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d` |
| Kato 1999, 65-page author version | [Archived author PDF](https://web.archive.org/web/20220531053712id_/http://www.math.columbia.edu/~phlee/F16-Kato/GER.pdf) | `523aa24e1451497aa90a3023baff22828153f415aee5945eed3d4538004c7816` |
| Rubin, 1999 AWS draft | [Author draft](https://swc-math.github.io/notes/files/99RubinES.pdf) | `de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50` |
| Nakamura 2023, published | [Publisher PDF](https://link.springer.com/content/pdf/10.1007/s00222-023-01203-7.pdf) | `47682f856244439d8cc3d3e6e0a4e1f804e6a710ec1a2dde8fad76f94aea20e4` |
| Burungale–Tian, arXiv v2 | [Versioned manuscript](https://arxiv.org/pdf/2506.03465v2) | `cbb8284a13ed40bd15df9713001485724bc4d2a3b5c38d8fd83f9b6f3f3e4664` |
| Ribet 1985 | [Author-hosted PDF](https://math.berkeley.edu/~ribet/Articles/rankin.pdf) | `88adbb7f4a931e5c8705a4773453315c06a98b52c434ce57e54336f8dc9353f8` |

## Prerequisite closure: remaining defects

These are missing exact adapters or a mismatch of hypotheses, not an objection
that a correctly specified supplier theorem has not yet been proved in Lean.
The README makes the gaps explicit; that honesty is necessary but insufficient
for a draft-ready, gap-free upstream build. Closing them would require substantial
new mathematical targets and work in supplier files outside this issue's edit
scope. There is no safe change of a theorem label that provides those exports.

| Required export / consumers | Inspected supplier and missing content | Required resolution |
| --- | --- | --- |
| Big-local-field reciprocity / 3.4, hence 4–7 | Only PadicHodgeRegulators D.1 has a packet. The non-perfect-residue-field theorem and 10.9.5 square are requested from D.2. | Stage and build the exact D.2 statement and §11 comparison, using the recovered source; preserve its sign and projector denominators. |
| Early CM structure and upper bound / 4.4, 5.1, 7.1–7.2 | CMAllPrimeMainConjectures is only a proposed route; no usable early owner layer is attached. | Supply the elliptic-unit input before the Kato map, including p=2, ℚ(i), Kato 15.14 and the separate 15.13–15.17 length comparison. |
| Nonsplit image / 4.1, 4.3–4.4, 7.2 | AutomorphicGaloisRepresentations R19.3/ribet-momose-classical-large-image retains the quaternion form; Ribet pp.190–192 does not justify a division-place unipotent. | Build the alternative rational weak-Leopoldt/bound argument, without replacing quaternion openness by split SL₂. |
| Open-curve comparison / 1.5, 3.1 | ModularCurvesPartII R14.3 packet gives weight-two Shimura/cup-product statements, not open Y(M,N), all weights, boundary coefficients and affine higher-degree vanishing. | Add the exact open-curve étale/log de Rham adapter and its full modular-form filtration. |
| Full-level moment / 2.5 | The named completed-cohomology layer is not an existing target with Nakamura's literal-dual tensor source and classical codomain. | Supply Lemma 2.10 and §3.1.4 moment, with Hecke, coefficient and conductor compatibility; an integral isomorphism is unnecessary. |
| Global modular complex / 4.3–4.4, 7.2 | SelmerIwasawaCohomology L3/iwasawa-cohomology constructs a general complex; it does not identify the modular étale complex, strict H² kernel, or all-prime rank-one passage. | Build those comparisons with the local H² corrections, before constructing the canonical map. |
| Parabolic exponential injectivity / 3.5, 5.4 | The same L3 constructor and local exp* do not supply Nakamura Lemma 3.4. | Add the global full-level, all-weight inverse-limit result on X(N), j_*V; no open-curve injectivity substitution. |
| Global/local twist square / 5.3–5.4 | L3/iwasawa-twist states Tw(σ)=κ(σ)^(−j)σ and augmentation specialization, but not the required all-prime localization square. | Prove compatibility with localization and finite specialization using the same roots. |
| Period dictionary / 3.2, 6.2 | ModularSymbolsPadicLFunctions L1/period-lines, integral-period-lattices and rjw-b1-comparison are specific symbol conventions, not an identification with Kato's differential and Betti basis. | Build the full Kato/RJW character, Gauss, p-power, factorial, period and U_p comparison. |
| De Rham/integral ordinary regulator / 6.1–6.3, 7.5 | L3/crystalline-regulator is crystalline. L4/derham-regulator has a high-conductor analytic domain; it is not Kato 16.4's complete finite-character domain or 17.8–17.10's integral image. | Add the exact domain and ordinary image/kernel/cokernel theorem with the specified good lattice. |
| Dyadic regulator / 6.1–6.3, 7.4–7.5 | L3/crystalline-regulator, growth, scalar-projection and rubin-coleman-map explicitly require odd p. | Build the p=2 exports or revise affected endpoints and their advertised scope; the current all-prime proof is conditional. |
| Integral elliptic control / 7.6–7.7 | Selmer L3/greenberg-structure-hypotheses and derived-control are generic, with odd-prime applications and explicit correction hypotheses. | Verify the actual elliptic hypotheses, formal-group norm module and ordinary control factor; retain local bad-prime torsion exclusions. |
| Full-algebra finite support / 5.1–5.2 | PadicMeasures L4/finite-quotient-criterion is over O⟦T⟧; character-decomposition requires a tame group of order prime to p. Neither states the full dyadic O[[G∞]] adapter. | Prove Kato 13.12's finite abelian quotient conclusion for the full algebra and a regular μ; do not use division by two. |
| Critical arithmetic family / 6.3 alone | ModularSymbols L3/family-comparison-principle assumes both analytic sections already exist and a nonvanishing normalization. | Construct the compatible arithmetic section and specialization, or retain only the explicitly conditional comparison and remove it as an advertised unconditional endpoint. §§7.1, 7.5 no longer depend on it. |

Further exact requests in the accepted plan (two-index transfers, normalized
Eisenstein/real-regulator comparisons and elliptic Serre exports) also need the
specified contracts; a generic field or Γ₁ theorem is not their substitute.
The fourteen rows above already prevent acceptance independently of those
remaining integrations. No packet or supplier review verdict was overwritten.

The order audit found no `FoundationsAndLibraryIntegration` or `UPSTREAM:` tokens
left in the package. CaraianiNewton puts PadicMeasures in tier 1, arithmetic
duality/Selmer in tier 8 and ModularSymbols/PadicFamilies in a later bundle.
KatoEulerSystems has no assigned tier in that 94-roadmap order. Its K-theory,
Euler-system and D.2 dependencies cannot be certified as lower-tier merely from
their names. The maintainer must schedule this outside-94 roadmap after the
required suppliers, or move the missing notions into an authorized owner.
Making PadicFamilies a prerequisite would recreate the documented cycle.

## Current Tau Ceti nonduplication

Read-only audit used TauCetiRoadmap commit
`37769f03c170a7bc3e1082df70522a0ad59c5ffd` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searched the entire roadmap tree,
including nested roadmaps and sibling Completed, and the current library by
objects: normalized units/divisors and finite-map norms, scheme symbols and
Chern transfers, modular coefficient realizations, local regulator operators,
coherent conductor classes, Selmer local conditions, and lattice/span/length
constructions. Thus the nine newer directions and completed roadmaps are covered,
not only names in the old atlas snapshot. Relevant hits were inspected for
their hypotheses and codomains.

| README target group | Existing work used or distinguished | Outcome |
| --- | --- | --- |
| 0.1–0.5 | ModularCurves' divisor/isogeny/full-level interfaces; generic units and analytic carriers | Particular normalized theta/Siegel distributions are not supplied. |
| 1.1–1.6 | Current field Kummer/cup maps; AlgebraicVectorBundles L0B–L0C; DGAInfinity's perfect-module Chern characters | None is the ordered symbol and finite étale Chern moment on this open modular scheme. |
| 2.1–2.5 | Current continuous cohomology and Kummer norm/restriction; IntegralHeckeAndGaloisDeterminants' generic Frobenius factors | The concrete norm-compatible modular tower and its dual-Hecke specialization remain distinct. |
| 3.1–3.5 | ModularForms/ModularCurves realizations and generic duality interfaces | No Kato reciprocity or parabolic conductor uniqueness target found. |
| 4.1–4.4 | Generic matrix/module algebra and image theory; characteristic-ideal substrate | The modular applications and conditional all-prime adapters remain distinct. |
| 5.1–5.4 | Mathlib Basis.constr and span; generic dual/tensor operations | The arithmetic generator relations and twist-one transport remain targets; helpers do not re-plan the library operations. |
| 6.1–6.4 | Generic regulator/period/local elliptic interfaces | Particular Kato scalar and period comparison remains distinct. |
| 7.1–7.7 | EllipticCurves finite-level Mordell–Weil and local theory; generic Selmer/bound machinery | Kato applications are retained; no second generic Mordell–Weil or Euler-system theorem is planned. |

No target was removed for duplication. Generic bundle operations, field Kummer
maps, module finiteness and linear spans are deferrals in the boundaries and
supplier contracts. The kept targets state their particular geometric or
arithmetic difference. The library-coverage audit's Kato L0–L4 entries were read
and checked against these current sources rather than used as immutable evidence.

## Adversarial pass over every README target

Every theorem/API clause was checked with its subsection's hypotheses. The
table records mathematical instances, not a claim that `sorry` proves them.
Excluded cases were tested as excluded; no equal-characteristic or arbitrary
DVR was substituted into a statement about O_λ or ℤ_p.

| Target | Instances and conventions tested | Change or retained restriction |
| --- | --- | --- |
| 0.1 | c=5; norm a=2; nonzero E[2] coefficient 0 versus 24; wrong divisor/norm clauses | Added predicate/selector controls; c≥2, (c,6)=1 and actual finite-map norm retained. |
| 0.2 | c=5,7 give 24,48; c=1 gives zero denominator; unit 1, inverse and identity pullback | Added pullback tests; rationalization, torsion nonzero and coprimalities retained. |
| 0.3 | Upper/lower shears; determinant 2; A=1 versus excluded A=0 | Row indices, column basis and determinant action agree. |
| 0.4 | x=0, 1/2, 2/5 give 1/12, −1/24, −11/300; all-zero torsion pair kills n=0 factor | Correct squared Bernoulli expression and cusp-width factor retained. |
| 0.5 | A=1,2,4 give 1,2,4 second-coordinate roots, not A² roots | Composite A and map τ↦Aτ retained. |
| 1.1 | (M,N)=(2,3); excluded (2,2); either identity entry; nonzero multiplication symbol | Added computed bilinear values; fine-moduli and ordering retained. |
| 1.2 | Identity levels; raising an existing prime; (2,3)→(6,9) | Corrected separate prime sets and negative control. |
| 1.3 | ℓ dividing or not dividing N; geometric quadratic coefficient ℓ | Ramified two-term branch and actual transfers retained. |
| 1.4 | Swapped ordered degree-one slots; one versus two inverted units; k=2 factorial | Chern sign and rational projector denominators retained. |
| 1.5 | k=2,r=1 and k=4,r=1 give twists 1,3; j=1,k−1; identity, zero and four scaling maps | Added composite values; finite moments do not assert integral symmetric self-duality. |
| 1.6 | Scalar/diamond commuting squares and zero class | Actual constituent equivariance is a supplier hypothesis, not an arbitrary-map identity. |
| 2.1 | Finite S versus S={p}; residue restriction dual to corestriction; zero class | Integrality follows through vanishing of the dual residue limit, not rationalization. |
| 2.2 | Constant one/zero towers; doubling moment on constant three; existing-prime p direction | Added direct tower tests; geometric coherence remains required. |
| 2.3 | k=2,r=1, ℓ=3 gives coefficients −2/3, 1/3; ε=0 removes quadratic term; polynomial at X=0 | Locator corrected; inverse cyclotomic action and arithmetic Frobenius retained. |
| 2.4 | Degree-two pairing determinant −4; middle coefficient 2 at p=2; double inversion | Literal integral dual retained; rational self-duality is not integral at nonunit factorials. |
| 2.5 | Zero dual input, addition, evaluation at one; operator identity maps at ℓ=3; zero action | Constructed moment and three independent comparison squares retained. |
| 3.1 | k=4, i=0,1,2,4; k=2,i=1; step quotient zero; restricted maps send 1 to 1,0 and 3 to 6 | Added actual restricted-map tests; full modular-form step retained. |
| 3.2 | Critical endpoints; character parity at (k,r)=(2,1),(4,2); c,d smoothing signs | Period quotient, Eisenstein weight-one/two normalization and admissible pairs retained. |
| 3.3 | Derivative at zero rather than a substituted critical value; ordered symbol sign | Real regulator's ℝ(2) normalization and exact source target retained. |
| 3.4 | Three p-level branches; k=2,r=1 yields p^(−1) twice; exceptional M condition | Repaired [KK3] locator/version and sign boundary; D.2 still missing. |
| 3.5 | N=3,k=2; literal polynomial degree zero; parabolic versus open curve | Rational splitting and global inverse-limit injectivity retained, with its export gap. |
| 4.1 | x=0, nonzero x over a field, x=2 over ℤ; division quaternion; CM at p=2 | Unit/nonunit and image branches retained; native torsion-free convention corrected. |
| 4.2 | Weight two with trivial L-value zero; ramified twists; each sign and smoothing zeros | Nonvanishing is componentwise and precedes the canonical map. |
| 4.3 | Rational open subgroup versus integral full-image hypothesis; p=2; strict/global local term | Rational p-power error and integral odd-prime hypotheses remain separate. |
| 4.4 | Zero H¹ cannot have rank one; CM ℚ(i),p=2; residual irreducibility without integral freeness at 2 | All-prime source conclusion retained conditional on missing proof adapters. |
| 5.1 | Zero/additive Betti vectors; specified nonzero basis value; minus sign on a nonzero rational value | Arithmetic generator relations precede Basis.constr; no arbitrary-map reciprocity claimed. |
| 5.2 | Characteristic ideal one with a nonzero finite quotient; regular μ versus zero divisor; p=2 | Finite index is not equality; full-algebra support gap retained. |
| 5.3 | Critical endpoints, periods nonzero, character inversion; twist specialization direction | Semilinear global/local twist and normalization are explicit contracts. |
| 5.4 | (1−k)+k=1; two minus maps cancel; zero/identity composites | Corrected Corollary A.5; literal-dual twist retained. |
| 6.1 | Period scale 2, Betti scale 3 give 3/2; zero class; absent/zero α; pairing nonzero | Scalar projection is chosen; strict slope supplies pairing nonvanishing. |
| 6.2 | Split α=1 gives 0, nonsplit α=−1 gives 2, algebraic α=2 gives 1/4; p=2 | No zero Euler factor is inverted; exact conductor gives nonzero Gauss sum. |
| 6.3 | Critical slope at boundary; isolated fiber with vanishing interpolation; absent crystalline line | Family, dense locus and nonvanishing periods are hypotheses; vector domain retained without α. |
| 6.4 | Odd-p lattice versus p=2; curve y²+xy=x³+1 has Δ=−433 and log(2u)≡2u+2u² mod 4 | E₂ gives 4ℤ₂ and the tail stays in 4ℤ₂; no false uniform 2ℤ₂ logarithm lattice. |
| 7.1 | Zero zeta map into rank-one module; each character component; smoothing nonzeros | Removed inappropriate critical-family dependency; detection still required. |
| 7.2 | Lengths (2,1,1), (2,1,0), (0,0,0); exceptional weight-two local term | Local correction retained; rational/integral and primes above p distinguished. |
| 7.3 | Bounded rank without uniform descent; finite fixed torsion exponent e; enlarged finite layer | Uniform descent is proved via the continuous torsion-valued action, not inferred from bounded rank alone. |
| 7.4 | Split multiplicative α=1 trivial zero; nonsplit branch; nonunit integral local image | Actual Coleman map and correction ideal retained; dyadic comparison remains conditional. |
| 7.5 | Ordinary α unit, slope 0<k−1; lattice in f*; dyadic integral dual | Replaced critical-family dependency by §6.2; good-period/image conditions retained. |
| 7.6 | Finite module Λ/(p,γ−1) is torsion; local bad-q torsion differs from global torsion; multiplicative reduction | No-finite-submodule conclusion requires arithmetic sequence/criterion; dyadic applicability not supplied by odd-prime criterion. |
| 7.7 | Equal nonunit Euler corrections on both sides; supersingular odd p; p=2 excluded; inequality 1≤2 is not equality | Control cancellation, unit exclusions and almost-all-prime passage retained. |

## Definitions and Lean signatures

Inspected all 21 definitions and 40 theorem signatures, not only ten. They are
algebraic ingredients at their stated ring/field generality. The closing comment
names the geometric and arithmetic targets whose carriers are unavailable.
No `True`, `Prop := sorry`, invented arithmetic cohomology type or theorem whose
hypothesis is its own conclusion was introduced. Extensionality and transported
commuting squares are ordinary algebraic consequences; they are not presented
as constructions of those arithmetic squares.

| Definitions / API group | At least three discriminating checks |
| --- | --- |
| thetaCondition, cTheta | Correct divisor and identity norms; wrong divisor; wrong norm; prescribed non-one selector, c=5 divisor and N₂. |
| siegelUnit | Identity pullback on arbitrary unit, one, inversion. |
| rationalSmoothing | Coefficients 24 and 48, cross-multiplication, unequal integral smoothings. |
| torsionIndexAction | Upper shear, lower shear, identity; determinant witness is separate. |
| siegelLeadingExponent | 0, 1/2, 2/5, reflection and missing-square negative control. |
| beilinsonElement | Zero slot, additivity, nonzero 2·3, zero 2·0, (2+3)·7; ordered determinant signs. |
| chernMoment | Identity on one, zero trace, four scalings giving 210; weight/twist endpoints. |
| padicZeta | One tower, zero tower, doubled three tower; transported p-direction square. |
| katoEulerPolynomial | Good ℓ=3 polynomial, ramified quadratic zero, constant coefficient one. |
| fullLevelEulerOperator | All identity at ℓ=0, zero u, all identity at ℓ=3; actual prime scope separate. |
| fullLevelZeta | Zero, additivity, nonzero dual evaluation; source/target transfer squares. |
| modularFiltration | Weight-four critical steps/zero graded, upper endpoint, weight-two critical step. |
| modularDualExp | Restricted identity gives one, zero gives zero, doubling sends three to six. |
| criticalSign | Even/odd weight-two characters and even weight-four r=2. |
| upperUnipotent | x=2 action, its nonunit obstruction over ℤ, x=0 identity; field nonzero and ring unit APIs. |
| katoZetaMap | Zero, addition, nonzero basis value, negative-input sign distinction. |
| katoZetaSubmodule | Zero span, identity span top, containment of one. |
| twistedKatoZeta | Zero, identity, double-minus cancellation, twist sum one. |
| katoScalarRegulator | Zero, addition, period/class scaling 3/2, identity nonzero value. |
| ordinaryEulerFactor | Split zero, nonsplit two, good-coefficient quarter. |

The pinned Mathlib baseline declarations were re-read, including the actual
regular-scalar class, torsion predicate, literal dual, finite generation, basis
extension and bilinear scalar multiplication. The current four Kummer statements
were read with their field, invertibility and finite-extension hypotheses.
No Lean command was run in the read-only upstream or library checkouts.

Validation:

- `lean-check Suggested.lean`: **exit 0**, 132 warnings, all declarations using
  `sorry`; 21 definitions, 40 named theorems, 91 examples. Memory was checked
  before compilation; the shared pinned Mathlib build was used.
- A separate scratch Lean file proved fifteen arithmetic controls without
  `sorry`: regular-scalar product-ring torsion-freeness and zero divisors,
  separate level-prime sets, Bernoulli controls, degree-two determinant, three
  Euler factors, inverse period scaling, nonzero bilinear/composite values,
  range restriction, double sign cancellation and the height-one/height-two
  reciprocity scalar. This file is not an upstream deliverable. Its compilation exits 0 without warnings. These elementary
  proofs do not establish the missing geometric/arithmetic comparisons.
- `scripts/check_blueprint.py` on the unchanged input packet: **0 errors,
  0 warnings**. Forty nodes, sixty API entries and forty-one packet tests;
  fourteen gaps and thirty-one supplier requests remain, as stated above.
- `intake.py check-files` on all deliverables and the handoff: **0 problems**.
- `git diff --check`: clean. JSON review schema and one-line TOML checked.

The package should not be sent to TauCetiRoadmap as draft-ready until the exact
missing prerequisites and dependency schedule are resolved. This is a completed
fixing review with applied corrections and a precise remaining work list.
