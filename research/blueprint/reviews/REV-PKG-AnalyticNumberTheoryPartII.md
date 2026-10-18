# Independent package review: AnalyticNumberTheoryPartII

Issue #10373, job `REV-PKG-AnalyticNumberTheoryPartII`. Codex, session `codex-mOT3lu`, 2026-10-18. This session did not author the package or its previous repairs.

## Verdict

**Accepted with the fixes in this review.** The package specifies the Layers 4–6 split of AnalyticNumberTheory. The maintainer's 2026-10-18 identity decision is authoritative: the effective-class-number project becomes EffectiveClassNumbers. Its pending packet/queue migration is not a mathematical gap in this package and is outside this issue. The old ECN packet is not the accepted plan for these layers.

I read WORKERS, PROTOCOL, PACKAGE_REVIEW, UPSTREAM_GUIDE and the expansion protocol, applying the user's stricter own-words source rule. Shape comparisons used ArithmeticDirichletSeries and GlobalNumberFields in the atlas snapshot, and the current OrthogonalGeometry README/Suggested.lean and Completed/EffectiveBounds/Suggested.lean. I read all 97 primary and 195 subsidiary mathematical topics, their APIs, Checks and conventions. All 292 numbered topics remain; statements of general supplier results have been replaced by the specific comparisons described below. No packet, Part I, atlas data or other job's deliverable changes.

## Corrections made

1. **Projection convergence (§6.9e).** Removed the independent general decreasing-projection theorem. Mathlib's `Submodule.starProjection_tendsto_closure_iSup`, orthogonal-complement projection identity and double-orthogonal closure theorem supply it. The target now identifies the BC invariant subspaces, proves the multiplication pullbacks are bounded and matches the finite-prime averages. The correct reference is §6.9a. Added the empty prime set, constants, a function fixed by multiplication by 2 but not 3, and a norm calculation showing pullbacks need not be isometries.
2. **Current Hecke supplier (§§6.1, 6.24a–f; boundary).** Read the latest VonNeumannAlgebras PR #889 rather than relying on its former pin. Its V10.Hecke already owns convolution boundedness, the Schur estimate, adjoints and faithfulness. V10.AffineHecke also owns the affine pair and its complex/Haar model. The package now consumes these, spells out the affine-to-matrix map and the coset-inversion unitary, and keeps the rational-coefficient and matrix-coordinate comparisons. Replaced the general Schur theorem and general finite-sum representation construction by the BC exact dilation norm and unnormalized rational-basis coefficient bound. The generic theorems no longer have independent local formulations. Existing subsection identifiers continue to identify their BC comparison obligations.
3. **Distinct arithmetic scope.** Explicitly distinguished the supplier's β=1 Haar ergodicity/type-III result from the local 0<β≤1 and type-III₁ results. Restricted §6.42d to the actual countably infinite geometric valuation-coordinate application; the supplier's finite-matrix ITPFI block criterion alone does not supply it. In §6.42c, gave the finite-batch construction that simultaneously shrinks ratio tolerance and retains divergent reciprocal mass.
4. **Discriminating archimedean tests (§5.19).** The old three vanishing tests all admitted the zero matrix. Added the real matrices at s=1/2 and 3/2, the complex coefficient 3/4, and two global-product coefficients 9/4 and 9/8. These distinguish the transpose, the factor three, sign, real/complex factors and product/sum conventions. Two corresponding Lean examples are proved without `sorry`.
5. **Locators and navigation.** Added explicit inherited-source locators to §6.12i and §6.24e, added the missing §6.23 anchor, and repaired the repeated §6.41 reference. Updated both VonNeumannAlgebras links to the supplier head actually inspected.

## Source verification

No package locator was flagged unverified. The following 15 numbered topics were sampled before editing, using random seed `codex-mOT3lu`; the selection includes subsidiary topics. I opened the primary sources and checked the named statements and printed/author page numbers. The scanned Wright, Datskovsky–Wright and Bost–Connes pages were also rendered and visually read. The report records mathematical comparisons in my own words, with no copied source passages.

| Sample | Source and locator read | Comparison and disposition |
| --- | --- | --- |
| §5.27d | [Lemke Oliver–Wang–Wood](https://arxiv.org/pdf/2110.07712), §3.2, Proposition 3.7(4), p.13 | Dual series has only the two possible simple poles; local pole clearance at 1 is justified. |
| §6.12i | [Jorgenson–Smajlović–Šabanac](https://arxiv.org/pdf/2512.16681v2), §4 (4.1)–(4.6), pp.13–15 | Mellin subtraction matches; deleting the simple zero mode adds −1/s. Added the explicit locator and identified this specialization. |
| §5.21s | [Datskovsky–Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 6.2(i), pp.71–72; LOWW Proposition 3.7(2), p.12 | Ordinary arithmetic series has possible simple poles at 1 and 5/6. |
| §5.21h | [Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Proposition 6.3, p.528 | Zero-orbit term retains ψ(2), Φ(0), principal-character restriction and w−2. |
| §4.7 | [Lagarias–Li I](https://arxiv.org/pdf/1005.4712v2), §1 (1.3), p.2; Mathlib `hasSum_hurwitzZeta_of_one_lt_re` | Restriction to real 0<a≤1 matches the circle-valued library function on Re s>1. General complex c does not descend to the circle. |
| §6.42i | [Neshveyev 2000](https://arxiv.org/pdf/math/0002141v1), Corollary proof p.3; [Neshveyev 2009](https://arxiv.org/pdf/0907.1456v1), §1 p.2 | Arithmetic factor/corner application is supported; normal GNS compression and general type classification remain separate imported interfaces. |
| §6.37f | [Connes–Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Theorem 3.30 proof (3.113)–(3.115), p.468 | Cotangent roots have denominator 2i and include the even-level zero root; 1/2 is excluded. |
| §5.13a | Datskovsky–Wright, Theorem 3.1 proof, pp.43–44 | Four valuation-region contributions sum to (1+u)²/(1−u); this is the auxiliary integral, not the full orbital factor. |
| §6.42c | Neshveyev 2009, Lemma 2.3 and proof p.4, Theorem 2.1 proof p.5 | Pairing intervals gives reciprocal divergence; the congruence restriction uses the imported fixed-progression PNT. Expanded the local diagonal batching step. |
| §6.12h | Jorgenson–Smajlović–Šabanac, §4 pp.13–15 | The large-time continuation method matches. The stated constant is an elementary local consequence of the positive gap and Weyl summability, as its proof explains. |
| §5.13c | Datskovsky–Wright, Theorem 3.1 proof, p.44 | Ramified quadratic auxiliary factor is (1+u)/(1−u); uniformizer norm valuations retain the dyadic case. Locator is inherited from §5.13. |
| §6.21 | [Bost–Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), Proposition 18 p.431, formula (7) p.433; Connes–Marcolli Proposition 3.23 p.457 | Rational and isometric normalizations are distinguished. The existing corrected γ/m coordinate is retained. |
| §5.21q | Wright, Theorem 6.1 pp.532–533 | Adelic poles 0,1/3,5/3,2, equation u↔2−u and the two residues agree. Passing to s=u/2 divides residues by 2. |
| §5.21b | Wright, Theorem 4.1 p.516 and Proposition 4.1 p.518 | Absolute convergence and orbital unfolding require Re u>2, equivalently Re s>1; finite stabilizer weights remain. |
| §6.24e | Bost–Connes, §1 Proposition 3 p.414 | The published left-coset representation is transported by inversion; evaluating at δ_H recovers f(g⁻¹) for this package's kernel. Added the precise locator. |

The source proof boundaries are stated rather than hidden: the arbitrary-test local functional equation is Datskovsky–Wright Theorem 3.2, p.47; the order-one estimate is Theorem 6.2(ii), p.71, with Wright's thesis Theorem 3.1 as proof source. I did not independently read the thesis or re-prove Igusa's theorem. They remain named formalization targets, not alleged Mathlib exports. Additional checks of Wood's §2, Theorem 2.1 and formula (1), pp.1073–1074, confirm the dual projective module and integral multiplication signs. The public papers used here require no copy of a restricted book.

## Library, tier and dependency audit

The supplied read-only roadmaps are at `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti is at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I searched their mathematical objects and declarations, including all nine newer roadmap directions and Completed roadmaps. Relevant candidate statements were then read locally. I additionally read OperatorAlgebraDynamics D1/D2/D7 on remote main (head `a08dc283184a9ec4d6c7fab2fb2b41866801994a`), PseudodifferentialOperators P7/P7a at `063cf517a1dcc4d929e0602c6e6f585953aceab8`, and VonNeumannAlgebras at `35847ab4e112983b041cea50b15848e736f3264e`. These supplier plans are not implementation claims.

| Mathematical objects searched | Supplier and retained local work |
| --- | --- |
| Increasing/decreasing Hilbert projections | Mathlib `Analysis.InnerProductSpace.Projection.{Basic,Submodule}` supplies convergence and complement identities. Only finite-prime BC identification remains. |
| Profinite ring, p-adic components and units | Tau Ceti `Topology.Algebra.Group.Profinite.ZHat.{ZMod,Decomposition,Units}` supplies the ring, decomposition, units and compatible lifts. Local targets concern scaling measures and torsion actions. |
| Polynomial substitution and homogeneous forms | Tau Ceti `RingTheory.MvPolynomial.LinearSubst` supplies substitution and its opposite-monoid representation. The local action transposes for row variables and adds det⁻¹; its discriminant scales by det². |
| Covers and normal subgroup quotients | Tau Ceti `AlgebraicTopology.UniversalCover` supplies the based cover, inverse-loop action, subgroup quotient and deck group. Lerch analytic continuation/monodromy/descent is additional. |
| Positive functionals, measures and translation GNS | `LinearMap.exists_isFiniteMeasure_integral_characterSpace_eq` and `TauCeti.IsPositiveDefiniteSub.gnsSpace`, `gnsVector`, `gnsRepresentation` already exist. BC noncommutative generator bounds, uniqueness and weak topology remain local. |
| Compact operators, scalar realization and differential sign | Mathlib compact spectral theorem and P7/P7a supply realization/eigenbasis. DG Layer 12 uses div grad; the local positive hyperbolic operator is its negative. Heat kernel, Gaussian trace, heat coefficients and normalized determinants remain local. |
| General Hecke convolution and affine Haar example | V10.Hecke/AffineHecke/AffineType supply the general bounds and complex β=1 model. Imported by the fixes above; matrix/rational comparisons and the general-temperature family remain. |
| Crossed products, expectation, KMS and ground limits | OperatorAlgebraDynamics D1/D2/D7, AmenableGroups Layers 5–6 and VonNeumannAlgebras V0/V4/V8/V11 supply the generic constructions. The BC universal norm, dilation corner, expectation states, ratio witnesses and compression comparisons are local. |
| Lerch/Barnes, cubic zeta and double series, Selberg determinants, arithmetic BC values | No matching completed targets were found. Circle Hurwitz, generic trace/operator theory, different/trace-dual theory and polynomial substitution are suppliers, not new targets. Eichler–Selberg modular-form traces differ from this compact scalar determinant branch. |

The library-coverage audit's AN.7–AN.9 entries agree with these ownership boundaries. Per CaraianiNewton's order, AA is tier 2, ALS tier 11, AL tier 12, AS tier 13 and the AN/ArithmeticStatistics bundle tier 14. Part I and earlier suppliers close the analytic prerequisites; ArithmeticStatistics and later Langlands applications are consumers, not hypotheses. There are no `UPSTREAM:` or FoundationsAndLibraryIntegration input ids. A mechanical graph of explicit `Needs` links, expanding B1–B13, has 292 topic nodes and 792 distinct local edges, no cycle and no edge into a later layer. In-prose adapters and inherited subsidiary inputs were checked by reading, not inferred from the graph. All reference labels and local anchors resolve.

## Adversarial pass over every topic

Each row covers the named primary topic, every subsidiary identifier listed alongside it, all its API bullets and its defining conventions. These are calculations and hypothesis checks, not claims that the target theorems are proved in Lean. Existing correct safeguards were retained unless a change is stated. For each definition I checked its examples, a plausible competing definition and at least three discriminating Checks; the archimedean matrix required the new nonzero controls above. Every README-only definition is covered by the closing Lean comment's topic map.

| Topic and all subsidiaries | Instances, competing conventions and conclusion |
| --- | --- |
| §4.1 | z=0 keeps c⁻ˢ; s=0 gives the geometric series; c=0 is excluded. Dropping the n=0 term fails. |
| §4.2 | c=1,s=2 gives π²/6; at s=0 the divergent totalized sum is 0, while continuation is −1/2. The two functions are distinguished. |
| §4.3; §4.3a | G(0)=0,G(1)=1,G(4)=2,G(5)=12; Γ(0) breaks an unrestricted recurrence. The Gamma-retaining coefficient −1/720 differs from the expanded −1/240; the remainder sign at t=1/2 is negative. |
| §4.4; §4.4a–4.4c | Differentiate the n=0 term and use z=0,s=0: lowering gives cΦ and raising gives −sΦ(s+1). Compact convergence covers each fixed derivative. |
| §4.5; §4.5a–4.5f | At s=1,c=1+i the integral is (1−i)/2; at s=2,c=2 it is 1/4. Checked the cut, finite c-shifts, c=−n positive loops and the imported inverse-loop action; positive c integers have no monodromy. |
| §4.6; §4.6a | Order zero gives 1/(1−z), independent of c; order −1 and z=0 fix the rational recurrence. z=1 remains excluded. |
| §4.7 | a=1 agrees with the circle class 0; a=1/2 gives the odd progression. The strict positive real parameter prevents a false complex-circle comparison. |
| §4.8 | The first periodic coefficient at a=0 and a=1/2 requires zΦ(z,s,1), including the z prefactor. |
| §4.9; §4.9a | Use a=c=1/2 and Fourier sign −2πixy; even combinations add and the completion has the stated phase. Gamma poles are compared as germs. |
| §4.10 | At a=c=1/2 the odd difference vanishes; interchanging a with 1−a fixes the minus sign and the factor i. |
| §4.11 | At c=1, radial z→1 is dominated for Re s>1; it cannot justify the same limiting series at s=0 or at a pole. |
| §4.12; §4.12a | The subtraction at c=1 has residue 1 at s=1; order zero is 1/2−c. Overlap uniqueness supplies actual continuation, not arbitrary fields. |
| §4.13 | k=0,1,2,3 and the first Euler-factor correction fix convergence and Barnes constants. No general moment asymptotic follows from defining constants. |
| §4.14 | The k=1,2,3 established cases do not prove the arbitrary-k hypothesis. The conditional assertion stays conditional. |
| §4.15 | Conductor 1 recovers ζ; a nonprincipal character cancels the s=1 residue. The q⁻ˢ factor follows from the arithmetic progression. |
| §4.16 | n=0,c=1 gives −1/2; n=1 gives −B₂(c)/2. Complex c uses the chosen continuation, not a circle representative. |
| §4.17; §4.17a | Track z-loops about 0 and 1, the c-loop and second commutators at nonintegral s. Second-derived invariance does not imply abelian descent or principal-germ invariance on all sheets. |
| §5.1 | All four odd residue classes give the real-character table; input 2 vanishes. Conductors are 1,4,8,8 and the two odd characters retain their parity. |
| §5.2 | (s,w)=(2,3) and applying the swap twice fix the variable exchange; index 1 retains the leading coefficient and ζ₂ factor. |
| §5.3; §5.3a–5.3e | The reflection squares to the identity; degree-one Euler data, ramified characters and p=2,3 test its scope. The arbitrary-Schwartz distribution and real/complex matrices remain separate from the five standard factors. |
| §5.4 | For u³−v³, diagonal (2,1) changes −27 to −108; a unipotent preserves −27. Zero form and reductions in characteristics 2,3 test integral det² covariance and separability separately. |
| §5.5 | Split cubic, zero form and O⊕I for nonprincipal I test the dual projective module. Multiplication signs use no division by 2 or 3; square-zero degenerate algebras remain included. |
| §5.6 | Automorphism weights 1/6,1/2,1/3,1 distinguish split, quadratic-product, cyclic and non-Galois fields; an empty fibre has weight zero. Nonfree lattice classes are retained. |
| §5.7 | Degree 1 and products of degrees 1+2 and 1+1+1 test the étale count; uniform degree ≤3 and separate order counting prevent replacing it with a cubic-field-only count. |
| §5.8 | Indicator versus weighted Schwartz tests, singular P=0 and residue characteristics 2,3 keep the additive shell exponent separate from the orbital exponent. |
| §5.9 | Over Q both real cubic signatures occur. Over nontrivial class group, the identity lattice alone is insufficient; signatures and projective components remain in the coefficients. |
| §5.10; §5.10a–5.10b | Split stabilizer 6, v dividing 3 and a nontrivial different test the orbital Jacobian and self-dual/integral measure conversion. The |3| factor survives until conversion. |
| §5.11 | Dilation changes discriminant by det²; compact tests and the dual lattice at 3 fix the adelic exponent. The continuation is constructed from this quotient integral. |
| §5.12 | At s=1 and 5/6 only simple poles are permitted. Pole germs are not evaluations of totalized functions; ordinary and dual continuations are separate data. |
| §5.13; §5.13a–5.13f | The five auxiliary factors start with 1 but differ at u and u². Summing their valuation regions gives the stated numerators; the dyadic ramified quadratic case remains. The global order index formula retains ζ_A(2s)/ζ_A(4s). |
| §5.14 | Index 1 and swapping the two odd variables fix the extra ζ₂(2s+2w−1); square parts and primitive discriminants are not conflated. |
| §5.15; §5.15a | The mod-eight matrix squares to four times the identity after transposition; inverse factor 1/4 and even-input zero are necessary. |
| §5.16 | Squarefree d₀=1 and odd d₀≡1,3 mod4 determine primitive conductor and parity; qd₀, not d₀ alone, controls the completed L-function. |
| §5.17 | At an odd prime dividing the removed square factor, retain its missing Euler polynomial. At 2 use the explicit odd Euler removal and conductor correction. |
| §5.18 | The centered generators preserve Q; Q(10,10)=1083/4 excludes the bounded orbit cover. The unbounded R6 base plus the filled ball is the retained coverage argument. |
| §5.19 | s=1/2 gives real entries 3/2 and 1/2 and complex factor 3/4; s=3/2 changes signs. Added global coefficients 9/4 and 9/8; the old zero tests alone were insufficient. |
| §5.20 | Split weight 1/6, nonprincipal lattice and trace-divisible dual selection test the arithmetic/analytic dictionary without deleting the different. |
| §5.21; §5.21a–5.21v | u=2s maps poles 2,5/3 to 1,5/6 and halves residues. Zero/triple/double singular orbits, cancellation at smoothing parameters 3,4, v dividing 3, all class components and principal/nonprincipal characters were checked. Order one is an independent quantitative theorem, not a consequence of pole clearance. |
| §5.22 | Principal conductor 1 has the simple pole; nonprincipal primitive data cancel it. Imprimitive and continued values retain their Euler corrections. |
| §5.23 | Conductor-one even and conductor-four odd twists have different Gamma shifts; reflecting twice and odd Euler-factor removal test the ratio. |
| §5.24; §5.24a | For one real place the split-to-nonsplit entry carries 3; a complex place contributes its own four-sine factor. Two places multiply. Fourier-square and discriminant normalizations retain the source constants. |
| §5.25 | The principal character is cleared by s−1; a nonprincipal character needs no pole. The filled value at 1 is a germ value, not 0 times an undefined pole. |
| §5.26 | The even principal block vanishes at the specified point while odd blocks do not. Transpose order, primitive parity and conductor factors remain distinct from the cubic Fourier matrix. |
| §5.27; §5.27a–5.27d | At s=1 the archimedean sine factors give degree n vanishing; a simple dual pole leaves at least n−1 at 0. For n=1 no zero follows. Dual arithmetic coefficient finiteness and continuation are explicit. |
| §5.28; §5.28a–5.28b | At either cubic pole the displayed bound is applied only after clearance; on compact vertical strips all constants have the stated uniformity. Gamma growth and entire order one are separate inputs. |
| §5.29 | M=N=1, a complex two-term cancelling coefficient family, common Jacobi factors and the principal character at s=1 test the sieve/moment scope. Both sieve indices are odd squarefree and the moment excludes the principal character. |
| §5.30; §5.30a–5.30ab | All 28 adapters were checked: positive even/odd parity blocks, square corrections, shifted polar hyperplanes, bounded σ,τ slices and arbitrary t,u. The conjugate reflection and repeated swaps preserve the three poles; the filled ball together with R6 closes the tube envelope. No finite bounded orbit is said to cover all rectangles. |
| §6.1 | Translation 1/2, negative diagonal and conjugating translation 1 by dilation 2 fix subgroup membership and nonnormality. Imported affine pair is transported by M; diagonal is inverse slope. |
| §6.2; §6.2a | β=1 gives Haar; the k=0 shell has mass 1−p⁻ᵝ and the geometric sum is 1. β=0 is excluded and 0 has no atom. |
| §6.3 | P₀=0, P₁=X, P₂=X²−1/4, P₃=X³−X/4, P₄=X⁴−X²/3+1/48; monicity is asserted only for k≥1. |
| §6.4; §6.4a | A finite positive singleton scales by c⁻ˢ; the heat zero mode contributes 1. An infinite constant spectrum is divergent and totalizes to zero, so positivity alone is not continuation. |
| §6.5 | Identity on one point has ratio set {1}; q=2,β=1 has mass ratio 1/2 and target pushforward density 2. Inverse witnesses have the reciprocal exponent. |
| §6.6 | Empty spectrum gives determinant 1; one and two eigenvalues give their product. Multiplicity and the minus sign in exp(−ζ′(0)) are necessary. |
| §6.7 | Translation 0 and ±1 are integral; 1/2 is not. This is the actual subgroup of the imported affine pair, not its normal closure. |
| §6.8 | Dilation 1 is the identity and conjugating a translation by dilation 2 halves its parameter. The product uses b′+ba′ and not b+ab′. |
| §6.9; §6.9a–6.9e | Constants survive the finite-prime average and a nontrivial unit character is annihilated for β≤1. Empty prime set and the indicator of 3Zhat test exhaustion. Changed convergence to a Mathlib application; a Haar indicator calculation rejects isometric pullbacks. |
| §6.10 | Normalize mass of Zhat to 1; q=2 forces a zero atom at 0 when β>0. A Dirac mass at 0 would satisfy the β=0 scaling condition, explaining the exclusion. |
| §6.11 | The first primitive term and its powers have 1/m logarithmic weights; positive systole and Re s>1 are needed. Inverse primitive classes use the same convention as the heat trace. |
| §6.12; §6.12a–6.12j | Δ(x²)=−2y² fixes the DG sign; genus 2 gives ζ⁺(0)=−4/3. Checked a₀,a₁,a₂, Gaussian primitive weights, Weyl summability, positive gap and all Mellin terms, including −1/s. Added the explicit heat-subtraction locator. |
| §6.13; §6.13a–6.13b | D(u)/u tends to det′Δ at 0; a repeated positive eigenvalue gives repeated zero at its negative. A genus-one product with λ⁻² summability, rather than a divergent ordinary product, supplies entirety. |
| §6.14 | The diagonal values of identity, dilation 2 and a product of dilations 2,3 are 1,2,6; translations have value 1. This pins multiplicative direction. |
| §6.15 | Empty and singleton positive spectra give 1 and λ; c-scaling has exponent ζ(0). Shift v>0 includes the original zero mode; the primed determinant excludes it. |
| §6.16; §6.16a | a=1,2,2/3 give the intersection subgroup mZ, with indices m,n. Imported affine commensurability is expressed in the matrix/inverse-slope convention. |
| §6.17; §6.17a–6.17h | Real s>1 fixes branches; the simple spectral zero at u=0 and genus 2 test determinant constants. The heat transform uses the safe Re(w²)>C region; continuation, not the original integral, extends outside it. Barnes normalization fixes the disputed Gamma coefficient. |
| §6.18; §6.18a–6.18b | e(1/2)²=1; x′₂x₂=2 while x₂x′₂=1+e(1/2). The inverse class exchanges numerator/denominator; translating upper-right coordinate by 1/m tests the double-coset parameter. |
| §6.19 | s and 1−s give the same shift s(s−1); the explicit meromorphic identity factors, with integer genus exponents, remove logarithm ambiguity. |
| §6.20; §6.20a–6.20c | λ=1/4 doubles the multiplicity at s=1/2; λ<1/4 has real roots, and λ>1/4 has two roots on the half-line. At 0 the zero-mode order becomes 2g−1 after the identity factor. |
| §6.21; §6.21a–6.21n | n=m=1, n=m=2, coprime 2,3 and gcd cancellation fix all 14 subsidiaries. The γ/m basis parameter, rational coefficients and factor gcd(n,m) are retained; the imported complex normal form does not silently adjoin square roots to Q. |
| §6.22 | x₂ gains 2^(it), x′₂ its inverse and eγ no factor. At −i/2 normalized μ₂ goes to rational x₂. Multiplying only by L^(it) fails on their product. |
| §6.23 | Generator isometries and unitary phases bound every positive-core GNS representation; a zero seminorm vector descends correctly. The universal norm, semigroup corner and expectation require their named comparison targets; no arbitrary completion carrier is assumed. |
| §6.24; §6.24a–6.24f | Identity, X₂ and X₂⁻¹ give row/column counts 1,2 in opposite orders and exact norm √2. Changed generic bounds to imported V10.Hecke plus BC rational-coordinate witnesses. The inverse coefficient formula and star transport are explicit. |
| §6.25 | Identity coefficient is 1, e(1/2) has value 0, and x₂x′₂ has value 1. Unequal coset degrees preclude treating this state as a trace. |
| §6.26; §6.26a | At a=0 and 1/2 the normalized first value is 0; the cubic root and finite Fourier coefficient distinguish zero normalization from a divergent cotangent prescription. |
| §6.27 | x₂ differs from μ₂ by √2 over C. Imaginary-time comparison identifies the two rational forms without claiming it preserves star. |
| §6.28; §6.28a–6.28b | On ε₁,ε₂,ε₃, the shift by 2 is isometric, its adjoint kills odd indices and Hε₁=0. The root-of-unity sum fixes the range projection. |
| §6.29 | The x₂,x′₂ relation forces the β projection mass n⁻ᵝ. Algebraic positivity extends only after the established generator/universal norm bounds; the definition does not grant boundedness by itself. |
| §6.30; §6.30a | Trivial dynamics on M₂ admits only tracial KMS states; E₁₂E₂₁ and E₂₁E₁₂ have different vector-state values. D7's dense entire core requires both boundaries and norm density. |
| §6.31 | k=0,1,2 and a=0,1/2 test the recurrence and its degenerate values; the second polynomial has constant −1/4, not zero. |
| §6.32 | β=0 gives identity with infinite trace; ε₁ is fixed and ε₂ is weighted 2⁻ᵝ. Boundedness for β≥0 does not imply trace class at β≤1. |
| §6.33; §6.33a–6.33i | The algebraic square 1−μₙμₙ* supplies the adjoint contraction. Checked generator coefficient bounds, division support nZhat, dilation by 1/2, full-corner exhaustion, amenable full/reduced equality and extension of positive core states; completed base state is KMS only at β=1. |
| §6.34; §6.34a–6.34h | The identity and μ₂μ₂* give normalization and mass 2⁻ᵝ. Off-diagonal unequal spectral ratios vanish; equal ratios reduce to the diagonal. Both construction directions and the weak topology use the actual finite core and expectation. |
| §6.35 | Units 1 and −1 and composition uv fix the action on torsion; multiplication by 2 is not a torsion automorphism and would break the dilation relation. |
| §6.36; §6.36a–6.36b | The β→∞ Gibbs limit is a ground state; under trivial M₂ dynamics a nontracial vector state is ground but not a finite-temperature KMS limit. The two predicates are kept distinct. |
| §6.37; §6.37a–6.37l | All 12 algebraic adapters were checked at levels 2,3,4 and the degenerate lattice. The reduced polynomial includes the even-level zero root, its Cayley denominator 1/2 is invertible, and dyadic projection uses the doubled level. Möbius/Newton steps retain the nonzero reduced corner and the prescribed rational form. |
| §6.38 | The ε₁ vector state sends e(0) to 1 and e(1/2) to −1 for the standard unit. Positive spectrum bounds its upper-half-plane correlations. |
| §6.39 | The first Gibbs weight is 1; trace converges exactly for β>1 and diverges at 1. Hence the partition function is ζ(β), with no hidden index shift. |
| §6.40; §6.40a–6.40c | β=1 lies in the uniqueness interval; β>1 cannot be included. Canonical ergodicity gives extremality, and continuous compact-unit averaging gives uniqueness without an assumed Choquet decomposition. |
| §6.41 | Finite free transitive action gives a matrix factor; the trivial two-point action has nontrivial center. q=2,β=1 fixes Tomita time −βt; p=0 is excluded and rational-dilate exhaustion gives fullness in the continuous core itself. |
| §6.42; §6.42a–6.42i | Disjoint pairs outside any fixed congruence data give divergent weights, with forward and inverse derivatives reciprocal. Essential freeness excludes only the null point 0. V8/V11 yield III₁ after the full ratio-set proof; the Cstar corner and normal GNS corner are distinct comparisons. Clarified the countably infinite valuation case and tolerance batching. |
| §6.43; §6.43a | The identity normalizes to 1 and off-diagonal monomials vanish; each diagonal value is bounded by the operator norm. β=1 is excluded from the absolute Gibbs series. |
| §6.44 | A positive square and identity retain positivity and norm 1 under core approximation. Bounded extension uses the fixed regular/universal norm comparison. |
| §6.45; §6.45a | For μ₂ and its adjoint, imaginary time contributes 2⁻ᵝ. Normal-form reindexing gives the second boundary; locally uniform complex-time sums and D7 give the completed condition. |
| §6.46; §6.46a | A point mass gives one Gibbs state and a half-half measure gives their average. Every barycentre sends μ₂μ₂* to 2⁻ᵝ; compatible finite residues define the unit action. |
| §6.47; §6.47a | Conductor 1, conductor 2 and conjugation exponent −1 test compatibility. Arbitrary automorphisms of C are used only on cyclotomic algebraic values, without analytic continuity. |
| §6.48; §6.48a–6.48d | The unit mass is ζ(β)⁻¹; n=1 and other disjoint nW give the scaling reconstruction. Dirac measures are the extremes. Forward continuity follows from summable Gibbs tails; compactness and Hausdorffness, rather than restriction to a nonopen set, give inverse continuity. |
| §6.49; §6.49a | The ε₁ term at e(1/2) and the remaining ζ-tail give the bound 2‖a‖(ζ(β)−1)/ζ(β). The bound is uniform for fixed norm bounds and compatible with the cyclotomic action. |
| §6.50; §6.50a | The β=1 singleton and β>1 unit-parametrized extremes give the phase transition. Pullback sends parameter u to uv, fixing the direction of the free transitive symmetry action. |

All denominators were checked with their domains: positive real scales and eigenvalues, nonzero GL₂ determinant, Re c>0 or an explicit lifted logarithm, nonzero Gamma-free germs, positive ζ(β) for β>1, and nonzero reduced corners. Number-field/local analytic targets retain characteristic zero; polynomial discriminant and cubic-algebra identities retain their integral scope, including residue characteristics 2 and 3. No new gap or unresolved mathematical repair remains from this review.

## Lean signature audit and validation

I independently compared all ten named signatures against their README statements:

| Signature | Scope retained |
| --- | --- |
| `complex_gamma_laplace` | Complex s,c, both real parts positive; principal logarithm. |
| `complexHurwitzSeries_one` | Re s>1; c=1, convergent-series comparison. |
| `expZeta_eq_lerchSeries` | Real circle parameter and Re s>1; required exponential prefactor. |
| `complexHurwitzSeries_ofReal` | Real 0<a≤1 and Re s>1. |
| `barnesG_add_one` | Every nonpositive integer Gamma pole excluded. |
| `barnesG_one` | Canonical product normalization. |
| `cubicDiscriminant_diagonal` | Arbitrary field, nonzero diagonal entries; the README's more general full action over commutative rings is separately specified. |
| `quadratic_large_sieve` | Arbitrary complex coefficients, positive M,N, ε>0, odd squarefree indices including 1. |
| `quadratic_fourth_moment` | σ in [1/2,1], ε>0, Q≥1, every finite primitive real nonprincipal family of conductor≤Q; constants uniform in Q,t and the family. |
| `spectralZetaSeries_smul` | Positive sequence and c>0; identity of totalized series, not a claim of convergence or continuation. |

The file has five light real-bodied definitions and 285 lines. Heavy objects remain in the README and closing definition map. The two added sine examples are proved; no theory development or sorry-bodied data was introduced. Fresh `lean-check` exited **0**, with exactly **17 declaration-uses-sorry warnings and no other diagnostics**, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

`scripts/check_sorry_data.py` passes. `scripts/check_blueprint.py` passes with zero errors and zero warnings for AnalyticNumberTheory, AnalyticNumberTheory--AN.0, AnalyticNumberTheory--AN.8 and the existing ECN-associated AnalyticNumberTheoryPartII packet. The latter is only a schema check; its identity migration remains the maintainer's separate follow-up. Intake `check-files`, whitespace, local-anchor/reference resolution and allowed-path checks pass. The 73 Checks blocks preserve all pre-existing Check bullets, with the added matrix and projection controls.

## Handoff

Ready for the maintainer's draft upstream PR under the identity already approved. No second job was claimed. No higher-tier notion moved, and no upstream file was edited. The only external administrative follow-up is the already-authorized EffectiveClassNumbers packet/queue migration; do not conflate that packet with the source-plan set listed above. This report and the issue handoff retain the necessary audit evidence; temporary public-source downloads and local logs are disposable.
