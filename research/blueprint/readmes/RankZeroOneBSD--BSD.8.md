# Elliptic curves, Part II: rank-zero and rank-one Birch–Swinnerton-Dyer theory

## BSD.8 — From prime-part certificates to an exact leading term

This layer turns prime-part equalities into the full leading-term formula for
an actual elliptic curve over the rationals, or for an explicitly specified
family with complete certificates. A prime excluded by a theorem remains a
proof obligation. In particular, proving every sufficiently large prime part
does not prove the full formula: a positive rational number supported on the
remaining finite set can still differ from one.

The [BSD.7 packet](../packets/RankZeroOneBSD--BSD.7.json) owns
the rational reconstruction theorem and its finite-support certificate. This
document imports that core and refines its arithmetic producers. Its fourteen
new targets have distinct identifiers in the
[packet](../packets/RankZeroOneBSD--BSD.8.json); none replaces a predecessor
identifier. The scope is `RankZeroOneBSD:BSD.8`. Concrete comparison
fixtures and their analytic enclosures belong to BSD.9.

This is a completed target-level planning pass, with coverage **planned**.
Every target has a statement and a prerequisite chain. The evaluated
nontrivial-primary and inherited dyadic comparison obligations remain explicit;
the layer is not closed. All implementation statuses are unchecked.

### Conventions and imported foundations

Fix an elliptic curve E/ℚ with analytic rank r at most one. Import the actual
L-function and analytic rank from BSD.0, and rank equality and finiteness of
the whole Tate–Shafarevich group from
`RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem`. Write

\[
 t=\#E(\mathbf Q)_{\rm tors},\qquad
 s=\#\Sha(E/\mathbf Q),\qquad C=\prod_\ell c_\ell(E).
\]

All three integers are positive. The period Ω is the integral of the absolute
value of the chosen minimal invariant differential over **all** of E(ℝ).
There is no additional factor for the number of real connected components.
The regulator R is the BSD regulator for the x-height pairing, with R=1 in
rank zero. At the pins, the exact dictionary is

\[
 R_{\rm BSD}=2^rR_{\rm Tau},
\]

as supplied by
`GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary`.
For a rank-one basis point P, R equals h_BSD(P). Canonical-height names alone
do not determine this normalization.

Let L* denote L(E,1) in rank zero and L′(E,1) in rank one. The actual
`RankZeroOneBSD:BSD.5/rational-bsd-defect` supplies a positive rational d_E
whose real image satisfies

\[
 L^*=d_E\frac{\Omega R s C}{t^2}.
\]

BSD.5's rank-zero and rank-one rationality nodes provide the exact normalized
analytic quotient when their hypotheses are met. An interval for that
quotient, even a narrow interval containing one rational number of interest,
does not supply its rational-to-real identification.

The ownership boundary is as follows.

| Supplier | Imported statement used here |
| --- | --- |
| EllipticCurves Layer 4 | Minimal local models, Tate's algorithm and its correct local point index, including residue characteristics 2 and 3 |
| EllipticCurves Layer 6 | Mordell–Weil, actual torsion, heights and explicit 2-descent/rank interfaces |
| EllipticCurves Layer 7 | Actual cohomological Selmer and Sha groups, finite Selmer groups, the Kummer sequence for m≥2, the arithmetic BSD quotient and Cassels comparison |
| GZ.0 and BSD.5 | Exact height, period, free-index and leading-quotient comparisons |
| BSD.6–BSD.7 | The source-qualified prime-part theorems, under their own hypotheses |
| HE.7 | Arithmetic bounds only in their stated field, quotient, lattice and CM-point setting |
| Pinned Tau Ceti | Multiplication-index formula, explicit 2-descent image count and canonical finite primary decomposition |

The BSD-specific finite search below assembles existing height and
Mordell–Weil theory. It does not assume that Layer 6 already provides a
universal saturation algorithm. General local reduction, primary
decomposition and isogeny theory are imported rather than planned again.

### The accepted reconstruction core

For q∈ℚ, the existing `BSD.8/prime-support` is the union of the prime factors
of its absolute reduced numerator and its denominator. Its zero convention
is the empty set. For q≠0, the accepted support characterization identifies
membership with a nonzero prime valuation. The existing integer-valued
valuation also gives v_p(0)=0 and v_p(−1)=0; positivity is essential to the
endpoint.

The existing `Rat.PrimeValuationCertificate(q)` stores a finite set S of
primes, a proof that it covers the canonical support of q, and proofs
v_p(q)=0 for p∈S. It stores neither positivity nor q=1. The accepted nodes
`certificate-all-primes` and `certificate-reconstruction` prove all prime
valuations vanish and then q=1 for q>0. The constructor
`certificate-from-exceptions` proves support coverage from vanishing inside
and outside the supplied finite set. Its output cannot be constructed from a
mere list of excluded primes.

The accepted `real-identity` transfers q=1 to an exactly identified nonzero
real quotient. Applied to BSD.5's actual d_E, `elliptic-endpoint` proves

\[
 L^*(E,1)=\frac{\Omega_E R_{\rm BSD}(E/\mathbf Q)
             \#\Sha(E/\mathbf Q)\prod_\ell c_\ell(E)}
            {\#E(\mathbf Q)_{\rm tors}^{\,2}}.
\]

The existing individual and family endpoints retain the supplied curve or
family as their scope. This pass supplies the exact arithmetic connection
needed to reach those endpoints; it makes no new uniform prime-part claim.

**Check.** For q=2, every odd prime valuation is zero while v₂(q)=1.
For q=1/4 the dyadic valuation is −2. Both examples satisfy an
outside-{2} theorem and fail the full endpoint. These are scalar
counterexamples, not assertions about the defect of a particular curve.

### Exact arithmetic ledger

**Definition `BSD.8/rational-defect-ledger`.** For a∈ℚ and t,s,C∈ℕ put

\[
 \operatorname{normalizedDefect}(a,t,s,C)=\frac{a t^2}{sC}.
\]

This is a total arithmetic function, with the field's zero-denominator
convention. Its BSD use requires a>0 and t,s,C>0, together with independent
identifications of each input with the actual invariant. It does not define
an elliptic curve or any of its invariants from numerical data.

Its API serves the exceptional-prime ledger and the actual-defect comparison:

| Declaration | Statement |
| --- | --- |
| `normalizedDefect_def` | Evaluation is a·t²/(sC) |
| `normalizedDefect_pos` | Positive inputs in the stated domain give a positive rational |
| `normalizedDefect_unit_factors` | Setting t=s=C=1 returns a |
| `normalizedDefect_zero_sha` | Setting s=0 returns zero, outside the positive certificate interface |
| `normalizedDefect_mul_denominator` | For s,C>0, multiplying by sC gives a·t² |
| `normalizedDefect_eq_one_iff` | For s,C>0, equality to one is equivalent to a·t²=sC |
| `normalizedDefect_cancel_torsion_square` | For t>0, input a/t² cancels the displayed t² exactly |

The definition's four tests are: a=1/5,t=5,s=1,C=5 gives one; a=36,t=1,s=4,C=9
gives one, whereas dropping s gives four; a=1/4 with unit integer inputs gives
1/4, and multiplying a by a free index square 2² changes this to one; and
a=t=C=1,s=0 gives zero. The first test detects an unsquared torsion factor,
the second a missing Sha term, and the last a missing domain restriction.

**Theorem `BSD.8/ledger-valuation-balance`.** For p prime, a≠0 and t,s,C>0,

\[
 v_p\!\left(\operatorname{normalizedDefect}(a,t,s,C)\right)
 =v_p(a)+2v_p(t)-v_p(s)-v_p(C).
\]

Thus vanishing is exactly the integer balance
v_p(a)+2v_p(t)=v_p(s)+v_p(C). Apply the pinned multiplication, division and
power lemmas after proving each factor nonzero. Negative valuations remain
integers throughout; a natural-number difference would be incorrect.

**Theorem `BSD.8/ledger-support-cover`.** Under the same nonzero hypotheses,
the canonical support of the ledger is contained in

\[
 S_a\cup\operatorname{primeFactors}(t)
     \cup\operatorname{primeFactors}(s)
     \cup\operatorname{primeFactors}(C),
 \qquad S_a=\operatorname{primeSupport}(a).
\]

Every member is prime. Outside the union all factor valuations vanish, so the
accepted support characterization gives the inclusion. Cancellation can make
the inclusion strict. For a=1/5,t=5,s=1,C=5 the covering set is {5} and the
ledger support is empty. A complete list of bad reduction places alone is not
a support certificate: torsion, Sha, the rational quotient and the integers
c_ℓ can contribute other rational primes. In particular, an odd bad place
can have an even component-group order.

### Finite descent with an independently bounded primary exponent

**Definition `BSD.8/primary-descent-certificate`.** Fix actual E/ℚ, a prime p
and its proved Mordell–Weil rank r. A `PrimaryDescentCertificate(E,p,r)` has:

1. A positive integer n, and m=pⁿ≥2.
2. A finite additive commutative group F and an additive equivalence with the
   **actual** Sel_m(E/ℚ). Local conditions and completeness are part of that
   equivalence, rather than an unverified covering list.
3. A finite additive group U and an additive equivalence with the actual
   rational torsion subgroup.
4. A separate proof that m kills every element of the actual subgroup
   Sha(E/ℚ)[p∞].

The rank equality and Kummer maps refer to actual E and are supplied by the
imported theory. Define k_m=#U[m], and define the extracted number by

\[
 \operatorname{primaryOrder}(c)=\frac{\#F}{m^r k_m}
\]

using natural division. Exact divisibility, finiteness of the whole primary
subgroup and the specification of this number are subsequent theorems. No
field records the desired order of Sha or a predicted BSD equality.

The definition uses Mathlib's existing additive primary-component subgroup.
The indexed source names `CommGroup.primaryComponent` and
`CommGroup.mem_primaryComponent` generate their `AddCommGroup` counterparts;
the generated additive declarations were also checked by elaboration at the
pins. No new primary-group carrier is needed.

| API | Purpose and statement |
| --- | --- |
| `PrimaryDescentCertificate.level` | Extract n>0 and m=pⁿ≥2 |
| `.selmerEquiv` | Obtain the actual additive equivalence to Sel_m |
| `.torsionEquiv` | Obtain the actual finite torsion presentation |
| `.primaryExponent` | Apply the independent m-annihilation proof on Sha[p∞] |
| `.kummerFactor` | Compute #U[m]; for invariant factors d_i this is ∏gcd(m,d_i) |
| `.primaryOrder` | Extract the displayed natural quotient |
| `.order_spec` | The exact order theorem, promoted to `primary-order-extraction` |
| `.reindex` | Transport finite models along additive equivalences; identity and composition preserve the resulting order |

The unit tests are conditional arithmetic and finite-group tests, not claims
of computed curve fixtures:

- With p=2,n=1,r=1,U=ℤ/2ℤ and #F=16, the denominator is four and the extracted
  order is four. Ignoring either rank or torsion changes the result.
- With p=2,n=1,r=0,U=ℤ/4ℤ and #F=8, k_m=2 and the extracted order is four.
  Replacing #U[m] by the full torsion order would give two.
- The groups (ℤ/2ℤ)² and (ℤ/4ℤ)² both have first 2-torsion layer of order
  four, but have orders four and sixteen. The latter fails the n=1 exponent
  requirement. Both are compatible with square orders, so a square-order
  check does not repair the ambiguity.
- Level n=0 is rejected. A level m=1 gives no information about a nontrivial
  p-primary group.
- An additive change of the finite presentations changes none of the counts.

**Theorem `BSD.8/primary-order-extraction`.** A certificate c identifies
Sha[p∞] with Sha[m] as subgroups of actual Sha. It proves finiteness and

\[
 \#F=\left(m^r\#U[m]\right)\#\Sha(E/\mathbf Q)[p^\infty].
\]

The positive denominator divides #F, so natural division has no rounding and
`primaryOrder(c)` is the exact positive primary order.

Indeed, every m-torsion element is p-primary, and the independent exponent
proof gives the converse inclusion. The imported Kummer sequence identifies
the quotient of Sel_m by E(ℚ)/mE(ℚ) with Sha[m]. The pinned Tau Ceti theorem
`AddSubgroup.index_range_nsmul_of_fg` gives the Kummer-image cardinality
mʳ·#E(ℚ)[m], including torsion, and E(ℚ)[m] identifies with U[m]. Counting
the finite quotient gives the product equality. Cremona, §3.6, pp.90–91,
supplies the concrete m=2 calculation; the general m sequence is imported
from EllipticCurves Layer 7. Finite Selmer alone does not supply the
independent exponent proof.

**Theorem `BSD.8/zero-first-layer-primary-vanishing`.** There is a useful
special case that requires no exponent certificate. If a complete finite
Sel_p model has cardinality pʳ·#E(ℚ)_tors[p], the Kummer quotient is trivial,
so Sha[p]=0. Any nonzero p-primary element would have a minimal killing
power pᵏ, with k≥1; multiplying by pᵏ⁻¹ produces nonzero p-torsion. Thus
Sha[p∞]=0. This argument needs neither prior primary finiteness nor prior
whole-Sha finiteness. It uses equality with the exact Kummer count, not just
an unmatched Selmer bound. For rank one with trivial rational 2-torsion the
required Sel₂ cardinality is two.

**Theorem `BSD.8/global-primary-order-product`.** Suppose B>0 is proved to
kill the whole Sha(E/ℚ), and the analytic-rank hypothesis supplies its
finiteness. For p∈primeFactors(B), set n_p=v_p(B)≥1 and supply a complete
Sel_{pⁿᵖ} model F_p and the actual torsion model U. The coprime part of B is
invertible on each p-primary subgroup, so B-annihilation supplies precisely
the needed pⁿᵖ-annihilation. Components at p∤B vanish. Consequently

\[
 \#\Sha(E/\mathbf Q)=
 \prod_{p\mid B}
 \frac{\#F_p}{(p^{n_p})^r\#U[p^{n_p}]}.
\]

Each factor is exact and positive. Use the pinned
`TauCeti.AddCommGroup.primaryDecomposition`, rather than developing finite
primary decomposition again. Its canonical indexing set is the prime support
of the actual group order; B-annihilation removes components outside the
displayed set, and extra primes of B contribute trivial factors. For B=1 the
empty product is one. A prime with a certified zero first layer can use the
preceding shortcut instead of a deeper descent.

**Check on the bound supplier.** The statement
`HeegnerPointEulerSystems:HE.7/exceptional-primary-sha-bound` is in a specified
imaginary quadratic extension and a specified quotient/CM-point setting. Its
integral bound retains the constants
2C₀+2C₁+4C₂+4C₃+C₆+21v_p(2), with its stated coefficient-prime and
non-CM hypotheses. It is not a numerical certificate for every E/ℚ. Evaluate
the constants and prove the field comparison before using it here. In
particular, restriction and corestriction at 2 can leave a kernel. Neither
finite Sha nor an unspecified positive integer d_E proves that any chosen
integer B is an annihilator.

### Certifying the rank-one free lattice

**Definition `BSD.8/rank-one-search-certificate`.** Let E be given by an
integral equation, with proved rank one and P non-torsion. A
`PrimitivePointSearch(E,P)` consists of a real C with a proved inequality

\[
 h_{\rm naive}(Q)\le h_{\rm BSD}(Q)+C
\]

for every affine rational point Q; an integer H≥1 with
h_BSD(P)/4+C≤log H; and a finite on-curve list containing every affine
rational point of naive logarithmic x-height at most log H. For each listed
R it stores an exact equality R=k_RP+T_R with k_R∈ℤ and T_R rational torsion.
It stores no unbounded generation assertion.

The complete finite search enumerates reduced coordinates
x=a/c², y=b/c³, with c≥1, gcd(a,c)=gcd(b,c)=1 and
max(|a|,c²)≤H, and solves the integral curve equation for b exactly. The
identity is handled separately. Integer sieves can discard only candidates
proved impossible. An integral-point search alone is not complete for this
certificate. An approximate height relation is verified as an exact equation
in E(ℚ) before being stored.

Cremona, §3.5, pp.75–78, especially Proposition 3.5.1 and footnote 3 on
p.77, gives the height-difference and finite-search method. Its height is
twice Silverman's height. The certificate takes a proved bound C in the
chosen BSD normalization; it does not import rounded decimal constants as
exact inequalities without a proof.

| API | Statement |
| --- | --- |
| `PrimitivePointSearch.heightBound` | The proved global naive-height bound |
| `.bound` | H≥1 and the quarter-height search inequality |
| `.points` | The finite verified on-curve list |
| `.complete` | Every point within the bounded naive-height set is listed |
| `.relations` | The exact kP+T representation for every listed point |
| `.ofCoordinateSearch` | Construct from exhaustive finite enumeration and verified relations |
| `.changeEnumeration` | Permuting or repeating entries preserves the certificate |
| `.primitive` | The basis theorem, promoted to `rank-one-search-saturation` |

Four unit tests distinguish bounded completeness from the desired conclusion.
If P=2Q modulo torsion for a generator Q, the height bound forces Q into the
list and its required representation fails. Replacing a primitive P by
−P+T preserves primitivity and transports its relations. Deleting a required
point with denominator greater than one invalidates completeness. A torsion
P or rank-zero curve fails the hypotheses, even if its search list is empty.

**Theorem `BSD.8/rank-one-search-saturation`.** A search certificate proves
that the image of P is a basis of E(ℚ)/torsion, and that
R_BSD=h_BSD(P)>0. To prove this, write P=kQ modulo torsion for a generator Q
of the rank-one free quotient. If |k|≥2, quadraticity gives
h_BSD(Q)≤h_BSD(P)/4, so Q appears in the complete search. Its stored relation
Q=jP+T gives 1=jk on the free quotient, a contradiction. Thus |k|=1.
The full index [E(ℚ):ℤP] is still t. A primitive point on a curve with five
rational torsion points has free index one and full index five.

**Comparison `BSD.8/point-normalized-leading-quotient`.** A non-torsion P
of proved free index I>0 satisfies h_BSD(P)=I²R_BSD. If the exact rational
a_P casts to L′/(Ω h_BSD(P)), then the normalized quotient for the actual
regulator is a=I²a_P. In particular, I=2 and a_P=1/4 gives a=1. When a full
Mordell–Weil index J is supplied, first prove J=It and extract I exactly;
using J² would insert an unwanted torsion square. A certified primitive Q
and an exact relation P=kQ+T provide I=|k|. This imports the accepted
height/index adapter and BSD.5's Heegner-index comparison.

### Local factors, normalization and the actual curve

**Comparison `BSD.8/certified-local-factor-product`.** Start with a specified
nonsingular integral model of E with Δ≠0. For every prime ℓ dividing |Δ|,
replay the supplied EllipticCurves Layer-4 trace, including admissible
coordinate changes, scaling and the final minimality test. Its correctness
theorem identifies the returned positive c_ℓ with
[E(ℚ_ℓ):E₀(ℚ_ℓ)]. Their finite product is the actual C. Outside the
discriminant support the model has good reduction and c_ℓ=1. A nonminimal
integral model can introduce extra good places, but its verified local
transformations make those extra factors one.

Cremona, §3.2, pp.65–68, describes the local indices and separates the
characteristic-2 and characteristic-3 transformations. Its steps 4–17,
29–31 and 66–78 display why the generic residue-characteristic branches
cannot be used indiscriminately. This target assembles correct traces; it
does not develop another Tate algorithm or infer local indices from a
conductor alone.

**Comparison `BSD.8/leading-quotient-normalization`.** Suppose exact
rational nonzero u,v give Ω_src=uΩ_BSD and R_src=vʳR_BSD. If a_src casts to
L*/(Ω_srcR_src), then

\[
 a_{\rm BSD}=uv^r a_{\rm src},\qquad
 v_p(a_{\rm BSD})=v_p(a_{\rm src})+v_p(u)+r v_p(v).
\]

The second equality assumes a_src≠0. At the pins v=1/2 for Tau Ceti's
regulator. If the source period is over the identity component and E(ℝ)
has two components, u=1/2. In rank one these two corrections together give
1/4; in rank zero there is no regulator correction. They follow by exact
substitution and the valuation product formula. An odd-prime unit
comparison cannot establish the dyadic equality. With u=1,v=1/2,r=1 and
a_src=2 the corrected quotient is one, reducing its dyadic valuation by
one. The period identifications are actual differential/integration
statements supplied by the imported theory, not assumptions about the
names used in a source.

**Comparison `BSD.8/arithmetic-data-identifies-defect`.** Suppose actual E
has analytic rank at most one, with the imported rank equality and finite
Sha. Take its exact t, a proved exact whole-Sha order s, and the complete
local product C. Let a>0 be rational with proved real image L*/(ΩR_BSD).
Then

\[
 d_E=\operatorname{normalizedDefect}(a,t,s,C)\quad\text{in }\mathbf Q.
\]

Compare the displayed leading quotient with BSD.5's real defining identity,
cancel the positive arithmetic terms and use injectivity of the rational
embedding into the reals. This supplies an equality of actual defects,
which transfers both finite support and every prime valuation. The
rank-one point/index and source normalization comparisons are applied
before this step. A valid independent finite equivalence with whole Sha
can supply s directly; the primary-product theorem is a concrete producer
when a verified annihilator is available.

Isogeny comparison keeps its existing owner. For an actual rational isogeny
φ:E→E′, import `BSD.5/defect-isogeny-invariance` and the accepted
`BSD.8/local-isogeny-certificate-adapter`. The latter requires actual
kernel/cokernel, differential and global index data for the Cassels
comparison; the degree alone does not determine them. Exact equality
d_E=d_E′ transports the certificate even when torsion, Sha, period and
individual Tamagawa factors differ. At a prime dividing deg φ, or at a
dyadic or additive place, those individual factors cannot be replaced by
unit assertions. No new general isogeny theory is planned here.

### Completing the exceptional-prime ledger

**Construction `BSD.8/complete-exception-ledger`.** Assume the actual defect
identification above. Choose a finite set S of primes. Supply a proof
v_p(d_E)=0 for every prime outside S, and the exact ledger balance
v_p(a)+2v_p(t)=v_p(s)+v_p(C) for every p∈S. The inside balances transfer to
actual defect valuations by `ledger-valuation-balance`; the accepted
constructor from exceptions then produces the existing finite prime
certificate. It proves support coverage as part of its construction.

The outside theorem is supplied by the accepted
`source-qualified-prime-part-dispatch`: choose the actual named theorem
branch and verify all its reduction, residual, ordinary, nonvanishing,
torsion and normalization hypotheses. A good-reduction Eisenstein theorem
does not supply a bad-reduction prime part. A branch restricted to odd
primes leaves 2 in the exceptional ledger. Alternatively choose S as the
explicit union from `ledger-support-cover`; exact arithmetic then supplies
the outside vanishing and all primes in that finite cover are checked.

The construction's API is:

| Declaration | Statement |
| --- | --- |
| `PrimeValuationCertificate.ofExactLedger` | Build the existing certificate from exact inside balances and an outside theorem |
| `.ofLedgerSupport` | Use the explicit finite ledger cover for the outside theorem |
| `.exactLedger_localZero` | Identify each local proof with the transported exact integer balance |
| `.exactLedger_support` | Prove canonical support inclusion, allowing cancellation |
| `.exactLedger_fullBSD` | Apply the existing actual elliptic endpoint |
| `.exactLedger_isogeny` | Transport along exact defect invariance; identity and composition preserve the certificate |
| `.exactLedger_family` | Apply pointwise to an indexed family with all the required data for each member |

Its five unit tests are: the ledger a=2 with unit integer factors fails at
2 despite all odd valuations vanishing; the covering set {5} for
a=1/5,t=5,s=1,C=5 passes the balance −1+2=0+1; the input a=1/4 has a
negative dyadic valuation and fails; all unit inputs admit an empty
certificate; and a proved equality d_E=d_E′ transports the same finite set
and valuation proofs without requiring equal individual invariants. No
completed certificate is available when an exceptional balance or an
outside-theorem hypothesis is missing.

The full formula follows by positivity of d_E and the accepted rational
reconstruction. For a family, the hypotheses are indexed over the stated
family. An assertion that each curve has only finitely many excluded
primes, without certificates at those primes, cannot discharge this
quantifier.

### Acceptance, sources and elaboration boundary

The acceptance path is explicit: prove the actual rank and finite-Sha inputs;
obtain an exact rational leading quotient with all height, period and free
index changes; certify torsion, whole Sha and the complete local product;
identify the actual rational defect; discharge each exceptional ledger
entry and the outside theorem; and use the imported positive reconstruction
and actual elliptic endpoint. The eighteen definition/construction tests
above are checks on this path, not a claim that any BSD.9 curve has already
been certified.

There are two recorded arithmetic gaps. The first is producing an evaluated exponent or
equally strong exact order bound for a chosen nontrivial primary component
when no independent computation supplies it. An available HE.7 theorem
must be instantiated with evaluated constants and the correct field
comparison. A trivial first layer avoids that gap at its prime. No
universal terminating search for successful certificates is asserted.
The second preserves the predecessor's explicit dyadic quadratic-period
exponent and dyadic/ramified Tamagawa comparison in BSD.1 and BSD.5. If the
exact leading quotient is obtained through that route, its actual
minimal-differential lattice index, real-component factor and every local
correction must be supplied. The normalization transport theorem consumes
those exact scalings; it does not compute them. A direct exact quotient
over ℚ can avoid the quadratic route. The inherited gap is not closed by
rationality alone or by a comparison up to odd-prime units.
The three supplier requests are to EllipticCurves Layers 4, 6 and 7, for
their existing local, Mordell–Weil and cohomological interfaces. Concrete
finite equivalences, local traces, searches and analytic identities for
the comparison fixtures belong to BSD.9.

The source used for finite arithmetic is John E. Cremona,
[*Algorithms for Modular Elliptic Curves*, second edition, corrected online
Chapter III](https://johncremona.github.io/book/fulltext/chapter3.pdf), at the
section and printed-page locators above. Its public file was read on
2026-10-19; SHA-256
`c4843b80ae1b6b91795b9952d782912542dd8d6b17c1940cd1a881fa6fdd9c26`.
The statements here are our own formulations for the certificate consumers.
The prior packet and its independent review supply the accepted core and
the exact BSD.5/GZ.0/HE.7 supplier contracts. This pass does not reverify
the prime-part papers or extend their hypotheses. The additional sources
routed to BSD.0, BSD.5, BSD.7a and BSD.9 remain with those owners.

The pinned sources were checked at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The thirteen baseline references
include exact rational valuations, prime factors, generated additive
primary components, Tau Ceti's general nsmul index formula, explicit
2-descent image count, rank-zero regulator and canonical finite primary
decomposition. The current read-only Tau Ceti and TauCetiRoadmap checkouts
were inspected as well; none of these foundations is replanned.

The [suggested file](../suggested/RankZeroOneBSD--BSD.8.lean) has one light
arithmetic definition with a real body, API statements, end statements and
finite-group/scalar examples. It elaborates at the pins with only the
expected proof-placeholder warnings. Heavy actual arithmetic carriers are
named README targets, as WORKERS.md's fixed shape requires. Its generic
additive-group and real-scalar statements establish no actual elliptic
input. They do not replace Selmer, Sha or period interfaces by artificial
records. The accepted core definitions are not recopied into the file.

This packet adds the planet **Certified primary descent** to the five
accepted BSD.8 planets: Prime support, All-prime reconstruction,
Finite-support certificate, Certified finite descent and Full BSD from
prime certificates. The cumulative layer therefore retains the six-planet
limit.
