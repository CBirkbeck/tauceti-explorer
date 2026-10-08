# Heegner-point Euler systems and arithmetic descent — HE.7s part

This planning pass covers HE.7s, HE.8, HE.8b and HE.8c. It constructs the ordinary anticyclotomic arithmetic example, proves the geometric nonvanishing input, and separates three return paths: Howard’s one-sided divisibility, BCGS’s finite-system nonvanishing and divisibility defect, and Castella–Sano’s determinant formulation. The main-conjecture proof belongs to HE.8b. Its early input is the actual family constructed in HE.8; that family never assumes a completed main conjecture.

The pass is **complete as a plan**, with 61 nodes at target level. HE.8 and HE.8b are `planned`, with their exact open contracts recorded. HE.7s and HE.8c are `source_decomposed`: they account for source boundaries and hypotheses rather than defining mathematical objects. No stage is mathematically closed. The packet, this document and the [suggested file](../suggested/HeegnerPointEulerSystems--HE.7s.lean) record the same declarations. The [handoff](../handoff/BP-HeegnerPointEulerSystems--HE.7s~2.md) records the checks and remaining work.

## Ground already supplied

The accepted RS-04 restructuring leaves actual Heegner geometry and arithmetic hypothesis verification here. Generic orders and class fields belong to GlobalNumberFields/ClassFieldTheory; general CM reciprocity belongs to ComplexMultiplicationAndExplicitReciprocity. The reviewed [HE.0 part](HeegnerPointEulerSystems--HE.0.md) plans the actual conductor points, trace and reduction relations, finite derivative classes, local comparison, and HE.7 all prime descent. We import those declarations by their exact identifiers. They are plans with their own explicit gaps, not baseline theorems.

EulerSystemsAndKolyvaginSystems owns the general derivative and Kolyvagin-system structures, finite/singular comparison, prime-restriction rigidity, stub modules, error-tolerant descent and Iwasawa specialization. SelmerIwasawaCohomology owns continuous cohomology, ordinary/finite local conditions and derived tower comparison. ArithmeticGaloisDuality owns duality and cochain machinery. GrossZagierAndArithmeticHeights owns Waldspurger, Gross–Zagier and BDP identities. No generic inverse limit, derived category, Selmer complex or main-conjecture formulation is rebuilt as a Heegner-specific substitute.

The baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` with Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Every positive citation was read in its source at that pin. Mathlib supplies the actual p-adic integer ring, finite group-ring basis elements, bundled module maps, monoid homomorphisms, submodule spans, tensor products, finite rank and extended natural numbers. These give algebraic interfaces for the prototype. A finite monoid algebra is not the completed arithmetic Λ; a general measure construction is not integral Selmer control. The name searches also find group-theoretic Iwasawa criteria and numerical Heegner numbers, which do not supply this theory.

## Conventions and dependency order

For the classical ordinary branches, let E/ℚ have conductor N and a specified modular parametrization. Let K be imaginary quadratic with signed discriminant D_K<0, odd and different from −3, with every prime dividing N split in K. Let p be an odd good ordinary prime, prime to ND_K. Write T=T_pE, A=T⊗ℚ_p/T, Γ=Gal(K∞/K), Λ=ℤ_p⟦Γ⟧ and ι(γ)=γ⁻¹. Use the actual continuous Galois module and its tautological-action convention. The class at conductor one is the Kummer class of a trace from K[1], never an assertion that a raw CM point is already K-rational.

The weak torsion condition is E(K)[p]=0. It differs from irreducibility over G_K or G_ℚ, surjectivity of the residual G_ℚ action, and surjectivity of the full integral G_K action. Howard’s clean Theorem B retains the integral image hypothesis, p∤h_K and its ordinary tower conditions. CGLS’s weakened construction permits the class-number p-part, but its initial divisibility statement inverts p and the augmentation prime unless its further corank condition applies. BCS proves the rational equality under p>3 and irreducibility over G_ℚ, and the integral equality under residual surjectivity. The distinct Eisenstein theorem is imported from BSD.7a with its exclusions on the local residual character.

For relative CM nonvanishing, replace the classical data by F totally real, K/F CM, a cuspidal parallel-weight-two representation π, a finite-order everywhere-unramified central character ω, and a prime P of F. The prime-to-P conductor N′ is coprime to D_(K/F). The source defines conductor using an F-ideal in the order. It also uses geometric Frobenius for Artin reciprocity; the earlier Heegner packet’s arithmetic-Frobenius convention must be inverted in the pointwise comparisons. These relative data are not obtained by renaming an elliptic Tate module.

The dependency order is:

1. HE.0–HE.5 supply actual points, norm relations, derivatives and local verification.
2. The S-arithmetic dynamics supplier gives joint CM distribution; HE.8 proves weighted CM nonvanishing and constructs a nonzero Λ-class independently of the main conjecture.
3. ES.8 supplies the generic one-sided bound. HE.8b imports the shared Wan/Fujiwara comparison and proves the anticyclotomic reverse divisibility.
4. BSD.7a uses the **early** family in its independent Eisenstein proof, and exports that branch to HE.8b. It consumes neither HE.8b’s equality nor the late BCGS/CS applications.
5. HE.8’s BCGS A/B and CS C statements retain their main-conjecture hypotheses. Their unconditional split-prime corollaries are in HE.8b.

This order also keeps AutomorphicCongruences L5b, the return cyclotomic argument, downstream. ModularIwasawaMainConjectures L3’s cyclotomic equality is not an anticyclotomic proof supplier.

## HE.7s: classical exceptional-prime and CM source boundary

HE.7’s all prime target remains intact. Import the reviewed bounded-denominator derivative construction, integral dyadic conjugation descent, CM-character error descent, integral CM prime detection, CM/Heegner-field disjointness, admissible RM Kolyvagin–Logachev statement, and full Sha finiteness. The dyadic argument uses integral 1±ρ with bounded powers-of-two losses; it does not use projectors (1±ρ)/2 over ℤ₂. The CM argument uses its actual semilinear representation and endomorphism field, with its different image/detection estimates. Neither clean odd-prime residual surjectivity nor a non-CM open-image theorem proves that branch.

The reviewed HE.7 source route uses Nekovář’s arithmetic error analysis. It establishes a bounded exponent for each exceptional primary part, proves almost all primary parts vanish, and combines the remaining exponent bounds with finite finite-level Selmer groups. Separate finiteness of every primary part would not imply finiteness of the entire Sha. The imported square-index target also keeps its source-access distinction: an exponent bound does not automatically yield a cardinality bound by the square of the point index.

The selected Rubin 1987 CM source remains unacquired. Its DOI identifies the article, but no theorem about rank one, dyadic primes or a universal CM endpoint is inferred from the title. The elliptic-unit route is a distinct arithmetic source alternative and an essential input to the Eisenstein Iwasawa branch. The new owner proposed below will supply it. This does not add an artificial elliptic-unit prerequisite to Nekovář’s direct CM descent. HE.7s therefore receives a source-inventory coverage record and no planet. Its note should be merged into the mathematical HE.7 statements and the source register when the process layer is removed.

## HE.8: ordinary families, geometric nonvanishing and defects

The normalization begins with the finite ring-class group G(n)=Gal(K[n]/K) and its Artin elements. The inert initial factor is (p+1)²−a_p²; the split factor is a product in ℤ_p[G(n)], whose augmentation is (p+1−a_p)². It can be divisible by p. Positive-conductor stabilization divides by the **unit root** α_p, not by a_p. It subtracts α_p⁻¹ times the predecessor and scales by α_p⁻k. Conductor zero has a separate Euler correction. When p divides the class number, the finite ring-class conductor d(k) is the actual least conductor containing K_k, not k+1 by convention.

The universal-norm family is selected by compactness from compatible lifts of ΦP[n]. Howard proves its existence and compatibility with his clean hypotheses; CGLS adapts that construction under E(K)[p]=0 with the actual conductor shifts. Uniqueness is not asserted. CGLS compares it with the ordinary stabilized family by a unit involving β_p=p/α_p and u_K. This proves equality of the generated Λ-lines while leaving the possibly nonunit Φ visible in finite specialization. Derivative classes import the generic cyclic-Galois tensor and retain the global χ localization issue from the earlier packet. A local endomorphism cannot be silently applied to global cocycles unless its equivariance has been established.

Geometric nonvanishing is a joint distribution statement. A product of CM reductions has component constraints, and the Galois elements indexing its factors must be pairwise distinct modulo P-rational reciprocity elements. The source proves the Haar limit and then finite-fibre orbit surjectivity. It uses products of cocompact SL₂(F_P) quotients. The current GN.4 Ratner nodes are over real Lie groups; they do not supply this p-adic theorem. The exact extension is requested. The Q_p twisted-diagonal statement has a precise Ratner reference; the source’s appeal to expert knowledge for general F_P remains an acquisition/verification gap.

In the indefinite branch, weighted degeneracy maps preserve a nonzero P-new quotient and the joint orbit supplies enough supersingular reductions to avoid the finite tower torsion. Primitive-character averaging then gives a non-torsion character point at every sufficiently large conductor. In the definite branch, nonexceptionality excludes π≃π⊗η_(K/F), and a nonconstant toric function supplies a nonzero primitive-character period. GZ supplies the analytic formula after the geometry. Neither argument says all sufficiently ramified characters are nonzero.

BCGS compares the actual finite derivative system with nontrivial crystalline characters near the identity. The modulus condition is M(n)≥m, and the scalar is the initial factor, whose p-valuation must be retained. A nonzero Λ-family implies nonzero bottom classes at sufficiently close **nontrivial** characters; the identity specialization may vanish. General continuous near-identity characters are supplied by PadicMeasuresIwasawaAlgebras L0a. The split crystalline construction is one example, not the supplier for the inert or general unramified branches. Its logarithm, optimal-lattice and control comparisons retain the local torsion factor q, finite localization cokernel C, and the product over K-primes above N. BCGS Lemma 1.2.3/Remark 1.2.4’s comparison of q=#H⁰(ℚ_p,E_•[p∞]) with an ordinary unit-root factor remains a specific integral supplier obligation. Full Tate invariants, the unramified ordinary quotient and the reduction group are distinguished until the lattice and extension hypotheses justify the identification. The source-stated formulas retain q; this is a verification gap, not a claimed source error. The main-conjecture-dependent contradiction uses a uniform rescaling error. The refined theorem requires the integral equality and distinguishes M∞ from the bottom point index M₀.

Castella–Sano constructs a rational determinant element from y∞⊗y∞ and then asks whether it generates the integral lattice. Its Selmer complex uses strict ordinary conditions at all p-primes and has a rank-one discrete dual. BCS’s (0,empty) Greenberg dual is torsion. The notations X_Gr in these papers must therefore be distinguished. The specialized lattice contains L_p²·Tam_E²·#X_BK. Proposition 3.3.2 uses a continuous α congruent to 1 and a nonzero bottom specialization to obtain both rank-one integral Selmer lattices; it does not require α to be one of the split crystalline α_m. Here X_BK is the finite quotient of the propagated Selmer group; at a general twist it need not be Bloch–Kato. The inert-prime theorem proves an equivalence with the main conjecture, which this packet does not discharge at inert p.

## HE.8b: anticyclotomic main-conjecture proof

The source is BCS arXiv v2. Theorems1.2.2(a)/(b) are the rational/integral Heegner formulas, and Theorems1.2.4(a)/(b) their Greenberg versions. BCS’s single-power analytic function corresponds, as a generated ideal after the specified coefficient and period comparison, to the square of BCGS’s L_BDP. The packet imports the GZ convention dictionary, including its remaining unit-normalization gap, and requests the exact integral family reciprocity extension.

AutomorphicCongruences L5a owns the shared two-variable four-term comparison, Selmer restriction and analytic factorization. L5w owns Wan’s GU(2,2) congruence theorem and the Fujiwara hypotheses over the auxiliary real quadratic/quartic CM fields. This packet verifies the arithmetic auxiliary-field restrictions and proves the anticyclotomic return: project the product divisibility, use the appropriate μ-vanishing and local-condition dictionary, combine the two opposite Euler-system bounds, and cancel nonzero factors. The p>3 condition and exceptional p=5 field exclusion stay attached to the supplier invocation. Integral equality requires its integral period and residual-surjectivity branch.

CGLS Proposition 4.2.1, PDF pp.28–29, compares both divisibility directions rationally at odd p under E(K)[p]=0. The integral comparison uses BCK Theorem 5.2, published pp.1646–1647, with its standing p>3 and split ordinary setting. The additional surjectivity, non-anomalous and Hypothesis ♥ conditions of BCK Theorem 5.1 are not imported into this comparison. A general weak-torsion integral comparison at p=3 remains unverified.

The Eisenstein branch is an exact adapter to BSD.7a’s CGS theorem, with φ|G_p≠1,ω. The older CGLS theorem has an extra(Sel) hypothesis and is not substituted for the newer theorem. The missing elliptic-unit and integral Kato suppliers are recorded below. No larger Keller–Yin-type scope is inferred without the matching source statements and proof dependencies.

## HE.8c: hypothesis matrix and extraction correction

| Result | Exact extra conditions | Conclusion and boundary |
| --- | --- | --- |
| Cornut modular tower | Classical Heegner setting, p∤N | A non-torsion trace at some conductor; no every-character claim |
| CV definite, Thm1.4 | Relative CM data, N′ coprime to D, even sign parity, nonexceptional pair, fixed admissible χ₀ | Some χ in each sufficiently large primitive stratum has nonzero central value |
| CV indefinite, Thm1.5 | Relative CM data, odd parity, ω=1, N,D,P pairwise coprime | Some χ in each sufficiently large primitive stratum has nonzero derivative |
| Howard B | Ordinary odd p, full G_K image, p∤h_K, discriminant/conductor exclusions | Rank one, paired torsion, one-sided divisibility |
| BCGS A | (Heeg),(disc),(tor), odd ordinary split p, rational main conjecture | Some finite derivative class nonzero; κ₁ can vanish |
| BCGS B | p>3, residual surjectivity, p-optimal parametrization, integral main conjecture | M∞ equals the rational Tamagawa valuation sum |
| CS C | p>3, residual surjectivity, p∤Manin constant, ordinary p unramified in K | Refined equality iff integral determinant conjecture; inert case conditional |

The atlas currently extracts HE.8 and HE.8b from identical blocks including their neighbours. This conflates early classes with a return equality and reverses the dependency of the CV theorem. Re-extract HE.8 from README lines 102–108 and HE.8b from 110–116, with the two process notes separately. The same anchor correction applies to BSD.6/6a and 7/7a. Preserve the existing integrated CV node identifier under HE.8c, move its mathematical parent to HE.8, and split the definite theorem. Remove HE.8→HE.8c and HE.8b→HE.8c. The correction is a proposal in this packet; this job does not edit atlas records.

The remaining sections give the complete declaration inventory, APIs and acceptance examples, followed by the exact owner requests. Source locators belong to the editions actually read. All declarations remain implementation-unchecked.

The norm-family prototype now takes the actual compact limit groups L[n], the continuous bottom projections, the permitted conductor-edge traces and their scalars as fixed inputs. Its finite-solvability hypothesis asks for a common solution of each finite list of bottom and auxiliary constraints. Howard’s common free presentation supplies these finite families; existing compact-product and closed finite-intersection theorems produce the global family. A zero projection with a nonzero prescribed bottom fails the singleton constraint, and a bottom value 1 with identity trace and scalar 0 fails the paired constraints. Both failures are acceptance examples. This Heegner constraint application imports generic compactness and inverse limits.

The level API requires the actual transition square cor[n,k]∘pr[n,k+1]=pr[n,k]. Differences of two feasible choices have zero bottom projection and satisfy the homogeneous auxiliary equations. The stabilized-corestriction theorem uses the defined stabilizedPoint, the raw trace recurrence, the degree-p action on included points, and the separate first-step correction. Actual field/tower identifications remain supplier obligations; these expressible algebraic hypotheses are retained in the prototype.

The reviewer’s added relative-ring-class-tower torsion theorem uses CV Lemma 2.7 and Proposition 4.4, PDF pp.22,38. At two good places above distinct residue characteristics and nonsplit primes away from P, the local tower degrees are bounded. Prime-to-residue-characteristic torsion injects into finite reduction groups; the two characteristics together bound every primary part. This supplies the finite torsion needed by the indefinite argument and makes no claim about every abelian extension.

The verified exact-length route stays at p>3. BCGS Theorem 2.2.2 inherits p≥3 from Proposition 2.2.1 but its proof uses Lemma 2.2.4 with p>3 (PDF pp.17–19). E3 records that proof-scope gap. A p=3 counterexample is not asserted.

## HE.8 declaration inventory

### Heegner initial Euler factor

**Declaration:** `initialFactor`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/initial-euler-factor`.

For every permitted n, in ℤ_p[G(n)] with G(n)=Gal(K[n]/K), define Φ=(p+1)²−a_p² if p is inert; if p splits define Φ=(p−a_pσ+σ²)(p−a_pσ*+σ*²), with σ,σ* the specified Artin elements. The augmentation is (p+1−a_p)² in the split case, not necessarily a unit. Keep the finite ring-class group, its Artin action and the initial unit index; it differs from Howard’s first-step degree group Δ=(O_K/pO_K)×/(ℤ/pℤ)×.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.

**Proof or construction:**

1. Read σ,σ* through the imported reciprocity convention.
2. Compute the initial trace polynomial from HE.2; retain its action on the Δ-module.

**Dependencies:** `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `mathlib:MonoidAlgebra.single`.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), §2.3, before Lemma 2.3.2; PDF pp.28–29. The Artin-polynomial product and inert scalar precede the universal-norm proof; augmentation retains a possibly nonunit factor.

**Uses:** Howard Lemma 2.3.2: describes the common initial trace image. BCGS Lemma 1.1.5 and CS Lemma 3.1.1: its augmentation is the specialization factor.

**API:**

- `initialFactor_inert` (simp): Inert Φ=(p+1)²−a_p².
- `initialFactor_split` (simp): Split Φ is the product of the two Artin quadratic factors, not its augmentation.
- `initialFactor_augmentation` (compatibility): Augmentation of the split factor is (p+1−a_p)²; inert augmentation is unchanged.
- `initialFactor_natural` (functoriality): A coefficient-ring map and compatible finite ring-class group map carry Φ to the corresponding factor.

**Acceptance examples:**

- `initialFactor_split_anomalous` (computation): For p=5,a_p=1 and σ=σ*=1, Φ=25, a nonunit in ℤ_5.
- `initialFactor_inert_value` (computation): For p=5,a_p=1, inert Φ=35, distinct from the split augmentation25.
- `initialFactor_reciprocity` (compatibility): Replacing both Artin elements by inverses transforms Φ by that involution; it does not permit replacing σ by1.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Ordinary stabilization of Heegner points

**Declaration:** `stabilizedPoint`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/ordinary-stabilized-point`.

Let α_p∈ℤ_p× be the unit root of X²−a_pX+p and β_p=p/α_p. For k≥1 put P[p^k]_α=P[p^k]−α_p⁻¹P[p^(k−1)] and scale by α_p⁻k. At k=0 use u_K⁻¹(1−α_p⁻¹σ)(1−α_p⁻¹σ*)P[1] in the split case and u_K⁻¹(1−α_p⁻²)P[1] in the inert case. Trace to K_k with the actual smallest d(k) such that K_k⊂K[p^d(k)], including p-primary class-number shifts.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.

**Proof or construction:**

1. Use the ordinary unit-root supplier, not division by a_p.
2. Apply the repeated and initial trace relations separately; form the finite ring-class norms with d(k).

**Dependencies:** `HeegnerPointEulerSystems:HE.8/initial-euler-factor`, `HeegnerPointEulerSystems:HE.2/repeated-conductor-predecessor-recurrence`, `HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence`, `PadicHodgeRegulators:L3`, `mathlib:PadicInt`.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Remark 4.1.3; PDF pp.28. The source separates the initial Euler correction from positive-conductor unit-root stabilization and traces from the least containing conductor.

**Uses:** CGLS Remark 4.1.3: builds the ordinary compatible tower. BCGS §1.1.2: compares normalized Λ-lines.

**API:**

- `stabilizedPoint_succ` (projection): At k≥1 the scaled point is α_p⁻k(P[p^k]−α_p⁻¹P[p^(k−1)]).
- `stabilizedPoint_map` (functoriality): An equivariant ℤ_p-linear map commutes with stabilization.
- `stabilizedPoint_change_unit` (compatibility): A unit rescaling of all raw points rescales every stabilized point by that unit.
- `stabilizedPoint_initial` (relation): The conductor-zero value uses its separate split/inert correction with u_K.

**Acceptance examples:**

- `stabilizedPoint_zero` (degenerate): All raw points zero give every stabilized point zero.
- `stabilizedPoint_predecessor` (computation): Over ℚ with unit 2 and raw P_1=4,P_0=2, the k=1 stabilized value is 3/2, not 2 or 3; this is an algebraic normalization example, not an arithmetic unit-root assertion.
- `stabilizedPoint_first_level` (computation): At initial level the prescribed Euler-corrected P[1] is used; the positive-level recurrence is not evaluated at a nonexistent predecessor.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Norm compatibility of stabilized Heegner points

**Declaration:** `stabilized_corestriction`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/stabilized-corestriction`.

The stabilized points traced to the anticyclotomic layers satisfy Cor_(K_(k+1)/K_k)y_(k+1)=y_k. The first trace uses the initial correction in ordinary-stabilized-point; a shift d(k) is required when p divides h_K. This construction does not assert Howard Theorem B under the weakened class-number hypothesis.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. Use the actual linear trace maps on the common ambient point-completion and the compatibly included raw points. The unit root α satisfies α²−a_pα+p=0; at positive level cor[k+1](raw[k+2])=a_p raw[k+1]−raw[k] and cor[k+1](raw[k+1])=p raw[k+1]. At the first step cor[0](raw[1])−α⁻¹cor[0](raw[0])=α·initial, with initial the separately corrected point. Identify anticyclotomic traces using the actual d(k).

**Proof or construction:**

1. At positive levels, expand the defined α-stabilized point under the actual linear trace. Substitute the raw norm recurrence and the degree-p equation, and use α²−a_pα+p=0 to obtain the preceding stabilized point.
2. At level zero, use the separate first-step equation for the corrected initial point. Compose the actual conductor traces down to K_k with d(k), rather than replacing d(k) by a fixed shift.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/ordinary-stabilized-point`, `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Remark 4.1.3 and proof of Theorem 4.1.1; PDF pp.27–28. Unit-root stabilization converts the actual raw trace recurrence into compatible norms; the initial correction handles the first step separately.

**Required boundary:** The conclusion uses stabilizedPoint α raw initial, not an arbitrary sequence. The unit-root, raw recurrence, degree and first-step correction are expressible hypotheses in the prototype; actual tower identifications remain supplier conditions.

### Compact lift of the simultaneous Heegner norm constraints

**Declaration:** `universalNormFamily_exists`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/compact-universal-norm-lift`.

For the actual compact Hausdorff inverse-limit groups L[n], fix the continuous bottom projections π[n], prescribed values Φ[n]P[n], permitted conductor edges j, continuous auxiliary traces tr[j] and integer scalars a[j]. If every finite list of bottom equations π[n]q[n]=Φ[n]P[n] and auxiliary equations tr[j]q[target j]=a[j]q[source j] has a common solution, there is a family q satisfying every equation. This packages the arithmetic constraint application of existing compactness; it does not re-plan the generic inverse-limit or Tychonoff theory.

**Hypotheses:** The indices and actual groups/maps are those of the ordinary Heegner tower; all L[n] are compact Hausdorff topological additive groups, all initial groups P[n] are Hausdorff, and π[n] and tr[j] are continuous. Every finite list of the two kinds of constraints is simultaneously solvable. Howard’s common free presentation and its compatible conductor maps establish this arithmetic input; CGLS uses the actual class-number shifts.

**Proof or construction:**

1. Use the existing compact product theorem for ∏_n L[n]. Each bottom constraint is a closed fibre of a continuous map into a Hausdorff initial group. Each auxiliary equation is a closed equalizer in the Hausdorff limit group at its source.
2. Index the closed sets by the disjoint union of conductors and permitted edges. Split any finite index set into its bottom and auxiliary parts and apply the simultaneous finite-solvability hypothesis.
3. Apply the existing compact finite-intersection theorem and extract a family in the common intersection.

**Dependencies:** `mathlib:Pi.compactSpace`, `mathlib:IsCompact.inter_iInter_nonempty`, `PadicMeasuresIwasawaAlgebras:L5`.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), Lemmas2.3.2–2.3.3; PDF pp.29–30. The common free-presentation proof gives simultaneous finite solutions before the source applies compactness to the family of conductor constraints.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28. Supplies the weaker E(K)[p]=0 construction and local verification; Howard’s strong image/class-number assumptions are retained only by Howard’s divisibility theorem.

**Required boundary:** Import native compactness rather than inventing a compactness predicate. Retain continuity, Hausdorff separation and simultaneous finite solvability in the signature. The finite-solvability hypothesis is an explicit lower-level arithmetic obligation; it is not a field asserting global existence or the desired source theorem.

### Howard universal-norm Heegner family

**Declaration:** `universalNormFamily`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/universal-norm-heegner-family`.

Under the ordinary Heegner conditions and E(K)[p]=0, construct Q[n] in lim_k H_k[n], the inverse limit of the ℤ_p[Gal(K_k[n]/K)]-modules generated by P[n] and P_j[n]. Its level-zero projection is ΦP[n], and Cor_(K∞[nℓ]/K∞[n])Q[nℓ]=a_ℓQ[n] for every permitted auxiliary ℓ. Choices arise from compactness, not uniqueness. Howard proves this under full G_K image and p∤h_K; CGLS Theorem 4.1.1 gives the weaker construction with the actual class-number conductor shifts, without extending Howard’s divisibility theorem. The construction takes these fixed maps and scalars together with finite solvability; its APIs use the same data. For actual level projections pr[n,k] and transitions cor[n,k], require cor[n,k]∘pr[n,k+1]=pr[n,k]. Differences between two choices with these same bottom and auxiliary constraints have zero bottom projection and obey tr[j](Q[target j]−Q′[target j])=a[j](Q[source j]−Q′[source j]).

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. The conductor index I and permitted auxiliary-edge index J, their source/target maps, actual compact Hausdorff inverse-limit groups L[n], initial groups P[n], continuous bottom projections π[n], Artin-factor actions Φ[n], points P[n], continuous auxiliary traces tr[j], and scalars a[j] are fixed before choosing the family. Every finite list of bottom and auxiliary constraints has a simultaneous solution, as established by the common free-presentation argument; no uniqueness or surjectivity of arbitrary projections is assumed.

**Proof or construction:**

1. For each squarefree auxiliary conductor, use Howard’s γ_k recurrence and the finitely generated free presentation to lift Φx. Send the common generators to the modules for its divisors with the same coefficients; the actual conductor trace maps turn this into a simultaneous finite family with the prescribed a_ℓ relations.
2. For an arbitrary finite list of conductors and permitted edges, enlarge to the divisors of their common squarefree product. Its finite family proves finite solvability of both sets of constraints, not merely separate surjectivity of each bottom projection.
3. Apply compact-universal-norm-lift to the product of the actual compact limit modules: bottom fibres and auxiliary equalizers are closed, and finite solvability gives their finite-intersection property. Choose one point of the common intersection.
4. Read bottom and auxiliary APIs from that intersection. Evaluate the supplied inverse-limit transition square for the level API; subtract two feasible families using additive trace linearity for both homogeneous choice relations.
5. In the E(K)[p]=0 adaptation, use CGLS’s actual least conductor d(k) and the supplier’s continuous tower/cohomology comparisons. This does not import Howard’s stronger divisibility theorem into the weak-torsion branch.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/compact-universal-norm-lift`, `HeegnerPointEulerSystems:HE.8/initial-euler-factor`, `HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence`, `PadicMeasuresIwasawaAlgebras:L1`, `PadicMeasuresIwasawaAlgebras:L5`.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), Lemmas2.3.2–2.3.3; PDF pp.29–30. The proof lifts the initial Artin-factor multiple in a common free presentation, obtains coherent finite conductor families, and chooses a global family by compactness.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28. Supplies the weaker E(K)[p]=0 construction and local verification; Howard’s strong image/class-number assumptions are retained only by Howard’s divisibility theorem.

**Uses:** Howard §2.3 derivative construction: requires simultaneously coherent auxiliary norms. Howard Lemma 2.3.8: computes the augmentation image.

**API:**

- `universalNormFamily_level_zero` (projection): For the fixed data and the finite-solvability witness used by the construction, π[n](Q[n])=Φ[n]P[n]. Promoted as `HeegnerPointEulerSystems:HE.8/universal-norm-level-zero`.
- `universalNormFamily_trace` (relation): For each edge j of the supplied permitted-edge index, the fixed trace tr[j] sends Q[target j] to a[j]Q[source j].
- `universalNormFamily_corestriction` (compatibility): For the actual supplied level projections and transitions, assume cor[n,k]∘pr[n,k+1]=pr[n,k]; then cor[n,k](pr[n,k+1](Q[n]))=pr[n,k](Q[n]).
- `universalNormFamily_choice` (characterisation): For two families satisfying the same bottom and fixed auxiliary constraints, their difference has zero bottom projection and satisfies the same homogeneous auxiliary trace relations; it need not be zero.
- `universalNormFamily_exists` (constructor): For the fixed continuous projection/auxiliary data on actual compact Hausdorff limits, simultaneous solvability of every finite list of constraints gives a family satisfying all bottom and auxiliary constraints. Promoted as `HeegnerPointEulerSystems:HE.8/compact-universal-norm-lift`.

**Acceptance examples:**

- `universalNormFamily_bottom` (compatibility): On the finite compact group ℤ/7, with one conductor, no auxiliary edges, π=id, Φ=5·id and initial point 1, the chosen bottom is 5 rather than 1; the finite-solvability witness is the constant family 5.
- `universalNormFamily_auxiliary` (degenerate): For a fixed permitted auxiliary edge j with a[j]=0, and the same finite-solvability input used by the construction, tr[j](Q[target j])=0.
- `universalNormFamily_nonunique` (non-example): With one conductor and one self-edge on the finite compact group ℤ/2, bottom projection zero, prescribed bottom zero, trace id and scalar 1, the distinct families 0 and 1 satisfy both constraints, and their difference satisfies both homogeneous laws.
- `universalNormFamily_impossible_bottom` (non-example): On ℤ/7 with π=0 and prescribed bottom 1, even the singleton bottom constraint has no solution, so no finite-solvability witness can be passed to the constructor.
- `universalNormFamily_incompatible_auxiliary` (non-example): On ℤ/7 with π=id, prescribed bottom 1, a self-edge with trace id and scalar 0, the singleton bottom and auxiliary constraints cannot be solved simultaneously.

**Required boundary:** All expressible topology, finite-solvability and map-compatibility assumptions occur in the prototype. The permitted auxiliary maps and scalars are construction inputs, rather than universally quantified after a family has been chosen. The finite-solvability obligation is discharged by the arithmetic common-presentation proof. A global family or the desired theorem must not be hidden in an opaque proposition-valued structure. The zero-projection/nonzero-bottom case and the identity-trace/zero-scalar incompatible case fail finite solvability. Choice comparison retains both homogeneous laws and does not assert uniqueness.

### Anticyclotomic Heegner class

**Declaration:** `heegnerIwasawaClass`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`.

Apply the integral Kummer map to the stabilized norm-compatible points and the imported Iwasawa–Shapiro comparison to obtain y∞∈H¹_Iw(K∞/K,T)=H¹_cont(K,T⊗Λ(tautological inverse)). The actual tower class lies in the specified ordinary Selmer structure. Its projection to level k is the Kummer class of y_k. There is no assertion that each character specialization is nonzero.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.

**Proof or construction:**

1. Invoke finite Kummer/corestriction compatibility from HE.3.
2. Use the supplier’s continuous, derived-limit comparison, with its tautological-action sign.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/stabilized-corestriction`, `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1 and Remark 4.1.3; PDF pp.27–28. Integral Kummer and the tower cohomology comparison transport the compatible point family into the stated ordinary Iwasawa Selmer group.

**Uses:** Howard TheoremB: supplies the actual rank-one Heegner Λ-submodule. BSD.7a and AutomorphicCongruences L5a: need the early nonzero family without a completed main conjecture.

**API:**

- `heegnerIwasawaClass_level` (projection): Under Iwasawa–Shapiro, level k equals the Kummer class of y_k. Promoted as `HeegnerPointEulerSystems:HE.8/iwasawa-heegner-level-projection`.
- `heegnerIwasawaClass_scalar` (functoriality): An equivariant quotient or scalar transport commutes with the class construction.
- `heegnerIwasawaClass_restrict` (compatibility): Changing the tower by a finite initial norm gives the imported corestriction comparison, with its degree/factor.
- `heegnerIwasawaClass_zero` (simp): The identically zero compatible point family has zero class.

**Acceptance examples:**

- `heegnerIwasawaClass_trace` (compatibility): Conductor one specializes to the corrected trace over its ring-class field, not an assumed K-rational raw point.
- `heegnerIwasawaClass_isogeny` (non-example): A p-isogeny acts by the actual lattice map; a nonunit scalar can change the integral index.
- `heegnerIwasawaClass_nonzero_not_all_specializations` (non-example): In the supplied two-coordinate cohomology model, the image of (1,0) under the identity Iwasawa comparison is nonzero, but its second-coordinate specialization is zero. The test invokes heegnerIwasawaClass and detects both a zero construction and an assertion that all projections are nonzero.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Planet:** Anticyclotomic Heegner class.

### Primitive CM character stratum

**Declaration:** `cmCharacterStratum`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/cm-character-stratum`.

For the imported relative ring-class tower G∞ with finite torsion G₀, define P(n,χ₀) as the finite-order characters of G(n) restricting to χ₀ on G₀ and not factoring through G(n−1). The character satisfies χ₀ω=1 on the embedded A_F×. Conductor is the largest F-ideal in the order, and primitivity is exact level, not merely conductor dividing P^n. Small n before G₀ embeds are excluded.

**Hypotheses:** F totally real, K/F CM, P a finite prime; n is large enough to identify G₀ in G(n).

**Proof or construction:**

1. Use the actual quotient maps and torsion inclusions.
2. Define the fixed-type locus minus pullback of characters at the preceding level.

**Dependencies:** `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`, `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`.

**Source:** [cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §1.1, equations(3)–(4), and Lemma 2.8; PDF pp.3–6,23. The source fixes exact conductor, restriction to finite ring-class torsion, and central-character compatibility; these select the primitive character stratum.

**Uses:** CV Theorems1.4/1.5: quantifies existence within exact-conductor fixed-torsion strata. CV Lemma 2.8 and Theorem 5.10: primitive-character averaging separates old-level contributions.

**API:**

- `cmCharacterStratum_mem` (characterisation): Membership is fixed torsion restriction together with failure to factor through G(n−1).
- `cmCharacterStratum_torsion` (projection): Every member restricts to χ₀ on G₀.
- `cmCharacterStratum_not_old` (relation): Every pullback from G(n−1) is excluded.
- `cmCharacterStratum_transport` (equivalence): Compatible isomorphisms of tower quotients and torsion subgroups identify the strata.

**Acceptance examples:**

- `cmCharacterStratum_identity_quotient` (degenerate): When the preceding-level quotient map is the identity, the primitive stratum is empty.
- `cmCharacterStratum_wrong_torsion` (non-example): A character with the wrong restriction to G₀ is excluded even if it is primitive.
- `cmCharacterStratum_first_nontrivial` (computation): For G(n)=C₂, preceding quotient1, trivial torsion subgroup and identity character C₂→C₂, the character belongs to the exact-level stratum.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Generic CM root-number parity

**Declaration:** `cm_generic_root_number`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/cm-generic-root-number`.

For cuspidal parallel-weight-two π over F with finite-order everywhere-unramified central character ω, and prime-to-P conductor N′ coprime to D_(K/F), let S be all real places and the finite inert Q≠P for which ord_Q(N) is odd. For sufficiently ramified compatible ring-class χ, ε(π,χ)=(-1)^|S|. The source’s S_χ equals S at every level if P∤N or P splits in K. Even |S| is definite and odd |S| indefinite.

**Hypotheses:** π cuspidal parallel weight two; ω finite-order everywhere unramified; N′ and D_(K/F) coprime.

**Proof or construction:**

1. Import local epsilon identities with the source’s conventions.
2. Eliminate the moving P factor only at sufficiently large conductor; multiply signs.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/cm-character-stratum`, `GrossZagierAndArithmeticHeights:GZ.4`.

**Source:** [cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §1.1, Lemma 1.1 and definitions of S,Sχ; PDF pp.4–5. The exceptional local sign set stabilizes at sufficiently large conductor, yielding the parity formula with the stated splitting exception.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Joint distribution of CM reductions

**Declaration:** `joint_cm_equidistribution`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/joint-cm-equidistribution`.

Let F be totally real, K/F CM, and B/F a quaternion algebra split by K and at P, with a fixed K-embedding. Choose a nonempty finite collection 𝒮 of finite sets S of finite places v≠P with B_v split, K_v a field, and |S|+|Ram_f(B)|+[F:ℚ] even; fix the source’s totally definite B_S and compatible local embeddings. Let R⊂Gal(K^ab/K) be nonempty finite and pairwise distinct modulo P-rational elements rec_K(λ), characterized by λ_P∈K×·F_P×. Form the actual simultaneous Red:CM→X(𝒮,R) and component map C with fibre probability measures μ_z. For compact-open G⊂Gal(K^ab/K) with probability Haar dg, a P-isogeny class ℋ, and continuous f:X(𝒮,R)→ℂ, the difference ∫_G f(Red(gx))dg−∫_G∫_(C⁻¹(gx̄))f dμ_(gx̄)dg tends to zero as x escapes compact subsets of ℋ. Here x̄=C(Red(x)); prohibited components are retained.

**Hypotheses:** B split by K and at P; each auxiliary set satisfies S1–S3 and excludes P, as specified in the statement. R is nonempty and pairwise P-irrational; G is compact open. Artin reciprocity sends uniformizers to geometric Frobenius.

**Proof or construction:**

1. Reduce the adelic orbit to products of cocompact SL₂(F_P) quotients.
2. Apply the requested p-adic uniform-distribution theorem and twisted-diagonal classification.
3. Identify commensurable factors with P-rational reciprocity classes; pairwise irrationality forces the full product.

**Dependencies:** `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`, `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`, `HilbertModularVarietiesAndShimuraCurves:R18.1`, `HilbertModularVarietiesAndShimuraCurves:R18.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4`.

**Source:** [cv-dynamics](https://webusers.imj-prg.fr/~christophe.cornut/papers/part2.pdf), Theorem 2.9; §§2.5 and2.7; PDF pp.11–12,24–35. Simultaneous reductions equidistribute in their prescribed component fibres; the proof uses the specified local-product dynamics.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Planet:** Joint CM equidistribution.

### Surjectivity onto CM reduction fibres

**Declaration:** `joint_cm_orbit_surjectivity`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/joint-cm-orbit-surjectivity`.

At fixed finite level and with the joint CM distribution hypotheses, Red(Gx) equals the fibre C⁻¹(Gx̄) for every x outside a finite subset of its P-isogeny class. The right side retains the component map C and does not assert independent reductions in forbidden components.

**Hypotheses:** Conditions are included in the statement.

**Proof or construction:**

1. Apply the continuous-test-function limit to indicators of each permitted finite fibre point.
2. Positive fibre measure gives eventual occurrence; combine finitely many points.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/joint-cm-equidistribution`.

**Source:** [cv-dynamics](https://webusers.imj-prg.fr/~christophe.cornut/papers/part2.pdf), Corollary 2.10; PDF pp.12. At finite level, the positive fibre masses and joint distribution force the actual Galois orbit to cover the prescribed fibre.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Indefinite primitive-character Heegner nonvanishing

**Declaration:** `indefinite_cm_character_point`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/indefinite-cm-character-point`.

In CV §4, require (H1) an Eichler order at P in a split B_P, (H2) maximal split level at primes ramifying in K, a P-new nonzero ω-isotypic quotient α:J_H→A, and good CM points x of conductor P^n. For n sufficiently large and fixed admissible χ₀, some χ∈P(n,χ₀) has e_χα(x)≠0 in the Mordell–Weil space tensored with the character field. Weighted traces are non-torsion, not merely nonzero torsion points.

**Hypotheses:** CV(H1),(H2), P-new quotient and good CM point; χ₀ω=1 on A_F×.

**Proof or construction:**

1. Raise the P-level to P² and prove weighted degeneracy injectivity in the P-new quotient.
2. Use finite tower torsion and joint supersingular reductions to make the weighted trace avoid every torsion value.
3. Apply the primitive-character averaging identity, with Appendix6 conductor relations.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/joint-cm-orbit-surjectivity`, `HeegnerPointEulerSystems:HE.8/cm-character-stratum`, `HeegnerPointEulerSystems:HE.2/nonmaximal-level-distribution`, `HilbertModularVarietiesAndShimuraCurves:R18.4`, `HeegnerPointEulerSystems:HE.8/relative-ring-class-tower-torsion-finite`.

**Source:** [cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Theorem 4.1; Theorem 4.10; Lemmas4.12–4.15 and Proposition 4.17; PDF pp.37,41–49. The P-new degeneracy argument and joint reduction orbit give a non-torsion weighted character point, after controlling torsion in the relative tower.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Definite primitive-character toric nonvanishing

**Declaration:** `definite_cm_character_period`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/definite-cm-character-period`.

For the definite quaternion algebra and CV(H1),(H2), a nonzero P-new vector θ in the Jacquet–Langlands representation of a nonexceptional pair (π,K), and a good CM point x at large conductor, some χ∈P(n,χ₀) has Σ_(σ∈G(n))χ(σ)θ(σx)≠0. Nonexceptionality is π≇π⊗η_(K/F); it cannot be suppressed.

**Hypotheses:** Definite parity, CV(H1),(H2), nonexceptional π, P-new θ, admissible χ₀ and good CM points.

**Proof or construction:**

1. Nonexceptionality makes the definite vector nonconstant on appropriate component fibres.
2. Use orbit surjectivity, then weighted ramified-prime degeneracy injectivity.
3. Project to exact-conductor characters using the P-new distribution relation.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/joint-cm-orbit-surjectivity`, `HeegnerPointEulerSystems:HE.8/cm-character-stratum`, `HeegnerPointEulerSystems:HE.2/nonmaximal-level-distribution`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `HilbertModularVarietiesAndShimuraCurves:R18.3`, `HilbertModularVarietiesAndShimuraCurves:R18.4`.

**Source:** [cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Proposition 5.6; Corollary 5.7; Proposition 5.8; Lemma 5.9; Theorem 5.10; PDF pp.55–58. Nonexceptionality and weighted degeneracy injectivity give a nonconstant toric function and a nonzero primitive-character period.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Cornut–Vatsal definite nonvanishing

**Declaration:** `definite_rankin_nonvanishing`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/definite-rankin-nonvanishing`.

With F,K,π,ω,P,N′,D as in cm-generic-root-number, |S| even and (π,K) nonexceptional, for every sufficiently large n there exists χ∈P(n,χ₀) with L(π,χ,1/2)≠0. This is existence within each fixed-torsion conductor stratum; it is not nonvanishing of all characters.

**Hypotheses:** Conditions are included in the statement.

**Proof or construction:**

1. Choose the source’s admissible quaternionic test vector and level.
2. Apply the definite geometric period theorem and imported Waldspurger identity, preserving local test factors.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/definite-cm-character-period`, `HeegnerPointEulerSystems:HE.8/cm-generic-root-number`, `GrossZagierAndArithmeticHeights:GZ.5`.

**Source:** [cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Theorem 1.4 and §5; PDF pp.6,50–58. The definite character-period theorem, with its central-character and vector hypotheses, gives a central-value nonvanishing character in each deep stratum.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration. The excluded exceptional pair π≃π⊗η is not an instance; fixed χ₀ and exact primitive conductor are retained.

### Cornut–Vatsal indefinite nonvanishing

**Declaration:** `cornut_vatsal_indefinite_nonvanishing`. **Packet identity:** `HeegnerPointEulerSystems:HE.8c/cornut-vatsal-nonvanishing-with-its-exact-hypotheses`.

Under the same initial CV data, assume |S| odd, ω=1, and N,D_(K/F),P pairwise coprime. For every sufficiently large n there exists χ∈P(n,χ₀) such that L′(π,χ,1/2)≠0. Use the geometric character-point theorem and the precise generalized Gross–Zagier identity. The definite branch has a separate node.

**Hypotheses:** ω=1; N,D,P pairwise coprime; |S| odd; χ₀ compatible with central character.

**Proof or construction:**

1. Apply the admissible indefinite geometry and non-torsion character projection.
2. Use positivity/nondegeneracy of the Néron–Tate height and the imported Gross–Zagier formula.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/indefinite-cm-character-point`, `HeegnerPointEulerSystems:HE.8/cm-generic-root-number`, `GrossZagierAndArithmeticHeights:GZ.8/general-quaternionic-gross-zagier-identity`.

**Source:** [cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Theorem 1.5 and §4; PDF pp.7,37–49. The indefinite point theorem feeds the height formula under the additional coprimality and trivial-central-character hypotheses, producing a nonzero derivative character.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration. A character of previous conductor is excluded even if its derivative is nonzero; existence is in P(n,χ₀).

### Cornut’s higher Heegner point theorem

**Declaration:** `cornut_tower_trace_nontorsion`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/cornut-tower-trace-nontorsion`.

In the classical modular Heegner setting with p∤N, the ring-class p-power tower contains a conductor for which the appropriate trace of the modular Heegner point to the anticyclotomic layer is non-torsion. Keep the finite torsion/trace quotient in Cornut’s statement. This does not require the Heegner point of conductor one to be non-torsion and does not say every trace is non-torsion.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used.

**Proof or construction:**

1. Specialize the distribution/non-torsion argument to F=ℚ and the modular quotient.
2. Pass through the finite ring-class torsion trace as in Howard’s use of Cornut.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/indefinite-cm-character-point`, `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`.

**Source:** [cornut](https://webusers.imj-prg.fr/~christophe.cornut/papers/mcinv.pdf), Introduction main theorem; PDF pp.2–3. The modular CM-trace result supplies an infinite-order trace somewhere in the tower, rather than nonvanishing of every character.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), Theorem 2.3.7, initial invocation of Cornut; PDF pp.34. The clean Howard proof invokes Cornut at this point; its p∤h_K/image hypotheses are not silently imposed on CGLS’s weaker class construction.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Non-torsion Λ-adic bottom class

**Declaration:** `lambda_bottom_class_nontorsion`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`.

For the actual ordinary Heegner family y∞ under E(K)[p]=0, Λy∞ is free of rank one and y∞ is not Λ-torsion. CGLS gives this nonzero family with the actual class-number conductor shifts. No completed main conjecture, full integral image or p∤h_K assumption is used for this assertion.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.

**Proof or construction:**

1. Use Cornut’s non-torsion trace and the recurrence comparison to make the inverse-limit module nonzero.
2. Use the CGLS class-number-shift adaptation and unit comparison to identify the nonzero normalized Λ-line.
3. For the weaker family use CGLS’s class-shift construction; do not import Howard’s clean divisibility beyond its scope.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `HeegnerPointEulerSystems:HE.8/cornut-tower-trace-nontorsion`, `PadicMeasuresIwasawaAlgebras:L4`.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1 and Remark 4.1.3; PDF pp.27–28. The non-torsion geometric tower input survives the coherent norm-family and unit comparison to give a non-torsion Iwasawa bottom class.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Λ-adic Heegner derivative class

**Declaration:** `lambdaDerivativeClass`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`.

For each squarefree allowed n, apply the imported derivative operator to Q[n] (or the normalized ordinary family), sum the finite ring-class torsion orbit, and descend its invariant Kummer class through the actual restriction isomorphism. Obtain κ^Λ_n in the generic Λ-adic Kolyvagin-system coefficient. Preserve the cyclic-Galois tensor and the finite/singular correction maps; the bottom is the specified Heegner Λ-line.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.

**Proof or construction:**

1. Reuse ES.3 derivatives and HE.4 choice-equivariant invariance.
2. Prove torsion invariants vanish under the stated tor/image hypotheses, then apply inflation–restriction.
3. Apply the imported continuous Iwasawa comparison; no algebraic discrete-cohomology replacement.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/universal-norm-heegner-family`, `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`, `HeegnerPointEulerSystems:HE.4/generator-tensor-choice-independence`, `EulerSystemsAndKolyvaginSystems:ES.3`, `EulerSystemsAndKolyvaginSystems:ES.8`.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), §2.3, construction following Lemma 2.3.3; PDF pp.30. The actual norm family is differentiated at auxiliary primes and descended using the coefficient ideal, restriction comparison and cyclic-Galois tensor.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28. Supplies the weaker E(K)[p]=0 construction and local verification; Howard’s strong image/class-number assumptions are retained only by Howard’s divisibility theorem.

**Uses:** Howard Lemmas2.3.4–2.3.6: localizes the actual derived classes. BCGS Lemma 1.1.5: compares their finite specializations.

**API:**

- `lambdaDerivativeClass_restrict` (projection): Restriction recovers the invariant differentiated Kummer class. Promoted as `HeegnerPointEulerSystems:HE.8/lambda-derivative-restriction`.
- `lambdaDerivativeClass_generator` (compatibility): Changing a cyclic generator transforms the class together with the specified tensor factor.
- `lambdaDerivativeClass_coefficients` (functoriality): Coefficient reduction commutes with the class when the quotient ideals are ordered correctly.
- `lambdaDerivativeClass_bottom` (simp): At empty auxiliary support, use the actual universal-norm Heegner bottom class.

**Acceptance examples:**

- `lambdaDerivativeClass_empty` (computation): The empty derivative acts as identity before the actual restriction inverse.
- `lambdaDerivativeClass_zero` (degenerate): A zero point family gives zero derivative class.
- `lambdaDerivativeClass_restriction_obstruction` (non-example): A noninjective restriction map with two distinct preimages forbids unique descent; the tor hypothesis cannot be omitted.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Λ-adic Heegner local conditions

**Declaration:** `lambda_heegner_local_conditions`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`.

The constructed derivative classes satisfy the transverse condition at ℓ|n, unramified condition away from pNn, and the prescribed propagated condition at bad primes. At v|p the image lies in the ordinary Fil⁺ condition. The proof treats finite decomposition at bad primes and finite ordinary-reduction torsion; it does not replace integral Kummer conditions by rational ones.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. Howard’s clean image hypothesis for the direct proof; weaker local verification uses the exact CGLS Theorem 4.1.1 adaptation.

**Proof or construction:**

1. Use HE.5 transverse ramification.
2. At bad primes dualize corestriction of local H² and keep prime-to-p local degrees.
3. At p prove the reduction Tate module vanishes for universal norms, then use duality/Herbrand finiteness.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`, `HeegnerPointEulerSystems:HE.5/heegner-transverse-local-condition`, `SelmerIwasawaCohomology:L3/universal-norms-unramified`, `SelmerIwasawaCohomology:L2/greenberg-condition`, `ArithmeticGaloisDuality:R02.4`, `HeegnerPointEulerSystems:HE.8/iwasawa-heegner-level-projection`, `HeegnerPointEulerSystems:HE.8/lambda-derivative-restriction`.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), Lemma 2.3.4; PDF pp.30–32. The local proof treats the auxiliary, bad and ordinary places separately, including the universal-norm argument at bad primes.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28. Supplies the weaker E(K)[p]=0 construction and local verification; Howard’s strong image/class-number assumptions are retained only by Howard’s divisibility theorem.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Λ-adic finite/singular Heegner compatibility

**Declaration:** `lambda_finite_singular_relation`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/lambda-finite-singular-relation`.

The corrected Λ-adic derivative system satisfies the generic finite/singular comparison at each allowed ℓ. Its arithmetic reduction congruence and the local χ_ℓ identification must commute with localization through the actual Galois change-of-group action. A merely local matrix is not a global G_K-equivariant coefficient endomorphism.

**Hypotheses:** Conditions are included in the statement.

**Proof or construction:**

1. Pass the CM reduction congruence through the inverse limit.
2. Use the inherited global χ localization square; retain its unresolved supplier gap explicitly.
3. Construct the corrected system, rather than claiming the raw derivatives already satisfy stronger relations.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`, `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`, `HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism`, `HeegnerPointEulerSystems:HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system`, `EulerSystemsAndKolyvaginSystems:ES.3`, `HeegnerPointEulerSystems:HE.8/lambda-derivative-restriction`.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), Lemmas2.3.5–2.3.6; PDF pp.32–34. The reciprocity/reduction comparison retains the Frobenius correction and coefficient depth needed by the finite-singular relation.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28. Supplies the weaker E(K)[p]=0 construction and local verification; Howard’s strong image/class-number assumptions are retained only by Howard’s divisibility theorem.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Unit comparison of Heegner normalizations

**Declaration:** `howard_stabilization_unit_comparison`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/howard-stabilization-unit-comparison`.

Howard’s universal-norm bottom and the ordinary stabilized family generate the same Λ-line: the comparison factor is u_Kα_p²(β_p−1)² when p splits, and u_Kα_p²(β_p²−1) when p is inert. Since β_p∈pℤ_p and u_K is a p-unit in the allowed discriminants, the factor is a unit. This comparison does not make Φ a unit.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.

**Proof or construction:**

1. Compute the two initial factors using X²−a_pX+p.
2. Check the β factors are units and retain u_K; compare Λ-spans.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/initial-euler-factor`, `HeegnerPointEulerSystems:HE.8/ordinary-stabilized-point`, `HeegnerPointEulerSystems:HE.8/universal-norm-heegner-family`, `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `mathlib:PadicInt.isUnit_iff`.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Remark 4.1.3; PDF pp.28. The two constructed families differ by the displayed u_K and β-unit factors; this does not make the original Artin factor a unit.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Howard’s anticyclotomic divisibility theorem

**Declaration:** `lambda_adic_heegner_kolyvagin_system_and_theorem_B`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/lambda-adic-heegner-kolyvagin-system-and-theorem-B`.

Under Howard’s TheoremA hypotheses, p odd good ordinary, p∤h_K, p,N,D_K pairwise coprime and G_K→GL₂(ℤ_p) surjective, S=H¹_FΛ(K,T⊗Λ) is Λ-torsion-free of rank one, and its discrete dual X is pseudo-isomorphic to Λ⊕M⊕M for a finitely generated torsion Λ-module M with char(M)=char(M)^ι. Moreover char(M) divides char(S/H), H the actual Heegner Λ-line. Equality and integral primitivity are not conclusions.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. G_K→GL₂(ℤ_p) surjective; p∤h_K; p,D_K,N pairwise coprime.

**Proof or construction:**

1. Verify H.0–H.5 and cartesian self-dual local conditions on height-one specializations.
2. Bound local/global control kernels uniformly as Q approaches a fixed P, including P=pΛ.
3. Use paired finite-DVR structure and the anticyclotomic functional equation to obtain the pseudo-isomorphism and one-sided bound.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`, `HeegnerPointEulerSystems:HE.8/lambda-finite-singular-relation`, `HeegnerPointEulerSystems:HE.8/howard-stabilization-unit-comparison`, `EulerSystemsAndKolyvaginSystems:ES.8`, `SelmerIwasawaCohomology:L3/iwasawa-descent`, `PadicMeasuresIwasawaAlgebras:L4`.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), TheoremB; Proposition 2.1.3; Lemma 2.2.7–Theorem 2.2.10; PDF pp.2–3,23,25–28. Height-one control and Kolyvagin specialization give rank one, paired torsion and a one-sided characteristic divisibility under Howard’s stronger hypotheses.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration. On scalar principal ideals (p) and (p²), the one-sided index bound can be strict; do not replace it by equality.

**Planet:** Howard’s divisibility theorem.

### Weaker torsion hypothesis and localized bound

**Declaration:** `weak_torsion_localized_divisibility`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/weak-torsion-localized-divisibility`.

Under ordinary Heegner conditions and E(K)[p]=0, the CGLS Heegner family exists and the rank-one paired-torsion bound holds over Λ[1/p,1/(γ−1)]. The augmentation inversion can be removed under the source’s extra corank-one condition. The BCS/CGS error-controlled bounds supply stronger assertions in their stated branches; class-number retention alone does not do so.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.

**Proof or construction:**

1. Repeat the construction with d(k) instead of k+1.
2. Import the weak residual error estimate with its exceptional primes; retain the localization exactly.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`, `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`, `EulerSystemsAndKolyvaginSystems:ES.8`.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorems4.1.1–4.1.2; PDF pp.27–28. The weakened family gives the stated localized divisibility; removal of augmentation inversion needs the additional corank condition.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Crystalline characters near the identity

**Declaration:** `nearTrivialCharacter`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/crystalline-near-trivial-character`.

Choose γ∈Γ, a p-adic unit u generating the prescribed subgroup, and h with γ^h equal to its Artin image. Let ξ_n(γ)=u^n have infinity type (hn,−hn). For m≥1 define α_m=ξ_(p−1)p^(m−1); these are nontrivial crystalline anticyclotomic characters congruent to1 modulo p^m and approach1. Retain h and the chosen embeddings. No finite-order character is substituted for these crystalline twists.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K.

**Proof or construction:**

1. Use the continuous character supplier and global algebraic Hecke-character construction.
2. Apply the p-adic unit-power congruence to u; keep its h-dependent infinity type.

**Dependencies:** `PadicMeasuresIwasawaAlgebras:L0a`, `PadicHodgeRegulators:L3`, `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`, `mathlib:PadicInt`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Definition 1.2.2; PDF pp.10–11. The split-prime crystalline construction produces nontrivial characters arbitrarily close to the identity; it is an example of, rather than the supplier for, general continuous characters.

**Uses:** BCGS Lemma 1.2.3 and Theorem 1.2.7: evaluates integral formulas at nontrivial crystalline characters approaching1. CS §3.3: supplies a split-prime example only; the general unramified CS route imports continuous near-trivial characters independently from L0a.

**API:**

- `nearTrivialCharacter_apply` (projection): α_m(γ)=u^((p−1)p^(m−1)), with its chosen Artin/infinity-type h.
- `nearTrivialCharacter_succ` (relation): α_(m+1)=α_m^p for m≥1.
- `nearTrivialCharacter_congruent` (compatibility): α_m≡1 modulo p^m, by the unit-power congruence. Promoted as `HeegnerPointEulerSystems:HE.8/near-trivial-character-congruence`.
- `nearTrivialCharacter_nontrivial` (characterisation): For non-torsion u, α_m is nontrivial for every m≥1; its limit is1, which is not a member.

**Acceptance examples:**

- `nearTrivialCharacter_first` (computation): For p=5,m=1 the exponent is4, not1 or5.
- `nearTrivialCharacter_next` (computation): For p=5,m=2 the exponent is20, exactly five times the first exponent.
- `nearTrivialCharacter_torsion_counterexample` (non-example): If the supplied character has order dividing p−1, α_1 is trivial; non-torsion and arithmetic construction hypotheses are essential.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Heegner specialization with the initial factor

**Declaration:** `near_trivial_heegner_specialization`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/near-trivial-heegner-specialization`.

If α≡1 modulo p^m and M(n)≥m, then κ^Λ_n(α)≡C_pκ_n^Heeg modulo p^m. Here C_p=(α_p−1)²(β_p−1)² for split p and C_p=Φ=(p+1)²−a_p² for inert p, in the prescribed normalization. The reduction exists because I_n⊂p^mℤ_p. C_p can be a nonunit; at split p its valuation is twice v_p(#Ẽ(𝔽_p)).

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. α is an anticyclotomic twist sufficiently close to1; M(n)≥m.

**Proof or construction:**

1. Project the universal-norm family to the initial level and compare HE.4 classes.
2. Use α≡1 and the quotient map allowed by M(n)≥m; compute augmentation of Φ.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`, `HeegnerPointEulerSystems:HE.8/howard-stabilization-unit-comparison`, `HeegnerPointEulerSystems:HE.4/coefficient-and-prime-set-compatibility`, `HeegnerPointEulerSystems:HE.8/universal-norm-level-zero`, `HeegnerPointEulerSystems:HE.8/lambda-derivative-restriction`, `PadicMeasuresIwasawaAlgebras:L0a`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Lemma 1.1.5 (split-prime branch); PDF pp.9. The finite and family derivative classes agree modulo the allowed depth after multiplication by the initial Euler factor; the two splitting types are distinguished.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Lemma 3.1.1 and equation (3.5), both unramified splitting types; PDF pp.12–13. The paragraph immediately before Lemma 3.1.1 introduces the specialized system; the lemma gives both split and inert congruences. Correct its printed ideal containment as source issue E2 records.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration. For I_n=(p³), reduction modulo p is permitted; reversing the ideal condition loses this valid case.

### Nonzero bottom classes near the identity

**Declaration:** `near_trivial_bottom_nonvanishing`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/near-trivial-bottom-nonvanishing`.

There is a neighbourhood of1 such that every nontrivial α in it has κ^Heeg_1(α)≠0. This follows from a non-Λ-torsion family and the finite zero set of a nonzero one-variable series. The specialization at α=1 is not included: its nonvanishing is equivalent to the appropriate analytic-rank-one condition.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.

**Proof or construction:**

1. Place the nonzero family in a finite free module after clearing its torsion-free denominators.
2. Use Weierstrass zero isolation and exclude1 explicitly.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`, `PadicMeasuresIwasawaAlgebras:L4`, `HeegnerPointEulerSystems:HE.8/iwasawa-heegner-level-projection`, `PadicMeasuresIwasawaAlgebras:L0a`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.1.6; PDF pp.10. A non-torsion Iwasawa class has nonzero sufficiently close nontrivial specializations; the identity may still be a zero.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Heegner divisibility profile

**Declaration:** `heegnerDivisibilityProfile`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/heegner-divisibility-profile`.

For the actual finite Heegner derivative system define M_r=min_(ν(n)=r) ind(κ_n), with values in ℕ∪{∞}; ind is the largest allowed p-divisibility in the coefficient module, and ind(0)=∞. Set M∞=inf_r M_r. Prime restrictions, coefficient ideals I_n and p-optimal parametrization are part of the data. M_0 is the bottom Heegner index and need not equal M∞.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.

**Proof or construction:**

1. Instantiate the generic ES.4 divisibility index in the actual coefficient quotients.
2. Take minima over the finite-support auxiliary set and the infimum over r; import rigidity before replacing the prime set.

**Dependencies:** `HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal`, `EulerSystemsAndKolyvaginSystems:ES.4`, `mathlib:Submodule.span`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Introduction definitions of M_r,M∞; §2.2; PDF pp.2–3,17–20. The divisibility minimum is taken over conductors with an exact number of auxiliary prime factors, and its limiting defect remains distinct from the bottom index.

**Uses:** BCGS TheoremB: measures the complete finite derivative system. CS TheoremC: compares its infimum with Tamagawa valuation.

**API:**

- `heegnerDivisibilityProfile_at` (projection): M_r is the infimum of the supplied actual indices at ν(n)=r.
- `heegnerDivisibilityProfile_bottom` (simp): At r=0 the only conductor is1, so M₀=ind κ₁.
- `heegnerDivisibilityProfile_top` (characterisation): M_r=∞ iff every permitted class at level r is zero, with empty strata giving∞.
- `heegnerDivisibilityProfile_rescale` (compatibility): Common p^t-rescaling adds t to indices when coefficient depth allows it; truncation at the quotient depth is retained.

**Acceptance examples:**

- `heegnerDivisibilityProfile_zero` (degenerate): The zero system has M_r=∞ for every r and M∞=∞.
- `heegnerDivisibilityProfile_bottom_vs_infimum` (non-example): A system with indices3 at conductor1 and1 at one-prime support has M₀=3 and M∞≤1.
- `heegnerDivisibilityProfile_sum_not_max` (computation): For indices2 and5 in one stratum the minimum is2; neither their sum nor maximum is the divisibility index.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Optimal and distinguished lattice comparison

**Declaration:** `optimal_lattice_isogeny_comparison`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/optimal-lattice-isogeny-comparison`.

For E₀ optimal on X₀(N), E₁ optimal on X₁(N), and the distinguished E_• with T_f identified integrally with T_pE_•, the prescribed isogeny E₀→E_• is étale at odd p. For sufficiently near-trivial α, I_•(α)C_•(α)=I₀(α)C₀(α), where I is the bottom-class index and C the finite-cokernel local index modulo torsion. Neither factor is individually asserted equal under arbitrary isogeny.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K.

**Proof or construction:**

1. Use the modular-symbol lattice and étale isogeny to identify Fil⁺ lattices.
2. Track the global index of the isogeny and cancel it against the localization-cokernel index.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `KatoEulerSystems:L4`, `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), §1.2.2 and Lemma 1.2.5; PDF pp.12. The distinguished modular-symbol lattice comparison preserves the global isogeny index and finite local cokernel.

**Source:** [wuthrich](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-19/12.pdf), Theorem 4, published p.385, proof pp.386–387. Distinguished modular-symbol lattice at odd semistable primes only. E₀→E_• at odd p is used in BCGS Lemma 1.2.5; arbitrary-isogeny or dyadic equality is not supplied.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Near-trivial logarithm index formula

**Declaration:** `twisted_logarithm_index_formula`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/twisted-logarithm-index-formula`.

With E_• and α sufficiently close to1, L_BDP(α⁻¹)≠0 and κ_1^•(α)≠0, let t_α=length_(ℤ_p^ur)(ℤ_p^ur/L_BDP(α⁻¹)), q_•=#H⁰(ℚ_p,E_•[p∞]), I_•=#(S_α/ℤ_pκ_1^•(α)), and C_•=#coker(loc_v) modulo torsion. Then p^tα q_•=I_•C_•. Use the source’s coefficient extension and square-root BDP normalization.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K.

**Proof or construction:**

1. Apply the family explicit reciprocity law with its integral regulator cokernel.
2. Use local duality to compute the H²/H⁰ correction and quotient the localization torsion.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/near-trivial-bottom-nonvanishing`, `HeegnerPointEulerSystems:HE.8/optimal-lattice-isogeny-comparison`, `GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class`, `PadicHodgeRegulators:L3`, `SelmerIwasawaCohomology:L3/semilocal-cohomology`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Lemma 1.2.3; PDF pp.11–12. The regulator index formula retains the chosen lattice, local invariant factor and specialization normalization.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Twisted anticyclotomic control formula

**Declaration:** `twisted_anticyclotomic_control`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/twisted-anticyclotomic-control`.

For m≫0 and α=α_m, a characteristic generator F_E of the strict-at-v, unrestricted-at-v̄ Greenberg dual satisfies #(ℤ_p/F_E(α⁻¹))=#Sha(W_α⁻¹/K)·C_α²·∏_(w|N)c_w^(p)(α⁻¹)·q_E². The finite Sha is the source’s propagated Selmer quotient. The formula is integral and uses all K-primes over N and the finite/torsion local cokernel.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K.

**Proof or construction:**

1. Request the exact generic specialization theorem and identify each arithmetic term.
2. Check near-trivial nonzero Euler factors and finite local/global kernels; account for both primes above each split bad prime.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/crystalline-near-trivial-character`, `HeegnerPointEulerSystems:HE.8/near-trivial-bottom-nonvanishing`, `SelmerIwasawaCohomology:L3/iwasawa-descent`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `HeegnerPointEulerSystems:HE.8/near-trivial-character-congruence`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.2.7 (JSW control theorem as used there); PDF pp.13–14. The ordinary-to-(0,empty) control formula retains the finite localization cokernel, local torsion square and K-prime Tamagawa product.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Tamagawa factors near the identity

**Declaration:** `near_trivial_tamagawa_stability`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/near-trivial-tamagawa-stability`.

For α≡1 modulo p^m the twisted local Tamagawa p-factor c_w^(p)(α) is congruent to the untwisted c_w^(p) modulo p^m. For m greater than the total relevant valuations this gives equality of the product of p-parts. Keep w|N over K; under the Heegner hypothesis its untwisted product is the square of the rational Tamagawa p-part.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.

**Proof or construction:**

1. Use the unramified-twist local determinant calculation.
2. Choose m above every valuation, then compare the p-parts and the two split K-places.

**Dependencies:** `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`, `NeronModelsAndSemistableAbelianVarieties:R11.2`, `PadicMeasuresIwasawaAlgebras:L0a`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Lemma 1.2.8; PDF pp.14. Congruences sufficiently deep compared with the relevant valuations preserve the p-primary Tamagawa terms at bad primes.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Uniform arithmetic Kolyvagin error bound

**Declaration:** `arithmetic_rescaled_kolyvagin_bound`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/arithmetic-rescaled-kolyvagin-bound`.

There exist M and E depending only on T_pE such that, for α≡1 modulo p^m with m≥M and a permitted deep-prime Kolyvagin system κ̃ for T_α with κ̃₁≠0, the dual Selmer group is ℚ_p/ℤ_p⊕M_α⊕M_α and length M_α≤ind(κ̃₁)+E. The constant does not grow with m, the deep-prime set or common p-rescaling. Under the source’s surjectivity hypothesis E=0.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.

**Proof or construction:**

1. Import generic error-tolerant descent from ES.4.
2. Verify the actual Tate representation/dual local conditions and uniform image/evaluation constants.
3. Check rescaled Heegner classes retain every transverse and finite/singular relation.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`, `HeegnerPointEulerSystems:HE.8/lambda-finite-singular-relation`, `EulerSystemsAndKolyvaginSystems:ES.4`, `HeegnerPointEulerSystems:HE.7/integral-tate-image-errors`, `HeegnerPointEulerSystems:HE.8/near-trivial-character-congruence`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.3.1 and its cited CGS proof; PDF pp.15. A common rescaling of the derivative collection permits the Kolyvagin bound with an error uniform in the scalar; the rescaling contract remains explicit.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Exact paired Selmer length for a Heegner system

**Declaration:** `heegner_exact_sha_length`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/heegner-exact-sha-length`.

For p>3, a surjective residual representation and the generic self-dual rank-one hypotheses, the specialized actual anticyclotomic Heegner system over a finite DVR R with κ₁≠0 gives length_R Sha(W_α/K)=2(M₀(α)−M∞(α)). No near-triviality is needed in the generic theorem; near-trivial α is used in the arithmetic application. The deep-prime restriction and rigidity hypotheses remain explicit. BCGS states Theorem 2.2.2 for p≥3 through Proposition 2.2.1, but its proof invokes Lemma 2.2.4, stated only for p>3. The p=3 proof extension remains a source gap.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. Residual G_Q representation surjective; R finite DVR; the source’s self-dual/cartesian hypotheses and κ₁≠0. p>3 for the verified proof route.

**Proof or construction:**

1. Import generic prime-restriction rigidity and uniform stub structure from ES.4.
2. Identify Heegner coefficient reductions and indices, then apply the exact paired-length formula.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/heegner-divisibility-profile`, `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`, `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`, `HeegnerPointEulerSystems:HE.8/lambda-finite-singular-relation`, `EulerSystemsAndKolyvaginSystems:ES.4`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Proposition 2.2.1; Theorem 2.2.2; Lemma 2.2.4; PDF pp.17–19. The uniform stub index identifies the exact paired finite Selmer length. The verified route uses p>3, because the proof imports the stronger-prime stub lemma.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Integral main conjecture and twisted index square

**Declaration:** `integral_main_conjecture_index_square`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/integral-main-conjecture-index-square`.

Assume the integral anticyclotomic Greenberg main conjecture in Λ^ur with the BCGS square-root convention. For α_m sufficiently close to1, the p-optimal curve satisfies I₀(α)²=#Sha(W_α⁻¹/K)·∏_(w|N)c_w^(p)(α⁻¹)·q₀⁴. A rational main conjecture supplies only a bounded p-power error; it does not supply this exact equality.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. Integral anticyclotomic Greenberg main conjecture and the p-optimal lattice.

**Proof or construction:**

1. Evaluate the integral characteristic ideal identity.
2. Substitute the logarithm and control equations, square the former, and cancel the nonzero local cokernel index.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/twisted-logarithm-index-formula`, `HeegnerPointEulerSystems:HE.8/twisted-anticyclotomic-control`, `HeegnerPointEulerSystems:HE.8/near-trivial-tamagawa-stability`, `HeegnerPointEulerSystems:HE.8/optimal-lattice-isogeny-comparison`, `ModularIwasawaMainConjectures:L0`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Corollary 1.2.12; Remark 1.2.11; PDF pp.14. Integral characteristic equality gives the exact specialization index square with the local torsion and Tamagawa factors; rational equality is insufficient.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### BCGS nonvanishing from the main conjecture

**Declaration:** `bcgs_conditional_kolyvagin_nonvanishing`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/bcgs-conditional-kolyvagin-nonvanishing`.

Under (Heeg),(disc),(tor), p odd good ordinary and split in K, the rational anticyclotomic main conjecture (indeed its required lower divisibility after inverting p) implies κ_n^Heeg≠0 for some squarefree n of allowed Kolyvagin primes. No analytic-rank-one hypothesis is made and κ₁ may vanish.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. Rational anticyclotomic main conjecture, kept as a theorem hypothesis.

**Proof or construction:**

1. Assume all finite derivative classes vanish. Choose m deep enough and rescale specialized classes by p^(t+v_p(C_p)).
2. Apply the uniform error bound to the rescaled system.
3. Compare with logarithm/control and the rational main-conjecture p-error; choose t exceeding half the Tamagawa length plus all fixed errors to contradict the bounds.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/near-trivial-heegner-specialization`, `HeegnerPointEulerSystems:HE.8/near-trivial-bottom-nonvanishing`, `HeegnerPointEulerSystems:HE.8/twisted-logarithm-index-formula`, `HeegnerPointEulerSystems:HE.8/twisted-anticyclotomic-control`, `HeegnerPointEulerSystems:HE.8/near-trivial-tamagawa-stability`, `HeegnerPointEulerSystems:HE.8/arithmetic-rescaled-kolyvagin-bound`, `HeegnerPointEulerSystems:HE.8/heegner-divisibility-profile`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), TheoremA and §2.1; PDF pp.2,15–16. The rational main conjecture and deep-prime comparison contradict total finite-system vanishing through the uniform rescaling bound.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration. The conclusion permits κ₁=0 and a class κ_n≠0 with n≠1. All-class nonvanishing and analytic-rank-one assumptions are forbidden.

**Planet:** BCGS nonvanishing theorem.

### BCGS refined divisibility from the integral conjecture

**Declaration:** `bcgs_conditional_refined_divisibility`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/bcgs-conditional-refined-divisibility`.

Assume p>3, surjective residual G_Q→GL₂(𝔽_p), good ordinary p split in K, (Heeg),(disc),(tor), a p-optimal parametrization, and the integral anticyclotomic main conjecture. Then M∞ of the finite Heegner system is finite and equals Σ_(ℓ|N)v_p(c_ℓ(E/ℚ)). This is half the sum over K-primes; it is neither M₀ nor the order of Sha.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual surjectivity; p-optimal parametrization; integral main conjecture.

**Proof or construction:**

1. Use integral index square and exact paired Sha length to compute M∞(α)=half the K-Tamagawa length+v_p(C_p).
2. Apply specialization congruence and deep-prime rigidity to strip the initial factor and recover the untwisted finite-system index.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/bcgs-conditional-kolyvagin-nonvanishing`, `HeegnerPointEulerSystems:HE.8/integral-main-conjecture-index-square`, `HeegnerPointEulerSystems:HE.8/heegner-exact-sha-length`, `HeegnerPointEulerSystems:HE.8/near-trivial-heegner-specialization`, `HeegnerPointEulerSystems:HE.8/near-trivial-tamagawa-stability`, `HeegnerPointEulerSystems:HE.8/heegner-divisibility-profile`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), TheoremB and §2.2; PDF pp.3,17–20. The integral conjecture and exact length/index comparison identify the limiting defect with the Tamagawa valuation sum under the stronger prime and residual hypotheses.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration. With each rational bad prime split in K, its two K-place valuations contribute twice the rational Tamagawa valuation; the stated M∞ is the rational sum.

**Planet:** Refined Kolyvagin divisibility theorem.

### Arithmetic strict ordinary Selmer complex comparison

**Declaration:** `strict_ordinary_selmer_complex`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/strict-ordinary-selmer-complex`.

For CS coefficients X=T⊗Λ and twists T_α, instantiate the imported Selmer complex as the cone of global cochains mapping to ⊕_(v|p)RΓ(K_v,X/X_v⁺) and ⊕_(v|N)Cone(RΓ_ur→RΓ). Its H¹ is the strict ordinary Selmer lattice S; its H² is related by Poitou–Tate to the all-p ordinary discrete dual X_Gr(A). This rank-one dual is distinct from BCS’s torsion (0,empty) Greenberg module.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p unramified in K.

**Proof or construction:**

1. Use the generic cone/local-condition complex rather than defining a new derived category.
2. Identify strict local conditions with the source’s ordinary cohomology and prove perfectness/base change at the exact coefficients.
3. Use Poitou–Tate to identify H² and finite local correction groups.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `SelmerIwasawaCohomology:L3/iwasawa-descent`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `ArithmeticGaloisDuality:D7`, `ModularIwasawaMainConjectures:L0`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), §3.2, equations (3.6)–(3.8), Theorem 3.2.1; PDF pp.13–14. The source’s cochain cone uses all-p strict ordinary conditions and gives the rank-one discrete-dual determinant setting.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Determinantal Heegner element

**Declaration:** `determinantalHeegnerElement`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/determinantal-heegner-element`.

Under the source’s rank-one and perfectness assumptions, use the canonical rational isomorphism Q(Λ)⊗det_Λ⁻¹ RΓ̃_f(K,T⊗Λ) ≃ Q(Λ)⊗(S⊗_Λ S^ι). Define z̃∞ as the inverse image of y∞⊗y∞ under this isomorphism. The main conjecture asserts z̃∞ generates the integral determinant lattice, not merely its rationalization.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p unramified in K; the source’s rational determinant comparison.

**Proof or construction:**

1. Apply the supplier determinant functor to the perfect Selmer complex.
2. Identify the rank-one rational factors by duality; pull back the actual Heegner tensor.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/strict-ordinary-selmer-complex`, `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`, `ModularIwasawaMainConjectures:L0`, `PadicMeasuresIwasawaAlgebras:L5`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Conjecture 3.2.2 and preceding determinant isomorphism; PDF pp.13–14. The rational determinant comparison lifts the actual Heegner tensor; integral lattice generation is the further conjectural assertion.

**Uses:** CS Proposition 3.2.3: tests basis of the integral determinant lattice. CS Proposition 3.3.2: transports the element to a twisted Selmer tensor.

**API:**

- `determinantalHeegnerElement_image` (projection): The rational determinant map sends z̃∞ to y∞⊗y∞ with the second factor ι-twisted. Promoted as `HeegnerPointEulerSystems:HE.8/determinantal-heegner-image`.
- `determinantalHeegnerElement_unique` (characterisation): It is the unique rational determinant preimage of that Heegner tensor.
- `determinantalHeegnerElement_rescale` (functoriality): Rescaling y∞ by a multiplies z̃∞ by a·ι(a), not merely a.
- `determinantalHeegnerElement_baseChange` (compatibility): Compatible derived base change and determinant comparison carry z̃∞ to the tensor of the specialized bottom classes.

**Acceptance examples:**

- `determinantalHeegnerElement_zero` (degenerate): The zero Heegner class gives the zero determinant element.
- `determinantalHeegnerElement_scalar_square` (computation): With identity involution and y rescaled by p, the element scales by p².
- `determinantalHeegnerElement_rational_not_basis` (non-example): Under the identity tensor comparison over ℤ, the Heegner determinant for (5,1) has coefficient 5 under ℤ⊗ℤ≃ℤ: nonzero after rationalization and a nonunit integrally. This tests the construction rather than an unrelated integer and catches an erroneous normalization to a basis.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Heegner determinant and characteristic ideals

**Declaration:** `determinant_characteristic_ideal_comparison`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/determinant-characteristic-ideal-comparison`.

The assertion that z̃∞ is an integral determinant basis is equivalent to char_Λ(S/Λy∞)·char_Λ(S/Λy∞)^ι=char_Λ(X_Gr(A)_tors) for the CS all-p ordinary dual. Writing a square requires the source’s ι-invariance; rational equality cannot certify an integral basis.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.

**Proof or construction:**

1. Compute determinants of torsion cohomology and the free rank-one factors.
2. Track ι on the second factor and compare lattices at every height-one prime.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/determinantal-heegner-element`, `HeegnerPointEulerSystems:HE.8/strict-ordinary-selmer-complex`, `PadicMeasuresIwasawaAlgebras:L4`, `PadicMeasuresIwasawaAlgebras:L5`, `HeegnerPointEulerSystems:HE.8/determinantal-heegner-image`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Proposition 3.2.3; PDF pp.14. The determinant-basis assertion is equivalent to the product of the Heegner-line index ideal and its involution transform equalling the torsion characteristic ideal.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration. A nonzero p-multiple of a determinant basis is a rational basis but not an integral basis.

### Ordinary local specialization defect

**Declaration:** `ordinary_local_specialization_defect`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/ordinary-local-specialization-defect`.

For near-trivial nontrivial α, the local finite/ordinary comparison at v|p contributes the p-part of #Ẽ(𝔽_v), identified with the corresponding H⁰(K_v,A_v⁻(α±)). Set L_p=∏_(v|p)#Ẽ(𝔽_v). For split p v_p(Φ)=v_p(L_p)=2v_p(#Ẽ(𝔽_p)); for inert p use #Ẽ(𝔽_(p²))=(p+1)²−a_p². Retain both signs of the twist.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p unramified in K; α sufficiently near1.

**Proof or construction:**

1. Use local duality on the ordinary exact sequence.
2. Stabilize Frobenius eigenvalues near1 and calculate the reduction cardinalities.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/initial-euler-factor`, `ArithmeticGaloisDuality:R02.4`, `NeronModelsAndSemistableAbelianVarieties:R11.5`, `PadicMeasuresIwasawaAlgebras:L0a`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Lemma 3.3.3 and proof of TheoremC; PDF pp.16–17. The local unramified ordinary-quotient invariants yield the specified reduction-group factors for both twist signs.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Specialized Heegner determinant lattice

**Declaration:** `determinant_specialization_lattice`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/determinant-specialization-lattice`.

For a continuous α:Γ→ℤ_p× with α≡1 modulo p^m, m≫0 and κ₁,Λ^Heeg(α)≠0, the source proves that both S_(α±1) are free of rank one. Then the specialized rational determinant map to S_α⊗S_α⁻¹ sends the integral determinant lattice, up to a ℤ_p-unit, to L_p²·Tam_E²·#X_BK(T_α*/K) times that tensor lattice. Here X_BK is the finite quotient of the propagated Selmer group in CS; for a general twist it need not be the Bloch–Kato group. Tam_E=∏_(ℓ|N)c_ℓ over ℚ.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p unramified in K; α continuous with α≡1 modulo p^m; κ₁,Λ^Heeg(α)≠0; m sufficiently large.

**Proof or construction:**

1. Compare strict and finite local-condition complexes through their exact triangles.
2. Use H¹ freeness, the dual H² description and the finite quotient by divisibility.
3. Compute local H⁰ and bad-prime terms, retaining the squared rational Tamagawa product.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/strict-ordinary-selmer-complex`, `HeegnerPointEulerSystems:HE.8/determinantal-heegner-element`, `HeegnerPointEulerSystems:HE.8/ordinary-local-specialization-defect`, `HeegnerPointEulerSystems:HE.8/near-trivial-tamagawa-stability`, `SelmerIwasawaCohomology:L3/iwasawa-descent`, `ArithmeticGaloisDuality:R02.4`, `PadicMeasuresIwasawaAlgebras:L5`, `HeegnerPointEulerSystems:HE.8/determinantal-heegner-image`, `PadicMeasuresIwasawaAlgebras:L0a`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Proposition 3.3.2; PDF pp.14–15. Actual proposition statement in §3.3, PDF pp.14–15, rather than the introductory mention. Its character need not be crystalline or split-prime; nonzero specialization gives both rank-one lattices.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Twisted index square from the determinant conjecture

**Declaration:** `determinantal_twisted_index_square`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/determinantal-twisted-index-square`.

If z̃∞ generates the integral Selmer determinant and α is sufficiently close to1 but nontrivial, then the square of the Heegner bottom index equals L_p² Tam_E² #X_BK(T_α*/K), up to a ℤ_p-unit (equivalently as p-valuations). The transported Φ comparison and unit normalization remain explicit.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. Integral determinantal main conjecture; p unramified in K.

**Proof or construction:**

1. Base change the integral determinant basis.
2. Use the specialization lattice formula and identify the two Heegner tensor factors under anticyclotomic duality.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/determinant-specialization-lattice`, `HeegnerPointEulerSystems:HE.8/determinantal-heegner-element`, `HeegnerPointEulerSystems:HE.8/near-trivial-bottom-nonvanishing`, `HeegnerPointEulerSystems:HE.8/near-trivial-heegner-specialization`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Corollary 3.3.4; PDF pp.16. An integral determinant generator, together with the specialized lattice formula, gives the exact twisted index square.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Castella–Sano refined conjecture equivalence

**Declaration:** `castella_sano_refined_equivalence`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/castella-sano-refined-equivalence`.

For p>3, residual G_Q surjectivity, good ordinary p unramified in K, (Heeg),(disc), and a parametrization whose Manin constant is prime to p, M∞=v_p(Tam_E) holds if and only if the integral determinantal Heegner main conjecture of CS3.2.2 holds. The theorem permits inert p; it does not prove that conjecture at inert p.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p>3; residual G_Q surjectivity; p unramified in K; p∤Manin constant.

**Proof or construction:**

1. Forward from the main conjecture: compute specialized index and exact Selmer length, then remove v_p(Φ)=v_p(L_p) using rigidity.
2. Reverse: use the Euler-system upper bound to locate z̃∞ integrally, compare sufficiently near-trivial specializations, and apply the exact SU3.2 separation criterion to show its lattice quotient is a unit.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/determinantal-twisted-index-square`, `HeegnerPointEulerSystems:HE.8/determinant-characteristic-ideal-comparison`, `HeegnerPointEulerSystems:HE.8/heegner-exact-sha-length`, `HeegnerPointEulerSystems:HE.8/near-trivial-heegner-specialization`, `HeegnerPointEulerSystems:HE.8/ordinary-local-specialization-defect`, `HeegnerPointEulerSystems:HE.8/arithmetic-rescaled-kolyvagin-bound`, `HeegnerPointEulerSystems:HE.8/heegner-divisibility-profile`, `PadicMeasuresIwasawaAlgebras:L4`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), TheoremC; §3.3 proof; PDF pp.4–5,16–17. The specialized determinant and exact finite-length identities prove both directions of the refined/main-conjecture equivalence, including the conditional inert case.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration. At inert p, supplying only geometric nonvanishing leaves the determinant conjecture hypothesis; no unconditional refined equality follows.

**Planet:** Castella–Sano equivalence theorem.

### Q[n]_0=ΦP[n]

**Declaration:** `universalNormFamily_level_zero`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/universal-norm-level-zero`.

For the family chosen from the fixed continuous projection and permitted auxiliary-trace data with simultaneous finite solvability, its actual bottom projection satisfies π[n](Q[n])=Φ[n]P[n]. This is the same interface as universalNormFamily_level_zero in the construction API.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. The conductor index I and permitted auxiliary-edge index J, their source/target maps, actual compact Hausdorff inverse-limit groups L[n], initial groups P[n], continuous bottom projections π[n], Artin-factor actions Φ[n], points P[n], continuous auxiliary traces tr[j], and scalars a[j] are fixed before choosing the family. Every finite list of bottom and auxiliary constraints has a simultaneous solution, as established by the common free-presentation argument; no uniqueness or surjectivity of arbitrary projections is assumed.

**Proof or construction:**

1. Take the bottom equation of the chosen point in the closed common constraint intersection, with the same maps, scalars and finite-solvability witness as the family construction.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/universal-norm-heegner-family`.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), Lemmas2.3.2–2.3.3; PDF pp.29–30. The proof lifts the initial Artin-factor multiple in a common free presentation, obtains coherent finite conductor families, and chooses a global family by compactness.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28. Supplies the weaker E(K)[p]=0 construction and local verification; Howard’s strong image/class-number assumptions are retained only by Howard’s divisibility theorem.

**Required boundary:** The map and its coefficient/tower/local-condition identifications are exactly those in the parent API; the signature is shared with that API item.

### Under Iwasawa–Shapiro, level k equals the Kummer class of y_k

**Declaration:** `heegnerIwasawaClass_level`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/iwasawa-heegner-level-projection`.

Under Iwasawa–Shapiro, level k equals the Kummer class of y_k.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.

**Proof or construction:**

1. Apply the defining construction and the exact supplied projection/comparison, with the arithmetic identifications in the parent node.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1 and Remark 4.1.3; PDF pp.27–28. Integral Kummer and the tower cohomology comparison transport the compatible point family into the stated ordinary Iwasawa Selmer group.

**Required boundary:** The map and its coefficient/tower/local-condition identifications are exactly those in the parent API; the signature is shared with that API item.

### Restriction recovers the invariant differentiated Kummer class

**Declaration:** `lambdaDerivativeClass_restrict`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/lambda-derivative-restriction`.

Restriction recovers the invariant differentiated Kummer class.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0.

**Proof or construction:**

1. Apply the defining construction and the exact supplied projection/comparison, with the arithmetic identifications in the parent node.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), §2.3, construction following Lemma 2.3.3; PDF pp.30. The actual norm family is differentiated at auxiliary primes and descended using the coefficient ideal, restriction comparison and cyclic-Galois tensor.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation; PDF pp.27–28. Supplies the weaker E(K)[p]=0 construction and local verification; Howard’s strong image/class-number assumptions are retained only by Howard’s divisibility theorem.

**Required boundary:** The map and its coefficient/tower/local-condition identifications are exactly those in the parent API; the signature is shared with that API item.

### α_m≡1 modulo p^m, by the unit-power congruence

**Declaration:** `nearTrivialCharacter_congruent`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/near-trivial-character-congruence`.

α_m≡1 modulo p^m, by the unit-power congruence.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K.

**Proof or construction:**

1. Apply the defining construction and the exact supplied projection/comparison, with the arithmetic identifications in the parent node.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/crystalline-near-trivial-character`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Definition 1.2.2; PDF pp.10–11. The split-prime crystalline construction produces nontrivial characters arbitrarily close to the identity; it is an example of, rather than the supplier for, general continuous characters.

**Required boundary:** The map and its coefficient/tower/local-condition identifications are exactly those in the parent API; the signature is shared with that API item.

### The rational determinant map sends z̃∞ to y∞⊗y∞ with the second factor ι-twisted

**Declaration:** `determinantalHeegnerElement_image`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/determinantal-heegner-image`.

The rational determinant map sends z̃∞ to y∞⊗y∞ with the second factor ι-twisted.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p unramified in K; the source’s rational determinant comparison.

**Proof or construction:**

1. Apply the defining construction and the exact supplied projection/comparison, with the arithmetic identifications in the parent node.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/determinantal-heegner-element`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Conjecture 3.2.2 and preceding determinant isomorphism; PDF pp.13–14. The rational determinant comparison lifts the actual Heegner tensor; integral lattice generation is the further conjectural assertion.

**Required boundary:** The map and its coefficient/tower/local-condition identifications are exactly those in the parent API; the signature is shared with that API item.

### Finite torsion in the relative ring-class tower

**Declaration:** `relative_ring_class_tower_torsion_finite`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/relative-ring-class-tower-torsion-finite`.

For the CV relative CM tower K[P^∞]/K and an abelian variety A/K, A(K[P^∞])_tors is finite. Choose two good-reduction places of K above distinct residue characteristics and primes Q≠P of F that do not split in K. CV Lemma 2.7 bounds their local extension degrees in the tower; prime-to-residue-characteristic reduction injectivity at these two places bounds all torsion. This is a statement about this tower, not torsion over every abelian extension.

**Hypotheses:** F totally real, K/F CM, P a fixed finite prime, and the relative ring-class tower and its reciprocity identification of HE.0. A/K an abelian variety; choose two distinct residue characteristics away from P and the bad reduction set.

**Proof or construction:**

1. Use CV Lemma 2.7 to prove the finite decomposition-group claim from the relative idele/class-field quotient; use Chebotarev and finite avoidance to choose two suitable nonsplit good places.
2. The local extensions are unramified of bounded degree, so their reduction groups lie over fixed finite residue extensions.
3. Inject prime-to-residue-characteristic torsion at each place into the finite reduction group. With two distinct characteristics these bounds cover every primary part and prove finiteness.

**Dependencies:** `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `NeronModelsAndSemistableAbelianVarieties:R11.5`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Source:** [cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Lemma 2.7 and proof of Proposition 4.4, PDF pp.22,38; used again before Corollary 4.18. Lemma 2.7 is the finite-local-degree input; Proposition 4.4 explicitly deduces finiteness of tower torsion. The two-good-place reduction argument supplies the arithmetic explanation.

**Required boundary:** Use the actual relative ring-class extension and residue fields; no Faltings/Tate semisimplicity theorem or general open-image assumption substitutes for this argument.

## HE.8b declaration inventory

### BDP square-root convention comparison

**Declaration:** `bdp_function_convention_comparison`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/bdp-function-convention-comparison`.

After the same coefficient extension and primitive/imprimitive local normalizations, BCS’s single-power anticyclotomic L-function generates the same ideal as (L_BDP^BCGS)² in Λ^ur. Period/unit conventions are compared as ideals, not by arbitrary exact equality of functions. All nonunit Euler factors in changes of local condition remain visible.

**Hypotheses:** Conditions are included in the statement.

**Proof or construction:**

1. Import the BDP construction and coefficient convention from GZ.9.
2. Align both source conventions and their Euler factors before comparing generated ideals.

**Dependencies:** `GrossZagierAndArithmeticHeights:GZ.9/bdp-square-root-comparison`, `GrossZagierAndArithmeticHeights:GZ.9/imprimitive-function-dictionary`, `AutomorphicPadicLFunctions:L3h`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.2.1 and Conjecture 1.2.10; PDF pp.10,14. The BDP interpolation and Greenberg conjecture provide the square-root convention on the BCGS side; the other source supplies its squared-function convention.

**Source:** [bcs](https://arxiv.org/pdf/2405.00270v2), Conjecture 1.2.1, following Remark 1.2.3, and Theorem 1.2.4; PDF pp.3. BCS uses the squared BDP distribution as its single-power function; 1.2.3 is a remark, not a conjecture. Compare ideals only after the GZ.9 normalization gap is discharged.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Anticyclotomic main-conjecture comparison

**Declaration:** `anticyclotomic_formulation_comparison`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison`.

In the classical N⁻=1 split ordinary setting with p>3 and H⁰(G_K,E[p])=0, the integral Heegner-index divisibility char(X_tors) ⊃ char(S/Λy∞)² is equivalent to the corresponding Greenberg/BDP divisibility char(X_(0,empty))Λ^ur ⊃ (L_BDP²), with the reverse divisibilities also equivalent (BCK Theorem 5.2). Retain the coefficient extension, finite local cokernels, ι and nonunit Euler factors. This comparison does not itself prove either divisibility. Separately, CGLS Proposition 4.2.1 proves the analogous comparison after inverting p under E(K)[p]=0 for odd p. The general weak-torsion p=3 integral extension is not certified; an exact integral comparison must be supplied before using that extension.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. For the integral statement p>3; for the rational CGLS variant p is odd and both characteristic ideals are extended to Λ⊗ℚ_p.

**Proof or construction:**

1. Instantiate the supplier’s four-term Poitou–Tate comparison and explicit reciprocity.
2. Identify the primitive anticyclotomic Heegner and Greenberg terms and clear only the stated units.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`, `HeegnerPointEulerSystems:HE.8/twisted-logarithm-index-formula`, `HeegnerPointEulerSystems:HE.8b/bdp-function-convention-comparison`, `SelmerIwasawaCohomology:L2/change-of-conditions`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `PadicHodgeRegulators:L3`, `ModularIwasawaMainConjectures:L0`.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Proposition 4.2.1 (rational comparison); PDF pp.28–29. Both opposite divisibilities, only in Λ⊗ℚ_p. This is not the BCS two-variable comparison and does not by itself certify the integral statement.

**Source:** [bck](https://web.math.ucsb.edu/~castella/PRconj-print.pdf), Theorem 5.2 and proof, published pp.1646–1647; standing p>3 and §5 split-prime hypotheses; PDF pp.20–21. Integral Heegner/BDP comparison in both directions; use N⁻=1, the exact strict/unrestricted dictionary and H⁰=0. Non-anomalous, surjectivity and Hypothesis ♥ belong to Theorem 5.1, not Theorem 5.2.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Auxiliary quadratic fields for BCS descent

**Declaration:** `auxiliary_quadratic_field_verification`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/auxiliary-quadratic-field-verification`.

For the BCS irreducible branch, choose the auxiliary real quadratic F with p inert, D_F odd and every D_F-prime split in K; for ℓ|N choose ℓ inert in F when ℓ≡−1 modulo p and split otherwise. Retain irreducibility after restricting to G_(FK) and G_(F(ζ_p)), the p=5 exceptional real field exclusion and finite discriminant avoidance. These are the precise hypotheses used by the Hilbert/quartic-CM supplier.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; E[p] irreducible over G_Q; the source’s auxiliary-field and Fujiwara(H1)–(H3) assumptions.

**Proof or construction:**

1. Use simultaneous splitting and finite-avoidance Chebotarev.
2. Check the residual dihedral possibilities and restriction conditions before invoking Wan/Fujiwara.
3. Verify every source condition, including the discarded p=5 field.

**Dependencies:** `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `AutomorphicCongruences:L5w`.

**Source:** [bcs](https://arxiv.org/pdf/2405.00270v2), Proposition 5.2.1; Lemma 5.2.3; PDF pp.9–11. The auxiliary real quadratic field is selected with the stated local restrictions and residual disjointness; the p=5 exclusion remains attached.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Heegner Euler-system divisibility for BCS

**Declaration:** `anticyclotomic_euler_system_divisibility`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/anticyclotomic-euler-system-divisibility`.

Under p odd ordinary, (Heeg),(disc) and E[p] irreducible over G_K, the actual Heegner family gives rank one and char(X_tors) ⊃ char(S/Λy∞)² after inverting p. In the split case the equivalent Greenberg/BDP bound holds. Under residual G_Q surjectivity the bounds are integral. This is the weak-hypothesis CGS/BCS bound, not Howard B with its hypotheses silently removed.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E[p] irreducible over G_K; integral branch additionally has G_Q residual surjectivity.

**Proof or construction:**

1. Use the exact weaker residual arithmetic hypotheses and imported Λ-adic error bound.
2. Pass paired torsion structure through the normalized Heegner line and formulate the matching Greenberg bound.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`, `HeegnerPointEulerSystems:HE.8/lambda-finite-singular-relation`, `HeegnerPointEulerSystems:HE.8/arithmetic-rescaled-kolyvagin-bound`, `EulerSystemsAndKolyvaginSystems:ES.8`, `HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison`.

**Source:** [bcs](https://arxiv.org/pdf/2405.00270v2), Theorem 4.2.1 (using CGS Theorem 5.5.2); PDF pp.8–9. The two-variable Euler-system bound is imported at the source’s precise local conditions and then used in the anticyclotomic return.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### BCS anticyclotomic reverse divisibility

**Declaration:** `anticyclotomic_reverse_product_divisibility`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/anticyclotomic-reverse-product-divisibility`.

For the chosen auxiliary F, the imported Wan/Fujiwara quartic-CM theorem, shared two-variable restriction/factorization, and anticyclotomic projection imply the reverse product divisibility for E/K and E^F/K against their BDP functions. Specialize the Greenberg local conditions exactly as in BCS §5, and obtain individual reverse divisibilities by combining the opposite Euler-system bounds and cancelling nonzero factors. Integral cancellation uses μ=0 and the source’s period/regulator hypotheses.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; irreducible residual G_Q representation; all auxiliary-field and period hypotheses of the suppliers.

**Proof or construction:**

1. Import the two-variable Selmer restriction and p-adic L-function product factorization.
2. Project to the anticyclotomic quotient using the stated local-condition comparison and μ-vanishing.
3. Combine nonzero product divisibility with the two individual opposite bounds; cancel in the integral domain and upgrade under surjectivity.

**Dependencies:** `HeegnerPointEulerSystems:HE.8b/auxiliary-quadratic-field-verification`, `HeegnerPointEulerSystems:HE.8b/anticyclotomic-euler-system-divisibility`, `HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison`, `HeegnerPointEulerSystems:HE.8b/bdp-function-convention-comparison`, `AutomorphicCongruences:L5a`, `AutomorphicCongruences:L5w`, `AutomorphicPadicLFunctions:L3h`, `PadicMeasuresIwasawaAlgebras:L4`.

**Source:** [bcs](https://arxiv.org/pdf/2405.00270v2), §5.1–§5.3; Proposition 5.2.1; proof of Theorems1.2.2/1.2.4; PDF pp.9–11. The Wan/Fujiwara comparison is projected, combined with factorization and μ/control inputs, and cancelled only after the required nonzero factors are established.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Rational Heegner-point main conjecture

**Declaration:** `rational_heegner_main_conjecture`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/rational-heegner-main-conjecture`.

For p>3 good ordinary, (disc),(Heeg),(spl), and E[p] irreducible over G_Q, S and X have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λy∞)² in Λ[1/p]. No analytic-rank condition, p∤h_K assumption or residual surjectivity is added; integrality is a different branch.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; E[p] irreducible over G_Q.

**Proof or construction:**

1. Complete the opposite-divisibility cancellation and translate the normalized family line.
2. Record rank one with the paired torsion convention and keep p inverted.

**Dependencies:** `HeegnerPointEulerSystems:HE.8b/anticyclotomic-reverse-product-divisibility`, `HeegnerPointEulerSystems:HE.8b/anticyclotomic-euler-system-divisibility`, `HeegnerPointEulerSystems:HE.8/howard-stabilization-unit-comparison`.

**Source:** [bcs](https://arxiv.org/pdf/2405.00270v2), Theorem 1.2.2(a); PDF pp.3. Opposite divisibilities yield the Heegner equality after inverting p under the residual-irreducibility branch.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration. A residual irreducible but nonsurjective example falls only under the rational statement; p-primary ideal discrepancies are not removed.

**Planet:** Rational Heegner main conjecture.

### Integral Heegner-point main conjecture

**Declaration:** `integral_heegner_main_conjecture`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/integral-heegner-main-conjecture`.

For the same ordinary split setting with p>3 and residual G_Q→GL₂(𝔽_p) surjective, S and X have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λy∞)² integrally in Λ. The integral period, μ and generic descent hypotheses are those verified in the BCS supplier chain.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual G_Q representation surjective.

**Proof or construction:**

1. Use integral opposite divisibilities and unit normalization.
2. Verify the absence of a residual p-power error at the μ component.

**Dependencies:** `HeegnerPointEulerSystems:HE.8b/anticyclotomic-reverse-product-divisibility`, `HeegnerPointEulerSystems:HE.8b/anticyclotomic-euler-system-divisibility`, `HeegnerPointEulerSystems:HE.8/howard-stabilization-unit-comparison`.

**Source:** [bcs](https://arxiv.org/pdf/2405.00270v2), Theorem 1.2.2(b); PDF pp.3. The integral opposite divisibilities yield the Heegner equality under the residual-surjectivity branch.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration. An extra p-factor in the index or characteristic ideal violates the integral equality even if rational equality holds.

**Planet:** Integral Heegner main conjecture.

### Rational Greenberg–BDP main conjecture

**Declaration:** `rational_greenberg_bdp_main_conjecture`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/rational-greenberg-bdp-main-conjecture`.

Under the rational Heegner main-conjecture hypotheses, X_(0,empty) is Λ-torsion and char_Λ(X_(0,empty))Λ^ur=(L_BDP²) in Λ^ur[1/p], where L_BDP is BCGS’s square-root function. This torsion module is not CS’s all-p ordinary rank-one dual.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual irreducibility over G_Q.

**Proof or construction:**

1. Apply the exact formulation comparison and source-normalization dictionary.

**Dependencies:** `HeegnerPointEulerSystems:HE.8b/rational-heegner-main-conjecture`, `HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison`, `HeegnerPointEulerSystems:HE.8b/bdp-function-convention-comparison`.

**Source:** [bcs](https://arxiv.org/pdf/2405.00270v2), Theorem 1.2.4(a); PDF pp.3. The exact formulation dictionary transfers the rational Heegner equality to the Greenberg ideal of the squared BDP function.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Planet:** Rational Greenberg–BDP theorem.

### Integral Greenberg–BDP main conjecture

**Declaration:** `integral_greenberg_bdp_main_conjecture`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/integral-greenberg-bdp-main-conjecture`.

Under the integral Heegner main-conjecture hypotheses, X_(0,empty) is Λ-torsion and char_Λ(X_(0,empty))Λ^ur=(L_BDP²) integrally. The coefficient ring Λ^ur and p-primary content are retained.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual G_Q surjectivity.

**Proof or construction:**

1. Apply the integral formulation comparison, preserving all nonunit factors.

**Dependencies:** `HeegnerPointEulerSystems:HE.8b/integral-heegner-main-conjecture`, `HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison`, `HeegnerPointEulerSystems:HE.8b/bdp-function-convention-comparison`.

**Source:** [bcs](https://arxiv.org/pdf/2405.00270v2), Theorem 1.2.4(b); PDF pp.3. The integral formulation dictionary transfers the integral Heegner equality with the same coefficient and period normalizations.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Planet:** Integral Greenberg–BDP theorem.

### Eisenstein anticyclotomic theorem interface

**Declaration:** `eisenstein_main_conjecture_adapter`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/eisenstein-main-conjecture-adapter`.

For CGS Theorem C, E/ℚ has a rational p-isogeny with kernel character φ, p∤2N, K satisfies (disc),(Heeg),(spl), and φ|_(G_p)≠1,ω. Its integral Heegner/Greenberg equality, in the agreed coefficient and BDP conventions, supplies BCGS Theorem 1.2.13(i). This is an adapter of the independently supplied theorem, not a duplicate proof or an extension to excluded local characters.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. A rational p-isogeny with kernel character φ and φ|G_p≠1,ω; p∤2N and (disc),(Heeg),(spl). No analytic-rank-one (Sel) hypothesis is added.

**Proof or construction:**

1. Import the independent early Eisenstein proof from BSD.7a.
2. Compare the bottom Λ-line and the BDP square convention; preserve every residual local exclusion.

**Dependencies:** `RankZeroOneBSD:BSD.7a`, `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `HeegnerPointEulerSystems:HE.8b/bdp-function-convention-comparison`, `HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.2.13(i), citing CGS TheoremsA/C; PDF pp.14. The branch list invokes the independent CGS Eisenstein theorem at its excluded-local-character scope.

**Source:** [cgs](https://web.math.ucsb.edu/~castella/Mazur.pdf), Theorem C and ensuing Greenberg reformulation, author copy pp.3–4; PDF pp.3–4. Integral anticyclotomic equality without the older (Sel) condition. Theorem A is the cyclotomic consequence; Theorem C is the early supplier needed here.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

**Planet:** Anticyclotomic Eisenstein main conjecture.

### Split-prime Kolyvagin nonvanishing branches

**Declaration:** `split_kolyvagin_nonvanishing_branches`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/split-kolyvagin-nonvanishing-branches`.

BCGS finite-system nonvanishing is unconditional in each acquired main-conjecture branch: (i) the requested CGS Eisenstein local-character branch; (ii) p>3 and residual G_Q irreducibility; (iii) p>3 and residual surjectivity. In each case apply the conditional TheoremA with the exact branch hypotheses. No p=3 irreducible branch is inferred from BCS.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K.

**Proof or construction:**

1. Discharge only the rational main-conjecture hypothesis via the matching branch.
2. Keep the different local and residual conditions attached to each corollary.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/bcgs-conditional-kolyvagin-nonvanishing`, `HeegnerPointEulerSystems:HE.8b/rational-greenberg-bdp-main-conjecture`, `HeegnerPointEulerSystems:HE.8b/integral-greenberg-bdp-main-conjecture`, `HeegnerPointEulerSystems:HE.8b/eisenstein-main-conjecture-adapter`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.2.13 and TheoremA; PDF pp.2,14–16. The acquired main-conjecture branches discharge the conditional nonvanishing theorem with their separate residual and prime hypotheses.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Split-prime refined Kolyvagin divisibility

**Declaration:** `split_refined_kolyvagin_divisibility`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/split-refined-kolyvagin-divisibility`.

For p>3 residual G_Q surjective, ordinary split Heegner setting and p-optimal parametrization, M∞=Σ_(ℓ|N)v_p(c_ℓ(E/ℚ)). The integral BCS theorem discharges the conditional TheoremB; rational irreducibility alone does not discharge it.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual surjectivity; p-optimal parametrization.

**Proof or construction:**

1. Import integral Greenberg equality and apply the arithmetic conditional theorem.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/bcgs-conditional-refined-divisibility`, `HeegnerPointEulerSystems:HE.8b/integral-greenberg-bdp-main-conjecture`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), TheoremB and Theorem 1.2.13(iii); PDF pp.3,14,19–20. The integral surjective split-prime branch discharges the conditional refined-divisibility theorem.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

### Split determinantal Heegner main conjecture

**Declaration:** `split_determinantal_heegner_main_conjecture`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/split-determinantal-heegner-main-conjecture`.

In the CS TheoremC setting with p split in K, the integral BCS Heegner main conjecture and determinant/characteristic comparison show z̃∞ generates its integral Selmer determinant. Consequently the refined finite Heegner index equals v_p(Tam_E). For inert p the main-conjecture hypothesis is still unproved by this chain.

**Hypotheses:** E/ℚ is modular with conductor N, K imaginary quadratic, all primes dividing N split in K, signed discriminant D_K<0 odd and not −3; p is odd and prime to ND_K, and E has good ordinary reduction at p. T=T_pE, Γ=Gal(K∞/K)≃ℤ_p, Λ=ℤ_p⟦Γ⟧, ι(γ)=γ⁻¹; imported continuous cohomology and propagated self-dual local conditions are used. E(K)[p]=0. p splits as v v̄ in K. p>3; residual surjectivity; p∤Manin constant.

**Proof or construction:**

1. Translate the integral characteristic equality to the determinant formulation.
2. Apply the CS equivalence with its Manin and residual hypotheses.

**Dependencies:** `HeegnerPointEulerSystems:HE.8b/integral-heegner-main-conjecture`, `HeegnerPointEulerSystems:HE.8/determinant-characteristic-ideal-comparison`, `HeegnerPointEulerSystems:HE.8/castella-sano-refined-equivalence`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), TheoremC; Proposition 3.2.3; PDF pp.4–5,14. The split-prime integral Heegner equality and determinant comparison discharge the determinant formulation under the refined theorem’s hypotheses.

**Required boundary:** Retain every coefficient, local condition and arithmetic hypothesis stated here; compare the source locator before using the declaration.

## Exact supplier contracts

Each request is an open proof/interface boundary. The named arithmetic export must satisfy the complete contract; a stage title alone does not discharge it.

- **`PadicMeasuresIwasawaAlgebras:L1`:** Completed group-ring inverse limits and the actual compact Λ-modules H_k[n], retaining the finite ring-class groups G(n), their Artin actions, the separate first-step degree group Δ, and class-group p-parts.
- **`PadicMeasuresIwasawaAlgebras:L5`:** Compact inverse-limit lifting with compatible auxiliary norm maps; determinant/base-change exactness for a perfect ordinary Selmer complex, including non-flat specialization correction terms.
- **`PadicMeasuresIwasawaAlgebras:L4`:** One-variable Weierstrass zero isolation, pseudo-isomorphism/characteristic ideals with ι, and the exact near-trivial specialization separation criterion used by CS via SU Lemma 3.2. Infinitely many accumulating evaluations alone do not justify an integral unit assertion.
- **`PadicMeasuresIwasawaAlgebras:L0a`:** Continuous arithmetic anticyclotomic character spaces and evaluation with the chosen γ,u,h; the crystalline algebraic-Hecke characters α_m must retain infinity type (h(p−1)p^(m−1),−h(p−1)p^(m−1)). Separately export continuous nontrivial Γ≃ℤ_p characters tending to 1, with α≡1 modulo p^m, for CS §3.3–§3.4 at every unramified p. This sequence does not assert algebraic-Hecke origin or crystallinity at inert p.
- **`PadicHodgeRegulators:L3`:** Ordinary filtration and unit root; integral family big logarithm with explicit finite cokernel and CH2018 Theorem 5.7 Heegner reciprocity, at the exact anticyclotomic coefficients and chosen lattice. Do not infer the full family law from a finite point formula. Certify the BCGS local invariant/unit-root normalization on the distinguished lattice, distinguishing full T/A invariants from the ordinary unramified quotient and reduction torsion.
- **`EulerSystemsAndKolyvaginSystems:ES.3`:** The general Λ-adic derivative/finite-singular system with cyclic Galois tensor, actual coefficient quotients and change-of-generator functoriality. HE supplies the arithmetic family and verifies the relations.
- **`EulerSystemsAndKolyvaginSystems:ES.4`:** BCGS Proposition 2.2.1 prime-restriction rigidity, Lemma 2.2.4 uniform stub structure and Theorem 2.2.2 exact paired Sha length, with finite DVR, p>3 for the Lemma 2.2.4/exact-length proof; Proposition 2.2.1 separately states p≥3, residual surjectivity and self-dual/cartesian hypotheses; also the rescaling-stable bounded-error variant used in Theorem 1.3.1. These generic proofs are owned here, not copied into HE.
- **`EulerSystemsAndKolyvaginSystems:ES.8`:** Height-one Λ-adic Kolyvagin specialization and uniform control errors, paired torsion and anticyclotomic functional equation. Export distinct clean Howard and weaker CGS/BCS residual branches; the latter has rational p-errors unless surjectivity gives integral control.
- **`HilbertModularVarietiesAndShimuraCurves:R18.1`:** Admissible quaternionic CM moduli and component maps in CV-dynamics §§2.1–2.2, including the definite/indefinite datum and exact reciprocity action.
- **`HilbertModularVarietiesAndShimuraCurves:R18.2`:** Quaternionic CM reduction maps at the actual auxiliary supersingular places and compatibility with component/reciprocity maps in CV-dynamics Theorem 2.9.
- **`HilbertModularVarietiesAndShimuraCurves:R18.3`:** Definite finite double-coset realization and P-new vectors at the admissible level in CV §5; retain central character, stabilizers and nonexceptionality.
- **`HilbertModularVarietiesAndShimuraCurves:R18.4`:** Weighted P-new and ramified-prime degeneracy injectivity on the precise cuspidal quotient/vector in CV §§4.3–4.5 and §5. Arithmetic character/conductor projections remain HE-owned.
- **`GeometryOfNumbersAndQuadraticArithmetic:GN.4`:** Extend beyond current real Lie-group Ratner nodes: over F_P, classify/average unipotent orbits in products of cocompact SL₂(F_P) quotients as CV-dynamics Theorem 2.29 (Margulis–Tomanov11.2/Ratner3); give twisted-diagonal stabilizers as Lemma 2.30 and partition/commensurability criterion2.31–2.35. Q_p is the directly referenced Ratner case; general finite F_P requires a precise acquired theorem, not extrapolation.
- **`GL2AutomorphicRepresentationsAndTransfer:R17.3`:** Jacquet–Langlands transfer and P-new test vectors with CV(H1),(H2), admissible definite parity and nonexceptionality. Retain local conductor conditions, not merely existence of a transferred representation.
- **`GrossZagierAndArithmeticHeights:GZ.4`:** The exact parallel-weight-two CM local sign formula used in CV Lemma 1.1, retaining N′ coprime to D and the moving P-character factor before stabilization.
- **`KatoEulerSystems:L4`:** Add Wüthrich 2014 Theorem 4/Proposition 8 distinguished E_• integral modular-symbol Tate lattice and étale isogeny comparison; also Theorem 13 integral Kato class and Theorem 3/16 reducible-residual integral divisibility, using IntegralIwasawaTheory L4 Ferrero–Washington. Do not export arbitrary-isogeny integral lattice equality or retain only a rational divisibility. HE uses the lattice comparison, BSD.7a the integral Euler-system branch.
- **`AutomorphicCongruences:L5a`:** BCS v2 Theorem 4.1.3/Corollary 4.1.4 two-variable ordinary/Greenberg four-term comparison (current stage locator4.2.1 is the anticyclotomic Euler-system bound); Lemma 5.1.1 Selmer restriction and Lemma 5.1.2 p-adic L-function factorization with compatible primitive periods and coefficient extension. The anticyclotomic return proof is HE.8b; completed L5b is not an input.
- **`AutomorphicCongruences:L5w`:** Wan2015 GU(2,2) Hilbert/quartic-CM congruence divisibility with all Fujiwara(H1)–(H3), residual restriction, ramification and period hypotheses of BCS Proposition 5.2.1. The p>3 restriction and p=5 exclusion remain until explicitly removed by an acquired source.
- **`AutomorphicPadicLFunctions:L3h`:** Hsieh2014 TheoremB anticyclotomic toric μ=0 and the BCS Proposition 4.2.2 projection/comparison, at the exact ordinary irreducible branch and chosen primitive/imprimitive factors. Katz’s CM μ theorem for the Eisenstein branch is a different new-owner request.
- **`RankZeroOneBSD:BSD.7a`:** Export the independent early CGS2025 TheoremsA/C anticyclotomic Eisenstein equality for E/ℚ with a rational p-isogeny of kernel character φ, p∤2N, K satisfying (disc),(Heeg),(spl), and φ|G_p≠1,ω, without the older (Sel) hypothesis. It may use only early HE.8 classes, never HE.8b equality or late BCGS/CS applications. Add the missing imaginary-quadratic elliptic-unit IMC owner (Rubin 1991/1994, Hida–Tilouine0.3, Hida 2010 μ=0) and integral Wüthrich KatoL4 suppliers before certifying this branch.
- **`ArithmeticGaloisDuality:R02.4`:** Local duality and exact Poitou–Tate with ordinary/finite/strict local conditions, integral finite cokernels and paired Selmer quotient lengths; retain real/Tate corrections when used by HE.7 imports.
- **`ArithmeticGaloisDuality:D7`:** Continuous derived Selmer complexes over Λ, perfectness under the stated finite cohomology hypotheses, duality and compatibility with derived specialization. Generic derived constructions are not recreated in the Heegner packet.
- **`ModularIwasawaMainConjectures:L0`:** Generic determinant and characteristic-ideal formulations for the exact ordinary Selmer complex, rank-one free rational factors and torsion cohomology. This is a formulation supplier, not a cyclotomic equality or proof of the inert anticyclotomic conjecture. For the integral anticyclotomic comparison use BCK Theorem 5.2 with its standing p>3 hypotheses; the CGLS weak-torsion p=3 rational comparison does not give an unrestricted integral export.
- **`NeronModelsAndSemistableAbelianVarieties:R11.2`:** Actual rational component groups and p-primary local Kummer/Tamagawa comparison under sufficiently near-trivial unramified twists, as BCGS Lemma 1.2.8; distinguish geometric and residue-field points.
- **`NeronModelsAndSemistableAbelianVarieties:R11.5`:** Good ordinary reduction, ordinary unramified quotient and finite local comparison for CS Lemma 3.3.3; identify #Ẽ(F_v)[p∞] for both twist signs. Also export prime-to-residue-characteristic torsion injection into the finite reduction group over bounded unramified extensions for the CV tower torsion argument, for general abelian varieties.
- **`SelmerIwasawaCohomology:L3/iwasawa-descent`:** The generic derived descent exists, but BCGS Theorem 1.2.7 needs the integral JSW specialization formula at (0,empty) local conditions with exact C², Tamagawa and H⁰ torsion factors. CS Proposition 3.3.2 needs strict all-p ordinary complex base change; these two interfaces are distinct. Certify the BCGS local invariant/unit-root normalization on the distinguished lattice, distinguishing full T/A invariants from the ordinary unramified quotient and reduction torsion.
- **`GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class`:** Existing finite weight-two logarithm comparison is imported. Extend GZ.9 to the actual Λ-adic family explicit reciprocity law CH2018 Theorem 5.7 with integral E_• normalization, finite regulator cokernel and the stated BDP coefficient ring; do not substitute a rational finite-level law.
- **`SelmerIwasawaCohomology:L2/greenberg-condition`:** Existing condition uses inertia-kernel Greenberg data. Certify the comparison with the image of H¹(Fil⁺) and with CS strict ordinary cochain cones, retaining H⁰/H² and finite local quotient terms rather than equating these conventions unconditionally.
- **`GrossZagierAndArithmeticHeights:GZ.5`:** General F definite Waldspurger pairing for finite-order primitive ring-class characters of growing P-conductor, with CV central character and admissible local vector hypotheses. The existing GZ.9 Brooks unramified classical infinity-type formula is a near miss, not this supplier.
- **`tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`:** Use upstream Chebotarev for finitely many prescribed simultaneous splitting/avoidance conditions in the auxiliary real quadratic F; no new upstream plan is proposed. HE verifies the BCS residual restriction and disjointness conditions. Also choose two nonsplit good-reduction places of distinct residue characteristics in the CV relative CM tower; combine finite avoidance with the nontrivial Frobenius class for K/F.

## Missing imaginary-quadratic owner

Create “Elliptic units and the Iwasawa main conjectures for imaginary quadratic fields”: EU.0 integral elliptic-unit distributions and norm/conductor relations; EU.1 their rank-one Euler system and unit/class-group modules; EU.2 Rubin 1991/1994 two-variable CM main conjecture with exact prime/coefficient hypotheses; EU.3 Hida–Tilouine Invent.117(1994) Theorem 0.3 anticyclotomic form and specialization; EU.4 Hida Annals2010 Katz anticyclotomic μ=0 with exact hypotheses. Import Katz from AutomorphicPadicLFunctions L3, generic Euler-system/Iwasawa maps from ES.3/ES.8 and CM.1–CM.4 reciprocity. Acquire these proofs before claiming closure. Add KatoL4 Wüthrich distinguished E_• integral zeta/divisibility nodes, using IntegralIwasawaTheory L4 Ferrero–Washington. Link both suppliers to independent BSD.7a, and record them as suppliers of HE.7s’s Rubin/Iwasawa CM source alternative; retain the reviewed Nekovář direct HE.7 route without an artificial unit dependency.

The acquired Wüthrich published text gives the exact distinguished-lattice statement in Theorem 4, with odd semistable prime restrictions and an étale E₁→E_• isogeny. Its integral Kato and reducible divisibility proofs are requested from Kato L4; they are not re-planned as Heegner declarations. The Rubin/Hida–Tilouine/Hida theorem hypotheses must be checked in their full texts by the new owner before the Eisenstein branch can be closed.

## Source versions and findings

The following acquisition scopes come from the original pass and its independent review. Revision 2 re-fetched all twelve cited public PDFs on 8 October 2026; every content hash matches the reviewed packet. It re-read the Howard/CGLS norm construction, CV tower-torsion argument, BCGS exact-length proof scope, CS cone and specialization lattice, BCK integral comparison, and CGS Theorem C at the locators above. Other accepted source targets are retained.

- [The Heegner point Kolyvagin system](https://arxiv.org/pdf/1202.6340), Benjamin Howard. arXiv:1202.6340v1, 28 February 2012; Compositio Math.140 (2004),1439–1472. **Read:** Introduction; §§2.1–2.3, including the height-one control/error proof, the universal-norm construction, local verification and augmentation argument. Finite-level material in Chapter 1 is imported from the reviewed HE.0 part.
- [Mazur’s conjecture on higher Heegner points](https://webusers.imj-prg.fr/~christophe.cornut/papers/mcinv.pdf), Christophe Cornut. Invent. Math.148 (2002),495–523; author manuscript. **Read:** Introduction and the modular CM-trace non-torsion statement used by Howard2.3.7. The more general dynamical proof is read in the companion distribution paper; no claim to have read every proof here.
- [Nontriviality of Rankin–Selberg L-functions and CM points](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Christophe Cornut; Vinayak Vatsal. Author manuscript, 1 April 2005; LMS Lecture Note Series320 (2007),121–186. **Read:** §1 hypothesis/sign/character statements; §4.1 and §§4.3–4.6, including degeneracy injectivity and the Ratner-based proof; §§5.3–5.4 including Theorem 5.10. Order, curve and distribution-recurrence setup in §§2–3/Appendix6 is imported from the reviewed HE.0 part.
- [CM points and quaternion algebras](https://webusers.imj-prg.fr/~christophe.cornut/papers/part2.pdf), Christophe Cornut; Vinayak Vatsal. Author manuscript, 3 April 2005; Documenta Math.10 (2005),263–309. **Read:** Theorem 2.9/Corollary 2.10; the reduction to local dynamics in §2.5 and the complete §2.7 uniform-distribution, twisted-diagonal, partition and commensurability argument. General F_P twisted-diagonal input remains a qualified supplier request.
- [Non-vanishing of Kolyvagin systems and Iwasawa theory](https://arxiv.org/pdf/2312.09301v2), Ashay Burungale; Francesc Castella; Giada Grossi; Christopher Skinner. arXiv:2312.09301v2, January 2026; published CJM14(2) (2026),285–348. **Read:** Introduction and §§1–2: construction, near-trivial characters, lattice/logarithm/control factors, error bound, Theorems A/B and generic rigidity/stub statements. The cyclotomic Chapter 3 is outside this scope.
- [Non-vanishing of Kolyvagin systems and Iwasawa theory](https://web.math.ucsb.edu/~castella/Kolyvagin.pdf), Ashay Burungale; Francesc Castella; Giada Grossi; Christopher Skinner. Author copy dated 2 January 2026, linked by Castella alongside CJM publication; not certified as the publisher PDF. **Read:** Introduction condition(disc) and Lemma 1.1.5 compared with arXiv v2. This copy is used only for collation, not as evidence that the journal version has the same wording.
- [Base change and Iwasawa main conjectures for GL2](https://arxiv.org/pdf/2405.00270v2), Ashay Burungale; Francesc Castella; Christopher Skinner. arXiv:2405.00270v2, March 2025; theorem numbering belongs to v2. **Read:** §1 statements and proof outline, §§2–5 anticyclotomic proof through Theorems1.2.2/1.2.4. The cyclotomic endpoint is not used as a supplier.
- [On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Francesc Castella; Giada Grossi; Jaehoon Lee; Christopher Skinner. Invent. Math.227 (2022),517–580; author copy. **Read:** §§4.1–4.2: weaker tor hypothesis, unit normalization, localized divisibility, formulation equivalence and the source’s additional(Sel) hypothesis. The newer CGS theorem is requested from BSD.7a, not inferred from this older theorem.
- [On refined nonvanishing conjectures by Kurihara and Kolyvagin](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Francesc Castella; Takamichi Sano. Author manuscript dated 20 January 2026, arXiv:2601.14504v1. **Read:** Introduction TheoremC and all §3: Heegner family, strict ordinary Selmer complexes, determinant formulation, exact specialization factors and both directions of refined-conjecture equivalence. §2 cyclotomic results are not extracted here.
- [On the integrality of modular symbols and Kato’s Euler system for elliptic curves](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-19/12.pdf), Christian Wüthrich. Documenta Math.19 (2014),381–402, published PDF. **Read:** Introduction Theorems1–3 and §2 Theorem 4 statement: distinguished integral curve and étale isogeny. Integral Kato proof and Eisenstein divisibility are precise requests to KatoL4; no whole-proof read claim.

- [A proof of Perrin-Riou’s Heegner point main conjecture](https://web.math.ucsb.edu/~castella/PRconj-print.pdf), Ashay Burungale; Francesc Castella; Chan-Ho Kim. Algebra & Number Theory 15(7) (2021),1627–1653, author-served published copy. **Revision read:** §5, Theorem 5.2 and proof, published pp.1646–1647 (PDF pp.20–21); retains the standing p>3 setting.
- [Mazur’s Main Conjecture at Eisenstein primes](https://web.math.ucsb.edu/~castella/Mazur.pdf), Francesc Castella; Giada Grossi; Christopher Skinner. Author-served copy linked to Math. Ann.393(2) (2025),2451–2506. **Revision read:** Theorem C and its Greenberg reformulation, PDF pp.3–4; the anticyclotomic theorem is independent of the subsequent cyclotomic consequence.

The BCGS publisher request was refused with HTTP 403. The author copy and arXiv v2 are recorded separately, with content hashes; no journal-text collation is claimed. Castella–Sano’s result is scoped to its January 2026 preprint. Rubin 1987 and the missing elliptic-unit proofs remain unacquired.

**HeegnerPointEulerSystems/E1 — misprint.** Introduction(disc), arXiv v2 p.1; same text in linked author copy dated 2 January 2026 p.1; journal wording unverified. Here discriminant is −D_K<0, so the positive D_K should be excluded from 3. Equivalently use signed discriminant D_K<0 and exclude −3 consistently. The preceding line declares −D_K<0; D_K=3 otherwise passes the printed exclusion although the six-unit field Q(√−3) is the excluded exceptional case. Later sections switch to signed discriminant notation. Impact: nothing. The existing independent review confirmed this finding; the acquired copies and correction-search history are recorded in the packet.

**HeegnerPointEulerSystems/E2 — misprint.** Lemma 3.1.1, author manuscript20 January 2026 / arXiv2601.14504v1, §3.1. Require I_n ⊂ p^mℤ_p, equivalently M(n)≥m, so the finite coefficient class reduces to modulo p^m. I_n=(p^M(n)). The quotient map ℤ_p/I_n→ℤ_p/p^m exists exactly when M(n)≥m. For M(n)=3,m=1 the printed membership fails although the map exists; for M(n)=1,m=3 membership holds but the required quotient map does not exist. Compare BCGS Lemma 1.1.5. Impact: nothing. The existing independent review confirmed this finding; the acquired copies and correction-search history are recorded in the packet.

**HeegnerPointEulerSystems/E3 — gap.** Theorem 2.2.2, Proposition 2.2.1, Lemma 2.2.4 and proof, arXiv2312.09301v2 pp.17–19; same mismatch in linked author copy; publisher text unverified. Supply the uniform stub lemma at p=3, or restrict this proof route to p>3. No counterexample to Theorem 2.2.2 at p=3 is claimed. Theorem 2.2.2 imports the setting of Proposition 2.2.1. Its proof invokes Lemma 2.2.4 twice to identify the uniform stub index, without disposing of p=3. The cited lemma has an explicit stronger prime assumption. Impact: the proof. The existing independent review confirmed this finding; the acquired copies and correction-search history are recorded in the packet.

## Coverage, planets and prototype limits

**HeegnerPointEulerSystems:HE.7s: source_decomposed.** Source inventory completed as a process boundary: import reviewed HE.7 integral CM/dyadic/arithmetic descent nodes. Rubin 1987 alternative stays an explicit acquisition gap/new-owner requirement. Propose removal of this bookkeeping layer; this is not mathematical closure.

**HeegnerPointEulerSystems:HE.8: planned.** Every mathematical target is a node; main-conjecture-dependent A/B/CS results retain their conjecture hypothesis to preserve the early-family dependency order.

Remaining contracts: Certify the exact S-arithmetic joint distribution supplier including the general F_P twisted-diagonal scope. Close the inherited χ localization square and integral family/JSW/derived determinant supplier requests, including the precise BCGS local torsion normalization. Replace the stated arithmetic prototype omissions by actual supplied interfaces.

**HeegnerPointEulerSystems:HE.8b: planned.** Rational irreducible, integral surjective and Eisenstein branches are distinct; the inert CS conjecture is not proved.

Remaining contracts: Certify BCS Wan/Fujiwara period/μ/control contracts at the exact coefficients and residual restrictions. Acquire/verify the missing elliptic-unit IMC and integral Kato inputs through BSD.7a; compare the exact CGS2025 hypotheses. Replace arithmetic prototype omissions by supplier objects.

**HeegnerPointEulerSystems:HE.8c: source_decomposed.** Hypothesis matrix is recorded in the reader and target nodes. The integrated Cornut–Vatsal ID is preserved but parented to HE.8; definite and indefinite branches are split. Propose removal of the process layer and its reversed edges, without changing atlas records in this job.

HE.8 has six planets: the anticyclotomic Heegner class, joint CM equidistribution, Howard’s divisibility theorem, BCGS nonvanishing, refined Kolyvagin divisibility and the Castella–Sano equivalence. HE.8b has five: rational and integral Heegner main conjectures, rational and integral Greenberg–BDP theorems, and the anticyclotomic Eisenstein main conjecture. Their names are definitions, constructions or named theorems; source locators do not serve as planet names. The process notes have no planets.

The suggested file imports individual Mathlib modules and contains 92 distinct named declarations and 29 admitted examples. Its 37 API items include six promoted lemma nodes. The native compactness statements are used rather than planned again. The norm-family construction chooses from the admitted compact-lift lemma; the remaining prototype definitions, theorem proofs and examples are admitted. All 61 packet declarations remain implementation-unchecked. Elaboration checks these interfaces with the stated algebraic hypotheses and does not certify the arithmetic suppliers or source results.

The actual arithmetic identities of the supplied modules, maps, characters and ideals, continuous Galois cohomology, completed Λ-characteristic-ideal assignment, CM geometry and Selmer determinant identifications remain explicit supplier conditions. The norm-family signatures retain continuity, compactness, Hausdorff separation, finite solvability and transition squares; stabilized norm compatibility retains its algebraic recurrence. Production declarations must use the actual supplier objects and discharge their arithmetic hypotheses.

The prior independent `needs_changes` review is preserved in the packet. Revision 2 addresses R1 and synchronizes its corrections here; only the next independent review can replace that verdict.

## Retained gaps

**Inherited global χ and arithmetic source gaps.** The reviewed HE.0 part leaves an exact global change-of-group/localization square for χ_ℓ unresolved. This Λ-adic extension imports that mathematical construction and preserves its gap. Reviewed HE.7 supplies bounded CM/dyadic error plans, not formal proofs; its image/arithmetic requests remain dependencies.

**S-arithmetic dynamics supplier missing.** RT-AREA-iwasawa-1/1 is retained: GN.4 current Ratner nodes are over real Lie groups and cannot prove CV’s SL₂(F_P) product theorem. Request the S-arithmetic extension. For F_P=Q_p the source cites Ratner precisely; its general-F_P Lemma 2.30 appeals to expert knowledge/Shah notes, whose exact matching theorem has not been acquired here. General-F statements remain planned with that explicit gap.

**Independent elliptic-unit and Eisenstein suppliers.** RT-AREA-iwasawa-1/5: no current roadmap plans the imaginary-quadratic elliptic-unit main conjectures. A new owner is proposed and routed through BSD.7a, with KatoL4 integral Wüthrich input. Rubin 1987 remains unacquired; neither dyadic scope nor a complete CM branch is inferred. The already reviewed Nekovář HE.7 direct CM/descent route does not mathematically require an elliptic-unit IMC; the requested Rubin/Iwasawa alternative does.

**Integral specialization and reciprocity contracts.** Existing generic Iwasawa descent and finite BDP/logarithm nodes are narrower than the exact integral family identities needed. Requests identify the JSW/CH/Wüthrich and Selmer-complex extensions, coefficients, p-factors and local-condition dictionary. A stage label or rational identity is not certified as supplying the integral equality.

**Source collation and general-CM acquisition.** The BCGS publisher DOI request returned HTTP 403. Its arXiv v2 and linked author copy were compared and findings are scoped to those texts. Castella–Sano is a preprint, with no version-of-record claim. Rubin 1987, the new elliptic-unit owner’s proofs and the exact general-F_P twisted-diagonal theorem require acquisition/verification before supplier closure.

**HE.8 suggested arithmetic interfaces.** The suggested file uses existing rings, modules, ideals, monoid homomorphisms and tensor products as unbundled supplier data. The actual number fields, continuous Galois modules/cohomology, Λ, Selmer local conditions, characteristic-ideal assignment, CM moduli, derived Selmer determinant and the arithmetic hypotheses in each packet statement are omitted conditions, printed beside each prototype signature. Elaboration checks algebraic shapes with admitted declarations only; it does not certify those identifications or the mathematics. No opaque Prop-valued pseudo-structure is introduced. Production declarations must replace these omissions by the named supplier objects and hypotheses. Revision 2 retains compact topology, finite constraint solvability, transition squares and stabilized norm recurrence as explicit algebraic assumptions; these are no longer omitted arithmetic conditions. The named arithmetic suppliers must still identify the actual modules and discharge finite solvability from the common presentation.

**HE.8b suggested arithmetic interfaces.** The suggested file uses existing rings, modules, ideals, monoid homomorphisms and tensor products as unbundled supplier data. The actual number fields, continuous Galois modules/cohomology, Λ, Selmer local conditions, characteristic-ideal assignment, CM moduli, derived Selmer determinant and the arithmetic hypotheses in each packet statement are omitted conditions, printed beside each prototype signature. Elaboration checks algebraic shapes with admitted declarations only; it does not certify those identifications or the mathematics. No opaque Prop-valued pseudo-structure is introduced. Production declarations must replace these omissions by the named supplier objects and hypotheses.

**BCGS ordinary local torsion normalization.** BCGS Lemma 1.2.3/Remark 1.2.4 and its proof use #H⁰(Q_p,E_•[p∞]) in the regulator/control comparison and compare it to the ordinary unit-root factor. The exact lattice and local-extension hypotheses needed for that identification must be certified by the regulator/Selmer supplier. Full Tate invariants, unramified ordinary-quotient invariants and #Ẽ(F_p)[p∞] are not equated merely by notation in this plan; the BCGS formula is recorded as source-stated, with this specific integral local proof obligation. CS instead computes its local factor from the stated reduction groups.

**Exact-length proof at p=3.** SourceIssue E3: BCGS2.2.2 inherits p≥3 but invokes Lemma2.2.4 with p>3. This review restricts the verified route to p>3. Establish the p=3 stub proof before extending; the late BCGS/CS applications already require p>3.

**Integral anticyclotomic comparison at general weak-torsion p=3.** CGLS4.2.1 gives rational comparison for E(K)[p]=0; BCK5.2 gives integral comparison with standing p>3. CGS separately supplies the excluded-local-character Eisenstein branch at odd p. No general p=3 integral comparison under only E(K)[p]=0 is certified here.
