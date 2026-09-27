# BP-PadicMeasuresIwasawaAlgebras — residue averaging continuation

Codex / codex-7e92bd. Refs #555. Same-job follow-up to merged PR #3208,
head eebc7e6d2ae35515818636deccaeeeb33cb139a4,
merge a4053741d1f555186018da2695abe3880a1571a9.
Claim comment 5853946450 won in bot reply 5853947554; that reply was fetched
fresh and the whole issue reread after confirmation. No additional claim is
posted. Publication uses the WORKERS provision for a follow-up to this session's
merged work, while independent review #146 remains unclaimed.

## Supplied work

209 nodes: 28 constructions, 134 lemmas, 2 definitions, 26 theorems, 19 comparisons. There are 163 API entries, 140 packet tests,
151 typed examples, 13 planets and 205 baseline references. Fourteen
source findings, eight gaps, zero requests and zero closed stages remain.
Every implementation status is unchecked. All 191 preceding nodes, 185 baseline
objects, fourteen source findings and planets are preserved. Eighteen new nodes
contain seventeen new named declarations and one promotion of the existing
psiMeasure_dirac signature; the weighted operator adds its complete eight-item
API. Nine new typed examples accompany the continuation.

- Local constancy of native reduction and continuity of coefficient reduction.
- The actual integral psi on natural translated powers, using native Dirac measures.
- A weighted finite combination of the existing Cartier restrictions, its coefficient
  and monomial rules, continuity, semilinearity and expansion left inverse.
- Agreement with actual integral averaging after reduction, first on polynomials
  and then on all series by the existing continuity result and native density.
- The polynomial pole-basis identity, its general pole-cancelled form, and the
  order argument ruling out a nonzero fixed error term in RJW Lemma12.13.

## Ownership and source evidence

ClassicalArithmeticCompletion:CA.2/cartier-operators supplies the general extractor.
Its entire node/API/tests and suggested interface were read. Only q=p>0 and
0≤r<p are consumed; the overbroad zero-modulus/out-of-range wording is not used.
Rowland–Stipulanti–Yassawi Proposition4 freshly verifies that specialization.
Native PowerSeries.expand supplies exponent substitution and its finite-field
power relation. No generic Cartier object, new measure carrier, convolution
algebra or completed group algebra is introduced.

Fresh full source reads: RJW published printed127–129/PDF28–30 and
printed181–184/PDF82–85; the latter includes Lemmas12.10–12.15 and the surrounding
image proof. Existing ColemanPowerSeries/E8 already records the rational-pole
domain gap cited by Lemma12.13. The new ordinary-series statements address that
application without adding a duplicate finding. The Lemma12.14 decomposition
and Euler product, and the full Coleman image theorem, remain Coleman-owned.
The PMIA graph has no edge back to Coleman.

- RJW published: https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf
  SHA-256 78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6.
- Cartier source: https://arxiv.org/pdf/2308.10977v2
  SHA-256 0a800dcfc3f77953f97d14a8c250fd16a5f293e3f250ce5900199a93502ddefb.
  Full PDF5–6 read; PDF3–4 checked for section context. Accessed27September2026.

Reviewed AUDIT-26, accepted RS-16 and RS-14, the catalogue ownership and consumer
screen, two upstream models and all binding protocols are retained after exact
input byte checks. WORKERS/PROTOCOL and the entire confirmed issue were reread.
All twelve nodes added by PR3208 were read before preserving their whole objects.
This is a local source decomposition, not a full-paper coverage assertion.

## Validation

The complete suggested file compiles with zero errors and 442 proof-placeholder
warnings only, against 2,793 byte-checked Mathlib sources. There are no actual
Tau Ceti or planned-supplier imports. A separate scratch file has one native
weighted linear-map construction and fourteen lemmas, with zero errors, warnings
or placeholders, against 2,072 byte-checked Mathlib modules. Nine lemmas are
unconditional; four adapters assume the supplier's valid Cartier coefficient and
semilinearity interface, and the density adapter assumes the already planned
operator continuity and polynomial agreement. These validate the reductions,
not implementation of the suppliers. The independent arithmetic checks pass
2,444 exact assertions for primes2,3,5,7; they make no infinite-series proof claim.

Indexed blueprint: zero errors and warnings. Four-file intake: zero problems.
Errata wrapper, reader/signature/test parity, whole-predecessor preservation,
acyclicity and exact scope checks pass. The graph has 210
reachable nodes (209 local and the existing Cartier supplier),
881 dependency edges and 208 baseline leaves,
with no unresolved stage leaf. At publication base 150c46ddbc3ddb56f45564c0f2aa1b5609258142, all
48 captured inputs and four predecessor outputs were unchanged.
PR3208 was merged, issue555 available, the last winning claim remained this
same session, and independent review146 was unclaimed.

## Resume

- PadicMeasuresIwasawaAlgebras:L0 (partial): Clopen restriction/extension, support, complementary decomposition and restriction-pushforward naturality are supplied, with weak continuity and closed embeddings and field-valued strong/norm comparisons, on the native scalar-valued continuous dual for compact X and normed commutative R. Complete the general profinite measure decomposition: clopen density and dense extension from the pinned baseline, finitely additive clopen data with the necessary boundedness, and the general profinite integral-lattice/field-valued comparisons (the Z_p-domain, Q_p-coefficient case now has exact L2 nodes). The actual unit-domain extension now has exact L2 nodes: its inclusion/restriction squares, integral-test uniqueness, rational norm, closed unit-ball image, common denominator and restriction contraction are supplied. General profinite domains and finite-extension coefficient lattices remain separate targets. No identification of weak and norm topologies is asserted. Read and decompose finite free integral lattices, scaling and scalar extension with the required value-group hypotheses, orthonormal bases and completed coefficient tensors. Native weak and field-valued strong topologies, clopen comparisons and Dirac weak/norm separation are supplied. The infinite-domain ultrametric unit ball is not norm compact; native Banach–Alaoglu supplies weak compactness over proper fields. The Z_p-domain, Q_p-coefficient extension has its integral weak topology identified with the weakly compact unit ball in L2. General profinite coefficient extension, finite-extension lattices, and qualified completeness statements remain.
- PadicMeasuresIwasawaAlgebras:L0a (not_read): Read and decompose the continuous character functor and its parameter spaces using the existing partial ℤ_p-character library. Keep family distribution actions at LocallyAnalyticDistributions:L4 under accepted RS-16; do not add a reverse prerequisite.
- PadicMeasuresIwasawaAlgebras:L1 (not_read): Read and decompose joint adic/finite-group completed group algebras, bounded-measure comparison and convolution. Import the ℤ_p completed group algebra from ProfiniteProPGroups:Layer9 rather than rebuilding it. Resolve the RS-16 topology gate: finite-quotient kernels ((1+T)^(p^n)−1), with p-power coefficient reduction, are not the pure T-adic kernels.
- PadicMeasuresIwasawaAlgebras:L2 (partial): The native bounded inverse, field-valued bounded Amice coefficient map, exact operator norm, linear isometry and bounded-series range are supplied. The actual Z_p-to-Q_p integral extension is injective with image the closed dual unit ball, and every Q_p measure admits a common p-power denominator. Receiving finite-extension integer-ring instances, general coefficient-lattice/tower comparisons, convolution and multivariable theory remain. No equivalence with all K[[T]] or with a completed convolution algebra is asserted. The integral weak topology and rational unit-ball weak subspace topology now agree through the actual closed embedding; prime-power Dirac measures provide an explicit weak/strong separation. This does not settle finite-extension or completed-algebra topology comparisons. The actual unit-domain extension now has exact L2 nodes: its inclusion/restriction squares, integral-test uniqueness, rational norm, closed unit-ball image, common denominator and restriction contraction are supplied. General profinite domains and finite-extension coefficient lattices remain separate targets. No identification of weak and norm topologies is asserted. The integral inverse weight and inverse Mahler derivative on kerψ, together with inverse-factor covariance under the existing unit-dilation pushforward, are supplied. Generic clopen restriction, the comparison with native unit-group measures, and the linear identifications with the ambient and integral-series ψ kernels are supplied by the L0 clopen and L2 intrinsic-unit nodes. Decompose multiplication by z^x with genuine convergence hypotheses. Prove the unit-dilation/formal-binomial-substitution comparison and import the P7 cyclotomic action after identifying its coefficients and topology; the raw pushforward identity alone does not identify an arithmetic Galois action. The native integral Amice and unit-kernel equivalences now have weak/coefficientwise homeomorphism comparisons; broader coefficient and finite-extension lattice comparisons remain separate; the Z_p-domain field norm and rational unit-ball comparison now have exact nodes. The integral ℤ_p prime-root averaging identity, unique integral descent, finite partial fractions, and rational-series comparison over C_p or an embedded cyclotomic field are supplied. Use the supplied bounded inverse and Z_p coefficient extension, but establish the remaining coefficient-lattice and coefficient-general operator comparisons before claiming the full §3.5.3–5 formulas; decompose arbitrary residue classes modulo p^n and multiplication by z^x with their convergence hypotheses. ColemanPowerSeries:L1 owns the finite-free normalized-trace comparison; locally analytic and period-ring recipients own their comparisons. Keep all these edges directed from the bounded supplier to its consumers. The native integral Amice and unit-kernel equivalences now have weak/coefficientwise homeomorphism comparisons; broader coefficient and finite-extension lattice comparisons remain separate; the Z_p-domain field norm and rational unit-ball comparison now have exact nodes. Reduction of the actual integral psi is now identified with the explicit continuous weighted Cartier operator on native F_p power series. Its semilinearity and pole-cancelled fixed-error vanishing are supplied. This does not close the coefficient-general comparisons or the Coleman-owned characteristic-p logarithmic-derivative/Euler-product image argument. Import completed-algebra/procyclic coordinates from L1 and ProfiniteProPGroups Layer9 and compare them with the pinned Amice equivalence. Preserve the joint adic/finite-quotient topology gate; finite-group kernels are ((1+T)^(p^n)−1), with coefficient reduction, not pure T-adic kernels. The native integral Amice and unit-kernel equivalences now have weak/coefficientwise homeomorphism comparisons; broader coefficient and finite-extension lattice comparisons remain separate; the Z_p-domain field norm and rational unit-ball comparison now have exact nodes.
- PadicMeasuresIwasawaAlgebras:L3 (partial): Identify this generic algebraic δ with the Dirac homomorphism into the actual completed group algebra supplied by L1/ProfiniteProPGroups:Layer9, and identify the scalar map f with continuous-character integration. The present declarations take those data explicitly. Compare the R-span of all Dirac differences with the completed augmentation kernel, with the required closure and topology stated; do not silently identify algebraic span with a closed ideal. Decompose Lemma 3.36(i) positive-moment uniqueness via Mahler/ψ, (ii) moment nonvanishing implies regularity, and (iii) pseudomeasure uniqueness. Choose an infinite-order integer a (e.g. p+1) in the proof, as explained in E3. Decompose the procyclic augmentation-kernel/principal-generator argument and prove the chosen denominator regular before forming the Lemma 3.38 fraction. Keep the dyadic ℤ₂ˣ ≅ C₂ × ℤ₂ case separate; ℤ₂[C₂] is not an integral product of character components. Construct admissible character specializations, including their varying-character loci and any topology actually required by downstream L-functions. The generic algebraic evaluation map alone does not supply analytic families.
- PadicMeasuresIwasawaAlgebras:L4 (not_read): Read/decompose one- and multivariable Iwasawa module structure, characteristic ideals/divisors, regular-local dimension hypotheses and coefficient specialization. Reuse existing Weierstrass preparation, Noetherian/UFD facts and the Fitting owner tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs.
- PadicMeasuresIwasawaAlgebras:L5 (not_read): Read/decompose determinant functors and compact inverse-limit exactness with their hypotheses. Import generic perfect-complex theory from SchemeKTheoryOperations:S.1 and complete-local input from DeformationAndDerivedPatchingAlgebra:P7; plan only the remaining Iwasawa-specific structures. For the compact inverse-limit step, reject the finite-generation-to-Mittag–Leffler implication in RJW Proposition13.13 (E6): prove the compact Hausdorff exactness argument or the actual tower hypothesis. Reading that local passage does not decompose this layer.
- PadicMeasuresIwasawaAlgebras:L6 (not_read): Read/decompose Gorenstein order duality, exterior biduals and their integral comparison and base-change maps; retain this ownership under RS-16. Import Fitting facts; Euler/Kolyvagin system contractions remain at their separate ES6–8 owners.
