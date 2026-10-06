# Independent review of ER.3

**Job:** REV-EllipticRegulators--ER.3, issue #6436.
**Reviewer:** Codex — codex-KHnHFo, 2026-10-06.
**Verdict:** accepted, with the existing mathematical gaps retained.

This session did none of BP-EllipticRegulators--ER.3, which Codex session
codex-XWL8DR submitted for #6484. The reviewed files are the ER.3 part packet
and suggested file. The part reader, parent packet, Polylogarithms packet,
reviewed library audit and supplier descriptions were read as inputs. They
are unchanged. No promotion, issue closure or label change was performed.

The four new nodes form a sound target-level extension: one construction,
two theorems and one comparison. There are eight API items, six unit tests,
eleven baseline declarations, three new planets, three gaps and one request.
All four nodes have individual verdicts in the packet's review object.
There are no added or removed nodes and no removed or replaced baseline
citations. The fourteen parent ER.3 nodes are imported under their existing
IDs, rather than duplicated. Parent and part together have five ER.3 planets,
below the six-planet limit.

The packet remains a **complete planning pass** with **planned** coverage.
The verdict does not certify a closed stage, a proof of the recorded gaps,
or an implementation. Every implementation status remains unchecked.

## Corrections

All corrections concern `relative-projective-line-chow-bridge`.

1. Handle constant f separately. Its endpoint normalization forces f=1,
   so div(f)=0 and the double sum vanishes. This branch must precede use of
   the imported Chow Steinberg theorem, whose hypotheses require a
   nonconstant function.
2. Derive scalar invariance from the explicitly listed projective-line Chow
   formula: multiplying f or g by a nonzero constant leaves its divisor
   unchanged. The previous proof cited general constant invariance, which
   the supplier exposes as an unpromoted API item. The revised proof uses
   the existing listed theorem directly and needs no new supplier node.
3. Clarify that the projective-line identity already allows arbitrary
   integer divisor multiplicities. The colliding-root continuity gap
   concerns the subsequent elliptic truncation argument.
4. Replace the symbolically transcribed formula excerpt by the literal
   sentence “Integrating we get the lemma.” Tighten the locator for
   Proposition 6.8 and Lemma 6.9 to printed p. 57. Theorem 3.4 is on p. 28.

The theorem's conclusion, its Lean signature and its consumer interfaces
are unchanged. The reader's proof still applies: the revised sketch supplies
the constant branch and spells out why its already imported divisor formula
suffices for the scalar step. The new source issue receives a confirmed
review verdict; its correction remains restricted to weight two.

## Public sources and passage checks

The three PDFs were downloaded afresh and their SHA-256 digests matched the
packet exactly. The extracted text was checked alongside images of the
formula-critical pages of Zagier's scan.

| Source actually read | Passages used | SHA-256 |
| --- | --- | --- |
| [Zagier, author-hosted typeset Math. Ann. 286 (1990) scan](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01453591/fulltext.pdf) | §§1–2, especially pp. 616–620; Proposition 2(ii)–(iii) and Theorem 1 visually checked | `e56ae90511b60119c1276293e1d6cf342be8764543dfa4de7333c2fba67193bf` |
| [Brunault, thesis, arXiv v1](https://arxiv.org/pdf/math/0602186v1) | §§1.1–1.2; Theorem 21 and companion assertion, pp. 23–24; Propositions 22 and 24, Remarks 23 and 25, pp. 24–26 | `8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7` |
| [Goncharov, arXiv v3](https://arxiv.org/pdf/math/0207036v3) | Theorem 3.4 and proof, pp. 28–29; projective-line reciprocity discussion, pp. 54–56; Proposition 6.8, Lemma 6.9 and current calculation (83)–(85), p. 57 | `ac729924bca286113e8aae593f6012bf72c77d935178606e7a2be677bd3440db` |

All six node/source references were checked. The kernel passage is on
p. 616; the unfolding excerpt is on p. 619; the closing proof sentence is
on p. 620. Brunault's companion assertion continues onto p. 24 and normal
convergence is Remark 25 on p. 26. The bridge's new excerpt is on p. 57.
The short quotations in the other three nodes match the cited passages.
The sources do not silently supply the Green-pairing approximation theorem.

Bloch's book was not independently accessed in this review. Its fourteen
parent declarations remain previously reviewed imports, with the part's
source-collation and continuity boundaries explicit. This verdict does not
re-certify the parent's book excerpts or its unrelated stages and source
issues. The public arguments suffice for all four new declarations.

## Mathematical checks

### Kernel

With λ=m+nτ, χ=exp(2πi(mb−na)), the nonzero term is
χ/(λ²λ̄). For Im τ>0, λ=0 forces n=0 by imaginary parts and then m=0.
Since |χ|=1, its norm is |λ|⁻³. Negating the index conjugates the character
and negates the cubic denominator; negating the point gives the stated
relation. Integer shifts leave the character unchanged. The unit-circle
indices are −n in a and m in b, exactly as in the prototype.

All eight API statements have their stated hypotheses. A scalar summand
needs evaluation and character relations, rather than a quotient
universal property or a new algebraic structure. The six tests give,
respectively, 0, 1, −i, −1, i and 1/8. The third catches swapping the
conjugated factor; the fourth catches reversing the character; the last
excludes substituting a Green coefficient of order |λ|⁻². All six appear
as Lean examples with their packet names recorded in comments.

### Direct complex coefficients

On the open disc, the imported definition gives

\[
 D(w)-iJ(w)=\sum_{h\geq1}\left(
 \frac{w^h-\bar w^h}{2ih^2}
 +\frac{i\log|w|}{h}w^h\right).
\]

For positive horizontal frequency h, put A=hτ−m and B=hτ̄−m.
Splitting the orbit at u=0 gives the two integrands in the packet. Their
integrals are

\[
 \frac1{4\pi h^2A}+\frac{iy}{2\pi hA^2},
 \qquad -\frac1{4\pi h^2B}.
\]

Their sum is y²/(πA²B), since B−A=−2ihy. The associated lattice index is
n=−h, so λ=−A and λ̄=−B: this is precisely −y²/(πλ²λ̄).
Oddness supplies the opposite frequency. Both half-line exponential
integrals converge with their indicated signs.

The absolute integrals of the disc-series terms are bounded by constants
(depending on fixed y>0) times h⁻³: integrate exp(−2πhyu)/h² and
u exp(−2πhyu)/h over u>0. Their sum is finite. This justifies the series
and integral exchanges over the full strip; the boundary is a null set,
and the imported full function is continuous there. The Bernoulli term
is a finite polynomial, not part of that interchange.

At horizontal frequency zero the remaining function is
−i(4π²y²/3)B₃(b). The baseline coefficient −6/(2πim)³ gives
−y²/(πm³) for m≠0. The mean of B₃ is zero, which gives the zero index.
Thus the proof supplies the imaginary companion as well as D; no
Kronecker equality is assumed as an input to this coefficient theorem.

### Reconstruction

The lattice of periods (1,τ) has the pinned library's discrete topology and
integer rank two. Exponent −3 satisfies the summability theorem's strict
inequality. The norm majorant is independent of a,b, so the kernel series
converges absolutely and uniformly on the whole torus. Its norm integrals
are bounded by the same majorant, making termwise coefficient integration
valid. Circle character orthogonality gives the expected coefficients.

For the difference of the two continuous torus functions, first take a
horizontal coefficient. It is continuous in the other variable by compact
uniform continuity and finite measure; all its vertical coefficients
vanish. The circle Hilbert-basis representation is injective, so the
function vanishes almost everywhere, and continuity and full support of
Haar measure make it vanish everywhere. Repeat for the horizontal
variable. This uses the existing one-dimensional result twice and needs
no assumed product Fourier-basis theorem. Pairing v with −v gives the
origin value. Multiplication by i yields the stated R_q formula.

Independent double-precision checks of the orbit sums against square
lattice cutoffs |m|,|n|≤400 gave absolute errors:

| τ | (a,b) | Error |
| --- | --- | --- |
| 0.23+1.05i | (0.31,0.17) | 2.96×10⁻9 |
| 0.13+0.8i | (0.27,0.34) | 1.35×10⁻9 |
| −0.42+1.2i | (0.39,0.29) | 7.70×10⁻10 |

Swapping the conjugated factor gives errors exceeding 0.64 at these
points. These computations discriminate conventions; the majorant and
Fourier uniqueness justify the mathematical statement.

### Relative projective-line bridge

For nonconstant f, F=f/K and 1−F=g/K have the same divisors as f and g.
The imported P¹ Chow formula therefore preserves the value after scaling.
The corrected Steinberg current formula gives
P₂((1−F)∧F∧t)=D(F(0))−D(F(∞))=0. Alternation then gives
P₂(f∧g∧t)=0. The P¹ formula evaluates this as the double sum with
r(α,β,0,∞)=α/β; inversion gives the required β/α convention.
At common poles or coincident support points the degenerate cross-ratio
has D-value zero. All multiplicities are retained.

The scalar normalization is exactly the corrected Polylogarithms P.5
normalization, −(2π)⁻¹ times the integral. Goncharov's (84) contains 2π;
integrating it on the compact curve confirms the imported correction to
Lemma 6.9. No conjectural strong reciprocity map is required.

As a non-real check, take
f(t)=(t−1)(t−2i)/((t−2)(t−i)), with f(0)=f(∞)=1.
The divisor sum for g=K−f was evaluated using its quadratic numerator
roots and its two poles. At K=2+i, −0.4+0.6i and 3−0.7i the sums have
absolute value below 2×10⁻16. Constant f=1 is treated separately by
its zero divisor. The prototype's factor, degree and product conditions
encode these endpoint hypotheses and allow negative exponents.

## Verification of the new source issue

**EllipticRegulators/E-ER3-1 is confirmed for a+b=3.**
Proposition 2(ii) on p. 618 gives D₁,₂(w)=2(J(w)+iD(w)) and
D₂,₁(w)=2(J(w)−iD(w)). Its orbit definition and correction consequently
give D₁,₂(q;x)=2(𝒥_q(x)+iD_q(x)). At fixed ξ, averaging over η removes
all nonzero horizontal frequencies, leaving (8π²y²/3)B₃(ξ).

Repeated integration by parts gives

\[
 \int_0^1 B_3(\xi)e^{-2\pi i\xi}d\xi
 =-\frac6{(2\pi i)^3},
 \qquad
 \frac{8\pi^2y^2}{3}\left(-\frac6{(2\pi i)^3}\right)
 =-\frac{2iy^2}{\pi}.
\]

The visually checked printed Theorem 1 gives +2iy²/π for its (m,n)=(0,1)
coefficient. This is an exact contradiction with its own definition.
The nonzero horizontal integral above also fixes the exponent order.
In the source's index order, the weight-two corrected formula is

\[
 D_{a,b}(q;x)=-\frac{(\tau-\bar\tau)^2}{2\pi i}
 \sum{}'\frac{e^{2\pi i(n\xi-m\eta)}}
 {(m\tau+n)^b(m\bar\tau+n)^a},\qquad a+b=3.
\]

No statement about higher weights is inferred. The finding is scoped to
the identified author-hosted typeset scan and its recorded hash; a distinct
publisher response was not read. Fresh searches for the exact title with
“erratum” and “correction” found no correction to this formula. The older
p. 616 sine-sign finding is already registered in the parent and is not
registered twice.

## Baseline, ownership and coverage

All eleven cited declarations were read in the source tree whose Mathlib
HEAD is `082e2d37e8b0463410cdb532e111cd43d5a66174`.
The separate baseline Tau Ceti HEAD is
`f790474821cf4256814db967cb154e7af3d0c369`; no new Tau Ceti declaration is
cited. The baseline table records the actual scope used here.

| Declaration | Module | Statement/use verified |
| --- | --- | --- |
| Complex.exp | Analysis/Complex/Exponential | Complex exponential from its Cauchy-series definition; character construction |
| Complex.log | Analysis/SpecialFunctions/Complex/Log | Principal logarithm, imaginary part arg; disc formula for log(1−w) |
| PeriodPair | Analysis/SpecialFunctions/Elliptic/Weierstrass | Two real-linearly independent complex periods |
| PeriodPair.lattice | Same | Integer span; coordinate description, discrete topology and rank two supplied in the same file |
| ZLattice.summable_norm_rpow | Algebra/Module/ZLattice/Summable | Finite-dimensional real normed ambient space, discrete integer submodule, r<−finrank; applicable at r=−3 |
| bernoulliFourierCoeff_eq | NumberTheory/ZetaValues | k≠0, all integer frequencies, −k!/(2πin)^k; zero mode uses total division |
| fourierCoeff | Analysis/Fourier/AddCircle | Negative character and Haar measure of total mass one |
| fourierCoeff_eq_intervalIntegral | Same | Positive period, normalized interval formula; T=1 |
| fourierBasis_repr | Same | L² coefficient equals Hilbert-basis coordinate; injectivity is available from the basis representation |
| MeasureTheory.integral_tsum_of_summable_integral_norm | MeasureTheory/Integral/DominatedConvergence | Each summand integrable and summed norm integrals finite; both checked above |
| RatFunc.eval | FieldTheory/RatFunc/AsPolynomial | Reduced numerator/denominator evaluation; no use of totalized pole values |

The reviewed ER.3 library audit says these elliptic functions and expansions
are absent. A fresh source-tree search found no implementation of a
dilogarithm or this Kronecker kernel; the only Mathlib dilogarithm mention
is a documentation aside. Existing Bernoulli and Fourier infrastructure is
cited rather than replanned. The upstream EllipticCurves and ModularForms
documents were consulted for their conventions, API and ownership guidance.

The parent interfaces account for every target:

| Imported nodes (ER.3 suffixes) | Interface checked |
| --- | --- |
| the-elliptic-dilogarithm; bloch-wigner-bounds-at-zero | Orbit definition, convergence, continuity, ordinary limits, inversion and conjugation |
| the-companion-and-Bloch-convention | Distinct uncorrected and periodic companions, Bernoulli correction, permitted lifts |
| lattice-basis-change | Antiholomorphic transformation factor 1/(cτ̄+d), obtained by lattice reindexing |
| fourier-and-kronecker-eisenstein | Same complex identity supplied independently by this part's direct proof |
| steinberg-relation-on-the-projective-line | Its D-input is the new relative bridge; the J/tame-symbol input retains its owner |
| truncated-theta-products; zeros-of-truncated-products | Annuli, quantitative zero localization and multiplicities; simple-root restriction and continuity gap remain explicit |
| companion-truncation-estimates; steinberg-for-the-companion | Separate J estimates, linear correction and limit |
| steinberg-for-the-dilogarithm; the-steinberg-relation-by-truncation | Separate D estimates and limit, then the two-component symbol descent |
| green-function-of-the-curve; goncharov-function-and-the-regulator | Exact normalized supplier boundary and regularized pairing limit remain explicit |

P.1 supplies the ordinary polylogarithm, continuous Bloch–Wigner function
and inversion relation. The three P.5 Chow nodes supply the integral,
projective-line divisor formula and corrected Steinberg identity with the
required hypotheses. They are not assumed elliptic Steinberg statements.
The GZ.2 stage explicitly owns infinite-place Green existence,
normalization and analytic estimates; the request is appropriately assigned
there. Uniformization and K₂ are retained at their existing owners.
No new cross-roadmap request or competing general construction is needed.

## Remaining work and checks

The following are retained, with precise consumers in the packet:

- Supply GZ.2's mean-zero, symmetric Green kernel with the stated current
  identity, logarithmic remainder and derivative bounds.
- Prove convergence of Gaussian-smoothed Green kernels in L³ and their
  antiholomorphic derivatives in L³ᐟ², or the exact stated Sobolev-duality
  alternative, before passing to the pairing limit.
- Prove the divisor-continuity reduction for colliding roots and exceptional
  constants in both elliptic Lecture 9 limits. The new relative theorem
  alone does not discharge that elliptic obligation.

Collation with publicly accessible Bloch text also remains recorded.
These boundaries do not invalidate the four verified new declarations.
An assembly should retain existing IDs and the five-planet total, and carry
these obligations into the combined ER.3 plan. It must not read this review
as acceptance of a closed Green-pairing or truncation proof.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticRegulators--ER.3.json`: zero errors and zero warnings after correction.
- The source-issue and source-version validators: no errors.
- `lean-check research/blueprint/suggested/EllipticRegulators--ER.3.lean`:
  exit code zero, exactly 18 warnings for declarations using `sorry`, and no
  other warnings. The shared build's Mathlib commit is the required pin.
  This file imports only Mathlib; no different Tau Ceti source is used.
- All eight API signatures, six named test comments/examples and the three
  new theorem/comparison signatures checked against the packet. No empty
  proposition fields or substitute assertion structures occur.
- Six kernel computations, three orbit/lattice comparisons and three
  non-real relative divisor evaluations independently recomputed.

The suggested file required no edit. Papers, numerical scripts and compile
logs are scratch artifacts. Their decisive results and exact certificates
are recorded above so a later worker needs no scratch path.
