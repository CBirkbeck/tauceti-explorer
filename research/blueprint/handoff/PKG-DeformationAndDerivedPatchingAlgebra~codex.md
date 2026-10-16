# Package handoff: DeformationAndDerivedPatchingAlgebra, Part I

Issue: #10011. Job: `PKG-DeformationAndDerivedPatchingAlgebra~codex`.
Agent: Codex, session `codex-JCneCV`, 2026-10-16.
Claim confirmed in [the bot's reply](https://github.com/CBirkbeck/tauceti-explorer/issues/10011#issuecomment-6217876196).
Input: accepted assembly `ASM-DeformationAndDerivedPatchingAlgebra~2`, including the eleven accepted Part I packets. This is a package submission, not an independent review or an implementation claim. No second job was claimed.

## Delivered and shape

The package has nine layers, 88 numbered mathematical subsections, exact supplier contracts, named interfaces, source locators, discriminating Checks, worked examples, downstream consumers and a versioned bibliography. The mathematical order separates the elementary graded/initial-ideal completion proof from later multiplicity, and the algebraic integral-point argument from its valued interpretation. Part II's Macaulayfication is consumed rather than replanned.

`Suggested.lean` has 538 lines, 12 real-bodied definitions, three native abbreviations, 21 theorems and 49 examples. Its namespace is `TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra`. Heavy objects and constructions remain README targets, collected in one closing comment; no carrier, instance or data definition is sorry-defined. The duality sign examples compute the numerical chain equations of the README's two-term models; they do not implement the absent duality functor. The complete patching and support-transport constructions likewise remain mathematical targets, not compiled constructions.

The README is about 238 KB. This follows the binding 2026-10-12 shape in `PACKAGE_REVIEW.md`, which explicitly overrides older size notes and requires retaining targets, hypotheses, Checks and locators. The older 50–200 KB sentence in the issue was not used to cut mathematics. Only the four issue deliverables are changed. No packet, reader, atlas stage, review object, implementation status or foreign roadmap is edited.

## Retention and reconciliation

The assembly contains 1,096 node rows, 871 API contracts and 735 tests. Many rows are successive refinements of the same mathematical construction. The package consolidates them by mathematical object rather than reproducing the catalogue. The input-to-output map is:

| Input | Rows / APIs / tests in assembly inventory | Package destination |
|---|---:|---|
| Base endpoints | 129 / 212 / 134 | All nine layers; broad endpoints specialized by the detailed inputs below |
| R03.1 | 106 / 68 / 57 | §§1.1–1.16; finiteness, diagonal and tensor-coordinate applications in §§4.1–4.6 |
| R03.2 | 10 / 47 / 26 | §§2.1–2.8, with coefficient lifting supplied by Layer 1 |
| R03.3 | 57 / 17 / 12 | §§3.1–3.15; finite-action and component applications in Layers 5–6 |
| R03.4 | 13 / 0 / 0 | §§4.1–4.3, with the completed-map adapter in §1.16 |
| R03.5 | 21 / 24 / 19 | §§5.1–5.9; augmentation faithfulness separated in §§6.1–6.5 |
| R03.6 | 53 / 22 / 13 | §§6.1–6.9, §§3.13–3.14 and the geometric conditions in §4.6 |
| P7 | 478 / 372 / 398 | Ordinary graded adapters §§1.1–1.5; local algebra and jets §§3.1–3.16; finite/derived complex comparisons §§7.1–7.10 |
| P7-2 | 118 / 58 / 42 | §§7.1–7.8 and 7.10: native tensor/Hom adapters, complete-flat basis and splitting, signed duals, strict towers and filtration convergence |
| P8 | 51 / 18 / 19 | §§8.1–8.6; finite-model and coherent reduction prerequisites in §§7.3, 7.8 |
| P9 | 60 / 33 / 15 | §§9.1–9.7; isolated action factors in §7.9 and normalization calculation in §9.5 |

The scope and supplier contracts replace bookkeeping references to FoundationsAndLibraryIntegration and `UPSTREAM:` with the actual library or roadmap owner. Broad internal stage edges become exact earlier subsection interfaces. The generic graded completion proof precedes CNL Noetherianity; the coheight-one theorem precedes diagonal local-field coordinates; completion maps and regular-source squares precede CI presentation independence. No whole-stage cycle is treated as a proof.

The package repairs or makes explicit the following inherited interfaces:

- A minimal relative presentation has `J⊆m_S²+m_ΛS`, not necessarily `J⊆m_S²`. Its relation space is `J/m_SJ`, not `J/J²`.
- Minimal resolutions are retained for every finite module over a Noetherian local ring, including infinite projective dimension. This supplies the first Betti numbers needed for balance. A square presentation is not a two-term resolution.
- `localCompletionMap`, its closed-fibre comparison, `regularSourceSquare`, and `regularGenerators_iff_koszulAcyclic` are named targets, with a route not requiring separable residue fields.
- Kisin's equal-dimension finite-projective criterion is retained globally as well as locally. The generic formal-smoothness condition is made pointwise in the maximal-adic local topology. Stacks Theorems 15.41.1 and 15.50.3 give the route to `genericSeriesRegular`; an algebraic `Algebra.FormallySmooth` instance is not asserted.
- Arbitrary complete-flat coefficients require completion of a free direct sum, restricted coefficient families and column-restricted continuous matrices. These comparisons are explicit in §7.5, not inferred from the DVR-only supplier.
- Finite-code selection retains actual maps, actions, ideals and augmentation diagrams, one filter, coherent minimal models and strict reduction cocycles. Ring isomorphism classes alone are insufficient.
- Error-quotient deformation actions are separated from genuine derived deformation actions. The scalar map `S_∞→R_∞` does not lift `R_∞→T_∞/I_∞` to `T_∞`. The former gives spectral support; the latter is additional input for a genuine patched CM functor.
- The CG variant supplies all coefficient, original-level and framing-quotient cohomology actions, in the range corrected by the 2022 corrigendum, items (1) and (10). It does not infer those actions from nonflat cohomology base change.
- ACC's paired transport uses a local characteristic-zero nonzero seed, not a new global amplitude assumption. Its conclusion covers every top-dimensional component; full support additionally needs equidimensionality.

## Duplication audit and ownership

Read the reviewed library audit and searched by objects, hypotheses, differentials, annihilators, grading fields and composition operations, not just proposed names. Inspected Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174`, pinned Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`, current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, and current TauCetiRoadmap at `0d144d044dacebca17b654695b6f1ad58f159b27`, including its Completed roadmaps and the nine post-snapshot roadmaps. No build ran in either current read-only checkout.

The local current-roadmap checkout does not contain every package the atlas order page describes as ported. In particular the scheme/enhanced-derived and Part II contracts are identified by their roadmap ownership rather than misreported as implemented or as files found in that checkout. Part II remains a required consumed boundary under the issue's instruction. The supplied current checkout and library were read, never altered.

| Existing mathematics removed from new-goal ownership | Exact supplier used | Additional content retained here |
|---|---|---|
| Regular local rings are domains; regular-parameter quotient and converse; dimension-one DVR characterization | Current `TauCeti.RingTheory.RegularLocalRing.Basic`: `TauCeti.IsRegularLocalRing.isDomain`, `quotient_span_singleton`, `quotient_span_singleton_iff`, `isDiscreteValuationRing_iff_ringKrullDim_eq_one` | Missing homological comparisons and presentation/CI adapters |
| Rees grading, its internal decomposition, degree-zero equivalence and degree-one generators | Current `RingTheory.ReesAlgebra.Grading`, `reesAlgebra.grade`, `reesAlgebra.isInternal_grade` | Ordinary adic quotient classes and native module-piece comparisons |
| Homogeneous quotient grading and generic graded completion series map | Current `RingTheory.GradedAlgebra.Homogeneous.Quotient` and `.Completion` | Actual adic coefficient/projection maps and initial-ideal completion argument |
| Primary ring quotient has finite length; positive-dimensional local ring has infinite self-length | Current `RingTheory.Length`, `Ideal.isFiniteLength_quotient_of_radical_eq_maximalIdeal`, `TauCeti.length_self_eq_top_of_ringKrullDim_pos` | Module annihilator, coefficient and multiplicity comparisons |
| Regular sequence/Ext-depth and quotient projective-dimension formulas | Pinned `RingTheory.Depth.Rees`, including `ModuleCat.exists_isRegular_tfae` and the two quotient-pd declarations in Exact supplier contracts | AB, minimal resolutions, finite-action depth and CI applications |
| Native evaluation, total truncation and multiplicativity of formal-series order | Pinned Mathlib and Tau Ceti `MvPowerSeries` evaluation modules | Cotangent-generator surjectivity and actual jet/tangent-cone quotient comparisons |
| Generic injective envelopes, derived category and linear Hom enrichment | Pinned Tau Ceti envelope and `TauCeti.linearHomComplexEnrichedCategory`; native Mathlib derived modules | Residue-hull/Matlis adapters and signed perfect comparisons |
| Generic derived tensor/Hom, enhancement, coherent limits and derived completion | SmoothRepresentationsOfLocalGroups SR0d; EnhancedDerivedSheaves E1/E2/E4; DerivedDeRhamCohomology DD1 | Trivial-group/native module comparisons, strict quotient towers and finite-model completion |
| Finite derived Hom, ghosts and idempotent splitting, including bounded finite cohomology beyond perfect objects | Current IntegralHeckeAndGaloisDeterminants Layer 2, namespace `TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants.HeckeImage`: `derived_hom_finite`, `ghost_nilpotence`, `action_annihilator_power`, `exists_idempotent_splitting` | Transport of actions, isolated-factor/cohomology localization comparisons and derived right-edge equivariance |
| Finite complete-local factor decomposition | Same namespace, `finite_local_factors` | Localization/completion comparison retaining coefficient and original algebra maps |
| General depth, grade, CM, Serre conditions, excellence, Cohen structure and abstract Schlessinger theory | SchemeAndStackFoundations SF.0/SF.4 | Labelled coefficients, relation-obstruction realization and module applications |
| Completion regularity and finite-map miracle flatness; Witt elliptic test algebras | ModularCurves §§4D, 7D | Module-level flat-fibre criteria and general labelled test-category comparison |
| Generic completed tensor; DVR completed free/group algebras and coefficient pairing | AdicSpacesPartII F0; PadicMeasuresIwasawaAlgebras Layers 0, 1, 6 | Complete-local coproduct, arbitrary complete-Noetherian-local flat basis and patching |
| Finite intermediate-field valuations, topology and integer-ring comparison | LocalFieldsRamification Layer 0 | First construct the algebraic point in finite integral closure without assuming that valued comparison |
| Generic free profinite/pro-p groups | ProfiniteProPGroups Layers 0, 3, 4 | Continuous matrix-representation adapter under explicit finiteness inputs |
| Finite locally free duals, exterior powers and determinants | AlgebraicVectorBundles 0B–0C | Determinant trivialization from a finite free resolution and Hartogs extension of the specified map |
| Generic finite-support Euler characteristic and triangle additivity | GrothendieckEulerForms Layer 5 | Local divisor defect, normalization coefficient and finite-action length comparison |
| Generic perfect idempotent envelope | DGAInfinity | Native factor comparison; the broader native splitting comes from the existing Hecke-image roadmap |
| Plane intersection multiplicity and Macaulayfication | Current Tau Ceti `RegularIntersectionMultiplicity`; DeformationAndDerivedPatchingAlgebraPartII | Ordinary Hilbert–Samuel jets and multiplicities here; no second intersection-multiplicity or blowup theory |

No matching construction of the new Hilbert–Samuel, trace, symbolic-square, F-finite, Gorenstein, arbitrary Kaplansky or minimal-complex targets was found in the inspected libraries/roadmaps. The negative result is an audit finding, not an implementation guarantee.

The tier-10 package cites only its own earlier interfaces and lower-tier suppliers in the order file. Higher applications now import module algebra from here. Moved-down notions, which must not be planned again upstream in those applications, are:

| Higher consumer/direction | Owner and exact interface here |
|---|---|
| GaloisDeformationTheory and arithmetic deformation conditions | §§1.6–1.11, 2.1–2.8: labelled lifts, minimal presentations, relation/socle obstruction and framed matrix realizations; arithmetic cohomology and deformation conditions stay there |
| CompletedCohomology and its arithmetic towers | §§7.1–7.8: module-derived coefficient adapters, complete-flat minimal models, strict towers and finite-model Hom completion |
| SchemeSixFunctorFormalism and geometric patching | §§3.7–3.10, 7.1–7.10: ring-level local duality and native module comparisons; generic geometric enhancement stays with its existing lower supplier |
| AutomorphyLiftingBeyondTaylorWiles and related automorphy applications | Layers 5–6, 8–9: finite decorated module/complex patching, genuine versus quotient actions, concentration, normalization length and paired top-component support |

The arbitrary complete-Noetherian-local topological basis extension requested from PadicMeasuresIwasawaAlgebras is stated here in §7.5; its existing DVR result alone is not used as if it supplied that extension. This records the change of owner for this package without editing the other roadmap.

## Sources, limits and outstanding proof contracts

No source passages or source files were added. The nonpublic cleared ACC23, Pilloni20 and EGA sources were read in the maintainer's library by streaming the needed pages; neither files nor passages were copied. Public-source working downloads are disposable. The package is arranged by mathematical constructions, not by a source's sequence of sections.

The important direct readings include KW II Lemmas 4.4/4.6 and Corollary 4.7; Kisin Proposition 3.3.1 and Lemma 3.3.4; CG module and complex patching and its correction; ACC23 §§6.3–6.4, printed pp. 1048–1061; Pilloni's complete-flat cancellation and local flatness arguments; IKM Lemmas 10.7–10.8 and Theorem 11.3; BCGP25 §§7.1–7.4, especially pp. 160–166 and 172; the Stacks completion, regular-source, flat-fibre, perfect-complex and spectral-sequence leaves; and Avramov–Iyengar Theorems 2.1/2.4. Locators distinguish author-PDF and published pagination.

Corrections to inherited references include:

- The alleged Dat–Pham reference for the associated-prime Hom formula was unrelated: the cited arXiv record is Dittmann–Pop on finitely generated fields. It is not used. The package uses the direct localized-socle argument, Stacks associated-prime/normality sections and IKM Lemma 7.5, p. 33.
- Pilloni20 is *Higher coherent cohomology and p-adic modular forms of singular weight*, published in Duke Math. J. 169 (2020); author-copy pages are used. It is not attributed to Forum Math. Pi or to a plural-weight title.
- The two-term vanishing lemma is IKM Lemma 10.8, pp. 48–49, not an ACC lemma. ACC Lemma 6.3.3 supplies isolated blocks.
- Stacks tag 0BCC is Lemma 15.77.6. The regular-fibre projective-dimension bound uses 09PC, and separable finite normalization uses 032L.
- BCGP25's fixed-ring maps in §7.1 are maps, not automatically surjections. The cotangent conclusion is surjectivity at the marked completed point, not an automatic isomorphism.

The README could not justify the following stronger assertions as automatic consequences of the accepted suppliers. They remain explicit targets or prerequisites; independent review should not silently promote them to supplied results:

1. **General multiplicity one.** §3.14 proves/plans the equal-characteristic formally-unmixed implication using Stone Theorem 16, p. 20. The general mixed-characteristic converse is explicitly separated and needs a general primary proof; the cited equal-characteristic reduction is insufficient.
2. **Connectedness.** §6.6 cites Thorne Proposition 1.8, p. 8, but retains the primary connectedness argument, Brodmann–Rung Theorem 2.4, as a proof prerequisite. I did not read that primary proof. The finite capped normalization of connectedness dimension is explicit.
3. **Lescot/stable cohomology.** The Avramov–Iyengar statements and their reduction were read. Their Martsinkovsky Theorem 6 proof input was not independently read. §3.2 retains the exact criterion without claiming a new proof of that input.
4. **Cohen interfaces.** The arbitrary residue extension, imperfect-field Cohen choices, strict Cohen ring/perfect hull and prescribed compatible coefficient map must be supplied with the stated maps. A Cohen-to-Cohen embedding theorem alone does not prove a prescribed coefficient embedding into every target with torsion. The regular-source square avoids adding a separability hypothesis, but does not resolve every relative Cohen choice in §1.10 or the diagonal local-field calculation in §4.5.
5. **Full-socle obstruction naturality.** SchemeAndStackFoundations SF.4 must supply the complete obstruction interface for arbitrary finite-dimensional socle kernels and arbitrary linear pushouts, including the zero kernel. An interface only for one-dimensional small kernels does not prove the relation-space injection of §§2.3–2.5.
6. **Geometric CI suppliers.** SF.3 additionally needs parafactoriality of a local CI of dimension at least four (SGA 2, XI, Theorem 3.13(ii), new-edition p. 105, old p. 132). SF.4 additionally needs affine lci/syntomic predicates and comparisons. These are required extensions, not declarations found in the current checkout. The regular-local finite-resolution line-bundle assertion has its separate determinant proof.
7. **BCGP cotangent images.** §5.8 preserves the uniform generator and image-of-squares/diagonal-image hypotheses. The comparisons cited in the proof as Newton–Thorne 2023, Lemmas 4.16, 4.17 and 4.19, were not independently established here. Vanishing relative cotangent gives the stated completed surjection; source regularity, dimension and depth are separate inputs for freeness.
8. **Native heavy comparisons.** Enhanced/native module comparison, linearly compact inverse-limit exactness, compatible minimal based representatives and strict cocycles, and the actual spectral-sequence pages/finite abutment filtration remain construction targets. Naming the enhanced limit does not construct a functor on arbitrary triangulated diagrams. The README gives their representative formulas and proof routes; no sorry-defined Lean carrier substitutes for them.
9. **Genuine deformation action and duality.** Error-quotient data alone do not give a derived deformation action or finiteness of the whole deformation ring over the scalar ring. The genuine-action/CM-functor statement requires the specified lift; uniform adjustment of coefficients in the more general IKM proof is not asserted without that input. Canonical duality through the finite faithful action quotient is a named prerequisite, not a claim that the whole deformation ring is finite.
10. **Derived right-edge equivariance.** §§9.4–9.7 require the naturality of smart truncations and derived coefficient change for a merely derived finite action. Strict chain-action spectral sequences do not by themselves prove it. The isolated-factor/native splitting supplier does resolve the old P9 request for idempotent splitting beyond perfect objects; localization-cohomology and right-edge comparisons remain the new work.

These are visible mathematical boundaries of the roadmap. The package does not represent the source gaps as Lean proofs, omit them to shorten the document, or claim that lower-tier planned contracts are already implemented.

## Adversarial pass

Each row includes the definitions, API identities, theorem hypotheses and conventions in that subsection. Instances were evaluated mathematically; a `sorry` elaboration is not a truth test. A condition absent in the row's examples is not inferred for arbitrary data. The table records changes and retained restrictions rather than issuing an independent review verdict.

| Statement family | Instances tried and computed | Result / change |
|---|---|---|
| 1.1 adic quotient, classes, expansion and projections | `I=0`, `I=A`, DVR `(x)`; classes multiply degrees `1+1=2` | Zero ring/positive-degree cases and quotient denominator fixed explicitly |
| 1.2 generator and coefficient maps | Identity, `k[[x]]→k`, ramified inclusion with larger ideal, cusp inclusion with `I=(t²)` | Added genuine image-ideal counterexample: `t⁵∉t⁴A` but `t⁵∈t⁴B`; injective coefficient map alone insufficient |
| 1.3 adic module coordinates | Zero, `A/(x²)` with graded ranks `1,1,0,…`, zero/unit ideal | Actual coefficient carriers and regular-module comparison retained |
| 1.4 kernel/cokernel recurrence and quotient actions | `k[X]`, `k[X]/X²`, `x=0`, no remaining variables | At degree one `0-1=0-1`; kernel sign and degree-zero cokernel checked |
| 1.5 homogeneous generators and initial ideal | `(x²+x³)`, zero ideal, unit-ideal completion | Separated complete target and convergent finite coefficient corrections required |
| 1.6 labelled categories | Zero variables, residue automorphism, incomplete `k[X]_(X)` | Labels exclude nonidentity residue automorphisms; completeness remains separate |
| 1.7 small/socle/square-zero extensions | Identity; `Z/4→Z/2`; `Z/8→Z/2`; two-dimensional square-zero kernel | Identity excluded; nonzero principal socle condition retained, not merely square-zero |
| 1.8 truncations and complete towers | `n=0,1,2`, bounded versus unbounded cotangent dimension | Positive truncations only; inverse-limit coefficient category needs uniform cotangent bound |
| 1.9 cotangent, tangent and presentations | `O→O`, two-variable series, dual numbers, variable sent to unit | Relative denominator includes `m_A B`; continuous local evaluation required |
| 1.10 residue extension and Cohen choices | Identity, `k[[X]]→K[[X]]`, ramified DVR, `C/p²`, imperfect residue | Maximal-ideal equality checked; perfection not called separable; torsion coefficient map need not inject |
| 1.11 formal smoothness and complete lift | Identity, zero/one variable, dual numbers against `k[t]/t³`, `F₂` | Chosen complete lifts only; no uniqueness, quadratic obstruction survives characteristic two |
| 1.12 completed tensor adapter | Unit factor, two variable factors, finite dual-number factor, ordinary tensor | Actual joint presentation and finite-factor completeness retained; no uncompleted replacement |
| 1.13 flat completion | `I=0`, `I=R`, infinitely generated polynomial algebra flat over `R` | No Noetherian hypothesis on `S`; faithfulness requires explicit surviving-fibre assumptions |
| 1.14 quotient and finite completion factors | `J=(π²)`, `J=A`, `R×R`, domain `Z_(5)[i]` over `Z₅` | Corrected false domain-before-completion claim; two `5`-adic factors may appear |
| 1.15 pro-Hom, Chevalley and power ideals | DVR residue module, `d=0`, `r=0`, two variables at exponents `2n-1` and `2n-2` | Pigeonhole bound sharp in the displayed witness; only cofinality, not same-index equality |
| 1.16 completion maps and regular-source square | Identity, polynomial localization/completion, `k[[x]]→k`, inseparable `k→K` | Named actual maps; enlarge regular source target to retain parameters; no separability requirement |
| 2.1 minimal relative presentations | `R=Λ`, `R=k` over DVR, redundant linear variable | Coefficient-linear relation `(π)` allowed; minimality is relative |
| 2.2 relation space | Zero, `(X²)`, `(X,Y)²` over `F₂`, two presentations of `k` | `J/mJ`, not conormal; relation count tied to chosen presentation |
| 2.3 relation obstruction | Zero kernel, one-dimensional kernel, change of lift | Residue-natural obstruction and full finite-socle contract required |
| 2.4 universal Artinian relation test | No relations, quadratic relation, two independent relations | Quotient retains all relation classes; no unsupported canonical coefficient section |
| 2.5 hull equation bound | Identity hull, zero tangent, one relation, mixed-characteristic residue algebra | Bound uses complete-obstruction injection; arbitrary functor not admitted |
| 2.6 finite matrix equations | Trivial group, rank zero/one, `C₂` in characteristic two | `(1+x)²=1` gives `x²=0` at `p=2`; fixed basis retained |
| 2.7 continuous framed representations | Trivial group, finite residual field, finite generator hypothesis | Profinite continuity and Noetherianity require the stated kernel quotient finiteness |
| 2.8 principal-unit orbit hull | Field, dual numbers, `k[t]/t³` self-pullback, `F₂` substitution | Tangent bijection but noninjective pullback; `X+X²` nonidentity over every field |
| 3.1 resolutions, depth and AB | Free rank zero/one, DVR residue, dual-number residue infinite resolution | Extended depth for zero; nonzero finite-pd hypothesis for numerical equality; arbitrary finite minimal resolution retained |
| 3.2 regular homological and Lescot tests | Field `d=0`, DVR `d=1`, singular hypersurface | Koszul/Ext exterior comparison explicitly restricted to regular local ring; criterion's proof leaf recorded |
| 3.3 finite actions, global criterion and fibres | Zero action, series ring evaluating at zero, reducible node, semilocal unequal dimensions | Finite image not whole ring; domains/equal dimension/projectivity retained; global Kisin version restored |
| 3.4 regular ideals and CI | Empty list, unit, `(X²,XY)`, `(X²,Y²)`, repeated `X`, characteristic two | Nonzero quotient and minimal-generator/Koszul comparison explicit; Tate/divided-power proof retained |
| 3.5 dimension criterion | `r=t=0`, redundant equation, DVR quotient by `π` | Total dimension equality alone does not imply base flatness; closed-fibre inequality retained |
| 3.6 associated primes and symbolic square | Zero prime in domain, local maximal prime, node `xz=y²` at `(x,y)` | `zx=y²` witnesses symbolic membership without ordinary square, including characteristic two |
| 3.7 residue hull and Matlis dual | Field, DVR, dual numbers, incomplete DVR | Socle of dual numbers is `(ε)`; bidual gives completion before completeness |
| 3.8 supported cohomology | Zero/unit ideal, DVR `(π)`, residue module | `O→E` has cohomology in degree one; residue module remains in degree zero |
| 3.9 normalized duality | Field, DVR, one regular quotient | Normalized DVR complex is `O[1]`, degree `-1`; localization need not preserve chosen normalization |
| 3.10 canonical CM dual, Gorenstein, type and trace | Field, DVR, Artinian dual numbers, zero, rank-one free, torsion module | Full derived shift retained; trace uses all linear functionals; trace-one conclusion requires a split summand |
| 3.11 abelian group-ring CI | Trivial group, cyclic group, `p=2`, coefficient ramification | Empty relation list and monic group equations; use `π` as coefficient uniformizer |
| 3.12 Hilbert polynomial | Field, DVR, zero, no variables | Cumulative exponent `n+1`; zero polynomial degree not used as support dimension |
| 3.13 intrinsic/ambient multiplicity | Free ranks, finite length, lower-dimensional summand, finite residue extension | Common ambient coefficient needed for additivity; localized lengths finite before integer extraction |
| 3.14 parameter Euler and initial-form inequality | DVR `π^r`, cusp `u²=v³`, `x=0`, finite field | Regular element alone insufficient for Hilbert equality; corrected initial-form condition; mixed-characteristic proof separated |
| 3.15 Frobenius and loci | Perfect `F₂`, `k[[x₁,…,x_d]]`, infinite p-basis field, dual numbers | Flat Frobenius not necessarily finite; finite Frobenius not necessarily regular; all relevant fibres for Serre ascent |
| 3.16 jets and tangent cone | `N=0,1,2`, order four giving `1,3,6`, zero/unit equation, cusp, `p=2` | Shifted multiplication only in its range; field/two-variable numeric case separated from general coefficient-domain comparison; defect may be negative early |
| 4.1 residual-fibre finiteness | `O/π^n`, `O[[X]]/π`, dual numbers, finite action image | Complete source, Noetherian local target; no target completeness or flatness inferred |
| 4.2 integral points | `O`, `O/π^n`, `O[ε]/ε²`, ramified uniformizer | Nonnilpotent `π` detects nonempty generic fibre; separable normalization separated from valued topology |
| 4.3 formally smooth points | Zero variables, `X↦m_O'`, `X↦1`, `X²=π` | Residue point and compatible lifts retained; nonsmooth equation may need ramified target |
| 4.4 generic fibres and series regularity | Field/DVR generic, `r=0,1`, `O[ε]/ε²`, inseparable characteristic-p field | Named pointwise formal-lifting predicate and regular-map route; no equality `O[[X]][1/π]=E[[X]]` |
| 4.5 diagonal coordinates | Finite generic/residue extension, `F=k((t))`, ramified coefficient | Extra local-field parameter raises dimension by one; finite residue extension at punctured point explicit |
| 4.6 tensor domain and components | Field point, one regular coordinate, dual-number nonregular point, non-geometric components | Coordinate isomorphism named; global generic regularity restricted to finite `E/Q_p` setting |
| 4.7 detection by points | Zero ideal/module, reduced flat quotient, coefficient torsion | Points detect reduced flat quotient and torsion-free module images; not integral nilpotents |
| 5.1 balance and square presentations | Zero, free, dual-number residue, two-dimensional regular residue, trivial group | Square map need not inject; noncommutative group-ring minimal resolution formulation explicit; Tor correction retained |
| 5.2 decorated module data | Empty matrix, differing action maps, compatible specialization | Ring maps and bases survive zero rank; module isomorphism alone insufficient |
| 5.3 cutoffs and extraction | Zero/one auxiliary variable, `n=0` boundary, two-index cofinal choice | Positive finite cutoffs and original levels retained; arbitrary subsequence equivalence not claimed |
| 5.4 limit presentation | Constant matrix, zero matrix, changing action with fixed cokernel | Actual maps/scalar lifts and coherent tower comparison required |
| 5.5 balanced patching/depth | Free, nonzero square torsion cokernel, zero target, `q=1`, `p=2` | Dimension deficit gives injective relation map; theorem keeps source's `p≥3`; rank-zero branch separate |
| 5.6 Kisin ring/module data | No variables, rank one/zero, squares in characteristic two | Individual-power ideal distinguished from ordinary ideal power; zero exponent cutoff avoided |
| 5.7 generic projectivity | Free rank positive, zero module excluded, coefficient torsion example | Finite projective/faithful generic conclusion; no integral strengthening; regular generic-series interface added |
| 5.8 pointwise cotangent patch | Zero cotangent, nonsurjective fixed-ring map, nonregular source | Map versus quotient distinction; cotangent gives completed surjection only, freeness needs regularity/depth |
| 5.9 Sylow/norm comparisons | Trivial group, trivial Sylow, norm in characteristic dividing group order | Projectivity criterion and dual coefficient pairing retain exact module and group hypotheses |
| 6.1 near faithfulness/components | Zero, rank one, residue of dual numbers, `E/O`, node component | Fixed support/fibre confusion; `Q/Z` Lean control added; nil containment versus uniform nilpotence distinguished |
| 6.2 quotient and coefficient change | `I=0,A`, nilpotent kernel, localization at regular element, formal augmentation | Finite module or flat base-change support equality; no missing inverse-direction hypothesis |
| 6.3 coefficient-flat quotient | `O`, `O/π^n`, `O[ε]/(πε,ε²)`, flat dual numbers | Removes coefficient torsion, not arbitrary nilpotents; zero quotient outside coefficient category |
| 6.4 patched quotient descent | Free positive rank, zero rank, cusp ideal `(t²,t³)` modulo `(t²)` | Corrected false faithful-only integral equality to faithfully flat; near-faithful radical equality retained |
| 6.5 ring identification | Reduced source/target, nonreduced flat ring, generic-only free module | Reduced equality versus maximal-flat equality separated; torsion-free action image needed |
| 6.6 connectedness and arithmetic rank | Field, domain, node, `(x²,y³)`, principal power | Finite cap and `dim ∅=-1`; primary connectedness proof remains explicit |
| 6.7 generic/special cycles | Rank-one component, repeated special component, nonreduced generic length | Unique-component and coefficient-one assumptions explicit; generic length not an unjustified field rank |
| 6.8 products and monomial cycles | `(xy)`, `(x²)`, six-variable example | Four minimal vertex covers give dimension three, multiplicity four; reduced/equidimensional does not imply CM |
| 6.9 extension/maps and multiplicity | Rank-one ideal image, `O⊕k↠O`, regular puncture, imperfect coefficient | Image depth-two hypothesis and specialization Tor/saturation needed; equal multiplicity requires CM source |
| 7.1 native derived operations | Zero, arbitrary free stalk, `Z/2`, identity/shifted tensor | K-flatness tests acyclic complexes; actual tensor/Hom comparison, not second generic bifunctor |
| 7.2 perfect/pseudo-coherent/amplitude | Finite projective stalk, singular residue, zero, interval enlargement | Every module tested for amplitude; bounded finite cohomology alone not perfect |
| 7.3 minimal representatives | Identity disk, `π`-disk, field, zero middle term in three-term sequence | Residual exactness gives middle exactness only; endpoints not silently strengthened |
| 7.4 approximations/filtered Hom | Finite projective stalk, infinite vector space, bounds tending to `-∞` | Compactness and common target lower bound distinguished; brutal source versus smart target truncation |
| 7.5 Kaplansky and complete-flat models | Infinite direct sum, `O/π`, `(x,y)` ideal, empty/single residue basis, `(π^j)` versus `(1)` | Fixed flat-ideal overgenerality; free direct sum completion, individual column restriction and homotopy-only transferred multiplication explicit |
| 7.6 signed perfect and `E/O` duality | Rational `2`-disk, degree-one cone tensor, `F₂`, DVR residue and incomplete DVR | Dual `+2`, bidual `-2`, evaluation `+1,-1`, cone cross sign `-1`; completion and adjoint cokernel conditions retained |
| 7.7 strict quotients and Milnor | Zero, stalk, `Z/2` nonflat reduction, identity/zero tower, `I=A` | Strict diagram only; `lim¹` retained; completeness explicitly I-adic, not an unrelated topology |
| 7.8 finite models and Hom completion | Constant free, constant `π` matrix, zero ranks, homotopic maps, infinite residue | Based cocycles required; limits of derived Hom rather than unique chain lifts; linear compactness needs no finite residue |
| 7.9 derived actions and isolated blocks | Scalar stalk, zero, `x=0/1` actions, field product, nonisolated generic localization | Broader splitting imported from existing supplier; only isolated factors split; two-term vanishing uses shifted dual |
| 7.10 coefficient spectral sequence | Free stalk, torsion self-tensor, free `2`-disk, zero, strict scalar action | `Tor_-p`, differential direction and finite diagonal bounds computed; derived right-edge naturality separate |
| 8.1 matrix models and finite germs | Zero profile, one term, `F₂` identity disk, reduction of `2`, principal/nonprincipal filter | Finite coefficient and profile assumptions essential; unrelated filters may give acyclic versus nonacyclic patches |
| 8.2 finite input diagrams | `δ=1`, one residual degree, unbounded profile, missing frame augmentation | All maps and residual comparisons supplied; top augmentation alone insufficient |
| 8.3 finite jets/decorations | Untruncated extra variable, fixed matrix with changing actions, zero rank, unbounded error exponent | Entire maximal-ideal jet and one uniform nilpotence exponent; actual action maps selected simultaneously |
| 8.4 complete patch/actions | Constant free, two-term matrix limit, zero/nonzero error, finite Hecke image | Scalar-map direction checked; genuine deformation lift an additional hypothesis |
| 8.5 augmentation/paired reduction | Free stalk, `x`-disk, zero errors, unrelated filters, nonzero specialization error | Whole derived comparison and both error images retained; group-only augmentation leaves frame variables |
| 8.6 cohomology-action patch | `l=0`, `j=0`, `H=0`, nonflat `π`-disk | Corrected level ranges/framing quotients required; no derived action or whole augmentation inferred |
| 9.1 support, annihilator and dimension | Zero, stalk, sums, free plus shifted residue, `π`-disk | Union/intersection orientation and shift subtraction checked; fibre test only for perfect objects |
| 9.2 codimension and concentration | DVR `π`-disk, `O[[x]]` x-disk, `S/(x)⊕k`, zero, interior stalk | Width rather than count of degrees; Tor interval and genuine R-action conditions explicit |
| 9.3 CM functor and dual | Zero width, width-one x-disk, zero object, torsion disk, missing dual augmentation | Shift `-(a+b)` preserves interval; normalized complex through finite action quotient, not assumed whole-ring finiteness |
| 9.4 spectral support/action blocks | Nilpotent errors, scalar divisor, isolated Artinian factor, nonisolated prime | Quotient spectra and genuine module action separated; special block belongs to derived reduced object |
| 9.5 divisor length | DVR `π^s`, `O[ε]/ε²`, dimension zero, two-term cone | Positive coefficient `s`; nonreduced generic length two; Euler sign coker minus kernel |
| 9.6 paired support transport | Free stalk, reducible x-disk, two top components, zero seed, lower component at equality | Local seed sufficient; strict smaller-component bounds and common residual action image retained; top support versus full support separated |
| 9.7 specialized survival | Positive free stalk, augmented x-disk, rationally acyclic π-disk, balanced residual pair | Survival not concentration; highest localized cohomology/right-edge Nakayama with derived equivariance |

The retained Lean statements were also checked against their actual variable/typeclass blocks:

| Lean statements or examples | Truth/generality check |
|---|---|
| `SmallExtension`, square-zero theorem, three extension examples | Local surjection, nonzero principal socle kernel; identity false, `Z/4→Z/2` true, `Z/8→Z/2` false; local instances are explicit where absent at the pin |
| `hilbertSamuelFunction`, three HS milestones and zero/field/integer examples | `I≤m`, finite initial quotient, Noetherian finite module; `n+1` quotient exponent; nonzero only for degree and positivity; `Z/(2^(n+1))` length `n+1` |
| `multiplicityCoefficient` and four polynomial examples | Raw rational extraction for arbitrary polynomial; degree zero returns five, quadratic factorial restores one, lower-degree and zero coefficients return zero |
| `moduleDepth`, AB, regular local pd bound and three depth examples | Actual weak-regular lists in `m`; zero depth is infinity, field and `Z/4` depth zero; AB excludes zero and infinite pd |
| `traceIdeal`, split-summand theorem and three examples | Definition for arbitrary module, theorem finite local; regular module trace one, zero and `Z/2` over `Z` trace zero |
| `symbolicSquare`, membership and three examples | Arbitrary commutative ring/prime; native localization; zero prime domain and maximal prime tests; element outside prime cannot lie in square |
| `matlis_finite_bidouble` | Complete Noetherian local, native injective envelope and finite module; explicit canonical evaluation formula rather than arbitrary isomorphism |
| Four jet arithmetic examples | Order four at `N=0,1,2` gives `1,3,6`; extrapolated linear polynomial at zero gives `-2`, detecting premature equality |
| Four Layer 4 theorems | Complete source/Noetherian local target for fibre criterion; finite faithful action over Noetherian base; finite local DVR algebra for dimension; char-zero fraction field ensures finite separable normalization, valued comparison not assumed |
| `HasSquarePresentation`, comparison and three examples | Raw predicate generalized to any ring/left module; commutative local Noetherian scope retained for comparison; free, principal quotient and zero all square-presented |
| `NearlyFaithful`, support equivalence, reduced quotient and five examples | Nil containment for arbitrary rings; finite Noetherian hypothesis for support equivalence; quotient theorem tied to actual action; `Q/Z` faithful but lacks generic support |
| `Der`, `Cpx`, `H`, `IsMinimal`, three-term theorem, field-minimal theorem and minimal examples | Native carriers; no hidden freeness in minimal predicate; finite free three-term source and actual `gf=0`; conclusion only at middle |
| `PerfectInterval` and four interval/support examples | Actual bounded finite projective native representative; zero fits any interval; stalk at `i` fits `[i,i]`, nonzero zero-degree stalk not `[1,1]`; degree-zero interval kills other cohomology |
| Five sign examples | Rational `+2/-2` chain equations and failed unsigned equation; cone shifted summand `-1`; `F₂` sign agreement is explicitly insufficient to detect the error |
| `finite_germ_equivalence` | Arbitrary ultrafilter, finite ring, constants fixed and selected-fibre equation; principal ultrafilter allowed, nonprincipality not silently assumed |
| `derivedSupport`, `cohomologyAnnihilator` and zero/stalk/sum examples | Native cohomology union and annihilator intersection for arbitrary derived objects; no finiteness assumed in these definitions; support of quotient stalk is `V(I)`, annihilator exactly `I` |
| Codimension inequality and balanced concentration | Nonzero derived object, regular local ring of finite dimension `n`, `l≤n`, actual `[a,a+l]` model; explicit support upper bound only in concentration theorem |

## Validation and next action

- `lean-check research/blueprint/packages/DeformationAndDerivedPatchingAlgebra/Suggested.lean` exited 0 at the pinned shared build. All 70 warnings are exactly `declaration uses sorry`; there are no other warnings or errors. Memory availability was checked and exceeded 20 GB. One Lean process at a time was used, no server or library build.
- The final submission validation is recorded in the pull request: `python3 research/blueprint/intake.py check-files` on exactly the four deliverables and `git diff --check`, plus file-scope, compact-shape, no-private-path and no-placeholder-data checks.
- Metadata is `topic = "math.AC"`. The README and Lean have no packet IDs or process catalogue. Scratch sources, inventories and logs are disposable; the mathematical findings needed by the next worker are recorded above and in the README.

The next action is independent package review, concentrating on the explicit source/proof contracts and corrected mathematical boundaries above. Nothing is claimed to be formalized. Do not extend this submission to a second issue.
