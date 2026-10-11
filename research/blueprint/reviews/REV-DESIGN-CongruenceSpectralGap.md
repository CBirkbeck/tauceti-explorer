# Independent review: congruence spectral gap

Accepted as a complete **target-level plan**, with the explicitly recorded mathematical and native-carrier gaps retained. This does not certify proof closure or implementation. Reviewer: Codex, session `codex-8lcXWF`; job `REV-DESIGN-CongruenceSpectralGap` (#1719), 2026-10-11. This session did not write the design under review. Input atlas commit: `5d61b133d15ae42bdc33c6f1fd9ba837a35f2e59`.

## Scope and counts

All six stages and all 26 nodes were reviewed: 14 verified and 12 corrected; no nodes added or removed, none unverifiable. The final packet has seven definitions and one construction, 27 API items, 28 definition/construction tests and 15 planets. All stage targets are realized at target granularity. All implementation statuses remain `unchecked`; all six stages are `planned`, none `closed`. Six gaps and twelve supplier requests remain honest obligations. A request for finite-function strip growth was added to the eleven design requests.

## Source checks

The mathematical statements below are paraphrases, not copied source passages. Checked primary versions:

- [Luo–Rudnick–Sarnak, On Selberg’s eigenvalue conjecture](https://www.math.tau.ac.il/~rudnick/papers/lrsGAFA.pdf), published GAFA 5 (1995), pp.387–401: Theorems 1.1–1.2, §2.1, Lemma 2.1 (pp.392–394), Proposition 3.1 (p.395), Lemmas 3.1–3.2 (p.396), and the averaging proof (pp.397–399). The formula pages for both reported misprints were inspected visually. SHA-256 `1ed6b366ee4b0275ae87225e06fcff99bec31bcf76f7b1b54a9cace377859fac`.
- [Gelbart–Jacquet, A relation between automorphic representations of GL(2) and GL(3)](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf), Ann. ENS 11 (1978), pp.471–542: Definition 3.1.3 and Proposition 3.2 (pp.485–486), §3.7 (p.491), §9.2 and Theorem 9.3 (pp.531–534), and Remark 9.9 (p.541). These verify the imported adjoint and self-twist contracts; they do not discharge the supplier's recorded converse/local-classification proofs. SHA-256 `319347503f91fe22bec22ce7519b9ebaf09921ec4de8756c51d155864b4fc16a`.
- [Teschl, Mathematical Methods in Quantum Mechanics](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf), retrieved second-edition text: §2.3, Lemma 2.10 and Theorems 2.12–2.13 (pp.68–72); §4.3, Theorem 4.10 and its form-domain version (pp.117–119). The closed-form theorem requires density and closedness; the min-max convention includes the essential bottom when lower discrete eigenvalues are exhausted. SHA-256 `8dc8de0b58aa0a3fedfe594a345f9b5875322e5526ea581cb640a98d55b82818`.

Both existing source issues are independently **confirmed** in their review objects. E1 (LRS p.395 before (3.6)) needs multiplicative, rather than ordinary, cutoff normalization to obtain Mellin value one at zero. E2 (p.397, (3.12)) needs principal-character subtraction on the ±1 residue classes too; the n=1 coefficient checks this immediately. Neither alters the stated final parameter bound. No further verified source mistake is asserted: the epsilon kernel estimate safely absorbs repeated-pole and collision logarithms without claiming an unconstructed automorphic counterexample to the printed short bound.

The Rayleigh and scaling nodes previously put a Teschl theorem number into a locator attached to the LRS source. Their source entries now distinguish the two texts.

## Baseline and ownership

Every original twenty baseline entry exists with the stated fit at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. None was removed or replaced. One missing actual prerequisite, `mellinInv_mellin_eq`, was added from pinned `Mathlib/Analysis/MellinInversion.lean`; its complete hypotheses were read. The pinned Tau Ceti self-adjoint source was also compared byte-for-byte with the recorded Git object.

| Declaration | Pinned module | Confirmed fit |
| --- | --- | --- |
| `mathlib:Complex.Gammaℝ` | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean` | Existing Deligne factor π^(−s/2)Γ(s/2). |
| `mathlib:Complex.Gammaℝ_eq_zero_iff` | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean` | Totalized Gammaℝ is zero at the nonpositive even integers; meromorphic pole arguments must use germs. |
| `mathlib:Complex.Gammaℝ_residue_zero` | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean` | The punctured limit of s Gammaℝ(s) at zero is 2. |
| `mathlib:CongruenceSubgroup.IsCongruenceSubgroup` | `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean` | Existing congruence predicate ∃N≠0, Γ(N)≤Γ; no replacement predicate. |
| `mathlib:CongruenceSubgroup.IsCongruenceSubgroup.finiteIndex` | `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean` | A congruence subgroup has finite index in SL₂(ℤ). |
| `mathlib:DirichletCharacter.sum_characters_eq` | `Mathlib/NumberTheory/DirichletCharacter/Orthogonality.lean` | Full-character orthogonality over an integral domain with enough roots of unity and nonzero modulus. |
| `mathlib:LinearPMap` | `Mathlib/LinearAlgebra/LinearPMap.lean` | Partial linear map with a linear domain, used for the unbounded Laplacian. |
| `mathlib:MeasureTheory.IsFundamentalDomain.quotientMeasure_eq` | `Mathlib/MeasureTheory/Group/FundamentalDomain.lean` | For a countable measure-preserving group action, the quotient measure is independent of the measurable fundamental domain. |
| `mathlib:MeasureTheory.Lp` | `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean` | Actual almost-everywhere Lp quotient with p=2, not an abstract Hilbert carrier. |
| `mathlib:MulAction.orbitRel.Quotient` | `Mathlib/GroupTheory/GroupAction/Defs.lean` | Orbit quotient type for an actual group action. |
| `mathlib:MulAction.toPermHom` | `Mathlib/Algebra/Group/Action/End.lean` | Canonical homomorphism to permutations; its range removes the ineffective action kernel. |
| `mathlib:UpperHalfPlane.volume_def` | `Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean` | Hyperbolic area on ℍ is Lebesgue measure weighted by y⁻². |
| `mathlib:ZMod.isPrimitive_stdAddChar` | `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean` | The standard additive character is primitive for nonzero modulus. |
| `mathlib:ZMod.stdAddChar` | `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean` | Standard complex additive character exp(2πij/q). |
| `mathlib:gaussSum` | `Mathlib/NumberTheory/GaussSum.lean` | Finite multiplicative/additive character Gauss sum. |
| `mathlib:mellin` | `Mathlib/Analysis/MellinTransform.lean` | Mellin transform ∫Ioi(0) t^(s−1)f(t)dt. |
| `mathlib:mellinInv` | `Mathlib/Analysis/MellinTransform.lean` | Inverse transform (1/(2π))∫ℝ x^(−(σ+it))F(σ+it)dt. |
| `mathlib:mellin_comp_inv` | `Mathlib/Analysis/MellinTransform.lean` | The Mellin transform of f∘inv at s equals mellin f at −s. |
| `tauceti:IsSelfAdjoint.isFormalAdjoint` | `TauCeti/Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean` | A self-adjoint partial operator on a complete inner-product space is formally self-adjoint. |
| `tauceti:LinearPMap.IsFormalAdjoint.im_inner_self_apply` | `TauCeti/Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean` | The self-adjoint diagonal inner product has imaginary part zero. |
| `mathlib:mellinInv_mellin_eq` | `Mathlib/Analysis/MellinInversion.lean` | Mellin inversion at x>0 for MellinConvergent f σ, VerticalIntegrable (mellin f) σ and ContinuousAt f x, in a complete normed complex space. |

In particular, fundamental-domain independence uses a countable measurable measure-preserving **effective** action; finite elliptic stabilizers occur on a null set, while a central ineffective kernel cannot be retained. Character orthogonality requires a nonzero modulus and enough roots of unity; ℂ supplies them. Gamma poles are handled by meromorphic germs, since the totalized factor has value zero at its poles. Mellin inversion additionally requires line convergence, vertical integrability and continuity, not just the definitions of the transforms.

Read the current upstream FuchsianOrbifolds and ArithmeticDirichletSeries README documents in full and their relevant suggested signatures. Also checked OperatorTheory/SelfAdjointSpectralTheory, DifferentialGeometry Layer 12, GlobalNumberFields Layers 6/9/10, and current Tau Ceti upper-half-plane volume and PDE energy-form declarations. Upstream roadmap commit: `c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`; current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

No generic quotient geometry, ordinary gradient/volume/Green theorem, RS theory, adjoint lift, Kloosterman bound or Tauberian theorem is replanned here. The newer DifferentialGeometry targets have no stage IDs in the atlas snapshot; their exact consumption is therefore stated in `upstreamDependencies` and the AS.0 adapter request. Current PDE's real Euclidean Dirichlet form supplies local ingredients, not a complex cusp-orbifold realization at the compilation pin. Constant scaling is a specialized calculation from imported definitions, rather than an attributed generic upstream theorem.

Compared `data/library-coverage.json` for AS, AF, AL, FF, GL2 and AN with the pinned and current source trees. The new nodes do not duplicate the audit's built material. In particular the existing R17.4 adjoint lift is consumed; the older brief's suggestion to rebuild it is not followed.

## Dependencies and corrections

Supplier node statements were read for AF.1 local LLC/unitarity, AF.2 adelization, AF.3 representation/discrete spectrum, AL.1 archimedean factors, AL.3 Whittaker genericity/local factors/induction/poles/functional equation/strip bounds/boundary behavior, FF.2 sum and bound, R17.4 adjoint lift, AN.2 PNT transfer, AN.5 divisor estimates, and AS.4 orthosum/residual/GL2 expansion. Their hypotheses and normalizations match the imports or an explicit request records the shortfall.

Three substantive contract repairs are essential. A definition of cuspidal representation does not extract an irreducible constituent, so the dictionary now directly imports AF.3's discrete decomposition theorem. The generic unitary classification also requires local genericity, now supplied explicitly by AL.3/global-whittaker-factorization for the cuspidal GLn inputs. Boundedness of the **completed** RS function does not give polynomial vertical growth after gamma removal: inverse gamma contributes exponential factors. The contour proof now explicitly requests the finite-function estimate from AL.3, including its finite-order/Phragmén–Lindelöf justification. Constants can depend on the fixed twist; the conductor-uniform averaging estimates are supplied separately by the kernels and finite character bounds.

The cutoff proof now derives the tail's Mellin transform by Fubini and uses the actual pinned inversion theorem with verified analytic hypotheses. The kernel proof distinguishes order at most d in the gamma quotient from a possible extra order after collision with 1/s; epsilon absorbs the resulting logarithms. The rational Lean theorem now exports both promised conclusions.

The operator and mean-zero tests previously admitted the zero operator and zero submodule. Nontriviality tests reject these; level-two area rejects a level-independent measure. The previous gap tests did not evaluate `spectralGap` at all. Their replacements test the empty exceptional spectrum, an attained variational bottom, and the positive congruence bound; the new Rayleigh API exposes how downstream inequalities use the definition. Every final definition/API/test appears in the suggested file under its packet name.

## Per-node findings

| Node | Verdict | Finding |
| --- | --- | --- |
| `CSG.0/quotient-measure` | corrected | Confirmed effective-action fundamental-domain hypotheses and level-one area; added level-two mass 2π to reject level-independent normalization. |
| `CSG.0/quotient-laplacian` | corrected | Added nontrivial operator test and its free-chart bump argument; made current DG/PDE imports explicit through the AS.0 adapter. Generic closed-form representation remains G1. |
| `CSG.0/mean-zero` | corrected | Confirmed complex integral kernel and constant orthogonal complement; added a nonzero member test to reject the zero submodule. |
| `CSG.0/spectral-gap` | corrected | Added direct spectral-description prerequisite and Rayleigh upper-bound API. Replaced unrelated tests by actual gap evaluations at an empty small spectrum, an attained bottom, and the positive congruence bound. |
| `CSG.0/clipped-gap` | verified | Inserted threshold handles the empty set; lower-bound hypothesis protects sInf in the member-bound API. Three numerical/set tests agree with Lean. |
| `CSG.0/spectral-description` | verified | All-level constants-only residual and continuous threshold are stated precisely and honestly requested from AS.4 in G2; level-one displayed expansion is not used as an all-level proof. |
| `CSG.0/spectral-clipping` | verified | Operator/form infimum and discrete/essential spectrum yield the clipped small-spectrum bottom, conditional on the recorded AS.0/AS.4 obligations. |
| `CSG.1/exceptional-dictionary` | corrected | Added AF.3/cuspidal-spectrum-discrete for constituent extraction; SO(2) weight zero allows both sign parities. Principal-level and arbitrary intermediate-group adapters remain G2. Added the same exact local-genericity supplier. |
| `CSG.1/monomial-tempered` | verified | Imported self-twist/induction branch of R17.4 with GlobalNumberFields unitary norm shift; induction of a unitary Hecke character has tempered real component. No new generic lift is planned. |
| `CSG.1/adjoint-parameters` | verified | Trace-zero endomorphism characters give 2r,0,−2r; common parity cancels. Central-character inverse and no-self-twist cuspidality criterion agree with the existing R17.4 contract. |
| `CSG.2/prime-twist-equation` | corrected | Compared LRS Lemma 2.1 at every type of finite prime: ramified coefficients retained, even parity, degree m², conductor and non-unit-normalized τπ correct. Missing positivity/transport remain AL.3 requests. Added AL.3/global-whittaker-factorization to justify local genericity before the unitary-classification import. |
| `CSG.2/trivial-zero` | verified | Diagonal maximal gamma pole is real at β₀; use meromorphic orders rather than the totalized pole value. Entire twist and generic unitarity give the required cancellation and β₀<1. |
| `CSG.3/first-kernel` | corrected | Added the actual pinned Mellin-inversion theorem with its convergence, vertical integrability and continuity hypotheses; gave Fubini/tail-transform proof rather than an unlisted inversion step. |
| `CSG.3/dual-kernel` | verified | Reflected Mellin argument and β−s match (3.7); unit-ratio identity uses inversion of the support. Zero and sign-sensitive tests use genuine function types. |
| `CSG.3/kernel-estimates` | corrected | Distinguished gamma pole order ≤d from possible order d+1 after collision with 1/s. Epsilon absorbs all logarithmic factors; requested complex gamma estimates remain G5. |
| `CSG.3/approximate-equation` | corrected | Added a precise AL.3 request for polynomial vertical growth of the finite twisted function; completed bounds alone do not justify horizontal contours. Dual conductor argument and reflected character match Lemma 3.2. |
| `CSG.4/prime-average` | verified | Finite sum includes only dyadic good primes and even nonprincipal characters; q=3, q=5, zero-cutoff and bad-prime tests check the carrier. |
| `CSG.4/even-orthogonality` | verified | Full character orthogonality gives the exact ±1 coefficient and principal subtraction over every coprime n; includes the confirmed source misprint correction. |
| `CSG.4/gauss-average` | verified | Expanded power and principal τ(1)=−1 give the exact parity correction. FF.2 all-coordinate nonzero fibre equals the unit fibre; Deligne bound yields the stated constant. |
| `CSG.4/average-asymptotic` | verified | Checked divisor count of n±1, positive coefficient partial sums, both errors, Y=Q^((d+1)/2), near-zero integrability β₀+ε′<1, and 3/4 dyadic prime main-term constant. |
| `CSG.4/twist-nonvanishing` | verified | Strict half-strip makes the error smaller than Q²/log Q; a nonzero complex finite sum has a nonzero term. No positivity or every-twist assertion is made. |
| `CSG.5/archimedean-bound` | verified | Contradiction at β₀ and unitary multiset symmetry give the weak spherical GLm/Q bound. The strict nonvanishing region cannot remove equality. |
| `CSG.5/exceptional-arithmetic` | corrected | Lean now states both r≤1/5 and 21/100≤1/4−r², matching the packet; direct GL2 arithmetic would give only 4/25. |
| `CSG.5/congruence-bound` | verified | Uses GL3 adjoint parameters, not a direct GL2 bound; clipped threshold covers arbitrary congruence levels and empty exceptional spectrum. |
| `CSG.5/rayleigh-bound` | corrected | Split LRS and Teschl locators into their actual source entries. Operator-domain signature elaborates; form-domain core transfer is explicit in G1/G6. |
| `CSG.5/metric-rescaling` | corrected | Corrected attribution of constant scaling to a local coordinate calculation using DG definitions, and split source locators. Volume/operator scaling and curvature −4 check agree; native metric statement remains G6. |

The prerequisite graph remains acyclic: the spectral description depends on the constructed operator, while the spectral bottom may consume that description. Tests may use later theorems; they are not inserted as circular construction prerequisites. Planet names identify genuine central definitions/constructions/theorems; every layer has at most six.

## Validation and remaining obligations

`python3 scripts/check_blueprint.py research/blueprint/packets/CongruenceSpectralGap.json`: zero errors and zero warnings. `lean-check research/blueprint/suggested/CongruenceSpectralGap.lean`: exit zero, with only declaration-uses-`sorry` warnings. Imports are individual modules. No implementation, generic proposition carrier, library build or upstream edit is introduced. The thirteen global signatures omitted for unavailable native carriers are explicitly named and retained in G6; the operator-domain Rayleigh signature is present, while the form-domain and actual metric versions remain omissions.

No unresolved contradiction remains in the plan. The generic closed-form representation, orbifold analytic core, all-level residual/spectral realization, classical-to-adelic adapter, imported classification/lift proofs, ramified positivity/twist transport, finite-function strip growth, gamma/contour estimates and native statement carriers remain the six documented gaps. They are obligations for the named mathematical owners, not work silently certified by this review. No orchestrator decision is needed to finish this review; the packet is ready for the next packaging/implementation stages at its stated level.
