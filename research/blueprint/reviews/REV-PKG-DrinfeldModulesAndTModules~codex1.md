# Independent review: Drinfeld modules and t-motives

Issue [#11513](https://github.com/CBirkbeck/tauceti-explorer/issues/11513), job `REV-PKG-DrinfeldModulesAndTModules~codex1`. Reviewer: Codex, session `codex-qAzAqq`, 2026-10-20. **Completed review; verdict: `needs_changes`.** This is not a checkpoint. Mathematical corrections and the permitted package edits are applied; supplier closure still prevents upstream acceptance.

## Remaining findings

The package still consumes three roadmaps for which the required upstream availability/order was not established. At TauCetiRoadmap main `c4d22422c3f1aaa3d806c42f432953c26cb91969`, none of these three is present under the roadmap directory or `Completed`. `upstream/CaraianiNewton.md` does not assign DrinfeldModulesAndTModules a tier or bundle that authorizes these imports. An atlas packet or a draft upstream PR does not itself meet WORKERS' prerequisite rule.

| Supplier and exact missing contract | Consumers | Evidence and required resolution |
| --- | --- | --- |
| FiniteFieldsAndCharacterSums: Ore/q-linearized-polynomial comparison, evaluation linearity, separability, subspace polynomials | DM.0; lattice products in DM.2; motive and torsion constructions in DM.4/DM.1 | The named targets exist in the atlas, but no upstream package supplies them. The order file's move of FF.1 to AnalyticNumberTheory does not move these FF.4 targets. Establish an earlier upstream owner, or authorize a downward ownership transfer with corresponding consumer updates. |
| ReductiveGroupsPartII RG2.3.7 and RG2.0a.2: Lang surjectivity and finite-locally-free Weil restriction | §1.3 and its torsion uses | The roadmap has a tier-1 entry, but upstream draft #785 is not on main; its dependency chain names #446/#447. The package needs the actual supplier or a permitted self-contained replacement, including the nonreduced finite coefficient-ring case. |
| MotivesAndAlgebraicCycles §§6.1–6.3: neutral Tannaka reconstruction over arbitrary fields, finite generation, and criteria for faithfully flat/closed group maps | §§8.21–8.23, 8.35, 8.48 | Upstream draft #1313 is not on main and names #1199 as a dependency. The coefficient field here is the imperfect field F_q(t), so a characteristic-zero substitute does not suffice. Establish supplier availability and ordering, or obtain an ownership decision. |

These are availability/ownership findings, not a claim that all three citations have been proved upward in a known Drinfeld tier. I did not invent a bundle, edit other roadmaps or their packets, or silently duplicate their general theories. Resolving these contracts and their ownership is outside this review's permitted files. The smaller FunctionFieldArithmetic import was eliminated: §6.2 now proves the necessary discrete-cocompact lattice statement directly from finite normalization over F[θ], while the curve/constants inputs already have upstream owners. FunctionFieldArithmetic remains a downstream consumer only.

Issue item 1 separately specifies a 200 KB README. The revised file is 282,576 bytes and exceeds that size. PACKAGE_REVIEW's later shape rule expressly overrides older size notes and requires retaining all statements, tests and locators. I retained that content. If the issue-specific cap is enforced literally, the maintainer must authorize a division into Parts or reconcile the issue template with that rule. This size discrepancy is recorded separately from the concrete supplier-closure reason for `needs_changes`.

## Scope, inputs and plan fidelity

The input package was written by Claude (`claude-JuTyFi`), not this reviewer. The issue's parenthetical Mordell title is a template error; the named Drinfeld package and accepted Drinfeld packet were reviewed. The advertised previous report `REV-PKG-DrinfeldModulesAndTModules~codex.md` and package `review.json` were absent at the claimed starting commit `849dc0425e2d674dc106cfa138661b1badd45da4`; there were no prior findings available to replay. No source locators were marked unverified by the package author.

I read the package, its Lean signatures, metadata, author handoff, accepted parent and constituent plans, library audit, WORKERS, PROTOCOL (including §§5, 13, 20), expansion protocol, PACKAGE_REVIEW and UPSTREAM_GUIDE. ClassFieldTheory and LocalGaloisGroups were the two upstream form models. The effective accepted-plan inventory is 123 reused targets plus 11 parent targets, not the author's claimed 123 plus 15. Target groupings and supplementary contracts account for the package's larger subsection count; those counts are not interchangeable. All 123 reused target anchors were accounted for and the 11 parent statements were read. The final README has 137 numbered target subsections, after removing one genuine upstream duplicate.

The package retains general A, every degree of infinity and every positive Drinfeld rank. Polynomial-ring/Carlitz, t-module, and Taelman-model specializations are explicitly scoped; they do not replace the general-A targets. GlobalShtukasAndFunctionFieldLanglands supplies no prerequisite. No target states a theorem of Tate's thesis or uses its theorem numbering.

## Corrections applied

All section numbers below refer to the revised package.

1. **Lattice morphisms, §2.7.** The kernel product must use the source exponential: U = exp_φ(c⁻¹Λ_ψ/Λ_φ), and u(X) = cX times the product over nonzero elements of U. The zero scalar is separate. Taking φ = ψ = Carlitz and c = θ gives U = C[t], exposing the former wrong exponential.
2. **Semilinearity, §1.3.** Replaced underlying bijectivity by invertibility of the Frobenius linearization. Frobenius on F(u)^sep has invertible linearization and the expected fixed vectors but is not surjective as a map of sets. Inverse Frobenius additionally needs perfection.
3. **Intrinsic Tate modules, §1.8.** Defined Hom_A(K_λ/A_λ, E[λ^∞]) first. The φ_z inverse limit is a parameter-dependent presentation, valid also for nonprincipal λ. Changing z to uz rescales the nth coordinate by u⁻ⁿ.
4. **Local residue coefficients, §1.10.** Introduced the unique finite-étale lift η: F_𝔭 → R across the nilpotent characteristic ideal. The residue-factor formulas now use η(a), rather than applying γ to an element outside its domain.
5. **Section rings, §3.7.** Normality uses the full relative spectrum of Sym ℒ, including the zero section. Removed the unnecessary negative-power vanishing argument and the absolute-positive-dimension restriction. A proper identity morphism Spec F[u] → Spec F[u] with the ample trivial line disproves that vanishing claim.
6. **Tate duality, §§5.1 and 7.6.** The canonical evaluation pairing takes values in ω_λ = Hom_F(K_λ/A_λ,F), a rank-one A_λ-module. A residue-coordinate trivialization produces ordinary A_λ-valued duality; its choice is explicit. The Galois action on the coefficient line is trivial.
7. **Tate coefficient rings, §§5.1 and 5.6.** Used the total quotient ring, preserving all residue-field factors, rather than taking the fraction field of a potentially non-domain. A degree-two residue extension split by L gives two factors.
8. **Hom finiteness, §§5.3–5.4.** Hom is finite projective over general Dedekind A, with rank at most rr′; it need not be free. Finite generation comes from Stalder, Proposition 2.28 and Corollary 2.29, pp. 13–14, plus the motive functor, rather than the false implication that a finite reduction modulo λ already forces finite generation. A nonprincipal rank-one lattice ideal gives the negative control. Localization at A_λ is free, as required for saturation.
9. **Period-ring valuations, §5.5.** Required every extension of every base prime-divisor valuation. The exceptional set must have finite image on the base, while lower bounds may depend on the extended valuation. Specified the power-series units used in S. These are Stalder, Definitions 6.6 and 6.10, pp. 37–38.
10. **Skew invariant factors, §4.10.** Corrected left-module quotients to left ideals; split the nilpotent Fitting summand before applying Newton theory to the invertible part; allowed the least denominator-clearing exponent to be zero; distinguished full modular rank from invertibility; and excluded the zero matrix from an empty-slope positivity conclusion. D = σ, D = 0, diag(σ⁻¹,0) and diag(σ⁻¹,σ⁻²) modulo σ² pin the distinctions. The existing Mathlib Fitting decomposition is cited, not replanned.
11. **ABP arithmetic and auxiliaries, §§8.38–8.39.** Added exact size rules including zero/empty inputs and integer twists, full-constant-field Riemann–Roch counts, the counting limit, the conditional polynomial Siegel degree bound, explicit auxiliary degree/size/constraint bounds, and the two incompatible bounds on a hypothetical nonzero leading coefficient. The ℓ = 2, N = 4 case has six unknown coefficients and four constraints, giving exponent two. Vanishing auxiliaries and zero solution vectors are kept separate from estimates that divide by nonzero coefficients.
12. **Upstream duplication.** Deleted former §8.11, the radius-one Tate-algebra preparation/PID target; its exact imported contract is now solely in the supplier section, with the stable anchor retained. RestrictedPowerSeries §§3.2, 4.3, 5.1–5.2 supply it. Former §§8.12–8.53 became §§8.11–8.52; all visible references and Lean comments were updated. No removed-target stub remains.
13. **Hilbert growth, §8.42.** Mathlib `Polynomial.hilbertPoly` is a characteristic-zero rational-series coefficient calculation, not a graded-module Hilbert–Serre theorem. Added the actual graded algebra B^h, its fraction-field/dimension argument, and the graded-module bridge as part of this target, with Stacks Proposition 10.58.7 (00K1) and Lemma 10.117.1 (00P6). The numerical polynomial is over ℚ even in characteristic two; it is not obtained by dividing by two in the coefficient field.
14. **Analytic Lean generality.** Elementary Carlitz analytic signatures work over any complete ultrametric F-field with norm θ = q; algebraic closedness is imposed for transcendence statements. The README explains comparison through a completed algebraic closure and uniformization. Removed the false implication that an arbitrary complete coefficient field already contains all of C_∞.
15. **Definition tests in Lean.** Added proved tests for Ore coefficients and degree, zero/identity morphisms and isogenies, characteristic ideals, Carlitz brackets, exponential/logarithm at zero, period scaling, cardinality of the zero module, exact constants, semilinearity, Betti pure tensors, singular fundamental matrices, solution spaces, solution rings and degree-zero spans. Replaced the vacuous degree-span membership test by equality with the span of one. No examples are admitted; no data carriers are supplied by `sorry`.

## Source verification

The reproducible sample was chosen from the original 138 subsection headings in document order using `random.Random(11513).sample(headings, 15)`, where headings are the `(number,title)` matches of `^### (\d+\.\d+) ([^\n]*)$`. Sections renumbered after duplicate removal are shown in both columns. These are paraphrased verification results, not excerpts or source outlines.

| Original § | Revised § | Source actually checked | Result |
| --- | --- | --- | --- |
| 4.6 | 4.6 | BP §3.1, pp. 8–10; Theorem 4.2, p. 16 | Exponential and abelian/uniformizable distinction agree; surjectivity is a condition. |
| 6.10 | 6.10 | Tae Theorem 4, pp. 386–388 | Tangent determinant has [Λ₁:Λ₂] and |H₂|/|H₁| in the stated direction. |
| 0.8 | 0.8 | Har Definition 5.1, p. 15; §6, pp. 23–24 | Kernel is a finite group scheme for a nonzero isogeny; points do not measure inseparable degree. |
| 8.39 | 8.38 | ABP §§3.2–3.3, pp. 10–13, Lemmas 3.3.3–3.3.6 | Basic inequalities agree; supplied the omitted exact counting and polynomial-degree contracts. |
| 4.10 | 4.10 | Mau Theorem 3.6, p. 17; Theorems 3.8–3.11, pp. 17–20; Theorem 4.1, p. 22 | Corrected nilpotent part, zero exponent, modular rank and module handedness. |
| 8.38 | 8.37 | ABP §3.4, pp. 13–16; NewtonPolygons §§2.2, 4.3 | Gauss-norm inequality has the stated radius ratio and multiplicities. |
| 8.49 | 8.48 | Pap Propositions 6.2.3 and 6.2.5, pp. 35–36 | Linear vector kernel and semidirect-product equations agree. |
| 8.29 | 8.28 | Pap Lemma 4.2.3, p. 23 | Coefficient-twist invariant ideals descend to constants. |
| 8.50 | 8.49 | Pap Theorem 6.3.2, pp. 36–37 | Logarithm/period relation and its sign agree; no correction needed. |
| 5.2 | 5.2 | Sta Proposition 5.16, p. 34 | Comparison map and finite-generation hypotheses agree. |
| 8.24 | 8.23 | Pap Theorem 3.3.15, pp. 16–17; Definition 3.4.10, p. 19 | Rigid analytic objects and generated t-motive subcategory are distinguished correctly. |
| 1.9 | 1.9 | Pik §3.2, pp. 12–14 | Continuous finite-level Galois action agrees; basis dependence of matrices retained. |
| 1.6 | 1.6 | Har Theorem 6.4(b), pp. 25–26 | Étale iff the characteristic ideal condition holds; no good-characteristic hypothesis silently lost. |
| 3.7 | 3.7 | Stacks Lemma 30.16.1 (0B5T), Lemma 29.44.17 (0C6J) | Finite generation/properness inputs agree; normality proof needed the full total space correction. |
| 8.35 | 8.34 | Pap Theorem 4.4.6, p. 28 | Rational automorphisms and geometric invariants have different hypotheses; the package retains them. |

Beyond the sample I checked the passages used for each correction, including the full ABP auxiliary argument in §§3.4.2–3.4.5, pp. 13–16; Stalder's finiteness and period-ring definitions; and Wiedmann Definition 5.1, p. 72, with the filtration construction in §3.10 and pp. 40ff. The latter explicitly supports period r·deg(∞), so I did not replace the general-infinity elliptic-sheaf statement by a rational-place shortcut. The public ND endpoint could not be read; it was not in the random sample. I do not claim to have verified its page locators. Its Carlitz normalizations were checked independently against BP/Pap and the displayed product identities. No uncleared book was used, and no source passage or source file is included in the repository.

## Current-library and roadmap duplication audit

The pinned build is Mathlib `082e2d37e8`, Tau Ceti `f790474`. The read-only current library is Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The supplied roadmap checkout has git root commit `0d144d044dacebca17b654695b6f1ad58f159b27`; because it predates current main, I also read the individual current RestrictedPowerSeries, NewtonPolygons and SchemeAndStackFoundations README/signature files at `c4d22422c3f1aaa3d806c42f432953c26cb91969`, and checked the current main directory listing and relevant supplier PR status. No repository was cloned or copied.

The object audit covered the nine post-snapshot roadmaps (AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic, RealAlgebraicGeometry) and Completed roadmaps, especially ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. Searches included Frobenius-semilinear fields, module finiteness, formal/restricted series, completion/valuation, group-scheme kernels, fixed vectors, motives and characteristic-polynomial cardinalities, rather than just Drinfeld names. Existing skew polynomials, completions, restricted series, fixed submodules, base change, characteristic polynomials, tensor products, sheaves and group-scheme carriers remain imports.

One target was removed: former §8.11, as recorded above. The Fitting split now specifically uses Mathlib `LinearMap.eventually_isCompl_ker_pow_range_pow` in `RingTheory/Artinian/Module.lean` (line 307 at the pin); its Artinian/Noetherian hypotheses were read. Tau Ceti Fitting ideals and restricted-series declarations are already distinguished as current-library rather than pinned imports. Tau Ceti's abelian-group ℤ_p Tate module does not supply the general-A λ-adic realization here. OperatorTheory's complex nuclear operators do not supply Taelman's compact finite-field determinant. A name match for a categorical Drinfeld center does not supply Drinfeld modules. No further full target duplication was found in this audit.

## Lean signature audit

| Signature(s) | Hypotheses and comparison checked |
| --- | --- |
| `DrinfeldModule`, `charIdeal` | Non-scalar F-algebra map; differential equals γ; characteristic is ker γ, not ker φ. Scalar actions fail the structure condition. |
| `natDegree_eq_rank_mul`, `natDegree_X_pos` | Polynomial A only; nonzero a for the degree theorem; positivity comes from non-scalarity. The general Dedekind-A rank theorem remains a README target. |
| `carlitz`, `carlitz_rank` | Any θ, including zero; characteristic γ = aeval θ; q-power coefficients, not commuting θ and τ. Proof fields may use `sorry`; the data formula does not. |
| `carlitzD_succ`, `carlitzEll_succ` | Arbitrary commutative F-algebra; the signed logarithm denominator is distinct in odd characteristic. |
| `carlitzExp_summable`, `carlitzExp_functionalEquation` | Complete ultrametric coefficient field, norm θ = q; no unnecessary algebraic-closedness restriction. |
| `carlitzLog_summable_iff`, `carlitzExp_carlitzLog` | Strict convergence-radius bound; real exponent q/(q−1); denominators nonzero since norm θ > 1. |
| `carlitzExp_eq_zero_iff`, `norm_carlitzPeriod` | Root ρ^(q−1) = −θ, same normalization as README, polynomial multiples of the chosen period; comparison through a completed algebraic closure. |
| `finiteModuleCardinality`, `finiteModuleCardinality_quotient` | Finite-dimensional F-vector space with compatible F[X]-action; polynomial cardinality, zero module maps to one, cyclic relation polynomial monic. |
| `linearIndependent_of_fixed`, `finrank_fixedSubmodule_le`, `bettiComparison_bijective_iff` | Arbitrary constant field and extension; exact constants and semilinearity explicit; finite dimensionality only on the dimension assertions. |
| `transcendental_carlitzPeriod`, `algebraicIndependent_carlitzLog` | Complete algebraically closed ultrametric field; algebraic closure expressed by algebraicity over F(θ); logarithms arbitrary with algebraic exponentials, not just the principal branch; linear independence over F(θ). |

The retained real-bodied helpers are lightweight specializations of pinned carriers. Heavy shtukas, stacks, period rings, Tannakian categories and analytic carriers are README targets, not fabricated Lean data. The closing Lean comment records the definitions without declarations. Proved examples discriminate the definitions under test; named theorem targets, not admitted examples, carry the unproved mathematical milestones.

## Adversarial mathematics pass

The following table covers all 137 retained numbered targets. A row records an actual boundary computation or a hypothesis test; “retained” means that test gave no additional correction, not that the theorem is formalized. The convention rows also cover assumptions shared by many targets.

| Statement(s) | Instances and calculation | Result/change |
| --- | --- | --- |
| Finite-field convention | A field cannot have q = 1; q ≥ 2 makes q−1 nonzero. Use q = 2 and odd q for signs. | Retained; no division by q−1 at q = 1. |
| Degree convention | At infinity of degree δ, #(A/(a)) = q^(−δ ord∞a); constants have degree zero. | δ retained; no rational-place assumption. |
| Ore/twist convention | (θ+τ)² = θ²+(θ+θ^q)τ+τ²; σ(t)=t but σ(c)=c^(1/q). | Direction and coefficient conventions retained; proved twist tests. |
| Motive variance | Precomposition reverses a composite; star reverses multiplication and transposes matrices. | Contravariant τ-motive versus covariant dual motive retained. |
| Analytic/period convention | ℓ₁=−D₁; q=2 erases that sign, q odd does not; changing ρ scales π. | Sign witness retained; period scaling example added. |
| Coefficient/duality convention | Degree-two residue extension splits after scalar extension; z↦uz changes a residue trivialization. | Total quotient ring and ω_λ corrections. |
| 0.1 | Scalar action has correct differential but fails non-scalarity; θ=0 Carlitz has ker γ=(t) while φ is injective. | Retained; characteristic-ideal examples added. |
| 0.2 | Nonzero constant: degree zero; t² has top coefficient one for Carlitz; r can exceed q. | Retained, a=0 excluded from formula. |
| 0.3 | δ>1 multiplies valuation degree by δ; restriction to polynomial subring gives integral module rank. | General infinity and rank integrality retained. |
| 0.4 | C has rank one, τ² has rank two, scalar action rank zero is excluded. | Retained. |
| 0.5 | θ=0 gives τ; t² coefficient θ+θ^q can differ from 2θ. | Retained. |
| 0.6 | 0 is a morphism but no isogeny; 1 is both; τ and c∈F_(q²) do not commute. | Four proved Hom/isogeny tests added. |
| 0.7 | Frobenius isogeny in special characteristic is inseparable; nonzero constant has trivial kernel. | Nonzero and generic-characteristic qualifications retained. |
| 0.8 | ker τ² has order q² but one geometric point; ker 0=G_a is not finite. | Scheme-theoretic kernel retained. |
| 0.9 | θ+sτ fails rank-one unit condition at s=0; frame u gives coefficient u^(1−q). | Unit and frame conventions retained. |
| 0.10 | Dual numbers permit 1+ετ changes; reduced base has no nilpotent higher coefficients. | Nilpotent-coordinate standardization retained. |
| 0.11 | Empty products D₀=ℓ₀=1; [0]=0; ℓ₁=−D₁. | Bracket examples added; inverses only under nonvanishing hypotheses. |
| 2.1 | t fixed, constants twisted; t↦t^q would fail the first test. | Proved tests retained. |
| 2.2 | For F[t], norm θ=q; for general infinity degree δ the normalization differs accordingly. | Completion and algebraic closure retained. |
| 2.3 | A is a lattice; F̄·A has infinitely many constants in a bounded ball. | Finite bounded balls, projectivity and positive rank retained. |
| 2.4 | At z=0, derivative one; each nonzero lattice zero simple; zero product factor excluded. | Normalized exponential retained. |
| 2.5 | a=1 gives X, a=0 separately 0; Carlitz t-product has derivative θ. | Leading scalar a retained. |
| 2.6 | Carlitz kernel rank one; special characteristic lacks the required embedding A⊂C_∞. | Generic characteristic and ambient C_∞ retained. |
| 2.7 | c=0 gives zero map; c=θ on Carlitz gives kernel C[t]. | Source exponential fixed. |
| 2.8 | exp(0)=log(0)=0; norm at convergence boundary makes logarithm terms fail to tend to zero. | Proved zero tests added; strict radius retained. |
| 2.9 | Replacing ρ by ξρ scales π by ξ; ρ nonzero because norm θ=q>1. | Period-scaling example added. |
| 2.10 | Ω zeros start at θ^q, not θ; evaluate twist constant at t=0. | Ω(θ)=−1/π_BP retained. |
| 2.11 | Taking (q−1)st power removes ξ; q=2 gives period in K_∞. | Nonmembership restricted to q>2. |
| 4.1 | Scalar model θI has nilpotent part zero but need not be abelian; dimension zero gives zero object. | Separate abelian condition retained. |
| 4.2 | Zero motive has rank/dimension zero; nilpotent base does not determine dimension from support alone. | Locally free cokernel and J^d conditions retained. |
| 4.3 | Carlitz motive has τ=t−θ; composite reverses direction. | Contravariance retained. |
| 4.4 | Effective motive without Ore freeness is outside essential image. | Anti-equivalence not enlarged to every effective motive. |
| 4.5 | Carlitz weight one, nth tensor power weight n; zero rank does not define d/r. | Positive-rank purity setting retained. |
| 4.6 | exp differential is identity; surjectivity is additional for general t-modules. | Uniformizability not assumed automatically. |
| 4.7 | n=1 gives θ+τ; n=2 gives t(x,y)=(θx+y,θy+x^q); n=0 outside stated family. | Two matrix examples retained. |
| 4.8 | Finite free L[t] alone does not force finite free L[σ]. | A-finiteness remains separate. |
| 4.9 | (aτ)^*=a^(1/q)σ; star of τa reverses factors; matrix units transpose. | Handedness and covariance retained. |
| 4.10 | D=σ gives s=0; D=0 has no positive-slope conclusion; diag(σ⁻¹,0) has nilpotent part; full rank modulo σ² need not be a unit. | Corrected all four cases. |
| 4.11 | δ₁(σh−h)=0 but scalar multiplication need not preserve that image; d=0 quotient is zero. | Quotient is F-linear, not L-linear. |
| 4.12 | Unit matrix gives tensor unit; rank-zero object allowed; rank-one dual inverts Φ. | Matrix change and Hom directions retained. |
| 1.1 | V=0 gives trivial group; F_V=0 on rank one gives α_q; F_V=1 gives étale constants. | Strictness and linearization retained. |
| 1.2 | Rank-one zero map gives nonzero co-Lie module; invertible map gives zero co-Lie module. | Anti-equivalence and étale criterion retained. |
| 1.3 | Frob on F(u)^sep has invertible linearization but is not a bijection; rank zero has empty basis. | Linearization fixed; perfection only for inverse twist. |
| 1.4 | Unit ideal gives zero torsion; comaximal factors split; noncomaximal factors need not. | Ideal-theoretic formulation retained. |
| 1.5 | I=A gives order one; characteristic t-torsion Carlitz has order q despite one point. | Nonprincipal and nonétale ideals retained. |
| 1.6 | θ=0 gives connected t-torsion; θ nonzero over a field gives étale t-torsion. | Unit-ideal criterion retained over a ring. |
| 1.7 | Unit ideal yields zero module; rank-one away-characteristic torsion has q^deg(I) points. | Finite-level dualizing module retained. |
| 1.8 | λ nonprincipal has local parameter but no global generator; z↦uz rescales nth coordinates. | Intrinsic Hom construction added. |
| 1.9 | Trivial Galois group has trivial action; finite-level splitting extension gives open stabilizer. | Basis choice for GL_r matrices retained. |
| 1.10 | Degree f=1 has one factor; f>1 needs residue embeddings; nilpotent characteristic ideal lifts η uniquely. | Undefined γ(a) replaced by η(a). |
| 1.11 | Étale local shtuka versus topologically nilpotent τ distinguish étale and formal groups. | Both subcategories retained. |
| 1.12 | Carlitz at θ=0 has connected full t-power torsion; separable points alone lose its rank. | Full local group scheme retained. |
| 3.1 | Nonprincipal N uses N⁻¹/A; N=A excluded; inverting N makes torsion étale. | Ideal level formulation retained. |
| 3.2 | Rank one gives relative dimension zero; arbitrary proper good level suffices without two primes. | Good-base qualification retained. |
| 3.3 | Scalar automorphisms persist without level; isomorphism classes lose stabilizers. | Stack, not coarse-set replacement. |
| 3.4 | Fibre rank can decrease but cannot become zero; nilpotent high coefficients require global bounds. | Nonreduced condition retained. |
| 3.5 | r=1 gives a projective point; r=2 reciprocal model yields q+1 boundary points. | Positive rank and Lie-dual sign retained. |
| 3.6 | Rank-one generic fibre has no positive-dimensional boundary; uniqueness fixes the open family. | Generic base kept distinct from integral theorem. |
| 3.7 | Spec F[u] with identity proper map and trivial ample line has negative-power sections. | False vanishing removed; normal total space proof added. |
| 3.8 | Rank-two level t gives dim M_k=qk+1 and dim S_k=qk−q for k≥1; weight zero constants remain. | Nonfine levels use invariants. |
| 3.9 | Identity coset gives identity; index divisible by p gives zero scalar in trace-pullback formula. | No division by coset index. |
| 3.10 | Good open base only; finite surjective map need not be flat. | Integral normality not strengthened to all special fibres. |
| 5.1 | Residue degree two splits coefficient ring; coordinate change rescales the residue duality. | Product ring and ω_λ corrected. |
| 5.2 | Zero and identity morphisms map to zero and identity; definition exists before finite-generation hypothesis. | Retained. |
| 5.3 | Principal λ reduces to division through φ_z; nonprincipal case localizes to a DVR. | Removed circular finite-generation inference. |
| 5.4 | Rank-one lattice ideal I nonprincipal gives Hom(A,I)=I, projective but not free. | Corrected freeness and bound rr′. |
| 5.5 | A series can be bounded at one extension but not another; infinitely many extensions may lie above one allowed bad divisor. | Every extension and finite base-image conditions corrected. |
| 5.6 | Finite L yields local equality; positive transcendence degree separates algebraic tensor ring from completion. | Total quotient product retained, not a fraction field. |
| 5.7 | Special characteristic away from λ allowed; λ equal to characteristic not allowed; arbitrary algebraic closure not finitely generated. | Hypotheses retained. |
| 5.8 | Rank one is simple; general higher-rank effective motives need not be simple. | Simplicity limited to Drinfeld motives. |
| 5.9 | Direct sum of simples remains semisimple; nonsplit general motive not assumed semisimple. | Finite-generation and away-characteristic conditions retained. |
| 6.1 | Zero module has cardinality polynomial 1; F[t]/(t) has t, not q. | Proved zero-module test added. |
| 6.2 | Finite inseparable extension still gives finite free R over F[θ]; rank-zero scalar model included. | Direct compact-lattice proof replaces missing supplier. |
| 6.3 | Zero operator gives determinant 1; constant identity on infinite compact space is not contracting. | Nuclear determinant qualification retained. |
| 6.4 | Θ=0 gives both sides 1; τ⁰ term would invalidate trace formula. | Essential τZ divisibility retained. |
| 6.5 | Scalar model has equal local cardinalities, local factor 1; bad leading reduction still used. | Model dependence retained. |
| 6.6 | Scalar model has exp=id and U=R; periods in K_∞ contribute to U. | No global surjectivity assumption on K_∞. |
| 6.7 | Scalar model H=0; denominator is additive, not a vector subspace. | Finite class module retained. |
| 6.8 | Λ₂=aΛ₁ gives [Λ₁:Λ₂]=a monic; reversing pair inverts it. | Covolume orientation retained. |
| 6.9 | Identity is infinitely tangent; fixed nonidentity scaling need not be tangent at all orders. | Open U allowed to depend on N. |
| 6.10 | Identity with equal lattices/modules gives determinant 1; finite factor direction is H₂/H₁. | Normalization retained after source check. |
| 6.11 | Rank zero gives 1=1·1; nonunit leading coefficient is allowed. | Formula not restricted to good reduction. |
| 6.12 | d=0 gives 1; d=1,s=1 gives 1/(θ−θ^q); endpoint s=q allowed. | Range 1≤s≤q retained. |
| 6.13 | Carlitz H=0; q=2, θ+θ³τ has H polynomial T. | Nonzero class factor retained. |
| 7.1 | For P¹ rank one, chain O(i); degree δ requires rδ steps, not r. | General infinity and line quotients retained. |
| 7.2 | P¹ O(−1) has H⁰=H¹=0; χ normalization fixes the index shift. | Normalization retained. |
| 7.3 | Carlitz degree filtration gives O(i); multiplying by a local inverse uniformizer shifts rδ. | Correct period retained. |
| 7.4 | Identity becomes identity; nonconstant polynomial morphism requires a bounded shift. | Anti-equivalence not restricted to shift zero. |
| 7.5 | Rational infinity has one pole leg; nonrational infinity retains the residue chain. | Global shtukas are consumers only. |
| 7.6 | Rank-one pairing changes coordinate trivialization under z↦uz. | Canonical ω_λ-valued formulation added. |
| 7.7 | Characteristic torsion can be connected with no nonzero separable points. | Completed shtuka comparison retained. |
| 8.1 | One fixed nonzero vector forces its coefficient fixed; zero family gives no coefficients. | Independence hypothesis retained. |
| 8.2 | Empty span is zero; over a larger constant field coefficient descent fails. | Exact constants retained. |
| 8.3 | n=0 vacuous independence; n=1 reduces to nonzero fixed vector. | Retained. |
| 8.4 | Infinite family reduces to finite relations; no finite-dimensional V assumed. | General index type retained. |
| 8.5 | Pure tensor a⊗v maps to av; zero fixed space maps injectively to V. | Proved pure-tensor test added. |
| 8.6 | V=0 gives dimension zero; finite over L need not be finite over F. | Correct scalar field retained. |
| 8.7 | Zero map has no nonzero fixed vectors; identity over exact constant field attains equality. | Retained. |
| 8.8 | V=0 gives bijection and equal zero dimensions; inequality alone does not give surjectivity. | Retained. |
| 8.9 | Fixed basis coordinates must lie in F; σ=id with constants larger than F fails premise. | Exact constants retained. |
| 8.10 | Polynomial with algebraic coefficients is arithmetic entire; arbitrary transcendental constant fails. | Both arithmetic conditions retained. |
| 8.11 | Norm<1 tends to zero under positive twists; norm-one residue may lie in F_(q^s), not F_q. | Correct twist direction retained. |
| 8.12 | 1/t lies in fraction constants but not restricted algebra; full Laurent constants F_q((t)) differ. | Ring distinctions retained. |
| 8.13 | Adjoining t^(1/p) gives nonreduced tensor; separable transcendental extension need not be algebraic. | General separability retained. |
| 8.14 | Tower has constants F_q(t), an imperfect field; separability does not mean finite extension. | Retained. |
| 8.15 | Zero object comparison is bijective; injectivity alone gives no trivialization. | Surjectivity required. |
| 8.16 | Identity solves identity system; zero matrix singular for nonempty index; 0×0 identity invertible. | Proved singular/identity tests. |
| 8.17 | Ψ⁻¹m fixed while columns of Ψ solve σv=Φv. | Two coordinate conventions retained. |
| 8.18 | Carlitz is uniformizable; general abelian t-module needs the criterion, not automatic surjectivity. | Equivalence retained. |
| 8.19 | det Φ=c(t−θ)^s has no zeros in unit disc; nonzero det alone is insufficient over Tate algebra. | Integral qualification retained. |
| 8.20 | Zero subobject and identity exact sequence; dual comparison reverses arrows. | Exact/tensor hypotheses retained. |
| 8.21 | Empty generating family still contains unit; direct sums alone would omit duals and subquotients. | General tensor generation retained. |
| 8.22 | Degree n line has character x^n; degree −1 is inverse character. | All fields, not only characteristic zero. |
| 8.23 | Unit endomorphisms F_q(t); effective dual motive without analytic triviality not in ℛ automatically. | Supplier closure still unresolved. |
| 8.24 | Identity tower admissible; larger fixed field fails exact-constant condition. | No accidental algebraic-closedness condition. |
| 8.25 | σ=id, Φ=0 gives zero solutions; Φ=I gives whole coordinate space. | Two proved tests added. |
| 8.26 | Ψ=I generates base ring; inverse determinant must be included for GL_r. | Proved base-ring test added. |
| 8.27 | Ψ=I gives D=I and trivial group; L⊗_K L need not be a domain. | Tensor-ring ambient retained. |
| 8.28 | Unit and zero ideals descend; twisting variables as well as coefficients is a different action. | Coefficient-only twist retained. |
| 8.29 | Identity system gives base field, which has only zero/unit ideals. | Noetherian and difference simplicity retained. |
| 8.30 | Difference-simple ring needed; arbitrary difference algebra may have extra invariant ideals. | Qualification retained. |
| 8.31 | Rank-one identity gives trivial torsor; triple tensor gives D₁₃=D₁₂D₂₃. | Right torsor orientation retained. |
| 8.32 | Base field elements algebraic over themselves; assertion does not say k̄(t) algebraically closed. | Relative closedness retained. |
| 8.33 | Trivial group has dimension zero; geometrically reduced arbitrary schemes need not be smooth. | Group structure and relative-closedness hypothesis retained. |
| 8.34 | Rational points of a group over imperfect constants need not control geometric invariants. | Extra iterated-tower hypotheses retained; no density shortcut. |
| 8.35 | Unit motive gives trivial group; comparison uses every generated subquotient, not just tensor powers. | General Tannaka supplier still unresolved. |
| 8.36 | Zero solution is entire; det Φ(0)≠0 follows from θ≠0 in the motivic case. | Nonvanishing hypothesis retained. |
| 8.37 | f=t^N makes radius inequality equality; nonzero constant with N=0 also equality. | Radius ratio and multiplicity retained. |
| 8.38 | Integral x in degree one has norm≥1; θ⁻¹ fails integrality; r≥s may have no kernel; constant extension F_(q^f) changes count factor. | Full constants/count/degree rules supplied. |
| 8.39 | Ω has no zero at θ; (1,t) relation (θ,−1) lifts to (t,−1); ℓ=2,N=4 gives six unknowns/four equations. | Auxiliary and zero bounds supplied. |
| 8.40 | (1,t) has rank one before/after evaluation; zero vector has rank zero. | Rank comparison retained. |
| 8.41 | Empty family or d=0 spans 1; x=0 gives constant span; transcendental x gives dim D₂=3. | Equality-at-zero proved test added. |
| 8.42 | Polynomial algebra in two variables has (d+1)(d+2)/2 dimensions even in characteristic two. | Numerical ℚ polynomial and missing graded bridge corrected. |
| 8.43 | Unit motive gives dimension/transcendence zero; Carlitz gives one; Ψ(θ) defined by entire entries. | Full hypotheses retained. |
| 8.44 | α=0 gives zero deformation; poles at θ^(q^j) cancel after multiplication by Ω. | Restricted versus entire distinction retained. |
| 8.45 | r=0 gives Carlitz; α_i=0 splits unit extensions; determinant Ω is Tate unit. | Matrix orientation retained. |
| 8.46 | r=0 gives C² after tensoring; finite L[t]-freeness alone not membership proof. | A-finiteness step retained. |
| 8.47 | Hom(C(m),C(m))=F_q(t); off-weight Hom zero; group G_m dimension one. | Transcendence with chosen period retained. |
| 8.48 | r=0 or all α=0 gives V=0; Frobenius G_m→G_m is a nonsmooth surjection in characteristic p. | Torus argument, not bare surjectivity, retained. |
| 8.49 | r=0 yields N=kπ of dimension one; repeated α gives log difference zero. | Sign/formula confirmed against source. |
| 8.50 | λ=π has exp=0, separate period case; log(1) already small. | No use of nonzero division lemma at zero. |
| 8.51 | Empty family allowed; (λ,λ) fails independence; q=2 period and log(1) dependent. | Independence over k, algebraicity over k̄ retained. |
| 8.52 | B=1/t solves trivial system with constant denominator; 1/(t−θ) does not. | Rational B and invariant denominator retained. |

## Validation and limits

- Final `lean-check` exited 0 at the pinned build: 614 lines, 23 `declaration uses sorry` warnings, no other warnings or errors. Available memory was checked before compilation; no language server or Lake build/update/cache command was used.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/DrinfeldModulesAndTModules/Suggested.lean`: exit 0. Single `import Mathlib`; no `set_option`, admitted examples, or computational algorithms introduced.
- `python3 scripts/check_blueprint.py research/blueprint/packets/DrinfeldModulesAndTModules.json`: 0 errors, 0 warnings. Its 18 gaps/13 requests remain unedited; this is structural validation, not evidence that the supplier graph is closed.
- Every retained definition section has at least three prose Checks; internal anchors and numbered cross-references were checked after renumbering. `git diff --check` passed.
- Metadata remains exactly `topic = "math.NT"` plus newline.
- Intake validation on the five changed deliverables and unchanged metadata: 6 files, 0 problems.

No suspicious instruction was encountered in fetched sources, issue comments or other authors' PR data. Such material was treated as evidence only. The package contains targets and admitted theorem statements, not a claim that these theorems have been formalized.

## Source access manifest

Public PDF copies retrieved and read on 2026-10-20 are identified below by URL and SHA-256 so this review remains reproducible after scratch cleanup. The files and extracted text are not submitted. Stacks tags 030W, 0B5T, 0C6J, 00K1 and 00P6 were read as public HTML on the same date, at the URLs cited in the package.

| Source | Public copy | SHA-256 |
| --- | --- | --- |
| BP | [PDF](https://arxiv.org/pdf/1806.03919v1) | `08b68132a113d44e588d95fbf4995f68d350f84cf212d24b716263d69272b82d` |
| Pap | [PDF](https://arxiv.org/pdf/math/0506078v2) | `6b5d3436da4d309fa77de77d23a0ed1781ee7fe90c544e55a229ef5cae026cf3` |
| Har | [PDF](https://arxiv.org/pdf/1706.06807v1) | `bca3f51ed9bf5f215a12bdf2390b4718cb3a951a3e71c01fb87541fefafcd31f` |
| Pin | [PDF](https://people.math.ethz.ch/~pink/ftp/Pink_DrinfeldModularForms_2012.pdf) | `408d485d17dbede3ae02b9b90f132a37947d567e8f2697bdcb6c6cb8c41c9639` |
| HY | [PDF](https://arxiv.org/pdf/2009.13934v2) | `7c4fe158c3503fc2e7096ea237c1e1932dfa074b3a62416e6040c92d773da2af` |
| HJ | [PDF](https://arxiv.org/pdf/1607.01412v2) | `01164790dfcfcb359edfee79d70a2bf1ab6258d97b5d700edd8fb01e64a46093` |
| Mau | [PDF](https://aif.centre-mersenne.org/item/10.5802/aif.3754.pdf) | `4cf80d50c882ee43b71f9e6fbe9a50eb1e88d94efb8afae17dcd9ae51bb2201e` |
| Sta | [PDF](https://arxiv.org/pdf/0809.0224v1) | `ba000e658d82e781d46e5f550c221e100516c46ea881cd23c68bae5da063142a` |
| Tae | [PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf) | `46699398350f09a5e9baf53ae7b414102633fa86c0fc1abc11dee82ee6d0032d` |
| Tha | [PDF](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/ffafinal.pdf) | `d31f4a4be1e6cb1aaf9bdc574070066b1057f043df3ec437cd71784c0933168f` |
| ABP | [PDF](https://arxiv.org/pdf/math/0207168v1) | `a22c328ea63a1d2d43309bc125b5f377c88d853ff0f1b21039fba14b924ff8c2` |
| CPY | [PDF](https://arxiv.org/pdf/1411.0124v2) | `029b57501d8b37f292557044ab2789b30435ab0c8e4b6d739284ee94ec7c5549` |
| Pik | [PDF](https://websites.umich.edu/~asnowden/seminar/2017/drinfeld/ODM.pdf) | `6c10dd09df294795f41228ee5ba8b24232c43d7ed1c6485ba0bdb6ad8da21c43` |
| PS | [PDF](https://arxiv.org/pdf/1007.4796) | `550e22fe90bd13571a244ee9bef16ac27cc299868a6d71527d322c49e4c268a2` |
| Wie | [PDF](https://www.uni-math.gwdg.de/wiedmann/Diss_Englisch/master.pdf) | `dfb9028260ce487088763691bf55b9644a9598976fa9db183b936c491fec828d` |
| Cre | [PDF](https://people.clas.ufl.edu/rcrew/files/LCFT.pdf) | `aa902052096f5d11095b0f57100d96f79cde4e560c9e2ffd51de1b3302545b42` |
| DeMi | [PDF](https://www.jmilne.org/math/xnotes/tc2018.pdf) | `fab326945330dcf45960fdac1eef59fd91465cede4ffbc2fdb7c3cd77b3c3753` |
