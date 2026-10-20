# Roadmap: number-field Habiro rings, finite regulators and K₃-graded modules

**Summary.** Construct Frobenius-twisted Habiro rings for number fields and lines over them indexed by algebraic K₃. The arithmetic input is a finite Chern class, compared with a regulator built from the cyclic dilogarithm. The local input is a Coleman regulator and the formal expansion of a half-shifted Pochhammer product. The end targets are an effective descent theorem, tensor equivalences for the indexed lines, their Picard character, and functorial pullback and multiplicative transfer. The finite identities, arithmetic gluing, and local constructions precede these end targets; local freeness by itself does not supply the global descent theorem.

## Scope and ownership

This roadmap owns the number-field interfaces between finite Chern classes, cyclic dilogarithms, Frobenius-twisted Taylor families, and K₃-indexed Habiro modules. It includes the odd-order KMS identity with its analytic-to-algebraic proof, the integral eigenclass arguments needed for ordinary units, and the first-jet calculation needed for the corrected local section condition. It also owns the effective descent and functoriality statements needed to turn the proposed global families into invertible modules. Those last statements are explicit proof obligations, rather than consequences of an intersection of local free modules.

The following are supplied elsewhere and are not targets here. K3BlochGroups, Layers V.2–V.6, owns the Suslin, published CGZ, and older CGZ Bloch conventions, their odd-coefficient comparisons, the configuration map from group homology, and finite-field Bloch groups. The genuine finite-coefficient comparison that ends V.6 is not imported: it uses Layer 1 here and is a downstream consumer. StableHomotopyKTheory, Layer H.6, owns finite-coefficient K-theory and its Bockstein sequence. GeneralAlgebraicKTheory, Layers K.2, K.3 and K.7, owns functoriality, transfer, and products in K-theory. ArithmeticKTheory, Layers N.3–N.6, owns finiteness of K₂ of integer rings, the integers wᵢ, the structure of K₃ of number fields, and the Keune comparison with class groups. MotivicEtaleKTheory, Layers M.1, M.3 and M.7, owns Tate twists, étale Kummer theory, Tate's degree-two comparison and the odd-primary degree-three comparison. Its finite Chern construction in M.8 must have an early prefix independent of analytic regulators; only that prefix is used here. KTheoryFiniteLocalFields, Layers L.2 and L.7, owns finite-coefficient Gabber rigidity for completions at primes away from the coefficient characteristic and the compatibility of finite Chern classes with that completion. PadicHodgeRegulators, Layers D.1, D.3 and D.4, owns Coleman's p-adic dilogarithm with its logarithm branch, local K₃ presentations and the p-adic regulator, including trace naturality. The full Bloch–Wigner regulator alone cannot replace that input.

HabiroCyclotomicCompletions, Layers HC.1 and HC.3–HC.5, owns generic cyclotomic completions, re-expansion, Taylor maps, integral Taylor-lattice detection and injectivity, and the Chinese remainder decomposition along disconnected sets of orders. The local arithmetic assembly here consumes those contracts; it does not give a second construction of their completion functors. Two base-ℤ inputs are targets here rather than imports: the unramified Frobenius of R̂_p in §2.2 and the prime-to-p cyclotomic local chart in §2.6. Their generalizations to étale algebras over perfectly covered Λ-rings are given downstream by HabiroRings, which consumes this roadmap's ring and indexed lines. QSeriesPartitionsAndMockModularForms, Layers QM.0–QM.1, supplies Pochhammer analysis, Ramanujan's bilateral summation and the eta multiplier. PolylogarithmFunctions, Layers PF.1 and PF.3, supplies the principal complex dilogarithm, its branch conventions and its complex inversion and five-term identities. Tau Ceti's Chebotarev, Layer 10, supplies the prescribed-Frobenius theorem used in finite detection. The generic unit theorem, ramification and discriminant facts, group homology and cohomology, power-class groups, ordinary and S-unit Selmer exact sequences, and Picard groups are existing Mathlib or Tau Ceti infrastructure. The identity action of inner compatible pairs on continuous cohomology is current Tau Ceti's `ContinuousCohomology.map_eq_id_of_inner`, in `RepresentationTheory.Homological.ContCohomology.InnerConjugation`; only its scalar annihilation consequence and the arithmetic restriction argument are targets here.

Generic simultaneous eigenspaces and finite-group Fourier projectors are also already available in current Tau Ceti, in `TauCeti.LinearAlgebra.Eigenspace.JointEigenvector.Basic`. Their hypotheses include an invertible group order for the projector theorem. This roadmap retains only the integral obstruction and arithmetic lifting arguments that cannot be obtained by averaging. Current Tau Ceti also supplies the Kummer isomorphism in `TauCeti.FieldTheory.GaloisCohomology.Kummer`; it is not necessary to reconstruct Hilbert 90 here. Current Tau Ceti's `TauCeti.frobeniusAlgEquiv`, in `TauCeti.NumberTheory.LocalField.ResidueCorrespondence`, is the Frobenius automorphism of an unramified extension of local fields, with its p-power congruence, uniqueness and order; §2.2 only assembles it on the semilocal ring R̂_p and proves naturality there. The local cyclotomic and ramification infrastructure of LocalGaloisGroups, LocalFieldsRamification and ProfiniteArithmetic is used through these existing interfaces, without adding a parallel local-field theory. Algebraic vector-bundle Chern classes belong to AlgebraicVectorBundles and are distinct from the finite étale K-theory maps used here.

HabiroNahmSeries owns Nahm sums, formal Gaussian integration, the evaluation of the finite regulator on the distinguished eta class by Nahm asymptotics, and the unconditional assembly of the exponent-two comparison using that evaluation. The early comparison in this roadmap is conditional on that single value. Consequently no Nahm theorem is used to construct the regulator that Nahm asymptotics will later use.

## Conventions

K and F are number fields; O_K is the full ring of integers. A localization parameter Δ is a positive integer divisible by |disc K|. Layers involving local sections assume additionally 6 divides Δ, so every prime under consideration is unramified and greater than three. Write R = O_K[1/Δ], R̂_p = lim_a R/p^aR, and K_p = K ⊗ ℚ_p. For p∤Δ, R̂_p identifies with O_K ⊗ ℤ_p and with R ⊗ ℤ_p; it is the full product of integer rings over places above p, and R̂_p[1/p]=K_p. For p|Δ the completion R̂_p is zero, whereas R ⊗ ℤ_p is generally nonzero. A zero completion imposes no gluing condition.

For a positive order m use the **full** cyclotomic algebra A_m(B) = B ⊗_ℤ ℤ[t]/(Φ_m(t)), with its distinguished element ζ_m. This notation never means a chosen field factor of a tensor product. Over ℚ it may be a product of fields; over ℤ_p for p prime to m it is finite étale. The complex realization uses a compatible family with ζ_ab = ζ_aζ_b for coprime a,b and ζ_(p^(k+1))^p = ζ_(p^k). These choices differ from choosing exp(2πi/m) independently at every order. All root changes and embeddings below act on the distinguished cyclotomic factor explicitly.

Power classes are multiplicative: U/Uⁿ means a quotient group, and raising a class to a residue in ℤ/n is well-defined. Eigenspaces of such groups refer to classes, not to representatives. The cyclotomic character χ is fixed by σζ = ζ^χ(σ). Thus a weight χ⁻¹ class u satisfies σu = u^χ(σ)⁻¹. Cohomology is continuous when the group is profinite and coefficients are discrete torsion modules. Kummer uses δ(a)(σ) = σ(a^(1/n))/a^(1/n). The Tate basis is ζ^⊗r.

Use `B_old` for the exterior-boundary convention of CGZ v3 and retain its degenerate projective symbols. In particular [0] is not set to zero. Odd-coefficient comparison with Suslin's group is supplied by K3BlochGroups. Coefficient order zero is excluded from finite Chern and root-torsor constructions. Order one has trivial power-class and finite-coefficient groups. Empty finite sums and products in the elementary formulas have their usual total meanings.

The raw finite Soulé map and its negative are different normalizations. Write `c_raw` for the map with the degree-three product sign in §1.10 and `c_plus = −c_raw` in additive cohomology, or its inverse in power classes. Write `c_fixed` for the normalization chosen in the CGZ–GSWZ interface after proving its comparison with these maps. No map is defined by prescribing its value on eta. The units used for Habiro lines are ε_m(ξ) = c_fixed,m(ξ)² for every m, including even m and orders with roots already in K.

At a root use the additive variable x = q − ζ_m. In the formal logarithm h = log(1+x/ζ_m), the root of unity contributes no logarithmic constant. The multiplicative coordinate u is defined by q = ζ_m(1−u), hence x = −ζ_m u. A formal half power has constant one in the h coordinate. It is not replaced by an ordinary monomial whose constant could be −1. Logs of arbitrary nonunit constants require the chosen Coleman branch or torsor trivialization; the formal log on 1+xK_p[[x]] has no such ambiguity.

## Exact supplier contracts

From **Mathlib**, use `IsPrimitiveRoot.autToPow`, with `[NeZero n]`, and its prescription theorem `IsPrimitiveRoot.autToPow_spec`; this is the root-exponent character. `modularCyclotomicCharacter` is the global ring-automorphism version after the root-count hypothesis. Joint eigenspaces are intersections of `Module.End.eigenspace`. `Rep.barResolution`, `Rep.FiniteCyclicGroup.resolution`, `Rep.FiniteCyclicGroup.groupHomologyIsoOdd`, `groupHomology.d₃₂`, `groupCohomology.map` and `groupCohomology.H1InfRes_exact` provide homological carriers and functoriality. Their left-module conventions must be compared with the positive bar chains in §1.9; an abstract cyclic-homology isomorphism does not fix a sign.

`NumberField.discr`, `NumberField.Units.rank`, `NumberField.Units.torsionOrder` and `NumberField.InfinitePlace.nrComplexPlaces` supply discriminants, the rank and torsion of units, and r₂. `IsDedekindDomain.selmerGroup` and `IsDedekindDomain.selmerGroup.fromUnitLift_injective` supply ordinary-unit power classes inside field power classes for positive n. `Set.unit` in the S-integer theory supplies S-units. `AdicCompletion`, `IsAdicComplete`, `AdjoinRoot`, `Polynomial.cyclotomic` and `Polynomial.eval_one_cyclotomic_prime_pow` supply ordinary algebraic building blocks. They do not identify a cyclotomic completion with a selected field factor.

`PowerSeries.map` acts on coefficients. `PowerSeries.rescale` changes x to a scalar multiple of x. For a nonzero topologically nilpotent constant, re-expansion requires a complete target and a convergence proof; the unqualified formal `PowerSeries.subst` API is not a proof of that convergence. `Pic.mk`, `Pic.mk_tensor`, `Pic.mk_eq_mk_iff`, `Pic.mk_eq_one_iff_free` and `Module.Invertible.left` supply the Picard formalism once genuine modules and tensor equivalences have been constructed.

From **Tau Ceti**, `TauCeti.powerClassQuotient` and `TauCeti.powerClassHom` supply power classes. The pinned `TauCeti.kummerClassMap` and `TauCeti.kummerClassMap_injective` give the positive Kummer map and injectivity when n is invertible. Current `TauCeti.kummerIso`, `TauCeti.kummerMap_surjective` and `TauCeti.kummerIsoTransport` additionally give surjectivity and transport along an equivariant coefficient equivalence. Such transport requires equivariance, not merely a bijection of underlying groups. `IsDedekindDomain.selmerGroup.fromSUnitLift_injective`, `ker_toClassGroup`, and `range_toClassGroup` identify the S-unit image and the class-group n-torsion obstruction; the last theorem requires `[NeZero n]`. These declarations replace a new Selmer exact-sequence target.

From **K3BlochGroups V.2–V.6**, excluding the final genuine finite-coefficient comparison of V.6, require, for a field with at least four elements, a natural diagram
`B_Suslin → B_new → B_old` whose first map is onto with kernel killed by two and second is injective with cokernel killed by two; after odd coefficients all three agree. Require natural configuration and specialization maps retaining the correction at repeated projective points, and the finite-field cyclic group calculation. From **StableHomotopyKTheory H.6**, require functorial K_i(B;ℤ/n), the exact sequence `0 → K_i(B)/n → K_i(B;ℤ/n) → K_(i−1)(B)[n] → 0`, and Bockstein compatibility with products and bar chains. From **GeneralAlgebraicKTheory K.2, K.3, K.7**, require restriction, finite-flat transfer, the projection formula and graded products, at spectrum and finite-coefficient level.

Boundary checks for these suppliers include `B_new(𝔽₁₁)≃ℤ/3` and `B_old(𝔽₁₁)≃ℤ/6`, whose odd parts agree but whose integral groups differ. For an algebraic closure of 𝔽_p and an odd prime ℓ≠p, the supplied finite K-theory and Bott convention recover `(ℤ/ℓ)[β]`, with β in degree two. These test the imported conventions rather than introduce additional Bloch or K-theory targets here.

From **ArithmeticKTheory N.3–N.6**, require finite K₂(O_F), w_r(F) with its Tate-invariant characterization, odd-primary K₃ structure including torsion, and the actual Keune injection from `(A/pᵃA)/⟨σb−χ(σ)⁻¹b⟩` into `K₂(O_F)/pᵃ`, with A=Pic(O_(Fζ_(pᵃ))[1/p]), p odd unramified in F and the full cyclotomic Galois group acting. This quotient cannot be replaced by Pic[pᵃ]. From **MotivicEtaleKTheory M.1, M.3, M.7 and the early finite-Chern prefix of M.8**, require étale restriction and corestriction, Tate-basis untwisting, Tate's degree-two comparison `K₂(F)/n ≃ H²(F,ℤ/n(2))` with the accompanying description of K₂(F)[n] used in §1.6, finite Chern maps at all positive orders and their product signs, and `K₃(F)⊗ℤ_p ≃ H¹(F,ℤ_p(2))` for odd p. The prefix must not depend on a dilogarithm regulator, this roadmap's comparison, or a Nahm calculation. If M.8 is organized after those results, this prefix must be separated before it can be used. From **KTheoryFiniteLocalFields L.2 and L.7**, require, for n=pᵃ and a prime 𝔮 of F not above p, Gabber rigidity `K₃(O_(F,𝔮);ℤ/n) ≃ K₃(k(𝔮);ℤ/n)` for the completed local ring, and compatibility of the global finite Chern class with completion at 𝔮 and with the finite-field Chern class on K₃(k(𝔮))/n.

From **PadicHodgeRegulators D.1, D.3 and D.4**, require Coleman's p-adic dilogarithm with its logarithm branch, the normalization `D_p(z)=Li₂(z)+½log(z)log(1−z)` with log of a root of unity equal to zero, and, for unramified p>3, a finite ℤ_p-linear root-symbol presentation of the image of K₃(K) in completed local K₃, a regulator `D_p : K₃(K_p;ℤ_p) → p²R̂_p` with the prescribed normalization, root-symbol values `Li₂(ζ)`, and field naturality and transfer-to-trace compatibility. Individual pre-Bloch symbols [ζ] need not be global Bloch classes. The presentation is in the supplier's completed local K₃, not an assertion that every [ζ] has zero exterior boundary. These inputs, including the root-symbol values that fix the sign of D_p, must be available before this roadmap. If the supplier obtains the root-symbol values through de Jeu's weight-two polylogarithmic complex, that complex and its comparison with Suslin's rational isomorphism must also come before this roadmap, from PadicHodgeRegulators itself or from K3BlochGroups.

From **HabiroCyclotomicCompletions HC.1 and HC.3–HC.5**, require the cyclotomic completion R[q]^ℕ with its finite quotients, Taylor maps, mixed-adic convergent re-expansion with composition, injectivity of the all-order Taylor map, detection of an integral cyclotomic family by its rational image and its p-adic Taylor lattices, and the Chinese remainder decomposition of a completion along disconnected sets of orders. The comparison of ordinary with derived completion in HC.5 imports HabiroRings and is not used here. The unramified Frobenius of R̂_p and the complete local chart
`ℤ_p[q]^(p,Φ_m) ≃ A_m(ℤ_p)[[q−ζ_m]]` for p prime to m, including every factor of A_m, are not imported: they are the targets `unramifiedFrobenius` of §2.2 and `primeToPLocalChart` of §2.6, proved from Mathlib's étale lifting theorems. The proof cannot assume Φ_m irreducible mod p. The arithmetic p-chain comparison and all-order assembly are in Layer 2 below. No derived completion or relative Habiro cohomology is reconstructed here.

From **QSeriesPartitionsAndMockModularForms QM.0–QM.1**, require normal convergence of the bilateral ₁ψ₁ sum on its annulus, root-of-unity Pochhammer asymptotics with uniform tails, and the eta multiplier with its root-of-unity phase. From **PolylogarithmFunctions PF.1 and PF.3**, require the principal complex dilogarithm on ℂ∖[1,∞) with its derivative recursion (PF.1). Also require Li₂(1)=π²/6, the inversion identity `Li₂(z)+Li₂(1/z)=−π²/6−½Log(−z)²` for z∉[0,∞), and Abel's five-term identity on the convex domain |x|+|y|<1, all with principal branches (PF.3). §1.3 uses them on a neighborhood of (X,Y)=(1/5,2) on the KMS hypersurface, where every variable argument is real and less than one. The real Bloch–Wigner identity loses precisely the phase needed for KMS. From **Tau Ceti's Chebotarev, Layer 10**, require arbitrarily many unramified rational primes with a specified conjugacy class in a finite Galois extension, including deletion of a finite exceptional set. From **current Tau Ceti's inner-conjugation theorem**, require the induced identity in every cohomological degree for a locally compact group and smooth discrete coefficients; finite and profinite groups with the torsion coefficients here satisfy those hypotheses. These contracts end all prerequisite chains; missing compatibility proofs are named in the layers that need them.

## How to read the build

Layer 0 fixes the finite Chern map and proves its integral unit image without averaging over a group of noninvertible order. Layer 1 constructs the cyclic regulator and compares it with Chern classes, keeping the normalization issue visible. Layer 2 builds arithmetic gluing with full cyclotomic algebras and identifies its rational-field specialization. Layer 3 uses the all-order Chern torsors and Coleman regulator to construct local sections; it then isolates effective global descent before asserting tensor equivalences, Picard classes, or functoriality. The representative Lean file states the elementary finite identities whose carriers are already available. The K-theory, completion and indexed-line constructions remain mathematical targets in this document.

## Layer 0: finite Chern classes and ordinary units

### 0.1 Integral cyclotomic lifting without averaging

For n>0 invertible in F, let L=F(ζ_n), G=Gal(L/F) and χ be the root-exponent character. The integral lifting arguments below concern the existing character equations on power classes, with the actual cyclotomic image of G; they differ from the supplied Fourier decomposition because |G| may be noninvertible. An equivariant injection reflects those equations, and a class need not have a representative satisfying them before quotienting. The required arithmetic target is the obstruction to right exactness and the replacement lifting theorem of §0.6. (CGZ v3 §2.1, pp. 7–9, and §3.1, pp. 17–18.) Needs: root characters and power-class quotients in the supplier contracts.

The integral obstruction is a separate theorem. If |G| is a unit, the character-weighted average is a projector, and taking a character part is exact. Without that hypothesis there is no such exactness assertion. A concrete counterexample uses n=9, G=(ℤ/9)ˣ, and the twisted augmentation of (ℤ/9)[G] onto the rank-one χ⁻¹ module. Its χ⁻¹ eigenvectors map into 6(ℤ/9)=3(ℤ/9), so the map on eigenclasses is not onto. This example is an elementary computation with the regular basis; it is not a counterexample to the projector theorem with invertible |G|.

**Checks.**
- With G trivial, every class satisfies the weight equations; no nontriviality assumption is silently attached to the definition.
- For n=9 the twisted augmentation above misses 1, although the original augmentation is surjective. An unconditional exact-eigenspace functor fails this test.
- A unit u with σu/u not equal to 1 can still have invariant power class if that ratio is an n-th power. The API tests equality in the quotient, rather than demanding an invariant representative.
- Over ℚ at n=5, the class of `∏_(k=1)^4(1−2ζ₅^k)^k` has weight χ⁻¹ and not χ: σ₂ acts by exponent 3 rather than 2. At n=7 the ordinary-unit χ⁻¹ part is zero, while the χ part contains the root ζ₇. These discriminate the inverse-character convention.

### 0.2 Excluded primes and their numerical meaning

Define `excludedInteger F = 6 |disc F| #K₂(O_F)` and the auxiliary `excludedIntegerPrime F = 2 |disc F| #K₂(O_F)`. They are positive integers. The second may replace the first only under 9∤n in the good-order conclusions below. Prove that coprimality with the first excludes all bad ramification primes, 2, 3, and K₂ torsion primes; prove the corresponding reduced assertion for the second with the stated restriction. Relate these integers to w₁(F), w₂(F), and the hypotheses of restriction injectivity, rather than defining them to be arbitrary convenient multiples. The required API is `excluded_pos`, `goodOrder_odd`, `goodOrder_unramified`, `goodOrder_k2`, and `goodOrder_repeatedPrime_not_dvd_w2`. (CGZ published Remark 1.4, p. 385; v3 §3.5, pp. 20–21.) Needs: ArithmeticKTheory N.3–N.5 and discriminants.

**Checks.**
- For ℚ, #K₂(ℤ)=2 gives M=12 and M′=4. Thus n=3 is admitted by M′ only through the 9∤n variant, whereas n=9 is not.
- For ℚ(i), |disc|=4 and #K₂(O)=1 give M=24 and M′=8; the argument still excludes ramification at 2. The trivial tame kernel is recorded in Belabas–Gangl, §7, table on p. 24, at discriminant −4.
- n=1 is coprime to either integer and all finite-coefficient conclusions reduce to maps between trivial groups. Replacing coprimality by n≠M would fail at n=2M.

### 0.3 Tate untwisting and the finite Chern map

For r≥1 and every n>0 define `finiteChernRoot ζ r` by the supplied finite Chern class from K_(2r−1)(F)/n to H¹(F,ℤ/n(r)), restriction to L, and untwisting with the basis ζ. The coefficient isomorphism `t_ζ : μ_n → μ_n^⊗r` sends ζ to ζ^⊗r. Its equivariance defect is exactly `t_ζ(σa)=χ(σ)^(1−r) σ(t_ζ(a))`. Consequently the image has weight χ^(1−r). This construction does not require ζ∉F and does not require n odd. Parity and good-order hypotheses enter the theorems, not the definition. (CGZ v3 §3.1, pp. 17–18; Hutchinson 2024 §2, preprint pp. 2–4.) Needs: the early finite-Chern prefix and current Kummer transport.

Require `finiteChernRoot_add`, `finiteChernRoot_nsmul`, `finiteChernRoot_fieldMap`, `finiteChernRoot_changeRoot` and `finiteChernRoot_changeOrder`. If ζ is replaced by ζ^k, k invertible mod n, then `c_(ζ^k)(a)=c_ζ(a)^(k^(1−r))`; in degree three the exponent is k⁻¹. This follows because `t_(ζ^k)=k^(r−1)t_ζ`. Field maps fix the abstract root and commute with the construction. Compatible reductions n′→n must specify both the coefficient quotient and the associated root power. The finite-coefficient map on K₃(F)/n is induced through K₃(F;ℤ/n); it is not obtained by identifying those groups when K₂(F)[n] is nonzero.

**Checks.**
- In weight r=1 the map is the positive Kummer map and changing the chosen primitive root does not change the power class.
- In weight r=2 and k=−1 the map is inverted. This is a sign-sensitive test of the untwisting direction.
- At n=1 the target is trivial. At n=3 over ℚ(ζ₃) the construction is still defined even though the relative cyclotomic Galois group is trivial; a definition requiring nontrivial G would reject a needed input.

### 0.4 Restriction and finite Chern injectivity

Derive the scalar Sah consequence from the supplied identity for inner compatible pairs: if a central element acts by a scalar a on coefficients, a−1 kills cohomology. This specialization identifies the coefficient scalar with the actual induced action; it does not reconstruct the existing cochain homotopy or assume an arbitrary endomorphism is the identity. Apply it to inflation–restriction to prove that H¹(F,ℤ/n(r))→H¹(L,ℤ/n(r)) is injective when gcd(n,w_r(F))=1. (CGZ v3 Lemma 3.1, p. 18.) Needs: the current inner-conjugation theorem, group-cohomology functoriality and ArithmeticKTheory's w_r characterization.

For degree three prove `finiteChernRoot_injective`: n is odd and every p with p²|n satisfies p∤w₂(F). Then K₃(F)/n injects into Lˣ/(Lˣ)ⁿ. For a prime coefficient the cyclotomic group has order dividing p−1, so its H¹ vanishes by averaging in that particular prime-level argument. For repeated prime factors use the Tate-invariant obstruction; do not impose the stronger condition gcd(n,w₂(F))=1 on the squarefree theorem. (CGZ v3 Lemma 3.3, p. 19.) Needs: the odd-primary K₃–H¹ comparison and coefficient exact sequences.

**Checks.**
- Every odd squarefree n satisfies the repeated-prime condition, including n=3 over ℚ.
- n=9 over ℚ does not satisfy it because 3|w₂(ℚ); no injectivity claim is obtained from this theorem there.
- For the trivial group Sah's conclusion holds but produces no invertible a−1. That case cannot manufacture a vanishing theorem.

### 0.5 Finite endomorphisms and the Picard obstruction

Prove `finiteEndomorphism_torsionKernel`: if A is a finite abelian group, f an endomorphism, and A=f(A)+nA, then ker(f)∩A[n]=0, including n=0. A proof can use the Fitting decomposition or stabilization of finite kernels and images. For cyclic G generated by γ and an integer a lifting χ(γ)⁻¹ modulo n, take f=γ−a. The χ⁻¹ coinvariant quotient `(A/nA)/⟨σb−χ(σ)⁻¹b⟩` vanishes precisely when A=f(A)+nA; the eigenvectors in A[n] are ker(f)∩A[n]. This identifies the actual quotient and torsion groups without a chosen duality. The hypothesis is finiteness of the actual class group, not finite generation of a divisible envelope. (Elementary finite-group argument filling the step in CGZ v3 Lemma 3.5, p. 20.) Needs: finite abelian-group structure and ArithmeticKTheory N.6.

For p odd unramified in F, n=pᵃ with a≥1 and p∤#K₂(O_F), put L=F(ζ_n). The exact supplier Keune injection implies that the relevant χ⁻¹ quotient of Pic(O_L[1/p])/n is zero. Apply the finite criterion, with the actual commuting G-actions, to prove `picardEigenObstruction_vanishes` on Pic(O_L[1/p])[n]. This is the arithmetic input to lifting an eigenclass to p-units. A proof of the Keune injection and its precise quotient convention is required from its owner; the single sentence citing it in CGZ is not an independent proof. In particular no averaging by [L:F] is allowed at pᵃ for a>1.

**Checks.**
- For finite A and f an automorphism, the kernel assertion is immediate for every n, including n=1.
- On A=ℚ/ℤ, f=3 and n=3, surjectivity of f gives A=f(A)+nA but ker(f)∩A[3]≠0. This rejects omission of finiteness.
- In a finite p-group, A/n and A[n] may have the same cardinality without any canonical identification. The construction must use the supplied maps, and must remain natural under automorphisms of A.
- On A=ℤ/9, f=2 and n=9, the criterion applies and the kernel is zero. On the same A with f=0,n=3 its premise fails and A[3] is nonzero. If p divides #K₂(O_F), vanishing of the Keune target is no longer available.
- At n=0 the premise says f is onto A, hence injective by finiteness; A[0]=A, so the conclusion is again the zero kernel. At A=0 the criterion holds for every n and f.

### 0.6 Exact eigenclass lifting and valuations

Prove `exactEigenclass_lift`: for equivariant maps U→M→C, with U→M injective and image equal to the kernel, an eigenclass of M whose image is zero has a unique eigenclass lift to U. Injectivity reflects the eigen-equations, so neither a projector nor exactness of the character functor is used. Apply this to the ordinary Kummer–Picard sequence and §0.5 to lift the finite Chern image to p-unit power classes. (CGZ v3 Lemma 3.5, p. 20, with the elementary exactness argument made explicit.) Needs: the existing S-unit Selmer exact sequence and the obstruction theorem.

For p unramified, prove the cyclotomic prime description: Gal(F(ζ_(pᵃ))/F)≃(ℤ/pᵃ)ˣ, each prime above p in F has one prime above it in L, its relative ramification index is φ(pᵃ), and its residue degree is one. Hence G fixes every coordinate of the valuation image D of O_L[1/p]ˣ. Use the exact lattice sequence `0→O_Lˣ→O_L[1/p]ˣ→D→0`, with D a free abelian subgroup of the valuation lattice. Tensoring modulo n stays exact on the left because D is torsion-free. A tame element for which χ−1 is a unit kills the χ⁻¹ part of D/n. The lifted eigenclass therefore comes from a unique ordinary-unit power class. (CGZ v3 §§3.4–3.5, pp. 20–21.) Needs: local cyclotomic ramification and the existing ordinary-unit injection.

The API `chernUnitClass`, `chernUnitClass_coe`, `chernUnitClass_unique` and `chernUnitClass_eigen` should return a class in O_Lˣ/(O_Lˣ)ⁿ, never a distinguished unit. Working through D is essential: D/n→(⊕_(v|p)ℤ)/n need not be injective. This avoids a saturation assumption not present in the arithmetic.

**Checks.**
- For D=3ℤ⊂ℤ and n=3, D/n has a nonzero class whose image in ℤ/3 is zero. A proof that tests only ambient valuations modulo n misses it.
- A trivial character on a nonzero valuation module has nonzero eigenclasses. The vanishing argument requires a tame χ value different from 1 modulo p.
- At p=3, a=2, |G|=6 is not invertible mod 9. Unique lifting still works because it uses injection and a vanished obstruction, while averaging does not.
- For F=ℚ and n=9 the relative cyclotomic degree and ramification index are both six. For F=ℚ(∛2), p=5, the same ramification theorem applies without a Galois-closure disjointness assumption. At ramified primes it makes no claim.

### 0.7 S-unit representatives and ordinary-unit image

For every positive n prove that the finite Chern image has S-unit representatives for some finite S=S(F,n). S can avoid any prescribed finite set of primes disjoint from n. The proof chooses class-group generators away from that set and kills the Kummer class-group obstruction. It does not prove one S works simultaneously for all n. (CGZ v3 Lemma 3.4, p. 19.) Needs: finite generation of K₃(F), the Selmer exact sequence and representatives of class-group generators by suitable primes.

If every p|n is odd, unramified in F and prime to #K₂(O_F), combine prime-power lifts from §0.6 and the order-comparison maps to obtain an ordinary-unit representative of every finite Chern class. The composite-order step must compare unit power classes after extension from F(ζ_(pᵃ)) to F(ζ_n); an unexplained invocation of the Chinese remainder theorem does not identify different coefficient fields. Prove the needed natural descent and CRT diagrams, with no assertion that every field-extension map on power classes is injective. (CGZ v3 Lemma 3.5 and proof of Theorem 1.5, pp. 20–21.)

**Checks.**
- With n=1 any representative has trivial power class, so S may be empty.
- Ordinary units have zero valuation at every finite prime; an S-unit with a nonzero valuation at a prime in S is a negative control for the ordinary-unit conclusion.
- Extending a field by an n-th root can kill a nontrivial power class. Order compatibility must not be implemented as unconditional injectivity under extension.

### 0.8 Character multiplicities of units

Let L/F be finite Galois with L totally complex. Let η:G→ℂˣ be an actual nontrivial one-dimensional character, odd on each conjugate of a complex-conjugation stabilizer over a real place of F. Prove that its multiplicity in ℂ⊗_ℤ O_Lˣ is r₂(F). The weighted logarithmic embedding identifies the complexified units with the augmentation hyperplane of the permutation representation of infinite places. Over a complex place the stabilizer is trivial; over a real place its order is two and oddness excludes invariants. The trivial character instead has multiplicity r₁(F)+r₂(F)−1. This gives the correct statement even when the Galois closure of F contains unexpected roots. (Equivariant Dirichlet argument correcting the hypothesis usage in CGZ v3 Proposition 2.12, pp. 16–17.) Needs: the existing Dirichlet unit theorem and character representation theory.

For odd p with ζ_p∉F, apply this to the Teichmüller lift of the actual cyclotomic subgroup to obtain rank r₂(F) of the χ⁻¹ part of O_(Fζ_p)ˣ⊗ℤ_p. Pass to units modulo p through the torsion exact sequence. The dimension is r₂(F)+1 when the p-primary roots-of-unity character χ equals χ⁻¹ on G, and r₂(F) otherwise. Under p∤disc F the group is full, so the extra term occurs at p=3. State `unitEigenrank` and `unitEigenclass_dimension` separately: a rank computation over ℤ_p does not discard torsion modulo p. Needs: ArithmeticKTheory's unit torsion data and the exact sequence of torsion and torsion-free units.

**Checks.**
- For F=ℚ and p=3, the class of ζ₃ gives dimension one although r₂(ℚ)=0. The formula without a torsion correction fails.
- For F=ℚ and p=5 or 7, χ≠χ⁻¹ and the dimension is zero.
- For F=ℚ(√−7), p=5, the nontrivial odd part has dimension one. For F=ℚ(∛2), p=3, the free-unit multiplicity is r₂(F)=1 even though its Galois closure contains ζ₃; a Galois-closure disjointness premise is unnecessary here.

### 0.9 The finite Chern unit theorem

Combine §§0.2–0.8 to prove the precise unit theorem. If gcd(n,M_F)=1, the finite Chern map injects K₃(F)/n into the χ⁻¹ part of O_(Fζ_n)ˣ/(O_(Fζ_n)ˣ)ⁿ. If n is squarefree, this map is an isomorphism. The same conclusions hold with M′_F when 9∤n. The prime-level proof compares cardinalities using the corrected unit multiplicity and K₃ structure; the squarefree proof supplies the full order-compatibility diagram. No surjectivity at general prime powers is asserted. (CGZ published Theorem 1.5 and Remark 1.4, pp. 385–386; v3 §3.5, pp. 20–21.) Needs: all preceding arithmetic targets and the imported odd-coefficient Bloch convention comparison.

The map factors through K₃/n and is natural in embeddings for which the coefficient-order hypotheses hold on both sides. State uniqueness in the power-class quotient, not uniqueness of an ordinary unit. The two sign normalizations have the same injectivity and image properties. Layer 1 compares their actual values.

**Checks.**
- ℚ with n=5 has zero source and zero χ⁻¹ unit part; n=3 uses the reduced M′ theorem and retains the torsion class.
- A good squarefree composite such as n=35 must give the product of the 5- and 7-primary comparisons with compatible roots.
- n=25 may satisfy good-order hypotheses, but this theorem promises only injectivity, not a cardinality argument establishing surjectivity.

### Examples

The p=3 torsion correction is visible before any regulator is built: O_(ℚζ₃)ˣ contains μ₆, and its cubic power quotient contributes ζ₃ in the χ⁻¹ part. This explains why a free-unit rank of zero is not a dimension-zero statement. At order nine the twisted augmentation example explains independently why character lifting needs exactness and the Picard obstruction, rather than an integral average. For ℚ(i), completing at a split odd prime retains two coefficient factors; no change to either unit argument permits one of those factors to be discarded.

### Dependencies

The layer consumes the exact K-theory, étale, Bloch-convention, class-group and local ramification contracts above. Its new proof steps are the integral obstruction criterion, exact eigenclass lifting, the valuation-image argument, corrected torsion multiplicities, and their composite-order assembly. The finite Chern normalization comparison is an explicit later target and is not used to prove the unit theorem.

## Layer 1: cyclic dilogarithms and finite regulators

### 1.1 The integral cyclic dilogarithm

For a commutative ring B define `cyclicDilog n ζ x = ∏_(0≤k<n)(1−ζ^k x)^k`. The k=0 factor is one, so for positive n this agrees with the product from 1 to n−1. Its total extension at n=0 is also one. It is an integral finite product, rather than the analytic quantum dilogarithm with fractional exponents. Require `cyclicDilog_map`, its polynomial realization and evaluation, and the quasi-periodicity theorem: for a field, n>0, ζ primitive of order n and 0≤s≤n,

```text
(1−x^n)^s D_ζ(ζ^s x) = D_ζ(x) (∏_(0≤k<s)(1−ζ^k x))^n.
```

This cleared identity remains meaningful at x^n=1. Prove nonvanishing when x^n≠1. For n odd and invertible, the exact phase at one is fixed by
`D_ζ(1)² = (−1)^(n(n−1)/2) ζ^((n−1)n(2n−1)/6) n^n`.
For every positive invertible n, prove `D_ζ(1)^24=n^(12n)`. For odd n its power class is 1 if 3∤n and is ζ^(n/3) if 3|n. The exponent 24n appearing for a fractional analytic root is a different assertion. (CGZ v3 §2.2, pp. 9–11, and §5.2, p. 28; GZ Appendix A, pp. 235–237.) Needs: finite products, primitive roots and cyclotomic polynomial identities. The definitions and the cleared quasi-periodicity and phase-free milestone are represented in Suggested.lean.

**Checks.**
- D at n=1 is identically one; at n=2 and ζ=−1 it is 1+x. Suggested.lean proves the latter orientation test.
- At n=3, `D_ζ(x)=(1−ζx)(1−ζ²x)²`, with unequal exponents; this is the second proved Lean example. Swapping the exponents generally changes the polynomial.
- At n=3 and x=1 the cube power class is ζ, not 1. Omitting the normalization D_ζ(1) in the regulator would therefore change a genuine cubic value.
- At x=0 the value is one. At x=ζ⁻¹ with n>1 the value is zero, so no inverse or logarithm may be used there without an admissibility hypothesis.
- Check the phase-free identity for every 2≤n≤16 in the exact cyclotomic algebra; at n=3 it implies D(1)^72=3^108, which differs from 3^36. At n=9 the ninth-power class of D(1) is ζ³. These checks separate the integral product from an analytic ninth root of that product.

### 1.2 The cyclic hypergeometric sum

Define the total field-valued `cyclicHypergeom` by

```text
f_(n,ζ)(x,y|z) = Σ_(0≤k<n)
  [∏_(0≤j<k)(1−ζ^(j+1)y)] / [∏_(0≤j<k)(1−ζ^(j+1)x)] · z^k.
```

The definition is total using field division; any identity using Pochhammer cancellation must separately prove its denominators nonzero. Under n>0, primitive ζ and X=x^n≠1, all denominator factors in this finite sum are nonzero. If also Y=y^n≠1 and `(1−Y)z^n=1−X`, the summand extends n-periodically to integer k, and
`(1−z)f(x,y|z)=(x−ζyz)f(x,y|ζz)`.
Require `cyclicHypergeom_map`, `cyclicHypergeom_summand_period`, `cyclicHypergeom_shift`, and the nonsingular diagonal geometric-sum formula. These are finite arithmetic identities and do not require an embedding into ℂ. (GZ Appendix A, Proposition 8.1 and (56), pp. 235–236.) Needs: §1.1 and finite Pochhammer products from QSeriesPartitionsAndMockModularForms QM.0. Suggested.lean gives the definition and shift milestone directly.

**Checks.**
- n=0 gives zero and n=1 gives one; the periodicity theorem only starts at n>0.
- At n=2 the exact value is `1+(1−ζy)z/(1−ζx)`. The proved Lean test detects reversal of numerator and denominator.
- Over ℚ, n=2, ζ=−1 and (x,y,z)=(2,3,5) give 23/3, as proved in Lean. This tests the definition without asserting the hypersurface identity at an inadmissible triple.
- For x=y with every finite denominator nonzero, each ratio is one and the result is Σ_(k<n)z^k. At x^n=1 this cancellation cannot be used as a general theorem about the total definition.
- At n=3, x=y=0 and z=ζ a primitive cube root, the sum is 1+ζ+ζ²=0, agreeing with the geometric-sum theorem.

### 1.3 The odd KMS identity and its proof route

For a field B, odd n≥3 invertible in B, a primitive ζ, and x,y,z∈Bˣ, put X=x^n, Y=y^n, Z=z^n. Assume X,Y≠1, X≠Y and `(1−Y)Z=1−X`. Prove `kms_odd` in the following form, with T=n(n−1)/2:

```text
f(x,y|z)^n D(1/x) D(ζy) D(ζ/z)
  = (ζy)^T D(1) D(ζy/x) D(x/(yz)).
```

The three D factors on the left are nonzero under these hypotheses: their n-th powers in the arguments are X⁻¹, Y and Z⁻¹; Z=1 would imply X=Y. Thus the divided form is recovered legitimately. The theorem is also valid over finite fields of characteristic prime to n. The n=1 boundary reduces to 1=1 but is separate from the odd n≥3 headline; no assertion is made at noninvertible n. (GZ Appendix A, Proposition 8.1, pp. 235–237, with the uniform-limit and integral-descent proof obligations specified below.) Needs: §§1.1–1.2, QSeriesPartitionsAndMockModularForms QM.0–QM.1 and the complex dilogarithm identities of PolylogarithmFunctions PF.1 and PF.3. Suggested.lean records precisely this general field statement.

First establish a complex identity on a nonempty analytic neighborhood on the hypersurface. A usable center is X=1/5, Y=2, Z=−4/5, where `|X/Y|<|Z|<1` and S=(1−X)(1−Y)/(X−Y)=4/9 has positive real part. Choose branches on a small neighborhood avoiding every product cut. With q=ζ exp(−ε/n), prove the two-sided tail bounds and the residue-class Gaussian limit
`√ε · ₁ψ₁ → √(2π/n) √S · f`.
The expansion of a single residue class is not enough to justify summing all integers. The sign and n in this Gaussian must be derived from the logarithm of the period ratio; they cannot be read from the uncorrected displayed Gaussian in the appendix.

On the product side use the full complex dilogarithm identity to cancel the exponential phase, and the eta multiplier to fix the residual phase. With μ=exp(−πi s(h,n)) for ζ=exp(2πih/n), require `D_ζ(1)=n^(n/2)exp(πin s(h,n))`, hence `μ^n=n^(n/2)/D_ζ(1)`. Track shifted Pochhammer factors before applying quasi-periodicity. The printed Appendix A calculations motivate this route but do not discharge the missing uniform tails or fix their sign, scaling and phase issues. Each is a named analytic target, `kms_gaussian_limit`, `kms_product_limit` and `kms_phase_match`.

The dilogarithm identity used on the product side is `kms_dilog_identity`: near the center, with principal branches,
`−Li₂(X/(YZ))+Li₂(YZ)+Li₂(1/(YZ))+Li₂(X/Y)+Li₂(1)−Li₂(X)−Li₂(1/Y)−Li₂(Z)=0`.
Derive it from the PolylogarithmFunctions identities. Apply inversion at YZ. Apply Abel's identity at x=Z/(Z−1) and y=X/(X−YZ). On the hypersurface X−YZ=1−Z, so its other arguments are a=1/Y, b=X and c=X/Y, and |x|+|y|=5/9 at the center. Rewrite Li₂(x) and Li₂(y) by Landen's identity `Li₂(w)+Li₂(w/(w−1))=−½Log(1−w)²` at w=Z and at w=X/(YZ). The logarithmic terms then combine because (1−Z)/(1−X/(YZ))=−YZ, again by the hypersurface equation. Landen's identity is not a PolylogarithmFunctions target. Prove it here on ℂ∖[1,∞) from the derivative recursion of PF.1: both sides have derivative Log(1−w)/(1−w) and vanish at w=0.

Finally clear denominators over ℤ[t]/Φ_n(t), impose `x^n=1−z^n+y^n z^n`, and prove the relevant coordinate algebra torsion-free using the monic x equation and the freeness of the cyclotomic base. Equality over the complex generic locus then yields the integral polynomial identity. Specialization gives the field theorem whenever the displayed denominators are nonzero. A proof by embedding an arbitrary field in ℂ would lose positive characteristic and is not this descent argument.

**Checks.**
- At the stated analytic center the strict inequalities are 1/10<4/5<1 and S=4/9. Taking X=9/10,Y=2 gives the wrong annulus and is a negative control.
- At the center, Li₂(1/10)−Li₂(−1/8)−Li₂(1/5)−Li₂(1/2)−Li₂(−4/5)=½(log 8/5)²≈0.1105, not zero. A form of `kms_dilog_identity` that drops the logarithmic terms of inversion and Landen's identity is therefore false.
- The order-one finite identity is 1=1. At X=Y one gets Z=1, and D(ζ/z)=D(ζ)=0; the divided KMS expression is excluded.
- Exhaustive field tests at (n,ℓ)=(3,19), (5,31), (7,43), (9,73) should verify the cleared formula on every admissible nonzero triple, with a fixed primitive n-th root in 𝔽_ℓ. They detect the sign of T and misplaced ζ shifts.
- Characteristic dividing n is outside the specialization theorem. Analytic branches and the Gaussian proof are not used to define the finite-field sum.

### 1.4 Kummer values and their descent obstruction

For any field F and positive n invertible in F, with primitive ζ, define the Kummer value of X∉{0,1} by `P_ζ(X)=D_ζ(x)/D_ζ(1)` modulo n-th powers in the universal Kummer extension H, where x^n=X. It is enough for each finite computation to work in a finite subextension containing the n-th roots of **both** every X used and every 1−X used. A finite list of X-roots alone does not prove root independence: quasi-periodicity involves an n-th root of 1−X. Define the degenerate values by P(1)=1, P(0)=D(1)⁻¹ and P(∞)=D(1). Extend multiplicatively to the free projective-symbol group. Require `kummerValue_changeLift`, `kummerValue_inversion`, `kummerValue_kummerInvariant`, and `kummerValue_cyclotomicWeight`. For all n the squared inversion relation holds; for odd n it gives `P(X)P(X⁻¹)=1`. At even n, D(1)² has a root-of-unity power class, without the odd-order formula for D(1). (CGZ v3 §2.2, pp. 9–12.) Needs: §1.1, the Kummer isomorphism and the Bloch convention supplier.

Compute the connecting obstruction for Φ=Gal(H/L): the boundary of P on a formal combination is the cup-product realization of its exterior Bloch boundary, with the sign fixed by the positive Kummer convention. In particular it vanishes on the ordinary Bloch group. The identification of the kernel with base-field power classes uses CGZ Lemma 2.3 with gcd(n,w_F)=1 and the **universal** Kummer extension. A finite Kummer subextension only supplies a restricted inflation image; it need not make Kummer on Fˣ/n onto all of H¹(Φ,μ_n). Name the comparison `kummerValue_boundary` and prove its compatibility with each finite witness. (CGZ v3 Lemma 2.3 and Proposition 2.5, pp. 9–12.)

**Checks.**
- P(1)=1 while P(0)P(∞)=1. At n=3 these values include the nontrivial class of D(1), so setting both degenerate values to one changes the map.
- Replacing x by ζx changes D(x) by `(1−x)^n/(1−X)` in the fraction field. The class is unchanged once an n-th root of 1−X is available.
- A single symbol [X] with nonzero exterior boundary has a nonzero obstruction in general. It must not receive an unconditional descended base-field value.
- A trivial finite witness Φ has H¹=0 even when Fˣ/(Fˣ)ⁿ is nontrivial. This rejects an alleged finite-witness Kummer isomorphism without its image restriction.
- In the quadratic finite fields of sizes 19²,13²,17²,29²,149², test admissible X from the base field at respective orders 5,7,9,15,25: root changes preserve P and inversion multiplies to one. For n=5 over 𝔽_(19²), X=3 and k=2, the changed-root exponent is 3, not 2; the nontrivial value distinguishes these exponents.

### 1.5 The finite regulator and its functorial API

Assume n odd and gcd(n,w_F)=1. For an admissible symbol combination in `A_old(F;ℤ/n)` with boundary zero modulo n, define `finiteRegulator ζ` as the unique descended χ⁻¹ class whose Kummer restriction is its P value. This includes the étale Bloch group described next; restricting to the ordinary Bloch group gives `R_ζ : B_old(F)/n → (Lˣ/(Lˣ)ⁿ)^χ⁻¹`. The uniqueness argument must occur in the correct eigenclass sequence and with the base-field correction, not in the ambient extension map, which can have a kernel. Require `finiteRegulator_spec`, `finiteRegulator_unique`, additivity on symbols, and factorization through the five-term relation. KMS supplies the five-term identity; the degenerate symbols and the D(1) normalization remain in its boundary cases. (CGZ v3 Proposition 2.5 and Theorem 2.11, pp. 11–15; published Theorem 1.2, pp. 384–385.) Needs: §§1.3–1.4 and odd Bloch convention comparisons.

This construction applies to any field of characteristic prime to n with μ_n(F)={1}, not only to number fields; gcd(n,w_F)=1 is the number-field way to state that hypothesis. When w_F is finite but not coprime to n, define `poweredRegulatorLifts` as the **set of** χ⁻¹ lifts of P(ξ)^w_F. Prove `poweredRegulatorLifts_nonempty` and `poweredRegulatorLifts_ambiguity`: the ambiguity is the χ⁻¹ part of the kernel of `Lˣ/(Lˣ)ⁿ → Hˣ/(Hˣ)ⁿ`. Do not assert a unique lift in this generality. Indeed if μ_n⊂F then G is trivial, all Fˣ/n classes die in H, and every such class lifts the identity P(ξ)^w_F. Thus the unrestricted uniqueness wording of CGZ Proposition 2.5(b), pp. 11–13, needs a correction or extra data before it can define a single-valued powered regulator. At coprime orders this lift set is the singleton {R(ξ)^w_F}. The ordinary n=1 case is trivial. Even coefficients in the P construction remain available, but the KMS/Bloch regulator built here uses the stated odd-order convention.

The five-term equation on X,Y∉{0,1}, X≠Y, is
`P(X) P(Y)⁻¹ P(Y/X) P((1−X⁻¹)/(1−Y⁻¹))⁻¹ P((1−X)/(1−Y))=1`.
For r|n, ζ_r=ζ_n^(n/r), the reduction of R_(ζ_n)(ξ) modulo r agrees in F(ζ_n)ˣ/(F(ζ_n)ˣ)^r with the extended class of R_(ζ_r)(ξ). The same reduction for D compares D_(ζ_n)(x) with D_(ζ_r)(x^(n/r)) and their values at one modulo r-th powers. These explicit arrows are the distribution contract used in the CRT assembly.

The root law is `R_(ζ^k)=R_ζ^(k⁻¹)` for k∈(ℤ/n)ˣ. Order comparison uses ζ_r=ζ_n^(n/r) for r|n and the specific power-class coefficient maps in CGZ Lemmas 2.7–2.8. Prove reduction, distribution and CRT as commutative diagrams, keeping the ambient field on each arrow. Do not identify all roots at different levels by an unspecified primitive generator. For an embedding F→E, prove `finiteRegulator_fieldMap` when gcd(n,w_E)=1, with both sides viewed in E(ζ); this is naturality, not an injection theorem for Eˣ/(Eˣ)ⁿ. The powered lift set is a separately specified descent variant and is not used to define an all-order Chern map. (CGZ v3 Lemmas 2.7, 2.8 and 2.10, pp. 14–15.)

**Checks.**
- Replacing ζ by ζ⁻¹ inverts R, which checks the inverse exponent in the root law.
- For n=15, reduction to orders 3 and 5 must use ζ³ and ζ⁵ in the correct order and reconstruct the original class by CRT. Interchanging them fails the coefficient domains.
- On an n-th power representative the output class is one. Adjoining an n-th root may kill a nontrivial class, so field naturality cannot imply injectivity.
- At n=1 the regulator is trivial. If F contains μ_p with p|n, the stated unique-descent hypotheses fail; the all-order ε construction in §1.15 remains available through Chern classes.
- Over ℚ at n=5, [2] has zero boundary modulo five because 2∧(−1) is 2-torsion; its regulator is one. The calibrated eta value over ℚ(√5) is ζ₅² and distinguishes it from ζ₅ to any other exponent modulo five. For [32], σ₂ acts on its regulator by exponent three rather than two.
- At F=ℚ(ζ₃), n=3 and ξ=0, both 1 and the nontrivial class [2] map to P(ξ)^6=1 in the universal Kummer extension and satisfy the trivial G eigencondition. The valuation at a prime over 2 shows [2] is not a cube in F. This rejects unique powered descent at noncoprime orders.

### 1.6 The étale Bloch group and the K₂ boundary

When F has no nontrivial p-th roots of unity for every p|n, define `etaleBlochGroup F n` using formal symbol combinations whose exterior boundary vanishes modulo n, modulo the appropriate five-term relations and n multiples. Prove the natural exact sequence
`0 → B_old(F)/n → B_et(F;n) → K₂(F)[n] → 0`.
The final arrow is a K₂ class obtained from the divisible boundary, not the ordinary integral Bloch boundary. Under n=pᵃ prime to w₂(F), prove the comparison with H¹(F,ℤ/n(2)), using the supplied Tate description of K₂ torsion and finite Chern classes. Require `etaleBloch_ofBloch`, `etaleBloch_boundary`, `etaleBloch_exact`, `etaleBloch_fieldMap` on admissible fields, and the finite regulator on this larger group. (CGZ v3 Theorem 2.11, p. 15, and §1.1, p. 5.) Needs: §§1.4–1.5, ArithmeticKTheory and MotivicEtaleKTheory M.3 and M.7.

**Checks.**
- An ordinary Bloch class maps to zero in K₂(F)[n], and its étale regulator agrees with §1.5.
- Over ℚ at n=5, [32] has `32∧(1−32)=5(2∧−31)`. Its resulting K₂ class {2,−31} is nonzero, detected by the tame symbol at 31, so it need not be an ordinary Bloch class.
- The regulator of that étale class has valuations represented by 1,2,3,4 at primes over 31 in ℚ(ζ₅). Thus the unit-image theorem for ordinary Bloch classes cannot be extended to every étale class.
- At n=1 the boundary and quotient are trivial. If μ_p⊂F, the root-free hypothesis has failed and the displayed exact sequence is not reused without a separate proof.

### 1.7 The cyclotomic eta element

For odd n≥3, primitive ζ, and F=ℚ(ζ+ζ⁻¹), define `eta ζ` in B_old(F)/n by the projective-symbol sum
`Σ_(k mod n) [1−((ζ−ζ⁻¹)/(ζ^k−ζ^(−k)))²]`.
Interpret k=0 as [∞] and k=±1 as [0]; all other denominators are nonzero. Prove it is a Bloch class, is n-torsion before reduction where appropriate, and obeys `eta_changeRoot : eta(ζ^k)=k² eta(ζ)` for k coprime to n. The old convention retains the correction symbols needed for these assertions. (CGZ v3 (34) and Lemma 5.1, p. 26; root scaling in the proof of Theorem 7.4, pp. 37–38.) Needs: the supplied Bloch convention and §1.5's root law.

**Checks.**
- At n=3 the sum reduces to [0], a nonzero cubic class in the old convention. Erasing [0] erases the generator.
- At n=5 it is `[∞]+2[0]+2[−φ]`, φ=(1+√5)/2. The two projective boundary terms remain present.
- Replacing ζ by ζ⁻¹ leaves eta unchanged because (−1)²=1, although it inverts its Chern and regulator values. This distinguishes the degree of eta from the degree of the root-basis map.
- At n=3,5,7,9,11, compare the multisets of the projective orbit cross ratios for t with the displayed eta arguments, including repeated vertices and infinity. Omitting the degenerate arguments changes these multisets before passing to Bloch relations.

### 1.8 Positive cyclic chains and the Bott element

In the normalized bar complex of C_N with positive generator t define the positive odd chains beginning with `α₁=[t]` and `α₃=Σ_(0≤j<N)[t|t^j|t]`, with the standard alternating boundary. Take the even chain `α₂=Σ_(0≤j<N)[t^j|t]`, and compare with the two-periodic resolution so that its norm differential is positive and its odd differential agrees with the chosen left/right conversion. Prove `alpha_three_cycle`, `alpha_three_generator` in H₃(C_N,ℤ)≃ℤ/N and `alpha_two_bockstein` with boundary N[t]. The isomorphism with abstract cyclic group homology must carry this named positive chain to +1. (Hutchinson 2024 §2.1, Lemma 2.1 and Corollary 2.2, preprint p. 2; Hutchinson 2013 §6.4, pp. 32–33.) Needs: existing bar and cyclic resolutions.

For a ring containing primitive ζ_N and N odd, use the supplied finite-coefficient K-theory to construct `bott ζ ∈ K₂(B;ℤ/N)` from the positive root cycle. Prove `∂ bott=ζ`, `c_(1,0)(bott)=ζ`, naturality and `bott(ζ^k)=k bott(ζ)`. The Bott construction itself does not require N invertible in B; the étale Chern assertion does. It is not in general an integral element of K₂(B)/N because its Bockstein is nonzero. (Hutchinson 2024 §4 and Lemma 4.1, preprint p. 6; the Chern conventions are in §2.3, pp. 4–5.) Needs: H.6, K.7 and the early Chern prefix.

**Checks.**
- N=1 gives zero homology and a zero Bott element. It is not a positive-order generator statement in a nonzero group.
- For N=3 normalization leaves `α₂=[t|t]+[t²|t]` and `α₃=[t|t|t]+[t|t²|t]`. Their boundaries are respectively `3[t]` and zero, so the Bockstein of the positive even chain is +[t]. Changing the right-periodic differential from 1−t to t−1 without changing the comparison fails this two-term sign test.
- For nontrivial ζ, ∂bott=ζ rules out a lift from K₂(B)/N. A definition placing bott in that smaller group fails exactness.
- Replacing ζ by its inverse negates bott and its degree-zero Chern class, independently of any eta calculation.
- For B=ℤ[ζ_p] and p odd, bott is defined even though p is not invertible in B. Its étale Chern evaluation is used only after inverting p; a definition requiring invertibility for the Bott element itself is too restrictive.

### 1.9 From the bar cycle to eta times Bott

Consume the odd-coefficient Hurewicz and SL/GL comparison from the K-theory and Bloch suppliers. Its precise contract is the degree-three identification with the SL homology summand and the specified projection off the decomposable GL part; it is not an integral assertion that K₃(F)=H₃(GL(F),ℤ). Specialize the configuration map to
`t=[[0,1], [−1,ζ+ζ⁻¹]] ∈ SL₂(F)`.
Prove `eta_bar_bloch`: the image of α₃(t) is the eta sum of §1.7, including [0]. The configuration map at repeated vertices is part of the supplier and cannot be replaced by the generic cross ratio on four distinct points. (Hutchinson 2013 §§6.2–6.4, pp. 31–33; CGZ v3 §4.2, pp. 23–24.)

Over E=ℚ(ζ), diagonalize t with `A=[[ζ,ζ⁻¹],[1,1]]`. Its determinant d=ζ−ζ⁻¹ is nonzero; `A diag(d⁻¹,1)` has determinant one and conjugates the same diagonal matrix diag(ζ⁻¹,ζ) to t. Use this actual SL conjugation and the positive Bockstein to prove `eta_restrict_eq_root_mul_bott`: the restricted finite K₃ class is ζ*bott(ζ). Restriction F→E is injective at odd coefficients because its degree is two. Passing instead to B(E)/N can kill the class and does not prove this K-theory equality. (Hutchinson 2024 Proposition 4.6, preprint pp. 6–7.) Needs: §1.8 and the supplied K-theory product/Hurewicz comparisons.

**Checks.**
- At N=3 the bar-to-Bloch image is [0], agreeing with §1.7, not zero.
- The determinant correction rescales a diagonalizer column by d⁻¹ and leaves its eigenvalue unchanged. An uncorrected GL conjugation is not an SL conjugation argument.
- In the product ζ*bott(ζ), replacing ζ by ζ^k multiplies the K₃ class by k². This checks compatibility with eta scaling.
- The extension degree two can be inverted mod odd N. The same restriction argument is unavailable at N=2.

### 1.10 The degree-three Chern sign

With the positive Kummer and Bott conventions above, require the finite Soulé product formula
`c_raw,(2,1)(a*bott(ζ)) = −δ(a)∪ζ`.
Here N is an odd prime power invertible in E and a∈Eˣ. After untwisting, the raw root-based map sends eta to [ζ⁻¹], while `c_plus` sends it to [ζ]. These maps are defined on all classes before this evaluation. Prove the signed statement from the product formula and §1.9; do not use a desired evaluation of eta as the definition of `c_plus`. (Hutchinson 2024 Theorem 2.12, Corollary 2.13, Lemma 4.1 and Proposition 4.6, preprint pp. 4–7.)

A separate target `finiteChern_normalization_comparison` must compare the exact finite Chern convention in the CGZ–GSWZ interface with `c_raw` or `c_plus`, including the K₃/Bloch comparison, cup order, Bockstein and Tate basis. The printed negative product and the printed identification in Hutchinson Lemma 4.1 do not by themselves settle this: the latter identifies `−x∪ζ` with a positively written tensor. This sign issue must be resolved by constructing the diagram. Until that proof, the evaluations on `c_fixed` and the numerical comparison exponent remain conditional. The injectivity and unit-image statements are unaffected by inversion.

**Checks.**
- Over ℚ(ζ₃), [ζ₃] and [ζ₃⁻¹] are distinct cubic power classes: a cube root of their ratio requires the corresponding ninth-root extension. Cubic coefficients therefore detect the sign.
- The raw product formula with a=1 gives the trivial class. Its normalization is still fixed by the positive Bott Bockstein, not by choosing eta afterward.
- At odd N, negating the additive Chern map inverts its multiplicative value. Squaring the value does not generally remove this inversion.
- In 𝔽₇ˣ/(𝔽₇ˣ)³, [2] and [2]⁻¹=[4] are distinct because the cubes are {1,6}. Thus the sign can also be tested over a finite field containing μ₃.

### 1.11 Local regulators and local Chern maps

Let n=pᵃ with p odd and a≥1, and let 𝔮 be a prime of F of prime norm ℓ≡−1 mod n above a rational prime splitting completely in F. Its cyclotomic residue field is 𝔽_(ℓ²). Define `localFiniteRegulator` by the finite P formula: every element of 𝔽_ℓˣ has a unique n-th root in 𝔽_ℓ because gcd(n,ℓ−1)=1, so no Kummer extension is needed. Define `localFiniteChern` by finite Chern classes and the unramified K₃ specialization. Require reduction diagrams for both maps, and the compatibility of the K₃-to-Bloch comparison with reduction. The Chern diagram uses finite-coefficient Gabber rigidity; a map on arbitrary integral K₃ is not a substitute. (CGZ v3 §§4.1–4.4, Lemmas 4.1 and 4.4, pp. 21–25.) Needs: the finite-field Bloch calculation of K3BlochGroups, KTheoryFiniteLocalFields L.2 and L.7, §§1.4–1.5 and §0.7's S-unit representatives avoiding 𝔮.

**Checks.**
- For n=3 and ℓ=5 the cube map on 𝔽₅ˣ is an automorphism and ζ₃ lies in 𝔽₂₅, not in 𝔽₅.
- For ℓ≡1 mod p the unique-root argument fails and the chosen local map is outside its stated domain.
- A global representative whose valuation at 𝔮 is nonzero cannot simply be reduced as a nonzero unit. The S-unit construction must first avoid that prime.

### 1.12 Eta generators and the local isomorphism

Prove that eta generates the p-primary K₃/Bloch group of ℚ(ζ_n+ζ_n⁻¹), a cyclic group of order n. Its reduction is a generator of the local group modulo n when `v_p(ℓ+1)=a`. The exact valuation condition is essential: for ℓ≡−1 mod pn the class of the order-n root can be divisible by p in the larger cyclic group. (CGZ v3 Lemma 5.1, p. 26.)

Prove `localFiniteRegulator_isIso` for **every** prime ℓ≡−1 mod n, not just those of exact p-adic valuation. Follow the divisibility argument through order n²: R_ζ(eta) lies in the cyclic subgroup generated by [ζ]. Establish the valuation witness that `τζ^i` is never a p-th power, with `τ=∏_(k<n)(1−aζ^k)^k` and a chosen split prime at which exactly one nonzero-weight factor has valuation one. Chebotarev then supplies an exact-valuation prime detecting a unit exponent. For primes of larger valuation, pass through the compatible higher-order regulator to obtain the same isomorphism on the n quotient. This last passage must be explicit; the exact-valuation eta-generator argument alone does not prove all ℓ. (CGZ v3 Theorem 5.2 and Lemmas 5.3–5.4, pp. 26–28.) Needs: order distribution and Chebotarev. The proof must not use the later Nahm evaluation R(eta)=ζ².

**Checks.**
- n=3, ℓ=5 has v₃(6)=1, so eta reduction is a generator modulo three.
- n=3, ℓ=17 has v₃(18)=2. The order-three root class is not the same generator test in the quotient; the local regulator isomorphism still has to follow from the higher-order argument.
- At the valuation witness prime the exponent of its unique vanishing factor is chosen nonzero modulo p. A valuation at the k=0 factor, which has exponent zero, would prove nothing.
- At n=3 and ℓ=5,11,23,29, the explicit eta formula has local regulator class [ζ²]≠1. More generally, for each odd n≤27 and the first four primes ℓ≡−1 mod n with exact valuations at every p|n, the same finite computation tests [R(eta)]=[ζ²]. This is a check on the calibrated formula, separate from the proof of local invertibility without that calibration.

### 1.13 Chebotarev detection and comparison up to a unit

Assume n=pᵃ is odd and ζ_n∉F̃(ζ_n+ζ_n⁻¹), where F̃ is the Galois closure. Use Kummer extensions and prescribed Frobenius to prove that the product of local Chern maps, over all but finitely many eligible split prime norms ℓ≡−1 mod n, has the same kernel as the global Chern map. The target is the **product** of local groups. Nonzero global classes may have infinitely many nonzero reductions, so no finite-support direct-sum map is claimed. The set of vanishing reductions determines the cyclic subgroup generated by the global image, or equivalently its value up to an invertible scalar on that subgroup. It does not determine the chosen generator. (CGZ v3 Proposition 4.2 and Remark 4.3, pp. 22–23, with the product target made explicit.) Needs: §0.7, local comparisons and Chebotarev. The disjointness condition holds when p is unramified in F.

Combine detection, the local isomorphism, and both reduction diagrams to prove: for gcd(n,M_F)=1 there is a unit γ∈(ℤ/n)ˣ, independent of F in the compatible construction, such that `R_ζ=c_fixed,ζ^γ` on B(F)/n. Specify the K₃/Bloch identification on the domain. Extend the prime-power result by CRT with §1.5's order diagrams. This is the comparison up to a unit, rather than the numerical evaluation γ=2. (CGZ published Theorem 1.6, p. 386; v3 §5.1, pp. 25–28.) A compositum argument must check its discriminant and K₂ hypotheses anew; one cannot assume coprimality with M survives arbitrary field extension.

**Checks.**
- A nontrivial cyclic Kummer extension has infinitely many detecting Frobenius primes. This rejects replacing the product target by a direct sum.
- Multiplying a class by a unit leaves its zero-reduction set unchanged. Detection therefore cannot identify γ without a calibrated class.
- If the required root lies in F̃(ζ+ζ⁻¹), eligible split primes can be absent; no detection conclusion is made then.

### 1.14 Image, scalar calibration and the early conditional refinement

Transfer §0.9 through the unit comparison to obtain the finite regulator's injectivity, S-unit image and good-order ordinary-unit image. Keep S(F,n) at fixed n. For good squarefree n the ordinary-unit target is exhausted; general prime powers retain only injectivity. (CGZ published Theorem 1.2, pp. 384–385; v3 proof at pp. 27–28.) Needs: §1.13 and the finite Chern unit theorem.

Prove the scalar-reading lemma: if `R_ζ(eta)=ζ^a` and `c_fixed,ζ(eta)=ζ^b` with b a unit mod n, then γ=a b⁻¹ mod n. Under the independent normalization comparison `c_fixed=c_plus`, the signed Chern evaluation gives b=1. An **additional** prime-power input R_ζ(eta)=ζ² then implies `R_ζ=c_plus,ζ²`; with the raw convention the exponent is −2. Supply the compatible CRT calculation for general good n. (CGZ v3 §5.3, pp. 28–30, and Theorem 7.4, pp. 37–38; Hutchinson 2024 Theorem 3.1 and Proposition 4.6, preprint pp. 5–7, subject to §1.10's sign comparison.) The R value comes from HabiroNahmSeries; only this implication belongs here, so the construction has no dependency on that downstream roadmap.

**Checks.**
- At n=5 with (a,b)=(2,1), the scalar is 2; with (a,b)=(2,−1), it is −2. This detects a concealed normalization change.
- If b is not invertible, the eta equation need not determine γ. The inverse in the statement requires the explicit unit premise.
- The root law R_(ζ^k)=R_ζ^(k⁻¹) and eta scaling k² predict R_(ζ^k)(eta_(ζ^k))=(ζ^k)² when the calibrated value holds. These two exponents must be combined, not individually equated.

### 1.15 All-order Chern classes, Kummer torsors and root lines

For **every** m>0 and ξ∈K₃(K), define `epsilonClass m ξ = c_fixed,m(ξ)²`. The construction is the all-order Chern map of §0.3, not the regulator whose unique-descent hypotheses exclude some orders. It has weight χ⁻¹, is additive-to-multiplicative in ξ, and is compatible with root changes, order changes and field embeddings. At primes of K(ζ_m) not dividing m its valuations are divisible by m; formulate this as membership in the ordinary Kummer Selmer group outside m. The finite Chern construction gives this unramifiedness after inverting m. An assertion of étale unramifiedness at primes dividing m would need a stronger coefficient theory and is not used. At good orders §0.9 supplies ordinary-unit representatives. (GSWZ (16)–(18), pp. 8–9; CGZ v3 §3.3, p. 19.) Needs: the early finite-Chern prefix and Selmer infrastructure.

Attach the μ_m-torsor `T_m(ξ)` and its associated one-dimensional line `rootLine m ξ`. A representative u gives the equation y^m=u; replacing u by uv^m identifies the torsors by y↦vy. For full A_m(K), perform this construction on every étale factor and package it by descent, retaining coefficient permutations. Require `epsilon_add`, `epsilon_changeRoot`, `epsilon_reduceOrder`, `epsilon_fieldMap`, `rootLine_zero`, `rootLine_tensor` and their identity and composition laws. Construct the coherent equivariance isomorphisms of torsors, not merely equality of their isomorphism classes. A χ⁻¹ eigenclass alone does not canonically choose all roots or all coherence maps. This coherence is an explicit prerequisite for the nonlinear global gluing expression in Layer 3.

**Checks.**
- ε₁(ξ)=1 and its associated line is the ordinary coefficient line.
- At K=ℚ(√−3), m=3, the definition exists although μ₃⊂K and the uniquely descended R construction is outside its hypotheses.
- For K=ℚ and m prime to 6, K₃(ℚ)≃ℤ/48 has trivial m quotient, so ε_m is trivial. This does not justify deleting even or cubic orders from the definition.
- Replacing c_fixed by its inverse inverts ε; squaring has not erased the sign. Replacing a representative by an m-th power multiple rescales its root line without changing its isomorphism class.
- Reducing order 25 to 5 must use ζ₅=ζ₂₅⁵ and the quotient of power classes. The finite P analogue over 𝔽_(149²) gives the same class modulo fifth powers; this checks the direction of the coefficient map without claiming it supplies coherent Chern torsors.

### Examples

The two finite products exhibit different orientations: D at order two is 1+x, whereas f at order two is `1+(1−ζy)z/(1−ζx)`. Their rational example in Suggested.lean tests which argument is in the denominator. The cubic eta and D(1) tests retain the [0] correction and the phase that is invisible to a real regulator. The étale class [32] at order five shows why finite regulator values and ordinary Bloch-unit values must have different domains. At local norm 17 and coefficient order three, the extra power of three in ℓ+1 explains why an eta generator argument must use exact valuations or a higher-order comparison.

### Dependencies

This layer consumes Layer 0, the Bloch and finite-K-theory suppliers, complex and p-adic-independent Pochhammer analysis, and Chebotarev. Its conditional numerical comparison consumes a single eta value but does not consume Nahm asymptotics as a construction input. The all-order Chern torsors use the early étale construction directly; they remain available at the orders excluded from finite-regulator descent. The unresolved normalization diagram and torsor coherence are named prerequisites of Layer 3, not silently settled by local numerical tests.

## Layer 2: arithmetic Habiro rings

### 2.1 Compatible roots and transitions between orders

Choose `compatibleRoots` with ζ₁=1, ζ_ab=ζ_aζ_b for coprime a,b, and ζ_(p^(k+1))^p=ζ_(p^k). A complex witness is `ζ_m=exp(2πi Σ_(p|m) p^(−v_p(m)))`. Prove primitivity and the two compatibilities. For m=p^k m′ with p∤m′, the embedding A_m→A_pm sends ζ_m to ζ_pm^e, where `e≡p mod p^(k+1)` and `e≡1 mod m′`. State this CRT exponent as a residue, not an arbitrary integer choice. The construction must work on full cyclotomic algebras and commute on iterated order transitions. Require `compatibleRoots_primitive`, `orderTransition_spec`, `orderTransition_comp` and `rootDifference_topologicallyNilpotent`. (Wagner thesis §2.2, item 2.11, p. 31; GSWZ §1.3, pp. 5–6.) Needs: primitive roots, CRT and cyclotomic algebras.

At a prime p, c=ζ_pm−ζ_m has positive p-adic valuation; on each factor its valuation is `1/φ(p^(k+1))` with v_p(p)=1. It is therefore topologically nilpotent, even though it is usually a nonzero element of a reduced ring. A generic formal substitution theorem requiring a nilpotent constant is not the re-expansion theorem needed here.

**Checks.**
- ζ₂=−1, ζ₃=exp(2πi/3), and ζ₆=ζ₂ζ₃=exp(5πi/3). This is not exp(2πi/6).
- The independent choices ω_m=exp(2πi/m) give ω₆−ω₃=1, which is not 2-adically small. They fail the transition condition despite being primitive at each order.
- At m=1, c=ζ_p−1 has valuation 1/(p−1); at m=p^k the value is 1/φ(p^(k+1)). The valuation is positive, not infinite.
- At (p,m)=(2,5), the CRT exponent is 6, ζ₅=ζ₁₀⁶, and c=−2ζ₅ has valuation one. At (3,4) and (3,3), the differences ζ₁₂−ζ₄ and ζ₉−ζ₃ have valuations 1/2 and 1/6 respectively; their second and sixth powers are 3 times units.

### 2.2 Full coefficient algebras and two Frobenius actions

Define `arithmeticCyclotomicAlgebra K Δ m` to be A_m(R) with its finite-free R-basis `1,ζ_m,…,ζ_m^(φ(m)−1)` for m>0. Use the full tensor algebra throughout. After rationalization identify its field factors using the intersection of K with the cyclotomic field; a selected compositum is only one quotient. Complete the R coefficient factor at p to obtain A_m(R̂_p). If p∤Δ then R̂_p is finite étale over ℤ_p, a product of unramified integer rings; if p|Δ then it is zero. (GSWZ §1.4, pp. 6–7, and §5.2, pp. 64–65.) Needs: finite étale algebras, cyclotomic quotients and unramified completions.

For p∤Δ define `unramifiedFrobenius K Δ p`, written φ_R, as the unique ring endomorphism of R̂_p with φ_R(a)−a^p∈pR̂_p for every a. The ring R is étale over ℤ[1/Δ] by the discriminant criterion (Mathlib `NumberField.not_dvd_discr_iff_isUnramifiedIn` and `Algebra.Etale.of_formallyUnramified_of_flat`). For existence, lift the p-power map of R/pR, a ring endomorphism in characteristic p, along the complete ideal pR̂_p by formal smoothness (`Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`), and extend the lift from R to R̂_p by continuity. Uniqueness is formal unramifiedness (`Algebra.FormallyUnramified.ext_of_iInf`) with ⋂_a p^aR̂_p=0. This is the Hensel construction of GSWZ §5.2. Require `unramifiedFrobenius_spec`, `unramifiedFrobenius_unique`, `unramifiedFrobenius_bijective`, `unramifiedFrobenius_factor`, `unramifiedFrobenius_orderOf` and `unramifiedFrobenius_fieldMap`. Idempotents lift uniquely and satisfy e^p=e, so φ_R fixes each factor of R̂_p≃∏_(v|p)O_(K_v); its extension to A_m(R̂_p) can still permute the finer factors there. On O_(K_v) it is the local Frobenius `TauCeti.frobeniusAlgEquiv` of the unramified extension K_v/ℚ_p, and φ_R has order lcm_(v|p) f_v. For an embedding F→E and a common Δ the completed coefficient map intertwines the two Frobenii, by uniqueness. For p|Δ the ring R̂_p is zero and φ_R is its only endomorphism. (GSWZ §5.2, (324)–(330), pp. 64–65, and Definition 1.1 with (13), pp. 6–7; Wagner thesis 2.7, p. 29, for the relative lift over a Λ-ring.) Needs: Mathlib's étale lifting theorems and current Tau Ceti's local Frobenius.

Its gluing extension `coefficientFrobenius` fixes ζ_m and x. For p∤m there is a different automorphism `cyclotomicFrobenius` applying φ_R and sending ζ_m to ζ_m^p, again fixing x. The first is used for re-expansion gluing; the second is used in Dwork defects at q^p. Require `coefficientFrobenius_fix_root`, `cyclotomicFrobenius_root`, their map and order-transition compatibilities, and their finite-order property on a fixed finite étale coefficient algebra. Frobenius acts on a product, retaining any induced factor permutations; it is not a map on a single silently chosen residue field.

**Checks.**
- K=ℚ(i), Δ=4 and m=4 give A₄(R)≃R×R, with nontrivial idempotent `(1−i⊗ζ₄)/2`. Treating it as the field ℚ(i) loses half the rank.
- At a split prime 5, R̂₅≃ℤ₅×ℤ₅ for K=ℚ(i). At an inert prime 3 it is the unramified quadratic ring, whose Frobenius sends i to −i.
- For K=ℚ(∛2), p=5, the completion has degrees one and two, and local Frobenius acts nontrivially on the quadratic factor. K has no nontrivial global automorphism, so that Frobenius cannot be defined as a global field automorphism.
- If p|Δ the coefficient algebra is zero and its gluing equation is automatic. No nonzero-field instance is attached to that factor.
- For R=ℤ[1/6] at p=3, every R/3^aR is zero, so R̂₃=0, while R ⊗ ℤ₃=ℚ₃. This distinguishes completion from tensoring at an inverted prime.
- At K=ℚ,p=2,m=3, coefficient Frobenius fixes ζ₃ while cyclotomic Frobenius sends it to ζ₃². These are distinct automorphisms even though the rational coefficient Frobenius is the identity.
- For K=ℚ, φ_R is the identity of ℤ_p, although a↦a^p is not: at p=3, 2³=8≠2 while 8−2∈3ℤ₃. A definition φ_R(a)=a^p fails here; it is not even additive.
- A root of unity ζ of order prime to p satisfies φ_R(ζ)=ζ^p. For K=ℚ(i) this gives i↦i³=−i at the inert prime 3 and i↦i⁵=i on both factors at the split prime 5.
- For K=ℚ(i), p=3 and m=4, A₄(R̂₃)≃ℤ₃[i]×ℤ₃[i] through the idempotent e=(1−i⊗ζ₄)/2, and φ_R⊗id sends e to 1−e. Frobenius fixes the single factor of R̂₃ but exchanges the two factors of the coefficient algebra.
- For K=ℚ(∛2) and p=5, x³−2≡(x−3)(x²+3x+4) mod 5 with an irreducible quadratic factor, so the residue degrees are 1 and 2 and φ_R has order lcm(1,2)=2. It is the identity on the degree-one factor; an order equal to [K:ℚ]=3, or to a single residue degree, is wrong.

### 2.3 Convergent re-expansion in arithmetic coefficients

Specialize the supplied re-expansion to c=ζ_pm−ζ_m in the complete coefficient algebra A_pm(R̂_p). Define `arithmeticReexpand p m` on integral series by
`rex_c(Σ a_j x^j)=Σ_i (Σ_(j≥i) binom(j,i)a_j c^(j−i))x^i`.
Every inner sum converges p-adically. Prove that this is a ring homomorphism, commutes with the coefficient Frobenius fixing c, composes with a second admissible shift, and agrees with polynomial substitution. Its target is complete; it is not an algebraic substitution into A_pm(R)[[x]] followed by a completion after the fact. (GSWZ §1.3 and Definition 1.1, pp. 5–7; Wagner thesis §2.2, item 2.11 and Lemma 2.12, pp. 31–32.) Needs: HC.3 and §§2.1–2.2.

**Checks.**
- On x, rex_c gives x+c; on x² it gives x²+2cx+c². Both the sign of the shift and the binomial coefficient are fixed.
- For c=p in ℤ_p, re-expanding Σ_(j≥0)x^j gives `(1−p−x)⁻¹`. Its constant is 1/(1−p), so a rule dropping all positive powers of a nonnilpotent constant is wrong.
- At c=1 the same coefficient sums need not converge. The theorem cannot replace topological nilpotence by the assertion that c belongs to the coefficient ring.

### 2.4 Frobenius-twisted Taylor gluing

Define `ArithmeticTaylorFamily R = ∏_(m>0) A_m(R)[[x]]` and its coefficientwise ring operations. Define `ArithmeticHabiroRing K Δ` as the subring of families satisfying, for every prime p∤Δ and every m>0,
`rex_(ζ_pm−ζ_m)(f_m) = φ_R(f_pm)` in A_pm(R̂_p)[[x]].
The source coefficients and roots are first transported by the order transition in §2.1. This is the Frobenius direction of GSWZ (13). Prove `habiro_mem_iff`, closure under zero, one, addition, negation and multiplication, component extensionality and the component ring homomorphism `habiroTaylor m`. Its constant-term map is evaluation at zero in A_m(R). (GSWZ Definition 1.1, pp. 6–7.) Needs: §§2.1–2.3.

For γ>0 define the restricted ring `ArithmeticHabiroRingAway γ` by retaining orders coprime to γ and precisely the edges whose endpoints remain among them. Construct `habiroRestrictOrders`. When an additional localization inverts γ, explicitly change R and the set of nonvacuous prime constraints. Construct the equivalent Galois-equivariant product over individual roots by a coinduction/descent theorem for the full algebras; choosing one complex root in each orbit is not a coefficient-field embedding for arbitrary K.

**Checks.**
- For K=ℚ, φ_R is the identity and the equation is ordinary Taylor re-expansion. The families of any polynomial in ℤ[1/Δ][q] satisfy it.
- Over K=ℚ(i), the constant family i fails the equation at p=3: its two sides are i and −i. Thus constant coefficients do not in general embed R into the ring.
- Zero and one satisfy gluing at every order, including the zero p-completions. A family supported at one isolated order usually fails an edge equation.
- Restriction away from γ keeps an edge m→pm only when p∤γ and gcd(m,γ)=1. The restricted ring does not impose a missing component equation.
- For the Kontsevich–Zagier family in §2.9, rex_(−2)(f₁)=f₂ has constant 3 and linear coefficient 11 in ℤ₂. Re-expanding f₁ by ζ₃−1 has constant 5−ζ₃; re-expanding f₂ by ζ₄+1 has constant 8−3ζ₄. These tests exercise convergent shifts across three different edges.

### 2.5 Local product rings and untwisting

For p∤Δ define `LocalHabiroRing p = ∏_(m>0,p∤m) A_m(R̂_p)[[x]]`. This is the local product used for sections. It is not, by definition, the ordinary p-adic completion of the global ring. Define the local all-order untwisted glued ring and prove that restriction to prime-to-p orders is a ring equivalence: reconstruct the p-chain forward by re-expanding each seed. No inverse to ramified coefficient descent is needed. For a global family, twisting its m-component by φ_R^v_p(m) transforms the arithmetic gluing into the untwisted gluing, because `rex φ_R^k f_m = φ_R^(k+1) f_pm`. Prove `localUntwist`, `localUntwist_glued_iff`, `localSeedEquiv` and the component formula for reconstruction. (GSWZ (14)–(15), p. 7, and Proposition 5.3, p. 65.) Needs: §2.4 and convergent re-expansion.

Prove the intersection characterization in the product of all coefficient completions: an integral global Taylor family belongs to the arithmetic ring precisely when each p-adic untwist belongs to the classical all-order local Taylor image. Coefficient integrality is detected using `R = K ∩ ∏_(p∤Δ) R̂_p` and the full basis of A_m(R). A further theorem identifying ordinary p-adic completion of the global ring with LocalHabiroRing requires its own completion and base-change proof; that is not inferred from the notation in (14).

**Checks.**
- At p∤m a local seed is unrestricted; no equation relates two distinct prime-to-p seeds.
- At m=p²d, p∤d, the untwisting exponent is two, not one or minus two. Reconstructing the d→pd→p²d chain verifies the sign.
- An arbitrary sequence of local seeds gives a p-adic family, but need not have global algebraic coefficients. The intersection with the rational/integral coefficient family remains essential.
- For K=ℚ(i) at p=5, the local product ring is the product of two rational local rings. At p=3 the twisted scalar i has f₁=i,f₃=−i; applying φ₃^v₃(m) makes both components i and hence untwisted-glued. Leaving out that twist fails the edge 1→3.
- Extending the local-product notation to p|Δ gives the zero ring, for example R=ℤ[1/6] at p=3. This agrees with the zero coefficient completions rather than introducing a nonzero seed at an inverted prime.

### 2.6 The prime-to-p local chart and the p-chain completion

For p prime and m>0 with p∤m, prove `primeToPLocalChart p m`: Taylor expansion q↦ζ_m+x induces a ring isomorphism from the (p,Φ_m(q))-adic completion
`ℤ_p[q]^(p,Φ_m(q)) ≃ A_m(ℤ_p)[[x]]`,
where ζ_m is the class of t in A_m(ℤ_p)=ℤ_p[t]/Φ_m(t). Since p∤m, Φ_m is separable modulo p (Mathlib `Polynomial.separable_cyclotomic` over 𝔽_p). Hence A_m(ℤ_p) is standard étale over ℤ_p (`StandardEtalePair`) and Φ_m′(ζ_m) is a unit. The forward map lifts t↦q mod (p,Φ_m(q)) along the complete ideal by formal smoothness and sends x to q minus the lifted root. The inverse sends q to ζ_m+x. There Φ_m(ζ_m+x)=x·u with u a unit, so (p,Φ_m(q)) maps into (p,x), for which A_m(ℤ_p)[[x]] is complete. One composite fixes q; the other fixes x and, by uniqueness of étale lifts of the root, ζ_m. Both are therefore identities by continuity. The chart retains every factor of A_m(ℤ_p): modulo p, Φ_m is a product of φ(m)/ord_m(p) distinct irreducible factors of degree ord_m(p). (Wagner thesis Lemma 2.12, proof after ℓ-completion, p. 32; Wagner, Q, Lemma 2.12 and its proof, p. 18.) Both printed proofs assert that Φ_m is irreducible over 𝔽_ℓ when ℓ∤m. This fails already for Φ₅ over 𝔽₁₁, and the argument here uses only separability, so it holds factor by factor. Needs: Mathlib's adic completions, étale lifting and cyclotomic separability.

For B=ℤ_p[q], p prime and p∤m, let C_m={mp^k:k≥0}, Φ=Φ_m(q) and I=(p,Φ). Define the p-chain cyclotomic completion using the multiplicative set generated by all Φ_(mp^k). Prove `pChain_mixedAdicEquiv` between that completion and the I-adic completion. The comparison must pass through the double inverse system modulo p^a: a quotient by a monic chain polynomial is finite free over ℤ_p and hence p-complete. Mod p a chain product reduces to Φ^E for an explicit positive E. Mod p^a, Φ^(aE) vanishes in the quotient by that chain product; conversely sufficiently deep chain factors vanish modulo a prescribed (p,Φ) power. These finite-level containments give cofinality after p reduction and then the inverse-limit equivalence. (Arithmetic refinement of GSWZ (14), p. 7, and of the local chart above; compare Wagner thesis Lemma 2.12, pp. 31–32.) Needs: generic completion functors, `primeToPLocalChart`, monic polynomial freeness and cyclotomic prime-power congruences.

Do not claim that the raw ideals generated by chain products and powers of I are cofinal in ℤ_p[q] without the p-completion argument: one topology records cyclotomic factors, while the other contains p powers. The comparison is a theorem of the completed inverse systems, not an identity of those raw neighborhood bases.

**Checks.**
- p=2,m=1 and the factor q+1 reduce modulo 2 to q−1. Modulo (4,q+1), (q−1)²=4=0, while q−1 itself is −2 and is nonzero.
- In the same example the scalar 2 is not divisible by an arbitrary raw chain product, so a proof of raw ideal cofinality using p∈I fails.
- p|m is excluded from the prime-to-p seed statement. Removing that condition duplicates a chain already indexed by its prime-to-p part and corrupts the product decomposition.
- `primeToPLocalChart` at m=1 is ℤ_p[q]^(p,q−1)≃ℤ_p[[x]] with x=q−1, for every prime p including 2.
- At m=3 and p≠3, Φ₃(ζ₃+x)=(2ζ₃+1)x+x² with (2ζ₃+1)²=−3, a unit exactly when p≠3. At p=3 the hypothesis p∤m fails and so does the chart: Φ₃≡(q−1)² mod 3, so the completion is ℤ₃[[q−1]], whose reduction mod 3 is the domain 𝔽₃[[x]], while A₃(ℤ₃)[[x]] modulo 3 is the nonreduced ring (𝔽₃[t]/(t−1)²)[[x]].
- The rank tests at (p,m)=(11,5) and (2,3) in §2.7 apply to the chart: four factors ℤ₁₁[[x]] in the first case, one factor over the unramified quadratic ring in the second.

### 2.7 Prime-to-p Taylor splitting and the all-order image

Split the cyclotomic index set into its p-chains, apply the infinite Chinese remainder theorem of HC.5 in the cyclotomic completion, the p-chain comparison and the local chart of §2.6. Prove `primeToPTaylorEquiv`:
`ℤ_p[q]^ℕ ≃ ∏_(m>0,p∤m) A_m(ℤ_p)[[x]]`.
Then prove `untwistedTaylorImage_iff`: the all-order Taylor image is exactly the families satisfying re-expansion along p-chains. The forward reconstruction from prime-to-p seeds in §2.5 gives the inverse on all orders. This target concerns the full coefficient algebras, including all factors when Φ_m splits; it is the arithmetic assembly beyond the single-order chart of §2.6. (GSWZ (14), p. 7; Wagner thesis Lemma 2.12, pp. 31–32, with full cyclotomic algebras in place of an irreducibility assumption.) Needs: §2.6, HC.3 and HC.5.

**Checks.**
- At p=11,m=5 the polynomial Φ₅ splits into four linear factors over ℤ₁₁. Both sides of the local chart have rank four over ℤ₁₁[[x]]; one chosen root gives rank one and is not an equivalence.
- At p=2,m=3 the coefficient algebra is the unramified quadratic integer ring, and the chart retains that degree.
- Independent seeds at orders 1 and 3 for p=2 remain independent. The components at orders 2,4,8 come only from the order-one seed, not from order three.
- At p=2,m=1 the image of q² has coefficients 1,2,1,0 in degrees 0,1,2,3. The zero completion element has zero at every seed. The idempotent seed equal to one at m=1 and zero at every other odd order reconstructs exactly the 2-power chain.

### 2.8 Coordinate conversion and weighted Taylor jets

Define `multiplicativeTaylorCoordinates` from an additive family by x=−ζ_m u. If the coefficient of x^k is a_(m,k), then the coefficient denoted C_(m,ℓ) in multiplicative coordinates is `C_(m,ℓ)=(−ζ_m)^(ℓ−1)a_(m,ℓ−1)`. Implement the coordinate isomorphism by the existing power-series rescaling API, with inverse u=−ζ_m⁻¹x. Define the finite weighted jet at bound N by retaining exactly m(k+1)<N, expanded in the full cyclotomic basis. Require `coordinateChange_coeff`, `coordinateChange_inverse`, `weightedJet_map` and compatibility with Taylor maps. These finite jets are the inputs to the supplied integral Taylor-lattice detector. (GSWZ (298)–(306), pp. 59–60.) Needs: power-series rescaling and §2.2.

**Checks.**
- At m=1 the linear coefficient changes sign: q=1+x=1−u. The quadratic coefficient keeps its sign.
- At m=2, ζ₂=−1, so x=u and all coefficients agree.
- Bound N=4 retains (m,k)=(1,0),(1,1),(1,2),(2,0),(3,0), and excludes (1,3),(2,1),(4,0). Replacing the strict inequality by ≤ changes the jet dimension.

### 2.9 Rational coefficients and the classical Habiro ring

For K=ℚ and R=ℤ[1/Δ], prove `rationalHabiroTaylorImage`: the full all-order Taylor map from the classical cyclotomic completion R[q]^ℕ has image exactly the families satisfying §2.4. The proof uses the p-adic splitting at p∤Δ, the rational Taylor isomorphism, the finite weighted-jet lattice detector, and the integral intersection criterion. Prove injectivity and obtain the ring equivalence with ArithmeticHabiroRing ℚ Δ. (GSWZ Proposition 5.3, p. 65, using §§5.1–5.2, pp. 59–65.) Needs: §§2.5–2.8 and HC.4. The generic integral Taylor injectivity and lattice theorem remain supplier results, rather than new targets here.

The coefficient localization occurs **before** taking the cyclotomic completion. Do not replace R[q]^ℕ by H_ℤ[1/Δ]. Infinite completion and localization need not commute. For Δ=2, the component indicator of odd orders belongs to H_(ℤ[1/2]) and is a nontrivial idempotent; H_ℤ[1/2] is a domain and has no such element. The ring operations commute with all Taylor and re-expansion maps. There is a polynomial ring map R[q] into this rational-field ring, unlike the arbitrary constant R map for a nonabelian coefficient field.

**Checks.**
- At Δ=1 this recovers the original integral Habiro ring, with ordinary Taylor re-expansion at every prime.
- At Δ=2 the odd-order indicator is nonzero, is not one, and is idempotent. It distinguishes completion after localization from localization after completion.
- The Kontsevich–Zagier family `Σ_(n≥0)(q;q)_n` has at order one the expansion `1−x+2x²−5x³+15x⁴−53x⁵+217x⁶+…`. Its order-two expansion starts `3+11x+72x²+…`, and its order-three and order-four constants are `5−ζ₃` and `8−3ζ₄`. These are compatible full-algebra Taylor values, not separately chosen analytic functions. (GSWZ Example 5.6, pp. 65–66.)

### 2.10 Components, idempotents and domain assertions

Define `orderComponent Δ m` by the relation generated by m∼pm for p∤Δ. Its invariant is the Δ-primary part `∏_(p|Δ)p^v_p(m)`, so the ring splits as a product of its supported component rings. Construct the orthogonal indicator idempotents, the restriction and extension-by-zero maps, and `habiro_componentProductEquiv`. If Δ>1 there are infinitely many possible component indices and the full ring has nontrivial idempotents. (GSWZ Remark 1.2, p. 7.) Needs: §2.4 and elementary prime factorization.

For the component of orders coprime to Δ prove injectivity of its Taylor map at order one, using the integral Taylor principle and linear disjointness forced by the coprime discriminants. It embeds in the domain R[[x]], so it is a domain. More generally, for the component with fixed Δ-primary part d, the sufficient hypothesis `K∩ℚ(ζ_d)=ℚ` gives a domain by the same full-algebra Taylor argument. Do not assert every order-component ring is a domain without this coefficient disjointness: internal idempotents may remain. (Correction to the unqualified domain wording of GSWZ Remark 1.2, p. 7; proof target using HC.4 and discriminant disjointness.)

**Checks.**
- For Δ=1 there is only one order component, so the component indicators give no new idempotents.
- For Δ=6, orders 5 and 35 belong to component 1, while 10 belongs to component 2 and 18 to component 18.
- K=ℚ(i), Δ=4, component d=4 has a nontrivial internal idempotent. At m=4m′ with m′ odd, use `(1−i^(m′)⊗ζ₄)/2`; coefficient Frobenius and the change m′→pm′ make these components glue. This disproves the unrestricted domain assertion even after fixing the order component.

### 2.11 Abelian coefficients and the scalar embedding

When K/ℚ is abelian, extend each unramified local φ_p to its global arithmetic Artin automorphism. For m>0 put `φ_m=∏_(p∤Δ)φ_p^v_p(m)`. Define the scalar embedding by `a↦(φ_m⁻¹(a))_m`, with the cyclotomic factor unchanged. The inverse is forced by the gluing direction: φ_m⁻¹(a)=φ_p φ_pm⁻¹(a). Prove `abelianScalarMap`, its injectivity and coefficient formulas, then prove the R-algebra equivalence
`H_(ℤ[1/Δ]) ⊗_ℤ R ≃ H_R`.
The tensor base is legitimate because both factors invert Δ. This is the Frobenius-twisted R-algebra structure, rather than the constant-family map. (GSWZ §1.4, footnote 1, p. 6, with the inverse required by (13), p. 7.) Needs: abelian Artin symbols, §2.9 and finite-free base change.

Prove `constantFamily_mem_iff` separately: the constant family of a∈R glues precisely when a∈ℤ[1/Δ]. The forward direction uses the fixed-field consequence of Chebotarev for all unramified Frobenius elements. For general K, do not assume global Frobenius automorphisms or a canonical R-algebra structure on H_R. The coefficient-family construction remains a ℤ[1/Δ]-algebra.

**Checks.**
- In K=ℚ(ζ₅), Δ divisible by 5, φ₂ sends ζ₅ to ζ₅². At component m=2 the scalar image of ζ₅ is ζ₅³; applying φ₂ gives ζ₅. The opposite exponent fails the gluing equation.
- K=ℚ(i), Δ=4, has a valid twisted scalar i although the constant i family fails at 3.
- K=ℚ gives the ordinary constant scalar map because every φ_m is the identity. K=ℚ(∛2) has no global Frobenius model for its nontrivial local quadratic factor.

### Examples

For K=ℚ(i), two different phenomena create idempotents: inverting 2 separates the 2-primary parts of orders, and the full coefficient algebra at order four already splits. They must both survive the construction. The formula in §2.10 supplies a coherent internal idempotent, so restricting to one order component does not automatically recover a domain. For K=ℚ(ζ₅), the exponent three at the order-two component is a direct witness to the inverse in the abelian scalar embedding. The p=11, m=5 local chart is the corresponding rank test against replacing a full cyclotomic algebra by one root field.

### Dependencies

This layer needs the generic re-expansion, completion, Chinese remainder and integral Taylor-lattice suppliers of HabiroCyclotomicCompletions, Mathlib's étale lifting, current Tau Ceti's local Frobenius, discriminant disjointness and abelian Artin symbols. Its arithmetic work is the unramified Frobenius of R̂_p, the prime-to-p local chart, the root-transition normalization, p-chain mixed-adic comparison, all-order local assembly, Frobenius untwisting, rational-field image criterion and coefficient-sensitive component structure. It does not depend on K₃ or a Chern normalization. Layer 3 uses its local product rings and full global coefficient families.

## Layer 3: local sections and global indexed lines

### 3.1 Corrected local sections and formal completion

Assume 6|Δ, p∤Δ and ξ∈K₃(K). For each m prime to p use the Kummer root line from §1.15. Define an `invertibleLocalSection p ξ` to be a family with shape

```text
f_m ∈ ε_m(ξ)^(1/m) ·
      (A_m(R̂_p)ˣ + x A_m(R̂_p) + x² A_m(K_p)[[x]])
```

and the following formal-completion condition. Put h_m=log(1+x/ζ_m) and `log f̂_m = D_p(ξ)/(m² h_m)+log f_m` in the appropriate Laurent-series coefficient line. Require
`φ_cycl(log f̂)(q^p) − p log f̂(q) ∈ ∏_(p∤m) (p/x) A_m(R̂_p)[[x]]`.
Here φ_cycl is the cyclotomic Frobenius of §2.2, including the map of the relevant root torsor. The formal log of the normalized nonconstant factor is defined after a torsor trivialization, and the constant log uses the fixed branch. The condition is invariant under permitted changes of representative and root, which must be proved as `localSection_changeTrivialization`. It allows a simple pole. (GSWZ Definition 1.3 and (21)–(22), p. 9; corrected integral linear shape (195), p. 41.) Needs: §1.15, §2.5 and PadicHodgeRegulators D.1, D.3 and D.4.

Define `LocalIndexedModule p ξ` as the LocalHabiroRing p-span of these sections in the product of rational coefficient lines. It includes zero and nonunit multiples; its elements need not themselves be invertible sections. Require `localSection_defect`, `localSection_mul`, `localSection_inv_ratio` at equal degree, `localIndexed_span`, and independence of all trivializations. The printed condition allowing every linear coefficient in K_p is too weak for the intended rank-one zero-class module: at m=1, `(1+x)^(1/p)` has constant one and zero Frobenius defect but linear coefficient 1/p. This roadmap uses the integral linear shape needed by Dwork's lemma.

**Checks.**
- ξ=0 and the constant family 1 satisfy the corrected shape and have zero defect.
- At m=1 the rational binomial series `(1+x)^(1/p)` fails the corrected condition because of its linear coefficient, even though its defect is zero. The example distinguishes shape from defect.
- The polar coefficient of the completed defect is `ζ_m(φ_R D_p(ξ)−p²D_p(ξ))/(p m²)`. If D_p(ξ)≠0, a finite-order unramified Frobenius cannot equal multiplication by p² on it. Replacing p/x by px would wrongly exclude the intended sections.
- Multiplying a section by p gives an element of its module whose leading coefficient is not a unit. Zero is another module element but is never an invertible section.
- At ξ=0,p=5,m=1, f=1+x/5 fails the defect condition as well: the logarithmic defect has coefficient 8/5 at x². The printed unrestricted rational linear shape therefore cannot replace either integrality of the first jet or the Frobenius test.

### 3.2 Dwork integrality with its linear hypothesis

Let S be a finite product of unramified integer rings over ℤ_p, complete and p-torsion-free, with its finite-order Frobenius; let m be prime to p. For `f∈1+x A_m(S[1/p])[[x]]`, prove `dwork_integral_iff`: f has integral coefficients if and only if its linear coefficient is integral and
`φ_cycl(f)((ζ_m+x)^p−ζ_m^p)/f(x)^p ∈ 1+px A_m(S)[[x]]`.
The substitution has zero constant and is an ordinary formal substitution. The induction solves the n-th coefficient for n>1 using a unit of the form `1−u p^(s(n−1))`, with u a root of unity and s a Frobenius period; n=1 is exactly the separate initial hypothesis. (GSWZ Lemma 3.4, pp. 39–40.) Needs: complete unramified coefficients and power-series operations.

Prove the exponential corollary in the scope actually used: p>2, g a family with `φ_cycl(g)(q^p)−pg(q)` in p times the integral power-series ring, small constant term giving exp(g(0))∈1+pS, and integral linear coefficient of exp(g). Then exp(g) is integral. One may derive the small constant condition from finite-order Frobenius when its hypotheses permit, or retain it explicitly. Neither convergence of exp on all of S nor the corresponding p=2 radius is assumed. (GSWZ Corollary 3.5, p. 40.)

**Checks.**
- f=1 is integral and has quotient one. The inverse of an integral unit series also meets the criterion.
- f=(1+x)^(1/p), m=1, has quotient one but nonintegral first coefficient. Deleting the linear premise makes the reverse implication false.
- Over a ramified integer ring, Frobenius need not be the specified finite-order unramified lift. Over an equal-characteristic ring p=0, inverting p does not give the stated fraction algebra. Both are outside this theorem.
- For p=2, ordinary exp of an arbitrary element of 2ℤ₂ need not converge with the required properties; the exponential corollary is stated only at p>2.

### 3.3 p-depleted polylogarithms and Pochhammer defects

For every integer s define `pDepletedPolylog s` by `Σ_(k≥1,p∤k)t^k/k^s`. Prove it belongs to the p-adic completion of ℤ[t,(1−t)⁻¹]. Finite residue-class sums modulo p^a give compatible rational functions; negative s causes no division problem. Require `pDepletedPolylog_coeff`, `pDepletedPolylog_frobenius_difference`, and specialization at a root ζ with 1−ζ a unit. (GSWZ Lemma 2.1 and (50)–(54), pp. 18–19.) Needs: p-adic completion and formal series; no transcendental analytic continuation is required for this integral assertion.

Use the two logarithmic expansions of the infinite Pochhammer symbol to prove `pochhammer_frobeniusDefect`: for q=1+x, the difference `log(t^p;q^p)_∞−p log(t;q)_∞` belongs to `(p/x)ℤ[t,(1−t)⁻¹]̂_p[[x]]`. At an admissible nontrivial prime-to-p root ζ its residue is `p Li₂^(p)(ζ)`. Prove the half-shift variation used in §3.4 separately, including the substitution of t and all constant terms. The membership theorem is not established merely by matching several initial coefficients. (GSWZ Proposition 2.2, p. 19, and Theorem 10, p. 42.) Needs: the logarithmic Pochhammer expansion of QSeriesPartitionsAndMockModularForms QM.0 and the completed coefficient intersection in that proposition.

**Checks.**
- At s=0, the series equals `t/(1−t)−t^p/(1−t^p)` and has exactly the coefficients indexed by integers prime to p.
- For s=2, the coefficients at t and t^p are respectively 1 and 0. A formula subtracting p²Li₂(t^p), rather than p⁻²Li₂(t^p), fails this test.
- ζ=1 is excluded from specialization because 1−ζ is not a unit. A primitive p-th root is also outside the unramified prime-to-p specialization used for local sections.
- The Pochhammer defect generally has a simple pole. Requiring an ordinary power series would lose its displayed residue.

### 3.4 Regularized half-shifted Pochhammer factors

For an allowed nontrivial root ζ in an unramified factor of K_p and m prime to p, define the formal local factor through the regularized asymptotic expansion

```text
Ψ_[ζ],p,m = ε_m([ζ])^(1/m) · U_(ζ,m),
U_(ζ,m) = exp(−Li₂(ζ)/(m²h))
          · (exp(mh/2)ζ; exp(mh))_∞^(1/m),
h = log(1+x/ζ_m).
```

The right side is interpreted through its Laurent logarithm after cancellation of the dilogarithmic pole, with constant term one. It is not an infinite product converging at a p-adic root of unity. The notation ε_m([ζ]) is used only within a valid completed-local-K₃ presentation supplied by D.3, or the associated factorwise torsor data; it does not declare every raw symbol [ζ] to be a global Bloch class. For `ξ̂=Σ a_ζ[ζ]` with finitely many a_ζ∈ℤ_p in that supplied presentation, set `Ψ_ξ̂,p=∏ Ψ_[ζ],p^a_ζ`, with powers of normalized factors defined as exp(a_ζ log U). (GSWZ Definition 3.9, (205)–(208), p. 42.) Needs: §3.3, the presentation contract and the all-order Chern torsors.

Require `normalizedPochhammer_constant`, `normalizedPochhammer_log`, `pochhammerSection_defect`, and `pochhammerSection_changePresentation`. The last gives equality of the resulting local line, or of generators modulo LocalHabiroRing units; it need not give literally equal sections. In addition to the higher Frobenius-defect estimate, the integral linear coefficient in the next subsection is required to prove the corrected section shape. These two ingredients, and the valid presentation of ξ̂, give `pochhammerSection_isLocalSection` for p>3 unramified. (GSWZ Theorem 10 and Corollary 3.10, pp. 42–43.) The short assertion of a half-shift variation in that theorem must be expanded into its explicit defect calculation.

**Checks.**
- The empty presentation gives U=1 and the zero-class local section, without a choice of a nontrivial root symbol.
- At m even the formal half power has constant one. Replacing it by q^(m/2) can give −1 at q=ζ_m and changes the factor being regularized.
- A relation between two valid D.3 presentations must produce a LocalHabiroRing unit ratio. An arbitrary collection of pre-Bloch symbols with nonzero boundary is not a presentation to which that theorem applies.

### 3.5 The half-shift coefficient and the integral first jet

For a characteristic-zero field define the light rational function
`halfShiftLinearCoeff z r = −z/(24r(1−z))`, used only with r≠0 and z≠1. Prove `halfShiftLinearCoeff_map`, `halfShiftLinearCoeff_scale` with value at ar divided by a for a≠0, and `halfShiftLinearCoeff_neg_one=1/(48r)`. This definition and its two sign-sensitive examples are in Suggested.lean. It is the coefficient of a normalized section, not the unnormalized Kummer-valued series. (Formal derivation from GSWZ (46)–(47), (60), pp. 18–19, and (207), p. 42.) Needs: rational algebra and the chosen half-power branch.

Prove `normalizedPochhammer_firstJet` from the Bernoulli-polynomial expansion:

```text
log U_(ζ,m) = Σ_(k≥2) B_k(1/2) m^(k−2) Li_(2−k)(ζ) h^(k−1)/k!,
U_(ζ,m) = 1 + halfShiftLinearCoeff(ζ,ζ_m) x + O(x²).
```

Here B₁(1/2)=0, B₂(1/2)=−1/12 and Li₀(ζ)=ζ/(1−ζ); the linear coefficient of h is 1/ζ_m. Thus for a valid finite integral presentation the normalized product has first coefficient
`−Σ a_ζ ζ/(24ζ_m(1−ζ))`.
At p>3 and ζ a nontrivial prime-to-p root this belongs to A_m(R̂_p), because 24, ζ_m and 1−ζ are units. Prove `pochhammerSection_integralLinearJet`, then combine it with the independent defect estimate to obtain the shape in §3.1. Higher coefficients need only be rational at this stage. This calculation closes the first-jet requirement; it does not prove a presentation theorem or all higher defects.

**Checks.**
- The values at (z,r)=(-1,1), (2,1), (-1,2), (-1,-1) are respectively 1/48, 1/12, 1/96 and −1/48. The first and last are proved in Lean and pin the half-shift sign and coordinate direction.
- At m=1 the root-coordinate denominator r is one; at m=2 it is −1. Forgetting the factor ζ_m reverses the order-two first jet.
- At p=2 or 3, 24 is not a unit, so the displayed formula does not supply the integral shape theorem. At ζ=1 the rational function has a pole and is outside its domain.
- Integral coefficients a_ζ are necessary. Dividing a nonzero coefficient by p can destroy the integral first jet even when every root denominator is a unit.

### 3.6 Local rank-one freeness

For p∤Δ and every ξ∈K₃(K), prove existence of an invertibleLocalSection using §§3.3–3.5 and the supplied completed K₃ presentation. If s and t are two such sections, their completed poles cancel in s/t, and their equal-degree root torsors cancel. Apply the corrected Dwork criterion to the quotient and its inverse: their first coefficients are integral by the shape condition, their leading coefficients are units, and the unramified constant term is treated using the fixed log/Teichmüller decomposition. Conclude that s/t is a unit of LocalHabiroRing p. Hence multiplication by any chosen section gives `localIndexed_freeRankOne : LocalHabiroRing p ≃ₗ LocalIndexedModule p ξ`. (GSWZ Theorem 1, p. 9, and its proof, pp. 42–43.) Needs: §3.2, the Chern torsors and Coleman presentation and regulator comparison.

Require `localIndexed_generator`, `localIndexed_generator_ratio_unit`, `localIndexed_zero_degree` and `localIndexed_mul`. Tensor multiplication is an isomorphism locally after choosing generators, with independence from their unit rescalings. This local theorem is a prerequisite of global descent, not a proof that an intersection of these modules is projective or finitely generated.

**Checks.**
- In degree zero, choosing the section 1 identifies the local module with the local product ring.
- Replacing a chosen generator s by a unit multiple changes the displayed trivialization but not the local module.
- The element ps is in the module and need not generate it, since p is not a unit. The statement applies to invertible sections, not all nonzero module elements.

### 3.7 Extending local sections to all orders

Prove the all-root extension theorem at p≥5: a corrected prime-to-p invertible section has a unique compatible full-order extension after the required Kummer phase normalization, satisfying the Frobenius-defect and integrality conditions. In the proof, the phase cocycle on ℤ_pˣ satisfies
`α_(σσ′)=σ′α_σ+σ⁻¹α_σ′`.
Choose ω with ω−ω⁻¹ a unit; then `α_σ=(σ−σ⁻¹)α_ω/(ω−ω⁻¹)` and the corresponding β_m fixes the phase on each p-chain. Prove the cocycle law, continuity, uniqueness of normalization and invariance under local generator rescaling. The formal transformations q↦q^σ use the local root action and the constant-one binomial series. (GSWZ Lemma 3.6, Corollary 3.7 and (195)–(204), pp. 41–42.) Needs: corrected Dwork integrality, §2.3 and coherent torsor transitions.

**Checks.**
- At p≥5 one may use the residue class of 2: 2−2⁻¹=3/2 is a unit. The required denominator is therefore invertible.
- At p=3 every unit has square one modulo 3; at p=2 the same obstruction occurs. No ω−ω⁻¹ unit exists there, which explains the restriction 6|Δ.
- A zero phase cocycle gives β_m=0. Altering a phase before normalization must not create a different full-order line.

### 3.8 Global indexed families and their scalar action

For ξ∈K₃(K), first define `GlobalIndexedFamily ξ` as a subset of the product of the rational root-line power series at all m>0. Require that, for each p∤Δ, its prime-to-p restriction belongs to LocalIndexedModule p ξ. Also require for every positive integer γ that
`f(q^γ)^γ f(q⁻¹) ∈ H_(R[1/γ])|γ`,
where orders are restricted to gcd(m,γ)=1 and the coefficient localization inverts γ. The root-line product uses the coherent equivariance from §1.15; equalities of power classes are not alone a canonical definition of this expression. Require `globalIndexed_mem_iff`, `globalIndexed_local`, `globalIndexed_gluing`, `globalIndexed_ext` and closure under multiplication by H_R. (GSWZ Definition 1.4, p. 10.) Needs: §§3.1, 3.7 and arithmetic gluing.

The defining global expression is nonlinear in f. Addition of two families satisfying it is a theorem requiring a linear descent description, not a pointwise consequence of the displayed condition. At this stage the target is a subset with specified operations that have been justified; the `H_R`-module structure is constructed in §3.10. Tensor statements use that module only afterward. Similarly, a line torsor at each m is not enough to define compatible substitutions until its equivariance and composition laws have been constructed.

**Checks.**
- f=0 satisfies the local module and gluing conditions; no requirement that every leading coefficient be nonzero belongs in this global definition.
- At γ=1 the gluing expression is f(q)f(q⁻¹), in degree zero. It is not a Frobenius equation with γ inverted in K₃.
- At γ divisible by m, that m-component is absent from the restricted condition. An order map at such m need not be a cyclotomic automorphism.
- Given f and g, the expansion of `(f+g)(q^γ)^γ(f+g)(q⁻¹)` contains mixed terms. Closure of the pure expressions for f and g is not an addition proof.
- In degree zero, f=1−q and γ=2 give `(1−q²)²(1−q⁻¹)`, a Laurent polynomial in the required ring over ℤ[1/2]. The expression is a product; the coefficient operation is localization R[1/2], not the quotient R/2R.

### 3.9 The ring case and graded multiplication

Prove `globalIndexed_zero`: the subset in degree zero is exactly H_R. In one direction the section 1 and scalar multiplication give the local condition. In the other, use all-root extension, the global γ conditions, and the coefficient intersection to recover every arithmetic Frobenius-gluing equation. It is necessary to explain how the prime-to-p local restrictions determine the p-divisible orders; looking only at integral prime-to-p components does not do so. (GSWZ Theorem 2 and proof in §3.3, pp. 10 and 43.) Needs: §§2.4–2.5, §3.7 and the actual torsor-free degree-zero identifications.

For f of degree ξ and g of degree η, componentwise multiplication has degree ξ+η, with local section products and multiplicative gluing. Prove `globalIndexed_mul_mem`, zero-degree unit laws, associativity and commutativity with the named root-line identifications. After §3.10 supplies addition and scalar structure, upgrade this to an H_R-bilinear multiplication and a graded commutative algebra. Membership and bilinearity do not yet show tensor multiplication is bijective. (GSWZ Theorem 2, pp. 10–11; additive construction and tensor bijectivity are separate targets below.)

**Checks.**
- At ξ=η=0 the multiplication agrees with the subring multiplication of H_R, including idempotents in different order components.
- Multiplying a zero family by any family gives zero. A construction defined only on local generators would miss these module elements.
- Degrees ξ and −ξ produce degree zero; their product may vanish on a component and need not be a global unit.

### 3.10 Effective global descent

Prove `indexedLine_effectiveDescent` for every K, Δ and ξ under the standing hypotheses. Construct a **linear** descent datum for the rational root lines and the local free modules on the arithmetic Taylor charts, with coherent transition maps. Identify its equalizer with the subset of §3.8, including both implications between the linear conditions and the nonlinear γ conditions. Prove that the resulting module M_ξ is finitely presented, projective and of rank one, that its actual tensor base changes recover the local free modules and the rational root-line charts, and that these base changes jointly detect an isomorphism between the modules and tensor products used here. Exactness or conservativity must be proved for these charts; a symbol suggesting a completed tensor product does not supply it. (Required descent expansion of GSWZ Definition 1.4 and Theorem 2, pp. 10–11; §3.3, p. 43, proves multiplicative compatibility but does not supply this full descent argument.) Needs: §§1.15, 2.4–2.5 and 3.6–3.9.

The intended API is `indexedLine_module`, `indexedLine_mem_iff`, `indexedLine_finitePresentation`, `indexedLine_projective`, `indexedLine_rankOne`, `indexedLine_localBaseChange`, `indexedLine_rationalBaseChange` and `indexedLine_detectIso`. This is an explicit missing proof: local rank one does not make an arbitrary intersection finite or projective, and multiplicative closure does not prove addition. One possible route is an effective descent theorem for the relevant arithmetic Habiro charts; another is a direct finite presentation with exact local comparison. Either must prove the displayed subset is the descended module. No global generator is part of the target.

**Checks.**
- In degree zero the descent datum must give the ring module H_R and its actual local comparison maps, not merely an abstract isomorphic set.
- A product of infinitely many local free rank-one modules has many possible integral intersections; freeness of the factors alone gives no finite generating family for an arbitrary intersection. Any proof using only local ranks has omitted the target's finiteness step.
- On the nontrivial idempotent decomposition of H_R, rank one means rank one on every component. A module supported on a proper subset of components fails this condition despite being locally generated wherever it is nonzero.

### 3.11 Tensor equivalences and the Picard character

After effective descent, prove that the H_R-linear multiplication
`indexedLine_tensor : M_ξ ⊗_(H_R) M_η → M_(ξ+η)`
is an isomorphism. The proof becomes an isomorphism after each named local and rational base change, so §3.10's detection theorem applies. Construct its inverse abstractly by descent or projectivity. For η=−ξ, an inverse of 1 is a **finite sum** `Σ f_i⊗g_i` with `Σ f_i g_i=1`; a single global generator is not required and may not exist. Prove natural associativity, commutativity, unit and inverse coherence, then powers with exponent zero and negative exponents using the dual line. (GSWZ Theorem 2, pp. 10–11; tensor-bijectivity proof supplied by the effective-descent target, not by multiplicativity alone.) Needs: §§3.9–3.10.

Define `k3PicardMap : K₃(K) →+ Additive(Pic H_R)` by ξ↦[M_ξ]. Use the existing Picard API rather than redefining invertible modules or line-bundle equivalence. Prove `k3PicardMap_zero`, `k3PicardMap_add`, `k3PicardMap_neg`, the n-fold tensor-power formula, and invariance under changing generators and torsor representatives. The stronger object-level graded family includes the actual tensor equivalences, not just this map of isomorphism classes. (GSWZ (25)–(26), pp. 10–11.)

**Checks.**
- M₀⊗M_ξ→M_ξ agrees with scalar multiplication, and the zeroth tensor power is H_R.
- M_ξ⊗M_(−ξ)≃H_R yields invertibility. It does not yield a chosen isomorphism M_ξ≃H_R.
- A finite sum mapping to 1 is a sufficient inverse witness; insisting on one pair f,g with fg=1 would assert global freeness and is not this theorem.
- Changing a local generator by a unit must leave its Picard class unchanged, while retaining the induced transition rescaling in the object-level family.
- The tensor square has Picard class [M_(2ξ)] and the zeroth power has the identity class. If [M_ξ] is nontrivial, the character value is nonzero; the character is not defined to be zero on every degree merely because all its localizations are free.

### 3.12 Power substitution and involution

For every nonzero integer γ define `powerSubstitution γ` on full rational Taylor families by q↦q^γ. At an order m prime to γ, the root map is ζ_m↦ζ_m^γ and the power-series substitution has zero constant after subtracting that root; for negative γ use the formal inverse of the unit ζ_m+x and its binomial expansion. When gcd(m,γ)>1, the target root has smaller order; spell out the coefficient algebra map and the order change rather than using an alleged automorphism σ_γ. Prove identity, composition and compatibility with products and coefficient maps. (GSWZ Proposition 1.5(c), p. 11, and proof, p. 45.) Needs: Layer 2's order maps and ordinary zero-constant substitution.

Set `habiroInvolution = powerSubstitution (−1)`. Prove that it carries M_ξ to M_(−ξ), is involutive, and respects scalars through the corresponding ring involution. For γ>0, prove `(γ*f)^γ ∈ M_ξ` over R[1/γ] restricted away from γ. No object `M_(ξ/γ)` is asserted unless an actual divided K₃ class has independently been supplied. (GSWZ Proposition 1.5(a),(d), pp. 11 and 45.) Needs: coherent Chern torsor equivariance, cancellation of completed poles and global descent.

**Checks.**
- At q=ζ+x, inversion has constant ζ⁻¹ and linear term −ζ⁻²x. This pins the substitution direction.
- Applying inversion twice restores the family and its degree; a coefficient-only complex conjugation is not this operation.
- γ=2 at m=2 maps to order one, so σ₂ is not an automorphism of the order-two root algebra. At odd m the same γ acts by the stated root automorphism.
- γ=0 is excluded: q⁰=1 would require evaluating arbitrary rational root expansions away from their formal center.
- For f=1−q and γ=2, the order-one component is −2x−x² and the order-three component is `1−ζ₃²−2ζ₃x−x²`. At order one τ of the Kontsevich–Zagier family is f₁(−x/(1+x)), fixing both the sign and the nonlinear coordinate change.

### 3.13 Pairing and proportionality

For f,g∈M_ξ prove `indexedLine_involutionPairing : f·τg∈H_R`. Define `a=g·τg` and `b=f·τg`; commutativity gives af=bg. This is the proportionality statement of the source and is valid even when a and b vanish on some components. It is not a claim that any two sections differ by a global scalar or that a,b can always be chosen nonzero in a ring with zero divisors. After tensor descent identify the pairing with the degree ξ,−ξ tensor map and state its H_R-semilinearity through τ. (GSWZ Proposition 1.5(b), pp. 11 and 45.) Needs: §§3.11–3.12.

**Checks.**
- With f=g, the stated choices have a=b=gτg and the equality is immediate without dividing by g.
- With g=0, both coefficients can be zero; the theorem still holds. An unconditional nonzero-proportionality assertion would fail at this boundary.
- In degree zero use two orthogonal component idempotents f,g. Then fτg can vanish; no global quotient f/g is defined.

### 3.14 Vanishing and integral constant terms

Prove `indexedLine_vanishing_propagates`: if f_m=0 for a global indexed section and p∤Δ, then f_pm=0. Use the all-root extension and its compatibility with the global γ conditions. The statement concerns a full component series, not only its constant term. No propagation across a prime inverted in R is asserted. (GSWZ Proposition 1.5(e), pp. 11 and 45.) Needs: §§3.7–3.10 and arithmetic re-expansion.

For gcd(m,Δ)=1 prove `indexedLine_constant_integral`: the constant f_m(0) lies in the integral associated root line over A_m(R), written after a representative choice as `R[ζ_m,ε_m^(1/m)]` in the source. Establish compatibility with all local completions and use the coefficient intersection. In general it is an element of a root line, not an element of R or even of A_m(R) before trivialization. Orders sharing Δ are excluded from this integral conclusion. Require zero, sum, scalar and tensor compatibility of the evaluation maps after descent. (GSWZ Proposition 1.5(f), pp. 11 and 45.)

**Checks.**
- In degree zero, the constant-term map agrees with the ordinary Habiro Taylor evaluation of Layer 2.
- The order-component indicator can vanish on the prime-to-Δ component and be nonzero on another component. No propagation across an inverted prime is possible.
- A zero constant with a nonzero linear coefficient does not trigger the full-series vanishing theorem.
- A nontrivial Kummer root need not belong to K(ζ_m). Evaluating into that field without its associated line loses the declared coefficient type.

### 3.15 Invertibility, freeness and multiplication by a section

State separately the local free-rank-one theorem and the global invertibility theorem. The latter is conditional on effective descent and tensor bijectivity. Do not infer a global generator from the former. In particular multiplication by an arbitrary section, even in degree zero, need not be an isomorphism. For an abelian K with a specified invariant root-symbol presentation, the candidate product of half-shifted Pochhammer factors may suggest a generator, but proving its global integrality, gluing and inverse transition is a separate theorem; no universal freeness assertion for abelian K is used here. (GSWZ discussion following Theorem 2, p. 11, and Corollary 3.10, p. 43; general distinction is the existing Picard-group formalism.) Needs: §§3.6, 3.10–3.11.

**Checks.**
- In the integral rational Habiro ring, multiplication by 1−q is injective by the domain theorem and is not onto: evaluation at q=1 prevents 1 from being divisible by 1−q.
- Multiplication by zero is never an isomorphism of the nonzero degree-zero ring module.
- A unit section gives an isomorphism in degree zero. A nonunit generator candidate requires an actual inverse or a line equivalence, not just a nonzero first coefficient.

### 3.16 Field pullback and scalar equivalence

Let ι:F→E be a number-field embedding. Choose one positive Δ divisible by 6 and both discriminants, and put R=O_F[1/Δ], S=O_E[1/Δ]. On full coefficient algebras use `A_m(R)→A_m(S)` fixing the abstract ζ_m. Prove the Habiro ring map `habiroFieldMap`, since the unramified Frobenius (`unramifiedFrobenius_fieldMap`), all re-expansions and local products commute with coefficient base change. Using naturality of c_fixed and D_p and coherent maps of the root torsors, construct `indexedLine_fieldMap : M_ξ→M_(res ξ)` semilinear over that ring map. Prove membership before asserting linearity; after effective descent prove zero, addition and scalar compatibility. Require identity, composition, tensor multiplication and evaluation compatibility. (Functorial extension of GSWZ Definitions 1.1, 1.3–1.4, pp. 6–10; Chern and regulator naturality are supplier contracts, not a theorem printed there.) Needs: §§1.15, 2.3–2.5 and 3.10.

Prove the stronger `indexedLine_scalarEquiv` only after actual base-change descent: the natural map
`H_S ⊗_(H_R) M_ξ ≃ M_(res ξ)`
is an isomorphism. Identify each local and rational base change and apply the conservative comparison theorem. It is not `S⊗_R M_ξ`: there is no canonical R-algebra structure on H_R for a general field. This scalar equivalence has identity and tower coherence and intertwines tensor multiplication. Its proof requires the named Chern torsor and Coleman naturality diagrams; ordinary equality of regulator values after extension is not enough to construct the line map.

**Checks.**
- The identity embedding gives the identity on families and the usual `H_R⊗_(H_R)M≃M` equivalence.
- For ℚ→ℚ(i) at p=5, the coefficient completion map is diagonal ℤ₅→ℤ₅×ℤ₅. Pullback retains both factors rather than selecting a prime.
- Two composable embeddings must give literally the same abstract cyclotomic-root map. Arbitrarily choosing roots in their field composita would violate this test.
- Enlarging Δ on both fields changes the allowed edge set and has its own localization map; it is not justified by a scalar structure that the nonabelian ring does not have.
- In degree zero pullback is the coefficient ring map and sends one to one. Its scalar equivalence is the usual `H_S⊗_(H_R)H_R≃H_S`; this fixes the tensor base before treating a nonzero degree.

### 3.17 Coefficient Galois action

For σ∈Aut_ℚ(F) and fixed Δ, apply σ to the F coefficient factor, fixing abstract ζ_m and the variable q. This permutes the full local factors and sends the Chern torsor of ξ to that of σ_*ξ. Prove `indexedLine_galois : M_ξ→M_(σ_*ξ)` semilinear over `habiroFieldMap σ`. Identity and composition give an action on the entire K₃-graded family, compatible with scalar multiplication, tensors, power substitution and evaluation. It restricts to a single degree only when σ_*ξ=ξ with the specified identification. (Functorial consequence of §3.16; intended extension of the coefficient-natural construction in GSWZ §§1.4–1.5, pp. 6–11.) Needs: field pullback and descent coherence.

**Checks.**
- For F=ℚ(i), complex conjugation sends i to −i but fixes abstract ζ₄ in A₄(F). This is distinct from τ, which changes q and the cyclotomic root coordinate.
- At a split prime, σ may permute factors of F⊗ℚ_p. An action on only one chosen local field is not the stated coefficient action.
- If σ_*ξ≠ξ, the target degree changes. A claimed action on M_ξ alone has the wrong type.
- Over ℚ(i), applying coefficient conjugation twice is the identity on every family and every degree. This checks composition while retaining abstract ζ_m fixed in each application.

### 3.18 Determinant norms and Frobenius defects

For F⊂E and common Δ as in §3.16, use the finite-free algebra A_m(Ŝ_p) over A_m(R̂_p) of rank [E:F], retaining every factor. Define `localSectionNorm` as the determinant norm of multiplication by the **whole** power series in the extended root-line setting. For normalized units prove `log Norm(u)=Trace log(u)`, and prove compatibility of norm and trace with coefficient Frobenius, zero-constant substitution and convergent re-expansion. The first coefficient is the trace of the first coefficient. The trace of integral coefficients is integral and sends `(p/x)A_m(Ŝ_p)[[x]]` into `(p/x)A_m(R̂_p)[[x]]`. These facts give the norm version of the corrected local shape and defect. (Finite-free determinant and trace identities applied to GSWZ (21)–(22), p. 9; this functorial norm is an additional target.) Needs: finite-free algebra norms and §3.2.

To identify its degree with transfer require the exact inputs
`D_p(tr ξ)=Tr_(E_p/F_p)D_p(ξ)` and
`ε_m(tr ξ)=Norm ε_m(ξ)`
as coherent **torsor** identities. The first is from PadicHodgeRegulators D.4; the second follows from the early Chern corestriction and Kummer norm diagram, with the chosen finite-Chern sign. Construct these diagrams at full cyclotomic-algebra level. A degree-of-extension power on a restriction class is not a replacement for the general transfer compatibility.

**Checks.**
- For a split quadratic algebra and a family `(1+ax,1+bx)`, the norm is `1+(a+b)x+abx²`. Taking coefficientwise norms would give a different answer.
- Norm of a scalar from the base is its [E:F]-th power; trace of that scalar is [E:F] times it. Confusing these operations reverses the completed-log calculation.
- The rank remains [E:F] even when the algebra splits into many local factors. A selected factor has the wrong determinant degree.
- At ξ=0 the polar regulator terms vanish and the claim reduces to the integral norm of a local Habiro unit.

### 3.19 Multiplicative transfer of global sections

Using §3.18 define `indexedLine_transferNorm : M_ξ(E)→M_(tr ξ)(F)` by determinant norms on every full rational Taylor algebra and on its associated root line. Prove that the local section-module condition and every global γ gluing expression descend under norm, with the prescribed torsor identifications. Effective descent then identifies the resulting family as a section of the target line. Establish `transferNorm_one`, `transferNorm_zero`, `transferNorm_mul`, the tower law, compatibility with evaluation and with τ, and `transferNorm_restrict f = f^[E:F]` for a base-field section pulled to E. (New functorial consequence of the transfer-compatible Chern and Coleman inputs and the global definition; GSWZ Definition 1.4, p. 10, supplies the membership conditions but does not assert this transfer theorem.) Needs: §§3.10, 3.16 and 3.18.

This is a multiplicative map of sections, not an additive transfer of modules. No norm homomorphism on Pic(H_S) is inferred unless a separate finite-flat theorem for H_R→H_S and its line-bundle norm has been proved. The determinant construction here uses the finite-free **coefficient** algebras, whose ranks and trace maps are specified, and lands in the degree transferred in K₃.

**Checks.**
- For E=F the norm is the identity. In a tower E′/E/F, the determinant norm agrees with the composite norm, and the transferred K₃ degree follows the same tower.
- A quadratic norm of 1+1 is 4, whereas Norm(1)+Norm(1)=2. No additive-map declaration can encode this operation.
- Norm(0)=0 for positive extension degree and Norm(1)=1. These tests include sections outside the local invertible-generator locus.
- Pulling a base section to E and taking its norm yields its [E:F]-th power in degree [E:F]ξ, as required by the K-theory projection formula.

### Examples

The zero-class binomial `(1+x)^(1/p)` is the decisive local negative control: its defect vanishes but it cannot belong to the intended integral zero-class line. The half-shift coefficient supplies precisely the missing first jet for the explicit Pochhammer generators. At p=2 or 3 both the unit denominator 24 and the phase-normalization denominator fail, so inverting 6 is used twice for distinct reasons. On the global ring, multiplication by 1−q distinguishes a nonzero section from a generator. In a split quadratic coefficient algebra, the x² term ab of the determinant norm distinguishes a norm of a series from a series of coefficientwise norms.

### Dependencies

The local construction needs the all-order Chern torsors, coherent order and root changes, the corrected shape, PadicHodgeRegulators D.1, D.3 and D.4 and the half-shift defect estimate. Effective descent is a required global theorem before any projective-rank-one, tensor or Picard conclusion. Pullback and norm need explicit naturality and corestriction diagrams in addition to the local generators; their proofs have been separated so that a local free-rank-one theorem cannot silently stand for global finite presentation or for functorial descent.

## Downstream consumers

HabiroNahmSeries uses the finite regulator, its conditional calibration interface, the arithmetic Habiro ring and the indexed lines to formulate where perturbative Nahm series live. Its eta-regulator evaluation can then close the numerical comparison without entering the construction of R. HabiroRings compares its relative Habiro ring for R=O_K[1/Δ] with the arithmetic ring of Layer 2 and transports the indexed lines of Layer 3 to its Habiro–Hodge coefficients. It also generalizes `unramifiedFrobenius` and `primeToPLocalChart` to étale algebras over perfectly covered Λ-rings. Their base-ℤ cases are owned here, so no dependency runs from this roadmap to the relative construction. ArithmeticQuantumTopology uses the Frobenius coefficient rings and the K₃-indexed modules. Its applications to quantum invariants can use tensor products and transfer only after the named descent and naturality targets have been proved. K3BlochGroups uses the étale Bloch group of §1.6, the excluded integer of §0.2 and the comparison R_ζ=c_fixed,ζ^γ of §1.13 only in the genuine finite-coefficient comparison that ends its V.6. None of the K3BlochGroups results imported here depends on that comparison.

The finite Chern sign comparison, the early finite-Chern supplier prefix, the precise Keune quotient comparison, coherent all-order root torsors, the half-shift higher-defect proof, and effective global descent are explicit mathematical obligations in this build. At noncoprime orders the powered regulator has only a lift-set specification with its stated ambiguity, and is not an input to the lines. The first-jet calculation does not substitute for any of these compatibility proofs. A formalization can complete the elementary finite identities and arithmetic ring independently while these targets are addressed.

## References

- F. Calegari, S. Garoufalidis and D. Zagier, *Bloch groups, algebraic K-theory, units, and Nahm's conjecture*, Ann. Sci. Éc. Norm. Supér. 56 (2023), 383–426. The [author-hosted published text](https://math.uchicago.edu/~fcale/papers/CGZ.pdf) fixes the published Bloch convention and introductory theorem statements. Detailed locators marked “v3” refer instead to [arXiv:1712.04887v3](https://arxiv.org/abs/1712.04887v3), 2021, §§2–5, pp. 7–30, and Theorem 7.4, pp. 37–39. These versions use different Bloch presentations, which are compared through K3BlochGroups rather than identified integrally.
- K. Belabas and H. Gangl, *Generators and relations for K₂O_F, F imaginary quadratic*, [author-hosted text](https://www.maths.dur.ac.uk/users/herbert.gangl/K2.pdf), §7, p. 24. The discriminant −4 entry supplies the numerical tame-kernel check in §0.2.
- S. Garoufalidis, P. Scholze, C. Wheeler and D. Zagier, *The Habiro ring of a number field*, [arXiv:2412.04241v2](https://arxiv.org/abs/2412.04241v2), 2025. Page references are the printed pages of this 73-page version: definitions in §§1.3–1.5, pp. 5–11; Pochhammer formulas in §2.1, pp. 18–19; local regulators and sections in §§3.1–3.3, pp. 37–45; arithmetic Taylor lattices in §§5.1–5.2, pp. 59–65.
- K. Hutchinson, *The Chern class for K₃ and the cyclic quantum dilogarithm*, J. Algebra 649 (2024), 433–443. Locators here use the accessible [arXiv:2104.14413v4](https://arxiv.org/abs/2104.14413v4), 2024, §§2–4, pp. 2–8. The finite product sign and the tensor identification must be compared as specified in §1.10.
- K. Hutchinson, *A Bloch–Wigner complex for SL₂*, [arXiv:1107.0264v2](https://arxiv.org/abs/1107.0264v2), 2013. The configuration comparison and finite cyclic specialization used here are in §§6.2–6.4, pp. 31–33; generic constructions are supplied by K3BlochGroups.
- S. Garoufalidis and D. Zagier, *Asymptotics of Nahm sums at roots of unity*, Ramanujan J. 55 (2021), 219–238, [author-hosted article](https://people.mpim-bonn.mpg.de/stavros/publications/printed/asymptotics_of_nahm_sums_at_roots_of_unity.pdf). Appendix A, Proposition 8.1 and (55)–(60), pp. 235–237, provide the KMS proof route. The uniform tails, Gaussian scaling and phase targets are stated explicitly rather than inferred from its abbreviated asymptotic argument.
- F. Wagner, *q-Hodge filtrations, Habiro cohomology, and ku*, [author-hosted thesis](https://ferdinand-wagner.github.io/papers/q-Thesis.pdf), §2.2, item 2.7, p. 29, item 2.11 and Lemma 2.12, pp. 31–32. These supply the relative Frobenius lift and compatible-root and re-expansion descriptions; the local-chart comparison here retains the full cyclotomic algebra and does not assume Φ_m irreducible modulo p.
- F. Wagner, *q-Hodge complexes over the Habiro ring* (cited as Q), [arXiv:2510.04782v2](https://arxiv.org/abs/2510.04782v2), 2025, §2.2, item 2.7, p. 15, and Lemma 2.12 with its proof, p. 18. This is the article version of the thesis results used in §2.6, with the same irreducibility claim corrected there.
