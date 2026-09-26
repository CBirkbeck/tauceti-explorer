# Elliptic curves, Part II: rank-zero and rank-one Birch–Swinnerton-Dyer theory

## BSD.7–BSD.9: rational all-prime assembly

This continuation builds on `tauceti:TauCetiRoadmap/EllipticCurves`, not on a new elliptic-curve carrier. That roadmap owns the Weierstrass point group, reduction, torsion, Mordell–Weil lattice, canonical pairing, regulator, periods, general Selmer and Tate–Shafarevich groups, and arithmetic isogeny comparisons. BSD.5 owns the strictly positive rational defect and its identification with the actual analytic and arithmetic leading terms. This part supplies the finite-support comparison needed to assemble proved prime-part results. It does not obtain unrestricted full BSD from the rank-zero/rank-one rank and finiteness theorem.

The stage inventory is exactly `RankZeroOneBSD:BSD.7`, `RankZeroOneBSD:BSD.7a`, `RankZeroOneBSD:BSD.8`, and `RankZeroOneBSD:BSD.9`. The declaration-level development below covers the rational core of BSD.8 and rational obstruction tests for BSD.9. The source-decomposition obligations for BSD.7/7a, the actual elliptic defect interface, and the remaining curve acceptance examples are specified in their own sections. The packet has partial coverage; no stage is labelled closed.

## Conventions and ownership

For a rational number q, use Mathlib's reduced integer numerator q.num and positive natural denominator q.den. Write v_p(q) for the existing integer-valued padicValRat. This is not a newly defined valuation: it is the natural valuation of the absolute numerator minus the natural valuation of the denominator. In particular, v_p(0)=0 in this totalized API. Every reconstruction statement therefore carries strict positivity of q. Nonzero alone would still allow -1. No valuation of a real number is taken without first identifying it with the particular rational value supplied by BSD.5.

The finite prime support is the union of the existing prime-factor finite sets of the absolute numerator and denominator. Its empty value at zero follows the existing natural-factor convention. The set is canonical for q, not for an arbitrary displayed fraction. A support cover may contain extra primes, but a proof is required that it contains all actual support primes. Checking a proposed list in a database is not such a proof.

The proposed reusable home of the rational declarations is `TauCeti/NumberTheory/Padics/RationalCertificates`, with public namespace `Rat`. Natural factorization and rational valuation remain the existing Mathlib notions. The application to actual curves belongs in `TauCeti/AlgebraicGeometry/EllipticCurve/BSD/LeadingTerm`, with the existing WeierstrassCurve types. The rank-zero regulator-one theorem is already supplied by the pinned Tau Ceti library and is not a new node here. Height and pairing rescalings are imported from `GrossZagierAndArithmeticHeights:GZ.0` when constructing the actual BSD.5 interface.

For an elliptic curve E over Q and analytic rank r in {0,1}, the arithmetic leading term is

A_E = Omega_E Reg_E #Sha(E/Q) (product over finite primes ell of c_ell) / #E(Q)_tors^2.

Here Omega_E is the full real period, so it already includes the real components. The canonical pairing convention must be compared with the source before computing Reg_E; a power of two cannot be discarded in a dyadic formula. L*(E,1) denotes L^(r)(E,1)/r!, not an arbitrary analytic germ. BSD.5 must supply a rational d_E, prove d_E>0 and A_E>0, and identify its real image with L*(E,1)/A_E. The finite-support certificate is attached to this actual d_E. A free rational named “BSD defect” is not a substitute.

## BSD.7 and BSD.7a: source-specific work retained

These layers retain the separate Castella–Grossi–Skinner and Keller–Yin proof branches specified by the source roadmap. The CGS introductory theorem retains good reduction at the odd prime, a rational prime-degree isogeny, and the stated local residual-character exclusion. The broader Keller–Yin branch requires its own full statement and proof matching, including the local invariants, extensions and rational torsion corrections. Neither is supplied by the rational certificate algebra below. [CGS, introduction and section 1.2](https://arxiv.org/html/2303.04373v2).

The work of BSD.7a is the actual construction and proof of the required main-conjecture inputs: residual-character comparison, both divisibilities, local Euler corrections, integral control, finite submodules and lattice changes. A statement obtained only after inverting p does not discharge the integral valuation equality. Import early generic Selmer/Iwasawa and Euler-system interfaces from their owners; do not import an endpoint reexport from ModularIwasawaMainConjectures L6 to prove the very result that supplies it. Likewise the outgoing BSD.7a to HE.8b dependency is not an incoming proof input.

A continuation must expand each of those source arguments into declaration-sized nodes and match every hypothesis to the actual defect. The four-stage scope remains unchanged; no new wrapper is used to conceal an undecomposed main-conjecture proof. The Burungale–Tian congruent-number root-number addition belongs to BSD.0 in the sibling part and is not duplicated here.

## BSD.8: declaration-level development

The key distinction is between local equalities, an exhaustive proof that they cover every prime, and positivity of the particular rational defect. A certificate carries the first two. Reconstruction additionally needs the third. Consequently there is a valuation certificate for 0 and for -1, but neither establishes a leading-term identity. These boundary cases are deliberate tests of the contract.

The construction is useful in two input modes. An independently proved all-prime theorem yields a canonical certificate using the exact support. A finite exceptional-prime argument supplies a set S, proofs at each member, and an outside-S theorem; the constructor proves the support cover from that outside theorem. It does not require computing the exact numerator and denominator of an analytically presented defect. Conversely, explicit rational factorization can provide the support cover directly, but it still does not prove the local zero valuations.

### 1. Prime support of a rational number

Node: `RankZeroOneBSD:BSD.8/prime-support`. Kind: definition.

For q in Q, Rat.primeSupport(q) is Nat.primeFactors(|q.num|) union Nat.primeFactors(q.den), using the existing reduced numerator and positive denominator. It is a finite set of natural numbers, not a set of arbitrary places. At q=0 its value is empty by the existing zero convention.

**Construction or proof.** Take the union of the two existing finite prime-factor sets. The construction is deterministic and uses the canonical rational numerator and denominator; it makes no choice of a factorization or rational representative.

**Prerequisites.** `mathlib:Nat.primeFactors`.

**Rat.mem_primeSupport** (characterisation). For q nonzero, p belongs to its support exactly when p is prime and divides its absolute numerator or denominator.

**Rat.primeSupport_zero** (simp). The prime support of zero is empty.

**Rat.primeSupport_one** (simp). The prime support of one is empty.

**Rat.primeSupport_neg** (compatibility). Negation leaves prime support unchanged.

**Rat.primeSupport_inv** (compatibility). Inversion leaves prime support unchanged, including at zero.

**Rat.primeSupport_mul_subset** (relation). The support of a product is contained in the union of the supports of its factors; equality is not asserted because cancellation is possible.

**Consumers.** BSD.8 finite-support assembly: Provides a finite, exact cover of all potentially nonzero rational prime valuations. BSD.9 zero and sign regression tests: Makes the degenerate conventions visible rather than hiding them in a positivity wrapper.

**Test Rat.primeSupport_test_six_thirtyfive** (computation). The support of 6/35 is {2,3,5,7}.

**Test Rat.primeSupport_test_zero** (degenerate). The support of 0 is empty; this does not imply 0=1.

**Test Rat.primeSupport_test_cancellation** (non-example). The support of 2 times 1/2 is empty although the union of the two individual supports is {2}.

**Test Rat.primeSupport_test_negative** (compatibility). The support of -6/35 equals the support of 6/35.

**Acceptance.** Changing a displayed fraction by a common nonzero factor does not change its rational prime support.

**Sources.** mathlib-prime-fin, primeFactors; mem_primeFactors; primeFactors_zero: Compose the existing natural-number construction; do not reimplement factorization.

### 2. Membership in rational prime support

Node: `RankZeroOneBSD:BSD.8/support-membership`. Kind: lemma.

For q nonzero and p natural, p belongs to Rat.primeSupport(q) if and only if p is prime and either p divides |q.num| or p divides q.den.

**Hypotheses.** q is a nonzero rational number.

**Construction or proof.** Unfold the union defining prime support. Apply Nat.mem_primeFactors to each summand. Nonzero q gives nonzero absolute numerator; the canonical denominator is positive. Remove these two nonzero conditions and distribute the shared primality condition.

**Prerequisites.** `RankZeroOneBSD:BSD.8/prime-support`, `mathlib:Nat.mem_primeFactors`.

**Acceptance.** At q=6/35, 5 belongs to the support and 4 does not. The nonzero hypothesis prevents treating every prime as a divisor contributing to the support of zero.

**Sources.** mathlib-prime-fin, mem_primeFactors: Apply the exact membership theorem to both canonical integers.

### 3. Zero valuation in the reduced numerator and denominator

Node: `RankZeroOneBSD:BSD.8/zero-numerator-denominator`. Kind: lemma.

For a prime p and any rational q with v_p(q)=0, both the natural valuation of |q.num| and that of q.den are zero.

**Hypotheses.** p is prime. v_p(q)=0; q may be zero.

**Construction or proof.** Use Rat.num_or_den_zero_padicVal to obtain that at least one of the numerator and denominator valuations is zero. Unfold padicValRat. Its vanishing equates the two natural valuations after integer coercion. In each branch, substitute the known zero and deduce that the other valuation is zero.

**Prerequisites.** `mathlib:Rat.num_or_den_zero_padicVal`, `mathlib:padicValRat`, `mathlib:padicValInt`.

**Acceptance.** The result also holds for q=0 under the library convention. It must not be applied to an unreduced numerator/denominator pair.

**Sources.** mathlib-padic, Rat.num_or_den_zero_padicVal; padicValRat: Reducedness prevents cancellation between two positive numerator and denominator valuations.

### 4. Prime valuation and exact support

Node: `RankZeroOneBSD:BSD.8/zero-iff-outside-support`. Kind: comparison.

For a nonzero rational q and a prime p, v_p(q)=0 if and only if p does not belong to Rat.primeSupport(q).

**Hypotheses.** q is nonzero. p is prime.

**Construction or proof.** For the forward implication, apply zero-numerator-denominator. Use dvd_iff_padicValNat_ne_zero, separately for the nonzero absolute numerator and the positive denominator, to exclude both divisibilities. Apply support-membership. For the reverse implication, support-membership excludes both divisibilities. The same baseline equivalence gives zero for both natural valuations. Subtract them in the definition of padicValRat. Install Fact p.Prime locally when applying the baseline valuation lemma.

**Prerequisites.** `RankZeroOneBSD:BSD.8/support-membership`, `RankZeroOneBSD:BSD.8/zero-numerator-denominator`, `mathlib:dvd_iff_padicValNat_ne_zero`, `mathlib:padicValRat`, `mathlib:padicValInt`.

**Acceptance.** For q=1/2, the valuation at 2 is -1 and 2 is in the support; negative valuations are not discarded.

**Sources.** mathlib-padic, dvd_iff_padicValNat_ne_zero: Both uses retain the nonzero natural-argument hypothesis.; mathlib-prime-fin, mem_primeFactors: Identifies the two possible supports.

### 5. Empty prime support and rational units of absolute value one

Node: `RankZeroOneBSD:BSD.8/empty-support-units`. Kind: lemma.

For nonzero q in Q, Rat.primeSupport(q) is empty if and only if q=1 or q=-1.

**Hypotheses.** q is nonzero.

**Construction or proof.** A union is empty exactly when each of its finite sets is empty. Apply Nat.primeFactors_eq_empty to the absolute numerator and denominator. Their nonzero properties eliminate the zero alternatives. Thus the absolute numerator and denominator are both one; the canonical rational normal form gives q=1 or q=-1. Conversely, substitute either value in the definition.

**Prerequisites.** `RankZeroOneBSD:BSD.8/prime-support`, `mathlib:Nat.primeFactors_eq_empty`.

**Acceptance.** Both 1 and -1 must occur. The unrestricted implication with q=0 is false.

**Sources.** mathlib-prime-fin, primeFactors_eq_empty: Apply twice, retaining nonzero q to eliminate the zero numerator.

### 6. Reconstruction of a positive rational from all prime valuations

Node: `RankZeroOneBSD:BSD.8/positive-rational-reconstruction`. Kind: theorem.

For q in Q with 0<q, q=1 if and only if v_p(q)=0 for every prime natural p.

**Hypotheses.** q is strictly positive.

**Construction or proof.** If q=1, use padicValRat.one at every prime. Conversely q is nonzero. Every member of primeSupport(q) is prime by support-membership, and zero-iff-outside-support contradicts its membership if all prime valuations vanish. Hence the support is empty. Apply empty-support-units. Strict positivity eliminates the alternative q=-1.

**Prerequisites.** `RankZeroOneBSD:BSD.8/support-membership`, `RankZeroOneBSD:BSD.8/zero-iff-outside-support`, `RankZeroOneBSD:BSD.8/empty-support-units`, `mathlib:padicValRat.one`.

**Acceptance.** Reject the conclusion for q=0 and q=-1 when positivity is removed. Testing only odd primes leaves q=2 undecided.

**Sources.** roadmap, BSD.8: This is only the rational reconstruction step, not a theorem establishing positivity or rationality of the BSD quotient.; mathlib-prime-fin, primeFactors_eq_empty: The proof reduces reconstruction to prime-factor uniqueness at one.

### 7. Finite certificate of rational prime-valuation vanishing

Node: `RankZeroOneBSD:BSD.8/finite-prime-certificate`. Kind: definition.

Rat.PrimeValuationCertificate(q) consists of a finite set primes of natural numbers, proofs that every member is prime, that Rat.primeSupport(q) is contained in primes, and that v_p(q)=0 for every member p. It stores no equality q=1, no positivity assumption, and no unproved assertion that a partial list covers the support.

**Construction or proof.** Form the structure using the existing finite-set and valuation types and the explicit primeSupport construction. Constructor fields have the stated mathematical content. Extensionality reduces to equality of the finite sets, since the other fields are proofs.

**Prerequisites.** `RankZeroOneBSD:BSD.8/prime-support`, `mathlib:padicValRat`.

**Rat.PrimeValuationCertificate.primes** (data). The finite set used by this certificate.

**Rat.PrimeValuationCertificate.prime_mem** (projection). Every member of primes is prime.

**Rat.PrimeValuationCertificate.covers** (projection). The canonical support is contained in primes.

**Rat.PrimeValuationCertificate.localZero** (projection). The valuation vanishes at every member of primes.

**Rat.PrimeValuationCertificate.ext** (extensionality). Certificates for the same q with equal finite sets are equal.

**Rat.PrimeValuationCertificate.zeroValuation** (characterisation). A certificate implies zero valuation at every prime, including outside its finite set.

**Rat.PrimeValuationCertificate.eq_one** (compatibility). A certificate for strictly positive q implies q=1.

**Consumers.** BSD.8 individual-curve and family assembly: Separates finitely many local proofs from a proof of support coverage. BSD.9 missing-prime tests: Rejects partial local evidence without conflating it with rank or Sha finiteness.

**Test Rat.PrimeValuationCertificate.test_one** (computation). A certificate for 1 exists with empty finite set.

**Test Rat.PrimeValuationCertificate.test_zero** (degenerate). A certificate for 0 exists with empty finite set, but the positivity input is false.

**Test Rat.PrimeValuationCertificate.test_negative_one** (non-example). A certificate for -1 exists; its existence alone is not a full-formula certificate.

**Test Rat.PrimeValuationCertificate.test_two** (non-example). There is no certificate for 2.

**Test Rat.PrimeValuationCertificate.test_quarter** (non-example). There is no certificate for 1/4, whose missing dyadic valuation is negative.

**Acceptance.** An empty list is not evidence of coverage for q=2. Zero and -1 can have such valuation certificates but cannot pass positive reconstruction.

**Sources.** roadmap, BSD.8: The data consist of finite support coverage and checked local valuations; positivity is a separate hypothesis of reconstruction.

### 8. Canonical certificate from all prime valuations

Node: `RankZeroOneBSD:BSD.8/certificate-from-all-primes`. Kind: construction.

Given a rational q and a proof that v_p(q)=0 for every prime p, construct Rat.PrimeValuationCertificate.ofAllPrimes(q) with finite set exactly Rat.primeSupport(q). No nonzero or sign hypothesis is needed.

**Hypotheses.** All prime valuations of q vanish.

**Construction or proof.** Choose the canonical support as the finite set; support coverage is reflexive. Its members are prime by Nat.mem_primeFactors, even when the numerator is zero. The supplied all-prime assertion gives every local proof.

**Prerequisites.** `RankZeroOneBSD:BSD.8/finite-prime-certificate`, `mathlib:Nat.mem_primeFactors`.

**Rat.PrimeValuationCertificate.ofAllPrimes** (constructor). Construct the certificate from the all-prime vanishing hypothesis.

**Rat.PrimeValuationCertificate.ofAllPrimes_primes** (simp). Its finite set is exactly Rat.primeSupport(q).

**Consumers.** BSD.8 independently proved all-prime family theorems: Turns a universal valuation theorem into the same certificate type as finite exceptional-prime arguments.

**Test Rat.PrimeValuationCertificate.ofAllPrimes_test_one** (computation). For q=1 the chosen finite set is empty.

**Test Rat.PrimeValuationCertificate.ofAllPrimes_test_zero** (degenerate). For q=0 the chosen finite set is empty.

**Test Rat.PrimeValuationCertificate.ofAllPrimes_test_negative_one** (non-example). For q=-1 the chosen finite set is empty without providing positivity.

**Acceptance.** The chosen set is canonical rather than an unspecified finite witness.

**Sources.** mathlib-prime-fin, mem_primeFactors: Primality of each member is unconditional.; roadmap, BSD.8: Packages genuine all-prime input, not a new proof of it.

### 9. A finite certificate controls every prime

Node: `RankZeroOneBSD:BSD.8/certificate-all-primes`. Kind: lemma.

For any rational q, any Rat.PrimeValuationCertificate(q), and any prime p, v_p(q)=0.

**Hypotheses.** A finite prime-valuation certificate for q is supplied. p is prime.

**Construction or proof.** If q=0 use padicValRat.zero. Otherwise split on membership of p in the certificate finite set. Inside the set use localZero. Outside it, covers implies p is outside canonical support. Apply zero-iff-outside-support to nonzero q.

**Prerequisites.** `RankZeroOneBSD:BSD.8/finite-prime-certificate`, `RankZeroOneBSD:BSD.8/zero-iff-outside-support`, `mathlib:padicValRat.zero`.

**Acceptance.** The outside-set branch must be justified by covers. The statement also applies at the zero convention without producing equality to one.

**Sources.** roadmap, BSD.8: This theorem proves that exclusion from the actual coverage field, rather than assuming that the displayed finite list is exhaustive.

### 10. Positive reconstruction from a finite certificate

Node: `RankZeroOneBSD:BSD.8/certificate-reconstruction`. Kind: theorem.

For strictly positive q in Q, a Rat.PrimeValuationCertificate(q) implies q=1.

**Hypotheses.** q is strictly positive. A finite prime-valuation certificate for q is supplied.

**Construction or proof.** Use certificate-all-primes to get the valuation statement at every prime. Apply positive-rational-reconstruction with the supplied strict positivity.

**Prerequisites.** `RankZeroOneBSD:BSD.8/certificate-all-primes`, `RankZeroOneBSD:BSD.8/positive-rational-reconstruction`.

**Acceptance.** Neither a certificate for -1 nor one for 0 supplies the positivity hypothesis.

**Sources.** roadmap, BSD.8: This supplies the algebraic identity only after the positive rational defect has been identified by its owner.

### 11. Certificate from an exceptional-prime set and an outside theorem

Node: `RankZeroOneBSD:BSD.8/certificate-from-exceptions`. Kind: construction.

Given q in Q, a finite set S of primes, vanishing of v_p(q) on S, and vanishing at every prime outside S, construct Rat.PrimeValuationCertificate.ofExceptionSet(q,S) with finite set S. Its support coverage is proved, not an extra unverified field.

**Hypotheses.** Every member of S is prime. v_p(q)=0 for each p in S. For every prime p outside S, v_p(q)=0.

**Construction or proof.** For q=0 the canonical support is empty, so coverage is immediate. For q nonzero and p in canonical support, support-membership gives primality. If p were outside S, the outside theorem and zero-iff-outside-support would contradict membership. This proves coverage. Use the given primality and inside vanishing statements for the remaining fields.

**Prerequisites.** `RankZeroOneBSD:BSD.8/finite-prime-certificate`, `RankZeroOneBSD:BSD.8/support-membership`, `RankZeroOneBSD:BSD.8/zero-iff-outside-support`.

**Rat.PrimeValuationCertificate.ofExceptionSet** (constructor). Construct the certificate from inside and outside prime-valuation proofs.

**Rat.PrimeValuationCertificate.ofExceptionSet_primes** (simp). Its finite set equals the supplied S.

**Consumers.** BSD.8 exceptional 2, 3, and bad primes: Combines the named source-qualified branches with independent exceptional-prime calculations only after their ranges cover all primes.

**Test Rat.PrimeValuationCertificate.ofExceptionSet_test_empty** (degenerate). For q=1 and S empty the supplied global outside theorem gives the empty certificate.

**Test Rat.PrimeValuationCertificate.ofExceptionSet_test_enlarged** (compatibility). For q=1 and S={2,3}, correct inside and outside proofs produce a certificate with exactly {2,3}, not the minimal support.

**Test Rat.PrimeValuationCertificate.ofExceptionSet_test_negative_one** (non-example). For q=-1 and S={2}, correct prime data produce a valuation certificate, still without positivity.

**Acceptance.** The outside theorem has to cover every prime outside S, not just every sufficiently large prime beyond a second unstated exception set.

**Sources.** roadmap, BSD.8: The inside and outside proofs remain distinct inputs; deriving support coverage does not manufacture any missing prime-part theorem.

### 12. Transfer of a certified rational quotient to a real identity

Node: `RankZeroOneBSD:BSD.8/real-identity`. Kind: comparison.

Let A,B be real numbers with B nonzero. If q is a strictly positive rational number, its canonical real image equals A/B, and q has a finite prime-valuation certificate, then A=B.

**Hypotheses.** B is nonzero. q is strictly positive. The real image of q is exactly A/B. A finite prime-valuation certificate for q is supplied.

**Construction or proof.** Apply certificate-reconstruction to obtain q=1. Transport this equality through the canonical rational-to-real map. The identified quotient is one. Multiply by nonzero B using field algebra.

**Prerequisites.** `RankZeroOneBSD:BSD.8/certificate-reconstruction`.

**Acceptance.** The theorem does not assert that arbitrary A/B is rational. It also does not identify A or B with elliptic-curve invariants.

**Sources.** roadmap, BSD.8: An exact rational-to-real identification is indispensable; numerical recognition of a quotient is not this hypothesis.

### 13. Full leading term under the actual defect certificate

Node: `RankZeroOneBSD:BSD.8/elliptic-endpoint`. Kind: application.

Let E be an elliptic Weierstrass curve over Q of analytic rank r in {0,1}, with finite whole Sha. Let d_E be the strictly positive rational defect constructed by BSD.5 and identified there with L*(E,1)/A_E, where L*=L^(r)(E,1)/r! and A_E=Omega_E Reg_E #Sha(E/Q) product_l c_l / #E(Q)_tors^2 is strictly positive. A finite prime-valuation certificate for this actual d_E implies L*(E,1)=A_E. Omega_E is the full real period; no second real-component factor is inserted.

**Hypotheses.** The actual analytic and arithmetic invariants and the exact positive rational defect are supplied by BSD.5. The analytic rank is 0 or 1 and the whole Sha is finite. A certificate for this particular d_E is supplied.

**Construction or proof.** Obtain the canonical real identification and positivity of the denominator from BSD.5 with the agreed height, full-period, torsion and regulator conventions. Apply real-identity with A=L*(E,1) and B=A_E. This proves the conditional leading-term identity without changing any hypotheses of a prime-part supplier.

**Prerequisites.** `RankZeroOneBSD:BSD.8/real-identity`, `RankZeroOneBSD:BSD.5`.

**Acceptance.** An arbitrary rational carrying the same label is not an admissible substitute for d_E. Keep rank equality and whole-Sha finiteness as separate public results.

**Sources.** roadmap, BSD.8: The theorem is conditional on a complete certificate for the actual curve defect; it is not unrestricted rank-zero/one BSD.

## BSD.9: missing-prime regression tests

These are countermodels for the rational assembly logic, not claims that an elliptic curve has defect 2 or 1/4. They leave the separate analytic-rank and whole-Sha finiteness interfaces untouched.

### 14. A prime defect is invisible at every other prime

Node: `RankZeroOneBSD:BSD.9/away-from-prime`. Kind: lemma.

For distinct primes p and ell, the rational number p has valuation zero at ell.

**Hypotheses.** p and ell are primes. p is different from ell.

**Construction or proof.** Nat.Prime.dvd_iff_eq implies ell does not divide p, since ell is not one and the primes differ. Apply padicValNat.eq_zero_of_not_dvd, then padicValRat.of_nat.

**Prerequisites.** `mathlib:Nat.Prime.dvd_iff_eq`, `mathlib:padicValNat.eq_zero_of_not_dvd`, `mathlib:padicValRat.of_nat`.

**Acceptance.** With p=2 this verifies all odd-prime checks even though the rational defect is not one. With p=3 the same issue affects an omitted triadic check.

**Sources.** mathlib-prime-basic, Nat.Prime.dvd_iff_eq: Different primes cannot divide one another.; mathlib-padic, padicValRat.of_nat: Move the divisibility calculation to the rational valuation.

### 15. No complete certificate for a prime defect

Node: `RankZeroOneBSD:BSD.9/prime-obstruction`. Kind: application.

For every prime p, Rat.PrimeValuationCertificate(p), where p is cast to Q, is uninhabited.

**Hypotheses.** p is prime.

**Construction or proof.** Suppose a certificate were supplied. The rational p is positive, so certificate-reconstruction would give p=1. Primality gives p>1, a contradiction.

**Prerequisites.** `RankZeroOneBSD:BSD.8/certificate-reconstruction`.

**Acceptance.** Combine with away-from-prime for p=2: all odd-prime checks pass, but no complete certificate exists. The primitive baseline padicValRat.self gives the missing valuation as one.

**Sources.** roadmap, BSD.9 acceptance tests: A rational countermodel tests the logical gate; it is not an elliptic curve or a claim about its Sha.

### 16. The remaining dyadic equality under all odd-prime equalities

Node: `RankZeroOneBSD:BSD.9/dyadic-gate`. Kind: comparison.

For strictly positive q in Q, assume v_p(q)=0 for every odd prime p. Then q=1 if and only if v_2(q)=0.

**Hypotheses.** q is strictly positive. All odd-prime valuations of q vanish.

**Construction or proof.** Use Nat.forall_prime_iff_two_and_odd to combine the supplied odd-prime results with a dyadic equality, or extract that equality from all-prime vanishing. Apply positive-rational-reconstruction in both directions.

**Prerequisites.** `RankZeroOneBSD:BSD.8/positive-rational-reconstruction`, `mathlib:Nat.forall_prime_iff_two_and_odd`.

**Acceptance.** For q=2 and q=1/4 the dyadic hypothesis fails although every odd-prime test succeeds. For q=1 both sides hold.

**Sources.** mathlib-prime-basic, forall_prime_iff_two_and_odd: Instantiate the existing prime split with vanishing of the rational valuation.

## Actual-curve acceptance contract

The rational countermodels do not replace the required elliptic examples. BSD.9 requires actual rank-zero and rank-one curves, a CM example, a nonsemistable example, and an example with a rational prime-degree isogeny. The proof for each example must establish the source branch's local and residual side conditions before invoking that branch. The analytic rank is certified using the actual central value or derivative, through a proved modular-symbol or Mellin-integral identity with rigorous tail and approximation bounds. A numerical nonzero decimal is insufficient. Independently establish the Mordell–Weil lattice, the needed index or descent calculation, and the Sha facts used by the certificate.

At rank zero the determinant of the empty Gram matrix is one; reuse the existing regulator theorem rather than redefine the regulator. At rank one, a point of index m has height m squared times the basis height. The latter comparison belongs to BSD.5's finite-index construction and is not deduced from mere basis-change invariance. Include rational torsion and its square in the denominator. Check every height and full-period rescaling, especially its effect at two. Retain actual rank equality and finite whole Sha as separate exports when an exceptional-prime certificate is missing.

No generator here predicts #Sha from the desired leading-term formula. A certified descent producer must prove the relevant finite cardinality and index statements independently. Isogeny transport uses the existing arithmetic invariance theorem plus BSD.5's rational-defect comparison, not equality of unnormalized period terms. The all-prime constructor is available for an independently proved family theorem, but is not an assumption that all sufficiently large primes cover the family.

## Sources, baseline and remaining coverage

The packet source register gives pinned URLs and exact declaration locators. Its baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The mathematical source for the rational core is the existing natural factorization and valuation API; the BSD.8 source roadmap is its consumer contract. These are elementary adapters, not an alternative proof of an Eisenstein main conjecture.

BSD.8's mathematical dependency on BSD.5 is precise: construct the actual d_E, its strict positivity, its equality after real coercion with the normalized quotient, and positivity of that quotient's denominator. The packet request identifies the consuming elliptic endpoint. The suggested file omits this endpoint's concrete signature until those actual carriers exist; it does not use a proposition-valued placeholder. All expressible rational declarations, API items and definition tests have suggested signatures.

BSD.7 and BSD.7a require the complete CGS and Keller–Yin proof decompositions. BSD.8 requires certified exceptional-prime producers and the concrete BSD.5 interface. BSD.9 requires the actual curve fixtures, analytic enclosures and normalization comparisons above. None of these obligations is certified by passing a JSON validator or by the rational examples. The handoff records exactly which source passages and library declarations were inspected and which checks were run.

Three atlas planets identify the mathematical core: Prime support, All-prime reconstruction, and Finite-support certificate. Missing-prime caveats and regression checks are not planets.
