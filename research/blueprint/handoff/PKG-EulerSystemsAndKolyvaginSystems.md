# PKG-EulerSystemsAndKolyvaginSystems — #11030

Worker: Codex (GPT-6), session codex-EJ3wee. Date: 2026-10-19.

The three package files are complete for independent package review. This is a package of the assembled target-level plan, not a claim of formalization or certification that every supplier contract is already implemented. Only this handoff and the issue's three package deliverables change. The packet, part packets, assembled reader and earlier Suggested file are untouched.

## Delivery and conservation

The README has Summary, scope, conventions, exact supplier contracts, a reading guide, Layers 0–8 with Examples and Dependencies, downstream consumers and edition-specific references. All 151 assembled targets are accounted for: 149 numbered sections and the two generic Selmer results preserved in the opening prerequisite boundary. Original 0.2 (propagation and duality) and 0.3 (finite Euler characteristic) are supplier statements, not new targets. Original 0.4–0.11 become 0.2–0.9; all other target titles remain. No removed-target stubs remain. All 650 distinct original named API/Check entries survive (427 APIs and 223 Checks); four APIs for the generic bidual/evaluation interface were added. All 58 retained explicit definition API blocks have at least three Checks. Worked examples, hypotheses and locators remain in the README.

Suggested.lean contains nine light definitions with real bodies: expAt, ordAt, abundanceExponent, charError, eulerPoly, kolyvaginDerivative, liftedNorm, fsQuotientPoly and selectedDescent. It imports Mathlib, uses the TauCetiRoadmap namespace and ordered layer comments, and leaves arithmetic carriers in the README, named in its closing comment. Theorems over existing carriers include cyclic/lifted telescoping, the Euler-polynomial identity, choice-independent selected descent and a genuine DVR-quotient scaled inverse. Examples have complete proofs and there are at most two per definition. No heavy arithmetic carrier, sorry-backed data, admitted example or weakened abstract Iwasawa comparison is present. The three unproved boundary examples from the assembled input are now named theorem targets registered in the README. metadata.toml is math.NT.

## Current upstream and ownership

Pinned baseline statements were read for all 47 distinct cited Mathlib/Tau Ceti declarations: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Current read-only upstream was also checked: TauCetiRoadmap 0d144d044dacebca17b654695b6f1ad58f159b27 and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The nine roadmaps newer than the atlas snapshot and the Completed roadmaps were searched by mathematical topic; LocalGaloisGroups and ProfiniteArithmetic supplied shape models. No build ran in either read-only checkout.

- Generic Fitting ideals are already supplied by TauCeti/RingTheory/FittingIdeal/Basic.lean (fittingIdeal, fittingIdeal_monotone, fittingIdeal_quotient_zero and finite-free presentation) and BaseChange.lean (fittingIdeal_baseChange). They postdate the pins. The package consumes them and plans only the Selmer/system comparisons and higher Fitting bounds.
- Current TauCeti/RingTheory/Morita/Corner.lean supplies IsIdempotentElem.cornerEquivalence and moritaEquivalenceCorner for a full idempotent. It does not supply the maximal-order centralizer/heredity/division-order classification used in 4.8. The exact ClassicalArithmeticCompletion Layer 7, Part II contract is retained; do not mark that additional input supplied by the generic corner equivalence alone.
- Existing discrete cohomology, Shapiro and corestriction are consumed. Pinned H¹ is an additive group, not automatically the R-linear compact-coefficient module needed here. SelmerIwasawaCohomology supplies the coefficient adapters, finite/discrete duality and compact inverse-limit comparison. No duplicate construction of generic Shapiro is planned.
- Generic Selmer propagation/duality and finite Greenberg–Wiles are placed at the boundary, supplied by SelmerIwasawaCohomology Layer 2 and ArithmeticGaloisDuality. They are not kept as new Layer 0 targets.
- Elliptic Kummer/Tate input is mapped to current EllipticCurves Layers 2 and 7, with the Selmer compact adapter, rather than an inaccurate Heegner layer. Ring-class conductor-change groups are derived here from ClassFieldTheory's Artin/residue-unit sequence; they do not depend on constructing Heegner points.
- **Ownership moves to this package:** the previous broad PadicMeasuresIwasawaAlgebras Layer 6 citation did not provide exterior-bidual evaluation, kernel contraction, the conditional coefficient-change square or integral invariants transfer. Minimal interfaces now live in 6.1, 6.3 and 7.2; PM remains the supplier of Gorenstein/group-ring duality. Higher consumers should point at these sections rather than treating PM as already supplying them. In particular, 7.2 specifies functional lifting, the normalized injection i with i(N_H^r x)=N_Hx, and its finite-coefficient ambient square.
- **Avoiding upward imports:** generic descent precedes geometric input. The CM application takes its curve/abelian variety/CM point and norm/congruence data as hypotheses; HeegnerPointEulerSystems and GeneralizedHeegnerCycles verify those inputs as consumers. The Rubin–Stark application assumes rational elements, all-level integrality and norm compatibility explicitly; IntegralIwasawaTheory is an arithmetic supplier, not a prerequisite for the conditional implication. The late higher-weight coefficient-prime argument likewise states its finite-character μ premises rather than importing a higher-tier main conjecture.

## Mathematical corrections and limits

1. The zero-class order is ∞ for the raw order but k for a truncated divisibility index. The Cartesian negative control is now genuinely noncartesian over Z/9. Euler polynomials, arithmetic Frobenius, and geometric Artin in Nekovář's CM manuscript are transported together by inversion.
2. Selected descent compares the cyclic cochain before localization. Its formula is a² times a lift of ax, with restriction a³x; kernel and cokernel bounds are separate. The fixed ring-class conductor has one global restriction bound throughout all intermediate fields, not an unrestricted local restriction bound.
3. General characters are paired with their inverse under conjugation; only involutive characters admit the scalar shortcut. The local divided Frobenius operators are divided before reducing coefficients. The higher-weight ordinary quotient retains the self-dual cyclotomic twist.
4. Corrected abundance requires the real-Frobenius span and actual image q(N_α); finite-field Hom is F_l-linear or includes all Frobenius twists. Corrected bounded-image linear algebra gives a scaled inverse, not a column basis. Finite Gorenstein and principal-ring Fitting hypotheses remain distinct.
5. Higher-rank signs have explicit witnesses: order map uses [g^-1], contraction sends e1∧e2 to e2 for h(e1)=1, and the regulator's one-prime sign is retained. Higher derivative now has r≥1, uses the full Galois group rather than assuming a split product, and records its integral norm normalization.
6. The Iwasawa comparison is ι-semilinear and transports both ideals. Rubin's evaluation-image ideal is distinguished from the principal MR index. Ramified O uses π, with T^m+π at the coefficient prime. The finite-character unramified μ premise includes local 1/ω cases and both orientations; ordinary torsion μ=0 is derived by two Poitou–Tate sequences, not assumed.
7. **Inherited application gap:** the uniform annihilator-exponent bound does not prove the classical square-index bound with a constant independent of the imaginary quadratic field. The latter remains an explicitly separate application contract. The unavailable original Kolyvagin argument is not silently replaced by an alleged proof; the supported method is Rubin's descent and the stated rational/CM inputs.
8. **Unverified published locators:** this run could not read the page images of Rubin's published pp.42–43 or pp.179–180. Public draft II.3.7, p.29 and Appendix B.3.4, p.155 were checked for the Poitou–Tate sequence; published Theorem 9.3.3's corrected ((M):a₂)a₁ bound is inherited from the accepted assembly and its previous review. The draft has the colon ideals reversed and is not evidence for that correction. The independent reviewer should re-open the published pages before upstream approval. No claim to have viewed those pages in this run is made.

## Source reading and a locator sample

Read relevant primary statements/hypotheses and the arithmetic/algebraic interfaces in the public sources fingerprinted below. The cleared Liu–Tian–Xiao–Zhang–Zhu Inventiones text was read at printed pp.122–123, 126–131 and 133–135; Zhang at pp.234–235. They were read in the authorized copies without creating another copy or retaining passages. Curtis–Reiner was not downloaded or read: Nekovář's §§6.4–6.5 are the source for the explicit order-theory supplier contract, not evidence that a new order-theory proof has been filled in. No copyrighted passages are included here or in the package.

The deterministic 15-section locator sample (seed 11030) was checked as follows. Preprint versus published pagination is kept explicit.

| Package section | Locator checked | Outcome |
| --- | --- | --- |
| 2.9 | Chida–Hsieh author version, Definition 7.1, pp.28–29 | Norm/congruence data checked, with ring-class group assumptions. |
| 8.33 | Rubin public draft, Theorem VII.1.9, p.101 | Error factor a_τ^(5r) retained. |
| 1.12 | Mazur–Rubin 2004 author text, §3.5, pp.27–28 | Residual H.3, not arbitrary End-subquotients. |
| 4.8 | Nekovář CM manuscript, §6.4, pp.38–40 | Finite-module/Morita multiplicity and conductor requirements recorded. |
| 1.7 | Mazur–Rubin 2004, Definition 3.1.6, p.21 | Auxiliary-prime and Frobenius conditions checked. |
| 6.8 | Mazur–Rubin 2016, Theorem 12.4, arXiv v1 p.25; published p.174 | Regulator isomorphism located in both editions. |
| 2.3 | Rubin draft, Chapter II before Theorem 2.10, p.25 | Unramified Euler-class assertion located. |
| 4.4 | Liu et al., Proposition 2.4.6, pp.130–131 | Bounded localisation input checked in cleared text. |
| 5.7 | Howard, Definition 1.5.4, published p.1451, arXiv PDF p.14 | Stub definition checked. |
| 8.16 | Rubin draft II.3.7, p.29 and B.3.4, p.155 | Public proof input checked; published 2.3.7 pp.42–43 remains unviewed. |
| 2.7 | Rubin draft, Definitions IV.2.1–2.2, p.58 | Universal generator and norm relations located. |
| 7.6 | Burns–Sakamoto–Sano II, §7, eq.(14), Theorem 7.1, pp.47–50 | All-level arithmetic assumptions checked. |
| 5.5 | Howard, Proposition 1.4.1, published p.1448, arXiv PDF p.11 | Paired-module structure and parity assumptions checked. |
| 1.11 | Liu et al., Definition 2.6.5, p.134 | Actual Frobenius image and abundance definition checked. |
| 4.17 | Castella–Grossi–Lee–Skinner v2, Theorem 3.2.1, p.17 | Error terms and hypotheses checked. |

## Adversarial mathematics pass

This is a statement-level pass, not a Lean proof of the arithmetic results. Each row covers that subsection's defining operations, theorem hypotheses, API and Checks. The concrete degeneracies below are supplemented by the retained named positive/negative Checks in that subsection. Finite/compact coefficient categories and all stated global arithmetic hypotheses are held fixed unless the row deliberately tests their failure. The two moved supplier statements were also checked: strict/relaxed local conditions give opposite annihilators (with the quotient image retained), and the finite Euler characteristic for Q, μ_p at odd p has both sides equal to 1, including the archimedean term. No odd-prime theorem is asserted at p=2 merely because a formal expression can be written there.

| Section | Instances tried | Result or correction |
| --- | --- | --- |
| 0.1 | Empty prime set; two primes; trivial F_p and its dual μ_p | Conductors are 1 or four squarefree products. Support includes p and infinity; the dual is discrete, not another free lattice. |
| 0.2 | I=J; scalar 0 and 1; R/π²→R/π³ via π | Composition multiplies scalars; injectivity uses the actual annihilator condition, not merely I⊆J. |
| 0.3 | R=Z/9, local group R, condition 3R, quotient mod 3 and scalar 3 | The quotient image is 0 but the inverse image along 3 is all R/3: corrected the noncartesian negative control. |
| 0.4 | R/π^k with condition free rank d; k=0 | Length is kd, including zero. Principal artinian/cartesian hypotheses remain necessary. |
| 0.5 | T/π, T/π² and torsion inclusion; zero module | Identifications use cartesianness and residual invariant hypotheses; arbitrary H¹ does not commute with coefficient kernels. |
| 0.6 | Q_p(1) valuation direction; trivial rank-one character; image at p | Canonical propagation remembers the lattice; full local H¹ on a quotient is not substituted for its image. |
| 0.7 | Field; zero rank; larger dual than primal | Signed core rank can be negative; its nonnegative part does not determine a negative signed rank. |
| 0.8 | Moduli π and π²; zero module | Invariance follows only for the cartesian quotient system, rather than arbitrary independently selected local conditions. |
| 0.9 | Odd and even rank-one characters; p=2 | Archimedean sign and residual/duality assumptions are retained; no odd-prime eigenspace splitting is extended to p=2. |
| 1.1 | Conductor 1; two distinct auxiliary primes; class group p-part nontrivial | Ray-class quotients are relative to K(1); product decomposition is used only with its stated disjointness hypotheses. |
| 1.2 | Frobenius 1 versus Fr−1 invertible; zero representation | Finite classes use coinvariants and singular classes use twisted invariants; neither is identified with all local H¹. |
| 1.3 | Z/9 classes 0, 1, 3; n=0 | Exponent/order pairs are (0,∞),(2,0),(1,1). Raw order at zero differs from the truncated length/index convention. |
| 1.4 | Conductor 1 and one prime; unit Euler value | I_1=0; summing conductor ideals reverses the relevant inclusion. A unit local ideal gives zero coefficients. |
| 1.5 | Trivial totally ramified extension; nontrivial p-extension; zero class | Transverse is a restriction kernel. Its comparison with singular cohomology requires the auxiliary-prime hypotheses. |
| 1.6 | Free residual module; saturation with nonzero shift m′; residue extension k/F_l | Retain m−m′ and F_l-linear Hom or all Frobenius twists; k-linear vanishing alone is insufficient. |
| 1.7 | k=0; increasing k; forbidden support prime | P_{k+1}⊆P_k; infinitude uses the actual Frobenius conditions and Chebotarev, not just a congruence on norms. |
| 1.8 | P=1−X; P(1)=0; P(1) nonzero before reduction | Q=(P−P(1))/(X−1)=−1 in the rank-one example; retain the correction term until coefficients kill P(1). |
| 1.9 | Empty a,b,c; overlapping supports | Strict=0 and relaxed=full. Pairwise coprimality prevents conflicting assignments; all modified primes enter the support. |
| 1.10 | Zero module; complementary finite/transverse lines; p=2 | Exact annihilator statement uses the local pairing and relevant odd-prime/self-duality hypotheses, not an arbitrary complement. |
| 1.11 | Empty tuple; duplicate places; γ of order divisible by l | Abundance is a bounded-image property, not surjectivity; prime-to-l order and the prescribed Frobenius image are retained. |
| 1.12 | Trivial residual character; dual cyclotomic character; residual H⁰ | H.3 is the stated residual invariant condition. Removed any implication for arbitrary subquotients of End(T). |
| 1.13 | Number field rather than Q; field versus principal artinian coefficients | The extra admissibility/local hypotheses are recorded; MR04 and MR16 are separate records with an explicit implication. |
| 1.14 | u=u^-1; u close to 1; ramified O | Character error uses the nonzero differences, with an explicit zero convention. Lean keeps only the separately registered Z_p-unit version. |
| 1.15 | Real quadratic base; γ finite prime-to-l order; fixed homomorphisms outside the image | The corrected real-Frobenius spanning condition and G=q(N_α) remain; all fixed homomorphisms cannot replace this image. |
| 1.16 | One or both classes zero; independent residual classes; prescribed ramification | Nonzero/independence hypotheses supply detection. Simultaneous detection does not follow from separate infinitude statements. |
| 1.17 | Rank-one character satisfying neither residual exclusion; finite quotient | Only the displayed implications between hypothesis records are asserted; no converse is added. |
| 1.18 | Finite-order χ nontrivial, χ=1 and χ=ω | The worked positive character has the required exclusions; trivial and Teichmüller specializations are separated. |
| 1.19 | Elliptic Tate module; p=2; residual invariants | Use EllipticCurves Layers 2 and 7 plus the compact Kummer adapter; no rank-one quotient of a rank-two module is assumed automatically. |
| 1.20 | Trivial and Teichmüller characters | Residual primal or dual invariants fail the MR record even though the underlying representations exist. |
| 1.21 | Zero localisation; two nonzero residual classes; small residue field | The simultaneous nonvanishing argument keeps its residue characteristic restrictions and independent detection input. |
| 1.22 | Zero error constants versus positive constants; finite excluded set | Chebotarev supplies the stated bounded-loss localisations; zero error specializes to the exact case. |
| 1.23 | Prescribed kernel zero or full; codimension-one kernel | The quotient and saturation conditions are required to realize kernels; no arbitrary submodule is declared selectable. |
| 2.1 | Rank zero and identity rank one; invertible f versus noninvertible f | det(1−fX) has constant term 1 and gives 1−X in rank one. An inverse evaluation is stated only for an automorphism. |
| 2.2 | Zero family; tower with no new ramified prime; conductor 1 | Norm relation has an empty product 1. Admissible tower/support data are explicit, rather than imposing Euler factors at every extension. |
| 2.3 | Place dividing p; unramified place away from p; invariant line | Unramifiedness uses the norm-compatible family and local hypotheses, not unramifiedness of the representation alone. |
| 2.4 | Empty conductor; one and two primes | Conductor and field-indexed presentations agree only over the admissible compositum tower with the stated group identifications. |
| 2.5 | Trivial character; inverse character; coefficient extension | Trivial twist is identity; both representation and Euler polynomial are transported. Inversion conventions are fixed together. |
| 2.6 | No changed primes; one added Euler factor; factor zero | The comparison multiplies by the prescribed factor; it need not be invertible or an isomorphism. |
| 2.7 | Bottom generator; trivial relation; two norm relations | Universal object is a presented module with its actual relations; it is not a claim that arbitrary arithmetic Euler-system modules are free. |
| 2.8 | Depth 0; rigid versus merely norm-compatible family | Finite depth stops at the stated index; rigidity is additional. Anticyclotomic compatibility does not follow from a general family. |
| 2.9 | One inert prime; stable units ±1; exceptional quadratic discriminants | Relative degree includes the unit index. The simplification to l+1 explicitly excludes the exceptional unit cases. |
| 3.1 | n=0,1,2,3; σ^n=1 versus arbitrary σ | D_2=σ, D_3=σ+2σ². The cyclic identity uses σ^n=1; the lifted identity retains σ^n. |
| 3.2 | Discrete induced module; compact lattice; zero class | Use actual coinduction/Shapiro followed by the specified compact comparison. An arbitrary short exact sequence does not replace the arithmetic lift. |
| 3.3 | One conductor; zero family; weak versus strong compatibility | The singular/finite edge equations are part of the carrier; weak systems require the corrected limit/transition data. |
| 3.4 | Trivial group; one cyclic derivative; nontrivial norm relation | Derivative invariance is after reduction by I_n; it is not integral invariance without the Euler relation. |
| 3.5 | f=id,a=1; f=5 on Z,a=5,x=3; nonzero kernel; a=0 | Selected descent is a²b, sends 3 to 75, and restricts to a³x. Choice independence uses a·ker f=0. |
| 3.6 | Base field and all intermediate ring-class fields; fixed conductor c | One finite torsion module controls restriction across this tower. No bound for arbitrary ramified local restrictions is asserted. |
| 3.7 | χ versus χ^-1; involutive χ; divided operators before and after reduction | Keep both twists and Av=Bu. Arithmetic Frobenius satisfies Φ²−hΦ+l=0; divisions take place integrally before reduction. |
| 3.8 | Ordinary plus rank one; twisted quotient; ramified p | The higher-weight quotient retains its cyclotomic self-dual twist; it is not silently treated as unramified. |
| 3.9 | n=1; class zero; changing cyclic generator | Bottom class agrees with the original class; generator change transports the tensor factor rather than leaving every coordinate unchanged. |
| 3.10 | Bad support place; q dividing conductor; place away from pr | Unramifiedness and bounded finite condition have different domains; the bounded factor is retained at exceptional local places. |
| 3.11 | n=0 and n=1; σ arbitrary versus σ^n=1 | Lifted norm is indexed by i+1. Specialization to the cyclic relation kills exactly the boundary term σ^n−1. |
| 3.12 | Unramified finite quotient; compact inverse limit; H² of finite torsion | cd_p(Zhat)=1 is used on discrete quotients; compact exactness is a separate supplier, not inferred for all profinite modules. |
| 3.13 | Finite component zero; singular component nonzero | Separate finite and singular statements use the derivative norm relation; local H¹ is not identified with either component alone. |
| 3.14 | Multiplicative group and one tame prime; arithmetic versus geometric Artin | The congruence is transported with the inverse Frobenius convention, keeping the generator/tensor coordinate. |
| 3.15 | One prime; weak family with nonzero finite correction | Weak compatibility includes finite-part control. It does not already imply the corrected strong relation. |
| 3.16 | χ=1; χ²=1; general χ | Complex conjugation swaps χ and χ^-1; scalar τ-eigenvalue reasoning is reserved for the involutive case. |
| 3.17 | n=1; n with one and two prime factors; zero family | The correction is identity at 1 and kills unwanted finite parts; all subset terms are retained at two primes. |
| 3.18 | Cyclotomic unit norm at one tame prime; p-primary reduction | The multiplicative example tests the congruence including Frobenius inversion, not only equality of valuations. |
| 3.19 | Rigidity absent; finite-depth truncation | Alternative hypotheses are separate assumptions; the modified relation is not extrapolated outside the allowed conductors. |
| 3.20 | Two primes with off-diagonal local terms | Empty correction is 1, singleton correction 0, and the two-prime determinant contributes minus the cross product. |
| 4.1 | Empty prime set; isolated vertex; one edge | The graph retains conductor 1; a section satisfies both endpoint maps, rather than being an arbitrary product of stalks. |
| 4.2 | Edge whose localisation is zero versus onto | Length changes reflect the actual finite/singular images. No fixed +1 change holds for every edge. |
| 4.3 | Zero Euler class; scalar π^a; nonzero bottom class | Zero has infinite divisibility; annihilator exponents and lengths are distinguished. The error term is not an unqualified universal constant. |
| 4.4 | Matrix πI; positive loss; c=0; c=n boundary | The corrected result is a two-sided π^c-scaled inverse with c<n. Column operations alone cannot turn πI into a unit basis. |
| 4.5 | Residual reducibility; symmetric paired torsion; zero torsion | Self-duality gives paired factors only under the stated alternating/duality hypotheses, not from arbitrary module self-isomorphism. |
| 4.6 | Cyclic modules with unequal lengths; annihilated submodule; zero module | The induction keeps the elementary-divisor and annihilator losses; exponent and total length cannot be interchanged. |
| 4.7 | Nonzero versus torsion bottom class; arbitrary χ; base before localisation | Rational descent uses the global uniform restriction bound before localising and pairs inverse twists. |
| 4.8 | Matrix order; finite module; zero module; non-full idempotent | Morita preserves the required length/multiplicity only with the full-idempotent and maximal-order inputs. Merely nonzero conductor is insufficient: it is a central nonzerodivisor. |
| 4.9 | Bottom class of finite index; zero localisation; excluded primes | Selected primes attain the stated bound only under Hyp(K,T), with explicit loss; no detection conclusion for zero class. |
| 4.10 | One vertex; loop with nontrivial monodromy; primitive versus zero section | Hub evaluation needs trivial monodromy. Local cyclicity alone does not ensure a global primitive generator. |
| 4.11 | Dual Selmer zero; nonzero residual dual; core rank 0 | Core/leading vertices use their actual residual conditions; core freeness is conditional, not all stalks free. |
| 4.12 | CM point torsion/non-torsion; bad-prime error; varying K | Geometric input is an explicit hypothesis. Uniform annihilator control is not promoted to a K-independent square-index formula. |
| 4.13 | Nonzero versus zero Kolyvagin class; exponent 0 | Rank-one/exponent conclusion requires the nonzero class. Finite quotient length is not substituted for its annihilator exponent. |
| 4.14 | Prescribed submodule zero/full; one new prime | Leading vertex must satisfy the selected localisation kernel conditions; arbitrary submodules require the stated admissibility. |
| 4.15 | Core rank 0 and 1; λ(n)=0 and λ(n)>0 | Stub is the specified power of the maximal ideal times the Selmer stalk; the zero-stalk and free-stalk branches remain distinct. |
| 4.16 | a_1=a_2=unit; truncated DVR with valuations a,b,m | Keep the accepted published bound ((M):a_2)a_1, giving m−b+a. The draft's reversed colon expression is not reused. |
| 4.17 | p=3; error constants zero/positive; zero leading class | CGLS hypotheses and coefficient normalization are retained; the classical bound appears at zero error, not at arbitrary residual reducibility. |
| 4.18 | Characters sufficiently close to 1; character exactly 1 | The twist-independent constants have the displayed neighborhood/representation assumptions; singular character-error expressions use their zero convention. |
| 4.19 | Primitive system; π times primitive; zero system | Inequality becomes equality under primitivity only; scaling changes the index and cannot preserve equality automatically. |
| 4.20 | Depth 0; finite-depth system; anticyclotomic inverse twists | Bounds carry their finite-depth and variant hypotheses. General-character self-duality is not reduced to a scalar involution. |
| 5.1 | Finite modulus k; zero class; element π^d | Finite index is min(d,k), including k for zero; stabilized index is not every finite-level value. |
| 5.2 | Rank-two elliptic module at inert prime; p=2 | Howard's inert local rank-two self-dual datum is separate from MR's rank-one Frobenius quotient record. |
| 5.3 | Core rank 0,1,2 | The rank-one freeness theorem applies at core rank 1 under the MR hypotheses; other ranks use different constructions. |
| 5.4 | Zero system; core vertex; non-primitive system | The constructed dual group comparison uses the compatibility and core hypotheses; it is not a definition equating an arbitrary family with a Selmer group. |
| 5.5 | ε=0 or 1; M=0; p=2 | Paired factors R^ε⊕M⊕M retain alternating/odd-prime assumptions and the parity convention. |
| 5.6 | No torsion; one paired elementary divisor; zero leading class | Successive divisibility data recover the dual structure under the stated nonzero/primitive assumptions, not from the bottom index alone. |
| 5.7 | λ=0; λ beyond coefficient length; core vertex | Stub equals the actual maximal-ideal multiple and can vanish at finite level; it is not always a free rank-one summand. |
| 5.8 | Equal versus opposite involution signs; zero eigenclass; p=2 | The eigenclass detection uses p odd and actual nonzero classes; plus/minus projectors require 2 invertible. |
| 5.9 | κ primitive; πκ; κ_1=0 but κ nonzero | Scaling changes divisibility. A vanishing bottom class is distinguished from the zero entire system. |
| 5.10 | Primitive and non-primitive systems; zero torsion | Howard's bound retains the index term; only primitivity gives the sharp length formula. |
| 5.11 | Two core vertices; zero section; finite coefficient length | Rigidity compares compatible core values; local cyclicity without the transition relations is insufficient. |
| 5.12 | Indices d at levels k<d and k>d; zero system | Finite indices truncate, stable/core divisibility does not; zero has infinite stable divisibility. |
| 5.13 | Sha=0; paired torsion π^d⊕π^d; non-primitive κ | Factor 2 comes from the paired structure. Exact length includes the stated primitivity/divisibility correction. |
| 6.1 | Rank 0; rank above module rank; free versus nonreflexive modules | Bidual is Hom(∧^r Hom(M,R),R); natural map is an isomorphism for finite projective modules. No unrestricted bidual=exterior-power claim. |
| 6.2 | Field; self-injective artinian Gorenstein ring; non-Gorenstein ring | Fitting/regulator results keep their distinct ring and prime restrictions; a DVR is not declared self-injective as an artinian coefficient ring. |
| 6.3 | R=Z/p², free kernel of projection R²→R; rank 0 | Contraction sends e1∧e2 to e2 with the fixed order. Kernel/bidual coefficient change uses its exactness/free hypotheses, not a universal base-change isomorphism. |
| 6.4 | G=C3×C2, c conjugation; valuations 1 at w and −1 at cw | Order map gives 1−c, translating w multiplies by g^-1. Swapping determinant columns negates the value; the inverse-action convention is explicit. |
| 6.5 | h(e1)=1,h(e2)=0; empty transition; reverse order | Contraction h(c1)c2−h(c2)c1 sends e1∧e2 to e2; reversing the order gives −e2. Empty transition is identity. |
| 6.6 | Zero dual Selmer; primitive generator; π times generator | Generator gives equality with the Fitting ideals; arbitrary systems give only their stated containment. |
| 6.7 | One prime and r=2; empty conductor; p=2 | The MR regulator sign gives −e2 in the test, while the BSS r−1 sign cancels it where appropriate. Characteristic 2 alone cannot detect a sign error. |
| 6.8 | r=1; r>1; p=3 versus p>3 | Regulator isomorphism retains its higher-rank/admissibility assumptions and the stronger KS prime restriction. |
| 6.9 | Finite projective stalk versus nonfree stalk; rank 1 | Exterior and bidual systems agree with the specified freeness/reflexivity input; no blanket integral comparison is imposed. |
| 7.1 | Rank 1; zero family; conductor 1 | Higher Euler systems use biduals and corestriction with group-ring transport. Rank-one comparison retains reflexivity. |
| 7.2 | r=1 and r=2; H=1; non-split full Galois group | Added r≥1, functional lifting and normalized integral injection i with i(N_H^r x)=N_Hx. Ordinary exterior inclusion gives the wrong norm factor. |
| 7.3 | r=1; swapped auxiliary places; odd/even character | Rubin–Brumer–Stark element is determined using the stated order-map isomorphism and minus lattice; exterior-power integrality is stronger than bidual integrality in general. |
| 7.4 | Zero dual module; primitive regulator generator; nonprincipal Fitting ideal | Use current generic Fitting theory; higher-index equality retains the principal-ring hypotheses and does not follow merely from the Gorenstein case. |
| 7.5 | r=1 and nonreflexive rank-one module | Rank-one identification requires the indicated reflexivity/finite-level hypotheses and agrees with the corrected rank-one derivative. |
| 7.6 | Base-level Rubin–Stark element only versus all finite layers | All-layer integrality and norm relations are necessary for an Euler family; no class-group bound is extracted from an isolated rational element. |
| 7.7 | Totally real even χ; CM minus odd χ; ordered archimedean places | Archimedean Rubin–Stark rank and finite-place minus rank have different parity; both dictionaries are stated, with no silent identification. |
| 8.1 | d=0; cyclotomic Z_p-extension; completely split prime | d≥1 and infinite decomposition groups matter; no-split condition is not automatic in an arbitrary abelian tower. |
| 8.2 | Rank-one trivial action; rank≥2; inverse dual | Tower hypotheses remain stronger than base hypotheses; a_τ=1 needs its exact integral hypothesis. |
| 8.3 | Zero finite-level groups; restriction versus corestriction | Discrete Selmer uses the direct limit and X the compact dual inverse system; no reversal of transition maps. |
| 8.4 | Zero family; norm-compatible nonzero family; bottom level | Iwasawa class uses corestriction and agrees with the specified KS bottom class under the comparison. |
| 8.5 | Γ generator acts by 6 in Z_5 versus 1/6 | Ψ-Shapiro is ι-semilinear; both characteristic/index ideals are transported by γ↦γ^-1, rather than asserting an unqualified linear identification. |
| 8.6 | Rank≥2 versus exceptional scalar rank one; imaginary quadratic case | Weak-Leopoldt tower criterion uses the displayed sufficient alternatives; it is not automatic for all rank-one actions. |
| 8.7 | c=0; free rank one; ideal (p,T) | Rubin's index of zero is 0. Evaluation-image ideal can be nonprincipal and is distinguished from the principal index. |
| 8.8 | Full condition at p versus strict condition; singular local group nonzero | True Selmer includes the singular local quotient; no equality with the restricted Selmer without a vanishing condition. |
| 8.9 | Trivial character; finite-order character; χ(γ)=6 | Twisting transports the Γ-action and characteristic ideals together; finite-order comparison is stated separately. |
| 8.10 | τ−1 invertible versus rank-one quotient; zero input | Evaluation and a_τ require the stated quotient/determinant hypotheses; no division by zero or unqualified perfect integral pairing. |
| 8.11 | No completely split primes; one split prime with non-unramified class | Condition (*) is vacuous in the first case and fails in the second; density zero does not imply it automatically. |
| 8.12 | Zero system; ordinary finite quotients; generalized limit | KS and generalized KS use their actual transition data; maps to limits are not declared bijective without hypotheses. |
| 8.13 | P=(p); nonexceptional distinguished prime | Exceptional set is finite but includes the coefficient prime in this argument; its exclusion cannot be silently removed. |
| 8.14 | Trivial twist; inverse twist; nonzero torsion ideal | Tw_ρ(char(B⊗ρ))=char(B), preserving ideal height; twisting only one side reverses the convention. |
| 8.15 | Tower layer 0; invariant-free case; finite residual invariants | Kernel/cokernel bounds require the tower hypotheses and appropriate compact/discrete limit passage. |
| 8.16 | Full versus strict local condition; zero Euler class | Poitou–Tate retains the local singular quotient and exact-map directions. Public draft II.3.7 checked; published pages not independently viewed. |
| 8.17 | Zero Euler system; ramified auxiliary place; compact coefficient limit | Uses actual arithmetic coinduction/corestriction, not an arbitrary bijective cochain comparison. |
| 8.18 | P=(g)≠(π); P=(π); ramified O | Use g+π^m off the coefficient prime and T^m+π on it. Replacing π by p is invalid over ramified O. |
| 8.19 | Zero class; free rank one; torsion-free ideal (p,T) | Principal Ind differs from Rubin's evaluation ideal. For the zero class its stated convention is retained, not replaced by char of a nontorsion quotient. |
| 8.20 | Finite generation modulo augmentation; compact versus arbitrary algebraic module | Topological Nakayama requires compactness; finite residual data alone are insufficient in an unrestricted module category. |
| 8.21 | Rank one exceptional scalar action; rank≥2 | Exceptional actions and twists are separately isolated; the nonexceptional theorem is not extended by continuity alone. |
| 8.22 | P exceptional/nonexceptional; normalization with finite index | Finite control errors and local terms survive specialization; no general exact coefficient-change isomorphism is asserted. |
| 8.23 | r=0 and r=1; signed versus positive core rank | Generic core rank is computed with the precise local structure; do not replace it by an unrelated finite-level signed difference. |
| 8.24 | κ primitive; pκ; (γ−1)κ; zero system | Scaling inserts height-one primes into the blind spot; zero is not Λ-primitive. |
| 8.25 | c∞=0 versus c∞ nonzero; completely split prime | Weak Leopoldt requires nonzero Iwasawa class and the stated split-prime condition. |
| 8.26 | Residual nonzero generator; class killed modulo maximal ideal | Residual primitivity implies Λ-primitivity only for the specified finite-free KS module and control maps. |
| 8.27 | κ_1=0 versus κ_1 nonzero | Torsion/weak-Leopoldt conclusion uses the nonzero bottom class, not just a nonzero abstract system. |
| 8.28 | M=0; λ-adic paired torsion; coefficient prime perturbation | Self-dual length bound retains its factor 2 and specialization errors. Ramified coefficient branch uses π. |
| 8.29 | Empty sequence; one new prime; finite local defect | Inductive products and annihilator ideals use the stated direction; no cancellation of a nonunit error factor. |
| 8.30 | Primitive κ; πκ; nonexceptional and coefficient primes | Inequality is sharp only under Λ-primitivity, with all height-one primes addressed by the actual perturbation argument. |
| 8.31 | Residual Eisenstein case; zero error; p=3 | CGLS coefficient/error assumptions remain; bounded errors cannot be discarded before taking the specialization limit. |
| 8.32 | Primitive versus divisible self-dual system | Equality requires Λ-primitivity; involution and paired factors are retained in the two characteristic ideals. |
| 8.33 | a_τ=1 versus nonunit; r=0; nonzero class | Keep a_τ^(5r) and the actual rank assumptions; vanishing error is a specialization, not the general theorem. |
| 8.34 | Finite residual characters 1, ω and both ordinary orientations | Finite-character unramified μ=0 is an explicit arithmetic premise, including exceptional local characters; ordinary μ=0 is not assumed. |
| 8.35 | Localize at (π); two rank-one local free modules; torsion-free target | Two Poitou–Tate sequences force the ordinary compact rank-one module free at (π), so its torsion has zero μ. The second local map is zero only after the first sequence gives a torsion-free target. |
| 8.36 | Augmentation prime; coefficient prime; higher-weight twisted quotient | Integral divisibility combines the off-π bound with 8.35; finite-character μ hypotheses and higher-weight ordinary twist remain explicit. |
| 8.37 | d=1 and d>1; a_τ=1; nonzero Euler class | Char(X∞) divides Rubin index under the stronger integral hypothesis; pseudo-null need not mean finite in several variables. |
| 8.38 | P=(p) versus all other height-one primes | Only divisibility up to a power of p follows under the weaker hypotheses; this is not full integral divisibility. |
| 8.39 | Restricted versus true Selmer; singular local term zero/nonzero | The true-Selmer conclusion retains the specified local hypothesis/annihilator term instead of suppressing the local quotient. |

## Validation and next step

- `python3 scripts/check_blueprint.py research/blueprint/packets/EulerSystemsAndKolyvaginSystems.json`: 27 local nodes plus 124 imported targets; 0 errors, 0 warnings. The unchanged packet still records its two inherited gaps, 26 requests and nine planned stages; packaging is not a declaration that those requests are implemented.
- Target/API audit: all 151 targets, all 650 original distinct API/Check names, and all original target titles retained as described above. Four additional generic-bidual APIs; All 61 definition/construction targets have at least three named Checks (58 use the explicit API-block format). Section prerequisite references point strictly backward, with suppliers named separately.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/EulerSystemsAndKolyvaginSystems/Suggested.lean`: pass, no sorry-backed data.
- `lean-check research/blueprint/packages/EulerSystemsAndKolyvaginSystems/Suggested.lean`: exit 0; 11 warnings, all declaration-uses-sorry. No errors, admitted examples or other warnings. Existing shared build at the pins; memory checked above 20 GB before compilation. Only explanatory comments were extended afterward.
- `python3 research/blueprint/intake.py check-files` on the three package files and this handoff: 4 files, 0 problems.
- Staged `git diff --cached --check`: clean.

No implementation work remains in this package job. Next is independent package review, focusing on the published Rubin page checks, the precise maximal-order Part II supplier, the inherited square-index application contract, higher-rank norm/sign normalizations, and the two-sequence coefficient-prime argument. No second job was claimed.

## Public source provenance

Access date 2026-10-19. SHA-256 values below are computed from the public PDF bytes used in this run. They identify editions; inherited source-reading claims from earlier workers are not presented as this run's reading. The two cleared papers are identified above by published citation and page only.

- [rubin](https://swc-math.github.io/notes/files/99RubinES.pdf): `de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50`.
- [mr04](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf): `4cc432d0d719a51c8dd1d2b27829014b9f090f7c53f179d6c628e6208c84e01f`.
- [mr16](https://www.numdam.org/article/JTNB_2016__28_1_145_0.pdf): `00725ad7afc9d7f3d69dac9eb8f872319974bf846be850dc3c0b56ba3b49d926`.
- [bss](https://arxiv.org/pdf/1805.08448v1): `2f6da843d3dcedde65a2b04b80c711863306f9fd9ab20580d245d2c4d2f06429`.
- [howard](https://arxiv.org/pdf/1202.6340v1): `d2d06e851d6aa1fdc33a932b69b5c06a8c56dc2d9e05fb10d97c0358d6d6ea9a`.
- [cgls](https://arxiv.org/pdf/2008.02571v2): `7cd995e0d9ee1c931f728da8b39603c4205fa0a84c25df27d44b4451a81a2c59`.
- [cgs](https://arxiv.org/pdf/2303.04373v2): `5046d7571ed3a1b13baa56b2c94186d9c9488d76181062f4ba82b8ab5158af90`.
- [bcgs](https://arxiv.org/pdf/2312.09301v2): `e575367ab8dd9ffdb1850959dde93f205c4007b0e56af4ed30e120079660aee3`.
- [ky](https://arxiv.org/pdf/2402.12781v2): `bb64820b49aa1eb2574c912c0d03067f904e52b9bf71f441fda78bb6dba9c90a`.
- [ch](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf): `5c85ea3c0d53ce4825ade4213b930c6542bf628cba6d506bb8c3e46960f02bba`.
- [zanarella](https://arxiv.org/pdf/1908.09197v1): `00d91f8d73880174f410ac4be2a43f89867421c0ab7bfafdba1b837111df312f`.
- [nekovar-kuga](https://archive.mpim-bonn.mpg.de/994/1/preprint_1990_78.pdf): `8f3aaf7c9085d2deb117fd860d2d7f2bd226fa6d63b37c3b2f4d379a77b8a529`.
- [sano](https://arxiv.org/pdf/1406.4623v1): `83ca6e59cefdb60833f418aa57617a451101977de1b767ddf6138661758ccea4`.
- [buyukboduk](https://arxiv.org/pdf/0706.0377v2): `645d299256ae61e1bfd63564c68510785a39e52684cbaa720d7d6017fe1f5bf2`.
- [dk](https://arxiv.org/pdf/2010.00657v3): `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099`.
- [sakamoto](https://msp.org/ant/2018/12-10/ant-v12-n10-p.pdf): `ea04b2b3cafe1b990ab32c461f8aea0563baf75fa11b0e93eaea06b1cb325ee0`.
- [mr16-v1](https://arxiv.org/pdf/1312.4052v1): `15ec72e48fab1790e5b96e7172b4af88c974b0d487a515cdbd9dd0ced3ea4ee8`.
- [nekovar-cm](https://web.archive.org/web/20240000000000id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf): `05c8debf4783f4604afe71a0b4367554ac62d52a6a462daa5e2e8c2ed6bfd26a`.
