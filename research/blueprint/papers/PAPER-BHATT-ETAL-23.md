# PAPER-BHATT-ETAL-23: published-paper extraction checkpoint

Session: Codex `codex-a71f92`; issue #1444; 2026-09-22. Status: **partial**.

## Scope and evidence

Bhatt–Ma–Patakfalvi–Schwede–Tucker–Waldron–Witaszek, [Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic](https://doi.org/10.1007/s10240-023-00140-8), *Publications Mathématiques de l'IHÉS* 138 (2023), 69–227.

The entire published paper was read, including proofs and bibliography. Selected arXiv v3 passages were compared; this is not a full collation of that preprint. The published source is CC BY 4.0 (p220): [licence](https://creativecommons.org/licenses/by/4.0/). This report paraphrases the authors and explicitly distinguishes worker diagnostics and proposed repairs from their assertions.

The [machine-readable extraction](PAPER-BHATT-ETAL-23.result.json) has **271 items**, **554 dependency edges**, **60 definition/construction entries**, **180 mathematical planning tests**, and **15 routes**. Seven item groups cite pinned library declarations, eleven import existing planned interfaces, and 253 remain missing. Every missing item has exactly one route. These counts describe this checkpoint, **not exhaustive transitive closure**: the 21 gaps below include original-source proofs, statement refinements and atomic splitting still needed.

Items carry source locators, proof outlines, explicit dependencies, reverse consumer uses and blocking gaps propagated through the graph. Each definition has three use-derived API obligations and three mathematical tests. Tests are proposed assertions, not executed Lean examples. A `library` label applies only to the named carrier/theorem, not all newly proposed API.

## What is being planned

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

## Existing library and atlas boundaries

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

## Routing

### 1. SchemeAndStackFoundations

Source refinement of `SchemeAndStackFoundations:SF.0`. 4 checkpoint items.

Absolute integral closures, reflexive divisor sheaves and base-scope adapters refine the existing scheme foundations. Reuse scheme/module and normality carriers rather than hiding duplicates in the MMP extension.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

### 2. SchemeAndStackFoundations

Source refinement of `SchemeAndStackFoundations:SF.4`. 4 checkpoint items.

Named three-dimensional pair resolution and Saito's log-smooth extension refine the existing models/alterations direction. Import curve stable reduction and keep the nowhere-dense/projective/ample-exceptional restrictions explicit.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

### 3. SchemeAndStackFoundations

Source refinement of `SchemeAndStackFoundations:SF.5`. 1 checkpoint items.

The discriminant computation is a concrete Chern/intersection/Thom–Porteous application of the single intersection-theory supplier.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

### 4. DeformationAndDerivedPatchingAlgebra

Source refinement of `DeformationAndDerivedPatchingAlgebra:R03.3`. 6 checkpoint items.

Use the existing local commutative-algebra owner for Matlis duality, supported local-cohomology comparisons, parameter heights and the complete finite-module inverse-limit theorem. Big-CM singularity applications remain in the pending birational extension.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

### 5. AnalyticStacks

Source refinement of `AnalyticStacks:AS.1`. 4 checkpoint items.

Add the Noetherian singular coherent-duality, normalized dualizing-complex and finite-trace adapters to the existing coherent formalism. The current proper-smooth theorem is not classified as the full singular theorem. Matlis duality is imported from R03.3, and curve duality from StableReduction remains a distinct restricted export.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

### 6. DerivedDeRhamCohomology

Source refinement of `DerivedDeRhamCohomology:DD.1`. 2 checkpoint items.

Generic derived completion is canonically DD.1. The paper supplies a quotient-completeness application; EDS E4 only supplies sheaf/coefficient extensions, so no second completion owner is created.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

### 7. EnhancedDerivedSheaves

Source refinement of `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E3`. 2 checkpoint items.

Remark4.11 is a precise acceptance obstruction for coherent derived limits: ordinary triangulated categorical colimits are not the required enhancement.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

### 8. LefschetzPencilsAndVanishingCycles

Source refinement of `LefschetzPencilsAndVanishingCycles:LPV.3`. 2 checkpoint items.

LPV.3 already owns actual Lefschetz pencils after a second Veronese and finite-extension descent. Import it into the stable-surface proof; do not create a duplicate pencil roadmap.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

### 9. AlgebraicModuliForArithmeticGeometry

Source refinement of `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.5`. 2 checkpoint items.

Patakfalvi's explicit Hilbert/Isom atlas and finite-inertia coarse-space argument are applications of these existing suppliers. Stable-surface boundedness, hull strata and determinant positivity require new layers in the separate extension.

Exact item IDs are in the route record. Existing carriers and other roadmaps' targets remain imports.

### 10. SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry

Part II of `SchemeAndStackFoundations`; proposed galaxy `arithmeticgeometry`. 193 checkpoint items.

Reuse the pending identically named route from PAPER-HACON-WITASZEK-23. The present paper supplies its lower-dimensional and plus-regularity foundation; it is not an accepted atlas layer. Do not create a competing MMP or stable-section owner.

Start after Scheme, stack, cohomology and intersection foundations (SchemeAndStackFoundations SF.0/4/5). Import general coherent base change from The Jacobian challenge (tauceti:TauCetiRoadmap/JacobianChallenge, contract J-C), general Proj and polarization from Stable reduction (tauceti:TauCetiRoadmap/StableReduction, Layer2), local algebra and Matlis duality from Deformation and derived patching algebra (DeformationAndDerivedPatchingAlgebra:R03.3), singular coherent-duality adapters from Six-functor formalisms and analytic stacks (AnalyticStacks:AS.1), coherent diagrams from EnhancedDerivedSheaves, and derived completion from DerivedDeRhamCohomology:DD.1. Reuse the pending MixedCharacteristicPositivity, NumericalPicardAndContractionDescent and arithmetic-presentation suppliers by their exact IDs in the other routes. Import integral perfectoid algebra from PerfectoidQuotients:Q0:integral-algebra and the proposed PrismaticCohomologyIntegralRiemannHilbert extension, not a duplicate perfectoid-field theory. Build big/balanced/cohomological CM predicates, closure vanishing, B⁰ and the corrected component-direct-sum adjoint B⁰_S, graded test modules, ordinary/pure/completely-pure regularity, adjunction and lifting, restricted mobile algebras and their saturation/torus-limit proof. Prove Theorems5.8/5.9 only for finite-summand singularities, retaining flatness and globally generated ample L for the exponent dim X−dim R+1. Prove Theorem7.2 with Cartier M, normalized centre and big-semiample adjoint difference. Separate standard p>5 pl-flips from the all-residue one-complement branch. For absolute threefolds over §9's excellent finite-dimensional dualizing base, prove Theorem9.15's non-Q-factorial exceptional MMP and numerical descent under every stated exceptional/Q-Cartier/crepant hypothesis; Theorem9.17 requires L big but no residue exclusions. Theorems9.20 and9.27 require positive-dimensional image and no closed residue2,3,5: distinguish arbitrary pseudoeffective MMP termination from nonpseudoeffective scaling termination9.37. Prove real-boundary cone/polytope statements with the degree factor d_C, terminalizations, dlt modifications and lc inversion10.1. Add Corollary L's arbitrary Weil/symbolic finite generation and Corollary M only after the AP22 version and tight-closure conventions are closed. Preserve all diagnostic gaps, especially the false Seshadri limit and pure-to-ordinary qualifier, and the unknown general adjoint completion equality. This supplies earlier dependencies of Hacon–Witaszek23; its conditional fourfold results stay downstream and do not prove these threefold inputs. Stable-surface moduli has its own consumer route. Every definition needs use-derived API and counterexample tests; the current partial graph still needs the enumerated source closures and atomic splitting.

### 11. SchemeAndStackFoundationsMixedCharacteristicPositivity

Part II of `SchemeAndStackFoundations`; proposed galaxy `arithmeticgeometry`. 12 checkpoint items.

Coalesce with the same pending candidate already used by PAPER-WITASZEK-22, PAPER-SCHROER-23 and PAPER-HACON-WITASZEK-23; not an accepted planned supplier. For this paper add relative Seshadri thresholds and the actual perturbative lower bound used by Lem8.15/Claim8.21; do not adopt Lem2.56's false limit equality. Extend the EWM criterion to the exact excellent-base scope of Theorem2.50 only after its Artin/Popescu adapter is proved. Include Lemmas2.51–2.55, the nef vertical descent after flattening and nonbig EWM9.26. Resolve the CT20 geometrically-connected-fibre guard and distinguish its 2026 replacement of Prop3.2 from the unaffected divisor-descent statement2.17.

Start after Scheme, stack, cohomology and intersection foundations (SchemeAndStackFoundations), the first prerequisite: import its universal-homeomorphism and direct-limit perfection adapters (SF.0), algebraic spaces, conductor/Picard patching, geometric pushouts and finite quotients (SF.1), formal algebraization and compactification (SF.4), and general intersection theory (SF.5). Import finite-type relative Proj, projectivity, relative ampleness and global generation from Stable reduction (tauceti:TauCetiRoadmap/StableReduction, Layer2), line bundles/divisors/curve degree from The Jacobian challenge (tauceti:TauCetiRoadmap/JacobianChallenge, LayerA), and coherent direct-image/base-change interfaces from its LayerC and StableReduction Layer2. Higher-dimensional representability must use Algebraic moduli and representability for arithmetic geometry (AlgebraicModuliForArithmeticGeometry:A0-extension). Reuse the pending NumericalPicardAndContractionDescent supplier of Picard-τ finiteness; do not rebuild it. Construct relative nefness, bigness, semiampleness, the all-integral-subvarieties EWM predicate with dim f(V)<dim V, and the reduced exceptional locus. Give every construction an API and tests. Prove separately the semiample and EWM gluing assertions of Propositions5.1–5.3, including scheme-theoretic intersections, normalization/conductor diagrams, rational restrictions, geometrically connected fibers and the locally finite residue-field guard in the finite-exception semiample case. Prove Theorem1.10: for nef L on a scheme projective over Noetherian S, semiampleness (respectively EWM) is equivalent to that of the restrictions to X_red and X_Q. Prove Theorem6.1: for X projective over excellent S and nef L, semiampleness is equivalent to semiampleness on E(L) and X_Q; the EWM analogue additionally requires S finite type over a mixed-characteristic Dedekind domain. Decompose the corrected Keeler Fujita proof, thickening section lifts and Artin formal contraction input instead of adding a vanishing black box. The final applications are Corollary6.5 for a plt absolute-threefold pair (X,D+B), D normal irreducible, L nef Cartier, L−(K_X+D+B) ample and E(L)⊆D, over S quasi-projective over a mixed-characteristic Dedekind domain; and Corollary6.7 for a klt normal integral absolute threefold projective and surjective over Spec of a mixed-characteristic Dedekind domain with perfect closed residue fields, L nef and big Cartier and L−(K_X+Δ) nef and big: L is EWM, and is semiample when positive-characteristic closed residue fields are locally finite. Cover the relative surface Proposition6.6, ordered adjunction, conductor degree bounds and numerical-dimension cases. Import the characteristic-zero and Tanaka surface theorems only after their precise hypotheses and proof inputs have been read. Use the stronger κ=ν=1 surface target, not the false bare h⁰>0 formulation, and allow an empty generic conductor. Do not absorb later BMPSTWW generalizations or the paper's conjectures/work-in-progress as proved targets. The current extraction is partial: its enumerated original-source/version gaps must be closed before the design is declared complete. For Hacon–Witaszek23 additionally audit Wit21b Thms1.2/2.22, CT20's corrected dependencies and the Keel/NT20 connected-fibre gluing needed by Props4.5/5.2; retain characteristic-zero fibres and distinguish numerical from Q-linear descent. For this paper add relative Seshadri thresholds and the actual perturbative lower bound used by Lem8.15/Claim8.21; do not adopt Lem2.56's false limit equality. Extend the EWM criterion to the exact excellent-base scope of Theorem2.50 only after its Artin/Popescu adapter is proved. Include Lemmas2.51–2.55, the nef vertical descent after flattening and nonbig EWM9.26. Resolve the CT20 geometrically-connected-fibre guard and distinguish its 2026 replacement of Prop3.2 from the unaffected divisor-descent statement2.17.

### 12. NumericalPicardAndContractionDescent

Part II of `AlgebraicModuliForArithmeticGeometry`; proposed galaxy `algebraicgeometry`. 7 checkpoint items.

Coalesce with the same pending candidate already used by PAPER-WITASZEK-22, PAPER-SCHROER-23 and PAPER-HACON-WITASZEK-23; not an accepted planned supplier. For this paper export N₁/N¹ over closed-point curves, the inseparable degree factor d_C, normalized extremal curves and the numerical descent statements of2.51,9.15 and9.16. State each exceptional/crepant/nef hypothesis; these do not assert arbitrary numerical equivalence implies Q-linear pullback. Import the ordinary Picard and intersection owners and the birational extension's actual contractions.

Start from Algebraic moduli and representability for arithmetic geometry (AlgebraicModuliForArithmeticGeometry), especially A0-extension, and Scheme, stack, cohomology and intersection foundations (SchemeAndStackFoundations:SF.1,SF.2,SF.5). Construct Pic^τ and Num for arbitrary proper schemes over a field, including nonreduced and disconnected schemes; expose geometric base change, Galois action, numerical equivalence, torsion obstructions and norm maps. Prove the positive-power descent criterion with a numerically trivial twist, then Theorem1.3: constant Num descends geometric contractions with projective target; treat purely inseparable descent separately without the constantness assumption. Prove Theorem2.1 for contractions of smooth proper surfaces: component-graph descent, the geometrically-reduced edge-label assertion, and pure inseparability of residue fields of reducible fibers. Import surface intersections, not their reconstruction. Give each definition an API and at least three tests; include P¹_C/R with permuted numerical components, d=0 as a forbidden criterion, and projectivity versus arbitrary proper targets. The Enriques roadmap consumes these general theorems; it must not own a duplicate Picard theory. Add the killed-by-two numerical-class lift /183 as a sheaf-quotient construction. Import rigidified Picard descent from A0-extension and relative ampleness from R09.1/R09.3; the Enriques consumer owns the local-projectivity application. For Hacon–Witaszek23 add relative rational/real N¹ specialization, the AHK modified rank, the source-guarded Prop5.4 numerical descent and Cartier-index preservation. Separate numerical surjectivity from actual Picard lifting, and close the missing numerical perturbation argument in Thm6.1(2b). No arbitrary numerically trivial divisor is declared pulled back. For this paper export N₁/N¹ over closed-point curves, the inseparable degree factor d_C, normalized extremal curves and the numerical descent statements of2.51,9.15 and9.16. State each exceptional/crepant/nef hypothesis; these do not assert arbitrary numerical equivalence implies Q-linear pullback. Import the ordinary Picard and intersection owners and the birational extension's actual contractions.

### 13. SchemeAndStackFoundationsPartIIArithmeticPresentation

Part II of `SchemeAndStackFoundations`; proposed galaxy `arithmeticgeometry`. 1 checkpoint items.

Reuse the pending arithmetic-presentation owner from PAPER-CESNAVICIUS-22 for finite/infinite-residue Bertini. It is not yet an accepted atlas layer. The new paper adds simultaneous regular hypersurface sections over a local ring, not another general Bertini owner.

Start after Scheme, stack, cohomology and intersection foundations (SchemeAndStackFoundations), which is the first prerequisite. Import its schemes, smooth/étale/flat morphisms and generic descent; import finite-type relative Proj and coherent-curve interfaces from Stable reduction (tauceti:TauCetiRoadmap/StableReduction, Layer2); import regular sequences, Cohen–Macaulay and dimension-flatness algebra from Deformation and derived patching algebra (DeformationAndDerivedPatchingAlgebra:R03.3). Reuse tangent/jet/incidence interfaces of Lefschetz pencils and vanishing cycles (LefschetzPencilsAndVanishingCycles:LPV.3) where their scope matches; do not identify a finite-extension rational point with a point over the original finite field. Build one geometric-presentation library: arbitrary-base avoidance (3.1); arbitrary-field prescribed-locus Bertini (3.2) with separable reduced marked points, simultaneous incidence inequalities, and iterative degrees divisible by the characteristic exponent; weighted projective charts and section blowups (3.4–3.5), importing rather than rebuilding Proj; the seven separate weighted projection assertions over fields (3.6) and semilocal Dedekind bases (3.7), keeping total and fiberwise codimension distinct. The first final target is Proposition4.1: for smooth positive-relative-dimensional A/O, finitely many points and a closed total-codimension≥2 locus, find an affine neighborhood with a smooth relative-curve map to an affine open in a disjoint union of affine O-spaces, with that locus finite over the target. The second final target is Lemma6.3: over semilocal R, for a flat affine curve with pure one-dimensional Cohen–Macaulay fibers, finite retained Y and finite Z in the smooth locus satisfying the finite-residue degree-point inequalities, find an affine neighborhood and quasi-finite flat map to A1_R that is cartesian and an isomorphism over Z, étale along Z, and agrees on every infinitesimal neighborhood. Supply the finite-cover point-count lemma6.1, simple residue-extension lemma6.2 and monic-polynomial remark6.4. Read CTHK97 §3 to closure and use the corrected p.20 argument for imperfect fields: construct embeddings of first-order thickenings by geometric presentation and disjoint translates, not an unjustified base-linear Cohen isomorphism. No generic rational-section or Grothendieck–Serre torsor target belongs to this geometry supplier. Do not assert nonflat base change for weighted blowups. The current partial extraction exposes the unverified GLL15, Gab01, EGA and commutative-algebra proof obligations; close them before declaring the design blueprint closed. For BMPSTWW Theorem2.17, add simultaneous regular hypersurface sections of finitely many regular closed subschemes of projective space over a Noetherian local domain, using the finite-field Poonen/GK19 and infinite-field FOV branches, lifting and cotangent-space checks. Verify that this regular mixed-local conclusion is not inferred merely from geometric smoothness over an imperfect field.

### 14. PrismaticCohomologyIntegralRiemannHilbert

Part II of `PrismaticCohomology`; proposed galaxy `padic`. 5 checkpoint items.

PR.4 plans smooth étale comparison, not the integral singular-scheme functor used in Bhatt's absolute-closure vanishing. EDC.5 owns the generic-fibre perverse theory, while Q0 owns integral perfectoid algebra; extend this prismatic direction without duplicating either.

Start after Prismatic cohomology (PrismaticCohomology PR.0–PR.2), using perfected derived prismatic cohomology and its universal-prism comparison from PerfectoidQuotients Q2. Import integral perfectoid rings from PerfectoidQuotients:Q0:integral-algebra, almost mathematics from PerfectoidSpaces:P0, generic derived completion from DerivedDeRhamCohomology:DD.1, and homotopy-coherent diagrams, enhancements and Kan extensions from EnhancedDerivedSheaves E0–E3. Import constructible étale sheaves, Verdier duality and the middle perverse t-structure from EtaleDualityAndPerverseSheaves:EDC.5 and its predecessors. The latter applies to F_p on the characteristic-zero generic fibre; it is not a p-torsion special-fibre assertion. Construct, rather than assume, Bha20 Theorem3.4's exact colimit-preserving RH_Δ:D(X_et,Z/p^n)→D_qc(X_{p^n=0}) for schemes over a perfectoid ring. Prove the constant-sheaf perfected-prismatic formula and proper-pushforward natural isomorphism, with coefficient changes and coherent composition. Under X finitely presented flat over O_C, add generic-fibre almostification, almost coherence, Verdier/Grothendieck duality compatibility and the precise two perverse bounds; split those clauses and retain all shifts and local dimensions. Prove the étale acyclicity of integral normal schemes with algebraically closed function fields, the resulting proper-map mod-p annihilation mechanism, and the prismatic Frobenius/finite-length argument underlying Bhatt's geometric CM theorem. The birational extension owns the general excellent-base approximation and B⁰ applications. Do not identify this with a rational p-adic local-system correspondence or smooth de Rham comparison. The main paper cites BL as in preparation; this worker obtained Bha20's statements and sketches, not the full construction. Locate the authoritative construction and close its transitive proof inputs before this proposed direction is declared complete.

### 15. AlgebraicModuliForArithmeticGeometryStableSurfaces

Part II of `AlgebraicModuliForArithmeticGeometry`; proposed galaxy `arithmeticgeometry`. 14 checkpoint items.

R09 supplies parameter schemes, stacks and restricted coarse spaces, but no inspected layer owns the stable-surface boundedness/hulls, stable-limit and determinant-positivity theorems. Curve stable reduction is not stable-surface moduli.

Start after Algebraic moduli and representability for arithmetic geometry (AlgebraicModuliForArithmeticGeometry R09.2–R09.5), importing actual Hilbert/Quot, polarized Isom, algebraic-stack and finite-inertia coarse-space constructions. Import coherent base change from The Jacobian challenge (tauceti:TauCetiRoadmap/JacobianChallenge, J-C), relative Proj/polarized descent from Stable reduction (tauceti:TauCetiRoadmap/StableReduction, Layer2), singular duality from AnalyticStacks:AS.1 and intersection theory from SchemeAndStackFoundations:SF.5. Import second-Veronese Lefschetz pencils from LefschetzPencilsAndVanishingCycles:LPV.3, not a duplicate pencil package. Use the pending SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry extension for threefold MMP, lc inversion and canonical singularities; Saito's log-smooth extension belongs to SF.4. Construct Patakfalvi's exact stable-surface groupoid: flat projective families with geometric slc canonically polarized volume-v fibres and EVERY reflexive canonical power compatible with EVERY base change. A naive Q-Gorenstein family over a normal base need not satisfy it. Prove Theorem10.2 separately: Artin finite type, separated finite diagonal, and a separated finite-type coarse algebraic space over Z[1/30] for rational v>0. Build HK19 boundedness, Kollár hull strata, the explicit Hilbert/Isom atlas and the inversion-of-adjunction deformation input, including the central fibre in the normalized pair. Prove Cor10.3's stable lift over an open number ring for finite fields of sufficiently large characteristic. For integer v>0 and d the product of primes≤β(v), with β(1)=393 as printed internally and β(v)=213v+48 for v≥2, prove properness of the CLOSURE OF THE SMOOTH LOCUS over Z[1/d] by Lefschetz pencils, the Saito extension and threefold canonical models; use BK21/Kollár21 CM to verify the central fibre and Kollár conditions. Prove projectivity of its coarse space by the full Pat18 determinant-line argument, finite scheme cover, descent of a power, generic CM-line positivity and the finite bad-prime argument. Neither properness nor finite diagonal alone gives projectivity. Record the introduction/proof value373 versus internal393 mismatch for volume1; do not silently claim the stronger threshold. The entire stable stack over Z[1/30] is not asserted proper. Close the uninspected positivity, boundedness, semistable-extension and canonical-model source proofs before approval.

The birational extension is the same pending owner proposed in PAPER-HACON-WITASZEK-23, now expanded at its logically earlier threefold/BCM inputs. Hacon–Witaszek's special fourfold MMP remains downstream: it is never used circularly to prove these inputs. Positivity, numerical-Picard and arithmetic-presentation proposals likewise retain their existing pending IDs.

## Source diagnostics requiring independent verification

These are worker findings, not author-approved errata and not claims that the main MMP theorem is false. Printed statements, sufficient corrected candidates and actual consumers must be kept separate.

### A. Lemma2.56: a limit equality stronger than its proof supplies

Take an algebraically closed field k of characteristic7 and X=A²_k. Let f:Y→X blow up the origin, with exceptional E. Let M be the sum of the strict transforms of the two coordinate axes. M is effective, has no f-exceptional component and M∼−2E, hence is f-ample. At x=E∩(one strict transform), mult_x M=1.

Blow up x by π:W→Y; write G for the new exceptional curve and E′ for the strict transform of E. Then E′²=−2, G²=−1, E′·G=1, and

`D_t = π*M − tG ∼ −2E′ − (2+t)G`.

Thus `D_t·E′ = 2−t` and `D_t·G = t`. The relative Seshadri threshold is2, not1. At t=2 the line bundle is globally generated over X: the ideal (x,y²) principalizes with divisor E′+2G, so its square gives O(−2E′−4G). This also checks the endpoint directly. In the first y-chart x=ab,y=b, the ideal is b(a,b). Blowing up a=b=0 gives the charts a=c,b=cd, where the ideal is (c²d), and a=ef,b=f, where it is (f²); these are the claimed exceptional multiplicities.

Set A=M and the source's Λ=D=0. Its perturbed divisor is constantly M, hence the threshold is constantly2 although the printed claimed limit is k=1. The candidate sufficient statement is instead: for every γ>0, sufficiently small δ gives ε≥k−γ (a lower-limit bound). The source proof's intersection argument appears to supply that inequality. Lemma8.15 needs ≥1 and Claim8.21 applies the argument to 3C to obtain >2; neither appears to require equality. Independently verify the complete geometric hypotheses and this weaker replacement before closing either consumer. The integer/intersection and chart-exponent calculations are checked separately; they are not a Lean proof.

### B. Proposition6.28: pure is not ordinary

For the identity of a complete DVR R=k[[t]], with S its reduced closed point, the pair is purely globally +-regular by the regular-boundary inversion statement, but cannot be ordinary globally +-regular. Already the identity finite cover would require a splitting of R→t⁻¹R. Every R-linear map t⁻¹R→R sends 1 to t times its value at t⁻¹, hence into the maximal ideal; it cannot send1 to1.

The proposed birational conclusion must preserve the pure qualifier. Theorem7.14 uses that pure conclusion. Check the proof on a fixed complete base through Proposition4.27; do not assume the unknown general pure-completion equivalence.

### C. Other load-bearing distinctions

Definition2.19 needs a nonempty linear system. The closed-centre resolution formulations need a nowhere-dense centre. Lemma4.28's sign must match the negative twist in Corollary3.7, and Corollary4.20 needs a Weil/reflexive pushforward adapter beyond a Q-Cartier lemma. The main paper itself acknowledges an erroneous adjoint argument in arXiv v1; its corrected published construction controls this extraction.

For stable surfaces the volume-one prime threshold is373 in Theorem K and the proof, but393 in printed Theorem10.6. This checkpoint uses the conservative393, without silently asserting the stronger bound. CT20v3's erratum repairs a different dependency, not the statement of its divisor-descent Lemma2.17. Its geometrically connected fibre condition still must be justified at the actual consumers.

## Open gap ledger

1. `gap-empty-system`: Definition2.19 does not guard the minimum defining Mob/ Fix against an empty linear system (e.g. O(-1) on P¹). Require nonemptiness and check every consumer; §8's effective adjoint choices provide the intended scope.

   Directly affected: `mobile-fixed`, `mobile-pullback`, `mobile-limit`. Further consumers inherit this blocker in the JSON.

2. `gap-resolution-centres`: Theorem2.13 and Proposition2.14 say closed T without excluding T=X. Requiring the full inverse image to be an SNC divisor then fails. Verify the original CP/CJS/KW hypotheses; use a nowhere-dense closed centre avoiding components. Do not add preservation of the preexisting SNC locus to the stronger ample-exceptional resolution without proof.

   Directly affected: `resolution-three`, `ample-exceptional-resolution`, `compatible-resolution`. Further consumers inherit this blocker in the JSON.

3. `gap-seshadri-limit`: Lemma2.56's printed equality lim ε=k has a two-blowup counterexample with k=1 and constant ε=2, detailed in the report. The proof suggests only liminf ε≥k; §8 consumers seem to need only this lower bound. Independently verify the example and prove the weaker sufficient statement before closing those consumers.

   Directly affected: `seshadri-lower`, `mobile-descent`, `exceptional-ceiling`. Further consumers inherit this blocker in the JSON.

4. `gap-adjoint-sign`: Lemma4.28's displayed positive L=M-(K_X+S+B) disagrees with the Cor3.7 negative-twist input and its own dual expression. Keep the asserted result provisional and check the candidate replacement L=(K_X+S+B)-M in every step; no author-approved erratum located.

   Directly affected: `adjoint-single-complex`. Further consumers inherit this blocker in the JSON.

5. `gap-weil-adapter`: Corollary4.20 invokes Lemma2.36 on a rounded divisor on Y that is not guaranteed Q-Cartier. Supply a reflexive/Weil pushforward version with a codimension-one proof or justify the missing Q-Cartier condition.

   Directly affected: `divisor-pushforward`, `rounded-birational`. Further consumers inherit this blocker in the JSON.

6. `gap-pure-birational`: Proposition6.28's ordinary globally +-regular conclusion from pure global +-regularity fails already for the identity of a DVR with its reduced closed divisor. Candidate conclusion preserves 'purely'; Theorem7.14's consumer uses that form. Verify its fixed-complete-base proof from Proposition4.27 without assuming general adjoint completion, which Remark4.30 leaves open.

   Directly affected: `pure-birational-repair`, `surface-plus-perturb`. Further consumers inherit this blocker in the JSON.

7. `gap-cone-length`: Theorem9.28's internal strict length bound conflicts with its proof and introductory non-strict bound. Retain only ≤4d_C until the strict endpoint is independently justified.

   Directly affected: `cone-length`. Further consumers inherit this blocker in the JSON.

8. `gap-section-nine-scope`: Check the repaired supplier selection and standing hypotheses: Cor9.33 needs general BPF9.27 rather than big-only9.17;9.36 needs full-boundary termination9.8 plus terminalization, not only9.7;9.34 must retain characteristic exclusions used by9.20;9.21 needs the three-dimensional normal effective-boundary context.

   Directly affected: `real-bpf`, `finite-minimal-models`, `finite-closed-termination`, `dlt-modification-qfactorial`, `dlt-modification-nef`, `dlt-modification-excess`, `dlt-modification-fibres`. Further consumers inherit this blocker in the JSON.

9. `gap-moduli-bound`: Theorem K gives 373 for v=1 whereas printed Theorem10.6 gives 393; the proof computes 373. Use the conservative 393 checkpoint and retain β(v)=213v+48 for v≥2, pending version/author clarification. Do not replace the closure of the smooth locus by the entire stable-surface moduli stack.

   Directly affected: `discriminant-bound`, `smooth-closure-proper`, `smooth-coarse-projective`. Further consumers inherit this blocker in the JSON.

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

## Sources and reading limits

- **main**: [source](https://link.springer.com/content/pdf/10.1007/s10240-023-00140-8.pdf). Entire published 159-page paper, pp69–227, §§1–10 and references; continuous extracted text through line8125. Pages85,88,101,128,154,216 also checked as images. SHA-256: `a07fcb798fee01a791980ef8fb72e345da22e7f406af2e245adc47da53cf73d6`. Limit: Full primary-paper reading, not full transitive prerequisite closure.

- **main-v3**: [source](https://arxiv.org/pdf/2012.15801v3). Selected algebra, vanishing, adjoint and MMP passages compared with the published version; earlier Hacon–Witaszek audit supplies the detailed partial log. SHA-256: `533218825ca5045a9e8e04da1f78ef51e05c90dd83ca4ecb7cd6e8c68dff3d80`. Limit: Not a full132-page version comparison. Published version controls this extraction.

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

## Verification and handoff

Run the repository paper checker and the supplemental dependency/route/API audit recorded in the JSON. Their scope is structural consistency, not mathematical proof. No Lean deliverable is required for this paper job; no Lean compilation or execution of the180 tests is claimed.

Resume from [the handoff](../handoff/PAPER-BHATT-ETAL-23.md). The next worker should prioritize the two explicit counterexamples and their minimal sufficient repairs, then exact original-source closure and finer statement splitting. This checkpoint must not be marked complete merely because every currently listed missing item has a route.
