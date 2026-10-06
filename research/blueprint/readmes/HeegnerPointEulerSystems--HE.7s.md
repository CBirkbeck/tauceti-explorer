# Heegner-point Euler systems and arithmetic descent — HE.7s part

This planning pass covers HE.7s, HE.8, HE.8b and HE.8c. It constructs the ordinary anticyclotomic arithmetic example, proves the geometric nonvanishing input, and separates three return paths: Howard’s one-sided divisibility, BCGS’s finite-system nonvanishing and divisibility defect, and Castella–Sano’s determinant formulation. The main-conjecture proof belongs to HE.8b. Its early input is the actual family constructed in HE.8; that family never assumes a completed main conjecture.

The pass is **complete as a plan**, with 59 nodes at target level. HE.8 and HE.8b are `planned`, with their exact open contracts recorded. HE.7s and HE.8c are `source_decomposed`: they account for source boundaries and hypotheses rather than defining mathematical objects. No stage is mathematically closed. The packet, this document and the [suggested file](../suggested/HeegnerPointEulerSystems--HE.7s.lean) record the same declarations. The [handoff](../handoff/BP-HeegnerPointEulerSystems--HE.7s.md) records the checks and remaining work.

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

The normalization begins with the finite ring-class torsion Δ and its Artin elements. The inert initial factor is (p+1)²−a_p²; the split factor is a product in ℤ_p[Δ], whose augmentation is (p+1−a_p)². It can be divisible by p. Positive-conductor stabilization divides by the **unit root** α_p, not by a_p. It subtracts α_p⁻¹ times the predecessor and scales by α_p⁻k. Conductor zero has a separate Euler correction. When p divides the class number, the finite ring-class conductor d(k) is the actual least conductor containing K_k, not k+1 by convention.

The universal-norm family is selected by compactness from compatible lifts of ΦP[n]. Howard proves its existence and compatibility with his clean hypotheses; CGLS adapts that construction under E(K)[p]=0 with the actual conductor shifts. Uniqueness is not asserted. CGLS compares it with the ordinary stabilized family by a unit involving β_p=p/α_p and u_K. This proves equality of the generated Λ-lines while leaving the possibly nonunit Φ visible in finite specialization. Derivative classes import the generic cyclic-Galois tensor and retain the global χ localization issue from the earlier packet. A local endomorphism cannot be silently applied to global cocycles unless its equivariance has been established.

Geometric nonvanishing is a joint distribution statement. A product of CM reductions has component constraints, and the Galois elements indexing its factors must be pairwise distinct modulo P-rational reciprocity elements. The source proves the Haar limit and then finite-fibre orbit surjectivity. It uses products of cocompact SL₂(F_P) quotients. The current GN.4 Ratner nodes are over real Lie groups; they do not supply this p-adic theorem. The exact extension is requested. The Q_p twisted-diagonal statement has a precise Ratner reference; the source’s appeal to expert knowledge for general F_P remains an acquisition/verification gap.

In the indefinite branch, weighted degeneracy maps preserve a nonzero P-new quotient and the joint orbit supplies enough supersingular reductions to avoid the finite tower torsion. Primitive-character averaging then gives a non-torsion character point at every sufficiently large conductor. In the definite branch, nonexceptionality excludes π≃π⊗η_(K/F), and a nonconstant toric function supplies a nonzero primitive-character period. GZ supplies the analytic formula after the geometry. Neither argument says all sufficiently ramified characters are nonzero.

BCGS compares the actual finite derivative system with nontrivial crystalline characters near the identity. The modulus condition is M(n)≥m, and the scalar is the initial factor, whose p-valuation must be retained. A nonzero Λ-family implies nonzero bottom classes at sufficiently close **nontrivial** characters; the identity specialization may vanish. Its logarithm, optimal-lattice and control comparisons retain the local torsion factor q, finite localization cokernel C, and the product over K-primes above N. BCGS Lemma 1.2.3/Remark 1.2.4’s comparison of q=#H⁰(ℚ_p,E_•[p∞]) with an ordinary unit-root factor remains a specific integral supplier obligation. Full Tate invariants, the unramified ordinary quotient and the reduction group are distinguished until the lattice and extension hypotheses justify the identification. The source-stated formulas retain q; this is a verification gap, not a claimed source error. The main-conjecture-dependent contradiction uses a uniform rescaling error. The refined theorem requires the integral equality and distinguishes M∞ from the bottom point index M₀.

Castella–Sano constructs a rational determinant element from y∞⊗y∞ and then asks whether it generates the integral lattice. Its Selmer complex uses strict ordinary conditions at all p-primes and has a rank-one discrete dual. BCS’s (0,empty) Greenberg dual is torsion. The notations X_Gr in these papers must therefore be distinguished. The specialized lattice contains L_p²·Tam_E²·#X_BK. Here X_BK is the finite quotient of the propagated Selmer group; at a general twist it need not be Bloch–Kato. The inert-prime theorem proves an equivalence with the main conjecture, which this packet does not discharge at inert p.

## HE.8b: anticyclotomic main-conjecture proof

The source is BCS arXiv v2. Theorems1.2.2(a)/(b) are the rational/integral Heegner formulas, and Theorems1.2.4(a)/(b) their Greenberg versions. BCS’s single-power analytic function corresponds, as a generated ideal after the specified coefficient and period comparison, to the square of BCGS’s L_BDP. The packet imports the GZ convention dictionary, including its remaining unit-normalization gap, and requests the exact integral family reciprocity extension.

AutomorphicCongruences L5a owns the shared two-variable four-term comparison, Selmer restriction and analytic factorization. L5w owns Wan’s GU(2,2) congruence theorem and the Fujiwara hypotheses over the auxiliary real quadratic/quartic CM fields. This packet verifies the arithmetic auxiliary-field restrictions and proves the anticyclotomic return: project the product divisibility, use the appropriate μ-vanishing and local-condition dictionary, combine the two opposite Euler-system bounds, and cancel nonzero factors. The p>3 condition and exceptional p=5 field exclusion stay attached to the supplier invocation. Integral equality requires its integral period and residual-surjectivity branch.

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

## HE.8 declaration inventory

### Heegner initial Euler factor

**Declaration:** `initialFactor`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/initial-euler-factor`.

For every permitted n, in ℤ_p[G(n)] with G(n)=Gal(K[n]/K), define Φ=(p+1)²−a_p² if p is inert; if p splits define Φ=(p−a_pσ+σ²)(p−a_pσ*+σ*²), with σ,σ* the specified Artin elements. The augmentation is (p+1−a_p)² in the split case, not necessarily a unit. Keep the finite ring-class group, its Artin action and the initial unit index; it differs from Howard’s first-step degree group Δ=(O_K/pO_K)×/(ℤ/pℤ)×.

**Proof or construction:** Read σ,σ* through the imported reciprocity convention. Compute the initial trace polynomial from HE.2; retain its action on the Δ-module.

**Dependencies:** `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`, `mathlib:MonoidAlgebra.single`.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), §2.3, before Lemma 2.3.2.

**Uses that determine the API:** Howard Lemma 2.3.2: describes the common initial trace image. BCGS Lemma 1.1.5 and CS Lemma 3.1.1: its augmentation is the specialization factor.

**API:**

- `initialFactor_inert` (simp): Inert Φ=(p+1)²−a_p².
- `initialFactor_split` (simp): Split Φ is the product of the two Artin quadratic factors, not its augmentation.
- `initialFactor_augmentation` (compatibility): Augmentation of the split factor is (p+1−a_p)²; inert augmentation is unchanged.
- `initialFactor_natural` (functoriality): A coefficient-ring map and compatible Δ-map carry Φ to the corresponding factor.

**Acceptance examples:**

- For p=5,a_p=1 and σ=σ*=1, Φ=25, a nonunit in ℤ_5.
- For p=5,a_p=1, inert Φ=35, distinct from the split augmentation25.
- Replacing both Artin elements by inverses transforms Φ by that involution; it does not permit replacing σ by1.

### Ordinary stabilization of Heegner points

**Declaration:** `stabilizedPoint`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/ordinary-stabilized-point`.

Let α_p∈ℤ_p× be the unit root of X²−a_pX+p and β_p=p/α_p. For k≥1 put P[p^k]_α=P[p^k]−α_p⁻¹P[p^(k−1)] and scale by α_p⁻k. At k=0 use u_K⁻¹(1−α_p⁻¹σ)(1−α_p⁻¹σ*)P[1] in the split case and u_K⁻¹(1−α_p⁻²)P[1] in the inert case. Trace to K_k with the actual smallest d(k) such that K_k⊂K[p^d(k)], including p-primary class-number shifts.

**Additional hypotheses:** E(K)[p]=0.

**Proof or construction:** Use the ordinary unit-root supplier, not division by a_p. Apply the repeated and initial trace relations separately; form the finite ring-class norms with d(k).

**Dependencies:** `HeegnerPointEulerSystems:HE.8/initial-euler-factor`, `HeegnerPointEulerSystems:HE.2/repeated-conductor-predecessor-recurrence`, `HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence`, `PadicHodgeRegulators:L3`, `mathlib:PadicInt`.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Remark 4.1.3.

**Uses that determine the API:** CGLS Remark 4.1.3: builds the ordinary compatible tower. BCGS §1.1.2: compares normalized Λ-lines.

**API:**

- `stabilizedPoint_succ` (projection): At k≥1 the scaled point is α_p⁻k(P[p^k]−α_p⁻¹P[p^(k−1)]).
- `stabilizedPoint_map` (functoriality): An equivariant ℤ_p-linear map commutes with stabilization.
- `stabilizedPoint_change_unit` (compatibility): A unit rescaling of all raw points rescales every stabilized point by that unit.
- `stabilizedPoint_initial` (relation): The conductor-zero value uses its separate split/inert correction with u_K.

**Acceptance examples:**

- All raw points zero give every stabilized point zero.
- Over ℚ_5 with unit root2 and raw P_1=4,P_0=2, the k=1 stabilized value is3/2, not2 or3.
- At initial level the prescribed Euler-corrected P[1] is used; the positive-level recurrence is not evaluated at a nonexistent predecessor.

### Norm compatibility of stabilized Heegner points

**Declaration:** `stabilized_corestriction`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/stabilized-corestriction`.

The stabilized points traced to the anticyclotomic layers satisfy Cor_(K_(k+1)/K_k)y_(k+1)=y_k. The first trace uses the initial correction in ordinary-stabilized-point; a shift d(k) is required when p divides h_K. This construction does not assert Howard Theorem B under the weakened class-number hypothesis.

**Additional hypotheses:** E(K)[p]=0.

**Proof or construction:** Expand the recurrence, use a_p=α_p+β_p and α_pβ_p=p. At the first level evaluate the Artin correction; use the actual tower norms.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/ordinary-stabilized-point`, `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Remark 4.1.3 and proof of Theorem 4.1.1.

### Howard universal-norm Heegner family

**Declaration:** `universalNormFamily`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/universal-norm-heegner-family`.

Under the ordinary Heegner conditions and E(K)[p]=0, construct Q[n] in lim_k H_k[n], the inverse limit of the ℤ_p[Gal(K_k[n]/K)]-modules generated by P[n] and P_j[n]. Its level-zero projection is ΦP[n], and Cor_(K∞[nℓ]/K∞[n])Q[nℓ]=a_ℓQ[n] for every permitted auxiliary ℓ. Choices arise from compactness, not uniqueness. Howard proves this under full G_K image and p∤h_K; CGLS Theorem 4.1.1 gives the weaker construction with the actual class-number conductor shifts, without extending Howard’s divisibility theorem.

**Additional hypotheses:** E(K)[p]=0.

**Proof or construction:** Use ∩γ_kM=ΦM to lift ΦP[n] in the free presentation. Lift finite families with compatible auxiliary norms, then use compactness to select one coherent family.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/initial-euler-factor`, `HeegnerPointEulerSystems:HE.2/norm-relation-and-reduction-congruence`, `PadicMeasuresIwasawaAlgebras:L1`, `PadicMeasuresIwasawaAlgebras:L5`.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), Lemmas2.3.2–2.3.3; [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation.

**Uses that determine the API:** Howard §2.3 derivative construction: requires simultaneously coherent auxiliary norms. Howard Lemma 2.3.8: computes the augmentation image.

**API:**

- `universalNormFamily_level_zero` (projection): Q[n]_0=ΦP[n].
- `universalNormFamily_trace` (relation): Auxiliary trace Q[nℓ] maps to a_ℓQ[n].
- `universalNormFamily_corestriction` (compatibility): Each anticyclotomic transition carries Q[n]_(k+1) to Q[n]_k.
- `universalNormFamily_choice` (characterisation): Two choices need not be equal; their difference has zero prescribed initial projection and obeys homogeneous norm relations.

**Acceptance examples:**

- At n=1 the bottom projection is ΦP[1], not P[1].
- For a_ℓ=0 the auxiliary trace is zero; it is not the degree times Q[n].
- A supplied inverse-limit module with a nonzero projection kernel permits distinct lifts of the same initial point.

### Anticyclotomic Heegner class

**Declaration:** `heegnerIwasawaClass`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`.

Apply the integral Kummer map to the stabilized norm-compatible points and the imported Iwasawa–Shapiro comparison to obtain y∞∈H¹_Iw(K∞/K,T)=H¹_cont(K,T⊗Λ(tautological inverse)). The actual tower class lies in the specified ordinary Selmer structure. Its projection to level k is the Kummer class of y_k. There is no assertion that each character specialization is nonzero.

**Additional hypotheses:** E(K)[p]=0.

**Proof or construction:** Invoke finite Kummer/corestriction compatibility from HE.3. Use the supplier’s continuous, derived-limit comparison, with its tautological-action sign.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/stabilized-corestriction`, `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1 and Remark 4.1.3.

**Planet:** Anticyclotomic Heegner class.

**Uses that determine the API:** Howard TheoremB: supplies the actual rank-one Heegner Λ-submodule. BSD.7a and AutomorphicCongruences L5a: need the early nonzero family without a completed main conjecture.

**API:**

- `heegnerIwasawaClass_level` (projection): Under Iwasawa–Shapiro, level k equals the Kummer class of y_k.
- `heegnerIwasawaClass_scalar` (functoriality): An equivariant quotient or scalar transport commutes with the class construction.
- `heegnerIwasawaClass_restrict` (compatibility): Changing the tower by a finite initial norm gives the imported corestriction comparison, with its degree/factor.
- `heegnerIwasawaClass_zero` (simp): The identically zero compatible point family has zero class.

**Acceptance examples:**

- Conductor one specializes to the corrected trace over its ring-class field, not an assumed K-rational raw point.
- A p-isogeny acts by the actual lattice map; a nonunit scalar can change the integral index.
- The nonzero scalar series γ−1 specializes to zero at the identity, detecting an invalid every-character assertion.

### Primitive CM character stratum

**Declaration:** `cmCharacterStratum`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/cm-character-stratum`.

For the imported relative ring-class tower G∞ with finite torsion G₀, define P(n,χ₀) as the finite-order characters of G(n) restricting to χ₀ on G₀ and not factoring through G(n−1). The character satisfies χ₀ω=1 on the embedded A_F×. Conductor is the largest F-ideal in the order, and primitivity is exact level, not merely conductor dividing P^n. Small n before G₀ embeds are excluded.

**Additional hypotheses:** F totally real, K/F CM, P a finite prime; n is large enough to identify G₀ in G(n).

**Proof or construction:** Use the actual quotient maps and torsion inclusions. Define the fixed-type locus minus pullback of characters at the preceding level.

**Dependencies:** `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`, `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`.

**Source:** [cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §1.1, equations(3)–(4), and Lemma 2.8.

**Uses that determine the API:** CV Theorems1.4/1.5: quantifies existence within exact-conductor fixed-torsion strata. CV Lemma 2.8 and Theorem 5.10: primitive-character averaging separates old-level contributions.

**API:**

- `cmCharacterStratum_mem` (characterisation): Membership is fixed torsion restriction together with failure to factor through G(n−1).
- `cmCharacterStratum_torsion` (projection): Every member restricts to χ₀ on G₀.
- `cmCharacterStratum_not_old` (relation): Every pullback from G(n−1) is excluded.
- `cmCharacterStratum_transport` (equivalence): Compatible isomorphisms of tower quotients and torsion subgroups identify the strata.

**Acceptance examples:**

- When the preceding-level quotient map is the identity, the primitive stratum is empty.
- A character with the wrong restriction to G₀ is excluded even if it is primitive.
- For G(n)=C₂, preceding quotient1, trivial torsion subgroup and identity character C₂→C₂, the character belongs to the exact-level stratum.

### Generic CM root-number parity

**Declaration:** `cm_generic_root_number`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/cm-generic-root-number`.

For cuspidal parallel-weight-two π over F with finite-order everywhere-unramified central character ω, and prime-to-P conductor N′ coprime to D_(K/F), let S be all real places and the finite inert Q≠P for which ord_Q(N) is odd. For sufficiently ramified compatible ring-class χ, ε(π,χ)=(-1)^|S|. The source’s S_χ equals S at every level if P∤N or P splits in K. Even |S| is definite and odd |S| indefinite.

**Additional hypotheses:** π cuspidal parallel weight two; ω finite-order everywhere unramified; N′ and D_(K/F) coprime.

**Proof or construction:** Import local epsilon identities with the source’s conventions. Eliminate the moving P factor only at sufficiently large conductor; multiply signs.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/cm-character-stratum`, `GrossZagierAndArithmeticHeights:GZ.4`.

**Source:** [cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), §1.1, Lemma 1.1 and definitions of S,Sχ.

### Joint distribution of CM reductions

**Declaration:** `joint_cm_equidistribution`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/joint-cm-equidistribution`.

Let F be totally real, K/F CM, and B/F a quaternion algebra split by K and at P, with a fixed K-embedding. Choose a nonempty finite collection 𝒮 of finite sets S of finite places v≠P with B_v split, K_v a field, and |S|+|Ram_f(B)|+[F:ℚ] even; fix the source’s totally definite B_S and compatible local embeddings. Let R⊂Gal(K^ab/K) be nonempty finite and pairwise distinct modulo P-rational elements rec_K(λ), characterized by λ_P∈K×·F_P×. Form the actual simultaneous Red:CM→X(𝒮,R) and component map C with fibre probability measures μ_z. For compact-open G⊂Gal(K^ab/K) with probability Haar dg, a P-isogeny class ℋ, and continuous f:X(𝒮,R)→ℂ, the difference ∫_G f(Red(gx))dg−∫_G∫_(C⁻¹(gx̄))f dμ_(gx̄)dg tends to zero as x escapes compact subsets of ℋ. Here x̄=C(Red(x)); prohibited components are retained.

**Additional hypotheses:** B split by K and at P; each auxiliary set satisfies S1–S3 and excludes P, as specified in the statement. R is nonempty and pairwise P-irrational; G is compact open. Artin reciprocity sends uniformizers to geometric Frobenius.

**Proof or construction:** Reduce the adelic orbit to products of cocompact SL₂(F_P) quotients. Apply the requested p-adic uniform-distribution theorem and twisted-diagonal classification. Identify commensurable factors with P-rational reciprocity classes; pairwise irrationality forces the full product.

**Dependencies:** `HeegnerPointEulerSystems:HE.0/relative-cm-conductor-tower`, `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`, `HilbertModularVarietiesAndShimuraCurves:H5`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4`.

**Source:** [cv-dynamics](https://webusers.imj-prg.fr/~christophe.cornut/papers/part2.pdf), Theorem 2.9; §§2.5 and2.7.

**Planet:** Joint CM equidistribution.

### Surjectivity onto CM reduction fibres

**Declaration:** `joint_cm_orbit_surjectivity`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/joint-cm-orbit-surjectivity`.

At fixed finite level and with the joint CM distribution hypotheses, Red(Gx) equals the fibre C⁻¹(Gx̄) for every x outside a finite subset of its P-isogeny class. The right side retains the component map C and does not assert independent reductions in forbidden components.

**Proof or construction:** Apply the continuous-test-function limit to indicators of each permitted finite fibre point. Positive fibre measure gives eventual occurrence; combine finitely many points.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/joint-cm-equidistribution`.

**Source:** [cv-dynamics](https://webusers.imj-prg.fr/~christophe.cornut/papers/part2.pdf), Corollary 2.10.

### Indefinite primitive-character Heegner nonvanishing

**Declaration:** `indefinite_cm_character_point`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/indefinite-cm-character-point`.

In CV §4, require (H1) an Eichler order at P in a split B_P, (H2) maximal split level at primes ramifying in K, a P-new nonzero ω-isotypic quotient α:J_H→A, and good CM points x of conductor P^n. For n sufficiently large and fixed admissible χ₀, some χ∈P(n,χ₀) has e_χα(x)≠0 in the Mordell–Weil space tensored with the character field. Weighted traces are non-torsion, not merely nonzero torsion points.

**Additional hypotheses:** CV(H1),(H2), P-new quotient and good CM point; χ₀ω=1 on A_F×.

**Proof or construction:** Raise the P-level to P² and prove weighted degeneracy injectivity in the P-new quotient. Use finite tower torsion and joint supersingular reductions to make the weighted trace avoid every torsion value. Apply the primitive-character averaging identity, with Appendix6 conductor relations.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/joint-cm-orbit-surjectivity`, `HeegnerPointEulerSystems:HE.8/cm-character-stratum`, `HeegnerPointEulerSystems:HE.2/nonmaximal-level-distribution`, `HilbertModularVarietiesAndShimuraCurves:H5`, `FaltingsFinitenessAndIsogenyTheorems:R28.4`.

**Source:** [cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Theorem 4.1; Theorem 4.10; Lemmas4.12–4.15 and Proposition 4.17.

### Definite primitive-character toric nonvanishing

**Declaration:** `definite_cm_character_period`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/definite-cm-character-period`.

For the definite quaternion algebra and CV(H1),(H2), a nonzero P-new vector θ in the Jacquet–Langlands representation of a nonexceptional pair (π,K), and a good CM point x at large conductor, some χ∈P(n,χ₀) has Σ_(σ∈G(n))χ(σ)θ(σx)≠0. Nonexceptionality is π≇π⊗η_(K/F); it cannot be suppressed.

**Additional hypotheses:** Definite parity, CV(H1),(H2), nonexceptional π, P-new θ, admissible χ₀ and good CM points.

**Proof or construction:** Nonexceptionality makes the definite vector nonconstant on appropriate component fibres. Use orbit surjectivity, then weighted ramified-prime degeneracy injectivity. Project to exact-conductor characters using the P-new distribution relation.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/joint-cm-orbit-surjectivity`, `HeegnerPointEulerSystems:HE.8/cm-character-stratum`, `HeegnerPointEulerSystems:HE.2/nonmaximal-level-distribution`, `GL2AutomorphicRepresentationsAndTransfer:R17.5`, `HilbertModularVarietiesAndShimuraCurves:H5`.

**Source:** [cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Proposition 5.6; Corollary 5.7; Proposition 5.8; Lemma 5.9; Theorem 5.10.

### Cornut–Vatsal definite nonvanishing

**Declaration:** `definite_rankin_nonvanishing`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/definite-rankin-nonvanishing`.

With F,K,π,ω,P,N′,D as in cm-generic-root-number, |S| even and (π,K) nonexceptional, for every sufficiently large n there exists χ∈P(n,χ₀) with L(π,χ,1/2)≠0. This is existence within each fixed-torsion conductor stratum; it is not nonvanishing of all characters.

**Proof or construction:** Choose the source’s admissible quaternionic test vector and level. Apply the definite geometric period theorem and imported Waldspurger identity, preserving local test factors.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/definite-cm-character-period`, `HeegnerPointEulerSystems:HE.8/cm-generic-root-number`, `GrossZagierAndArithmeticHeights:GZ.5`.

**Source:** [cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Theorem 1.4 and §5.

### Cornut–Vatsal indefinite nonvanishing

**Declaration:** `cornut_vatsal_indefinite_nonvanishing`. **Packet identity:** `HeegnerPointEulerSystems:HE.8c/cornut-vatsal-nonvanishing-with-its-exact-hypotheses`.

Under the same initial CV data, assume |S| odd, ω=1, and N,D_(K/F),P pairwise coprime. For every sufficiently large n there exists χ∈P(n,χ₀) such that L′(π,χ,1/2)≠0. Use the geometric character-point theorem and the precise generalized Gross–Zagier identity. The definite branch has a separate node.

**Additional hypotheses:** ω=1; N,D,P pairwise coprime; |S| odd; χ₀ compatible with central character.

**Proof or construction:** Apply the admissible indefinite geometry and non-torsion character projection. Use positivity/nondegeneracy of the Néron–Tate height and the imported Gross–Zagier formula.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/indefinite-cm-character-point`, `HeegnerPointEulerSystems:HE.8/cm-generic-root-number`, `GrossZagierAndArithmeticHeights:GZ.8/general-quaternionic-gross-zagier-identity`.

**Source:** [cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf), Theorem 1.5 and §4.

### Cornut’s higher Heegner point theorem

**Declaration:** `cornut_tower_trace_nontorsion`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/cornut-tower-trace-nontorsion`.

In the classical modular Heegner setting with p∤N, the ring-class p-power tower contains a conductor for which the appropriate trace of the modular Heegner point to the anticyclotomic layer is non-torsion. Keep the finite torsion/trace quotient in Cornut’s statement. This does not require the Heegner point of conductor one to be non-torsion and does not say every trace is non-torsion.

**Proof or construction:** Specialize the distribution/non-torsion argument to F=ℚ and the modular quotient. Pass through the finite ring-class torsion trace as in Howard’s use of Cornut.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/indefinite-cm-character-point`, `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation`.

**Source:** [cornut](https://webusers.imj-prg.fr/~christophe.cornut/papers/mcinv.pdf), Introduction main theorem; Howard Theorem 2.3.7 invocation.

### Non-torsion Λ-adic bottom class

**Declaration:** `lambda_bottom_class_nontorsion`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`.

For the actual ordinary Heegner family y∞ under E(K)[p]=0, Λy∞ is free of rank one and y∞ is not Λ-torsion. CGLS gives this nonzero family with the actual class-number conductor shifts. No completed main conjecture, full integral image or p∤h_K assumption is used for this assertion.

**Additional hypotheses:** E(K)[p]=0.

**Proof or construction:** Use Cornut’s non-torsion trace and the recurrence comparison to make the inverse-limit module nonzero. Use the CGLS class-number-shift adaptation and unit comparison to identify the nonzero normalized Λ-line. For the weaker family use CGLS’s class-shift construction; do not import Howard’s clean divisibility beyond its scope.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `HeegnerPointEulerSystems:HE.8/cornut-tower-trace-nontorsion`, `PadicMeasuresIwasawaAlgebras:L4`.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1 and Remark 4.1.3; Howard Theorem 2.3.7 for the clean specialization.

### Λ-adic Heegner derivative class

**Declaration:** `lambdaDerivativeClass`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`.

For each squarefree allowed n, apply the imported derivative operator to Q[n] (or the normalized ordinary family), sum the finite ring-class torsion orbit, and descend its invariant Kummer class through the actual restriction isomorphism. Obtain κ^Λ_n in the generic Λ-adic Kolyvagin-system coefficient. Preserve the cyclic-Galois tensor and the finite/singular correction maps; the bottom is the specified Heegner Λ-line.

**Additional hypotheses:** E(K)[p]=0.

**Proof or construction:** Reuse ES.3 derivatives and HE.4 choice-equivariant invariance. Prove torsion invariants vanish under the stated tor/image hypotheses, then apply inflation–restriction. Apply the imported continuous Iwasawa comparison; no algebraic discrete-cohomology replacement.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/universal-norm-heegner-family`, `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `HeegnerPointEulerSystems:HE.4/kolyvagin-derivative-classes-and-descent-to-K`, `HeegnerPointEulerSystems:HE.4/generator-tensor-choice-independence`, `EulerSystemsAndKolyvaginSystems:ES.3`, `EulerSystemsAndKolyvaginSystems:ES.8`.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), §2.3, construction following Lemma 2.3.3; [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation.

**Uses that determine the API:** Howard Lemmas2.3.4–2.3.6: localizes the actual derived classes. BCGS Lemma 1.1.5: compares their finite specializations.

**API:**

- `lambdaDerivativeClass_restrict` (projection): Restriction recovers the invariant differentiated Kummer class.
- `lambdaDerivativeClass_generator` (compatibility): Changing a cyclic generator transforms the class together with the specified tensor factor.
- `lambdaDerivativeClass_coefficients` (functoriality): Coefficient reduction commutes with the class when the quotient ideals are ordered correctly.
- `lambdaDerivativeClass_bottom` (simp): At empty auxiliary support, use the actual universal-norm Heegner bottom class.

**Acceptance examples:**

- The empty derivative acts as identity before the actual restriction inverse.
- A zero point family gives zero derivative class.
- A noninjective restriction map with two distinct preimages forbids unique descent; the tor hypothesis cannot be omitted.

### Λ-adic Heegner local conditions

**Declaration:** `lambda_heegner_local_conditions`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`.

The constructed derivative classes satisfy the transverse condition at ℓ|n, unramified condition away from pNn, and the prescribed propagated condition at bad primes. At v|p the image lies in the ordinary Fil⁺ condition. The proof treats finite decomposition at bad primes and finite ordinary-reduction torsion; it does not replace integral Kummer conditions by rational ones.

**Additional hypotheses:** Howard’s clean image hypothesis for the direct proof; weaker local verification uses the exact CGLS Theorem 4.1.1 adaptation.

**Proof or construction:** Use HE.5 transverse ramification. At bad primes dualize corestriction of local H² and keep prime-to-p local degrees. At p prove the reduction Tate module vanishes for universal norms, then use duality/Herbrand finiteness.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`, `HeegnerPointEulerSystems:HE.5/heegner-transverse-local-condition`, `SelmerIwasawaCohomology:L3/universal-norms-unramified`, `SelmerIwasawaCohomology:L2/greenberg-condition`, `ArithmeticGaloisDuality:R02.4`, `HeegnerPointEulerSystems:HE.8/iwasawa-heegner-level-projection`, `HeegnerPointEulerSystems:HE.8/lambda-derivative-restriction`.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), Lemma 2.3.4; [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation.

### Λ-adic finite/singular Heegner compatibility

**Declaration:** `lambda_finite_singular_relation`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/lambda-finite-singular-relation`.

The corrected Λ-adic derivative system satisfies the generic finite/singular comparison at each allowed ℓ. Its arithmetic reduction congruence and the local χ_ℓ identification must commute with localization through the actual Galois change-of-group action. A merely local matrix is not a global G_K-equivariant coefficient endomorphism.

**Proof or construction:** Pass the CM reduction congruence through the inverse limit. Use the inherited global χ localization square; retain its unresolved supplier gap explicitly. Construct the corrected system, rather than claiming the raw derivatives already satisfy stronger relations.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`, `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`, `HeegnerPointEulerSystems:HE.5/local-heegner-chi-automorphism`, `HeegnerPointEulerSystems:HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system`, `EulerSystemsAndKolyvaginSystems:ES.3`, `HeegnerPointEulerSystems:HE.8/lambda-derivative-restriction`.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), Lemmas2.3.5–2.3.6; [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation.

### Unit comparison of Heegner normalizations

**Declaration:** `howard_stabilization_unit_comparison`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/howard-stabilization-unit-comparison`.

Howard’s universal-norm bottom and the ordinary stabilized family generate the same Λ-line: the comparison factor is u_Kα_p²(β_p−1)² when p splits, and u_Kα_p²(β_p²−1) when p is inert. Since β_p∈pℤ_p and u_K is a p-unit in the allowed discriminants, the factor is a unit. This comparison does not make Φ a unit.

**Additional hypotheses:** E(K)[p]=0.

**Proof or construction:** Compute the two initial factors using X²−a_pX+p. Check the β factors are units and retain u_K; compare Λ-spans.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/initial-euler-factor`, `HeegnerPointEulerSystems:HE.8/ordinary-stabilized-point`, `HeegnerPointEulerSystems:HE.8/universal-norm-heegner-family`, `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `mathlib:PadicInt.isUnit_iff`.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Remark 4.1.3.

### Howard’s anticyclotomic divisibility theorem

**Declaration:** `lambda_adic_heegner_kolyvagin_system_and_theorem_B`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/lambda-adic-heegner-kolyvagin-system-and-theorem-B`.

Under Howard’s TheoremA hypotheses, p odd good ordinary, p∤h_K, p,N,D_K pairwise coprime and G_K→GL₂(ℤ_p) surjective, S=H¹_FΛ(K,T⊗Λ) is Λ-torsion-free of rank one, and its discrete dual X is pseudo-isomorphic to Λ⊕M⊕M for a finitely generated torsion Λ-module M with char(M)=char(M)^ι. Moreover char(M) divides char(S/H), H the actual Heegner Λ-line. Equality and integral primitivity are not conclusions.

**Additional hypotheses:** G_K→GL₂(ℤ_p) surjective; p∤h_K; p,D_K,N pairwise coprime.

**Proof or construction:** Verify H.0–H.5 and cartesian self-dual local conditions on height-one specializations. Bound local/global control kernels uniformly as Q approaches a fixed P, including P=pΛ. Use paired finite-DVR structure and the anticyclotomic functional equation to obtain the pseudo-isomorphism and one-sided bound.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`, `HeegnerPointEulerSystems:HE.8/lambda-finite-singular-relation`, `HeegnerPointEulerSystems:HE.8/howard-stabilization-unit-comparison`, `EulerSystemsAndKolyvaginSystems:ES.8`, `SelmerIwasawaCohomology:L3/iwasawa-descent`, `PadicMeasuresIwasawaAlgebras:L4`.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), TheoremB; Proposition 2.1.3; Lemma 2.2.7–Theorem 2.2.10.

**Planet:** Howard’s divisibility theorem.

### Weaker torsion hypothesis and localized bound

**Declaration:** `weak_torsion_localized_divisibility`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/weak-torsion-localized-divisibility`.

Under ordinary Heegner conditions and E(K)[p]=0, the CGLS Heegner family exists and the rank-one paired-torsion bound holds over Λ[1/p,1/(γ−1)]. The augmentation inversion can be removed under the source’s extra corank-one condition. The BCS/CGS error-controlled bounds supply stronger assertions in their stated branches; class-number retention alone does not do so.

**Additional hypotheses:** E(K)[p]=0.

**Proof or construction:** Repeat the construction with d(k) instead of k+1. Import the weak residual error estimate with its exceptional primes; retain the localization exactly.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`, `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`, `EulerSystemsAndKolyvaginSystems:ES.8`.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorems4.1.1–4.1.2.

### Crystalline characters near the identity

**Declaration:** `nearTrivialCharacter`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/crystalline-near-trivial-character`.

Choose γ∈Γ, a p-adic unit u generating the prescribed subgroup, and h with γ^h equal to its Artin image. Let ξ_n(γ)=u^n have infinity type (hn,−hn). For m≥1 define α_m=ξ_(p−1)p^(m−1); these are nontrivial crystalline anticyclotomic characters congruent to1 modulo p^m and approach1. Retain h and the chosen embeddings. No finite-order character is substituted for these crystalline twists.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K.

**Proof or construction:** Use the continuous character supplier and global algebraic Hecke-character construction. Apply the p-adic unit-power congruence to u; keep its h-dependent infinity type.

**Dependencies:** `PadicMeasuresIwasawaAlgebras:L0a`, `PadicHodgeRegulators:L3`, `HeegnerPointEulerSystems:HE.0/norm-reciprocity-level-compatibility`, `mathlib:PadicInt`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Definition 1.2.2.

**Uses that determine the API:** BCGS Lemma 1.2.3 and Theorem 1.2.7: evaluates integral formulas at nontrivial crystalline characters approaching1. CS §3.3: separates an integral determinant quotient by near-trivial evaluations.

**API:**

- `nearTrivialCharacter_apply` (projection): α_m(γ)=u^((p−1)p^(m−1)), with its chosen Artin/infinity-type h.
- `nearTrivialCharacter_succ` (relation): α_(m+1)=α_m^p for m≥1.
- `nearTrivialCharacter_congruent` (compatibility): α_m≡1 modulo p^m, by the unit-power congruence.
- `nearTrivialCharacter_nontrivial` (characterisation): For non-torsion u, α_m is nontrivial for every m≥1; its limit is1, which is not a member.

**Acceptance examples:**

- For p=5,m=1 the exponent is4, not1 or5.
- For p=5,m=2 the exponent is20, exactly five times the first exponent.
- If the supplied character has order dividing p−1, α_1 is trivial; non-torsion and arithmetic construction hypotheses are essential.

### Heegner specialization with the initial factor

**Declaration:** `near_trivial_heegner_specialization`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/near-trivial-heegner-specialization`.

If α≡1 modulo p^m and M(n)≥m, then κ^Λ_n(α)≡C_pκ_n^Heeg modulo p^m. Here C_p=(α_p−1)²(β_p−1)² for split p and C_p=Φ=(p+1)²−a_p² for inert p, in the prescribed normalization. The reduction exists because I_n⊂p^mℤ_p. C_p can be a nonunit; at split p its valuation is twice v_p(#Ẽ(𝔽_p)).

**Additional hypotheses:** E(K)[p]=0. α is an anticyclotomic twist sufficiently close to1; M(n)≥m.

**Proof or construction:** Project the universal-norm family to the initial level and compare HE.4 classes. Use α≡1 and the quotient map allowed by M(n)≥m; compute augmentation of Φ.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`, `HeegnerPointEulerSystems:HE.8/howard-stabilization-unit-comparison`, `HeegnerPointEulerSystems:HE.8/crystalline-near-trivial-character`, `HeegnerPointEulerSystems:HE.4/coefficient-and-prime-set-compatibility`, `HeegnerPointEulerSystems:HE.8/universal-norm-level-zero`, `HeegnerPointEulerSystems:HE.8/lambda-derivative-restriction`, `HeegnerPointEulerSystems:HE.8/near-trivial-character-congruence`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Lemma 1.1.5; CS Lemma 3.1.1.

### Nonzero bottom classes near the identity

**Declaration:** `near_trivial_bottom_nonvanishing`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/near-trivial-bottom-nonvanishing`.

There is a neighbourhood of1 such that every nontrivial α in it has κ^Heeg_1(α)≠0. This follows from a non-Λ-torsion family and the finite zero set of a nonzero one-variable series. The specialization at α=1 is not included: its nonvanishing is equivalent to the appropriate analytic-rank-one condition.

**Additional hypotheses:** E(K)[p]=0.

**Proof or construction:** Place the nonzero family in a finite free module after clearing its torsion-free denominators. Use Weierstrass zero isolation and exclude1 explicitly.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`, `HeegnerPointEulerSystems:HE.8/crystalline-near-trivial-character`, `PadicMeasuresIwasawaAlgebras:L4`, `HeegnerPointEulerSystems:HE.8/iwasawa-heegner-level-projection`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.1.6.

### Heegner divisibility profile

**Declaration:** `heegnerDivisibilityProfile`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/heegner-divisibility-profile`.

For the actual finite Heegner derivative system define M_r=min_(ν(n)=r) ind(κ_n), with values in ℕ∪{∞}; ind is the largest allowed p-divisibility in the coefficient module, and ind(0)=∞. Set M∞=inf_r M_r. Prime restrictions, coefficient ideals I_n and p-optimal parametrization are part of the data. M_0 is the bottom Heegner index and need not equal M∞.

**Additional hypotheses:** E(K)[p]=0.

**Proof or construction:** Instantiate the generic ES.4 divisibility index in the actual coefficient quotients. Take minima over the finite-support auxiliary set and the infimum over r; import rigidity before replacing the prime set.

**Dependencies:** `HeegnerPointEulerSystems:HE.4/heegner-coefficient-ideal`, `EulerSystemsAndKolyvaginSystems:ES.4`, `mathlib:Submodule.span`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Introduction definitions of M_r,M∞; §2.2.

**Uses that determine the API:** BCGS TheoremB: measures the complete finite derivative system. CS TheoremC: compares its infimum with Tamagawa valuation.

**API:**

- `heegnerDivisibilityProfile_at` (projection): M_r is the infimum of the supplied actual indices at ν(n)=r.
- `heegnerDivisibilityProfile_bottom` (simp): At r=0 the only conductor is1, so M₀=ind κ₁.
- `heegnerDivisibilityProfile_top` (characterisation): M_r=∞ iff every permitted class at level r is zero, with empty strata giving∞.
- `heegnerDivisibilityProfile_rescale` (compatibility): Common p^t-rescaling adds t to indices when coefficient depth allows it; truncation at the quotient depth is retained.

**Acceptance examples:**

- The zero system has M_r=∞ for every r and M∞=∞.
- A system with indices3 at conductor1 and1 at one-prime support has M₀=3 and M∞≤1.
- For indices2 and5 in one stratum the minimum is2; neither their sum nor maximum is the divisibility index.

### Optimal and distinguished lattice comparison

**Declaration:** `optimal_lattice_isogeny_comparison`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/optimal-lattice-isogeny-comparison`.

For E₀ optimal on X₀(N), E₁ optimal on X₁(N), and the distinguished E_• with T_f identified integrally with T_pE_•, the prescribed isogeny E₀→E_• is étale at odd p. For sufficiently near-trivial α, I_•(α)C_•(α)=I₀(α)C₀(α), where I is the bottom-class index and C the finite-cokernel local index modulo torsion. Neither factor is individually asserted equal under arbitrary isogeny.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K.

**Proof or construction:** Use the modular-symbol lattice and étale isogeny to identify Fil⁺ lattices. Track the global index of the isogeny and cancel it against the localization-cokernel index.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `KatoEulerSystems:L4`, `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), §1.2.2; Lemma 1.2.5; Wüthrich Theorem 4.

### Near-trivial logarithm index formula

**Declaration:** `twisted_logarithm_index_formula`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/twisted-logarithm-index-formula`.

With E_• and α sufficiently close to1, L_BDP(α⁻¹)≠0 and κ_1^•(α)≠0, let t_α=length_(ℤ_p^ur)(ℤ_p^ur/L_BDP(α⁻¹)), q_•=#H⁰(ℚ_p,E_•[p∞]), I_•=#(S_α/ℤ_pκ_1^•(α)), and C_•=#coker(loc_v) modulo torsion. Then p^tα q_•=I_•C_•. Use the source’s coefficient extension and square-root BDP normalization.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K.

**Proof or construction:** Apply the family explicit reciprocity law with its integral regulator cokernel. Use local duality to compute the H²/H⁰ correction and quotient the localization torsion.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/near-trivial-bottom-nonvanishing`, `HeegnerPointEulerSystems:HE.8/optimal-lattice-isogeny-comparison`, `GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class`, `PadicHodgeRegulators:L3`, `SelmerIwasawaCohomology:L3/semilocal-cohomology`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Lemma 1.2.3.

### Twisted anticyclotomic control formula

**Declaration:** `twisted_anticyclotomic_control`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/twisted-anticyclotomic-control`.

For m≫0 and α=α_m, a characteristic generator F_E of the strict-at-v, unrestricted-at-v̄ Greenberg dual satisfies #(ℤ_p/F_E(α⁻¹))=#Sha(W_α⁻¹/K)·C_α²·∏_(w|N)c_w^(p)(α⁻¹)·q_E². The finite Sha is the source’s propagated Selmer quotient. The formula is integral and uses all K-primes over N and the finite/torsion local cokernel.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K.

**Proof or construction:** Request the exact generic specialization theorem and identify each arithmetic term. Check near-trivial nonzero Euler factors and finite local/global kernels; account for both primes above each split bad prime.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/crystalline-near-trivial-character`, `HeegnerPointEulerSystems:HE.8/near-trivial-bottom-nonvanishing`, `SelmerIwasawaCohomology:L3/iwasawa-descent`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `HeegnerPointEulerSystems:HE.8/near-trivial-character-congruence`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.2.7 (JSW control theorem as used there).

### Tamagawa factors near the identity

**Declaration:** `near_trivial_tamagawa_stability`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/near-trivial-tamagawa-stability`.

For α≡1 modulo p^m the twisted local Tamagawa p-factor c_w^(p)(α) is congruent to the untwisted c_w^(p) modulo p^m. For m greater than the total relevant valuations this gives equality of the product of p-parts. Keep w|N over K; under the Heegner hypothesis its untwisted product is the square of the rational Tamagawa p-part.

**Additional hypotheses:** E(K)[p]=0.

**Proof or construction:** Use the unramified-twist local determinant calculation. Choose m above every valuation, then compare the p-parts and the two split K-places.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/crystalline-near-trivial-character`, `HeegnerPointEulerSystems:HE.3/bad-place-component-obstruction`, `NeronModelsAndSemistableAbelianVarieties:R11.4`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Lemma 1.2.8.

### Uniform arithmetic Kolyvagin error bound

**Declaration:** `arithmetic_rescaled_kolyvagin_bound`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/arithmetic-rescaled-kolyvagin-bound`.

There exist M and E depending only on T_pE such that, for α≡1 modulo p^m with m≥M and a permitted deep-prime Kolyvagin system κ̃ for T_α with κ̃₁≠0, the dual Selmer group is ℚ_p/ℤ_p⊕M_α⊕M_α and length M_α≤ind(κ̃₁)+E. The constant does not grow with m, the deep-prime set or common p-rescaling. Under the source’s surjectivity hypothesis E=0.

**Additional hypotheses:** E(K)[p]=0.

**Proof or construction:** Import generic error-tolerant descent from ES.4. Verify the actual Tate representation/dual local conditions and uniform image/evaluation constants. Check rescaled Heegner classes retain every transverse and finite/singular relation.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`, `HeegnerPointEulerSystems:HE.8/lambda-finite-singular-relation`, `EulerSystemsAndKolyvaginSystems:ES.4`, `HeegnerPointEulerSystems:HE.7/integral-tate-image-errors`, `HeegnerPointEulerSystems:HE.8/near-trivial-character-congruence`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.3.1 and its cited CGS proof.

### Exact paired Selmer length for a Heegner system

**Declaration:** `heegner_exact_sha_length`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/heegner-exact-sha-length`.

For p≥3, a surjective residual representation and the generic self-dual rank-one hypotheses, the specialized actual anticyclotomic Heegner system over a finite DVR R with κ₁≠0 gives length_R Sha(W_α/K)=2(M₀(α)−M∞(α)). No near-triviality is needed in the generic theorem; near-trivial α is used in the arithmetic application. The deep-prime restriction and rigidity hypotheses remain explicit.

**Additional hypotheses:** E(K)[p]=0. Residual G_Q representation surjective; R finite DVR; the source’s self-dual/cartesian hypotheses and κ₁≠0.

**Proof or construction:** Import generic prime-restriction rigidity and uniform stub structure from ES.4. Identify Heegner coefficient reductions and indices, then apply the exact paired-length formula.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/heegner-divisibility-profile`, `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`, `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`, `HeegnerPointEulerSystems:HE.8/lambda-finite-singular-relation`, `EulerSystemsAndKolyvaginSystems:ES.4`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Proposition 2.2.1; Theorem 2.2.2; Lemma 2.2.4.

### Integral main conjecture and twisted index square

**Declaration:** `integral_main_conjecture_index_square`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/integral-main-conjecture-index-square`.

Assume the integral anticyclotomic Greenberg main conjecture in Λ^ur with the BCGS square-root convention. For α_m sufficiently close to1, the p-optimal curve satisfies I₀(α)²=#Sha(W_α⁻¹/K)·∏_(w|N)c_w^(p)(α⁻¹)·q₀⁴. A rational main conjecture supplies only a bounded p-power error; it does not supply this exact equality.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K. Integral anticyclotomic Greenberg main conjecture and the p-optimal lattice.

**Proof or construction:** Evaluate the integral characteristic ideal identity. Substitute the logarithm and control equations, square the former, and cancel the nonzero local cokernel index.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/twisted-logarithm-index-formula`, `HeegnerPointEulerSystems:HE.8/twisted-anticyclotomic-control`, `HeegnerPointEulerSystems:HE.8/near-trivial-tamagawa-stability`, `HeegnerPointEulerSystems:HE.8/optimal-lattice-isogeny-comparison`, `ModularIwasawaMainConjectures:L0`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Corollary 1.2.12; Remark 1.2.11.

### BCGS nonvanishing from the main conjecture

**Declaration:** `bcgs_conditional_kolyvagin_nonvanishing`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/bcgs-conditional-kolyvagin-nonvanishing`.

Under (Heeg),(disc),(tor), p odd good ordinary and split in K, the rational anticyclotomic main conjecture (indeed its required lower divisibility after inverting p) implies κ_n^Heeg≠0 for some squarefree n of allowed Kolyvagin primes. No analytic-rank-one hypothesis is made and κ₁ may vanish.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K. Rational anticyclotomic main conjecture, kept as a theorem hypothesis.

**Proof or construction:** Assume all finite derivative classes vanish. Choose m deep enough and rescale specialized classes by p^(t+v_p(C_p)). Apply the uniform error bound to the rescaled system. Compare with logarithm/control and the rational main-conjecture p-error; choose t exceeding half the Tamagawa length plus all fixed errors to contradict the bounds.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/near-trivial-heegner-specialization`, `HeegnerPointEulerSystems:HE.8/near-trivial-bottom-nonvanishing`, `HeegnerPointEulerSystems:HE.8/twisted-logarithm-index-formula`, `HeegnerPointEulerSystems:HE.8/twisted-anticyclotomic-control`, `HeegnerPointEulerSystems:HE.8/near-trivial-tamagawa-stability`, `HeegnerPointEulerSystems:HE.8/arithmetic-rescaled-kolyvagin-bound`, `HeegnerPointEulerSystems:HE.8/heegner-divisibility-profile`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), TheoremA and §2.1.

**Planet:** BCGS nonvanishing theorem.

### BCGS refined divisibility from the integral conjecture

**Declaration:** `bcgs_conditional_refined_divisibility`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/bcgs-conditional-refined-divisibility`.

Assume p>3, surjective residual G_Q→GL₂(𝔽_p), good ordinary p split in K, (Heeg),(disc),(tor), a p-optimal parametrization, and the integral anticyclotomic main conjecture. Then M∞ of the finite Heegner system is finite and equals Σ_(ℓ|N)v_p(c_ℓ(E/ℚ)). This is half the sum over K-primes; it is neither M₀ nor the order of Sha.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K. p>3; residual surjectivity; p-optimal parametrization; integral main conjecture.

**Proof or construction:** Use integral index square and exact paired Sha length to compute M∞(α)=half the K-Tamagawa length+v_p(C_p). Apply specialization congruence and deep-prime rigidity to strip the initial factor and recover the untwisted finite-system index.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/bcgs-conditional-kolyvagin-nonvanishing`, `HeegnerPointEulerSystems:HE.8/integral-main-conjecture-index-square`, `HeegnerPointEulerSystems:HE.8/heegner-exact-sha-length`, `HeegnerPointEulerSystems:HE.8/near-trivial-heegner-specialization`, `HeegnerPointEulerSystems:HE.8/near-trivial-tamagawa-stability`, `HeegnerPointEulerSystems:HE.8/heegner-divisibility-profile`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), TheoremB and §2.2.

**Planet:** Refined Kolyvagin divisibility theorem.

### Arithmetic strict ordinary Selmer complex comparison

**Declaration:** `strict_ordinary_selmer_complex`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/strict-ordinary-selmer-complex`.

For CS coefficients X=T⊗Λ and twists T_α, instantiate the imported Selmer complex as the cone of global cochains mapping to ⊕_(v|p)RΓ(K_v,X/X_v⁺) and ⊕_(v|N)Cone(RΓ_ur→RΓ). Its H¹ is the strict ordinary Selmer lattice S; its H² is related by Poitou–Tate to the all-p ordinary discrete dual X_Gr(A). This rank-one dual is distinct from BCS’s torsion (0,empty) Greenberg module.

**Additional hypotheses:** E(K)[p]=0. p unramified in K.

**Proof or construction:** Use the generic cone/local-condition complex rather than defining a new derived category. Identify strict local conditions with the source’s ordinary cohomology and prove perfectness/base change at the exact coefficients. Use Poitou–Tate to identify H² and finite local correction groups.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `SelmerIwasawaCohomology:L3/iwasawa-descent`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `ArithmeticGaloisDuality:D7`, `ModularIwasawaMainConjectures:L0`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), §3.2, equation(3.3), Theorem 3.2.1.

### Determinantal Heegner element

**Declaration:** `determinantalHeegnerElement`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/determinantal-heegner-element`.

Under the source’s rank-one and perfectness assumptions, use the canonical rational isomorphism Q(Λ)⊗det_Λ⁻¹ RΓ̃_f(K,T⊗Λ) ≃ Q(Λ)⊗(S⊗_Λ S^ι). Define z̃∞ as the inverse image of y∞⊗y∞ under this isomorphism. The main conjecture asserts z̃∞ generates the integral determinant lattice, not merely its rationalization.

**Additional hypotheses:** E(K)[p]=0. p unramified in K; the source’s rational determinant comparison.

**Proof or construction:** Apply the supplier determinant functor to the perfect Selmer complex. Identify the rank-one rational factors by duality; pull back the actual Heegner tensor.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/strict-ordinary-selmer-complex`, `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`, `ModularIwasawaMainConjectures:L0`, `PadicMeasuresIwasawaAlgebras:L5`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Conjecture 3.2.2 and preceding determinant isomorphism.

**Uses that determine the API:** CS Proposition 3.2.3: tests basis of the integral determinant lattice. CS Proposition 3.3.2: transports the element to a twisted Selmer tensor.

**API:**

- `determinantalHeegnerElement_image` (projection): The rational determinant map sends z̃∞ to y∞⊗y∞ with the second factor ι-twisted.
- `determinantalHeegnerElement_unique` (characterisation): It is the unique rational determinant preimage of that Heegner tensor.
- `determinantalHeegnerElement_rescale` (functoriality): Rescaling y∞ by a multiplies z̃∞ by a·ι(a), not merely a.
- `determinantalHeegnerElement_baseChange` (compatibility): Compatible derived base change and determinant comparison carry z̃∞ to the tensor of the specialized bottom classes.

**Acceptance examples:**

- The zero Heegner class gives the zero determinant element.
- With identity involution and y rescaled by p, the element scales by p².
- In a one-dimensional rationalized determinant line, p times an integral basis is nonzero but is not an integral basis.

### Heegner determinant and characteristic ideals

**Declaration:** `determinant_characteristic_ideal_comparison`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/determinant-characteristic-ideal-comparison`.

The assertion that z̃∞ is an integral determinant basis is equivalent to char_Λ(S/Λy∞)·char_Λ(S/Λy∞)^ι=char_Λ(X_Gr(A)_tors) for the CS all-p ordinary dual. Writing a square requires the source’s ι-invariance; rational equality cannot certify an integral basis.

**Additional hypotheses:** E(K)[p]=0.

**Proof or construction:** Compute determinants of torsion cohomology and the free rank-one factors. Track ι on the second factor and compare lattices at every height-one prime.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/determinantal-heegner-element`, `HeegnerPointEulerSystems:HE.8/strict-ordinary-selmer-complex`, `PadicMeasuresIwasawaAlgebras:L4`, `PadicMeasuresIwasawaAlgebras:L5`, `HeegnerPointEulerSystems:HE.8/determinantal-heegner-image`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Proposition 3.2.3.

### Ordinary local specialization defect

**Declaration:** `ordinary_local_specialization_defect`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/ordinary-local-specialization-defect`.

For near-trivial nontrivial α, the local finite/ordinary comparison at v|p contributes the p-part of #Ẽ(𝔽_v), identified with the corresponding H⁰(K_v,A_v⁻(α±)). Set L_p=∏_(v|p)#Ẽ(𝔽_v). For split p v_p(Φ)=v_p(L_p)=2v_p(#Ẽ(𝔽_p)); for inert p use #Ẽ(𝔽_(p²))=(p+1)²−a_p². Retain both signs of the twist.

**Additional hypotheses:** E(K)[p]=0. p unramified in K; α sufficiently near1.

**Proof or construction:** Use local duality on the ordinary exact sequence. Stabilize Frobenius eigenvalues near1 and calculate the reduction cardinalities.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/crystalline-near-trivial-character`, `HeegnerPointEulerSystems:HE.8/initial-euler-factor`, `ArithmeticGaloisDuality:R02.4`, `NeronModelsAndSemistableAbelianVarieties:R11.4`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Lemma 3.3.3 and proof of TheoremC.

### Specialized Heegner determinant lattice

**Declaration:** `determinant_specialization_lattice`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/determinant-specialization-lattice`.

For m≫0, α=α_m, and rank-one S_(α±1), the specialized rational determinant map to S_α⊗S_α⁻¹ sends the integral determinant lattice, up to a ℤ_p-unit, to L_p²·Tam_E²·#X_BK(T_α*/K) times that tensor lattice. Here X_BK is the finite quotient of the propagated Selmer group in CS; for a general twist it need not be the Bloch–Kato group. Tam_E=∏_(ℓ|N)c_ℓ over ℚ.

**Additional hypotheses:** E(K)[p]=0. p unramified in K; both twist Selmer lattices have rank one; m sufficiently large.

**Proof or construction:** Compare strict and finite local-condition complexes through their exact triangles. Use H¹ freeness, the dual H² description and the finite quotient by divisibility. Compute local H⁰ and bad-prime terms, retaining the squared rational Tamagawa product.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/strict-ordinary-selmer-complex`, `HeegnerPointEulerSystems:HE.8/determinantal-heegner-element`, `HeegnerPointEulerSystems:HE.8/ordinary-local-specialization-defect`, `HeegnerPointEulerSystems:HE.8/near-trivial-tamagawa-stability`, `SelmerIwasawaCohomology:L3/iwasawa-descent`, `ArithmeticGaloisDuality:R02.4`, `PadicMeasuresIwasawaAlgebras:L5`, `HeegnerPointEulerSystems:HE.8/determinantal-heegner-image`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Proposition 3.3.2.

### Twisted index square from the determinant conjecture

**Declaration:** `determinantal_twisted_index_square`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/determinantal-twisted-index-square`.

If z̃∞ generates the integral Selmer determinant and α is sufficiently close to1 but nontrivial, then the square of the Heegner bottom index equals L_p² Tam_E² #X_BK(T_α*/K), up to a ℤ_p-unit (equivalently as p-valuations). The transported Φ comparison and unit normalization remain explicit.

**Additional hypotheses:** E(K)[p]=0. Integral determinantal main conjecture; p unramified in K.

**Proof or construction:** Base change the integral determinant basis. Use the specialization lattice formula and identify the two Heegner tensor factors under anticyclotomic duality.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/determinant-specialization-lattice`, `HeegnerPointEulerSystems:HE.8/determinantal-heegner-element`, `HeegnerPointEulerSystems:HE.8/near-trivial-bottom-nonvanishing`, `HeegnerPointEulerSystems:HE.8/near-trivial-heegner-specialization`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Corollary 3.3.4.

### Castella–Sano refined conjecture equivalence

**Declaration:** `castella_sano_refined_equivalence`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/castella-sano-refined-equivalence`.

For p>3, residual G_Q surjectivity, good ordinary p unramified in K, (Heeg),(disc), and a parametrization whose Manin constant is prime to p, M∞=v_p(Tam_E) holds if and only if the integral determinantal Heegner main conjecture of CS3.2.2 holds. The theorem permits inert p; it does not prove that conjecture at inert p.

**Additional hypotheses:** E(K)[p]=0. p>3; residual G_Q surjectivity; p unramified in K; p∤Manin constant.

**Proof or construction:** Forward from the main conjecture: compute specialized index and exact Selmer length, then remove v_p(Φ)=v_p(L_p) using rigidity. Reverse: use the Euler-system upper bound to locate z̃∞ integrally, compare sufficiently near-trivial specializations, and apply the exact SU3.2 separation criterion to show its lattice quotient is a unit.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/determinantal-twisted-index-square`, `HeegnerPointEulerSystems:HE.8/determinant-characteristic-ideal-comparison`, `HeegnerPointEulerSystems:HE.8/heegner-exact-sha-length`, `HeegnerPointEulerSystems:HE.8/near-trivial-heegner-specialization`, `HeegnerPointEulerSystems:HE.8/ordinary-local-specialization-defect`, `HeegnerPointEulerSystems:HE.8/arithmetic-rescaled-kolyvagin-bound`, `HeegnerPointEulerSystems:HE.8/heegner-divisibility-profile`, `PadicMeasuresIwasawaAlgebras:L4`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), TheoremC; §3.3 proof.

**Planet:** Castella–Sano equivalence theorem.

### Q[n]_0=ΦP[n]

**Declaration:** `universalNormFamily_level_zero`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/universal-norm-level-zero`.

Q[n]_0=ΦP[n].

**Additional hypotheses:** E(K)[p]=0.

**Proof or construction:** Apply the defining construction and the exact supplied projection/comparison, with the arithmetic identifications in the parent node.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/universal-norm-heegner-family`.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), Lemmas2.3.2–2.3.3; [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation.

### Under Iwasawa–Shapiro, level k equals the Kummer class of y_k

**Declaration:** `heegnerIwasawaClass_level`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/iwasawa-heegner-level-projection`.

Under Iwasawa–Shapiro, level k equals the Kummer class of y_k.

**Additional hypotheses:** E(K)[p]=0.

**Proof or construction:** Apply the defining construction and the exact supplied projection/comparison, with the arithmetic identifications in the parent node.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1 and Remark 4.1.3.

### Restriction recovers the invariant differentiated Kummer class

**Declaration:** `lambdaDerivativeClass_restrict`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/lambda-derivative-restriction`.

Restriction recovers the invariant differentiated Kummer class.

**Additional hypotheses:** E(K)[p]=0.

**Proof or construction:** Apply the defining construction and the exact supplied projection/comparison, with the arithmetic identifications in the parent node.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`.

**Source:** [howard](https://arxiv.org/pdf/1202.6340), §2.3, construction following Lemma 2.3.3; [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Theorem 4.1.1, proof and class-number-shift/local-condition adaptation.

### α_m≡1 modulo p^m, by the unit-power congruence

**Declaration:** `nearTrivialCharacter_congruent`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/near-trivial-character-congruence`.

α_m≡1 modulo p^m, by the unit-power congruence.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K.

**Proof or construction:** Apply the defining construction and the exact supplied projection/comparison, with the arithmetic identifications in the parent node.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/crystalline-near-trivial-character`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Definition 1.2.2.

### The rational determinant map sends z̃∞ to y∞⊗y∞ with the second factor ι-twisted

**Declaration:** `determinantalHeegnerElement_image`. **Packet identity:** `HeegnerPointEulerSystems:HE.8/determinantal-heegner-image`.

The rational determinant map sends z̃∞ to y∞⊗y∞ with the second factor ι-twisted.

**Additional hypotheses:** E(K)[p]=0. p unramified in K; the source’s rational determinant comparison.

**Proof or construction:** Apply the defining construction and the exact supplied projection/comparison, with the arithmetic identifications in the parent node.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/determinantal-heegner-element`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), Conjecture 3.2.2 and preceding determinant isomorphism.


## HE.8b declaration inventory

### BDP square-root convention comparison

**Declaration:** `bdp_function_convention_comparison`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/bdp-function-convention-comparison`.

After the same coefficient extension and primitive/imprimitive local normalizations, BCS’s single-power anticyclotomic L-function generates the same ideal as (L_BDP^BCGS)² in Λ^ur. Period/unit conventions are compared as ideals, not by arbitrary exact equality of functions. All nonunit Euler factors in changes of local condition remain visible.

**Proof or construction:** Import the BDP construction and coefficient convention from GZ.9. Align both source conventions and their Euler factors before comparing generated ideals.

**Dependencies:** `GrossZagierAndArithmeticHeights:GZ.9/bdp-square-root-comparison`, `GrossZagierAndArithmeticHeights:GZ.9/imprimitive-function-dictionary`, `AutomorphicPadicLFunctions:L3h`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.2.1; BCS Conjecture 1.2.3.

### Anticyclotomic main-conjecture comparison

**Declaration:** `anticyclotomic_formulation_comparison`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison`.

In the split ordinary setting, the Heegner-index divisibility char(X_tors) ⊃ char(S/Λy∞)² is equivalent to the corresponding Greenberg/BDP divisibility char(X_(0,empty))Λ^ur ⊃ (L_BDP²), with the reverse divisibilities also equivalent. Retain the coefficient extension, finite local cokernels, ι and nonunit Euler factors. This comparison does not itself prove either divisibility.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K.

**Proof or construction:** Instantiate the supplier’s four-term Poitou–Tate comparison and explicit reciprocity. Identify the primitive anticyclotomic Heegner and Greenberg terms and clear only the stated units.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`, `HeegnerPointEulerSystems:HE.8/twisted-logarithm-index-formula`, `HeegnerPointEulerSystems:HE.8b/bdp-function-convention-comparison`, `SelmerIwasawaCohomology:L2/change-of-conditions`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `PadicHodgeRegulators:L3`, `ModularIwasawaMainConjectures:L0`.

**Source:** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf), Proposition 4.2.1; BCS Theorem 4.1.3 and Corollary 4.1.4.

### Auxiliary quadratic fields for BCS descent

**Declaration:** `auxiliary_quadratic_field_verification`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/auxiliary-quadratic-field-verification`.

For the BCS irreducible branch, choose the auxiliary real quadratic F with p inert, D_F odd and every D_F-prime split in K; for ℓ|N choose ℓ inert in F when ℓ≡−1 modulo p and split otherwise. Retain irreducibility after restricting to G_(FK) and G_(F(ζ_p)), the p=5 exceptional real field exclusion and finite discriminant avoidance. These are the precise hypotheses used by the Hilbert/quartic-CM supplier.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K. p>3; E[p] irreducible over G_Q; the source’s auxiliary-field and Fujiwara(H1)–(H3) assumptions.

**Proof or construction:** Use simultaneous splitting and finite-avoidance Chebotarev. Check the residual dihedral possibilities and restriction conditions before invoking Wan/Fujiwara. Verify every source condition, including the discarded p=5 field.

**Dependencies:** `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `AutomorphicCongruences:L5w`.

**Source:** [bcs](https://arxiv.org/pdf/2405.00270v2), Proposition 5.2.1; Lemma 5.2.3.

### Heegner Euler-system divisibility for BCS

**Declaration:** `anticyclotomic_euler_system_divisibility`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/anticyclotomic-euler-system-divisibility`.

Under p odd ordinary, (Heeg),(disc) and E[p] irreducible over G_K, the actual Heegner family gives rank one and char(X_tors) ⊃ char(S/Λy∞)² after inverting p. In the split case the equivalent Greenberg/BDP bound holds. Under residual G_Q surjectivity the bounds are integral. This is the weak-hypothesis CGS/BCS bound, not Howard B with its hypotheses silently removed.

**Additional hypotheses:** E[p] irreducible over G_K; integral branch additionally has G_Q residual surjectivity.

**Proof or construction:** Use the exact weaker residual arithmetic hypotheses and imported Λ-adic error bound. Pass paired torsion structure through the normalized Heegner line and formulate the matching Greenberg bound.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`, `HeegnerPointEulerSystems:HE.8/lambda-finite-singular-relation`, `HeegnerPointEulerSystems:HE.8/arithmetic-rescaled-kolyvagin-bound`, `EulerSystemsAndKolyvaginSystems:ES.8`, `HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison`.

**Source:** [bcs](https://arxiv.org/pdf/2405.00270v2), Theorem 4.2.1 (using CGS Theorem 5.5.2).

### BCS anticyclotomic reverse divisibility

**Declaration:** `anticyclotomic_reverse_product_divisibility`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/anticyclotomic-reverse-product-divisibility`.

For the chosen auxiliary F, the imported Wan/Fujiwara quartic-CM theorem, shared two-variable restriction/factorization, and anticyclotomic projection imply the reverse product divisibility for E/K and E^F/K against their BDP functions. Specialize the Greenberg local conditions exactly as in BCS §5, and obtain individual reverse divisibilities by combining the opposite Euler-system bounds and cancelling nonzero factors. Integral cancellation uses μ=0 and the source’s period/regulator hypotheses.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K. p>3; irreducible residual G_Q representation; all auxiliary-field and period hypotheses of the suppliers.

**Proof or construction:** Import the two-variable Selmer restriction and p-adic L-function product factorization. Project to the anticyclotomic quotient using the stated local-condition comparison and μ-vanishing. Combine nonzero product divisibility with the two individual opposite bounds; cancel in the integral domain and upgrade under surjectivity.

**Dependencies:** `HeegnerPointEulerSystems:HE.8b/auxiliary-quadratic-field-verification`, `HeegnerPointEulerSystems:HE.8b/anticyclotomic-euler-system-divisibility`, `HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison`, `HeegnerPointEulerSystems:HE.8b/bdp-function-convention-comparison`, `AutomorphicCongruences:L5a`, `AutomorphicCongruences:L5w`, `AutomorphicPadicLFunctions:L3h`, `PadicMeasuresIwasawaAlgebras:L4`.

**Source:** [bcs](https://arxiv.org/pdf/2405.00270v2), §5.1–§5.3; Proposition 5.2.1; proof of Theorems1.2.2/1.2.4.

### Rational Heegner-point main conjecture

**Declaration:** `rational_heegner_main_conjecture`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/rational-heegner-main-conjecture`.

For p>3 good ordinary, (disc),(Heeg),(spl), and E[p] irreducible over G_Q, S and X have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λy∞)² in Λ[1/p]. No analytic-rank condition, p∤h_K assumption or residual surjectivity is added; integrality is a different branch.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K. p>3; E[p] irreducible over G_Q.

**Proof or construction:** Complete the opposite-divisibility cancellation and translate the normalized family line. Record rank one with the paired torsion convention and keep p inverted.

**Dependencies:** `HeegnerPointEulerSystems:HE.8b/anticyclotomic-reverse-product-divisibility`, `HeegnerPointEulerSystems:HE.8b/anticyclotomic-euler-system-divisibility`, `HeegnerPointEulerSystems:HE.8/howard-stabilization-unit-comparison`.

**Source:** [bcs](https://arxiv.org/pdf/2405.00270v2), Theorem 1.2.2(a).

**Planet:** Rational Heegner main conjecture.

### Integral Heegner-point main conjecture

**Declaration:** `integral_heegner_main_conjecture`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/integral-heegner-main-conjecture`.

For the same ordinary split setting with p>3 and residual G_Q→GL₂(𝔽_p) surjective, S and X have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λy∞)² integrally in Λ. The integral period, μ and generic descent hypotheses are those verified in the BCS supplier chain.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K. p>3; residual G_Q representation surjective.

**Proof or construction:** Use integral opposite divisibilities and unit normalization. Verify the absence of a residual p-power error at the μ component.

**Dependencies:** `HeegnerPointEulerSystems:HE.8b/anticyclotomic-reverse-product-divisibility`, `HeegnerPointEulerSystems:HE.8b/anticyclotomic-euler-system-divisibility`, `HeegnerPointEulerSystems:HE.8/howard-stabilization-unit-comparison`.

**Source:** [bcs](https://arxiv.org/pdf/2405.00270v2), Theorem 1.2.2(b).

**Planet:** Integral Heegner main conjecture.

### Rational Greenberg–BDP main conjecture

**Declaration:** `rational_greenberg_bdp_main_conjecture`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/rational-greenberg-bdp-main-conjecture`.

Under the rational Heegner main-conjecture hypotheses, X_(0,empty) is Λ-torsion and char_Λ(X_(0,empty))Λ^ur=(L_BDP²) in Λ^ur[1/p], where L_BDP is BCGS’s square-root function. This torsion module is not CS’s all-p ordinary rank-one dual.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K. p>3; residual irreducibility over G_Q.

**Proof or construction:** Apply the exact formulation comparison and source-normalization dictionary.

**Dependencies:** `HeegnerPointEulerSystems:HE.8b/rational-heegner-main-conjecture`, `HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison`, `HeegnerPointEulerSystems:HE.8b/bdp-function-convention-comparison`.

**Source:** [bcs](https://arxiv.org/pdf/2405.00270v2), Theorem 1.2.4(a).

**Planet:** Rational Greenberg–BDP theorem.

### Integral Greenberg–BDP main conjecture

**Declaration:** `integral_greenberg_bdp_main_conjecture`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/integral-greenberg-bdp-main-conjecture`.

Under the integral Heegner main-conjecture hypotheses, X_(0,empty) is Λ-torsion and char_Λ(X_(0,empty))Λ^ur=(L_BDP²) integrally. The coefficient ring Λ^ur and p-primary content are retained.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K. p>3; residual G_Q surjectivity.

**Proof or construction:** Apply the integral formulation comparison, preserving all nonunit factors.

**Dependencies:** `HeegnerPointEulerSystems:HE.8b/integral-heegner-main-conjecture`, `HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison`, `HeegnerPointEulerSystems:HE.8b/bdp-function-convention-comparison`.

**Source:** [bcs](https://arxiv.org/pdf/2405.00270v2), Theorem 1.2.4(b).

**Planet:** Integral Greenberg–BDP theorem.

### Eisenstein anticyclotomic theorem interface

**Declaration:** `eisenstein_main_conjecture_adapter`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/eisenstein-main-conjecture-adapter`.

For the exact CGS2025 branch requested from BSD.7a, assume the semisimple residual representation φ⊕ωφ⁻¹ with φ|_(G_p)≠1,ω and the supplier’s remaining Heegner/ordinary/split hypotheses. Its integral Heegner/Greenberg equality, in the agreed coefficient and BDP conventions, supplies BCGS Theorem 1.2.13(i). This node is an adapter, not a duplicate proof of CGS or an extension to excluded local characters.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K. φ|G_p≠1,ω; the exact additional hypotheses of the BSD.7a CGS2025 theorem, not the older CGLS(Sel) branch.

**Proof or construction:** Import the independent early Eisenstein proof from BSD.7a. Compare the bottom Λ-line and the BDP square convention; preserve every residual local exclusion.

**Dependencies:** `RankZeroOneBSD:BSD.7a`, `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `HeegnerPointEulerSystems:HE.8b/bdp-function-convention-comparison`, `HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.2.13(i), citing CGS TheoremsA/C.

**Planet:** Anticyclotomic Eisenstein main conjecture.

### Split-prime Kolyvagin nonvanishing branches

**Declaration:** `split_kolyvagin_nonvanishing_branches`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/split-kolyvagin-nonvanishing-branches`.

BCGS finite-system nonvanishing is unconditional in each acquired main-conjecture branch: (i) the requested CGS Eisenstein local-character branch; (ii) p>3 and residual G_Q irreducibility; (iii) p>3 and residual surjectivity. In each case apply the conditional TheoremA with the exact branch hypotheses. No p=3 irreducible branch is inferred from BCS.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K.

**Proof or construction:** Discharge only the rational main-conjecture hypothesis via the matching branch. Keep the different local and residual conditions attached to each corollary.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/bcgs-conditional-kolyvagin-nonvanishing`, `HeegnerPointEulerSystems:HE.8b/rational-greenberg-bdp-main-conjecture`, `HeegnerPointEulerSystems:HE.8b/integral-greenberg-bdp-main-conjecture`, `HeegnerPointEulerSystems:HE.8b/eisenstein-main-conjecture-adapter`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), Theorem 1.2.13 and TheoremA.

### Split-prime refined Kolyvagin divisibility

**Declaration:** `split_refined_kolyvagin_divisibility`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/split-refined-kolyvagin-divisibility`.

For p>3 residual G_Q surjective, ordinary split Heegner setting and p-optimal parametrization, M∞=Σ_(ℓ|N)v_p(c_ℓ(E/ℚ)). The integral BCS theorem discharges the conditional TheoremB; rational irreducibility alone does not discharge it.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K. p>3; residual surjectivity; p-optimal parametrization.

**Proof or construction:** Import integral Greenberg equality and apply the arithmetic conditional theorem.

**Dependencies:** `HeegnerPointEulerSystems:HE.8/bcgs-conditional-refined-divisibility`, `HeegnerPointEulerSystems:HE.8b/integral-greenberg-bdp-main-conjecture`.

**Source:** [bcgs](https://arxiv.org/pdf/2312.09301v2), TheoremB and Theorem 1.2.13(iii).

### Split determinantal Heegner main conjecture

**Declaration:** `split_determinantal_heegner_main_conjecture`. **Packet identity:** `HeegnerPointEulerSystems:HE.8b/split-determinantal-heegner-main-conjecture`.

In the CS TheoremC setting with p split in K, the integral BCS Heegner main conjecture and determinant/characteristic comparison show z̃∞ generates its integral Selmer determinant. Consequently the refined finite Heegner index equals v_p(Tam_E). For inert p the main-conjecture hypothesis is still unproved by this chain.

**Additional hypotheses:** E(K)[p]=0. p splits as v v̄ in K. p>3; residual surjectivity; p∤Manin constant.

**Proof or construction:** Translate the integral characteristic equality to the determinant formulation. Apply the CS equivalence with its Manin and residual hypotheses.

**Dependencies:** `HeegnerPointEulerSystems:HE.8b/integral-heegner-main-conjecture`, `HeegnerPointEulerSystems:HE.8/determinant-characteristic-ideal-comparison`, `HeegnerPointEulerSystems:HE.8/castella-sano-refined-equivalence`.

**Source:** [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf), TheoremC; Proposition 3.2.3.

## Exact supplier contracts

Each request is an open proof/interface boundary, even where a general supplier stage already exists. Finer matching declarations are imported directly. A finite BDP formula, real Ratner theorem or cyclotomic endpoint is not promoted into a broader integral family statement.

- **`PadicMeasuresIwasawaAlgebras:L1`:** Completed group-ring inverse limits and the actual compact Λ-modules H_k[n], retaining finite Δ and class-group p-parts.
- **`PadicMeasuresIwasawaAlgebras:L5`:** Compact inverse-limit lifting with compatible auxiliary norm maps; determinant/base-change exactness for a perfect ordinary Selmer complex, including non-flat specialization correction terms.
- **`PadicMeasuresIwasawaAlgebras:L4`:** One-variable Weierstrass zero isolation, pseudo-isomorphism/characteristic ideals with ι, and the exact near-trivial specialization separation criterion used by CS via SU Lemma 3.2. Infinitely many accumulating evaluations alone do not justify an integral unit assertion.
- **`PadicMeasuresIwasawaAlgebras:L0a`:** Continuous arithmetic anticyclotomic character spaces and evaluation with the chosen γ,u,h; the crystalline algebraic-Hecke characters α_m must retain infinity type (h(p−1)p^(m−1),−h(p−1)p^(m−1)).
- **`PadicHodgeRegulators:L3`:** Ordinary filtration and unit root; integral family big logarithm with explicit finite cokernel and CH2018 Theorem 5.7 Heegner reciprocity, at the exact anticyclotomic coefficients and chosen lattice. Do not infer the full family law from a finite point formula. Certify the BCGS local invariant/unit-root normalization on the distinguished lattice, distinguishing full T/A invariants from the ordinary unramified quotient and reduction torsion.
- **`EulerSystemsAndKolyvaginSystems:ES.3`:** The general Λ-adic derivative/finite-singular system with cyclic Galois tensor, actual coefficient quotients and change-of-generator functoriality. HE supplies the arithmetic family and verifies the relations.
- **`EulerSystemsAndKolyvaginSystems:ES.4`:** BCGS Proposition 2.2.1 prime-restriction rigidity, Lemma 2.2.4 uniform stub structure and Theorem 2.2.2 exact paired Sha length, with finite DVR, p≥3, residual surjectivity and self-dual/cartesian hypotheses; also the rescaling-stable bounded-error variant used in Theorem 1.3.1. These generic proofs are owned here, not copied into HE.
- **`EulerSystemsAndKolyvaginSystems:ES.8`:** Height-one Λ-adic Kolyvagin specialization and uniform control errors, paired torsion and anticyclotomic functional equation. Export distinct clean Howard and weaker CGS/BCS residual branches; the latter has rational p-errors unless surjectivity gives integral control.
- **`HilbertModularVarietiesAndShimuraCurves:H5`:** Admissible definite/indefinite quaternionic CM reduction/component maps, P-new degeneracy maps at P and ramified discriminant primes, and their injectivity on the exact weight-two cuspidal pieces. Arithmetic weighted-trace and conductor projections remain HE-owned.
- **`GeometryOfNumbersAndQuadraticArithmetic:GN.4`:** Extend beyond current real Lie-group Ratner nodes: over F_P, classify/average unipotent orbits in products of cocompact SL₂(F_P) quotients as CV-dynamics Theorem 2.29 (Margulis–Tomanov11.2/Ratner3); give twisted-diagonal stabilizers as Lemma 2.30 and partition/commensurability criterion2.31–2.35. Q_p is the directly referenced Ratner case; general finite F_P requires a precise acquired theorem, not extrapolation.
- **`FaltingsFinitenessAndIsogenyTheorems:R28.4`:** Uniform finiteness of torsion in the specified relative ring-class tower and the quotient/isotypic descent used in CV4.10, including the actual endomorphism field and finite G₀ averaging. Request only this arithmetic export; generic Tate/isogeny theory stays with R28.
- **`GL2AutomorphicRepresentationsAndTransfer:R17.5`:** Jacquet–Langlands transfer and P-new test vectors with CV(H1),(H2), admissible definite parity and nonexceptionality. Retain local conductor conditions, not merely existence of a transferred representation.
- **`GrossZagierAndArithmeticHeights:GZ.4`:** The exact parallel-weight-two CM local sign formula used in CV Lemma 1.1, retaining N′ coprime to D and the moving P-character factor before stabilization.
- **`KatoEulerSystems:L4`:** Add Wüthrich 2014 Theorem 4/Proposition 8 distinguished E_• integral modular-symbol Tate lattice and étale isogeny comparison; also Theorem 13 integral Kato class and Theorem 3/16 reducible-residual integral divisibility, using IntegralIwasawaTheory L4 Ferrero–Washington. Do not export arbitrary-isogeny integral lattice equality or retain only a rational divisibility. HE uses the lattice comparison, BSD.7a the integral Euler-system branch.
- **`AutomorphicCongruences:L5a`:** BCS v2 Theorem 4.1.3/Corollary 4.1.4 two-variable ordinary/Greenberg four-term comparison (current stage locator4.2.1 is the anticyclotomic Euler-system bound); Proposition 5.1.1 Selmer restriction and5.1.2 p-adic L-function factorization with compatible primitive periods and coefficient extension. The anticyclotomic return proof is HE.8b; completed L5b is not an input.
- **`AutomorphicCongruences:L5w`:** Wan2015 GU(2,2) Hilbert/quartic-CM congruence divisibility with all Fujiwara(H1)–(H3), residual restriction, ramification and period hypotheses of BCS Proposition 5.2.1. The p>3 restriction and p=5 exclusion remain until explicitly removed by an acquired source.
- **`AutomorphicPadicLFunctions:L3h`:** Hsieh2014 TheoremB anticyclotomic toric μ=0 and the BCS Proposition 4.2.2 projection/comparison, at the exact ordinary irreducible branch and chosen primitive/imprimitive factors. Katz’s CM μ theorem for the Eisenstein branch is a different new-owner request.
- **`RankZeroOneBSD:BSD.7a`:** Export the independent early CGS2025 TheoremsA/C anticyclotomic Eisenstein equality with φ|G_p≠1,ω and every remaining source hypothesis. It may use only early HE.8 classes, never HE.8b equality or late BCGS/CS applications. Add the missing imaginary-quadratic elliptic-unit IMC owner (Rubin 1991/1994, Hida–Tilouine0.3, Hida 2010 μ=0) and integral Wüthrich KatoL4 suppliers before certifying this branch.
- **`ArithmeticGaloisDuality:R02.4`:** Local duality and exact Poitou–Tate with ordinary/finite/strict local conditions, integral finite cokernels and paired Selmer quotient lengths; retain real/Tate corrections when used by HE.7 imports.
- **`ArithmeticGaloisDuality:D7`:** Continuous derived Selmer complexes over Λ, perfectness under the stated finite cohomology hypotheses, duality and compatibility with derived specialization. Generic derived constructions are not recreated in the Heegner packet.
- **`ModularIwasawaMainConjectures:L0`:** Generic determinant and characteristic-ideal formulations for the exact ordinary Selmer complex, rank-one free rational factors and torsion cohomology. This is a formulation supplier, not a cyclotomic equality or proof of the inert anticyclotomic conjecture.
- **`NeronModelsAndSemistableAbelianVarieties:R11.4`:** Actual component/Tamagawa and good ordinary reduction invariants with p-primary local Kummer comparison, including unramified twists; identify the source’s #Ẽ(𝔽_v) and c_w terms integrally.
- **`SelmerIwasawaCohomology:L3/iwasawa-descent`:** The generic derived descent exists, but BCGS Theorem 1.2.7 needs the integral JSW specialization formula at (0,empty) local conditions with exact C², Tamagawa and H⁰ torsion factors. CS Proposition 3.3.2 needs strict all-p ordinary complex base change; these two interfaces are distinct. Certify the BCGS local invariant/unit-root normalization on the distinguished lattice, distinguishing full T/A invariants from the ordinary unramified quotient and reduction torsion.
- **`GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class`:** Existing finite weight-two logarithm comparison is imported. Extend GZ.9 to the actual Λ-adic family explicit reciprocity law CH2018 Theorem 5.7 with integral E_• normalization, finite regulator cokernel and the stated BDP coefficient ring; do not substitute a rational finite-level law.
- **`SelmerIwasawaCohomology:L2/greenberg-condition`:** Existing condition uses inertia-kernel Greenberg data. Certify the comparison with the image of H¹(Fil⁺) and with CS strict ordinary cochain cones, retaining H⁰/H² and finite local quotient terms rather than equating these conventions unconditionally.
- **`GrossZagierAndArithmeticHeights:GZ.5`:** General F definite Waldspurger pairing for finite-order primitive ring-class characters of growing P-conductor, with CV central character and admissible local vector hypotheses. The existing GZ.9 Brooks unramified classical infinity-type formula is a near miss, not this supplier.
- **`tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`:** Use upstream Chebotarev for finitely many prescribed simultaneous splitting/avoidance conditions in the auxiliary real quadratic F; no new upstream plan is proposed. HE verifies the BCS residual restriction and disjointness conditions.

## Missing imaginary-quadratic owner

Create “Elliptic units and the Iwasawa main conjectures for imaginary quadratic fields”: EU.0 integral elliptic-unit distributions and norm/conductor relations; EU.1 their rank-one Euler system and unit/class-group modules; EU.2 Rubin 1991/1994 two-variable CM main conjecture with exact prime/coefficient hypotheses; EU.3 Hida–Tilouine Invent.117(1994) Theorem 0.3 anticyclotomic form and specialization; EU.4 Hida Annals2010 Katz anticyclotomic μ=0 with exact hypotheses. Import Katz from AutomorphicPadicLFunctions L3, generic Euler-system/Iwasawa maps from ES.3/ES.8 and CM.1–CM.4 reciprocity. Acquire these proofs before claiming closure. Add KatoL4 Wüthrich distinguished E_• integral zeta/divisibility nodes, using IntegralIwasawaTheory L4 Ferrero–Washington. Link both suppliers to independent BSD.7a, and record them as suppliers of HE.7s’s Rubin/Iwasawa CM source alternative; retain the reviewed Nekovář direct HE.7 route without an artificial unit dependency.

The acquired Wüthrich published text gives the exact distinguished-lattice statement in Theorem 4, with odd semistable prime restrictions and an étale E₁→E_• isogeny. Its integral Kato and reducible divisibility proofs are requested from Kato L4; they are not re-planned as Heegner declarations. The Rubin/Hida–Tilouine/Hida theorem hypotheses must be checked in their full texts by the new owner before the Eisenstein branch can be closed.

## Source versions and findings

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

The BCGS publisher request was refused with HTTP 403. The author copy and arXiv v2 are recorded separately, with content hashes; no journal-text collation is claimed. Castella–Sano’s result is scoped to its January 2026 preprint. Rubin 1987 and the missing elliptic-unit proofs remain unacquired.

**HeegnerPointEulerSystems/E1 — misprint.** Introduction(disc), arXiv v2 p.1; same text in linked author copy dated 2 January 2026 p.1; journal wording unverified. The printed condition is “D_K is odd and D_K ≠ −3”. Here discriminant is −D_K<0, so the positive D_K should be excluded from 3. Equivalently use signed discriminant D_K<0 and exclude −3 consistently. The preceding line declares −D_K<0; D_K=3 otherwise passes the printed exclusion although the six-unit field Q(√−3) is the excluded exceptional case. Later sections switch to signed discriminant notation. This is recorded as affecting nothing because the intended condition is clear. arXiv2312.09301 version history: v2 is current. Castella author page and linked Kolyvagin.pdf compared; same sign slip. Publisher DOI10.4310/CJM.260514224852 refused HTTP 403; journal collation remains open. Primary author/arXiv searches for corrigendum/erratum found no correction.

**HeegnerPointEulerSystems/E2 — misprint.** Lemma 3.1.1, author manuscript20 January 2026 / arXiv2601.14504v1, §3.1. The printed condition is “p^m ∈ I_n”. Require I_n ⊂ p^mℤ_p, equivalently M(n)≥m, so the finite coefficient class reduces to modulo p^m. I_n=(p^M(n)). The quotient map ℤ_p/I_n→ℤ_p/p^m exists exactly when M(n)≥m. For M(n)=3,m=1 the printed membership fails although the map exists; for M(n)=1,m=3 membership holds but the required quotient map does not exist. Compare BCGS Lemma 1.1.5. This is recorded as affecting nothing because the intended condition is clear. arXiv2601.14504 version history: v1 is the only listed version. Castella Kurihara.pdf and Sano research page; no published version or corrigendum found. Primary author/arXiv erratum searches found no correction.

## Coverage, planets and prototype limits

**HeegnerPointEulerSystems:HE.7s: source_decomposed.** Source inventory completed as a process boundary: import reviewed HE.7 integral CM/dyadic/arithmetic descent nodes. Rubin 1987 alternative stays an explicit acquisition gap/new-owner requirement. Propose removal of this bookkeeping layer; this is not mathematical closure.

**HeegnerPointEulerSystems:HE.8: planned.** Every mathematical target is a node; main-conjecture-dependent A/B/CS results retain their conjecture hypothesis to preserve the early-family dependency order.

Remaining contracts: Certify the exact S-arithmetic joint distribution supplier including the general F_P twisted-diagonal scope. Close the inherited χ localization square and integral family/JSW/derived determinant supplier requests, including the precise BCGS local torsion normalization. Replace the stated arithmetic prototype omissions by actual supplied interfaces.

**HeegnerPointEulerSystems:HE.8b: planned.** Rational irreducible, integral surjective and Eisenstein branches are distinct; the inert CS conjecture is not proved.

Remaining contracts: Certify BCS Wan/Fujiwara period/μ/control contracts at the exact coefficients and residual restrictions. Acquire/verify the missing elliptic-unit IMC and integral Kato inputs through BSD.7a; compare the exact CGS2025 hypotheses. Replace arithmetic prototype omissions by supplier objects.

**HeegnerPointEulerSystems:HE.8c: source_decomposed.** Hypothesis matrix is recorded in the reader and target nodes. The integrated Cornut–Vatsal ID is preserved but parented to HE.8; definite and indefinite branches are split. Propose removal of the process layer and its reversed edges, without changing atlas records in this job.

HE.8 has six planets: the anticyclotomic Heegner class, joint CM equidistribution, Howard’s divisibility theorem, BCGS nonvanishing, refined Kolyvagin divisibility and the Castella–Sano equivalence. HE.8b has five: rational and integral Heegner main conjectures, rational and integral Greenberg–BDP theorems, and the anticyclotomic Eisenstein main conjecture. Their names are definitions, constructions or named theorems; source locators do not serve as planet names. The process notes have no planets.

The suggested file imports individual Mathlib modules and contains 90 distinct named declarations and 27 admitted examples. The 36 API items include five lemmas promoted to packet nodes. It uses supplied algebraic maps, modules, character homomorphisms and ideals. The actual arithmetic identities of those parameters, continuous topology, Λ-characteristic-ideal assignment, CM geometry, crystalline conditions and Selmer determinant identifications are missing at these pins and are stated explicitly as omitted conditions beside each signature. A shape check cannot prove the displayed universal-looking prototype statements without those conditions. No claim of arithmetic formalisation follows from elaboration. Production signatures must use the named supplier objects and restore all the source hypotheses.
