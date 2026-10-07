# Independent review: GL₂-type abelian varieties

Job `REV-DESIGN-EllipticCurveModularityPartIIGL2TypeAbelianVarieties`, issue #6906. Reviewer: Codex, session `codex-xW1MVH`, 2026-10-07. The input design was written by Claude Code Opus 5.5, session `claude-hllDxz`, for #6899. This is a completed independent review, not a checkpoint.

## Verdict and counts

**Needs changes.** The mathematical corrections are applied in the packet, roadmap definition, reader and suggested-file fragments where applicable. The remaining problem is substantive: the suggested file asserts geometric theorems for an arbitrary private `AVContext` with no laws connecting its dimensions, endomorphisms, Tate modules, Jacobians and newforms. For example, its context permits a constantly zero dimension function, contradicting its J₀(11) example. Compiling that file does not check signatures on the pinned abelian-variety and newform carriers. Its private H² also duplicates an existing baseline carrier. Nine nodes cannot be verified to the advertised API/test standard. Every node now has honest `suggestedCoverage` metadata, and three precise gaps describe the required revision.

The review retains **44 nodes**: 3 definitions, 3 constructions, 3 lemmas, 34 theorems and 1 application. There are **24 verified, 11 corrected and 9 unverifiable** per-node decisions. The unverifiable decisions include mathematical corrections where noted; “verified” concerns the source statement and target-level proof outline, not an implementation or the unlawful prototype. The global prototype gap applies to all 44 nodes. There are 39 API items, 24 tests (four for each of the six definitions/constructions), 14 planets, 19 baseline declarations, 14 requests, six stages and three newly recorded gaps. No nodes were added, removed or split. No original baseline citation was removed or replaced; two were added.

The packet remains a **complete target-level pass**, and each of GT.1–GT.6 remains **planned**, with precise remaining obligations. Every stage target is realised by a node; no stage is closed and no implementation is claimed. Protocol §0 permits this status with recorded gaps. The verdict rests on the unverified prototype/API claims, not on missing proofs or the mere existence of gaps.

## Sources and mathematical corrections

Read all 44 nodes’ locators and excerpts in the five public source texts. Original PDF hashes agree with the packet; the review adds one Carayol excerpt (74 total). Mathematical bars, inverse superscripts and Greek letters were checked against the source where text extraction loses them, including Ribet p.14’s inverse-index map. The public versions used are:

- [Khare–Wintenberger I, author copy](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §5 pp.7–9 and §10 pp.19–21.
- [Ribet, author manuscript](https://math.berkeley.edu/~ribet/Articles/korea.pdf), §§1–8, especially §§2–4, 6–7.
- [Carayol, published Numdam PDF](https://www.numdam.org/item/ASENS_1986_4_19_3_409_0.pdf), introduction §§0.1–0.10, pp.409–412.
- [Freitas–Le Hung–Siksek v4](https://arxiv.org/pdf/1310.7088v4), §1 and §§11–12.
- [Caraiani–Newton v3](https://arxiv.org/pdf/2301.10509v3), §1, Corollaries 7.2.5 and 7.3.4 (pp.97–98).

Clear corrections made, without splitting target-level nodes:

1. **inner-twist-field**: Supply square roots of the finite-order character values by adjoining all roots of unity.
2. **serre-witnesses**: Specify the common residual coefficient field and the integral-model/determinant inputs.
3. **fixed-newform**: Justify residue-field descent after fixing f and discarding finitely many primes.
4. **coefficient-identification**: Identify characters from the characteristic-zero trace comparison, rather than inferring determinant congruences from trace congruences.
5. **modularity-equivalences**: Replace the unsupported call to the infinite-congruence node in the single-λ implication by equality of embedded trace fields.
6. **modular-parametrisation**: Insert the level-M degeneracy quotient for the specified ambient level N.
7. **strict-compatibility**: Allow a finite coefficient extension to realise all local WD parameters; distinguish good-prime rationality and coefficient-prime local compatibility.
8. **l-function**: Pin the normalised Fricke operator and weight-two factor; prove the sign by applying the functional equation twice and using nonvanishing.
9. **q-curve**: Replace the false unsquared-trace non-example by the non-CM squared-trace obstruction, give an opposite-trace twist counterexample, and import the CM constructor’s supplier.
10. **ribet-cocycle**: Prove invariance under a geometric quasi-isogeny after extending the field; repair the twist test’s field of definition and import the existing cohomology carriers.
11. **lie-free-rank-one**: Correct the inverse-index map and spell out its equivariance computation and semisimple-module descent.
12. **quadratic-q-curves**: Restrict the real-quadratic endomorphism-field conclusion to nonsquare m.
13. **twisting-lemma**: Use the same character convention on the Hom line in both proof steps.
14. **q-curve-automorphy**: Transport the finite-order twist algebraically and compare the family before choosing a new auxiliary prime for each local factor.
15. **quadratic-q-curves-modular**: Separate the split and nonsplit endomorphism cases in the imaginary-quadratic strengthening.

The fixed-newform correction uses finitely many good-prime coefficients generating K_f and excludes primes dividing the index of their order before descending to F_ℓ. The coefficient-identification correction does not infer determinant congruences from trace congruences; characteristic-zero semisimple recognition gives the character comparison. The modular-parametrisation correction uses a newform at level M dividing the stated ambient N and the degeneracy quotient J₁(N)→J₁(M), with the same adjustment for Γ₀.

For strict compatibility, Carayol §0.6 and Theorem A permit a finite coefficient extension for simultaneous realisation of local WD representations. R19.3 supplies the full modular-form system, including coefficient-prime compatibility; Carayol’s away-from-ℓ theorem alone is not assigned that role. Good Frobenius polynomials stay E-rational. The request to ModularForms Layers 6–7 now specifies the normalised Fricke operator and weight-two i² factor. The continuous-cohomology request now specifies the canonical carrier, additive coefficient modules, degree-two dictionary and inflation.

The repaired Q-curve non-example uses unequal **squared** traces and assumes non-CM. Its positive counterexample is the √2 twist of y²=x³−x+1: the two reductions at 7 have 4 and 12 points, hence traces 4 and −4. The suggested file checks these finite counts with `by decide`. This establishes why unequal unsquared traces do not obstruct a geometric isogeny. A geometric twist’s trivial cocycle test must first enlarge to a finite Galois field containing the twisting isomorphism. The cocycle data now explicitly requires dimension one, non-CM and a finite Galois field; these additions do not cure its missing geometric coherence.

## Baseline verification and ownership

Read every declaration’s full statement at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 17 original references are confirmed for their limited advertised use. In particular, native abelian-variety dimension is `WithBot ℕ∞`, not the prototype’s unconstrained ℕ field; Newform supplies away-from-level eigenform data, not every later Hecke/geometry theorem; and Schur’s scalar-commutant theorem requires finite dimension and an algebraically closed scalar field.

| Declaration | Pinned module | Confirmed use |
| --- | --- | --- |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety` | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean` | Abelian variety over a field K: a group object in Over (Spec K), proper and geometrically integral (bundled); smoothness, connectedness and commutativity derived |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace` | `TauCeti/AlgebraicGeometry/AbelianVariety/TangentSpace.lean` | The tangent space at 0 (Zariski tangent space at the zero point), the Lie algebra Lie(A/K) used in the Lie-algebra divisibility argument |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny` | `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean` | Isogenies of abelian varieties over a field (finite surjective homomorphisms) |
| `tauceti:HeckeRing.GL2.Newform` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean` | Bundled newforms of level N and weight k: Hecke eigenform away from the level, new, normalised a₁ = 1 |
| `tauceti:cuspFormCharSpace` | `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean` | S_k(N, χ) as the joint diamond-operator eigenspace in S_k(Γ₁(N)), χ : (ℤ/N)ˣ →* ℂˣ |
| `mathlib:CongruenceSubgroup.Gamma1` | `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean` | The congruence subgroup Γ₁(N) of SL₂(ℤ) |
| `mathlib:cyclotomicCharacter` | `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean` | The ℓ-adic cyclotomic character (L ≃+* L) →* ℤ_ℓˣ |
| `mathlib:DirichletCharacter` | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | Dirichlet characters as multiplicative characters of ℤ/n, the form of the nebentypus ε |
| `mathlib:NumberField.IsCMField` | `Mathlib/NumberTheory/NumberField/CMField.lean` | CM fields: totally complex quadratic extensions of their maximal real subfield |
| `mathlib:NumberField.IsTotallyReal` | `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean` | Totally real number fields: every infinite place is real |
| `mathlib:Field.absoluteGaloisGroup` | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean` | The absolute Galois group G_K = Aut(K̄/K) with its Krull topology |
| `mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing` | `Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean` | Wedderburn–Artin: a semisimple algebra is a finite product of matrix algebras over division algebras |
| `mathlib:IsSemisimpleModule` | `Mathlib/RingTheory/SimpleModule/Basic.lean` | Semisimple modules (complemented submodule lattice), the form of Faltings' semisimplicity |
| `mathlib:IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed` | `Mathlib/RepresentationTheory/AlgebraRepresentation/Basic.lean` | Schur's lemma over an algebraically closed field: the commutant of a finite-dimensional simple module is the scalars |
| `mathlib:LinearMap.bijective_or_eq_zero` | `Mathlib/RingTheory/SimpleModule/Basic.lean` | Schur's lemma: a linear map between simple modules is bijective or zero |
| `mathlib:traceForm_nondegenerate` | `Mathlib/RingTheory/Trace/Basic.lean` | The trace form of a finite separable field extension is nondegenerate |
| `mathlib:WeierstrassCurve.IsElliptic` | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | Elliptic Weierstrass curves (unit discriminant), the elliptic curves of GT.5 |
| `mathlib:continuousCohomology` | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean` | Continuous cohomology in degree n of a TopRep, as the homology of homogeneous cochains in TopModuleCat; the canonical H² carrier, not its inflation/comparison API. |
| `tauceti:TauCeti.ofDiscreteModule` | `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean` | A discrete module with a G-action as a TopRep; joint continuity/smoothness is a separate hypothesis, automatic for the trivial action used here. Use Additive ℚˣ or Additive ℚ̄ˣ with discrete topology for the multiplicative coefficients. |

The two additions are `continuousCohomology` and `TauCeti.ofDiscreteModule`. The latter makes a discrete module into a TopRep; joint continuity/smoothness is separate, and the intended trivial action satisfies it. Use `Additive ℚˣ` and `Additive ℚ̄ˣ` with discrete topology. Their existence does not supply the degree-two cocycle dictionary or inflation automatically; those remain the precise upstream ProfiniteCohomology request. A second private quotient called H² is not an acceptable baseline adapter without that comparison.

Read the reviewed `data/library-coverage.json` and the supplier statements for all 66 original external node references, plus the three added CM.1 references. The new CM dependencies supply the ideal-lattice elliptic curve, Picard classification and ideal isogenies needed for the CM Q-curve constructor; they do not re-plan CM theory here. The added direct coefficient-generation, modular-quotient, Hecke-prime and semisimple-recognition dependencies support the repaired proofs. Read the relevant upstream ModularForms, Chebotarev, ProfiniteCohomology and ClassFieldTheory contracts and the whole JacobianChallenge and Multiquadratic examples. All 14 requests have a named owner, precise output and consumers. A3 finite subgroup quotients and A6 complex comparison are requests, not claims that the current supplier packets already prove them.

The six layers are ordered appropriately: endomorphism algebra → local systems → modularity → local/analytic consequences, with a separate Q-curve construction followed by field-of-definition automorphy. The GL₂-type definition, A_f, Tate components, CM theory and general cohomology stay with their owners. No audited existing declaration is planned anew. The 14 planets are mathematical definitions, constructions or named central theorems, with at most six in a layer. No change of granularity or planet assignment is needed.

## API, tests and remaining revision

The six mathematical API outlines contain constructors, invariance/characterisations, coefficient structures and compatibility. Their four tests each cover meaningful positive, compatibility and negative behavior on paper. The suggested fragments do not implement that full outline. The three packet gaps require:

1. Replace the unconstrained `AVContext` and mirrored GL₂/newform/representation objects by pinned carriers and the owners’ interfaces. Carry `IsElliptic` on Weierstrass adapters, coherent base change/conjugation and the actual finite-dimension bridge. Omit unstateable clauses explicitly instead of presenting universal false-context theorems.
2. Restore Tate compatibility of endField isogenies, the Hecke action and T₂ identification in the J₀(23) tests, the elliptic curve-morphism modularity equivalence, X₁(N)/cusp/zero value/generating image in parametrisation, its parent comparison, and R-equivariance in Proposition 6.5. Give concrete pinned objects, not arbitrary-context examples.
3. Use the baseline cohomology carrier and its requested dictionary; make the non-CM identification of rational endomorphisms and scalar extraction well typed, with coherent conjugation and faithful geometric base change. `Classical.epsilon` cannot manufacture a rational scalar from unrelated private fields.

These gaps identify work for a revision, not missing implementation proofs to be replaced by more `sorry`. All `implementationStatus` entries remain `unchecked`. No new general theory or lemma-level node is demanded.

## Source issues

**E1 confirmed, scoped to the author copy.** KW §10.2 p.21 prints the grammatical typo “We recall than”. The correction changes no mathematics. The published text was not available for full-text comparison, so this is not asserted of its pagination or wording.

**E2 rejected.** Ribet’s good-prime compatibility and KW’s local WD convention differ. This establishes a needed blueprint prerequisite, but neither a compressed background argument nor the absence of that argument from Ribet establishes a mistake in KW’s corollary. The finding gives no counterexample or reason ruling out a geometric argument or an enlarged coefficient field. The direct Serre/Ribet modularity route remains valid. SourceIssues carries the independent verdicts and reasons, and the reader marks the original allegation rejected.

The review checked the author’s papers page, publisher metadata and the repository’s correction records for a published correction. No correction for these passages was located. The publisher PDF was not obtained, and no published/author-copy collation is claimed. No new published mathematical mistake was established by this review; the corrected trace test and inverse-index formula are errors in this blueprint.

## Per-node decisions

The notes below distinguish checked target-level mathematics from the universal prototype limitation. “Unverifiable” identifies the nine nodes with substantive API/test or geometric-coherence obligations after the clear corrections.

| Node | Verdict | Review basis |
| --- | --- | --- |
| `GT.1/lie-algebra-divisibility` | verified | Ribet §2 p.2: faithful division-algebra action on the rational Lie space gives divisibility; tangent carrier and A6 action contract checked. |
| `GT.1/primitive` | unverifiable | Power, E-action and basis independence agree with Ribet §2; arbitrary product/dimension stand-ins and weakened J₀(23) example prevent validating the suggested API. |
| `GT.1/ribet-theorem-2-1` | verified | Ribet Theorem 2.1: commutant, Poincaré decomposition and dimension divisibility justify the matrix algebra and three equivalences at target level. |
| `GT.1/endomorphism-field` | unverifiable | Ribet §3 field/degree outline is sound; Tate functoriality and actual Hecke T₂ test are omitted from the suggested signatures. |
| `GT.1/totally-real-or-cm` | verified | Ribet §3 pp.4,6: Rosati restriction is the canonical involution; pinned totally-real/CM definitions and A2 positivity hypotheses checked. |
| `GT.1/modular-quotient-is-gl2-type` | verified | Ribet §3: K_f action, dimension and multiplicities use R14.5 and upstream old/new decomposition; no new definition of A_f is planned. |
| `GT.2/integral-model` | unverifiable | Ribet p.7 lattice enlargement and A3 quotient request are precise; the private integralEnd/Tate context does not validate the integral-model or residual API. |
| `GT.2/frobenius-polynomial` | verified | Ribet p.4 good-prime E-rational polynomial, integrality and purity agree with A6 trace/degree and R01.6 coefficient decomposition. |
| `GT.2/determinant-character` | verified | Ribet Lemma 3.1 retains finite-order, unramified and totally-real triviality assumptions; Hodge–Tate and character suppliers checked. |
| `GT.2/odd` | verified | Ribet Lemma 3.2: requested equivariant complex comparison identifies real Frobenius and forces one positive and one negative eigenvalue. |
| `GT.2/absolute-irreducibility` | verified | Ribet Proposition 3.3 uses Faltings semisimplicity, the coefficient commutant and Schur over the algebraic closure; no unconditional lattice simplicity is asserted. |
| `GT.2/coefficient-conjugation` | verified | Ribet Proposition 3.4 uses a polarisation and duality; the bar convention matches the source’s canonical involution. |
| `GT.2/coefficients-generate` | verified | Ribet Proposition 3.5: trace-field descent and the coefficient commutant force the full endomorphism field; omission of any finite set of primes is retained. |
| `GT.2/inner-twist-field` | corrected | Corrected Proposition 3.6 proof to adjoin all roots of unity as well as square roots of t_p, allowing square roots of ε(p). Added direct determinant prerequisite. |
| `GT.2/residual-irreducibility` | verified | Ribet Lemma 3.7 uses Faltings finiteness plus coefficient commutants; exceptional set is finite and ramified primes are excluded where required. |
| `GT.2/conductor-bound` | verified | Ribet Lemma 4.1 proof consumes Néron conductor independence; a uniform bound on residual prime-to-ℓ conductors is asserted, not equality with cond(A). |
| `GT.2/crystalline-at-good-primes` | verified | Ribet Lemma 4.2/KW §5 good-prime comparison retains ℓ outside the bad set and Hodge–Tate convention {0,1}. |
| `GT.3/modular-abelian-variety` | unverifiable | Quotient definition, level monotonicity and Γ₀ comparison agree with KW/FLHS. Private Jacobians and the elliptic API’s missing curve-morphism equivalence prevent prototype verification. |
| `GT.3/serre-witnesses` | corrected | Corrected initial residual comparison to a common algebraic closure, with integral-model and determinant prerequisites; weight two and bounded Serre conductor are justified. |
| `GT.3/fixed-newform` | corrected | Corrected residue-field descent: after pigeonholing f, finite good-prime generators and their finite order index exclude finitely many ℓ and give O_Kf → F_ℓ. |
| `GT.3/coefficient-identification` | corrected | Corrected the character comparison: trace congruences give the characteristic-zero coefficient isomorphism; semisimple recognition then identifies determinants, without assuming missing determinant congruences. |
| `GT.3/tate-module-comparison` | verified | Ribet Theorem 4.4 proof and R01.5 recognition yield the comparison under the coefficient identification; Faltings then supplies the isogeny. |
| `GT.3/modularity-theorem` | verified | Ribet Theorem 4.4 under strong Serre, now supplied by the parent, gives KW Corollary 10.2(i) unconditionally. No reliance on alleged source gap E2. |
| `GT.3/modularity-equivalences` | corrected | Corrected single-λ implication to identify the two embedded trace fields directly, then use Tate comparison and Faltings; removed the inapplicable infinite-congruence prerequisite. |
| `GT.3/simple-quotients-characterisation` | verified | Simple factors of J₁(N) are the A_f factors from its isogeny decomposition; the converse uses modularity. Parent and general coefficients have distinct scope. |
| `GT.3/trivial-character` | verified | Ribet/Serre relation ε=1 iff E is totally real, together with the trivial-character J₀ quotient supplier, gives the stated equivalence. |
| `GT.3/modular-parametrisation` | unverifiable | Corrected ambient level N using M\|N and degeneracy quotients; suggested file still omits X₁(N), the cusp, the zero value and the generating-image assertion. |
| `GT.4/conductor-of-gl2-type` | verified | Carayol A plus the full R19.4 local statement and restriction-of-scalars multiplicity gives a_p(A)=n·a_p(f); coefficient-prime factors use another auxiliary prime. |
| `GT.4/exact-level` | verified | The conductor identity gives cond(A)=N_f^n and the positive integer root; KW’s larger valid level is correctly distinguished from the least level. |
| `GT.4/strict-compatibility` | corrected | Corrected simultaneous WD realisation to permit finite E′/E as Carayol §0.6/A does; good polynomials remain E-rational, and coefficient-prime compatibility comes from R19.3. |
| `GT.4/l-function` | corrected | Corrected normalised Fricke/sign convention and proof w_A²=1 by applying the product functional equation twice to a nonzero Euler product; local factors include bad primes. |
| `GT.4/parent-compatibility` | unverifiable | The dimension-one comparison follows from the parent and exact level; the suggested fragment does not state the claimed parametrisation compatibility on actual curves. |
| `GT.5/q-curve` | unverifiable | Geometric definition includes CM via CM.1. Corrected false unsquared-trace non-example, added opposite-trace twists and dimension-one clause; actual elliptic/base-change carriers remain absent. |
| `GT.5/ribet-cocycle` | unverifiable | Corrected geometric-isogeny invariance and twist test after finite Galois extension, and added non-CM data hypotheses. Canonical cohomology and coherent scalar extraction remain untyped gaps. |
| `GT.5/tate-vanishing-qbar` | verified | Ribet Theorem 6.3: Tate vanishing for torsion coefficients plus the uniquely divisible quotient yields H²(G_ℚ,ℚ̄ˣ)=0. Private H² in the suggested file remains covered by the global prototype gap. |
| `GT.5/restriction-of-scalars-endomorphisms` | verified | Ribet Lemma 6.4: non-CM conjugate Hom lines give the crossed-product algebra and α gives its one-dimensional quotient; semisimplicity supplies the product splitting. |
| `GT.5/lie-free-rank-one` | unverifiable | Corrected ι to the σ⁻¹ factor through ^{σ⁻¹}μ_σ and wrote the equivariance and semisimple multiplicity descent. Suggested statement still omits R-equivariance. |
| `GT.5/ribet-theorem-6-1` | verified | Ribet Theorem 6.1: integral multiple of the central projector, Lie rank one, and πRπ=E_α give the primitive factor and its K-isotypic base change. |
| `GT.5/q-curves-geometrically-modular` | verified | Ribet Corollary 6.2 becomes unconditional using GT.3; it concerns a geometric simple factor and does not identify field-of-definition automorphy without GT.6. |
| `GT.5/quadratic-q-curves` | corrected | Corrected real-quadratic endomorphism conclusion to nonsquare m; square m gives Q×Q. Serre’s imaginary-quadratic positivity argument retains its hypotheses. |
| `GT.6/twisting-lemma` | corrected | Corrected the Hom-line character convention to ψ throughout; Schur and open-normal restriction yield finite-order factorisation and ρ₁≅ρ₂⊗ψ. |
| `GT.6/q-curve-galois-modularity` | verified | Ribet Lemma 7.1 restriction/twist argument uses the non-CM Hom line and an actual GL₂-type factor; no direct equality of untwisted local systems is claimed. |
| `GT.6/q-curve-automorphy` | corrected | Corrected transport of finite-order twist through algebraic roots of unity and family recognition, then vary auxiliary ℓ for all local factors. Solvable cuspidal base change remains an imported theorem. |
| `GT.6/quadratic-q-curves-modular` | corrected | Corrected imaginary-quadratic proof’s square/nonsquare split. Real case uses FLHS; CM case uses CN’s definition; both imaginary split factors are Γ₀ quotients at a common level. |

## Validation and orchestrator handoff

The initial and revised suggested files elaborated with `lean-check` in the existing shared pinned-Mathlib build: exit 0, only `sorry` warnings. No library was built or downloaded. This checks the current fragments, not a Tau Ceti carrier migration. `python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings; source-issue/version validation, packet/reader consistency and intake file checks are recorded in the handoff after their final run.

No mathematical choice needs a maintainer answer to finish this review. Route a revision of the same design for the three explicit prototype/API gaps, keeping the repaired statements and existing suppliers. Do not promote this needs_changes packet. The handoff identifies the exact restart locations and preserves all information needed without scratch files.
