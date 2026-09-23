# Bhatt et al. (2023): globally +-regular varieties and the MMP for threefolds in mixed characteristic, extraction and routing

Issue [#1444](https://github.com/CBirkbeck/tauceti-explorer/issues/1444). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged checkpoints (Codex and Claude Code), whose report follows below as history.
- **The paper.** B. Bhatt, L. Ma, Z. Patakfalvi, K. Schwede, K. Tucker, J. Waldron and J. Witaszek, *Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic*, Publ. Math. IHÉS 138 (2023), 69–227 (open access).
  - The published PDF was re-fetched; its SHA-256 (a07fcb79…) matches the checkpoint.
- **Items.** The result has **273 items: 7 library, 11 planned and 255 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Eight are recorded under `sourceIssues`.

## This continuation (cc-442dc5)

**New items.** Lemma 6.7 (global +-regularity passes to smaller boundaries) and Conjecture 6.17 (statement only).

**New finding.**
- **E8 (affects nothing).**
  - The step: the proof of Lemma 4.20 applies Lemma 2.36 to D_Y = ⌈π*L + A_Y⌉, which need not be Q-Cartier.
  - Why it holds: Lemma 2.36's argument needs only D_X to be Q-Cartier. Pull back div(g) + D_X ≥ 0 and use D_Y ≥ f*D_X. So the step is valid, and this resolves gap-weil-adapter.

**Gaps.**
- gap-weil-adapter is resolved.
- gap-resolution-centres is recorded as E6.
- The others are deferred as cited suppliers' proofs, design work or proof-checking. gap-section-nine-scope is among them: the items carry the repaired supplier choices for §9.

**Unchanged.** Lemma 2.56's second assertion (E1) is the one finding that affects a stated result.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.

## Mistakes found (`sourceIssues`)

- **E1** (error; affects a stated result), Lemma 2.56, second assertion, p.101 of the published version; the same wording is arXiv v1 Lemma 2.37 (p.20), v2 Lemma 2.50 (p.26) and v3 Lemma 2.56 (p.29). *Printed:* "More generally, let D be a fixed divisor and let A be a semiample Q-Cartier Q-divisor such that A ∼_Q M + Λ, where M is an effective Cartier divisor with no exceptional curve of Y → X in its support, and −δD ≤ Λ ≤ δD for δ > 0. Take x ∈ F ∩ M of multiplicity k ∈ Z_{>0} in M. Then ε_sa(A; x) converges to k when δ → 0." *Correction:* Only a lower bound holds. For every rational γ with 0 < γ < k there is δ₀ > 0, depending only on f, D and γ, such that ε_sa(A; x) = ε(A; x) ≥ k − γ for all δ < δ₀ and all such A, M, Λ and x. Equivalently, liminf_{δ→0} ε_sa(A; x) ≥ k, uniformly. This is exactly what the printed proof establishes; there is no upper bound.
- **E2** (misprint; affects nothing), Proposition 6.28, p.154 of the published version (and arXiv v3 Proposition 6.28, p.71). *Printed:* "Let Δ ≥ 0 be a Q-divisor on X such that (X, Δ) is globally +-regular (completely purely globally +-regular over R, resp.). Suppose that Δ_Y ≥ 0, where K_Y + Δ_Y = f*(K_X + Δ). Then (Y, Δ_Y) is globally +-regular (globally +-regular, resp.)." *Correction:* The conclusion in the resp. case is "completely purely globally +-regular over R", with the pure boundary S_Y the strict transform of S and B_Y = Δ_Y − S_Y. This is what arXiv v2 (Proposition 6.28, p.64) prints, and arXiv v1 (Proposition 6.22, p.48) prints "purely ... purely".
- **E3** (misprint; affects nothing), Proof of Lemma 4.28, p.128 of the published version (also arXiv v2 and v3). *Printed:* "Twisting by the pullback L⁺ to W⁺ of the line bundle O_Y(f*(M − (K_X + S + B))) (for some finite cover f: Y → W), and taking local cohomology, we obtain: ... The left zeros are due to Corollary 3.7 and the fact that L⁺ is the pullback of a big and semiample line bundle." *Correction:* Twist by the pullback of O_Y(f*(K_X + S + B − M)), the inverse of the big and semiample bundle f*(M − (K_X + S + B)). Corollary 3.7 then applies with b = −1 and kills H^{d−1}_m of it.
- **E4** (misprint; affects nothing), Theorem 9.28(c), p.206 of the published version (also arXiv v2 and v3). *Printed:* "(c) For each Γ_i, −4d_{Γ_i} < (K_X + Δ)·Γ_i < 0" *Correction:* −4d_{Γ_i} ≤ (K_X + Δ)·Γ_i < 0, as in the introduction's statement of the same theorem (Theorem I(c), p.74: 0 < −(K_X + Δ)·_k C_i ≤ 4d_{C_i}).
- **E5** (misprint; affects nothing), Theorem 10.6, definition of β(1), p.216 of the published version (also arXiv v3); compare Theorem K, p.76, and the proof, pp.218–219. *Printed:* "β(v) = 393 if v = 1, 213v + 48 if v ≥ 2" *Correction:* β(1) = 373, as in Theorem K ("f(v) = 373 if v = 1"). The printed 393 gives a weaker statement, which the corrected one implies.
- **E6** (error; affects nothing), Theorem 2.13 and Proposition 2.14, p.85 of the published version. *Printed:* "... and let T be a subscheme of X. Then there exists a proper birational morphism g: Y → X from a regular scheme Y such that both g^{−1}(T) and Ex(g) are divisors and Supp(g^{−1}(T) ∪ Ex(g)) is simple normal crossing." *Correction:* T must be a closed subscheme containing no irreducible component of X, that is, nowhere dense.
- **E7** (error; affects nothing), Definition 2.19, p.88 of the published version. *Printed:* "coeff_E Fix(D) = min_{D′ ∈ |D|} coeff_E D′. Note that as D is Cartier the above coefficients are integers and hence the minimum exists." *Correction:* The minimum exists only when |D| ≠ ∅, so the definition needs that hypothesis.
- **E8** (error; affects nothing), Published version, proof of Lemma 4.20, p.122 (final step). *Printed:* Hence the map κ is an isomorphism (Lemma 2.36) *Correction:* Apply Lemma 2.36 in the form that needs only D_X Q-Cartier. D_Y = ⌈π*L + A_Y⌉ on the normal Y need not be Q-Cartier.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **gap-empty-system** (resolved). Resolved by an earlier continuation; see detail.
- **gap-resolution-centres** (recorded). E6; every application uses a nowhere-dense centre. The CP/CJS/KW hypotheses are cited suppliers.
- **gap-seshadri-limit** (resolved). Resolved by an earlier continuation; see detail.
- **gap-adjoint-sign** (resolved). Resolved by an earlier continuation; see detail.
- **gap-weil-adapter** (resolved). E8: Lemma 2.36 holds with only D_X Q-Cartier, so the step in Lemma 4.20 is valid.
- **gap-pure-birational** (resolved). Resolved by an earlier continuation; see detail.
- **gap-cone-length** (resolved). Resolved by an earlier continuation; see detail.
- **gap-section-nine-scope** (deferred). The items carry the repaired supplier choices. Confirming that the printed citations in the proofs of §9 (for example Theorem 9.7 in Proposition 9.36) suffice is proof-checking work.
- **gap-moduli-bound** (resolved). Resolved by an earlier continuation; see detail.
- **gap-kollar-family** (deferred). Patakfalvi's stable-family functor is a cited supplier.
- **gap-ct-erratum** (deferred). Cascini–Tanaka with its v3 correction is a cited supplier.
- **gap-adjoint-version** (deferred). The paper itself notes the v1 error and uses the corrected definition; the completion compatibility is proof work for the implementation.
- **gap-limits-enhancement** (deferred). The enhanced-category limit argument is a cited foundational supplier.
- **gap-bhatt-rh-frontier** (deferred). Bhatt's vanishing and Bhatt–Lurie Riemann–Hilbert are cited suppliers.
- **gap-bcm-tight-closure-frontier** (deferred). The BCM and tight-closure inputs are cited suppliers.
- **gap-lower-mmp-frontier** (deferred). The surface, characteristic-zero and equal-characteristic MMP inputs are cited suppliers.
- **gap-positivity-descent-frontier** (deferred). Keel, Cascini–Tanaka and Witaszek are cited suppliers.
- **gap-stable-moduli-frontier** (deferred). Patakfalvi, PX15, FR06 and Rydh are cited suppliers.
- **gap-ap-version** (deferred). Matching the published AP22 citation is supplier-version work.
- **gap-atomic-closure** (deferred). Declaration-sized splitting is design work; every numbered statement is now an item.
- **gap-library-api** (deferred). Library APIs and tests are implementation work.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## PAPER-BHATT-ETAL-23: published-paper extraction checkpoint

Session: Codex `codex-a71f92`; issue #1444; 2026-09-22. Status: **partial**.

### Scope and evidence

Bhatt–Ma–Patakfalvi–Schwede–Tucker–Waldron–Witaszek, [Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic](https://doi.org/10.1007/s10240-023-00140-8), *Publications Mathématiques de l'IHÉS* 138 (2023), 69–227.

The entire published paper was read, including proofs and bibliography. Selected arXiv v3 passages were compared; this is not a full collation of that preprint. The published source is CC BY 4.0 (p220): [licence](https://creativecommons.org/licenses/by/4.0/). This report paraphrases the authors and explicitly distinguishes worker diagnostics and proposed repairs from their assertions.

The [machine-readable extraction](PAPER-BHATT-ETAL-23.result.json) has **271 items**, **554 dependency edges**, **60 definition/construction entries**, **180 mathematical planning tests**, and **15 routes**. Seven item groups cite pinned library declarations, eleven import existing planned interfaces, and 253 remain missing. Every missing item has exactly one route. These counts describe this checkpoint, **not exhaustive transitive closure**. Of the 21 gaps below, 15 remain open; they cover original-source proofs, statement refinements and atomic splitting still needed. Six diagnostic gaps were resolved by the 2026-09-22 continuation, and seven verified source mistakes are recorded as `sourceIssues` E1–E7.

Items carry source locators, proof outlines, explicit dependencies, reverse consumer uses and blocking gaps propagated through the graph. Each definition has three use-derived API obligations and three mathematical tests. Tests are proposed assertions, not executed Lean examples. A `library` label applies only to the named carrier/theorem, not all newly proposed API.

### What is being planned

The dependency chain runs from integral perfectoid/prismatic and enhanced étale/coherent machinery to Bhatt's finite-cover annihilation, then B⁰ and adjoint B⁰, graded test modules, +-regularity and section lifting, restricted-algebra finite generation and flips, and finally threefold MMP and moduli.

The statements retain their different scopes:

- The closure/vanishing results distinguish finite covers, alterations, a fixed negative power, and the DVR uniform-in-negative-powers assertion.
- B⁰ is an intersection of trace images. The adjoint construction first sums over the boundary-component ideals in the cover; its trace image is a sum, not necessarily an internal direct sum.
- Ordinary, complete, local-complete, pure and complete-pure +-regularity are not interchangeable. General adjoint completion compatibility is explicitly left open in Remark4.30.
- The Fujita exponent in Theorem5.9 is `dim X − dim R + 1`; finite-summand singularities, flatness, ampleness and global generation are retained.
- Theorem7.2 uses a Cartier target, normalized centre and the stated big/semiample adjoint difference. It is not unrestricted section extension.
- Standard-coefficient pl-flips with residue characteristic >5 differ from the one-complement branch valid in the source's wider residue scope.
- Threefold means **absolute dimension three**. Theorem9.17 is the big basepoint-free theorem; the nonbig theorem9.27 has additional hypotheses. Pseudoeffective arbitrary-MMP termination and nonpseudoeffective scaling termination are separate endpoints.
- Relative cone lengths keep the degree factor `d_C` and the non-strict bound supported by the proof.
- Theorem10.2 constructs the stable-surface stack and coarse algebraic space. Properness and projectivity in10.6 concern the **closure of the smooth locus**, after more primes are inverted, not the entire stack over Z[1/30].
- Corollaries L and M are included: Weil/symbolic finite generation and dimension-four F-regular ⇒ strongly F-regular. Weak F-regularity is not silently substituted.

### Existing library and atlas boundaries

Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. Actual declaration statements were opened, not inferred from search names. The reviewed library-coverage blob is `5e708cfc74a51b10e62149113872fe4e00eb5846`.

Library item groups:

- `weak-regular`: `mathlib:RingTheory.Sequence.IsWeaklyRegular`, `mathlib:RingTheory.Sequence.IsRegular`.
- `line-bundle`: `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `tauceti:TauCeti.SheafOfModules.IsInvertible`.
- `cohom-module`: `tauceti:AlgebraicGeometry.Scheme.Modules.cohomologyModule`, `tauceti:AlgebraicGeometry.Scheme.Modules.cohomologyMapLinear`, `tauceti:AlgebraicGeometry.Scheme.Modules.cohomologyZeroLinearEquiv`.
- `local-cohom-carrier`: `mathlib:localCohomology`.
- `derived-carrier`: `mathlib:DerivedCategory`, `mathlib:DerivedCategory.Q`.
- `fekete`: `mathlib:Subadditive.tendsto_lim`.
- `circle-density`: `mathlib:AddCircle.denseRange_zsmul_coe_iff`.

The regular-sequence carrier used by the paper is weak regularity; Mathlib's stronger `IsRegular` also imposes a nonzero final quotient. The scheme-cohomology module is a carrier and functorial API, not singular duality. Fekete's theorem supplies the real coefficient limit after sign reversal, and single-circle density is not simultaneous torus semigroup approximation.

Existing planned suppliers are imported by exact IDs in the JSON. Important ownership findings:

- JacobianChallenge J-C is the general coherent-base-change owner, not only a curve theorem; do not follow stale A0 audit prose into duplication.
- DerivedDeRham DD.1 owns generic derived completion; EnhancedDerivedSheaves adds sheaf/enhancement adapters.
- Integral perfectoid rings come from PerfectoidQuotients Q0, not just Tate perfectoid fields.
- EDC.5 applies F_p perverse sheaves to characteristic-zero generic fibres, not the characteristic-p special fibre.
- LPV.3 already owns second-Veronese pencils. Import them.
- LieGroups Layer2 supplies closed subgroups only; compact component-group finiteness is a missing adapter in torus-approximation.

The full relevant stage descriptions, reviewed audit entries, proposed roadmap files and overlap screens were used. Forty current paper route sets were screened, then five changed results were refreshed at `a57390347a3ba27adb18b8f465a89a7755c5c1e9`. Pending proposals are **not** promoted to planned stages. In particular the André ramification proposal does not close the BCM theorem. Exact source-supplier proof closure remains the work listed below.

### Routing

#### 1. SchemeAndStackFoundations

Source refinement of `SchemeAndStackFoundations:SF.0`. 4 checkpoint items.

Absolute integral closures, reflexive divisor sheaves and base-scope adapters refine the existing scheme foundations. Reuse scheme/module and normality carriers rather than hiding duplicates in the MMP extension.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

#### 2. SchemeAndStackFoundations

Source refinement of `SchemeAndStackFoundations:SF.4`. 4 checkpoint items.

Named three-dimensional pair resolution and Saito's log-smooth extension refine the existing models/alterations direction. Import curve stable reduction and keep the nowhere-dense/projective/ample-exceptional restrictions explicit.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

#### 3. SchemeAndStackFoundations

Source refinement of `SchemeAndStackFoundations:SF.5`. 1 checkpoint items.

The discriminant computation is a concrete Chern/intersection/Thom–Porteous application of the single intersection-theory supplier.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

#### 4. DeformationAndDerivedPatchingAlgebra

Source refinement of `DeformationAndDerivedPatchingAlgebra:R03.3`. 6 checkpoint items.

Use the existing local commutative-algebra owner for Matlis duality, supported local-cohomology comparisons, parameter heights and the complete finite-module inverse-limit theorem. Big-CM singularity applications remain in the pending birational extension.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

#### 5. AnalyticStacks

Source refinement of `AnalyticStacks:AS.1`. 4 checkpoint items.

Add the Noetherian singular coherent-duality, normalized dualizing-complex and finite-trace adapters to the existing coherent formalism. The current proper-smooth theorem is not classified as the full singular theorem. Matlis duality is imported from R03.3, and curve duality from StableReduction remains a distinct restricted export.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

#### 6. DerivedDeRhamCohomology

Source refinement of `DerivedDeRhamCohomology:DD.1`. 2 checkpoint items.

Generic derived completion is canonically DD.1. The paper supplies a quotient-completeness application; EDS E4 only supplies sheaf/coefficient extensions, so no second completion owner is created.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

#### 7. EnhancedDerivedSheaves

Source refinement of `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E3`. 2 checkpoint items.

Remark4.11 is a precise acceptance obstruction for coherent derived limits: ordinary triangulated categorical colimits are not the required enhancement.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

#### 8. LefschetzPencilsAndVanishingCycles

Source refinement of `LefschetzPencilsAndVanishingCycles:LPV.3`. 2 checkpoint items.

LPV.3 already owns actual Lefschetz pencils after a second Veronese and finite-extension descent. Import it into the stable-surface proof; do not create a duplicate pencil roadmap.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

#### 9. AlgebraicModuliForArithmeticGeometry

Source refinement of `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.5`. 2 checkpoint items.

Patakfalvi's explicit Hilbert/Isom atlas and finite-inertia coarse-space argument are applications of these existing suppliers. Stable-surface boundedness, hull strata and determinant positivity require new layers in the separate extension.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

#### 10. SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry

Part II of `SchemeAndStackFoundations`; proposed galaxy `arithmeticgeometry`. 193 checkpoint items.

Reuse the pending identically named route from PAPER-HACON-WITASZEK-23. The present paper supplies its lower-dimensional and plus-regularity foundation; it is not an accepted atlas layer. Do not create a competing MMP or stable-section owner.

Start after Scheme, stack, cohomology and intersection foundations (SchemeAndStackFoundations SF.0/4/5). Import general coherent base change from The Jacobian challenge (tauceti:TauCetiRoadmap/JacobianChallenge, contract J-C), general Proj and polarization from Stable reduction (tauceti:TauCetiRoadmap/StableReduction, Layer2), local algebra and Matlis duality from Deformation and derived patching algebra (DeformationAndDerivedPatchingAlgebra:R03.3), singular coherent-duality adapters from Six-functor formalisms and analytic stacks (AnalyticStacks:AS.1), coherent diagrams from EnhancedDerivedSheaves, and derived completion from DerivedDeRhamCohomology:DD.1. Reuse the pending MixedCharacteristicPositivity, NumericalPicardAndContractionDescent and arithmetic-presentation suppliers by their exact IDs in the other routes. Import integral perfectoid algebra from PerfectoidQuotients:Q0:integral-algebra and the proposed PrismaticCohomologyIntegralRiemannHilbert extension, not a duplicate perfectoid-field theory. Build big/balanced/cohomological CM predicates, closure vanishing, B⁰ and the corrected component-direct-sum adjoint B⁰_S, graded test modules, ordinary/pure/completely-pure regularity, adjunction and lifting, restricted mobile algebras and their saturation/torus-limit proof. Prove Theorems5.8/5.9 only for finite-summand singularities, retaining flatness and globally generated ample L for the exponent dim X−dim R+1. Prove Theorem7.2 with Cartier M, normalized centre and big-semiample adjoint difference. Separate standard p>5 pl-flips from the all-residue one-complement branch. For absolute threefolds over §9's excellent finite-dimensional dualizing base, prove Theorem9.15's non-Q-factorial exceptional MMP and numerical descent under every stated exceptional/Q-Cartier/crepant hypothesis; Theorem9.17 requires L big but no residue exclusions. Theorems9.20 and9.27 require positive-dimensional image and no closed residue2,3,5: distinguish arbitrary pseudoeffective MMP termination from nonpseudoeffective scaling termination9.37. Prove real-boundary cone/polytope statements with the degree factor d_C, terminalizations, dlt modifications and lc inversion10.1. Add Corollary L's arbitrary Weil/symbolic finite generation and Corollary M only after the AP22 version and tight-closure conventions are closed. Preserve all diagnostic gaps, especially the false Seshadri limit and pure-to-ordinary qualifier, and the unknown general adjoint completion equality. This supplies earlier dependencies of Hacon–Witaszek23; its conditional fourfold results stay downstream and do not prove these threefold inputs. Stable-surface moduli has its own consumer route. Every definition needs use-derived API and counterexample tests; the current partial graph still needs the enumerated source closures and atomic splitting.

#### 11. SchemeAndStackFoundationsMixedCharacteristicPositivity

Part II of `SchemeAndStackFoundations`; proposed galaxy `arithmeticgeometry`. 12 checkpoint items.

Coalesce with the same pending candidate already used by PAPER-WITASZEK-22, PAPER-SCHROER-23 and PAPER-HACON-WITASZEK-23; not an accepted planned supplier. For this paper add relative Seshadri thresholds and the actual perturbative lower bound used by Lem8.15/Claim8.21; do not adopt Lem2.56's false limit equality. Extend the EWM criterion to the exact excellent-base scope of Theorem2.50 only after its Artin/Popescu adapter is proved. Include Lemmas2.51–2.55, the nef vertical descent after flattening and nonbig EWM9.26. Resolve the CT20 geometrically-connected-fibre guard and distinguish its 2026 replacement of Prop3.2 from the unaffected divisor-descent statement2.17.

Start after Scheme, stack, cohomology and intersection foundations (SchemeAndStackFoundations), the first prerequisite: import its universal-homeomorphism and direct-limit perfection adapters (SF.0), algebraic spaces, conductor/Picard patching, geometric pushouts and finite quotients (SF.1), formal algebraization and compactification (SF.4), and general intersection theory (SF.5). Import finite-type relative Proj, projectivity, relative ampleness and global generation from Stable reduction (tauceti:TauCetiRoadmap/StableReduction, Layer2), line bundles/divisors/curve degree from The Jacobian challenge (tauceti:TauCetiRoadmap/JacobianChallenge, LayerA), and coherent direct-image/base-change interfaces from its LayerC and StableReduction Layer2. Higher-dimensional representability must use Algebraic moduli and representability for arithmetic geometry (AlgebraicModuliForArithmeticGeometry:A0-extension). Reuse the pending NumericalPicardAndContractionDescent supplier of Picard-τ finiteness; do not rebuild it. Construct relative nefness, bigness, semiampleness, the all-integral-subvarieties EWM predicate with dim f(V)<dim V, and the reduced exceptional locus. Give every construction an API and tests. Prove separately the semiample and EWM gluing assertions of Propositions5.1–5.3, including scheme-theoretic intersections, normalization/conductor diagrams, rational restrictions, geometrically connected fibers and the locally finite residue-field guard in the finite-exception semiample case. Prove Theorem1.10: for nef L on a scheme projective over Noetherian S, semiampleness (respectively EWM) is equivalent to that of the restrictions to X_red and X_Q. Prove Theorem6.1: for X projective over excellent S and nef L, semiampleness is equivalent to semiampleness on E(L) and X_Q; the EWM analogue additionally requires S finite type over a mixed-characteristic Dedekind domain. Decompose the corrected Keeler Fujita proof, thickening section lifts and Artin formal contraction input instead of adding a vanishing black box. The final applications are Corollary6.5 for a plt absolute-threefold pair (X,D+B), D normal irreducible, L nef Cartier, L−(K_X+D+B) ample and E(L)⊆D, over S quasi-projective over a mixed-characteristic Dedekind domain; and Corollary6.7 for a klt normal integral absolute threefold projective and surjective over Spec of a mixed-characteristic Dedekind domain with perfect closed residue fields, L nef and big Cartier and L−(K_X+Δ) nef and big: L is EWM, and is semiample when positive-characteristic closed residue fields are locally finite. Cover the relative surface Proposition6.6, ordered adjunction, conductor degree bounds and numerical-dimension cases. Import the characteristic-zero and Tanaka surface theorems only after their precise hypotheses and proof inputs have been read. Use the stronger κ=ν=1 surface target, not the false bare h⁰>0 formulation, and allow an empty generic conductor. Do not absorb later BMPSTWW generalizations or the paper's conjectures/work-in-progress as proved targets. The current extraction is partial: its enumerated original-source/version gaps must be closed before the design is declared complete. For Hacon–Witaszek23 additionally audit Wit21b Thms1.2/2.22, CT20's corrected dependencies and the Keel/NT20 connected-fibre gluing needed by Props4.5/5.2; retain characteristic-zero fibres and distinguish numerical from Q-linear descent. For this paper add relative Seshadri thresholds and the actual perturbative lower bound used by Lem8.15/Claim8.21; do not adopt Lem2.56's false limit equality. Extend the EWM criterion to the exact excellent-base scope of Theorem2.50 only after its Artin/Popescu adapter is proved. Include Lemmas2.51–2.55, the nef vertical descent after flattening and nonbig EWM9.26. Resolve the CT20 geometrically-connected-fibre guard and distinguish its 2026 replacement of Prop3.2 from the unaffected divisor-descent statement2.17.

#### 12. NumericalPicardAndContractionDescent

Part II of `AlgebraicModuliForArithmeticGeometry`; proposed galaxy `algebraicgeometry`. 7 checkpoint items.

Coalesce with the same pending candidate already used by PAPER-WITASZEK-22, PAPER-SCHROER-23 and PAPER-HACON-WITASZEK-23; not an accepted planned supplier. For this paper export N₁/N¹ over closed-point curves, the inseparable degree factor d_C, normalized extremal curves and the numerical descent statements of2.51,9.15 and9.16. State each exceptional/crepant/nef hypothesis; these do not assert arbitrary numerical equivalence implies Q-linear pullback. Import the ordinary Picard and intersection owners and the birational extension's actual contractions.

Start from Algebraic moduli and representability for arithmetic geometry (AlgebraicModuliForArithmeticGeometry), especially A0-extension, and Scheme, stack, cohomology and intersection foundations (SchemeAndStackFoundations:SF.1,SF.2,SF.5). Construct Pic^τ and Num for arbitrary proper schemes over a field, including nonreduced and disconnected schemes; expose geometric base change, Galois action, numerical equivalence, torsion obstructions and norm maps. Prove the positive-power descent criterion with a numerically trivial twist, then Theorem1.3: constant Num descends geometric contractions with projective target; treat purely inseparable descent separately without the constantness assumption. Prove Theorem2.1 for contractions of smooth proper surfaces: component-graph descent, the geometrically-reduced edge-label assertion, and pure inseparability of residue fields of reducible fibers. Import surface intersections, not their reconstruction. Give each definition an API and at least three tests; include P¹_C/R with permuted numerical components, d=0 as a forbidden criterion, and projectivity versus arbitrary proper targets. The Enriques roadmap consumes these general theorems; it must not own a duplicate Picard theory. Add the killed-by-two numerical-class lift /183 as a sheaf-quotient construction. Import rigidified Picard descent from A0-extension and relative ampleness from R09.1/R09.3; the Enriques consumer owns the local-projectivity application. For Hacon–Witaszek23 add relative rational/real N¹ specialization, the AHK modified rank, the source-guarded Prop5.4 numerical descent and Cartier-index preservation. Separate numerical surjectivity from actual Picard lifting, and close the missing numerical perturbation argument in Thm6.1(2b). No arbitrary numerically trivial divisor is declared pulled back. For this paper export N₁/N¹ over closed-point curves, the inseparable degree factor d_C, normalized extremal curves and the numerical descent statements of2.51,9.15 and9.16. State each exceptional/crepant/nef hypothesis; these do not assert arbitrary numerical equivalence implies Q-linear pullback. Import the ordinary Picard and intersection owners and the birational extension's actual contractions.

#### 13. SchemeAndStackFoundationsPartIIArithmeticPresentation

Part II of `SchemeAndStackFoundations`; proposed galaxy `arithmeticgeometry`. 1 checkpoint items.

Reuse the pending arithmetic-presentation owner from PAPER-CESNAVICIUS-22 for finite/infinite-residue Bertini. It is not yet an accepted atlas layer. The new paper adds simultaneous regular hypersurface sections over a local ring, not another general Bertini owner.

Start after Scheme, stack, cohomology and intersection foundations (SchemeAndStackFoundations), which is the first prerequisite. Import its schemes, smooth/étale/flat morphisms and generic descent; import finite-type relative Proj and coherent-curve interfaces from Stable reduction (tauceti:TauCetiRoadmap/StableReduction, Layer2); import regular sequences, Cohen–Macaulay and dimension-flatness algebra from Deformation and derived patching algebra (DeformationAndDerivedPatchingAlgebra:R03.3). Reuse tangent/jet/incidence interfaces of Lefschetz pencils and vanishing cycles (LefschetzPencilsAndVanishingCycles:LPV.3) where their scope matches; do not identify a finite-extension rational point with a point over the original finite field. Build one geometric-presentation library: arbitrary-base avoidance (3.1); arbitrary-field prescribed-locus Bertini (3.2) with separable reduced marked points, simultaneous incidence inequalities, and iterative degrees divisible by the characteristic exponent; weighted projective charts and section blowups (3.4–3.5), importing rather than rebuilding Proj; the seven separate weighted projection assertions over fields (3.6) and semilocal Dedekind bases (3.7), keeping total and fiberwise codimension distinct. The first final target is Proposition4.1: for smooth positive-relative-dimensional A/O, finitely many points and a closed total-codimension≥2 locus, find an affine neighborhood with a smooth relative-curve map to an affine open in a disjoint union of affine O-spaces, with that locus finite over the target. The second final target is Lemma6.3: over semilocal R, for a flat affine curve with pure one-dimensional Cohen–Macaulay fibers, finite retained Y and finite Z in the smooth locus satisfying the finite-residue degree-point inequalities, find an affine neighborhood and quasi-finite flat map to A1_R that is cartesian and an isomorphism over Z, étale along Z, and agrees on every infinitesimal neighborhood. Supply the finite-cover point-count lemma6.1, simple residue-extension lemma6.2 and monic-polynomial remark6.4. Read CTHK97 §3 to closure and use the corrected p.20 argument for imperfect fields: construct embeddings of first-order thickenings by geometric presentation and disjoint translates, not an unjustified base-linear Cohen isomorphism. No generic rational-section or Grothendieck–Serre torsor target belongs to this geometry supplier. Do not assert nonflat base change for weighted blowups. The current partial extraction exposes the unverified GLL15, Gab01, EGA and commutative-algebra proof obligations; close them before declaring the design blueprint closed. For BMPSTWW Theorem2.17, add simultaneous regular hypersurface sections of finitely many regular closed subschemes of projective space over a Noetherian local domain, using the finite-field Poonen/GK19 and infinite-field FOV branches, lifting and cotangent-space checks. Verify that this regular mixed-local conclusion is not inferred merely from geometric smoothness over an imperfect field.

#### 14. PrismaticCohomologyIntegralRiemannHilbert

Part II of `PrismaticCohomology`; proposed galaxy `padic`. 5 checkpoint items.

PR.4 plans smooth étale comparison, not the integral singular-scheme functor used in Bhatt's absolute-closure vanishing. EDC.5 owns the generic-fibre perverse theory, while Q0 owns integral perfectoid algebra; extend this prismatic direction without duplicating either.

Start after Prismatic cohomology (PrismaticCohomology PR.0–PR.2), using perfected derived prismatic cohomology and its universal-prism comparison from PerfectoidQuotients Q2. Import integral perfectoid rings from PerfectoidQuotients:Q0:integral-algebra, almost mathematics from PerfectoidSpaces:P0, generic derived completion from DerivedDeRhamCohomology:DD.1, and homotopy-coherent diagrams, enhancements and Kan extensions from EnhancedDerivedSheaves E0–E3. Import constructible étale sheaves, Verdier duality and the middle perverse t-structure from EtaleDualityAndPerverseSheaves:EDC.5 and its predecessors. The latter applies to F_p on the characteristic-zero generic fibre; it is not a p-torsion special-fibre assertion. Construct, rather than assume, Bha20 Theorem3.4's exact colimit-preserving RH_Δ:D(X_et,Z/p^n)→D_qc(X_{p^n=0}) for schemes over a perfectoid ring. Prove the constant-sheaf perfected-prismatic formula and proper-pushforward natural isomorphism, with coefficient changes and coherent composition. Under X finitely presented flat over O_C, add generic-fibre almostification, almost coherence, Verdier/Grothendieck duality compatibility and the precise two perverse bounds; split those clauses and retain all shifts and local dimensions. Prove the étale acyclicity of integral normal schemes with algebraically closed function fields, the resulting proper-map mod-p annihilation mechanism, and the prismatic Frobenius/finite-length argument underlying Bhatt's geometric CM theorem. The birational extension owns the general excellent-base approximation and B⁰ applications. Do not identify this with a rational p-adic local-system correspondence or smooth de Rham comparison. The main paper cites BL as in preparation; this worker obtained Bha20's statements and sketches, not the full construction. Locate the authoritative construction and close its transitive proof inputs before this proposed direction is declared complete.

#### 15. AlgebraicModuliForArithmeticGeometryStableSurfaces

Part II of `AlgebraicModuliForArithmeticGeometry`; proposed galaxy `arithmeticgeometry`. 14 checkpoint items.

R09 supplies parameter schemes, stacks and restricted coarse spaces, but no inspected layer owns the stable-surface boundedness/hulls, stable-limit and determinant-positivity theorems. Curve stable reduction is not stable-surface moduli.

Start after Algebraic moduli and representability for arithmetic geometry (AlgebraicModuliForArithmeticGeometry R09.2–R09.5), importing actual Hilbert/Quot, polarized Isom, algebraic-stack and finite-inertia coarse-space constructions. Import coherent base change from The Jacobian challenge (tauceti:TauCetiRoadmap/JacobianChallenge, J-C), relative Proj/polarized descent from Stable reduction (tauceti:TauCetiRoadmap/StableReduction, Layer2), singular duality from AnalyticStacks:AS.1 and intersection theory from SchemeAndStackFoundations:SF.5. Import second-Veronese Lefschetz pencils from LefschetzPencilsAndVanishingCycles:LPV.3, not a duplicate pencil package. Use the pending SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry extension for threefold MMP, lc inversion and canonical singularities; Saito's log-smooth extension belongs to SF.4. Construct Patakfalvi's exact stable-surface groupoid: flat projective families with geometric slc canonically polarized volume-v fibres and EVERY reflexive canonical power compatible with EVERY base change. A naive Q-Gorenstein family over a normal base need not satisfy it. Prove Theorem10.2 separately: Artin finite type, separated finite diagonal, and a separated finite-type coarse algebraic space over Z[1/30] for rational v>0. Build HK19 boundedness, Kollár hull strata, the explicit Hilbert/Isom atlas and the inversion-of-adjunction deformation input, including the central fibre in the normalized pair. Prove Cor10.3's stable lift over an open number ring for finite fields of sufficiently large characteristic. For integer v>0 and d the product of primes≤β(v), with β(1)=373 (Theorem K and the proof; Theorem10.6's printed393 is a misprint, sourceIssues E5) and β(v)=213v+48 for v≥2, prove properness of the CLOSURE OF THE SMOOTH LOCUS over Z[1/d] by Lefschetz pencils, the Saito extension and threefold canonical models; use BK21/Kollár21 CM to verify the central fibre and Kollár conditions. Prove projectivity of its coarse space by the full Pat18 determinant-line argument, finite scheme cover, descent of a power, generic CM-line positivity and the finite bad-prime argument. Neither properness nor finite diagonal alone gives projectivity. Theorem10.6's393 for volume1 is a misprint for373 (E5): the proof's conditions p≥114 and p>deg D, with deg D≤373, hold for every p>373. The entire stable stack over Z[1/30] is not asserted proper. Close the uninspected positivity, boundedness, semistable-extension and canonical-model source proofs before approval.

The birational extension is the same pending owner proposed in PAPER-HACON-WITASZEK-23, now expanded at its logically earlier threefold/BCM inputs. Hacon–Witaszek's special fourfold MMP remains downstream: it is never used circularly to prove these inputs. Positivity, numerical-Picard and arithmetic-presentation proposals likewise retain their existing pending IDs.

### Source mistakes (sourceIssues E1–E7)

A continuation on 2026-09-22 (Claude Code, session `cc-fb70e5`) checked the earlier diagnostics at their locators in the published PDF. The same PDF is used (SHA-256 `a07fcb79…`), with page images for E1–E5, and the passages were collated with arXiv v1, v2 and v3. None has a published correction: Crossref records no update to the DOI, no correction notice was found, and v3 (2022-12-05) is the latest arXiv version. Each is in the JSON's `sourceIssues` with printed text, correction, reason and search record. They are worker findings awaiting the independent review, not author-approved errata. None of them changes a main theorem.

#### E1. Lemma 2.56: the limit is only a lower bound (error; p.101)

The second assertion says that ε_sa(A; x) "converges to k when δ → 0". The same wording is in v1 Lemma 2.37, v2 Lemma 2.50 and v3 Lemma 2.56. It is false.

**Counterexample.** Let k be a field of characteristic p > 0, X = A²_k, and Y the blow-up of the origin, with exceptional curve E = F. Let M be the sum of the strict transforms of the two axes. Then M ∼ −2E is effective, Cartier, globally generated over X and has no exceptional component. At x = E ∩ (strict transform of the y-axis), mult_x M = 1.

Blow up x, with new curve G and strict transform E′. Then E′² = −2, G² = −1, E′·G = 1 and π*M − tG ∼ −2E′ − (2+t)G, of degree 2 − t on E′ and t on G. So ε(M; x) = 2. At t = 2 the ideal (x, y²) pulls back to O(−E′ − 2G), from the charts c²d and f², so ε_sa(M; x) = 2 as well. With A = M and Λ = 0 the threshold is constantly 2 ≠ k = 1. The intersection numbers and chart exponents were re-verified by exact arithmetic and sympy.

**Corrected statement and proof (item `seshadri-lower`).** Fix D. For each rational 0 < γ < k put c = max_j |D·F_j| over the finitely many exceptional curves F_j, and δ₀ = γ/c. Then ε_sa(A; x) = ε(A; x) ≥ k − γ for every δ < δ₀ and every admissible A, M, Λ and x. The proof is the printed one, made uniform:

- On the blow-up W of x, write π*A − (k−γ)E ∼_Q M_W + γE + π*Λ.
- For C = E the degree is −(k−γ)E² > 0.
- For the strict transform of F_j through x, M_W·C ≥ 0 and E·C ≥ 1, so the degree is at least γ − δ|D·F_j| ≥ 0.
- For the other F_j the degree is A·F_j ≥ 0.
- Lemma 2.55 on W turns nef into semiample.

The first assertion (Λ = 0, ≥ k) is correct.

**Consumers.** Proposition 8.15 (p.173, (8.15.4)) uses only the first assertion, ε_sa(M; x) ≥ 1. Claim 8.21 (p.178) uses k = 3 and needs only ε_sa > 2, which the lower bound gives.

#### E2. Proposition 6.28: the pure qualifier fell out (misprint; p.154)

The published proposition reads: hypothesis "globally +-regular (completely purely globally +-regular over R, resp.)", conclusion "globally +-regular (globally +-regular, resp.)". The earlier versions differ:

- v1 Proposition 6.22 prints "purely … purely".
- v2 Proposition 6.28 prints "completely purely … completely purely".
- v3 prints the garbled "( ly globally +-regular, resp.)", confirmed on the page image of v3 p.71.

The published resp. conclusion is false. For R = k[[t]], f = id and Δ = S = V(t), the pair is purely globally +-regular: for every finite normal R′ ⊇ R with uniformizer s and ramification e, R → s^{1−e}R′ splits because 1 ∉ sR′. But O → O(S) = t^{−1}R never splits.

**Corrected statement and proof (item `pure-birational-repair`).** The corrected statement is v2's: (Y, S_Y + B_Y) is completely purely globally +-regular over R, where S_Y is the strict transform. For the proof:

1. Complete at each closed point. Since R is excellent, normality and crepant pullback survive.
2. Pass to a connected component X′ with R′ = H⁰(X′, O), which is complete local.
3. Proposition 6.26 turns pure regularity into B⁰_{S′} = H⁰.
4. Lemma 4.27 with B′ = B_{Y′} ≥ 0 identifies B⁰ on X′ and Y′ inside H⁰(X′, O) = H⁰(Y′, O).
5. Proposition 6.26 on Y′ finishes.

No comparison of pure and completely pure regularity over a non-complete base is used; Remark 4.30 leaves that open. Theorem 7.14 (p.165) applies the corrected form over its complete base.

#### E3. Lemma 4.28: sign of the twist (misprint; p.128)

The proof twists by O_Y(f*(M − (K_X + S + B))), a big semiample bundle. It then cites Corollary 3.7 (p.107), which kills only negative powers. The twist must be the inverse, f*(K_X + S + B − M), which is the L of Theorem 7.2's proof (p.156). Its dual is exactly the displayed H⁰(K_Y + S_Y + f*(M − K_X − S − B)). The lemma is "a fact we will not use".

#### E4. Theorem 9.28(c): strict versus non-strict (misprint; p.206)

It prints −4d_{Γ_i} < (K_X + Δ)·Γ_i < 0. Theorem I(c) (p.74), Lemma 9.29 and the proof (p.210) all give ≤, and no consumer uses strictness. Item `cone-length` states the non-strict bound.

#### E5. Theorem 10.6: β(1) = 393 should be 373 (misprint; p.216)

Theorem K (p.76) and the proof use 373. The proof uses β(1) only through two conditions, p ≥ 110 + 4 for the fibre genus and p > deg D for the discriminant. The discriminant degree is 319K² + 12χ ≤ 325K² + 48 = 373 by Noether's formula and inequality. Both conditions hold for all p > 373. The printed 393 is a weaker statement.

#### E6. Theorem 2.13 / Proposition 2.14: the centre must be nowhere dense (error; p.85)

For T = X, or T containing a component, g^{−1}(T) is not a divisor. Every application uses a nowhere-dense T: boundary supports of log resolutions, and the blow-up centre inside the proof of 2.14.

#### E7. Definition 2.19: nonempty linear systems (error; p.88)

"the minimum exists" fails when |D| = ∅, for example O(−1) on P¹. Every Mob/Fix in §8 lives on a scheme projective and birational over an affine base, where every Cartier divisor has a section. Setting 8.5 moreover chooses K_X + S + B effective.

#### Other load-bearing distinctions

Corollary 4.20 invokes Lemma 2.36 on a rounded divisor that need not be Q-Cartier; that gap remains open. The main paper itself acknowledges an erroneous adjoint argument (Lemma 4.25) in arXiv v1; its corrected published construction controls this extraction. CT20v3's erratum repairs a different dependency, not the statement of its divisor-descent Lemma 2.17. Its geometrically-connected-fibre condition still must be justified at the actual consumers.

### Gap ledger

Gaps 1, 3, 4, 6, 7 and 9 were resolved by the continuation; their IDs are kept, and they no longer block any item. The other 15 are open.

1. `gap-empty-system` (**resolved**, E7): Definition 2.19 needs |D| ≠ ∅. `mobile-fixed` carries the guard, and every use in §8 is on a scheme projective and birational over an affine base, where every Cartier divisor has a section.

2. `gap-resolution-centres`: Theorem2.13 and Proposition2.14 say closed T without excluding T=X. Requiring the full inverse image to be an SNC divisor then fails. Verify the original CP/CJS/KW hypotheses; use a nowhere-dense closed centre avoiding components. Do not add preservation of the preexisting SNC locus to the stronger ample-exceptional resolution without proof. Continuation: the T = X defect is recorded as E6, and every application uses a nowhere-dense T. The original CP19/CJS20/KW21 hypotheses remain to be read.

   Directly affected: `resolution-three`, `ample-exceptional-resolution`, `compatible-resolution`. Further consumers inherit this blocker in the JSON.

3. `gap-seshadri-limit` (**resolved**, E1): the counterexample is verified, the uniform lower bound is proved in `seshadri-lower`, and Proposition 8.15 and Claim 8.21 use only that bound.

4. `gap-adjoint-sign` (**resolved**, E3): the positive twist in the proof of Lemma 4.28 is a misprint. With the inverse twist, Corollary 3.7 applies and the dual matches the statement.

5. `gap-weil-adapter`: Corollary4.20 invokes Lemma2.36 on a rounded divisor on Y that is not guaranteed Q-Cartier. Supply a reflexive/Weil pushforward version with a codimension-one proof or justify the missing Q-Cartier condition.

   Directly affected: `divisor-pushforward`, `rounded-birational`. Further consumers inherit this blocker in the JSON.

6. `gap-pure-birational` (**resolved**, E2): the published resp. conclusion dropped 'completely purely', which arXiv v2 has. The corrected statement is proved in `pure-birational-repair` from Proposition 6.26 and Lemma 4.27, componentwise after completion, and Theorem 7.14 is covered.

7. `gap-cone-length` (**resolved**, E4): the strict '<' of Theorem 9.28(c) is a misprint for the ≤ 4d_C of Theorem I(c), Lemma 9.29 and the proof.

8. `gap-section-nine-scope`: Check the repaired supplier selection and standing hypotheses: Cor9.33 needs general BPF9.27 rather than big-only9.17;9.36 needs full-boundary termination9.8 plus terminalization, not only9.7;9.34 must retain characteristic exclusions used by9.20;9.21 needs the three-dimensional normal effective-boundary context.

   Directly affected: `real-bpf`, `finite-minimal-models`, `finite-closed-termination`, `dlt-modification-qfactorial`, `dlt-modification-nef`, `dlt-modification-excess`, `dlt-modification-fibres`. Further consumers inherit this blocker in the JSON.

9. `gap-moduli-bound` (**resolved**, E5): Theorem 10.6's β(1) = 393 is a misprint for Theorem K's 373, since the proof's conditions hold for all p > 373. The items still prove properness only for the closure of the smooth locus, not the whole stable-surface stack.

10. `gap-kollar-family`: Pat18 Definition1.5 requires all reflexive powers of the relative dualizing sheaf to commute with arbitrary base change; naïve flat Q-Gorenstein stable fibres are not the same functor. Close this condition for the constructed stable limit. In normalized central-fibre inversion retain the central fibre in the boundary before forgetting it.

   Directly affected: `stable-functor`, `lc-inversion`, `stable-limits`. Further consumers inherit this blocker in the JSON.

11. `gap-ct-erratum`: CT20v3 §8 repairs a gap in Theorem2.30 affecting Proposition3.2. Track the corrected dependencies without calling Lemma2.17 retracted. Its connected-fibre reduction must use geometrically connected fibres where Stein factorization is asserted a universal homeomorphism; prove that stronger input at each BMP consumer.

   Directly affected: `vertical-descent`, `flattened-nef-descent`, `nonbig-ewm`. Further consumers inherit this blocker in the JSON.

12. `gap-adjoint-version`: The main paper acknowledges an erroneous v1 adjoint Lemma4.25. Use the published direct-sum-before-trace definition; its image is a sum, not necessarily a direct sum. General pure/adjoint completion compatibility is not proved; the completed B-hat construction is separate.

   Directly affected: `adjoint-bzero`, `completed-adjoint`, `adjoint-sum`, `adjoint-single-complex`, `pure-completed-unit`. Further consumers inherit this blocker in the JSON.

13. `gap-limits-enhancement`: Prove the complete-base finite-module inverse-limit exactness in an enhanced category. Ordinary triangulated categories do not supply these colimits, and dropping completeness gives completion under Matlis biduality, not the original module.

   Directly affected: `complete-finite-limits`, `triangulated-limit-warning`, `noncomplete-limit-warning`, `bzero-inverse`, `alt-inverse`. Further consumers inherit this blocker in the JSON.

14. `gap-bhatt-rh-frontier`: Bha20 selected proofs are read, but the §4 geometric heart, §6.1–6.5 graded argument, and the full Bhatt–Lurie integral Riemann–Hilbert construction are not transitively extracted. Its smooth prismatic and generic-fibre étale suppliers are imported, not substitutes for the integral functor. Avoid a circular proof of BMP2.9 using the BMP-dependent extension in Bha20 Cor5.17's footnote.

   Directly affected: `integral-rh`, `rh-constant`, `rh-proper`, `rh-almost-perverse`, `absolute-etale-acyclic`, `bhatt-modp`, `bhatt-uniform`, `parameter-completion`, `dvr-vanishing`, `graded-vanishing`, `graded-bcm`. Further consumers inherit this blocker in the JSON.

15. `gap-bcm-tight-closure-frontier`: Read and split the original HH92/Bha12/MS21/MST22/Hochster/Smith proof interiors: parameter regularity, splinter CM, BCM test/adjoint ideals, colon capturing, localization, graded duality and F-singularity bridges. A main-paper citation does not close these proofs; the André perfectoid-ramification proposal does not own or prove the BCM package.

   Directly affected: `splinter-cm`, `bcm-test`, `graded-test`, `graded-hom-high`, `affine-test-comparison`, `local-bcm-criterion`, `tight-closure`, `f-singularities`, `f-regular-plus`, `fujita`. Further consumers inherit this blocker in the JSON.

16. `gap-lower-mmp-frontier`: Read original surface, characteristic-zero, and equal-characteristic threefold suppliers (Tanaka, HW, DW, BW, Fujino, BCHM/Cor07 and cited adjunction/termination sources), split their precise intermediate statements, and audit imperfect fields, residue-characteristic exclusions, effective boundaries and quasi-projectivity at every transfer.

   Directly affected: `surface-mmp`, `surface-bpf`, `surface-cone`, `surface-abundance`, `charzero-bpf`, `standard-klt-flips`, `all-boundary-flips`, `special-termination`, `pseudoeff-termination`, `finite-minimal-models`, `scaling-termination`. Further consumers inherit this blocker in the JSON.

17. `gap-positivity-descent-frontier`: Reuse the partial Witaszek22 and numerical-Picard proposals. Close original Keel gluing, CT corrected fibrewise semiampleness, Witaszek relative semiampleness, normalization/conductor and numerical-versus-Q-linear descent arguments. Neither existing pending proposal is an accepted supplier.

   Directly affected: `mixed-keel`, `plt-supported-bpf`, `plt-numerical-descent`, `surface-nef-semiample`, `vertical-descent`, `general-bpf`. Further consumers inherit this blocker in the JSON.

18. `gap-stable-moduli-frontier`: Pat18 Def1.5, statements1.1–1.4, proof9.7 and §11 are read, but its positivity proofs and PX15/FR06/Rydh descent are not closed. Separately acquire HK boundedness, Kollár hulls, Eke canonical embedding, Saito extension and BK/Liedtke sources. Read their exact characteristic/family hypotheses before certifying stable limits or projectivity.

   Directly affected: `hulls-boundedness`, `canonical-embedding`, `saito-extension`, `canonical-threefold-cm`, `stable-limits`, `determinant-positivity`, `smooth-coarse-projective`. Further consumers inherit this blocker in the JSON.

19. `gap-ap-version`: The author PDF Cor4.4/4.5 and proofs were read, but it has no Theorem B matching the published AP22 citation. Published NSF PDF access timed out. Match the publication and split local-cohomology bounds, completion/gamma and punctured-spectrum anticanonical algebra inputs. Keep F-regular distinct from weakly F-regular without additional hypotheses.

   Directly affected: `strong-f-four`, `symbolic-algebra`, `symbolic-fg`. Further consumers inherit this blocker in the JSON.

20. `gap-atomic-closure`: This is a substantial 271-item checkpoint, not an exhaustive transitively closed inventory. Split bundled singularity/model predicates and multi-clause items (e.g. RH3.4(4–6), ind-CM2.17/2.18, face descent9.16(a),(b)); inline full source-setup quantifiers and prove each original-source prerequisite. Re-audit all resulting API/tests, consumers and ownership before marking complete.

   Directly affected: `singularities`, `models`, `f-singularities`, `rh-almost-perverse`, `ind-cm-uniform`, `nonq-face-descent`. Further consumers inherit this blocker in the JSON.

21. `gap-library-api`: Only the seven named library carriers/theorems are classified built. Their proposed new API/tests and geometric/category bridges are unexecuted. Single-circle density does not prove simultaneous torus approximation; compact component-group finiteness is a missing adapter derived after the planned closed-subgroup theorem.

   Directly affected: `weak-regular`, `line-bundle`, `cohom-module`, `local-cohom-carrier`, `derived-carrier`, `fekete`, `circle-density`, `torus-approximation`. Further consumers inherit this blocker in the JSON.

### Sources and reading limits

- **main**: [source](https://link.springer.com/content/pdf/10.1007/s10240-023-00140-8.pdf). Entire published 159-page paper, pp69–227, §§1–10 and references; continuous extracted text through line8125. Pages85,88,101,128,154,216 also checked as images. SHA-256: `a07fcb798fee01a791980ef8fb72e345da22e7f406af2e245adc47da53cf73d6`. Limit: Full primary-paper reading, not full transitive prerequisite closure. Continuation (cc-fb70e5): pp.74–76, 85, 88, 96, 101, 107, 120–128, 146–156, 165, 169–178, 188, 194, 205–213 and 216–219 reread for the diagnostics, and pp.101, 128, 154, 206 and 216 image-checked.

- **main-v3**: [source](https://arxiv.org/pdf/2012.15801v3). Selected algebra, vanishing, adjoint and MMP passages compared with the published version; earlier Hacon–Witaszek audit supplies the detailed partial log. SHA-256: `533218825ca5045a9e8e04da1f78ef51e05c90dd83ca4ecb7cd6e8c68dff3d80`. Limit: Not a full132-page version comparison. Published version controls this extraction. Continuation: collated Lemma 2.56 (p.29), Proposition 6.28 (p.71, page image showing the garbled '( ly globally'), the proof of Lemma 4.28, Theorem 9.28(c) and Theorem K/10.6.

- **main-v1**: [source](https://arxiv.org/pdf/2012.15801v1). Lemma 2.37 (p.20; later Lemma 2.56) and Proposition 6.22 (p.48; later Proposition 6.28, printed 'purely … purely'). SHA-256: `984fd3f1636ceda5ad014eaab75eb11d44063aeab994bafc64efe4898da5cd92`. Limit: only these passages collated.

- **main-v2**: [source](https://arxiv.org/pdf/2012.15801v2). Lemma 2.50 (p.26; later Lemma 2.56), Proposition 6.28 (p.64, printed 'completely purely … completely purely'), the proof of Lemma 4.28 and Theorem 9.28(c). SHA-256: `8393a40ab0ced4f6d74d4dc7a7fab13586a5c35796daec08b5cd09d77bfdb878`. Limit: only these passages collated.

- **bha20**: [source](https://arxiv.org/pdf/2008.08070v2). Definition2.1, Lemmas2.6/2.7 and Cor2.8; complete proofs2.17/2.18; Thm3.4 six clauses and3.5–3.7 refinements; Prop3.10 and sketches3.11/3.12; full Thm5.1 proof and Remark5.2; Cor5.11, Lem5.15, Thm5.16, Cor5.17 and footnote; full Thm6.28 proof and Remark6.29. SHA-256: `6f6292053c0c9bf20d33a07cadc1d072600b832b860d8a2aaa857d4eddba2097`. Limit: §4 geometric heart, §6.1–6.5 graded construction and full BL integral Riemann–Hilbert construction remain open.

- **pat18**: [source](https://arxiv.org/pdf/1710.03818v3). Exact Def1.5 functor and Remark1.6; statements1.1–1.4; Def1.9 hypotheses I/L; full proof9.7 and §11 projectivity. SHA-256: `d6baee911935daf92c4f31f061879b965196667bab35134ca993328e97fb2717`. Limit: Theorems1.3/1.4 positivity proofs, PX15, FR06 and Rydh descent interiors not extracted.

- **ct20**: [source](https://arxiv.org/pdf/1706.04845v3). Selected2.6,2.12,2.17–2.18 and2.25 from previous audits; refreshed2.11–2.17 and read the full §8 errata with replacement Prop8.1. Version dated2026-06-04. SHA-256: `7f2e4b8a99e68e858ab0dcf21e0daa782bb0a526a10d286b54c68372770f3e74`. Limit: Main fibrewise semiampleness proof not completely closed; connected versus geometrically connected scope needs an adapter.

- **ap-author**: [source](https://thomaspolstra.github.io/LCBoundsDim4.pdf). Introduction and full Cor4.4/4.5 statements and proofs. SHA-256: `3d3c0a5efca4963f70515249e3863178b4ed7111f6855006698d0c3bcaa4b268`. Limit: No Theorem B in this author version matching the published citation. Published NSF copy timed out; preceding local-cohomology proofs and version identification remain open.

- **ahk**: [source](https://arxiv.org/pdf/math/0605137v2). §§1–2 through Thm2.15, then Lem3.1 statement. SHA-256: `1d1e5642fdb7b2a2c04ccf9800de13c7b3649eed344034538142116f09c7cf28`. Limit: Source works over C; transfer not certified.

- **wit-relative**: [source](https://arxiv.org/pdf/2106.06088v1). Thm1.2 statement; entire§2.4 including Thm2.22 and Cor2.23 proofs. SHA-256: `9e3096a703a6fd484ce12188c49acc1a7b38251851475ede42f542c16354300f`. Limit: Thm1.2 proof not read; later published edition not collated.

- **wit22**: [source](https://arxiv.org/pdf/2002.11915v2). Entire46-page preprint in preceding PAPER-WITASZEK-22 audit. SHA-256: `5ab792128995b0735311a5284620e5d14549ecc6c5be08595c5d8cdffedda842`. Limit: Reuse that explicitly partial checkpoint and its diagnostics.

- **keel**: [source](https://arxiv.org/pdf/math/9901149). Lem1.6 proof/1.7 opening;2.16 proof;5.2–5.4 proofs in preceding audit. SHA-256: `2ec4141aea36ad77e5b504f01617ffbbe17de0af27f8b2c5f4a1f4ee6afde398`. Limit: Cor2.9 gluing not yet read.

- **pinned-libraries**: [source](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174). Actual statements of the seven library item groups: regular sequences, invertible sheaves, scheme module cohomology, local cohomology, derived categories, Fekete subadditivity and single-circle density. Tau Ceti declarations read at f790474821cf4256814db967cb154e7af3d0c369. Limit: No new API/tests or singular duality/BCM/MMP theorem declared implemented.

- **atlas**: [source](https://github.com/CBirkbeck/tauceti-explorer/tree/e78f1b2d050f12c5f028a75615f6ffe00f564170). Relevant exact stage descriptions, reviewed coverage entries, new roadmap and packet/decomposition/reservation overlap screens; all40 current paper route sets checked. Limit: Pending Part II proposals remain missing suppliers, not accepted stages.

The JSON's prerequisite list distinguishes independently read sources from bibliography-only pointers. In particular neither a citation to Ma–Schwede/MST nor the main paper's statement of a lower-dimensional MMP theorem counts as a closed proof. The AP author PDF's Cor4.4/4.5 was read, but its numbering does not resolve the published Theorem B citation; acquisition/version matching remains open.

### Verification and handoff

Run the repository paper checker and the supplemental dependency/route/API audit recorded in the JSON. Their scope is structural consistency, not mathematical proof. No Lean deliverable is required for this paper job; no Lean compilation or execution of the180 tests is claimed.

The 2026-09-22 continuation also ran `scripts/check_paper.py` and an exact-arithmetic and sympy check of the E1 counterexample: the nef interval is [0,2] for 41 rational t, with chart exponents c²d and f².

Resume from [the handoff](../handoff/PAPER-BHATT-ETAL-23.md). The two counterexamples are now verified and their repairs proved (E1, E2). The next worker should continue with the open source issues (Corollary 4.20's Weil adapter, the §9 supplier scope, the Kollár base-change condition, CT geometric connectedness), then exact original-source closure and finer statement splitting. This checkpoint must not be marked complete merely because every currently listed missing item has a route.

## Review (REV-PAPER-BHATT-ETAL-23, 23 September 2026)

The independent review, by Claude Code (session `cc-7b31c4`, issue #1445), **accepted** this
extraction and all fifteen routes, with two kinds of correction in place. The full record is
[REV-PAPER-BHATT-ETAL-23.md](../reviews/REV-PAPER-BHATT-ETAL-23.md).

The recorded hash reproduces from the Centre Mersenne PDF at the recorded DOI. 273 items, all 255
missing routed exactly once; all planned layer ids and all twelve library declarations check out at
the pins. `AnalyticStacks:AS.1` is not in `data/atlas.json` but in the designed roadmap
`research/blueprint/roadmaps/AnalyticStacks.json`, which three other extractions also route to, so
that route is well-formed.

**Correction 1 — locators.** In 67 locators the numbered result is right but the kind word is wrong:
`Lemma 2.48` for Proposition 2.48, `Theorem 6.9` for Corollary 6.9, `Proposition 4.18` for Lemma
4.18, `Lemma 9.30` for Definition 9.30, `Corollary 9.33` for Theorem 9.33, `Theorem 5.1` for Setting
5.1, and so on — 50 distinct results. The kind words now match what the paper prints. External
citations (`Pat18 Theorem 9.7`, `Bha20 Theorem 3.4`, `SGA7 XVII`) and the arXiv-version numbering in
E1's locator were left untouched, and no number was changed.

**Correction 2 — a Part II title.** `PrismaticCohomologyIntegralRiemannHilbert` now carries the
parent's full atlas title, "Prismatic cohomology: relative, absolute, Nygaard and log variants".

All eight findings are **confirmed**. Two are the paper contradicting itself: Theorem 9.28(c) prints
a strict bound where the introduction's Theorem I(c) and Lemma 9.29 are non-strict (E4), and Theorem
10.6 prints `β(1) = 393` where Theorem K prints 373 (E5). E6 and E7 have immediate counterexamples —
`g^{−1}(X)` is not a divisor, and the minimum over an empty linear system does not exist — and E1,
E2, E3 and E8 are as recorded, each read at its page.
