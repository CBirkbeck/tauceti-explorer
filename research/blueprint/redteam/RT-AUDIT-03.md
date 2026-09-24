# RT-AUDIT-03 — independent attack on the accepted library audit

Agent: Codex, session `codex-c83e7a`. Issue: #1556. Sources read: 24 September 2026. Status: complete.

Four corrections are warranted: one mathematical error (high) and three bounded library-coverage errors (medium). The original audit correctly recognizes substantial existing infrastructure and substantial missing analytic, reciprocity and higher-dimensional theory. These findings do not replace that assessment with a claim that the final theorems exist.

## Scope and method

The reviewed target is [AUDIT-03.result.json](https://github.com/CBirkbeck/tauceti-explorer/blob/1d808cc77a52eb4d4d9cce7a53c7d684fc2c1244/research/blueprint/audit/AUDIT-03.result.json), with its accepted independent review. The pinned libraries are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All source links below use those immutable commits; atlas quotations use the acquired atlas commit. A later refresh to `3d4fd6fb7e56c5e69cc9053e2e810b454a023fe5` found no changes to the guarded inputs.

| Roadmap | Layers | Targets | Duplicate leads |
| --- | ---: | ---: | ---: |
| Higher local fields and higher class field theory | 8 | 29 | 16 |
| Effective bounds | 4 | 13 | 4 |
| Integral lattices | 5 | 33 | 5 |
| Chebotarev | 14 | 51 | 17 |
| Class field theory | 15 | 72 | 20 |
| Total | 46 | 198 | 62 |

Every cited declaration was checked at statement level: 501 occurrences, 444 distinct declarations, 182 cited files. Five further files supply counterevidence, for 187 files verified byte-for-byte against the pinned tree hashes. The checks found no `sorry` or `admit` outside comments in these files and no cited axioms. Multiline `letI`/`haveI` statements and structure fields were included, not cut off at an internal assignment. This is source inspection, not an independent proof audit or a Lean compilation.

For all 81 absent and 36 partial targets, searches started with the declaration index and continued in both full source trees. Twenty-two topic searches covered the missing constructions and plausible alternative names. Existing ordinary local fields are not higher local fields; Hodge–Tate twists do not supply de Rham–Witt theory; generic Galois categories do not supply the needed étale fundamental group; central simple algebras are not yet a packaged Brauer group with local invariant; low-degree or negative transfers are not an all-degree Tate/class-formation package. Searches which found only those foundations did not erase the audited gaps.

## Findings

### RT-AUDIT-03/1 — high — error

**Location:** `research/blueprint/audit/AUDIT-03.result.json :: roadmaps["tauceti:TauCetiRoadmap/Chebotarev"].layers["tauceti:TauCetiRoadmap/Chebotarev#layer-12-the-weighted-transfer-package-and-the-tauberian-theorem"].targets[0].target (12.1); inherited from content/tau-ceti/Chebotarev/README.md, 12.1`

Deleting ramified Euler factors does not preserve the residue of the trivial-character L-series. The audited target repeats “simple pole with the same residue”, which is false when the deleted set is nonempty. The residue-one assertion belongs to the negative logarithmic derivative.

**Evidence.** Read Chebotarev 12.1 at https://github.com/CBirkbeck/tauceti-explorer/blob/1d808cc77a52eb4d4d9cce7a53c7d684fc2c1244/content/tau-ceti/Chebotarev/README.md#L498-L500. Write P_S(s)=product over p in S of (1-(Np)^(-s)). Then L_1(s)=zeta_K(s) P_S(s), hence its residue is kappa_K P_S(1). Every Np>1, so for nonempty finite S this positive factor is strictly less than one. Mathlib NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT and dedekindZeta_residue_pos (https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/DedekindZeta.lean#L65-L78) give precisely the positive one-sided real residue needed for this contradiction, without assuming the missing continuation theorem. In the rational case riemannZeta_residue_one (https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/RiemannZeta.lean#L242) gives residue 1, while (1-2^(-s)) zeta(s) has residue 1/2. The audited TauCeti.dedekindZeta_eulerProduct_hasProd (https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean#L386-L388) and EulerProductData.restrictAway (https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Data.lean#L208-L218) use the usual Euler-factor deletion convention.

**Correction.** Replace the audited target with residue kappa_K times product (1-1/Np); separately state that -L_1'/L_1 has principal part 1/(s-1), since -L_1'/L_1=-zeta_K'/zeta_K-P_S'/P_S and the last term is regular at 1. Keep the missing continuation/boundary package missing and retain the intended density constant. Record that upstream roadmap 12.1 needs the same mathematical correction; do not interpret the audit correction as permission to edit that roadmap outside a fixing job.

### RT-AUDIT-03/2 — medium — library-claim

**Location:** `research/blueprint/audit/AUDIT-03.result.json :: roadmaps["tauceti:Completed/IntegralLattices"].summary and layers["tauceti:Completed/IntegralLattices#layer-1-lattices-with-forms"].verdict, targets[9] (form scaling)`

The “fully built” / “Nothing required is missing” assessment overlooks the roadmap's nonzero rational form-scaling requirement. The cited bundled lattice API supports integer scaling; it does not implement the rational scaling operation with the integrality condition required to stay in IntegralLattice.

**Evidence.** Layer 1 explicitly requests scaling by a nonzero rational (https://github.com/CBirkbeck/tauceti-explorer/blob/1d808cc77a52eb4d4d9cce7a53c7d684fc2c1244/content/tau-ceti/Completed/IntegralLattices/README.md#L211-L216). At the pin, TauCeti.IntegralLattice.scale has argument (n : Z), and signature_smul_of_neg has {n : Z} (https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice/Scaling.lean#L74, #L248). The file explains that rational scalars with an integrality hypothesis are a later development (#L20-L23). dualCarrier_smul also takes {n : Z} (https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice/Dual/Scaling.lean#L71); its rational inverse on the right does not enlarge the scalar type of the lattice on the left. Declaration-index and source searches through scaling, rationalization, duality, and generic bilinear/quadratic signatures found the integer action and generic form lemmas, not the missing conditional bundled API. On carrier Z, B(x,y)=2xy and r=1/2 give a valid integral scaled form xy that is not an integer rescaling of B. Conversely r=1/2 applied to B(x,y)=xy is not integral, so an unconditional rational action is not the repair.

**Correction.** Credit integer scaling, negation and orthogonal sums as built, but split out rational form scaling with an explicit integrality hypothesis and its bundled invariant/transport statements, marking that remainder missing (or the combined target partial). Change Layer 1 to partly built and qualify the roadmap summary. Reuse generic rational-form signature lemmas; do not replan the existing integer action, and do not demand an impossible unrestricted Q-action on integral lattices.

### RT-AUDIT-03/3 — medium — library-claim

**Location:** `research/blueprint/audit/AUDIT-03.result.json :: roadmaps["tauceti:TauCetiRoadmap/Chebotarev"].layers["tauceti:TauCetiRoadmap/Chebotarev#layer-7-the-auxiliary-prime-and-the-crossing-data"].targets[4] (7.4 ramification)`

The target combines two assertions and marks both absent. Unramifiedness in the compositum descending to its two intermediate factors already follows from a general Mathlib tower theorem. The search limited to Chebotarev/cyclotomic files missed it.

**Evidence.** Algebra.IsUnramifiedAt.of_liesOver, https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/RamificationInertia/Unramified.lean#L83-L87, states IsUnramifiedAt R P -> IsUnramifiedAt R p for a prime P of T over p of S in R -> S -> T, with essential finite type over R, S Dedekind, T a domain and torsion-free over S. Instantiate R=O_K, T=O_M and S=O_L or O_{K(zeta_q)}; number-field integer rings supply the domain/Dedekind/finite-algebra conditions, and integral lying-over supplies primes above each intermediate prime. Read the statement and tower context at the pinned commit after declaration-index and full-tree searches. This is descent to an intermediate ring with the original base fixed, unlike IsUnramifiedAt.of_restrictScalars in https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Unramified/Locus.lean#L62-L64. It does not prove that all new ramification of the compositum is supported over q.

**Correction.** Split targets[4]: cite Algebra.IsUnramifiedAt.of_liesOver with fit “more general” for descent of unramifiedness, recording the ring-of-integers specialization/lying-over bridge. Keep the assertion about primes newly ramified in M lying over q as an unbuilt compositum result. Mark the combined target partial if retained as one row; Layer 7 remains partly built.

### RT-AUDIT-03/4 — medium — library-claim

**Location:** `research/blueprint/audit/AUDIT-03.result.json :: roadmaps["tauceti:TauCetiRoadmap/Chebotarev"].layers["tauceti:TauCetiRoadmap/Chebotarev#layer-4-cyclotomic-galois-characters"].targets[2].note and declarations (conductor)`

The categorical statement “no conductor of a cyclotomic extension or character is defined” omits existing Dirichlet-character conductors and their cyclotomic field interpretation over Q. The missing general GlobalNumberFields conductor modulus should be distinguished from these built foundations.

**Evidence.** DirichletCharacter.conductor (https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/DirichletCharacter/Basic.lean#L246-L253) is the minimum factorization level, with conductor_dvd_level and factorsThrough_conductor. IsCyclotomicExtension.Rat.mem_intermediateFieldEquivSubgroupChar_iff_conductor_dvd (https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Cyclotomic/Galois.lean#L219-L222) identifies the character subgroup attached to Q(zeta_m) inside Q(zeta_n), m dividing n, with characters whose conductors divide m. The ambient section assumes a cyclotomic extension of Q of nonzero level n, a suitable coefficient ring with enough roots of unity and the abelian Galois structure; the intermediate field has the stated cyclotomic and Galois hypotheses. These are actual conductor definitions and a field/character comparison, not just similarly named order conductors. They do not give a ray modulus of an arbitrary number field, its infinite component or the required global reciprocity comparison.

**Correction.** Replace the blanket absence note with the precise boundary: natural-number Dirichlet conductors and the rational cyclotomic field/character dictionary are in Mathlib; the arbitrary-number-field GlobalNumberFields modulus and its comparison remain missing. Add these declarations as special-case/related evidence. Split the target or mark it partial if it includes the rational foundation; if the target is kept strictly as the missing GlobalNumberFields bridge, it may remain absent with the corrected note. Do not claim that a general ray conductor has been formalized.

## Boundary checks and claims retained

The higher-local-field audit correctly limits existing coverage to such foundations as ordinary local fields, valuations, Witt vectors, completions and generic Galois categories. The searched Milnor-symbol, higher reciprocity, higher topology and wild-coefficient interfaces were not located at the pins.

For effective bounds, the cited explicit constants and counting statements have their advertised hypotheses. An input-dependent regulator estimate is not a proved positive-unit-rank bound; the rank-zero regulator case is already accounted for. The Hermite statements include their finite-dimensional instances and threshold conditions.

For lattices, the Smith decomposition for nondegenerate lattices and the bilinear odd-overlattice comparison are present even though the upstream status text had called them open. The audit correctly distinguishes bilinear discriminant forms from the even quadratic refinement and handles degeneracy via the radical quotient. Findings about rational form scaling do not invalidate orthogonal sums, integer scaling, the Nikulin correspondence or ADE examples.

For Chebotarev, the arithmetic Frobenius orientation and norm exponent, conjugacy-class carrier, restrictions with inertia-degree powers, ramified zeros, inverse character factor and tagged-field order divisibility agree with the read statements. The prime-power weight is essential. The private order-four lemma occurs twice, but the audit expressly notes its private status; this alone is not a new defect. The existing Fourier-smoothed Wiener–Ikehara results do not give the missing unsmoothed prime-ideal asymptotic, and the real one-sided zeta residue does not give the missing complex boundary theorem. Finding /1 corrects the residue of the series while leaving the negative logarithmic derivative's coefficient one.

For class field theory, generic reciprocity/existence, the Brauer invariant/local duality packages, Hilbert symbols, class formations and general Weil groups remain distinct missing goals. Existing ray class infrastructure, cyclic cohomology and low-degree transfers, and the explicit elementary-two/genus-field results are real foundations, not proofs of unrestricted class field theory.

## Ownership and duplicate leads

All 62 listed leads were checked against the relevant portions of their 43 distinct owner stages and current ownership/link material. Section 15 allows a list to flag deliberate handoffs; the word `duplicates` by itself is not an instruction to delete a consumer. The general analytic boundary package and its Chebotarev specialization have different roles. Construction A still needs coordinate-code comparisons even when abstract lattice gluing is built. Higher-dimensional analogues are not ordinary local class field theory, and an exponent-two explicit class field is not the unrestricted existence theorem. No further precise, evidenced duplicate correction is asserted by this audit attack.

## Verification and limits

`python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-03.result.json` and `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-AUDIT-03.result.json research/blueprint/redteam/RT-AUDIT-03.md` pass. Exact rational arithmetic checks give the deleted factor at 1 as `1 - 1/2 = 1/2`, and distinguish the integral form `2xy` scaled by `1/2` from the nonintegral form `xy/2`.

No Lean file was changed or compiled. No new theorem is claimed to be formalized. The negative search conclusions are bounded by the names, definitions and source families inspected. Only these two red-team deliverables are submitted; the accepted audit and upstream roadmaps are left for the independent verifier and any resulting fixing job.
