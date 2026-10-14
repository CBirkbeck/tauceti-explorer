# REV-PadicFamilies — independent review

**Verdict: accepted, as a complete target-level planning pass.** Codex, session `codex-otr40e`, 14 October 2026, reviewing #461. The blueprint was written by other sessions (`cc-39fac3` and `claude-LgrPjn`). This verdict applies to the corrected packet and suggested file in this submission. It does not assert proof closure or formalization, and does not make the existing reader document current.

All 121 nodes were checked against their statements, hypotheses, proof routes, prerequisites, source locators and downstream uses. The packet’s `review.checked` gives a separate reason for every node: **83 corrected, 38 verified, zero added, zero unverifiable**. All 69 baseline declarations were checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Their 51 distinct source files were compared byte-for-byte with the public pinned files before their actual declaration statements were read. Finding the name alone was not treated as confirmation of its mathematical contract.

The final inventory is 12 definitions, 40 constructions, 47 theorems, 16 lemmas and 6 comparisons; 263 API entries, 197 discriminating tests and 38 planets across all annotated nodes (the checker counts 257 API entries and 193 tests on definitions/constructions). Every definition/construction retains at least three tests. No node was removed or added. There are eight layers: L0a is closed; L0, L1, L2, L2a, L3, L4 and L5 are planned with precise remaining lists. The 21 gaps and 15 requests are legitimate endpoints under PROTOCOL §0, rather than contradictions hidden inside unconditional proof claims. Acceptance is appropriate for the pass, while these inputs remain work for the indicated owners.

## Findings that govern the verdict

The finite/profinite/locally finite ordinary-projector chain is sound after restoring stable topology and completeness hypotheses. The finite factorial bound, invertible ordinary part, nilpotent complement and naturality are represented by actual light definitions and milestone statements in Lean. The perfect-complex direct factor is distinguished from a projector chosen on an arbitrary representative. Generic commutative algebra and the existing upstream determinant/derived-idempotent targets are imported rather than redeveloped.

The arithmetic family targets needed substantial corrections. Hida’s integral positive-coefficient lattice excludes constants; control does not follow from torsion-freeness alone. EPW’s integral homology eigenquotient is not automatically the saturated cohomological eigenline: the duality and congruence correction comparison is now a named gap. Likewise, Hida’s free-closure congruence module is not automatically the raw annihilator quotient. The raw codimension-zero definition belongs here, while higher-codimension Ext constructions remain with their existing owner.

The spectral machine itself does not prove the analytic coefficient construction for its application. In the [early Bellaïche preprint](https://arxiv.org/pdf/0912.2925v1), the tensor-dual equality and unrestricted symbol specialization are false. The [51-page later author copy](https://people.brandeis.edu/~jbellaic/preprint/criticalbeforepublication2.pdf), §§3.1–3.2.4, pp.22–32, repairs the action using multiplication on the tensor coefficient module and proves the Banach and specialization claims on nice PID charts. Its Theorem3.10 and Corollary3.12 retain a one-dimensional E₂ cokernel at weight0, negative sign and slope bound≥1. Thus all fibre comparisons and the forms comparison use the global-image symbol subspace `g`. A cover/descent construction beyond nice classical charts, including high-conductor weights, remains an explicit input. The final proof sketches use the repairs rather than rejecting the whole coefficient construction because the early text is wrong.

The same later text does not justify globally exponentiating every character on `1+pℤ_p`. Its Lemma3.3 proof, p.25, must first pass to a sufficiently deep subgroup and then use finitely many cosets; this matters for finite-order characters of large conductor. The packet keeps the correct analytic conclusion with that repair. The raw fixed-radius theta sequence in the early text also fails; the corrected target states the global dagger radius-loss sequence and records its finite-slope comparison with the locally analytic symbol convention as a gap.

The geometric weight fibre, the Hecke image of that fibre and the residue fibre of the coherent sheaf are three different objects. The packet now retains nilpotent specialization kernels and the e-dimensional generalized weight fibre at a ramified point. The critical eigensymbol uses the diagonal tensor construction, and the secondary L-functions give a Mellin-image filtration which need not be strict.

The ordinary Galois representation uses Ochiai’s cohomological/geometric-Frobenius normalization, including its universal cyclotomic and final Teichmüller twists. Its comparison with EPW’s representation is a named input, not a bare trace identification. Free global rank two does not prove integral free ordinary lines. Selmer arithmetic control retains invariant, inertia and localization-image errors; perfectness over the actual possibly nonregular family ring and the determinant comparison retain their own hypotheses. The KLZ regulator is not identified with Ochiai’s integral Coleman map or length formula without a comparison theorem. Dense pointwise period agreement does not prove a branch-unit ratio. The Euler-system ideal containment is in the direction implied by the stated length inequality.

For totally real families, coset representatives prove finite module freeness of a completed group algebra; a nonsplit finite extension does not give a canonical group-algebra tensor decomposition. The superscript `+` in Skinner–Wiles changes the Hecke action to its adjoint; it is not the norm-form subspace. Replacing the source’s finite-level free claim by projectivity does not close uniform finite generation on every torsion-character factor of the tower. Hilbert parallel-weight freeness for arbitrary totally real fields and full ordinary bad-prime semisimplicity also remain precise inputs. Period invertibility requires a Hecke-rank-one hypothesis.

## Pinned baseline and current ownership

No baseline declaration name was removed: all 69 exist at the pins. Their `provides` and `checked` fields now record what was actually confirmed. The material near misses were corrected as follows.

| Citation | Contract used after review |
|---|---|
| `LinearMap.linearProjOfIsCompl` | Projection E→F for an injective map F→E and a complement; compose with the inclusion to obtain an endomorphism. |
| `HeckeRing.GL2.heckeUNat` | Bad-prime operator alias; its q-expansion coefficient formula is a separate imported theorem. |
| `HeckeRing.GL2.Newform` | Normalization, new-subspace membership and good-index eigenproperties; bad-prime properties and semisimplicity come from current ModularForms Layer4. |
| `CharacterModule` | Algebraic Hom into ℚ/ℤ; no continuity is built in. Topological tower duality is imported separately. |
| `FractionRing` | Total quotient localization at non-zero-divisors for a commutative ring. It becomes a field only with the domain hypothesis; reduced Hecke rings can give a product of fields. |
| `LinearMap.charpoly`, `LinearMap.aeval_self_charpoly` | Finite **free** module results. Finite-projective determinant laws and their spectral normalization are imported from the existing upstream owner. |

The complete declaration inventory below records the verified mathematical role; the packet gives each exact module. The public source trees are [pinned Mathlib](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib) and [pinned Tau Ceti](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369/TauCeti).

| Declaration | Verified role |
|---|---|
| `mathlib:Finite.exists_ne_map_eq_of_infinite` | Pigeonhole: a map from an infinite type to a finite one is not injective. |
| `mathlib:Nat.dvd_factorial` | 0 < m ≤ n ⇒ m ∣ n!. |
| `mathlib:Nat.self_le_factorial` | n ≤ n!. |
| `mathlib:Nat.factorial_dvd_factorial` | m ≤ n ⇒ m! ∣ n!. |
| `mathlib:Function.iterate_add` | f^[m + n] = f^[m] ∘ f^[n]. |
| `mathlib:Function.iterate_mul` | f^[m * n] = (f^[m])^[n]. |
| `mathlib:Set.BijOn` | f maps s bijectively onto t. |
| `mathlib:Module.End` | Endomorphisms of a module as a ring. |
| `mathlib:Module.End.pow_apply` | (f ^ n) x = f^[n] x. |
| `mathlib:IsIdempotentElem` | e * e = e. |
| `mathlib:Commute` | a * b = b * a. |
| `mathlib:LinearMap.isCompl_iSup_ker_pow_iInf_range_pow` | Fitting decomposition: M = (⨆ ker fⁿ) ⊕ (⨅ range fⁿ) for Artinian and Noetherian M. |
| `mathlib:LinearMap.eventually_isCompl_ker_pow_range_pow` | Fitting decomposition at a large finite exponent. |
| `mathlib:LinearMap.eventually_iInf_range_pow_eq` | The ranges of fⁿ stabilise on an Artinian module. |
| `mathlib:LinearMap.eventually_iSup_ker_pow_eq` | The kernels of fⁿ stabilise on a Noetherian module. |
| `mathlib:isArtinian_of_finite` | A module that is finite as a set is Artinian. |
| `mathlib:IsNoetherian` | Noetherian modules (a module finite as a set is Noetherian by instance). |
| `mathlib:LinearMap.isProj_iff_isIdempotentElem` | An endomorphism is a projection onto its range iff it is idempotent. |
| `mathlib:LinearMap.IsProj` | Projections onto a submodule. |
| `mathlib:LinearMap.linearProjOfIsCompl` | For an injective linear map i:F→E and a complementary submodule q to range(i), the projection E→F. Compose with i for the corresponding endomorphism of E. |
| `mathlib:IsArtinian.bijective_of_injective_endomorphism` | Injective endomorphisms of Artinian modules are bijective. |
| `mathlib:LinearMap.restrict` | Restriction of an endomorphism to an invariant submodule. |
| `mathlib:IsCompl` | Complementary elements of a bounded lattice. |
| `mathlib:Function.Exact.linearMap_ker_eq` | Exactness gives ker g = range f (Function.Exact is the additive MulExact). |
| `mathlib:Submodule.map` | Image of a submodule. |
| `mathlib:Submodule.mapQ` | The map induced on quotients by a map preserving the submodules. |
| `mathlib:Submodule.mkQ` | The quotient map M → M/p. |
| `mathlib:LocalizedModule` | Localization of a module at a submonoid. |
| `mathlib:LocalizedModule.mk` | The fraction m/s. |
| `mathlib:IsLocalizedModule` | Characterisation of module localizations. |
| `mathlib:Module.AEval'` | M as an R[X]-module with X acting by a given endomorphism. |
| `mathlib:Module.AEval'.of` | The identification M ≃ AEval' φ. |
| `mathlib:Submonoid.powers` | The submonoid of powers of an element. |
| `mathlib:Polynomial.X` | The polynomial variable. |
| `mathlib:Directed` | Directed families. |
| `mathlib:CategoryTheory.Functor.sections` | Sections (compatible families) of a functor to types. |
| `mathlib:IsLocalRing.finite_quotient_iff` | Over a noetherian local ring with finite residue field, R/I is finite iff I ⊇ mⁿ for some n. |
| `mathlib:Ideal.finite_quotient_pow` | I finitely generated and R/I finite ⇒ R/Iⁿ finite. |
| `mathlib:IsAdicComplete` | I-adic separation and completeness of a module. |
| `mathlib:IsLocalRing.ResidueField` | The residue field R/m. |
| `mathlib:IsLocalRing.maximalIdeal` | The maximal ideal of a local ring. |
| `mathlib:Module.Finite` | Finitely generated modules. |
| `mathlib:nonempty_sections_of_finite_cofiltered_system` | A cofiltered system of nonempty finite types has a section. |
| `mathlib:nonempty_sections_of_finite_inverse_system` | Specialisation to inverse systems indexed by a directed order. |
| `mathlib:HomologicalComplex` | Complexes in a preadditive category. |
| `mathlib:HomologicalComplex.homologyMap` | The map induced on homology by a chain map. |
| `mathlib:Algebra.adjoin` | The subalgebra generated by a set. |
| `mathlib:LinearMap.mulLeft` | Left multiplication as a linear map. |
| `mathlib:HomotopyCategory` | The homotopy category of complexes. |
| `mathlib:Homotopy` | Chain homotopies. |
| `tauceti:HeckeRing.GL2.heckeUNat` | The bad-prime abbreviation for heckeTNat at prime p dividing N. This file provides the operator; the q-expansion coefficient formula is a separate theorem, imported from ModularForms Layer 4. |
| `tauceti:HeckeRing.GL2.Newform` | A normalized complex Γ₁(N) cusp eigenform in the new subspace: good-index eigenproperties and a₁=1. The carrier alone does not provide bad-prime eigenproperties or newform semisimplicity; use ModularForms Layer 4 for those theorems. |
| `mathlib:MvPowerSeries` | Multivariable power series rings, the carrier of Λ′_𝒪. |
| `mathlib:Module.Free` | Free modules (M_∞(U) over Λ′_𝒪, 𝒪[[G(U)]] over Λ′_𝒪). |
| `mathlib:IsDedekindDomain.FiniteAdeleRing` | Finite adeles A_f of F, for U ⊆ GL₂(A_f) and the centre U^f. |
| `mathlib:IsLocalRing` | Local rings (Λ′_𝒪 is local, so projective finite modules are free). |
| `mathlib:CharacterModule` | The algebraic character module Hom_ℤ(A,ℚ/ℤ), implemented with AddCircle (1:ℚ). It does not impose continuity or construct topological Pontryagin duality. For finite discrete modules the character functions are automatically continuous; for towers import the continuous duality interface. |
| `mathlib:CochainComplex` | Cochain complexes indexed by ℤ (or any additive monoid). |
| `mathlib:DerivedCategory` | The derived category of an abelian category, as the localisation of complexes at quasi-isomorphisms. |
| `mathlib:FractionRing` | The total ring of fractions (localisation at non-zero-divisors). |
| `mathlib:Ideal.map` | Image of an ideal under a ring homomorphism (the ideal generated by the image). |
| `mathlib:IsReduced` | A ring with no nonzero nilpotent elements. |
| `mathlib:LinearMap.aeval_self_charpoly` | Cayley–Hamilton for an endomorphism of a finite free module. |
| `mathlib:LinearMap.charpoly` | Characteristic polynomial of an endomorphism of a finite free module (requires Module.Free and Module.Finite). |
| `mathlib:Module.Projective` | Projective modules (lifting property against surjections). |
| `mathlib:Module.annihilator` | The annihilator ideal of a module. |
| `mathlib:PowerSeries` | Formal power series in one variable. |
| `mathlib:Submodule.span` | The submodule spanned by a set. |
| `mathlib:Submodule.torsionBySet` | The submodule M[s] of elements killed by every element of a set s; used for M[J] with J an ideal. |

I also read the reviewed library audit and the current read-only upstream roadmaps and Tau Ceti library. In particular, current IntegralHeckeAndGaloisDeterminants already owns finite-projective determinant laws (README §0.6, the finite-projective representation target, with PadicMeasuresIwasawaAlgebras §5.1 as its supplier), factorial idempotents and the Artinian derived ordinary comparison. The projective spectral polynomial node is consequently a comparison/instance, not another generic construction. Current ModularForms Layer4 owns full newform operator properties; its carrier alone is insufficient. The post-snapshot roadmaps were screened for the proposed algebra/topology targets; none supplied the missing continuous tower-duality or application-specific compact Nakayama statement.

Supplier statements were read at node level where available. The decisive distinctions are:

- AdicSpacesPartII R2 already plans rig-points, formal separatedness, flattening and quasi-finite formal models. Its four exact nodes are imported into the corrected constant-rank finiteness theorem, with quasi-compactness, separation and flatness retained. The previous claim that these formal-model theorems were absent is removed.
- LocallyAnalyticDistributions L4 supplies the abstract Banach/Riesz machinery. It does not prove that an arbitrary closed Manin kernel has property(Pr); the nice-chart criterion and its global extension are requested explicitly.
- PadicMeasuresIwasawaAlgebras L0a has no completed weight-space construction yet, and L1’s existing convolution/completed-algebra statements do not by themselves provide all coefficient-action and topological-duality interfaces. The requests retain exact chart and action data.
- ModularCurvesPartII R12.5’s rational first-coefficient pairing does not identify integral period lattices. R14.4 gives degeneracy maps, not residual ordinary Ihara injectivity. R14.6’s semistable Tate interface is for ℓ≠p, not the integral ordinary p-divisible-group theorem; that extra input is requested as an extension.
- R18.3’s definite class set is quotiented by the adelic centre. Skinner–Wiles’s X(U) is not; the finite-ray-class fibre comparison is requested. R16.6’s algebraic-weight objects do not supply the entire parallel-weight Hilbert form/newform/control theorem.
- The nonordinary relative Galois/triangulation supplier PG.7 is not_read. LZ’s noble-point result is therefore a correctly scoped target with an open input, not a globally supplied eigencurve representation theorem.

These are contract checks, not reviews or edits of those suppliers.

## Confirmed red-team findings

**RT-AREA-langlands-1/8:** the GL₂/Katz ordinary Igusa tower needed by L0 is requested from ModularCurvesPartII R13.2. The generic IgusaVarietiesAndTorsionConcentration IG.1 source is not substituted for it: its Hodge/unitary Igusa context does not automatically provide the requested trivialized-elliptic-curve moduli. L5’s definite towers are also built from their exact quaternionic class-set inputs rather than a generic Igusa link.

**RT-AREA-langlands-1/27:** L1 owns the generic codimension-zero annihilator congruence module and ideal. IntegralHeckeAndGaloisDeterminants remains an import for its determinant/Hecke algebra, not a duplicate owner. The quotient/ideal identification retains the double-annihilator hypothesis (or the precise reduced-minimal-prime/finite-flat conditions that establish it). IKM’s depth hypothesis and distinction between the raw quotient and Ext-based higher-codimension congruence module are preserved. The reader requires the corresponding replacements below.

## Every node correction

No additional lemma nodes were needed at the prescribed target granularity: missing non-routine arguments are either exact supplier imports or named gaps. This is the complete node change ledger; the packet’s individual review records also cover every unchanged node.

### L0

- `katz-padic-modular-functions`: Correct q-expansion completion and replace an unsupported Eisenstein-limit test.
- `padic-completion-of-classical`: Restore Γ-invariants in the mod-p identification (Hida Theorem 1.1 and Corollary 1.2).
- `ordinary-idempotent-hecke`: Tests use the U_p-eigen p-stabilisation, rather than the original level-one form.
- `hecke-duality`: Use Hida’s positive-coefficient lattice modulo constants, not the lattice including weight-zero constants.
- `ordinary-mod-p-weight-independence`: The proof uses Γ-invariants of W, as in the source.
- `hida-control-theorem`: Replace the invalid torsion-free⇒free argument with Hida’s equal-rank surjection and intersection proof.
- `ordinary-eisenstein-family`: Align specialisation API and irregular-prime test with the specified Teichmüller twist.
- `lambda-adic-forms`: Specify the weight component and replace an unsupported named-family example and ill-typed coefficient pairing. Complete the API with the explicit extensionality, membership or quotient-factorization interface used by consumers.
- `primitive-components`: Import full newform eigenproperties/semisimplicity from the existing ModularForms roadmap; the Newform carrier is insufficient.
- `compact-nakayama`: Avoid claiming that mⁿM are open in an arbitrary profinite module.

### L0a

- `ordinary-part-localization`: Replace the inherited arXiv-page citation by the independently read 2023 author-copy locators, pp.994 and 999–1000; the finite localization statement is unchanged.
- `finite-quotient-system`: Require compatibility with the product topology in the shift nonexample.
- `ordinary-idempotent-finite-algebra`: Restore completeness of the coefficient ring in the imported factorial-idempotent theorem; the noncommutative application uses the finite commutative subalgebra R[t].
- `derived-ordinary-idempotent`: Remove the redundant unread ACC locator; Khare–Thorne Lemma2.12 and the read minimal-complex supplier statements provide the target.
- `ordinary-complexes-inverse-limit`: Chevalley requires zero intersection; the cofinality hypothesis is retained.
- `locally-finite-stability`: Restore the triangular exponent and compute the restricted shift explicitly (Pilloni Remark 2.1.1).
- `locally-finite-derived-endomorphism`: The characterisation assumes a representative of the object together with its endomorphism.
- `semilocal-ordinary-projector`: Specify Jacobson-adic completeness of the ring and modules; justify the finite-product extension.

### L1

- `ordinary-family-symbol-module`:  Distinguish the weight-control quotient from a full Hecke eigenpacket quotient in the level-slice test.
- `family-symbol-free-rank-one`: Spell out the torsion-free kernel step in Nakayama and the separate sign-rank input.
- `family-period-line`: Distinguish the canonical homology-quotient period from the saturated cohomological eigensymbol lattice; record their integral comparison as an input.
- `family-measure`: Replace a malformed distribution test and remove an unsupported Lean-verification claim. Complete the API with the explicit extensionality, membership or quotient-factorization interface used by consumers.
- `family-measure-specialisation`: Remove a stale claim that branch rings are unplanned and qualify the integral normalization comparison.
- `congruence-module`: Require a finite module for finite length and specify the augmented O-algebra in the IKM comparison. Complete the API with the explicit extensionality, membership or quotient-factorization interface used by consumers.
- `congruence-ideal`: Remove an invalid finite-flat-over-an-arbitrary-base implication for the double annihilator. Complete the API with the explicit extensionality, membership or quotient-factorization interface used by consumers.
- `reduced-hida-algebra`: Remove an unsupported Δ/X₀(11) identification and use a conditional algebraic test.
- `family-congruence-module`: Distinguish the raw annihilator congruence module from Hida’s free-closure congruence module.
- `period-change-of-trivialisation`: Keep the unit-change theorem while making its saturated-lattice comparison conditional.
- `branch-l-functions`: Distinguish the two diamond characters and identify the non-routine integral degeneracy comparison.

### L2

- `distribution-families`: Use the later author version’s bounded multiplication construction of the family action; full tensor-dual equality is unnecessary. Complete the API with the explicit extensionality, membership or quotient-factorization interface used by consumers.
- `family-modular-symbols`: Apply the later nice-chart proof and retain the actual E₂ obstruction to symbol specialization. Complete the API with the explicit extensionality, membership or quotient-factorization interface used by consumers.
- `family-slope-pieces`: Keep the global-image fibre and the weight-zero E₂ cokernel rather than asserting full-symbol base change.
- `local-eigencurve-piece`: Distinguish the global-image specialization from the full symbol space at the exceptional E₂ eigensystem. Explicitly use global-image symbol fibres and retain the exceptional E₂ quotient in every comparison. Complete the API with the explicit extensionality, membership or quotient-factorization interface used by consumers.
- `specialisation-nilpotent-kernel`: Distinguish the global-image specialization from the full symbol space at the exceptional E₂ eigensystem. Explicitly use global-image symbol fibres and retain the exceptional E₂ quotient in every comparison.
- `modular-symbol-eigencurve`: Distinguish the global-image specialization from the full symbol space at the exceptional E₂ eigensystem. Explicitly use global-image symbol fibres and retain the exceptional E₂ quotient in every comparison.
- `eigensymbol-sheaf`: Distinguish the global-image specialization from the full symbol space at the exceptional E₂ eigensystem. Explicitly use global-image symbol fibres and retain the exceptional E₂ quotient in every comparison.
- `small-slope-classicality`: Keep the strict slope<k+1 condition; apply control on the corrected coefficient charts/global-image space and do not infer arithmetic density from the abstract machine alone.
- `etale-point-free-rank-one`: Remove an unjustified equality of ordinary local rings and the claim that rank-one freeness fails at critical points.
- `coleman-mazur-comparison`: Distinguish the global-image specialization from the full symbol space at the exceptional E₂ eigensystem. Explicitly use global-image symbol fibres and retain the exceptional E₂ quotient in every comparison.

### L2a

- `constant-rank-finiteness`: Resolve the formal-model inputs against their existing R2 owner rather than alleging they are absent.
- `strict-slope-neighborhoods`: Verify the corrected Newton inequalities and witness construction; replace a verbatim source locator with a page-and-proof locator.
- `slope-polynomials`: State unit and separation hypotheses in finite-rank tests; remove a purported source quotation.
- `eigenpacket-points`: Give the fibrewise argument; arbitrary complete extensions do not automatically preserve reduced affinoid bases.
- `projective-characteristic-polynomial`: Make the spectral characteristic polynomial a comparison/instance of the existing upstream finite-projective determinant and Cayley–Hamilton targets, with the reciprocal convention and rank-zero test.
- `complex-spectral-hypersurface`: Keep the degreewise product construction conditional on the compact representative and slope-theory suppliers; correct the nonalternating test rationale.
- `complex-spectral-variety`: Distinguish annihilator support from the determinant zero scheme in one degree.
- `coherent-eigenmodule-sheaf`: Generalized eigenspaces are local factors of the weight fibre, not residue fibres at eigenpoints; fix the Chenevier locator.

### L3

- `refinement-criticality`: Keep split local restrictions compatible with globally indecomposable preferred representations and the full refined-form hypotheses.
- `criticality-equivalences`: Carry newform, distinct-root and positive-slope hypotheses explicitly.
- `critical-slope-classification`: Retain Proposition2.14’s classical classification, with the corrected coefficient/descent hypotheses for its downstream family use.
- `decent-refinement`: Use the adjoint Bloch–Kato finite Selmer group appearing in the criterion and smoothness proof; preserve the any-quadratic-extension quantifier.
- `eigencurve-smooth-decent`: Separate the Eisenstein, noncritical and critical cuspidal proofs rather than using a single adjoint-vanishing argument for all decent forms.
- `theta-exact-sequence`: Replace the false fixed-radius Banach exact sequence by its global overconvergent-radius version; new E17 gives a bounded-moment counterexample.
- `family-symbols-free-rank-one`: State finite-slope localizations and geometric local rings precisely; rank-one conclusion needs decency and the Eisenstein slope hypothesis.
- `local-hecke-algebra-structure`: Qualify the tame DVR normal form at geometric henselian local rings and supply the independent normal-form step.
- `critical-eigenspace-dimension`: Retain the one-dimensional true eigenline of Theorem1/Corollary4.8; keep it distinct from the e-dimensional generalized weight fibre and use corrected specialization conventions.
- `critical-p-adic-l-function`: Do not interpret all continuous characters as test functions of a single fixed radius without finite-slope radius extension.
- `theta-critical-vanishing`: Require the finite-slope radius comparison before testing locally polynomial characters.
- `critical-slope-infinitely-many-zeros`: Replace the insufficient order-only argument with paired refinement interpolation and the Mazur–Pollack zero-counting input.
- `two-variable-l-function`: Use the diagonal eigensymbol in M⊗_R T; an arbitrary rank-one generator does not specialize to the eigenline at a ramified point.
- `secondary-l-functions`: Give explicit moment interpolation, Mellin-image filtration and remove an unsupported CM independence claim.

### L4

- `ordinary-big-galois-representation`: Propagate the cohomological Frobenius/Tate-twist correction to the API and worked tests. Propagate the final Teichmüller twist through arithmetic specializations; retain explicit Selmer control errors and the missing ordinary-line supplier input.
- `ordinary-filtration`: Remove an ℓ≠p Tate-module citation from the ordinary p-divisible filtration; retain the exact extension request. Propagate the final Teichmüller twist through arithmetic specializations; retain explicit Selmer control errors and the missing ordinary-line supplier input.
- `family-selmer-groups`: Use the continuous coefficient dual and make weight-control errors explicit; (F) does not remove every local exceptional term. Propagate the final Teichmüller twist through arithmetic specializations; retain explicit Selmer control errors and the missing ordinary-line supplier input. Complete the API with the explicit extensionality, membership or quotient-factorization interface used by consumers.
- `family-selmer-complex`: Remove unconditional perfectness/control/determinant claims unsupported by the supplier, and retain local comparison cones and extended-Selmer terms. Propagate the final Teichmüller twist through arithmetic specializations; retain explicit Selmer control errors and the missing ordinary-line supplier input.
- `big-beilinson-kato-classes`: Restrict Euler primes to outside S, correct the negative trace coefficient and retain the j=1 twist and nonempty r=1 norm relations. Propagate the final Teichmüller twist through arithmetic specializations; retain explicit Selmer control errors and the missing ordinary-line supplier input.
- `family-big-logarithm`: Correct the pole-residue quotient and separate the KLZ regulator from Ochiai’s integral Coleman map and height-one length theorem.
- `two-variable-l-function`: Keep fractional values without normality, use Ochiai’s separate length input and require an integral period comparison for a branch-unit ratio.
- `euler-system-divisibility`: State characteristic-ideal inclusion direction and avoid importing the supplier’s dimension-two Fitting equality into the three-dimensional family ring.
- `coleman-family-regulator`: Use Iwasawa cohomology for the rank-one regulator and specify the Eichler–Shimura vector carrier.

### L5

- `totally-real-weight-algebra`: Use coset-module freeness rather than a canonical quotient-group algebra splitting; correct torsion and arithmetic-prime tests.
- `hida-freeness`: The E11 repair still lacks finite generation on all torsion-character factors; retain that proof gap rather than infer it from untwisted coinvariants.
- `hida-hecke-finite`: Retain Corollary3.4 as a conditional target; the finite-generation/completed-projectivity gap inherited from the corrected Proposition3.3 remains explicit.
- `hida-control-nearly-ordinary`: Retain the sourced higher-weight control target with its primary Hida input gap and corrected finite-generation prerequisites.
- `algebraic-primes-dense`: Retain Lemma3.8/Corollary3.9 with their finite-flatness/control inputs conditional on the corrected ordinary finiteness gap.
- `quaternionic-ordinary-projector`: Expose the centre-quotient mismatch in the class-set supplier and require the finite-fibre comparison.
- `nearly-ordinary-hecke-algebra`: Disambiguate the quaternionic API name from the rational nearly ordinary algebra and replace the unproved infinite-rank test.
- `ordinary-towers-duality`: Qualify CharacterModule as algebraic and explicitly import continuity/topology for the limit duality.
- `lambda-adic-hilbert-forms`: Impose totally odd character, separate ordinary freeness from the definition and keep the p-depleted Eisenstein convention at every weight. Complete the API with the explicit extensionality, membership or quotient-factorization interface used by consumers.
- `hida-family-fourier-embedding`: Prove localization into an infinite coefficient product by a common denominator, without claiming localization commutes with arbitrary products.
- `hilbert-hecke-reduced`: Keep full ordinary newform semisimplicity as a source input, including the U operators, rather than deduce it from good-prime normality.
- `hecke-total-fraction-ring`: Qualify the pinned FractionRing: it is the total quotient localization even for rings with several minimal primes.
- `quaternionic-period-module`: Use finite-module faithfulness and remove the impossible zero-support maximal-ideal test; retain freeness/multiplicity-one as explicit conditions.

## Source issues and version limits

All 14 inherited findings were checked independently; four additional defects were recorded. All 18 have a `confirmed` verdict with an individual argument. “Confirmed” is scoped to the version actually read. In particular, the Springer published Bellaïche PDF was not obtained; the official article page required subscription, and the attempted PDF endpoint returned HTML. The early arXiv text and the 2011 author copy must not be called the published paper. The later author version already fixes the tensor-dual and specialization defects; the fixed-radius sequence is absent there. The source ledger preserves these distinctions and SHA-256 values. No uncleared book was read or copied; maintainer-cleared author copies were read in place, and no passages or files from that library were copied into the repository or scratch.

- **PadicFamilies/E1 — misprint**, [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Lemma 4.5, proof, pp. 29–30 (author manuscript, 2 August 2006). The preceding Newton bounds are logarithmic; replace t by log(t) in the displayed inequalities. This checks the stated repair, scoped to the manuscript read.
- **PadicFamilies/E2 — misprint**, [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Lemma 4.5, proof, p. 30. The construction needs V∩W=∅ and X∪W=B. Since V⊆X, X∪V=X cannot be the asserted covering identity in general.
- **PadicFamilies/E3 — error**, [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Lemma 4.5, proof, p. 29. For P(T)=1+uT and d=1, omitting n=0 permits a chart with no root in the selected radius over some base points. Including n=0 supplies the necessary uniform lower bound on the leading coefficient.
- **PadicFamilies/E4 — gap**, [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Theorem 4.6, proof, pp. 30–31. Record f_r⁻¹(X_α)⊆Y_α for old blocks. This inclusion follows from s_α>r and closes the uncovered old-block branch in the induction; the finding concerns the written proof bookkeeping.
- **PadicFamilies/E5 — gap**, [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), §5, construction of the slope factor, p. 34. Full root multiplicities in an open-and-closed selected spectral block make the resultant nonvanishing at each maximal ideal, hence a unit. That supplies the hypothesis required by Theorem3.3.
- **PadicFamilies/E6 — misprint**, [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Lemma 5.6, proof, p. 40. The cyclic identity is Lemma2.12, whereas Lemma2.13 concerns base change. The correction is a reference-number repair.
- **PadicFamilies/E7 — misprint**, [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), §5, the data of Construction 5.7, p. 41. For X_i⊆X_j the map goes from the module on X_i to the base change of the module on X_j. The corrected source and target make the cocycle law type-consistent.
- **PadicFamilies/E8 — gap**, [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Lemma 5.9, proof, p. 42. Use Lemmas5.4–5.5 for flat coefficient extension and show a nonzero-φ eigenvector lies in the finite Riesz summand. Separatedness alone does not make that comparison.
- **PadicFamilies/E9 — gap**, [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), Lemma 5.5, proof, p. 37. BGR9.1.4/2 gives affinoid intersections in a separated space. Finite covering of each affinoid truncation is the additional admissibility argument.
- **PadicFamilies/E10 — misprint**, [Potential automorphy and the Leopoldt conjecture](https://arxiv.org/pdf/1409.7007v2), §2.4, Lemma 2.10(2), p. 9, and Lemma 2.11(2), p. 9 (arXiv v2). The equation fT₁=T₂f requires T₂ to act on N, or on the target complex D•. This is the printed domain misprint in the read arXiv version.
- **PadicFamilies/E11 — gap**, [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, Proposition 3.3 and its proof, pp. 35–36 (Numdam PDF pages 32–33). An idempotent summand of a finite group-ring free module is projective; with prime-to-p torsion there are several local character factors whose ranks need not agree. The proposed finite-generation repair was strengthened: untwisted coinvariants do not control all torsion factors, so completed projectivity/finite generation remains an explicit gap.
- **PadicFamilies/E12 — gap**, [Critical p-adic L-functions](https://arxiv.org/pdf/0912.2925v1), §3.2.3, Proposition 3.6 and its proof, pp. 27–28 (arXiv v1). The omitted proof is acknowledged in the early text. The later author Proposition3.15, pp.33–34, outlines a Poincaré-duality construction for the dual Eisenstein quotient but still refers to forthcoming details. The cuspidal supplier alone does not prove the full comparison.
- **PadicFamilies/E13 — gap**, [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §2, standing hypothesis, p. 7, as applied to Λ = ℤ_p[[ℤ_p^×]] in Parts III–IV. Apply the argument factorwise for the finite product and retain bounded finite-projective complexes; finite projective modules of different factor ranks need not be globally free. This verifies the required semilocal extension, not a failure of the factorwise theorem.
- **PadicFamilies/E14 — error**, [Critical p-adic L-functions](https://arxiv.org/pdf/0912.2925v1), §3.2.1, the isomorphism (10) and the sentence after it, p. 25; used in the proof of Proposition 3.3(i) and (iii), p. 26 (arXiv v1). The divisors n({0}−{∞}) give infinitely many distinct orbits and their values must satisfy additivity. A finite Manin-generators embedding replaces the false direct-sum formula. The later Theorem3.10/Corollary3.12 computes a nonzero weight0 negative-sign E₂ cokernel, so the early unrestricted specialization assertion is also false.
- **PadicFamilies/E15 — error**, [Critical p-adic L-functions](https://arxiv.org/pdf/0912.2925v1), Lemma3.1(iii), §3.1.3, p.23, arXiv:0912.2925v1 (early preprint only). For R=ℚ_p⟨T⟩ and A[1]=ℚ_p⟨z⟩, evaluation z=T has moments T^n. Modulo p they span an infinite-dimensional coefficient space, whereas uniform approximation by a finite tensor sum gives moment values in a finite-dimensional coefficient space modulo p. Therefore this functional is outside R⊗̂D[1].
- **PadicFamilies/E16 — misprint**, [Critical p-adic L-functions](https://arxiv.org/pdf/0912.2925v1), Proposition4.11, §4.3.1, p.39, arXiv:0912.2925v1; also Proposition4.11, p.44 of the 2011 author version. The preceding Proposition4.6 chooses uniformizers of the geometric DVRs. Evaluating t^e=u at x forces t(x)^e=u(k)=0. The printed nonvanishing signs contradict both the zero-locus assertion and the intended local normal form.
- **PadicFamilies/E17 — error**, [Critical p-adic L-functions](https://arxiv.org/pdf/0912.2925v1), §3.2.2, p.26 and the displayed θ sequence in §3.2.3, p.27, arXiv:0912.2925v1 (early preprint only). At k=0 and r=1, the bounded functional μ with μ(1)=0 and μ(z^n)=1 for n≥1 lies in kerρ₀. The only derivative-transpose preimage has ν(z^n)=1/(n+1), unbounded at n=p^a−1. Thus it is not in D[1]. Radii<1 also introduce separate polynomial kernels on residue discs.
- **PadicFamilies/E18 — error**, [Critical p-adic L-functions (later author version)](https://people.brandeis.edu/~jbellaic/preprint/criticalbeforepublication2.pdf), Lemma3.3 proof, §3.1.3, p.25, criticalbeforepublication2.pdf (51-page author copy, metadata 22 July 2011). A nontrivial p-power finite-order character has κ(γ)=ζ_p but log(ζ_p)=0, so the proposed exponential character has value1 at γ. On a general affinoid log(κ(γ)) can also lie outside the exponential convergence radius. The deeper-subgroup proof avoids both problems.

## Remaining work and reader replacements for the orchestrator

The issue permits edits to the packet, suggested file and review report, plus this job’s handoff. It does not permit editing `research/blueprint/readmes/PadicFamilies.md`. The existing reader therefore remains stale; accepting the packet must not be interpreted as approving its old formulas. Apply these concrete changes when regenerating the reader from the accepted packet:

1. L0: use Katz’s q-expansion completion, Γ-invariants in Hida’s reduction, the positive-coefficient lattice modulo constants, the actual equal-rank control proof and the corrected component/Teichmüller convention. The Δ example must use its ordinary p-stabilization, not the original form.
2. L0a: require a cofinal stable finite-quotient basis; include coefficient-ring completeness and the finite-residue-field hypothesis; state local finiteness for the pair (complex, endomorphism). The ordinary direct factor and a chosen representative’s projector are distinct. Retain the corrected Pilloni stability nonexample.
3. L1: distinguish EPW’s homology eigenquotient from the saturated cohomology eigenline and a weight ideal from a full Hecke eigenpacket ideal. State raw annihilator congruence definitions and the double-annihilator condition; do not transfer Hida’s principal-annihilator conclusion without the free-closure comparison. Keep the residual ordinary Ihara input and the separate Hecke-diamond/cyclotomic Euler-factor actions.
4. L2: replace full tensor-dual equality by the evaluation pairing and bounded multiplication action. State nice-chart property(Pr)/compactness and the E₂ specialization cokernel, and use `g` throughout local algebras, points, sheaf weight fibres and the forms comparison. Describe the global chart/descent construction as the precise missing input.
5. L2a: retain the corrected finite-flat constant-rank hypotheses and the already planned R2 inputs. Import the existing finite-projective determinant. Separate fibre algebra, specialized Hecke image and residue fibre; distinguish the alternating complex Fredholm series from V(Ann H•). Density/classicality needs the additional arithmetic inputs.
6. L3: use H¹_f(ad ρ_f) for decency, the (k+1)-st theta derivative with radius loss, the exact exceptional Eisenstein sign/tame component, geometric henselian DVRs and the diagonal family eigensymbol. Describe secondary functions as a Mellin-image filtration, not an automatically independent basis; non-theta infinitely-many-zeros uses the paired-refinement input.
7. L4: propagate the Ochiai geometric-Frobenius/cohomological convention and χ^jωⁱ twists; do not identify the EPW representation before the dual/Tate-twist bridge. Require the integral ordinary-line input. Retain Selmer control errors, perfectness/normality and other-cohomology factors; separate KLZ’s pole-residue regulator from Ochiai’s integral length theorem. The Euler-system containment is (L_p·P_τ^k)⊆char(Sel∨). State the Coleman regulator only around a noble refinement with LZ’s reduced-coefficient and non-zero-divisor hypotheses.
8. L5: `+` means adjoint Hecke action; weight-group finite freeness is module coset freeness. Arithmetic kernels are cyclotomic polynomials, not individual linear factors over ℤ_p. Require all torsion-character finite-generation/projectivity inputs and the unquotiented class-set comparison. Retain totally odd/p-depleted Hilbert conventions, the separate arbitrary-F parallel-weight control and full ordinary Hecke semisimplicity input, a common denominator in Fourier localization and Hecke-rank-one freeness for an invertible period module.
9. Replace the source-version and errata prose by the corrected 18 entries, explicitly distinguishing early preprint defects from later local repairs. Include every packet gap and exact request rather than describing the arithmetic family layers as closed.

No mathematical decision is needed to accept this corrected pass. The orchestrator must route the remaining inputs to their owners and synchronize the reader before packaging. The handoff gives the complete gap list and the ownership moves needed by higher consumers; no dependency is changed in another roadmap by this review.

## Validation and suggested Lean

`python3 scripts/check_blueprint.py research/blueprint/packets/PadicFamilies.json` reports zero errors and zero warnings. The 18 source issues and version records also pass `check_errata.py` when projected into its required `errata-v1` wrapper; no separate errata deliverable is submitted. A consistency check confirms exactly one review verdict for each of the 121 node IDs, all source findings reviewed, all 69 baseline entries checked, and at least three tests for each definition/construction.

`lean-check research/blueprint/suggested/PadicFamilies.lean` completed with exit status0 and only 12 `sorry` warnings. Memory was checked before compiling; no Lean server or new build was started. The file is now 125 lines (the previous 660-line file contained 77 `sorry`s). It has real light definitions on existing module/quotient carriers, finite and locally finite ordinary milestones, the raw congruence quotient/ideal, and discriminating examples. There are no sorry’d data definitions, fabricated rigid/Banach/Galois carriers or development chains. Heavy arithmetic and geometric constructions remain precise packet targets. Elaborating statements with proof placeholders verifies their Lean typing, not their proofs.
