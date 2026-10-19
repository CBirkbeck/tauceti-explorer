# PKG-HabiroNumberFields~codex — completed package

Agent: Codex (GPT-6), session codex-FMv31p, 19 October 2026. Refs #10747.
The claim was confirmed by the bot in issue comment 6272518409. This run takes one job only.

The package contains a complete four-layer README, a compact representative Suggested.lean and math.NT metadata. All 94 accepted input targets are accounted for below, including the 27 arithmetic, analytic, Taylor and descent refinements. The README preserves hypotheses, APIs, checks and examples in its own mathematical organization. It contains no source extracts or packet identifiers. This is a package submission, not a claim that the mathematical targets have been formalized or that the outstanding source arguments are already complete.

## Mathematical boundaries and unresolved proofs

The README turns each missing bridge into a named target or an exact supplier contract. The following need particular attention in the independent package review and eventual formalization:

1. **Powered regulator ambiguity (§1.5).** The unrestricted unique-lift wording of CGZ v3 Proposition 2.5(b) fails when F contains μ_n: take F=ℚ(ζ₃), n=3, ξ=0. G is trivial and both 1 and [2] in Fˣ/(Fˣ)³ map to 1 in the universal Kummer extension. The valuation of 2 at its prime is one, so [2] is nontrivial. The package keeps unique R only under gcd(n,w_F)=1 and replaces the noncoprime extension by the set of powered lifts, its nonemptiness target and its kernel ambiguity. It does not export a single-valued noncoprime powered regulator. This additional counterexample arose in the package audit; it does not alter any input packet.
2. **Finite Chern normalization (§1.10).** The negative Soulé product with the positive Kummer/Bott conventions yields c_raw(eta)=[ζ⁻¹]; c_plus is defined independently as its negative. Hutchinson's tensor identification must be checked in a complete diagram before identifying c_fixed with either convention. The numerical exponent ±2 remains conditional on that comparison and the separately owned Nahm eta-regulator value. Squaring does not erase the sign.
3. **Early finite Chern and Keune suppliers (§§0.3–0.7).** MotivicCohomologyAndRegulators must provide a finite-Chern prefix independent of analytic regulators. ArithmeticKTheory N.6 must prove the precise Keune injection from twisted coinvariants of Pic/n, with the stated unramified odd-prime hypotheses. The quoted CGZ application is not a replacement for the original injection. The package supplies the finite endomorphism, cyclic-generator, exact eigenlift and valuation-image steps needed after that injection.
4. **Analytic KMS proof (§1.3).** Uniform two-sided tails, the Gaussian factor √(2π/n), eta phase and integral descent remain actual targets. The admissible center has (X,Y,Z)=(1/5,2,−4/5), S=4/9. Neither an isolated residue-class asymptotic nor a complex embedding of an arbitrary field discharges the general field theorem.
5. **All-order torsor coherence (§1.15).** Equality of Chern power classes is not yet a coherent family of root lines and substitution maps. Root, order, field and tensor identifications and their composition laws are required, including even orders and roots already in K.
6. **Local presentations and higher defects (§§3.3–3.6).** ColemanPolylogarithms D.3–D.4 supplies the completed-local-K₃ presentation and regulator; arbitrary pre-Bloch [ζ] are not global classes. The first-jet calculation is explicit and gives the corrected integral linear shape for p>3; it does not prove presentation independence or the full higher-defect estimate. The constant-one half branch is retained at even m.
7. **Global descent and functoriality (§§3.10–3.19).** Local free rank one does not prove addition of the nonlinear global subset, finite presentation, projectivity, actual tensor base change or tensor bijectivity. The required linear descent description and conservative charts are stated before Picard and scalar-equivalence targets. Norms require Chern corestriction and Coleman trace diagrams on full coefficient algebras, and are multiplicative section maps. No finite-flat theorem for H_R→H_S or induced Picard norm is claimed without a separate proof.

The generic p-adic completion is also not silently identified with the local product of Taylor rings (§2.5). The package states exactly which local product and untwisted all-order rings are compared; an ordinary-completion/base-change identification would require its own theorem.

The final boundary audit also distinguishes ordinary coefficient completion from tensoring: R̂_p means lim_a R/p^aR. It agrees with R⊗ℤ_p only for p∤Δ. For R=ℤ[1/6] at p=3, the completion is zero but the tensor product is ℚ₃. This corrects the convention without changing any good-prime section construction. The Bloch supplier diagram explicitly assumes at least four field elements; its two correction groups are killed by two, and the F₁₁ computation agrees with the published-versus-older comparison.

## Ownership, order and duplication audit

Read the binding WORKERS, PROTOCOL, expansion protocol, PACKAGE_REVIEW, UPSTREAM_GUIDE and exemplar. Read current ArithmeticDirichletSeries and OperatorTheory/OrthogonalGeometry as shape references, and the HodgeStructures snapshot. Read the entire assembled HabiroNumberFields reader and query all five packets, their API/tests, requests and gaps; reviewed library coverage entries for all four stages and AUDIT-28 were checked.

The Caraiani–Newton order file explicitly leaves Habiro and these K-theory/regulator directions among its excluded strays; it assigns no CN tier or bundle to HabiroNumberFields. No artificial tier was assigned, and no upward CN dependency is claimed to be allowed. Supplier chains are stated by their mathematical layers. No notion was moved out of a genuinely higher CN tier. The early finite-Chern prefix is a required reordering inside its owner, not a new analytic-regulator dependency. Nahm eta evaluation stays downstream, consumed only as the premise of a conditional numerical comparison. HC owns generic completion/re-expansion/integral Taylor detection; HR owns relative Frobenius and the full chart; this package owns their arithmetic p-chain and all-order assembly.

Current read-only checkouts inspected: TauCetiRoadmap 0d144d044dacebca17b654695b6f1ad58f159b27; current Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 (current Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a). The pinned build uses Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. No Lake command was run in the read-only checkout and no build/cache project was created.

Searches covered every current roadmap including Completed and the nine newer directions, current Tau Ceti, and pinned Mathlib. Object searches included cyclotomic completions, cyclic/quantum dilogarithms, finite Chern classes, K₃/Bloch presentations, root actions, joint eigenspaces, inner/central cohomology actions, Kummer/SELmer groups, Picard tensor classes, local Frobenius, norms and traces. Broad substring hits were followed by the relevant statements, not treated as absence evidence. The following duplications were avoided:

| Input material | Existing owner used | Package decision |
| --- | --- | --- |
| Root-exponent character and power-class carriers | Mathlib IsPrimitiveRoot.autToPow, autToPow_spec, modularCyclotomicCharacter; Tau Ceti powerClassQuotient/powerClassHom | Cite contracts; no parallel definitions. |
| Generic simultaneous eigenspaces and Fourier projectors | Current TauCeti.LinearAlgebra.Eigenspace.JointEigenvector.Basic, including iSup_iInf_eigenspace_unitHom_eq_top_of_commGroup with IsUnit(Nat.card G) | Delete generic projector/decomposition targets; keep only integral obstruction and arithmetic lifts. |
| Inner compatible pairs act identically on cohomology | Current TauCeti.ContinuousCohomology.map_eq_id_of_inner in ContCohomology.InnerConjugation; ProfiniteCohomology Layer 2 | Import actual homotopy/identity, retain scalar Sah application only. Hypotheses locally compact group and smooth discrete coefficients checked. |
| Kummer isomorphism and equivariant transport | Pinned kummerClassMap/injectivity; current kummerIso, kummerMap_surjective and kummerIsoTransport | No reconstructed Hilbert 90/Kummer theory. |
| Unit/S-unit Selmer sequence and class-group obstruction | Mathlib fromUnitLift_injective; Tau Ceti fromSUnitLift_injective, ker_toClassGroup, range_toClassGroup | Import exact sequence; only arithmetic vanishing and eigenlifts new. Positive coefficient hypotheses retained. |
| Dirichlet units, unit torsion and discriminants | Mathlib NumberField.Units.rank/torsionOrder, InfinitePlace.nrComplexPlaces, discr | Only equivariant odd-character multiplicity and torsion correction are new. |
| Generic cyclic/group (co)homology | Mathlib Rep.barResolution, finite cyclic resolution/groupHomologyIsoOdd, groupCohomology.map/H1InfRes_exact | Import carriers; construct and compare the specific positive chains. |
| Local/global ramification and Frobenius dictionaries | Current LocalGaloisGroups, LocalFieldsRamification Layer 3, NumberFieldArithmetic Layer 5, ProfiniteArithmetic | Keep only the cyclotomic arithmetic application; no second local-field theory. |
| Prescribed Frobenius/prime selection | Current Chebotarev Layer 10 | Correct owner name; no invented ChebotarevDensity roadmap. |
| Ordinary completion, polynomial roots, series maps and Picard formalism | Mathlib AdicCompletion, IsAdicComplete, AdjoinRoot, cyclotomic, map/subst/rescale, Pic.mk and tensor API | Import these, state only the new arithmetic assembly and indexed-line maps. |
| Vector-bundle Chern classes | AlgebraicVectorBundles | Explicitly distinguished from finite étale K-theory Chern maps. |
| Generic Bloch/K-theory/regulator constructions | V.2–V.6, H.6, K.2/K.3/K.7, N.3–N.6, M.1/M.7 and early M.8, D.3–D.4 | Exact supplier contracts, never redeveloped inside these layers. |

No current roadmap/library statement for the arithmetic Habiro ring, KMS identity, finite cyclic regulator or indexed-line construction was found by these object searches. This is a scoped search result, not a claim about unrelated open work.

## Coverage and adversarial pass

The table accounts for all 67 parent targets plus 7, 4, 5 and 11 refinement targets, in input order. Each row records concrete instances and the retained statement, correction, supplier import or explicit proof obligation. Definitions and APIs sharing a subsection are audited under its stated standing hypotheses. A source citation is never used as evidence that an omitted hypothesis is harmless.

| Input target | README location | Instances tried | Result / change |
| --- | --- | --- | --- |
| `HB.1/bloch-group-conventions` | Contracts; §1.7 | F₁₁: new order 3, old order 6; cubic [0] | Import V.2–V.6; preserve odd comparison and degenerate symbols. |
| `HB.1/cyclotomic-character-and-eigenspaces` | Contracts; §0.1 | Trivial G; inverse exponent at n=5; unit parts n=3,7 | Cite autToPow and current joint eigenspaces; retain integral arithmetic obstruction. |
| `HB.1/the-eigenspace-and-division-by-a-group-order` | §0.1 | n=9, group order 6; n=7 group order 6 invertible | Existing Fourier projectors imported; twisted augmentation image 3ℤ/9 rejects right exactness without invertibility. |
| `HB.1/sahs-lemma` | Contracts; §0.4 | Trivial G; χ(g)−1 invertible at n=7 | Import actual inner-compatible-pair identity from current Tau Ceti; retain scalar corollary, no fabricated identity premise. |
| `HB.1/the-excluded-primes` | §0.2 | ℚ:12,4; ℚ(i):24,8; n=1,3,9 | Keep absolute discriminant, K₂ order and the separate 9∤n variant. |
| `HB.1/finite-coefficient-K3-and-the-chern-class` | Contracts; §0.3 | n=1; nonzero K₂[n]; even order | Import H.6/M finite Chern; preserve Bockstein term instead of identifying K₃/n with finite K-theory. |
| `HB.1/inflation-restriction-injectivity` | §0.4 | Trivial G; n=3 versus n=9 over ℚ | State gcd(n,w_r) for restriction separately from squarefree K₃ injectivity. |
| `HB.1/the-chern-class-map-c-zeta` | §0.3 | Weight 1 Kummer; weight 2 inverse root; roots already in F | Construction at all positive orders; compute equivariance defect and k^(1−r). |
| `HB.1/hutchinson-chern-class-agrees` | §1.10 | Cubic root and its inverse; 𝔽₇ cube classes [2]≠[4] | Exact normalization diagram is a target, not assumed agreement of names. |
| `HB.1/quillen-lichtenbaum-degree-three` | Contracts | Odd p; finite-coefficient Bockstein; p=2 excluded | Import the degree-three comparison from M.7 and K₃ structure from N; no new comparison theorem here. |
| `HB.1/injectivity-of-c-zeta` | §0.4 | Odd squarefree n; n=9 over ℚ | Repeated-prime condition retained; no stronger gcd(n,w₂) on squarefree coefficients. |
| `HB.1/s-units-realise-c-zeta` | §0.7 | n=1; avoidance of a finite prime set | S may depend on n; no uniform-in-order finite support assertion. |
| `HB.1/units-realise-c-zeta` | §§0.6–0.7 | Valuation lattice 3ℤ mod 3; nonunit S-unit | Lift to ordinary unit classes through the actual lattice and exact quotient, not representative eigenunits. |
| `HB.1/equivariant-unit-rank` | §0.8 | ℚ; imaginary quadratic; non-Galois cubic | State oddness at real stabilizers and actual character nontriviality; trivial-character multiplicity differs. |
| `HB.1/eigenspace-of-units-mod-p` | §0.8 | p=3 over ℚ; p=5,7; ℚ(∛2) | Add roots-of-unity torsion when χ=χ⁻¹; free rank alone is insufficient. |
| `HB.1/cgz-theorem-1-5` | §0.9 | n=1,3,25,35 | Squarefree surjectivity distinguished from general good-order injectivity; M′ variant retains 9∤n. |
| `HB.2/the-cyclic-quantum-dilogarithm` | §1.1 | n=0,1,2,3,9; singular x; exact n=2..16 | Real product definition; phase-free power 24, not 24n; positive exponents fixed by proved Lean examples. |
| `HB.2/kms-identity` | §1.3 | n=1; X=Y; finite fields at orders 3,5,7,9 | Clear denominators with every admissibility hypothesis; general field statement retained. |
| `HB.2/kummer-value-P` | §1.4 | Degenerate symbols; root changes; quadratic finite fields | Include roots of both X and 1−X; retain D(1), inversion and inverse-character convention. |
| `HB.2/lifting-obstruction-is-a-cup-product` | §1.4 | One symbol with nonzero boundary; trivial finite witness | Require universal Kummer comparison and finite-witness image restriction; connecting-map sign fixed by convention. |
| `HB.2/the-map-R-zeta` | §1.5 | n=1; [2], [32]; F containing μ₃ | Unique descent only at root-free orders. Unrestricted powered uniqueness rejected; lift set and ambiguity retained. |
| `HB.2/five-term-distribution-and-galois` | §1.5 | Five admissible arguments; n=15 CRT | Explicit alternating product and coefficient arrows; degenerate normalization not discarded. |
| `HB.2/root-of-unity-dependence` | §1.5 | k=−1; k=2 modulo 5 | R changes by k⁻¹, verified by finite P value with nontrivial class. |
| `HB.2/distribution-in-the-order` | §1.5 | 15→3,5; 25→5 in 𝔽_(149²) | Root powers and power-class quotient maps explicit; both D and normalization distributed. |
| `HB.2/change-of-field` | §1.5 | Identity embedding; adjoining an n-th root | Require root-free target for unique R; naturality does not assert injectivity of extension on power classes. |
| `HB.2/etale-bloch-group-and-K2` | §1.6 | n=1; [32] at n=5; tame symbol at 31 | Exact K₂[n] boundary retained; no ordinary-unit conclusion on every étale class. |
| `HB.2/the-element-eta` | §1.7 | n=3,5; orbit multisets n=3,5,7,9,11 | Keep projective correction symbols; eta root scaling k² separate from root-basis scaling. |
| `HB.2/cyclic-bar-chains` | §1.8 | N=1,3; positive even-chain boundary N[t] | Positive comparison with supplied resolutions fixes generator and Bockstein sign. |
| `HB.2/bott-element` | §1.8; Contracts | Nontrivial Bockstein; ℤ[ζ_p] without p⁻¹; algebraic closure | Bott finite-coefficient carrier supplied by H.6; only étale Chern assertion requires invertibility. |
| `HB.2/hurewicz-mod-odd-N` | Contracts; §1.9 | Odd N versus N=2; decomposable GL part | Import the exact SL summand/projection; no integral K₃=H₃(GL) assertion. |
| `HB.2/eta-is-zeta-times-bott` | §1.9 | Determinant correction; N=3; root scaling k² | Use genuine SL conjugation and odd-degree restriction, not vanishing in the Bloch quotient over E. |
| `HB.2/chern-sign-conventions` | Conventions; §1.10 | [ζ₃] versus [ζ₃⁻¹]; raw versus plus | Retain two normalizations and an independent comparison with c_fixed. |
| `HB.2/soule-formula-in-degree-three` | §1.10 | a=1; a=ζ; additive negation | Product sign is negative for c_raw with positive Kummer/Bott; no eta-based definition of the map. |
| `HB.2/chern-class-of-eta` | §1.10 | Cubic coefficients; inversion after squaring | c_raw(eta)=[ζ⁻¹], c_plus(eta)=[ζ]; c_fixed requires the explicit comparison. |
| `HB.2/local-maps-at-primes-of-norm-minus-one` | §1.11 | n=3,ℓ=5; ℓ=1 mod p negative control | Keep unique n-th roots in the base residue field, all cyclotomic factors and S-unit avoidance. |
| `HB.2/eta-generates` | §1.12 | v₃(ℓ+1)=1 at 5, =2 at 17 | Exact valuation is required for the reduced eta generator; larger valuation is not the same argument. |
| `HB.2/local-R-is-an-isomorphism` | §1.12 | ℓ=5 versus 17 at n=3; nonzero-weight valuation factor | All eligible primes targeted via higher-order distribution; no circular use of calibrated eta evaluation. |
| `HB.2/chebotarev-detection` | §1.13 | Infinitely many detecting primes; unit powers | Correct target is a product, not a finite-support sum; zero sets detect cyclic subgroup only. |
| `HB.2/the-comparison-with-the-chern-class` | §1.13 | CRT; compositum discriminant change | Unit scalar comparison separated from γ=2; recheck field hypotheses after compositum. |
| `HB.2/scalar-from-eta` | §1.14 | (a,b)=(2,1),(2,−1); nonunit b | Scalar a/b only with b invertible; raw convention gives −2. |
| `HB.2/eta-galois-scaling` | §1.7 | k=−1, k=2; compatibility of inverse root law | Quadratic eta scaling retained without confusing it with the inverse-linear root-based map. |
| `HB.2/R-injectivity-and-image` | §1.14 | Prime, squarefree composite, prime power; étale [32] | State ordinary Bloch domain; fixed-order S; do not extend unit image to all étale classes. |
| `HB.2/hutchinson-refinement` | §1.14 | Cubic sign; γ=±2 | Keep conditional on independent normalization and downstream eta regulator value; no Nahm cycle. |
| `HB.2/the-exported-interface` | §1.15 | m=1; μ₃⊂K; order 25→5 | All-order ε constructed from finite Chern, not from R; coherent torsor/root-line maps are separate targets. |
| `HB.6/compatible-roots-of-unity` | §2.1 | (2,5) exponent 6; ζ₆; valuations 1,1/2,1/6 | Multiplicative compatible roots and CRT exponent fixed; ordinary exp(2πi/m) choices fail closeness. |
| `HB.6/coefficient-rings-and-frobenius` | §2.2 | ℚ(i) split/inert; non-Galois cubic; p|Δ | Full tensor algebras retained; coefficient and cyclotomic Frobenius are distinct. |
| `HB.6/the-substitution-exists` | §2.3 | x,x²; geometric series at c=p; c=1 | Consume convergent HC.3 re-expansion, requiring a complete target and topologically nilpotent shift. |
| `HB.6/the-gluing-condition` | §2.4 | Constant i; KZ edges; zero completion; restriction γ | Direction rex(f_m)=φ(f_pm) fixed; full algebra descent presentation targeted. |
| `HB.6/the-p-completed-ring` | §2.5 | p|Δ zero; split quadratic; untwist exponent 2 | Local product distinguished from ordinary completion; positive φ^v_p(m) untwist fixed. |
| `HB.6/the-p-adic-classical-ring` | §§2.6–2.7 | p=2,m=1; p=11,m=5 split | Import HR.5 full chart; add p-chain mixed-adic comparison and all-order assembly here. |
| `HB.6/ring-operations-and-the-classical-comparison` | §2.9 | Δ=1; odd-order indicator after inverting 2 | Rational gluing image proved using local splitting, integral lattice and intersection; localize before completing. |
| `HB.6/decomposition-into-classes` | §2.10 | Δ=1,6; K=ℚ(i),d=4 | Order-component product retained; domain assertion gets coefficient-disjointness hypothesis. |
| `HB.6/abelian-fields` | §2.11 | ℚ(ζ₅),m=2: ζ₅³; ℚ(i) | Scalar embedding uses inverse Artin action required by gluing; tensor base structure specified. |
| `HB.6/what-is-not-true-of-this-ring` | §§2.2,2.10–2.11 | Internal idempotent; constant i; non-Galois local Frobenius | No universal domain, constant R embedding or chosen-field-factor convention. |
| `HB.7/invertible-local-sections` | §3.1 | ξ=0; (1+x)^(1/p); 1+x/5; ps; nonzero pole | Correct integral linear shape and allowed p/x defect; local module is the span, not just invertible sections. |
| `HB.7/dworks-lemma` | §3.2 | Binomial counterexample; p=2; ramified/equal characteristic | Separate linear integrality and exponential radius; scope complete unramified products. |
| `HB.7/pochhammer-dwork-difference` | §3.3 | s=0,2; ζ=1; simple pole | p-depleted coefficients and completed rational-function target stated for all integer s. |
| `HB.7/pochhammer-sections` | §§3.4–3.5 | Empty presentation; even m half branch; two presentations | Use supplied completed-local K₃ presentations; independent higher defect and integral first-jet targets. |
| `HB.7/local-freeness` | §3.6 | Zero degree; unit rescale; ps non-generator | Ratio is an integral local unit; theorem gives local rank one only. |
| `HB.7/extension-to-all-roots` | §3.7 | p≥5 with ω=2; p=2,3 fail | Phase cocycle and denominator specified; full-order extension depends on coherent torsors. |
| `HB.7/the-global-module` | §3.8 | Zero; γ=1,2; (f+g) mixed terms | Define a subset first; addition requires linear effective descent and cannot be inferred from nonlinear membership. |
| `HB.7/the-ring-case-and-tensor-products` | §§3.9–3.11 | Zero degree; idempotents; ξ+(−ξ) | Separate ring equality, multiplicative membership, bilinearity and tensor bijectivity. |
| `HB.7/operations-on-the-modules` | §3.12 | Inversion first jet; γ=2 at m=2; γ=0 excluded | Construct order changes; no undefined ξ/γ degree; retain powered membership statement. |
| `HB.7/involution-pairing` | §3.13 | g=0; f=g; orthogonal idempotents | Explicit a=gτg,b=fτg; no division or unconditional nonzero coefficients. |
| `HB.7/vanishing-propagates` | §3.14 | Full series zero; isolated zero constant; p|Δ | Propagate only across noninverted edges, not from a constant term alone. |
| `HB.7/constant-terms` | §3.14 | Zero degree; nontrivial Kummer line; m sharing Δ | Evaluation targets integral associated line when gcd(m,Δ)=1, not an unjustified base field. |
| `HB.7/what-the-local-picture-does-not-give` | §3.15 | Multiplication by 0,1−q,unit | Invertibility does not imply global generator; no unsourced general abelian freeness claim. |
| `HB.1/finite-endomorphism-obstruction-criterion` | §0.5 | ℤ/9; ℚ/ℤ; n=0,1; A=0 | Finiteness required; specify cyclic-generator endomorphism and actual twisted quotient. |
| `HB.1/keune-picard-eigen-obstruction` | §0.5 | p^a,a>1; p dividing K₂ order negative control | Keune coinvariant injection imported with source gap; finite criterion reaches Pic[n] eigenvectors. |
| `HB.1/cyclotomic-prime-valuation-action` | §0.6 | ℚ,n=9; ℚ(∛2),p=5; ramified p | Arithmetic application of existing Eisenstein/local-global dictionary, no general ramification replan. |
| `HB.1/injective-exact-map-eigenclass-lift` | §0.6 | Trivial/zero modules; n=9 without 1/6 | Injective kernel lift, uniqueness and equivariance; no surjectivity of the final map needed. |
| `HB.1/ordinary-unit-eigenclass-lift` | §§0.6–0.7 | D=3ℤ mod 3; S-units with nonzero valuation | Use torsion-free image lattice and exact reduction, avoiding saturation of ambient valuations. |
| `HB.1/odd-cyclotomic-unit-multiplicity` | §0.8 | Actual odd character; trivial character; non-Galois cubic | Real-place oddness and actual subgroup stated; no unnecessary Galois-closure disjointness. |
| `HB.1/prime-unit-torsion-exact-sequence` | §0.8 | ℚ,p=3 extra dimension; p=5,7 none | Separate integral rank from mod-p dimension; retain torsion character correction. |
| `HB.2/cyclic-hypergeometric-sum` | §1.2 | n=0,1,2,3; 23/3; singular denominator | Real finite definition and two proved Lean examples; all cancellation hypotheses explicit. |
| `HB.2/kms-odd-order-proof` | §1.3 | Analytic center (1/5,2,−4/5); S=4/9; finite characteristics | Uniform tails, √(2π/n) factor, eta phase and torsion-free integral descent each specified. |
| `HB.2/eta-bar-bloch-specialization` | §1.9 | N=3 gives [0]; repeated vertices; SL determinant | Specialization of supplied configuration map, retaining degenerate correction and positive cyclic generator. |
| `HB.2/eta-chern-signed-evaluation` | §1.10 | Positive Bott Bockstein; cubic sign | Raw/plus evaluation proved from product and eta–Bott, c_fixed comparison remains independent. |
| `HB.6/p-chain-mixed-adic-comparison` | §2.6 | (4,q+1): (q−1)²=0 but q−1≠0 | Compare completed double systems; raw chain and (p,Φ) ideals are not asserted cofinal. |
| `HB.6/prime-to-p-taylor-equivalence` | §2.7 | q² coefficients 1,2,1,0; four-factor Φ₅ at 11 | Full algebra local chart and independent seeds retained; zero and idempotent tests included. |
| `HB.6/untwisted-families-are-classical-taylor-families` | §§2.5,2.7 | Independent p-chains; positive untwist; arbitrary local seeds | Reconstruct forward along each chain and compare with classical all-order Taylor image. |
| `HB.6/additive-and-multiplicative-taylor-coordinates` | §2.8 | m=1,2 sign; strict weighted bound N=4 | x=−ζu; exact coefficient index ℓ−1 and full cyclotomic basis fixed. |
| `HB.6/rational-gluing-image-criterion` | §2.9 | Δ=1; Δ=2 idempotent; exact KZ coefficients | Rational specialization uses lattice detector and intersection; no localization/completion swap. |
| `HB.7/followup-half-shift-coefficient` | §3.5 | Values 1/48,1/12,1/96,−1/48 | Real rational function; two proved Lean examples pin sign and coordinate denominator. |
| `HB.7/followup-half-shift-first-jet` | §3.5 | B₁(1/2)=0,B₂(1/2)=−1/12; even root | Bernoulli expansion gives normalized first jet −ζ/(24ζ_m(1−ζ)); no unnormalized Kummer coefficient claim. |
| `HB.7/followup-integral-linear-jet` | §3.5 | p=2,3 excluded; ζ=1 pole; nonintegral coefficients | Units 24,ζ_m,1−ζ give integrality for finite integral presentation only. |
| `HB.7/followup-effective-global-descent` | §3.10 | Degree 0; infinite intersections; proper idempotent support | Target exact linear equalizer, finite presentation, projectivity, rank one, actual base changes and conservativity. |
| `HB.7/followup-tensor-bijectivity` | §3.11 | Tensor unit; ξ and −ξ; finite sum mapping to 1 | Prove after actual base changes; no implication of one global inverse pair or global generator. |
| `HB.7/followup-picard-character` | §3.11 | Zero, inverse, square; nontrivial Picard class | Use existing Pic.mk and additive Picard map; retain object-level coherence, not only isomorphism classes. |
| `HB.7/followup-field-pullback` | §3.16 | Identity; degree 0; diagonal ℚ→ℚ(i) at 5 | Common Δ and full factors; Chern/Coleman torsor naturality named before semilinearity. |
| `HB.7/followup-scalar-equivalence` | §3.16 | H_S⊗H_R≃H_S at degree 0; towers | Tensor base is H_R, not a nonexistent canonical R-algebra structure; requires effective descent. |
| `HB.7/followup-galois-action` | §3.17 | Identity; conjugation square; changed K₃ index | Coefficient action fixes abstract root and q, permutes local factors, and differs from τ. |
| `HB.7/followup-local-norm-defect` | §3.18 | Split quadratic 1+(a+b)x+abx²; rank; ξ=0 | Whole-series determinant norm, log-to-trace, integral first jet and transferred torsor/regulator diagrams. |
| `HB.7/followup-transfer-norm` | §3.19 | Identity, tower, Norm(0),Norm(1); quadratic 4≠2 | Multiplicative sections map, not additive transfer; no unsupported norm on Pic(H_S). |


Additional convention checks cover the full coefficient algebra (including zero completion when p|Δ), positive Kummer coboundary, χ⁻¹ exponent, positive bar/Bott Bockstein, raw/plus Chern sign, rex shift x+c, inverse Artin scalar action, positive Frobenius untwist exponent, additive/multiplicative coordinate sign, constant-one formal half branch, and whole-series determinant norm. For unrelated degenerate settings (a ramified DVR, equal characteristic with p=0, n=0 coefficients, p=2 or 3 sections), the standing hypotheses exclude the setting explicitly. The elementary finite D and f definitions remain total at n=0. A zero coefficient algebra contributes a trivial ring constraint, never a nonzero field instance. The unit ideal gives the zero adic completion; it is not used as a nonzero Taylor chart.

The new sign/direction checks for heavy objects remain README checks because their carriers are not available at the pins. They were not encoded using sorry'd data or weakened predicates. The six proved Lean examples concern the three genuine light definitions only, with two per definition as the latest rule requires.

## Sources actually read

All sources used are public and were accessed on 19 October 2026; no uncleared or private book was used. The table identifies editions independently of the historical packet reading logs. Hashes identify the fetched PDF bytes; downloaded files are disposable scratch and are not repository deliverables. The README contains original statements and proof outlines, not copied passages or a section-by-section digest.

| Source | Passage inspected for this package | PDF SHA-256 |
| --- | --- | --- |
| [CGZ published, Ann. ENS 56 (2023), 383–426](https://math.uchicago.edu/~fcale/papers/CGZ.pdf) | Introductory convention and Theorems 1.2,1.5,1.6, Remark 1.4, printed pp.384–387 | `8003ee09bfec725127f4b5c2058c5516834a91a160d9c4428d962b1e5a1f0212` |
| [CGZ arXiv:1712.04887v3, 2021](https://arxiv.org/pdf/1712.04887v3) | §§2–5, pp.7–28, including Proposition 2.5 and arithmetic unit proof; Theorem 7.4 and proof pp.37–38. Numerical Nahm evaluation is owned downstream. | `024317c20a1d8b66234e608af46941093a675b6399ef480dfedd52a31dcd7bf5` |
| [GSWZ arXiv:2412.04241v2, 2025](https://arxiv.org/pdf/2412.04241v2) | Definitions and conventions pp.1–11; Pochhammer expansions pp.18–20; regulators, Dwork and sections pp.37–45; Taylor lattices/classical comparison pp.59–66 | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| [Hutchinson arXiv:2104.14413v4, 2024](https://arxiv.org/pdf/2104.14413v4) | Entire eight-page preprint, especially Soulé product and §4 Bott/eta; title is The Chern class for K₃ and the cyclic quantum dilogarithm | `e7a358154bf29701afcb1feb2308287f90e0fe405813d9548879dd5b2f2f30bf` |
| [Hutchinson arXiv:1107.0264v2, 2013](https://arxiv.org/pdf/1107.0264v2) | §§6.2–6.4, pp.31–33, and finite-field discussion through p.36 | `057ce8a6ae5548fd9f6279514adfa3afa5a6554ad1e58f9ca34bb4c62df52e94` |
| [Garoufalidis–Zagier, Ramanujan J.55 (2021), 219–238](https://people.mpim-bonn.mpg.de/stavros/publications/printed/asymptotics_of_nahm_sums_at_roots_of_unity.pdf) | Appendix A, Proposition 8.1, (55)–(60), printed pp.235–237 | `4b737361b21095a2b476e89002821f8dee37bc12385e1275b1f5422ef14fa4c8` |
| [Wagner thesis, q-Hodge filtrations, Habiro cohomology, and ku](https://ferdinand-wagner.github.io/papers/q-Thesis.pdf) | §2.11 and Lemma 2.12, printed pp.31–32; full finite étale residue algebra replaces the false irreducibility sentence | `d074047f202ee7e64298801b15327a9a634b6f7b6e4bcd5be7b2fda959ad876c` |

An attempted Sutherland lecture-note fetch returned 403; it is not cited. The equivariant Dirichlet argument is given intrinsically using the supplied unit theorem and the infinite-place representation. No uninspected online book is used to fill the Keune, Chern sign or global-descent gaps. Public Soulé material was retrieved but not used as a new source proof; the product formula is located in Hutchinson and the earlier owner contract.

## Validation

- `lean-check research/blueprint/packages/HabiroNumberFields/Suggested.lean`: exit 0 at the stated pins, exactly four warnings, all declaration uses sorry. The three real-bodied definitions and six proved examples elaborate. An initial unused simp argument was removed before the successful final run. No data definition, data instance or example has an admitted body.
- `python3 scripts/check_blueprint.py` on each of the five input packets: all five exit 0, with zero errors and zero warnings. Inputs were not edited.
- Exhaustive finite prime-field checks: KMS and shift for all admissible nonzero triples at `(n,ℓ,ζ,count)=(3,19,7,108),(5,31,2,500),(7,43,4,1372),(9,73,2,4374)`. Cleared quasi-periodicity checked at every x and s=0..n, including zeros; D(1)^24 checked in each field.
- Exact integer polynomial quotient arithmetic checks: D(1)^24=n^(12n) for every n=2..16. KZ Taylor coefficients at order one through degree six are 1,−1,2,−5,15,−53,217; at order two through degree two are 3,11,72; order-three/four constants are 5−ζ₃ and 8−3ζ₄. Calculations truncate finite Pochhammer sums at the appropriate vanishing order, with cyclotomic reduction.
- Quadratic finite-field checks use pairs a+b√d for a nonsquare d and test n-th power classes by exponent `(ℓ²−1)/n`. For `(n,ℓ)=(5,19),(7,13),(9,17),(15,29),(25,149)`, root independence and inversion passed for every admissible X∈𝔽_ℓ and every lift change. At (5,19,X=3), the changed-root exponent 3 is distinguished from 2. Order 25→5 reduction passed for all 147 admissible X over 𝔽₁₄₉.
- Eta finite calibration passed at every odd n from 3 through 27 for the first four odd primes ℓ≡−1 mod n with exact valuation at each p|n. Prime lists by n: 3:(5,11,23,29); 5:(19,29,59,79); 7:(13,41,83,139); 9:(17,71,89,179); 11:(43,109,131,197); 13:(103,181,233,311); 15:(29,59,239,389); 17:(67,101,271,373); 19:(37,113,151,227); 21:(41,83,167,419); 23:(137,229,367,643); 25:(149,199,349,449); 27:(53,107,269,431). Each [R(eta)]=[ζ²] and is nontrivial. Orbit-argument multiset checks passed for n=3,5,7,9,11 at primes 5,19,13,17,43 respectively. These computations do not replace the general calibration proof.
- `python3 research/blueprint/intake.py check-files` on all four deliverables: 4 files, 0 problems. The README has 129,332 bytes, 54 numbered subsections and 211 discriminating Check bullets; every subsection has at least three. The Lean file has 137 lines, three real definitions, four theorem milestones and six proved examples. Metadata parses as TOML with topic math.NT. README residue checks exclude packet identifiers, removed stubs, unresolved upstream bookkeeping identifiers and private paths. No source files, scratch logs or downloaded PDFs are part of the change.
- `git diff --cached --check`: exit 0. The staged change contains exactly the four issue deliverables.

## Resume / next worker

Packaging is complete; there is no second job in this run. Independent review should begin with the powered-lift counterexample, the exact Chern sign diagram, and the effective descent contract rather than treating a successful sorry elaboration as a truth check. All continuing mathematical information is in the README and this handoff. Disposable scratch scripts and downloaded sources are not required by the next worker.
